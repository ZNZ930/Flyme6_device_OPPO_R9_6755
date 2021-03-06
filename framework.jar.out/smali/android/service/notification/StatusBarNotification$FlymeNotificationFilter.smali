.class public Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;
.super Ljava/lang/Object;
.source "StatusBarNotification.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/service/notification/StatusBarNotification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FlymeNotificationFilter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;",
            ">;"
        }
    .end annotation
.end field

.field public static NOTIFICATION_UNKNOW:Ljava/lang/String;


# instance fields
.field public category:Ljava/lang/String;

.field public categoryPriority:I

.field public extras:Landroid/os/Bundle;

.field public intercept:Z

.field public notificationPriority:I

.field public score:F

.field public score_scale:F

.field public shouldAffectIntercept:Z

.field public shouldAffectRanking:Z

.field public tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-string/jumbo v0, "unknow"

    sput-object v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->NOTIFICATION_UNKNOW:Ljava/lang/String;

    .line 96
    new-instance v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter$1;

    invoke-direct {v0}, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter$1;-><init>()V

    sput-object v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 50
    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    sget-object v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->NOTIFICATION_UNKNOW:Ljava/lang/String;

    iput-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    .line 52
    iput v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    .line 53
    iput v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    .line 56
    iput-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    .line 58
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    .line 60
    iput-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    .line 61
    iput-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    .line 76
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    sget-object v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->NOTIFICATION_UNKNOW:Ljava/lang/String;

    iput-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    .line 52
    iput v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    .line 53
    iput v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    .line 56
    iput-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    .line 58
    const/high16 v0, 0x42c80000    # 100.0f

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    .line 60
    iput-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    .line 61
    iput-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    .line 69
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    .line 63
    return-void

    :cond_0
    move v0, v2

    .line 69
    goto :goto_0

    :cond_1
    move v0, v2

    .line 72
    goto :goto_1

    :cond_2
    move v1, v2

    .line 73
    goto :goto_2
.end method


# virtual methods
.method public copy()Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;
    .locals 2

    .prologue
    .line 80
    new-instance v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;

    invoke-direct {v0}, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;-><init>()V

    .line 81
    .local v0, "filter":Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;
    iget-object v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    iput-object v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    .line 82
    iget v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    iput v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    .line 83
    iget v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    iput v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    .line 84
    iget-object v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    iput-object v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    .line 85
    iget-object v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 86
    iget-object v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    invoke-virtual {v1}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Bundle;

    iput-object v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    .line 88
    :cond_0
    iget-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    iput-boolean v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    .line 89
    iget v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    iput v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    .line 90
    iget v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    iput v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    .line 91
    iget-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    iput-boolean v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    .line 92
    iget-boolean v1, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    iput-boolean v1, v0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    .line 93
    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public isLowPriority()Z
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v4, -0x2

    .line 138
    iget v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    if-eq v2, v4, :cond_0

    .line 139
    iget v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    const/16 v3, -0x270f

    if-ne v2, v3, :cond_2

    .line 140
    iget v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    if-ne v2, v4, :cond_1

    .line 138
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 140
    goto :goto_0

    :cond_2
    move v0, v1

    .line 139
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 129
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string/jumbo v2, "category=%s;categoryPriority=%d,notificationPriority=%d;tag=%s;score=%f,score_scale=%f"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    .line 130
    iget-object v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget-object v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    iget v4, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x5

    aput-object v4, v3, v5

    .line 129
    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 131
    .local v0, "format":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ";extras=;intercept="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 132
    const-string/jumbo v2, ";shouldAffectRanking="

    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 132
    iget-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 133
    const-string/jumbo v2, ";shouldAffectIntercept="

    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 133
    iget-boolean v2, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    .line 131
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 134
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 115
    iget-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->category:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 116
    iget v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->categoryPriority:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 117
    iget v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->notificationPriority:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 118
    iget-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->extras:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 120
    iget-boolean v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->intercept:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 121
    iget v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 122
    iget v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->score_scale:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 123
    iget-boolean v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectRanking:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 124
    iget-boolean v0, p0, Landroid/service/notification/StatusBarNotification$FlymeNotificationFilter;->shouldAffectIntercept:Z

    if-eqz v0, :cond_2

    :goto_2
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 114
    return-void

    :cond_0
    move v0, v2

    .line 120
    goto :goto_0

    :cond_1
    move v0, v2

    .line 123
    goto :goto_1

    :cond_2
    move v1, v2

    .line 124
    goto :goto_2
.end method
