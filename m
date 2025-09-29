Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE76CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7D10E4B2;
	Mon, 29 Sep 2025 21:49:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FBC10E4B1;
 Mon, 29 Sep 2025 21:49:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM=5FRAS_using?=
 =?utf-8?q?_generic_netlink_for_RAS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Sep 2025 21:49:55 -0000
Message-ID: <175918259529.376818.12938231885630196491@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
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

Series: Introduce DRM_RAS using generic netlink for RAS
URL   : https://patchwork.freedesktop.org/series/155188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9a50df0d133651a2c3f7cd1fff202e91948fb405
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Sep 29 17:44:14 2025 -0400

    drm/xe: Introduce the usage of drm_ras with supported HW errors
    
    All MTL+ devices supports these correctable and non-fatal error
    notification over the IRQ. None of current supported platforms
    support error counter directly in the HW.
    
    But since we are already supporting the error interrupt for
    these errors, let's incorporate the counter inside the driver
    itself and start using the drm_ras generic netlink to report them.
    
    Keep the CSC_work only for discrete devices.
    
    Cc: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 37c0ef53910744bfee93210a604832d5d454bc56 drm-intel
458ef6a646ce drm/ras: Introduce the DRM RAS infrastructure over generic netlink
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

-:794: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#794: FILE: drivers/gpu/drm/drm_ras_nl.c:13:
+static const struct nla_policy drm_ras_get_error_counters_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID + 1] = {

-:799: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#799: FILE: drivers/gpu/drm/drm_ras_nl.c:18:
+static const struct nla_policy drm_ras_query_error_counter_nl_policy[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID + 1] = {

total: 0 errors, 3 warnings, 0 checks, 904 lines checked
9a50df0d1336 drm/xe: Introduce the usage of drm_ras with supported HW errors


