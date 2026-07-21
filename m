Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF853C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 13:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5910E347;
	Tue, 21 Jul 2026 13:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aN7gPHHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69B310E347
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784641832; x=1816177832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NrJwdWBl86fTse2zmEPlRhB+X6Bu7yZMSARZkw1D2so=;
 b=aN7gPHHgJZ3YIgDMAn73Ur4+q2B7c5tab4Io0YnJajFoRqfsJR++doXQ
 yJGhdnRGZiNUmax49WiFiw2cfUuYf5SaSnewMipVuJDmK+jgtnqmSB+7p
 GSp2smnvDELQnuJRmN9eh6dNfAx+k5NFmMh2ghTf0+Q1ftgiySaLui+5H
 Ik+RSlB7BHeh7cuG0Fc8LRxldGQKOt5GWV3piHycB6gB8WyCCxq0eviqa
 uRq89plXpeNFJ6lArVgpBjP16FYXG2J4zab4aG1K/CFVg63GyUC1vWDeB
 R3Cfy8FKfc66NO73TlMHBTjXjCNQItZ6Vpf9KiJLuvnHWzjXW7dPicWLI Q==;
X-CSE-ConnectionGUID: jSDgrVaHRBe11aRvKcP7pQ==
X-CSE-MsgGUID: tdSNeXkKRy2/xyQK60nMZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110793525"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="110793525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:50:32 -0700
X-CSE-ConnectionGUID: /W66fnLZQ6WeN5ue3iZl4w==
X-CSE-MsgGUID: iKWkTGzNTTGq05Vy/GHfWw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:50:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:50:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 06:50:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 06:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5uIcOZjQ9kvGB0776fcYvH19TGMOPYKe+cYmDa000+OOE3jpTiaLbFD+HdkhUQTnEEPvrp4v22noFFO7cm4wqQw6nhDs/SeXW0npCLSDJ2XhBfh74nMcfVVWi0bYUhjzBCsjc4yQPDL1PJhWjAxFPSnD596qTxDzLfHQ+6LhmBYEPXv4UNuLVvq0KVWF1BSWsQOnWRjaGqyaEbsd1J3+ikTE+MMTgRbYiSJ7LtsFJojH3pSg0Ec/YCS5kHUjTKMihII2babEz2bGJU09n7B+wRaoNGvYWIDU2BmqsoJ3bpPRjFjQY+6vEjwS+++0gvTGBt6G6VVggF8XRWP93ZLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpSlXDd0VDuqgjIZDU9hdpr4yQ/k7AFdG9Gm0Y/ckOE=;
 b=WTkJY9/ZI/q007CSxPCTV8t3RiMpEPbcmatjLpdMxiwsz2LXNOk6LQmvz+2vvrk0SWf8UmaZMbEc2e6huyY4s2tzuAd2UozEwMDLNLdxxEmJqK0TrkFJ4O23piEeBLv1M1uT0rkheEKUtgTo1gFll/VJLrJ1A13+chtJL4TNC/Y91BWwHj91RDAsWRHZSjfzNUZfydn7bm6SaDSl6335Cn5RHSoKbj+pzQSfzKyEKEeyN/MlhTnno5sq8Ft4vrHvGL7Jb9NiVclUsuczeB8ifpcGysYm698vo7G/NWveny7PCVwQnve/NQjCRs6OHCbvJq2Rat7B/DYJgTR7ubImQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 13:50:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 13:50:28 +0000
Message-ID: <c5b868e0-1fcd-4e40-bf21-182ae918dcca@intel.com>
Date: Tue, 21 Jul 2026 19:20:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Validate sysctrl response
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260721082953.640497-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260721082953.640497-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0158.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA4PR11MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4a2550-7c02-4da2-bea7-08dee72f0604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1m6wXSYV23GjKUV2gne/NIdDT/et3SB5JCbBOLu0G3hM1wTN3k+0FCpPokZ19tiqAsXzwYaryUWUCzP8vb2/5cIXnta+xk3/byYlX/lS2RbRTzvAc0N44n9RSPSVT5Hvo+vmeKXC/IylnIvJNsfy5LPdxA9+1vzzP/8ndHaARPdD40suizRNSLznBlvc1e3HB8YDIXmwuPDkFHZ1Ycr1ve4z351b+Vjq4BTGzUVe1K6PiLfeA6d6yvb2w8UJS1OMrFwd0VHm8BjxocCRuIjsC+Uoq46TJx9JMdv7BT3mFTgNTg/Ocosd+sH4Z0n3SS51nRTg5k1/A+cFhpASg0hOslgmt3TQ70S+ClqbGXoCD+WYLwnRQfTE5DfU1EaM1vZD6t6FlxFovVcZw7qWKToE//3aiBkYMUSaop8XDEMlvKTPs+XL56TBrFGRPkYygwbaydvh+xcy86N3Jlmkp9R3SYMnQMhGeHLkdhyHUfHXTqUElzwAtxyu2aEFRFdlKSxYrja85zJD+WhTvckBazMzgNsPKkKya3oSxu3tJTDf5EeLr1uCL8iEu4LK47xYUYG6eC4bx2L5eilEqOX8jCPTPd5MkB1hk8Dv3/IfNfAQaQ3LrwV24yMDFPcyZWC6lACSPS/4rt5hhkh9aLLwoBt31Z1ZfUc5ovE5mexZtDQLmRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEo1Y3l0ZmF4REppN0RLTi9YSWQyY1FCbXNOTCtPV0pJL09zaE1OYm5SbWJr?=
 =?utf-8?B?MHVWa3ZhOVYyTWdtWDJ4ZGpkWnN3Y2EwaWFGUlI0U0JhRHB4WG1hV1Y4b2hL?=
 =?utf-8?B?NGdrb1VtMVNzSVJwbVdpTkxmaW5BUjVCNDVySWFpVHM1Y2JQTXNDQS84QXJU?=
 =?utf-8?B?SXFIODFQUGhzU3drZS9RYXlXSE0xejlFTjY2ZTg5bnMwYkViRENDcGZJdVgy?=
 =?utf-8?B?dDN4aGhRa1lhSUJsSFlnTE4vaHovMnppNkJ2ZVNBSTJVSW5vOStIditMQVRU?=
 =?utf-8?B?TmJQY3NtWWszdUxIaHFhVEFZOVE3d2RYMUVYaHpwcE56OWJtdkhRQTcyNitY?=
 =?utf-8?B?TVYzcjBCRDZRcEwwWGsxcXREUXpBeTFOTGRWWHJMKzEwZUE2elN0ZXd5dnFt?=
 =?utf-8?B?V0xSYzMycUtUUkdZMXhJMlljTmhROXNoTGN2eTgwejN2dGRvTERjUmdzK1Rq?=
 =?utf-8?B?amRqN1h1UCs3a1dmakFLcE0rc2psd0RFazNWN05kOTI3b0ZDU0cveDRpYzVN?=
 =?utf-8?B?ZXBFOGV5cU5LNngwZzBsenMvTThwWGlBRm9KK28xbXlyRDdvSm5ja2EwbUhM?=
 =?utf-8?B?bmsxanh4azhORlM3c3hGWHJmQU9HcW9aY2lTQ3lObVJvNHpvNjhoMUFUNjFH?=
 =?utf-8?B?dUt5MkFJV1BVak5oaVBscTBhZi8xaGFadGlpWS9TY1o4aWNyckpudkRwaUcz?=
 =?utf-8?B?SUo0eWNxR2NTb2RBbXh1WGlCcEp1ejNtMWdQMEpNQ0lwUDVvVGVrQTZueDdX?=
 =?utf-8?B?TEJKcmMxREg1TWJMQ3I5Q21VWDQwNXd4WHN2bVd6bFM0Vkx6ZGlNYXNMajVi?=
 =?utf-8?B?RjV2V09MUk9IWnVVRjJlUVlhcnRUUTExVzU4U0drRjVPbkdTL3RkNTd1VXY1?=
 =?utf-8?B?SUxmOExZZDl2eWZEbnkwWWxNZHByQ1A1aVA1Qm9QdE1FL2U3dzlpanZHK3oz?=
 =?utf-8?B?cXYxeHJrSjJmemM1N1E2L0x1dkQ5bWp1eFpoOFFqTlByYnp1TlZjamdWL2pE?=
 =?utf-8?B?Z0dvdWxaRWlDYlZMMW5ZSVZiNmZTcC82UHNhaU0vdXZVZmE3L0pISUpFSkNl?=
 =?utf-8?B?cXhGKzZoNlQzeVhsaGRNcTgvN3I0Z3lwb0t2OW05R092aTFVSTJXSXRweTZh?=
 =?utf-8?B?US9XZ1J4SEpiWXNYazZWeWhyQ3lFT2traGxRKzJ3Wm9ZVGV2SDhXeGV4Qmh2?=
 =?utf-8?B?dFVBNWtJZmN5UXlrYlpoek4vSTRoRWIzN2xoekhtdkpKV2RKUVhxVDlZcW9N?=
 =?utf-8?B?N05MZWZCT2I5WG9hbzlvb1hqZmdKaTcveVpYNWlBdGp3bG9VZzl3ZjhKSldJ?=
 =?utf-8?B?b2I2RFB0UHNGV0l2REp5VHdPdlpqbzRTU01sSFVwWFE1cS8ySVNmWTFvNUQ2?=
 =?utf-8?B?S1h2b1JSRTJsZkt5K1lJbzZZcEt6TVNKeGt6N3FZcnhhRzllaS9qRHhVQlpl?=
 =?utf-8?B?OHR4WFpLMDBOV1dYYlNHL21EYnd2Q0tCek1KWVc1c2U4ZWhob015OVAwOUdk?=
 =?utf-8?B?WERpWnVZejBHSEtTWnlmeUhjdXdyM1NaUFU0eEZKN3NRVWw5NnAvMmc0eTho?=
 =?utf-8?B?MWkydmRyMFFodFA1TFR0VHhMZ09YbWZobFh5NWQrR01VT08zYTNyNytIbG0z?=
 =?utf-8?B?dElvUHRVWjFML1BtT1ZhTUhGTWt3OEg0WXg0RGVIY1JNUU9qbHhkZjF0WlA5?=
 =?utf-8?B?ems5MVRZbGc5ZWxFLzlXdmJVeHI3K3BNQmNVRVRqenRsV3lCd3lVaXRFMFhn?=
 =?utf-8?B?T1BENUpUY0dObVFhcG8yRzQyNXBnQmFpRU0rc0Z6bFZyVjNhdlMvZDF5SUQ1?=
 =?utf-8?B?RVgwVU16ZTVTME5Fb3d0bGpTTWlnZEQrckVuSlNuMGlxZlVzQ0kxcDl1TUlN?=
 =?utf-8?B?RDhwL0JQQTF4NFpENzZxa1ZqY2ZCS0RzaUgrTDJrZ2dtSEZDTnNjcjNobDZB?=
 =?utf-8?B?QUtKdFc5dzdXdUU5ZG1zbnFPaE9mUVNoOFc2VGxTQU13endEMlFIL1lCWWU0?=
 =?utf-8?B?d2xhbEV6c2hyMEJhWTJzSWJDM2tBcDZwbXUvTitZdVdCem1WYTVsclZ2Ynpq?=
 =?utf-8?B?QlhYOUliSGZBQkszVTVKdWtFcjF4R0xmdDBKSjR2QWpsUk1GRytQM0xMdks3?=
 =?utf-8?B?K3hIc2FEWUZOa2JnMWJMeTNNWk9aOEpkWmIyOHQ3MXpvNWNDa1BJSjRmRkUy?=
 =?utf-8?B?MEdOUWMxU2M5RFpqNnV1MWI1QzdZWG15QjZzMDFXWExEbmJGRTdzKzVrblpw?=
 =?utf-8?B?cVMzMm9aWUNPa1k5bE9HRCt3bFdnSFE5RzlRd3ZlVmVqa1FNM2VoNEZJVDRE?=
 =?utf-8?B?cFF1Y21vK054LythdWRXeHRRSGlIV29CTWI3Wkx6b2FRUWJnMzd1dz09?=
X-Exchange-RoutingPolicyChecked: XGO4wlSfF8ZjuIQhEzyrs2Dl6DTXZYzEywIVLOqTdL4OSl/V495Aev473RcoiMe24vfVytSWg+LS3P0YuBarxKs+6ow/yC16CXM6cxiSvf7Ne6wjL2rfT8A958xkrM7pjblWw+q4v8Jvq2fb+w+EhBk+W2DyQVtIN8kqSQnnIOsLaTjt/Ih6R5qbu+z9sfTp65Knod3QfVpnUoKHjU/RlyTOw7xm5NmlIt+Ose/wsGSl6Ofg39BamBRTiFtgflYLKs7JRQGS8AFzcyfZtwDgu9HoSxscegeBE3Q2wuajMuJNQZfNx3DSbtRiK2TGHFiw6up3jlarJZHGC9vJrMroAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4a2550-7c02-4da2-bea7-08dee72f0604
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:50:28.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC5+t0DV7wV1vgN/WodhoStUDBMAbCWXhQYc3xTueYvj9HX+secN6SBqkILBmmZRnpfirHsOPNUX4FXNiHKpdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
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


On 21-07-2026 13:59, Raag Jadav wrote:
> Validate errors raised by sysctrl firmware instead of blindly trusting
> them.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 5e294e9f8f99..e0bcd39e3b3a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static bool ras_error_is_valid(struct xe_device *xe, struct xe_ras_error_class *error)

parameter "counter"  to maintain consistency with rest of the code.
Same with the function name


> +{
> +	u8 severity = error->common.severity;
> +	u8 component = error->common.component;
> +
> +	if (severity == XE_RAS_SEV_NOT_SUPPORTED || severity >= XE_RAS_SEV_MAX) {
> +		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
> +		return false;
> +	}
> +
> +	if (component == XE_RAS_COMP_NOT_SUPPORTED || component >= XE_RAS_COMP_MAX) {
> +		xe_err(xe, "sysctrl: unexpected component %u\n", component);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> @@ -327,6 +345,9 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   		severity = errors[id].common.severity;
>   		component = errors[id].common.component;
>   
> +		if (!ras_error_is_valid(xe, &errors[id]))
> +			continue;
> +
>   		xe_warn(xe, "[RAS]: %s %s detected\n",
>   			comp_to_str(component), sev_to_str(severity));
>   	}
> @@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   		return -EIO;
>   	}
>   
> +	if (!ras_error_is_valid(xe, &response.counter))
> +		return -EBADMSG;

-EIO would be a better error code to user indicating sysctrl error.

> +
>   	common = &response.counter.common;
>   	*value = response.value;
>   
> @@ -422,6 +446,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			component = arr->counter.common.component;
>   			severity = arr->counter.common.severity;
>   
> +			if (!ras_error_is_valid(xe, &arr->counter))
> +				break;

Shouldn't this be continue?


> +
>   			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
>   				sev_to_str(severity));
>   
> @@ -532,6 +559,9 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
>   
>   	counter = &response.counter;
>   
> +	if (!ras_error_is_valid(xe, counter))
> +		return -EBADMSG;

Same as above

Thanks
Riana

> +
>   	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
>   	       sev_to_str(counter->common.severity));
>   
