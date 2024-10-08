Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D30CF042A
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 22:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D01610E604;
	Tue,  8 Oct 2024 22:43:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5C10E604;
 Tue,  8 Oct 2024 22:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_xe3lpd_edp_enabl?=
 =?utf-8?q?ing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 22:43:27 -0000
Message-ID: <172842740734.1206241.6628993518631221847@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008223741.82790-1-matthew.s.atwood@intel.com>
In-Reply-To: <20241008223741.82790-1-matthew.s.atwood@intel.com>
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

Series: Add xe3lpd edp enabling
URL   : https://patchwork.freedesktop.org/series/139732/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c8e01f4159a7 drm-tip: 2024y-10m-08d-22h-38m-10s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/xe3lpd: reuse xe2lpd definition
Applying: drm/i915/xe3lpd: Adjust watermark calculations
Applying: drm/i915/xe3lpd: Add new display power wells
Applying: drm/i915/xe3lpd: Update pmdemand programming
Applying: drm/i915/xe3lpd: Add cdclk changes
Applying: drm/i915/xe3lpd: Add macro to choose HDCP_LINE_REKEY bit
Applying: drm/i915/xe3lpd: Add C20 Phy consolidated programming table
Applying: drm/i915/xe3lpd: Add new bit range of MAX swing setup
Applying: drm/i915/xe3lpd: Add check to see if edp over type c is allowed
Applying: drm/i915/xe3lpd: Add powerdown value of eDP over type c


