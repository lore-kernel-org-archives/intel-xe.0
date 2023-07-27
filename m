Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8E4C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0116910E5B2;
	Thu, 27 Jul 2023 14:55:11 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9F210E5A1
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469707; x=1722005707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IQYdvcSv8UbpP7BzpRiWdkG33uj+QbcvzQ10XPsgY/0=;
 b=J64zCkPNvLWUcm7xHsO0/ZDLSKHNyAd+Bt2uF+ERc8QzV3SS9IhFPyEH
 zGsvsWCEFmh5pwiY7bDOy+RsP/HcIIqDm+Gon9wayWahIJ20YCSnfEUPm
 BVYeO24wDI+rBzSKTLvlNlb6R8/zGMcCUtxKMB5E3a2pcd1Kult7tbowK
 VfPuejfRnlor7meOx0RW1EmYpDh6PGOyUrdTCm8IZ/hLXKJ5hkUFiAk5M
 Tgg03oqQ+P6/acg6/QkQQp7c5n/YVIxyqdj77E2DESGZe09IwvMVD3cRZ
 GV5R1SCo+PIIkMp8EzkLDUhaHW6ayYhAxdaDvaTCNYB14twvXttNAwKX8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365792868"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="365792868"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="840825831"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="840825831"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2023 07:55:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:55:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:55:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:55:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:55:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bow2jb4PjlNiHC4qMFxN0Au+DbyfN5eV2etbeC/BJ8tGSyCMW11cg+J+VjGEmc1Ot6kqOyQj60SZyT4yLBTe6fE2Smuv8NTN9AR9q6Z5tUFmmIk5gnN+7m2GvvFCqGGQ+A8NF2cKYQ6WiyOQ2OrGhcbWksQJ/ubzAvFBZm8+CAjhrMj1HWYSNPUgcib8C7ZTECt3MskMjoOGy1Vqs/QdSjBhOTO2vKRiSyATIrcsrkW7zFM+jY+k+jNLgWrtT29OryTDZZ0mGrsaRIx5/WZCVrFMrgZ4xVfTo05qmpWMAs+ia2ee92zoQhADtYcYcojSzk/GcRFQ7JCo2q0GCLiCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xgEULB3icvgZ2mkgBhFOa82B6dGJIO2T7BdkKPxXhE=;
 b=Id5nsr/tRfnYDnETX/G+PCYbH/nSvCcJEe1zzSEoOsQ0svVHAIvLWFh8pAT7vGZTtWqkzHpiS3vk97ps0sS+SSE2Fek7L3noX05k9/ujccI/MuJRMpxVy4H0M6mBnPGerM6AtuHpUr+Klu7QPac5Q/V32pS2WP/qZtPX4pGzrCmuawDiR2R3AaCYSOtQHslRqwPzHS0cQk7FIva1ScbQO2+jIaT0VGfmm0EvpAeZlSSCNd1WbiNgJ07TqErCshPDSKSiynMSlus6hzAHq9JjY9m/Gm/8yex2pRwOvQT1RNsrf0Sfdk1z2tGRdRey5gMYLw3buIpS3R793M2Rt5O0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.25; Thu, 27 Jul
 2023 14:55:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:55:00 +0000
Date: Thu, 27 Jul 2023 14:54:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKFFcKLZJKrSyCp@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727082235.905240-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd5d9a2-b904-41f3-7460-08db8eb1737b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KKWn+4va0/BB1pn3yjCwpg2v9qF+Tq7DhmXkW27oP+jXKUUUVAKu+hHTix7N3CKdT3wX7B7X6uoaAncAq59eHqPY++KAh2dLO30JTGEC7OZIWYaHmCHJElRTVgDGvKfSPX2cxfvxjfPNX8O98xJSWJTP/WbvH1B5olmfnSE7Yf6CJtlJ+7m/6HrVZEukO3TpVOftl6oqA7ruFchz9u9bYsFdplY6ZyV8EDJ+0T4d00uq5jBKywb5ZWfiExDV2Rxjqq1kptO4DFUMfEU/0UM4OoIvN/iq2js84mxup3l6+pj8pMb8v1YReUbGrJNzP8a1np+d1GsvjmS2OwwwMjiZXb5QuxouCdtiOENOz/oG9rsbiVD0rlw3k9Td7QI8oUuL21qKfi3M8y6GC8AuP94pIRpwKRobibWuoUtfiCBpvh932ktT0E1X848rnn0gbjmsfCv/GpEp7wRj6GMCPTT5RsmAWu2VwHnQP8mih4bhAfUMTv3qYX6RMdY7ox6p+u/y0U6KI5im7FyWawOXCMYIakI6v2m7NQCeJzhePGslt5x1/n0oWYAxMWqrnFkZ6iC6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(6506007)(186003)(2906002)(26005)(6862004)(86362001)(82960400001)(8936002)(8676002)(6636002)(6666004)(6512007)(478600001)(6486002)(107886003)(5660300002)(4326008)(38100700002)(41300700001)(66946007)(66476007)(66556008)(44832011)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?STDaEFLuO8LlwGShlW+HBvmWYktx/nwtboNQfQAsiAjwlUwn5mdtKeRGZlPH?=
 =?us-ascii?Q?lRZEuAJuAuwnEv32fgbXJQDgvR8oPAJdR+AzZQ0Z9kqQAre73VPa/W8x80Al?=
 =?us-ascii?Q?nxkv3G5YFk93IbUPx2U8sw6kXN0ijzuYypuLK99IL7bYR3MogOTKIb6nU0+f?=
 =?us-ascii?Q?ZNw9Yr0DiEjz0iQojidZCz48J4gtmiF8wKWGtOX9LIABsKxidWhDLoC1hbKs?=
 =?us-ascii?Q?Q7IdbKqvz5xzx2KuusMRirX3ba3ZQD1Y5YifqKDEZQwZfhDsH5cySUgqBxI3?=
 =?us-ascii?Q?+OxPEb28Dju100kX7LqlC45UIDq4LTlA2Th7cTcRQWfy1UaNqq7I9DYxfaFw?=
 =?us-ascii?Q?w42OO4HaKYItxGeoxZ1qj+M/Z9qrSKJk+sx+tt7Y41hqCzFKmSPqGdMBza12?=
 =?us-ascii?Q?JNk5ioAQihEypF8LJeVtkNc7TZN/BFe73fRqQNn/wSD3f9KME5VN/c6czu/L?=
 =?us-ascii?Q?xVGuiYSlki/qZ4NB+2wGeOmU4rHQcXxnFlfLN6NYXzC1Jry2fNVqntawrj8B?=
 =?us-ascii?Q?NGkZxlz5gM1l/0aqnaA2ikRgqJjhglPiAyp2wFZtezz9k8C1FNFL6opmKCN+?=
 =?us-ascii?Q?PdWDFDAmO/mRhnzBTEtDWn9fpPpywp8f5iYYCqKzKYwzZfc32Ld0l9tlz98T?=
 =?us-ascii?Q?tb4TkjvL29NyoWjFVWmy/vEPBf7Qgirs5lB1Vwj+RfupXgbW9hde3y1lcF1G?=
 =?us-ascii?Q?eKFUOdlEW9lKihHIU1BvRNln8k0h43X8qIAyZpBH7gXzX2Yw54JZ2iXTK9Lr?=
 =?us-ascii?Q?X2B14QIcNWSr9tCUQPEdJJNFUmtajj4LPO32p/1RabLQtABS51wH/OJz3MLd?=
 =?us-ascii?Q?5DSKikhSUG5IyLngLDk9kvtz6Nstb4fu6C3YE5t4vSj1ksBD9lVMjp1P8CBB?=
 =?us-ascii?Q?LmR9X/GE/JmzJDwwxGaLHZMluJyru2oMShO0AUmOEDzpH1WEg08JleAcrVRX?=
 =?us-ascii?Q?uZAZRjUoIpSzb/nHDL8DQ8wZLgrlUs3fFjSFB0wHznVgA7AvNrN+PXHZj8IC?=
 =?us-ascii?Q?C2Dyc67/FfrgOZtV5+c5+JRGe0aXjkrCpl2zIzjnjZh3XR69++sLVnqd5Tg+?=
 =?us-ascii?Q?4skGk/42qc3Zi5olJsntVGNpuYSgX+7YsVl6DLrleSUvyhSfw0DSCcDHDRms?=
 =?us-ascii?Q?E7oiNWLaVZKkNWBIef+Qdsze2AlnH7Gpfn1okXoqgfOExi5YE0wPRf9R+tEf?=
 =?us-ascii?Q?tKBR+Qct2oCIEUHF+toomTanHDQeKKiAcAvFkv74QYkukIRDDjaUlll5NhOm?=
 =?us-ascii?Q?AMEjh5vwcuINEaQ8/9IMwwq1RoMy79uxlQelm2+QR37M7QNn8X07d4hqL5TN?=
 =?us-ascii?Q?58sDgg+788+qg8jiEqIjoTZpsi3k2SF2QHrumoFZhVSVLFyqf0Rh4gWrDnAy?=
 =?us-ascii?Q?FV/cozIheoN3KXDTnz/SGfphn5NgFMTO7+Pt6M2C6gsjVkbDjLPaigGLX//C?=
 =?us-ascii?Q?eI4j0Z7D1woX9+SmIV7O7+ekSsfzFZxgtGC9CfQloGYy4UDSx5gFHTjQFvZK?=
 =?us-ascii?Q?3FuMHpugM8xWSpOeiP2on/OVyV4RdTKeaPiMY/ElJ5jEAq3g6uPoXfH/IpSy?=
 =?us-ascii?Q?x/88wtabtvOUBM51J7abq858QxEY/lFas6COqfj0K0JVXk4rx2CiZouAO4ce?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd5d9a2-b904-41f3-7460-08db8eb1737b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:55:00.2027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfNdBRxe5GnR4EG68aHyzMjkjLZnoCop7qPRTkme4DAcyWHjOsaiGHriBah79cSDTX4vco9smGzZa9/jv8LUAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 5/6] drm/xe: Add sysfs for preempt reset
 timeout
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

On Thu, Jul 27, 2023 at 01:52:34PM +0530, Tejas Upadhyay wrote:
> The preemption request and timeout is used for
> higher priority context or kill hung context and reset
> gpu.

NIT, reset hardware engine, not GPU.

With the NIT fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> The preempt timeout can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/preempt_timeout_us
> 
> and can be disabled by setting it to 0.
> 
> V6:
>   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> V5:
>   - Remove timeout validation, not relevant - Niranjana
> V4:
>   - Rebase to replace hw engine with eclass interface
> V3:
>   - Rebase to per class engine props interface
> V2:
>   - Rebase
>   - Update commit message to add tile
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index b1c13d27bcf4..990bb675d1e0 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -118,6 +118,34 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t preempt_timeout_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_attr =
> +__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
> +
>  static ssize_t preempt_timeout_default(struct kobject *kobj,
>  				       struct kobj_attribute *attr,
>  				       char *buf)
> @@ -140,6 +168,7 @@ static const struct attribute *defaults[] = {
>  static const struct attribute *files[] = {
>  	&job_timeout_attr.attr,
>  	&timeslice_duration_attr.attr,
> +	&preempt_timeout_attr.attr,
>  	NULL
>  };
>  
> -- 
> 2.25.1
> 
