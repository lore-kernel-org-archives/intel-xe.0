Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC47D6204A
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 09:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC010E33C;
	Tue, 19 Nov 2024 09:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBPuGTl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CC310E33C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732008086; x=1763544086;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=6sFQ7is/618rDJQuEwmMH+ybHhqp2fzMovHiJihQYOI=;
 b=YBPuGTl6HZFGJrxFclDXsZ/ZVSD9WwLLr8daOWrIz7CPsahDUK4GRiwL
 a7lZbfRKtMUNjarOBJSp7sMCMpkdv6b2eQn4IjlJoF5rxXGaEQrKX7+oP
 StavtvePGYUCCK2x1e53HmmS9QaDgZUhVUzmqbEEFq2jzN2ZdyLM6e+TY
 zZeq1P3CPQ40QSSOOqn4uFfNtmCK6m1pUCQT9uMJ5HdqeFFmdc0cvL1VD
 nKZEqcop3e5XZumJey+c/ip7OnD9FMdn5wOLZDCRccjn4dILAUrBJFbkr
 IirxJZgXXY1wvui1xq08tarGDBtN6+k1GOgeAJIUoMEdGEw7lGGGqv9Zl A==;
X-CSE-ConnectionGUID: QNQk/P9XTySVj5T6otkW6w==
X-CSE-MsgGUID: KinSY5iPT2ua+Z9EczekHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49532671"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="49532671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:21:25 -0800
X-CSE-ConnectionGUID: tjritsXoSWG6bBRTJX/wjg==
X-CSE-MsgGUID: 6TiZtzKlRMiN74DF6InUcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94545823"
Received: from hcaldwel-desk1.amr.corp.intel.com (HELO localhost)
 ([10.124.222.171])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:21:25 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241114234410.145863-1-matthew.s.atwood@intel.com>
References: <20241114234410.145863-1-matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add another PTL PCI ID
From: Jordan Justen <jordan.l.justen@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 01:21:23 -0800
Message-ID: <173200808386.5661.16726110968459346849@jljusten-skl>
User-Agent: alot/0.11
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

I don't know what mechanism there is for dependencies, but based on my
experience this patch should not be applied without "drm/xe/ptl:
Update PTL GuC revision".

Ref: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32149

Reviewed-by: Jordan Justen <jordan.l.justen@intel.com>

On 2024-11-14 15:44:10, Matt Atwood wrote:
> An additional pci id has been added to bspec.
>=20
> Bspec: 72574
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  include/drm/intel/pciids.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 32480b5563db..7883384acd5e 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -829,6 +829,7 @@
>         MACRO__(0xB092, ## __VA_ARGS__), \
>         MACRO__(0xB0A0, ## __VA_ARGS__), \
>         MACRO__(0xB0A1, ## __VA_ARGS__), \
> -       MACRO__(0xB0A2, ## __VA_ARGS__)
> +       MACRO__(0xB0A2, ## __VA_ARGS__), \
> +       MACRO__(0xB0B0, ## __VA_ARGS__)
> =20
>  #endif /* __PCIIDS_H__ */
> --=20
> 2.45.0
>
