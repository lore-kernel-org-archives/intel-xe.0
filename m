Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154B0606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 14:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkt2toPr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9410F680;
	Tue, 24 Nov 2026 14:24:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E46D10F680;
 Tue, 24 Nov 2026 14:24:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E910143506;
 Tue, 24 Nov 2026 14:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F7C1F000C6;
 Tue, 24 Nov 2026 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795530255;
 bh=CuxXCI1/phr9PD8v/h6U014cX2T4pT07RvMNTBY/KMw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=bkt2toPrpBY7WkG425WtBETm52EcKVGqSGBeNTgNmcbvKVaquL5PtkeSeDTfhQ0rd
 V9mdR1VAaA89VGwQF+C/ODj7q0+W3oLaiLL/TY4j8OD5y2bo4flBHcNncvEvMVtckx
 FlECsIp+Ct+YMpoUmQYZOIrt5at+PZq2IGtQYGlV788eg3O2kLxiPG4ZmfA+VDhMhB
 ovm0ERAxDxMZq6msuJVnTyc/Ee9Q3tNZn9FMQ9Agz4ClR3sGu4Dnljce7USuo4KVt7
 z0RBLysVMMjYETmX3CoIBslmIDefKFcwj5y2pNuCuIksCsK0hdfIFJv2JM9CkWiMIf
 x0o0u/qjg0oXQ==
Message-ID: <sashiko-outbox-231335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
To: "Jani Nikula" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124141146.1560208-1-jani.nikula@intel.com>
References: <20261124141146.1560208-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 14:24:15 +0000
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
- [Low] drm/i915/display: intel_force_bit_banging_write() missed in
  %sabling cleanup
--

commit a6f91eb39a4003adc548629cfa79fbc4fb32b5bb
Author: Jani Nikula <jani.nikula@intel.com>

drm/i915/display: don't be cute about printing enabling/disabling

This commit replaces "%sabling", enable ? "en" : "dis" debug logging
patterns in i915 display code with str_enable_disable().

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> index d43c81d362e6c..d68521588d54b 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -1107,9 +1107,8 @@ void intel_gmbus_force_bit(struct i2c_adapter *adap=
ter, bool force_bit)
>  	mutex_lock(&display->gmbus.mutex);
> =20
>  	bus->force_bit +=3D force_bit ? 1 : -1;
> -	drm_dbg_kms(display->drm,
> -		    "%sabling bit-banging on %s. force bit now %d\n",
> -		    force_bit ? "en" : "dis", adapter->name,
> +	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now %d\n",
> +		    str_enable_disable(force_bit), adapter->name,
>  		    bus->force_bit);
> =20
>  	mutex_unlock(&display->gmbus.mutex);

[Severity: Low]
Should intel_force_bit_banging_write() in this same file also be converted
to str_enable_disable()?  It logs the identical bit-banging message using
the old "%sabling" pattern:

drivers/gpu/drm/i915/display/intel_gmbus.c:intel_force_bit_banging_write() {
    ...
		drm_dbg_kms(display->drm,
			    "%sabling bit-banging on %s. force bit now %d\n",
			    force_bit_banging ? "en" : "dis",
			    connector->base.ddc->name, force_bit);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124141146.1560=
208-1-jani.nikula@intel.com?part=3D1
