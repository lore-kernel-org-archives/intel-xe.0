Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D205EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 02:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BEE10E248;
	Fri,  8 Dec 2023 02:35:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E0CCF10E248;
 Fri,  8 Dec 2023 02:35:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DDC54A7DFF;
 Fri,  8 Dec 2023 02:35:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Add_workaro?=
 =?utf-8?q?und_16020183090?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 08 Dec 2023 02:35:52 -0000
Message-ID: <170200295290.7324.5732053279271490481@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207175117.2334022-1-lucas.demarchi@intel.com>
In-Reply-To: <20231207175117.2334022-1-lucas.demarchi@intel.com>
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

Series: drm/xe/xe2: Add workaround 16020183090
URL   : https://patchwork.freedesktop.org/series/127519/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e26f5f850fd616dc9bcfde53240d031c82ac3893
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Dec 7 09:51:17 2023 -0800

    drm/xe/xe2: Add workaround 16020183090
    
    Graphics version 20.04, used in Lunar Lake, needs WA 16020183090 for
    steppings A*. Set ENABLE_SEMAPHORE_POLL_BIT in INSTPM(RENDER_RING_BASE)
    and whitelist CSBE_DEBUG_STATUS for userspace to be able to use it
    and complement the workaround.
    
    Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
e26f5f850 drm/xe/xe2: Add workaround 16020183090


