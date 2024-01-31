Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD289C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 16:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB5010FB3F;
	Wed, 31 Jan 2024 16:14:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BEA10FB3F
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706717685; x=1738253685;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=+kLPT32KpWhSUnWhOVLMyMn940fkPNBXKQ2mvGOzTEI=;
 b=cKCQIU3ctCWyPbkCDwLWEkU6/WHZT6i93FAh4Oge7k4pn0lZbTkLa91Q
 Z9U7bRNqX4uGXd1EdfvQj3GL3Qclnyp72dagH8vLYpISnFTaYDKxovrYZ
 z55cKOnsE/SlYW3SlkgM/EXF9n6g2VtHfNyTMqNHB5fAYobFbevSN/KuV
 dAr04bYhxMapvMkLO6UfxDSD8qzDsIAtSR1uIzObojrC9NGXRl1KZv2ZB
 77UECYzrR9f5hH23E37/ZqM+omnXdGkjkzne5Zg9WW86tqaIqeQ135J6G
 2fhtWkW0QEoH9Z4L4+B+QosTt+ssLuJfS3tBZEL/qbbXJcEj6dZ5Oopvx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10283288"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10283288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 08:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788629934"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="788629934"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 08:14:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 08:14:42 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 08:14:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 08:14:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 08:13:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPYx8Er66t/n1cwFLfOhxjZk5EbmRyWIWe4q4ArzcszlN3bAs+2Tayqgw4tUcInVJKk2QXe7UwF1GJH+WsJo32sWrrG4vymADWRrg9WL2qTVGgKw+tuwdYwNXsBxXhMaWGMUJemjIst1ojUttRdeJw9TRpXA8ssL4N5ILThpzrb15TfmhmXlK2mEfHpdDNHNQZgFkbT84bhUcbIXAIV03VOKKPwPt+bhPqIn1J+Dia/b/ykZvIqi1OVxkWWU/r0oW9BElM/n87fBvmKO5Vm+cpGvJEpqGAQ7pCMwbe6Fn5PotsSUaEIQlW0QevUmS+XNGSUooTyMqDAuYQezfMeRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNlitQqlXu+6XiE9qleacMW/zBvMzhjm50NgPpUV9z0=;
 b=epv4VyDrx7/04ecEglB+7LkrUS9XbNVASJitePAHBPo1onmyrqby9Zk6borKc/KXEteI8w84982wb8hQt9WnUAeR5Pf9gS0p0l5Thaz0SSJQbzhp2/6oFvlAUdF6c88+fcDqwSC1fDPRulV7o3gLKhO8haNfZews1naWzoBTDJddsHjSsHaVgqEofRf1ThCdXiDmPFE7dlqB3UET0GX+/BM+Ul89MVZ9850pIRMCt9c+eA7lxpJzKUytVS3cDA//GpiT4mkTExzNCln4OHu76FRmJ/kB+v2O2k5yVsx8FvHyhcjqZXwZoC0WjSExmO5nEFvgtiM+RapSG8fP1OzTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 16:13:38 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 16:13:38 +0000
Date: Wed, 31 Jan 2024 08:13:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2Vz?= =?utf-8?Q?s?= for drm/xe:
 Convert job timeouts from assert to warning
Message-ID: <20240131161336.GA5347@mdroper-desk1.amr.corp.intel.com>
References: <20240130200308.1429134-2-matthew.d.roper@intel.com>
 <170667346230.860255.10511165692934140739@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170667346230.860255.10511165692934140739@5338d5abeb45>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bd80c8-f8ca-47a0-02bf-08dc22779559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W6FAIG6wBiaecxBtMXNXQg4ef5RYEwMI0D10OKBokOuDWN/AAVsSSzCMnhepTGN645CjoU+vgfbzENK3mZTCj6A0Xd9oG459S2/5MiTprj3XO36p+M/zo0ee/miPFEbttbL+lKOufaUmMK5fqHSI7TyHZ4CwNuSwyqwzO54xxZ3UFiHQdQfu/eYz+NP7Vhi7r+qQb0KercwoCfYSx/2+qOEdIh2aeETg8KgbHNVLinZCHRYKr3P55JPk93ulFgw+KejQR1/cTYnl2RLgaTvgi5K16rPTNCetIsvPBurjz4zP7wEzuY4H0P6/oDGvjG8MdsUqi1DKdPto595CR0YVpLWhkXjf2ae32xRMcHAZhhA0n1+xdFugiUB9jWsCQpnT2JR5x+y5yP/xt/o4yBLSqLa61mnoIOrsaSf0vG8/72agQcCER82Kjxe3rzXsEOikc7nibh1YNjAS66+TeHcB7ZSwhphkqPXVrAyRO3y+SM5obicpc0wCOFRCh8Zv4fsH5MKM9jZ+AxJzcZYaVTnLTC9y16nxBKv2V/nEqQPuwnq8OOgo2FqgAumcUk1fkhHHtkuXOJrXX4gm5Q01byzCnO40aKljBH50YoGrDpUF2XcuyfU8xGqaszoASCHDY5ZoSWZlvMHwwh2GFDo9CVv4SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(26005)(6486002)(966005)(316002)(8936002)(33656002)(5660300002)(86362001)(2906002)(66946007)(66556008)(66476007)(6916009)(38100700002)(82960400001)(6506007)(6512007)(478600001)(83380400001)(1076003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PK6QYxwG8VC4KeWOiIQQznoQjZHjUAr5Jwv/spFenMJN4f8rNs2GHjiRf727?=
 =?us-ascii?Q?1WQDpeAk+P6o1cfUKUVRk2rv2nXTDvTh/yNpppLbFZSjYpkDJsnlIen9YycH?=
 =?us-ascii?Q?SGCtALmUn+aipLy1ur8MBdY+ik2oWnthdj98vod7j3ksjcwRVaqAdbiPB/oc?=
 =?us-ascii?Q?R50BFrYNshWas5zU19gF4r+cLnSiFNepjYx6ha7q0Br43NhsmBiiv6H1OjGC?=
 =?us-ascii?Q?ns3ZrSK66iTCDzh4bSzdK7uvOl9DGZEeToItGjpOBTBpyABqdy3/tU8CSiu4?=
 =?us-ascii?Q?xRSmkrzx+sPJ4FNj/6qDbiQYxe7s0j6QIhOBeCZvglS4I3qR/1OLyFjDN7id?=
 =?us-ascii?Q?v2J/xJ9AC77XwhdrA8XkPf+7f51gJ6EQbIeEuAhVgF+lQi1qg2Q26A8UGw4C?=
 =?us-ascii?Q?JodKXtwY3/yvohU6NQLgBF5gbCbv68uRnJrfcRPgTb+NuLdmWt7V6YbD3gKW?=
 =?us-ascii?Q?YDHUk0ycb4FxDe72h5oIutgN1u/8OL+I1NvG1aKu4s2bKVFhcCiarl9FeV7Q?=
 =?us-ascii?Q?o5ZL8620k3QaSD/f0DqUyL5xKA8RANaKKRrFgPMgyq52NY7wu35AkscFG++P?=
 =?us-ascii?Q?UrhHS36jjlChwynhqlFhWz3liFeAF54tVBVwcaR1IkROqBdEFkllJDzHU2X+?=
 =?us-ascii?Q?oDWhCXxnI76KcIcCZdLZXQIcfek/mSTb7+tOF/ocbTzuoVRyRNe1smVLjCLR?=
 =?us-ascii?Q?SCCQcWGLhp5UG5gdQrjU2vB9JcxilnBD0sI5ZqaDYOU/LeZHRaYq/2tiWpfk?=
 =?us-ascii?Q?eTUFG9CU+eR8hF51f51rsGZ9UoLsNpg2AnM2Ujtf5irHXhqUEzIT02+xu19v?=
 =?us-ascii?Q?poeJSKJFkFtpuPEZ//hx50YH3D/ZiiRFHk0pQ8bKf0Uo1XeSd78nzLuH8fpL?=
 =?us-ascii?Q?sIbl6ntBTUsMf+wiycPSqmkLQmfOVENRqrMoYr8cU/k20WZaOJbnWnnXmJ/c?=
 =?us-ascii?Q?PybQ5g1rrpJSphACwO/x2sAAexeg3x7GcR9FBbqXWPRHQZ3XmZLAJ6qfbA1H?=
 =?us-ascii?Q?xtiOTndATSC1J08Fglj6Um3+Y10xldzJLT1kmzl8ZjiWEIZhWvWdgt/HuPLr?=
 =?us-ascii?Q?1uUUruGUhabQR62V7V6JM8dOfgLmzue22ruLdOY+63hSk23f047gHu6g2xgM?=
 =?us-ascii?Q?WmJ3WqQjltrshNBjO5H2VFWOYAYP3sb/C2/12zX+7Vn9qTUOH7ywb4wlh2or?=
 =?us-ascii?Q?/pqjwNHAXMTSVxUJtgGEMsJXznwXjlS63wTacjStTxhDXMVvN9OONI3OxdPo?=
 =?us-ascii?Q?fF94PFEdt1tGUewT2wQSbggqBftTeWBcXYUsHJLFncsKEuD5yD5/N4YQ634n?=
 =?us-ascii?Q?UtU5Omw55ouBBt8Tl7LEkYl/PXzD+HxuEFittmnuJaFbtjZoK82zb9MaV8FS?=
 =?us-ascii?Q?Cq8r7yTlL3AkBOkCCsMN5tXD30QYbkA3eAi4HVjgTqRz1Mq4QfrxYcTxwzjB?=
 =?us-ascii?Q?zY6tpRt1BUG6DaW+T31BMVIRKDY9ougvlkqu8NjJPYSEjLdH3bYC9TeuH4ou?=
 =?us-ascii?Q?BTzx6vtrgNBDfLJttiQBzShksw0jwSjE2mul3NK6VqQ3BZtfo9FAjTJaXLiE?=
 =?us-ascii?Q?9/I7hTMbb5NhnRQaSEkshbv370qihi8DoJWZ7Qbcb64mrrIfRnsbPYiQY5fq?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bd80c8-f8ca-47a0-02bf-08dc22779559
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 16:13:38.3395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJCVk7EKDRFQ/SzkNtznD3uVKf6vMx4QxjInATdeHxPKcBWn5ydHNa5A93C8tx6YkLFk2vVKx26Z5T9Kl3x1RbM4r+L5dLFnHsY73FWLZIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

On Wed, Jan 31, 2024 at 03:57:42AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Convert job timeouts from assert to warning
> URL   : https://patchwork.freedesktop.org/series/129338/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101_BAT -> xe-pw-129338v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks MattB for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-129338v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@twice-basic:
>     - bat-atsm-2:         [SKIP][1] ([Intel XE#288]) -> [SKIP][2] ([Intel XE#1130])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129338v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-basic.html
> 
>   
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101 -> xe-pw-129338v1
> 
>   IGT_7699: 7699
>   xe-705-3d244fce99b65e012c4409d8a22bb9168c41f101: 3d244fce99b65e012c4409d8a22bb9168c41f101
>   xe-pw-129338v1: 129338v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129338v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
