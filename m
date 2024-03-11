Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55555C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 20:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1269310F554;
	Mon, 11 Mar 2024 20:34:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3C410F8C9;
 Mon, 11 Mar 2024 20:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Introduce_xe=5F?=
 =?utf-8?q?pm=5Fruntime=5Fget=5Fnoresume_for_inner_callers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Mar 2024 20:34:18 -0000
Message-ID: <171018925897.680152.11599207315764208716@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers (rev2)
URL   : https://patchwork.freedesktop.org/series/130996/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 812544ff633da71c7c6b737e8d85223f74a48dbf
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Mar 11 15:23:03 2024 -0400

    drm/xe: Kill xe_device_mem_access_{get*,put}
    
    Let's simply convert all the current callers towards direct
    xe_pm_runtime access and remove this extra layer of indirection.
    
    v2: Convert all the current callers instead of a big refactor
    at once.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 61fa386186cb302cf26e29aef76d5b1a6ffe57ad drm-intel
a020888dd6e3 drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
bd0d6461f95c drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
814bc8b3d768 drm/i915/display: convert inner wakeref get towards get_if_in_use
996e1b85ee8f drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
6299475c9b85 drm/xe: Convert GSC HDCP from mem_access to direct xe_pm_runtime calls
daef191a3ab9 drm/xe: Remove useless mem_access during probe
b27186748f80 drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
2cc2907815fc drm/xe: Removing extra mem_access protection from runtime pm
d1e27f2b9a26 drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
c70d5a86b7b2 drm/xe: Ensure all the inner access are using the _noresume variant
812544ff633d drm/xe: Kill xe_device_mem_access_{get*,put}


