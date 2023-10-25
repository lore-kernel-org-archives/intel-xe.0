Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCB3C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB010E65F;
	Wed, 25 Oct 2023 13:49:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDD610E65F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698241751; x=1729777751;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=wbxUFgZHJWxNENle5oNvFVOPnfojKmcWtHbRQpebFeM=;
 b=TgIuJ1Y6zGcRvGiiLbybzu4oRglG0a7nUTcYMKOa3y3EB6+ti7y1kzV6
 64SuD3BWqe93vh5m3bOqzdjxlzf0o2H48jcrZAIdYfqd1ROP+fUg+wLV6
 2dYCoo2sEVTVAsF4zM9adE2wQPdE9PP29Ji3YtnyO6Jzl2+NfYzsS941G
 t8wASd49RqasNGBoTXFx1ZoHu0FgTMLqZdHhG5JR0cBGDbVXORgNXCKV1
 /1UegMN7sq4NzDDkhuU2OW8JgU2Y0dZNRsQfHFDFVcw+vFVoAKzgSXN7K
 PiTsbYtqnNKqVmc69zplVrtn8TCV+z5TCVLx5reHJ9DegiZmNEHN3A8Ws g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390162288"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="390162288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 06:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6553783"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 06:47:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:49:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 06:49:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 06:49:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 06:49:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYmcCyHeS2I7RbOkQEhHbe+sbbOoPZgvZkv8OfcPMmcAfyaUnmCbZxUazfzdvd5AX+Pz8nE963TXhiC/MDt8o08Iu9jxAZfOf2mRIAJPtHPFLtlwk0cfQgtu+WtlHKInkdgvmSC+N//W4SsEioUzIsxd/DAbkdkWPzoM1GEBMvoL4/uUcnsr4NBBdZG4Efs17mlUzebpkanIuomFfhTjJGRyM60g8eFzacxmVvB8zHkjDnFMzfBCuXTawXe6JvZiX37OKmK+1dZOEkBWNxY76dBh3BAGvYDcOYyrONHqDg4ScPp1awPt/bsyxqwDLg5/gq9HTE6qKPcexMo7PzZ2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLCOYSFQqQk+NjS7NvMB2+eUcbjIuSwWJozVwdECFh4=;
 b=VBjcjRkcQVTW+4V5O2YHQ1yw0zR4+ES/hyXlu6qERs/H3S5/ToBnwWYYpFRRcXw45U8xw6ZMk0oaDIlk/3yz7AvDUrVIXFZj4hwLpgcmNFN0YhLinNeFlXhzUMQcdNm5UeBDje8wCmlylpFfF1mAtLIM0PqIFnyz0Vf5538fSBE8SmDryRmrJ77bwYJSbp1+zYNj4t2QOfm9q9GqdjVOMIb2y25BRAZCxziGRWLhN07tPlj27p02Br5wNHHN1Ez9l33kcS0q7z4p6aE6VhAowPMGSMEcu0rnR44hxXxNAGBj2gWg5/ZIrfV9kJkxWR69MtnIFra4xQ/qBM9cLanN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 13:49:01 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::ad02:4c1b:1e4a:8551%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 13:49:01 +0000
Date: Wed, 25 Oct 2023 19:18:53 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Message-ID: <ZTkcxUrWTokb+Xrm@bvivekan-mobl>
References: <20231017231843.1790243-5-matthew.d.roper@intel.com>
 <20231017231843.1790243-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20231017231843.1790243-6-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: cf578396-2fc2-4817-98a6-08dbd56124de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RznnMuapxCKrWnyFQgSNgZV9g0WgsYvADapV8xOLZSr2LpgJg9reKIhpKYQTZzgIUQH8Uh5tRp2Cwq7h00kPswBPuR1xF5BCt5zvV7vVA/oT4go0sDK3OrtBI6OMI1FxVaKcBoWBKva5V2OYvYfwuVnR6HgQTYFbhVCcaMZ4ODrLy1npa3MyTXM6IPBSgHU0lFzhbcgjgvuwPp4Q/pfdQwSZVTsSjqXzOZ3iT/Ahs2ZVLZvdzrkiQyInwoYBpsXKXOO5rzndFz7vXjT4YpIQznR6Njc37nAtZtuyaevZx4qCivicjEUkMQYVyjDhQW/xOXYpavO14Khp8D0dmFnCPuemYNTfl0QO1FR1CRJV8QjIyDsZ3Zz9Qr1wgN+Mr5xX22lgq7ZQlUd7M6XE3ZquY5zbWao1yHtFiwoQLGxh4Wpaye8ugMzc93CaAUkQ677A7EH+2HLd7rmPUP7jBMEIykckX0zB0M8eLx28sQ35tK7NF6dZO/mnH66zaIa9byy/EjWYy6+V+pbOeASYep4kkv7Av/B+7jbdTtmeK85N78daLZG6x2ZTjepTWtUgq218wERCiZLXk3E1LAR03+xCIBzuwxaoG7w1wUYFmiGpGro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(33716001)(86362001)(38100700002)(44832011)(6506007)(41300700001)(83380400001)(26005)(53546011)(6512007)(82960400001)(9686003)(8936002)(6486002)(316002)(478600001)(8676002)(66946007)(66556008)(2906002)(6666004)(66476007)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEl6cXpNeS9HSnhsTFdSQzVVbVFONVl6NEUwQnVhT3QzS1ZmZEJISFV4akNu?=
 =?utf-8?B?aWI0RjU4TWN4T2MrT1cyUlEwdVNLUnlQQjUzSGVoTTZIcjROTU9IQnlNcXkx?=
 =?utf-8?B?cUV1M1VjYVJXVXpIbWN6ZEFUVWY2S1E1NkZjSUFtQkMwdThHbEFwb1pmMlMz?=
 =?utf-8?B?Z3QxQktDVC9TczNYTWt1RTZLM3ByYXFsV3pvb0k3aGxQallRNGdWand3RE9S?=
 =?utf-8?B?d0ZFY2Z2TDhDMzFoWjhBbGwrQzBYRUlGdlRmZlVZdXY2TGdLbGF4aWlxM3FU?=
 =?utf-8?B?SVBLMldBaTVaQ2JIaERjblplZzYwUE9zcnkvMmNiSmxqVmdKUXJ2SjhITDho?=
 =?utf-8?B?UFdZUXhVM3NvR0NjVHV1bWhiK1RGdURFNWFYUlpzZXYraVI1YmI4QUYxVXNX?=
 =?utf-8?B?WXJYam5EVTdQam0vOFdMTXQ3M3RMVWNyS3pEVFNCbUMvVWZhVkVpaDZydCs3?=
 =?utf-8?B?RmhVaDgvTStLZnFoMUtkWjRGdk1HMXdVL2tTTmYreFlqTnZ6cXdKb3dnSWQ4?=
 =?utf-8?B?MlcwWWFHMnBJbU50NDZwc2ZicjY5TGU5MTFHWUNudjRUNGZ0RzYrQmFmSmtR?=
 =?utf-8?B?RVZab2I4elFHUGhkNzdzajJBS2NxMFRJQ0xSRmJrSFJWSFhXeFdpQXowTklu?=
 =?utf-8?B?dUFSdE1seklTeXlKa244alhKdG1TTDA4NnBIektDNkcvT3puazdpUStXVW5K?=
 =?utf-8?B?MTYrc01xODdscWVSN0NxYzdhQ2ZQZm5CWDFoOEFib1BYTUJGVTFveWdIL2JY?=
 =?utf-8?B?Tm5DbFBaRDZqamFqbGJmNFh4TmhpdzlGWWJ1TmZpMXVTVkFpcVZUaVF2VU1v?=
 =?utf-8?B?bzAxN2V3eldjT3ZaR1pqVWRpZkpiS0JkRVE2Q2x0bzNmWWFBZS94S1d5TWJj?=
 =?utf-8?B?bVpEaG9IWXl5c0VteW5SbDFIUXdIdnRWUmZOUy9maXNDbk1Pd0plZFE2WEdO?=
 =?utf-8?B?SnhJN0wzVkZHU3hhdFhEdndrU0VhekxiSlc0TUdKb09TT3ovZkRxUkdxdGpF?=
 =?utf-8?B?WG9JOUNVOE5MamQ3Vkh1UG5TdHIwQjJDd2o4ZlFXL2xTY0tGcUp5UWNuVVk5?=
 =?utf-8?B?OVNLQW5TNm1NU2xUOWdmUUxLYVJuQjZzWWZjN3BEb0x5cmtJSGtMOVlMMXhN?=
 =?utf-8?B?VjYvQ2JDUzJXUTYwOHp3WEJMZGtXOENrMTlDMzg5bDZhRlJwNU9mWDRheUNO?=
 =?utf-8?B?UXdCelVnZ0xxVjlDdjF4S0Q2bWVHdlJXemZHRkhuczd4MGhYUmxvMk1kcWRv?=
 =?utf-8?B?aVRya1RGN3pxNXpuMlUzenlvTVVuWEs4dVZmOUlBOGRWRklvendkMTc5b256?=
 =?utf-8?B?V2hyWnpkTWZseWYybmM1bkorRVp3OUo3cVVqaC9YYkRnelN4S3N4SnlNMDVi?=
 =?utf-8?B?bU5WY0lDb0M5UGgxMkFMcWJVdXFTcERkUThWaTQvMVp1MXJ2eGpjZm0xeGJ1?=
 =?utf-8?B?YUVrWmdsU0dnM1FyYlc5YjdXUUI5VlJ4bmVXTVVDb25IVXptNDN4WWRQVzNu?=
 =?utf-8?B?WWs0L2JuSE14NjBKMDZoSm9HMFFvdjNRUVBjZHMwMEZRYUgxQXk0eTV2M2xU?=
 =?utf-8?B?M1FSaTc4ekFEd0k1MHlSZ2NhZHYrSExTMlM0S0w5LzQzWlBodXhrYkh6R09P?=
 =?utf-8?B?cHhWMm1yVVM2Tko3NWxCVVFxZFUrbWVXeU5ZY0FMbXdyVWZ6enV3aVFzQUN2?=
 =?utf-8?B?VDJzcE0wTE5FWDRZczNLWmFjL0QyWUF0S0k3VFN1clBXOHJiVGt1U3lLY3Fl?=
 =?utf-8?B?RzVlQjY4cWo5d3NWVTdKZ2lsZjBZTEc2Y2tVY24rNUFRc1B5RG4xVXdaRCtQ?=
 =?utf-8?B?RlVNNWtYUHc0eGZEUE5OR05WdnRWQUgydml3bVIzWXlVVjRFMVZwYTczNUdn?=
 =?utf-8?B?ZFNLUVU1QXZaaWVnV0pwMFc4bm9kWW12TnpOcmx1WEZUYWtCZVpRUVVibm5a?=
 =?utf-8?B?ajlLRGxaVWtVRmJGTitjRUxqOHN5eGsxeDFlaDdyWDlyT3VkV1d6dXo4azh2?=
 =?utf-8?B?M2tqMjBYMW1zOG9rSWx2VUFrZXZEZVpsSXhLZEVPQnphZ1VRQVZSaXBIQ1hJ?=
 =?utf-8?B?N0VlYWtxNEtvaEVlUGZaVlBLZUhDTk9GTThHOVVmRlJVMGcvV0QyTi8zanJ0?=
 =?utf-8?B?OWlKOGJDQ2xua3orU05ON3p2SXNuMlR2SkZyUWJnMDdOM0RqZ2NtaS9SZm9R?=
 =?utf-8?Q?VEKrHKGPVGspfvlblVBkGR8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf578396-2fc2-4817-98a6-08dbd56124de
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 13:49:01.5292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cuV2ExgPmXIH0kfyZKSlwKcPLYyjWEXw1U+UzLP5i1H/29yx6giZeWN5C5Vh+Q3Ngl3Zrk+m6q4IFXxki56XUV/dCVQxioGC+MJc/Er7DKfsyVqVst4xfUvfgCqCwE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Prepare to emit non-register
 state while recording default LRC
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

On 17.10.2023 16:18, Matt Roper wrote:
> On some platforms we need to emit some non-register state while
> recording an engine class' default LRC.  Add the infrastructure to
> support this; actual per-platform tables will be added in future
> patches.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c  | 10 ++++++++-
>  drivers/gpu/drm/xe/xe_lrc.c | 44 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h |  3 +++
>  3 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd401..8618275b1877 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -136,7 +136,13 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	long timeout;
>  	int count = 0;
>  
> -	bb = xe_bb_new(gt, SZ_4K, false);	/* Just pick a large BB size */
> +	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
> +		/* Big enough to emit all of the context's 3DSTATE */
> +		bb = xe_bb_new(gt, xe_lrc_size(gt_to_xe(gt), q->hwe->class), false);
> +	else
> +		/* Just pick a large BB size */
> +		bb = xe_bb_new(gt, SZ_4K, false);
> +
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> @@ -173,6 +179,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  		}
>  	}
>  
> +	xe_lrc_emit_hwe_state_instructions(q, bb);
> +
>  	job = xe_bb_create_job(q, bb);
>  	if (IS_ERR(job)) {
>  		xe_bb_free(bb, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 332fc0602074..1f7b1ea00d4d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "regs/xe_regs.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
> @@ -1108,3 +1109,46 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  		remaining_dw -= num_dw;
>  	}
>  }
> +
> +struct instr_state {
> +	u32 instr;
> +	u16 num_dw;
> +};
> +
> +void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb)
> +{
> +	struct xe_gt *gt = q->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct instr_state *state_table;
> +	int state_table_size;
> +
> +	/*
> +	 * At the moment we only need to emit non-register state for the RCS
> +	 * engine.
> +	 */
> +	if (q->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	switch(GRAPHICS_VERx100(xe)) {
> +	default:
> +		xe_gt_dbg(gt, "No non-register state to emit on graphics ver %d.%02d\n",
> +			  GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		return;
> +	}
> +
> +	for (int i = 0; i < state_table_size; i++) {
> +		u32 instr = state_table[i].instr;
> +		u16 num_dw = state_table[i].num_dw;
> +		bool is_single_dw = ((instr & GFXPIPE_PIPELINE) == PIPELINE_SINGLE_DW);
> +
> +		xe_gt_assert(gt, (instr & XE_INSTR_CMD_TYPE) == XE_INSTR_GFXPIPE);
> +		xe_gt_assert(gt, is_single_dw ^ (num_dw > 1));
I think it may help to add an another assert statement to check if
num_dw == 0.

Rest looks good.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> +
> +		bb->cs[bb->len] = instr;
> +		if (!is_single_dw)
> +			bb->cs[bb->len] |= (num_dw - 2);
> +
> +		bb->len += num_dw;
> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index a7056eda5e0c..28b1d3f404d4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -8,6 +8,7 @@
>  #include "xe_lrc_types.h"
>  
>  struct drm_printer;
> +struct xe_bb;
>  struct xe_device;
>  struct xe_exec_queue;
>  enum xe_engine_class;
> @@ -52,4 +53,6 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  			 struct xe_gt *gt,
>  			 enum xe_engine_class);
>  
> +void xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, struct xe_bb *bb);
> +
>  #endif
> -- 
> 2.41.0
> 
