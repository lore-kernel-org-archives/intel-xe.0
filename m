Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BE2C54749
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 01:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0B310E2BF;
	Wed, 28 Aug 2024 01:57:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D5810E2BF;
 Wed, 28 Aug 2024 01:57:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_xe=5Fsyncs_f?=
 =?utf-8?q?or_OA_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Aug 2024 01:57:15 -0000
Message-ID: <172481023588.808406.3890789341327798438@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828015045.1889706-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240828015045.1889706-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA (rev4)
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
commit 4dfc350c7c6b6ec37c30013d7df6dc94b5fe9428
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Aug 27 18:50:45 2024 -0700

    drm/xe/oa: Allow only certain property changes from config
    
    Whereas all properties can be specified during OA stream open, when the OA
    stream is reconfigured only the config_id and syncs can be specified.
    
    v2: Use separate function table for reconfig case (Jonathan)
        Change bool function args to enum (Matt B)
    v3: s/xe_oa_set_property_funcs/xe_oa_set_property_funcs_open/ (Jonathan)
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 2940d1fa7abe0d2a9acc95fd1c704a8d8cbc68f4 drm-intel
ee49f08d2e49 drm/xe/oa: Separate batch submission from waiting for completion
4acee2e54ddf drm/xe/oa/uapi: Define and parse OA sync properties
0b5ed9994df5 drm/xe/oa: Add input fence dependencies
9e7f73199283 drm/xe/oa: Signal output fences
f243c89307a0 drm/xe/oa: Move functions up so they can be reused for config ioctl
34a4e3fa1172 drm/xe/oa: Add syncs support to OA config ioctl
4dfc350c7c6b drm/xe/oa: Allow only certain property changes from config


