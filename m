Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33CDC04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D6D10E541;
	Wed, 20 Sep 2023 19:16:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3287610E53E;
 Wed, 20 Sep 2023 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695237368; x=1726773368;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wbU6q1wAEFAhzSKyQRLyyrXDEIyI942tZERW8VlgKwE=;
 b=Cv99Mag6TK9YVTtNzF+qzWaOlskYK4lgUeBsTQcTJ09yYvJjNiNIKosZ
 8Hlyb9mR0Io4tUSp04pR/UKzjSRin20iYnoNhhvD+LJvD4te69BysQ913
 j8jMXKOG3yZH7+Icm3JKx0DvRxbp+3spwGrYPvHwJx82J00VoDLDFZwnr
 LU4mizDQBF/z7kEx2J8uZ0svpEwjNL0j7oq8TtCIOUj+950nqTwQuC0dr
 LovjFNS7pWonyjg+Iti6rU9M3WhSgQjjnpAKuYQlRBesFoV+YeCazrKtA
 1neWcBH60HilLY/ehu0yZoBdC5l5QXdQnRWO2ieIz6EeCoPmG/zRK6Snp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379197525"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="379197525"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="723437601"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="723437601"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:15:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:15:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:15:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:15:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ogf9OWeiuT2LaRBuHmSJ/l2vCJuuGbMoysQ2h1j36/3cLtKsZ51N5eoyv87Zm6fFNIb+EbpP4j+TyonNy5hB9WGWSmcaglDJYq9bOhDph6ZJ2/j4J+2qW9PgyLjskCz3jXb1wq+QbD54daXsLKvvgBSTyojdlcHeZmAWLoql/z35Lvj9q6ycp9m1b6v5SVZjjEXRp4B3w7W6/ReEj9mNx7VM44sZtO4JB2VNYgyWqvzDi1JFbHBm4xotvDCCTtbSYRvkpLrFmmmVfH59sONIfPvm7XC7hANlcFh40ojfUFEOCVXRkpVhGRTJMYbJ/l9HdJ0fZjrhhlw5KA7LA343eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dk8j76ISwvatuFI/eo0U8E48Vxb4ObegECoRE+D7W8o=;
 b=T7O3j/+YXMPsk1Su96kmhMQXKekL+E4BQCoa19f/jQZNObN9GjOOCLJMocgL14VGKh4eSzNg+UgGQq3xLFpdixIinrgLUMP4gAp841qrdz8yFy3ARvTPOaOQvGhr0v+tNqBa2gxquiFp+9BzqqktCv+z4rqqQfc/soNn6eAr6bIYMsB9bNldgnns4shh+vGJx9afgYFB7IXNMD/9M0hJhsCWT+euOawJgggfZGwB1WXDCoknuNgoRCk89Q7ALkVBEE6nHYgdd8Iu8yoT/bbURoan5hMTysJwbgHdTb70FiSUyZNnI/O7KJGsXA3ShJ668BaCxMYGIJDc764v1fm+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 20 Sep
 2023 19:15:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:15:51 +0000
Date: Wed, 20 Sep 2023 15:15:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Message-ID: <ZQtE4nWJjuk2uPPK@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
 <20230919142000.91363-2-rodrigo.vivi@intel.com>
 <50978871-5bf8-aa65-d6a9-c4dcd20e3a03@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50978871-5bf8-aa65-d6a9-c4dcd20e3a03@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: a4850f72-e29c-4cc1-8d17-08dbba0e00f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEhdb//QVP6jgsVIuF9qTca69797SoQADORoIKZtnDvh9FQqKVsXg34k+KFKkFeyoGKzY4E0G8aAR7qBebWPcAxZt/j1GPYBO6/sakJNlysnRT1DOVdDoCDuz+2CIblxgZEVrwEC2z+YdD2S/Cxho3fwlbEuGe0cQOOrYrAFO+4sgCsiMROgjs3wcC2kfRmADImAd2dJ4RvPSpMNpekhaC80pyiLSFh6LwEhWAfPpZjK5cpLI1MQcVeIlUQ2vxadgSdvkszRAQ38HEBhwWo7ylgNpROUusbbYPlgnqq9gSgun3lGcpyCPqXd3glINLh9CwIcIpTOD71qG5Z9T3li/kFbB1NaSM4WwtSbAKeZ3+TwG0CdV2hU01RwLngY+QbAqcRanfIBCyN7PSASLM6fJKcI22aywuaONAtX9oxTUnHro4hy3Dmyyw2Z249Cl9WL7Bg774LSykAFK8N+Xmlt1mhDQGfWhVbuAG2szrMua0P/aXsNuRVbERnVjUtk+EkbhON//UogXR+SYoRiSKkUZjGIHicf5L5qFtm/xO4EamP+6uML0wsxo89tfq0mDqXL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199024)(186009)(1800799009)(6506007)(6486002)(6512007)(6666004)(53546011)(83380400001)(82960400001)(86362001)(2616005)(36756003)(41300700001)(26005)(2906002)(38100700002)(316002)(5660300002)(8676002)(478600001)(6916009)(8936002)(4326008)(66476007)(66556008)(66946007)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?osVv+3EpUtke3STvyuDiKtCfBuJhHMgiQb6VsyIlLESNAZTb/0GCLFdJXi?=
 =?iso-8859-1?Q?97DEjwgd5gke66+84neqkpa8VPZOSK7WGpfmNAw+lrI2i8A/tGRper4kPe?=
 =?iso-8859-1?Q?v6ZLf0bHDbpY97ouVIcfn6KH95qI/oRft7SPHy4q0VqA/IP0WRSFNFMII1?=
 =?iso-8859-1?Q?0C70H6IX8PI+id4kLVqNtm05EOEAYWrnxFUIvz7RYfMe3/6byCfZPSe0gx?=
 =?iso-8859-1?Q?Wze7N1Ly4oa0rFoJh+1FCjozq5incDn+bKsirdFW/sOBCXHXTfkAJJXLno?=
 =?iso-8859-1?Q?iREkEqPqKUeDiFJVqcTX8xaSLdq/LZCJTMQTFEpWItb1TzMC5bbpsIAnD/?=
 =?iso-8859-1?Q?2wpIv7mNV2dUYY9ZJ5PQicgDmQcy7/eAdOQR2bidOGqepXvEfHoEmtF8c5?=
 =?iso-8859-1?Q?2GlArDJTKLFsPyVd0qVNOKEuhIjDTw6zcCKDdB8nxJQZXEXYGXwWUizRjT?=
 =?iso-8859-1?Q?DFqk3QIvtH1/ilc9RwT8sk4axwTaEeQmRy2kfX/8RhLNgx6CePVuRo4uhW?=
 =?iso-8859-1?Q?KYc+HZPq+yEj/BmDpGoAu7FAr9ZY9X8p+mbOkz72wIWXlHFSNf7YntVoqp?=
 =?iso-8859-1?Q?Vdr8oqtd1OB5vB8lH8B5VLpyAKyrt/cB8kSPKoVEwgJJWNsu35l0jkEkc1?=
 =?iso-8859-1?Q?vT1sbc9s8AZB8FMslpiDyrVKKmDF3QkFazXVPaZ9zKnRx1nqMQlKUQSTDZ?=
 =?iso-8859-1?Q?+1Bbq1YXeME32xrroztR+S41XFV+z00RlrAOXvSApF5PweEv+X1Xthkb2b?=
 =?iso-8859-1?Q?SLO9K1YKJrLp5IeyiOR4QZ8EFsDP75pXfvOgBaOUm4WgZncj+c4MQkZgIw?=
 =?iso-8859-1?Q?u103i0Q5+yvzbjAMzIj+N9LsREqllZyphCiUBT32KAIxfx0HKzwAY9jOf4?=
 =?iso-8859-1?Q?Uvv8UYBZamsVplfFxPbRfjLaTPuiI/CjTaz+gry90js6nTWPCFSyTnuCgF?=
 =?iso-8859-1?Q?5NDz1BseN4GsEEeBgvWt611A2jwoR3glOWQOxS581L6rdE2B4qaAiPH654?=
 =?iso-8859-1?Q?oCo0W+2lYGm6437dKG5ZJrv0W9wpGTIv+g/YtMapb4nbE5ny5hv0iwHL94?=
 =?iso-8859-1?Q?a6A2qfcG7/IamopWFWK/7IQxhX73FI5T4HjGUHKx626hdzVDrw3EjTs74i?=
 =?iso-8859-1?Q?HkVQ162Pb+4I+QsC/QbTl5fV4KH9InkZNZR++m1jIB/J3EzgRNGjDHNUev?=
 =?iso-8859-1?Q?6B6pai6EObXtfpcQzNdxHET3QN6k6Ycl+k3SFFNd9uK4VzLAF0jTZtLNTq?=
 =?iso-8859-1?Q?gbEU4pXaThiH/sjscwYjW86qUICW9gU2Q9CVg+rwoUZgj5eDl5TMWQjUPk?=
 =?iso-8859-1?Q?l1Z30vxKmlAdaBa2m44fwPrVVHJibIaFEdDq2pvBnN2pHptgr0NO54PKBt?=
 =?iso-8859-1?Q?tnfgV4iiqUtlHJ+hKb8vAyKzTSCLRV40u7fT+57zRpRxKQuRNjksQ9H8ue?=
 =?iso-8859-1?Q?lM4hu8uExLgKHo8fo0iZGjRfV5rcAq5KiAItLIzYkqFGzyMbg7FykJhWXt?=
 =?iso-8859-1?Q?0uSs4rhe7/r6xM2bCRG33MIQqLqdopvRa2SAA7Xn7Wc3RVtGA+ZKukma1m?=
 =?iso-8859-1?Q?PZq82vdcrVK643B+SpzgHXMIUjh5npcnFdCGK2L0M0YjPI+bmNCYTok6Y0?=
 =?iso-8859-1?Q?uebeHF5NTuIUHedlKucAWkcSFtELcAd4cx0jC7nH1IKjLS4gq6y2eR6A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4850f72-e29c-4cc1-8d17-08dbba0e00f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:15:51.4778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akhRjWGy+Ic1fOgshEV1shTbaJVPxJhchGnJwpsJVel9KpwK+cazb/Y5YuEb95xhwuBvoYv6DyVeSuVX5OFtDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 01/16] drm-uapi/xe_drm: Align with new
 PMU interface
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
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 01:58:57PM +0530, Aravind Iddamsetty wrote:
> 
> On 19/09/23 19:49, Rodrigo Vivi wrote:
> 
> Hi Rodrigo,
> 
> can  you please pick the latest header xe_drm.h I did a small fix for comment.

sure. I got it locally here. will be in the next revision.

> 
> Thanks,
> Aravind.
> > Align with commit ("drm/xe/pmu: Enable PMU interface")
> >
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  include/drm-uapi/xe_drm.h | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 804c02270..6aaa8517c 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -1053,6 +1053,44 @@ struct drm_xe_vm_madvise {
> >  	__u64 reserved[2];
> >  };
> >  
> > +/**
> > + * XE PMU event config IDs
> > + *
> > + * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
> > + * as part of perf_event_open syscall to read a particular event.
> > + *
> > + * For example to open the XE_PMU_INTERRUPTS(0):
> > + *
> > + * .. code-block:: C
> > + *	struct perf_event_attr attr;
> > + *	long long count;
> > + *	int cpu = 0;
> > + *	int fd;
> > + *
> > + *	memset(&attr, 0, sizeof(struct perf_event_attr));
> > + *	attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_56_00.0/type
> > + *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> > + *	attr.use_clockid = 1;
> > + *	attr.clockid = CLOCK_MONOTONIC;
> > + *	attr.config = XE_PMU_INTERRUPTS(0);
> > + *
> > + *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
> > + */
> > +
> > +/*
> > + * Top bits of every counter are GT id.
> > + */
> > +#define __XE_PMU_GT_SHIFT (56)
> > +
> > +#define ___XE_PMU_OTHER(gt, x) \
> > +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> > +
> > +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> > +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> > +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> > +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> > +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
