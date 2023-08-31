Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC3CC83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 17:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D363D10E6AE;
	Thu, 31 Aug 2023 17:15:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063DE10E6A6;
 Thu, 31 Aug 2023 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693502110; x=1725038110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=97upQnxcMKzQj72BKQWA+3JZFSQ2q3wS+RncWWwJ+WI=;
 b=Vh0mPTiEJVUF20uXLToUMvxYOvZ8QSrwxRbJRvwP2EeYS5MOlMp91m2+
 4wNXD3y0KE+hjYBsTftmiFsXbtFbHm3ZlZ/Ck2DLw7TMsZkxQFHlWZ29H
 K4OFrh7l06naC4+eQ+qw74B4Q76HUzDi0V7/fm1UMgLNaAD/Agx6OVe8a
 IW4AxggswnXUQQ3ggPwdczPred8vamvRdcw9xQDD5VV9pWWLp31jbIDwV
 ws3rfYYw4SVqIKCmn0WYzFnl6fEQoRXLeGSGl9KmxuCk69Vp9TsIw2KiP
 BA9OiPJfUvqKuFDICcFsLBMI80y9gx7hy+kMm0z5FCh9RrBDCv46QSWhX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356323342"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="356323342"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805088431"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="805088431"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:15:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:15:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:15:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:15:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYx8QDMv51kzq0Td14E2f5PcY7eZ8yP4Gq2INooIF5ok2tEgpyZHHJJfSTrGTrL+Fls6etjvRXrn3UYbUPv/qgKeTREKXCTG43TsTJk0mDPVxDrQFzm1F9U+oN4m8iRl20mECSHey7UIY0d3Dr9BAS+HgtSnMJAF3Ao+InycW1MjY8kDOLRPaVg8O9GyHucZH1F+T4SQ4zvUx0MUUT/iNzdPiV6UBQQvxD33h9jBc13oKs6qmqlZxSG3gWrzGsRLNr9yVnxhm3OFm2Spdi2k4iQ643NoUeEHhOloYDPiM/BPFAVkyFNLsR7oiDG7CJMMs+aywh4MN+eNTGNXJA/3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4LvtlLthuHbb4S0htpZSS9qmtURV1OuVJbudXMjgnA=;
 b=G7OeROcXbCWhyYdoljYpv9HM/ZypRR63diLvp0L9UXrqhxXCpra1H83pm/y1YIrfjiwW3XUiUxaBXGOt6HBdUSmKceZxybiLVd79rHhjON24hj4tCuHPVtNIXp2NHdH1kgSSQVKGzu+zVoobzq0jMIlki+E//P8GzTqCR3tOTCn5cRNHQWf1TDvGTqWcxHcGUBJOSEo2f09MakZonbMehbhkDN6QQs4HxXG8cn3BhowFWk7emlKdbMhRWDsfIyM9hGmkdgmnEwVuItFUMzhLVXYj4PSDzzKOutQjQv5hH1R0FiUxO/ukjONVLdMUVaQ73q/4WArNXXoOCh4yTd7Wyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN9PR11MB5545.namprd11.prod.outlook.com (2603:10b6:408:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 17:15:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 17:15:06 +0000
Date: Thu, 31 Aug 2023 10:15:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Message-ID: <20230831171503.GA2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-3-lucas.demarchi@intel.com>
 <ZPA3tuQCuZkPKntS@bvivekan-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPA3tuQCuZkPKntS@bvivekan-mobl>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN9PR11MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: 649d3b49-5c67-4621-4e40-08dbaa45d25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhuDM/abrRK/KpJWEp6nzj6oWNWRiEiEqWIzutYfCuraIlITwPIUjRH2ldLbN+o83W+ZvizG9gA6aLcL4gEj/XszzeDgVQYI1aWWcTVnsM5tSgO88+H2O/03rQwAdT1K+/CRh0akqbvvlmQuR3BXWfLLRgGxL/LnfQn2KSZj5UHOS3Ik4sK8N8Jte3AFHWGgPMg/8WHI0+rz4vTmvjTBe9IkAZbddkWI+TbxbXk1FKf9oSfP8wWwd9EqRFNqeUcYt57PIk5tbaVrGs530sap3jr8wwdNU3orXBwqRWw9mkgFDBUkaL9yfWIPV9YjSsxd1cgXItoFkAze+E8bqmkLijv0SYa4fq+VzSvTbz20UymYKhH61SwuzqQ2QoHOFmjUHvclMAzBBjVlzdFOyCPdGg+Nv+peBd3OE5/3CFk/6qYoVI1WgvK/qo9kIjUhdmSn/7O4Kpk41AxCVmW6T3GrY4PbOPp4zvo9my3jwwPlNc8gaAwQPPnBp/fWQLt8xIvF4swvQwc7X4rDXPy6LX9ubmTFZIvZJmK3MnlMTxO57zG6PogcfTC4DRSyDS/8Y7G/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(6512007)(6666004)(6506007)(6486002)(82960400001)(33656002)(38100700002)(86362001)(1076003)(107886003)(2906002)(26005)(53546011)(83380400001)(478600001)(4326008)(8936002)(8676002)(6862004)(66946007)(54906003)(5660300002)(450100002)(66556008)(6636002)(41300700001)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCPy8frndD4so1qy8iQW/c8ht3K5/i3rvJIS0Rn/yD74Gf/5sNGDU1L4xKfe?=
 =?us-ascii?Q?J+xecOM5V9olNs6oMnOeNGAsyVhyC4J7DMIGK8kdCWrmpCijOByFOFevsjLH?=
 =?us-ascii?Q?qi1AspxClcH9DbxkH5lzpjaxKsyf0O8poN7j4UOmSpkVH/ZfoFlm7yOsVnqT?=
 =?us-ascii?Q?2eBQrp7My1oJ6Kf5/gPOSgntsfi9DcIBUgYNWFBLBlvdT1HWK5wCmtlZYPpw?=
 =?us-ascii?Q?5LWSBlRTYSLoAnna6JL8yn2nMbU42U0i+KqRHvZdGCqsZjIPjeZ1mAV1DAOO?=
 =?us-ascii?Q?rZCbuz6rnoJR7dhzyfVkp+q20WhyLwOXypaf8kMdsQ6gpC5bR6B4C1NzuffH?=
 =?us-ascii?Q?ppukFEi8YPAyNcxmR3PwrFpJnWEwO+5V6szKmUjVtiMBfwR33icKwItQrN1g?=
 =?us-ascii?Q?JkMLZ0qznUV6QWIqu+sAemzsqOLDE+tMVmEZTGR6Fg5EociWeEGmpKPzpZza?=
 =?us-ascii?Q?5l08ZQ/Czxvbj3n+a7cK2Zgxkt7oUpi325T3Rk8eNXquUT7k1XqPf3jZRWfP?=
 =?us-ascii?Q?ChI/jHVyZlZjqBo29cph3q9CW/uJiDYTTbWlXQKgeL29pMzN7U+nVvD0IGza?=
 =?us-ascii?Q?vKh1OxfE+N7XQhR/af712TJGl9W9Gg1oAgJl0K7Jgj3Ii+o5gEbrFY5YKp7R?=
 =?us-ascii?Q?m5MzH9choVIZfDNrWLFvHxymd8qxfURAh+LPHWbiU8nYhFszcOOvSDiaQkQ7?=
 =?us-ascii?Q?3kqbuLzNWbkWmHiZXy3uo9PAWrsriLJ2FAtAeraACPLgZ20wCLueoRpMQmML?=
 =?us-ascii?Q?wf1i0xpKQn59FIBZ4X91Aycn4Tlb1MKnhhNXmz9k3z+peK7cwYe4K0WK4K5H?=
 =?us-ascii?Q?zEvYV0FZ2Tecx5hANCiBZHD8lxGZGjv1EhGEva7/8f6T3jdy8970Nv8vXIE2?=
 =?us-ascii?Q?vjvraIFYocK5/mbU71r9vt+ttnkshecWOJcqXPiwLKUTlCNDaJm+E7FbbhMe?=
 =?us-ascii?Q?v2Gi/KjdrhZHIAFL0lLpcsOVW35dIcmhFuYsratU0Vcd9+lwofhwJFSwauTo?=
 =?us-ascii?Q?ILgu9tEQAsvTV+Yqghe0rqactOyDGGozjVvxRwPnbPdP8VBMsME6hUyxGhT1?=
 =?us-ascii?Q?Pnw9rU2pAXLNtKLQLOTxjgqAd1HvKdUNfkBXwm/oNuqC7MeUVtDf1TfXobC3?=
 =?us-ascii?Q?YQrROcSiPsQRkGAVaH6IbQsY6O2D49dTRfllwIdSVHaRteI9BMBvbHVjndOs?=
 =?us-ascii?Q?f4GJhzkuOSefRuWqgEL5I5KeRxUY9Eb+8Jp40DC+fy3puuIZGCKKVNvMWO7q?=
 =?us-ascii?Q?5xaqzBHdRuk32MLjhkVW0vgqY7GvsULgkTVlZLbLyl1kA6ZEXc5AmaD9RAJL?=
 =?us-ascii?Q?N9gTNaSqnZzWwiav1Qwe12BBE3C9frHjOJjs68rMbD0xBnUKGfFVnDun26js?=
 =?us-ascii?Q?64FOEsB1xr3QNvcpC2IOkXkfxjpO7BxaHgla56jomXa80QD3L7RXBxk21l/G?=
 =?us-ascii?Q?DBpXpNxiK3BpdIVdAwBFLtRr+ORQ1KFJPfURVE0m0r8/1nLsoYeH3dUGcjHL?=
 =?us-ascii?Q?S3fMGJ90RTY2mAqf1L5aulhqmVEo5OjDo0xR5eBSwi93g1C2/13Qpl0GgmWY?=
 =?us-ascii?Q?Ovjf7nukBOWn0LrIylknytC39/VkBA1z5NwLToB2ACS7sTOrnGemPEcTrU5h?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 649d3b49-5c67-4621-4e40-08dbaa45d25d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:15:06.3246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frwm86OxzQH1NbMNZd6QSiKr8T2XcBrU5VbBERPdZWJiD0Kn+RUB4KcnnWnim4C4Dyhwm6pIcPICLY3U54zcO5dAZJ69K3kMulEtsyAUBnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5545
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH igt 2/4] lib/intel_chipset: Add Lunar Lake
 support
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
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 12:18:22PM +0530, Balasubramani Vivekanandan wrote:
> On 29.08.2023 07:11, Lucas De Marchi wrote:
> > Add basic definition for the Lunar Lake platform. This uses the PCI ID
> > from the xe_pciids.h which has a macro in a slighlty different form.
> > 
> > Going forward we could also trim down a little bit the the info struct
> > like was done in the kernel, relying on gmdid and IP version checks.
> > This is left for later.
> > 
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  lib/intel_chipset.h     |  5 +++++
> >  lib/intel_device_info.c | 12 ++++++++++++
> >  2 files changed, 17 insertions(+)
> > 
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index 84cf1799e..52b15ccea 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -46,6 +46,7 @@ struct intel_device_info {
> >  	bool has_4tile : 1;
> >  	bool has_flatccs : 1;
> >  	bool has_oam : 1;
> > +	bool has_gmdid : 1;
> >  	bool is_mobile : 1;
> >  	bool is_whitney : 1;
> >  	bool is_almador : 1;
> > @@ -90,6 +91,7 @@ struct intel_device_info {
> >  	bool is_alderlake_n : 1;
> >  	bool is_meteorlake : 1;
> >  	bool is_pontevecchio : 1;
> > +	bool is_lunarlake : 1;
> >  	const struct intel_cmds_info *cmds_info;
> >  	const char *codename;
> >  };
> > @@ -203,6 +205,7 @@ void intel_check_pch(void);
> >  #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
> >  #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
> >  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
> > +#define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> >  
> >  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> >  #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> > @@ -236,4 +239,6 @@ void intel_check_pch(void);
> >  
> >  #define HAS_OAM(devid)		(intel_get_device_info(devid)->has_oam)
> >  
> > +#define HAS_GMDID(devid)	(intel_get_device_info(devid)->has_gmdid)
> > +
> >  #endif /* _INTEL_CHIPSET_H */
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index 5d53d2906..86a8b3650 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -504,6 +504,16 @@ static const struct intel_device_info intel_pontevecchio_info = {
> >  	.cmds_info = &gen12_pvc_cmds_info,
> >  };
> >  
> > +static const struct intel_device_info intel_lunarlake_info = {
> > +	.graphics_ver = 20,
> > +	.graphics_rel = 4,
> > +	.display_ver = 20,
> > +	.has_4tile = true,
> > +	.has_gmdid = true,
> 
> has_gmdid should be set true even for Meteorlake. If not in this patch,
> in a follow up.

Yeah, we probably shouldn't even be introducing has_gmdid / HAS_GMDID in
this patch since it isn't used anywhere yet (and since userspace doesn't
have any interface to query the GMD_ID values from yet).  That support
should probably come in a separate series, and be paired with XeKMD
changes that allow userspace to access those values.


Matt

> 
> Regards,
> Bala
> 
> > +	.is_lunarlake = true,
> > +	.codename = "lunarlake"
> > +};
> > +
> >  static const struct pci_id_match intel_device_match[] = {
> >  	INTEL_I810_IDS(&intel_i810_info),
> >  	INTEL_I815_IDS(&intel_i815_info),
> > @@ -607,6 +617,8 @@ static const struct pci_id_match intel_device_match[] = {
> >  
> >  	INTEL_PVC_IDS(&intel_pontevecchio_info),
> >  
> > +	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
> > +
> >  	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
> >  };
> >  
> > -- 
> > 2.40.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
