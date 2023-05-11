Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45053C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 10:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEF710E5D0;
	Thu, 11 May 2023 10:08:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0123E10E21E;
 Thu, 11 May 2023 10:08:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F1C32AADD4;
 Thu, 11 May 2023 10:08:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Thu, 11 May 2023 10:08:04 -0000
Message-ID: <168379968498.29008.8802324995690479726@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230511094817.2734836-1-anshuman.gupta@intel.com>
In-Reply-To: <20230511094817.2734836-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/?=
 =?utf-8?q?pm=3A_WARN=5FON=28=29_on_unbounded_pcie_parent_bridge_device_?=
 =?utf-8?b?KHJldjIp?=
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

Series: drm/xe/pm: WARN_ON() on unbounded pcie parent bridge device (rev2)
URL   : https://patchwork.freedesktop.org/series/117445/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:make[1]: Entering directory '/kernel/.kunit'
***
*** The source tree is not clean, please run 'make ARCH=um mrproper'
*** in /kernel
***
make[1]: *** [/kernel/Makefile:646: outputmakefile] Error 1
make[1]: Leaving directory '/kernel/.kunit'
make: *** [Makefile:226: __sub-make] Error 2

[10:08:03] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


