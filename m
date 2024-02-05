Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC52C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 13:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A430910FE8F;
	Mon,  5 Feb 2024 13:53:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6393D10FA01;
 Mon,  5 Feb 2024 13:53:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?b?4pyTIENJLmNoZWNrc3BhcnNlOiBzdWNjZXNzIGZvciBkcm0veGU6IERlY2xhcmUg?=
 =?utf-8?b?X194ZV9scmNfKl9nZ3R0X2FkZHIgd2l0aCBfX21heWJlX191bnVzZWQ=?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dawei Li" <dawei.li@shingroup.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 13:53:10 -0000
Message-ID: <170714119041.1024443.5899172262652626545@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240204062324.3548268-1-dawei.li@shingroup.cn>
In-Reply-To: <20240204062324.3548268-1-dawei.li@shingroup.cn>
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

Series: drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
URL   : https://patchwork.freedesktop.org/series/129541/
State : success

== Summary ==

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast 89404d6657779870d0d97f80a267f75a36c6744b
Sparse version: 0.6.1 (Ubuntu: 0.6.1-2build1)
Fast mode used, each commit won't be checked separately.
Okay!

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


