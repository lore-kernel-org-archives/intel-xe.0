Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BC0C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD6A1133E7;
	Tue, 30 Jan 2024 17:33:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7E1133D5
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706636006; x=1738172006;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lzH7qanx0tNq9iSD053qMfe07Gp0U23LTzqEdsmtEtk=;
 b=Xrq6/3hIFBlK7XA+26dDia77SEkg77qiyYktZy7sXJmkn012LmkxeSOF
 OKxK7ZR0cf0CekotNcl/tmOd2WlXW0885JsM0/SvCwk3ctLgB4OLxw7oM
 roVLDHj4cDjVBOlNt30pnbCu/3mHA8zik+nYMJpZVpVXyY5h2imvfhhVG
 21bGOISTJufyHY/ZoCqaw1HJ8VMUL3BN8yR4yX8ulIU2NJzLMxpz0ay6c
 ArHLqjsNzmMBy61yjHQI0UadSxvcEO1149XxWLR/KOrBo5Ez8GdTQTBD4
 S5qEzCIWsyj0e4jTO9nG5G2YFPhqXh2YB/CBgccMWPZKgMA7CvHMTxkWg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402970847"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="402970847"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3752345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:18:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:18:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:18:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:18:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:18:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0eSY2hwWvADbgerhTwRnqnf+o02B/6dkSrXKsUP8qj81fd2aiXxR1l7ydd5QMCTvEuVE00kUWrQfCKtqgMCPylm4yvvTtXQJjcmhXom0TjgCVJCt3H+BsCWcErd1bQpxI+jIYtax1Sx1x9cZmA9aLlipAXAHcbhAj4M7Je+KwoYbs1W+5s6l8KEqyU9zDI91vdJ6tM7zjT6Pg+kc7U74Pq8pbtTiJlw5sIyDTfwa14LHcv4TjUIFKkVkbPaOrycRLgqz8sTiY8kzAfzmNKvkaXYR4cn8Z026ZZSRG3hAN9B4iXnUiKuvQLR9fW4EXcm9sqQI4/lJeNiJqlefMVzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMXKhIgs1AJnNKGJETAwn7MQnWx1TTmv+7Nag4ufTgw=;
 b=OcxxuUb8z4CS9od8ZL5yG6pv90N7JBe12BMjdPFaZ5SmkVmNwaR+B6tauaTBfyx7H0aQj16LoSLXH9KmgC2OR24ClXyE4hxcOQhlxJ5AyEc9wcuZd7NZgJo0R//kubCi6566tNyrrjndXhIpKU9BC1jPGqdQSAQbfvUIpfZQtdnJcDt0EWxCxHyrp9Cu2BGP4pw+Vdy5JtpfBFA0ZQ3e3jfyJRyot3aIdYdlrRFw2fXEW4rtuK4wTSXgkS2UMAhOSBjWEPQplcOJhnsgh9vMteIkUnqm4FhJ7zlUJtxImvsJXSpV25kRuqJumrKjgAjWpPh/4cdyyVJ6jtzN4UfgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5422.namprd11.prod.outlook.com (2603:10b6:5:399::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Tue, 30 Jan
 2024 17:18:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:18:23 +0000
Date: Tue, 30 Jan 2024 17:18:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Annotate mcr_[un]lock()
Message-ID: <ZbkvSccSch4zUtWG@DUT025-TGLU.fm.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
 <20240117134048.165425-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117134048.165425-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: c8439061-a297-4641-03b0-08dc21b776ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFtVy2i+Se7Sv03pdRf8ZNVnhTf8XAGvjsNX7GL7SMPd6WckmBdzBQCSArHfXpnsTZC7OLq2CV2IBrNcsotI0GIooxUUfw/9uyj3KxhFjlpyzaBHp1jZ/9QGCQa0iGo4N4hRsy8Udg0EfixJA767VUNkpPPwazSGr9RdJRkR0NgooR5EtrGWjoVfiQNXaquQR3YmC4ULt8QLFhhVEgKqK7fvRBEMgVE4rMIEWxkv+5kbQP9NhdWi+xTnUGPAXPMDgyj2VS+IV4sq7u+yfbooPpOrxFJZhfo0yzm1rSPmYeIqk+xklS5Y7MMvNSeETmtYRstjKMbsbESolnCeAaFiTMGJdqr64HYMwJPdQ9Gi9GbZfHK+T/9H0PQNk34YIXD+8FOlKjN0KmwGpJ12E8cfpx9IjNVRP0ji5CLyO2zlj3M+huvRA1MlBIj9SGZOb3zibN1EBb0eDmDj7pD8szBsIPd33h4LaDgPcK7iV6ITDqCQE4S/NwkF094VOfXR/cxWW6mwtfJb0sxRDzhb5W33BgdrzHsFeeo6H5jclzr5SaWCE3uwt/xVX3K97MWmbHVbL1t7VTRWrUEn1b1vJHBjUEW7C3hOrD8NDzVrxwbX6dpzgSW9/T2+ofOokc1FKLB/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(478600001)(8936002)(8676002)(4326008)(66556008)(54906003)(66476007)(6486002)(66946007)(316002)(6916009)(86362001)(2906002)(44832011)(41300700001)(5660300002)(83380400001)(66574015)(6512007)(26005)(38100700002)(82960400001)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?r0ZwjdxUsBNPmKBH9zBJO+GxeSBgvAIkdbsnpNuyHlfz6113N21wD3vDxs?=
 =?iso-8859-1?Q?7zs3B4VOTaaFQo3jmiek2kNY7MbDiMZr3EUdiA3z0WxzztQvnojZhODWnB?=
 =?iso-8859-1?Q?uL3t8d0dbyrctTVRHOGHk86i4jynPgTotiVyKmjRw0a8FaxHPvKMxRqtMo?=
 =?iso-8859-1?Q?Zk82z+tNwBWg21HQw30bKI1o5iYfO6Qmz04e8Cj1u+Tv+GiridnSDZpGXv?=
 =?iso-8859-1?Q?BYYBzV7fcVEOezmFLcsuEWSApI6vatGxQjKYXl/hmwQAZ7bJRowcNP7HDg?=
 =?iso-8859-1?Q?B21V00txyOn/rnyTY6nqYlvUk3tK2QOlc9zX1Dqz0TbOvgrhXswbPtdvC2?=
 =?iso-8859-1?Q?1D36o2OujYRx/t2yNpdfgn7gyKYm2oHGY6kxcTnORhNgHx1EIWadbmR9TQ?=
 =?iso-8859-1?Q?0ZOuz/haagTvse/cjl468TR33Q5gGCA4kTTxM2B/hDgD1wXOY0vlAZ2D7f?=
 =?iso-8859-1?Q?IxF6x/IU8aFu71Jasw8VGQaz7jAfrDa+dhNc511uVTdUoZDfPMXZnLpauu?=
 =?iso-8859-1?Q?ay1KI75lFeg6IitoW+hr0lCxNyVl+0mNWeKcf1uuFl/0OPx8VdYxXJiK+X?=
 =?iso-8859-1?Q?3D9YG+FXwQHlV6KPDiqvCpuws3PV5NQz3A6B3CwAoTLMlWCKSTSfSvwvR7?=
 =?iso-8859-1?Q?tIMH2ncBJZ6a4U1/4GbJN7QJUecFy5Z9AaAqE5kfYEdhXzx0AWg2XiU0a1?=
 =?iso-8859-1?Q?gEgYbFnEozFMFmZc12J5ym5zFgCQaHB/ONQN2E+wTNx0aq6YL9cq8Qaxoo?=
 =?iso-8859-1?Q?dWJT0E1YoqofDmxNC2IghwKwptkyjvg3TRB8WVxiwhfvAuJCf5Y5iITWQX?=
 =?iso-8859-1?Q?6AMOYikY4ILTG6gasr6ZMhTWLho45AHu+JGHr5dRlr+RZMy4JM5XFpRDwT?=
 =?iso-8859-1?Q?EjgfLLxHYMawGjcdjW3QVQ1/XT+9bd/fW8K+dmEfFfLA2USiNXkquWITgn?=
 =?iso-8859-1?Q?+mFTFHmBdlc/zeVj9ZTFjXHlI70Rj9sXLsZgNphOFtA4EE4FWo/impaf2o?=
 =?iso-8859-1?Q?x4CVI1gcBASj5lQ/yVJ5CAS0ZGYsQfEKKw83SUClQptacTwzAh2zJRTIAw?=
 =?iso-8859-1?Q?MlZ8ap4bigDDA/wQYwcEiTLxy+SXT1Hkjo5tAyZM5NLInSU94gpsa6Au2K?=
 =?iso-8859-1?Q?McVLRpG+VpKlNX+xD9L2RirIZZNR5mG0VbFMZkKHD9HsuXchzYSat/6zVi?=
 =?iso-8859-1?Q?x3RFjWRHXrSZHPp5rpmPvnpRcEUyh4tNoXzhvaE2ucpflLvBRzQ/azhcEY?=
 =?iso-8859-1?Q?FlE1MFgNx1D595vHdrf+GayVNMKhcNsXDrXTfheSEzP86uFsP9p5KlMYhc?=
 =?iso-8859-1?Q?fvXsJmpZ1J0XSCzMQVlsvE5AiCz0yqgMFW3SkFugQ1etFByCmS/2Al18eJ?=
 =?iso-8859-1?Q?igD7lrk22rjHmfeK6wAM9qVQJsxf6R4bMjTVF3TU5yHYV2NIKoubSribwa?=
 =?iso-8859-1?Q?yy/Y6Q1f6jtLRTmPbjR5sQDU9sn4n4YtCMrA9YH4rZKNGBYiw8gv3LI0C5?=
 =?iso-8859-1?Q?Noopk7RTKvLGHelYSQkdJ5bN6QlaSXM3g/H2mKl0JmHmKNKaTdXO4Fs5aj?=
 =?iso-8859-1?Q?dyPbFJW81aTWqjIL20gUpcfZB8z1bTc8RkYK22B/vJx6k2n29GqVH3LWd8?=
 =?iso-8859-1?Q?FYlzXvBs9d5BoPYWftCQQg63dwBtDcKjIG5SZKzWM9LgXmx6wRpcWoSg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8439061-a297-4641-03b0-08dc21b776ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:18:23.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0I8eyK9qh+Mcs5UgfmICun92WsXS7vPKFB8btnBH7Hyeyf3YeCOD8KkGPWTacVteyJpwUoE9Vf2yalJgjtPnnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5422
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 02:40:46PM +0100, Thomas Hellström wrote:
> These functions acquire and release the gt::mcr_lock. Annotate
> accordingly.
> Fix the corresponding sparse warning.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Fixes: fb1d55efdfcb ("drm/xe: Cleanup OPEN_BRACE style issues")
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8d..8546cd3cc50d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -480,7 +480,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>   * to synchronize with external clients (e.g., firmware), so a semaphore
>   * register will also need to be taken.
>   */
> -static void mcr_lock(struct xe_gt *gt)
> +static void mcr_lock(struct xe_gt *gt) __acquires(&gt->mcr_lock)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	int ret = 0;
> @@ -500,7 +500,7 @@ static void mcr_lock(struct xe_gt *gt)
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
>  }
>  
> -static void mcr_unlock(struct xe_gt *gt)
> +static void mcr_unlock(struct xe_gt *gt) __releases(&gt->mcr_lock)
>  {
>  	/* Release hardware semaphore - this is done by writing 1 to the register */
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
> -- 
> 2.43.0
> 
