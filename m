Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F8BEDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C3110E08D;
	Tue,  3 Mar 2026 22:49:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822AC10E08D;
 Tue,  3 Mar 2026 22:49:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_missing_ker?=
 =?utf-8?q?nel_docs_in_xe=5Fexec=5Fqueue=2Ec_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 22:49:51 -0000
Message-ID: <177257819153.310842.5721626755684439048@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303223040.140504-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260303223040.140504-2-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add missing kernel docs in xe_exec_queue.c (rev2)
URL   : https://patchwork.freedesktop.org/series/162463/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dae00594bcd0f8a0746827a8af2dc2b4e473811f
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Tue Mar 3 14:30:41 2026 -0800

    drm/xe: Add missing kernel docs in xe_exec_queue.c
    
    Add kernel doc to all exported functions that do not have
    a kernel doc in xe_exec_queue.c.
    
    v2: mention multi-lrc in comment (Matt Brost)
    
    Assisted-by: Claude 4.5 Sonnet
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cfc20c776480fda8c1b0517b187bb71ec0781cd4 drm-intel
dae00594bcd0 drm/xe: Add missing kernel docs in xe_exec_queue.c
-:11: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#11: 
Assisted-by: Claude 4.5 Sonnet

-:11: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude 4.5 Sonnet'
#11: 
Assisted-by: Claude 4.5 Sonnet

total: 1 errors, 1 warnings, 0 checks, 178 lines checked


