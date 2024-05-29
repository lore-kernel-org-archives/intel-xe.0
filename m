Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66A8C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 16:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3312D10EC3D;
	Wed, 29 May 2024 16:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOn1FRJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E20310ED7B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716999741; x=1748535741;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9Vs77w/+UoUb6VHWpqlaidpenBolfkaV7SCcQYC43BI=;
 b=eOn1FRJWBJcfIveTtuRwuQ2Kzpq9TZnIBlyBgnYMNvZlMCdEsICdJDXD
 do7x1w5ktjb7QbdSWb9DAaPPgBTe59jD3OjfFA/pt0iQ9T3YzKdeEt/3t
 DR72HyM56B+z9GeB2WOzt68kuynoG/OJhsplT6ciH9HfeOQf5lDydo3Lf
 abwH0XfhqYBFpH7svK5btyW+oSRBo2XPnVXks4blFUr0L7bX+6pzsO6/j
 rWQiJLmAU2RoV2a02+JrzPvst6JxwM6TjNV8owq/OdVI6MRcdOj/LhyXa
 3rLWV8EZee3TT4XWrW89C0HDDVZhoSSQ8iLcI1zS23QPW9ZVk3eFNbG8N g==;
X-CSE-ConnectionGUID: Y/Vz6KDHTZycplNfHM5XAQ==
X-CSE-MsgGUID: A8FslSB2R1OxksESrtqvsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13600025"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13600025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:22:21 -0700
X-CSE-ConnectionGUID: /G1Fgj4oRR+G6gHklXMUvw==
X-CSE-MsgGUID: Lv8USrwsSD2CALfoGjMeQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40348434"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 09:22:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:22:20 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 09:22:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 09:22:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 09:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gf5ShaBETb6BO6znn/BuZUG50I4U5juZCrhGTLJzGjtHHGgPVr0bXkAqzhLo0iLGnJE2nCwS2CR98Qt/Rf2Q8PJutWLXTh2GzN5p8VDoVpUB/wI+McSjvhZfxiz0eXw7FWd+vgR3CWuK/Z0kghlxbkbEmznkAZjrp+dkBlLZI5IB2RYcMN0k8pIqneuUDPV7nNRK/c+4OBPtpgdvW0Gpzh/pEZPwhLqFNPtEqXrUsUluYZbmhCFpX4Vtb+UP2JM/mMpwizMPSxWaGu7v2LUnATeOY8kbyMdDHc8uhV+IvNsD7JZgCjMtXi4zkcRIjYPQ9cgLeUQd/4r+wgZ2PRv+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fye9TrK3Md5ij0Nmpx9RUAo8GT3FlBgXugc6p+8GZjc=;
 b=N/bsC1wLKeR9NDXfkYrYRxeEfjyfT0HNikTDpY/I8xvUTdnH/nyHXvq09WAy/dpg2vToOArEgv/S7P69VJmQgNq7JWkdRyKZME23O20Fpj5qufo0PQ7Xi+Ow+myh5iBacFxVFbNAxQoCtmrKqEtYcNcB+aztsi7cROIuuj1kH/y/FAbTuhauxdsgur0kD2H7BzcLH8zmVYoQg44R1PpscPFkcgkoZgHuNh0vgCkPKccnnPtPnONWRgxYybg4ZaZtlIK3eRfrdLjkJD2ijqjQU9jFtiFnJ2I9PRIwtI0C2IGdSM9BCdh8zhqEQnTQ3E6aHf3tGGjMUI0rCZCtaAvdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 16:22:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 16:22:18 +0000
Date: Wed, 29 May 2024 11:22:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
Message-ID: <ejic5jiiimzbx4f6at2tjin2n4evdpvh6lk4afefgw7vo5vqim@57k4spcjrhpq>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
 <87bk4okfb4.fsf@intel.com>
 <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
 <875xuwkcg1.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <875xuwkcg1.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:303:87::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: dd493943-d8d0-4bb8-7182-08dc7ffb82a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bvhK2kE7CPPQoQuhyL1iJxzpn4htwrEAJ1qqdh+8i9Uy39txE4puVOcU289k?=
 =?us-ascii?Q?f34HlKNfJvSTfwRAL5Yd5JKsLjs61xg9P/+V9t9LKEstGKuo07XSBKcdjCzL?=
 =?us-ascii?Q?dMn3CNg+GbG1jIKTrNLXXAX7oerx6TNZZUh+e8HUDNK1HiF2FWE+zaoQF3s/?=
 =?us-ascii?Q?Bxs5NzjGgJv3VLRj1pHg576cpUITUnc4sXsyyS0zS+YH492apnj6GTvrJewx?=
 =?us-ascii?Q?nGDf7QZKM11K/ElxRClsmq2ABxhdacVSQ0FLk44LpjcfqciM44/iA3QiTZm6?=
 =?us-ascii?Q?kheZVqEymN5D5RK1wn009VPsKUmFRiBN4rA/kygV7Q/neFAQLRMbc54gElu8?=
 =?us-ascii?Q?yLGs2QZVhosW14Cegm5b+67LJ/S9EL+AwNhHbl/E75iOrxe8c2a/O2K39oTm?=
 =?us-ascii?Q?+6iiFo5I5ZzHX7g/10H9dZX8x2grJ6wWPz5iM/jhYGWqDHm7G58/Lo5qh/m2?=
 =?us-ascii?Q?OKX1SsWYJ0Aqgrxybotz+R7bbAzlQACTz05uLd3P7mp4skblAcjmJkL3bOzC?=
 =?us-ascii?Q?I3BOk0fjFyonKELkhbJBlYNAAdYlY0ODLgBK0gxGGIjUwl2xmWZqhokvGNch?=
 =?us-ascii?Q?Mx9Z+yNdsQEqWl/6Tg3RSGarfXf/xqCaKrHkQTqmrCwM+gyv/trPi3Z+kFNc?=
 =?us-ascii?Q?yt4PlmyXkNe9jTRONYE2bsUKCtxCl2rc1VyUI/bV3bhJrRjitZLDSLIZeBC3?=
 =?us-ascii?Q?0lj4prVLoCQ5b9vf2kfVibj5gdAXNHil/lALPgWElepUPdjF5yIhWvJIsSTv?=
 =?us-ascii?Q?Zha1hetYyn+cf4JMDNRl6gYbRlHbEHvShmuom77BY6XXwupHvgy1zEQq/71y?=
 =?us-ascii?Q?RBgl+TQbXEJAHphmHKkMFpnRrh0A2W298BFFexEqujhrAVarf6BARvldOluQ?=
 =?us-ascii?Q?ruuHRLZdFVNEGY62tArYdZRIfAHLJYc4taowFLA/sVT9NCe2uBQbQYJlvdik?=
 =?us-ascii?Q?ueb/zvoRdFwJSRJl4CjgPLYKjKN6winQNXw43pDWm3cix8lQ9mXsQUaiqsy8?=
 =?us-ascii?Q?EGCuB6BIU6Vm8rSKBc3jm6TKTHmiII2H876mvd1YG3ZiRuEYm/gOocyERBJT?=
 =?us-ascii?Q?2jhax7IwgOJMNxDLJSGWq1Wy6/8PquqVghbuldfwaiFcw8474mrIX1Ksd4Hw?=
 =?us-ascii?Q?B+1oAlhkvRjvIwF41wBSjaHh6It1Z2+YHe3ECswoiLsNLOSL4IGKbBTikOMC?=
 =?us-ascii?Q?i2cDK62Uov1U7y4mCbfiOmBFELqYgi1gujMx65Dkqqd/AqQ/+XnGOQWqsGhm?=
 =?us-ascii?Q?RHwzMMFcEWKpKEediPA4xwOSbQuzEl8kOFjHvav8cg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CxmLoZEmHERRQKcH4DZZWQHSl3rJ3GeBKcgtFSiYRc+4i4CWZU5NE22WhRrS?=
 =?us-ascii?Q?aWzCa8xhJNSyPIQ10QBAmKyCKSrIJ0jMCHecTyE3w7iGc+HXsBu96H/Vkxev?=
 =?us-ascii?Q?79Yc+e9/wgu7mNBvOuUQ66TDU7o62ggzLuUWEWRnE49uXh38uUnJC0L52ZVi?=
 =?us-ascii?Q?UXYYf1mkfD6w1J7TKEPbPBvpbosEL0vqEVN1CfcEbwztbKG5GIuwqUTZ4bVr?=
 =?us-ascii?Q?4FP9nZrACxzrWigd+X0YrobJEJ6GJR5ollCarlH23sLLxVDoo8tab0XupvyZ?=
 =?us-ascii?Q?M9QMDTQXlPHjxb0bn+3DSy1/Rn/XMo/6aOjzOSJ/p9A8p4xZ79xVrEmWr4Ex?=
 =?us-ascii?Q?78Jz7fIbIWQ4i1KfnvVKgFEH6xtdnKU/gVkVkk3Lje4z/MiKdTCLxbcCv6Uw?=
 =?us-ascii?Q?MnhdnrxzDuP5rJ0HcCe99WDxTz/jwFasMzmpRuensKQZX9RpFlA39MwA87Ng?=
 =?us-ascii?Q?t0yAu3KWpFAhSEAm9WxlWAbvUIX87sawT0JWvbdBzvg+Y8iEt7bj5esoRcZf?=
 =?us-ascii?Q?q7Zz3uY5oSL8fDFkjNu7M3m+iBKAA7n+HgMVIoZoPo/8714m8RnkjwQW2IlC?=
 =?us-ascii?Q?PImpb5Xzq4s3p9+6ca7NqmWZXRAyczmSVcPYzEyQDS7CnSWe1qW1k5y6nKCY?=
 =?us-ascii?Q?pXkzRYCCyML7eYylWqKd1EuxGZnfK3EStwWk+lnsl3rPc1BNeGWdsFbqYTx/?=
 =?us-ascii?Q?VzIa6LhnsXSLyYRNRWWY0Ry2WePveF+Qf2ixX+ZCw1re09oZYnP4Ohbe3i+T?=
 =?us-ascii?Q?Ai5SLAr1zjd9Exh/rioo7ySx8TUOkn/s2EGv4mEZnrQOCZvggmIQHSv027yo?=
 =?us-ascii?Q?fIGtPTu+EO8DEktyBVKUVo4zg4ugJdRApWK1YxUc8XTQi1N/h2REZ/WW4fSM?=
 =?us-ascii?Q?EAyg1JpK6pTHl6lhGxl69Xg6+arewVNXsaUNlDIr8VgMdUOs4BmAKtVPiuyC?=
 =?us-ascii?Q?Q6Sh1NG8H5k7jp5cX+NeGv9ZDNr5E8GVRcbRtm3rHBNyiavxSugb6xjCRvSg?=
 =?us-ascii?Q?wR1cm7S+2aab5hXFfqMGkXtgGwceR5KAUUWRtCFmDLSMEA/U4UgOxk1pcvRI?=
 =?us-ascii?Q?Q1s2k+Lvts6z3mgML3M95K82hhMtvjic0zaFn/v+vw1GRwRKU1E5lbNYQjef?=
 =?us-ascii?Q?Ee3SNgpAkGCVuz2RrH5Rdla1OP3W9jedB3qaZYN6l4ZIjAOnm40G30+rDRgt?=
 =?us-ascii?Q?CF9K/hkwmSM++gfSLK/ZhODSA0Ho7Xo75XZ7jqembQu/uoSu++vR9LaH1I9F?=
 =?us-ascii?Q?v2E3Ihb3mDbR1DCpvar/WhTCmHTu0QNOPFvnkTt70MOqkR2tFFA+lR+Vqj33?=
 =?us-ascii?Q?fcLCwJhWZ6UKnCvQGrvu1T1prer1GDe65Dv0OsVaBGgdcMq5TlQZzqYtezbk?=
 =?us-ascii?Q?DpAkEQZoSzLw+NWGuM4t+fz2Xe8j8MWN8oBlvL4Rd5N5kGqbnmYzgdGt0/a3?=
 =?us-ascii?Q?wIUNJp1wn8wJW2waamo++oleWDDBAuVfr+0Qgxt+jXS3V9L0vbb7E27xTOdq?=
 =?us-ascii?Q?v5CXNxhDVKu93KX/MiJKCDivgi24XJHqU3s4Lk4J6QwX0BG1Rv7YZr7Tve5B?=
 =?us-ascii?Q?oHqw/XLoCMiIPcQaSofuR/Ot91IKbj4HSjyGJtSjotPvVT8YqgwQGXGoWH3r?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd493943-d8d0-4bb8-7182-08dc7ffb82a7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 16:22:18.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+iE2/PZJOJ9erk/1OnM6YqwEgNOYACSoHF5hAaBHiNNi10HmcTQRV9sp9c6iqw5SDpkoBIShZi5evBRLaf6gJ+8fitVmqonzdLziYZRsDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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

On Wed, May 29, 2024 at 03:52:14PM GMT, Jani Nikula wrote:
>On Wed, 29 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
>
>[snip]
>
>> but then it should be treated as an exception, to be approved by the
>> maintainer, from general guidelines that maintainers can still document
>
>I'll just note that I only provided some points of view for
>consideration, won't argue them further, and I'll just defer to the xe
>maintainers to provide the guidelines here. (What a nice feeling to be
>able to do so. ;)

I very much prefer dropping the prefix for static functions.  If there's
a clash with a global one, either a) you're including too much b) you
should use a better name or c) the global one could use a better
name.... An often we can just add the second part of the prefix, just
leaving the xe_ out, which makes those clashes go away. It makes a clear
separation of what can be use in a single compilation unit vs what is
calling something from outside.

IMO platform prefixes and double underscores that i915 uses are also
bad:  a compilation unit should abstract it with proper layer of
separation, otherwise it made a bad abstraction.

Lucas De Marchi

>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel
