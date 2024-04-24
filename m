Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB3C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 12:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D88113AE6;
	Wed, 24 Apr 2024 12:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAWmnVej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2209113AE4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713961546; x=1745497546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HE/65NgJPnPBh+CusmWmvC3x4OLPp4P3FHdKPKH/bdI=;
 b=HAWmnVej+F/9SzkCfG02tmsrbM0XWygr9dt9YqzUPapSweu11HFkZ32c
 wX8ajrIIXRuDDZesJdEqiDEXF2XOfVYQnP7qc9gM6YYPoc45m1JQPvyEi
 vwwUBYEWaMgWM4RWnUSvBehlcFivkvrAe56N7/3JyX321Slo2VOXmCQw7
 zsRYNI/haQhhzASDU4qt9YMuUHm8wd+OuS3wzHqi7AfbGOWgIguJqoGgx
 ChWYZR/K5scBys8TB7s/KQI5Uzp8vVgTNfMzVpAFwv6Z8Mnh/recLvLUt
 0yQlbazMqHF8ePnrSt0vn7ePF0DKzk6uhWzv9lvYNOOPK7QkzIN+lq79y g==;
X-CSE-ConnectionGUID: IaDA6WNST02qt00WAs7SPw==
X-CSE-MsgGUID: 9+IHqV04STWRWklG+RnUvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20738776"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="20738776"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:25:45 -0700
X-CSE-ConnectionGUID: XLXcSV3gRHW/K1b+cZpM2Q==
X-CSE-MsgGUID: p8Lz63alTi6qM+e3JV2I9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24732700"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 05:25:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 05:25:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 05:25:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 05:25:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 05:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtGWjmUNJjB9TLVm0Eqs9j4QK7kcKmrIdJSOdGlAT+TU6hpE1ctDaBtyR7CidI65SImGHKQF/aSw4D0Rt+Su6xtmHKXsOTyAIEkbeLa8Fz2U34RzGMPPmG0ONV6zRvfsIEHogfR8ZUpmdCd3pg/ZreRe3dU0ioayu7lbpqAPq55KXdauuLMxhXWgAt+15rR92M4QvDgqVQJRNMJeL+MUREG4mfhNWbDDsVskO2ZELc8zeludu8MBfpZrd+KIB7bua399Xk8iiVMe3FONtefJfcoY5+5L0DbozONhjyeDlB7EF80nMT0o4Pb1uLHGHTMCvskY0grIotaie7Yr9/4Sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhk20EWAmkglsbMBHiNRFEsRIpVNY+P4p8od9Bphmkw=;
 b=AhUIxEqVSvuIU0thDOiVSOHQW5+XjElLVZVGoLBYu4WaBT1w4AAkyH2wyzFF5sdGCtZYJ/PWmks/LaqOaFgN360aDYtEEUn/yg2XXaF603BV9IP+xR1BzXZNWRkgGl3+8ehh4KVD1h/Pok9aMeAbuN2Vs+i93RE2WlNvzkgoc/BN+6OoyCeflHTXO8gr7exTEZJNJqaawJ9YS0mxczL6W7nyWmmwRakFnMbvxg6VcKIha/Gk3cN6IvVDh8NZSSRp/H9cUHguu1skgLeQ6c360I07K+a+rVUeIIK0kvz074DhxMobhRcqTunrq5X0Ni/QVt/1gH9WBhWl6fQsYimc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 12:25:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 12:25:42 +0000
Date: Wed, 24 Apr 2024 08:25:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himanshu Somaiya <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <Zij6Qh1rvGTOG3e6@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
 <20240423221817.1285081-3-rodrigo.vivi@intel.com>
 <05145d94-73f4-4448-9ec7-db9f06f68a07@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <05145d94-73f4-4448-9ec7-db9f06f68a07@intel.com>
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: dba91bdf-88b7-4817-9bcb-08dc6459a846
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vID+Uo7i5jKAmL1ovGMuQYPmMKF2oatiOCH+S345oGyHd2c4IwXxDkJJ7xZB?=
 =?us-ascii?Q?qJlBNZiAT/nyU4AXyUpNsHuEcRQy0IT+L4LVIF9+EO4/T1gYtrpxyiFeKAbQ?=
 =?us-ascii?Q?OglIHJYhhC0vnip67IkdzzlsESvzilNlS11yG2kyfE+tljYWCkjRmw4kELJ5?=
 =?us-ascii?Q?tVPwI3kRLhUIl+Tgn3h74gG4K1FOWyI62jpJ/j4eKh09FyQGNvszo8tIQerE?=
 =?us-ascii?Q?R/vuuQPijpZ8GWiu5SAqCmzuVvMvoZsvO25oh0UDebmYUBVO1x8DxyFHlc9V?=
 =?us-ascii?Q?zksNs9Ba2rk26XBoyon1Cdw+gDGx5Z05MKyYsOWI0RTI8ebpb4CNOtCAfrCB?=
 =?us-ascii?Q?3tUDDuSPZ6NdUmSYvUonFYQSBbqgiOXFaPvEfl/oWwJGOgyQRq03Mmvx8nE1?=
 =?us-ascii?Q?Y8cK4N+PKSJQHea8T5RedgxzMn9iYCr4KrAfrMam/j3xmZN8teJDMjEW3ecr?=
 =?us-ascii?Q?RYDkbgauojLO8n1O9AuMLUfRJU60e+VV+6aetOlC2YxVGZgzjACQ8+bQ2PLl?=
 =?us-ascii?Q?c9z5AEAOIYX6DtXfyclrAEMN+Xeo3uMs1n90wZpgYgDW8H8tRvXmQg9u0ps2?=
 =?us-ascii?Q?/dh8F2pfyvkvLr0Epo5VxHXK2pLbLCkdrRECje5ylLMPZFpAr1zF+lCZVE6J?=
 =?us-ascii?Q?LllPgOIAOw/KYwwXwVDBeNFIStFpCZA+WHc/yuVmyPzc9pI8/AJTTSEFNhPM?=
 =?us-ascii?Q?4vjrtPjA8CmapgiZ1mzfkfq1A7zt+SC7XKuESX+zO6Zq5sB6ZCRIctFbYOhZ?=
 =?us-ascii?Q?wd4povxuNkbKj99AZsxytOwkhvEY61wKTa4vflyOk4mdXgT43difP0FWm6BI?=
 =?us-ascii?Q?NFWKKT/0auuLE5PAWsqJ0fmSrUjQqdEk/zAIVuYKSWLc+eClT7mnHfr1qVkS?=
 =?us-ascii?Q?QOH3x53KTF6UB8/fwHLPZRre9iwhlefKMtD8plmSApl7kc38xAfX6I5UjnTW?=
 =?us-ascii?Q?IWeXvue9PSPf6+djJguQRVZwZwVXPSPFbESpf4ZSqngsLSR5LAq0+NB90w4n?=
 =?us-ascii?Q?ZflCd+vJinA8ICxw6Q3XD9plVxERy4gX3hKey2fllyKWgGvokDMpn4NtAMcI?=
 =?us-ascii?Q?hfDZM4LhFPBg85PAGpzd8z+MhPUJLKeYFwZY9SLbbJHrtBCcnr89fTM/+Qzu?=
 =?us-ascii?Q?XPpwcOqwHgcEiDeu1imfJCfukRTzLVuZQykdBTuVusxFcgfymh7N/qVEhOkM?=
 =?us-ascii?Q?l4gqKqNH9YtDwp05QF37QzbMXArb7mkMaNtVB06IBlskFAeWA45yKJAJDww?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0nxXrTVDSq3LNdOYvvQFT9g/OC0F48P1Gh37xxemyNuBjsEmu0HDj4+HCh0H?=
 =?us-ascii?Q?JEh0Fr2NYuDOddV0FUIWDn7t5eJaDoKcjbfbRNo6u50ASrIBXFGrChl6w1eh?=
 =?us-ascii?Q?eW4R9mhTZ9ilU/YGgy0XRJ3oPgo+PG2/ClKmFr9PHt6bEgpjpHS43+CRf/BS?=
 =?us-ascii?Q?whBpGUPST6ohdETQsFQQ78eCvwcRplaMhMlFs3Ffth7rXG7trBtgosLlw6ic?=
 =?us-ascii?Q?VSHaoSheGddxK8H2UUwGLZB+QwFk9dgpuQZcBFc6Fz4QkbDw7arAp+GMntnx?=
 =?us-ascii?Q?R3rdV8POuBe+KaWC0WKYlJ3ST+PMSNJWQHwFO4CUiE4fO+9rUyymn9uznHF/?=
 =?us-ascii?Q?rvjfvHei8ODxMdAiJY6ZYpSpI9wHsY0EIwe31JPkyVWndIXZsmuq6UEu3kcf?=
 =?us-ascii?Q?fIVLcaApeg/hpCOjfCKZduSRmRhbWKUHPdem2LdznQTxDsmT3QhhwbY2j4mb?=
 =?us-ascii?Q?ubk7nWLuqVWzO2I3YG7aiGYJPVpBN3t5e5lj8bkomEGqF8sWh2ygNglnwkLB?=
 =?us-ascii?Q?YQnMCyCNwCoINhtqm5B383wpCO1+JGN3hM2cbazVCzfIDr4/3XsMSlVCRpss?=
 =?us-ascii?Q?Lbo6IP5BHy+wOt7Cm6beSqKlNq25VJOgIHCAkudjZwmuLy6w+G3ogLb53xkF?=
 =?us-ascii?Q?THqwevLi2wvv2wC2uFR7QSnV+SxNN/VdAb9BU2CxN/gp7jUfHj7wACdyyNX6?=
 =?us-ascii?Q?jgUHCP5ZfN23DX+Z7McUiyd5EbWUIJxcNShzaQ6h0BlyeaxplvnkSqye6XkP?=
 =?us-ascii?Q?AENhWLzNT4NFkEnh0uEFF7mqehTydTqYOxqQ2c3uBAFsy1mRNlx0jXDpkITU?=
 =?us-ascii?Q?AL8qQWMSuYTyS/vCyYNprFYcTfr+oH0/EtWkPRIgrAvVjddrmbiFEpZvg1cl?=
 =?us-ascii?Q?CQzf9oE2yjQx5XvLWWAlaV6SaSuq0RmtywdfXPr2yEJEX0TYzQScUt6QzlwK?=
 =?us-ascii?Q?0djC9VO8B6E8mVkFN1achsX02PxV6CLtzq57sb7o5uN1+PFCKn/eBnUZqrIv?=
 =?us-ascii?Q?5Em5fpkGjK1aek3PKC806VyAQrV7M4odrumsdCP+I/Hgit2tX5hdBESF2VdH?=
 =?us-ascii?Q?yDxC1Gla9xSWL5imzWE4iUIpV63by96zGQUJ+YbFrk/ntZ6goE2aLAocYMIS?=
 =?us-ascii?Q?TmzrIr2zdph+sLUfeYuUf+ltxodfUyJ2LunRh8m4QQKqsWBFdEwkaI5cjmRG?=
 =?us-ascii?Q?PJoVuKJ8nrm21n4eC3gVFG7l/4PDrqzTYGdhnW1BcnzKpJRbMVxalgGlY2vF?=
 =?us-ascii?Q?sQTd6ABsq72xyiVIczgb/fUWUE7QF30XW+GrAo+Mg2n5Nc4CwfIQLCczhjCd?=
 =?us-ascii?Q?EgoG4zy5IFqCSzOap/nc/q6g2UGR5VOZGfKi5L0Tu3GX6jKzQLNvSAB8NnTQ?=
 =?us-ascii?Q?x5zuC0RYhIdlpVFQQikGLEMw38wgQYMFRlLe8fQwd9VdbfCqSMtNP3TaPIwm?=
 =?us-ascii?Q?eiekV1YBkMBL1kKwdYzLsjaxXCh6FKREl7SR1K2cijF2iPy/BdpYVt/WTDpq?=
 =?us-ascii?Q?ulxG6tBltbw6KAPk3HbyobUKOo/8S+ggcf8e6lsTC6iUl967GhP2N0rEKHu7?=
 =?us-ascii?Q?70IyaqkSelg/9HwyoQUTJ/esL1Afx34/q7nFk5FkQrpy+dA0jUBZYWFO+A/h?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dba91bdf-88b7-4817-9bcb-08dc6459a846
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 12:25:41.9633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iGHegzrIA9Ao+LHjEvppStHxS/9oP90dlNzAtvjC4q79dAC3fOVQVYIwW294PquS0yUD3K28rWQX8x/24muKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

On Wed, Apr 24, 2024 at 08:50:45AM +0530, Ghimiray, Himal Prasad wrote:
>                                                                                 
>    Hi Rodrigo,                                                                  
>                                                                                 
>    The debugfs entry introduced in [PATCH 4/4] of the series offers the same    
>    functionality as the modparams provided. Do you perceive any additional      
>    value in using this modparam?                                                
>                                                                                 
>    The behavior of loading the module without using modparams and setting       
>    debugfs mode to 2 before executing the workload is identical to loading      
>    the driver module with the modparam xe_modparam.wedged_mode = 2.             

yes, they are.
But there are situations where the hang could be happening at boot time.
That's what the modparam is for. SV teams wouldn't have a way to debug
the hangs on boot. But in general the debugfs is enough for most of the
cases and better because it is per device and not for all devices driven
by the module.

>                                                                                 
>    BR                                                                           
>                                                                                 
>    Himal                                                                        
>                                                                                 
>     struct init_funcs {                                                         
>            int (*init)(void);                                                   
>            void (*exit)(void);                                                  
>    diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h 
>    index b369984f08ec..61a0d28a28c8 100644                                      
>    --- a/drivers/gpu/drm/xe/xe_module.h                                         
>    +++ b/drivers/gpu/drm/xe/xe_module.h                                         
>    @@ -21,6 +21,7 @@ struct xe_modparam {                                       
>     #ifdef CONFIG_PCI_IOV                                                       
>            unsigned int max_vfs;                                                
>     #endif                                                                      
>    +       int wedged_mode;                                                     
>     };                                                                          
>                                                                                 
>     extern struct xe_modparam xe_modparam;                                      
> 
> References
> 
>    Visible links
>    1. mailto:matthew.brost@intel.com
>    2. mailto:dhirschfeld@habana.ai
>    3. mailto:lucas.demarchi@intel.com
>    4. mailto:alan.previn.teres.alexis@intel.com
>    5. mailto:himanshu.somaiya@intel.com
>    6. mailto:lucas.demarchi@intel.com
>    7. mailto:rodrigo.vivi@intel.com
>    8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n
>    9. https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n
