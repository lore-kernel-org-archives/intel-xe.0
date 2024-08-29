Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78480CA0EC3
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 21:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3310E760;
	Thu, 29 Aug 2024 21:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbnmU4ba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBFE10E760
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 21:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724967695; x=1756503695;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OzP84qeJrUeD55yiMbeIf/W5C5URkUgtH6DHHJtzItw=;
 b=bbnmU4ba002S3anJEOePj87JRARdNemHOAqKvCyPicgSo2BEDUYdzOh6
 3Drv4cPpxDRrB52/SZDfFbq1L7mmdjGLOk411sQbA4Zo49rxXw6VPLa0r
 wuQM4L3bQXefRnCMqIwWNWnQFCU2bRjU7iNX5xzTzGxMQ96Zefu+F0u/B
 pBUeRtNPWE5C+ih5u/1suGVwRFeQeuFWuRdQzH9gTKb7F2gSdC4VLexQu
 lHyC6F0jOdmZAUcLRgJHn8A0s0mF1f7GImbTLoBtRaw0lt2OAs/7D8GDK
 JeY95uigBP7Yf4n98ZZSrACdIz8Mf7pQLz92RrV1s1upWJv673qEhoYpz A==;
X-CSE-ConnectionGUID: Hbcg931VS9qupTJ4zy4/nA==
X-CSE-MsgGUID: K6DGaqG7QqyHoY5gKEfktw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27353454"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="27353454"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 14:41:35 -0700
X-CSE-ConnectionGUID: neyWISjdQFWWbUCAnxMRQg==
X-CSE-MsgGUID: j+5bAFb1RV6R7XNI7mpUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68510625"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 14:41:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:41:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 14:41:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 14:41:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 14:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEMpXlbxkU3/Agmn16+Be4/A+S4GWDvemTO1wEt30F/86jN3iFDPkRSarG0guTOI1djrv67SwF5QPAUpizl7iaJHxNSplalcntGVpy5A5zUs4gaext5O/NjaxlVm11+t0rhUEWT9zu+i0udCZvl4Zdt3mBVdOqu7Ukjl3mh3d9nPOMF+K7B4zjGioJ7HHcimMg8RcaZ0zoGC+uPFTFJajtatuWOZAyO1Ywa63A970MXVYJHjr+6b4b23ngtoojpvYOZ7DeXAulPhERGpzvQDZjYgDfWg8oj03Rx8mQg/ViOHExf8fOpDu+0OZZ8PRIG8ntn/IJmQD8vCxSAl4VmnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzP84qeJrUeD55yiMbeIf/W5C5URkUgtH6DHHJtzItw=;
 b=rrwWJ0zFArfNWpqd+xTa0bUWd29R34Vx19c3fYp8wXsiaYw8PaZVQlwEmuChZqYUTYk5Ul+KBuAwKIRNTG9ru3TIDxZ9kXERcMfDWSPuBRFmkrNdE9vx//B4hRBPZAegQhF08132shOX9M7Q9U68m8MC6QMucDq5NoGwssROUj9ah7PKAItGal8mWWXv3F6lOuULbOjqlwa4zSjxkPWZLARIQg46q9oZVqIuMiDXMSH4nRlmPQmnDQHCswe3EZfXWnn2zlG4obyEGZzbg5S9DwnmbWqJFByNuz5EW3BW7UlozhU33OlniRgOJMX66xLn/NnUy5MQLRg26ZFTr/UIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 21:41:26 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 21:41:26 +0000
Message-ID: <01cc773c-6e14-4be3-9197-2e5b0ef7e072@intel.com>
Date: Thu, 29 Aug 2024 14:41:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Wedge the device if the GSCCS reset fails
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240828221457.2752868-1-daniele.ceraolospurio@intel.com>
 <eb7edfbb-9440-4547-ba1b-6e31386c4089@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <eb7edfbb-9440-4547-ba1b-6e31386c4089@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: a88e80d7-fffa-4e48-d534-08dcc87355aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REhZcGV6WTkrcXltallLbTVrMnp4UnNJenVPRE1peUpGNXpYTTJqc2E5N25V?=
 =?utf-8?B?SCs0NUNkQm1XWmZsdWM5VXlrWjFoREs4OG1sRjFaS1pFNndQbDRQejlMNTBN?=
 =?utf-8?B?WTFNUXdteTgxYmVwVXpTZStIQXJ0LzAzYkkxbjFhTldoY0svZGc0QjFLdSsr?=
 =?utf-8?B?ZVd4enpZNXhpV05RTzBrSEhUbjE2eTR5K1BsN3RydjhKeHlNOVNQOXVhbkk2?=
 =?utf-8?B?OHA4eDRxQkUyd1g3aU5YY2w4Zld5SG9GOEc5c3Y2bjZVNzIyUkpVQjY3ZDhR?=
 =?utf-8?B?NUUzUlhiWWNGcHdDZUZWWWNicXhRbmNWa1VaSUZUY0hnUi9aL0VmdWtjK3dJ?=
 =?utf-8?B?a2dubkRkMjBacGlicmV2R2lYeWlyamU1UVoyS3RMaGpOWWNsMlB3T25EUlR3?=
 =?utf-8?B?V2prL3BJNkl3MWVoV04vQ281eHNaOG8xeldOU3N5OU8wSW53cE9ybUtqdE1F?=
 =?utf-8?B?eGJvQlNqbVN5VU5JKy9vQVpOSk9LOUpHWXF3NUdkZHllSEp6NG5KRHphN2th?=
 =?utf-8?B?Mkx1QXYwZGlzemFGM25oZm1WYzVvTE5KZ2llendtZStPUmZKZmIzTjIxYVVo?=
 =?utf-8?B?QjlsNFB3K1cya1N5UGdDMEdGeVZuYng3NVRwRkoyTWFTOFkxM01JTnhuZ0Nq?=
 =?utf-8?B?djVlYmQveUNBT3NxYkpkeW5FUUpLRDNHdFpDLzVkdThYVjF4Snpyekpndnh4?=
 =?utf-8?B?SEFYamlsdnVPUWRIVGVva0lFaGRpNmttMEIzYlRKRzhuanBJdXl6UGRpemlY?=
 =?utf-8?B?Q3crN3RyVE1CMGpaUGJwenBsRzRPN1IrRHIzREw4V0p5NkJBNWZ1L3pWZTZp?=
 =?utf-8?B?RDFkMUxvV05sWGJrSVFoeWxXK3lHMHVrb2tOQ3BqOStEcEYrSFVucit5M2Y5?=
 =?utf-8?B?VWdYREFyaTl1V2Y1c3hQL2ZiUTI3MmFBUzlrY3dSakw1NHAzTU1QSk40clZp?=
 =?utf-8?B?ajlxZ1RiZlhZNHQvR3VnenZLVGVrcFhXTnN1Z3U1YWprbUdtZmM5VUU3K2Vw?=
 =?utf-8?B?QU4wRWoyQ0VoaXVHYnhheEd2WUZBZTY0ZGtESkFudkU3S1NEM3BuWlNjb3Vu?=
 =?utf-8?B?c3BocjJyVzVKVmEvdjlIREh4ZW9QZFFFYldsZ1RvSnAydng0SjBwb2tYdTcr?=
 =?utf-8?B?K1QrSFB3NVByMlVEMEwxbHpzSUNEaURkNjhyMlFFWkZSV25EYlhIZ0lmaU1s?=
 =?utf-8?B?Zi9ESTlsbkQwTk1TK2J2QjIzdTVUMXArekhqVFp1VmtZSXVxOTluWTVZMVZI?=
 =?utf-8?B?eENOYko1ajRkRlJxRlAwOVBOT09RWVYyQlk2VDRPRWRxY0FzbVM3ZFVORWpP?=
 =?utf-8?B?Qmx0WmpydDFOQ2VTUHk2Y1VNREpjbTlxRWl4U1h6aG9ycGpoT24rT3pncUo5?=
 =?utf-8?B?Y1dVNHhwRG9QUkFlVTVERVBaTGlWL3IvOG85TDJWOVg5bmF2WDNEd1EyeEIr?=
 =?utf-8?B?ZHA5VzFkUUVsVjRqRzlDRWxXQTdTdFRJWDYzbzhxZFlnVUw2dEFzb1ZpbjBI?=
 =?utf-8?B?NStTWkVOM2JUcW96T2IvUzZxUEgvbm9na2xOYXhxaE9kOElsOHk0bXI3Vzg3?=
 =?utf-8?B?RTZmQWhmT3dSaFBIUE83Yk9RbjZmWGVHSDJuSTlOZUZweFhDdjJuTzBTS3Ay?=
 =?utf-8?B?RlRsaEdUVXhsYTJsaUt3SjdLeWU2akM0U2wzOWpMMjc4V0tVV3poZXoybXI1?=
 =?utf-8?B?M1ZPd2FTNGRTK1FNc2dzNTZyZlNJeW9HaU5IMVRSNmJmV3MrRkpJRUIwVWtN?=
 =?utf-8?B?Q3l1eFZOTVdMZjBMdVJNUEFJdG1laFBsUExISGh1YUpQaFlZbFdjblQ5VG9U?=
 =?utf-8?B?WnlkRkdmOXk5RWxlTU5pQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akZtZUgySUh2TEFvdVdIYmV1SHhWaW9qNnQ4cXRjdWFoczVvdU80V1FrNnVR?=
 =?utf-8?B?aWhqR1hIb2ZGYjdZaDF2NzlMZnBzcVcxR2llUDk2UHI0THFpdWt4Tko4Zkw4?=
 =?utf-8?B?OU42RkF6TFZvU2w3d2lWNFRFYVBqYm13VXZWQ0lvTEE5azB0UUVodHdpc1Fl?=
 =?utf-8?B?OXBlMzBDOE1PK3VXQTA0aUp4d1BkYU01NHBrd3FWcE42cmFZMGRIc1FCWGFo?=
 =?utf-8?B?YzJoSEVuUm1sbGMwc3dnclRBTmVlUGE4cmJXNVNSeGNlWWZvcjUwLy9UQmNx?=
 =?utf-8?B?YXZsM3h5cEVqSE9JUk9kejRrYUp4c1l6WXd0TDN6THphdkEyYjdNckR3TTJX?=
 =?utf-8?B?TkdKYlNiN0pRQjNtdm1KQVJJVk1DbmxGSmt2YjNHY2gvcWJkYlBJL28wRFl1?=
 =?utf-8?B?cXBSOVdjS0ZYRmFUbHF2MnlrUy9IalQrQlVTRGc2K0FVRmVGVXpLdkdPbW5p?=
 =?utf-8?B?SUhxSXNuelBuTWIwbmErREY4M01IZWVEL0o5S1htaXFHdGVialFuUTY1WDZH?=
 =?utf-8?B?RHBSbUc5ZVpRdHp5QkhZMXVkd0treEVTbE9jdjZjOEFmayt5QytlSzB2UmNX?=
 =?utf-8?B?Um5ZNGpVaWMrVnBEQit4SmxURVRyZU1TOE13MHI3UmVuVjBJck9DRXJQTjVD?=
 =?utf-8?B?ZTFPVmE3NFF1YnpteGQzQmFqYVQxUCtFNzVCSFlETWF5QmxJR01ZbTdQb0lz?=
 =?utf-8?B?K0NFUURPdjNaOE9LZ0YweUtIMi83aTZPZjJZeTBBVFptVTNxdlI1Z0RLeW9l?=
 =?utf-8?B?M3RaemZBQmwyUzRnbmszQlVTVnA2VzlKWXpVLzlkckhKNGt0dTNlOHdoN09Z?=
 =?utf-8?B?TFVXcWJzRUpVNlBrVE5sKzNhYXBGK2VpazlIOFJWV2lWM3FWWVVRZEhwZlo5?=
 =?utf-8?B?RGVJY3A2blR3MzJ3dDFUQkp2VHNUTStFdFdZV040ZitqMGp6M0NYWGF5ckUz?=
 =?utf-8?B?OWxTSm8rY1Q1QW1LVWI5SlQxclB2ZnQ1SVhxU1kzZGE5Z3hRTXlQZTNKaStw?=
 =?utf-8?B?SWJJRnFuV0h4YVNWbzVEQ1pSbW1yQjZCNFovUENxQUhTZVluaU9zU1c2bjMy?=
 =?utf-8?B?MER0UXZzMSt1RVNjVmowSjJyd0JHOTkxOXJKbVMyREsvU1lDMm5Cek80aEd2?=
 =?utf-8?B?eHF2WFVMVW1EK2s4U1J0dEtUWEVyTTFua295SnRSRFJNMVBWdEduUVpDM0lN?=
 =?utf-8?B?NEVNNnRzN0lsMGF5TFBZQ2pBeHJJLzhLMUZyalRzMkJ1SmNoYSt1TmxGRUpR?=
 =?utf-8?B?NWpLbldDaTNZUjNvQ1YrSEQ0UGdkNnFvL3I2THN3MjVjdmthNGh6UkUzN3JJ?=
 =?utf-8?B?OXg1cURwckVPQ0F1dDBXa0pnTnJ4SFZKeURZZSs1WHFMUW1vWEpCekR2M0FG?=
 =?utf-8?B?UUZnYjdMUHVzNXdneHVrSkFLVy85czZ1YUpUdzVkVTFEM3FNM3FkM2RnTXoy?=
 =?utf-8?B?SWVKWGgxOW14M2Jsc2EzZnZMaDBOdFEyajZrNVdleEFUWDR5UEZGNUNWcmhj?=
 =?utf-8?B?RGtKWmpJN0NBM0RTVk1KQ2ZsMzNIK1ZLZytCdmROUFozOCtGaGtHUlh4eUxG?=
 =?utf-8?B?OW91UFNDdjdlNnhkbU5mbE8zR251U0s1RHRPc09mdlM2eFFmT3dOUGpEYmZk?=
 =?utf-8?B?UEZSZ2VqVG9sNDdNem10bCtnRFE5RWczOHJ3Q3ZqcUFaSm11bXF3WVMrTjVs?=
 =?utf-8?B?aFluRithcFg2TG1NNzhGdjVnS1BVUEJGYWNoYmZIdHo0emplMXZtS1c3aERj?=
 =?utf-8?B?SWRrdmNnNjU2S2VUQXM4YWFya0R1UkZSOTRqcUMrRmQvWWF5RUhVa210STRJ?=
 =?utf-8?B?aXJFVjl2YlJ6WE94Ry9qT2lwZmJFc3d0THhRZitIMXFINWt5OThoUFJqWGd2?=
 =?utf-8?B?Q2hRRVpqbDUyMjdwMWU4a3BTdVAwRUdjbHIyQjhQQ0FyWmZTRmpibTZmaDUx?=
 =?utf-8?B?RUViNktBeGp3b0JEU3FJdmdqME53dkEvR3ZpNlNCODJqK2ZzODU5Mk5iSXpT?=
 =?utf-8?B?QWViZDlBU2FKSkhhcGI0dmNQR1dOTWlEUHBielI3cXpQa2lJVmJONFMwNjVz?=
 =?utf-8?B?cDIyakFKSWxEb3NtbHN1bTdUOWQzd2Zsb1QwU1VwYmpSQU9GaU9vVFZTdnVE?=
 =?utf-8?B?dEhPQ3VUd2ZSNUR1cWRJMkU4L1A5R05qVDQxc21wanczZHlEcUtQWXZ3dGQ4?=
 =?utf-8?Q?weZFqGSf+/Ypnx21s7LaYDg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a88e80d7-fffa-4e48-d534-08dcc87355aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 21:41:26.5560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD+ZfaWVbJokcmj+ECrsA7oqxLZHD0jiRWhXQLsSXC8UlCVckOPY7fyIm9qRUWADrA+MWAQOEElKNpZbKbx08mk04UsDB35frg9TVJDEdSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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



On 8/29/2024 10:47 AM, Julia Filipchuk wrote:
> Looks good to me.
>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

Thanks, pushed.

Daniele
