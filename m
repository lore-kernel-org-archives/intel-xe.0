Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFE8E77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DE810F052;
	Fri, 20 Dec 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpHdR9cK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A3810F05A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734729095; x=1766265095;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cJUavXBRrGJPZUMEVHCxbBt8z/qih3QAeZoaeygZ4cU=;
 b=VpHdR9cKNYPV45fFuVsWnxtzQBerh40VNNfEHHx+znbn6OuocUSDf8Dm
 nZ5JXPIFn8iapOq+JAHoU2bmPd9N5li9evyU03qdI3TCPKFaYrnYgVwae
 7okEFdmiYrATc/cj9rnH8Ef/rjyX+Sx4dAyXJhrTKDsxFDGUeYkhrKDyy
 bVav0CJxhFpM/2M4dzfA6m4n7nG2MFr+3KKTjJmwlX7fWwt9pDc59pry3
 lFR+J/Sig0KDghT6R5UXqfq50neWYAcikUFNY5oN4VeS+KVIc9bIfj9s8
 9zC0oPGHstMc2pcVFgwSlokD69R+ouOHNpswEHp0ezaW1gPFWTxps8R+B g==;
X-CSE-ConnectionGUID: uGLYCgsZSXi6yURIpkpRwA==
X-CSE-MsgGUID: Z/Sx9mIgRwGTuoNneCzZrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="60671838"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="60671838"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:11:35 -0800
X-CSE-ConnectionGUID: kM4ifBo9RsWXs4AYueEQ/w==
X-CSE-MsgGUID: ZtURtq5iSLWXh6GbqeIOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102729991"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:11:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:11:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:11:34 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:11:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCOhZEK2VqwDD/Na5TuYLyTUnsDeXu6wMczCn2paJBjTaqc+QWSzlwqI7iiAXY1Q00s0SHrhIv85gm2Ap4K369Qk79ReR6VGGINytyaAlz6dGkTLCwsBBfZSdou9m/W5WUP1KGNGgGqhd+4PRxbatKy6/Tp4vj6wbVVCgilFU6mdGiDd23D1g29x8vYiuvHBI+gSPNTBs5KhTvT2Qrl+6XterXKYAZgLlMRlgZivBWkkOSCKWtjf3Pzc8+kXltfIRujOQh/03WJObuEisaS3ZvS9DySsp8MeJ5p1EuxjMCLHj0srdpWcJFTAHx9ctIw4NnleDVyzXLXULwQks15SyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0QsREGhFXCKIjwL/Iz6298f2PF+jBLNUQAF316Tfto=;
 b=k/WqzphLfIo7O/hCTGVFCD8RXUeSm0GmgcBBD87lManthbE0MNHiRgwkWkVarBRl0iRX9EPRLxnlGVthYX7IGEOM10Sp9fLegdek55eIMM8ADRE7LaK6N9hK2drF/NhWaDdFo3lbfA8cns8uyxboW98sgWfiNNag52yKsnVNxee89KNTkBXeF6n7mZ0qy613AY6plGqhajllgHdHs5n4Uk92Ur5aAft9YVJyL3BXH8UHdwvxNigQBm5cJ2e04d2miFck+IAyUV4Fa/HyGLZiMwiUcfLuqzfYvhkzHkc59GHrlY55yGuud7e0djcJSDjeTM0iNiDXv/ELxIyV63umaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 21:11:27 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:11:27 +0000
Date: Fri, 20 Dec 2024 16:11:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v10 3/4] drm/xe/pmu: Add GT C6 events
Message-ID: <Z2XdfKRCvrACcl74@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220011910.103280-4-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0114.namprd04.prod.outlook.com
 (2603:10b6:303:83::29) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW4PR11MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: c42df08c-3c0f-4d79-9267-08dd213addc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4yxF5ZbLpfMvDBUkvZFfVQRxwQ+gujxRJo3uQ7wSnfB6bu1Lha02I1aFGwAR?=
 =?us-ascii?Q?RvBCyLEu2A3oSDdLaZD4ILbkb8UA6M7l9i9uByoI6DSBkZOklSwHK5xXLyyF?=
 =?us-ascii?Q?pUIxf+zs+t4/CwrBO6fhXK2NucSFAr2vXhqFdWvJ/AASKEEwvq8IGvW4tH4C?=
 =?us-ascii?Q?fWxcjx0nLrDNGQyrK3EgO7cEwGQXY95HCEHpwzWZf278cLE89mRmNRGcG5i1?=
 =?us-ascii?Q?yQahpoZg/sVSDXhSK1rItQq2v+pa4OI2/Sf5D3o4qrBDqYGrKA+2CZw8dQGB?=
 =?us-ascii?Q?yulWGAg5ed408QHPyhwquHbZIkuzZ28tMcC7L2ryqsu6LtQ6QGkissDRRrtZ?=
 =?us-ascii?Q?zJCWlla21Qyar87ksZ0U81EEAEd3oy9iyA4MX7v1wq9xnDnTLlH5xO6GYfps?=
 =?us-ascii?Q?XVKmYcsadF0qMeBB3uSSQIKBqT0XJULIydwxChFktf9rIY7xalZ7QPy8jhEK?=
 =?us-ascii?Q?dPutFz0Dy9SyynJ/Or6Y0E522d2MXQ+3sdUSF15hx+Hfw6GPL5Rb0qCYLs2m?=
 =?us-ascii?Q?9py3AhIgEh0KsEQJSOpMKKUlMdrC58Fs0heuwenmtM1AK7iz8BDPRJTGqRub?=
 =?us-ascii?Q?CFpt+AZk6PSnSbOjdH8jsmrmuZBtb1t8le/2ugBMwaBHOyzF8o5kkg5TGqB/?=
 =?us-ascii?Q?VW/ksXTTtDAm2A25eY1BmKYe/PidOnP6+Nmo4WwGWM4V4/MzMZuihohUdpD8?=
 =?us-ascii?Q?iu5rJ/wxMwWQ3Qmb9ltjoff+J1/JNvsfZdOhnIESWE+w3qFCjviyuuxTg2C2?=
 =?us-ascii?Q?nEJJJFYuJflnh9B+xYQSS6gfEis19gezdCZml4iWffZTrLFmJ/4lvrk8tDgi?=
 =?us-ascii?Q?DSQWQIOYRQQzYjDJjtNnGB/4aQDVUmkL5xpaIG2CGPg4DNoV9MEgepMnBFVO?=
 =?us-ascii?Q?vYji30x3p/UYO3O4Rc+IK7dd7kpjmHdAtdDHEUJ8IX3QTkE77vuQe5KnyMvH?=
 =?us-ascii?Q?fn9HXqHB43ntIuE44G2Vz3W63p5tQ8neBNSmMLpuq4RMaK8ZKCqqL7IUoz2X?=
 =?us-ascii?Q?HNRkzqlORVNqLh9F4xEUpX+RoFwpTea3eCVAtSbTG2oKD0JwIXe576z+MP5Y?=
 =?us-ascii?Q?wMdRoGm2vYMvayrbgDE55ll9+tz7dvVbJZkZgXKWku/59vvFefGW0T31YQNn?=
 =?us-ascii?Q?cZzWf46knQtczKuoBU/PL6AHYyjx6SOvPifBIV7xYhV+Rpex47SckWArwW+s?=
 =?us-ascii?Q?OuEAuHNZDG/g1qSXE8G+s3mDWKyigMEQ9Py5b0p/fJJVsCRU5Oz7C0a3nPIz?=
 =?us-ascii?Q?zDrrIOyAGeC8sKVtOgmTCJtE4gwbVxeo5DE+jvjA2m4HG2WTXMturBL6/7K0?=
 =?us-ascii?Q?H/+0DRwD7DTj288zBRPDEA2U7m9MoMmQ8yxx3HZGwWPmnDpJpaiwKoCHMY8n?=
 =?us-ascii?Q?gB4AViTIW32q7NHY7fa3A2XoKQ/s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2erVeJbJpk6avExv6RNon9pEttMuhrqw14fI4z8XM0aoYSGY/JRkbL5G1WvQ?=
 =?us-ascii?Q?1jEnV8w3WGtBMJQ1cPlEP7oCl4jq/GxfUhl0V/fd2wAjLeS6VBrxjUzCqZAo?=
 =?us-ascii?Q?1LPV4CgQLLDSoFaa3KpIbn53hqZ4xB2bl2u2y8gPcBu7DHXu9TYpjEoQsr/7?=
 =?us-ascii?Q?zBlMIP+7SSgsrV5BuXg7qx5Clvy/bzkiB9gzYPdCUrWFXAroT0LJyRUb2ALg?=
 =?us-ascii?Q?sMhAKzPb+WTI05tfhOwj5YisL6bqCPSq4gmWVpWIXoHHSw+u7pMN/EZIKuMJ?=
 =?us-ascii?Q?mnLxAzuDpN8+0e2MNyqc+ZYHX9A65ExQKkBs3hcr9eu+MKM0Z9oOA5cZ1S03?=
 =?us-ascii?Q?2YXLMBtVRD9AN+fxIjFovxqwlkXAHQ/nTBIq1MjfobeoaCzqmxp4QU6mpABD?=
 =?us-ascii?Q?JmPOXuWuJ0iHG+z2WKD7q6UjDUo+SO1HpPzaWik9qeq+lIodnW0ZRAqNzXFB?=
 =?us-ascii?Q?lRKz5MrswpXnL5ZeZDBKtNJvEvRhueoH7fh088ehUPzecV7V7blQQHYfMm25?=
 =?us-ascii?Q?Mu4+n65FZO9r95brpk1GMLT8AKkWlPQdF41EQsGA7XGJm9nMmMt6c/txAAev?=
 =?us-ascii?Q?LjQsgKpUTF9w7BaVsixzblst4mnpSqsdv85+oOwfWxGM+3U4HfzIg37D9zFb?=
 =?us-ascii?Q?kcpVDhGeXWSYdReJxh5K/fCkiwiT+msC4wx+mO03feliGDrPuYRnNllMGMl/?=
 =?us-ascii?Q?f/HsRvhKUIt/2E+ERUAnflnjeULgAn5b/pZANMGc543S8HfIGlRQaN9gmFwm?=
 =?us-ascii?Q?6aSI23MdRB9MiWlUoU9hlvGxTnrd2DPK6bswgUH8Gi0N5B6UuprIaA1o5oEm?=
 =?us-ascii?Q?/77eDvMAUc/ou7z/dG5cmZaGl01YqpgRlnXfjiSZ+O5MJuRBmsVhTw7oynLo?=
 =?us-ascii?Q?dS9UmJu3xakDi1BPBpZ9K/cPPBaI2Ew08osKc72B5YHG86Va8zrMONkG9V7A?=
 =?us-ascii?Q?KNFonYyXWM/7tAnheCyjcklw94YFtgns7cjRxvgHfXC3vVxQ97Qw+ECHJTXb?=
 =?us-ascii?Q?s89LidpdddWdWcEBsDBSj48kPqhc2gPMo+A/ACJ6+Kkr7Ohee2CaXzF6PgpP?=
 =?us-ascii?Q?0JJsmRTh5ilAFsQ0suZRYE0hYuxx46SawCs0sUTkqSv85JUHTvxbu1aKTfje?=
 =?us-ascii?Q?RyIIA3EtylYKz7fufOCCHlxww49dzxFRg2n6dhqls/mTGYQhf+st44dXGfCj?=
 =?us-ascii?Q?P4Z+/HCjjtyR7BxqxIpCZ3MZir3CNvFD7l07eZxksfs1V3WuFf+vGmDg5Kbc?=
 =?us-ascii?Q?iFp340y6xIHVDqlB74Tgpl/ZkF5FBF715cDMwE3TR1bKps70C7Cdh/VJ67lL?=
 =?us-ascii?Q?LspUQjOIJDAdLvw33o9rTb6WCpO0/OGf9cDkJxngZk2g5rpeFKku5J0q7ufI?=
 =?us-ascii?Q?P3DNHKaTitH24MNqLCtSZaxcwKeQ7/GAjsvI/07EB/97Bq4omHCHD3nvaQld?=
 =?us-ascii?Q?r6jNWR8pqZMM0XQa3jMcW7pXTX49KNTMHmigFNzN+nr2qNqhVMytEtsjGTtC?=
 =?us-ascii?Q?HWDTtOuu8yMCmAjUkEK0+MorG6kZCAViHQ8bRv12kvSuwJJoTiGhkiAGVHgo?=
 =?us-ascii?Q?zWwPGG6tN7h6k4n95tn25vaYCDMcIJtqZfrqoQspoM0EzPS1cNT63VNdRp+w?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c42df08c-3c0f-4d79-9267-08dd213addc2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:11:27.1317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y8k96g1gMj3knfXtaVmSRCBUfgkLhnUsiJVrGBIpfjKxmlRFFRudzf1+F62lwjDu5O0PRLymIRwV+f5JsXnBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
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

On Thu, Dec 19, 2024 at 05:19:09PM -0800, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Sample usage and output-
> 
> $ perf list | grep c6
> 
>   xe_0000_00_02.0/c6-residency/                 [Kernel PMU event]
> 
> $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>   event_id  gt_id
> $ cat /sys/bus/event_source/devices/xe_0000_00_02.0/format/*
>   config:0-20
>   config:60-63
> 
> $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I1000
> 
> $           time     counts unit events
>      1.001183454       1001 ms   xe_0000_00_02.0/c6-residency,gt_id=0/
>      2.004434757       1002 ms   xe_0000_00_02.0/c6-residency,gt_id=0/
> 
> v2: Checkpatch fix, move timer code to next patch
> v3: Fix kunit issue
> v4: Fix for locking issue, fix review comments (Riana)
> v5: Add xe_pmu_disable() function to reset enable_count
> v6: Change rc6 to c6 (Riana)
> v7: Fix another comment format
> v8: Replace RC6 with C6 (Riana)

hmm... I didn't like that... in the current way it will easily get
confused with cpu c6... we need to either use gt-c6 like gt-idle
is using or keep the rc6 like people are already used to...
But this 'c6' only looks like cpu...

> v9: Define sampling freq in next patch
> v10: Use raw_spin_lock* instead of spin_lock* (Lucas)
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v5
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c        |   3 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 214 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>  drivers/gpu/drm/xe/xe_pmu_types.h |  49 +++++++
>  4 files changed, 268 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 41ab7fbebc19..64e60bcf131a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -47,6 +47,7 @@
>  #include "xe_mmio.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> +#include "xe_pmu.h"
>  #include "xe_mocs.h"
>  #include "xe_reg_sr.h"
>  #include "xe_ring_ops.h"
> @@ -875,6 +876,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> +	xe_pmu_suspend(gt);
> +
>  	xe_gt_disable_host_l2_vram(gt);
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index e6d25e8b7b7c..1115724a580d 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -11,8 +11,11 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
>  #include "xe_mmio.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  #include "xe_pmu.h"
>  
> @@ -46,8 +49,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>   * To list a specific event for a GT at regular intervals-
>   * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
>   *
> + * For C6, following command will give GT residency per second-
> + * $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I 1000
> + *            time             counts unit events
> + *     1.001183454               1001 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
> + *     2.004434757               1002 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
> + *     3.005854217               1000 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
> + *
> + * To verify this matches with sysfs values of c6, you can run following command-
> + * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
> + *   sleep 1; done
> + *      2348877
> + *      2349901
> + *      2350917
> + *      2352945
> + *
> + * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>   */
>  
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>  static unsigned int config_gt_id(const u64 config)
>  {
>  	return config >> __XE_PMU_GT_SHIFT;
> @@ -58,6 +82,35 @@ static u64 config_counter(const u64 config)
>  	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>  }
>  
> +static unsigned int pm_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_C6_RESIDENCY:
> +		val = __XE_PMU_C6_RESIDENCY_ENABLED;
> +		break;
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return pm_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>  static void xe_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -77,6 +130,10 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_C6_RESIDENCY:
> +		if (xe->info.skip_guc_pc)
> +			return -ENODEV;
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -125,6 +182,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>  	return 0;
>  }
>  
> +static inline s64 ktime_since_raw(const ktime_t kt)
> +{
> +	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->event_sample[gt_id][sample].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->event_sample[gt_id][sample].cur = val;
> +}
> +
> +static u64 get_c6(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);

why get_if_active here?
are you sure you have an outer protection ensuring the device is
awake?
anyways, please use the _noresume variant... so it will spill
a big warning if we try to access this and device is suspended...

> +	if (device_awake) {
> +		val = xe_gt_idle_residency_msec(&gt->gtidle);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake) {
> +		store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
> +	} else {
> +		/*
> +		 * We think we are runtime suspended.
> +		 *
> +		 * Report the delta from when the device was suspended to now,
> +		 * on top of the last known real value, as the approximated C6
> +		 * counter value.
> +		 */
> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_C6);
> +	}
> +
> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED))
> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED);
> +	else
> +		store_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED, val);
> +
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
>  static u64 __xe_pmu_event_read(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -135,6 +249,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	u64 val = 0;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_C6_RESIDENCY:
> +		val = get_c6(gt);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -165,6 +282,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>  
>  static void xe_pmu_enable(struct perf_event *event)
>  {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>  	/*
>  	 * Store the current counter value so we can report the correct delta
>  	 * for all listeners. Even when the event was already enabled and has
> @@ -173,6 +312,31 @@ static void xe_pmu_enable(struct perf_event *event)
>  	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>  }
>  
> +static void xe_pmu_disable(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		return;
> +
> +	raw_spin_lock_irqsave(&pmu->lock, flags);
> +
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == 0);
> +	/*
> +	 * Decrement the reference count and clear the enabled
> +	 * bitmask when the last listener on an event goes away.
> +	 */
> +	if (--pmu->enable_count[bit] == 0)
> +		pmu->enable &= ~BIT(bit);
> +
> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
>  static void xe_pmu_event_start(struct perf_event *event, int flags)
>  {
>  	struct xe_device *xe =
> @@ -198,6 +362,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>  	if (flags & PERF_EF_UPDATE)
>  		xe_pmu_event_read(event);
>  
> +	xe_pmu_disable(event);
> +
>  out:
>  	event->hw.state = PERF_HES_STOPPED;
>  }
> @@ -330,6 +496,7 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *name;
>  		const char *unit;
>  	} events[] = {
> +		__event(0, "c6-residency", "ms"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -511,6 +678,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>  	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>  }
>  
> +static void store_rc6_residency(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_C6,
> +		     xe_gt_idle_residency_msec(&gt->gtidle));
> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
> +}
> +
> +/**
> + * xe_pmu_suspend() - Save residency count before suspend
> + * @gt: GT object
> + */
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	raw_spin_lock_irq(&pmu->lock);
> +	store_rc6_residency(gt);

and here you forgot rc6 anyway...

> +	raw_spin_unlock_irq(&pmu->lock);
> +}
> +
>  /**
>   * xe_pmu_unregister() - Remove/cleanup PMU registration
>   * @arg: Ptr to pmu
> @@ -536,6 +730,24 @@ void xe_pmu_unregister(void *arg)
>  	free_event_attributes(pmu);
>  }
>  
> +static void init_rc6(struct xe_pmu *pmu)

and here...

> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int j;
> +
> +	for_each_gt(gt, xe, j) {
> +		xe_pm_runtime_get(xe);
> +		u64 val = xe_gt_idle_residency_msec(&gt->gtidle);
> +
> +		store_sample(pmu, j, __XE_SAMPLE_C6, val);
> +		store_sample(pmu, j, __XE_SAMPLE_C6_LAST_REPORTED,
> +			     val);
> +		pmu->sleep_last[j] = ktime_get_raw();
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>  /**
>   * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>   * @pmu: the PMU object
> @@ -575,6 +787,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  	if (!pmu->events_attr_group.attrs)
>  		goto err_name;
>  
> +	init_rc6(pmu);
> +
>  	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>  					GFP_KERNEL);
>  	if (!pmu->base.attr_groups)
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index d07e5dfdfec0..17f5a8d7d45c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>  void xe_pmu_exit(void);
>  void xe_pmu_register(struct xe_pmu *pmu);
>  void xe_pmu_unregister(void *arg);
> +void xe_pmu_suspend(struct xe_gt *gt);
>  #else
>  static inline int xe_pmu_init(void) { return 0; }
>  static inline void xe_pmu_exit(void) {}
>  static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>  static inline void xe_pmu_unregister(void *arg) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 2b3f8982023f..f47a6e1b109c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -10,6 +10,8 @@
>  #include <linux/spinlock_types.h>
>  
>  enum {
> +	__XE_SAMPLE_C6,
> +	__XE_SAMPLE_C6_LAST_REPORTED,
>  	__XE_NUM_PMU_SAMPLERS
>  };
>  
> @@ -25,6 +27,26 @@ enum {
>  
>  #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>  
> +#define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
> +#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
> +
> +/*
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_C6_RESIDENCY_ENABLED,
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/* Global PMU mask to track enabled events */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
> +
>  struct xe_pmu {
>  	/**
>  	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -67,6 +89,33 @@ struct xe_pmu {
>  	 * @pmu_attr: Memory block holding device attributes.
>  	 */
>  	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @enable_count: Reference counter for enabled events.
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @sample: Current and previous (raw) counters for sampling events.
> +	 *
> +	 * These counters are updated from the PMU sampling timer.
> +	 */
> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @sleep_last: Last time GT parked for C6 estimation.
> +	 */
> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>  };
>  
>  #endif
> -- 
> 2.38.1
> 
