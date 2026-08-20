Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C87C5DF86
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893B710E030;
	Thu, 20 Aug 2026 20:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TDFd8xyM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F2010E030
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:19:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FEE060A58;
 Thu, 20 Aug 2026 20:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A36F1F000E9;
 Thu, 20 Aug 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787257196;
 bh=kabKhR0O3IttHOctpI9j+kNk5Nud0i4vnCUF6tmAxpE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TDFd8xyMFffoATo3MldghRZmR9tWyAFVzaRe12ep6dhuen0WAZ1wPLIl9qbowtrN3
 DX6VrSxIpZOug4rOU0XvUFxf05qEgwrZ8haNvP1If8+b9ccGIAKqrECBlwL5TX9P3Z
 Llb1Q4PRYCju3zKGdLl5NTW3XqkiVS6mP/amP6EwBX4iFzq8SUfhsOrODCnLdSmDwY
 968eFXWQwvEhJ2+KagIpxTPX5LiIWoraODYyn5W5s+k0Vq2NUUo2DcPRlSPAUsqWCq
 YFh8casJ6MeuFoVJ4uZFfqRZMlDzllfXxlrkP+/uClJ92mH0jDuSaoVe8QoXenoOQn
 2v+FJVlHCFjQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] drm/xe: Add infrastructure for debug configfs
 parameters
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260820200719.84681-20-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
 <20260820200719.84681-20-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 20:19:55 +0000
Message-Id: <20260820201956.0A36F1F000E9@smtp.kernel.org>
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
- [Low] Global namespace pollution from generic attribute names
--

--- Patch [8]: [PATCH 08/10] drm/xe: Add infrastructure for debug configfs =
parameters ---
commit c6663e692904c84b3875225b65be4210162f1f5e
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe: Add infrastructure for debug configfs parameters

This commit introduces an X-macro pattern for defining debug configfs param=
eters
in the Xe driver. It automatically generates backing structs, configuration
attributes, and accessors from a single parameter list to simplify adding n=
ew
debug entries.

> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.c b/drivers/gpu/=
drm/xe/xe_configfs_debug_params.c
> new file mode 100644
> index 0000000000000..00e5ff175c0af
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.c

[ ... ]

> +/*
> + * Define the configfs_attribute objects. These are non-static so they
> + * can be referenced from xe_configfs_debug.c.
> + */
> +#define _XE_PARAM_DEFINE_ATTR(_T, _name, _def, _val, _vis, _get, _fallba=
ck) \
> +struct configfs_attribute attr_##_name =3D {                            =
  \

[Severity: Low]
Could this naming convention cause global symbol collisions?=20

Since these objects are non-static (defined in the global namespace), namin=
g=20
them attr_##_name could lead to link-time multiple definition errors if ano=
ther=20
subsystem happens to export a variable with a generic name like attr_timeou=
t or=20
attr_enable.

Would it be safer to use a subsystem-specific prefix, such as=20
xe_configfs_attr_##_name, to prevent namespace pollution?

> +	.ca_name	=3D __stringify(_name),                           \
> +	.ca_owner	=3D THIS_MODULE,                                  \
> +	.ca_mode	=3D 0644,                                         \
> +	.show		=3D _name##_show,                                 \
> +	.store		=3D _name##_store,                                \
> +};
> +
> +XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DEFINE_ATTR)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug_params.h b/drivers/gpu/=
drm/xe/xe_configfs_debug_params.h
> new file mode 100644
> index 0000000000000..954ca4343136d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_configfs_debug_params.h

[ ... ]

> +/*
> + * Forward declarations of the per-parameter configfs_attribute objects.
> + *
> + * The objects themselves are defined in xe_configfs_debug_params.c (as
> + * non-static so they can be referenced from xe_configfs_debug.c's
> + * xe_configfs_debug_attrs[] array and is_visible() callback). They live
> + * in the same translation unit as the X-macro-generated show/store
> + * handlers; consumers should reference them via attr_<name>.
> + */
> +#define _XE_PARAM_DECLARE_ATTR(_T, _name, _def, _val, _vis, _get, _fallb=
ack) \
> +	extern struct configfs_attribute attr_##_name;

[Severity: Low]
Similar to the definition above, this macro exposes attr_##_name in the glo=
bal=20
namespace. Adding a prefix like xe_configfs_attr_##_name here would align w=
ith=20
the definition change and ensure namespace safety.

> +XE_CONFIGFS_DEBUG_PARAMS_FOR_EACH(_XE_PARAM_DECLARE_ATTR)
> +#undef _XE_PARAM_DECLARE_ATTR

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820200719.8468=
1-12-stuart.summers@intel.com?part=3D8
