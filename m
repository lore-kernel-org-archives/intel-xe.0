Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3EECD37A7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F5010E63F;
	Wed,  4 Sep 2024 00:27:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DFA10E63F;
 Wed,  4 Sep 2024 00:27:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Stop_using_xe=5Fgt_a?=
 =?utf-8?q?s_a_register_MMIO_target?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 00:27:18 -0000
Message-ID: <172540963898.930912.16359149282672219890@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Series: Stop using xe_gt as a register MMIO target
URL   : https://patchwork.freedesktop.org/series/138168/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e159ed9ab3ec drm-tip: 2024y-09m-03d-22h-07m-55s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Move forcewake to 'gt.pm' substructure
Applying: drm/xe: Create dedicated xe_mmio structure
Applying: drm/xe: Clarify size of MMIO region
Applying: drm/xe: Move GSI offset adjustment fields into 'struct xe_mmio'
Applying: drm/xe: Populate GT's mmio iomap from tile during init
Applying: drm/xe: Switch mmio_ext to use 'struct xe_mmio'
Applying: drm/xe: Add xe_device backpointer to xe_mmio
Applying: drm/xe: Adjust mmio code to pass VF substructure to SRIOV code
Applying: drm/xe: Switch MMIO interface to take xe_mmio instead of xe_gt
Applying: drm/xe/irq: Convert register access to use xe_mmio
Applying: drm/xe/pcode: Convert register access to use xe_mmio
Applying: drm/xe/hwmon: Convert register access to use xe_mmio
Applying: drm/xe/vram: Convert register access to use xe_mmio
Applying: drm/xe/compat-i915: Convert register access to use xe_mmio
Applying: drm/xe/lmtt: Convert register access to use xe_mmio
Applying: drm/xe/stolen: Convert register access to use xe_mmio
Applying: drm/xe/device: Convert register access to use xe_mmio
Applying: drm/xe/pci: Convert register access to use xe_mmio
Applying: drm/xe/wa: Convert register access to use xe_mmio
Applying: drm/xe/uc: Convert register access to use xe_mmio
Applying: drm/xe/guc: Convert register access to use xe_mmio
Applying: drm/xe/huc: Convert register access to use xe_mmio
Applying: drm/xe/gsc: Convert register access to use xe_mmio
Applying: drm/xe/query: Convert register access to use xe_mmio
Applying: drm/xe/mcr: Convert register access to use xe_mmio
Applying: drm/xe/mocs: Convert register access to use xe_mmio
Applying: drm/xe/hw_engine: Convert register access to use xe_mmio
Applying: drm/xe/gt_throttle: Convert register access to use xe_mmio
Applying: drm/xe/pat: Convert register access to use xe_mmio
Applying: drm/xe/wopcm: Convert register access to use xe_mmio
Applying: drm/xe/oa: Convert register access to use xe_mmio
Applying: drm/xe/topology: Convert register access to use xe_mmio
Applying: drm/xe/execlist: Convert register access to use xe_mmio
Applying: drm/xe/gt_clock: Convert register access to use xe_mmio
Applying: drm/xe/reg_sr: Convert register access to use xe_mmio
Applying: drm/xe/gt: Convert register access to use xe_mmio
Applying: drm/xe/sriov: Convert register access to use xe_mmio
Applying: drm/xe/tlb: Convert register access to use xe_mmio
Applying: drm/xe/gt_idle: Convert register access to use xe_mmio
Applying: drm/xe/forcewake: Convert register access to use xe_mmio
Applying: drm/xe/ggtt: Convert register access to use xe_mmio
Applying: drm/xe/ccs_mode: Convert register access to use xe_mmio
Applying: drm/xe/mmio: Drop compatibility macros


