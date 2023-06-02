Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC93C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 11:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16F310E666;
	Fri,  2 Jun 2023 11:22:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C36C910E664;
 Fri,  2 Jun 2023 11:22:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BFAB1AADEA;
 Fri,  2 Jun 2023 11:22:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 02 Jun 2023 11:22:45 -0000
Message-ID: <168570496578.15699.4920036843024786089@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230602104747.72015-1-zbigniew.kempczynski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Use_nanoseconds_instead_of_jiffies_in_uapi_for_user_fen?=
 =?utf-8?b?Y2UgKHJldjIp?=
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

Series: drm/xe: Use nanoseconds instead of jiffies in uapi for user fence (rev2)
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
commit 2ae113e1499be557e1b09c27bcc61ffcd6570c4b
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Fri Jun 2 12:47:47 2023 +0200

    drm/xe: Use nanoseconds instead of jiffies in uapi for user fence
    
    Using jiffies as a timeout from userspace is weird even it theoretically
    exists possiblity of acquiring jiffies via getconf. Unfortunately this
    method is unreliable and returned value may vary from configured in the
    kernel config.
    
    Change alters timeout to be expected in nanoseconds returning remaining
    timeout for relative and keeping absolute timeout intact.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch 9f49c413b187c00f223eaf1e8dbe2c1a97c9954b drm-intel
2ae113e14 drm/xe: Use nanoseconds instead of jiffies in uapi for user fence


