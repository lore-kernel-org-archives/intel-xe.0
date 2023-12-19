Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F2AC46CA2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 16:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FC310E2E3;
	Tue, 19 Dec 2023 16:08:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 844F910E2E3;
 Tue, 19 Dec 2023 16:08:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81B71A3ECB;
 Tue, 19 Dec 2023 16:08:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_locking/ww=5Fmutex=3A_Adj?=
 =?utf-8?q?ust_to_lockdep_nest=5Flock_requirements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 19 Dec 2023 16:08:27 -0000
Message-ID: <170300210752.17583.15090162511198260072@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231219160524.3646-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231219160524.3646-1-thomas.hellstrom@linux.intel.com>
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

Series: locking/ww_mutex: Adjust to lockdep nest_lock requirements (rev2)
URL   : https://patchwork.freedesktop.org/series/123522/
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
commit c727a02bef6811a5d81f0705b52e11ed2fc5be87
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Dec 19 17:05:24 2023 +0100

    locking/ww_mutex: Adjust to lockdep nest_lock requirements
    
    When using mutex_acquire_nest() with a nest_lock, lockdep refcounts the
    number of acquired lockdep_maps of mutexes of the same class, and also
    keeps a pointer to the first acquired lockdep_map of a class. That pointer
    is then used for various comparison-, printing- and checking purposes,
    but there is no mechanism to actively ensure that lockdep_map stays in
    memory. Instead, a warning is printed if the lockdep_map is freed and
    there are still held locks of the same lock class, even if the lockdep_map
    itself has been released.
    
    In the context of WW/WD transactions that means that if a user unlocks
    and frees a ww_mutex from within an ongoing ww transaction, and that
    mutex happens to be the first ww_mutex grabbed in the transaction,
    such a warning is printed and there might be a risk of a UAF.
    
    Note that this is only problem when lockdep is enabled and affects only
    dereferences of struct lockdep_map.
    
    Adjust to this by adding a fake lockdep_map to the acquired context and
    make sure it is the first acquired lockdep map of the associated
    ww_mutex class. Then hold it for the duration of the WW/WD transaction.
    
    This has the side effect that trying to lock a ww mutex *without* a
    ww_acquire_context but where a such context has been acquire, we'd see
    a lockdep splat. The test-ww_mutex.c selftest attempts to do that, so
    modify that particular test to not acquire a ww_acquire_context if it
    is not going to be used.
    
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Will Deacon <will@kernel.org>
    Cc: Waiman Long <longman@redhat.com>
    Cc: Boqun Feng <boqun.feng@gmail.com>
    Cc: Maarten Lankhorst <maarten@lankhorst.se>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 974cd401b8e534a6275fb4d2c0db6aea440508a6 drm-intel
c727a02be locking/ww_mutex: Adjust to lockdep nest_lock requirements


