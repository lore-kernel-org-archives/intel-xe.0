Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC26C369A5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 01:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7F910E040;
	Wed,  9 Apr 2025 01:51:03 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7304E10E00B;
 Wed,  9 Apr 2025 01:51:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=5Fmst=3A?=
 =?utf-8?q?_Add_support_for_fractional_link_bpps?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 01:51:02 -0000
Message-ID: <174416346246.50469.18225469169461711916@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408214342.1953197-1-imre.deak@intel.com>
In-Reply-To: <20250408214342.1953197-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Add support for fractional link bpps
URL   : https://patchwork.freedesktop.org/series/147434/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a49a4787e6bc drm-tip: 2025y-04m-08d-21h-20m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: Use the correct connector while computing the link BPP limit on MST
Applying: drm/i915/dp: Limit max link bpp properly to a fractional value on SST
Applying: drm/i915/dp_mst: Add support for fractional link bpps on MST
Applying: drm/i915/dp_mst: Enable fractional link bpps on MST
Applying: drm/i915/display: Factor out intel_display_{min, max}_pipe_bpp()
Applying: drm/i915/dp: Export intel_dp_dsc_min_src_compressed_bpp()
Applying: drm/i915/dp: Use an intel_connector pointer everywhere
Applying: drm/i915/hdmi: Use an intel_connector pointer everywhere
Applying: drm/i915: Add support for forcing the link bpp on a connector
Applying: drm/i915: Add force link bpp debugfs entry to connectors


