Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D396ECEACF9
	for <intel-xe@archiver.kernel.org>; Sat, 15 Nov 2025 00:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05810EBC2;
	Sat, 15 Nov 2025 00:23:23 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268B010EBA9;
 Sat, 15 Nov 2025 00:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_expose_PAT_soft?=
 =?utf-8?q?ware_table_via_debugfs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Nov 2025 00:23:23 -0000
Message-ID: <176316620315.56641.17272607946105411340@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114224055.242690-1-x.wang@intel.com>
In-Reply-To: <20251114224055.242690-1-x.wang@intel.com>
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

Series: drm/xe: expose PAT software table via debugfs (rev3)
URL   : https://patchwork.freedesktop.org/series/157558/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6904574765cf2cd5aa77bcb2f51688b6c1d402e2
Author: Xin Wang <x.wang@intel.com>
Date:   Fri Nov 14 22:40:55 2025 +0000

    drm/xe: expose PAT software table via debugfs
    
    The existing "pat" debugfs node dumps the live PAT registers. Under SR-IOV
    the VF cannot touch those registers, so the file vanishes and users lose
    all PAT visibility. Add a VF-safe "pat_sw_config" entry to the VF-safe
    debugfs list. It prints the cached PAT table the driver programmed, rather
    than poking HW, so PF and VF instances present the same view.
    
    This lets IGT and other tools query the PAT configuration without carrying
    platform-specific tables or mirroring kernel logic.
    
    v2: (Jonathan)
    - Only append "(* = reserved entry)" to the PAT table header on Xe2+
    platforms where it actually applies.
    - Deduplicate the PTA/ATS mode printing by introducing the small
    drm_printf_pat_mode() helper macro.
    
    v3: (Matt)
    - Print IDX[XE_CACHE_NONE_COMPRESSION] on every Xe2+ platform so the dump
    always reflects the value the driver might use (even if it defaults to 0)
    and future IP revisions don’t need extra condition tweaks.
    
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Xin Wang <x.wang@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 5edcc4403be062363cc220b7c5840bda1c14615f drm-intel
6904574765cf drm/xe: expose PAT software table via debugfs
-:54: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pat' - possible side-effects?
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:588:
+#define drm_printf_pat_mode(p, name, pat) \
+	{ \
+		drm_printf(p, name "= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", \
+		   !!(pat & XE2_NO_PROMOTE), \
+		   !!(pat & XE2_COMP_EN), \
+		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
+		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
+		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
+		   REG_FIELD_GET(XE2_COH_MODE, pat), \
+		   pat); \
+	}

-:54: CHECK:MACRO_ARG_PRECEDENCE: Macro argument 'pat' may be better as '(pat)' to avoid precedence issues
#54: FILE: drivers/gpu/drm/xe/xe_pat.c:588:
+#define drm_printf_pat_mode(p, name, pat) \
+	{ \
+		drm_printf(p, name "= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", \
+		   !!(pat & XE2_NO_PROMOTE), \
+		   !!(pat & XE2_COMP_EN), \
+		   REG_FIELD_GET(XE2_L3_CLOS, pat), \
+		   REG_FIELD_GET(XE2_L3_POLICY, pat), \
+		   REG_FIELD_GET(XE2_L4_POLICY, pat), \
+		   REG_FIELD_GET(XE2_COH_MODE, pat), \
+		   pat); \
+	}

total: 0 errors, 0 warnings, 2 checks, 104 lines checked


