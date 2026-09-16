Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A4C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6905610E8C5;
	Wed, 16 Sep 2026 08:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TWkVvcnZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6496C10E851;
 Wed, 16 Sep 2026 08:35:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3172C43BD1;
 Wed, 16 Sep 2026 08:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26AD1F00893;
 Wed, 16 Sep 2026 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789547732;
 bh=W513gnMDYceLP2juk9l8h8B6cA+CtCxqvFG7ZW9cL+c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TWkVvcnZrp9vWb/jz+7uF346aS6qMrS6wzREbztQiMpb1eEQqKSRgKdtGrKKPgNny
 83Gr4iJMZvGrxBPyZ8L/irKjFMEz5PKWb6pxu0rtdavbDmVjLP502yAMn0wlQ1LB4g
 mEPB8bHEqeO4C8qho2i5Emqg9V7DYCA/Z3FYRQlaIcn9VXYd3q70u/p+y+KHHzdqXU
 V6HxIS5B/zGKD7OmfzjDkPVbxiPm3SUbmdsPt8HA6lSjQelUgHWDI6/XmIw8WCmXNr
 hNLKJJKKru0TVMtNgr9ulCDPpQYA/j+CpcldsShCBcXAKCzgMd8eLHpucyPKwHnUFV
 89RMUXBh1filA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte,
 read_data, write_data}()
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
 <e168dad72f78fdb74419da94b0a38d732159fc82.1789547331.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:35:31 +0000
Message-Id: <20260916083531.D26AD1F00893@smtp.kernel.org>
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
- [High] drm/i915/hdcp: incorrect buffer advancement in intel_dp_hdcp2_read=
_msg()
--

commit ef5e2443a19df2b1333678ad805fe64be928f4df
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915/hdcp: switch to drm_dp_dpcd_{read_byte, read_data, write_data}()

This commit switches DPCD accesses to modern functions that return 0 on suc=
cess
and negative error codes on failure. It simplifies error handling and conve=
rts
logging to use %pe and ERR_PTR().

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/d=
rm/i915/display/intel_dp_hdcp.c
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c

[ ... ]

> @@ -493,14 +493,13 @@ ssize_t get_receiver_id_list_rx_info(struct intel_c=
onnector *connector,
>  {
>  	struct intel_digital_port *dig_port =3D intel_attached_dig_port(connect=
or);
>  	struct drm_dp_aux *aux =3D &dig_port->dp.aux;
> -	ssize_t ret;
>  	u8 *rx_info =3D byte;
> +	int ret;
> =20
> -	ret =3D drm_dp_dpcd_read(aux,
> -			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
> -			       (void *)rx_info, HDCP_2_2_RXINFO_LEN);
> -	if (ret !=3D HDCP_2_2_RXINFO_LEN)
> -		return ret >=3D 0 ? -EIO : ret;
> +	ret =3D drm_dp_dpcd_read_data(aux, DP_HDCP_2_2_REG_RXINFO_OFFSET,
> +				    rx_info, HDCP_2_2_RXINFO_LEN);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Will this return value cause issues for downstream topology authentication?

Since drm_dp_dpcd_read_data() returns 0 on success (instead of the number of
bytes read), get_receiver_id_list_rx_info() now returns 0 on success.

Looking at the caller in intel_dp_hdcp2_read_msg(), it expects the return
value to be the number of bytes read so it can advance the buffer pointer:

	if (msg_id =3D=3D HDCP_2_2_REP_SEND_RECVID_LIST) {
		ret =3D get_receiver_id_list_rx_info(connector, &dev_cnt, byte);
		if (ret < 0)
			return ret;

		byte +=3D ret;

Since ret is 0, the pointer won't advance, which could cause the subsequent
payload read to overwrite the rx_info field.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1789547331.gi=
t.jani.nikula@intel.com?part=3D7
