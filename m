Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132B2CD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDBB10EE1D;
	Thu, 11 Jun 2026 10:37:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB84D10EE1D;
 Thu, 11 Jun 2026 10:37:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_wa=5F140259?=
 =?utf-8?q?41587_to_xe2=2C_xe3_and_xe3p_platforms_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 10:37:21 -0000
Message-ID: <178117424169.68367.13106159915860162819@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611103042.1044942-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260611103042.1044942-1-tilak.tirumalesh.tangudu@intel.com>
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

Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev4)
URL   : https://patchwork.freedesktop.org/series/167706/
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
commit d1e42c8ed42d02310c08defa819d8530f6cb9021
Author: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Date:   Thu Jun 11 16:00:42 2026 +0530

    drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
    
    Avoid IDLEDLY timer programming lessthan 5 micro secs.
    Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
    and Media Versions 13.01 to 35.03
    
    v2: Use xe_rtp_match_not_sriov_vf, move to local variable
        Remove warn and other knits            - Matt R
    
    v3: Add verbose comment - Tejas
    
    v4: Restore IDLE_DLY register on engine reset.
        Add it to GUC save-restore list. -Vivek
    
    v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
    v6: Avoid clearing inhibit switch - Bala
        Refactor code accordingly by adding idle_reg_val.
    
    Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
    Reviewed-by:  Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch 4fdfaadba04dc0f2f2490dbc91922caa290463a5 drm-intel
d1e42c8ed42d drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
-:23: WARNING:BAD_SIGN_OFF: Use a single space after Reviewed-by:
#23: 
Reviewed-by:  Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

total: 0 errors, 1 warnings, 0 checks, 77 lines checked


