Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04141C3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 05:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFE10E88E;
	Thu,  1 Aug 2024 05:52:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B2B10E88E;
 Thu,  1 Aug 2024 05:52:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_GuC_relo?=
 =?utf-8?q?ad_in_D3Hot_path_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 05:52:46 -0000
Message-ID: <172249156659.486299.15910953229904272568@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801055941.1187878-1-riana.tauro@intel.com>
In-Reply-To: <20240801055941.1187878-1-riana.tauro@intel.com>
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

Series: drm/xe: remove GuC reload in D3Hot path (rev5)
URL   : https://patchwork.freedesktop.org/series/135265/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a96df9460cef67a5aaecd081865a6dd27ab82af0
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Aug 1 11:29:41 2024 +0530

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
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 171eab5202f1033b5f509bae5214c8d7853336eb drm-intel
d27fe036fe35 drm/xe: modify GuC CTB enable communication
a96df9460cef drm/xe: remove GuC reload in D3Hot path


