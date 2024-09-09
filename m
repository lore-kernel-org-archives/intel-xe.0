Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C999ECE57A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 13:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA8010E574;
	Mon,  9 Sep 2024 13:28:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75310E573;
 Mon,  9 Sep 2024 13:28:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Use_ERR=5F?=
 =?utf-8?q?CAST_to_return_an_error-valued_pointer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yu Jiaoliang" <yujiaoliang@vivo.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 13:28:36 -0000
Message-ID: <172588851656.976495.5813050643427514056@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906070109.1852860-1-yujiaoliang@vivo.com>
In-Reply-To: <20240906070109.1852860-1-yujiaoliang@vivo.com>
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

Series: drm/xe: Use ERR_CAST to return an error-valued pointer
URL   : https://patchwork.freedesktop.org/series/138410/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 36d222030253 drm-tip: 2024y-09m-09d-10h-39m-21s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Use ERR_CAST to return an error-valued pointer


