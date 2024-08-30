Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7308ECA0EFB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 10:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6F10EA64;
	Fri, 30 Aug 2024 10:24:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4F810EA64;
 Fri, 30 Aug 2024 10:24:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?hdmi_and_dp_related_struct_intel=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Aug 2024 10:24:36 -0000
Message-ID: <172501347663.854019.7776625588209886878@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725012870.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725012870.git.jani.nikula@intel.com>
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

Series: drm/i915/display: hdmi and dp related struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/138010/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2c1b4f4d497c drm-tip: 2024y-08m-30d-09h-39m-37s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/display: use xe && 0 to avoid warnings about unused variables
Applying: drm/i915/hdmi: convert to struct intel_display
Applying: drm/i915/dp: convert g4x_dp.[ch] to struct intel_display
Applying: drm/i915/dp: convert intel_dp_tunnel.[ch] to struct intel_display
Applying: drm/i915/dp: convert intel_dp_aux.[ch] to struct intel_display
Applying: drm/i915/dp: convert intel_dp_link_training.[ch] to struct intel_display
Applying: drm/i915/pps: pass intel_dp to pps_name()
Applying: drm/i915/pps: convert intel_pps.[ch] to struct intel_display
Applying: drm/i915/psr: convert intel_psr.[ch] to struct intel_display
Applying: drm/i915/ddi: stop using dp_to_i915()
Applying: drm/i915/dp: hide dp_to_i915() inside intel_dp.c


