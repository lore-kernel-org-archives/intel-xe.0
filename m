Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE14C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 23:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1FE10E5FF;
	Wed, 25 Oct 2023 23:52:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6071A10E5FF;
 Wed, 25 Oct 2023 23:52:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5F807AADD7;
 Wed, 25 Oct 2023 23:52:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 25 Oct 2023 23:52:42 -0000
Message-ID: <169827796238.20488.17309064673539280237@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025151732.3461842-5-matthew.d.roper@intel.com>
In-Reply-To: <20231025151732.3461842-5-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Em?=
 =?utf-8?q?it_SVG_3DSTATE_during_LRC_init_=28rev3=29?=
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

Series: Emit SVG 3DSTATE during LRC init (rev3)
URL   : https://patchwork.freedesktop.org/series/125255/
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
commit 08bf179ab360adcfa99ad8de5d16dd1416fbba8b
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Oct 25 08:17:36 2023 -0700

    drm/xe/xe2: Update SVG state handling
    
    As with DG2/MTL, Xe2 also fails to emit instruction headers for SVG
    state instructions if no explicit state has been set.  The SVG part of
    the LRC is nearly identical to DG2/MTL; the only change is that
    3DSTATE_DRAWING_RECTANGLE has been replaced by
    3DSTATE_DRAWING_RECTANGLE_FAST, so we can just re-use the same state
    table and handle that single instruction when we encounter it.
    
    Bspec: 65182
    Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch bd3d7e8aa312ce25c5797388f753151f024bec02 drm-intel
a35f9e6a9 drm/xe: Prepare to emit non-register state while recording default LRC
ab1a1a329 drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
08bf179ab drm/xe/xe2: Update SVG state handling


