Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436BCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 22:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6E310E169;
	Mon,  6 Oct 2025 22:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8BM4pF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A1E10E169
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 22:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759789272; x=1791325272;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vLxioQhigBLxlWCNjsXApnm608rWq5CJQSPU180XqSI=;
 b=M8BM4pF1N24fHsn4Tgj1Z7B6zzJXGzJUsVv0RS0sy2BS8ogQsW5Fv3ly
 iYic/MzM3Id9sVwKxcFEP+te9KlIQU7YMdwh/SYzMJYO52jE9JeiugLJw
 GWsuJr5MLGlkbXyCeSS/siHu4R8P/4eaeVn/1f2kR4xFzMMi42DTREmEs
 uqzSEsGAnWfo7i4q55OgafynJQ/Bgf46ManAzmlqyXY9ffSYwUr0/ljGi
 IJEoKLmRJc3UZWL9UgV7ylVfIXJhWD2jiBNRZVS5gSRx+b9eQSuP0VwqJ
 4/cweEg+p0K+6ZmimDS0NVAbKAvAzGZf2EKCQmKxw46rEZU3fVLa7sHCs A==;
X-CSE-ConnectionGUID: a7HBU5v4RlemwZe5U/2nHQ==
X-CSE-MsgGUID: HdjxD4P5QayTLp8Zp3ceIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61179578"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61179578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:21:11 -0700
X-CSE-ConnectionGUID: 9t6TYQ48RXSjFKfCPeAi4g==
X-CSE-MsgGUID: zghheDJZQISMx5GQEnXynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179259900"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:21:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:21:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 15:21:11 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWz1EamHZytAX8gl0QFbOTumW1TAAFLLra8WiCM1vK5AGvhG/lhYZli5HOPVHScrvtOtl3UYL1KePIwdriBaVSka9ljWIVRqrK2SUmPmr8SWzUCJBCUcFw5enlXUoWUxarhkqwz4PMoYobRDkjQrj+2c/t6g/9krqwY1XIz3r3inLsCubT5ctLAebdsPJfRElRS+YfdIntvLYc+xM30m9kg3f9Lgx8OGYdxeSmtr8lYtm2ZHlFdbXvzs8hvQ2wIzO3OMf5c6ZcxfNlpA1quEhPpAnA4GOpZaw1LAckXrwwlYEbOBbseUNK8YGAM/IsrssUiZucjs4ILIBG4BVEudjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4+S2sNuNJhgRgzAjOq1DpIvblpCqOs1tz+D0WCKd6k=;
 b=TjlEBGDLwej0NNI/81rmO8pvSTYAynCcw9il44h7XxvqyxJbWOl1L8D30ZGUPHGCsdm7iKiBwxfBawSvxIy8+ybwuX7CB/qQ9WTKptoZf3OV830eKPZwYOXBtOfTsSZrmafNsEBX8HcXXOsYonpZfP/uNp7URNv6vTNOdMuvUbrOo9vGxffT7j4LQS6qAU0WSU1NS3Ql7ZuxlBKMxa1iW8+MKh3YQJBB6tMewp+LY1b82YqquASHw8rEmnm11rPewaW5n+lYCYTS4p74axaulwxUQjkRiElW94F1RnzUIoPPUAnI/B+ixBZOicTbuZp2SSRw9e8TcTOQZ06/Bp4oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:21:05 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 22:21:05 +0000
Message-ID: <35b47115-9a2c-4ec0-9b64-6a9de165880b@intel.com>
Date: Tue, 7 Oct 2025 00:21:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/30] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-17-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251006111038.2234860-17-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0308.eurprd07.prod.outlook.com
 (2603:10a6:800:130::36) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 9736f1f4-32f2-4b65-bd72-08de0526a417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0xTejNDTWVMb0J2NkwyZThUSGQ4dHlzcWJScW1VVmpHYkFmbmU5SE9lMzRO?=
 =?utf-8?B?Q2hHYlA4VExWVmJyUWF5YlRJNHppb0V4R3lmL3JkNXpxZFRUNGZmOWp5M1Nn?=
 =?utf-8?B?dGdlZlVLazlNSVNhcFdMVkJ1N3kzb1c4Tm9DM0xHeHdRbG42dEFLQ0doNlQw?=
 =?utf-8?B?SFBxN1NPRDdYR29NMmI4emJya0g3Zk1MZVpKWGt3NjAweHBBM2Jqek83WlpS?=
 =?utf-8?B?S2tmbmYyOSthdlFMSXNaWVJ4Yzd1OFF3Wmc1NUtDdUtTYWRqY3RtZUFTL1Jm?=
 =?utf-8?B?WHRZZGI2OXRyVHdaZW1oR2wycm4xSU1HcmJidmgrOEpEa0RibUxHcERzR3dM?=
 =?utf-8?B?eTJZSmVNM1dvMUJhYXhkd3hGcnd3MVYzaVJ1Z00xRlptbEdxK2FpU2pxN0lP?=
 =?utf-8?B?L2hMRGVXTTRITlV1ellsSldJZlg0UDdXOWFyT2Q3NG1MV3dNMkwvWkNCVWJR?=
 =?utf-8?B?TmowbXNHUXg1bjJtdmczYitCSGJhRWRuUWw5SlNHVFlLVldGdHpLVXptMUFV?=
 =?utf-8?B?Rm1SempXV0JvY05VWExCeEh1My93K01WY3FCZnRkdDRhVFgydzZMQks0MjVW?=
 =?utf-8?B?YWgzdG05NG5DOTNGVk1XamtRdUpCbzRmOGFvZ3dzQjJ0V0srY3Z6Z0VkWDJB?=
 =?utf-8?B?VXo0RGdMemJ6TDYvQ2xnb0pyT1YvOU5FOGlRTkE3VitwNGFSOEtkSTNKdjA2?=
 =?utf-8?B?bmR6S3pCWmF0MXhzRytuWjRyVG9xVEVDWkptSURnNGxZbVFNSG0wcUNlanlH?=
 =?utf-8?B?eUpvVE9vYVJUdFpHaWtvZGwvR0s5S0s5d1RlMmpuM2lzVmNnZ1QybjEyWTVK?=
 =?utf-8?B?WTM0cUtTYnkrc2txYmQ5cmxUVGl6VjNaT2NvNExQTVVSV1JkcW13aC9vK0FK?=
 =?utf-8?B?T3BrZnBJekY3OFd6QVlxNDM4OHVSOFdySUZzL0k4MTlJZDVoNW8wVE45Kzdp?=
 =?utf-8?B?SC9zdHRsNDFLell1OUJLamduWGx0NTA5bkZlS3h2V0cvOGRDR2JWcHRrN1Q1?=
 =?utf-8?B?SDlSQWZnbWxsZTR1ZTNMeTJpNml3WkloditRTW84Zm5yVFRuT1B6eTlCYlp5?=
 =?utf-8?B?NWM5THoyWm5ycWM3Ukc0VzFsSVlpSG1vcGt3YlNmMmt0NnJnSXJBU3BTamN2?=
 =?utf-8?B?cFIvR2wydDhxWVBnK2ZOM3BLcmRVN2J4WTN1OVlQdWJ0NkpIaUxwVDF0SmFW?=
 =?utf-8?B?UHYvelFkbzRLSjdvUlVpNno1M3lONEpwcURWQmRBMUlONTJzSmtUVzJ4NEtU?=
 =?utf-8?B?ZTJiRVAyR0FTTHRhN3QxMzFBQlFJa3ZNUERLSFBLSGh4MVB5a0tVVmExbjZ2?=
 =?utf-8?B?TU9lWHBpWkF3cXpkNGhINHNxVjladUxSZHdweEVVQTE0c3lxd2thbktQR05E?=
 =?utf-8?B?cUlZdkJ1dU1ldFBoU1R6Zk94Z2tJeXJhN2JHMTBSNGhGdmI0ZjQ4WlMxY0Y1?=
 =?utf-8?B?VWV5TVkxd1lhRlZVcFdYby9NcXBMdFhQZVl0WUdQblUrZ29KMStaUW85aHVH?=
 =?utf-8?B?RzNMdWZGcnNZYW03S3g1OE4yQ0sxNHN0UlFSQTg5M3VvSEZEaG9WOUtwQ0RL?=
 =?utf-8?B?YUtIZzFoL1lWVVdsZ0R3bU9HTHk1ZGU2bmN2bUh0NG5XK3pLUGVjcFNHUGZs?=
 =?utf-8?B?aUsrZUlFNGtZMURnTTExTHVnbUw4N1RYazFMWTZIdFFMblZaWW83MkxRM3ZL?=
 =?utf-8?B?WjhsZEpuQmlSOEJBOFBvL1FGSEt1ZlYwTE5GZkhPUXgvZVlqRCtHTks2OEdJ?=
 =?utf-8?B?ZG5mODdGMGdVSllJZmhzaFA0UHgzcUpZYUtNaFFOdHVwckQ4WUNBaGdQYXJL?=
 =?utf-8?B?bXVKdFVLOGdEZGh6TktRVWNYRmJ3eklMZUMydkZTRjk4QnVMR1kxdkkvNXFC?=
 =?utf-8?B?Zm9Sa3psVndVdnZEUDd0STZUbjg2eHkrMXpvSm1CRjYvdDEwVERzZ05FMjN1?=
 =?utf-8?Q?S6igUL9k2+BosI8q1oo1C4Sg6/IpTxQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTZFTFV5aHgxdTB0cUkybWkzK3o0bjRHNG1GeUw1eXpCTGg0bWZ1cndBSnli?=
 =?utf-8?B?OUtNWnhKRkIxcG84K05IK2tGYWhoTjd6bVhEczFqL0crdnJhdFVSSDJVWllr?=
 =?utf-8?B?MjBZb25HK3M1MHE0bHkzaENKU2ZlQzI4UmpCa1g0V1FPai9YSzg3R0oycjFu?=
 =?utf-8?B?VmFKYVdNYWEwUzA0TFVaSDE1MTdZYzhxeDdNRFlmRHo4cGplSjRiRVN1WXNx?=
 =?utf-8?B?MHRTL3ZJSjJJNEdPb3Fack9TM0VlRG95dWw5UVFFS1RWRkxya2xBekV6cVR1?=
 =?utf-8?B?VHJDTVB0bVpORzFXNkprdVovM1Bvbkd0bW9lVnovSDFkMFJOaFVtVk5hUmMy?=
 =?utf-8?B?NG5rcFIzOS9HWDg2SU1wMWZKemw5a0xoZlJ5cFhtenhQU1VLQlNkSCtRMG1B?=
 =?utf-8?B?VUN5akFNRzFNU1NGRVJKSFFCbDZwbWluUGwvOStQbkIvZVZwQVlqWWZTNGND?=
 =?utf-8?B?d1Nsd3poczlHK3MwSFF4ZDJUQUJrOE1hcXhsaWQzeW04T0VxdVZvUG9zNlpR?=
 =?utf-8?B?ZGxpamdqV3Zqc3B5d25BS09iWi9Jd1RKUDZoOGtnWVVUSTBNQVduUnNuL25X?=
 =?utf-8?B?c1NHdThaKzNOc2N3b1lpa25ndVlWaHVzRTZIQXlBVytHazg5amVNZHpJdkZG?=
 =?utf-8?B?ZWxKYmlNSDYrcFZJdnEreW55SFZ2SFFkZmJsK3NrREtxeE9reEVoM1NsUWhu?=
 =?utf-8?B?Y3NQYktnWVJBUjNxZWJNTzNDa1NoMEZTTlozbmRtdG1KNTNoYmJ2VFFPNC91?=
 =?utf-8?B?TVlNNXIzV1p0MTJwdTNFRW1TYm05VTZIbk1GVVRFaUlnUGo0TEVMMkdCSDd4?=
 =?utf-8?B?OFNOaWhVd204dUwxTUJnNlRBRmQ4ZEhyL0JNTCtYV3ZCNWl3YklyUndCaTVa?=
 =?utf-8?B?ZzlFZVlOZnRPa2ZWSkJGSnlDaC9PSVA3aVRzRDhteUZtS090UGhVWkF0K0hV?=
 =?utf-8?B?dVF1NFd2dWtvTlZUQzZwOE5SMzd5Ky93V09RVkdFMExra3JRTzlUWlQrcUl2?=
 =?utf-8?B?RUJyTVYydkhvTURkQUMwclA0Z05iL0k3OGJTZXhOSWdielJOOHV4Tkgvemhi?=
 =?utf-8?B?OE5LOVZJS2swbTJ5ZkJZcnI5UGhud3lBS1JMN2tsSHpJUXZneUlLMExUdFUv?=
 =?utf-8?B?eXRzSzA4QjJSNlpnQVVReGsvQVNha2RpbEl1M0F0S2RLZE1aUEkraTM4N29S?=
 =?utf-8?B?NVdHUnpBODJNeisxU0pCVy9kZ1VKbUNDRFFHVThQL1dQN3BjZlVhVnVNTUY5?=
 =?utf-8?B?WFVMWXdvTW9BNzJQVzZCSVZzTnNJbCtYN0wra2s1K1JqY3F1T3F6QVRZTFdh?=
 =?utf-8?B?NWNoZGtiY3lwUzdGSENSZVhJd29uanJFK2VtbEQvZmRKYUppd05BWWJoZzJX?=
 =?utf-8?B?TUxReDIzaTdUR2l0SkpJTG1CTXlhV25GQnJLeUNGRFlmbHdqQU4wUk8vOThM?=
 =?utf-8?B?VkM3WjM3UStKc1N2Q1Zwek1oQnRCTnN5ejhuYmdtY3RIclpGVWRBNWVFbUNO?=
 =?utf-8?B?RER1THViVWdHTktSZzQ0bENLRG4zcW5JRmtrSkdXY1hmZjZHajJxSCtDRU1n?=
 =?utf-8?B?RG5NWVIvdW8rQkFieEN0KzNTYktxV2pjbTR6QjVPdWVmeFhtWGlpM3VaVjUv?=
 =?utf-8?B?TVYraDFDVVM1Yk5aWFQrQS9HRUlOaXZZbllMV2Nqa0owZHU0VHJ5YTB3cTBH?=
 =?utf-8?B?Q05mRXp4cDJOMTdMb1NFNG9LeFRuWXFLdXJuUkpyM0Vlbkl6TlU3anRTQ0JU?=
 =?utf-8?B?UEI5ZkNhYkZSWVhJcjg5WXlBeEhudTJ6RUk4SXZ2NHVwVjNxTURocGNxczIz?=
 =?utf-8?B?bS9xSlRDZnUwZmRLODVXMUZoblNBTHQ3eWVOckVLeXZWNFI3a2lDVkFRWTBY?=
 =?utf-8?B?MWgwVGEyYWtBeHlhN0RLbDdjMFgxenRvZmgyaXVxYXJZOFNYRnVjYUtVWXFI?=
 =?utf-8?B?azJWRzdHdklZdEt6VFlKWVIybS8vVks3OWlMVVlKTzROOXkvalp3UDBmTU5I?=
 =?utf-8?B?SEFlcVZQRVU3T3hSKy9Wa1Nsd0RqVTVtWUFHR2U5L21HT1dDNzBZbUVPZ3cx?=
 =?utf-8?B?SEEwRmFDMlJJK1NGakN2RFV1b0RWM1lHUmowYlJkUXlGNW8zTERZWjVOcDlh?=
 =?utf-8?Q?MssfMRNQPa6RBt9fzms+OP8Xe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9736f1f4-32f2-4b65-bd72-08de0526a417
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:21:05.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsxahWac01xtAVPzTmSv7c1n2TDDeGAu1eOIeizLGXzkzUokKSf1H4Q/Bik2SY3bqmvPaygrf8EiczfQad6EYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
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


On 10/6/2025 1:10 PM, Matthew Brost wrote:
> The only case where the GuC submission backend cannot reason 100%
> correctly is when a GuC context is registered during VF post-migration
> recovery. In this scenario, it's possible that the GuC context register
> H2G is processed, but the immediately following schedule-enable H2G gets
> lost.
>
> A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> simply drops the duplicate H2G. To keep things simple, use
> `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
>
> v5:
>   - Check for xe_sriov_vf_migration_supported (Tomasz)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 33 +++++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9f0090ae64a6..3ac654cebc79 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -32,6 +32,7 @@
>   #include "xe_guc_tlb_inval.h"
>   #include "xe_map.h"
>   #include "xe_pm.h"
> +#include "xe_sriov_vf.h"
>   #include "xe_trace_guc.h"
>   
>   static void receive_g2h(struct xe_guc_ct *ct);
> @@ -736,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>   	return seqno;
>   }
>   
> +#define MAKE_ACTION(type, __action)				\
> +({								\
> +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> +})
> +
> +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> +{
> +	/*
> +	 * If we are VF resuming, we can't exactly track if a context
> +	 * registration has been completed in the GuC state machine, it is
> +	 * harmless to resend as it will just fail silently if
> +	 * GUC_HXG_TYPE_EVENT is used.

Maybe add:

If the registration H2G fails with error other than ALREADY_REGISTERED, 
we will know due to the shortly following schedule-enable H2G failing.

Other than that, a second to Michal:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

> +	 */
> +	return IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe) &&
> +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> +}
> +
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -807,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>   		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>   	if (want_response) {
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
>   	} else {
>   		fast_req_track(ct, ct_fence_value,
>   			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>   
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
>   	}
>   
>   	/* H2G header in cmd[1] replaces action[0] so: */
