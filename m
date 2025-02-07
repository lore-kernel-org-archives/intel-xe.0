Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB804C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 11:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6D610EAEE;
	Fri,  7 Feb 2025 11:38:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F00410EAE4;
 Fri,  7 Feb 2025 11:37:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pch=3A_small_cle?=
 =?utf-8?q?anups=2C_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 11:37:01 -0000
Message-ID: <173892822164.2608308.4557955930456913337@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738923308.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738923308.git.jani.nikula@intel.com>
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

Series: drm/i915/pch: small cleanups, refactors
URL   : https://patchwork.freedesktop.org/series/144488/
State : warning

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
commit 6dcc443b0414856340620e927b72278886f6e256
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 7 12:17:38 2025 +0200

    drm/i915/pch: Remove unused i915->pch_id
    
    With the PCH checks based on PCH types instead of IDs, the i915->pch_id
    member has become unused. Remove it.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch a05904055d959d068edd472132e9e4939888832d drm-intel
3f483fc593e7 drm/i915/pch: Make LPT LP a dedicated PCH type
-:92: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dev_priv' - possible side-effects?
#92: FILE: drivers/gpu/drm/i915/soc/intel_pch.h:78:
+#define HAS_PCH_LPT(dev_priv)			(INTEL_PCH_TYPE(dev_priv) == PCH_LPT_H || \
+						 INTEL_PCH_TYPE(dev_priv) == PCH_LPT_LP)

total: 0 errors, 0 warnings, 1 checks, 66 lines checked
bf92655e4762 drm/i915/pch: Hide PCH device IDs
6dcc443b0414 drm/i915/pch: Remove unused i915->pch_id


