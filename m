Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A23C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 13:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC910E056;
	Tue,  4 Feb 2025 13:37:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F4310E056;
 Tue,  4 Feb 2025 13:37:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_Aux_based_Nit?=
 =?utf-8?q?s_brightness_control_for_eDP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 13:37:49 -0000
Message-ID: <173867626980.876947.2817580051532297428@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204125009.2609726-1-suraj.kandpal@intel.com>
In-Reply-To: <20250204125009.2609726-1-suraj.kandpal@intel.com>
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

Series: Enable Aux based Nits brightness control for eDP (rev2)
URL   : https://patchwork.freedesktop.org/series/143910/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 22287f579e2c drm-tip: 2025y-02m-04d-13h-11m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add eDP 1.5 bit definition
Applying: drm/i915/backlight: Use proper interface based on eDP version
Applying: drm/i915/backlight: Check Luminance based brightness control for VESA
Applying: drm/i915/backlight: Modify function to get VESA brightness in Nits
Applying: drm/i915/backlight: Add function to change brightness in nits for VESA
Applying: drm/i915/backlight: Setup nits based luminance via VESA
Applying: drm/i915/backlight: Enable nits based luminance


