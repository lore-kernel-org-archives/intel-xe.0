Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FE9C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 04:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C0410ED87;
	Wed,  1 Jul 2026 04:21:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADC110ED87;
 Wed,  1 Jul 2026 04:21:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=5Fads=3A_alloc?=
 =?utf-8?q?ate_UM_queues_in_a_separate_UC_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 04:21:14 -0000
Message-ID: <178287967453.135207.4825011395155600284@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701041459.2151262-1-jia.yao@intel.com>
In-Reply-To: <20260701041459.2151262-1-jia.yao@intel.com>
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

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO
URL   : https://patchwork.freedesktop.org/series/169535/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dff5360d754323a3488bb23b80927572645a2f8e
Author: Jia Yao <jia.yao@intel.com>
Date:   Wed Jul 1 04:14:59 2026 +0000

    drm/xe/guc_ads: allocate UM queues in a separate UC BO
    
    The GPU updates the HWQ tail pointer (non-posted, strongly ordered)
    before writing the fault descriptor data into the ring (posted WB,
    weakly ordered). If the ADS BO uses WB caching, GuC may read the ring
    slot before the GPU write reaches system memory, resulting in an
    all-zero descriptor being forwarded to the driver.
    
    Allocate the UM queues (HW fault ring) in a dedicated UC-mapped BO
    (ads->um_queue_bo) so that GPU writes bypass the L3 cache and are
    immediately visible in DRAM. Keeping the UM queues separate avoids
    making the Golden LRC region uncached, which would regress context
    restore performance.
    
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Jia Yao <jia.yao@intel.com>
+ /mt/dim checkpatch 7100870965845da8c31005c07fd1b390bbe96b20 drm-intel
dff5360d7543 drm/xe/guc_ads: allocate UM queues in a separate UC BO
-:101: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#101: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:408:
+		bo = xe_managed_bo_create_pin_map(xe, tile,
+					  GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX,

total: 0 errors, 0 warnings, 1 checks, 124 lines checked


