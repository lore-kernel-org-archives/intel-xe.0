Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A5CC5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 17:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D312110E0B1;
	Fri, 23 Feb 2024 17:15:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4910E07C;
 Fri, 23 Feb 2024 17:15:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?Save_a_few_bytes_of_memory_in_intel=5Fbacklight=5Fdevice=5Fregist?=
 =?utf-8?q?er=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 17:15:18 -0000
Message-ID: <170870851885.264199.11330256569431729315@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
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

Series: drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()
URL   : https://patchwork.freedesktop.org/series/130317/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aed3f498154b drm-tip: 2024y-02m-23d-16h-07m-35s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Save a few bytes of memory in intel_backlight_device_register()


