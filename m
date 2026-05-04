Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F53FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 10:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2FE10E21D;
	Mon,  4 May 2026 10:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNsttuXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A48A10E21D
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777892009; x=1809428009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BRt4lqng+teJ/wiASs5cDu+EMFG7o1V2RdBwU6yB10A=;
 b=QNsttuXJvmx6RwsL/CprgRjImeuhpxpLdBTWQYGmlYKHfZgrR2k9FF02
 VN9/ndXeU3fc6pEGd1/svcH8rLQW6CqjV/DeETX4hq+iYJh7u4Zz1FQaF
 9/RowqiNhidJ4glQ/vMEdKcEG9+ncAiKmM2nYJe6KvSPPIVTaHl3fj2l2
 UdPWZiQ5aeTvZaCrtvzvjZXR0933npTfR3l2P5nwidP2GGGwYxE6w7HRS
 EsY2wtsWTZ5a6Z/mVVsb7p/rqy31Tg6IdWbnGXLz8d7oJG/8iTas8gKnQ
 K1miYYjTvh1D8hqTqkHDPFF/+0+EjSr6kuDoCYrVLRyEFB6jsYHpCcV7m Q==;
X-CSE-ConnectionGUID: jnIZCabvSKCrA4fLLwCoBQ==
X-CSE-MsgGUID: gKAFYQwkSsitT62Cg/P3Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77905755"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="77905755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:53:29 -0700
X-CSE-ConnectionGUID: nJznh0OJTaq9zCcRtFwH8g==
X-CSE-MsgGUID: xUK0+bP9SEydhlf9J/qfQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239791010"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:53:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 03:53:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 03:53:28 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 03:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRaE5CDSWYlOv/XZmWt35xLQmtvTE9g5P0CSKcC1X/5lSTc+qtYgrAxBN56aoBNejjSDdEWxudO7xrfu91a+tjypHFCACepBGwTCwr7jp3g258Is/y49/GDddwtOBbotl0KLn0VWzn1hI5JVsW2yQw0j2YCVnipIWUFL0ZFDR08kvkO1Hr+TFGklvvN41gsrNrNpj8unaAs4s8frEKMdytKoAP9E7+e+JMa+SzXZrhpQwuXw9mkseZa0/0OUT3933AbtaL7EEUlsqami6ifuffACxIAlskpVBKSrizirHSqh2vMjAOhE9FsHacaYplkUKVslM+c1fEfspZoCXqgREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzCFgpeCIn+Eykf57+qp8uptQi+ZlFFLY5zM8MyAS8U=;
 b=jBXdlB8K6LsaXvwxuCfKGXKWqJOkaGF6oF+lUvuPPH8OQ7q3bb7Hp+/3wwRi/zT1yayyb4ffCP5tFYqz5RNP62+ZytcIrll/cHhk+Xb16RanZliEYFLdcPuaEIjtSWxyad8Gvle1bEeIqDyf1Gnc+MquryE1qHVLJqq3q0gZTpRU3iaevgmkzAsDjbMheZzm4xP+/b0NRxYKw6ZO1ATa/CeKJcn8pdxcSVektHTPg/M+CY5wab2MHnTd6kErkwv8TdbJh4vzfw7lHm4KO72yx4fLUkLMJtY5Jdz42z+ClM8drAoC22TP2IeZzS4SgVctKZH/+aC8Lc/opbSz8zicWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Mon, 4 May 2026 10:53:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 10:53:24 +0000
Message-ID: <691a88c5-49eb-4b9c-96c7-8054b3224632@intel.com>
Date: Mon, 4 May 2026 16:23:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/xe/xe_ras: Move xe drm_ras registration
To: <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Anoop Vijay
 <anoop.c.vijay@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-13-riana.tauro@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260504065614.3832331-13-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5169:EE_
X-MS-Office365-Filtering-Correlation-Id: f0074d7e-7b8a-424f-404b-08dea9cb5d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: oE4i7B5ew6y6w3XjRwX8bysyHGIo4F+pom7Fxlzuwq2VkhEfACfCAoBPgrN22oQ84/B+OBx2qWgkrKyoOrziUK1CMqlYIH8z3ZxhIuG7CwNUREVISzXf6zITh6NEFo5F7f+t38UPpoAs0EIOKsA1A/MHhdjQxBF6jbH0rWGVEX/jDRjIUDWzrPurNnv5txV+7Sx+lKt/NUIWjq76FFtmN3WP6dHc69UcL/Oz+la+QqZT5gQPDBoybjh2jbex+KIjel0GfYNwUwZ/SkdE5m8sYFFUgUGHrti1w1TGitotCY/+zuoHpoIn9RKpZ6t4WmGtEZ+Xx3rjMNxwFyD0Q5FtGdMW5A3GmCPL70udhKjt/pkzIokLsXIqno/G2dfTtw2aTVHZ7KDgMIA057CygH4UzjExVWwnSzZ0rQAAeKR8KO/hqXGdrClWWzzDCk+lleNmufS1BT3VHHMDrY+GWti7wmLPV3rvy4auONum6z3Z4guT9uyuRr14MdwRmP4zCMyn47Ap0GDU+X6rkAl6B6JJsZ4nKvrkHkNJCs0gosHc4eSExnP7zN36gt1ZemC51dGeTpWbnrBwFROhyCrGRLAr7dmFejRikdb4eoScj8C/nxvCF9UqWPdAE2nkBEDDXJceqNQjTY5foROZY8o8vF73uvccDoyQICRnWIGljebHUlhxfENWKCVOEH6FFWxUaz+c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdkbFRLbFdoZFlxSTMwdlpXZHFURGduT2tORmJjU0U1aDRFQmdHSmdBT3BG?=
 =?utf-8?B?akFjb1o3MTZ1M2ZmaGdyVjhYK2dQYWl2UGxTOStYeUVDS2ZQYVVwRVlLSmoy?=
 =?utf-8?B?dVA1Ym1wRDRlbXg1Sk9CYlZGWXU3bXJSMFZBZm8xeEcrb2pPN1Q5aW5KMHpI?=
 =?utf-8?B?a0F3cU5xdnBzdFlIQlc0NDVRU1oybCtKQ3gvQktZMk5mYW1DckdOTi91VnM4?=
 =?utf-8?B?bmNSNGlDcUQ0eGVUZGJFNHJyaUx0anpoL2NYZUpHRDNSaHBIZjcxZityc0xQ?=
 =?utf-8?B?UWJ4QStVSFFvNy95OUNiUFhIWVlJZTgxN3NlM1IySUhxa1pKd3RxYml5ZUpo?=
 =?utf-8?B?b0VWbUtIRXdKTWd5VGRJc3liYWJvcHo1Uk5waXRNcFhsdnlOODFtdStpeDVt?=
 =?utf-8?B?L1p0TTRuVnhybnB5SiswZGd6akhYNVhxTzNISkltNEJGUjBrb0x2Z0p2Um9w?=
 =?utf-8?B?QTV2Y216ait3VXVxYU1YU1JxTmNZaGlpenJoQmhyQ2oxalhGQnFJNGp0Vjkw?=
 =?utf-8?B?ZFdmVlRhNmdDRWNFQXRRcTg0QWI1Q1VsNCtld1UxMGtDUU80MGJvR05zTXJW?=
 =?utf-8?B?RUEyTG5ocCtHK0lhTVdrNkU3RVdmZEtUdkYxTzVPMk1Kd3BYR1dyRWZuVFhD?=
 =?utf-8?B?dTMvSjRlQkI5WjVVMGZBd1pJNFZ1SS81U1dpcUZoekxwUWo4bUZCenJNdmVO?=
 =?utf-8?B?S0F2UjZ2RVVMZ1RtMmxsS1VIVGF0WUNsaFlwQjNHWVh6MmdhaG8wTlR2b0RC?=
 =?utf-8?B?T1hldmpJNzJHejR3MkNkZWV2L2FwWG5heFRYZ0tWMzdYeXpuT1kzOTFSaDl4?=
 =?utf-8?B?eXRmZDFIaHNsbURma0VGOWNqdnYwa1ZkUEtuOUl0VHJtWUtNNW1wUW9LaTk0?=
 =?utf-8?B?Wm9JSUhTRm4vblFYenN6RytkaG05RStjV292WFc0MFhkcEhwZ0tMNloyZjNX?=
 =?utf-8?B?QUk0MFViSlEraDFEOFhOTnlLb3JWN2FXcUVCSTNnek5lWDEwbVRlV290RzE3?=
 =?utf-8?B?S21PSUZmc2Y2QW1HV3FHZjYwZUtFTjAzeVV1VnRmdG8vNWdVN3FVWWxmWlV2?=
 =?utf-8?B?djNlMU1GTjNDamRMcmlxQnlGM2dCV1FJU3BDSGF2NC9ENUxSZVFoQTI5RElD?=
 =?utf-8?B?UElMRDNnWGdYUTZQZ2Vkemlab1U5bVBTZUh0b2YxTC92dTdFWXh0UWM4MGtV?=
 =?utf-8?B?NVNoZ0JRKzBRR3U1U29BTjlFL2RKd2lBOEVrN09uRmNHcDdvbm5KVTBMTVJB?=
 =?utf-8?B?aTYxOVVzWUVhWStGNlNTcms3SjJJVkhrUno5V2JOdjlKc1dkU3RrdDFYMjlO?=
 =?utf-8?B?ZE96YStIUm9WZHJuU21MOGtZOWJpbWpXdkliK0JreGNDcXp1TUFLdElQR1NG?=
 =?utf-8?B?YkdKRHpjU3BYL3FTUkR6bUYvTmlvTjY1ZExibHJ5SXhNRFBDS2xtK2gxMFdO?=
 =?utf-8?B?SXJ0S3doK29qZllIbEljN1AyTHo1MDN2MUxYVEZvN1JDUW8rUllxWTZZN0Fj?=
 =?utf-8?B?RnRsUGlJalVsMDJyU21PazNoVEd3cUJkVWtUeEpzcW1lOU5kUGVPMzBNOHVM?=
 =?utf-8?B?RWNXWGlHcmtYZ3pWRnFVaFFiNWhMc0s0OUxvb0lmcEhrVktIc3RCZVMwVlVU?=
 =?utf-8?B?NWNGbXd4MzRSTkt5QjZoNk55Nm9DWTRzWUcrdituY0pIVWxhcmpNRmhCblBl?=
 =?utf-8?B?c3ZPQ3NJREg4S0dZNndjYllES3lISDhkcXd5UVZpSkVhZ2pRbUJteGp1Q2NS?=
 =?utf-8?B?Mzlhekc3eVpEQW5JSFY3TGRINCtiaDdDZlpDdjk2Vi9JWWtOcVJIc3g0Ri9P?=
 =?utf-8?B?WUx5ck1maXdCdmF0eG9McWhpWkk2bEtHNVNjSllsQldwNWJMZHdXSlJkSDFn?=
 =?utf-8?B?clJCZVpoZExwU3FsaUVDYnZnSU1jNHY3eVlvVFlIUWEwbzVTMzlWM3lXcWgr?=
 =?utf-8?B?R3p3RlR5UVBzazNhNEFTSXFCMXZvcmM2d3o1M0lXWm84U0ErdER1ck8wWnFQ?=
 =?utf-8?B?N21TSFNkRDRDcnM3aXV4US9DK0ZMdFowSDRUSW9WaTUzSk91RVJBdDBMOEg0?=
 =?utf-8?B?RVJZSGxDZ2hrYnFyN04yZENqSnUxdTMzdXhMMFRmMGtyNHNqbytoRDU3emZk?=
 =?utf-8?B?QnRtUjhMMlh3RkYrTEE3VXd5cXh6dkJ3azhIZy9rVE90YnZRTmpNMjRvS3BP?=
 =?utf-8?B?Z2FWMWFnM2dtNmJmUE93R2Yvb1JMNUxsV3dJZmhMOGRhSWZWVnY1VWM0eitw?=
 =?utf-8?B?aW00cFp4TnNxcTMxM3FyNTR0VVBZV0VNT2tyd3B4ZG5CaVNNcDFLT3NUVm1G?=
 =?utf-8?B?bVlSVjFCK0VITW5xRDVZYXlLQ01wclEvL01LN2VNNm9sdjQ3c3JLUT09?=
X-Exchange-RoutingPolicyChecked: jc9u7taBwibX375NfwKGjamQDJWroc4Mw+WhQ5oPLJgCeoa+kapuuawbu6f2NNNBcBHPLqbJiyrZLWlSCyWoTcXyiPL3RmPcoXWar4R4Uh3Q5sRnBImo/avJngEMZsuoDSYTElaA1j4k8DkE6/HYkuKOU4sf5VnMJ0b9n6cVwVkkYY+Mab/NAinyxFYtQ7joemWN2G2KPwQ9KDzFtwooXp81geacCbbBSCdtH6bSQ7jmNKFmYCawbKw4REg1h6RaFlJneonW/ssYEI8kg3dA/w/PN83Lth33TbZxq099PDeQTVCvW81DChC7t6S8sd/fVZyCsoy/j4YArH1u5itiZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0074d7e-7b8a-424f-404b-08dea9cb5d2e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 10:53:24.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqULctPmA09N+qh7cnYepgpAG9ZA5i7c11P6JzursXPgma4Is/C4PzLn8SXg8wbf1fRzHmFR3Sd6dZ/wU1NHew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
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


On 5/4/2026 12:26 PM, Riana Tauro wrote:
> Move xe drm_ras registration to RAS initialization flow and keep
> hardware error initialization for processing errors reported
> via irq.
>
> Also reorder soc remapper and system controller initialization to
> early probe as ras init is dependent on both.
>
> Cc: Anoop Vijay <anoop.c.vijay@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c   | 19 +++++++++++--------
>   drivers/gpu/drm/xe/xe_hw_error.c | 13 -------------
>   drivers/gpu/drm/xe/xe_ras.c      | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h      |  1 +
>   4 files changed, 32 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..041af7ffc8bb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -962,6 +963,16 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		return err;
>   
> +	err = xe_soc_remapper_init(xe);
> +	if (err)
> +		return err;
> +
> +	err = xe_sysctrl_init(xe);
> +	if (err)
> +		return err;
> +
> +	xe_ras_init(xe);
> +
>   	/*
>   	 * Now that GT is initialized (TTM in particular),
>   	 * we can try to init display, and inherit the initial fb.
> @@ -1002,10 +1013,6 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_nvm_init(xe);
>   
> -	err = xe_soc_remapper_init(xe);
> -	if (err)
> -		return err;
> -
>   	err = xe_heci_gsc_init(xe);
>   	if (err)
>   		return err;
> @@ -1044,10 +1051,6 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> -	err = xe_sysctrl_init(xe);
> -	if (err)
> -		goto err_unregister_display;
> -
>   	err = xe_device_sysfs_init(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..c6836957dca7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -518,14 +518,6 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   	}
>   }
>   
> -static int hw_error_info_init(struct xe_device *xe)
> -{
> -	if (xe->info.platform != XE_PVC)
> -		return 0;
> -
> -	return xe_drm_ras_init(xe);
> -}
> -
>   /*
>    * Process hardware errors during boot
>    */
> @@ -552,16 +544,11 @@ static void process_hw_errors(struct xe_device *xe)
>   void xe_hw_error_init(struct xe_device *xe)
>   {
>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
> -	int ret;
>   
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
>   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>   
> -	ret = hw_error_info_init(xe);
> -	if (ret)
> -		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
> -
>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 07f6837694e7..7d2945bb819e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_drm_ras.h"
>   #include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
> @@ -258,3 +259,22 @@ int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity se
>   
>   	return ret;
>   }
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +

Needs an SRIOV_VF check here. Will add it in next rev

Riana

> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	ret = xe_drm_ras_init(xe);
> +	if (ret)
> +		drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", ret);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index bbb9d42bd128..a06fb67dc882 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -17,5 +17,6 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
>   		       u32 error_id, u32 *value);
>   int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>   			 u32 error_id);
> +void xe_ras_init(struct xe_device *xe);
>   
>   #endif
