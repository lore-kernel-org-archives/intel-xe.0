Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5ED4C369D5
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 20:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0096910E9BD;
	Fri, 25 Apr 2025 20:29:11 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C5910E9CF;
 Fri, 25 Apr 2025 20:29:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Add_check_?=
 =?utf-8?q?for_alloc=5Fordered=5Fworkqueue=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Haoxiang Li" <haoxiang_li2024@163.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Apr 2025 20:29:09 -0000
Message-ID: <174561294922.13049.12597330134562999037@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424023335.3497842-1-haoxiang_li2024@163.com>
In-Reply-To: <20250424023335.3497842-1-haoxiang_li2024@163.com>
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

Series: drm/xe: Add check for alloc_ordered_workqueue() (rev2)
URL   : https://patchwork.freedesktop.org/series/145244/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 6e67a7af4356 drm-tip: 2025y-04m-25d-15h-57m-07s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add check for alloc_ordered_workqueue()


