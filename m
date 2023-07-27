Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63089C001DC
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BB010E5A0;
	Thu, 27 Jul 2023 14:52:18 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D76A10E5A0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469536; x=1722005536;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gGy74P27ycr785R/6OuM6fm32o2183XeHnwn2wZKYL4=;
 b=Jb+iMRlgGZJk619+20Hj2eK1LUI5exqZW3N5yZJe2g7q6N5jbzYOfXwV
 c/1OrkYf9ckIBF6GGjqphqYwGFzcPthR89DwvdeRbHwDfbRqnU+kU0Tgz
 pvPIxVpUfKjxBs3PRoc2eYXL9jagrJ/UENcMnE0lL8zevJ2U27FTvdPeR
 rRsIt3mm2COa3Q0o5eWrVOkbZv/IYFJexYxbCXsuhUIvrfZBJOa/1oSng
 jrJU5ce2s7Fe59+IkM8Ueprx10TlBXBXSgN4C0bk+aeottNiQW1gOe7co
 in5oU0pKWg4VTDiyt0o8rOZXGFL9xtVqFBcSs7ZBLSKOm8biEbvBSjhKd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434617488"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="434617488"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="730314978"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="730314978"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2023 07:52:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:52:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:52:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:52:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TElBLspHzIb6BbKn+QHpSyjJ83E183o5CVqa5O9fOlZG/4cOk+7749at1fNtPxR7lohRk7HsixN4mC1WO9M2vXpqwtAYh7HDRSP80x4XBQkp0pI0g1ZGSfy0N/+pLU9OUboxkq5QQpKZwH+k8zb+c4jTTIbq8wvRcFeqfzaKzQ2424y7GwpEHZO+42grMW/lDd726Hbancf6FQ4T6UUNDhVyBt7cv9KThPykurnMcMaK0EnfdXYhn+iAsPnxei2JK/FkISmcpISPOLjXzn+i3eLsB1BGxIaUi1a1KvETYoKbAkKTLHN6KM4+5pBefeZsQCDoXL/Im6R/+CHXirwAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoloFW1tErH6YB+F9rOqSzdR7rcf2PmnR/c/dCYfSqw=;
 b=b+kVoS+dS096EWmOYtwf7hGsizdg81bssQy0mIWExXIg1YiE/uyOKqxe/ZSC+GLSpivV1UMMSwerW97yKaCuOaZaVnB5gpra/DJFlyVuzyy7S9X7B6CUzaETyaW0eMfCdYZNP3+z6O0Qd5KMV8tILnSrjzfEAaFPELqBD/h6vKkeC4YoTZU6LJQzDwts8Hu2rAZmTYldtLNFq0tdkkFR9Quyf2/Adm6GumlI0D+3a3J9xgLGGoQ7DjXmSiTUaHtvqD5gTh2o4PzoPOIflgK4kDTMldHFHCEzn1QctO9aO/LZU7Cccoxbxs913yZrbQhOjL9AIYyL7HO9u4oyyF+HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:52:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:52:12 +0000
Date: Thu, 27 Jul 2023 14:51:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMKEbSZE6g76TTuB@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727082235.905240-4-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0e241c-bd02-487d-8e48-08db8eb10f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ahaVLQ1FbAS9XyoePb3S9xl9/bt82Q65Q9gnnvfIVNUK41ttsLOP2e5AG+Vj7Lli1WQA+RWMh2aKccPYB8hx2IPHV85MamF9CQttLLIszEADU8MY+wSFGWSgWTFfnCM+7CfkZqT/bVI5SiYZw2IM9x0MS3snuGgPRn6HEQl3qIiLmgI4p5Mcc/dWKxokXG9GzGrRXy5ImQdm4+i3QdX55tjZnEtLYW+/ZKZvnsXH1dXFZY8FrWNCX+qwexrOWNpU058zBtdgXF1GTheRDNOlB8hj2tPg0x9yZdBjje7ZhvGiletFjAyqEdoGko1r3pJWzLni9XoEr3L11x8bE+mNOndPLZDqGt3MtlMAoBD0C8RaUN5vU+AGyYOZeJ+7tziZpx5lm/UOXVuW+9PM6yiplBapdtVD1uLS/NPtUG+2GPtHHF1v5dcYMiFsQIE0DCkjYd4ibnitnT/RsxP4pmg4e4vuuqq+y+yBT2p117o8zVBLk24QHUvXWMqTwAE3CDYgoKUetn36IZ+X3h+DA2uoaMruwp/hYXg+Ed3+aZkuUhl1gbNcnl31A62Xcm7yCrj7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(82960400001)(6666004)(6486002)(478600001)(83380400001)(26005)(6506007)(107886003)(6512007)(38100700002)(66476007)(66556008)(66946007)(6636002)(4326008)(186003)(5660300002)(44832011)(41300700001)(316002)(2906002)(8936002)(8676002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRGLGrhn5rr2NtYfC7gBPo7+5dqAcdqJA0Py5gxYsGCz7qv251wfNZjJY/s4?=
 =?us-ascii?Q?9Ciu3SMom8tVmOYf42H8VxklClaYmTCD8MjZ8nj19D3Seu3XrJwySkOLMBik?=
 =?us-ascii?Q?3ksKprnpPK+2UcT4onMduLnkAzCHn/ezXEqKciW5FAdplg4JbzGlPaHXJAxG?=
 =?us-ascii?Q?CQHD+N+idw7RQ7mA4X7wVY+nHVVEPmJhN6klTsesVDH1kqJovEFTogXvRrYg?=
 =?us-ascii?Q?LSWTT8xqvh6NUE5wJ0RTOfIOMdRKApzyYsxsQMmFKIg40fou5L+zTNatvrNl?=
 =?us-ascii?Q?+B99q1o61kjB+73V5jW/I8sPp3dtYZwk6yTYGi/w8IEQEnXtz4SW9YwzttUD?=
 =?us-ascii?Q?ZsmvUSbkXs9At5duxaFc0HZF5AweOwP77bigWM7c/+rY3NmwIygTAmTlQwcg?=
 =?us-ascii?Q?vJBnlE84fPOI/a5VknzCqMGZPSi32b7t6RESo1l1QKhO94696E29yFPorxB0?=
 =?us-ascii?Q?oXVDLh2dhW2RclMR6glReNlXp1g/+8VsffI2nKAqJf0H8W1fSHicnl8LI+Xw?=
 =?us-ascii?Q?q4P/cIRRx0uCRLMTRFKvbOJLCSt4PX6OTAKEyz1nAQ/+pUdAcXQNkcpks9bo?=
 =?us-ascii?Q?CweP63LlnYpzWarl9sfu9u1NChSJm/AvN6lGdkHw3p7EiQ388+xV/fLq8Mqr?=
 =?us-ascii?Q?q/N9hU019K1vh2bptvtDMGeF0YgVlmDMDxHmnvagMDkIy3SfV4CHt/goi5EX?=
 =?us-ascii?Q?30b+EOuBwqea4CCVekeDS5F9wqtEDLWlqLTz5X+aD895/Cn2TYhYMukrya+q?=
 =?us-ascii?Q?O4KfwR4/pO3AL9KlpwOrh9/qVMHdja2u/NwuWPijUrZVRIXnVP+X7S4NK3pD?=
 =?us-ascii?Q?NOGLs4o2lBaqpBds5EWMG+ujSDd4XLbatWny2kZgP3FR9GHdxJhkmSez0DOB?=
 =?us-ascii?Q?X5b+PQUx9OAMcsbDRXZWeRpb0x307HtZq95eM5IV/g5oHmryqKq2sNfXpJmS?=
 =?us-ascii?Q?myFSl7tto7oIv7APsvOgmQN7tNINvw/2WObXz8qoJHDA4fYSkwXqnj1sJMB9?=
 =?us-ascii?Q?q1ZR7ufcDjYCMe7yQIT7pI2qToH5ykgaH2oqyyLCPOe4UVKkFkFHUbrQVLn5?=
 =?us-ascii?Q?MgQHCTcDz/rhn9x7JVRLcLoW2Eh0KJ5hxbBe/D4X6a2rrvYOhK2h4g1wPW09?=
 =?us-ascii?Q?Ck8jZgpR1sOQ1jhMvXstuTZ/ub/Qx3N9Nf538aepqTNh1hvoF6qAucGpX3Af?=
 =?us-ascii?Q?c8TwX1DC8plKU8vXL5oj3DAGaju/V/pmoWFTIfsmbUVXpjv5hN/2MfBk21gF?=
 =?us-ascii?Q?VJBcFwR1GCmjhe1mQG8oEo7ZYOKR5iIUxOUz4HJW8AXWlig0GCFdYJWS7C4r?=
 =?us-ascii?Q?ZO3WPtMZq0RI+pSI9boIVXUOVHvAr3sFgEOSn6ZHzt2OU1aml9+njpPcD//s?=
 =?us-ascii?Q?1U526zFl/9qysZUCbGUBoDI96AY6mX3+W74T/hsuxQy/uPyNAL3p2c2lJkyT?=
 =?us-ascii?Q?e4qFF9MX6IN4+AdQc5yD/EyT5cINL1QnJxC/dD+uBBIydKMTI5c/RkqMa1WG?=
 =?us-ascii?Q?ODe6T1Rn6R4P22N355xMmDT7FzARZLuRLLZ4yMr5Gs+loaDvjIGQlEWnprUL?=
 =?us-ascii?Q?umcn9TnaM/iXTJ8vsg9LqN5f1Xq6K2EDD3GGoLhS29nCzuPmZCaise6WKn71?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0e241c-bd02-487d-8e48-08db8eb10f70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:52:12.3597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFSuBE7G9BbRJjwdduwzvs0za7xbIfkt+nCC/2CuSiVEZLtfdAHpC39gHFTJ60qCmrL0Yfa8sPRHP37xK163hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 3/6] drm/xe: Add job timeout engine
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

On Thu, Jul 27, 2023 at 01:52:32PM +0530, Tejas Upadhyay wrote:
> The time after which a job is removed from the scheduler.
> Add sysfs entry to provide user defined job timeout to
> scheduler.
> 
> The job timeout can be adjusted per-engine class using,
> 
> /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/job_timeout_ms
> 
> V7:
>   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> V6:
>   - Remove timeout validation, not relevant - Niranjana
>   - Rebase to use common error path
> V5:
>   - Rebase to use engine class interface instead of hw engine
> V4:
>   - Rebase to per class engine props interface
> V3:
>   - Rebase
>   - Update commit message to reflect tile update
> V2:
>   - Use sysfs_create_files as part of this patch
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 15c2b0b9f1fd..5e2dba0be8eb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -39,6 +39,34 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
>  	return keclass;
>  }
>  
> +static ssize_t job_timeout_store(struct kobject *kobj,
> +				 struct kobj_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
> +}
> +
> +static struct kobj_attribute job_timeout_attr =
> +__ATTR(job_timeout_ms, 0644, job_timeout_show, job_timeout_store);
> +
>  static ssize_t job_timeout_default(struct kobject *kobj,
>  				   struct kobj_attribute *attr, char *buf)
>  {
> @@ -80,6 +108,11 @@ static const struct attribute *defaults[] = {
>  	NULL
>  };
>  
> +static const struct attribute *files[] = {
> +	&job_timeout_attr.attr,
> +	NULL
> +};
> +
>  static int xe_add_hw_engine_class_defaults(struct kobject *parent)
>  {
>  	struct kobject *kobj;
> @@ -182,6 +215,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  			goto err_object;
>  		}
>  
> +		err = sysfs_create_files(&keclass->base, files);
> +		if (err)
> +			goto err_object;
>  	}
>  
>  	return err;
> -- 
> 2.25.1
> 
