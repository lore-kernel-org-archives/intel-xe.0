Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB5D5AE4C
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 03:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C310E22C;
	Thu,  7 Nov 2024 03:27:26 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AED610E22D;
 Thu,  7 Nov 2024 03:27:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Handle_H?=
 =?utf-8?q?DCP_Line_Rekeying_for_HDCP_1=2E4_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Nov 2024 03:27:25 -0000
Message-ID: <173095004528.1420019.6248013060889641962@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107022807.869744-1-suraj.kandpal@intel.com>
In-Reply-To: <20241107022807.869744-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4 (rev4)
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
commit 081dae99893f2202d9e73eb7f493a5e0943854d6
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Nov 7 07:58:08 2024 +0530

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
    
    --v3
    -No need for kzalloc [Jani]
    
    --v4
    -i915_reg_t should not be pointer [Jani]
    -use rekey_bit to ensure when writing to reg everything is initialized
    
    Bspec: 69964, 50493, 50054
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 drm-intel
081dae99893f drm/i915/hdcp: Handle HDCP Line Rekeying for HDCP 1.4


