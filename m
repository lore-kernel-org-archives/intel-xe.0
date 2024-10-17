Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7DBD3C525
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 16:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03AC10E886;
	Thu, 17 Oct 2024 16:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfcwOPqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6A310E886
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729184040; x=1760720040;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UywmsIK4xT4SWN87EWGiEgK+K/XfJWRmAyHuZwlhV/g=;
 b=BfcwOPqT8S+KM9QLDpChT8kj1nUql2WqNrFtpweGgvJyTxyvZJje9vWE
 /F2Lf/kSihJoAbjjklkNwra9sChoY/QGYPfgoXtNA+gepfQJhXMgdadKM
 7gve68KEhV9NY4fl09aGoYnMbu4BO96A1++dyrsCsN4I50DhaGquuZnho
 n09Jx0a81E7nooSn8LILE4lzTiLAKsiTpe4kne7N/1xJjPTg6PHDchupW
 WeY/0QT07kBTADyOqsxjY3MC5cVFrRzbqyYR3ZuUFFhElR8nBABQea9Tn
 vSc6W1/G6hsyQY2CRg/v4wSjhGt/K/MUMT/3YvvakdiYn9HpE7omsU02U A==;
X-CSE-ConnectionGUID: eUiGdM8TRXqqdypYm4NUug==
X-CSE-MsgGUID: m23+zrVkRDucJBewFfnAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="39320116"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="39320116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:53:59 -0700
X-CSE-ConnectionGUID: mJD/9RtnQ321YAoqxbLETA==
X-CSE-MsgGUID: A6x+EbZ5QvOydRzMty227g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78279676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 09:53:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:53:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 09:53:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 09:53:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H94Qq3hd/iBfiM9raS2qe5QraGTbWMppc5Rv3lDKMEfE2Yz6tQY0f2hjGcGGG+B44YKRHzYJzYWpVFRaNUcKt43sohE8oOL1oE/+S/2MMbExQf3ghzJ4Gwm889HD/DcVyZe56nTAmquaP3pQzZxRhIK6wVXIZpLOVLVZepPwMQ5xQnVdqKtU5VRtHtceZzYRWO7EkufEToGHgwc2/JNzqs339ZtXac5MyrpUwiFOTWodlU1jShCWPygl+Oa8pILejh4yyr01jJSvN0zmccsUtrxc8KOjntsyvfP0/0R7+fixWo97zRRRRyeThxGBcZCOBqvTNmPLzTwXufDLe1PaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is3Rd3y1YrKOFU9HDugE6jfYwFTlNa6bOi+sx3dD+A8=;
 b=sfHiCWvE5L6Z7a8KfKW6CyMslWspgsvzPY2CAdRNMuWnCyJtX5Xe1pwSYfYtvgeGXZnmSryUYs/C47K3xpNJPwsLboewVqVgqr85bZs1/CYuhNTdzceNUenzSq1PmSbsWHGLd4p1cXMkW2Sf1QHHcV2FTx4gX/nL9r9guHGT0/mtNhHpxVpf3h6Sl78NP8Gam0siFaLRf9Kbdug2Nmd8s5ICJUq6QIrq/gkNMf8ZC/GhBJ6QhJJkTZZBnl6D/HlpVbivih4QdxjseiVjkulXFPH937iaKytEGILvaqF4pTZQCdfiiEoq3cFxwWJikb1A7HbXfyhLEK1PZdUBp/iztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 16:53:55 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 16:53:55 +0000
Message-ID: <9abd8034-abd5-48da-b5af-ec2f24bb0795@intel.com>
Date: Thu, 17 Oct 2024 22:23:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Workaround for odd panning for planar
 yuv
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Garg, Nemesa"
 <nemesa.garg@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240930112146.2673086-1-nemesa.garg@intel.com>
 <20241016072436.261438-1-nemesa.garg@intel.com>
 <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <SN7PR11MB6750713F83272902F5472C03E3472@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: deed6b11-60b3-4437-b673-08dceecc4949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clloYnpVNG5PQnhMUVVNTTFENHpGcVdYZW4yNVlJM2EvV0Q5L1ZrSWIvK0hM?=
 =?utf-8?B?WWZvOUFNZHEzSWNlV3p0RWpVWUp4RDdkNzdCa2RvdnFQY1dvTlREaExPRGsw?=
 =?utf-8?B?b1Fha1MyczI2NXd1SFZTTkpqUEZaWFdHZGpnd1puaWJvZHl4dFpBSEtwNmhy?=
 =?utf-8?B?NkJUbWRwald6OW9HaFZWM3dxNGRqVDBWM3c1OUFLTGRLck83RElsREs3ZWlW?=
 =?utf-8?B?Y2xJZWhHanFyN0czYS9NTEcyaU04aVVnTzQzTWdHbEYxUm5sS0xhelQ2M0xM?=
 =?utf-8?B?RU9INkVtWWREV1prbk5SL3pMKytrU2FLSm5xQU5FSmhNZm5BS2liQWxkNTJB?=
 =?utf-8?B?ZmpJV09QclJRSnFFN21MQ1FNNyt5U25DeS8wUlZnTmIwYzBoZkRBZVNzUjFE?=
 =?utf-8?B?ZXZ4ZTNpaHlwWnR4NzZqSEdYdStPTUhQaHZleWpiTzZiRU5Eem1hVEU4Y2tO?=
 =?utf-8?B?ZnEvVys4SWhyT1ZYb2lqNFA2dFV6TjdXWU5yYnRtSzJuNlNpMUJnWm13enp2?=
 =?utf-8?B?NVBrUWNLaFJaSm9wQS9PNnNFRXM0cnZ2RTJrVGdJbTBtU1RoQVhaNDVIZ0E4?=
 =?utf-8?B?Sm83N2UybHUrRms5b2tibVlYY3c3cGkrYmhzb01ETXRMcHBaclFaeFFZNmJ1?=
 =?utf-8?B?KzlxVStYL3puK2NSbGFVRURZVFBYeExHRHFPN3VLZFJyWEFOYzI2a1dLTWtU?=
 =?utf-8?B?d0pQcmtzTFk2UHdhSVFRMEZ5Wm5aSXVKWnpObjhPWUdlUFBuNWJSZXROTWRz?=
 =?utf-8?B?RmprZEwyMktPUk4zaHk1TVRTR1ArY1NNaThVdlRRTE1JU0FZZElwVEpncmJn?=
 =?utf-8?B?L2FKWWxBazBUQTYvN0JWTjlhd2toNVFTZUhDR0dxdG0yZmEvSGN6TnFDZ3dh?=
 =?utf-8?B?K2tiUUtYT2V4Nkx3UXh0Z0piSEs3dDlWNThyQVRBYy9GK1RaUjR3S3EvRU9q?=
 =?utf-8?B?dzZHckdBeVE5TURIcXBVYlRhZ3kwdDlCYmcwM2l0Rmh4WCtleXFCUDB0S21m?=
 =?utf-8?B?RGo2SmRSWFk5R2tudVRJRm12eEwvSjdXRzRnVWYzMk9tUjVnZG1jYVlheUhS?=
 =?utf-8?B?SUdleUFPZXB5bm16ZVF3M3E5Tm4yUGdnM0UvS0NnVnA1S2hmZE41bmMwRDY0?=
 =?utf-8?B?R1E5eFNtb0xBWGRNREZ4WWlXN1FkOUlRdE9pUGdSZnVjYzI3Y3ZLa2daeW93?=
 =?utf-8?B?WG42QkdHOEdIMEJTN0FQd1dqL0RpR1RMM1FIWlFkbnNkckRkakFkQU0xc1ZW?=
 =?utf-8?B?Y1Z4NzErbzBCSnZLQTFDb3IzdnYxRHhETEJHMTcwK3RLbDhjbFFKKzVQWkQy?=
 =?utf-8?B?TzdDa2NYZlA0R0NWam1TZnE1b2tFWnpjckRsNlhncG44dmc4TXIzUGI5bU4y?=
 =?utf-8?B?OFg4bXVZRWpYVmRSTzJsd2RVSUhxdzc1WFl0S241cnZHOG9QZnc1QTZsSFBt?=
 =?utf-8?B?UXYyVVhyaTdhNVhtNmZzM2N1SUoybldVNzVRNllUMHZmNFl4dU9rNDFqM0hH?=
 =?utf-8?B?NkVGT0FTd2RXejBYZUJXd25ZcGs4SFpCZmQwUFNVTkttbUdhMXpDYStnSVB4?=
 =?utf-8?B?NHJwSXNkOUlKclJZajFtemJxaUVLM3B4ejYxWDVjWjJwQmlXU2lobTQ3RXJY?=
 =?utf-8?B?eHpzQ29ORk9WaWY3TE9QNWZ0KzE0MW1aaW90SHVFNVUrd1YwMmFmU2s1NklK?=
 =?utf-8?B?bVFaaEpUMXBCVDk1cHVWczJESUUrV040czg0QThiY2tRZUZYTEJPRk5MZHZS?=
 =?utf-8?Q?KQp0q9Wh0NyTTnji+HaeQMq7cMWcg/krPp6bFBF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JzYzA1YkhhT242MjFSeE1LbmRSaVhnZVZROXY0OE5HSWFPT2VNZUQwbnFR?=
 =?utf-8?B?NCtITFpXR254U3FsZ0ZDdU9JcnlyTmJPdk9BQXdFMHF5U3JGdWJHSzhPRXdT?=
 =?utf-8?B?cWpBUmprUzlrNGxyQUM2WHphYUw4NXBSYUhMWGFsZ2RtRVpXQ3B3QWJYYXdl?=
 =?utf-8?B?d2I3dk9mbnRXWldzQVNYbHRCMFQ3NElZUWZ3UmtmWU5PakdFc0hTZ2VjaGFM?=
 =?utf-8?B?ZDRDK09jdDJFeU9acVlLRDA1bzR1RTAzMVNZcjFuOEVQT0lJK2N5VmY1S3h0?=
 =?utf-8?B?d0JkRjJZbG04cS9OM2JqaTVTZUY1OTZGKzFEVFB3azZrM0o5NGhKK1VMOWll?=
 =?utf-8?B?U0JIL0IwZnZrV2J5bEJCSmllS3FIV3FickM5ay9NSE45eE1SdEVqTUUxN0pD?=
 =?utf-8?B?eU15Z1NVNHJIVHFRb1pCeUU3V2VvRW5JYUNRcUZCbFZYME9YeHh1eVNXMkVs?=
 =?utf-8?B?KysySWNPK01aSzdNQTlYL0NQZ1BPVzc4WVd4VGdKNWFETTJyMWFrbVgxMXJ6?=
 =?utf-8?B?ZmhLNndkNlljVU9VeG9YZWEyNGpMdE1lV2hMYXJWUXFSTitEWHNSdzY4Y3Qv?=
 =?utf-8?B?SFZ5ZnMwZjhLLzhnZDI0ODRsNHlRRXR3ejcxQnNzWGhUQzcrajdCZ2ptQmMx?=
 =?utf-8?B?dWZYa0lZak1RRlVscGlhZzRGMnBqYWJNQWNkZVdodlZFZVZMWFRkSDF6eG9t?=
 =?utf-8?B?TDNQcSs1aFVkME9JTEMyVnV6MVlPQW03TVlkMTMvOGJGSGdmajZDblp0eUg4?=
 =?utf-8?B?NVpuS2g3K0RrRFBicVEwaVB5STdHamFQTkFVSXJSRVlMcWF2cHJZNU1Ma2RC?=
 =?utf-8?B?UjRmUmRsdkV6OXc1M3BPS25oNzgxYWViOFBWdFh1dTRYekdxTXg4ejRXdlFZ?=
 =?utf-8?B?UUdONE9ENE4zMHAwRFpDRHpCQldORmFSSE5rY2dSN0xqMDNiSSs3NkxOdmxv?=
 =?utf-8?B?L0tGNmRqem9qTTFvSGp3anBzNnV2Nko3SExhSG5DRDBBN2NqVFFsNnBwZ1NM?=
 =?utf-8?B?QVd6enF1VThYdFNCajhFMFZEUUNoSDExV2V3cnNtMHBJYUV2RkYzZHNIL0VV?=
 =?utf-8?B?a051TnJlYmdYanFMekNhUWhSYS9vLzVwU3o1TEhYcEtnNzVMcVVvam0wTTVo?=
 =?utf-8?B?SitpSTZ3eDBxSXlnc1NoRFhVOUlsaHE0U2xLRmxhTGh1U0Q1TUo4NDgyc2Y4?=
 =?utf-8?B?SDNHbDFTY2JhM3pHNmYrdmpKc3pBdUhKU2hUcGFkYmlMQXRjSXJ1Z0l5QWF0?=
 =?utf-8?B?Yk9YRHdOVnQyNERRdHQzWXVzZ1hQVFNGTkpoMmo3WE5GTCtKYXEzMjhidkNp?=
 =?utf-8?B?c1c0WWlpcW5ERWJ1M1ZoMitIWlFiMGIxU1o4TmFCUDdtRlpKbCt0alJEcWhn?=
 =?utf-8?B?WGV6d1FpVmd0MUcwR2dCdjBZVXh1dEFITUl3UDJ4L0UrelNTWllFK1Awaml4?=
 =?utf-8?B?aEhHZGNDZUtReDZ6UmNiZElVSElwSllCRGppNEY1Q1lpNllNY0xTQWxKZGdH?=
 =?utf-8?B?SThlenJHK0hJbTBFN3VySlFQWEp0UkViR0p3SExhWjY3bXY5bXhvMDlzc1U2?=
 =?utf-8?B?SmJQbWRDWkd2TEt3RHdrVDlHZDVGNEZFQTJCbXM5MmtQM3lsb09vQnd1Y05X?=
 =?utf-8?B?MGVySkEyKzc5Z0l5ZTJqUWVpK0xWZmdhTG9OMHpPOVkzRWNnTmY3TEV2MGZB?=
 =?utf-8?B?aXpBYk5zUmpib0R0bVVQTVlCdENLMUwrcVJnME5XRUxLN3huZXpTaU5ZbVdE?=
 =?utf-8?B?c3hpeFZaOWZDU3duZnJ3LzZqaUtrM2p4aFBEYUQyQmxGNnRRUlJraVhENWs2?=
 =?utf-8?B?YmJKMktoVUNrUFM3OVNBYWFBeWFQMm9UZVlIOWxVTElTSlY1WkxsdG5YNkJp?=
 =?utf-8?B?eE1ycktQM29XaUlSS0xCMERLbGoxNSsxODgyM0g2b0xML3RydjQ4dDl5UmlR?=
 =?utf-8?B?TU9XaUE2cVdLbDlEbWtDOTBvT21hTkRFL1NWOEs3Wms5MWo4dHgxZ1RVcDlh?=
 =?utf-8?B?dTJrb3U1VWkxM204YTdmSFIyRnZpSG9pYUhkTVROb0RER0ZyZVdBVHB1b0RM?=
 =?utf-8?B?eDJDa01YNVdZQWNkMlNrQzdTS2JPdWtYMldrK09uS0Nqa1M4TUd5dEYvU2pH?=
 =?utf-8?B?QVNvTkNvcnNDcUpib29aT2hYUTBTMmFlWkNLdVFhWTVCMTJwUVNuNU9ILzZ5?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deed6b11-60b3-4437-b673-08dceecc4949
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 16:53:55.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aurRX00JBUdIFwTOIYKLQO9Gl2laYuJeNYBb/4r1tsdlmWJbTOgiwSUavciTEFPABALGkYARjQ74nXySLROvwTL5stI9QYSuCVvVb5ZH78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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


On 17-10-2024 13:35, Kandpal, Suraj wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Nemesa Garg
>> Sent: Wednesday, October 16, 2024 12:55 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>> Subject: [PATCH] drm/i915/display: Workaround for odd panning for planar
>> yuv
>>
>> Disable the support for odd x pan for even xsize for NV12 format as
>> underrun issue is seen.

- Probably with the discussion and the latest update to the patch we 
should also update the commit message to aptly reflect what are we doing 
here. (We can remove even xsize part or maybe give more explanation on 
why even x size is not being checked in the patch)

- We should ideally be using the workaround lineage number in the commit 
message.

- Also, seems like NV12 is not the only planar format, should we check 
for a planar format in general instead of NV12 specifically?
Cc: Matt Roper

Thanks
Sai Teja

>>
>> WA: 16024459452
> This should be right above your signed-off-by
> The rest LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
>> v2: Replace HSD with WA in commit message [Suraj]
>>      Modified the condition for handling odd panning
>>
>> v3: Simplified the condition for checking hsub
>>      Using older framework for wa as rev1[Jani]
>>
>> v4: Modify the condition for hsub [Sai Teja]
>>      Initialize hsub in else path [Dan]
>>
>> v5: Replace IS_LUNARLAKE with display version.
>>      Resolve nitpicks[Jani]
>>
>> v6: Replace -EINVAL with hsub [Suraj]
>>      Remove src_w check as not required
>>
>> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_atomic_plane.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> index e979786aa5cf..2d7ca6e62926 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>> @@ -1031,6 +1031,11 @@ int intel_plane_check_src_coordinates(struct
>> intel_plane_state *plane_state)
>>   		 */
>>   		hsub = 1;
>>   		vsub = 1;
>> +
>> +		/* Wa_16023981245 */
>> +		if (DISPLAY_VER(i915) == 20 && fb->format->format ==
>> DRM_FORMAT_NV12 &&
>> +		    src_x % 2 != 0)
>> +			hsub = 2;
>>   	} else {
>>   		hsub = fb->format->hsub;
>>   		vsub = fb->format->vsub;
>> --
>> 2.25.1
