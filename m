Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FEAEB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 03:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F3710E0E9;
	Wed, 19 Jul 2023 03:18:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3346C10E0E9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 03:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689736696; x=1721272696;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Ax8f3o91IMTiVG2hL79YP9UBVUUjgTQiJpH6nmCR88=;
 b=aZcf/RxeM/PzCyvGHq+5z2CoCrV8HQ65HAj3qkZaKlw/0rNCksL+h8yv
 67wxbPah2+E95mbuIOckLCVmWMhspxu2Kpu9Ruvfx+a5kMO6CW+ZKVKRM
 yPTUK8eBGGtvsGbUkQzJWRsEHMOXcx62+yqIjgJTFeKHEh0jScQvrxBIS
 tIkIa37N4qmZjzxTidl7dSC73jxHZIKiVeK26tx39XT7mCOZa236MSm8b
 LS+mhS95nV+wHHCpizfB+E8t/maWDCX1sDS8nZ2C9GAtzCaxaJ4bGv+lu
 VFhGuDBy3RRPFvmN94a9Oihl7CHvLhBeLobdATmu1TDJQ49tip8HDZKi2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365242240"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="365242240"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 20:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701131807"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="701131807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 20:18:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 20:18:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 20:18:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 20:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GE5iRmnKBBQLr/qYkv+QNvj30jAQEt+uDmzteRlT2Ax8aBXHJLpwc2XSTNSRI2+04Esb9pA4DWpLlTq1kRYt6Q9jE5uzzIvTxIF2cNAqPQ7RP4GxlDLQDjY0J4LQQDXxsCdfEKUgsDLNwlPSQRxnVeRyjvtTuOZLVIyg08ZYt4A2+5UZec6Pri9iNHqHGTqFOUqeGwbDMHM/arzI/MDa2+Ng58hhyHVlA9TztSZn9UZa9BR8IT/1GhXUAfaudPn6V5ODPrD5zceiTygmjnZIsCYwRD2E94Qd77swRGxbR3pDF0oEb6TTCYdbLDJ+D4I9dd1nBKcI3nJKzN6BUZ1QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYC48yCA9gNrYBOOWPU5XgQFFF75veqjWk+agP+ABPA=;
 b=Cbk2uB02pjnqUS7MhKUARiEOechEunj0Z8QfXi8WJBr8YVlqPo7TBLJLDX1R/FCs4jfKOqbfB/KX0HMAgw5QNdKI/VIET/kPF3MxJTtCyJCyQedSJjIyqrZqsV/SY6PK+li3iJHXP2YphYDJS1k5ywzLpx7JYNrevfvLu1Pfr1aLa8WKUGGJvoFgwxQIfHPkflP73NrbyVrEW1v5t+mg39ruzaJ1wRsj6Pnqk8t60TG0znvEFmzvWui2GlvRuJDBOVJr9i8BjjcploD+jqpNALX3QbfE6SU6cXmxQNW52pgZ1AMVeCOijIV43cty++ugR0w0VOhMThP+B39qL1Fl1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 03:18:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 03:18:07 +0000
Date: Wed, 19 Jul 2023 03:16:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZLdVq1q3rVLJ9XPN@DUT025-TGLU>
References: <20230718193924.3084759-1-lucas.demarchi@intel.com>
 <20230718193924.3084759-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718193924.3084759-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f600123-a02d-4ea9-7a58-08db8806c572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i9CNFjwKNnTF8G4MWZTa0kERRNd8NrvpH6bP7uSX/tOP+llBaOhhgTUqHEx4iAZcNRDxlZhPGLtiZmZmZJbQ6Lw0CdV/kkBm8ldAS1X79655RUJ42PTACiv/lKxqzvJQJLpfSKyiF0U9Vg5PvXx3G72yX+bmhh4bAcs+Jtggftd5MyFvajjJyNxcFlldL/MXznHUgcri4Uyqisll2hsur1XnGQgyZldDxujij+ZEsuoJUacjhwGkcbq/ci90tdiB838oXiRfvQn5bZ9hnTL0YkL+7DZHmHix/tZVD4mZGL4SZX9bD+04SFTgdxBjNcuI0D3bYf25lsd9f1kWNb/+0PEI88So4IF9C84s5MN51uDVXbGFREhJMQNg5Me+4DxjJAAaDHXuK/S5Dx7H7w4j7rgaFAiUrh/LmcftT30vEGbX8c/UA2WnTU+38hYrjB9IFZSCx5/5czI5LZAwy3t3OEhrETlJaS0aBcZ3hI3r+97PIVD00Tpmcr+O2+W5jhcSEjv5RGC8vpZOvd14GPKEj8dD6EQmtn0VvHRnTtcPxtQaUDDA3cJ0EGeu6RJaYrKc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(33716001)(6486002)(6666004)(4326008)(86362001)(66476007)(66946007)(66556008)(6636002)(2906002)(83380400001)(9686003)(6512007)(6862004)(5660300002)(6506007)(41300700001)(26005)(478600001)(8676002)(8936002)(186003)(44832011)(316002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x7DC1/mweu0gHxRjo06Wl94+z8s/H8jaIa1v1Y6KdQdeUhVrV1kkqQbtaRqt?=
 =?us-ascii?Q?U0aEY1rV3eT3jcTQHLRo2XyYC/zRg7pKY5r+T74LFN0o+Uj3gkN1fOjl7IkF?=
 =?us-ascii?Q?239Jc4/m3GIyFVvyTK8HVnb6z5yTqTyglWO5xlOFtK0dXb+kY9rtrqjuLujD?=
 =?us-ascii?Q?BX5BAF2EBzJ0QMDSgX7/q7NsuZXyiFSojOAwuKSBPP24a6JGcHeWBiNS8SfT?=
 =?us-ascii?Q?qxXqK2USHVFri6IHuzqThDKfpPnrow2BRo8SIYR8Q96FUk85pPNEyJs0Gje/?=
 =?us-ascii?Q?aPh6NY08zVrqX49r6zU+YFmtH5lf9ZrPbVt7rJR2qSGd/5MjTJ9Oh93WhxdZ?=
 =?us-ascii?Q?WMGJ0ZEttZIUe/HzKiGMYEAGtlBwD+R9Vsqyc6Y0yRHjn3fH0T4HjS74P57K?=
 =?us-ascii?Q?9sCBhnUjnbnxbYC2xYfEbNPLY8RsXEoGI5K6ZZoCsVTKO1Ea+bzqRkkT0ReL?=
 =?us-ascii?Q?a2iVA4rKQdTtFEOni4vluI9gTiYP/dGwYDpi0dOYGDzlIw5c+h24Hu/P3yPZ?=
 =?us-ascii?Q?2zTxlp3YP3oeSC+5RyBRk59DYIbVBeDc3XnaSmNokWt7JNbkjYQgenMxg0Lo?=
 =?us-ascii?Q?qVMvTYmk19KOWZs55NQ8n+sdPat6z5OK6Szs8+Nd5T6UUhkdotwkyBB02Csb?=
 =?us-ascii?Q?q27c8UEHdX7MmaV/hMcQ5hubiDYveoh55Jj9hj4E/SyVCkEgDTw9OmedpeCZ?=
 =?us-ascii?Q?9DFbsseV/V1dgPnjm1foW9ownLVfLCD9Wa8O/akBgrDrcRERDuDT5AIRTH7b?=
 =?us-ascii?Q?ybUuFIcJQIV/EDmyHo1kaKHFAsx/wvjNTx1TXl3remYqorZjC3wy5pRlAnvh?=
 =?us-ascii?Q?6pqOdqKbqxyYT4mCltKGY1isNxGKfhMTdJqLiUJ6ejpb+lE/KiJw6izgTAp9?=
 =?us-ascii?Q?EVp3ch39cNZUS65Ggxw8fIkqj0/Gf7tSZ0jcI2qNEA2TjlLx19A6lZP1xpVO?=
 =?us-ascii?Q?ycAsG/SMevUtEdVhDVc9DHxpt3hTUExfhiV5gkbx5pKsDpUGhzAOb3tMdOO8?=
 =?us-ascii?Q?8PI0+xYIuupa1GEa3JjWBCqDgriWr0zEBUK5+Y5FbynrsYOD80jGzXpXoz2u?=
 =?us-ascii?Q?KiTK05pbo9y/rp5rVUjZxL6wj/c3/DuyZQElSUQsOUUZI136qc8b99sHLUrc?=
 =?us-ascii?Q?65pHBT7lwxvrDooocHEoB7aW5qeICtgFFcwW7evAvgU/hzmXf8GPzATTImoL?=
 =?us-ascii?Q?44DIHJ6uWBLEGsj90yz4k3OBwsQk1qh0osEqVi1JLh+XgQbsn8WZjuwh1NS8?=
 =?us-ascii?Q?Hvtr7OvDKMd0DjzVpmFaKFDuTJzpMzbRSM9rBbHAjLMSBH2Gv+/i9/1LWWw1?=
 =?us-ascii?Q?4rrC/mD3aJCNXd6Zzh3qP9kEEUIBaZoQ8yeKdtCRSk/GFrGcEFCzyb99SwPC?=
 =?us-ascii?Q?Thcm4I9fvgdLzdrC5AeBGIUDjbLuCkGJE0gTU5XNDiq82egWdo5lCTidoEZK?=
 =?us-ascii?Q?2XhDDG6gDcmDFvPc0afZFE9bvTOOgSc6dvyhKPi3Tq7VnWjUyiB1BzbvfQbl?=
 =?us-ascii?Q?MRQ2KkWuolsPtrxGjaYyh4oiprjFvbp3Rb4j9NXET3THnL9cYcZAhpBvUm0r?=
 =?us-ascii?Q?2zFgE4n3EXTiy/J/YL0Lf6L+nbhAaVHAimEzKO1V5bR4Joq3p+ZXU8d+fw53?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f600123-a02d-4ea9-7a58-08db8806c572
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 03:18:06.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BBo1jo9YHhXqh6uEtko63g116BVz5AlhnRLuWZ3jrTeOjoBzLwr7+9jCHCqDKvIZ4ndt+Tp+sXq4cp7ZRgc2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Use FIELD_PREP/FIELD_GET for
 tile id encoding
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

On Tue, Jul 18, 2023 at 12:39:24PM -0700, Lucas De Marchi wrote:
> Use FIELD_PREP()/FIELD_GET() to encode the tile id into flags. Besides
> protecting for eventual overflow it also makes it easier to see a new
> flag can't be added as BIT(7).
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 223b8f84c546..379c5d617d72 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -150,8 +150,8 @@ struct xe_vm {
>  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
>  #define XE_VM_FLAG_FAULT_MODE		BIT(5)
>  #define XE_VM_FLAG_BANNED		BIT(6)
> -#define XE_VM_FLAG_TILE_ID(flags)	(((flags) >> 7) & 0x3)
> -#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
> +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
>  	unsigned long flags;
>  
>  	/** @composite_fence_ctx: context composite fence */
> -- 
> 2.40.1
> 
