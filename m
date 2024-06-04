Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9A7C25B7E
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16730889BE;
	Tue,  4 Jun 2024 11:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rvt1sV/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F91889BE
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499253; x=1749035253;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BSXL/l7HdeC217ROCNt71tmtmHxu8P+GHA+cF7I3Jck=;
 b=Rvt1sV/ubxo/DeL/POOQIz+THv3X6oGtAbQXgcINck7eMXJcgHL+mmFa
 I4fFD3TpVXQ7DgpZGO/rO6ix1SNFKqO2CuErRyUnf1N+7VbRG13ZYkZvZ
 yI16vhKX28iu2D2jNczgL7YL6W1tUmWEAv8B667KrV0Iko0SJBBHF294R
 MPOEX0RnHwbhSAiXFV4GF7bwnyfGB+hnvR9tcopqlKi+VPzCb2ydRNdQo
 jnIXu0LfWc7dJ6oLNkeftwQc8duGI6w0N3+sDQb8X0mw4FKxu6xrGhN3g
 Jc2V0XtnK4YQE4tJ/Truk+u0+qruBGTaskBb+D/iI/K9cP+Cl6hBOifjG g==;
X-CSE-ConnectionGUID: S9MfN69MRPejRfIQQyFZfA==
X-CSE-MsgGUID: G9I4MkwxS1CtuURXY8mbOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16975361"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="16975361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:07:32 -0700
X-CSE-ConnectionGUID: LunKbpApT8i02uKGboj9BA==
X-CSE-MsgGUID: NlWKad0cS3yJAXomyCalsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37797113"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.236])
 ([10.245.245.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:07:31 -0700
Message-ID: <ed6eb79e5942310650425f90e0d10f00fb704e36.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/2] drm/xe: flush engine buffers before signalling
 user fence on all engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Tue, 04 Jun 2024 13:07:28 +0200
In-Reply-To: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
References: <20240604-fix_user_fence_posted-v2-0-9276ecef973a@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Tue, 2024-06-04 at 11:38 +0200, Andrzej Hajda wrote:
> According to the discussion result on my previous patch I have
> prepared
> new patchset, which reverts previous patch and adds barrier before
> user fence signalling.
> Remarks:
> - I was not able to test it yet, hopefully CI will do it and me also
> after fixing LNL issue,
> - I am not sure about MI_FLUSH_DW flags, bspec says:
> =C2=A0 "After this command is completed with a Store DWord enabled, CPU
> access to graphics memory will be coherent"
> =C2=A0 Shouldn't we use "Store DWord" then?

It's not impossible that "store dword" needs to be enabled to act as a
write barrier. but it also says "The parser pauses on an internal flush
until all drawing engines have completed any pending operations."

If it turns out a store dword is indeed needed as a post sync
operation, we could perhaps use the "store dword" functionality of this
command to store the user-fence value and replace the posted write.

/Thomas

>=20
> [1]:
> https://lore.kernel.org/intel-xe/Zl5DcuZeZiFgxVdJ@DUT025-TGLU.fm.intel.co=
m/T/#m0b4420045908bac70426728d460108c0b2b65dca
>=20
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> - Link to v1:
> https://lore.kernel.org/r/20240603-fix_user_fence_posted-v1-1-61c76ef69ce=
a@intel.com
>=20
> ---
> Andrzej Hajda (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Revert "drm/xe: flush gtt before signallin=
g user fence on all
> engines"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: flush engine buffers before signal=
ling user fence on
> all engines
>=20
> =C2=A0drivers/gpu/drm/xe/xe_ring_ops.c | 26 ++++++++++++++++++++------
> =C2=A01 file changed, 20 insertions(+), 6 deletions(-)
> ---
> base-commit: fe3d637a9c72b22297da0c731fa5e217bd182d2d
> change-id: 20240603-fix_user_fence_posted-ca56c79c0662
>=20
> Best regards,

