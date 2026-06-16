Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE77ACD98E0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 07:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920010E88E;
	Tue, 16 Jun 2026 07:54:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC12210E8A2;
 Tue, 16 Jun 2026 07:54:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Progr?=
 =?utf-8?q?am_TRANS=5FVTOTAL_from_mode_vtotal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jun 2026 07:54:09 -0000
Message-ID: <178159644969.82746.12643940231873576849@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616073805.779362-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20260616073805.779362-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: drm/i915/display: Program TRANS_VTOTAL from mode vtotal
URL   : https://patchwork.freedesktop.org/series/168577/
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
commit e9459cb2c7ef380c827807b6a881c6998074844d
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Jun 16 13:08:05 2026 +0530

    drm/i915/display: Program TRANS_VTOTAL from mode vtotal
    
    DP transcoder uses TRANS_VTOTAL to derive MSA VTotal. Avoid
    overriding crtc_vtotal to 1 on platform which supports VRR
    Timing generator and always program VTOTAL from mode timing
    in transcoder timing paths.
    
    Bspec: 70001
    Fixes: 94f608992f8c ("drm/i915/display: Avoid use of VTOTAL.Vtotal bits")
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Suraj Kandpal
+ /mt/dim checkpatch c585a0a7e48a48aca80f7c0acb7294c7bf301bb7 drm-intel
e9459cb2c7ef drm/i915/display: Program TRANS_VTOTAL from mode vtotal
-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Suraj Kandpal'
#20: 
Reviewed-by: Suraj Kandpal

total: 1 errors, 0 warnings, 0 checks, 29 lines checked


