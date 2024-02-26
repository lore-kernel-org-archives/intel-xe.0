Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9898EC48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 13:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4C110F1E0;
	Mon, 26 Feb 2024 13:52:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CC710F1D9;
 Mon, 26 Feb 2024 13:52:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_use_KMEM?=
 =?utf-8?q?=5FCACHE=28=29_to_create_xe=5Fhw=5Ffence_cache?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunwu Chan" <chentao@kylinos.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 13:52:17 -0000
Message-ID: <170895553727.299440.9038774875026594972@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226021912.1779715-1-chentao@kylinos.cn>
In-Reply-To: <20240226021912.1779715-1-chentao@kylinos.cn>
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

Series: drm/xe: use KMEM_CACHE() to create xe_hw_fence cache
URL   : https://patchwork.freedesktop.org/series/130387/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: be399e928738 drm-tip: 2024y-02m-26d-13h-47m-08s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: use KMEM_CACHE() to create xe_hw_fence cache


