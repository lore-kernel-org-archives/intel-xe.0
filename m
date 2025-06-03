Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E332C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 22:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E8B10E731;
	Tue,  3 Jun 2025 22:56:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAC10E731;
 Tue,  3 Jun 2025 22:56:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5Bv3=2C1/2=5D_gpu/trace=3A_make_TRACE=5FGPU=5FMEM_configurable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juston Li" <justonli@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 22:56:41 -0000
Message-ID: <174899140130.45422.14339498684159609229@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603225123.2535767-1-justonli@chromium.org>
In-Reply-To: <20250603225123.2535767-1-justonli@chromium.org>
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

Series: series starting with [v3,1/2] gpu/trace: make TRACE_GPU_MEM configurable
URL   : https://patchwork.freedesktop.org/series/149810/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2d51392d4559 drm-tip: 2025y-06m-03d-21h-58m-03s UTC integration manifest
=== git am output follows ===
Applying: gpu/trace: make TRACE_GPU_MEM configurable
Applying: drm/xe/bo: add GPU memory trace points


