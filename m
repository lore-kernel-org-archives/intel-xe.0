Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490DAC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 21:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059C010F1A6;
	Thu, 20 Aug 2026 21:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HeArJzXs";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E7610F18A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 21:24:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4944660A61;
 Thu, 20 Aug 2026 21:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA13D1F000E9;
 Thu, 20 Aug 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787261044;
 bh=JWCn2bBgLlw/kiSCIWk9b4Nmn/b85LrfDzBBZf7f7Ts=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HeArJzXs0PCEs0E81JQM84MzLbwGXyc39T6CMwSj4q4nNX0PU/b5y6d8sbEqMmZOi
 fJOqIfuoj7+dCdCbpCR7fdmPulPMS3kVUGo12scQK85+i9F/QK8rL+Q9YcNMaDxK+A
 iMwb3MKiQ96WdoxLyJYrbVs7kx4nazKEoEj/vIIpfd1OsXko32r4Nd1iH3kDTCq1ck
 5tFliVLUlP2cV3gfaWuqq0FlwqivZ85dglJav95cybCVHUfdVLgWVNnd8ElU0sbjgK
 1EVjEaOHFqYkQdp2tnn5ZaY134/iI+wXiJO+7DB6CgdOTUa1DzA41QkUkJLOLRV5Ch
 c6RuLOk595PiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] drm/xe: Taint kernel when debug configfs
 parameters are set
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820210639.107524-22-stuart.summers@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-22-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 21:24:03 +0000
Message-Id: <20260820212403.CA13D1F000E9@smtp.kernel.org>
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
- [High] An out-of-bounds read occurs in parse_wa_bb_lines when parsing a c=
onfigfs string that does not end with a newline or whitespace.
--

--- Patch [10]: [PATCH 10/10] drm/xe: Taint kernel when debug configfs para=
meters are set ---
commit 7e0ffcb5910459cff420b85bbfb7e80c0fa6b9b1
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Taint kernel when debug configfs parameters are set

Writing any debug configfs attribute indicates the system is running
in a non-standard configuration that may mask bugs or produce misleading
behaviour. Taint the kernel with TAINT_TEST on each successful write so
bug reports clearly reflect when debug settings were active.

> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/=
xe_configfs_debug.c
> index 2429d11f27a75..6cd206ec2ec4f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs_debug.c
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
[ ... ]
> @@ -528,6 +533,7 @@ static ssize_t wa_bb_store(struct wa_bb wa_bb[static =
XE_ENGINE_CLASS_MAX],
> =20
>  	if (!count) {
>  		memset(wa_bb, 0, sizeof(tmp_wa_bb));
> +		add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>  		return len;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but can this lead to an
out-of-bounds read in parse_wa_bb_lines() when called from wa_bb_store()?

If userspace writes a string to the configfs attribute that does not end
with a trailing newline (e.g., echo -n 'rcs cmd 1'), the inner parsing
logic in parse_wa_bb_lines() processes the tokens and leaves the pointer
at the null terminator:

drivers/gpu/drm/xe/xe_configfs_debug.c:parse_wa_bb_lines() {
    ...
    for (p =3D lines; *p; p++) {
        ...
        if (str_has_prefix(p, "cmd")) {
            for (p +=3D strlen("cmd"); *p;) {
                ret =3D parse_hex(p, &val);
                ...
                p +=3D ret;
            }
        }
        ...
    }
}

Because the outer loop unconditionally increments the pointer with p++ at t=
he
end of each iteration, if p is already at the null terminator ('\0') after
the inner parsing, p++ pushes it out-of-bounds. The subsequent outer loop
condition check *p then reads out-of-bounds memory.

If the configfs input string is exactly 4095 bytes long, this read could
cross the PAGE_SIZE boundary of the allocated buffer and trigger a kernel
panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820210639.1075=
24-12-stuart.summers@intel.com?part=3D10
