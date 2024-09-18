Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89087CCD1A5
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 13:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5768110E5A1;
	Wed, 18 Sep 2024 13:38:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27AB10E5A1;
 Wed, 18 Sep 2024 13:38:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_memirq_infra_changes_=28r?=
 =?utf-8?q?ev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 13:38:28 -0000
Message-ID: <172666670872.1026290.13339809939187662408@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918053942.1331811-1-illevi@habana.ai>
In-Reply-To: <20240918053942.1331811-1-illevi@habana.ai>
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

Series: memirq infra changes (rev8)
URL   : https://patchwork.freedesktop.org/series/137643/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9fa8221b4533ad8a809ca35f896cf0656d2b56e9
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Wed Sep 18 08:39:42 2024 +0300

    drm/xe: memirq handler changes
    
    Expose an interrupt processing handler for a single hw engine.
    Refactor code to use this handler from the VF.
    This handler also caters for the MSI-X mode, where the hardware engines
    report interrupt source and status to the offset of engine instance zero
    (this usage will be introduced in upcoming MSI-X enabling series).
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 692d461fa9a48c6600df07421a99308f49cf00a9 drm-intel
e28433e50035 drm/xe: Introduce dedicated config for memirq debug
-:50: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'm' - possible side-effects?
#50: FILE: drivers/gpu/drm/xe/xe_memirq.c:25:
+#define memirq_printk(m, _level, _fmt, ...)			\
+	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
+		     memirq_to_tile(m)->id, ##__VA_ARGS__)

total: 0 errors, 0 warnings, 1 checks, 76 lines checked
98442c106c73 drm/xe: Introduce xe_device_uses_memirq()
d309e72768d0 drm/xe: move memirq out of VF
3767098eaf03 drm/xe: memirq infra changes for MSI-X
9fa8221b4533 drm/xe: memirq handler changes


