Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71061606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUUj+9tt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2793110E153;
	Mon, 23 Nov 2026 15:24:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEC110E153
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 15:24:03 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FE0940438;
 Mon, 23 Nov 2026 15:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3DA1F000CF;
 Mon, 23 Nov 2026 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795447443;
 bh=AlvCe6YBxMyz3jrEI+0sp4xNuuMxgnRcsANmEtqfUJI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KUUj+9ttDyooYhiDsYobCuo49wo0RiNYDY1qBbkKdbA+27mnBfM7G0V9f9XGUKgvj
 14186w4Yj7T4X8B5Vcw6MEKCBb0aVcb3sbfMkSXo3o6KhChLrkfQZk5KjV4YsbYGww
 AYYwjrtrtpPQQIVSm8Hc66HNbs6C7DUqHt+pu7upWVqttBBuboLU8L9Qps6y17e7uM
 bcx+pswmwBKqbHLqDQXF6cn3WwErMF2MwQVk+m4RlOa27O3TOs/cvug473/oKVGe2l
 jVLdqmnLiiOdr2PciGa8DtQni7JJ+2CAg4jEyJgK02S8W0xwDYzhKc/NTfmf7Kv/Lp
 +cgUvkbaY3kSQ==
Message-ID: <sashiko-outbox-229548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/ras: Distinguish between detailed and
 aggregate counters
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261123151727.2115677-1-raag.jadav@intel.com>
References: <20261123151727.2115677-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:24:02 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/xe/ras: build failure in xe_ras_get_counter_response()
--

commit 7755d9bbd553561b2196f8bbac1d6124dbf69eea
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/ras: Distinguish between detailed and aggregate counters

This commit updates xe_ras_get_counter_response() to log whether the
queried RAS counter is detailed or aggregate along with info queue
support.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36a..4c4f8af3a78a0 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -783,7 +783,9 @@ int xe_ras_get_counter_response(struct xe_device *xe,=
 const struct xe_ras_error_
>  {
>  	struct xe_ras_get_counter_request request =3D {0};
>  	struct xe_sysctrl_mailbox_command command =3D {0};
> +	const struct xe_ras_error_product product =3D {0};
>  	struct xe_ras_error_common *common;
> +	bool detailed;
>  	size_t rlen;
>  	int ret;
> =20
> @@ -808,9 +810,11 @@ int xe_ras_get_counter_response(struct xe_device *xe=
, const struct xe_ras_error_
>  		return -EBADMSG;
> =20
>  	common =3D &response->counter.common;
> +	detailed =3D memcmp(&response->counter.product, &product, sizeof(produc=
t));
> =20
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", response->value,
> -	       comp_to_str(common->component), sev_to_str(common->severity));
> +	xe_dbg(xe, "[RAS]: get %s counter %u for %s %s %s info queue\n",
> +	       detailed ? "detailed" : "aggregate", response->value, comp_to_st=
r(common->component),
> +	       sev_to_str(common->severity), response->has_info_queue ? "with" =
: "without");

[Severity: High]
Does this fail to build because struct xe_ras_get_counter_response has no
has_info_queue member?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123151727.2115=
677-1-raag.jadav@intel.com?part=3D1
