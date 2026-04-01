Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411221076378
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 06:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F4010E240;
	Wed,  1 Apr 2026 06:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIcgO2ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1081110E240
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 06:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775025577; x=1806561577;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Ta9ECN/bYn0mknypfTWhO7GJZD3xTvjRXqZZo/Csyw=;
 b=PIcgO2phmcW80k26xgf91UpjkUNN8sFe5KKqlW/QLyi1reJCYz6sPnZO
 vzJVwqTXjeZfiwwmPQPId/8Hud2d6p2XjpWYCb/TJDI+WIyPP1LjqDzOe
 7aQ9RZkOdiFOsaY1Kxsell+y0AmaM9y89MX6LWQy7uhvnzpa4PYdqiEGN
 JQ+eupUSBD3187GYXcGUMuHHsHAsX2Fd311V5EtwtBWr+C0wL78d7eVvo
 rJW6+2Lvz2H1NTn/2+Wx0ksYRVRZhHMSIjT7O4o7yQInw2x9DSqPEQ5lC
 Isuywm7mN1sYpAhJVzj9rgQ6NHHttWQCDVvI988B0hPC31KFXuZDGUh3X A==;
X-CSE-ConnectionGUID: S3c1nkyKSuqONJNnU20cbA==
X-CSE-MsgGUID: qKBwLdTGSEy2gF2hDI3Tpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86751393"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="86751393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:39:37 -0700
X-CSE-ConnectionGUID: lWiY/JI2RGK9dEZVthgWcQ==
X-CSE-MsgGUID: y4MIrNhNTdiu6rvxIJTKtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228201844"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:39:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:39:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 23:39:36 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:39:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqYSwM+livRAQZbzOIRoPG/m0d+DIMzJXHfTUAJjKeaYZ+R3snrUKig6Zr5wMngre8FbvNYjwtwJlWexEoThPTbf5N8oVOeCeEDiR3jKhWZYqEbd1QMchNNzGCPRAuUMNfKRglJ4yI+T6j24N+zyn3dGkh9bs/QzkEYpzAW2zuM/n6CISDeFiIu/p2a3F8p0eKFIEy7CTXj37wHkfJN/p2eQQ4+twbyUWdEsyast5REuqQeyM8HnAV7draNuAKRGcYvGkDVH5QD9OpwIZm0O1tBdvkFKLDmoIEOSFMl72LCSzEk3jd7haofYto7r2vd4Xj/3j8pARw2XEZDJF6h7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7wBWcwet9ya3ZEPE6xz4Q8+9ckzsIfCgRnapki7WEg=;
 b=mxk0+CgJRZAkF5Bpic/TTfeXHU95uw3Bv5NpFUaPQGKOuU2KHDyg1mul5mnXWi8gOFGvTAG5FmuRzBi19Q0SEzk0YNvi70bLPe9gA7FWQIWXwgtmluMWU0zoZQ2Qmc5zKdV8zI3N3g3un9futrn407wIMeftmH/L87ZHLBPhQVsQNrm/1GfgeMgIxjqV0UJPQ4mhF+b7f751xgtUB/pWtMJebg/d3YXuxQnDsA4kLNsSk50NS+vEDvDUm/h63HwD4NDpFau0/8EWkEkSE2q3SC5MXiFIjGe97GKDlA2VLPgYqBq5qkbmJgSx/38b8eJoqdtmV3DTSqSXoTDuRa8xQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 1 Apr 2026 06:39:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 06:39:31 +0000
Message-ID: <17a19ac1-d138-4527-93df-982f84073549@intel.com>
Date: Wed, 1 Apr 2026 12:09:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] drm/xe/xe_ras: Add structures and commands for
 Uncorrectable Core Compute Errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-20-riana.tauro@intel.com>
 <aahesvXwzXJZbOSF@black.igk.intel.com>
 <ab19a31f-03f1-4d21-b135-82e3417a2876@intel.com>
 <acy6S8gIHssGiQjp@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <acy6S8gIHssGiQjp@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f71c21-5b1d-4406-9c96-08de8fb96e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: V0QCcO7u0SNaHRwRgOnscOL8pmMtN0GyoK5WZQNXbqx7EnxOs7DbFjqBHob8GMA4rmI7pIMz7OIp6JJiwRalAcx1d2l+ICc2NVVrnGJKqcOtSEp/xcSMiyC8QeWvQUezIbr4Ve23yU3lv2MMJEqtpjnEJVSUg9XaXAvDDJqArCuzgLJv3eB+hgCMvfyTJKdIyWlxV11r/wKlhKp4cHmWnelHBx71NEOMe+/+wgLzfwNAIQrikYcjZbiiZbo0C/im7XX1XJiamWwuR6ycs0sWOvFkifnkr3yLIaFCRBZIC9mZfvkD46ABfU7d8yVOim8IiJ0IumnOS3Y196iGpV5cK+K+na+I4+CB9KeF/60cfjuzwCXNF0GU62BlijVJKZE3/cLz64ENP0Y61xN3/E8eLZPkAClifChI8bJG5gwX0QLUZNvtmnzN+xfLqCrUErV85UaE4P66EzN3xNhjdWkSJQQ0IpqvOrxrlO0c1TQzFcCLFaVusP1cVZUr00FCutSKC3lF48l3bv5+6b3j9Qg0Y6dew+7vF/lBs1SFVjJLlp8vdIcjPiBgSGLJ4MdVCNbf9oKMlfQaaG4GbOl+aYFLGgzsc+H7eFsnCDck9+2Sd4OeaWILIF0S7SMUTqMzSAt2gdUOqSmLM82NAyzb9reBqQtnxEQ6htPyHUxs9MZ9fo5B5RuUV3bOTMdZZfIuZQQJW22Vid2g8nppEIVuXUl/Lx/VG1w1yvZyM0/REGJqRP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnJyOGpZUHE1SmJuRlZlS0daRFk5Qnd5TUpBK1o0clkvaDY2N285M0o5OW1h?=
 =?utf-8?B?TmthcmtJRnR0OVluM1dpNHp2ekt4Z2RCUHIxR25IVWk5U0NXa1VJTVE0ajVn?=
 =?utf-8?B?VStQM09mOUpJY2RUdDl0Mk8zUVd4SVdNNlh2UzgwdUlTd3NEbGtHQStCRFlG?=
 =?utf-8?B?L3Z4UkJzc0w5UUJoblFFeUxod2dzN0lMV3I1ckpKVzB3NWpPS01VWmFJeC9r?=
 =?utf-8?B?QnBuWnJrR1VwWkxWWlpjUlhVaXRyaFFjZmI5UVFTbzE4akxlVGFuS1JKWEFo?=
 =?utf-8?B?M0I5Vm5TV1RncXlEOEI2Sm1HR01SSUJ4VVoxZEFpYXc4T0xweDk4cy90RlMx?=
 =?utf-8?B?d09HYTRzYWdLSWNySzhiaTdmVXRGOG5HejNZMytaNEQzanNCMHAySHkzMU5k?=
 =?utf-8?B?b0EzakF1cGdwd1FTNHVRUi85SG1DSTJPNGdOU1BHcS9qa1Bra2lnL09tKzVB?=
 =?utf-8?B?bEtKMjNIVmZFRnlSbTNRRW5ZRDhHZkJ2a0ZXQmxSQlYycWZ2OVluK25nbHJq?=
 =?utf-8?B?WHhZQVlnQ1psL3JzQmR2eXQySlY0dnhuSTUwYzFTSzZSdHNTSEtRQXVkcG5s?=
 =?utf-8?B?bEtabGdJTkR6ZlkvOWt0bEt1NDh6a1YzdGtZSGEvalFxSVBpZGUzY0NYdDZh?=
 =?utf-8?B?cEhwWmhDQlRBOGR4bUE2K0NkSkUweVlQVEhOaHpUKzlYSmtLNjdsSnU3MHVj?=
 =?utf-8?B?Mk1hcEM1aHlxR1NIL0FkK3lmZEhvQTVxMmdRVE1RMkRXODM2R1ExUDQzZlpn?=
 =?utf-8?B?Yjkyb3h0allXcUtvRDBJaUl0UXVrTG9NM1V4SnJld2ZxK0h5MkxWU3JoZnox?=
 =?utf-8?B?Q252VGpXcFo0L0lLRlg1SnpOZ0YzU3Jpa00zUXhoY21KTVBYQ3NKdjZyTzZD?=
 =?utf-8?B?a09OOHg0elA5aXpmakRWVGJadVkwN3lZTVlVUDNDR3VVbnVXems0K3ZqYWw4?=
 =?utf-8?B?RHRuTzEzQUpJMUlKUFZxWGkydVJIVDFTMzBXM01kbkRuOHVMc1FpTVNZZ09D?=
 =?utf-8?B?SlNUd3E0QStzdE1vdmhHaUdXTXNZVlhyU1A3WGgrMERkWXBrR1BZL3R5azRm?=
 =?utf-8?B?WHFVUGxjanN5d2tPRXVlL2dFZGp1V1p6Z0FGWUNvSFFQYkJzZis4M1A2Rno1?=
 =?utf-8?B?dkRnazRUd0VSLzdzSURmVHM5UnFKekg1YnRyYmQ4dFBWOEkwTUY4SHpZVk8x?=
 =?utf-8?B?TW1rL2hkMEFLU2ZIT3lTTVdXbXdnVjgzT0x1YjNoREtjQW1yelMvdnBoN0xl?=
 =?utf-8?B?aDg3a2czaWIvREtlSW50ZFN2L0pvSXcwMmk4dGE5MWlhaElqbG0rT2t0RHlp?=
 =?utf-8?B?UGdUcjZsUnNKODdzTzlJZzZRSjl5RmVVdUtIYjhXaGZvTnJBSy9mbjlQa09Z?=
 =?utf-8?B?QVRTM3NGYzE2ZElIWTdXMTc5akFITHR6eEJUU3NOT3FXdXlRM1NvQ2lmSU5a?=
 =?utf-8?B?RTNBSktyWnZ5SnlZSktDbGZ6OUVpTzBqZEV0OXlVSDhMMG1udXM4NlRkWE4w?=
 =?utf-8?B?c0pQREVjWjVpWnI0Rm1CNHUzVloxLzhKQkFEYmdURjJoeFJLcVZDOE00S01O?=
 =?utf-8?B?enY4a09rY1lHNUJQeGVWOVNmdXQ1T2VBSkh3dlNSRG12NGxrbmc3RWNVYitH?=
 =?utf-8?B?UzRyUFBiZzJjclZwU09xR3JxWU4xZTRaalZXQ3l5MmdCQnh4a3NGSTBzSU9H?=
 =?utf-8?B?VERvTlc4MWZpSkUxbDZuWlhxbzBTUUlETHZLMlRDRTFCdlpGRER1UlRwUmdo?=
 =?utf-8?B?Y0srMXBBT1RZMkVhMjVrZUYyTEozdnpFTlU4V3hkTnIrYldLYW9CTkpxd1FW?=
 =?utf-8?B?cGRoeEFnbDhzbVhOd1NXYUdWbjdJalEvSUdsM1E3R01HcHBNdXNzOTZQUlAx?=
 =?utf-8?B?NUtXSnBpTE9EK0dRQ0taUjRWNnRuTFp3b0FCZm9xM3JSOWFJWTFIazNRODF4?=
 =?utf-8?B?U2hvRW9Uc0NyK1VNeTR3THRqZ2RESW1MNldvUUpyc0JMU1hkMy9oVmR3aXBU?=
 =?utf-8?B?amNCTi9nYy9kYUljenl1QmFnM2x5UDUwK3k5L3NRU1BYbVV4NjI4S0xRendK?=
 =?utf-8?B?aXlDb0YyUjAxaTE4OGxTVlp6ZG9UdDRFMDd3amdCNGxFMVJCaTFNcXl1MWRT?=
 =?utf-8?B?dmNNSWx1dmc2WC9kQzNmVDhqdTJieUJuV29oaDNyQmhsTkJVVWZ0bGFMQVZU?=
 =?utf-8?B?ayttZVI0ZEl3cllIdDdZTXVPZkdzb2M3UlArSVg1RUhEQUlZV3NwUlNESU9T?=
 =?utf-8?B?OFBUbkpIeElpc0svWEs5YmdDQ0svcW5mQWN2ZFJpbFVrV2xoL1p2bXNWZXk0?=
 =?utf-8?B?c1d2SmhGNzFvQm5zWFQ1UVBQSjhyMmhYQlB0OVNvcVdWWUYxV294UT09?=
X-Exchange-RoutingPolicyChecked: kPmqzyX0W/1zuJiMYWkJR/eW1LW4qcUy0ZRKN/NXM68D7bEWDlSmdGJjg3uE5wQIIisUgSyUCGrRQ46q5AhzITc9t4oeFrcTfmcl/stBIg3rBPxNGzgCfRiF9bTYPQjKLNe7s3DgGfgous0QX5Jnmsa0/cDlRZyCxu1fFiT0ybh11WUFN6PfRkHmToFa5FzeSB1zaL5qPnd9JHjQzG9xfjIVU8Ykh8OQR0iLrgTFzz6xaaBIuiEUSxYbJ0wKj77dRC0OHfwn2oNaYoaj7ILe/oqbgpXu3NhQ9XdYHv2tHnD+O+L0B7qGv9yNCgDcOi3bPyefRsIRysEILFEgWS10Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f71c21-5b1d-4406-9c96-08de8fb96e0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:39:31.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlHnaqwJYpuGcJWOXaVYL+XnHiAo88PNgiXZwPQ5ELs69pOHFf1Pe6FfyoG4JXl+p4tAY+Q2vCd/6SZwTYXlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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


On 4/1/2026 11:55 AM, Raag Jadav wrote:
> On Tue, Mar 31, 2026 at 09:44:10PM +0530, Tauro, Riana wrote:
>> On 3/4/2026 10:02 PM, Raag Jadav wrote:
>>> On Mon, Mar 02, 2026 at 03:52:02PM +0530, Riana Tauro wrote:
>>>> Add the sysctrl commands and response structures for Uncorrectable
>>>> Core Compute errors.
>>> ...
>>>
>>>> +static inline const char *severity_to_str(struct xe_device *xe, u32 severity)
>>>> +{
>>>> +	if (severity >= XE_RAS_SEVERITY_MAX)
>>>> +		return "Unknown Severity";
>>>> +
>>>> +	return xe_ras_severities[severity];
>>> Rather,
>>>
>>> 	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
>> I can make this change
>>> and since this should ideally never happen, I'd also add a
>>>
>>> 	xe_assert(xe, sev < XE_RAS_SEV_MAX);
>> This is only used in debug builds.
> Exactly, we need a splat on out of spec behaviours in debug builds.

Then i will add it in the default switch case

Riana


>
> Raag
>
>> Won't be useful anyway..
>>
>> Thanks
>> Riana
>>>> +}
>>>> +
>>>> +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>>>> +{
>>>> +	if (comp >= XE_RAS_COMPONENT_MAX)
>>>> +		return "Unknown Component";
>>>> +
>>>> +	return xe_ras_components[comp];
>>> Ditto.
>>>
>>> Raag
>>>
>>>> +}
