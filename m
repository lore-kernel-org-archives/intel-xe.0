Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A223ECD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F3789811;
	Mon,  2 Sep 2024 14:58:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C245489811;
 Mon,  2 Sep 2024 14:58:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/2=5D_drm/xe=3A_Use_xe=5Fpm=5Fruntime=5Fget_in_xe=5Fbo=5Fmov?=
 =?utf-8?q?e=28=29_if_reclaim-safe=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 14:58:27 -0000
Message-ID: <172528910779.907152.16745129095955137456@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240902142042.77581-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [1/2] drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
URL   : https://patchwork.freedesktop.org/series/138098/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f68a30b6b56c drm-tip: 2024y-09m-02d-14h-33m-20s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:293: trailing whitespace.
{	
warning: 1 line adds whitespace errors.
Applying: drm/xe: Use xe_pm_runtime_get in xe_bo_move() if reclaim-safe.
Applying: drm/xe: Add a xe_bo subtest for shrinking / swapping


