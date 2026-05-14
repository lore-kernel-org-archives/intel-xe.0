Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F920CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 18:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D75510E170;
	Thu, 14 May 2026 18:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7UjF3GJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52F010E170
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 18:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778785021; x=1810321021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FutiiQNqqDAkLgbea0oMPLc5nV4UN5E+a2czN7uaNfM=;
 b=F7UjF3GJZ4A+dFZlfPzaXek1A1318zqy4QnuvmEVsusBe/BX3eIVaxi4
 cZqw5WMgI1Q4qV7eyVVOF9V/4b40dn54YDFR6JhC80wtgAXiWn2Z1muke
 T2LKWCltzHeN/Qd7qdKFsxEmED1UhQxDYYGPNICFI03l9a14IVRP+xvzG
 C6paurNDH71i0ujsI4+3RmkrlL07bxC6AA62yojvS2WOysBolPMrP2MLv
 cpoYnstAXf0PEGIx7f3ntPOoa9mbNlQpXmvS0LSZUUOyU/6wPp6GtS0WO
 Db5OLPLgd34EUU0S/+xHkV9uJAgOI7bDssGJVIfqcuUpR9Ak7B1ddnWLg w==;
X-CSE-ConnectionGUID: Xy1y+ob5SvO6CpreVqFUyQ==
X-CSE-MsgGUID: d7wHWGfDTSW7sLcuDtsprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78762011"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="78762011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 11:57:01 -0700
X-CSE-ConnectionGUID: gxLg7rggR2KH1mVfMTFC3A==
X-CSE-MsgGUID: VIVOmw1bRx2Mdju9F/CWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="234034804"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 11:57:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:57:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 11:57:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 11:56:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxOLPaoADjjhoN7IGEEOZjl7cdGq163qjmxbor9NeVLebJo0v7yNmsll9lLsucLJjDKATy071W2otWm47k/4/kLg1i0e/XI9np9bw6XiCKeC8r3R+vD/Zsd5QdP73igJZyYVH6ODtr5IiiTFemdyl0cNGBMjT0j9EwMDOfm7p22ycZvTZYKi2QNcvs9lCUAaYsqNdklusIOv+GY4tifZP8rsucQd68pRwwZZ1JQ0/wnKgmpJvWySWdxjDzLXvoGDdncpFWk2Ac8s9ARAExyV+EFZvM26tdDR5nReIA6OtOfK//xt+4OlnF3LK3iHyr/rosXndd0AjcYVb7OYw8jIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYF4xS9RWOkuvxUXioIWOVyk+TAytAVEMLi1bk1vd3c=;
 b=fmyJ0Lwl5y2GubzAP0jjsKfkAKM6MOrUNh+C8AGYnNIjcoEfdJqNFQ9GFQgf4lWsdjmnb5ZbZjCLoboeZ9kp2QapkuvqrJH9WwB/oUO5PU3hlSr6UCjEuLxIov58bomNl20aE/cCsHuSz5f97ZzC6GeGx+lQLQnVCZz5IW/jo79NcnT6cl1gNnprmlDfMm85Cw3SJfZ1KxWvL6XHHMbd2aV365Z20+NEcjBrrTVcix7MNJeGVcLeYq4wqhxZ0QS/K4yV06GpYm3n5G7l1rZPzOxe0wvSFDqo77vjhcVFmDulaQRMcnPqtKlPHOc1NLyt1wKYXNkcGUepKv9qG04OGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 18:56:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:56:53 +0000
Message-ID: <2013c0e7-1c35-4918-ba7b-64d556b31610@intel.com>
Date: Thu, 14 May 2026 20:56:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/pf: Fix CFI failure in debugfs access
To: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>
References: <20260514090352.1554803-1-mohanram.meenakshisundaram@intel.com>
 <20260514174918.1556357-1-mohanram.meenakshisundaram@intel.com>
 <20260514174918.1556357-2-mohanram.meenakshisundaram@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260514174918.1556357-2-mohanram.meenakshisundaram@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 815b3319-c1ef-4fa4-ca12-08deb1ea9007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7jk9xjyxTXyshQH2cJYrR9A5dJXvctP8ngB5t7a1z5ff7UnYAdfHXLdTvEKdmKnaDFGV7iXeKMX8SZw8Yz96DAEY3zEMR8/J6QuyAUhtRJHsXh1RHatckUZqVuVLo59c4975eI0B6t+gNvSqMTXCVaZiEkvZroIvLWVPZqfKzalD2WRHTppjCy83z+TlgMYJPkSu+n2UM3x5jaUequb96IgWGyMcaWy1v5ZWvC8hKgi62o81UPLUMxQOL1U8/4aC2pTZw8H60XmLltcim59pqLcfKuYeRdC4MQnifDUf2EMmbuhBB24hksUsz0zhq5y8bN1ZhnETdmaotfS7dPFC37GYrc5TF/mjp+5RLZrYCQ83tN8T3bsn7rvPu55+HKS8uUuhB19za+Ku1AJBHPBAKrd/MJb4PKJWSmAKwIaCP0cMIHnoniTC7avposuD3c3i1OxL3iBYSa4sj+VwZvMtE6aHaVXzZpSMoxviwoyRglR04YQQVaUhtJUfBMv1Uvcuy7VwM2l02/JM7MjCw89cYxOSEwSB6klgs+a89xtRxpdFXhFZ9eGWaAxpqe3HHYsWZfLzovMGeBuPLzZPha1qU/ToJP/oZG/XSXsSvAByvWC3OHK9jkdvfwf46ltmHB6cB4iL89NOZYlXwfP81PjwWvqKLaZgq3fwcQccKbBLnrKf/WO7y+0bwuDO1I/q37D6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2EwSW0rVlUveXR2djd5ZEJhMkpVMnJhYU55cnhmdFJ4eUNXbWIzWGZTeGU0?=
 =?utf-8?B?eDVlMDM4WmlyTXJSQ2Z5MXhXZHptbjh3RDRVT2pZWXk1R2ZiUnN0RW9mT1VP?=
 =?utf-8?B?U05ob3Y4M3JPaDNCMkRONEJqRFlPZ1hCTXB2SFlRSlJObXN3N1ByZ2xYem04?=
 =?utf-8?B?bHg5RHczZjVqZnZpY2dEczBZWUFQa0JDc1dvRUk0YkVXdDUyV3lxdTg1MVNn?=
 =?utf-8?B?Syt2bWNVVk9wNGo5Ti9pNmk4RzJUK1VOcDVsQVR0ZExGRUp3ZnN3YVgwbncr?=
 =?utf-8?B?NGdROXR0Skk4NnFSeFdmamgrcFhUOThBM24xc1RvOWxzQU1CNjI1RmRBU2t5?=
 =?utf-8?B?MFRSdXhUbmFlcVpHUHVIZnB5bDB1a3pjZmozSk05cy9rbHZxUDRnN2o0S0hW?=
 =?utf-8?B?YWlVWkZ6aTFGeW9vQ0N0VEtkbUZHSVhIZFV5R3ZVcGxLOUxhdThjcXMyNUZo?=
 =?utf-8?B?d0k3RUVsU29VOVJLZDZtaWpxY05NanhMYlFTc3pxZi9Oamc4bE9LckpJUU1u?=
 =?utf-8?B?VHBTUEJxVGJhZ2p4V0YzTFlsNDUybzgzWVlwZGFFc212UytqeklraFJSTjNl?=
 =?utf-8?B?M3p3Wlh4dVZieDUxdXR3U1dtcWJrT0srYWRFVVVHYzdSZ2tjSDlTdEc1WG9N?=
 =?utf-8?B?RjBYWDhST1BIS05oM1FlUklvbHloZjgvSm40VExyakhBZlRiMElaWU0zcnJo?=
 =?utf-8?B?NlhLVUJvMU01RDhxUzErV2FCTWxjOExLT2p4N1dndkFkcm1neHBoTjdGQjZE?=
 =?utf-8?B?UGlUS2Q4WDhYdG9aV0NsMTNxeUNUMHpTOXFUUDY3NGZTWUtXK21laVgzaW0x?=
 =?utf-8?B?cDYxZ1lDMHFNU0dJSE81cTdYdWVwb2poUXYwTk1XbWtnbERsWktaS0s5Ny9q?=
 =?utf-8?B?UEptZW40S1RoMk5xeUxqMkVzOUhyY1JKV1hSbXI0VVh4LzJPcERKc3FUUVYy?=
 =?utf-8?B?UEx2dENweGFYMW94NkhiaFpkdkEzUlRrUS96alQ0ay8xQkZtRU5NRzBLZ254?=
 =?utf-8?B?dDZNZ2QrcytjU3N2VGNKdzMvWllkNElwTmpzeW5ZWE5LeG5LOUhWM0lxRUdE?=
 =?utf-8?B?WXJYUTNkVmhNa3NmV1NSV1FNZGYxTDJUeVorTXB2VlJuNUpxQ0pnRjRCTmVN?=
 =?utf-8?B?MTloOExhOFlNM2Z6NGpBRzJQcWFCV3pPb1l5NUt0N0dtNGU3NmRqUGZtUzE1?=
 =?utf-8?B?NDJFYjBZQ3Yrb2Mwckp5OWhoQjhpU2ZYeHJIZzhmanl2cWdEU0ZpUFU3UkhE?=
 =?utf-8?B?OStyN003aFBtRldBeUhGbzJKT09RbGI0dUIrZmVDQ2haWlltUVRlVTg1U1Er?=
 =?utf-8?B?TXRYTU9ibWJvSjR0V2pPQjFuUEdqNytrSWtGYW0zOVNCelFUenFqZDJFNURp?=
 =?utf-8?B?bE80VlpLYU9Nbm5IUytJTk1BRFJUTXhoeDVGR3cyckRLejZwVWFva2ZrMlJN?=
 =?utf-8?B?bHVldFloWC9pdUR2RUZlSTBlNmJ2bDFvMEkrZ2ZsWkpVSG9Va0tyZUJDdGY5?=
 =?utf-8?B?Nm9WelpLY3FWbWRBOVQ3Q202QllqcUU3RDY5QWZSREp1ZVZJdm5XMTdsTUEz?=
 =?utf-8?B?K0hhVEIvK3V4dGhuZU9Ra0I4VS9BWTM4clhPNUYvdFg5cVhaVit4bnFUNEpa?=
 =?utf-8?B?R3dJeUZIS2FIVUtKTDN6ekMwWnM3Y0J3RkxtVWRGOVVxdnVwQWoweEw5bFBm?=
 =?utf-8?B?VzBVUVo5YUx1R2tPQlZJSE1MSHI5VHhhbHY3NDZTSTlCU0RaR0lmWk9FWERC?=
 =?utf-8?B?VmlPWDVxU2c2OVorcDJvenZDWGw0b2pBQjdOM1NsSkVzVkJ5L2RERFNORllQ?=
 =?utf-8?B?TWNxaVl4ZjJzSmx6Qlg0WEx5UkpPdGNRL0FBTk14djBlQ0Z2QjJtbVBGbzNL?=
 =?utf-8?B?RGhlZlQ0alkvM0lEQXlrTVE3dnpBNWZZcmpaYzRKWHk0Nm9peENzRTdZMGhk?=
 =?utf-8?B?aHJRSGJrVzkrTVl4NXRFK1c1MnlzOHFUMTFzU3ppYmxpTzRtbXFDOGQxeTBt?=
 =?utf-8?B?SWxDVFdka2orbXIrMFVpTkE0cUZuNWFSN2RsZXR6amlRSHl3UHBpc04vYW5i?=
 =?utf-8?B?RjlHdmQyUmVORTZCV1NqYVM0eE5xYVZmREduWUpZSG1vUHhOd0NqNzJIV3lS?=
 =?utf-8?B?aGxld090R3JWMnVUUnBpaGFjUTM3Vmtlc3U1aTZ1V0ZIbzEyaktjZHFnZkhs?=
 =?utf-8?B?b294TUNIazJhSndkK3l2bjE1cys0cXp5RWx1bUo3alB4QVdXMVdHaWNOUGhR?=
 =?utf-8?B?T1kxS240M1hBbVlVaGhuYXNzUlI4c1hlQnB4ZTlFakhScW51eXV1U1NqTkRy?=
 =?utf-8?B?K293enRHeDc5ejFLaStVMXZPS2hOQSt5THBWV2xVRTRvSDhTYUxvZEZMNXNy?=
 =?utf-8?Q?nrADfRLueLcCEd1M=3D?=
X-Exchange-RoutingPolicyChecked: mHLhDjg6NgvOHUpNpzKPp+jxtfMZ7G9pGAZ1De39dBAb2tjNm2w+KAq+cSnoBD6NSiXDm3AY9vqimyiiNVqT3i1AESzgthFEdx95E9kA7WtPpeAAqsv3EW29eid23gf/17lRuzyuW5obBweYZRfqj6svPnpFC+xUoyv8tEzeRhLCaHQO68bBSlY69x3gajCtk2g96pQM3Tbsm778n7xgnsm+/RGkjOJxW37fXZg6N6jdYqDyb7irnyErXLA/KTPUyONqOTXpici7UnGGwuJb49pO/Gt5Is465NJ44lFXeAWiL035ycz0c6cqP8mg78vuyy/ZHRXqAlepegE1F4tWvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 815b3319-c1ef-4fa4-ca12-08deb1ea9007
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:56:53.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+yF18lWmalyHDEM1Oprr/MBqYR+V8OdYPvK8Y/3yjIOtUnif69/NzUZy4zdo5kSblTdf96erG5/E6Ny/ghnlHpZW1DLB9upRY44Xz77jOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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



On 5/14/2026 7:49 PM, Mohanram Meenakshisundaram wrote:
> Reading debugfs file (/sys/kernel/debug/dri/0/gt*/pf/adverse_events)
> with CFI (Control Flow Integrity) enabled, the kernel panics at
> xe_gt_debugfs_simple_show+0x82/0xc0.
> 
> xe_gt_debugfs_simple_show() declare a function pointer expecting int
> return type, but xe_gt_sriov_pf_monitor_print_events() is void return
> type, leading to CFI failure and kernel panic.
> 
> [507620.973657] CFI failure at xe_gt_debugfs_simple_show+0x82/0xc0 [xe]
> (target: xe_gt_sriov_pf_monitor_print_events+0x0/0x130 [xe]; expected
> type: 0xd72c7139)
> 
> Fix xe_gt_sriov_pf_monitor_print_events() function by updating to return
> an int type.
> 
> Fixes: 1c99d3d3edab ("drm/xe/pf: Expose PF monitor details via debugfs")
> Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c | 6 +++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> index 7d532bded02a..a85ba4435378 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.c
> @@ -114,8 +114,10 @@ int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32
>   * VFs with no events are not printed.
>   *
>   * This function can only be called on PF.
> + *
> + * Return: always 0
>   */
> -void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
> +int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	unsigned int n, total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
>  	const struct xe_gt_sriov_monitor *data;
> @@ -144,4 +146,6 @@ void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p
>  #undef __format
>  #undef __value
>  	}
> +
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> index 7ca9351a271b..0b8f088d3a16 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_monitor.h
> @@ -13,7 +13,7 @@ struct drm_printer;
>  struct xe_gt;
>  
>  void xe_gt_sriov_pf_monitor_flr(struct xe_gt *gt, u32 vfid);
> -void xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_monitor_print_events(struct xe_gt *gt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
>  int xe_gt_sriov_pf_monitor_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);

