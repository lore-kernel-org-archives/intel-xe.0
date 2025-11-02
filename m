Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE119CCFA02
	for <intel-xe@archiver.kernel.org>; Sun,  2 Nov 2025 18:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB08510E002;
	Sun,  2 Nov 2025 18:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKbIXuPS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0B410E002
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Nov 2025 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762107763; x=1793643763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=onYX2ZadiEhLtthXkFaenMYLiRkL4ruKwyBKSRLf30M=;
 b=kKbIXuPS5l5Minw/RLXOAPd3hvaWbdkFweyXd++lg2/6ScrB+xBF6Clj
 pYLGufrFrPXOL6o9Qcw6azxOjFhBvlO4Hp28OdclqThRp31Z6volrHal7
 ekMg3kQuCoUB1flUMXKbQUaH1LHRp82srGmXl4YwKxMmdzxtjOpYxOw7o
 iabk9QazLWlVpkV5ZZLBMta0nv9bnItoREki8GBllSJzqaCQKp8Lk4YnS
 uxk8sMsCfyleDOO6fUQ8JbNaczmF2Ad3sYmRvdSDEZZGv0XGIw+vJMYFh
 Y3s9xiez1/BT+SoSpLO2mCMykXLSxgfhHkJP+j6WniA449k5KUX2wa4hu w==;
X-CSE-ConnectionGUID: m9YEzYK8TAarxJJjaxohow==
X-CSE-MsgGUID: 7HRKvxjxS/qgNw4lbvMZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="51765961"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="51765961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:22:43 -0800
X-CSE-ConnectionGUID: 801p8bwcRfKCoY/FbQ2lhg==
X-CSE-MsgGUID: GetNcWNrRqeVbeuy3CYvvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; d="scan'208";a="223926627"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 10:22:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:22:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 10:22:42 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 10:22:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otBK8dJ6BT+r4yJkECdJ0Ux5f3YI+aB35PB6Oj5AZOsUK4nBPH+vUfoM3OKvNNrW621VpEAk63xNEexHW5O8Mgt9lvxCi8b4p+FD3Mx0LZeUNzHJQhDfTvhbIQpNBmspqiO9u4tdL7/1jgmdOG+VtFtrMvl3UE8RdCkPX3g4YD9SIX+PbS0HA0msE6eqjN/pXj5y9U/pSkiYnu0MLwtsYTPTjbmNfSKgUXqTwLZYEb/flOb+MUGeC7NoC1xKhXQ0/PBx+j3plDSrK5d5PzDuFB6vZrZyBQ4bIh2nMoEYPmEOft9zHyjMsf1G9vzpW1QzgyyxLGfqbnAnC8Da42Qmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRIqYjn07wyf8HoRouy7T+NTvqn0E4DXSZRmVcngwuM=;
 b=Ip90Yvkh0lgy9ZtCPa86S7FvxZtO2Rfp/TqPDj8RB0M2h+VVIla6eeESU7KC3+fw0QLAyNJb9cphm7oDAnIRqK7X92NEpDGmXL3i7I0vGsJ42h0oUGK1nCJ1E6rYS6+hDHPVBBYDYvEGVrczA9EqVPKFs34UDqnBs7Kvs3XSiCXctyW2pyPZgNSz1P+o/EAUMi5nXp0xb2l1Xyw5+7s6QV7YILN2tqlgytez9pLE7S2YHuftCdTwoPkI9CLrxHtkXrohI/yxcdkpMv7BEZqYkjJs4/Zwp+sS5qqLV3A447UrRGQuOlmZIPlwafm9Rh3axhMglVXvjo5Bu/d/9I13CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sun, 2 Nov
 2025 18:22:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9275.011; Sun, 2 Nov 2025
 18:22:39 +0000
Date: Sun, 2 Nov 2025 10:22:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/16] drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi
 Queue batches
Message-ID: <aQehbGWOY67EVOC2@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-11-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-11-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c8cb1a7-1b87-49ea-364c-08de1a3cce59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y7MsAYppMqkbmKlHWVMFkDZ5UNFUq947bDbsAUAyiQOYM41kNCNob7y1fmLc?=
 =?us-ascii?Q?bQU5nIGRJxcgpDf84ozl+ux7nf5YQ2Yj1obaQkFSsMumuOGWoOk50wBpwV/u?=
 =?us-ascii?Q?XQclUHHeB2DJawNr35m0GGjJsaDDzsZrsI3mAPGJxdLJRU84a1ZswsUdeyf0?=
 =?us-ascii?Q?K0wjvvb5zcLhFKQzjCGHp3SRG1G+SQJVzYZpycEE+zVKHZGlF+dsIUswBG1j?=
 =?us-ascii?Q?jCuDKeF/4ivsH4Lvf8ik9upUt67QkYM/DRZt/aXqB3Gn2sDyOFUOTRPFOEAI?=
 =?us-ascii?Q?/KCvdO+wzUoj30N4gr/MrqdZdw0SyvtF0oP+3GCwKZeQ8EXVgpMZF9en4BZy?=
 =?us-ascii?Q?PDdUFsJlw+KSlI7wjhM+ewrCT7gXQMPml962Y7B9rgWf4IudpK6m5XXto6RV?=
 =?us-ascii?Q?cSuthgBb/jHGaaixLUeCqRYigPK9IOy+GjHFrPmK36ryCOLIfFnfieAhyeuC?=
 =?us-ascii?Q?xHwMIvy+8HaBvtegPP0SSgmdmKxMWRQtWm3qNvZjIhW+At5L9kl4NJnQCLA3?=
 =?us-ascii?Q?Z8cGrXt4en2Zr5AgUTsfzKu4q72+oUPOdI84Djzi1ebKLnqGioHg58O+UpIE?=
 =?us-ascii?Q?Xvxl06p3h9ch1A+yuPZ/jtLYOJnlwS6LMjk6QEGWsn5eZVSNP2nTrWz1Fhnl?=
 =?us-ascii?Q?Kg1j4iJqtO8eG3wY/q5HGEvM0YCTuxGiSgMaRfrgBIvxu7VCkqtRMo4696DJ?=
 =?us-ascii?Q?dG+K1Q2LufCtnbsmsp4cEyiQi9D9QFi64mzTsla2OpuJY6HQ3G8UDviQGqup?=
 =?us-ascii?Q?Gf+6Sp58y6Wmt4eR9n1f6pct6yqWsdJGTGUEiYcv/y2DYHxVe3QrI1ZkFqIJ?=
 =?us-ascii?Q?xOVmA6rmh+s0g71mEB8XtelIHoOeLI+vIp3K91LJ0l0mO/nEaPdi0VBQF5ml?=
 =?us-ascii?Q?mzUlMilGoy6E4t9vpd0ADaOMJZJFnOFlVkaPxui4WK3azarjoOoZZ1X/Klk0?=
 =?us-ascii?Q?H56jOXBbk4kEix3CZxQiOqgfnQxB4rbqWkDAPb00W/Ku9OjUqb9i0ZQuct0D?=
 =?us-ascii?Q?NXpN4IHhbfpNB2j1+xajZBxMOc2HMj+sZgvkpsAQsAiXU6l6x9UztElSW/U9?=
 =?us-ascii?Q?JwtE0RYg2IKM3kKCYIsr+pUns2w8cVjRLYIoTWyyWZ3hfVTH0XyfwyhQJAS9?=
 =?us-ascii?Q?U5YaN2T1dxlAJ811UvusWaWI5bS6PVkYai3ZX86Co3GWAa/bRpZoOv552W0Z?=
 =?us-ascii?Q?pc9Np4lPj+8xIOJ23z0ocMzEj8s30a975PHmT0qm6FgZrTcFJoJqjAQfyc54?=
 =?us-ascii?Q?m3HRq5Z2smm2/klpe/JBBWRPmDMByBpaGAGVHvprjJDlDZnZg78WGCRCR49t?=
 =?us-ascii?Q?dTFV4H6Vw1KmVe/EBJ9PoKqwyWZ8Emr8lIka8Iz4djWiAP37H+KdYhKwXS8M?=
 =?us-ascii?Q?B02qb6tdW+NorSt7/iZWjQuwVh2OPOIZgRGvM0sov8tZrlo4Ma7FW7czScyu?=
 =?us-ascii?Q?+gI8rkifppq0mOS2S/R2NjgtufuzrixK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?agQFvm2alTgjIwHRtzEk4Jsh1zCrIOH+UC9tWsfGq9bdQMR0c2OXN4GKk1l+?=
 =?us-ascii?Q?5UDl9qSvUT49114JUuJWFNV7UzQD3hPCE3oIxjZxhYrYk2Jn/KCRczqPgufU?=
 =?us-ascii?Q?zzgk+lMkcSIb1gKhHix0RXSg8uEh+uxHh1tYlSlPJDAzfBhYxe15Dw7ZrcS/?=
 =?us-ascii?Q?u5vu4J3+EF9xMOND/KIIWphTukco3L1/4m3ridFeV89KRgTUju2Va+Det/Kf?=
 =?us-ascii?Q?sGbJ3uODoQlwmdEpDohb5y5UjYiMpP23qPujfFoX4hRBAETwduZaAJg0mrDY?=
 =?us-ascii?Q?bkL1y1FUeRA2mR3yJlCRtPDluh2HDWnLikh6ZULcM5LkIo6HB3dPsTluKKxC?=
 =?us-ascii?Q?JOhTzYq2ikZc+QdnoTDisxgCzNURzfBv1Am04eze1REVSfkJBIsPz2T5rI6C?=
 =?us-ascii?Q?xX3HcYrWdCVIwFpc5vBbCpc03eLo3NInClvLeiHkgboZ1MrfC3e2wWngfFtT?=
 =?us-ascii?Q?SH0NNPOCR15igTe+O5KI+R9zSxpaU98TF2npCFHN9l4EHpi5/lMJvdrz+Spn?=
 =?us-ascii?Q?NQ7pVOJ4tx75fTbPyJqpOwpDIAUazMxuHXw30JraiajMuzsz++E/7Ue3eAi8?=
 =?us-ascii?Q?vARDwEqoXNIKSyGO4vMC2GR7NJR0UI25sRO4AczOPuixC2Rn/stqqAeTQ4Yq?=
 =?us-ascii?Q?ytaZ29lC7V7mE1PYCX/ZUTklZ25+fB3XZkQPEw+cH1XnDY/bWHISIOn4M4d9?=
 =?us-ascii?Q?LvMYXKozGocnvSc4OOr721seA5S3qA3iUR5ydwGRsgptxpMQ0xYuhjI3XYMq?=
 =?us-ascii?Q?Pa9tOsbI+n4lf2nDaWMksQTN1g0CafvkrglAcM5VHctmQQa6pyGb/0pnZUSP?=
 =?us-ascii?Q?sef041Ns7wkaFdGddhQC3AiKFVGXPfsLew2hs2ksVrN+Yoo+6KjGEKlwX0mk?=
 =?us-ascii?Q?YvFxixp+uLIyeFZEucKM/zbKkmBGQM/S75b1aV5/qHsyCwPoAktllya4ku9d?=
 =?us-ascii?Q?nbOwIm9AOs8AIA2q2HjEb4kqBXHe+iKdtyNiHdoCpwsUdh74lDJWFxQ+Hyat?=
 =?us-ascii?Q?9GsZVUVcjzEm8QTdiz5l4ipLIABJx/U4s06VrB8+2BvO+YGFGHg0Sipnb0Fn?=
 =?us-ascii?Q?5HsiRlvX4Zf0XmVJJ5WkWdBVFZ7N4Aa4WEmo33burV0qWAQHH4XuEoThJ9WY?=
 =?us-ascii?Q?LUSth3aeh4CPVpqj/I8Wf95vQ3RtjEkWi4soVPrgIoysQQOhfja5HDw0IpTw?=
 =?us-ascii?Q?oX2WvGarqzFsoqimQw3x+fADQJlr8JfSq4sj2wgsUfOWYz7DvFyfWrMs7uEX?=
 =?us-ascii?Q?wITEphdV5i18Vsi8tEGFi020YIUwaN+k28iLMgRXdZi0ao+7zaqzScT/pjZw?=
 =?us-ascii?Q?LXKFpnoBizkzsnd4MUIjj6HBCBFAVcYE/APjkLGO/lEQoWYYS4kYcZOGBqn5?=
 =?us-ascii?Q?7I0mfwiv/rtPOccO3evsUbu8vNzKGOQqbb1kjliFf0hfCfxfNkGJlLw2jVTj?=
 =?us-ascii?Q?42yk8c81TipczDHV6i32F28kPh1dWyvQX5SjtGHLmfTPGmYeR3KQh+jE25Kv?=
 =?us-ascii?Q?trSq5zUaaMPCDbhqtGZP0Y2NogF4/k1njFFo/EaGKffK60KJqdjKDFGuHR/P?=
 =?us-ascii?Q?aXW6WKuAsk7nh8k4PVzDxTv572SSa+r7UxYOBduv4dPjA+mTBQ6hHHBJ7u4Z?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8cb1a7-1b87-49ea-364c-08de1a3cce59
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 18:22:39.7497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuEcZrX0xmcpOFr7dcB8os6YPV9qVsFqU8PMg8SxVf3eOoT/D2Gy6vTxiZgUR04A2RZgiu5jvn/66SO2zMvvVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
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

On Fri, Oct 31, 2025 at 11:29:30AM -0700, Niranjana Vishwanathapura wrote:
> To properly support soft light restore between batches
> being arbitrated at the CFEG, PIPE_CONTROL instructions
> have a new bit in the first DW, QUEUE_DRAIN_MODE. When
> set, this indicates to the CFEG that it should only
> drain the current queue.
> 
> Additionally we no longer want to set the CS_STALL bit
> for these multi queue queues as this causes the entire
> pipeline to stall waiting for completion of the prior
> batch, preventing this soft light restore from occurring
> between queues in a queue group.
> 

Bspec: <number>

This will help in the review.

Matt

> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c              | 68 ++++++++++++-------
>  2 files changed, 45 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 5d41ca297447..885fcf211e6d 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -47,6 +47,7 @@
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  
> +#define   PIPE_CONTROL0_QUEUE_DRAIN_MODE		BIT(12)
>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index ac0c6dcffe15..71f0e19fe8ba 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -12,7 +12,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
> -#include "xe_exec_queue_types.h"
> +#include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -135,12 +135,11 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>  	return i;
>  }
>  
> -static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> -				int i)
> +static int emit_pipe_invalidate(struct xe_exec_queue *q, u32 mask_flags,
> +				bool invalidate_tlb, u32 *dw, int i)
>  {
>  	u32 flags0 = 0;
> -	u32 flags1 = PIPE_CONTROL_CS_STALL |
> -		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> +	u32 flags1 = PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>  		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
>  		PIPE_CONTROL_VF_CACHE_INVALIDATE |
> @@ -152,6 +151,11 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  	if (invalidate_tlb)
>  		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
>  
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
> +
>  	flags1 &= ~mask_flags;
>  
>  	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
> @@ -175,54 +179,70 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  
>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  {
> -	struct xe_gt *gt = job->q->gt;
> +	struct xe_exec_queue *q = job->q;
> +	struct xe_gt *gt = q->gt;
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> -	u32 flags;
> +	u32 flags0, flags1;
>  
>  	if (XE_GT_WA(gt, 14016712196))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  
> -	flags = (PIPE_CONTROL_CS_STALL |
> -		 PIPE_CONTROL_TILE_CACHE_FLUSH |
> +	flags0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
> +	flags1 = (PIPE_CONTROL_TILE_CACHE_FLUSH |
>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
>  		 PIPE_CONTROL_DEPTH_CACHE_FLUSH |
>  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
>  		 PIPE_CONTROL_FLUSH_ENABLE);
>  
>  	if (XE_GT_WA(gt, 1409600907))
> -		flags |= PIPE_CONTROL_DEPTH_STALL;
> +		flags1 |= PIPE_CONTROL_DEPTH_STALL;
>  
>  	if (lacks_render)
> -		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		flags1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
> -		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +		flags1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
>  
> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> +	return emit_pipe_control(dw, i, flags0, flags1, 0, 0);
>  }
>  
> -static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> +static int emit_pipe_control_to_ring_end(struct xe_exec_queue *q, u32 *dw, int i)
>  {
> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_LRI_POST_SYNC;
> +	struct xe_hw_engine *hwe = q->hwe;
> +
>  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return i;
>  
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +
>  	if (XE_GT_WA(hwe->gt, 16020292621))
> -		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
> +		i = emit_pipe_control(dw, i, flags0, flags1,
>  				      RING_NOPID(hwe->mmio_base).addr, 0);
>  
>  	return i;
>  }
>  
> -static int emit_pipe_imm_ggtt(u32 addr, u32 value, bool stall_only, u32 *dw,
> -			      int i)
> +static int emit_pipe_imm_ggtt(struct xe_exec_queue *q, u32 addr, u32 value,
> +			      bool stall_only, u32 *dw, int i)
>  {
> -	u32 flags = PIPE_CONTROL_CS_STALL | PIPE_CONTROL_GLOBAL_GTT_IVB |
> -		    PIPE_CONTROL_QW_WRITE;
> +	u32 flags0 = 0, flags1 = PIPE_CONTROL_GLOBAL_GTT_IVB | PIPE_CONTROL_QW_WRITE;
>  
>  	if (!stall_only)
> -		flags |= PIPE_CONTROL_FLUSH_ENABLE;
> +		flags1 |= PIPE_CONTROL_FLUSH_ENABLE;
> +
> +	if (xe_exec_queue_is_multi_queue(q))
> +		flags0 |= PIPE_CONTROL0_QUEUE_DRAIN_MODE;
> +	else
> +		flags1 |= PIPE_CONTROL_CS_STALL;
>  
> -	return emit_pipe_control(dw, i, 0, flags, addr, value);
> +	return emit_pipe_control(dw, i, flags0, flags1, addr, value);
>  }
>  
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
> @@ -371,7 +391,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
> -	i = emit_pipe_invalidate(mask_flags, job->ring_ops_flush_tlb, dw, i);
> +	i = emit_pipe_invalidate(job->q, mask_flags, job->ring_ops_flush_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> @@ -391,11 +411,11 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_pipe_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
> +	i = emit_pipe_imm_ggtt(job->q, xe_lrc_seqno_ggtt_addr(lrc), seqno, lacks_render, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> -	i = emit_pipe_control_to_ring_end(job->q->hwe, dw, i);
> +	i = emit_pipe_control_to_ring_end(job->q, dw, i);
>  
>  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
>  
> -- 
> 2.43.0
> 
