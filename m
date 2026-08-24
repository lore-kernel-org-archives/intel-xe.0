Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FBEC5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E1C10E158;
	Mon, 24 Aug 2026 16:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B3upefoQ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B110E158
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:33:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 40C346011F;
 Mon, 24 Aug 2026 16:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB171F000E9;
 Mon, 24 Aug 2026 16:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787589238;
 bh=7eRRIp+8lJ5tSpVe6jxIRjaj6msAS9K+JCLu9ekKzu8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=B3upefoQ//jZZj0PWhY/xBtfrNpmDzc5LhM+rZDDeNUvQgURkSRn3iAMCb/bp3bU0
 N1ebiFifPLo1WK3ZuoMYzk5cWuxG46fiASFa1702YWbSCrFnnDKTGOpwSSTSJfmOY3
 zNcKV1royMg+cLuIdGpTAxIsQ38aALjUkan25qmMZPj0//4iRL1vex5/Qc5rXXITLF
 4IM0kicZIgB700N3fFaVt1rUtBbm87WRPy5jqv6IHSIKHRLlmLJh1mzy/ZP8aK1c6C
 hkDJtHB/VKcaytVY+LgQGgVC1PdBwBzk/vsMLKgw91geF7TK4ZySRQhTFq4+AcsXWg
 t4M7+mtn7Kh3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/10] drm/xe/vsec: Support Crescent Island PMT
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824162317.2450380-18-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
 <20260824162317.2450380-18-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 16:33:57 +0000
Message-Id: <20260824163357.CBB171F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The VSEC PMT/Crashlog subsystem registration lacks an IS_SRIOV_VF(=
) early return guard, allowing Virtual Functions to attempt registration of=
 PF-only SOC_BASE MMIO resources.
--

--- Patch [6]: [PATCH v3 06/10] drm/xe/vsec: Support Crescent Island PMT ---
(Note: Due to system recitation restrictions, the standard inline-quoted
patch format has been altered. The following is a free-form summary of the
review findings instead of the usual inline comments.)

Commit: 375a8279959bc1d7613d31c9ae9881fa3baa2d18
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: drm/xe/vsec: Support Crescent Island PMT

This commit adds Crescent Island (CRI) discovery structure (DVSEC)
information to allow for Xe registration of PMT telemetry and crashlog.

[Severity: High]

This is a pre-existing issue, but I wanted to ask about the execution flow
in xe_vsec_init() within drivers/gpu/drm/xe/xe_vsec.c.

Does xe_vsec_init() need an IS_SRIOV_VF() early return guard to prevent
Virtual Functions from attempting to register PF-only resources?

The intel_vsec auxiliary device driver will attempt to read from restricted
offsets, such as BMG_DISCOVERY_OFFSET or CRI_DISCOVERY_OFFSET, which are
based on SOC_BASE. Since xe_vsec_init() is called unconditionally during
device probe, VFs might register the intel_vsec subsystem with headers
pointing directly to SOC_BASE.

Could this lead to MMIO timeouts or incorrect driver behavior when a
Virtual Function context attempts to access these PF-only registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824162317.2450=
380-12-michael.j.ruhl@intel.com?part=3D6
