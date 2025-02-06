Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC3EC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 06:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298A410E444;
	Thu,  6 Feb 2025 06:46:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655D010E7EA;
 Thu,  6 Feb 2025 06:46:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Enable_Aux_based_Nit?=
 =?utf-8?q?s_brightness_control_for_eDP_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 06:46:39 -0000
Message-ID: <173882439941.1880617.14514413468198201555@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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

Series: Enable Aux based Nits brightness control for eDP (rev3)
URL   : https://patchwork.freedesktop.org/series/143910/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 7a632b6798b6 drm-tip: 2025y-02m-05d-20h-51m-51s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add eDP 1.5 bit definition
Applying: drm/dp: Increase eDP display control capability size
Applying: drm/i915/backlight: Use proper interface based on eDP version
Applying: drm/i915/backlight: Check Luminance based brightness control for VESA
Applying: drm/i915/backlight: Modify function to get VESA brightness in Nits
Applying: drm/i915/backlight: Add function to change brightness in nits for VESA
Applying: drm/i915/backlight: Setup nits based luminance via VESA
Applying: drm/i915/backlight: Enable nits based luminance


