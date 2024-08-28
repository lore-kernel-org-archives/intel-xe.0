Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0552FC54FAA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 13:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC70A10E527;
	Wed, 28 Aug 2024 13:13:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273E610E50F;
 Wed, 28 Aug 2024 13:13:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_prevent_potenti?=
 =?utf-8?q?al_UAF_in_pf=5Fprovision=5Fvf=5Fggtt=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 13:13:26 -0000
Message-ID: <172485080615.827121.13690915566221997502@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828104341.180111-2-matthew.auld@intel.com>
In-Reply-To: <20240828104341.180111-2-matthew.auld@intel.com>
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

Series: drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
URL   : https://patchwork.freedesktop.org/series/137906/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c3cee2c6d12a5784694776208911d063e7181951
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Aug 28 11:43:42 2024 +0100

    drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
    
    The node ptr can point to an already freed ptr, if we hit the path with
    an already allocated node. We later dereference that pointer with:
    
            xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
    
    which is a potential UAF. Fix this by not stashing the ptr for node.
    Also since it is likely a bad idea to leave config->ggtt_region pointing
    to a stale ptr, also set that to NULL by calling
    pf_release_vf_config_ggtt() instead of pf_release_ggtt().
    
    Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 3d18c558b87ad1c2d6d59ea1c56603a01e84ab88 drm-intel
c3cee2c6d12a drm/xe: prevent potential UAF in pf_provision_vf_ggtt()


