Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C6C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 16:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CD6112CE8;
	Tue,  6 Feb 2024 16:53:07 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D8A112CE7;
 Tue,  6 Feb 2024 16:53:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_XE_HDCP_Enablement_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 16:53:05 -0000
Message-ID: <170723838586.1055668.5347072979440160769@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206164742.1222593-1-suraj.kandpal@intel.com>
In-Reply-To: <20240206164742.1222593-1-suraj.kandpal@intel.com>
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

Series: XE HDCP Enablement (rev2)
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
commit d6f2604dee457bb996f780cbfcf07a5a4fd31646
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Feb 6 22:17:42 2024 +0530

    drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile
    
    Add intel_hdcp_gsc_message to Makefile and add corresponding
    changes to xe_hdcp_gsc.c to make it build.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 8a42fafc783505db4f1d6a70005a5f103069c9d9 drm-intel
32d768c26 drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
40a695291 drm/xe/hdcp: Enable HDCP for XE
d6f2604de drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile


