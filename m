Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED9C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 09:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BAC10E319;
	Mon, 15 Jul 2024 09:47:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9A10E319;
 Mon, 15 Jul 2024 09:47:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_RFC_drm/xe/xe=5Fgt=5Fidle?=
 =?utf-8?q?=3A_Expose_Coarse_power_gating_sysfs_entries?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jul 2024 09:47:19 -0000
Message-ID: <172103683928.217124.16130928496730356437@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715095455.4069296-1-riana.tauro@intel.com>
In-Reply-To: <20240715095455.4069296-1-riana.tauro@intel.com>
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

Series: RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs entries
URL   : https://patchwork.freedesktop.org/series/136085/
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
commit b32bd135a65a40eda52269f1d1fe6e954df152bb
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jul 15 15:24:55 2024 +0530

    RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs entries
    
    Add coarse power gating sysfs interface under gtidle directory to
    display the powergate properties.
    
    powergate sysfs directory will be enumerated for render and media
    if present.
    
    The new entries will have the below layout
    
            tile<n>/gt<n>/gtidle/
                            ├── powergate0
                            │   ├── enabled
                            │   ├── status
                            │   └── type
                            └── powergate<n>
                                ├── enabled
                                ├── status
                                └── type
    
    type:    type of powergate [Render or Media]
    enabled: true if powergate is enabled for the type
    status:  Indicates status of powergate [Up/Down]
             For type media, status is "Up" if any of the media
             slices are powered on.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 2a1af781369347d1a4077a51f32c331cba1589b6 drm-intel
b32bd135a65a RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs entries


