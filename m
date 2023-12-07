Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C982C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 06:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ACF10E6CF;
	Thu,  7 Dec 2023 06:13:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AB8710E6CF;
 Thu,  7 Dec 2023 06:13:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 97523AADD5;
 Thu,  7 Dec 2023 06:13:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 07 Dec 2023 06:13:43 -0000
Message-ID: <170192962361.28719.2123402932009787084@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206222141.398040-1-matthew.brost@intel.com>
In-Reply-To: <20231206222141.398040-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Al?=
 =?utf-8?q?low_num=5Fbinds/num=5Fbatch=5Fbuffer_to_be_zero_IOCTLs_=28rev5?=
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

Series: Allow num_binds/num_batch_buffer to be zero IOCTLs (rev5)
URL   : https://patchwork.freedesktop.org/series/126546/
State : success

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
commit 1c8c9cf42280b1bc9ec5e0c3745820dec6fe4b93
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Dec 6 14:21:41 2023 -0800

    drm/xe: Add last fence as dependency for jobs on user exec queues
    
    The last fence must be added as a dependency for jobs on user exec
    queues as it is possible for the last fence to be a composite software
    fence (unordered, ioctl with zero bb or binds) rather than hardware
    fence (ordered, previous job on queue).
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 668d13abebbbc3812de86be1f8477475e1d90728 drm-intel
3a02e3bfa drm/xe: Use a flags field instead of bools for VMA create
12dcfeaba drm/xe: Use a flags field instead of bools for sync parse
7c911682e drm/xe: Allow num_binds == 0 in VM bind IOCTL
f7377561d drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
b2cea9ce0 drm/xe: Take in-syncs into account when num_execs or num_binds == 0
1c8c9cf42 drm/xe: Add last fence as dependency for jobs on user exec queues


