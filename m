Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2F60A2609
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fx5lkos/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kcscKNcR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639DA112B92;
	Fri, 20 Nov 2026 16:00:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E24112B92
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795190394; x=1826726394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EWxoGrlUTdVpGf7Znd1e8kBrNWKh7wL+OQJpkp4gjtE=;
 b=Fx5lkos/Ng3c9oYuwljptc061fdgWSPy3UN38Yn12vH2E85/IVfUHhNp
 oeGuSJs/HKcrmRhtEkoXHSJWlF6IrCk5PovvjeQBw0pWhSDXyTjAPrY9V
 gKB3wdUGBmdRjSpYMIl8vbMzicjm/c7EZf0JfX8Yf9oifLsMZbKerqTHO
 vCgNeLnYaIyfso58gZIwsf9shGTq8Nzy5Mc93rXSGOMowq6nUf+0wu4QD
 JRggl7ptx0QiSFUis+ZjrW+fL2sJLYVbmjx3R6uKXa7ZJuasUavWYNmN4
 D+cAjrqfKfFPAGwHAUWwzN4TA37anN9ZttT7URcEa+S9sedlaGlBsNLCR w==;
X-CSE-ConnectionGUID: eysqXsrERzeQ64Lwo4ImMw==
X-CSE-MsgGUID: 5Zj1eT2nQ2+7+ghX4pKdWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3967046"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3967046"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:59:53 -0800
X-CSE-ConnectionGUID: MU3nXoGPRK6rPkV2OuXRGQ==
X-CSE-MsgGUID: BT+C/+F8SFu7lXvvIvB9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10540159"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:59:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:59:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 07:59:52 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U15YOefgYGqfL9iVA3K8zO/11lSX/s6+gFhzgMc35KZ5onnt2w+uE8Pbpg9OzpvEobn3JMYH4KJHTzpO83SFMSJliS3hM/mdf6N9UPHcTxfZJoIAMexR4KYHmZKjZ9Cr0FLGLG4GOfRCCeBSFXV+xki6REnbQ9fJx0JZWnW+th2qssKqM7qEpND0JvJ2dU1hD2Y3nEWxvAD6VCRD02mBVaymz9Uni9t306JQXH4wdm+Km3L9MEz4nb/GV/naqEQm6TLwe668IlRetXrHMOTUKoxMbDPehvQlk0RCVKiq/KbBg3CIafdgDG2nW1JMvmEYjsk/3oEdwVB8aj6E+E5wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3wtZTmkj/06SKinSdTB69/QlW3wTexWVb7MdlU5Xnc=;
 b=cU0YG1HRQIxFPZw3Yp6zb5QZbn9SjE6FKbFTycum24hF3ipYLAFqGKuLgUWtnqNHMtDHkHfqOL8dRPWcxll1yukLlv+dcUO8eDZZ5JAhRRMAIg9l2L5pAmgIP6WIHRrCPY+Udi7TKvVdgHWJphVclwFQbI6Lck/3lnXsjVUUYwJ8ZW9zoflDVgRL2ixc/ccOUqqGltUNzwQaNQzS/BcScJGQTvFszohl56MQQVcGTdfTROD4W6f1KmTf/Gu6/YazfklqdArC/5tHwHij93MwT3hHSwZR0gA4HkCkNu4H2al0HeA25doXTZS8H32VqkqfXTHyd2kSxBS/2ubf0HS6Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3wtZTmkj/06SKinSdTB69/QlW3wTexWVb7MdlU5Xnc=;
 b=kcscKNcR+VUT5L52Yf/PE3eICagUA+di5pj3+yQVMocOuYg9FcYk1tIJxa+8016Ue8MvEQDMaWuU0gnLqX3qYs9yQH7jJXLtekOwlQkUtjC9Kfw623z59niorfJ2J0njNJZfc1wetVWfbBf5MVw13z0bpUb6a4TOLV6sEmWzfz4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7788.namprd11.prod.outlook.com
 (2603:10b6:8:f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 15:59:35 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:59:34 +0000
Message-ID: <e66f9aca-5a07-4afa-b11b-a70af863d140@intel.com>
Date: Fri, 20 Nov 2026 21:29:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/xe/vf: Free preempt fences on rebind worker
 retry
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
 <20261120-userptr-repin-v2-2-65e1f6e582ef@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-2-65e1f6e582ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0428286f-bab9-4a89-084b-08df471f454a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|18002099003|22082099003|4143699003|56012099006|11063799006|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: f+kcafUg/xLrQTFJqutsi/Kz8vSjzpkt8I/zbZndlpjCWvJBCXoaM/QXI2fFlh/EsdK+S3PaQq55zGfza35msfrZ2oJvVytABiOV9XHu32rFsNrDYwf37kwDck3Y9QUQQKPIrtThjJciyR3ihDvRq3W9YaUDLfZoiXy+pe9BGumarMAeAdJZCDAjyL5hgvwxlbi0J8oinwkoq/kgCCemde5G8OqvFMo1AKZCRRUGXSV+mmaT7CeZsLyQUnDiBHzu6u7G+Etk3Y4e46FM9VHsT8xmp8V7AjhL2gEgfBLAfXW/TE5JJ+iTws7Zs3BLvgS6hKnPrOSCufNb2ughCnA9ZJfxrxkDAqSJSo0dLTSWuBfywKErmTxOrdroovyBRr1+OzPk86HVqVk3PRgszDzV1eByPdu+thMQA1nKD7Zt5IW1URUnAtDYzQGJLgpPiOII8xgasVEgkBUYfxcYeYyHuYXB2cl7FY5i02dafCaVZFTSvXkoqNngM7IxyRgpdCK0GCjXeIQ1FbvGfWNQC/Hh8eRQV8R5XTEHxe9WYvIywY4ccRizFUa3cYH1P3nPTPjAoMHvticoIrnvERcYtZTkQegmIiNwRV6F413w3+Fzi5J0kBCASOSFRlgXqCEP5jrybgmr4JS7De6VvOLxQD7hgAQRYQFdEJmvjFopFtnvokI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdCL0dlaDBqa3JWMmxWb3U5c21ZU2IrTUw4cWFyN0szRWVSWVUrMTNzRGtt?=
 =?utf-8?B?SWFVc0VveDNWaDlreVpaeDZaTnJpTFQxd0pHck4vcVNLYk1rY0hwT016cEdD?=
 =?utf-8?B?YXhteVYrdHgvd3ZKNGYzWnFxTE16SHpzSDhFQVFpVkY3VUdCNzcrekQ2TnBp?=
 =?utf-8?B?YU42bWlxSWJ6R08vcFlhbitVcUhwMldDL0lDMU5IRUZtZHV1VDRBb3JhUnpy?=
 =?utf-8?B?YU5JeGExczJXU0xFSUlkc0ZBUEVQSWc3N1dVaWtxaERNK0ZTZk5SRXEvY3l1?=
 =?utf-8?B?SVM0S2NndXk2Mm9OMlhpR1N4UVlCL1luR3N6QkU5MGpZUDhHYnV5c3BPWDhs?=
 =?utf-8?B?SDRNYTZIaUJWSWJxRjhpTGhua3JxMHNkTXowblh2ODhxWFYreFRGL3ZwYmox?=
 =?utf-8?B?OXVmcnhzV0FBd3p3OHE2bVdwb1MzNGFiai9YYzNhRndlVUlXVytSZHRQUjho?=
 =?utf-8?B?VUtsbUd6LzR0QVRLcFgrT0JRZTI2Y3NoOTNycUVnVTh4UzA3WGRDSFhyQlc0?=
 =?utf-8?B?OG50NTdiWVpXL2pYYk1GRURVeGs3b1MxcTVYV1Vpa2pEbHhUWFg0VHk5Um9W?=
 =?utf-8?B?Vm43TDNFWDZvdWphM0Q2STFoTDNRM0ZZY2V0ZldXU2o5bnh3RFpnTndkdjVy?=
 =?utf-8?B?V01neEZHN0s2cWkyOTBoRWhHaXo4VjBCeXkzYTNiSjhuVm1zdjlYWStyMkJl?=
 =?utf-8?B?enFhZkM2bE1WK3paMjlWQVl5WHFCTjRFSVM1MGxnVHJxYURFTDEzMFdNNzVW?=
 =?utf-8?B?R2swMmxFQWFvcXpUVnVPWkl5RVlDTFBLRFlTRWt2OTdMWUpBamNvM1NGL0h6?=
 =?utf-8?B?Wmg1aTBvMkFtQ3l4cytkelNFWnJOMEdCSXdnaUFQbExwWUYzOE9PZ0RucTFh?=
 =?utf-8?B?ZFdBSmNYN0N6K2JLeFRLV1o4T1ZQeCtjVW9WUEsrTDlSQ0pxbjc4WHhpVmxR?=
 =?utf-8?B?WkhjRHFxdUU5TTQ3TVpCSkh1djNQcGM3QjkxV3I4SlR0dDlxY2FuQzN0bmoy?=
 =?utf-8?B?bjdkWEtCVDdpLzVqWjdVU2s0YVA0OXlCYmdsVHBtTEp3UGliTUhJWEk0SXFH?=
 =?utf-8?B?aExyUnV0UzFidVV3azFOd2syeXlFNWNTWkU4WjA2dUptczIxKzlheXRtVW1a?=
 =?utf-8?B?NWdYMjJ5SjhETFJpek9TLzl6YnNHVXE5dFVYK3NEUVBnS0UraFc4WW9sMDl1?=
 =?utf-8?B?KzdkWm9kby9LVFphWW1ORGZSenhGODVOY214T2lqOC9MK0pWZ1dPcy9EUXVC?=
 =?utf-8?B?S2pjS2tNazlrc01lcVpEVS9UT0lka0Izek5Qem13OUtNc3JJKzFUNnlBRDM2?=
 =?utf-8?B?RTNVUDNNWW9KSnJEUTlKNzZaemwvcG1ram1mcTRYd041Y3RkVFZNbk1VWFNL?=
 =?utf-8?B?TDBkRm5pcTB6Z0pXeHdQb3JTc1hwU2QwZHd0YjlnWEYvejNIRTBNU0xtNFIz?=
 =?utf-8?B?MC9lclRseTA4WFllK3lKd1RCMmRSVzJiQmpTVERhOGZDbC9Hbndib1Z2L2JI?=
 =?utf-8?B?ZS90QTI2U0VEdndNMi9MM0dtVGdGYTNsNFIrYjhSUzhrYjErL2x1VmhRcU0z?=
 =?utf-8?B?MlIvNFZ3bWVtZzRBcXI4WjhGN2hneFZoc0hZQUx6TTN6UEdLRTU4UUdManRR?=
 =?utf-8?B?SkZaSE10VVpjSWM2L25CbENGYjRRbkE4dnBjcTZsR29iQmRvTFNKclVTWjdM?=
 =?utf-8?B?elF3WVJXSVY1azROSHBFNERrV0xiQUhKallCL3Z2SDlRaUNvZHREUnJHMENk?=
 =?utf-8?B?d216NG8xZkxJRHNudm5SV2JqK1FNTW1BT1lwMjJMKzcrNllsZ1dZSHlUdmFF?=
 =?utf-8?B?SnlMV1VRZEdZNG1PTGVwNXRTT3FnKzNqUW9aa005ME40R0JGZ3Zid2xoazNz?=
 =?utf-8?B?V0xVTlRnSFdTNjNUNzA0dkpKMlBCUGJqRjhvbHNBUXVKWlhyWkVEc1Uyd051?=
 =?utf-8?B?Y0E3ckNwc0c4Z3AxekRRbHBLWkFyckMzWlRqcVVBMDd0bkJneUNZdzVQQXZn?=
 =?utf-8?B?SHVEMVFTMm1keFJoV2xadFNGbVdmd1RVczVOQXFwNHVEMWdhVW9lRDBvZ1RI?=
 =?utf-8?B?NVFLdlhKaE5WMzZYRFNUNm5CelJUWEpFYnFJbVAxMjFjcDJNcG1KMEZCVmtR?=
 =?utf-8?B?WDRmZGgyUnpCRVdlN1NXUEJlYjdQdXF4NjNqNEY3ek5HbUtTSUcvN3ZWMFh4?=
 =?utf-8?B?WDE1bXlZbzZCMFFGM1V0NnNSNUhQTjhGTFM3VUhZR0g3RkxzUHoyZWxWQVlK?=
 =?utf-8?B?QkFmQUlyWTd3OEZ0THFTWkZCS09tV2lZUWN2dyt5YzBQT1FFTHFmWFJyQ0N6?=
 =?utf-8?B?SUJMbW5Lc3RWMlNYQ3FETzJSWk1UaEdCZ3B1SStrdFNIdCtkcHd3ejREUHZp?=
 =?utf-8?Q?s8fXmyVGlufK4xDA=3D?=
X-Exchange-RoutingPolicyChecked: DTh4PAIdMkvNInektpNQdA80QjGEWwXBUMpE6yz2HllxJykhHSWiVRfj35G/RDerhK39fUjx1r6TSMZbF7ECIj2hjNQ15WJ2bjujkzi4/b27Q0J35J95J9GMqyLrY2RLaM91CpOWtJTrfLDlpGKvXb4POPBE75dmbnFbmf9LH8cg6rKl7fqsuJvlHYvBoTfHNUzUgilVkJgcy1AMDW2KVEMzPbxFsqTMP8QU7OTYnDj5jVTdJhsnLu1nFnOpDEzPaUk/+k2rIjoDXLWI5zB+O5XNMNENpbifqsYqR/s1/Qu4yQdwUqDZcbBqpn3nWPkv/OSE+ZsdA18VKDwSLICP3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0428286f-bab9-4a89-084b-08df471f454a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:59:34.7521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTcY0E+8cWHogewUo3lnXSCv6IozcM8fl8J3BF92qNo85AjeA2OSJPsnYVgB7ebL2PKbsMDVHw8qURA2DAxhHi3q39IUCRjqw0ihbrKWi0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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


On 20-11-2026 18:32, Matthew Auld wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>
> When preempt_rebind_work_func() hits -EAGAIN after
> alloc_preempt_fences(), the SR-IOV VF migration path requeues the worker
> and returns without freeing the local preempt_fences list or emitting
> trace_xe_vm_rebind_worker_exit().
>
> Free preempt_fences and emit the exit tracepoint before returning.
>
> Fixes: 1faeeea056ab ("drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.19+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 75be5e5329bd..82e716b12b49 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -649,7 +649,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   		if (IS_SRIOV_VF(vm->xe) &&
>   		    xe_sriov_vf_migration_supported(vm->xe)) {
>   			up_write(&vm->lock);
> +			free_preempt_fences(&preempt_fences);
>   			xe_vm_queue_rebind_worker(vm);
> +			trace_xe_vm_rebind_worker_exit(vm);


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   			return;
>   		}
>   
>
