Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59015D5C0C0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 04:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864510E066;
	Tue, 16 Dec 2025 04:10:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6D10E066;
 Tue, 16 Dec 2025 04:10:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/xe/eustall?=
 =?utf-8?q?=3A_use_bitmap=5Fempty=28=29_in_xe=5Feu=5Fstall=5Fstream=5Fread?=
 =?utf-8?q?=5Flocked=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 04:10:50 -0000
Message-ID: <176585825060.91565.9787891482746972437@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215235439.330124-1-yury.norov@gmail.com>
In-Reply-To: <20251215235439.330124-1-yury.norov@gmail.com>
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

Series: drm/xe/eustall: use bitmap_empty() in xe_eu_stall_stream_read_locked()
URL   : https://patchwork.freedesktop.org/series/159056/
State : failure

== Summary ==

Address 'yury.norov@gmail.com' is not on the allowlist, which prevents CI from being triggered for this patch.
If you want Intel GFX CI to accept this address, please contact the script maintainers at i915-ci-infra@lists.freedesktop.org.
Exception occurred during validation, bailing out!


