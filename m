Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2426AC3ABC5
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 05:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC8710E1A0;
	Wed, 14 May 2025 05:28:56 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D29C10E1A0;
 Wed, 14 May 2025 05:28:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Fail_migrati?=
 =?utf-8?q?on_recovery_if_fixups_needed_but_platform_not_supported_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 05:28:55 -0000
Message-ID: <174720053537.77154.4855247765365659658@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512230614.571026-1-tomasz.lis@intel.com>
In-Reply-To: <20250512230614.571026-1-tomasz.lis@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev2)
URL   : https://patchwork.freedesktop.org/series/148914/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 777672cdf6eeb31888e04e44dc952fffc6c881a4
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Tue May 13 01:06:14 2025 +0200

    drm/xe/vf: Fail migration recovery if fixups needed but platform not supported
    
    The post-migration recovery needs to be fully implemented for a
    specific platform in order to make continuation of workloads
    possible.
    
    New platforms introduce changes which affect the recovery procedure,
    and without a clear verification of support this leads to errors
    with no straight forward error message explaining the cause.
    
    This patch fixes that issue - it introduces a message to be logged
    when the current driver is known to not support the current platform.
    
    Wedging the driver immediately also decreases the amount of
    additional errors which would come afterwards if the driver continued
    operation.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch dac27c03b365c9da3d8af23f7067f7f4e5a74297 drm-intel
777672cdf6ee drm/xe/vf: Fail migration recovery if fixups needed but platform not supported


