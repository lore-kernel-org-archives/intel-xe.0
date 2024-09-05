Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A66CD5BAE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 11:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645C910E87B;
	Thu,  5 Sep 2024 11:59:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B9010E87B;
 Thu,  5 Sep 2024 11:59:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Implement_Wa=5F14021?=
 =?utf-8?q?768792_to_bypass_m=5Fn_ratio_limit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Sep 2024 11:59:24 -0000
Message-ID: <172553756405.950487.2532828567797423371@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240905115505.3629087-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240905115505.3629087-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit
URL   : https://patchwork.freedesktop.org/series/138256/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b9fe1879bf21 drm-tip: 2024y-09m-05d-11h-33m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add bits for link_n_exended for DISPLAY >= 14
Applying: drm/i915/display: Limit m/n ratio to 10 for display > 12
Applying: drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
Applying: drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10
Applying: drm/i915: Add Wa_14021768792 as per WA framework


