Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90250C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D20898A4;
	Fri,  3 Jul 2026 13:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NmjQh7Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817E610F813
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783086255; x=1814622255;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S7KLDBLLa48vM2OW8XWhr/6ZzDF8G+r52RA/+gAog0g=;
 b=NmjQh7GpC0mRUheM9mCdKpObNLuCHl2tK2oEoaXQmcMBnHO0B+v30Sgl
 SZB9yCLNFPPVFCYmFOQxHAXXF4XWkwbGvaFcGlNyruhWOQw4M9ypvfxyx
 7ySf79bWVtwqFxAjYRdzzU97hVlvLPf2jUq4m2gNDsLeAqSerVosJTR4q
 ctrg2DBQJCQQzI+FnFzklK7RK26CGPGxAAAl1weJheW3G/VpAGVnaPdas
 l7MppDg0VowDKWWPJUzEorYUGJYw/tGJivZBwmvacsm2iTfSK4AfJj8Sz
 dp8sGy1EPcxyiOo7a3hV36bMO4SeGra7fO/wP+mLL6IE3O5Lm+wpOOPhm A==;
X-CSE-ConnectionGUID: tq8LbA5ZTu2aBfZtjAcVsA==
X-CSE-MsgGUID: o7v5tuIkSxOlW3gwShrExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82947927"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="82947927"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:44:15 -0700
X-CSE-ConnectionGUID: SnqilmdsSniFyl7ILvL/6g==
X-CSE-MsgGUID: LaCwjB3ATWOkALid2BUumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="258007758"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:44:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:44:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 06:44:14 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9WuliI5HKSLn+a6tlV/XrTxSb2rtLByVOL068QvYbOBHZGlJHVnHid+iWJYCOQlIknaTgfoZ2Zc8v8s80pSPt3N98jNVQu0GvBdTKA+vw82fqQU7sT710FZWN795lobSt0Ao2rVmCai1FfHl4MNxSMn8DsyDFv0JUvj5dp8RWf98bvvHjICd3PM42BJU/IsdCMWJMydKhrzV3M/hpLPPrZ3Jo8NvcR3q+BnVHId7ZrE3tC95YHezzLoW0y0ZW0IsPZm82kpufx+gGwaK+eUoZuNwgXeSIScmmJm6bM+kaYGl/PPqc39m23zaiTJeWWRVNHwKBfmAL9ETwRWAnSKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNMqVylQkEO1isSNKTkS2BtMxHVxapFIGXEoBQlnvk4=;
 b=Vnf4NtRGMZ3a47nZ+uiAwl5Gbh5d94p7BVQpEQaVrLFcbh8CNMYqEXFwZFeh6e1cwOGOX3OCalzjkBiyjyHPZCeT6ShanWWNQ3RGfa+JbnxS69g7lSRG5RYLJE/NRweTN/nlnp6BB/XILIYGk+BHBdeX1fxOyRkeU14s/iePtiMKp9DwdeltHDnHgztIUnTAnWWXHckIDkdW0yIwG83Cm58sqNpOFDzkZl4ymVXxRfuDr+sNSH1YY3zbOc+ESJWGqrXsVxTWUU3dPGffGFR9WJiAx2dGOteDNcnbmNg2rvmDJYpfpZc5Z85ePcwbmeij5/pYkZRFoFDlnB9F2caKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 13:44:12 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 13:44:12 +0000
Date: Fri, 3 Jul 2026 15:44:08 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/13] drm/xe/tests: Add migration packet test
Message-ID: <ake6DS7ZfTjXUwox@nostramo>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630132633.32804-13-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::33) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA0PR11MB4734:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fba4a99-4cad-4d66-fe57-08ded9092a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: f2T3PGrc21SI1lDYUtbQ3AhwA4fdMza6h4TJffh8X58ly5YXm00P7+d8NF8Qg+XR+P0uUEQynzHbSK2ugOCzVP7W6q/PXlkJeTADej/SCwLJTH15YDmhUUuQH8eK/hJjxo4GbUp+XiS5tMzITwe2h2yWuMI9IdXTF3Fn+YD3HQ1M4+OnDlSraJO6Am98WIEMej68yn71WyOhw9Gl8QboJH1U4Ryt624HKLMotTY3EP25LaZG/mMDBr0nM3Jo3Ux/6xiLcs8L/h1gQzsoPy5hZ8dCag6qwOSm+qP5ZyjyfT2z3bLAIy6uq1WUzYXnyzS03Wl8rDicF0PIGVDPitJ0KiIGkpsXrBhXqpwD+5zUyvpQEn8tYMFQdlxALK6cRxX9sM3vUK6GdRL5dQ0Y+LgzpwvpliovOCLt2FPeX9z73ZCHwpsaWbhtEFsU90/ftlFPPzrIRp9lhM9Dr0bqja6p5QD5WuqaVjoUXed3g37fY0NXwFs68fD+dMOb1SRd+B9KnSkOCtGVLOstLkxPA4uKEb9//C0mci2LjaAyDzVo4DxiWWdjL2bEQl2J51y/JeSWC9ELs3F8UVMIEImyK/D69JL3jei/GhlyBt07SPDzaVN+PQoW4YAVB3zBOTrwk6ctUnjJZjajbh0488oPhPh1xf/nxDpQrysxQTepve2f6HI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21EaVR2L1YvNjZNaFBEU3hOY255bSt6cWRBOEUvbXdNSWxSbUhDSVY3SHdu?=
 =?utf-8?B?a3p0RUhXMWI1dm5JVmx4MjUvK2E0Ly9oRjRHSFlpSFhxbjU0eG1JNFRyWlVn?=
 =?utf-8?B?dEg0WmdmQ2syNmFqcEhuUEloYWUrb3BYUFZNNjdlNjlXeUd6Y1Bqd2NpdDR3?=
 =?utf-8?B?eDdtN1ZrMkdzUHU1MGFpczB3azJlNmZFcE8rK3JjVE5QN0NISGprb2tPdnU1?=
 =?utf-8?B?cThhenZ2cmFYSlg2K2RNbTZXZlJFbTk2U2V4WWIvbnV0Qm81RTl4aCs0c01B?=
 =?utf-8?B?MnFHVUw0ZTZvbjNudUdFVFFRQjdpQUNod2J6VHR4ZjdUeCtJRlZ4ZWk0S1Fa?=
 =?utf-8?B?Wm91KzRQMFgvS2dvcWZFNVk4azZTbzNXTTd1V01Ea3o2R3I1VHpYUlBML1E1?=
 =?utf-8?B?ZWZmMlozT1JDVHBXai9HYnpyR3ZXVHM5REtydFZTWDJJWDYyMDBQT0pGOEE3?=
 =?utf-8?B?MHMzQW00QUZaSHV0VE1UWGxkR0dUUENvMDAwTU0rTlIxVWFVQUhwYkphUHd5?=
 =?utf-8?B?NVh2TmVhcjRTV3VIcVZ5aHV1Mmdla2pmNGkvNDFPZ2ZsQjhKbHh4eHhsQTNV?=
 =?utf-8?B?dWV6dnNQTjNHeHdaMDEvT2tCbmRvK0hBWmVUNnoxUDdORXlYZW9wWXI4OWgx?=
 =?utf-8?B?eXNnam02ejJ2K1dTMUErWjZ3eEV4VVhJeEkxUFMzWS9KTnlibzJMYzdlWklR?=
 =?utf-8?B?TUI4S3JjQVpIMWFuN2tDMXVWWVNYcE43NkwrUFNKTUZpejAwQVl3bkZIVkdX?=
 =?utf-8?B?VGhJZ1dFZTVDcy9QMnhGbmU4NHF6bVFlQ1R4OURXcitGOGUxQ2NzVmNQRE02?=
 =?utf-8?B?NnYwRXJrV3g5cmRrY2ZCcmxHc1hTZlhJNENtdDlVWHFLMDVlQnJSc2VmNHJ5?=
 =?utf-8?B?cVE2Q3h1YTZuanJ2Y3BwNnRGSFFHbFVCOElxd1kvd0dFRDNJQytEYnQ5S2Vu?=
 =?utf-8?B?alFXQVhPYWtOWC9tM0lzUTlGV29oczR0bk5JRGJReVVxVVhkNkp3NDg0dGxD?=
 =?utf-8?B?Q2hhc2Q4MEhuSDMrMUdHVFFJcEFOMklvRGJRK2ttZ0lMdUVlakV6N2xJemFq?=
 =?utf-8?B?VGFYcG9YMTFtOU0wMFJHYjVMWXUzYUF6ODAySVdROGRGMHgyMmtPTSt2UDJh?=
 =?utf-8?B?cS93MUdUajdxODZLZGhtdUw5L2hHZlYvL3FlTUJIUlVpRWlSNllVUzk1aEtY?=
 =?utf-8?B?cDBoV3NTN3VnQTdORGY0L2I4bTlXVmdaVC95dE9odjRqcW9OeHJqMjBOWmxR?=
 =?utf-8?B?S1l1K2JnbTROSmc3T2RNZ01jcUNTeUl0Mks5WlJmNEg4SVBLdnpvNWRsTlVQ?=
 =?utf-8?B?cEg2MnR4UVNnSlpGYksxaVRzcmFGWllkRm9RcFNZL01NdSt6STFxMkE0NG5n?=
 =?utf-8?B?djRKZkE2Rm9SWFVzREhOSHJ1K3Fvb3JKOXdTUXY0SlRBUUs4akVuNTAyQWx4?=
 =?utf-8?B?eUdpc1pBcmVQUloxMlpKeVpWYkQrREtyOEdqUk9tbm1YUjRQZGdJcFRwNmhE?=
 =?utf-8?B?ZDBhbzF2OUExR1R5WTg3Ny9rcEI1disyM2ZUQUl5c1VheVRpcEtZcnBHZko0?=
 =?utf-8?B?OU1JTVlyWDVJWWt6UDdKWTArRTJpMnUzdkpVS0F1azFjc1hhL2ZpcmhqRCtI?=
 =?utf-8?B?N1ZPcmxiWWhhUk5sbFJpa21BQlRjNEY5Y3FTVS9iOFIrV2ZyTVJJU3hqSU9G?=
 =?utf-8?B?Rm5YVjkvNG42MkNlZDRsSjBPZDlCU3Z2b1luNHVlcVB2ZU1XeTNwRXVwcGZn?=
 =?utf-8?B?VXE2d3N0cldpdVFSYy8rbERpTlRWUzNRTzZhZVU0dEpaKytrT0ZXbHc0dkJZ?=
 =?utf-8?B?dDBOTUZMbFc1cWM2Qk5vSENsd3JjSlU4VWZVWnNPdmxHa0xDeDNVNnB2SGxO?=
 =?utf-8?B?ZTMzVlV6WTlUWTNzeWV6TjN3R2FaY29ZYmJYTmYzMys3WXZBNEc4VGpvY3ps?=
 =?utf-8?B?dm9yc0hDZFMwS0J2aFhlUUZiRlBFdTFXMW9yN3p6S1FzY2M4UnZ5cmFYMnkr?=
 =?utf-8?B?eXdxOVpHTGtuOXN3MUZqMm1kTVFBWllwTE9hRHRvVlBSaWlSbjd6dGJIa1Fr?=
 =?utf-8?B?ZWhQQ0ltUWNWVCtoblZwVkZQbHN1L3JvcCthMENucXppVnRCL0lFbjBlL2dE?=
 =?utf-8?B?YmpaTVd5UkVxN0Q3Qzd0L0JSb21lZ0VwQ0FjQzNVRnpYUkdVVzlzOGJZMzJ3?=
 =?utf-8?B?bmsybDF3Y3M1MG5VSUx5NUdaMWNVTWhtci9BRGkxVzNKNldmekhiWE1KTzc2?=
 =?utf-8?B?OFlVMStzRlJwSlNDSHBTZitPNEhxVndCKy83dlQ0NzUvVDBWSnJJTm9uNlRn?=
 =?utf-8?B?M01Uayt5L09GcngwVzZzTkVsVXdBWWV2ajdQZGFpZWxkWXRUc0xUeTh1Z25O?=
 =?utf-8?Q?q4SGwY0stnR4NPx0=3D?=
X-Exchange-RoutingPolicyChecked: IFcVD3r92ZFMR1e01dSRP9NcTjpW5BGzW9LRx01v66GcPdh8sSAfIZnmeIlq7ZCDEcFalVw6EyRag8riNKKMk2uceMdd1U20a/prTjnxU5i7vQO9o5IjxdvH4Tiv9sM4wNCRU1CjP5DhECsIlIQdvuIVDRzxB8mecUN94uvPWw13h9eMSVASi3ok6EkwQb//jyGrtJns8gcOTETWIEIHca7nWYscOvO+4nnD3JcRoR8msHnxU7PybcKfhy2imj4mxij8KV+K27lBJWJVXbPkbMs1cKb+NNCVZYw4gpz4wBlqI3NXD4MSciRxMDTO/zQFX1NzMmIBM5fAbqbJUZjsMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fba4a99-4cad-4d66-fe57-08ded9092a79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:44:12.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XJFFgNzVnhCMyDCoZlOo/6+Z9umE21nN1nrOE0KD7BB+bSzKSoipcfVy3uujRV5i1q6L37wHojARlVPSFUAe5vE1dD5Bq+y/GvcNB2FjDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
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

On Tue, Jun 30, 2026 at 03:26:31PM +0200, Michal Wajdeczko wrote:
> One of our migration data packet (descriptor) is based on the KLV
> encoding. Add a simple descriptor initialization test, as we plan
> to use new KLV helper functions there.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  | 83 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_packet.c          |  4 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
> new file mode 100644
> index 000000000000..9af066875671
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include "xe_device.h"
> +#include "xe_guc_klv_helpers.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +#define TEST_VF		VFID(1)
> +
> +static int sriov_packet_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_PANTHERLAKE, /* we need MEMIRQ */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +		.graphics_verx100 = 3000,
> +		.media_verx100 = 3000,
> +	};
> +	struct xe_device *xe;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +	xe = test->priv;
> +
> +	/* pretend we can support at least VF1 */
> +	xe->sriov.pf.device_total_vfs = 1;
> +	xe->sriov.pf.driver_max_vfs = 1;
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_sriov_init(xe));
> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_migration_supported(xe));
> +
> +	return 0;
> +}
> +
> +static void test_descriptor_init(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	struct xe_sriov_packet **desc;
> +
> +	guard(mutex)(pf_migration_mutex(xe, TEST_VF));

Sashiko complains that we'll never release the lock if we're mixing
scope-managed locks with KUNIT_ASSERT.
We might want to convert this to test-managed resource.

LGTM otherwise:
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> +
> +	KUNIT_ASSERT_EQ(test, 0, pf_descriptor_init(xe, TEST_VF));
> +	desc = pf_pick_descriptor(xe, TEST_VF);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, *desc);
> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.version, 0);
> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.version, XE_SRIOV_PACKET_SUPPORTED_VERSION);
> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.type, XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.size, 0);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (*desc)->vaddr);
> +	KUNIT_EXPECT_EQ(test, 0, xe_sriov_packet_process_descriptor(xe, TEST_VF, *desc));
> +
> +	switch ((*desc)->hdr.version) {
> +	case 1:
> +		/* v1 is KLV based */
> +		KUNIT_EXPECT_TRUE(test, IS_ALIGNED((*desc)->hdr.size, sizeof(u32)));
> +		/* v1 has at least DEVID and REVID KLVs */
> +		KUNIT_EXPECT_LE(test, 2,
> +				xe_guc_klv_count((*desc)->vaddr,
> +						 (*desc)->hdr.size / sizeof(u32)));
> +		break;
> +	default:
> +		kunit_skip(test, "missing test code for version %u\n", (*desc)->hdr.version);
> +	}
> +}
> +
> +static struct kunit_case sriov_packet_test_cases[] = {
> +	KUNIT_CASE(test_descriptor_init),
> +	{}
> +};
> +
> +static struct kunit_suite sriov_packet_suite = {
> +	.name = "sriov_packet",
> +	.test_cases = sriov_packet_test_cases,
> +	.init = sriov_packet_test_init,
> +};
> +
> +kunit_test_suite(sriov_packet_suite);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
> index e581e8e6c1d1..558a3697d639 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_packet.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
> @@ -516,3 +516,7 @@ int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
>  
>  	return 0;
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_sriov_packet_kunit.c"
> +#endif
> -- 
> 2.47.1
> 
