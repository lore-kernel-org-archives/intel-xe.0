Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C6C3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 00:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513310E0A5;
	Sat,  6 Jan 2024 00:06:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F6610E076;
 Sat,  6 Jan 2024 00:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe/device=3A_cle?=
 =?utf-8?q?an_up_on_error_in_probe=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Sat, 06 Jan 2024 00:06:57 -0000
Message-ID: <170449961716.40937.16391302510404510945@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
In-Reply-To: <c8984fe2-dc1a-4ba8-97c9-5c83f53a0d09@moroto.mountain>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/device: clean up on error in probe()
URL   : https://patchwork.freedesktop.org/series/128272/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: cca0607b6 drm/xe: Fix compilation without CONFIG_KUNIT
=== git am output follows ===
Applying: drm/xe/device: clean up on error in probe()


