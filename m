Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466DDC25B10
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 21:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC9F10E995;
	Mon, 13 May 2024 21:42:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5939810E995;
 Mon, 13 May 2024 21:42:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/5=5D_drm/xe=3A_Drop_=5F=5Fengine=5Fmask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 May 2024 21:42:50 -0000
Message-ID: <171563657036.2097178.8770730353875557554@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513213751.1017791-1-lucas.demarchi@intel.com>
In-Reply-To: <20240513213751.1017791-1-lucas.demarchi@intel.com>
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

Series: series starting with [CI,1/5] drm/xe: Drop __engine_mask
URL   : https://patchwork.freedesktop.org/series/133573/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
57b97a66dd129aea93991dc66cd10477f7a05cf8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 63d5f0f30376aa02602bc250dbbf6aaf3e725c28
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon May 13 14:37:51 2024 -0700

    drm/xe: Move sw-only pcode initialization
    
    Move it to xe_gt_init_early() that initializes the sw-only part for each
    gt.
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 5f823e6608065c42909c6a41adc7ff448cbfbfc5 drm-intel
1f31f02e45fc drm/xe: Drop __engine_mask
65445b9dc074 drm/xe: Drop useless forcewake get/put
a5009497dd6d drm/xe: Move xe_gt_init_early() where it belongs
b0ab40c6fc5d drm/xe: Move xe_force_wake_init_gt() inside gt initialization
63d5f0f30376 drm/xe: Move sw-only pcode initialization


