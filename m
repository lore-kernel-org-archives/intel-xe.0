Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC8606A326
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 16:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3710FCE2;
	Wed,  4 Nov 2026 16:00:20 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEBF10FCC8;
 Wed,  4 Nov 2026 16:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/i915/displa?=
 =?utf-8?q?y=3A_Don=27t_drop_the_async-put_delay_on_self-requeue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wentao Guan" <guanwentao@uniontech.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Nov 2026 16:00:18 -0000
Message-ID: <179380801896.118041.18315799389027793048@221881a7231d>
X-Patchwork-Hint: ignore
References: <134A26B6BCDD3C9C+20261104053910.1065103-1-guanwentao@uniontech.com>
In-Reply-To: <134A26B6BCDD3C9C+20261104053910.1065103-1-guanwentao@uniontech.com>
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
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/display: Don't drop the async-put delay on self-requeue
URL   : https://patchwork.freedesktop.org/series/177738/
State : failure

== Summary ==

Series author address 'guanwentao@uniontech.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1332529/ (on master)


