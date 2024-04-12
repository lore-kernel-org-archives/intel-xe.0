Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC7C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 08:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0A510F4CA;
	Fri, 12 Apr 2024 08:15:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BAB10F4CA;
 Fri, 12 Apr 2024 08:15:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleanup_and_fixes_in_drmm?=
 =?utf-8?q?=5Fadd=5Faction=5For=5Freset_usage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Apr 2024 08:15:44 -0000
Message-ID: <171290974479.1353756.11837343122509965581@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev3)
URL   : https://patchwork.freedesktop.org/series/132150/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c87357e7f6655908c0934a4f55fadf5b9aa9e88f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 64197b98cabc47bdb6b35e880a80ded15083368e
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Apr 12 13:32:45 2024 +0530

    drm/xe/pm: Capture errors and handle them
    
    xe_pm_init may encounter failures for various reasons, such as a failure
    in initializing drmm_mutex, or when dealing with a d3cold-capable device
    for vram_threshold sysfs creation and setting default threshold.
    Presently, all these potential failures are disregarded.
    
    Move d3cold.lock initialization to xe_pm_init_early and cause driver
    abort if mutex initialization has failed.
    
    Warn about failure to create and setting default threshold.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch d9073a139e9edfd27d830c9c4af9683651044aff drm-intel
898365bef395 drm/xe: Simplify function return using drmm_add_action_or_reset()
a1cae1496209 drm/xe: Incase of action add failure, remove sysfs only once
4e5feb88dfe1 drm/xe: Incase of action add failure, free_gsc_pkt only once
2da6d80a5c05 drm/xe: Return NULL incase of drmm_add_action_or_reset failure
e4e08c02c510 drm/xe/gt: Abort driver load for sysfs creation failure
fd8630e2da2b drm/xe/tile: Abort driver load for sysfs creation failure
64197b98cabc drm/xe/pm: Capture errors and handle them


