Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D23CA0FEC
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 20:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A822A10E08D;
	Fri,  1 Sep 2023 20:34:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8810E08D
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693600495; x=1725136495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CvtydjHMxC3uV1o2h9IDSxCxRCJfn3StYHomr/n8A8A=;
 b=BcefaBzSJUMcDPyBo5aiYy2Va98kSufYIawKpFhPYqOI2qqpQFYpkgBH
 OkHMdNupCGCMb4gRak6NuT/Ii9CiR2RmVkq5X0ipWCt8P70PNdOAWUTrM
 Vx4K3FCKilo4wlVZ0CKSe9y2HlLFpxGUyJdmFP33Gl01UGFI8M+9Xd4rN
 UaQZSvGALXgC3iHetLGwuQC+PaP78t4+tTBun2l+4teM4UveoLI31ldBo
 lWqrUzbhxV2xa7Ll3nrP38UWgV2s2HzuqMELVJR7DC1/4/9bSm2Wr3fny
 5WNvEuH5mxZkSi4LcdyeBg0ZAjgMWgWpQ3m72bWtkHTI9jxC1spL5ML01 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442701171"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="442701171"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 13:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863672665"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="863672665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 13:34:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 13:34:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 13:34:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 13:34:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 13:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2oMfpsY7GbDoXPPnydEFWnTdvZ8ss9HR+5A1BZog/8NlbGJNLaHTtQmdqKcFD+b0aa984AzyZUYUwzpSlK6U2XRLab6Fpst8w1wMzIc7f075PZtnutsoxXzvdTfrjoZSieEijwks5uKj0VGFaAtybB1DkL0daZbbibdMVUtGwN88G8NN0g4Eqf5OMFaqhe61C7dsThcuZ5b+rKinCwrRjS9qejfBkcHoRYMzVS/4uzPzHS74oTWPBBxaNeNWOZZQIsrulP7wSpvBid34tXQxVjIOaTi754TpTWhHvVEne2bvtsGR7qFZmnwb1vV77pzz6s3Rd870fK0YAOLIBMnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzPqnd4OEB1HUhtRB379rnoSECNmY6ngkdqsBUMQaBc=;
 b=iDUjythFjSrEovXr24tjBM4FPGLhHOvve2TwFSFLdcdigK15RPmLOIuV37/yHzQnLY3STcTqHL+iswyt44rCmrOkg48aA9do/QLMQbHayqMAf2yKSEnVpJNAvXW4Olbuoir3U8lwoPruB7D3bN2KGGLiatF5OfB2aYkVyY39svr2qLSyLn+TbWR5gD4UBr8avRhjgMxAP+vfQT3PyEB44cbBfB+/JxGQ5n7Dkl8Ic2SHb1GRBydT+hVq+SZsTNNQiB8b26pYyrDzoR3+zOVU6rsv2FPZ6eCcL24pSda+piwG7S80RS1WGyS/wWBnj8KmCfkQYB094lihbwA4ASNGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6380.namprd11.prod.outlook.com (2603:10b6:510:1f8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 20:34:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 20:34:50 +0000
Date: Fri, 1 Sep 2023 16:34:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZPJK5iahuG41pvcF@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc986dd-8df8-40a9-59cc-08dbab2ae404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OqDNSDvPV7vTIsE+JbFInsEzrt9CzUfLCc4rO5UB7J6ZyeNbufUU2ztH9d4UDhdKgRupsMx95XL1Yx1rMZoYZtH6fkeHxkwgKctGuvuZHxdI2+WqKTjf1vl+c19O7+fW9/0KJG9alYVhKoxSTDuL0EMznTiT7g5i0mbA/XulOvM6lzgZcVdzTcS1pQqCv6WTHT3JF5yPrAoies5qyK+34Vcl4ufcAG6JVz0QiM7fDYD+hLnz4uNe7hDP+YGADFX7QqVFj0cqKECnaXVOejki2f9fTX03+QDrGvHwyFk7gLkkEUNDiftM5Ml1j/b88nXZmsFF2LLX7N41d6zCkNB0Hbig9TNYQ9bYDMAU2Ocrdb+EmsDYskqgcIGVd+6gfvhYl/vaEukYKlYdvxEbIKELhCoSSB6EYfLIXF+e7WssT6+Qr1d86tQSSEJ9zN78hHn3CFuW7EKffjQdDg9p4dSrz2Y8MsU9B3iYI1KexP8VauRCj+/8bMR4d4JhuqvED9tR2zgPPRd49Ndm+MG9AXR1JjZPxpK4l5bRQeOErbrfviJ1JkXdcm9/VFON/Be4uNH0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199024)(1800799009)(186009)(44832011)(8936002)(6862004)(8676002)(4326008)(37006003)(6506007)(6486002)(86362001)(66556008)(66946007)(66476007)(6512007)(6666004)(478600001)(41300700001)(83380400001)(316002)(36756003)(26005)(38100700002)(5660300002)(6636002)(2906002)(82960400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ikdP5ZYcg9lVtflkFhZTQa/Gvw2X0vC5SEQpIP8bpc3gBMrE+7QGbqPyu9nk?=
 =?us-ascii?Q?gMU6Zu3eD5O1Z1jOPnm3wS08wz8bNkLocAozxNcVC3YqcIEKCsDlwTgx7EfO?=
 =?us-ascii?Q?K6DuxhJHhKhAlWrdhnjs3TW3McnztNOOZsGitPT6vuVGwdi0Otcjo0WMq92h?=
 =?us-ascii?Q?pspZJ2h5D24IdmGQBiJ1awx29q4ITlUaVE+NGo8CZYBPCET1Nn9x8Rrw7dpn?=
 =?us-ascii?Q?7HgMUtJAZu3EuT8ZUJoZvukyL5/5ne5HFWcqPapwhnao0b9Nz1+CjFhqvDTr?=
 =?us-ascii?Q?KPTNmlNCp7VxvCEDwQR9vkkIZG2oX+5jDOQEMk2421gHM4X/jakYRWD0Q1DC?=
 =?us-ascii?Q?OzsWOdKuDrIxZe56tpR44DNm56jxX6b64MA3kcK9667DIL+Iym/KaZgtEVvm?=
 =?us-ascii?Q?T98UpPXBuD4u/SnJcbC9lmf2u8pean2mSah4S6Aon/evi/Mj/TB0au8d42Th?=
 =?us-ascii?Q?GVMStYNqYw4m3vJLFaWnRZALzmiFD7FuwcB4Bpf7HWk8mbyqcj744AExqQwj?=
 =?us-ascii?Q?zOyUaY7QjtRmccmNgUr2ELuazH93G0poHuTdg+NJiKmBxmjF2cV72qZIbV3C?=
 =?us-ascii?Q?0Y6PnnVADkDxXo/whM404C3ySiQl3pCkzkt4K4suI1YTKUyEW6VFZmQ7fDBv?=
 =?us-ascii?Q?LpBRHYzBnIr7vBeHxkTd6/kDUv1TPCfovK9jmaF0H+JtXrRZAuPSxHNrfKEl?=
 =?us-ascii?Q?nqrxTifJZqSpsdH3m220YC+JbkShxFKRpP+8PXKp4ndt2T+BSYQtuqFdk0kw?=
 =?us-ascii?Q?kCVeerrO3lIVv2f7axGfdc1Lzz8+bUBn5R4nohdaTP3FAuCQFgccgnCPVJEu?=
 =?us-ascii?Q?ZkN0Wr2tLEAtHypZUsvB9XEup7UD91BKq1/6EqZALW2cv3xdzMyaTde1woKZ?=
 =?us-ascii?Q?DSo6UlN7npa1RwUO6E3pqcXrGkuLPb1e4RLOl89En+6deozABg3OLU9CWoZt?=
 =?us-ascii?Q?YtPgepNZY2FfuhVKr1nhASitZpUDdLorbZmzSbf3kApozGohcTs9q0RxgE15?=
 =?us-ascii?Q?KqFUowbjzEa3Sl5W5fFyj0c/IvlT8arVnrOllxxF9C2lraglHD7XcVCNkeHc?=
 =?us-ascii?Q?Ag4QsHN0hZn6vy3F31jnfp3duHe7ODkcVHRpryPBFknp09owH0Ahxm79S4cD?=
 =?us-ascii?Q?R7a0FYOs64MTuXmxBTLXigTbky0ZsnIF5wZ/u33d78zq2WSmg0KOpW8svA+P?=
 =?us-ascii?Q?fc4flc4aVff9Yb0kbhYpcdf5LcGKjSvaQ35d/IaPJ1M1S05lO+dAgmSr5w9C?=
 =?us-ascii?Q?Xa5Koa1x1rF4GSxAyttKl+RncsEtq3DRfrjFo+LkES3pH8TXWiGOZizP12MC?=
 =?us-ascii?Q?eE6axxVYqxOf6jQuAhL/1yasiEzHqZds5TPmdxwPd/uBubQurX3MzMRqNxkC?=
 =?us-ascii?Q?wdPV2g2qHsywueo1KJYEo3KMNk5WO1H50fzU6ckG2vOXfg6MDLc4gMchHykv?=
 =?us-ascii?Q?fOGhd2i6MNPuvgs8A7we02jJRPpVoJuyW4zqf4HmuIwS/5NF+rIPjsYHtPDM?=
 =?us-ascii?Q?VivDHeFAo7kNNQLOZHL67kEvxHYylYkv8ueM/xot2HhB2+djaiwpxrE39ouM?=
 =?us-ascii?Q?y9ai97xPtUORq5gZsVdFYUO2KYw3LvzzCHvJu5jaBPYwBeJ+08DHSbcqVlE9?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc986dd-8df8-40a9-59cc-08dbab2ae404
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 20:34:50.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1fwRPfHeKw/I5WxIIwvzV3da3dc7qyV2z3XJZja23UnjYpYhjyA2GL/KtanZKT90dXsV7fx70sLynYqy1UfRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6380
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
> Some pcode commands take additional sub-commands and parameters. Add a
> couple of helpers to help formatting these commands to improve code
> readability.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 7f1bf2297f51..e45169f47500 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>  	return err;
>  }
>  

a doc would be required...

> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)

a better name would be nice....

> +{
> +	u32 mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err = xe_pcode_read(gt, mbox, val, NULL);

but why not simply modifying the existent one to accept 2 params?

int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
    		  u32 *val, u32 *val1)

and the equivalent write...

oh, and while doing that, could you please add the missing documentation
to these 2 functions?

Thanks,
Rodrigo.

> +
> +	return err;
> +}
> +
> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
> +{
> +	u32 mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> +
> +	err = xe_pcode_write(gt, mbox, val);
> +
> +	return err;
> +}
> +
>  static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>  				u32 request, u32 reply_mask, u32 reply,
>  				u32 *status, bool atomic, int timeout_us)
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 3b4aa8c1a3ba..8d4103afd7e0 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>  #define xe_pcode_write(gt, mbox, val) \
>  	xe_pcode_write_timeout(gt, mbox, val, 1)
>  
> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);
> +
>  int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>  		     u32 reply_mask, u32 reply, int timeout_ms);
>  
> -- 
> 2.25.1
> 
