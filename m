Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF09C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 23:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFA710F49B;
	Thu, 23 May 2024 23:06:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203A10EE9D;
 Thu, 23 May 2024 23:06:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF=3A_Use_the_runtime_reg?=
 =?utf-8?q?isters_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 23:06:16 -0000
Message-ID: <171650557638.2171858.4931221362455528404@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

Series: VF: Use the runtime registers (rev2)
URL   : https://patchwork.freedesktop.org/series/133989/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ec986c44cecb673bdf502043190b8f7e8d7601e0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu May 23 21:22:40 2024 +0200

    drm/xe/vf: Treat GMDID as another runtime register
    
    While the GMDID registers are not part of the runtime register list
    shared by the PF driver, we may still return cached values from our
    VF specific read32() helper function.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 1385623a20ad940dab90bfaa4bc01fe599506e09 drm-intel
355b504f44b2 drm/xe/vf: Use register values obtained from the PF
7354c51c80e3 drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
c0d566240c60 drm/xe/vf: Obtain value of GMDID register from GuC
2d1f4282342d drm/xe/vf: Provide early access to GMDID register
0bec6355279f drm/xe/vf: Cache value of the GMDID register
ec986c44cecb drm/xe/vf: Treat GMDID as another runtime register


