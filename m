Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E5AC19F4F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B943B1129C2;
	Tue, 30 Apr 2024 16:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2TUtmLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCF1129C2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714494245; x=1746030245;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RzSxe2VZsKLglbXCiad6Z5ZJ2NWhU6Oxy477XtCAJHE=;
 b=M2TUtmLsJKW5km37FymOfuoETV1yXIliD3DmmkZKUK8/P4ZrLhy9i6Vr
 2FeqCTDE0tzKMsszQC0un7ythnXAsNt+vTdvJ64psJoJMdwwFJvpsZhc8
 2DHf7pOKbGcPsqAG6Ioek9ymwf/rzcPFugLMQ7uHo1SZc6Rxn8C7GxPCa
 rHG7uu9WJaFb7wDxvomXnOaPB8gcvWLdRdAAAb/Pgz+dui7fMBqUka2k5
 RH8xlDt1aZsT1PIl6N+l2mS12HQYMzRtCumzs+/WJPrmCR8i5dpRUOEXg
 73mOvWXrjp7I6pd9z/c0A130IsrD4y2ghXXEMj/AYCTqShNNURu1BhQ1k A==;
X-CSE-ConnectionGUID: 7nHJqXm/R02wRvxE6zPGpw==
X-CSE-MsgGUID: /qbALfW3T3SNonMrUD6gzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10751368"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10751368"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:24:05 -0700
X-CSE-ConnectionGUID: SrDTNusWQ6CKXHaz6o1THw==
X-CSE-MsgGUID: GDDDqW87RjiVr+khedY9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26515620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 09:24:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 09:24:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 09:24:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 09:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmWUadWYeL/+ziBf6TTOJJ9Mud3bMoMRDaxWkWMHSHMPcjeuLnQ30PF9Rh7ZIn3b1e0vtl8BF8RWJlAefLVQPEDj2BTPDWwF8hWLg8MqH6mgHgogHEGnqSfGT0ZKCvSRwoGIJr7JtG/D6QS5Nur1Z2rlurQ9L6SFYksw8B7LwxuB1YFMFGEnY81leE8EQFc55mAFdA4Na5Yu9YLES+hHxku9vLMD8xwGp6dQv+sSGLl/zKrYZ7ftnWqpHrJDjcZINXRnlid5wblDaSwdnFlegIum4HSHMGEYV/29dxA1DI94b/NqUTAgMgrWlJZBqQGYD0gh1DfBPHOAtH+fxUuJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRtqWqPuCy53B/EuAcjhXKt06q1OhOW5aUOMFsPvvAA=;
 b=LZv4CBMgYAkYbqsHe9x5qlFsAFLrLbclSOlon9wSnkvzlBuUVSSdG2l0pK7XjwdcXEj2Dv61ro6cQgBAGTMZEjMYBnMQLDZeinHTfa+Qc+/SxFrH4e6yxPYbgypG+4Q1/bLG4YUXj50AOgUesHB+XpqYuqPQgcdFrERE7T3WNDoZR0a3BYaTA8N865cNzcXejHSi++yLX0ewS8Vd9vhH54RhaFkpejxAk1OeouYJ6LWYW8+4Iuon248EBJ+5qgvrt9lMwQMlMB36KM1O6wCAUmV6aJoIrwCFBULEHahmqlyEahs8vQ9+jyAjW2XdF1RehX5hRzKF1AujJ47tsyJsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 16:24:02 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 16:24:02 +0000
Message-ID: <d50f96bd-be0e-4a54-97e0-4d179c7a44b8@intel.com>
Date: Tue, 30 Apr 2024 18:23:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Refactor default device atomic settings
To: "Welty, Brian" <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
 <20240425222346.13026-6-nirmoy.das@intel.com>
 <41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <41eb1fab-d9a5-45be-9c95-05a34fc7685e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SN7PR11MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 416fc103-f463-4253-16df-08dc6931f279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3puNVlXZ0pYTCtxWjhqbklyUUx5R0pySUZoaXQvdUZqZitTcVZHL05CUGtL?=
 =?utf-8?B?cUF0SlBrVmZYYmpkMmQzekhRbi9mM0owMk9IL3JCUTlFaUlMeGpFWmx6S3Fa?=
 =?utf-8?B?WEdvV0U4RzVhNEpWcHdpbHRlM1l6RkJjQTNHL3RESzRCb0J0eXo1bHc0d3lF?=
 =?utf-8?B?NkhxeERUZm9kZWFZSTRjT21SRXVuQVpDRUhZMDU3REkxRjVuL0lCSjhQYXFJ?=
 =?utf-8?B?TUZpRFU1MlduNjdxK2Z3YkFNWnc4WnFmZFR1T3FLTmcxMGhCOVZzYlY0cXpw?=
 =?utf-8?B?Z3NGTnI2L1dlSDdDZXhBRnZvVkNWcnZXaTlBd0lwVEthc2NOUWRZQWNnQ21w?=
 =?utf-8?B?a2dTQWFOQkhyTWhJRE9BK3JNbVVBWmxxN0pBVXdsanVRQ2ZLNmxpRnErSGF5?=
 =?utf-8?B?YnIrenlKcmpTbkk2OWZCdHZud0FkUWVVWHhrOG10RUlLR2hIdmxzdXBqd3Zq?=
 =?utf-8?B?SytoTkhHc2ZnWmhKYS9uQ1NyUTZQMDZ1QnpVSU1Hc0s0LzZReWppQ1ZXY0tD?=
 =?utf-8?B?Sm8rRysrdy8vWTNNWkdnaHFHMWJRRnVmamVZUncvV0w0MjFKSkVkcC8xRVRL?=
 =?utf-8?B?QnVJQjFqU2x4Y1RqM0JUdU11NTU1ZCtheVBQcjFGN3Y1WHJMM3N6RU9jWFZC?=
 =?utf-8?B?RXZSZnoyK2prR2szNE1hUVgydTljQllQemcyRldkT2VJbE1zd1RSMWF2Z1JP?=
 =?utf-8?B?SzlqYVFQWG1DYnZEekd3N1VXckNHaVpTWWN2L1prSVpnc0k5aWlyTEQ3ZHYz?=
 =?utf-8?B?c2RYZW43MXlySVRSMDh4VXp3WE1yT1F2cUhQRGlCNDBNTlhDOXpMelBkaW0w?=
 =?utf-8?B?R3duenVDMUpSTk5ER0g1eC9OMWoxdlVZbnZPUzZsNGh5bUl3K1FQUG13Qmpj?=
 =?utf-8?B?MVhFamg1ZDNRaHQ0RXp6S0FrelNtZVBqckozWmowOW9GNk9sdWM3WE5GcHE0?=
 =?utf-8?B?VjgrZWpGSUZEZ1NGNDdtVDhnQm9pTS9uOVJpK3BLMWEzd0o1S2FsRDk0bmpW?=
 =?utf-8?B?SStrdVp5YitaTGVXWnhSc0JLWm1rOXFuanVYS0M1bFJNbkpkUEZ2QmE5K0Fl?=
 =?utf-8?B?M0lRUWNtOXY5MGE4Q0s2ZCtITlM1OVZ2R2NubFN5ajJLc0ZTNmd5Z3Q5cERS?=
 =?utf-8?B?SU5QUVU2QnVRd0hKaThhZG4vaFcrNkRvMWlWT1ZKMzJaU0ZoL2pJY1lmREVM?=
 =?utf-8?B?MHp5dkh6Q0luVkllMjV6YlRhbVRGMnpDRktwYWVUa3hITjRiazFucll6RjRB?=
 =?utf-8?B?V0NUMGlKazIyQXhPWE8zQXlMY1locENKOHBUUzhyRUdMTVB2My83amFadmoy?=
 =?utf-8?B?OS9SVWd3eVpUZHhmSUJKWVNVNkFGOFVNSSttakZjN29pT3NMZUo1RmxiZkZa?=
 =?utf-8?B?ZlYycHhJYXNZLzRSYTdHRjdZUmJzK1RjcmxPV0tSYWpYY2FRS2MvcGNIZnFL?=
 =?utf-8?B?VFg4N05SVHhheXozbHpsMWhIMlRtcXpLZVNvUlhPb0hxSVpJdDVqM2lZOE80?=
 =?utf-8?B?OUdBaFJOeER0TTN4UkxHditseWNrR1A3b0U1Tlg3NzBKcTQwQ0FFZFhDNlBn?=
 =?utf-8?B?ZHcyamV0L2JrbVc5bE1mS2NqUlphTVh0aytxU2FoWUZweTY2dDZndy91OGdP?=
 =?utf-8?B?Rm0ycXdXelkwYU5WMERDbTJpK01FOWxVVzMydHBnTWZuRmg4ZXRIVnk2RkZG?=
 =?utf-8?B?bVdTSU5Gd294dlIvU1lESDhtSGJrNUs4MllLQi93TDdVc0trS2ZhM3RRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUpKUXhKbitSRmRMTUMwZ0VBcW4yVFB4aERBVlB0cUZ6SWVxYTZtdFFhVkxj?=
 =?utf-8?B?bEVVclN1WnJjRkNDRTA1Sm5LaStWRkZMK2V0MFJLLzhsWHMyMEw4aEZQdU5W?=
 =?utf-8?B?Y2JoQWRxbkJkQW9YWlAwa1hHZDhTdzlBMk9kR1RSdVU1MXRDWnBWckNRQVVJ?=
 =?utf-8?B?d1pLN1REUVdyWHlncC9vaElnNTE5dTl6SUFEd0UrRGxsRHlRRm0wSXVjSTBu?=
 =?utf-8?B?L3VZckk2RVhWWGpHVVhHNGZ0R2luZVFPcW80d1VvN2FuemZVKzlCU2lENHN6?=
 =?utf-8?B?SnlHZU1vYk5qZGd0QlA0MmR3ckVQM3Vzd2pEV0pUb2RwRlZ6ZXVEOFpiS2gz?=
 =?utf-8?B?NHdRSnpmRnZvSTcwVGg1bENNRlFKRTNpV2MrR09GUTlNSk9CTS9nbnlwMVp4?=
 =?utf-8?B?RE1XaFR2T21SYVZQanNFQzFDd2tKcG1aNHRhSTdMMEI1OXpoV0dUUkN2dTZm?=
 =?utf-8?B?eE4wcnNHeStRRW1ET0twRDd3YTBTdjFpL1h2YnhwVmhMYWM2bXo3UjVIQWNp?=
 =?utf-8?B?dHN6MFJBL01GRGxScDFmdkRCeGRZbHpqRjRaSzVYUTBtdDRWajExb2diNEpL?=
 =?utf-8?B?N0FMNzIwYWZlSTVmanVRek9WNTBFUGR1R0czZWNoS2JCVFQwNWlFcDE2NnVK?=
 =?utf-8?B?VGJwdGZjbkxZV0VMTW1vblY5MlVRd3FNejU3NkVnaHNhNXZGU25SOG50OGRm?=
 =?utf-8?B?Q0hwc1pFR2ZmYnR2NDdUZFN0QjNQNktsQVpRamlqL1pLNlBmUHZGeXFOYXZp?=
 =?utf-8?B?b0owM3VtSEdZZ2pYb01zSTBlcmc2TTZUc01iVURaVWhhUlo2aXBFZ2VGUFMv?=
 =?utf-8?B?NTYrbm1jZ2tiem42bHltOEVuNGkrYmw5N2JzeW5LZ1RXMm8wZG1sRTUxM2lD?=
 =?utf-8?B?My9hY29VTVpjZlh0QlVLcHdOQ2pGYkJFbDNzVnYwMkpDT244c2FLV3R2OS9P?=
 =?utf-8?B?dUl4RTRUdFV1V0lCaCtWYmE0TG5TSXRpTjQ5bkRCY0czdU05dHBvRXFkY0JH?=
 =?utf-8?B?QUxKM1F2Tk8waHZYeE0yaFN3V3RuTmhYL1crUHpvTjhQU1NNVDZkOW9GNDBH?=
 =?utf-8?B?VWJCOWRjMkQzNG5Nb1hXUjk4TWhhV2N4VzZ4YVQ0VlRGYTcyQXFaQ1BrS2xJ?=
 =?utf-8?B?ei9NUjFTRVFVNktsTkM0R2lFQXpKbnFXaTNObVFaNTNUWmg4N01LWTBSd1V6?=
 =?utf-8?B?cFh5a2paU0oxRWt2eDBtNHZMVTEydHltV1pYWGM3WmdTY0FrNXIyYlE1dndG?=
 =?utf-8?B?bTVmSy9LV3ByelNjWk9tRkQyNXQ5L2p4K3ViaGdSNUlZaVhRaElYek56Y1Vo?=
 =?utf-8?B?VVpWZUhCQVN3clBoYU5sL0g1clJsc1lRSVNaMDVnZE1aSGk2bkswK0RFb012?=
 =?utf-8?B?c29NcXYvMWthM3VPaWJjVDZBN1B5QlVjSUdLck82WTFITkxqRXFacnNxOFpo?=
 =?utf-8?B?ZlllaUprdFZtc2E3V2swVHVvdkl6UzFBMjB1Y1ZyeEpEcmFLTGVCS0k4K2gr?=
 =?utf-8?B?SzNHVnh5MGtOVWY5dU1xazkvanI5VlN5WkVsZUhPQ0p0MXo1MTB5VnBTMEZr?=
 =?utf-8?B?QWlwNzV0QUNvV25ybkEyUk1INEpzeWxTVE4wRjFEVHBvODBnc25jSE5ONzVX?=
 =?utf-8?B?NExrenpoS0V4M3RjY2lnM0N3aEk0OWNjZmlvczhEWHdEVHk5ZkVBOTFyNCtS?=
 =?utf-8?B?WFlEa3BvQnY1VkxtbzJXb3R2QUQ0aEV2NitkNENVT1RSNkl4QzhNTXZwdWtq?=
 =?utf-8?B?cE1yTW1IRVRaWkpWY2dVcWdVa1pXUFhXY285elMraGlDRFRNYjZKOGJKWGpQ?=
 =?utf-8?B?a2FOWnpjcHdkMENjakJHaWVHbkVaVDB5RHRsMzc4YWZ5V1h0ZVNSbUZVM0ZM?=
 =?utf-8?B?alE0ZUNTNncxUjgyY01GZ3Z0TDE5UVYrcXNXd2R5S080LzJNL3YwWFlaRmtF?=
 =?utf-8?B?bGhIK2hJdm02cnpMRW5kVTlzQVFqV20rQ2pBUVIyOGg4dEdwN21XL28yb2RW?=
 =?utf-8?B?UmJrcEd1ZmN0cHZjdHV4YlJZNklad21kMGprMmN2YkdwRFBiZHUvODJlZzNZ?=
 =?utf-8?B?bk5FejJCWUYwcjR6TjJVSU43VVpmS1B1Wk5SWEozTmtGbEpwYk5sQTFHMUdX?=
 =?utf-8?Q?SK6zesCOf4s+q2GzPE/osJigA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 416fc103-f463-4253-16df-08dc6931f279
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 16:24:02.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXFPf7QjwZvisDelXu53JU3prtDhOIGMFhm8mmRVg/12W40PGriRjHOtzGCbg8E8v6XosEsqhohrphn2mhV5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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

Hi Brian,

On 4/29/2024 10:14 PM, Welty, Brian wrote:
>
>
> On 4/25/2024 3:23 PM, Nirmoy Das wrote:
>> The default behavior of device atomics depends on the
>> VM type and buffer allocation types. Device atomics are
>> expected to function with all types of allocations for
>> traditional applications/APIs. Additionally, in compute/SVM
>> API scenarios with fault mode or LR mode VMs, device atomics
>> must work with single-region allocations. 
>
> I think additional patch may be needed..... for the Compute mode
> handling.
> I'm not sure correct thing will happened for 'shared' 
> (multi-placement) allocations.
> HW will raise an atomic access page fault.
> Our page fault handler only checks this was atomic fault and proceeds to
> migrate the BO to VRAM. I think PTE_AE bit won't be set with your
> changes, so seems are in infinite loop of atomic access faults on same 
> address.
>
> I think we need to fail the page fault in this case, so HW raise CAT 
> error here? As atomic access not supposed to be allowed for above case
> until future uAPI is added?
>
> And need IGT test for this.


Thinking more into that, I just realized we need preferred location 
madvise hint. Currently I am not aware of

a good way to change backend of SMEM+LMEM bo. We don't migrate the BO to 
smem on CPU access, that would've helped too

but we need those to be implemented which is my next priority after 
getting the defaults fixed with this series.


Regards,

Nirmoy

>
> -Brian
>
>
>> In all other cases
>> device atomics should be disabled by default.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c | 24 ++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_vm.c |  3 ++-
>>   2 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 5b7930f46cf3..a8e9e8592c43 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -597,7 +597,6 @@ static int
>>   xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>            struct xe_vm_pgtable_update *entries, u32 *num_entries)
>>   {
>> -    struct xe_device *xe = tile_to_xe(tile);
>>       struct xe_bo *bo = xe_vma_bo(vma);
>>       bool is_devmem = !xe_vma_is_userptr(vma) && bo &&
>>           (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
>> @@ -619,9 +618,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct 
>> xe_vma *vma,
>>       struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>>       int ret;
>>   -    if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
>> -        (is_devmem || !IS_DGFX(xe)))
>> -        xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +    /**
>> +     * Default atomic expectations for different allocation 
>> scenarios are as follows:
>> +     *
>> +     * 1. Traditional API: When the VM is not in fault mode or LR mode:
>> +     *    - Device atomics are expected to function with all 
>> allocations.
>> +     *
>> +     * 2. Compute/SVM API: When the VM is either in fault mode or LR 
>> mode:
>> +     *    - Device atomics are the default behavior when the bo is 
>> placed in a single region.
>> +     *    - In all other cases device atomics will be disabled with 
>> AE=0 until an application
>> +     *      request differently using a ioctl like madvise.
>> +     */
>> +    if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>> +        if (xe_vm_in_fault_mode(xe_vma_vm(vma)) ||
>> +            xe_vm_in_lr_mode(xe_vma_vm(vma))) {
>> +            if (bo && xe_bo_has_single_placement(bo))
>> +                xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +        } else {
>> +            xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>> +        }
>> +    }
>>         if (is_devmem) {
>>           xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e41345c1627d..ac08b6fd537e 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -805,7 +805,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>> *vm,
>>       for_each_tile(tile, vm->xe, id)
>>           vma->tile_mask |= 0x1 << id;
>>   -    if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == 
>> XE_PVC)
>> +    if (vm->xe->info.has_atomic_enable_pte_bit &&
>> +        vm->xe->info.has_device_atomics_on_smem)
>>           vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>         vma->pat_index = pat_index;
