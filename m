Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B45D10F6FDC
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:36:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF08810ED01;
	Wed,  1 Apr 2026 16:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4TxOSES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA49810ED01
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775061407; x=1806597407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I6Y40YzPwAgazaE9NJyokiIB/01kuWglCnHhnViuczM=;
 b=i4TxOSESI0q8agq51+WFwRBiZPVAM3DUob8ZkuNdyeqd4Xk+jk4WA1bw
 pSDAfyu/G7s8QoK81WLl8HsHKH5XEpx/jWB9MuZQCrkyZliofusgrYXpo
 DiN8VyjtqsGAhNwHfku9BL+v5oOfbDoqUPjTbOWvFk2guf5K1jXw8OS2k
 PzGcEzhiUr9L8POep9nGz+3ZN5MVxeZbiBIwMf8TVfszdoiGO/7DSXqvX
 CGbD/3HP+CwK5zuobFXrk/8l0RW6pPQLTfIr0ORuNMhVNC4QnRG1O2NsV
 qauCv54N2Q+QSw7ZNZYZiBRyYi4RfeVY6FHb97ilVqvWXIdUmTFvNTi5S A==;
X-CSE-ConnectionGUID: Bad7CtFpSMyxc22byPrgDA==
X-CSE-MsgGUID: 7MpjwBeeQ+yXqkQY5j8rgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76122183"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76122183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:36:46 -0700
X-CSE-ConnectionGUID: 62cLxuiEQv+NVO7hwU42AA==
X-CSE-MsgGUID: MJ9zdDIGQLiS45KRVom8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="230784593"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:36:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 09:36:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 09:36:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 09:36:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWdjkU5apwxfHnGVV76EgSzXJ9kL6kv8DBmzmiuoVo2mb4Olp8ikZ0PdPX0/0xU10wanzHK+Im5Dbn/9pP+WnpA6GYZzRpUyBX47/IwTPAcxQZvVs5DjjhewJSjUKzHV15WPjHE15FJ8hWHecv+Gae1vkqkRZpLlWCnWt6E16eYDgbxywBi5hf6+W9GQ2z99qXdW55cU0Tfo3Qr9og8qmiFhqfFYjh84IRZfPI6QybH+248G5PkAjV+Ih/hVNr0zLC2QfdjkITv0+Ju+Fage38JXsKnqU/ivivKNMHg4lSmkm6vcpyXGgK96DV9BE8WJHggNR++2EypcGi25C5GIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D5npl2pBK3AHe+0t8R54W+LqJIwHFO++ob+3hrcp24=;
 b=RpvLvtCX3bMrZLBbGBHjACaf9c4rzUw/J100at8/GWBB++xPjfofmNlWIVa8eVRxoE9KwVNBnUlVgmE/Y13mUdbCVhq+olIGXmF6T75faF9kdxsxIrtF8BoU3OOUlTvy60kzV9XS9/bU7SMF3wUjL49sSljc9tZ/jbFIfX8WE37yapZqkXUsFC3bgJrCqiYThuadBIbTJ1y/Akq2cwfJCZjqMEcQGv0weaH97O76plLtiE8ihMo0wpaIymKOYI7JbHjS29NjAGY48Cv8P2lns1UOLieKXfY7m6/ztlAs7SXZ9xuIQURH48D9mzeTlu925sqdUer70RDVqBKADD5kfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB7491.namprd11.prod.outlook.com
 (2603:10b6:806:349::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 16:36:29 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::7d7d:9999:506a:6b14]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::7d7d:9999:506a:6b14%5]) with mapi id 15.20.9587.017; Wed, 1 Apr 2026
 16:36:23 +0000
Message-ID: <f1708bfa-3648-4a56-b549-0a4561ced93e@intel.com>
Date: Wed, 1 Apr 2026 22:06:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/15] drm/xe/uapi: Add access counter parameter extension
 for exec queue
To: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-13-himal.prasad.ghimiray@intel.com>
 <acKevKB0mEbwGLqH@fdugast-desk> <ac0vyICB0GIsteSi@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ac0vyICB0GIsteSi@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a63995f-5a46-4f01-f651-08de900ccfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: IVKxxufAaptso/LIEb7N9cCMfUcJCRn1OA7ntnY27qFhlhhEhSSoxLg/O9nzSfdEz2Ov61zu8E/PhB9OglkxqOgMuNlAoqvpoSvYRHh7GjtuiKovJIWkPK//3BjseOWx9G1bLtWSs19XN6+3qfNQKgjSIHL3OUB2F9erzMYcJ3OTtutzXpmijmlcSUV9yHsNbsLiI1ZwdjdOxEHNF0oZUiwLL5hEz/3SSxr/Z38uJwJ6W8amNOVB65d0+G0vIH1i67fU92l6ZXJD17EIXHKnhtmT827/64SR+mxF4TVZc3KZWIzpcJ7vZxYlE6WU1eoIbTzVKph4FptucbStcvtObV1dslaT/+lM4r+6kKCRYJRUZoDOm2zg4GA6Y8qZidrhFwUgefGXZYvW9aO+rGg33IfjjpPoWdPFFmZ+es3SIYcXNMK+y8PqRz8hRn0ZHOTnMlyl6JubNM+zAgaczc7A5Y2+nMwq4Bfes0lSZklg+B9LV9XSR3pOnjVu/G85kdK/wC+NQJQjHT2rItFnF+Whc62yDb8MCSfySAkCUsdEaMZacmDyhJ9aQYmuFU4iWMdJD/9TqNAgZsFb9BudNM9zZEgZS9fcFs/tsEgblc2wEXCKVFNK6K/DnXoeTLpmwS1GpQPVcyeRiy/gHgbz1PcjJypjmPrb1D8nmRp0IWHOYFs94NyMY2lC5vIBLTsKGsW15Ooyu8ALpk3ZuEDh/OIrYXnv4cUUyJFtXQYQT5TZ01I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yjk3YnFZQWhYckRhM0V4c3Z6eTdKWkY5cm1YekJVWEVhTXhwZ0R0cU5CQkx1?=
 =?utf-8?B?cXpCdVp1K0JPMVk4dFAxT1prTFVoNS9LcWlmbDBScWNmUjAzWHJkTHdQL0Za?=
 =?utf-8?B?WERUbk42K21uaVJnSW5UcURkRC90cHdGS1VYaUkxeEFNZGRsR1Vtc1lWRGhW?=
 =?utf-8?B?SWNueXcwR0lZTVFtdFZwZXRYaTVIT0xnZnVKeUxaRjJCcEJUZS9IZGc1bE1X?=
 =?utf-8?B?WDVJZkJTbTJPc1VOaXZsSFFVaTZ1YTUraGRQNjhIbUlPd2dNaHRSV3c3NVVE?=
 =?utf-8?B?NHpXZjdFVkhZVko3ZTQ5clBCZ2trN045eHRJUUlFVzFjMlZBU081eHhSNkJ6?=
 =?utf-8?B?aDNFdkdWZUR0OGhSR2N6blhJbTVlT1hNK2c3WXFDTWFhT0xVTlYxR29kOFdB?=
 =?utf-8?B?d1Z3MHJJSGdUc3pwenNFT3M3TWxLUVpJSFZiRVUyN3pEV0dMOEZ6Rk9hOEk3?=
 =?utf-8?B?Zm9sc1QveGRrbnQyMGQ2NkQ0SzFMRXZLeWFZR3BZNjlYN3BIMkRIbVVMRVlo?=
 =?utf-8?B?ZmtUeTEwTjhIQXRpZ1pjOERNWEllM1N2dWNvaVpSNHFnaFVyRU5WOWZDVTRD?=
 =?utf-8?B?MkRYK2VtTjR2WVU4NW1ZOVlleG4yWDFhYzhUUWQxZEtMWW4xVTY4OEhTTVE0?=
 =?utf-8?B?WGtCT1FOZ0xPMG1hNGdZSlJ2UXMrQ2Z6Y0o1VllXcXk0MXM5RUdNV05mWlJT?=
 =?utf-8?B?b1Z5ejNrdWp4b05GM0xreDZpWTlWeW5TZ29lTzA4TXFsb2tIYmorTlkvT1cw?=
 =?utf-8?B?TXBuNXI4ZDlROFdERDNKd3dJdlFyWnA2ZE0vMC83R0dmN3l3Wm04eUx2S0hw?=
 =?utf-8?B?UGxuRmVnZkhXODlQbWxzQTFMR2o0TTRXdDRDRXFqcW1SUlBndzBzck40eHFt?=
 =?utf-8?B?ZDY1dENhSEJPVDV3TUVmMkFhOGJyRkZPNnZqem0zc1hWYkVza0xtM1pWRTVy?=
 =?utf-8?B?c2dkcXVpVWR1ZGltUTFldUt2YU82SStHc2x0elNWRFI1Vm0xQlc3M3NQN1Nk?=
 =?utf-8?B?VEFPbGxoZ1pqYnVnczU5bjh5U09nek1BV1ZKVjlGSmtiN1ZVamVtdElQVFN3?=
 =?utf-8?B?NDUveVg1WTJSamhwU1YxR1Fsak4rMEtZNUlzUTQ1K0JKY2prR1pRdUR0cjBM?=
 =?utf-8?B?bkY3dkxxVlJXdmxvY2VNZGhxOVlEUkpGdDY5dHIvR3U5MUdzMlBtd3FaNXkv?=
 =?utf-8?B?RmZyT3lnTjRtOVNTei9mbzdTREs1T3MvL25hQnRGbGZVQVI2djcxWGNScGwr?=
 =?utf-8?B?cWhHZkJlK0VXY3grN2Z6RG1sNytNNlRnc0grUU51YjBhcEZVbW4vLzF2Z2FK?=
 =?utf-8?B?VUM2UWtLWE53RFc2SHRhUUFvSHptcUdSQ01paGxidzd3dUgrU3hhS2xjSTNT?=
 =?utf-8?B?bjFGbUpqQkt6WWUwTTkwdi9PK2wrS29WTnlPbU1vYWRHa1dDU0Q3TDhiSHNM?=
 =?utf-8?B?M1cyM3RPWWxta1lUazRCeHVuRUx3ZmpRSVEwNmdVNkV3MnN0ZU5RL2wyVUhr?=
 =?utf-8?B?dEtyQnY3RWlUOVJUS01YWHgwMitST0FQdTRyRkpLYUFqUHhKSTdOOE83K3RH?=
 =?utf-8?B?OXRCaGgwUDA5YkxYTnZVOGpPa2dzeTd2SzFrU2lDaWFXNGxXVzlORXZMOU02?=
 =?utf-8?B?TGI0b25JY1pQb1IvSEtsWHRLNXhTa1VZY3V1dHpYcTdNdEYrdGlTWmp0dDFl?=
 =?utf-8?B?WkRVYUFtVFMvaUtNRkQ0ay9FTGxQRVV0d2RBMUQ0TkJNMlhUY1dLRWhSczRR?=
 =?utf-8?B?Mi9RNzhrSys1ejBwdjdpOFNvblVsL2NIS3FjT0FhdDB4US9IaGRrUDZoOFNB?=
 =?utf-8?B?OCt4Qm1mdE1FeG5NVHhGdkxtVlRsMTN3ZzBuZUpiQ29DRkNFaHRSM1FaYkNl?=
 =?utf-8?B?OVVwRXZ4S0M0dUJxUEUxbWFiRUlyUWN5QmVnNzJyVTNBRk8zSEJRclBJK01z?=
 =?utf-8?B?NFRWQ2ZuYndYTUtpbCtWWE1iaUc0VXhCMGJoR3BTdjVkY3h0dm0yMGZpcU9i?=
 =?utf-8?B?VkpheTBaeC9KWjkwL0tVS1Vzd08rSVpRR0xNSGRGcWVlT2VRTkQ2ckpQMWFO?=
 =?utf-8?B?bUdhNzhoTUdOUjdXclArbEtvYWlFNUJCZWc5TWhQOGxsVC9XYTBZK1hCQjk4?=
 =?utf-8?B?OWdiZ1JKQWtSMlE5SjdpOWFSTHJuc1F1VGlIZ0ZOd3U5VGpJcVMrY1ZKRE55?=
 =?utf-8?B?UTVtVjRvRE9YQUhtcnplQ1RzckJVTjRTOGJRQmhxNUMyZUlLM0N3d0pIZ3py?=
 =?utf-8?B?a2xpWEUxSG4xcEVqODhlOXJIQ3JveERVTjNwa2N6cko1d0RWZkFBdU5wTmlW?=
 =?utf-8?B?aFFFNVN3dFcyUzRZOWkwTlBNRE5xUmVOM1J0L3NUdmU1SHF1ZTdidW5CVEZN?=
 =?utf-8?Q?s/i3iRBErq3hbtIA=3D?=
X-Exchange-RoutingPolicyChecked: X7j8njbnvugteqDUUb7BycjPgCwWRasSjur0w3jJIXf0ztc0IOxa/ZYYsho5dIspvSozgaUw/kD35r+YBTGvKbxSrgVzzCBwS+M9W41ANXygGLYgV+UaRurA/yzZadEkf2yLOP6t/PHwD28qbGUeNNpiJMSsGZY2K/GpKqgs2ahqMH0W1AqqKlsJTp+2temkgqw1+3UTk4M7OGGXx7e5T0sqAcrBhm2pvDl8lQ4hkT3A2D7bMvnizO7QONqdOddINj5w+m+BYO0IjIGY5puLt4+yK1uoIaRZkV1JMIzZhJRrwPy8I+6gc9QSWhVEa+bUFLoNlsILg1t7Rlun7zGPYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a63995f-5a46-4f01-f651-08de900ccfb4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 16:36:23.6719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7wTou/wVDNv+3bZb9B7gPuSzFx1wLR8XWk6reQseqtDm8/VoR1kvy+UM+PspGGRWZcnRM1SIQplGwxzPr59vO9vANfixR204LAy5ANs0J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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



On 01-04-2026 20:16, Matthew Brost wrote:
> On Tue, Mar 24, 2026 at 03:25:09PM +0100, Francois Dugast wrote:
>> Hi Himal,
>>
>> On Wed, Mar 18, 2026 at 01:14:53PM +0530, Himal Prasad Ghimiray wrote:
>>> Introduce DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension to allow
>>> userspace to configure access counter notifications per exec queue.
>>>
>>> The extension provides:
>>> - trigger: Access counter trigger threshold
>>> - notify: Access counter notify threshold
>>> - granularity: Access counter granularity level
>>>
>>> These parameters control hardware access counter behavior for memory
>>> access pattern tracking and optimization hints. Userspace can configure
>>> different thresholds per exec queue based on workload characteristics.
>>>
>>> UAPI changes:
>>> - Add drm_xe_exec_queue_set_acc_param structure
>>> - Add DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension ID
>>>
>>> KMD changes:
>>> - Add exec_queue_user_ext_set_acc_param() handler
>>> - Store parameters in xe_exec_queue.acc structure
>>> - Register handler in extension function table
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 27 ++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  9 ++++++
>>>   include/uapi/drm/xe_drm.h                | 39 ++++++++++++++++++++++++
>>>   3 files changed, 75 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index b287d0e0e60a..815e82011c6d 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -1080,6 +1080,32 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
>>>   	return 0;
>>>   }
>>>   
>>> +static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
>>> +					     struct xe_exec_queue *q,
>>> +					      u64 extension, u64 *properties)
>>> +{
>>> +	u64 __user *address = u64_to_user_ptr(extension);
>>> +	struct drm_xe_exec_queue_set_acc_param ext;
>>> +	int err;
>>> +
>>> +	if (!xe->info.has_access_counter)
>>> +		return -EINVAL;
>>> +
>>> +	err = copy_from_user(&ext, address, sizeof(ext));
>>> +	if (XE_IOCTL_DBG(xe, err))
>>> +		return -EFAULT;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
>>> +		return -EINVAL;
>>> +
>>> +	/* Store access counter parameters in exec queue */
>>> +	q->acc.trigger = ext.trigger;
>>> +	q->acc.notify = ext.notify;
>>> +	q->acc.granularity = ext.granularity;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>>   					    struct xe_exec_queue *q,
>>>   					    u64 extension, u64 *properties)
>>> @@ -1123,6 +1149,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>>>   
>>>   static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
>>>   	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
>>> +	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
>>>   };
>>>   
>>>   #define MAX_USER_EXTENSIONS	16
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> index 8ce78e0b1d50..3f10e3371e5a 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>>> @@ -239,6 +239,15 @@ struct xe_exec_queue {
>>>   
>>>   	/** @replay_state: GPU hang replay state */
>>>   	void *replay_state;
>>> +	/** @acc: Access counter parameters */
>>> +	struct {
>>> +		/** @acc.trigger: Access counter trigger threshold */
>>> +		u16 trigger;
>>> +		/** @acc.notify: Access counter notify threshold */
>>> +		u16 notify;
>>> +		/** @acc.granularity: Access counter granularity */
>>> +		u8 granularity;
>>> +	} acc;
>>>   
>>>   	/** @ops: submission backend exec queue operations */
>>>   	const struct xe_exec_queue_ops *ops;
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index f8b2afb20540..19447ba10b1d 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -1337,6 +1337,7 @@ struct drm_xe_vm_bind {
>>>    */
>>>   struct drm_xe_exec_queue_create {
>>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>>> +#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>> @@ -1377,6 +1378,44 @@ struct drm_xe_exec_queue_create {
>>>   	__u64 reserved[2];
>>>   };
>>>   
>>> +/** enum drm_xe_access_counter_granularity - Xe access counter granularity */
>>> +enum drm_xe_access_counter_granularity {
>>> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
>>> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
>>> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
>>> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
>>> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
>>> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
>>> +	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
>>> +	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
>>> +};
>>> +
>>> +/**
>>> + * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
>>> + *
>>> + * Extension to configure access counter notifications for an exec queue.
>>> + * Used with DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.
>>> + */
>>
>> Sorry if this is already documented elsewhere but I think we would need more
>> details about access counters from a user perspective:
>>
>> - why using them?
>> - what is different when using an exec queue after setting access counters?
>> - what is the typical flow, maybe with pseudo code?
>> - how is @trigger used, what is triggered, on what condition?
>> - how is @notify used, what is notified, on what condition?
>> - are notifications going to user space or only to internal and trace?
>> - what happens if access counters are not supported?
>> - can access counters be reset? removed?
> 
> +1 to Francois comments. I never really understood the i915 access
> counter interfaces on exec queues and without an explaination like
> Francois is suggesting, I don't unerstand Xe's uAPI without reverse
> engineering the code.
> 
> Matt

Hi Francois and Matt,

Thanks for pointing it out. Will add a proper documentation explaining 
the use case and all the details in future revisions.

> 
>>
>> Thanks,
>> Francois
>>
>>> +struct drm_xe_exec_queue_set_acc_param {
>>> +	/** @base: base user extension */
>>> +	struct drm_xe_user_extension base;
>>> +
>>> +	/** @trigger: Access counter trigger threshold */
>>> +	__u16 trigger;
>>> +
>>> +	/** @notify: Access counter notify threshold */
>>> +	__u16 notify;
>>> +
>>> +	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
>>> +	__u8 granularity;
>>> +
>>> +	/** @pad1: MBZ */
>>> +	__u8 pad1;
>>> +
>>> +	/** @pad2: MBZ */
>>> +	__u16 pad2;
>>> +};
>>> +
>>>   /**
>>>    * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>>>    */
>>> -- 
>>> 2.34.1
>>>

