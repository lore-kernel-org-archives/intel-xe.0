Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB00D6ED26
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 13:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83B210E92D;
	Thu, 21 Nov 2024 13:07:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6910E92D;
 Thu, 21 Nov 2024 13:07:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Display_Global_Histo?=
 =?utf-8?q?gram_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 13:07:34 -0000
Message-ID: <173219445453.1157697.11639119240111590733@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-1-arun.r.murthy@intel.com>
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

Series: Display Global Histogram (rev4)
URL   : https://patchwork.freedesktop.org/series/138867/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e46649e7764a drm-tip: 2024y-11m-20d-23h-16m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/histogram: Define registers for histogram
Applying: drm/i915/histogram: Add support for histogram
Applying: drm/xe: Add histogram support to Xe builds
Applying: drm/i915/histogram: histogram interrupt handling
Applying: drm/i915/histogram: Add crtc properties for global histogram
Applying: drm/i915/histogram: histogram delay counter doesnt reset
Applying: drm/i915/histogram: Histogram changes for Display 20+
Applying: drm/i915/histogram: Enable pipe dithering


