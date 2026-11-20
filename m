Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC975606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 00:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C6D112812;
	Fri, 20 Nov 2026 00:16:36 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D95F112812;
 Fri, 20 Nov 2026 00:16:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_FD_close_cleanup_for_XE_?=
 =?utf-8?q?=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Charles" <daniel.charles@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Nov 2026 00:16:35 -0000
Message-ID: <179513379550.55409.17992438584783102587@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261119174621.1311154-1-daniel.charles@intel.com>
In-Reply-To: <20261119174621.1311154-1-daniel.charles@intel.com>
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

Series: FD close cleanup for XE (rev6)
URL   : https://patchwork.freedesktop.org/series/175996/
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
commit b86d75579ebd58a9e95448b7d963265474c56a8c
Author: Daniel Charles <daniel.charles@intel.com>
Date:   Thu Nov 19 09:46:21 2026 -0800

    drm/xe: Synchronously wait for queue kill on FD close
    
    GuC may still schedule contexts while FD close tears down their page
    tables, producing CAT errors and engine resets. Split FD close into
    two passes: kill every queue, then wait for each queue before dropping
    its reference.
    
    Require the KILL handler to acknowledge processing before accepting a
    single scheduling-state snapshot. For multi-queue groups, all members
    wait for the primary KILL acknowledgement and scheduling state on the
    primary state waitqueue.
    
    The wait also exits on GuC submission stop, VF recovery, or wedge. On
    timeout, request a GT reset asynchronously; the wait does not establish
    hardware quiescence on those paths.
    
    v2:
     - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
     - Drop the flush_work() loop (Matt B)
     - Use xe_assert() for the killed-queue check (Matt B)
     - Merge the put loop into the kill_sync loop (Matt B)
    v3:
     - Wait on a dedicated kill_wq instead of waking ct.wq on every
       scheduling-disable SCHED_DONE (CI)
    v5: Rewrote the description for the primary KILL acknowledgement and
    per-queue state waitqueue.
    
    Assisted-by: LLM
    Signed-off-by: Daniel Charles <daniel.charles@intel.com>
+ /mt/dim checkpatch 9bf864cd53c8e7651a038b9be01b2b0dfc67b420 drm-intel
f0e7776d46ce drm/xe: Read scheduler message opcode under lock
-:14: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'stable <stable@kernel.org>', prefer 'stable@kernel.org'
#14: 
Cc: stable <stable@kernel.org>

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
0d6395ad6e73 drm/xe: Notify scheduling-state waiters per exec queue
b55e35924e1f drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
b86d75579ebd drm/xe: Synchronously wait for queue kill on FD close
-:13: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#13: 
wait for the primary KILL acknowledgement and scheduling state on the
                          ^^^^^^^^^^^^^^^

-:28: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#28: 
v5: Rewrote the description for the primary KILL acknowledgement and
                                                 ^^^^^^^^^^^^^^^

-:31: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#31: 
Assisted-by: LLM

-:31: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#31: 
Assisted-by: LLM

total: 1 errors, 3 warnings, 0 checks, 130 lines checked


