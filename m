Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CC9C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 15:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0D310F6D9;
	Wed, 17 Apr 2024 15:38:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881E310F6D9;
 Wed, 17 Apr 2024 15:38:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Define_all_poss?=
 =?utf-8?q?ible_engines_in_media_IP_descriptors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 15:38:43 -0000
Message-ID: <171336832355.1465187.17332205881165891597@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
In-Reply-To: <20240417152621.3357990-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Define all possible engines in media IP descriptors
URL   : https://patchwork.freedesktop.org/series/132568/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8fcb91b4e5ef6a45f8a3f0a7d41572e8e9573687
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Apr 17 08:26:22 2024 -0700

    drm/xe: Define all possible engines in media IP descriptors
    
    Rather than trying to identify exactly which engines are available on
    each platform in the IP descriptor, just include the list of all media
    engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
    We still rely on the media fuse registers to tell us which specific
    engine instances are actually present on a given platform, so there
    shouldn't be any functional change.  This will help prevent mistakes
    with engine numbering (for example ambiguity about whether the 2nd VCS
    engine on a platform with exactly two engines is numbered "VCS1" or
    "VCS2") and will also future-proof the code a bit more in case new SKUs
    or platform refreshes extend the engine list in the future.
    
    Note that the media fuse register technically has an 8-bit field for
    VECS engine presence starting on Xe2.  However there's still no MMIO
    register range reserved for VE engines above VECS3, so VE0-VE3 is still
    consider the "maximum" VE engine mask that the driver can support for
    now.
    
    Bspec: 52614, 52615, 62567
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch d9ed10db0dab988accaf881038e3e371f12ed5d5 drm-intel
8fcb91b4e5ef drm/xe: Define all possible engines in media IP descriptors


