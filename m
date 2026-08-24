Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2FC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78B10E158;
	Mon, 24 Aug 2026 16:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KkLJqvyn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305E10E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:36:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 85C4660120;
 Mon, 24 Aug 2026 16:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAEE1F00A3A;
 Mon, 24 Aug 2026 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589380;
 bh=6OPGih7o4K9p6+hTvOojpUZ5h1X2h8E+O9FOeHFr/xY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KkLJqvynECrWr1Vfhm13d6PyUTYIfzfUKkfoyBGMFHWu3EfiWu9PusI7yf46hqNwU
 JhPFodnT3vg1DXZdbG4jyrnbzNC0EU3oRn8IyiTs4x8jReVZnQEWy1o/UtZP770yut
 9hvTNQMFh54hX/3IWRKVBC9Re0oAi9Y+egRNYWGRUGf+VR6QEc0Zm80AftQ2iYa3eX
 +o7Pn6KyeCc0DFsXVvWItrNIkMm5Iv3eqX+Di7fGC0pwMUOnVeca7xVunhVDlmaXRf
 nRp1Tia+aLz2CFRODMACR8mG1j1mfygmYVpwxriqC5uJU5bZ97P4I8H78s/jLF8rEE
 qraVN8QDvTfjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access
 callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-14-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-14-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:36:19 +0000
Message-Id: <20260824163620.1EAEE1F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Hardware access errors from `read_reg` and `write_reg` callbacks=
 are ignored and not propagated to sysfs callers.
- [Medium] Unratelimited pr_err() in sysfs read/write paths allows kernel l=
og flooding.
--

--- Patch [2]: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access=
 callbacks ---
Note: The format of this review is altered and does not include direct quot=
es
of the patch code due to recitation restrictions.

commit 6dda4f7e76b3694a6fb7bf21ac1d00ef75cff3ff
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: platform/x86/intel/pmt: Add register access callbacks

This commit augments the PMT callback infrastructure to allow drivers to
customize read and write access to control paths for PMT usage. It is inten=
ded
for hardware lacking direct MMIO access.

In drivers/platform/x86/intel/pmt/crashlog.c, the modified pmt_crashlog_rmw=
()
and pmt_crashlog_rc() functions check for errors from the new read_reg and
write_reg callbacks, but they do not propagate these error codes back up the
call stack.

[Severity: Medium]
Is it expected that hardware access failures are silently swallowed here?

When read_reg or write_reg fails in pmt_crashlog_rmw(), the function returns
void, and when read_reg fails in pmt_crashlog_rc(), it returns false. Becau=
se
these errors are not propagated, sysfs store operations will falsely report
success to userspace by returning the written byte count. Similarly, sysfs
reads will present hardware errors as a valid false state. Will this break
monitoring and management tools that rely on accurate return codes?

Additionally, the error handling paths in these same functions introduce
logging statements.

[Severity: Medium]
Could the unratelimited pr_err() calls in these functions cause kernel log
flooding?

If the hardware is in a state where read_reg or write_reg consistently fail=
s,
an unprivileged user reading a world-readable sysfs attribute in a tight lo=
op
will repeatedly trigger pmt_crashlog_rc(). Would it be safer to use ratelim=
ited
logging here to prevent potential syslog I/O overhead and the dropping of o=
ther
important logs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D2
