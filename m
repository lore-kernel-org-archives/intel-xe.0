Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793F7EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 07:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DAF10E4F2;
	Thu, 22 Jun 2023 07:57:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89F3710E4EF;
 Thu, 22 Jun 2023 07:57:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 802F0A7DFF;
 Thu, 22 Jun 2023 07:57:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 22 Jun 2023 07:57:30 -0000
Message-ID: <168742065048.4872.7680243093003696510@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Add_sysfs_entry_for_tile_and_relate_it_to_GTs_=28r?=
 =?utf-8?q?ev4=29?=
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

Series: drm/xe: Add sysfs entry for tile and relate it to GTs (rev4)
URL   : https://patchwork.freedesktop.org/series/118927/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: bf01ddde1 drm/i915: fix intel_display_irq.c include order 65;7003;1c I meant to sort the includes before submitting commit 2b874a027810 ("drm/i915/irq: split out display irq handling") but forgot, and it wasn't noticed in review either. Sort the includes.
=== git am output follows ===
Applying: drm/xe: Add sysfs entry for tile
Applying: drm/xe: Add GTs under respective tile sysfs
Applying: drm/xe: Add sysfs entry to report per tile memory size


