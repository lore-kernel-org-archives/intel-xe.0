Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BFCC001DF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 18:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADB510E11D;
	Thu,  3 Aug 2023 18:26:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA1110E11D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 18:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691087192; x=1722623192;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TwfaGiJj6XUjmuOlRWQan+ZP/svqHLw7/KhwkwmaXmI=;
 b=SN87DDG5Yxa+oO3uNQv6vzxEsAM0izyAFNyQBHaGcX4rwIW+97FcoqeH
 gJNx8lxQC5jpFZCoYJAV8S9SqPblEmStuyiLahJlk8X2yPknWMmstBDP/
 Cn+38XVdmZ84XFVgCztdEEuri0JrDoXSiFJcSJE6BWUdDttITDo5B0rJ/
 XS4lSAlQLzJ1sp2QB0nkcO3b6sIVrhju+tO/jrnm5k0qoxhcgerzKKAu/
 rDEPm0GeFP4+8BbGXUxv6yZMM3k4wEscLLP1njE8pWWeCjTYndSt1jTT9
 iI6U6XVnZ0RwX4X9rPa7lYjoXFvLgOPYC+WRhxEwSflOyH3SNmc6e9LE2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="369954644"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="369954644"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="729744936"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="729744936"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 03 Aug 2023 11:26:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:26:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:26:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 11:26:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 11:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGV4U5JX166H1b2Zek/Dq3OEb4lytNG4KqH5V+YeFgnWQUP9BGsMSCPfY22i6L0CyXQFwRRiWGOflKaOZnErIdf2EucM3fj8dYRKSfajrEnIwCavH4/ZXyVHn/tNxbo/+h5PSfQqQl5LwSOzdRIzmaRTMgylCgXrlRAO2Pwwe2dY6p05mBnYAdMecCF5lUMk0ZU6B9RAg/lzlNUr7Hi3salT2fekorD42XXEkd9+r5DBw6jRkhyiaZ1X1ptD9f0/QENtWhHEXoxqS670RtnnBxrU3QVucqLoIAjakFncNH49m6GodLGWcvzSgSRgOKvFymCjaloAYVO/7+bLpJZBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTH9odojrUa307FYrCfkED3W7JJZBZKceXsANTt3zq0=;
 b=CkEOwIX8aS0Gi2ey5tqO137UnoouSbMP01xfYm+Mc+EHmdaO5YTcrm12+nFV6KM5vM9HKmFDrGnFrCOJ9xWCyoPnqQ7LoHtf65cnAQNxXhg8k9jAkUP8XN/dWqnzwDICsAhrw7xHR+DTK/fgTVw2WDs7CMYIvFShQT9rM8Jcm+s4XhnASR1uh7P+IBd34Re6OUOGyZBT9OX+Ii+NlsRGorXlNHrlLQfrS2ScIwQykmIlQp6Eq7E+cQwszuATgnKdGhUm/yj0NIaztQM+xYBVUD116bomzOlQNTTCmJxxIbd/D1Fo3qi6silFekzbO7Mq1mvcI8FfezXOj8tlDvM/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 18:26:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:26:28 +0000
Date: Thu, 3 Aug 2023 18:25:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZMvxIju06O/DNRel@DUT025-TGLU.fm.intel.com>
References: <20230803153016.94282-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230803153016.94282-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: cd875a0f-d498-4b3a-3610-08db944f2707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zreUQDasCDzdIhFk3mb5C+MtR8kPPNjfO6EUq4hRYm+Aop/ParpTDadY31ZkY/g7iL/Q1Kwc0Le3PVP4LiugC+eaE9SQ2h2aQOOpEYdT8BHs+C1Q4wvkdRq+kdSafXy72Xuh8Z+w1bZLQwLsi1HKflxEV+g4JrGct6GHjNcizbi4AGyXcaWiJXeBNBt7YaTlB7ONqI2oncQ3dBP5nHf7Rb0Z/K5k40hi9k5A3FLhiMXZFQr9pbW8fCb9r1oC1wtEsK3ekOZZzPkC2rl8ut38CnQASGiI/RATNxuvb8WrLjr2mQbktBECjXLbsiXC0GKe5SYKt1pqIbPkPN1ZyJPYiAYVSJWgy9hVGo5Uu0/5pqmV/tbHEDbs51E1JLIaXQUKrmXrMj1XIgtGWK95Ojqh07AEBd12RmcPQzSOGkvaw3mgShAo8uOsBPoRixw1m0war7jp+330KaBUhoWtdYmfX0m1KMu+FRaCnorQuB8udUWX6OcnvkeXtlinwFCPmb+wnY2q4hmlbCTiSiWK2pYwTR4wiCthPiVjcEOAFAv9CHBrhXIylf/X70qoAQOTFw6v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(66574015)(6506007)(186003)(83380400001)(26005)(8676002)(66476007)(316002)(66556008)(2906002)(6636002)(4326008)(66946007)(5660300002)(6862004)(44832011)(8936002)(41300700001)(6486002)(6666004)(6512007)(478600001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mXoiSMrYZpOKQnRe9wpIO7UDnbJ6NPW8qMp8IbzcraEbYR6vid9IfGSFAA?=
 =?iso-8859-1?Q?hV73NZSUWZV7dtKLPn8Rf+thhXhuyNYwXiXZeMhl5Mo2KWjz/op5QAwXVQ?=
 =?iso-8859-1?Q?hsBReK7SsvMieLMQZBDKTzzx7d58hat5YKYQlSHllOodX/OGi8FDVDOWFh?=
 =?iso-8859-1?Q?Fni6MCNpClM0TpC526hUyCIebXQkcx2MEtTO90taMlcWWiqJSvkFiijWXC?=
 =?iso-8859-1?Q?4wQ4O2F94RdG0Fq05lCxCohy3P5/PfI8EHf3QTVYOW/2I0N0t6sGwzoY4r?=
 =?iso-8859-1?Q?yEpJFD5zKOpwq3y17XH+wF2SbV6baCiKM4fZdeQFCKmhMMIMZAE4V/U31A?=
 =?iso-8859-1?Q?KgtwYpZVudDVb6hFAIwUB00fpOqdDO/L0Sq7Tb4tQb5+4RlocfYX2cIJH5?=
 =?iso-8859-1?Q?blbRhtOCMInwxvsH43Y3JXWuAsqYzrsm0IGZJ+Qcc33FB/MT1kMV6ozXOs?=
 =?iso-8859-1?Q?aSpradzeCJqJtaXhuNtLwfSnBNZwwtxRaLBRm+8eT1oHu5++tUI0XyN2aL?=
 =?iso-8859-1?Q?B4UQAVJkpb0emYYICjh2CBl4oqaSt+x6627D61nNn+CklVBVc/vOWP+1p2?=
 =?iso-8859-1?Q?AgRIiMOyi5CU3fwvWIO7rnn3mgTlE9yViZ4Dz21nCfMpJZdga2WI8vjF9b?=
 =?iso-8859-1?Q?L09uVaFUvnGaLAnja3FZXQ+yh/PufqI+Dn6YfXeJryj1uQ6lFjO5Hk1a2D?=
 =?iso-8859-1?Q?qEHrATtnXDFNLYOUPXxlkSEy9gSmWyK6Cd/bAtnAl2/+Os/CWdwsCmkJ+Z?=
 =?iso-8859-1?Q?CVkh+2CvgDb2pXTJc7/Tiqj+jOQqzrVzxWCvd5tNFBseSGu66BLkkTsN7l?=
 =?iso-8859-1?Q?lov2wl3QC0LLKw5NpW2tGrC9Rk+07LiLMMd2qDn27WNF435VdYjOsTCvLV?=
 =?iso-8859-1?Q?ZuW3/3WBif9k1nbQ0Ph764txtG17swjkZ6A/TbFjYn3fP+dMWVlzKTbMpZ?=
 =?iso-8859-1?Q?dDv63Ij+B/nZOKDL5W8kWePngipD4KlDUEZYNQ7UqT71/mh0EkejYGY7aG?=
 =?iso-8859-1?Q?8XSYEypwitD79DyDaYzVIdxhz2E+pgWitMIlJUS3xDRwJNCxlfV2eFCb/O?=
 =?iso-8859-1?Q?yObRXWSvN7y/ybn18DlI9k/XqFLPemMOpqIK51lcaMVRiC3uH3dUzKqcN9?=
 =?iso-8859-1?Q?guMOOKvBnA7pDuh1OVxTZVXS0Xfxa9COsqmrKmfGv7abaOfjzrHnYMt2zg?=
 =?iso-8859-1?Q?dO7TftRfACN/ZLQK74FjAg9lHXoF0vLyU1TyWSdf2llENUH7kLlB03sI91?=
 =?iso-8859-1?Q?X8Ki/Ms/v6EbETYAi+aHKn7DdIZO/VUUAk6K41ZB6TR5mVxbGtTPY1im5v?=
 =?iso-8859-1?Q?KRQlb8h9QeZfcxY3HSH+bX9YEBjKxNahE9y1473wB7yGYgqRZ5iX20ZQtm?=
 =?iso-8859-1?Q?VzleywWlQ8gj2Kk14pCjqlnfY3/RYTzYfdpNEFXVE1Le5WzbIJKYmw4LH4?=
 =?iso-8859-1?Q?RZuh25wyG31ybrQP6GkEmdbqfscpXCNu2bl4Cr36zWlQZC4invI5kh/Fks?=
 =?iso-8859-1?Q?BDRhavOoxyM+oh4n9/6Zja1QuhasS1oHOefdurcpSgR9QACHYdZYGstKwx?=
 =?iso-8859-1?Q?PZ7cTltHQUm2NRZR+useKJ4HGYoieB4TdLeR+8mmiXNQ3QxWwawRVw5LKE?=
 =?iso-8859-1?Q?6VbThw2xzbu3Zq97Z7nxphkpdBWyqD87BnRzUUITtpZsUMPfzbRrKf6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd875a0f-d498-4b3a-3610-08db944f2707
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 18:26:28.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3ygBmeAoATIkL0oWmD+RdHaHpQEt/8YtTSaVzSv3CWhHf5W/s2g7RJ8x47+AMTMERMeXx0o0tAC4wQAiyz6KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: Make explicit that exec uAPI
 expects canonical addresses
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

On Thu, Aug 03, 2023 at 08:30:16AM -0700, José Roberto de Souza wrote:
> The batch buffer address in exec uAPI is used when emitting
> MI_BATCH_BUFFER_START that expect canonical addresses in future
> platforms, for current ones the bits above 57 for PVC and 47 for
> other platforms are ignored.
> 
> So the safest approach is to require canonical address for all
> platforms supported by Xe to avoid uAPI breaks.
> 
> v2:
> - fix check for non parallel engines
> 
> v3:
> - fix style
> 
> v4:
> - replace XE_IOCTL_ERR by XE_IOCTL_DBG
> 
> BSpec: 60223 59475 45718
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  7 +++++++
>  drivers/gpu/drm/xe/xe_device.h |  2 ++
>  drivers/gpu/drm/xe/xe_exec.c   | 16 ++++++++++++++++
>  include/uapi/drm/xe_drm.h      |  4 ++--
>  4 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 766df07de979c..9a4995304328e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -500,3 +500,10 @@ void xe_device_mem_access_put(struct xe_device *xe)
>  
>  	XE_WARN_ON(ref < 0);
>  }
> +
> +u64 xe_device_canonical_addr(struct xe_device *xe, u64 address)
> +{
> +	const int high_address_bit = xe->info.dma_mask_size > 47 ? 57 : 47;

Do we have defines for this somewhere in Xe? We probably do.

Also it should be 56, right?

Matt

> +
> +	return sign_extend64(address, high_address_bit);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 71582094834c6..a061b348f25e2 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -143,6 +143,8 @@ void xe_device_mem_access_put(struct xe_device *xe);
>  void xe_device_assert_mem_access(struct xe_device *xe);
>  bool xe_device_mem_access_ongoing(struct xe_device *xe);
>  
> +u64 xe_device_canonical_addr(struct xe_device *xe, u64 address);
> +
>  static inline bool xe_device_in_fault_mode(struct xe_device *xe)
>  {
>  	return xe->usm.num_vm_in_fault_mode != 0;
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 8a5b614df0900..4f651a042e560 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -229,6 +229,22 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			err = -EFAULT;
>  			goto err_syncs;
>  		}
> +
> +		for (i = 0; i < q->width; i++) {
> +			const u64 canonical_addr = xe_device_canonical_addr(xe, addresses[i]);
> +
> +			if (XE_IOCTL_DBG(xe, addresses[i] != canonical_addr)) {
> +				err = -EINVAL;
> +				goto err_syncs;
> +			}
> +		}
> +	} else {
> +		const u64 canonical_addr = xe_device_canonical_addr(xe, args->address);
> +
> +		if (XE_IOCTL_DBG(xe, args->address != canonical_addr)) {
> +			err = -EINVAL;
> +			goto err_syncs;
> +		}
>  	}
>  
>  	/*
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9ccc..477072fd6c207 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -865,8 +865,8 @@ struct drm_xe_exec {
>  	__u64 syncs;
>  
>  	/**
> -	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> -	 * array of batch buffer addresses
> +	 * @address: canonical address of batch buffer if num_batch_buffer == 1
> +	 * or an array of batch buffer canonical addresses
>  	 */
>  	__u64 address;
>  
> -- 
> 2.41.0
> 
