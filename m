Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60373D10F57
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 04:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1009D10E240;
	Mon, 18 Nov 2024 04:00:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FE010E23C;
 Mon, 18 Nov 2024 04:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/6=5D_drm/i915/wm=3A_Initialize_max=5Flatency_variable_to_ap?=
 =?utf-8?q?propriate_value_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 04:00:32 -0000
Message-ID: <173190243238.1052622.6334370248095695242@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241115160116.1436521-1-suraj.kandpal@intel.com>
In-Reply-To: <20241115160116.1436521-1-suraj.kandpal@intel.com>
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

Series: series starting with [1/6] drm/i915/wm: Initialize max_latency variable to appropriate value (rev2)
URL   : https://patchwork.freedesktop.org/series/141412/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 57639ceec0f6 drm-tip: 2024y-11m-18d-03h-31m-09s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/wm: Initialize max_latency variable to appropriate value
Applying: drm/i915/wm: Refactor dpkgc value prepration
Applying: drm/i915/wm: Rename enable_dpkgc variable
Applying: drm/i915/wm: Use intel_display structure in DPKGC code
Applying: drm/i915/display: Refactor DPKGC code to call it from atomic_commit_tail
Applying: drm/i915/wm: Modify latency programmed into PKG_C_LATENCY


