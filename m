Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BE3E67A67
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 04:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739AD10E628;
	Tue,  3 Mar 2026 04:51:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3D10E628;
 Tue,  3 Mar 2026 04:51:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_missing_ker?=
 =?utf-8?q?nel_docs_in_xe=5Fexec=5Fqueue=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 04:51:45 -0000
Message-ID: <177251350528.305661.8518398084372800217@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303044611.122857-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260303044611.122857-2-niranjana.vishwanathapura@intel.com>
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

Series: drm/xe: Add missing kernel docs in xe_exec_queue.c
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
commit 4361ae85477261994463eb1d75a63028bd561331
Author: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date:   Mon Mar 2 20:46:12 2026 -0800

    drm/xe: Add missing kernel docs in xe_exec_queue.c
    
    Add kernel doc to all exported functions that do not have
    a kernel doc in xe_exec_queue.c.
    
    Assisted-by: Claude 4.5 Sonnet
    Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch 69ee18cb718c8e62d92b25235881fc562e71a143 drm-intel
4361ae854772 drm/xe: Add missing kernel docs in xe_exec_queue.c
-:9: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#9: 
Assisted-by: Claude 4.5 Sonnet

-:9: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude 4.5 Sonnet'
#9: 
Assisted-by: Claude 4.5 Sonnet

total: 1 errors, 1 warnings, 0 checks, 177 lines checked


