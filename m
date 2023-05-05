Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E599C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 20:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6038710E08D;
	Fri,  5 May 2023 20:19:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB46610E08D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 20:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683317946; x=1714853946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K1iuIj0OtJQTp/EIKege4dPiNzHalGphOdJPo2dJaug=;
 b=SNBI8MDZnqMJ18mH3HFlto3Rvl+BLe+uG3QLo/NLYwMe+ViLivFSlSq7
 BdxTzFURa1KTVx8qviMtgy6jkpfL1bufuCRJDZIoJjmxJlYzBSjdg0B8/
 vzq1IjM6yaCOblfyM52QnxNyWLqNMlTMawXjwbbsSPJ/9TgJ9UFKlPIuc
 uiedCJ/rU4SbTgfpbQmVQpR9NOMu87RAsdetUbRU+nMf/nSeAwMLiKGx9
 Sm5zEvPBUCxN2K7xnXDUtycpDf3M0vs9RwnrwvGtnmp2vQi2cru8j8s39
 tJHWEVio/Ihqvvy4L4r6qCw9SOKXaNN8WboX27L7x653sMoStZ4E8XznH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349331263"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; d="scan'208";a="349331263"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 13:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697732833"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; d="scan'208";a="697732833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2023 13:19:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 13:19:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 13:19:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 13:19:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrIqwlTzT89S+I6kbCPvRQ+CiMktywChcyJ8qLPbjZ9drMwzPfsnXBmwvSt3GNqpJcEw7aKuATSfz31dn7LL30KIrG5QGRIRRdF0boxUa74r32jivZEme3ar4nQX/rozwLqB04/Dwg8EFizSvhE4A71cBZKWhN1db82axMR6hh7rsratAKgBLCc6wmYPI3gae2Ig8QkswIrRD9nP31c6YIUCAYLzHP9x/NENm0eX2UI1iBHzz8volXd8qC2elfATl3QTzALKSOcBf1iU0P7qw7yKo4y7Xvu/H5aJc4xlTlr8duDIQ5FzWNBPLSe3cLJcFiacjXLDLqC1/gdgkyjvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKL+YugUCkEO2XowYOA188vymqD/DGiC1PWvKZCJErw=;
 b=HghxKDN107VY3jCmPaYi+VF13ZnVRTiB+GUkzFxXeDaspMjWKCmzMy7WZkXJkxXHnHeWYU03vHSoaJt/HjqCGtwKLVxuKgdLWa/DvLM0ylcSWz7v1RizzlG2/XuQnwl1/gHzssHTDROWNmmKeP9lwp/uX26yNDl+336X+ld+170KgXHjilCCndRNEk3URryMajTQvc8Oc3fJBfT8T/06czKlwldmsTUfI+xMWLnZL3KMOUO4iXXd+zvjWVeNEOMVyDEQ15CvkLjDJ1C78K8Bz9sqKRbkg2u5nYwwoptKFW1PaLUXNJdUc7oLJo1l3jolGvoOu/3CAAgnl9/QU/f1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5544.namprd11.prod.outlook.com (2603:10b6:208:314::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 20:19:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 20:19:03 +0000
Date: Fri, 5 May 2023 13:19:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <rb6qiiaescamenz25laijelzzqfhofdo56ytxj5alq56go3otd@buqa5cgiwyrx>
X-Patchwork-Hint: comment
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-4-lucas.demarchi@intel.com>
 <8fdb51d8-0626-0d03-2080-b978f25cfa3b@intel.com>
 <srdmqn6iwo43zl2m556sqfjqi3dexy3n7hvkitzada2mfurq43@mbeffvffzo36>
 <ZFU3TuMVemulBQrX@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFU3TuMVemulBQrX@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5544:EE_
X-MS-Office365-Filtering-Correlation-Id: e99ddca9-7bf6-4a48-1061-08db4da5f80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u29wnckaMh1yKOJTPU1r22Hkzy5DFWn4HMVPFEB9g5E+6qLqTVE3UFZgBdSxvmn9w9ROOZ2jcBj/oQu4lVc1fEByWpG04kwLN1owntuziH6NqAJQLUZNXqdDFjowFOATl/gbyI7KGC4m54PppgVNv03FTPyqHvc079fb/7vCmEPsnrnb6yV849rif84LdETVBWE85vjU6tJ+htNp+QTlf80yoGkFHtDtEoonAGulYy29eP61wT9urxix1RBTBqfasriFKeRRgDBMqTYgSpv4CUDrs6DzZdo54t5NCoBMYvxmpcbRHeGZmp6Ib4iGvAmv7WFtEB+3IfTsx2107cg+toRWE6g9M4zEdh9NlTYvx1PodWC+UelQPDL9miuT7DGA4QaIX1z3/lN+y4y3sYj7pdfNbRxPpP1bE4Y15ke+puZjpg/0lj8/G7FOeExLVo441Ya6Q6w9mnA5CgIgvsUJoPPRozDi0u1NpCJOzNA9/LByUu0FFjof8HHt+sj64fxeQuO+rayPHRgFiIRvZ7EBJSm5hHxjq53HN19KbKMYLkK75ELBjMbKxERexyFzcAAP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(86362001)(316002)(66946007)(66556008)(66476007)(6916009)(4326008)(6486002)(478600001)(41300700001)(33716001)(8676002)(8936002)(2906002)(5660300002)(186003)(82960400001)(38100700002)(6506007)(53546011)(9686003)(6512007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0tJdxwtvqBolOJ+ZsHX5c0X0wQ5v64iBI3KSor5PLhMsO9fjo/SgLRCzivBA?=
 =?us-ascii?Q?6HyBkUNWFO4dqvOHdxP6coOHW2sWmSN9S9y06oFoBTdR/u1Q00tNk86jPT8v?=
 =?us-ascii?Q?RVrvYs6qokHVwCgHwdswN1aBLqgFxiGRfLYI+JGdcoFT1H8TCdPbHEeyVoHZ?=
 =?us-ascii?Q?9nk1fY7+2QQ8UJ+d02zpIRiXpH6e4bYzqKPnF9pWYfT7XgQMchtQv2bqnue2?=
 =?us-ascii?Q?EzdYyZbxWG4vzW0DqpAo7VLbOy1p4uZHL6epFz+VqA3klmddufXUlA0U64Ok?=
 =?us-ascii?Q?oOBPgBaMDaRjYPDkXXcxlglqirptfpDwkNMCF+dT4adXQZL5JockTcyRD2Id?=
 =?us-ascii?Q?1sJYPPq3qnAOxZLucoZ5l5DVhsq6xYqetXo4GlZPjIwkdDdrQNZ80FO7fJdt?=
 =?us-ascii?Q?y06JyXC0H+I2ga5uHhok7+dO0i38YO73BMmZJRo9X7yxZCULYnNMFkE21fEg?=
 =?us-ascii?Q?LaTxzUwxbAgOn5xh6DXrk3rLxdpKO2Nti7/3xbbsU2FzLTcOai/hKvEGo59b?=
 =?us-ascii?Q?G7P7ZfZEGjSVTByWjrifgCYXhMTYCdFFEZHf2zufgDllYKMsAFOdb3Jdf5Y1?=
 =?us-ascii?Q?o3agYqRXeZuQU24zDTkeGyNltDK2EMeaa/SifntVAIJIen1Hw0C5rnSRuIzO?=
 =?us-ascii?Q?zk5MFA33Kyr01jlXgzIYKxaDipJ3cnHrQEFyyLGGZ+k7/fq3OyPmf6myrpk+?=
 =?us-ascii?Q?gEYjvPEzVRcniveOKEzjr/hPzjBlP+VSz+35gpWHdtI41wrXGoDIRF2zOz0H?=
 =?us-ascii?Q?Rvqbd+GEi9U8Y7n5gxNMsSdUX5NeOIUpSdbXgZAw7TN3jXNZPkm8bssiMlE9?=
 =?us-ascii?Q?ypgQ2wJE215JjJR2gdaB2vyC2UINHRDVJWaxpIeJrwl1Mc6CSTMgr9ioew9p?=
 =?us-ascii?Q?eYJTsn6ORnTVYubHe3IhLUyKXU8xcy9mxOyxmg/YNBmA+Kdw/ng95ATjfIlU?=
 =?us-ascii?Q?15WA9WDiTkXNcL3G/C2jEhwUhxjiMI6eXcrqRzNcdkpoVDWOJzApX628dlXe?=
 =?us-ascii?Q?1pt/Aal3iKI+VeuirnR5veL7pYKyblhXqwTGmh7UTrSdmejTD7Q2ojW0UrQk?=
 =?us-ascii?Q?omlMvu2vv454M0eqtM3UxPDvKMXYAzwOw2WBWMa8AO1sBbDlNEhTPrF9huRt?=
 =?us-ascii?Q?3jKnKIS/7nJds36HZNcaLoV49EBl9QzcBR6Y/i1VFL4ieTcaHOCHS/GXMRGl?=
 =?us-ascii?Q?rIReemoU6HMvY3UB08DJvPehAC4gYjaXQ0kJQRuHQxdcyD6ID480DIRigDdk?=
 =?us-ascii?Q?dFdXaIfKt7p+KQhRoQW4jPnMvemLrSNjV7PUJNPJcMk6nJ70MwmXr6grO/OM?=
 =?us-ascii?Q?8tLustidYVC8E2YtmJVWNZWGDi0n2oXOTKn0NLcld1GWGPMwG34Q6WREr0zy?=
 =?us-ascii?Q?chvHkXsrNS/EyEudpF8sRWpASdwSELiDgDTfiX/ZbaI3092C/h8W6nUXnt5n?=
 =?us-ascii?Q?hNT2p5XilYip47Wj0AxOdqLiYFD4NdWekpduvlshr9g8DQrZKA7tb7TsdYA3?=
 =?us-ascii?Q?QD/rIP2ZKpt8fN/HnYZ8D4Q6d7yKReZFuuJ0o/uJarjltG3wnSl2fWYd477r?=
 =?us-ascii?Q?knEfEeCSJ/MiMiiBnCChI5n+dGpLu5Y92UB0nbezipo5SZMeXmBAX7e5myWs?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e99ddca9-7bf6-4a48-1061-08db4da5f80f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 20:19:03.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y/D0huWIEac0Bc1pewwWGKgIFLv1aSz5BTSWmuTz974P6SXDqfw+07UBOwKD4VKkVClc0ER790rMHqykuH1KgF1BkS0/lRXP4rj21MQq+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Use media base for GMD_ID access
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

On Fri, May 05, 2023 at 01:05:18PM -0400, Rodrigo Vivi wrote:
>On Mon, May 01, 2023 at 08:07:28AM -0700, Lucas De Marchi wrote:
>> On Sun, Apr 30, 2023 at 07:47:38PM +0200, Michal Wajdeczko wrote:
>> >
>> >
>> > On 29.04.2023 08:23, Lucas De Marchi wrote:
>> > > Instead of adding a hardcoded base, define GMD_ID() with a base
>> > > argument and use it in all places.
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 +++-
>> > >  drivers/gpu/drm/xe/xe_pci.c          | 9 +++++----
>> > >  2 files changed, 8 insertions(+), 5 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > index 4d87f1fe010d..da7b6d2c7e01 100644
>> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > > @@ -8,6 +8,8 @@
>> > >
>> > >  #include "regs/xe_reg_defs.h"
>> > >
>> > > +#define MTL_MEDIA_GT_BASE			0x380000
>> >
>> > maybe for completeness (and to avoid using anonymous 0 offset in other
>> > places) we should define also:
>> >
>> > #define GRAPHICS_GT_BASE			0x0
>>
>> there are very vew places in the driver that would care about the base.
>> Today the base is automatically applied for anything using xe_mmio_,
>> just like we have it automatically applied in intel_uncore for i915.
>> So, we really don't want to change each register to receive base as
>> param.
>
>I'm with Michal here. I had the same thought when reviewing and just read
>his comment afterwards. Although it is rarely used it would be good
>to avoid later confusion.

rather than changing this to bring the final XE_REG define to the
header, I think I will just leave it as is and drop this patch.

Just rebased the series and end result looks ok

Lucas De Marchi
