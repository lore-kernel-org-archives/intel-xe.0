Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A62CC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58710E96C;
	Wed, 17 Jul 2024 07:01:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CA510E96C;
 Wed, 17 Jul 2024 07:01:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_remove_GuC_relo?=
 =?utf-8?q?ad_in_D3Hot_path_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 07:01:23 -0000
Message-ID: <172119968361.254371.1004847609411983715@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717055558.4169407-1-riana.tauro@intel.com>
In-Reply-To: <20240717055558.4169407-1-riana.tauro@intel.com>
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

Series: drm/xe: remove GuC reload in D3Hot path (rev4)
URL   : https://patchwork.freedesktop.org/series/135265/
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
commit bc1f9d91a247bf5ead0996144c1bfcd69d19e3d4
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Jul 17 11:25:58 2024 +0530

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
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 49a697d7731bfbd13087d4167151cc91ec613f13 drm-intel
5f23bc6e58b5 drm/xe: modify GuC CTB enable communication
bc1f9d91a247 drm/xe: remove GuC reload in D3Hot path


