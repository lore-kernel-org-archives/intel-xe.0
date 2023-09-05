Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D75C83F33
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 12:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981EE10E4D1;
	Tue,  5 Sep 2023 12:05:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A62D10E4D1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693915539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0dkZ1KJZsepLQqUtQEDB/h8zOJwM8DEby+OzwiVGCZk=;
 b=Cuf4onTN+XY82VJmdCVW7M+W5MlC726QaIlHv9KBWzRkiRIbanrAbnyWUNP97TZDSYGy5n
 psFcIW94g3Y2kjVKExAOyEUfjmgvTjpEuvfYq6ARSLXQqtASf0hFZ64e3qpQO8cEjrlMt5
 SttlbUila5OxF3g7wo80tk3Wqs7fboI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-iZcTEqEfNqOnI7PkBfzQUQ-1; Tue, 05 Sep 2023 08:05:38 -0400
X-MC-Unique: iZcTEqEfNqOnI7PkBfzQUQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-64bca259c4bso26135866d6.1
 for <intel-xe@lists.freedesktop.org>; Tue, 05 Sep 2023 05:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693915537; x=1694520337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dkZ1KJZsepLQqUtQEDB/h8zOJwM8DEby+OzwiVGCZk=;
 b=LjGmxacA627C8claM8A3d53Q3dX5yANovb0eZ4clqNM2qXRnmCOxpmuMzsAlaC9bli
 QBlFH/uPgPCH+sCQnXqMN22FbtgqM4VKqj18sow7mCvSHB55v1X3e5rkjVrl0eoYUxEK
 TNgpRTJGtr5BQROrKE0cKdjNiYCvKiJls67sXHGQZunJDHUk3L2qjvQaSmawGkFtow8E
 zG9Dk4TnyBIjnbuL81tIXfFRroQeFKTXS7r58eXwt/n6bdftzh4ytIaaRbpMv6C4fTwK
 aTlHNsFN1+Aj+iG37C6qRROzG3jRn1jE7Aqhef1h50tN6xEcxX5foCAAy1NwN1n1vauM
 bcag==
X-Gm-Message-State: AOJu0YwMtmh6fmfkjFhZ9atY2Si018jsyx81Mz6bpANoJcAkXwdhyp9r
 ojuFAPJOVbFToz3+ZnMoXkqfhVWB4ApMJ9/1PH7ZWxv1VBJnno/Z2jco/Md0M1AHCNmA5ugvCI3
 SWx168K8WujfMfpUC6mjKQv4C8eg=
X-Received: by 2002:a0c:e043:0:b0:64f:5261:55e0 with SMTP id
 y3-20020a0ce043000000b0064f526155e0mr12886165qvk.47.1693915537715; 
 Tue, 05 Sep 2023 05:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaRw1lL/3YxzGgDeWiMq/eRSqI/4SgOwVXbGqoDEjPbHbhO5iri59oTqXrgTS7zP2KmVYyEg==
X-Received: by 2002:a0c:e043:0:b0:64f:5261:55e0 with SMTP id
 y3-20020a0ce043000000b0064f526155e0mr12886144qvk.47.1693915537356; 
 Tue, 05 Sep 2023 05:05:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a0cda0f000000b005dd8b9345b4sm4368500qvj.76.2023.09.05.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 05:05:36 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:05:35 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <vz5bvqnxk5n73dxhbsps77i7aqa3nk5vnytnkszlx3ty7klaz3@gllrfksqstwu>
References: <20230905085832.2103-1-thomas.hellstrom@linux.intel.com>
 <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n7wfbhuyrvxllxfy"
Content-Disposition: inline
In-Reply-To: <20230905085832.2103-3-thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/tests/drm_exec: Add a test for
 object freeing within drm_exec_fini()
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


--n7wfbhuyrvxllxfy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 05, 2023 at 10:58:31AM +0200, Thomas Hellstr=F6m wrote:
> Check that object freeing from within drm_exec_fini() works as expected
> and doesn't generate any warnings.
>=20
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 47 +++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index 563949d777dd..294c25f49cc7 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -170,6 +170,52 @@ static void test_prepare_array(struct kunit *test)
>  	drm_gem_private_object_fini(&gobj2);
>  }
> =20
> +static const struct drm_gem_object_funcs put_funcs =3D {
> +	.free =3D (void *)kfree,
> +};
> +
> +/*
> + * Check that freeing objects from within drm_exec_fini()
> + * behaves as expected.
> + */
> +static void test_early_put(struct kunit *test)
> +{
> +	struct drm_exec_priv *priv =3D test->priv;
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[2];
> +	struct drm_exec exec;
> +	int ret;
> +
> +	gobj1 =3D kzalloc(sizeof(*gobj1), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj1);
> +	if (!gobj1)
> +		return;
> +
> +	gobj2 =3D kzalloc(sizeof(*gobj2), GFP_KERNEL);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, gobj2);
> +	if (!gobj2) {
> +		kfree(gobj1);
> +		return;
> +	}
> +
> +	gobj1->funcs =3D &put_funcs;
> +	gobj2->funcs =3D &put_funcs;
> +	array[0] =3D gobj1;
> +	array[1] =3D gobj2;
> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
> +
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec)
> +		ret =3D drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
> +					     1);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +	drm_gem_object_put(gobj1);
> +	drm_gem_object_put(gobj2);
> +	drm_exec_fini(&exec);

It doesn't look like you actually check that "freeing objects from
within drm_exec_fini() behaves as expected." What is the expectation
here, and how is it checked?

Maxime

--n7wfbhuyrvxllxfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPcZjwAKCRDj7w1vZxhR
xaONAQDDD1LtuG0RN+97ROcrQpv6w4AEjkYLmVmzQZ/tM1KSGAEAwB3k3Er1eN9M
/Shg30CE3pS4o9Yhydjqot1zPCQ+ZAs=
=bvap
-----END PGP SIGNATURE-----

--n7wfbhuyrvxllxfy--

