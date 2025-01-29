Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE2C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 11:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2994F10E7BA;
	Wed, 29 Jan 2025 11:38:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995610E7BA;
 Wed, 29 Jan 2025 11:38:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PMU_Support_for_per-?=
 =?utf-8?q?engine-class_activity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 11:38:43 -0000
Message-ID: <173815072322.2353200.16640580331661462062@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129101653.1976699-1-riana.tauro@intel.com>
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
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

Series: PMU Support for per-engine-class activity (rev2)
URL   : https://patchwork.freedesktop.org/series/143138/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 683350734da3 drm-tip: 2025y-01m-29d-09h-19m-10s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:493: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add per-engine-class activity support
Applying: drm/xe/trace: Add trace for engine activity
Applying: drm/xe/guc: Expose engine activity only for supported GuC version
Applying: drm/xe/xe_pmu: Add PMU support for per-engine-class activity
Applying: drm/xe/guc: Bump minimum required GuC version to v70.36.0
Applying: drm/xe: Add support for per-function engine activity
Applying: drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
Applying: drm/xe/pf: Enable per-function per-engine-class activity stats


