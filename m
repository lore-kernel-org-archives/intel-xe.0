Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB399CA0EEF
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 14:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E3010E41E;
	Tue, 12 Sep 2023 14:34:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4594E10E41B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694529291; x=1726065291;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o04vW1BWsIRIaFN4bsyUxU/DmonVx1ZpbsPDWnvtrpk=;
 b=au2P38kq3ZKRseei/MdpmJotiCaYyBvs1PXsjmqooMagBjN3WUUYhSSg
 B1Rldr9NBgW+ifqqzgq3bhKED12DCB1uu9Mw7HeIz6bbGBpu6NqN4xwvl
 790pLsSZqXKWCGnYY3/E82axRxIk3plZpr3yaDbud5uvCd+QqaIukkBOT
 ZGCv6LKfVldBwhNXhognEeNCvVu5kAjb4VaExdpqKyigByjsZE4g3oDks
 zcnW0T9g3xK2tW0xojHoCUck9S6WXbH4neTswrZqWqIVnm4DjCGMsHVov
 71ixRmPSV/SxI7UOZV+Ny+tsDBshlXTfV8CiPScYl7UY9nTt7DXErCFrn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="358667038"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="358667038"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867410734"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="867410734"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:34:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:34:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:34:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLc5iF/R019P2eKZHt/344eWr3UiPBEx4d2l6fUu8r7Vv8+hOejCtBZOCksjNSho7kpZJZltKxla3QPhmKn3uMj8kAX4K8AWAjddG6+y9/UBTMAS9+KoqmHIjQF2GQYvnJ3zD9Jw7s/oFgBTDlpnhEM8OUpe/6TEULlyxB+gdr5A7Op1zZoZ+4bb0gv6LBACe8RrqRRyqRjfSGmfs45KpOxwBD4GcENdWJXMUd43BdjImOdgeo+fP/0Yww76bR6y3Q74EBv45tXxjbZJ462TfFwyVQwyjNhflJunaPpb4RFVJ/bbxtkQ02RJHZbI1eGVsm7MCzJSEUTIg0DvDM46ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g6yfxaUmXg0rsxPyyrSgzmYUITPtvLY7vKl1hktaDk=;
 b=EFQjpJB7p8Tn0xnIi3yjn9W2/HAHPpK59VR0VkDEmA/LEDxFySM/YZaTIYHe6ZBCd5eiJouGsEkfdxAUWsHFdutJbzmihqoK3oRyBkcREydisKB88zCIjooCtyglLOP/f4k4vPz8OT3HSJJD8GFNK5TA13ot0HcxH1cg3ZjNhgre0xSQpxQh1euTpivYCoa3TnKse5taP7RgnmYzeTNFOfIOeaB2rHNDDCJpzVivlH5a3e4L/XRAuDNGk5qOOXr56UoZimWyVjRXDXKlGaJf8IqJSt6oVvXp1tJHftUS9rIvW3ilGC42Wntz+ynuq4KOp71BSURLao2BUHi6Vp37mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 14:34:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 14:34:42 +0000
Date: Tue, 12 Sep 2023 10:34:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Message-ID: <ZQB2/aa1CqeMywjI@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-3-sujaritha.sundaresan@intel.com>
 <ZPJLIlS7K7ey17kL@intel.com>
 <286c8c28-7bb1-f6c6-d8ed-da4875ffa105@intel.com>
 <8656f42b-dbb7-d380-8499-9193e9504347@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8656f42b-dbb7-d380-8499-9193e9504347@intel.com>
X-ClientProxiedBy: MW4PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:303:b9::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f32bee5-7103-4c6c-2bf9-08dbb39d66c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qeGDblcAFD+f2HB1KJtXuKZt/U+8G1gBVcm6jDR/+t4oarXsgD2axiB/Hk+60qxULUDMDAab9IXERrj9vHNdIig7/9iUkGkdXUO+npctFiNdYkaqBJ5GjwF+V1pab+4iY3AvuTD52nufoHehYpLL62G/0obhUIyKWjsLShGNYyLJ/26+OrPa9SB6fk/zdZjmJmbUtJNx/93JFr7wbMMqOnjSMvUYSM/ua1TswUF6zQeTcU0l+J+dqDtDcPAJjMx/9ItpuP+omvOcuoFBscmfU8BCLpdqce+SMQc0xK6pj/8bcssjCWj0sgPJSknLqzs+bSJSDvnylrl/RLxdGh3gNlv1FEWg+v6s/vaWDLnSuKQl/6hCJ7KpqNbvjcE2e2MHFtIIp1e6BPOD7XCzGw0PkqdBsDKj/DSlpi0rubspGyS0ef1k3nKC1eEuZR7b1z9AJSj8x13s30lI3Lv25R/ycTMoU1IeIqN/goj6NcjxMMN9Z8oxLqM2XdKun4qX4VJYqmaO2xenO7Sv559eRVn2rJWTl8CWboyiv9z38woug3add1YNObfjQoa/nL+C0rR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(82960400001)(6506007)(6486002)(6666004)(478600001)(53546011)(2616005)(41300700001)(6636002)(66946007)(8676002)(37006003)(5660300002)(4326008)(38100700002)(66476007)(316002)(8936002)(6862004)(66556008)(26005)(83380400001)(6512007)(86362001)(44832011)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mYWF2UKUhdRAtpGHshYTjmt8Ns2NnsylGUWGSTnlLvDmSsX2z/vhJca2PY?=
 =?iso-8859-1?Q?+9b/dHP3pDz5V5SkCrgejfyamJlTEcre1yRJzyvXOLSjRHhO0PmOzYLyLQ?=
 =?iso-8859-1?Q?UY3LMHlTMdaIGrgk1tZGgkJXP4VHWwvKiQ/K5VLz6OnYyzPt+NGOe+rkSt?=
 =?iso-8859-1?Q?Q1DdlOjoxXODBQSTcB5Q6hspXWm50it/te9mEtSAzbB2JdE3PFTDOodtCt?=
 =?iso-8859-1?Q?GYjeYxUolGAkOjgAoMLgUkpRg1uwDP4G2xrkyMGSFoBfVFApz5l/vx4tR2?=
 =?iso-8859-1?Q?WjK7olAjg13j6VHRWqhtPNp9KKkkGUyrK+Tb1DAYFSTOj23omwT3GgPOAh?=
 =?iso-8859-1?Q?yrg0MAffBjcj+alw8fLaVSZrbwWpylFx7YlQ/R2UJW8JNct7PAIqxSG9Ix?=
 =?iso-8859-1?Q?ilKgSKiztCMmVPnYPSF02wpI1J57DoUZO09fwWHJ0tzbAh8keaTMsLcgj6?=
 =?iso-8859-1?Q?l1cnllkoiQCqaMifbdtAx6bV8bOJjOi3N0tpx7rVWG0po9vb/KqpuB5RWM?=
 =?iso-8859-1?Q?iFwXESNbST6PrKM0X44s/7bDXK7ClczI13Qb7DAaAVLo/fxAO0fVOH87Ue?=
 =?iso-8859-1?Q?WE37LAQCWWaHnnkAU7nimDb0kDT3xcXzWuHWtwCBP6VN2tLWYG8JJ8jII9?=
 =?iso-8859-1?Q?H9uUSDUdG2RUyJ6qepLQSlQ57jkbmMwNx6ymq8YuHGA6AsVNce6d83iUIP?=
 =?iso-8859-1?Q?UU/f/AaOeAwf1EugTZZ0Z2grMVFMWjypkxHHsjoWkMNlEXbjOr3yVpobI7?=
 =?iso-8859-1?Q?QUSXTdMAhCRNymH5SjiImRy9Q1cT0GnyHcjKOIPnDSUBpvuaoxF0XDhQkS?=
 =?iso-8859-1?Q?7bffYixLZDVIoODnTuZZ3HZK2rhKLr0/PzRyeYb3Q6CWc6yNEA5LxkftQ7?=
 =?iso-8859-1?Q?LckwreukASPcdmkHp4SlwsSsxXQM2lN2fJFc8jZgd/v+S8q0yGy3Xod52r?=
 =?iso-8859-1?Q?VhG8LvIEO08UdvQUb+Ix/KfJt5ebTqccWYZ9+BwHsQoSBmypDsAA+frZJ6?=
 =?iso-8859-1?Q?57o3erYGEjAQMKUAfrgG+M2pGpgnqZLXe2MsUgE33rvbP+qV4tZfPf5PQy?=
 =?iso-8859-1?Q?W0ejLR9dlDDA/U9rDUAkIcopDZQ1nAMeR+t2x1iB0nU2u0FQTUZmWEAyae?=
 =?iso-8859-1?Q?SRGFN/KNQnU9WJrr/c9Qy51mlS6242E8t8ntPNl2AOCqLjTbhG3v1VgeO1?=
 =?iso-8859-1?Q?1DDrn5iY5Gk5CkNFCl93is3B5X/v/cbsxuckIEhlnEdcyA0utA0SDWIgnz?=
 =?iso-8859-1?Q?In9/SOYKRRhO+IxlGPYpqEMbkc27WNfcaqtcHiyNpEvwkyoox2cAgafq/2?=
 =?iso-8859-1?Q?MEB7b0+b++UFBLDuV9cHDdX3jpT7PYnvOWGcPCTgaWOmrdsuS/m/2MR0e+?=
 =?iso-8859-1?Q?KUPzRrhwohqSOLwG0dlBMRMM9pKis7b8ed/YntU8StnFQu/IJkw8PzMUD4?=
 =?iso-8859-1?Q?ymQwBrIp02DswocHUcDmhQNg0FwlVhtuHIcf3En3CLvSg46PH3Spu9wtsg?=
 =?iso-8859-1?Q?qQKsSXoMa1fwxDqLbjUd5zeJbuXEcOLLdz66WC0aCSRnr4wXD/pSQFk8wv?=
 =?iso-8859-1?Q?AJ5X9K+IwC+iiMxcdFbuLK2iTS4BNpt4/5D2MINhw7dQcaf1FtYq76S8BC?=
 =?iso-8859-1?Q?19k5tLSKrHZCctjKNUkXDoxiDazf5nuEwf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f32bee5-7103-4c6c-2bf9-08dbb39d66c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:34:42.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9JFgtt2VQ17pt+IZHYn/ErgMsiywn5WNSR0tCpHnGSm4CH9n8fAPShXIGbiQDQWQL/MZfOxa0fsrwGD4HW7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Add base performance sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 02:18:55PM +0530, Sundaresan, Sujaritha wrote:
> 
> On 9/3/2023 7:06 PM, Sundaresan, Sujaritha wrote:
> > 
> > On 9/2/2023 2:05 AM, Rodrigo Vivi wrote:
> > > On Fri, Sep 01, 2023 at 05:45:44PM +0530, Sujaritha Sundaresan wrote:
> > > > Add the following attribute to Xe sysfs
> > > > - base_freq_factor
> > > > - base_freq_factor.scale
> > > > - base_freq_rp0
> > > > - base_freq_rpn
> > > > 
> > > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_guc_pc.c    | 116
> > > > ++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_pcode_api.h |  19 +++++
> > > >   2 files changed, 135 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > index c03bb58e7049..6a139d1dbf66 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > again, this has nothing to do with guc_pc.
> > > We clearly need a new component to handle the frequency.
> > 
> > Right. will look to define a new xe_freq component
> > 
> > Thanks,
> > 
> > Suja
> 
> Hi Rodrigo,
> 
> I've moved a lot of the frequency attributes I'm adding to a new file
> 
> with a new xe_freq component.
> 
> Does that work for this ?

I think so, but I might be missing something.
Is this already in the mailing list or some branch that I could peak?

> 
> Thanks,
> 
> Suja
> 
> > 
> > 
> > > 
> > > > @@ -20,6 +20,7 @@
> > > >   #include "xe_map.h"
> > > >   #include "xe_mmio.h"
> > > >   #include "xe_pcode.h"
> > > > +#include "xe_pcode_api.h"
> > > >     #define MCHBAR_MIRROR_BASE_SNB    0x140000
> > > >   @@ -37,6 +38,9 @@
> > > >   #define GT_FREQUENCY_MULTIPLIER    50
> > > >   #define GEN9_FREQ_SCALER    3
> > > >   +#define U8_8_VAL_MASK           0xffff
> > > > +#define U8_8_SCALE_TO_VALUE     "0.00390625"
> > > > +
> > > >   /**
> > > >    * DOC: GuC Power Conservation (PC)
> > > >    *
> > > > @@ -642,6 +646,112 @@ static const struct attribute *pc_attrs[] = {
> > > >       NULL
> > > >   };
> > > >   +static ssize_t freq_factor_scale_show(struct device *dev,
> > > > +                      struct device_attribute *attr,
> > > > +                      char *buff)
> > > > +{
> > > > +    return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
> > > > +}
> > > > +
> > > > +static ssize_t base_freq_factor_show(struct device *dev,
> > > > +                     struct device_attribute *attr,
> > > > +                     char *buff)
> > > > +{
> > > > +    struct kobject *kobj = &dev->kobj;
> > > > +    struct xe_gt *gt = kobj_to_gt(kobj);
> > > > +    u32 val;
> > > > +    int err;
> > > > +
> > > > +    err = xe_pcode_read_p(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
> > > > +                PCODE_MBOX_DOMAIN_CHIPLET,
> > > > +                PCODE_MBOX_DOMAIN_BASE, &val);
> > > > +    if (err)
> > > > +        return err;
> > > > +
> > > > +    val &= U8_8_VAL_MASK;
> > > > +
> > > > +    return sysfs_emit(buff, "%u\n", val);
> > > > +}
> > > > +
> > > > +static ssize_t base_freq_factor_store(struct device *dev,
> > > > +                      struct device_attribute *attr,
> > > > +                      const char *buff, size_t count)
> > > > +{
> > > > +    struct kobject *kobj = &dev->kobj;
> > > > +    struct xe_gt *gt = kobj_to_gt(kobj);
> > > > +    u32 val;
> > > > +    int err;
> > > > +
> > > > +    err = kstrtou32(buff, 0, &val);
> > > > +    if (err)
> > > > +        return err;
> > > > +
> > > > +    if (val > U8_8_VAL_MASK)
> > > > +        return -EINVAL;
> > > > +
> > > > +    err = xe_pcode_write_p(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
> > > > +                PCODE_MBOX_DOMAIN_CHIPLET,
> > > > +                PCODE_MBOX_DOMAIN_BASE, val);
> > > > +    if (err)
> > > > +        return err;
> > > > +
> > > > +    return count;
> > > > +}
> > > > +static DEVICE_ATTR_RW(base_freq_factor);
> > > > +static struct device_attribute dev_attr_base_freq_factor_scale =
> > > > +    __ATTR(base_freq_factor.scale, 0444,
> > > > freq_factor_scale_show, NULL);
> > > > +
> > > > +
> > > > +static ssize_t base_freq_rp0_show(struct device *dev, struct
> > > > device_attribute *attr,
> > > > +                  char *buff)
> > > > +{
> > > > +    struct kobject *kobj = &dev->kobj;
> > > > +    struct xe_gt *gt = kobj_to_gt(kobj);
> > > > +    u32 val;
> > > > +    int err;
> > > > +
> > > > +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> > > > +                PCODE_MBOX_FC_SC_READ_FUSED_P0,
> > > > +                PCODE_MBOX_DOMAIN_BASE, &val);
> > > > +    if (err)
> > > > +        return err;
> > > > +
> > > > +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
> > > > +    val *= GT_FREQUENCY_MULTIPLIER;
> > > > +
> > > > +    return sysfs_emit(buff, "%u\n", val);
> > > > +}
> > > > +static DEVICE_ATTR_RO(base_freq_rp0);
> > > > +
> > > > +static ssize_t base_freq_rpn_show(struct device *dev, struct
> > > > device_attribute *attr,
> > > > +                  char *buff)
> > > > +{
> > > > +    struct kobject *kobj = &dev->kobj;
> > > > +    struct xe_gt *gt = kobj_to_gt(kobj);
> > > > +    u32 val;
> > > > +    int err;
> > > > +
> > > > +    err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
> > > > +                PCODE_MBOX_FC_SC_READ_FUSED_PN,
> > > > +                PCODE_MBOX_DOMAIN_BASE, &val);
> > > > +    if (err)
> > > > +        return err;
> > > > +
> > > > +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
> > > > +    val *= GT_FREQUENCY_MULTIPLIER;
> > > > +
> > > > +    return sysfs_emit(buff, "%u\n", val);
> > > > +}
> > > > +static DEVICE_ATTR_RO(base_freq_rpn);
> > > > +
> > > > +static const struct attribute *pvc_perf_power_attrs[] = {
> > > > +    &dev_attr_base_freq_factor.attr,
> > > > +    &dev_attr_base_freq_factor_scale.attr,
> > > > +    &dev_attr_base_freq_rp0.attr,
> > > > +    &dev_attr_base_freq_rpn.attr,
> > > > +    NULL
> > > > +};
> > > > +
> > > >   static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
> > > >   {
> > > >       struct xe_gt *gt = pc_to_gt(pc);
> > > > @@ -925,6 +1035,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > > >       if (err)
> > > >           return err;
> > > >   +    if (xe->info.platform == XE_PVC) {
> > > > +        err = sysfs_create_files(gt->sysfs, pvc_perf_power_attrs);
> > > > +        if (err)
> > > > +            return err;
> > > > +    }
> > > > +
> > > >       err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
> > > >       if (err)
> > > >           return err;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > index 837ff7c71280..da4114bfaa7a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > @@ -30,6 +30,25 @@
> > > >   #define   PCODE_READ_MIN_FREQ_TABLE    0x9
> > > >   #define   PCODE_FREQ_RING_RATIO_SHIFT    16
> > > >   +#define   XEHP_PCODE_FREQUENCY_CONFIG            0x6e    /*
> > > > xehp, pvc */
> > > > +/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> > > > +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0        0x0
> > > > +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN        0x1
> > > > +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> > > > +/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
> > > > +#define     PCODE_MBOX_DOMAIN_NONE            0x0
> > > > +#define     PCODE_MBOX_DOMAIN_GT            0x1
> > > > +#define     PCODE_MBOX_DOMAIN_HBM            0x2
> > > > +#define     PCODE_MBOX_DOMAIN_MEDIAFF            0x3
> > > > +#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER        0x4
> > > > +#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY        0x5
> > > > +#define     PCODE_MBOX_DOMAIN_CHIPLET            0x6
> > > > +#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK        0x7
> > > > +#define     PCODE_MBOX_DOMAIN_BASE            0x8
> > > > +#define   PVC_PCODE_QOS_MULTIPLIER_SET            0x67
> > > > +/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
> > > > +#define   PVC_PCODE_QOS_MULTIPLIER_GET            0x66
> > > > +
> > > >   /* PCODE Init */
> > > >   #define   DGFX_PCODE_STATUS        0x7E
> > > >   #define     DGFX_GET_INIT_STATUS    0x0
> > > > -- 
> > > > 2.25.1
> > > > 
