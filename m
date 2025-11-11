Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A051FCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 08:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EF910E4F5;
	Tue, 11 Nov 2025 08:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+4fX+jy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E664310E4F5
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762848416; x=1794384416;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YjA88/CYOEpRucIaf/Nb67L+pET5cX+v8Wm9RP7FNtM=;
 b=d+4fX+jyaxsJwX6fzgHnnQ4C1C/San0bpa73w450bm6ZpKT4GsAsU+PY
 WutnRjIaI4tNi3l+/YWlpXAkOamf7uoo6qjAKwFpGbrjh6ixBhpjzK4h0
 nCpsQlIEvJf/D6L/XsqIxmwNdXRpdfdGQRFhHz9nEaDe3s1o3uM8ynlrd
 wfFIYi2cA/lk+PSgBDJ/ryCPkKni2SstbQ5cyeTp9c0cTJz86uExCSYSg
 y/cUIxxi670QFMKY0oUe9MzVO7xMgGMd+sy7+nJvZB9R0yx9NLJgFspAJ
 u9geZBZqZ8u53L1YDBWZgbAuOiAX3YOkIftRDedRJudrlnEzK7Cfh3cDd A==;
X-CSE-ConnectionGUID: KmWOa2qvQBWGJkXwkoMrig==
X-CSE-MsgGUID: hUcsaGJVQhaojbgSptunyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64791725"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64791725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:06:56 -0800
X-CSE-ConnectionGUID: hI0QQit1Tdeq9d17cB1H5g==
X-CSE-MsgGUID: KBoGJHApTn+/IL3pRc+JkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="219553155"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:06:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Cc: Jani Partanen <jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Possible bug?
In-Reply-To: <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
 <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
Date: Tue, 11 Nov 2025 10:06:50 +0200
Message-ID: <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue, 11 Nov 2025, "Usyskin, Alexander" <alexander.usyskin@intel.com> wro=
te:
>> On Mon, Nov 10, 2025 at 03:49:20PM +0200, Jani Nikula wrote:
>> >On Sun, 09 Nov 2025, Jani Partanen <jiipee@sotapeli.fi> wrote:
>> >> Hello, I just got Intel Arc B570. It seems to work fine but every boo=
t I
>> >> get this in dmesg:
>> >>
>> >> [=C2=A0 342.865944] ------------[ cut here ]------------
>> >> [=C2=A0 342.865950] UBSAN: array-index-out-of-bounds in
>> >> drivers/mtd/devices/mtd_intel_dg.c:750:15
>> >> [=C2=A0 342.865954] index 0 is out of range for type '<unknown> [*]'
>> >
>> >Cc: Alexander and linux-mtd.
>> >
>> >It's probably due to struct intel_dg_nvm regions[] member being
>> >__counted_by(nregions) but regions[] is indexed before nregions has been
>> >initialized.
>>=20
>> yeah... and we shouldn't silently continue hiding the ENOMEM... Sasha,
>> something like this?
>>=20
>
> In general, looks good for me, but I see that we can fill less entries be=
cause of
>                 if (!invm->regions[i].name)
>                         continue;
>
> Let's leave 'nvm->nregions =3D n;' in place, only need to fix the comment.

You have this in place, nregions already accouns for them:

	/* count available regions */
	for (nregions =3D 0, i =3D 0; i < INTEL_DG_NVM_REGIONS; i++) {
		if (invm->regions[i].name)
			nregions++;
	}

BR,
Jani.


>
> - -=20
> Thanks,
> Sasha
>
>> Lucas De Marchi
>>=20
>> ----
>> diff --git a/drivers/mtd/devices/mtd_intel_dg.c
>> b/drivers/mtd/devices/mtd_intel_dg.c
>> index b438ee5aacc34..114e69135b8d9 100644
>> --- a/drivers/mtd/devices/mtd_intel_dg.c
>> +++ b/drivers/mtd/devices/mtd_intel_dg.c
>> @@ -738,6 +738,7 @@ static int intel_dg_mtd_probe(struct auxiliary_device
>> *aux_dev,
>>=20
>>   	kref_init(&nvm->refcnt);
>>   	mutex_init(&nvm->lock);
>> +	nvm->nregions =3D nregions;
>>=20
>>   	for (n =3D 0, i =3D 0; i < INTEL_DG_NVM_REGIONS; i++) {
>>   		if (!invm->regions[i].name)
>> @@ -745,13 +746,15 @@ static int intel_dg_mtd_probe(struct
>> auxiliary_device *aux_dev,
>>=20
>>   		char *name =3D kasprintf(GFP_KERNEL, "%s.%s",
>>   				       dev_name(&aux_dev->dev), invm-
>> >regions[i].name);
>> -		if (!name)
>> -			continue;
>> +		if (!name) {
>> +			ret =3D -ENOMEM;
>> +			goto err;
>> +		}
>> +
>>   		nvm->regions[n].name =3D name;
>>   		nvm->regions[n].id =3D i;
>>   		n++;
>>   	}
>> -	nvm->nregions =3D n; /* in case where kasprintf fail */
>>=20
>>   	nvm->base =3D devm_ioremap_resource(device, &invm->bar);
>>   	if (IS_ERR(nvm->base)) {

--=20
Jani Nikula, Intel
