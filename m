Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A500CCCFA02
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 22:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0B410E00F;
	Wed, 25 Sep 2024 22:13:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187D10E00F;
 Wed, 25 Sep 2024 22:13:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Ultrajoiner_basic_fu?=
 =?utf-8?q?nctionality_series_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 22:13:39 -0000
Message-ID: <172730241952.1103186.12245499320289479554@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240923181336.3303940-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series (rev3)
URL   : https://patchwork.freedesktop.org/series/138827/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 88d592f72f7b drm-tip: 2024y-09m-25d-19h-23m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display_device: Add Check HAS_DSC for bigjoiner
Applying: drm/i915/display_debugfs: Allow force joiner only if supported
Applying: drm/i915/display: Modify debugfs for joiner to force n pipes
Applying: drm/i915/dp: Add helper to compute num pipes required
Applying: drm/i915/display: Add debugfs support to avoid joiner
Applying: drm/i915: Split current joiner hw state readout
Applying: drm/i915: Add bigjoiner and uncompressed joiner hw readout sanity checks
Applying: drm/i915/display: Add macro HAS_ULTRAJOINER()
Applying: drm/i915: Implement hw state readout and checks for ultrajoiner
Applying: drm/i915/display: Refactor enable_joiner_pipes
Applying: drm/i915/display/vdsc: Add ultrajoiner support with DSC
Applying: drm/i915/dp: Modify compressed bpp limitations for ultrajoiner
Applying: drm/i915/dp: Modify helper to get slice count for ultrajoiner
Applying: drm/i915: Compute config and mode valid changes for ultrajoiner
Applying: drm/i915/display: Consider ultrajoiner for computing maxdotclock
Applying: drm/i915/intel_dp: Add support for forcing ultrajoiner


