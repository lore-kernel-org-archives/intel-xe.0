Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C57BC369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 10:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1950D10E8BB;
	Wed, 16 Apr 2025 10:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsKm5pHV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086D210E8BB
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744798040; x=1776334040;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=46KFRBZubMeBpnvOzs+5r+R6pbKCuxY2XHn5epsFWUE=;
 b=fsKm5pHVAINzlm+2/KsogSdk0SVYZmRcbcPKfDJCvAiNerkBE6BhgVFc
 ds1NNTNa7dRy4dM4PReOCEkZUvIoH7DZ+GQjPHgwFKY9SwqNvKKogzHAP
 H3MRW+4VYMS7RmioUiX2lHpw0CYhj6kyK8yR6rjRhS8WkZmILweb7ltr0
 i8KgD/hQmPw6fCl2Tlx32L8qy15FF1VOiFIoG/HNFe5U1QC2yHiS/KkRk
 LNC+6lB11yYn2wRMuqlUIOam8H/QJBEiWFgAkmbPGUnuATJStEwypOxpA
 eABYXM8/nfmxDxW6lm7vstsOSrENj17DI5M/jYDh+r76HfzlhWrQmFtbA w==;
X-CSE-ConnectionGUID: Uu5SfCFgS7yOE+t3a08XKg==
X-CSE-MsgGUID: J7hns7jcSDWGDrfVkPjDpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46353161"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46353161"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:07:19 -0700
X-CSE-ConnectionGUID: RFPp3BoEQPu7iD02j9T5jw==
X-CSE-MsgGUID: OZREOsK2SryRBCOvOJ8F6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="135216367"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:07:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 03:07:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 03:07:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 03:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOIhkpGc8E2KOz294TOI0bA8wNnxxfWTLhpwJAGECOk+0cyVtsqpemafTZPsxZ39apeAK7lL4iqKA+KvnbOn9gVYGeW6bhXkRIipqHyBoOlVVgUS4AMtYRiXeo7P9IQkox9MqSoOAnbGJZV6Mr5VVQeEgpuzIP+334CbaPiRz9onlipe7N7YuvzN7BBDk2hgmtZXxwoh2CZCsn60WtE+7aXJ7E04jLwTfGfapSh324yIcqdNfZGpYZqtAlSebS+L1mNOelPTNxsLX82VOLpES8z57o2oxuk6dgWe9XJXOcPrzPn5PBT8r8QIGB5hYjk+m56Ea8uQHqdXBS+B+/ct8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTXEQCDezALncczMJpm2oWjI/FMQnRhhpvPlV22njnU=;
 b=Dfhut+w7dK7nrAz77kgeKQqiqg1dEZRSJRqeURgj4pJta8ZOMUvlaTgKuPJHAarP27gBt2hIGv/iHx0FCwyBjwKRlJ15NLQunysYRPxgZO+r4UcR/An7s3VngWtTA3dRyUY+pvLwRu4pN30+6AXXm7kGqEiR9qlT3uVSeAovzQPf8joYHE0CXPqs0R5L2ITq2ZpJvfxbTFNKYxtmunaK6UtIYxi24lWc1tkGiDlGBTEWNZYDBZ7ZV0wYvW/JCng2+r4w/RpIsq8rtjKv2b+RkdFEH/H/pX80L4iAPv9G3CeL5pIAjPwJMcYAioEfsAVCACyqP7b0klvCNwxP29DGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 10:07:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 10:07:03 +0000
Message-ID: <d98a6b4b-1b14-4dbc-8833-e39c846a3b12@intel.com>
Date: Wed, 16 Apr 2025 15:36:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-3-raag.jadav@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250403174742.1294227-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f48bcf-9e55-48ab-2a7a-08dd7cce6f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkZlWWVEYWpOUU9Vd3Z2dW1Yc2ZRcUhPYXNBS0tJYXFKWnEwcXVCb3FGYmc1?=
 =?utf-8?B?UHBqT1orQURIaGVkTXRzeXRSTGVLN1Z1RXhYeXNFbURJN3RGUVh6aHpuT2M1?=
 =?utf-8?B?eXdLWDBwODVmb1RrRlZSamlFcEZuc2hRbWp2eGh0aEpQeGc4UkxucGp4ZjBa?=
 =?utf-8?B?K0NYUk81YVl1aC9QS2hueUN4MkxqSVdCaURSRUdYRXlrdHJhUFdReG5GQ1Q0?=
 =?utf-8?B?NVU1L2dZSWtVNlM2UkVhemloUForSTd2TzltaTFTK051eXlsMjFkOHBjQStu?=
 =?utf-8?B?dDJEM1RRdWhJTEJYVHNsWlVJcWpOa3E2L2l2Nm8yNDkyUHdnbnhDaTdjeThR?=
 =?utf-8?B?MEtnaEZkZCtmWlJZS3kyeFJOQXljbXpTTmorZWxXL1JLbGNOcEZsaHZhM0Zq?=
 =?utf-8?B?a2V0LzExeFJ6M0VFSnJEV25oMXh0TTZKOU4xMzhLcVJVRWh2aHRyTEY1MEho?=
 =?utf-8?B?bVJITHZpNXQ2RlY3OHk1U3hoR0c3YzV6bEg5Vy9jaVBnanA2NDZOVkxEdGlv?=
 =?utf-8?B?MjNLeE92OEZJOXd5QmpFWXNHc0ZmWkt0TXhKVnBxbjdjd08vSmErc3NMTnIy?=
 =?utf-8?B?bzRMK1dOMHArRnpINFNocEJPdHpKaUl3SjRnVE1ETTBKcHpLd3VXYW12OG10?=
 =?utf-8?B?dFRNK3ZjN1NTVTJERmFwWU9qUE1yb1ZjdlZEeVF2ZWt6NXZyV0FJZ3RrVW1K?=
 =?utf-8?B?bXhkem41WElLbGYzY1k1S2hqWEdzZ0NOSVQrZUg4YWVGVmVBbVlYcitiMytW?=
 =?utf-8?B?NHNZWFRQVjlSSFFMNWFtVTloU0RqM0M3ZURiTU1EeWRpTnQ5ckZocGdKS08y?=
 =?utf-8?B?dkEvK25PZUErM3A1RW5ydXFBSEZLTlorMVVTaXpFelFwZDNsTy8wc2F0cjN4?=
 =?utf-8?B?NlFvbEpkTk40ZUNQZ2h6NXR2VTBXamRGR2hHazhlaXFVOVhCMmh2cDZzYjhw?=
 =?utf-8?B?dTV1cUdjQVRJZFZtTUtTYTJZWFF2QnN2NTFMY0VQR1V3QnVYM2J5RWFHeE1O?=
 =?utf-8?B?QWVhQk5tMzlGN3ZCMG9RZ21vR3pHWS9JMUFhY3l1ZitpY1NTUlhoazBMWXI0?=
 =?utf-8?B?dWpVbHJqR3pZeVdTaGZTcFpLMm0wczV2Y0I5NjhXcnhhbXlHeDJ1MW94UnJM?=
 =?utf-8?B?eTFvSG1BVU1jbyt0b1o0OGZyeTl5OHVXdzRScjJYRGtpSElXUi9Lb0lBK3p5?=
 =?utf-8?B?WWF6ZWdWV3YzMG5YVXZPdXBMZkFBZ0ZjdVp5UzZvUjVpRUtPbGZyMTY4cDMv?=
 =?utf-8?B?L2twN3VHNTdZS0JQODJBZnVDK25hbXoyZjdqK2NtSlU4OURJdGx4MHhxbTlh?=
 =?utf-8?B?QlVxL3d5eEh1ZytwWTlMdFJVZjZJZTNRRmdSM24zb05lb05IK2FqTDE0Ylk2?=
 =?utf-8?B?ZWJjYmZ1OXpzRzh6Smg0TmlWdmhONzBML05mMEhpSXJsS25oUVBCc1cwM1Vw?=
 =?utf-8?B?eWFmM243eG94UnhUVW5pZDhUUUhOOVd1SjdsZTdsamlFMnFNY1RpT2JRNElZ?=
 =?utf-8?B?SDRMVWFCWnF5UG1CU255M2U5MlNuUmhTV1ZHUHFYR3pONnVSaTFYQUVobGFk?=
 =?utf-8?B?RWhQYTZRaGZFQ1hZT2xHeEwycWhUbmZ5QnEvWWRrRHhMTVNGR09meldGamlY?=
 =?utf-8?B?MGVZSDNFUkluNVBtNC9yTkdORGR2Sjlob3c0NFBCdWlkaWhPTnVDdHZjZjZJ?=
 =?utf-8?B?bHlDUG5iU0NpcURDZ1V5OFlPajFlWUF2eGlOVUEwWWNNdW1nY1dpNkE2YzJ4?=
 =?utf-8?B?a2hoK29YcWxIRDRzMTlWZ0NONFBQbE9XQ1JtbTJFNFcrTThmQS90V1NwdmFL?=
 =?utf-8?B?MmN6TWs3L3BLZlJxdGNnYjhteStMOFhXcndPSTRBNVBudjhyWlU3ZHg0Y0J3?=
 =?utf-8?B?QStBWHZBL2VWSWlLM1A1ejc3TEZObFhYZnc1enhHbkNxL3FUWDRoekNtY0h4?=
 =?utf-8?Q?hHYMvE2DHFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1czR08xaS90OTVOUFp3QnhPc2RGaDVndmh3WDAxcm9lMTR0RGhKY0FyZlpj?=
 =?utf-8?B?SHJIdldHaE9hWjBqc1BHTlVma3pRaEVTOHlZVlEyQUxoODZ1NHhEKzR1eDlQ?=
 =?utf-8?B?Sm1jOWZwR3diLzdVeWI2NUZsQ1pXYVlDRnBZeEY2NlphcytkNXFBQTRSdms4?=
 =?utf-8?B?YWt0dENjRVl4L3J4Q2QvNjJOdGV5WlZrNmZGZnhkeGdlOGcvektiYTZQZkl4?=
 =?utf-8?B?bi9JREJnU0F3SUpaZk9LVy8rQXFyTDAyK2IvOFBabnA5clZrb20yN2FBbGdE?=
 =?utf-8?B?bHBvOXZpSFpSTGgxcWxhd0tocDVhN1dUbDRFQVV0WkdUK1l0TlE5em80RVM3?=
 =?utf-8?B?cW1MeUcrcEVBZTNPczZyZ2pQSWUrRktWSG81WE1aWGU1TVZZc1BCL25YNGFI?=
 =?utf-8?B?QmJzeXduRGwxamloR2JsYmc0Z3haaUR5bko5a205VE5UQzhCYWw4SGIrYVhr?=
 =?utf-8?B?R0dQM0tWZXYyYUE5SkI5MW1iQ2dWTjcxVWdwK1VpZS9MZy9qNWxrMk1Yc2pQ?=
 =?utf-8?B?eFRxM1FwZCtETzJsOTFFZkU0c3ZKZUNaL0dSdHhzbEl0TVhkcWNueFBIZTd6?=
 =?utf-8?B?bTMxRnpuQXF4eHplTWVLZEMwNjQxd2o0dXZkZXVWOEU0UXhkbVgrZ0JUWlBJ?=
 =?utf-8?B?N0tsSExyZ0lWS1V2OUU4QmV6eHZFOXZmS0ZQVDdES2pWbjlpbG5mTm9kRDcw?=
 =?utf-8?B?TGVOZ2JGRTFnOXhRbkhLbWV4SXBBaUJobTEvbFp6YkdURnV2cUJOekRxYnFG?=
 =?utf-8?B?aDZINE1Mb0d6S3BPcE9IK0xpeWNMN29Pd0FZak1WeVhXc3RRMTMwcDBDeXQy?=
 =?utf-8?B?M0VGaGJablRycFN5N29GeE10V2I3L2lNU0E1dlh5UTJzODdXdkxhaUhHTUJk?=
 =?utf-8?B?bnRURk5EbWFSeXlBYmVhM05YdkI4b090dTJrTEhPQlVCUnhxU3JCSkhMVVpq?=
 =?utf-8?B?SGpyV2k4YzJUU3E1WHJwYjk5WW5mSUliT1dSbHQ2YzRmZCtUb1pCQUtnalNm?=
 =?utf-8?B?ZHRwRDF0bHE2bFFFM0s5ZkZKNEk3d0R5enczZUpkWStTcE9ZajZGVkE1cStM?=
 =?utf-8?B?V3FVd05kZkx2T1lNTnh3MDJCbVpRUEVQVG40MC9RK2JMOElncy9pY2pBa0Jn?=
 =?utf-8?B?WXdCYjJ2NTdEdG12dW8wNXdxK1lHWjZlbUk4T0UwYXlvbTlBNTRsdnZUbDkr?=
 =?utf-8?B?dkQ3SSt6eGtLV3NEUUpLMDFKeWZMcEgxUzlxYzRWNWl0M2FMWEFVd0F1eDFW?=
 =?utf-8?B?QitZcWc1cVVFbHlCSnRLbXZxTmlQR1FGa3Y5dHFUOUs4bndweVQzdTBDQk8w?=
 =?utf-8?B?NzY5VmJGdHk2NmtDNGduQWFOOW51V2oxQXA5Zmh6djFsbTNtQ3BFQXlFVDNN?=
 =?utf-8?B?SzY0RFN1MWp2ajFQYTU0UXhRZjF3ekFLaHZjRy9oNzk5UXF6RlRXbDFoMnJI?=
 =?utf-8?B?clJHR2hqOVZBR0NGeXFzWVo1UzVXY3h5TkhUdVdVTkRPSEl0WDh6WDhXM0Rm?=
 =?utf-8?B?NEFZZXNoVW11ZEZ0UWJFVGpXZlJzOEtaUzN6MVRLVGhaY21TY0FRV2Uybzhz?=
 =?utf-8?B?RGlDWTNaNjQ0L1JzcWRPcldBK1hXNWluWVQ3ejEzcWZXQzJRNy8rSCt1bzZV?=
 =?utf-8?B?emtjWU9IN1lQOGpUYU5sRkptalJOVXNpanhLTEhJYTB4TjEyU0VPem0xY3Ny?=
 =?utf-8?B?Um40Vjl1U0dLQUlaaFJxQjNucmR1MGhkV3hDNDhYbzRIa2R6c0FmMnJhNEFV?=
 =?utf-8?B?MnovZlhwWFV6L0lZOTBaWk9jWE1wazBMK1duY1Rmdmd2anlEWkkrc2pNdVhV?=
 =?utf-8?B?aGNTWGtKbnRmTG9GYkpyM2szZ2NMQ0crLzRMeVhUNXo5TlgrOWsyaCtBdk1k?=
 =?utf-8?B?elUycnNmbUFBTDdnY0EwT2tZTDg2VFZyRmY4ek1FclRrUW1oMXpPS29vTmVE?=
 =?utf-8?B?dmpuN0dYUG8rdkRzK3FvSUtUQ1BvbHljb2dERjZRVWpaVmQ5bVgyZnJnYWl0?=
 =?utf-8?B?N2JBaE8ybkpJMVNRYk5zMUIvZDc1QzNZMnhNZkhLRDdNYlVGbjBQa21hMlVY?=
 =?utf-8?B?WDFDZ0VsekNId1ZadFdWbDNIZy9FTzdaelhhY1U1QmFOc1dIakxVUEJ2YzZM?=
 =?utf-8?Q?GTXHaT8U2P/n0F7rJYLr3w8b+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f48bcf-9e55-48ab-2a7a-08dd7cce6f28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:07:03.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2H3t7AzzF9gKNosMyUSLwWuzUQG09Fwll//7kzWPuor0TnPtRbY6lCQUJjQjfUztWor7gGQGl8Q0s11rgcXCTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9201
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

Hi Raag

On 4/3/2025 11:17 PM, Raag Jadav wrote:
> Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h    |  5 ++
>   2 files changed, 91 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index d4c73acea1cf..4e6175907832 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -11,6 +11,9 @@
>   
>   #include "xe_device.h"
>   #include "xe_device_sysfs.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
>   #include "xe_pm.h"
>   
>   /**
> @@ -63,12 +66,85 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   static DEVICE_ATTR_RW(vram_d3cold_threshold);
>   
> +/**
> + * DOC: PCIe Gen5 Update Limitations
> + *
> + * Default link speed of discrete GPUs is determined by FIT parameters stored
> + * in their flash memory, which are subject to override through user initiated
> + * firmware updates. It has been observed that devices configured with PCIe
> + * Gen5 as their default speed can come across link quality issues due to host
> + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> + * faced with unstable link at Gen5. The users are required to ensure that the
> + * device is capable of auto-downspeeding to PCIe Gen4 link before pushing the
> + * image with Gen5 as default configuration. This can be done by reading
> + * ``pcie_gen4_downspeed_capable`` sysfs entry, which will denote PCIe Gen4
> + * downspeed capability of the device with boolean output value of ``0`` or
> + * ``1``, meaning `incapable` or `capable` respectively.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
> + *
> + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
> + * instability due to host or motherboard limitations can result in driver not
> + * being able to successfully bind to the device, making further firmware
> + * updates impossible with RMA being the only last resort.
> + *
> + * Link downspeed status of PCIe Gen4 downspeed capable devices is available
> + * through ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value
> + * of ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
> + * link training (which is the optimal scenario) and ``1`` means the device has
> + * auto-downsped to PCIe Gen4 due to unstable Gen5 link.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
Why downspeed? Shouldn't it be downgrade?> + */
> +
> +static ssize_t
> +pcie_gen4_downspeed_capable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 cap, val;
> +
> +	xe_pm_runtime_get(xe);
> +	val = xe_mmio_read32(xe_root_tile_mmio(xe), BMG_PCIE4_CAP);
> +	xe_pm_runtime_put(xe);
> +
> +	cap = REG_FIELD_GET(PCIE4_DOWNSPEED, val);
> +	return sysfs_emit(buf, "%u\n", cap == DOWNSPEED_CAPABLE ? true : false);
> +}
> +static DEVICE_ATTR_RO(pcie_gen4_downspeed_capable);
> +
> +static ssize_t
> +pcie_gen4_downspeed_status_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	u32 val;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_pcode_read(xe_device_get_root_tile(xe), PCODE_MBOX(DGFX_PCODE_STATUS,
> +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);
indentation> +	xe_pm_runtime_put(xe);
> +
> +	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_PCIE4_DOWNSPEED_STATUS, val));
> +}
> +static DEVICE_ATTR_RO(pcie_gen4_downspeed_status);
> +
>   static void xe_device_sysfs_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
>   	if (xe->d3cold.capable)
>   		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> +
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
> +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
> +	}
>   }
>   
>   int xe_device_sysfs_init(struct xe_device *xe)
> @@ -82,5 +158,15 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   			return ret;
>   	}
>   
> +	if (xe->info.platform == XE_BATTLEMAGE) {
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_capable.attr);
> +		if (ret)
> +			return ret;
> +
> +		ret = sysfs_create_file(&dev->kobj, &dev_attr_pcie_gen4_downspeed_status.attr);
> +		if (ret)
> +			return ret;
> +	}
This should be create_files. If second one fails, none of the other 
files are removed.> +
>   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index e622ae17f08d..1ea6b2a586ae 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -34,6 +34,7 @@
>   #define   DGFX_PCODE_STATUS		0x7E
>   #define     DGFX_GET_INIT_STATUS	0x0
>   #define     DGFX_INIT_STATUS_COMPLETE	0x1
> +#define     DGFX_PCIE4_DOWNSPEED_STATUS	REG_BIT(31)PCIE_GEN4

Thanks
Riana>
>   #define   PCODE_POWER_SETUP			0x7C
>   #define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> @@ -66,6 +67,10 @@
>   /* Auxiliary info bits */
>   #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>   
> +#define BMG_PCIE4_CAP			XE_REG(0x138340)
> +#define   PCIE4_DOWNSPEED		REG_GENMASK(1, 0)
> +#define      DOWNSPEED_CAPABLE		2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;

