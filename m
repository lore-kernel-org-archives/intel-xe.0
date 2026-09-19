Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D8C982D8
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6C10E0B1;
	Sat, 19 Sep 2026 05:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJfFGP7v";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA1A10E0B1
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 05:14:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 50E1A40809;
 Sat, 19 Sep 2026 05:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1418A1F000FF;
 Sat, 19 Sep 2026 05:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789794885;
 bh=VjjWQz06lo+sitV9BBNRtmIms5ZKKx3xiwtNUgdaWsI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bJfFGP7vkL2SZYmfREU+l/hN6MbIwplp/q87a8vaK45B3Ga8I98TqXgV8YGS+aDKn
 /GDNLuixyHz9QvnB8R18CkpQYqmS+O4py4ATBHR3cc3bvwHNssJ/8yA6KQsm5y1QXj
 5BCXwbLZOmxSLml3++zF6urDeiNEBa/MHpIRsXa5kdc02xCuHFfiHyojsRDZOf6yjR
 TCD8kEDQfyfCh0AADo8txlxZ+/bdkiAVyLt+HcAB4/bpxj0C1+MC8BaVXD2+TthfpK
 CVK45qO0XAzt8vSvtHNGJjxxAenaWw+y0eH8FfV5tP54Po157b+AUWye5Nq9ONg522
 0R+bKXrdnalug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260919050055.2092579-13-umesh.nerlige.ramappa@intel.com>
References: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
 <20260919050055.2092579-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 05:14:44 +0000
Message-Id: <20260919051445.1418A1F000FF@smtp.kernel.org>
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
- [Medium] xe_guc_ct: immediate failure on H2G corruption due to mismatched=
 error code
--

commit 81ff170e2ca7e241924429f71845781f7d3f0d95
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/guc: Cleanup error codes and handling for CT errors

This commit updates the GuC CT error handling to return more specific error
codes based on the error type rather than defaulting to -EPROTO. It also
inverts the error check in receive_g2h() to simplify reset handling.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 5dbda0fe20f37..572a52773c56a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c

[ ... ]

> @@ -1358,7 +1435,7 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct=
, const u32 *action, u32 len)
>   */
>  static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  {
> -	if (!(ret =3D=3D -EDEADLK || ret =3D=3D -EPIPE || ret =3D=3D -ENODEV))
> +	if (!(ret =3D=3D -EDEADLK || ret =3D=3D -EPERM || ret =3D=3D -ENODEV))
>  		return false;

[Severity: Medium]
When h2g_write() discovers descriptor corruption, it calls ct_corrupted() a=
nd
returns -EPIPE. Since this patch removes -EPIPE from the whitelist here in
favor of -EPERM, retry_failure() will return false and abort the send
instantly.

Does this deny the thread that discovers the corruption a chance to recover
if a GT reset occurs?

Later threads calling __guc_ct_send_locked() will observe the newly broken
state, return -EPERM, and correctly block waiting for recovery. Should the
initial -EPIPE error also be permitted to retry, or be escalated directly
to a reset?

[ ... ]

> @@ -2037,6 +2107,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>  	return 1;
>  }
> =20
> +/*
> + * Errors reported by dequeue_one_g2h() come in two flavours: either the=
 channel
> + * is simply not available right now, which is expected and handled grac=
efully,
> + * or the channel state or the message itself is inconsistent, in which =
case the
> + * only way forward is to declare the CT dead and reset the GuC. Since t=
he
> + * former is a short and well known list, check against that and treat a=
nything
> + * else as fatal, so that new error codes don't silently escape the esca=
lation.
> + */
> +static bool g2h_err_is_fatal(int err)
> +{
> +	switch (err) {
> +	case -ENOTRECOVERABLE:	/* device wedged */
> +	case -ENODEV:		/* CT disabled */
> +	case -ECANCELED:	/* CT stopped */
> +	case -EPERM:		/* CT already declared broken */
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +

[ ... ]

> @@ -2074,8 +2165,9 @@ static void receive_g2h(struct xe_guc_ct *ct)
>  		ret =3D dequeue_one_g2h(ct);
>  		mutex_unlock(&ct->lock);
> =20
> -		if (unlikely(ret =3D=3D -EPROTO || ret =3D=3D -EOPNOTSUPP)) {
> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed, forcing GT reset(%pe)\n",
> +				  ERR_PTR(ret));
>  			CT_DEAD(ct, NULL, G2H_RECV);
>  			kick_reset(ct);
>  		}

[Severity: High]
This is a pre-existing issue, but this change to how errors are filtered
seems to leave a gap where a corrupted G2H channel silently escapes a GT
reset.

If corruption is detected during xe_guc_ct_fast_path(), g2h_read() calls
ct_corrupted(), marks the channel broken, and returns -EPIPE. The fast path
loop drops the negative length without resetting.

When the background worker later executes receive_g2h(), it sees the broken
channel and g2h_read() returns -EPERM. Because g2h_err_is_fatal(-EPERM)
explicitly returns false here, receive_g2h() ignores the error:

receive_g2h() {
    ...
    if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
        // GT reset skipped
    }
}

Is there a mechanism that will trigger a recovery for the broken G2H channe=
l,
or will it stay permanently wedged since neither path kicks a reset? Before
this patch, the fast path ignored -EPROTO and the worker ignored -EPIPE, so
the new error filtering inherits this behavior.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919050055.2092=
579-9-umesh.nerlige.ramappa@intel.com?part=3D4
