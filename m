Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74677606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 13:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F76B10FC61;
	Wed, 28 Oct 2026 13:09:17 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B67D10FC57;
 Wed, 28 Oct 2026 13:09:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/xe/ggtt=3A_?=
 =?utf-8?q?Cut_GGTT_initialization_from_900_ms_to_37_ms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Colascione" <dancol@dancol.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 13:09:16 -0000
Message-ID: <179319295630.81681.10915836487039751592@221881a7231d>
X-Patchwork-Hint: ignore
References: <87v76m1l9k.fsf@dancol.org>
In-Reply-To: <87v76m1l9k.fsf@dancol.org>
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

Series: drm/xe/ggtt: Cut GGTT initialization from 900 ms to 37 ms
URL   : https://patchwork.freedesktop.org/series/177030/
State : failure

== Summary ==

Series author address 'dancol@dancol.org' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1325670/ (on master)


