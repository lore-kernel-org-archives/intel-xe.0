Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EED0C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 10:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557E610E3FC;
	Thu,  4 Jan 2024 10:22:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE110E3FE;
 Thu,  4 Jan 2024 10:22:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vm=3A_Fix_an_error?=
 =?utf-8?q?_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 04 Jan 2024 10:22:50 -0000
Message-ID: <170436377037.9878.14414004198844085792@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20231222175904.16732-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231222175904.16732-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/vm: Fix an error path
URL   : https://patchwork.freedesktop.org/series/127999/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f7fac2c11bdaee1210c7d8ea8748510429270261
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Dec 22 18:59:04 2023 +0100

    drm/xe/vm: Fix an error path
    
    If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
    vm, we will end up dereferencing an uninitialized variable and leak a
    bo lock. Fix this.
    
    v2:
    - Updated commit message (Lucas De Marchi)
    
    Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
    Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
    Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
    Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
f7fac2c11 drm/xe/vm: Fix an error path
-:19: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '9f232f4ae249', maybe rebased or not pulled?
#19: 
Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


