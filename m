Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A472C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 09:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4212710E7D7;
	Fri, 26 May 2023 09:50:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31F710E7D7
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 09:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685094613; x=1716630613;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YZplR0wBOnHrOxkAJ04tQPj+u+oWEDsCsKK9BzgijYA=;
 b=La8WtGeP+CFz+K33nR2GpwaGjMko4v7gp9+D943MjmvZioV/MOfEatzU
 3MyxWzcp7mA6xGLk9RU+rF4JPbv/GFKIIYpLL7qA5JycwM4kO5Eok8lfT
 bVS4B+pwOD8jrq4cLjNLef7S8/69DFM1jwaHmK9JlPVZrNB7oNP23nOix
 47tEU93nxmZ85G1pcOOgdBHPJJdEcaO4ff9dQZKvqWKMdPxU3H/Dom9yv
 g3aryPfmYLQLG2wzQ1sVHt38MNq/tdmFfnnVrEorXfxcubklUrI5yYK/+
 qRYHu/4/fIlXsYHm2ZSR7qOx4iSsgkJCDG1QYiUJgbDd3mIcdSgNYwtFw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357418722"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="357418722"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 02:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="682672342"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="682672342"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 26 May 2023 02:50:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 02:50:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 02:50:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 02:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRKWQ0/6e2VoWXstL3sMPDjSZ4YSm1y4B92fdVQYSn72h9qUmAHQvDwij7sK2B5IFy9X+hEEgm9D77byqVtkT++G+UlXJvPAHQo2zHEBSQ9t/82mi8P/dBknq2kBT0VZ20FbwdZnIkIofZJESKxmib6H/qk+ojKHoF0G46uhoxH1W30qwmzbW50Wy9qGqTWeTZFUigcOXkRAAS7yqcFs2CgrLvbZPgf210vXTO+tWUSYvIYFGRaON9WUBDNzk9B4EFxh6Hei5dnz0YKoLPgeUs0NDHA4bcoZK0ghfpjLi5C1t3A5FolVpWj80ZLe7XV/WZofKO04WMl+LVzxez7XtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6VWdl7eH5Dhlilwe/kU0Iv0TjJPvjvh3la+bVH5A2s=;
 b=JejbvhT/AyT2lUfBEariEM0HnBST2AjxhE7kgQ3iHdGeD96Z/ixYh2T+q+YryglxZoL/Wn6g/P0CaKYxPZlv4RDS+S2asEgow7f0iM3xm5+aMsmoDAF3TRGE4VyRtL3XXt37PXYJuyj08EqO8ox/GTgfDADwxswJCj0YTNwOmHCIbs3daIh+sCgk/kSLYDEmyn4U4eJDWkSLNHRCLkKxYU+BMNWLSxvYX9TpZ38pdWjYWDBrsy13dYOhHAqlRqgtNoh0MByAn+mfpeBLFx2Dks5Ivj8goBIXBkVSGUhk9bvQvOzgqrDg6p9XtGZYuKUXV3hmJO+s6LsoETY6a77rmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Fri, 26 May 2023 09:50:05 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::f6a:a1de:83ec:b111]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::f6a:a1de:83ec:b111%7]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 09:50:05 +0000
Message-ID: <f4db1695-6ede-cfe1-7be0-97490e28d886@intel.com>
Date: Fri, 26 May 2023 15:19:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
 <20230526004235.745730-3-gustavo.sousa@intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20230526004235.745730-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::14) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|DS0PR11MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: cb859b9a-4e27-41b2-ee4b-08db5dce94ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dK08YOpwzhYUntPmP15c9XdtxkCPUPGDm5RS5UnIJacPab7G4pvGAweMhOcJqcDbVAoPgPL+xLk9jgu0sOBvjF8DMHRYdFZUXRMifuczqCrCS939+2Xprc2PIDGswPVrBy1BuPEcGrSOK5T8Q/riUcurwR3STNajHQ7/Ip26nJaSZpuZxO0VPMJTgrTYdv8rWJcjk62etrLgyIuWDNSfmnBMHO1Az1b+WpIn3sKalfDImD/mEO8igrhKuoiyrRnZaHSmBnONSS4h3envl7McNuPYyaQIW5pMYRTbmBQyqSUWn9ZtpfrLbWr+El7WHGxk7dpASEuEx+f5LrwjumATbPEdTuFvPqyA9za3nfNKjjG9Zne1EfOp0im0tbRok7ecqeH3oY9iWpqy/LcowIS9Pw1sib8dhuLFJC4Yw+G62mu/t1fbIL1WN5FZc2fc/0tZ1ThVXMw/B5jaOI8semd7AFOlrplJ19qnXjHU4+Ucjapjx9bYwWqY51WSbzEHTbNGXi/U7Gz7RE9CQghfD9wtydhQPTPb1z2xAQ5lEGyekDQDYTkjk6pkgtAPrYdzlMJFdWa03utow4bEVO40VWqouwAb9Vff4Qb+L6os6jKTQmtcu4yuW6v4bMFH6Bxv46h39nxWkCiFbQu2MvwF9OADlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(66946007)(478600001)(66476007)(66556008)(6666004)(41300700001)(8676002)(6486002)(8936002)(83380400001)(5660300002)(53546011)(2906002)(2616005)(31686004)(316002)(38100700002)(86362001)(31696002)(186003)(82960400001)(6512007)(36756003)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0s3MkhydlFpYStOOHpYS1FqYTFZQjVlTDBWK3lJRk5ZK013THY0SDlqT0Jz?=
 =?utf-8?B?Mlg4RHZKamgyUzd5cjVXZzRiSFU4SVYwb2xpeEVuVGFIUFZMbm1ENFVLbEJG?=
 =?utf-8?B?QTlFVlVRa05KUSs3Z2w4b3d2RFpvdDIzdkJvRFdOQ0lDRmx2cGtzNUttaFIy?=
 =?utf-8?B?azlFdld0TTR4MGZseGUvOUFUaDdydTBpeXZYQmppbUxHUHh3cFdIN3gzKzFV?=
 =?utf-8?B?M2VZM0ZBemtiLytwK0g5RVVSWXorWFBkKzRtR1pBV3lJVmZST3JIeUFpNElo?=
 =?utf-8?B?TXc5REJPYnF5YXgzdXdDbEkyTWNjazhQallMZHhic1RKb01xRXNJbEpyVm1M?=
 =?utf-8?B?MFVBWERaZW9CTUxuZ0ZnaWFJbVFXRWpHUTZGMWhSaWF6cW1YWXQrS3lXcGFS?=
 =?utf-8?B?a3p3VDIwaUZJYm0wbGJXaFJTTDNCNWlRYW5NcWRPQ3d0ZW9VWUdibWhCM1Vx?=
 =?utf-8?B?ZDdUZytNeitoeHBweU5xaGcwUUp2OG9uY012aGVadVF5cHVEalp2am9QS1hy?=
 =?utf-8?B?R3hQcmYySUE2QkNZYjNha2ZPTlVxK3F2RDM5QWIxalRJUEs4TW9ERUsyS3Zs?=
 =?utf-8?B?a2gzN043ZVNsWE85eHAycE9uYmhUM3dNOGZNakN0R0RnSTY5Sk1aakRPMW8z?=
 =?utf-8?B?WlRFUDZyVVVFSEp2N1NwYmwzYkFDRHJ5MUxLdTV2UGduOG1kcURUZ1MwVFpN?=
 =?utf-8?B?N1d3eXRhUXRnQ2xscjB0K2hDVUhYWENBYzR0eC83eUh5MkU3RjdBajhVWEs2?=
 =?utf-8?B?dnNnRVlQKzRTTmh0Q1dmdm1ZVlBxUTh2MmV2U3NDRVdaK0c0emRBejVkS1Ax?=
 =?utf-8?B?MFNLNEhvKzBhN2NvTENhTHordkkrNjFERkNRV1ZNaU9haFBYOWl1YURYOWVD?=
 =?utf-8?B?OFhRSDRxTHppOTAvV3pZZ0QrREZnSnUzbEM4Um9xN0NubHNsVFNqSHJ4Vldj?=
 =?utf-8?B?UDg1Q1RBSUFSbVNHeUVuVjdSc09xSkxoelY5NUttMU04aXRucDRQUFN4aVk4?=
 =?utf-8?B?SkU5UXJPbTBRQjFpWlBEZzFxMWxsUlhseXo5eFlmMWhFVE5CZGxOVGM3UE15?=
 =?utf-8?B?UHRwRThzUTZZK0haZHI2Wk44SFlvTkg5clNCc1YvSCtScWd1TERpc2VBOFlL?=
 =?utf-8?B?c0dCZzZXZnJ4RmhuWjhFb08vM3g1YVFSZE5GOWozVTVYOHZ1UncvZmVkbmc3?=
 =?utf-8?B?b1JKMStKNk5EV2xFV0xoRDZJZytieUhFRkZVRGs4aVR4eEI2SGxROFpwQ1RS?=
 =?utf-8?B?UjZpMkZ0emxyTUV6ZXc1ZlBuWXRiZ2o2QUxEdEF5YkpjZE9CaGIwTzB2MEs0?=
 =?utf-8?B?cm95cHpOZ1ZjZ3FLbGhhWG1JaklDaVZ3cmxNNTFkQSttVzBIaDJjR3lpRDV4?=
 =?utf-8?B?VHc0bExQUkdHRWZRb25IWnZoZ0RPSVBqaHNhbllNWEc4RXozTnZNOVc4ekt6?=
 =?utf-8?B?Wm10b1Rwelpqc0YzL3pmWE9FOVllS2xsRkdOU2FSY2dqTzY3YVJReTFaVXNB?=
 =?utf-8?B?RGVJVm9CdkxzbVJYK1duSll5bll1bDYxRUJDOW9sM0gvOGJjZ2tHUUtCeVha?=
 =?utf-8?B?Ym1Ca2RYaDZFQk5hNmthbFB4Sk1PTUJ2RUJxeElaQURQM0JVdlJNdURUYjgy?=
 =?utf-8?B?Zm84NTcxaWJaQ1h0V1piL09pcTNRamlnWGYwdWdNZ1FsQTRPV3JwU2JWdDF1?=
 =?utf-8?B?aWM4TEpMT1c2SnY1eCt5Y3QydVhJZjlMZ1pNN2dVcnBSVEkvVUhUajlsYk42?=
 =?utf-8?B?NTB4dUZTTUw1Z3llR3MrRFZqWmxqdWdvRkcwRGJGVTFsTVBtYzZIM2hONi9l?=
 =?utf-8?B?L2R1LzdQcGdiUVA5VHZGUHNEVUxHbzJ3TmptTUh6SGdLVzBQL3lveWJvb1N4?=
 =?utf-8?B?NC9TUVI5dGFoN2ZTVmI2VFBlTVlhVzgvcWIrSXNlbTN1WXlLRE03dStpZUpQ?=
 =?utf-8?B?QjQzZXE1TnVxYzk3Slc4bE1TOC9BVWhkSmpneGFxcWI3YnJQaGhvaFJpZVh6?=
 =?utf-8?B?UWdzaEYyVnFCVjl0a05RSTBoM3FZNzdZaktTdXRoS0RrVHFNRWdYWndNU3hH?=
 =?utf-8?B?YVo5MnhUYU5jeVNUZ0ZLS3haZGk4SXdpWjNWdWd1aGllMGJCMHhaWVVHZldF?=
 =?utf-8?B?SnhEd1VxVS9KdE1Sc2lDOUxsSE5OTjlBZm5ibWRTM0FMb3QwVlh0cjhFVi9E?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb859b9a-4e27-41b2-ee4b-08db5dce94ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 09:50:05.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynVIuC5JB6LZlNGU7ha+UJEE5D72tbFDf5ATQowXiuxXvSWy/gtG0A+y2/cHm7R+ebQZqFHmLql1aP9eL6RMzSf8qCqtN61OMvn/xPKJ3C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Replace DRM_ERROR() with pr_err()
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


On 5/26/2023 6:12 AM, Gustavo Sousa wrote:
> The former has been deprecated in favor of the latter.

Hi Gustavo,

looks good to me.

Just a thought instead of using term former & latter,

can we use DRM_ERROR & pr_err.

Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

Regards,

Haridhar Kalvala

> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_reg_sr.c | 11 ++++++-----
>   drivers/gpu/drm/xe/xe_vm.c     |  3 ++-
>   2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 24d9c73ef279..4266999cdeb6 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -7,6 +7,7 @@
>   
>   #include <kunit/visibility.h>
>   #include <linux/align.h>
> +#include <linux/printk.h>
>   #include <linux/string_helpers.h>
>   #include <linux/xarray.h>
>   
> @@ -123,11 +124,11 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>   	return 0;
>   
>   fail:
> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> -		  idx, e->clr_bits, e->set_bits,
> -		  str_yes_no(e->reg.masked),
> -		  str_yes_no(e->reg.mcr),
> -		  ret);
> +	pr_err("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> +	       idx, e->clr_bits, e->set_bits,
> +	       str_yes_no(e->reg.masked),
> +	       str_yes_no(e->reg.mcr),
> +	       ret);
>   	reg_sr_inc_error(sr);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4d9c8de8b348..89d8240ea6aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -13,6 +13,7 @@
>   #include <linux/delay.h>
>   #include <linux/kthread.h>
>   #include <linux/mm.h>
> +#include <linux/printk.h>
>   #include <linux/swap.h>
>   
>   #include "xe_bo.h"
> @@ -3019,7 +3020,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	}
>   
>   	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> -		DRM_ERROR("VM closed while we began looking up?\n");
> +		pr_err("VM closed while we began looking up?\n");
>   		err = -ENOENT;
>   		goto put_vm;
>   	}

-- 
Regards,
Haridhar Kalvala

