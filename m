Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A48BC25B79
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 18:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0E10E07F;
	Fri, 24 May 2024 18:45:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D66C10E07F;
 Fri, 24 May 2024 18:45:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_Coarse_Power_Gatin?=
 =?utf-8?q?g_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 May 2024 18:45:53 -0000
Message-ID: <171657635351.2187932.2968781504587215728@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524070916.143022-1-riana.tauro@intel.com>
In-Reply-To: <20240524070916.143022-1-riana.tauro@intel.com>
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

Series: Enable Coarse Power Gating (rev2)
URL   : https://patchwork.freedesktop.org/series/134001/
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
commit 0d636eb7a8a1f85e165bc5b0b77492771250498b
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri May 24 12:39:16 2024 +0530

    drm/xe: Enable Coarse Power Gating
    
    Enable power gating for all units and sub-pipes that
    are disabled by default.
    
    v2: change the init function name
        use symmetric calls for enable/disable pg
        re-pharase commit message (Rodrigo)
        modify the sub-pipe power gating condition
    
    v3: set hysteresis value for render and media
        when GuC PC is disabled
        skip CPG for PVC (Vinay)
    
    v4: rebase
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v2
+ /mt/dim checkpatch 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f drm-intel
6930cace1c15 drm/xe: Standardize power gate registers
0d636eb7a8a1 drm/xe: Enable Coarse Power Gating


