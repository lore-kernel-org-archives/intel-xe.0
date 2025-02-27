Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7977DC1B087
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 11:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9D710EAB3;
	Thu, 27 Feb 2025 11:53:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550510EAB3;
 Thu, 27 Feb 2025 11:53:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_fault_injec?=
 =?utf-8?q?tion_for_xe=5Foa=5Falloc=5Fregs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 11:53:42 -0000
Message-ID: <174065722267.2679845.2439183209136250004@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
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

Series: drm/xe: Add fault injection for xe_oa_alloc_regs
URL   : https://patchwork.freedesktop.org/series/145564/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit beb984ae61496127eb1ecefc5a051134c84123d9
Author: Nakshtra Goyal <nakshtra.goyal@intel.com>
Date:   Thu Feb 27 15:53:39 2025 +0530

    drm/xe: Add fault injection for xe_oa_alloc_regs
    
    Add fault injection for xe_oa_alloc_regs to allow it to fail while
    executing xe_oa_add_config_ioctl().
    This need to be added as it cannot be reached by injecting error through
    IOCTL arguments.
    
    Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 1a52d296ec3278de76f33064361b059a152c3fc3 drm-intel
beb984ae6149 drm/xe: Add fault injection for xe_oa_alloc_regs


