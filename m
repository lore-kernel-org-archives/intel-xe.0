Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84EBC27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 12:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335F10E142;
	Thu, 30 May 2024 12:05:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62810E142;
 Thu, 30 May 2024 12:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Split_MCR_initi?=
 =?utf-8?q?alization_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 12:05:49 -0000
Message-ID: <171707074956.2238249.16651179718243517455@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240529162945.1240-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240529162945.1240-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Split MCR initialization (rev2)
URL   : https://patchwork.freedesktop.org/series/134196/
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
commit 7ae41d416861de4f55610a60047aa74387506db1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu May 30 13:58:14 2024 +0200

    drm/xe: Split MCR initialization
    
    The initialization order of GT topology, MCR, PAT and GuC HWconfig
    as done today by native/PF driver, can't be followed as-is by the
    VF driver, since fuse registers used in GT topology discovery will
    be obtained by the VF driver from the GuC in HWconfig step.
    
    While native/PF drivers need to program the HW PAT table prior to
    loading the GuC, this requires only multicast writes support from
    the MCR code, which could be initialized separately from the full
    MCR support that requires the GT topology to setup steering data.
    
    Split MCR initialization into two steps to avoid introducing VF
    specific code paths. This also fixes duplicated spin_lock inits.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4a32411a2b73e515af2cc54034ef686e03df8385 drm-intel
7ae41d416861 drm/xe: Split MCR initialization


