Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC93CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 07:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7210E26E;
	Mon, 20 Oct 2025 07:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KP/3bo2g";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CE810E26E;
 Mon, 20 Oct 2025 07:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF5AF408DB;
 Mon, 20 Oct 2025 07:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F52CC4CEFB;
 Mon, 20 Oct 2025 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760945392;
 bh=3hJ5BI7iRuLKd/HdNYkWO7tGlXPKbYKN671lRM6sd0Q=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KP/3bo2gHxsm0CBkxYLqYCnrHrNNwmhUtjeCJ0H8zy3SI9RaX4lZfsCHcF0NaE48z
 OUqot8mcIfxlythVOmTznyUyrD2dKnK1RbGeCi4uFImD3gAZupLbzga8QlHEVJtn2h
 wVmBCv/puH8cdo2RUYsrYMxNmsXZkyLy/z/AvuSQNmJlHRdOsJlOVHs9m89xqT143N
 uz2juPyoYAFetOwFkDuju1HAZPANtpaNSjuO5GB1R/sxHn5zE0emdPLMCZ7U1563ax
 LFKtYvvQp13H9DgDn9JgJlsE/R3p+H1RQuQTzCVpFFQ+vOCCgT8jp45mcFLKpObO3u
 ob1NY7Nohn8gQ==
Message-ID: <6bccb6ce0672f5b736bb8669060d8005@kernel.org>
Date: Mon, 20 Oct 2025 07:29:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/atomic: WARN about invalid drm_foo_get_state()
 usage
In-Reply-To: <20251017163327.9074-2-ville.syrjala@linux.intel.com>
References: <20251017163327.9074-2-ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, "Dan
 Carpenter" <dan.carpenter@linaro.org>, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
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

On Fri, 17 Oct 2025 19:33:27 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> drm_{crtc,plane,connector,private_obj}_get_state() must not
> be called after the atomic check phase. At that point the commit
> has been carved in stone and no new objects must be introduced
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
