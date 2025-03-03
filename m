Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720D7C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 10:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C310E3C5;
	Mon,  3 Mar 2025 10:55:20 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4E910E3C5;
 Mon,  3 Mar 2025 10:55:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_UAPI_support_for_low_?=
 =?utf-8?q?latency_hint_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 10:55:18 -0000
Message-ID: <174099931818.97152.11029814761300717146@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228070224.739295-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250228070224.739295-1-tejas.upadhyay@intel.com>
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

Series: Add UAPI support for low latency hint (rev3)
URL   : https://patchwork.freedesktop.org/series/143257/
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
commit b4390a3c02d8cb4cb0e5ea77802cbbd60d5cd494
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Feb 28 12:32:24 2025 +0530

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
    IGT PR: https://patchwork.freedesktop.org/patch/639989/
    
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
    
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch ef9e58a7f9d52f558aaad0e4b02de1d77ff9ca82 drm-intel
b4390a3c02d8 drm/xe/uapi: Use hint for guc to set GT frequency


