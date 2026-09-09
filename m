Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78482C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 18:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A77910E1F9;
	Wed,  9 Sep 2026 18:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jstme7b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389B010E1F9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788977526; x=1820513526;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ETF/m8c//gB52SyIT9u4pluBsJOjbnX6mo6uJo35tXA=;
 b=jstme7b5x4nmOgm/+ZLv5AEWAXYx9q4LPG1mcaNIsODgAmR7ew6DaijY
 JTY8o9fBk6cX51z+eOVmJ1ftg0d9SNIYhWarFvcYUf2uel/rmpcGnnvy6
 ex2V38z/Yy5z934DxkErgpqZHLFIMQkH6zjeHpAP5YOpM1H46TEWkeUgd
 Ik82Z6GqKCveH2/DoU/ktDvpFLWXSGGJL7aktmmRhkco6CD49u5cbirTT
 urxVehJemzxsAi6Q6LnZqN4MhOUCtFN9Tr2UZMcbLHX576eSX8XI0t48O
 Uu5k7kJIL3HDxF4Nya9ku6bBLUFrU/cyGyECOY4Tldv2PZXY7JIR5ccLG g==;
X-CSE-ConnectionGUID: LlMxzQawRFyzdq147CNJkA==
X-CSE-MsgGUID: /oisiP5RTEKlr3OX3eelig==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100772028"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100772028"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:12:05 -0700
X-CSE-ConnectionGUID: WAeHlScZSD6Lpq+nf6Z9IQ==
X-CSE-MsgGUID: qeNcII3HTh6Pw53+lj+u1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268141533"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 11:12:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:12:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 11:12:05 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gzut5cpFn+MXekZaoQTcUcQF8fTazxfywd2fEQ1KUomyIe2UQIh+v+Tf7pM4BIqPB9xWcweQSbavxUhEQzyoakIP0zq4ceB+hmj2jFF9MyOjxe8DywffXkHV/SOcVkANkrCH6jrG6vUcX4uSv4yqgJhqaXZaz7O+EWw5mLF5Gjp6NPFXecZr4Lxz0dJiZlmTGWbnfT5lhOZmkKOSUIRFOzR1MbUY4hUbOzTGb7Gopf178CVfsYQ/UZto7zbK6raoQZUlbDWpmKv8Ha9/kEbiWvpCXZZob0guHDpi7G0gSFEhHgaLE2ylgcZDFWlJ04QmP9je5ecc8QdD4NsthKVlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1i17k/0y6T2Ggrf1SpAuWIajcNm4Zr6FtAJA8BPQEw=;
 b=KN//0aqM+eWLK+gymdgKlfM7/o37Ai5jQTUsgUmk9tos8Q4o5YdMDJFGY31ug8sfVADP199z1l/7LW8sRlI4FmIUPZVoYCTLmupUyn9uBhRSrCGgROlJ6+5BhhBXiIcrW2yfciJoBaOpBoVjT4TQJFzcGLDBD+nEEbA3cLXi/WJNQOq87ah1yFge3hiDCzstG8DT3OieE6KXkNBzoW4W46zvbbAift2m3z0yUkpuuBtpOkUfl+zOs/Jtx2oq6ORVDFOXfVYvI6N7yNaHqKZWIibaQ1mDsFjz+1jqze7J3JCD3e03gkgeRYXj6eiCCVlaQ6n+noNhRDCAbX28IOf8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ2PR11MB8299.namprd11.prod.outlook.com (2603:10b6:a03:53f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 18:12:02 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 18:12:02 +0000
Date: Wed, 9 Sep 2026 11:11:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 23/24] drm/xe: Add modparam to enable / disable ULLS
 on migrate queue
Message-ID: <aqGhb9k93U7PoJ1L@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-24-matthew.brost@intel.com>
 <ede219e02fab3c78c66edfb9cabd0e029de318e6.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ede219e02fab3c78c66edfb9cabd0e029de318e6.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0223.namprd03.prod.outlook.com
 (2603:10b6:303:b9::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ2PR11MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a26b4e-8d7b-44a3-6887-08df0e9dd89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sgwD7Sl4NKHy8N/KJKFiUrZqRwuFxyE16/2UWO7tpouoQiCU8F9eh7Pzj1RDyunZQfHS2BxXvQ+VAlsNYszc/NHt1l66fRE6T6fiXS2657WQKohLvf1IN1vSONqUA+ZrS+JDDD+Ra/vQKQprfK+JX1285PLr1/xUL96uh9V+cDD7tRlDSnwgAyqI1+ZApgq04HXk8x1tlCz+oqRJrgVzN/+kevG9yxkWVbQZBy/Us67hstFJ9iPlEyMFE/BfaM+BI08O659AFJhIh6ZQFdeI44dT0vKdlxyHE/5UJWqhxy9KiUU+MpFekH8hebIaCYfyNltBcOLJBCkktIwCwlfU0cU6Yf/LxN5yqJl1I5oY/9bUQWQZqElY0vE1+ESb0qSm5ktDLfKoGejoaYi6Gp+Kd32BQogygjzXGAQdKpzaZwjU8n0mt4O6pAjADRD2a6SIvIMmAG0v8P2B1pnGrXuggUWCZnHuqP1ZjpdJ4iOVejQuQR3aWR3G2SsnI8E5WuFxsa1OfGMrwqIj31donF3lRE+xdCJKtJpC1lCTusbj/r7CF4Nfjo9coMvT/r0qISa3dD8j7Nz/iYHDrC7qh1G30EM2IJbcZ7gWD3VVYGFbIgk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EOGPtbcP26XfAztIp4bWt6ThePPX+R/axJ4QhFWQFVvZGqGOEgDbzquYZL?=
 =?iso-8859-1?Q?o6th+YELP2GQDHNjVppGOZoOuEDoBTZvUnWCRtAY2y4adfe6zbIVAL8hwM?=
 =?iso-8859-1?Q?I+6Oj0Zs8vBK4kp7T8L5Ruw2d+gTA3WCGiq6WUu++sdqRw1795BlxZaCqa?=
 =?iso-8859-1?Q?K5CCHTtHQlIw1mgGyaZAG9K8qDysp9XQI0QxCTsvFleyMXJc6y0cn+Syke?=
 =?iso-8859-1?Q?2MAmzEl6yRAUY1/V4c6y9jAWmxd77P1x18bv7PusdodOxOzZYDFxkNAeWz?=
 =?iso-8859-1?Q?9m59baG0d7qhOYXNglGhasgqKk7E/wP7q0ey+3GBoMsA3k6m/0KfQz95Dc?=
 =?iso-8859-1?Q?bKKVuJBoXkQGekaMoabfkpToGbHsx7GoXY4dFTvlIuw1hkA+qvc3Q0a7G8?=
 =?iso-8859-1?Q?HAUwstruHuefH6hZ7mhdx5f2qcRX32XA0ppE4/41Vqy4wBSpCTP0UjFT/N?=
 =?iso-8859-1?Q?LTyUxqAX15ke/U1Jm7JhjZyzEQAIobt50p9Pb75yGRU8fm0eNQnBhD6m9s?=
 =?iso-8859-1?Q?oZr2sSee7yGbwo+d+33SW38ntwRGt/79s9drNgPjOx8bS4iRBO+FIMkYV6?=
 =?iso-8859-1?Q?Q9j7Op4gOSqcnc+9SewDFbU93Qstrn6EHCnnbnrMOX0qNicBWFzOyiEiXR?=
 =?iso-8859-1?Q?iW3BGztU6M/o+h62H2BOmvnseP3r2TmxLHiMi17TNuouCx5VOFNQpJXw+z?=
 =?iso-8859-1?Q?pVMzo+cy9KASaioy38g8Zfvv/MN5gzs4VtKQOT2MWPhm1g72zQTbJSaoDw?=
 =?iso-8859-1?Q?ebfQODjnyI/Mu/9SpYmHESYUeMbIViLClYvxE/Vz+fRHSXPN7rjAN1+9I8?=
 =?iso-8859-1?Q?fx4dFnNJceZblgUE2CF4AwfWzV7bPuJEg9kQClG5Ga2h4+ouiaymwv0IBh?=
 =?iso-8859-1?Q?E04PRXhkkQbVFQJP//fgkBXA2esLVDLvWjStuxH5E1wjkBMus3vXXwfTf2?=
 =?iso-8859-1?Q?OjTrf1o4Pgs+3o3wOr3Wz5ktFjMcAu4Bpi5C29WBfkgivlnKKwLsmD3esS?=
 =?iso-8859-1?Q?/e5JZWm6UK4vrQnCgzLwPuLSRD9knMcOyjDVE4Lk4mAXHZtW2gpMS9tmop?=
 =?iso-8859-1?Q?nUGr3Rb/+VctRYZJBYdyy9NkiSYK+bN36WW/H8BVIv6JGEkyHhjF6FU5O3?=
 =?iso-8859-1?Q?j+B3penUg3cVXHjdyEyc27q/8eDB0dvizS29ElC8ggpfPWIHWfV8UYBaf2?=
 =?iso-8859-1?Q?i5uKLBWto8DbSK8QS0rB4rgXbkzpT3uPy8jbdQwqchIznW25Q8hjkJVMLg?=
 =?iso-8859-1?Q?cs06EpPfOJ+eF5bWv0rxnWdtvo1OtvDjyIbnW8DnFqJWFttqzZvDAREGMK?=
 =?iso-8859-1?Q?iEhHvgizPrKPwIHrkPoqObjWtDUTE4bQyYsAkGkzomRFSbe9rMMpIgbebg?=
 =?iso-8859-1?Q?dIXq07NccF/tNsT4bPEdCpXkGoYRxQRDHplNedA9XclCIv6NGL7WmiktUv?=
 =?iso-8859-1?Q?ZEh47x8QemUH+k3VkwkV3UJxMP3YbRVoaGjentqE5FWxbExCHbXfjGCc2O?=
 =?iso-8859-1?Q?KPpuvOiMd8cUtRltyZRjCGTupzJUKtjBoOI9dPmSSIHLAzYyQPVzmSl9qF?=
 =?iso-8859-1?Q?TKdwzvyxxaqmBlNCqVUgenvMBUqzmyZ/Z5GQqMsFtV6wgdEsDb7FdsmOng?=
 =?iso-8859-1?Q?hV9Azg6iPr6sBOgcwjMGRILcXUAfFGP5F9KI33D5bk6eQGRRG9rqS2dPW2?=
 =?iso-8859-1?Q?R7wpS6ZPPicFtowfO3lJP2Vwd3PUy9V5oJEks48s8r6HoISCXZxVXDnrb1?=
 =?iso-8859-1?Q?+p6zGxDAxIl1tTklHuKATP4kDKmNi1nS4gsALdv0yRT+9p9vulw+V8qEG/?=
 =?iso-8859-1?Q?xoLP/F7pD9JPlcN+nPa/FFLGSYOpmjw=3D?=
X-Exchange-RoutingPolicyChecked: XdUaT1oWLYQ2Is1X7rZuChpJIkLLJZyDxLdWEsPMB06B6a1fVq2XNtj3vk9goYGWTmzvlvSz4febqOVUicRXCG3gsGWO3IWOtfjAvqpq4uAL5X3HAA0BVNLJGjTY2q7ihNbVZLYObVf6ZKoCsRqP5v7my+YHweS5JxEMPSF7ei90Us+hwW/xtT70ZOgYPzAXDAnwtWKegE7n5eWqOo4w9UElpfKfmY9JhmQbNRJBBkBfrXB26QvKzlnQSTvuFLt9Ep9Y16zvFD6oTZpNP9z7CnEa7WTZPENPOL/p+NmuS1PxJeb1hMKcatK+3uE7v0g01reGNTv+JmmNud+0l/vU9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a26b4e-8d7b-44a3-6887-08df0e9dd89d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 18:12:01.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcP6gcEV6RJyTq/+dcFWjCAQUWjPy9mYTdNMixibs78tebIT9TTOmy/Bj95lW48JeYvhKNxTJoyKvuNxAgwFdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8299
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

On Wed, Sep 09, 2026 at 10:03:32AM +0200, Thomas Hellström wrote:
> On Fri, 2026-09-04 at 14:16 -0700, Matthew Brost wrote:
> > Having modparam to enable / disable ULLS on migrate queue will help
> > with
> > quick experiments.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Link:
> > https://patch.msgid.link/20260228013501.106680-26-matthew.brost@intel.com
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c      | 1 +
> >  drivers/gpu/drm/xe/xe_defaults.h     | 1 +
> >  drivers/gpu/drm/xe/xe_device.c       | 1 +
> >  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
> >  drivers/gpu/drm/xe/xe_migrate.c      | 2 +-
> >  drivers/gpu/drm/xe/xe_module.c       | 4 ++++
> >  drivers/gpu/drm/xe/xe_module.h       | 1 +
> >  7 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 80f62634fae5..f3f37d116d62 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -222,6 +222,7 @@ static int info(struct seq_file *m, void *data)
> >  	drm_printf(&p, "revid %d\n", xe->info.revid);
> >  	drm_printf(&p, "tile_count %d\n", xe->info.tile_count);
> >  	drm_printf(&p, "vm_max_level %d\n", xe->info.vm_max_level);
> > +	drm_printf(&p, "ulls_enable %s\n", str_yes_no(xe-
> > >info.ulls_enable));
> >  	drm_printf(&p, "has_flat_ccs %s\n", str_yes_no(xe-
> > >info.has_flat_ccs));
> >  	drm_printf(&p, "has_usm %s\n", str_yes_no(xe-
> > >info.has_usm));
> >  	drm_printf(&p, "skip_guc_pc %s\n", str_yes_no(xe-
> > >info.skip_guc_pc));
> > diff --git a/drivers/gpu/drm/xe/xe_defaults.h
> > b/drivers/gpu/drm/xe/xe_defaults.h
> > index 0884224ef7c7..9c7e89a169c5 100644
> > --- a/drivers/gpu/drm/xe/xe_defaults.h
> > +++ b/drivers/gpu/drm/xe/xe_defaults.h
> > @@ -14,6 +14,7 @@
> >  #endif
> >  
> >  #define
> > XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> > +#define XE_DEFAULT_ULLS_ENABLE			true
> >  #define XE_DEFAULT_VRAM_BAR_SIZE		0
> >  #define
> > XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
> >  #define XE_DEFAULT_MAX_VFS			~0
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index ade971de1652..9b81759af28a 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -520,6 +520,7 @@ static void xe_device_parse_modparam(struct
> > xe_device *xe)
> >  	xe->atomic_svm_timeslice_ms = 5;
> >  	xe->min_run_period_lr_ms = 5;
> >  	xe->info.num_pf_work = xe_modparam.num_pf_work;
> > +	xe->info.ulls_enable = xe_modparam.ulls_enable;
> 
> migrate_ulls_enable?
> 
> >  	if (xe->info.num_pf_work < 1)
> >  		xe->info.num_pf_work = 1;
> >  	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 997ac82fd571..fd4560378f5b 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -245,6 +245,11 @@ struct xe_device {
> >  		u8 skip_pcode:1;
> >  		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ
> > on VF */
> >  		u8 needs_shared_vf_gt_wq:1;
> > +		/**
> > +		 * @info.ulls_enable: Enable ULLS on migration queue
> > in LR VM
> > +		 * open
> > +		 */
> > +		u8 ulls_enable:1;
> >  	} info;
> >  
> >  	/** @wa_active: keep track of active workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 3e59aeeca614..3bc78f761f23 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -523,7 +523,7 @@ void xe_migrate_ulls_enter(struct xe_migrate *m)
> >  
> >  	xe_assert(xe, xe->info.has_usm);
> >  
> > -	if (!IS_DGFX(xe))
> > +	if (!IS_DGFX(xe) || !xe->info.ulls_enable)
> >  		return;
> >  
> >  job_alloc:
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 4bc28dfc1992..a8b546550ead 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -23,6 +23,7 @@
> >  
> >  struct xe_modparam xe_modparam = {
> >  	.probe_display =	XE_DEFAULT_PROBE_DISPLAY,
> > +	.ulls_enable =		XE_DEFAULT_ULLS_ENABLE,
> >  	.guc_log_level =	XE_DEFAULT_GUC_LOG_LEVEL,
> >  	.force_probe =		XE_DEFAULT_FORCE_PROBE,
> >  #ifdef CONFIG_PCI_IOV
> > @@ -44,6 +45,9 @@ MODULE_PARM_DESC(probe_display, "Probe display HW,
> > otherwise it's left untouched
> >  		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY)
> > "])");
> >  #endif
> >  
> > +module_param_named(ulls_enable, xe_modparam.ulls_enable, bool,
> > 0444);
> > +MODULE_PARM_DESC(ulls_enable, "Enable ULLS on migration queue if LR
> > VM open (default: true)");
> > +
> >  module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size,
> > int, 0600);
> >  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB
> > (<0=disable-resize, 0=max-needed-size, >0=force-size "
> >  		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE)
> > "])");
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 6272d9e41207..5d88448c298a 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -13,6 +13,7 @@ struct work_struct;
> >  /* Module modprobe variables */
> >  struct xe_modparam {
> >  	bool probe_display;
> > +	bool ulls_enable;
> 
> Shouldn't this be per device rather than per driver? So sysfs knob,
> perhaps with a modparam default?
> 

I didn't really want to add a userspace ABI, such as a sysfs interface,
at this point, so I went with a module parameter instead. It also seems
a bit odd to enable this on some devices but not others.

The main reason for having this at all is to allow quick performance
comparisons and, of course, to give us an easy way to disable it and
retest if we encounter workloads where kernel jobs appear to hang.

I'm open to changing this as the series receives more review and we get
closer to merging.

Matt

> Thanks,
> Thomas
> 
> 
> 
> >  	int force_vram_bar_size;
> >  	int guc_log_level;
> >  	char *guc_firmware_path;
