Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF3EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 19:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66FF10E605;
	Thu, 20 Jul 2023 19:34:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25FE10E605
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 19:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689881649; x=1721417649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T1ccbzdw6zVHyEIadBYFb4F7ERv6FE2JWoGR8Ex1VZU=;
 b=Lf+8ax8avgNXB5LYilMg8dvT2o5axXovablv9C8P67jjqmDzmAi6JrZc
 3XIENUkgOL3MinfQBgqlAakkG1++BlwLpp6Ol5mO31VxQPdOlUbOrSeHR
 Wg2cMOS34UN6iojT5vZFruzMA8Fwke+u9CZbj0T60BPnXexzNi6/7mNFQ
 u3/J9RhR+0oA+rRpiAwSBZvnYY27kbUYOs8E+LV2osNC5CIZNwLiISIJJ
 MDO6BXm/2nl4gH7pjXcPY2M0RLT3/L2v5iSYax21XThLkUh7LtkvlIbAr
 cOJs5zcS/HtZmFBJgcU7U9DR6SZKDjRKpw8WYVpnFyZon5Ql4Fxem15gA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="351729120"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="351729120"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 12:34:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814648387"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814648387"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 12:34:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:34:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 12:34:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 12:34:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 12:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IycfDI7Ya7R5bcx6uqvHTu/02Z8clBCY67x3bAtU1ZL52ob5k4KZoS8U/xHDqADnBqXTM24UZBYhv40lHtzcmbHm5Fq9Ktc3QEfZyFQLR68vThoiUiy7KR9tz3/2jHVOBVVNugOwOR0BvCaYhsvozuIbduLBxHUnlDJnhCmx7DjgT1s/Z/4lEUow1OUConElOOvBAyIO9wFXwpHYum48w+q2crDlblVNVnhz2YSA6DWQAvHO96JQGZ/2BDFXvjdfGW6xnjkoqIWRfuFBK2hWF25M/UqCIQLpagQYjxGCuoeVKJUkrhbNz2+aq7K5ajrvtKa2Nw5SLgyMhoenLLU2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoXd9Hf6VlRgYIgYkzRc0yC06foC5OR7AOmsXpKJxYo=;
 b=SKLcfyG/3QSYOdr+h8bnOsOoLhTiHT3CkaJbVuN8kYOL1QqoHa+L1tX6BM2L7Hc4uQzKRVmfhter7sV8TvxCEQKWzN9EQX1rrtlAjNSeafPUpf4o2ViIxGuqN3YKPV8FMnQjX6wFlHbY3Kg7VniY5vx8i9Bes5k8t9lMOWH9ECZJbzueh9RrqbjLyXPxNAahGznDHmrQzrnt368NAl7CHMs/Ex67g0aDdB/oRXyDCVJKtq6eGCvJ1HbtVNGyf7I6sAAuQv/YOLQSH2Z5AwdzD4fDJbxF+36wbUGAkW8GTt7GRk5Pp5vRLX9aP3ZDpzZHuV4pvRVaCIKaCpK0vAn3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 19:34:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 19:34:06 +0000
Date: Thu, 20 Jul 2023 19:33:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZLmMAJHIU0MAmYvn@DUT025-TGLU.fm.intel.com>
References: <20230720142510.534057-1-tejas.upadhyay@intel.com>
 <20230720142510.534057-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720142510.534057-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: efd0ea0a-92fc-4631-5c30-08db895847bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7WwwxJ0R/d7RVHrNA4jyb/JXbqhf2OwndyAlynOfH8KemdM8ihMx6n2yz/Kw26udZ9rM4y+vhv8U9MRS9vw3oiAvVtpX23j0Nh7lwNKYzG4/aHghq1hgjYZszQz/DzOJN5iW+2sy5+j1lo6/e/Rkoh9puRthDf6nKdhIeUzkT6/38um+xQv6xLmT3f1BuBXE5vkR/zT+t+iEcpxuZ2FYIiQWe1jZryaQm5qLna4sN1VT9MGpoPDx+bhDpopoDVM9wVWkW/iGH0A847EdJMquSnYzl9iMSblOZNyd5RdsIudcCU6aK46HEmElWGG3Yo5zEGRgRt2i6I0lyRThaOMdww4A4L79D7WSMbPogyCLZbdcTVvXixAqyZBOZzYu0ZwvC255ltlh1AWfiD+YxzdE5cVig0MBc1UJPYHf7d3kcqq8pNwMUiwDkYrfoDHqk+sGNBLQK4ElMX3i8T3/09z4MdnPJt0CaA5xdkjX88PDifihRGdqgDUIIoJEjTxxKiPwQBiaZeIOXGc7MKwjQvnyN5tI2CYPqs4Q432JrxZgslBxU9Mk4aMg/gNUKKnIlU5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(86362001)(478600001)(83380400001)(186003)(38100700002)(41300700001)(26005)(8676002)(6862004)(8936002)(6636002)(316002)(2906002)(4326008)(66556008)(6512007)(44832011)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7DBubpNo0NktHUvQPC0E0BCKADGwbTVjgXX1IEt/ozDk9awD0jchhfzkXju?=
 =?us-ascii?Q?+OgEWFW9ugRElu0kbdoC9Z4SkMfmTzrG6fUkNljeYN/utCKUcrwyt3lvcevd?=
 =?us-ascii?Q?C+OT3+d4t8UTbaE2NUHDgjpwUrQrFPB3k4bzrMGrzlQ5jzpTjlmeafTlfg+q?=
 =?us-ascii?Q?KFxS5+5kGupLnOHFNKT2+XUTGn0gqvQQnELawCVA7xDyskOxT0ttD10TGEr7?=
 =?us-ascii?Q?5Lw9XwJk2FOdiS5sYFxAytRMiTyMqHQ2hFALKdusenI1aQlnxb2/71sBEBRK?=
 =?us-ascii?Q?XAyDDCFvzChI+XZSz9S7rGww+F9D74/Fi1y3mZSrMvV7a3f/SZv/dVgYWMzT?=
 =?us-ascii?Q?Q5SuposTn0R3IT5IloMjYOgJ/w/oGNMWathV6q+0HeatnKq5nfKRrv/aOxLl?=
 =?us-ascii?Q?PdCPMeQytoZr1T5efmnu/KLABpevgRqRvLWmbvHNqhuAu5STDdk2JSkqCjFe?=
 =?us-ascii?Q?wNb4aPn8xmfixWz6JOfvgxdqXlGihtEwDUem3ImQ16p1nAV5cP+wiS+6hXdi?=
 =?us-ascii?Q?v2Al8bkyri+9a0LkhjlGPszR+BGDZszNSIE998MkyDIIDmtNYIXz0JJs+uZL?=
 =?us-ascii?Q?x/zeE9gXQPGDijDzW7GXUurZ70/Xop2yC25vjxYSbXMTa6wTX1oq7mt1EZXD?=
 =?us-ascii?Q?FbfPPaszk54PZcF7Zmw4n+GCaxeKLGdzq74LNKCqzDXENFBhO9GIaDfH5amb?=
 =?us-ascii?Q?IOXYUNN3IVGZoYifsqPYZL/ptpj69un7supbyPdwsMtd7ykssbsJD9TksGPd?=
 =?us-ascii?Q?FhyG4xhCmH4jb1iVtbuL4f0HupA4f6qRnDKjw+e3H2BI0Wi/yTYFnJ26VyiK?=
 =?us-ascii?Q?jlFwgZp3oDDoz5mH7eX7KMrZayrIoUjV6yZnzkCOXMNUzZlqwZHc08F9a1eo?=
 =?us-ascii?Q?YKPIihgVDN07QRRmdIKZGVLiQ/4Cx50AnNSwaFJ/seI773c+vaNSbMOtfofK?=
 =?us-ascii?Q?vPtz4G48vCIkmBaFhmc9+rn5rXRy2j0HY/+qKYvuHivLHBOFYTRDB5Zmy+Gl?=
 =?us-ascii?Q?0vOULz707caVq79BetZPVfhrFksMaKyHLCxqfoyCKBXjsBDpW93eZA7KYqQA?=
 =?us-ascii?Q?3WLSdNmBju4du3VUQaigOZn/Yuocayw+Z6ZMFQ5ZSZq0Y+U3cWIA+EhJJ7SQ?=
 =?us-ascii?Q?iP4jPqWBUjq6dKASB8lUenfR1D4KElcVqyGjW4KEnv/ylbK9EKxvGLns6t+k?=
 =?us-ascii?Q?qK1ilkPU89ue6Kpupzbuadq0w0vXKYDPpJ0iNvmWGe1BCKQq2ryZiHce5TSC?=
 =?us-ascii?Q?tiiKg88XDj/raSVUNH7K2u1/hT2oSLnsJ7JiAi82e9VXOYBI7u5/gaNsu/rT?=
 =?us-ascii?Q?zYqTbT5iHYyHQOtWNgsGAtSmj7mpn2Ub3bZNeYkh71OjhusZyo9v3QmrjWmY?=
 =?us-ascii?Q?ogKHDbAyRCtTtPmvuv+wMoamHfWInmZx4KFwHr+/+UR1fNGVMkYKlQzDWv0U?=
 =?us-ascii?Q?Dz4I7/M+kkqks2KbyL6rjHxVImQiO8N/06a28LdDyXlRGBF9yeGsi0M5gHgw?=
 =?us-ascii?Q?R4nk7TOIJZ+fNGMPtESzQ9N89d0ys9WyDquyA3/OX1IiZ0EcmTGnUJgiVmvW?=
 =?us-ascii?Q?iNzcNPggBeeFAXof+wEqjDrestDnrBAd8xIS5Aap3R7zsdTk4UwlmacW9uZc?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efd0ea0a-92fc-4631-5c30-08db895847bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 19:34:05.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ2GPtZ3FwcTUgEl58frWslK9Df+vMy+s6S7zExPLuETqSkywg3+CpMvFSvSG1Zut5fFgUwvAcuXx3EtkcV6SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 3/6] drm/xe: Add job timeout engine
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

On Thu, Jul 20, 2023 at 07:55:07PM +0530, Tejas Upadhyay wrote:
> The time after which a job is removed from the scheduler.
> Add sysfs entry to provide user defined job timeout to
> scheduler.
> 
> The job timeout can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms
> 
> V3:
>   - Rebase
>   - Update commit message to reflect tile update
> V2:
>   - Use sysfs_create_files as part of this patch
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> index 7804cc27bd05..7f4ecef4ef81 100644
> --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> @@ -39,6 +39,37 @@ kobj_xe_engine(struct kobject *parent, char *name)
>  	return khwe;
>  }
>  
> +static ssize_t job_timeout_store(struct kobject *kobj,
> +				 struct kobj_attribute *attr,
> +				 const char *buf, size_t count)
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

We need a better cap here, this allows a user to break the dma-fence
rules creating endless fences.

> +		return -EINVAL;
> +
> +	WRITE_ONCE(hwe->sched_props.job_timeout_ms, timeout);

Again as I said in the previous patch this really needs to write a per
class structure, not a hwe structure.

Matt

> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine *hwe = kobj_to_hwe(kobj);
> +
> +	return sprintf(buf, "%u\n", hwe->sched_props.job_timeout_ms);
> +}
> +
> +static struct kobj_attribute job_timeout_attr =
> +__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> +
>  static ssize_t job_timeout_default(struct kobject *kobj,
>  				   struct kobj_attribute *attr, char *buf)
>  {
> @@ -80,6 +111,11 @@ static const struct attribute *defaults[] = {
>  	NULL
>  };
>  
> +static const struct attribute *files[] = {
> +	&job_timeout_attr.attr,
> +	NULL
> +};
> +
>  static int xe_add_engine_class_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> @@ -188,6 +224,12 @@ int xe_engine_class_sysfs_init(struct xe_gt *gt)
>  			return err;
>  		}
>  
> +		err = sysfs_create_files(&khwe->base, files);
> +		if (err) {
> +			kobject_put(kobj);
> +			return err;
> +		}
>  	}
> +
>  	return err;
>  }
> -- 
> 2.25.1
> 
