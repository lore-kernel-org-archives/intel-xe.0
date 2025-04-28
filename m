Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716D6C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 13:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3627E10E1B7;
	Mon, 28 Apr 2025 13:59:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7110E1B6;
 Mon, 28 Apr 2025 13:59:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=5Fmst=3A?=
 =?utf-8?q?_Add_support_for_fractional_link_bpps_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 13:59:10 -0000
Message-ID: <174584875047.20458.3734328518161086378@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428133135.3396080-1-imre.deak@intel.com>
In-Reply-To: <20250428133135.3396080-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Add support for fractional link bpps (rev2)
URL   : https://patchwork.freedesktop.org/series/147434/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4dfede9f7f69 drm-tip: 2025y-04m-28d-09h-50m-50s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp_mst: Use the correct connector while computing the link BPP limit on MST
Applying: drm/i915/dp_mst: Simplify handling the single-bpp case during state computation
Applying: drm/i915/dp_mst: Validate compressed bpp vs. platform restrictions
Applying: drm/i915/dp_mst: Update the total link slot count early
Applying: drm/i915/dp_mst: Check BW limit on the local MST link early
Applying: drm/i915/dp_mst: Simplify computing the min/max compressed bpp limits
Applying: drm/i915/dp: Limit max link bpp properly to a fractional value on SST
Applying: drm/i915/dp_mst: Add support for fractional compressed link bpps on MST
Applying: drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
Applying: drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
Applying: drm/i915: Add support for forcing the link bpp on a connector
Applying: drm/i915/dp_mst: Enable fractional link bpps on MST if the bpp is forced


