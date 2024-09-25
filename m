Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF2CF58ED
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 13:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539010E0E3;
	Wed, 25 Sep 2024 13:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFXcMSac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C95D10E0E3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727272637; x=1758808637;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lw9w+dotPh9E+HTWf6itHK3AEzWASLT/LBjz2MjlTjk=;
 b=NFXcMSacmGAxooXpUnf1qlKJoEmoQXikAAiXiiv4QL/b8iMc4ut7RWFG
 /trqCm3I7352+TMiBoLcFEl/K+j3ybNn6bKnr0XpW3TmWehjgoOjvZXzr
 ZVIlCjGnO7FMPXzCRXuh8wAiQhq/4qQC24Hagx3c0RjpnRDi4ToVClpMY
 TGYSE6qBrooIwc67IGuROeChGaPc1zJVQk7gfI4YXtvOlfKEYCmnk2n1K
 643a0kU0TLVd1FZMNUpGL03rmV/mASpzZW9odcG3gS4PnPPrOfEnm3vij
 t/ssCPtIodqeRQK95fiNxsJ2DxWRpJEeQQihY4fZNOjYwWN8jvr7VmvPW g==;
X-CSE-ConnectionGUID: TAKOxBNFQTiBrM5tljj4iA==
X-CSE-MsgGUID: fopbRHcyRFaIreHLyiSHag==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29207195"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="29207195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 06:57:16 -0700
X-CSE-ConnectionGUID: hbay8qJITiqIyOJLqlacpw==
X-CSE-MsgGUID: cWLQdSFwTcOBXEV21hnRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71784743"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 06:57:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 06:57:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 06:57:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 06:57:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 06:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+COXCtsvkSsC/XMnaJk9HPDE/81ZwYkadZETAHxJ+UY/uCrBqMo4bM3zl2y2RbZv2b/X1URjF6SLuu+olA98tD5LgKphxkYUeghMwMcINiSQC5Uj+L9oM2h4Q3f64ZmhONOKmDw4r8URJMV11S0jUpp+1R3sdxTD9ufOkzZp84omMytm/CTHr9R82zfB/hqzRmdaqAuvn11WE6vHzsH8NrDsM49v97NBjDXSh/ugj1ddwrOVoUzENq9VFncx7QKWEMHasRqW/XFwGQLDiCUWCwAkJQ5hfD80uh0Iv+yFyAC4p/Czz5b/VekxSS/0nymUw9G84crYngxXsfj/NBUMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRnxE3HIs1LgTGY7OB+EjVnm5klvf+Iyjo+VYTLW/dw=;
 b=UgsvobU/HghSSFeKiOClCn0JyzAVmazZp8/lPqgVt0YbyeM+b3bGKEk4xokB79KGGx5Ai5Hd9NLLnsiFUZjND2APTFf69jisyVjM2WGxQnjtrSUAKn1ZTu8SUmRMM+O2Yxt2h4KnSvK5I5u+qM/oUCJQmff8ehxoqWP4k1D+Xyr3J69Kl0flt39LPzh4NjWXmiT9Px+qJaZitY7g6DyR70nzjhI+95stJvn3I3f/VaSK7BtEjCfV941x0drpfQKWIxn1oYEpIX6lBQMHmInVCm1XO9mfZrSDul9ewGimPhCctasfqQVEEWJqgW984Mxp9+pKzs745VUFd/vM3ayBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Wed, 25 Sep
 2024 13:57:13 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%7]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:57:13 +0000
Message-ID: <51f865d0-7a06-4078-836b-2d3df40a2b6a@intel.com>
Date: Wed, 25 Sep 2024 19:27:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240925122513.2455181-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20240925122513.2455181-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff0bf58-606b-41ba-ac49-08dcdd69f4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlBZY09BcWZOZGpmNGJhdjlqNGMzWGFENC9tZzBhMXhzVExXc3lCRkZvT3I2?=
 =?utf-8?B?cjBabGluODM1eEtwWGdjY1J6dXFNZm9Tek4wYzYwZzZxL0hhRUZUZGR3UDdD?=
 =?utf-8?B?MDhxUkJFbU02T05oT25ndGVlT2RoT1FwWTgxQ3hKOHlRcnNKam5vK0R4enht?=
 =?utf-8?B?OXh1T3Y2UW9XaXRjcTFpcDhqZU1OVXpZb3RTU01BVklXbkxFbGgrVzdFZ2s2?=
 =?utf-8?B?Ykd4MGplMlprTDRDS1AycUk0UDMzc3k3MzlyTHRpazZjZWU1RnlUekRHdjFG?=
 =?utf-8?B?blNiM0hLL0tHdEo1eDJ6ZWpEWUtTbmk5aVR6a1FTdVdvRU4xZUEzNC9Ya3lQ?=
 =?utf-8?B?ZDAzSjBxbkYvU0twdWxqYk9JQVpBQ25zZnBqWnBlNmY2cHhWOE9kY2o1TTJX?=
 =?utf-8?B?WnNYejlXYmF3NWsrVi9pK2M5SzRlYmhNdGZpaHhVTGc3SlVOUno2MC9FOEhL?=
 =?utf-8?B?dmpXUGNTZGpjay81NXJ5elowd3NXYWVkdlBUZ2QvaU5zc3RpOXduMVBpK296?=
 =?utf-8?B?ckp4eVhzSFVzYlVzUFJJVzE0RkdPSmhTR3ZSa1ZubGppaWxCeEdkRHJla3kv?=
 =?utf-8?B?aUgwUjRFUmhBS0R1bU5Eemt2L3RKU2hiVFpBc3VMcmdYL1JueGRmc3MvYTNt?=
 =?utf-8?B?UU04M3IzcytzODRGenBPaUhKQitoVFBBRlZGZ1dlNG1nbDVMUHNLd3djcUp2?=
 =?utf-8?B?dWhSZDd2d09Iekxza045ZVh0bnFYcm1wOFJFejZ4K0piNlVHbUcxakloMHM0?=
 =?utf-8?B?dGQ0c0JQZUtNMUFSenBxMC9ud1BJa3RMT2hZbDNINHBQc3ZEQ0tLVlZDTzBt?=
 =?utf-8?B?WlFoMGZsdkxKWG5EMmRHV2wweG9BVU5KREdkZEdHY05ZcnUybFVsLzh5OWNw?=
 =?utf-8?B?TG5tVjRNWWg5QkhRUjM4TDhUMkJLNG1wWVYrMjJKaERvWis1VVJuRnJNV0R4?=
 =?utf-8?B?NTU2RVpmRkZQeUxTa0NQTGUzQ1phSHd5WXJBandKZmJqU0ROb2RTUlVZVTVI?=
 =?utf-8?B?VEQweVY5N2drSFk4ZTVjWkdYK0xyalJ5Umlsejh6bEViU3p1RWs2UjlIQTdC?=
 =?utf-8?B?amdQckRxR0tVWGk0aVl5MHpzdVIwc05SS1ZCb0U0OUZMWm94aWVGdUpIU0NL?=
 =?utf-8?B?c25RcDVoSmJEcDlBQ2xSQzRJUEdWZkJ0c0VvbVFHVWZ3RndpNW9OdFZRLzNV?=
 =?utf-8?B?ZXVZeEZJcXhWWFFKQWE3eFZVYjNNQ3MyV3ZZWTJSMWRNVnNaMXZvb0FwOXdq?=
 =?utf-8?B?eSs3UGxXQjlvZDlaQzJYbTN4QjNsdXVCZUpGQXUwbXJZanZSVWtjOHNFd1U2?=
 =?utf-8?B?V1BWU1ppKzlYQThUZllCTW1zcEFvbjlNdnRockdXN0tLMWFjUDkvM212bllh?=
 =?utf-8?B?b0JwUXlvdnI5NVhoVkdrNHVQRTZyUlNGN2I3amYzSjRGc1AwYVFnVVFRMHIv?=
 =?utf-8?B?T1NtbEdvdmFsbTJtRmZNMklTMVAwWGZUSWU0OHRNaE5UTlFITFBiU1F3TERT?=
 =?utf-8?B?K0c1d3Z6WG1ta1M2bit6RHkzazZPNGN2UnlYVmJ1eEdxYyt1SGxwUEhCNG9R?=
 =?utf-8?B?SVhlR3dmTG9SVEhHMVR6Z05wWjB1Vmg3YmFqYWVIOVh3eUl6dE94SWtJWmli?=
 =?utf-8?B?clJvR1lQd1NaWk9FQzEvZU9VNE1DWXZwNVZoSHRIYmJnbTlFMVh4SnlmSHpW?=
 =?utf-8?B?a0VIRjhNOTJudktNVW03UzU4d2VPSlNlWkUvc1YrS3lOeGxXZDk1VkhrMElr?=
 =?utf-8?B?TUlQRzd0eXFjcGVnSUphOStFdHpQNGtyZXFzR2d5UElLWS9KOU5hRTlxbXFa?=
 =?utf-8?B?OUFVcVZmQ01RWGlWOEZaUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2EzNXBpV3ZJYmROTW1OdDFtMlhNUit1ZW84TDBNSU1PdlBQODhrZ0d4WkJR?=
 =?utf-8?B?U2FIRHlROWMyY0d6V1ZGdndDTnhIdStodUFrRE5FOG81b2N4Vkx5WlVlanVs?=
 =?utf-8?B?L3NmS09DckJlL2ZhNXAwUTQyZzZsd2tTQzNtUFVGZGtzZXp2Z1ZBNko0S3BL?=
 =?utf-8?B?K0U2ZU5zaEtxTDNlcEgyUEN4cE9uZU42eC84ZHlvaWI1Uk54dWdyQkJRU2xN?=
 =?utf-8?B?MUtoSHpmUW5xOTZxRjhoNU5NTjVZaVZBMjUrWG8xd3c4aEpzRzF5cFZMMUNH?=
 =?utf-8?B?Szk1UDdvL0xmbzhBN05WUXk0cDZvM2pTTWNVeURoOG1QNGV6T1k4YmZCK2Ja?=
 =?utf-8?B?d3JzWnhENXRMOEJIZDhQTFpkYVpYTkhsTjk3a3l3SXBYTC9WMkdzcHhpSVh6?=
 =?utf-8?B?RjVKRlZPMlhqUGE5MkExd2d2ME9IanI2ZFdJRWIrK1RScVh4VmU3dEVXckhs?=
 =?utf-8?B?cjRUZndMM0htdVIrVDFmZzRKaHV1VXhIdGgyV3RUbzZCV29BdXdBTWptb2J4?=
 =?utf-8?B?M1hCMzN4dXlxQ0gwaFoycGtzWkJjN0VramZxZnUwN1psTEQwbXpML2d1b1V3?=
 =?utf-8?B?R3dTWEk4bjN5OTNSNjNkSUViMGtZNzJ4K2FXdERRbnBNTUNrK1NFTW1MOTZN?=
 =?utf-8?B?clI2VkNCMGNTVUNJM3FZd2hidmd1VHI4c21DTVVkRnNhMGVRWEJtU1BaVW9s?=
 =?utf-8?B?RlErSlBOUlZ5QzhlQ09ZTEowdytDRkQzT0NCZS8vbGlrWjRhWFBhS1Jac1JU?=
 =?utf-8?B?RUUrQWx3cXM2RVRsTktkQlZxMDJLWkFxVWdtREV0cEcrYkRpeWxCejBTdmZs?=
 =?utf-8?B?U0pJR2haa3BtQThET2d3V1FnNEtyVzNrV1BKK2tvcVVhb2VkTmM2NjF6ZXRK?=
 =?utf-8?B?SEZLdUM1K3VmMzZXTE5yRlNBc1hSeWVudzNuRnMwMFlGYUxGL0Eza3RROXdj?=
 =?utf-8?B?Z2lldUhvenp6NFdhYXVMVVpCNEJVMHc1V09SVkU3OUQyU3liOHVwempNcGhI?=
 =?utf-8?B?QVAyenk3S25wQTJSdTdCbHVZNURoOXR6NW0xQmJ6SS8wMmJsQnNiOWlXSmxT?=
 =?utf-8?B?YkhHOVJFSFJKM3ZvV1lDci9ZY3B4N1h2VDRyeHIwSVNiNVNTSkNoMWJJY01V?=
 =?utf-8?B?VWFKUUtBZmdsSVFreEFteDlzck1GeXFLeVdRYlpFRmFCRGNDOVNKcHN4bito?=
 =?utf-8?B?V09hejlpSzFMc3dpbUdnTHVOQjRseXlRaUVYOTc2SXRRdFkvdTE0dEZveXhS?=
 =?utf-8?B?VnhTbnhORzRPRUl6c05CbkNtUXVHOFgxYWw0MjltejROcUg4dnRlaG1uVVlm?=
 =?utf-8?B?eDN5bzdzblZzZDFJOGdkSzF3WTRWS3VuR0NIcEs1dEdkdnlTbjNxaUxHUGpI?=
 =?utf-8?B?c3JPSDNvdlNldENDWS81VjYrRk9NcXBnRXZXL1IyanV5NEttMkdIc2xoWXhG?=
 =?utf-8?B?Njl6eVR5MGVGZXVFRThIdkdPWHNYNjM0SXdxaUR3REFSUTdMNzFvQUlwNTkz?=
 =?utf-8?B?QmFRWGs4M21WU1V4TTJtK1F5ZUoza3IxZEFzZWNzQWdFLzh2WTR6aEYrM1Qy?=
 =?utf-8?B?cHJYWjdHM1lCbFYwNXl1by9GRFM4MllOdWQwUHFSeFBPWUY2RlAyUERtOXM2?=
 =?utf-8?B?L3IwdWJoL3p6cFBrREE4QWdxS05scENOZVdqczROMzYxMDlldFRrL05GVWlz?=
 =?utf-8?B?WUJuYXZmK3hRQ1FYOURVaXhwbGViMW9PZlhXWGUwQkFUeElEcld5R2F2cGJ3?=
 =?utf-8?B?bzJ4bFBpRXdXV3ZpaDUwTlR3RGU5cXlmYjNkaVBoTExVWjB0bm5mbHBwNHFv?=
 =?utf-8?B?eDNXUDBpT2o3ZVk2aTM4R1pCQjlzWmgxNDByU2xEZ2I4di9TM2tUdHhlNGlZ?=
 =?utf-8?B?NVQxdE5MeldBb1d1MDV3TUFlZ2tiRkNkcENUQmRXZVpNUndKU1VYSUZUazV2?=
 =?utf-8?B?VSt0VitoWElmRFhTcE1DKy9VRVNvdGlCT0hrNmgrcVpjYjk4WFZkbURFREhP?=
 =?utf-8?B?bUJOQjJXenNVVWhYNXdDbkRMSjNnSjdRLzNWdEVISDJneTR4Wlg0SjR6MzZ0?=
 =?utf-8?B?cy8xUnpBK0Q1STdWTjF4MFozK0tOOFdET0tqcEFUa0RrVVllQ1lLemRUWDhJ?=
 =?utf-8?B?b05yd1BPbWtxcThRNWlkSGFqQ0MxRTBGTWp3Q1dPSnpVRkJCUUNoUlpkRS83?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff0bf58-606b-41ba-ac49-08dcdd69f4ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:57:13.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ka7dTXsUcsVIgLzNrXma9XmB7HmCP1fg0zGPY3jYk97CRGAkT58qdhIXXS/y6w+Plxh6s7T2XNW4Ds/BLGtepuvOhUsAX5XFr0TuuKyjHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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


On 25-09-2024 17:55, Nemesa Garg wrote:
> Disable the support for odd x pan for NV12 format as underrun
> issue is seen.
>
> WA: 16024459452

Just some additional nitpicks,

- We should mention about the even xsize in commit message as well I guess.

- We usually refer to the WA lineage. In the comment below, you have 
added the correct lineage "16023981245", let us add the same here in 
commit message as well.

>
> v2: Replace HSD with WA in commit message [Suraj]
>      Modified the condition for handling odd panning
>
> v3: Simplified the condition for checking hsub
>      Using older framework for wa as rev1[Jani]
>
> v4: Modify the condition for hsub [Sai Teja]
>      Initialize hsub in else path [Dan]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_atomic_plane.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> index e979786aa5cf..dfe795b8e917 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> @@ -1029,8 +1029,16 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
>   		 * This allows NV12 and P0xx formats to have odd size and/or odd
>   		 * source coordinates on DISPLAY_VER(i915) >= 20
>   		 */
> -		hsub = 1;
>   		vsub = 1;
> +		/*
> +		 * Wa_16023981245 for display version 20.
> +		 * Do not support odd x-panning for even xsize for NV12.
> +		 */
> +		if (IS_LUNARLAKE(i915) && fb->format->format == DRM_FORMAT_NV12
> +		    && src_w % 2 == 0)
> +			return -EINVAL;
> +
> +		hsub = 1;
>   	} else {
>   		hsub = fb->format->hsub;
>   		vsub = fb->format->vsub;
