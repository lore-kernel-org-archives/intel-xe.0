Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B164EC36002
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 02:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA6010E111;
	Tue, 25 Mar 2025 02:34:55 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48AF10E111;
 Tue, 25 Mar 2025 02:34:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_DRAM_type_log?=
 =?utf-8?q?ging?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 02:34:53 -0000
Message-ID: <174287009386.75914.16183468346399234151@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324-dram-type-v1-0-bf60ef33ac01@intel.com>
In-Reply-To: <20250324-dram-type-v1-0-bf60ef33ac01@intel.com>
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

Series: drm/i915: DRAM type logging
URL   : https://patchwork.freedesktop.org/series/146700/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e0758ed3383d7b7e0bebbf540bc3bf56d21c7aa4
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Mar 24 19:28:42 2025 -0700

    drm/i915/dram: Consolidate logging of DRAM type
    
    Instead of logging the dram type in the per version/platform function,
    do it in the generic one. This fixes a few discrepancies depending on
    the platform:
    
            - There was no DRAM type logging for graphics version 12 and
              above
            - For graphics version 11, it would log the DRAM type in
              skl_get_dram_info(), but could possibly override it later
              without any log in icl_pcode_read_mem_global_info()
    
    For bxt_get_dram_info(), there's no need to log the type for each dimm,
    as the drm_WARN_ON() already covers the case the are not all the same.
    
    This maintains the behavior of skl_get_dram_info() that would log the
    DRAM type even on failures.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056 drm-intel
5aad7b6a9c91 drm/i915/dram: Add missing INTEL_DRAM str conversions
e0758ed3383d drm/i915/dram: Consolidate logging of DRAM type


