Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE0BC54756
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 07:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3A199BE3;
	Thu, 22 May 2025 07:21:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E64F989E2;
 Thu, 22 May 2025 07:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/9=5D_iosys-map=3A_add_new_accessor_interfaces_and_use_them_?=
 =?utf-8?q?internally=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 07:20:15 -0000
Message-ID: <174789841531.12503.9845168016436172819@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522065519.318013-1-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
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

Series: series starting with [1/9] iosys-map: add new accessor interfaces and use them internally.
URL   : https://patchwork.freedesktop.org/series/149367/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 09130f929f7c drm-tip: 2025y-05m-22d-06h-26m-11s UTC integration manifest
=== git am output follows ===
Applying: iosys-map: add new accessor interfaces and use them internally.
Applying: udmabuf: use new iosys_map accessors.
Applying: firmware/tegra: avoid accessing iosys_map internals.
Applying: drm/xe: avoid accessing internals of iosys_map
Applying: drm/qxl: avoid accessing iosys_map internals.
Applying: drm/ttm: avoid accessing iosys_map internals.
Applying: drm: avoid accessing iosys_map internals.
Applying: iosys: hide internal details of implementation.
Applying: iosys_map: embed the is_iomem bit into the pointer.


