Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9DFE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 08:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF6410E01F;
	Mon,  6 Jan 2025 08:28:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB410E01F;
 Mon,  6 Jan 2025 08:28:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PMU_Support_for_per-?=
 =?utf-8?q?engine-class_activity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 08:28:48 -0000
Message-ID: <173615212800.98986.2371546783115763616@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106075600.852080-1-riana.tauro@intel.com>
In-Reply-To: <20250106075600.852080-1-riana.tauro@intel.com>
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

Series: PMU Support for per-engine-class activity
URL   : https://patchwork.freedesktop.org/series/143138/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 03abdf4d5729 drm-tip: 2025y-01m-06d-08h-25m-27s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:751: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:498: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/pmu: Enable PMU interface
Applying: drm/xe: Add locks in gtidle code
Applying: drm/xe/pmu: Add GT C6 events
Applying: drm/xe/pmu: Add GT frequency events
Applying: drm/xe/xe_pmu: add fixes for base PMU
Applying: drm/xe: Add per-engine-class activity support
Applying: drm/xe/trace: Add trace for engine activity
Applying: drm/xe/guc: Expose engine activity only for supported GuC version
Applying: drm/xe/pmu: Add PMU support for per-engine-class activity
Applying: drm/xe/guc: Bump minimum required GuC version to v70.36.0


