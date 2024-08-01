Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749FDC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 09:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD510E8D5;
	Thu,  1 Aug 2024 09:45:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B25010E8D5;
 Thu,  1 Aug 2024 09:45:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fgt=5Fidle=3A_?=
 =?utf-8?q?add_debugfs_entry_for_powergating_info_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 09:45:16 -0000
Message-ID: <172250551623.486975.4026763688257090276@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801095305.1209046-1-riana.tauro@intel.com>
In-Reply-To: <20240801095305.1209046-1-riana.tauro@intel.com>
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

Series: drm/xe/xe_gt_idle: add debugfs entry for powergating info (rev3)
URL   : https://patchwork.freedesktop.org/series/136477/
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
commit 14eb7d626059051684822f76c51e57f846453c10
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Aug 1 15:23:05 2024 +0530

    drm/xe/xe_gt_idle: add debugfs entry for powergating info
    
    Coarse Powergating is a power saving technique where Render and Media
    can be power-gated independently irrespective of the rest of the GT.
    
    For debug purposes, it is useful to expose the powergating information.
    
    v2: move to debugfs
        add details to commit message
        add per-slice status for media
        define reg bits in descending order (Matt Roper)
    
    v3: fix return statement
        fix kernel-doc
        use loop for media slices
        use helper function for status (Michal)
    
    v4: add pg prefix
        do not wake GT if in C6 (Badal)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 8019170840644b0c5a5e64fc6d81792dd2105a2d drm-intel
5fbb7a0c34da drm/xe/xe_gt_idle: store powergate enable bits in gtidle
14eb7d626059 drm/xe/xe_gt_idle: add debugfs entry for powergating info


