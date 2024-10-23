Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D50D2E018
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 06:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C231110E75C;
	Wed, 23 Oct 2024 06:56:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3C810E75C;
 Wed, 23 Oct 2024 06:56:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_support_for_3_VD?=
 =?utf-8?q?SC_engines_12_slices_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 06:56:39 -0000
Message-ID: <172966659997.1322530.18264785764870933569@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023065257.190035-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241023065257.190035-1-ankit.k.nautiyal@intel.com>
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

Series: Add support for 3 VDSC engines 12 slices (rev5)
URL   : https://patchwork.freedesktop.org/series/139933/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8a7ac0227c7c drm-tip: 2024y-10m-22d-18h-38m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: Update Comment for Valid DSC Slices per Line
Applying: drm/i915/display: Prepare for dsc 3 stream splitter
Applying: drm/i915/vdsc: Use VDSC0/VDSC1 for LEFT/RIGHT VDSC engine
Applying: drm/i915/vdsc: Introduce 3rd VDSC engine VDSC2
Applying: drm/i915/vdsc: Add support for read/write PPS for 3rd DSC engine
Applying: drm/i915/dp: Ensure hactive is divisible by slice count
Applying: drm/i915/dp: Enable 3 DSC engines for 12 slices
Applying: drm/i915/display: Add macro HAS_PIXEL_REPLICATION
Applying: drm/i915/display: Add support for DSC pixel replication
Applying: drm/i915/dp_mst: Account for pixel replication for MST overhead with DSC
Applying: drm/i915/dp: Account for pixel replication for BW computation with DSC
Applying: drm/i915/display: Account for pixel replication in pipe_src
Applying: drm/i915/dp: Enable DSC pixel replication
Applying: drm/i915/dsc: Introduce odd pixel removal
Applying: drm/i915/display: Adjust Pipe SRC Width for Odd Pixels
Applying: drm/i915/dp: Add Check for Odd Pixel Requirement


