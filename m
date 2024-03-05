Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE2C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 17:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F410E563;
	Tue,  5 Mar 2024 17:39:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5110E564;
 Tue,  5 Mar 2024 17:39:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Pipeline_evict_?=
 =?utf-8?q?/_restore_of_pinned_BOs_during_suspend_/_resume?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 17:39:53 -0000
Message-ID: <170966039319.524258.6526981089174588592@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305173503.285223-1-matthew.brost@intel.com>
In-Reply-To: <20240305173503.285223-1-matthew.brost@intel.com>
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

Series: drm/xe: Pipeline evict / restore of pinned BOs during suspend / resume
URL   : https://patchwork.freedesktop.org/series/130762/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1c44892db19af82f0a032f61b6910b9dbb042155
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Mar 5 09:35:03 2024 -0800

    drm/xe: Pipeline evict / restore of pinned BOs during suspend / resume
    
    Rather than waiting for each evict / restore of pinned BOs to complete
    just wait on migrate exec queue to be idle once during suspend / resume.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cd022390a3ebdd498bf981885763e2ed6cce44ef drm-intel
1c44892db19a drm/xe: Pipeline evict / restore of pinned BOs during suspend / resume


