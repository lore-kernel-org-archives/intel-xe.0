Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48515C5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 01:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB79010E9DE;
	Thu,  5 Jun 2025 01:27:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F8710E9DC;
 Thu,  5 Jun 2025 01:27:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_GuC_opt-in_feature?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 01:27:38 -0000
Message-ID: <174908685815.49780.5245324309813047674@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250604002454.743404-4-daniele.ceraolospurio@intel.com>
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

Series: Enable GuC opt-in features (rev2)
URL   : https://patchwork.freedesktop.org/series/149815/
State : warning

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
commit 9cdfb247a29ef349373f14eccdfae4f9aed2993b
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Jun 3 17:24:57 2025 -0700

    drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
    
    The Dynamic Inhibit Context Switch is an optimization aimed at reducing
    the amount of time the HW is stuck waiting on an unsatisfied semaphore.
    When this optimization is enabled, the GuC will dynamically modify the
    CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
    LRCs to enable immediate switching out on an unsatisfied semaphore wait
    when multiple contexts are competing for time on the same engine.
    
    This feature is available on recent HW from GuC 70.40.1 onwards and it
    is enabled via a per-VF feature opt-in.
    
    v2: rebase
    v3: switch to using guc_buf_cache instead of dedicated alloc
    v4: add helper to check for feature availability (Michal), don't enable
    if multi-lrc is possible.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 9becf23dcd5721a2ddb80f01d4964a1657117f11 drm-intel
da860a935702 drm/xe/guc: Enable extended CAT error reporting
-:120: WARNING:LINE_SPACING: Missing a blank line after declarations
#120: FILE: drivers/gpu/drm/xe/xe_guc.c:590:
+	struct xe_device *xe = guc_to_xe(guc);
+	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);

total: 0 errors, 1 warnings, 0 checks, 165 lines checked
9cdfb247a29e drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
-:97: CHECK:LINE_SPACING: Please don't use multiple blank lines
#97: FILE: drivers/gpu/drm/xe/xe_guc.c:636:
 
+

total: 0 errors, 0 warnings, 1 checks, 66 lines checked


