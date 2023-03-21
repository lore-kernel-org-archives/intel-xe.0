Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770EDC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 14:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B62C10E1F5;
	Tue, 21 Mar 2023 14:40:34 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E0310E1F5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 14:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409632; x=1710945632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F8/VmTQJ9kbA+tENTF8pONmEMGCsO2lslglLBYWYAOs=;
 b=JKomKtPldWNOdhRF03RP2XGNAAy2XFJmQechTfvWD8A60WyHEnz//4ee
 S6YrsCG42HltTX3BKY++sDUaBOuvEv7B/bIMlU3CWToPxlHEIb7Vf7s/a
 vedXj1j1RWX/K9qqrVM3hXgq8+aepaFX7KHQE3Ti524Vpe2iW+9xZvf14
 LRfHrUFV8Gfr8ALoHjQlWbDWxIhKJbDIUq+8A/23kLLgDd6egTJR3VOpG
 G1eek2you+cpEnsN8TmziNi9uYLjqY0w3UMHn/+6Un5mERsITdMbbBkqA
 8RgkHOS6+MyfK1ZXfEavXlEMfpD9pr2Z7sQOkbfcnf7z/c9VE2/lbCa94 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403834251"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403834251"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770660306"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="770660306"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 07:39:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 07:39:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 07:39:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 07:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvmNDI2hwkC9ltRq0oDzwy7ym/T2R4smN2/aP7kCdgr4q2ScGDIUXIhHB8psrLycenWlbqj8DUkv4pFoniA7pmEjM6iY1MXBppLCn0n29sBNUTo7Fd0KK9LfRB5SsvQl0Vlg7MIYonaHJt83anpr3o9pcjbj+kCVlwB2wcaIxvOIYDINcnRHYWl6CWaL+Ak1B/PTUc3PzALASFcBAkwXLsch4bmBn/a6HMW1Wa/O9w6uJxq16bXU+5J0O1v3h18V3v3uwFcorkai7nKZS3FkWoUeEElGWEJy2nKwJhZN47x+8ggoZpmwTfuHki56AjYxJKYxP8T6jgTKcJoUkqvaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6v9mU/TWs72vuvjAhF4zn1WpFzK4sYFdbdeVWrglUI=;
 b=WU9Of6qo84OqjgeTKBjT6wasR4X8NXbihQO02aijJXbDyIsSETaRV7PXsdfLQKk6e2wb+FFhcUGjxvvgrPjNguzwQB7E6lgQpHDVfDohiWj7vbedggOl5goZ6eAD2PbTdv9eyyOhPgU3hYOod28fF80musOwJueFHbj8sjzevpwLO4s8+ZeTKw0spyxgprhecdkTJqpxoJV2G4bGxmBw5b7msZ+ro2nZUGGyBMv4WFiGhCLdi9rLsWMJFZkRnUK0s5zO0RIB9M4iNDb1lmPXLsXkDX6TKe0d0dl8VeZi8WQ9u1BeJcyzydt2FnxSnFOIrsgTF4qM4VQ5EKCYl3xJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5664.namprd11.prod.outlook.com (2603:10b6:a03:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:39:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 14:39:44 +0000
Date: Tue, 21 Mar 2023 14:39:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ZBnBiLcpjSOhgbXM@DUT025-TGLU.fm.intel.com>
References: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230228101730.63294-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d7ab14-9b92-4859-0bc8-08db2a1a1cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llnDzWqpOhrC8tG7SOjrfSjzyIwshE//UMFI758zkP6ZJUlq0MuQBKxNq6himriP1/KkO+nHvjokswoaNU92Pk38Ump/XlDcZQevdzL+f8KXXqeuFRZEEMD3y6A1Fy8WKD49PiJr1WyQe7u6+EZ86olShMvv4h+TbOsf8UNs8caiowLji9t7/XAQHh7pLwPgHisSwDkxqys+6e9t9STA6eVz/VDSEcKOM/oWRy4nxokHU9p+VqA9igsAUVRVvz4m6vRJyKu9cKnSKH8qnemsD0g8rvzOpKgc3vi0yf4sGOpM7FJAas5taZcJl260VOgT6K2D674XP10kdInfcqqcnFte/sXKBD5YWLXcFmQ9L/xKTAv2huoKItEWW9SWMFamf8H5YDhpNE/yxBQksVS7ZAGxy2v0YXj4ly1venLopa843xDOTTw/GTntSdNC4y/oSPrPFowCjR+U1bAHglgtP7ChlvrNOQCEH1ab+ybuFqAgxHkBReHoo+PI2hTnYku6fBJnlfgGGhb7bGlaMiIgTi8uFz2vTKQ1wHPAALwSybUwGuNb/Qw4Lc/tRGmCV3lpr6DWozNcU2F0UEPqz9IFN/I1GyPZ/3r42aeUiKQ7oAmf9xbeez0FYTP6vNAekKOzLPD+zFb4JGyPlZz7E1bAjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(83380400001)(6512007)(6506007)(478600001)(6486002)(26005)(6666004)(316002)(186003)(5660300002)(44832011)(38100700002)(86362001)(2906002)(8936002)(66946007)(6916009)(82960400001)(4326008)(66556008)(8676002)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vLP5Yri9lo/M5Gv/X3DjYaMVj27du+J3PHlbBcBMyS795i+BbGNs3T9LDvKy?=
 =?us-ascii?Q?rvBGhcfSR6cL82M07Z1OB0jysfM5g3cD1WwtoKCYvsOG1M8DbiEVAdXNQrOn?=
 =?us-ascii?Q?RUVjYdIvbZ9x9aIN0NPjHRyH0C36IUt/wtU7rOW5J5iQdUHKmtiHYKzNnAp3?=
 =?us-ascii?Q?wi+I3GfFv9QrqKdllvZavSVvtH62rHtu7NRjcUFS2xF+QoncMw13M+EPmWAk?=
 =?us-ascii?Q?lcfTOjZgFQSdLZ9DmeAF72tO7ByUaF5NfMbKEgg1sVpviH6VL0b0d+EMDvX6?=
 =?us-ascii?Q?+v/TS1vKStrJUnr+UFItoBtbCjZ/ob7g6B3t48EwI/nljCxDDc3tueWDxQl9?=
 =?us-ascii?Q?Ssicerg9vdCT639ljljWQEhz1kMMgTTYV/eh8yCkZQSzxziCYJUBAwcD+WhY?=
 =?us-ascii?Q?T+AGZQsEKIldt3OF9PkYH60w+uATZg0tSB56Gfvf4JZgtpg16rA7scbhbR26?=
 =?us-ascii?Q?RG0Bf3yVSdn8Loo1E/c1O8qFu+ekRYzTk7C+CtUoEv5iMKbmuKIAUoVYzX1I?=
 =?us-ascii?Q?sHwZUMNVp136RyrJoxA1+BDOS4ft4EDIkbhZbgrLvnXDyOa+hVEvev3J3qhZ?=
 =?us-ascii?Q?+ccoDh+tqLe3nhN8/3ciRzjiyqO93PvGb7dwTYcLl8n7XDz35tZclRdRcuYS?=
 =?us-ascii?Q?mRYoctWuQnee1kdzdM4ST8p5D7vpnwWcS9Z9/wEINTrOMBz+tZRTXAxj8ec3?=
 =?us-ascii?Q?SL29MGYbMaqN4A+i7C+xKq4JLoOmYH9vnWvXgw6lmlFuo8zVIXGcOtwqrltK?=
 =?us-ascii?Q?Rn2nypRZKbme1wKGpFZDU9BU09F2IMiyzMXZZEzD2c2Ll4wmsDAGQ513iz75?=
 =?us-ascii?Q?5GOZU3KzUzf21zbVJzszkznrw7rgGET3zAv+PqZ2QKbHoy6Hb1hKDRl00fRr?=
 =?us-ascii?Q?qEe3dJo9/X26C1tZUMoAI7Itb/Zz70IeHMfwWFuucFSBe2jAAm3V0y0ckisl?=
 =?us-ascii?Q?zcMTS93y/9rM59W20jr+pPswH5EExRLqogg8pG38eBLxDtZtY9Yb3Ua0Gmzf?=
 =?us-ascii?Q?0aDJfpFhpD+zf3uQCf5DH/Vexibhew7iFSO/9GJVXHXug22ryteD8Qq+jZne?=
 =?us-ascii?Q?SmK1bzKjtMcEvIlovSq6R/7TIQFodOJg20kXwgmfTBJobJGkCMvTcm8wLZpe?=
 =?us-ascii?Q?8FIkkm8TIEdaQu9rpTKTJUaXI1qMNy50XkSno5zOLWsjH3MCRZxLCvC8BH0u?=
 =?us-ascii?Q?O5beAqaaav6AIMnQuDBb7Nk+IsvhAEolrFVyLRlYAVkF0p8RYGYSHl+hyVie?=
 =?us-ascii?Q?IhP1ObjzZ6GaaLuxwRN0d9HnOoyMuu6kYaAwBNJle7YLoqdBiUkvFFgOcSNm?=
 =?us-ascii?Q?cy7OjcMWKw6lzKqOacv7uaxgLhyMpZ3CGHQB4vNoKuT8OtUTWVibTu4AoMbP?=
 =?us-ascii?Q?fET4LpOHCq8vliskz0E2/9pUY42UZpGEWoPARKtjKKjQC/30TEDcju8X4YX9?=
 =?us-ascii?Q?iRlG4LsqHcqyCDk30Eyu6hFcXzEY3K4ou+HoRCeTMAxylhZBab4fdtrB6naO?=
 =?us-ascii?Q?aXdq1xqqlWR8fq+kmzNPv9Ie993FKbSKoXE5hHCqh6DpGkE4LFXE5hZHmGdi?=
 =?us-ascii?Q?g3iiuqtSAm6yl3u/rgZEgA7Nx2iQDDbz0wjU+EiUvAfDs5VKqMvxdNATqXOk?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d7ab14-9b92-4859-0bc8-08db2a1a1cf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:39:44.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fq4u2MVkrPinLf+/pJ7V1SVBDgeWmhi8eFNnvIZaC+fxhqUpVgiKjBad9t3v4SXWdu0v0KOFWMyJhD6Xqz4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5664
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use atomic instead of mutex for
 xe_device_mem_access_ongoing
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

On Tue, Feb 28, 2023 at 11:17:30AM +0100, Maarten Lankhorst wrote:
> xe_guc_ct_fast_path() is called from an irq context, and cannot lock
> the mutex used by xe_device_mem_access_ongoing().
> 
> Fortunately it is easy to fix, and the atomic guarantees are good enough
> to ensure xe->mem_access.hold_rpm is set before last ref is dropped.
> 
> As far as I can tell, the runtime ref in device access should be
> killable, but don't dare to do it yet.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c       | 17 ++++++++---------
>  drivers/gpu/drm/xe/xe_device.h       | 14 ++++----------
>  drivers/gpu/drm/xe/xe_device_types.h |  4 +---
>  3 files changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eb6786b11f0..ab179b1e24c1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -237,7 +237,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (err)
>  		goto err;
>  
> -	mutex_init(&xe->mem_access.lock);
>  	return xe;
>  
>  err_put:
> @@ -424,25 +423,25 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  void xe_device_mem_access_get(struct xe_device *xe)
>  {
>  	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> +	int ref = atomic_inc_return(&xe->mem_access.ref);
>  
> -	mutex_lock(&xe->mem_access.lock);
> -	if (xe->mem_access.ref++ == 0)
> +	if (ref == 1)
>  		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> -	mutex_unlock(&xe->mem_access.lock);
>  
>  	/* The usage counter increased if device was immediately resumed */
>  	if (resumed)
>  		xe_pm_runtime_put(xe);
>  
> -	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
> +	XE_WARN_ON(ref == S32_MAX);
>  }
>  
>  void xe_device_mem_access_put(struct xe_device *xe)
>  {
> -	mutex_lock(&xe->mem_access.lock);
> -	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
> +	bool hold = xe->mem_access.hold_rpm;
> +	int ref = atomic_dec_return(&xe->mem_access.ref);
> +
> +	if (!ref && hold)
>  		xe_pm_runtime_put(xe);
> -	mutex_unlock(&xe->mem_access.lock);
>  
> -	XE_WARN_ON(xe->mem_access.ref < 0);
> +	XE_WARN_ON(ref < 0);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 263620953c3b..96b4f3d7969e 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -90,20 +90,14 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>  void xe_device_mem_access_get(struct xe_device *xe);
>  void xe_device_mem_access_put(struct xe_device *xe);
>  
> -static inline void xe_device_assert_mem_access(struct xe_device *xe)
> +static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>  {
> -	XE_WARN_ON(!xe->mem_access.ref);
> +	return atomic_read(&xe->mem_access.ref);
>  }
>  
> -static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> +static inline void xe_device_assert_mem_access(struct xe_device *xe)
>  {
> -	bool ret;
> -
> -	mutex_lock(&xe->mem_access.lock);
> -	ret = xe->mem_access.ref;
> -	mutex_unlock(&xe->mem_access.lock);
> -
> -	return ret;
> +	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
>  }
>  
>  static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9743987fc883..0b8c4ee0ad48 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -230,10 +230,8 @@ struct xe_device {
>  	 * triggering additional actions when they occur.
>  	 */
>  	struct {
> -		/** @lock: protect the ref count */
> -		struct mutex lock;
>  		/** @ref: ref count of memory accesses */
> -		s32 ref;
> +		atomic_t ref;
>  		/** @hold_rpm: need to put rpm ref back at the end */
>  		bool hold_rpm;
>  	} mem_access;
> -- 
> 2.34.1
> 
