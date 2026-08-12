Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FADC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:29:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E66010EF10;
	Wed, 12 Aug 2026 09:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mjyvaiho";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2BB10EF10
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786526990; x=1818062990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HDLca957HYGhwm3lafHZP5t0hHD7aLxJLsZAwWIC6iA=;
 b=Mjyvaihofq4XPPsY+lGEpd7cXO7jyvOUDl8Vi+uyF7CEuD7Gk5LBOAjT
 nRX1qAD5gMUhbp1KzUkiHfhG1awbnB7R7gBKbzIP4F+nuCANZvMhmk69t
 c/Uu0Kj9pG3LoEgTk3C0Zu0yt81XnblXViO+S6cigkXU0TnN1ioGqAelR
 Hty8DKwbc38drO9FjgArZaIZMVS0gBqEw/+7IA8r4i0TAC4ZPJN4+W/Fe
 T8SGfOotfLH6++bwy1NFKZyYeWyF37YRk5CelJfc3PsXt+aKivoCs7Jxe
 fHbVgY+B/jaODkd9CMRTPDcwrElJt8qiv6wikKbG9DeKWtlI5UKykmCxz Q==;
X-CSE-ConnectionGUID: 7Nc//bGWTBq++ppwi2+gYQ==
X-CSE-MsgGUID: nACXycsQScuezSR/uiWQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104607803"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104607803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:29:50 -0700
X-CSE-ConnectionGUID: XxJQl0J6Sxq/l9i/jsanrw==
X-CSE-MsgGUID: 40HiGn9pSgmXbWsMGR+4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="288342827"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:29:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:29:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 02:29:49 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 02:29:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RH3REMD+oVrCP5PG+ebegg+n4Iot8+A+NCn9v3JR61fESdG+It3DBhWG5LF63BzHRck9mTHzaxuze/r2qZpUXS8juE4vF61IsPIF2fRZZ90qM1rIor1OU+aceFaXX8DCQfUqwZqlGD66dTcwkouiGhCo82emLAE5hQuqqaaDyia+sihSkHGs8U7t4axEqi/qidC6Kyc+XEYzVMXn4wnCsGjFUmxPTjW4eY4U8XiX99Gbrlgw2Moqkrr+yuhdFS7dAKJRoiTbf16kYY/b2a/qcJFzwFxr8UCnwOg291wbdDb8u4xy2FMkFf+cM7/npZHJcP3IYAbZM3/UfjYXBvSVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYFta0jtslJ+CHpSBH/sYYhwmz7LkfMH57k0E5+nh8U=;
 b=Zzzw8S1eNjSP6A/tsfWxhOZueHpauD0thyJNZDYSfksx8Fbw78qfx10V+/baTrdXIANPT+FOAJJNgsuZAAaxtxySshqGLDjYxKNgGqw1GxvJBaq+UNV1svpnt2cOcCrbDE4NYrpM5ScBw39JUTb+2liiMBM4IvtVD9jglLbd6p1TJ3BtNbbmr+id7PVG7WjNURZdJUj/B4iPpDz/8pp6AkJyNXf3PsADFF4215KwRoGKD5w+x0ULTlKDkJa2yGRuLUxoyeTg0dlLU7eDBqXJsf1uObjpRXPeCg5SNBInh4i60qUq/icRvhQDFl9LwgMZu12CzKGWfWTJcLfLHOGIlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9447.namprd11.prod.outlook.com (2603:10b6:208:571::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.11; Wed, 12 Aug 2026 09:29:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 09:29:46 +0000
Message-ID: <fd2bf953-4faa-4c29-88bf-e8acc9f11355@intel.com>
Date: Wed, 12 Aug 2026 14:59:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
 <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
 <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
 <1bce5332-0341-4ecc-839d-bd36df33dff7@intel.com>
 <14bfeeb6-5762-4870-9cae-be827ec26129@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <14bfeeb6-5762-4870-9cae-be827ec26129@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ea56ab-e44e-4428-8c5d-08def8543ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YBdxWm5D9TnYMGvG88w/tIOOXovhsvEoWGvPsqkVdP6zpTL3P6xbvukk8ZIo+JpQeWN9STo7SORnhSqzU7hF+tNMEW/bU0KQGFtzIU+qmQK7+OrPf5Nax15Ojjnm+H4Fw9aTLaikQnM7ZFXy9IwWVkKHIFShx5i+RsTTEjkT6i/sX7dSztg/xbp6yZhgLXVSV+tX688a9U+R+D4xG3On9v6lWFHfaCuf75eOAVSHDwX1hJiOSBzIrhMAPsqcWSWDGh6BA0isINGRO235f1bTnSHwKEnvb9/tOjQns3aqx/L7a0Svzvy53TSnW2LNzkVw9P1eKOsFKMBbg8GlDdYz1yYfwryvVc88epyXWqrOCYUOLVqnlyoY/p6+QHaM57U8sFToUwb/reUCJyMNUV/oLOfdZ1ZH8IpywpvXM5tjCnTzxcAWIGKqgHdvrDjk4qqi1OiZgL8uxizn4UQFJjxzhZMQZQGUWXTscjUXfgJh1C7ErN6ggGol2J1uE1eV9PGgfPQhKh/Apegh2MpwVQk2X0PEHlHSb77bLE7t0cUiO21SJHuAHMAldjmuSXp9Oit0nF10snUK5/r8zooeB24Sy3sRL52qFLIjypg+1trYaR7KXwgrszYc/pNtyxR5gFaj+DdyfvVYjYyykVZAToPlGCzHUSz19NtzRPgbiBjC+hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVpValk1WUVLenNPczRYb2NsSVo3bFlsUFo2OE16dHdaYzN2blk0T2FjTnlS?=
 =?utf-8?B?NXQ0SHFqNWZaVGhFZEJheVcxaElUTWttb3dwOVdBSXhJcVhHNVoveG0wOEJo?=
 =?utf-8?B?WkVFa2JiNU96MkplYjdZNTBmODJVbnlWZXJSc0RHTjRxN2p5NzZnNU02NWdj?=
 =?utf-8?B?VzlFdkhMYkM5MTkzc0VUQm8rYTh6TTlwc2RuUHRoSi9MMzcrYlM3T2Q0eG5Y?=
 =?utf-8?B?MmVQaGUvTEZneUN0cDJ5QUtSb0VPOElnUzhvN0lrUjgxOWwxUkVHUVpDdzEw?=
 =?utf-8?B?THpZSDBYZllGcEQ0Q2ZmczREaFFGNlhuUnUxVHA1OVdEQ09EUjFNMVhUM2JM?=
 =?utf-8?B?WXBrUjdWK0lkb0p5WFFsTHk4YkljNnBKTG1abGlJWW12d1RtcW1wMzFyT0JQ?=
 =?utf-8?B?OHhwTnl5ZFcwWFMwclBuR0NFM0xHd2hYdDBka0dYV0gyT3I0SjJEU3NIaWVX?=
 =?utf-8?B?UTZXNVY0L2srVUNsS0JRYkRMVXNFZlhucTNkYVI2WlJ6UGwxS2R2MzBiL2Uz?=
 =?utf-8?B?cU5GYnF0NTh6QmQwMm1VUDIwNEhFZGNTWDdjRlBPMXBPRHlGVHRscnJBbWRm?=
 =?utf-8?B?bXBLWkRqWEZwdC90WnY0NDdoNmxpOTRISlpjemE2TXVaeEthdEI4aE9LMWRw?=
 =?utf-8?B?NFJtaVlyeUJuNENkRTZZaFVhR3BWZ20xS3JEQlo5ZlpJV3FCOFZCMUZoZUtE?=
 =?utf-8?B?MkdRK0ZRcjBFd0hURm5qT0p3TmxTZFc2T2pqdGJoeFg1MXZzQmdNU3BXT2lR?=
 =?utf-8?B?cjZhTTdDb0J0Nm5RVWRSejZPRzZweXZTckRCcHVPZThOQ2FpaHZ3WnpQQW12?=
 =?utf-8?B?QVEwWDFsT2VoNG5wR3RkTllDcEVjdmlSclFqa0ZWQU12MENEamJ3eitaWjNF?=
 =?utf-8?B?MCsrd3dRaGJ3RU5QRjhVZEZpK2szcHdkd0VoREhXZWhDWmV5UXRSdGZjaThK?=
 =?utf-8?B?WXNXMDJyTTVWVnpEcHN5YXF1ZU5rb0lqSmdXejdMaEdSdExqZ1JEdGZPNFBx?=
 =?utf-8?B?bktNY3VrTDV3MHV3dDhIOEVORldad1Mzd2lFSWZXOFFLYkhIOHYvK3ZsSTBW?=
 =?utf-8?B?aCsxMnRwZFBQQ0ZPQmE5aVFKMUp4UndUQkdhMFl6UDN4b3V1VnNxVVVKMitZ?=
 =?utf-8?B?R2FiVWxXeTRMNGxyU3E3ZGdjaytLU0RaRGpmTXRhdVRwS2ZpL3NxdldoeU84?=
 =?utf-8?B?NTJoeFNNSEZOeitzOWlNSmVySUNLUGxFVG8zclRrWTNsRUx1SFB2eldrTmp5?=
 =?utf-8?B?RnM1OEFQaFRiL3BSZkxzdVBtTGpZVG4zeWE4QlhGNzZNMXZJZTBQQitHQnJm?=
 =?utf-8?B?Sm8vQ0dJRXJOcnhlNitkS3grVVhMYkI2QTlyd1FWeUhuWkF3V1drUGRYUlNl?=
 =?utf-8?B?QnlMUUcvZ2hrYjNOMS9qQmZBb1kweFcxa2N1aWJXbUJxbk8xbmRYcGpjWStp?=
 =?utf-8?B?Ymd0Z1dLUzNqOTI2MlZkOURSYTgvK0tUUmhCY1BFemZEczdCN1YxZXRzaHY1?=
 =?utf-8?B?a3FvNGRnaXpNdGRnbFd1S0FOenVXUzJpbUg3dGJjZlcySmNydGsxZ1BxR2Q1?=
 =?utf-8?B?L2R1RGtqQXBPZzBNNlE4WG5ERlQxb0ExMHRNaDNjT0haczRjOWJjM2hiQm45?=
 =?utf-8?B?N0FpSm9pYlRTRFUzNDZJV0FIVUpQRCtXd0xnT0t6U0taUkh5S0ZhQnF1c05Y?=
 =?utf-8?B?LysxeDVlTUtMN2xyellMYVBDbGZPREd3R2lhaERjNVVzbWlMMk9Udm9MNE5m?=
 =?utf-8?B?MEN6RmlwYXAzdXZBdnpjeFA0S0t6TFRuYkN0WW81d0JXN1lTUHBVMmgzK0xo?=
 =?utf-8?B?RExvQXhjaGkwMWZBc21LWXpqNnJQdmtybXFLU3NLQUpsTHdyQlF6cGVJaVps?=
 =?utf-8?B?YzI0d3gwQ01hTlFPUHNtbERlai9SaGgzR0dCL3U4WHF3bENxa1RPenRLK0R5?=
 =?utf-8?B?L0sxM04wSTl5dWtTZ2FVVlNtTlBUYkZBNEVMUUV4QXpCT2FOMG9qQXl6SmVM?=
 =?utf-8?B?OTVOY1JodTdRV0d5VXM2YVkyNFMvS3hlUWxrb0RVTGZUOTdPMVpPeGFiSmw0?=
 =?utf-8?B?dlFPRGwrWm83amk0ODhDR0NqdkNtL0lSYTh3T2l2R25GQ0FrZDZCU0hlZ2Nq?=
 =?utf-8?B?Y0RYMXdNU09Kb0N2TVFHcE1OamVwdnJhSzM2UVloMElhaFJTRDlVZUtYdGZo?=
 =?utf-8?B?TkhRL1VaUnVqZk1iZVRWdk9RWURpVmQvd1ZOY05jMzY3RU1jeGpHZXpUbE16?=
 =?utf-8?B?UlZnV0VvV3o0QVZySFdsMFM0NnZmRXIzUitnODhmM2J1cVF1K2dCdW1LRlJY?=
 =?utf-8?B?dmJFalFZc1Zaa1h1dWMwbVMxVmxNWHlRR1ZFV2Q4UUxKWTNmRnNKdz09?=
X-Exchange-RoutingPolicyChecked: gqyVktrL/wlJ7EM6PL3C/luWCe4g94zLO38g1aiTaPHrXkQosgaj5zSUsWvr27RsGMQYzzx1g34D3/v/L3TuRU2jS9rWlyeWQq43RXEvQ5aPQoxikGlclj4kFGuNGbc4aOkvuWqn4c9/hrR/rJTYnmt3Rah2LlSZbyYS3WDuSr4/ZOG8tza1KXme3G8Q5w/ON9oN5K3nWgSVAcZsDpRYmUJ748FQpdrOcWzo/d8TeBx3yR4WCXpg6jdSQ5jqGpbAPiTz6fPslKpUkYHZlxXxpnqtvGUl19vjI4voKbCSF8uVumMvi0CtzbL76JphNAkWidhC5HYWbJsgk7UqVdwmlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ea56ab-e44e-4428-8c5d-08def8543ffc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 09:29:46.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyEIEri0B4fEdaqEFUsgZH8OgsxpOEWOsK7TbXqSoNKMzfUcnjSa7UP5nAL94ISaNjUYt1jSOkGzrrsdmlQFtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9447
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


On 12-08-2026 13:54, Michal Wajdeczko wrote:
>
> On 8/12/2026 9:00 AM, Tauro, Riana wrote:
>> On 04-08-2026 21:26, Michal Wajdeczko wrote:
>>> On 7/31/2026 1:41 PM, Mallesh, Koujalagi wrote:
>>>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>>>> Extend our error signatures definitions xe_sigid to cover also
>>>>> hardware-originated errors and make them distinguishable from
>>>>> initially defined software-initiated errors.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>>>>> ---
>>>>> v2: update comment (Sashiko)
>>>>> ---
>>>>>     drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>>>>>     1 file changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>> index 99717fdf74a6..69cce4b45635 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>>>> @@ -159,14 +159,19 @@
>>>>>      * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>>>>>      * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>>>>>      * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>>>>> + * @XE_SIGID_HW: Generic hardware failure.
>>>>> + * @XE_SIGID_PCIE: PCIe interface errors.
>>>>> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
>>>> Add . @ end
>>>>> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
>>>>> + * @XE_SIGID_FABRIC: Fabric errors.
>>>>> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>>>>>      *
>>>>>      * The situations the driver detects and reports in software. Values are
>>>>>      * numbered sequentially, are only ever appended, and are never renumbered or
>>>>>      * reused. The tag in brackets is the default resolution bucket (see the `Xe
>>>>>      * Error Signatures (SIGID)`_ section).
>>>>>      *
>>>>> - * Firmware- and hardware-originated signatures are not listed here; they are
>>>>> - * logged as reported by those layers.
>>>>> + * Firmware- and hardware-originated signatures are numbered separately.
>>>>>      */
>>>>>     enum xe_sigid {
>>>>>         XE_SIGID_SW            = INTEL_SIGID_GPU_XE_SOFTWARE_START,
>>>>> @@ -178,6 +183,13 @@ enum xe_sigid {
>>>>>         XE_SIGID_GT_TDR            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>>>>>         XE_SIGID_MEM_FAULT        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>>>>>         XE_SIGID_IO_BUS            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>>>>> +
>>>>> +    XE_SIGID_HW            = INTEL_SIGID_GPU_XE_HARDWARE_START,

What does XE_SIGID_HW indicate and how will this be used? Why not just 
start PCIE from the hardware_start?

>>>>> +    XE_SIGID_PCIE            = INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
>>>>> +    XE_SIGID_DEVICE_MEMORY        = INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
>>>>> +    XE_SIGID_CORE_COMPUTE        = INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
>>>>> +    XE_SIGID_FABRIC            = INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
>>>>> +    XE_SIGID_SOC_INTERNAL        = INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
>> Nit: Maybe retain the same order as firmware
> do you mean the same order as in XE_LOG_LOCATION and XE_RAS_COMP?
> but there is a gap (no 3) and currently we say SIGIDs are numbered
> sequentially and only appended ...

Without adding a gap. It's a nit. so upto you

Thanks
Riana


>>>> Since we've resolution bucket for SW sigid so do we need resolution bucket for HW sigid as well? If so how are we going to put HW sigid to resolution bucket?
>> We shouldn't be having resolution buckets here. This is just the high level class.
>> For ex: Soc internal has multiple recoveries. I think the decision in 02/23 was drop resolution buckets.
> that's correct, in v4 there will be no [resolution backet] for any SIGID
>
>> Thanks
>> Riana
>>
>>> there was discussion about this already [1]
>>>
>>> and I guess we can add [COLLECT] here as an overall recommendation for all HW SIGIDs,
>>> as likely all such errors will sooner or later be reported as separate SW incidents with its own resolutions
>>> and official documentation will have more detailed recommendations (out of our scope here)
>>>
>>> [1] https://patchwork.freedesktop.org/patch/742246/?series=171022&rev=1#comment_1368419
>>>
>>>> Thanks,
>>>>
>>>> -/Mallesh
>>>>
>>>>>     };
>>>>>       #endif
