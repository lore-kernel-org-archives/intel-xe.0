Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB79CFF8864
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 00:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0610E9BD;
	Tue, 28 Apr 2026 00:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzV5rvSO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B210E9BD
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 00:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777335157; x=1808871157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dgAfIVejwUhzjnI6ljrKqro2gIkv3J4w93EzzNUrLMc=;
 b=RzV5rvSOomY9E8ZTaC3DD8tac922d7ImRBftMq30M4IkT7tlDwQyz6eg
 V9JIqoNiKkFRqNZa7YyU4fQ7wRbvELFns7C3A1Wrhv2nI607hsrsVZefc
 4ub/8qlktYQNl+xgxfs9RGOOoIOAZ/MjSq6wBnMGxwpNeHTScLNOeqc4B
 NWb2uIJfgd+ojJrRYz38+pDoYRzbdP5SgiBPG2YfmGBeP0Yc1IRqp9XRJ
 +S4zJtNUBN/k6xTiOYnwdpC4nyF+sKvfjvu+x9tCh9bnECTQ1AprJyljt
 /vjfsqJ3+aNZUYuwyBizJLWbvTHFX7JIUfTc6nNuTts9dHDRI7H6T27wO Q==;
X-CSE-ConnectionGUID: C9uwwtu1T06HHBWA1nFSAw==
X-CSE-MsgGUID: ftwEi+ckRDy2cQMjTou0Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88932188"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208,217";a="88932188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 17:12:37 -0700
X-CSE-ConnectionGUID: 2nMQ/MfmSPWHef1MrDVgmA==
X-CSE-MsgGUID: KyaHKUWpSeWmDrlRgQvTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
 d="scan'208,217";a="237749881"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 17:12:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 17:12:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 17:12:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 17:12:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDaQZF25P0D1zGU15CSAxI2SJvMHJMJzaXdIRnzlIXJHvA57wfbCfAXJCeSIw/dMfe62Mc/iqBBKHyS8hZxfcRa7E+mdNNVHZQVCpNTkCvqBuXAVqfdAoC+ZDOAx3d623rx2jHTbMR0/6Y5IKvnj/wb+gTasAhRs38waOUEaTLsgN+Bx+TIFULDC8hiKJqD3eH/W/tIWWugqYeekY4og4+eiRsfIql7FHEYrmQMBf5YTyN7/3+QoAqRkkrhdwTrVa8dUIhdH1uMig/4Z052gV6cUwWwVNWxHqO66q+mjyd6cKMLUeJzPxNrAXwhctfcRpbN6xACilwIHsRzNYsZrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULyaSg4+LFTVNwgVptw5KbMNad2uv2wDpPyn2cRycCA=;
 b=eRcysbXKQOONnrNVSxr4usw/IMFP7LMibjUXiDACLhyGeAmpXBrGSD2h2iv5oIDHwq+qXjfj0beo/SQ9P4ADDCSG5jBojaSEMDzjxDOlDaIhT6LYKYVNtUJUKfqUIRyHEdrxJRf5r4aHyjA2msJzg5HGNlt3dKp0SSP7RMwmcp83Tp9+AsQr6nxp6SIUBLf3razTeVRd8RtdCTjEri32aMA6aUhDXvy5wCIcvBsxihrN1HFZ+s3ZRXpUwCwZcfvwatDbm6ncqdhliqQgixymK5FDVuNmmXRGuBWkmZ1hVV/ELmpzkNE06+2SSNazpQ7aSJPE7DSoPsgt4RN0YNb5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 00:12:31 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%3]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 00:12:31 +0000
Content-Type: multipart/alternative;
 boundary="------------dsF01FBcfz1PYkTeY0iipDHw"
Message-ID: <cc728ee0-2617-49c9-a35a-20ec2881f7e5@intel.com>
Date: Tue, 28 Apr 2026 05:42:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 0/5] drm/xe/fwctl: Add FWCTL interface for Xe firmware
 management
To: <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::11) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fa16a7-ee07-44ea-2032-08dea4bad6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 6aaWOhWKg2ymRDXUak57YtbfcXilsimmxeHvcFPdYgLBF6E6xTFRcVL78facII/2vHJ2dw741nowb1s2elNnGDhklOMWW1lyHLFcNWAQ1lTzF22R7Eh3dF88/+6aZL9DvLBvm/yMFSOOyGVb0QAiKtNMUWy4mlAg/Fccogjh2mMExD9gnRV/GlRMh22nUFKZ8UdA0/8QhHLo+AxpYZI0hLTVoxk8VqxaqdPOS0/FRoxOboSfJ3ySIlLoA0wl++Nqv4kI8Ls66fx34o65ZZSKbI+yQS2st9YnQ8I2dNIwHTk+vYTosLQLXHaI31yYiBWdfOqPkXuV00JJvfGFL6AATvy1VB9L5N11MX0u0B7A0gn5YuZFF03AP0f0eS92n8fWMgXAolfiBQGhGV0LwArYV268J275qZi3l9v7Q29q7NTqd7JEln+SUkTNNOuP6E6nv/mRp7m+yx4Xrm2Q0w/wZv8biNmKXG9F/1sLBb3PVICxjMyFLGSeO8NQJkSMDQihG2Fq8Tgyv5XwzWuN5try/gdZuEAoNcy6cBrs5IBxkWbqKcDI+bz58WcwFkYhKsPTTsSVb5v8jPzvQLj/U9pPM99mJJV17VLEUVlfZbHBHc4bVraz1RzkkASWCPXjtlrM/o6mj3wvP3g4mPMWhiwMgRaSw5UMC9P22yW8bjKTe9VyOO96dxmtmcVNHDkbJpHF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azd2eHp6VDJvMmQrOVB0QkdCZnhTN2p5TzFVdmp0ZUxSV1YrUTAyamJNNTF5?=
 =?utf-8?B?Qm5WNEpJdGV6VThpd2lTWHdFZng5eFJmUnRjZVZYamxWM2p4N1FPZ0FQekgz?=
 =?utf-8?B?Y084Nk1CY1Ixb2I5YlpST1liOG52TTNyYW9Pak0ydjBkRENheDh1TmlUR0Ft?=
 =?utf-8?B?MlBGRHNaL0x5bDkxYVNLSnA0aEQ3a0MzTFVXbFpDQWNrOWIyVjdtVW1PSURa?=
 =?utf-8?B?eTFQV2ZQTEFNZ3lmN1NFNXRWVjlNMldBcm9aQm1oZTNocXg2QWJ5UHAwNE80?=
 =?utf-8?B?KzlyMk9IamZ3R1Q2Tlp1MFlzTkdZSkpWY1F2VkVudFNmOFdvMXRtZUJHdEM0?=
 =?utf-8?B?emJjUXltaHZ0enZhZUNTOXQrcFZTdjRwV2lORVVseGFkdlZVbXdYVmdsWjNv?=
 =?utf-8?B?dnY1eFRwWk9nUHpDZVVsSVBaVTJaZ1ZvWGNSQ1lCdE1mMktwd2tBU0EzWWQv?=
 =?utf-8?B?MlJkQUoxUzhxRnF0S1FMMVFlWGJneUlsRzFoaS9xMmVTK3BEL21HREJHMnMr?=
 =?utf-8?B?dkpERW41elliNXRVRG9uSUhEWHJHZ3NIQVh5L0Y1YjltY3lkM2tpb0JmQzdB?=
 =?utf-8?B?Q3hPZkxDLy9YT0FKcEtyUklpUTJnYlZSVUExc05Pckp1TFdCTVkvamdEWUhJ?=
 =?utf-8?B?SVZ1UEdFK3JpT3YwY2FpT2pwYlc3alNKQTFVMkJUcXhqcGF2M2dweThUR3NV?=
 =?utf-8?B?RDBJbXFhbDlEUTNhT3g0NlM1WHh2S3ZEV3U1R3pyaWtiSDdibjY1TytjNGMv?=
 =?utf-8?B?L3VPR0dkeThjbEFFVkRLU1ZqS1dHcDdJdXVCMlFkRmFibUUvcDQ5NTlUeEhz?=
 =?utf-8?B?bDR6bWdQazlEbFdydFcrWTdBSlJyenRRWkRQOTlXdGt5R2RHOVNXZTRrT3ZL?=
 =?utf-8?B?V3c2TnptbDhvajE4ZEE5RFFQK0Q0Z2JwNTh4UW9FSkdDSk54WHQ1ZG43OHIr?=
 =?utf-8?B?L1NGWFR3aVJqekNLemlmOWEzc2YzRngyOGpJUzJlU005ak5oM1lHZWN4RUNR?=
 =?utf-8?B?cmQ0RU9QbG5QK2hVOEswZjY2OUhQSHJNRVhNWm1CMjJWaHZNejFvY2NyTHdM?=
 =?utf-8?B?a3o3Wnh3eVo2NmRsVjVGZGJwa2s3WnFXazZBZkJXY2RjcFRiZDJNYWVsd3RC?=
 =?utf-8?B?b2RNT0FOSjBxSzZPUmJaV3pjZ0lTTDh3RzF3YXpCY3NhbGZyM3BYbndoVEVD?=
 =?utf-8?B?ZEF2T2JtU3dJQTJudnBQTmV0Vm9zLzF4bU9WdjZyRlhMakR1cnJKc2s4Zlp4?=
 =?utf-8?B?NDcvWEZwUHlmbTRrOWRXZWRUOWk0ejEzUlhmbll2dVhZbGdMSzVETWhrWEtr?=
 =?utf-8?B?SlM4bDVuaEttVUdWN0JPS2dWUStSVVkrYzlFOXJpQXFOaU1lQnh5MEpscVJJ?=
 =?utf-8?B?QXR6b0R2RjZQajliSDRtMXNhWjFiRDRKcXlYcVNOaE44TWRDMmFWNGtVaFFY?=
 =?utf-8?B?SXhrdHF4OUd3dzZuSkM1dmR6TU9KbG5KZjdFaVByUTUyRTBIa3ErNnRlWGs5?=
 =?utf-8?B?K3BYRGZkaGNwdEI3anBvRitWdDhHUDV3cENtZnFsajMyc3VkVGpvVkdrVGts?=
 =?utf-8?B?MUVnQWN5bGdkUTk4eS96THRZeFVvcUtmSFRhbHlodGI2SGQrUk1pNmpKcHMz?=
 =?utf-8?B?VFREYkFXN0RUMXMrYk1FMHI1MmlFaTZhaGh6cnBIazlQWHVYREYzV2ZWM0hJ?=
 =?utf-8?B?a3A2UlJqWERGVjJoWnYxZUtsRmI2Vlc1ZHgrQUpCQTFqTEZNRnV1bUZqMkRY?=
 =?utf-8?B?Z1hMbnlxUy9tdXp2bTZxRSs2eXFHeVh6Unhvc2dIdTdEdjh6Rkg2UWJZYjVE?=
 =?utf-8?B?K2V6UmZVOFlzYjBTL01EakxsSmk1b3FGMk1iWWloL01sb09jMUxMeTFZZSta?=
 =?utf-8?B?cDljNXZiM3YweXJnSGNzTWppcnN6WG1NbEFZa3JrcytueU11NjZMWDNtY01p?=
 =?utf-8?B?T2JrQXpndlZpNlpqckQ4M0pZOTZuN3BRWmxYV1JJQTR4QUNZMGtRa052ck1l?=
 =?utf-8?B?T1l0czhkTU1iNm9adnAxbjgvcWRlTkhodlBVcVJVWVBTdGJFNitsaWVvQjFZ?=
 =?utf-8?B?ZEZmZXRIcEFUZ0pPSDBrb0xPVGpRaFdhQmVMb1c3LzY4RE1zRWUvUlZFL0g3?=
 =?utf-8?B?WFczcllnNWtNeEFNVUp6UmlGNjArZzNQWGxMOFZKY09taU0zWW04bkQ2bGtv?=
 =?utf-8?B?WDdiNUZLZnRvMzRYV05xYmwxSHR2UGFFUHgydDJ5T3JFaTlyS0g1Ri9JOTVr?=
 =?utf-8?B?TWptL2lZR2d3enZ0YXNMeTRuOUhXNTFzdnRkNEFIc0NaRzI2WVlIa3VYcnpo?=
 =?utf-8?B?Z1o5ZE5VZDFrUllwbHZIdTFMS1Z1R3BqZ0t5WHJybUlldnNhRnlSUT09?=
X-Exchange-RoutingPolicyChecked: aJRaczAONzMvo9zxVoVwSjeHbggw7vKy7/iQXJ6UGguaE/i+qPDtFFe5jkllzyO/ylo4F5oe9/R2Yd3LJL4Kp2GCoUh25YVNsNpLNSau+u7Bn9vPrLBJX7eY0t4pcMhMjI9zCtpCs6O1gbylK4PyXw7IijDuOzwTjJD3L5dbTCAbQ8TguFvaPYTZAUN8o/GZ4ANlT4Umrlm3e9s/CAgITqBkBKxuVd6H6+IZzD7a56q0TUYBsBrrr5Hc8/y+mmW6yUdrAN/FHdFKsfiYZI2UpS6/c+ss0NGx0jDWy7tgCJmEhd+YeJ0+6HHzKxwYfvYKYiYYfzK+F6rbJPQzZqQZHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa16a7-ee07-44ea-2032-08dea4bad6b7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 00:12:31.0060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KylmlJ0Q9V9cveRV6HkyzRT2ze0L87rLMrrG76bRmKtpZnb5zVxamdz3MACff4yip10/EVZzAwnM9DdlsJsv1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

--------------dsF01FBcfz1PYkTeY0iipDHw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Bumping this RFC series and requesting a review.

Feedback on the proposed interface and overall approach would be greatly 
appreciated before I proceed to the next revision.

Thanks,
Anoop

On 20-03-2026 12:55, Anoop, Vijay wrote:
> From: Anoop Vijay<anoop.c.vijay@intel.com>
>
> This series builds on top of System Controller series[1] and adds FWCTL
> framework support for System Controller firmware access on Intel Xe discrete
> GPUs.
>
> Patches introduce generic FWCTL infrastructure with pluggable firmware
> backend support, implementing initial System Controller backend to enable
> userspace firmware management through standard FWCTL device interfaces.
>
> Key features introduced:
> - Generic xe_fw_ops interface for firmware backend implementations
> - FWCTL device registration and ioctl handlers (info, rpc)
> - System Controller FWCTL backend with scope validation and RPC execution
> - Userspace-accessible firmware RPCs through /dev/fwctl/fwctl<N>
>
> [1]https://patchwork.freedesktop.org/series/163196/
>
> Anoop Vijay (5):
>    drm/xe/xe_sysctrl: Add System Controller support
>    drm/xe/fwctl: Add uAPI definitions for Xe FWCTL support
>    drm/xe/fwctl: Add Xe FWCTL type definitions
>    drm/xe/fwctl: Add Xe FWCTL infrastructure support
>    drm/xe/fwctl: Add System Controller FWCTL RPC handler
>
>   Documentation/userspace-api/fwctl/index.rst   |   1 +
>   drivers/gpu/drm/xe/Kconfig                    |   1 +
>   drivers/gpu/drm/xe/Makefile                   |   4 +
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  94 ++++
>   drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
>   drivers/gpu/drm/xe/xe_device.c                |  10 +
>   drivers/gpu/drm/xe/xe_device_types.h          |  10 +
>   drivers/gpu/drm/xe/xe_fwctl.c                 | 206 +++++++++
>   drivers/gpu/drm/xe/xe_fwctl.h                 |  15 +
>   drivers/gpu/drm/xe/xe_fwctl_types.h           |  52 +++
>   drivers/gpu/drm/xe/xe_pci.c                   |   2 +
>   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>   drivers/gpu/drm/xe/xe_pm.c                    |  11 +
>   drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  23 +
>   drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 136 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 400 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  33 ++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
>   include/uapi/fwctl/fwctl.h                    |   1 +
>   include/uapi/fwctl/xe.h                       |  65 +++
>   22 files changed, 1301 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>   create mode 100644 drivers/gpu/drm/xe/xe_fwctl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_fwctl.h
>   create mode 100644 drivers/gpu/drm/xe/xe_fwctl_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>   create mode 100644 include/uapi/fwctl/xe.h
>
--------------dsF01FBcfz1PYkTeY0iipDHw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Hi,
        <p>Bumping this RFC series and requesting a review.</p>
        <p>Feedback on the proposed interface and overall approach would
          be greatly appreciated before I proceed to the next revision.</p>
      </div>
      Thanks,</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Anoop</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    <div class="moz-cite-prefix">On 20-03-2026 12:55, Anoop, Vijay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260320072528.1780651-7-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>

This series builds on top of System Controller series[1] and adds FWCTL
framework support for System Controller firmware access on Intel Xe discrete
GPUs.

Patches introduce generic FWCTL infrastructure with pluggable firmware
backend support, implementing initial System Controller backend to enable
userspace firmware management through standard FWCTL device interfaces.

Key features introduced:
- Generic xe_fw_ops interface for firmware backend implementations
- FWCTL device registration and ioctl handlers (info, rpc)
- System Controller FWCTL backend with scope validation and RPC execution
- Userspace-accessible firmware RPCs through /dev/fwctl/fwctl&lt;N&gt;

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/163196/">https://patchwork.freedesktop.org/series/163196/</a>

Anoop Vijay (5):
  drm/xe/xe_sysctrl: Add System Controller support
  drm/xe/fwctl: Add uAPI definitions for Xe FWCTL support
  drm/xe/fwctl: Add Xe FWCTL type definitions
  drm/xe/fwctl: Add Xe FWCTL infrastructure support
  drm/xe/fwctl: Add System Controller FWCTL RPC handler

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 drivers/gpu/drm/xe/Kconfig                    |   1 +
 drivers/gpu/drm/xe/Makefile                   |   4 +
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h       |  94 ++++
 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h     |  36 ++
 drivers/gpu/drm/xe/xe_device.c                |  10 +
 drivers/gpu/drm/xe/xe_device_types.h          |  10 +
 drivers/gpu/drm/xe/xe_fwctl.c                 | 206 +++++++++
 drivers/gpu/drm/xe/xe_fwctl.h                 |  15 +
 drivers/gpu/drm/xe/xe_fwctl_types.h           |  52 +++
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |  11 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 128 ++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  23 +
 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c         | 136 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       | 400 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |  33 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  40 ++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |  32 ++
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe.h                       |  65 +++
 22 files changed, 1301 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl.h
 create mode 100644 drivers/gpu/drm/xe/xe_fwctl_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
 create mode 100644 include/uapi/fwctl/xe.h

</pre>
    </blockquote>
  </body>
</html>

--------------dsF01FBcfz1PYkTeY0iipDHw--
