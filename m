Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A33EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 12:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46810E1F4;
	Mon, 26 Jun 2023 12:55:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6010E207;
 Mon, 26 Jun 2023 12:55:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 74B97A00CC;
 Mon, 26 Jun 2023 12:55:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 26 Jun 2023 12:55:58 -0000
Message-ID: <168778415844.5706.6253963499527042665@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230626105037.43780-15-matthew.auld@intel.com>
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe=5Fdevice=5Fmem=5Faccess_fixes_and_related_bits_=28rev2=29?=
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

Series: xe_device_mem_access fixes and related bits (rev2)
URL   : https://patchwork.freedesktop.org/series/119213/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: d3fc5af59 drm/xe/bo: consider bo->flags in xe_bo_migrate()
=== git am output follows ===
Applying: drm/xe: fix xe_device_mem_access_get() races
Applying: drm/xe/vm: tidy up xe_runtime_pm usage
Applying: drm/xe/debugfs: grab mem_access around forcewake
Applying: drm/xe/guc_pc: add missing mem_access for freq_rpe_show
Applying: drm/xe/mmio: grab mem_access in xe_mmio_ioctl
Applying: drm/xe: ensure correct access_put ordering
Applying: drm/xe/pci: wrap probe with mem_access
Applying: drm/xe/display: use mem_access underneath
Applying: drm/xe/mmio: enforce xe_device_assert_mem_access
Applying: drm/xe: drop xe_device_mem_access_get() from guc_ct_send
Applying: drm/xe/ggtt: prime ggtt->lock against FS_RECLAIM
Applying: drm/xe: drop xe_device_mem_access_get() from invalidation_vma
Applying: drm/xe: add lockdep annotation for xe_device_mem_access_get()


