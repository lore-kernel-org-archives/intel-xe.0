Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BDFC4167B
	for <intel-xe@archiver.kernel.org>; Sat,  2 Dec 2023 05:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B0B10E163;
	Sat,  2 Dec 2023 05:48:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD31F10E163
 for <intel-xe@lists.freedesktop.org>; Sat,  2 Dec 2023 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701496111; x=1733032111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lWoW9hRTzMHRBZ+STfO8648Bx8lL+F1pTTOxnu/RFtM=;
 b=Kb8fFlvbjTa93TzEDz6H/WsPm80tKCdi9r5aKH5IOWcMUX6xignKh2ST
 Dl2ydiwj98CWCjYkdkj/lc2KrS7DgTiI2BI5613HozR40WziFDpQ7bw/4
 oPTJfXm3KkYQ9akKWccoSjm+yzI8JItSX1TgxNtLIj6HlbR7Qz+lQ5GRd
 PalfkDs7852JSFkIywQIY5JzTSmP2ojdcMqojaCnc8tSQ59lnI+azQV+J
 QhKS8c+gSCEzOINBOwlF/MpzdqorbiIZiv31QNmhs/Qzbqflt4hj8VyKd
 YBEONZtb3Z4uL0iOrS6qjLKJZ2+TaOe/HlaP9VvoQAM3x+ooKv0mreKjq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397468911"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="397468911"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 21:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="887896483"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; d="scan'208";a="887896483"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 21:48:29 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 21:48:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 21:48:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 21:48:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 21:48:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T00v3D04xB5dYIVy9BG/PR5BpuNDyqaYR0ex0Y8n8qFgh9OfZNK2VPK6iRGmlYXaUD17oSIRkBhyghtSW+Z5Ppzjn22+2hnVyl91Ygp0AIJIDzBgoM/J3d9oyXcuYQlysGRI5hJMr0I1MXFXkwZAbRhjRlfLuFiMUUEBYb1VmORFcWeNZ6PyZildyrKQfhooDIXPbJJUxAhOw+j6TC8mq9HoPqQxdqLcD1nlT+dA7Px9QeAhncFfdg2BBUfqBu8KZJiloeePwLRSWegxBlCRbp6c+ft08kkwi2rqqAqpHJtBs0gIrmJFXTwoyGwyLaEKQVhLt51r6rasgc5hozAYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOUumq5fo/ySKHOffTwtu+yt741ZSDeIkXA+lFv2RvQ=;
 b=X3Asct++4Fcihp2WuZLkzwY6D5iU8aAg/QDPH9Xm3zTgVrv77ULqpspDzyEtnLlpYvIh2emUBtlyNU3Cu/+IIW0V2XPHogAhCKn3RXG86A7o1UVw0Qun/1z6siQ4reQlF11r0Mx9gJRMyHzODOh39S0pZT52GS1eDfkrPX0F41Vr8U1jmxo44UcQpJmrw4VFU2yHqqA6Xjzk1Bp5ih4oXmjX2mEBGcM+kFtB94+gs2eGB6mB6iMGj59UBK336oSHnt3TM04Gll8+AyylX9oM/I70MSXzTETzd4qBGXulEaWDuh91qNDn0fLW2xNOzDgCxgacWSflfKgL3aVXTDN4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Sat, 2 Dec 2023 05:48:26 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 05:48:25 +0000
Date: Fri, 1 Dec 2023 21:48:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <ZWrFJ94oDqiIN9pt@nvishwa1-DESK>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-3-niranjana.vishwanathapura@intel.com>
 <ZWpIzR3ucjwkNRty@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZWpIzR3ucjwkNRty@ashyti-mobl2.lan>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB6400:EE_
X-MS-Office365-Filtering-Correlation-Id: e5893a31-cbf7-4ffa-e14b-08dbf2fa4d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxLOQDjfwmImG8pkC1ZaW7eMp676A13iPmDXvf8q5LEXfrraV6sLAu/vwjnklyUtnobTag6prtVjzWuMmxbWRhwNGH0bwBENn7TKbzrYzX6S0JWHVp4trMzj74X/sKZUtEdyD3BxsN8RkGn6NIWSkikSwTScM/B56/URnbxsmIYf7skXFOi8qKiOkK9rV+SUCobXPJ/s45RL7a3RevFSrvfX/idMoSomSKlqejqIt946optP41Bh0Y3XfygJHms/zjD5rxj/k8PXwwI7ddZ7R0JWcmBJucN3P8HkS3PHLY5992cnQhSH0uZhY/C5YzMpL+R+JfZ0PY9bSweRNZ3O93whd6enVrr6YXAWH/9a/rRNgrnOftW0Cx5gSCXLYRpUTLfHZu+I81G3207Ijzv7iT1bxkH79zBllz3SsEAKuviYiwFB9FtMUraqd5Fsv1tbAF0xYG9A8y2C8pP/vY94gT/1UIbriKXngCZEhoRg6BUOjqtCXv3O/l7sDel8PxlBHHnPh86gZFVPDa2/9yBweOnwflfY/klcPgv0k488ggFeVUHzP4p10Zf7ZerUvY60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(38100700002)(86362001)(82960400001)(5660300002)(4326008)(8936002)(66556008)(66946007)(6916009)(316002)(66476007)(478600001)(6486002)(44832011)(41300700001)(33716001)(6512007)(2906002)(8676002)(6506007)(9686003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J/zevRRNdH1fYmgRw417EWv00J+vXjdIur+KKdZbJBKQIblgwZSD329CfStk?=
 =?us-ascii?Q?H7E5XGFcTuuKbACLDvIkLsPJEEHKffONlGgqpjA4uhCc1VH5sDxD51DnX1N+?=
 =?us-ascii?Q?rOu4RHTmzSaXZu64un5ZLHpZCifWIclaIjR9eXo5UdJEYg+F/KyOjT0BIO3t?=
 =?us-ascii?Q?3SFKaJGxKcdrcttPlZJMCglAlAiBCAkLwx6MuDMiMUxQ0GEGr2SqQhEoDAoH?=
 =?us-ascii?Q?dP3g/aOVuOpgHVfYDX7EGY6dX9DOk6OTUcKjBmo1M4GuKfOW77I+dO/8jIvK?=
 =?us-ascii?Q?3JdwrfydxqV122A4wgxZA2GArZDIih+o8xQuJvLltKDUtSi4UeMJpx0B7YoI?=
 =?us-ascii?Q?Dj23SJg3MAcHkf1rhQcVT7n6s+R9baOB5TH9HVnslJhcLHOGGicFHjuybYY+?=
 =?us-ascii?Q?Y2d4WjxgI9gIKUehk9F+YvrI2+iw+FtCVDBdhPtAKqzZvGttWGdq9pLgYMK5?=
 =?us-ascii?Q?OMwAXOQ6TfNXgOU6RiMm7u0jhhmz/qPOX6zdILwpn4gBZrdUegtxyhzeAPhG?=
 =?us-ascii?Q?qPclwOfaD85BkcvK3WUIzBfug9G4fSFNleFSMlhUab+/MWve6Eq53VLJ/6Sn?=
 =?us-ascii?Q?tYARRXf3JYGrwJ42xLF5mtNfNhdug4Tet09HzXNgOFegu9pH8kx1MU4RqQqW?=
 =?us-ascii?Q?SBHGwO3MS5A4SCFFtGfEqgrdosXsSZKgQOyQyVLfAGqoN8C5u06wdzRTPPXF?=
 =?us-ascii?Q?GXmscuht/IsrBY7tf6a06I0ccmTNV2PRAfzHC4St0ahPjMY7WciDXuUrybKQ?=
 =?us-ascii?Q?QpNmEox8/ljX/KCCGRHp7lrY7ctU5JyFRUZEzQvs8hMwNBQEaxqpID8lk3MS?=
 =?us-ascii?Q?4rNAOr21gJoPlyn2H4XePBFgyDR8jAlr8zmeZF0v8B739iG7ccwgO8oEijae?=
 =?us-ascii?Q?ZTE+siG4g9Ux7Wbm4QPW7ZG8O0VIJdA5V7z++clr7gZnlRLn/IykAcRU4TMW?=
 =?us-ascii?Q?6l0u/LV6+xDLrU9+HTfXnoDaNMYEL0MX5VnnSHrFgFuZn9YmMPTsOBnnLBu+?=
 =?us-ascii?Q?WRZac/5NbXjAAVkCbNRr+LjerW0gMHZQDJh8KxHmQcxvIZDS8AonjYdmaBRN?=
 =?us-ascii?Q?uAXips7Xt4v/hF1PzbsOAcm7j/MOn2tDChuoudith2zraD7sWUWKwkR6YvNr?=
 =?us-ascii?Q?Q0mPfagNfQM7+mE+TMv+2QlgWLu65LAOJk9cK76X0N8luzZIiUB8ylnTORxg?=
 =?us-ascii?Q?Qv7yYG0772tZQQWWDNQD3RNuqWPJuNRVsVsOJf/ao6TZA7HJ7dxzhnQSl/kK?=
 =?us-ascii?Q?4ZKpwhdxZiTShE0Sn840kcEDKTOCpUxOpWuWI2Li5a6naQiEcOHwtGJdqT7B?=
 =?us-ascii?Q?hMWHg/W7gVs+5aGqaCbwwPP2lHlS5s45Ay2nrXgugzT+stTNXygbPv2FFfK5?=
 =?us-ascii?Q?CX4UphoJG5TFK4sm+uH+ofuM03RfLOFBLf4FNyCMz00gnovVKeSbwB0BshqA?=
 =?us-ascii?Q?fRk8HD+Tl4bJ97IeBUIHQOl3rpUMtR8aHjXhQhxWu6MKr6yycBtyGHBnuAPB?=
 =?us-ascii?Q?01C1PJ1mux2/g7y36hdCk8nET5BuuKyP5jqnmAuIcgVHtB7trBhzhgUZ8onX?=
 =?us-ascii?Q?xXrnLAIG+JU0qqU898zI4aEPnqYjSa9ff6//xxB07KLq9Y5Qc8qlLfZYSufV?=
 =?us-ascii?Q?EQi9TDcIYaeXoyDqARaz6pM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5893a31-cbf7-4ffa-e14b-08dbf2fa4d56
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2023 05:48:25.7804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CInSTtY+Kbb/89wPyjwZEdsd7xTP51Qn3FBvd0jRMukPSsi8qVylr2S7RYje7E402zQ7Tt/aXcYG3xaNBGkJOH8U4CsDTG52Z3/dAovoJZBBBG/k8ChmO8HpF9Zgy4eM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe: Allow userspace to configure
 CCS mode
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

On Fri, Dec 01, 2023 at 09:57:49PM +0100, Andi Shyti wrote:
>Hi Niranjana,
>
>> +static ssize_t
>> +ccs_mode_show(struct device *kdev,
>> +	      struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>> +
>> +	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
>> +			  gt->ccs_mode.num_engines, hweight32(CCS_MASK(gt)));
>> +}
>
>Please add separate interfaces called:
>
>	- compute_engines
>	- compute_slices
>
>and each of them providing respecively
>
>	- gt->ccs_mode.num_engines
>	- hweight32(CCS_MASK(gt))
>

Thanks Andi for the review.
Yah, I like that idea.
I will make it,
- ccs_mode, a RW interface for reading/configuring ccs_mode(num_engines)
- compute_slices, a read-only interface for reading number of available compute slices.

>> +static ssize_t
>> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>> +	       const char *buff, size_t count)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>> +	u32 num_engines, num_slices;
>> +	int ret;
>> +
>> +	ret = kstrtou32(buff, 0, &num_engines);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Ensure number of engines specified is valid and there is an
>> +	 * exact multiple of engines for slices.
>> +	 */
>> +	num_slices = hweight32(CCS_MASK(gt));
>> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>> +		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>> +			  num_engines, num_slices);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (gt->ccs_mode.num_engines != num_engines) {
>> +		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> +		gt->ccs_mode.num_engines = num_engines;
>> +		xe_gt_reset_async(gt);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(ccs_mode);
>> +
>> +static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +	struct xe_gt *gt = arg;
>> +
>> +	sysfs_remove_file(gt->sysfs, &dev_attr_ccs_mode.attr);
>> +}
>
>I think there's no need to remove sysfs files.
>

I see all instances of sysfs_create_file/s have a corresponding
sysfs_remove_file/s, except in xe_tile_sysfs.c case.
So, I think it is better to keep it.

>> +int xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int err;
>> +
>> +	if (!xe_gt_ccs_mode_enabled(gt))
>> +		return 0;
>> +
>> +	err = sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr);
>> +	if (err)
>> +		return err;
>> +
>> +	err = drmm_add_action_or_reset(&xe->drm, xe_gt_ccs_mode_sysfs_fini, gt);
>> +	if (err)
>> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> +			 __func__, err);
>> +
>> +	return err;
>
>Please, don't fail if sysfs fails. Make this function void.
>

The caller of this function is just printing a message upon error.
I guess we can just add the message here if sysfs_create_file fails and
make this function return type void. Will change.

Niranjana

>Andi
