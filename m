Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D4C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 16:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310DC10E5FD;
	Tue, 21 Jan 2025 16:03:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658FA10E5FD;
 Tue, 21 Jan 2025 16:03:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Use_hint_f?=
 =?utf-8?q?or_guc_to_set_GT_frequency?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 16:03:54 -0000
Message-ID: <173747543441.2635986.6401307507289367636@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250121131605.1115338-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/uapi: Use hint for guc to set GT frequency
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
commit 91c61b01d641c4e4d8d3821c0392500e4c3e5c33
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue Jan 21 18:46:05 2025 +0530

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
    
    UMD will indicate low latency hint with flag as mentioned below,
    
    *     struct drm_xe_exec_queue_create exec_queue_create = {
    *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
    *          .extensions = 0,
    *          .vm_id = vm,
    *          .num_bb_per_exec = 1,
    *          .num_eng_per_bb = 1,
    *          .instances = to_user_pointer(&instance),
    *     };
    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
    
    Link to UMD PR : https://github.com/intel/compute-runtime/pull/794
    
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
+ /mt/dim checkpatch d471f521da387883809f72b139a2013c0652bee1 drm-intel
91c61b01d641 drm/xe/uapi: Use hint for guc to set GT frequency
-:62: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#62: 
  - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)

total: 0 errors, 1 warnings, 0 checks, 162 lines checked


