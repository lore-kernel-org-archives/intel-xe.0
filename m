Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8943E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 18:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FE910E07A;
	Fri, 20 Dec 2024 18:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACOaVPPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8512A10E07A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734720714; x=1766256714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/2ulMqBNG1pdTS4pspI6MiuqFi7DPtkwLwhYeE2Ptq8=;
 b=ACOaVPPu2CKlvrF6YeqJMNtMo6TXV3741ttkagn+a0vjFtKAWNcLY9Sw
 Hw2SOO1tGfHCeJL9f9Dhol98g7vzJJAe0I748MsRaa48nq9j4lQTUPMIC
 nod+a1JN0EULiLdruFI9JUJfA3NSdo0FlKOVTCE0Zz4Tp9Mas2vpqcwEX
 446wcY/0G1haVc8TkSNcrYUVnf8KCfbrx9KPqZEDSzGoZacpopRzDCI0l
 fHtJ8u2UDs8A7BfOV43TpzmQL4eozXiWudI9+RwwaPDocgOm6bh4BlBmC
 WBkItdUMC9Sw7vBzX9ze7pVlJ10S4kMDL5d/mDxN9bN07ve/2iPFCwIbx Q==;
X-CSE-ConnectionGUID: QEX3VEMcSNap/UKAXTu9+Q==
X-CSE-MsgGUID: dM1Yd79yQTWsBxWONA1TJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34992220"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="34992220"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:51:53 -0800
X-CSE-ConnectionGUID: 1AsVrwcGSYiLtXTohjH3Og==
X-CSE-MsgGUID: EXXlzg9uTVGnTUpkk5iE3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98358889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:51:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:51:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:51:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:51:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdQ3xC/tCO+U5FNIx/o4as3gpUJRslmuik7FNPEPWOGkT2s6w5DO8D3NV7qZKqokNIbHa0UCmvTgz+eOnTKKBQXEEDD9GkBz9kqaayBtKm+sFS1WNoL/HhEkI3tf6Mg9/kOFFp0cfsgRcrYCQ5iCG3WhGKCnAwu/MJFfbcaFGF9+4u8eqF6ggOJgWWtk08uSqdnIQcIM11aRlrJlkIRhD+jNcGSQw/sP2hsrCN2RD+UBMHukMOyOUsjXPVzOmvWu7gqqf8dk4c6DAqA0DXSwFb0Sj+b9K1pZ3NFgttqQjDkcxnhpm1cySN9mopiErUkTXlF3Let2UThiFELMiqElqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sCicZiIRk0aEOOLfURKd5K6+c1jaZmm8p0b4KSz3go=;
 b=B3wHZGdlwQuUmT8UXIL60BNANj+LWZHdaKpPvMHAth0kyhys+aynwR7QQohBvMDzM94BuD1VyqllWN4CWAvIXyO60wUfoYsZoePGx440SRMiMBC95Vg/8lW53FvruaP7A53x9/wVje8VBRegou3G6NIBw6VJOgz9Vj1zzgc1/qpzZX/x2K+CObjbQJHP52n27b0zdYl8Iod2KhOs/nDrcXAGPDQ14Pu4q6aVPP4LO+c674FPqEXjyMmRb+iNss3C/Aw7N/Bi5z4wT7ttNonxSE5u8ytU3urQNXEUQkVDWtHiiOQXwxqndsiYu6DXTALMfBu5aTDH0BKWUuRc/QOEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by PH0PR11MB7448.namprd11.prod.outlook.com (2603:10b6:510:26c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 18:51:45 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:51:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Thread-Topic: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Thread-Index: AQHbUwNkteZZg17O60KykKAUERALmLLvZ/zggAAK4ICAAABhgA==
Date: Fri, 20 Dec 2024 18:51:45 +0000
Message-ID: <BL1PR11MB54452C1DFBBE9F8E910795DBE5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
 <20241220171919.571528-2-umesh.nerlige.ramappa@intel.com>
 <BL1PR11MB54457FB542D12F9E10AB2AD2E5072@BL1PR11MB5445.namprd11.prod.outlook.com>
 <85wmfu5i1e.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85wmfu5i1e.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|PH0PR11MB7448:EE_
x-ms-office365-filtering-correlation-id: 3c03a141-31e5-4c7e-1f76-08dd212759d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Eu93sZDjFfU3AGjBBVnZiUeM+eK7rJ8r9+L8QRqwe4/RRuiNtVcLW4jWowpc?=
 =?us-ascii?Q?smw4KoedM8hFtrJMH3fFDe9FSIFv0o8EfMqte9f9pObIWjDVCnntLvp6OJMk?=
 =?us-ascii?Q?fHHjXJDqJrgLSAuFNyr2TVrfnE0mEtsgGR4MQINznpZs8zUq90LsL1mxMaLl?=
 =?us-ascii?Q?ZVStnxPiDdWxJrnGJi+yILZinu+aqw5394FxR5reUDwcAyidvQm6I5J0YvQh?=
 =?us-ascii?Q?By9Dsnf34Hiv9WkT3aCcAHV7DWSbTF1TWFV/NfLua2qM7O7T5JHs0ewpjMC5?=
 =?us-ascii?Q?NfDvstPS+4HPQu4QNYri/+/Pf9ioyTnhfuR4fZLIiw8TYbLNSpMHk6qDCWEM?=
 =?us-ascii?Q?zuYv+uyj+9risNmgi+2r26UEXFtGenRjRg3IPsmp+pbVVgWUVwGLV1yjPsUl?=
 =?us-ascii?Q?6rjCguz9JosIpFHNfK5kpqWMXacPkjZ/eHiQNyD8de9y31ENOBfWXOOybp27?=
 =?us-ascii?Q?hdP8xrE8pB3jr0jCW4yAh9JDc26rAbsNbAyZha++gbPLxyJSqPdCqAKMR+y0?=
 =?us-ascii?Q?q9qZ9CsPAH0pN6cxvUKdmPmpmazptcD0ZrjV/qSjACU6uKr6LKERtq1EvSzj?=
 =?us-ascii?Q?K3a0D1n8dQpXlnmY1ZznQt/V0iGlr1djCvQRzewONXil18VGWzPkxiqGAJ5y?=
 =?us-ascii?Q?lU2xjoVFiByQpxJwzzhWok3t/jbYDrcWxcN4PLeWuFK8RbBhSLfj+wH3Y5St?=
 =?us-ascii?Q?f2D1CSappZpP7r88bcz50cCBWaSgvT2p6PZxWTNxpQJaJzI729OKSirdauKw?=
 =?us-ascii?Q?gRibdVpwdpUEJ/ixMJ34YO6afcxdgs9zJHsN4vUvqRc94fGx5uP3nlRE9jg/?=
 =?us-ascii?Q?GZ14y1eKtug8t4971hG44cq0ywFwISP0EZjWmgRgfPLR0qSoECNeBI5Tff6K?=
 =?us-ascii?Q?U7TGG+3Y+uq258gTvJcuEDP7ht4d8ZByXzGZGbfjzim76ULd4apk88w5qkfZ?=
 =?us-ascii?Q?WJIpauZtnICQ/pJ5/UbemXikRviLvs5PG+00IuzlYVdaoDQIziCYqVns2QIC?=
 =?us-ascii?Q?6GPep4l2/0o+AXghMRL+v2znZRMkoIFH414aKJcGDAzpSteiAyavh9gIcYpe?=
 =?us-ascii?Q?O1ALrR7VsfeOwJb8usSS3h6JhkiS/ROZpE71GFsrHjxshjcClGhL8Fly3lBi?=
 =?us-ascii?Q?gx9XIr5vvjlUF28rgQrtNrchfRj8GP5Bw1xj/u3t4IsOP31IkdCLp7JBjjkt?=
 =?us-ascii?Q?+xk81gbzlxoBvMKUN1BlyOkwrI738O/Fq6ybBL5mAIOAoR/vrhtTiNoKUTce?=
 =?us-ascii?Q?RAPm1P73UsWo+J1GEcGbbhSNoACYl6HsVBAaTpS4lOB4VaIw8tkRcXNtKY0N?=
 =?us-ascii?Q?vKg7PvHZOO8Cme/ZuWrPtSxCEPpHtlFE8FPYIyQmcMIHpvZl9q0FZPTe3AkN?=
 =?us-ascii?Q?BIQU9oaVSQ4SQkS51A75PeR9rT/C/8Du6xfCbQF9W+RNukgYPMkMZhqJGkQe?=
 =?us-ascii?Q?vk44WFOG9epAM8beWqPz74AALjdi7X5/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yvit279sCdaIfkxoZ1OFCfPYbh8jPQSi5K3O8GU+ZQ0bXYLJBtV+FI3A1nMp?=
 =?us-ascii?Q?OrwjRRRm8x10qTb4TEKKm4CO0DzJ6efNdO5i85mrNKwD5k8p6bq1KIiki+ex?=
 =?us-ascii?Q?6tLXnb+2etPtWFGQDCz1rgPuSyEcllMs7fo32CGsiblwcWeD50OVfbmqE45N?=
 =?us-ascii?Q?7Xnx3tlIA9AhZSfak3vTqfBPMynBP7pAkS+vTu8/zRA5gmN+g9i+WeL5g7bR?=
 =?us-ascii?Q?hmu9udAa4nODg2zhcP6ttIvP6oEDfnsJFFh/LE5aLtUTLEaOf/dlBlOPqNjr?=
 =?us-ascii?Q?bNG9Zr3lI336tkYAa1NC6S44HzTLU61lAOlT32duEfaKmCGoo4d4KKiEuMfK?=
 =?us-ascii?Q?MIW1V1uR6WcEWOueGmt5ZApizFR0e8WaeH7IJscyqA50Ja3W2KryQoRbL0ZI?=
 =?us-ascii?Q?bHNFCt2Vdag1YlJ4DrhnikGXFyvYWGISWweiW0mdksljoQoNqh02JeEFARw7?=
 =?us-ascii?Q?jJc4AByssMwM4ilAXkUy4vj8SJTXEcl/N+1ojxFx9p/ogd3tW331pvgoRKJU?=
 =?us-ascii?Q?I2q4/YrH64izBdtS1mlf3zf1LFknKdTDQX9k0WvpXScWPUrEVYQFKIdcMqPO?=
 =?us-ascii?Q?bxuNWgcZs9ZIzf0+3cVE2uD7e6/8RPlCpD3ffJv3co87R4EIQzmZh0dvV0Xk?=
 =?us-ascii?Q?FmeIwmMcNoZqDwrVMzbnkFzlI7q6N7cmINz/NmjeFTadp+MfCWkavfWHLs/E?=
 =?us-ascii?Q?MsEoRZ9qgjUo7DT1k8m+L+lVM7HZShEwAC2J39xCCyRYiDz9zFsb+Zwl8D7S?=
 =?us-ascii?Q?vu8aDFjmGngZJQuB7l3RsVU5B96n2EVreTFDqKhgDfe9B+Lx3X+vcN7MONJP?=
 =?us-ascii?Q?amB5wGgbGHmUY7l/d0DC7HHNSyyT7J8t5cWPgt2FeZAohrNkTs9HCtveskKx?=
 =?us-ascii?Q?J3hwvOwmGYJxt3mGj8QCCxtdyU/TNC6XfjzlYh5YuUGgxRrOgD3VpwGnNxxu?=
 =?us-ascii?Q?JLI71fHJl3IunZmTKMb3WxWzZoDOs3ZpxFMOnPItUAC+FDdDacGmr/fA/LD+?=
 =?us-ascii?Q?HImfXjsSemAv/uwiog3hTORvqvfN3SdY02ozogVvV675TJ6GZdtTk1oEYh2f?=
 =?us-ascii?Q?gNBe3bzTD2QT7mZpGGRZe7GNlpqjkKrdTsapIj9f0cVo/qmYWtaBVN7ogjht?=
 =?us-ascii?Q?Exk8qGWazT23qmCTBIM7BztFcxY5s1NIeNTN5KoblDKXmJt+BHmzsJ4jQhRF?=
 =?us-ascii?Q?KiDH6yGQNMzLGLIqJYRDFReBnThzkBpvLg6cSLbNuKF1Ev/z9IUxmM/yUXxP?=
 =?us-ascii?Q?0ybf1bA8ujD6HaTA2v8/RG0oeRDhCAszLKQSBk7A+72vJ21Y8EYKq2IOvfNe?=
 =?us-ascii?Q?DXu/4UUM1/QxcRBYJ9k7p6lDeCib84XMo/gsMnarpclOu78T6MFrXtbC+eys?=
 =?us-ascii?Q?UC2X9sR1g3g0A6gC8IMqAPda7kbWripAiNVP/Lns58il5biESgrAZaNH3z6P?=
 =?us-ascii?Q?m7cG98YAhl/n910NVSBvZXJ64YZGEznT5wFN9KZ8Y+msLj2tclnBfQVgivak?=
 =?us-ascii?Q?f3al5suWiPEddq2/MdNSMY4uDpdbXiwNqyRDJ7n9qmlYSGjEM6ad1DDujeJ+?=
 =?us-ascii?Q?eud27ugQkKIE0ysiupDOdK8PjKUo39Lujh7Qzg51JqUtcIyaXIwrEm0MZEXV?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03a141-31e5-4c7e-1f76-08dd212759d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 18:51:45.0519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9u/DC+6Iil3hLijAjvVp6g4I+1VpUz6I5MEJ8cXgDShrDHMc3CbvaFz8l6cTnmAgii7spuqnr3XPGyhSIoMBn9GKZE3IMNjJ4wSCmO/cQuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7448
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

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Friday, December 20, 2024 10:25 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; intel-xe@list=
s.freedesktop.org; Souza, Jose <jose.souza@intel.com>
Subject: Re: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
>=20
> On Fri, 20 Dec 2024 10:08:41 -0800, Cavitt, Jonathan wrote:
> >
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe=
_ring_ops.c
> > > index 3a75a08b6be9..c8ab37fa0d19 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -223,7 +223,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 valu=
e, bool stall_only, u32 *dw,
> > >
> > >  static u32 get_ppgtt_flag(struct xe_sched_job *job)
> > >  {
> > > -	return job->q->vm ? BIT(8) : 0;
> > > +	if (job->q->vm && !job->ggtt)
> > > +		return BIT(8);
> >
> > Non-blocking question:
> > I'm assuming that xe_oa_submit_bb isn't the only function that can subm=
it
> > jobs for get_ppgtt_flag to decode, because otherwise job->ggtt would al=
ways
> > return true?
>=20
> Look at callers of xe_sched_job_push.

Okay, I see where emit_job (which calls one of __emit_job_gen12_[render_com=
pute|video|copy|gsc]
internally, thus also calling get_ppgtt_flag) is being called in xe_exec_io=
ctl on a job where ggtt =3D=3D false.
-Jonathan Cavitt

>=20
