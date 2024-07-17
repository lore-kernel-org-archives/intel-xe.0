Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A818C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D6410E3E1;
	Wed, 17 Jul 2024 19:58:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B50D10E3D9;
 Wed, 17 Jul 2024 19:58:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Convert_live_tests_t?=
 =?utf-8?q?o_parameterized_style_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 19:58:30 -0000
Message-ID: <172124631010.271041.566676051759872215@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
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

Series: Convert live tests to parameterized style (rev2)
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bd2a84d80198 drm-tip: 2024y-07m-17d-17h-00m-05s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce const cast helper
Applying: drm/xe/tests: Add helpers for use in live tests
Applying: drm/xe/tests: Convert xe_bo live tests
Applying: drm/xe/tests: Convert xe_dma_buf live tests
Applying: drm/xe/tests: Convert xe_migrate live tests
Applying: drm/xe/tests: Convert xe_mocs live tests
Applying: drm/xe/tests: Skip xe_mocs live tests on VF device


