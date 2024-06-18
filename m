Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FABC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 12:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4D510E674;
	Tue, 18 Jun 2024 12:57:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B1410E674;
 Tue, 18 Jun 2024 12:57:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv2=2C1/3=5D_drm/i915=3A_Move_encoder_suspend/shutdown_helpers?=
 =?utf-8?q?_to_intel=5Fencoder=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 12:57:20 -0000
Message-ID: <171871544088.103670.63408768523319690@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618125255.4080303-1-imre.deak@intel.com>
In-Reply-To: <20240618125255.4080303-1-imre.deak@intel.com>
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

Series: series starting with [v2,1/3] drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
URL   : https://patchwork.freedesktop.org/series/135013/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5a093f17293a drm-tip: 2024y-06m-18d-10h-34m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
Applying: drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
Applying: drm/xe: Use the encoder suspend helper also used by the i915 driver


