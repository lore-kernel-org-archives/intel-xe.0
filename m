Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB11C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3E010E455;
	Wed, 17 Jul 2024 21:16:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C210E453;
 Wed, 17 Jul 2024 21:16:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Implement_Compressio?=
 =?utf-8?q?n_Support_on_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 21:16:17 -0000
Message-ID: <172125097703.271339.13531781004840222984@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

Series: Implement Compression Support on BMG
URL   : https://patchwork.freedesktop.org/series/136211/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bd2a84d80198 drm-tip: 2024y-07m-17d-17h-00m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Applying: drm/xe/migrate: Add kunit to test clear functionality
Applying: drm/xe/migrate: Add helper function to program identity map
Applying: drm/xe/xe2: Introduce identity map for compressed pat for vram
Applying: drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
Applying: drm/xe/migrate: Add kunit to test migration functionality for BMG
Applying: drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx


