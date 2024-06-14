Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22EFC27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 18:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19AC10EDDF;
	Fri, 14 Jun 2024 18:30:49 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8390E10EE1D;
 Fri, 14 Jun 2024 18:30:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpg=3A_Add_Wa?=
 =?utf-8?q?=5F14021490052?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 18:30:47 -0000
Message-ID: <171838984753.80112.3363409634442363073@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614182455.2370059-2-matthew.d.roper@intel.com>
In-Reply-To: <20240614182455.2370059-2-matthew.d.roper@intel.com>
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

Series: drm/xe/xe2lpg: Add Wa_14021490052
URL   : https://patchwork.freedesktop.org/series/134909/
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
commit 4b123e6b24aa15e797796e16581efc9a4337cecf
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Fri Jun 14 11:24:56 2024 -0700

    drm/xe/xe2lpg: Add Wa_14021490052
    
    Add Wa_14021490052 for Xe2LPG 20.04.
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 5c623c9712af3170cc9782a10ed7360ddf8f8bb4 drm-intel
4b123e6b24aa drm/xe/xe2lpg: Add Wa_14021490052


