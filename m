Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91BCCD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6DE10E3B7;
	Mon, 25 May 2026 18:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCRi59GG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4F810E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779734890; x=1811270890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=QhOpzqZJUoZqikxmexsiRl110ViIcVa3My5QT2A9wdo=;
 b=eCRi59GGHkNw8xj+01pTMKVNbv0Xy7+XOmnWS7EZMfFUsLWWHSFfZgiJ
 RkYDBoGKd+BRxlKf7cbUtMiS77k5I8spVBMJWa+TcuAQ8Hudj+EFIDVfU
 6M/35akmQUXRX7b3nAcphthjZQ2+8WKlRe0q7M0XE7aGW5GD8sfyqbnaE
 mSkV1zhHhCRU7YLtcDiXU8/kQBBiXM4qMzYgIDx1PzAR1LNwFKYy5Xc6H
 uZ9IXsN1w2uLbGE5RcJhUp1mQyGPwDw6yFdZkD//fU9+3NFHJuuWwbYgl
 aRyfdf3C1yRZ0+Xo173Wz5CAWaFce2uTppMhRaZF5vbnRdHVi2qAFnkI7 A==;
X-CSE-ConnectionGUID: GvXVA44uTo2gxZJoceUq9A==
X-CSE-MsgGUID: fWSCZOI3Sb61Wvz+OfRR5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80461109"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80461109"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:48:10 -0700
X-CSE-ConnectionGUID: Ip6cueapRdqpyw5yjf4DNQ==
X-CSE-MsgGUID: d2j6Gf9RSRuKrM9oofA9Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="245961695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:48:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:48:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:48:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj34kqm/bV12sEiLL85zaAWvFc1cCchxamni/WYrvtdGvMqzdDB3Q/YUiircqHj9VdtFrRxEHL930fK1X8cUP1FSuQvq+AMxWtq2m/mq3mdydgien3/xKjXUg0lhELH0rTBC9jtpO7FDPAs9tHlVOd2/PlLMtBodFIiOIKTnqJRPSuQN8CXgi7yNI+QvjYCLtM2T1Z81WepnmvzDKvzUSpYC/C1tT2VDowOPtOxCzKJWxZmJzYNeEzz6qTaORIZf1qqEVVG2E4CHUBsLcyGjirKd5MZUwC0374YPItkjeOuuj8A7Ckw9TSKju/am1dVclpaEg1ZR/s3hJJ79J45dGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWeb8m+OEgfbPal4nZaDgr2x9p8yT/YE2Lktj2GwkGY=;
 b=KKxpmmOR+6FaB/oYhp+Xdoq3HsPUZKdRdwfrUFitEYYcSmTAuNyaBucELH4To5sHOtzWVh8TBhoJQe8344vaLDMCdm7wKyToHIBrPtJKo7OEnC5RAmrOY7iw2NhFDee/Fo+jqkdtrndHYusZokWkc62vuqpJ2VEimPOu6T83i9UK8uYCnDvm9gBalQjQn3xwHlXgk3mlctX7AQb+ZFTGtzPv7t9COxXGWDQx3oQSEm5PeJlwJBbgKnQr9iq84UGNHsEiNfh5SiuwCNS+67gfGzo8T44tU8P1fo1nfzziCMfMOfLpcY99aOlwJW8nkA/qIRgjec4f+koT5CaSE8YnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:48:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 18:48:01 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe/pm: Do early initialization in init_early()
In-Reply-To: <20260525160529.15890-7-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-7-michal.wajdeczko@intel.com>
Date: Mon, 25 May 2026 15:47:56 -0300
Message-ID: <87zf1ngwbn.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 7037bab7-f332-4ad4-b93c-08deba8e256f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AS/kS2ODokOgXFpNO29lEzyvDkkt/my6oxpIYIYbTZJRZSqCELhThuYBFG2n5AciAmq0aouzMCmOtZXRXQrg9Ca/gfR/pgfO+WTPzqEZvX9xZOY8g5rTezsGvsrVOgjqspL0wDxLeOGk5D6T1aHJ6Yrx0kXbBnSXLkgjHKYbcgDNscTUbzRPVDoGdvNYlgVWqQ2P+iz9TC+gaWrPg+7dlgf6jGH50XSkPTZB6k58bOqFK08O6+HpfQP1369hnwag4Vu77wAXBNrvSqUjLqQ/xE+VeYoxDn3Bk4pPzxOX7qwPhgDzaHiGJtGx8R60clKdCdchKx5gnwm3kBF1xQdHG4cE7AlCTQtM2kPp7+RQwelE9wqOKlcGwIUwJ8NpiPFQrEbdi1mjYmFJKJhMZStmSQ+J9Hdh39Nx5debtINmqXCA0GyEjhMmiWyZKkgV8fYArtwNoGHm02S6Oq0ZqvHuw89up5VFoB6ydBHL/XySv3p2wDpE2SVmkQiIhfYUdN9cfqcbqQwqko2Xgl50a1e1nm4zgEc/Vi6yi1YoyBqwVMJywzWgBUW+CPqW2r6p/aWczz5xru9A7gqEMI9iNfqn0l0dYEc9xs00bsclv0lz1LVhS604sslBPhXjOoed0a7yeXU5G3mRMIc81mc9LoxrPMbyETvZl3TQOE+3VsDWIFtbzaLIpdQ4Ez3yMWw+GtUA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(6133799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTF2VFU1UVp4QjRyd0dPbFEzWDduMHVGNGZEcXk2Mmc5Uk16NnZ5ajBwdGRz?=
 =?utf-8?B?YmxKTUVFdUJzVVZDdURMVE1JRWdIUDNvbGxuU2tTanRuYnpBNW54Q0FBdFla?=
 =?utf-8?B?Q2pGak50RTNFVm5VdGhHRTlCalZwWmRSa3NJVXQ5c2lQWXM5RFlTcE5FQ0hM?=
 =?utf-8?B?RW95dDMzcEV6S2FlZTFVNG9iejdQUnZGNmhjN3JlSFV5cnN2ak15TWlhY05z?=
 =?utf-8?B?RGp6NWhJZFljSU5HNXVPcFNzWVRZUnAxTVE2ZVM0SnlKT0xWRURJSHVvdnZo?=
 =?utf-8?B?dDBBNlcyTFFtQmFnZ0xnVnV5d3hvVDlQVER5ZFNUYjNKeUx5bVJuS1c5QU0y?=
 =?utf-8?B?aTQ0WFoyMTJzZ3BsL050NjEybUNSajVXWjBRMFc3cm83cEZ2eWZ4QUFnZjc3?=
 =?utf-8?B?dzNLamRRc3NMVWhJeEZVaUNLbnJldFhFd05mOUZLVWhLeE8vOTBLbXlsRjIr?=
 =?utf-8?B?amgxR3pDWHZyNHY4NXgreThRSHdjdTZDbHRPVFBLbXpTRnQvTmpSVkh6d2JT?=
 =?utf-8?B?SmRSUmpMSzI1NTJxbW1uUVRTOVJLd3hrSDdoRTE5NzhFRExzSks5THhLY0xm?=
 =?utf-8?B?MFFTRWhrMEk2cWtNM1JlaWNUU2hCcTVFSzc3QndWeWptRzgvRVRFc3VZRXZD?=
 =?utf-8?B?NFlyN1o0TDZ0M2FLWkFReWpiQXZzOERsZXUxMFlIOEQzaWI3c3Rlc1dxdVcw?=
 =?utf-8?B?TXdqeGZQNEpMVVpRNlN0OG5GY3pPalNnL1NvUFN5UXZpOHQ4NE1XaEhleWFU?=
 =?utf-8?B?YlhtejBraGNiZGo5Nk5vOXVLUVhQOHNjazhrSjJHN3VGVUQxazdEOWs4RTE3?=
 =?utf-8?B?M3I1TmpMemRvaWRzb2hudm1DSHRPb3hsMDFXNmdQZ2xqS3hxSkxSZTJmLzR3?=
 =?utf-8?B?em00MVdsZnMzWTI5MlZoZFRwVWNyMDR5bUthUHFnZXNLZmw2ZnJlR0MxME14?=
 =?utf-8?B?OEFRV3MxN0VsazJNd0VtUjlTQlp6Wjh0V2lRVnlubnEvR0lyOTRLWlNYeTY2?=
 =?utf-8?B?ZjluZ2pmYlI2RUlERTcvUnpzOFVBZ0l0bEZOcmFxY0lSVm5KL3htbU9hMGtF?=
 =?utf-8?B?UzdLbTZ1SytybXFCZHU3c2RhUzR5cFg2Q2FZdkVsc1c4K0JvZkovcDZEVXpy?=
 =?utf-8?B?cVlsTDNSSE9oczFsMmJGYk5taDIrTi9YR2t6WWtneVdKYWxYZHgwZTBFREZ4?=
 =?utf-8?B?YW5RR3d1Qkg5clRGM2t6NWZnMGoxb0dVRy9hQ2ptMmhDd3JnYk90QThydUFO?=
 =?utf-8?B?aEV1WDBtOWpaZS9jUHZJSkpzbE5DQko3dUMwaVZXa25haDh3MUpoTjF0Nkht?=
 =?utf-8?B?RmdKaFVOajcrTjd4UXNiYWpFMGd0ZEJyZmVNbjFFclJ5Y1cxcGdGTFNGaVJs?=
 =?utf-8?B?aXo1a09qbTRsZjlyNlUzWG1HLy9acDYxUTdpQ0FoY1gyMW1VUmRkQnhJWk13?=
 =?utf-8?B?c2xoZ24valRHVm85WGREOHZjVEF4UEZVRmxNZVUzQVBRdEo1c1ZzTm1Oc0Rv?=
 =?utf-8?B?WnVJUWpCeXVNV1ZaUFlqQUtNWGJmaDRMaUtzaG5USjFtV0xOL2xpTkFWYy8z?=
 =?utf-8?B?OHV0Z2I1RmJyLzBDd1VQVk1aQWlPbUo3MnRucFVQTnRnbUhpcEdNY0MzU2JJ?=
 =?utf-8?B?WGNYVUYvWVBLeXNlSkxZUWthc3lSYktUUFJ0SkFJY2NGQ3dkS3hORElsRUQ1?=
 =?utf-8?B?MFlyWDQ3UXdOQzdjY2V5Z0R1MERJMGFrb3lEeCtPWjNNK09KV0VvUzhnWURC?=
 =?utf-8?B?bW9EMzBMdnc0MEJkQzMvTVVpRnRmeTFGOUJxOU9OYk8xLytDRTFrUU5neTY3?=
 =?utf-8?B?KytlNzkvay9iMHRVY1pGSXhJL01GeXg0anpjWEpGaUdsOUhJeEdNZkZ2dWpM?=
 =?utf-8?B?bWtRZDVuQnp0MGE3a3NzckhjcWNkU1dhTCtiL0pnL09RMDVVWUdHU0ZtMWpr?=
 =?utf-8?B?ZEQrMmlKS1ZzRTRWeXN2RHJtU2tlbEJsc0pTUGk3eVBoRWtORVFmbHFWSEgz?=
 =?utf-8?B?SGdWUnh5MGxlc2xzV2hFMnM5d3FncGVtVUdKT3hqNkN5ZEVvY0JJQStEUWdQ?=
 =?utf-8?B?Qkh5c21KWjVmdWFvbXdicFpwTy9mQkJrVFQyRGtjeEUxdGZTc1YrK1cwbGg0?=
 =?utf-8?B?UU9yZVQyZ3BLVDhyNEpVMlhJa2g1ek9VL3JwTXdVZEE5d2NaaG1pL1pSdSto?=
 =?utf-8?B?RVNmKzVWQ09nREZwOVlQemYzd0szRThUb3NHemRYZ0JxOEw2V3BlOXZWNTIx?=
 =?utf-8?B?Zk9PS08zbGo2V0pXTG00L3BvTkFQellqY21xV01LbVgvZnVmaU5reWxvQnJO?=
 =?utf-8?B?NmM2UXROc2JvU0F0Y1NqN2oxV3MrWFgxK0kyckZpL05nM0Q4aFU4dz09?=
X-Exchange-RoutingPolicyChecked: mn+SfFzNSXR//YiJFizeEQXBepe5wlZPaWq+cgcd1I3gbfE5x5BMFrc5d3pII7KPVeFfSlN2zJT9E5RUTjL8dTLJaiRxrNKAEc700150TGZrLhevQJOMkw7ot0M1LuQzO8T10bZ1rwdw9uRB4NJ1EdclgixTafF8qgLaOXPOevvUys2O2/5i6ekao6YIbPFhrBlc1urSZBEHFngEu1ZH8MGJ98/TtHMwUwhlmRu9WfO27/55kFvx0NT09z5FRtGjtNQruBuc/omjiGky2ihq+XIG2AsuCWBYD0gDXWrGEdC+QkyiGGB/abK4k3lWCZA4HZuNa5aMerVoHFI6wn51Gg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7037bab7-f332-4ad4-b93c-08deba8e256f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:48:01.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbaRxrPzj0DE4woj2LfKMOUon5DWnR0mjowqcN2mBqp8p2u53zapE/+4A5Rnx+DvF6EtPv1iUVIdK0/tttKeYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> There is no need nor gain in splitting mutex or list initializations
> between two init functions as all of this is just pure software state
> and all this could be done at once.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 5d1a3a26cb6e..99562f691080 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -363,6 +363,9 @@ int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
> =20
> +	init_completion(&xe->pm_block);
> +	complete_all(&xe->pm_block);
> +	INIT_LIST_HEAD(&xe->rebind_resume_list);
>  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
> =20
>  	err =3D drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> @@ -373,6 +376,10 @@ int xe_pm_init_early(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> +	err =3D drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> @@ -484,14 +491,6 @@ int xe_pm_init(struct xe_device *xe)
>  	if (err)
>  		return err;
> =20
> -	err =3D drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
> -	if (err)
> -		goto err_unregister;
> -
> -	init_completion(&xe->pm_block);
> -	complete_all(&xe->pm_block);
> -	INIT_LIST_HEAD(&xe->rebind_resume_list);
> -
>  	/* For now suspend/resume is only allowed with GuC */
>  	if (!xe_device_uc_enabled(xe))
>  		return 0;
> --=20
> 2.47.1
