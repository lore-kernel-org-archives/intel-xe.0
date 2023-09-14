Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE0EEAA40
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 14:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2610610E296;
	Thu, 14 Sep 2023 14:05:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003F110E296
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694700304; x=1726236304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kg6laJ6eSum8RPS4j6UwwW/kfrnldBwA65UvRR+LB0k=;
 b=FoijKeboFmaIaHRqtZEA8Ek9LFliwBtrNk/7t6wrzYF6vee99mWfliYd
 vqENa/4Q1JCsZXG8RbZMmCdIWavObTLjIo5z5PNUcmTrxxUK0GVzA5aJU
 Qg4AaDAj7IggA+cAvd4dI7F3ovNBib/BoK52+UMhWDjMGdCtJ7yWf/Oau
 N+H0QXA3flEXK83dtzL+BYjSOA5JtNtqr5pstE8gAP2aSidsXxSo7r2eP
 QgqPci76B0xns1RssFPThyqUf9WiSHDeR5CdbISiXSDrL79Bjjb5HEgyQ
 siCz3DM79I9ZBSD9QCjusm1uviP9aNLcgy0pRnum45w7pUVmSOn1V2t2x Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376296084"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376296084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 07:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721289965"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="721289965"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 07:05:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 07:04:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 07:03:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 07:03:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 07:02:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofz2aj/8smciQnGdgUwWeXbmsZ3lEXpHsSk1cMbh8WnCjeTxU96rfhvBakfoegmWyRWV2VNqXk53+Ut9knRIJdrzWKeTyDM1r/UX1GleglsXRwn84bIBVcCKZcBz1Beq7lKJBVKLvT89xSf7ODNHebHdi98ZZg5c7i5HRnu8XGmxCORMrd82lrjZgdPg7FqNX6e9zTYEsIbxPy3oobEKlnn3VuIJlEgVi5Tifi9me79XdQJlZV8jn9AguXHQnTBcMSlV5WgciOSrXfqGQCSHoQVBvjLgJvVGOQp+PHw/EFd7KKo1x/g6URnGYHpIIDAKu4HDj33HXBUHHuD6ycbgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbGS3cS2SrMYLqr6RLJTDmX/kc6L+8tOUA8QCXy3st0=;
 b=cHRnMRwGigTfNVAtb/Slcy1PoI8kTxYeQxQM5YzHt/IWwBi4RoGi3MTVWl/IuWYfUNRy4GoYKUB4YmFbQS66o/PQcqpJpJCgooVM4aW7kpkSk31hGUDzDcF2lbVpC66Knbsf5CE7GJUiGH62hzZCG+RBpmiA0W+cZfYZLqlavHiA5OST60DRSaMsX+qdNO10EQ3II6A1N/szHB+qyMiyC/D6O9FRqPTu1vgDP72f+tefqgTXfw+V9sosQ34GIfO6hiHDleKqkKCMBtJgTl+aN20UrP4TwmYoIZOte1MIrAqMIWW4hXBhmYephWVlVlcke+O3TtH0D8lNUAKScRRXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB5700.namprd11.prod.outlook.com (2603:10b6:208:33f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:02:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 14:02:42 +0000
Date: Thu, 14 Sep 2023 10:02:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZQMSfcP5O8bRpkwO@intel.com>
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
 <20230913232837.2811049-4-daniele.ceraolospurio@intel.com>
 <87msxpw5q3.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87msxpw5q3.fsf@intel.com>
X-ClientProxiedBy: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: a2435ad8-6452-4309-5422-08dbb52b4352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wp3C7LedeUnmi5TSSyvJWxNmhS0N9W36/d9FLwGW6hkOBFHCMD52SfZxkNKSuSF47ChB05OCxtJfBz1q+7vhyN+EpUw9IWlEW1OCK33yNfztZtUULS8sJthXIe2ESNp6JHf+ee6vMOuSOS1nr5NkyIIc1UvaIO97KkA70gMarAEnwrTiKkWw9WcXR281MRczimXPLjEXJH4MReBE3YdzOMW8Z2kPSgUWFPMJm4sMJgxHtcAr4R9Ll3MdxKoLteD1/vS/1eKonhf9xyPzV48b1m1IRjCCRIslIEHYr/BwDCpGka8unqPQ7P2x3ujVJjW68bVYzAwyl3FPdCyWrHefRWFqHYiRmT3bFZT2+GUGl1lNlX+6O8UDLlAbM58yhEolMCbhkOx5im4p+CPiS1pxChIXbLN15MjWa0IQ+Z0NFlrdpsIM8Unlw99ooh+gtUEisIICtXSooG8lvPVveNJHAKUMR4qxXOpdp2TpViTg4J4JmbxHekaxDZm1k09AlIi93mfThuS+Enxzh+kV+ZYObf1W+w8ipfX7qKr6CyzRYsIjRQPNzT419rziIWEYI8gH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(1800799009)(186009)(451199024)(26005)(2616005)(8676002)(8936002)(4326008)(83380400001)(2906002)(44832011)(36756003)(66574015)(82960400001)(6486002)(6506007)(38100700002)(6666004)(5660300002)(86362001)(478600001)(6512007)(6916009)(54906003)(66556008)(41300700001)(66476007)(316002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S8wNL7ArH0EYJzEjNvOn3MfE+6vsxf1LK6CLgYuG5W+z7Dp/+xVAVs8KO9VT?=
 =?us-ascii?Q?mWit3cc+8u2WqxfLjbMICtV1wipNfbz68Zp0GHmZbQlanva2sSoM45iwnsRm?=
 =?us-ascii?Q?AcyRLdQ4GL1RzXvd62ORFjQlJQv9LKyNqQm3zc9Y+uK3uRQSZVGhCjkQFmb+?=
 =?us-ascii?Q?v9cZ6wx7Cmm+kajstWbWh36aS7R7gQU7quLHYhwu1hX8aig+7S7XnFbII0IP?=
 =?us-ascii?Q?XZGHJwhrshqaLoEByEWnY44Uz7amwncukkjSuX8uD4vIgyA6qI8gJD/vS/3c?=
 =?us-ascii?Q?Yt6s+dF4xQvbEKldRuDBkFHf213ZaQGouXjR6eyVHF8lPvazsxfS3nSe0o2e?=
 =?us-ascii?Q?NoL6jt6aug3R7HNdPvR6bJ/dSx8Xm4eFGqyr4Po9Lu5lcClhMCU4qysqDG9E?=
 =?us-ascii?Q?mQC9bQlZ7NiiU003dC+vDTy2G9/dpuIxDyQrst8NOlNJ4Twqhmni6qtfzGcn?=
 =?us-ascii?Q?MCHYp+qLq3lsH7p3YvjB7ab3GbWiJL9fLgoyE6StdCcSFQvsUz5sPrxDIUm4?=
 =?us-ascii?Q?YaB9b9sghLoQp2BXAwH3jheS9EvB9FMihTjryIDaxvYhikAbH5TXbeHuuTT/?=
 =?us-ascii?Q?zGL2gWd70i0jt5dZlrENEFlKt43oS/tlkgT7WOEZLjK4tMXNEAxS0MwcKL+W?=
 =?us-ascii?Q?NP1gi18a3AYKI+lg+WHazXsXsZRPlGNGsK0y1VbxFdhKyoChZrgN34atIbJQ?=
 =?us-ascii?Q?UU73x6Z+egmvbibabrHjWmitwlM28mraYXy7D1c/TruZGrVBrrTeMnTmP8XH?=
 =?us-ascii?Q?YFrzhDhKt8ZxRQNVdD40oJ3H9S8bnmLn2MR6CPN4qNV9CO72a2YNdItLcvDx?=
 =?us-ascii?Q?DfSmPtENdyg1HoyB7Zte7PClUuOfRFeyl8bnameEGmkXS2pq4kaInB+EJBbU?=
 =?us-ascii?Q?AG1nveNyGrohqbzUjZDgiHbJs4SFfwarEiFo0o4dRx39RzHn4kA28Gj8QByz?=
 =?us-ascii?Q?FpOSEKQ2lJI+73d+n0/hicDtm8Pj0x46ZZOrq9op6PQ+lCIgGY1XObY6jW4L?=
 =?us-ascii?Q?mq3++9dHLM5P85TfLRwx9ABKFOiaBJzCuSOo0HNxIgNOVxPzSKKBCPyqLS9p?=
 =?us-ascii?Q?1FgRbqcKM70LcKz9oMQCUDkE6fJJpbJEtJVrgScPplgrdZdzzJHqaycW6p/h?=
 =?us-ascii?Q?X/bcW3OrZn9P91+658QCL+u8tF/DmOSRg1ZDTcxd0BChBDGcHWXTGx1FBdSb?=
 =?us-ascii?Q?cFaCvn6C272SKN5Sh0R+IV7df0CZ7G90tX41cFTnHA8qaP07QGtODjfScwXt?=
 =?us-ascii?Q?ev5twTm/i+hwMqihXdsy7wcysipiw2XBWrhtUDb9dbProOewQS9w/9XQTdfS?=
 =?us-ascii?Q?7mbow4hjmqoOpwnbqVVXBOo8RhjAdPvqhUZy1vO6so9/UngdD04c95FWG0ol?=
 =?us-ascii?Q?ThqZbdzVYficYKES/emR2e8Jt4BvAQjfHc/19L01iHUTVMYUUMezypG0WsEt?=
 =?us-ascii?Q?7zUVSp6d1lXozrmAlW9b9BTVU1013dm3hhAtTioJ684dchQkSCKVF+/tLTw9?=
 =?us-ascii?Q?xOnN0L3Ej9a4XJDzU7vuJcUU8VgK/GOouTg/2mOtQJhIdR6PS2AN+YAy1d67?=
 =?us-ascii?Q?LsQNQ58IwYSBmHLi+nNDSg9oLQ3UHRCrkdhi+fp0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2435ad8-6452-4309-5422-08dbb52b4352
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:02:42.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTxc77JN/0N6moyBzin5WBo9Pl5QXYY+akGlHBNQI2v1gY9z5sJ+Mecg4xU8xF8DZxa+F1V8MQNY/clUvwMLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5700
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 10:53:40AM +0300, Jani Nikula wrote:
> 
> [hijacking the thread a bit, sorry]
> 
> On Wed, 13 Sep 2023, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index de85494e2280..0660017c3e83 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
> >  module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
> >  MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> >  
> > +char *xe_guc_firmware_path = NULL;
> > +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
> > +MODULE_PARM_DESC(guc_firmware_path,
> > +		 "GuC firmware path to use instead of the default one");
> > +
> > +char *xe_huc_firmware_path = NULL;
> > +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
> > +MODULE_PARM_DESC(huc_firmware_path,
> > +		 "HuC firmware path to use instead of the default one - empty string disables");
> > +
> >  char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
> >  module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
> >  MODULE_PARM_DESC(force_probe,
> 
> Not related to this patch specifically, but, uh, why does xe collect all
> module parameters in one file like this?
> 
> IMO there's two reasonable ways of defining module paramers:
> 
> 1) Module parameters defined for static variables in each .c file where
> needed, and avoid the need to access them in multiple .c files.
> 
> 2) Module parameters defined in a single file, wrapped in a global
> struct. (This is what i915 does.)
> 
> Putting all of the variables in a single file, and exposing them
> globally is not cool. You want to limit the number of module global
> variables in big drivers like this.
> 
> (Of course, primarily module parameters should be avoided altogether.)

Well, I believe this is my fault. I explicitly asked folks to avoid doing
what i915 was doing. Well, when I asked that I was more focused on avoiding
the macros and doing in the same way that other drivers were doing.

I really hated the explosion of parameters in our internal version of i915.
We need to do our best to avoid, or at least minimize the amount of params
and I believe the macros is like an incentive/invitation to bring more.

Then while checking other big drivers around we see that there are many
drivers doing the same extern exports as xe.

Would something like iwlwifi_mod_params from
drivers/net/wireless/intel/iwlwifi/iwl-modparams.h ease your concerns?

Thanks,
Rodrigo.

> 
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 2c1f9199f909..e1da1e9ca5cb 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -10,4 +10,6 @@ extern bool force_execlist;
> >  extern bool enable_display;
> >  extern u32 xe_force_vram_bar_size;
> >  extern int xe_guc_log_level;
> > +extern char *xe_guc_firmware_path;
> > +extern char *xe_huc_firmware_path;
> >  extern char *xe_param_force_probe;
> 
> Basically *every* extern in a big driver is a sign of a problem. Data is
> not an interface.
> 
> Yes, also i915_modparams violates this, but it groups the stuff together
> under *one* extern struct with a "namespace", if you will.
> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
