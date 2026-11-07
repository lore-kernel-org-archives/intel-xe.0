Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F04606A326
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 00:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B617910E3F4;
	Sat,  7 Nov 2026 00:07:56 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00D610E032;
 Sat,  7 Nov 2026 00:07:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Use_vzalloc?=
 =?utf-8?q?_for_GuC_log_snapshot_capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Carlos Santa" <carlos.santa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Nov 2026 00:07:54 -0000
Message-ID: <179401007497.135197.17903507014026995455@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261106234806.704033-1-carlos.santa@intel.com>
In-Reply-To: <20261106234806.704033-1-carlos.santa@intel.com>
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

Series: drm/xe/guc: Use vzalloc for GuC log snapshot capture
URL   : https://patchwork.freedesktop.org/series/178031/
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
commit 665158af2c8dfac42f299652814bdfabd1cc39a9
Author: Carlos Santa <carlos.santa@intel.com>
Date:   Fri Nov 6 15:48:06 2026 -0800

    drm/xe/guc: Use vzalloc for GuC log snapshot capture
    
    When capturing a devcoredump following a GPU engine hang,
    xe_guc_log_snapshot_alloc() attempts to break the log into 2MB (SZ_2M)
    chunks using kmalloc() under GFP_ATOMIC:
    
      kworker/u32:4: page allocation failure: order:9, mode:0x40820(GFP_ATOMIC|__GFP_COMP)
      Call Trace:
       <TASK>
       warn_alloc+0x143/0x210
       __alloc_frozen_pages_noprof+0x112c/0x2050
       __kmalloc_noprof+0x40c/0x670
       xe_guc_log_snapshot_capture+0xff/0x360 [xe]
       xe_devcoredump+0x22e/0x340 [xe]
       guc_exec_queue_timedout_job+0x6de/0xbe0 [xe]
       drm_sched_job_timedout+0xec/0x1c0 [gpu_sched]
       process_scheduled_works+0x218/0x6d0
       worker_thread+0x188/0x3e0
    
    An order-9 GFP_ATOMIC allocation requires 512 physically contiguous pages
    and strictly forbids direct reclaim and compaction. Under severe memory
    fragmentation—even when hundreds of megabytes of free order-0 pages
    remain—this allocation fails consistently. Consequently, the devcoredump
    is generated with a missing GuC log snapshot, losing critical telemetry
    needed for post-mortem hang analysis.
    
    Neither caller of xe_guc_log_snapshot_capture() (devcoredump and debugfs)
    runs in an interrupt or atomic context. Devcoredump executes from the DRM
    scheduler timeout worker (process context) and already relies on
    sleepable GFP_KERNEL allocations throughout. Furthermore, the GuC log
    snapshot buffer is purely a temporary CPU staging buffer formatted via
    xe_print_blob_ascii85() for sysfs reads; it is never accessed by GPU DMA,
    meaning physical contiguity is completely unnecessary.
    
    Drop the artificial atomic constraint, remove the high-order chunking
    and pointer array machinery, and allocate the snapshot buffer using
    vzalloc().
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Assisted-by: LLM
    Signed-off-by: Carlos Santa <carlos.santa@intel.com>
+ /mt/dim checkpatch e1eab8c2bb59cc2cca357fd48d3a4e6ac6f39123 drm-intel
665158af2c8d drm/xe/guc: Use vzalloc for GuC log snapshot capture
-:47: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#47: 
Assisted-by: LLM

-:47: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#47: 
Assisted-by: LLM

-:74: WARNING:ALLOC_WITH_SIZEOF: Prefer kzalloc_obj over kzalloc with sizeof
#74: FILE: drivers/gpu/drm/xe/xe_guc_log.c:122:
+	snapshot = kzalloc(sizeof(*snapshot), GFP_KERNEL);

total: 1 errors, 2 warnings, 0 checks, 165 lines checked


