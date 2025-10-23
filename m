Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91D1CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 19:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C7710E12E;
	Thu, 23 Oct 2025 19:29:53 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524910E128;
 Thu, 23 Oct 2025 19:29:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_CRI_support_in_?=
 =?utf-8?q?gt=5Fthrottle_+_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 19:29:51 -0000
Message-ID: <176124779153.47613.9180823157046630480@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
In-Reply-To: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
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

Series: drm/xe: CRI support in gt_throttle + refactors
URL   : https://patchwork.freedesktop.org/series/156437/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1e49ab4f2edc41f5f190d24f5d92dbe9043afb17
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Oct 23 09:56:58 2025 -0700

    drm/xe/gt_throttle: Tidy up attribute definition
    
    Move the attribute definitions to be grouped together rather than near
    the show() function: checkpatch keeps complaining about the missing
    newline when defining new attributes and it reads better to group
    everything, which should match e.g. the xe_pmu.c style.
    
    While grouping them, also define a THROTTLE_ATTR_RO(), similar to
    DEVICE_ATTR_RO(), and use it to define all attributes. This makes it
    shorter and with a familiar syntax.
    
    Finally, during the cri_throttle_attrs[] array definition, also
    highlight what's coming from common attributes and what is CRI-specific.
    
    These 3 things could be done as separate commits, but they are all about
    the same thing: reduce the attribute definition verbosity and are very
    simple and mechanical.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c63ccee28ae7ab4cb57a2433314f08c71da914ff drm-intel
07c7a67ffcaa drm/xe/cri: Add new performance limit reasons bits
-:203: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#203: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:278:
+}
+static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);

-:221: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#221: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:322:
+}
+static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);

-:239: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#239: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:344:
+}
+static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);

-:250: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#250: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:355:
+}
+static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);

-:261: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#261: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:366:
+}
+static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);

-:272: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#272: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:377:
+}
+static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);

-:283: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#283: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:388:
+}
+static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);

-:294: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#294: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:399:
+}
+static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);

-:305: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#305: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:410:
+}
+static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);

-:316: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#316: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:421:
+}
+static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);

total: 0 errors, 0 warnings, 10 checks, 354 lines checked
63a3de797c9b drm/xe/gt_throttle: Tidy up perf reasons reading
ab53c1af3962 drm/xe/gt_throttle: Always read and mask
bfb6813266f5 drm/xe/gt_throttle: Add throttle_to_gt()
1e49ab4f2edc drm/xe/gt_throttle: Tidy up attribute definition


