Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F86C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A550D10FE72;
	Fri, 26 Jan 2024 20:39:22 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344A10FE72;
 Fri, 26 Jan 2024 20:39:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Kill_mem=5Faccess_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 26 Jan 2024 20:39:21 -0000
Message-ID: <170630156166.764295.18210766658942448081@5338d5abeb45>
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: eeedb1b43 drm-tip: 2024y-01m-26d-20h-14m-43s UTC integration manifest
=== git am output follows ===
Applying: Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
Applying: drm/xe: Document Xe PM component
Applying: drm/xe: Fix display runtime_pm handling
Applying: drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
Applying: drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
Applying: drm/xe: Prepare display for D3Cold
Applying: drm/xe: Convert mem_access assertion towards the runtime_pm state
Applying: drm/xe: Runtime PM wake on every IOCTL
Applying: drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
Applying: drm/xe: Convert scheduler towards direct pm_runtime
Applying: drm/xe: Runtime PM wake on every sysfs call
Applying: drm/xe: Ensure device is awake before removing it
Applying: drm/xe: Remove mem_access from guc_pc calls
Applying: drm/xe: Runtime PM wake on every debugfs call
Applying: drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
Applying: drm/xe: Removing extra mem_access protection from runtime pm
Applying: drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
Applying: drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
Applying: drm/xe: Remove pm_runtime lockdep
Applying: drm/xe: Stop checking for power_lost on D3Cold
Applying: drm/xe: Convert GuC CT paths from mem_access to xe_pm_runtime
Applying: drm/xe: Keep D0 for the entire duration of a LR VM
Applying: drm/xe: Ensure D0 on TLB invalidation
Applying: drm/xe: Remove useless mem_access protection for query ioctls
Applying: drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
Applying: drm/xe: VMs don't need the mem_access protection anymore
Applying: drm/xe: Remove useless mem_access during probe
Applying: drm/xe: Remove mem_access from suspend and resume functions
Applying: drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
Applying: drm/xe: Remove useless mem_access on PAT dumps
Applying: drm/xe: Remove inner mem_access protections
Applying: drm/xe: Kill xe_device_mem_access_{get*,put}
Applying: drm/xe: Remove unused runtime pm helper
Applying: drm/xe: Enable D3Cold on 'low' VRAM utilization


