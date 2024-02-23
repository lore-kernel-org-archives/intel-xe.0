Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B4CC5478C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 05:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B7A10EB00;
	Fri, 23 Feb 2024 05:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6GsscCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D295810EB00
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Feb 2024 05:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708664729; x=1740200729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A9QZkE30qFUVTDvlXIciDLEefpSLtGhBR8XwbMLEnrk=;
 b=R6GsscCwFXBQRWV6UYts8AbcORNipHFtdyGdMyXvjkCtl+ZS2BoGbTGI
 SgXnnq1mrMlBm5ClOqs5AkL5hcKkYBboy+EYB1mNCmfAqGhsw7eoGDK87
 jaOXtdjXzY+0x8IC+J4UqOf1TOQfl89U46W2orUe4v1XjefT/aiHoqixh
 hj+hy8AfsvYZ/kibVALELldAUVeyJ6JdR2u9WGv4KqdrB35Xy74rDw+Oj
 PsbYgKkUJBx2Fwta4bYMI6uRZnQQuBCquoEFv4pvwbmBjV5XSK9Y9Zeik
 cIxLos35J78QwErTh81LgOPU+O1IiJwfY5kAfvcwqP5NphDb208jImu1j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6778115"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6778115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 21:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5765776"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 21:05:29 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 21:05:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 21:05:27 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 21:05:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDc00brxAdQbWn979BpJbg2FuWXjyrUb/VGOhLso/EkWCNr1ck4/UrNTP4NpdRQYPt9grfu9pxvzlYl4vuIUFP0XYupR05btB5ELLxDP24a+Iq+Rt4HxIADr8qKWZpgHOlxpmlFSd9tbfxVYDQL7WB89/STnX/e58+1PNeiYvgKUSXZ+YS9t8suxDa+u2KHJuZdSCwZcoJr07pmm9TEbeA4yfGSo0JFWquNwdMMM8FLGSyuxf2m1UAGpLDZ3OdtqI531raj88DqicJzVcNTtWvgAx/hJz7ZDYwLHOKOAKsUlf3KjA8/c7ZGOpGlUIl+gdHS54bENHRIJE9tfFZbXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9QZkE30qFUVTDvlXIciDLEefpSLtGhBR8XwbMLEnrk=;
 b=FeZum8Kw4bPs/1c6luD9E4qnk00Kt1D4H4oCe8XZfUXfmc3wDre9XiYrtfUbubro61GT5dac3lbUohMT3soA4oOjI74SKshfIJtC/pf8RKKRGsODqqyvPZaqlM4DjEwcsk+rJu3I6E6VraT+GAk+bVWLJuq+UezQz42FgtgeqjzAYkq6VijKM6D3Ad2phcwwoaoUfZMgFARtzMpJYEkA+JMRWK7bBwPmYXhOsWnGgaWRZkP0agVO7b04/Kl8I/+9yNO61eQxVAkz8KwMHMC3JXoSVzUTnyD345yEdye1wesWGVBSqoWnRzvBedQuz0V8/Hz+0tMk93tcTzTDYWHjdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6912.namprd11.prod.outlook.com (2603:10b6:303:22a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Fri, 23 Feb
 2024 05:05:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 05:05:19 +0000
Date: Thu, 22 Feb 2024 23:05:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: Re: [PATCH xe-for-CI 0/2] Update PVC GuC FW
Message-ID: <6ucvrbtipztlwtkrrh5lnvbonhzot7fd4sopug3wsjxdjc2lem@n4fo4x5kcmhe>
References: <20240222190606.724747-1-daniele.ceraolospurio@intel.com>
 <kugaafjv2aufzn5vabk2bnnyrqfnus5o7zw43x5ajck45vtqkw@aox65fnllsms>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <kugaafjv2aufzn5vabk2bnnyrqfnus5o7zw43x5ajck45vtqkw@aox65fnllsms>
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2bd853-0e7f-4624-bd41-08dc342d0850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axwcBopx8C9u3l9UVeiOOlOwyGago3MsG+Fydco1P4xNal0Mgsr739dQQPrwQfXnZChvjyq0caZAvy0spY9yjOoeYiwRrnZgXaulnuZI/zdkxdcWCU5Jl2jmqvfqxpsYW7IVMmGM0Phq71POTl8nO7FVRZFK++MtmAY3KwMAuOrxzj1GX6HX6bV3VoT2qG1v5tg//Q7Z7WigMQzMFYM3rfTGR7gKQ7zWpJ/g3tiQOgp8cYQIyfpkjtA3gq4ucO4Wi3ucXgxeWUx8Yh2wN7J+H+1NrLX1SxTv4gCgfMwHQaxv4aEC7VWuXwbSbdn9FtoaNbwJtVhdC9Q6BVDvzBGY67QpCAIWUMb9euVxx8ltaMURnaaBYLuupirwGZm5FYTsMl4NXblIaXGGpetl0Nzyw2zC2fenPH4N7uz9alxRVAMUW7hloWSZpLV+n766lmPKuw2hWHjiYnH2pMi7cWGgzFdXownf+fnJKHKBU19hfldXkY7JiZx/hV1QGS3RzGZKg2UMpMOuFZKWBmDuUtGqdqVwDtCmn5U1qXO8awWo1KE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FRfp4bFBNWPiQpkaW1ioEYaJR+I9MUSU463jp/39KDR80bfVp4vxBtN+/Z+F?=
 =?us-ascii?Q?pnWDAEnprYWydYX0hiE+6/hJKZWcoTfSo6MmevOGkdDPFbVQ5FE4fzPhyxEH?=
 =?us-ascii?Q?co3flk866obsOEWauUhV64mXBMpNLKpxyFAlGcXY2X5rfALt1cO57//AeEwh?=
 =?us-ascii?Q?Cu7wxe/AqkcxZShW4JG0j39i4cl1P86q9DjFy4Lngrk3r02OKFx24sOwMJn+?=
 =?us-ascii?Q?JASBpwA2+MXlDpLidNo9sPA+yQMFvDSCVOS8dV+XOqPw+/0UThoyjFUyUsV4?=
 =?us-ascii?Q?pfAswAU/K3ZiGgwVF7rXKBmpwMJacQf597PewAPVfIVnHdvjayYkoZA03dXA?=
 =?us-ascii?Q?d3/SfMggdwjgDWiko+wm8wnbO0E9me19axbuukF3148r5vrMmLK5lePgUK/2?=
 =?us-ascii?Q?afrfoEza0EaUeE2ifvA364vEkCyMlIM2r0dlWNQbGZZxzYot34aat5S2oIn+?=
 =?us-ascii?Q?QmOAW9lVkOnFAOv5jsbLjcoVTuGiyMfv+DyPXGyujQ69RaZbG1l1oORosfY4?=
 =?us-ascii?Q?DfGQqqiIgLPO8Flyf/nr8MOetewnevrfN/zInU4fPSCoytYyDmpKttpfkt5D?=
 =?us-ascii?Q?LaxMlLfdXjZSENbOEZoJ6Yj3GwvY4tO3wH6IDA+Qu9hFPzikKojIDbeXrmDE?=
 =?us-ascii?Q?TBdiqmSqpm+erfigSUcv1vJKD29wR+Lb/ACX87JJiIptvBvrR/iE031IQLX5?=
 =?us-ascii?Q?uQiUSFdyZhU3SWco7vZ+O7T1Eq65O+/7zhrweOwLOeUrpMGvNtWC+e+mfPlO?=
 =?us-ascii?Q?FuJc/Q08boIJfFOYrFxoqbQxSE+zvlNJ4Lxg0ixhJr9aJLh5klUBU6WDoRMz?=
 =?us-ascii?Q?AegIXap6m6RG6V+uFqxT8yiU6mC273dreri91GoneaBV4QA/ocK8reEdelGP?=
 =?us-ascii?Q?8qPxb/6oApoJ8xl6OK79gZ7hvjcomnfz1WU8xKz2TExSKTF1KJdqufq9TVii?=
 =?us-ascii?Q?I561djsKtqc4kb/Ko5xam01l5PfB5GdHz9m1toEICrXi50mLUMC8ccqwFuP8?=
 =?us-ascii?Q?w3TndpnHlbncKBgZtIpRzOjdm6eg48FIzzDBb63/TsCwIbklNvqZeOaVTXwZ?=
 =?us-ascii?Q?cZk9H8xUfQV3po8DWe1B4pbHU2s289hOzinap4wI1knZfqx6cMAZ6ou40SfO?=
 =?us-ascii?Q?MgWnsmFNdvxr32PEvyiBvXLiSlTzg9gV3HvSpQ0IBUmpECS4fk8A6sdCJwY7?=
 =?us-ascii?Q?ixVgzlJrDpOsGBb2PBPspZhtLDiliHcOupLbcKBJ11B0dScDQ1A0XVqxl+yS?=
 =?us-ascii?Q?SEBOVHiRKLWAHDRsbGRYYPxPjh5M8LJUm35Xchkpc5CL/h0L2sELf3/rfCQV?=
 =?us-ascii?Q?B6l+hurCv5LRT1NVBImLUkGQ/ScEGViXJ1ctju5uJCxGilN7TLp4NSeUo+J5?=
 =?us-ascii?Q?nnQKWsQ/BM4OjCCw6M/ubjI49/xXD2Di6Ry8uJCjmfY8Dk4CquvHwM2tTg6+?=
 =?us-ascii?Q?/wHmjJN8hC62Cqh9MYTbHMAK4RA/qAc6+p8yQtycSfLVthmNYeHfWimI5TYT?=
 =?us-ascii?Q?NlUUF7iZ5XFdrZD9pe/r1jAybsLNxynMk5GD0p1aBocgHCdkYocpI6k8Bn94?=
 =?us-ascii?Q?tw+bb/FdEso0+6fJCjQrOB6PesVRUCQ4srPNK3Q/mWg755aIpcOG5BeQCo7y?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2bd853-0e7f-4624-bd41-08dc342d0850
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 05:05:19.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvVZ8zjxA6jIqKoUi/Os9Kq/0vVHtW7c8BNhhZfXPPrb7arQeZJ9AUhLQB87EQE25H+FABpTAg6Qm6Rbq0pFlZofKeyjEa4AcyqTJsASNjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6912
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

On Thu, Feb 22, 2024 at 01:35:45PM -0600, Lucas De Marchi wrote:
>On Thu, Feb 22, 2024 at 11:06:04AM -0800, Daniele Ceraolo Spurio wrote:
>>Move from 70.9 to the newer 70.20. Since this is targeted to the CI
>>branch, we can drop the existing commit and replace it with a newer
>>version instead of adding a new patch on top with the update. The
>>dropping is represented here with a revert, but a merge time it'll be
>>converted to an actual commit removal.
>>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied to topic/xe-for-CI.

Thanks
Lucas De Marchi
