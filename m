Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBD0C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C162610E025;
	Fri, 24 Jul 2026 15:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6nXEOn2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20A010E025
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784905925; x=1816441925;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=shey1ylVfRbB0B7eR445kpI+4f5IbjyWRi92jjNm7ZI=;
 b=i6nXEOn23E4xaWBeACVD1vJ1HerDpVo1PBQNWvcj0Taev5vG8+rH3RRd
 uH/7baYCScSdBgov4QaeNBbY7ud3VFN2rU0JBQnk/8mjwkMLqcnBZKv6F
 I70mGVHYaqOtCetCaJVpK6ScakGrh4s8VKHBh6kI/hw1sBfpqOWcgRLus
 Tn4ilw7qOjBWWHHN7XLQKtZ8ZkUuicPDQwbThEqzdzcl3LstkZPl4IRGu
 tZcjAiX1HyBKneoHIOx/0evPySy+Pv6/cTPsGHHK3O/UAg2l4N6essHRd
 KFzj35NGULBv4Ben4toF0cN171OxBo0qmUUNkDDo3AdjMCE9cksGStz6X A==;
X-CSE-ConnectionGUID: 8eKHGVU5RqakOc53ujJ0Fg==
X-CSE-MsgGUID: iKT37LeeTBuYz79xbQ4D9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102983533"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="102983533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:12:05 -0700
X-CSE-ConnectionGUID: IXedfhYoS2OkJDPz092MZg==
X-CSE-MsgGUID: +PaFIac4RemjsShI3X6lOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="283233675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:12:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:12:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 08:12:04 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+kVPxfR/OOAMek2RIQ+ifu7GWPNaHf9XKY/Ab2+tjw/REBrvZuDcQe4nR87VxhAnME4TQWSJza8OPh3UeAEhxXsZBAzAHL0kHLYBAnhCv07lBdYBOurqQpKKmv+OPVJg+btX4bnqBPvt3WfeRAs3pUwrQE3PGhI3ck9HNgxlj8yCVU6PGZdgvbbQUxEMEpwbZmklhbYpafD6BMyi2jVO9TJFUJAteHhXv3TVUkV2qhFueE34k7JH1/SNi24dqACLR4IAeossbO20fbzEgXqhQySt+/z5q0hbEf1lxj3LkKXL46cK6x8FuBF9IZKeFbPN3j/BAIUuQ3oV4WLgcgkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq+XVJy0Xwiv9M/wCVdfX1TgE8h7c1y1yzH+O+xxMzg=;
 b=rzkErQdnbgWbkaJUvY2r635GmxHMQ73NIAQ+gmOUX4PzvICRS0tblWoqI0tI+zt8v3JDatZphf0EfSU8AwEKzYc+CkNHSzwKj7BPGH1S4+xiOkCH7gApGq2Ti+EUfdHaPesmRgGmnu9RJSAWRu0ghRbMDJWJVZiuNq6cOrjomHXL16G1xRddMLRbnTu8tXODfM77oH75QoiyWmkPwunh+PNLZrhSMG4jo2QRe47yUszQ9dmSQZXCZEaOfnWYVuCROg7DiLGzds0/TdUa40RgXEM6fWEEvSZlc8S8LNcNNszPL34vV/AiFaGDXUR2ulK/xuBwMoCuPyOFNP9DOVVZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 15:12:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 15:12:00 +0000
Message-ID: <2b075c91-db8a-4099-84cb-0102db5d3225@intel.com>
Date: Fri, 24 Jul 2026 17:11:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] drm/xe/log: Extend components list with hardware
 items
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-11-michal.wajdeczko@intel.com>
 <91c76e0f-073c-416c-969e-5cf81c0a330c@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <91c76e0f-073c-416c-969e-5cf81c0a330c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: b67f9bd8-c498-4eff-9b66-08dee995e907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1PnLVJ1vluoDTY5glFow7V/ZDEGA4FSdAmjaMMteA1jp/dcp/VDh1xbQ1A4A5q+pAeqHpj08ioP3O6UCwItTWgQsNzjizkQdNd4fN1kXuRcaG9aq6YGdeNJjmLav+S5S9n2mWAwxJvU5WC/PNlO8DHRAOx4DtIYD8R77uMb71sDj/hHWA4I1Uf+hwrFkfA1Y1CWJHcUUZpk6JPFTYaTYN9KS57rTFXNVK907WGPRh9NOPOMxobT0WRx5Q00uHi8z5Tpff8RdeumetN9zfYzPGYYQTeSZYnBe513JjbwXrwhUvK21Z+e8xZiOU+zCF1G02IiEAONCnl4gbTn/BwOthjdW6k+28bwX41v375fF6sWNuh293T3Msk39uk8QyA65bROubwhmWqaQ3cTt3iCqJNLJ5VdrQ/M1tM/P4akYr6hlfVFj5vOHsk91XS0P1SOklKl1zP6gK/pZPsQMiPUh2ZgV6JdStwTNJiVSMNWcqJjEtGflXLspyG4hdoYO9dRikfWZaaZSgBQjb2m6Zm6w2ZC2DXJjStKYBykfiJcXG4LO3yoChsNFHiQA7viDie/v65HVPi1161GE72GkUtp0oqFxaoHJr5Zrkel8vJdbzPipKdaUzHIOXolEGnipMixp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkN3S2M0VlBvU3N0WWQ5K016QVVWRE5VUkJ4L3VoSHhvVDdIQVpEKzd0U2x0?=
 =?utf-8?B?YTRwQkExRDU5TGk1TUJkZDJpZXR5WVpBU0RmUmF4RXdFUjROK2t4Q0VHamF2?=
 =?utf-8?B?YTRsbXhvaUQyVW5UaWtxNCtGVXZrNjhCYWZxQVhaa005cVIrRFBVeGtWSWlB?=
 =?utf-8?B?eWdsR0dnblhpVE54S3hxeWxFWWRGM0V6N1VXZm1CVHJmcU1DWGRPZ1lVWTA3?=
 =?utf-8?B?MFVPT2hMM1Z1VWhXaFNKL2lLRG1ycmlJR2lrdUhrSngwSzRoa0JuYnFEQldF?=
 =?utf-8?B?Ykh5MHRNSTN0enBOMzVQUHlSSktWQnRPYjM0VG83WjZlRkVVUEtNOFd1Wm1k?=
 =?utf-8?B?VVBEUHRoV1JyRU5JQWJUY2s3NzcyajZPN1NwUTJUL2t6c0luc0NoSE1lR2Jj?=
 =?utf-8?B?OCtnS0l3RUlIRmkydjJvQmlQWEovbDZuRnBzb3RUTzdQblkzUFNMNVpIQmNX?=
 =?utf-8?B?WS9pQTlBcElHNHlFcitzSUx6bHZuUXM3U0hXTGZKQVd5U3hURnJjZUpnc0RN?=
 =?utf-8?B?Wi9xYzdpNlhEY1piQnZBMXBwbzhOa1p6MHpSZTZKbmQwb3JLR3pLaldhdkU2?=
 =?utf-8?B?WjhBbmFENTAwSktMSGNMVnhVM0JaTDFZdngvby9ia2wrN2xNUWFtM000eXBx?=
 =?utf-8?B?WTZyQjhlaWdJVnBtWnRNMUtDUHZFZVY3Z3l0WmNrek93YzhFSk1MNU9HVjNI?=
 =?utf-8?B?dXZEWC8ybmNzT0l1SlF2NkdyK3FjMWFZbVJNbG44V3JRTHZPM01NMk9QRk02?=
 =?utf-8?B?V3QzZ0VnZVJxMWtxekNHOXhiZHo4Q24zYW81d2x5WHBGcVpLcHhUaG5FZ2J3?=
 =?utf-8?B?RzRSb2pGLzJ2MXhYdXgvdmROU1d6MDFrbW5VTGkyVlpZT1hKTkpnc1JRblpI?=
 =?utf-8?B?ZmxrdzAxa1d1Vk82VS80QUxBbjdYaTJQMGJ2ZHI2eXFtbk5PL0NaYWhhVjFG?=
 =?utf-8?B?YWdleW9uV3g1bTN1WHZqM0VvL2lOT0lKZERxTitvd0RRaHNtVFlIYkhYSzBl?=
 =?utf-8?B?UkZTZzgwWm1WUUtwVGYyQ1FMNlE3dkdIblZVTm9DK1o2eHh1T3JTR0VVcVht?=
 =?utf-8?B?SnhEbS9POEJ2QVE0RzNjL0lBVG5ESGtQZTdzMU9FSnljNFZKYUs2QW14bHNk?=
 =?utf-8?B?WW8yaE5zbUpiZXBPK0p2cnYydDY0WEF6ZnlveTRxcU1qVW5oMHF0REhEYVBO?=
 =?utf-8?B?TVNkaVJtV3lvbWF1TU5KOUhNcHE1aGdNUUQ1SmoyVXFnWnFJekYweVBQNWxk?=
 =?utf-8?B?S0Z3S0N6TFlHeThRd05hTkJSUnYzSzBQRzBCWEFSUW1nVW9iNVVIdGZnRkJj?=
 =?utf-8?B?TWllU1FOUnRYTEM5VXRVQjdQS3poRXJVUTNTblZJeWY2bXJFUVJSWjd5ZUdE?=
 =?utf-8?B?TS9rNE5HWGY2MzMvL0R2b3hwVVh2MVRLSHlzM3dYcDRCeXVtZTRqVHo1aWVk?=
 =?utf-8?B?TDZETlI1Rkg1MkRWTWxOZE80dDdLU0EwcEZURHlRRW1aalJkNkdmVWgxMHBH?=
 =?utf-8?B?N1hLQmNJZ25ZMm1nK1JFK1BFUmJ1dWlqaVRmUm5nTkxJVmQ5SkI2d0xQVUJw?=
 =?utf-8?B?amJraDZsTmJ4NXVnWkpWbE8zTFpjNk8xckVhMXNkeTV3VDNKWDd6WlJMMllB?=
 =?utf-8?B?NkN2VVpsVU1ndjMvNWhEMnJPU2xlRGREWXBNbVlHODIyaEh1Tkd5dHpQb2hX?=
 =?utf-8?B?Qnl2cDBMRGgyZVRPM2g3L3NqQ1NLck82elUwQSs1TlV6bjBvc2E2ZEpFQUFt?=
 =?utf-8?B?d0hTMGdXQXZIUStiWUxLeTAzRXFSc1dTaTZRa2hveTdpL2wwN0xNeFgxd2dL?=
 =?utf-8?B?cVoyc215Z0RQckVpdUQxYnFJTzVmdU5aZXdweldkWnE0c3VmWEdFUVJTVndz?=
 =?utf-8?B?VEZ2KzB3RkpxSWUvaXVhVmxwWE5nUGcveUhzamcrMFhTTnczbEJjT002cFNj?=
 =?utf-8?B?akdmbGtxc0p0QnhTaVhMZlljQ0xrR2NLNnorZFhrWmhTTFc1c1pYMGZhbzBZ?=
 =?utf-8?B?eEptemtlc21YT0t1RHlRbkt4ZEt0V2JKcWhHdjVFRHg4MEk1V1I4d0RJRC81?=
 =?utf-8?B?cWRrMnpiZ01mK2xiTXUwbmNCY2NDSFhiUStiT0Fma1BtSGp5d2crM3ExR3hn?=
 =?utf-8?B?SWd0UWNvb3NCTk5MT0NHQnB6bG8rYkZMdFJiYUlhenREek9Rd0plUW8zUE12?=
 =?utf-8?B?d2xWc3I4azFSLy96aUo4Q2t3RkVCbHdXY3grcHdKR0tYVUl3Wmh2TGFVRWIr?=
 =?utf-8?B?dkdtV1BURkVPTEZKSzZlVWJXWFpjU3prR1hFTkQxNW1mV2VyMGpVQ1hrTk5R?=
 =?utf-8?B?akYvOEJ3SEh6NjU3cGN6UEZ4SUFyNG9ud3ZXNlpJa1E0MzhPMkg3b256TUV2?=
 =?utf-8?Q?l6SYlH9VOpmXAN9A=3D?=
X-Exchange-RoutingPolicyChecked: ZbdzHm2n48hrp3CTY6elD81WepoWxQ911MyK6dC5BoOJ7FGKjwztWjp+san9Wz6MCRui6mstgahP8Trlv7twJRhgkqh6CukbqCf4eamtRR5d8mxKbQH9gdAJfBYLYGhRSlYXD/W+dPYL+RE/SrVDcclskgjINZD2ZQ7bAFRDGPHxNrji+8jBNXrGfXVf0CP2LcstET1Ft5IP53n8IIItxkhyyrwK3mLP+HZUsdSUH1NUaDdak59cS5kpEfR1IC16BskbdP6QJeipjyoX+xoh02JHLcZO9Yw/025jBOC58fYom6FjiMcD9Md7Vj/Puj3rlHJ9hlNvR1z87sMkVikViw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b67f9bd8-c498-4eff-9b66-08dee995e907
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:12:00.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpgkVFFWeVyD6S7bTXHHIHWWPs4jZ7qoGd3SgpI6e1I9XUmy5RArD5QvwPJy8rvfrBgZl3nz1HciLO4pWoFnbVDNLYVJe7Srf+5V0PcaZjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
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



On 7/24/2026 1:49 PM, Aravind Iddamsetty wrote:
> 
> On 24-07-2026 02:07, Michal Wajdeczko wrote:
>> Update our super macro with new top level hardware components.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> index cde86c6c08f2..edf4dc13377d 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
>> @@ -124,6 +124,10 @@ enum xe_log_location_bits {
>>   *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>>   */
>>  #define DEFINE_XE_LOG_COMPONENTS(define) \
>> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
>> +
>> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>>  	/* */									\
>>  	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>>  	define(SYSTEM, 2, DRM, SW, "DRM")					\
>> @@ -151,6 +155,13 @@ enum xe_log_location_bits {
>>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
>> +
>> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
>> +	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
>> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
>> +	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
>> +	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
>> +	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
>>  	/* eod */
>>  
> 
> For HW errors FW already reports the components, we already have
> definition of component "enum xe_ras_component" that matches how FW
> reports the errors we shall reuse it not redefine again.

from what I can see in [1] this enum was defined just as local definition and there was no mention that they are fixed HW originated values and wasn't placed in regs/ (like we do with all HW related stuff)

OTOH, these LOG components definitions are supposed to be part of the log ABI, so shall be defined in more exposed place (like our abi/ folder)

but there is still a solution for this.

we can define HW LOG components in this LOG abi/ as:

+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\

as this will include TYPE(HARDWARE) definition for each component identifier
so the XE_LOG_COMPONENT_SOC is still defined as 0x0608, not as a plain 6

and have separate HW components definitions as reported by the FW in another abi/ as:

	SYSCTRL_COMP_DEVICE_MEMORY = 1,
	SYSCTRL_COMP_CORE_COMPUTE = 2,
	SYSCTRL_COMP_PCIE = 4,
	SYSCTRL_COMP_FABRIC = 5,
	SYSCTRL_COMP_SOC_INTERNAL = 6,

and finally somewhere in the code we can make sure we don't change that accidentally:

	BUILD_BUG_ON(SYSCTRL_COMP_DEVICE_MEMORY !=
		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,
			       XE_LOG_COMPONENT_DEVICE_MEMORY));
	...
	BUILD_BUG_ON(SYSCTRL_COMP_SOC_INTERNAL !=	// aka 6
		     FIELD_GET(XE_LOG_LOCATION_ID_MASK,	// aka 0xFF00
			       XE_LOG_COMPONENT_SOC));  // aka 0x0608


[1] https://elixir.bootlin.com/linux/v7.2-rc4/source/drivers/gpu/drm/xe/xe_ras.c#L23


> 
> Thanks,
> Aravind.
>>  /**

