Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED0CC021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 23:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A26510E465;
	Thu, 13 Feb 2025 23:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbi6WvEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97A010E465
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 23:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739488993; x=1771024993;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nMyrFmChb85b5RA/HWJAyWIW9Ls+A/9Wa+J7i0XMq+w=;
 b=dbi6WvENpIs877UuC+nDZZGGoWEjJyzUkhdk9ajoXz2nmNJgWulWz1Sh
 f/fwaqFYn979eBObgn/uLD4pgijMUk+xNV2jC0f+oWcdGmdbQx8TI3+7+
 vECz6b14LWpQbSh/oRgIKFTHFnI10FUkK9qp4x61ljXPvTARGX+3uzCip
 h33zlvXSJ+hRVe/4ZJdpYdLBu9PnO6WQrWOYoIvCKckjx1gT4zqMe9IAe
 0a6M92MPha65Uncel10tFpn60+detNQsymzhViwlq5kBNgEh4qeVESlQd
 TOIuQjhyZcsI8dTWKEe0j3/oddGIYNvSZf4RrdbrRjBvEj3YMoOdDENqk w==;
X-CSE-ConnectionGUID: UAxHG1P6TWG8ttI6BvRVeA==
X-CSE-MsgGUID: ig7SEAkZTAqEQh1MSFMGWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43988394"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="43988394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:23:12 -0800
X-CSE-ConnectionGUID: Xfprr3HiTDq5mMvUUWdDhw==
X-CSE-MsgGUID: /sY+TRgoTeCFxY76yu7pLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113813810"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 15:23:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 15:23:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 15:23:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 15:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIRPcDUX37ZA94N5TJnCaG4qZsS1HkUwQ4jdVLtsZbAJjv+IT4/p1lrPGem3178wpgZ3ugb+N2l2Fi3zGDZ7ZdUOSI5QY8DTdIVReHrEyoJDNfASKY45Q96uKVwaUYjmqkX6hK0Dlb8IDanejLKBSHDCCQGQ770DBbAaIzSGcw2GPKpYz4NvHCOeQ2bGWNpNa8TksKA1lyX13ZaGv3cEi5H6WKdiK0jzpfSIWh9xDMGyA/hHw1ieWkWXQyXURrUsvJDnTSjOnpNXHZYbFZ3FQ1ZNiVBooQrfeCKi714hJfIwv+9F7Wh2/f1CpIMz8YpIghNxMEreL2rKofFr+C216Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izS7/IMaEUmLgYsYZ9EJfDHzlNH0bnzNUjXBeIH6eF8=;
 b=oI/8rfap0o9TjrcviU3NEj744hYdDGqIeJ52fZ8D9BvPedhLf0o/Sz1VJiIQv5iLowwvLU2c0yvY6SOq9irPlFCG1NpSKJjwxNhnkuv6ij2hT7JBzcqL6HMkPb1qSDNFPmZoses1dTE60hE2BZDQagHmx1f2EVHCNH0umK5gVb+Re8gFqBL/+lr3qb7dQ54GRAH9NMV72+qk5knHQtDmR7Ys/D4uifwBBqE2mLmZ3Dc8pNkpVcQPuSCLKEwh1ECV4Kmqb1ToKOufajqjtqJc/tffQKTgRlGKEffy7WODeII0Ko1Ja70zAT7uurBgG+nAlTn2BcJ3klxZtakrsmGs7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 23:22:34 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 23:22:34 +0000
Date: Thu, 13 Feb 2025 18:22:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
 wedge_mode_set
Message-ID: <Z65-tkdKpqzH2gMg@intel.com>
References: <20250213230322.1180621-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250213230322.1180621-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: f792abee-77a4-4c77-e470-08dd4c854b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3w+IS8pIQ51/wrYmHZsGhFVs2WXByXTCOTwQJDXqz0g/c7fuXxy8XS/zjuYO?=
 =?us-ascii?Q?fKwH0W+aw7hjajqpup6nuDZYLMripAmifpQIlBpxotNv/F33HQY+1m039BO4?=
 =?us-ascii?Q?zSH4qar7LUrg6hAJoVuA71DgHkIpPQSfQRtCNxZhCYLECrq/tADK8qR7I6vL?=
 =?us-ascii?Q?tJeTnfpGW53yVlk/yMZc/sB63fqnUy9UcOJaGXn+h4cEa0pcsqztAIMq4Gi/?=
 =?us-ascii?Q?1UKwvOZbkfJz7Ruma3oWPJyJvjBbsfZyV1KLFFVqhurgZ24cbICelW0Et69J?=
 =?us-ascii?Q?6nANWTZ5HHAMCluP6R4SIChTXHc5kbsmDrTPqb6jaeSB2tCaB4GZHusSi676?=
 =?us-ascii?Q?yXyUnwJhjDJBR9td/Fw0YBrLS7EB3AyMrnxYY8Tw+VSJ5mPH+flJK4dwdFg+?=
 =?us-ascii?Q?ooabvz+2PuB/GjOFL6dSRG9ZcmW69BDxQEmZ8LKePm2C547k1OKbtBklZLc7?=
 =?us-ascii?Q?5E8VyyE2gkKMLRRi4Pw4sLZtulKM4OF9GhwseLMxr0CdgYjnHd+Qua56eAX+?=
 =?us-ascii?Q?cmsN3mSNVyYgPWBW0/okkXGYbt3FjlalDkvb/2jEhHVmOQLWqfgoBLn9pxZ+?=
 =?us-ascii?Q?XbWTNRLHNk+Rjs6BefXLLc2uJc/sjWfFUeN6JnKI/8sHD9r5pTas2QXkDSVI?=
 =?us-ascii?Q?jvU9oUg3cOxk16WS/MLA9EgEFAXJT/QME7urTeDkVgqnqzTOXjIQ9WeuCZJ1?=
 =?us-ascii?Q?1nZ9RXj9UnZuU2L4nmheJCcZtojjxyjMnVINPH7SSrWLwtSvF+eckWAjCFPe?=
 =?us-ascii?Q?xkGY2KN23vGqmyUF8v8mF9bLCbxg7oxfsbemd9985TRzW3piuRIKAsxxwOMk?=
 =?us-ascii?Q?NmOw2BIr6xqUPkRM4bmhVzz/JsPgtNv8oE5sLcBoVknG7LCqIPBBCcd/dMvk?=
 =?us-ascii?Q?j1bzlIF4iX858bc73AdFnvhJ79atsdf+2aAweuhcyWmf27edrz1R9f3adMXP?=
 =?us-ascii?Q?sh6SuuO7ydwdP3pmtnFpI4ll6aJiYe3sta4SfiyKA9Cgo1bhXqPNs8inkl2Z?=
 =?us-ascii?Q?/XmdvcYKrvWtJEHOEZX+3zGn4ySb41Rh2LDyP5X2gwKLsguCWyZuaiArGCPe?=
 =?us-ascii?Q?Oyn2k+PQrh+toujGFHXqpnXYo7Oke6xz0vJNG1SV7gW7yBzHGI0aj/bFIDF7?=
 =?us-ascii?Q?pB71/o3kZddUhnSmjBcudKCrkI5sfS1pYgeWDsX6mnYMSigUYPdOPAOoe3Ca?=
 =?us-ascii?Q?gxAa7c1KXU0bWlmEuq+x4z8KUT8cbMhwU94BLQv45Jk/sTyregMFw7BpFc6V?=
 =?us-ascii?Q?cpB97Y9xVr0hUPcojb1Q5UwE8X4VdV0wWp72UMBwQqb/1W0wIn7zP4PuOY5Q?=
 =?us-ascii?Q?1EpwLmbxqRtf4f+AyFh7AYQsltgDT6KVfyONWEeuUwESsppLQN0Ar44E6DAD?=
 =?us-ascii?Q?5vqH0BdlE7cKecezBLCjlO29jFY8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vrNE3wWhS9SKyF7mY5Lcjk3Qmh/fFQEi47p1JHZDtR1v8VAkBzRuchMJ3fr2?=
 =?us-ascii?Q?Q0KR/2zYR/lJDFoYQek8cX2dtjroSpdl3ECV3LUNiZKJL5uT8GkWf7ijqby+?=
 =?us-ascii?Q?QQpRxz5XQzLQWzDQ1/9GjlspK6gIohEuoQvXcLt9ym4TFK2RMk8fjMDZYobt?=
 =?us-ascii?Q?27IjEMkHErMcuY0iCd1zaECiW7yog/EccD9mmMH6yAO5lf34vmoBkdapqJ1Q?=
 =?us-ascii?Q?EZTSBC3xdHRKfV9lz6ZBgwK+MFOW8HtdP3gdPia3LkBxMs4DTHV8dP/9jee4?=
 =?us-ascii?Q?5gQUQu9SAs4URciGF1GsGsQkdHjhedAlOhtCz1zGyFEppaLYlGn7vh1fca0v?=
 =?us-ascii?Q?oz/yCwd8/NIVYLH0V4uKGyTe44T7kUn5q019Up6WqXGMrpk8cJrZp04JJxci?=
 =?us-ascii?Q?uO7iX739dDiOBR3kPCWin4tFsrxX9tURaMXMVss1ePpJJOtfr4EfCj3jeVFl?=
 =?us-ascii?Q?Umgc4ncHHMvJeh0PFO5El8E5/rwk9/2k6GZQ++3/0VBeU07i3bM2KWRnixfl?=
 =?us-ascii?Q?BaauhnoloY+LZoQEYP67J3Sie1TP/K5Zu1lFRmG2q6sJiuc58WvzhyPl+dWt?=
 =?us-ascii?Q?vjokO9j/IrPnoGISRIdVsCFuVfyZxIJ5Xmx7Pdue0gefCN2ieE/QZuXXs9cc?=
 =?us-ascii?Q?SPLdy5VtmLBc6+/XYfzCkrQdguvgPNmyK4JTiB1aneLWksa6mficqi9pl3wx?=
 =?us-ascii?Q?8lqmxB4Entk32K2ZJPfBYNJp1U7oHZxvp1WHTKtLei3TMMIe6yGhItBpI/7d?=
 =?us-ascii?Q?oKKq6QvQmSlkBAlZRSMHn9L3+Jd3ef9jj5e5FhLGHucmlLVG5YLtAjUGRghE?=
 =?us-ascii?Q?raaKRODpJ8dIWXw9pYR7CxBfW7BqxKQe1ODse+BN5c4qUaVAoy8ZG10mYIj8?=
 =?us-ascii?Q?m9J5bejXUpnzHl108KwXoziAlNZ7eq34VKvbZrDjqae5AuesWFSkRwb9c4fr?=
 =?us-ascii?Q?csryAwkpYQkfN7b+sz19V+jvvtXThGI6C6+Ivu4rFxJPnGiBKrZsvv63YNwy?=
 =?us-ascii?Q?LTt8WWCM3+RILDEVP44JiGQu4oMwQ0yE/wOD/1TlYLD0BIx907hvCT6dWkaz?=
 =?us-ascii?Q?8ZjRkI3Utk2oinReadtd1MJZ3UxPB/1+vAJUBdtiprDVjwahMrcE33Htjhni?=
 =?us-ascii?Q?Mc2b5UrEOd0MnMEd2zcDYYPXSdC8H5qaxObkqlAV9zf98fwX9x4SiCQhL/sK?=
 =?us-ascii?Q?QCjsgSdmyCoJtRI1IGu2PErcVzmTo+/NzbNqpQZqtHe3c+ZjWs5It3aa5AQl?=
 =?us-ascii?Q?r1ui18G32+HOe8u3jVQnkubYaT/+tujWa/5k8CgPotfOvu9+l0TBJmaGIb4e?=
 =?us-ascii?Q?1xRyCPj5iZfrlC6FVbeM/oIZlBWH7tt0NPZl9ACugXUyUj+RemTRbj6Vj2TJ?=
 =?us-ascii?Q?j5p24d8jaauo9L8dVQaSau1J2JY6jm0TH6+ddrJsDwP2DVZWXx1f5D2Uw8gM?=
 =?us-ascii?Q?9kGZK+0b335+dcS7BH9Hrd/ge+1IsIAA/19yHdgWTIbGEA+/R3QMWXh+RcK/?=
 =?us-ascii?Q?zItIl5i/yXkSXBJF8z4SpNad/ZI/qOYzAXMB9FMIO3DoE1F+cgYJhxXJEglt?=
 =?us-ascii?Q?Ikvbi1xe3VBJelqn5Xm4hd+C9qNg64oDblFx9kQIKubChhX8yXbNE3X6aNDH?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f792abee-77a4-4c77-e470-08dd4c854b8b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 23:22:34.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6LzyO0nw8LZ9Z7t32ynsRJbajTaHR6A+e8DXjjhvcvujGydIAUCFx50YzssG48VG0Q+K626qojMDiDCgTmAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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

On Thu, Feb 13, 2025 at 11:03:22PM +0000, Shuicheng Lin wrote:
> xe_pm_runtime_put is missed in the failure path.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 56cb3788e752..761e00cb6437 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -176,6 +176,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>  		if (ret) {
>  			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
> +			xe_pm_runtime_put(xe);

to ensure a git-grep alignment in the balance we try to use goto
in cases like this...

so it would be something like

ssize_t ret = size;

- return -EIO;
+ ret = -EIO;
+ goto out;


+out
xe_pm_runtime_put(xe);

- return size;
+ return ret;

But well, the code itself is right and better to protect.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

just let me know if you are taking the goto approach or if I should
get this one merged.

Thanks,
Rodrigo.

>  			return -EIO;
>  		}
>  	}
> -- 
> 2.25.1
> 
