Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BCC79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 17:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4A210E8BA;
	Mon,  7 Sep 2026 17:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fzQ41u9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFED10E8BA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788802548; x=1820338548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KiFyUg4D3OjzWB7Vo7ufVBBaH3+GbX4F2wyR87bORCw=;
 b=fzQ41u9BZoh+XzSfLz5MKMcadlIbi5JC1SogkHlero7Gaa0Bs9qo9rNP
 908bkglG88DluVAiMNym2k0F6SR96YjDt5sp4QEMi9WNVDZ7WvyH1uSzq
 WxlLFRKdv2b2gU/3zuN2ISdRu/K5HjyihXM9AavlWV2yGfWQlqHNs+9TI
 EQOG6LlChzeeZT8VZ/McVZxcpvDQ49xNNdm7A+NxzWKWeBsiYyd7FNBuR
 E+iqOLqcRdTNuVIe/kNZmuX0gEWf9dAH+tRZBCwmLmVMPXUhMf/Ws3ONj
 /yRa/4CCt/EKqzfbpLgLIiFHVss0amsLMyGBKy6au/oswqPKOZk//eiOl A==;
X-CSE-ConnectionGUID: +du4XDhiQOqmS1TNRO37HQ==
X-CSE-MsgGUID: v/qgbPZOSai/hiE8VUacOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88142526"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88142526"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:35:47 -0700
X-CSE-ConnectionGUID: 17VTU4qZRF+amk5G657mUA==
X-CSE-MsgGUID: yi/q+VJIRUaV9F50BvKu/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268191018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:35:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 10:35:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 10:35:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 10:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwBouEj/4570Is4rYgtWgFRCC3lsMibSL0+tNyU2b+uUf4EN5rdtKCsKbzqjf4tsA9nhTwogbdNCOF8fGdmh/VRl3DxNlaUS5a4s/2F2ZTv8wmzCHJ1tZfRGFMVlHItN5jnHxTTMmbuO+GPPYEOIQNQuNVdnk/jSeGteFF9ykaY/20nPWOD2gWEC7p/db4CtfunzC9N8n/qd8m5UNuEfui+exM0Zb7JccYnWHmZwkCJE3a8JMmp53RA+VSCzwytAnnWFJONKc7IwOFuVXXYftoGyMr95Y8cN4a25eppMPtCcSunogj6XFJjLFkoxBMaJfGyY00FJZLemw4xtxx1fLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1j9o54XOI/uoebR1b2FHfdLslTB4tv//+c52JQzLGbc=;
 b=JCS39doQwJB5npOdV0QdqMvM4Uto/AMuAPqMAoq4X3RT6pYnR7YLArt2iH8iQmJUfUqyKNNponbpEGfEH9+rGAjlYoFS8NNEV3/XJR4OvgSX/sy6hqn0+hXJdNsMblwAWCltp9vpfrU7/j/rG2ZuBSYpjII8AWcsg6Uww4DDCjRjq5S/lO2KgLwhoG0Yhp+7ucNghq3/TkpZARobByOigOLOxwjfixEuMQ69FOFaUnAB2zvmgGtSx26vGAEoUKZ6k6HSd0UD0vJj8T5YhFNb+aPBExhYl1OdalGKWQheHZTf7t5oLpqsWREL7VOv+BL58aroju6RfBG5JtdEzK92rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW3PR11MB4729.namprd11.prod.outlook.com
 (2603:10b6:303:5d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 7 Sep
 2026 17:35:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 17:35:19 +0000
Message-ID: <c921cf8c-25b3-4362-afba-fa38abbbefb6@intel.com>
Date: Mon, 7 Sep 2026 23:05:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/xe/xe_ras: Handle page offline requests for
 device memory ecc errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260907094706.1407436-8-riana.tauro@intel.com>
 <20260907094706.1407436-9-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260907094706.1407436-9-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1235bb-c6be-40be-54b0-08df0d066348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 7I1IMhmpShA7qdYVrmuHqpi/+ab2Ymic5OnC6GpnmCoj5vwNmuiGOhXhUZw2FgvM1j72IYU4eyLwMw84KslYiHsoDo/QzB7kyQsFP5FtHbeymNqYjgnkVuWaxD88E2QejHmPrwm7qRtWTYyB7hWfYZOZTSa1jnQ6/TEUAcpBuNljKOfDtCLkZuDcKgwhj/PPQqJQgchQSX+fCPznoPk19lien22hzCatgzCYNcMBHuAQoXM8Ve2Btn0RPy00OI/UxruigByHM1ymNCDG/UnCnyRTdiaD6O1+5yMwedrCGNEXCIL41ni7LjR2Rc2h+TA3t6TqWpFnjx8k3Rna3ZTofvub0XDMh/Fygf0UrwJYQ4Td1mww+gfL9kZDZ6baDTtnh4lmZHjd7105TTPeXL/CPaziqtwsXMykztvzQyXN6y/S+bp6nV1sZcpCBdXrQBb7vtkGAGGxwSHCZdQp+pXkwchXjS0YHUD8/DofacP7EPBGGB0rZ1qkajFOQi9j0aonHLlUjfUKAiBUdtylrmPcUxUJAe28efRMmELrI3RlUM5pQP42fmKFVqRPOq/08+sMFOK4sAPPIvdTLRSvXAu87LnRdulS7EMYu77uZNnDejH5MNbE4vtMrgHqnX6Xn6930qLVaP08qEI18N6XQBEvqOPdrCZItJHwrFpWLBBEZjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0FRV3FtMCswYmp2ejdNODRYMVdwQTV4VHV6MythQnVmWVo3c1Z1VTdMMFFF?=
 =?utf-8?B?NVVIRzFYeDNRS2VuUnJXT1Z3blhmK1RMVEZnMDdLa2pJU3cwWlQrVTF1bENz?=
 =?utf-8?B?bzJqamFLVjZIS1RTWW54Tjh1NVRPcnFZbkxER3V2T3EyTXZvOUFEeFQ5QUFn?=
 =?utf-8?B?MWdueHlkVUsvY3RMV2ZQaGNNZVJtaFZJU2tuS2xoRHVhdTZ3YWQ2VTRhUUtJ?=
 =?utf-8?B?UjY5VWVQUzRYOEVJWENPdzMyUGNwS0dHcnVMV3ZCTzZyOXBaTWIvdjVEajJ1?=
 =?utf-8?B?TW5pOTg3TmJScTVkMC9JTFUzWCtGR2RFSG1KTVhITGlTMWNNSlBZcExRQzRk?=
 =?utf-8?B?YVlYaUJHNzlYZytJRDRMVFBmemU4MzdFTEsvK0FQUDdROExldW5QazNyMmt0?=
 =?utf-8?B?aEVSM2pjcUozUnhMOVdieWZyZTMwNEl5bUpvNEtXaFZjOUx1QWlkeTY3enVP?=
 =?utf-8?B?YTJwRWF5ZzBMM3BkajRhVzlwUFRYWFljWjlZbkhKUm00VHZDS2pVTnhhaDln?=
 =?utf-8?B?UUxMYlBadlpwYThxelN6bjBzZ1pIQzV1WEdpTDVvSjhCZE1uREgvengwWkJH?=
 =?utf-8?B?MUFNby96eTlpTTgzM082U2IrNU1Ldnd4bm5WMzY3R3hkeUFvRXFZQUJQT28z?=
 =?utf-8?B?d2tDQ0JCQmN3YmF1K0FRMEFLYUF1aHdHSWNsZTlSNEJnUVhpazVrWUUrd3lO?=
 =?utf-8?B?RjF6ekV2QUJvR1N5KzJzMkVHZW5JaE5ob21KcUVuMXpmck9yUUM3QW5yMEhD?=
 =?utf-8?B?dWQyQWY3Zkh0TEJ1OTdmSkJOOVBMRTFJR1Y3NHR0K3NMbUhVYTk4L3M0bklQ?=
 =?utf-8?B?bTZVWlFhbittYWNxSkRFMG5VRGFrUnBvM0k4Zm1GUGNsdk5JdU1HSEtLYzd0?=
 =?utf-8?B?bjZNNFVCVCtMNi9GOC9ZTEt3bXIrMEo5YVV2Vkw5Qk1DUWQ5MS9lRVJvVEpi?=
 =?utf-8?B?QkVGT0FIUGk4aE5CYU8zQ2Z2dk1MdjhNeEJ2ZEFwc0NHZGJuTGpJZkNIRnF2?=
 =?utf-8?B?Y0lDSVV3VmRKNi9EUVEvQllNUzBPM1QvNXpXVlNFYWRmV2ZGYThHeE5iVTIw?=
 =?utf-8?B?YitVZGxBSjFnNWlXQzFPTSt4M3FHZVh3aGJ0MTNKOEgzc2xTSlVGcW5QZnQv?=
 =?utf-8?B?ZWRCUWdrMHNaMmM5OTA3amNNa09RYTNDSDBwSExXQXdPUjJ1VUpRZG1UMFkz?=
 =?utf-8?B?Kzl1SE5WTEFKcGI1UXRxWTdEMDNlZVpEWHhNNFo4YzVXTDh1ZWZIMzlybDh5?=
 =?utf-8?B?dkUyREJIbytlKzBnbmZzS0FmbmRXaXdtOFZtQnNwV1pKdXJTWkwrZk5NZWRj?=
 =?utf-8?B?dXpFWk8rNWxvM0RKaHUvNU1EUXQ2cUFkODFjSE5pRHR5ZkZYbkwxNWxGa3hB?=
 =?utf-8?B?QzY3K2dqNzNuWWNGMXhiMEVnVC9kV2VxdmM5Z3ZMM2MvMVdWOUpHNmlqNVcr?=
 =?utf-8?B?eC9JMlJuT1R1T0p2dys2VVQ3VFM3aENFZnVFcW5mZkxwNWpsQ1FMbU5sM0xH?=
 =?utf-8?B?YXBxcWxlTmM3U3dRYk5WNTh3NktEeG5Nbll5MGRSOUVybno4QkZMWnFlczZv?=
 =?utf-8?B?WGthYUhMWW5oQWFiYURqWGx6VzdPVnp6dDVMUUlzT2hUY3ZzZkdaMXNHb09K?=
 =?utf-8?B?djlGZDNYai9lbUdYeDZoSVhTYkZsQ0dMUlJ5ZVlDVVZZSDFZcjh1VlJJeUxq?=
 =?utf-8?B?RGM3L0NaK0FZVGVDN0ZZOExqK3lPN3c3bWw3bW9zQ2FrQlBSQUxlbXg3b0Zu?=
 =?utf-8?B?UUgvaVdFZXhnYTdKZEFIYWY3dEZRdXFpWUt2U1hqZEMzZnFsazhteENBS01r?=
 =?utf-8?B?M2ppcnoxcW05ZVdkaW5SQitzcVB6TndzVTdpSDN1cmJ0MGVlUXNYT2w2eFBl?=
 =?utf-8?B?d1Q4dHp5UmI1MXZENGpHYnE0QUh4MU5xdGNmT3RFbmpUV2ZoN1BNQVRUNVU1?=
 =?utf-8?B?TTYyNDlXcVhJTkxWMnFCOVRydFhpVERVNTdvQ3ZuS3Zlc21OektZRmpsOGc1?=
 =?utf-8?B?Q29MUmJaUWtpb3dzUm4veGJlU0krNjhPT2ZZTXltY0sxZC9teEM3cVB1K3JI?=
 =?utf-8?B?RkI4bHM3MTR1YSsxU25VOFdLTkVrSUhVM2ZuYUxjWU5JbXpUa1BmcWZXVjhk?=
 =?utf-8?B?eEUzK3JVaHBYMFBNVUpwS0FxSWVFdC8vZ1MvU2Nnd2dIb2VhVzJPV0VaV09w?=
 =?utf-8?B?OFE1SE1tZ2JUUE5LYk1wNUdHYUFSbTFYa3ZYZE91d1hJU2o5RzdZYVlVcnE2?=
 =?utf-8?B?OHEzR2hCbnFPTFhjQ1FpeWFPOGV0akYyK1BHenpRTkVuWWF1ZGpkazhweElm?=
 =?utf-8?B?OERIZEppZlY4N3JuKzhiZjhjaDNvWGNsZTFqMTNwQkZJdHpUZW9adVE0TDFi?=
 =?utf-8?Q?GAnCOj2DKGAtEHxk=3D?=
X-Exchange-RoutingPolicyChecked: VPyL/YG683m1Wzz7JYpfBrPJ3MiZ/xvACnJTjZ5icM/Ku/uJDxDnPUvR1qS1+bkDYpzARB3kMbBi70QBbrdyZsGscjXF1qkqOrKycE2PiTOhyOyV/WiIev2iHfXN4DEWzwQF/LW8iHvIWC7hbMf9OJCfz85z0Ft+wzyBvIRDc1uzbk/qLEKxvUClJZqpCvGL2oM7/QNh/v0Ej6veCv7ua79n/JzjI0OHz8yFRc4Od6MRuF0X6xSYYq7K1uTBuoT98LSqqEQkuE1ukDtJ5ZGCzZlK4Ila0x8d4GUelFIWStd5y+dmphTUImCPKAs/PwMA9m568XGGd0RBURKyw+VMhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1235bb-c6be-40be-54b0-08df0d066348
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 17:35:19.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7JCzKqWrSMSe2hn/4nAxKnUwO7rTgK8+mAnK8CDlVJvVTwwblUBME9YeCT8TCDE5F5WNU0oUx09vz/PRUX56lVQpJbN6UDxTOf6P4PtFrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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



On 07-09-2026 15:17, Riana Tauro wrote:
> Add basic support for sending page offline/decline requests to system
> controller and use it for device memory ECC error handling.
> Pages that belong to critical BOs cannot be handled by offlining and
> require a SBR (Secondary Bus Reset).
> Pages that are configured for log-only handling are not marked as bad by
> firmware.
> 
> For all other valid page addresses, the first occurrence of error
> indicates a poison error and the page is offlined only by software.
> Firmware avoids permanently marking the page as bad. The second occurrence
> of an error indicates a Double-bit ECC error and the firmware
> permanently marks the page as bad.
> 
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: use ret in sigid logging (Mallesh)
>      remove additional log
>      use xe_assert (Michal)
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 118 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   3 files changed, 150 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..94ffd0852938 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include "xe_assert.h"
> +#include "xe_bo.h"
>   #include "xe_configfs.h"
>   #include "xe_debugfs.h"
>   #include "xe_device.h"
> @@ -16,6 +18,7 @@
>   #include "xe_sysctrl_event_types.h"
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
> +#include "xe_ttm_vram_mgr.h"
>   
>   #define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
>   /*
> @@ -201,6 +204,110 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
> +				 enum xe_ras_page_action action)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_page_offline_request request = {0};
> +	struct xe_ras_page_offline_response response = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return 0;
> +
> +	xe_assert(xe, action < XE_RAS_PAGE_ACTION_MAX);
> +
> +	request.page_address = page_address;
> +	request.action = action;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
> +				  &request, sizeof(request), &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> +			   "unexpected page offline response length %zu (expected %zu)\n",
> +			   rlen, sizeof(response));
> +		return -EINVAL;
> +	}
> +
> +	ret = ras_status_to_errno(response.status);
> +	if (ret) {
> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> +			   response.status);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
> +{
> +	enum xe_ras_page_action action;
> +	int ret = 0;
> +
> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
> +			   page_address);
> +		return -EINVAL;

IS SBR right behaviour here, if FW sends unaligned addr ?

> +	}


FW address format should still be validated as 4K aligned, but the 
address handed to the current VRAM allocator path needs to be normalized 
to PAGE_SIZE, because XE offlining is allocator-granularity 
based(PAGE_SIZE, which can be different from 4K on some archs), not 
4K-granularity based.


> +
> +	ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
> +
> +	/*
> +	 * Handle return code from address fault handling function:
> +	 *  0: Page soft offlined, decline to firmware
> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
> +	 * -EEXIST: Address is soft offlined but yet to be offlined by firmware for second
> +	 * occurrence
> +	 */
> +
> +	switch (ret) {
> +	case 0:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;

Nit: The action name XE_RAS_PAGE_ACTION_DECLINE sounds inappropriate 
here, the action requested to FW is to remove page from queue not 
necessarily decline the offlining, the next error on same addr will show 
as double bit ecc and we do offlining.
HOW about:
XE_RAS_PAGE_ACTION_REMOVE_FROM_QUEUE


Nit: How about Loging:
FW->KMD(BEHAVIOR), DRIVER HANDLING, KMD->FW(ACTION REQUEST)
case 0:
"Poison detected at physical address, page software offlined, requested 
page removal from queue"
case -EOPNOTSUPP:
"Poison detected at physical address, User policy set to decline page 
offlining, requested page removal from queue"



> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Poison detected at physical address 0x%llx, page software offlined\n",
> +			   page_address);
> +		break;
> +	/* User policy set to decline page offlining */
> +	case -EOPNOTSUPP:
> +		action = XE_RAS_PAGE_ACTION_DECLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "User policy set to decline page offlining for physical address 0x%llx\n",
> +			   page_address);
> +		break;
> +	case -EIO:
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
> +		return ret;
> +	case -EEXIST:
> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
> +		xe_log_err(xe, DEVICE_MEMORY, ret,
> +			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
> +			   page_address);
> +		break;
> +	default:
> +		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
> +			   page_address);
> +		return 0;

Logically looks ok to return 0 here.
> +	}
> +
> +	if (send_cmd) {
> +		ret = send_page_offline_cmd(xe, page_address, action);

Same question as above, does failure in send_page_offline_cmd should 
lead to SBR ?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>   {
>   	u8 severity = counter->common.severity;
> @@ -368,11 +475,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_memory_error *info = (void *)arr->details;
> +	int ret;
>   
>   	/*
>   	 * For memory errors, the recovery action depends on the error category
>   	 *
> -	 * TODO: Double-bit ECC errors: Page offlining
> +	 * Double-bit ECC errors: Page offlining
>   	 * Poison and data parity errors: Log only
>   	 * For any other memory errors, request a reset as recovery mechanism
>   	 */
> @@ -384,10 +492,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> -		/* TODO: Add page offlining for Double-bit ECC error */
> -		fallthrough;
> +		ret = handle_page_offline(xe, info->sw_address, true);
> +		if (ret)
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		break;
>   	default:
>   		return XE_RAS_RECOVERY_ACTION_RESET;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index fe6f3658a2a4..20c74593ce05 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -17,6 +17,19 @@
>   #define XE_RAS_MEMORY_POISON			BIT(2)
>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>   
> +/**
> + * enum xe_ras_page_action - Page offline actions for page offline request
> + *
> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
> + * @XE_RAS_PAGE_ACTION_MAX: Max value
> + */
> +enum xe_ras_page_action {
> +	XE_RAS_PAGE_ACTION_OFFLINE,
> +	XE_RAS_PAGE_ACTION_DECLINE,
> +	XE_RAS_PAGE_ACTION_MAX
> +};
> +
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
>    *
> @@ -295,6 +308,28 @@ struct xe_ras_memory_error {
>   	u32 reserved2[10];
>   } __packed;
>   
> +/**
> + * struct xe_ras_page_offline_request - Request for page offline command
> + */
> +struct xe_ras_page_offline_request {
> +	/** @page_address: Page address (4KB aligned) */
> +	u64 page_address;
> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
> +	u32 action;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_response - Response from page offline command
> + */
> +struct xe_ras_page_offline_response {
> +	/** @status: Status of the page offline request */
> +	u32 status;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
>   /**
>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 66e7cbcc3f91..590dd408399c 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -28,6 +28,7 @@ enum xe_sysctrl_group {
>    * @XE_SYSCTRL_CMD_GET_THRESHOLD: Retrieve error threshold
>    * @XE_SYSCTRL_CMD_SET_THRESHOLD: Set error threshold
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>    */
> @@ -38,6 +39,7 @@ enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_THRESHOLD		= 0x05,
>   	XE_SYSCTRL_CMD_SET_THRESHOLD		= 0x06,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };

