Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF92BEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 19:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE9410E605;
	Thu, 20 Jul 2023 19:36:34 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B310E605
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689881792; x=1721417792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S5PIGfurtxarenPRprmmAPKL/OQsyajeZh8l+bt5XdM=;
 b=W0A13z1q1rqR2yRGlaLsypuhX20ynsOFauHbmva6BY04RBn65UYFLmIs
 rtVehEvUonIDRsGXmgexEbRVZXbCZkUD2akj19y5r1i2AJnWWHvyWqtvz
 XYD0LX80gw9g/2mPYr8SbhetADfDgxTk653H3mw2fTQOGzq4QHK+xVmG7
 p1aYRFk/AIsL+lwbjTTvpAkGK7FHcrssxgG8UdP9w5Ev6ruHcmDPjMilf
 8k4GYdxVtKl600RweiHpQIj+yN9T4WDVkhC4YDHWfzWduSv2G5YI++7Ql
 vc+sKdgGSMmqARfmtDa0X7Wn1l2Mm1dUi85uF1gFN5NSHMAssdeGgknfw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365744935"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="365744935"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 12:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="789947029"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="789947029"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 12:36:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:36:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:36:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 12:36:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 12:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YySBHV2X+XvOtxWV0faaOB/6YvgLyZzsR/E6OPpzQb1miV6P8mOOnhoNHQNqzceve9ow4ZKyIQb4naPytkCekEuFhv+P3dzRbQ5uiN4h9RYxqpBhQO8X3N+aQtIzGZr51KHytbYStxI6OMvRUbsvj3tun9Jb9idtqQY02qULc4PRmx4pU1o7C84x/PhfK03ykqJ4vw0fNG4XgtD8CJMdwXGcq6+sSjfBXd43wzPt7Cw180XHUR5BqaAe6Nqo1rMlE7X/jYnheBu2FYqHgQ8nNoxZmqO7BeZT2dRWWCcdDzMzmmJeZ/jN1pzUVNupZXR4YKS8WD4knbeW/EvSumqvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tbNplhWZ7p1BKRHOvZKWdN6+z5+gVF4hUJxqUNVGGQ=;
 b=NqgYomA8IeqpzwvwR1cOIfXM3uV38EbXE5TU0PBn56ZsM5DwDVzAhno9vFi/PDBJZ1J0uh42ZimP/C9nZkKnwx8LNWh4/11jZ1JR7GNIXM4nv2LjkblQRF958fWo2PqyzO5SbbG62SnjgwrrS12wABeYi19tp0ZuAdMh61mkKUdnmOejBaON0myAzNZdof/WzhGzFODBiwCNGQ+ntHLkHaby4yp2npgWIUcDXTWhWsaEWCgw8pbFxtLx9OQJSmVJ9hlLujBerJtwF0MIgglToTRsSEPGZUsJiW9vPbq1NID8/M4bDKivVtJrsg0cgzqG5S60Mw2Buz6TjDspHP9P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 19:36:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 19:36:26 +0000
Date: Thu, 20 Jul 2023 19:35:41 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZLmMjSlc3hXgvnok@DUT025-TGLU.fm.intel.com>
References: <20230720142510.534057-1-tejas.upadhyay@intel.com>
 <20230720142510.534057-5-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720142510.534057-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5b7c81-cfd9-49e2-6629-08db89589b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: If6QHVCVbL+zjgmV8UNxTIvf7s10sYR1FNOdYSBV80KDFXclnezT01jkQwwDRJKZyFdQg4IYdh/Uocy1V0tsy3NSVt2vYVL8ezfQx06yTqVKkrt26WYgzXeeKtIKJlf+OFp42kue7rBLerLic43jPaI9Fzqf5np3Ga0M5NnaTq7WsVHWJ4Bd6Nw/qvQRyHg5J0FogOUJEkmXYGtxJUCANVpKxgv6HU5p4ftVu4v3yDylhc61pG5Bpcg15iL45ger/kNdEuEPQFlWY7veasTwlUj5wQsLJsBSTwJCn59EGtRNgEAzdo8xb8dSrhr5rQuMt7RpG3NT+cXgVasv9acXIqlUuW/n/2yia355If3i7khUjpsk/WkV07obDEmANnNn98Pt4E+R1IfSeDr0hWL7Fc87P/O+B7CPf009T47G2KWgGVlehJDz9Ye2U3cixgABTkmadmMzZ882nNFQMUry+cXx1gkuUd7Xe/3BOe9aNNRlKQJ/qQAXeNhfER9otN7veXEXlnD2c9XhQ294BGMLaYAU2jNVG0GSk/7jm0Q3CG/d2udL+cncCClnBe5/ucI3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(2906002)(44832011)(8936002)(8676002)(66556008)(66476007)(4326008)(6636002)(66946007)(316002)(41300700001)(6862004)(5660300002)(6506007)(6486002)(6512007)(186003)(478600001)(6666004)(83380400001)(26005)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iDj+QrmFv5D+TaPJ7UoGBWygBPon+ReHnIWvTzYh78zVDlLRtKxUg/jXMoVs?=
 =?us-ascii?Q?795syJm0NiU1riVeqKuyFh2zTZ1oKXaCLGJb7b1fat20L4Nxvo7CrSiliDkp?=
 =?us-ascii?Q?DkEyQ08haXy/Jg5Po6oM6x4jkTywctn2uKZsClvLd+ZNgJD9LKsCZatkdBgr?=
 =?us-ascii?Q?aA2kKGCnzbdc++UwzACp/Q15S0YUhEdbEdrYs0hbZTCACSPcvvu8ltr88b0u?=
 =?us-ascii?Q?s2LAx0twS6poIo71UvuLxcRRhY1/YuSVWGvVEBgnlHBqRSkcobptl4NQt47t?=
 =?us-ascii?Q?sG6OD73KdswSrwwlAHBgyTls/dlp+07aKPeSbgUv70wj36Nn78YrRTPGp7Np?=
 =?us-ascii?Q?yTD2r8SVNS12U+/Zm0Sgv/ZNe82uMAsqW+PEFOsmCL4WsksfPGoQfFyWgZB5?=
 =?us-ascii?Q?rtjwTqx+hp0qb7heUzzmiL4HeDETFA2ld1VUKM8E79l4VYSFRRaL73oYPZCB?=
 =?us-ascii?Q?itM2Evq7y1yhHfQzj2Ckble5RgChr99ZVZU6rE2Nf66fiznU2jpZmh40d4EQ?=
 =?us-ascii?Q?yROVl542FKKIuIlKhDWkRQ3KCZwKNSzIh5mcuYCWkpZJ+lZakmr6kvAostcE?=
 =?us-ascii?Q?YOWF+bBfTyz7c1MFVNjVBS+pcLyWE7ut1+N5bub6LNQJ2Vbb4ZrYZZ4102Fm?=
 =?us-ascii?Q?ExFO2Cc0u8IkIdzKEojTXTD0xdAzzfjRFDLmx/ov4d5PdQVU3q+9oUXmokLJ?=
 =?us-ascii?Q?toT4nex+jgR4dv/WDO75z8ZvXFBPZTpkJiJFnP5J3DmYMvbjcFlCteDEwJPC?=
 =?us-ascii?Q?+6xA9X/EAri/Ihyp8XgqwCbhCV3CAUmBgISltQRPlTQBH0I5eFQTArEmovp3?=
 =?us-ascii?Q?8I6Q7tkScS8o/eWqjJ2ZDHQY/RznAqFKFq4ibtKEh1c6P9BXRu/Mf9pm/2dZ?=
 =?us-ascii?Q?Qz4bNpKhQHhcyW8pE570GHVmxCNC9calWcj/9PJgDmkP1vgPzzJ7WAoDf+vR?=
 =?us-ascii?Q?f4yj120Iu5FHkazLMmbMAYfTSTGUpF4MDkMTMvZlYZjL+ovI1tEPRmhnB5aX?=
 =?us-ascii?Q?5aNkCe4Uj0nfBtM1TqCvGhNLVEidKxX4PCt4I72i/oJPrJBXaVR9jwDMaqmH?=
 =?us-ascii?Q?CEdSFnqRvCdz+B8WkPp99oDgfiBCRntEvW7Ou2nIdq7njM9gA0zV2O6RamwT?=
 =?us-ascii?Q?TskhawiU+bCmOO40+3Zud5Yy57++98hQVLCpO4yxW8ULR0873Lk7SnYTuPm1?=
 =?us-ascii?Q?cW0A570VgXdRbzpuOycMfveBxmTkeh4R2V4pnrqjDXoITDK37YAunJXFIAFr?=
 =?us-ascii?Q?h1lipkNztgDv9jsRVvHMHuv3i97v+fDO+ToWdEP+Yv2I32ZTxCSmQmEFXsZO?=
 =?us-ascii?Q?A4H8MFbWE/ejssj0wsOUg1lGDxVwDoOs4raptVkTl8dhJ0GopIzhI0m0//Dr?=
 =?us-ascii?Q?87YR4TaVqOGQv5lpZBM0m7W31IlbRX6k6VIshMKPYzGe6Gw54r7vv2p3tvO0?=
 =?us-ascii?Q?uyUMKOxAh0ib/jMyRJ0tVZwEV+fcwX4KAfEeK9APXBlYv39DTN6RWzxFLDTW?=
 =?us-ascii?Q?lSb9eUmNI+VcydXigL6KZSnXQPo5XkitgE0GrW72gNcyuAclWFbHENIgBwKA?=
 =?us-ascii?Q?4ulAEixK1QAo9ejmylJbK0Nk1gKKOEgKIHz6BkQwiaMMsszmg6iQIB/RD1qU?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b7c81-cfd9-49e2-6629-08db89589b8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 19:36:26.5745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76QNM7jYsA7CNhlKsOmGiOnxilA44UTPdPW4+1hfk/s9a/5U0iMotBf8IS721pPRNEXQMkAvHqGAcjMWnEtCsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 4/6] drm/xe: Add timeslice duration engine
 property to sysfs
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

On Thu, Jul 20, 2023 at 07:55:08PM +0530, Tejas Upadhyay wrote:
> Timeslices between multiple context is supported via
> guc scheduling. Add sysfs entry to provide user defined
> timeslice duration to guc scheduling.
> 
> The timeslice duration can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/timeslice_duration_us
> 
> V3:
>   - Rebase
>   - Update commit messge to add tile
> V2:
>   - Rebase
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 7f4ecef4ef81..7d2688bb5cee 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -81,6 +81,38 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t timeslice_duration_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (duration > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))

MAX_SCHEDULE_TIMEOUT doesn't seem correct here as this a kernel value
and max value for timeslice_us is a GuC interface value. I don't know
what to max is off the top of my head but we need to check with the GuC
team to figure this out.

Matt 

> +		return -EINVAL;
> +
> +	WRITE_ONCE(hwe->sched_props.timeslice_us, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.timeslice_us);
> +}
> +
> +static struct kobj_attribute timeslice_duration_attr =
> +	__ATTR(timeslice_duration_us, 0644, timeslice_duration_show, 
> +	       timeslice_duration_store);
> +
>  static ssize_t timeslice_default(struct kobject *kobj,
>  				 struct kobj_attribute *attr, char *buf)
>  {
> @@ -113,6 +145,7 @@ static const struct attribute *defaults[] = {
>  
>  static const struct attribute *files[] = {
>  	&job_timeout_attr.attr,
> +	&timeslice_duration_attr.attr,
>  	NULL
>  };
>  
> -- 
> 2.25.1
> 
