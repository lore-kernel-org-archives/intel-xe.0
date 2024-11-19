Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C89ED60D0B
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 02:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AE710E5A1;
	Tue, 19 Nov 2024 02:10:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14AC10E5A1;
 Tue, 19 Nov 2024 02:10:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Disallow_OA_?=
 =?utf-8?q?from_being_enabled_on_active_exec=5Fqueue=27s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 02:10:48 -0000
Message-ID: <173198224868.107654.2415192972853838573@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119013256.680030-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241119013256.680030-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Disallow OA from being enabled on active exec_queue's
URL   : https://patchwork.freedesktop.org/series/141528/
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
commit 71385fde4e53cde4c69862d34e8aa19ff60fb726
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Nov 18 17:32:56 2024 -0800

    drm/xe/oa: Disallow OA from being enabled on active exec_queue's
    
    Enabling OA on an exec_queue toggles the OAC_CONTEXT_ENABLE bit in
    CTXT_SR_CTL register. Toggling this bit changes the size and layout of the
    underlying HW context image. Therefore, enabling OA on an already active
    exec_queue (as currently implemented in xe) is an invalid operation and can
    cause hangs. Therefore, disallow OA from being enabled on active
    exec_queue's (here, by active we mean a context on which submissions have
    previously happened).
    
    Transition from 1 -> 0 for this bit was disallowed in
    '0c8650b09a36 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream
    close")'. Here we disallow the 0 -> 1 transition on active contexts.
    
    v2: Don't export exec_queue_enabled, define new xe_exec_queue_op (M Brost)
        Directly check OAC_CONTEXT_ENABLE bit from context image (J Cavitt)
    
    Bspec: 60314
    Fixes: 2f4a730fcd2d ("drm/xe/oa: Add OAR support")
    Cc: stable@vger.kernel.org
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 drm-intel
71385fde4e53 drm/xe/oa: Disallow OA from being enabled on active exec_queue's


