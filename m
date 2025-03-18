Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF56C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 12:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82ED10E479;
	Tue, 18 Mar 2025 12:17:21 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE49510E477;
 Tue, 18 Mar 2025 12:17:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/fbc=3A_disable_F?=
 =?utf-8?q?BC_if_PSR2_selective_fetch_is_enabled_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Mar 2025 12:17:20 -0000
Message-ID: <174230024084.48165.3489416933788136696@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317150835.30564-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250317150835.30564-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled (rev2)
URL   : https://patchwork.freedesktop.org/series/146402/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 608c00151b9aa3daed35f91f8308ea88607ff807
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Mon Mar 17 17:08:35 2025 +0200

    drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
    
    Disable FBC in case PSR2 selective fetch is enabled for all
    platforms from display version 12. Later on there will be
    mechanism to select between selective fetch and FBC based
    on the dirty rect percentage.
    
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
608c00151b9a drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled


