Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B2CEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 05:57:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAD910E07B;
	Fri, 16 Jun 2023 05:57:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFA9310E59D;
 Fri, 16 Jun 2023 05:57:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CC9D5AADD5;
 Fri, 16 Jun 2023 05:57:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 16 Jun 2023 05:57:18 -0000
Message-ID: <168689503883.9826.13133545574784284339@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230616053727.134130-1-zbigniew.kempczynski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Use_nanoseconds_instead_of_jiffies_in_uapi_for_user_fen?=
 =?utf-8?b?Y2UgKHJldjMp?=
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Use nanoseconds instead of jiffies in uapi for user fence (rev3)
URL   : https://patchwork.freedesktop.org/series/118670/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9cd3474904d3fdddfd2c00cfe74b5a606321203a
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Fri Jun 16 07:37:27 2023 +0200

    drm/xe: Use nanoseconds instead of jiffies in uapi for user fence
    
    Using jiffies as a timeout from userspace is weird even it theoretically
    exists possiblity of acquiring jiffies via getconf. Unfortunately this
    method is unreliable and returned value may vary from configured in the
    kernel config.
    
    From now on timeout is expressed in nanoseconds and its interpretation
    depends on setting DRM_XE_UFENCE_WAIT_ABSTIME flag. Relative timeout
    (flag is not set) means fence expire at now() + timeout. Absolute
    timeout (flag is set) means fence will expire at exact point of time.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch 293e40ed72cf5a9cf97438455bb8172fa260c7eb drm-intel
9cd347490 drm/xe: Use nanoseconds instead of jiffies in uapi for user fence


