Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4612BC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 14:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DB510E16D;
	Thu, 25 May 2023 14:27:40 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5DD10E16D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685024858; x=1716560858;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SsrQs/O2G8l7LPhrEyVC7B7vccZ7N3/nJ8RXqzK2j+8=;
 b=dCfrHHD5a6mEJei7JxcBCYQo41tKPNX6N2qo8yvFSEYdpuPha2m+tvBP
 rxTdU75atUDvMqjLKzMNqvF2e+rSrE1traDxQy5OPW7XPdn3qZysiLLP5
 YTjwY3NPrsahnmqP1yz3F/yyEL9V927Z1/404cYJfqVqGRax8DcVy0cfw
 wtA6+s2Hrc9zvm+XT74wl/VjrAcof1HDzWXMr4t3BL8iplpqbX8qnOqLT
 R5pxZsg9eMLeAOpgTGLUXZe9qVtxXg8DjkiY5JDQ6W4TbO7OmWicjLT/B
 J/HulRxa3XsvClVCgtgtvwP9svQ/glQLore5SfWZ4s2cqSCYgH9GroU63 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357145125"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="357145125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 07:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879121194"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="879121194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 07:27:33 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 07:27:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 07:27:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 07:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH4IRcxUlplkClyQqlr+vq7nhA1Ck1dEZu/zIscMKsfpC6jVWYUUpEHan4aFkQZBgvnjEPLC8NGQxIWXXWiPqzeSAOs6fkeoS4eV3LQTY6UfD4JiBgiILgLEnTJxmnBxBfCMv3h1aVpIbEpOVQUrDJfP5RPBGBoP6pRUXfCPb/fYadks97RMoZxGG7q6Nr2aAVOpg+zzDiBbcOAfo6axWXKrqFAA44aVM9PgnS7nQ+tFUuTDy1NALOUcdqQgzbDlnIQvn61GeieQjL7XQXLUbJ5W1wOj/yrdADigiiCPr6jadJyRwEHIrzo6AC+lHmkzXMAR6wguTPqiPlk5p75X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc3ijOGC0g2P8KrFHJMqPpO+QaTwAJIbOh/dYuRYIyc=;
 b=kS0dlL3LjrtlpRGDlqZC/E3NKAmbad5HnAoQFEeJbQPrwyNN9FhhxvF//gXREkBALfnJYzgtgUfk0RR6rKdqZw/gbD61fX1L6V2CzEpGM/NiRjK2zbZFnzKNy8yl1jo98+s/i4k58NCgbaKhkBXCGiN3bichKb7jZf0ikISKot83aj23BD3Cyzjmh3IZppfetVRwQK2nbFHZR0n+fbpojWCw1Zls6zPqwIRXP+xlN/yoS7he8/1kP99ubVj+bSdktwTB75R4iXpbKLc1g3swj0zB3zzgPjNBMZncxtonT0XGua8Up54Al4YOLMGrSPyvbr21TRoHMzKXzfag6+zdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 14:27:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::e1a7:aae9:f8e7:6aa8%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 14:27:31 +0000
Date: Thu, 25 May 2023 16:27:23 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZG9wS6-lEoETDAwk@fdugast-desk.home>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <9172b79a6c6549b354957ce72a078544e717cd8d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9172b79a6c6549b354957ce72a078544e717cd8d.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df354e5-72c6-4b5d-7c76-08db5d2c2c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cH1QnSS+gpMI0KJU56B9/5ks+DJ1jcmAOstvZ2eiSSTUC0vZ4P5qeGDBJdisyX5gxRAVSw50qDGPcLrPt5paO+LhxAEd6j/bgJGk5WX18PvXf18NwQ4hZ+6GuY2i8O9AKC1ry8qftt6DcPlFX2P1w/nCDUMuSe9WRHyra+tn68pTHxWXy26EKRDiHRuwl2EyZ6V4qSd3aaogQiaw/lwi/4cquX6dnvT7zFppWvJL7uSAIyirRV7nK7UoiONrfU88kjhulvR7wB7q5jNdB2LwKUGapbRjSCND0AsxsRRcMRlS7+H3z0xwpXmT/QkGXD2RCONzoIRVP6cc5ANDScXlOT/prfpgOH4BeMyPoQeTSk0HFznsSl89TFZV3SsrDGSIWYVTp54+QdCCqG76vAxA+c44eVh2I2x/xJGrwecdxIZMbtX/X9rw3fiZmgyZhOjdhDVx9X6Gv+Pr5rpOknynFeEOF0VbWMkYDEpnHED1dkxtvwdijLixBaDQcHaN94lgfP8ppF+UtLk6tCHleXf74F/yEKl47p3c9ztcn5Hbc0wqy0Aga5jtsXgTruYZjkJG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(86362001)(4326008)(36916002)(54906003)(66476007)(66946007)(66556008)(82960400001)(6636002)(316002)(6486002)(41300700001)(6666004)(38100700002)(478600001)(8936002)(6862004)(5660300002)(8676002)(107886003)(44832011)(26005)(6506007)(6512007)(9686003)(36756003)(186003)(15650500001)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?69vqkcmaEJgMi4RAn6u2BaBo2oks1MZzr7iC7T9DJWlo1MAZHd9mjWYbvV?=
 =?iso-8859-1?Q?27E2q86icvEwRyx84ZLXKjITLOfbtPNwaEFCyGGm/LbuevSkNtQi5F0p+g?=
 =?iso-8859-1?Q?en3253ccbzKaM4CHlM3p/T9/dZ//s82eyKemJxB7ksBU10Z9df3m9lSA4J?=
 =?iso-8859-1?Q?xQB4e3JFGtGv0SswH8EwRmKF/1P8HDGuX6G3ar+dLhohV+j5AZ5SVw8bBC?=
 =?iso-8859-1?Q?E/v7BO6nSGsiPqYCzDYWmPBQuWtOSY03miknLv2ZCGj9wmysCDZQ7jmAdT?=
 =?iso-8859-1?Q?RPUEqsDMT5gSpyLwgOMJItV3EQXuKgxm0k8Mah2Q4wbfgnk+IKS0o7gAZQ?=
 =?iso-8859-1?Q?Gdk1Zty5CsC09NL/VhsQM+iVSdOUgZof5gC/9qbVRssBlA1cwNLIhsuEED?=
 =?iso-8859-1?Q?xc7FTulxBucoNcjFUV/EmEdqnieeI+QDSWYXAssMl1n+MCZmYQNlOIkZ0B?=
 =?iso-8859-1?Q?vgq2jhrygjYZiiWhInBoSVSgb+lrivMf8fN4PZd+MmpegUijXW+yr7rqSO?=
 =?iso-8859-1?Q?79MRUqqf7vxdUHptf4ivMNjU/G4YwdD0NrQ8VBHYLJPrBdlf8WR302tRHK?=
 =?iso-8859-1?Q?is3a6ROwT3oHIYh3H6GVFJWSMRrcO+19+Y2EsW1/HqO9kXw++X/v4pm0Gh?=
 =?iso-8859-1?Q?/x3PhyvcreddklplSeVnJlgx/jGZvrR/QpERs5sGtCQnpc0ShXHEaxrr7Z?=
 =?iso-8859-1?Q?ySeXW2j7RjHBXyYTtsst1CVVr+f5yVrWReDaxaruQP9DMqR/Pk3kUo4hLB?=
 =?iso-8859-1?Q?a9QDRc+0TCNJ270b3LqjGKepAolynaQc9pU9aNurkxj2pYsmVdwRQvp+2M?=
 =?iso-8859-1?Q?9Ln6LS5xerjoVzkX3yMwZC3aiDH7cnkH1lJavBfyXiTieXV8CT34NpFZqS?=
 =?iso-8859-1?Q?X1gEgPhJviyh4/Blq8MMtjU7XyU248hKa65MANeuuUFe2sEa0qbENiSYIU?=
 =?iso-8859-1?Q?otgJBfsEcp+T6e5Sv9oSBQxT4RIacdaqS+BhpL3U4y5lZ4fWmegKkhUjQA?=
 =?iso-8859-1?Q?REKxryXARkmNswsTa/vTDT0TMyRehUw8zpMad2hwdaC85uUjFlKIo/Qaap?=
 =?iso-8859-1?Q?Ty7nAix8o2AjeuyFJfNSi28xOnFTuilXBsMCIgYzwdNqNw6mvT6oHaAafL?=
 =?iso-8859-1?Q?/uXnYFnTxB+Qmwf/mGjHL/T97LZU6FneNn8GL0x+mSP+4AtCPA4RK7xLXU?=
 =?iso-8859-1?Q?CFCoTEiu69zglEfyaDyLpZuCs+vVEwgw0yhufQRuOKOtbSgRurafzeUKK3?=
 =?iso-8859-1?Q?qjsSFSO3r4+YMjjrrm8+uaMjHjxpdaxAIlbQ8KJdrwkPpv946ewNaoKmGV?=
 =?iso-8859-1?Q?82pKPm7mIGrkrgO0IpagTW88bejmsKpGt7lIlZEGvMyaVs2E5C1RRDoiv5?=
 =?iso-8859-1?Q?PnTahJ8YVhkMUfTSGzU2Ol3JlE0IYxjfjvPQQogVqbdb8hP/3V8fgDhTD+?=
 =?iso-8859-1?Q?T7XoyVsHqBCWmRT3kL9roV6HxlWOEpltWTRo++eIDHMrGbsf9btA2q14V8?=
 =?iso-8859-1?Q?DtciCw5inMR5ivrIk3v0J/2tNconRMQ6rSYnnO/vrTP3KnrG6g4m9dvsz3?=
 =?iso-8859-1?Q?gWDXBXHId68gz5MLrRYCtiVtdjgJFaBmU+Qv8o6jV2pH+3OVlKkq2FjxW+?=
 =?iso-8859-1?Q?jSOXMyexK81LvZdHVpTq4dGyhKemBJbpx7t3mB9K3I7blRQhYvLkfNVg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df354e5-72c6-4b5d-7c76-08db5d2c2c48
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:27:30.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al9t2T6GnU/ku0cxTo0l+nv6VPORbHz27oN045SNs/jBTT7lwo0k4N4aiO5SDlwHUzQ4rKOtAoy95UdwoIkpL8k1YICC1OzemCSpM0Mlc40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 03:28:11PM +0200, Souza, Jose wrote:
> +CC francois.dugast@intel.com (Rodrigo is on vacation)
> 
> On Thu, 2023-05-25 at 06:24 -0700, José Roberto de Souza wrote:
> > Hi
> > 
> > Planning to push this today,
> > Christopher already have sent the Mesa MR and IGT patch series.
> > It should not break 64 bits ABI but would be good to update intel-compute and media as well.

Hi,

Thanks for the heads-up, I will create a MR for compute-runtime.

Francois

> > 
> > On Wed, 2023-05-24 at 18:56 -0700, Christopher Snowhill wrote:
> > > This series takes off from mlankhorst's attempt to do the same, except
> > > instead, it tries to be as minimally invasive to the original uAPI as
> > > possible, by only inserting padding where appropriate to ensure all
> > > 32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
> > > aligned. This should have zero effect on 64-bit hosts versus 64-bit
> > > userspace, so existing native software will operate the same with or
> > > without the update. The only real change is 32-bit compat support for
> > > multilib userspace, which was previously broken.
> > > 
> > > Also introduces field validation against all of the padding and
> > > reserved fields, which must be zero, in a separate commit.
> > > 
> > > v2:
> > >   Removed extensions checks where there were none originally. (José)
> > >   Moved extraneous parentheses to the correct places. (Lucas)
> > > 
> > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Signed-off-by: Christopher Snowhill <kode54@gmail.com>
> > > 
> > > Christopher Snowhill (2):
> > >   drm/xe: Add explicit padding to uAPI definition
> > >   drm/xe: Validate uAPI padding and reserved fields
> > > 
> > >  drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
> > >  drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
> > >  drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
> > >  drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
> > >  drivers/gpu/drm/xe/xe_query.c           |  3 ++-
> > >  drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
> > >  drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
> > >  drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
> > >  drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
> > >  include/uapi/drm/xe_drm.h               | 34 ++++++++++++++++++++++++-
> > >  10 files changed, 85 insertions(+), 16 deletions(-)
> > > 
> > 
> 
