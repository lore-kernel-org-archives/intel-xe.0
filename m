Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47175EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 09:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2401210E052;
	Mon, 26 Jun 2023 09:22:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C38CD10E090;
 Mon, 26 Jun 2023 09:22:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C0B80AADE8;
 Mon, 26 Jun 2023 09:22:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jun 2023 09:22:03 -0000
Message-ID: <168777132378.5706.8349294306388747051@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626091317.83226-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230626091317.83226-1-zbigniew.kempczynski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Us?=
 =?utf-8?q?er_fence_wait_uAPI_change_to_nanoseconds_=28rev2=29?=
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

Series: User fence wait uAPI change to nanoseconds (rev2)
URL   : https://patchwork.freedesktop.org/series/119661/
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
commit e583018a10da07099db66f160d48dfe8e9842b8a
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Mon Jun 26 11:13:17 2023 +0200

    drm/xe: Use nanoseconds instead of jiffies in uapi for user fence
    
    Using jiffies as a timeout from userspace is weird even if
    theoretically exists possiblity of acquiring jiffies via getconf.
    Unfortunately this method is unreliable and the returned
    value may vary from the one configured in the kernel config.
    
    From now on timeout is expressed in nanoseconds and its interpretation
    depends on setting DRM_XE_UFENCE_WAIT_ABSTIME flag. Relative timeout
    (flag is not set) means fence expire at now() + timeout. Absolute
    timeout (flag is set) means that the fence expires at exact point
    of time.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch 76aec71c92f462efa45b365438a2c6f5417c2fec drm-intel
e583018a1 drm/xe: Use nanoseconds instead of jiffies in uapi for user fence


