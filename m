Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6C7D5806E
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 12:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FF610E2CA;
	Mon, 25 Nov 2024 12:05:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF06010E2CA;
 Mon, 25 Nov 2024 12:05:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv1=2C1/1=5D_drm/xe=3A_fix_the_ERR=5FPTR=28=29_returned_on_fai?=
 =?utf-8?q?lure_to_allocate_tiny_pt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mirsad Todorovac" <mtodorovac69@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 12:05:50 -0000
Message-ID: <173253635093.2810522.4279155857584473015@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241121212057.1526634-2-mtodorovac69@gmail.com>
In-Reply-To: <20241121212057.1526634-2-mtodorovac69@gmail.com>
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

Series: series starting with [v1,1/1] drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt
URL   : https://patchwork.freedesktop.org/series/141746/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: b21f1413ea18 drm-tip: 2024y-11m-25d-11h-12m-48s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt


