Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B3C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 18:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462D610EA93;
	Wed, 19 Jun 2024 18:11:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB010EA93;
 Wed, 19 Jun 2024 18:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Fix_potentia?=
 =?utf-8?q?l_NPD_when_OA_is_not_initialized?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 18:11:40 -0000
Message-ID: <171882070014.125140.10973461397015145125@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619175427.861-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240619175427.861-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/oa: Fix potential NPD when OA is not initialized
URL   : https://patchwork.freedesktop.org/series/135074/
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
commit 2a0341fbac98e9470e8d96ed1edc6db92fa99779
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jun 19 19:54:27 2024 +0200

    drm/xe/oa: Fix potential NPD when OA is not initialized
    
    If oa->xe can be NULL then we shall not use it as a valid pointer.
    
    Fixes: cdf02fe1a94a ("drm/xe/oa/uapi: Add/remove OA config perf ops")
    Fixes: b6fd51c62119 ("drm/xe/oa/uapi: Define and parse OA stream properties")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 drm-intel
2a0341fbac98 drm/xe/oa: Fix potential NPD when OA is not initialized


