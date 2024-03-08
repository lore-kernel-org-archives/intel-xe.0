Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C19C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 14:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7217510E921;
	Fri,  8 Mar 2024 14:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jy/0ryl/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACA710E921
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709906437; x=1741442437;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LzhJu3Hqo7LCi8yAKzU+dHR7BTE3IOG7x9YmRZaDSOA=;
 b=Jy/0ryl/mr6OFcj3VT2VOEkBVQrPQnNeAlLGz5fShbIokY2k05v8LLaf
 gyS2/bU13ETMyAvJN27/b6t/R6Gh3iacUjrUPcSolAiY7ErTwB3XHwwPT
 S+gEBAIdely3HWCU0tpGtKU6JZCUuJHeTcnLmHi9Qi3mui5/ht2ux+2ob
 QGsxi8bq9Bc+6i/nZ4vHsbKKj1k4drcZT8p/MjXayw7X3Fa9FaRFbUpuD
 XQSRsv67ZOt10DTWAXDd+M9vFUEGlRStZ5sV/6cxP+lFimxFnlobIu0Yu
 wUbYcccptxfg+NoLx3Fell0DhVj7coDbnuvrosssI5PKiDHqg/TVsMYPK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8444311"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8444311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 06:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="11015012"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 06:00:36 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 06:00:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 06:00:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 06:00:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhsGsmEKNQPRrX+mXx0AuKfrpYmx6YtQCQWl9MMVSQDzhVX5jWxVGcAuO/CxFx8v10P1IAg//45nccrj0SDJczXvrwri8zAW8nXuouiYn3nxq6ldb0jqednz7+TUYKRziSQNE8Vv1OxkdEqG7ofwkJOZL510g2w3x+zq0ymdxTeWVGoDRtkgkKl2s6X7261YvEz7eQSascO8KzWD+jMdr6mEXQzNmsMreKISFtdkVoXnnGI0p4l+SO5pKuXZ6EJRI/TJp8ZfTnOTqlODZLcaX/n++Y1cWqUDfJUK6QKSyejakCPjMH9NSKKWlhxxpQHuZ/9VyGOzfdiry0mdiXPP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGVRftE4s45KdYk+Id1DY9aj5Smlf7UwyYmHHQyZgk8=;
 b=NTocXScC6w6fXO87OZZRD2ZCJ2rqsV2JWLCxG+3zzbaQy9NitYuj1zuH09u9PFkK03PxApMnAByIqy4UwoR+fsGQuZoSecLwS5nP0AGouhPp+71+oKxPf98JAGthIgQYXSA8l37sexHDpJkPdduFaaLpWf8e+HAxaevTuDuRpnmTYW2PTQBl3TpMHmMf3ZhrFyMR3krNO6EzlLdphRnhBZlpdDcZkngd5DCsqmEsBGDq3+hmD246zpmuzT2pTRB6IN1h3R5y7A/bXzbbHcrXvUrl/W3wCIdSyB+YKUhi4hf2tMNZZKncRDJaWmmFYL3uiz9ahuTOsZfhM4PYQ/RfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8248.namprd11.prod.outlook.com (2603:10b6:208:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 14:00:31 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b%5]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 14:00:31 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Topic: [PATCH] drm/xe/gt: Remove redundant num_engine check
Thread-Index: AQHacSTvmrzrYDafok+XEwtYpsDOB7Etm1GAgAAI6DCAABIgAIAAKIGQ
Date: Fri, 8 Mar 2024 14:00:31 +0000
Message-ID: <SJ1PR11MB62046E5EE09617C2303E4F7181272@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
 <ca8373be-d0a8-402d-8e4a-09637c1e3217@intel.com>
 <SJ1PR11MB6204115AB85BA65F78AC3C2981272@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <Zer3VEMhwktXTg36@ashyti-mobl2.lan>
In-Reply-To: <Zer3VEMhwktXTg36@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8248:EE_
x-ms-office365-filtering-correlation-id: b29bfe2d-5802-43e3-5070-08dc3f781dfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3HvSvvolAsI3OgmX/CdJxQaawJju4Khr3h98DMwfPB0SnbPhMrc05FYRDhZkqYi1XX+TV5Qsbk3Fvhdmf9JftnrObPFzYP4e1xMiPuhYwdD5DfQ3jINqrPbcAKhUaqtWQIZ3G+TTqDIMCC2CzE5+qIidQsqXYcuUtFDZ6AaiuMb0IwHZDAezifPg5ljKJiOXOYJ54o9Q/dfMwefGmxpSDLW4UTV93aCprUHQUgw1d6BJG3v1j/m4wfUKY1/RGbmrSAfzUi183VNYtH/ly2BbhvVf5OzJ5AQBkNLAAQzTlf4iGguvrELDFDURimBS16mqoud+sYdYBX3MEJC20wUegsCy3HzyZaaP8PicRKL35fuzF848YY21y+zDHkbQD22p7sP3KNIu6BKyc1ItPIGcVVRQ2GFThiimsjRQQI4gV+e4cw/uqD0OkVvyKkG7bseQbhHICVFqitSYVk/PNajGaof/jBoRZAD10TwSu81Zw0lKwvbkt7V9gyTkEd4tKGvv+FbgsRzHa9rq6XA8eiTq4rNhGBwWCaGGv0Indd5LcqMjAj9h961C8loXUkMCLl/aQSKVEkWlWbS/PU1UO38PNvSOG0XdKwqvTiz2y11tXlH1Yzp8gc/9w0+OBQs6RaYlx3pKtph9z3XObizRN9LYzHj1aQFmhA+FKjODqbAkRy+F5to7oj1PDE2Dfi+WfcuTZBbExg6jYTiTNsUr0pfCLHkacOYstLVMsCiPDVhRIWQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XZUxGeQGerfMvsoXNHBzFdmN9BvdzWoiQes2eDpeTHOYRPbfJDHntjrQoIIj?=
 =?us-ascii?Q?5FZa+9MFeWhpQ1ZMtKxdgLKjQtKHnlxNduB8ukLC1dWxR16NFmgbhwyGB8M0?=
 =?us-ascii?Q?Svh+zKMH+Ex8G0UKPq14lNLVhs1UhNofkrHs9DzK7RmQsdMKaIIDcdnK6xN3?=
 =?us-ascii?Q?4TFAXvMZYiWgYZteReARcf58QH/bT88VzEYlxJtoz5dbvIHq+9MgBkHQdJYJ?=
 =?us-ascii?Q?8QJBv23hBOTMjQ1Tgz6VHI1n+c1ZgJwnYlbKq/PBJqEKNe5B/vTAUTP8/nuO?=
 =?us-ascii?Q?uUjZHr9pvLldmKFr+OogZocL933RGwb5uIrzOYgHea098LePE1qVz2bhzWSC?=
 =?us-ascii?Q?tLQejnUu/YE/dejcfGxsgaVsAy8t09MdSrhuMwqrKWAed57YE4v7xhGDwldF?=
 =?us-ascii?Q?mwip7CTDPOwEOIJhpsGncEr3HCGktyOHcjLW/eGVlWGzZWN1ijYEYM/ZFiFq?=
 =?us-ascii?Q?FeHIIPKVZqlxqAJP0CGXjWSFUie4s5C0xzXMjB7XvcBYdJSqFJYS3Bkgerm3?=
 =?us-ascii?Q?+s4I6sR9qutqVamnKhXuPsRqTxzLaWpPLU3nOzrkJ+Bx8eeCWRY/FT1ZbEi8?=
 =?us-ascii?Q?a3DzE/U1jufmNUsBNUq/AlSrXuu2kNk5NuB0iKkM/3AvnuvlycZ2zClDineA?=
 =?us-ascii?Q?8gG6oQP5DGMx7AtxTkmmslULMQOo/4+pZbaNYW1IUCFNariAGnaujKTgYKsA?=
 =?us-ascii?Q?T6UYXUlHPtugiscJ3qcrw0VPB/ox9ciZDRw3Eo8H2LseBw4lr9iMPfeImMua?=
 =?us-ascii?Q?1XMk20g1CQWXzeIf9dyHvGGkVfXTxccKDEJkI4s7kV8BzRmq83pb8zmF36oV?=
 =?us-ascii?Q?1uIe4DBBwA+AH7KdmP7AM/VyzyxhI4QYZ8n0jepjUU9yPLh1v4iBO8O6xEsc?=
 =?us-ascii?Q?l2k50apM9s/hl4G6yiS81gzOjuBtXO+ZvWSnoVbuwUb369uigWOSYOROJG+G?=
 =?us-ascii?Q?+jeTez8nXRMHR97mAl5rE+GXJ/ZdR+GOdzZItjr1/Taa6juRi6GE0kfJe4d8?=
 =?us-ascii?Q?x1v8v6jQJMzo2PrY1oQo04tn9vhceIxwWLkfYTIc+TM91Fih1oERJNWciuUp?=
 =?us-ascii?Q?A5a4AVB0STT9UO9Yj4dOyZG88e7o5o9llnMF8oLiQZuM5nlJ/qPJFod3XEuL?=
 =?us-ascii?Q?b287dX8db0xyE2EhQAICfUn4QrCs7PCzz3KGTU/CLLy5GAFTlLdFBx1Li7v+?=
 =?us-ascii?Q?yC+cLFWpXXb52bcj7kD+K1+XL0ra4nGQ7zZtgHWPe8hBq4SEiaHAEUK+Vi+o?=
 =?us-ascii?Q?bJi0NNpEvHorkcel9G0R5yzVITtaEONj1HqeFvUR295h3XTcnXffWlGdI4jJ?=
 =?us-ascii?Q?tU45AP/nTGQGhcRza87qkogHvPkf6BJnedD9F8J9kBuvP1ae8JOvhm6q61E9?=
 =?us-ascii?Q?snHi9RobnIEIz9z9U64OQJ76CQfGoQ1QzU3uC989OIuPV/ThBliN+VtoDieF?=
 =?us-ascii?Q?uzlKSznkb0g3ZNG9739d0BKtRgfslFfsSw2/qUu7NisWgBEevtVEnC7sfZsp?=
 =?us-ascii?Q?cKLxewKqpbnZHbN6gADcXGa1ZoZrjqMuAYEuuz6sRQ3mhAP8DgJR+E2vytQ2?=
 =?us-ascii?Q?2/2mFIq+05pDO7X2Eph3O/lUWKTDZBzX++ExY4VbNGkAQrJb6xkyK8mpwZzg?=
 =?us-ascii?Q?VTSHOeo/eJcNJI+leNqDp1k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b29bfe2d-5802-43e3-5070-08dc3f781dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 14:00:31.1161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlB+thNFKRY8F6thZdTeLawCb6aD2wT3axO6D0gKlv4eZff6dpHQrP7hRFKBKwghoDvq7Qcu/Vyy4kSy4FTkHUDs+ovKl0+GwVPByvABPO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8248
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Andi Shyti <andi.shyti@linux.intel.com>
> Sent: Friday, March 8, 2024 5:03 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; intel-
> xe@lists.freedesktop.org; Andi Shyti <andi.shyti@linux.intel.com>;
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH] drm/xe/gt: Remove redundant num_engine check
>=20
> > > > In __xe_gt_apply_ccs_mode num_engines will never be 0 as it is
> > > > already checked by parent function.
> > >
> > > and that's why we are using xe_assert() instead of explicit checks,
> > > so you can't say it's redundant
> > >
> > > note that the purpose of xe_assert() inside one function is to
> > > enforce the SLA for the caller who should be responsible for doing
> > > actual runtime checks
> >
> > The static analysis tool Coverity is also complaining about checking ob=
vious
> condition on num_engines to be 0. So decided to remove this.
>=20
> yesm because it was checked before, as well.
>=20
> BTW, please do not consider static analysis failures as bugs to be fixed =
with
> the Fixes tag.
>=20
> Unless they really are bugs, of course. Coverity is also able to detect m=
emory
> leaks and buffer overflows that need to be fixed with massive Fixes tag :=
-)
>=20
> Andi

Yes using all possible time to clean up Coverity issues along with other pr=
iorities. Things like this may not be bug but contribute in consuming some =
CPU cycles perhaps. Will take up all that comes in list.

Thanks,
Tejas
>=20
> >
> > Thanks,
> > Tejas
> > >
> > > >
> > > > Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > > b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > > index 529fc286cd06..2bbd7b203cc2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > > @@ -22,7 +22,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt
> > > > *gt,
> > > > u32 num_engines)
> > > >
> > > >  	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
> > > >
> > > > -	xe_assert(xe, num_engines && num_engines <=3D num_slices);
> > >
> > > btw, instead of dropping num_engines condition completely this
> > > should be rather split into two separate xe_asserts():
> > >
> > > 	xe_assert(xe, num_engines);
> > > 	xe_assert(xe, num_engines <=3D num_slices);
> > >
> > > > +	xe_assert(xe, num_engines <=3D num_slices);
> > > >  	xe_assert(xe, !(num_slices % num_engines));
> > > >
> > > >  	/*
