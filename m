Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED387C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 18:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83810EF3F;
	Thu,  9 May 2024 18:55:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E84A10EF3F;
 Thu,  9 May 2024 18:55:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/5=5D_drm/xe=3A_Drop_=5F=5Fengine=5Fmask_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 18:55:49 -0000
Message-ID: <171528094965.2038581.8722203872604047602@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,1/5] drm/xe: Drop __engine_mask (rev2)
URL   : https://patchwork.freedesktop.org/series/133360/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa49973937d766c042fe3cd4bdfe0870a59bc407
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed May 8 21:12:25 2024 -0700

    drm/xe: Move sw-only pcode initialization
    
    Move it to xe_gt_init_early() that initializes the sw-only part for each
    gt.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 31ab65c31f1818741354092fba7308fba098b1cd drm-intel
ba333977bb78 drm/xe: Drop __engine_mask
f013e7728092 drm/xe: Drop useless forcewake get/put
7bd881277b2d drm/xe: Move xe_gt_init_early() where it belongs
bcbb6003e65b drm/xe: Move xe_force_wake_init_gt() inside gt initialization
aa49973937d7 drm/xe: Move sw-only pcode initialization


