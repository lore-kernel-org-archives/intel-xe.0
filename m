Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E64BECE579
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 17:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453BF10E5E8;
	Mon,  9 Sep 2024 17:05:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FD210E5E8;
 Mon,  9 Sep 2024 17:05:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Enable_Xe2+_?=
 =?utf-8?q?PES_disaggregation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 17:05:01 -0000
Message-ID: <172590150188.977312.3953357671968078612@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Enable Xe2+ PES disaggregation (rev2)
URL   : https://patchwork.freedesktop.org/series/138352/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1355e8f72b7f4abff6d6da2fcc4993c7cc57d5b0
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Sep 9 09:59:33 2024 -0700

    drm/xe/oa: Enable Xe2+ PES disaggregation
    
    Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
    metrics when disaggregated data is needed. There is no uapi impact of this
    change.
    
    v2: Minor change to commit message
    
    Bspec: 61101
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: stable@vger.kernel.org
+ /mt/dim checkpatch 5908c6f634a16adf10b7c00d7bd400162676b5ca drm-intel
1355e8f72b7f drm/xe/oa: Enable Xe2+ PES disaggregation


