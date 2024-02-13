Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB479C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2D510E7EB;
	Tue, 13 Feb 2024 15:50:31 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5D510E7EB;
 Tue, 13 Feb 2024 15:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF_Tweaks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 15:50:30 -0000
Message-ID: <170783943063.1201024.7458000697540003425@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213154355.1221-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240213154355.1221-1-michal.wajdeczko@intel.com>
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

Series: VF Tweaks (rev2)
URL   : https://patchwork.freedesktop.org/series/128727/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6664f50728be76cea13b1749a650b1bcd3e45d93
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Feb 13 16:43:55 2024 +0100

    drm/xe/vf: Don't support MCR registers if VF
    
    VF drivers can't operate on MCR registers.  Make sure that driver
    is not trying to read nor write using any of MCR register.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 2b708de78c7e0c660fdb491796e68f70fe56a6a1 drm-intel
fd1c89a7e drm/xe/vf: Assume fixed GSM size if VF
7605821d9 drm/xe/vf: Don't try to capture engine data unavailable to VF
f309c2cc5 drm/xe/vf: Don't program MOCS if VF
c071a694c drm/xe/vf: Don't initialize stolen memory manager if VF
89f9f1c9e drm/xe/vf: Don't check if LMEM is initialized if VF
a096f9c04 drm/xe/vf: Don't enable hwmon if VF
ab8e10943 drm/xe/vf: Don't program PAT if VF
6664f5072 drm/xe/vf: Don't support MCR registers if VF


