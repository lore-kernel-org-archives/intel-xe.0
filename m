Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D999C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 10:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A1410E860;
	Thu,  5 Jun 2025 10:36:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A610E860;
 Thu,  5 Jun 2025 10:36:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/dp=3A_Limit_the_?=
 =?utf-8?q?DPCD_probe_quirk_to_the_affected_monitor_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 10:36:40 -0000
Message-ID: <174911980080.51760.5468603581574832409@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605082850.65136-1-imre.deak@intel.com>
In-Reply-To: <20250605082850.65136-1-imre.deak@intel.com>
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

Series: drm/dp: Limit the DPCD probe quirk to the affected monitor (rev4)
URL   : https://patchwork.freedesktop.org/series/149773/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8a08b8454eec drm-tip: 2025y-06m-05d-06h-59m-45s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
Applying: drm/edid: Define the quirks in an enum list
Applying: drm/edid: Add support for quirks visible to DRM core and drivers
Applying: drm/dp: Add an EDID quirk for the DPCD register access probe
Applying: drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required


