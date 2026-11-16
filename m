Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67F606A331
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F333810E857;
	Mon, 16 Nov 2026 15:19:11 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F397B10E857;
 Mon, 16 Nov 2026 15:19:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic=3A_Simplify_vb?=
 =?utf-8?q?lank_event_lifetime/ownership?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 15:19:10 -0000
Message-ID: <179484235099.33092.17617423955060173515@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116125649.15742-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116125649.15742-1-ville.syrjala@linux.intel.com>
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

Series: drm/atomic: Simplify vblank event lifetime/ownership
URL   : https://patchwork.freedesktop.org/series/178686/
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
commit b051745eca863dd18cc198ea5b64afad6f31f4f7
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Mon Nov 16 14:56:49 2026 +0200

    drm/tests: Test event ownership in atomic states
    
    Add KUnit tests for what happens to the event of a CRTC state that went
    through drm_atomic_helper_setup_commit(): an internally allocated event
    and an event provided by the caller must both be thrown away, releasing
    their reference on the commit, if the state is destroyed without the
    event having been consumed, while a consumed and sent event completes
    flip_done and is left alone.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 038b4cc7dba91006374b26c220bdad77c5d6bb42 drm-intel
1dbbad5d5dac drm: Add drm_event_release_completion()
d644eb66de9b drm/atomic-helper: Detach the caller's event on page flip failure
1113f974619f drm/atomic: Free unconsumed events in the CRTC state destructor
b051745eca86 drm/tests: Test event ownership in atomic states
-:165: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#165: FILE: drivers/gpu/drm/tests/drm_atomic_commit_test.c:510:
+	spinlock_t lock;

total: 0 errors, 0 warnings, 1 checks, 228 lines checked


