Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFFEC2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 07:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0168810E376;
	Mon, 24 Jun 2024 07:20:57 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF7410E376;
 Mon, 24 Jun 2024 07:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_remove_GuC_relo?=
 =?utf-8?q?ad_in_D3Hot_path_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 07:20:55 -0000
Message-ID: <171921365591.152270.7811916881710450561@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624072754.2231533-1-riana.tauro@intel.com>
In-Reply-To: <20240624072754.2231533-1-riana.tauro@intel.com>
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

Series: drm/xe: remove GuC reload in D3Hot path (rev2)
URL   : https://patchwork.freedesktop.org/series/135265/
State : warning

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
commit 4d91c7729dd8e60bb8ab924aa1c2567418ff8e47
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jun 24 12:57:54 2024 +0530

    drm/xe: remove GuC reload in D3Hot path
    
    Currently GuC is reloaded for both runtime suspend
    and system suspend. For D3hot <-> D0 transitions
    no power is lost on suspend and GuC reload is not
    necessary.
    
    remove GuC reload from D3Hot path and only enable/disable
    CTB communications
    
    v2: rebase
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 408377d4531a823b039c0df70dfb2abfb028d0ea drm-intel
4d91c7729dd8 drm/xe: remove GuC reload in D3Hot path
-:224: WARNING:MEMORY_BARRIER: memory barrier without comment
#224: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:419:
+	smp_mb();

total: 0 errors, 1 warnings, 0 checks, 268 lines checked


