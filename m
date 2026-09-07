Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AFBC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 10:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557A410E789;
	Mon,  7 Sep 2026 10:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mb753mtE";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBB310E499;
 Mon,  7 Sep 2026 10:51:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BDDC340A79;
 Mon,  7 Sep 2026 10:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DED1F00ADE;
 Mon,  7 Sep 2026 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788778313;
 bh=RBpEEU4S0sBfXQ56DpmzRtiZgCRvZ1bgHjvzpiTo0ls=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Mb753mtE2a6AtJ5XEa6jugP6yei7KxhIuhu6ELnNjTabM6C426jVWG5bDryCBmEFH
 zx5373vDXGlu1XzCkIUyFfD/37tCjnIlsweSciRuiEOQhAcJyB10Z9AodO5w/qA/i5
 EkjahaA0Q83kJuln0geZfOxQ53k6BpLI3cJaJJvTt8uxwvwujtSmrQAJJJCKOXj2te
 m03+xOVWwMeI5WEGeK9n8833iuoPIk92lzz7V7Yjwx9s1RkOMtLnJTlBo3BAltoJFy
 aQl2XKI9oZnDUQ22ShMendVXzQ0pwGwUJqxH1XGzTjp/zp+c27m+21oznsUJvv3LY6
 tmlgc9ugVg+jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/i915/dmc: Add sanity check for DMC load address
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260907103731.1379922-5-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907103731.1379922-4-dibin.moolakadan.subrahmanian@intel.com>
 <20260907103731.1379922-5-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:51:53 +0000
Message-Id: <20260907105153.75DED1F00ADE@smtp.kernel.org>
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

Pre-existing issues:
- [High] NULL pointer dereference in dmc_load_program() when firmware paylo=
ad allocation fails for secondary pipes.
- [High] Firmware with fw_size =3D=3D 0 bypasses sanity checks and causes a=
 ZERO_SIZE_PTR dereference in assert_dmc_loaded().
--

commit f7a48dbeca10ad9c2178ea5ef93894eef607fc54
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/dmc: Add sanity check for DMC load address
   =20
For DMC firmware header version 3, the firmware load address is stored
in dmc_info->start_mmioaddr and later used by dmc_load_program().
Unlike the MMIO address table, the firmware load address is not
validated. Add a sanity check to ensure it is within the valid range.

> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index a191eee240d9f..051b721a08959 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -1023,6 +1023,56 @@ static void dmc_set_fw_offset(struct intel_dmc *dm=
c,
>  	}
>  }
> =20
> +/*
> + * Check if the load address is within the valid range for the given DMC=
 ID.
> + */
> +static bool dmc_load_addr_sanity_check(struct intel_dmc *dmc,
> +				       u32 start_addr, u32 payload_size,
> +				       int header_ver, enum intel_dmc_id dmc_id)
> +{
> +	struct intel_display *display =3D dmc->display;
> +	u32 start_range, end_range, end_addr;
[ ... ]
> +	if (payload_size =3D=3D 0)
> +		end_addr =3D start_addr;

[Severity: High]
This is a pre-existing issue, but this patch explicitly allows a 0-byte
payload to bypass the sanity check. If a firmware file has fw_size =3D=3D 0,
kmalloc(0) will return ZERO_SIZE_PTR, which is not NULL.

Because payload is not NULL, has_dmc_id_fw() will return true, and
assert_dmc_loaded() will try to dereference it:

intel_dmc.c:assert_dmc_loaded() {
    ...
	found =3D intel_de_read(display, DMC_PROGRAM(dmc->dmc_info[dmc_id].start_m=
mioaddr, 0));
	expected =3D dmc->dmc_info[dmc_id].payload[0];
    ...
}

Could this cause a kernel panic due to a ZERO_SIZE_PTR dereference?
Should the sanity check instead reject firmware with a 0-byte payload?

> +	else if (check_add_overflow(start_addr, payload_size - 1, &end_addr))
> +		return false;
> +
> +	if (start_addr < start_range || end_addr > end_range)
> +		return false;
> +
> +	return true;
> +}
[ ... ]
> @@ -1169,17 +1237,6 @@ static u32 parse_dmc_fw_header(struct intel_dmc *d=
mc,
>  	dmc_info->mmio_count =3D mmio_count;
>  	dmc_info->start_mmioaddr =3D start_mmioaddr;
> =20
> -	rem_size -=3D header_len_bytes;
> -
> -	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
> -	payload_size =3D dmc_header->fw_size * 4;
> -	if (rem_size < payload_size)
> -		goto error_truncated;
> -
> -	if (payload_size > dmc->max_fw_size) {
> -		drm_err(display->drm, "DMC FW too big (%u bytes)\n", payload_size);
> -		return 0;
> -	}
>  	dmc_info->dmc_fw_size =3D dmc_header->fw_size;
> =20
>  	dmc_info->payload =3D kmalloc(payload_size, GFP_KERNEL);

[Severity: High]
This isn't a bug introduced by this patch, but if kmalloc() fails here
for a secondary pipe (like DMC_FW_PIPEA), does this leave the struct in
an inconsistent state?

If kmalloc() fails, the function returns 0, but dmc_info->dmc_fw_size is
already updated. Since parse_dmc_fw() ignores the return value for
secondary pipes, could this cause a NULL pointer dereference later in
dmc_load_program()?

intel_dmc_load_program() will call dmc_load_program() which iterates
based on dmc_fw_size:

intel_dmc.c:dmc_load_program() {
	for (i =3D 0; i < dmc->dmc_info[dmc_id].dmc_fw_size; i++) {
		intel_de_write_fw(display,
				  DMC_PROGRAM(dmc->dmc_info[dmc_id].start_mmioaddr, i),
				  dmc->dmc_info[dmc_id].payload[i]);
	}
}

Would it be safer to only update dmc_fw_size after payload allocation
succeeds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907103731.1379=
922-4-dibin.moolakadan.subrahmanian@intel.com?part=3D1
