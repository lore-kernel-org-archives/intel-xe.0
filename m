Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D21D3E2A0
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 19:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCC10E52B;
	Mon, 28 Oct 2024 19:19:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F97010E52B;
 Mon, 28 Oct 2024 19:19:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Fix_build_?=
 =?utf-8?q?error_for_XE=5FIOCTL=5FDBG_macro?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gyeyoung Baek" <gye976@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 19:19:54 -0000
Message-ID: <173014319432.1355839.15670632022988019487@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241027045752.10530-1-gye976@gmail.com>
In-Reply-To: <20241027045752.10530-1-gye976@gmail.com>
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

Series: drm/xe: Fix build error for XE_IOCTL_DBG macro
URL   : https://patchwork.freedesktop.org/series/140594/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f21e568eed1e drm-tip: 2024y-10m-28d-18h-13m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Fix build error for XE_IOCTL_DBG macro


