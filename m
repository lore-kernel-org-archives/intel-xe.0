Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FEDC28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 14:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F92610E49E;
	Tue, 18 Mar 2025 14:32:25 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49AB10E49E;
 Tue, 18 Mar 2025 14:32:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Disable_lit?=
 =?utf-8?q?e_restore_for_MTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Mar 2025 14:32:24 -0000
Message-ID: <174230834472.48855.7713314364283869046@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250318141802.2516616-1-zhanjun.dong@intel.com>
In-Reply-To: <20250318141802.2516616-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Disable lite restore for MTL
URL   : https://patchwork.freedesktop.org/series/146448/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://github.com/intel-lgci-fdo-gitlab-mirror/drm.maintainer-tools mt
Cloning into 'mt'...
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59b00e056955f28b6b726ed8df93d38dd2c6f51e
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Tue Mar 18 07:18:02 2025 -0700

    drm/xe/guc: Disable lite restore for MTL
    
    Lite restore for MTL is not POR for Xe, then disable it for MTL.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch a958e31a81b3267201c85b6f171419586afa792c drm-intel
59b00e056955 drm/xe/guc: Disable lite restore for MTL


