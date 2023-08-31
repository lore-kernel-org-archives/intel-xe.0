Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6720C83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 20:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6349B10E6E7;
	Thu, 31 Aug 2023 20:33:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18810E6E7
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 20:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693514037; x=1725050037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=65KabHiWQsjkc3o8Y+KzrCEedAdc+OnYXCIQ+EwE1tU=;
 b=a8bJEVmGxJ1pMR+gOlv/SUYOSrHwKJ8EV65ypFi/JYTBE6H+CZfInqZK
 IwHT4SSKwO0Rf7exOg6Qzp6iNp/eFVGEFyp0TXmzqjAhUXfh6jW3OmGKR
 GsR6zyc69VYx9uMrIJWhqzadAlFhxrtZy0K1ygaqDqUfMmY+rEymdDs96
 kVyn2RlCqwANqEKXIprBPLPFxmXqgO7c2fSAzPNxD+ch/Fg7pJtuMKXtN
 t748W4zntu3JGtESGChDeiHLR0tlkmjwr/oIybiMB/v3fj8bJfXcub0me
 u9yykOtNMRfb8kRq2hM2/2Ls74gBnzTvkd+WOCapCHv+HDaVvUyM7lHkP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355558175"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355558175"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 13:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742855642"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="742855642"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 13:32:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 13:32:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 13:32:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 13:32:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 13:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c31ZP+MlvKXSJp3bI2it+fbqHVSiwMgBXfrR3d12AkrO4kchEPnFdvxIZ+mWGErEXi1FSbTdpJ9mLDH1roDqo7WwM57WDEl6YujPP9B5pL7ZxnqTI2+pqTvHvgN88G57b0nF4S4pkB3/r4PaXt9tQZ1rRXNqNlusTl4MJuMk2o6ZM+GA5wjlRdxciICvcunQ6HIhr8u4i8BfS10h6PmVHtMc1ujf8Jfozr1Q1czKGx+hQOOIKaVuJIEzErIcd3mLVLheOnKCfhlISkMbMJXcu/cOeWVl1R2cWrUq8kWERhzfceTH2hEbjgc5e1WUzTqGHfXip9/kSZHyteyogDNQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXeYvGuCEjAs8X67P/YVEL8H45s9dL+8laSD69hwyFA=;
 b=Gm2dMsoFO3Utl3/g3M0ywgXuIbKqD40KuUwBRRl/Fr/iP5E44z/AMlYggofLGN0ucxdHXASQvzXc9E8SJ6XPiZSguuASQwUrS7F/CRH3jIL01Axf35F4rNyCRZaloSq0qndAYCCf8mhUVxlk7qA4c0qyGobf/V42Iimcqy9NgVGrRaTX+ZtbwBdmuMv92fprW3ZcZHTLQR/mC/49OtCoeo9iD3VIuhQE5mu6voRVXRR2JugSPUQgydP+xDwew6LEVIxfen3kZj8Y19ajXJkp1E1tKU33VIqBugOVfy8IWxk7eCsoZDtTVGYZGVmNq2FD4jiOmncoKsQxsu4VM3RC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 20:32:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 20:32:34 +0000
Date: Thu, 31 Aug 2023 16:32:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZPD43vH9KBDNsUZX@intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
 <ZORySgimMKjigx3E@fdugast-desk.home> <ZPDwIn4o0s1xlxXx@intel.com>
 <875y4v0y4b.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875y4v0y4b.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 1707bf7d-c9f6-4ccf-8877-08dbaa61686f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7QzkKNjLbBP5w6cEWNcRN1wRk5llP4xAStzU1ogxUDnmMDY96Uy8BGhSsRKuYdqzYZqG15JXeMuikZdshNR2xTHgrwzRcT6TCZGPP6eKVo0OYeDTf0Qt5j3qvgyxjDAuZvy9lbLBcoeP4Hd4rd3zfo+SE6VSWxsI3qY9RJHcjM+5FdnX1Dnx4Vt7+eW1QgYIWtJIYIQpyVo00wCY9SEgqupjq5M9eyB1Sp9vfzFkzRGPsRoB5tecUFWtLfSd0XrxjbA2RwTYc0zvKGMQFM5Tp+aICJm230SrybMb2+9p27bsf2NsCGAv6zfJTp7aSatrV7LcKIq8ebQKX2AWwZDeHHjx2sIcRWavNNWgjQussFkQrRW1KQSBB5TF+uUKUNwmNMr42g60wSPNj4iUfRbAdr9J1DecR8HQMrX2dG9TJ7LPBP6R9ZOTdMbrzemNs4+Hj+BwJw+lb8GP6+Jp9R6xY2sfZqBgmYzXr8ooi9n/L2Ov8eTSsIBERvdm3gSmhoseTjCcrSiL/UFNCI9hVH5SXIWCsv00e+tq4X2XvXViLyiyGMZVLM7lsAGrQ/4NABKtRlvcedzeuwNDq6Mk2oLE4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(1800799009)(451199024)(186009)(6636002)(82960400001)(2906002)(37006003)(316002)(66476007)(66556008)(66946007)(38100700002)(966005)(478600001)(8936002)(5660300002)(86362001)(8676002)(6862004)(4326008)(83380400001)(41300700001)(44832011)(2616005)(6512007)(6666004)(6506007)(26005)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJ9FkPkDFRijeTMB+t+rzDDItpj4qoHyBQsqy37aHDVaC9sIYCICB7JQMlC8?=
 =?us-ascii?Q?2okhhTlgq48NnQyFbzDuvngUwFUlaGQIprkWJdTgaBYEuaIOqab4w+NihqKe?=
 =?us-ascii?Q?8wA8tV5tGoVOT+ioWjUW8x/tAPqMr/E77jNR0VtgaQ5NxASec4Fi+5H+bvBI?=
 =?us-ascii?Q?UxYW18JRUdNU8JphpzvC71mc4Svhi7q4PRneMgxlNY6s3EaNM3VSxf2NrWfc?=
 =?us-ascii?Q?RjZRlG2KV/rplrPxLVVal4IVrTdTkaJTs7IGl4YiaCBYJeSvSxpvPAlF4/4G?=
 =?us-ascii?Q?MmWKRtlN8x+SqOy2CibSF3ietuIVm2E9oyHI1WcE2MPiqRz6j+Zht4T4WG0m?=
 =?us-ascii?Q?jBVlsMwDjZf8EvF7JasD1QvSiOKxTtlAaR+PX4Pm9iErrq05W23bhYjVAoDl?=
 =?us-ascii?Q?9ECBKLmpmmjmkHp91SEj7gDxnQB7QNnLpGtW8Ys6nydGxpe3atIWmjnhWvQa?=
 =?us-ascii?Q?w8MLwSDMo9xV7hRaX+S7DaYYRbrhaTci8igPeeeT3RKUPml2edOzEaXQ4Bml?=
 =?us-ascii?Q?HdpQHv8gUHQ9pkQ02iz1iiJJz7+oHUvw/yrlbZHS4X/9aYE0QH4pOINYStRj?=
 =?us-ascii?Q?S55pI+HDzsq/6jN36MFr77H5/F+hDJpgWfPKdwRPWmYCZ8GN8Pe8F+soMfUy?=
 =?us-ascii?Q?UMwqUnw1FSHgxJ+YcZT24NUYOcto6tSIgdV0Hh5kVI+sHwsgq/515jQCIRgr?=
 =?us-ascii?Q?BVoCdfnXF8yDFNr6CSf5p+ZUjEog5/XbkhZS37n9Emw1sblucpYxokAX5Ab2?=
 =?us-ascii?Q?p5I0bR3Cl+vtAyMxM0WZAQbk+sAh/BCUJbodpPtnEwvHFB41ast6vyP33Bqe?=
 =?us-ascii?Q?ApacLciDwDnrm7P+rO03hfJ08b0Q1WmtRCYbwm/+cAQzbmP1SKNnC1r8ruMY?=
 =?us-ascii?Q?Wdslhg4rSfSvIVd8V4fTtKWNHo0M9BN4nyCXSGVedxyPE6AaXileXNepBQru?=
 =?us-ascii?Q?Fzauvtf+jp2890zhI4POysB4GTWwRcXSD/Way3dW4fychQbvnBj+UELSjIsn?=
 =?us-ascii?Q?dYqMcmsCk9ZE1N6m7Cik/3n6N46EnuV5/G0L/n0kmTEwhIjHrEYNJgQwzry9?=
 =?us-ascii?Q?KOYGVBq24vjnWzMsZmrshLRpa3azFUIoA/bGKRwsTtiYmWCi9KB05DuNnOjA?=
 =?us-ascii?Q?nt1oHvzoN1S7OSJUNY9VJC6WjyL3nhgg35VnR/v6I8st+vgu0xZWzn4kQx9T?=
 =?us-ascii?Q?XRks5NlCPUTQLQV2ShoTokzzQJ3ocMJYDAWw6KCzE2PE9L5ytmnJ2mQUDOJr?=
 =?us-ascii?Q?JlRbZNaFFtf0Tu+TX/oV4bsNcUJCg1lBLMWkBSnKvmttXCEjer2jnMGzt4UQ?=
 =?us-ascii?Q?j4AyE7FhC5WmqE/m8XqNBMIB0ha4f65O12FOSR8eNlU4sfCcsL8hw3Mmqy9J?=
 =?us-ascii?Q?i3btV8n2uk5NvCDCrFPERYdlDhzSxRIoBS4oY7ubknAJqE7fJk+x/p7iivoV?=
 =?us-ascii?Q?NSfPc1EAzh1dUuIj65YJFOBEkB50FdJo2RuMrVwPQhtD0DWHKjHojc8qDLT4?=
 =?us-ascii?Q?9gQcJ9/Rl3+yHwmhITPtxpFeXOEBYOXg4HGxduoc6fJrmRoUoksZRAtLLS93?=
 =?us-ascii?Q?NoAKUUmEyLqGJZ+ApeaIYXdqU2ZnmoANlXe+0eqo7td7nAPpP6Ov1XKyx9ME?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1707bf7d-c9f6-4ccf-8877-08dbaa61686f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 20:32:34.8429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Tr2cS2Fk3vTkbcD5qWQpQWa887s/ID+roPwLpnxOa3pugPKSZ2KPZUfqFCmdwLhGHwReFMtzZwnX9f8wJT0Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

On Thu, Aug 31, 2023 at 01:12:52PM -0700, Dixit, Ashutosh wrote:
> On Thu, 31 Aug 2023 12:55:14 -0700, Rodrigo Vivi wrote:
> >
> 
> Hi Rodrigo,
> 
> > On Tue, Aug 22, 2023 at 10:31:06AM +0200, Francois Dugast wrote:
> > > Hi Ashutosh,
> > >
> > > On Mon, Aug 07, 2023 at 06:31:50PM -0700, Ashutosh Dixit wrote:
> > > > OA uapi allows userspace to:
> > > > * Read streams of performance counters written by hardware
> > > > * Configure (and reconfigure) which sets of perf counters are captured as
> > > >   part of OA streams
> > > > * Configure other properties (such as format and periodicity) of such
> > > >   captures.
> > > > * Query associated parameters such as OA unit timestamp freq, oa_unit_id's
> > > >   for hw engines and OA ioctl version
> > >
> > > Please document the uapi structures, not only their members. Also it would
> > > be nice to explicit somewhere what OA stands for, maybe in the commit
> > > message as well.
> >
> > Besides that, we need true API like documentation with examples showing
> > how this is used. Please!
> 
> Sorry, not following. What sort of "examples"? Are there similar examples
> in xe_drm.h, could you please point them out so we know what to add. Or you
> mean examples outside xe_drm.h, e.g. in Documentation/ e.g.?
> 
> The IGT series was also posted along with the kernel series here:
> 
> 	https://patchwork.freedesktop.org/series/121082/
> 
> That has plenty of examples but probably that's not what you mean?

I know we are really far from having a good API documentation in general,
not just in xe or not just xe and i915...
But a good API documentation would target any developer willing to create
a new user space component and use that API, even without having to
look to IGT or other UMD drivers. So good examples in the documentation
would be important.

I believe a good example is the PXP doc in i915 section:
https://docs.kernel.org/gpu/driver-uapi.html

> 
> Thanks.
> --
> Ashutosh
