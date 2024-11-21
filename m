Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D089D75BC2
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164C410E191;
	Thu, 21 Nov 2024 06:33:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AB610E191;
 Thu, 21 Nov 2024 06:33:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_PMU_support_for_?=
 =?utf-8?q?single_engine_busyness_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Nov 2024 06:33:47 -0000
Message-ID: <173217082782.1017304.3051763590085833984@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121063904.3033754-1-riana.tauro@intel.com>
In-Reply-To: <20241121063904.3033754-1-riana.tauro@intel.com>
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

Series: Add PMU support for single engine busyness (rev2)
URL   : https://patchwork.freedesktop.org/series/141259/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: e46649e7764a drm-tip: 2024y-11m-20d-23h-16m-04s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:712: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:495: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe/pmu: Enable PMU interface
Applying: drm/xe/pmu: Add GT C6 events
Applying: drm/xe/pmu: Add GT frequency events
Applying: drm/xe: add function to convert xe hw engine class to user class
Applying: drm/xe: Add single engine busyness support
Applying: drm/xe/trace: Add trace for xe_engine_activity
Applying: drm/xe/guc: Expose engine busyness only for supported GuC version
Applying: drm/xe/pmu: Add PMU support for engine busyness


