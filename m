Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B772CC27C53
	for <intel-xe@archiver.kernel.org>; Sat, 22 Jun 2024 09:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E86D10E034;
	Sat, 22 Jun 2024 09:48:36 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F7610E049;
 Sat, 22 Jun 2024 09:48:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Skip_attempt?=
 =?utf-8?q?_to_start_GuC_PC_if_VF_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 22 Jun 2024 09:48:34 -0000
Message-ID: <171904971428.133686.7624745287970902885@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240622094253.1081-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240622094253.1081-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Skip attempt to start GuC PC if VF (rev2)
URL   : https://patchwork.freedesktop.org/series/135189/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ git -C mt rev-list -n1 origin/master
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d8e7a42a1181a5628fa826fdd8a37258be15d9dd
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Jun 22 11:42:53 2024 +0200

    drm/xe/vf: Skip attempt to start GuC PC if VF
    
    We have already marked the GuC PC feature as not applicable for
    VF devices, but we missed the fact that there may be still some
    privileged activities performed by this component, who does much
    more than its name suggests.
    
    Explicitly skip xe_guc_pc_start() if running as a VF driver and
    use a GT oriented message to report any error.
    
    v2: also skip xe_guc_pc_stop (Vinay)
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 383dc44a79848f13f2430c9ed811b5c9b22b882a drm-intel
d8e7a42a1181 drm/xe/vf: Skip attempt to start GuC PC if VF


