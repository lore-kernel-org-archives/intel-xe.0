Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4418BC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3378810E02D;
	Tue, 11 Jun 2024 18:39:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F043810E02D;
 Tue, 11 Jun 2024 18:39:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?6=2C1/2=5D_devcoredump=3A_Add_dev=5Fcoredumpm=5Ftimeout=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 18:39:34 -0000
Message-ID: <171813117498.68617.4021427065966013730@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611174716.72660-1-jose.souza@intel.com>
In-Reply-To: <20240611174716.72660-1-jose.souza@intel.com>
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

Series: series starting with [v6,1/2] devcoredump: Add dev_coredumpm_timeout()
URL   : https://patchwork.freedesktop.org/series/134732/
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
commit a3c90f9d8be98f016881796c2afe7b97ae2f13b3
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jun 11 10:47:16 2024 -0700

    drm/xe: Increase devcoredump timeout
    
    5 minutes is too short for a regular user to search and understand
    what he needs to do to report capture devcoredump and report a bug to
    us, so here increasing this timeout to 1 hour.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 950ce28fe0b31a24c5bddcc337aba9554a41cbb3 drm-intel
48d82fae18ee devcoredump: Add dev_coredumpm_timeout()
a3c90f9d8be9 drm/xe: Increase devcoredump timeout


