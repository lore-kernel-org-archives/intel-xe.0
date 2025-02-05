Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3F1C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 12:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07210E78F;
	Wed,  5 Feb 2025 12:03:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B8D10E1B1;
 Wed,  5 Feb 2025 12:03:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/scheduler=3A_Remove_m?=
 =?utf-8?q?ention_of_TDR_from_scheduler_API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Feb 2025 12:03:46 -0000
Message-ID: <173875702606.1417813.3448346358841273131@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
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

Series: drm/scheduler: Remove mention of TDR from scheduler API
URL   : https://patchwork.freedesktop.org/series/144366/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8deda4951f4a9a7b8a7083c2b34513493f2bdd8
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Feb 5 11:14:27 2025 +0000

    drm/scheduler: Remove mention of TDR from scheduler API
    
    Christian suggests scheduler should not use the term TDR because it only
    can do basic timeout detection on it's own, not the full blown timeout-
    detection-and-recovery (TDR) as the term is generally understood.
    
    Attempt to rename it to a more basic drm_sched_trigger_timeout.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Suggested-by: Christian König <christian.koenig@amd.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@redhat.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <pstanner@redhat.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
+ /mt/dim checkpatch 5f025a38e4ddb453bfbf89d4ab37facf07427721 drm-intel
b8deda4951f4 drm/scheduler: Remove mention of TDR from scheduler API


