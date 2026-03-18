Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFB1077604
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 18:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8440910E70A;
	Wed, 18 Mar 2026 18:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNwP+gcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D788B10E70A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773859119; x=1805395119;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rrf2h9rMcn0BV5m62nhrs8+eTZFAkI1rMfQ6ymzNkm4=;
 b=bNwP+gcYH0SePuert4lKC8VcYLDpBAbdq8Y4EW8tvGkJIlCfTdYgCU+m
 Mklx+fZ0nKLJL+7ORF25utZZtoX3DRhEc/MuaUgO+PbFEzDYInSXJk734
 jqPIANJ42zg3HIhwgxGEpcYNSpoLte+3nKJ1moo881018RpoersikhXBR
 qO9tm53wDjynCxLpvxJdOWv8+hnG7IeHCnDrrcDkqnT2kiVPBRtqIdFVM
 R5D5FTgT0VonnvvcMHL+UKiHoGWyLk3exF2bZ0DcBr9Ojx7ZNv8TSlLMO
 dt4sNZykKf74RyaQ0WLj8v7LouS0lp4G0bcZDL8BfVvOdTMzfb+tBbrYH g==;
X-CSE-ConnectionGUID: WhLVKTnmQUusRXWMBpnxiA==
X-CSE-MsgGUID: zd88u3wiS7qykMIVZZO39Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86402726"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="86402726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:38:37 -0700
X-CSE-ConnectionGUID: 0prnckkJSwqlWEw8M6/JvQ==
X-CSE-MsgGUID: EKbjKMkoRj+e8WcWLGNI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="247144065"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:38:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:38:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 11:38:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9D2tW6IrwIDI9fMonoVvD4Tij4XonJ61mPHdw9CPM6BTPnkJwre5tsDrjfwizf6kC0KROlCPtfUbgyJo9a18DCn4Jc5bwOhO7VfGFVJkhEECuaENFlOBCGPFlmylMNmdSZ1Brqlek7bKBlxHF92drp0qDaJWbIkSnqYudmgQSubagFcjYDFY6tplBw4LwbdQXVuA2wbMyR5F1EWUOc4p0Kx+prZmQO+XDKAjLlfJoySo0zTwd0+YBckTHHeP8B2yk2zYpt75/wAeaPUaOHxWgwSoMPzpRGOymCf3o/UxwPauB9ZFYmHXjwQ7eqdDm3RGBv/3VPD5ycGMCir3c+oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjbmAycvQDpwHu8AFDlA2eE+oVN55n0AFoHDSv/k3Nk=;
 b=lDqAMX7Xt6/Exg2IfXYsKCQLxWavIgWvwl4S2HRl8/MTBTf0qS69YamaCQg+hX9UGfYMCn3L9o+gTQ8Qi3FpwX/GC1zSdISKclrWpYD1hyZWRZuFBt5V9tahBZ5GyhHquO4jDTLT/y5FwL4MmJNdJ1I80G/tksgksJ539HenO8DrllfO150nNbAcmK2wqtJRZXK1VPZwmVewU34E/X4FQMFHaAQ4/mYd3wgRYL5tIQLQvoIvz9EHukLMPH7EhQxkie3jYb+Uw+D0iA+kB/YQZa6UAbyMTmB76PWdiNuk2L5gHqKUU/eqpG+28oMLdy8/QLlyRQZmRvKsCl/dPlmkew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 18:38:30 +0000
Received: from CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::d11c:a6f0:d986:827a]) by CYYPR11MB8360.namprd11.prod.outlook.com
 ([fe80::d11c:a6f0:d986:827a%6]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 18:38:29 +0000
From: "Cabral, Matias A" <matias.a.cabral@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU
 stall registers get reset
Thread-Index: AQHctW6eQLr22lHF6ke4TqP9KhlkObWz3h4AgACnAfCAABlsoA==
Date: Wed, 18 Mar 2026 18:38:29 +0000
Message-ID: <CYYPR11MB83609F08EA23C7B4902042E9B24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
References: <52d991cc7e8bec514bb582717a1c42033672d4a5.1773683739.git.harish.chegondi@intel.com>
 <87se9xpqub.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
In-Reply-To: <CYYPR11MB8360A705B57CE5CF6CFFCB6BB24EA@CYYPR11MB8360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8360:EE_|MW4PR11MB6959:EE_
x-ms-office365-filtering-correlation-id: d0572095-36c1-4ea3-2c76-08de851d8c95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: E8ipxhQV9m/ccAFoATDc0zihJdnB/Es9i8crY0SstraIxXlPszb0XxCMmdPp71HmehYEp99zK4ohyW6SEJbFPNJsRiYGMaq3EdTmW7xegixRJao3taN/S88pvdkuapFflbZEkTn2BSXD41iZjH0y234vNA1vxCwvWuKPx3rsl3E//tKOl1xzbCoUUSPXa6YxD8DMZkh7Ge/3f3BGIesjvZ0+moGziNjOUxFePkuBh4O5zoQTQ5qeqlHmxDjLSWURpVQgV78KCeScSF6LvQpoykWyjTzQKy6H2JNeqxid7k9acaoXnBuXRw7boYrGiYzrOaYgQPvQghEUKsz2XyUsDQSrBqZg2KzspsGsB1ukvjHmvXwa7KMgZDTowHzZmyeKsjN7LWFPKCMK7AX+8Jfy+oe75vc3t9/JoMHaFY5yhdSkaC6oMKirFZ5/ADAZ7dqEsG6HmqyMQz91k/g5F1a8uGCE8jrIEqyxJkwglVZpKYpYG7QHRizKgp9At2IxeNda7sfpczXUSvwq1uYrQpcEh7UNoJDRWJSOJfRHiX7j2tyoot+bUAnjaPemMRWjy81GEf2gEUbK9nxT3+ZKHEug0L8RQgEWnuzI24TAwd9uflquL+1GKfWJfDuOgLcY31/bxTRzZaDHUFci2837k4dXTvKabjAY//e1azRWJweHirOb/tgmgq+EoMC2s3NBGb6mVrsjoFyeFpvvZcWLZTiauSkQPnOPXeUcJlZt1EhZvGtOpxzqFeNzQjhxOztFl+qE8KFIzUM5UJxAQW4RPTtJstFdsG7t/1xm/qpXFv2fSk0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4tgEjuoXwGHab8HyC7Vb1+yi+lwhXmuaNmm+Blj3appsF723dp0SQQor+4r?=
 =?us-ascii?Q?Tmy8VGzAcsGicrGnWkaLCX1JYufA9iJlDsGq+4HNX8VUxIA6xPaF4sDI9JKB?=
 =?us-ascii?Q?ultJDCdRAgiwnGWTfbT5QlgP8jy7ED9Hn3bh7HyaRVCMzmUoQ5S1gNvTSQEi?=
 =?us-ascii?Q?Ok4IkFtBG72fpotpLyulM+9q7Uk/9s+G0JeFv7PiD3d/fTrvbQGGYlEPCPeF?=
 =?us-ascii?Q?021hQucNHCybixy+5vjHtwM4fDynXjqvix5WNOFojyoXJxt6twZPf1xB0AUv?=
 =?us-ascii?Q?xBhjlrSn/paIgXM3E2idY5+L/Vd9ovrngIWJHrRksYwG/0f3KiQ8cuZtHtV1?=
 =?us-ascii?Q?jpatMnG+S4ZJELkzWWAb4VuSlHHPnjOSHy14LaUB5CFkxwsWghUXJmgE/iGZ?=
 =?us-ascii?Q?u4EaNy0yYlc7Vh9uzb33wZ58kELs994lVanPixJHw45ea0c/Ea2Nlfjd03mF?=
 =?us-ascii?Q?x4iNg/y9/Stu0SpDzkEQxNFq6BAQrQ3kyRWLNzIH4Y+tNGgBLZhsDgfNaHm2?=
 =?us-ascii?Q?ns7Pij9uFT5ozkgfb97Jkn9cqsihJlO8sSDzpAELtF4ASnYvFDSkffkuzvNs?=
 =?us-ascii?Q?9hVXn+eRl8bFpwT4IzFX9RhtJDA0aBUCu8a0pNjOVfC279Tgu3gbWa9ZV0li?=
 =?us-ascii?Q?4Hiw/jv00OXyn5TABx8tkprsKdNQwAhsvqqVHV0SdBqHpzsK8YkvDoB/oOAn?=
 =?us-ascii?Q?fZtYcfCct7jw6+7gXfcwdeLgKaCxt0L2NZ9FhuLKIdK9YIkhnw0S3fNwYpIq?=
 =?us-ascii?Q?koWdrGXm2wZXjZ1cuetwTxHUBv72XoyN7pdQCV6jDHmeGipdlz05qwecBRyl?=
 =?us-ascii?Q?iAx0IklGMPk/vXQXk45n4/fVJPtuuaryjp1inyUelGu2OtjUQjX2cGTlr0kt?=
 =?us-ascii?Q?a3FO5/+PSDm7uAFMU5gErA6yP8jxnKKXLW32OTZsLhN/OOoRYg8m+PJw3pVQ?=
 =?us-ascii?Q?/w3Nd+kLcufhI51cc4T7o/nx72BjORsftQ8wkeNKq9qtB5CRlMCAcB6r2SuO?=
 =?us-ascii?Q?d0+82mdcdbYPg2LMvRF3RzsuSe4/6y7pGFyNuCkvxy7eWGq6deQZKvxm6v7z?=
 =?us-ascii?Q?qAeK1XfGPNMXJRnLqVJwVnsGxNLZHGJcBVEcopt2PqSh1fGditvIeQG/mMZG?=
 =?us-ascii?Q?corN9QNxSkF9oDDaBYUVGhdWm3xQ0veffGWdutIMi44W9YiQoiE0LTmYGHVh?=
 =?us-ascii?Q?ZszxemlMt/+f9WN37WZhAhbiJGDbpEISjSVM6mvXbKJc1Y27+0pjiQIzXq7Y?=
 =?us-ascii?Q?YamKKj0/r8PNyY7mrVFUOAqSk09JS4mkiGQWiaogq7CgJmNIlYc3ejKTz+mG?=
 =?us-ascii?Q?NitZMO+aHV/KWECsKKsrU+0PuNEOSXo0ayxG81NvZeWtitcojkp8x3Gj0Ahg?=
 =?us-ascii?Q?QVounPc2lpmFLh4tRsxPFgMJTBJounWU46wTsxHpHCRYT1094bzt0fqmXDgT?=
 =?us-ascii?Q?iVkrxbNlgpmv4W8noZiNITvyuEvV8+TOn2lPA1WjnHwQpj2AwIBTKAljJA/X?=
 =?us-ascii?Q?Ll1Bsu3xbJoB73OAdmErv5FP3/ofq+1tFcxZbgBbiKNWb6G8o5J7VUN4ZvwO?=
 =?us-ascii?Q?SIqiqwvDxosPz7u1j+fi3sZw0u3wtpyNunUmr7kpM9s5xsRDI4ulK8zdZgkH?=
 =?us-ascii?Q?YY+emVHPFQBZ1SuypaPABBEHek9xwqkpNr2wUtqwpK9vPPN9O2NTaBnHFjCM?=
 =?us-ascii?Q?XmvTHiHBBDG25hVgf/jluWbvCQAINWNiqTEJB8lHbCWUij/jnlcFF82xE8kL?=
 =?us-ascii?Q?/erAag8OiA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hWtlF8y6t0ZvvpEFQ+TsSS0jf0ydA0XTtrSFajC3M9zxg+lJ/P0n/GMSYToFYcAqzPz+eZ1E6xW1C/BVzhNIX/5Dv1Ey7SzYZ2qBPNVflxuqzb18hvKS+v3mLpEbdUd/+Q6GRrNbqZcK6r+HOcmAvpSLNvfZPpiDSQI/WVRHXKxIg695NlPBVs+RP5pdW21Syv7dUpFcc4qcKBc3iIE5V0qwT2Rx+UJqUjPMWvWTAYaMVmDWe5VLsCIn1kMoWbwFoJ8Cbrj9pycbrgWC6c1i564McRjewa81oWZlKAq4PxY8AG2vDFLy2f2Nu3LXeuH0qQrEb3zlhM17sJOJ+HPBQg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0572095-36c1-4ea3-2c76-08de851d8c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 18:38:29.2144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9z3xR8LmYZnznAmuvB5vOpEloHW5i2jOmQe8pkkwGhBYzow7ZutMIN5uFufkBP6oHdXQKIyqd+URJSc2zA/vV2+cmer2Luuoghl3VQHXfCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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

Second question: in this condition would require a new return error from th=
e UMD read() API telling the consumer a catastrophic error happened and the=
 streamer must be closed, right ?=20

Thanks,=20
_Matias

-----Original Message-----
From: Cabral, Matias A=20
Sent: Wednesday, March 18, 2026 9:59 AM
To: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Chegondi, Harish <harish.ch=
egondi@intel.com>
Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel=
.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>
Subject: RE: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU s=
tall registers get reset

Hi Harish,

> return -EBADFD;

Is this making the read() syscall return -EBADFD or setting erno to EBADFD =
?  would like to clearly understand how to detect this condition in the UMD=
.=20

Thanks,
_Matias

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
Sent: Tuesday, March 17, 2026 11:58 PM
To: Chegondi, Harish <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org; Degrood, Felix J <felix.j.degrood@intel=
.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, Joshua Santhos=
h <joshua.santosh.ranjan@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Return EBADFD from read if EU s=
tall registers get reset

On Mon, 16 Mar 2026 10:58:56 -0700, Harish Chegondi wrote:
>
> If a reset (GT or engine) happens during EU stall data sampling, all=20
> the EU stall registers can get reset to 0. This will result in EU=20
> stall data buffers' read and write pointer register values to be out=20
> of sync with the cached values. This will result in read() returning=20
> invalid data. To prevent this, check the value of a EU stall base=20
> register. If it is zero, it indicates a reset may have happened that wipe=
d the register to zero.
> If this happens, return EBADFD from read() upon which the user space=20
> should close the fd and open a new fd for a new EU stall data=20
> collection session.
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
> v2: Move base register check from read to the poll function
>
>  drivers/gpu/drm/xe/xe_eu_stall.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c
> b/drivers/gpu/drm/xe/xe_eu_stall.c
> index c34408cfd292..7e14de73a2c9 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -44,6 +44,7 @@ struct per_xecore_buf {
>  struct xe_eu_stall_data_stream {
>	bool pollin;
>	bool enabled;
> +	bool reset_detected;
>	int wait_num_reports;
>	int sampling_rate_mult;
>	wait_queue_head_t poll_wq;
> @@ -428,6 +429,17 @@ static bool eu_stall_data_buf_poll(struct xe_eu_stal=
l_data_stream *stream)
>			set_bit(xecore, stream->data_drop.mask);
>		xecore_buf->write =3D write_ptr;
>	}
> +	/* If a GT or engine reset happens during EU stall sampling,
> +	 * all EU stall registers get reset to 0 and the cached values of
> +	 * the EU stall data buffers' read pointers are out of sync with
> +	 * the register values. This causes invalid data to be returned
> +	 * from read(). To prevent this, check the value of a EU stall base
> +	 * register. If it is zero, there has been a reset.
> +	 */

As previously discussed, the best way would have been to not have to do thi=
s. We would just plug into the handler for the reset message from GuC, rath=
er than to implement a reset detection here (and in other places such as OA=
). But looks like if we do that, because of the way EUSS registers are rese=
t, we can return bad EUSS data. So looks like there is no way around doing =
this "reset detection" here and a solution with the GuC reset handler would=
 always be racy. Just for the record.

> +	if (unlikely(!xe_gt_mcr_unicast_read_any(gt, XEHPC_EUSTALL_BASE))) {
> +		stream->reset_detected =3D true;
> +		min_data_present =3D true;

I don't believe we need to set 'min_data_present =3D true' if we are settin=
g 'stream->reset_detected =3D true', correct? See if statement at the botto=
m.

Also, since the write pointer itself gets reset during reset, didn't we wan=
t to do this register read only when the write pointer is 0 (to avoid an ex=
tra register read every 5 ms)?

> +	}
>	mutex_unlock(&stream->xecore_buf_lock);
>
>	return min_data_present;
> @@ -554,6 +566,15 @@ static ssize_t xe_eu_stall_stream_read_locked(struct=
 xe_eu_stall_data_stream *st
>		}
>		stream->data_drop.reported_to_user =3D false;
>	}
> +	/* If EU stall registers got reset due to a GT/engine reset,
> +	 * continuing with the read() will return invalid data to
> +	 * the user space. Just return -EBADFD instead.
> +	 */
> +	if (unlikely(stream->reset_detected)) {
> +		xe_gt_dbg(gt, "EU stall base register has been reset\n");
> +		mutex_unlock(&stream->xecore_buf_lock);
> +		return -EBADFD;

The other option is to return -EIO here and implement DRM_XE_OBSERVATION_IO=
CTL_STATUS and return status from that. Let me think some more about this.

> +	}
>
>	for_each_dss_steering(xecore, gt, group, instance) {
>		ret =3D xe_eu_stall_data_buf_read(stream, buf, count, &total_size,  @@
>-692,6 +713,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_d=
ata_stream *stream)
>		xecore_buf->write =3D write_ptr;
>		xecore_buf->read =3D write_ptr;
>	}
> +	stream->reset_detected =3D false;

So after reset, if a stream is disabled and re-enabled, we expect things to=
 work again and EUSS data to be correct (without re-opening a new stream)?

>	stream->data_drop.reported_to_user =3D false;
>	bitmap_zero(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS);
>
> @@ -717,7 +739,7 @@ static void eu_stall_data_buf_poll_work_fn(struct wor=
k_struct *work)
>		container_of(work, typeof(*stream), buf_poll_work.work);
>	struct xe_gt *gt =3D stream->gt;
>
> -	if (eu_stall_data_buf_poll(stream)) {
> +	if (stream->reset_detected || eu_stall_data_buf_poll(stream)) {
>		stream->pollin =3D true;
>		wake_up(&stream->poll_wq);
>	}
> --
> 2.43.0
>
