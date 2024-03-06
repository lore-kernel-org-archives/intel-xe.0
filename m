Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C3C54E49
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 05:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D71910E751;
	Wed,  6 Mar 2024 05:24:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77A410E751;
 Wed,  6 Mar 2024 05:24:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Spin_of_Reduce_GGTT_?=
 =?utf-8?q?display_pinning_latency=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 05:24:32 -0000
Message-ID: <170970267281.524258.13519918208778828638@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306052002.311196-1-matthew.brost@intel.com>
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
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

Series: Spin of Reduce GGTT display pinning latency.
URL   : https://patchwork.freedesktop.org/series/130786/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: dd08fd912fdc drm-tip: 2024y-03m-06d-01h-37m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix NULL check in xe_ggtt_init()
Applying: drm/xe: Drop ggtt invalidate from display code
Applying: drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
Applying: drm/xe: Move xe_ggtt_invalidate out from ggtt->lock


