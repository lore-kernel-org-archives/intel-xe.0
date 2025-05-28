Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57CCC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 18:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEDA10E673;
	Wed, 28 May 2025 18:09:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B9F10E673;
 Wed, 28 May 2025 18:09:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Resend_pote?=
 =?utf-8?q?ntially_lost_H2G_MMIO_request_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 18:09:54 -0000
Message-ID: <174845579416.29574.17977434329517714158@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528090021.329-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250528090021.329-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Resend potentially lost H2G MMIO request (rev2)
URL   : https://patchwork.freedesktop.org/series/149575/
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
commit 9c7f1db52286f2dc67eb003e770fbbcf84cebf05
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed May 28 11:00:21 2025 +0200

    drm/xe/guc: Resend potentially lost H2G MMIO request
    
    There could be a scenario where the VF driver is resuming faster
    than the driver PF is able to complete the VF FLR sequence which
    includes reset of the VF scratch registers.  This may result in
    deletion of the ongoing HXG message (it could be either a host
    request or a GuC response).
    
    When we detect that HXG message was likey lost (scratch register
    with HXG header was zeroed) try to send this request once more
    before giving up.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
+ /mt/dim checkpatch bce15b90200d1d7d4b5ff1a6cac0b43d8bf45319 drm-intel
9c7f1db52286 drm/xe/guc: Resend potentially lost H2G MMIO request


