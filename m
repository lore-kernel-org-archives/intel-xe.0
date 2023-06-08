Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7942EC7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 18:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141310E604;
	Thu,  8 Jun 2023 18:14:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F01FC10E108;
 Thu,  8 Jun 2023 18:14:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED0B1AADDA;
 Thu,  8 Jun 2023 18:14:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 08 Jun 2023 18:14:56 -0000
Message-ID: <168624809696.18384.13001536659275194148@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230608181217.2385932-1-matthew.d.roper@intel.com>
In-Reply-To: <20230608181217.2385932-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/mtl=3A_Add_some_initial_MTL_workarounds?=
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

Series: drm/xe/mtl: Add some initial MTL workarounds
URL   : https://patchwork.freedesktop.org/series/119094/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1491ca7cbe71369c34b31bafeb0f5b0744b95513
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Jun 8 11:12:17 2023 -0700

    drm/xe/mtl: Add some initial MTL workarounds
    
    This adds a handful of workarounds that apply to production steppings of
    MTL:
     - Wa_14018575942
     - Wa_22016670082
     - Wa_14017856879
     - Wa_18019271663
    
    Wa_22016670082 is currently only applied to the primary GT at the
    moment, but may need to be extended to the media GT in the future if a
    pending update to the workaround database gets finalized.
    
    OOB workarounds will need to be implemented separately in future patches
    for Wa_14016712196, Wa_16018063123, and Wa_18013179988.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch c075cadc4c6d0238556545baab98a63368908404 drm-intel
1491ca7cb drm/xe/mtl: Add some initial MTL workarounds


