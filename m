Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BDFC636CD
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 19:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08010E385;
	Tue, 31 Jan 2023 19:31:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBA210E385
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 19:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675193464; x=1706729464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bX/fCsIBLBfyYI75MNXu80j2ZNqDmYoheTVWMGlInkk=;
 b=ki6soakzULtb9GN2WEYJcivk014A4Js9b0UzLPmU4g0VudXmTWfuPqB2
 /E9DL6mhkjIY9GXGL1prTVlIK11s4UtPnj068klN9CImRDGzVJLAgfVr2
 o1BXb7+92FQR+DGHXMOxCfuRYN7XcxG22tpAZk+xryg52Ki80l4fUSsyL
 DkAagE95u9MALWj0QvCfaDo1odGVMS8GxtPYlnBSBH5L0XEwtlCa2ehW0
 J+GKl9ktKjeVX6sW7ePSik+cMMWxFfvVh9WuW19GlRSKDJlFhybp1eHh9
 ZCr6jZb3cJCSDGA6q0K2799rPk+kRfL/KROcaNuT4s4rosAtvmBKVkPA0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="311557350"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="311557350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 11:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="753352743"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="753352743"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 31 Jan 2023 11:30:33 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 11:30:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 11:30:32 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 11:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2JUXpxWCoTS/sFBqBt/5wHK9iMXaiSpd+ILVYLJa3NkGT7pqkLvdCJJ1F/+jREmNlqcRtY9Hnc6oHCdsWKur5litV+hVzdTjGpm0fOBKr1ums7VXZaLovHJk2h6Tqp20wH1Atk2lS1jdk8epCJmr2vXkyq5wUyirWYqAg9MAL4n2zI98JyZRaNM8PdEuA4N8TH8m/+M31kXpz2cg+MBaiiro2N38C6m8KE8OvxWXasIzki5htJZ1DfsPXDR+MRwk/5xhWCtVo0wB8jqC9GiOEmEVFzJ41HfAH1SRCPbz1gD6YzN+LrSE+A0aF3ukKpuVsw3kSpfGgKmaHI2ptcZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rc4AtxJDWS+Bql8Vf9DSkKitucJetES5Lp8Fi4poqQ=;
 b=VUfxx/Q4Z8cQ7sB+ivm48Dv+qlFpEq4Kxt6W9bTQic3BuZHes5s7CdpZY5Kt3trgJOruoLAs791oGEU7hA/ovU0dZ1u0DWyX6gMVTiDBmquiMdRwSVdQn/NACqdbikgG+uw04dRRhhT55bnrIEfHveSNYAa8hT3+PVW4JSyLI4KFOFRj3/jNy8QUF1at8irpYTs116Ewjvsabq5dN+aqlgM7dHS0nVMWt93xwCVSecfhTmFIOWFeW5XbzNOAMmFgwrOkSOobCLo7l1FeKhYcIJAmuYNd0nwexPeJ7o9KtcZU6AlLzcm61IERIjZC9hDp/wcC914XJhawhQlt6zY0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SN7PR11MB6972.namprd11.prod.outlook.com (2603:10b6:806:2ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 19:30:30 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d12:2d58:992c:aa50%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 19:30:30 +0000
Date: Tue, 31 Jan 2023 14:30:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y9lsT3i0JGEvf3UQ@intel.com>
References: <20230120204426.68104-1-rodrigo.vivi@intel.com>
 <20230120204426.68104-13-rodrigo.vivi@intel.com>
 <20230124231332.lksm4boodr72hm3w@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230124231332.lksm4boodr72hm3w@ldmartin-desk2.lan>
X-ClientProxiedBy: SA9PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:806:a7::10) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SN7PR11MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 8066ea62-7aae-49f0-a315-08db03c19d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hz0xni6W7AOjX59aAevEU5xTce8VJ6sJgOPKdBxgvTDcjHNnUubwkM3cXapDaNwV6Y+Rumj0gLkDMfSmTMS0d8ueRjQbCVTaH7MXU4Qs+Gl1Acs9Hm5P1PQWbYGqUx8coEFS5NYdZ+PUOw1DHTYDF1S0H7bbuytsbRky4KTmQfLM6qPgxCwy8b6xEAQcMTVWF3VG3LHsgGzBW+3RTiHnE9Wo7ewn446RPh1kAnsRvD7VI1pgPWNOFpirNJq5E3yqp5vQO/oTJi4eUj8t2/ghO08nqi0rQhvvvQAhl6lmEfFg4PB1NuCYVDGR5xC/hMzy2f7ae52evJVUcua9e8sdHR49FIZnl3UwJRGzcv/9s/XTkin5u/8P3x8qHCuhAjLyOxKNtt4gwDkGmKVwiC+D7t6FWPDfJAjssyeSoAzW4ol2Q7CXiuvDNtO96dXFYzC+v/vSmcFiLF1RFw+rNBxTSyzlOzT9UHJTIacVthagqcxKE/5arY83S/gjQ6st1assXU0ZTQrrd6HnpZb1OZKu2NL4zP5wQnYqcTyj15GVQEbV6bH6t85OVJtuUJRjn7vy/QC7XT1cS1SkiAPMdxZ1GTy0RfooVmtM5wGyk5NVwqIVFPqK+LrXf6Pk+sicR7R09cQHb2ZcjFLNowTgDHRD6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199018)(86362001)(38100700002)(82960400001)(37006003)(36756003)(41300700001)(5660300002)(6862004)(6636002)(316002)(66476007)(66946007)(66556008)(4326008)(8936002)(8676002)(2906002)(44832011)(4744005)(83380400001)(2616005)(478600001)(6486002)(6512007)(186003)(26005)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tBQtVvKJg3reyugt4XqOVb6dkRcn4p6HTdj45rspZXXvV3eELs4jLTKOD2+y?=
 =?us-ascii?Q?4cAS17VrrEygORHq5+PykbHrsgy3F5LKg+YYIC5RC9Srk+fJiszWbkKY1Au4?=
 =?us-ascii?Q?ndBLe5G+BbJEsO1IMeT7cibebus93K4SjqVg7Dv8+EAbANJkG+Qpo0f/LQu2?=
 =?us-ascii?Q?zZB25syp4tyPIc/qdQ1asgoA0hHXFIwTd9rZE56144j3n09Qaf6Qm728A/2E?=
 =?us-ascii?Q?N+5XhqA0eq52Se8Y+bAmH6g4WY3j3KYa7u/cRR8tOxj7Qsateua7ReAxHgNu?=
 =?us-ascii?Q?7ITOSNy00RzNXgOK568OcD+sr0EPutof7mWgAjPZuTJx0Ws39uH0sF6uLpiK?=
 =?us-ascii?Q?XYUq6gBi1ibqBbDHa+1Q8gKRpoOJ91i4LJnQv8VT4vA3HQ5m8d11PMRpFK9X?=
 =?us-ascii?Q?IXsDYEqQ/BnXgfe3zFfmdbN6UWLbQ2V8SqTaStpKF58WW5/j3o6cm/f6V9ls?=
 =?us-ascii?Q?0oZO5KVm0Ee1h78mD8VT3TMapvm1Yrtu94Hr2HAq2aOOnGxTMbtxtOPQa/iC?=
 =?us-ascii?Q?wiGhWVrkle9EhGIbpNRABndCMHe/iQOBuooRlJChB6eyHFf6wxDD52WRQBMh?=
 =?us-ascii?Q?o4Yf5f6Lt9Z+WAo7bcb9OicPbHenI56wPfhzn/3isr2bBNEubuSss9SsfucE?=
 =?us-ascii?Q?49wHuxw3UMzeEBvQ/IyswoKmu68JkkkMU31IqSKUGr0QpseqBzs6IXdItIVW?=
 =?us-ascii?Q?4mPKAn0XokLL1zVKWl3yzJIa0EuBom87CxIam6AzOT56JNZcQGm0Cb/XgEeo?=
 =?us-ascii?Q?9m3XdUWRRfAQbc9Hgy3+0Ku/xEZvzXMe5yNwmAZU0KnNWDqdAG/14TgkjJYz?=
 =?us-ascii?Q?XF1OTzozSROaDUtubiXxo9iSrPYttWdgFm6FM0nUb5vHxV8/lC/6nLAlhcoB?=
 =?us-ascii?Q?U5n8HzGfVhsP8qXiwvQRxVYBY2X4k+oE2jczr3i7tH/L3S+m1RGhTjTi9soA?=
 =?us-ascii?Q?ww7V2yers0rgfn6JrPJz7kbla0HOTBFmJCO5JF1QIwBoVYOd2btblLPSXi8m?=
 =?us-ascii?Q?NwdnQCvuvi7kl4lu60WXwioZgEH8Dr9UMj14suIuTgyVTh1heXENBcCOREvI?=
 =?us-ascii?Q?4vt1+Vrr/iZCUL2xCx2Mq0081lfNZGpLR9ZrybLYsxWvshMqm92O1GNoQV6G?=
 =?us-ascii?Q?b0OqUYAtn3tK14Rko3NEQT4YDVOkptdJKbxEO86hjgzh3f8LFXZTWFbF2Cp/?=
 =?us-ascii?Q?rAkbKskt9OpILGHcENWrFyCsrJu6V0+xVGhzYNS/4RavfJGdF4XK4so6Yz1c?=
 =?us-ascii?Q?uGDWtKR+ngww61DqLY0+Uad9yJ57edT2FqAzusaYVl+QqohUx0n6jAwgtyXG?=
 =?us-ascii?Q?hV+D3ABs9YawJIRQj/p+QPNBtABo2rw/gMDZNKZ0F0myf6m2VOOHiVV+vjgA?=
 =?us-ascii?Q?+XOOiaYj/wfq/jbyEe4nka/oAKCK98z4mOceZ2B9N2SQRFm9DDOwV7sl9dnn?=
 =?us-ascii?Q?ZU+ONUwBJNw4ol33jiIrLNQlPe1PjmEZV+313qTOp/fNIUVvze7UvU4vjITZ?=
 =?us-ascii?Q?UduiBNW7/vJiszbYqCljD7lCfDJX6sdf6ALuzcDi1vpW7vvdZy5xPRI8tdmB?=
 =?us-ascii?Q?+M2luNpqJ9SKH+uSDbmNxGyZWGJ8MHDtnzBjA5ks2rDv5VC+F2JbOIhBodPf?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8066ea62-7aae-49f0-a315-08db03c19d28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:30:30.6282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7xj4hD91H1u7vZanc55J17MG0pi6KMoGN5+cVjK/TtPvVNdFZoRFdv7tgbO2qR0Yi7hMePS1I+xthWNzVLWMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6972
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 12/20] ]65; 7002;
 1cdrm/xe: Add min config for kunit integration ARCH=um
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
Cc: maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 philippe.lecluse@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 03:13:32PM -0800, Lucas De Marchi wrote:
> On Fri, Jan 20, 2023 at 03:44:18PM -0500, Rodrigo Vivi wrote:
> > From: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Just noted some garbage chars in the subject of the this patch:

yeap, I just noticed this while replying to Mauro and have already
removed in my tree.

Thanks a lot,
Rodrigo.

> 
> drm/xe: Add min config for kunit integration ARCH=um
> 
> 	65; 7002; 1cdrm/xe: Add min config for kunit integration ARCH=um
> 
> If you can remove that while applying, I'd appreciate. Should had been:
> 
> 	drm/xe: Add min config for kunit integration ARCH=um
> 
> thanks
> Lucas De Marchi
