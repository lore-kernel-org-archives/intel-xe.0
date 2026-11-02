Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530AB606A332
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 13:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5E10EE68;
	Mon,  2 Nov 2026 13:26:16 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C1410EE75;
 Mon,  2 Nov 2026 13:26:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/xe/xe=5Fras?=
 =?utf-8?q?=3A_Use_xe=5Flog=5Finfo_to_avoid_passing_zero_as_error_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 13:26:14 -0000
Message-ID: <179362597460.102575.836869429920257769@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261101225252.556741-1-ethantidmore06@gmail.com>
In-Reply-To: <20261101225252.556741-1-ethantidmore06@gmail.com>
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

Series: drm/xe/xe_ras: Use xe_log_info to avoid passing zero as error code
URL   : https://patchwork.freedesktop.org/series/177448/
State : failure

== Summary ==

Series author address 'ethantidmore06@gmail.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1331034/ (on master)


