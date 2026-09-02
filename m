Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B806C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 22:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86EC10EFFE;
	Wed,  2 Sep 2026 22:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X5KVV6ZE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50D810EFFE
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 22:59:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 893C7600C8;
 Wed,  2 Sep 2026 22:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180AE1F000E9;
 Wed,  2 Sep 2026 22:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788389944;
 bh=wy1FrxH+GWypJmYvUGUL5RR8oyv50xVxXHQrZgg2z1g=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=X5KVV6ZEXLmaqjXZCHhJceGOhOoC5NfzadBBdeDyOPZkMOokDo16XsG1f7NY4Me6u
 sISgD0x7qIMaBSb120xE4Alx1BqnWTOX60olYB2jia3O2NeftAx8pH1AwOlnPNBI3g
 z5Fn0g+Cu9mcKL+N602md6NpHOGfj7SQNu/TUB8DfkK2RCTE7X19ZWt8DZ0WPTe7v+
 8ou03aVybiVWsTzag16h2OiuT4O9wHWjaexasHcLDYLcnaE3foknytgRuIRx+9wXo5
 ioY4ePHbU+aFmX2zRfhAs6FuR3MX0W9+umO9v9bF4Aamr1XCioOn2bKlzAOsQ6sy11
 lP1hcW0NMFzaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260902224417.879960-6-alan.previn.teres.alexis@intel.com>
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
 <20260902224417.879960-4-alan.previn.teres.alexis@intel.com>
 <20260902224417.879960-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 22:59:03 +0000
Message-Id: <20260902225904.180AE1F000E9@smtp.kernel.org>
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
- [High] Missing bounds check in `xe_guc_log_load_lic` when parsing untrust=
ed GuC log.
--

commit 91217fd983f065c8684178f4aa349f4bc46ae614
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: drm/xe/guc: Compress GuC log and CTB dump with zstd

With default settings, GuC log is 8MB in size and dumping the log is
time-consuming. In debugging scenarios, dump-to-dmesg suffers truncation lo=
ss
because CI's size limit is 2MB. Thus, compress the GuC log data dump to
address these issues and multiply any benefits from a future upgrade in CI's
size limits.

> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 538d4df0f7aa7..aaeb0f76af305 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c

[ ... ]

> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_sna=
pshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snap=
shot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
> =20
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain =3D snapshot->size;
> -	for (i =3D 0; i < snapshot->num_chunks; i++) {
> -		size_t size =3D min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix =3D i ? NULL : "[LOG].data";
> -		char suffix =3D i =3D=3D snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -=3D size;
> -	}
> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does xe_guc_log_load_lic()
have a missing bounds check when parsing an untrusted GuC log?

The function xe_guc_log_load_lic() parses an untrusted log buffer mapped
from the GuC firmware:

drivers/gpu/drm/xe/xe_guc_log.c:xe_guc_log_load_lic() {
	while (p->marker[0]) {
		int index;
		...
		offset +=3D p->size;
		p++;
	}
}

The loop unconditionally increments p without verifying that it remains
within the bounds of the snapshot->copy[0] buffer. If the firmware buffer
is corrupted, malicious, or lacks the zero marker, the loop will increment
p past the end of the buffer (which is limited to GUC_LOG_CHUNK_SIZE).

Can this cause an out-of-bounds dereference on p->marker[0] and subsequent
fields? Since this is reachable via user-space by reading the GuC log debug=
fs
file (which triggers xe_guc_log_print_lfd() -> xe_guc_log_load_lic()), a
compromised or buggy firmware could potentially cause a local DoS or system
crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902224417.8799=
60-4-alan.previn.teres.alexis@intel.com?part=3D2
