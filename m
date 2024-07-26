Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A003CC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 23:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F09610E07B;
	Fri, 26 Jul 2024 23:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtnrEUE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2779F10E07B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722034825; x=1753570825;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:cc:date:message-id;
 bh=sRyVauga/Kv/DwcEelke3DOzcNA4Eqqq7L5zb9M1pI4=;
 b=AtnrEUE42z4J9EwA3faX+bYAYIOV6ftYzn9Vlw3LQRRt1nivgf2sS54Q
 cTSRICFIMpeNPtHxJ6CW5GB9tRgdTS5yPlDAuL8g6blhDHpuMXqqq791H
 rUNyRgq35jhBvgNl+uJ/QynsnBQYmSnLbXAGKTdiUZ7beEwIQ0WuU12yl
 CiicLHLfpZ0u9b/NMk60w6xE+6LV24iLGxwTcRwHlYIiW2H+iKS/85OhE
 fsr0m/1VJtYG3eokkz8XJwEC+fPivh+qr6iY+Tgloht2bevWArLMxEXnV
 jpnioI3hxLE+91/Jjy1F1gV1d1ZnKxip/Lf7kDfSTLkNJlB69A1icie3s A==;
X-CSE-ConnectionGUID: ZbE0qvquRqmm81Ow0R8SVQ==
X-CSE-MsgGUID: ow0xLGe/Rs23cHJ78aRYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="20034181"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="20034181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 16:00:24 -0700
X-CSE-ConnectionGUID: cnPM4109Sbqn/vMmxBSt9g==
X-CSE-MsgGUID: gt7LKo0IR82wPmDGNnQ+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57568484"
Received: from cmdeoliv-mobl.amr.corp.intel.com (HELO localhost)
 ([10.125.111.248])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 16:00:24 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <zin6leryq7xgs5vmlfmubo43g5iirhuohvxemxc4liukjufp4w@mjquccbaogwr>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
 <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
 <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
 <ddb6a30acade05a9e1a95c934d4201d68a89a990.camel@intel.com>
 <zin6leryq7xgs5vmlfmubo43g5iirhuohvxemxc4liukjufp4w@mjquccbaogwr>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
From: Jordan Justen <jordan.l.justen@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?utf-8?q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 16:00:22 -0700
Message-ID: <172203482291.323134.1548881068994911540@jljusten-skl>
User-Agent: alot/0.10
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

On 2024-07-18 15:32:47,  wrote:
> On Tue, Jul 16, 2024 at 06:39:26PM GMT, Jose Souza wrote:
> >> humn... if we decide to set both for backward compatibility, why not
> >> rather go with v1 of the patch?  v1 of the patch documents that the EU
> >> reported in EU_PER_DSS is of type X. Having both masks here doesn't
> >> answer that question and requires that we always convert back to the
> >> simd8 number (and eventually to the simd16 number) for newer platforms.
> >>
> >> so suppose 5 years from now we have simd123 (using arbitrary/absurd na=
me
> >> on purpose to avoid people jumping to conclusions):  would we keep
> >> exposing the simd8, simd16, simdX, fooY numbers for the sake of
> >> backward compatibility with previous HW?  On the other hand, the
> >> alternative means: if userspace X really supports platform Y, it has to
> >> know about that type of EU if it's using that mask for anything.
> >>
> >> So my preference would be, in order:
> >>
> >> 1) v2
> >> 2) v1
> >> 3) v2-with-forever-bc-between-platforms
> >>
> >> Both (2) and (3) have the silent misbehavior in userspace if userspace
> >> didn't adapt to new UAPI.
> >
> >option 1) v2 is better in my opinion.
>=20
>=20
> great. I fixed a typo in the kernel-doc, added a few more
> Acked-by's received offline and pushed to drm-xe-next.
>=20
> [1/1] drm/xe/uapi: Expose SIMD16 EU mask in topology query
>        commit: 7108b4a589cd6d3a2c1276fd610b3500f46de66a

Mesa 24.2.0 will support LNL using only DRM_XE_TOPO_EU_PER_DSS, since
this new uapi is not in the upstream drm tree.

After this change, Mesa 24.2.0 will be broken on LNL. Isn't this the
sort of breakage that the kmd is supposed to avoid for platforms in
the upstream drm tree?

Unless this uapi can be added to the upstream drm tree before Mesa
24.2.0 (August 7th), I think LNL should advertise either
DRM_XE_TOPO_EU_PER_DSS only, or both.

-Jordan
