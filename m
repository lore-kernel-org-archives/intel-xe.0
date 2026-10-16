Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C41CCA490
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 22:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D3D112A26;
	Fri, 16 Oct 2026 22:37:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605E4112A26
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 22:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792190226; x=1823726226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MyDrJVppn80l/vrdwjghQN6r9nb/Mki8q8ICdVhgXIU=;
 b=MIqDijgCRZTc3W3SdgDbEgwRJ3r0gVbA15KEMVo8DwK7ZUhMxWeD7hMn
 xSz29ZALFiLZyPhT9lsqvU/Z9ixvXtQYVEdwoLr4WQ7feyE0hhLb5VN34
 IWlKqCpEOrs/EQHDmWZhkQTKF10Qso0E8eZFTu1Jd7+1nGBI9bLi88kS6
 jqE7J86JCttRkaXMFmLkr0H1rtJ4eijlMqzlaTXwr6dFdY5Bl/XPItk0J
 cf+l3oC4ZxPy/kjfzDjTHCuODzQMArMG1Axzj1l87VGtiSsMxrNnCdeWb
 K4scbqrMM/n23nk31WPXjg62kSR9tRntByc7JYVe2oFdem3aJxl/C1ysa A==;
X-CSE-ConnectionGUID: YmwcDmmRT7KbNG+8/Q6Ehw==
X-CSE-MsgGUID: 0BFYHi/lRfq2JK+tF0oS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="883627"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="883627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 15:37:06 -0700
X-CSE-ConnectionGUID: 0WcfsB2qSWWzmd1RkcbV5w==
X-CSE-MsgGUID: LK0+6gMeSVaenCKI/uOseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2524326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 15:37:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 15:37:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 15:37:05 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 15:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUeJ4Ws2bjM0giI4koEj5rxt1do0DOsZEp+XhTZjh7yKmoGVS8Rg7Xohmct+KlLL7omqavBjIjPP2mF2uxlNKNPVZ1XShpjVx11corLcJszCjIxpzWDMrpMw4w3JJKNQDsVOL5bkXT+KRoaDKubRVAMsE/mj+DN4VT+KJuIHikfUKrcI/enAHcy2cqrtI79aavRAq9IgUC96Ztt9RC0SvFt3rbtNbGi9pHsYAbcCKhOiv9VjDANY5aXY0nb7lpYB3lkaLBq2o/ulrI8yIVSjknSnl6OTaOYgMJQZJ42a0BvsDsJSJgxQaFwcg/f1URn8aDog1x/eNS0ft4pxH7/nHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TYA4ogRxn4/5jT2HWkhrmF3pXQHQJXJMKvJQmWHDoc=;
 b=C/Kgcf5e6+Yx2VeCRAsq4t+4DYu13VBhosKPhruizXQnWW7piy0L/dpDGSfT/smGdWtHmGj7BDzblh57TfVa55kJc3MyBrxT9lP8wXEtxU1KMJA/eqFP5qnhIy2kJtZ50VNgT1D73E+vBRxtq1Kt3ddbgyBKr0MLZEFWU+yDfIT8K0I7vIfpcl0kbZPIfpFF0q8JWlzqGgDPYLDOIiMZSDWRivMTml1RD01NJp2ot74lQvV2HFWIPrcBg1rkB4OLQS7Yydzq1pGKS1hjdp32wm9wdqiadKR0NcnCnZ3AXz8YFIB6UT4zOQ7f+javBUJ6PYlBvcDLzfR1JIzDAF5Akg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 22:37:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 22:37:03 +0000
Date: Fri, 16 Oct 2026 15:37:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: Varun Gupta <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
Message-ID: <20261016223700.GD1329272@mdroper-desk1>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
 <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdc5fbb-7e02-4781-b802-08df2bd5ff9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 77xLk1R67z4+NtG2pLQD8UVhCZE5JKDQSYTAAavLEms8XgFOxV3ut7lJULPP6kCbZpcqzDeWfGBSu0qjt0PCvd/XgP1OQaeoH+SYkJ6CnZPb3ujhoGPaLKDatHGyqBVBCJzLGtl3hs1u2Zij1xWod+T9OHq3DiUogjDM1lq6Lv2KbfB/dHiTWcqmlH+xctLqLwU/iPwq1481TUe1mjfAa/WdbOYZMBVsLYMlc7I2t7JWPwqArLOh49GIp4HEPtBUea8L6frfLTXLULMdih+7aRce3FLZG2ECwPpIuW9U0e7Ysnsm4yU/dY0rzQtS9rjzHPyZKFmau3pp+b4sVLFpuuwqf4dvDnTQikxzMRdX4AXOtEkkJFBv1SCGZoDNzQUYrrHkWY3968VFJt0+YXYuKIlKzqU4PvZwsGA2WB8gK2cNkptgn+ryGDvJeCtJPUL9bltG19oB1uhhMa3ns885KOiG7CSUBBaiMLDOVabiprymmWipkgwFhHq7DObspmbkez+yCoOyE417eQQ61gYmBkg4xBA3ZsyE6M4u2JcVQNq7yDbszOjHz970qa5i8awi15dc81AvYavSPEvxNOtXIyjQHIauC9+4XnaJA9ugVCNOkMC5pYPIcMrJ/V7HUcypRJWQnMRiMvEBlCFHuSLrbrqiKQeBjSP6SCy/uBT3SUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?trfUuVdBcV+S52QWXtTq5WUA6mf1vVcUX1jfYuwDogLmGokeme0Wsp+lVFut?=
 =?us-ascii?Q?OSayGoraWb3el9GdW4h5skuSXdY6ubNxHh4tOxTMigKtUbPk4h5y33yL3Fj5?=
 =?us-ascii?Q?vF0VkP+Coayzc54rt269Bxvxmq4BlWFwtFBCZbCW/86EvVIjL3NSR+/3DU9c?=
 =?us-ascii?Q?fkiG3Fj1PBHUMEmANuaq6LdmE6pxwIROw478r9+r3dbEifXOLFnKH+Ws/Jgl?=
 =?us-ascii?Q?k+I+0WpT7W6XmWkdr+UBX6ZGhONX1juzLFD1LkkW3HpW4Muxz6aPv6RXNKE3?=
 =?us-ascii?Q?6fEA7FnVW4dI3MK4ASHeLcKzhHYf0e2y8OEyqGcOUs2yvo/j3lelq7Y+b+uD?=
 =?us-ascii?Q?1QCZuUqpEtQNRxJoXQEiun7K6uia6DDf7dzdvShXnCLSnIhHOYoHfXU78Ixj?=
 =?us-ascii?Q?qHkWnFOXM7VmZPQbl5SxJTAhmGZBI9KbPH7zl2EecZH2dJxU6+1omjbp4tIG?=
 =?us-ascii?Q?iiAZbke2rmCBroYdXkOKwhb5i0h2fy5diyze612xhe5BmfTfuwxcJUQXz6vP?=
 =?us-ascii?Q?qN5Yopgc4D6oYidXEp4fGLBhzTaRrfnH1T2xG9sVLpui3Z2Ythmkso0zc/lD?=
 =?us-ascii?Q?MqeKLFB5FLejHWq1nkJlOiTBCDUfRSAi8CaKAGR4oZ3+LFSJSlwSjaxObYkE?=
 =?us-ascii?Q?omWAT8im9d9aAd3xXyy60Qb03rjMrf3y90I/ANDGKG576V3dPziDGELyLX+w?=
 =?us-ascii?Q?5G4+cFZVln31Gr9mTdRNRModMaKn6IIbuBsDo+utJFfTesbu6TvN2/N4Pr9O?=
 =?us-ascii?Q?RBaJfbi83AGlZLbSmyNuIc/wkcmT/YPGdWj0JzXqJJ1MztpJXuYmBsN9qUns?=
 =?us-ascii?Q?mx53L51ke4OKNNF+OjP3SxYiUIece8YLntXjX5qlSQQVjYtExSR2bppMSzzH?=
 =?us-ascii?Q?7gB9+na5ZozCk7dQMSk1INysT81pO9dLSIwX+L6IEO04rr2L+rJ77+Z74ZFy?=
 =?us-ascii?Q?jw6diGIBnbnE1GZMB0s3YX4xd4SQqXFGDtMwlkhqvbdAuNbTTWOf3DLpjiCT?=
 =?us-ascii?Q?FIF0k6jDSN88wveCQlUj+I+XLUQF/EPOzsl9Do4a9WQBhGFKl+Zr5i1FAtyq?=
 =?us-ascii?Q?qDNIpS/J/0B5N/moqSRAPeqR8p/eT1VesnKAxmBn+IgjQfoXaVPfrt2R5dMG?=
 =?us-ascii?Q?xRtrh8Zvii1n0kSdOdYfEY9/b6UZjuKnvjuUjcCIRLtKgfee/hYChhx9TVH9?=
 =?us-ascii?Q?6RHIyMXqr+8bN7EYEkkricAN41I2/YxZutZHsP3EuytOOTSISZ7KPvV2iHsq?=
 =?us-ascii?Q?S0r2Tz509DSDzcVUYag83ZnTMmuPBjMRHwhSBzTx+neFaQrCQES9LpZtD6ES?=
 =?us-ascii?Q?AdD9huZmhJhVB8mWJIjv/KpSujLUv/yWxmTU8KM3wfJ2++tXvB3rjwZI3RpF?=
 =?us-ascii?Q?mei6TF9eonVTSi7Tw5EjKdroO1zvT91H0zVofh3Ngj5XzNj1gKK/CV84kp0o?=
 =?us-ascii?Q?4lxZyeDC/z+ZzfPR++VU7/mdYKnqOiaZvHdJd14512Mp/NTbeY29gJwrHnt/?=
 =?us-ascii?Q?A7u63n/0aRwzxa+9oa91hirRWNZnhKYGNHm5fNtKQ+Rki9jzZQJZAJLVsuIC?=
 =?us-ascii?Q?JYzL4cByWJaEOx+E4aM2TgE3na4/6NHpaAcUhQ4gp/nNr5nnD0RHd8TJxggm?=
 =?us-ascii?Q?cm+M9IccUxkKqW5bCClyLaxDPZ/uo83z/z4KOGjhCUhLmjNjN6w/1TKet7rt?=
 =?us-ascii?Q?TGg70sYXaJujtc+dXoMo1PBidjt/rH30BTfOD2S11NHYGFM9LRTmiJMI1Fat?=
 =?us-ascii?Q?K2KSt3KfhzsxeQjA5i4Ps6Z6Ql4jRSY=3D?=
X-Exchange-RoutingPolicyChecked: D35A9hvuvdjxQgxuzznTxhk1IaOriajaFolc3wNc0OF9oeEjLA1Mv15hvoc1/LOgbwPlfXkgu9lxBE5Z8bkposzEyn2quk2UI9QdNLoasyqGDGoUN/CBBVBx3tOvZPHYvEnATAIFrbnT8/+dXf4vDtutm0QfO7KFAbTgd7I/SwEGKx2FFkgQ4RQJQxRYYZ4TsqTQhGMFP/ppXgv3Z6MPpFNg1rKqDmjFUqrKpNDO6gAk+RLChzb7eNCVjJA5tyBV4YVLsVgpV45h9QiMMLSWV8kUfsCmEbKi7K6hESiISShnVlYxLN08n8QPws+R8t1F/YxAiI7y/uvwOet2cuDEVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdc5fbb-7e02-4781-b802-08df2bd5ff9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 22:37:03.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ubbDoIBuYYYQTQlJmUecvBOXFPgt+R5aIwKQuSO4KPqYcoAL4VZV8/p22yEc156zojwV3LDdKTZ5+8M8PhdU4fM3nAA3vRoo5U21ilRgNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2026 at 10:22:57AM +0530, Tauro, Riana wrote:
> 
> On 13-10-2026 09:04, Varun Gupta wrote:
> > The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> > local, queue-level context termination rather than a global device or
> > driver failure. On CRI, due to a hardware limitation, the platform cannot
> > distinguish GT translation faults from true RAS conditions, meaning
> > standard workloads routinely trigger this error.
> > 
> > Printing this at ERROR level is too noisy and causes false-positive
> > dmesg-warn failures in CI. Demote the log level to INFO for CRI.
> > 
> > v3:
> >    - Limit the demotion to CRI and add comment explaining the HW limitation
> >      (Rodrigo)
> > v2:
> >    - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
> >      (Himal)
> > 
> > Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
> >   1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 7ce73489c35f..dc5b6b98ffc2 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	guc_id = msg[0];
> >   	if (guc_id == GUC_ID_UNKNOWN) {
> > -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> >   		return 0;
> >   	}
> > @@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   	if (unlikely(!q))
> >   		return -EPROTO;
> > -	xe_gt_err(gt,
> > -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > +	/*
> > +	 * On CRI, the hardware cannot distinguish GT translation faults
> > +	 * from true RAS conditions. Demote to info to avoid false-positive
> > +	 * hardware error logs.
> > +	 */
> > +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
> > +		xe_gt_info(gt,
> > +			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> 
> Shouldn't you be using ci ignore dmesg in test rather than demote an error
> log?

I don't think CI is really the main concern here.  Giving unprivileged
userspace clients a way to trigger new dmesg messages above DEBUG level
on demand is generally considered a security concern and must be
avoided.  So even the 'info' demotion here probably isn't far enough; I
think this needs to go all the way down xe_gt_dbg() to make sure this is
safe.  Otherwise we're hiding the CI failures but not fixing the real
problem.

The fact that there isn't currently a way for our driver to distinguish
user-triggered software errors from real hardware errors is a serious
problem.


Matt

> 
> Thanks
> Riana
> 
> > +	else
> > +		xe_gt_err(gt,
> > +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> >   	trace_xe_guc_uncorrectable_error(q);

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
