Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B565CD37BE
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 05:09:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3773210E976;
	Tue, 12 May 2026 05:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6CtznpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347D10E24D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778562543; x=1810098543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+crWoHkmrvKSAEsJUWTW8c0hUbqSlXC1OLJtuilWGv0=;
 b=E6CtznpLUwWUIyRALe3ZM2tM/zmNw/NC6GT0VMezlPrqjXLXzS0Eg548
 azawS3HZy9bdOq2wDzs9rG51fV49k2F+p55mXSVqallJMrm/r49MPQAcf
 ACqcxrkY09vj+vjVl77EA4D1SxsvqLt9cEuTgAsLS00lXNSkJPOFpxuTT
 O3hoJrgZ75aBAzCnJZcL/GfLwEwUaLXTXq9fDKM1tN2tO2e93vw6PC5AY
 cf3XZfQIPl94dzUJAn9Nem+E2dL1/IKeYi+8+WABRpDNoosoQqD5EXNNp
 Koe7cg+FhehEuMiVEbsl8fnYjQPBtcfWI9ozDZe8U4/Qw13JmqtCsqks/ A==;
X-CSE-ConnectionGUID: 4w/WVSGcS8ODy5pti9HhGw==
X-CSE-MsgGUID: zhDLATDlQuCi+z1/70ahOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83314510"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="83314510"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:09:02 -0700
X-CSE-ConnectionGUID: wslgVJcoSPulkQkadicRUQ==
X-CSE-MsgGUID: nsovP+sfQLyeV1J12Us0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242659309"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:09:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:09:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 22:09:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZtmlplo9newl2ZVC9N+EQPJ485Sb9B7VRRP/o03DGGrMDq6G9YZfZpCY6l0hGHEHLIo5befv4LoBtLxFjMvDvf33ZT528mnuqBGIiRLiuW1DRI7Oe3mOOg1SbF/D4u5QezxsC13cloYhr9Pv0Qmecp/hFMBqEB69bEiSMtgIog/tU2b8iUE6UUnJmLVe1/1QzJAIg7GfXvjwSwizCqopglzelll/J2/lWgTgYlzIfs/qawEt9DMxB5KH3qjgDrgV4jAf1qRzVlXQ4cccpmxyPG5G5lQc0Am97XGSkMg2dzA7SYMZ4GqpS6XJ4Ag489glbu5ImbardgIR9xW7e8jDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0orVxn0nZuBKRJrJDqfDWSMibXVGLo8pDFNfDFIBAw=;
 b=lBvNlNufVDgLVtqqLaZVk54MZlOV/Zdpn/+hOBWCR58vdHC/CA1U3cRpPInZArwQephVZCrmbfgTZSPSU0AeN6EJEzBEtNwthElRqWkvssj47XbpA17pOqDSGD3p6dCPTOWEOpyaug/HALQuTlNkqhXq8tx6jktIT5H6k8xzIyUvRxZeT9woS/HP6nsOd0MXrcr/XoQRp6W/ZS9ydNMdwsvbJFWw86lpoO2E71uMdKuyqCKsxv92s+1k1HbbFrVl85FwczNVzBpgxLBEW5HMwfcdYjNcwE4d4SIlDDHywvrhFhPMPpwP5cydJmDT+Li+Ec2rCE6vwajY4mp1rdPkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Tue, 12 May 2026 05:08:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 05:08:59 +0000
Message-ID: <433010fb-0133-4d0e-9214-4002442fee40@intel.com>
Date: Tue, 12 May 2026 10:38:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/xe/xe_drm_ras: Wire get-error-counter and
 clear-error-counter support for CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-12-riana.tauro@intel.com>
 <agH3Gaw434-z508w@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agH3Gaw434-z508w@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0341.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d921cd-06d3-4d8f-294f-08deafe492f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: yVGvenfEwnnU/+1sGzx2BB1b2zYp5c0v4BtNW8kIaLGck6pWF3vXmGRJ+8C05PXX0eGufxhES9HICh6crcV8JffhAt6qK0LlqQjxY3EWVl4g9bvQc+bBLkeUl96nYiT4H+qA6d5HbfAhtgSrxGWRmvOep0vk4uQqcYt6cSYQu0m+pHhsxG7emzM9EzWT7qfmOT/7wvl9bZtz0HwecerZ2PjtKokT98MS6jg1MZ2pyFtJSA+sw7x2hWU39VFP1CR17qlnWDgp/TmAh88GvC/Vp8o8RfzMJQzdw5JbB3JkHtiVck4eFTLBPLGIKGLe36SdTWWoELpPqg/as7Kvel20tZEfLYDOGqe++BEhHbvgehgLyAwe10DbC/Ube+aCxXr0svlXp9JZ/Wy4iJ10rZcRYVzoVgtUpT2rq62DtfyhaZCL/KSMY++QlUOWjp2t3xW9d8qDuxxmUmksaUC/FkO7t8jg6l8ssOVdwdNYFFV8zLNGrYVodcF6zF8i8bAajlmYZXaAPwbyOYwX60LwR1aChREFppYEDQ8FGgRJlW5cunCJjCoU7mWnbYRRc2dBD8wjAbbDk04sDOwevfqOj30ZOMMA9Cjd6WsozAVVMVH+qEjvAGt4mh9qEFb6A3TuY1DlynJMifQ61syw1sjlslZqnrtetpe/RkE1vv4MEU509is1dBOo8zEnjDuCVCUO5BjV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZ0cFdnSVVLbHA1b1JvNkRHc3JQQ3c2NmJzdWJpeDZiK3JGM0VrZVMwbndF?=
 =?utf-8?B?dlgrVzFWUjRnOUNZcDRrTzB2UFpGZzNtTFU0d2hRKzZZSmdyMWJXZXEwakcx?=
 =?utf-8?B?aWJheHdCLytmRnBndW5zYitDZ0pQKzNGMGtCK1hva3BwRXIzcWxnQ0p3cTBh?=
 =?utf-8?B?cWpWa1greXBVUlIrVmlCN1MvQWp0eXJUK2hWZnJ6NC9xaWR0WkZteWMzSDVh?=
 =?utf-8?B?eTRtaU9ld25Hblp1Ym95SGt6RWJORGtPZldIZUIzT01CTEIvUW83MGFlUUZY?=
 =?utf-8?B?QkNITXQybm1jcmhTMjR2M3I4NU91M2QzSGJic1FSb0VTbVhDMzhlOWhKamNB?=
 =?utf-8?B?dERaOTVra3RlV1VBRmtlbXV1V3hwU3lxR1JyRmpjRFZlY2hrT0NoRHgrdjFN?=
 =?utf-8?B?Yzg4dDh6S0lrMTBBT0EyUjZ0ZWxyU2tBenNxTFMzM2lBd1VSanhmZXM1NlAz?=
 =?utf-8?B?Vklubk1aVXVXWmQ4NHg0aUtXUTNDOFpGUDVGQWRQY0lWZWdBTDloeWJDTVNk?=
 =?utf-8?B?UmdSbUVERWxhejRtK3VIeGRrV244aFNLZ3JnWHFVUkt4NnM4U1lySzZkSjlO?=
 =?utf-8?B?cnNlV01VTnY5Tm1rRGdHZjYwcEZYOFFCVU84bzZIOHlSbDM2bjliNGlvSVV2?=
 =?utf-8?B?MWlFWmgyVzR5UkpKa2RvWWJCNUZSK1VXNFBYVWdsZHM4eGl5QVdNMFdKaGRp?=
 =?utf-8?B?V2xDN2g2QldaUnNxUElWQWFjU3J5YnBqa0ttTnUyS3pWOVBMWXdTK2tYV1h1?=
 =?utf-8?B?SE51SVBKNWU1dkFKbEp5QUFvRldTMjVrQkMwaFAwei8wbTJTM0ZVcmoyNDJL?=
 =?utf-8?B?dXVOcW5FRU02TDc0V2txT3lQTVQySlNMNjNmNGc5WG50WERpbmZVTXlMb0hz?=
 =?utf-8?B?a1FyaEx5WXQvMjNrY1RNR3Q3d2ZGNk1OU0VxQXdqVUNtV2crRVkrN1p4TFdJ?=
 =?utf-8?B?emZUNTdoR1RNWkx4VXBBWU5RR09ESzJoRXpBc3FwR05sU3lLYXUzN08rWG9s?=
 =?utf-8?B?T084NUh4bFBHdG1EVFJOcDFKdEdKYVVtVkZQbHhINkExVFBCRXlPQXFJakJt?=
 =?utf-8?B?akFyNnlmVmhPRzNMcGVqdFN5ak16WVlETVdLN0tOWENUNy9xbkMxUnB3T205?=
 =?utf-8?B?ZHc4d1lheDlkc2FaS1ZlWXcvcS9CUVdHeW5HWDhOS2VQR0FlSUF6MVF2NldD?=
 =?utf-8?B?L3pWbnRFdUNmTUk3VU5DZEZqaG0rNUd1ckpkN2JKb1paSU8rSnlhaTM3SUpw?=
 =?utf-8?B?NVlNZkR4N2RJVXk5MlVZdDFPcFZybnUyU0FsUnZwcFd1VE9ycnVkSmN5bTBB?=
 =?utf-8?B?VHpEOUNqa0ZEQW02RnBmOUhyZUE0bk1uS3kzS1hHM1VqdjYvL0tYTHlXaitJ?=
 =?utf-8?B?SzArbWtHWVhuL1ZDOHg0VC9rcU9DRlBYT3ZXTlRWdmNpem9maHJYZkwxL3VS?=
 =?utf-8?B?NE5xc01tbjBsYThSVUV3ZG10NlZRYjNlRlhld0ljRS9uL1A2ZEhCYUlLK3Ba?=
 =?utf-8?B?bGE1a2dFL0wvR21kRzlvZVZiZGlPRE1SNXp4NjBUUnlEVEJ4SGwxZVhXOEJZ?=
 =?utf-8?B?YURPMlFSelF5MnBkUzd0N0pIK2hDK1hKUEhCOU1vQThVdXV0NkFQT2NNc1dF?=
 =?utf-8?B?cDM2U3pUYmxJNTJDdkhNL3A0NkwvU3Q5YXhqbFdWTW5oUWpoZlE3NnRsd3BR?=
 =?utf-8?B?MHJxVmVycGFwcjlNUHdrSHJoZGgvWXJveTJWRHphcVhueEswK1ptMnJ1THI3?=
 =?utf-8?B?Q0djd0ZtVldNWmpWVHNiV2FTWWtLZDVZcitOa3hUVGpHM0VZZkxQSUxrY0NK?=
 =?utf-8?B?a3NCbWl4eEY2THdIRVVrbk4xdzdQdFVYOVI3c3pkZ3RvRk8wcERHK2IvaEtq?=
 =?utf-8?B?bi96eFlTY0p5VUJtMmpQeDRQVG5vZjRrdTc2YWlGc2ZYWTN2dUxGbGwvM3Rw?=
 =?utf-8?B?b3dmL3NSeTBRNTlaVmMvajI0WGVrN2FwMXQwVGhzaDlrMlNGRkZVcW4wbkhF?=
 =?utf-8?B?OVlMVnUxR2xYSlM4ZzcyVGw4YTdkWW9MTFlGY2JLOWIwZnM4cWJQSk9uY0dM?=
 =?utf-8?B?enVnTllKSXJwR2d6dTVrOHh3QTlRNGpkSGpobkhGakd2U0FLMTNoQjNoOTNu?=
 =?utf-8?B?anJGM2UzK25KUjN0MzhjRW9CcFl1NWFqcUlmdlRPYnpaUjBUOEpCbzZrcncr?=
 =?utf-8?B?YkJYamhHeVlia3Q5bEkyS25lb3pSdUg5YXlyenpQUHVKOUFpRjg4cXZVUzlQ?=
 =?utf-8?B?NUE1Nk5Wa1IyMHRpTkZpT1BscllIeFZ4Q0RScjBORldqV3I4NmZpTE90WDha?=
 =?utf-8?B?S0N2U25ZRzJGL1hZSTROcFV4QXZFOGJTL2ZNR3lONGR3K2V5N2dvQT09?=
X-Exchange-RoutingPolicyChecked: wiKr9dUXFBQ1qwX+6OEd4KTf6B0kfSRuZDP56ba69D09Zcvv9zvpN5cXQyazxDC/tjL5TCx2tPbaWBYR3Qbwnf9QjB13zItbz19q7szoLv5al7RtCD0FkWp65TFQcJ6j+CHQcY8ohXi6rd0Wh6tKYMcwTadvcn6cN+aP9SO0dgbbMswClVl9vJGutgioCBpVne9AHVHPh+qY5GDTIvJ406vSerj1sqgA/n8e/7MFGoZyC7l2qodMehXGU5wiHfG1Y5IQGc4m05Qib77+/7KOCuAgpCo62VVkavMqcXmZOlqOpxc33Og9kNGA2yddKjZcAlfaoNKddzK/YQI7b/TRzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d921cd-06d3-4d8f-294f-08deafe492f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 05:08:58.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMVL0kC0mtZWvHbQDaFIBygduAEcbo2X9w0jorZGA6qJQUJ6d3Xh1XAkQCT1zM2Gg6e7+0IQxV4nutMngyiX4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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


On 5/11/2026 9:04 PM, Raag Jadav wrote:
> On Mon, May 04, 2026 at 12:26:19PM +0530, Riana Tauro wrote:
>> Hook CRI get-error-counter and clear-error-counter support to
>> xe_drm_ras to allow userspace to query and clear counters if supported.
>> When userspace requests for a drm_ras error counter, query the system
>> controller to get/clear the value.
>>
>> Integrate this with xe_drm_ras.
>>
>> Usage :
>>
>> Query all error counter value using ynl
>>
>> $ sudo ynl --family drm_ras --dump get-error-counter --json \
>> '{"node-id":0}'
>> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>>   {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>>   {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>>   {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>>   {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
>>
>> Query single error counter value using ynl
>>
>> $ sudo ynl --family drm_ras  --do get-error-counter --json \
>> '{"node-id":1, "error-id":1}'
>> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
>>
>> Clear counter using ynl
>>
>> $ sudo ynl --family drm_ras  --do clear-error-counter --json '\
>> {"node-id":1, "error-id":1}'
>> None
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: split patches (Raag)
>>
>> v3: fix early return
>>      align spacing in commit message (Raag)
>>      integrate clear counter with drm_ras
>>
>> v4: rebase
>> ---
>>   drivers/gpu/drm/xe/xe_drm_ras.c | 39 +++++++++++++++++++++------------
>>   1 file changed, 25 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index c21c8b428de6..e7bd3f09a762 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -11,27 +11,46 @@
>>   
>>   #include "xe_device_types.h"
>>   #include "xe_drm_ras.h"
>> +#include "xe_ras.h"
>>   
>>   static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>   
>> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
>> +static int hw_query_error_counter(struct xe_device *xe,
>> +				  enum drm_xe_ras_error_severity severity,
>>   				  u32 error_id, const char **name, u32 *val)
>>   {
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +
>>   	if (!info || !info[error_id].name)
>>   		return -ENOENT;
>>   
>>   	*name = info[error_id].name;
>> +
>> +	/* Fetch counter from system controller if supported */
>> +	if (xe->info.has_sysctrl)
> Curious. Should we check this inside xe_ras_get_counter()? We'll probably
> end up doing it at some point anyway.

We also have PVC counters. If moved, the hw_error counters also have to 
be moved under
the ras function. Let's keep the hw_error and ras seperated.

if we need to move sometime in future, then we could have a generic check
For now,  we can retain the same.

Thanks
Riana

>
>> +		return xe_ras_get_counter(xe, severity, error_id, val);
>> +
>>   	*val = atomic_read(&info[error_id].counter);
>>   
>>   	return 0;
>>   }
>>   
>> -static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
>> +static int hw_clear_error_counter(struct xe_device *xe,
>> +				  enum drm_xe_ras_error_severity severity,
>> +				  u32 error_id)
>>   {
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +
>>   	if (!info || !info[error_id].name)
>>   		return -ENOENT;
>>   
>> +	/* Clear counter from system controller if supported */
>> +	if (xe->info.has_sysctrl)
> Ditto.
>
> Raag
>
>> +		return xe_ras_clear_counter(xe, severity, error_id);
>> +
>>   	atomic_set(&info[error_id].counter, 0);
>>   
>>   	return 0;
>> @@ -41,38 +60,30 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>>   					     const char **name, u32 *val)
>>   {
>>   	struct xe_device *xe = ep->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>>   
>> -	return hw_query_error_counter(info, error_id, name, val);
>> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
>>   }
>>   
>>   static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
>>   {
>>   	struct xe_device *xe = node->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>>   
>> -	return hw_clear_error_counter(info, error_id);
>> +	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id);
>>   }
>>   
>>   static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>>   					   const char **name, u32 *val)
>>   {
>>   	struct xe_device *xe = ep->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>   
>> -	return hw_query_error_counter(info, error_id, name, val);
>> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, name, val);
>>   }
>>   
>>   static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
>>   {
>>   	struct xe_device *xe = node->priv;
>> -	struct xe_drm_ras *ras = &xe->ras;
>> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>>   
>> -	return hw_clear_error_counter(info, error_id);
>> +	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id);
>>   }
>>   
>>   static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
>> -- 
>> 2.47.1
>>
