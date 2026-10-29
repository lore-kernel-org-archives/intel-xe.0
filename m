Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC12606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 05:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JosDQa+k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC33310E37B;
	Thu, 29 Oct 2026 05:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3A10E37B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 05:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793252739; x=1824788739;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RvC+BimkWl2Yz6RUKhA0FVSLK/8eMU6RKL+O41uqSZs=;
 b=JosDQa+kSUoeZ0Q7FdouDz5pRajJ2On0hfKbmSGlY+JmqBtddsob5Psf
 04sUJG5nybaJvmbXpG1IMujyduwwh0rADMwCw7armn71pRQFml7tO4qrh
 V37n/YPwtBM13Crqqt51IEJ63POmnBhsrnGuzRT6NvPZ/E5ps+E4W3HiD
 i/RHkhAXVWEcyfgg+NmX5+XeefHeJPNTgWrkqRhYN0IChe3zuRen61O44
 dQbI33IqSDuCtiTqFVJD7Md2B7LkRFLe/V2BenkFGRRMTOb2wIyWtGyhA
 cA4doQ0eEC8qB/BrvMs3RmtBZW8XRUTO4rIGyy4pQ54cy3x0mbD0L0o/X g==;
X-CSE-ConnectionGUID: y8NPjrhTQrm7sD2bPQ6ZHA==
X-CSE-MsgGUID: agFWO9ExQF2M3Uj4RyT+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1871628"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1871628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:45:39 -0700
X-CSE-ConnectionGUID: aVNo28xhRGyVK5ayAYzcQw==
X-CSE-MsgGUID: PgF73rGlR36aGfjYpA5LAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5568549"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:45:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:45:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:45:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 22:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgusj1CIb+EYkXv6q3jq7r2y+A4Fl8K69tML7Q0eu3k8E8qkQfW8GNIUdftK0EtalkwCUwvmdgGtUVBC0XOrRPVjz066yvH06EjPQAop7Y6pQRMGTXenrfaUbmZMzTRy4LPDmhTr34iurnk4h6lCSNEfKpCHuNGjOie/A2EHd3D5MzpZrQmxeb19zez/pqjWKoiSuNi0NGPmkNQsdB1rukZj3ST8LXuFKqXEoad4inLbOQf4BOgS0n/IBQVOUIeYo+PmzcFWtVClGwcMHsnBvDhwr3yVHakdSlu3HHHPeyFLL3B25vrlTgKLAe1pM24N4rSOy1Ci5BHJFY/UIQkmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HOxK6V/iYEq64NQ/l4j9IRc+SR6I180POXrvV1Otyw=;
 b=fA8xxC9KV9mS9FtJ5QoN7EmNCt4pv/oYdRrb7c/uBoNQDPejF0mboN3/hOGqx4SArIS6qYx7pbwOMCJzX8h/K9TKQp9Ec8Qv+bZkw6qI+j8Ado9NINt2kFDz77mr333y0B9ePUTA6ssRPXKPVRsh82tjJoq1N7A9pb3DpAVXzNxRROD7tCQP9lHVKLPmvnmNfBfx//kY3kco17X6UPSsiiFgQ8cLBAs7YruMXsHqI2CNzpRy7paydQAZK7F2yp2s0I+tdNW2ON8MS7aD+rnfvq9FXTI1P0ya/gVnd+Pp3FwL5VR73wSxj/kQgQvvTcSsX6tgarsPSSxsHgcy7M7xRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:45:36 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 05:45:35 +0000
Message-ID: <40f75b8b-a04e-43ca-a79e-c9c08730fb2d@intel.com>
Date: Thu, 29 Oct 2026 11:15:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/xe/pcode: add ordered write batch helper
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-4-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::13) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db25b3e-7085-4f13-63df-08df357fda92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261028144727099003|11063799006|4143699003|56012099006|261026140227099003|261009223027099003|261022105027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 85AwwrzV7/vkyHGVYw2xY61k3EBaN0T28pH5i+mFgVg5hLU77nm1D5/B/TlshwLZ78nVoR8t1qWom+3FegM22sTndts8rROIjrQoiogERmu+psSmWk8fduQrJZzAes4cilKsSr7Ux3/RFz9EIXetfK6JaW9D4G8csfg0H6Hw+5aG9PXBnA42FEnqAQsdC9uk3WsXhPtBUcabYazmT+EmMRGXpFNlY6t4CxeecmvUZ5EKUx1CF5Nt0SqIE2Ano3V91mYFPFeE0VW1Zzv49I4rPH18dM8peijAjCzC+X6VvXSbmZQ6OfiJSs5FtxcN1goO8yiQF33gyvPQKtbtlAwcbFUqMAyxKXLQd5bSBYr0cJYoQZNY7QdpdKoVkRBBzl7CAch5P5m8GxgK4c9NG/hvnuDFoX+u6Ok5ADdVi0CeKLxx/3qI1GAlp2rt2hxg5evSAGDnQFH13U/OD0ffSQfMAF3VK2gvU0Dh4pha5qc8b4WhcxbH0qb+gaPrXKfdXRsKNjD3isIq9DuOX6usZv1qWQyV3VHXVAYYXXSKZ0hR2VEwu6SOlws1UD6oZkyDt4EblQmwzyhukTi1U//gfoI3Q9UaoOtqI+k7T3l+qzNE7bdDFF8ovU3pFlLThjxaRjhH0IdWCFYFV94fZ1mfY6RY3skUtdVqKc6HvI/ALhV6jVE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk1oSlVlVlo1aGpDZlJUaUgvZ3N3dE8vNlBvM2xpOTVOdzdQZzdUdEdzY2da?=
 =?utf-8?B?V212dFdyUks5NVNzb2NzQWN2eDdQdWNmS0FFZ2xrQ1pNL0E0WE5uTjk4SDJl?=
 =?utf-8?B?alhPckR4enFERnoxQjJPb3hCNmZiVTk0dkxXakJzYWwvbVdiYWg1RFNTV2Ry?=
 =?utf-8?B?Z1hjRDBpeGRlL0YzRFgwTzFTdHRMNG9ENzVKOFhQaDRrQWoraUR2TkhubGx4?=
 =?utf-8?B?WWVjSzdwaU04YzZ2TDNsMFpZOUhBNkpCUWg0TFdSd3N2RDhXb016cExxdGhN?=
 =?utf-8?B?L2NOZmNtWVpTSFJIQVdvem13Y2JlK25jYkRyMjJTV0FYenNUb2hRN2hNb3Jh?=
 =?utf-8?B?dVE3NkxML1NQSXFhTlRGbFlicENsdnZVSmpZdk1XN0kvdzNTNmErVHVZTVB1?=
 =?utf-8?B?ampPaXdtMi96b0dQUFQxcmRSS0ovV1dVZXpDZUxBZStOZEZtcDl5THllNEV2?=
 =?utf-8?B?eGo5ZTIwZU9aK2hZT3RialUvUUVocmxacEhvZ2RYWC8zVGh4ZG9tN0lPdldB?=
 =?utf-8?B?RFRHTFBsckNpb1Z5akxjZFVFbnRQM1h1NGF2byszMW9vYmZPWE1BamFSQ1lJ?=
 =?utf-8?B?RGgybVVZbG5QWHNiV0Z4NjRlSktpRUtub2FEdkh6NUl5L2g2UGppSE04ZXBL?=
 =?utf-8?B?OWg4SS9tN3cvdUE5WlV1OVFOS1NFMWF3NmZxTFJFNEVXRS81d3V1WFpSc0U1?=
 =?utf-8?B?NTN1dlVobUFVc3VjNnNoYm9paExWd2ljd2JnOHcxNVMrQ3VMRDdUajA4NzNa?=
 =?utf-8?B?MkRNeGxKRXBEQUpGK0g3MXZ4aGN2TFV1MFZsZUQ5SkFvVUk0OXhrc2RUQ1Uy?=
 =?utf-8?B?SlJsMmdZN3c3NnBuNFlucmJCUVRJTHI3N1hsWmNYYzhhWTBzUjVTT3c2dTYw?=
 =?utf-8?B?RW9sdWgrZFNCZmJoRkF0ZGR5R0FnMGZ3d2VYZi8yNDFjYzdKVFh0VDd4VHBs?=
 =?utf-8?B?UWxLcnh2VDVGYW0vVnNUbE5wNDlJQWgxVlFSNlNNU1IzS1RmTEg4VmtvbFQy?=
 =?utf-8?B?OWlZbGcrNS9LdUlLTS9KakxvbmlIQ1NIdGVRNENGbU01OHVYQm5QenRPT2NC?=
 =?utf-8?B?S2wwZkJMWHcwcTVjSFNlR3hNQzVxd042NU5qMS9xTHN0OEtDcVZ1Z3hWNm4v?=
 =?utf-8?B?c0RQMG0rWTh3UUUyVy9sR2ZFWmp0Z3BzUUdjNWtTK2FBQlZWa1hyWEQ2R09o?=
 =?utf-8?B?R0tpRUFkYUJRWUx2eFpmSFpwcWJIc1E1T2MzY2xaMkJzR2FPNFFtK2grS01o?=
 =?utf-8?B?T25WSHRSUGhBWWNLYmhZT1FLdUxkL1lPSWhvdnJqSWZPVVJXRVA1L2FCM1Z4?=
 =?utf-8?B?TTAvRjBMU2lRb2N1dGp2aGhscUU0Y2FnelFVV29CbGsvOHFxYzAyRWRmYmJJ?=
 =?utf-8?B?UHQzQkNDNTg3c21sM3FTUmErdFE2VVBFZmgyWUgxSHM0ckM3dHc3MEFRdjY1?=
 =?utf-8?B?dzQrWEpTTnJ6QThkL0ZWU05taENHcHE1c3RoM2gvNkI5c2FIck9NRjMrWXZn?=
 =?utf-8?B?NzloekR5Zi9TQXNpd2N1T1ExZm9Zbm9wUXJXN21hZU5QWU1ZU3VBckpqdDMy?=
 =?utf-8?B?Y0FrbUdXL3ROL0txamZRVExPcVNWNm5vY1F4cFBvc3RmWkVLSVBtR3hTSVVQ?=
 =?utf-8?B?dzNqMW9iZ2d3ZEt4VkYxejljZzRkcmI1ZkN1cXdneWltYUluTjNxeWxMS29P?=
 =?utf-8?B?bk9YTkh0bFYxZ1h5UHJtc2pOUHVZdjB3MXZkOEFFb1UyWHlNQ09DTzEwZUpO?=
 =?utf-8?B?NEtWKytjamRzbU5BSE10em1PR3BRNmpWZDZUKytydFNaZ2JHdEdEWWVOc3VM?=
 =?utf-8?B?aEEwYWpnbUhnOTJqdjlFdlN5aVZETU9VeU9wWW5ialFVRWxYVHFGWkIzalpH?=
 =?utf-8?B?U0VxeVUwRGlWakF1U040MS9Ia3dlRURsWFJHUVorZS9ucTlHaUhDOWhpK2hD?=
 =?utf-8?B?aGdYUlNaM29IK0JLdjZwSEtyejh4QmhnODhjenhRVXBvZWlSZVFGbUtkWVVx?=
 =?utf-8?B?U0ZJdnBmN1FwdmF2MDhnMGdKL1ZNRFhERk9tTUVFMmlaT2U2RlJFRzRyMWZ1?=
 =?utf-8?B?SE1KTlNwRGxSbk1xSDNmOXB5SHp0VHRIeGdkM0JrYUUwNjRFcHhRUDFPNkQ1?=
 =?utf-8?B?MlBHWHZpWXRpbFM1TUhtM3R0MEtEbGtsdU82V2NvMWNvdEJkNzVzeG52dDdr?=
 =?utf-8?B?Z2hvM09aRWJ0RVEvYjE1MkhxeXZHMDJ4dDRjSFJqcjRuS1RySHN5Q1JyQ2xv?=
 =?utf-8?B?V3BQdDFYYnZZeHV6WGNpNXdDWmMyNktFaXRCRFIrSVlLclpLRVVnOVBJSWRG?=
 =?utf-8?B?Rk9hWlI5NkI5KysvRXkvenF1L1VPL0J4WG54aXFlQ3JLcCtCYS96MDFDTnNJ?=
 =?utf-8?Q?xg+SkkKJvND1iQbg=3D?=
X-Exchange-RoutingPolicyChecked: rYGiLP/l+UgYiuBvy8fSi1dux3hJh51JEn+bnbqIc4R309YoA8cpA5QyKK3OYQjUZijctjUqu+/sWwfnA2BKfugbQwo8u8510r/lOhNA+uZCPJbPcbNTE6FafL6+rS7Q0HSsf9DKScVBfntcyVUZDQMRco31UWDqGVc+ZaqBysTR/ecPTDuXr0DhLHgRr6bi7GWW2vwIeOFRyXfFjc5lj8XXanJmdpwpKB6UYG5WynYloL0V/ofDeURGAvkyljE5lvVHRY+787UJO7c6QsK/r/czbhP4ifHWEsHCQdsfoqixxMJ7plOoqNpQbO2aLXEwDV3uDk+HG9lPucm86hmhkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db25b3e-7085-4f13-63df-08df357fda92
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:45:35.7646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRTVPiBDCQm4rqIyg0up3YH8613smCcjPPJJFSUs4mnIlRtJUPYlN3CdJL1j9TWcb4QuS7R5Y2j8ZuCViOs6Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Provide a pcode write helper that keeps the mailbox lock held while issuing
> an ordered sequence of writes.
> This will be used while writing the fan table ensuring that is not
> interleaved by any other pcode mailbox command.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pcode.c | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode.h |  7 +++++++
>   2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 266deecbb100..ca107b0234d9 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -124,6 +124,26 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>   	return err;
>   }
>   
> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
> +			 unsigned int count)
> +{
> +	unsigned int i;
> +	int err = 0;
> +
> +	mutex_lock(&tile->pcode.lock);
nit: if count == 0 then return immediately without acquiring the mutex.
> +	for (i = 0; i < count; i++) {
> +		u32 data = writes[i].data;
> +
> +		err = pcode_mailbox_rw(tile, writes[i].mbox, &data, NULL, PCODE_DEFAULT_TIMEOUT_MS,
> +				       false, false);
> +		if (err)

Use a debug print in case of failure for clarity.

Regards,
Soham
> +			break;
> +	}
> +	mutex_unlock(&tile->pcode.lock);
> +
> +	return err;
> +}
> +
>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 7e43792b0037..74bd553ab390 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -18,6 +18,11 @@ struct xe_pcode_version {
>   	u32 engg;
>   };
>   
> +struct xe_pcode_write {
> +	u32 mbox;
> +	u32 data;
> +};
> +
>   #define PCODE_DEFAULT_TIMEOUT_MS	10
>   
>   int xe_pcode_init_early(struct xe_tile *tile);
> @@ -28,6 +33,8 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val0, u32 *val1);
>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>   			   int timeout_ms);
> +int xe_pcode_write_batch(struct xe_tile *tile, const struct xe_pcode_write *writes,
> +			 unsigned int count);
>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>   			     u32 data1, int timeout);
>   int xe_get_pcode_version(struct xe_device *xe, struct xe_pcode_version *version);
