Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61BC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006FE10E192;
	Tue, 28 May 2024 20:54:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69A10E250;
 Tue, 28 May 2024 20:54:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Postpone_GT_?=
 =?utf-8?q?topology_initialization_if_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 20:54:34 -0000
Message-ID: <171692967431.2216896.10045478431204469296@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528204837.1196-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240528204837.1196-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Postpone GT topology initialization if VF
URL   : https://patchwork.freedesktop.org/series/134157/
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
commit 6a3eaedccfd9e611f14e9be38f416133a11ae27d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue May 28 22:48:37 2024 +0200

    drm/xe/vf: Postpone GT topology initialization if VF
    
    We can't properly initialize GT topology without knowing the
    values of the fuse registers. However, VF drivers will learn
    those values only after establishing communication with the
    GuC and the PF. While we need GT topology to correctly setup
    MCR, which is required to program HW PAT table, both steps are
    only applicable to the PF driver. For VF driver case, we can
    postpone all these steps after xe_uc_init_hwconfig().
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch db83f92349d0b60125cb1896e0e8383a15dd46de drm-intel
6a3eaedccfd9 drm/xe/vf: Postpone GT topology initialization if VF


