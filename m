Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE0606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bOyU6jmg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ABF112883;
	Fri, 30 Oct 2026 14:55:54 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F287F112883
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 14:55:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DB56D413A8;
 Fri, 30 Oct 2026 14:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C36F1F000C1;
 Fri, 30 Oct 2026 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793372147;
 bh=nGHLOVLmmv1tFV7XQgB6LWIAZzM9kDiTV9Ga9dO2Fsc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=bOyU6jmgEXtlBnr8yD3q1rG+QycmDdgg+z+/YhdmbtmQPbPQVCYLOem/r+6aZfAhc
 3fpEdSxth15SUcY7IfqkKBysZGEmPjzxLMf0YiG/CF/QyuEnxL82mhXd5ke7qBGAp7
 UT+jClkTcfpUc61UVmArvKQaBRFE2Gm4boe436aXCtJFd33KR0lX9fTiikHKo1H+Bm
 2vGSHcIeCumT1Qakt7cXMTVNwkh/U4vqpF5w18V0x6iH0yW8NdACQ6sZo0EWusMtBC
 M6bS0vIIMePF1PfsBQzQzIyXMAnfTF1G1GZORRt+nekhcsTxvz/KcRAYoBRGzBnUT3
 0zfJVIuV4ttdg==
Message-ID: <sashiko-outbox-191132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/6] drm/xe/xe_late_bind_fw: Add string mappings of
 status codes
To: "Badal Nilawar" <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261030144547.2532309-10-badal.nilawar@intel.com>
References: <20261030144547.2532309-8-badal.nilawar@intel.com>
 <20261030144547.2532309-10-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:55:47 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: missing BUFFER_TOO_SMALL mapping in xe_late_bind_parse_s=
tatus()
--

commit d7b67485aab2684a93a389da87365dcc4bead83b
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_late_bind_fw: Add string mappings of status codes

This commit adds string mappings in xe_late_bind_parse_status() for the new
late binding status codes introduced in the mei_lb driver.

> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe=
_late_bind_fw.c
> index 1bddfaf0fb9f0..b7957e255ccde 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -179,6 +179,32 @@ static const char *xe_late_bind_parse_status(uint32_=
t status)
>  		return "Invalid Payload";
>  	case INTEL_LB_STATUS_TIMEOUT:
>  		return "Timeout";
> +	case INTEL_LB_STATUS_INTERNAL_ERROR:
> +		return "Internal Error";

[Severity: Medium]
Should INTEL_LB_STATUS_BUFFER_TOO_SMALL also be handled here in
xe_late_bind_parse_status()?

Commit 773a43b8627f ("mei: lb: add late binding version 2") added status
codes 8 through 21 to enum intel_lb_status in
include/drm/intel/intel_lb_mei_interface.h:

	INTEL_LB_STATUS_TIMEOUT                              =3D 7,
	INTEL_LB_STATUS_BUFFER_TOO_SMALL                     =3D 8,
	INTEL_LB_STATUS_INTERNAL_ERROR                       =3D 9,

Without a case for INTEL_LB_STATUS_BUFFER_TOO_SMALL, if
late_bind->component.ops->push_payload() returns status 8 to
xe_late_bind_work(), xe_late_bind_parse_status() will fall through to the
default case and report "Unknown error".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030144547.2532=
309-8-badal.nilawar@intel.com?part=3D2
