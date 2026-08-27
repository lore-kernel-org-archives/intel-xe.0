Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132DC61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 22:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A161810E419;
	Thu, 27 Aug 2026 22:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvuEhdFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E03310E419
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 22:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787870532; x=1819406532;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lIGLCspu5MjnMExaFpKa9pvcEVtINaKDP4JRcIZoqNk=;
 b=nvuEhdFL8rldY+//G+PPM6R9hyZPfYBOUQsIYDxxmBd97kkxkVJBxfCx
 DizBn7PO6zRktkzBhAMj4inT+zESKBT+rvmiVuXRsasoTXsAs6GCYFuKU
 NTCJXKvo9ZIUDxC79lkOpXzApNm+1Deel//UTAkr3dQrc5tbVFvlhfqDR
 Y+3YH6kcBNWPcQCyE8toeecU2ny0aLdYfzNiVovEXSD8oIpQ5Ek910SXT
 ep+j2HfZ7NmU7jOEeo7TzhU1oQmBGeT1n7/J3TqBf76FU0udlU4FM6R30
 5GakxkjIeTxtEdIFE+G0Lt5lUvg4LvBEP41sh3BQQ0hcP3zwg9TEjFqYs Q==;
X-CSE-ConnectionGUID: tjmbCs8tTzKBfV7uEJfv6Q==
X-CSE-MsgGUID: yMd94rUIRC6hsS8NDQopdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88433260"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="88433260"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 15:42:11 -0700
X-CSE-ConnectionGUID: PHhBEktFRkKrZudPFpRxfg==
X-CSE-MsgGUID: m5ZvBysIT4WP48LaBnVheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="264750579"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 15:42:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 15:42:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 15:42:10 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 15:42:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pna/T3ZX8KcoUMGbuhOY+L/q1c0xCWR9BbpScfI7yC6z/GEdJUO7UILo7pANLB+x6rqvF781h9naPW2PcL3XFfIk9vhUkGMUcvhma7tUlnUnBKtlZJVMGJLhjqkLG0y8hYeXKhdxVsj3O9bCEljdAZr8I312Wb5qlBZxg9485+yz8FK/Voo66T1dNNqfIPuvFU7ebIf8GluJ//+hDrGsvyeJolzUP5EENaKKQuGwEDmImhT5Z+A1CAGWs6E064o2Py06MuZ66FSiDr+4GYZp+54whxtjcUpOxsy9gbtgqVQvSxV/ftYKtmeZ2IDx11a3zssciy4SxerdO7sAL7nSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIVUTDqyXSAcNCcBpoq3wekYVPb7nMXOVTvz8FhVTow=;
 b=LHhSeOY2KNxLGV1vRf4UhOJumql0gljGGgEsr035yqx1sEOxHqtyrdUAGnI6cZbjglPq3Bs7QIA+L1srESKY5PL5MZlgsIL1FXaChbAaWS2Q2GhdNQ2Lv4hX40qJ2DDP+r0mi0YIzMcXg/fydJpdkl1Rtua0J9nDLnmdrN6sO65UVF5nIyVxcSZpstB9lncUYS4xSABFDD4S8q2WvsiQXLegINSdHozixtlw7y+YDVn6cl0Qwn5PH2ozT7exhKQgYf90JBggC3K1DySbPXB4d2Fg3OQycvwOehF46u1MOd/82zNmR9jj3ap4BAGYEsS3l8jcnJBkpURgY4kSoC3k5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:41:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:41:49 +0000
Message-ID: <89d73a1e-ce71-4eec-b2e6-bc4cf1bb56d4@intel.com>
Date: Fri, 28 Aug 2026 00:41:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/guc: Report errors that cause a CT shutdown
 using SIGID
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
CC: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Alan Previn Teres Alexis
 <alan.previn.teres.alexis@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20260827002801.837731-1-daniele.ceraolospurio@intel.com>
 <20260827002801.837731-3-daniele.ceraolospurio@intel.com>
 <c88d3c1e-4b46-41b4-be7d-829b12e2e18d@intel.com>
 <b3f36afd-c702-4359-bac6-3e5eec11aa66@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <b3f36afd-c702-4359-bac6-3e5eec11aa66@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 91df94ea-e051-4695-272e-08df048c61a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fhmNGj5oaYxC3qfsjpYKIOwO210XaJaIM3JfDbOMMquTnXyqAKzLHoWCLLnKY+SAOMD1bZbOuVdWXMgpfkPgSe1uBFWegHYTA+GTu574sX/SI1LL4Y13i7jGJKfEQw/u0dlG0n/QkIKYZgjPdAd0kgCFH8N1Dcixp6i5Pj9OCzf4PY/soUjfehVYKxSkVtiXWkBAVXuXMKjS1XmdVgVvT1zMjBN5R5gbCwjdmx7anqM0M7VcR+uMVMl+ias7JuE18pQywirjC6DQ16gmmR/wEe9z0beGmXLGs9vL5XqDW5qtfpgR6OYYZRCZekrQGtI0IDkck1uof0CbKjqb9idFL2Mkfy6F6uk5oVddkscgQqeRwhC4S4IPbRAb2zKfD7ytnYzjR1+o1twsW5Nk9m+BD8QZuKERvfg8vSi2n1EPbf7cM+I8ZaYEOd/+H4w46L9etnA2ueS7FIvtmnuDxGngUz5Mw8bekOfRuj0xqrQ9XySFwc2cg+2Sn9EkWqOGTTHnPX8DLXk9/AKZ4Wj7E1hFu9cwvzK1w8YPl8enBRki6djpEjlem1yw+tpzi4b7pxoWwL7g+GsHDE/hxztUrwoPlU7faS1NRjs6CxIgwXKetZ/+hqkhbdELmhC+nTxf3aB4sqBdAYJ6h8/6ue+Ip6nz1oTQ47gowrdPWsdvT8zzgMU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUZkaklRaFY4VkVYL2RzMlNpaVFMcXFBQjRURnQxVlB3L2lVNU0vWnhvWjJR?=
 =?utf-8?B?V2RJN1NuWWNUVHlkR21LYjdJcnl6STZQeFlBK2pIQ2ljenAvUlpzTlQxQjZZ?=
 =?utf-8?B?L1RrZG95dFI3L1NSM3FvKzAvRUdtREpkZWlGVTh6dlg0eDFFUFdLeUFJajRx?=
 =?utf-8?B?V2FnQzcvREgyV0liQmtmcWFmRUQvK2w5aVIrY216d1NEU0FVK3FKSlBianpY?=
 =?utf-8?B?UElyRDRZcWZqaHJSR0RqRTdlU25lRTl5L1RZbE9CUWlRaWRKM2dRbEMveUJJ?=
 =?utf-8?B?MzdUK0M4aG5UUS9aeTFOL3d3d3FkTGdvemVUcEFNb2xrWW50bTJlMDJZVlFz?=
 =?utf-8?B?YkZ6bWROaUtjMmVDQkhWNkFEMDh0REw2Vzhubi91ZkVWR09HeEdYc1V6OUMr?=
 =?utf-8?B?YnQ3RGc4T1NpcWQ1K1gwOWYzTHZnN0pIcC9xSUNWMVdBZTVHWk94VnBadSto?=
 =?utf-8?B?QWRKYTZ2eTU1QlkzS05oWWtBcklGcVRXRXlTMlB4NDlUcFlEcmhoSURiSXdO?=
 =?utf-8?B?VjViek5SdTdRUWhmdlRBVFJwdjJxVlEwTzc1ZWVCTXNXQk5ucXhhRlFxanhJ?=
 =?utf-8?B?M0hSOS9hK3B1cUx4aVNBMm12cXcxQkhYUmJMVmRBSG9PM1RWeHBLeUxnUEVw?=
 =?utf-8?B?ckdBOTlCT1pya2RraFV1UmZINktNVkNVMDg4QU55dmhBTUNvM2lvL3BSc2pr?=
 =?utf-8?B?ZTBLSUJWVnMrOFBhV09ITmhYQW9lNTJweEc3VTR4RkNsZWhSOFF6Z1ZhWG9R?=
 =?utf-8?B?dnNyK000YmcyV2ZxTERFY2JxZUljU0QvVGw1T3pnNVdKVEgyMHI3S29tMDFD?=
 =?utf-8?B?YTUyWFFhMkVHU1N1TXU4MVppb0NQekhDN2RhdEM5UnRvSWNUdXVPTCs4NEtP?=
 =?utf-8?B?WEpzbFN6dHFKTkdGaUdUUm0yT2JuM25XVXVQWHc5UjcwTmhMQlYxZFY3Z1F0?=
 =?utf-8?B?MlJvTy9vRHFDb1ZXWWUyUDlYTER0bkRLVlBKV3JjeDNhUVVxNXlzd29lUStD?=
 =?utf-8?B?bjhRT2wrVXRqTnEzL3R2cUQvWU1uNm9wenZ3UERTekpwU3FzL3ppWjZhaVJl?=
 =?utf-8?B?MC9ra0VzaTdFUTdWblBGOEl2eFVkWHh3R2l1TGpLNFBEc3dCaXNQSXAweXBo?=
 =?utf-8?B?YmZVSUNzNnpEQTNoeHEwMkJrVUExSy8yNWZua0ZIRDhCSXhtOVpkNEtBUWpX?=
 =?utf-8?B?ZnpZU3cxYjJtZnE5anVJZjloQi8weFdHYi9reEQwL292Y0U0MWV1VEZKRWRD?=
 =?utf-8?B?MW5SZmsyQWNWazdmWkNBUnRPT0s0anU5aVpYb2l5S2JxSU0xR2syYlR1ZUFv?=
 =?utf-8?B?RzU2ckFNLzVub0lrbmVlSGJNem5RcEI2NHJZMmYwT3FWVGVoNmhlSEZTd3Ry?=
 =?utf-8?B?d0tqVjlnRExaZFdHeVViMGk2Y21ITkI2cGRaWmtLYXR6VUNXSzN0czNmWkx5?=
 =?utf-8?B?enJySFBJWjZxRzNqa2VhcDdaYmpYUnZMUG9QeVFKY2k5cEdaK0NMa1d6cmpv?=
 =?utf-8?B?MlJ5cVhlWWhoNDBoL1BJZVNxV2JaaGk2MjBtZ2ZzQ3Exc3FxN1BCMk5UM0JD?=
 =?utf-8?B?Vk1iYUtQaDU0WDc3bmcrVkxxWjVZeXlsQmJ5TDI0ZU90WndKWVhBV2RKOVdM?=
 =?utf-8?B?V3NYK0E3d1d1aHhDR0swZ2k3RGQyTEhPNitaRmJwRnZ6anVkM21CdWZhZTVH?=
 =?utf-8?B?ZkVYQnpiSXdmQTJONVZDSXdUa0xCOHRJc2lCY2tVRURLbzl5SWM1MGZMZVI0?=
 =?utf-8?B?MUZvSytLSkkxdER5M3ZiOHQ1SkZSdC83Nit4V0lyeE42S1JrMS9sNmVub1dE?=
 =?utf-8?B?LytsZVE0VFRNV3VhVis1MUZlemdVSXkwTVpHeHBiaWRiVHl4UjVTaUFwSWFp?=
 =?utf-8?B?ZUVEbVIvNXVLNm9XcjlZZG9lYnJ2T0tKK1VPU2FQWmxXVm5FRHYrSkk2YzRF?=
 =?utf-8?B?RGNqaHZGRnUxTTg1eTBpcFRkWWJSY2VJSkMrQ1FYR1JkMlNuM0RxbW5qaFBF?=
 =?utf-8?B?VS95cWhiVjZidllSVktuWGx4MUN3Y3pqdVg5ZzAxL2VOeExTaGt3WFdMZHl2?=
 =?utf-8?B?b2RweXUxNFBFTnFnRlpQWDFaOTAzWTZHZEI4dnZ0VHZuRjJoOUQ1SlBya2JD?=
 =?utf-8?B?dzIzQTJVRFYrT0xIeWd2R3RxSGp0QkFBenVYUmxzNkRuM1dxY21HQmp0THRw?=
 =?utf-8?B?WDdPR0lsQ244VS9hOHJZaDZiYU1oeUxtUTlQa0VhQzl1VkdZVGtoWDlqU0JF?=
 =?utf-8?B?RmszSWYyNXpHMVZYb3lVSjRPVk5oMEN4RU90Yk5MTTkydWdiVG1HdjBJZFZ5?=
 =?utf-8?B?cnBId2tQTDdtUCsrK2JRRmp4VE84cGxvL3NvL090dFM5cERlL2JONkMzYTJE?=
 =?utf-8?Q?KccTfEQcyoq5alEs=3D?=
X-Exchange-RoutingPolicyChecked: rjzsr/d80Pf84m6FyXbDAZvWWs+IiZab0KtMWuAct6eJEa4m1lvyeIUb3MntGFS09m1fB9uoUppySdFxXhWCqahXD7ELA/UFbs1AebNUXea3/peV1kQDdkBXjSctyqeo4KNlF+cwWXdgkB+7M+CtXtDNcNgi/fgZhwf3QVcZjFJJDuN+6Rf2sgWcMT53uGPAYzZYR479iHVDvlvHJLmeMtEHUEkdwiGXu3XjdX4NJwLZpqS3FvxMvAbXtUid05OwG1sIQS81+I7QQlGaTzVys85kh7TZr/pouu0upjUlnBtSpykAXrP2MLCXgp1UJWbyAAlwJTWwIlMhVXDGv9199w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91df94ea-e051-4695-272e-08df048c61a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:41:49.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MytEGIVR/Ahw/U1cs8GVXahhtZ/sx8lrjrgnu468F9yPxeupqoqTUetHutEW8ZT+ImkI6ZZozNyq8UWkCcWQzs4wI/0A7By+mSmMXsWg1VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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



On 8/27/2026 11:33 PM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/27/2026 7:34 AM, Michal Wajdeczko wrote:
>>
>> On 8/27/2026 2:28 AM, Daniele Ceraolo Spurio wrote:
>>> Convert any errors that can cause the CT to be declared as dead to
>>> use the xe_log_err() helper. Errors that are escalated to the callers
>>> are left for the caller to report with SIGID if needed.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
>>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_ct.c | 91 +++++++++++++++++++---------------
>>>   1 file changed, 51 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> index 5c4733da385c..4efaf2d24c3e 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -30,6 +30,7 @@
>>>   #include "xe_guc_relay.h"
>>>   #include "xe_guc_submit.h"
>>>   #include "xe_guc_tlb_inval.h"
>>> +#include "xe_log.h"
>>>   #include "xe_map.h"
>>>   #include "xe_page_reclaim.h"
>>>   #include "xe_pm.h"
>>> @@ -679,7 +680,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>>>       return 0;
>>>     err_out:
>>> -    xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>>> +    xe_log_err(gt, GUC, err, "Failed to enable CT\n");
>>>       CT_DEAD(ct, NULL, SETUP);
>>>         return err;
>>> @@ -803,8 +804,9 @@ static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>>>                 desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>>   -            xe_gt_err(ct_to_gt(ct), "CT: invalid head offset %u >= %u)\n",
>>> -                  h2g->info.head, h2g->info.size);
>>> +            xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
>>> +                   "CT: invalid head offset %u >= %u)\n",
>>> +                   h2g->info.head, h2g->info.size);
>> nit: we usually use -EPROTO to report mismatch in the messages
>> while here we have corrupted descriptor, so maybe we can use
>> something else, like:
>>
>> #define    ENFILE        23    /* File table overflow */
>> #define    ESPIPE        29    /* Illegal seek */
>> #define    EPIPE        32    /* Broken pipe */
>> #define    EILSEQ        84    /* Illegal byte sequence */
>> #define    EUCLEAN        117    /* Structure needs cleaning */
>>
>>>               CT_DEAD(ct, h2g, H2G_HAS_ROOM);
>>>               return false;
>>>           }
>>> @@ -873,12 +875,13 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>>>       bad |= !ct->g2h_outstanding;
>>>         if (bad) {
>>> -        xe_gt_err(ct_to_gt(ct), "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>>> -              ct->ctbs.g2h.info.space, g2h_len,
>>> -              ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>>> -              ct->ctbs.g2h.info.space + g2h_len,
>>> -              ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>>> -              ct->g2h_outstanding);
>>> +        xe_log_err(ct_to_gt(ct), GUC, -EPROTO,
>> hmm, here the "bad" flag is more an indication of our (xe) miscalculation,
>> not something that FW did wrong, so -EPROTO seems wrong, maybe
>>
>> #define    ETOOMANYREFS    109    /* Too many references: cannot splice */
>>> +               "Invalid G2H release: %d + %d vs %d - %d -> %d vs %d, outstanding = %d!\n",
>>> +               ct->ctbs.g2h.info.space, g2h_len,
>>> +               ct->ctbs.g2h.info.size, ct->ctbs.g2h.info.resv_space,
>>> +               ct->ctbs.g2h.info.space + g2h_len,
>>> +               ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space,
>>> +               ct->g2h_outstanding);
>>>           CT_DEAD(ct, &ct->ctbs.g2h, G2H_RELEASE);
>>>           return;
>>>       }
>>> @@ -961,21 +964,24 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>             desc_status = desc_read(xe, h2g, status);
>>>           if (desc_status) {
>>> -            xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>> +            xe_log_err(gt, GUC, -EPROTO,
>>> +                   "CT write: non-zero status: %u\n", desc_status);
>>>               goto corrupted;
>>>           }
>>>             if (tail > h2g->info.size) {
>>>               desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>> -            xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>> -                  tail, h2g->info.size);
>>> +            xe_log_err(gt, GUC, -EPROTO,
>>> +                   "CT write: tail out of range: %u vs %u\n",
>>> +                   tail, h2g->info.size);
>>>               goto corrupted;
>>>           }
>>>             if (desc_head >= h2g->info.size) {
>>>               desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>> -            xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>> -                  desc_head, h2g->info.size);
>>> +            xe_log_err(gt, GUC, -EPROTO,
>> as this indicates that FW found an error in CTB, maybe:
>>
>> #define    EPIPE        32    /* Broken pipe */
>>
>>> +                   "CT write: invalid head offset %u >= %u)\n",
>>> +                   desc_head, h2g->info.size);
>>>               goto corrupted;
>>>           }
>>>       }
>>> @@ -1220,7 +1226,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>>       return ret;
>>>     broken:
>>> -    xe_gt_err(gt, "No forward process on H2G, reset required\n");
>>> +    xe_log_err(gt, GUC, -EDEADLK, "No forward process on H2G, reset required\n");
>>>       CT_DEAD(ct, &ct->ctbs.h2g, DEADLOCK);
>>>         return -EDEADLK;
>>> @@ -1558,11 +1564,11 @@ static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
>>>       struct xe_gt *gt = ct_to_gt(ct);
>>>         if (action == XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
>>> -        xe_gt_err(gt, "GuC Crash dump notification\n");
>>> +        xe_log_err(gt, GUC, -EPROTO, "GuC Crash dump notification\n");
>>>       else if (action == XE_GUC_ACTION_NOTIFY_EXCEPTION)
>>> -        xe_gt_err(gt, "GuC Exception notification\n");
>>> +        xe_log_err(gt, GUC, -EPROTO, "GuC Exception notification\n");
>>>       else
>>> -        xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
>>> +        xe_log_err(gt, GUC, -EPROTO, "Unknown GuC crash notification: 0x%04X\n", action);
>> maybe crashes should be identified as one of:
>>
>> #define    ENETDOWN    100    /* Network is down */
>> #define    ENETUNREACH    101    /* Network is unreachable */
>> #define    EHOSTDOWN    112    /* Host is down */
>>
>>>         CT_DEAD(ct, NULL, CRASH);
>>>   @@ -1592,13 +1598,15 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>        */
>>>       if (fence & CT_SEQNO_UNTRACKED) {
>>>           if (type == GUC_HXG_TYPE_RESPONSE_FAILURE)
>>> -            xe_gt_err(gt, "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>>> -                  fence,
>>> -                  FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>>> -                  FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>>> +            xe_log_err(gt, GUC, -EPROTO,
>> FAILURE response is a valid message, maybe:
>>
>> #define    EBADE        52    /* Invalid exchange */
>>
>>> +                   "FAST_REQ H2G fence 0x%x failed! e=0x%x, h=%u\n",
>>> +                   fence,
>>> +                   FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, hxg[0]),
>>> +                   FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, hxg[0]));
>>>           else
>>> -            xe_gt_err(gt, "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>> -                  type, fence);
>>> +            xe_log_err(gt, GUC, -EPROTO,
>>> +                   "unexpected response %u for FAST_REQ H2G fence 0x%x!\n",
>>> +                    type, fence);
>>>             fast_req_report(ct, fence);
>>>   @@ -1674,8 +1682,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>         origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg[0]);
>>>       if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>> -        xe_gt_err(gt, "G2H channel broken on read, origin=%u, reset required\n",
>>> -              origin);
>>> +        xe_log_err(gt, GUC, -EPROTO,
>>> +               "G2H channel broken on read, origin=%u, reset required\n",
>> #define    EBADMSG        74    /* Not a data message */
> 
> For this one I can switch to EBADMSG  for the log, but the return value needs to stick to EPROTO because the value is returned all the way back to receive_g2h, which checks specifically for EPROTO or EOPNOTSUPP. Changing this flow to handle different error codes is out of scope of this series IMO.

I assume you're referring to this code:

		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
			CT_DEAD(ct, NULL, G2H_RECV);
			kick_reset(ct);
		}

where those two errors were used to start a reset but maybe
we should just move kick_reset() to the CT_DEAD() and look
at the dead_reason instead?

@Matt

> 
>>
>>> +               origin);
>>>           CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_ORIGIN);
>>>             return -EPROTO;
>>> @@ -1693,8 +1702,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>           ret = parse_g2h_response(ct, msg, len);
>>>           break;
>>>       default:
>>> -        xe_gt_err(gt, "G2H channel broken on read, type=%u, reset required\n",
>>> -              type);
>>> +        xe_log_err(gt, GUC, -EOPNOTSUPP,
>>> +               "G2H channel broken on read, type=%u, reset required\n",
>> maybe this should say: "Unexpected message type %u" ?
>> and since we rather do not expect new message types in CTBv1 then
>> maybe this one should be actually -EPROTO ?
> 
> I think it's better to stick with EOPNOTSUPP, but I can reword the message.
> 
>>
>>> +               type);
>>>           CT_DEAD(ct, &ct->ctbs.g2h, PARSE_G2H_TYPE);
>>>             ret = -EOPNOTSUPP;
>>> @@ -1792,8 +1802,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>       }
>>>         if (ret) {
>>> -        xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>>> -              action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>>> +        xe_log_err(gt, GUC, ret, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
>>> +               action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
>> drop %pe as it will be already printed
>>
>>>           CT_DEAD(ct, NULL, PROCESS_FAILED);
>>>       }
>>>   @@ -1840,7 +1850,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>           }
>>>             if (desc_status) {
>>> -            xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>> +            xe_log_err(gt, GUC, -EIO, "CT read: non-zero status: %u\n", desc_status);
>> #define    EPIPE        32    /* Broken pipe */
>>
>>>               goto corrupted;
>>>           }
>>>       }
>>> @@ -1871,15 +1881,15 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>             if (g2h->info.head > g2h->info.size) {
>>>               desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>> -            xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>> -                  g2h->info.head, g2h->info.size);
>>> +            xe_log_err(gt, GUC, -EIO, "CT read: head out of range: %u vs %u\n",
>>> +                   g2h->info.head, g2h->info.size);
>> as before, one of:
>>
>> #define    ENFILE        23    /* File table overflow */
>> #define    ESPIPE        29    /* Illegal seek */
>> #define    EPIPE        32    /* Broken pipe */
>> #define    EILSEQ        84    /* Illegal byte sequence */
>> #define    EUCLEAN        117    /* Structure needs cleaning */
>>
>> maybe except EPIPE which we want to use to indicate that CTB error
>> was already set earlier (likely by the GuC FW)
> 
> IMO grouping all cases where the CTB header is in a bad state (whether because the GuC signaled an error or because it wrote and invalid value) under EPIPE is cleaner. Having too many different error codes will just get confusing.
> 
>>
>>>               goto corrupted;
>>>           }
>>>             if (desc_tail >= g2h->info.size) {
>>>               desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>>> -            xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>> -                  desc_tail, g2h->info.size);
>>> +            xe_log_err(gt, GUC, -EIO, "CT read: invalid tail offset %u >= %u)\n",
>>> +                   desc_tail, g2h->info.size);
>> ditto
>>
>>>               goto corrupted;
>>>           }
>>>       }
>>> @@ -1898,8 +1908,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>                  sizeof(u32));
>>>       len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>>       if (len > avail) {
>>> -        xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>> -              avail, len);
>>> +        xe_log_err(gt, GUC, -EIO,
>>> +               "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>> +               avail, len);
>> #define    ENODATA        61    /* No data available */
>>
>>>           goto corrupted;
>>>       }
>>>   @@ -1981,8 +1992,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>>>       }
>>>         if (ret) {
>>> -        xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
>>> -              action, ERR_PTR(ret));
>>> +        xe_log_err(gt, GUC, ret, "G2H action 0x%04x failed (%pe)\n",
>>> +               action, ERR_PTR(ret));
>> nit: you may use %#x
>> drop %pe
>>
>>>           CT_DEAD(ct, NULL, FAST_G2H);
>>>       }
>>>   }
>>> @@ -2080,7 +2091,7 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>>           mutex_unlock(&ct->lock);
>>>             if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>>> -            xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>>> +            xe_log_err(ct_to_gt(ct), GUC, ret, "CT dequeue failed: %d\n", ret);
>> drop %d as we will already print ret using %pe
>>
>> also, maybe worth to mention "..., forcing GT reset" ?
>>
>>>               CT_DEAD(ct, NULL, G2H_RECV);
>> hmm, I'm pretty sure this is redundant as we already call CT_DEAD
>> on every case where we report an error, can you double check?
> 
> There is at least one failure case in process_g2h_msg where we don't call CT_DEAD. If we want to rework this so that CT_DEAD is not called from here I believe it should be done separately.

sure, as a prerequisite series ;)

my point is, that before rapidly switching to use xe_log,
we should make sure reported errors are meaningful, and
if needed we should do some cleanup first

> 
> Apart from the suggestions I have commented on, I am implementing all the other ones.
> 
> Daniele
> 
>>
>>>               kick_reset(ct);
>>>           }
> 

