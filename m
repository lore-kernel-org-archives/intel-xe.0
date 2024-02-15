Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B540C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 06:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C960510E211;
	Thu, 15 Feb 2024 06:18:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12310E211;
 Thu, 15 Feb 2024 06:18:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_XE_HDCP_Enablement_=28rev?=
 =?utf-8?q?5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 06:18:10 -0000
Message-ID: <170797789025.11.15726168677195465357@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240209101412.1326176-1-suraj.kandpal@intel.com>
In-Reply-To: <20240209101412.1326176-1-suraj.kandpal@intel.com>
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

Series: XE HDCP Enablement (rev5)
URL   : https://patchwork.freedesktop.org/series/129457/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29ecad3235c7a82c638763f87bfc91e000435064
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Feb 9 15:44:12 2024 +0530

    drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile
    
    Add intel_hdcp_gsc_message to Makefile and add corresponding
    changes to xe_hdcp_gsc.c to make it build.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 16b37f41eb6fd6e98de452231506d68635fdf0c5 drm-intel
660904d6f drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
5c4fa4893 drm/xe/hdcp: Use xe_device struct
18ac05c4c drm/xe: Use gsc_proxy_init_done to check proxy status
34db8f67a drm/xe/hdcp: Enable HDCP for XE
29ecad323 drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile


