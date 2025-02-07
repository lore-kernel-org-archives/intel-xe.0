Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ACEC02196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 07:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4F10EA3D;
	Fri,  7 Feb 2025 07:47:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEBA10EA39;
 Fri,  7 Feb 2025 07:45:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Use_hint_f?=
 =?utf-8?q?or_guc_to_set_GT_frequency_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Feb 2025 07:45:48 -0000
Message-ID: <173891434856.2499079.5443735851619715118@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/uapi: Use hint for guc to set GT frequency (rev5)
URL   : https://patchwork.freedesktop.org/series/143793/
State : warning

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
commit d2f77074c41e162223397a65b3daaa89d2675ba6
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Feb 7 11:42:22 2025 +0530

    drm/xe/uapi: Use hint for guc to set GT frequency
    
    Allow user to provide a low latency hint. When set,
    KMD sends a hint to GuC which results in special handling for that process.
    SLPC will ramp the GT frequency aggressively every time
    it switches to this process.
    
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
    
    UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
    UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
    
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
      - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
      - Add motivation to description (Lucas)
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 8459df1091780406dc06e7d4272d95e1b6e371dc drm-intel
d2f77074c41e drm/xe/uapi: Use hint for guc to set GT frequency
-:39: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#39: 
UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214

total: 0 errors, 1 warnings, 0 checks, 192 lines checked


