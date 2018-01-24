.class public Lcom/android/internal/telephony/MT6755;
.super Lcom/android/internal/telephony/RIL;
.source "MT6755.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# static fields
.field private static final REFRESH_SESSION_RESET:I = 0x6

.field private static final RIL_REQUEST_EMERGENCY_DIAL:I = 0x827

.field private static final RIL_REQUEST_MODEM_POWEROFF:I = 0x7da

.field private static final RIL_REQUEST_MODEM_POWERON:I = 0x7ec

.field private static final RIL_REQUEST_RESUME_REGISTRATION:I = 0x811

.field private static final RIL_REQUEST_SET_CALL_INDICATION:I = 0x826

.field private static final RIL_REQUEST_SET_ECC_LIST:I = 0x829

.field private static final RIL_REQUEST_SET_ECC_SERVICE_CATEGORY:I = 0x828

.field private static final RIL_UNSOL_CALL_INFO_INDICATION:I = 0xbe9

.field private static final RIL_UNSOL_INCOMING_CALL_INDICATION:I = 0xbe2

.field private static final RIL_UNSOL_RESPONSE_PS_NETWORK_STATE_CHANGED:I = 0xbc7

.field private static final RIL_UNSOL_RESPONSE_REGISTRATION_SUSPENDED:I = 0xbd0

.field private static final RIL_UNSOL_SET_ATTACH_APN:I = 0xc01


# instance fields
.field private dataCallCids:[I

.field private mContext:Landroid/content/Context;

.field private mEccList:Lcom/android/internal/telephony/MtkEccList;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    const/4 v1, -0x1

    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 61
    filled-new-array {v1, v1, v1, v1, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    const/4 v0, -0x1

    .line 73
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 61
    filled-new-array {v0, v0, v0, v0, v0}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    .line 74
    iput-object p1, p0, Lcom/android/internal/telephony/MT6755;->mContext:Landroid/content/Context;

    .line 75
    const-string/jumbo v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/android/internal/telephony/MT6755;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 76
    new-instance v0, Lcom/android/internal/telephony/MtkEccList;

    invoke-direct {v0}, Lcom/android/internal/telephony/MtkEccList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/MT6755;->mEccList:Lcom/android/internal/telephony/MtkEccList;

    .line 72
    return-void
.end method

.method private fetchCidFromDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 491
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;

    .line 493
    .local v1, "ret":Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    iget v2, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    if-ltz v2, :cond_0

    .line 494
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    .line 495
    iget-object v2, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    aget v2, v2, v0

    if-gez v2, :cond_1

    .line 496
    iget-object v2, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    iget v3, v1, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    aput v3, v2, v0

    .line 501
    .end local v0    # "i":I
    :cond_0
    return-object v1

    .line 494
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private fixupPSBearerDataRegistration(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v3, 0x3

    .line 477
    invoke-virtual {p1}, Landroid/os/Parcel;->readStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 479
    .local v0, "response":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x4

    if-lt v1, v2, :cond_0

    .line 480
    aget-object v1, v0, v3

    if-eqz v1, :cond_0

    .line 481
    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/16 v2, 0x80

    if-lt v1, v2, :cond_0

    .line 483
    const-string/jumbo v1, "15"

    aput-object v1, v0, v3

    .line 486
    :cond_0
    return-object v0
.end method

.method private static localRequestToString(I)Ljava/lang/String;
    .locals 1
    .param p0, "request"    # I

    .prologue
    .line 82
    sparse-switch p0, :sswitch_data_0

    .line 90
    const-string/jumbo v0, "<unknown response>"

    return-object v0

    .line 83
    :sswitch_0
    const-string/jumbo v0, "RIL_REQUEST_RESUME_REGISTRATION"

    return-object v0

    .line 84
    :sswitch_1
    const-string/jumbo v0, "RIL_REQUEST_SET_CALL_INDICATION"

    return-object v0

    .line 85
    :sswitch_2
    const-string/jumbo v0, "RIL_REQUEST_EMERGENCY_DIAL"

    return-object v0

    .line 86
    :sswitch_3
    const-string/jumbo v0, "RIL_REQUEST_SET_ECC_SERVICE_CATEGORY"

    return-object v0

    .line 87
    :sswitch_4
    const-string/jumbo v0, "RIL_REQUEST_SET_ECC_LIST"

    return-object v0

    .line 88
    :sswitch_5
    const-string/jumbo v0, "RIL_REQUEST_MODEM_POWEROFF"

    return-object v0

    .line 89
    :sswitch_6
    const-string/jumbo v0, "RIL_REQUEST_MODEM_POWERON"

    return-object v0

    .line 82
    nop

    :sswitch_data_0
    .sparse-switch
        0x7da -> :sswitch_5
        0x7ec -> :sswitch_6
        0x811 -> :sswitch_0
        0x826 -> :sswitch_1
        0x827 -> :sswitch_2
        0x828 -> :sswitch_3
        0x829 -> :sswitch_4
    .end sparse-switch
.end method

.method private refreshEmergencyList()V
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lcom/android/internal/telephony/MT6755;->mEccList:Lcom/android/internal/telephony/MtkEccList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/MT6755;->mEccList:Lcom/android/internal/telephony/MtkEccList;

    invoke-static {}, Lcom/android/internal/telephony/MtkEccList;->updateEmergencyNumbersProperty()V

    .line 360
    :cond_0
    return-void
.end method


# virtual methods
.method public deactivateDataCall(IILandroid/os/Message;)V
    .locals 3
    .param p1, "cid"    # I
    .param p2, "reason"    # I
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 311
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 312
    iget-object v1, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 313
    iget-object v1, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    const/4 v2, -0x1

    aput v2, v1, v0

    .line 317
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->deactivateDataCall(IILandroid/os/Message;)V

    .line 310
    return-void

    .line 311
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 6
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "clirMode"    # I
    .param p3, "uusInfo"    # Lcom/android/internal/telephony/UUSInfo;
    .param p4, "result"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 323
    iget-object v2, p0, Lcom/android/internal/telephony/MT6755;->mEccList:Lcom/android/internal/telephony/MtkEccList;

    invoke-static {p1}, Lcom/android/internal/telephony/MtkEccList;->isEmergencyNumberExt(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 324
    iget-object v2, p0, Lcom/android/internal/telephony/MT6755;->mEccList:Lcom/android/internal/telephony/MtkEccList;

    invoke-static {p1}, Lcom/android/internal/telephony/MtkEccList;->getServiceCategoryFromEcc(Ljava/lang/String;)I

    move-result v1

    .line 326
    .local v1, "serviceCategory":I
    const/16 v2, 0x828

    invoke-static {v2, v3}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 328
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 329
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 331
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MT6755;->localRequestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 332
    const-string/jumbo v3, " "

    .line 331
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 334
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 337
    const/16 v2, 0x827

    invoke-static {v2, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 338
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 339
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 340
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 342
    if-nez p3, :cond_0

    .line 343
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 351
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MT6755;->localRequestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 353
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 322
    .end local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    .end local v1    # "serviceCategory":I
    :goto_1
    return-void

    .line 345
    .restart local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    .restart local v1    # "serviceCategory":I
    :cond_0
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 346
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 347
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 348
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0

    .line 356
    .end local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    .end local v1    # "serviceCategory":I
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;->dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V

    goto :goto_1
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 10
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v9, 0x0

    .line 397
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 398
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 399
    .local v4, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 401
    .local v1, "error":I
    const/4 v3, 0x0

    .line 404
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v8, p0, Lcom/android/internal/telephony/MT6755;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v8

    .line 405
    :try_start_0
    iget-object v7, p0, Lcom/android/internal/telephony/MT6755;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v7, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/internal/telephony/RILRequest;

    .line 406
    .local v6, "tr":Lcom/android/internal/telephony/RILRequest;
    if-eqz v6, :cond_1

    iget v7, v6, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    if-ne v7, v4, :cond_1

    .line 407
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    if-lez v7, :cond_1

    .line 408
    :cond_0
    :try_start_1
    iget v7, v6, Lcom/android/internal/telephony/RILRequest;->mRequest:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sparse-switch v7, :sswitch_data_0

    .end local v3    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_1
    :goto_0
    monitor-exit v8

    .line 431
    if-nez v3, :cond_3

    .line 433
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 436
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v7

    return-object v7

    .line 415
    .restart local v3    # "rr":Lcom/android/internal/telephony/RILRequest;
    :sswitch_0
    move-object v3, v6

    .line 416
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    goto :goto_0

    .line 418
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    :sswitch_1
    :try_start_2
    invoke-direct {p0}, Lcom/android/internal/telephony/MT6755;->refreshEmergencyList()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 419
    :catch_0
    move-exception v5

    .line 421
    .local v5, "thr":Ljava/lang/Throwable;
    :try_start_3
    iget-object v7, v6, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v7, :cond_2

    .line 422
    iget-object v7, v6, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    const/4 v9, 0x0

    invoke-static {v7, v9, v5}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 423
    iget-object v7, v6, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_2
    monitor-exit v8

    .line 425
    return-object v6

    .line 404
    .end local v5    # "thr":Ljava/lang/Throwable;
    .end local v6    # "tr":Lcom/android/internal/telephony/RILRequest;
    :catchall_0
    move-exception v7

    monitor-exit v8

    throw v7

    .line 440
    .end local v3    # "rr":Lcom/android/internal/telephony/RILRequest;
    .restart local v6    # "tr":Lcom/android/internal/telephony/RILRequest;
    :cond_3
    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/MT6755;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 442
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    if-nez v3, :cond_4

    .line 443
    return-object v3

    .line 446
    :cond_4
    const/4 v2, 0x0

    .line 448
    .local v2, "ret":Ljava/lang/Object;
    if-eqz v1, :cond_5

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v7

    if-lez v7, :cond_6

    .line 449
    :cond_5
    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v7, :sswitch_data_1

    .line 456
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Shouldn\'t be here: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 450
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 461
    .end local v2    # "ret":Ljava/lang/Object;
    :cond_6
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "< "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8}, Lcom/android/internal/telephony/MT6755;->requestToString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 462
    const-string/jumbo v8, " "

    .line 461
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 462
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v8, v2}, Lcom/android/internal/telephony/MT6755;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 461
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 464
    iget-object v7, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v7, :cond_7

    .line 465
    iget-object v7, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v7, v2, v9}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 466
    iget-object v7, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    .line 469
    :cond_7
    return-object v3

    .line 451
    .restart local v2    # "ret":Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 452
    :sswitch_4
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MT6755;->fixupPSBearerDataRegistration(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 453
    :sswitch_5
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MT6755;->fetchCidFromDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1

    .line 454
    :sswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    iget-object v7, p0, Lcom/android/internal/telephony/MT6755;->mVoiceNetworkStateRegistrants:Landroid/os/RegistrantList;

    new-instance v8, Landroid/os/AsyncResult;

    invoke-direct {v8, v9, v9, v9}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v7, v8}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_1

    .line 408
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x15 -> :sswitch_0
        0x1b -> :sswitch_0
        0x7b -> :sswitch_0
        0x827 -> :sswitch_0
        0x828 -> :sswitch_0
    .end sparse-switch

    .line 449
    :sswitch_data_1
    .sparse-switch
        0x15 -> :sswitch_4
        0x1b -> :sswitch_5
        0x7b -> :sswitch_6
        0x827 -> :sswitch_2
        0x828 -> :sswitch_3
    .end sparse-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 8
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v5, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 100
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 102
    .local v2, "response":I
    sparse-switch v2, :sswitch_data_0

    .line 111
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 113
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 114
    return-void

    .line 103
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseRegSuspended(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .line 116
    .local v3, "ret":Ljava/lang/Object;
    :goto_0
    sparse-switch v2, :sswitch_data_1

    .line 97
    .end local v3    # "ret":Ljava/lang/Object;
    :cond_0
    :goto_1
    return-void

    .line 104
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseIncomingCallIndication(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 105
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseCallProgress(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 106
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseSetAttachApn(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 107
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 108
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MT6755;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_0

    .line 118
    :sswitch_6
    iget-object v4, p0, Lcom/android/internal/telephony/MT6755;->mCallStateRegistrants:Landroid/os/RegistrantList;

    .line 119
    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v6, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 118
    invoke-virtual {v4, v5}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_1

    .line 122
    :sswitch_7
    if-nez v3, :cond_0

    .line 123
    iget-object v4, p0, Lcom/android/internal/telephony/MT6755;->mCallStateRegistrants:Landroid/os/RegistrantList;

    .line 124
    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v6, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 123
    invoke-virtual {v4, v5}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_1

    :sswitch_8
    move-object v1, v3

    .line 128
    check-cast v1, [Ljava/lang/String;

    .line 130
    .local v1, "resp":[Ljava/lang/String;
    array-length v4, v1

    if-ge v4, v5, :cond_1

    .line 131
    new-array v1, v5, [Ljava/lang/String;

    .line 132
    check-cast v3, [Ljava/lang/String;

    .end local v3    # "ret":Ljava/lang/Object;
    aget-object v4, v3, v7

    aput-object v4, v1, v7

    .line 133
    const/4 v4, 0x1

    aput-object v6, v1, v4

    .line 135
    :cond_1
    aget-object v4, v1, v7

    if-eqz v4, :cond_2

    .line 136
    aget-object v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-lt v4, v5, :cond_2

    .line 137
    aget-object v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x5

    if-gt v4, v5, :cond_2

    .line 139
    const-string/jumbo v4, "0"

    aput-object v4, v1, v7

    .line 142
    :cond_2
    aget-object v4, v1, v7

    invoke-virtual {p0, v2, v4}, Lcom/android/internal/telephony/MT6755;->unsljLogMore(ILjava/lang/String;)V

    .line 143
    iget-object v4, p0, Lcom/android/internal/telephony/MT6755;->mUSSDRegistrant:Landroid/os/Registrant;

    if-eqz v4, :cond_0

    .line 144
    iget-object v4, p0, Lcom/android/internal/telephony/MT6755;->mUSSDRegistrant:Landroid/os/Registrant;

    .line 145
    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v1, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 144
    invoke-virtual {v4, v5}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto :goto_1

    .line 149
    .end local v1    # "resp":[Ljava/lang/String;
    .restart local v3    # "ret":Ljava/lang/Object;
    :sswitch_9
    check-cast v3, [I

    .end local v3    # "ret":Ljava/lang/Object;
    aget v4, v3, v7

    const/4 v5, 0x4

    if-eq v4, v5, :cond_0

    .line 150
    iget-object v4, p0, Lcom/android/internal/telephony/MT6755;->mVoiceNetworkStateRegistrants:Landroid/os/RegistrantList;

    .line 151
    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v6, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 150
    invoke-virtual {v4, v5}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_1

    .line 102
    :sswitch_data_0
    .sparse-switch
        0x3ee -> :sswitch_4
        0xbc7 -> :sswitch_5
        0xbd0 -> :sswitch_0
        0xbe2 -> :sswitch_1
        0xbe9 -> :sswitch_2
        0xc01 -> :sswitch_3
    .end sparse-switch

    .line 116
    :sswitch_data_1
    .sparse-switch
        0x3ee -> :sswitch_8
        0xbc7 -> :sswitch_9
        0xbe2 -> :sswitch_6
        0xbe9 -> :sswitch_7
    .end sparse-switch
.end method

.method protected responseCallProgress(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 207
    invoke-virtual {p1}, Landroid/os/Parcel;->readStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 209
    .local v0, "response":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 210
    const/4 v1, 0x1

    aget-object v1, v0, v1

    const-string/jumbo v2, "129"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    const/4 v1, 0x0

    return-object v1

    .line 214
    :cond_0
    return-object v0
.end method

.method protected responseIncomingCallIndication(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 5
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v4, 0x3

    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readStringArray()[Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "response":[Ljava/lang/String;
    const/16 v2, 0x826

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 192
    .local v1, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MT6755;->localRequestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 194
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 195
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    aget-object v3, v0, v4

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 196
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v3, 0x0

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 197
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v3, 0x4

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 198
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 200
    return-object v0
.end method

.method protected responseRegSuspended(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 7
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v6, 0x0

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 165
    .local v1, "numInts":I
    new-array v2, v1, [I

    .line 167
    .local v2, "response":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v2, v0

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 171
    :cond_0
    const/16 v4, 0x811

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 173
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v5}, Lcom/android/internal/telephony/MT6755;->localRequestToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 174
    const-string/jumbo v5, " sessionId "

    .line 173
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 174
    aget v5, v2, v6

    .line 173
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 176
    iget-object v4, v3, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 177
    iget-object v4, v3, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    aget v5, v2, v6

    invoke-virtual {v4, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 179
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 181
    return-object v2
.end method

.method protected responseSetAttachApn(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 7
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v6, 0x0

    .line 247
    const-string/jumbo v1, ""

    const-string/jumbo v2, ""

    const-string/jumbo v4, ""

    const-string/jumbo v5, ""

    const/4 v3, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/MT6755;->setInitialAttachApn(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 248
    return-object v6
.end method

.method protected responseSimRefresh(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 5
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v4, 0x2

    .line 254
    new-instance v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;

    invoke-direct {v1}, Lcom/android/internal/telephony/uicc/IccRefreshResponse;-><init>()V

    .line 256
    .local v1, "response":Lcom/android/internal/telephony/uicc/IccRefreshResponse;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    .line 257
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 258
    .local v0, "rawefId":Ljava/lang/String;
    if-nez v0, :cond_1

    const/4 v2, 0x0

    :goto_0
    iput v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->efId:I

    .line 259
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->aid:Ljava/lang/String;

    .line 261
    iget v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    if-le v2, v4, :cond_0

    .line 262
    iget v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_2

    .line 263
    iput v4, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    .line 269
    :cond_0
    :goto_1
    return-object v1

    .line 258
    :cond_1
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    goto :goto_0

    .line 265
    :cond_2
    const/4 v2, 0x1

    iput v2, v1, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    goto :goto_1
.end method

.method public setInitialAttachApn(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 5
    .param p1, "apn"    # Ljava/lang/String;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "authType"    # I
    .param p4, "username"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "result"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x0

    .line 220
    const/16 v2, 0x6f

    invoke-static {v2, v4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 222
    .local v1, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v2, p0, Lcom/android/internal/telephony/MT6755;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v3, p0, Lcom/android/internal/telephony/MT6755;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/telephony/TelephonyManager;->getSimOperatorNumericForPhone(I)Ljava/lang/String;

    move-result-object v0

    .line 223
    .local v0, "operatorNumber":Ljava/lang/String;
    const-string/jumbo v2, "Set RIL_REQUEST_SET_INITIAL_ATTACH_APN"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 225
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 226
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 227
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 228
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 229
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, p5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 231
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 232
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 233
    iget-object v2, v1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2, v4}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 235
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MT6755;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 236
    const-string/jumbo v3, ", apn:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 236
    const-string/jumbo v3, ", protocol:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 236
    const-string/jumbo v3, ", authType:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 237
    const-string/jumbo v3, ", username:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 237
    const-string/jumbo v3, ", password:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 237
    const-string/jumbo v3, ", operator:"

    .line 235
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 240
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 219
    return-void
.end method

.method public setRadioPower(ZLandroid/os/Message;)V
    .locals 6
    .param p1, "on"    # Z
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 367
    iget-object v3, p0, Lcom/android/internal/telephony/MT6755;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 368
    const-string/jumbo v4, "airplane_mode_on"

    const/4 v5, 0x0

    .line 367
    invoke-static {v3, v4, v5}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 368
    const/4 v4, 0x1

    .line 367
    if-ne v3, v4, :cond_1

    const/4 v0, 0x1

    .line 369
    .local v0, "isInApm":Z
    :goto_0
    const-string/jumbo v3, "persist.radio.airplane.mode.on"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "true"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 371
    .local v2, "wasInApm":Z
    const-string/jumbo v4, "persist.radio.airplane.mode.on"

    if-eqz v0, :cond_2

    const-string/jumbo v3, "true"

    :goto_1
    invoke-static {v4, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    if-eqz p1, :cond_0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_3

    .line 380
    :cond_0
    if-nez p1, :cond_4

    if-eqz v0, :cond_4

    .line 381
    const-string/jumbo v3, "gsm.ril.eboot"

    const-string/jumbo v4, "1"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    const/16 v3, 0x7da

    invoke-static {v3, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 384
    .local v1, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v4}, Lcom/android/internal/telephony/MT6755;->requestToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 386
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 366
    .end local v1    # "rr":Lcom/android/internal/telephony/RILRequest;
    :goto_2
    return-void

    .line 367
    .end local v0    # "isInApm":Z
    .end local v2    # "wasInApm":Z
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "isInApm":Z
    goto :goto_0

    .line 371
    .restart local v2    # "wasInApm":Z
    :cond_2
    const-string/jumbo v3, "false"

    goto :goto_1

    .line 374
    :cond_3
    const-string/jumbo v3, "gsm.ril.eboot"

    const-string/jumbo v4, "0"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    const/16 v3, 0x7ec

    invoke-static {v3, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    .line 377
    .restart local v1    # "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v4}, Lcom/android/internal/telephony/MT6755;->requestToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 379
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    goto :goto_2

    .line 388
    .end local v1    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_4
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->setRadioPower(ZLandroid/os/Message;)V

    goto :goto_2
.end method

.method public setupDataCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 6
    .param p1, "radioTechnology"    # Ljava/lang/String;
    .param p2, "profile"    # Ljava/lang/String;
    .param p3, "apn"    # Ljava/lang/String;
    .param p4, "user"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "authType"    # Ljava/lang/String;
    .param p7, "protocol"    # Ljava/lang/String;
    .param p8, "result"    # Landroid/os/Message;

    .prologue
    .line 277
    const/4 v1, 0x0

    .line 279
    .local v1, "interfaceId":I
    const/16 v3, 0x1b

    invoke-static {v3, p8}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 281
    .local v2, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 283
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 284
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 285
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 286
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 287
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 288
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 289
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, p7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 292
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v0, v3, :cond_0

    .line 293
    iget-object v3, p0, Lcom/android/internal/telephony/MT6755;->dataCallCids:[I

    aget v3, v3, v0

    if-gez v3, :cond_1

    .line 294
    add-int/lit8 v1, v0, 0x1

    .line 298
    :cond_0
    iget-object v3, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 300
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 301
    iget v4, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v4}, Lcom/android/internal/telephony/MT6755;->requestToString(I)Ljava/lang/String;

    move-result-object v4

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 301
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 301
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 302
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 302
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 302
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 303
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 303
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 303
    const-string/jumbo v4, " "

    .line 300
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/MT6755;->riljLog(Ljava/lang/String;)V

    .line 305
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MT6755;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 276
    return-void

    .line 292
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0
.end method
