Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7C0C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF06710F0D4;
	Wed,  2 Sep 2026 09:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGHJRTIj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B421C10F0D4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788342998; x=1819878998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=MzUVtz1oPChbDTqrM0MYgOP0C0Y6aQ9irmtvMPKabgI=;
 b=nGHJRTIjhdOaCsrew5+ERhCqEF0CdajOV6XHxURztHO3Z2HvjtfimUQu
 aKSWXYoXTSBv29RXiUZBuEL85wlUNb6G6OfaSmy9igUtLW/EjSufIwagO
 1Qwy4WJ04JX1wlQ6Q1N2dKDWtrbRlUBvNs+G15F1OEREX8fOj4ocxtAtd
 RQDXsQAnFyUrERAaGbPnE2RzxIrUxddADtKCwniRc0fS80i0O0rFz29XN
 8XXdc0I+hblqJSiYAydJLlLQA0WqASc/XAezEW9IPN+UGz79rYql7PfBv
 NjMGPoucQdOSN4gg0L92QCTMtd3VVX3w2oW233G5STIismc3CDlIOwwYF Q==;
X-CSE-ConnectionGUID: gCX3+qOjRIeXWVPpfIRT3g==
X-CSE-MsgGUID: K+Q8EK0ySBqSYhUBobohug==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88815881"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208,217";a="88815881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:56:37 -0700
X-CSE-ConnectionGUID: BkB0D6bZShGvzP6wye2KHQ==
X-CSE-MsgGUID: 5kzt7FnURcCdkeMZfcuBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
 d="scan'208,217";a="292873700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 02:56:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:56:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 02:56:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 02:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNhoPaKi/c67CmnUv7mtSUbDHBja+q9X70AzthzCy3JWwxDflPOWa2bAzbukT3jGKofo2+Q6VYolK7fnvBy7kXw20jBTjpb6ftkwSY9qJCRZ3gayNyO78lADJFOjgyEv9LTS3OafK0hHkZR3jrm4cOM5oJ3vZEeviMFvc3MUHwxJqAM4Hh1OwK6aYBYCgjwtXR0iqV3wAZgQHjOualOJDqi3fHhf94DryiJk9FOy3ufwBUdDvZ8AHkRsgEf3t5fg/arliZnSDUK3Jb/LG5qYBJtTkgRIOfKlkPxnYSHlm6a7RDcA6/7BQ/a1K2YXDy5H+0qn4C//N8su9W2ifIyc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDE0v1NIJlMbyjzIhHHWzjKmNQsYGmQh+DsTwHgsop0=;
 b=JAbSnaWlasJBqqKBlw31rvZY6B0te14r38H4i7WFpS3DSUYLTxfI3v69buV90KcCaaNeQLyfxrnkKbSojl3gXnVY7sOjFpjbxtuqbXgdLRoqXOHgudtNwph5HokA1mEoz+j71eYmBtBQxGAVio49g8dz7XlzGPm0It8j4GqFRQ1s7mhoBnrSrjzQCR5k69c3KKiOmNBgk97YiSEPEZhH8MnShzD2g3MtCmqCeR5Skcq2QpdsQZxGDN4jNm/qqeXKOhu4xCHiYhHovG1GJBf3FQmpthL1Dt8Bw95EfMcryleg3OMvmVx3WyXByVqmA+70fVscU6TuTcqwJS0a0bV98w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 09:56:14 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 09:56:14 +0000
Content-Type: multipart/alternative;
 boundary="------------QcPc5gOJid9PbCSf0ypG4Y7f"
Message-ID: <39420eb0-d81b-441e-84db-d832d796e18c@intel.com>
Date: Wed, 2 Sep 2026 15:26:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <tejas.upadhyay@intel.com>,
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-10-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260825063615.3697317-10-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: adf5fc3c-30af-4ce9-b586-08df08d86c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 8YltDhhh9i7r59c9btprOfu5GoLa0h5Gd/y090tfUMWXzaU2Du7KFJpXfEMmulIS+JDY3AQDMCEl4x+/Rn92X2d3+bys9tJIeJ9SvwCFDV4Uf5KS5ENGYKXebDODjbVUVVubDNtGGVX+Rqfs6csEK+v4a+jUGWa4fKI84z2lCjBlr8LiLCyFYO+CrpqxhalhmojAE+7/quF46YC0Epcucrh8hoiTv2HlOq/e5ZfoU3wbpy4m2HBHWOMD60HAamxiJ32G8w5Qp67WfwYzcO2TCLGMQT/GNU0Zu4FCE/mFuZJy8faqNK2RaMPND2fUvy3VDi11oYgJzpFhbnpKHBsFvE5PWt6d7UZRm/272rvwx+jGlfkdy3CBMg6qw1tjtRQ9PK6r3MHTWI3lQE/M36uJHbl5GDWd7rtWz1g1DqSKjbxhVg7N9pnbD6GNsbU8rB24kb6YY2gseVYGyJUjA/xAlJOJ+32g9MGpz/+fb6BAJ4BsrQR+wIkGtRAD+YdPup7JQV7rFOK0KqR1Zh4nDUeMh66WM4nTGwgNTbDdidRNxHZLMkRY/r5I6LsLGCTzd01MOLGAVPhkUOhZKLU22Zd+2tTLvgYjRK3FiAyyR7WOlZRIMTMXDMHWLnjLysAfqRwNquMBeYXQFAPazSS5VzFGmSYt4QxQ1v91RW3dGS0IgzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFxRTVEbUNDTlFrYVJYNFZOQ05FWGt6NHdhTTlwSmlGOXIzUFlOa3J0aDFI?=
 =?utf-8?B?dk44RnUyd1BBMmhNWEd2eEdsdHlqSXRuQTV6K3JQVW9NQmJRWVgzS2ZhbU9T?=
 =?utf-8?B?QzNDalAva05Va0VOTFpKNG9VdXVSSE1QeldQbXFnS2RxSVREd3VKeEpRNlVX?=
 =?utf-8?B?RTVjRzlvdEhqaVJmd3NYODBOZUJxOEtWd3JDL2FPTE9OaGZiTlZVcjhtR2xv?=
 =?utf-8?B?ZTdiRUVxUmoxODdGRTBERlBSZWlzWDY0eVFmWEUxY09wcjBKMm1QMkVTSElj?=
 =?utf-8?B?aTVsZWNaV2c2WGtrVGZ4Wkl2WWZyaVp2Qng5NE1wODF5MFdMOG91NlFRZC9o?=
 =?utf-8?B?eVFkS1ZTdnBOQW1EVnUrYm9KUDV3aFVXTGlRdTE3Sk5iNkcvRmNjMVZHNTFx?=
 =?utf-8?B?SnhwWnpzTW5oQ1F0dUFmZFpKcTZXYUptQldEc1gwazZqbnhEVGd4Mk4zemxi?=
 =?utf-8?B?K2pRR05aZXFudy9PSCtqRFd5MzU2Wm91ME14T0NaNW1RTzdRTlZSZS92dVV0?=
 =?utf-8?B?aXpjalNjWHRURk04YzFVQXhJblZzbGRHMEt0cEdrelMxdzZEeTQwRzg4dnBm?=
 =?utf-8?B?OFk0bjlYSUNYR1JOZkU2YVZJTms2em9LdC9wNWZWdmdyenB4b1BGMHpVWTFF?=
 =?utf-8?B?eGRFeitMT1JPRHNNS2owdlUxUnRNcFY5K2oyNnlxK09BOXlXemZ5N1RGVDh5?=
 =?utf-8?B?MlVHNUx0TnFHdU9heXRocXpJbzYxZEdpcXRWeFB3RWFjTXRMSHhiZVc5bk5C?=
 =?utf-8?B?b0E2Y0pUR0NMcS9XdmRPNEttcDdraEZzUGJZdTR2Yi8zMzkzNFNES0twTnZw?=
 =?utf-8?B?UVpVaFRBeXpkTXE3L1BZNGJueVhEcVNDcnRRcDV5S1V5Z25ZVnhYZmlMa3dw?=
 =?utf-8?B?SGFBUVBCT0RHWlFXN0lpdVU4Z3dWb2Vrak9pTlFDNjYvd3lLNTJkOEJoeW9t?=
 =?utf-8?B?dzRhbEVJZHBYYnZ0UTFTbzdxNlRVcmZGbmZvTGk3SkRDNkhJR2lVVUVYZEow?=
 =?utf-8?B?NFo0cWh3OEJpWktwU3JtMWlqWHN1VWdCZ1cyTXR1eUJ2RXB2dWVZMldmUG5V?=
 =?utf-8?B?Z0czUWxOeTZGSWRFcjdtRERyRUluMUJ3ZTZid2c3a0RTTlhvV21HanYySVNX?=
 =?utf-8?B?emxkSFJKWjA3QnRIbXZqZHZZZVJEZXBVc1JZOStNT0JSeS9neEYxWkxoYTNI?=
 =?utf-8?B?TEZtMExxVmd3dG1MRDAzdVU2a21BMjF3N2NaMmJFRnNTbW1hbjdyREFhTVBm?=
 =?utf-8?B?anMvUCt4UEdwQSt2ZTFsMjRuNEZxdTI1VDdXeS84MW1OeWRja01QR0wvY2gw?=
 =?utf-8?B?Y0VJSmg5YXl3VXYzUVY2a3hJRW5JeTN2QUZSYk5xaGlBdmUzbHpJVlMrYXR0?=
 =?utf-8?B?SSs0SGJicnBCMXJETTZxUmhJcGViS0dCdklFY0RWSXkzQ2xZVWVkMzNFZHhQ?=
 =?utf-8?B?Vi9QNTIzRnJIeTZsZmNabkRwSTV3MmpiZ3BJNkpkdFFwZlk5MlFYZlVWMUlG?=
 =?utf-8?B?bm11dnhua0V0c1dtSFlGOUE2OXZsTFBrTTU0Y3BGYkFJUUhBelEyS1lBUFlP?=
 =?utf-8?B?ZEdVNVRSdEpicXNBUFlnbldSUXo3Vk01eGo1anM3UzduQnBuR01ZOXVWUk9a?=
 =?utf-8?B?WVBHSVIxY0dKbjBSUjBZblZQRTFRNkFwS1Fnc0xud1pqd0R0NmNlR09mNktY?=
 =?utf-8?B?RDRmb0NSWTNhZVFLdTZQOWxYN2lUNjdCVUJHbWtJNW9pMDFhT1lPeUlCeHF0?=
 =?utf-8?B?RG5lTUYwRytQTmk3ZDVxTE1NT1Zqa08zcHRzalFEbFA1TXEvUFBKN240NHNw?=
 =?utf-8?B?MkdJTnYyTUNEWk96Ly8zODdJQTNKWkpnRXpVOHNKQXBpYmlUa3dxT2R5NGFu?=
 =?utf-8?B?aUJ3VDIxQTFxRmRRVytUcnZzd3lBSnZVTnZ1WEhBbVdIb29mMUhCV1Z6ZEZs?=
 =?utf-8?B?UENDMjlBcnZubFlyVkJZTmhZWnVnRG5FT2xZaG1XSnd3TVBtQzROTTd3SElX?=
 =?utf-8?B?bSt6NE5FWVFNSGE2bzVpb2R6VFdQQzFDdzlqSmNKN3FLcXArcEh0UThFbHhn?=
 =?utf-8?B?VnhEN2xvZjhVSkNPTHlVd3VpT1UzbFFEYnBKYlB0MzR3ZUtHTWVzb3dNa2Nq?=
 =?utf-8?B?QlJYZjFyaGYxdWFYVmlwWDdSMFRvK0ZzdVNCWkVBUmduRzljZXBkYkhzUkor?=
 =?utf-8?B?VUVRZjFuczNxdlhCTVVsNUZTRmlEdkxrT3Z3TmFiWTlORGNoUTJMMjZiRHlq?=
 =?utf-8?B?SHpOK3YwRFVGenU2M2dJNVh1SUxBOHhNNndKQXZpTWZKTkY5dlRuSm90Qzdk?=
 =?utf-8?B?c1YvY3kzU3V6cGs1ci95d001Tk9EMFhlOGFHTGdJc1RyR2F0TFlkVVRMbE5s?=
 =?utf-8?Q?f876Z04HbAN1pr70=3D?=
X-Exchange-RoutingPolicyChecked: 2ho3lw5ma3A+uRKJsahn7dEpBY/IB3WszQWn8JaXd0UnK4fCT/02uOd/lggEHc6KjVClHn8z2UttnW80Xv0uB+HQBNHLr79nYJ+eLbNh/Y7fMYoRbwHS0SmRx9fFfv4GMoCZCXjbNJupKQ/Xu2uHwyaArRolrVvqLDDUGhADWRk5yejNQQDJppZGdKZ2gshFEdcicjiXJ7nC5ORJET74kkyPqhaSCyM4E07tJnXtVwLNVVbxjeMHqvABtTE9x81xdbd7zfYqr1uvLR6zzw/qATJ5Xxvop4dWcIjymdtsbmQgjmUENFse/KPAXSg7g6l/zPislTeq4Qd1jlWJ2eThSw==
X-MS-Exchange-CrossTenant-Network-Message-Id: adf5fc3c-30af-4ce9-b586-08df08d86c97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 09:56:14.0138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioSOdz+5GPHQnkGkCM0/r9EyfMXfMMROfH93c+e3e3tysDjh2ak7Nbtnh/ZAkoaNLgjo2iVEQoyHY5TzkTFYmkv9HeWK9Jlqw8jcW2ZDKZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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

--------------QcPc5gOJid9PbCSf0ypG4Y7f
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 25-08-2026 12:06 pm, Riana Tauro wrote:
> Add support to query page offline list and queue from firmware
> during module load. The page offline list command retrieves pages that
> are already offlined by the firmware. The page offline queue command
> retrieves the pages pending to be offlined by the firmware.
>
> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 99 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h             | 43 ++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>   3 files changed, 146 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index c643c7137a42..441462a36dbc 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -328,6 +328,102 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
>   	return true;
>   }
>   
> +static void get_queued_pages(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_queue response = {0};
> +	u32 count = 0;
> +	size_t rlen;
> +	int ret, i;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> +				  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &response,
> +				  sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline queue\n");
> +			return;
> +		}
> +		if (rlen != sizeof(response)) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
may be use errno -EPROTO?
> +				   "unexpected page offline queue response length %zu (expected %zu)\n",
> +				   rlen, sizeof(response));
> +			return;
> +		}
> +
> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], true);
Silently dropping errors from handle_page_offline (). Should handle errors.
> +
> +		count += response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
To avoid infinite loop due to bad firmware use flood limit right?
> +		if (count > response.total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned from queue exceed total pages %u, returned %u\n",
> +				   response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_offline_list_response response = {0};
> +	struct xe_ras_offline_list_request request = {0};
> +	u32 count = 0;
> +	size_t rlen;
> +	int ret, i;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		request.index = count;
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_log_err_fatal(xe, SYSCTRL, ret, "failed to get page offline list\n");
> +			return;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
may be use errno -EPROTO?
> +				   "unexpected page offline list response length %zu (expected %zu)\n",
> +				   rlen, sizeof(response));
> +			return;
> +		}
> +
> +		for (i = 0; i < response.pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, response.page_addresses[i], false);
> +
Silently dropping errors, need to handle?
> +		count += response.pages_returned;
> +		if (!response.pages_returned)
> +			break;
> +
To avoid infinite loop due to bad firmware use flood limit right?
> +		if (count > response.total_pages) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "Pages returned from list exceed total pages %u, returned %u\n",
> +				   response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> @@ -923,6 +1019,9 @@ void xe_ras_init(struct xe_device *xe)
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> +	get_queued_pages(xe);
Better to handle errors rigtht?
> +	get_offlined_list(xe);
ditto
> +
>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>   	if (ret)
>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 2fac968879b6..cddcfa656d9f 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   #define XE_RAS_NUM_ERROR_ARR			3
> +#define XE_RAS_NUM_PAGES			25
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>   /* Device memory error categories */
> @@ -280,6 +281,48 @@ struct xe_ras_page_offline_response {
>   	u32 reserved;
>   } __packed;
>   
> +/**
> + * struct xe_ras_offline_list_request - Request for get offline list command
> + */
> +struct xe_ras_offline_list_request {
> +	/** @index: Zero-based index into the offline page list */
> +	u32 index;
> +} __packed;
> +
> +/**
> + * struct xe_ras_offline_list_response - Response from get offline list command
> + */
> +struct xe_ras_offline_list_response {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @total_pages: Total number of permanently offlined pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of permanently offlined page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_queue - Response from get offline queue command
> + */
> +struct xe_ras_page_offline_queue {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 3363f48da2b7..194ad3ac3da2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -27,6 +27,8 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -36,6 +38,8 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
--------------QcPc5gOJid9PbCSf0ypG4Y7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 12:06 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support to query page offline list and queue from firmware
during module load. The page offline list command retrieves pages that
are already offlined by the firmware. The page offline queue command
retrieves the pages pending to be offlined by the firmware.

Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c                   | 99 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             | 43 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
 3 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index c643c7137a42..441462a36dbc 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -328,6 +328,102 @@ static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
 	return true;
 }
 
+static void get_queued_pages(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_page_offline_queue response = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret, i;
+
+	/* Supported only on platforms with system controller */
+	if (!xe-&gt;info.has_sysctrl)
+		return;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP,
+				  XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE, NULL, 0, &amp;response,
+				  sizeof(response));
+
+	do {
+		memset(&amp;response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+		if (ret) {
+			xe_log_err_fatal(xe, SYSCTRL, ret, &quot;failed to get page offline queue\n&quot;);
+			return;
+		}
+		if (rlen != sizeof(response)) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,</pre>
    </blockquote>
    may be use errno -EPROTO?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				   &quot;unexpected page offline queue response length %zu (expected %zu)\n&quot;,
+				   rlen, sizeof(response));
+			return;
+		}
+
+		for (i = 0; i &lt; response.pages_returned &amp;&amp; i &lt; XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], true);</pre>
    </blockquote>
    Silently dropping errors from&nbsp;<span style="white-space: pre-wrap">handle_page_offline</span>
    (). Should handle errors.
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+</pre>
    </blockquote>
    To avoid infinite loop due to bad firmware use flood limit right?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (count &gt; response.total_pages) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   &quot;Pages returned from queue exceed total pages %u, returned %u\n&quot;,
+				   response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
+static void get_offlined_list(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_offline_list_response response = {0};
+	struct xe_ras_offline_list_request request = {0};
+	u32 count = 0;
+	size_t rlen;
+	int ret, i;
+
+	/* Supported only on platforms with system controller */
+	if (!xe-&gt;info.has_sysctrl)
+		return;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
+				  &amp;request, sizeof(request), &amp;response, sizeof(response));
+
+	do {
+		memset(&amp;response, 0, sizeof(response));
+		request.index = count;
+
+		ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+		if (ret) {
+			xe_log_err_fatal(xe, SYSCTRL, ret, &quot;failed to get page offline list\n&quot;);
+			return;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,</pre>
    </blockquote>
    may be use errno -EPROTO?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				   &quot;unexpected page offline list response length %zu (expected %zu)\n&quot;,
+				   rlen, sizeof(response));
+			return;
+		}
+
+		for (i = 0; i &lt; response.pages_returned &amp;&amp; i &lt; XE_RAS_NUM_PAGES; i++)
+			handle_page_offline(xe, response.page_addresses[i], false);
+</pre>
    </blockquote>
    Silently dropping errors, need to handle?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		count += response.pages_returned;
+		if (!response.pages_returned)
+			break;
+</pre>
    </blockquote>
    To avoid infinite loop due to bad firmware use flood limit right?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (count &gt; response.total_pages) {
+			xe_log_err(xe, SYSCTRL, -EINVAL,
+				   &quot;Pages returned from list exceed total pages %u, returned %u\n&quot;,
+				   response.total_pages, count);
+			return;
+		}
+	} while (response.additional_data);
+}
+
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
@@ -923,6 +1019,9 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
+	get_queued_pages(xe);</pre>
    </blockquote>
    Better to handle errors rigtht?
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	get_offlined_list(xe);</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260825063615.3697317-10-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 	ret = devm_device_add_group(xe-&gt;drm.dev, &amp;gpu_health_group);
 	if (ret)
 		xe_err(xe, &quot;Failed to create GPU health sysfs, err=%d\n&quot;, ret);
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 2fac968879b6..cddcfa656d9f 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 #define XE_RAS_NUM_ERROR_ARR			3
+#define XE_RAS_NUM_PAGES			25
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 /* Device memory error categories */
@@ -280,6 +281,48 @@ struct xe_ras_page_offline_response {
 	u32 reserved;
 } __packed;
 
+/**
+ * struct xe_ras_offline_list_request - Request for get offline list command
+ */
+struct xe_ras_offline_list_request {
+	/** @index: Zero-based index into the offline page list */
+	u32 index;
+} __packed;
+
+/**
+ * struct xe_ras_offline_list_response - Response from get offline list command
+ */
+struct xe_ras_offline_list_response {
+	/** @max_entries: Total no of pages that can be stored in flash */
+	u32 max_entries;
+	/** @total_pages: Total number of permanently offlined pages */
+	u32 total_pages;
+	/** @pages_returned: Number of pages returned in this response */
+	u32 pages_returned;
+	/** @page_addresses: Array of permanently offlined page addresses (4KB aligned) */
+	u64 page_addresses[XE_RAS_NUM_PAGES];
+	/** @additional_data: Indicates if more data is available */
+	u8 additional_data;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_page_offline_queue - Response from get offline queue command
+ */
+struct xe_ras_page_offline_queue {
+	/** @total_pages: Total number of queued pages */
+	u32 total_pages;
+	/** @pages_returned: Number of pages returned in this response */
+	u32 pages_returned;
+	/** @page_addresses: Array of page addresses (4KB aligned) */
+	u64 page_addresses[XE_RAS_NUM_PAGES];
+	/** @additional_data: Indicates if more data is available */
+	u8 additional_data;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
 /**
  * struct xe_ras_get_health_request - Request structure for obtaining gpu health
  */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 3363f48da2b7..194ad3ac3da2 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -27,6 +27,8 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages from flash
+ * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
  */
@@ -36,6 +38,8 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
+	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
+	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
</pre>
    </blockquote>
  </body>
</html>

--------------QcPc5gOJid9PbCSf0ypG4Y7f--
