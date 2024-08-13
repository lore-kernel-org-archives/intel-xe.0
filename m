Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FBEC52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 16:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA1310E39B;
	Tue, 13 Aug 2024 16:47:00 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28D110E39B;
 Tue, 13 Aug 2024 16:46:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/7=5D_drm/i915/display=3A_support_struct_intel=5Fatomic=5Fst?=
 =?utf-8?q?ate_in_to=5Fintel=5Fdisplay=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 16:46:59 -0000
Message-ID: <172356761978.614287.14811084292477414770@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813164123.2674462-1-jani.nikula@intel.com>
In-Reply-To: <20240813164123.2674462-1-jani.nikula@intel.com>
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

Series: series starting with [1/7] drm/i915/display: support struct intel_atomic_state in to_intel_display()
URL   : https://patchwork.freedesktop.org/series/137250/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4d1d605f5ff9 drm-tip: 2024y-08m-13d-15h-26m-08s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: support struct intel_atomic_state in to_intel_display()
Applying: drm/i915/display: convert intel_link_bw.c to struct intel_display
Applying: drm/i915/display: convert intel_load_detect.c to struct intel_display
Applying: drm/i915/alpm: convert to struct intel_display
Applying: drm/i915/lspcon: convert to struct intel_display
Applying: drm/i915/display: convert dp aux backlight to struct intel_display
Applying: drm/i915/hti: convert to struct intel_display


