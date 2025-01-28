Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6FAC0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 18:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA510E125;
	Tue, 28 Jan 2025 18:16:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6402910E125;
 Tue, 28 Jan 2025 18:16:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Display_Global_Histo?=
 =?utf-8?q?gram_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Jan 2025 18:16:32 -0000
Message-ID: <173808819240.2037814.6281615503912121844@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
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

Series: Display Global Histogram (rev9)
URL   : https://patchwork.freedesktop.org/series/138867/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 20759526c04a drm-tip: 2025y-01m-28d-16h-51m-13s UTC integration manifest
=== git am output follows ===
Applying: drm: Define histogram structures exposed to user
Applying: drm: Define ImageEnhancemenT LUT structures exposed to user
Applying: drm/crtc: Expose API to create drm crtc property for histogram
Applying: drm/crtc: Expose API to create drm crtc property for IET LUT
Applying: drm/i915/histogram: Define registers for histogram
Applying: drm/i915/histogram: Add support for histogram
Applying: drm/xe: Add histogram support to Xe builds
Applying: drm/i915/histogram: histogram interrupt handling
Applying: drm/i915/histogram: Hook i915 histogram with drm histogram
Applying: drm/i915/iet: Add support to writing the IET LUT data
Applying: drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
Applying: drm/i915/histogram: histogram delay counter doesnt reset
Applying: drm/i915/histogram: Histogram changes for Display 20+
Applying: drm/i915/histogram: Enable pipe dithering


