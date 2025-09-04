Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952C4CA1010
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 00:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4108C10E096;
	Thu,  4 Sep 2025 00:09:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D81910E096;
 Thu,  4 Sep 2025 00:09:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_SLPC_po?=
 =?utf-8?q?wer_profile_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 00:09:40 -0000
Message-ID: <175694458018.300637.4547274315462144935@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250903232120.390190-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/guc: Add SLPC power profile interface (rev2)
URL   : https://patchwork.freedesktop.org/series/153723/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c9b84f86aea1f1649b9972a6beb71876044218c
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Sep 3 16:21:20 2025 -0700

    drm/xe/guc: Add SLPC power profile interface
    
    GuC has an interface to set a power profile for the SLPC algorithm.
    Base mode is default and ensures a balanced performance, power_saving
    mode has conservative up/down thresholds and is suitable for use with
    apps that typically need to be power efficient. This will result in
    lower GT frequencies, thus consuming lower power.
    
    Selected power profile will be displayed in this format:
    
    $ cat power_profile
    
      [base]    power_saving
    
    $ echo power_saving > power_profile
    $ cat power_profile
    
      base    [power_saving]
    
    v2: Address review comments (Rodrigo)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 2b95afd5f659a01a6fc8195358e62077846b97e7 drm-intel
6c9b84f86aea drm/xe/guc: Add SLPC power profile interface
-:75: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#75: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:253:
+}
+static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);

total: 0 errors, 0 warnings, 1 checks, 156 lines checked


