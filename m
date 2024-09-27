Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C2CDD1CE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 16:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FC610E46A;
	Fri, 27 Sep 2024 16:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsIKnEay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10A10E46A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727456216; x=1758992216;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=5ItKKTHe2l01oNDZTznagAfOwzcEvsn1K6Ky1fN+yAY=;
 b=VsIKnEayeEifQBVc46/qfwm9f9Jp42qNHrjAoxB54PW5enTUjndA+h9W
 KfM6p4eKHoxGnsMmb5azbmUXxBom4bK1iySTfdtVC8i6PgTlmz/XX6OuQ
 e/6WM6bfQ2Q5z57yI6HrkQeDWQpbcR6uaYd6W3VaOAILofKWBZLRZpilk
 rkgpCti1Tv4ud3Wi+xYUCH4fG1evNjMacSpwzSiRdmDpDHJOll2nheuT5
 zu406/UXtWbyEvH16fQ4Pmv9/A2fc9DBny61b/pgLyjNRPLKbvmzdpEDM
 yAOEo+1zeYN1g24PG+VQpZp1LMASm2GGCJKugi2wGvwCAZsk2bt0xqcs1 w==;
X-CSE-ConnectionGUID: zU6YgIL1S527eHIchIcUNQ==
X-CSE-MsgGUID: ZYjEA2S3SnebqEcqw5p4CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="14229292"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208,217";a="14229292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:56:55 -0700
X-CSE-ConnectionGUID: qjO36PtQR6iDcGbRpyRXaQ==
X-CSE-MsgGUID: 7IYxpcscTFu+kpe3Qw4xyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208,217";a="95923655"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 09:56:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 09:56:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 09:56:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 09:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmMpUYDum6udf4bTxo6ITuTv96Ua13YuARznmUf2GwtY5VRwUyP/3FNWrdoYwkuWuamX12n1dk9dpUT9ZHl5US9hl+fihTVF8GmkSU4lZ0oKxZFmwjIO06IQwGHK1Do6sdCcPSnj7Azy7xf9mXN392etwBQEPhD5Da7iBaCBOmW8bnuNUGr28v6DvLwD7yahMz5FeKNFBXFZKyyJ+xaXQ8nfVMjFSLfKvqBmPaG25Xru4tj3kldACF9Ch55+ZZRIvzDuOAYASk04S6ODH7HtYMJ2rRtBChb+qVbsFY80G9wSWbUzU8i/yrVUerTcg6EhbeapSR91AScjhsEMYXsplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZYqDoEfAH8zccd1Pb6dZ7zmw2zpnKrw0Qxh9hRahdc=;
 b=j74zjt/t+jbGd6Cu/8Z1jvr6Fo5nVNWRsWgd8z47ul/z216YTv1v2+Tn0dk3mqwt19ECGIqX33SvOZlVsorIQZeI0PIF5DP2goona9T+DLOo9WTajTr0m6bI3Rqcl8kaeBYJv2T8ceI3cvj/8FvswowGnWh2hL2owkStCNJMCvdb/vKe2qRSMdAjQkMI3IlTXOEr7lnnCXD+8v/l9oty06UP/9oS7oONLP98IPnzpJ/UNDJDjfexoMMciTzffEJpxyc/+xVfj3JgZzv1KfUVRliMm67tU3C7kbFVVnV3Pr8zfjp3Ka+VImas9v3mR9+eRhzc8d5iF/EbV5w75zxnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 16:56:45 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 16:56:45 +0000
Content-Type: multipart/alternative;
 boundary="------------l01MC2F6L8ewKof2soQFTmwu"
Message-ID: <c5dad7b2-a88c-4507-99f3-bcb3ae7a40a3@intel.com>
Date: Fri, 27 Sep 2024 09:56:43 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Restor?=
 =?UTF-8?Q?e_GT_freq_on_GSC_load_error?=
To: <intel-xe@lists.freedesktop.org>
References: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
 <172744907596.1111712.12161399525749283685@2413ebb6fbb6>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <172744907596.1111712.12161399525749283685@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: e3da5da4-b792-46bf-45aa-08dcdf155e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djRRV0ovdTZyWjlkZ01qMVh2RHp4dVJVL0o0R2d1dTJZYUp5cHdyRWxyN2tN?=
 =?utf-8?B?cFdSTUkrdEJGU2pRRE1vZnkwM1JFTUM5N0xNaE85cU13S3BGMlFmUFZSQkVG?=
 =?utf-8?B?eGYzYjJCOVQ0M2JET3hFbEFhMU5ja1EyN1JIMDZnTytra2haTC9JRjlieGNw?=
 =?utf-8?B?WXVRT0FBMFFzaGliUjJ4YVdlOWZIV2xwZ3B1UndEWVlWRlBZcXVvVHJVejZN?=
 =?utf-8?B?UlhEQ1dZR2RZcURHVHlHMEJmdENoV1JRclNESmk5WXcvRGxoeTd0S2VZbngz?=
 =?utf-8?B?UmNtK0FDLzludnpNdmlDRTJLSGdnZVlZNkFjQjlnb1NITTJxcjUvbzdwb1Vw?=
 =?utf-8?B?aUMxTjQ0am5Yc25LRlNRNmVXM3VHWTFPR2NxRUFtWitIZVBJazFhMGNoZ0Vp?=
 =?utf-8?B?Z0MzMjYrM1h1bDV3MXJqc0dueG9kc1NNOVZtOWVpU2lWOExOaVdCRVNLSkFo?=
 =?utf-8?B?N1I4QzUyVHVnaXI3VGhvRXdhUlhxb0t4UE1JZmpsVUpWRFBCL0h1UUxiSUlS?=
 =?utf-8?B?ZFJKYWxadGphSXpRRDJsSnpDdXhNNUtZUnBGS2ZmRTRtT01KQTR0dFNwWlJP?=
 =?utf-8?B?VjFKSTBTUlVVRzRlN3FGMlgvald2TVNGKzBZZ1RYWTd4TXdjUzhrT3l1RTNz?=
 =?utf-8?B?UTI5MTFnaHN1YmVsK1VCVEViMUg1WjA4MWx1OVpOaFQwTTFoQTF4NEZpc0E3?=
 =?utf-8?B?VXN6RGVNRnhjYUR2OVhmL1AyVDNYSmhoSFpxOVlCUUcyUy8rRjRuejllMTNr?=
 =?utf-8?B?RmFqQ1lNUWZNdkZHdCtkbGZvVVdwNXBySmc3RjhzMmMyR2tucS8xdkxrWEts?=
 =?utf-8?B?OERoUlBkbmY4anVtV1g0Q0k0endiNGpHTWpiQkNuRFhjV3lCc2lIbFhUTjJ0?=
 =?utf-8?B?cEorVWxDUURHaGNOK1RFUWZJcGhPT2w3b3gwbmQ0WDRYNWxqbTdoNlZzK2I4?=
 =?utf-8?B?RTRFMmFhRnVJTGJpbWlNU3NKenlsUkhMeTUxRU5mcm1JQ0IzaDF0QkwyOVFW?=
 =?utf-8?B?dmVpdmo1bktNaERpZURhUk5QanpoN2tEOUxnWlUrRmhidE5KL1Z3ZGR0ZnJ6?=
 =?utf-8?B?TzFLWjNVN25qVkxWcWVRTHFLQWl4UG9aSmpyY0wxdTFRMkVnTzdmRUk2Qjho?=
 =?utf-8?B?aXFrME1GUWw3WHM2ZEM0TzI3a0RzSWlQUW9LakY5RGNpcFlrZVNoeUp5WERJ?=
 =?utf-8?B?VG8xY3lyWEh4aXphN0R4V2gwYlpLMEV1a1ArOHUzd29FK2ZkVUJ4NUZGOXU5?=
 =?utf-8?B?NG9wWUxCaFRWZmx6dHN1MUc3UkFOWHhqR04zekl2dkloU2RZZThlWVVCRDhI?=
 =?utf-8?B?R3JGT1hMdERsQ3FLWHRpNkNYaUpGemp3akNKSXo1dWl6ZWg0b0ZWbFBneEhu?=
 =?utf-8?B?SXdGZ3J0bzQxMHZycnBuMHJNZkExZUxDQjNoeEJMVVk1V3hITWN5YTlMMFFQ?=
 =?utf-8?B?U1BFOVBQTmVDMkMzYUNScVVXeEp5eHI4aTNTSmVNZEZkdEkraXJJR2NMT2NF?=
 =?utf-8?B?b3FFa0ZJZHA2alI0Q2NSNFpsYUdseFkwS08yd2prbnVMZi90SDdpMTFlNmxO?=
 =?utf-8?B?WFVPLy9WelgrY3BvVVprYjlaVXQ5Si91NUFXcittMHVFR0RHbE5tMTNKVS9X?=
 =?utf-8?Q?iXyZybhGa554YgE8oL5nh6Tydbp0mnD1kKsQJj+sb1zw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dndrRmUrd1JZZVJNbHJPYXVTYTdjdXJOdGhGeVhGZjhEb3RKaGtSOU52cjl3?=
 =?utf-8?B?S3lIYTU1ZmpKaFJTSkUwTVB6M01BK3VZRFhGWU5iK202a1p6aW1jU0JmNDN4?=
 =?utf-8?B?K2kvQ0FPb0dCMlNvOVVabEpoeXNtMkN5VmRnR2czL3pVRXNlVXEwcmhtanJ3?=
 =?utf-8?B?cmp5VFFGVENXWENOa3h4U1VIeXFRY0pQZW1KYXU0V2o5MUVDdmpkSVpIa1Jn?=
 =?utf-8?B?RVZQT2xjVmNnVGlZMlMrZk9jRmNWcXI2Z1ZKVFd0MDN5blFTUm00MzVXdlhj?=
 =?utf-8?B?NVFGSjY1Q3FmZUk2Rmc4aUgwTGlUWlJJK0pyRnhVbHRLWmFYemhrODNSUmdz?=
 =?utf-8?B?dmlNc2U0ZVk0RWFPMUNza2U0TkJodzVYMCtqTEFuTkpBU0Z5MTJzUEd2bkMy?=
 =?utf-8?B?NjNXM0JUQ2Nwak56MmR3WHIxSERMSnJPOTE0WnhIa3NsQmt0dE56aHpsekQ4?=
 =?utf-8?B?V0FEUm95ZzJMUmprb0pJdUVYekNKNWJGY2RpV0NnYThtYWdmM01ha1MzL1lC?=
 =?utf-8?B?eWMyRXdvc0U3NmdZc1k1cUZOc1FCOVpoTWNkRjBSM0FoeDhod1hMUzF2RU1E?=
 =?utf-8?B?TU1GRm5wRG9oc2IwV2pEZmRRSzFSVVVETTBwV21Ua3N2QjBmV2FBTEhqOVFQ?=
 =?utf-8?B?Y2tVWGNwRitIR3BIRE9tUHdiaklING42cmlQWk1Odkl4V1FlZzVVK2wwL0ov?=
 =?utf-8?B?RG9PbkZJa2JuU2ZjMVdaS0VZV2ZVUUdhbDV3b20zT3lLWitKVi9RZCtNa1R3?=
 =?utf-8?B?eHpZeE5yYXN2TmZNODVkNWhwenFDM2dhQ2d5bXdyWVVvYUxha0lsalY2Q0c5?=
 =?utf-8?B?d1g2bzY2YmxxL0MxOHpTaDk3Y2Z6TEpZZWhjRHl3dkdvbmdiOGVyQWh2Um5t?=
 =?utf-8?B?Y2pTbEQ5OTI0cWVyTndvT0UySEtPbUIvZ3VWakFlcmY4UnJVNjF3eGFHb0xN?=
 =?utf-8?B?SEViWEZQUENBK2tZcGp4TnBMQ0xjYlROWFp3NWFLcTBpS2hOOXlGQTlwQmNT?=
 =?utf-8?B?dFZWTTVCVjBMQXVCdGNKMVJVNVFjWWNZTnBVNlRoWW9CeFF1ZEVDRnF6Tkc1?=
 =?utf-8?B?VTdpWWYxMjZPTVZucEF2bHMreElQNUcvMU1zQTE4VGo2S3hhMFh5Vk1TVjhM?=
 =?utf-8?B?N3dYdjNRdm90cXRZdDl4WW1pRm5RRFRyc1NXd3lFWTNVWG5JRGo5dW8vQi9m?=
 =?utf-8?B?MS81YzZpN0hVV2lubEh4KzFicGIxdEp1dldESU8rc1p2K1EzTHJxSWdsMkpi?=
 =?utf-8?B?Q1lHME55YlZSaml2RE82SUZEa1ZSK2lrd3dhcjkzc3JSNnFKVWJHNGVwa29n?=
 =?utf-8?B?VkhuSnZzNXRsVll4OERZaHlvMFpKcE5IR3YxNGplNWMycHVFb0phZnRsU2ho?=
 =?utf-8?B?L1VCYnBsSkhuZkIxNndRYU00Uk41aXhnQUpDeVZIelRoK2xCMmc3eVpsQzZL?=
 =?utf-8?B?R2hRRTNBSUNUMGk0QlBNT0VtamV3M0NCdzZJY3JMREZscWhoZ1k3YkxCT1VD?=
 =?utf-8?B?Y1NKRzFGeFA5UmM4UTJzZG1xbVhja3UvSmlNUzlkMWtyRS9qa3A2RzA1SXA1?=
 =?utf-8?B?MnNCU2hueCt6STRrb3VjOFc5TFhnNDJCeWVSTWtNenpIZ0xUcWNwUFdBRzZX?=
 =?utf-8?B?R0JKYlE5K0hZRkFUcWdNMEZlSVhDYnZ4L1Y1TGc3ZWwvNldDRTBHU1VaRGNW?=
 =?utf-8?B?T2RCS004aEMvY3I1QUpNdXE3YTFLOWgyZHY0aDhRcDFpa3FDZmRZaitCNG5l?=
 =?utf-8?B?RXdsMmZFaldhUCsraVRLZzFuaGpDRUlMaWZjVEFFNEFwQ3pjaWNaUXNCbVJl?=
 =?utf-8?B?c3FzV0xJWE51c2pNenp6Q292N0xnRHdCWURTdlBJYWNrQzNPSXVUUitrbitQ?=
 =?utf-8?B?YnlHeEpTUVl0VXNINEFFa25vbWkyck93ZnhNS3k1T0ZsdURXOEMwQVJabHVD?=
 =?utf-8?B?NGZmd1JEcFhBTm4xRTJWcVBJNm5tQnFKMUErRTlkeGxraTNlSUhMZnA1QlB1?=
 =?utf-8?B?K2JhbnJCMjkwUnV2cDVQNkxPNmx4T2lNVm5GbWNjZEs1R09vNDFCQ0s2cHhR?=
 =?utf-8?B?NnU4M25FbEJmdE9oN09xRzErOUZXbFczdEExTE16bDhTOGkxNlJlcXk4OVpF?=
 =?utf-8?B?YmRpUElhTW5TMC9QcnJvSEs5NnppQTBwaS93VXEzSnpXR2ZMejlyQUxESmFS?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3da5da4-b792-46bf-45aa-08dcdf155e73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 16:56:45.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbFSmRa+757jqq1IMDkqtbfpsHeGpi/AW2j2J4araoQ1we7o9mTWAxdunhKljS7+RElpaABlXB4GmSgucjD1U7VpThwdXWVF0gb5i4QHr3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

--------------l01MC2F6L8ewKof2soQFTmwu
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/27/2024 7:57 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Restore GT freq on GSC load error
> *URL:* 	https://patchwork.freedesktop.org/series/139119/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full ->
>   xe-pw-139119v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-139119v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139119v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-139119v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html>
>         +2 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms.html>
>         +1 other test skip
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         +2 other tests fail
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_pipe_crc_basic@nonblocking-crc.html>
>         +1 other test fail
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html>
>         +1 other test skip
>  *
>
>     igt@xe_exec_basic@twice-rebind:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_exec_basic@twice-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_exec_basic@twice-rebind.html>
>         +1 other test dmesg-warn
>  *
>
>     igt@xe_pm@s2idle-vm-bind-prefetch:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         +1 other test dmesg-warn
>

Failures are not related to this change.

Thanks,

Vinay.

>  *
>
>
>         Warnings
>
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         +6 other tests skip
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html>
>         +1 other test incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o {shard-bmg}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         +7 other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html>
>  *
>
>     igt@xe_pm@s4-d3cold-basic-exec:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-139119v1_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         (Intel XE#1701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +4
>         other tests fail
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#1399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +6
>         other tests fail
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-mode-timings:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_content_protection@legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@torture-move@pipe-b:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-b.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +3
>         other tests incomplete
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +4
>         other tests dmesg-fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7
>         other tests skip
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-a-plane-3:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>) +1
>         other test incomplete
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>)
>  *
>
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_psr@pr-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_psr@pr-dpms.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr2-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_psr@psr2-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +1
>         other test fail
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1
>         other test skip
>  *
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_vrr@flip-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@kms_vrr@flip-basic.html>
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +3
>         other tests fail
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_vrr@flip-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#1522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522>) +1
>         other test fail
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) +1
>         other test timeout
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-threads-small:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-small.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_compute_mode@lr-mode-workload:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html>
>         (Intel XE#2125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125>)
>  *
>
>     igt@xe_exec_fault_mode@invalid-va:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@xe_oa@invalid-create-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1
>         other test skip
>  *
>
>     igt@xe_oa@oa-formats:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_oa@oa-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm@s4-mocs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#2280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280>)
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_getversion@all-cards:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@core_getversion@all-cards.html>
>         (Intel XE#2452
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@core_getversion@all-cards.html>
>  *
>
>     igt@core_hotunplug@hotreplug:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_hotunplug@hotreplug.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@core_hotunplug@hotreplug.html>
>  *
>
>     igt@fbdev@eof:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbdev@eof.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@fbdev@eof.html>
>         +2 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         +5 other tests pass
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         +162 other tests pass
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         +4 other tests pass
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         +2 other tests pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         +3 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#2791
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@absolute-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html>
>         (Intel XE#2631
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +6 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html>
>         +3 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html>
>         +6 other tests pass
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html>
>         +3 other tests pass
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         +5 other tests pass
>  *
>
>     igt@kms_plane_cursor@overlay:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane_cursor@overlay.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_plane_cursor@overlay.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         +3 other tests pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_pm_rpm@cursor:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@cursor.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html>
>         +5 other tests pass
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#2136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html>
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html>
>  *
>
>     igt@xe_spin_batch@spin-all:
>
>       o {shard-bmg}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_spin_batch@spin-all.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@xe_spin_batch@spin-all.html>
>         +291 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +10
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7
>         other tests skip
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +25
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +22
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_pm_backlight@fade.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +6
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_vrr@flipline.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_vrr@flipline.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15
>         other tests skip
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +11
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +18
>         other tests skip
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_mmap@small-bar.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_oa@missing-sample-flags:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_oa@missing-sample-flags.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_oa@missing-sample-flags.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3
>         other tests skip
>  *
>
>     igt@xe_oa@non-privileged-access-vaddr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +5
>         other tests skip
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8032 -> IGT_8033
>   * Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 ->
>     xe-pw-139119v1
>
> IGT_8032: 8032
> IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: 
> ec87b409d3a9358c9a079186d528fad3f7d64334
> xe-pw-139119v1: 139119v1
>
--------------l01MC2F6L8ewKof2soQFTmwu
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/27/2024 7:57 AM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:172744907596.1111712.121613995257=
49283685@2413ebb6fbb6">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Restore GT freq on GSC load error</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/139119/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/139119/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139119v1/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full -&gt;
        xe-pw-139119v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-139119v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-139119v1_full, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-139119v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hd=
mi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-abs=
olute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html" moz-do-not-send=3D"true"=
>FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms.h=
tml" moz-do-not-send=3D"true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_flip@flip-vs-absolut=
e-wf_vblank-interruptible.html" moz-do-not-send=3D"true">FAIL</a> +2 other =
tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_p=
ipe_crc_basic@nonblocking-crc.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-=
lnl-8/igt@kms_pipe_crc_basic@nonblocking-crc.html" moz-do-not-send=3D"true"=
>FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr2-primar=
y-render.html" moz-do-not-send=3D"true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@twice-rebind:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_ex=
ec_basic@twice-rebind.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/ig=
t@xe_exec_basic@twice-rebind.html" moz-do-not-send=3D"true">DMESG-WARN</a> =
+1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@xe_=
pm@s2idle-vm-bind-prefetch.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adl=
p-6/igt@xe_pm@s2idle-vm-bind-prefetch.html" moz-do-not-send=3D"true">DMESG-=
WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Failures are not related to this change.</p>
    <p>Thanks,</p>
    <p>Vinay.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:172744907596.1111712.121613995257=
49283685@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/ig=
t@xe_exec_mix_modes@exec-simple-batch-store-lr.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec=
_mix_modes@exec-simple-batch-store-lr.html" moz-do-not-send=3D"true">SKIP</=
a> +6 other tests skip</li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-7/igt@kms=
_flip@flip-vs-blocking-wf-vblank.html" moz-do-not-send=3D"true">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/sha=
rd-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html" moz-do-not-send=3D"t=
rue">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>{shard-bmg}: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-=
send=3D"true">SKIP</a> +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms=
_pm_rpm@modeset-lpsp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send=3D"=
true">Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html" moz-d=
o-not-send=3D"true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3cold-basic-exec:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_=
pm@s4-d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send=
=3D"true">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html=
" moz-do-not-send=3D"true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-139119v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_a=
tomic_transition@modeset-transition-nonblocking.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139119v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblo=
cking.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1701" moz-do-not-send=3D"true">Intel XE#=
1701</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms=
_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-se=
nd=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modese=
t-transition-fencing.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send=3D"=
true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe=
-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_atomic_transition=
@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"t=
rue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1426" moz-do-not-send=3D"true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-=
rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel=
 XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201" moz-do-not-send=3D"true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_big_fb@linear-8=
bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip=
:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms=
_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-se=
nd=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp=
-rotate-0-async-flip.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1231" moz-do-not-send=3D"=
true">Intel XE#1231</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-h=
w-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz=
-do-not-send=3D"true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-r=
otate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel=
 XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms=
_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-=
send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32b=
pp-rotate-180-async-flip.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204" moz-do-not-se=
nd=3D"true">Intel XE#1204</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_big_fb@y-tiled-=
max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124=
" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-180-hflip.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send=3D"true"=
>Intel XE#1874</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_bw@connected-linear-=
tiling-3-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-=
send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2191" moz-do-not-send=3D"true">Intel XE#2191</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_bw@connected-linear-ti=
ling-4-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-se=
nd=3D"true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-d=
isplays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-str=
ide-4-tiled-mtl-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D=
"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-str=
ide-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" mo=
z-do-not-send=3D"true">Intel XE#787</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-f=
ormat-yf-tiled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"tr=
ue">Intel XE#787</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-y=
f-tiled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1399" moz-do-not-send=3D"true">Int=
el XE#1399</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-f=
ormat-yf-tiled-ccs@pipe-c-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +6 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe=
-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_ccs@crc-sprite-=
planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/616" moz-do-not-send=3D"true">Intel XE#616</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"=
 moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" =
moz-do-not-send=3D"true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-=
y-tiled-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Int=
el XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-=
y-tiled-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +5 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_chamelium_edid@dp-ed=
id-stress-resolution-non-4k.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_edid@=
hdmi-mode-timings.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true=
">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_hpd@h=
dmi-hpd-for-each-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D=
"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) +3 other tes=
ts
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd=
-for-each-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">I=
ntel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_content_protection@l=
egacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55" moz-do-not-send=3D"true">Intel XE#455</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onsc=
reen-32x32.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Inte=
l XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_cursor_crc@curs=
or-random-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_cursor_crc@curs=
or-sliding-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_cursor_legacy@torture-move@pipe-b.html" moz-do-not-send=3D"true">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13911=
9v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html" moz-do-no=
t-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/877" moz-do-not-send=3D"true">Intel XE#877</a>) +1 othe=
r test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-pann=
ing.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310=
" moz-do-not-send=3D"true">Intel XE#310</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-=
dg2-436/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send=3D"true">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send=3D"true">Intel=
 XE#2597</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:<=
/p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_f=
lip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139119v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-inter=
ruptible@b-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send=3D"true">=
Intel XE#886</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html" moz-do-not-send=3D"true">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39119v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html" m=
oz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a=
>) +3 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-down=
scaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-6=
4bpp-linear-to-16bpp-linear-downscaling.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" =
moz-do-not-send=3D"true">Intel XE#1397</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#17=
45</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-down=
scaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-6=
4bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1397" moz-do-not-send=3D"true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms=
_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-m=
ode.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_flip_scaled=
_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" mo=
z-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) =
+4 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-r=
ender:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking=
@drrs-1p-offscren-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#651=
</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms=
_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscr=
n-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1861" moz-do-not-send=3D"tr=
ue">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_frontbuffer_tracking@f=
bc-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz=
-do-not-send=3D"true">Intel XE#656</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-=
blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_frontbuffer_tracking@f=
bcdrrs-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-d=
o-not-send=3D"true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-=
blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651=
" moz-do-not-send=3D"true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-=
blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tra=
cking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true">Intel XE#=
651</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
 moz-do-not-send=3D"true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-b=
lt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_frontbuffer_tracking=
@fbcpsr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656" moz-do-not-send=3D"true">Intel XE#656</a=
>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking=
@psr-1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_frontbuffer_tra=
cking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel X=
E#653</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_p=
lane@plane-position-hole@pipe-a-plane-3.html" moz-do-not-send=3D"true">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13911=
9v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html" moz-=
do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) +1=
 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-=
5@pipe-c:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/ig=
t@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html" =
moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_plane_scaling@planes=
-unity-scaling-downscale-factor-0-5@pipe-c.html" moz-do-not-send=3D"true">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1195" moz-do-not-send=3D"true">Intel XE#1195</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2566" moz-do-not-send=3D"true">In=
tel XE#2566</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_p=
m_dc@dc6-dpms.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_pm=
_dc@dc6-dpms.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send=3D"true">In=
tel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_p=
m_dc@deep-pkgc.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_p=
m_dc@deep-pkgc.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2029" moz-do-not-send=3D"true">=
Intel XE#2029</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-=
sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-p=
lane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_psr@pr-dpms.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) +1 oth=
er test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_psr@psr2-dpms.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" mo=
z-do-not-send=3D"true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_psr@psr2-primary-rende=
r.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1649" moz-do-not-send=3D"true">Intel XE#1649=
</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_rotation_crc@primary=
-yf-tiled-reflect-x-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/327" moz-do-not-send=3D"true">Intel XE#327</a>) +1 other =
test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic-clone-single-crtc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_setmode@basic-clone-si=
ngle-crtc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel=
 XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/362" moz-do-not-send=3D"true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_tv_load_detect@=
load-detect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/330" moz-do-not-send=3D"true">Inte=
l XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_v=
rr@flip-basic.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@kms_vr=
r@flip-basic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2443" moz-do-not-send=3D"true">In=
tel XE#2443</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_v=
rr@flip-dpms.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_vrr=
@flip-dpms.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1522" moz-do-not-send=3D"true">Inte=
l XE#1522</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_writeback@write=
back-fb-id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel=
 XE#756</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_writeback@writeback-fb=
-id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send=3D"tru=
e">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.h=
tml" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473=
</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/ig=
t@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send=3D"tru=
e">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.h=
tml" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473" moz-do-not-send=3D"true">Intel XE#1473=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/402" =
moz-do-not-send=3D"true">Intel XE#402</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-2/igt@xe_evict@evict-beng-mixe=
d-threads-large.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261" moz-do-not-send=3D"true">Intel XE#261</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true"=
>Intel XE#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-small:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_evict@evict-beng-thread=
s-small.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE=
#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@xe_exec_basic@multigpu-onc=
e-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel X=
E#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_basic@multigpu-o=
nce-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=
=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_=
exec_compute_mode@lr-mode-workload.html" moz-do-not-send=3D"true">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/s=
hard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2125" moz-do-not-send=3D"true">Intel XE#2125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@invalid-va:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_exec_fault_mode@inval=
id-va.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
88" moz-do-not-send=3D"true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@=
many-userptr-invalidate-imm.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@xe_gt=
_freq@freq_reset_multiple.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-=
1/igt@xe_gt_freq@freq_reset_multiple.html" moz-do-not-send=3D"true">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/162=
0" moz-do-not-send=3D"true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-create-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_oa@invalid-creat=
e-userspace-config.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2541" moz-do-not-send=3D"true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-formats:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_oa@oa-formats.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-n=
ot-send=3D"true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm=
@s4-mocs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@xe_pm@s4-mo=
cs.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1794" moz-do-not-send=3D"true">Intel XE#17=
94</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_=
pm@s4-multiple-execs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/i=
gt@xe_pm@s4-multiple-execs.html" moz-do-not-send=3D"true">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-s=
end=3D"true">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1607" moz-do-not-send=3D"true">Intel XE#1607</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-no=
t-send=3D"true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send=3D"true">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-=
dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send=3D"true">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2280" moz-do-not-send=3D"true">Intel XE#2280</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_we=
dged@wedged-at-any-timeout.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl=
-7/igt@xe_wedged@wedged-at-any-timeout.html" moz-do-not-send=3D"true">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
760" moz-do-not-send=3D"true">Intel XE#1760</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_getversion@all-cards:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@cor=
e_getversion@all-cards.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452" moz-do-not-send=
=3D"true">Intel XE#2452</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@core_getversion@all-cards.html"=
 moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_=
hotunplug@hotreplug.html" moz-do-not-send=3D"true">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/ig=
t@core_hotunplug@hotreplug.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@eof:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbd=
ev@eof.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send=3D"true">Intel XE=
#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139119v1/shard-bmg-3/igt@fbdev@eof.html" moz-do-not-send=3D"true">PASS</a>=
 +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-ed=
p-1-linear:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_a=
sync_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html" moz-d=
o-not-send=3D"true">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_async_flips@async-flip-with=
-page-flip-events@pipe-a-edp-1-linear.html" moz-do-not-send=3D"true">PASS</=
a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-fl=
ip:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms=
_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-=
send=3D"true">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bp=
p-rotate-180-async-flip.html" moz-do-not-send=3D"true">PASS</a> +162 other =
tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1874" moz-do-not-send=3D"true">Intel XE#1874</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_=
big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D"=
true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html" moz-do-=
not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1231" moz-do-not-send=3D"true">Intel XE#1231</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp=
-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.htm=
l" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"tr=
ue">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1195" moz-do-not-send=3D"true">Intel XE#1195</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true=
">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-3/igt@kms=
_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-d=
o-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2791" moz-do-not-send=3D"true">Intel XE#2791</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-=
not-send=3D"true">Intel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_cursor_legacy@cursor=
b-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">P=
ASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_f=
lip@absolute-wf_vblank.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631" moz-do-not-send=
=3D"true">Intel XE#2631</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.htm=
l" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_f=
lip@flip-vs-absolute-wf_vblank.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not=
-send=3D"true">Intel XE#886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-w=
f_vblank.html" moz-do-not-send=3D"true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms=
_flip@flip-vs-suspend-interruptible.html" moz-do-not-send=3D"true">DMESG-WA=
RN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
119v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-=
not-send=3D"true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-down=
scaling@pipe-a-valid-mode:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms=
_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid=
-mode.html" moz-do-not-send=3D"true">INCOMPLETE</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode=
.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downsc=
aling:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms=
_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html" moz-do-n=
ot-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-a=
dlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.h=
tml" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-re=
nder:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms=
_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" moz-do-no=
t-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1861" moz-do-not-send=3D"true">Intel XE#1861</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9=
/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html" m=
oz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-8/igt@kms=
_plane@pixel-format-source-clamping@pipe-b-plane-0.html" moz-do-not-send=3D=
"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/877" moz-do-not-send=3D"true">Intel XE#877</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@k=
ms_plane@pixel-format-source-clamping@pipe-b-plane-0.html" moz-do-not-send=
=3D"true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_p=
lane@plane-position-covered.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324" moz-do-=
not-send=3D"true">Intel XE#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_plane@plane-position=
-covered.html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_p=
lane@plane-position-hole-dpms@pipe-b-plane-3.html" moz-do-not-send=3D"true"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324" moz-do-not-send=3D"true">Intel XE#324</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_pla=
ne@plane-position-hole-dpms@pipe-b-plane-3.html" moz-do-not-send=3D"true">P=
ASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_p=
lane_cursor@overlay.html" moz-do-not-send=3D"true">DMESG-WARN</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-=
2/igt@kms_plane_cursor@overlay.html" moz-do-not-send=3D"true">PASS</a> +1 o=
ther test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send=3D=
"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/616" moz-do-not-send=3D"true">Intel XE#616</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_p=
lane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send=3D"true">=
PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html" moz-do-not-sen=
d=3D"true">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@p=
ipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms=
_pm_rpm@cursor.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send=3D"true">=
Intel XE#2446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139119v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html" moz-do-not-send=
=3D"true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/ig=
t@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send=3D"true">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
473" moz-do-not-send=3D"true">Intel XE#1473</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_evict@=
evict-mixed-many-threads-small.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-5/igt@xe_=
exec_reset@parallel-gt-reset.html" moz-do-not-send=3D"true">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105" moz-do-n=
ot-send=3D"true">Intel XE#2105</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_exec_reset@parallel-g=
t-reset.html" moz-do-not-send=3D"true">PASS</a></li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/ig=
t@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send=3D"true">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105" moz=
-do-not-send=3D"true">Intel XE#2105</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@xe_exec_reset@par=
allel-gt-reset.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_=
module_load@reload-no-display.html" moz-do-not-send=3D"true">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136" moz-do-not=
-send=3D"true">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@xe_module_load@reload-no-d=
isplay.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_=
pm@s4-vm-bind-unbind-all.html" moz-do-not-send=3D"true">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-se=
nd=3D"true">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.=
html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm=
_residency@toggle-gt-c6.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/958" moz-do-not-send=
=3D"true">Intel XE#958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.htm=
l" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-all:</p>
          <ul>
            <li>{shard-bmg}: <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_=
spin_batch@spin-all.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send=3D"t=
rue">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139119v1/shard-bmg-8/igt@xe_spin_batch@spin-all.html" moz-do-=
not-send=3D"true">PASS</a> +291 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/623" moz-do-not-send=3D"true">Intel=
 XE#623</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139119v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/623" moz-do-not-send=3D"true">Intel XE#623</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_big_fb@4-tiled-64bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" mo=
z-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Intel XE#316</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119=
v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-16bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz=
-do-not-send=3D"true">Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_big_fb@x-tiled=
-16bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tru=
e">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316" moz-do-not-send=3D"true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip=
:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms=
_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1231" moz-do-not-send=3D"true">Intel XE#1231</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/i=
gt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html" moz-do-=
not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/324" moz-do-not-send=3D"true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_big_fb@y-tiled-addfb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/619" moz-do-not-send=3D"true">Intel XE#619</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg=
2-432/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do=
-not-send=3D"true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/ig=
t@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"t=
rue">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:<=
/p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435=
/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@k=
ms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true=
">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2191" moz-do-not-send=3D"true">Intel XE#2191</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt=
@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=3D"tru=
e">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=3D"tr=
ue">Intel XE#2191</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-di=
splays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=3D"tru=
e">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@kms_bw@linear-tiling-2-displays-3840x2160p.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel X=
E#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139119v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-d=
p-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-se=
nd=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2=
-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-n=
ot-send=3D"true">Intel XE#787</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a=
-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-sen=
d=3D"true">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-t=
iled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-no=
t-send=3D"true">Intel XE#787</a>) +76 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send=3D"true">I=
ntel XE#1252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-=
bmg-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1252" moz-do-not-send=3D"true">Intel X=
E#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe=
-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/sh=
ard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-=
c-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe=
-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-=
send=3D"true">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-=
basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" =
moz-do-not-send=3D"true">Intel XE#787</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252=
" moz-do-not-send=3D"true">Intel XE#1252</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_ccs@rand=
om-ccs-data-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-s=
end=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1252" moz-do-not-send=3D"true">Intel XE#1252</a>) +2 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/ig=
t@kms_chamelium_audio@dp-audio.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shar=
d-dg2-432/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
" moz-do-not-send=3D"true">Intel XE#373</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373" moz-do-not-send=3D"true">Intel XE#373</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@km=
s_chamelium_edid@hdmi-edid-stress-resolution-4k.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Inte=
l XE#373</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@kms_content_protection@dp-mst-type-1.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" m=
oz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true">Intel XE#307<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13911=
9v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307" moz-do-not-send=3D"true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/308" moz-do-not-send=3D"true">Intel XE#308</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_curso=
r_crc@cursor-rapid-movement-512x512.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"true">Intel XE#308</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p=
>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/ig=
t@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"t=
rue">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"tr=
ue">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varyin=
g-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send=3D"true">Intel XE#=
323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39119v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-a=
tomic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-no=
t-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/323" moz-do-not-send=3D"true">Intel XE#323</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not=
-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-form=
ats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#12=
01</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455=
" moz-do-not-send=3D"true">Intel XE#455</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@kms_feature_discovery@display-3x.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-d=
o-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/703" moz-do-not-send=3D"true">Intel XE#703</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/=
shard-dg2-432/igt@kms_feature_discovery@display-3x.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/703" moz-do-not-send=3D"true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_force_connector_basic@prune-stale-modes.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5274" moz-do-not-send=3D"true">i915#5274</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_forc=
e_connector_basic@prune-stale-modes.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5274" moz-do-not-send=3D"true">i915#5274</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651" moz-do-not-send=3D"true">Intel XE#651</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@k=
ms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"true=
">Intel XE#651</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullsc=
reen:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-s=
end=3D"true">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-d=
o-not-send=3D"true">Intel XE#651</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/658" moz-do-not-send=3D"true">Intel XE#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1391=
19v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/658" moz-do-not-send=3D"true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653" moz-do-not-send=3D"true">Intel XE#653</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2=
-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-d=
o-not-send=3D"true">Intel XE#653</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-=
send=3D"true">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@p=
sr-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz=
-do-not-send=3D"true">Intel XE#653</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_getfb@getfb-reject-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605" moz-do-not-s=
end=3D"true">Intel XE#605</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605" mo=
z-do-not-send=3D"true">Intel XE#605</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-f=
ormat@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763" moz-do-not-send=3D"true">Intel XE#2763</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1=
/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel=
-format@pipe-b.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763" moz-do-not-send=3D"true">Intel XE#2763</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-=
25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2763" moz-do-not-send=3D"true">Intel XE#2763</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-=
not-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@plan=
es-unity-scaling-downscale-factor-0-25@pipe-d.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send=3D"true">Intel=
 XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455" moz-do-not-send=3D"true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_pm_backlight@fade.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=
=3D"true">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_pm_backlight@fade.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not=
-send=3D"true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/ig=
t@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"tru=
e">Intel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">=
Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_psr2_sf@primary-plane-update-sf-dmg-area.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_psr=
2_sf@primary-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" mo=
z-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/ig=
t@kms_psr@psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/=
igt@kms_psr@psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"=
true">Intel XE#2850</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_psr@psr2-sprite-plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-=
not-send=3D"true">Intel XE#2850</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_psr@psr2-sprite-p=
lane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850" moz-do-not-send=3D"true">Intel XE#2850</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1127" moz-do-not-send=3D"true">Intel XE#1127</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" mo=
z-do-not-send=3D"true">Intel XE#1127</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@kms_vrr@flipline.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"tr=
ue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/=
igt@kms_vrr@flipline.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"t=
rue">Intel XE#455</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
56" moz-do-not-send=3D"true">Intel XE#756</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_writeba=
ck@writeback-invalid-parameters.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-n=
ot-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/756" moz-do-not-send=3D"true">Intel XE#756</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@xe_compute_preempt@compute-preempt.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz=
-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"true">Intel XE#1280<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" m=
oz-do-not-send=3D"true">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_compute_preem=
pt@compute-preempt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"tr=
ue">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@xe_exec_fault_mode@once-rebind-prefetch.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"=
 moz-do-not-send=3D"true">Intel XE#288</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_=
mode@once-rebind-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-se=
nd=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE#288</a>) +11 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@xe_exec_fault_mode@twice-userptr-invalidate-race.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">I=
ntel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalida=
te-race.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel XE=
#288</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@xe_huc_copy@huc_copy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send=3D=
"true">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-sen=
d=3D"true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/ig=
t@xe_mmap@small-bar.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"t=
rue">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/512" moz-do-not-send=3D"true">Intel XE#512</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/=
igt@xe_mmap@small-bar.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/512" moz-do-not-send=3D"=
true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@missing-sample-flags:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@xe_oa@missing-sample-flags.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-=
send=3D"true">Intel XE#2541</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_oa@missing-sample-flag=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
 moz-do-not-send=3D"true">Intel XE#2541</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-access-vaddr:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/ig=
t@xe_oa@non-privileged-access-vaddr.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-=
do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2541" moz-do-not-send=3D"true">Intel XE#2541</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119=
v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2541" moz-do-not-send=3D"true">Intel XE#2541</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-=
not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/366" moz-do-not-send=3D"true">Intel XE#366</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/sh=
ard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/366" moz-do-not-send=3D"true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@xe_pm@vram-d3cold-threshold.html" moz-do-not-send=3D"true">SKIP</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-=
dg2-433/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201" =
moz-do-not-send=3D"true">Intel XE#1201</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/ig=
t@xe_query@multigpu-query-engines.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-=
not-send=3D"true">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_query@multigpu-quer=
y-engines.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201" moz-do-not-send=3D"true">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/944" moz-do-not-send=3D"true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/ig=
t@xe_query@multigpu-query-topology-l3-bank-mask.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201" moz-do-not-send=3D"true">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Inte=
l XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139119v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mas=
k.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#944</=
a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8032 -&gt; IGT_8033</li>
        <li>Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334
          -&gt; xe-pw-139119v1</li>
      </ul>
      <p>IGT_8032: 8032<br>
        IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334:
        ec87b409d3a9358c9a079186d528fad3f7d64334<br>
        xe-pw-139119v1: 139119v1</p>
    </blockquote>
  </body>
</html>

--------------l01MC2F6L8ewKof2soQFTmwu--
