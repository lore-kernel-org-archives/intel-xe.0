Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A61C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 15:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7510FD4F;
	Wed, 20 Mar 2024 15:06:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758B310FD43;
 Wed, 20 Mar 2024 15:06:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Add_L3_ban?=
 =?utf-8?q?k_mask_to_topology_query?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 15:06:42 -0000
Message-ID: <171094720248.921315.11326600372166044620@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320150027.7-1-francois.dugast@intel.com>
In-Reply-To: <20240320150027.7-1-francois.dugast@intel.com>
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

Series: drm/xe/uapi: Add L3 bank mask to topology query
URL   : https://patchwork.freedesktop.org/series/131374/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55f60873437db670b6b637ba6169cfb005864bb3
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Mar 20 15:00:27 2024 +0000

    drm/xe/uapi: Add L3 bank mask to topology query
    
    Extend the existing topology uAPI to expose the masks of L3 banks
    to user space. L3 count is not sufficient because in some configuration
    not all banks are enabled. User space needs to know which ones are
    enabled, in the context of OA.
    
    v2:
    - Remove "Fixes" and make uAPI change explicit in commit message
      (Lucas De Marchi and Matt Roper)
    - Add separate conditions for Xe2 and for PVC (Matt Roper)
    - Return the L3 bank mask instead of the L3 node mask and the L3
      banks per node mask, as the node mask can be derived from the
      bank mask by user space, just like slice masks are derived from
      subslice masks today (Francois Dugast)
    
    Bspec: 52545, 52546, 62482
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Robert Krzemien <robert.krzemien@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch b87a8b85562fc94e2314b61279ffa80b6c294cfa drm-intel
55f60873437d drm/xe/uapi: Add L3 bank mask to topology query
-:159: WARNING:NEW_TYPEDEFS: do not add new typedefs
#159: FILE: drivers/gpu/drm/xe/xe_gt_types.h:36:
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];

total: 0 errors, 1 warnings, 0 checks, 162 lines checked


