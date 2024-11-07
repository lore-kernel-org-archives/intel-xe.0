Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26924D4336F
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 15:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E520F10E27C;
	Thu,  7 Nov 2024 15:20:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DBE810E876;
 Thu,  7 Nov 2024 15:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery=2C_remove_MMIO_assert?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 15:20:17 -0000
Message-ID: <173099281757.1422803.550835402115116125@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
In-Reply-To: <20241107151357.1623733-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery, remove MMIO assert
URL   : https://patchwork.freedesktop.org/series/141058/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit da9d73312174d868b163e768dd9c8e50c3fdb2f8
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Thu Nov 7 16:13:57 2024 +0100

    drm/xe/guc: Do not assert CTB state while sending MMIO
    
    During VF post-migration recovery, MMIO communication channel to GuC
    is used, despite CTB channel being enabled. This behavior is rooted
    in the save-restore architecture specification.
    
    Therefore, a VF driver cannot assert that CTB is disabled while sending
    MMIO messages to GuC. Such assertion needs to be PF only, or be removed.
    
    This patch simply removes the assertion.
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Suggested-by: Michał Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch ac4e52a591ed566ed065b0abdb6b2cce5f9b3afa drm-intel
da9d73312174 drm/xe/guc: Do not assert CTB state while sending MMIO


