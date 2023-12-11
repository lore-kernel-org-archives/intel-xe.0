Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADB1C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 14:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F8D10E10B;
	Mon, 11 Dec 2023 14:36:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8568F10E10B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702305407; x=1733841407;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IHLFliLROC7yId48D9wxdVwtEeK83koR3KGjqbxOzDM=;
 b=fIyd+/eYO0h9/VCyrmFNBtK5SlqUpKeimG7YRsAqKXFIQwjb+CGcso5i
 7hCHWrtuSfAB/1mhmFvuBpcCTsaJb6WvYFhjmZhSWkiCpCUcjTrkuY3mF
 j/MUCsUE3bIqu6HFC187Bx/2Lna2+OcUBUE5ToC2QWUaCpQFlrzB50qa6
 lnAVSwXyMgwQG+6MSm2zjBOCzNAO6+Kj6XaNWQz6VuTZqq1YreKPMGj48
 gaCqNS3/qw5IuWnqSD+7o+Dtg/ftkPNwH/23UcUBBdhor3r4kubtM5umM
 JCbCaDMFPd3MQ+PEPRhFW7cQ5r0DBx9TM9VNZs9zwJ25yWqynD7oto9fR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="425781766"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="425781766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 06:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946351088"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="946351088"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 06:36:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:36:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:36:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 06:36:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 06:36:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fzjtdep7Asew36Wjxq97kkzpuf9Cg7hljCX4lMsxBe+yFIjxBiM5Vg9tyeOEinJtxwW0Oz4E7mqvsvlHB6DgFRC47fMPlJd7OxGZ5NeNwzgPPq6ev85rvjpou/tYwOX/g7rR9DIJwmFdrHS+U93EkFJRcb+t9vPVVJOxc3g6nHTU52+uTSj62RMNkdyhDKlaw1OI4mlZ6zQDWIRMabGx/Z3lesdHWRmO5iNXFFiamqk+zUkNEV19p6ZdFPQtCulKSslHE9a3TRfOiJ96sbXPTqjOy4Z/hDSSPyDjqih/Lzh2lLHvh9HlmAoJfQPt8kq+jdumaUmdqA0MWC2PuUhorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHLFliLROC7yId48D9wxdVwtEeK83koR3KGjqbxOzDM=;
 b=IrPeqCMxEQ/Q1DgH3gercA7AGCC7Sz2h1CPOvQgHNexsSBrrsUdpfRpSqfkcfZYTDtqdOieP5Aqe4SNjc2cdbDeATrrGHbuEQrqAcLoAFIHDitFHf0dyBwMuOsgrnNtQ05AiyydoRvaHL0Qow9AiqAX8RCbxD4qTesm74eiqRuFzx6pmcnfo/rlOzfyCpEPgibD24baoMmvQQrxFMlED7bPAoayrDUv19nHl2U4O5iIrF57nB6qiW3tV6qsusa2/QwuGEYR9QvHtHW77b19s0hFy9JVfQzMovU/t70eEEiQm7UYGILxPH0ptkosodnsqCQ0qAWy9sE2V9BxjchTbJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 14:36:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 14:36:37 +0000
Date: Mon, 11 Dec 2023 08:36:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Add PVC's PCI device IDs
Message-ID: <t4z3je3cc4yl7pwiszx5bk7kfe4dboavm7nzn3movoi2zagmoe@p25hox23bn3i>
References: <20231208171316.901795-4-rodrigo.vivi@intel.com>
 <20231208194409.914314-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208194409.914314-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b949a64-2e00-42f9-8151-08dbfa56948b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD5UFum+C8uChgHhC1hzviYTuVP0EuX4bhxn2rWcbD78ZaN9DqJBcIs5+4VD0W9nrNLOlvTJw7RmkFH/rPJtA+d7cuo3EFoW/DHNUbYW+Zu/K5NHGCIkRNyAZODaHbXU+H+elLt9rjYiJuvmPXGAVxWK/xyWS0FgvhHxfzl5D0bnmtqQ6tqv54yira8GxZ0HEJeCkjlF0e/1wkcwvnZcyRzAsJ8Apv51jZzcB+xmQ+OJHD05zniBfRMV03sDcObrT63wachsy1R/PlF+ful/uFhaTxzFYoMPj8oV9qLMoD81TbqbI7SUVEbAuVD2/ercKnHrMS4c2uV5zFRmXAmqWc5aJUWNyv3eGr+CSc+/lzRisRyDbLAeUhQ186CwL2Dk8RsBIkPUbuBENMLClIbktSzSoUHpjNA+LyDTJHMHoYxN8es6lYHcxaLGFkuPqOT2Ia8rSDOXImHeo5FN7Tgj2zjliztVxOUmFORC17LNWXfgjJOuwJqANQi+GRIcjPe/TCPrXZ6QntGXGu7xEl285S6Sml5dFIMwdrIJHoyAQSc/eXkRT803oNFVURcNPv5i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(33716001)(41300700001)(38100700002)(4744005)(2906002)(5660300002)(316002)(6636002)(6862004)(4326008)(8936002)(8676002)(66946007)(66476007)(66556008)(82960400001)(9686003)(86362001)(83380400001)(26005)(478600001)(6666004)(6512007)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ENgPWi8BrdW2NykkvNfYImwcFmTqM++rwIvAz+ejw/KfgGiBBP9brtFSup0Q?=
 =?us-ascii?Q?mR/TQP/Abo6Nai3SgmG7ZUcRu50ZpjIt2TMWVSLtCLC2f6a4dRG2MGaoqJve?=
 =?us-ascii?Q?bGS2qlTCPvZjs1IHlHgAdR2lPVgeZw84WimcXI8Ewary3WVmeyeWSvFuFujv?=
 =?us-ascii?Q?dkIYPxH71gd7DnIot2VHivGmErq0ZHYMVs9CRWwIu9NNG5i14YGyAK7fMdW4?=
 =?us-ascii?Q?+RyLK7dfualCv917ebVPzMYufe4LErKNg8YtbLI86rXIo4Md9Mayua8R5q5Q?=
 =?us-ascii?Q?8JgDfnubDM2rt/2oA9dkHV0mmNeR4IsoJbkI6XxYaQiBGHIFQADQbMIupwj1?=
 =?us-ascii?Q?TZZxmWWfAmsFeoFSO5LX4qK5Q+NhB7bBigytXm+WNxYY4JMLJUxXc93K5E2Y?=
 =?us-ascii?Q?w/uR5SZ8DFKWwQ4V2T9xMeAqknRGSTvDhDOLxS4aJwl9WX/i7kcPENn/n+ha?=
 =?us-ascii?Q?yUxdpaYdKGi/rr2k6a1H3Xzt10giCY6r7HSeLEFngewucdbbpH4a1iEWOGL2?=
 =?us-ascii?Q?NjqnAc+73J72W7Q/aeNW7KumYlt/ZI6Hn2idVDY/e6t7x0Pr2okiE3qS+PsV?=
 =?us-ascii?Q?GCG5CUI052dd3A1jYwJm6ZpaONufXQrswAQFOm3tQEfVmGXdCDARAI0k7P7Q?=
 =?us-ascii?Q?MzZZbMvPenO9DXNE84dZYCDA66sbmCN5d45ILwfM97sLuH3GvCA1uKNaRVdt?=
 =?us-ascii?Q?f0geZQrcaZyjbC8g/q7+kbxqh3BfUphlkZnAaUdiZUCKwyVXLc7Vm3P/KHpk?=
 =?us-ascii?Q?MfpCoLcKo4Ij46E7tpAw31eyTqdPSAdTCozXB62y+NGqaJ2NQMlGzpwIYTYx?=
 =?us-ascii?Q?Ddm6+69GSML0SZ0p6YzJ034aWzeajjnML4yVr57l/Iq+EDVWoO0hBFUxq5fA?=
 =?us-ascii?Q?ox1w1kxR6lJiP+WQsr7exHBigcWdiHi8wa+0OaJg0USEqegu84lBbxJ4Bfad?=
 =?us-ascii?Q?mSjWu+WX9yYEaw/wwfX6PDDc+krxbyjN6fYp5yImupDFOya13LCJsA96n+uE?=
 =?us-ascii?Q?L/SRHo4yodYueR1AX7JSkcoXndXQRnPP7NNqdQh6N2j1BrmeUNbMBo6GmJhZ?=
 =?us-ascii?Q?K8kT42S8AF0+nlN5MRu88b6HNkcaqSf91LPuNaPyoNO26W/TYL7NLuBQKhOG?=
 =?us-ascii?Q?zTsS6lTCfwGAli7Yst+MRy77PbObMKZgCSLPpTg5kMt1CmGI6Y4PU+YgmRAS?=
 =?us-ascii?Q?tpQVkos7izSCdEJd/ME3HAVm3ZEwm8STDrk+uqjlbokgy4mTceuJD6CPV41d?=
 =?us-ascii?Q?Jm/CfzA48NimAerHu/nqXZEmYHJITIfNtRykljYcmZALh5D3FVwvnihxMc+7?=
 =?us-ascii?Q?DL9uzEGohjKzIaVD3Lj2RX7p76CrJO9ce5OFEE1wdEQjV7p9rzx+/Bobos+2?=
 =?us-ascii?Q?X+W3B3gxoc2rkowniQiRxY2x9kZ+culIfnHLoCnjzkEfHGqO8ahp/xjP3eVw?=
 =?us-ascii?Q?LYBDAaOz0XR9WsezAjKbfuuy4mugV658NF9586BVL8DE2voKDm32GMBm9Fv1?=
 =?us-ascii?Q?XwWikpGAfGBw43Ykw0I4YNpI5J4Kt9kYPC9jhpY6vTiNNur7KKo44dlGhlmj?=
 =?us-ascii?Q?K1zqxQGE713qvqWinBaLM/uhEhU2rWrN1wC7354Qjy5CmH6CUtR1ejqnIP1n?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b949a64-2e00-42f9-8151-08dbfa56948b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 14:36:37.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LxVjc1Fx8Ynq3BpGusyqvbYQk2KcSXS9XivepT6XSftwpjWn8KEcvkyrnqfC225RAM69iSWM+zMyY+pWvmUqoBT5uT9icpma/UIOc4hCjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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
Cc: intel-xe@lists.freedesktop.org, daniel.vetter@ffwll.ch
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 02:44:09PM -0500, Rodrigo Vivi wrote:
>This patch introduces Ponte Vecchio support in Xe driver.
>
>Please note that besides this patch, likely the force_probe
>still needs to be used in order to actually enable the
>support for PVC.
>
>This patch was separated from the rest so we can ensure
>compliance with DRM uAPI rules on compute platforms, where
>there must be an open-source compiler to be shared among
>different vendors.
>
>v2: Add more info about the missing compliance (Lucas)


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
