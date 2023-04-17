Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCEDC77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 17:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2A10E56C;
	Mon, 17 Apr 2023 17:35:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9010E56C
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681752913; x=1713288913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nCM5TVa0Mi5JA9HHlED5wvm9g38qq8Kr0R//gDL3qcM=;
 b=Uw8PVpN1JXolr+YD4N3n7cb2szkEOzUVtoxNwYqIfC7taUvqW/Tx90dj
 DFRN7eIiXGEVPA4xSxsluSHDIkMEZd3vKXu8cmqkRN5y3gvi7tbiS2LoP
 f5+FCvT5LNJJEh33XHO0n2dpKwHS7k4ol289DzKrSsARsq9UB80dj1vlY
 GRa96Wf/I8JJEMw/Qj2Vp7/zXCGhhJk+jrE43+pxxRSLhSePYOKICk1F6
 kJi+YaPj93Y0qUuQrr3FygUu3yyy5xoftnakZ6KryjFxTtB44rJiCTgxD
 pnm/6YL5aU1h9b6vU30Y24llxUaAq7AiK160GLB+owg9Xj3xWbcr5BzLd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346801795"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="346801795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 10:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690743526"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="690743526"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 17 Apr 2023 10:35:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 10:35:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 10:35:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 10:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gC+VwQ0pNx8RqAuFrwviPj17ctQyH54ZtLjqcg6OhGbLO9ZcRXXu66yAIR921sEfhRURGoCJm+hw0gIy580R3AMvgiYotYWWL+Lt+brfa5RfojwvekUIwdKUbOrIOGlaGsi29SSlNAqL64TkmI9RwtI9F9lqeFPCl8pBE3x8y7xRSbnbG3U2YIRJTl4lFV//pWuIYa2K1CEVPrsEurkDlelS28B38S3Rq/mXPbsBFpJA7x1Pwj+GCTM9MNL/SBeQtZTbslhnSU6GWuewP/tciOsWDCtgTKibkyq0NI/VQ0bfp0THgDgcntCn05TI4RaY1V3mgr0U+mzT/rBHIJqQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb6iGvfI3kBYDpOHi3agme5ih9svSsnqP+aq8ib3mkM=;
 b=MhNXcGehtRPFkxF97zoEnpX1buyZ1ngT5O+UpzM9qaprZslAm8tWMX/xCDwsYTaCaACN+MgJyuyTx/A2JobMvCLpgzlVQiehxhXC+zEnGV56m1oCGtOMGQwDlm1xo+O6Lnx8qeGS/wXcYI76C/2qh0tgICgtN34kuE3xavAOCXUsdofFzuEoq95rHZQk9D2GUuKNGQ/8CpUjBcrYdTBOOmIfwXyRIyfE5DNQnqDRNX9XduSUpicp2SPv31+RxIVeh/0ZqcdYaO76srDC+rU8Ye72YZFPacr8D9vOTvUuV1gBOHC1muCT9ZHo9Lr1Re+Ib+uWJgyYRnshmBCYIPrNOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5172.namprd11.prod.outlook.com (2603:10b6:303:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 17:35:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 17:35:09 +0000
Date: Mon, 17 Apr 2023 10:35:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <lyp6z3ccb65wefjlt5tanzgyxh7wil2qkcznsq6hffoym54a3n@hs723htyt63u>
X-Patchwork-Hint: comment
References: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
 <20230413142749.1097229-2-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230413142749.1097229-2-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d0f7db-9cf1-41da-741c-08db3f6a173f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jlcVBWP8wl9QAq0SbAjjNW3nj7Q3IejRt/dYo8/eLD8VWkRoer6zpQ6hW9cXN3nMwc6ty3ulyiY4K5qZO7aEMjxwwr7lGTZvq1SghWR7cjrEdmuVtk0znrGsbFNyK3A8VEKF20ydCOATgkqNRGaAL00mRTvPf2a90vJYHtofg5eBsqeOaWK2a+SWOkoWlJwp3nScuQdy8pRnpRfPfkAihFRRziUDXjyhEaOjn17bNB+6j+dXs9Plt5c8Blhs69ZkYOBbysjTEHm1wsO3xKl4bNRAwVExQ7hq/3Hh2l81TdSfxEthfV40u+g1QSZiUtjYW7mcMAjQ5KfsQpJRfuRaNv128T/dbVfx5XdgL+xS9aFnLQHM/A+EKoIl8PrEuBn8EraYpx6Ie+IWNopDhLF3DUeUcO86yjXqSAMWt3R+RNThrup5An5bwwjl2BYCOeAxEz7kR2Z3NkXB4Jw3te1AyBEPNjI1L33X4NRbkz6Csdx0uM9hzaWFnx2ZefB2p5RFWsowwjMiTaUTcOtS41vzGQOp5vOLNu9WZPQRXzLljClKACh1SVm/kQXG4sbr6W0E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(6916009)(66946007)(66556008)(4744005)(2906002)(66476007)(4326008)(5660300002)(8936002)(316002)(86362001)(41300700001)(478600001)(6666004)(6486002)(186003)(33716001)(82960400001)(26005)(6512007)(9686003)(6506007)(83380400001)(8676002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UAau2CCKvMt+4/TcV6L05Xc1sg762Y/brAevWxyAKpJkImPiosL/RXCr/i+o?=
 =?us-ascii?Q?zMqsqC8ynTkfqqDqkiK56E0uHg6H3QSpi2eTT/qriDNztqdiXkMXnMdTyvKe?=
 =?us-ascii?Q?Tvvrx+rEmN1RW4ImFMqaRQNZ/9YkGaAGtEwWCmznkpgc44Y0SuXK9dzQ76fL?=
 =?us-ascii?Q?Wn19K+NbEZ0dHtni+44AcEITVaxsDhGXi7u8J9B8aaNmGt2FKuvY06+nfAqJ?=
 =?us-ascii?Q?H3zzlQ6EOFHNkP3V77+yJtEoSxOWvxwUrfObxhEWeWQohVakPxEI7p6q/5zw?=
 =?us-ascii?Q?4cT3YmTt+8ajnGsGdltkRiKoKp03Do7kY6yZHPbq0pLONwN8WEVEg6hKJFrV?=
 =?us-ascii?Q?8GwVL2S4umo98wv3hODMG2GEWNgGd/0+HK9IbbBZA4kHmFLFkL9XT2PKvdpo?=
 =?us-ascii?Q?XvXT5Hj5dSTbWgJ/qRYw4UxSzTw8yql76gWLAAtjsxDQ8MiJWi9kQZffh9VX?=
 =?us-ascii?Q?/vqFWRsugJnw5NNU83C5fBuNHQSh/MIM+W3ndY1VKRlF3lxUSOShoYnE6gjv?=
 =?us-ascii?Q?/A2nR5JkMq5XuzOESiye7eMRzenWo4XqVnBkfLK0tP1JNnX7Ge++JC7FoE1L?=
 =?us-ascii?Q?ITPlLJyOczJ/Rn3iXz2Z6c8sM2gcvd1v4FnLQENSvXtqLUD52txfIA0LsAkF?=
 =?us-ascii?Q?KMJaDtCfWDgLQOjSZQswrCaFL1o2vULVu1KitGncCVi/aVxNPdbYPyJ4gkb7?=
 =?us-ascii?Q?EmTmzCIX4efw3CRo7xQ4sZ15iJug5IMuPWRCoV0bAQhRiNuISOmjTs5eFWPu?=
 =?us-ascii?Q?LPMICltgdwGU16gX6eD2ubRkIJe/rdJ1+qPuVlEqJp9rwh99FBtSVtVw6Izr?=
 =?us-ascii?Q?9DrbKqskhnyr9I8/sH1+oABcCybOHoT3jOcZhd3w7BA7Br0NK1OVJaV6F387?=
 =?us-ascii?Q?L1vSY/WbgzyHh2mX0RFVgJrIDeqEklGho5H1U5zBH5biL8ev8Eh4Oy94sC90?=
 =?us-ascii?Q?XIQqr9NOd/YVqi3QC6v7cXYM6uqAUwM0rgcclF76mQf0rFmJsJnYW5snXt0g?=
 =?us-ascii?Q?j0AzluwiCb9rkk1YbCwZkOuC64ouGoV1CSUSviDW+92RvHFPEX71BSEc3Dgb?=
 =?us-ascii?Q?NO/Rd3ovfCL3QdgwvngPttpct7GqoAHh2aIez7k1TDVjtG4tWm+3G3Ze23h3?=
 =?us-ascii?Q?cPY+lNWJRZAyMHj/ouGnjADjIEKMMrMYjCRToOhs5uBHgTF5RCiIrqqcCw9w?=
 =?us-ascii?Q?vGOmFKqfEuOwHEIgtMlPih6imx+u4tPBIaSwTpCaCucj715yvrGn99SG/6V+?=
 =?us-ascii?Q?nmaBwZdBH5nI+6FN+f+GS/A6GE+iyI6B4LCnvUKo/00KgLGZCfpf/iT76h+d?=
 =?us-ascii?Q?AK7e6uEu5X/UTRT7go8EXQEV1ZO7ePFd0Nq85f8sKELwflG6scZuQgTUkR1O?=
 =?us-ascii?Q?8qZ7h3RcYj50LJgttwt/L/q9ZESEv7ZS+tgROnfuc/Hm3tI3M9ApHDYxsvEr?=
 =?us-ascii?Q?mim/14OrNz+/GeFYx9l3T88XS5tW7iLOfeE4s/T2ZTtpk7FLT/LDo/9AtmOf?=
 =?us-ascii?Q?F6pvVZvwWHao/37EVdDYsMSjtKa6lye6TdKi+ic37Qyifcr2TKaXI0KxuJZu?=
 =?us-ascii?Q?mn0SeSN18po1P8Yn4wAZvPYBqjEioMymr5a8xO8ayL0ZGoC/efDWv1pwa1w9?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d0f7db-9cf1-41da-741c-08db3f6a173f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 17:35:09.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1e/65y416F8BmwIZ6xtdTljpkPm3Jh3UlOP1waIxWOVrkq41Qw73CMf1ogOa7mfy3RvHTtJectyCksgj4BX03e78FUjyDGKyh/86++VTQyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5172
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/3] drm/xe/eudebug: Export GPL symbol
 ptrace_may_access
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

On Thu, Apr 13, 2023 at 05:27:47PM +0300, Mika Kuoppala wrote:
>Export ptrace_may_access for eudebug to handle
>access checking for debugger connections.
>
>This is needed to be able to compile xe.ko as module.
>
>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>---
> kernel/ptrace.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/kernel/ptrace.c b/kernel/ptrace.c
>index 0786450074c1..e6933bbcbd6a 100644
>--- a/kernel/ptrace.c
>+++ b/kernel/ptrace.c
>@@ -364,6 +364,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
> 	task_unlock(task);
> 	return !err;
> }
>+EXPORT_SYMBOL_GPL(ptrace_may_access);

drm/xe ??  This cannot go through an xe branch when that is applied
upstream. Is Oleg aware? Would it be blocked if xe was already upstream?

Lucas De Marchi

>
> static int check_ptrace_options(unsigned long data)
> {
>-- 
>2.34.1
>
