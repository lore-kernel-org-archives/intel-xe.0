Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D025C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145B10E7B1;
	Mon,  7 Sep 2026 11:37:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67910E7B1;
 Mon,  7 Sep 2026 11:37:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_validation_for_DMC_fi?=
 =?utf-8?q?rmware_header_parsing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 11:37:44 -0000
Message-ID: <178878106404.128644.2502415561470941112@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
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

Series: Add validation for DMC firmware header parsing (rev2)
URL   : https://patchwork.freedesktop.org/series/170410/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 09ff7bfbc78aeb4e0e70c9b287e8c2e41c0733db
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Date:   Mon Sep 7 16:07:34 2026 +0530

    drm/i915/dmc: Prevent fw_size multiplication overflow
    
    Validate the conversion of the DMC firmware size from dwords to bytes
    using check_mul_overflow() before calculating the firmware payload size.
    
    Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
    Cc: stable@vger.kernel.org
    Assisted-by: Claude-Code:Sonnet-5
    Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
    Fixes: eb805623d8b1 ("drm/i915/skl: Add support to load SKL CSR firmware.")
    Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
+ /mt/dim checkpatch c60540b13d7bacc21848ed94fd368a968454d5db drm-intel
e686dd4443cf drm/i915/dmc: Add sanity check for DMC load address
09ff7bfbc78a drm/i915/dmc: Prevent fw_size multiplication overflow
-:14: WARNING:BAD_SIGN_OFF: Duplicate signature
#14: 
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


