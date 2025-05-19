Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD56C3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22F810E45F;
	Mon, 19 May 2025 23:05:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D94310E45F;
 Mon, 19 May 2025 23:05:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Fail_migrati?=
 =?utf-8?q?on_recovery_if_fixups_needed_but_platform_not_supported_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 May 2025 23:05:55 -0000
Message-ID: <174769595503.1849.18230187846370210724@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519230035.3143966-1-tomasz.lis@intel.com>
In-Reply-To: <20250519230035.3143966-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Fail migration recovery if fixups needed but platform not supported (rev5)
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
commit d98b18b6ea5b5a7d865f9d20339294dd6152b684
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Tue May 20 01:00:35 2025 +0200

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
    v4: XE_DEBUG_SRIOV to XE_DEBUG check switch, to make testing more
      straightforward
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Acked-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 956a742459cff150a14f1d2f44b6294e646f208a drm-intel
d98b18b6ea5b drm/xe/vf: Fail migration recovery if fixups needed but platform not supported


