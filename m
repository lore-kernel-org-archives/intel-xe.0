Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69150CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 18:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE3010E351;
	Mon, 25 May 2026 18:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPXYIKGA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A97A10E351
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 18:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779733560; x=1811269560;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LHnSHgyBvdaIVXpU+VeTYHyWEKuMcIjOunx/qtFwYAs=;
 b=YPXYIKGAqm7or+5T+Qis+SLbtKbyrRb3Uph7nI9T1FJfxkA27VB1DHFf
 bu/v5FLjp5GfK31fvaclQtMFvypI9AV2C6OxlxzBD/18v359QkFayVzdn
 xaV7MeJJempO/uNPe536q1ST3U8HUS3+11iId5OCZj8UnPUSStRMzdl5K
 ELx8cWfqyP0LMSA3A44q2URNZidiMD0z5L6adWPYSL7GJQJfcC7mgo04N
 naoytZNlIQuvUd6adK9tCa829wcKv/KAnH5lSRH7tyvGF/Y1eXd/rymg6
 3cJsm5/ryw8tF0Jmw24DDk8j/3pBsiOkbhcfTChGt4QRy6RmsXLAL6gFJ Q==;
X-CSE-ConnectionGUID: bTF6L3o0TxCq9E/5ANTxQA==
X-CSE-MsgGUID: N7UXdcl8RFe4n2nXNfEG+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80610631"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80610631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:26:00 -0700
X-CSE-ConnectionGUID: zCj14SSyR2yXb2ECZuLyeQ==
X-CSE-MsgGUID: wNjyezrjRR62HUjWkAT08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="245695337"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 11:26:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:25:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 11:25:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 11:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je9hDb/qloOX7B3B8oRi6mcFgr3SGEgBAgtp1mNEsMKaumKzx+iwS/8dac7O0qTl3cEOfWCXp6QA54PvGH6JwLUAY3b+b28F2nfcIDTDWD6JcqP6GdCIvevS2H05J9YNTDICPA4Q5kMSCfVRBUbj0S18BlDDdDUpjGUxmjamf7mqKAd7+sdfn6oiNRRHDOx0Pi/yBXTFF2RbtuDiA/nGzuCGmrGg9Q4TC5jab1sTb8mFE4L/FQW8F9WETsaqfontEyJl9JWm/n//qKfs/zG1iS1H6ysO/OVrJbgTGQoz/aMoSg28dhigLt+jymkqDoi/rRWeNXVxieTIJhmbcrvZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/mcZ5pXb0PyaVZk0cXDWqGJWKSjL8Oe2dx33MrpXu0=;
 b=ARZpX74eNdNqVtN2/J3uDpIX3KQAhsfjENAYQWTLaXwVEo5RENnSljgTqQ5S8UyDw9JqcGjZqIPxYEnUduELW5eGSc/x/IQ8nlEU0IuKrT/WBw9xfnyIIJa6ZlHVID7H48DycwF+K2AlhZoWQPQqs1K8xiKc+D4gXk9gk0EyxptkzNUJZovuyc4VQoj/FW/HtGvRRokPDhnGvoDBqkmbxV8TPCwJzubY4mu4TCAWIpTslPK7YJ3aNbHTCGADcECsOxQJoeEgVDyN+l8WrkonpQIpvKpSXHTySF3FN7lT14DBNZDFSEzKSWko9AawnVyhabFBu/eFpyw8I81rzRSCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8425.namprd11.prod.outlook.com (2603:10b6:806:385::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 18:25:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 18:25:56 +0000
Message-ID: <bcff5f29-08e1-43de-88fa-1dfef1fafd22@intel.com>
Date: Mon, 25 May 2026 20:25:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe: Move xe->info.devid|revid initialization
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-4-michal.wajdeczko@intel.com>
 <87ecizido8.fsf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <87ecizido8.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0096.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 515af323-cd5b-4445-2753-08deba8b0fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|5023799004|6133799003|4143699003|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RHTTGlE0HHuOdvkO7fdUJ4dC1Y96nHfz9R7F7akLXaxWUFxzGS82DSb3fs/FdwEE1VHd/DwNijZKppI24x+ZsFl++QtYwL6yePFdB/KwDn4kjnrry/B79eNHIoT6sVBQL4jvcL5GsizF3c0iJj6WX2QwXhT3geJoPFY3hMLBEhXGidNSQh7pYqPybASkMvQ+Nqh6s+dqu01tKyW6yMgp1Azbf1TZ3TgtKse/6gdBKzYLGiERT+vD5nasxj8vlt0ErqNEksgSGk/C9S56PyuTrWvQdOcTjcMx8lnIcsrJli+pWGepPYMv2UCh2OMlk0VD3lRFI26Nhec/yc0yvLvdhOsACy64E6wCtUNysz2uTcRma9V0oBCtHwCRUjtYsol926bqkOnxirdSIkMy0mX0X+06zxiCgP7qJ5plCXhZOoxBNqgDoP1/91QF489lLYm4uQCQ3TuBFZkdpS49yyxg1IISYWg9p0NqKZBl6BDcfsoASokoPVuXzOJKuB7lEdNMr2ERgi+LRhBNM0jD0dRQ3op9KJtroa5uSFqaUz8zwt8ej7Ju3NnC1ySTK1uSuE+WklPxniXPCWeKdgpIcuMz1zDIzrW2hoSzIVJGAtg7xRPz/mNIq9sDhBSzI+A5fh9dorHMJPA8a2iVTL4tZoJ71EKVfGevosMPGLTcEClsqxowntoULcGR6ehhRp9BCb9H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(5023799004)(6133799003)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0kyWHVjQnhEbmw4YUxhTzhVL2k4SEEraXdhQ2tDZ3BBWG5GSmFyVFNXYjBG?=
 =?utf-8?B?SU1JcGhjMWtmR1VmWnQxcS9tQmtPV0trSWtzalVLU2hIWjkrL3owSTJLT3p6?=
 =?utf-8?B?Umo0ekwwL1Z6Y2RjaHhKcWgvNnRiaWpuYUs5RWx2eDJPL2RUWjFqOVZBbkNX?=
 =?utf-8?B?NDcvU1g4eDkvQzNBNzgvMXhRdzZHaUt1V0VlcGlVWHRNNXlDdis5MUxjai9Z?=
 =?utf-8?B?OElZa0ZGMFJIS04wMGwyVndKUjh1NHFOaFcwaHZzYmNoRUVxWDJUU1JJcVU2?=
 =?utf-8?B?aWVoQlVGL2dUZnB6dkV3VDEyYUV5Y0dIOGhyditnbGgvbGhhK0xIbXV0MFdR?=
 =?utf-8?B?TWlaQVhoY1NzZGVPck0zbXVReXdieUdQZWJ0YUJ5cVBsbXU3KzV5dVQ3TnN3?=
 =?utf-8?B?a0poeVQwMjVMdkQ3N0FPTW1oOGVTL2haSXhDOHEwTXFMNkc2T3hvVFp6Rkh3?=
 =?utf-8?B?SS9VNHR2UTRKNXBjdS9XUVNhVU1iYXNOZ0svb2xCTlF6K2xiWUZQQjZ5ejVy?=
 =?utf-8?B?OHZPdlpjblhjQnNTNUYzd0E2RGlYYkw5TWVlSjMzV2gxRFNwSlY2NmVQKzIy?=
 =?utf-8?B?UUFyOFpzaEU2NUtWK3o2TGxmenRsbVFzYi9pZ1FsdURMQlNac2FsVm42RXA4?=
 =?utf-8?B?VnlBb0hEY2R0Mkw5YngxS2lxaXpZMnk5RFVQTUVlK3FLVWpnbGkycElYRExz?=
 =?utf-8?B?UGdZaDI0citFUWloMi91VmtKaXBEd0pnNGkxSG1uTzhqQmxOSW9mdVdrQXR1?=
 =?utf-8?B?M285ZmhVUkNiT3VjWEkrNDBicGVZMWhybDRHWmVyNWpJWkF2TDA1ZThiKzM5?=
 =?utf-8?B?SkR3Y25wT2grSEdNYmcyZXh3YWw0anYvZW1pYkdaVHdBTVN3ZG4zeU1EQU8v?=
 =?utf-8?B?K1g5ZnRGTjczQmYzQ2hsZkU4TnJnRWYxSkIzYlNwUCtFTG95TVF5VTE4Z2Uy?=
 =?utf-8?B?aXdLY0tSbFlCbDVtWG9YNjduWWRlVHlqSTVQa05LOVg2QWhYbEJIN3VwVENV?=
 =?utf-8?B?TXVBS3RDWC9JRm1aMGFGTG11aGtFTGdaUUZva1RVaGgrRFIxK3E0SjJCT3FB?=
 =?utf-8?B?NFFsNUFld0JhdlQ0akFiQ1VHdkhJblVoMjNCd2JXVlRaYjdIUVlEOVE1cEkr?=
 =?utf-8?B?VW54Nmcyd01oR1Vaa0RnV0dHMFBOQjRVcDNFUjNEV09rcUdhQ09sYmdOb2s5?=
 =?utf-8?B?TVNGdlFDSk9uZThld1ZvemFhN0xVU3hBTWdwRXh2dnRFVXBzUDdQRVU0WFdt?=
 =?utf-8?B?bVpUcXFmeGxBSTVhUjJLVitmSjZqRHVGM3lKYTR2VGI3dE5aWHpHdGlwVm5x?=
 =?utf-8?B?eXQwQWxWem80SjY0MVo0MVVVZUJoK1NndktuMzBuTkZFQVhCbSs1MTg0cGp1?=
 =?utf-8?B?Z2g4dTdHdmQ3R0wzek54TDV0NTNPRzltLzczb2pleStmeXY1aks4V2xJaU41?=
 =?utf-8?B?d0kraXIzeUFFV1JucWlyZDZ6ZUdSQ05MTG9hQi96U3VrSVZ0NjJlajBWbWNt?=
 =?utf-8?B?VGE0YTB2bVd1T0crRnNlQ0JsaVM2R2E1UkNLQ1ZPSUhqTWdneTVmT2tJSlp6?=
 =?utf-8?B?U2NmbkYyNW9IUnZDVDZaUDk1MnMrSHhRbTZQaUNBcnp0S1ZDWHhzNTJvaUQw?=
 =?utf-8?B?ZE9UZmkrYkdlL1VxTWV5bUNSMXBCckJiUFQwSW1OUU5sOUZXMTFlT1RSYnp3?=
 =?utf-8?B?bnhUMEhCWDhxWmtJVER3ZFVid1M1dVNZTnZqTi9ub2RDWFpienZKM05haCtM?=
 =?utf-8?B?OVplemdvN09aU3VVOEFSc2tPQnB0bEdTZWxpM0FFcnQzdEt2Q3RxNE9jcVJH?=
 =?utf-8?B?QUNKMmhVYUtrelRRSkZ3ZUJubGhENFhDSDVzS0c4eWZLVGNRSWQ2aWRUV3hN?=
 =?utf-8?B?bWNjZGJTUVNPVUJ3M3o3NUExRUJoY041Nk9RQzNZeGY4OHgzWWV2R0F0REZ2?=
 =?utf-8?B?UHJ1d09nNm9SSHJiREduNE95YlZjQ1VSQ3hMSmNyUXg2TG50SHBkYTJHdDVR?=
 =?utf-8?B?SE4yVFFHdndBM052YTBGb2FMWHo5SHliK0E0VTMyWjJKVGxXVW0yVGlpQzht?=
 =?utf-8?B?eU5hN1ZkYVhZZjNGMnBxWjJZTFdveVlmZW1qdDdkK2QxbDErN3BSN2dOREE3?=
 =?utf-8?B?bml1aWJoa2pXZ2Rrb1psNDhkM1ErMFFCRW8vZ1BEUmQ1RS9yY0VTUDBnQmY2?=
 =?utf-8?B?alNubWhCaVlKZE9RQlRaS0hyd3JPWWM1QWwrREN6UXRJdHpCaVJ2U0N3cFJI?=
 =?utf-8?B?aFNVQW1wTmwvTEV4RU1najlYajN5TTZ5SThvamgwNzNSQzZaYWQ4SXV2U1h2?=
 =?utf-8?B?M25Gd0NwS0dSRExWaVJTWlY5VmxmYmhMN0lrc0hVY0UrRU5vM2luYUcrSzBY?=
 =?utf-8?Q?/74cbukmNJC3F8gA=3D?=
X-Exchange-RoutingPolicyChecked: Apu82B/zsHMdmNusc3ukjs6oQbPjFbq/hxhf9JGuqvkJPVHxx4yOrWa4JO0+oQCvOI4NSPcueu3iTkAZBwml4GXIxx+7Z6jJ231fypy1mO617p9rVc8qw4sz8RXgWvvFIUIh0zzN/ZwjAe30vmLRsGuFCbKb/N2WfCTfJbrrwfIU7RF1PZqEsTQEIy9W5SVWlrXEUIMIotna28cYps364di1LavqsSAq5PBTOXKprhLaiJ2Ye8Th31QMUo9Fl3xBvD+BaFBiVF1sOPOUDB9oJjvfwtNezs1cEqGPyxYN74PBPa/7p9wfyniTo3dirBKgrUmKhPQYaInqdK/4sh4zKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 515af323-cd5b-4445-2753-08deba8b0fb1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:25:56.1666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl9memrduuFl27NSvObG3WM7hzDzXBBnE8bJM2/I077rVvyz5OXmkl3MIuT3f4tgiTlCxygc2CkZwkfXL1sFGrdyXCIrD1ra0C2MFRK/9i4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8425
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



On 5/25/2026 7:47 PM, Gustavo Sousa wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
> 
>> The xe_info_init_early() is a place where we initialize those of
>> the xe->info fields that do not require any additional hardware
>> probes. Move the initialization of the devid/revid also there, but
>> to avoid breaking the kunit helper, which also calls this function,
>> keep their initialization separate in sub-function so we can easily
>> stub it when running the kunit test.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  2 ++
>>  drivers/gpu/drm/xe/xe_device.c         |  2 --
>>  drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
>>  4 files changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index 860409c579f8..7c3428ab4c89 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -311,6 +311,17 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>>  
>> +static void fake_init_devid(struct xe_device *xe)
>> +{
>> +	struct kunit *test = kunit_get_current_test();
>> +	struct xe_pci_fake_data *data = test->priv;
>> +
>> +	if (data) {
>> +		xe->info.devid = data->devid;
>> +		xe->info.revid = data->revid;
>> +	}
>> +}
>> +
>>  static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
>>  			   u32 *ver, u32 *revid)
>>  {
>> @@ -369,6 +380,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>>  	xe->sriov.__mode = data && data->sriov_mode ?
>>  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
>>  
>> +	kunit_activate_static_stub(test, init_devid, fake_init_devid);
>>  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
>>  	kunit_activate_static_stub(test, xe_info_probe_tile_count,
>>  				   fake_xe_info_probe_tile_count);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> index 30505d1cbefc..46f961f75ecd 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> @@ -22,6 +22,8 @@ struct xe_pci_fake_data {
>>  	struct xe_step_info step;
>>  	u32 graphics_verx100;
>>  	u32 media_verx100;
>> +	u16 devid;
>> +	u8 revid;
> 
> Do we need to add those fields?
> 
> Looking through the rest of the series, I don't see us using them.  I
> think we could just have fake_init_devid() do nothing for now.  We could
> come back and add support for having devid and revid values when/if we
> need them.

hmm, we can return later, but OTOH this is a trivial change with near
zero cost (as this struct is used in kunit only) so why postpone it?

existing code can still keep it uninitialized (zero) and any new test
that would like to use devid/revid can be written immediately 

and actually I was considering updating fake_xe_info_probe_tile_count
to use new xe_pci_fake_data.tile_count field just for completeness ;)

> 
> --
> Gustavo Sousa
> 
>>  };
>>  
>>  int xe_pci_fake_device_init(struct xe_device *xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cdc7e0935c13..b498147dcf61 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -521,8 +521,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  	if (err)
>>  		return ERR_PTR(err);
>>  
>> -	xe->info.devid = pdev->device;
>> -	xe->info.revid = pdev->revision;
>>  	xe->atomic_svm_timeslice_ms = 5;
>>  	xe->min_run_period_lr_ms = 5;
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b1f5f0098f26..6b1a4cb7ccb0 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -727,6 +727,16 @@ static int handle_gmdid(struct xe_device *xe,
>>  	return 0;
>>  }
>>  
>> +static void init_devid(struct xe_device *xe)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +
>> +	KUNIT_STATIC_STUB_REDIRECT(init_devid, xe);
>> +
>> +	xe->info.devid = pdev->device;
>> +	xe->info.revid = pdev->revision;
>> +}
>> +
>>  /*
>>   * Initialize device info content that only depends on static driver_data
>>   * passed to the driver at probe time from PCI ID table.
>> @@ -742,6 +752,8 @@ static int xe_info_init_early(struct xe_device *xe,
>>  	xe->info.subplatform = subplatform_desc ?
>>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>>  
>> +	init_devid(xe);
>> +
>>  	xe->info.dma_mask_size = desc->dma_mask_size;
>>  	xe->info.va_bits = desc->va_bits;
>>  	xe->info.vm_max_level = desc->vm_max_level;
>> -- 
>> 2.47.1

