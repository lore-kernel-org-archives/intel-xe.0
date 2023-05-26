Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF74C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 20:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08BA10E0B7;
	Fri, 26 May 2023 20:29:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4742C10E810
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685132945; x=1716668945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OjI7KTqglx2/n5oiGvozYU3egsrHUJU0+HnL8x/Q77c=;
 b=Q0sdX14euNq91Gy+BN7rPneRcaOLfBxV5nniDh6qwc6euMwufyL+QqPm
 pQ7bEfupQ+nJ3RLzwP5ycTj6TGJXtj/JWzGhgrWOBSW2BjRQYQZqcQ6KG
 kZhgKDcgAEzLeZAfRb2pPUvZoNe/SXs7Y2PvMFhxsvBsdKoD2wuYm6H83
 QO5gw8jnf4X1vw0UEtLLdoxOHbsFc+wep6Mc8Osbq9RIu56TIJh4+0HBa
 hgm4BOfQGviH87DXj8Z9YcKQQADuZsienfiAA+I6hySP/veijcJflWIHA
 /xTgNJefdK2yOh1aRLusZXHNaggRyPR7wqAIbm6c2Y2C+AKLiXTH7+Mdq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="338891828"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="338891828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879654900"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="879654900"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 May 2023 13:29:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 13:29:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 13:29:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 13:29:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqk7jKP16OmIlP/96rusV54bboqWUdj1ugBxVoQKCpCe8bqWsNHVBW7ZWQhMmBxLO5EQymMSi7EqXCnn3A8SbOt3jlUb6IhMDEo5wzdhx0V1d0SzJ58PGSjO8Y3iZf5AIN6qE85Q2PFdihfzG60EYHShNxSAYoNGgahun+24pnxbwWXwSsLtIhTv2xPu2f977kdFJ/6BOucwxM5NjJjIo9NZB7I2fE8xEuFezuXzlkU7BBUpQlqTQnA4/XfHG9ulONxGwDZFZvvBUTRq0o/LwEm/k5Qb+021qZw96MXjsc428wM5Y3S1gLhpBFAshwHzFwFwiuqmVZzd13e6egzEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g72aVKcSMxQUI36hsDkEGeVjOKu8EwwCXYMzyrCEGM=;
 b=F0goq9oZs3a87LHcBH8it1YeogxUgRsxJZF8LZyLjc3/diFuz0m5x6nWRLrBgI9McsDAsn2cV9i4zkY4tmcJrfuCYWO9snFO5PqeRD7QvzO8KqaZ5gmBQ5gsayRFitsaaBrDvrQbkIHr3burHRikk2JrbeDbfzVXtSOLboXSicsDdVPRKINaJ/ORZqisrUbPElgl4FlnOPSfGCPLpR66+VMy2Fy8bUkqDN0/f6Dn8VkSyF06mp3zAd3EwlZwX/Zq98EB/CIrD9ZAMys84CkHOZFyDb8BnMF+wUiBExP0uk4RaRSVGiXNVLT6UTIynu1vy6+DYQD8GNi5DtTBVO38fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17; Fri, 26 May 2023 20:28:57 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::6713:5f49:6e1f:97]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::6713:5f49:6e1f:97%7]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 20:28:57 +0000
Date: Fri, 26 May 2023 13:28:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <vy4rplsxlhim6m5g3tneocfih47l7m32wuxbyvqpwbecvlkkuq@z5cowfy6afhv>
References: <20230526190824.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230526190824.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|DS0PR11MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e9a79f-1b10-4dd9-ffc2-08db5e27d47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl4D4LfC8E0VaXpceXdpszkR3cf9WzM54/PSmndXiZnjITC2yYN7XMiuLEjyNXAEZFR3NUsVvpi0QS0Y2zZeWd6GYV0Ax0LAJibtGq+MnmheLtb6YoTo0MkUPI4ZiQ1cfx0azY36Z1fK276WDx2Hg6YAR5sVYX9xQhs5ytU7Is2SYbQSlUc+rmkljxbiQwAqgOSXnsI0BlKCdMTsWM0n1tHJ3SfRr2E75lTlGt7kX/iU9Gqx6fUYs9esmBOJzx41QzrnqhSSdQSO2Bv0HGmIpCtxevH/qDjhyPjWwBGVbX4AaOwDGPhOsSV7m5Ps4xZQgMRK/ixLDhoFdE4z+b96GPmwXSbRgy56eKOuxRkYES26M96kd4SNjDTYtTuUmLVVL8CXyNYwGgo5Hr/NyUTEt7oN0xMFDgnOQSpJCGgTDvSsDCFZvdGMyN/JyaYzmFAgtaJtyCUwkBmW2kUmWwpLxwJPFCf71LkY7mWStSqTTXps48RroHu52FFfADTV/nACp5cuFZiH46tr/Gt2dnC+mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(83380400001)(41300700001)(316002)(6666004)(33716001)(6486002)(86362001)(186003)(6506007)(2906002)(9686003)(6512007)(4744005)(8676002)(6862004)(26005)(5660300002)(82960400001)(478600001)(38100700002)(8936002)(6636002)(66476007)(66556008)(4326008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?50kFu7BiTk0Riun760pJ5+xTcRY25jTZcrbXHWQglIF2ckt6oA7C4c7oPAXL?=
 =?us-ascii?Q?p+nolwB2uAqJqVjg4OaTTltEihCsFG9lcBaC8N3f2YoG2YjnPHb7arlmfRCp?=
 =?us-ascii?Q?yqtcu1sDlEs+HW15V/ArOMM164CNcE3SXqiRVOdG8UtlKU43JwD84RY1fvge?=
 =?us-ascii?Q?MuOL8tR1KjlnCZb8lT32s/bZzrOZHxzb8L9wI+4PBIxTHhv+aZIYQQ1/ur+h?=
 =?us-ascii?Q?A6KG+F6r88spjuupftcLIRh+e5PtKCP9sDB2FN0LzTp3ufBRqOO7u7ygMk/8?=
 =?us-ascii?Q?cd4tb8vkLfphSxlnJtSyPH6OwQAPO0cN3hJQBAweiaTDR27KAdtVsyPtvPql?=
 =?us-ascii?Q?60fHxsETEBokfqQQQwIA8d8BGjjKmeGosmUghtABB40mgbYc0yz8ntzmBGk9?=
 =?us-ascii?Q?ta9GxhnLNkYJVZtk2BrQEgQIxxmJB7qUp4oBJkiuzfW55+uGFe47J0SXXwLx?=
 =?us-ascii?Q?E2GHRodSwd3DyQDGXgGJe1hl7Fk6fN7z1R/ZHE71AqF/kWibWorbnsDx5eYY?=
 =?us-ascii?Q?BJLHvBBk+5UNUfoIDuJjxoGk5ipSLxTt4qnH/O/alcHdUVA4Xx6eLqKtcFON?=
 =?us-ascii?Q?mTvU3nWMX7HQiuwxULwoxtXt40FOL7lmARgkUe7L8XZuVBraHr1a1e+UxDuc?=
 =?us-ascii?Q?takQa7ROmJSf1i67o/toVie/wuDChBvtqACLWExnCXCr0FLkG2ZGTXddaXBs?=
 =?us-ascii?Q?tNG0QKb+IECRQH2KP3N4aXuAKP7KfhTC9Am7kS9jt+21fP3G/RiVqkyOF9WD?=
 =?us-ascii?Q?hpGCVxUKFvIctjAGHuWuWMyU56QDJghkqPTIz1HwJmkKLMvFrA3EslweiTpL?=
 =?us-ascii?Q?AOTcA8jPoTFD2haKXOFhJKPdur9ASyLINXdTftLU3h6FyO0rYk5SDdxCj+NN?=
 =?us-ascii?Q?8V190wNgGvHFBzw995WpraoTOGsWOK2SSCOLEcdgsTKlc7Xc1itme2N+eM7Y?=
 =?us-ascii?Q?QtRlB+cicpvdo0qTQnG3hRFruHPVLnGdLIRl2zuudkbbSmKD/sipDQZgg7br?=
 =?us-ascii?Q?XthYrSbVMeklhuCsyhydDyN2Un5U4WxdLt5WZzuEpR0VXQ6z0QNSCZPXY0K4?=
 =?us-ascii?Q?l6Do58aoD5L112uoOLldR6yBxRaaNlQSZnfWryhSY+MYRuC9r3mdPCGXF4Oe?=
 =?us-ascii?Q?7sgSSxO8p/kR4ML8CcC4fjCKOffYOk+PET25hzEIoOlQafznOsQaIm2jp70a?=
 =?us-ascii?Q?sFvu9PNej1fdUqJ0g1lRv7PBu7MAM8jBLEgzDNRCvui7IEYRfc+2tIxbJubO?=
 =?us-ascii?Q?TqcTyEwoiAgyaPttGSS5GluRHOwxN0WR56USg2VKTEkKqTXUpOt671vcYhu8?=
 =?us-ascii?Q?JmRgacs8DlkH18dX6bT5r0o7A9o/ANtx8u9zjx5PPJ+gK5Gh768g47xb3qgE?=
 =?us-ascii?Q?Xyq3ILPpuvYEyoLMaaIg9CwTrrHWAnNrzvT+MER79WMzbdR7Q6/d3Zg33eRy?=
 =?us-ascii?Q?5Z9yuQN7BNOgB1Rx1Xe17LCx2SR+4ZzJp+3y9uo9E7qfVG/q8UsAIKWPwxIb?=
 =?us-ascii?Q?/M22qJgiMFbIjVhXEeGSFFTknHoq5n2CnddIr4HdrlY9ohK0TgHmPP4mRwdV?=
 =?us-ascii?Q?2ntWZT1jqRQ/2w93tV3cQmn4C+xx8JnKhkR0U0QPwBnxwc1XQkpGk3fj3Gyz?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e9a79f-1b10-4dd9-ffc2-08db5e27d47e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 20:28:56.8626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEZDk2Y/xc5iNG+h/hTimsvD52kN1iUzAARunMmpI5drYdqELq0SnaxGAd3ZBVGal8GVuU8tjabeprBWk6v7cccqx5aVUJFzHRyhlkJ5P5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/5] drm/xe: uAPI cleanup
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

On Fri, May 26, 2023 at 07:08:19PM +0000, Francois Dugast wrote:
>This series addresses some feedback on xe_drm.h provided here:
>https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>
>It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
>likely break CI.

humn... not sure it's a good approach. we can have it on top and just
commit with --fixup, so it will be squashed in the original commit on
next rebase.

Lucas De Marchi

>
>Francois Dugast (5):
>  drm/xe: Use SPDX-License-Identifier instead of license text
>  drm/xe: Group engine related structs
>  drm/xe: Move defines after relevant fields
>  drm/xe: Document usage of struct drm_xe_device_query
>  drm/xe: Fix some formatting issues in uAPI
>
> include/uapi/drm/xe_drm.h | 152 ++++++++++++++++++++------------------
> 1 file changed, 80 insertions(+), 72 deletions(-)
>
>-- 
>2.34.1
>
