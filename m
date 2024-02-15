Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D736DC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 13:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DB10E7B2;
	Thu, 15 Feb 2024 13:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ks5vEESZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1824C10E7B2
 for <Intel-Xe@lists.freedesktop.org>; Thu, 15 Feb 2024 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708004626; x=1739540626;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x4TBgHzZbMeEJW6EduzNsmDK8mQRxftUCbyZYXGyENU=;
 b=ks5vEESZko8Dh8vH2CFbijCi3JAX8lgdHPM2dganP9pWkLOe8UJrOFn4
 cs8uchsbS85eROSOoPQKx6NcmO2zYSE56X+NcgAgHBEdAzLbKngAgbIk7
 ZK5ErT4jCnIbrIGiFl+J7V91Ngli0wuu+5EXSKk6d55J38AtFg2LkgCDj
 bVFZkwkvRjfyoow10UyfnTsjqOe92CFJyELdO5yyRs88x9DELE2PHQX5u
 7v50HWmGBOONVxeTKaNZ4WNOqP9xXdZDYK5Rkfy9d8NqoASrgMNm+Ztb6
 c0P0P1GjYNCLbCxIXXyPPPiXM6fWTJIEcRED0rTo0mF7QedHI5puxVxGA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2216202"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2216202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 05:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3606672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 05:43:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 05:43:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 05:43:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 05:43:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3/5YCYtYWJDtZ3MwLJc3M8zqIh5eWlZtAG5PJaSO52XFnRkzAJM9yPccleeaakt46uW4VYsIPZdzSieyvKE1r4CIeWjo9VuXpZZ/fKbjizVR7q3ZOhUPEvP6wE/Pi6e+KZPrnXJQKT1ZuJO0X06AE2zTVLmkL9za8941s401SGo5UFa3imTJoh7Z2gdNLoYt8mIuBqp9azgc6LhUBEOacZkdkcgpLaAPSJ2arkqP7o4zebHDzKDPF6hBgoEyKPWmDDGvWT+SxWyW5jo3SGA7gzQSCHrPXfPFoOnst8zXEkBmwl4S1W1XKMbzskiwNBw4djEFJE4ZNPFC+fAFahqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD1+WYNHBNyN/6v+pOTE8FJLWimvTDU0z5K8FYjbdLs=;
 b=cpMQWqgyXCDLIAhwhL2LdPh/nK1BIb8mZwwARjg+LxZoJr9504B9huIuKlopmCDGa/+ow0QSMjUHI+bbzLCvm7sz6ksyC0HoG4eTHWeZVVQhiI0CC2BWx6JRyC87XjEwxHRtKMOzIwEOpjnqC22ZaQ7T6G3UwnRW8a1kiliFFKmlEU2o4kNHmiSd3/IBSJ2i7nd17pQkZoB2Yo99VTW0GoIXpb4YW1qDZS/GQlo/zF3Zzs07i4bJirFYFjSUTt6hcoeByIvXhnCv0G3GRCwR5kqji6PkfqDaDj5EjTiYisaTrvBIsjZPHHJu9FBsDpPjyii/EXY2bOS0DdRpKoomyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4563.namprd11.prod.outlook.com (2603:10b6:5:28e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Thu, 15 Feb
 2024 13:43:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 13:43:42 +0000
Date: Thu, 15 Feb 2024 08:43:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <Zc4VCzhxcjVLdD37@intel.com>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
 <ZcuJOkUkZnss9ttl@intel.com>
 <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
 <ZczGFSmfKZwei7on@intel.com>
 <8bb4e787-fa91-4167-9790-f801945ecdc2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8bb4e787-fa91-4167-9790-f801945ecdc2@intel.com>
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4563:EE_
X-MS-Office365-Filtering-Correlation-Id: c371888c-5620-4090-8f7e-08dc2e2c1f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/53o/bCeiw9yCS47z/RoJyKW579UpAJXNVk4TibPqOWcd1HY8Qj2w0qdwIqaeBwGVOiYqsSPaDb0O5KnJ08YrOi4or2EoMR7AzVNQruIltRnP9q7bI02SuygPoH2UcPltuld0mlDb9nGuq+n6VjJ7RCwzJCAxTMCqqVe/0yUPtr4o/ow90woaUmSuvzi7Ez/kCmZNV/0ywH5RvTNoU6G+v0NxNyk/5aXAtPtV2OiTIx1MrP3OKAZlPtRMvjHF/C485VHRL/IvYepy0jSjPC46MmjNLaVJSJZqF6gFJunCQDr3RThl0ePuSNFY/da+moleytM4/wvXSv/5Oa9JXH/gQ0Zphp7LPigu+7Udu7bP+4ckkhVmrGLOvokrmBuvrKfdPcb36P6oZjg6D8kPa6pF8psCGwb100z5hbAkc88w96nrbhr6/UyuIst/ltnPthMX/RtNEPBzBS/IbTwzL8lQ3aoPBSldmdRRrK2pHRO13nW1zYj29CXfj8fr6JalHAla2KcXLQeixIYzIxYqtDKIujVfK6Ni5DZTRy2RPAAvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(316002)(82960400001)(86362001)(83380400001)(66476007)(6486002)(966005)(2616005)(66556008)(66946007)(37006003)(6636002)(53546011)(6666004)(6512007)(6506007)(478600001)(44832011)(5660300002)(2906002)(26005)(6862004)(4326008)(8936002)(38100700002)(36756003)(8676002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bv8Oh/Xjifby5bIbP8mWs7//cQSShk3dSdPJGsJVzHWSq08cCCpITyN4C5Jn?=
 =?us-ascii?Q?Q98UOCjB9xIlSb7L4daGUVlOi7wpl747QE7wyoYNRBsU+/S7dU8mQjtWwcIp?=
 =?us-ascii?Q?Jx0i5/NnZAN5kYzUhRIt8RDgZnJ2SqvDi/jAP75Lyx3j2i6mDxbVnBN9DJsL?=
 =?us-ascii?Q?i/aAtxmplK3aLQiRWwq2Ag0umE7jcBGsWsaNgK41M2ZzVb44FhcG1LDQ9Zkb?=
 =?us-ascii?Q?a9zwlBTjOE1U4EgaZf8ewu/LN0MMdi6QVVBacnNNEht48dO7seq0pVso/mrH?=
 =?us-ascii?Q?l5v5gO8ZRrR5F9cOSamlanuKwAmNoHULrGy0D930nnVU+BGkXuzDzY0/rKf2?=
 =?us-ascii?Q?3sB0J4C44vek914FJDOiT9Db89FUMIs8KVt5g+7RnwMXo1TyS+tAT/T25hVy?=
 =?us-ascii?Q?ao4mf/kQbkjM9eA26Pdp2ENvJOxBsj0k5uUmMLoKjgQ0zJoVXpZ6psZrwUb1?=
 =?us-ascii?Q?p/nC3XeAzF9eWOt9IFmQZkkD6Yf21/ZmrTcDjXu8Cy1OWCX9eSWHfmw/JXWu?=
 =?us-ascii?Q?oC8szDbssH52OpdaxJApsRstIDsiCzG/3IeJ//QZodRa9d4mnQHhlUx3opd+?=
 =?us-ascii?Q?kNVYfrlsgt1Q1xkTUEKACv5gDiQjsUnLkZ3KQaG6s2YI1Sp+TNZKhfwF3gFn?=
 =?us-ascii?Q?xmH8WlsVkvUGcQcTRZbygdC4LiSahBbdz+3nX3lpWqvTGxyxepRDmQA/rkX9?=
 =?us-ascii?Q?uJalbSFPCWTJV6hoW9hiaxJNEtRfqhSMs5C3+lT+1y/oHVF3oxmkQUCKudhf?=
 =?us-ascii?Q?rcJ647upIuZkbSurxUir+V1t7g8Fjlt5nDcTLBJ7l+ebjEpcOximhG8s2KCw?=
 =?us-ascii?Q?iiczw/XdjsXY4i9TzgwrBHqeT64ntb9Nt/Y96BxU0dF+JcRjUngmbvFUZfZ6?=
 =?us-ascii?Q?U65MLjeR6aA3DaJdxMV1gqvrrWISCYYUM83vEyGw3OD6L0relllL8OwEwKeN?=
 =?us-ascii?Q?UKH80n6/fXkPT9uyTebhzYcawx8RMWK1SF5npSLrmNNacREZ7Ezp6pTgbg2D?=
 =?us-ascii?Q?W+sUOi5QqZzDqvyomkizC/OUpm9WcL9msum+eQBC0gpWS3l/nv/IokVVEpFy?=
 =?us-ascii?Q?WnBylfNiKLVJ79dF2VHIuBxxuxV8ddYXYpImY9FMKvxhyBwNxIvva36gRgAU?=
 =?us-ascii?Q?KP3VdqYEK3bkBojjFFxz4Ezzzy7MsQ1jK/WTNP6x6CxIkYbgtKLkySRZpZ+5?=
 =?us-ascii?Q?cSSkayAUFz2HEHk4QDaJpUGY4FOxOIU2TqEpWLmGcyO3MDoUj/T/AMzCpGHz?=
 =?us-ascii?Q?IN7fZavwoipIbOm+Vt5kTwlv6rrBoFzMLJ63fhxnJw0W8Cd5aCQRczOqYxh7?=
 =?us-ascii?Q?jWkH1IqDId/PmCOdcmc5O8tn9gnhPmjetYRSS0kCGYq48q/cigvGe1OgZDec?=
 =?us-ascii?Q?VLm8CnvGs6khfS2w4CEkwkb8zmFA7lFPgA+Awp+qkxD2UaazEKpk6NSqA+7k?=
 =?us-ascii?Q?i1w0mUq+sPrp/TXG1NNbAxJMNZgi3ToHrCAyENDnf150nMiyQsmXes7PrcqM?=
 =?us-ascii?Q?93s0ut2VQxBVHp4WUMa5T6vVL9ZpXX/WUZcibeGoI6K0KNcBoLm9jajXUW1+?=
 =?us-ascii?Q?M+JugxjBBvs1Icz3kzrWSGQJueebnTFGzxm6SVMW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c371888c-5620-4090-8f7e-08dc2e2c1f92
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 13:43:42.5097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys1gB94PyhYK039FI0SsvCAiw1y930TFtANvK6TTvt6WR8dYkBs1gRnQFG+0l6fydMvQr1Mc6lKdIM5nIiSGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4563
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

On Wed, Feb 14, 2024 at 12:21:36PM -0800, John Harrison wrote:
> On 2/14/2024 05:54, Rodrigo Vivi wrote:
> > On Tue, Feb 13, 2024 at 06:12:11PM -0800, John Harrison wrote:
> > > On 2/13/2024 07:22, Rodrigo Vivi wrote:
> > > > On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
> > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > 
> > > > > Other driver code beyond the sysfs interface wants to know about
> > > > > throttling. So move the query function out of sysfs.
> > > > > 
> > > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
> > > > >    drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
> > > > >    drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
> > > > >    3 files changed, 29 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > > > > index e5b0f4ecdbe8..51645a24009e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > > > > @@ -11,7 +11,10 @@
> > > > >    #include <drm/drm_managed.h>
> > > > >    #include <drm/drm_print.h>
> > > > > +#include "regs/xe_gt_regs.h"
> > > > >    #include "xe_device_types.h"
> > > > > +#include "xe_mmio.h"
> > > > > +#include "xe_gt.h"
> > > > >    #include "xe_gt_sysfs.h"
> > > > >    #include "xe_gt_throttle_sysfs.h"
> > > > >    #include "xe_guc_pc.h"
> > > > > @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
> > > > >    	xe_gt_throttle_sysfs_init(gt);
> > > > >    }
> > > > > +
> > > > > +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
> > > > > +{
> > > > > +	u32 reg;
> > > > > +
> > > > > +	if (xe_gt_is_media_type(gt))
> > > > > +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> > > > > +	else
> > > > > +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > > > > +
> > > > > +	return reg;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
> > > > > index f3fe3c90491a..89be518b4967 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_freq.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
> > > > > @@ -6,8 +6,12 @@
> > > > >    #ifndef _XE_GT_FREQ_H_
> > > > >    #define _XE_GT_FREQ_H_
> > > > > +#include <linux/types.h>
> > > > > +
> > > > >    struct xe_gt;
> > > > >    void xe_gt_freq_init(struct xe_gt *gt);
> > > > > +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
> > > > this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
> > > > Please use the right namespace prefixes.
> > > Argh! Forgot to update that.
> > > 
> > > > But besides the namespace, I don't believe that these limits
> > > > belong to xe_gt_freq anyway... why are you taking that from the
> > > > throttle reasons and moving here?
> > > > 
> > > > What about removing the 'sysfs' name from the xe_gt_throttle
> > > > component and making that to export a function
> > > > xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> > > > ?
> > > Because that seems like a lot of unnecessary churn. The intention is to
> > > simply add the throttle register to debug prints so that CI bug reports can
> > > be triaged more effectively. Re-writing the entire sysfs file to split it up
> > > into multiple units is not worth the effort when all that is required is to
> > > export the function to read a register.
> > No, that's not what I meant... I don't believe we need to split the file.
> > just remove the 'sysfs' portion of the name of the component itself,
> > so we have a component responsible for providing throttle information, either
> > with direct exposing the sysfs and also with the exported functions that can
> > be accessed by any other component that might make usage of the throttle
> > information.
> Still not sure I follow. You mean rename the files to xe_gt_throttle.[ch]
> and rename the exported init function to xe_gt_throttle_init() but don't
> change anything else? Leave all the sysfs code in the single file? And have
> xe_gt_throttle_init() as just a stub wrapper around a static
> gt_throttle_sysfs_init() or keep it as a single level init function that is
> generically named but only does sysfs initialisation?

I mean something like this:
https://paste.centos.org/view/d3d2cc77

> 
> John.
> 
> > > John.
> > > 
> > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > +
> > > > >    #endif
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > > > index 63d640591a52..89d9f89962ad 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > > > @@ -8,6 +8,7 @@
> > > > >    #include <regs/xe_gt_regs.h>
> > > > >    #include "xe_device.h"
> > > > >    #include "xe_gt.h"
> > > > > +#include "xe_gt_freq.h"
> > > > >    #include "xe_gt_sysfs.h"
> > > > >    #include "xe_gt_throttle_sysfs.h"
> > > > >    #include "xe_mmio.h"
> > > > > @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
> > > > >    	return kobj_to_gt(dev->kobj.parent);
> > > > >    }
> > > > > -static u32 read_perf_limit_reasons(struct xe_gt *gt)
> > > > > -{
> > > > > -	u32 reg;
> > > > > -
> > > > > -	if (xe_gt_is_media_type(gt))
> > > > > -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> > > > > -	else
> > > > > -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > > > > -
> > > > > -	return reg;
> > > > > -}
> > > > > -
> > > > >    static u32 read_status(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> > > > > +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> > > > >    	return status;
> > > > >    }
> > > > >    static u32 read_reason_pl1(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> > > > > +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> > > > >    	return pl1;
> > > > >    }
> > > > >    static u32 read_reason_pl2(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> > > > > +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> > > > >    	return pl2;
> > > > >    }
> > > > >    static u32 read_reason_pl4(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> > > > > +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> > > > >    	return pl4;
> > > > >    }
> > > > >    static u32 read_reason_thermal(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> > > > > +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> > > > >    	return thermal;
> > > > >    }
> > > > >    static u32 read_reason_prochot(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> > > > > +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
> > > > >    	return prochot;
> > > > >    }
> > > > >    static u32 read_reason_ratl(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> > > > > +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
> > > > >    	return ratl;
> > > > >    }
> > > > >    static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> > > > > +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> > > > >    	return thermalert;
> > > > >    }
> > > > >    static u32 read_reason_vr_tdc(struct xe_gt *gt)
> > > > >    {
> > > > > -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> > > > > +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
> > > > >    	return tdc;
> > > > >    }
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> 
