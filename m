Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7082FC5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 09:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330F210E4C7;
	Tue, 10 Jun 2025 09:23:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9F410E4C6;
 Tue, 10 Jun 2025 09:23:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_A_few_drm=5Fsyncobj_opti?=
 =?utf-8?q?misations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 09:23:55 -0000
Message-ID: <174954743576.62603.3814551349956220392@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
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

Series: A few drm_syncobj optimisations (rev2)
URL   : https://patchwork.freedesktop.org/series/149983/
State : warning

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
+ /root/linux/maintainer-tools/dim sparse --fast 52ecbb6a68785860c776b29f58792d9807243979
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/drm_syncobj.c:1108:47:    expected void *to
+drivers/gpu/drm/drm_syncobj.c:1108:47:    got unsigned long long [noderef] [usertype] __user *
+drivers/gpu/drm/drm_syncobj.c:1108:47: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/drm_syncobj.c:1108:59:    expected void const [noderef] __user *from
+drivers/gpu/drm/drm_syncobj.c:1108:59:    got unsigned long long *
+drivers/gpu/drm/drm_syncobj.c:1108:59: warning: incorrect type in argument 2 (different address spaces)
+drivers/gpu/drm/drm_syncobj.c:1671:52:    expected void *to
+drivers/gpu/drm/drm_syncobj.c:1671:52:    got unsigned long long [noderef] [usertype] __user *
+drivers/gpu/drm/drm_syncobj.c:1671:52: warning: incorrect type in argument 1 (different address spaces)
+drivers/gpu/drm/drm_syncobj.c:1671:57:    expected void const [noderef] __user *from
+drivers/gpu/drm/drm_syncobj.c:1671:57:    got unsigned long long *
+drivers/gpu/drm/drm_syncobj.c:1671:57: warning: incorrect type in argument 2 (different address spaces)

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


