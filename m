Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC7606A329
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=et+unMkD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949410E85A;
	Fri, 30 Oct 2026 08:15:06 +0000 (UTC)
X-Greylist: delayed 557 seconds by postgrey-1.36 at gabe;
 Fri, 30 Oct 2026 08:14:59 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7BE10E846;
 Fri, 30 Oct 2026 08:14:59 +0000 (UTC)
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jGDDb41Fbz4HMf;
 Fri, 30 Oct 2026 09:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1793347535;
 bh=Se3koPSs6DQ6zGD5W/2cWVvCOjVr+vPRxHFjz++onwg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=et+unMkD2ILC3wHKKcw3fKmLwZORczDC2OPhDj7xdvlNyRRuIInGnByqPtaaNOtPz
 3K4Z+XF2ePKZySS1enbIwbCn/YHEf58/r6KnLzPIVBxMJrKnc/aJEEL/aOoZzBoSE+
 MFbgMCaztNNdlLVKEC0mY2b7JuIoiKC6VrVnbDdFeDThwX7tbvY2zKJa7S14iBrwI8
 3HWMi7YazrejVEBBrD2woaYkIyMaKPlPkk5xf20+iDlE5pA84xzo07jjBnfs1cTeE1
 2ZXvDpHJW4QCoOUQyjwZCGqDveewjB9BoM6zQrT6cLucj3B5NEA0G0Pgr8fPN8r57L
 YNZfxwG4FK7Tw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jGDDZ4Yqxz4Fxh;
 Fri, 30 Oct 2026 09:05:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Score: -2.898
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jGDDV5Q83z8tgB;
 Fri, 30 Oct 2026 09:05:30 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id E5E1A5F9FB;
 Fri, 30 Oct 2026 09:04:47 +0100 (CET)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3918d7f2-2c8e-4c91-8de3-ae412acc75a0@leemhuis.info>
Date: Fri, 30 Oct 2026 09:04:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/i915/display: Allow port sync on PTL
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179334748825.921469.2962837773718248811@mxe9fb.netcup.net>
X-NC-CID: CgXu/PzoZISETFZi9IR28TCiGLRx2uzTN+sBY0hwJUg+vuZt4Hw=
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/12/26 06:04, Mitul Golani wrote:
> Some dual-SST tiled displays exhibit visual corruption on PTL, with
> one tile's image vertically shifted or wrapped by a random amount
> that changes on every hotplug.
> 
> PTL supports port sync, so allow it to be used to avoid these
> display issues.

Is this fix for a recent regression still in the "to review" list of
anyone, or did it fell through the cracks? Or was this solved meanwhile
and I just missed it?

Ciao, Thorsten

> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
> Fixes: 05cffc074938 ("drm/i915/display: Implement Wa_16024710867")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index a46ab5d3d70f..a0aff087fafa 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4629,7 +4629,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
>  	 * From, xe3lpd onwards we have defeatured this with reference to
>  	 * Wa_16024710867
>  	 */
> -	if (!IS_DISPLAY_VER(display, 9, 20))
> +	if (!IS_DISPLAY_VER(display, 9, 30))
>  		return 0;
>  
>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))

