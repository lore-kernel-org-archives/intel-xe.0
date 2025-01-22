Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E8AC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 10:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C4B10E0B7;
	Wed, 22 Jan 2025 10:44:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F21F10E0B7;
 Wed, 22 Jan 2025 10:44:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/pmu=3A_PMU_in?=
 =?utf-8?q?terface_for_Xe_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 10:44:37 -0000
Message-ID: <173754267705.3008751.1381430419843632116@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122062341.1100173-1-lucas.demarchi@intel.com>
In-Reply-To: <20250122062341.1100173-1-lucas.demarchi@intel.com>
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

Series: drm/xe/pmu: PMU interface for Xe (rev14)
URL   : https://patchwork.freedesktop.org/series/139121/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 71b6a6ef0f37 drm-tip: 2025y-01m-22d-07h-37m-49s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:399: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: perf/core: Add PMU_EVENT_ATTR_ID_STRING
Applying: drm/xe/pmu: Enable PMU interface
Applying: drm/xe/pmu: Assert max gt
Applying: drm/xe/pmu: Extract xe_pmu_event_update()
Applying: drm/xe/pmu: Add attribute skeleton
Applying: drm/xe/pmu: Get/put runtime pm on event init
Applying: drm/xe/pmu: Add GT C6 events


