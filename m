Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0064FC5DF67
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 07:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1C210E170;
	Tue, 18 Aug 2026 07:52:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892E10E187;
 Tue, 18 Aug 2026 07:52:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/xe=5Fdrm=5Fras=3A_Enabl?=
 =?utf-8?q?e_CONFIG=5FDRM=5FRAS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 07:52:54 -0000
Message-ID: <178703957442.61185.12626789688505984513@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260818075454.1508724-2-balasubramani.vivekanandan@intel.com>
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

Series: drm/xe/xe_drm_ras: Enable CONFIG_DRM_RAS
URL   : https://patchwork.freedesktop.org/series/172374/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:/usr/bin/ld: drivers/gpu/drm/drm_ras.o: in function `msg_reply_value':
drm_ras.c:(.text+0x182): undefined reference to `nla_put'
/usr/bin/ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_error_event':
drm_ras.c:(.text+0x2ca): undefined reference to `__alloc_skb'
/usr/bin/ld: drm_ras.c:(.text+0x303): undefined reference to `genlmsg_put'
/usr/bin/ld: drm_ras.c:(.text+0x33b): undefined reference to `nla_put'
/usr/bin/ld: drm_ras.c:(.text+0x377): undefined reference to `skb_trim'
/usr/bin/ld: drm_ras.c:(.text+0x38d): undefined reference to `sk_skb_reason_drop'
/usr/bin/ld: drm_ras.c:(.text+0x4c3): undefined reference to `genlmsg_multicast_allns'
/usr/bin/ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_list_nodes_dumpit':
drm_ras.c:(.text+0x5b9): undefined reference to `nla_put'
/usr/bin/ld: drm_ras.c:(.text+0x6f1): undefined reference to `genlmsg_put'
/usr/bin/ld: drm_ras.c:(.text+0x74f): undefined reference to `skb_trim'
/usr/bin/ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_get_error_counter_dumpit':
drm_ras.c:(.text+0x888): undefined reference to `genlmsg_put'
/usr/bin/ld: drm_ras.c:(.text+0x920): undefined reference to `skb_trim'
/usr/bin/ld: drivers/gpu/drm/drm_ras.o: in function `drm_ras_nl_get_error_counter_doit':
drm_ras.c:(.text+0xa2d): undefined reference to `__alloc_skb'
/usr/bin/ld: drm_ras.c:(.text+0xa64): undefined reference to `genlmsg_put'
/usr/bin/ld: drm_ras.c:(.text+0xaf9): undefined reference to `init_net'
/usr/bin/ld: drm_ras.c:(.text+0xb06): undefined reference to `netlink_unicast'
/usr/bin/ld: drm_ras.c:(.text+0xb4c): undefined reference to `skb_trim'
/usr/bin/ld: drm_ras.c:(.text+0xb62): undefined reference to `sk_skb_reason_drop'
/usr/bin/ld: drm_ras.c:(.text+0xc0a): undefined reference to `sk_skb_reason_drop'
/usr/bin/ld: drivers/gpu/drm/drm_ras_genl_family.o: in function `drm_ras_genl_family_register':
drm_ras_genl_family.c:(.text+0x1b): undefined reference to `genl_register_family'
/usr/bin/ld: drivers/gpu/drm/drm_ras_genl_family.o: in function `drm_ras_genl_family_unregister':
drm_ras_genl_family.c:(.text+0x68): undefined reference to `genl_unregister_family'
collect2: error: ld returned 1 exit status
make[3]: *** [../scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[2]: *** [/kernel/Makefile:1370: vmlinux] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[07:52:13] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:52:18] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


