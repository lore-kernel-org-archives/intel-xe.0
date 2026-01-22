Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB3C44500
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 08:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2483C10E94A;
	Thu, 22 Jan 2026 08:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXXwAk1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881C10E947
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769071260; x=1800607260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/dGxSDj0wAxHrNMmiilRUKRd7U4hv+hGomC3Qc2xOMs=;
 b=lXXwAk1BrNOFYZPkcb5Qu1R7lq7nS7WrKa0NlAt+mZTP+OMQlxs+8vu2
 2H1Kcah2YrJimkR8/vP0IIvPPtTyz39djWhcDDjulw4do22Fa1HK67XZ5
 ManDrIAgnwFy88anwj+WD8f2zchHGUeqcVenD2t7nKv24+zyYhye67P7x
 6j9HOq3XJ50OYkj5J+2UkmMGgDtZVYBSLJUedq1Sv0L7UPUzn9VvqjABo
 3DBykJa3Ib90z2qrTqgeH31tPq9Uw9zVJRnEIRJnJysIxz2kiRnCl6vyh
 KYfQC8UJGKws7JKeIR1Pi9c3K6JX6DibICBtOS1yN7mcd2OT+Pkmi3kIP g==;
X-CSE-ConnectionGUID: phJo34iHRCezntUn20ia1A==
X-CSE-MsgGUID: xNyLbd5UQaqBeGRJhucVVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70279397"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70279397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:41:00 -0800
X-CSE-ConnectionGUID: 91p7AMbnSryxFv93H/U31w==
X-CSE-MsgGUID: hhvh3GjETOmRqyAtSjuJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206491032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:40:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 00:40:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 00:40:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 00:40:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTPX8gNiqEEJBgsOrwzBFjDUYDLAKM0AtmJ4/eSnGv/VYm4F8jVJkXjPPrjBkm2wCbokPObAczQLMT7jOZOVl+B55czs2sxZFTiDP7wqkodaFWBjaqI2skC6EDe9hfq5EmKDepOESzjQ2kU6Qo8be7vQl68UIk3tKJHmS4gO6uuPEIlSX8EVqXVPE6jwkUafHOoO0dtrUqOYBldmRTVVaforOLQ89kMTM3Q6zfQwcJrzUNB88BSDULP70AU0aZcNW6Fg1KMyEPGzQVutSZCyHYTy0boY+ubzM8XhlQ3Y8aR/3J7MkXxQFTm0xAOZZZm/ml8zW8bRFSnlIPjxuAqJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7ElSy91y2rlzIuH1+8nOFHesZy0xrDQCpL8Ypqk90Y=;
 b=Jn2zRXvkEpZuqrrRwDL3tQsLYh2jRZLXFB61hn/4I40jyA6Vvyjt3GRXLWSaqJUp7rzuVq87WVaClqtSjAyM8FqV8SQQqQKtbxbKpPlimgzv4HFCcdjog1yIV9CKeXcrGyTFm/wdjQSPHs0D+c6Pvnu9CY8AyK2UUS/JRaUbun2OA899TCL4HaQ+Brwxae1t/VGHvAa2wcnh6zTV1vcJB6wSSbWf+tT1PWAqqdZ4mlJN/rOXwxfaDKeXLgdzH9y5oljY4t64xDpqjtHll1h85rBFdANQ4lSAd9T4vs8uACgw/12Ny2GImENCd3AVceoyotlAMQigKCoN9KbaKjneoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 08:40:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:40:51 +0000
Message-ID: <5cbf9e22-99b9-4a89-ac51-18110109cbcd@intel.com>
Date: Thu, 22 Jan 2026 14:10:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/xe/sysctrl: Add System Controller mailbox
 implementation
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <michael.j.ruhl@intel.com>, <paul.e.luse@intel.com>,
 <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260119132938.2173032-8-anoop.c.vijay@intel.com>
 <20260119132938.2173032-11-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260119132938.2173032-11-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0069.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 171c2136-2c41-4dce-fdae-08de5991f2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUFaSDlOTVVJVjdlWDZPYkIxK1V6YWJpRzh2R1NpeFMyK1l6R0RpS0VxdVFD?=
 =?utf-8?B?enJwR1pDOVI2UW5WRS93ZUxHSmo0cTcvNlV1VVhLQVJQS3lOSUdQbmNZSDFm?=
 =?utf-8?B?NkcyYkZBQ21XaGdBWkwvRTFuK0ZPbWJUbzdwMnlZZjBxdVI2dzBCdVlmb0hm?=
 =?utf-8?B?MXozWWJVdjMvbjB5azlsWjZzNjRZSGlRQ0VuUXB1cHZGTERHbitacWVHY2py?=
 =?utf-8?B?WGdaVnFSRVNTNElOcTdFbi9DYjlFYzNsK1AwS3ZYdkJKU3lFdUs1b04yTFBU?=
 =?utf-8?B?b0xwbmI1UjZRM2hseWdTS2Vkc3IwTEtWTVk2QkhUVG1ZTlZGRnhONU1lbUwv?=
 =?utf-8?B?TlgvV3o2WVliZHNxMmpOTWpkbkxNaEl1VEJzNzZObXZISHBjRWNBMm0wUk9t?=
 =?utf-8?B?dlB4Y25RNHNPZ3JVYThxcVYvZCtTSDhVTm1HYXRSancxQzZTMnFkTXQzS09T?=
 =?utf-8?B?SXBKeWI4TU1LWUI4WTFDSGU0bDUzMXU2eUNXUEtIOUpyZ29oRC9jckFCNEdt?=
 =?utf-8?B?Zy9QazhrcTh3dXZmWkhYZWl3Y1FvS3ZocHBibzJEZEVvZkxUWTZqY1FuVFhz?=
 =?utf-8?B?TGY2ZXN2eGYwSU5BRWloSW5ZUG81RjJkMS8yb3FqdFdGbVZRMmlJTzhvL0ZR?=
 =?utf-8?B?UjIvcVdaYjVTejJUekxHWE5Nc3gyM2VHc2xqVVRtMDgrVXVTemIxWTIyK2sx?=
 =?utf-8?B?RFZVWkFPWjAvUXQydFJ0NUFRQUJmMWdGeDZSZEFnUU9TODRqbEhJWkZ6amZz?=
 =?utf-8?B?VE9oZERDa1gvT1hPVXdEVmluTkZ0bHpjb1dmb3E3NFN0NlNtMUtlQ2ZmQ3g1?=
 =?utf-8?B?SnAvNllKVjZFNTNuV2pTemlja3ArREl3ejZteElNSGcwdmRSMk4zallMeDZ4?=
 =?utf-8?B?eXpRaWMvL0VWQWUyNERHbDVTdTl6N0MwNldjSHZ5VlVOQ3pZcmRDVzcyL0VE?=
 =?utf-8?B?OVFkc3VwSURtYi82bDQ1VGY5d2VpTkJDN0hWYzNiOXd6SGdCZzUrTFQxOXdQ?=
 =?utf-8?B?Q2FaNlBROEI1N2ZYWW9yc2MvaEpVcFpidjRjZ3pJT3FBSDZvd1YxQnQrMGdv?=
 =?utf-8?B?c2h2SmtPekNXYzk2SzVjNHE2WFp4ekNMczJ1R2xmR21JSlhUdUJLbksyd1B0?=
 =?utf-8?B?TkJJYXJPR1R3UWxIWE5rS2d0NEdON3BNNUR0SVdhR2NhRXA1Z2svZUhDWVNw?=
 =?utf-8?B?SnRoOUZYSjdpdXU3N2p1K1FTMStBOThWYjVpT1ZqMUVhM1dDbjB4Zzc2RTJI?=
 =?utf-8?B?RzNWY3BHdUhvNUlHR28wUDBaVzBXOW9hdUd6SFBGQWlHZDJ4ZUJOaFU4aWtu?=
 =?utf-8?B?dlNCWlY0MUZ6bC9ISldwNjZwdUlwVG9OQWJRUXR2cWIrdXpjMU4xQysyb0px?=
 =?utf-8?B?MTkrVW5yQ3NpdDNoSWpuR2VKbUwvZjlZSS9UTWRGamZiQlc3c0JxUzREalRY?=
 =?utf-8?B?OTdlY0t5S053Nk5jN2svTU9ibVFqajZuVmZGQ3RKV0QzOWRuSjJZSFFrSWU0?=
 =?utf-8?B?NjNQT1BodHVUWm8xOW5WaHpWcGtYalAzNXRmR2l0Z0J1TWpBWlVSS1BmcFdS?=
 =?utf-8?B?c3U0MkNRREpXTjF6MThJL0VZWGZ2dWZsaUMxWmZKZnJzSUc1UGFOVVU5V2Rs?=
 =?utf-8?B?L01rQWUweVNMc3lGT1JEM3c4Z0MvcUVsUElaSm51N2ZpSUtGZ0k5TE5TQ2Nh?=
 =?utf-8?B?MGRkbjBscndGWmh3aDc5eDV3TTB5K2htYzVNcC9yUGg2Q000WEZxUzNhYXRi?=
 =?utf-8?B?S2FBQTdKOEswVm10VVNtb3pjS1F4REJBS1R2akorZEtqNDFVbXVTaGE3Zk1B?=
 =?utf-8?B?c2RaeTFiLzBxeUJVUHl1cUZzWFB1akcyUy9uU1lQUGs3WkJ1dWhCUGZpYjJz?=
 =?utf-8?B?cUJmSC96dTJ1T1FoaDhqOEljY1FLZjJweDJGUFFUaCtQaTQwck5ROW55RDBU?=
 =?utf-8?B?NHRPM1FWbEp0Rnlha0ZwbURSUktDYjFQRVg0eElUdytaQWlkWTVraWNLY2hG?=
 =?utf-8?B?NXpKRTFPWG1qRUJwa3BmNHFMNmRHVVV0RmlvcG5zSithSUU0TXpFbDJLTWxI?=
 =?utf-8?B?V2JvRytncEhuV0xvUjNWQ1p0MXhlRUJKeXFwZTIwK0kwRUpibGFOc1lMRUw5?=
 =?utf-8?Q?NGYI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUtXeElKUkRwSnp5V3pXZmgxdXQ0U1QzbGM5NEIvbVFpY09NWjJTckNVSy9v?=
 =?utf-8?B?MWttUE9RVTNNaUdhKzZDN0JRSnNtVXJJSFU5SGxtV2djWDZoRjIzYVI0aWpz?=
 =?utf-8?B?MU8wakMwUG1XazVncUF0NTNzY0cwUE9yWjRRTUs1cktUQnMwMWRVZFRDTEN1?=
 =?utf-8?B?THpvUHptTThNQzZPNGFZM0FGc2w4aE9vMzBjRCsxbFJVM0RJWVlLZ0lKQjBV?=
 =?utf-8?B?SWw2RVIwRDVwdGYyM2piMDJOSVp6aW5IREE0Q2d4SEdyaytJU0d2emYvZ0dw?=
 =?utf-8?B?emhSNFhwRDRzOFN2bG1keVB0b3p0K09OVGJYMytuZ1NYU2dhS3hUOWJnMHBm?=
 =?utf-8?B?Mm56LzgxaGNLcXdRdVNGZ2xUYldONi9KVFJYQnc5T1NmajduTmpMYU8vWXVp?=
 =?utf-8?B?dEZ1NnlZOTQyRkt2cTh0NFNWWU55WGREZS9pNE9Rc2szWEVpTWZpay96eU5Y?=
 =?utf-8?B?M1RmblpxREtJQjcxNGJnd3ROQVFWaXRJRlJ1ZG8vV1VERlFnZStwVFFzTG1z?=
 =?utf-8?B?b05FZ2ZmQVIzM3EzcS9mb0JCeTZGQXBtTzVHaVVsRFl2Sm5GU1Q2ZkN2N3l4?=
 =?utf-8?B?SFFjUzN1N2hhT01Mb3pDUU4yRWhFYnlNTG1FUEs5T25TcnJxMm1McWxSZXFy?=
 =?utf-8?B?UGd4TGo0YTNVSkhDOTcxL0lTTVVnKzl2NzVkNHBmUHlqWHBhUjdNVmhOZmNi?=
 =?utf-8?B?UlBZR1h4dkFiNmFSQ0kzNnIzc0JRd0xVM2lFQ3I4eW01MjFlVWxEckROTXlI?=
 =?utf-8?B?T3Zjc29namR5T0FMYkFEZG1kVFBHYm9ScC80djB3R3BrUzdzcVpxQkNzREVV?=
 =?utf-8?B?c0RnbmkzLzI3b3JVRndOa3krQ2pGNVVYbGJ1NGdzMVo0SU5XMFRqbjFqTXlJ?=
 =?utf-8?B?MEJHeXgranhiNFBjMFF1Uy9MM1lHNzZZdUdYSDRhY3RYYXc1M0pvVE4veFZp?=
 =?utf-8?B?UGNYbGljczlMOXlwY0dwRG1nY0MyWmIzSFFjdHM3RDB3c3BzbGpiWmxKaXhN?=
 =?utf-8?B?RGZaMm05UXFCb1ZzRk1ydXUvWUJENmhxV1BvTlBUWmFJWDZoY2ttYWkzcnRq?=
 =?utf-8?B?K0tZL20zYnNxQkJZV3FYekVCQVRLUmNzdlZNTVNXNTl1eTVBZlE0VE8xRW50?=
 =?utf-8?B?RlI4ZU9LbVhzS2tKcDZCVi8wandJQzBjaXlHZVFvVzh0NU5XWUhZa1gwZFFm?=
 =?utf-8?B?Ykx3T3VENW1SamV0UTNQU3NjbGdIWEJOWWFHc2Y1cWcxTUFjM3hBSGlmVkla?=
 =?utf-8?B?NXdKTkg1L0JHVE5vSzdwUndET0ZoT053UlRmb1FGNmRsd3JNUGM1RmFicGND?=
 =?utf-8?B?Y0RQZXZhU082MnRhYjUxeFh1VTJvM05wOVlNYmNHbFlBVmxnbUt0bk9CWHMw?=
 =?utf-8?B?cTZ2UXc1VEhESTRudGgzTVZGSWg2eVp6QTVkckpQTWhwYUREeXFxdkEwN2hK?=
 =?utf-8?B?S0VnM1RvOGxkbUxDcmpUYUpGaDYyWlRSNmdWTzRORmxiUlRGVk01YW5BQnRM?=
 =?utf-8?B?WG1ibzdKWUZYNncwRURWbCtsYUtzQ3U1K0t2R2F3eHptSk9sTkdQOXhlUWVD?=
 =?utf-8?B?K3V6V3BRdUJ4Mnh4eHprdjZCZ0twcVJxMXprcm1DWnZJT0FSa0N6UGtmNDNn?=
 =?utf-8?B?K2wrMWltQThTUkcwbTUwTkU5RG5iK0lsN3JnZUd1L0plL3BDVzlFN3Vyejkv?=
 =?utf-8?B?SlNpV1lPbFhyUFhyT2ovcFpmSlVaT1BGc1JuLy9VUVl1RjcyYTBxSFhyZnJF?=
 =?utf-8?B?VGV6QzBJOUo3V2x3WGd4a0o1K054Yy9JdTdhV1ZZTlZneTNCYXZCdHNUcEsv?=
 =?utf-8?B?RkMvMDV3UjhZbDhDc2l6dXR4aUs4TllBeEtuLzhOSVpnZllHS0ZGY01xQmhN?=
 =?utf-8?B?STRMdldjWFJvb3FHai9aZFVtT3VFWVRORFY5NDQ5S1RQdTJlNW9CenJrQ1FR?=
 =?utf-8?B?bEppeE1EMzdTakY2ZkRYUTlHMWNac0hlMjAzTlZCYU5ZUmFWRzFjKytsaTVr?=
 =?utf-8?B?aCtKMkVUc1pLRFU0Vk52dzFPV0NtalpKdXhiYXJvOHh6STAzbzVlaHVTSmlR?=
 =?utf-8?B?UHZVR1dWSnd1RUxRbG9YVnlzWEZac2JlSjl5aWNzRmpBY2FWNXNsR2JjSDY5?=
 =?utf-8?B?dW42K1h2WE9nZU1BTjByRkMvdlJnc0NnNW4ydmdrOCtqa1IvOUY3dGhLdjBM?=
 =?utf-8?B?S1pmOHM4ZjlPZWZjRG1MdXg5YlBiY0ZMcXpLc3ZXUXNtOG0yeERScjB6ZGZG?=
 =?utf-8?B?ODZOelpYYWNoUmdwam54WE8wWVdFU2lkVXZCQS9QRXpJYVNaVjAxclhIVzBL?=
 =?utf-8?B?SUVCVjJta3V0MFhUYXpqeiswQnUvNEJjeVQyajdKNWJzZkZoTTZzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171c2136-2c41-4dce-fdae-08de5991f2a3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:40:51.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNCs898jBCCRB1p4iHjTaTfWF/e7CnRIa96kCnCinfLKwNleMr8oZTNqBxmZm+mcrkNToA9rFbhHsv/B6AvXpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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

Hi Anoop

On 1/19/2026 6:59 PM, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Implement the System Controller mailbox communication layer:
> - Low-level frame I/O operations
> - Mailbox busy/ready state polling
> - Command preparation and fragmentation
> - Multi-frame send/receive with phase bit handling
> - MKHI protocol header validation
> - Public API for sending commands to System Controller
> 
> This provides the complete mailbox infrastructure for
> communicating with System Controller firmware on Xe3p
> dGPU platforms.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
> v4: (Matt, Mike)
> - Refactor MMIO access to use domain-specific accessor
> - Add input validation and buffer overflow protection
> - Add bounds checking for multi-frame operations
> - Fix potential NULL pointer dereference
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 445 ++++++++++++++++++++++++
>   1 file changed, 445 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> new file mode 100644
> index 000000000000..162208f6018b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -0,0 +1,445 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/container_of.h>
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "regs/xe_sysctrl_regs.h"
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_mmio.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +#include "xe_sysctrl_types.h"
> +
> +#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
> +#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
> +#define MKHI_HDR_IS_RESPONSE		BIT(15)
> +#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
> +#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)
> +
> +#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
> +	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
> +	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
> +	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +
> +#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
> +	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +
> +static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> +{
> +	return container_of(sc, struct xe_device, sc);
> +}
> +
> +static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> +					      unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +				 timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
> +					    unsigned int timeout_ms)
> +{
> +	int ret;
> +
> +	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
> +			     timeout_ms * 1000, NULL, false);
> +
> +	return ret == 0;
> +}
> +
> +static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
> +					  size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	memcpy(val, frame, len);
> +
> +	for (i = 0; i < dw; i++)
> +		xe_mmio_write32(sc->mmio, regs[i], val[i]);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
> +					 size_t len)
> +{
> +	static const struct xe_reg regs[] = {
> +		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
> +	};
> +	u32 val[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
> +	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
> +	u32 i;
> +
> +	for (i = 0; i < dw; i++)
> +		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
> +
> +	memcpy(frame, val, len);
> +
> +	return 0;
> +}
> +
> +static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
> +{
> +	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
> +}
> +
> +static int xe_sysctrl_mailbox_prepare_command(struct xe_device *xe,
> +					      u8 group_id, u8 command,
> +					      const void *data_in, size_t data_in_len,
> +					      u8 **mbox_cmd, size_t *cmd_size)
> +{
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t size;
> +	u8 *buffer;
> +
> +	if (data_in_len > SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
> +		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
> +		return -EINVAL;
> +	}
> +
> +	size = sizeof(*mkhi_hdr) + data_in_len;
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
> +	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
> +				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
> +				     FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
> +				     FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
> +
> +	if (data_in && data_in_len)
> +		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
> +
> +	*mbox_cmd = buffer;
> +	*cmd_size = size;
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc,
> +					  const u8 *mbox_cmd,
> +					  size_t cmd_size, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t bytes_sent, frame_size;
> +
> +	total_frames = DIV_ROUND_UP(cmd_size, SYSCTRL_MB_FRAME_SIZE);
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Mailbox busy\n");
> +		return -EBUSY;
> +	}
> +
> +	sc->phase_bit ^= 1;
> +	bytes_sent = 0;
> +
> +	for (frame = 0; frame < total_frames; frame++) {
> +		frame_size = min(cmd_size - bytes_sent, (size_t)SYSCTRL_MB_FRAME_SIZE);
> +
> +		if (xe_sysctrl_mailbox_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> +			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
> +			sc->phase_bit ^= 1;
> +			return -EIO;
> +		}
> +
> +		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
> +			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
> +			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
> +			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SYSCTRL_MKHI_COMMAND) |
> +			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
> +
> +		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
> +
> +		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> +			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
> +			sc->phase_bit ^= 1;
> +			return -ETIMEDOUT;
> +		}
> +
> +		bytes_sent += frame_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
> +						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +						  void *out,
> +						  size_t out_size,
> +						  size_t frame_size,
> +						  size_t *payload_bytes)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
> +	u32 frame_data[SYSCTRL_MB_FRAME_SIZE / sizeof(u32)];
> +	size_t hdr_size = sizeof(*resp_hdr);
> +	size_t payload_size;
> +	int ret;
> +
> +	if (frame_size < hdr_size) {
> +		xe_err(xe, "sysctrl: Frame size %zu too small\n", frame_size);
> +		return -EPROTO;
> +	}
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
> +
> +	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
> +	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
> +	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
> +		xe_err(xe, "SC: Response header mismatch\n");

Can you use either sysctrl or SC not both for consistency

> +		return -EPROTO;
> +	}
> +
> +	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
> +		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
> +		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
> +		return -EIO;
> +	}
> +
> +	payload_size = frame_size - hdr_size;
> +
> +	if (payload_size > out_size) {
> +		xe_err(xe, "sysctrl: Payload %zu bytes exceeds buffer %zu bytes\n",
> +		       payload_size, out_size);
> +		return -ENOSPC;
> +	}
> +
> +	if (payload_size > 0)
> +		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
> +
> +	*payload_bytes = payload_size;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
> +					    void *out, size_t frame_size,
> +					    unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	int ret;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
> +	if (ret)
> +		return ret;
> +
> +	xe_sysctrl_mailbox_clear_response(sc);
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
> +					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
> +					     void *data_out, size_t data_out_len,
> +					     size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	struct xe_device *xe = sc_to_xe(sc);
> +	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t hdr_size = sizeof(*mkhi_hdr);
> +	u32 ctrl_reg, total_frames, frame;
> +	size_t received = 0;
> +	u8 *out = data_out;
> +	size_t frame_size;
> +	int ret = 0;
> +
> +	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
> +		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;

Why +1?

Thanks
Riana


> +
> +	if (total_frames == 1)
> +		frame_size = min(hdr_size + data_out_len, (size_t)SYSCTRL_MB_FRAME_SIZE);
> +	else
> +		frame_size = SYSCTRL_MB_FRAME_SIZE;
> +
> +	ret = xe_sysctrl_mailbox_process_first_frame(sc, req, out, data_out_len,
> +						     frame_size, &received);
> +	if (ret)
> +		return ret;
> +
> +	out += received;
> +
> +	for (frame = 1; frame < total_frames; frame++) {
> +		size_t remaining;
> +
> +		if (received >= data_out_len) {
> +			xe_err(xe, "sysctrl: Received %zu bytes exceeds buffer %zu bytes\n",
> +			       received, data_out_len);
> +			return -ENOSPC;
> +		}
> +
> +		remaining = data_out_len - received;
> +		frame_size = min_t(size_t, remaining, SYSCTRL_MB_FRAME_SIZE);
> +
> +		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
> +		if (ret)
> +			break;
> +
> +		received += frame_size;
> +		out += frame_size;
> +	}
> +
> +	*rdata_len = received;
> +
> +	return ret;
> +}
> +
> +static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
> +					   const u8 *mbox_cmd, size_t cmd_size,
> +					   void *data_out, size_t data_out_len,
> +					   size_t *rdata_len, unsigned int timeout_ms)
> +{
> +	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
> +	size_t received;
> +	int ret;
> +
> +	ret = xe_sysctrl_mailbox_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	if (!data_out || !rdata_len)
> +		return 0;
> +
> +	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
> +
> +	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
> +						&received, timeout_ms);
> +	if (ret)
> +		return ret;
> +
> +	*rdata_len = received;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
> + * @sc: System controller structure
> + *
> + * Initialize system controller mailbox interface for communication.
> + */
> +void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
> +{
> +	u32 ctrl_reg;
> +
> +	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> +	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
> +}
> +
> +/**
> + * xe_sysctrl_send_command - Send command to System Controller via mailbox
> + * @xe: XE device instance
> + * @cmd: Pointer to xe_sysctrl_mailbox_command structure
> + * @rdata_len: Pointer to store actual response data size (can be NULL)
> + *
> + * Send a command to the System Controller using MKHI protocol. Handles
> + * command preparation, fragmentation, transmission, and response reception.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_sysctrl_send_command(struct xe_device *xe,
> +			    struct xe_sysctrl_mailbox_command *cmd,
> +			    size_t *rdata_len)
> +{
> +	struct xe_sysctrl *sc;
> +	u8 group_id, command_code;
> +	u8 *mbox_cmd = NULL;
> +	size_t cmd_size = 0;
> +	int ret = 0;
> +
> +	if (!xe) {
> +		pr_err("sysctrl: Invalid device handle\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!xe->info.has_sysctrl)
> +		return -ENODEV;
> +
> +	sc = &xe->sc;
> +
> +	if (!cmd) {
> +		xe_err(xe, "sysctrl: Invalid command buffer\n");
> +		return -EINVAL;
> +	}
> +
> +	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
> +	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
> +
> +	if (!cmd->data_in && cmd->data_in_len) {
> +		xe_err(xe, "sysctrl: Invalid input parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!cmd->data_out && cmd->data_out_len) {
> +		xe_err(xe, "sysctrl: Invalid output parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	might_sleep();
> +
> +	ret = xe_sysctrl_mailbox_prepare_command(xe, group_id, command_code,
> +						 cmd->data_in, cmd->data_in_len,
> +						 &mbox_cmd, &cmd_size);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
> +		return ret;
> +	}
> +
> +	guard(xe_pm_runtime)(xe);
> +
> +	guard(mutex)(&sc->cmd_lock);
> +
> +	ret = xe_sysctrl_mailbox_send_command(sc, mbox_cmd, cmd_size,
> +					      cmd->data_out, cmd->data_out_len, rdata_len,
> +					      SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
> +	if (ret)
> +		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
> +
> +	kfree(mbox_cmd);
> +
> +	return ret;
> +}

