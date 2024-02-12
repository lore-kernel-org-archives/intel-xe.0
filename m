Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785CBC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 16:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333F310E7A4;
	Mon, 12 Feb 2024 16:15:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366B10E638;
 Mon, 12 Feb 2024 16:15:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Prefer_str?=
 =?utf-8?q?uct=5Fsize_over_open_coded_arithmetic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erick Archer" <erick.archer@gmx.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 16:15:05 -0000
Message-ID: <170775450579.1183156.4449484330464293773@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240210141913.6611-1-erick.archer@gmx.com>
In-Reply-To: <20240210141913.6611-1-erick.archer@gmx.com>
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

Series: drm/xe: Prefer struct_size over open coded arithmetic
URL   : https://patchwork.freedesktop.org/series/129775/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 46cf1a7da drm-tip: 2024y-02m-12d-12h-00m-34s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Prefer struct_size over open coded arithmetic


