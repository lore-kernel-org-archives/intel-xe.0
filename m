Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF38C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 13:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD85110EA57;
	Tue, 25 Aug 2026 13:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku19Gun+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0B10EA57
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787665216; x=1819201216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w0R213SD3bK11msabY3eNh9K5X2eOJHmeB97DK8HJ6U=;
 b=Ku19Gun+w0sZccelxLU8nJyoyzq9pSKggRmSn5homw+qzyrZwY0Ro92B
 fS33YGV/9JxSRcerXnE5NqXdBLaC7qd5tx9HnlL/2FNDc/nR2NIIIzwG0
 CtYlMqM5+kaAqRFK6ho/VEH0qNAjX33TUaJIOpK7+znprtWECka3TK5Cj
 7AvyJVPs8V1z8EvbAbSF+QI6Lc/Zrvmg81f1Mkcd2pMr7ZSejTte71fIK
 Fte3QRiGhbTqZzvpCdTSueR9MP5YVO+hgyt4gE5+5DVo6x8fxUAnl1t2L
 3ZEi5q2HmZBom/kvubTOeaRrrEtvlPpqwYof3J1wnmSbjl3cIgdRoG0Pf g==;
X-CSE-ConnectionGUID: B0pYVExnQjKgluTKUaQHkQ==
X-CSE-MsgGUID: E8ygv1DEQYOLPa28MaN/PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88148933"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88148933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 06:40:16 -0700
X-CSE-ConnectionGUID: ULXwNmQgTyCyZ46gfdOo+A==
X-CSE-MsgGUID: DLAT0Tj/Su2zbopS2WVXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="292137855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 06:40:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 06:40:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 06:40:15 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 06:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRoOYKAExpojV2C9n0GKchrszLqaIQ/BTw5u06Qg+xcXHMI5f23pMLrvchG12SXJ+jusYLpuIKl54oGsyrEpHFWSC0fPJQrShuEbTqGJ5nDss9cZZRE671yVbldTUy8fSRYtLlUDnZBPbmhFd74nlBiPe8HEVRuKFudIsKuOOd5MOh+UN3aMzRwALi4bJC5lDnUPN3vE02UzcwIC/86nt+gaS6E3xYX1sFU8V8asRgXqGr1jNebABTrcvxOnhagt7ya4cSmdXvrDIYEIBMnwxITFcQ4VMMreiFSQX6B+YmGk38Z3DwqGZ/wkFccs2lwZXj+B36LCjdpUyVGWNDmKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6k6oGV9eprB+hHi1N8XxbXNlu+5sdRL92ZaAkv1YD0=;
 b=WLmnH9Rf+PqNIdwfMlNfgu6j4gbZxXktQGwttzpHbaubv8SlIIaf3ZrZoUDqEbuRlSOBOXcEpvQ/GRg3LqpPbjRQqmxXx8/EOnAOEk6CqJkeuEKUi2oaNLoixoi19qwEycm5m12URsj3VJrrNhPmrVHJhozBbNYTUlUPIgMWWCMPYstg/GWVvxiXn/CE4/aljnvvAUAWXRrWpzQE9rX9jP6wzn2j+vOVc5oeYekqsUdS9yNCIZTGhSyHmLjNkzsfyIdipoMqHSCuGzq9l2VBw2NwgSSwkvvbEiHmCfi32UK7cAYEZF2T5W/WWz+A/4yXl8eMSTY0W0IyYPuOAe7w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by DS7PR11MB9474.namprd11.prod.outlook.com (2603:10b6:8:265::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:40:11 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 13:40:11 +0000
Message-ID: <5161e948-6830-4410-89d4-44368e73701a@intel.com>
Date: Tue, 25 Aug 2026 15:40:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Allow GuC CT for wedged device
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <daniele.ceraolospurio@intel.com>,
 <sk.anirban@intel.com>
References: <20260821122114.567725-1-raag.jadav@intel.com>
 <4ad586b1-14c5-4cd4-98aa-056cb47265a8@intel.com>
 <ao1okNN6fR9mQ0cM@black.igk.intel.com>
 <0de98b7e-2c74-4af5-933d-2c14f367ba71@intel.com>
 <ao2PSHSTn1jDzkWR@black.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ao2PSHSTn1jDzkWR@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::25) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|DS7PR11MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a114cf-e7c9-4120-6a13-08df02ae62bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: Y5yAjuQuUBVNVa4+F5N3KRASZiVXhimQ1hQZMz3ut76xEA0a7jkI+nvSuBFg7GhemS16DVOGk30jtI5+e0NZLESY/78ThiI2uOAw90t3pHHSFyTse7bxUMvmMh/p4vxcZOuW7cQcKURqPl5o40jswc02i35SyRrVgsRPMh3r/t8S5cjMCQvF6p6UzyRbDfM4vx6RgHw7q88abCcciCblESolIKN1c5FEXdAcOn8/0t+qn8EeA2cMK82Hj52LQZ6CteCx+U5hNLvcoE1/czdgkbA1niNgQvfEqGFmjwMdqp7z02xRCxf9G5ecqPOOtNAQQdPiglxIHAJ5cOIqq4gH4E64wP8iSiapCnt1KCefwliyzMB/kYRbYL9P0aM+aLKqPrc4F81CuDNi/GHxvPL9FH1rajtkLwaRlEDPFEPKNvUNOEvUokSOvFfe0BCF5oP2BxoXzwu/Pi9bjxMlB58fLFsP3vz5tOZTRfzXUXpp+lslrOSOXAsbhDfB4SNWQrCtTDJtBEBGLFsLBHi9EwsFj8Ile2O/v92OlKznssOe1DalKPETWexwmTsmVWwFuqEuU+bEdU2tavrT8gM7S6E2m68bgfHRflwTrAaUrr5qEyUOD/XiFXnehzSk/VlO+CD3sO9X42FGhhKCovJrqtAxM0JoSnPxfJrk16MYyLerh68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yml2OURUekMyY0Fyb3doUzVjV2hhck5XMVFhTklIaWx3QjZhRzBGS3hwamh6?=
 =?utf-8?B?eGxrYTN5UkpNaGFITDFFU3Y3Zm5ZZlNteXRCS3N2dnhqMUVzRG1mTlByLzQ2?=
 =?utf-8?B?ZC9OcW92TjdCMGxGUHVrSzhSQzRUTzVsNU5FWFdOSVdxb0RwS200NE9aQk1u?=
 =?utf-8?B?VVpzWC9FM1QvKzZ4U3NtVG9xeURqY1RELzFUZmIwYVFwUkVmL29KVkwyd3Mw?=
 =?utf-8?B?TjdLK3FaZDBmQzhmdFNxaFRaUnNWczNkRWQ1bTFaWFpsSzltcFBVaUwwYjlT?=
 =?utf-8?B?SWhKQVpDaythZ084MGJxZEQwTzkvMXQ0MnBhaVlwUEs1aGlHV2J4cUVHS09S?=
 =?utf-8?B?UmdkQk0wVnFnWmlGK3Q2ZmFnbVMvQ0gyYWhqalBSTmxFdW5lWmV0QnVrMWxt?=
 =?utf-8?B?RkpxenJZT0ZtY0NFemlCb2xjdlhZYk1QeTZkclR5ZS84WWx3Y21DejVZQzNS?=
 =?utf-8?B?V1gyZGU3QkFmOUd0WEhPakdieXdnZXl2OE55TlBoWkNvSW5DYzA3bHZ5dmV5?=
 =?utf-8?B?bVlsMVUxVFpQN2tydit1M3JWaWQ2RHlDcTd1a2FiM3pjbU82L3hIanh3dS9x?=
 =?utf-8?B?cmkwK3dqdDdIRkQzaHFTS0JOb2xVQWFObGtwSkZnNkJ1VmE5eXJweU1tVCtl?=
 =?utf-8?B?SXIwRWJNUFlkTEZKN3RoU2szWTVxYnZmcW5nRXJkQmhDRXN6c3VXWVRuN0Vu?=
 =?utf-8?B?UnM1OFFjVnY3dE0xR1I1c0NyTEkxUmpldVVhNmJEbWpZS0M4QkVONFlpR3Uv?=
 =?utf-8?B?Qy9OMTRUNFF1Tmx0UkRwbFlJMTdBUk9OYVhMbVNVbTJZNjlqOStnL3JIaExi?=
 =?utf-8?B?SGFCME82M1Q1bnA2alZCaWI0amJrSEVWNk9vV0MrOVFCQnNNVUlGanhIZ3pM?=
 =?utf-8?B?VXVVUytYeVRIMG9hbStxMVk0dXVxUTZ0U2pNUUxBQ2E4NTdsemt0QmdiS0pF?=
 =?utf-8?B?WXRlMlFpanU0VXFCSlpRZmRra0YwRTJkVWNKdHFoenBZbGVmeDE1dWY5TWg5?=
 =?utf-8?B?MldTZkIvc2JLdE5vd3Y4OURRU3RFWnUxQ2tETDNLb2RzU2VKcWRvMzVKTFg5?=
 =?utf-8?B?VVFHUmJSblpqWTRaTE5aY1VtMWdqODY3dDlzckdoSnMwbmkwc2hkTkRlb0hP?=
 =?utf-8?B?bTZmOHBscHU4VU9RL3BSNTd2aWkzYWRtcml5dWpZZTlZUXNvMkc0eTlwdWRq?=
 =?utf-8?B?S2FVNmk1QjdZNE91elM3c3VnM21sZjQ1Z1A3bWtZY2dNU1dwMzd0SlYybW5n?=
 =?utf-8?B?U2JlSW0zWTdEL0p0azRBWlprTmpta215Y2l0ZmNXUityL2dhRXMwTGF4Z0tV?=
 =?utf-8?B?anpiT1NpV1B5TFJTQWVoV2VacTRVWXNuUEplRHA2N05zdnI5WitzQVdHMmpp?=
 =?utf-8?B?VjV4WW5hTloyVEpMSkVNaGxMc2hRWk91RFZSU2FobzNOL3V4TGM5L2pWY1Mv?=
 =?utf-8?B?WXBKYlptV09xZVd1NHZndzFURElqTEZCLzdqOFNpSnFsSEVvdElkVmdFR3pw?=
 =?utf-8?B?TzRINFBRY3k4N1ZvQTlaSEtxQ3FlMHl2T0RudUZLTGJIeWJPZDVwcW05Y0RB?=
 =?utf-8?B?S3hVaE1ZY3RPdjZxYml4SDdkRHoxS1orTm9ScDNSM3lCRmtOU2EyYk1zanZC?=
 =?utf-8?B?d3dVWlg5UFBjVFZKZnVqM3VsK2k1T3NSTzVuSWN5aElybFZ1ZDlmY1QzK3JB?=
 =?utf-8?B?YlRqd1JSRndLajZaSHpVRVBsRmNCcXFHRU5JdjBqMlQzem5EelgrZDVIMzRL?=
 =?utf-8?B?RWVBS1JQU2trcnduaEZIWEsxdzBPcWN0azNlblhNakk1Mm5sQXBnYWNUODJy?=
 =?utf-8?B?SlRUQ2VuR0U4eHlkNGs2VllUT3dJUnVjYmdzOFI0THNpVW5pNTdoM2RjNC9l?=
 =?utf-8?B?emwzNUNoeW5LQmQ5ZjJZRmExZWd6bk9PeTFLNmZXOVhEN0NjVXFCYXlTMVNJ?=
 =?utf-8?B?WXM4OFJCVVJxekhNQjhyZ1U0ekNsUUVNekJpZnVnVEIvYlIrYlNGc0w4cncv?=
 =?utf-8?B?TzJRVHR5VjBoMmphOFFzM25VOXlORm02NUpEeE5qaEZkM0c5UisyRTJYS1FP?=
 =?utf-8?B?MHFocHBXdmZxY2RBck1ySm1Zd1N5TlNhMGRPeFhLbDU0N0dnSVQzN1kzeUV3?=
 =?utf-8?B?VEova0s2VGV2NWRmNkNGM040M3Nzcy8zRG9nTS83NEIzbXRSY1RtL0dpV05L?=
 =?utf-8?B?VWtlR0lWbWFBcjNZb3FZK0ZKTWN3d3R4VlZZK0tHL1k3ZEgwLzMvYW9vZHBX?=
 =?utf-8?B?bzV1Qlo5dllZK2hnRUYzNEEyV05CaWUybDF3RFhWejlsWUlkczUzbW9GSlU0?=
 =?utf-8?B?OUlhTXFoU3pYYVZDMzhyNlFOT3M2TVhwcWFIZld3Q1V2RU5UenJOdz09?=
X-Exchange-RoutingPolicyChecked: l+qE6nJxgsV7dlOu7jy1dHf3WB5srAc58gcJOFafTB3TXkiWE/NufIxECFioYUZoi9Jnissxb/eSyPH9g+LgRPd7NmY2g+M2/CpTDkbWxc+3JdYOdu4iwP5PcME6i2hpVguK5smN0E5hYq6xSflr9IK0YtmixGNuIrDdVBrVjlkhi7ReXojJjvp83AHS2xCKSpsvhcJ8mKmaRj3c6cCap+trieqCplwxuY6uIen2JS5LkOmbVr/hUZdWoS7iw6Regn3Jx9i6EnorJy3HXzog7YgCu0+tbR8eC1YI86lSM+xftidnbrA8/ShGma8uqboHIVTqkuTNKZCNSV966AxGyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a114cf-e7c9-4120-6a13-08df02ae62bc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:40:11.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeBZUp0CRfsxM/N5WHZrEin+GLbMwh1L/Fq2SJWDoKbwQj5XUCCap2Gv6rOOPWGT37Sm7u/Ujk1WX6aqdVF4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9474
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


On 8/25/2026 14:49, Raag Jadav wrote:
> On Tue, Aug 25, 2026 at 12:53:35PM +0200, Laguna, Lukasz wrote:
>> On 8/25/2026 12:04, Raag Jadav wrote:
>>> On Tue, Aug 25, 2026 at 11:39:44AM +0200, Laguna, Lukasz wrote:
>>>> On 8/21/2026 14:21, Raag Jadav wrote:
>>>>> Commit 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable
>>>>> cancellation") introduced distinguishable error codes for g2h failure
>>>>> cases, but also blocked GuC CT for wedged device. This is problematic
>>>>> in cases where we want to prevent user from accessing the device but
>>>>> also keep GuC CT functioning on temporarily wedged device. First user
>>>>> of such requirement is PCIe FLR handling where we require uC firmware
>>>>> loading while the device is temporarily wedged.
>>>>>
>>>>> Fixes: 50fa9acac26f ("drm/xe/guc: distinguish wedged from recoverable cancellation")
>>>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_guc_ct.c | 8 --------
>>>>>     1 file changed, 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> index 5c4733da385c..97e38147effd 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>> @@ -1062,11 +1062,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>>>>     	xe_gt_assert(gt, g2h_len || !num_g2h);
>>>>>     	lockdep_assert_held(&ct->lock);
>>>>> -	if (xe_device_wedged(ct_to_xe(ct))) {
>>>>> -		ret = -ENOTRECOVERABLE;
>>>>> -		goto out;
>>>>> -	}
>>>>> -
>>>>>     	if (unlikely(ct->ctbs.h2g.info.broken)) {
>>>>>     		ret = -EPIPE;
>>>>>     		goto out;
>>>>> @@ -1813,9 +1808,6 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>>>>     	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>>>>     	lockdep_assert_held(&ct->fast_lock);
>>>>> -	if (xe_device_wedged(xe))
>>>>> -		return -ENOTRECOVERABLE;
>>>>> -
>>>>>     	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>>>>>     		return -ENODEV;
>>>> There's also third instance in guc_ct_send_recv().
>>>>
>>>> Shouldn't we distinguish between temporary and permanent wedge here rather
>>>> than removing the checks entirely?
>>> I thought of adding a xe_device_wedged_perm() but this would create
>>> confusion with existing xe_device_wedged() regardling it's usage.
>>> So perhaps we need a better name? Or a better idea? Open to suggestions.
>> What about xe_device_needs_recovery()?
>> In this case, we should also change the ENOTRECOVERABLE to something else,
>> maybe ENOLINK or ESHUTDOWN?
> Or make it the other way around? Perhaps xe_device_not_recoverable()?

I was also thinking about it, but then I thought that it's too heavy as 
the device can be recovered with some recovery method.

Now I see that it's a consistent terminology in the driver for 
permanently wedged device, so yeah, I think we can go with 
xe_device_not_recoverable() and leave the
-ENOTRECOVERABLE error.

Lukasz

> Raag
>
>>>>> And it looks like it should be a part of the FLR series. This patch doesn't
>>>> make sense without this series, and FLR series doesn't work without it.
>>>> I'm also not sure if it deserves the fixes tag, it wasn't broken at the
>>>> time.
>>> Agree, will add it as part of FLR series once we have some conclusion.
>>>
>>> Raag
