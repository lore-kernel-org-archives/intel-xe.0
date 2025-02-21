Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB49BC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 11:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16AB10E2D7;
	Fri, 21 Feb 2025 11:25:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881E410E2D7;
 Fri, 21 Feb 2025 11:25:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PMU_support_for_engi?=
 =?utf-8?q?ne_activity_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 11:25:38 -0000
Message-ID: <174013713855.457349.14535933306412599466@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221105908.1966738-1-riana.tauro@intel.com>
In-Reply-To: <20250221105908.1966738-1-riana.tauro@intel.com>
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

Series: PMU support for engine activity (rev4)
URL   : https://patchwork.freedesktop.org/series/144408/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a22ac320a083 drm-tip: 2025y-02m-21d-09h-57m-32s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:497: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add engine activity support
Applying: drm/xe/trace: Add trace for engine activity
Applying: drm/xe/guc: Expose engine activity only for supported GuC version
Applying: drm/xe/xe_pmu: Add PMU support for engine activity
Applying: drm/xe/xe_pmu: Acquire forcewake on event init for engine events


