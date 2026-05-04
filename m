Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7CDFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 19:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C757D89322;
	Mon,  4 May 2026 19:29:36 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710A089322;
 Mon,  4 May 2026 19:29:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Proposal_for_in-band_firmware_?=
 =?utf-8?q?update_over_PLDM-MCTP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 19:29:35 -0000
Message-ID: <177792297545.36644.14157278167298754322@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504193420.1232842-3-badal.nilawar@intel.com>
In-Reply-To: <20260504193420.1232842-3-badal.nilawar@intel.com>
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

Series: Proposal for in-band firmware update over PLDM-MCTP
URL   : https://patchwork.freedesktop.org/series/165927/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[19:28:55] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[19:28:59] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:/usr/bin/ld: drivers/gpu/drm/xe/xe_mctp_mailbox.o: in function `xe_mctp_mailbox_fini':
xe_mctp_mailbox.c:(.text+0x9f): undefined reference to `mctp_unregister_netdev'
/usr/bin/ld: xe_mctp_mailbox.c:(.text+0xb0): undefined reference to `free_netdev'
/usr/bin/ld: drivers/gpu/drm/xe/xe_mctp_mailbox.o: in function `mctp_mailbox_start_xmit':
xe_mctp_mailbox.c:(.text+0x135): undefined reference to `sk_skb_reason_drop'
/usr/bin/ld: drivers/gpu/drm/xe/xe_mctp_mailbox.o: in function `xe_mctp_mailbox_init':
xe_mctp_mailbox.c:(.text+0x2c1): undefined reference to `alloc_netdev_mqs'
/usr/bin/ld: xe_mctp_mailbox.c:(.text+0x2fc): undefined reference to `mctp_register_netdev'
/usr/bin/ld: xe_mctp_mailbox.c:(.text+0x432): undefined reference to `free_netdev'
/usr/bin/ld: xe_mctp_mailbox.c:(.text+0x448): undefined reference to `mctp_unregister_netdev'
/usr/bin/ld: xe_mctp_mailbox.c:(.text+0x45a): undefined reference to `free_netdev'
collect2: error: ld returned 1 exit status
make[3]: *** [../scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[2]: *** [/kernel/Makefile:1335: vmlinux] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


