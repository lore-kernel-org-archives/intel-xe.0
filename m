Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BC6C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 06:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAB010E089;
	Tue, 21 May 2024 06:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuVoYRu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C9310E089
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 06:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716272598; x=1747808598;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80OcTgi0rar2ZhBA3FyExr9lOTcpvPbaHIYeGonTZN4=;
 b=AuVoYRu9iOXhphl7gWdZP2qPrAxlXPT6riFLrSlKj8VW/a1ja94x4Rm7
 RFnX7S5hgDVJkhtvRYje5EuFNW0u7IDgVasyeM1ZE4cSatVSMyHumDIEu
 QQCdxAXrw7WogAic3DaBi88/ejw8wvXGyV5jZjbOKgymr0RKegAPC3IuD
 +ovth4TBY/QYbIiLtBF/PwffmGtrPTbqM/EUjcq7G9NTkdraBHRJQ9CgD
 BVNNFtWqcuQXWv2DMNctAwKoEGy//oewyShl9CE+O6ZR6NKF3Hsg0CQkU
 C2PcDAKAvRcXYl+SXWfByYZkfswJVEkpM5AxraKanUZoQW9Co99dPy1fF g==;
X-CSE-ConnectionGUID: mEqNLiK4Q1qMBhBz1/BpTA==
X-CSE-MsgGUID: 43Z/FEVoTDu02DW3/rDlFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34955417"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="34955417"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 23:23:17 -0700
X-CSE-ConnectionGUID: PMJuHCvMRnKVttIOUxbD4w==
X-CSE-MsgGUID: 7GH58IUVRymQZhrz5J2yYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="32831601"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 23:23:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 23:23:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 23:23:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 23:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxEzLYX5XHE7DVY0fpH+7AzP9DvOQiHHk9s0sdQOLY2vBJdtVKm7SyRnrFKb6Ua5xd5JFkpxWifFGfRE8530uc2iCMiMmwkabrOnaWVdgVy99tDhHS+ZVt76r0Sv1HIq++k2XohXQ3Lk35gwQOV7Kf9eVGTod5jK7q55Ae5Eq2paIZ4l4GZptd4brIQhucuGV49m5/Ucf2J/bsXFE7LOQIuJP0piKaZUHbKV57qM2pNTdoU2BfoshM5rY0UbFO0ZqNghjhlf2cXAv6qqCiN5aGRIhS1xnI7fkMONtdWodPJOFD1UdOROTT5LQ4dLA8hhaoZgZ2f2y/Q+i/p7RptYXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV5Eh3XxGwJXdMJrT0PI5eEuRD+Sthm7ForVlHHrzJ8=;
 b=Sm50P3U/zty1MUAaK722c2dF1GlkTtqJzcPstjPViX1QmCKDy55w5vUdOJIR62Cbk9Nmr+QY/0+GpdBuKdSXOoNsAOb0veTJJHuFBlB+a+tQy0hdGQcb6gqjRBIEDHiYTGgyEX9jTn5WR2897PdDRXaIGL4fr3x4CIrTGgrbc/vLVHrZ2KsRgDZEV9hwq70Y1fo+zbUgyo9sFAXXif60B16qakmTEwhA9TGJpbjfojO8kntZ3tNy5G7RN/1ekbJYbTOCBeJSGrKMsJ7s3LfZs29YeW8cV3fj7YnGbimXcOsVEnwWwClnZpFKdbZNE8HZ4+asHgCOgHqNCZph7gBbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 06:23:12 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 06:23:12 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Topic: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Thread-Index: AQHamtH7g1bNkyqL7kiMUIkrTPM5hrGXuumAgAmdoNA=
Date: Tue, 21 May 2024 06:23:12 +0000
Message-ID: <SJ1PR11MB62041F220E3B0EF11E1AAA7381EA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
 <20240430075609.2216291-3-tejas.upadhyay@intel.com>
 <20240515033047.GA2343622@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240515033047.GA2343622@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB6891:EE_
x-ms-office365-filtering-correlation-id: bd13f58f-a012-4eb6-ddc2-08dc795e7ded
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?GOoZ3mhRJbTzD7fNd1fqj5X6lOA3C33hma62qqzFthZHICzwxB/yVgnXw2+p?=
 =?us-ascii?Q?RdNU7SpwrV5n/KppNyrgk78w9V/EmVaaY05DQxLneKsSQk5eUu6GfNWwasx0?=
 =?us-ascii?Q?JP0kRGeFBK9qvAYkbMypNgXT+6UGjA9kZW4ftEjB5KKA2gv+ZjBHbtkbYp2I?=
 =?us-ascii?Q?PJReeSZ2nSKMiWOdrWw2qOBpM58rRClT+EkitmfV/Fm6YfmXFaVJtLWYYSuP?=
 =?us-ascii?Q?924hwfLn/pAn+AcBRczyiic/mbA6Rqe0Cf6A74HCYtH9qqgIlgcEZgrN/8RN?=
 =?us-ascii?Q?51YlvuD4JU6NFcJIoS5O9HjjLSk2A2FjiMUQCTRxsmv7svR3VCgSLY1Q10e4?=
 =?us-ascii?Q?sAQySHC+RoXk8tD5FqmSp2omSqgG6MU1ZoXFtx8XgaohtyyjQPGKEH1t3i0C?=
 =?us-ascii?Q?RpwHTBVEq+QB/7qJz//qVPkLBUAQGY3V2GNcdlaYpPGnY+oiPlxYpgT5GDdx?=
 =?us-ascii?Q?lOmw5enCK4mfTne7fiZJMlypprY7yyoja+4DuI/iRzClvyT9LzUrtEziz4nR?=
 =?us-ascii?Q?M5ToPfsWyc23T6B+5AwpTbU+0SHXtP9LoG5/VlbVf/2kA5QHkQj3Hxn6oU42?=
 =?us-ascii?Q?rF/A2E0T+z9dz+xyf/+oYTjFGC229YV8+KFUEUMPjgJAMJ+DbdwGWJrzRn+O?=
 =?us-ascii?Q?e28yzpApdUDFhqbt0vJwDWx8K1ZvN3ieszasMF0tJkztxinDKhenPrW88dMd?=
 =?us-ascii?Q?hjNPGHujU8eZuWgt8osquLS61FFkW1ZJKUpfEfjQO1/omRDqgLF1xxCN4rwv?=
 =?us-ascii?Q?VItd1n7MnSF/eBPtBavSsQk7HOwwc5Ag8mesnNayO3BcfaJ7G3X6ybWwyERd?=
 =?us-ascii?Q?a2Xczfn+uJ5wBo+Gu2M/cPovvM/hUq9cwPG8uB+bcg2jcLcXZMfzfef5am0z?=
 =?us-ascii?Q?ly7IQXZJGjJTOPMNZEjX18OBUV4/nuUYT7e3EC+JLBziKDdW1ghgH2dWICDU?=
 =?us-ascii?Q?lqwKVWV69pOpEyU4U8mT0rBaPo70r9HkpVjDlmV/X2zd6xPAlcfEYzwSg0nj?=
 =?us-ascii?Q?Cj+5suTKP8Dt4ZJ4qG4n/cWHAuyXGLCsyRFReGMbVErQn8RIfS1AIjfzKQ5k?=
 =?us-ascii?Q?PP0vEOUOm4UTYxnV4+zkYVn4Sy+9FDoucd9LHJFmpNPb68ORdqLfPp17X3gV?=
 =?us-ascii?Q?n+GfP2iVFMoytI3cGkR45HcdvtZgABkIVEBgi6GoSECXYnzQceCEV2FpAbmG?=
 =?us-ascii?Q?2K5gMZemGiF6L18iItT0OLsZ8tTT6EfjANwmDS4GgxDMUyYM9iBe2Nc3FDAF?=
 =?us-ascii?Q?2Li6RrbGvU/lNU8vkBVOwKjEYOTGUyz8gXL39EsDwUySD1gQDV2WExOcsG1Y?=
 =?us-ascii?Q?OG2Ol1SsOdMSF3Ic1vvHHkuGXjDPnBj6jr5tidJsGixRkA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RGE3ZB1GN0r4i/WrIgc+eaVhOw1b0gR7o+lnglVlAmDHJ905Exd8vMhAozfc?=
 =?us-ascii?Q?WYmCufqd2JywVC7L9SzTQuXYIK2aOS24G8pYz0dDmogeUzC3VA0dwCH4p0tV?=
 =?us-ascii?Q?tyKySGET9eQkjbYQS/5C6UFp/vjzrwGpYS84BmlwzOfAIXUXEoS8IWCZAyzE?=
 =?us-ascii?Q?yfLXIi6LIxXIbh9V4jUSIdHgh55XkLhlkANdJel08Tq2RtkppWA2mpf2zJoF?=
 =?us-ascii?Q?Nn0lssGvNAf5vmPecMGgsVCgNkWEQJXDvVXUh3aOX7dV/b8Af1WFoAUmwRd7?=
 =?us-ascii?Q?uktdgzMFWOg3sgbybXHwT4zEp8qgrG1BQdk5uGekHnxrD6kt3sO3mYqIfO3Y?=
 =?us-ascii?Q?13SBqSSgqzNKHpXPBeG0uer0olvZ3BGrgzKAwLwezswG6/qfeAdYMmT4Aq0q?=
 =?us-ascii?Q?zqyVo0xosD1FvxQjOmSbkA6+aoq52stG20BQgQvF/hDsTZ9kQrAUgAeNcNSu?=
 =?us-ascii?Q?60mu6sUj1OamIZ2GoDe/o2qOexm8jIORdedM2ocZrMuwLr6chAucxtLzXPdf?=
 =?us-ascii?Q?9ZdM4zWPQo6ODhFXkE9Ec+jkWQS3uGx9d3WreqEknPSHc8fTMeyqk0C0xnJX?=
 =?us-ascii?Q?pwGop0txDAKtD5/hdfx3wQAxTDse+ogd3ziS+R0EaykCyQaFk8029bUczDTP?=
 =?us-ascii?Q?tthMsdzvMIuXfROwPze2UyuIUhL7WSB5U6AncpWqbHXuY6C6dnsA3ENebYHW?=
 =?us-ascii?Q?6ZT0WHSKCiNJgfee4oanjUBpEu730xW9KrFGzqF+fiBg8IEB9BaGoEcO47It?=
 =?us-ascii?Q?fryo6JriYrA95vYyC5+jBztnXgYqs8zsQ1Guoej9aSD/C6FhRkO5Z5Z+ok1L?=
 =?us-ascii?Q?8mzSCIWjfq6gKJFpi1cIgvApR9v1PV2mNvFDlPh/aLztt7fTsM6H65zBcCT4?=
 =?us-ascii?Q?+61fCY3r3maa2BsvfRr45MV5HGCZ6Ac8GNlAT13oV7vhURZd0+IBBhID2S5Q?=
 =?us-ascii?Q?SQNuipVd2L2ye/47mkD2YziutVVq71iVPq/H2pw+2JOZBhUPRJrjXK6wkjSP?=
 =?us-ascii?Q?VLBJQOyMuvAyjyHZn0SqrtKdvtD3tuS5U2WWII/GRiFQ0D1Kjus/HyGV/fB9?=
 =?us-ascii?Q?qIPApyMoiVC8UlbLMcGpxVxvupUG5eCPrpCWTnlYa2j693CWvTkCUfkwYize?=
 =?us-ascii?Q?VhUho1ZLzNjkW0wlGZhsAKNfpFBLdmNkKEjY9KpCO5X1bNqAHwIIKMSuc1SF?=
 =?us-ascii?Q?Gl5tzAKrGzyM0CLdbhB/lDzhl2JRv8ENLBc8LyDHD78NVi00vv386M3sD54u?=
 =?us-ascii?Q?tbBQ/q30COUFV1DJzpEXQJp4JrYpQ6AWTMPcItJDdPbPZw0P1X8Q1vEnKl9d?=
 =?us-ascii?Q?c/JKMfcu+w8eWzY2OphhIM2v2P4WWjGbD6jzJEwgPPaEnL46GQmo2N+rRuLj?=
 =?us-ascii?Q?CnGtbAnafFrEGv8yxRQL+overis+cJ9P+J+tjuVw5rSEsKCrHhEBH6OxUvwp?=
 =?us-ascii?Q?lShYicE792aCJ9jIGWvU3KrDe3yKM6zMoyCQz/JNE3nBErWMWCVGilEyJ5Ju?=
 =?us-ascii?Q?msSonG4E1cr8iTrlebLn1WjKu7mJbmi3E208mZX0yo6a39Rohz1bJobTypCe?=
 =?us-ascii?Q?yHBv3zXRO4pm1Vj6DMmoz//dYFnMxk8IGiQSMZ6X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd13f58f-a012-4eb6-ddc2-08dc795e7ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 06:23:12.5799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9Jd7/9zmc21I8YOZSK6v6U/6ZzfTGVXpSQoGSQqaIRbdeJsJ/VMBwtt0x7ZrZ2QALJjuzhhaGDBesCJHz5PgWmfKfYnExY+S2N4ZY3H+X0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, May 15, 2024 9:01 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent
> wa_14020756599
>=20
> On Tue, Apr 30, 2024 at 01:26:09PM +0530, Tejas Upadhyay wrote:
> > For xe2_lpm Wa_14020756599 is applied to all steppings.
> >
> > V2:
> >   - Remove engine filter video decode
> >   - Fix typo GRAPHICS/MEDIA/s - Himal
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 7657aadf217c..76f7a7e3ee61 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -701,6 +701,12 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D =
{
> >  			     DIS_AUTOSTRIP))
> >  	},
> >
> > +	/* Xe2_LPM */
> > +	{ XE_RTP_NAME("14020756599"),
> > +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
>=20
> Even though this workaround needs to be applied on any platform with
> media version 20.00 (regardless of the primary GT's version), there's sti=
ll only
> a single copy of this register and it resides within the primary GT as pa=
rt of
> the render engine's LRC (bspec 65182).  This is a pretty unusual case (tu=
rning
> off something in a different hardware unit than what the workaround is
> marked against) and we might need to do something special for this
> workaround since we need to emit this workaround specifically as part of =
the
> RCS engine's LRC (you don't have an engine filter here, so it's going to =
try to
> put it in every engine's LRC), and the use of MEDIA_VERSION also implicit=
ly
> makes our RTP framework use the media GT to apply it rather than the
> primary GT.
> Since this register is within the GSI range, applying the workaround thro=
ugh
> the media GT will make it try to write to offset
> (0x380000+0x5588) which won't do what we want.
>=20
> For now the only platforms that have media 20.00 also have primary GT
> versions that match the Xe2_LPG version number, so we could probably get
> away with just putting a comment in the table saying that we're not addin=
g
> the Xe2_LPM entry for now since the Xe2_LPG entry already covers the
> necessary programming.  But if they ever pair media 20.00 with some other
> primary GT version that doesn't need this workaround, we may have to thin=
k
> about adding more flags to RTP to deal with this kind of situation.

Do you think, handling it this way would be good for future use well?

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index fb44cc7521d8..54b99f31a538 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -309,6 +309,14 @@ bool xe_rtp_match_first_render_or_compute(const struct=
 xe_gt *gt,
                hwe->engine_id =3D=3D __ffs(render_compute_mask);
 }

+bool xe_rtp_match_media_need_wa(const struct xe_gt *gt,
+                               const struct xe_hw_engine *hwe)
+{
+       if (!xe_gt_is_media_type(gt) && hwe->class =3D=3D XE_ENGINE_CLASS_R=
ENDER)
+               return MEDIA_VER(gt_to_xe(gt)) =3D=3D 20;
+       return false;
+}
+
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
                                         const struct xe_hw_engine *hwe)
 {
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 05db53c1448c..8a374afb789f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -227,6 +227,11 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
          XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
          XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
        },
+       { XE_RTP_NAME("14020756599"),
+         XE_RTP_RULES(FUNC(xe_rtp_match_media_need_wa)),
+         XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+       },
+

        /* Xe2_HPM */

Thanks,
Tejas
>=20
>=20
> Matt
>=20
> > +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> HIZ_PLANE_COMPRESSION_DIS))
> > +	},
> > +
> >  	{}
> >  };
> >
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
