Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEEAC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 05:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667910F8ED;
	Thu, 18 Apr 2024 05:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEpjU0Ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AECC10F8ED
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 05:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713416442; x=1744952442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=feJDfNXlQKbogjtSlpHNtkD1CPYCleQRvhfGm9CU/9U=;
 b=QEpjU0EjsyeUgSDX/cZ688X9sY64wcdt4HcJgoALOLJnk48REu1A6nH+
 BcFZg4369qaenOHreGt1P0o+xGksX37BdqkMbVnBDpcDBefHd52gr+xUl
 wIp5SxoGYI2d/7lwGnl0zSQbI9c1aD7SnjBmM/IfJJF7r46lyt9CoO1pb
 F18mCiO1379FocihDAjY7N//c8GfeglIPIiR9GRO871EdnAw5S7ataxin
 +uMWa/GxghdAiqMJ5z4ArRvZwBGqfHdVWHaVa+dkI2/tXka92Bgv//cSl
 3ozT3xNjs/7ObsviHuG2u965qNuF2CoS/tOReywovC/mklio8nGU9W2y+ Q==;
X-CSE-ConnectionGUID: Bfk3uKy1S1eCubLTIPw0oA==
X-CSE-MsgGUID: r+AQomQ7Ry+4E9qZbBVP/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31418519"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="31418519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 22:00:42 -0700
X-CSE-ConnectionGUID: 3648el6cSLuxID/DiiiIJA==
X-CSE-MsgGUID: fnL7HcrUTwSx4FVHUozJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="22945940"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 22:00:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:00:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:00:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 22:00:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 22:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI/PKznOOiXrqtQ3kqPW8bmISwI4/bsLIDP9Id/ysljF9OlN7bRmCluwZ7iHECtn44ReRmY9b+iSLq3jfTPaVGvDOz0E22ycSYneG9iigrgEsXTDnFAfzCdwBlaEQWLp6DdX572iP0+3XNfcjid3iM5b7EMaGaprcdA7Cy5ZeZmeef0Ta2i8aq9KjgieAMcCng87qnnZAv/nj+owlt3prV8qeDCbqo886km/V9Y3z3nVWQlwwDyPpVhx17Z6L+mZbG7lWnTpitBUxXuUZkOIMLAbFdYMlG3MfLtW2Mojb9YyF7LLjUVRBGqM9gyG+rz2GPLa5HNjihQFGqhsyOqHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvnX8iEGMh5cIZ+MVqynvaaJK0CLAx5j7UW64EnQaIc=;
 b=L9h+L+rcGRIe7qf7hAhrdkLy9oWCejp2gb09SsrUX8NYpOAYrza8cnRI9jwniuRrw+sE0K2uHntmtf6dR/71ysrYn9WzY1pPC6+eRwJcu246+WGaf7md4MdURCVRqFIGFl6qKa/ClZFcXpwSaZ2eVOYuTFgpfuFmaFucloP6tqfiuZaq6WUBJpJeYqi+gzvfZgj6LYzrm0rU22YA1AuVjFLWv2oB02OLNZ8nahYvx97F4w6BXBBM8qSDzT98EPvvBL6huQnjNVgNn6rHhKsWZ2OmEgsPrSr21LV+d1YujR38eESYAgS/wBlBTf08EcybnlfTBgGNMOaRnxxMVD6YDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 05:00:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Thu, 18 Apr 2024
 05:00:34 +0000
Date: Thu, 18 Apr 2024 00:00:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.de.marchi@gmail.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
Message-ID: <gmzgyv6tjktchnp77xtux4qoa63v4rckevz2y65dirkxa7tjmi@yb475d2qbaxp>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
 <d7468fea-b5d4-4303-a179-70c297314e38@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d7468fea-b5d4-4303-a179-70c297314e38@intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4871:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4cfa22-0fe2-48ea-6435-08dc5f647ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+VJsGISoFq/2r27ZiMbzN5HEuut58LvWHRb9fDzL4NbdgoE+SOAR/BB8MZkasQJoYrla3SDXpA2Jc2CLmEZ+NnqeXYJnG3i2dSfX8q3ejLmgrhA0yZYCxWJhtBG6cmwfIg4VwYJ705v4uDpxlnVtdYxRmLxwUIHmnVgBWh7lXtJoVSXDrqSMZcg1E8iIko7u/noGL4dEkRehHcBzgH5vfdmBJe9NPC9aeioL9pkSBytf3/gPhhtDKJIQS8uTznFFqRYGLuNHstpGI4kykLaGF/oiqZPnywuBDDQkTnfQiSo0/TP/TwXGCvm2UyEmtUVQwQpVvgyIfmXKZUwnPhCWcCfFpMku5XoPOHXWdzuqXLSOLDc163StiNNhO5Xq+eZ+nLYZpO2vuG9SIHK3tiiVbbHxY8BbZWSjZRwVfv8sV/hRSxv7mPXQFyfe2NoZpFCLR6aoa8D/tBQep8FfT/ediT8663aNTDkckkDWVLbneiYch6w89zYdfuPp+MUS+GaOaamUO/0dy0KMiI1m/0sEjXLLomKXAWzhIq+fxJ0P69xxnLNC6Ml9wwSBhYB0gEKqBRDIbAVwfziIyd+ijEIPHloSg1tcZNn9jkblN5gA/lKs04BXYDEdwWhM36Ov1Cy/daxp63JkiXXAAne4Qu/mH4SlCfUflZAR6IaIDKikkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OXH00vlXoV5/rfZAXxP0SduimNTSfGjsb/yxKOO8q/oIcbXMtOnLjRMAgCQl?=
 =?us-ascii?Q?Yd/soSwWZGqo2kF+6C8xhMO8SGoDNbTM2Y0Pr2aAok7c3ULIyy0FlXxPZ+lN?=
 =?us-ascii?Q?tbDGDGuDRN5O8jWp47eg+gHN3//pMg8ibGSaGM5kkSfhxUK5hrbWKxdi0kuw?=
 =?us-ascii?Q?cH0rf7LXvl1zJRL35CVHM9UO3MBd5djG0qm4EvRC2li8ZZJYn0pjOcAmnT4k?=
 =?us-ascii?Q?Nn8GYF5MXUNalRqomtIGFHwnnthVYU46hs4Csn7kVMIK7PTzEvdrnXyxgJZe?=
 =?us-ascii?Q?BWg5gEIvNZM412b7QZq7JjDAhg5atiVL9dFvNd2NNopunHdlAOiIUuXZz8Yb?=
 =?us-ascii?Q?3XaQ+d+bUtbRx8vOzW82p4FVE47Nl1j59Ul5Bg0qnllZpm6DTbp9BVmw/uPD?=
 =?us-ascii?Q?oGwxJ5SANnr2B1FiP2xPW46IWiv3egHk3LhUK5su7+DaZ3I3NcNmhqagzg64?=
 =?us-ascii?Q?kQ6GmI9xIjUbAyQZNQgH9rzrH0gSPdxmspdLUYDoO8nnoyeMamQPIggbR72u?=
 =?us-ascii?Q?Q9kVt6HGdjel3RtXvwEBqAKnidfvTBJZS5WOWYX5kDUm3eJalnPCbo8mySqD?=
 =?us-ascii?Q?B/LZvu5d2810qnxJKFA1F7fBgyyQzudTT/UX6IaE0OPxI4FanHPQy1tmd4lA?=
 =?us-ascii?Q?zJJOb6MHLbGNBw7mUnIcI5Q2Ki/HqTsn/ePdVi/O88jMJ8loXc1EzYbVQVXp?=
 =?us-ascii?Q?OG8Upj0Xy9BN6MhqYMKR2/lUcOfNxwM7yP/igQ8jj9WMKR/pkjdEikmGpyyB?=
 =?us-ascii?Q?Pm4J+FAaaswDUOCfWaoyPBn9AWSUp9Qot8X23G86EwRR79d7Gl9arRScl4yY?=
 =?us-ascii?Q?/+RNJy1SPGAzw1J1sqo4xMwMx/Rz0u2WB4pI7aASrzDp00eo/zUCLMmpIN/O?=
 =?us-ascii?Q?AIuZFk7ej/c2RycoVbNurgeXSO2N1/FNzIV+H31+gxL0WpweUsw1+yrN6DE0?=
 =?us-ascii?Q?AjP/CxNBggTc83cvfC+2AtvTcNW2pinUnZyVWc4dPpX05eOyjtHRPGFJwLyg?=
 =?us-ascii?Q?e6L+vccorkLBDpuqSdmWLy4cYhBHXxudHtKBXMiu1Ntt5m3rzj/9GS5WUW1G?=
 =?us-ascii?Q?QVE/eE8spGzyI9qFokjDoSZTyV40PzA+cHFQKSu8Y4JFzhoz7mXVbPIpcbIk?=
 =?us-ascii?Q?tdNvqXn8vDd8UhdiHsxsCARsDPUxtLmhFLSVfZFJG8MocJhKgwEZxBDQBYK2?=
 =?us-ascii?Q?bntQYR90pfJeGfIE8SJ+Ow3pEQzPpbIVz2HrUYKccgBIawwE/TGiXYOw7N6c?=
 =?us-ascii?Q?lk4v1IRaoP0ZuFEYdIViOePDxarl8QqG7M3AT8VRa6QAq3MkOzTDGZhTXdnI?=
 =?us-ascii?Q?s5bdshgxjRrsPI5Ab3uGgNn1g7s8niMRybwfilD0/QBezM4FmIJVnV2yAl43?=
 =?us-ascii?Q?PRzykAgozBAVn8gDzf0kWUGecRgR9473HiVQee/0ReVCokXmebKpazlsdEK8?=
 =?us-ascii?Q?5JDbw9yZqxBGpJ7MndGI3LcmBUAqVwo4PmaRvdv4iGw+rKMNjDw3zDMAEh+i?=
 =?us-ascii?Q?HamVvDHf+wQkcxILWMmgbYvBEZB+oQ6iakzZcJImvOoePGe+IAe3MZLJCYdF?=
 =?us-ascii?Q?22rPLGnQo7QQtCc1JiZgxlj8B9vacy3FGWbVQ8BoOkmf6NtE0whoi4hf+aFD?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4cfa22-0fe2-48ea-6435-08dc5f647ac3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 05:00:34.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81ftbUcOHYt6lLeiyx2SDbNMCQ8DpJhYNB3PWAA0UXj0QvclYiqnFjM9ANWna3sk0fT7sXJAXOaxcOTQd3OpTCchYdIDjk3M4A+Roy5gTr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
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

On Thu, Apr 18, 2024 at 10:20:35AM GMT, Chauhan, Shekhar wrote:
>
>On 4/18/2024 04:05, Lucas De Marchi wrote:
>>On Wed, Apr 17, 2024 at 06:45:47PM GMT, Gustavo Sousa wrote:
>>>Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>>>Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>>>>one specific for Xe2_LPG.
>>>
>>>I would also like to take this as an opportunity to discuss the way we
>>>are currently arranging the RTP entries for the workaround. Using this
>>>one as example, created a copy of the entry and edited the argument of
>>>GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>>>following the same pattern, mainly because we are grouping entries by
>>>IP release.
>>>
>>>Do we want to continue following that pattern and keep the code
>>>duplication? Or should we think of a way to avoid code duplication here?
>>>
>>>A very simple approach that I think of is having a single entry for each
>>>lineage. But I guess that's not really feasible today because I guess we
>>>do not have a way of expressing logical disjunction in XE_RTP_RULES().
>>
>>yes, implementing it was always something I considered, but then there
>>was also the fact that when we have WAs that are on IPs that are not
>>close to each other we may have subtle differences like registers with
>>different offset or mcr vs non-mcr.
>
>I see that some registers vary between MCR and non-MCR types. However, 
>could you please explain how this difference affects implementation? 
>As I understand it, when setting XE_RTP_ACTIONS, we simply choose the 
>desired action (SET, CLR etc). So, I'm curious about the specific 
>impact of MCR vs non-MCR in this context.

you need to pick the right register that has the mcr reg option set.
Exammple:

         { XE_RTP_NAME("22016670082"),
           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
           XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
         },

vs

         { XE_RTP_NAME("22016670082"),
           XE_RTP_RULES(MEDIA_VERSION(1300)),
           XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
         },

#define SQCNT1                                     XE_REG_MCR(0x8718)
#define XELPMP_SQCNT1                              XE_REG(0x8718)



Lucas De Marchi
