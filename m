Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE20C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 12:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640310E566;
	Fri, 14 Aug 2026 12:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLt+A2bq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B82B10E566
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 12:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786711226; x=1818247226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nQDQ6E+hEY1nYSL9/05peJin826eBxAX6+GqujRyc5g=;
 b=kLt+A2bqBNnU9PJVyF/GQiTpEiBANtxFoElOfpnV4dCP1xXns1Tya0sV
 o4YckR7UQp8rfCGwcuYEwLfNr6VxjI2GEMUM/0Osxhm7HOaTvL1pkZjbr
 j7iHfcPuT1bxDGb8Z0f1418WjaoNVHBS7f4pEDlm0SVytfEdVWK+IwtkB
 npMM8OLJ6BIvbrEtAI3eKeFPwHn4YGc/bTkizkWMpZjDA+gIH+9hog5on
 8j8KhaebDo6zyBLhTL3b6ioMQ2F5BqXAYZB7jQ7/dPoZEz3Vy5Gmy24kW
 Kw47vrxmdLm4fzxY2L7Hyl3Y5F+211Esi62xA59XQlj8+vUWFwHNPyPAz A==;
X-CSE-ConnectionGUID: XnJ6Ui/iQKW6TeaKCA1iig==
X-CSE-MsgGUID: eSNWIggjRVWiOXvkhAD4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98802767"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98802767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:40:25 -0700
X-CSE-ConnectionGUID: HolrtAPvSsmlPGV0GGeFMA==
X-CSE-MsgGUID: vh2c+L/4SfOPwVNO2L05Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289011316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 05:40:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 05:40:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 05:40:23 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 05:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izmLzNJvSYHiiZrEpgzAHMmTqihEBan6d6ZzMZ0RMqCZv4T+ojghgLCxpI33P+jQB3kC2PvOLpHEw5gR7qFt3lVGIzCBRdtfDcDxbkOo2iytJYqx6wwWeUOTYo/UKyNSQJKkcuqlaTS/pTMefmbvI5z0WcwBpkPz6/d1JNoHiuEQ0LKhNF1eChTgi0ITrFKCGaji7c0FFGjJ0JyO0C80zmho2AfnZI1GwgHueU6JasqOZbRj3/mNjVXJgj3qzlCkA1p9lu2jM9THpKfDbBJzlWM53qoLEl0j20aRuaU3gnbbmiWORT4Y9IncMGKStTxmzflzL9r5sWIPHfVe4EoMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+c4/9QYneDT0B6QWRnBRJ2Wkc24KAlEuGF069ZUwuk=;
 b=vuoZB/m5y+NrxSmxkPs0Tf1FmiTa9F4wOvIMmpT0zNcrQrzUVBtP6K5mpGUSlBAUhjA4eiYG6EyZF2VbhDdOJ6I6ZUCfeCwyBka7yIeLM8WZTtW4lvx2BcxyIkjwhJ0T1XPZoLPKo9GtDYo7WsUtrz5bfioOK8QPiRuBjxByFTSSBSPHMz8pFDB/5YmGUV6Wo/9F/hAgvyiWe+Nm+D+ABb84JnmCiawU3n/CCRVtXX4KYF7oV7nggLLMoGNWtEJGAszxnqsvzapPDy6fzr+iczUFWM2UG5qjlTH5cAYfS/Dt54wnfkRpnumPTW2uN2f1cEexyq4043zwI2Rlk5J4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA3PR11MB984244.namprd11.prod.outlook.com (2603:10b6:806:530::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 12:40:17 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 12:40:17 +0000
Message-ID: <33a10d8f-8391-43bb-abe3-a563e947410c@intel.com>
Date: Fri, 14 Aug 2026 18:10:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
 <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA3PR11MB984244:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e867a9c-6525-4f2c-c0a3-08defa0131c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: cCW0J1pvMeFxeg+LLkxOkz/LYV4ZW2KTrI8C1+VwQPT2Va8dMU6yiboEm9+KVGGtjB9ChSu9Yzo35MKtzjGqlDgSiA8SXAZcms+TDTzrS0YV8FQSoMxVFP15xbProC0onHXScw5htf5qlb+1gf92rxWladWeLsYFzbnbp8sKB9xjALkt06Tr94bXykcejhhb4z2xFS1BFgwDX7tZeOoqKHGr7bAsOLf8/o+va1G9vBOaF87Py6Irbs+aGLMhSDdIXF4FvEQ0JytXMvBRsQrLXlHSc96uc2Bd9P6fx3JOQeWf2SunPJ+pleZIfiHsLUfAmggfyq2+wmrpARBQY02Y07KHbc2+/2YIqFk4x7ebBDzPu+DZXkBSzQxHFAmVXZ6Ws6nrugHhkMVoC6/C7RCd8Ci3CFQJG5bYTp/lb7MGf6CT67Mwh5zywH+rKPznHufXedKNgT63VUqs+ZYu5W3Ab4RBgA1kYPw/Zjc7YuNug7l1skUb/I3T999PJnSeQeYswQGRxwm82TOVgcLpEL7QP1xefXBkeC0U/h+HEMMagH/cZrBnp17VkObzTopBLPiLyP50Rtxgk6E5h7IbbbgF7rumYIFFuksAgoBjnOFVe5N559EAF5lE8EpE+8CZpD+zcgjKWh/XNJWhas/XinJarDOWBX9wMKQlBMPji5zpXSM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a25mMVNQdVdjYkptdHVqS210a1FIRkUyYnVQVGpPdzl0VjcvV1ViTlhyUGJQ?=
 =?utf-8?B?bW1BUEFPTVpDM3FhbDdSdU5wQ0kxNSt6VE5EVDNEQ0VwZGxLc1RmdzZ6bGQ0?=
 =?utf-8?B?dno4R1ZiUUJvRkZrdHphdUc4UCsrcU5SVDUzcHk2YkR5WHNYczkwaEZyU0ll?=
 =?utf-8?B?Rm5Demp0dXBSS2FSK2t6NTdVL1NyZjN2Z1UxdG9LNDBHaHUxVFhzTjN1cDRZ?=
 =?utf-8?B?RnE5QS9oTm90Ykw0a0ozS0FHSEZUYlp0blZRaGdlcGdBaHZiTzArOWhHWkNt?=
 =?utf-8?B?Z0o3NktGdHh0ZjFOZU4wa1Bmd3Z3azJ2RW5EdFFIdzk1bmZ2eEViMGVYWE9G?=
 =?utf-8?B?cU05bWp5M0daQytoNVZGRGhkYkhraytNbCt0ZWZ3cm9RSWwrZTlTVkpwZzJI?=
 =?utf-8?B?U0h3b0pFcFhSTWRjbEdVdy92UzZSQ240NVZxUmJXeGlzUW5KNWxKZkdXMzE1?=
 =?utf-8?B?MHhXS2xXWmFNZlBadVhqWXY0bHowdVYwR0V1d2ZFMjRCdnNNNWQ1OW1uRzYy?=
 =?utf-8?B?Rm9jK2lnYm5tNDQ4OXFBb3VyRHFUUzFvV0xMa0kvK1VHSmg5M3JTV0dZNlF5?=
 =?utf-8?B?QlBEdy9DKzkrVDdVc3Z5aldRRkxhNFZSdTZvMnY1QmVhdkFGcHNDaVZ2SUZ2?=
 =?utf-8?B?d0Q0UFdJSGdzWXBXNXY5Q3VaNU5TVkJRc29CYmJJcTlBWlFtRzl4ZFZnckt2?=
 =?utf-8?B?bEJ1djVSY3BhM1ZmZFJwbVlWYlFBbDFjOFlrWXJNeEUwdXpKeC9rREJzQVJ2?=
 =?utf-8?B?OWZqSW5RdEo5OHZ3aC9WWEJsdGFFeVJSNW1OU2dJdC9DcCtiVjhRNEcvdUFs?=
 =?utf-8?B?OHFHVHRDUm5wNnF3YWpoVkFOQnpjYzVXN1NIeXJvYXpQS2lySllPQVBPQ1FQ?=
 =?utf-8?B?Q2NoZzFTNCtCWGYwWi91ZXFDRmxMaGJqNFh5WTcwR2p0SlQ1UWdiWFFFT1l6?=
 =?utf-8?B?dEZmQytKZFpXQ0hWRWJkMzgxSW5lRXdGS0NqMmRhUzFOM0dOM3VDbUZpbTli?=
 =?utf-8?B?S1crWjg2Z2xPbXNWNzY1KzQ1clZyK1Rva3piWW5rOUZkRkFDZlQ2d05vN3pX?=
 =?utf-8?B?RG1POS9OU3FpSGQxWjJJOHhUanR5OGNXRGtJbzVzK2FHTHVVSzFFR1lhYVph?=
 =?utf-8?B?bHVKNnNScnNGTG53N2ovSmZGWFpyVWsxWW1SK2drNEdtb3dmSC9FYnlZTWNI?=
 =?utf-8?B?N1UxL21MNEhiTGVWOXJScGhaUUdGaUJMREh2WEtpSXBlaDJPaDdIVlMxTys5?=
 =?utf-8?B?ME4xSVVXT2tqRnhheUg3MGU1b0lXUklYWis2TGE1R2FGM0s2WWg5bmx4SlRr?=
 =?utf-8?B?RFBlNmFaSXB3TzdOZElTRW9TR1UwK3FWTDl2VVBZRlhaK1hrbXRtOFFXU25H?=
 =?utf-8?B?RlQwYmNzOU9SWnBzTTg4djVmcFU0U0NDUEFQSkNYYktxWXJSTmpLeU54c1Qy?=
 =?utf-8?B?YmlJa21ISk5sT3BaM1RxcjFibEpsUGhBUDFIZTh2aUNoTTR6eUp0SS9HWkFv?=
 =?utf-8?B?Nk1MTW9HVW02c2ljZmdFV2dwV3Q1TkljSiswUkVyRzVIaHdiYUNqdTdJSWRy?=
 =?utf-8?B?V3pLaEJzZXBON0gzMXNPdlhJcnNuRnFFVnBvSDM0Zk5rSEhXL1NYcUIvUXcr?=
 =?utf-8?B?YzNSRUdSUytXL1BKSmlRMmlQZzluZ3ZiZXpZV01qMmUzSjk3T29LYkJHam1j?=
 =?utf-8?B?VWRyNEhla1JvYlhUQTZWWGErbGJRNDZ5VnZzdXBtcWdOL0RPSFkwdlN6bnZH?=
 =?utf-8?B?QXBtbWEwbmdza2MzZ2JNZ25PRGRSbEpGQi95WmR3QTRmUjZ5ZDduamFKL1Y0?=
 =?utf-8?B?MkxXMUZCcjczTWRxcDZ5MXpTV1pFREI0Q1V4aDVLelVwSk0zbXhUNjNBVSs1?=
 =?utf-8?B?Sy9teFR1RmFhSzYwdnpOWnVaRStUaktlc1Jlb2EvVXVxei9vQm5NOGdZbU9o?=
 =?utf-8?B?aXJlWkV2WFkyZlJablZkT0hVZG9peXkxR0M0SXV2TkE5NmFaRVdDeWZ4MXFC?=
 =?utf-8?B?bm5DbEt0YTkzcmJ5Tkp3ZUlGVEJBMEROb2sybWxDNGJxa0FSaTNOeEw2VnJL?=
 =?utf-8?B?M2pNWkVnMisyWFk1cGE0N1hmdUw2MWtRZEU3am9QbmdORUpXZjE4QU5GV0xo?=
 =?utf-8?B?T1BIMktjU1Q0RS9HMm1yNnZQZWx5MitRNmIvOUlad1dVMnpEQ1JrS3cyakxp?=
 =?utf-8?B?VkFXUk1qVlQzbTVZM0xaVjMxSndpa0M5ZzluM0tmYzhueDZBOU5lOGxzMmhj?=
 =?utf-8?B?Rmx3ZGtBTUtaWXNFS0MvM01qMnYreDJsbmtJd2plb1A3bHVra3N5SGIyRGJG?=
 =?utf-8?B?a1gyaXFJT0YzSER6SlI0empkMVVwdmhIQ3B3c2xlOVlKT3hSeS9ncGRnODlk?=
 =?utf-8?Q?Q3U652AhxMzXA5lM=3D?=
X-Exchange-RoutingPolicyChecked: bttAbT+GTJUN4ohZl4z+t7aZDZ6TAQzrSfNUkgcZFt/ALB8+Ihu238Se7ZnEImSpuni0jXtUJ2fUBe8zxkl7JEVKyMyf6ZaNa0QiwM/IoGEqmSbrazPLbvHiwPoKOWrq2pKPTVW+4SCwscOyGBTTXxrjVtaYBAH0pplTlkT8iopJu9mObxLnlTpatpoBqsB2RFBz02WxHXEo+9QIZQ9LbMbHtJ0g8WTVfdGukTqw+dfKVt32O/CY9rAhyo06fT/AGo1YDb3za5FEdxgr/0gkyyeev6keD5UBoabpwZklpM9nnPOOoHPKfT1kChuJspAH8SQ4TVNRDd+Tek1Ytmfr2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e867a9c-6525-4f2c-c0a3-08defa0131c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 12:40:17.4049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK2fTd7DwPZ7zKTzz3NmoXTk1a5aboYCEwskC+BSizGSO7MlhHs3uDbhsfbtHXdK2PJoVo80VOUb+Vf0XQpbUYES5dO8mTh0QOVzO2iUH1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB984244
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


On 14-08-2026 12:01 pm, Tauro, Riana wrote:
>
> On 13-08-2026 16:31, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 21 
>>>> +++++++++++++--------
>>>>    1 file changed, 13 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c 
>>>> b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> index 2d8c532157fd..ebd288986c11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct 
>>>> pci_dev *pdev)
>>>>      static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>    {
>>>> -    struct device *dev = &pdev->dev;
>>>>        struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>        struct xe_survivability *survivability = &xe->survivability;
>>>> -    int ret = 0;
>>>> +    int ret;
>>>>          ret = create_survivability_sysfs(pdev);
>>>>        if (ret)
>>>> -        return ret;
>>>> +        goto failed;
>>>>          /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are 
>>>> aware of survivability */
>>>>        survivability->mode = true;
>>>> @@ -323,19 +322,25 @@ static int 
>>>> enable_boot_survivability_mode(struct pci_dev *pdev)
>>>>        if (survivability->fdo_mode) {
>>>>            ret = xe_nvm_init(xe);
>>>>            if (ret)
>>>> -            goto err;
>>>> +            goto failed;
>>>>        }
>>>>          ret = xe_i2c_probe(xe);
>>>>        if (ret)
>>>> -        goto err;
>>>> +        goto failed;
>>>>    -    dev_err(dev, "In Survivability Mode\n");
>>>> +    if (check_boot_failure(xe))
>>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>>> +                  &survivability->boot_status,
>>>> +                  sizeof(survivability->boot_status),
>>>> +                  "Boot Mode enabled!\n");
> Do we need this check? This function is only called if it is a boot 
> failure.
>
> We can have a error log with the type here. We don't need if else.
>
> How about something like this? and remove else
>
>
> <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) 
> SURVIVABILITY: mode=Boot
>>> In case of fatal, will make sense to return "0" OR we can add return 
>>> as -ENXIO right? any thoughts?
>
> Mallesh, you cannot change return codes here. This defeats the purpose 
> of survivability mode

In that case, discard my suggestion for return 0 or -ENXIO.

Please post complete changes, will check it.


Thanks,

-/Mallesh

>
>> you're a reviewer here ;)
>>
>> but seriously, enable_boot_survivability_mode() is called from
>> xe_survivability_mode_boot_enable() which says:
>>
>>   * Return: 0 if boot survivability mode is enabled or not requested, 
>> negative error
>>   * code otherwise.
>>
>> so returning 0 as success code in enabling boot mode is the correct one
>> returning -ENXIO will be no different than failing to enter boot mode
>>
>> @Riana, this is your code, can you please confirm that
>>
>>> After handling fatal case
>>>
>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>
>>>> +    else
>>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>>          return 0;
>>>>    -err:
>>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>>> +failed:
>>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable 
>>>> Boot Mode!\n");
>
> Can we retain the previous dmesg?
>
> Thanks
> Riana
>
>>>>        survivability->mode = false;
>>>>        return ret;
>>>>    }
