Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8740E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 05:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B8D10E46E;
	Thu, 19 Dec 2024 05:11:24 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0097910E46E;
 Thu, 19 Dec 2024 05:11:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_Make_GSCCS_?=
 =?utf-8?q?disabling_message_less_alarming?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 05:11:23 -0000
Message-ID: <173458508399.304130.1714142181880014459@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/gsc: Make GSCCS disabling message less alarming
URL   : https://patchwork.freedesktop.org/series/142811/
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
commit 94f531a07e6f8e82b1a23efa1051b3de3676db84
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Dec 18 17:09:24 2024 -0800

    drm/xe/gsc: Make GSCCS disabling message less alarming
    
    The GSCCS is only used to transport messages from the driver to the GSC
    FW; therefore, we can disable it if we're not using the FW, which is
    the case on both BMG and PTL. However, the current wording of the logged
    message could be interpreted as a problem, so reword to make it clearer
    it is not an error and lower it debug verbosity as users don't really
    need to know about it.
    
    Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3866
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch f0dab21571bf17512904e5c395817305acaa351a drm-intel
94f531a07e6f drm/xe/gsc: Make GSCCS disabling message less alarming


