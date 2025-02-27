Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF2C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 22:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B2510E0D5;
	Thu, 27 Feb 2025 22:35:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6196310E0D5;
 Thu, 27 Feb 2025 22:35:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=3A_Imple?=
 =?utf-8?q?ment_POST=5FLT=5FADJ=5FREQ_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 22:35:25 -0000
Message-ID: <174069572539.2902250.4498965479116878052@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dp: Implement POST_LT_ADJ_REQ (rev2)
URL   : https://patchwork.freedesktop.org/series/145346/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e03a2fbda18f drm-tip: 2025y-02m-27d-21h-48m-55s UTC integration manifest
=== git am output follows ===
Applying: drm/dp: Add definitions for POST_LT_ADJ training sequence
Applying: drm/dp: Add POST_LT_ADJ_REQ helpers
Applying: drm/i915/dp: Clear DPCD training pattern before transmitting the idle pattern
Applying: drm/i915/dp: Have intel_dp_get_adjust_train() tell us if anything changed
Applying: drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
Applying: drm/i915/dp: Move intel_dp_training_pattern()
Applying: drm/i915/dp: Implement .set_idle_link_train() for everyone
Applying: drm/i915/dp: Make .set_idle_link_train() mandatory
Applying: hax: drm/i915: Disable TPS4 support to force POST_LT_ADJ_REQ usage


