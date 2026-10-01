Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58619CA5FB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABFF10E029;
	Thu,  1 Oct 2026 11:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTuF85am";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7896F10E029
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790854065; x=1822390065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=92/HCBAWys8olbEFaAs60oDOz8n3p8dfyu0CSP9YlCw=;
 b=QTuF85amKleHw8R4LdhePS7yNgii5MvvNRZPwfJ1HEq5FXDydLpgCaFj
 IThK5qPKSx22bYM+GSOY4Jd+T9moxgFDFdxD8fYl6MtUy6OdZhytUJ/00
 17PcC/y4/JpysGXZOOEf8oFsHk7kCUGtFTPsfh/soHYhem+NQouqkqS/p
 uyIC20K/GZVaHpXgbyneaGmKEm8Ie2lxEUBvgF5aF7KBwODEvM6CeoqQT
 k880vl1oJQ8Cf1aQ5IGuZZB/0zukbEQODbZRsx+z9qFyhYaJ4WMWf8kgA
 J3DHPe7TDvlD+hCu3VxbcUmQM4hr2aTE0QtuwuIgRWuv4t3/oizx1BXlu Q==;
X-CSE-ConnectionGUID: clOnWU3aRWiWkZawZP6Imw==
X-CSE-MsgGUID: 7Uz/hI0eQRu71myQjtfb8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="109089905"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="109089905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:27:45 -0700
X-CSE-ConnectionGUID: 4VCpRW8BT8i2r2tese0jYA==
X-CSE-MsgGUID: O32DiBrrTUiEoB6kuZDLXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276095084"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:27:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:27:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:27:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nR7krsBfmu2YZE8AV0rlCWMv8w5XhY69cLYcyG1IXimsSKMcvN6qQhzvwKuySqKx3eX/U9AAB8biB08tLQRQrqOMjSpod3tcl+QCsis89WTiBLoi9ck4u0DoiHYCxrXoQqQvu9W0PV1VdJx6wIz4nDnACYq5D7lagx+w5oMHzwA6267EnwRTaTFFzIZV942snvVyIDrVR59l+fJdNpKmZRIUr9sC4ROp9KoeBOIaSwrjXsfxv4HnhWj/+WoRGRo2vyDGQeg6XuU2FhvEnglcG7KMlQDDNOGEOqIk1jUWUw4UdlPHGS2IxEv5k7ppqFCGDNtx2YpQzO9yhMXLWDsELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuss5Hq90VgIJhwq2Ot4VuN48hdPmXKLlXR47VRKoUQ=;
 b=D1vaGI3hQ22LC32SaHi86VsDDspihueo3wThqxmO6HF/Gx6Mt3d2WAWoRWDMbANk5v8mPHGy04B8ryUnyf+BcgCW6/Y33AxA2d0H/gGxwnXAvcaNnGVBmAtp13BI+DX5PdSYtgHsu91685fdWT24irkNtlbpRT1m3Ipahu8lJHu8LfM1XMi1EWffmp7hf2kcjaTmTLUX4yIlwjwxIvn83G1ZIpvRTgfazoMMzjGuTv+p9bb5ueWtcvY+2vbbRB27fRrI+vpOpQgNnc3abTjxJqiUukBya945xyb8QtwE7AQfAPjE1gl4ivbwwcLrwtE4mRGS4LZdfMY6tZ9b7pY5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.25; Thu, 1 Oct 2026 11:27:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 11:27:41 +0000
Message-ID: <6dd4ef72-8932-494a-b665-891ec9f5883a@intel.com>
Date: Thu, 1 Oct 2026 16:57:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-9-riana.tauro@intel.com>
 <DS0PR11MB8718E18BA3CC0C1AE04E7B3F818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718E18BA3CC0C1AE04E7B3F818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfc599e-96db-4a75-caeb-08df1faf00df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: otHXLDhSMAzU6WcQHihMQD/Sn+afj34OqmqVzW2YcF57WFmqT5wVGJtFNNw4VeGrq/vTfK4gYlFKtHj7giRLJzq6SC8zRQOi2OPXcnb0tW7cYV1mVipzOmsq7CmTzoBST41noxelLkihL39Y2qpbkuXen+MYmg24phidQYFsYt6FE9a3+mWHaUSk0XpeGxBQck9EGYV6S2OPtrbaTsiOnbpkiQ54qm8bgmYguFHBWXacSbP8H2gjlmH0wGWnt59XOdghhO6uhokm6NOSI+yOz2tR5LMCtm5M9BVb7S28kM3qr1mZUC5FJ5KXn7psDdF4QI3FP7+AEIWcgklMUu0RUL6JWHFMT1C8gtjmYei1F8dEbpLtNdc2aJLagBFQtyAYahDWSNjKUNMZCyJ/qwk1zBZfM1vx/YScx818CecDGHC2Jdzrjxc+AiFmafxu3c/SeBDs1u5RvPv60cwXqT4xqNNIYn5A/4EjIFGRsmc1ZHog7dafsIQRhU5dGwAc9DotmOtfJcxs01fCFBZI8CGHD6tMmJeEEAM4o7VzciCza0+Yq9lRfyE60naa2NHCkEEdmNR5GL9jHgKqBupSNLM/5yVzYP6uCvSQVcxM45Rww+2A3K6DjqJ5vdJqYf1I/UCiqEjcNwl/JY0Ez0x8Kx7s3G6i/0MSfp3ruA4yGee7/CU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFEvZnJvM2NOWjFzYVc4RUQ2OGNrNUVZS1ZIYjJ2NHJxRWYvR2o0V0FyYWlJ?=
 =?utf-8?B?R2NZSCtSR05CbWtGQnd0S3hCb2czd0p0Z0plRzcrWXg4UUpJb1BvZFZZZ2Zn?=
 =?utf-8?B?czdPcThUdlVJSVJwempsTHZqcW9nSy9VcVNqeU1ZRUYvd2RCUmYwekd1M3JG?=
 =?utf-8?B?enRFNE0vU1RQZ011SjZTNzhYNmFtQ25TY3VTbEhIV2txNzdmSGdCUTVzRzFV?=
 =?utf-8?B?ME9PckZ4eXFudk1iS21KY2xIWitDSG9yZWFMcm1FZjFPM1d5OXpZVTY4aWVw?=
 =?utf-8?B?S0NXNzdVenRGNlVzcVJodXM4VGg3eFA4eVBnOUE4VFpXYWZvOVp0NXJjTGxx?=
 =?utf-8?B?YUlvc2JieFZHY2NMYVAxc1hLZ0ZxRkJuR1lEYWdhOEZ4M1o5dlBmVzEzNThO?=
 =?utf-8?B?QXJYSy9KQlpmSXBodVJjcW40akJIQ0ZjY1QzN09hU1I5RU5BVHB3dWJNQllF?=
 =?utf-8?B?VThiYzE4N28xeUx4YlBRUVNlM0RzZDJRUmI3OGxoMDVQZ2VYdGRNWFNpQ2ZB?=
 =?utf-8?B?aTQyVlFLT2luS1J0d3FDN3VORmgyQWNyUTU0UEtmZDVPaVRweUdnVE5UNkll?=
 =?utf-8?B?QnRBR0lSc2FCYVpYZXBhSW9vcWM4ZUh1SzhKNUpwbEFseCtKVUJ3QlJEYWNo?=
 =?utf-8?B?Q3JsVTRLcG9FQUplRUQ4cTYyQjBzQXZJS2NmWFpiYno1d3Z6bVBpUUxmUUpi?=
 =?utf-8?B?eER3S1hudDJRRXdrR0owSDdId0tHbXdGVXMwOXFnMTNIL0ZjR0pOWnFMdk51?=
 =?utf-8?B?RG8vMWRPdjYyM1pTNkZKei95a0g4S1RtbWJKenJXeFBkOWhwUG00Ny82Y3I4?=
 =?utf-8?B?UEJzZVhLMzIxUlJYVXpGU1BiTHVabGp2OE5HeDFxMy9TV2JpNHI2amtHVHhO?=
 =?utf-8?B?dTBzSm9CNElxN255L24wTXl0cStCZHRaUXVCL1NhU1JFTmRSNytjN1crdG81?=
 =?utf-8?B?RDY3VUREN2RQaU9EdUJ1alJEaUlhZkwza2h0MDIxemE4aDRiUWhvREJJRXJn?=
 =?utf-8?B?cGtHNXdrU1I2S29Dd3FUL09PTjgrbXUzT1c3QkRLQ0ZDNXJLSHFNZWFBTy9E?=
 =?utf-8?B?dW9rdkRDWWZsTVlkT2FSSlRHSmI1K1pTNVgvS3gwNE5zQVVNYS9Gai9hL1o4?=
 =?utf-8?B?N28wdmRRM2h3MUNDWmxCNXpPYldIQlhvTkt3eE9LYVpBTVJ5eFZyOWRLejUr?=
 =?utf-8?B?M1MwbUVQenI3eEFCNGtLdzlJMktZdHpqSitLcTdPN2pjbldkNFRTYmkzbTJO?=
 =?utf-8?B?MnRTWEYxdEVyekZXMFBXVHR6SEZ1U1Z3VzYwanRHR2VzU3VvMXVxak94MmF5?=
 =?utf-8?B?V3IzdWRFcUtIZmFrUDlJU3hFbWxlcG5HTnQxOW1PMG1oV0xIMHRRakppRmtN?=
 =?utf-8?B?NCtmaTMyTjByOU4xOEhOcEY0cExrZFFmb1M3TW5mMEkrRFFsWnBDU1A1TnFy?=
 =?utf-8?B?WXI4ODBmZXk4Q3R1VCsyMTAwUzkrZi9BNUtMb1lpYVJod0doc3dJdytFdjRu?=
 =?utf-8?B?bUJFMFRzS241Y2lTRVZ3WDRiRWUra1dKYUFtQVR6bmlodU1lRG0xUTYzSnU1?=
 =?utf-8?B?SWJycEp0UnNEa09YVGdCaE94YjdrZUpjTENiR3lGRU41MEZjanF0WG9YUWU5?=
 =?utf-8?B?RWlQdFN6dGI2MlJNQ2hVSEtlSGE3WTJsaUNtZEJVaWJxek1renhCN2NnS0Vz?=
 =?utf-8?B?dWhXbTR5SFRIYUhCTnZrbU5yVWdkOTg3QXgwa25YM2RmTjFCajNTbzloN25a?=
 =?utf-8?B?dkhYV0szRVlNd2IyQVVMZW8yd2RtNk1VVmNpZzZpci96RG5vMFFabEo1cVAw?=
 =?utf-8?B?N3dlWXl5c2Z1TVVrNEFlNlJCRnNDS21QSFE3RTRWcStCUytQMHpXUDlvVHVj?=
 =?utf-8?B?TWpxMDRtWGJpeWRPdURzTzZlclZSd0o4WFBKbTlRaXhIb3NjS0VHQWhTREZq?=
 =?utf-8?B?MVVpQzlwWGJKVTd4K2thRkhRY01VSmY1aDhVUExlbFRVMmVMbVN0UkNtMFlD?=
 =?utf-8?B?ZHFFdmpoNkl1ZjZVN0YwcXJIc3ZYdHdJUFNZK3d4UTlVb2wxMC9SdDZtTUZr?=
 =?utf-8?B?OTdIVEYyczE3d3F2MXhiSmZacXRyUldBbjdqaEtEVGcyRG5IRVVmWGFhWk9F?=
 =?utf-8?B?MjRNL0ZVaTNLQ2xzQ1RPZTFhQ3NhVytJYW8rVk42UjBrUi8ra1liQzZnMDU2?=
 =?utf-8?B?S3BQMVNoZCtzWmdoeTZQd3NBR1IvYlB4eTAwdGJ0MWprM0FSYmpmcXkwa2g3?=
 =?utf-8?B?WHZ0aEhBMWdodUxDZDFuYkgreGJMbmhDeUZMb20yeThlSDVIanVRcmVFUWNH?=
 =?utf-8?B?Qm9pdlAwYk8yYk1ML0UwTWFBYzJQZ3YvaEVCZllsV25iQVBJbVpRQT09?=
X-Exchange-RoutingPolicyChecked: H+CxD20ABPe3qzpWcea09OU4CVgQIKfL19dRDfJ5iQM5wgwZOIN62Ks1OJF28lL6E3UfMHIpSwm4Kapg5kDuSN+tWx1EMJMz0NTCWapD58wKI90LGX99FtPDbp8t/wUqqsG4kEj4/zBIyLStz/80OUvG8Md/vSCURSWVNJ9wlrzY3GACZ0usJvEZzKSH3M6MXDWX0p0Lsqba6WSh/t3wJGHzih2rBSg4T9ur0GHLpPcxmjfPP67Wn7pV99DRTW6GRWKF5zn4oAlDybGq34n4HUZmiNHqV1U9UFAzaFF2T64Bo6gzCy7s7v2beP6L5LieREsRIeH7pJfeJsKmpNpDuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfc599e-96db-4a75-caeb-08df1faf00df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 11:27:40.8115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /V/U2yfQ+/7n7BH3liULMHoektIKaKOjnYX7qXfWODvYIaxFtgO3+jrnkZJOTdZHOpA1XbfYvzG8jg71HMQ8mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5971
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


On 01-10-2026 16:20, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 28 September 2026 11:49
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: [PATCH v3 1/6] drm/xe/xe_ras: Handle page offline requests for
>> device memory ecc errors
>>
>> Add basic support for sending page offline/remove requests to system
>> controller and use it for device memory ECC error handling.
>> Pages that belong to critical BOs cannot be handled by offlining and require a
>> SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are not marked as bad by
>> firmware.
>>
>> For all other valid page addresses, the first occurrence of error indicates a
>> poison error and the page is offlined only by software.
>> Firmware avoids permanently marking the page as bad. The second
>> occurrence of an error indicates a Double-bit ECC error and the firmware
>> permanently marks the page as bad.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: use ret in sigid logging (Mallesh)
>>      remove additional log
>>      use xe_assert (Michal)
>>
>> v3: align address to PAGE_SIZE (sashiko, Himal)
>>      rename decline to remove
>>      add more descriptive logs (Himal)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 127 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 159 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 7a85735c57d5..1225c561a872 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>
>> +#include "xe_assert.h"
>> +#include "xe_bo.h"
>>   #include "xe_configfs.h"
>>   #include "xe_debugfs.h"
>>   #include "xe_device.h"
>> @@ -16,6 +18,7 @@
>>   #include "xe_sysctrl_event_types.h"
>>   #include "xe_sysctrl_mailbox.h"
>>   #include "xe_sysctrl_mailbox_types.h"
>> +#include "xe_ttm_vram_mgr.h"
>>
>>   #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>>   /*
>> @@ -201,6 +204,119 @@ static inline const char *comp_to_str(u8
>> component)
>>   	return xe_ras_components[component];
>>   }
>>
>> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>> +				 enum xe_ras_page_action action)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	xe_assert(xe, action < XE_RAS_PAGE_ACTION_MAX);
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
>> +		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to
>> offline page 0x%llx\n",
>> +			   page_address);
>> +	else
>> +		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to
>> remove page 0x%llx from queue\n",
>> +			   page_address);
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +				  &request, sizeof(request), &response,
>> sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline
>> command\n");
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_log_err(xe, SYSCTRL, -EINVAL,
>> +			   "unexpected page offline response length %zu
>> (expected %zu)\n",
>> +			   rlen, sizeof(response));
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret)
>> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with
>> status %u\n",
>> +			   response.status);
>> +
>> +	return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 page_address,
>> +bool send_cmd) {
>> +	enum xe_ras_page_action action;
>> +	u64 addr;
>> +	int ret = 0;
>> +
>> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> xe_ttm_vram_handle_addr_fault() itself asserts against PAGE_SIZE, so it'd be more consistent to validate against PAGE_SIZE here too.
>
> Also, please have a look at Sashiko comments if applicable.

This is firmware response check. The response from firmware should be 4k 
aligned.
As suggested by Himal i have aligned the address to the nearest 
page_size below to be consistent with xe_ttm_vram_handle_addr_fault

For sashiko comments

[Severity: Medium]When xe_ttm_vram_handle_addr_fault() encounters an 
out-of-bounds address, does it also return -EOPNOTSUPP?
Will add a configfs check before calling xe_ttm_vram_handle_addr_fault. 
[Severity: High]Does returning 0 here mask the error code from 
xe_ttm_vram_handle_addr_fault()? For -ENOMEM, i can add a ret. But for 
the rest of the errors, triggering sbr or wedging is not required, 
Thanks Riana

>
> Tejas
>
>> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page
>> address: 0x%llx\n",
>> +			   page_address);
>> +		return -EINVAL;
>> +	}
>> +
>> +	addr = ALIGN_DOWN(page_address, PAGE_SIZE);
>> +
>> +	ret = xe_ttm_vram_handle_addr_fault(xe, addr);
>> +
>> +	/*
>> +	 * Handle return code from address fault handling function:
>> +	 *  0: Page softofflined, remove from firmware queue
>> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be
>> offlined
>> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is
>> not to offline
>> +	 * -EEXIST: Address is soft offlined but yet to be offlined by firmware
>> for second
>> +	 * occurrence
>> +	 */
> -ENOMEM - allocation failure; next action is reset. --> we should reset on this error.
>
>> +
>> +	switch (ret) {
>> +	case 0:
>> +		action = XE_RAS_PAGE_ACTION_REMOVE;
>> +		xe_log_err(xe, DEVICE_MEMORY, ret,
>> +			   "Poison detected at physical address 0x%llx, page
>> soft-offlined\n",
>> +			   page_address);
>> +		break;
>> +	/* User policy set to decline page offlining */
>> +	case -EOPNOTSUPP:
>> +		action = XE_RAS_PAGE_ACTION_REMOVE;
>> +		xe_log_err(xe, DEVICE_MEMORY, ret,
>> +			   "Poison detected at physical address 0x%llx, user
>> policy set to decline soft-offlining\n",
>> +			   page_address);
>> +		break;
>> +	case -EIO:
>> +		xe_log_err(xe, DEVICE_MEMORY, ret,
>> +			   "Poison detected at physical address 0x%llx, page
>> belongs to critical BO and cannot be soft-offlined\n",
>> +			   page_address);
>> +		return ret;
>> +	case -EEXIST:
>> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +		xe_log_err(xe, DEVICE_MEMORY, ret,
>> +			   "Double-bit ECC error detected at physical address
>> 0x%llx, page soft-offlined\n",
>> +			   page_address);
>> +		break;
>> +	default:
>> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle
>> address fault at physical address 0x%llx\n",
>> +			   page_address);
>> +		return 0;
>> +	}
>> +
>> +	if (send_cmd) {
>> +		ret = send_page_offline_cmd(xe, page_address, action);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class
>> *counter)  {
>>   	u8 severity = counter->common.severity; @@ -368,11 +484,12 @@
>> static u8 handle_soc_internal_errors(struct xe_device *xe, struct
>> xe_ras_error_a  static u8 handle_device_memory_errors(struct xe_device *xe,
>> struct xe_ras_error_array *arr)  {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	int ret;
>>
>>   	/*
>>   	 * For memory errors, the recovery action depends on the error
>> category
>>   	 *
>> -	 * TODO: Double-bit ECC errors: Page offlining
>> +	 * Double-bit ECC errors: Page offlining
>>   	 * Poison and data parity errors: Log only
>>   	 * For any other memory errors, request a reset as recovery
>> mechanism
>>   	 */
>> @@ -384,10 +501,10 @@ static u8 handle_device_memory_errors(struct
>> xe_device *xe, struct xe_ras_error_
>>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw
>> address 0x%llx\n",
>> -			info->sw_address);
>> -		/* TODO: Add page offlining for Double-bit ECC error */
>> -		fallthrough;
>> +		ret = handle_page_offline(xe, info->sw_address, true);
>> +		if (ret)
>> +			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		break;
>>   	default:
>>   		return XE_RAS_RECOVERY_ACTION_RESET;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index fe6f3658a2a4..f119489bcdf2 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -17,6 +17,19 @@
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
>>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>>
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline
>> +request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>> + * @XE_RAS_PAGE_ACTION_REMOVE: Instruct firmware to remove the page
>> +from queue
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>> + */
>> +enum xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_REMOVE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>>    *
>> @@ -295,6 +308,28 @@ struct xe_ras_memory_error {
>>   	u32 reserved2[10];
>>   } __packed;
>>
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline
>> +command  */ struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed, see &enum xe_ras_page_action
>> */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline
>> +command  */ struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu
>> health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index c236e5377f30..a01576bf2e73 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -30,6 +30,7 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
>>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/remove a
>> + page
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -40,6 +41,7 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_THRESHOLD		= 0x05,
>>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };
>> --
>> 2.47.1
