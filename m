Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1823ECD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37CB10F921;
	Mon,  8 Jun 2026 19:37:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713010F921;
 Mon,  8 Jun 2026 19:37:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Vswing_/_Pre-emphasis_Ove?=
 =?utf-8?q?rride_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 19:37:52 -0000
Message-ID: <178094747255.56403.6232133484986821479@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608192821.3414590-1-michal.grzelak@intel.com>
In-Reply-To: <20260608192821.3414590-1-michal.grzelak@intel.com>
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

Series: Vswing / Pre-emphasis Override (rev2)
URL   : https://patchwork.freedesktop.org/series/167570/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d32dae58972905738fb341d67b778ae358758388
Author: Michał Grzelak <michal.grzelak@intel.com>
Date:   Mon Jun 8 21:28:21 2026 +0200

    drm/i915: override LT's VS/PE when requested
    
    Add accessor function for LT to read requested table from VBT #57.
    Parse the requested table and transform data into port's buffer.
    
    LT's VS/PE-O tables have less columns than xe3plpd_lt_phy_buf_trans
    contains fields. Thus copy txswing and txswing_level from default VS/PE
    values onto VS/PE-O tables.
    
    Use 6th table if encoder supports DP 2.0 or higher. Otherwise use 5th
    table for DP.
    
    There are no changes to intel_ddi_dp_level() since selection of correct
    row of intel_ddi_buf_trans_entry is same as when no override request has
    been done.
    
    Tables 1-4 are not used at all and are most likely to be zeroed. 5th
    table is used for any mode below DP 2.0 (exclusive). 6th table is used
    for any mode above DP 2.0 (inclusive).
    
    Indices for other tables have not yet been observed to be used as of
    now.
    
    v6->v7
    - handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
    - remove vspeo's cast to (void *) (Jani)
    - check devdata->vspeo if VS/PE-O was requested
    - call encoder->get_buf_trans() once (Jani)
    - return NULL from intel_bios_get_* when using default (Jani)
    - validate VS/PE-O in intel_bios.c (Jani)
    - inline xe3plpd_lt_get_vspeo_buf_trans()
    - remove temporarily LT
    
    v5->v6
    - remove drm_WARN_ONCE (Suraj)
    - pass default VS/PE tables to LT's VBT accessor (Suraj)
    - set txswing & _level from default VS/PE tables (Suraj)
    - add helper checking if VS/PE-O has been allocated (Suraj)
    - check if devdata is not NULL
    
    v4->v5
    - add if-ladder instead of function pointer
    - blend index computation with table parsing
    - remove WARN and debug messages
    - remove enums entirely
    - add spaces around operators (Suraj)
    - remove spaces after type casting (Suraj)
    - remove INTEL_DISPLAY_STATE_WARN (Suraj)
    
    v3->v4
    - stick to solely changing VBT data into current structures (Jani)
    - move iterator declaration to declaration block (Suraj)
    
    v2->v3
    - remove unnecessary braces from if block (Suraj)
    - return -EINVAL instead of -1 (Suraj)
    
    Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch da64ed1114e5dad3d82db1a1925fc82c3c593745 drm-intel
bd8a52c97534 drm/i915/bios: search for VBT #57 by default
8a681e7a819a drm/i915/bios: store VBT #57's metadata in intel_vbt_data
c0c9bea1c3f3 drm/i915/bios: print VS/PE-O port info
f4e08b5ed4aa drm/i915/bios: de/allocate VS/PE-O buffer for each port
a6a03797f784 drm/i915: override Snps's VS/PE when requested
604a713d3cba drm/i915: override Combo's VS/PE when requested
-:194: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1879:
+								   has_edp && use_edp_low_vswing(encoder));

-:196: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1881:
+			buf_trans = intel_bios_get_ehl_combo_vspeo(devdata, has_dp, port_clock, has_edp);

total: 0 errors, 2 warnings, 0 checks, 128 lines checked
e893982fb7d1 drm/i915/bios: remove VS/PE-O warning
d32dae589729 drm/i915: override LT's VS/PE when requested


