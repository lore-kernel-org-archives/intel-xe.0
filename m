Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73F9D26D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 16:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8760310E11E;
	Fri,  9 Jan 2026 16:49:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8D310E11E;
 Fri,  9 Jan 2026 16:49:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/eustall=3A_use_bit?=
 =?utf-8?q?map=5Fweighted=5For=28=29_in_xe=5Feu=5Fstall=5Fstream=5Finit=28?=
 =?utf-8?q?=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yury Norov" <yury.norov@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Jan 2026 16:49:36 -0000
Message-ID: <176797737690.141900.1553676408336342635@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260109160526.183574-2-rodrigo.vivi@intel.com>
In-Reply-To: <20260109160526.183574-2-rodrigo.vivi@intel.com>
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

Series: drm/xe/eustall: use bitmap_weighted_or() in xe_eu_stall_stream_init() (rev2)
URL   : https://patchwork.freedesktop.org/series/159059/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e922adf96b880ffb91c02bb8296b972e1a0921de
Author: Yury Norov (NVIDIA) <yury.norov@gmail.com>
Date:   Fri Jan 9 11:05:27 2026 -0500

    drm/xe/eustall: use bitmap_weighted_or() in xe_eu_stall_stream_init()
    
    Commit 437cb3ded2503 ("cpumask: Introduce cpumask_weighted_or()") added
    the new helper, which fits well here. Use it.
    
    Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 440d2cb5f3dfa9cbbfda4cc18a5ad8541bb1d07e drm-intel
e922adf96b88 drm/xe/eustall: use bitmap_weighted_or() in xe_eu_stall_stream_init()
-:26: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#26: FILE: drivers/gpu/drm/xe/xe_eu_stall.c:741:
+	num_xecores = bitmap_weighted_or(all_xecores, gt->fuse_topo.g_dss_mask,
+						      gt->fuse_topo.c_dss_mask,

total: 0 errors, 0 warnings, 1 checks, 12 lines checked


