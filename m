Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71413C369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 12:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231DB10E48B;
	Mon, 28 Apr 2025 12:11:07 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF22410E48B;
 Mon, 28 Apr 2025 12:11:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_imple?=
 =?utf-8?q?ment_wa=5F14022269668_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 12:11:05 -0000
Message-ID: <174584226571.19834.1983052776453516279@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428115554.116780-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250428115554.116780-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/display: implement wa_14022269668 (rev2)
URL   : https://patchwork.freedesktop.org/series/147006/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8776c40cdcbcce6998f9978c954601d2193c5c0c
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Mon Apr 28 14:55:54 2025 +0300

    drm/i915/display: implement wa_14022269668
    
    As per the WA, fbc stride need to be programmed always for bmg.
    Display driver handles the need to program the fbc stride using
    the override stride. So ensure that we always get the override
    stride in case of bmg
    
    v2: re-phrase the commit message.
    
    Bspec: 74212
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
    Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 4dfede9f7f69716060d29d84a1267f893da9dbee drm-intel
8776c40cdcbc drm/i915/display: implement wa_14022269668


