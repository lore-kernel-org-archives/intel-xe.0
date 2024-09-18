Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1AACDD548
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7696910E5EA;
	Wed, 18 Sep 2024 16:28:53 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903D10E5EA;
 Wed, 18 Sep 2024 16:28:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Ultrajoiner_basic_fu?=
 =?utf-8?q?nctionality_series?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 16:28:52 -0000
Message-ID: <172667693242.1027304.16609512990380634791@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918144343.2876184-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240918144343.2876184-1-ankit.k.nautiyal@intel.com>
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

Series: Ultrajoiner basic functionality series
URL   : https://patchwork.freedesktop.org/series/138827/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 15aeb2cced25 drm-tip: 2024y-09m-18d-15h-56m-56s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Add some essential functionality for joiners
Applying: drm/i915/display: Enhance iterators for modeset en/disable
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
Applying: drm/i915: Compute config and mode valid changes for ultrajoiner
Applying: drm/i915/display: Consider ultrajoiner for computing maxdotclock
Applying: drm/i915/intel_dp: Add support for forcing ultrajoiner


