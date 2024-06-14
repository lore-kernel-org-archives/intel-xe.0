Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D55CC27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 05:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051E710E0F6;
	Fri, 14 Jun 2024 05:14:02 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F28310E0F6;
 Fri, 14 Jun 2024 05:14:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Updat?=
 =?utf-8?q?e_calculation_to_avoid_overflow_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 05:14:00 -0000
Message-ID: <171834204019.77189.1139100249550503258@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614044213.377710-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240614044213.377710-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Update calculation to avoid overflow (rev2)
URL   : https://patchwork.freedesktop.org/series/134859/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 747139e916dda80417047c55ffa216854e3aacf8
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Fri Jun 14 10:12:13 2024 +0530

    drm/i915/display: Update calculation to avoid overflow
    
    Update calculation to avoid overflow.
    
    -v2:
    Remove extra line between cc and signed-off.
    
    Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
    Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch a88e8dc2c59464cac89137471031d736a408652f drm-intel
747139e916dd drm/i915/display: Update calculation to avoid overflow


