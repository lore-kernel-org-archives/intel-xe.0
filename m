Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2302E67A96
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 08:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792FB10E036;
	Tue,  3 Mar 2026 08:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAO1jaS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B645110E036
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772525949; x=1804061949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OCyb4QbQcG5rCCaa6hK2KNHWOkr/+8wz1spX+TV/O2Y=;
 b=YAO1jaS6Txmle2L4F1SXMNcq80OWrfRjcM3lIkX6ohcii9HuSAM1KD5q
 MMojdwv9vnacVaaZ1O0TbWOOBI+3l/p++WfrffpjoUGu+lqj3hT8unoWD
 XlKY7h7sVcwvwEMhFlZi1PhBN3DA8a8x4Bm+hQokh7lnxufb47MLjXpKT
 ZTnPWCuWhyLxPPClluG5Io4nHtdSSZloKGtR5JM+pPCwDLXzBPrUywp9l
 PUkFJV4Zp5XQ2A78I5TXJCZIjrK+SvP1gHpI+yPKz3gQ+m/05439KxkpT
 n6dChvn8eKuH5FO62gFp65UrGSOxBdM8oJlyFjJ2Ty3pNXM9woqwiejfx Q==;
X-CSE-ConnectionGUID: Oh2nWTO2T6SlQtMZREeKRw==
X-CSE-MsgGUID: xfVeZLRbSViAYvVhjtoRRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90950318"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="90950318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:19:04 -0800
X-CSE-ConnectionGUID: PIjA3EuHQVySiMYMxEe3lg==
X-CSE-MsgGUID: r6U5/SVrQe+eQ64CqFnvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217856126"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:18:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:18:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 00:18:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:18:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv8L/qmlNoxsLS7AHzYu373/2UH8Ro3XMDYzkZD0+KPYMvCPF0GgETuWxjxikcoDKPzzPG7w4SHM5QyYtHUNJR1HVoMGlS/ziiXWiy439OzDpeRhFrVdarwKUfDhMEn+l7/b8wjKeqblI0E7btIjiCtMxkzxfISU4lfcr5R2bs5oNbA877wa3JimMT3YK0306lu6aty7Uak7Ne+/zjtXcYGri0IhTcBuhtncCEFDK57ojvrqlmWHYagCUP8N/g0mtO5UKLtql5Tn0lYJZR8DPppIQZBcsg6q5st3q9KlexDl0+eoBg/Os3h29tpHzVQz6lstH2dvFvdIi44QZP/r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52r9SJWH9SeeI7oSpG12Fls0tgiSyiYsOK15cRo+GFc=;
 b=x7mJZbdvmFaQIQBxu+zPQ5hrdbbl3eeLyK3gaEWwOBCekyEXAlYfS76+DZ2OZdttN70kZR0FQaC7XXYijy5gGaB6SvZhpNNAGK08ljiz5Nq86Q2tqPl/LhKII4ztktzQC+4ocbseDjhEqqgwtfBgJH93/XvttJdkAG4SWaK8L3rdfZxALcGnUF97kNiee9zMIdogRYOAV+2/BaEFoeJMjFO9Bfim5r6NCvOLnvFt3HRqsBL18s02nMWgGQMHzkrxaM6cY0qIzjFnZPj76mId1ABXYpmTuyhR9yU68ueXFEfXma2hl6bHluTBaYRfXT6f3vO0FIvQeeCTc+TZoZhsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 08:18:44 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 08:18:44 +0000
Message-ID: <8f5dfe3d-e390-46b5-909d-4f437ba81fa3@intel.com>
Date: Tue, 3 Mar 2026 13:48:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] drm/xe/xe_survivability: Decouple survivability
 info from boot survivability
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-15-riana.tauro@intel.com>
 <aaXCL5mABQdwlG_X@black.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <aaXCL5mABQdwlG_X@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 24881a3b-eb78-4c68-1c97-08de78fd7be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: NTK8znBh08KLrHlNMuN7HQ6GHqsZ8X1D4v3XvTzjdZJj1iBqmW5BCiiuv+iULABw/8686eN7/SHWd0UgZE4cAKda1BuM0ovM/N2foj96sn+RKbvkUiy6Vk6yx3BFmtTjwbgWL0Qp+wjrT4iZJPPdX2p5jejS46A5Ix1urQDS2p2QSkr8QadpAlHTvYlGnjHPz0DY6Ga78g3g5c/ewCqtkCsg1jIyD8vbwVssrEA9lyULEftYytaa6gpyjhxlA0ElfRt7wjzghYagqoeklXZONDrwob7UXNqAffh/8ROUzWn5k8n3u/QTKdTSUS7zDrppqwMAGl37fw66fOd7kmQKeMF4MXVAR86zCzevzvaGtO9XkeQdm6uU1omYXpzP+jdHy5At3twWDPSDXE6GNQNboJJ+a7jF8NmMnWNSXagYxy29tIF/auxXUUogFBOr+ecXbbt5b6NlT1ONLvcqIsAbChxOJctypHA2xwiyuGYarLFuIdCQuHACdjvyVb5j1ZVEKFkl653FhqNjodoCNX9UFgvqIaZOc/oAU5EUhE1ISkoWdi+/qroaiIsz+nmvV5csGOf/U9fMc890f4UGW++Bf7gax2Qkmfx2OiSzKMswFIoOr02S4uPhgJ8jN8+SUQS6EXD1OzyRIx3sx53eahrs3biOwqaBaY67QgIJXnr2ODwMajidlDX7qhFiF/HLbuIQmDkgUFzF22BikEmRO2HCp1n8+nSinqrwRO3JpET7GzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHdvWkhPbzY0aXpZVkdITnFpekZ2VFNvMzBENGxIR3dRczRjVDg2c2MrcUNZ?=
 =?utf-8?B?eHMvNnVUZEw5eTJUckdiQzAxQnpLNmpCYzBwRHRSbnRkbzBDc1czb0cvVTBz?=
 =?utf-8?B?eEJYcTQ2cXc0NkF5L05XWFRUTldOd3NRQXpQVEpBY1ZRMmZKMHBoNi9rOXlJ?=
 =?utf-8?B?MFE3cXU4NVNUcHFuZmZ2eVJqd2xyR3NSbnFNaWVEaVQ4N1lvdHRhaHVSQ0FD?=
 =?utf-8?B?WUJGNk0wMm5MTW9Gb1ZWRXBQdVkyM3hNcGdNMGg4NDE4REx2RFEzZFZXMUZ0?=
 =?utf-8?B?MDZrMDM2cklkZzJpUWJLQ0pyQng5MTRyT2cvRENHS3IrYUQzR1AxM2ZTekt4?=
 =?utf-8?B?Y2dRSUZXYTNoUEZOM0h4emszZFRtYTdxdHc4SlNSekhuRTFEZlhhTStVeXRn?=
 =?utf-8?B?dmR2THZweHR6ZGY2ZGl0RzJhdDNjeFpCRjdRMkJDNE1YeEdxdUxJZ3d3bkdZ?=
 =?utf-8?B?c3NnN0dMZDFrcnNkSFg5aHM2eTh4RVVMbHVzSk5TeUVQR0pJaWpSd0NLWXFv?=
 =?utf-8?B?KzRyMzc0dGN0YXV4WXpGVzdQUm8zMG9ScHVKdjV6T0QzQll6c2JDQy9Wa2hr?=
 =?utf-8?B?NjVPRFIrMDZHdXY1N01qSlRYVFRNeFEwRGZNRWtnZ3ZwVk1yNlJUTkVxR1Q1?=
 =?utf-8?B?TmVsODJqWERldDZsdlZCWmxKNkVCVnVQcWc3eEdhRGMwWXJIOG9QNkVpSko2?=
 =?utf-8?B?NWVxdzhaUWtQaHZxRStQRTRLSGNTeGdlUVBiOVBQYThkaVlzdEZTYTBkb25w?=
 =?utf-8?B?T01JUDRsRFExNlI0T25xZlNtUnppZHZna0ROajNyS0NrejZLSUw1YTNuSEww?=
 =?utf-8?B?RkpCbFZiQnQ4R0t5dEJOSFpmaEMrZ2Z5WUZIUEV2U05rNjI4dDJUMXlKUVUw?=
 =?utf-8?B?UUQ0bGhaakhacmRaT2huV0ZjdkhhdCtpZTh4NjM1cy8zY3BBbXRkbVEzNDNo?=
 =?utf-8?B?VEFEUkVxUCtFem53NkVZSGVzY3BoUlRvRHQ3SVFETG1LaU9GdUdGN3Znc0h4?=
 =?utf-8?B?YkdzUkJJWEc0dko3VFVvQjVheXNCMjV6VFk0TVZ4T1dhcE02eTg5SjlIazBC?=
 =?utf-8?B?bFJxUVZvcGdRZy9qYXZsLzJPaDJmNnRKNis3WWxNSkxiR3R5SkRFdUp4ZERO?=
 =?utf-8?B?bTZZcXNndVJPQTFJSjZCVlptV1hPbiswTlFkWWQ2MVVVQVFiNXYyUW5PWWxS?=
 =?utf-8?B?TjR6T1krMnJqRGNjdGg1T1ZmeUMrYmR1N1FOMHlhOVA2YW10T3JyWms3RXh3?=
 =?utf-8?B?VDJGOWlWeUVhOWxGSW4wMll1UkN5ekdwVDBmSnR0MmFSUzNuYk1iWG1hM0NN?=
 =?utf-8?B?MzlJdmhZNGdmQStVNUt3QTdKVGlTczQvK0F3K3dwa3pkbkRmb0NhYWxhSkJ1?=
 =?utf-8?B?TmRLd0IyTm9pYXRNYVZuQUtITHVTemFkMnV5dXFMNjZFeldrUVZCMi9FOUxT?=
 =?utf-8?B?T3RxSm9uUFdXZUsxYXBlYzR4eXlZeFY4N2tWdVZ6cXFWZ0dlN0J0UDgwTTAv?=
 =?utf-8?B?QjRSOFppajVvS08rVy9ldHdHbEtmS3BmamdTMS9jRU5wRkNDV2xOS0hGQVN6?=
 =?utf-8?B?aUtxbVpoM0VEaG5QU3dBSFBnM2RRU0dabnZ0MnpEaHRGRGl4YmJvcnM3R1Zv?=
 =?utf-8?B?T0I3MGlTUlJjMkx5TUpmT2x2K3FFeEI3MkM2YkJOaHZwMlhvRTBCTTJBRE10?=
 =?utf-8?B?UHNub3NQQndNOVJadXY5NUNhamJBRmxObzJjbUoybzlRVDh2UTF3QVh0V016?=
 =?utf-8?B?VHFxZXZPYkwxNG9CL05CUWNVY3YzeUtlTUtzREJvWVVqYkhNTDJUMGJDY09P?=
 =?utf-8?B?THBhL2YxZVpOQlFWMnFkVm9mcElOYnl0eEI5ekJCTk56OHl1dkhXWFF2TGFR?=
 =?utf-8?B?UnVacDF0QmxOT3lya2h5d0lGdkd2UitnUisvK0xxLzNTUUpxLzRsbHVKZUoy?=
 =?utf-8?B?bEd5VHVBV2FYWWhIQkcrcWdNYWpldjNtVmpseUhkd2RWT2JpcXk5VDR6eFBL?=
 =?utf-8?B?aHc4aHU2OGdjOUpwM2wvcTlxbDAwUzRaeDM2T1FUT2duamtIUzNiSXBwbUJL?=
 =?utf-8?B?WW1mTEk3dDZocENsbXNFSk1weHhOWDAyZkwvVjJMQldBM3lDejB0N3NUL2sy?=
 =?utf-8?B?RFRYMDdIQW9KcVVGcjcxYldKbWJ0bzQ4UXdwcnd4eVJObzBTRTdOM2NWL29h?=
 =?utf-8?B?LzdqMlNjWG90aGxhSlU5Z1J5emdUakM3NTdudWd5bE9kQm1LR3JYSFZCbVRz?=
 =?utf-8?B?dVlxdi8vU0ZhUWZkUHpUa2VpcXZpQTlhcXgvcjRTNTIrZmpnbys1UDR2L0ZI?=
 =?utf-8?B?Qk8wVk5iMldseDMrUHM3ZVlOMlBoaFNmUzZkdk5vbGZFQURxV1RsenhqSzk5?=
 =?utf-8?Q?NONJn2PfSop8P38o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24881a3b-eb78-4c68-1c97-08de78fd7be6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:18:43.9024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7tc6/iUIpa/LP3RfUQDrrGR/48i0TZcuFzSdjHNTXmtcSrMKokJCa7M6c7bC22p2bg5QM4arhKoK2yUOiqVqVwUDxJSjzI6qncUKDtVn3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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


On 02-03-2026 10:30 pm, Raag Jadav wrote:
> On Mon, Mar 02, 2026 at 03:51:57PM +0530, Riana Tauro wrote:
>> On CSC runtime firmware errors that requires firmware flash through SPI,
>> PCODE sets the FDO mode bit in the Capability register.
>> Currently the survivability_info group is created only for boot
>> survivability.
>>
>> Create survivability_info group even for runtime survivability to allow
>> userspace to check FDO mode sysfs.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index db64cac39c94..70feb192fa2f 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -98,6 +98,15 @@
>>    *	# cat /sys/bus/pci/devices/<device>/survivability_mode
>>    *	  Runtime
>>    *
>> + * On some CSC firmware errors, PCODE sets FDO mode and the only recovery possible is through
>> + * firmware flash using SPI driver. Userspace can check if FDO mode is set by checking the below
>> + * sysfs entry.
>> + *
>> + * .. code-block:: shell
>> + *
>> + *	# cat /sys/bus/pci/devices/<device>/survivability_info/fdo_mode
>> + *       enabled
> Currently FDO_INFO is defined as (MAX_SCRATCH_REG + 1), but I couldn't
> find this case in survivability_info_attrs_visible(). Or did I miss
> something?
>
> Raag
>
>>    * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
>>    * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
>>    * to restore device to normal operation.
>> @@ -296,7 +305,8 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (check_boot_failure(xe)) {
>> +	/* Surivivability info is not required if enabled via configfs */

Please fix typo,

Thanks

-/Mallesh

>> +	if (!xe_configfs_get_survivability_mode(pdev)) {
>>   		ret = devm_device_add_group(dev, &survivability_info_group);
>>   		if (ret)
>>   			return ret;
>> -- 
>> 2.47.1
>>
