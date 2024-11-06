Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A76D44D42
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 10:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3486F891B4;
	Wed,  6 Nov 2024 10:25:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC62891B4;
 Wed,  6 Nov 2024 10:25:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Handle_H?=
 =?utf-8?q?DCP_Line_Rekeying_for_HDCP_1=2E4?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 10:25:30 -0000
Message-ID: <173088873076.1415943.15443643781637706848@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106093840.847932-1-suraj.kandpal@intel.com>
In-Reply-To: <20241106093840.847932-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
URL   : https://patchwork.freedesktop.org/series/140994/
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
commit e1c0f5d71060e2c3df63983d2ae2f562641ff2cb
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Wed Nov 6 15:08:40 2024 +0530

    drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4
    
    TRANS_DDI_FUNC_CTL asks us to disable hdcp line rekeying when not in
    hdcp 2.2 and we are not using an hdmi transcoder and it need to be
    enabled when we are using an HDMI transcoder to enable HDCP 1.4.
    We use intel_de_rmw cycles to update TRANS_DDI_FUNC_CTL register so
    we cannot depend on the value being 0 by default everytime which calls
    for seprate handling of HDCP 1.4 case.
    
    --v2
    -Use the exising function and modify it based on a bool rather than
    have a different function [Matt]
    
    Bspec: 69964, 50493, 50054
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541 drm-intel
e1c0f5d71060 drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4


