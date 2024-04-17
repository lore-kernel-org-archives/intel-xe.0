Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B013C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 06:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BC2113199;
	Wed, 17 Apr 2024 06:05:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7899D113199;
 Wed, 17 Apr 2024 06:05:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/lnl=3A_Apply_GuC_W?=
 =?utf-8?q?a=5F13011645652_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 06:05:23 -0000
Message-ID: <171333392349.1463900.7512283467027519479@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240417054802.1766359-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/lnl: Apply GuC Wa_13011645652 (rev3)
URL   : https://patchwork.freedesktop.org/series/132334/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c9098ebc7c5e56b215319344686ca12939a20fb0
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Apr 16 22:48:02 2024 -0700

    drm/xe/lnl: Apply GuC Wa_13011645652
    
    Enable WA for a bug that could cause the C6 state machine to hang
    during RC6 exit.
    
    v2: Add comment clarifying the WA (John H)
    v3: Add more details to the comment (John H)
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 6eb009a883a7ae925b3b0f0363b64a026bb4333a drm-intel
c9098ebc7c5e drm/xe/lnl: Apply GuC Wa_13011645652


