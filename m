Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBF7606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 20:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE3C10F934;
	Tue, 17 Nov 2026 20:16:05 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFA110F934;
 Tue, 17 Nov 2026 20:16:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/atomic-helper=3A_Elim?=
 =?utf-8?q?inate_the_fake=5Fcommit_spurious_-EBUSYs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 20:16:03 -0000
Message-ID: <179494656345.39806.17881643835208042340@9ac1b63fe3ea>
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

Series: drm/atomic-helper: Eliminate the fake_commit spurious -EBUSYs
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
commit a3dff1ff62f09e2eab1a35d80512a9ce0209ab8a
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Nov 17 22:02:53 2026 +0200

    drm/tests: Test limiting the run-ahead of fake commit only commits
    
    Add a test that floods nonblocking commits touching only an unbound
    plane with swap_state(stall=false), and checks that the number of
    commits in flight stays bounded and that no hw_done wait times out.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch b2c580ade02a1a0749eb3e226934bb817dd65e1d drm-intel
ff937067cc1e drm/atomic-helper: Limit run-ahead of fake commit only commits
c16851361975 drm/atomic-helper: Complete fake_commit->flip_done in setup_commit
62b5cda6f126 drm/tests: Test fake_commit->flip_done completion
6193614c82dc drm/atomic: Store the device in drm_crtc_commit
1df427ce7bd8 drm/tests: Test the device stored in drm_crtc_commit
a3dff1ff62f0 drm/tests: Test limiting the run-ahead of fake commit only commits
-:48: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#48: FILE: drivers/gpu/drm/tests/drm_atomic_commit_test.c:514:
+	msleep(2);

-:105: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see function description of msleep().
#105: FILE: drivers/gpu/drm/tests/drm_atomic_commit_test.c:571:
+		msleep(10);

total: 0 errors, 2 warnings, 0 checks, 102 lines checked


