Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E10CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 16:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505E10E134;
	Tue, 17 Oct 2023 16:02:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D526410E134
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697558571; x=1729094571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xj1WvFpuMOdF7tY21xIQLlKYHXezuPOeboN6NLIY6W0=;
 b=fcJzgkxjdyJ0XtiVai5g6FVuyoF7ITM/L4QZjvMHlvthH6Iy0zuauIbr
 +9yyNwlI/FCNDlJBty5ifgLyPFbHjy3p4GszaDVAhcF9UgYKfRFQEFAQH
 Zi243TP5JFFgvsGCq1w2B6S4Untc1XGuHwNQEhVS7i1Ka1XfI0rF7cFUr
 1UAdD3DBqv4X/klHtUR16jyrRsPMq1Bq8YOTs9uaWBqtwjVfS/jVRdRYb
 JXWYeeXpuD22en7ZEmNSO3rdfkeeYn+waACH1DfTD7v9FTAIcNmZCxrD3
 jSQ/Umt6RmGl0izvhN1AAoLmX1M+4YLcV19lGh694vrja6LPWPE0NozJq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365165915"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="365165915"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="756165441"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="756165441"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 09:02:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 09:02:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 09:02:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 09:02:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 09:02:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpshNQsYaJAIpDMHn795Xqmr6jm6tjN7HwSBRUww7NLndF1UJi+KRTKALXbMZ97FAUpvYraAgOVQn5Cjsb7t7Zctky3wVenrK6pK86iv6f1ToPoJi394C6FUWa/iMNxjusn6nxpNnuWLghigoPJ1rdo/4X88OF7OXsS0ZK9DzeTTxDM33lP5aOr20l7uG6juSumVNHE9aiq2flrgGrVb8tlFlz27mFZ/+XUErue832Akc/spb1kKTPaxA9IBrfs3N4aIAdmr7p+4OLgPk1E7UuVhmE2SEE1ec4rg0Rjz7WdXISdjF7BjECHmaAMiZndPgyikkIJ5lCGVGyUn3Wu+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAG7KtzJaLdKeG6fC/eUXbK+KTRUgeVbtvhqdSEoOMc=;
 b=EZihZQnnkcAW07/JANRn1kpgu7s/XhjTF+vE5DcmIGLsqGLvEeOVjHMtiuPVvWWDeTEgfKMPpUyq58kNfOvCcM+es54KJM0Dg2WnTPhKxxjb+n/mmer+L/Wsmho/hBMEb2UNkWxeW9d7Lcy2D+YkdoJMFZYz+KuE/KpMcHVlSETHvQw+TAJJz0zIgwGqx98ojDyWrezRhllnWvnPtyxDHCUyJKfNeb56bb9IPhZ21zqdPX7xfZe+8nehYt9EGlGNmTKI9qHQ4eY46Ypbc7N4Nus7hvVM0m9D8YNicX1i708eWOd9Zn52x+iBOy6YfOCP/0B7sbBrKEKk/QRAIb4eoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 16:02:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 16:02:46 +0000
Date: Tue, 17 Oct 2023 12:02:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZS6wIrg4XE4wzbiW@intel.com>
References: <20231006095943.7-1-francois.dugast@intel.com>
 <20231006095943.7-11-francois.dugast@intel.com>
 <871qdtdzuc.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871qdtdzuc.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 51955a8a-f712-4bbd-edeb-08dbcf2a80fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf0PserwhJU40MZkADnDV8cyfVsxyCYh7odafZSWwWTBf7Kz8gW1kh9QpvaSytOylD2axwdcehdLRmm9t5pFXOSUotlWN/xGiNtiBecqEOU0QyzYIYgLVc2SNmytMVnD50OxBtnEo/DZNfU4vi5VGMoqbQ28P0VEe84n5jGAWrWsoebmnBZwjDSic6IiltGX9WgbGxQzsinh5wkpH6jrNcBlviteFQlw3WyGemxmbXMQJjgqk2ebPGByQ4/9eiJAz2RQlDWC5LpszOTa09o3MKpcuCg0aOAfu1rd+jDkuRQbS/0Zu3LT6k/PcRp13D/rfVe8/BQwztXvljWnLz0gsk5i4iJek+U8kjnrqmEosIrWcfaGdkh4YE//ATw/IPHcpDFkhwSM9VTpW5NvB1gxO+Za5yM7AF42IT/6WfGcbWtu5D/JkWhTQ4SEwB0CFv+2QRuvBbL02hpZQf0J6YfT61Ka5pIDDFdGc9udS+gbdbVEercjsaUqE3quBRXJqGU58XBiD2b/W+oqr+bkaHHcrG4w0QXLa+HQdIUzeuwVIoX9oL56OM+0CtgBOd6qHuZA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(82960400001)(8936002)(8676002)(4326008)(6862004)(38100700002)(41300700001)(44832011)(5660300002)(86362001)(2906002)(6506007)(6512007)(478600001)(6486002)(6666004)(2616005)(36756003)(26005)(66556008)(37006003)(66476007)(316002)(6636002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IP61tTeSOA19IcU9VclNQtrfYMDoTCZRKxUCwWn+Jlem8NRjB57L9W5lPQ8P?=
 =?us-ascii?Q?sNQhCtGtScFlakhu/Kc+ybrx469enPyxO7YDNzVtL1qH/pHF3ofaXQl9KhPf?=
 =?us-ascii?Q?Xr3qgRUqEXnAN1K0Noeec5dmYK/LENrvHaMEUqJ9PwFEfdNI/bbKwo0D47Km?=
 =?us-ascii?Q?5GJ2unqYphOff7UCjRXr9KE7c/sbCE2Cf/Rd5iz7pwQyN5PpA3UM+GD8/Hor?=
 =?us-ascii?Q?1EZOtEPUdy28R6qcAypU+9MSZqITGF9+LPXEy53b0gNJBwcck/9o4RrSSUkt?=
 =?us-ascii?Q?Kv3m/hn8B6SbeuHKDfDZCJl39duEFjFVJsGicvAmiLQbtJkJ7fk+TSvVmoBk?=
 =?us-ascii?Q?jDJXb8tEKuaoysvMIIRILOpT8deu4lHMrKYEJ/8BXAfHbxbEskjW2QjkTdnj?=
 =?us-ascii?Q?ZvwhTvcriF2mwBpBYohwScv5I5brExGQ7urhrh3+YFqPNpoGzwsIGTbMwSPj?=
 =?us-ascii?Q?WB0s0vnfV/eU+SpPkHR5sauKEZ8E9BeBstw9Ml1mkxr2fuUebw2shm0xwJuR?=
 =?us-ascii?Q?iYcLfZOKoU3zzteOYkXc2I0n1hhdDRMKcwX1AYnjp+ZWmmplDYZvYgiW6v4E?=
 =?us-ascii?Q?6dJCQsLhPgcuQVA2RGhf2rT8TuYakcpb9+vDqVQ9c1aQfiwt/Xs/Hzj5B+c6?=
 =?us-ascii?Q?VWq6fGLi3SN12ucNUyUXqAvYN0qLRMnHTbvjgGiKZvqEJlZSsJVIxua6ZzDH?=
 =?us-ascii?Q?PefHA5AA+98Yfcz5WAykCHfq5rZDVZ5TRqoMqsF80PPD85Lf2O9DqWstfmAR?=
 =?us-ascii?Q?O4Wwxgcnu5IOoUxUSROescZ4rfm4mr8oYhyZTIzlSOlvgGzo8K2LfRS+TeVi?=
 =?us-ascii?Q?TexV5xvTLMep9B+zzA8dvLVfyA5oR+K45MbJ8PiflAl99qdFF0UcJ2vquHB+?=
 =?us-ascii?Q?d85K3gKvRss0JjVimUePyplfVtMGbgn2OknUvBqZUxVeN5FuvTwLUxD5ZE+i?=
 =?us-ascii?Q?/WSFISkc4Pq1E+g/LiGOz4Eqk4jak7tzNSaUeOmJq9PbHmgiYzxL8EkflrKJ?=
 =?us-ascii?Q?qhZFB7Xm4MvnpNFp4ds9PEuPBXwnyZmPHnNJFUlJtYDDUf2iG1ocOtxtG9vr?=
 =?us-ascii?Q?dyFk4LF+FnN7IgnMlG01YJScVAjZVcjFYNc7iILl7PXCpWbRZE9RheORMiTm?=
 =?us-ascii?Q?OXZP0PbfvLzWQGRD+kTrjxKYHRtO16asbBr4XRqrhqe9YiSzQwLezAfQRLsJ?=
 =?us-ascii?Q?nFyk9RUY0Ag25OjiKOO0ZKJ6ro48B+u/QYfhBKOPr8e/Mk2WG41xnf3/rcKM?=
 =?us-ascii?Q?wmGBPtGKWRxQ7kcBhiOqnvRef0EYTMxo0EhReYIZeKKfAaL2B8e9bU9e4kv/?=
 =?us-ascii?Q?u4JQDODHEzqHrSnpGFGtxKVDCLAsPyFRmBTUTNP5/Y1eUnmw/eMlOJmscfuj?=
 =?us-ascii?Q?oVX3V1fy+y0OFzCh2zMpSfIDsIywPRQR+BTPM1EC6vtLMTKS9PlOhEbFDmP5?=
 =?us-ascii?Q?GdUkngU4C3lx7cvocXiPEorxZ6p2EKtv0E/0YT7WXuJh7gtXa1UI+SwRUVcV?=
 =?us-ascii?Q?ac7Ggfz2eR+p8622dowHDINcpQ50X63FZ7uAiG9tuV6+Zy+Au/rMRlt+0poH?=
 =?us-ascii?Q?gBW2I0MHVLGbs4AtfU+yhfrcx538PG2nbTRmRIx+V7lRKXrsNuf2gRXxDf3I?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51955a8a-f712-4bbd-edeb-08dbcf2a80fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 16:02:46.5413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QVxao/VD3rmZ3PvnCmHhvl5dtwum2HmeOi4S3LJ23qaZCtT43pktHjFaqcXZ5+jazqsjcJAPtxToYIOceevzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 10/20] drm/xe: Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 08:37:47AM -0700, Dixit, Ashutosh wrote:
> On Fri, 06 Oct 2023 02:59:33 -0700, Francois Dugast wrote:
> >
> 
> Hi Francois,
> 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index ad21ba1d6e0b..2a9e04024723 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -781,21 +781,14 @@ struct drm_xe_exec_queue_set_property {
> >	/** @exec_queue_id: Exec queue ID */
> >	__u32 exec_queue_id;
> >
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > -	/*
> > -	 * Long running or ULLS engine mode. DMA fences not allowed in this
> > -	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
> > -	 * as a sanity check the UMD knows what it is doing. Can only be set at
> > -	 * engine create time.
> > -	 */
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
> > -#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> > +#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> >	/** @property: property to set */
> >	__u32 property;
> >
> >	/** @value: property value */
> >	__u64 value;
> 
> Mostly a nit, but I had a question about this because I am facing a similar
> decision elsewhere. Why do we have one property/value pair in this struct
> when all the rest of the property/value pairs are coming in via the
> extensions? Basically, how about removing this property/value pair from
> thus struct and let all the property/value pairs come in only via
> extensions? I think that would both simplify the code a bit and be more
> consistent. Thoughts?

or maybe the other way around and do not have extensions on the first version
of the api?

just thinking out loud, but no hard feelings for either way...

> 
> Thanks.
> --
> Ashutosh
