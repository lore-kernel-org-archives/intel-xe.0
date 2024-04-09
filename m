Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3DBC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 09:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433CC112BE4;
	Tue,  9 Apr 2024 09:03:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8651F112BE4;
 Tue,  9 Apr 2024 09:03:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI-only=2C1/4=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall?=
 =?utf-8?q?=28=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 09:03:55 -0000
Message-ID: <171265343555.1300821.10291539325675120691@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409083140.27711-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240409083140.27711-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [CI-only,1/4] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/132197/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5a898fb63049 drm-tip: 2024y-04m-09d-08h-35m-05s UTC integration manifest
=== git am output follows ===
Applying: drm: Add drm_vblank_work_flush_all().
Applying: drm/i915: Use vblank worker to unpin old legacy cursor fb safely
Applying: drm/i915: Use the same vblank worker for atomic unpin
Applying: drm/i915: Hack to check use-after-free aggressively, and undo purpose of patches


