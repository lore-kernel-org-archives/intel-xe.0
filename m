Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C0CC79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6E10E088;
	Sun,  6 Sep 2026 17:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OilaIjtL";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52110E2BD
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:29:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2202641E49;
 Sun,  6 Sep 2026 17:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74D61F00A3A;
 Sun,  6 Sep 2026 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715740;
 bh=l8v3s1wb+NiEFZIx7kqPWqXC4nUUGG4LKHy7Wmyrwlo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OilaIjtLZwV9MwBNubWgWIR74Ijk5kQ+0VQeNU5+bGyqhW/WgaERa3e+jTYl5piLs
 2u6k5mVXjkhYMmh4ZReDWNluxEkQvDPJBlYjwJ5DkdiZ/C5se01lPbOg4VjmfyuKJm
 NWJAiwBUp2EjGUK4OKs2UnoKucRQkLU4TlyrucrMlC84gx8CpT1yQt4a4+nrY0GjA+
 h5iLfBzcWT1RwP9Mg124CM6pgEKCqzTmnAP9yfabuCLBCgjHMQPnGWzDM/0K3URB7p
 axUzgDJ8cZPW488X9ubx3ZbezFRtrKVLBKcA2IB3nApcFBFSKa6MsPmde3FopIDgN6
 fRbh6kZIne3SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/12] drm/xe/cper: Emit cper record to trace buf
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-26-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-26-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:28:59 +0000
Message-Id: <20260906172859.D74D61F00A3A@smtp.kernel.org>
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
- [Low] Incorrect format specifier `%pU` is used to format `guid_t` variabl=
es, which will print them with the wrong byte order.
--

commit d2b3c6858920421ba035f9890d1e0ee71777bc35
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Emit cper record to trace buf

This commit emits CPER records to the trace buffer by adding a new
xe_error_cper tracepoint and calling it during xe_cper_record_emit().

> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_t=
race_cper.h
> new file mode 100644
> index 0000000000000..6d2dbf5048884
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
[ ... ]
> +TRACE_EVENT(xe_error_cper,
> +	TP_PROTO(struct xe_device *xe,
> +	    const guid_t *platform_id, const guid_t *fru_id,
> +	    const u8 severity,
> +	    const struct xe_cper_sec_intel_err_hdr *ihdr,
> +	    u32 cper_len, const u8 *cper),
> +	TP_ARGS(xe, platform_id, fru_id, severity, ihdr, cper_len, cper),
[ ... ]
> +	TP_printk("dev=3D%s severity=3D%d platform_id=3D%pU fru_id=3D%pU "
> +		"intel_err_hdr_raw=3D%s cper_len=3D%u cper_raw=3D%s",

[Severity: Low]
Will this print the GUIDs in the wrong byte order? The platform_id and fru_=
id
fields are populated from guid_t structures, which represent little-endian
GUIDs. The %pU format specifier expects a big-endian uuid_t, so it will out=
put
the first three segments in reverse byte order.

Should this use %pUl instead to correctly format the little-endian guid_t?

> +		__get_str(dev), __entry->sev,
> +		__entry->platform_id, __entry->fru_id,
> +		__print_hex(__entry->ihdr_raw,
> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
> +		__entry->cper_len,
> +		__print_hex(__get_dynamic_array(cper),
> +		    __entry->cper_len))
> +);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D12
