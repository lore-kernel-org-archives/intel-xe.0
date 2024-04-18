Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA70C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 04:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324110F9B9;
	Thu, 18 Apr 2024 04:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCE9V2lt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6110F9B9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 04:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713415855; x=1744951855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3onW/xbxQHWX03P3lt2vlYF0S4tVpKP0FmTgR73E/uE=;
 b=jCE9V2ltQ7vwe8JkoSgQdIevun8UeEBhOWMa/3XOk1Br2r5oModUcD5C
 +Ncu4Fn6eApn6pJI030zP2JqaV7O5Huduqx9W2RzohidaNIvqzwc6SuQp
 6S5S9QXiACnfPFvcTwbd0UXqh2nJOzDMbfSgd2VeS0snwYdMC9aG35QEw
 G2LiZkqUeD8PQTrd9m4/IIA5zGiTdgYbGY2APKu+Wf01XyjFEHNGBI/5+
 TLSKQpRLpXda5J75SdBmdJEaTs0LsbfqCsmJiqbk3D7DFd62pW/C9N+4t
 UsD2DTuD+Wdvq4Z/zYRtBfJhQFITJxiikf5i2GRL4grYzEb3a9+o857zj w==;
X-CSE-ConnectionGUID: TyUfvQdgRwCkSwU7ke+aUA==
X-CSE-MsgGUID: veZjQxIHRsiCsLzSItv0tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9065020"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="9065020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 21:50:54 -0700
X-CSE-ConnectionGUID: h17dW4nQTmeqU2EsDwgDDA==
X-CSE-MsgGUID: W84fJl//QWuuwCy9zM8rSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="46134972"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 21:50:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 21:50:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 21:50:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 21:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ml5g3UMIRdKi83R8+RNe0JdKZ0mQh+p3t/KT3V0PiLl46kLwSFFNSPUoxI6oU5iH2hK/zlu+HoUIp35QekV6tpl3t9Zdz7VBBR76UxeNOzwPfEs8WGGk+i8DylyV28Uu5alci/+VJGngZvPFD4pUmEfSwg4dDLMFvwRzeiuWfEBhYqlDXY/0x1RLeh4Nhq4OHSWTpE1A7isMXO+85L7xBrY32A0xnJI5wbbCmFiSKyDrzzlLrWPg96nPTLNPkuDCnkVmqxBdlheKTMnpc4hvtsaWmB4oEQPdarEaDQjgY3uxTatukr7Ee0QxnhTmb157FuyNGzFBo24noN1tNYekHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsGxnyAGChSNiQ1c9f/hNKdsFv2XxNGfLNb6BgEX5Wc=;
 b=Z7lIvCAhIBPr2pqetWzPZlKmLwkH6yxeU9HUIYIB7GTwvG1dW7okGrAFN944ZdgQ4JJt6tg2C2YRmHCQRQZtUk7oaxL0lXxyRMD2cXzS3UnQDOUTmmSvd0ez3vSui35qFHYGLfgOf1jtY6ABbPOhrY7wc5Bv5sgyugWgPJc8GlRfZZjLUQrwHBexQ+806N/upJuZSw3pHchhped7cF4aBCekn8cxdcWeyzP/qGODhlxkKgHYfeTHU1eP27TN6k0CJIzDYGHlQ0Q38/OB1IWxnhQId2PXalMmPXC8wgNhGEThBMjTYAWLax7WXFTmWN1Y1Rszm5wTvBFFA3K9b5ScbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 04:50:43 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 04:50:43 +0000
Message-ID: <d7468fea-b5d4-4303-a179-70c297314e38@intel.com>
Date: Thu, 18 Apr 2024 10:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
To: Lucas De Marchi <lucas.demarchi@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::6) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 754b6882-a3c2-4447-e533-08dc5f631a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTV8lbyIZeLdzA/3fXY711858HheGdxEXLcMch/x/XSLcEWRDiFNh28L53fi7+g3VKacMPKFu8d08+xF/q5LVB3lwzAaN/ebjScWxKWQKvYPjUXKHgxcNbk1/wc0ivVomFEaqvxb4+hPCllVkZPGb9NiaLza/0i/YkbF5OtIxWxhvbzv430Rts4YF3F87SnweyaU9bAsChqeNSrXD0DgJgzNGBuBhrmfqkDFY7H233X0EfF++LuCGWJNrogrg/FLRxHn294gnSGf84TI9PMKheZD8P4mXw0tUbu1aE4+bMEav1EnksoTy1uZwduf4SV5pz1ExbM8xkKFg0RZoFEVMdBYpKdfEZfdBaoQEEAS71iRANsKJj0uvvUpyHjHif6gsvZCylZ5rMU7qdDgnur9XBaXFfoL38l56YQBw8E6CS46F7F9CukxfAbLmZKCmZ2EVnXsiRsfeasTwnDjQG6lCzzMD33y479GrFqIevbEkZca2afFSUGMF5AYn4njj2GghwIWGuwOm/XY8mBZkTmG7HRwyJfSTTIy4Xk9xsJne0VVRMLDHTx5H9GD7ErHl+Eh+WVFdqlRL5FE5d1M6JffD/PLUP2QZB77fwSpoE0Z0ZL5pYs9BYTUcd900V042NaztJh6SOZcctCP9+CxNn8KBSkkzdFWBE7v4Wm73jlQjfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0UxWFdNSG1uSmdXNWx6L08vYmc3VmYyZDUzdDI0V0l0T3ZlcCt2QkZyR01E?=
 =?utf-8?B?SGdFRDZPaVJJdUZqMmkydlBJRjh0NUJLdXJ5R2lSRFdTbWw3S25aa1RTUUcz?=
 =?utf-8?B?eTBQTUFDS3FHeGNDc3QxNGVTeXJOT1lUME5FZ0hOekE1MGlWOStsNGdabU5h?=
 =?utf-8?B?eUZwSjVlRWR3SlppK3lNYTdITlgzSG5aVmtXUWZtYUlzUFg2Ti9Ed0Y2akZF?=
 =?utf-8?B?Ry9jNklmWGlIdFA0ZXBabXhXMEVQeWpWbW5CU2RMazlUTjRxcU96bmZINU52?=
 =?utf-8?B?b0pYQ2NMaWxSczNPWU1UU0pKMTJYL2RteVJoT01GUW1CelhCNHJpcUEvdkRO?=
 =?utf-8?B?dmdUTzJScW1RbC92WVZjQnVOcUZVZ2prZ1hHSnc1UFloL1BEeFRCVUxsQUxP?=
 =?utf-8?B?NUxubmpSWXgvSXRwQzdRcHc2dVFvTTFGejd5QS9IOU5oZnRhcTkwTmNhck04?=
 =?utf-8?B?WStVWXBONmRRaUU0UmM5NU5QbzRhN1JlOXpHa0k5eFhIVS94MFUycDJVVmgv?=
 =?utf-8?B?aE0zbXU1aFpaODFicWEvTGR6RjFTT0pQZkNWcFlSMnNOejhMY2VrWGlqaFFh?=
 =?utf-8?B?aWxxaFhvcE1CRlVQOUxGdm1RaUlzNFZnNU05TDBxc2FrU3ViNVJhSENSQXJh?=
 =?utf-8?B?ZStpMmNpUkpDaEhHaGVScTRQUktWUGZLL0JWeVdtTEN0UFdiNGlsQU81bWlX?=
 =?utf-8?B?MHRubE00ZGRGSzQ2N2wrZHdhSjI0UDZrSFZsdVdNRkxkMkgyakFpTWY2T0dW?=
 =?utf-8?B?L2dzdmcxWi9oc3pKL3hZQ0JuQWdKcG53eVV3NmU0bXpxdFBTdGhFc05IRS9B?=
 =?utf-8?B?WWhkdHFFSURXckNRaWRXSTVSbVhqY0NsaU1oNDdITi9OSlhFOEVNMkthSjll?=
 =?utf-8?B?ZFM1YXdOUVhrNkVFSGEycHJWenpwWFl0RDlBaTdpM1FsR3lZQVJaekpiODV0?=
 =?utf-8?B?UDFVZy9XWkdiN0g5TEJTQU9JZWZxdXhoQndabng0SDZvY2FaaStjWkFHZ2NJ?=
 =?utf-8?B?Y0pFaERsUTFENjk5cWg4Zmo0cXNWRitpbTkzSC9NN2EzV2h1TlZGWG9Qb1Ex?=
 =?utf-8?B?Y0pSTHBpeTlZZ1NGbUcwSDIvSlo3SVJZUXI3cnFKcW5PaWU5QkZvaGpOdC9v?=
 =?utf-8?B?YXhscGdkY0dWVDhSTG1nYlozajFpRVNvUlg3MEp2SUdPNVp6VVdiSjNqZ014?=
 =?utf-8?B?aXdIeVRiVTFLUWVxMUg2bFdKd0RteUdFVlB2VkIyK2d5bHZXVDRTNVN0OGk0?=
 =?utf-8?B?K2l3ZS9QVE9zUG16ZDRvb2ZaaDlkSndHOFZ4aEpjWUl5Slc1elUwRXdkNGls?=
 =?utf-8?B?MTV3UFIyNVVueE9TQTJzOVBaN0RqRFM5ZFN3STNuOHh1d1pyRW0vN3NEQWda?=
 =?utf-8?B?VitvY3laVGROakVrVmMrZ3hQNU9ucE5DK0pXdVp2dWZKQkJ5enl2ZkkvaXNS?=
 =?utf-8?B?SzUzcWd3ZWNsSEVEV0F4VGVlYnZoMEJjSnRKZFlQVkwybHA2WTl0VldhdDA2?=
 =?utf-8?B?TFlCOW1RbHBRd1FraWFpcEVyZVl0a08xa3RRckFRcEZzQzNSOE45VnJRUk9r?=
 =?utf-8?B?UHJPa3NkZXRZdzZFdi9NOTVxaDJpUXBsb1R0TXRudnVYcVI3blVpWEoxY2Y0?=
 =?utf-8?B?alFZQjhRVDYwSEFIYitEUWFUVjJWZVNzbFJLODZHakswWkFYdElHVUw0TlBJ?=
 =?utf-8?B?Qm1KdWdvOUJYcVVKblZvU0pZdWNScEhVQmE1SG5Xc2hva0xaWWxzSW92Y2RZ?=
 =?utf-8?B?VGZmOVJJcXFVa2o0VGE0eUd6SDRKUldZNDBnc3F5MWV1bTJJYU1sTzE3ckJ0?=
 =?utf-8?B?NjdIY1lueUNCSXNkeTJIWWp6SytVaEV5RnU5d1JBa3pNc2w0cFQwTTE3T2Zs?=
 =?utf-8?B?UnBabElzTjZDY1RndTZnSUlSSnJVRlFOczlSZXdlZHdDWkZFa3hoZ21CODUx?=
 =?utf-8?B?K0JJM1RDTk9kSHdRakd0Uyt1TkZnL2FkSXA1N2NpWTdaMHNpSDFqNXduUDFP?=
 =?utf-8?B?dUQzK3N6aE9iRXY0T05wQzJTZG9tMkhaVjdnR0hTT2pqajVPWWE3TTgvRUhJ?=
 =?utf-8?B?YXJYMHJlRzd0c2NOaWJ3TmhvSEl4RC8wblhVa2R1SG0zVCtGdHNTSEhCaThN?=
 =?utf-8?B?L0VJOVVUd0hBREw1UFNvZWs5ZUcvRnA5L1g5UnR4OGVYVEtUb2NqeWNlZ0h1?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 754b6882-a3c2-4447-e533-08dc5f631a0c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:50:42.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkZMwwep88Tfu/HaBz+R0rVzXQU/ip2pymrhZQGWGSyaH/RgmodQGcF9eszAYgDcM+ygkYZpxvZ5nAg0ZteE3ZQut+0RzMIAUOZUDZQltjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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


On 4/18/2024 04:05, Lucas De Marchi wrote:
> On Wed, Apr 17, 2024 at 06:45:47PM GMT, Gustavo Sousa wrote:
>> Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>> Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>>> one specific for Xe2_LPG.
>>
>> I would also like to take this as an opportunity to discuss the way we
>> are currently arranging the RTP entries for the workaround. Using this
>> one as example, created a copy of the entry and edited the argument of
>> GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>> following the same pattern, mainly because we are grouping entries by
>> IP release.
>>
>> Do we want to continue following that pattern and keep the code
>> duplication? Or should we think of a way to avoid code duplication here?
>>
>> A very simple approach that I think of is having a single entry for each
>> lineage. But I guess that's not really feasible today because I guess we
>> do not have a way of expressing logical disjunction in XE_RTP_RULES().
>
> yes, implementing it was always something I considered, but then there
> was also the fact that when we have WAs that are on IPs that are not
> close to each other we may have subtle differences like registers with
> different offset or mcr vs non-mcr.

I see that some registers vary between MCR and non-MCR types. However, 
could you please explain how this difference affects implementation? As 
I understand it, when setting XE_RTP_ACTIONS, we simply choose the 
desired action (SET, CLR etc). So, I'm curious about the specific impact 
of MCR vs non-MCR in this context.

>
> There's also the implementation side: implementing the OR probably means
> increasing the size for every item so some of them can have ORed rules.
>
> The other option that I was considering was to eventually split
> the rules from the actions and follow a similar scheme to what was done
> in drivers/gpu/drm/xe/xe_wa_oob.rules (but generating a table rather
> than the current xe_wa.oob.c). The positive side is that we free
> ourselves from having to implement things in CPP. I'd probably gone
> that direction if xe_wa_oob had been done before the rest.
>
> Lucas De Marchi

-- 
-shekhar

