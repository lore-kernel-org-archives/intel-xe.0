Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691F2EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 19:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBE410E605;
	Thu, 20 Jul 2023 19:37:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1F710E605
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689881859; x=1721417859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lR5ZJ7XD77tdkzs/ea+6GzBLpfZ/nSyNl+evvErP2f4=;
 b=PlSEj+mtTvWZM03tn48sZs8c8giUujqGVe6jIGnRaY6b8mALNBSbTIQ6
 1bGkWtK/5wQ9uMcsIWSYxlABkSczXf6b/Y4uUJQ3F3w+/UWkCltuIQ1NF
 3BjCsaVck0uwDW8zSLEjhzSWrLnzg2r2ks+QFLNHV+h9sKUVjJrYtiXCa
 WPbJzdrgGpvLgIyYABOXOgj11RnGYUrv78oQ56TW0QDiSyAVrfRZ6ooAE
 a0fEdjAh1MH0CyEoql7T5U0/6vLfDtSxxHAJt2XdstH1yRRUXoHAcvGsr
 5rImbVf4Paf1QqryycRI5cnx4EwIAqRqjnoQNzCe6SunV0Qvu4tCS8n7a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433068065"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433068065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 12:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="794677735"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="794677735"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2023 12:37:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:37:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:37:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 12:37:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 12:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFWuy9o51qx3YXmhqu7OdQZ4ejOVvDYq5JhmfjoFeCkfxKj9OuB7oM4aC/e8mSoHa3FxVLlecw/y6aWxjlnuVS3L8KMps8cGVleFTVXr94z62d2HNTnNgmVFwhcr5HHhjRrZ49k4G4GXP0LhR1e8mCZuH6c3bEgII9YWvrgeaHe4JVg6hBf+VaKr45+dPDqq5cIF3G5VVrlsFEK2XZ3s/40hLXGe/0FvHLCtKSynWFqWtEy/f81yT11yGME6fAhNt7095xQtdpZ7SupVwsiELouJDQr5Xpmi1c6RkzPTm+kSF7BcV+F3zB/UfFL8nBy+j5SKZshs5QuHwfjMDW2EOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3elTOF+9Lrm+0OQk1Xg5oy9INaVOtmyiECeoRb+cKJ0=;
 b=a4OH/4DRLCazA7W6dBurJqqcBGfh+SYGZrMJIbRttBwbK3Wqwa5upBrLBrdfnnFfYpXq6QWlRbXv/qDJicpyrtPbIRgGLABdlbjsqpmVvoTgVQ9EUNrW0rYse+c+TWqgGiLB5q7ZDPtySEzIyIyfEyurLim4NtLFbs72Axv1ed6uLaaSdCo3UswdXIkOS9nhK3BJfTpIfpRlmxruoOx888xOdYVib2od3WCclVUN7IiAa/7+MTdU5mcUtYMlgtfe6PSPl6Vp6AiFvazShm9lvlRa5Aj4OtkdQDMbXmk0YSGf3FS4gcFQfi4wyLvJsWcbrakSankXcL2cs/hhZYWljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 19:37:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 19:37:31 +0000
Date: Thu, 20 Jul 2023 19:36:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZLmMzm7i0NNPmo4a@DUT025-TGLU.fm.intel.com>
References: <20230720142510.534057-1-tejas.upadhyay@intel.com>
 <20230720142510.534057-6-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720142510.534057-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a199ff-e41c-4846-49f2-08db8958c252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJyweolUFrnHqQRNgfE6nnnsoLn9XFk7T8U8GZ5laHsIip2ZUYVuPD9NKVSpNmqgylzYmtyutHc5WYhXOjnJmcWfxrNUwcg+5RkWcEFioRV6MgI6fVeLt+pjcCaQrLa2vwuJ7pWqM8c6YaNekvtIAfmVdq05LDnopjkY7MQ8OGIUln/IEdeeb4y4DDe5a+gqIR043cu2L3LCcT0rTlfp7zkHqr8ppIeciE828xGNPyNvB9gbn33HlyUCFeT9tMlVavvN19n7tCO2WERWYSvTseyDQCTNLL7QfJsVZi6fD4HPaje6rA+YtnE41RsHVJMd6X6Wnpp6nohW85WfKFMhpXS/iaDGmn6ygv6QMwKcVBBpH52ciYGtdLs3pNXi4dvPG2P6ZiWfAkoExnoaCkhf3cyNgq3TEF2s65W30oUot0QjkbKi2pgX1TbIHnJgf9e79vok4k0+nKvSdeMYvr1qhSoM4MQ7fdxMeOLk7ZbkjUYuOZO6IaFJbnO/P71b1dbEBMAtUfuw6i874kG7p+KyDNI3bR2L+ewfjxu15RP52UtSurS0GCWfmqD0vubZa3gb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(2906002)(44832011)(8936002)(8676002)(66556008)(66476007)(4326008)(6636002)(66946007)(316002)(41300700001)(6862004)(5660300002)(6506007)(6486002)(6512007)(186003)(478600001)(6666004)(83380400001)(26005)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqhunNhOBd/XDtAHIB2j0fpY2oN6hj8CVLpEXDpWVQFiva051uHszzb2t1j+?=
 =?us-ascii?Q?/xYVORY0vDajGqdb1VX9/rWeit3V2re+7OZOJ2UQ4K/QRLEikNdfZUVouIOO?=
 =?us-ascii?Q?80IipJv9sUfuOK64PPdUAMQTNBK4rcFjrBL9yk/CAS450zxF6TjeLGxS7kZS?=
 =?us-ascii?Q?xBJ2vrmA5vY3FHyD9UmDp85xSWvdtcI6iJFgQmk+2NLbvDVyzFVZoH39LnAU?=
 =?us-ascii?Q?K+hwCwW7+0Hun+kSeN60Q7BN2ZPcsEvb4zWarnEI9jvCyir6sNfZF5SZJrMP?=
 =?us-ascii?Q?ZT/LusJoT26f2+6Qx09N7UKqS/ZtcFn8YEwtUALVYGvWdGBDqjM/1qZCJihG?=
 =?us-ascii?Q?XoCCHWehDQSVVVKzSKw/gg3KVYITMpCgEQgabXE1Vqo296xUHu4OfUH74yge?=
 =?us-ascii?Q?KYcOgyZo4m0t7wSrp5Iqh9kAKY6eADdfjuxWIKyH3lD8f781W+fU4TAakBme?=
 =?us-ascii?Q?qNcdump5pbwZP3YfhCbVIEEsnAPcUY+BmafkLXSdyU0VzjynhOineoBHxU31?=
 =?us-ascii?Q?+8uGjMLP0KLsXoUY0cDJbd6bNFPDY9l95wD+Vcjc1XNWH0YrykAwppyWHCib?=
 =?us-ascii?Q?7OElWsz57WQ60RnnsSW/SvvP2tBWJXpyrGxfNOPLoWjZU0AN23ohVo/wn6o6?=
 =?us-ascii?Q?JMROKFi28YjP8pNwC1Uyk7ebPKx1/4layKacHNY7crwYWVa5XNAv0ZULdMRy?=
 =?us-ascii?Q?v03j/oiEuERAJQI0doxK9b5sGSkOzxd2x+vh5oovoo4GK2KzkvSNOHXFzBIm?=
 =?us-ascii?Q?GBwXgRoROU+TDRls8epJC2pgmRJ6rOMrOyU/LN53kPaB2naQgCwgiRobgu7i?=
 =?us-ascii?Q?kIRFAG8a0iJ5iulkk72I1JMPQrPHGvMoD31gZS37RiXeDLWT0OhjOkILICsy?=
 =?us-ascii?Q?yYvDuIjok1YPJ/bSfLpQt6+Jx98PDklBvesjmRLTwhltXymJVDItICLpBeXy?=
 =?us-ascii?Q?33e6k+EdY5WIRzlqygFN+RdVOrBpZFY3G21TSXQJsJGVfTiSLeHbvCLrJo+e?=
 =?us-ascii?Q?X8SEUBoafoF66gQjzmhTjZJf5J/IIO07w0WpUB2qEEBQQcDq9wHbycdUFgAu?=
 =?us-ascii?Q?6plsfMAe8g/jiz703orAmpP5YC/xWyNuQsbuD6vrOn/NLwv14mwANqKCg00b?=
 =?us-ascii?Q?wzCvPtDtFlKCchih/pMZoqN3Pd+GowTcHIyoBc/5A+T/2X5yhCrwlr6HKTzR?=
 =?us-ascii?Q?r6Q38OwMBtkVFsn1NzCE/W4PUN6wtTEOoPoh9YVn29O2zKVh+0MOtNxfrTgu?=
 =?us-ascii?Q?G7R0LvjCK7EFD79gB7xWdA3774oPe7FjPRGCS4q3tBa1nZ5Rf1HUA7TgPeez?=
 =?us-ascii?Q?5132yazbtFUhe9AJqdEsl3BC6PeWDBrln7dDDeoih9mMoTx3ZSeOmKlGqHq4?=
 =?us-ascii?Q?hWJz1VOb9KF2VfEdfZVP9jrEoVcSmNV+Wp22HIPnNrY0rK8zQSZBFT+zN/3D?=
 =?us-ascii?Q?Ct6GZDgZi51PmUYFtUe4M9lgOATgUro8meYu0RG6wrNP5n4aUInGQtAk27cl?=
 =?us-ascii?Q?MUfjN7Mo25t/7iX2WG8iz0dgMY/QEd4IRzi3NS+Dv9CH3XVW6t2aT+5ABPix?=
 =?us-ascii?Q?ABL04EEo/FxDaOo1v4wfEk19nobqI8LCx52FH0Uay2n16W2yg6tQFDIGac6l?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a199ff-e41c-4846-49f2-08db8958c252
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 19:37:31.5023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D0RY7hBMDenda5R+6cKb8FEO3ZvjNA2XJ1XopTHX3IEIqOUXAMs5coVLhWsB2jP1RvR6TmREK3rEftO9yBOVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 5/6] drm/xe: Add sysfs for preempt reset
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

On Thu, Jul 20, 2023 at 07:55:09PM +0530, Tejas Upadhyay wrote:
> The preemption request and timeout is used for
> higher priority context or kill hung context and reset
> gpu.
> 
> The preempt timeout can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/preempt_timeout_us
> 
> and can be disabled by setting it to 0.
> 
> V2:
>   - Rebase
>   - Update commit message to add tile
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 7d2688bb5cee..8350f7441af6 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -124,6 +124,37 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t preempt_timeout_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout > jiffies_to_usecs(MAX_SCHEDULE_TIMEOUT))

Same as previous patch, MAX_SCHEDULE_TIMEOUT here isn't correct.

Matt

> +		return -EINVAL;
> +
> +	WRITE_ONCE(hwe->sched_props.preempt_timeout_us, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.preempt_timeout_us);
> +}
> +
> +static struct kobj_attribute preempt_timeout_attr =
> +__ATTR(preempt_timeout_us, 0644, preempt_timeout_show, preempt_timeout_store);
> +
>  static ssize_t preempt_timeout_default(struct kobject *kobj,
>  				       struct kobj_attribute *attr,
>  				       char *buf)
> @@ -146,6 +177,7 @@ static const struct attribute *defaults[] = {
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
