Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8CBC7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 14:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620DC10E6A2;
	Fri,  2 Jun 2023 14:27:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA89110E6A2;
 Fri,  2 Jun 2023 14:27:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C7ACAAADDD;
 Fri,  2 Jun 2023 14:27:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 02 Jun 2023 14:27:55 -0000
Message-ID: <168571607581.15700.1949022808565303449@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602142501.6-1-francois.dugast@intel.com>
In-Reply-To: <20230602142501.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Introduce_function_pointers_for_MMIO_functions?=
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

Series: drm/xe: Introduce function pointers for MMIO functions
URL   : https://patchwork.freedesktop.org/series/118783/
State : warning

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
commit ed3d084d45e2ea0d406c3bb09c1e10e450afc816
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jun 2 14:25:01 2023 +0000

    drm/xe: Introduce function pointers for MMIO functions
    
    A local structure of function pointers is used as a minimal hardware
    abstraction layer to prepare for platform independent MMIO calls.
    
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Cc: Ofir Bitton <ofir1.bitton@intel.com>
    Cc: Ohad Sharabi <ohadshar@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 9f49c413b187c00f223eaf1e8dbe2c1a97c9954b drm-intel
ed3d084d4 drm/xe: Introduce function pointers for MMIO functions
-:51: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#51: FILE: drivers/gpu/drm/xe/xe_mmio.c:43:
+static inline void xe_mmio_write32_device(struct xe_gt *gt,
+				   struct xe_reg reg, u32 val)

-:72: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#72: FILE: drivers/gpu/drm/xe/xe_mmio.c:64:
+static inline void xe_mmio_write64_device(struct xe_gt *gt,
+				   struct xe_reg reg, u64 val)

total: 0 errors, 0 warnings, 2 checks, 173 lines checked


