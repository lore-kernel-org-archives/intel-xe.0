Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4EEC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 13:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D574B10E7CD;
	Mon, 17 Aug 2026 13:04:19 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E6110E7CA;
 Mon, 17 Aug 2026 13:04:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_LGCI=2EVerificationFailed=3A_failure_for_drm/i915/cdclk?=
 =?utf-8?q?=3A_Don=27t_force_cd2x_pipe_select_on_Xe3_in_bxt=5Fsanitize=5Fcdc?=
 =?utf-8?q?lk=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?Q2hhbmcgSmlvbmco5bi454KvKQ==?= <304750714@qq.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Aug 2026 13:04:19 -0000
Message-ID: <178697185927.59130.13610136436045934800@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260815164149.607690-1-xspeed1989@gmail.com>
In-Reply-To: <20260815164149.607690-1-xspeed1989@gmail.com>
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

Series: drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in bxt_sanitize_cdclk() (rev2)
URL   : https://patchwork.freedesktop.org/series/172268/
State : failure

== Summary ==

Series author address 'xspeed1989@gmail.com' is not on the allowlist, which prevents CI from being automatically triggered.
If you want CI to run for this series, ask Patchwork project owners to click 'retest' on the series in Patchwork.
Exception occurred during validation, bailing out!
Build URL: http://intel-gfx-ci-public.igk.intel.com:8080/job/xe_pw_trigger/1251641/ (on master)


