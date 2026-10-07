Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832BBCA5FF1
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F0210F610;
	Wed,  7 Oct 2026 14:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DzaG2eMt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C49310F60E;
 Wed,  7 Oct 2026 14:19:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F200B41AEF;
 Wed,  7 Oct 2026 14:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC231F0089C;
 Wed,  7 Oct 2026 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791382743;
 bh=cr35rXH3khnyGPMlM9ckLcYDAxBWERVa52+0uPAx+0w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=DzaG2eMtc/sCHSXO6mOSRYh4ND5oIW7wRuj8pSJddXg2jBaFLL4N+mo88yJRImgxH
 c/lXMmRAcPGieSWrX9dGrrf9zfrIu4OLZLFW5JPlwaBEiSj27iYbgoaLfPn08gX9Jb
 KSwhIpbFRB7AxxqxIVv2lc+7pmCJwSlJECKAvVEMUD6DJfqCBhnY8zavTK99zUGQpk
 Nwm0Gd6eJRG5H1Cr9eyQBPpyWimgVWpfccrdEc0ImHAk43H8KvwfVglInzwr34+rqf
 45xHDc12KE9WfsR45HH0/c/NvFLF1cPvnukoYtK9NhrcXm7MiZXZCiNHGetUGK8lt7
 qdvSZDUeXxhkQ==
Message-ID: <sashiko-outbox-163094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] drm/i915/cx0: request TCSS power for the non-TC C20
 PHY on PTL port B
To: =?utf-8?b?QnVyYWsgR8O2bmPDvA==?= <burakgon12@gmail.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
References: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 14:19:03 +0000
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
- [High] drm/i915/tc: Race condition on global TCSS mailbox registers
- [Medium] i915/cx0: missing wait for TCSS power state to clear on disable
--

commit 61a233a7f9a55965dffb355729a4d07449153a73
Author: Burak G=C3=B6nc=C3=BC <burakgon12@gmail.com>

drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B

This commit requests TCSS power for the non-TC C20 PHY on PTL port B before
programming the PLL, waits for the acknowledgment, and releases the request
once the PLL is disabled. This mirrors what the TC PHY code does for TC por=
ts.

Link: https://github.com/therealarnold666/zenbook-duo26-Ubuntu26.04

> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index dbebd72108484..010c7db063518 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
[ ... ]
> +static void intel_cx0_request_tcss_power(struct intel_encoder *encoder, =
bool enable)
> +{
> +	struct intel_display *display =3D to_intel_display(encoder);
> +
> +	intel_tc_request_tcss_power(encoder, enable);
> +
> +	if (enable &&
> +	    intel_de_wait_for_set_ms(display, XELPDP_PORT_BUF_CTL1(display, enc=
oder->port),
> +				     XELPDP_TCSS_POWER_STATE, 5))
> +		drm_warn(display->drm, "Port %c: TCSS power request not acknowledged\n=
",
> +			 port_name(encoder->port));
> +}

[Severity: Medium]
When releasing the power request during intel_cx0pll_disable() where enable
is false, does this skip the wait-for-clear logic?

The wait condition here strictly requires enable to be true. Tearing down
power domains, such as POWER_DOMAIN_DC_OFF in intel_cx0_phy_transaction_end=
(),
while the PHY is still asynchronously powering down could cause hardware ha=
ngs
or failures on the next enable.

The corresponding TC PHY code in xelpdp_tc_phy_enable_tcss_power() appears
to correctly wait for the power state to clear via
xelpdp_tc_phy_wait_for_tcss_power(). Should a similar wait for clear be
added here when enable is false?

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i9=
15/display/intel_tc.c
> index f2d86b29c4154..2a8665d4cd0b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
[ ... ]
> +void intel_tc_request_tcss_power(struct intel_encoder *encoder, bool ena=
ble)
> +{
> +	struct intel_display *display =3D to_intel_display(encoder);
> +	intel_reg_t reg =3D XELPDP_PORT_BUF_CTL1(display, encoder->port);
> +
> +	if (!!(intel_de_read(display, reg) & XELPDP_TCSS_POWER_REQUEST) =3D=3D =
enable)
> +		return;
> +
> +	if (DISPLAY_VER(display) =3D=3D 30)
> +		xelpdp_tc_power_request_wa(display, enable);

[Severity: High]
Could this introduce a race condition on the global TCSS mailbox registers?

The TCSS mailbox registers, TCSS_DISP_MAILBOX_IN_CMD and
TCSS_DISP_MAILBOX_IN_DATA, are a single set of global MMIO registers per
display engine.

The xelpdp_tc_power_request_wa() function executes a multi-step
read-modify-write sequence on these registers:

intel_tc.c:xelpdp_tc_power_request_wa() {
	...
	intel_de_write(display, TCSS_DISP_MAILBOX_IN_DATA, enable ? 1 : 0);
	intel_de_write(display, TCSS_DISP_MAILBOX_IN_CMD,
		       TCSS_DISP_MAILBOX_IN_CMD_RUN_BUSY |
		       TCSS_DISP_MAILBOX_IN_CMD_DATA(0x1));
	...
}

This sequence currently lacks a global lock to serialize access.

By introducing a new caller here, the global mailbox is exposed to concurre=
nt
modeset paths that are only protected by display->dpll.lock. Because the
existing TC port hotplug and disconnect work items only hold the per-port
tc->lock, concurrent execution could interleave the DATA and CMD writes.

For example, if a TC port disconnects while Port B is executing a modeset,
or if two TC ports disconnect simultaneously, the mailbox command payload
could be corrupted, potentially leading to hardware handshake failures or
invalid power states. Is there a need for a global lock here to serialize
these mailbox writes?

> +
> +	intel_de_rmw(display, reg, XELPDP_TCSS_POWER_REQUEST,
> +		     enable ? XELPDP_TCSS_POWER_REQUEST : 0);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ptl-port-b=
-tcss-v1-1-240670342cd3@gmail.com?part=3D1
