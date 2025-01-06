Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D16FE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 04:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED36510E570;
	Mon,  6 Jan 2025 04:37:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCEE10E577;
 Mon,  6 Jan 2025 04:37:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_SSC_enablement_in_port_cl?=
 =?utf-8?q?ock_programming?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 04:37:34 -0000
Message-ID: <173613825483.4161150.7192861197533306627@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106040821.251114-1-suraj.kandpal@intel.com>
In-Reply-To: <20250106040821.251114-1-suraj.kandpal@intel.com>
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

Series: SSC enablement in port clock programming
URL   : https://patchwork.freedesktop.org/series/143128/
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
commit b26878588df02717cab60db18568e689fb07ca70
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Jan 6 09:38:21 2025 +0530

    drm/i915/cx0: Set ssc_enabled for c20 too
    
    ssc_enabled does not get set for c20 phy legacy native rates.
    This means SSC for MPLLB for legacy rates and UHBR 13.5 is never
    set. This patch makes sure we set ssc_enabled for both c10 and c20.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 856baaf960db044e0ce5e3f5d04d35a7b9879837 drm-intel
49c3e2d5e877 drm/i915/cx0: Fix SSC enablement in PORT_CLOCK_CTL
b26878588df0 drm/i915/cx0: Set ssc_enabled for c20 too


