Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C321109E52B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 01:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF93B10E8AB;
	Thu, 26 Mar 2026 01:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1wBCWR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4122B10E8D3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 01:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774488260; x=1806024260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4KZ1eFMqlq5Q6/LHPsfNGag3icuAe8TsL4RPABWctpE=;
 b=a1wBCWR1Ebndnc+Cxplk+HFn+DHr2EG+V8cnH+g9KxyUWbzT1yYZIuFN
 g2akT5bOdh27fhcQw3TZbk7qjHirQICw++elG6p5/QIFFqEXMeOglVILf
 SfaBrGi8iNS3S33tR9x03G7lDNvXanphy8BZv01oQkjJPQeb8Q4AloxPS
 bY4D3jvX7yvaCpWAnH7zB20bh5ITz3xWjsZZEUdusUdmfZNk7luwZzU6R
 ifaFzZHJvGL4KssDg4a58SA1j15jNJsoGJZuxBgDDB7B+XHvQPz3iaQdT
 9mQKa96moBGAwJ3ptwBRk1bUdfUWJUkQTPNeB908KDmhzyXi0FxG4ptMq Q==;
X-CSE-ConnectionGUID: b5cooRO0TBmjCGBCsqNM3Q==
X-CSE-MsgGUID: anUlwLHkTaGBlbqIsjAURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75501430"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75501430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:24:20 -0700
X-CSE-ConnectionGUID: cnys8vABQyy+V5z90ypcuQ==
X-CSE-MsgGUID: dPJ3wwqjT/OJnDnGBRi3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="223910127"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 18:24:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:24:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 18:24:18 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 18:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWwD1F7atat6eWp/ryYK2S8U7EKTYuRj2fuj5QhWq9MXmCyIFvhrUeaGIRCp/ETHvIhwjBEk95uxd6LYED6gv85iH90z6LiIaPPcag5g+RQeXhVYw2s10GN5mZe9UUn8ZbnMT3z3eeQCmpy7HBvhpJZ+PChLc+ipj+QHar+QebQycW9X3FGZPLniXR3uvEeBwhsQ0KWtFtASXcJ5HCYnjBQyMP5s+Xow55Dqt20Kvn+9sugX552rrpQ3eAaJQ8sxaI0S31BpH1SrfvHfBfaAdPgKR/uRgs0kaIa0CsBpm/wvLyTEilxUFrOOzGjcaBIYTalcT2aAzYRNvzwYa7zdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fHvrhsfUqn9R9QhRmCUW9cOvT7jjwqXhtRKbq9GehU=;
 b=SjNMHovTJsSl7lRO5x1Z9lcbNgKy9OROwtRJ1OYdFIdSL3Ox5nJTiMejdIZM1Q/WBlX9TvzSpcr5BdEaLsRftmA0QjU/WqKg5u0PZ5KySON7oUbek3qMt1gNhvI4C+mj0EEwD6LkAWQV9GGA3nwYSGWB1A1M0CMlpEcifqzjKQj48ftWDq/RTtYkOjglziQ2IP1F/MlCma4iUgBOB+3AhLeg5A1Wv6RI5zeWydMGlPmtJXuAzehl9l9NeAVX7rRZYh1ivJGpTYrl0EjjNBrX4uJLI6QoGPo/Ci9xyAgJRA9/6jw3yAlmyCJ0hIpMBUdIhC/6x3v5f7c5QQj/6b9Mow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21; Thu, 26 Mar 2026 01:24:14 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:24:13 +0000
Date: Wed, 25 Mar 2026 18:24:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe: Fix confusion with locals on context creation
Message-ID: <acSKuxnrg/fRA0/y@gsse-cloud1>
References: <20260320145733.1337682-1-tomasz.lis@intel.com>
 <acC9xK1n_2Pgl_Wh@black.igk.intel.com>
 <d32d1ccb-8332-4680-91bd-f7216cb30b59@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d32d1ccb-8332-4680-91bd-f7216cb30b59@intel.com>
X-ClientProxiedBy: MW4PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:303:6b::10) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d22a486-309d-43f9-dd39-08de8ad663df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 8wlRnKyObk3fdk2Oo8VYEKfxsyS/QEzpFVdE6tr0cqEF5sXXQT9HDU2GIjanUein9mRxh/L9/sg/bFLdEJZq3TQhK0AMAFAckxvg5hkKX0Bd78WBV0tqP9ajJuooyy306BGwcXfG5udsWx6DNkJA4mvrbZyDmXzkdLbPFXbec5M7Os8J3z2ftl69Ojk9ww8Z7TTCrLXJpcCN5udNlBGillz6xBGR+6AjaM2LwYGJz/d4S0X3h92e98VT4Qyeg2//yeyW21A7lW8cF6pEmqicYWjBewuP5QY4I+Nclnso855IoRkCiyrqnXG8gRV2OGpJltHdYPrSaj5qptAstfaQpWaP5gU41AGUwiyEO6T7ARvf/F+KCVr4TJpGRHrVFxXp2WbnM4jDHmGFAsvgsaMaConQ7Zf4RcdAmqtW4ZyVcaStWy3mEZPxNFF1NJrM5+FaPtWHPi5Ko7fZnX4Dc3R32i1diKrvXez/l+gTcvtfKsnUJYGO8P9BQwk7lQ+tD8Brocn09rC/Ob0PS7dTtRnjjRKwT52wCqXBr4h8AtWDYAw5uZxxC18UiF/7/xPKgoF14YQ6FNKJbqzNsE0xLENFyYsxoERaJJc6KXiUX7AKh527EMG3hAt+fOlSSWFD0grkB6mu2AlnIW7MfvO+LeaCr2bzjTN3Ig5G1XFJ7FNYDxaCKt961XL99FRMzW6Pq19U2/nYQgMi2gr75okJOV7k7Iu+qBDFCBNG06qBSTE2PzSFDsjJWjEZ0LuG5Qw1B7Jc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfyLKgpQ400tBoUdAtrRhPDnYWLMNQ0ndc2kmaYhPYizVANr6VLsHCSWIgdx?=
 =?us-ascii?Q?+syUUfHbWdXZ6TiH8frx5k/7kKszK7ZlUpzmDW3ukKOSm3q5gjGs0UqQPlCZ?=
 =?us-ascii?Q?IVHaXBUEZEl2gTrsHoAaHqBIib9D9JNCG6xaUtfiO3Xr0KsDuaM03Ry7DZB6?=
 =?us-ascii?Q?F+AxBHDZBa5sHS9Tt+K41MKU5blSKZ1bEgxNH0FxgJSnaKmK3Rn5A36/grZ+?=
 =?us-ascii?Q?hT7li0/0u8JncRgOvpkFql87Fv+qETSH2RDXI3ETqBcfAHbik6giIG9+Rz1S?=
 =?us-ascii?Q?IsxnSYbDz3Cv10MBRYrQTsRJ09NztQrklZqfJMNSluF58oN0o50cJhU83sqS?=
 =?us-ascii?Q?1PSuOTKA84b0sdG1ZQw/XOztBkacFVzqMCIThM/kL1q6Ih9RJoJHLnwaYDJ5?=
 =?us-ascii?Q?8fcxiR150X30kOJfviK7fYTHM3e7QvwX9sJ92Z6tHnB1DKXc0/ys1kXs4luZ?=
 =?us-ascii?Q?wQTj82zF3/LeCbcUYH4LBAHS3ShyBwXjJJAernakD9qyzaDTq8wVjjp9slaS?=
 =?us-ascii?Q?XJYQ8rO4xDKOSPG2khabqSsFhTAB8tdww/Tc1ealeq9YudigrsWSR3m1K88E?=
 =?us-ascii?Q?5lRPzA9AwPDTUY5e+6/FVueTJapx4jWcbkrqt67LiFDPI90n5hylyBIPv+P/?=
 =?us-ascii?Q?sWYOPmgLI+ggp3N/sw2OjjNtjzprLeOCRWGOT+4uLY/HAPfKzaldw1GUoO7j?=
 =?us-ascii?Q?VJ7uiiIcr9p9hrXxDx2P1SQC6AaTHKM9b6Ybmfin297lq6Z299RetC2tjesp?=
 =?us-ascii?Q?zzNu3IIJ+SD3tNUbSpM3QRv8jiuWMcFaxB4mCuK+wHTxtc+h4/WIqvqhB7Ky?=
 =?us-ascii?Q?+YgdBR1C+JiwgpWeSG1s4OjLcYHVV7S45/fhi4VOE4Eh7tnqa5fsssUXw3ON?=
 =?us-ascii?Q?QK+Oa0Iq6tRV7WRt17/6a8uRUGOgi1f9NVP1cb93I67mmpvXSsls3tenZf2e?=
 =?us-ascii?Q?0jonb58UOd+W3U44sKBzeYwxlCbRoCosGnYj2jSoaIgHxpaYSbCDICQTLzJ+?=
 =?us-ascii?Q?Ms9fAOLDre6WEbil4SYHVjYopO2CRWg2fYCKfZp+yTlAaPtTlfJ8xoo2BTwX?=
 =?us-ascii?Q?d4x/Qc0qWyPbq6s+YlDw0Thvv72UX2VUV+bg3rPh7EAQpV2vDe5UfF+O+br6?=
 =?us-ascii?Q?8+IvLlZ9rG3ysRO1WpN50B1/6WVmwJcGJpzdkdDAp5TqTm79vupy6b8mWol1?=
 =?us-ascii?Q?HhEZACL59LVgiXa21tk/KqYYBOj/tyP9Hn8t1PBXKhm5m71JUxu8eTckLnsk?=
 =?us-ascii?Q?7Yy6bKA6boFq6uuqt1e0mxeYkk7eCfxKS2TJyVNCWIlXLeeFdFuPTcMXGrMK?=
 =?us-ascii?Q?WV2moSAeMi/yJIG4KfbL1FgkeNy2CT+/R0cZKuLUyZOVSNtalkKiBA5haI7T?=
 =?us-ascii?Q?CttHRrYcwovojM3p4Zta734kA4Y+F4bjjvQWbjmkTZHczuKvIGrFlOYEkb5r?=
 =?us-ascii?Q?4VqpHhf3UdvfZTTql+6tgRUFBbKyKBCKaNBYmkaPhKBjX+ch2s3HxkkaoI7f?=
 =?us-ascii?Q?YlRm3lSN/N7ferWzM7kqD9oDHmZvL8YjE2F00fP1HtH3XnBfNrslmJp8byAq?=
 =?us-ascii?Q?rFcvL0NtuN2uJl0fWfHZcvIhM74mdgpgi07w5Dmp9tquOsH9QnSaRETEZ1AE?=
 =?us-ascii?Q?sZHTUu4Fb7ADZH2pLeODdEtus0sGfAB2LZfJ7oEalVtswpisXFg0zASmCQZq?=
 =?us-ascii?Q?tyjkvzLIycI7tFHUz0Oo53r2tLWfmRlNMRGzdKQbx8Pjn77T6PU7urVfmf3q?=
 =?us-ascii?Q?sWwWrfvB9/x7NgLW8Pb7guIESg2jvBQ=3D?=
X-Exchange-RoutingPolicyChecked: gyPLtnAI7bgeZwdo5F50ihwO6/r1hg6TkgE4jTS4giWhc8dkf5pLGWZ27POp0B/hyf53hpQzsWS7DzGiCwzbdpfttmQ7TyAEsds0NyFJsgb5r9dfxQ3FQeDFoPNNnl3qbsCYmu0jA92FLSl3dngxOowImQXSYppHD7TYYd0TS7GSLZhZWUhlDPO9+FLBwtPMJH6GolMee10uOMXljjkMfyOe9/mVgtv9ERrb6FnxiT0vaePBvVyr2g2GNRu8Zt6WeE6MehlsgdJLWM8MOCqDNLCU3LE1F8z8zf7KevdHKsSPmBrGsSElxMtGGR/TXowbBLo8mUl2JtnZbsg/OcpvaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d22a486-309d-43f9-dd39-08de8ad663df
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:24:13.8314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkrTfXcXfDZA8lBCN8M7WuzyiF9ZLy8r8kCYWnh0ny1AETVvTAi9rb2ixPPU32xtNLTDAcIPOhRLuxChvLPdHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

On Mon, Mar 23, 2026 at 03:02:43PM +0100, Lis, Tomasz wrote:
> Thanks Raag.
> 
> As of now this fix is not yet in drm-tip.
> 
> Not a problem, as long as we will get it eventually.
> 
> -Tomasz
> 
> On 3/23/2026 5:12 AM, Raag Jadav wrote:
> > On Fri, Mar 20, 2026 at 03:57:33PM +0100, Tomasz Lis wrote:
> > > After setting a local variable, check that local value rather that
> > > checking destination at which the value will be stored later.
> > > 
> > > This fixes the obvious mistake in error path; without it,
> > > allocation fail would lead to NULL dereference during context
> > > creation.
> > > 
> > > Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
> > > Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > Already fixed[1], but not sure if it's landed yet.
> > 
> > [1] https://lore.kernel.org/intel-xe/20260305184519.155060-1-shuicheng.lin@intel.com/
> > 
> > Raag

I'm merging and pulling this version since I've RB'd here.

Thank for the fixes.

Matt

> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > > index c5cfd8f75a94..77cd57788837 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1607,8 +1607,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
> > >   	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
> > >   				       ttm_bo_type_kernel,
> > >   				       bo_flags, false);
> > > -	if (IS_ERR(lrc->bo))
> > > -		return PTR_ERR(lrc->bo);
> > > +	if (IS_ERR(bo))
> > > +		return PTR_ERR(bo);
> > >   	lrc->bo = bo;
> > > -- 
> > > 2.25.1
> > > 
