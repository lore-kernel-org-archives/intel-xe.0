Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137A4C47258
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 08:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20D910E561;
	Fri,  2 Feb 2024 08:43:24 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651410E655;
 Fri,  2 Feb 2024 08:43:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_XE_HDCP_Enablement?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 08:43:23 -0000
Message-ID: <170686340309.936097.1272173482565775723@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202083737.1088306-1-suraj.kandpal@intel.com>
In-Reply-To: <20240202083737.1088306-1-suraj.kandpal@intel.com>
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

Series: XE HDCP Enablement
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
commit 966b79c21de9e9476f23a2c7ff41d86fabcb195e
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Feb 2 14:07:38 2024 +0530

    drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile
    
    Add intel_hdcp_gsc_message to Makefile and add corresponding
    changes to xe_hdcp_gsc.c to make it build.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch a7ad037447de4ca22722972270493b23be436187 drm-intel
406252924 drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
4aa65ae2f drm/xe/hdcp: Enable HDCP for XE
966b79c21 drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile


