Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87720C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEA910E02F;
	Mon,  8 Jul 2024 21:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leFPqOm1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EAA10E02F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 21:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720473991; x=1752009991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bmGYjvQi2nDAyHlwqf7dC3vHT70pV7wP+/NLSPOWLcY=;
 b=leFPqOm10p20xcdUcM2wwm+qippabMWvWWgRwY0WC+jutwCYNM8qlP9r
 45a/79pSv/3Ubhlc+4zXihe2AzdLE4m3ERKpIHc4DvQBdvl2psVgPxdVN
 +7qQqLoICqC90KI4LDR6REPjb/3K+Nyl5VDjQthL6g+RgqXtIC7NvNof6
 R/UMNPwUVGMef0BU3ESIUWVb1GJ72KNiwf+g2L/gdOzyCaD/WaYTX1pOp
 zIVh6t/w9Q/BSBnNlNy4Xd/lsRKjDeAGaSKdzwhgIH9uag7GRbLXZyxC4
 r3Wm5upz66itwVR2TZExv5GXK8yBOluQjtp7h4CwtJSMFLkewr7Dqfwa9 w==;
X-CSE-ConnectionGUID: Bhtub0UbQB6gbRJTau00WA==
X-CSE-MsgGUID: aQ0kDcsqTs63kSYxlDY99g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17905802"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="17905802"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 14:26:30 -0700
X-CSE-ConnectionGUID: r0JfB5qkSB+ah2NmD21QxA==
X-CSE-MsgGUID: K/iTzdsrSRWrHuUFOag76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47514794"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 14:26:30 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 14:26:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 14:26:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 14:26:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPtbyw6nXU16lnRAYRbApXZOB/JPjME0Ty6ic2ji69B/EKYmt3O/uMZTm+qpSu0c2HuMC8/yUJ4jZHw9XjIncLD8LbsAJa6VoO+rs/5fww18m8Dkw3sqiUGz5leqClwRrYdp3WSj+aHeqnsOWIqUU47lH8YbAdSPKdw13L6yyKtlnm7/fsKaAU3AeT7TCfd7FO0dSt75WULFavNBmlSA3fIJiovYUrMENtEGphmnnheb3blvOsuOUDpGDH2poTzaaXWUmxp+3eCZgwpymoI/v/cBiNAXGK9x0aJimgQZKcMd2MdQTntryKTjq3ggFNdNuvA+FBObs3cNteEz1Teoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hY+JOqUGfe7m4cvIJUJX9rVHoK923gXAkBI5Qk5itCA=;
 b=YgQ5uMpCZucUHChufGFcPyToB1R+/XtAXEQH7p0s3Uz4Pw3iCq9qCBZdFF9pIqKzxjXCROXUQttYak6bA2DDiWYuBNJO/TqPqJeBneHfX/P1YQgzSoCCtZXtwwb8/Z7xCZRERbp/B0KJsmkskvTFRILFsjUPV95jp+/HhADTBg5Ud+jOOlWHUcnhJNmeSgDQkT5wV9Vk97n4MGSbHjE4U8BBlv5qITuQvU5Qqvvq8JyOQjjHKe0hXfnJftZ0rdMTazLw0X/ucDdrRw+O16nnKxS5QLQSfrlH2veS4d6QjJj91tPsUgGf94NCjgQvKNqGwotoFtlomIL44JzQalKy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 21:26:26 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 21:26:26 +0000
Date: Mon, 8 Jul 2024 21:25:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Take a reference to xe file when user
 creates exec_queue
Message-ID: <ZoxZSQQDbOVgo6uM@DUT025-TGLU.fm.intel.com>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-4-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708202103.3347869-4-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: f62b929e-9e55-497e-d820-08dc9f949fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bOxEqCG3ET4pkAPOL6y6PhH4n+wouUrnChIUmvhhzXo6hlWxITV9kEbkNOGu?=
 =?us-ascii?Q?cbaQxTIt/Q8sySB8LrnJbUlBoTmBA5PfP8Tj+ZMVxL4jovqqknUdO2ZQkikX?=
 =?us-ascii?Q?6Ckz3704IWiWUMySrt1fZVfIZbO8QERhy+JKYFo1187EVHh9t7E7l6K9KviR?=
 =?us-ascii?Q?W6KNtA9FejR+iAFZF0WO5+nE5RIu+KP11FUOEUmlNnBVlwX6BNEZ7JSaIWXw?=
 =?us-ascii?Q?3AOz91BNiQXq7hC0RebBFvrrRxMWCwWwjJHQXWYvqTp5M2LyzQgrUF7DMzLJ?=
 =?us-ascii?Q?MZ3w97UrsJGIGJldGMHTZqvVdr5Eo/NZYTZU3GfUNf2pRbsjPUt9R4yuwAis?=
 =?us-ascii?Q?heIcZ7kPMj1F9leLi0iukOK3o16RjOPR3Dt8OzWVtkAia3MIlhzuakz9/hP1?=
 =?us-ascii?Q?unYGiY9ZamjzKTK4jVeMOXAlBDnBM9JKBdC3U9tTawff242ss+/Ugd1kb2yD?=
 =?us-ascii?Q?ap/M8iFT/LjB1TgdtAiGmWNEb4sID8qVHvdArz1Av6C2ygpF6IRGFSoXGxbd?=
 =?us-ascii?Q?r/1HPQwpc+MggWKRbWih9tJUZ1w0T/Ik7ky4mIooWdi4InD3O3dYHqXFzPtG?=
 =?us-ascii?Q?mo8+c7o22V3QChODMDA8cYW8PXvbajRHJG8eDr9jJzOM2bwAMS2FKSAxfz+6?=
 =?us-ascii?Q?BRUV13ujTkXX4/sVI7HZ8Oc6mj+qdjcVCPzKcJ+NlLtxdWsw+W19FdBijfxy?=
 =?us-ascii?Q?IB0I14a8gA6Hrm+nubC/QGxW2yrq36DUt3rRbSYsRPGePQrttkKVU4ePuXY0?=
 =?us-ascii?Q?OcmhGSTiasjIwg3YPYUPi0CHn/FAjLyMJoz4cLI4swq713oii4Bz9IF2tzt/?=
 =?us-ascii?Q?OX1jfAlDv1E1+7niFRPIscEMR5Au4bbWFAkSQYgntOFk9Yj+WPF8cYj7WR6s?=
 =?us-ascii?Q?jFgPq64JBlA7y93Pl24SmtLIoICFxX9f41f0Ids4erzWb+ptO6cA+E1iSDx5?=
 =?us-ascii?Q?7ZAO8bZxM5Puye/gNQ9YD9Nx+eaNo6cdrpR2gToF3LgL4KBqhi+S8BY3Zgfh?=
 =?us-ascii?Q?a9Jlv49K8ViC4LidRZBFEMiNRgxB0Eq6Rz2FpzO9Y2x0E7jP/aGXUqIyAll/?=
 =?us-ascii?Q?FWYl3yLSSGZADfPJzuobY4GxFKjZhJcGZe99EUvS/8arDcg86oeM21MW+q0J?=
 =?us-ascii?Q?okv+asEZ9jikzDPNHY+rYwKwr773V2zTdQNoAXZM0OweX5gF0puYjXcOqhWA?=
 =?us-ascii?Q?nHYC+/Ja3MZxCEz/oWzSb1poNgE+7E1rQk350mu5ZeuF5hlq2+7PFkx0hc8Y?=
 =?us-ascii?Q?eDPUDzZOHen2f+QJyAycmwvDjYeA8kO37SJLGu2EH0ry4M7ba0Sp5V0Dt9ao?=
 =?us-ascii?Q?+EGZMhUIFISGynPrjgkSYyBbTOOc8vI4Obf95qerhOWt+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hIsNZC7ORuZB+KVstbaX/q5XVvC7ooSQLXehonO3Pv+1UCrKh9SZX4vt7GXy?=
 =?us-ascii?Q?Zl6fLplNikN6J0NhAauOC6qIyBBQEF1u9JaqBxkayjhHScaCXMxv4uVQ7U6L?=
 =?us-ascii?Q?DtG3NvmGmfBc/Sk59w7IzdOwU2vMw3H0w8DgKBK07JosseeoFpxuAN8kI0yi?=
 =?us-ascii?Q?nMZ2JNzXzDl6HOGyuMnf9f7yW+9IqUFm780jZaAsD2ZxzyOscWJ73Pnb3a6k?=
 =?us-ascii?Q?K7sy8yizNMAOUjPfbABWEX6OtzdOzTEH8sGjw4UrrlkowOyrwIMP065W7kBu?=
 =?us-ascii?Q?RXLay3+8Q3NnLsDLPQm/Cafz80k0KjJGRnIcirxsqN+nDkdg/gqUZA2gY1ei?=
 =?us-ascii?Q?olb8Gkel0V6hOWOt3mJ4LGWwQmUtXbZvzHIPFRx9wAFoHXTZwKmF7qQ10ndX?=
 =?us-ascii?Q?Lo6nFMr+v+HomxN8InJurGYWlo3JXhy3w5yoXckwQXDtkp9NjiDRUrPlJZC1?=
 =?us-ascii?Q?XjwgoEavFe9pca5sJjWWbN4wDGOOQLVWRvy32Y2jfgrfg/ofS2GqBaONw15I?=
 =?us-ascii?Q?DYK0mRDVxSaBHb1RRKCeFDifN+NaavZXnWpVPBns2Y3Ocj/2ZdKWxiw9Cgv/?=
 =?us-ascii?Q?Z2evdfuULRGn5I+1UaI6t5eY11Z/cuSAMmbBCy4PtmWvDTnxg7WgnBH6tmlM?=
 =?us-ascii?Q?Ir5BFmzVPpinenkZC78rGMt3Q3uScwTMVbnI6L3eliyz8Jzv8og/gm2luQwo?=
 =?us-ascii?Q?brSTu8Y6UKby/U4ElvSG8xXRRoEsZHzcUFdt9JspPzwl3CtgAixeuUS+Iq89?=
 =?us-ascii?Q?IqUADjy/q3eG7OKYxxpMQLWXHJUIwAKmliI7+wDaQdpaMDwcqOF8bXZVfNRA?=
 =?us-ascii?Q?LzoI/9l1k6+8Fteg40mbk1paf9Kzlihv8BpDZEguAQ0XxuI1Y3LtOy7w6JIT?=
 =?us-ascii?Q?qI3vpeFXELWO8eqthiK3HGYcPAIx5YqUFTHoLP3D3v45jHgJS8qUhlJCNWp8?=
 =?us-ascii?Q?ccSXBGj3G/TxsA+OF3kTIFBJOI8TPUoEVYKDmeU/bm5wgpxi+hVVZi4FH8F2?=
 =?us-ascii?Q?mg0V/L7TEIHTldgyD3OPlen3PNklJ/TKrLB17sjIhEWrSxrvnkqGFDR4yWZW?=
 =?us-ascii?Q?mSFSDU/J7Jz3Rh0U3P/brktXep8aF+U6Goagxm+UOj9Lq5qOGzkIJpBvBSE1?=
 =?us-ascii?Q?bTwqvD3xRfCnTYyP0ZKY1BXn1EYo/Zm2vKTrWxh2GfAFhn/2xjUDAvoNANDq?=
 =?us-ascii?Q?67Cr6IOWIruPfaUahdpGBF4/+3sdL03ESZ9lw85rXM+ATV5ugVM2ntvBL6sA?=
 =?us-ascii?Q?Z1Z0OCDWylgfX0koPy+6s8iDd5Nnzji3FpTzQ3ifpiQMmpti6NoqlzFwjev1?=
 =?us-ascii?Q?b+QJX+1Zubiv3w5QM1Js5wFpIdZ0kL4u2v3zp9baunazLiFeZNhufQZPEeNP?=
 =?us-ascii?Q?uIhA5hDOPra6Jjss9eJEyH8HoxLQxYG8mzPM5GBq2xtfZDEg+TjWY8nflROr?=
 =?us-ascii?Q?rNIIOV2AOT865XqSODpZcU4p4i9WtOCU3d3px399hP6yxIWWAvFe/3wBs0C2?=
 =?us-ascii?Q?9RZc59T8XEPtxCBHJNAQoS8W0dA27sQCpPXU1fN9fluiswH2GwAPg355v1ry?=
 =?us-ascii?Q?rREZXvSUuGTNeqK2ciHrXFQpnd9Po2Ec3Z+/SY3d7Hmsw+zsfC4P2B4JXaf7?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f62b929e-9e55-497e-d820-08dc9f949fb9
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:26:26.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q27Cl582GwHTVccffym2T2QMWpF9dIJiHLp00o/Y1L4uV4sjumeccoJeioKRUOB95jF0h7TjXcmyIHd0Ma7WTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
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

On Mon, Jul 08, 2024 at 01:21:01PM -0700, Umesh Nerlige Ramappa wrote:
> Take a reference to xe file object when user creates an exec queue so
> that the xe file object is available for the lifetime of the queue.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 6 ++++++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0ba37835849b..b01eccdd75ba 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	if (q->vm)
>  		xe_vm_put(q->vm);
> +
> +	if (q->xef)
> +		xe_file_put(q->xef);
> +
>  	kfree(q);
>  }
>  
> @@ -640,6 +644,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, err))
>  				goto put_exec_queue;
>  		}
> +
> +		q->xef = xe_file_get(xef);

This doesn't look like the right place. All exec queues include VM bind
ones should have a ref.

With that, the right place seems to be right before or after args->exec_queue_id = id;

Matt

>  	}
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ded9f9396429..f768e48f31e4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>   * a kernel object.
>   */
>  struct xe_exec_queue {
> +	/** @xef: Back pointer to xe file is this is user created exec queue */
> +	struct xe_file *xef;
> +
>  	/** @gt: graphics tile this exec queue can submit to */
>  	struct xe_gt *gt;
>  	/**
> -- 
> 2.38.1
> 
