Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F63DC5B549
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 05:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E40310E377;
	Fri,  6 Jun 2025 05:31:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D480D10E360;
 Fri,  6 Jun 2025 05:31:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Imple?=
 =?utf-8?q?ment_wa=5F16011342517_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 05:31:43 -0000
Message-ID: <174918790386.54481.4456321829469492636@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605105432.1273182-1-nemesa.garg@intel.com>
In-Reply-To: <20250605105432.1273182-1-nemesa.garg@intel.com>
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

Series: drm/i915/display: Implement wa_16011342517 (rev3)
URL   : https://patchwork.freedesktop.org/series/149119/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 200bbaef147c0823ff4c6bb84931674aae654d90
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Thu Jun 5 16:24:32 2025 +0530

    drm/i915/display: Implement wa_16011342517
    
    While doing voltage swing for type-c phy
    for DP 1.62 and HDMI write the
    LOADGEN_SHARING_PMD_DISABLE bit to 1.
    
    -v2: Update commit.
         Add bspec[Suraj]
    -v3: Move w/a before DKL_TX_PMD_LANE_SUS.
         Use DKL_TX_DPCNTL2[Ville]
    
    Bspec: 55359
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch ca806266c08d102d6f2e85b7b7db0d6454261de5 drm-intel
200bbaef147c drm/i915/display: Implement wa_16011342517


