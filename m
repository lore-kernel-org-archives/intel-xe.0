Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390E3EEB572
	for <intel-xe@archiver.kernel.org>; Sat,  9 Sep 2023 15:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5656410E148;
	Sat,  9 Sep 2023 15:15:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88F310E148
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Sep 2023 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694272528; x=1725808528;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vMon57uzUOFkshfIn+/J2Axs5+0m4+atSPLt1rUhPB0=;
 b=WPUYAG2mp9D+DycjxVmL7tbA+TwX38v071nAmkBoaKIURA8VqOtB15ty
 yJIUoaclOtzGboWZ5CuV9bwdGcomWEAWcAh1RuY4iN39zob5QTzWSbuZi
 AIpiONs8rcm3ipm3ycF0b5f2CNrmm7+RYGsJlOgbZXFSQDAfclFE+0opM
 JZJ/At2U6sl0RKVhrqSWKQT79Co9nG1Jl0VbGO6/N2pcqqCSsZLi34P6s
 wVD2eOSgl7N62RB0ssa/xm76gGU72yEy3jcntg2vWIZJf+x4fGSrpLVMI
 Z/ixJrKDEXRhdzQMQT/nzjFAgMzGzY0S7lrwlc02GqyrexkfOEakgDDiF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380553219"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="380553219"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 08:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692574473"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="692574473"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2023 08:15:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 9 Sep 2023 08:15:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sat, 9 Sep 2023 08:15:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 9 Sep 2023 08:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmeHZBok1SlS24KhSkuue1DamPyFs5zWjtTEuprYcg/gHKxgoZ8l0q2Mw0LKFX+h0hzqJ44EgTM3WrfdBQtdewB+au3/c2RU0FTtGHt5fXQrgnrEQUwPt5kBZ3AAw+7VYej7bF12h3NsJDpBnnwM3A3i9/wrt8DA6kI5n3PSnRHb5HkdPXUwjpivqYj/WbBij/YuOeC+X6MRzAW2sX1/5K8aSq4fbxB/Z9DCQAtpkNT59lGzLCorntgUcLrEAEl0fcUf3Xo1o/6YH7HhAXS7q8z0zwvJTsF9zYtdQhEMXatTzfQZy+45ITBn+G75vO4jLOZ0fxfMAcnB5PUkhBILoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtgxKT4x3FPFAvBJv/MPYJD+ow8Anj+tJyapi+hsbZQ=;
 b=OIp9HIoPIPW0ZA8425mgY3ZNNU6JJykLy0IkZkRtVniP0N+ZuVziqG5TaMlRxPDmJ7A0yiDOz4gMrL0RKF/4WqF397Q4t1BQ4j8U++2jvH+5/q486J06y73bs4OfVMmZBc2Brwms+1NcjLmqPxg4MG3qkaQ3HVpJMrNa5BYx8fNWA1Ov0wxmvqXNUlbDMMtria6c+tRtE/p7e8R25VVYI4FR/0nOtiVP0HkHarbvnZs7ZyC/wTWuwDqpQovYnpma1uNzEznp3f+kpiyQkg3Bqi5Sxthk0bFEpRiQDFYJl68fQ+8NssCUXRHsJViKOrqM1LmcGQCsk3vAAO+i9ZOm5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Sat, 9 Sep
 2023 15:15:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Sat, 9 Sep 2023
 15:15:25 +0000
Date: Sat, 9 Sep 2023 11:15:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZPyMCEmR+v6Hjarb@intel.com>
References: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b08954a-1c45-4028-55e9-08dbb1479792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0M3NRrRrrgJrCKDCLwADhPOiuFexmV3RGh7HY4MCgIWAQ4Zsmkw7aZF7vU71CRkdeSmjadt+ePWnXqLzUWO9zP2V4FqIQFFoYgaj62ZNii1Ylwke35WrxTkV+sD+HyGnT+bcWZdF0U9XO1T03/IKRcl/86UTEv1rmgyN8X3ActC66dpeDdSiDqXKeUzW3z3EJbMKsADFeiW2BeGPumkMfaOnQNNmIbPlqCFZXNnJwwovShAxI/nPXylg8DDIjwtw0QWaM4qv8J3EHL9JwmlzamkZVTEkgcuWZ036/hxAQAzdTha+cuQJAEPQ7+TFq8HAFYpyrcGfSD+2rvfWnESrHHS/JJy8fSFOYJeCqz4uclz0wb1uoP9GyZCeimIDsKAXNUTwcXAO8P8wn2A8M5Dxg35kP74lp2MLBNLLTx81PTqo1UStJaGTgCZRXIgp0B3FtVRPHgFZB0fSlVVFpq6EDf5xbOd+jO7/S+wZeS8oGVK1meMrWJfG0D143ERJekQZd02TjZ/m6//hFqFi0A4+UO8NH5tilKGOtDzHm8QK7kD0UBsLqkgai/qG56nwItcu8RmgWDygQZIVDRIUq/2nKipOQonHVPO+oeL0TXLuUq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(6512007)(6666004)(83380400001)(38100700002)(86362001)(82960400001)(36756003)(2616005)(107886003)(26005)(66946007)(37006003)(66476007)(66556008)(6636002)(316002)(41300700001)(2906002)(44832011)(5660300002)(8936002)(6862004)(4326008)(8676002)(966005)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YZDvVOt9feRdlWq5+LIaLNAnMXlfnihXp1F5SKxs44o+ChSRZtN13wGq5ryu?=
 =?us-ascii?Q?H8s+CaRnrtTJk3c6ZVJCONMwXOvwgrCFM+Ub9Q0mbFXEpkY4Ol+MN62tncBT?=
 =?us-ascii?Q?7dCY7rMSJVTvpaYJpkTNHa3nI/pstvzW25BfUoOFzDYY5djgbvqFr3hXJJQz?=
 =?us-ascii?Q?fnOh+6sSygOQW6mRsvf2YNS2V/+EISMsSmP3wFHlpGSizR2UTkC+p2uTpSCf?=
 =?us-ascii?Q?zRl7GTRWCn1nmepjPRKoYnkeKqW7nG9RRNMbL+nWl4sbp+XoJKOZPmxsf9Mk?=
 =?us-ascii?Q?KA0Oc0yUja9ZAFSp/geklniuvF8lF1rTDbwELA7W/u7KDvYZ1o+EwNfdpezJ?=
 =?us-ascii?Q?EyXBukDLealXvwawn1EsLJPbrEmhkYHftVfS7TbD0Y8mjs9yQoPXBCpUaj49?=
 =?us-ascii?Q?/Wi+72aUyhh3LzXAzuVfH4tkjAbTEhhE8pUqjLeXpmmHl/YnEv0GwUwpi7o3?=
 =?us-ascii?Q?QrjZQYzShBiLcVv+ZukplejdPClMSTThMmZO0na30s6pVOrt1BT2+jvU1Isd?=
 =?us-ascii?Q?DbzYYtxFGGe5+dsTO2d8YuNocs6aF9FLbqDttW64rUL0TO7v9yRY1oyxBNYq?=
 =?us-ascii?Q?tjJ5CXudgBAHDTbOeXNDZbKxtvvcLoDLSJY8PzqxRSdz7l4Y/byMJqNsBXLo?=
 =?us-ascii?Q?89ln9IcwMQOdkMsmyWXCznz2wEgFo0tz9SVKwWLZw74cg0GPX10q9Ivmt+u1?=
 =?us-ascii?Q?T/UKmi+JZbFqOeJM6m5o/+oiczkjGwzsWLz8mlVrg/BIWVin8/hWclR/NBgB?=
 =?us-ascii?Q?bbcc+fcDO5idgEZEY5L5xMwNioWJt7iyKLgkZNeaQauKCUS1t8xOok/Ni0uw?=
 =?us-ascii?Q?hz8WA3qkEEwlBDdZffi/ywDOoASFGXfK7THRZrGB2tC/LIpSDfJ11J5m1IpV?=
 =?us-ascii?Q?UfDn8GAXiKLuzFHtRvbjEd4hWvaxXvXLitFjiDeonW3rexDRfVH3gOSGbl6+?=
 =?us-ascii?Q?ouGFz1QFsEAbLAtuDYu/VQATXuu8jw9NpdEf42lHH6EZkvqxPbSGv+5Yu7IQ?=
 =?us-ascii?Q?aGe2BcxSBloPCETj8BT19iQI/UElOnebjGWBPGT9Ufwe2mYtHAab6n/HuvhH?=
 =?us-ascii?Q?MFUHoYBWo5vf4sRvXh8ojOXjlwb5vNwOyws4YmsPbyEAtv5jXs4TSi8/N5ub?=
 =?us-ascii?Q?g79NIsOCh/mRNuaC2qtinCURwvvNk9wtfyEN5rUrZRQZbXXDkQO1Pya/AStQ?=
 =?us-ascii?Q?wGk0qebOu4bhJ7nhP8zb9cgHB04hfJSkf8ShBnb4+nSpxpvDHc0zRLIQAIKn?=
 =?us-ascii?Q?HWsY5p3MipzfZOpGNh+vvhjYa+J85u1mXojsrnOZOQz5AVe/D3cBBaAgk0Ja?=
 =?us-ascii?Q?HhJJd/x0q83tv0tw7CoIfRSWzSmgziyp5gbFM8yK3FCixatKoZUgOSM9fp4j?=
 =?us-ascii?Q?qFXN+Rl2E/N14HA3kNwdLavFfh8vvIun8Xz44APGtPVSHeSVZh9tbOnXqFPd?=
 =?us-ascii?Q?3Z3MsgEu3+QVRnQ8s+pSb9pE7wZBzn7IQONDx5N74RUHZE+F7yrQPgNJtmBR?=
 =?us-ascii?Q?3WCn31zjUXHT4CmOGrwCALn4qAdCjx6VaInff1SJ/p12hp3sQkSS+dtIkfEk?=
 =?us-ascii?Q?4HXEY+r7/w+0NVIXvNEvPDI47+lS7U1wyJ8obUr6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b08954a-1c45-4028-55e9-08dbb1479792
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 15:15:25.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUpLpvDhh8bVI6bgm53pPxhMBvqF7OQS59VrZil0lHEgfgJot2HSCjXUXHD9QDgmbqxPTfoifn8peK6m8nsPkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Use common
 drm_xe_ext_set_property extension
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
Cc: Francois.Dugast@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 08, 2023 at 10:21:53PM -0700, Ashutosh Dixit wrote:
> There really is no difference between 'struct drm_xe_ext_vm_set_property'
> and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
> specify a <property, value> pair. Replace the two extensions with a single
> common 'struct drm_xe_ext_set_property' extension. The rationale is that
> rather than have each XE module (including future modules) invent their own
> property/value extensions, all XE modules use a common set_property
> extension when possible.

What about just killing this entirely?
https://lore.kernel.org/all/20230908203302.449041-2-rodrigo.vivi@intel.com/


> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         |  2 +-
>  include/uapi/drm/xe_drm.h          | 20 +++-----------------
>  3 files changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e44d71c679cc3..fc44249f13372 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -459,7 +459,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  					    bool create)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
> -	struct drm_xe_ext_exec_queue_set_property ext;
> +	struct drm_xe_ext_set_property ext;
>  	int err;
>  	u32 idx;
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1d9aa5c40659c..36c39589b0036 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1915,7 +1915,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
>  				    u64 extension)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
> -	struct drm_xe_ext_vm_set_property ext;
> +	struct drm_xe_ext_set_property ext;
>  	int err;
>  
>  	err = __copy_from_user(&ext, address, sizeof(ext));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 00d5cb4ef85e7..1338a64d42854 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -497,12 +497,11 @@ struct drm_xe_vm_bind_op_error_capture {
>  	__u64 size;
>  };
>  
> -/** struct drm_xe_ext_vm_set_property - VM set property extension */
> -struct drm_xe_ext_vm_set_property {
> +/** struct drm_xe_ext_set_property - XE set property extension */
> +struct drm_xe_ext_set_property {
>  	/** @base: base user extension */
>  	struct xe_user_extension base;
>  
> -#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @property: property to set */
>  	__u32 property;
>  
> @@ -518,6 +517,7 @@ struct drm_xe_ext_vm_set_property {
>  
>  struct drm_xe_vm_create {
>  #define XE_VM_EXTENSION_SET_PROPERTY	0
> +#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -681,20 +681,6 @@ struct drm_xe_vm_bind {
>  };
>  
>  /** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
> -struct drm_xe_ext_exec_queue_set_property {
> -	/** @base: base user extension */
> -	struct xe_user_extension base;
> -
> -	/** @property: property to set */
> -	__u32 property;
> -
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
> -	/** @value: property value */
> -	__u64 value;
> -};
> -
>  /**
>   * struct drm_xe_exec_queue_set_property - exec queue set property
>   *
> -- 
> 2.41.0
> 
