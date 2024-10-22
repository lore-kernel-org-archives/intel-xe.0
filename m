Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E94CDD0F4
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 20:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E7E10E1B8;
	Tue, 22 Oct 2024 20:42:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8307910E1B8;
 Tue, 22 Oct 2024 20:42:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_xe=5Fsyncs_f?=
 =?utf-8?q?or_OA_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Oct 2024 20:42:03 -0000
Message-ID: <172962972353.1310194.438918303664649603@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241022200352.1192560-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: xe_syncs for OA (rev7)
URL   : https://patchwork.freedesktop.org/series/137058/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2749d3d16d2a0ddb7a259cf76b702b7638b1817c
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Oct 22 13:03:52 2024 -0700

    drm/xe/oa: Allow only certain property changes from config
    
    Whereas all properties can be specified during OA stream open, when the OA
    stream is reconfigured only the config_id and syncs can be specified.
    
    v2: Use separate function table for reconfig case (Jonathan)
        Change bool function args to enum (Matt B)
    v3: s/xe_oa_set_property_funcs/xe_oa_set_property_funcs_open/ (Jonathan)
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Suggested-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
13e1df638032 drm/xe/oa: Separate batch submission from waiting for completion
f75cb0bec99b drm/xe/oa/uapi: Define and parse OA sync properties
a4448eeb564d drm/xe/oa: Add input fence dependencies
53bf9c78320e drm/xe/oa: Signal output fences
de32b321908f drm/xe/oa: Move functions up so they can be reused for config ioctl
6afbcadf35f6 drm/xe/oa: Add syncs support to OA config ioctl
2749d3d16d2a drm/xe/oa: Allow only certain property changes from config


