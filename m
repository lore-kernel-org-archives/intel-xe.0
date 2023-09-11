Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F12EE801F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 03:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3110E0FA;
	Mon, 11 Sep 2023 03:46:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5769110E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 03:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694403961; x=1725939961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qVltqAqyqoFKo5RUK8l3TXqKIa4ZoqMLYZm59H8Yo8c=;
 b=fPrMPIwritIjqASOJ+vlsWhftMFxGKgzdo+2BTMxvSUqDORscOcm/HAu
 Ou0nUHhFCG31HkAPs1jvFeA4BCgLamBJwz8JrwVzm+Xt42CNlafSp/+sr
 hobooq82d6JY3Bhanj2HNTqPxtGsqTizrET6fXak0/ujlQ2uHa+Yt5QEH
 6D6EkuTeqEZY9RBgP3FOLHrBiiccyQW5DDgk+VkKbu+zyaRbg+YOXTowM
 KIWp/ncY+aHicTQFpGAuBfOQ7GXQ1eWriSkMNXdqWTyAuDpNUk0nh2X9+
 VQ4J7Alh1SS91dv7P3hg/WDKLPLJiLZTu2ae2G1lLa+2b8mVANKdBgLy8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464360202"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="464360202"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 20:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916875837"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="916875837"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2023 20:46:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 10 Sep 2023 20:45:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 10 Sep 2023 20:45:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 10 Sep 2023 20:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuevupnpEqq+kj2gyXWpxjpq5+Qd2ru3lJECFJtAo00K1QJ7cZHyVyUzWS+Q9hi6KRfobZ9SveCYh20mK12fd4FJQe9Fb4yLKf3AtXeAMKOIqh1AXSayGnulR0zbNLUXCMaEik124mLtFGwDjF1rzv+njZlvQmA064tllzxMNsorKZVXq48zjnbagWD8pkmqNfz3+vqxvA+lUtWDmLmqef2R5mvZs9tW+m7Hb2RxRgkPv2/NbGrqk/rkHv6P85OhapP1UHXM2Ojppx6j0pggmJeK/1qdmXvgmmXJV0ZDYvcv8JoljJgCHRQMdFwCuTLXXBdL6NKDKMFGH7aEhzLL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/tvtf7pU2Co9hCUo8lYrHle/cb3QEpRj91eQlB0fqg=;
 b=UdjtpIKforGvC8dil7JlfugYHXLVLuGu8MqOQohuw8kN9esxML0FsJ664dbfrscf7821mgyDGIoFLQ9wMBxSZD+7bhAOncNg1li/QkG2qonbBkfWimxfOEFsCJ3EP5m9mWGbq9X0l4RAzy8Cnj2PI7E/Ut7/XHJpgEz5SPR3EyJ/uk34nDestKatAnVl5ZGLK74hxRvlf6YrA0/NNELi2uNUk+aixnC9RYprze6YgiYgE8vSh6jo8sHf7yR0QrzNlyAnbE/TJl8DL/NuhQGgf56+wSAR9Fo//vHSj2ZU9add6aqw8PapZeUWkFhrhs1uGQy3qh51RUoKA/+/jpPgFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Mon, 11 Sep
 2023 03:45:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 03:45:57 +0000
Date: Sun, 10 Sep 2023 22:45:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ofir Bitton <obitton@habana.ai>
Message-ID: <tl37n5qledvt7yxce5sl4byon6puewxvs3ymfebsndnolwstg3@3fjfvpuzna5b>
References: <20230907193515.7-1-francois.dugast@intel.com>
 <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ef36eb06-d65b-6ad4-ac4f-f1fb2ba7a544@habana.ai>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e387909-b551-4544-9d42-08dbb2799b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HV4QSo+fOHNa2aUoME9KnvjxsAlpHnKdaqGvdbiA0OoDhtaFI8TGvCJcWYuqA//9/YaZB3SlrFiXPGGlSF7mbWF63DM4nD/vf0UY3lPv1yPIKrJCXEEX4C8Bq/bq8TgNi+Lmd6RfRxq7554bbTUd/f5jnpm8Y8ycGeUJhSFi68Cra6ZO63LmiS+o0/+GbEnydEEqUaLhoO31GmPBYk4b+DTpTivRILS0iNzLgsSmOgyiA30aBqCBmtPu9P5JLrzXHHTfQRDiAXfNHxNKZBsZtNc6PW0QPDIlb+g8u9yQGCF5fy1vpFwQoLv9JJ8pK2qf+xarOQYWRdTEN6T5hWcKkwxmvOi4r9dj4fZa+LUqhgAfoBYccYPw+rk+lDfXS6am8SdIYrjuH6+0k2doLfkx4Vb8+wK1I9ezXx7AHkuGPuxxRPNTkp3oCGUtGEA9FV4XvKTJosYif8m1cxfsiz1jGC/ULTeRcB7jGqCO77lobMQTmidgSRKcqDECY+7+2vl6i/T5S5Fvp3CrI7goIpkANBjXWCVSH3lr26qSD+ZlWM1WI86EbJPvDd3j06wTc0/LtUOGgqdQoHwO1yO0K8PuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(6506007)(6486002)(6666004)(6512007)(9686003)(966005)(478600001)(83380400001)(26005)(33716001)(54906003)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(41300700001)(5660300002)(8936002)(8676002)(2906002)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NtMqVvp3ja844cvZTBRHJRXaHmHiH3iYSiAVkoYVqaxf9/bYW9kQyLB7U8bp?=
 =?us-ascii?Q?WtzKDNl+jA4h/ZJCvp9Elfau3Qdb7uZBVejM7sKutvbjyIyV14OSXbwUUBbp?=
 =?us-ascii?Q?95uV7FPgWA6YJxLA8FvHllVDxG7vwx96EN5LXLqZlmVeD0NSCF0zEINrSzO+?=
 =?us-ascii?Q?DpG3wlEieKMr1pbahuORhYlf5y/1w/vvD44CJIl8dvCDWSTbG6rR6YBaYxy1?=
 =?us-ascii?Q?JoeID2AKmAsldGRk4sBdoB0rNfnNOGisGjyqfkW6HTV+w0COZSn4ofyFHFsQ?=
 =?us-ascii?Q?8aIy2rQNISjPpkTyBGUz/aDWogFbdQQ9+hBqqji2OwAaeCwftK9zD9Uljmub?=
 =?us-ascii?Q?8SvhaOBZwOZqp+2oQqOr+BCxN5Haqi5MiW5ekeMW4KxNWRiiTCKwxsE+0iAB?=
 =?us-ascii?Q?czkGkrT8pHO8Ew3WhOKiox37PJGo6BIR4hyjZZSE6OcNd3CMhNIakqtk9KgY?=
 =?us-ascii?Q?pJwHywUIrehkZ+/o8WcHZZxpD5LkaZUibVScsD9UVEa/zO1GfaQKP7sIx75M?=
 =?us-ascii?Q?nh8Fmg4u0pu0p8WDBLrK7dwwY0A609oeXQMVWf4GMbOmX4EUKE7GoWuyQivH?=
 =?us-ascii?Q?FvIkieDsV73kpbBUWXEmKozysHoSQLjx47LClzfdMQrwJ8m3JZJ48E9u2i/2?=
 =?us-ascii?Q?4cDU84EhLMU1TMkJDo4j2VKTA1vKej7LpJF+7BXUvrc6QXWdupeIBEgFE50I?=
 =?us-ascii?Q?2FCS+ht+ZS9RV+DTxCPYO7K1vdrR+N5DcfViQmHWyuvkf+Bn8bCEpkW43KvQ?=
 =?us-ascii?Q?0V01ncWx4QfDWP26+LJJITtLoUXpICc7h1DFZIQ4RINekarDjBwqiDwMWJQ1?=
 =?us-ascii?Q?TZASw5Es36/YhTH1UpmvqZdbQUaHhAavOG9/iLgN8QXXjIoMea8X4PXR/p/L?=
 =?us-ascii?Q?EAfBnICZa+6HcFYRCCp4u3vrcJrvVKXk2B8Fschq3ER+ze6NLNuBekeKQnXD?=
 =?us-ascii?Q?zf4MCRlgw0gXMR8B/A/mx5Eh4fZSvH9K3QfA20McYkfjWUiv5w1G+FDebvqb?=
 =?us-ascii?Q?2miyLyCtk53WwNHp9oBqQi0wWXvoHkTNysd1QzB1UKrKFbPSSFXjjnMMG6/g?=
 =?us-ascii?Q?ZwEqqFsv7dE08eW+jnHlGbygUOYmCeCPTYOPy+5PS+cJ17EcUxaP98CFJiQ4?=
 =?us-ascii?Q?I7v2JYlfn0dRFWWBgY25va5xrskY5EZrArW2Ugem8Zf0lA1nD2awIjx8l0KI?=
 =?us-ascii?Q?Sks02IsnpLJCTasp+zaufLfSfAKdqvj1jUo0s67fAznEBwYOfWD1attAt0AR?=
 =?us-ascii?Q?pUgzcNaDMglSrcYPTlMzHBNHuxCITBtvnN1bZ3EkAMm4arq31ZDqP0IsecFi?=
 =?us-ascii?Q?5wp1kfggoAudj5NRQ7z4ytWXRHGg6ebQ/cglKX7sF7FFnHsqbxhokkwxrIiL?=
 =?us-ascii?Q?CMqXFL5ZbxOSkmH9OoP2r8pVEKkcIBuJZnCZxcXfsOXmIUnbrJ+2k/fD3YWh?=
 =?us-ascii?Q?v32KXsoP56hnagjkYbudAkchzFD3nxmx+Sm7wCcyRGwezCDZfi9kwgYIcX/t?=
 =?us-ascii?Q?TnjBlL4/sNkXB8BQEbcgmIS1GFzlgewJFPrYe6pcZi6dBqJpvQ4lsZ8yC06j?=
 =?us-ascii?Q?OiX/gobXf3iK1PrR6050kTPrIugaql8NjvzyYMGsfLYu+FzFFRsCYEXjUGMd?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e387909-b551-4544-9d42-08dbb2799b3b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 03:45:57.1705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjPVAENyncrU1MRcjFsA1qeQXU4yFQz+jlDiS5XWCPCeZmP+NVO9Uk/yJqI4OUD+hH4ifnt3T7SBaIy6oCoDt2E3ujolbNLAbrNxFQU+Gts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove MMIO ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Sep 10, 2023 at 04:34:24PM +0000, Ofir Bitton wrote:
>On 07/09/2023 22:35, Francois Dugast wrote:
>> This was previously used in UMD for timestamp correlation, which can now
>> be done with DRM_XE_QUERY_CS_CYCLES.
>>
>> Link: https://lore.kernel.org/all/20230706042044.GR6953@mdroper-desk1.amr.corp.intel.com/
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/636
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |   1 -
>>   drivers/gpu/drm/xe/xe_mmio.c   | 102 ---------------------------------
>>   include/uapi/drm/xe_drm.h      |  31 ++--------
>>   3 files changed, 4 insertions(+), 130 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 109aeb25d19c..10fa1b55578a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -107,7 +107,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>   	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_EXEC, xe_exec_ioctl, DRM_RENDER_ALLOW),
>> -	DRM_IOCTL_DEF_DRV(XE_MMIO, xe_mmio_ioctl, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3ccc0af4430b..e636e3f3456d 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -422,108 +422,6 @@ int xe_mmio_init(struct xe_device *xe)
>>   	return 0;
>>   }
>>
>> -#define VALID_MMIO_FLAGS (\
>> -	DRM_XE_MMIO_BITS_MASK |\
>> -	DRM_XE_MMIO_READ |\
>> -	DRM_XE_MMIO_WRITE)
>> -
>> -static const struct xe_reg mmio_read_whitelist[] = {
>> -	RING_TIMESTAMP(RENDER_RING_BASE),
>> -};
>> -
>> -int xe_mmio_ioctl(struct drm_device *dev, void *data,
>> -		  struct drm_file *file)
>> -{
>> -	struct xe_device *xe = to_xe_device(dev);
>> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> -	struct drm_xe_mmio *args = data;
>> -	unsigned int bits_flag, bytes;
>> -	struct xe_reg reg;
>> -	bool allowed;
>> -	int ret = 0;
>> -
>> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
>> -	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> -		return -EINVAL;
>> -
>> -	if (XE_IOCTL_DBG(xe, args->flags & ~VALID_MMIO_FLAGS))
>> -		return -EINVAL;
>> -
>> -	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
>> -		return -EINVAL;
>> -
>> -	allowed = capable(CAP_SYS_ADMIN);
>> -	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
>> -		unsigned int i;
>> -
>> -		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
>> -			if (mmio_read_whitelist[i].addr == args->addr) {
>> -				allowed = true;
>> -				break;
>> -			}
>> -		}
>> -	}
>> -
>> -	if (XE_IOCTL_DBG(xe, !allowed))
>> -		return -EPERM;
>> -
>> -	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
>> -	bytes = 1 << bits_flag;
>> -	if (XE_IOCTL_DBG(xe, args->addr + bytes > xe->mmio.size))
>> -		return -EINVAL;
>> -
>> -	/*
>> -	 * TODO: migrate to xe_gt_mcr to lookup the mmio range and handle
>> -	 * multicast registers. Steering would need uapi extension.
>> -	 */
>> -	reg = XE_REG(args->addr);
>> -
>> -	xe_device_mem_access_get(xe);
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -
>> -	if (args->flags & DRM_XE_MMIO_WRITE) {
>> -		switch (bits_flag) {
>> -		case DRM_XE_MMIO_32BIT:
>> -			if (XE_IOCTL_DBG(xe, args->value > U32_MAX)) {
>> -				ret = -EINVAL;
>> -				goto exit;
>> -			}
>> -			xe_mmio_write32(gt, reg, args->value);
>> -			break;
>> -		default:
>> -			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>> -			fallthrough;
>> -		case DRM_XE_MMIO_8BIT: /* TODO */
>> -		case DRM_XE_MMIO_16BIT: /* TODO */
>> -			ret = -EOPNOTSUPP;
>> -			goto exit;
>> -		}
>> -	}
>> -
>> -	if (args->flags & DRM_XE_MMIO_READ) {
>> -		switch (bits_flag) {
>> -		case DRM_XE_MMIO_32BIT:
>> -			args->value = xe_mmio_read32(gt, reg);
>> -			break;
>> -		case DRM_XE_MMIO_64BIT:
>> -			args->value = xe_mmio_read64_2x32(gt, reg);
>> -			break;
>> -		default:
>> -			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>> -			fallthrough;
>> -		case DRM_XE_MMIO_8BIT: /* TODO */
>> -		case DRM_XE_MMIO_16BIT: /* TODO */
>> -			ret = -EOPNOTSUPP;
>> -		}
>> -	}
>> -
>> -exit:
>> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -	xe_device_mem_access_put(xe);
>> -
>> -	return ret;
>> -}
>> -
>>   /**
>>    * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
>>    * @gt: MMIO target GT
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..6c6d1cfa415a 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -106,11 +106,10 @@ struct xe_user_extension {
>>   #define DRM_XE_EXEC_QUEUE_CREATE		0x06
>>   #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
>>   #define DRM_XE_EXEC			0x08
>> -#define DRM_XE_MMIO			0x09
>> -#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
>> -#define DRM_XE_WAIT_USER_FENCE		0x0b
>> -#define DRM_XE_VM_MADVISE		0x0c
>> -#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
>> +#define DRM_XE_WAIT_USER_FENCE		0x0a
>> +#define DRM_XE_VM_MADVISE		0x0b
>> +#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
>>
>>   /* Must be kept compact -- no holes */
>>   #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>> @@ -123,7 +122,6 @@ struct xe_user_extension {
>>   #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>>   #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>>   #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>> -#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
>>   #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>> @@ -883,27 +881,6 @@ struct drm_xe_exec {
>>   	__u64 reserved[2];
>>   };
>>
>> -struct drm_xe_mmio {
>> -	/** @extensions: Pointer to the first extension struct, if any */
>> -	__u64 extensions;
>> -
>> -	__u32 addr;
>> -
>> -#define DRM_XE_MMIO_8BIT	0x0
>> -#define DRM_XE_MMIO_16BIT	0x1
>> -#define DRM_XE_MMIO_32BIT	0x2
>> -#define DRM_XE_MMIO_64BIT	0x3
>> -#define DRM_XE_MMIO_BITS_MASK	0x3
>> -#define DRM_XE_MMIO_READ	0x4
>> -#define DRM_XE_MMIO_WRITE	0x8
>> -	__u32 flags;
>> -
>> -	__u64 value;
>> -
>> -	/** @reserved: Reserved */
>> -	__u64 reserved[2];
>> -};
>> -
>>   /**
>>    * struct drm_xe_wait_user_fence - wait user fence
>>    *
>
>I would prefer to keep this ioctl for debug, or an equivavlent
>alternative. We can remove the timestmap part but keep the general mmio
>ioctl interface for 'CAP_SYS_ADMIN' access only.
>Any objections?

CAP_SYS_ADMIN can already map the bar and do the reads and
writes. What's the benefit of going through the kernel?

Lucas De Marchi

>
>Ofir
