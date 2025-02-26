Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE9FC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 10:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81D10E8E8;
	Wed, 26 Feb 2025 10:53:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B495110E8D0;
 Wed, 26 Feb 2025 10:53:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Use_hint_f?=
 =?utf-8?q?or_guc_to_set_GT_frequency_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 10:53:35 -0000
Message-ID: <174056721573.2302904.8946514813775915584@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226095224.650351-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250226095224.650351-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/uapi: Use hint for guc to set GT frequency (rev8)
URL   : https://patchwork.freedesktop.org/series/143793/
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
commit 3bd4e092edd208a7f6c21644492ffcdafb1b189c
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Feb 26 15:22:24 2025 +0530

    drm/xe/uapi: Use hint for guc to set GT frequency
    
    Allow user to provide a low latency hint. When set, KMD sends a hint
    to GuC which results in special handling for that process. SLPC will
    ramp the GT frequency aggressively every time it switches to this
    process.
    
    We need to enable the use of SLPC Compute strategy during init, but
    it will apply only to processes that set this bit during process
    creation.
    
    Improvement with this approach as below:
    
    Before,
    
    :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
    Platform: Intel(R) OpenCL Graphics
      Device: Intel(R) Graphics [0xe20b]
        Driver version  : 24.52.0 (Linux x64)
        Compute units   : 160
        Clock frequency : 2850 MHz
        Kernel launch latency : 283.16 us
    
    After,
    
    :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
    Platform: Intel(R) OpenCL Graphics
      Device: Intel(R) Graphics [0xe20b]
        Driver version  : 24.52.0 (Linux x64)
        Compute units   : 160
        Clock frequency : 2850 MHz
    
        Kernel launch latency : 63.38 us
    
    Compute PR: https://github.com/intel/compute-runtime/pull/794
    Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
    
    V10(Lucas):
      - Remove doc from drm-uapi.rst
    v9(Vinay):
      - remove extra line, align commit message
    v8(Vinay):
      - Add separate example for using low latency hint
    v7(Jose):
      - Update UMD PR
      - applicable to all gpus
    V6:
      - init flags, remove redundant flags check (MAuld)
    V5:
      - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
      - Modify logic to restrict exec queue flags (MAuld)
    V4:
      - To make it clear, dont use exec queue word (Vinay)
      - Correct typo in description of flag (Jose/Vinay)
      - rename set_strategy api and replace ctx with exec queue(Vinay)
      - Start with 0th bit to indentify user flags (Jose)
    V3:
      - Conver user flag to kernel internal flag and use (Oak)
      - Support query config for use to check kernel support (Jose)
      - Dont need to take runtime pm (Vinay)
    V2:
      - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 planned for other hint(Szymon)
      - Add motivation to description (Lucas)
    
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch add427957df4346354020266b1a4c8241ee44331 drm-intel
3bd4e092edd2 drm/xe/uapi: Use hint for guc to set GT frequency


