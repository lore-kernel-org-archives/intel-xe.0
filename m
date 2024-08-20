Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7B9C52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 01:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D08C10E33F;
	Tue, 20 Aug 2024 01:04:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA6010E33F;
 Tue, 20 Aug 2024 01:04:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_xe=5Fsyncs_f?=
 =?utf-8?q?or_OA_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 01:04:11 -0000
Message-ID: <172411585151.697834.13555669202100995993@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA (rev2)
URL   : https://patchwork.freedesktop.org/series/137058/
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
commit b1f397ecfbaee26fd34b8630762e29a36f36ac89
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Aug 19 17:58:08 2024 -0700

    drm/xe/oa: Allow only certain property changes from config
    
    Whereas all properties can be specified during OA stream open, when the OA
    stream is reconfigured only the config_id and syncs can be specified.
    
    v2: Use separate function table for reconfig case (Jonathan)
        Change bool function args to enum (Matt B)
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 4d24271792fac837e728f7bb6237a94ee46cc76e drm-intel
ea25b880aac6 drm/xe/oa: Separate batch submission from waiting for completion
e5fb2cbb61ff drm/xe/oa/uapi: Define and parse OA sync properties
788297447c32 drm/xe/oa: Add input fence dependencies
a6ff1765e40a drm/xe/oa: Signal output fences
eba5ee2e8ab3 drm/xe/oa: Move functions up so they can be reused for config ioctl
cab1e5c41637 drm/xe/oa: Add syncs support to OA config ioctl
b1f397ecfbae drm/xe/oa: Allow only certain property changes from config


