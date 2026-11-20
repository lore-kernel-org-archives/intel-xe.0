Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B0606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:33:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76972112AEF;
	Fri, 20 Nov 2026 14:33:23 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C08112AEB;
 Fri, 20 Nov 2026 14:33:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DP-HDMI_PCON_DSC_fixes_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 14:33:22 -0000
Message-ID: <179518520220.60009.6009318452613039271@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: DP-HDMI PCON DSC fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/171346/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ff066773fb782549adf1b77dcfc5e9fc6d86adaa
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri Nov 20 19:37:29 2026 +0530

    drm/i915/dp: Accept DSC 1.2a pass-through modes in the PCON mode check
    
    An HDMI 2.1 PCON that supports DSC pass-through can forward a DSC 1.2a
    stream of the source to the HDMI sink as is. The mode check only
    considered the PCON DSC encoder, which can re-encode just a DSC 1.1
    stream, so modes that need DSC on the HDMI link were never accepted for
    a DSC 1.2a source.
    
    Now that the pass-through is selected when computing the config, accept
    such a mode if the PCON supports pass-through and the lowest compressed
    bpp the HDMI sink supports fits the FRL bandwidth. The stream
    parameters are only known once the DP link is computed, so this is just
    a rough estimate, the config computation does the exact check.
    
    Assisted-by: LLM
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 5273820504a824f0c81ed31f939599dd0da3fc69 drm-intel
2d697c6729c6 drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
10f10ce2464f drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
4f7d87ef908b drm/i915/dp: Add a wrapper to check frl/tmds downstream constraints
1d406bb3315e drm/i915/dp: Use the common downstream bw check in compute_bpc
58a9727088fa drm/i915/hdmi: Expose DSC min/max bpp helpers
47dfc075f0f0 drm/i915/hdmi: Add helper to check if DSC chunksize fits the sink limits
9e5709fc69a8 drm/i915/hdmi: Pass pixel clock to DSC slice helper
1481d78921b2 drm/i915/dp: Account for FRL 16b/18b encoding overhead
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: LLM

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#15: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 13 lines checked
fe864079e51f drm/i915/hdmi: Clamp the target_bpp only when it equals the link bpp
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: LLM

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#21: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 40 lines checked
b95af584eb55 drm/i915/dp: Add PCON DSC state to crtc_state
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#20: 
Assisted-by: LLM

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#20: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 76 lines checked
dfdeadbb5caa drm/dp: Add a helper to disable the PCON DSC encoder
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 36 lines checked
9dd3e8f11337 drm/i915/dp: Compute the PCON DSC operation
-:13: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#13: 
Assisted-by: LLM

-:13: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#13: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 36 lines checked
9c4bf9713e0b drm/i915/dp: Disable the PCON DSC encoder unless it is needed
-:18: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#18: 
Assisted-by: LLM

-:18: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#18: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 13 lines checked
0e955216aebc drm/i915/dp: Clamp PCON DSC bpp to the FRL link bandwidth
-:15: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#15: 
Assisted-by: LLM

-:15: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#15: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 43 lines checked
5453c2b58d98 drm/i915/dp: Add a helper for the DSC stream version
-:12: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#12: 
Assisted-by: LLM

-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#12: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 41 lines checked
2c22595847fe drm/i915/dp: Add a helper for the FRL payload bandwidth
-:12: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#12: 
Assisted-by: LLM

-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#12: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 33 lines checked
427cad5e76dc drm/i915/dp: Compute the PCON DSC encoder parameters
-:21: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#21: 
Assisted-by: LLM

-:21: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#21: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 245 lines checked
e935c254de79 drm/i915/dp: Retrain the PCON FRL link from the link check work
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#22: 
Assisted-by: LLM

-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#22: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 75 lines checked
7d598238009b drm/i915/dp: Store the PCON FRL rate in the crtc state
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: LLM

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#19: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 135 lines checked
c36368226c91 drm/i915/dp: Use the FRL rate of the stream on the HDMI link
-:24: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#24: 
Assisted-by: LLM

-:24: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#24: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 108 lines checked
f1ecbb765bf5 drm/i915/dp: Allow PCON DSC modes through the FRL bw check
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#20: 
Assisted-by: LLM

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#20: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 119 lines checked
408a9ce85afd drm/i915/dp: Enable DSC pass-through in the PCON
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: LLM

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#17: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 50 lines checked
c8b8172e730c drm/i915/dp: Limit the DP link bpp for DSC pass-through to the FRL bandwidth
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#25: 
Assisted-by: LLM

-:25: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#25: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 73 lines checked
755ae2d36f85 drm/i915/dp: Select DSC pass-through in the PCON for DSC 1.2a streams
-:20: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#20: 
Assisted-by: LLM

-:20: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#20: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 99 lines checked
79f453c80061 drm/i915/dp: Allow limiting the DSC slice count for the downstream device
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: LLM

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#16: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 63 lines checked
b691041977bb drm/i915/dp: Check the HDMI sink slice limits for DSC pass-through
-:16: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#16: 
Assisted-by: LLM

-:16: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#16: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 55 lines checked
3b3f8b5f5d78 drm/i915/dp: Pick the DSC slice count for pass-through within the HDMI limits
-:17: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#17: 
Assisted-by: LLM

-:17: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#17: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 22 lines checked
d3743deeed32 drm/i915/dp: Limit the compressed bpp for pass-through to the HDMI sink
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: LLM

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#19: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 39 lines checked
ff066773fb78 drm/i915/dp: Accept DSC 1.2a pass-through modes in the PCON mode check
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#19: 
Assisted-by: LLM

-:19: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#19: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 41 lines checked


