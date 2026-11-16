Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935EB606A322
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 18:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5774210F3A7;
	Mon, 16 Nov 2026 18:29:14 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3674410F3A7;
 Mon, 16 Nov 2026 18:29:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/i915/bios?=
 =?utf-8?q?=3A_Fix_reset_sequence_order_on_GLK_VBTs_with_DEASSERT=5FRESET_in?=
 =?utf-8?q?_INIT=5FOTP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas Moreno" <lucasgabmoreno@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 18:29:13 -0000
Message-ID: <179485375320.33881.10218241626628834840@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116000030.8978-1-lucasgabmoreno@gmail.com>
In-Reply-To: <20261116000030.8978-1-lucasgabmoreno@gmail.com>
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

Series: drm/i915/bios: Fix reset sequence order on GLK VBTs with DEASSERT_RESET in INIT_OTP
URL   : https://patchwork.freedesktop.org/series/178714/
State : failure

== Summary ==

Series author address 'lucasgabmoreno@gmail.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1344073/ (on master)


