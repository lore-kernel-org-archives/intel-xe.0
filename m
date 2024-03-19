Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEADC54F7B
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 14:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDFC10E0AA;
	Tue, 19 Mar 2024 14:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+t1xdsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813410E0AA
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710859103; x=1742395103;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L1KIcwoZLCCF5nqpcnW6L6YpCvOz4USY/8JS88l+otA=;
 b=A+t1xdsVYSLHBNpk0CyyPR7R1AtGAWUxeJO2Xk1lFk5u3JB9l/2yf1kI
 Sp68FJ4wrqt8QVMzUg20SFNm5VHbztuF2lkvT8GVAkU2OwFk/byuV7H+K
 UGq6oqEnEWs1IUPWoGbld99FEip1JVRE1+tomH8YBxf99hAWPOGv7c/QI
 2HGsSvLm9PQETdGx3b5cuekTks/iZHquxf+OSo2V5cORzFhtFu7utwUDP
 OYgYpfOp4MVV4eWGYkVg1iQmAAK/IiXO/abr6aCi9G7I6/2GFLrmZP6QN
 I2SNgnrO4+5lPuVZiXRkf5Z+iPyvI3HMcNTXMSwtyz1iPNQ2EwXmq/Y3l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="16462776"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="16462776"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 07:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14216382"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 07:38:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 07:38:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 07:38:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 07:38:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVmqndW8ICqiMUPgFcR21WBrHKfR06fKhesapi+dBG5/DMJwEKvOx3pPRnItaoh2XHooxDVvqlDIzCgTppBnCQ7Qmz7L2vtuIxdtcZPUbbegG2FDNIv3/7IkEyE5PFZVzx4HLwKIziSz886zRxX4gCpCcsZ/2ihSrH08sXHLX+Qwe73L0MI9mX7plW+GlxLJLi9QWI0AWPut3gSBsuxJkwXb0i6LFNoF27ACYPJEai158Qbfc3DvhsASjM4BmkYQqGOX/SbVQp4rYaWzJva5inXsDls3zit1iWBYNh+7PQEBVrkXEIVYpRGFdhwLVummWFaT/HDePxiyjxWGoZJrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vf8zKJYqYWumtDdOgA+fpuoEdN02IpCmha1e6CkqLxo=;
 b=ldvrmC36h5pMBog92dns/0A3pUFl/XB1Qcr80DMwaV/3eDP1noRIn4LUABvU2uJ910ZE3omNUvFbT/XUHgLLyETdNUKMjtKlZHwOso/pqHreyUvWpMtkFtVi7rnjqVDrdakZeHk1eS1OTl3RkVRoZY9WiVI4aC1Qx062cWc7lYb8piQdvIDvPJcKoV3GCG4OEuOmVAbB/5QKHkf5NF7mtvx+6hEwvdRxGsmxqH7VcIV6UfHbo+SklZABwcajQy1+JdEdtXYVth1UhNvIEd3Dpa78BkJxNKc7o+l+UGsQDPF2XFRNAR19OFZAFUTKAHWmZfts8/0kXQfG+w6Z6/IKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Tue, 19 Mar
 2024 14:38:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 14:38:11 +0000
Date: Tue, 19 Mar 2024 10:38:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <lucas.demarchi@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 3/3] RFC drm/xe: add fault injection for lmem init check
Message-ID: <ZfmjTgCTsppFxe6j@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
 <20240315100530.3051944-4-riana.tauro@intel.com>
 <Zfiu8C6FJGA3xezD@intel.com>
 <d214b05e-2107-4ee5-9b4d-ebfb5b7dd0f0@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d214b05e-2107-4ee5-9b4d-ebfb5b7dd0f0@intel.com>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5241:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwC2oXysI9Ks1GYjSY189EAbZXKebxUismGgrjmm227lMSPK41nVGLdY6rZeZMs4wqd0oMXiVSyonKf1fh/y3tLvcVnnHwkDWVw+n7Unx8erKYpigJ3frBhdj4R39hk+1SeEtKudC95CMlK1PFbxs+iqSxhIwbiYxvKKgR3+kPSeXRl5FajYPE/OFJVDO4xdZ81kSGX9G4CpfyMfGFPG+wBFp8OqDVhi9XQrpMqw87z9T+ZDb5c6SllpujcYZ2iPE2+pzH3QTlgMo+91p6Sazw9ftf6SINYGtjfeyG7umoXEnxeMOnRYjjG3qHh3V6OgP9FnsW2XqmLuEY9lbOFfAD/LGqZnGLpc9iK2NANmz8H5aPj+yhI3QWCghToKwu9yr8Rcu9DakNy9deTvi937/sw9eJGD53wHYvU77roVG/t/DNcPV0NU+uy3gjeu9ZhmNnr6cVA+W9R52YsvUL0TVUlcxS3AnfG137xppxXQ8Oei+e8dot46/HdNmjI9PaSYprmNK/gT09ANpgNJBgdBnG2w2pBIltSOFLjPPc8XJpqd76BJ/CjXWw19bk9YetOg4wfqsynXCGz8YX+Cj3kApur+Uc/ClYl342oJ6iH10aU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ae9NlyxjmZ6NMzA7PCqFlFtcdFx96/14jaWmHV5T4Q2OIO+B3toloIjMmrSh?=
 =?us-ascii?Q?IgH+m5nMOQWsW5ig+ID1rC5oKpPK5TD6PYiXnY8ThdGLLNqCeoTU+fo6LJmM?=
 =?us-ascii?Q?vE10Pg+j7FmIx/TrStT9rjAtOk94b07HLJNlbAqNOtL5TooHJ/BDNkYzg0qW?=
 =?us-ascii?Q?SPoeeHK9FeapkiBlQAD9yIKvRNb4uW456N0fgua1y+4nkOrSI+xVKQUl+Hlz?=
 =?us-ascii?Q?9mm/7Vnfs7+6+6aRBMI8qlqKJh6zfO6UvDcU3zRNEU8aGD6Hr5U/eA3cI3YI?=
 =?us-ascii?Q?E0UVKJoWK+wx+AJVSbCQP4cra1t8ESrDc2e0pAWY5C5T0f+vt6j0ZjO11HUW?=
 =?us-ascii?Q?AcM6WLLgWYVRH0dUfsVGAkAISACzgWGaySEHtUjRInpoLFbm+x6OmRJF6Eri?=
 =?us-ascii?Q?Fzgh6WDgrACg+PfCc6lF5cjHJmHWD0n7KDEsgr2TcL99kEqenEDQMkt4jLJT?=
 =?us-ascii?Q?RsaVpn+FjaDeceysPpPVlDhSlNGcz7e43BYNinbzHUkyr9U9fFZM3UaP9Zeh?=
 =?us-ascii?Q?YViP1lpKcIk6BrfLGUzS32OCOLTjcDFX+zLmefsaYZL572Ws3CZKB5l0F6Ho?=
 =?us-ascii?Q?Sbdua8raOjy9lyFsB1XUdsdg9tx4s74js+7uvVSCLOOwydURFhbTa3Gg7hHv?=
 =?us-ascii?Q?UjzgAOcRTdL7JLGCaSMCKOZ9HUKZh9/wtSelBcMlmdYRQqpekWn09FSB76Hz?=
 =?us-ascii?Q?09aLKOVLYdyAhuFDd+NKMjVQ7STjuYS0PCDJbjywglc9hoaA8dH8uPnVR54K?=
 =?us-ascii?Q?c5NVgHSGXWOE4Oi+mtEfrqgTZRKfFDvHtAYF8U+QyafPHaZSrjehmdh8T91O?=
 =?us-ascii?Q?FGUdFZyIuEwbhCo3EsIbLKHYaH0KL28pN6M34f6WSmDJ/vQ3T8zpQuVVywUE?=
 =?us-ascii?Q?hGXx6GLsmqaxlHpWVsouC6KYg/z0oQEMH7oJVKG2zDyZWdGPBFxOTYJjzZ8i?=
 =?us-ascii?Q?eH8iXi1zABeHECz1z7B99H4MwJM4y0zaYYm7AhIEJcqjqEj+abDN32WohFym?=
 =?us-ascii?Q?plZqRMEX2ZsCeKhrqN4VbyscuTzO8V9VGxa6A8D8ZgYyXvUR7BGdhpzcbtHM?=
 =?us-ascii?Q?8FVt+lW1j1Go+YdHjLkULShcb6Jk3al0wbHlzvS+lOvVIyx4DQBS4t0qkP1G?=
 =?us-ascii?Q?ppwuXiohlaCRPIR7CAxd9709y/0QhPU5suwG/dmZSTnawdP7MZUkS07XZFWV?=
 =?us-ascii?Q?ErVykgSsVd2m3JHrabEwqyjvivXou2i5+RPekK+AtgzDH9DLXrDxUe1F4x4T?=
 =?us-ascii?Q?mpFkR3OI+uo2sZMvhvrXVJdP6V7Jk5KDiIMwv2RopSTKAfxRaXAOnuYTLCWS?=
 =?us-ascii?Q?aDP3fpXIzFrjIXre7kaszJkESkFmDyewZ70CV+W45TTiAKc9pZENEkg7PHHb?=
 =?us-ascii?Q?EnvV+nZOGUEP8Twr9jswHBiava7UKZ8KeKJXZ0LJMAkEhKR6WyK4kgugiht+?=
 =?us-ascii?Q?TQBsFxT/yM3AGJYV0TLRB1NBTsL8z/kPO7c3XsE01CMmipEaOgBkUaiDQyZB?=
 =?us-ascii?Q?wvxUxRVgcmB/q8Oe0G5gZ9JyK4JPNjwe9+uU0qdgrtRxllTZm5MHFAx54no3?=
 =?us-ascii?Q?BMP6bulVZgF7JFfwSm8rsP+9VkN2p+kh47yhkjE23M6IiLgJ2Rypb+TUUUbn?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4d330d-fc6f-4846-63ea-08dc4822336d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 14:38:11.0925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbCbM4FE5LB7C0BBn4OdH89xEtsnm/5JBqdjP1jgM4IAIzTljq1w660FdwRFScReO9wI7g05QpyXw4sgpH2ljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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

On Tue, Mar 19, 2024 at 10:16:47AM +0530, Riana Tauro wrote:
> Hi Rodrigo
> 
> On 3/19/2024 2:45 AM, Rodrigo Vivi wrote:
> > On Fri, Mar 15, 2024 at 03:35:30PM +0530, Riana Tauro wrote:
> > > add a boot time fault injection for lmem init check.
> > > This can be triggered by adding a modparam fail_lmem_init
> > > 
> > > xe.fail_lmem_init=<interval>,<probability>,<space>,<times>
> > 
> > Please let's avoid module parameters as much as we can.
> > 
> > Let's use the CONFIG_FAULT_INJECTION_DEBUG_FS
> > similarly to
> > 
> > fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_f\
> > ailure);
> > 
> lmem init check is done during early probe. We cannot set debugfs before
> probe completes. So i added the module parameter.

doh! indeed! sorry about that.

> 
> I can try to set static values before injecting fault if module param is not
> needed.
> 
> lmem_init_fail.times = 1;
> lmem_init_fail.probability = 100;

no, let's go with the module parameter. It would be good if we could have
something per-device, but there's no way to pass argument to the bind/probe
operation...

hmm, unless if we also require the pci id as the input to the param.
The bad part would be that we need to parse the str, then make another
string for the setup_fault_attr().

also I agree with Himal, an igt case is important here.

Thanks,
Rodrigo.

> 
> Thanks
> Riana
> > And then use it like this:
> > 
> > https://lore.kernel.org/all/20240315010843.194335-1-rodrigo.vivi@intel.com/
> > 
> > > 
> > > Adding this causes the lmem init check to fail causing
> > > the probe to defer.
> > > 
> > > v2: add fault injection (Lucas)
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c | 21 +++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_module.c |  5 +++++
> > >   drivers/gpu/drm/xe/xe_module.h |  3 +++
> > >   3 files changed, 29 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 50473329cce7..393610e95bd1 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -51,6 +51,10 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
> > >   };
> > >   #endif
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +DECLARE_FAULT_ATTR(lmem_init_fail);
> > > +#endif
> > > +
> > >   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> > >   {
> > >   	struct xe_device *xe = to_xe_device(dev);
> > > @@ -431,6 +435,23 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> > >   	if (IS_SRIOV_VF(xe))
> > >   		return 0;
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +	/*
> > > +	 * use fault injection to cause a lmem init failure to validate
> > > +	 * deferred probe. Set the verbose to 0 to  avoid dump stack
> > > +	 */
> > > +	if (xe_modparam.fail_lmem_init) {
> > > +		setup_fault_attr(&lmem_init_fail, xe_modparam.fail_lmem_init);
> > > +		lmem_init_fail.verbose = 0;
> > > +		if (should_fail(&lmem_init_fail, 1)) {
> > > +			/* add delay to reduce the number of deferred probe attempts */
> > > +			msleep(500);
> > > +			drm_dbg(&xe->drm, "Fault Injection lmem init failure\n");
> > > +			return -EPROBE_DEFER;
> > > +		}
> > > +	}
> > > +#endif
> > > +
> > >   	if (verify_lmem_ready(gt))
> > >   		return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 110b69864656..c4efbab430a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -48,6 +48,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > >   MODULE_PARM_DESC(force_probe,
> > >   		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > +#ifdef CONFIG_FAULT_INJECTION
> > > +module_param_named_unsafe(fail_lmem_init, xe_modparam.fail_lmem_init, charp, 0400);
> > > +MODULE_PARM_DESC(fail_lmem_init, "Fault injection. fail_lmem_init=<interval>,<probability>,<space>,<times>");
> > > +#endif
> > > +
> > >   struct init_funcs {
> > >   	int (*init)(void);
> > >   	void (*exit)(void);
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > index 88ef0e8b2bfd..ccbeacbc3efb 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -18,6 +18,9 @@ struct xe_modparam {
> > >   	char *huc_firmware_path;
> > >   	char *gsc_firmware_path;
> > >   	char *force_probe;
> > > +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> > > +	char *fail_lmem_init;
> > > +#endif /* CONFIG_FAULT_INJECTION */
> > >   };
> > >   extern struct xe_modparam xe_modparam;
> > > -- 
> > > 2.40.0
> > > 
