Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6762AC52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 19:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B15810E7E9;
	Thu,  8 Aug 2024 19:04:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B9E10E7E9;
 Thu,  8 Aug 2024 19:04:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_xe=5Fsyncs_f?=
 =?utf-8?q?or_OA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 19:04:41 -0000
Message-ID: <172314388102.550585.3146155236709546143@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA
URL   : https://patchwork.freedesktop.org/series/137058/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a5e4f251ff47d6ee81e2cd06adffe05b4e4b27f2
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Aug 8 10:41:39 2024 -0700

    drm/xe/oa: Allow only certain property changes from config ioctl
    
    Whereas all properties can be specified during OA stream open, when the OA
    stream is reconfigured only the config_id and syncs can be specified.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 63a79da951e8a7a6beb35c46c5c4ec002a798283 drm-intel
772f7f9798ae drm/xe/oa: Separate batch submission from waiting for completion
d3cec20dd1eb drm/xe/oa: Introduce 'struct xe_oa_fence'
85db4aa3f9bf drm/xe/oa/uapi: Define and parse OA sync properties
3d8f480fe54e drm/xe/oa: Add input fence dependencies
e86aa1119c55 drm/xe/oa: Signal output fences
302207647feb drm/xe/oa: Move functions up so they can be reused for config ioctl
ef831561e22d drm/xe/oa: Add syncs support to OA config ioctl
a5e4f251ff47 drm/xe/oa: Allow only certain property changes from config ioctl


