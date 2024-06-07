Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADF1C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4A210ECC5;
	Fri,  7 Jun 2024 17:31:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4B10ECC5;
 Fri,  7 Jun 2024 17:31:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Introduce_xe=5F?=
 =?utf-8?q?gt=5Fdbg=5Fprinter=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 17:31:25 -0000
Message-ID: <171778148567.28075.16106816841965102845@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607172607.1680-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240607172607.1680-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Introduce xe_gt_dbg_printer()
URL   : https://patchwork.freedesktop.org/series/134630/
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
commit 5717130e6c2ffc080cef179c57d7e5447ccf55bd
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jun 7 19:26:07 2024 +0200

    drm/xe: Introduce xe_gt_dbg_printer()
    
    We didn't have GT-oriented debug level printer as it was hard to
    correctly show actual callsite annotation. But this is now doable
    from commit c2ef66e9ad88 ("drm/print: Improve drm_dbg_printer").
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 29955874be9f82296c8cc21cdd66a7cdf51faee2 drm-intel
5717130e6c2f drm/xe: Introduce xe_gt_dbg_printer()


