Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A96CC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 21:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627B910E518;
	Wed, 19 Jul 2023 21:15:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4F910E518
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689801301; x=1721337301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VCsxZhwaNWYPbb09qgoZr1c5AbnD1GGDI/tnVbKrLDA=;
 b=Fnf05ypvi2VSG5aMqYT+8a40ypBPfImDWtRHnbHzOO3aTY4JgtaxcpMl
 f8VY3U+dxKu8UOyH/Q3kbzVUv30XlheiYkvZostCFliFk9vC6Abpg9hed
 aZgaTJ+7TnZQaZqi5Qp0p/NgWVh7gB1S0DC3fmXHGO0QsNvs+kpFsqcKa
 5z4JbcpP58IZR96Qyyjlh6F5abuTRVjId4UH2m2Bo0bhFz9NGz+I7NbAJ
 rjfuoICkaDFkBMIrZF4WHjIjx7q2KEB6ufXeUm5bNJUre8HXUWTol6QlL
 dXet3BXIUIhNha2/JVHxJ795NAfxmefP1rOgMMN8jbnBUpFUKwxiO9khp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351435024"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="351435024"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 14:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="724149907"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="724149907"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 19 Jul 2023 14:15:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 14:14:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 14:14:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 14:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHlUCgNaH7yThp62JTmN1s6lrXWAroVQ3c0UMrHtbvr5SFxBf0XDt9u8ib++akJZcy2YOUvsZPwM41z+LnqoV8BJzRa8IUss8EY/r5RqKsa1sJiYbkMJhJA/ydO4GoIQRIvli2vQh0X1sBoJllwt0amMtPDggEATmnKl5QuRs/ajTEW1ccL9sMirGDqKL92ms4I2I2MaOx5mY7e2OVxgathJX8wzktGanbvdtxSbjpFpIxUkNgaiDZYcSJse305phXZtA7lLidsfMDddlvEGuLf+GQDr3qWFknLpmjFRqUbatdjsepCpSleZ7hnxHdcQ6dirSl9J8eeyKfVI6rvMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoXVkN5gMMG0G6IxOavW/Aw+o2CwXSOz2KOk81Uvc0M=;
 b=Eal1+7ghb3JIsw319tiLVJC71Q4xbRG0sOJpfSpT/HTJUFOaL9EjzSmxzmKPSrOp12VgTUdbXUbiKKzyilx1DGAABmjuFSzpOCH/2PHSuiXnenaCLwmvZIGl73eYOPbChB4o5i1adHz2e6X5RoKr/fFpbTZHsdXKqK4ovyxqoE7clyLRPL3NPa14sVOApLDBWcyUMbOHEMgO6928LTJhV87YkhiCkXsfzCPs1XY2EQ73yYsgoRiqXj1TGT8Q35c0He5oGSsqw72jkVQUUGaRSiAIV81j1GZIJouTOy1JnuMVww8j0HdO7tnXxEu/abIw18oBdiX7UeNn7CDuAgAR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6489.namprd11.prod.outlook.com (2603:10b6:208:3a7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 21:14:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 21:14:52 +0000
Date: Wed, 19 Jul 2023 21:14:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZLhSIWt8KNY2T2vq@DUT025-TGLU>
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719192726.172056-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: cd785c71-2990-48fb-a06d-08db889d313c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xoEGRiHNLRKt5iHY0STgT52GqCoErVyDz9Yp2/wPPRLDeKwRqbCVo2hfybdU6fIzlXWiFSSv6MxvuhqXYCZbqFWNe6ZXOlsuw2qQWnyxBby5z6hczXwZ2S0bSajh8wCgybcJPXALR5PiFqIpIspWLQIK18ltqJUpPL8B3xW2CZBRXlsBYi1vUEcIDRYMljd5IaIPNRaBB4e1JHqrblSdEmfhXsduGvkxDvJ4ILCB/ZP/RRhl1j1jbI5cXHMZ763U1vzIJNWult7JhQCKeDJrCE/5/7+HB4iNpl0vFlgDhpcd1N1iDr9Rls1hgBgOrXPOOk4azMB/ZhOHrNd1H3yIN4YuD0JbR0eMmWXM9F+JGF4Xeyo9Rn1HGRfrEwbChnqS5TTwDO4QfuMBh1g82XTaeep44QG7mUVJHmJginNtBefv/LVjz/NKMVuV6U7RfuCjx2kHUih5Uy0GjDyBcqA/ssbRjzSy4DJxUoH3/TabxDjJ1YiGzMA5th1T0ehPcryYtQJ/zZUV6NzxCbtdje+Hx3NqfsElWf77LJaBHoqlTAkRgcj7sbNcmi10TCNF3/6Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(107886003)(26005)(186003)(6506007)(4326008)(83380400001)(66556008)(66476007)(6636002)(316002)(66946007)(8936002)(8676002)(41300700001)(5660300002)(44832011)(6512007)(6486002)(6862004)(6666004)(2906002)(478600001)(9686003)(33716001)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y1kBZ5Y1eTJQ+dvYx7LRZnRqGKq4ZvpXlcxcTgkDsSj4gZQr0oyAtixks6Dt?=
 =?us-ascii?Q?s+uCW8Rvvz1Hkb+/YkQ4d7ea9PtbfUnCSuGJMVpAlW1636th/py2CtW3t5Pu?=
 =?us-ascii?Q?WWA/L4hhFPlvi6HAKI/XrOsifBKrREXew2ol/jeIc9dlQpzl3v/aS/dbh37h?=
 =?us-ascii?Q?2Xa4VhC3ruP/y97eNHf23hpf5Q51wJdbXabRrSLU4IiiDgsSLs/Ex7e0WWLO?=
 =?us-ascii?Q?6oOjtN0wunStqFImpR7yqRyFwWiOvxVSiUp7UtvdFMfG3ePaKY89J/v9mqH/?=
 =?us-ascii?Q?q/oAsGLmFbwQ+IXwT1vrCZIKc2uGbsKmIjchfbwCMFeHQURUYe+GnWtQ49SK?=
 =?us-ascii?Q?3k7B+cg43CsuuVAnKCyF1Kr85XqVG3LOasmdTyzohJ9lyPQzhFIb97fVsaD+?=
 =?us-ascii?Q?KziVlQJLI93ebjWhPYHU/P8bvVhXi6Pj1ONGOWBGIFUSIjLH1qHLebttFjHk?=
 =?us-ascii?Q?jFHRHqNPZ7aIWTIOVTEc9/GdVKV83PtpettIPrRoUXM6Uo2JFNYKzhV4g+A9?=
 =?us-ascii?Q?+gSanrjmQZR5V4xpP1vo1HAZNfkOalh204cR8TOYMSOleaoOmJ27TBIq4HfN?=
 =?us-ascii?Q?jx+yTiAL5abdIyk0QgqBKVvGBY1uDb6VHgBXBm/giX1bUz9pHK8ZSTmTg+z5?=
 =?us-ascii?Q?erpk8fYQ0TTM9d4/GHVto+LkI9zSYoGG+JwkXTSfuIk4ycGybKiQUacWtNiZ?=
 =?us-ascii?Q?Fay9YoJ7Zodk5uyCubJ91tG6/PQ2g4Xixn8BbvnIygQPxwE/HbyGnPccQU9B?=
 =?us-ascii?Q?JuHcQN9VskRT+NMQQ1puOsOAJBqpFu+f6A5MZFqpNno+Ik0Pbl1ZHFVqgMeR?=
 =?us-ascii?Q?o6iH9i6bijP1HASfaM2QtBrqnDAUeQBFEuTAZsA8JFcJN/uZJCM4YI+e89CU?=
 =?us-ascii?Q?1KAGHTUNup4Pw/J5e6m3t0ob4xpP5JbMzMT+83g8dCQWCmOfO2WlFub+r5EN?=
 =?us-ascii?Q?Qjnghkpdvzdlql+Nm2TMTwsaq2dcJ6QnXWU7RAGQ8juLq6OIWMoZfXf+MeFm?=
 =?us-ascii?Q?aJOKGcwrwceqclGrzeyNVop5S/EUVR/WC4zofV8EpksjCuXubgRaJiJ535PB?=
 =?us-ascii?Q?envngfhv8W+PzgPKxxC+9VVfl7i45hAmWAXFPBPm4YWcgnr0v2jvX9E59S6v?=
 =?us-ascii?Q?JoJTf2S08Tw/G7iJgk4BKJ6Zv3KJOVtRuVAVbSA6fdpygrl5SMHnGCBcm8GM?=
 =?us-ascii?Q?rfVbXHmzW99YlKANE+3o+ColtoUKl4EY4Hb46SfANIFpgwb7XPnRhZl032SP?=
 =?us-ascii?Q?svzT2nYbwUpB3drWZgfJvVNA/BaSKGdrZBljyfodS3BfT1IW77y0YSJUcWls?=
 =?us-ascii?Q?yFQYrE+FL879BHeCnyKn+yTWNzNnC0utV6vnAfqK055Ijb0mLSI+NHoBfaMh?=
 =?us-ascii?Q?k9IQ0U3y1jk1RaKS42NsA3rJxMChBjn5B+rYqjQxjFreL+2zIFBnt2Y6vYId?=
 =?us-ascii?Q?ELVVCLADph5aD5vlk8mwAp2L4ZH4KlsuOdjoofN4U5Z68NI5sDO8SM6lVRjl?=
 =?us-ascii?Q?f69DNAK2AOgsChktzUcITihBWLo1ml9hRnUcvuYOlh7nxz+EpVLI04weMADF?=
 =?us-ascii?Q?yHwjt/8EYhhedRuwLP/DEfo6appDwXVeaS7cEACp9uy1d28s0pFPaP2p2+Tv?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd785c71-2990-48fb-a06d-08db889d313c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 21:14:52.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1zbzVuhFDku9P/vVXuPKeZhNQYZK/PQUTVXIsECgMnb424ibhx9cOKfkIUJDBY9cSc/QpBjCDb/TAq3GHfmcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6489
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 03:27:26PM -0400, Rodrigo Vivi wrote:
> xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
> 
> The lock was created to protect the gt irq handlers, and not
> the irq.enabled. Since suspend/resume and other places touching
> irq.enabled are already serialized they don't need protection.
> (see other irq.enabled accesses).
> 
> Then with this spin lock around xe_irq_reset, we will end up
> calling the intel_display_power_is_enabled() function, and
> that needs a mutex lock. Hence causing the undesired
> "[ BUG: Invalid wait context ]"
> 
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index eae190cb0969..df01af780a57 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
>  
>  void xe_irq_suspend(struct xe_device *xe)
>  {
> -	spin_lock_irq(&xe->irq.lock);
>  	xe->irq.enabled = false;
>  	xe_irq_reset(xe);
> -	spin_unlock_irq(&xe->irq.lock);
>  }
>  
>  void xe_irq_resume(struct xe_device *xe)
> @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	int id;
>  
> -	spin_lock_irq(&xe->irq.lock);
>  	xe->irq.enabled = true;
>  	xe_irq_reset(xe);
>  	xe_irq_postinstall(xe);
>  
>  	for_each_gt(gt, xe, id)
>  		xe_irq_enable_hwe(gt);
> -
> -	spin_unlock_irq(&xe->irq.lock);
>  }
> -- 
> 2.41.0
> 
