Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6ABC0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 19:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0724B10E77A;
	Fri, 28 Jul 2023 19:04:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5085410E77A;
 Fri, 28 Jul 2023 19:04:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C344AADF1;
 Fri, 28 Jul 2023 19:04:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 28 Jul 2023 19:04:56 -0000
Message-ID: <169057109630.19731.17943886414772278542@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230728175601.2343755-2-matthew.d.roper@intel.com>
In-Reply-To: <20230728175601.2343755-2-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/mtl=3A_Reduce_Wa=5F14018575942_scope_to_the_CCS_engine?=
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

Series: drm/xe/mtl: Reduce Wa_14018575942 scope to the CCS engine
URL   : https://patchwork.freedesktop.org/series/121542/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36c8bb02198c8998740ac9ec97d57dfbf9cd2113
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Jul 28 10:56:02 2023 -0700

    drm/xe/mtl: Reduce Wa_14018575942 scope to the CCS engine
    
    The MTL version of Wa_14018575942 has been updated to suggest only
    applying the register change on the CCS engine.
    
    Note that DG2 and PVC have a functionally equivalent workaround with
    Wa_18018781329; for now that one is still applying to all engines,
    although we'll keep an eye on it in case it changes to be CCS-specific
    too.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 353cf75540219b45ed346f2a3ba9418297278472 drm-intel
36c8bb021 drm/xe/mtl: Reduce Wa_14018575942 scope to the CCS engine


