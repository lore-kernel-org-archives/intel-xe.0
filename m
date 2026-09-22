Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E49CC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 09:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437F810E67D;
	Tue, 22 Sep 2026 09:39:33 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB4D10E67D;
 Tue, 22 Sep 2026 09:39:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dp/mst=3A_fix_MST_pay?=
 =?utf-8?q?load_PBN_accounting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Sep 2026 09:39:32 -0000
Message-ID: <179006997211.191774.18239359449150306954@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922092647.2263962-1-xiaolu.xie@intel.com>
In-Reply-To: <20260922092647.2263962-1-xiaolu.xie@intel.com>
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

Series: drm/dp/mst: fix MST payload PBN accounting
URL   : https://patchwork.freedesktop.org/series/174698/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7f585f8102080e5bd2353f79d0803170ddf9696d
Author: Xiao Lu <xiaolu.xie@intel.com>
Date:   Tue Sep 22 17:26:47 2026 +0800

    drm/dp_mst: Track allocated_pbn from ALLOCATE_PAYLOAD down-reply
    
    The DP MST ALLOCATE_PAYLOAD sideband message returns the payload bandwidth actually allocated by the branch in the allocated_pbn field of the down-reply. That value may differ from the requested PBN when an intermediate branch applies its own constraints, so the source should keep track of it instead of only relying on the local request.
    
    Store the allocated_pbn returned by the ALLOCATE_PAYLOAD down-reply sideband message and use the larger of requested PBN and allocated PBN for the MST bandwidth limit checks. Also carry the value across dependent atomic commits and clear it when releasing the payload, matching the lifetime of the remote allocation state.
    
    Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
+ /mt/dim checkpatch b372dd4fe9fba280fd4aef02e14a024bfbeffdc8 drm-intel
89458e1e3179 drm/i915/dp: fix PBN in ALLOCATE_PAYLOAD request to use actual video bandwidth
-:76: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#76: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:374:
+			raw_pbn = intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
+							 link_bpp_x16,

total: 0 errors, 0 warnings, 1 checks, 57 lines checked
7f585f810208 drm/dp_mst: Track allocated_pbn from ALLOCATE_PAYLOAD down-reply
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
The DP MST ALLOCATE_PAYLOAD sideband message returns the payload bandwidth actually allocated by the branch in the allocated_pbn field of the down-reply. That value may differ from the requested PBN when an intermediate branch applies its own constraints, so the source should keep track of it instead of only relying on the local request.

total: 0 errors, 1 warnings, 0 checks, 85 lines checked


