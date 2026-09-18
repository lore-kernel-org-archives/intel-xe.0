Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675C6C982D9
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0110E69E;
	Fri, 18 Sep 2026 10:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LZYZJsPF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75010E69E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:37:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0AAC160A75;
 Fri, 18 Sep 2026 10:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894931F000FF;
 Fri, 18 Sep 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789727855;
 bh=I55qY9zw6RB8xKh2KCu+OMiomnqLmAAm6JBSkaqTUGU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LZYZJsPFE7VVheyrbeNZc7dkVz7RMI2ICkpLv6511FEeXGNWTU1+IsL1kKdBUw744
 UOl+7tvNYXtjm2K5NQQifWehfchiuYdgUfuKej8Er+sfDHihXBm59KUy/q65+y0Oul
 yiimiJfiYjw9E8EihdSE8nOIH2X2dX67ADu/m0lwfeA8BJ/3mGs59DHu/XyhLbS+r/
 WDi8pd7EqDHKmk/w2y6awfYeYfehbkW5zE6BXs0eLfgg/nSVZAHsW7XC8GM1zqFxaX
 QuolW7dQcicnvzTw+oaTFzZcc8tMIf72TK7RQ1AJVTLgLoKLvggEAiEdwMjINVSAQv
 +QcHHUIZOWxlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/10] drm/xe/tests: Add KUnit tests for VF
 provisioning error handling
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260918100533.567225-22-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
 <20260918100533.567225-22-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:37:35 +0000
Message-Id: <20260918103735.894931F000FF@smtp.kernel.org>
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
- [Low] xe/tests: incorrect ABI macros used for KLV response length in stubs
--

commit c0ab3b2485a7858871113ee1bceb9e8d26f059a2
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

drm/xe/tests: Add KUnit tests for VF provisioning error handling

VF relies on the PF to provide a valid hardware configuration via GuC
KLV responses. This commit adds KUnit test cases that use the
xe_guc_mmio_send_recv() stub to inject bad KLV responses to verify the
VF error handling.

> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c b/drivers/gp=
u/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> new file mode 100644
> index 0000000000000..5202ef804240c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c
> @@ -0,0 +1,666 @@

[ ... ]

> +static inline void fill_resp_buff(u32 *response, u64 query, size_t type)
> +{
> +	if (type =3D=3D sizeof(u32)) {
> +		response[0] =3D sizeof(u32) / sizeof(u32);
> +		response[1] =3D query;
> +	} else if (type =3D=3D sizeof(u64)) {
> +		response[0] =3D sizeof(u64) / sizeof(u32);

[Severity: Low]
Does this code bypass the ABI bitfield macros? Direct integer assignment
circumvents the VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGTH and MBZ
macros for constructing the response header, which might make the test
fragile to future ABI changes.

> +		response[1] =3D lower_32_bits(query);
> +		response[2] =3D upper_32_bits(query);
> +	}
> +}

[ ... ]

> +static int xe_guc_mmio_send_recv_stub_ggtt(struct xe_guc *guc, const u32=
 *request,
> +					   u32 len, u32 *response_buf)
> +{
> +	struct kunit *test =3D kunit_get_current_test();
> +	const struct config_ggtt *c =3D test->param_value;
> +	u32 key;
> +
> +	if (c->ret)
> +		return c->ret;
> +
> +	KUNIT_ASSERT_EQ(test, FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0=
]),
> +			GUC_ACTION_VF2GUC_QUERY_SINGLE_KLV);
> +	KUNIT_ASSERT_EQ(test, len, VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_LEN);
> +	key =3D FIELD_GET(VF2GUC_QUERY_SINGLE_KLV_REQUEST_MSG_1_KEY, request[1]=
);
> +	KUNIT_ASSERT_TRUE(test,
> +			  key =3D=3D GUC_KLV_VF_CFG_GGTT_START_KEY ||
> +			  key =3D=3D GUC_KLV_VF_CFG_GGTT_SIZE_KEY);
> +
> +	response_buf[0] =3D FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0,
> +				     sizeof(u64) / sizeof(u32));

[Severity: Low]
Does this code use the correct macro for the KLV length field? It uses
GUC_HXG_RESPONSE_MSG_0_DATA0, which appears to belong to a different message
type (HXG AUX data) instead of VF2GUC_QUERY_SINGLE_KLV_RESPONSE_MSG_0_LENGT=
H.
While it happens to work, it seems to bypass the ABI definition.

> +	if (key =3D=3D GUC_KLV_VF_CFG_GGTT_START_KEY) {
> +		response_buf[1] =3D lower_32_bits(c->query.start);
> +		response_buf[2] =3D upper_32_bits(c->query.start);
> +	} else if (key =3D=3D GUC_KLV_VF_CFG_GGTT_SIZE_KEY) {
> +		response_buf[1] =3D lower_32_bits(c->query.size);
> +		response_buf[2] =3D upper_32_bits(c->query.size);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918100533.5672=
25-12-satyanarayana.k.v.p@intel.com?part=3D10
