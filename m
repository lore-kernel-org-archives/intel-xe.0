Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEFDCD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 19:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A30E10E343;
	Fri,  8 May 2026 19:49:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DF410E343;
 Fri,  8 May 2026 19:49:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/multi=5Fqueue=3A_C?=
 =?utf-8?q?ode_refactor_and_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 19:49:55 -0000
Message-ID: <177826979568.53690.13960340512004322071@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe/multi_queue: Code refactor and cleanup
URL   : https://patchwork.freedesktop.org/series/166240/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5cade52b113e3cc703ac03594a33d6be8651f907
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Fri May 8 12:44:29 2026 -0700

    drm/xe/multi_queue: Refactor CGP_SYNC send path
    
    Factor the repeated CGP_SYNC action build-and-send sequence into a new
    helper guc_exec_queue_send_cgp_sync(). Drop the redundant guc parameter
    from __register_exec_queue_group() since it can be derived via
    exec_queue_to_guc(q). Remove xe_guc_exec_queue_group_add() which is now
    identical to the helper and replace its call site directly.
    
    No functional change.
    
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7943b2aad82f5e3fc862b58eef12469abf4e4b86 drm-intel
6d1ed9589602 drm/xe/multi_queue: Remove redundant assignment in guc_exec_queue_run_job
-:10: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#10: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
5cade52b113e drm/xe/multi_queue: Refactor CGP_SYNC send path
-:14: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#14: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 97 lines checked


