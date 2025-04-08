Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C8C36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 21:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AFC10E164;
	Tue,  8 Apr 2025 21:37:08 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFE710E164;
 Tue,  8 Apr 2025 21:37:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/display=3A_Pr?=
 =?utf-8?q?ogram_double_buffered_LUT_registers_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 21:37:07 -0000
Message-ID: <174414822777.50015.6171055888429343359@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/xe/display: Program double buffered LUT registers (rev7)
URL   : https://patchwork.freedesktop.org/series/142436/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a49a4787e6bc drm-tip: 2025y-04m-08d-21h-20m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsb: Extract intel_dsb_ins_align()
Applying: drm/i915/dsb: Extract assert_dsb_tail_is_aligned()
Applying: drm/i915/dsb: Extract intel_dsb_{head,tail}()
Applying: drm/i915/dsb: Implement intel_dsb_gosub()
Applying: drm/i915/dsb: add intel_dsb_gosub_finish()
Applying: drm/i915/dsb: Add support for GOSUB interrupt
Applying: drm/i915: s/dsb_color_vblank/dsb_color
Applying: drm/i915: use GOSUB to program doubled buffered LUT registers
Applying: drm/i915: Program DB LUT registers before vblank
Applying: drm/i915/color: Do not pre-load LUTs with DB registers
Applying: drm/i915: Disable updating of LUT values during vblank


