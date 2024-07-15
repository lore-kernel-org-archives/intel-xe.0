Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9CEC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 19:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDBA10E4F4;
	Mon, 15 Jul 2024 19:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miXzVtLX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E3610E4F4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721072288; x=1752608288;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rX7WjIH6SgJOSS9B9gu0Lpz8+24nyb1/0UaPCMRiCio=;
 b=miXzVtLXQyRKtQ9oJNs2OBgzc8RlOEy64+jZm8D9NkPfQzziQItoct1z
 2y7PGCytGfMlDS/mTaYAu7ioADDYo5esklnF0WqHMA6fpbRHAZTHyqyth
 e/rCVCprSsB2DaHuPFz5o0PkntFOOVp3dNbfm12GIVfIJZizXWjHwSJQd
 58c7GCmU8q0NzN9IQ0tHIDjiBk8q9oVb/h+oDo7OLw/V38yBNm9X6cKvN
 HthssnSBnC1rSicRBwiGX9c3QWjM4W+LR5LI4SdwoFUaZ8z/OePjshjvv
 VEXCz9g6mvpvwCj5bWEMv/L9vcXvTb7FK4CAJhGalVfRCKrFEZOmyJ29l w==;
X-CSE-ConnectionGUID: EPuMPO+BTHqB2uD6Rgof0g==
X-CSE-MsgGUID: I88+zBnDRgW6WToI3b6OsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18344275"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18344275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 12:38:08 -0700
X-CSE-ConnectionGUID: 4P9KJfiZQRy5e+ZhFM5BDg==
X-CSE-MsgGUID: Mqadq9UERVyKs3HtIfp3eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49626063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 12:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 12:38:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 12:38:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 12:38:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 12:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS0MSEQtrzywapfIbaaOkaATV5YCEyu42/gJ17syn3OgBozQJzXPZYdwYlimROPaqEYn0fHU8j1YDo/QbrNd+p7+TV3CjVttvZxkxOj8XaT02/TxCgeZcD7fsnKATFMBoIArpp6+jkdi9XT/MwnZc22SeBnP73XF93OGmgmOL6QqK7YBfd2NvDbGorgu7Y1pJ2OLv0qNvO79lrJfFa4kh7LMgLibyafxjgHb9fODfGFIw9NhseFt8QTm/ZCywQ1uU9YNwK91it09L0z912CNHCkH7oGmKO5rzO9uhUX+J95UtxyMZDAvZ7kacyRpXBKJXfq75idmcPhIlF2LgufFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTgckBI7oZJpJPW5VHY1zk0qRnjcEc+QlGQy0lUAYm8=;
 b=clY6hQV6pKXIXsfbItGUF0Nl24XWcvUkE996XPs89UH/k+F+UR4LREEOoqMmphouwI1tfuFHQtnkq8O1Z39oGZN+a0W7mGVxoqZpSgMw3GTDhAQNtsJhjBW35b6v7p4nZPzBFaxBQ4cyBLGkmKsAKZAp1SsQwaT37f+XbfEWlQQtNUl7e8hroAGRdQTm4bPfvdsB5CNwE5Uyi66hE3RCnmn0OB12MVV2QYTTfBr7c5Lb7CaWXRHXx718RSCSjZhvyJ8ABGWHrYpqQt2Uz69tTCaOOKaljt/AOpdUIHWZ0wvjm0HvjdYLlnF64QhPJr8n6+nUGvMTFzdBS3aL8FXcYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 15 Jul
 2024 19:38:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 19:38:03 +0000
Message-ID: <21dcb721-bcf7-4b6a-a4a5-cd51bf26449d@intel.com>
Date: Mon, 15 Jul 2024 12:38:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/14] drm/xe/pxp: add a query for PXP status
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
 <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
 <7fea79c2-ce58-4238-a4ec-37f3fef5c3d9@intel.com>
 <128f7b2fc964aec983cc6ddbbe31b4f1a615552b.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <128f7b2fc964aec983cc6ddbbe31b4f1a615552b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0264.namprd04.prod.outlook.com
 (2603:10b6:303:88::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA1PR11MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d7531b-7eec-4c03-ab16-08dca505a480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm1EakRBRUpCRG9PYUlHR3BqL1JBY2tsZXQwbmpwdUo2QmlXU2FaU2pQcnAy?=
 =?utf-8?B?WHlvZnE2alA5MUgreHdCM0JTZjI5akpZQ3kxN0lSaTF3TnVMd1ZqdlJWcWgy?=
 =?utf-8?B?OUJTY3BPdm5xNTM1QklYUXZWUnhYODBPRk1PVXl2elNReVpnUzFYT2V1NHhF?=
 =?utf-8?B?V1B6aGorWmoxSDhua3AxaVd4TElsRzhDZDc4WGM1VkxHV3VrWVcxL1AzWGNU?=
 =?utf-8?B?REVGanovOGI2VDljWGtMOVFVWWJFR3JtZUt6dlh2TS9wTGVFZFRxTjBRQmlJ?=
 =?utf-8?B?TUlVemxKVjBkbnFkVHZCOU1jdWQ3VUlOeWkxRkdlK2paY1laWjRUaW04TDVL?=
 =?utf-8?B?dWxNTFNYMVVFRHJKOFN0bmNBcHpBOWFMMXdEMElYeUliVllMUzNMMWdVTCtR?=
 =?utf-8?B?V09NZURROEJBQS9FOG9TeERvMWRGVVFPeHFpTXVCOExxSUFFK1JabGtsNnp2?=
 =?utf-8?B?MDdCTExKUHBIanlPZ2NoaVprM0FVSW03YlJXMmZra0tMWHhtdzREWXJYOWdK?=
 =?utf-8?B?WFpyVXhubld1NU9UUUtzNHN3bDlEL0hpV2x6T012WWZSUFp6bXVMMWNmQW11?=
 =?utf-8?B?SE9FYy8xb3dFRmFaM2VXeXBRVG9JYm85QW5pMVJUVzhuV1VoQlU1akVXazZp?=
 =?utf-8?B?Y1lTN3pSdUZnWGErdlpyQWx1SHoxNEVkMk5LVklqb2pTZDJNRWlDUHpab3Uz?=
 =?utf-8?B?UFBIbDh5aDNqOVpVY1NndmdxenJnU3dWbytBWG1lUU9GUnErMlkzbEozOTdv?=
 =?utf-8?B?WDZkaWZackIvY3Rnck95OGFWTHhialJjTEU4R3hUWUpPZlljYTZzak1XMldz?=
 =?utf-8?B?RExlZmh2R1lRb1BxK2VTam9QdnFCQW5neHEyZ0s4VDR4dGpJUDlRSWpudCtE?=
 =?utf-8?B?aEFHL0Nsb001bVh3ZS9vTkF2aEtaamNaYVROSWNoQWR6YnIvOStxcHJSMFJC?=
 =?utf-8?B?WjVtaXVTWmRUWldlb1ZFMHpWVStzV3RETVJ4UEgyZU9uTVcwQlV4UmkyZVNK?=
 =?utf-8?B?R1BXKzZwVHNVcVpZcUdoUEpZQzd2bEsvelBGRkNHOCsveThRUlFBNlMwV1RI?=
 =?utf-8?B?TlAwWjlTOWdYSThJYjJURkJvblpZTkE2S0pHemRzMU1pQnZWeUlwVUJhTjFC?=
 =?utf-8?B?dVdOQ2hlNS9LT0NvczZ5QUNwMHRYVFM0cEZvNzhhcnZNQnNPWU1KajlBQTJF?=
 =?utf-8?B?VnlCc3JxeUExcFpZNXB4UldmbUxIN0h3QXA2dXlQZk9NRTRpZlNKZVdMTlF1?=
 =?utf-8?B?UHRnaTRNU05GT2ZzQVp6SDlpY0ttSkJsWHlIRVVLRkJnbUF4Q1ZJRzZhM1B0?=
 =?utf-8?B?WUFqTFdYRjVpcmgwVTg2UTl3eWVvcEg1NnNDWW50ZElRWG51a2JWNkE5eGt6?=
 =?utf-8?B?WmZ1QXRxNTBuNjYzQURQcGQvUm1jY2JROWlYMkFEWmxoZTVQU1Vrcm4xMmtt?=
 =?utf-8?B?YncrSkI5dnNiTkZENjlidHZTK2dzVzJCQjFId3ZvVlpQQ3VHZ0FhSWgrbytx?=
 =?utf-8?B?OUVpNXFqYzZoamk5SVdWQTZvcGlWTzBEY1c0emhxTlRlTnJvSFRrUnAwMjFT?=
 =?utf-8?B?bXVUUHRuajdWTzduN1dESUIzV1dDbnNNcnJvaC95clhuM2hUZHg3NmRIMGRT?=
 =?utf-8?B?VGRMMkFrQXBKN0Q3dUpQVTl4M2J5b3dpcVd0VmxJUllOVStXM0VBbElCRGdw?=
 =?utf-8?B?WDFIOVhGWXcxOWF0VEJwbGF3bDBlbWFmQ2t0MFl5SmVFWVIwVEVPSzMvYThM?=
 =?utf-8?B?UHpaNkR3Sk5GaEVnb3lSb01rZHgxTjBtY1gzU0FVYmYxK1NobTB3U0MzNzNt?=
 =?utf-8?B?Tk9YdDYxOENlS1VEM29Bdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURiaXExTWpsbEYyT1NqYnY0YVdERHk2QWpJbHRLaW8wZExMY1VUY1BxZkZt?=
 =?utf-8?B?RGtiVTdnM0t3ZHJuT0U4Sjk3cko5RXpHWGJlVjlONmxyZCtEMm1XdTBMME5B?=
 =?utf-8?B?RTZCTHZZdDBrMm5xVkp2NXFrQlZSdnBTSGV4QW9PWGZadWJmY293WkY2bWZQ?=
 =?utf-8?B?MlM5YURhR21DUXFrMVZtTkpFMm1vejRtY3NCdmZ6ZE15RUJuWVpHSXp5OWxp?=
 =?utf-8?B?TFJ6L3hWZjZNM0NZUkUzczJoWUd2bnhzRENwUnQrNnZHeEZrVzg1RWVZOEVi?=
 =?utf-8?B?QnhDaDBhUW50ZzBCZEdoNXdFSnZEOVdXVTBteEhJQmdQU2Q5aWlXb0M0QUlK?=
 =?utf-8?B?dXBlc2NMb21JU1gwUXdkVzhlUm5YWmM0dEVJeWJBWkxYcWQ4dE9EVFRJdlY5?=
 =?utf-8?B?WkpucUZuWUZwTFZXa25KcW43R2VJN3V6MDlHUDdTR0ZqQW5xK1dsN0RXVVQ2?=
 =?utf-8?B?ZjZqMmdCR1piZ1dvTEhKSkQ1QzkvSDZkUXdaWmdqTzYvNC9xcTg2WFNDalZq?=
 =?utf-8?B?STBLZEoyVUxsUEFxSmQ0YUNLQ2RWckV4QTlWTnhzK2VhSEc2eWw1c01VVW1Y?=
 =?utf-8?B?Wi9pVk9ZMmhjOUFVTitOSW1BLzJpMFVnOGMyOUIvUVVxZDV1aWNCTGRRRERK?=
 =?utf-8?B?cXhYS015L280TzBpa3FkUW9PU2xCODBTeGhCYnlkSnpvdEF6Z2psL0laSWhi?=
 =?utf-8?B?bGt6SnpDSGxXc2JQZUFwRkYrRUxtTnNHS0NYeTdCUVVsdmNMaEN1QjNpUzJ2?=
 =?utf-8?B?ZEVXV1hXcDVQSmJ6TGdmSko5MHYxelprWVNiY2l0OEd6MXV5WXZyeFVxUXRB?=
 =?utf-8?B?QWIvU05Nd1E5SG95Zm5TSjIra1ArV0doY0Z6Sys0enYwaUV3M3huL1ZSNTFR?=
 =?utf-8?B?UjQveFJlU1B0a1hjd1hpY2g0eEFadi9xT3dnZkhPZkFLcnJTbGl5bFZhVGl3?=
 =?utf-8?B?b2FNUXgyNXRxQ3BtV3M5dUwraUs2d0hzc0NnWkl5VGU2R05qNEtaMVhXU1B2?=
 =?utf-8?B?SFdUdHBXTmQ3czFrVXlBVVcvTU5GYjNHaFZNbXJobUlMbC96Zk5kcnBBSndU?=
 =?utf-8?B?MlFSZXhDRVhRZ2l0UWYvaDBvRmdwdDNKWmNlNE43YUczV2c1YlFOVk1Zakx6?=
 =?utf-8?B?ckJPaG1sOTZsbHhnTWRtT0VDYUFqWG9PdXJ6cUNWSlc1Zm9POTJxK3lxekFj?=
 =?utf-8?B?dXNqVTFLd3hXK2lvdTBJL01uVFllb1NlUEhWQm1JOU90S2J6WGZiZU5COVZw?=
 =?utf-8?B?bVNVNTc2dUdnM1NIQ2dmQXZHNlVHMjhoZFpudWZLZVJnQlJoVStNRkZBUkd3?=
 =?utf-8?B?Yk5PS3Q4QlplMmFNcGpraitUWGhmdFJnWkQ0RE1hcTNoaTU1TlJ4Rlc2Tkhv?=
 =?utf-8?B?NVp6VVJBVXpQdk1Vb255MGVHWnV3dUVUYXppL0ZtekpTVCsrVHBQYk85STkv?=
 =?utf-8?B?WmpXWVMxUHpQa2JJQlZJRkZXWWhVUHdTQ1BuODlDdndKbkJhcHhRU0h0V3NJ?=
 =?utf-8?B?cmdBS1FoZVJmd3gxMXZSWmRucitwL0hsc081TXJzRmhZdG8rOHp1M1JCSHlN?=
 =?utf-8?B?Sm9BeW4zSEVvcmxDOVc0c1c3QUxjbzV4S0FrN0RwVTJiOGRPalVQNGpVUHQv?=
 =?utf-8?B?YzRuYlYyR0tHSmRsaU42bVNYK0Zhci9xTmdEQllsMWdVcGhqNXhhcmFBbXBG?=
 =?utf-8?B?K0UvdVEzelY2VVV0aWtlNE43RHM1TE52L3JZTjFPVU83T1pUeENwOXZpekcy?=
 =?utf-8?B?bGl4Y0E2Z09odXlTL2IrNEdsRVUwU2lOMWhVVzczSDBYY1VuOFE0NmJ1QUV1?=
 =?utf-8?B?ZjZIMjFydElVSWY4aktHcnhOYmhQb1p4SWRCUStRcjU4R2k5ZWtuUUFTMkhu?=
 =?utf-8?B?ZHc3bWdtY2U2b0FYbGdUVjRiRlBjQm1IV0JKekJrSG1OS1RCcm93Qkd3L1p6?=
 =?utf-8?B?UUNwMGY2MUlnemd3ekdqYTBUQkNqR0R3Q1Q3TjRwYkw3NTFMUXoxaUVqWHFj?=
 =?utf-8?B?eG96d253QUhHc3lVbzFZOHdPRVdySSswNDVrd3AveG5rcktrbzJyVng1S2xa?=
 =?utf-8?B?bC9nTnFaRkFYSmVESjVtc2pwMXhnYmszZXNZSGlqSjhFUUM4aHh5VXMvTFVS?=
 =?utf-8?B?NTRTSlJ6MHZhRUMrS2VFNElzMFd4ZWNNYU93dklsdTYzQW5oMk9PeUFRTnJy?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d7531b-7eec-4c03-ab16-08dca505a480
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 19:38:03.4730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHQEszSK2HUvN8LBvHrrn1Fyk5KHcnfyWLpsRVL6+1c0wpxijSH05SzWzY18BjDAfoJQDMiOtu8t8B8irZoXwsCpZo2YrC8XnJC7yeOnG+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6967
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



On 7/15/2024 11:41 AM, Souza, Jose wrote:
> On Mon, 2024-07-15 at 11:03 -0700, Daniele Ceraolo Spurio wrote:
>> On 7/15/2024 10:54 AM, Souza, Jose wrote:
>>> On Fri, 2024-07-12 at 14:28 -0700, Daniele Ceraolo Spurio wrote:
>>>> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
>>>> asynchronously from driver load, which means that userspace can start
>>>> submitting before we're ready to start a PXP session. Therefore, we need
>>>> a query that userspace can use to check not only if PXP is supported by
>>>> also to wait until the prerequisites are done.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>>>>    drivers/gpu/drm/xe/xe_query.c | 33 +++++++++++++++++++++++++++++++++
>>>>    include/uapi/drm/xe_drm.h     | 28 ++++++++++++++++++++++++++++
>>>>    4 files changed, 95 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>>> index e979b47f155a..e39a47aeb050 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>>> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>>>>    	return ready;
>>>>    }
>>>>    
>>>> +/**
>>>> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
>>>> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
>>>> + *
>>>> + * This function is used for status query from userspace, so the returned value
>>>> + * follow the uapi (see drm_xe_query_pxp_status)
>>>> + *
>>>> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
>>>> + * is not supported/enabled or if something went wrong in the initialization of
>>>> + * the prerequisites.
>>>> + */
>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>>>> +{
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!xe_pxp_is_enabled(pxp))
>>>> +		return -ENODEV;
>>>> +
>>>> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
>>>> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
>>>> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>>>> +		return -EIO;
>>>> +
>>>> +	xe_pm_runtime_get(pxp->xe);
>>>> +
>>>> +	/* PXP requires both HuC loaded and GSC proxy initialized */
>>>> +	if (pxp_prerequisites_done(pxp))
>>>> +		ret = 1;
>>>> +
>>>> +	xe_pm_runtime_put(pxp->xe);
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>>>    {
>>>>    	struct xe_gt *gt = pxp->gt;
>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>>> index 8f0a3a514fb8..b2aae4abdd0e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>>> @@ -14,6 +14,7 @@ struct xe_pxp;
>>>>    
>>>>    bool xe_pxp_is_supported(const struct xe_device *xe);
>>>>    bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>>>    
>>>>    int xe_pxp_init(struct xe_device *xe);
>>>>    void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>> index 4e01df6b1b7a..5da9f403c2b9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>> @@ -22,6 +22,7 @@
>>>>    #include "xe_guc_hwconfig.h"
>>>>    #include "xe_macros.h"
>>>>    #include "xe_mmio.h"
>>>> +#include "xe_pxp.h"
>>>>    #include "xe_ttm_vram_mgr.h"
>>>>    
>>>>    static const u16 xe_to_user_engine_class[] = {
>>>> @@ -678,6 +679,37 @@ static int query_oa_units(struct xe_device *xe,
>>>>    	return ret ? -EFAULT : 0;
>>>>    }
>>>>    
>>>> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
>>>> +{
>>>> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
>>>> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
>>>> +	struct drm_xe_query_pxp_status resp;
>>>> +	int ret;
>>>> +
>>>> +	if (query->size == 0) {
>>>> +		query->size = size;
>>>> +		return 0;
>>>> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	if (copy_from_user(&resp, query_ptr, size))
>>>> +		return -EFAULT;
>>>> +
>>>> +	ret = xe_pxp_get_readiness_status(xe->pxp);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	resp.status = ret;
>>> when status is == 0? does it means that will always succeed? it just matter of time.
>> no, it just means the init is still in progress. It can still end up in
>> an error state if something goes wrong during the init (e.g. GSC proxy
>> init failure), although that's unlikely.
>>
>>> For i915 in some older kernel versions we had to create a gem_context with I915_CONTEXT_PARAM_PROTECTED_CONTENT set to verify for sure if supported or
>>> not.
>> This query is enough to confirm. That's true for i915 as well, the query
>> was added explicitly to avoid having to create a context just to check
>> for PXP.
> But as you said above, if status == 0 it could still fail, so UMD will still need create a exec_queue to verify because UMD needs to report to
> applications if protected stuff is supported or not as one of first steps of Vulkan API.

If you need the answer and the status is 0, you need to wait a bit an 
then check again. There is no other safe way of knowing if PXP fully is 
supported or not.
Note that we expect this to complete relatively quickly after driver 
load; the init itself takes ~500ms, but since it is done in a worker 
thread it can be delayed a bit if the system is busy. The only exception 
is if the mei driver doesn't load, for which case the timeout is 10s, 
but that should in theory never happen unless the HW is in a very bad 
state or the mei driver is totally busted.

>
>  From what I looked to the code, exec_queue will return EBUSY if UMD tries to create a exec_queue with DRM_XE_PXP_TYPE_HWDRM but
> pxp_prerequisites_done() is still returning false. Can't you make something block in KMD until PXP initialization is running? Maybe add a blocking
> parameter in the status uAPI?

I can't block the driver init given that GSC init can be slow and we 
don't want to delay the whole driver load by 500ms or more.

I could add a parameter to block the pxp_status query until the result 
is certain, but is there any reason you can't do such a wait in 
userspace? I think it's better to block in userspace when possible and 
it should be relatively simple to implement, something like:

while (time_ms < timeout_ms) {
         err = ioctl (<query pxp status>);
         if (err || pxp_status == 1)
                 break;

         msleep(50);
         time_ms += 50;
}

I have something similar in the local IGT that I'm using for testing.

Also note that the proposed behavior is basically the same as i915. 
Apart from the defines, the only difference is that in i915 we wait for 
a bit (250ms) on context creation, but if PXP is not ready within that 
time we do return a try again later error. Relevant i915 snippet:

ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
if (ret < 0) {
         drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: tried but not-avail 
(%d)", ret);
         return ret;
} else if (ret > 1) {
         return -EIO; /* per UAPI spec, user may retry later */
}

>
>>>> +	resp.supported_session_types =
>>>> +		BIT(DRM_XE_PXP_TYPE_NONE) | BIT(DRM_XE_PXP_TYPE_HWDRM);
>>> Looks odd to me that you return DRM_XE_PXP_TYPE_NONE as supported...
>> I just added it in to have all values of the enum represented. I can
>> take it out no problem if you think it is clearer that way, I'll just
>> add a note in the interface doc that DRM_XE_PXP_TYPE_NONE is always
>> supported.
> Ah just notice that enum drm_xe_pxp_session_type is set in exec_queue. But still, if PXP is not supported/available this will fail, so I can't see a
> case were only DRM_XE_PXP_TYPE_NONE is returned.
> So I don't think you need to return it as supported.

ok, I'll update it.

Daniele

>
>
>> Daniele
>>
>>>> +
>>>> +	if (copy_to_user(query_ptr, &resp, size))
>>>> +		 return -EFAULT;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>    static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>    				      struct drm_xe_device_query *query) = {
>>>>    	query_engines,
>>>> @@ -689,6 +721,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>    	query_engine_cycles,
>>>>    	query_uc_fw_version,
>>>>    	query_oa_units,
>>>> +	query_pxp_status,
>>>>    };
>>>>    
>>>>    int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 631fdc2ed493..746bc16bd220 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -619,6 +619,32 @@ struct drm_xe_query_uc_fw_version {
>>>>    	__u64 reserved;
>>>>    };
>>>>    
>>>> +/**
>>>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>>>> + *
>>>> + * If PXP is enabled and no fatal error as occurred, the status will be set to
>>>> + * one of the following values:
>>>> + * 0: PXP init still in progress
>>>> + * 1: PXP init complete
>>>> + *
>>>> + * The supported session type bitmask is based on the values in
>>>> + * enum drm_xe_pxp_session_type, including TYPE_NONE.
>>>> + *
>>>> + * If PXP is not enabled or something has gone wrong, the query will be failed
>>>> + * with one of the following error codes:
>>>> + * -ENODEV: PXP not supported or disabled;
>>>> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
>>>> + * -EINVAL: incorrect value provided as part of the query;
>>>> + * -EFAULT: error copying the memory between kernel and userspace.
>>>> + */
>>>> +struct drm_xe_query_pxp_status {
>>>> +	/** @status: current PXP status */
>>>> +	__u32 status;
>>>> +
>>>> +	/** @supported_session_types: bitmask of supported PXP session types */
>>>> +	__u32 supported_session_types;
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>>>>     * structure to query device information
>>>> @@ -638,6 +664,7 @@ struct drm_xe_query_uc_fw_version {
>>>>     *    attributes.
>>>>     *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>>>     *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>>>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>>>     *
>>>>     * If size is set to 0, the driver fills it with the required size for
>>>>     * the requested type of data to query. If size is equal to the required
>>>> @@ -690,6 +717,7 @@ struct drm_xe_device_query {
>>>>    #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>>>>    #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>>>>    #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>>>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>>>>    	/** @query: The type of data to query */
>>>>    	__u32 query;
>>>>    

