Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9E4C02192
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 00:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830B10E13A;
	Tue,  4 Feb 2025 00:00:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBEE10E13A;
 Tue,  4 Feb 2025 00:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pxp=3A_Fail_the_lo?=
 =?utf-8?q?ad_if_PXP_fails_to_initialize?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 00:00:37 -0000
Message-ID: <173862723731.558257.4778448016522966052@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250203234857.1419637-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe/pxp: Fail the load if PXP fails to initialize
URL   : https://patchwork.freedesktop.org/series/144280/
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
commit d6a7ee579a02578ae117d777e5f9ba6070f41cfb
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Feb 3 15:48:57 2025 -0800

    drm/xe/pxp: Fail the load if PXP fails to initialize
    
    The PXP implementation mimics the i915 approach of allowing the load
    to continue even if PXP init has failed. On Xe however we're taking an
    harder stance on boot error and only allowing the load to complete if
    everything is working, so update the code to fail if anything goes wrong
    during PXP init.
    
    While at it, update the return code in case of PXP not supported to be 0
    instead of EOPNOTSUPP, to follow the standard of functions called by
    xe_device_probe where every non-zero value means failure.
    
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db drm-intel
d6a7ee579a02 drm/xe/pxp: Fail the load if PXP fails to initialize


