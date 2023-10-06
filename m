Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4271DE92711
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0EE10E0CA;
	Fri,  6 Oct 2023 10:48:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86A3910E0CA;
 Fri,  6 Oct 2023 10:48:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 84D89AADF1;
 Fri,  6 Oct 2023 10:48:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 06 Oct 2023 10:48:42 -0000
Message-ID: <169658932254.6467.15378550871077118206@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006084614.19838-3-matthew.auld@intel.com>
In-Reply-To: <20231006084614.19838-3-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C1/2=5D_drm/xe/pat=3A_trim_the_xelp_P?=
 =?utf-8?q?AT_table?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,1/2] drm/xe/pat: trim the xelp PAT table
URL   : https://patchwork.freedesktop.org/series/124708/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c99fae942869351a9c972929e44efa6502e0f174
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Oct 6 09:46:16 2023 +0100

    drm/xe: directly use pat_index for pte_encode
    
    In a future patch userspace will be able to directly set the pat_index
    as part of vm_bind. To support this we need to get away from using
    xe_cache_level in the low level routines and rather just use the
    pat_index directly.
    
    v2: Rebase
    v3: Some missed conversions, also prefer tile_to_xe() (Niranjana)
    v4: remove leftover const (Lucas)
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Pallavi Mishra <pallavi.mishra@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch b3daf7f07d6accbe43feafcadeb0b0498063761e drm-intel
cea40ceda drm/xe/pat: trim the xelp PAT table
c99fae942 drm/xe: directly use pat_index for pte_encode


