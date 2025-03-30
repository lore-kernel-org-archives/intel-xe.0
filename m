Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C8CC36010
	for <intel-xe@archiver.kernel.org>; Sun, 30 Mar 2025 18:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D6A10E34E;
	Sun, 30 Mar 2025 18:18:02 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1121B10E34E;
 Sun, 30 Mar 2025 18:18:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_imple?=
 =?utf-8?q?ment_wa=5F18038517565_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Mar 2025 18:18:01 -0000
Message-ID: <174335868106.18808.7288439860429776308@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250330172616.718188-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250330172616.718188-1-vinod.govindapillai@intel.com>
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

Series: drm/i915/display: implement wa_18038517565 (rev3)
URL   : https://patchwork.freedesktop.org/series/144183/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8de346ee09711c6273a8fbc239d7faedf3069b0c
Author: Vinod Govindapillai <vinod.govindapillai@intel.com>
Date:   Sun Mar 30 20:26:16 2025 +0300

    drm/i915/display: implement wa_18038517565
    
    Disable FBC compressor clock gating before enabling FBC and
    clear it after disabling FBC.
    
    v2: update the DG2 registers for this wa
    
    v3: use local variable and single line reg definition (Jani)
    
    Bspec: 74212, 72197, 69741, 65555
    Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
+ /mt/dim checkpatch e5666096aca27527596cf05ff22425f56e40dd40 drm-intel
8de346ee0971 drm/i915/display: implement wa_18038517565
-:81: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#81: FILE: drivers/gpu/drm/i915/i915_reg.h:4248:
+#define MTL_PIPE_CLKGATE_DIS2(pipe)		_MMIO_PIPE(pipe, _MTL_PIPE_CLKGATE_DIS2_A, _MTL_PIPE_CLKGATE_DIS2_B)

total: 0 errors, 1 warnings, 0 checks, 58 lines checked


