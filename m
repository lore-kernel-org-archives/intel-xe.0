Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9929D3E2A1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 18:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8D10E37A;
	Mon, 28 Oct 2024 18:33:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6F10E377;
 Mon, 28 Oct 2024 18:33:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/migrate=3A_Fi?=
 =?utf-8?q?x_inappropriate_error_printing_in_xe=5Fmigrate=5Fsanity=5Ftest=28?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang Hai" <wanghai38@huawei.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Oct 2024 18:33:56 -0000
Message-ID: <173014043610.1355839.17606390644955306520@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241025091310.15380-1-wanghai38@huawei.com>
In-Reply-To: <20241025091310.15380-1-wanghai38@huawei.com>
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

Series: drm/xe/migrate: Fix inappropriate error printing in xe_migrate_sanity_test()
URL   : https://patchwork.freedesktop.org/series/140593/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f21e568eed1e drm-tip: 2024y-10m-28d-18h-13m-18s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/migrate: Fix inappropriate error printing in xe_migrate_sanity_test()


