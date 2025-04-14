Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F71AC369B4
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 14:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE24510E5F2;
	Mon, 14 Apr 2025 14:08:01 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E1910E5F4;
 Mon, 14 Apr 2025 14:08:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/userptr=3A_fix_not?=
 =?utf-8?q?ifier_vs_folio_deadlock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 14:08:00 -0000
Message-ID: <174463968000.2136.14230753510444302765@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250414132539.26654-2-matthew.auld@intel.com>
In-Reply-To: <20250414132539.26654-2-matthew.auld@intel.com>
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

Series: drm/xe/userptr: fix notifier vs folio deadlock
URL   : https://patchwork.freedesktop.org/series/147678/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2321ba3851883ed6e350942060ed29949024fb39
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Apr 14 14:25:40 2025 +0100

    drm/xe/userptr: fix notifier vs folio deadlock
    
    User is reporting what smells like notifier vs folio deadlock, where
    migrate_pages_batch() on core kernel side is holding folio lock(s) and
    then interacting with the mappings of it, however those mappings are
    tied to some userptr, which means calling into the notifier callback and
    grabbing the notifier lock. With perfect timing it looks possible that
    the pages we pulled from the hmm fault can get sniped by
    migrate_pages_batch() at the same time that we are holding the notifier
    lock to mark the pages as accessed/dirty, but at this point we also want
    to grab the folio locks(s) to mark them as dirty, but if they are
    contended from notifier/migrate_pages_batch side then we deadlock since
    folio lock won't be dropped until we drop the notifier lock.
    
    Fortunately the mark_page_accessed/dirty is not really needed in the
    first place it seems and should have already been done by hmm fault, so
    just remove it.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4765
    Fixes: 0a98219bcc96 ("drm/xe/hmm: Don't dereference struct page pointers without notifier lock")
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.10+
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 24805f4111e68bf0f6f7a513d2145fe7debd7eea drm-intel
2321ba385188 drm/xe/userptr: fix notifier vs folio deadlock


