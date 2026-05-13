Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB72CD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AD010E2EB;
	Wed, 13 May 2026 08:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zhn7bzlz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2B10E2EB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778661806; x=1810197806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3glGYlFiG55pv8VOfnSog1RljJHjiKm4B0aXp5G8MAA=;
 b=Zhn7bzlzcQXDApClncCyjEu+HImDhFWusBoWHtaFLZVKq4pn52qVbEx8
 GslTOA7KWiBUHZoF6oRZr5CU48UcStWfqgZFAcTusx5OlPXnDRU59K8Oj
 S6Odj19nHo9QMpfvFk6oMCCY7s+m2iud5RSX/nRfiVUnT3tuyj0qN15HE
 LqAbaeXZCp2arP4vs9V7iBvq03U5F6IIuxtxNw8XMQEt+uSKF509JzPBH
 u+JIulNVYsvMs3Atf2FolHMPJ5a98pJi2VDu+VgAcQvM0xFDV8FLwhw3R
 wdlB3pwcWJPeMs14m9wtPc+T4s/sBVtwy4GtWQtUOutdcyfk8kke5BarC A==;
X-CSE-ConnectionGUID: NgclMKJ+Q/aSR5Eqdd8n/w==
X-CSE-MsgGUID: n9vmBUpvS+Gp/roDNQ41Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79534900"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79534900"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:43:26 -0700
X-CSE-ConnectionGUID: WazZ3n/hQsWvsHO0DeteOA==
X-CSE-MsgGUID: c2uGnkIFRjSbhC5WQU75eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237039499"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:43:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:43:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 01:43:25 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIOH4+p4VQZGfB3tyL3Kfj862PAapfrJersWvWn/Hp7PiMe9wVnwWwC/Oo4a6S7M1sVcno7mnODfoui3n60X16zyOEBwqzNzYULK2IHU7DHlupyop48BNP3yh5DuSjV47sX1Ic84tG5EPj9t9eVuJcVtE/3hul5JCzjL3lZ579wt+j6Si3zKsAiK3HcoyUgAv6guaWcV1K8txUYDrSKG1FEIuC7L9YnQjooZRO05pd3eoY10E1WulBlyd0TirLzKzt0dA/7boTcGyY7G5fHXRZgLFiJaKl+cBoQtjaiVu6sJi5+nNippukVIOuOSpStcyLIrmEi3pw8wx1wqiK66zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqzAuGJYxFOWGPNTZoy3UEE0czeVRu8n2xyybp+6SZY=;
 b=kiW9bL0FjHHz3j51EXyFLvCZb4foA6jIb7rjCwQ1KbIXZLBdkCObfhwyp2s45JQqf01wi2p6mQW9QUH9jwfqOVyCcDY/M3qobwj1/CJgJK8a4opkq5fo7cFJl5UbD/bvz8qeAIIfRIyYs0704Feg6iyoyWrXU7ywG5nf5jLg+qRNELhID7BQ81JxDNzY3pkqHN8cQ0TikgIYEAS4a1S23o9i0Pe0WkTJGwKT8u+imKIiwJIP1YtupGFo6lrkkYBaIy8CbZqE3k6xnPvOe5z5ogdVziYbtW8Ju0HMLr5FqtNzEjxhOZilGz3nkg0liksTTUSLXLr/LV64Ak1NFX9dVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 08:43:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:43:19 +0000
Message-ID: <0d803c2a-3fe1-4ff3-ae1d-918959d28c20@intel.com>
Date: Wed, 13 May 2026 14:13:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-10-riana.tauro@intel.com>
 <agH1Xch7B6Ube4_5@black.igk.intel.com>
 <c25d46c5-8c40-4665-9472-d1c84fbaf996@intel.com>
 <agK_DZZUfLKlzaBd@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agK_DZZUfLKlzaBd@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0303.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b03e822-e2d9-40eb-55c7-08deb0cbaeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /0hxFEfrB8bB0FRBSAmdmvQ/ze33+goanU1tXfURi212+KQWLBI7QrtI+iGUKgcdDL+Q3NBjcQ84y1aH/yUiTnTYIx4wxcrOEeUGomSaDllbxK7y7GtXByXDvFIShgYXsvtY/ylutGUvUTvwvHjZQEbokjtMq6yJWKMRRSZrN9nv5+qIddAPSpSPyDH3OdgJ6gsvJymXxtMKlW1hwuwhr5q8fqxoF+gi/lH/ErImaML+IizwWthdIDc8DszN5TPXDI7EIEa/kgXR50D7cYiu5ztVB3Y+Kp+i9KTqyxeAfik2E0qSCaQFqCyQMCnilBgGkIvYDC32Z4Dfrud1WgE1fm5111YTzHfiVTusBDyIOwBZ6MpWNsloYZ/uJNIrHyShYTllSajvdHCqSP/2K1gxhqns8dYq9pIB1DXpWMC/SFj2bsFLlbBdKjvCZmo8jVps4asm0hDpuKxeA2ivBIfbFlP1F5F+UXeJlqoLshAZlhXnhHM32gGSv7LQF6ccRmQad4Yt4sxeKM8iwHNGHrKWBho+8L8yoWHnPKneiLWXeptseSbH6rS7Je6yYP5oFob4Fv+U2TfSsnm8pKoF0kFAaWgnXl+Bjxfly+rYrsvymgn53DeN33OxHUP6JUvay9jXAqAHLM7jE9wWiyoUdaWL409T6I3uoandVpwFnbYA3aHNfV7EMhyhSugNZCEn1JlPOQ9LNDZimZ/+SQsUVTBoLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(3023799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDhrTUxBc2JTTW96dTgxVU1YVzFwWS9CdGQwc1dFYWxRVHBwWldiT3pVT2wv?=
 =?utf-8?B?QnJGdmJuRENvV0hlWWorZHVzR0VGVzRyMGRYa0FGdXBhWW1GYW5oNXNHNk04?=
 =?utf-8?B?WmVaVjlpajNhcElBdmI1d1I3ampoOWpzK2dBczU0TCszOForUFBYZGFvaXlB?=
 =?utf-8?B?d0pWQUtOQXVDTGZwclhMZ3hUTGlaSEJCaUNFZEFpRjFETkVpMzlTMG5ncU9z?=
 =?utf-8?B?NHdpbDBwWVJweHRZSkFaUHpTWkZrRllhWlJkaXgrMGFDOTEzazlXRDdIeDR3?=
 =?utf-8?B?SXE3Z1dRM2lyT01KOGIzalZ3dStZbzdKdjFPa2xGRnp6UFRTT2V6OXlDaU1v?=
 =?utf-8?B?czdBSmpNeGtLZmZHdWM1b3N6QU9tTXlBenVJeTVnSDN4QURzdStzQ2NkR1ZF?=
 =?utf-8?B?bGNGK0o5ZExVMU9nQ2NyUERteUpZZytIeUMvTXU2QWx3RlNGdmh4d1VQOXdU?=
 =?utf-8?B?a2NMYjBBcVNzaytIRE53N3RiRmY5d1hhc2dCWFpJOUQzMmpSTjNIWjJQOWhP?=
 =?utf-8?B?b3FOSWFRYzRaUzUyN210bmlPbzJOT2h2YW1PUzMrZUYzdHVwRW9ubEVKS1ZS?=
 =?utf-8?B?N01mVE45N0wxcFFRQVNqdEdaUGhOU2sremswZlFobEIyWE5uMjdES0diRXNQ?=
 =?utf-8?B?d2NHak5wc3l5U1hDSWNVcUFwY3hJU2dpUzhLYmNCU3kzckFQRjg4UVBIL3py?=
 =?utf-8?B?SG9QaVp3WkZEUTJmYWFvLy80OTJXR0VhMEI4dVB1enZpcG9FZ2NFZ0syYjVB?=
 =?utf-8?B?TUxvb0VKajkvbGdKejdCVE52L29sQzZ4QU1waVFzVXlzOHJOOXVNc3hpc1Fz?=
 =?utf-8?B?RURDWW95eVUvMTlHaTJ2UkczeFVHbytGbTRNTWxQUEpWamFmTlVFOFJ2Q0RV?=
 =?utf-8?B?cWlBSlg3SWQ4bUo2VXAvV1B1c3BRL0E1OFNxeUZSWkR2Q3I0QTk5TnVHNGgv?=
 =?utf-8?B?YkpXUXZmQXdoaUxsalF5M2o0MU04NkFHVjFkV011dmhzWlJvVUpsTnlHbS8r?=
 =?utf-8?B?bklsV1Y3Q2tkUzVTVk12cVlTd1U2MUNIWXo5dzJtOXRSYnRyZzRDTHJzTlll?=
 =?utf-8?B?aVZXSXRLWTA5WHBCd29tdy9tTjdGK0lXM2ppdUQvcnJwZGRMWkpkQ2s2L2tw?=
 =?utf-8?B?WEVWVzdPRkxXSFNnOXJuVW51NXFvK0d3QytnYVI3UVFiRm9mTXpDWmVwU0x5?=
 =?utf-8?B?RlFUeWNOb1Y0d210UVFURVpnT0FzbjRuQUVzL1gycUN4RlBtbFJiczRGSy9Z?=
 =?utf-8?B?UnNRZ21hTEcrTjVwZE5qa2x6RmRDdHA1R29ZSE9EaHdGQnd6cG8xMnV2Qmx2?=
 =?utf-8?B?dW50bWxySHlFV3FoTUdNdFlrTmdnVFZtY0NqSlI1amlMa0dXWWtIU0U0d21y?=
 =?utf-8?B?UDNheHZncVBUZTNSb3NocmFvMjhyQ3RPWUlZcEVNUGV1YUY0NHpWWnRqUWg3?=
 =?utf-8?B?MklybE5ZSnRBMTFtZGp3L3U2Tk9IY1c5TFBmSFF2cGMyMzE1SmxBN0E5UVA3?=
 =?utf-8?B?dG9RY1RSZkVaRW1PamJJdEZicWYxYTNVeDVmUitEVFJZOXdma20xMXpqbXF0?=
 =?utf-8?B?N0V5c1Vkd3ZWNnI1RStSYThlRFV4NVliK0RNK1dlR0RFWVQwNzlsVVBVdWhv?=
 =?utf-8?B?SzhrTzVKUkpMTFJnQnBWbEFyc3RVZTNQWS8yOTF2UlkwVXV1bTBRV1FVN0ZW?=
 =?utf-8?B?OUNGcHVBTklYSS9ONEVMSDA3eVh3bjJuaVRuR0plV1RPL2M2QXZTYlZzUFkr?=
 =?utf-8?B?YVBDMVkySzlHQVFqcmp2cUJubjFhUTBhUUx1VTBQbUhRK0ZqeFE0dU0ydWp5?=
 =?utf-8?B?c1kwSXpJWGgwV0Y5eWRySkZ4S28zMGczU2RtcWFLanVLVGFEY0drR2FSb3hS?=
 =?utf-8?B?dER1L29PMGxadHFpWExiTkJISXdtd1NwNVRidWtXTnFUdE14MWVieEFhYThU?=
 =?utf-8?B?SzdpZjNjMHJoYjVLbXNHZjBZSUkzb3lyR1JIN1RyRDVSdm5Rb0tzSEZvTWlr?=
 =?utf-8?B?Y3Z2dW9VVDljV1N3dVI5ZmtFMlNGSy8xdDlONGx3Ny9PTzF5dFZNbzdnRzFH?=
 =?utf-8?B?QXBsSXl1Vm90RkcrdWFuN0ZieTBaVHRlYTRTZ2w0RHlDd3dENmJjbnRDZFlY?=
 =?utf-8?B?N3hJZWljMnlJNnlBTkgzbmVZTnQ3UUlFbVlQdEVMSkdqald1VVJ1Z1lNMmMx?=
 =?utf-8?B?dDRLdy9CbVlOSWQxMHFwZ3ZBTUZ1Z2FybjNJWFFJRzZBcjZYcFNhODJQZFBp?=
 =?utf-8?B?bDJSWVkrWVNnYTk2N0RzM3dEVllmWGM3bHZBSWFmYnJrVmR2NkpPWlJlSjBi?=
 =?utf-8?B?bkUweDJNKy80U0VsZWZoTDhxM1Zjd2VRbDhtWGZ0ZmkxMTRFVkRzQT09?=
X-Exchange-RoutingPolicyChecked: b7fOmLjP8FDMsAkRzK5zkI1RVDQ6dt8UsPFGTqsodMBWv9g/rYGXLM4p/TwEiUNzUDADZ696VvdHDidrZ/5XbwENeyEWo6s8g1IQyP9KIsW7/Zayk7l6/AAfE8U8XvRMB0kW/Wn5yX8abR8ItqJsCVhWYTev17tK2I2AS/u+qWt0XiufQFhyB7DNzCWfp7R+C1LyGYDBrIzcQ6JQDKxty37PtbQXeguKG3UOn9AUj3XAsjSaCx/ov24eotYdxnHlauUZqPYRbJy24uSIKFmmKP1SqBaSjH1j7KIJvlK0t9GHowpUQVgxN+FcUv/UNvv4rtQkdK1aDshpOUnip6iQuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b03e822-e2d9-40eb-55c7-08deb0cbaeed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:43:19.5010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeFdRGeyf+iTjsLx7E7OG6UcvY8DrZ5HtqgOmCbfgTacsg8CsO1jZ0GkwBzFM2JMuIu2r7llxRHa8QHL7cBpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
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


On 5/12/2026 11:17 AM, Raag Jadav wrote:
> On Tue, May 12, 2026 at 10:57:50AM +0530, Tauro, Riana wrote:
>> On 5/11/2026 8:57 PM, Raag Jadav wrote:
>>> On Mon, May 04, 2026 at 12:26:17PM +0530, Riana Tauro wrote:
>>>> Add request/response structures and helper functions to query system
>>>> controller to get error counter value.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> v2: add structures for clear counter
>>>>       move commands to sysctrl file
>>>>       split functions
>>>>       fix commit message (Raag)
>>>>
>>>> v3: fix log message
>>>>       squash patches
>>>>       change error code for sysctrl error (Raag)
>>>>
>>>> v4: rename function
>>>>       remove unecessary macro (Raag)
>>>>       add documentation for enum
>>>>
>>>> v5: rebase
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_ras.h                   |  4 +
>>>>    drivers/gpu/drm/xe/xe_ras_types.h             | 30 ++++++
>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>>>    4 files changed, 127 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 4cb16b419b0c..47a58ce3b3ca 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -4,11 +4,14 @@
>>>>     */
>>>>    #include "xe_device.h"
>>>> +#include "xe_pm.h"
>>>>    #include "xe_printk.h"
>>>>    #include "xe_ras.h"
>>>>    #include "xe_ras_types.h"
>>>>    #include "xe_sysctrl.h"
>>>>    #include "xe_sysctrl_event_types.h"
>>>> +#include "xe_sysctrl_mailbox.h"
>>>> +#include "xe_sysctrl_mailbox_types.h"
>>>>    /* Severity of detected errors  */
>>>>    enum xe_ras_severity {
>>>> @@ -50,6 +53,23 @@ static const char *const xe_ras_components[] = {
>>>>    };
>>>>    static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>>> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
>>>> +static const int drm_to_xe_ras_component[] = {
>>>> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
>>>> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMP_SOC_INTERNAL,
>>>> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMP_DEVICE_MEMORY,
>>>> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMP_PCIE,
>>>> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMP_FABRIC
>>>> +};
>>>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);
>>>> +
>>>> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
>>>> +static const int drm_to_xe_ras_severity[] = {
>>>> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEV_CORRECTABLE,
>>>> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEV_UNCORRECTABLE
>>>> +};
>>>> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
>>> So we don't accept new entries unless also added in uapi and vice versa
>>> which is good, but if you feel the need to have bounds checking just
>>> switch() instead.
>> If i move this to switch, there will be inconsistency with the component
>> array.
> With switch() I think you won't need an array ...
>
>> The component array has multiple entries so array is preferable.
>> Also bounds check is already done in upper layers for this so not needed.
> ... but fair.
>
>>>>    static inline const char *sev_to_str(u8 severity)
>>>>    {
>>>>    	if (severity >= XE_RAS_SEV_MAX)
>>>> @@ -66,6 +86,22 @@ static inline const char *comp_to_str(u8 component)
>>>>    	return xe_ras_components[component];
>>>>    }
>>>> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
>>> This looks like it should be a sysctrl helper (for non-RAS mailbox users).
>> We do not have any non-ras users. We can move if we need it
> I thought we did[1], but I might be missing something.
>
> [1] https://lore.kernel.org/intel-xe/20260320072528.1780651-12-anoop.c.vijay@intel.com/

The header is different here. We can move it when it's actually used.

>
>>>> +				u32 cmd, void *request, size_t request_len,
>>>> +				void *response, size_t response_len)
>>>> +{
>>>> +	struct xe_sysctrl_app_msg_hdr header = {0};
>>>> +
>>>> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>>>> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd);
>>>> +
>>>> +	command->header = header;
>>>> +	command->data_in = request;
>>>> +	command->data_in_len = request_len;
>>>> +	command->data_out = response;
>>>> +	command->data_out_len = response_len;
>>>> +}
>>>> +
>>>>    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>    				      struct xe_sysctrl_event_response *response)
>>>>    {
>>>> @@ -91,3 +127,58 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>    			comp_to_str(component), sev_to_str(severity));
>>>>    	}
>>>>    }
>>>> +
>>>> +static int get_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
>>> s/error_class/counter
>>>
>>> Single word parameters usually help with wrapping but ofcourse it's a
>>> personal preference.
>> okay
>>>> +		       u32 *value)
>>>> +{
>>>> +	struct xe_ras_get_counter_response response = {0};
>>>> +	struct xe_ras_get_counter_request request = {0};
>>>> +	struct xe_sysctrl_mailbox_command command = {0};
>>>> +	size_t rlen;
>>>> +	int ret;
>>>> +
>>>> +	request.error_class = *error_class;
>>>> +
>>>> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
>>>> +			    &response, sizeof(response));
>>>> +
>>>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>> +	if (ret) {
>>>> +		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (rlen != sizeof(response)) {
>>>> +		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
>>>> +		       rlen, sizeof(response));
>>>> +		return -EIO;
>>>> +	}
>>>> +
>>>> +	*value = response.counter_value;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_ras_get_counter() - Get error counter value
>>>> + * @xe: xe device instance
>>>> + * @severity: Error severity level to be queried
>>>> + * @error_id: Error component to be queried
>>>> + * @value: Counter value
>>>> + *
>>>> + * This function retrieves the value of a specific error counter based on
>>>> + * the error severity and component.
>>>> + *
>>>> + * Return: 0 on success, negative error code on failure.
>>>> + */
>>>> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>>> const for consistency.
>> We do not need const since it's passed by value
>> consistency ? the upper layer does not have a const
> Then perhaps u32? Anyway, I'll leave it to you.

We have both ras severity and drm uapi. So there might be a confusion.
So i have added the explicit enum. If anyone uses this function, they 
will know
what to use based on function parameter.

Thanks
Riana

>
> Raag
>
>>>> +		       u32 error_id, u32 *value)
>>>> +{
>>>> +	struct xe_ras_error_class error_class = {0};
>>>> +
>>>> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
>>>> +	error_class.common.component = drm_to_xe_ras_component[error_id];
>>>> +
>>>> +	guard(xe_pm_runtime)(xe);
>>>> +	return get_counter(xe, &error_class, value);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>>>> index ea90593b62dc..74582c911b02 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>>>> @@ -6,10 +6,14 @@
>>>>    #ifndef _XE_RAS_H_
>>>>    #define _XE_RAS_H_
>>>> +#include <uapi/drm/xe_drm.h>
>>>> +
>>>>    struct xe_device;
>>>>    struct xe_sysctrl_event_response;
>>>>    void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>>    				      struct xe_sysctrl_event_response *response);
>>>> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>>>> +		       u32 error_id, u32 *value);
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> index 4e63c67f806a..74d85875cd63 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> @@ -70,4 +70,34 @@ struct xe_ras_threshold_crossed {
>>>>    	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>>>    } __packed;
>>>> +/**
>>>> + * struct xe_ras_get_counter_request - Request for get error counter
>>>> + */
>>>> +struct xe_ras_get_counter_request {
>>>> +	/** @error_class: Error class counter to be queried */
>>>> +	struct xe_ras_error_class error_class;
>>>> +	/** @reserved: Reserved for future use */
>>>> +	u32 reserved;
>>>> +} __packed;
>>>> +
>>>> +/**
>>>> + * struct xe_ras_get_counter_response - Response for get error counter
>>>> + */
>>>> +struct xe_ras_get_counter_response {
>>>> +	/** @error_class: Error class counter that was queried */
>>>> +	struct xe_ras_error_class error_class;
>>>> +	/** @counter_value: Current counter value */
>>>> +	u32 counter_value;
>>>> +	/** @timestamp: Timestamp when counter was last updated */
>>>> +	u64 timestamp;
>>>> +	/** @threshold_value: Threshold value for the counter */
>>>> +	u32 threshold_value;
>>>> +	/** @counter_status: Status of the counter */
>>>> +	u32 counter_status:8;
>>>> +	/** @reserved: Reserved for future use */
>>>> +	u32 reserved:24;
>>>> +	/** @reserved1: Reserved for future use */
>>>> +	u32 reserved1[56];
>>>> +} __packed;
>>>> +
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> index 84d7c647e743..b315847cbf64 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>>>>    /**
>>>>     * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>>>     *
>>>> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>>     * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>>     */
>>>>    enum xe_sysctrl_gfsp_cmd {
>>>> +	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>>>>    	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>>>    };
>>>> -- 
>>>> 2.47.1
>>>>
