Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E600C9833E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 07:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2765210E7B2;
	Mon, 28 Sep 2026 07:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9hPwxpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CF510E7B2;
 Mon, 28 Sep 2026 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790578913; x=1822114913;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IRsa8VA5/zWdUy8+9GZ6MrGE5wa3vWaVoNEbc3bxVtI=;
 b=j9hPwxpQ4C+luEowVRXrfpCyTV6ICfxgOGO7oQbmWzpeAv6snhfu0kwJ
 0p9MbemfXK2DT5zfwP8IGRXnKbhUxZN3zhdJSD/lgFWvu3ahkYzbOsixx
 PsGk3OEHco9SkNXcl+HTpUGrCFQgoS89cLAgqqxU/oJ94hStqFOlFfXgh
 vF5tAzeBDTxvT/aaW4sYDPM086KX3XuKShMfeZWj6xq+ns4ugT2XbowGD
 i0sYVcC0pscils8/LFKzsjN+HHSIrmA+TL2Rxm6S/AGC2/UoT4x4iDhMz
 jEBR4unXpVSEVPNT1qT8kSpPvt1SK8hB6Xn400DLkM6Tvu4mupx1rX7eU A==;
X-CSE-ConnectionGUID: fUCvqGD9SViYg6i5IVpaDA==
X-CSE-MsgGUID: mDf/ZKf6QB2R9n7yckDpHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90136678"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="90136678"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 00:01:52 -0700
X-CSE-ConnectionGUID: +Lt0gJqZRcCjwwwibgRYxA==
X-CSE-MsgGUID: mEioJQT1QY+qjCaP+sYMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="274513836"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 00:01:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 00:01:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 00:01:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 00:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK93CTer4RyoOpBv3rXTylO3D4nsg236lH3AhQiSLyRbJMGj/rR4IEdOYbMDhDIUVbSoH46x1F5N4WHY63P1OFkBMObKOp4LiNgrDA0TbyVeujEEibD2tmXDX/vX1x2fcdubd0cM0q3Hh8fWaqqH47CO2NZPFhkFSKrq5gNXZuX4Bx9LDKu5q1jfXtZgkN/bqXiDngCiX84wUd5Gr4m/2krt1asBuWM7wHSb1TZgPYHXNHkIpFwS9kj8MNPi1Ul1/FZ/eypaMBmvHayZSuUovu5Z0/fFV1UQreVRKE4rbOK9UouzZX++pexbO19rGNb/BSD8UVlLltNWr/YJE7EQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3HuOIjpQT982zSSLSUsBGMZk5W/eIHByORWmcGk0vg=;
 b=v6syZUfhsUUyFCnwR09iSXYT4vBLSi3reypMac9p17M8m9PJcI/znVeFhYKCOZDZb1xeUhO4di0D22ctuPsomjeaJXfZTtIUVN8gl8mNfwk9Pdym2YaDEIEZ066ydMjHgit2Tt6050iJYvJL0DPY8RF+8ltqX5twcnnr8wrAwvQEvS0vW4rkTULUPdROeOTeB5r6q+R4SVfZb6qGbBGe6yas8Wpo2FbgfkC0GL6reVfOHDucFWjFFEp3Ksi6XPdZ2zsJ0bUwyAzfnP+VowVbxhavp8wm322QhkmY42J5ec8qyMe9/Lbw+e9aup9tsHTtKDCMkhcM9JwCw5NaPBDfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Mon, 28 Sep
 2026 07:01:50 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:01:49 +0000
Message-ID: <26087b72-fd59-42d2-9791-adff6924a645@intel.com>
Date: Mon, 28 Sep 2026 12:31:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/display: Don't require a 1:1 pipe to port
 mapping for DC3co
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <animesh.manna@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
References: <20260924055734.2138787-1-suraj.kandpal@intel.com>
 <20260924055734.2138787-3-suraj.kandpal@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260924055734.2138787-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|SA1PR11MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: 6262c4e2-486f-4dc9-dd30-08df1d2e5e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|6133799003|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: AVmCkLX92L9wa9I+70TnG03KHzcQY9enCOS/ODMKCNlq9h/5Ap173O1nh/QgNTIlt4i4NH59Bps80WlQ/4KtDPvNp7N6rEwvRex2O6FaRw6M6LT9/9xNGGWOmTozfiu0fG3oY0STRIPwTOAV+nq+6CSWE15I7LF0/9eeIGxcnRH0vra6h3Gf1CyHsltKICXg2bKlzNYOjJ4UuvntDF7+V/htm3840VqEEYA8nVS+qXIoOy5hpaXxTeTmJ23tw2keob/5UkBoqjqWSXFpONSjgp+5kb4k8+VTeQc+sm8zQZEKCJ0vNensAbRMvc61z8Di4qymO0U9y5iIMVHtsIU79MwfzR/8FHKd4BdZuh2OvcTaqLfzjeEeRcA7a0d9z8BMFXgeWlL+lCo3CJNZuznScFMxyjxnF9SwaL/k9JFQ82fRgrxzcOzkoQvnlvhHjdl4stA+TBU7jU0Icl04pZbDo0P0joAkeMdPjhOR5D3Oq/JvA2RpCw2JOeOyRanb3A7/42wCEHO7iMNDrPNRBWry9iQagQii4uWrf6U+4HW56ToUUGzChf8f6H1KbUD52pr8D22sr9svxtyw4CJBWXTNO+oZ80ZGmLO4L3DbBA17BwYNrk2cEexDcZBbabYA3bkaTrn0I3CsDbWytrwD9w2uCGo0fqEkSnpZ0mk8AJ9EEu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFA0dXJTODhpUDR0YmxXckhPTk5nTk1zOGY0WFAwNGFseVZJbE00ZS9mU1Vz?=
 =?utf-8?B?UjBQZVpneWhEQjdEWlZCS0dxbHh1WUs1NDhvS0tmenVkV2ZPa2h4R2J3eEtV?=
 =?utf-8?B?VFlrbUdaWlJla2RGa0V2STRZWEhPSVZuRXFBUVMvNFlwV0ZVZkxnYi9ySHdX?=
 =?utf-8?B?R21OUW12dmNZd1Jja0M1d2VvRitNMStpb3Y5T25wMFRXM3A4S09kdG5uL1ht?=
 =?utf-8?B?QktSV29sNmVQaEEvZ04zWFhHOUJmZUczd3o2SGZzaGNyN3JNVFhrVW1VUVN0?=
 =?utf-8?B?aHZNVzRuV00yM3oxazBxc2lmdGhmUjhBWElWS3BSMm9GcGVpdlFsejQ4WDAz?=
 =?utf-8?B?bWVLUWE2RGdHMzZqcEprY29JRGNPNEwyNDRlbm1HajZtV3BKT0xxK3BYNC9V?=
 =?utf-8?B?TkNhb0pFU1AxU3UzUDJrWHE4bVZldHNkNkdPaW12TTl1NldLTEg3K0xtRmE3?=
 =?utf-8?B?QjJLWTBjeFk0SCs5eS84Y0Vrb2p6RDR4SkRha1JZbEpjek1vbHFxRVRDL2Q2?=
 =?utf-8?B?cFQ4UFUrSEpaQ21WdXJvK2xvYjhjS2NQT2VhdVhZL2tUdHZ1UWtISzRZZVRk?=
 =?utf-8?B?dGNqaVRCdllCWlhnekFDd1hUR0dwd0FmNlBTUE84eGR4T0hoMndiczRGZ1FJ?=
 =?utf-8?B?YmlVcVl0aDJtbWZKMEwxS1ZyaHpmMHI1dUZzQjg2UVI0ZzBLaVR1clhnRFE4?=
 =?utf-8?B?YkJNTldMaG54d0pCQTRBOWphZ3E2ZGFQTHFhamt0aWMyZkZwdWs4QSsyeHZD?=
 =?utf-8?B?V1RRcTVxZzVvcDNXTEZnbVdIWmlpVFZVMjNsUUszNVVwYWhzMXFYSnBtR0RP?=
 =?utf-8?B?S1czdFRrWGVYenNpazQwNWZBblMzcndVNXpmdkxSbGM1bkVoaHpuMWwrNklI?=
 =?utf-8?B?Qnl2MlNBL3NkZVFjREJQdkhRbkN0VDkyeU5pcFZZbXJPS1p3MmdpUnE4Ynpn?=
 =?utf-8?B?T3R6U0ZsWncrQkVKdE11WlprQ2dMU0loNjNXdVp4dHRvSmRtTFpuMVc0NzJR?=
 =?utf-8?B?cE5DeFZiQkdBWkcrd0ROejZTUXhvclo0eksxd0FFTDZHR2xUaXVuWFBseXZL?=
 =?utf-8?B?YjlDY2ZoeS9vVFRaUi9xVjlWWVJSUlFCNGlzWEZMWkFibytzeUZNdlB5R29s?=
 =?utf-8?B?M0lTRDdxeHNaWDEzb0JoNThtUSs0QUp1WDFnVlpsUEQ1cUpFcnZtckZHeFhM?=
 =?utf-8?B?blVWelhTVG5xT05yWkJicFZNR2l0dEFQOXFqUjVER1Vqd2t1RUVZTVFCWmwy?=
 =?utf-8?B?UmlFQ3JWSFlVUzR2Q0lPL3dhM2ZkbXMzUysydEFaYmp4VFNRYTkzSWJId0xa?=
 =?utf-8?B?RXQ0MXVaalQ3SCtKSUNjRmZNczJDcGhIM3RtSW5WbjdicUNCdUgxc2tUTCtI?=
 =?utf-8?B?TlhWT0xqdWhtVE53K0tuRVM4dzcvY0FXSU5UREhHRFdac0RGUzZSREpZN3Vi?=
 =?utf-8?B?cWpqSTZpS1pjMUR1SjZKTGpCSFE4VjI1VEtCa0FNSy80Z25RamZkUlREZ25K?=
 =?utf-8?B?bVhkY1FJb3F3N2NMWmpnK2RkT2NPTVBzUzRaU2hLTHpvaFFEUjl5eDNrbzlR?=
 =?utf-8?B?WEFwQUhINXdWYVh3eTE0RFMwQVVIK2VxRGtTbXRYdjNWZlZJUlBYOFVYSnNq?=
 =?utf-8?B?THRad3hkcjNqeGhCN3g1NE5MUVZEVVBLRi82UlA0cnkzalZNeHZEbUhweE1E?=
 =?utf-8?B?R2hOd2FCMFZtdklZMUVERWk1L21yNG96b2xDRnZrQi9sUVdrdkhUZ3NPaEto?=
 =?utf-8?B?VG1TaTdVMERUNUoxb2E0UWd4K3JXY3dheHpZRU0yNWNaQVh6RWluaFJGclZ4?=
 =?utf-8?B?dURCM3VGSGZ2QTIxVmJ5RGYvWkV1VEpSNjluamt3MTBUVFJYcGhJVHI3MWQ5?=
 =?utf-8?B?dFN0SGNkRmRPVm9ZUzNROXB3OVJFUUQ1YzZDblZqOUIyemZTaWk5Q0p0Yng1?=
 =?utf-8?B?Nm1NVW1KWCtCQXlKdXc3K3ErS3luY0pwYmo0M24yUnpZeWtIdWdCdDU4cGRC?=
 =?utf-8?B?TkpWT3QrNVhiT21NdEFpUktRSWFLV29yVCtYWm9VZTYrMG1USWJmWXA2UGFi?=
 =?utf-8?B?aGs5VXRyUXFTU1dKV1hiaTlNSEFTcTJyOUxablpiSHNRQmZsUnF3WFVsV01s?=
 =?utf-8?B?cEdoenFRV3MySDB6ZUU0QTBOd1h1elZqc1pFTnRaTmo4b05PQWRMTXZFTUhy?=
 =?utf-8?B?elFzTEFvUm1IcnZNYXpWR3RoQ2dOeXR2NDB6aVJ4NE1OS0pyMEdNdUcvRnRr?=
 =?utf-8?B?Qm9VN2JOQ3RWSHlUTmsyLy9tcExKMGRYUkEvRndKOUU3Q1pucGVVa3hVUVdZ?=
 =?utf-8?B?YUJmdFFaOTIrS29Wdk0xYmRMN0VITzl5VGliR2RGczBtSkJJYWsyNXJJbFlH?=
 =?utf-8?Q?LUHbzmyvVS9DY+xQM7qN04mfoBPbJgBWUYSXyljPBRd29?=
X-MS-Exchange-AntiSpam-MessageData-1: JsfzglwbjhDY0g==
X-Exchange-RoutingPolicyChecked: Is4DNt/EQ0wBGsz+fBQzwtpwAjOugBOLO4CifalgDqrbwG461jErQkHz9ISDNfWalgBKQLmBRYFC93ru1BqD94hOx8fXWMyuVr+Pwu6zCu2edBqrfTRgWUvjTuxh+zxKZaSvGDsn7ZOfs7RtaTqgexxWEqeomcBfJS06AqAIjNUWzcOtTdO0cbV9H4Wj+C+Pa3O3vNBMnWo+nWLnKE8DMePmVZJQ8sJpVJxXJRuFleTR3Z87vKoEXC72xp9OeJLdZPJSMRXNyRGcDJJjotNTfJ8X0yiJg4zpKn63+/ebhdZNE7GXl7A4hK0o3y/Jwjq3iuPh7rO4VTgBTDDPlvhmHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6262c4e2-486f-4dc9-dd30-08df1d2e5e3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:01:49.8271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/pjlirdjWQPvX1Qygqv5wtW2epje2aaiEnPTAiqCSUED9I08vqUhOq1OWp7/wg/5xZCE8nEmhtltRg2laKqvwPwtWQORUsJu99D/3oBcoCPW5tUqyzFxJhWZaNE84sQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
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

On 9/24/2026 11:27 AM, Suraj Kandpal wrote:
> Bspec allows transcoder A and transcoder B to drive either port A or
> port B with DC3co, and CMTG doesn't restrict this. Requiring
> a strict 1:1 mapping on Xe3p_LPD just loses DC3co on eDP panels wired to
> the other port.

You are right that DC3CO does not require the 1:1 restriction.
As mentioned in the comment, the restriction was added due to the CMTG limitation.
While this is not explicitly stated, some relevant information is available in BSpec 68915.

Could you please check whether the newly enabled combinations,
PORT A – PIPE B or PORT B – PIPE A, are working for DC3CO tests?

> Bspec: 75253
> Fixes: d75ea53314db ("drm/i915/display: Add DC3CO compute and set target state in commit tail")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display_power.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 1b60ce2dd00c..4ce941319664 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -427,18 +427,14 @@ void intel_display_power_dc3co_update(struct intel_display *display, u32 trigger
>   static bool intel_dc3co_port_pipe_compatible(struct intel_dp *intel_dp,
>   					     const struct intel_crtc_state *crtc_state)
>   {
> +	struct intel_display *display = to_intel_display(intel_dp);
>   	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
>   	enum pipe pipe = to_intel_crtc(crtc_state->uapi.crtc)->pipe;
>   	enum port port = dig_port->base.port;
>   	int num_pipes = intel_crtc_num_joined_pipes(crtc_state);
>   
> -	/* Need to follow 1:1 mapping because of CMTG restriction */
> -	if (DISPLAY_VER(to_intel_display(crtc_state)) == 35)
> -		return num_pipes == 1 &&
> -		       ((pipe == PIPE_A && port == PORT_A) ||
> -			(pipe == PIPE_B && port == PORT_B));
> -	else
> -		return num_pipes == 1 && pipe <= PIPE_B && port <= PORT_B;
> +	return DISPLAY_VER(display) == 35 && num_pipes == 1 && pipe <= PIPE_B &&
> +		port <= PORT_B;
>   }
>   
>   void intel_display_power_dc3co_compute(struct intel_atomic_state *state)

