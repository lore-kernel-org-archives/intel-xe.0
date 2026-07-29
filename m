Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70BBC53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1BB10EC72;
	Wed, 29 Jul 2026 15:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/kpo7c/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7AC10EC72
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785337979; x=1816873979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hz2oL7i/5YmqduOpvc5cArl+zrOF8woDak9VlNBMz+Q=;
 b=G/kpo7c/DfatX/XP+bl8omNP4/9jzEDLfFLKbHSr0ZPcX21odAJLjebN
 w6Fddck3jTHgCzuT3RyCd23fnWCE/G78EPbu5iHoLhpP7KV8PYTTX3xIl
 3U5672TcFfBTyeJ8G8U9ta1/QSbHos9oF08srrzWKyqt376sFWQIv0x6C
 qepsZ+8Tl4ey5VFT0BiqArlXGq+US7683aM/RZ52yLMtjP9VLYdfdtN4W
 PsT+QhNQ0EI3iHv97Uov5FoNDsUYbAsJfV8EBQVDMKyFCeYHVN6grzLpJ
 zMUd7KwTGq0Op4rHOduWijzhODWkuQ/qivjGqv7VrKHrCRqRUkLw+kzwC Q==;
X-CSE-ConnectionGUID: 38xqFiN+RoaehKpZVomu7g==
X-CSE-MsgGUID: t8phr8xhSNGpusyhqo9A9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96306260"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="96306260"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:12:58 -0700
X-CSE-ConnectionGUID: oeM5k7tcQOahXJ8m3tY2Yg==
X-CSE-MsgGUID: J2aGeNDCR2OaMtJElxhw9Q==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:12:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:12:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 08:12:57 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:12:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUe1TjsJSshiQM38SlNadVvxGP/8V8qNLcYWFopmzUzZxkbuEzQfEqC8Gq/VLn53W+L+woYoVxQpJ2jVTlWlXHFWHXah1DV7GtXYE+Wy5ZZlj8DnYw3YcdRG3s7IKmLegwNm7SBSkztwVr4J+jUPaao68tqolmirkEb00VltjRquRU9U9dgcvkQKRZOd81HmUU+7hWTVjwb639/dK/gveLddf3D+1lgBlZZiSrkLwNGQQtw77NCSY27NrJblKKSLw7VLyD1xf8kPHQ/mIdps9t9DZghP0Q0vid8MQmvZVsKmTRCNLI/veZq+VJ1qKlcQ34rNeUWie23lNjeXJbcPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgDKIW6cgKju3Td7Ul+b1GOWjwiLmSZQMNZT2hskafE=;
 b=w5cBNHUnZEfLY0UIbguquLAXkqVwmknWG0DqsbMu3O9GBWRfHkkmM72g5LuxPIEubdn9dpZvxhnTraScaImZP/ij9nDWXJ3oxGBIfYhxTqlo1ZUZnvODDxEUoPqFRsJ9cpROyol3+TgDF/F/qD7NFInUD/HA/ZG16i1nc3nziyuv9cwu1Twob5HuwIEGbRUxqrKZSWMes3zf+2X0suhFFo8fukZSBFdFD+FGMn4Vgo6MpOFuWmgpNqYyd9hG26wQO1C80Qwe4fKTXG3IyO0PmaUgMEE0l3kemKqgb/mpQbt49RMPebf7Wg/dIYgqdNBCwtq1CjF0eo0OxEculRyOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB9658.namprd11.prod.outlook.com (2603:10b6:806:4dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 15:12:53 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:12:53 +0000
Message-ID: <7f8c055a-7ad1-4122-82e0-2f84b153b587@intel.com>
Date: Wed, 29 Jul 2026 08:12:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe: Add debugfs for IA/GT bias
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, Gupta Anshuman <anshuman.gupta@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260721175534.654743-1-vinay.belgaumkar@intel.com>
 <20260721175534.654743-3-vinay.belgaumkar@intel.com>
 <0cda2aef-1f9b-4a7a-9ec1-fe9e9a779435@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <0cda2aef-1f9b-4a7a-9ec1-fe9e9a779435@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: beded2e9-1169-4fd0-3f0f-08deed83dc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: M4laUNvLQOZm3RdGCrRgIrJX4bbMBn9Lt7HSPo9UGkU/aCDxteNCDCEOcd7Xn2BfWpTf1noonLCD7BEY0PlJ+eslz+722TioqHJlAMYYffuc2sn7fTJEDN9zw+A+gHlUvWaC3qATc12e21H32+ulUcx33OH4GBQ53JuGOTbpixtETYaarefONcqbVPdBZoEfR4RkYRZZb51WjyFOrpa05Kmbgtn5KXoGhA8UfVEd0JHDsZr1cUfydY1FrE3oum901K3yIlvAEcNh0o7Cyc3baAAnhVaraeY2cZj5EfL0V8q6ZiOK/gUZeGWo8l8tSWEnb+jYA8f5YiKOUOL56gWWjQltkGlMq7e+JlboGE5PUpMWhMwjauUOQId5hxA7B2z7nH0bhBEKbXbkH8pgxSLbql89bUHyP/6Tw0VDSIgLWdcr8tt3/x6JPqeT+Z7EcAq9qaopkGzKIadxl2sWcBG2AjnjkTRcO2ZWOccJO9wUJ4pi/DfTZurSowCYC40aL3ip0X+1Ot1BediAVRSRdWkiQJo10r3BzsF3233z4dGNhOgDPwVVGmGp/PS4ms3JOhUKWMqIuhf249eGmXjITxV0XpYGwx8Eti6dBbrA+E92r3thLuWs7cLPLB/ptJ2iV1vVCi+Mqy8hHthnIBZ4CaBPBaxMUFnOEn9sVIYEe/NFDpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUJWc1BGV3ozRG9CMFVRdHJQOXFEbElGM2hBNDhjSWFHWWlhU2I3OXgvUzNv?=
 =?utf-8?B?dHlFeWZZdDNYVkNRcGFrb1RPWTVjQ1h4Njg4ZmF4ZERlSUs3ZFZjcWlIb3E5?=
 =?utf-8?B?TUkzVWJZM0RoeE52OXJGVjRtTWV5ZGFKSWlVUVBzSitQeHhHSlJFeFN2MEs4?=
 =?utf-8?B?SDhvSXE2dmJSdHM4Q3lVaGk1NTRDNDkxWWM1M3phd1BxL0ZGVHlxZHo4ajA3?=
 =?utf-8?B?Yk5ja0JHQkxBNHRud01wek1TdG5sOFBaUExQeE9SU3VmSzVNaWFkUG1IRzhJ?=
 =?utf-8?B?RmJqNUJtUmlObXhlUmtHb3g5b3BzK3lVZ1ZMOWx1bkFlaWYzQWRWZHVxSUpH?=
 =?utf-8?B?aCtYT09qSzlyZ2tsQmJDYW5PbnVTWVNRVUp4QXF4VXo0MnpjZ1FJejFRck04?=
 =?utf-8?B?MHMvTkY2S1V3VnhLeU05Y0RtZGQya1BuUW80aUFnbjBIc21YNzBwaXdUNjg3?=
 =?utf-8?B?N21ueWZKTnBDWTBoakdhcXNqcDVxS1lraEh1d3lmV1VBWXBJZDVMUStzdGVH?=
 =?utf-8?B?MFkyam5PMm1RYnRtNFFBTWFkOS9IZGVsVmJYUjZFZjZQUmJuQmtSQ0lsbXZ0?=
 =?utf-8?B?bi8yaW0wKzM3RFVZVVBYd2s2Qk5Tai9aMklnRitDNHFQVmhGNnlWdWI0VHNE?=
 =?utf-8?B?S1BOd3NobmpxYUlWemNjQ3c5ZkdJMXRQY2w3enVpRS9GWDh4aTFjMm96UW9Q?=
 =?utf-8?B?dG1EL2l6dWhIRC95dGYzL3lubzEwNDZUekplZUZMRVc3ZDI5WlNVWEozUE1N?=
 =?utf-8?B?b2ZRZWpCZCtnTk52UHB6K0dzUG03WVA1d1JtWmlPZWZzcVd4SEdqeklLbWpY?=
 =?utf-8?B?ZUJVa2J0ZDdMalMyYVhXV1hiUXVnL1VKUWliMXBvc3VIZGxoZ3RPS0RCcUNH?=
 =?utf-8?B?eW9wR2lZSWlEMGIxK3dkK0E4ejlTQ2lCUkVrcVNYcEszbEgrTHVTL0szUzZX?=
 =?utf-8?B?bml6SW0rWExQZWpxd2IzaXhvMGRmcWhtQm5JVnNVeW5vYUE1SzBuWkhHMktP?=
 =?utf-8?B?ZkZHVGZsTDlGbmtCSCtxR2NvVU5Cbi8waGN2RnVKQUY1SFZXVG0vWW5Fb3V5?=
 =?utf-8?B?YjM5SWhVa2NpSFpSV2N5bFBXUGNYZjZ3YnpHK0xhWnNBZ2RBTzVHRW00d2Qr?=
 =?utf-8?B?bEZqZk96N1JjMUR1OTRtM0g4MkZEWjFwcjdyMjNEOHhhZ3VBM01TMElhcDdD?=
 =?utf-8?B?TElXRExXYkxpV3J1WHFyNVptUktaTnpJQ3ppZkRxYzRJWE1EcncwVERrWTBU?=
 =?utf-8?B?Z1dMelVIQTB1N1dPdVk1SmlXdGw3d2RUQVZURy9Tc1JwNzluTUNQRUJINjQr?=
 =?utf-8?B?Rjh1UTV2M01CTGsxTnNrSjVUWFhvUTU3L2IwUmQwYTQ0SzZVMyt2VTNnUG5Y?=
 =?utf-8?B?NE9aMks5R2tjMTFXekt3eVA5M1JMK3FyZnRVcVhTY1QzWHRPcHdlNGMxRGVO?=
 =?utf-8?B?dEk3V2JMcXZ3R0RNdkcrYW82ZlRFc3RwT2xNQWR6enJkVFZjWHM2b3hOdEZK?=
 =?utf-8?B?MXErM0YyTE5BYk5GWjAxQVBoaUR1OEhwRUNOY2VZVEF0aUFaQ0M1UFl2TjRG?=
 =?utf-8?B?NFUxNXA0TUR0UTVUVUd3dUJXdnRHdm9BYW8rNzlLTml6bUphLy9lZEljd3BM?=
 =?utf-8?B?aDVEbXdaU2lDV1FIZnNYWUhDaEYyUVIzdTR2SG0wN21yZ3FKREcrMW9vb3VN?=
 =?utf-8?B?Nis0YTZTc2xNbFJhODRrRVVpRFJuK01JUzZhODBWN3k5RUtqMWtOcEhsWEVG?=
 =?utf-8?B?bTFZVElxTXhMMHM4RmsvSkxCQkZXeEJlb21ISWgvZHFRUUVxR3U5YTczUlZ5?=
 =?utf-8?B?ZzRRWGxTUzZ2eHNKYi9HclBwcStFUjlZNkdFS0ZVcjBrSElWTmprOElKdEU3?=
 =?utf-8?B?bjMyZWtNczRQNWtHVW1vTm5xNmNsZmxJK2QyOE51aExHVFM1QXk4NG14NG14?=
 =?utf-8?B?SUZ3anBjbklmZUNhaUxONEpEVXZSdUhYK2VNZVE2UWJpdk8wVnNvV0VQcmp3?=
 =?utf-8?B?ZDRPM2Z0aVJSQXlTbEtjaEJ1eFVqWUsrZkdDMFgxaWNZSmRjSGVjOS91cVdu?=
 =?utf-8?B?dWZwK0hPaGw2eGFUMDRsUmJCWDk0Q0wvS2hqdzNQbHpNQnd3VGtiU3FHYTM4?=
 =?utf-8?B?Q2JNV3dIaitxUTlOUEZTa0RJSlNwa3Iwem1KaGpzTUJmQUpGTDBOVlRRUllL?=
 =?utf-8?B?SWRqS2d0bnFTaHplMzRuWm1GSW0xb1JXbWRHZDhxRlNEZzJkemFwd3JKSjZ0?=
 =?utf-8?B?eFREbHhSbjB5b3FEc3pSRnFVbE1MOTlUTnloakltK3hOUFA5QVgzTnBleTV6?=
 =?utf-8?B?TzM1ZGlpb3o3eHBTWDUyZk9EUnlMU3pHWk5QUGRoNTVmbllLeWQvNjJTazJx?=
 =?utf-8?Q?FC5ZtvXgzk79QT60=3D?=
X-Exchange-RoutingPolicyChecked: QzQRiDMkDWqnSIs/UbYZNBGjQu+jr9Sfs5s49uqBdAjk/e6RrGe5hxPV147pMNCoMJ2i9nD2PGwWzZYJ93yUq3fzxzAy+aDiSYJvJzzh6K5b1qZB5ML3Th4CitJW8cSm5X9IavO7zQaG+RCiT6madtM58C7H1fN8ru1tw2yChgLKmGJAyqCuYT88LUK1xqdvaf7rMWvmHhWEF8c1OMK5eVWeVSNNf3yYORQtrf8b1JDxxs510FHRjHjN9hMAGzJHmIyNupTzSowtjGRRj0mP1l2GaDsvPfuZsZqR4gyYxtM5UYsM7g0GPmSUUyPnArX5mHFX47MkkD8MU2fPDTY8AA==
X-MS-Exchange-CrossTenant-Network-Message-Id: beded2e9-1169-4fd0-3f0f-08deed83dc95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:12:53.2793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oTD54pntdc0uKuSh/7zF1ME1eTq0NazIzDnSdmMpqAe+DL+p+B20ea+cRx3tpU+i347eIkHWoBVMTEBHNdPl6NJhjNgYZenBVvndpQZmeqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9658
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


On 7/27/2026 1:26 PM, Anirban, Sk wrote:
> Hi Vinay,
> > GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> > Lower 16 bits correspond to IA and upper to GT. Higher value
> > indicates more bias towards that plane. The values are in U1.15
> > format.
> >
> > $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
> > 0x80004000 (GT: 1.000, IA: 0.500)
> >
> > This interface will allow us to observe power budget changes while
> > running workloads and also, if needed, tune it.
> >
> > Bspec: 51878
> >
> > v3: Add a helper function for U1.15 decode (Michal)
> > v4: Validate input values (Rodrigo)
> > v5: Comments (Michal, Rodrigo)
> >
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Assisted-by: Copilot:auto
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 77 ++++++++++++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 08251c7a1a4b..4f1404c6c209 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -634,6 +634,10 @@
> >  #define GT_GFX_RC6_LOCKED            XE_REG(0x138104)
> >  #define GT_GFX_RC6                XE_REG(0x138108)
> >
> > +#define GT_IA_PERF_BIAS_REG            XE_REG(0x138158)
> > +#define   GT_BIAS                REG_GENMASK(31, 16)
> > +#define   IA_BIAS                REG_GENMASK(15, 0)
> > +
> >  #define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
> >  /* Common performance limit reason bits - available on all 
> platforms */
> >  #define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index c38bcacb27e4..8e3ff50d71e0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -9,7 +9,9 @@
> >
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_managed.h>
> > +#include <linux/math.h>
> >
> > +#include "regs/xe_gt_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_gt.h"
> > @@ -22,6 +24,7 @@
> >  #include "xe_guc_hwconfig.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_lrc.h"
> > +#include "xe_mmio.h"
> >  #include "xe_mocs.h"
> >  #include "xe_pat.h"
> >  #include "xe_pm.h"
> > @@ -336,6 +339,77 @@ static int force_reset_sync_show(struct 
> seq_file *s, void *unused)
> >  }
> >  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
> >
> > +#define U1_15_ONE        0x8000
> > +#define U1_15_INT_BITS        GENMASK(15, 15)
> > +#define U1_15_FRACTION_BITS    GENMASK(14, 0)
> > +
> > +static void u1_15_decode(u16 num, u16 *i, u32 *frac)
> > +{
> > +    /*
> > +     * In U1.15 format, uppermost bit is integer value and the
> > +     * rest 15 are the fraction.
> > +     */
> > +
> > +    *i = FIELD_GET(U1_15_INT_BITS, num);
> > +    *frac = FIELD_GET(U1_15_FRACTION_BITS, num);
> > +}
> > +
> > +static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int 
> digits)
> > +{
> > +    u1_15_decode(value, i, frac);
> > +    *frac = (*frac * int_pow(10, digits)) / 
> (FIELD_MAX(U1_15_FRACTION_BITS) + 1);
> > +}
> > +
> > +static int ia_gt_bias_show(struct seq_file *s, void *unused)
> > +{
> > +    struct xe_gt *gt = s->private;
> > +    struct xe_device *xe = gt_to_xe(gt);
> > +    u32 val;
> > +    u32 ia_frac, gt_frac;
> > +    u16 ia_raw, gt_raw;
> > +    u16 ia_int, gt_int;
> > +
> > +    guard(xe_pm_runtime)(xe);
> > +    val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> > +
> > +    ia_raw = REG_FIELD_GET(IA_BIAS, val);
> > +    gt_raw = REG_FIELD_GET(GT_BIAS, val);
> > +
> > +    u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 3);
> > +    u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 3);
> > +
> > +    seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
> > +           val, gt_int, gt_frac, ia_int, ia_frac);
> > +
> > +    return 0;
> > +}
> > +
> > +static ssize_t ia_gt_bias_write(struct file *file,
> > +                const char __user *userbuf,
> > +                size_t count, loff_t *ppos)
> > +{
> > +    struct seq_file *s = file->private_data;
> > +    struct xe_gt *gt = s->private;
> > +    struct xe_device *xe = gt_to_xe(gt);
> > +    u32 val;
> > +    int ret;
> > +
> > +    ret = kstrtou32_from_user(userbuf, count, 0, &val);
> > +    if (ret)
> > +        return ret;
> > +
> > +    if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
> > +        REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
> > +        return -EINVAL;
> > +
> > +    guard(xe_pm_runtime)(xe);
> > +    xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> > +
> > +    return count;
> > +}
> > +
> nit: drop the blank line  to stay consistent with the other 
> DEFINE_SHOW_STORE_ATTRIBUTE uses.
ok.
> > +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
> > +
> >  void xe_gt_debugfs_register(struct xe_gt *gt)
> >  {
> >      struct xe_device *xe = gt_to_xe(gt);
> > @@ -378,6 +452,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >                       ARRAY_SIZE(pf_only_debugfs_list),
> >                       root, minor);
> >
> > +    if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> Do this feature also need specific IBC version? if yes I guess it's 
> better to add a guc version check here also.
No, this is independent of IBC version, this register has been there 
since Gen12 or earlier.
> > +       debugfs_create_file("ia_gt_bias", 0600, root, gt, 
> &ia_gt_bias_fops);
>
> As per the debugfs output the GT bias comes first and then IA, imo it 
> will be better to follow the same chronology while naming also.

ok, I guess we can match the register name.

Thanks,

Vinay.

>
> Thanks
> Anirban
> > +
> >      xe_uc_debugfs_register(&gt->uc, root);
> >
> >      if (IS_SRIOV_PF(xe))
> > --
> > 2.38.1
> >
>
