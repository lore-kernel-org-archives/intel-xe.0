Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6670C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 12:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955F310E2B2;
	Mon, 27 May 2024 12:07:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1B610E2B2;
 Mon, 27 May 2024 12:07:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Update_the_L?=
 =?utf-8?q?MTT_when_freeing_VF_GT_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 12:07:42 -0000
Message-ID: <171681166258.2212914.1484388247960358852@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527115408.1064-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240527115408.1064-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Update the LMTT when freeing VF GT config
URL   : https://patchwork.freedesktop.org/series/134077/
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
commit 1e34498ea764fbf37b102f45135b207e7cdf3f1b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 27 13:54:08 2024 +0200

    drm/xe/pf: Update the LMTT when freeing VF GT config
    
    The LMTT must be updated whenever we change the VF LMEM configuration.
    We missed that step when freeing the whole VF GT config, which could
    result in stale PTE in LMTT or LMTT PT object leaks. Fix that.
    
    Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch f2c37d7fd878c82ea57075948d614f60a168128c drm-intel
1e34498ea764 drm/xe/pf: Update the LMTT when freeing VF GT config


