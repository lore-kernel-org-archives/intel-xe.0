Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAAFEEAA7A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 23:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D28710E5B0;
	Thu, 14 Sep 2023 23:45:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6DE910E5B0;
 Thu, 14 Sep 2023 23:45:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9C484AADE3;
 Thu, 14 Sep 2023 23:45:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 14 Sep 2023 23:45:09 -0000
Message-ID: <169473510963.29166.6397067117664524517@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914214802.2834851-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230914214802.2834851-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Add_child_contexts_to_the_GuC_context_lookup_=28rev4=29?=
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

Series: drm/xe: Add child contexts to the GuC context lookup (rev4)
URL   : https://patchwork.freedesktop.org/series/123091/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1058b43e57520bfe83ed85eab4f15bf0f4d41cec
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Sep 14 14:48:02 2023 -0700

    drm/xe: Add child contexts to the GuC context lookup
    
    The CAT_ERROR message from the GuC provides the guc id of the context
    that caused the problem, which can be a child context. We therefore
    need to be able to match that id to the exec_queue that owns it, which
    we do by adding child context to the context lookup.
    
    While at it, fix the error path of the guc id allocation code to
    correctly free the ids allocated for parallel queues.
    
    v2: rebase on s/XE_WARN_ON/xe_assert
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/590
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cc72615f6d26226dc7a7c24af9722a5399b8f89c drm-intel
1058b43e5 drm/xe: Add child contexts to the GuC context lookup


