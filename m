Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85E4C27C4F
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jun 2024 20:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1210E150;
	Sat, 29 Jun 2024 20:35:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9810E150;
 Sat, 29 Jun 2024 20:35:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5BCI=2C1/4=5D_drm/ttm=3A_Add_a_flag_to_allow_drivers_to_skip_cl?=
 =?utf-8?q?ear-on-free_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 29 Jun 2024 20:35:10 -0000
Message-ID: <171969331031.13.258382058480675064@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240628193846.26326-1-nirmoy.das@intel.com>
In-Reply-To: <20240628193846.26326-1-nirmoy.das@intel.com>
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

Series: series starting with [CI,1/4] drm/ttm: Add a flag to allow drivers to skip clear-on-free (rev2)
URL   : https://patchwork.freedesktop.org/series/135538/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 886eeb6d89b5 drm-tip: 2024y-06m-28d-10h-30m-43s UTC integration manifest
=== git am output follows ===
Applying: drm/ttm: Add a flag to allow drivers to skip clear-on-free
Applying: drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
Applying: drm/xe/migrate: Clear CCS when clearing bo with XE_FAST_COLOR_BLT
Applying: drm/xe/lnl: Offload system clear page activity to GPU


