Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B792C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 01:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5262D10E58D;
	Wed,  6 Dec 2023 01:07:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43E8910E58D;
 Wed,  6 Dec 2023 01:07:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3EDEAAADEA;
 Wed,  6 Dec 2023 01:07:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 06 Dec 2023 01:07:04 -0000
Message-ID: <170182482425.26425.640611195697931437@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205203758.322438-1-matthew.brost@intel.com>
In-Reply-To: <20231205203758.322438-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Al?=
 =?utf-8?q?low_num=5Fbinds/num=5Fbatch=5Fbuffer_to_be_zero_IOCTLs_=28rev3?=
 =?utf-8?q?=29?=
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

Series: Allow num_binds/num_batch_buffer to be zero IOCTLs (rev3)
URL   : https://patchwork.freedesktop.org/series/126546/
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
commit 5ff1c1d7be33dbe383c0f38e6e3ab7806fad768a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 5 12:37:58 2023 -0800

    drm/xe: Take in-syncs into account when num_execs or num_binds == 0
    
    Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
    0 in execbuf IOCTL or VM bind IOCTL respectfully.
    
    v2: Wait on last fence in addition to in-fences (Thomas)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8833b1390068f7340259f5130c564cdadff5b189 drm-intel
2b10b781a drm/xe: Use a flags field instead of bools for VMA create
6b44d15e2 drm/xe: Use a flags field instead of bools for sync parse
ed59f5644 drm/xe: Allow num_binds == 0 in VM bind IOCTL
-:70: WARNING:ALLOC_WITH_MULTIPLY: Prefer kcalloc over kzalloc with multiply
#70: FILE: drivers/gpu/drm/xe/xe_vm.c:3031:
+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);

total: 0 errors, 1 warnings, 0 checks, 78 lines checked
268d09a3a drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
5ff1c1d7b drm/xe: Take in-syncs into account when num_execs or num_binds == 0


