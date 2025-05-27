Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D511C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1552A10E3E4;
	Tue, 27 May 2025 16:08:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C6910E193;
 Tue, 27 May 2025 16:08:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dram=3A_dra?=
 =?utf-8?q?m=5Finfo_refactoring_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 16:08:29 -0000
Message-ID: <174836210909.24728.2033038426436005656@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1748337870.git.jani.nikula@intel.com>
In-Reply-To: <cover.1748337870.git.jani.nikula@intel.com>
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

Series: drm/i915/dram: dram_info refactoring (rev2)
URL   : https://patchwork.freedesktop.org/series/148703/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b85200adaeff drm-tip: 2025y-05m-27d-14h-00m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/bw: pass struct dram_info pointer around
Applying: drm/i915/dram: add accessor for struct dram_info and use it
Applying: drm/i915/wm: DG2 doesn't have dram info to look up wm_lv_0_adjust_needed
Applying: drm/i915/dram: pass struct dram_info pointer around
Applying: drm/i915/dram: add return value and handling to intel_dram_detect()
Applying: drm/i915/dram: allocate struct dram_info dynamically


