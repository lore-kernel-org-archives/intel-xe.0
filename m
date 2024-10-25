Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB4D149F3
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 20:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601EB10EB80;
	Fri, 25 Oct 2024 20:53:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFD610EB82;
 Fri, 25 Oct 2024 20:53:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/xe3lpd=3A_p?=
 =?utf-8?q?tl_display_patches_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 20:53:55 -0000
Message-ID: <172988963589.1334310.1056367907040016678@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025204743.211510-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241025204743.211510-1-clinton.a.taylor@intel.com>
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

Series: drm/i915/xe3lpd: ptl display patches (rev5)
URL   : https://patchwork.freedesktop.org/series/140195/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 3ec61d11c742 drm-tip: 2024y-10m-25d-20h-06m-01s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/xe3lpd: Update pmdemand programming
Applying: drm/i915/xe3lpd: Disable HDCP Line Rekeying for Xe3
Applying: drm/i915/xe3lpd: Add check to see if edp over type c is allowed
Applying: drm/i915/ptl: Define IS_PANTHERLAKE macro
Applying: drm/i915/cx0: Extend C10 check to PTL
Applying: drm/i915/cx0: Remove bus reset after every c10 transaction
Applying: drm/i915/xe3lpd: Move async flip bit to PLANE_SURF register
Applying: drm/i915/xe3: Underrun recovery does not exist post Xe2
Applying: drm/i915/display/xe3: disable x-tiled framebuffers
Applying: drm/i915/xe3lpd: Power request asserting/deasserting
Applying: drm/xe/ptl: Enable PTL display


