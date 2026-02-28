Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ABBFEE4C6
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 06:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB0E10E20C;
	Sat, 28 Feb 2026 06:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNkyHHVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C5D10E1C7
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 06:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772261361; x=1803797361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M1wqzCNSkRI4VIO30pf3w1AHcalAsKka3gwyAlVhZKw=;
 b=mNkyHHVI8VQoChER/P9oSVMRIdulxVhY4D7n1awqaFXE3YmTTLC5yxtG
 Re+XxcqFBGc6J1IiODzc6vn3hJ89o7qDN2gaqOhBXtCvx9CEaAdQLFIy+
 v/U1/AQfSWKUGIc8Q408X+4jHZuId3caLggVJhmt8pmJ9b9gI0ZjwOzPG
 MMvZMMh0zfLYpEl64H0KMckJoaUOdru3RYJ4AEUkp/2ESmmn2zu9pgEfM
 HTJp+UOiSR8EXFpNpEzShKiJk+JJeC3yRuac2CJ6hYY9n1Aa53zPwHfQt
 FLil3AScthduCzv0vjRu2JAJEqHJyVojuRgF5IcnnxQXs/iDhfr66XLye g==;
X-CSE-ConnectionGUID: 4TB96XzlR/ewGs8lQoyLHA==
X-CSE-MsgGUID: /6iA7+ZsQnWoDrRhoujtRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73450518"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="73450518"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:49:20 -0800
X-CSE-ConnectionGUID: DgtyFdqYQBuEVqjn4fuDXw==
X-CSE-MsgGUID: 4uThGts/Rx2YdiiJZzKN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="214890113"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 22:49:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:49:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 22:49:19 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 22:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Va1v5OTZyvAYCKbl27BpPwNeMJQJ51Rx91+o4UQ7exFiB7BequuJ0dvCJvtu/u7S/un8XDf4F+grW/GIZMPrZopCJ3ZwGPEFca72PwXNQF1qktRhitr5WZmTw+oemayqC5N2aCVb19J8by/eH1fpV/iFQYOw89vr669T12lJLIj/vf3fzeQh/yfANTz+ccgEuepiaV2EjrHjNf2apryCfACtIiGNNGFZIkUC5+nK0MIQGVdqTcIKGH/EnEYGaSYmlWsulQ3jbzVjRTQlJ8Uc3pczwHHhDxFEvrjMk1fcj7phJp2s/4qAkhJc+Fda5yC/qZeUMkM6hPT8Eqf/83xZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfeLwBUKyY/W1YSzFRHjFo2MjvQGevmW+bT5BctwAQk=;
 b=csYWZadqkoEUPVigTIPnhhJf0nzlj66wZlh4GzLw/VVw9SuHwmq20Bi4tMa7hABXDnv+8vwTkW0UdaFRdFkIKvSfxwNmC2F7CsQ3ju+LvEmm5GcvyJf2OgGUanUrfxXtRc+mDLYld1VzkHlsvfdhy3mHw0UovTZ/SoMESWPhdzPK3KUsBlLMbKaKVgjuSibui26WM2ZjdBq9O27oV4iJlGyPQXdbefWNop025mLqdp+nmqLQFXSXUrSRKuhknxqQ+SNSIRCBh97jzbRgCrpXlqP1OfKxg67yTvlgNU2ttqUXCYsg2/WOEAgrL4acihNgsmRc/0PNfgjvIt2Vr9lQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 IA1PR11MB7678.namprd11.prod.outlook.com (2603:10b6:208:3f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:49:12 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:49:11 +0000
Message-ID: <a1773e38-6011-4836-91c5-500c15f2c648@intel.com>
Date: Fri, 27 Feb 2026 22:49:22 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] drm/xe/eudebug: Enable EU pagefault handling
To: Gustavo Sousa <gustavo.sousa@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <simona.vetter@ffwll.ch>, <matthew.brost@intel.com>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <christoph.manszewski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>
References: <20260223140318.1822138-1-mika.kuoppala@linux.intel.com>
 <20260223140318.1822138-23-mika.kuoppala@linux.intel.com>
 <87ikbhok89.fsf@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <87ikbhok89.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|IA1PR11MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: f14d3858-ce2b-422e-1840-08de76957abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 3Fu/9UvE3ZDxoiLi+Q0q4q6hQRtf6yKOKrNquXg00jGB9WGAummkSV9RsEx3zWmEFNl1xH69XZ29Q6wwbnwDr7eBqR+xjl7Mx3qQx+X/bRyxOsmoATY/WTckkJ7Fod1MrwYMBM2yQTWLTrmSZv5m2DG7gibzAgOr2PsOzbcmGLHeJYnhDB70gGzL/ciO/8PZEv7EtSWUjXCFYY/c5N34D4xMoR6QxhFY7IUnXW7kif32pvBG4BCO2S9RQNeubhHTQTOzv3yOt2fmAGjnPBS9Mbtm4WewnqyfnXml5b34oQHMtanCqPlBMssPpyqbO/gmaNUncDEaK8Q5Ja4xF1vECrvnGwgkZ3Difvc0BD6QnHQIYJP4NQK6K2aYnJk742ETEods9gMoZYn8S7HXrDX0TWZ3pzrkqzyV7OxB+goTqyHgSLRcNqSfM8rGlbyjRBoNZ+vzA2QU6wCJYizQ+cR9alkxsakWW68rN3K1yjAORZxA36tO1g5dq4uen1KU2JDfJsV+7RFTzgK1h7MfHLqcMEmz1EVVSe3wPKFfPHiTrj2R2afIXG9YiXBkQ9PdveqJ6ewCa+ehNbSrle4h0Mnl+K09lwNOnSyaImmLAti+8eHcE3PvzvXGlQLP9IA3RiY6R/7isLGeL2XleOUKDx6DgrPBIrAlqSpVnigVMPC1WVl36hXSOOUppSb2pVKYvP6IqXMroQynuJz8Yyxy8bAnETT3ZfWWE4vRp0IC0qf7xlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhCTnBONmtLZHZyMFRGcHRNR1VJaXc2cHBxcHd6WFBhNmZweXlLa3dRTUNi?=
 =?utf-8?B?LzdrTmRUVUo1UDFIaHdiYzVFWDRmd1M0Y2U4NDQ0K2Y3RzhEZHZiZy9tSFdK?=
 =?utf-8?B?UmdpcE1ndlBQY2E0bWRuMHdmRi8vNUdQYVJEZUk5eHNzbjQ5MHdQcHVDNnR0?=
 =?utf-8?B?Uit2VndTWGdiOUdDQ01Qenc1WHZLTHAreElwMk5lN0ZBUWw2cTVuWnZTZ2Fr?=
 =?utf-8?B?cmVCMmtmVnRaVzkxN2VmYTg0djZOVWxJVWdTdjk4YTU5NkRNUDR4Z1dienRj?=
 =?utf-8?B?c0lyRUc2S05rS2xVeFVVejBnekdiVGxiektPUXVienl1TnlqYk1kb09PT1lx?=
 =?utf-8?B?S1hiTjZhb1VnUGNVOXh5TjV4N1hKOFdFOW9tZ0R5TE1KYVV3QTZqZFk0TWo0?=
 =?utf-8?B?eHdGbU1iOGhYK2NaUmNYVlFETElnYUF6TVllNWlxUlo5ZTc3U3FXcCsyN2E4?=
 =?utf-8?B?QjBTd1FUSVFWcGhmdldWZTdVWERweU9VTGtWNTIwdk96WUV6Y2JlR0lBU08w?=
 =?utf-8?B?Rm5jdXNMMGJscC9aa09ucWttMERTL3RLQ04wcmVIUXY3cXpYd3hqUW14MDZM?=
 =?utf-8?B?dmcxem05dFpyY3F6NFBVMEdOMWdLNlVIRzBwMitmRTNRa1l4N2MrRnFFQklC?=
 =?utf-8?B?dWxvUGZqSnZ3a2ZxT0dxeDd3dDhHSlNvMWhlMW9JWURwTWZhWFBnNDluREZ1?=
 =?utf-8?B?ZU5BYVBwSEx0a3FjdzRBRWZVcm8zVTEwVmhaNGkvSHBnbFNlOVIrbG1PTUxj?=
 =?utf-8?B?UTc3ekNjOE93Qmp2U0NNSHNhcS94TEhBd1YvTmI2bHdoRitHTGpuVkduNGFk?=
 =?utf-8?B?aVF4VFpqN2VsMHJCWE1tVk5VaGRHOGZxcWxkNWVIOUhBVzd1TzM5WmIzQVNB?=
 =?utf-8?B?NkJYYlZPa1BhdC9lWTdXRHdvd01oc2ZuM3lRYTlsYlVpM0lYYVN6Y3Jmbnls?=
 =?utf-8?B?a3o5MjNSZVpHNkJLZlNsSTdHUVdSTG5zOG9kSFlmUTc4TEhkTlpMdzBxNGk2?=
 =?utf-8?B?ZUVSWUpiYzlrMWNHWWtnK21wRnJTR1B0d0g2Q09nQVVZWncveWtlMXVMZkt1?=
 =?utf-8?B?YzdZU3BOQTVrRnRxcGdVVEdFNTdnMlc0aVRWWW1rMkwxU2hvdVRyc3d2bkdR?=
 =?utf-8?B?d3VyOHg2YUJmdGNtSytGVGZGTUQzUzNlSjVtR1JwSC9IT1NYdW1ScENOY0FH?=
 =?utf-8?B?RTZtMnJzR0lWRDRFL0kyZDVlTFRoUXFUb2ZYWnA1OVlXalZCTHVjYVdYTnRM?=
 =?utf-8?B?Z1ZGZTlyZ25RRkVsM09XZDF6RTZhWThZTHY2Zk5XN1RlMUJSVGI1TUI1dEox?=
 =?utf-8?B?U2JDUXFJMC96WW9kRmhyWHpkWHRlTVpLcm1mb2YyMTJLQ1hsRzk5cUVuZm9v?=
 =?utf-8?B?bldCUlBCWXlqM2l4SDVhWFV2K2xTOEI2ZjJLS1JvdVZPbDRyTEJMTFgwSnVw?=
 =?utf-8?B?WWMzYUtHVStSMmkzRWJHdE1SWndSOTdvSWE5eFZLYU4vaDJkSlArR0xvS0NT?=
 =?utf-8?B?QzhEa1BZU096d1hsN0RvaUlpTFhnVGZIdFlJVzgvaXpGY3c0Qm16Y3htYjNQ?=
 =?utf-8?B?UGI5N1haR2Rka1RBOHV1WFhtdXVPTUJ1QmxmK0tnT2tyZEF4MUJxL3hHbWdB?=
 =?utf-8?B?dkNyRXZBdmVyWlZlMkExemhUUXZHc3BtUERmWTlWMmV5dktISitsYVFKT1hx?=
 =?utf-8?B?UlVVK0FmRTBWZ3pRcUtQT28xZ2Z1bTdLcWZmaTE2MU9OeTNEazU5OFBTd2Vz?=
 =?utf-8?B?QWNhM0VXRDRMODF5anVudURhNTVnMDh4bVhqN1dGazJNd0tmVUtiQVhMdUFU?=
 =?utf-8?B?dTV5MWpLMmhTT1VPcXJSSG4xclh3eEFqZTRoTUlDN09SZ1BHd0Fnd1hKeTZy?=
 =?utf-8?B?dGxaN0I0bWhSM2hKNWhkdk9kZDNuMUJadVBmMlBqOGt2alNuVkFuZmhGb0g0?=
 =?utf-8?B?NlY1eUJLMkJHc2ZKcFBZRXNNWWJWV2lFd1ZpNEFVd0xaZTdwWmM2cVErVm9X?=
 =?utf-8?B?TkU2NXlzUDJON0lDNTJlRTRmOEdIWWI4YmlxYjg1cTZ1QW9XWFpqK1pGOUlq?=
 =?utf-8?B?bWs3TG9CTkV0eEI4a2owbmZtZ1M2WndhMU16ZHJVRDRLU2dtQmo5N1QrSDN1?=
 =?utf-8?B?SllQanAxUklvLzZpeTFHa3FLM3J4a3ZFNEJlODBnLzVoQU5TQnpNUm9ZUFhZ?=
 =?utf-8?B?WUt6bXYrZkdDNzB0cjJkMlBFbFZ4Qzl2K2xUZWtHeWg1bEhtSWpzVWlsbzk5?=
 =?utf-8?B?andJdmZaeUVMbGpRUitkVlQyWituUHF1QStUNXBQR24vL0psa25OZnRLZTEz?=
 =?utf-8?B?NWRBcFMya2MvNTM2dENjOVE0ZXJjdStzWmJLQitSSlAzOFkvWW5memVzcTRp?=
 =?utf-8?Q?pytSF3Cq8nt5fwtQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14d3858-ce2b-422e-1840-08de76957abc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:49:11.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3uTTKeqSnjWWV+wwDeH4oxTGNnIfL4WahfAhSmbgDlVjrCkCTQecSO5ohjGW/ORns55GkijTxylAymrnmzjDpFFYT8uI8rMQoRKlDO7ojI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7678
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



On 2/27/26 3:11 PM, Gustavo Sousa wrote:
> Mika Kuoppala <mika.kuoppala@linux.intel.com> writes:
> 
>> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>
>> The XE2 (and PVC) HW has a limitation that the pagefault due to invalid
>> access will halt the corresponding EUs. To solve this problem, enable
>> EU pagefault handling functionality, which allows to unhalt pagefaulted
>> eu threads and to EU debugger to get inform about the eu attentions state
>> of EU threads during execution.
>>
>> If a pagefault occurs, send the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event
>> after handling the pagefault.
>>
>> The pagefault handling is a mechanism that allows a stalled EU thread to
>> enter SIP mode by installing a temporal null page to the page table entry
>> where the pagefault happened.
>>
>> A brief description of the page fault handling mechanism flow between KMD
>> and the eu thread is as follows
>>
>> (1) eu thread accesses unallocated address
>> (2) pagefault happens and eu thread stalls
>> (3) XE kmd set an force eu thread exception to allow the running eu thread
>>      to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>>      TD_CTL register)
>>      Not stalled (none-pagefaulted) eu threads enter SIP mode
>> (4) XE kmd installs temporal null page to the pagetable entry of the
>>      address where pagefault happened.
>> (5) XE kmd replies pagefault successful message to GUC
>> (6) stalled eu thread resumes as per pagefault condition has resolved
>> (7) resumed eu thread enters SIP mode due to force exception set by (3)
>> (8) adapted to consumer/produced pagefaults
>>
>> As designed this feature to only work when eudbug is enabled, it should
>> have no impact to regular recoverable pagefault code path.
>>
>> v2: - pf->q holds the vm ref so drop it (Mika)
>>      - streamline uapi (Mika)
>>      - cleanup the pagefault through producer if (Mika)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c   |  8 +++++++
>>   drivers/gpu/drm/xe/xe_pagefault.c       | 31 ++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pagefault_types.h |  9 +++++++
>>   3 files changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index d48f6ed103bb..6adf3bf73b1c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_pagefault.h"
>>   #include "xe_pagefault.h"
>> +#include "xe_eudebug_pagefault.h"
>>   
>>   static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   {
>> @@ -37,8 +38,15 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   }
>>   
>> +static void guc_cleanup_fault(struct xe_pagefault *pf, int err)
>> +{
>> +	xe_eudebug_pagefault_service(pf);
>> +	xe_eudebug_pagefault_destroy(pf, 0);
>> +}
>> +
>>   static const struct xe_pagefault_ops guc_pagefault_ops = {
>>   	.ack_fault = guc_ack_fault,
>> +	.cleanup_fault = guc_cleanup_fault,
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 72f589fd2b64..9dcd854e99f9 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -10,6 +10,7 @@
>>   
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_eudebug_pagefault.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_gt_stats.h"
>> @@ -171,6 +172,8 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   	if (IS_ERR(vm))
>>   		return PTR_ERR(vm);
>>   
>> +	xe_eudebug_pagefault_create(vm, pf);
> 
> This might not get called because of the early returns above. And
> looking at xe_guc_pagefault_handler(), we don't seem to zero initialize
> the "pf" variable there.  Couldn't this cause a risk of
> xe_eudebug_pagefault_destroy() being called with pf->consumer.epf
> containing garbage?
> 
Yes, you're right. Thank you for the good point.
I'll also apply this fix to the version that stores epf in 
pf->producer.private.

G.G.

> --
> Gustavo Sousa
> 
>> +
>>   	/*
>>   	 * TODO: Change to read lock? Using write lock for simplicity.
>>   	 */
>> @@ -184,9 +187,28 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   	vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
>>   	if (!vma) {
>>   		err = -EINVAL;
>> -		goto unlock_vm;
>> +		vma = xe_eudebug_create_vma(vm, pf);
>> +		if (IS_ERR(vma)) {
>> +			err = PTR_ERR(vma);
>> +			vma = NULL;
>> +		}
>>   	}
>>   
>> +	if (vma) {
>> +		/*
>> +		 * When creating an instance of eudebug_pagefault, there was
>> +		 * no vma containing the ppgtt address where the pagefault occurred,
>> +		 * but when reacquiring vm->lock, there is.
>> +		 * During not aquiring the vm->lock from this context,
>> +		 * but vma corresponding to the address where the pagefault occurred
>> +		 * in another context has allocated.
>> +		 */
>> +		err = 0;
>> +	}
>> +
>> +	if (err)
>> +		goto unlock_vm;
>> +
>>   	atomic = xe_pagefault_access_is_atomic(pf->consumer.access_type);
>>   
>>   	if (xe_vma_is_cpu_addr_mirror(vma))
>> @@ -198,6 +220,10 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>>   unlock_vm:
>>   	if (!err)
>>   		vm->usm.last_fault_vma = vma;
>> +
>> +	if (err)
>> +		xe_eudebug_pagefault_destroy(pf, err);
>> +
>>   	up_write(&vm->lock);
>>   	xe_vm_put(vm);
>>   
>> @@ -268,6 +294,9 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>   
>>   		pf.producer.ops->ack_fault(&pf, err);
>>   
>> +		if (pf.producer.ops->cleanup_fault)
>> +			pf.producer.ops->cleanup_fault(&pf, err);
>> +
>>   		if (time_after(jiffies, threshold)) {
>>   			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>>   			break;
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> index 2bee858da597..9d2d29d35a4b 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>> @@ -43,6 +43,15 @@ struct xe_pagefault_ops {
>>   	 * sends the result to the HW/FW interface.
>>   	 */
>>   	void (*ack_fault)(struct xe_pagefault *pf, int err);
>> +
>> +	/**
>> +	 * @cleanup_fault: Cleanup for producer, if any
>> +	 * @pf: Page fault
>> +	 * @err: Error state of fault
>> +	 *
>> +	 * Page fault producer received cleanup request from consumer
>> +	 */
>> +	void (*cleanup_fault)(struct xe_pagefault *pf, int err);
>>   };
>>   
>>   /**
>> -- 
>> 2.43.0

