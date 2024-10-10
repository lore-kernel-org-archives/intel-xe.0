Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC82D2444F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 23:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC2510E9FF;
	Thu, 10 Oct 2024 23:12:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E3110E9FF;
 Thu, 10 Oct 2024 23:12:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_xe3lpd_edp_enabl?=
 =?utf-8?q?ing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 23:12:40 -0000
Message-ID: <172860196079.1238070.12057630150844152797@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010224311.50133-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241010224311.50133-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling (rev2)
URL   : https://patchwork.freedesktop.org/series/139732/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8e9b30b81e69 drm-tip: 2024y-10m-10d-22h-54m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/xe3lpd: reuse xe2lpd definition
Applying: drm/i915/xe3lpd: Adjust watermark calculations
Applying: drm/i915/xe3lpd: Add new display power wells
Applying: drm/i915/xe3lpd: Update pmdemand programming
Applying: drm/i915/xe3lpd: Add cdclk changes
Applying: drm/i915/xe3lpd: Include hblank restriction for xe3lpd
Applying: drm/i915/xe3lpd: Add C20 Phy consolidated programming table
Applying: drm/i915/xe3lpd: Add new bit range of MAX swing setup
Applying: drm/i915/xe3lpd: Add check to see if edp over type c is allowed
Applying: drm/i915/xe3lpd: Add condition for EDP to powerdown P2.PG


