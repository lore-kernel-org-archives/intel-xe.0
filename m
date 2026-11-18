Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B501606A331
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 23:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025010E159;
	Wed, 18 Nov 2026 23:58:53 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B003810E159;
 Wed, 18 Nov 2026 23:58:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic-helper=3A_Elim?=
 =?utf-8?q?inate_the_fake=5Fcommit_spurious_-EBUSYs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 23:58:52 -0000
Message-ID: <179504633271.47546.2430428340823998013@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117200253.27078-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261117200253.27078-1-ville.syrjala@linux.intel.com>
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

Series: drm/atomic-helper: Eliminate the fake_commit spurious -EBUSYs (rev2)
URL   : https://patchwork.freedesktop.org/series/178821/
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
commit 651300768714dcc1f11e5535d187d9d3ed878212
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Nov 18 20:33:25 2026 +0200

    drm/tests: Test limiting the run-ahead of fake commit only commits
    
    Add a test that floods nonblocking commits touching only an unbound
    plane with swap_state(stall=false), and checks that a new commit never
    gets past drm_atomic_helper_setup_commit() before the previous one has
    reached hw_done. Check that directly rather than by counting the
    commits in flight, which would depend on how quickly the commit work
    items get to run.
    
    The commit work items are always drained before the test returns, also
    when it bails out early, so that none of them can touch the device
    after it has been torn down.
    
    v2: Make sure everything is torn down before we bail (sashiko)
        Don't count the in flight commits as that is non-deterministic (sashiko)
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 48995c76e90141a4e72ceafeb3762d4a3580eeef drm-intel
e3cd35028cb2 drm/atomic-helper: Limit run-ahead of fake commit only commits
e6c3a8788c63 drm/atomic-helper: Complete fake_commit->flip_done in setup_commit
a6b1b8d04b62 drm/tests: Test fake_commit->flip_done completion
d73a272d676d drm/atomic: Store the device in drm_crtc_commit
3aeed5209ff2 drm/tests: Test the device stored in drm_crtc_commit
651300768714 drm/tests: Test limiting the run-ahead of fake commit only commits
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
    Don't count the in flight commits as that is non-deterministic (sashiko)

-:65: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#65: FILE: drivers/gpu/drm/tests/drm_atomic_commit_test.c:514:
+	msleep(2);

total: 0 errors, 2 warnings, 0 checks, 159 lines checked


