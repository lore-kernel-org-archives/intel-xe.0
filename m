Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79FECED62A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 08:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BA910E686;
	Wed,  9 Oct 2024 08:28:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E410E686;
 Wed,  9 Oct 2024 08:28:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2lpg=3A_Extend_W?=
 =?utf-8?q?a=5F15016589081_for_xe2lpg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 08:28:22 -0000
Message-ID: <172846250260.1208062.13739628654932418116@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009065542.283151-1-aradhya.bhatia@intel.com>
In-Reply-To: <20241009065542.283151-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg
URL   : https://patchwork.freedesktop.org/series/139750/
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
commit b0bf393ab5c0401297f4e0e28d56e4d23bf6bd93
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Wed Oct 9 12:25:42 2024 +0530

    drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg
    
    Add workaround (wa) 15016589081 which applies to Xe2_v3_LPG_MD.
    
    Xe2_v3_LPG_MD is a Lunar Lake platform with GFX version: 20.04.
    This wa is type: permanent, and hence is applicable on all steppings.
    
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 97b4690ecb1eafab876fe8be401d0d45bb5eb5ff drm-intel
b0bf393ab5c0 drm/xe/xe2lpg: Extend Wa_15016589081 for xe2lpg


