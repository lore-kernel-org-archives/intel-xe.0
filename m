Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12149CCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 15:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01A10E08A;
	Fri, 31 Oct 2025 15:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtGILF+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472CD10E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761925789; x=1793461789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E8EigHe3K0hZ8hQltUw3k+bFC+q/ais4NM/ZrMH1ezM=;
 b=LtGILF+L76FAByBhRxHQTlbTh18z3zMStRmTmqsZ9DOPqYkWmxHtlfsO
 yLh1w72vnFabn5PBNLRTkXl6O7O8bfixHrf1mHqgOgjdKuSJmX509jLtI
 9VF6gAF1vNZCPxC4Hj7b3c/ECjT4SkAVXPI+H8qNZ3oJB3i66uoFwtmB2
 +lbDmP0R4rF2XNtxbmpbf4MHuoKtpOUmZkgFJOgWleiDFCpobEDzFLGWm
 P09yamF44K0qkOOzjQshN6OK08MKuLLBHB2RrUjTKcbYJ1ap1uGOdcZL3
 8jFweHuDMSNQR9FJrNiOsp7DRDory8XlKyjVr2np66KD/FOog8FqVz17z w==;
X-CSE-ConnectionGUID: vsA9EC+cTpuiR2uL/ENngw==
X-CSE-MsgGUID: YoCLqjYdTFi1dQGPVS+gXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74380936"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="74380936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:49:49 -0700
X-CSE-ConnectionGUID: OWJztO8KQ7GbFZKhqBxC+Q==
X-CSE-MsgGUID: UtvnVzMnRnCkuwQGP0s8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186383692"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:49:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:49:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 08:49:48 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 08:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPtfqlbPq3RrseyRD7VEWEMDazJ/wlve6aAiiVE92SO+/4KzUoC7oKrcnVrc/3UAY3bY3Nl3QYuhK2KvL7OkbRS0Xxrcp+DnCstTDS7j054W4fWuP+3DlxRANtcJ8y2+oBqgRMeP+uDCwUTjOLTn6dR6QOFF3nLSMEly+K8F771pPPk7rUcu9dCskKd3U1D8BeFBkb5vuWueyxAMFIAm6bo1SUuXHc2/BNKgtNDa0kM5RVoQpkPrpzokBuKi3tB85Z5in6XhdCbyP+d6yGagX2qX4xr+/MjsSxDtl6zLhqykEMW3BijumS2YLLMdUznc8nv57GhpMLl4MAUoWlrAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhrW7TYaY8i7SFRuX5/qVyC+e1n3dgS+su9Vq+h2SRM=;
 b=MXAVm1vFLU0SVi2eS9AsbEEFPP8RS9epkbLpdIF3pZSKWDpkQ6H+77/LWCX8YOjwylEyc1+ZtHv5Hq+B3MaBFohNLUyFJh4/761QxGbZFRY2If6nv2RkvRJAfTpLcmbYkcWBZtZH7dB0sszSaNs2oLLSanBn2jl3BTUCP6NkyQDeoI4Er2QwpUF8kHkImQOe1wIpvJmZvXzKfYQZSNZm2Z2yhJHwDhaU+rH7XspztyyUI6Cl7LE/jeYvnr8hYxTdkkclw0PnZNOSUmduV/U+q/Mz4TeTD2WWr1JJ7+CMYCT7C6sQTzrQko29omq+nSARO3V/4+Rrs537V5FK7mJ2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 15:49:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 15:49:45 +0000
Date: Fri, 31 Oct 2025 08:49:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZ1bGw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe: Dump PAT entries with reserved mark (rev3)
Message-ID: <20251031154942.GJ2806654@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <176190867469.4698.4280991440003121344@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176190867469.4698.4280991440003121344@10055242dc62>
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d6b27a-0076-4b5b-cf66-08de18951d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l3is2fCCACnvztnTHmTAGFf46cY6UuK2vEgYg0v37s3E5xSecHn0YY3gOmy8?=
 =?us-ascii?Q?tYEDFaJslTpwFVAexftvPmSmf27e6XT8YF5AIAK8wl+cD3uGilJXHK+ctzDM?=
 =?us-ascii?Q?lO8OqxJ7jAWOi9q0eDTQf6pFJ+nB0zfKNUYu4NKlVwhETwMSn99wbnfy+2cv?=
 =?us-ascii?Q?TzayS9fhp2hRAdmGI4yEk2exR1myMxMFYcPuowBV4FkaI5B+9YsKAgwxg/Uu?=
 =?us-ascii?Q?UWfGRmPRSW87sfc4zJTh3Jcp8DstvFD/z1L2kxId1c3vNGKI/TkGaInyi8xE?=
 =?us-ascii?Q?MqzTjsBj3WWD+nr2VJNOvHXEutb8v1sqeAQNNalj9cUASZ7m2LB3vq5GNA6y?=
 =?us-ascii?Q?r9YmYUg6ZEqxMP2jhlCHulA59IUFd+VJA5Lm4D7n72fy6NnLFT+taeaRVHim?=
 =?us-ascii?Q?Eyb+xWYT4T6kEQBznRf53K6oXybGs+qtnzefRPXYM2/LbAdybAteUYK5Dnxm?=
 =?us-ascii?Q?lUzw1j/E9M9v4xFPUxQUb4Eb3rMuMKj8DQxIlwJxJn5eq5Xf0ClDvs77nAUA?=
 =?us-ascii?Q?G4KyzB4KSbUjdV3PqqMbfkaI39h0GPP/mNwJebOAog6d2Q6VFjRbhx0eCejv?=
 =?us-ascii?Q?wyIQb3/zqpZ0OAM1HB3MZpjMmUGNvVpD4nQSM9ec0koeLpozh+v17P0rzIXV?=
 =?us-ascii?Q?TG5mSo4xLfoZcsgRO0YqD1rjxRn3O9BUIU8YxAnm4VS212H8aF9DMC0PHD/R?=
 =?us-ascii?Q?x83HUJRea6HTHddKhLzghx0zG5upSbKOzsq4UXk4r3Bn3wiaqIoWdHwOBHgg?=
 =?us-ascii?Q?G2w7M/7d4z6jyHu0PN5EUaDe2Ehy7/A7oWrsGqpOAeLM33Vloyg4ohRx1S8r?=
 =?us-ascii?Q?9WMmwtJht/2/8PZby5+4qNBtkgVw1tUYNS6ftwLABgBE3i7dsHwrJXcOPJDz?=
 =?us-ascii?Q?yTpuakkwnzuxnv5ddxFL9v0fuJ0EYN0kiilAnlLWrinfB2vmUsxVvmCJDHpU?=
 =?us-ascii?Q?1q3tChpitBy/NMlH5/388KWbjDoTRW7/nP3rNpomh/hkxgvStGLeDcIddh7+?=
 =?us-ascii?Q?VRmri6T97Df+k9/zqsyDvvv7whajL2K3MYYg8fHEm2+2I8q+PTE0PLs5ee8P?=
 =?us-ascii?Q?mpHHFnGQgp67mXTt74mQhKaS72swsCsHE1a2PDbegGS9TzOUDtNE6dSMhhG3?=
 =?us-ascii?Q?145KH+RXEaKRUqTIZI4rooQ40zWqyfHU5Vm9gJaVbV6O+sCFR4h3ytqF5zxJ?=
 =?us-ascii?Q?OyHDW60kvhuUVpJrjrqc0ScYdMrlHRlZ31B18LYrrXT2FDMkqGHrlXsBPBq0?=
 =?us-ascii?Q?1EwDbIADInYNKzIO2mkq/5r4IW9jzoT+UYlK/Z223qnzE6/76XRPclGl+zv1?=
 =?us-ascii?Q?i/xuFziYi9iOhwRu+BXZVNX/skG4NPDjAgpGJr4sLrSAsw4za5YYig0wiXl1?=
 =?us-ascii?Q?hKl5T8VmiAut3BDeXs59uipB1AFBjjVtsjGW+zqMV3Ke3a6v7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Z6yyc7iS9iOmmhW51f+Pgdz59M5aR5Bv1+ceEc/c1Z+PmLH8h7liUO6mPhN?=
 =?us-ascii?Q?fWWvDEsVEZ1wUwJCc989+A/2e+pA4B46sgt4qiwouEUOcw1e0BpDRSC5j7kb?=
 =?us-ascii?Q?csvYQywGsWvSCHHEkZvh8jQlXHRCW2FmECjoczZHnPxsOvgPUOcjDKKy2w/I?=
 =?us-ascii?Q?7EKAZUphR2b9nQAEQV9ZsikP3ZdbPYpig1g5JUUE0Vb/0GWARxcsHw/etl2M?=
 =?us-ascii?Q?neFInF7+OZHtJbx2BOCN0Wj+7dt4J1YgEUwl15XaBrmpILvEImOSLL9pE3zk?=
 =?us-ascii?Q?aS75z28ftqhjugRwp3xGLM28hLa4ok99W7cn4unEY478y0JoS/tdUD346+8p?=
 =?us-ascii?Q?wteciSEOBsB1pyo4RFtGKO0u6vbj/bv0dBaIid1ztfDy5NJkwmbskc30msk3?=
 =?us-ascii?Q?MtvwxonFIZqYdHhxzbNeLy7RkHhp8VvIp+Topa+g0lWFJ8V7sQmllPDfoGZS?=
 =?us-ascii?Q?BjMwtExBHt5XpVf0Jx5nLSspEUbKGIut4Zdt0xPeZr6zHV6DmVHq/8+9Hehp?=
 =?us-ascii?Q?2EMp0eOc0k6tgzSADWRH+hSKzd9nSpD2E3MAL4U/j7QDjXF3KSqVyivbr03H?=
 =?us-ascii?Q?VgMHU56Nduu4wrSWKGneAWDVy1wuQ5d6bQ5xpKnFI8IswJRxf3gI9JgF8/0w?=
 =?us-ascii?Q?sqEMnlcBrep8mudWzPpzO/dl50ACfOizxrxB5D8nBVi+evz6ba/OvdmioTz3?=
 =?us-ascii?Q?6V0pu19ifbZhKCeH2mE2Qp/5KK3cqiQfLgGDG5Vliq/g065BzAVTKiDqtA0v?=
 =?us-ascii?Q?c0U/nBx8V0KOY6VwkyC++tOsbnbzghG//cTmh915RwH6Hqg9HiQ/42ATOETu?=
 =?us-ascii?Q?/E3nIxl2snr/ZoFMzt2a0RI4DWHiRgdJa5QD+45lV7Uq0mW1fT7L9xVP/CS5?=
 =?us-ascii?Q?xV+6z87TxaVDhFImSwY5z1FvggZJ0tbPR7zQlAznOpeFEyY5tJrjpdcbv12o?=
 =?us-ascii?Q?pp+pMjKfdRPEsqUnBd5UkYRjitiO5voIsIcHgSP5NVHdgNvUeV5SVeibzi01?=
 =?us-ascii?Q?1XailCbhAfH0OBtHvihHrnOtkYmu4jvelwtc19nynp/EvkUrva3xuBR9hGHi?=
 =?us-ascii?Q?opK65NgtTEdu4FcU/o9mE/E+muOSoVzS9ggKPiX8BphilotBQ7e6NJOzY9Yk?=
 =?us-ascii?Q?GnecGfE7yMI7HuK6D2yHSbPMSWlyw6PVIWZcEQ0N9yonAC8NQTcm1ugiDMdx?=
 =?us-ascii?Q?ukfGGTsLGuMIaFGQOXjmDA4EJeilyFU3suflkvgEP9lg8F7Ofh35MooquAfY?=
 =?us-ascii?Q?vUg2KLzCBMX4G3vfh8yHAPDlyoZcLJ11mRvEmkJX0Zwkca33izrc66LR+A0k?=
 =?us-ascii?Q?AHUvcRuwG42T08GjF6I9T7sr/Yq7qVOmTeW8P2TVV2Zb4UxpSJh9J60cxxlY?=
 =?us-ascii?Q?uhl2HuIjd/vAgrsjPm6ZG8E7i+v21rWsWGSdjJeSjbI9fmvjdUNsplbPC6kg?=
 =?us-ascii?Q?6deliV9Bze563F5h1RUk5EDWoYDHu9Sp0FMnAsBWPHrF+4B0vSQiqy6rkDDJ?=
 =?us-ascii?Q?8u5W4sA4PKN6QtWIuRxszMq0pIL6dq22W+ZiCURRBSUKdT7f5O5sczU3ihhx?=
 =?us-ascii?Q?1tofKxQJ+qcdvgSv9Fy0ucqfVW3OdAD+jsMLWeYucITffSPaqi+r1KlvweLX?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d6b27a-0076-4b5b-cf66-08de18951d18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 15:49:45.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEPZuz97WFz6dKo+TAhQ/IZpX0JOMkzHXRIg2ju1F2RvjhycejiSmYSh7edGjcPtDubneztKoVGQcjykgYhDtS4VpcSZdXtd/l2zgietU5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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

On Fri, Oct 31, 2025 at 11:04:34AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Dump PAT entries with reserved mark (rev3)
> URL   : https://patchwork.freedesktop.org/series/156380/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641_FULL -> xe-pw-156380v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156380v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#316])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2314] / [Intel XE#2894])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#787]) +20 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2907])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#6014])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#373]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_color@ctm-negative:
>     - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-1/igt@kms_color@ctm-negative.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-1/igt@kms_color@ctm-negative.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#308])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2321])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2291])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#5428])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2372])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_feature_discovery@chamelium.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#701])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2316]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#301])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#4543]) +4 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-9/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +9 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2311])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2312]) +6 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5390])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#658])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#651]) +7 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#653]) +9 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2313]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2925])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2486])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2393])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#908])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5750])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-9/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4837]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#6321])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2322]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#288]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#4837]) +4 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
> 
>   * igt@xe_exec_system_allocator@process-many-free-race-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4915]) +99 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@xe_exec_system_allocator@process-many-free-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#4943])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#3099]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#3573]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#2284] / [Intel XE#366])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2284])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4650]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#4819]) +1 other test fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-464/igt@xe_pmu@gt-frequency.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-432/igt@xe_pmu@gt-frequency.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#944])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-434/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_sriov_vram@vf-access-after-resize-down:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#6318])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-435/igt@xe_sriov_vram@vf-access-after-resize-down.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][70] ([Intel XE#4543]) -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][72] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][74] ([Intel XE#3862]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          [SKIP][76] ([Intel XE#2291]) -> [PASS][77] +2 other tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [FAIL][78] ([Intel XE#1475]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          [SKIP][80] ([Intel XE#1340]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [SKIP][82] ([Intel XE#2316]) -> [PASS][83] +5 other tests pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-adlp:         [DMESG-WARN][84] ([Intel XE#4543]) -> [PASS][85] +8 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][86] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [INCOMPLETE][88] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][89] +1 other test pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>     - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [SKIP][92] ([Intel XE#1503]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_hdr@static-toggle.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-7/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][95] +3 other tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [SKIP][96] ([Intel XE#2571]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][98] ([Intel XE#6321]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [DMESG-WARN][100] ([Intel XE#3876]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][103] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [FAIL][104] ([Intel XE#1178]) -> [SKIP][105] ([Intel XE#2341])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][106] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][107] ([Intel XE#301])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][108] ([Intel XE#2311]) -> [SKIP][109] ([Intel XE#2312]) +10 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][110] ([Intel XE#2312]) -> [SKIP][111] ([Intel XE#5390]) +7 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][112] ([Intel XE#5390]) -> [SKIP][113] ([Intel XE#2312]) +4 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][114] ([Intel XE#2312]) -> [SKIP][115] ([Intel XE#2311]) +9 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][116] ([Intel XE#2313]) -> [SKIP][117] ([Intel XE#2312]) +8 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][118] ([Intel XE#2312]) -> [SKIP][119] ([Intel XE#2313]) +10 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][120] ([Intel XE#2509]) -> [SKIP][121] ([Intel XE#2426])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
>   [Intel XE#5750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5750
>   [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6318
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641 -> xe-pw-156380v3
> 
>   IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4016-b50629a75c6ecb269adbba8de7b8ab4c9a650641: b50629a75c6ecb269adbba8de7b8ab4c9a650641
>   xe-pw-156380v3: 156380v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156380v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
