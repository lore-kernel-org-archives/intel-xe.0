Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BFDC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 12:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B910E195;
	Thu, 14 Dec 2023 12:59:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3410E195;
 Thu, 14 Dec 2023 12:59:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1E324A3ECB;
 Thu, 14 Dec 2023 12:59:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Engine_Busyness_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 14 Dec 2023 12:59:15 -0000
Message-ID: <170255875509.19957.11063128483917194621@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214113144.251726-1-riana.tauro@intel.com>
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Engine Busyness (rev3)
URL   : https://patchwork.freedesktop.org/series/126919/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 5cd189336 drm/xe/xe2: Support flat ccs
=== git am output follows ===
.git/rebase-apply/patch:662: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Applying: fixup! drm/xe/uapi: Reject bo creation of unaligned size
Applying: drm/xe: Move user engine class mappings to functions
Applying: RFC drm/xe/guc: Add interface for engine busyness ticks
Applying: RFC drm/xe/uapi: Add configs for Engine busyness
Applying: RFC drm/xe/pmu: Enable PMU interface and add engine busyness counter
Applying: RFC drm/xe/guc: Add PMU counter for total active ticks
Applying: RFC drm/xe/guc: Expose engine busyness only for supported GuC version
Applying: RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
Applying: RFC drm/xe/guc: Handle runtime suspend issues for engine busyness


