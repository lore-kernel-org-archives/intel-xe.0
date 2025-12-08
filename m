Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E7D3B7E2
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 11:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D725C10E428;
	Mon,  8 Dec 2025 11:25:00 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E764A10E128;
 Mon,  8 Dec 2025 11:24:59 +0000 (UTC)
Received: from mobile-access-5d6aa7-235.dhcp.inet.fi ([93.106.167.235]
 helo=[192.168.8.139])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vSZMO-00000000eyv-0R7x; Mon, 08 Dec 2025 13:24:57 +0200
Message-ID: <8825c1865ec0b5c588b1b037288a47f23adb618a.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 08 Dec 2025 13:24:54 +0200
In-Reply-To: <20251127175023.1522538-2-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
 <20251127175023.1522538-2-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
Subject: Re: [PATCH 01/50] drm/dp: Parse all DSC slice count caps for eDP 1.5
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-11-27 at 19:49 +0200, Imre Deak wrote:
> eDP 1.5 supports all the slice counts reported via DP_DSC_SLICE_CAP_1,
> so adjust drm_dp_dsc_sink_max_slice_count() accordingly.
>=20
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 41 +++++++++++--------------
>  1 file changed, 18 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index f9fdf19de74a9..19564c1afba6c 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2725,15 +2725,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dp=
cd[DP_DSC_RECEIVER_CAP_SIZE],
>  {
>  	u8 slice_cap1 =3D dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
> =20
> -	if (is_edp) {
> -		/* For eDP, register DSC_SLICE_CAPABILITIES_1 gives slice count */
> -		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> -			return 4;
> -		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> -			return 2;
> -		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> -			return 1;
> -	} else {
> +	if (!is_edp) {
>  		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
>  		u8 slice_cap2 =3D dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
> =20
> @@ -2743,22 +2735,25 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_d=
pcd[DP_DSC_RECEIVER_CAP_SIZE],
>  			return 20;
>  		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
>  			return 16;
> -		if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
> -			return 12;
> -		if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
> -			return 10;
> -		if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
> -			return 8;
> -		if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
> -			return 6;
> -		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> -			return 4;
> -		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> -			return 2;
> -		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> -			return 1;
>  	}
> =20
> +	/* DP, eDP v1.5+ */
> +	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
> +		return 12;
> +	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
> +		return 10;
> +	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
> +		return 8;
> +	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
> +		return 6;
> +	/* DP, eDP v1.4+ */
> +	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
> +		return 4;
> +	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
> +		return 2;
> +	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
> +		return 1;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);

I'm assuming you decided to ignore cases where, for instance,
DP_DSC_12_PER_DP_DSC_SINK would be set even though we're using eDP <
1.5, right?

The change looks good to me, I'm just wondering what would happen in
this case.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
