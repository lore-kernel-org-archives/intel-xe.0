Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F24606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 07:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C4410E3E6;
	Mon, 16 Nov 2026 07:54:52 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2C710E1F1;
 Mon, 16 Nov 2026 07:54:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gt=3A_Wait_for_con?=
 =?utf-8?q?text_teardown_between_default_LRC_recordings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 07:54:52 -0000
Message-ID: <179481569225.28029.10726208881856550763@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116082716.2636317-2-nitin.r.gote@intel.com>
In-Reply-To: <20261116082716.2636317-2-nitin.r.gote@intel.com>
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

Series: drm/xe/gt: Wait for context teardown between default LRC recordings
URL   : https://patchwork.freedesktop.org/series/178636/
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
commit 77b8e5a636c8a95b87742a73be0cddf317053f7b
Author: Nitin Gote <nitin.r.gote@intel.com>
Date:   Mon Nov 16 13:57:17 2026 +0530

    drm/xe/gt: Wait for context teardown between default LRC recordings
    
    xe_gt_record_default_lrcs() records one engine at a time and drops its
    q and nop_q once the default LRC image has been captured. However, the
    associated contexts are torn down asynchronously. The LRCs and their
    GGTT ranges are freed only after GuC acknowledges the deregistration and
    the destroy worker completes cleanup.
    
    This allows cleanup from one engine to overlap recording of the next
    engine. In that window, the next engine's nop_q can reuse GGTT ranges
    previously used by a recorded engine while that engine still has the old
    nop_q loaded as its current context.
    
    On CRI with ctx_restore_mid_bb enabled for compute, bcs1 is recorded
    immediately before ccs0. If ccs0's nop_q reuses GGTT ranges previously
    used by bcs1's nop_q, the q -> nop_q switch can fail, GuC reports a
    Memory CAT error, emit_nop_job() times out, and probe fails.
    
    Wait for both queue GuC IDs to be released and flush the destroy worker
    before recording the next engine. This guarantees complete context
    teardown before any new context allocation or execution.
    
    Assisted-by: LLM
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
+ /mt/dim checkpatch 62b32c6a54fa750e1bd8d18f88a87635e9bf01df drm-intel
77b8e5a636c8 drm/xe/gt: Wait for context teardown between default LRC recordings
-:27: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#27: 
Assisted-by: LLM

-:27: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#27: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 83 lines checked


