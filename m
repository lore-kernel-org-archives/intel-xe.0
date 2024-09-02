Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B2FCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 19:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E388D10E08B;
	Mon,  2 Sep 2024 19:55:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CD710E08B;
 Mon,  2 Sep 2024 19:55:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Sanitize_VF_?=
 =?utf-8?q?scratch_registers_on_FLR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Sep 2024 19:55:29 -0000
Message-ID: <172530692932.908310.16327644686041180528@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240902192953.1792-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240902192953.1792-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Sanitize VF scratch registers on FLR
URL   : https://patchwork.freedesktop.org/series/138113/
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
commit ee91850ace73d649c975c878cae8c7bda96b6824
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Sep 2 21:29:53 2024 +0200

    drm/xe/pf: Sanitize VF scratch registers on FLR
    
    Some VF accessible registers (like GuC scratch registers) must be
    explicitly reset during the FLR. While this is today done by the GuC
    firmware, according to the design, this should be responsibility of
    the PF driver, as future platforms may require more registers to be
    reset. Likewise GuC, the PF can access VFs registers by adding some
    platform specific offset to the original register address.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30 drm-intel
ee91850ace73 drm/xe/pf: Sanitize VF scratch registers on FLR


