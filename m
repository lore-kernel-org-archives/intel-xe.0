Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F1ACD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 16:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A1C112869;
	Mon,  8 Apr 2024 16:58:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F065111286B;
 Mon,  8 Apr 2024 16:58:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Cleanup_and_fixes_in_drmm?=
 =?utf-8?q?=5Fadd=5Faction=5For=5Freset_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 16:58:47 -0000
Message-ID: <171259552798.1286010.5421551857478687549@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
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

Series: Cleanup and fixes in drmm_add_action_or_reset usage (rev2)
URL   : https://patchwork.freedesktop.org/series/132150/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f2a74096df8a8709fa3c9c11f140f03b26d4a3f2
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Apr 8 20:19:44 2024 +0530

    drm/xe: Return NULL incase of drmm_add_action_or_reset failure
    
    Incase of drmm_add_action_or_reset failure return NULL and no need
    to print warning messages as they will be printed implictly.
    
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch a533b51ca017728c1228432e8e1e9aba4fd65b02 drm-intel
890aea2a2dbd drm/xe: Simplify function return using drmm_add_action_or_reset()
45a424412669 drm/xe: Incase of action add failure, remove sysfs only once.
e15be19a220a drm/xe: Incase of action add failure, free_gsc_pkt only once.
f2a74096df8a drm/xe: Return NULL incase of drmm_add_action_or_reset failure


