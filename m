Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3498C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD9810E8F3;
	Tue, 16 Jul 2024 22:01:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C83E10E8F3;
 Tue, 16 Jul 2024 22:01:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Convert_live_tests_t?=
 =?utf-8?q?o_parameterized_style?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 22:01:00 -0000
Message-ID: <172116726018.253641.9548190643222305679@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
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

Series: Convert live tests to parameterized style
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 49a697d7731b drm-tip: 2024y-07m-16d-20h-00m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce const cast helper
Applying: drm/xe/tests: Add helpers for use in live tests
Applying: drm/xe/tests: Convert xe_bo live tests
Applying: drm/xe/tests: Convert xe_dma_buf live tests
Applying: drm/xe/tests: Convert xe_migrate live tests
Applying: drm/xe/tests: Convert xe_mocs live tests
Applying: drm/xe/tests: Skip xe_mocs live tests on VF device


