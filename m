Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4A2C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 12:56:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2D310F4CE;
	Thu,  2 May 2024 12:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX65iM2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06C710F49D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714654560; x=1746190560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aKvf6TkjoQED2UN7QoImGkMbbWY8n34iPxOx+Vw2Cbc=;
 b=hX65iM2dBlbRMfgzfO8Za5NpGdLnn9ceiYmmKpKvGMYrna/raWP+eJV9
 B8stANKBE822KhvlTSwv5GDhlndD0EdUW3lK23V1VqxYNX0XlMYpghfE4
 JuFJru/QOpfqfOGrjfeBl5sRsHP2yNAPdabFdIMMb6JarXHJvdowiIMmz
 iWkvxItpsEyN75wP8JnnjHHuCfGPUdMT1GbfM5YSLTC5Ln+FRVw9TEXLm
 +auMVEv3kGjNw7DLeze2FP6uyI59UDMN6g3gAtf/PJqLLjUif5iU8HUtw
 kDV+ElhFvCI9Ac4YfdITmtrWOsQ2xyeBGH/5BEsYwbPu55VO8qMLEmDEh Q==;
X-CSE-ConnectionGUID: JhhThV8mT86BvRI/O2m7Ag==
X-CSE-MsgGUID: Br4CoqnGQ/CpTS9PCfnYww==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="27901631"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27901631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 05:56:00 -0700
X-CSE-ConnectionGUID: GrmOpaVEQBuWOwftOGwo/w==
X-CSE-MsgGUID: PLyWq4blQIukdBWWeCD6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27506416"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 05:55:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 05:55:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 05:55:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 05:55:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 05:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek2nZf6CaArjCyqjiU1DnlVioZ2JEDHw0vSx5KWxrjBBU5MOp3JJq0P9BpDcEQt4PpEo12eI8Tl/9qlkkPM6T87fPso2JaQiorePIVLmsOWlit/b0IyjFoHweYad8+hU6+4JppQq/ZG5FCktG12zpo5JSCa0MzjBzigCjI1DbL35/2f+IqsASQPss4C8CHUuDA5hX67F+Gstxhug6PMtpVcam3Pzo6DGaboqPctr/8/p7GolkX3kEjz/T+vO3tQtEX/yXmgGR5H5jEUUg1HU7SEe9HdSfyFNqJBirBj+WJRJmZlWZPwzWaXDuktMMzR9rwP1T5RvWw2xNeBtJrQlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIIGE6T6yrhTA6XAzulNRlSbkG62DONVw9jeiYITpnA=;
 b=mtGmCXJP8Q2oLrEU7E2qLYXItVIv3Nj0zYG7zcbH6a3HIHylfMDoZWzyUa+bbpxevquKh77hdP+YXPthLszHc544aD4Pw/ci2gzzE0AmsUqoQGWrk5DV2QS7B+5Np6QqR9kk+Ot9b9HVJKKW1BI6g3HVzagRyk+KQ5zYrWf6Ega62P8UlDLyU0gGE/jU71Q5j4DbXTS7qHbxkScldKVmwqiWvIIIClKUpp3jifV72jvsNRl8r33Yfkw5XPvGCMgyFePuL6UcFu6qawjPLbFPk0XqQbkoAkZyn2PXeGLLt7UaMDginkBr962TgXGZ0bE5OO3u5C0B+bBPJoCG+t7y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 12:55:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 12:55:56 +0000
Date: Thu, 2 May 2024 07:55:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <qer2v7bslci6af6u3ygkcpicxyacbex6r54wzfyww32rq3sevu@2tovdhmfdp4t>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com>
 <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
 <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
 <ZjEUm9LD8irh+eKh@DUT025-TGLU.fm.intel.com>
 <87b968f4-e6ec-41e2-af11-03b6adc6f0f8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87b968f4-e6ec-41e2-af11-03b6adc6f0f8@intel.com>
X-ClientProxiedBy: MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: a97e8322-c733-4170-3da8-08dc6aa73513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yMla2VfOv2jhU2ohOXEETZ/Znh3Hjlld256vUtb44FaJIeM7My6mbxTj+sbR?=
 =?us-ascii?Q?Ugk/ytGQGuLj5kPpw6CpvE7Q4ZiXTojemv34D2yAEcFmVI1i7uOnC6KJySgv?=
 =?us-ascii?Q?lVYKUiriKq2cSWjXWd1SP3/z0298ON72ilrk+AbQ1RE4H0LpIPMjXW+IgXy/?=
 =?us-ascii?Q?ETuPdckPcmlnjo8jroobFSmEC1W+nsHBmLH8sTgDxBVKoAOEyXmoY66orcQx?=
 =?us-ascii?Q?5DTSAfXwqRRJqBBrQy+Gz139z/g28vvkslLTO4cvanvNqUhXgFgXlMl49u7e?=
 =?us-ascii?Q?fzNG2/+N4dp58Yi0R/rkiJYgIkQAKPAheJLKh0Mzcx9iOnBtBSA8LZIUGET+?=
 =?us-ascii?Q?FB3H05nVh2QCXKfMy7HzN/f9JbcgxgRJ8SoC3wHfhl2uP50vymJ+SjInFhPM?=
 =?us-ascii?Q?kSpVFLN0OIiBIFL9dBvgMa95YzrwndAK1eainilZucvBAuu3FDlZixmuJK13?=
 =?us-ascii?Q?o48an2gCvhO3MojKjjiGK8yKyGqo6rjVPugtYzFR0fD20XVTjmcfB6FAH8Fa?=
 =?us-ascii?Q?tK7hjrE6423Ux2Ma8fUCZe0RIDI7tj33mHt0/5/OgVrTHvF+LseSaQ9tSXmH?=
 =?us-ascii?Q?Zne7I1yLWYUgVCzT7rlymNhbXjUVKs4JCYXQaehvnXKtqFqqerIG7t3ObrQC?=
 =?us-ascii?Q?cufeY0N7uP/P9lxyk3hEYTcp1sHAuAAQoVQZvaZIqktthqLSvI/oCMCxrsSC?=
 =?us-ascii?Q?i/reCryiCuE2L/KqqckAqHK2vTAy7UYd4LP/lLt775InROXKQz5NBGOZf0Wz?=
 =?us-ascii?Q?Ia/2rnpptFajBvLuHtCe0d/bKhIPiFjnpltOMGBh2HBnlklmTGTOC6GTMEco?=
 =?us-ascii?Q?/wU4ffbG2eu54ME8CKxQgF7A8UYxmzcCzagl7H5syHx4Az+ODMT7YZf+ubje?=
 =?us-ascii?Q?g+zxWPa6gCDb7TJ4ZzcWhbJl/P4zECmoGLPnTLhsCcPQ+bVFm9XLVe7+Ka5K?=
 =?us-ascii?Q?6jR6x13FN3JSyHKMPEaxYxqMUavy+yQSkhhoPyyIBmVTcQr/i3jFHytxRBgC?=
 =?us-ascii?Q?chhLo8HvGkJAMKExoO1svhv1R2biebdzNDyG81ADr2JgtAQ/BxtPAixJ2CnB?=
 =?us-ascii?Q?kfu1N2F5Eyir3VufW5pirmgfb70mYnylMdNS7Fyw58h2LsaDmKTxZt6ZvRaG?=
 =?us-ascii?Q?R7eQKgIBwyqnXheSGW3ubJ3hbYKaulxQTevyiDx/a5u+ucqzQvAfbfk3rmXs?=
 =?us-ascii?Q?ULOOL/SS49s+ELX0mOE2kmsIH5lTC6Jhe+om8RhdnyZBC4WaJlNrLHnxonj2?=
 =?us-ascii?Q?R0y/tnyKEOc38N1hoTp6Jmc+qpPFluW780mnbL1Ytg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPK5BLmmhyNeDPy38Bqa9PpKyLklrxWfMhKgwgj2AJteFiN2lx0hLdrcAWt4?=
 =?us-ascii?Q?EaKGbait1Yrr/KGdXzAmvDE6vXOzT4iffR0e3KjGHIxwxUGJKy98tbynuy+X?=
 =?us-ascii?Q?aHTa1p+74LS+mIzO9YWewbWOnrTsG29gS/JVWcW1P0A+6kravWLeGk61Wsne?=
 =?us-ascii?Q?eLdCjmkWx33ZPMcV5AIITeZ2iHspRj0etPODJPe3GyNA93MTN+NPWjU0yCRm?=
 =?us-ascii?Q?CT4AJX2TMvLIqvFD7kZswEN+didLZ/DfX5zwxw2nq1oI6K8LegT/s1wIX+kS?=
 =?us-ascii?Q?wmKwhMDWgJZZqQ2yu+gL5qZm+Av6TEiftjNlZN8KczQ5CgmxvAHz1doSdo/Q?=
 =?us-ascii?Q?lZBi4NFVgzfpni6N46vKkFbFqqfXzVxw1opdLVZCwu6WU02BRzJzorjtRhht?=
 =?us-ascii?Q?6xL85JEiSacPGJR9lCL2+R0xIcup0YzaFraqwEEl2FtkY5osnN8QxebA7JYK?=
 =?us-ascii?Q?Wb82QRGBwCuQWEKQcH39jjwY0ZXSdwyhadMajwnMPCleL25LFu2MIH8bPXCB?=
 =?us-ascii?Q?qPtMtVlzRKRBBKX+4jhx3HsWupR0CUDlZk3Oi4vdQ1spUps35UpLNyh+4T6I?=
 =?us-ascii?Q?7KRmZ46cpUvvj5/DJH9VHXthrAbsdJk0UbBAhm1cwZTYwhT62iB6YGvKbGUw?=
 =?us-ascii?Q?G3Pvamh4xQ2vV+hsSwzEtD76VmiQVLKkMo84lJd4RNRHuZPzKupRyebk7ftd?=
 =?us-ascii?Q?p9pOssbZNiW/e9pD8KUJ6Upiu/DWbzhlm8B1341L1t2WzSxlOaXBZC5L4EBp?=
 =?us-ascii?Q?5U0w0W0Kd3t3trtzkr4t7JbLXCWejdO3kR0YZWGc3QtVGWtf/X7EkpUgeOmd?=
 =?us-ascii?Q?TDiCSR9IRw32Nwkr7PXn1xzzDBwn8qGLf28Vh2fHChEbdF7hV6J0ub4s22JE?=
 =?us-ascii?Q?bhKHsKrp7ynvu8iss2LPbpBd5WbJSoRFNDwFsngLiEfQ2IWgsObk1lgDBlYI?=
 =?us-ascii?Q?pJpZNz7HD+OTYJUV+oqOq+6DwcjG8TY9nm6l69C9REe7K1znL1IzmBjmFjrs?=
 =?us-ascii?Q?HOLguLEzxrRI5mz0kD9fFgtEqGkdWgWvDD72+TS43nqCxIV0g7/DT2bJt+6Q?=
 =?us-ascii?Q?1sBUIcyFTw9cNqhdtLYbjht+adLX2LvSvvDg2ETw6RkkoBai/AAWQjQgFwt8?=
 =?us-ascii?Q?Hu3Sno/W0373rJZ4fRmbFDufOMv+kS1Z7nFrNBlyoo773gzYLD4KOaW5O7g3?=
 =?us-ascii?Q?paopf9iYitjmgLRz9OWofwTiMRcKbpz/pGrWP31F6H9I0jraUP5mEZxjw4GW?=
 =?us-ascii?Q?ApXOYIG1W4GFL6VvNi9WVG+rYaSoMLm4ZEuWBBGUM58AwhH8LPp7grs9dMWt?=
 =?us-ascii?Q?/kUq3kr3AkQKFVFQEHnErGpMQtueBDYa7xVBtry3Acg0TLibfPcbBqdn11JL?=
 =?us-ascii?Q?0QEHEuej4+JmAzRehNspHjF6AroqYl1kvHl0veGBgZDsS6qpohv6qsLiHU/p?=
 =?us-ascii?Q?E7/sIuH9SuvUNXk0nxGW1r/HkUoO5936lzow9IXWqyu7wrSCpVqhq7IUQU4A?=
 =?us-ascii?Q?S7RK0P5yMfvwp+PQ9+Igt1vwnhTTQEn8OVhRWi8IVjsSTsw7aBA7pRYtR6xR?=
 =?us-ascii?Q?kgBgVftK17sacZBEc4/R0AtqFYSSm9osCLvQzZsmv4x68BDXuhUde73I20Pm?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a97e8322-c733-4170-3da8-08dc6aa73513
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 12:55:56.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXTy+jfjPlecBO/i4ApbxKyye9fLm2U+4bxSglqFyyG0/vK6IhnieASWSXeJCIPx4/cee6kiE3JgalAgfPCoPAhJSVjO40PfRqgFSxOHp3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

On Thu, May 02, 2024 at 01:54:55PM GMT, Michal Wajdeczko wrote:
>
>
>On 30.04.2024 17:56, Matthew Brost wrote:
>> On Mon, Apr 29, 2024 at 04:03:25PM -0500, Lucas De Marchi wrote:
>>> On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
>>>> On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
>>>>> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
>>>>>> Not really used, it's just a copy of engine_mask, which already reads
>>>>>> the fuses to mark engines as available/not-available.
>>>>>
>>>>> I got confused trying to understand why this ever existed.
>>>>> It indeed doesn't make much sense on today's code.
>>>>>
>>>>
>>>> That was my doing with the intent that we never use the engine mask
>>>> until after hwconfig load as the engine mask would be read from that. Or
>>>> alternatively in SRIOV via CTB (or MMIO) relays.
>>>>
>>>> i.e. it was fake way to enforce correct load ordering.
>>>
>>> but we never used it from hwconfig (instead we kept the fake copy here)
>>> and we never will as it doesn't have the info we need.
>>>
>>> Instead we just went out of our way and started using __engine_mask
>>> instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. I fail to
>>> see how exactly this enforces the correct load ordering. At most it
>>> would return the wrong value and we would silently ignore it (e.g. if we
>>> had a call like xe_hw_engine_mask_per_class() before that point since it
>>> uses gt->info.engine_mask).
>>>
>>> For SR-IOV, nothing overrides engine_mask anywhere. Not even if I look
>>> at the wip branch for VF.  So, I'd say that if VF needs it, then please
>>> add the prep together with patches making use of that because the way it
>>> is is now it's too fragile.
>
>but the idea was that for any engine overrides there should be no VF
>specific code, except the way how VF will know the fuse values
>
>in other words, the only SR-IOV requirement for the load ordering was to
>make sure that we can use GuC CTB, to allow the VF communicate with GuC,
>prior to making any manipulation around engines.
>
>separate requirement to use hwconfig by the native driver, was actually
>from the arch team, and it was a prerequisite for SR-IOV requirement, as
>fulfilling this requirement was guaranteeing that MMIO, GGTT and IRQ
>would be operational, thus GuC CTB will work.
>
>note that actual driver implementation, before this series, still didn't
>comply with initial requirements, as while we pretend that we can enable
>CTB in xe_guc_min_load_for_hwconfig(), any CTB communication will fail
>as IRQ are not enabled yet
>
>>>
>>
>> They should read the fuses via a GuC relay.
>>
>>>>
>>>> Assuming fuses are read after this removed LoC, the load ordering is
>>>> correct.
>>>
>>> fuses are read much much earlier than that, in xe_pci.c. Why would it be
>>> wrong?
>
>only GMDID is read there and VF must use GuC MMIO (lucky not CTB)
>communication to get that.

right, I looked in the wrong place. GMDID is read from xe_pci.c.
Fuses follow this call chain:

xe_device_probe() -> xe_gt_init() -> all_fw_domain_init() ->
xe_hw_engines_init_early()

>
>on VFs we read fuses right after we get a hwconfig and enable
>(malfunctioning) CTB

where? except from  the place I'm removing and the place we read the
fuses, I didn't find anywhere the engine_mask being changed.

thanks
Lucas De Marchi

>
>>>
>>
>> I was thinking the fuse read required hwconfig step (also brings up
>
>that was due to the ordering suggested by arch:
>
>1. read hwconfig
>2. read fuses
>
>and since 1) requires the GuC, so MMIO and GGTT must be functional
>
>thus for 2) the VFs can use CTB Relay (as MMIO/GGTT and IRQ shall be
>already functional due to 1)
>
>> CTBs) but now that I think about this, I believe the fuses can be read
>> via a MMIO relay so the current location probably works. Double check
>
>according to arch team, we can't use the GuC MMIO Relay anymore
>
>> with Michal Winarski on that.
>>
>> Anyways don't let anything I say hold this up.
>
>btw, I was able to test this series on my WIP SR-IOV branch and didn't
>notice any regressions yet
>
>Michal
>
>>
>> Matt
>>
>>> Lucas De Marchi
>>>
>>>>
>>>> Matt
>>>>
>>>>>>
>>>>>> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>>>>>>
>>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>
>>>>>
>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>
>>>>>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>>>>>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>>>>>>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>>>>>>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>>>>>>  4 files changed, 4 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>>> index e922e77f5010..00a22cf2f5b5 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>>> @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>>>>>  	if (err)
>>>>>>  		goto out_fw;
>>>>>>
>>>>>> -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
>>>>>> -	gt->info.engine_mask = gt->info.__engine_mask;
>>>>>> -
>>>>>>  out_fw:
>>>>>>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>  out:
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>> index cfdc761ff7f4..72568414fb7d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>> @@ -116,12 +116,6 @@ struct xe_gt {
>>>>>>  		u32 reference_clock;
>>>>>>  		/** @info.engine_mask: mask of engines present on GT */
>>>>>>  		u64 engine_mask;
>>>>>> -		/**
>>>>>> -		 * @info.__engine_mask: mask of engines present on GT read from
>>>>>> -		 * xe_pci.c, used to fake reading the engine_mask from the
>>>>>> -		 * hwconfig blob.
>>>>>> -		 */
>>>>>> -		u64 __engine_mask;
>>>>>>  		/** @info.gmdid: raw GMD_ID value from hardware */
>>>>>>  		u32 gmdid;
>>>>>>  	} info;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>> index 9f6e9b7f11c8..59a3f24d31e6 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>> @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
>>>>>>  	 * all of the actual service copy engines (BCS1-BCS8) have been fused
>>>>>>  	 * off.
>>>>>>  	 */
>>>>>> -	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>>>>>> -						XE_HW_ENGINE_BCS1);
>>>>>> +	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>>>>>>  }
>>>>>>
>>>>>>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index a0cf5dd803c2..6b2086ea24ab 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>  		gt = tile->primary_gt;
>>>>>>  		gt->info.id = xe->info.gt_count++;
>>>>>>  		gt->info.type = XE_GT_TYPE_MAIN;
>>>>>> -		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>>>>>> +		gt->info.engine_mask = graphics_desc->hw_engine_mask;
>>>>>>  		if (MEDIA_VER(xe) < 13 && media_desc)
>>>>>> -			gt->info.__engine_mask |= media_desc->hw_engine_mask;
>>>>>> +			gt->info.engine_mask |= media_desc->hw_engine_mask;
>>>>>>
>>>>>>  		if (MEDIA_VER(xe) < 13 || !media_desc)
>>>>>>  			continue;
>>>>>> @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>
>>>>>>  		gt = tile->media_gt;
>>>>>>  		gt->info.type = XE_GT_TYPE_MEDIA;
>>>>>> -		gt->info.__engine_mask = media_desc->hw_engine_mask;
>>>>>> +		gt->info.engine_mask = media_desc->hw_engine_mask;
>>>>>>  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>>>>>  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>>>>>>
>>>>>> --
>>>>>> 2.43.0
>>>>>>
