Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC6FC6172
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFE210EDAD;
	Fri, 13 Sep 2024 21:07:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E8010EDAC;
 Fri, 13 Sep 2024 21:07:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_use_devm?=
 =?utf-8?q?=5Fadd=5Faction=5For=5Freset=28=29_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "HeLuang" <helugang@uniontech.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 21:07:49 -0000
Message-ID: <172626166901.998375.10535894194072255224@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
In-Reply-To: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
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

Series: drm/xe: use devm_add_action_or_reset() helper
URL   : https://patchwork.freedesktop.org/series/138672/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2530827ab017 drm-tip: 2024y-09m-13d-19h-54m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: use devm_add_action_or_reset() helper


