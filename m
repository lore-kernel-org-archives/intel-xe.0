Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F9AC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE59F10F2DD;
	Tue, 16 Apr 2024 19:57:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99EA10F2DD;
 Tue, 16 Apr 2024 19:57:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/lnl=3A_Apply_GuC_W?=
 =?utf-8?q?a=5F13011645652_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 19:57:26 -0000
Message-ID: <171329744669.1445680.10674797438642718864@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240416194106.1540872-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/lnl: Apply GuC Wa_13011645652 (rev2)
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
commit 13ffbd4a256c6eae58478f76240138517a7977e0
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Apr 16 12:41:06 2024 -0700

    drm/xe/lnl: Apply GuC Wa_13011645652
    
    Enable WA for a bug that could cause the C6 state machine to hang
    during RC6 exit.
    
    v2: Add comment clarifying the WA (John H)
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9e1dee8819c751378aece2685d1846b0bc846ce2 drm-intel
13ffbd4a256c drm/xe/lnl: Apply GuC Wa_13011645652


