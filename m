Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3368FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1FF10E0E2;
	Fri, 19 Apr 2024 14:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVBtd9YS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2310E0E2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536868; x=1745072868;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=BwmzP/I4tnng0/6NFMAKLbxizeIDUg3DYtl9rirdjOk=;
 b=BVBtd9YSw1DqlgmckOI/3oO+vCE06sMiKV5YxPumcH8FMzlV3k65CNce
 jhyDSt/5/HEi5n2iNhb5ZmlnickYV4UX3whepAOrXJoYPZ3ctTiE0LCmv
 x94cjVaQCe8BO2wLZrRzroOQpf1q1KHHmcYjZIIxm0jXP7kVFzF3sJMcS
 nOLOZOZNfrNhUUsu36/eyO5MB7n1PAWXNA1cYOhBDo9j5L84UAymM1+Ur
 3Avc/4Fy7jwJmHUFvU+sCv32VWP3hMdqmmfomwMr8M8UQyy5ftBm40+6n
 MYb9cRkDocO0AFDULDplM/YNpoWoY1oXCutv34gLhmG+8ga0kn9ZdwzkK Q==;
X-CSE-ConnectionGUID: BEjmrHgXSvyKb71358M3+Q==
X-CSE-MsgGUID: ZkEiKE9FQ/WQIEn7iI+bhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9296125"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9296125"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:27:47 -0700
X-CSE-ConnectionGUID: NpCoDW5TQIy+jHj62iS+1A==
X-CSE-MsgGUID: IBAOZeBbR/iRK/vBul4xvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23213299"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:27:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:27:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:27:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:27:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctz2JwsQ+tZu+LazD4EGIIXNnHwdXdQhjTmGNCjNA0OCYMUu+K9PKLNE6nG8uZYcjOURsTa9PYB0AKEcGRCt59PxPVdqSWz63otBBfw+sgUMelBT9P0SDUv+LGfJTz1RrsDgQzF6ei8jDeTnHsusAj2rysbVjy+w80j+4GgsGlS6FiCA3jXBsGrMwemguJiYroZdSxLVCwjtit0IHcyJU20MxP/FPGBD2ya7HYjgP+YnoNIpRejPl/dJbgWEQsd8kmLLkRSI4hUuNQ63H58rxvRJKCguRnJtzjbAWG4jb8a5t/e6k75cEVbBCTwVpMngReeAw2IkfM1VdHohMg30/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjUwQ8rshZO4kd7pXu9Ykpv3HppD054/Tt1drUFhVq4=;
 b=WljzNcwp7zpem4WhkBjH1X1aP3VM0EOGqaNpeMFBh0uplHHkC9xBVZp/OM9wktARCk+rDyU5OcY6ob2udUPdrSjf3M7HSPQ3IthstCeeu/ZU7pVMTBCz+khPPqo67Zy2yjujaArRtluQSFhNqDy1fgnCjLVZGPBob/OBHNCT0uWLDxTgmR+bM0GpV5BlrImJgILZtW9Sf99wDEYmoKCFSCcwmEhRrSidhuYLeqkweuKIkzWVPA6oBXUgkYfNRQH2n/JIlnHY0VatLNDrZuCwfe7eWbwYwY94Ls8fRX6iKLXa7/Ip7Z2POGYyg1RHd5JWt4tXmS+kZ0DPWVQll5fWCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Fri, 19 Apr
 2024 14:27:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 14:27:28 +0000
Date: Fri, 19 Apr 2024 07:27:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkZVTEw6IHN1Y2Nlc3Mg?= =?utf-8?Q?for?= drm/xe:
 Define all possible engines in media IP descriptors
Message-ID: <20240419142725.GB5615@mdroper-desk1.amr.corp.intel.com>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
 <171349799931.1519312.16607038910578328067@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171349799931.1519312.16607038910578328067@8e613ede5ea5>
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: fa39a837-d1d5-45a4-9435-08dc607cd742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrfuozDZDzPYI7mMxjevUpBfIug1I3Hj9bD/DkAzmW+Uik9XFEvlrW3P9shfQQFgLoySBLFAkChe2ESvE2Sbc23QFrB58XMQyYZixP9o90Y2jChPpMT19cw9bMklGDYcAMn447fhlyCLBA1+fdKD9gFvRLyLBk0uaD8KAZsywHCIeeBa53gtO3g2+5Nx2q/A4OLZxQDN09XWLN3o2MuuiGXob7S5IP+9jNNV03yjBxcbUBuHbfdEKUr0Uxcwzw9i5WKPn3XCYiM24TP0yZdJ3K+/rlBse0kFnGXL0TOwgC5g99yQ/GUsbaCqMkNKGDT6KtK/d4gU0wsTcX/3UlWpIpAs8oQMioGVQ7pvyCi0rapgXw2d5hSXuVnOqGDORsNW+l5sms12Y2D3UXvV3n+7xxhSDx+aBJDqb4U5AMiie6SsRUE334mmpFkYTlOpYbqiTgJMX6011nROoChMHpQWq80K7hCN+1zPHjsuoRANZ+xmHWgRPIRWCEKqGMsOSgU4m74N4yMYNy4vGvkiWxe6jracEYbvTox/oD4ifwA/Oy7AlPF4ZTAAHUnXaY8TZg+bE8zrxS6dbN0l8wS9+cGgoO6Tc5QVcOzZv3dba0fjdKdtWpJ3qoHbLLxixQ+0gABN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDnenS54BhPSWM+Y+cKx9eOqzMM9Fu4rkp+3QDHltzsGAhPJFp+SeTnEIMZN?=
 =?us-ascii?Q?HH5LrZX+Opu4FctO+N59+8prkDFjtiILX1Q1OYoIFlR2oXQNCwORk5KVHkAw?=
 =?us-ascii?Q?ym0Tha+xdQDh3rP/qHeQNlXGazTdW0tuC71uQxHs+ucfjVecztYDUMYDiJqs?=
 =?us-ascii?Q?qySav9VGoK5V0H1hHiN4fRHcy6xV93CGSvqf/D+fVc12hu6Kyzndb9Im9N3i?=
 =?us-ascii?Q?cUJC5fwuZBw5t+/VT3wwTxjbKt7jO8tKh8Vd14P+l9rkP8A99PCyOILzoLlc?=
 =?us-ascii?Q?XLrMzM1CDtuPALbZMlqv1+O9txoEp3GIE80j46rBP7ue5SokCMXCw37ASAS2?=
 =?us-ascii?Q?rm7TieS0ma6V/JKT6WGHR2P+NT4NlPVtRTSeIYtTSIBqBbInEf28Wo55bdVc?=
 =?us-ascii?Q?MGafdOQxXkt7ckVT7l2t0C3okw8YNJs8CrX3JWWnm/Ip/1nBu6NTM7qC7snx?=
 =?us-ascii?Q?xr/21an59QV89l8B1PlNZVgbZN5EY2nvc86mLd/3YxJAq4BDQ1jKk2on4/T1?=
 =?us-ascii?Q?Q/e9zaMW0FQDs5FYgWv4aZjM/YecZnJR2omSLhxVGU0C/ci9W9PYQ9ZYY34H?=
 =?us-ascii?Q?914QSO6ck3MAaeGN6MmewGPX/HK0r2439AzqvfE2p46/PAaepqbZQyd86UYm?=
 =?us-ascii?Q?xA8YR7aLkmvDi0qrsKaAY6y5y9Mgb8zDTEQzGQRwE4hXqMHqAboG9LfJiYsy?=
 =?us-ascii?Q?DbeZBCn4GWMieGAgxCy6ERFM9TXPhIakBfiA1FxDICnuQtL4B8FcQk1XYj/r?=
 =?us-ascii?Q?Bk26vR88HQOEwMSkzY9cISzPVmevCtVj724waHQBRbLhM31+YekbJruWUzDY?=
 =?us-ascii?Q?K57rCEnntjwc07OyYVNjXBsoXV6Cpf0npPLvzJPEFAJKH4Mjg7aWSJk5P6LP?=
 =?us-ascii?Q?l0vRm2URD48qXxjdXvOy/CRpCBXqoXJnp1NvAit5byq1u0Rzki49dcyw0Vme?=
 =?us-ascii?Q?WqdqD2jXLVAhsb08/M4D7lVNlU8zA6KeXhTGLFj4aUtTo/eckoumwB4DnSKt?=
 =?us-ascii?Q?5442ctQ3fpcdDElbFAg7JfHW0olJ5eKBtxUQJz+L/ffA9NekwKgi6jrMbtaY?=
 =?us-ascii?Q?TCH/bJNVdMw2Icpay9tr3wuUMRpB4MeJ59dv5YQHX9b7yxbhpbHn+HThiTE5?=
 =?us-ascii?Q?NLWLDBeaAibBVGPDpQQq/qFksK0kokIaUy817RkVZ9leaKYxTTLHaVSTf+uW?=
 =?us-ascii?Q?KbCcGHE2LQCW/4gg26o1xfLZfRZShWAbMYOyGcw2Ic38Ce4HofpNIxdYCOoq?=
 =?us-ascii?Q?nafe2PFws7te5bIyj3x9RsxYKQLPZsr8EjPdqn37yjTu/ZF4XPogrJmyH/2x?=
 =?us-ascii?Q?rQGI1VaX5yCIntojoiEY5Uu/p8m84FLlT6PXF6FTWjCuxhaTYN4+lv28TQlZ?=
 =?us-ascii?Q?bKwqMzrT0P5QeVOvoT9OAdlXpbTgGQh/yb0R26BDfrkfulikK0sDSwTnOUFi?=
 =?us-ascii?Q?Ae4wIHZFlGENUIwRinOvVLU6C/Pmr3Ga7nwZTkRsd9I7Dj2j/MeMuSNJo/zU?=
 =?us-ascii?Q?YNZ0lGp1MQtXrMdQjr3jxpqfTmtNwRw9HJSDxAQNM70rPaIy7emYAw+EZuSn?=
 =?us-ascii?Q?IWHxdaeuxuNhp/Zp2Y1i39f8hF5igTZyZ31dGQeIANx7l6p1d7Wr7NDHNHgV?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa39a837-d1d5-45a4-9435-08dc607cd742
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 14:27:28.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEdq1oRHO6UsnSQ0erh4Sh0p0moOI8mlaLAxStD9yDRt3tJotgu93J68MkDNj1uDVwNDOeItUug4REXQ3CzaqfD/3sGiGcYpowtvUgGN4pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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

On Fri, Apr 19, 2024 at 03:39:59AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Define all possible engines in media IP descriptors
> URL   : https://patchwork.freedesktop.org/series/132568/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878_full -> xe-pw-132568v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Lucas for the review.


Matt

> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132568v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1214])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@core_hotunplug@hotunbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] ([Intel XE#827]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][10] ([Intel XE#616]) +3 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-7.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#1178])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1204])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-move:
>     - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_cursor_legacy@torture-move.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214]) +5 other tests dmesg-warn
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a6-hdmi-a7.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][23] ([Intel XE#324])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#650]) +47 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_flip_tiling@flip-change-tiling@pipe-c-dp-4-4-mc-ccs-to-linear.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195]) +1 other test incomplete
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#616]) +3 other tests fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-dg2-set2:     [PASS][32] -> [FAIL][33] ([Intel XE#1203])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@basic-rte.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-adlp:         [PASS][34] -> [SKIP][35] ([Intel XE#1201] / [Intel XE#1211])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_rpm@i2c.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1149] / [Intel XE#1201])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][39] -> [FAIL][40] ([Intel XE#771] / [Intel XE#899])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#899])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small:
>     - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#1259]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-small.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][47] -> [TIMEOUT][48] ([Intel XE#1473] / [Intel XE#821])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][49] -> [INCOMPLETE][50] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@xe_evict@evict-threads-large.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#288])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][55] ([Intel XE#1214] / [Intel XE#1329])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#1256]) +1 other test fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-shared-vm-rebind:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][58] ([Intel XE#1169] / [Intel XE#1195])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_threads@threads-shared-vm-rebind.html
> 
>   * igt@xe_vm@bind-flag-invalid:
>     - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#1559])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_vm@bind-flag-invalid.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs:
>     - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1200] / [Intel XE#1214]) -> [PASS][61] +1 other test pass
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-fencing@2x-outputs.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][62] ([Intel XE#1388]) -> [PASS][63] +1 other test pass
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
>     - shard-adlp:         [SKIP][64] ([Intel XE#1201]) -> [PASS][65] +44 other tests pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][67] +7 other tests pass
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][68] ([Intel XE#616]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_getfb@getfb-repeated-different-handles:
>     - shard-adlp:         [SKIP][70] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][71] +2 other tests pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_getfb@getfb-repeated-different-handles.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_getfb@getfb-repeated-different-handles.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][72] ([Intel XE#718]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@xe_evict@evict-mixed-threads-large-multi-vm:
>     - shard-dg2-set2:     [TIMEOUT][76] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-basic:
>     - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-basic.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-userptr:
>     - shard-dg2-set2:     [TIMEOUT][80] ([Intel XE#1261] / [Intel XE#1356]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-userptr-rebind:
>     - shard-dg2-set2:     [TIMEOUT][82] ([Intel XE#1206] / [Intel XE#1356]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr-rebind.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [FAIL][84] -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_module_load@many-reload.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [ABORT][86] ([Intel XE#1205] / [Intel XE#1216]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_module_load@reload-no-display.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_pm@d3-mmap-vram:
>     - shard-dg2-set2:     [FAIL][88] ([Intel XE#1221]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-466/igt@xe_pm@d3-mmap-vram.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-464/igt@xe_pm@d3-mmap-vram.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [ABORT][90] ([Intel XE#1538]) -> [INCOMPLETE][91] ([Intel XE#1195] / [Intel XE#1538])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>     - shard-adlp:         [SKIP][92] ([Intel XE#1201]) -> [FAIL][93] ([Intel XE#616]) +1 other test fail
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#324]) -> [FAIL][95] ([Intel XE#1204])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][96] ([Intel XE#324]) -> [FAIL][97] ([Intel XE#1231])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         [SKIP][98] ([Intel XE#1201]) -> [SKIP][99] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-adlp:         [SKIP][100] ([Intel XE#1201]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-adlp:         [SKIP][102] ([Intel XE#1201]) -> [SKIP][103] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cdclk@plane-scaling.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-adlp:         [SKIP][104] ([Intel XE#1201]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_frames@dp-frame-dump.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>     - shard-adlp:         [SKIP][106] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#373])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][109] ([Intel XE#1178])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][111] ([Intel XE#1204])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-adlp:         [SKIP][112] ([Intel XE#1201]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][114] ([Intel XE#616]) -> [DMESG-FAIL][115] ([Intel XE#1162]) +1 other test dmesg-fail
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-adlp:         [SKIP][116] ([Intel XE#1201]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#309])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-adlp:         [SKIP][118] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         [SKIP][120] ([Intel XE#1201]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#310])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [ABORT][123] ([Intel XE#1191] / [Intel XE#1608])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][124] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][125] ([Intel XE#1214] / [Intel XE#1608]) +4 other tests dmesg-warn
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][126] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][128] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [ABORT][129] ([Intel XE#1608])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         [SKIP][130] ([Intel XE#1201]) -> [DMESG-FAIL][131] ([Intel XE#324])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>     - shard-adlp:         [SKIP][132] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#651])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         [SKIP][134] ([Intel XE#1201]) -> [DMESG-WARN][135] ([Intel XE#1191] / [Intel XE#1214])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         [SKIP][136] ([Intel XE#1201]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         [SKIP][138] ([Intel XE#1201]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-adlp:         [SKIP][140] ([Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         [SKIP][142] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-adlp:         [SKIP][144] ([Intel XE#1201]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         [SKIP][146] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][147] ([Intel XE#1129] / [Intel XE#1201])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_pm_dc@dc5-psr.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-adlp:         [SKIP][148] ([Intel XE#1201]) -> [SKIP][149] ([Intel XE#1122] / [Intel XE#1201])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-adlp:         [SKIP][150] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#929])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr-no-drrs:
>     - shard-adlp:         [SKIP][152] ([Intel XE#1201]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_psr@psr-no-drrs.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_psr@psr-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-adlp:         [SKIP][154] ([Intel XE#1201]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#327])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-WARN][156] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][157] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][158] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][159] ([Intel XE#1214] / [Intel XE#1608])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [DMESG-WARN][160] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][161] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][162] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][163] ([Intel XE#1034] / [Intel XE#1195])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         [SKIP][164] ([Intel XE#1201]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#261])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-cm-threads-large.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-small-external:
>     - shard-adlp:         [SKIP][166] ([Intel XE#1201]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_evict@evict-small-external.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_evict@evict-small-external.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>     - shard-adlp:         [SKIP][168] ([Intel XE#1201]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch:
>     - shard-adlp:         [SKIP][170] ([Intel XE#1201]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-prefetch.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][172] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][173] ([Intel XE#1195])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_gt_freq@freq_suspend.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][175] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-adlp:         [SKIP][176] ([Intel XE#1201]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#944])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
>   [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
>   [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
>   [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878 -> xe-pw-132568v1
> 
>   IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1107-564a9518652dca0f0eb31bd5ad321f8dd90ec878: 564a9518652dca0f0eb31bd5ad321f8dd90ec878
>   xe-pw-132568v1: 132568v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132568v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
