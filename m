Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7229FC25B74
	for <intel-xe@archiver.kernel.org>; Sat, 25 May 2024 00:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D7510E064;
	Sat, 25 May 2024 00:46:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6610E068;
 Sat, 25 May 2024 00:46:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Enable_Prio?=
 =?utf-8?q?rity_Mem_Read?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 May 2024 00:46:36 -0000
Message-ID: <171659799636.2210664.17892282137919696725@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240525004933.1124012-1-pallavi.mishra@intel.com>
In-Reply-To: <20240525004933.1124012-1-pallavi.mishra@intel.com>
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

Series: drm/xe/xe2: Enable Priority Mem Read
URL   : https://patchwork.freedesktop.org/series/134038/
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
commit 38a19d1609555cce14f31cd462cd015ecb49629f
Author: Pallavi Mishra <pallavi.mishra@intel.com>
Date:   Sat May 25 06:19:33 2024 +0530

    drm/xe/xe2: Enable Priority Mem Read
    
    Enable feature to allow memory reads to take a
    priority memory path. This will reduce latency
    on the read path, but may introduce RAW hazards.
    
    Bspec: 45845, 60237, 60187, 60188
    
    Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
+ /mt/dim checkpatch 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f drm-intel
38a19d160955 drm/xe/xe2: Enable Priority Mem Read


