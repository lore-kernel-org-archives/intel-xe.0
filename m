Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30597CA6017
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 21:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12DC10FD81;
	Thu,  8 Oct 2026 21:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW7is6VE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120910FD81
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791494171; x=1823030171;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SrG6AxmQ0Y5hWuIpBnQK6GNc1MgXdI0Zb3iGolGxfP4=;
 b=lW7is6VEH+lsUDLQY5J6yPVuoWW5OzMNeJP8w1yttD6FmnQm9A4K/B52
 p4EPhDZhbTZ1JEsn7pSdu8F8qqkQ4LzoXqmCXCJZiS/hX1Ie1Wwp3cx0P
 e591lH2uOTfyd55VgU0naWWvaQsCt2ZP9wnmzxKTEbTNN+ZC28bFQJX+B
 T7/huhN2aNC+RHeKmS+KADCtS5L2SuyRxd4dldEvWfROHGfZZq2PL8bPh
 41oEspLTkB5YO1qqvXKM8IJ4xTbvC4nkdADhbuuQALlb3e9ya795y3o/w
 3ffI5ZZR0Ee0vfSarYiNcNgAe8ZxNaf2GE5dcPUGIWY8NTNYvRH3CLPru Q==;
X-CSE-ConnectionGUID: 6B0fG+6iRqSixI4mv+IxEg==
X-CSE-MsgGUID: qfre/nEUQruntNfwJDpi3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="163921"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="163921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 14:16:10 -0700
X-CSE-ConnectionGUID: IWfsKt01QhC8lE1tns2bMA==
X-CSE-MsgGUID: RL87k/5FTrqOJ3Gqc4ixSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="86708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 14:16:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:16:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 14:16:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 14:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g43dDtU1trgTN8WhhZFpMkJy+D6irjPhY/9nqbdKt5W941Gx9JI82ypzzFKGM2wm3bg3kM9mhrBpZ32Z77g6+xRLCwv149SOTvr1ybb5u8bxxbeYW30e3GXKsJmVkFlirS45R5jdx6jCVjtEbxRwlzJ+QTnyeBnW4Kbi1ENeJM37ufap8zURhEYDlOBnu/y4hG6Z3CUB/cUqJIAvlviTGNkMilTKlZ9FSdtw0hUs6O4J/v5huvC/L2EGCK6USll5d21nBijR7oEKIWNL/Sy4ebiFHlXXUNNsW0yxSyhBF3P7vZrHwxIX30TTuYHuPKBESsJq2m/XVO2Z19UHNOcbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtumUzgT+yoQb6AnsMUXVv5HGHDQK8MyRvc9o8jbC9s=;
 b=CMXX25Reeu8MjgCT/I7K1gbVWOD5Gb7Czz05n1BzabPtkRuJDtQeF5f6qsAIezgyTL9Mjyccwj6GAlvebaTyuD7fHDzothnul4ps4NF++KQe99tbcLu4aGt8osUSLl0o2YON263EXZXGSswtojQDOO7M/IZPUNHl/LLuRduuAyrzIMtrPiSr8+DvdT3Qp0B+HN9xTZwmOJAfwm989WgX9PX1CLH97EZHDlbP1uGST1N2Iktf2L1AneM+WSiqX645i430O8ct2rKe+FVwiyPcfmdo6IrraAJw8y8o52I29urvS1FBas6UJ0J7DRW/IB4CGuRYVbPCukqyoyzlqeOX/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by DS4PPFEDAA4523C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 21:15:58 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0472.016; Thu, 8 Oct 2026
 21:15:57 +0000
Message-ID: <e5bec637-424c-45c1-a2ef-803334143728@intel.com>
Date: Thu, 8 Oct 2026 14:15:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] drm/xe/guc: Make ct_dead_capture available on
 non-debug config
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <aravind.iddamsetty@intel.com>,
 <mallesh.koujalagi@intel.com>, <alan.previn.teres.alexis@intel.com>,
 <julia.filipchuk@intel.com>
References: <20260922231758.2695562-9-umesh.nerlige.ramappa@intel.com>
 <20260922231758.2695562-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260922231758.2695562-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|DS4PPFEDAA4523C:EE_
X-MS-Office365-Filtering-Correlation-Id: 358fe79d-2f99-4560-33e9-08df25815884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 52tR4hItO+WvjzraFYRFGX5kRs2b/lwn6LWyUwuRzd3UjcHvlcFKI0/J/CPh4jG11LvaZ0zgAWuhFPqkNSTnrc3Wi1aB0pQapZcb/lAKzXwtzqcLxsRvY3hU0SFaCJpMN4gaIvF2Smuzz2gK4WiqcCVgbIiNm7r7nlRwQjppCJgGqVNO/CCUArhDUxHiR9EgOfC+L7Wg8ftPjb7VPlAeurEPd703/omRpTLI/tfnhLjcMdKYeaCWUPBDKILpAzV4hzWdFyolxlsJD9zgWeHCa6LFmbas49D6e97vjp9S7GZXoOO/vUObr/I7L5zgCRKJKeNdRj2/PzZGALF+ztutsaDuq+8W66lvLc7vZMsPKACp6vkFBHi/U8bKDGMaQM6faBR/B9UjA4619+M9c8kIV16vwcuSzBGev2jc5vYWWbIax4WuINjIHZLmY2RMEETwvFJpSWrBJR810xycPE4aHBP8udNKoH9pins0sSoyMQUF+yg0I+vCvw0QU7W9/dLkU/MT1IPmR5n0S+NzFM/pMRbJmHPlWVTGVX8Uo8FFIn9Dha97+T4jjdj7SvKsNi7bCC5vlK3uL1IahUBfJxsY+jtpfUo4IowROBsFfXyAtYlxZnsG+MNK/81DTN4ediRCWCmCYkN2atcUVPnUrCoVdcWppP3ZIrYbWnGRXUI2sI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFIyMmJFSnROeGhhTFhnY2FtUVVKbTRjRTdnczJsVmV0MHdsajVTbElHcTdQ?=
 =?utf-8?B?aXliNURnQ2VtZkdDZEpraDlKZWhYTDhZRUQrOW5jUnZJR05qbUppaExYN3VT?=
 =?utf-8?B?S0V5WnoxNmZWS0grUS9oZnY4RXQxMkJ5THRzcnB1Q291VjhEdytYV0dhQUcy?=
 =?utf-8?B?MHlPSHJ3V2tYWDNCSTFWMDNneU9kRFB3NU00RmlZYlpGb0htS2xDZnJpbk5M?=
 =?utf-8?B?K3c4RmVUMVhYVm42U1Y0NWZLT2lhSjRCUTF2aytFcHpjYnYrYURaN1pUU2Z5?=
 =?utf-8?B?Zk5XRHhwUzA4bEhvUWk0dW5ydm5ES0hQZG9nZ0J6VEZLUWJrSW9vakZRTERX?=
 =?utf-8?B?RVJvc2V2Y0ZHVkFtVTMvUnNXaythZ1hxb3N5TnUrWmVlVlhmRFE0T3FhRHRu?=
 =?utf-8?B?dHhXajQ0UmVWdWg2eTNzWThJVjh2ODNCamlkVmpoTVRlTXZ4Wnl3YXc5M2tH?=
 =?utf-8?B?YkplN21nalRrcmptaVBoNU1wTEFKSTNrSUQyU1NTVDFMZHVVTlRkeWVsVG1N?=
 =?utf-8?B?eTUzbHNIU1d6aEFsancyQ1V6cjJxRG9CUVlZbmdlbmR4K1QwS2ljdzRUY1pS?=
 =?utf-8?B?aURoT0xNcmRjSTE2VDQ1OW5MejJlT2lFcE1JM0ZLVDc0cm9KSUx2blU1UjlJ?=
 =?utf-8?B?ZHdEYXB2cjEwYkJLa05qZGtIYmVNbGtWd1dFMEZPUkZvVjlrRDVDYjN1eEk5?=
 =?utf-8?B?ZVFFbGlRNk9xdWZXTkFnTFlJNFhUZzV5NGFrSEpGaENPNmVhVVJFT294V1Zj?=
 =?utf-8?B?cDJ4bFdybzdYYjcwd3dxSWRzaUU0QmNqKzNIMHRQaGNLSTNaTnFJM3NHYStF?=
 =?utf-8?B?QW10UElMQWpYa2Q5ZEZCOXVrcVQyamhJTkkzM3NnQXl4TzkwZWZzK1doR05y?=
 =?utf-8?B?ZllkV3AzRDR1V2NRZW9pWWV3RW5vcWk5VEVmakE5eUhUVFRYZnRLL2EwQ0hF?=
 =?utf-8?B?SjAwVFVyWlcwQVdRRmRzbkVWZWVsVVlnaGFWQktBK3JFdTJHN2pZQm5DbnVr?=
 =?utf-8?B?UlF5czdWb01SRFZxVXFWQ1hFME1Ed3ZKVURGNFlJOVFsZitrT2loYkV0T1ht?=
 =?utf-8?B?VDNBREIvWmpvdkF2bDhaL3U2TkdJeGVRNDNIZlNjZTlsRDhLK0pJWVVwdS9U?=
 =?utf-8?B?cy9aTnNQb3cvUWRIS25lVEdyUWIwR3NZOGwxdTBSRURnZVpnTGtzVVpoOHpD?=
 =?utf-8?B?ay9wZ21GTEIyRXRYMXExdkdrU2U4Y3hOdE5zUGwxRDR2NVptKytwUCtteEFs?=
 =?utf-8?B?MTR2M3VoSXUvdnZLTUZPOTJTTDdkWklPTytOMWtZNVd5YklZSmRxbVJmY0w1?=
 =?utf-8?B?eDhNeXE1aVNIdlVRUTRsR0FYME1oTU5aQXRFLzkrNU0xd2wxcXBIWi82dUdL?=
 =?utf-8?B?aFFUYUM4ZEtpTTcya3RUYU96QmRYR0V5b3JDYUZEK2JvRkpCUXBQZkNHNk96?=
 =?utf-8?B?eVlMYlFhRHNBZG95NkVEaWlJVE85MGU0emFteUJ1TjNjQ3JxOWhkYlVnOEtU?=
 =?utf-8?B?cWdMT3VDeFN1S2hxak5yaFE1dUtSSE1IVEJ5M3JwZlRFMVZuU3J1VS9TNTlj?=
 =?utf-8?B?UThlQm1MZXJSR0RGYk5qRUdiYVNkM2FLckFGVlJsL0pjNEU4bXZpRHZ0aXBl?=
 =?utf-8?B?REdkNXk4WG5FTmhTZ0V4azE3SXZyODRpM0pBVHpXb3VkRldjTFl1cWd3SzN2?=
 =?utf-8?B?bmN2aDdWeWxpNk1LS1RuOUM3UHZ6dEVnL1VZeWoxQlBEWHZOVCtzMHBFcGpN?=
 =?utf-8?B?QmZGcUxkZ0VvazdGaDN4YVF0OStKV0VDcVl2bGJ6cVU0Z1F6OCtXQ2RiOGdw?=
 =?utf-8?B?cXdtbTlZUmo2WkxpeUIxRE95VHFLWTQ5eFVqY25KdnZXU2F3cnMwNUw4L3hK?=
 =?utf-8?B?aXFNQStiayt4V2ozM1lRbjFSODdxcGxWY3JLSEYwTm56WGlCaXJIZFBjZDVh?=
 =?utf-8?B?RHkxd3ZERjBnU0crbXk2NkJmUVhYYmVIclY1RitVVEJ0azV3RW5yMjE0V0lo?=
 =?utf-8?B?THhBK05MOUYrbGozR2F2SVRwSjVSTWlLYVI4WFpzR2RrbU12Q2I5c2t4dnlZ?=
 =?utf-8?B?bGdDNmQvRmhQbzRuV1VxcXcremM2TzVsWHhNT0daMjIrbjV0bE44R215aE1D?=
 =?utf-8?B?cWJvVEs4b3dzUmUyYmVWeGRRb1k0TXpjNzd4dDBYWXRzNkcyd2VSN3VTY2Q4?=
 =?utf-8?B?TkpGNmF4aXFSeDRWdmVQUEZJT2VsOElBclo3U3dhTEdPK2xveTdWZ2p3Y0dn?=
 =?utf-8?B?QXVlVG9qMHRXcVRxK0N3LzRQbDYvbG85QTNzalZZbWM2YWdhUGRPa1hkMGRJ?=
 =?utf-8?B?eERVVXNmVnM4UUN5dEJaMEhYYUFKR3dzRzFNRXA5RHJLWVJJK0VrWTc5VG5n?=
 =?utf-8?Q?gfdjJTF8csrlWU5g=3D?=
X-Exchange-RoutingPolicyChecked: dDsGtSFmDZJxRvBiGv17KnnJzV9li9IyB5lZUrsWq6bkP2Yt5sXP5C3HCnUzhDiHLdC2NiHX7kNgZakeZgW6L9BeBc1eRSQ3PsmCcn1DokKtWE6Yg6RvsjUXmuv4wNXV0kTuIsnpY4/sIeX7GSQhAS7iFaBXJphxBbmG/3Iz9GA5oP46DkhuRXgE/c4Taldrq6OfVACqszGpmlNsnfFXTWcnzZALyNWLvnNJ6qZ0NQnYZ3T+SGaM3dnMcnGv90s07TYR0uF5ogBsGPC4GtL8J4fJGAeBQG/0K4eE/jrMFfHQxlg+zO4JeSESqSeaAvTW4X/g2Ojjq9NwaBjzIu3jbw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 358fe79d-2f99-4560-33e9-08df25815884
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 21:15:57.8258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W83S6u6spTsdOmzw3qDXs6VZ15DM5ntHXfBDKJX6jLX2bf3Lvvg8f5VXjN+uQ1F1LF+wg3cyabcLAfw0uu+0opWoZlMqWt2ESaQAIrRwTn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEDAA4523C
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



On 9/22/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
> Define ct_dead_capture for non-debug as well to simplify future
> refactor.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
> v2: Fix CI build failure
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index ea59c1bf0c3f..9d9bb3028d52 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -59,7 +59,10 @@ static struct xe_device *ct_to_xe(struct xe_guc_ct *ct)
>   	return gt_to_xe(ct_to_gt(ct));
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +#define ct_id(reason_code)  CT_DEAD_##reason_code

This is only for CT_DEAD_* codes, but ct_id() is a very generic name. 
Maybe use ct_dead_id(), ct_err_id() or something like that?

> +#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), ct_id(reason_code))
> +static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
> +

nit: for clarity, I'd reorder these defines to have:

1. enum
2. ct_id macro
3. ct_dead_capture
4. CT_DEAD

So the user is always after what it uses.

>   enum {
>   	/* Internal states, not error conditions */
>   	CT_DEAD_STATE_REARM,			/* 0x0001 */
> @@ -82,8 +85,8 @@ enum {
>   	CT_DEAD_CRASH,				/* 0x8000 */
>   };
>   
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>   static void ct_dead_worker_func(struct work_struct *w);
> -static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code);
>   
>   static void ct_dead_fini(struct xe_guc_ct *ct)
>   {
> @@ -162,9 +165,6 @@ static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action)
>   	ct->fast_req[slot].fence = fence;
>   	ct->fast_req[slot].action = action;
>   }
> -
> -#define CT_DEAD(ct, ctb, reason_code)	ct_dead_capture((ct), (ctb), CT_DEAD_##reason_code)
> -
>   #else
>   
>   static void ct_dead_fini(struct xe_guc_ct *ct) { }
> @@ -173,13 +173,6 @@ static void ct_dead_init(struct xe_guc_ct *ct) { }
>   static void fast_req_report(struct xe_guc_ct *ct, u16 fence) { }
>   static void fast_req_track(struct xe_guc_ct *ct, u16 fence, u16 action) { }
>   
> -#define CT_DEAD(ct, ctb, reason)			\
> -	do {						\
> -		struct guc_ctb *_ctb = (ctb);		\
> -		if (_ctb)				\
> -			_ctb->info.broken = true;	\
> -	} while (0)
> -
>   #endif
>   
>   /* Used when a CT send wants to block and / or receive data */
> @@ -2372,4 +2365,10 @@ static void ct_dead_worker_func(struct work_struct *w)
>   
>   	spin_unlock_irq(&ct->dead.lock);
>   }
> +#else
> +static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)

This doesn't do a capture in the non-debug case, so the name is now 
misleading.

Daniele

> +{
> +	if (ctb)
> +		ctb->info.broken = true;
> +}
>   #endif

