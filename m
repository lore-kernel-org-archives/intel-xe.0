Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B66EC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 16:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC82510EA1D;
	Fri,  3 Nov 2023 16:09:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8973210EA1D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699027786; x=1730563786;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LYOqn2tyYkG9Fby/KFzhJkkG7EFuVp/z3b1CnsGhY/I=;
 b=bE0QpWQpRAXizRE71YDyHGqqi4Ywtu6gs7zfIfHQWDag2W9Bw8MVEuLk
 0s6cT6fNom7OtOQhsA49Vj8tV2am6xyw45ipg15Yj+3BUZC/c9PD33WI8
 v+UxTGOxXR+VNUkq6ELjv2DaXr74auTv+6RUDSqFfq5GadfK3bkRCAph1
 phSKe69pWQteFc/D64d72sTQ+cjeedBhVRDVSRtOtHn0qQESpey+50duJ
 i5tfSa7LngKRrCAbT/EqkvngRcy+fqsghhcfXHVdMoMEGaj4j4kfHKhr9
 TBvy6w6n+U/68BwB8nhJvhdWGd7MBwaHNkSgREpp5+xJGYfmC3FR/Xq0U g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="7605789"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="7605789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 09:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="2944047"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 09:06:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 09:06:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 09:06:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 09:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfP/mr9UySCnf4U+afgwjqj7jJ2DtvM1RBSU0PAPAzI1+aE3JjhjxmECrz+NuTX/4sfWh0os7iOTYI7014DK49LoogYZ9iYGi8xpMOmEAvoF/yZgx1j503sySmD3E/4AixqhBu5qsyZR5Mu7kGL4nC4MZXPe0QoSR7DQNyQPUh8C5xTVdh8O07rO6JXfj7GhRz2T0VNm8qCEUM1aQeaEA+4lmb8hIbLFLHJg7t3dwUHDh5wQ+2SRB4EIQxMKDZcIJsc27siNawHw/yIAXYDas/AX8GdJwQnX4nho2cRg5y5ar8ZXMQkBAgBBi6Y7fwwfmJZbt23yY9IIuZfY0LOh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc98FJxy+aZYmsK7YDYJOujpSBStUdkF9f7CuuzbAWA=;
 b=Noln6N8XBCWfpFjThlcznjE875L1ebgbLITZSDhKBjg9/5VXwikHxIl7ziukpg8NPmEdjV8wFWgE0CbgQSAWiILe7OOZ2zTble4ie9TUzGzktczmc3ZONFC+RBHIreDx5XqWhhb5h5FcI5r+VfUcNNnQCn0eHNPPYITKjL26xUDGTGaIIRAlwFtv349vRWCesRtw33+ThcE2q7SyngTRghwVzMMjzngKPcOC6IYSNizNPA69WzHBrZNdFusUB9zc/bIm4W/xLGuvtinXI8DQRM2ilnxzT/Z9UMssES1eYcyl1v6sTSdeSIQ8Bl+PBm1LoGYqt2oC0zE3yLM5EWN6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW6PR11MB8409.namprd11.prod.outlook.com (2603:10b6:303:24c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 16:06:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 16:06:50 +0000
Date: Fri, 3 Nov 2023 12:06:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZUUal3j61BKvO/1y@intel.com>
References: <20231025172836.770398-1-jani.nikula@intel.com>
 <33cff30cdf4415f794df18463c7a62545dd5c5a6.camel@intel.com>
 <87h6md77xr.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6md77xr.fsf@intel.com>
X-ClientProxiedBy: BYAPR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::43) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW6PR11MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fa2eee-311b-4e79-3ae5-08dbdc86e352
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNBVov1NJ6WpDdQ1xpuaLpf91RHU/i+Z40PAzH4AYyZG2143M/YOMNPGvabA7k2oASJC08gvoKakmG004PcxcscnyXsAQTEKY90lGXwQDzXLD1su3pRQ/wWU1LD5p9VJ+t02SLx83KmEjiAfflBwGMjhJm4eiHVWf/UfBXffaxCtHzc1zl5u/0nYHU0UVhMs3kwe5ifAS9qC4Fr6Mt5OhlHNmowbKN02cjB8f2/54uwtpeGUHQtBstQuD/Liaj0cjYvii9X0tcqn+65qVZpxjWjRhe27DlMSf34nr6ccukKiYjqAU49uEBOKZsn7wlXmGn7KPKTIEKnkRPninbNoEiGn66DeKrma6MOBZFKnGIguqW8Ej4W4rt+ykEGWp0UGDaM009PbooBX3YFN1vkEc+2rkXnzNY0vsyoDY88R/aX/ma4OXXL6U7f9T6gZMHZk0ekdyEcv4tKEke0d7nSM4bFHzqMC+GyVxXytac1xoJ7+Y7QhvjpXjolBdbkHmlmVYMsUmIRQHS2jBlWMML5vM9JYh6+V2fF6Z5eZFgVsqhL62a5ie1kSrEw5M+jhxZe1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(36756003)(82960400001)(86362001)(2616005)(4744005)(2906002)(478600001)(4001150100001)(41300700001)(44832011)(8936002)(316002)(4326008)(8676002)(6862004)(6636002)(6506007)(6666004)(6512007)(26005)(37006003)(6486002)(38100700002)(5660300002)(66946007)(54906003)(66556008)(66574015)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MHVgdH+5JF0RdL7eN563VL+/5gR1wPKLy747XnrkhdtXe8rSAiW/kQ8WMS?=
 =?iso-8859-1?Q?l6U7OBqQITXd7n9MOSDJsW2aV0Q9s3n+KNKbFsaJ8U0NYE8Tou2QdLkfV7?=
 =?iso-8859-1?Q?1+x3ALxbvJqNmrW40r6uU1pThMY12/qRU75nj+nkm8ru/9JaB80L29Su/W?=
 =?iso-8859-1?Q?Dy10bDYke2x/uh6aZ+7yJJidTFhF3bbGgVhDx4yENYTKJyn7pMEV+MZwm1?=
 =?iso-8859-1?Q?R3gQ9qlN13IVQzE8LbEVVTSJLiJtktD0reWlZiWUKDEdbdf62134OiRnRq?=
 =?iso-8859-1?Q?5MFEHa1X7TrHgi0LJ2yiNr3i6kvCJdDi+m6amG+I2DRCyzyBhRWNBzb51g?=
 =?iso-8859-1?Q?KFk0H6nQAII2j4wZhzHqeypL6eBlrPWA4uwys3dMbssTRwonRmu7YPWC1I?=
 =?iso-8859-1?Q?mWNXm1mc+7jcbuUSrC1/IHLq2EIlOKCGHpBFAmp2S+b2vE9lGQliKaQZyZ?=
 =?iso-8859-1?Q?rXPyKsRBqkTDxP3myvhdsEY2pTi2EagKrM/GKRpAfbf6tJJf4A7rb7zDKG?=
 =?iso-8859-1?Q?MjOUYtQ3O4r8fPLEQaNxEnlQK82/T7nrCi8YbeQRAL5dHATZ0T9sxMo90o?=
 =?iso-8859-1?Q?4Wtwafp4rpKQCVb8NGQ4KFpmSwMarmt8FHzwk2yY1L/9kCzh3dzW0BytbX?=
 =?iso-8859-1?Q?qE0T9TUY5s3UN3g/QN5XoL2whWv8Rp+C54KZ6l3Tfr8+sMSrhLPg/GoIFo?=
 =?iso-8859-1?Q?BLg9609LAPHn8FmF7++TkD4jQM1kVbGP42Jh8bbLlncNzYo3z1hQbU3taV?=
 =?iso-8859-1?Q?vKToXGzemwKcaiAB27QKCAMo8PauXbjmWUCgvGrGr7Ue5sE0P0R2u6j751?=
 =?iso-8859-1?Q?rwlvsdOu3pkkaG9wJADX1IWecb50BxPLxPbN1jG8nBmZw1MXvzTG3MNrVF?=
 =?iso-8859-1?Q?TWO5Akvks0Qh8NvHXAfYlFxEG+IVIHVdOHZJqbIkDICg96nNSNvW4ZBKQ2?=
 =?iso-8859-1?Q?xdbttOH1jzCxnJ2B1Fp6BJvb8+2xB0w5AZPxzUEzacxjRqBQ7a74B1aicp?=
 =?iso-8859-1?Q?TFwIu7aIaD9lKoup/bOPmWhgDKAVTduSU3ZpjYSUs+dedCn+tIdhfi1EW1?=
 =?iso-8859-1?Q?9kMzoWqkYj+KUnuiLB+i+4lIxfbI+8MUOu8jj6Ee4Clj/2zwqlgC2Cg8i2?=
 =?iso-8859-1?Q?R0xpl82IfjGzYWMumewXzl01FqvhrpppJp+66i0Ky9XOdtLF+4PToO2tcp?=
 =?iso-8859-1?Q?e0UHKcnc9ocFLGIpUHknADOG+JEUWG86GA3FW7Tz11tp4e7YUOAufNmt7X?=
 =?iso-8859-1?Q?/iDhDxbDz71R922cs4PWJSl54cLCxaR37qDudXrChyoimfZfLyaq982QY4?=
 =?iso-8859-1?Q?Nk3Yh/FOp1rs904wCjP2G2oqeCkBdfv8aOCyIRky7DyqhRhSmRLr1lrKq4?=
 =?iso-8859-1?Q?z6CI/hkOVRGpK7hexkXFMmsFa/ojk7oocTVdtf/sEODgoeeWG+3WOE7tqS?=
 =?iso-8859-1?Q?Kfhm/fs9X2AkrSuUK/LNDRJ8p9xcZbOot67cvIpCqiU2fUBwqJoL55ii4t?=
 =?iso-8859-1?Q?k93km0A3uWt/VPjDMfxeeYxZ2jBLPL7dY3loJwsCcLFQm/t+uT6xcigHkc?=
 =?iso-8859-1?Q?GZT40hCJVxodILeeebfydMrkzE9+iYLMpXj28S/F15HhsweBeYrzozJkBI?=
 =?iso-8859-1?Q?/71oWPYN73XyRoFlif4np3FXJodJTn34zt5gQ8aLieYS+2BY4QdD3E6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fa2eee-311b-4e79-3ae5-08dbdc86e352
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 16:06:50.3283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/qkCynmR8R++5VBYQy5ihC01q5Tok0BM93QOEaiwVrwcjLjaqBPYV/NeUoRVErYQ38+Tq3zxUtXxA9yMyCMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8409
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Replace "drm/i915: Abstract display info away during
 probe" with upstream version
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 05:52:00PM +0300, Jani Nikula wrote:
> On Thu, 26 Oct 2023, "Hogander, Jouni" <jouni.hogander@intel.com> wrote:
> > On Wed, 2023-10-25 at 20:28 +0300, Jani Nikula wrote:
> >> This is a bit silly, but gets the job of annotating the commit done.
> >>
> >>
> >
> > Acked-by: Jouni Högander <jouni.hogander@intel.com>
> 
> Thanks, pushed.
> 
> Rodrigo, please be aware that drm-xe-next now has:
> 
> drm/i915: Abstract display info away during probe
> Revert "drm/i915: Abstract display info away during probe"
> drm/i915: Abstract display info away during probe
> 
> And when rebasing, we should retain the one with cherry-pick annotation.

Thank you so much for taking care of that and for the heads up!

> 
> Thanks,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
