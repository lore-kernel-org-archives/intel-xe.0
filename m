Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCFDD41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 05:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A03610E143;
	Mon, 15 Dec 2025 05:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lI7OjPMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFD610E143
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 05:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765776732; x=1797312732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8QWXwbp+Cvbq+4fNgr6OvyJsngwP4HXJ/hCJcoPc1Qs=;
 b=lI7OjPMV1T4K9RowwtH9aR2LFoOANzkbWaTQBtxIWDbUjLJP3HPERnE8
 L2nXDROTl2gwOsjh3SuOacMSSPcZuhKzzwrvKqnjlv8PQY2YinQ+KH3wv
 E3dpHzSmzGa++BzEP8BQ7DPm/cn1+kuHIjOEFGdUTPHC7ucUuD/oQbFCt
 NeWQuGetSBVmNC1cT5u4DxRmktSIo809l7DKYNwbJ9RYUCqLyVdJi/dL/
 ClRXSbivadWWikmOvZA7Tf+FKzHS3lXCC53xhSlF1osODANx6ChYMBlCl
 B2+eJ+u7VaW7kVjvHb2o9mo4FZRLFI0Hw+6ezVTF+C4NDAL6CP+/d+/1V Q==;
X-CSE-ConnectionGUID: 6/1fJjgjRHKInrkdaqFiGA==
X-CSE-MsgGUID: xUGuMEaxSdWs53IrSA0gTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67611363"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67611363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 21:32:11 -0800
X-CSE-ConnectionGUID: FifKhHFTSdarD87sFM5XrQ==
X-CSE-MsgGUID: TUvwclddTD6HWesns33EvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="228284991"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2025 21:32:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 21:32:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 14 Dec 2025 21:32:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 14 Dec 2025 21:32:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7T0RaQ2/6x4AzR5+XcHphxyKwirobKi42nm9rawNN0CvJqPLCctnaQ1l96Vzf7JwMYrl4edAPiAyeWg7UopfPzowH4BFweFf4dDZ3gTtbB9h0R11pgRLwxv0lzUrs9O2pSY+8xxUAeQtH41undVymCGghPdpU8J+I/NxKr8yrSJB+JfO+W97Crujceas8yS6LRKnxpqRxus+GiMGwXOyGK+DC3ZYyeUybi/oa7BiDdymEy6SSuxr4O//ZkE683YYQg3H4rvvFpw+WMV8hKBm9EtZV8w8TMaeScYoQLAXzUuUcsWkoeLdbWQlg7cZ9Or+NfAX+uHCvbpkiLpg8+Waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4Tjc7i6CtvMMhqY0UuCDKFJGTmQYkJ5WDsbBZvvkEA=;
 b=qYMsx2F5A+w3flrKXtsoTmrEBZMTPGQ91IPOzIUU/4mIDO5bq5nwNsnLHJqMkjy2T0HOUWRJFc2Ex3JPa+LxN8YKHHSM+QtVxGJVMXPc4CUj7r6/hFf72rPmK/GmTpJHMIvDCMqTgByJNZnnF08zt3VyYfjr9Goip+6BOinuTh69ul+EAx8OcpYFtnEKO3OhpP06nscYgq3O/MjgSrfv2qQqbXneTSvjWRKdRxk4BuUfLaYP89xQuyuYuHxYSi2KSpQcX7ns0//lcHGeU/1FkSRi0DxqseM/SMXj84RSlcwhnR3EEKBYlyIt3sJyPrx//ltcV+6j6eQGwrt0WgeAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 05:32:07 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 05:31:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
Subject: RE: [PATCH, v2] drm/xe: Increase TDF timeout
Thread-Topic: [PATCH, v2] drm/xe: Increase TDF timeout
Thread-Index: AQHcauRGzYMtQJC4ykCWMAz7Kg0BVrUiMlPw
Date: Mon, 15 Dec 2025 05:31:53 +0000
Message-ID: <SJ1PR11MB6204BB316D95F2CF0DAD566C81ADA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <0201b1d6ec64d3651fcbff1ea21026efa915126a.1765487866.git.jagmeet.randhawa@intel.com>
In-Reply-To: <0201b1d6ec64d3651fcbff1ea21026efa915126a.1765487866.git.jagmeet.randhawa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB7737:EE_
x-ms-office365-filtering-correlation-id: 09de4fd4-615c-4068-8f57-08de3b9b4150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?f0i/DMo9L88tELU5Ns8GMPt0QaBkLOoAmD6vLiyh2rnRyI6sAk0XYMP89kZv?=
 =?us-ascii?Q?/dlMVYmFPQoaGo+gGJhBjKPp4gKaBo3AqG4d91GyHFpqr49DHmJTMAJIJgJs?=
 =?us-ascii?Q?KOQR5C+zCBthDK4n56opJXE8abynRckszEj2sbLRmH5cuCl+rvxTqgzyLfJw?=
 =?us-ascii?Q?0P7ueEe6hy3GGbccC+qCmD6utZdmKC9u4TibpBDptDyxnbcbBPi7+Rsq700y?=
 =?us-ascii?Q?rzgDL3zP5xla9vm2ub0ZcDRfcQbSfSJ+irFqCaQjDw35rTOzX60sDxc7ydNx?=
 =?us-ascii?Q?T1FBJJ3M80XN7Jjtfo9vc3sIECjDRENK7D7+WHOVJGybnqS+yDfZ7ZLa5txx?=
 =?us-ascii?Q?yi86QXedWzDfBtuciAGEvRyebS94UdYpUJLCSORlswpxn/rd5PSuifieyQ9c?=
 =?us-ascii?Q?Fsc2hTRjdgELpAPfZyekHX7biFRDwho1bqyeE8rvp1q6HnyZb+8vwo8lWfkI?=
 =?us-ascii?Q?1iEzogtSM56dE75U2YW3Afu0BfU9PqRD0njbTh8sSzGzd4bbh2AyetVzjok+?=
 =?us-ascii?Q?QdkSlxwGzZvJDxQ6zD7dd3PPr0uZRJ+VI0gCOnzsCcLIA1YYrS+c9yWmiZ+Q?=
 =?us-ascii?Q?tHYeCDMHWGE3+lGwxf1KFEMyliraxFcv9S3wiBewI8TVznmxn+pHmc005u4f?=
 =?us-ascii?Q?euWQbeDABIrqPRw/qU2q1IuHOImUdT3tBFP4+aUc0cpLMeHA9P4YfurRFq7k?=
 =?us-ascii?Q?Z0r6YvIomWXUtRGJYgcducrjkl0qeDaPTavox92eD5ErpstFbA7ncmCuAHP1?=
 =?us-ascii?Q?MhOxopW7mgl9D0pXV0i8omUbUIUCXKMvDQyOOv5aJq22OP7w7q4cJ8QqZgQV?=
 =?us-ascii?Q?uq4l1Oqma2xX7zw6i+suipUVWXWUVKsK6D4rGJYk77HPSxPnDynUU0xTrU74?=
 =?us-ascii?Q?D8nS8T1N+DYC8wQ2O3StBnyb3Pk5fB8YLngofozxosPB/W2ytyovvj+V0wQW?=
 =?us-ascii?Q?aLlFw5zmg0ivQwLCeT5loTu7reHfl/HXD8cMuFnKezk5C9x5DAPcyUem8+sj?=
 =?us-ascii?Q?BMTPyRX/QdHXfChJ49lfAttE5698a+5Hz+U/UFFJ1NqzPEGanhLCfnfQi/nA?=
 =?us-ascii?Q?haFnpVN1bR/I/d4CQrYqI/jhbpvXBVNs8oyWaqPAc+7Ycoa9OhrfsR2rv+qg?=
 =?us-ascii?Q?lexGrqohn4MEfL0U/zyYlsGRVaRhksyif/uxs4KA8/zVgBPaSpw7Nvw3veiY?=
 =?us-ascii?Q?ByHlE3Y0IUqCQpMngI9CVwadXPuA1ml7aZgCSpQ0BZRn4paFE5LRJfk5KA8/?=
 =?us-ascii?Q?BsdC1Ws+M9MBrhkhvCMbpI3AdBPuTtWiwzaCGmcw6QdG4OK9B0ujA56XZeCH?=
 =?us-ascii?Q?MOI6saYVT3W0wVuGyN6Fdp/yBBQcfn00z8BhF3+iVbXyFbTIQ/+nw75YJjeN?=
 =?us-ascii?Q?k7JFGGtPC7XdFXLlBJKGUemtXIOwfs+feoEnjwjKe2kW1SwaWdQh1f6xnDvC?=
 =?us-ascii?Q?Qe0roENyWT4Uw/aQbN+9/7YWLln0T4ANDACYnTzTMwUCJAdzDWwUHD2t0w/6?=
 =?us-ascii?Q?PkBfZM9xYSYjc2tAaADKMhs6FRbwxMWeZx85?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/gYHSvsTtOh8BvsXc0M6LkP3C5P/6JTMHNyA99nLlvaLXb+g2cYGRX0QaBSc?=
 =?us-ascii?Q?6tYFbogeUVJlFkIbU++iYLva3MfyXYJTkr4YzbRAG5AzhzjFKlqJ1d315bgP?=
 =?us-ascii?Q?wCG6HMiR7+MtmsqiHChBz1RsasLkqRPwW4xfOrLuuyE1K59w8GRnWHzdl6xP?=
 =?us-ascii?Q?saTVABDVl1UKXYuXtwX7p7iQFd4U93g7n5l30oSHQYOsfxHE3HHQmjrgdhOd?=
 =?us-ascii?Q?y1ONc2lLEnK9R31JJsE6tVPBbSwEu6ZMTWcIqQhCIYEw8VLmNAjbaB/bATCu?=
 =?us-ascii?Q?D/h8rfD00upAWM2W/2FKvLZSqsB+rv2dvfi5uw79eW3KUSoUmtAKW2syWEdO?=
 =?us-ascii?Q?v2MH9onK9f3WEXSpdf67B8zrwsDh50NHRpu9pfzuzJta2gbXR+7WDIdn1aBN?=
 =?us-ascii?Q?VOtIP+ghcIA7ZSncM1ndUxJxZXFEKeJbMgBXRBobDv6zJvkFanSbR5zOEGq8?=
 =?us-ascii?Q?sv3FFi3foIHn1sZSWaOcGWJ9NuXXtX8JtOsRu8qXoEsofDtMZs7Z+G2treC9?=
 =?us-ascii?Q?6BQvRzpmSixwU8LMvpuZawCDMossxaysLKAVW9l4KF9sNa+86yDiz7H7KypB?=
 =?us-ascii?Q?0kpqUaEb0RYkaq0lzFF5w6HyR1q/pAct+iATtKLOtNa39nQUrOZxjgodVCGD?=
 =?us-ascii?Q?9PmkMEfYYCr6TAnuQJAZshiXpsAT+o2Dko3Js4/WPyz6Q0WMVid8FA8cASEI?=
 =?us-ascii?Q?xVsV9EnitFSnjLOf96g0s7rLAZC70sdpexo7AePmlZAlECTYh08JxedSJSpw?=
 =?us-ascii?Q?2dQKh8/XlAgC6u6OIru73n6W7PJUNGWJjXz0q/+/hXHahPs3hoAopzE+gXJM?=
 =?us-ascii?Q?aotvlUQ6k0DaTABV2TF5sTMwHcbFr4wiPEFohBIitXNJ+HjjZfMqGDnqyWsz?=
 =?us-ascii?Q?UeDsSA8s2CfSYAcRl4amm74o7HlGhqJVLabtUcyysuRM9Ev0buDIfMeIrYf6?=
 =?us-ascii?Q?+6P1cjU81bzdSFABZc9sNs2iC3jxj9UHkAdqBfXPpSeAjOFEsZNA58van+zP?=
 =?us-ascii?Q?3+T2t8Z/VTziVcy6TPFdfaQvqa4aGhZJ1CO1Fn5MXEhAZezGqQ2aqPNLtqFd?=
 =?us-ascii?Q?3YMoDyJ6NvTGWFXp301ffetBcOZyRrnTJA1WO31JeN3bYVbnG4FlaIh3c8kz?=
 =?us-ascii?Q?K8vaM+KyyRslNkUZJ6nZOZ4n9moVlFBVdPMfZ0Mk568QG9KIcCEyBvLMyOfN?=
 =?us-ascii?Q?FY2fOQNKC3ck0qzfEKTvK/cuF5Ta4tF8+ArBOstM6/DFbTtLANPUdbbh5Nl5?=
 =?us-ascii?Q?jDnrW3DggtN9qT90gCj4GWXohRBeiCF6xKIyprArUR7EmyrSIo3TlWzimY+A?=
 =?us-ascii?Q?0YN6w3qjIB/EUxYY/iqbAVvjHQj+J5Tdqiie2et5Pt9X4fqnF8mCc7PdDSoR?=
 =?us-ascii?Q?+c2vigXfIu8CDgZ8msj1CsJ1sTada5VOLicFxRr8d/LPQ0obaXmJIL5we0tU?=
 =?us-ascii?Q?9f+/ERhTVdtoV2HppL+0m8/HZMZTGhA9OKUCQ6s2mwROYXmE7yyixCuYOllm?=
 =?us-ascii?Q?1P35VNBSAXozTFXEOnmOZE22dbm/xS/7NtmN6vjmNV31Kjdz0HoUfR2WeoZo?=
 =?us-ascii?Q?8jWA+ysa5EB1duaFBd8AyhgBqT5jcV7NWkmmcQED?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09de4fd4-615c-4068-8f57-08de3b9b4150
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 05:31:53.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1i6wyDBL75hAHChXwOw7rSP+L6ZuJiVeymtRh8kNh3C5KcnxUGU4HMHpTD5N5Z9uNUEQW7eXGyFwuzDKeApRideJzqKzTeQjSvMmob5vaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jagm=
eet
> Randhawa
> Sent: 12 December 2025 02:52
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>; Randhawa, Jagmeet
> <jagmeet.randhawa@intel.com>
> Subject: [PATCH, v2] drm/xe: Increase TDF timeout
>=20
> There are some corner cases where flushing transient data may take slight=
ly
> longer than the 150us timeout we currently allow.  Update the driver to u=
se a
> 300us timeout instead based on the latest guidance from the hardware team=
.
> An update to the bspec to formally document this is expected to arrive so=
on.

Should not we wait for official update?

Tejas
>=20
> Fixes: c01c6066e6fa ("drm/xe/device: implement transient flush")
>=20
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 1197f914ef77..db2f04e1e60e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
>  		 * transient and need to be flushed..
>  		 */
>  		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL,
> TRANSIENT_FLUSH_REQUEST, 0,
> -				   150, NULL, false))
> +				   300, NULL, false))
>  			xe_gt_err_once(gt, "TD flush timeout\n");
>  	}
>  }
> --
> 2.52.0

