Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0666A1090234
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 14:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73010E8D6;
	Thu, 19 Mar 2026 14:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OoJGkQkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12E910E5A1
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773929366; x=1805465366;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3mJFEqhJ+XGNAKwZHklmYUIpr6jidL+ckmTpOLz4A4Q=;
 b=OoJGkQkwFzTajp8jPN0dMqgn93dL+EbWv5E6/tbrqAdPlxYX8p/Uoplx
 yXBbNzqaOxp8hCDuyA45zehns0R7MX7tXvZ+YbFlme72O4UhuaV9rewBP
 41oOJJEJ51xlVGEAECEc96e/flwzRrWvYNacbwArWGWbPAI6WWHtZLgYG
 DN+59OzEL8V/lf8UZj27AiinjtgnUqh7PuqqB0lS6DYhINK/2hCHXhyJU
 w5xR2KGIBJUUE4S9fhD+wJk2HOP+aS0zFk8EoSNArt5jZQhYWSplIpTXi
 yq51ZmXkOw2a9T7HShiE87yWhjPu7O3ikJnuOLB7/p4FW5B60mHjMJR3j Q==;
X-CSE-ConnectionGUID: 3+st9n27QJKdxuZHtInPbA==
X-CSE-MsgGUID: IotHjPEgQDG9CfPgGXK3dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97611563"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="97611563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:09:25 -0700
X-CSE-ConnectionGUID: t11ePcOmTruWbZcK6PeKxg==
X-CSE-MsgGUID: cUzCv5ivTyqgXLiglDvP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="220360310"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 07:09:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 07:09:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 07:09:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 07:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3sGEB7ZeAnHHTRlhrXNRjjQOfVMHKoaZ7wgcS5bOHc64CTxCLub0yB1rcd//swiBtovsJDjsuANn9HQgaL72FJ3Wz9eCbDTWiXmzC8Q5aZ9uZXXAj56+8SYgcwyO1ssBS+5KMTRmxLo0ipZtEA7h0F3OITBYCumc98B9yVOwt+m1CD/K5gqa8pFVtE5oJISO1yLpN2mVBcB2l+zhXFRmWWxD9kNMUAXUl5N0vkHMPuy433Owvtp7dpS6js/40PHy35N5ZWJXhsHMyFBo7LYw5e62odLdCQjfbt+5cQkCl0JWrX7pAOuAAJ/5tgcyeDRNXmheO//JwMuXUBxIzOIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dIhxhcluZRa/U/i43mzxEFwkqu5zoJVdyRVj5CndqI=;
 b=EpEx//z+RXPfk595y2JHTXmwM30uojXUGbEt0/w/ig2hBAgJeLsQgu5zTmHddoBWPIaqZlG12Re5JCs30HLQYFxpMDF3Iod4MucCC2lfHBc7FHyMeWfwMBLAeErhWUgpWPx3JgNISpXxvjjjb88/8nKKlW3LNxcV9VsVrkdQAqZ3hwYVnwwNT7C9NK7P5OgHHGAYn1lGDXAtp+85yDH+R/XKHsuMKwbfoTmf7IbwuONgLrLHj8ElaOB5u+bL2oaw2FpqLqcighUAggYeqRyMCsamP9HtqxWhWb893OGFVPK+gnzkorCO9zpBqdBv54G3g2xHbt6vFls634AqGTqzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:09:21 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:09:21 +0000
Message-ID: <c05cf845-311a-440e-973b-7bc17359fecb@intel.com>
Date: Thu, 19 Mar 2026 19:39:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260312090657.4026013-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fdc051-3b07-43ef-d6aa-08de85c11e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: D8WPUBo7/m3JSPZcfN66fo61+bHyX76E3GX6LgW7dCK8GMn/A9AAPMzgikjT9NLuAEj6RTEVU8L+K5L0Kd4NgFTxle0RWcdrD9To1UfgX1fVapfVN/yasMuDRb49gpTJ0VXJGGesZDnxgHmTKYmcbr61F+9zscXY9F8S7OQEEvH/SZAg8nJeDtdisfoN66WM1OEstckPkJtoSJ0HFuyfuwCRQmrzx3z5KhCLJL5ULxUxiavtzEIh6NiF806FiCZWuaGrwSZ6uZGKWy9cuJx6bgY1xZ4PZdVm30Ezb387q0ZUoRCjldVeiW33Lq0wbYAIXW6xc9t9qhnGqQwMyU1MT5SLJY61l5DW5R2+AUzIeTOiMxyTz+r7uZD/WOVtipLA0yEG6RqIOqYNYz3hBS7TfNKhB6ROiUm2EQ3ki4zmxCIkgXfo0DfvjT0F2or0HA7xgYFO9dsW8Ma6WYyr+2hDMJGJJbTLlelZhH5fyorwpIfrKRzYK4pJXaDkBbOAx9oUoHphnQMGkDp0dL0q4FUGrVt5Mq4GnO46kSpu9GO+G5mdk6/AijIGImbbjnQl7Zn/yYmDORcHWDQlbOBI1MAaUdluuYRaKsizY28tzw+0LZ5k67BWHO3MAAs4KbDjIKVHjjRKenfEPITGCdnKFfzbARMf+YFK+54Jwx/VWSy81/KkyOahVDgr39qvPEtEtM+kZcJ/FQ0e4LFefIOZDes40D8NZHyUTE2BygYgsNAngDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2JuU1UvSHQ3QTYzUndCU05JY09hSnlDUUpkOGcweGFFMk9sdW8reCtucC9v?=
 =?utf-8?B?OTV2SlhGOEZWblJQbkhwNVBKeTZ6WE5lTlBXV1RSa0ozUElSTnUxRUdOVHJo?=
 =?utf-8?B?NDVOUUY3bUFLMXhMRnBOVE5BQ0xaMVhyOU4yVnFtbFRSZjltMUV6RVZHOHNa?=
 =?utf-8?B?dlg4MkIya1V5dCtHTS9SUVZZVVRlRFhCUGNSSDROZndnWDZMenhrYmJsMHcx?=
 =?utf-8?B?aGhtb0Zuc011OXoxVlRNQjc3eVQ0Mk1Nc0c3SjNLakx1U2E0dDhWQmgyM1Bw?=
 =?utf-8?B?QXRjZlpqL3ZDOFVveUlSNzFNMVVwR2JXQzMrS0x5ZFpjMEtXTWNzZmtQUTQv?=
 =?utf-8?B?d05mYmVoV3JHUkVnWDNYaVMrSURwcjBFRHpibFNHcVNyL2NVM0RtbkpnQWFR?=
 =?utf-8?B?OHhrRmdvVkU5T2hQQ1kwZWkxYitPU0VKeU45TjkvZDBKYVJvSlJXVWJyakI1?=
 =?utf-8?B?N1BsOENjeXFxWnRsdFZoaWFmVExybnliSTVXWjZKVGNpM3psWGtJaDdkLzNa?=
 =?utf-8?B?YTdhc241MFE5Yk85WjBIUHZIWHBMay9jTUhlLy9vMkNtOEgvTHhYSFdNeDEx?=
 =?utf-8?B?dVBsWWdpSmlFODE3NVRRdFMzcyt6OWVSVzNmak04RWsvajdMZGxNZFprOWdO?=
 =?utf-8?B?L3c0Qk1FNEE0aUo4OHFIRHZyb3l0dWF2V1ZUanVKL01rT3MzM1B1V1U3WnVw?=
 =?utf-8?B?V3dXL2NHVVprWkVtU3FqT2FkRHZubnFZVlpESGVUUk43YTRPSDN6V2NRRTcx?=
 =?utf-8?B?eTIybys4WWJQT0w2YXl2ZU5KNlBrZnU1cVdQY0N5Z1BWUU9WSzBXcU55M2pp?=
 =?utf-8?B?R0JLeUxzeVBSZWErdjlEazhRaTRianNvMklJV3M0eWY3K0hMalBOWGwzWFN6?=
 =?utf-8?B?Z0JyTkc3ZXp0dFJIM0s5N1ZVMG1FbjdLRXFidDZORFRyYmluNStaM2JRendL?=
 =?utf-8?B?WGtianlraU5HdHZqVDJiZkZKem1TS0tRbGtvbTBjZU44WjIzbDMwK09CbFJs?=
 =?utf-8?B?aTBId0k4cHFWZ0t4cDFrTlBrUk5IOCtnVFBqcVVJcWFVQnZDdnIvZ09VWFhx?=
 =?utf-8?B?MGtkNGtLNWpBME8wL2VSekdja1p5VSt0QXYycW10V2paS3J3WEJzNW1Xa2Mr?=
 =?utf-8?B?VHQyWlMrV1pic21abzk5U0REblQ3cjlMbE94SmUvNm9Sanc4bnBBaUgydDRx?=
 =?utf-8?B?VnFpQlR4L0t5a21wKzhXeTNLMHhCMEhtTlhQYmRpcGkyd0p3M2pkNlJleC9V?=
 =?utf-8?B?bk5RVHBVN2xpZWJsNmswbit4dXBRKzNaVloyMUZmTlJSN2hmQ1ozejZsZWR3?=
 =?utf-8?B?Rkd5K0R0WDVpaEtISzVIVEN6ek1TM0g0WWRRWFNON2dpRjRnQXQ5UytNMkVO?=
 =?utf-8?B?cUNES1RKbWxwZ0V1R1p2dVNiYThPNFE4YkRtem83a284cGlEQ285S0lKZnVR?=
 =?utf-8?B?L1FPZzFMSWh3S2Roc3M5Nk5CYWFHWXlxamxDSzl6Uno2dXZGV3pDcFhHcTJu?=
 =?utf-8?B?T1JXMGk2WDRhRFBPcUlSY0YvNG84bXAzNjFaaURiTFROaVdpYXNCWHJicS9D?=
 =?utf-8?B?enBodTNJMTlCdFR4bWV4ais1RGhDak8xbytUNmZqL1JqL3Ywa1JyUTRWTXgy?=
 =?utf-8?B?QkRJNlJaQ0FiWVhQOGxLMnlWOXVvbXV4QUpmWUp6Z0poQy9nczNuZlFQcjZR?=
 =?utf-8?B?dFMzakwwK29rd0ZBM2I0d2ZHQkQrSGhjcEhrNkhGRlRpWDg0UVFHMnRlb3JP?=
 =?utf-8?B?YUlzNE1rMXd5WXZnbmEreDBjdlpXZXVGMmsyNG9UWVA2aDhmVjhaZzVxOWR5?=
 =?utf-8?B?L1piQjNCS05RSlZHVTF3Szkvcy91L1J0blRiNUd4WDVlWkxQUGplL01uWmVC?=
 =?utf-8?B?bjJEUFlwN0ZnNzNOVjNBSnZHWFRLMVFQVGMvMlNOMDBFQnVzOUxMdmdWaDVS?=
 =?utf-8?B?TnVHNGRkeFM3UW1PZ0FOdEV6YXdsVWpzNE1xa1BlbGp1Rnd4WXh3NW1yRDRk?=
 =?utf-8?B?NXQ3NE1mK3FiUDNUc1AzK05WZitZU1R1QVNlZ2d4b09sNlFsbTBBVjVDSm9L?=
 =?utf-8?B?c3diSXdLZ3YycEhRRHlnSTlvcVFWVFZVeGVyMHUyR1EwUVdONzIxb2RYRjdL?=
 =?utf-8?B?ckdJdFlha0RkUnd1Q3JZQkYzdTczUmg3Q2t6cXJkUjRjZUxVMmRLejNWV2NO?=
 =?utf-8?B?THNsM0tzampIY29Vd20rM2ordXMwZkdwT1U1NHBXZGlOdVN2b3Z2Nm8yYVpE?=
 =?utf-8?B?WEtVbkhaMlZzcGlSQWdzb09aRzdaTzM2TUYxTnNIWW42cUh3ZnRIQ3JKc2Vu?=
 =?utf-8?B?ZWpscmxvTjVCUWVrSHp5QmpWSVc3bFdGZllUTlFvNlJsanpnVDRNUT09?=
X-Exchange-RoutingPolicyChecked: wIxY9rwaIcsAT7l92f0v6j9zuFU8BJ4pzXPdTPoLkhM4Yd/XsAcmEdLfehkylgx/VhvY7c6rOMzWYrXaryUYVylHIERjVHvhZp3feu/mlNsCKrUuqYFkg+TM8Vy8K8Ro+YDv+BpKBBJyF2OHc/a4VZMu6Zl81vvsJY2y9p9NVCgR+YqFyKrngscVSH4toPjhrGFKpzmEBm/J9VkVaAJVDCelQiDFlJKiHe6tnCB4JvUf5bcgxuZ2ACvUVCVjHfM7zHqFLAC7iqRiE+Gm1yXnBb8cph7yaA+U7Kk5IXpN+KAIW/maqL4FryDytjHjbuMYbzUDYlNTsWyb9WNa410Rnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fdc051-3b07-43ef-d6aa-08de85c11e13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:09:21.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMoPFOYGR26dK2qUpVbiaJKBGrJE7A/32AQ4Ry7PHyEta+tsgPeQ5SrpBMa5nOpNbJoSuA4Mul9ownzFmTKHLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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

Hi Raag

On 3/12/2026 2:36 PM, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Handle unexpected response length (Mallesh)
> v3: Handle event flood (Mallesh)
> ---
>   drivers/gpu/drm/xe/Makefile                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c             |  4 +
>   drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 82 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 +++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>   6 files changed, 150 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 543eb0b2430b..373adb20afb2 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 30349df1c04b..63b9aaf98669 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -42,6 +42,10 @@ static void sysctrl_fini(void *arg)
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +
> +	guard(mutex)(&sc->work_lock);
> +	xe_sysctrl_event(sc);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index ff60d42b52a7..0821ea44893d 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_sysctrl_event(struct xe_sysctrl *sc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..47afca586bd1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> +					 struct xe_sysctrl_mailbox_command *command)
> +{
> +	struct xe_sysctrl_event_response response;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 count = 0;
> +	size_t len;
> +	int ret;
> +
> +	command->data_out = &response;
> +	command->data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(sc, command, &len);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			return;
> +		}
> +
> +		if (len != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected pending event response length %ld\n", len);
> +			return;
> +		}
> +
> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> +			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +		} else {
> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> +			return;
> +		}
> +
> +		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
> +			xe_err(xe, "sysctrl: event flooding\n");
> +			return;
> +		}
> +
> +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
> +	} while (response.count);
> +}
> +
> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> +					  struct xe_sysctrl_app_msg_hdr *header,
> +					  struct xe_sysctrl_event_request *request)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> +
> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	request->fn = PCI_FUNC(pdev->devfn);
> +}
> +
> +void xe_sysctrl_event(struct xe_sysctrl *sc)
> +{
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_request request = {};
> +	struct xe_sysctrl_app_msg_hdr header = {};
> +
> +	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +
> +	xe_sysctrl_get_pending_event(sc, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..1430a7ee2b39
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		59
> +
> +/* Modify as needed */
> +#define XE_SYSCTRL_EVENT_FLOOD			16
> +
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,
> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u8 fn;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Number of pending events */
> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u8 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:31;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;

Let's add this in xe_ras_types.h to have a separate RAS layer that 
utilizes system controller.

Since multiple functions will be using system controller keeping their 
headers and functions in a separate file

will avoid cluttering everything in a single file. Let sysctrl.c only be 
an interface to the firmware.

Thanks
Riana

> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 91460be9e22c..d59a825597d3 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>   
> +/* Command groups */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +};
> +
> +/* Commands supported by GFSP group */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +};
> +
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
