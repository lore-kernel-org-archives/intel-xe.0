Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BFCEF173
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E5510E52E;
	Tue,  8 Oct 2024 13:28:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8514910E52E;
 Tue,  8 Oct 2024 13:28:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=3A_Add_FEC_En?=
 =?utf-8?q?able_Retry_mechanism_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 13:28:38 -0000
Message-ID: <172839411854.1204050.9195907875652710980@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008125331.2893681-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241008125331.2893681-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/dp: Add FEC Enable Retry mechanism (rev2)
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
commit 1cd8c7545d8d7ac2766b84bc916ffddcf4407990
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue Oct 8 18:23:31 2024 +0530

    drm/i915/dp: Add FEC Enable Retry mechanism
    
    From PTL, FEC_DECODE_EN sequence can be sent to a DPRX independent
    of TRANS_CONF enable. This allows us to re-issue an FEC_DECODE_EN
    sequence without re-doing the whole mode set sequence. This separate
    control over FEC_ECODE_EN/DIS sequence enables us to have a retry
    mechanism in case the DPRX does not respond with an FEC_ENABLE
    within the stipulated 5ms.
    
    v2:
     - Refactor code to avoid duplication and improve readability [Jani]
     - In case of PTL, wait for FEC status directly after FEC enable [Srikanth]
     - Wait for FEC_ENABLE_LIVE_STATUS to be cleared before
       re-enabling FEC [Srikanth]
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch c2c031e80da1ca6b5a70dfcd7981bdbe18b8aac2 drm-intel
1cd8c7545d8d drm/i915/dp: Add FEC Enable Retry mechanism


