Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C89C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74E010FE76;
	Fri, 26 Jan 2024 20:40:05 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3299310FE75;
 Fri, 26 Jan 2024 20:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Kill_mem=5Faccess_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 26 Jan 2024 20:40:05 -0000
Message-ID: <170630160520.764296.15965719920633397016@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
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

Series: Kill mem_access v2
URL   : https://patchwork.freedesktop.org/series/129217/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 93e0c6fa97e358d4566f0b4d2a49f817e9f46b1d
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Jan 26 15:30:43 2024 -0500

    drm/xe: Enable D3Cold on 'low' VRAM utilization
    
    Now that we eliminated all the mem_access get/put with its
    locking issues from the inner calls of migration, we can
    allow D3Cold.
    
    Enable it when VRAM utilization is lower then 300Mb. On
    higher utilization we only allow D3hot so we don't increase
    so much the latency on runtime resume due to the memory
    restoration.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch eeedb1b4360b100e4fa15a9c5c968a8f5a8de7ed drm-intel
7d02b670f Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '48cd5ebcb645ac1bd48480cf11dced902108d306', maybe rebased or not pulled?
#10: 
This reverts commit 48cd5ebcb645ac1bd48480cf11dced902108d306.

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
92dc66bd3 drm/xe: Document Xe PM component
44c3714b3 drm/xe: Fix display runtime_pm handling
dec1d19dd drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
b1e8011df drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
951bc6233 drm/xe: Prepare display for D3Cold
f4cc91996 drm/xe: Convert mem_access assertion towards the runtime_pm state
2bb486a64 drm/xe: Runtime PM wake on every IOCTL
37accbef8 drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
90153fcc8 drm/xe: Convert scheduler towards direct pm_runtime
38f847a8c drm/xe: Runtime PM wake on every sysfs call
2474ee7ee drm/xe: Ensure device is awake before removing it
506ba97bc drm/xe: Remove mem_access from guc_pc calls
51f5f8cb0 drm/xe: Runtime PM wake on every debugfs call
708cfafb7 drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
ec9f9856d drm/xe: Removing extra mem_access protection from runtime pm
eb17f8d5d drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
921c9f272 drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
-:79: CHECK:LINE_SPACING: Please don't use multiple blank lines
#79: FILE: drivers/gpu/drm/xe/xe_pm.c:69:
 
+

total: 0 errors, 0 warnings, 1 checks, 151 lines checked
4898153f8 drm/xe: Remove pm_runtime lockdep
d4058f95b drm/xe: Stop checking for power_lost on D3Cold
b5e40341e drm/xe: Convert GuC CT paths from mem_access to xe_pm_runtime
-:74: CHECK:LINE_SPACING: Please don't use multiple blank lines
#74: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:328:
 
+

total: 0 errors, 0 warnings, 1 checks, 151 lines checked
58692c1ec drm/xe: Keep D0 for the entire duration of a LR VM
96049aa8b drm/xe: Ensure D0 on TLB invalidation
c5de9716c drm/xe: Remove useless mem_access protection for query ioctls
bfd882e54 drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
53a9c0067 drm/xe: VMs don't need the mem_access protection anymore
5fdef087c drm/xe: Remove useless mem_access during probe
924d62305 drm/xe: Remove mem_access from suspend and resume functions
b0d058d67 drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
aa9950c99 drm/xe: Remove useless mem_access on PAT dumps
74a70e377 drm/xe: Remove inner mem_access protections
1f5011daf drm/xe: Kill xe_device_mem_access_{get*,put}
e5e705461 drm/xe: Remove unused runtime pm helper
93e0c6fa9 drm/xe: Enable D3Cold on 'low' VRAM utilization


