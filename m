Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F94E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 11:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97B010E215;
	Tue, 17 Dec 2024 11:25:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB0B10E215;
 Tue, 17 Dec 2024 11:25:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_adding_wai?=
 =?utf-8?q?t_helper_for_gt_async_reset_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maciej Patelczyk" <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 11:25:39 -0000
Message-ID: <173443473930.3768854.13952911053325240968@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
In-Reply-To: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
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

Series: drm/xe: adding wait helper for gt async reset (rev4)
URL   : https://patchwork.freedesktop.org/series/142300/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: ff2d4c1b285a drm-tip: 2024y-12m-17d-10h-17m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
Applying: drm/xe: make change ccs_mode a synchronous action


