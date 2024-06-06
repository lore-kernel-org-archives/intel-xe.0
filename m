Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15417C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 10:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8BE10E038;
	Thu,  6 Jun 2024 10:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFqppnip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C930B10E038
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717668593; x=1749204593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i9xhISpoGrQ9nvJkF0CZ2EC1krJ/G7ZttfSUA92tAtY=;
 b=MFqppnipLYt7cjGjoGAACeON1FKXlT3MGNZ+Leg6Invk/etTe0O7oT2E
 V6LZ3rlfV6SZgSh/RRAipkZrRb7PrDO8/BuEmvWqDATSxlM2y5BSx9CJH
 zOMYnNCBbIHHUI+6EI3fJyyptJkuRPTV2s1pUPTUgO8iope3idvR53xgd
 JAuc+ue3T/3fwPf/TbFkjducUT4NWXv/1WVnCx1Nm1tT0c+aIgtDn7FZV
 m4op8E2z3JWzv/TCIR6vlajGb99xgiNGfqRVKpJhDL1ni5NI0ch+ND/zb
 bePMxIU/Lon+svOb5Qf3EYMK3Zp2OCgJuTUVCC5T/i+0+fawJSeIp222A w==;
X-CSE-ConnectionGUID: Ufa0TsZwRyy1R4D0NnXjtg==
X-CSE-MsgGUID: /3DOhbl1RB6soXRJLyKocA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="36854050"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="36854050"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 03:09:53 -0700
X-CSE-ConnectionGUID: wycs9tmnS5CXmf5K3JZiRw==
X-CSE-MsgGUID: FKSxks5dQ9ikGptkBTswuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="69078695"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 03:09:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 03:09:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 03:09:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 03:09:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 03:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kagXQ3d90Xin+jsIKdeqdzlbX6w0v2RVNSiYq5lnIujedJBM9jr1XMlTDjGPPlon73d6ghSbOS/q07vPtAeHs9l3jLqVshq2QNsUIR69gCXE6p2Xl4IEGultZbIema+eZoacKIymVGl99Gw4IitkK6YRrOAjTJNgIWOnN+nmcdSEwIiOzd7h2PQM7AmikBJyAMBTowKNB8FrRO2O8rIwUYPzm+5Tjwi+qxkSygYFbA+CknZhUrzOoMAag5vB9XHSmEzYkYsmaQrtITArlnBhSKW1vs0p7IJng4nEdmyI2865NY8Scftns2cIO5jCUshvjsfXfR0zDtcik03vpclFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mw4xPHovEtE8073tnIlx/I8LufYuzh9+Zctu/LLacg=;
 b=eMrxhSiZUQi5cMqDknoFM6mTcNUzP+iM5Nvvex222TLM2FjZrgSxNgP2jRDsFqgdOe1JY04kO+B/ssBR99LPdVWrWmRomUePX6bY0suHEsZ6KugEDhIwVtPSEu0k5OlLuUHqcMZZH2P9QaCDb+ElD8QsbCQorFaeFzPeNFMxzKxM1lfXdNgs1Pqcc6SfE8HqH5ZXc7th6CfNHamql0wGLhJnyue4R7MgeWZgSR7tnjjMTijtxnvesla6x9pL+Z7iyPJGygbfqqnLSchZ9c3tfTDyRKaw6w9ACFvbVwAP4OrcvpK8XllboiUDALNBU00nJ/iKQUzt4j04dgMgEGTwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 10:09:44 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 10:09:43 +0000
Message-ID: <566daea7-d438-4c63-a491-851d4dc804f7@intel.com>
Date: Thu, 6 Jun 2024 12:09:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/xe: Ensure write lock is held when calling
 xe_vma_rebind()
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
References: <20240605101607.29931-1-nirmoy.das@intel.com>
 <ZmCV9Kc4LBXtT0ev@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZmCV9Kc4LBXtT0ev@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::27) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 459b72f0-15ec-4ed2-c45a-08dc8610c964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkpzdTBqcTdQWlMveFB3K0FzTHZPcnRHTXpjejAwVGJCbTdLZ1dkMzNlcHhF?=
 =?utf-8?B?K1RYK0RIczVmZTgyMXpOTzRnay9VMU9DQWw5dFJLM0U4ZDcrSlpsZkkzcG4v?=
 =?utf-8?B?UWRuMU5yZU53TmlOVDJNRDJXTEluNTU0VTNYVXR0RjR5M2FKbFQ0NVpPOHJN?=
 =?utf-8?B?ZlZHd1dPWnUzSm9CWU5aNU51L21TMlNqaUN5RG1ZWGlQbHE5czdUSWozenRh?=
 =?utf-8?B?azI2emFRM3psd092Tm9yMFdodUw1UXJxemthOS9XVDJnUWt0UUp0NmJhRENz?=
 =?utf-8?B?REVPL0U4d0RSaURPYXMrR0JqT2lpUVVaWjcwaTFxQkcwNjFUUTQ4M3RqUFhw?=
 =?utf-8?B?OEFFMXoyeitFOVZyalMrT0p1b3VxbVRyR1d2QStMV3lvT2J4UEpNekJtenNm?=
 =?utf-8?B?d0lCOGlCd1Y5NGNCQXhVUGowaFp1OUR5TFZxam5ieExxOUpUZ3dJMzU1Mnhv?=
 =?utf-8?B?TmJnVGtFSXd6UjVsU0JVWmlqY3NpRDJjVFBobzhNR09FWVZ2WjYwcTRYSmJ3?=
 =?utf-8?B?RUtzckpGTS9iNnhtUGZ4ZTRjWHNQRVVHUDJ1dWRVbTVXdVl1VnRiMVloRE8x?=
 =?utf-8?B?WmZJWXpFbVhVaFpMaFJabEd4K1NNQUxSa3kzRTFPYkEyd0huclppWEt2Nm41?=
 =?utf-8?B?cm9VZ091c2VIQXUwalFPYVlNVDYzMHJib3pidHNBYm9IUXFCclB4RFJCa2tS?=
 =?utf-8?B?d29hOGVkTUFCRGNrSTZQQmhuZWtNcFlHTEpJVzVEVTFDdFRTRFZ6bTE1bEg0?=
 =?utf-8?B?V3FxcVBBQ0tLMk0zL21FanpVRVViVEVMSzUvRGxsY2d6bmQxZ3JabkxJVjlD?=
 =?utf-8?B?b2ZIL2NCZ1RnbnVONVM1L2xXRllXVGgrZE1hUng0RVphQS9JcFNIQUNoOG9w?=
 =?utf-8?B?b200Sk5GNFZnamRWY2ttVHRObGtyZm9BVXhna0d2N0NNSkYwTHZvTW91RXhW?=
 =?utf-8?B?R0JIeTJVZzgwVm5TZjZkUWpZVEhjdGdnTVoySG5Vcjk5a3NVOHhBTjJRTEpm?=
 =?utf-8?B?S3lMYmN6elJVSE83VG95QnNGSTlnbHN0NEExM2w5S05raWI5cjAvTTEyeUZy?=
 =?utf-8?B?UzhiU2VlVjlUajlJSG5ZbUU2a3Bpdk1iOG92aUJLbEFWSlBNdmRjZG9ONm5M?=
 =?utf-8?B?MWYrcndJUE1LUGhqN0FWUDF0UHVyVi9KMWZyd1FnMHZsTDJMZ2VTNVBRb1d4?=
 =?utf-8?B?cStLSmZnTC9HQzB2ejI3cGlOeWdOdmNkWmY5Q3hhUkJLcnhvQjVjYjZrSjV2?=
 =?utf-8?B?UDBrbGFOVmtESkhCVTlKM2NPVk1SV2F5azkzTThIeGhBaFhiZ3FPMDlqSy9p?=
 =?utf-8?B?NzA5dHB6N1JwMVhIR3dSejlnNFJDOFNFU0NndlI2dy9Tbmk1eDAxWHRLckF4?=
 =?utf-8?B?Vlh0WTAzMDI2ejl1Mm1ybVBpZHJ5NExMclo2ZTRhYTcvaHZ0NFd0N0NielEv?=
 =?utf-8?B?S0tiRFhvODNjcnJwNGd0cFBLcWk4R25BS3dZZ2c2aXlXaElWR0hldE5hZ1BJ?=
 =?utf-8?B?N1kxUDhTMm5qS0Y0K2hPdFJzVTFJZHYvUUdQeHI5RnBYV0RQaE1aeHI0VTYv?=
 =?utf-8?B?Ui9kUVJEektsaTMyWmkyZ0o2K3I1RlFRNHpndTNzRy9QZHVSRlUxc1Uzc3lr?=
 =?utf-8?B?MTNNeGdhL2IwbTdWZi9XUVlMai90Z0lkVm96THNBV011ZDdwUW45MURETGgx?=
 =?utf-8?Q?MQOVfzopnZqMxH4CbvQG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlqQnk4VXhnemxVWklXVjJxUkNFdnhwSHN2cm10WktaM1htSytzMElhNlU0?=
 =?utf-8?B?KzFwc0ZGbUF0ZG1XUGxadHdVeVhNQXFzZndnLy9obHpBLzk1Q2czdEtOTk1E?=
 =?utf-8?B?YmY1ZE0vcW9vYU5sTGdibXNJS3NqL0g4L2Z3V0ZZd2l4UHYvbkxiUnhTTXJ2?=
 =?utf-8?B?cUs3bzdMTW5KZC9mVEFiaUR0cm1CZnlycnQzei90czdrYThZQ2s2ai93aXNj?=
 =?utf-8?B?bEt3dm15RmFBWEs0bjhBNU9xLzJYRUtwdHhzUE9SaS9NYXRHRXJiWUZGaXI3?=
 =?utf-8?B?UWpwNEl3VkdEZElIZEl2NklYbm8ySjU4V0hmUitKUWQxNFEwWkJ3MUx1Z2dX?=
 =?utf-8?B?NUhTUHlpdkJ0N3oyNXc0cWQzWHA5TFgzTjkwUWo5OEgvaWI5aFhNcjFlU2gr?=
 =?utf-8?B?bDhIalNlQUZ6S3I0K21DdWUzcldpMU54NlFibGFGUjJoYmZDbHFUeTNCanlq?=
 =?utf-8?B?anFJRE43UVZ0Rzc1Tjl5TTZCNzZad09zMTZtcGFSdUVLdkxGYzJwalVybWJU?=
 =?utf-8?B?SHRpVmcvWktFMHZKUndaUlhLZHE1bEdVOTYxUW11Yk53YXh3WGIyT0tCVUpN?=
 =?utf-8?B?NW1ISXVCMTdTZkp0YTF6U3dQYlYyVFQvTDJBSU9jdFRYNXlxNzFGTXlwTE5P?=
 =?utf-8?B?MXlxUHN6V1ZISGkvOGtiYi9XSHhVdktvcWhFZGdCUkwxbjNlTVIzYWlsL1FL?=
 =?utf-8?B?UG5SdTA5aW5HNFhFTExtVEUxRmRPNHRWeDBDSVNhU1llallDMVY0ZmwyMWlU?=
 =?utf-8?B?ckZHMnBsOHI4M29HSVpFZm9aRFo3bXo0UlNtcUJNczJ1Z1dvQ2tmek1xWUwr?=
 =?utf-8?B?K00zWDNPZG15cGJvS1BCdHErc0E4WmhFL2tEcVVrMVdGWG5YM2hWbHhlSFYz?=
 =?utf-8?B?SkZ6MWtONUNabVNOSmhQZG1xTmlubGdhMlpOdzRiZFNpTE5WVXdHTEpJd1Y2?=
 =?utf-8?B?Vkh3T3R1eW5ldEhoYjkvZU9xN24yZzRJeEp1MmRwdlBOV3JNWUZOQ21hVkha?=
 =?utf-8?B?VkxaeWVPTk9zWkpyQlFJeGJIR05jdUlCTHl0ekgrQ3IzZGZqZ3kzR3EzS2x2?=
 =?utf-8?B?ZkN3NE1Oa1pzdTE3R3VXWkFmSDZrcUxRV1hJT0JpWHFSdlB5cm8xcDZxcGEr?=
 =?utf-8?B?K1N6K1k0aUNkQ3dXaWNLQlNYdVhDL2lvQ1BKM0doRGRtdm00WENqQ1dQSWNX?=
 =?utf-8?B?SllJWUNwc0MxRlAzVUw1K2tSRjA1QXhHZTlHdVpWWEh6aklKWStlNFBqcWo0?=
 =?utf-8?B?LzRHOEdYN0RJcWN2dGxFMitka3dITElqRHdrbThzaEVhdTRZRFVwcFUxTXdE?=
 =?utf-8?B?SE1Qb3ZLYkN5K2VsbFpKMjlVYkxvOUkwMEdJcnBJMHJaQklDa2FFOE1Od2VT?=
 =?utf-8?B?VE05UDFucFZhb0F0QW1XK0FFbkljZWVuQmdhQ1d3em5NUWdYMWppeWoxYjlu?=
 =?utf-8?B?b0krZHRtandObnBrSDRvNHhJUkNKeENhdk5zL0diMncrSW1KcEVJR2lPNkQ2?=
 =?utf-8?B?TlU2c3RjMFJMbU9ra3lnYmRqZXMwTWIzMGNqclBxeG4veUxJUWQyUXEzbkFl?=
 =?utf-8?B?dHQ5cUFZeCtST0RESGpnMHNTMDlNb3d2eDNaZUZWVWFLdWZTUGVnVkx3T2lF?=
 =?utf-8?B?eFlPMW53RkY3M1VlL0NZY3VlelQ1dGw1UmdnZE9sbFQ0MWVPQTJXTXFlcVk2?=
 =?utf-8?B?Z3pBbmpoYXhPUXUrRDdMRFBKbUpYQWVLWkVHT0c0M01DUll5em9vTTdjSmpF?=
 =?utf-8?B?TkFDWHFKT3pmR1RlOU9oS1U4YXNuQ3N6c013NUh4ZHRxdmYxRzhEMzlSZTAv?=
 =?utf-8?B?bkpYc2RqNzBrZ2h6d09EZnRvY242YUhJTm9YV1JzUjJ0OERTc1ZoYzhiWXc1?=
 =?utf-8?B?c05jc0p6d0ZNRGZ2RnlyT3JwLzNrSC9JazJWRDdrNG1YZHFjTXF4amFIdzFr?=
 =?utf-8?B?cmZWRGVNd2dTR0ZIR0hFK2JBSFQ5Q2ZaL0tJWVFyMzJIMHlTdkFxZ0c3QzRm?=
 =?utf-8?B?MVpjZDljanJWcEVSc2wwemNDcFlVQkg4TjRZbWJsM0VjeGtieW5XMTBpNkd5?=
 =?utf-8?B?ZDMrZkJBK29hTFFvZUxhVlNwSmx4anAzeVRrNTRueVlyWDNzT2R2N2xoTzZa?=
 =?utf-8?Q?pfEn2iY8ZZcMfTIAHfnZX40+t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 459b72f0-15ec-4ed2-c45a-08dc8610c964
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:09:43.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP616JWWjCniYQhC1Z86DKp7plmjU04AP+uAoMq/nfpnvXCLHLjq1dzoFrEcRaNvYbJVNkAxn5sofTirR1XJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
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

Hi Matt,

On 6/5/2024 6:44 PM, Matthew Brost wrote:
> On Wed, Jun 05, 2024 at 12:16:07PM +0200, Nirmoy Das wrote:
>> xe_vma_rebind() expects write vm lock is held so start out with a
>> read lock and upgrade if a vma rebind is required.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1894
>> Fixes: bf69918b7199 ("drm/xe: Use xe_vma_ops to implement page fault rebinds")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 25 +++++++++----------------
>>   1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 040dd142c49c..543cfa9892f6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -153,24 +153,15 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   		return -EINVAL;
>>   
>>   retry_userptr:
>> -	/*
>> -	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
>> -	 * start out read-locked?
>> -	 */
>> -	down_write(&vm->lock);
>> -	write_locked = true;
>> +	/* start out with read-locked and upgrade of vma is needed a rebind */
>> +	down_read(&vm->lock);
>> +	write_locked = false;
>>   	vma = lookup_vma(vm, pf->page_addr);
>>   	if (!vma) {
>>   		ret = -EINVAL;
>>   		goto unlock_vm;
>>   	}
>>   
>> -	if (!xe_vma_is_userptr(vma) ||
>> -	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>> -		downgrade_write(&vm->lock);
>> -		write_locked = false;
>> -	}
>> -
>>   	trace_xe_vma_pagefault(vma);
>>   
>>   	atomic = access_is_atomic(pf->access_type);
>> @@ -179,9 +170,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   	if (vma_is_valid(tile, vma) && !atomic)
>>   		goto unlock_vm;
>>   
>> +	/* xe_vma_rebind() expects a write lock so upgrade the vm lock */
>> +	up_read(&vm->lock);
>> +	down_write(&vm->lock);
> You can't do this, or even if it works it is bad, bad practice to drop
> the lock as someone else could come in and acquire the lock in write
> mode. In this case, a user unbind of the VMA could happen and the VMA
> could be destoryed.

I didn't verify but assumed vma is ref_counted but anyways I knew this 
wasn't correct

so tagged it RFC :)

>   Now the VMA refs below are accessing corrupt memory.
>
> I have on going refactor [1] here which just takes the vm->lock in write
> mode for page faults. I suggest we just review / use that now.
I will do that.
>
> Long term I think we need to audit the read / write usage of vm->lock as
> I'm almost certain we have broken the intended usage of this lock. Or
> honestly maybe just change this lock to a mutex as I'm unsure if the
> read vs. write buys us anything and complicates the driver.

Yes, that might be simpler.


Thanks,

Nirmoy

>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/133628/
>
>> +	write_locked = true;
>>   	/* TODO: Validate fault */
>>   
>> -	if (xe_vma_is_userptr(vma) && write_locked) {
>> +	if (xe_vma_is_userptr(vma) &&
>> +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>>   		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>>   
>>   		spin_lock(&vm->userptr.invalidated_lock);
>> @@ -191,9 +187,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   		ret = xe_vma_userptr_pin_pages(uvma);
>>   		if (ret)
>>   			goto unlock_vm;
>> -
>> -		downgrade_write(&vm->lock);
>> -		write_locked = false;
>>   	}
>>   
>>   	/* Lock VM and BOs dma-resv */
>> -- 
>> 2.42.0
>>
