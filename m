Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AE4C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 15:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289EC10EB4C;
	Fri, 12 Jan 2024 15:30:25 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A73910EB4C;
 Fri, 12 Jan 2024 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_VF_Tweaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 12 Jan 2024 15:30:24 -0000
Message-ID: <170507342450.338258.17448814257601193337@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240112152649.849-1-michal.wajdeczko@intel.com>
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

Series: VF Tweaks
URL   : https://patchwork.freedesktop.org/series/128727/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8adb963b53b104d7bf6bdeff2fbbca4a2fd6c1c2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jan 12 16:26:49 2024 +0100

    drm/xe/vf: Don't support MCR registers if VF
    
    VF drivers can't operate on MCR registers.  Make sure that driver
    is not trying to read nor write using any of MCR register.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 7a20187068bed91b523795a18219e570f1e84eb1 drm-intel
e6fd7996d drm/xe/vf: Assume fixed GSM size if VF
aac827344 drm/xe/vf: Don't try to capture engine data unavailable to VF
0155406c4 drm/xe/vf: Don't program MOCS if VF
420767648 drm/xe/vf: Don't initialize stolen memory manager if VF
3127fc91c drm/xe/vf: Don't check if LMEM is initialized if VF
2b1775b45 drm/xe/vf: Don't enable hwmon if VF
a9af12596 drm/xe/vf: Don't program PAT if VF
8adb963b5 drm/xe/vf: Don't support MCR registers if VF


