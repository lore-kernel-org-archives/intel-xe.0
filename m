Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471BC52D71
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 13:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D7510E514;
	Wed,  7 Aug 2024 13:32:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CA410E514;
 Wed,  7 Aug 2024 13:32:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_GuC_relo?=
 =?utf-8?q?ad_in_D3Hot_path_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 13:32:59 -0000
Message-ID: <172303757913.546579.9879288322812151864@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240807134050.2048114-1-riana.tauro@intel.com>
In-Reply-To: <20240807134050.2048114-1-riana.tauro@intel.com>
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

Series: drm/xe: remove GuC reload in D3Hot path (rev6)
URL   : https://patchwork.freedesktop.org/series/135265/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4b0198c134dd0a220141cfd6bfe7b2efe1df15d
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Aug 7 19:10:50 2024 +0530

    drm/xe: remove GuC reload in D3Hot path
    
    Currently GuC is reloaded for both runtime resume and system resume.
    For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
    is not necessary.
    
    Remove GuC reload from D3Hot path and only enable/disable CTB
    communication.
    
    v2: rebase
    
    v3: fix commit message
        add kernel-doc for gt suspend and resume methods
        fix comment
        do not split register and enable calls of CT (Michal)
    
    v4: fix commit message
        fix comment (Karthik)
        split patches
        correct kernel-doc (Rodrigo)
    
    v5: do not expose internal function of CT layer (Michal)
        remove wait for outstanding g2h as it will be always zero,
        use assert instead (Matthew Brost)
        use runtime suspend and runtime resume pair for CT layer
        (Michal / Matthew Brost)
    
    v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
        assert and queue handler if g2h head and tail are
        not equal (Matthew Brost)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 4f5d551409fb5562ab0d732120e7ac9b698b5864 drm-intel
b486f2ef544c drm/xe: modify GuC CTB enable communication
e4b0198c134d drm/xe: remove GuC reload in D3Hot path


