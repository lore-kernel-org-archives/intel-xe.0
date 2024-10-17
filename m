Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55A6D1AD36
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 08:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DA410E308;
	Thu, 17 Oct 2024 08:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkRjgawf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B21210E308
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729153580; x=1760689580;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:cc:date:message-id;
 bh=aTXyTZS8XI8jijPqxvxmDBc1z9DgLQL9zfoVbMMBbLg=;
 b=RkRjgawfrU/9YfZ/gwUAdvMQlUSEPgyTSpVB9fqpbLuAdCsUCjwGZqAb
 dHyTwJanYJi7B8SU2S+fpqasKpSR680SApARnWjmZVK+QDtyPxovL07+x
 Uqq732TU2s8Pxj74OuhxEwYubfWRZjqbPRzYIecMge88xp7zy3mUDWMDc
 CQ/6NaF11DeythnYw7ibIEEIvSiFGVtSxCaiqSR+/ef8LE6daZB38okGy
 rPCrjq1/o+Sz2jyf98hAk/yDxIn+Eg07pFYg9g6v2LJzMSdyjmatK51R/
 GwfkVKQvGB36LI/RP6bgKTZuVkwZR7dCxyUa0tUb1VCYiaZ67NVVwxepy Q==;
X-CSE-ConnectionGUID: KZWvQdhZSq2wBWlLcyepiA==
X-CSE-MsgGUID: mnonQFLESI2HopibQC1THA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="54042824"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="54042824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:26:19 -0700
X-CSE-ConnectionGUID: E8fvQjxdREOFkNFXh3NBXw==
X-CSE-MsgGUID: VAHkyLGLSQmNjXHAr9QpXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78500464"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.51])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 01:26:17 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d4932a6e-0b52-4ef4-8c1a-32995e6a3815@intel.com>
References: <20241009101004.664216-1-tejas.upadhyay@intel.com>
 <c55c17c9-9882-4124-918b-88b951469185@intel.com>
 <SJ1PR11MB6204E78CF08AFA14DA26E2A181442@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <e8f4f5fd-d7a1-4ca9-8a62-543d10c32a15@intel.com>
 <DS7PR11MB6197DD082F407482D23E655281442@DS7PR11MB6197.namprd11.prod.outlook.com>
 <936a6826-cf97-4d77-8175-16b37f422f47@intel.com>
 <SJ1PR11MB62045186FCE678E792358F2E81462@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <041b4973-5453-4897-9969-fcbc6f57b826@intel.com>
 <SJ1PR11MB6204821D9A97E3A286FDECC581462@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <d4932a6e-0b52-4ef4-8c1a-32995e6a3815@intel.com>
Subject: Re: [PATCH] drm/xe/mmap: Add mmap support for PCI memory barrier
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 17 Oct 2024 11:26:13 +0300
Message-ID: <172915357330.19393.6677527742308895785@jlahtine-mobl.ger.corp.intel.com>
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

Quoting Matthew Auld (2024-10-16 19:23:30)
> On 16/10/2024 17:06, Upadhyay, Tejas wrote:
> >> On 16/10/2024 16:13, Upadhyay, Tejas wrote:

<SNIP>

> >> IMO we should at least consider not hard coding the offset in the uapi=
, but
> >> maybe just return it from mmap_offset when passing a special flag, wit=
h no
> >> hard guarentee that the offset can't change if kmd so chooses?
> >> What do you think?
> >>
> >> Also if we want to keep the magic 0x50 instead of allocating an actual=
 offset it
> >> might be good to add a build check against DRM_FILE_PAGE_OFFSET_START
> >> somewhere?
> >=20
> > Build check looks good to me still let me go through both option tomorr=
ow and get
> > back with V2 on this. I will get this in separate patch.

We seem to be looking at the quick'n dirty downstream i915 uAPI being ported
directly.

What was originally planned for proper upstreaming of the uAPI was to have a
query interface that would return both the mmap offset and per-client page =
offset
within that page (cacheline per DRM client). This interface would be most f=
uture-proof
for HW changes.

And if that query returns a failure, userspace would have to revert back to=
 alternative
mechanism (either kernel doesn't support this feature, or it got disabled).=
 That
fallback code should exist and be validated and reviewed in the userspace c=
ode
before merging.

Regards, Joonas
