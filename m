Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F169CCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 17:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44D10E839;
	Wed, 25 Sep 2024 17:02:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269DD10E839;
 Wed, 25 Sep 2024 17:02:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Add_FEC_En?=
 =?utf-8?q?able_Retry_mechanism?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 17:02:57 -0000
Message-ID: <172728377715.1102080.427269762827191471@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923045218.1813255-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240923045218.1813255-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/dp: Add FEC Enable Retry mechanism
URL   : https://patchwork.freedesktop.org/series/138964/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ca0371b9c37883401d64d1f0133cee68c8ab29db
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Sep 23 10:22:18 2024 +0530

    drm/i915/dp: Add FEC Enable Retry mechanism
    
    From PTL, FEC_DECODE_EN sequence can be sent to a DPRX independent
    of TRANS_CONF enable. This allows us to re-issue an FEC_DECODE_EN
    sequence without re-doing the whole mode set sequence. This separate
    control over FEC_ECODE_EN/DIS sequence enables us to have a retry
    mechanism in case the DPRX does not respond with an FEC_ENABLE
    within the stipulated 5ms.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch d5334f14ce6ca46c6537184c69e4e352ff6d7750 drm-intel
ca0371b9c378 drm/i915/dp: Add FEC Enable Retry mechanism


