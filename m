Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DCEC25B7E
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D795710E959;
	Thu, 30 May 2024 10:57:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B191113AF1;
 Thu, 30 May 2024 10:57:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpm=3A_Add_perm?=
 =?utf-8?q?anent_Wa=5F14020756599?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 10:57:56 -0000
Message-ID: <171706667643.2237378.5509924848693385783@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240530105229.490430-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240530105229.490430-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/xe2lpm: Add permanent Wa_14020756599
URL   : https://patchwork.freedesktop.org/series/134245/
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
commit 076216f277b481795fa443979b429057cad60042
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu May 30 16:22:29 2024 +0530

    drm/xe/xe2lpm: Add permanent Wa_14020756599
    
    For xe2_lpm Wa_14020756599 is applied to all steppings and
    when RCS is present on graphics GT.
    
    V3(MattR):
      - Rename rtp api name
      - Use MEDIA_VERx100
    V2:
      - Remove engine filter video decode
      - Fix typo GRAPHICS/MEDIA/s - Himal
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 4a32411a2b73e515af2cc54034ef686e03df8385 drm-intel
076216f277b4 drm/xe/xe2lpm: Add permanent Wa_14020756599


