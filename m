Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423D6CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 14:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ECF882B5;
	Mon,  1 Apr 2024 14:32:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B765010F1CC;
 Mon,  1 Apr 2024 14:32:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Use_hmm=5Frange=5Ffa?=
 =?utf-8?q?ult_to_populate_user_page_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zeng, Oak" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Apr 2024 14:32:18 -0000
Message-ID: <171198193874.1118006.13158356417384698615@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322035520.2382600-1-oak.zeng@intel.com>
In-Reply-To: <20240322035520.2382600-1-oak.zeng@intel.com>
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

Series: Use hmm_range_fault to populate user page (rev2)
URL   : https://patchwork.freedesktop.org/series/131463/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: a585b1993215 drm-tip: 2024y-04m-01d-05h-29m-14s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:264: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Introduce helper to populate userptr
Applying: drm/xe: Introduce a helper to free sg table
Applying: drm/xe: Use hmm_range_fault to populate user pages


