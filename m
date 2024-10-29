Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3684ED2AB23
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 11:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24DC10E646;
	Tue, 29 Oct 2024 11:42:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873A010E256;
 Tue, 29 Oct 2024 11:42:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?bunch_of_struct_intel=5Fdisplay_conversions_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 11:42:07 -0000
Message-ID: <173020212754.1359099.10815616455632405507@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1730146000.git.jani.nikula@intel.com>
In-Reply-To: <cover.1730146000.git.jani.nikula@intel.com>
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

Series: drm/i915/display: bunch of struct intel_display conversions (rev5)
URL   : https://patchwork.freedesktop.org/series/140323/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 738c18d8599d drm-tip: 2024y-10m-29d-10h-42m-40s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/gmbus: convert to struct intel_display
Applying: drm/i915/cx0: remove unnecessary includes
Applying: drm/i915/cx0: convert to struct intel_display
Applying: drm/i915/dpio: convert to struct intel_display
Applying: drm/i915/hdcp: further conversion to struct intel_display
Applying: drm/i915/dp/hdcp: convert to struct intel_display
Applying: drm/i915/crt: convert to struct intel_display
Applying: drm/i915/display: convert vlv_wait_port_ready() to struct intel_display
Applying: drm/i915/power: convert assert_chv_phy_status() to struct intel_display
Applying: drm/i915/ips: convert to struct intel_display
Applying: drm/i915/dsi: convert to struct intel_display
Applying: drm/i915/de: remove unnecessary generic wrappers


