Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F0AC02183
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 01:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1744A10E0DC;
	Sat, 18 Jan 2025 01:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N2ZebFwV";
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A950810E0DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 01:06:28 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-216281bc30fso63830855ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 17:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737162388; x=1737767188; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wjGNSTHyIgDwDIV9V5yMB4Brt9N/BgXzBnZBpBfjdpI=;
 b=N2ZebFwVXF38A0Z9YEbSwp9zI83LSzH3jx+PcnVZFVczun6S9u2Yg7OwqMbS3mVYLW
 oZBHWGF7ql16NNBwt73Fk9N1sVJjkho2BoR4D4augSBjATqjVzEKMB0u2rZWdacSM68w
 y8EBRlgcmT8Cenxoo4UGYP0qoUDNph/qq69ClCg2UhrHRJ9Ezqkr4eAKHCbnMXQWBDdT
 RVyLfV1dH/vLjS+f2B2fam6J2uwURqvTCo1wZD8Ast8hOEIoT/m+HAkhGHqYJh7X+eZ3
 spjHMxPu6Xd1RSS7qbxqiY8cC8OzzNpN0YzWRG+fR+w6t8Y5ewxpnK2zB+MKa6A+cEoN
 iX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737162388; x=1737767188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjGNSTHyIgDwDIV9V5yMB4Brt9N/BgXzBnZBpBfjdpI=;
 b=BtCWYVRRbjUB3wMtqO7lvhIXYjXUeS/0sX+DSfWadd4pHwqM1jFbaOVaEkkzaB+6vb
 +gYE7RRl82RItFNdy65nagigciuPZ30NF4JpcY0VbtsSvfB6yufj0htClATJYOaZzi8n
 d94kwmL8pkYpjKxVBedzuZQ9qsGyMRJSYe634vKm3yBXthAGawMcGa0If+cVoSU7M9SP
 IdqlLfcS29Ph/JgorjWlM6dORkALUFOjSGdYwl9N7kWYSbfyy2fZfqVEMzYuxrJ33gZX
 39BTMkUJuXRPxfX7ns2v5u56I676XVa1KylhlfGH2tXgnnAvLC0ZIys9jH1oRxh10/V3
 thRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk79NT/nBYoytGu7jO22z/I/lGLkPEP3YjUXc4mFYY0TaS3pp9EwluzaQ2FPkqXtbMaM1zIJlXzw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSOvOzmP2r+HltY7qviTe4qx4/Ad3hCx2jlf+kutfvVY8iRbdF
 nm0yMhyY/y9sGOQ8azzdOlyeU4LwdJOtiSJD3GvhFtttK+SyGzMM
X-Gm-Gg: ASbGncu9+vXev7n9hR2pxkX2saapCA5rWRym24SPNaCi8GN8UXh5js0ZZQq72XcNpwD
 DuWYb/9b7kSUVK32NlUwcG62KMNLOb4MeomxBcMhwHdv32zemPgVK5eb2Q4WwNjmnMwiekWcdub
 6bRXbh43Bjpdp+WD6mFZfqTNfs5Wn8S+I3GFnNpTaL5Kt47nOgH4KX9yQbq5gXjDYM0jQ0jwTp4
 giuvxbXlHduM+X6WXmmIEv3lZjH1oLcaFPIsidXMb44pk/qiRhBBFTbdtpUUaLLxMXPSw==
X-Google-Smtp-Source: AGHT+IHTxwnV373tAyRUFTZnkqQzw5MXhjcY7VkjR/fLP8g5K0UdG2Ujx+dS3h2I4MZANMxr8CdfUQ==
X-Received: by 2002:a05:6a20:8423:b0:1e6:44b4:78ab with SMTP id
 adf61e73a8af0-1eb214611dbmr8855815637.8.1737162387971; 
 Fri, 17 Jan 2025 17:06:27 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab7f07b9sm2620995b3a.3.2025.01.17.17.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 17:06:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 113F14209E79; Sat, 18 Jan 2025 08:06:23 +0700 (WIB)
Date: Sat, 18 Jan 2025 08:06:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Fix documentation indentation
Message-ID: <Z4r-j0i5ErdcBou2@archie.me>
References: <20250117193827.91779-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zv98bE0DGghTRw/l"
Content-Disposition: inline
In-Reply-To: <20250117193827.91779-1-rodrigo.vivi@intel.com>
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


--zv98bE0DGghTRw/l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 02:38:27PM -0500, Rodrigo Vivi wrote:
> Fix these issues:
>=20
> Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:817: WARNING:
> +Bullet list ends without a blank line; unexpected unindent.
> Documentation/gpu/driver-uapi:29: include/uapi/drm/xe_drm.h:835: WARNING:
> +Definition list ends without a blank line; unexpected unindent.
>=20
> Fixes: 75d37750a753 ("drm/xe/mmap: Add mmap support for PCI memory
> barrier")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/intel-xe/20250117164023.3fdc00b9@canb.auu=
g.org.au/
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index cac607a30f6d..e2160330ad01 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -814,29 +814,29 @@ struct drm_xe_gem_create {
>   *
>   * The @flags can be:
>   *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special o=
ffset
> - *  for use in mmap ioctl. Writing to the returned mmap address will gen=
erate a
> - *  PCI memory barrier with low overhead (avoiding IOCTL call as well as=
 writing
> - *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> - *  instruction.
> + *    for use in mmap ioctl. Writing to the returned mmap address will g=
enerate a
> + *    PCI memory barrier with low overhead (avoiding IOCTL call as well =
as writing
> + *    to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *    instruction.
>   *
> - *  Note: The mmap size can be at most 4K, due to HW limitations. As a r=
esult
> - *  this interface is only supported on CPU architectures that support 4=
K page
> - *  size. The mmap_offset ioctl will detect this and gracefully return an
> - *  error, where userspace is expected to have a different fallback meth=
od for
> - *  triggering a barrier.
> + * Note: The mmap size can be at most 4K, due to HW limitations. As a re=
sult
> + * this interface is only supported on CPU architectures that support 4K=
 page
> + * size. The mmap_offset ioctl will detect this and gracefully return an
> + * error, where userspace is expected to have a different fallback metho=
d for
> + * triggering a barrier.
>   *
> - *  Roughly the usage would be as follows:
> + * Roughly the usage would be as follows:
>   *
> - *  .. code-block:: C
> + * .. code-block:: C
>   *
> - *  struct drm_xe_gem_mmap_offset mmo =3D {
> - *	.handle =3D 0, // must be set to 0
> - *	.flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> - *  };
> + *     struct drm_xe_gem_mmap_offset mmo =3D {
> + *         .handle =3D 0, // must be set to 0
> + *         .flags =3D DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *     };
>   *
> - *  err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> - *  map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> - *  map[i] =3D 0xdeadbeaf; // issue barrier
> + *     err =3D ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *     map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *     map[i] =3D 0xdeadbeaf; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */

The indentation fix looks good (warnings squashed away on Sphinx 8.1.3).

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--zv98bE0DGghTRw/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ4r+iAAKCRD2uYlJVVFO
o5ycAQCv4yJ8asS0N5ou/1qD8sTi898EeMpJAAqyWtBVM4mNsAD8CEx5qasuAJ+D
IYnmWuOAjUKs1NHBc9Vl6obqXrq20Aw=
=vpfY
-----END PGP SIGNATURE-----

--zv98bE0DGghTRw/l--
