Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9DEC61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 16:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E6A10E206;
	Fri, 24 Nov 2023 16:45:03 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63D6C10E206;
 Fri, 24 Nov 2023 16:44:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5F54BAADE8;
 Fri, 24 Nov 2023 16:44:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Fri, 24 Nov 2023 16:44:58 -0000
Message-ID: <170084429838.13024.5487134661326845982@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231108104953.152671-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231108104953.152671-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/i915=3A_Use_drm=5Fatomic=5Fhelper=5Fwait=5Ffor=5Ffences_helpe?=
 =?utf-8?q?r=2E?=
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

Series: drm/i915: Use drm_atomic_helper_wait_for_fences helper.
URL   : https://patchwork.freedesktop.org/series/126129/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d743532c71fb4e5e352d042f0c3236df4cd19df6
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Nov 8 11:49:53 2023 +0100

    drm/i915: Use drm_atomic_helper_wait_for_fences helper.
    
    The fence api specifies you should wait for fence to completion, not
    give up after whatever timeout was originally configured. The fences
    themselves should prevent the timeout from being indefinite.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 1832821c7e4c5bd24353183f060f1435b2eb7992 drm-intel
d743532c7 drm/i915: Use drm_atomic_helper_wait_for_fences helper.


