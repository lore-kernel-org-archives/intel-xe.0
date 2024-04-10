Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F29BCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 14:44:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404EF112456;
	Wed, 10 Apr 2024 14:44:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455B7112456;
 Wed, 10 Apr 2024 14:44:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_L3_bank_mask_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 14:44:34 -0000
Message-ID: <171276027428.1321612.17627740225460000532@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410123723.7-1-francois.dugast@intel.com>
In-Reply-To: <20240410123723.7-1-francois.dugast@intel.com>
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

Series: L3 bank mask (rev2)
URL   : https://patchwork.freedesktop.org/series/132075/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 27564f271ee8b9750355e09d748e1fef6b787b89
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Apr 10 12:37:23 2024 +0000

    drm/xe/uapi: Expose the L3 bank mask
    
    Extend the topology query to include the mask of enabled L3 banks on
    the GT. This information is needed for user space components which
    provide metrics depending on the exact hardware configuration. In this
    case, the L3 bank count is not sufficient as on some platforms not
    all L3 banks might be enabled, hence the mask exposed by this query.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Robert Krzemien <robert.krzemien@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch bf24d40fae19bcceac3e32c4866079b4f10c70f9 drm-intel
a07fd11b841a drm/xe/gt: Add L3 bank mask to GT topology
-:199: WARNING:NEW_TYPEDEFS: do not add new typedefs
#199: FILE: drivers/gpu/drm/xe/xe_gt_types.h:35:
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_MASK_BITS)];

total: 0 errors, 1 warnings, 0 checks, 174 lines checked
27564f271ee8 drm/xe/uapi: Expose the L3 bank mask


