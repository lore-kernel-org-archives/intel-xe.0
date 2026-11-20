Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAAD606A33F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 04:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0657010E0F8;
	Fri, 20 Nov 2026 04:03:37 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1110E0F8;
 Fri, 20 Nov 2026 04:03:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Serialize_migra?=
 =?utf-8?q?te_ULLS_enter_against_a_pending_exit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 04:03:36 -0000
Message-ID: <179514741600.56376.17879144982329258298@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261120004635.3902529-1-fei.yang@intel.com>
In-Reply-To: <20261120004635.3902529-1-fei.yang@intel.com>
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

Series: drm/xe: Serialize migrate ULLS enter against a pending exit (rev2)
URL   : https://patchwork.freedesktop.org/series/179157/
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
commit c0d89e703d4396e2bcc67d833293adc1917524c5
Author: Fei Yang <fei.yang@intel.com>
Date:   Thu Nov 19 16:46:35 2026 -0800

    drm/xe: Serialize migrate ULLS enter against a pending exit
    
    xe_migrate_ulls_exit() clears ulls.enabled as soon as the ULLS_EXIT job is
    pushed, and drops job_mutex without waiting for it. A page fault arriving
    in that window finds ULLS disabled and pushes a ULLS_ENTER job while the
    previous ULLS chain is still executing.
    
    ULLS_ENTER is not chained, so submit_exec_queue() publishes its ring tail
    with xe_lrc_set_ring_tail(). That only updates the saved tail in the
    context image, which is what a context restore loads RING_TAIL from. It is
    therefore correct for a context that is off the hardware - but the context
    only leaves the hardware once the exit job has retired.
    
    Submitted before then, that write races the postamble of the job preceding
    the exit job. The postamble publishes the same saved tail, and RING_TAIL,
    at the end of the exit job. If it lands after the CPU's write the tail is
    rewound behind the enter job, which the command streamer never executes.
    Its fence never signals, so job_cnt never drops, xe_exec_queue_is_idle()
    stays false and the exit worker re-arms itself forever while the context
    sits parked on the engine.
    
    Wait for the exit job's fence in the exit worker before dropping
    job_mutex. xe_migrate_ulls_enter() takes job_mutex to submit, so it is
    serialized behind the exit job retiring. The exit job carries no batch
    and is only pushed once the queue is idle, so the wait is short and
    depends on nothing else on the queue.
    
    Fixes: 8ab0d5ca31ca ("drm/xe: Add ULLS migration job support to migration layer")
    Assisted-by: LLM
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9bf864cd53c8e7651a038b9be01b2b0dfc67b420 drm-intel
c0d89e703d43 drm/xe: Serialize migrate ULLS enter against a pending exit
-:32: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#32: 
Assisted-by: LLM

-:32: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#32: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 27 lines checked


