Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B621C5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 04:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D7D10E2D3;
	Thu, 14 Mar 2024 04:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8cAK9Td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E814C10E2F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 04:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710388813; x=1741924813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U7HFKj8QCSQ1ajV/Gz91gTflSYZ8bZZnks5bQvRCj5I=;
 b=l8cAK9TdePclmzt3AlzIRMT37quYiFU9YKvHg+7o1YQdRM5hzHKv4zHV
 ptTHxsqQMTejuQDN6hdBXQziIizhO8pkQizv3g/v+dXqSuO2BLVAJ8qt3
 PFCY+4CXV5i6Wu+zFVG4fxtY/K5hhp7ieYHfp/OPDgpsakwgYvXuGet8n
 OmlwhzdzWiZWzXIePazcA9kO80htRxvHAuLk5CPWufxNoKwV2pqJxVY7/
 o6bLnnSobwrkb76ZPIBDv4LA2Wb7nxYCruTGiN4HkWadf5fR5xbQBVCCg
 IBIQ5P5erBMKYfJ0qxRiVeoGUSPNmTJR93vJUukfwH1Xrd5yGDfKs4YI0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5054873"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5054873"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 21:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12044194"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 21:00:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 21:00:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 21:00:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 21:00:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 21:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXOVWTeDXOmJX0XyQVHDaWzIkZsgeHXmhL+u8zsu4OWzL0Z9L6XtBzbTTIWUudvIEMrTGAIHXUGO4O1cA8YreGa/NG1O453LLabFTnkMPOTyXiCeH5iLrhJa+m+/LbQg/yCJ2vchz5YDTBXxvY8/nAqmgW21EvOplSYuRQMdAvs+Q3PETHA+xZ/dlBM23uOoP5TAUahS3tqp1PodvB5d0vt/BPuKT/7JLsSlmC8PiZtakBPYLnhtP4zH8hRzPHNHhXpuAWxkNrYQq1LNQQpdVcL4LfXSCGrj+pZA3ptiouhO7oIipFZTjTPJbMGV9pNUAxqe2kJbHWElZ7L+RBZrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdsuEE8sVAHSQD6exAt24PaIa70Sw8yv9IW5HMp/ZKo=;
 b=RH+DTrhIrvkldKDrT4L8IRFYwL1Ccs8lsXi4gNOVAWyNy0nWfnkMG1tDZYwLed47oGUSUlubVRE0w/C5A3yXz7ziDBIrscViEBJMsbfmkGzU6Z+U5Thfcn/n4PAoJ265pEWcTOxpZh2opKyLJ8DqOzxcalfjrIdw0IQtiblq4EKZEwXvQP1M1e5GEwE+Jl9q3kEQOEeyJnvXCGEabSv+JZFU/fySi8AUS1sqkCkMlol+oPE9HN72f179mI7iqmdhDpfwyAXm92mdGbHuvtq0Z8JxV/glkgbDQvNaUDdlGH1H+/SR7gc/4egyYR7PiAEdWsS9ghv27dCi9OkXCSNjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 04:00:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 04:00:08 +0000
Date: Wed, 13 Mar 2024 23:00:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <ka3c7ex2v2a6lakwfuy5x6drlwf7h5aqbdryrp3wl7pcgjxdyd@45opwtboy4bq>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
 <ZfIeINI5VJJaaVto@intel.com>
 <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
 <ZfIjVj-MJD2C6YgD@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZfIjVj-MJD2C6YgD@intel.com>
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e3d1a7-df1a-4083-64fd-08dc43db3d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QW5DL6FgveAX9RZ1yWbYnxksHLqphoxRmDsICevOaQZPJcD7atSJdV8qFWKSKUnkhq4SDWrEn4GZYPFZibis/1g7QO9GlO5RbWKcKLQqwFyytZJ2RJ8e4eUFGElMAqDfUw2r+IC3IbEIBKfb/vy3Cyq2nndntCpoL097uek+pBFXFonufI8ThTJQI14IO5Yi7+brqHN6iW+po9LHVXqsPlbfyUn874+4htZicJeGnvR+n0guUDFEPcrEkxEThb4PHsGUERCWfaDNjsjtKcrHXGVrmOcsEpjRXjIRPSgp58P3AoxePkmXdCS1HJMX28TbRJr31nGbPCDN/za61yT+5QK9U7Sxua9wXZp1BdP4LJJ2hSzC0hpdUSvytCzVwxjApljOBOBoBQxztPAZZfPNtA5FVsaym/Oyt8Y+vj2ACJn5c6V1WnPocU+IwbS77ky2WjzXLTT8PgtCnmEq6UjAARYPU4W3IiLvleTMehrMH3QJNw+acCBx3NJietx+IKtNj5ZlCEX5mGE5Akvp/NMh7J2VZtr3bnZwLQKJ2nc4F1m3MzG7bcNpc7K2FwZr0Tj66/TkBj9qIuKGVmV+qW0NtUlV1mpURcnW0Vx1HVLXXOlBSYbeghzgigW8oaxW2o8Ya2QSogne9XAIq1cTtYBaTmljEYYPQPOGLvv43ikju74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J3rePX6pNCEICu5CccjdtQEOJMRD9596bZjwvCaoBK3lq1+bu/AIZ+LimP3Z?=
 =?us-ascii?Q?OlAiYmpIkTUh/Pq39Yi5ctmc388FM4c6OXhtyfqCqxdlZqBYR/hpolZ/eoZ/?=
 =?us-ascii?Q?SJdicgLRKH0+9omwF1vULXEtPEKveALtvGhZyLccokn5VsXsab4HbWjU3+Iu?=
 =?us-ascii?Q?R2qB8M8rE9xK5r1+DuruLmDQV/v+r9qAHl2ZD9ocqJwHkGx9Gg3A4b+gYYcz?=
 =?us-ascii?Q?Rvgg7WGsdqrSZa1RYrS5JsJzBAXfPAwRAtdjJ0R5TupyhDeRA8wttrFj7Bt/?=
 =?us-ascii?Q?Np/jnSccXt8jMjWFpyRkEc0wOgRThyuPvabv0dTLtntjnsKgDziZ6wCWBfG9?=
 =?us-ascii?Q?ie0LaTh3d8g1gu2choQ8TQrG7juRYq+fBqgY6GN3NKFjsLcWuJd2dgCsZ7Jb?=
 =?us-ascii?Q?zSXhy1BTifF8V/xYpRHVZRZ9T9VcvhrBlFRMgaKE4WTxwh1ohwksbicyPbP1?=
 =?us-ascii?Q?QeVRUUS61G3AQpWS5WYO6oehd4gdNiG34zGTICOIqok9DQr0yGDw2tk6tFsl?=
 =?us-ascii?Q?NsfyLEBC09Lek4Tt8/mvJldLXCIkuD6+Q9DnKrtFP9giASS+oq4tahLgSeBL?=
 =?us-ascii?Q?a2ywSlB0xC1riemaXXKAvgZQkWG12plcVddPytxSPA5b2vGJqknqp+pO78M/?=
 =?us-ascii?Q?/Swi/p9R6JOBlFb5YV+xRBKVIjuvtPSzg7qIoCH/JO1rkivhz5TihBWZXW6T?=
 =?us-ascii?Q?nqdRnZBScUuxIRaProkJBrXG7nKgXb5dGrQnbZCDifVXFxwPSs3rYQB3SB0o?=
 =?us-ascii?Q?rr3qjfqArPOjArK4ruatJMoTwH4vPOfL+BypjC2/RBwtnahmBYiSMQfnBWf2?=
 =?us-ascii?Q?khSN+TEOHKywQWnfPixi9+SA1fvC4+DyDaXFhJf/R/AbBh7VdnoUmynfyXFx?=
 =?us-ascii?Q?ipnGbipnCCeNBoE3Eb4RYafi39D/CBFInHG9wqaIUrh0JTkI53YEnhejtOLR?=
 =?us-ascii?Q?3JukwEfzgl6p5T+YnPYCod+GqbspTI5wA53ud/ob21CcHgIXKa9+AUKV7ZW7?=
 =?us-ascii?Q?TXPJBW38p7TEXhvOte25q2IKEef122TmTk8MV8cplVzNu6BG/pwAH9b14s28?=
 =?us-ascii?Q?6a7JlL57VgzPGTmZ/sYuq5SJizTIzEN/cEB4RSDVEnSY89haBU4VZfQqCq1u?=
 =?us-ascii?Q?Y6LNvs+D3JOaqnxwNnIzkZSls4+Ou91DSEspz9eb5uJx5e8Oni5Vldw3pqKo?=
 =?us-ascii?Q?DSE2O4ntnI6ZBZhV+sCJRdjY8AMaPlA8ysFEqME3he7b2UQjOwlp9rFsr0PI?=
 =?us-ascii?Q?Fk69eRO1mW7aM/ScS9739nYZ5yOGqtgpOaFOKmCDXooy2VBtWfIL9KTRxnnW?=
 =?us-ascii?Q?rd4SZJWWq+OQPGSUWzFtzTtDojvKl5CymheGJXqwnDg+OT2qn5hsMRtJT/eI?=
 =?us-ascii?Q?xlpWh2PlSy8p9D/dI8E74fQS4mIrs1MmeNWlMLvKafjJiIVqUDguZUF8YCHp?=
 =?us-ascii?Q?lZPBdYhY2DcVx3jnFCPVm2yWY8T8SkAYVjPMcde+ZVnYCcRAtgOQQHvno+ba?=
 =?us-ascii?Q?O0fanHzZgbdyU1pYZjnRPX0CPPtTsThodWUVnFvnVUZcAzoMBoLZZLImUjb0?=
 =?us-ascii?Q?La2snIepng/NcNwWqvNOa9AQ/XA6Nl1BZ88tYkFrBEmcwGuDXf+wLM36qjoG?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e3d1a7-df1a-4083-64fd-08dc43db3d64
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 04:00:08.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE2Ii4/2NOd3HgQPZW4d3MbYiGjgfy0b0T/PEZHx7b8fHkS+K4rWwQwDe9R1ePfWvkZGnFZLSOdrbeQUK+V7QV6BnG7D3mcN1TCsLzXf8G0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
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

On Wed, Mar 13, 2024 at 06:06:14PM -0400, Rodrigo Vivi wrote:
>On Wed, Mar 13, 2024 at 04:54:38PM -0500, Lucas De Marchi wrote:
>> On Wed, Mar 13, 2024 at 05:44:00PM -0400, Rodrigo Vivi wrote:
>> > On Wed, Mar 13, 2024 at 03:49:56PM -0500, Lucas De Marchi wrote:
>> > > On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
>> > > > In many validation situations when debugging GPU Hangs,
>> > > > it is useful to preserve the GT situation from the moment
>> > > > that the timeout occurred.
>> > > >
>> > > > This patch introduces a module parameter that could be used
>> > > > on situations like this.
>> > > >
>> > > > If xe.wedged module parameter is set to 2, Xe will be declared
>> > > > wedged on every single execution timeout (a.k.a. GPU hang) right
>> > > > after devcoredump snapshot capture and without attempting any
>> > > > kind of GT reset and blocking entirely any kind of execution.
>> > > >
>> > > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> > > > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
>> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
>> > > > drivers/gpu/drm/xe/xe_device.h     |  6 +-----
>> > > > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
>> > > > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
>> > > > drivers/gpu/drm/xe/xe_module.h     |  1 +
>> > > > 5 files changed, 33 insertions(+), 5 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > index 5f0a2bdb7c24..296bc75a55f7 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > @@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>> > > > {
>> > > > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>> > > > }
>> > > > +
>> > > > +/**
>> > > > + * xe_device_declare_wedged - Declare device wedged
>> > > > + * @xe: xe device instance
>> > > > + *
>> > > > + * This is a final state that can only be cleared with a module reload.
>> > >
>> > > same thing I mentioned about module reload elsewhere.
>> > >
>> > > > + * In this state every IOCTL will be blocked so the GT cannot be used.
>> > > > + * In general it will be called upon any critical error such as gt reset
>> > > > + * failure or guc loading failure.
>> > > > + * If xe.wedged module parameter is set to 2, this function will be called
>> > > > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>> > > > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
>> > > > + * the issue is preserved for further debugging.
>> > >
>> > > Maybe make it a little bit more drastic so people don't use it when they
>> > > shouldn't. I really hate the amount of reset=0 I see on machines being
>> > > used with i915 with the additional patches to achieve a similar goal.
>> > > IMO it should be a very targeted tool in a toolbox, not the hammer it
>> > > became.
>> > >
>> > > "In this mode, GT reset won't be attempted so there will be no recovery.
>> > > Any GPU hang will completely kill the GPU so an autopsy may be
>> > > attempted.  Use with care, if you know what you're doing."
>> > >
>> > > > + */
>> > > > +void xe_device_declare_wedged(struct xe_device *xe)
>> > > > +{
>> > > > +	if (xe_modparam.wedged == 0)
>> > > > +		return;
>> > > > +
>> > > > +	atomic_set(&xe->wedged, 1);
>> > > > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>> > > > +}
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > > > index d10664d32f7f..de3149baf82f 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > > > @@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>> > > > 	return atomic_read(&xe->wedged);
>> > > > }
>> > > >
>> > > > -static inline void xe_device_declare_wedged(struct xe_device *xe)
>> > > > -{
>> > > > -	atomic_set(&xe->wedged, 1);
>> > > > -	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
>> > > > -}
>> > > > +void xe_device_declare_wedged(struct xe_device *xe);
>> > > >
>> > > > #endif
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > index 19efdb2f881f..987a57205fc4 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > @@ -34,6 +34,7 @@
>> > > > #include "xe_macros.h"
>> > > > #include "xe_map.h"
>> > > > #include "xe_mocs.h"
>> > > > +#include "xe_module.h"
>> > > > #include "xe_ring_ops_types.h"
>> > > > #include "xe_sched_job.h"
>> > > > #include "xe_trace.h"
>> > > > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > > > 	simple_error_capture(q);
>> > > > 	xe_devcoredump(job);
>> > > >
>> > > > +	if (xe_modparam.wedged == 2)
>> > > > +		xe_device_declare_wedged(xe);
>> > > > +
>> > > > 	trace_xe_sched_job_timedout(job);
>> > > >
>> > > > 	/* Kill the run_job entry point */
>> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > > > index 110b69864656..61272553f40f 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_module.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > > > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
>> > > > 	.enable_display = true,
>> > > > 	.guc_log_level = 5,
>> > > > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> > > > +	.wedged = 1,
>> > > > 	/* the rest are 0 by default */
>> > > > };
>> > > >
>> > > > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>> > > > MODULE_PARM_DESC(force_probe,
>> > > > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>> > > >
>> > > > +module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
>> > > > +MODULE_PARM_DESC(wedged,
>> > > > +		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>> > >
>> > > as we chatted earlier today, I think there's one thing missing. If an
>> > > engine hangs, we won't notice as GuC will reset the engine by itself.
>> > > We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
>> > > GuC in the ADS structure. This is what I was attempting earlier today.
>> > >
>> > > I was wondering if we could even update that in runtime with
>> > > INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
>> > > only to when we are ready to reproduce the issues and only on the
>> > > specific device.
>> >
>> > I like that... Perhaps instead of the module parameter we have a debugfs
>> > entry where we switch the state?
>> >
>> > So, on a debugfs write to switch to this mode that gets 'busted'/'wedged'/'dead'
>> > on every timeout/hang, then at that time we send this sched policy change?
>>
>> the shortcome that we always have is that it doesn't cover the probing
>> part. One common problem on early device support (either because of hw
>> issues or driver/guc bugs) is on default context submission. If that
>> receives a timeout, shouldn't we declare it busted?
>
>hmm... indeed.
>
>so, perhaps continue with the mod param xe.busted=2 but then right before any
>submission we check for xe.modparam.busted == 2 to send the
>INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE before sending the command.
>
>so on the next upcoming execution it would avoid the gt reset entirely.
>
>then we could use it either at boot with xe.busted=2
>or at runtime by
>echo 2 | sudo tee /sys/module/xe/parameters/busted

I think we can use the modparam on probe and already put it in ads.
That dictates the default behavior for the _module_ regardless of the device.
Then we allow either setting the param to change the default behavior
like above or we create a debugfs so we can set it per-device after the
probe.

Advantage of having the debugfs is that we that we could even go on
other devices we don't want to debug and set them back to 0 too.

Lucas De Marchi
