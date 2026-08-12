Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BD3C5DF65
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D0010F143;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UZ0yDiuu";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21010F0D9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:29:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8AB1460A7D;
 Wed, 12 Aug 2026 19:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F791F000E9;
 Wed, 12 Aug 2026 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786562996;
 bh=fqOWXkdkpR8bH9so9Xl8TfCPkU11y7ijjjs79zR/dEU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UZ0yDiuuW7AQe6C1HUK4KDy0LXhXqblLY7zJgwFAxY8GA4UG7OQtuhdpVakyuSm5e
 lcryRHUnpUzxfYlEd4Mm3ZgLo39aweOlyw97i7gDl0ebUQdytdE0nA5SmfPn2+Xwj9
 HfuKeIoPgunt5/zeCNv0Z6yTgT/65kiSYxrtfp7mSLha9HasveSRxGVv4DKvme90Hj
 sEgyX3w5VQyN9nsoQivmbeScOtw0PfL87RqOUmKpfT0olidgQyd9ZI0PcfAbJxmMzw
 fyVXWmYo2bR+mMPGnKMtqrVQKqTLWx2KDOZWHlDTGYKs70yBt2KP9TcyBk96UGf0RA
 GjuQUpFcfRGVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/32] drm/xe: Introduce xe_any helpers
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812191450.11690-2-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:29:55 +0000
Message-Id: <20260812192956.20F791F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [Low] Macros xe_any_to_drm, xe_any_to_dev, and xe_any_to_pdev fail to com=
pile when passed const pointers due to a C11 constraint violation in the un=
derlying xe_any_to_xe macro.
- [Low] The macros xe_any_if_type and xe_any_id silently discard side effec=
ts for unmatched types.
--

--- Patch [1]: [PATCH v4 01/32] drm/xe: Introduce xe_any helpers ---
commit 933eba9892b749844655f0d89de25fa2cfc22f5b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: drm/xe: Introduce xe_any helpers

This commit introduces a set of macros using _Generic to convert between
xe_device, xe_tile, xe_gt, drm_device, pci_dev, and device pointers. It
provides type-checking helpers and object identifier retrievals across the
xe driver.

> diff --git a/drivers/gpu/drm/xe/xe_any.h b/drivers/gpu/drm/xe/xe_any.h
> new file mode 100644
> index 0000000000000..5d97afa76915a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_any.h
[ ... ]
> +/**
> + * xe_any_if_type() - Get the pointer only if it is @type pointer.
> + * @any: any pointer
> + * @type: data type to look for
> + *
> + * Return: the @type pointer or NULL.
> + */
> +#define xe_any_if_type(any, type)						\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(type, (any)),				\
> +		 default : NULL)

[Severity: Low]
Could this macro discard side effects for unmatched types?

If a caller passes an expression with side effects, like a function call or
pointer increment, to xe_any_if_type() or any macro that uses it, the side
effects will be evaluated if the type matches.

However, if the type falls to the default branch, the side effects will be
completely discarded because (any) is not evaluated in the default : NULL
association.

[ ... ]
> +/**
> + * xe_any_to_xe() - Obtain the &xe_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @xe_device pointer or backpointer.
> + */
> +#define xe_any_to_xe(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_tile, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(const, xe_gt, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, drm_device, xe_device, (any)),	\
> +		 __xe_any_to_other_assoc(, pci_dev, xe_device, (any)),		\
> +		 __xe_any_to_other_assoc(, device, xe_device, (any)))
> +
> +/**
> + * xe_any_to_drm() - Obtain the &drm_device pointer.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the @drm_device pointer or backpointer.
> + */
> +#define xe_any_to_drm(any)							\
> +	_Generic((any),								\
> +		 __xe_any_to_self_assoc(struct drm_device, (any)),		\
> +		 default : &xe_any_to_xe(any)->drm)

[Severity: Low]
Will this cause a C11 constraint violation during compilation if the parame=
ter
is a const struct drm_device pointer?

When xe_any_to_drm is called with a const struct drm_device pointer, it fal=
ls
to the default branch which contains xe_any_to_xe(any).

The xe_any_to_xe macro lacks const associations for drm_device, pci_dev, and
device, and it does not have a default branch. This will cause compilation =
to
fail even though it is inside an unselected branch of the outer _Generic bl=
ock.

[ ... ]
> +/**
> + * xe_any_id() - Get the identifier of the underlying object.
> + * @any: the &pci_dev or the &xe_device or &xe_tile or &xe_gt pointer
> + *
> + * Return: the identifier of the object, or 0 if not applicable/availabl=
e.
> + */
> +#define xe_any_id(any)								\
> +	_Generic((any),								\
> +		 __xe_any_to_other_assoc(/* */, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_tile, id, (any)),		\
> +		 __xe_any_to_other_assoc(/* */, xe_gt, id, (any)),		\
> +		 __xe_any_to_other_assoc(const, xe_gt, id, (any)),		\
> +		 default : 0)

[Severity: Low]
Does this macro also discard side effects for unmatched types, similar to
xe_any_if_type?

If (any) is an expression with side effects, they are evaluated if the type
matches, but are lost in the default : 0 branch because (any) is omitted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191450.1169=
0-1-michal.wajdeczko@intel.com?part=3D1
