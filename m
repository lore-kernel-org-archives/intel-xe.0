Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DA1E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 14:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2815510EE01;
	Thu,  9 Jan 2025 14:31:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD6210EE01;
 Thu,  9 Jan 2025 14:31:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Use_exec_qu?=
 =?utf-8?q?eue_hints_for_GT_frequency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 14:31:51 -0000
Message-ID: <173643311131.1647922.12830752746529830327@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/guc: Use exec queue hints for GT frequency (rev2)
URL   : https://patchwork.freedesktop.org/series/143323/
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
commit dec08486113f0b94d990fd996fb17543582dc7e3
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jan 9 17:37:05 2025 +0530

    drm/xe/guc: Use exec queue hints for GT frequency
    
    Allow user to provide a low latency hint per exec queue. When set,
    KMD sends a hint to GuC which results in special handling for this
    exec queue. SLPC will ramp the GT frequency aggressively every time
    it switches to this exec queue.
    
    We need to enable the use of SLPC Compute strategy during init, but
    it will apply only to exec queues that set this bit during exec queue
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
    
    Note: There is outstanding issue on guc side to be not able to switch to max
    frequency as per strategy indicated by KMD, so for experminet/test result
    hardcoding apporch was taken and passed to guc as policy. Effort on debugging
    from guc side is going on in parallel.
    
    V2:
      - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
      - Add motivation to description (Lucas)
    
    Cc:dri-devel@lists.freedesktop.org
    Cc:vinay.belgaumkar@intel.com
    Cc:Michal Mrozek <michal.mrozek@intel.com>
    Cc:Szymon Morek <szymon.morek@intel.com>
    Cc:José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Acked-by: Michal Mrozek <michal.mrozek@intel.com>
+ /mt/dim checkpatch c9da975358cd0763449f08b7063ee935eace4f8c drm-intel
dec08486113f drm/xe/guc: Use exec queue hints for GT frequency
-:55: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#55: 
Note: There is outstanding issue on guc side to be not able to switch to max

-:64: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#64: 
Cc:dri-devel@lists.freedesktop.org

-:65: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#65: 
Cc:vinay.belgaumkar@intel.com

-:66: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#66: 
Cc:Michal Mrozek <michal.mrozek@intel.com>

-:67: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#67: 
Cc:Szymon Morek <szymon.morek@intel.com>

-:68: WARNING:BAD_SIGN_OFF: Use a single space after Cc:
#68: 
Cc:José Roberto de Souza <jose.souza@intel.com>

total: 0 errors, 6 warnings, 0 checks, 116 lines checked


