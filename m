Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6B1C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 15:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EBE10E397;
	Mon,  6 Jul 2026 15:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLEMxTCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35C010E397
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783352328; x=1814888328;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=drlbJtWXPRzwilLcjumWa7V+JjRXANvA4iHJhcr+2CA=;
 b=KLEMxTCXvAQv4BaPX+mlC7c8gXeqDnxps0nRglF5fKiLow09mGneZzxq
 7TXG5p5YfOkH4ttMMCLHxe7FBCDnbg+PZGqbSb/BKyGOSkh77bnIsH+b7
 dfyEzhAiieREzt9XHJizkhOx4dJobI8VearpnDXvI1KIRl37XIa1yrbJZ
 UuHL2usUwiVaR5QNNY/VTIHCldrTe1Xgixeqh3OeFgladkZDlkb6wu8RQ
 zxSI7N5h/gWz1rjR162hj1hdQj6Q10ST8mbZwKOiPaKynl5XeaBpOnOcq
 CgVN0X0TNlPWBztd+v7cq8fDqcV3ljFMlnM4ylAlH3RsoBFaNRiLyaKQ6 w==;
X-CSE-ConnectionGUID: S1FIy/iURKKgv6sOWOx4dQ==
X-CSE-MsgGUID: t3Nv29XmQsyP6xF9KGCWdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84081670"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="84081670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:38:47 -0700
X-CSE-ConnectionGUID: VgElnMKRTOuSP0EnMFiUYg==
X-CSE-MsgGUID: 3TuLV6MbSJanqdCiDTwCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="258646630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 08:38:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:38:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 08:38:46 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 08:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuCNBOSDLCMTxDbxi6nmMwFAi1slOSbMeVSm/CYstG6XtCRV7JtFoiK0BR3fn4yaVD6WueUIZvUjrRhUXZkcV5yGjggzdax4FS1hYdUWMTK3bozJWCvjsYyNMzEw8meO/CdowgL+8sSMI1e+y1Li/qZAg1hmIT5ZRPHGcyAM3QWJOS6FTIQECYFog4U/k9wxtZtaJ2sN/p88PX++GkCdCsnDYJ5o0+oe8gifbavy7iwzMCquFngq1XDkKy8C3ZhV/oW6uz1vyrbeERqOmY+JuEMXQ0oUbgezwjzRkzwwgHJkyWC4EoMXRPGUeVhve9QYT9PjyVdZU6SfhOmJjfgijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yLbzogjVjlV4OarWPk15MN3aP6lq/JJ2U4yjW4lBJw=;
 b=OoJULvAyyLlbekF11CjqAxnweL70Vg0qDF3dZJbms1jLRAMeHBbhJ+R+FmnZ+nzZg0ddXdAe2K54lQwMl0oxZeuCuM42I8973rwah7aet4nJCD9lV2kN7S7PdlS4SCfI/BEABE1yPf1XfkcABphnffXzMOeFi7idewHUTPWdGOOwYyBTnJ8M7/eqrHMM0ADtAARaBhtZGQ2hfwymPZJt7UAbFdDxuQTbve0oo7lc9NdH63hjWvjfezRpzYdd7YaS2MNZSnFsgEMY7erAQjEcfE/SwXfQDzGFaofkA9Mx1AL8HKcFgqYQ/MAXOYPO0OZXmTNkOgsaVar2QeQiD2OktQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 15:38:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 15:38:43 +0000
Message-ID: <4dea82b8-78ee-472e-acce-a6d32cb58957@intel.com>
Date: Mon, 6 Jul 2026 17:38:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/5] drm/xe: Replace critical drm_err log with
 xe_ras_log_probe
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-12-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260630115503.407158-12-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0114.eurprd09.prod.outlook.com
 (2603:10a6:803:78::37) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c143d8-e34d-4ce6-8455-08dedb74a91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|5023799004|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JsafAz79bNURmbWLLdtjTo0g4skW7mnnVWpFUwsVoxAqpYT1Pptob/o1VEQ9GIGG1/vOiIPC2+vFg4TUEvz7Au7w2s6mOQ8lAxyh25uXgVba+y24W8JnsjPrztlW1cx6HuqWQ6BktivkhHBhMXZ4IpPsaVcJjl7xbOWXm0vSfgqslN5xSfpt4MtUAHEcruXURENJOkP+WQw0pOVrywYfpYtukHx5tyNT7wfbZe2pdeplDS8/Da8K/R1QDDQdkHYnY5dhV5Rf7So7eiOI760nJeRGMXLJ7fDBeUkQNMrHp9CsECOrP+MxMVI/g0xm0n87Gc0KQ68g+S7ahDcz6RtkReF8eroaM6ory+Ll6dPQLd2O4GptiXHND96/zFbzaVzrjA7cwyCQBbULPBZCI/HL9MJXs1hs31hRWP52cG896j/DY1q+sgSw/RKcHs3+/xyU9S8DBgpIaH+pqxgwtyCjiRSvWwEcthlS4aKwHWseLGyM7zdYE58PGDVzZ08AftlD+IDDj6/FVDSWwTB8ULSC6TFm5j/T6kDM89lORbDJqoa105FC50mF1m6X5bX4F7NUugP2DfPZ2Ip/TqVOS/h4eEuOt3TVixhuC2n0ZSR4e/jcpMDIN+T7sdXOz6MjxTNqYDRHmd3C6FjMNacnMkJHXv8esGj8ov6VP9rcbifEsMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(5023799004)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJVSHNSOFBqQUh4VkE0N0l3S20zK0tOcmxWV0RraXVWMGp2K25KSHJydGJ6?=
 =?utf-8?B?eEFYOVh0VWxRMS9XSW4vMjkrcVVwWjA5bVU1aFQzWEVHNXA3STRFRkFVb3M1?=
 =?utf-8?B?SlBxQWRFQ0JidGRLTHA2QXdickt5QkZBeXdNQ0FIcjNaeHBxNGZydUdnRjQ1?=
 =?utf-8?B?VUN0UVFjdFhlVWRxbzRJQnJBSGw0Wk5jQXp5ZXFreWZSNWlpU1BiaUJKZDd0?=
 =?utf-8?B?Y092eU5lL3N6MVNzaDg2NVVJR3lTeEF5RnJRSmRVT3Z2dGZ4WldVd2FkYS9V?=
 =?utf-8?B?ZWVkUmJPQ3UxeVdiTGxzQTQ1cmNEd1lEa1I4NENvazU3ZHMxRE9LSXJHNnFJ?=
 =?utf-8?B?MnVkNithMEdZYk5YMXN5ZlBmcXVkWFlKUUpNUDNlY1l5RUNuYjJsQWp0di9w?=
 =?utf-8?B?VFNMMUxOUkU4MlVuS0dnVVRLZHJpVW1BT1BtWFEvRDYzL2QxYWEvWWVGV3F4?=
 =?utf-8?B?YVd3allnMU4yOEc5cW1VZVlKKzdzUjZNNmh6YXpydFdtTkRwc0l6aHRodGtx?=
 =?utf-8?B?RE9pS0p1NkR3QXNXMXRnNHlrSEVUS2FiMnNZdHNYUFI4ZkJ2am1ncmdEOU16?=
 =?utf-8?B?ckZBa2hIOFRUZzhlcjFTVW5OWUFiditrL2JOMm9jaHZRVVI5Um4rSFprY2NQ?=
 =?utf-8?B?S1Z0dnFyOHV1RGxYb0pNS1JjbU1OdEZzRGdJZkRkWWFPVUk4WWFyajd6b05J?=
 =?utf-8?B?YzRLamNHY1QxRVR0TVBUSFBHa21FTk0wOUlpbEFNRzdudXprYmlhVjl6dVlI?=
 =?utf-8?B?OUVOSjRNWGlwWjQ3NGhxQjROeXZzb0h4UWxrSHRod1UwT0JlVUdjRnd1Ymlo?=
 =?utf-8?B?NWJaeDRNSTNUM3VSc2NZeDI3RzZUSHllMVY0Vk11VXhJTEZQYWhKcGNldTF5?=
 =?utf-8?B?aU9JaTFmMU5Tdm9xQW1wa0xrbmdVcmdFaDF4bHNrNTJka0pMRTA4SjZpaVhX?=
 =?utf-8?B?ck1CUTdSZ2pZc1lZcUF4MGhmY01Jam15Y3BGTXRMRWtOUGVFZTAyQ1MrZ1VG?=
 =?utf-8?B?TVRyblBldEZDWEdETUtSeXhMdHA0NDVyb29nTm5EU2tuT3hFU3ZGUHF5bmFN?=
 =?utf-8?B?Q21tSUNmbGgwTlVTZ0dnNHcxMEJ2cGlSYU9pUlF1Njl0MS9DMHJiUGEzTTR4?=
 =?utf-8?B?eDl2a3lFWUxkYU9TVTFFVjdOY0Y1SWU4ZUJnWnlUQ1VKaWxkTTNUbnFKRDND?=
 =?utf-8?B?eVdTai9QQlNpLzdwTFBVcWhld2c3d3gvMHQyYVY4RGphUm5DTEZwQkM3UG5P?=
 =?utf-8?B?NktOUVJIYVBxVUFNaVV2SkpjakIydm9LWXNiNVRpa0poMjdiY0d1STRUUFd5?=
 =?utf-8?B?ZFdIWlFEdlVCQWoxcmY5ZkxNSUJxbkM0eWptdHpGdFRPTlp4c0RJSmJiazhr?=
 =?utf-8?B?K0Y2dDJJTnJ2WTM5NEZGYmgwUlpiNWJpU2FndTlZM3BNM09scVRMbkN1Qjdq?=
 =?utf-8?B?ZXlHZE1mc1lRZG5WM2lhQzlJQmowNTExQWtWcDdoZENDalNMYkg3T0J0d08y?=
 =?utf-8?B?S3JVbU53UGhZd0VEUmRtZHJyUjRDUTRYamNiVlNzejJFZ0RZL0FRNkp5MzZP?=
 =?utf-8?B?TmwzTmwzcnNDbHFZbkpQcnV0VUdycXhId3p6aEk4elRsNTBkeVdiMjNCU0Rw?=
 =?utf-8?B?eGhaRmxMZmdlbjhoV1lFd2VXbTlucXJEa3JaOGt0TWtCUlI5ZnI4dFRwUXdC?=
 =?utf-8?B?d2UreGYvazVCV1VZOWxOMVBnaG1lZkpibmpMdGd1UFZlTnExbVJPV09MRmhL?=
 =?utf-8?B?ZnJQbWFOVHJ6cnhjTkJIVHZhSVdMSjhiWkxuTFVtWkxRcElFQlllOFYyT1Fj?=
 =?utf-8?B?QjBrMExlUEg4bUhycFpPNzVPOGRzbW9iUUlFQytWR0tjSkZPWm5MeWlsejJq?=
 =?utf-8?B?RlZwOVZuSjhKbnRCSC9hZlA3ZENRQVh0ekg1OW9UcVk5YW0xQU9wQ3lFaFla?=
 =?utf-8?B?K2syd0hHS2FmRmY5M1h6ZnVHNmlobEZyVERySWMrcDVLSGozV1Z5NlpmRUw5?=
 =?utf-8?B?dzJ3UC8zWWVKKzhzYndHUkg2cyswQWtHMkVYWWcwZ3VLaTBGN0dUcHNzSnBl?=
 =?utf-8?B?aFVuaFd6OVBTenF3NXcyMzkwWjVlZTJBWEQ4RVg1cjFSZmtxUGIxUjh1Z3Nn?=
 =?utf-8?B?M2xuWGdia01SQkMwdDNlYklaMmttSDQxWm5iaGZ6SkVxbUpFVE1OZmd6NGhS?=
 =?utf-8?B?bHFlaG5UcytkS2d2YUhUZng1cXc3K2k0d3JhSm9QcGJNNHdkb1QwNWJyL25L?=
 =?utf-8?B?cEloVWVjQ2s2V1M0RVJwYS9QMXNvcFlWSU9ZM3RiN05WUzFBcjVXcERiUzE3?=
 =?utf-8?B?YjM1ajVkcHRPejJYdW82TTd5NFBINm9Jd094ejM1WEwvNlUvZXg0eEFWTSti?=
 =?utf-8?Q?Ofif5HCVyZxO3bz0=3D?=
X-Exchange-RoutingPolicyChecked: sXL6Ld88d0PvgBdsmRObhqinJ019lyIW5jDQdtvFg+55/3USUfrKTcYyjUwnlEfrpznil5uI0sgBprEYLgJK3Uje5UU+8UVKbaWJBQEfmjKKaEGU8ZRIBXR0iUG463D4w7BapBrMtBqWmyG0ZVuaqA6nemChL7avPycalwyWVw9AX5kozcKfRIScZxp+T9jRL498ppFA8AbGV/UOZzRlYT6Xe0hxDxtDdZ2NwSEAJREQ9qTjQQbmrVY14yDk2urcTvr2m9tr3CmS0MGcnB4kXLB0x4hBkewoIH2uG+6SMtjiXKbFXQ96xdKGbaFVjmIuQlwFWiHXf3dDwxOHEzgTtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c143d8-e34d-4ce6-8455-08dedb74a91e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:38:43.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mpVnM3FoH2Ik9AR0qavkJ52dcJ2IPtBKd2HvIL/nOcfz8CqyRgjfkCC02xoaoJvHncvI5IWo9b1xgt7yweBtC3+ZDr4OpS/T3TonSqnWtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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



On 6/30/2026 1:55 PM, Mallesh Koujalagi wrote:
> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> Replace the drm_err() call with xe_ras_log_probe
> starting from the xe_pci_probe considering the only considering the
> init paths for the object such mmio, pcode, pci etc. are fall under
> the xe_ras_log_probe() category.
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 +++++-----
>  drivers/gpu/drm/xe/xe_hwmon.c  |  4 +++-
>  drivers/gpu/drm/xe/xe_irq.c    |  5 +++--
>  drivers/gpu/drm/xe/xe_mmio.c   |  5 +++--
>  drivers/gpu/drm/xe/xe_pat.c    |  6 ++++--
>  drivers/gpu/drm/xe/xe_pci.c    | 14 +++++++++-----
>  drivers/gpu/drm/xe/xe_pcode.c  |  5 +++--
>  drivers/gpu/drm/xe/xe_vram.c   |  5 +++--
>  8 files changed, 33 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7538ac7c7dfb..208dc6e378ba 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -589,7 +589,7 @@ int xe_device_init_early(struct xe_device *xe)
>  		 * Cleanup done in xe_device_destroy via
>  		 * drmm_add_action_or_reset register above
>  		 */
> -		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> +		xe_ras_log_probe(xe, -ENOMEM, "Failed to allocate xe workqueues\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -649,7 +649,7 @@ static void __xe_driver_flr(struct xe_device *xe)
>  	 */
>  	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>  	if (ret) {
> -		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
> +		xe_ras_log_probe(xe, -ret, "Driver-FLR-prepare wait for ready failed! %d\n", ret);

why passing -ret to the log macro?
why printing errno twice ?

the __xe_driver_flr() is called from

 - xe_device_shutdown()
 - xe_driver_flr()
   - xe_driver_flr_fini
      - devm_add_action_or_reset
      - devm teardown

so this error could be seen during the probe only we fail to add new cleanup action
are you sure it should be tagged as PROBE error?

as the plan is to have consistent and stable error reporting,
maybe each promotion from regular error to RAS-class error should
be done in a separate patch to make sure it is properly reviewed?

>  		return;
>  	}
>  	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
> @@ -660,7 +660,7 @@ static void __xe_driver_flr(struct xe_device *xe)
>  	/* Wait for hardware teardown to complete */
>  	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>  	if (ret) {
> -		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		xe_ras_log_probe(xe, -ret, "Driver-FLR-teardown wait completion failed! %d\n", ret);
>  		return;
>  	}
>  
> @@ -668,7 +668,7 @@ static void __xe_driver_flr(struct xe_device *xe)
>  	ret = xe_mmio_wait32(mmio, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>  			     flr_timeout, NULL, false);
>  	if (ret) {
> -		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> +		xe_ras_log_probe(xe, -ret, "Driver-FLR-reinit wait completion failed! %d\n", ret);
>  		return;
>  	}
>  
> @@ -720,7 +720,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return 0;
>  
>  mask_err:
> -	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
> +	xe_ras_log_probe(xe, -err, "Can't set DMA mask/consistent mask (%d)\n", err);
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..efca13c2a897 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -18,6 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pcode_api.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_pm.h"
>  #include "xe_vsec.h"
> @@ -1575,7 +1576,8 @@ int xe_hwmon_register(struct xe_device *xe)
>  								&hwmon_chip_info,
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe_ras_log_probe(xe, -PTR_ERR(hwmon->hwmon_dev),
> +				 "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
>  		xe->hwmon = NULL;
>  		return PTR_ERR(hwmon->hwmon_dev);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9e49e2241da4..8453681956c4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -23,6 +23,7 @@
>  #include "xe_mert.h"
>  #include "xe_mmio.h"
>  #include "xe_pxp.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_sysctrl.h"
>  #include "xe_tile.h"
> @@ -822,7 +823,7 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
> +		xe_ras_log_probe(xe, -EINVAL, "Failed to allocate IRQ vectors: %d\n", err);

there is err available, why using -EINVAL?

>  		return err;
>  	}
>  
> @@ -891,7 +892,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  		return 0;  /* MSI */
>  
>  	if (nvec < 0) {
> -		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
> +		xe_ras_log_probe(xe, -nvec, "Failed getting MSI-X vectors count: %d\n", nvec);

you are reporting error twice

>  		return nvec;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7fa18dfcb5a2..d10ba886dcda 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -16,6 +16,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_printk.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_tile_printk.h"
>  #include "xe_trace.h"
> @@ -105,13 +106,13 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  
>  	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>  	if (!xe->mmio.regs) {
> -		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
> +		xe_ras_log_probe(xe, -EIO, "Failed to map GTTMMADR_BAR\n");
>  		return -EIO;
>  	}
>  
>  	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>  	if (xe->mmio.size < SZ_16M) {
> -		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
> +		xe_ras_log_probe(xe, -EIO, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);

while this error is during the probe, it actually shows some HW error
are we sure we want to log that as software error?

>  		return -EIO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index fad5b5a5ed4a..49d2e81090d3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_wa.h"
>  
> @@ -650,8 +651,9 @@ void xe_pat_init_early(struct xe_device *xe)
>  		 * raise an error rather than trying to silently inherit the
>  		 * most recent platform's behavior.
>  		 */
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		xe_ras_log_probe(xe, -ENODEV,
> +				 "Missing PAT table for platform with graphics version %d.%02d!\n",
> +				 GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);

are you sure it is fatal?
it looks that driver probe continues (even after below asserts) as error code is not propagated

maybe we should fix the original code first?

>  	}
>  
>  	xe_assert(xe, xe->pat.ops->dump);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 9c249454cc95..58442d9eb8a0 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -31,6 +31,7 @@
>  #include "xe_pci_types.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
>  #include "xe_survivability_mode.h"
> @@ -708,8 +709,9 @@ static int handle_gmdid(struct xe_device *xe,
>  
>  	*graphics_ip = find_graphics_ip(ver);
>  	if (!*graphics_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_ras_log_probe(xe, -ENODEV,
> +				 "Hardware reports unknown graphics version %u.%02u\n",
> +				 ver / 100, ver % 100);
>  	}
>  
>  	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> @@ -722,8 +724,9 @@ static int handle_gmdid(struct xe_device *xe,
>  
>  	*media_ip = find_media_ip(ver);
>  	if (!*media_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_ras_log_probe(xe, -ENODEV,
> +				 "Hardware reports unknown media version %u.%02u\n",
> +				 ver / 100, ver % 100);

IIRC we can continue without media GT, so is this FATAL?

>  	}
>  
>  	return 0;
> @@ -1022,7 +1025,8 @@ static int xe_info_init(struct xe_device *xe,
>  		 * required for VRAM management).
>  		 */
>  		if (!tile->primary_gt) {
> -			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> +			xe_ras_log_probe(xe, -ENODEV,
> +					 "Cannot probe device with without a primary GT\n");
>  			return -ENODEV;
>  		}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 866986694d9c..046336c7b378 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -15,6 +15,7 @@
>  #include "xe_device.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
> +#include "xe_ras_log.h"
>  
>  /**
>   * DOC: PCODE
> @@ -316,8 +317,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  		mutex_unlock(&tile->pcode.lock);
>  
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_ras_log_probe(xe, -ETIMEDOUT,
> +				 "PCODE initialization timedout after: 3 min\n");

this function is also called from resume paths,
are you sure it should be tagged as PROBE/FATAL error?

>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 23eb7edbdd57..e81d92239934 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -18,6 +18,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> +#include "xe_ras_log.h"
>  #include "xe_sriov.h"
>  #include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
> @@ -43,7 +44,7 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
>  	if (!resource_is_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> +		xe_ras_log_probe(xe, -ENXIO, "pci resource is not valid\n");
>  		return -ENXIO;
>  	}
>  
> @@ -237,7 +238,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>  	vram->io_size = min_t(u64, usable_size, remain_io_size);
>  
>  	if (!vram->io_size) {
> -		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		xe_ras_log_probe(xe, -ENODEV, "Tile without any CPU visible VRAM. Aborting.\n");
>  		return -ENODEV;
>  	}
>  

