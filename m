Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170E3CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 18:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CD910ECDC;
	Wed, 10 Apr 2024 18:25:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7313610ED57;
 Wed, 10 Apr 2024 18:24:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_xe=5Fguc=5F?=
 =?utf-8?q?ads=2Ec_to_uses=5Fgenerated=5Foob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 18:24:57 -0000
Message-ID: <171277349747.1338744.17730542924837886891@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
In-Reply-To: <20240410-drm-xe-fix-xe_guc_ads-using-xe_wa_oob-v1-1-441f2d8e5d83@kernel.org>
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

Series: drm/xe: Add xe_guc_ads.c to uses_generated_oob
URL   : https://patchwork.freedesktop.org/series/132295/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4108cbb9ada36a2b0f5cf8974efa9a2056986d3b
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Apr 10 11:16:11 2024 -0700

    drm/xe: Add xe_guc_ads.c to uses_generated_oob
    
    A recent change added a use of xe_wa_oob.h without adding the file that
    uses it to uses_generated_oob, which means xe_wa_oob.h does not get
    properly generated before attempting to build the object file:
    
        LINK     resolve_btfids
        CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
      drivers/gpu/drm/xe/xe_guc_ads.c:10:10: fatal error: generated/xe_wa_oob.h: No such file or directory
         10 | #include <generated/xe_wa_oob.h>
            |          ^~~~~~~~~~~~~~~~~~~~~~~
    
    After adding '$(obj)/xe_guc_ads.o' to uses_generated_oob, xe_wa_oob.h is
    always generated before building the file, resulting in no errors:
    
        LINK     resolve_btfids
        HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
        GEN     xe_wa_oob.c xe_wa_oob.h
        CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
    
    Fixes: c151ff5c9053 ("drm/xe/lnl: Enable GuC Wa_14019882105")
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
+ /mt/dim checkpatch 3658e2ec471a1d67baa30a554583bcdd4be55857 drm-intel
4108cbb9ada3 drm/xe: Add xe_guc_ads.c to uses_generated_oob


