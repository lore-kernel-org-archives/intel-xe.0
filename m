Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DC606A330
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 17:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E6510F870;
	Tue, 17 Nov 2026 17:39:24 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D410F86F;
 Tue, 17 Nov 2026 17:39:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_series_starting?=
 =?utf-8?q?_with_=5Bv3=2C1/2=5D_PM=3A_runtime=3A_fix_stub_pm=5Fruntime=5Fget?=
 =?utf-8?q?=5Fif=5Factive=28=29_for_!CONFIG=5FPM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: frank.li@oss.nxp.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 17:39:23 -0000
Message-ID: <179493716342.39111.3305965449237993002@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
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

Series: series starting with [v3,1/2] PM: runtime: fix stub pm_runtime_get_if_active() for !CONFIG_PM
URL   : https://patchwork.freedesktop.org/series/178807/
State : failure

== Summary ==

Series author address 'frank.li@oss.nxp.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1344983/ (on master)


