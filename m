Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA7AC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 11:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1551A10E7DC;
	Mon, 25 Mar 2024 11:42:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0BB10E7DC;
 Mon, 25 Mar 2024 11:42:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?5=2C1/2=5D_drm/xe/query=3A_Define_and_use_a_constant_for_the_numb?=
 =?utf-8?q?er_of_masks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 11:42:05 -0000
Message-ID: <171136692511.1035680.11077326553818196887@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325111439.7-1-francois.dugast@intel.com>
In-Reply-To: <20240325111439.7-1-francois.dugast@intel.com>
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

Series: series starting with [v5,1/2] drm/xe/query: Define and use a constant for the number of masks
URL   : https://patchwork.freedesktop.org/series/131573/
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
commit 0aae46da1f2beb88ecce5fbc627b905fa9c7d93f
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Mon Mar 25 11:14:39 2024 +0000

    drm/xe/uapi: Add L3 bank mask to topology query
    
    The Metrics Discovery Application Programming Interface (MDAPI) exposes
    disaggregated metrics only for available instances of hardware, therefore
    it needs to know exactly which L3 banks are enabled on the device. The L3
    count is not sufficient information as in some configurations the L3
    banks might be individually enabled or disabled. This is why the topology
    query is here extended to provide the L3 bank mask.
    
    v2:
    - Remove "Fixes" and make uAPI change explicit in commit message
      (Lucas De Marchi and Matt Roper)
    - Add separate conditions for Xe2 and for PVC (Matt Roper)
    - Return the L3 bank mask instead of the L3 node mask and the L3
      banks per node mask, as the node mask can be derived from the
      bank mask by user space, just like slice masks are derived from
      subslice masks today (Francois Dugast)
    
    v3: Use TOPO_NUMBER_OF_MASKS for the number of masks (Zhanjun Dong)
    
    v4: Detail the user space need in commit message (Lucas De Marchi)
    
    Bspec: 52545, 52546, 62482
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Robert Krzemien <robert.krzemien@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://github.com/intel/metrics-discovery
+ /mt/dim checkpatch fc736bbab7abcae683f52604591fe16cf2a85b3e drm-intel
271855f33834 drm/xe/query: Define and use a constant for the number of masks
0aae46da1f2b drm/xe/uapi: Add L3 bank mask to topology query
-:168: WARNING:NEW_TYPEDEFS: do not add new typedefs
#168: FILE: drivers/gpu/drm/xe/xe_gt_types.h:36:
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];

total: 0 errors, 1 warnings, 0 checks, 166 lines checked


