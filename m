Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8F2C4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 20:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FAA10E4CE;
	Wed, 22 Jul 2026 20:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIAi+p7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F9A10E4CC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784751104; x=1816287104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fY0LDS8rPsizpEn6236yF3NPlPHl1Yio0PMuUJSumeI=;
 b=MIAi+p7aJkcEtzpnM/OA58Qbyx3nfVaN7RSVwquUJcGDn4c9js0a+vo9
 83jCxVyL1xN48T5lxML19tKYGL+EC78zwbLWQX9chMAOLxOha0aVapMXR
 HYqnL1OG9zMABpdKZ/KQ4ao+pCGA8fzbOXA/T4Tt557IPAuill/qsjDzM
 D7oX2lfqpCECptoHJQHrdkKgTuKP1UFGkQzu9eXE8sdgw1hU+9XtBS7ow
 DoI5T9jHxqUxIgVKpAgLNDAIAMu0fPH4BLMKM40dmIY3e7f6a+LIYjWnO
 EqsKCL2NchLHutAHD2mt18Jm0IeWnNJI2pRMNnzYsxud8yjgnC7c5W1Hh A==;
X-CSE-ConnectionGUID: +uliAao9TgaO+cBBWyZdLA==
X-CSE-MsgGUID: MCozprbiRjGox8Eq1DO9CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="108187445"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="108187445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 13:11:43 -0700
X-CSE-ConnectionGUID: xr94eAzTRlWvC07Lh7JtIQ==
X-CSE-MsgGUID: lPTWgpehTrS81htAilmtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="261739310"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 13:11:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 13:11:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 13:11:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 13:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQ97l87UMifJuiZHUflvgnTeraKbYL6F1zVq+xyJa8niKcpoMceBbvpELHTB6V0wmdb9vGK2gZrH0raxdoweP4nJVmrI4Fuk76jnGzLISCXODnlx17j26FgPRxZOrSlDLjo2luren+RbedS0+4H3+Hfz8Xh77nVfJlhZr8QTWufv6qABixdIWVD+sdTnkotacWg9qYicaMEVBLA3O0Kvqz0wdGx7ogCMCJ9xs/35JyQfOcc1QbZIVFT+4GBgSh5sKPrfqkylJrvWgo+q1Cm2Hro1lXpFGYARM130DOxjSCdeYTTgMq5I2jrOxBt4Y1bty6TMM/kZ7u14XvH0trAQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOHefvZZcaG/Cp+dUDODWaqnujvfniUq/4987JqMRIE=;
 b=x6tWojyzykt8qwfH9loji2NzV62BA2q4vraxZYKyxfHT8G36Fkb42oT90tPrt4loIL/tz9QfIsmBsyxrr6x36aP5+sYQRXZpPldudzPqaTY2eIn566XsPoouoIxTtyWARLSxfHZn0OI6TQNk5SfJ+k8sPcikZQdKNdcbsjtiozS2Kv8PAgjGy7uzlN3rnUYiQme+Op63TGLWcjbLo6nhys2qLdkGzaeA8i6EmykT7637aozkXM1Xu/SWhtCFqkUUmD6mH7nd9qmWTkaui4qcwtvX5AiYfZ4doRU2eSdOV3T8SCR8DHgAtt7mH14SkZks7v355V8ihBhPMwJKmafeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Wed, 22 Jul 2026 20:11:39 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.017; Wed, 22 Jul 2026
 20:11:37 +0000
Date: Wed, 22 Jul 2026 16:11:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <amEj9bmFNYMH1OvG@intel.com>
References: <20260629172239.2377117-1-zhanjun.dong@intel.com>
 <20260629172239.2377117-3-zhanjun.dong@intel.com>
 <akNG5Nv/dp6+m4mP@gsse-cloud1.jf.intel.com>
 <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <81ecaed7-47cf-4b13-9c0a-31e7bf189a54@intel.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DS0PR11MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b00855d-7125-4bb5-1bb4-08dee82d6f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: RIDGAIWe5esksJn/8RCGpppsVJzfbpxSoxFG91PVh0Mi30poy4HPkhjBh8wKC010oYP8fIF2m55e61pUUgWlEsW5LjtfLIUkYvIV9bYlqXX2r6Fi5HSM6kPlKhyA7HYnLgF7n/aHRS+YH9bB7/qmmkoyLwF9l28XlCqcW0yDhn5ECw2huaC5JaYVgPtoD20r3Z+0rAdxIN5B5DRdaaJuhutcuqLFVQQGP/YZXcUoh5QtQWwHxLZUCGgJBw2LFGfBs4mqEd60yeKMCztCbMiLwCavuvoFsmtDM1FNZTdzUAtB608AnoXlQqMbfXdAYmQCBsYpXZIAc+umXqPKONjDg1+3lXLNgvBXarpik47sfOPq3YpsoJW1mwPBDyf89Ruqzo9ah8lGwr9XjzF81XHJEhnKHDGF+MMZsPSEgCfacyi5Ao3ub3eeTB+VJevTu9KuVQtm+4NzH0HmoOk8O761d1Uib5okGasX2ipMgg3ES+ujGLsRKDQnVf45u+4G7LicmSKe/fDj6EndMGUPAikj6rz+lyasbbew5K3JIw5g/x/uBsYif12zG2CO0n2LvxiTu//3hZ3gqLQWsrIu6u0xMO6sCAGjapy5fJGyEg/lwP189tiRA+LY71tcBI0lOy38c4vkCOmm3PybV9eHI7yXDA0iNHyMInTxies09SyW7HM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9q+wJ28IduEMDFFYpcaqMg4sX8ckplX7sSaIBptYGonvW8yuMX3Lii6g3WX?=
 =?us-ascii?Q?IJOxbDfXBrUexc2+YR4y+c1X1TBJbiFn9jUj9z6tPm6Q3XcB4B1eCK38rmcm?=
 =?us-ascii?Q?/sBPMcQ2nfs0JXdlAvqWn8uq7vJ9mhJZ4t3BsDeBNs10kta8DGus38q1Hqm+?=
 =?us-ascii?Q?eKj7ivxQCroDRGzlZfzQ+Wy/82uo+0JJL6sZ3MCkUHgouDsexWXC9rkoOmW7?=
 =?us-ascii?Q?IlEUhW7GXoCiCjQXF1+0x3yMZPjimQiN2wRQhoV3VG0WwDO5ONExZu/DKvgr?=
 =?us-ascii?Q?TdBbMcGlgZLMV0g20temS6R/tYSOfZbY3QDZ2O0RnxsT7XjZANrfmoNA0DFf?=
 =?us-ascii?Q?0paMzLqTeHpvsnCTo2t+MbTXKRG5MRCTVOD78YuKqlCqvGEuWe294usz9au6?=
 =?us-ascii?Q?a4L9GKEFy1DOwyeS5NrE4+V3iktQDGSF7Y1V9ecA2q9QPS9TpoPXhUtUnvyb?=
 =?us-ascii?Q?4HJ9nYJa042MHgqXNcIRyyiRGdFCX+FM60CxNKZz9Kv9y/kR517YcmPPgn4T?=
 =?us-ascii?Q?+yiWZJYwj5XaU192Etsae4+tqmRRI9GxwD52r3u5GYBhkU5dqyRJPPeKOoIt?=
 =?us-ascii?Q?ok6fFGH2Xw+Ee8vGdq3yEPzkyeWBU5wyLg85A9ULUXbQyjSkSTSsBwtCnfJo?=
 =?us-ascii?Q?DsKAYGaxzy7JdV1yYPTwFzkA0G4tkjM5qq0V4229UstTbUUUlrqebo4Vnf+e?=
 =?us-ascii?Q?6hhyFxaU7tjacIwoKvv7trFoYxRkz5clcvrA9DF0idKx5yrVeMsya5lo5GqB?=
 =?us-ascii?Q?pX4v3PcmVexOAYy1PfjaD4Fra3Re1zVABCD+pwBAw3eCv4wmh/EmHRkiDUSR?=
 =?us-ascii?Q?61G9mTAmVSNPXWUcdl6ofGk2Gk0zWl8fZbG2C3pc14HtrO4fzefHF10YsS82?=
 =?us-ascii?Q?3Mo5C4gxv1/0nDbAzj5E7jaDwYmuFfKgmlNiwRejFPQUEl6tVZnG/zCYEJW2?=
 =?us-ascii?Q?SPzPEGCNYWmsGOXCh1BpOs2q0EelWBXUZcaTgYKgm3wXZw00CblClaoXzBK2?=
 =?us-ascii?Q?6/wy0PYqxagceR6sfQPZI5TYTLmtU23K2dRz6C1D/reuz1wCnyP579vCN/Qt?=
 =?us-ascii?Q?4DrzZ/r7WY8pYFIvFbn76T9LAKgfeOhPvLDiCYFf4eQ1HDjq9jpfLjEVF+gi?=
 =?us-ascii?Q?PGKXh09icrzaQqagOO30f9+sNn71+Btmgn8eI4NuCzjmT/pCtdxk3RjMF6Z4?=
 =?us-ascii?Q?Y9k0uYng6UoVda7cKyFatPYJmncaHGvLZ8JX62YwIRbn/lYNFLdRyfk1+elQ?=
 =?us-ascii?Q?/nDMhoW2165s/eIhV6ehQlbh00qNExJKMqxbqP5hWuZBA53RSXrqr5KMTTpV?=
 =?us-ascii?Q?aczeygOmWY2kCyVP29/dyPzqJwM8D2qBWWvlvyq1OVKDXIDJLbF1yA/FpFrT?=
 =?us-ascii?Q?FBnrvaDjmxEuthyM1kjY9JnOo/IvVwiV3urHwnYzffY/PID/ydw9VxOspNGx?=
 =?us-ascii?Q?dFV8KPkuHEhnPxdmlaTnqgibIJxkMQUJ0d9EGPkBVY1dbwNsgHofGwHW91En?=
 =?us-ascii?Q?xzZrvXbwpp8NUnaHPgwcJoAMWqIUyYwUBqsyjpjfLJY9x/4E3kLj3oh8a88S?=
 =?us-ascii?Q?P7GVyp4W46K8uGc864aTwgbiq0Pvog/IDpcuN7lVqLFEZ87Ye2QgeRIIFdZs?=
 =?us-ascii?Q?yDpdwqFq+hTK+C+JYlgkLIvkEM3ZPg3v+cJ0PvcczvLjoc/qhEQuooN5v/WF?=
 =?us-ascii?Q?rVx8mujQLmHrFglM58OoRclC9TA0zIzqlhUQDjCFkyGYvzlF48hjNd3PJfv3?=
 =?us-ascii?Q?sg0U8CDEgw=3D=3D?=
X-Exchange-RoutingPolicyChecked: rnEZ5/1W6RoOAyB9fcN+Xk8BI0Nw3thttCn3GZmRSzIXnjaq8HhvofLhXfKA5Y5RsQiEyIa4k2dy7cjEE2G99IVX7Q3IsIrzOCQKjXXeQNN12tOpmO2F22DN7OcGsgI6AvFLn6ZK8opnLEljQP85BSJqJvwCS4E06J38xfqSE6Ggox9kzh4fUWFSVJzTqduvl7QSxMk+LhBHQ8RuvddSno2bCDBZQIrHJKZ1F6uITTr0uj0ajmEBf1gtUl+sB5zXnUFcRvQATQJCIKQiC3lO8/hu0BjnXcY2kcPLem2TUn6+b9OCPekQ5STwmg6IXWqTeFRHcxCIZNaEZPIl4SD8Pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b00855d-7125-4bb5-1bb4-08dee82d6f1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 20:11:37.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /g/acvUv2msjfLSpUUCB+4IgJeq9aV83nBMSJGKqX+AQaf69ZJQn00THZMoe1RtO+uOvgGlEPRJKOlxTyoAONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
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

On Tue, Jun 30, 2026 at 01:35:57PM -0400, Dong, Zhanjun wrote:
> Please see my inline comments below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2026-06-30 12:32 a.m., Matthew Brost wrote:
> > On Mon, Jun 29, 2026 at 01:22:39PM -0400, Zhanjun Dong wrote:
> > > Replace the raw ascii85 dumps of GuC log snapshots with a
> > > zstd-compressed ascii85 stream and reuse the same helper for CTB
> > > snapshot output.
> > > 
> > > Use zstd streaming with default level-3 parameters and an estimated
> > > source size of 0 so the compression workspace stays bounded even for
> > > multi-megabyte logs.
> > > 
> > > Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> > > GuC log and CTB dumps are compressed with ZSTD. This allows users to
> > > choose between reduced dump sizes or lower memory usage.
> > > 
> > 
> > What is the advantage of doing this the KMD vs. getting the dump and
> > compressing it in user space before sharing it?
> 1. Timing impact
> There are KMD runtime challenges about dump too many data:

you tell we have challenges with that but I'm not convinced that
you opened up about the actual challenges.

> a. Skip unused data.

should we then simply skip unused data instead of compressing it?

> Existing code dumps whole buffer, which also prints out area not used (Like
> lots of lines of "Z"). This patch only print valid range in buffer.

So let it be and update the tools as well, but do not need to compress to get that.

> b. Compessed size
> Test shown a typical 75% compression ratio about valid GuC log data.

This is not a valid change, nor metric to justify this patch.

> 
> Print out 10MB debug data in ascii85 take quiet a lot of time, especially
> when print out to dmesg.

Do not print that to dmesg! Simply! Also, if you are now printing compressed
message to the kernel bug log you are doing it very wrong!

> Too long print out might cause timing impact to
> runtime, which is bad for debug purpose.
> With fewer data, this relifes KMD pressure when triggered.

And then you add extra step on the debug process and you need to end up
with opening a big file anyway, no?!

Perhaps the right solution for this problem is to go there to devcoredump
and implement the multiple files log. NVMe folks had a proposal for that
years ago. Perhaps we should get that moving so GuC logs can be split into
a separate file so people who don't need don't even open it.

> 
> 2. UMD utility required

Wait, what?!

> Do it in UMD requires an utility running in background and check/receive for
> data. If through debugfs, all above timing impact is not skipped.

with devcoredump udev event is notified. You just need to create a udev script
to handle that for you.

> This add extra step for CI and user, in case of utility missing/offline, the
> valueable issue data would be lost

And making the user to have to debug the guc log is not an extra step?

> 
> Meanwhile, there is discussion to have that kind of utility, will keep
> monitoring it.
> > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/Kconfig          |  16 +++
> > >   drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
> > >   drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
> > >   drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
> > >   drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
> > >   drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
> > >   6 files changed, 184 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index 4d7dcaff2b91..3af15a0c14f7 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -33,6 +33,8 @@ config DRM_XE
> > >   	select ACPI_WMI if X86 && ACPI
> > >   	select SYNC_FILE
> > >   	select CRC32
> > > +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP
> > > +	select ZSTD_DECOMPRESS if DRM_XE_COMPRESS_DUMP
> > >   	select SND_HDA_I915 if SND_HDA_CORE
> > >   	select CEC_CORE if CEC_NOTIFIER
> > >   	select VMAP_PFN
> > > @@ -101,6 +103,20 @@ config DRM_XE_PAGEMAP
> > >   	  If in doubt say "Y".
> > > +config DRM_XE_COMPRESS_DUMP
> > > +	bool "Enable ZSTD compression for error dumps"
> > > +	depends on DRM_XE
> > > +	default y
> > 
> > Are tools to decode GuC logs updated to handle this mode?
> Current intel_dump_decode only support i915, we need more Xe debug support.>
> > Matt
> > 
> > > +	help
> > > +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> > > +	  compression. This can significantly reduce the size of error dumps
> > > +	  but requires additional memory for compression workspace.
> > > +
> > > +	  Disable this option if you want to save memory or prefer uncompressed
> > > +	  error dumps for debugging.
> > > +
> > > +	  If in doubt say "Y".
> > > +
> > >   config DRM_XE_FORCE_PROBE
> > >   	string "Force probe xe for selected Intel hardware IDs"
> > >   	depends on DRM_XE
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 5f2b90b18f97..27473c25aad2 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > >   	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
> > >   	drm_puts(&p, "\n**** GuC Log ****\n");
> > > -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> > > +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
> > >   	drm_puts(&p, "\n**** GuC CT ****\n");
> > > -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> > > +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
> > >   	drm_puts(&p, "\n**** Contexts ****\n");
> > >   	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 21e0dad9a481..4cedbcdb831e 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -2094,11 +2094,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
> > >    * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
> > >    * @snapshot: GuC CT snapshot object.
> > >    * @p: drm_printer where it will be printed out.
> > > + * @gt: GT structure for error reporting
> > >    *
> > >    * This function prints out a given GuC CT snapshot object.
> > >    */
> > >   void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > -			      struct drm_printer *p)
> > > +			      struct drm_printer *p, struct xe_gt *gt)
> > >   {
> > >   	if (!snapshot)
> > >   		return;
> > > @@ -2112,11 +2113,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > >   		drm_printf(p, "\tg2h outstanding: %d\n",
> > >   			   snapshot->g2h_outstanding);
> > > -		if (snapshot->ctb) {
> > > -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> > > -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> > > -					      snapshot->ctb, 0, snapshot->ctb_size);
> > > -		}
> > > +		if (snapshot->ctb)
> > > +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> > > +					  &snapshot->ctb, 1,
> > > +					  snapshot->ctb_size, snapshot->ctb_size);
> > >   	} else {
> > >   		drm_puts(p, "CT disabled\n");
> > >   	}
> > > @@ -2150,9 +2150,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
> > >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
> > >   {
> > >   	struct xe_guc_ct_snapshot *snapshot;
> > > +	struct xe_gt *gt = ct_to_gt(ct);
> > >   	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> > > -	xe_guc_ct_snapshot_print(snapshot, p);
> > > +	xe_guc_ct_snapshot_print(snapshot, p, gt);
> > >   	xe_guc_ct_snapshot_free(snapshot);
> > >   }
> > > @@ -2250,10 +2251,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
> > >   	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
> > >   	drm_puts(&lp, "**** GuC Log ****\n");
> > > -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> > > +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
> > >   	drm_puts(&lp, "**** GuC CT ****\n");
> > > -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> > > +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
> > >   	drm_puts(&lp, "Done.\n");
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > index 767365a33dee..2005d1a0cd6c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > @@ -10,6 +10,7 @@
> > >   struct drm_printer;
> > >   struct xe_device;
> > > +struct xe_gt;
> > >   int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> > >   int xe_guc_ct_init(struct xe_guc_ct *ct);
> > > @@ -24,7 +25,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> > >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > >   struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> > > -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> > > +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> > > +			      struct xe_gt *gt);
> > >   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
> > >   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index 538d4df0f7aa..d20be1a064f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -6,6 +6,9 @@
> > >   #include "xe_guc_log.h"
> > >   #include <linux/fault-inject.h>
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +#include <linux/zstd.h>
> > > +#endif
> > >   #include <linux/utsname.h>
> > >   #include <drm/drm_managed.h>
> > > @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
> > >   	return snapshot;
> > >   }
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> > > +					 const char *length_label, const char *data_label,
> > > +					 void **chunks, int num_chunks,
> > > +					 size_t chunk_size, size_t total_size)
> > > +{
> > > +	zstd_parameters params;
> > > +	zstd_cstream *cstream;
> > > +	zstd_out_buffer outbuf;
> > > +	size_t wksp_size, dst_size;
> > > +	size_t remain, ret;
> > > +	void *wksp = NULL;
> > > +	char *dst = NULL;
> > > +	int i;
> > > +
> > > +	/*
> > > +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> > > +	 * (windowLog=18, 256KB window). Passing the full total_size would
> > > +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> > > +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> > > +	 * workspace stays ~1.5MB, well within kmalloc limits.
> > > +	 */
> > > +	params = zstd_get_params(3, 0);
> > > +
> > > +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> > > +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> > > +	if (!wksp)
> > > +		goto err;
> > > +
> > > +	dst_size = zstd_compress_bound(total_size);
> > > +	dst = kvzalloc(dst_size, GFP_KERNEL);
> > > +	if (!dst)
> > > +		goto err;
> > > +
> > > +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> > > +	if (!cstream) {
> > > +		xe_gt_err(gt, "failed to init zstd cstream\n");
> > > +		goto err;
> > > +	}
> > > +
> > > +	outbuf.dst = dst;
> > > +	outbuf.size = dst_size;
> > > +	outbuf.pos = 0;
> > > +
> > > +	remain = total_size;
> > > +	for (i = 0; i < num_chunks && remain; i++) {
> > > +		size_t size = min(chunk_size, remain);
> > > +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> > > +
> > > +		while (inbuf.pos < inbuf.size) {
> > > +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> > > +			if (zstd_is_error(ret)) {
> > > +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> > > +					  zstd_get_error_name(ret));
> > > +				goto err;
> > > +			}
> > > +		}
> > > +		remain -= size;
> > > +	}
> > > +
> > > +	do {
> > > +		ret = zstd_end_stream(cstream, &outbuf);
> > > +		if (zstd_is_error(ret)) {
> > > +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> > > +				  zstd_get_error_name(ret));
> > > +			goto err;
> > > +		}
> > > +	} while (ret > 0 && outbuf.pos < outbuf.size);
> > > +
> > > +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> > > +		   length_label, total_size, outbuf.pos);
> > > +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> > > +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> > > +	goto out;
> > > +
> > > +err:
> > > +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> > > +		   length_label, total_size);
> > > +out:
> > > +	kvfree(dst);
> > > +	kvfree(wksp);
> > > +}
> > > +#endif
> > > +
> > >   /**
> > > - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> > > - * @snapshot: a snapshot of the GuC log
> > > - * @p: the printer object to output to
> > > + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> > > + * @gt: GT structure for error reporting
> > > + * @p: drm_printer for output
> > > + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> > > + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> > > + * @chunks: array of pointers to source data chunks
> > > + * @num_chunks: number of elements in @chunks
> > > + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> > > + * @total_size: total uncompressed byte count across all chunks
> > > + *
> > > + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> > > + * zstd level-3 streaming compression and prints the result via @p using ascii85
> > > + * encoding. Otherwise, directly prints the uncompressed data.
> > > + * On failure the function returns without printing the data blob.
> > >    */
> > > -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> > > +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> > > +		       const char *length_label, const char *data_label,
> > > +		       void **chunks, int num_chunks,
> > > +		       size_t chunk_size, size_t total_size)
> > >   {
> > > +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> > > +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> > > +				     chunks, num_chunks, chunk_size, total_size);
> > > +#else
> > > +	/* Compression disabled, output uncompressed data directly */
> > >   	size_t remain;
> > >   	int i;
> > > +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> > > +
> > > +	/*
> > > +	 * Print each chunk directly without merging into a single buffer.
> > > +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> > > +	 * for all but the last chunk to omit the newline between chunks.
> > > +	 */
> > > +	remain = total_size;
> > > +	for (i = 0; i < num_chunks && remain; i++) {
> > > +		size_t size = min(chunk_size, remain);
> > > +		const char *prefix = i ? NULL : data_label;
> > > +		/* Add suffix only on the last chunk */
> > > +		char suffix = (remain == size) ? '\n' : 0;
> > > +
> > > +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> > > +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> > > +		remain -= size;
> > > +	}
> > > +#endif
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> > > + * @snapshot: a snapshot of the GuC log
> > > + * @p: the printer object to output to
> > > + */
> > > +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> > > +			       struct xe_gt *gt)
> > > +{
> > >   	if (!snapshot) {
> > >   		drm_printf(p, "GuC log snapshot not allocated!\n");
> > >   		return;
> > > @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
> > >   	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
> > >   	drm_printf(p, "Log level: %u\n", snapshot->level);
> > > -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> > > -	remain = snapshot->size;
> > > -	for (i = 0; i < snapshot->num_chunks; i++) {
> > > -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> > > -		const char *prefix = i ? NULL : "[LOG].data";
> > > -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> > > -
> > > -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> > > -		remain -= size;
> > > -	}
> > > +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> > > +			  snapshot->copy, snapshot->num_chunks,
> > > +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
> > >   }
> > >   static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> > > @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
> > >   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> > >   {
> > >   	struct xe_guc_log_snapshot *snapshot;
> > > +	struct xe_gt *gt = log_to_gt(log);
> > >   	drm_printf(p, "**** GuC Log ****\n");
> > >   	snapshot = xe_guc_log_snapshot_capture(log, false);
> > > -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> > > -	xe_guc_log_snapshot_print(snapshot, p);
> > > +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> > > +	xe_guc_log_snapshot_print(snapshot, p, gt);
> > >   	xe_guc_log_snapshot_free(snapshot);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> > > index 4649a260755e..3e97647ee8b5 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> > > @@ -11,6 +11,7 @@
> > >   struct drm_printer;
> > >   struct xe_device;
> > > +struct xe_gt;
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> > >   #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> > > @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
> > >   void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
> > >   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
> > >   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> > > -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> > > +
> > > +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> > > +		       const char *data_label, void **chunks, int num_chunks,
> > > +		       size_t chunk_size, size_t total_size);
> > > +
> > > +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> > > +			       struct xe_gt *gt);
> > >   void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
> > >   static inline u32
> > > -- 
> > > 2.34.1
> > > 
> 
