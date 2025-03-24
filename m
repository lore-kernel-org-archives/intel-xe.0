Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A57FC3600B
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 13:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E2A10E3F3;
	Mon, 24 Mar 2025 13:29:43 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FE510E3F2;
 Mon, 24 Mar 2025 13:29:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/svm=3A_fix_de?=
 =?utf-8?q?referencing_error_pointer_in_drm=5Fgpusvm=5Frange=5Falloc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 13:29:42 -0000
Message-ID: <174282298233.72180.13754914247257453674@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
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

Series: drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()
URL   : https://patchwork.freedesktop.org/series/146665/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c21be2ca9276 drm-tip: 2025y-03m-24d-13h-25m-06s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()


