Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF196CF07A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 04:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9741410E2AE;
	Thu, 10 Oct 2024 04:35:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3397A10E2AE;
 Thu, 10 Oct 2024 04:35:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Implement_Wa=5F14021?=
 =?utf-8?q?768792_to_bypass_m=5Fn_ratio_limit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Oct 2024 04:35:09 -0000
Message-ID: <172853490920.1213385.12336195912022229204@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010041045.2014069-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241010041045.2014069-1-ankit.k.nautiyal@intel.com>
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

Series: Implement Wa_14021768792 to bypass m_n ratio limit (rev3)
URL   : https://patchwork.freedesktop.org/series/138256/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e1aba2bf4f79 drm-tip: 2024y-10m-09d-20h-21m-55s UTC integration manifest
=== git am output follows ===
Applying: Add bits for link_n_exended for DISPLAY >= 14
Applying: drm/i915/display: Limit m/n ratio to 10 for display > 12
Applying: drm/i915/display: Add bits for Wa_14021768792 for linkm/n ratio > 10
Applying: drm/i915/display: Implement Wa_14021768792 for BMG DP for link_m/n ratio > 10


