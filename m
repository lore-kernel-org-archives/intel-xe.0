Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EF3C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 05:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E5210E254;
	Tue, 14 May 2024 05:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7vXIbby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4BB10E254
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715663189; x=1747199189;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=myrfYlmcQHfw+5U16ns3Ah+fTOXC+iQjPfNFEBgcA2o=;
 b=j7vXIbbyhwQ6OaMjr/GEGWFJreHtU1vAYTlfZKMatV4BA1Eu+5QlVGAV
 xPcyTGzQ1Jnkgde7Y2rgBMblv3Hw0ZBTTAPYLBUTbN+2KP6HTwF3vfvqv
 DveCoM0wHFqPANPjBDeN2o0AkWiSLrjCKQaP+Q3PrDtl4ckQHVyY5sXiI
 Sw7P6Br40/E0+EQvuFiwkBlBLm+q6tpsl2hufVonFEpAnFb/e+BWeSyhf
 WjT5IGBuaY75tqOd1VL9JchKHyqY8zlXpiYlywNlqY8sNkQ8db4JV70Cd
 AvO2/ljys0IOvIGgmVxDGVP8+KQx2Q5aI11qK3QI76Ioqni35iKkXn52Z A==;
X-CSE-ConnectionGUID: sZSLzSWMRkqORmvqMuP3tw==
X-CSE-MsgGUID: 72TYgC6FSdKTeRSl/1k5ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29116305"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="29116305"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 22:06:00 -0700
X-CSE-ConnectionGUID: 5YTlNSBWRRG2zpGDx7ie9A==
X-CSE-MsgGUID: igPcBC1PToyn0XFcnGMPTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30504552"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 22:05:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 22:05:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 22:05:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 22:05:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 22:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtltRvzPcVfH9HGJC22gG59tMgka3JHMJKSjJ+zufv21u1Y/6CPghsyg+/UBYrJYj7QZwtwrFBGROvj+Iq04F6Ci+SY+5teus+HlRzjA2l4DvCvPaoKtimDM4sey2j+SsYu7dglhBS7DHdGGAkY5na/xE51cz79/JOuudNQDGWS3SE38/0pMRzMMDSZd1SCMepq1GrGAGJtE/xwMQekPZ9xdgHzA4DbhAAXN0s6hA4X+y8mm7lj2kWXhTeMvpKAPB8YjOwT4Xt7uaXosjm8WQi42CIwZz8Su0VgcmVCmv+nyvGa+U/0OmidH4YNPFl2+ZHcK29fUANqzJXvUvXnAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EofKh+faNFK/zYyL4um0sK1kfuOUKIsnYvGTEHr7mQ=;
 b=lqrjLq7yDTpPKtt47KYzlwGmcR7chPsaAIcYhBk5SolPCaXUS61RsGPR9vsZqxduss6cCPx32W4pYs4qplzB1Mm4ioZZzwYL4uJJYXbXvTreP8v7V9oGHTNUk6T+lKo8rzTOv9x1sNmiUuv5VM6rOvjk3ExghsRds4+jIpsAPIkGIUedSmDV7soVxIhdVtQ8wQlGpErcZO7RNl0iUgfTbAELy11Aqq7UIl18x1fFMmXqETnJw95wApu8FXtWuJSbYXjvummWISdSZtuhym5BAmDoAm5ce5DRRKc9+EGFdbWV9cmaHga/Mv3mlm5Nj7u144KI4kdXeI+W+beEtyU4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 05:05:56 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::301e:5fa8:50a3:3824%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 05:05:56 +0000
Message-ID: <6846e0de-90aa-4fd7-b494-4e7f5a021c12@intel.com>
Date: Tue, 14 May 2024 10:35:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: move disable_c6 call
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240513070546.3754640-1-riana.tauro@intel.com>
 <20240513070546.3754640-3-riana.tauro@intel.com> <ZkI26XXGaplaUrdO@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZkI26XXGaplaUrdO@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8831829c-3536-425f-64d1-08dc73d38952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE9WUktzTk5VWG1OSCt0bU9DMUhDWm4zSUJBRnlDZlRUdndBRzl0ZC9rc1JX?=
 =?utf-8?B?R2p6NVIzWlo0UGJNeldXazJ0YmFEZkUxUVhSVmdxYkhMVW9xc1oyRGRIYnFN?=
 =?utf-8?B?UDZFYm1pd29YSGhNcEJuNWRMOFJ0OWJQTGNyYm1yN21jcXRadVR3UEZRS0pN?=
 =?utf-8?B?SEtraDNTbHp2b29VOGZla29hSFZHb05PWVVNSDlieUkyRjYxSmlGa0pXWjRE?=
 =?utf-8?B?SW50M1RiRXc1OWFxSmdydVFNaTh4NWY3NXJuNGo3d0l0VTI4TFM2U0RDaEtZ?=
 =?utf-8?B?ZTdxQnJ3b215WTJZbm84RW10a29NUE94d2xKU0taL0Iwd1JIOEpUQ0lNcjIx?=
 =?utf-8?B?MFpjMnBsQlZrdjNhaHJudDdLSk11aW5Kc2pJbHRCM3lpbHFuSHN4TXJoZnRL?=
 =?utf-8?B?a1JpQXpJalhFbk9MN2Q1T1dSMTJOYmQzQk5OS2xxYmZ2NzhmWU1LRElhMW8z?=
 =?utf-8?B?SnFTZGhtd3pmNlgrRFMzSHRXYk1DVS9weFEvLzhBT2dITlMyeExXSFAySDE4?=
 =?utf-8?B?L0gvTThacXlIeDBkVlRsTC9EejN2RmJCVzZEVFhOWlByYjRjOUtCcmlIalk4?=
 =?utf-8?B?MGVHd1RyNnhNcktBWmgzaThKc2RNWnVXOU9DMUxteTl3enJBa0JiUHgzeDA1?=
 =?utf-8?B?OTVzYURwWERPUlMyL0xoYmZYa2NXYzJxcmdSWGM5VkJ3UndQTkpBZWhiNERR?=
 =?utf-8?B?UDg2NDAvandYQzhNdXY5eUZlQ2VjdkVzUnFjNENHWURlRWdhNXFUNkxQS2gr?=
 =?utf-8?B?V1I1ZEpjMGYyM3lsVE9iWFdCbk9abE1OZkU2YjdOaUxsSG1yWFBwbFRMTVJQ?=
 =?utf-8?B?SGJSbXc0dVlPWUlVZ2JRTmxJRGpHak1xeVloeDZYbmdKbWg4NHRaY2dFM25i?=
 =?utf-8?B?UmpKQmp2czNicitHbnVWT0xaL2FsZlBnQjA3Y04xb1Rrd3RRRFpNMDNaVW51?=
 =?utf-8?B?dURwNGh3dW92b0VVUU1CSUhiM3lHa3hnbzJhS0dDb3Bkd21rcktVMHRNUjdC?=
 =?utf-8?B?eFhZK3U3UC9HNStOK256UUIrNVV3RVg4dzdFeHY1bG1CL1R0NjZ3eWo2ZW03?=
 =?utf-8?B?U2tLVzZxZVBBeUI2NDhuZFpvbTF0eU5aRWRIbGptRlBBWWM4aHpyVS9ERlQy?=
 =?utf-8?B?enV1RDVEOVR0Wk5SUmNJY0tiRHp0ZUUzNnRaTWhLMjNxMXZqSW5EcGh0Y0Rm?=
 =?utf-8?B?NitueEVBOEQ3UzBUeWduZldkNzJvOXo1TFdoNG5JRWtwNlZoVVpyRm13elFV?=
 =?utf-8?B?RldTMWZWUXMveVpKNFVNcUlKSzNBUHc1TkIxMXhXSzBmQWZRT3MrWWRJaTZV?=
 =?utf-8?B?VHNzcUhpVXlNVGxScTlwcFNoK0gvZ1E4dzlVeFNxRXArWC9oWXdWSEZXUGE3?=
 =?utf-8?B?WSszd0Z0dHMrekVSbzgxczd4bkVXWlBkcGxBNWl4NlA4Z3lLU1ZVeFNBS0Jh?=
 =?utf-8?B?MDJxdzBkMlJHWmpZT0VYRnJRRnhEMmlGUVErUjc0RVNkOXo2RFovaERSdXE0?=
 =?utf-8?B?eVZNaUNhdStCdGZaNERiSTBKdEZDWnBsMUtyeG5WY1BQTkNxdm9aaHpUK1oy?=
 =?utf-8?B?UFU4OFVMNS9JaFVhSFJUVStJVzYwVm1PeGVkN00rL0Q2MExWdGdTSVBiNHN1?=
 =?utf-8?B?M041aERRQXZ6NUJrMmNtcG9DSE0vbS9qcUJPV2RUN2dIRFhacEp5eWpKcEZT?=
 =?utf-8?B?MkVkVlNPMWwyckhiT094MStNRU04OG9VQ2F5dU00bEVvd0VnZ2VjdG5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3laOEhJdWtaL3Y1Uks3NkR5MENkdHc1QTJ1OVBGYmdSNmMvcVNNMDk3ZUdh?=
 =?utf-8?B?d3Rya0lHbC9sd1VuSWxaaTF1elo1ZnI0RFBzTVAxWGJlQU5GRUhkUTVsWllt?=
 =?utf-8?B?UVFxZWJUQ0RxZm1OWjlMc0JDLzg2V2hUVXlNalJyS25QYUZTTUNTZHhockZM?=
 =?utf-8?B?SVJ0VWcvZ0RhTEN2Q1lvWkUyK1cxa2tqd29xTGRHZ1FMZXBmd055QVAwaFBi?=
 =?utf-8?B?SkprUmNEWWxEWmo1amQyNllEcHplbDF3RnpNd0dPMGpSRmRIVGtBa29ieHFh?=
 =?utf-8?B?eE5FT2VueG41Wm9nTUdNQkQ4Q0htSnNvcW0rMmROWURhcnpXNzJUd0FZQW1k?=
 =?utf-8?B?QlpzQ00zaElJeGNua3B4bmM3QS9PNjl1WVhyWmY1U3QrQ29kSHJRamZ5bzgv?=
 =?utf-8?B?cmRRc0R4MlV4bmdVbFhKdlZGbnNNZC9xQXZBd21xUjJGRDdjNUJ4ZmJLVHpO?=
 =?utf-8?B?azVGWUxYQWszMGNXeVkwWDRVbU5hMUI0Q2hHa1FGajRvRWQ2WmJsS3UzNnRO?=
 =?utf-8?B?OEtnS0NxMGlXSTJodTJvV2VNZU5sQjgvMGVhdktqei83V1NIK0drb2x0YXN4?=
 =?utf-8?B?aGMwZDRBcVp5eTVCWkVIK2VVMllxSkQxekRNajhaVjJ6MFV2dGo1cVFpUXF3?=
 =?utf-8?B?dFUzWk03OXEwVFJaYUx3cWpCT1JoOTNLNHp3VDh5SUd5b0Y2MnlVZ200RGFS?=
 =?utf-8?B?cGtNdzM3aHM0Y1VmVHRCMy84UTJHQ3VWS1Y4akxNamF2Ky9kSXBmVjI2WXA1?=
 =?utf-8?B?YUlCQ1dMOGVMM2VXeWlwbjFuazlaaVMvYmgyd2wvd2x2eWxHcXlUZy82WjJq?=
 =?utf-8?B?QlBLNkt1VjIrTkExb2dEM0JqbnhTR2M4Z3ZmbEJMcHYxOGZUd2Jkd2U1RWVm?=
 =?utf-8?B?OXlXR21ZcGdQNHlqSkEvaVBYMlovRHVBb3BiSzRPUFFBWGtRZVByZUlPS04x?=
 =?utf-8?B?V3l6NXNxWGVWVU1hdWVLaGdWMllqb0pzUGJnMzdFVXRlbVlmYktSTnhpWW9U?=
 =?utf-8?B?MU5Pa0lBV0dyOTRQVFgzR3RoV2dsNk10c1g1UEdYMXhDcmI1QngwSlZ6elF6?=
 =?utf-8?B?R2tBVUR5UDNUdzNEV1QxcXhueWZ5cndHeVJaajR0QVdxZXNBK1J0c0lUSXRm?=
 =?utf-8?B?K0dWRGRGYlNiUllUSjIwVzhtbHFqM2pCRXdCR2t6Skc3WHBTZEJzdm1Oalpr?=
 =?utf-8?B?V3BJdTRBVk5SSFFBZjVxaDU0Z2s3cFZjcmF0dGlPaEkwbXdNaVNvWHJKS0pN?=
 =?utf-8?B?MlB0Z3lnM1pUWXFkRkIwYUdma0x3MTV4NFNnRlA5UlpJQTQ3SEFGVUphOXEw?=
 =?utf-8?B?Z202cjB2d2FLREV1RmVaa1BVV0FZYTZ5ampOLzVHbUM1dUZUN3ZySzAxRWRC?=
 =?utf-8?B?cWZCRTMvTCtVbFJEcnhGNjIybi9YZUYrTGQ1QTRvUjdpcGRMRHh6bm41ME91?=
 =?utf-8?B?VG1wSDhtaGp5RXBhTkd0ZStxaGlndzB0MjQ0NVlZV244blVUTm5UQ0lzbHJm?=
 =?utf-8?B?MGpqdGZJV3ZYU0kyVUxZbzI5T1crU1Ixa2dxN3paSXRLcVlRV2JMS2tJWHpT?=
 =?utf-8?B?WnF1YWtMMnYrRmFNVUMxWTZqVjlQdW9RL3VRSWFHR0ZQdy9PYXJiMTVlcWRq?=
 =?utf-8?B?T0xLYWg5Tk1EemJkSEYzc1g4T0pUa2RPdEowdkxtS21vRTZIeUpFUDJKMHdu?=
 =?utf-8?B?am9mN1d1d3p4NEpzR1FwdkxRTSs5NllqNTdOL21kc0M5QlFTeEcvaTEzcm1R?=
 =?utf-8?B?NDdBZjN1MjI4cU5rcDBSWTAxbHA3SFJxbVJQd3I4dTZSZnZUSk4vTjVVR0dE?=
 =?utf-8?B?Yk8rL0k5cWw5YU1Pa2sxV0x3M0pqbXhHdEZDRGcyVXl2K1F6bzNXTHMrandO?=
 =?utf-8?B?MStBVEZpTFRVSTdDQ3ZNNE81MVZDMmJVMFpLU0FjSXYvZGtVU094MDM5S0hC?=
 =?utf-8?B?MG5IYjBRd0k2UjFmdHBLYWtSZGd5Y1BqL0lWL2xlemNjaDVEcE5WcE9tR3Bs?=
 =?utf-8?B?SUxUdzF0MXczOWhtNitkMTFaVzF3UWl2Z1FRMHJhdExiZ0NtRk5LUXZiNitV?=
 =?utf-8?B?V2VYdWhja1pvOVB3bkU3UzlSUm1kWmRMckZNYTM5eGR1L3NrOTllUFBNRjNI?=
 =?utf-8?Q?8ki3kZ3rwSZNHOhrkKlOsPJZz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8831829c-3536-425f-64d1-08dc73d38952
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 05:05:56.3140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmi4jB5O6VeORgG1buqhQs3xw6ZWtU5cAddS1i8Y6yh1ztgVu83mFlHmA4ML4vY4zTPyZeTTmvfqWMjSa1E5Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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



On 5/13/2024 9:21 PM, Rodrigo Vivi wrote:
> On Mon, May 13, 2024 at 12:35:46PM +0530, Riana Tauro wrote:
>> disable c6 called from guc pc fini on skipping GuC PC is unreachable.
>>
>> GuC pc init call returns earlier if skip_guc_pc is true and never
>> registers the finish call thus making disable_c6 unreachable.
>>
>> move this call to gt idle.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_idle.c | 11 +++++++++--
>>   drivers/gpu/drm/xe/xe_guc_pc.c  |  5 -----
>>   2 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 2f247cb910d1..0fc865e07965 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -145,9 +145,16 @@ static const struct attribute *gt_idle_attrs[] = {
>>   	NULL,
>>   };
>>   
>> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct kobject *kobj = arg;
>> +	struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +
>> +	if (gt_to_xe(gt)->info.skip_guc_pc) {
>> +		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +		xe_gt_idle_disable_c6(gt);
>> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> +	}
>>   
>>   	sysfs_remove_files(kobj, gt_idle_attrs);
>>   	kobject_put(kobj);
>> @@ -182,7 +189,7 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>>   		return err;
>>   	}
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> +	return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> gt_idle (RC6 control) is more a hw thing. shouldn't this also be converted
> towards devm?
> 
> Anyway, it can be a separate patch.
> This patch itself is correct >
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you for the review.

Thanks,
Riana
> 
>>   }
>>   
>>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index d10aab29651e..d0bc5e3090bd 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -898,11 +898,6 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>>   	struct xe_guc_pc *pc = arg;
>>   	struct xe_device *xe = pc_to_xe(pc);
>>   
>> -	if (xe->info.skip_guc_pc) {
>> -		xe_gt_idle_disable_c6(pc_to_gt(pc));
>> -		return;
>> -	}
>> -
>>   	if (xe_device_wedged(xe))
>>   		return;
>>   
>> -- 
>> 2.40.0
>>
