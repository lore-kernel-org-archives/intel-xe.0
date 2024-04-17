Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB92C001CC
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 21:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14254113813;
	Wed, 17 Apr 2024 21:51:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A634113813;
 Wed, 17 Apr 2024 21:51:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C01/10=5D_drm/xe=3A_Introduce_xe=5Fpm=5Fruntime=5Fget=5Fnoresu?=
 =?utf-8?q?me_for_inner_callers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 21:51:54 -0000
Message-ID: <171339071430.1483750.15252615781887301376@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,01/10] drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
URL   : https://patchwork.freedesktop.org/series/132579/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 07d4bf412cd50cf1103ba4c551d80b2aadbd8085
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Apr 17 16:39:52 2024 -0400

    drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
    
    Any kunit doing any memory access should get their own runtime_pm
    outer references since they don't use the standard driver API
    entries. In special this dma_buf from the same driver.
    
    Found by pre-merge CI on adding WARN calls for unprotected
    inner callers:
    
    <6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver
    <4> [318.639957] ------------[ cut here ]------------
    <4> [318.639967] xe 0000:4d:00.0: Missing outer runtime PM protection
    <4> [318.640049] WARNING: CPU: 117 PID: 3832 at drivers/gpu/drm/xe/xe_pm.c:533 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 drm-intel
995dda478e62 drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
5bd623bb747a drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
022949ee6f0e drm/i915/display: convert inner wakeref get towards get_if_in_use
155f2c4e4d07 drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
2c7881ce667c drm/xe: Remove useless mem_access during probe
10e5e876d8cd drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
83a25b2fc8a7 drm/xe: Removing extra mem_access protection from runtime pm
df74b2c14d81 drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
d083ea908d19 drm/xe: Ensure all the inner access are using the _noresume variant
07d4bf412cd5 drm/xe: Add outer runtime_pm protection to xe_live_ktest@xe_dma_buf
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
<6> [318.639739]     # xe_dma_buf_kunit: running xe_test_dmabuf_import_same_driver

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


