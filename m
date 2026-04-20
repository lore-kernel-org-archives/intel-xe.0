Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7E4F36C49
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 07:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53610E10D;
	Mon, 20 Apr 2026 07:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ga4QsxNm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E766310E10D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776671418; x=1808207418;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cEnymvolk/MxNcj51zyEc5o9z8ou4kj51kR8chkXjuQ=;
 b=ga4QsxNmF3FA4a1H3i48c/JwT1bx7loHOD8DU09EHNCH21hSwMUYLCzx
 tqMFIyut1vHDivectoauc9saNiNhh+vsGypd4tkXORxZ4dkDB/CiefeX3
 KCSbl6AehCLozWrgYc2Tp6B1cHXpe6Aj1LWuBY3xDV4vuQXSMZ222HQOm
 d+j3MUIMZfkdxTQy4Dsaa+fMQF4eqpBCdXviBn068mCi5F0MsKDoy/tU2
 qJJwD87ISB6764AGADak2FHxV402Q/pbJXoDgHBUx0oWeoov+Z9Rj3hYu
 d5CGCKma792vH/hZLcChRGpOBT92hmOGUclQlvn4L9trUw1GHwqPW1SSZ w==;
X-CSE-ConnectionGUID: 6WuaIwpkRn+fen393YRZBg==
X-CSE-MsgGUID: G9P9ea7jSiyt6hy8G7IcEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77450631"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77450631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:50:17 -0700
X-CSE-ConnectionGUID: mceMUiuKRCG8H0J+uLfo4Q==
X-CSE-MsgGUID: IToo1UwHQ6WEdF+ujW/mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231524206"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 00:50:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:50:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 00:50:16 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 00:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoCJ/cOfzyMSH8pIclH3dUcwgVzesSzV88T84lFMfzH/QIhRLwfHC5KjA4XPa1TzL+O7wkIEdUNgvJfxt3to3m4XZe4q+oZjp8x7Qm2mgCpeVzyXsuTpAMnxYrwmQ0khCm6S+/s3/VdHglf2VCl9zcM7GFrIIcS4mC4os/6MCZFVmhglu6+SI+lLlhhcxfYkPDd8XNBEzVJfc9og62QBUE713opFNZLkAIkc/ijaVfxgItotLJCZQX4ACWTcROJr8hK07tCFQ38n+0jh1PP2MXzKLaSoKMgsGGfShQqtM9PrZGkYDZyBMKOMh192+3hcc9f8DnhL1yKCvYkTYpjXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAc+sUOpWgmij8oUBkF7dI95GDmFH7aSkR92wI2DQRw=;
 b=l0IHPTIEryggMTxai3VEbebVu/vcdVv0NgzI78DZE4YNUxR+r9zkRbie2B+gZ70m1/Eh45qiXsRLvT/bGCOFDG1/joPS5bff75FQ3139q2ez9+uvaUFvPgAbL6EfE2uH1wkDO4GLzc18NTd2ue98pWQJs1Tkyuys83szd/ztUJkcHh99AXHV+wIU0DVXGINqs3pPlE2SNxvjsGIquHfF8xHEhYUZsKn+I0cz3Ah4jDeSebfKQUAHiU2GCEdktoBVIoJNGhQC0VAMnX3IpRD+0HF39b1IZedQ4L74Tuno9IJLVxV1hKZJBPDvH//J1WkBekRVlxDX8KRKukIJTP5QPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH0PR11MB5807.namprd11.prod.outlook.com (2603:10b6:510:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.14; Mon, 20 Apr
 2026 07:50:12 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 07:50:12 +0000
Message-ID: <95ab12e8-7f5b-4b15-bfb2-42b1ffd72b48@intel.com>
Date: Mon, 20 Apr 2026 13:20:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe/xe_ras: Add structures and commands for get
 and clear counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-9-riana.tauro@intel.com>
 <adyxZnShDWNhNuaq@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <adyxZnShDWNhNuaq@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH0PR11MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8c691d-8353-4cec-8ba7-08de9eb17370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: lmKsSylKRTHXdpCajvwzcbE86s4kadJS0h/+ZqgAJj8Ns/7SuA1v+hJH8H6lZuOkvEHW5H99jDcnu+zCFNcarR19RsemIzB2dD6UOlklb5IjnBxmhkl6AGlXyqc9JFdArYLbtM+6ennYYygx7GPdOtTPd34ML6U66oV6hBLQLw85IkoJHMIhvH3iZCt550LzjY0/SUfGgTIqWmgiDZcZfw+kvq1ONHjSmwoZPcNAOlaOJXm72R0RsE5MWEWUfXgRYaAhS/DXxY5tfOKf1yxC1OPPJkkIXwVLhS/PwTT6qrCpsDzrTBzkJ+47mHw/6QOZa/mzbyUU2GZrHMUANMZNQXH4cbiezwNpYkZJ6RODsZmpopLa1wYnYqdXAReoY5MWxaksLjxiTb3pwxEzaVVKU8U4TjPECpzlFRrfPqPB1GLwOYvoGsLMSEP/Mw206a5KrzOvKVO/C82Ci5MIVEz918n9u/zlXrBmkI6jKq2ht43iKFpYegAt4JiRXuiGFKwWjE0mgcDxLfp4L1VX+jfsIfpDgrrsuYK0pVEE30yQ34SARgsrlgPB2jNsS6Kp2puwGtHVRlaYGmQh2EDffDJcsRJ4fkN7Y4/fCKsArmwzwcYZCE7NtPvdSBNvO++WILEPb8F9zQgZopRuiTZDcMJM1wTSTQHLL97XQeOmTiNY8iiOcnxSlzF9gDTqjM0ynZJ5Ghr/UH17WwEdqM/d6KHgsygTqLFntvEpwkWIKM/G96g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW1CY3RSVDE5VktIS2RJSWVrQ1FhRzd2Zzkwa1ZMSlp2K01UUmNNVnJkMklh?=
 =?utf-8?B?M1VIajd5cnN1RXFRazN1RGU4NG9nNzU4bDZucnoyZG5xbjIydlhhM0lHMEtB?=
 =?utf-8?B?S2tUbjFCS05IWGUyOVQ0bzVEMzhDRlNDVmtQbXlpUUNiTGJ2eEZnVm1IWFBh?=
 =?utf-8?B?VjdHcis4R1VSOWM1NVhXUlc0Y1hGSFpFRlhrZXBVQk1jaTE3dTJyQXl3ZFZL?=
 =?utf-8?B?OVN1VGlBWEpUZXE3dmtHckY0dDRYUnFrZTZHSVVEWVNtKzlHaGlpWmVyMkdW?=
 =?utf-8?B?dTYxY3RFcHdOckpJa2poa1EwdVY5Vm8rOW5jeS8vRmZmcU9uOUVjUHQ5SVNn?=
 =?utf-8?B?bm5aTmlLVXRCdlR2QWFENXFtQ1N6VHJiNUFZTDFDcnBlQkVOd0tJWDQ4b2Rh?=
 =?utf-8?B?b1gzU2VKbGVpQUZYWFordkNvN2doNTRrNGtOTmJvZzcvZk9HdE1CVFdIVmh1?=
 =?utf-8?B?UzdBM3Y3ZDhjcUlqd1p3T3d4MFNzRnZYTW9LeVRHUXdjb0UrV3VoNU5waUhu?=
 =?utf-8?B?Z1RqRTF4dUhyOUpwR2EzVmc1bkVxM29YeHZTWlJ3cXUvVjdHYnl4R1B2RkJa?=
 =?utf-8?B?YnY4TmZZdXlFUnQwRDRaVlVQK1VqS29UMlBldUdsN1doQWJqWFFVdHlOR0pI?=
 =?utf-8?B?aHlJMjA3Zm9zVFI0dmExZ1Z2RGwvZmhwb3FzdTN2R1RpdzJJeFl4WTBydFhE?=
 =?utf-8?B?eEExWXlqU0ZiY3AvMGFDTUNEOEFjNUxnYm5NZ3lqZENRVXozeUxodzcxOHZi?=
 =?utf-8?B?RjRXbTNBWHdlUGdzcU0xazByUU9tTDNReGk2bzh5azBYRHhlSzRzKzZiS0Fr?=
 =?utf-8?B?RnZ5cms0STAzelJwcUJoQWpnamxpNURXRHkxY0hXLzBEVjRlZ2YvY2F4MkF3?=
 =?utf-8?B?b25TUVI4aG9yYWZWYkZ2TEduazZaOU5SSWtyUjROdnJJMmpuclNEYTVCNG56?=
 =?utf-8?B?OTd0VDJDbExOSEY1VTNsK3lzV2F0emNma3Q5L3JmMTNBU1duU1ZDbmhYdnBK?=
 =?utf-8?B?U1JMajhXR253VHdaaEIzVlBhTGhLUlNPMHFxbWpYN1BnQ1R5aVVqUGhqZUla?=
 =?utf-8?B?OHA5Qm4vSFgybXlpWDF4MnVxRXpGakgydHp1VGFwRG9LRmRWdUZkOW12dVZo?=
 =?utf-8?B?ZExzZlI5R0ZZT0MwUkJ0VGNRekI1ZVFzdklFNkh0WTdlWC9QWXZnVnFlMElI?=
 =?utf-8?B?K3haMW9tRnpESzg5cDRsckxmQVlUZXl1ZzBON2F5L3UvbXlicDFMbmdvcm4r?=
 =?utf-8?B?T0JTQmM5QkU3NGtnUldieW5SWUN6NzZrcTlwdXh0Y2tsL1dSQlRaYVNVbm5p?=
 =?utf-8?B?Mmx0SndQZ0dtZ2tIMGN0K0hWMnA2ZFRyR1FqYThubkpGUVhHSElhRHBaT2R5?=
 =?utf-8?B?dHBlYlQ4KytDRUtDUlE3elV4RHJHUXpTTHkveG5SNEdHQmV5QmcwQVhVcE5K?=
 =?utf-8?B?TldXZ2JGUFZ5NmFpREUrMHZCSi9iNWtocFRUa1pWZ3M2TmpIdVhQbEpvTXZ4?=
 =?utf-8?B?V0VhbThCaW5OUEhhc3hhWFVMTTVoSXNNLzBaL3RKK2RyenAxOWFkUzlFeDlF?=
 =?utf-8?B?eWJPVXoxTDJnQTNtQkVoUVJFeThCRXJPaityVXQ3V1JMc2xBRHBEUkRYaXNG?=
 =?utf-8?B?WnBlVXZZZkFYdUVrUDdWQWJiZ0RFU3hJWFg1emZvTTZRUDM5TDNraTNjVzhN?=
 =?utf-8?B?dm9zTi9pQUpMTWhDWkNma3hTaU90SGxvaUVwSCt4eS93QXpxUmx0bXFYSlRz?=
 =?utf-8?B?c1JDY01LTlJyME1vSUVLdkdGTVlVd2Vja3lmdHZ2Q1RlTm9kZHJuVTczUE5U?=
 =?utf-8?B?WUphMXVrZnloWnUyaEd2OVkvSHNtdk5NZko4TlNHa2RJa0VKTEo1dkJGaTAv?=
 =?utf-8?B?SEdRc1d0cWlWYmhoSGIvMENiMFczZkpDSm5DZmk5UlZHUkFZUFMzL01BY1M4?=
 =?utf-8?B?SFJnSFR6QUJ5YU9DZEJSZnh4b0h5bERSQWRhS3BEWnNSRHRpNGdKaEtIZmM4?=
 =?utf-8?B?d21Welo3TVYvNkM3L0JzTmFRUEVPWXJSTW0ySDVoU2o5aHlrZDF6S2x2aWE2?=
 =?utf-8?B?VCtqZENOQlowMG1oSzRFYVFOdFNCdWhZSnpCdElGR21adk41cEJKZTFOUjc1?=
 =?utf-8?B?SlZOTW9UU3R4OUtlWjU4N1M5UGZNZnI2U013MitRUXlGZEpQdWVYeFU5NVdt?=
 =?utf-8?B?S0V3bWNBTzZzRlFrTkpXcUxlRTQzNUp2V1VNc0E0c2hubzJ5U2tBMmJQaElT?=
 =?utf-8?B?a1ZGR1Rnb2MyemhQTUg5MTVwZ0JEazk2K2hpU3hxcnBmMkF6NnpseERzODlB?=
 =?utf-8?B?YWMwd3BWb3N4dS9pdkdoYlZ0YjBTbFZZVXVlWWhpTnJjZkhNZVdnQT09?=
X-Exchange-RoutingPolicyChecked: dmPnrHX6hwDZ+XIhMnv1LetVDKyBZZl16Aj7/8T35q9yvFPXIJmCK+JdgFJeI6H1N3UtiKX+N+EMzfsEK5CcymU43LOOhulJD/aj7QPxftq4npXmYwj5qcCQkjHcPIIkVj06qezrB6ypgE/G6fGlXIykEZQzaYDrVoZAzDRR5afNwwZUJQ2b8X//OK+UQAVWGgm1wUDPRBuOBLEv9x7QlcS4uvNCIEFDune/8v3yKDhsgvF15KwINVdTRw8HlM3TiTKkJ5g4IdpMjuufc5SmrRLDWuC4c7+54/wPTaW39nMkkP6XDWBs7G269yPWLI3lSjjtxGyMs4Wn8bHmoyxE3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8c691d-8353-4cec-8ba7-08de9eb17370
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:50:11.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D27Xq79AwD21mZmcRWzjnR3ZGEivZhLDZcbBte5lQILic6+bk62zBlIyxsi5bqIruM20NOBKd6Rrt5uBFBNLEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5807
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


On 4/13/2026 2:33 PM, Raag Jadav wrote:
> On Mon, Apr 06, 2026 at 08:24:41PM +0530, Riana Tauro wrote:
>> Add request and response structures for get and clear counter command.
> ...
>
>> +/**
>> + * struct xe_ras_info_queue_header - Info queue header
>> + *
>> + * This structure provides metadata about large info queue data
>> + */
>> +struct xe_ras_info_queue_header {
>> +	/** @total_size: Total size of complete info queue data (bytes) */
>> +	u32 total_size;
>> +	/** @chunk_offset: Offset of this chunk within total data (bytes) */
>> +	u32 chunk_offset;
>> +	/** @chunk_size: Size of data in this chunk (bytes) */
>> +	u32 chunk_size;
>> +	/** @sequence_number: Sequence number of this chunk (starts at 0) */
>> +	u32 sequence_number;
>> +	/** @flags: Info queue control flags */
>> +	u32 flags:8;
>> +	/** @compression_type: Compression algorithm used (0 = none) */
>> +	u32 compression_type:4;
>> +	/** @num_headers: Number of detailed counter headers present at the beginning of queue data */
>> +	u32 num_headers:5;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:15;
>> +	/** @checksum: Checksum of the chunk data */
>> +	u32 checksum;
>> +} __packed;
> Do we actually use this in the code?
>
>> +
>> +/**
>> + * struct xe_ras_info_queue_response - Info queue response
>> + *
>> + * This structure provides the response for commands with info queue
>> + */
>> +struct xe_ras_info_queue_response {
>> +	/** @queue_header: Info queue metadata */
>> +	struct xe_ras_info_queue_header queue_header;
>> +	/** @queue_data: Info queue data chunk */
>> +	u8 queue_data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>> +} __packed;
> Ditto.
>
>> +
>> +/**
>> + * struct xe_ras_get_counter_request - Request for XE_SYSCTRL_CMD_GET_COUNTER
>> + *
>> + * This structure defines the request format to get error counter value.
>> + */
>> +struct xe_ras_get_counter_request {
>> +	/** @error_class: RAS error class */
>> +	struct xe_ras_error_class error_class;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_counter_response - Response for XE_SYSCTRL_CMD_GET_COUNTER
>> + *
>> + * This structure defines the response format to get error counter value.
>> + */
>> +struct xe_ras_get_counter_response {
>> +	/** @error_class: RAS error class */
>> +	struct xe_ras_error_class error_class;
>> +	/** @counter_value: Current counter value */
>> +	u32 counter_value;
>> +	/** @timestamp: Timestamp of the counter value */
>> +	u64 timestamp;
>> +	/** @threshold_value: Threshold value for the counter */
>> +	u32 threshold_value;
>> +	/** @counter_status: Status of the counter */
>> +	u32 counter_status:8;
> Ditto.
>
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:1;
>> +	/** @has_info_queue: Indicates if info queue is present */
>> +	u32 has_info_queue:1;
> Ditto.
>
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1:22;
>> +	/** @info_queue: Info queue data */
>> +	struct xe_ras_info_queue_response info_queue;
> Hm, so I'm wondering if we can just add reserved padding for now and
> introduce the struct when we actually use it in code? Will tidy up things
> quite a bit ;)

Sure, makes sense

Riana

>
> Also, probably just squash it with next patch where we use the struct.
>
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_clear_counter_request - Request for XE_SYSCTRL_CMD_CLEAR_COUNTER
>> + *
>> + * This structure defines the request format to clear an error counter.
>> + */
>> +struct xe_ras_clear_counter_request {
>> +	/** @error_class: RAS error class */
>> +	struct xe_ras_error_class error_class;
>> +	/** @specific_counter: (1 = Specific counter, 0 = Aggregate counter) */
>> +	u32 specific_counter:1;
> Same as above.
>
> Raag
>
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:31;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_clear_counter_response - Response for XE_SYSCTRL_CMD_CLEAR_COUNTER
>> + *
>> + * This structure defines the response received on clearing an error counter.
>> + */
>> +struct xe_ras_clear_counter_response {
>> +	/** @error_class: RAS error class */
>> +	struct xe_ras_error_class error_class;
>> +	/** @previous_counter_value: Counter value before clearing */
>> +	u32 previous_counter_value;
>> +	/** @clear_timestamp: Timestamp when the counter was cleared */
>> +	u64 clear_timestamp;
>> +	/** @status: Status of the clear operation (Success/Failure) */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved[3];
>> +} __packed;
>> +#endif
