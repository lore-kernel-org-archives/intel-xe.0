Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A1BE6C5E4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 01:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E4010E31F;
	Tue,  3 Dec 2024 01:07:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E3A10E31F;
 Tue,  3 Dec 2024 01:07:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_for_dea?=
 =?utf-8?q?d_CT_dump_not_re-arming?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 01:07:47 -0000
Message-ID: <173318806794.1825455.6730829109071442446@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203005949.3947920-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241203005949.3947920-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Fix for dead CT dump not re-arming
URL   : https://patchwork.freedesktop.org/series/142012/
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
commit 445c6fc24f4792347d340a8d382046463bd95046
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Mon Dec 2 16:59:49 2024 -0800

    drm/xe/guc: Fix for dead CT dump not re-arming
    
    The state dump on a dead CT incident deliberately disarms itself after
    running. This is to prevent a long stream of errors causing continuous
    dumps. It was supposed to re-arm itself after a reset, however that
    was not happening. The re-arm flag was being set but the worker was
    not being run to process that flag. So fix that.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 4de82d50b8de6a278c1483a7f76ae830c89d1824 drm-intel
445c6fc24f47 drm/xe/guc: Fix for dead CT dump not re-arming


