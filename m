Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE736FD063E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 07:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA3F10E1D2;
	Wed, 11 Mar 2026 07:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsUu7lvk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ED710E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773213040; x=1804749040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jCdt9Mb6F8QS4ade6x/aBjdT7WhtZaZ5ygwAw1C9lNg=;
 b=EsUu7lvkg/epyT7udgZxEyKftpRGKFfC30lwnVtmx3LxfVjWPX8oRkUk
 i00BO78PKLg9h5iTWJ3sTtDmoN45ZjhIl3DvE9mQg/0zGyoPuF/QlB/WC
 DeuOwYVKylKqMtDjOUSwc5m7Pg8k3k1jNla+dNiprR1uXKA/szKqPi9Gh
 p1PfvX7n9rbqDMpUpLLRz/gZ13zCBT22/2xvGguVoomQASDo1C1WIQJxF
 3CeJmG/o4AYXpiNM+Pn0CbLhGEvX0sWc9Qw5Nf/eKfUwIlJzm3sG1UyQG
 oqFY2PUBw5qYOpO+qBEqZxT1R3xi84qGgWPJHhcUlbSY1lgQVbZJnM/tk g==;
X-CSE-ConnectionGUID: Z2/G12wkT7OIgbnoYWXWVQ==
X-CSE-MsgGUID: rQvvFDOFQsKyTCIdIG1rKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78159735"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="78159735"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:10:21 -0700
X-CSE-ConnectionGUID: Mez012zDR3G7MoYEcyL6Nw==
X-CSE-MsgGUID: xaExct+iQ2ic1YUQn2Kw4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224839663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:10:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:10:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 00:10:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 00:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNix1OXpmXeXW28H0xsC02a3HwgUbZ8/9uGeA3VKl1vfCbXoqPx174nFJgTWYrhvf3mwQwr9pv6z4uTcNT185MU3uruBHW/1buLygYtwSp0WbXYrs6f8d0wppu4E0BF+GOFb23+NNt5LSmCOo2OtM8Xo2d0jA9yklxgzwmZdX7wxVo3c5O/7lYAGHNmyFQ785IVvH3cdUXbhuHi9v2VQEgwB2zr9eGtFFFm+e+/ay8vAW75fb2L2RyoSeuvv+Sx/orCu04hHkYeE1Yl9LhDQuV5vXwD9hZdLm/pxBYhn+v9pfSE5tepDfXn6M1YUdG2RfnQcdJMxfSNKff63XOPcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/0QJ9dXdcm1buLZmxhxo2DWgMYFlntd1k6HHlTlRmE=;
 b=wXGRoYhMF6DR4kCaUHJoIgBsZU2uMDcRPLyK83zDbVVoK+PdLfeSKvMlOCDF4fNU/dhNHadYhf9284VfGkgaDWLa9J2pQmkXTU3nH/E2td6PvU3BLWpSS2e++cE2+EO+X+U/Ehz5+ZEw4rGo0FNC15dkLKrcU5ObF0Dd/aQJ7ZIQ4/PHpJFw0RV0STcSJm9d5NZrDLVirN93u+gAUkD9hFub4kvz8FrDT9iNoU5jjT9f93KUI7C9gV/0SjRN3GIr9U6reGm+MhpRV7tWaoYCcwRe23s9SgZMxsGkty/DZt+Q/huVJxB8dy4zlJe1X7MAX9GMb6K3J8LtNIB68w5ebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 07:10:09 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 07:10:09 +0000
Message-ID: <b308163f-a203-4cc4-b558-1de58fb1251c@intel.com>
Date: Wed, 11 Mar 2026 12:40:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-24-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260302102155.4074630-24-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BN9PR11MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a361675-5c4b-414d-e742-08de7f3d3ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: NmLj4IFwoAvOVrVUIGoUR1cMFRaazPFa43p1aS71aCgRwUaUTRGEc6ukvncexbSE7P0WCdc5txXa8RceHM9RmGr9bKUYvqznS7P+ZeWzX69jXDVURm/w7rK4o6KZOcwAtBa2KrhBUvMQywfnXr8cGC1gNcOPlJz2IKCwuqPs9dqGLa/bLJxlS8xiVpL5O9r5LLk883kQ6R73l4ZelmT3LlFcHAWmsmBvnm3I92xKufy+NpB/5Ghl1+FC7QoF1Sn3A11VDAQH+YmA7KEFSb/ev/jODetIF0PV9gPId9IT3/vyd/IV8zpg5yMPayeVq5+a1npxvPb20YIE0LIzLWfFTOv6ZeWOAEqL8Pbd9ccMoM/pU6CRMna+YPrnxgn/RLni7pHdwcNhDThjWfVM3N0ilCYRS7TR7sd8p/nFadAKkXD3dF+IU55LN+SiOBZTaE34GCWuLPjIpugi+lqysgQdrb8ndyevq4lKZyXwgeltuDESnzCkuC1r+ca2744pwLBkJCSi4puCvAjbm/O3WZEtdDCdMLbWATBWAdywRXSYlNf8byfXt9j3WDfvIob2y5NHmaI10SJxy9uKK/fwr0IdNj9W6iZE17JRb1n4UXtHm2AblnvO87E5w5vqviKAkHLWQI2/twJRY3DExAKWUV3AlWpvwU+WwEgQvI1+k3Kzc7FUz6o2WvzyIJQH1LeO0qADOG5Hn5tbwM1gMaBzkt796Q7LJbKTZwXH0eM1HMd1Twk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE5oVEgyUGp0VGZUbCtUN094OFZGa2cweVg4dTRtNFZYeGpIbGwxTjFKZU5Y?=
 =?utf-8?B?bmVLWFJlNHM1V0F5Sy9VN2gwbU5FM2pPS2w0T2I0djd0c2FwdnprZW1reDFM?=
 =?utf-8?B?KzdReHNieHRuRVlwRy9EMldxYk4zOW5tNmJjYUN0WlVMYWZrWG5TNitYTlJK?=
 =?utf-8?B?T2llZ05LNTc4MVA0OWFYWnU2dkRJWGszYVdJZTl5amRldGVOblRXMGxiRHB2?=
 =?utf-8?B?L0hMSHBWQml3OGk1ZzdadWZoU2pEMWFULzZLRFdIOHF3b1RpSnp4WmszOHZt?=
 =?utf-8?B?VXlpeDBNNXAwcktrcGdHUXpLaHdQNTBkckYyamtJRDRHcXk4RVZDNjJ4aEwv?=
 =?utf-8?B?cU1BWFczTkpsSWZzeXRCTUY4SDBITytHN1pOOGdyOHlIb2RHcWw3VGFlUjBm?=
 =?utf-8?B?UUlJQlZ4QVhRNTNYVmZMdnhCVHRSVUdXYVZPYm1XTVVLNkxKS3lnQlc5Q1hO?=
 =?utf-8?B?ZzAxaUFxNU40OUt0NjhwTXltbmFNSEZCbjVOM0dqbFdIWDRoQmprcUJzT2Fv?=
 =?utf-8?B?YU5VNDVGZW1NVXh0MmJraHpwZ0JORkpuVFR1SEYvclNOc3krdndDa3IxbXp1?=
 =?utf-8?B?LzJuT240alJMSDBPTmZTeDlEV3BoVmx5dVNkM0pIM2FzRm5kRGE3TDlxcFlQ?=
 =?utf-8?B?RU5QYllEVmhRTTJHam92UXI0Sjg1MnhKL0ZkN2dOejYxTldPSVprYnp0OHov?=
 =?utf-8?B?eFloRmZtT2psekxiNVd4TDE1MGNRVEFuaUtNVUdqNTZmRXc0dnhyWUNUeVcr?=
 =?utf-8?B?eDJ3QXBsL2dBa3UzMlltcnJxbVkyVVNvTy9iN1ZXeWpmNWtVbTBlV3RTWEYv?=
 =?utf-8?B?bUhRakNTbkRVeHB4TU5KQy9WaU1UenRtQ1hLckx3U1JMSmMraDVrc1lTQmFO?=
 =?utf-8?B?d05xeXVUV1pVUk9TMVVYMkZWZkVSbjdPUmQzemw2Q0ZNdlZ0UktYVkk0ZTVO?=
 =?utf-8?B?ck1TOXB6TGIraTltSzdFVmtzQU9rUW9JS2JJZVNGTEQ0ZGpsZHd0OHZCckpJ?=
 =?utf-8?B?bFhKcDlhRGp1QjcvcVZRTUFzbDdqWTJVWGFTSVpoY1pkVlpHVDFNd1JRTm9Z?=
 =?utf-8?B?TUR6V1haSUcvVEdSUndLRmRlSGE1MjFqNCsvams2N0hEUzZFT1ArM2hQWmhR?=
 =?utf-8?B?anI0TGFNQWNPZUd4bmxCUnZHOGxMRG94ZzRWRmdUU21FVEg2YkwrTjVMWVI3?=
 =?utf-8?B?TEdPVFNBMndGYUJQeVNCaEcyV2ZSc1R6QmZGN2kzbGNQZHZ0bTMzMy9xWjVi?=
 =?utf-8?B?bFphUTFKQlZWOVdIWVI2NVk4dnUvMHRLZ2E5VFZHSm5LRGoxQmlHTXEzbHVZ?=
 =?utf-8?B?aGZmSGlneGk2ZVVTRzYyZ1o1SXc4bjVMdmpIU1RtMkVXYnMzcytGeGpKUGhn?=
 =?utf-8?B?Sk5CSkIzdmJ0M1d4UmhGSk1aUys0L29Db0x6ZnRNMnFGdHZwUERkQ1AzblRt?=
 =?utf-8?B?MnpmNTdGSHB3eU1tbDFUMm1Fc0tOZmlnVzVVRzRyVUMxZGRXaXM2eWVKL1pU?=
 =?utf-8?B?TjZKM0x5QXdqZmVHbGZ6TnpDNW1aQTFkTTY4dkZ1TEZuL21MMkFadlk2RlEw?=
 =?utf-8?B?YmhKL1pVMUF5VCtNSFNHb0xsT3V5Uy81MjNrZkoydU5xVENqaTRxdDhtenNl?=
 =?utf-8?B?TWxJZEFsZjdqeGtnZ3MzZllyZldEeFlXMjZSdTllWW9reVgxQWduaFd2RmZE?=
 =?utf-8?B?WFJJWElzckxGQ2kxdzdoRjk1QWU4UldQdUZ5c1NDZVpQbWlPZmgrSzg1TW44?=
 =?utf-8?B?eTl5MEtnOEtVaWJjUDJiUTNBM0c4alZrMEhOVDY5aUEweS8za2pmZnM3VlUv?=
 =?utf-8?B?dkdJUVJYdWNHVWEwKzNqbnl6OTg0OUR6YU5mTTdTOGVWQ0U0SzNxMlg1Szlz?=
 =?utf-8?B?eWVhUFYwK2djY3VzRmV6NFQzN3JOUkJWaGF1SXlTVWsyMlhjOU1qVWhqeU90?=
 =?utf-8?B?Q1dEcmxmSHNWZTFZL2tCZDZEY2htMkg5Wk9BTjNwdjBzaWh0ZDRmeXVXMDZJ?=
 =?utf-8?B?aFFRMloxNTZTL1BnR1ZJYVFQTDNSUmlJRG8xaU1KSnA4QmJpRkRTb2ZHZmUy?=
 =?utf-8?B?TUVQeVkwME1UWVZEd01iZUFSckJZWFcyOEM2VXlMeVI0V0xhK0NGNk9GRTJ1?=
 =?utf-8?B?eGFBUVBIRVplOUxuSTErZk1UTU9sWkI5WXdQc1lkckZyNEpUM3I4TzdRanFx?=
 =?utf-8?B?bEYyTEQ3ZTBVY0lSbXg2K3Z0VkdLVGRxNjYzeXY2VVdULzZ6ZXlUMTJTVG8y?=
 =?utf-8?B?Q2J5R3EzNy9xeklpcEMycHliMHpZYkVHcVdUMnJmVzJBZWtWdHRYM0xmWW8w?=
 =?utf-8?B?Y0ZpOUxwa2FkYURDaVdPZjFvekZ0VlF3azFKTkZ6eE5Mcld4TmFNWUJCbENv?=
 =?utf-8?Q?xz30ruebf3+lig0E=3D?=
X-Exchange-RoutingPolicyChecked: RaPWgnh+3zd2U6NmEYPj45iLNXf9KOcfpATN7cQ90VUw2/ya34pGOoNHqDFpN7zCOpp6dXgpFXzHkA3grgfFQwF0dZ41wZuZE7fH8W3JP9UgzL20Yli+Fw7ieGuIBZsiZPUXXvM3WvOnrhjlW3g3Gg1pM9eUO33I1KBgDhCiBUYxhJQs+COssTp2dFbIe4kVt3I6nO3eN+S9eZ1qbJI9x7gz15bvPdDj13StkV5AaSYHZY+Na70huwHshC+7o2Y2bLpaKac0VR277rQ8jz8RUXshhXQvO7qMe2XYhQgY0PKNUNQnNdOYwc9U+jnh6b8gKEUUtVNPlzxgmGEFQypBjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a361675-5c4b-414d-e742-08de7f3d3ab8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 07:10:09.2057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBafcprL8JkW7DnUI4eapzHp3L+CL+4QprGfILQKUKWhL1x+Xf3WzNlCOfFyORSQFqFbczew486cnaZWGOZOIhW9zwdS+9ltDTSuTJsqhio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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


On 02-03-2026 03:52 pm, Riana Tauro wrote:
> Query system controller when any non fatal error occurs to check
> the type of the error, contain and recover.
>
> The system controller is queried in the mmio_enabled callback.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use ras recovery enum (Raag)
> ---
>   drivers/gpu/drm/xe/xe_pci_error.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index ba62868f00d4..35bc5b8cee99 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -9,6 +9,7 @@
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_pci.h"
> +#include "xe_ras.h"
>   #include "xe_uc.h"
>   
>   static void xe_pci_error_handling(struct pci_dev *pdev)
> @@ -26,6 +27,12 @@ static void xe_pci_error_handling(struct pci_dev *pdev)
>   	pci_disable_device(pdev);
>   }
Explain the mapping rationale
>   
> +static pci_ers_result_t ras_recovery_action_to_pci_result[] = {
The mapping array should be constant, never modified.
> +	[XE_RAS_RECOVERY_ACTION_RECOVERED] = PCI_ERS_RESULT_RECOVERED,
> +	[XE_RAS_RECOVERY_ACTION_RESET] = PCI_ERS_RESULT_NEED_RESET,
> +	[XE_RAS_RECOVERY_ACTION_DISCONNECT] = PCI_ERS_RESULT_DISCONNECT,
> +};
> +
>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
>   {
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
> @@ -50,9 +57,13 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   
>   static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>   {
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	enum xe_ras_recovery_action action;
Add action_max @ end of enum to validate.
> +
>   	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> +	action = xe_ras_process_errors(xe);
What will happen, if RAS processing takes significant time?
>   
> -	return PCI_ERS_RESULT_NEED_RESET;

Use array bound check before using action to avoid out of bounds array 
access

Thanks,

-/Mallesh

> +	return ras_recovery_action_to_pci_result[action];
>   }
>   
>   static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
