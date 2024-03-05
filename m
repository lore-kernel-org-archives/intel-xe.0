Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F233C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB99112ACA;
	Tue,  5 Mar 2024 13:17:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF26112ACA;
 Tue,  5 Mar 2024 13:17:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Reduce_GGT?=
 =?utf-8?q?T_display_pinning_latency=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 13:17:43 -0000
Message-ID: <170964466397.524851.2293406345585425001@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Reduce GGTT display pinning latency.
URL   : https://patchwork.freedesktop.org/series/130739/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 1d6fe19a74eb drm-tip: 2024y-03m-05d-11h-14m-14s UTC integration manifest
=== git am output follows ===
Applying: fix "drm/xe: Cleanup some layering in GGTT"
Applying: drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC
Applying: drm/xe: Do not perform GuC TLB invalidation for display GGTT
Applying: drm/xe: Move xe_ggtt_invalidate out from ggtt->lock


