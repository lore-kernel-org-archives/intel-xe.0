Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63D6606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 20:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD7210E2B9;
	Mon,  2 Nov 2026 20:53:26 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC5D10E2B9;
 Mon,  2 Nov 2026 20:53:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22io=5Furing/sqpo?=
 =?utf-8?q?ll=3A_don=27t_attach_to_a_thread_that_is_canceling=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 20:53:25 -0000
Message-ID: <179365280511.106701.1503288601064700728@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102202947.2811726-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261102202947.2811726-2-umesh.nerlige.ramappa@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Revert "io_uring/sqpoll: don't attach to a thread that is canceling" (rev2)
URL   : https://patchwork.freedesktop.org/series/177504/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 31cccac9926ff37304a43eaf5c77ac3fcece8fa6
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Mon Nov 2 12:29:48 2026 -0800

    Revert "io_uring/sqpoll: don't attach to a thread that is canceling"
    
    This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.
    
    This is resulting in igt@runner@aborted on Xe and i915 runs, so
    reverting the patch. The actual fix is still in flight on the kernel ML:
    
    [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
    
    Until that lands, revert this one.
    
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17748
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9717
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 2cd78713d917a02987f21b437561a5e1e13ddda2 drm-intel
31cccac9926f Revert "io_uring/sqpoll: don't attach to a thread that is canceling"
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17748

-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17748

total: 0 errors, 2 warnings, 0 checks, 23 lines checked


