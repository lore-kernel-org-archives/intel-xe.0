Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C0AC54788
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 01:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB2C10E021;
	Thu, 22 Feb 2024 01:11:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47F010E021;
 Thu, 22 Feb 2024 01:11:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drivers/i915/intel?=
 =?utf-8?q?=5Fbios=3A_Fix_parsing_backlight_BDB_data_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthikeyan Ramasubramanian" <kramasub@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 01:11:42 -0000
Message-ID: <170856430266.197499.1426641634109001687@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
In-Reply-To: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
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

Series: drivers/i915/intel_bios: Fix parsing backlight BDB data (rev2)
URL   : https://patchwork.freedesktop.org/series/130153/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 06b279b4fb58 drm-tip: 2024y-02m-21d-19h-24m-29s UTC integration manifest
=== git am output follows ===
Applying: drivers/i915/intel_bios: Fix parsing backlight BDB data


