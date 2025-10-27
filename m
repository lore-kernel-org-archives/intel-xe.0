Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD9CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 06:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7CA10E0CE;
	Mon, 27 Oct 2025 06:04:27 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EC010E0CE;
 Mon, 27 Oct 2025 06:04:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_CRI_support_in_?=
 =?utf-8?q?gt=5Fthrottle_+_refactors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Oct 2025 06:04:26 -0000
Message-ID: <176154506642.56453.8866932595811645243@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
In-Reply-To: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
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

Series: drm/xe: CRI support in gt_throttle + refactors (rev2)
URL   : https://patchwork.freedesktop.org/series/156437/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 518e6112a32408998b8e7d9e62fe8c90bc46d747
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Sun Oct 26 22:57:20 2025 -0700

    drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
    
    It's currently not possible to safely monitor if there's throttling
    happening and what are the reasons. The approach of reading the status
    and then reading the reasons is not reliable as by the time sysadmin
    reads the reason, the throttling could not be happening anymore.
    
    Previous tentative to fix that[1] was breaking the ABI and potentially
    sysadmin's scripts. This takes a different approach of adding and
    documenting the additional attribute. It's still valuable, though
    redundant, to provide the simpler 0/1 interface.
    
    In order to avoid userspace knowledge on the bitmask meaning and to be
    able to maintain the kernel side in sync with possible changes in
    future, just walk the attribute group and check what are the masks that
    match the value read.
    
    [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
    
    Cc: Raag Jadav <raag.jadav@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c03916cb446b6eefe91538599775bb54bf98238c drm-intel
ed47bf0f340b drm/xe/cri: Add new performance limit reasons bits
-:204: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#204: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:278:
+}
+static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);

-:222: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#222: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:322:
+}
+static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);

-:240: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#240: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:344:
+}
+static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);

-:251: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#251: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:355:
+}
+static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);

-:262: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#262: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:366:
+}
+static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);

-:273: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#273: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:377:
+}
+static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);

-:284: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#284: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:388:
+}
+static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);

-:295: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#295: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:399:
+}
+static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);

-:306: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#306: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:410:
+}
+static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);

-:317: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#317: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:421:
+}
+static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);

total: 0 errors, 0 warnings, 10 checks, 354 lines checked
596215eac759 drm/xe/gt_throttle: Tidy up perf reasons reading
3112c5a24b89 drm/xe/gt_throttle: Always read and mask
137c111dcbb7 drm/xe/gt_throttle: Add throttle_to_gt()
90c45b3abb40 drm/xe/gt_throttle: Tidy up attribute definition
e34179d2e1fa drm/xe: Improve freq and throttle documentation
6eb187106e7a drm/xe/gt_throttle: Drop individual show functions
518e6112a324 drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

total: 0 errors, 1 warnings, 0 checks, 84 lines checked


