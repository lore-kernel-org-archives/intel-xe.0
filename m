Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC5ACAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 06:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DD310E67C;
	Wed,  1 Oct 2025 06:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilVo+1M/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BF110E683
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 06:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300803; x=1790836803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yVe4BAhw8Q9R514AW9aaNO8kHGXYkjrwQ5fDE1vRER4=;
 b=ilVo+1M/T9CRqcLcnl6JTV+X0VHXvKVmtM0lS77UOftzuswbCAlr9QEC
 QFlD3ZHKpv/KNlbVWlSDS4eSUNiP1kAApI0dKNVZI5Fdp5SaRDz/Detsu
 9NYZnZZjnNpjsxqWzUCLRJsLhLO63jrL4Sgdvd0KZRMKMIFmm9l4qu27K
 ZSxQ6He6ynLLx3wKCswWA1Elvt4bY0XkuB/5Yz4kNPQAh2VEel7t5pYVA
 xPlhaMSryhp3Ngl0d4AsichuUfPMKSV3zisacVv7LWo6vnFCarBksoX3e
 PvJHm3yAn5obLmJIgS57GLZXTAHhAK/4F0cQnPwrBvMnIzcwwrJNG8QDe Q==;
X-CSE-ConnectionGUID: lr8TRuEzRyOodUa/BM+ArA==
X-CSE-MsgGUID: w3fT8kCSQM2mfEBRu+Nweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72925510"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72925510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:40:03 -0700
X-CSE-ConnectionGUID: iSyNVKfzQpuO3fjOm1EHJA==
X-CSE-MsgGUID: OznzIs/QTsyLFe+0SH+VBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209432744"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:40:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:40:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 23:40:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5ObLnj979q40mnCRhlaH9JSytnxRA44qpnJodkj3BwXQC+0K7U42qceBd65wmZiSgRmvgsf2LwCS1/I/781gvJ5VGeXZecWnBSaRo/H2gC2rpN3VOyA2LqBGk6RygHcRiLRfylMg61KK6nGo87rW9ViHrE4pBHOCmZsGtTLNrH11w2eHQRkjeww9+oFKw1HqmMeYk1sHSPkg7uMaitpNnvkM4wJOpRU9NemRUp+fkuCfuG3Q+DuQfsoC6Myz8ttg935QL8JrUEwjRnVnx15XVt0kaPe/Rv6T9I545L/BD3MNd64/ttvPD2Xntzfi1LK1eMOt3gLOxD8BrxcT8O6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhBSMYzxUJ+AYPDMz1Uth6vHclkxTo6Q7Zu5abaj3iM=;
 b=M8cka+nexC1OrZmSLMAP3ITATGURXUQjCU2NHL7A7ArcQxCmYU7hirgdZQ+h8rvePR0y/dFib4+bG1TSUgObpgkhmNZb7wQF+c6i5lIXOGOT/8Raeu99faupKJ7ySmZJnY1bVESt6NZhXCgZVHDdnvwkA6XLeIc6fh08X6RFSGpxDsnhfTds7XuwrZl7BFaHmd2dfKUpd42QkvS+ctYqy4nxtmFK4Qt/V/YqQVqxxxgWTnqiLwCIjAiFPctSQ1z+e0eK/GaG1lBC4FEy7TMPoNjNuJo6xzbQKET5l1qgz6FvNZt5Y17nPUNcIo5pi+MojO77ZZukf6NM5AhShzVu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB9474.namprd11.prod.outlook.com (2603:10b6:8:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:39:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:39:50 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3 09/23] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Topic: [PATCH v3 09/23] drm/xe: Skip L2 / TDF cache flushes if primary
 GT is disabled
Thread-Index: AQHcMl7yOrL0BxfDdUm+kw3bCxxkCrSs13Rg
Date: Wed, 1 Oct 2025 06:39:49 +0000
Message-ID: <SJ1PR11MB6204333B30039CDC15E9988A81E6A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-34-matthew.d.roper@intel.com>
In-Reply-To: <20250930225618.140071-34-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB9474:EE_
x-ms-office365-filtering-correlation-id: c35a8853-7e8f-49e1-01e9-08de00b55220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EwXPVo2jMEQ0usor8fbJ/Y5XB3JVvL/mRiBBFd26oBqOVW7nmqSUmZhX9ahk?=
 =?us-ascii?Q?nSZgA5J387uT+/2RrwByX2xMB1nz22ATPhwyZqz0S09QXBydr3Al3zawSowb?=
 =?us-ascii?Q?4DgRzALOUm2+18hIsUTBSDBwbpXCr8+iP62SkZ5FKZ2Cldp9g1XyV68q8CMz?=
 =?us-ascii?Q?uPo+ImNdaj+IaTI1mNYu3VgFWOqCuMC/G4DSVeVp7RWHXrTv5uqmLtcRgUPu?=
 =?us-ascii?Q?3NW6WTwcXX7YFZZACNqJghrR7D04qONIOoI8poJzmxp0TgkMKtBYyr+E4ELm?=
 =?us-ascii?Q?q3AGio8HRWaLjz+sNxgrpj8vkEZu3J7WGD62u8ecCvA9QRpGL+CkgbyMtvMc?=
 =?us-ascii?Q?8HZyRAbLw/5y6WoxMHqFlsj9wqtpdOmv7gzyELPQADf6ZcPYfNfYLQDrApds?=
 =?us-ascii?Q?BzLlOpnox29wsMK3M23OFsAYlCJl9JSW5c/+PVb6ry7bWtSBjNYCNaJrm3CP?=
 =?us-ascii?Q?nxF5j049Aq4Gf4RVeHprYyXghBk1vH8Grwu20mTASfltvyHTf8ueXFqbEFU/?=
 =?us-ascii?Q?3MlDwYcUMdfwHVnojKoCAK9bUjWcQz6AqoAZDGlTurZ/MJ91OsnXN12MtFx/?=
 =?us-ascii?Q?F7FkDga+OpJe/LRCabgLu2CJyy3IBLsl3BKr+sLMIBMX8bYYQ/ldvSw/qyy/?=
 =?us-ascii?Q?zE8wLQ4qiAxsa42pmqNazJqKHAggTCHCV7gi2XxwZqovewMn1WInx7tme4UG?=
 =?us-ascii?Q?9ycGdORhBwATqHQgY3SICIxOIy12cU0WmO7QvaziwelZdzdH4ZTE/XPkGqi7?=
 =?us-ascii?Q?YxEQiXGhbtfcUKgAFupBhyWT+6zROmrOGd5fuxAh3S3xMDaE462zZzIL93KG?=
 =?us-ascii?Q?6h6gbivgpk7Jyb5fKAy1o2Pq8NQKAEZRPeje5yOcNlKVZrkHn7YdX0B3iCGC?=
 =?us-ascii?Q?4Lr/9m/hVfzwMbdOFgEDmAyWpiNpP4+cfpsLPzwEX6bIhpvPC5m/zqEkrDkg?=
 =?us-ascii?Q?sWMyvScWx5bGqx/CxTRNXB24a5SqwBrJoLrIUtPb6ZT6jM5+6zKKxRCm9uIf?=
 =?us-ascii?Q?pNqAHOh/SNHWe1RlxAWTgW9GrwIt2EtWz3xpAfDZKn3lC5C4sz+4YvTUF+9P?=
 =?us-ascii?Q?6UWvfJvFBzi3eWui0vEl9rimv2IIH47uu5yz/kNkDGe3TowOCrlxQ6vLzmb5?=
 =?us-ascii?Q?+czI4Za3YF+NnE7VYNGEFUGTYGwlGkZ+nOyi/BlN0Ak1fceQl+DB/fl/NMjy?=
 =?us-ascii?Q?oVgOOT/l1dd0lt0WSiVljGbEjwP6k0b+yBCNk4HzIuY5TNxzI3z3RdQDMLcN?=
 =?us-ascii?Q?17Cnd9R9N2TsNpVNVSlAvP7iskSCmkajAg4VFo7aSoJYNV9i5yA49kbfHNBC?=
 =?us-ascii?Q?trYp7bUzw6MwSqwFLQHfuAxUqV8v31V/AxXQb5Jx3xm5L2a2ZZqTBNMqfn1n?=
 =?us-ascii?Q?wK8rzuMnQF/SZ6fk7aBJ1uoJa3VDnGyvoiJ24qpQVJ4WQk6VevQZrnforuex?=
 =?us-ascii?Q?bhWFv4L7dfk/Da8SZSmAyOFXxbYMjbE7wmwr4vjsBzuSAr/QUhUW7jGFyHN5?=
 =?us-ascii?Q?zIOZIRFRXdiZGr47cUpQlwy0SfwdBBQjKgnU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A2rDEd/Mw567sUiKhaX3fs1nNMqAeKLizFjixmnU/2hEAsxGDF72zLUcpA0c?=
 =?us-ascii?Q?qTdibIWmaxul42MitoCv6VtDguQYmdR3ZE4CY8d/PmEEGAEL/RPCLhPIYhvM?=
 =?us-ascii?Q?cbXFJjIn/BQSMWz2keyS+nADl/Uk6heBFPpnWQOGqJRRnScVP3FSW0i2z8WE?=
 =?us-ascii?Q?M/TN9/O4ZdRgp/4VOavwjGT7RcOOyWHqxJBAzPTaUhD0dVu0Hbuf/x2mcQlo?=
 =?us-ascii?Q?lXhWV7jZ4hxgSB14brhGnFEGs3IEBHVX4Yj6TgkbfVgDrEaT+dsOJ5hmblYh?=
 =?us-ascii?Q?OQpiUcljeVMYeoOtbdVZecULWVHA6iq6vS3+DgpJ9FpeIlru4RLt6eRz/kaC?=
 =?us-ascii?Q?V334hyBDIYBjwGOchdJ8no4ShaOLmMOUDpLhE9blM4HktXKsv85T9fqat+dK?=
 =?us-ascii?Q?KdjNRIIOx+Ofxe2pUGOfGvSnDhmYuzYklgcKornjhhQzlHz9Sis9yO1Mbbc3?=
 =?us-ascii?Q?qobm7+yoPXLTsAHanR61EFkCOJSpohFmikS+u2bqZmx8KvxPptxK5u8z77e0?=
 =?us-ascii?Q?AzsA0uKtbxHKiN9xmvpyaEUVXUA0yogIfkpZ/4MwXtOpVELpmtAWNMoit1jX?=
 =?us-ascii?Q?X+ml6UMMMHGFxOaU3tpjKGVXgdPl1jUQAFoqnBUIV7ZMXGk0L1m7TAe4oAbr?=
 =?us-ascii?Q?0jv+NVW5kkB6S0KHloBjxX052ZqMrwecmT8hEkNk0mfrJRrC0aDH4gsSW28S?=
 =?us-ascii?Q?RsNXpaLmqwS+srG0OZ4bIfsdd/tg/OtiSGZ0JwqW1Ch3RWA2gSPOIYPf97uR?=
 =?us-ascii?Q?Xxcj30RUj51kOrrFZij+eDAbb120fr1D0U1vQdwL8K6XHOAsuCOTr7D9UYdl?=
 =?us-ascii?Q?ma0xse1Jor2oOpKjwQwekB+VFXMXLqqZSm8JftB1IdhdMONMnwBI3umOOaw/?=
 =?us-ascii?Q?8dta9bAqX0+0Ip1qfnoEFn2gwOtEcZByQaSO1HYzlMwpan9Z3CT+J4TVItL0?=
 =?us-ascii?Q?xd/pnkcHTStCJD6oyIocQuj+KwN4ZtiC4N7nIAVJGZ+d6BsF5f0tfRNEC29g?=
 =?us-ascii?Q?hN4uYDdLTBGpzgrYZ22rmIx3i8GR3yINyNx2JVk6w9GSXTb+J8zt4ac3qXsw?=
 =?us-ascii?Q?fNuh+E/n45BYq4FNlMkFMw0bfQIXIf7/u3BH/SftSasHIh+vx7HUPj2GOEpe?=
 =?us-ascii?Q?bMaB/Mhez5sUkXBpdJW8vLGkY7AYVOWma1DLbYRFwKieGwZj/0Wix0+ogZkx?=
 =?us-ascii?Q?E9YC1VhARR67SDBrMlYwLL/l3SGIRwAKITJeoMfOMTZ4642W1+geyIEmT/c2?=
 =?us-ascii?Q?Hn783OaEGy7sTzWhDJluX8ReTzrGeHFu6T27miIqZRt05ZVW0Kw3rg6b3fXB?=
 =?us-ascii?Q?oTLrHweuJYNWImty+vwCUu40RWW+h792QP1Wp7RLLFPaSyU57n365tKaI/Wl?=
 =?us-ascii?Q?I8CsqYBQoFDV9Rif+lmTuuY79J0Vjkq+lltvnPYSj3MH4R72fI/7pzwd6FXN?=
 =?us-ascii?Q?/OnkIi+xOZuAdsjAyx9fk5zRveE3OOuG1xIvUAvjq87p0xo5Ilkb7ZB2yqaJ?=
 =?us-ascii?Q?S2mWXygPPwZtle6KioBPM53Z9L/X3WTXlqc4oNzvecebW/wTbxR6d1oI7N0M?=
 =?us-ascii?Q?Pm/9lcBPMDUzDV0pn0FxGwcmmNDRqPKpHWBHQ8q1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35a8853-7e8f-49e1-01e9-08de00b55220
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 06:39:49.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhOOfFLgXjaiNm2hXbLOnO4NijEjCqMSEjT3mUgXOT391s3bZPr3sq1XEgqcS2MVcnqhbKPWeVnelePRc6C4lmjpHrUChXf0xcDBZ3NWL1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9474
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt
> Roper
> Sent: 01 October 2025 04:26
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: [PATCH v3 09/23] drm/xe: Skip L2 / TDF cache flushes if primary =
GT is
> disabled
>=20
> If the primary GT is disabled via configfs, GT-side L2 and TD cache flush=
es are
> unnecessary since nothing is using/filling these caches.
>=20
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 386940323630..d42d03b8ab3a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1062,6 +1062,8 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	unsigned int fw_ref;
>=20
>  	gt =3D xe_root_mmio_gt(xe);
> +	if (!gt)
> +		return;
>=20
>  	if (!XE_GT_WA(gt, 16023588340))
>  		return;
> @@ -1107,6 +1109,9 @@ void xe_device_td_flush(struct xe_device *xe)
>  		return;
>=20
>  	root_gt =3D xe_root_mmio_gt(xe);
> +	if (!root_gt)
> +		return;
> +

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>  	if (XE_GT_WA(root_gt, 16023588340)) {
>  		/* A transient flush is not sufficient: flush the L2 */
>  		xe_device_l2_flush(xe);
> --
> 2.51.0

