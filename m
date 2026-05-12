Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D061DCD484E
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 06:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0A110E97E;
	Tue, 12 May 2026 06:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FS9OI6M1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EF110E97E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778568545; x=1810104545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fdXxnATkboxNzqVmVFUJHwHjNzQz6uIf/wyoqdMTyqQ=;
 b=FS9OI6M1rACW7AHaYzddH/RqzQEIe6CZly2nVefneAcZOlRNvyfUq3OL
 gHskDEa+R83cDvj6U92hZknYjkVk8Dt9WcQmGEp4ecBgkOIo5KrDJaxFr
 +rX6TRBaTlSL4vlrRtRbwq2iXz6C+/Y8kfd6VciAQcKi7PDmEDSFD3+A0
 xc1ttOxKFPkqyViEUzhqYvEOZ0uUqmYeqln6I/5VvmyLAYDsIHUBXVk+L
 pstcQ4vp07MHZJqM6OUwIk7Ot5juSGbSMWePl9j5menQsBlT8h7R7jKTd
 r/hVaGEGxGZoMuyqqpMg/JyZawU1D2xJgB1/R3hA4jMqzeGs9whCP+FYH Q==;
X-CSE-ConnectionGUID: 5CFQnkDHTBaZH8RoSc9HzQ==
X-CSE-MsgGUID: DqDzClzIQzSCryCl3Y1rew==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90052350"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90052350"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:49:05 -0700
X-CSE-ConnectionGUID: haOiU/a0RCS/C1V2RYDh7g==
X-CSE-MsgGUID: RMCQQvuVRauKdXwrc4h7/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="234630123"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:49:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:49:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 23:49:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:49:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXm301nUpZDIrX01ewycllhXey6AGoGMSjz+8u7SbbVfCCjNgpFTZ838RyOAPxFvYPd4EHoLC2x5qYQioy7tD+UjN524EUA3/aFu8JyHZaLGq2NlPC5KOYzj32cO/jw2eWQkxyYq6iTnC3GpB8wq8azMYQsSEqL5auslvA/G39IUFYmeXjq2lAhGO7mL5LGnDBOlLFzU2QvD0Tuy5cWQ/MJhqAm3mdP/1SWADTDTWBKZv3U3CnPyf3SlTLinOUYLBkbj5mfYSHcPaj3vJ2jIDxPNICTGzo7F2HIWecjiVhW3EaT4rOYEJv9tgcG6vrU4HVJI1uxlMGzqknHrvSnqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw/f9w2B55GxetMuxKJIlyU5GRlY3+kah5FQg4AJgtE=;
 b=FDnBZW687vltIubecvWyTRLH9YyzEOotXvnlyxJSDgtZmt1BwPR5hQ7cFUM2GTvAnl7ulBHmSgyKAOqdlJw+t0wL89/vVO9y/t01B0G+cs1SNggH3Tiel86LF+AJR4sn0rvbMKbwkH/bv6/Gz5u+VkoZVGAgSHjphyv95HV0TSh/Yc3UKBl1wQgHOprbkei0vous4hSeSd6iFb80NCjUkhOU66VZ4MFkRWypUOvjZ6N2qlTCKsNZ+1t8ZZC7lmtrb0GXiQ0g+aQ9oUiTVmCAZb2pmJxZ5YCfZU2h75XmKLYAvHiXE9G56fho/5NsDOLMhyptpzr1TjV3Flnhw+wB6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.22; Tue, 12 May 2026 06:49:01 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:49:01 +0000
Message-ID: <aab2c025-d410-43d5-b02b-bccd1c693302@intel.com>
Date: Tue, 12 May 2026 12:18:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-11-riana.tauro@intel.com>
 <agH2opX0lnW6jMzp@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agH2opX0lnW6jMzp@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: cf41faae-a37b-4be1-db9b-08deaff28cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yxPS31J5ItNivJXCzaU4FYcpZG5xxjA8Qg4i+W5yE2ziI/tWS9EbTiPqNmZIblIb8zhVrAFwJ1dXpCjx+etyz4sUQgTk7sRzI5Glb0wgWfUgy26xAbZetk8/Pr0GfEwn3JOvniGP6Zr1h82hQ34K4/Gfk+tyUzPhB9RnVwCdeEnTaOaGuNrI98t5kgbMRCSNc/PyCgQ8mY3/exdU+n1378uU/tPmY+t404DN+C0dmYWx1BilSkbuw/sMwI/wl5poG1A3zCxgMZL5GOPYdDoEeP5mcVw+FmFYZlNMZaKYLr9ODY6DOhi+QPWOMVHECGDOjJ2YYRflESuIAnWygWkeGDTxgPbcqa5vCSwrvVCZ9zV9bMjf6y7og7dzbvzJn67shJ6I7/JusdwmA5i4eFRad0TpzYYO4fT3COMvfyqJZVfVsu3aGBnU+OeSkUz6k08L150o61axyICVFmphxfW5prm8kWAgypizGMLGVsPmAFBlKQdUbpg6lPQgsVUmCUYgwZKVx6I2ZeHXTehMUZ5VJW0r0fyW9L0dY/vftZY0ezRee1X3Ndal3dBHOtRNgrA7Y+uNosxnPw0G+2h6mZxGfgvTNKbanjDoUMaBOQsmNEsn4auH6W/58c6xNYNpS+sN2cY8aDq5qwI+xub4iQJk6MTAKA05rZ8hak7ot5o/LZhFdgVsKXVpPkROTKx/eduJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkRoVkVObndtMVJJTmEwSjdHc1BDQXhEVlBXL094OGdoczZSYy9xN0VQTWc1?=
 =?utf-8?B?aVJrQTZpME9DQ2FTdDd6RStuaDNIckVDd05sb29FdFVKeWg1ajh3anF3b0FX?=
 =?utf-8?B?WTVqdE9XSEdQRloydEhkTThvT0ZobjU1UHplY0FPRG9pU1FPdFljTk5COUpp?=
 =?utf-8?B?ZFd3N0Jvck01ZEZaVVJndmp2dVFxajlRUmNkY0xoUm9ZK09hL1NyMm5sYzB1?=
 =?utf-8?B?c2ZWOGZFdGJYMUJFK1AzQ3dDWWo5WmtiV3h2cTNuYU8wWHByTTlJYWJJaFp6?=
 =?utf-8?B?ZVEycmdyN2JzS3I1ai9vYzhJTTBvSVBEd05vazJZR3FXRGVTN3M1RGxIazFG?=
 =?utf-8?B?MUl3YmEydDh0UU9ITDQwU1E0b2pndEtOL21QZWdWYWkrVGd1WEFrSlVoS3Ja?=
 =?utf-8?B?WEh1Vm9lTDkyMVpabit4NnVnaHNRdnlGbmtvd3ViM09PM05XSVRBeGM1eWpQ?=
 =?utf-8?B?ME5QMzZMTi8vR1FDelNUYWVRbEt5MG9ZYjlUQk5GbDlaOXVuQk11Nms4QnhF?=
 =?utf-8?B?RWtWcTl1UTZzdCtmZmdzdWNYV1dZNlZnYWlObTYwaHgvbEt1LzlWdVVyOE54?=
 =?utf-8?B?bVEvc3QyQmZnTXNaQlhXeU5iMmNlWkdKZGdhaDk2dVMzTzZOamhIdlZ0d1lY?=
 =?utf-8?B?OSsxeVp6SEtoZVFNT1VxaW52aEJZMDIvVnpDV0oyd0NrT3B1L2NqaDUrK3Bl?=
 =?utf-8?B?dGdndi9vbHpXZytkelZhZTFyT2VHUHI2R255dzV6N1BqdWtyOGw0akJDRDl3?=
 =?utf-8?B?K25UcFdFQmVlM1V4aGZhS3lGSUx6ZG8zeFZESTRRaVVOT3VHVit2d0ZrcDZ3?=
 =?utf-8?B?VXkyU3RlNFhYUWdIbzErSzRsVTNha29mcStubkFIRU9LTUwwSVNxb0JGWnlI?=
 =?utf-8?B?UHVyTUEwTG4vWWZ2czJZK0NZbVhubnBsY3RWUVpvK3hpdG5MRFpFd0YzV2d6?=
 =?utf-8?B?c2FwdnZZd041emI0S0Q5SCtNZDFyaFU5Rm5KWlE0M3J6Yjl3aDI3SklGQk9x?=
 =?utf-8?B?ZXFBeGJUSVZxbURTdWVaZkJvQkhnTFZkU0wwd0JXcHlFNjZsKzhXMW11Q0ww?=
 =?utf-8?B?QWtndTJPZGJRSThyejh3MlNzdEh5eUg3YkJLYlhHNitYV21FSi9KMEFpNkNy?=
 =?utf-8?B?YWdmVDFlOFJMUlllWWxMaVRlLzJPd3JCbHNwZXNaMG51Q1FldjRZSUhXbDQ4?=
 =?utf-8?B?SXNzbENTMjV4WUhEcThDSGdmdGVvd1JOVUo4ckNuT2tET1c1ZStKUmh5SnpH?=
 =?utf-8?B?a1g2cFNDNTBvbUdCWjBRQjJzM2NVUy9la0svcjdYSEh4ekROOU5qYm9JU3Qv?=
 =?utf-8?B?VnZGQnRiTDcydHkrVVJqWHhKbU1ub2NHa3lQeTRVa2ptRGd1Z1FuQkRra2VC?=
 =?utf-8?B?NWZ6T0owRHJUd2tiSDdySy9ucnlKcUR0WkRsOWtvZWJRaWRYRzNLUzd3OUVa?=
 =?utf-8?B?VnZFRGlHdDU3YXRscE84SEN2dE9JcGh2M0UxVEc4Ui96MkF3K20yc0VFUEtE?=
 =?utf-8?B?SU1QNlE5VlZ2TXljQUlOc0ZUcHFtaUw1SlVDUVZzWWFLcmp3VEpienRMZVFD?=
 =?utf-8?B?Y0ZYR1AvNzBtRW9aYk5pd2dBRVNoR2RPZ2crUXVkbUhJNjBtaFBoaFZsUTBm?=
 =?utf-8?B?M01BdCtBcTNyb0xWSDVWQkxqUVZZZXpXNlZKQ0ZKOHp1NlBLY0V4a3RxbmFk?=
 =?utf-8?B?K3pFUHhCK0ZVQ0xvOUtST1A3ekFZTEF5cy9HN1hVaHVybmYvaDhHZXJoRVdY?=
 =?utf-8?B?dGJWNy9VNzRKZlpLTnR4TzdqcHpoVlozeTR5aEhDbXpvc05adEhISkt6dncw?=
 =?utf-8?B?b1NpT1EyUnkxWStEaXZpRGk5Q3V3Y3JMazBrOU53TEZ4Q3FZVUw5N1pmdUEw?=
 =?utf-8?B?RjdxUGZFcXVDUmJmQmxmQWt5dWRRVmJvUy81ZEFnYTV4a0tEdm9DdUc3S1Fx?=
 =?utf-8?B?MWMwRE55TFF2TFNzUlQ2OU9aM1FSNW5JTXNFQjVhbEN2UmV5LzNvNVJQd3Y0?=
 =?utf-8?B?NjBSQ3ZYYnNYdkRRU3NiREs3ZHNUUE4vL3Q4azBNbW03QkNuNU9Ta2loRnFY?=
 =?utf-8?B?enphOVJST0w1U3h6a0Nra3VhdTRheHRRYllBSnRYdWNnWnh5M2p5WEcwOW1J?=
 =?utf-8?B?TFFrUGY5N09ad0l6ODA0VCtFZWROYitVcHNhL3BVL2cwZnhBTDFIRHdyR2U1?=
 =?utf-8?B?Q1k1a0ZBbUI4TG1NNHBNYjlmbmduYXVORFV3UkF2MUllVVJtS3Zkd1BSdjN1?=
 =?utf-8?B?VDNKUWNCYUlWTXlEMWpmWHFaZVE1NE9pVUliMGYyWjNxUUtxNm1EYTUrN3VV?=
 =?utf-8?B?Vldrck1RUnF0eFJyVXI1QmVHaWpnZ1piNFhlVjZLcklJa2MzdzU3Zz09?=
X-Exchange-RoutingPolicyChecked: XK046s4itrMn+lda6cEzw5mQtBGLzLfGzIfN4eHJy1jqK0MfJ4xCiCRme/QdfiB2mClyJXoDTM1FR2Wt6f6Jg2AhLWZQym0AzG2RH8TeVCzUmV4NcdwungJ5PcAGt3rSiGV81Yi8lZTctpp+PNH5YZ7cO1ScReSSTtd8ok/KTUdi/3x95PwatExaXxOd+oUIZxUKrk/DpdMejPiUmw2jCZa6Umhb34jINND39xgdA3iHDGGHBHJW69C+5g3aaRKU5KHSPzJOUfdVLSgWRTUC1Bz7ogWjFip19JOJusAN2+2jyUooTPbnbtCElF6DtkdS+TeUyNj2gzrYFlfulSvW9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf41faae-a37b-4be1-db9b-08deaff28cb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:49:01.4417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfuUS96GSoGs9IMgT1KZ3FKdWurdGs5c37Y8OKkQaE3TrqBy3clVb8069A/c+XJvT56VJhac0gyLVtYSLW5f0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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


On 5/11/2026 9:02 PM, Raag Jadav wrote:
> On Mon, May 04, 2026 at 12:26:18PM +0530, Riana Tauro wrote:
>> Add structures and helper function to clear error counter value.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add status codes (Aravind)
>>      fix log message
>>      squash structure patch (Raag)
>>
>> v3: rename function
>>      add comma to enum members to avoid
>>      redundant churn
>>      align with tabs (Raag)
>>
>> v4: rebase
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 76 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>   4 files changed, 105 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 47a58ce3b3ca..07f6837694e7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -34,6 +34,17 @@ enum xe_ras_component {
>>   	XE_RAS_COMP_MAX
>>   };
>>   
>> +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +	XE_RAS_STATUS_SUCCESS = 0,
>> +	XE_RAS_STATUS_INVALID_PARAM,
>> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +	XE_RAS_STATUS_TIMEOUT,
>> +	XE_RAS_STATUS_HARDWARE_FAILURE,
>> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +	XE_RAS_STATUS_UNKNOWN_ERROR
>> +};
>> +
>>   static const char *const xe_ras_severities[] = {
>>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
>> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   
>> +static const int ras_status_to_errno_map[] = {
>> +	[XE_RAS_STATUS_SUCCESS]			= 0,
>> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
>> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
>> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
>> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
>> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
>> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA
>> +};
>> +
>>   /* Mapping from drm_xe_ras_error_component to xe_ras_component */
>>   static const int drm_to_xe_ras_component[] = {
>>   	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
>> @@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
>>   };
>>   static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
>>   
>> +static int ras_status_to_errno(enum xe_ras_response_status status)
>> +{
>> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
>> +
>> +	return ras_status_to_errno_map[status];
> Just use switch() and do away with bounds checking.

array allows for a quick lookup and it is better for larger entries.

>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>   	if (severity >= XE_RAS_SEV_MAX)
>> @@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity seve
>>   	guard(xe_pm_runtime)(xe);
>>   	return get_counter(xe, &error_class, value);
>>   }
>> +
>> +/**
>> + * xe_ras_clear_counter() - Clear error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be cleared
>> + * @error_id: Error component to be cleared
>> + *
>> + * This function clears the value of a specific error counter based on
>> + * the error severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> Same as last patch.

const is unnecessary here

>
>> +			 u32 error_id)
>> +{
>> +	struct xe_ras_clear_counter_response response = {0};
>> +	struct xe_ras_clear_counter_request request = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_error_class *error_class;
> Ditto.
>
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	error_class = &request.error_class;
>> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class->common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
>> +			    &response, sizeof(response));
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected clear counter response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EIO;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret)
>> +		xe_err(xe, "sysctrl: clear counter command failed with status %d\n", ret);
>> +
> Also, xe_dbg().

It is a failure. err seems appropriate

>
>> +	return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 74582c911b02..bbb9d42bd128 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>   				      struct xe_sysctrl_event_response *response);
>>   int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>>   		       u32 error_id, u32 *value);
>> +int xe_ras_clear_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
>> +			 u32 error_id);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 74d85875cd63..44369fc8ef03 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
>>   	u32 reserved1[56];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_clear_counter_request - Request for clearing an error counter
>> + */
>> +struct xe_ras_clear_counter_request {
>> +	/** @error_class: Counter class to be cleared */
>> +	struct xe_ras_error_class error_class;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_clear_counter_response - Response after clearing an error counter
>> + */
>> +struct xe_ras_clear_counter_response {
>> +	/** @error_class: Counter class that was cleared */
>> +	struct xe_ras_error_class error_class;
>> +	/** @previous_counter_value: Counter value before clearing */
>> +	u32 previous_counter_value;
> Tidy up a bit please? ;)

Sorry didn't get this. Do you mean name?
prev_value?

Thanks
Riana

>
> Raag
>
>> +	/** @clear_timestamp: Timestamp when the counter was cleared */
>> +	u64 clear_timestamp;
>> +	/** @status: Status of the clear operation */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved[3];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index b315847cbf64..6e3753554510 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -23,10 +23,12 @@ enum xe_sysctrl_group {
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>> +	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>>   };
>>   
>> -- 
>> 2.47.1
>>
