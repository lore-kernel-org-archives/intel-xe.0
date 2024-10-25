Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5A2D116E4
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 03:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4385610E9EB;
	Fri, 25 Oct 2024 03:33:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D8E10E9EB;
 Fri, 25 Oct 2024 03:33:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/guc=3A_Fix_de?=
 =?utf-8?q?reference_before_NULL_check_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 03:33:31 -0000
Message-ID: <172982721120.1330678.16040091430471600672@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023233356.5479-1-everestkc@everestkc.com.np>
In-Reply-To: <20241023233356.5479-1-everestkc@everestkc.com.np>
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

Series: drm/xe/guc: Fix dereference before NULL check (rev5)
URL   : https://patchwork.freedesktop.org/series/139890/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 75eab7b9ee32 drm-tip: 2024y-10m-25d-01h-19m-09s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Fix dereference before NULL check


