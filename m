Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDEBC2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 12:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AE910E869;
	Thu, 15 May 2025 12:16:13 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CBC10E863;
 Thu, 15 May 2025 12:16:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Fail_migrati?=
 =?utf-8?q?on_recovery_if_fixups_needed_but_platform_not_supported_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 12:16:12 -0000
Message-ID: <174731137229.84197.15944527805166591338@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515111229.815047-1-tomasz.lis@intel.com>
In-Reply-To: <20250515111229.815047-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev4)
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
commit 9f49aa75aa93167ff96ca1ba0dc702e682643d45
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Thu May 15 13:12:29 2025 +0200

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
    
    v2: Show the message during probe as well as during recovery; do not
      perform any recovery steps if the recovery is bound to fail
    v3: Use SRIOV-specific logging, fix typos
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch fbf1cb830ae7cca1f6094630da357a8418596a5b drm-intel
9f49aa75aa93 drm/xe/vf: Fail migration recovery if fixups needed but platform not supported


