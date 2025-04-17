Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3028CC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 15:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E177E10EB52;
	Thu, 17 Apr 2025 15:39:42 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8905610E2B4;
 Thu, 17 Apr 2025 15:39:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Don=27t_allo?=
 =?utf-8?q?w_LMEM_provisioning_if_LMTT_isn=27t_available_on_the_device_=28re?=
 =?utf-8?q?v3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 15:39:41 -0000
Message-ID: <174490438155.15348.14133148741611099149@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417142147.278727-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250417142147.278727-1-piotr.piorkowski@intel.com>
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

Series: drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device (rev3)
URL   : https://patchwork.freedesktop.org/series/146941/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 94b7f5483e3a197bbfb5da4c01f6de19d3682f4a
Author: Piotr Piórkowski <piotr.piorkowski@intel.com>
Date:   Thu Apr 17 16:21:47 2025 +0200

    drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device
    
    The LMEM provisioning is applicable only on platforms with LMTT.
    
    v2:
     - new commit description
     - use xe_gt_assert in xe_gt_sriov_pf_config_set_lmem instead return
       error,
     - disable pf_lmem_info if LMTT is not available
    v3: fix condition in xe_gt_assert
    
    Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 830407db6fa5a871d1a6fcba1e51b42899ff57f6 drm-intel
94b7f5483e3a drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device


