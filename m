Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DAFCC6B15
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD2210F9A5;
	Tue, 13 Oct 2026 20:53:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B99410F9A5;
 Tue, 13 Oct 2026 20:53:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BF2941674;
 Tue, 13 Oct 2026 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC361F000FF;
 Tue, 13 Oct 2026 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791924821;
 bh=lYKKZhrLl7ejoMPuvhw5Vsh1SlRMEyXx/qyLGApcydU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=X+RF2xGZM9m47OAS9c+tRUFOBiImn+xMWgrjiSpVdMLUtB/EiO422e6wEdARMO8DD
 1f08Bbpt+5mYZvA/OEN46qkSlxLSF0y5wTEYSPAuwDkgYTPUUFk/5Zp4e4pDf59uz0
 T6apOUBukTqw7EXjD/10uJ6d2HtLZLqezkkrBGtt6EgLNmXZGH2ugipwgKW6F5P3ng
 d4sMOhOwoWp9r0KcBN+XsuzdFkmgJ5HZnnWcT20ee/vNOqgxcq6BdLbkziDqM+oQpX
 2vGFTkfnXXTErUXa7n9Q9OE4c8aOvWJxoOZEW7b2DDS3Ygf/+8YTRhQij8DjC9M3y3
 JpG6pC3mnHWMw==
Message-ID: <sashiko-outbox-170493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] drm/i915/display: log eDP TC support and DBuf
 overlap detection state
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013204705.1574475-6-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
 <20261013204705.1574475-6-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 20:53:40 +0000
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
- [Low] drm/i915: commit message claims alphabetical order but implementati=
on does not
--

commit a46ad637c40a9e4f034c8da54ce1e88270a8428d
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

drm/i915/display: log eDP TC support and DBuf overlap detection state

This commit adds logging for eDP Type-C support and DBuf overlap detection
state in the display runtime info. It also attempts to reorder the fields
in the structure to maintain alphabetical order.

>     edp_tc_support and dbuf_overlap_detection are only fields of display's
>     runtime info which state is not logged. Show it along other fields.

[Severity: Low]
This isn't a bug, but there's a typo in the commit message. The commit mess=
age
refers to edp_tc_support, but the actual field in the code is named
edp_typec_support.

>     While at it, move dbuf_overlap_detection to have display runtime info=
's
>     fields in alphabetical order.

[Severity: Low]
The commit message states the fields are moved to be in alphabetical order,
but the resulting order in both the struct definition and the print stateme=
nts
is not alphabetical.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -2005,6 +2005,9 @@ void intel_display_device_info_print(const struct i=
ntel_display_device_info *inf
>  	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
>  #undef PRINT_FLAG
> =20
> +	drm_printf(p, "edp_typec_support: %s\n", str_yes_no(runtime->edp_typec_=
support));
> +	drm_printf(p, "has_dbuf_overlap_detection: %s\n", str_yes_no(runtime->h=
as_dbuf_overlap_detection));
> +
>  	drm_printf(p, "has_3dlut: %s\n", str_yes_no(runtime->has_3dlut));

[Severity: Low]
Should these print statements be sorted alphabetically to match the claim in
the commit message? Currently, edp_typec_support and=20
has_dbuf_overlap_detection are placed before has_3dlut and has_hdcp, which=
=20
breaks alphabetical ordering in intel_display_device_info_print().

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -307,10 +307,10 @@ struct intel_display_runtime_info {
> =20
>  	bool has_3dlut;
>  	bool has_hdcp;
> +	bool has_dbuf_overlap_detection;
>  	bool has_dmc;
>  	bool has_dsc;
>  	bool edp_typec_support;
> -	bool has_dbuf_overlap_detection;
>  };

[Severity: Low]
Does this achieve the alphabetical ordering mentioned in the commit message?
The sequence in intel_display_runtime_info is now:

has_3dlut
has_hdcp
has_dbuf_overlap_detection
has_dmc
has_dsc
edp_typec_support

The has_dbuf_overlap_detection field is placed after has_hdcp, and
edp_typec_support is placed at the end.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013204705.1574=
475-1-michal.grzelak@linux.intel.com?part=3D5
