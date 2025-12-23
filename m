Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D85E6F082
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 10:57:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5D210E29E;
	Tue, 23 Dec 2025 10:57:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC20010E272;
 Tue, 23 Dec 2025 10:57:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable/Disable_DC_balance?=
 =?utf-8?q?_along_with_VRR_DSB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 10:57:01 -0000
Message-ID: <176648742166.114188.176985789784183685@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251223104542.2688548-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20251223104542.2688548-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Enable/Disable DC balance along with VRR DSB
URL   : https://patchwork.freedesktop.org/series/159419/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5e3b6585a69caeb28d807edeeb6a80857b9baeaf
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Tue Dec 23 16:15:40 2025 +0530

    drm/i915/vrr: Enable DC Balance
    
    Enable DC Balance from vrr compute config and related hw flag.
    Also to add pipe restrictions along with this.
    
    --v2:
    - Use dc balance check instead of source restriction.
    --v3:
    - Club pipe restriction check with dc balance enablement. (Ankit)
    --v4:
    - Separate out Pipe restrictions to patch#7
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch cab246648fd89efbe8d20ed4c86e7fcebd7606da drm-intel
2a066cfa123a drm/i915/display: Add source param for dc balance
655a677b2695 drm/i915/dmc: Add pipe dmc registers and bits for DC Balance
f6c9cf937a88 drm/i915/vrr: Add VRR DC balance registers
-:61: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:24:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_A, \

-:62: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#62: FILE: drivers/gpu/drm/i915/display/intel_vrr_regs.h:25:
+								    _TRANS_VRR_DCB_ADJ_FLIPLINE_CFG_LIVE_B)

total: 0 errors, 2 warnings, 0 checks, 80 lines checked
04209352278b drm/i915/vrr: Add functions to read out vmin/vmax stuff
42e9ec95ddb4 drm/i915/vrr: Add DC Balance params to crtc_state
63771037fb5e drm/i915/vrr: Add state dump for DC Balance params
f463dcc52a75 drm/i915/vrr: Add compute config for DC Balance params
6a2967f904f3 drm/i915/vrr: Add function to check if DC Balance Possible
935694999a7f drm/i915/vrr: Add function to reset DC balance accumulated params
60cebc07492f drm/i915/display: Add DC Balance flip count operations
eec9aa0e770d drm/i915/vrr: Write DC balance params to hw registers
d73900b9bcc6 drm/i915/vblank: Extract vrr_vblank_start()
b68dba468c99 drm/i915/vrr: Implement vblank evasion with DC balancing
bf2cc78c6422 drm/i915/display: Wait for VRR PUSH status update
4f8d9c906cdd drm/i915/dsb: Add pipedmc dc balance enable/disable
a61cfeac524c drm/i915/vrr: Pause DC Balancing for DSB commits
689b924aff95 drm/i915/display: Add function to configure event for dc balance
5e3b6585a69c drm/i915/vrr: Enable DC Balance


