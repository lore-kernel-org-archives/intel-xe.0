Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D121C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 09:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C20E10F408;
	Fri,  7 Aug 2026 09:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjhXaqAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9576D10F408
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786093202; x=1817629202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MtfYEVNPzkvsX2LlhSByQRrcljwo6MbRRTLUQZDk0aw=;
 b=GjhXaqAKdoQs9bWWvVzmXQfqSbgAi/Xvwnj7djxjPCGHltLoh+Uxiymt
 DN5Rb0mjSuoEmL57bOUPn6RV8xF1wM0e/LuiVLSwj0AbOJQVJqnAhmBj3
 NVMikquPJK+CcNWLkUNwtrsq9J5zln5Cn9D/+X9xR9vbGrD1lfaRYaD6A
 6o7y12NM1zQR1XF7JWIB8Lvi6mIGQqTW8SLLb0pKrAxL3tFlcTOahVNIl
 TpZ/9ewXU6yRnDaA9gpiY3zbRzUAQYaRmVPSaGVFDGbdngpQ1udd4kkjA
 w6WX9bIYbonyHlrm+/5rprLIoNGtwv4R3UVkEe5gTCTRGNkR544RTpMhF A==;
X-CSE-ConnectionGUID: 30BK9xmPRTOroHjX25w6eQ==
X-CSE-MsgGUID: 6unwjsb9S/2JUvgU098/FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97293240"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97293240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:00:01 -0700
X-CSE-ConnectionGUID: u+XiY2WnTDG2GkhKDIik2Q==
X-CSE-MsgGUID: Nb0TR6qbSQ6rp0+p1bTBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262967345"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:00:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 02:00:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 02:00:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 02:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVmVU8cQtavjGMRqtYiTlTA1zQLbU082Zv4fmCfcOgl42wrcr8ffV/dgJz2LUAURAbP1L09ZlwZm1yWYKyfhFi59jIUiG/+1+iQq9q7GYmZUH/8J3ZRoemUIHFjnuqYqV0Ph0yDEhaVoTw1GtNWfDHJDkJjOpIfdJi+145WJ9ubOEAQs/VAOZYSRCAwCqvg5vdJ2EJB+MZ0ZRsKfiqka3qVvtg12ytw1UkfSj1AmAXGXj+SYU2S9jTTqV1Yx1Cfwabu6F25hrJAIIZeU1Kg96NiTF07g3BQ80heeRkaSsQOQH2IR07q/Gk1Xtktc7MzNRTRHVy7GGbJhKfFGdM1mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btkyZAHwbw5Pe/bKIWPb4kors/XJka1+G/RwxaeL4Js=;
 b=nJjNWje5t5i4LK54C3ZML3ZGFc7O9O2RiVF4F5+iJogwlFOwNd9uGLtHQg56b895Scm0kPvFzEOW8ddK+IQIR2LynA47o24W/+tY1adrMBgXy9L3CNXVFxO7VnA4iemWOo2fK4j0Aczw1mrG9ugHkUazPyMCzJHduDNKnKPSvmssRKEFFaaN8FVYzx0Ja/jRgKehAywea6HKk76qurCN/EiLcZU5xZJGtz5Kar/fyK2j32srmDhokieprMT5Pkdq4uwSW7MUYSKRs1vdy4SfxZe68V342Sy13Vsx69HV4+uhV9ogzmfMpvIw87tLY6rF4pG2fql3oUYt7dm7n8oOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:59:58 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 08:59:58 +0000
Message-ID: <515941e7-6354-4a25-988c-510c82742114@intel.com>
Date: Fri, 7 Aug 2026 14:29:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/sysctrl: Add better sysctrl error reporting
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
 <anTdKWZiIQyeEcY7@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <anTdKWZiIQyeEcY7@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a4c054-aad6-415d-1519-08def462417a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: cqFuxGCJ1zYRu0iMW/baZ2ngAlAfVetuFkpiITx99GNmHYD61ymcppdCkaUfYNkHFU1igrHhCeRmkLwaHRF3pV5sAIQ9C7vqqfUdbcpVCroxC2/GFzc0FrbqeiuAScHLyHueoKYOhhd+/YmCj5oOrJ43P3pwPXLYM0dGhMdPJNq3+DUqIfuebvoztM7gzm2c1S3Lwar1/TlYc64fU1FUo+sJMmqAOQBawXaTxXJ13A9mXroyIwge0AP5ocWQ3aMkIrk9qpkNh7KUsEJifYjcclNxdBLqRdMYupobdvmjUH8+eMQUYLFbrw6mDBROCSaS4d55m1fYKlBtihm9RC5WqbNg487JTe59Z0lvZpMU3ANoSiKGTpVzBYg1zGDQXaIufVzZKmXJ1+69IlvQ9vRqa215Aug68vJvzQjGGBfbGF0c7CTYsC5xIEydDtwyt2HOT1GVludYzgFw/lm6WKiGW9xjHcDvFGEZimFe9RneFEnM00DulfDI6A86a7tLlt5YuQfQLwBK7cFiDJUSx85K++VHeCWniywArjh3nWfKZ0IAHRdvToqVgtSE+3qI+Yi02RFrtnjV/8WzuKVjCQId0rFmzJF/nCgfwcDgdrIl//oqppntKImKBKLxh6z3oxfuWQc3NEqO0xNZbtUvLGCqzKprdkPFCCe+nzKASkJ/REM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHpCWGRueWdaSDVqcStGR0V3QUk0Mm1kK0hxMU93OHVnVHA3SVIwV2VaUldO?=
 =?utf-8?B?Y2NXWDQzNHJ1WVFKYlluTU5nTnlEMVVreGx6RXdvNFJwTGN6YUdZWFJCbWdh?=
 =?utf-8?B?NE10TEUzaHBBSTVkTnFObTM2cjVsTnFxK21lampQVTRyTmh6WmFqVTNEdStl?=
 =?utf-8?B?Z1pBT21FUmFPZGdKZ3pVaVdiNVl1TU01SHJnRjFsU0R0Rys3eWN0VGZ5TFV4?=
 =?utf-8?B?UXE1b0RDeWRoSEg4MFZvRjc1NWpzU3hIVi9pZ3hqdkNabTNQb0ZjeW9nam13?=
 =?utf-8?B?QlN2Q1UyM1hib2dodm5SMzBJMWY3V1B3b21yTUZuN25aMS9UaFZreGxSUWdR?=
 =?utf-8?B?blpCbVV3YzhkWHNIdVR3NWZocjhrVGRNZW4xdE05WjBOaFB0dzkyN0ozY0Ni?=
 =?utf-8?B?YWdVTURkSW81bytWb2l1TTFzeU5oMEFtNnowbXQ4MnBYb0M5U09KTklVVVFa?=
 =?utf-8?B?TGszOUNJWHVpMHdPcEdXbmxUUnNBRENSSi8wckt3cWpySkUxVkxoaVBXN3Vi?=
 =?utf-8?B?czdCZkoyaXQxejU3MlZacEtxTi9WbnNuYi8wTmJVeHNVNjdiMXM0NURWNG5r?=
 =?utf-8?B?bFl1SFJBVlVOK1pIYUlZMkZvMk1sbHZYR3IrRktPb3RuMFdNTG9DRkdIcXhn?=
 =?utf-8?B?cDU3SXN6WnBXUDNXa2MwMS9INm81c3NGYmVwRnA5alFjTUJEL2tWNUo1U1BT?=
 =?utf-8?B?R09YRis0bHVCRzhCVUd6eDdya1h5dmxOTVJDRkhxOVJaQTU1bGFYWFpzQ0l2?=
 =?utf-8?B?RmZzRDFXSTJIVlZvYlZZWFg4ZFRQbjNBcWptb1FrYkIyVGZBZVVsT0cxWlpK?=
 =?utf-8?B?dXBYZmx2c1hhNlgrLzNMT3lCRmlBdmpLQWtHUGw1VnkrOVhlYTZVTytWSzh5?=
 =?utf-8?B?dXNWZGFmNVczVmZLaDRVTitVQnlCYU5xZFVIQ1VPZDlWc2NvZ1lrOUN6dmhy?=
 =?utf-8?B?NUMyY2FjeTQ0TW1CS0pGbjNFbFY1dndMblZORFJiNEFpeGI0WDFZemRkM2l4?=
 =?utf-8?B?TFRRbFV2cit5cXM4Z25OSy91bGlJN2Y1N2U4NUh4Uzd3dnQxeU8yb1dYYXVY?=
 =?utf-8?B?Nkp2QTBKWmdkb1l1akRkUTM4OVQvamh4bEkzSGJlWDVERVVyLzV1bjRaMmcr?=
 =?utf-8?B?cHlnUkNzbFdrR24yQlVBUFJnVFJTY0RXUmp4UTlkOUI1dzJSS094M3ozNDN6?=
 =?utf-8?B?SnhZaC9rV0NYNUZpOTNrQSs5ZnVtdkppOXVJejI2NWJZRjcvWEdrU2xYaEVT?=
 =?utf-8?B?WUZiWXRPNDBGZUxBSHU3cExEYktWU2hvRUIxTjIrR0orRWJOcWg1cnN2YTR0?=
 =?utf-8?B?Vys5RlgxN3Y5Y2lHZ0lLL3kvTUM2d2dPRi8zN1hWZTVlaFNpcFZOazM5QnlU?=
 =?utf-8?B?U0dmVkJoQXdVWE5RZElYVmlmNW9UQW9laFFNejNtaE5oWnNRa21Nd2NNRThk?=
 =?utf-8?B?NEU5NzQzYVNkdXRTaWpnWWxwVVdWUmZmZ3ZsUDh0SUo0VytQVWlRTGw0cDNP?=
 =?utf-8?B?SVNjem1ua2RnZWVxVkpDSk5QWUV4c2lFNzNJNzJTQTg2YTlnWDd6YjJoeDZq?=
 =?utf-8?B?alhBTVVEMjFXUUVITlh5TFVFbFRHYy9LcjVaUGJCeWE0QUhsTTcwOGVCd3Ez?=
 =?utf-8?B?U3BrMi9USkNPUWxzZytBZTNOK05lSjdReDF6MCtQZE5uN3B1SGUvZWxIai93?=
 =?utf-8?B?RkVGNEhIYStWMXVXemNCS2tsVzFSdEp2UGRXakF6c05iL3RWbjI5SFVIbzRG?=
 =?utf-8?B?RUZDM05zN2srVUY2T2FBdFZwM0lDZUlRTXpHZEJIQlN6eFlsWnRIMkJ1TDI0?=
 =?utf-8?B?U3I3VDhrV1dEcGtabmNRNU9BODhrUDI0OUVkT1NoaCtzV2MrL2pEK2NqM0hs?=
 =?utf-8?B?VTNzTW5EczhDQ2xKYTlNQko0OFV3Tk9vWnRtMmtVcVpKN1grMVhnaks0U0pC?=
 =?utf-8?B?TnlIZWo5anF4ZlFEN25aN3Q2SXZVbGg5QnkySzdMV291RnZYNDdYMExpUUNB?=
 =?utf-8?B?NzFrZ1d1NkpDSzZDaW5NNUl3eVpPQVBWR09Sd3lpbWE4VThyaG83Z2NFMWdS?=
 =?utf-8?B?Sm52L1htVG1qN2FBQkJUTkRuN01HaGNpbDZxdjZRd2xRcDZJbVRHS1VHc2ow?=
 =?utf-8?B?ZWFFc3kxaExXMi9kanBtRlVDTUV6bGp0cUo4dDNNNXNHNVovdndpR2s2bFBF?=
 =?utf-8?B?SVNNMXUxdG1RaEZMbk96SDdRMGN4dmtCeXgvQlViY2tPOE9PUmFWTFV2NlBa?=
 =?utf-8?B?M2ZKUXZWWEsxZ1lEWTNmME04bCtXeGVhNEk2ZWtZbDQrRDFFa0VsZlMwd0pp?=
 =?utf-8?B?WERjWVNYVGtUL1NaYUVJdjZGVld4TlFFNFBuVUVQMFBDTEJLZkNJaFhyQ2JW?=
 =?utf-8?Q?NCgsMNCazoPxyVOU=3D?=
X-Exchange-RoutingPolicyChecked: CC1QqeOX/PcWOpaYRuJh6NiKPzuT+QByCUy9q8BE1UqtTNtvI54tgmC/e3Oa8D34C90mYvsx9ikYoHx00eVMiUaNooczmqBIFqLQljH6qVj7C2PS/TvE3N3UTzmMkQ0q/ATaQZ6O60gsq/NrFFVr1Gz3oSqOMQVtslDDLu5/dxYGTOIauWFfW7PyNjPbA5v6r2/AHjEHxNhQ1rtGJn75tTN5MzpC9nwutyxDBNfnMFWqbLAkDCbDy/C84c6f+txiBIxBCQPUdBZIwcqu0WxU6tTTuNtx8a3V4QYG1fe+4gQHTQJYLpM6BJxFQ3fRjh64nig46PByUMVS518Bv6HEXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a4c054-aad6-415d-1519-08def462417a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:59:57.9267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dou35FQKBDVtXrXybEIJ7hR1EKwxHnjk6eXCu5vFtnmdRMyBjPKTGtqSwuujsAq0qpaSejA0W8LJ7mmsH4hwr3dua4n/MZFqDYUG17MsQ48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
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


On 07-08-2026 12:44 am, Umesh Nerlige Ramappa wrote:
> On Thu, Aug 06, 2026 at 04:30:44PM +0530, Mallesh Koujalagi wrote:
>> Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
>> tools can reliably detect and categorize common sysctrl failures.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_sysctrl_event.c   | 11 ++++++----
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
>> 2 files changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> index da395148ee9d..1805a0b4d0d0 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> @@ -5,6 +5,7 @@
>>
>> #include "xe_device.h"
>> #include "xe_irq.h"
>> +#include "xe_log.h"
>> #include "xe_printk.h"
>> #include "xe_ras.h"
>> #include "xe_sysctrl.h"
>> @@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl 
>> *sc, struct xe_sysctrl_mailbox_c
>
> This seems to be running in a worker started from probe, but it does 
> not fail probe. Do we still need to report this as xe_log_err/SIG_ID?
Yes, we need to report all System controller errors using SIGID API, 
please refer 
https://patchwork.freedesktop.org/patch/743308/?series=171022&rev=3
>
>>
>>         ret = xe_sysctrl_send_command(sc, command, &len);
>>         if (ret) {
>> -            xe_err(xe, "sysctrl: failed to get pending event %d\n", 
>> ret);
>> +            xe_log_err(xe, SYSCTRL, ret,
>> +                   "sysctrl: failed to get pending event\n");
>>             return;
>>         }
>>
>>         if (len != sizeof(*response)) {
>> -            xe_err(xe, "sysctrl: unexpected event response length 
>> %zu (expected %zu)\n",
>> -                   len, sizeof(*response));
>> +            xe_log_err(xe, SYSCTRL, 0,
>> +                   "sysctrl: unexpected event response length %zu 
>> (expected %zu)\n",
>> +                   len, sizeof(*response));
>>             return;
>>         }
>>
>> @@ -41,7 +44,7 @@ static void get_pending_event(struct xe_sysctrl 
>> *sc, struct xe_sysctrl_mailbox_c
>>             xe_warn(xe, "sysctrl: unexpected event %#x\n", 
>> response->event);
>>
>>         if (!--count) {
>> -            xe_err(xe, "sysctrl: event flooding\n");
>> +            xe_log_err(xe, SYSCTRL, 0, "sysctrl: event flooding\n");
>>             return;
>>         }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index e13eebaac1d0..5c8edf9871c6 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -11,6 +11,7 @@
>>
>> #include "regs/xe_sysctrl_regs.h"
>> #include "xe_device.h"
>> +#include "xe_log.h"
>> #include "xe_mmio.h"
>> #include "xe_pm.h"
>> #include "xe_printk.h"
>> @@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct 
>> xe_device *xe,
>>     xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>>
>>     if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
>> -        xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", 
>> data_in_len);
>> +        xe_log_err(xe, SYSCTRL, -EINVAL,
>> +               "sysctrl: Input data too large: %zu bytes\n", 
>> data_in_len);
>>         return -EINVAL;
>>     }
>>
>> @@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl 
>> *sc,
>>     total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>
>>     if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>> timeout_ms)) {
>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>> +        xe_log_err(xe, SYSCTRL, -EBUSY, "sysctrl: Mailbox busy\n");
>>         return -EBUSY;
>>     }
>>
>> @@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl 
>> *sc,
>>         frame_size = min_t(size_t, cmd_size - bytes_sent, 
>> XE_SYSCTRL_MB_FRAME_SIZE);
>>
>>         if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, 
>> frame_size)) {
>> -            xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>> +            xe_log_err(xe, SYSCTRL, -EIO,
>> +                   "sysctrl: Failed to write frame %u\n", frame);
>>             sc->phase_bit = 0;
>>             return -EIO;
>>         }
>> @@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl 
>> *sc,
>>         xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>
>>         if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>> timeout_ms)) {
>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", 
>> frame);
>> +            xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +                   "sysctrl: Frame %u acknowledgment timeout\n", 
>> frame);
>>             sc->phase_bit = 0;
>>             return -ETIMEDOUT;
>>         }
>> @@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct 
>> xe_sysctrl *sc, void *out,
>>     int ret;
>>
>>     if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 
>> timeout_ms)) {
>> -        xe_err(xe, "sysctrl: Response frame timeout\n");
>> +        xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +               "sysctrl: Response frame timeout\n");
>>         return -ETIMEDOUT;
>>     }
>>
>> @@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct 
>> xe_sysctrl *sc,
>>     if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>         XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>         XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>> -        xe_err(xe, "sysctrl: Response header mismatch\n");
>> +        xe_log_err(xe, SYSCTRL, -EPROTO,
>> +               "sysctrl: Response header mismatch\n");
>>         return -EPROTO;
>>     }
>>
>>     if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>> -        xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>> -               XE_SYSCTRL_HDR_RESULT(hdr));
>> +        xe_log_err(xe, SYSCTRL, -EIO,
>> +               "sysctrl: Firmware error: 0x%02lx\n",
>> +               XE_SYSCTRL_HDR_RESULT(hdr));
>
> Other than this ^ one "Firmware error", I am not sure if we want to 
> report every sysctrl mailbox error using xe_log_err. Are there callers 
> in the probe path that are using these functions and would probe 
> benefit from reporting all of these?

Yes, all System Controller errors should be reported using the SYSCTRL 
SIGID API. In addition, probe path failures should be reported 
independently using the PROBE SIGID API.

This separation ensures that System Controller errors and probe-related 
failures are tracked and categorized appropriately.

For more details about the SIGID reporting framework,

please refer to: https://patchwork.freedesktop.org/series/171022/


Thanks,

-/Mallesh

>
> Thanks,
> Umesh
>>         return -EIO;
>>     }
>>
>> @@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>                       cmd->data_in, cmd->data_in_len,
>>                       &mbox_cmd, &cmd_size);
>>     if (ret) {
>> -        xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", 
>> ERR_PTR(ret));
>> +        xe_log_err(xe, SYSCTRL, ret,
>> +               "sysctrl: Failed to prepare command: %pe\n", 
>> ERR_PTR(ret));
>>         return ret;
>>     }
>>
>> @@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>                    cmd->data_out, cmd->data_out_len, rdata_len,
>>                    XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>>     if (ret)
>> -        xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", 
>> ERR_PTR(ret));
>> +        xe_log_err(xe, SYSCTRL, ret,
>> +               "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>>
>>     kfree(mbox_cmd);
>>
>> -- 
>> 2.48.1
>>
