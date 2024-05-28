Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1AC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 10:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1E010E13B;
	Tue, 28 May 2024 10:38:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1F310E468;
 Tue, 28 May 2024 10:38:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_engine_name?=
 =?utf-8?q?_to_the_engine_reset_and_cat-err_log_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 10:38:50 -0000
Message-ID: <171689273017.2216238.9927011764095834181@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528101445.27688-1-nirmoy.das@intel.com>
In-Reply-To: <20240528101445.27688-1-nirmoy.das@intel.com>
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

Series: drm/xe: Add engine name to the engine reset and cat-err log (rev2)
URL   : https://patchwork.freedesktop.org/series/132907/
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
commit 406deccc19f62be6f2f1268a30faf8ac25aab902
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Tue May 28 12:14:45 2024 +0200

    drm/xe: Add engine name to the engine reset and cat-err log
    
    Add engine name to the engine reset and cat error log
    which should be useful while debugging.
    
    v2: Add logical mask and engine class(Matt)
        Use xe_gt_{info|dbg} (Michal)
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 5ba74aaea55bf295898f2a4f69c59fe12e84e842 drm-intel
406deccc19f6 drm/xe: Add engine name to the engine reset and cat-err log


