Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE3C001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389EB10E1AF;
	Mon, 31 Jul 2023 14:23:08 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978FB10E1AF
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690813385; x=1722349385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JvhT+xgQSUBnlcA/aQUi/ONkw95AsOsMR2XwLBM09Bk=;
 b=TCcfbuUmt4ozX7LyU7LPofRCaRMiI/wy5QLeznn2J6NqwcIo9lyeg1PX
 7xagxjEXwcX/LSjHdax12Up7j3wexb+CQy/3r8VVg1tNwN8Dac3sHLuHw
 KC2lDFhGCbexJpedDqiuFu3rueUY6xgSEzbaGFY9TsYXLj96D9flQIHIE
 w/IjHMjm095nFvgmpEIxn+hC0sCJtuW0zez7VyY3pDAyc928bu2E6vbMn
 zjv6EN6sqeQBVjQNPe/0Ln4LJOcbgO8Ywhvmrq2/Jyrjn6rfppCcMIk6l
 B+fb8yPumgkU3SQkLr/WO2UqXefULP/kImNpveb9WbK8Wb6JoBHmkL0kl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455406221"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="455406221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793744177"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="793744177"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jul 2023 07:23:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 07:23:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 07:23:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 07:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imVW3SQphX3ALT8xChUQkfBuY2+GU7ASwRR4Pt1z6Ku2XMXIfjaEWXvsKuEkG/C/i1DmB2Yp/ZSxLk45DGnd+0hYYQrxTBx2uRzzMdWImjLRlWBuGgWZFXcUp0emfBEpc3zabf81PeCAzoOaT33mthxV19JE/grNQgcbA6lOR3lUJNVOglGCmBkQWLm9FSWmgF4wtNAGBGU9RlmLjM5naE1JTH11pve3BL1ol8MrOrsp+G9M67sNl+mwjo6Bkrw4WfwDDpAKkBaUooHeo0QQFW+LLlr/qjUtEcRRx1tqHtIdl5SftMm6vo5wxUeudz19AWrUsSPUWO/DSnJx26FT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdJsiphuzgjJNGgJ2EM/o82EPBUc0j4j8gwvOr3MZo4=;
 b=ndQC7ft3NkHO0UStzA/pjhquV97aVfJnc2WCUkVu6wdOEgbfLlCIxBp5daMok4VR44YCLEhQq/C4NmseYKco6htJgAIDNWMXHlNzJ8J/mv/zZnuemgwpwhtI13cAKliXHhyvLBxScTR6mj05kuW/uBubNsbdKkUlQr8J2V1w7QX9gXZ+jbSs9OUAdNJ6p+Pa240svwwi++Zd6FPjLqO6KKSfG2/Lr/5Z0dc2p5yuFJy3XIWk/rrfZJ2QqEXoew1mX9ACAyrHf+tT+sjojsoQccLT++DkfuJSx/YnOgy1yy6xXRYC0vk1JXuINKexKUfENaz6PGtOMb3txEOORAvhyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 14:23:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:23:01 +0000
Date: Mon, 31 Jul 2023 14:21:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZMfDZSLi6zj7rJqv@DUT025-TGLU.fm.intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
 <20230731131337.1100068-2-tejas.upadhyay@intel.com>
 <ZMfArZcYV3gL0dWu@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB620427C48D43A7CF916146BD8105A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620427C48D43A7CF916146BD8105A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e70e2e-11bd-486f-c228-08db91d1a5a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WdOl3TdfONlvzH33ek5GMlpSBxeuoMDoKgzH7J6ZgNYsvCZSmD9QiAtTI9RR8fwsV48oGtCg55Vn4lahzaMaKAEAWvXfWkpXGit3wSL+W5YSiYb3VGyTWvnL8FbS7IwLRFm/3CksJTUpNqPrSo2LgN9HQsZR0ifRETud9ySzPuAvUShDhTndRgGjpSOL35dXUzY9Baip6EUwNpVOkEcwl2eQfVTq6/BHS0rOExjBPdYSfKfJgPDmB+9pWOEFrUU3cA9WBTBHP2D3lbgPNljvRIe6rfxL6jAGwaQ5ABy7FauzjolBnygbO7kC2ogzP6ww/3XUndumD7gNI19xdkQaCw0tjlaGNadYqNNuXQwhhvQ2KYMqRerZzTgv40T2Tp8lT+0unHfWiTpu9kviUlYbVauYLcmoFP1BvR33VPJsi1etDjDHPduAGeA75lE1RxNxmMDs1ZBY7/MM+xnYl+D1MWvW8yCjKWh2Ri/XQwtiHNrThKAreIDRIxas4WcqSE1qKNbly9WW2gbpIAIlkpH/WN7C3gHeYjc2ERvcg3co5lQ2S4yUnZ+V5d+nSHWiTVd0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(6512007)(6486002)(53546011)(26005)(6506007)(83380400001)(107886003)(186003)(44832011)(66946007)(66556008)(54906003)(41300700001)(82960400001)(66476007)(86362001)(316002)(4326008)(5660300002)(6636002)(8676002)(6862004)(8936002)(2906002)(6666004)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OxFAVKhdFcRHFY+D8ZoLYUY/6poTBA0zIilKtPM9aur6Z01wKJR3Sy2ZHDve?=
 =?us-ascii?Q?rtbXzsNQq7doftoqZgGLnTSAEhAZFsAy2mOIlMXA5LtIAtTqRV8d85dNiUSq?=
 =?us-ascii?Q?LTyS95n5jYOHIgnL2+yUDx6Iqy8bBPLhoaYCURRYSGj98doSLWqazpiXqkx+?=
 =?us-ascii?Q?IaWh6r5cUchaSF791vYNrWkfDYZncrqZ5uDjSCN8R3RRuPQF5FPyBZmRSc/a?=
 =?us-ascii?Q?/DAZ9omlMMQ21Tks7uG4EXW/w3RRpkgAcgDiK98HMaApZKG01nyHz0jbXPIp?=
 =?us-ascii?Q?9DxkoFJzTxteIN9Z0GAPOAd4W23Fycabhrb9564vOjUcMDNDT1gLY4MiPzhx?=
 =?us-ascii?Q?wBh2B2PJoD1uxV/9ktG+tgInEb3lnLAGWyBQ1ks35PXgh6DSVzLp3k2UlxID?=
 =?us-ascii?Q?cMB4n5mdgL6xgTmJPJ2j7hePtqgl2+JCTSBh2AX032YdhJTtY+4S6g2Y7oyU?=
 =?us-ascii?Q?GTvkDl8/8RMgjyFT5IgCanh6tLynB07KkD22QeG4SoUrI7rUwh+of4t9FZbL?=
 =?us-ascii?Q?suu76QNkRkxoXDT94BqmkePiGGVerWQfuP42C9Cq/VQv8mC2r4oAhJ6rHuXA?=
 =?us-ascii?Q?UjhawFk4ZHBGoOz/gOjqZS9GxjRYMAgvwUGd2/UQzjGYx5LNaL3bPZ5qczkT?=
 =?us-ascii?Q?B9vBneCk4nGZu5lXMaH7j0zwgzNs57hbEiUTZbG82T1IyNrfVgzx4Mf3Xu6+?=
 =?us-ascii?Q?ksXu7qUX4pB4Vj+Nzt2y47ko9xA6ZpIMNxmcIAPZlksOO5e4lpyBKbrGMCf9?=
 =?us-ascii?Q?Z5cLn90FvUU+SEtXwWaxOe1Q81SJSj2uFXgp7ewYD9QrLQpRSu8ypwlU836A?=
 =?us-ascii?Q?KJWtWzBdILxbPmvKdJxtxn2G+xjpsK9ziPV8+IR5O42WDBMjt1E0ZsToC3rw?=
 =?us-ascii?Q?i5WStIeqr8+VNCFx01UpUwQILh4zQZSAhf0WCCBtrcSvpZ/WywB2xmBywFqq?=
 =?us-ascii?Q?NHyPa0iqaqfhs+yBZJHBJmWL5KV5djuwKxWaZvEW4s+lCQocn+hWEQXYPzWp?=
 =?us-ascii?Q?UT1fmR/mMkqB5w6X1lFggV5dDWRUyxg0po6gBvvdf8WytRlKpMV8cmynWu6J?=
 =?us-ascii?Q?lFVC4A593Qyjf94N/VPPuWZ8DbuVwnTyAdAY/l1fsCbzIXyLeMXAH0Hm0Vgv?=
 =?us-ascii?Q?Fmj+6y08ahSVfWss9wl6ruq7SnW6R1xNk6G9sWRMiw5QkdQLTxm6LDsGoZ6C?=
 =?us-ascii?Q?2tOaA4ehrVNxJy5KZZKCI/g97cK5w1tH8FzBDelwwTyR8SHbxDqXUytoYiuk?=
 =?us-ascii?Q?MzdZIjXmnXLcCY++9U/0LKomwNkA8rY4ULMSAM88VgVU0mJiRuXR0Ll3a6eL?=
 =?us-ascii?Q?kwPonEE9GoWzllZ3zlmCvdaKfZqjUxqAfCo/EaN4idHb1RjG1Z7N80k66Efr?=
 =?us-ascii?Q?nxW8c91CT3S5s60ge463rDvl/kT/fP6x/vWNqmegmS15w8U0ypfHfNmma2ZD?=
 =?us-ascii?Q?d9G6OUkoTdgyyzHR7jTmrI6WWtlneS8Cr1KcMMffX3f9HOp7kQjDM/jjPbIX?=
 =?us-ascii?Q?cB8vm6yhWB1eEa73f2wvxl0fzD7Gd0cH1oRmttFvLlU7s0lrb9801lYVJdjI?=
 =?us-ascii?Q?JWnOiwIDgtAtsqwSt4eihrSxx3xbw5/wWErfDexxWy8mE1t++NDBPMatO+4k?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e70e2e-11bd-486f-c228-08db91d1a5a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:23:01.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+guoelpwYEC7G3NfSVkEkn7ushgdKL8sM8fJ7MtQU0ZW3s0lmGs4a//CN/pcBFru1eQduqZdVQU34T5pOU73A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V10 1/6] drm/xe: Add sysfs entries for
 engines under its GT
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 31, 2023 at 08:12:43AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Monday, July 31, 2023 7:40 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>
> > Subject: Re: [PATCH V10 1/6] drm/xe: Add sysfs entries for engines under its
> > GT
> > 
> > On Mon, Jul 31, 2023 at 06:43:32PM +0530, Tejas Upadhyay wrote:
> > > Add engines sysfs directory under its GT and create sub directory for
> > > all engine class (note its not per instance) present on GT.
> > >
> > > For example,
> > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> > > bcs/ ccs/
> > >
> > > V6 :
> > >    - Add kernel doc and arrange file in make file by alphabet - Matt
> > > V5 :
> > >    - replace xe_engine with xe_hw_engine - Matt
> > > V4 :
> > >    - Rebase to resolve conflicts - CI
> > > V3 :
> > >    - Move code in its own file
> > >    - Rename API name
> > > V2 :
> > >    - Correct class mask logic - Himal
> > >    - Remove extra parenthesis
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile                   |   1 +
> > >  drivers/gpu/drm/xe/xe_gt.c                    |   7 +
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 121
> > > ++++++++++++++++++  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |
> > > 13 ++
> > >  4 files changed, 142 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 4ea9e3150c20..2ddae8e312b2 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
> > >  	xe_guc_pc.o \
> > >  	xe_guc_submit.o \
> > >  	xe_hw_engine.o \
> > > +	xe_hw_engine_class_sysfs.o \
> > >  	xe_hw_fence.o \
> > >  	xe_huc.o \
> > >  	xe_huc_debugfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 28bf577c7bf2..5436ce651076 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -28,6 +28,7 @@
> > >  #include "xe_gt_topology.h"
> > >  #include "xe_guc_engine_types.h"
> > >  #include "xe_hw_fence.h"
> > > +#include "xe_hw_engine_class_sysfs.h"
> > >  #include "xe_irq.h"
> > >  #include "xe_lrc.h"
> > >  #include "xe_map.h"
> > > @@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > >  	if (err)
> > >  		goto err_force_wake;
> > >
> > > +	err = xe_hw_engine_class_sysfs_init(gt);
> > > +	if (err)
> > > +		drm_warn(&gt_to_xe(gt)->drm,
> > > +			 "failed to register engines sysfs directory, err: %d\n",
> > > +			 err);
> > > +
> > >  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > >  	XE_WARN_ON(err);
> > >  	xe_device_mem_access_put(gt_to_xe(gt));
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > new file mode 100644
> > > index 000000000000..ad57faf69f9a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > @@ -0,0 +1,121 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright (c) 2023 Intel Corporation  */
> > > +
> > > +#include <drm/drm_managed.h>
> > > +#include <linux/kobject.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#include "xe_hw_engine_class_sysfs.h"
> > > +
> > > +#define MAX_ENGINE_CLASS_NAME_LEN    16
> > > +static void kobj_xe_hw_engine_release(struct kobject *kobj) {
> > > +	kfree(kobj);
> > > +}
> > > +
> > > +static const struct kobj_type kobj_xe_hw_engine_type = {
> > > +	.release = kobj_xe_hw_engine_release,
> > > +	.sysfs_ops = &kobj_sysfs_ops
> > > +};
> > > +
> > > +static struct kobject *
> > > +kobj_xe_hw_engine(struct kobject *parent, char *name) {
> > > +	struct kobject *kobj;
> > > +
> > > +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> > > +	if (!kobj)
> > > +		return NULL;
> > > +
> > > +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> > > +	if (kobject_add(kobj, parent, "%s", name)) {
> > > +		kobject_put(kobj);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	return kobj;
> > > +}
> > > +
> > > +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj) {
> > > +	kfree(kobj);
> > > +}
> > > +
> > > +static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> > > +	.release = xe_hw_engine_sysfs_kobj_release,
> > > +	.sysfs_ops = &kobj_sysfs_ops,
> > > +};
> > > +
> > > +/**
> > > + * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
> > > + * @gt: Xe GT.
> > > + *
> > > + * This routine creates sysfs for HW engine classes and adds methods
> > > + * to get/set different scheduling properties for HW engines class.
> > > + *
> > > + * Returns: Returns error value for failure and 0 for success.
> > > + */
> > > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt) {
> > > +	struct xe_hw_engine *hwe;
> > > +	enum xe_hw_engine_id id;
> > > +	struct kobject *kobj;
> > > +	u16 class_mask = 0;
> > > +	int err = 0;
> > > +
> > > +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> > > +	if (!kobj)
> > > +		return -ENOMEM;
> > > +
> > > +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> > > +
> > > +	err = kobject_add(kobj, gt->sysfs, "engines");
> > > +	if (err) {
> > > +		kobject_put(kobj);
> > > +		return err;
> > > +	}
> > > +
> > > +	for_each_hw_engine(hwe, gt, id) {
> > > +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> > > +		struct kobject *khwe;
> > > +
> > > +		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> > > +		    hwe->class == XE_ENGINE_CLASS_MAX)
> > > +			continue;
> > > +
> > > +		if ((class_mask >> hwe->class) & 1)
> > > +			continue;
> > > +
> > > +		class_mask |= 1 << hwe->class;
> > > +
> > > +		switch (hwe->class) {
> > > +		case XE_ENGINE_CLASS_RENDER:
> > > +			strcpy(name, "rcs");
> > > +			break;
> > > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > > +			strcpy(name, "vcs");
> > > +			break;
> > > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > > +			strcpy(name, "vecs");
> > > +			break;
> > > +		case XE_ENGINE_CLASS_COPY:
> > > +			strcpy(name, "bcs");
> > > +			break;
> > > +		case XE_ENGINE_CLASS_COMPUTE:
> > > +			strcpy(name, "ccs");
> > > +			break;
> > > +		default:
> > > +			kobject_put(kobj);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		khwe = kobj_xe_hw_engine(kobj, name);
> > > +		if (!khwe) {
> > > +			kobject_put(kobj);
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +	return err;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > new file mode 100644
> > > index 000000000000..b96125443db9
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright (c) 2023 Intel Corporation  */
> > > +
> > > +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> > > +#define _XE_ENGINE_CLASS_SYSFS_H__
> > > +
> > > +#include "xe_gt.h"
> > 
> > No need to include xe_gt.h, rather just forward decl.
> > 
> > i.e.
> > s/#include "xe_gt.h"/struct xe_gt;/
> 
> Like I responded in last revision comment, this also needs for_each_hw_engine def. So I will need it.
> 

I don't see for_each_hw_engine called in this file only struct xe_gt
used here. for_each_hw_engine is used in xe_hw_engine_class_sysfs.c,
include xe_gt.h in that file.

Matt

> Thanks,
> Tejas
> > 
> > Matt
> > 
> > > +
> > > +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > > +
> > > +#endif
> > > --
> > > 2.25.1
> > >
