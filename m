Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1DDC4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 00:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7810E49A;
	Thu,  8 Feb 2024 00:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBCPkY8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EDB10E353
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707351435; x=1738887435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AH6Onmnq5tUYhnEqbwe4UAmlSgWPCSCwfu7jK0DOjfw=;
 b=bBCPkY8jP2ac1UVqEZ7c6R6cnKyS7Xspd6JJR3l7wOMCJ87iI44LV3t6
 2UIPiJF97lbczUdLeMl6m13xyyn2To9QuRCL3rv/BFaPxoeIckdjaM0dj
 QVuQYXJClY3wl4M5CUjsQb0byU9l0c1nVpmPgAVmriu/KvDjXE2N4/wh1
 Ul9VMa9nuHLQ2rW0seMLcOPl0qF0BOxUbKq270qRh7g/Ms4fu/A/WqLYy
 LkA0KxL2UKguJm8OQtvMrCw4O3doYAQrOarpIGQmXeeDZD44F45Vv/BtJ
 vCtEwuii0sIHmLcXn6lPp5SDdTvTy0T8nS6aZg0ZaGnH8HQMl/JWW3RtA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18528459"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="18528459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 16:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1518011"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 16:17:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 16:17:12 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 16:17:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 16:17:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 16:17:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrwP7v9Wh90NbWY5YhDA1IFZKioIeIDy+w/TDBD49BdAjTG792LKOeixUjWjumKo/q8kzZbQZvRkIoUGFP3L9/4iCJ8Fw8pw98ec2XwOTD7nklHiOFG/KEQ0J/Y6SewOlX42g76E2SHKCp70qBW0gswlgfOc/6M7+Gc5n4bx5z7Z6l7of6K9cHEl1IdN6W3qKWnwvfvWTMpPnij1PWbH8xzPLPpefnb8mHsVAAF/6WFB8/NB53iOJb2R8tmcU/JsjFYdkmxyGv/9BtpFXlAdozDIO5IKsbSiHAGzmjU31wH96WfTc+FuGCqs7DvVpk6ZdTyXDmgQggNfxF/iJsljHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH6Onmnq5tUYhnEqbwe4UAmlSgWPCSCwfu7jK0DOjfw=;
 b=UpdVoBna6b+Maq7y1KehmCvzGC+Ipds57JzjcvkDoZ2A5DhAPAvweGi5E+9dGUWHjQqLaaKdWrC4yzBx3GwEjMp9KxRn0ZGayjacNSpQ0/9OpqOkZ6rr4Dhu+z3qX5udk2Maj9pO1tB+ARkgKH12Es/WFQ+CxoduScpN0DjltMAUaBQsrUckl5NJyTFV+EKEXKoVLpa3fdQFBao42hSVhIfEE+fcqJ5VJys6bw/nyLqhVNLhnpHNr1V44jPsYDTRBEgcSuYvcyOAPYFFdV2iziCuclvgCHx4PygL4RquSOvdDV8OCjqCDuGbhqKiBE10A28pzxd1RsbFFBXcbe/Yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 00:17:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 00:17:08 +0000
Date: Wed, 7 Feb 2024 18:17:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, <John.C.Harrison@intel.com>, "Ashutosh
 Dixit" <ashutosh.dixit@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: Re: [PATCH 2/2] drm/xe: Avoid crypt message when there's no GuC
 definition
Message-ID: <at5ly4zqruhgkahe4c7xlvrirlliyy4u5xdimvv2hs2jk5f7q6@ugzvbgfnea44>
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
 <20240201224724.551130-3-lucas.demarchi@intel.com>
 <ZbzXcpK3_tDghRXW@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZbzXcpK3_tDghRXW@fdugast-desk.home>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 8728704d-d9e5-4768-a55d-08dc283b4978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgBM3rcYTukEnS/kuD0EZaO3Y+JBetEeKAkddnoYOQ1CIV7O0GTjGl0sca3AEhZK/be7cOuzBU1xlFsYe3GUJVnlcyhl2hfxTo/bW+mnaLNVE+Uq8B44sg6dz26t+4XTlaLvjQSKVFbS9VXx3BGE0KTBCnPQImIP6Xq5iGlc8a5PNP+hfteVKORhx/GXXxewPMgrYH0iogJ7FVttomgXdNNI8srXy/iXWMcfILxz3qDHsoYZyTkq7B/2MT0hoAp7bwuT9id5RdTGUr5N+TNAo9yevbj+DRzxsc8BVFoqDrtV05680n7hZ2JCXj8INtpjJDWpkygt8+2AESSk5Qi3SMxcZhx+HAi7CSC54syuDtljsnWT2BijoThHJsbhU1GOU+7w57WkUZB/BxU35TMLwivsn9PH20fQwtw/r9NKx0Q5cw4/AQk+1LfQteXsmkgxImvumex1pO9bdqhqagosqxnYs7F5uWPyjoe+XcXxWMDkRoGquR/jW7F1iodfIR/I1gPg7zRFK0FrOHdZ01y/j/UC8aLVMCaQj5+9ExPv68EdCjZriJQPe3n+qT7gA38R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(376002)(136003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(5660300002)(4744005)(15650500001)(41300700001)(86362001)(33716001)(6506007)(82960400001)(38100700002)(83380400001)(26005)(54906003)(478600001)(6666004)(66556008)(66476007)(6636002)(6486002)(66946007)(4326008)(8936002)(9686003)(6512007)(8676002)(6862004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a02ydgxLnpazXFrSteoBQJ9MhJDDDpS/KK+oJnYbfrG6NGLm09GSzOhMUdhs?=
 =?us-ascii?Q?xKdOOp5N6DnvtVvjK23UcbE5GcuhvvzEqE8ck4qNaq03e1pkvhTOWIHIiybB?=
 =?us-ascii?Q?BO2246VcH9oELuwP37Jl6lFWxVihciFMtsBw07pqbv9FQc77+8cOCbF9eJRr?=
 =?us-ascii?Q?APuUsWfIArQvP0iGI/K+/ExnqsA84/fJjY1r4XNoOcMeKGYLcJpdO2lhrEPz?=
 =?us-ascii?Q?JVuAyPjv12d4NLfySY76WVbsonGjN+ESWKTpQW4l7N/FaJ4xa8ywaTTVd/Nu?=
 =?us-ascii?Q?5lZgnx2/FBK1u9Vhjc9kFs62INMOssHjg19Yh5wjRyJgoeSsxS/YAHGqSMH2?=
 =?us-ascii?Q?yOxU5M8FTQCclBeT1k/FEQWoDPrAAdUK34DgCmC4GcJDmkc3eZMW6bnRnJEn?=
 =?us-ascii?Q?Bb4kMsvBYb9XXPtGCkd4E27HCG2C45VemTGC8pNFl26hcNEinRjCegll1kNr?=
 =?us-ascii?Q?Sl9yjZrmjDDSGkXvNkro+w6kNovmWSLnYbFml9NHRcbHgCNQ+lJC+s64BiX+?=
 =?us-ascii?Q?9vKLElTQkwsUx/twLwQxugCzsYswA8Zc8qeqhdlpnZUWsk3byXNfCe6ExUZM?=
 =?us-ascii?Q?Og8xNZmEOozsZcRI0vKTB5Uz8KygqQLezDCOYcrp+lIcyM2ySlOBwEupBxQT?=
 =?us-ascii?Q?1vaiaLCinDJtR4HRi0KaKUsI5K2bBWYex9kcDOrtSJYhxGCI8tfEsv0MI4Ql?=
 =?us-ascii?Q?jj9/F/8vcNrQYg6q8fbs/pylj3cQ4LqZoFOx8WikBa++IqsNsM6thJTk3ikv?=
 =?us-ascii?Q?S1miVY3D63PpodWuDsQlFVjsN9z0lg1k8ukx5iK2T8kSIoZg1sVX6AIuMXpm?=
 =?us-ascii?Q?dgezPENJkLxbjnZRv0NihQqoPuagd7/FNITvXiXjUgmJ4CVqRGPN75sjISey?=
 =?us-ascii?Q?iRbxApmi0ZwT4ZuDpUqO+MHo4J7pkesbYK0E1hSI3Ehm7fjne/1drnOp7cpY?=
 =?us-ascii?Q?gCLJYH7UmOeU3MQoeaRgI3YT6bUeZoMi1HZjiouNQbeQucvice9j/Lc65C6I?=
 =?us-ascii?Q?/aJG2E8E5nXXuRekQQS59hWoMTZ2Z3+Bs6IlASw5fskHlu5WoB8D0XbJ0vtV?=
 =?us-ascii?Q?DmRCm6vyONGDftIUI4qV/MQARdtNiVtqp1Ho34Z8ketfTnnRQTgsAHiUhuYj?=
 =?us-ascii?Q?qx4jPhy66+cFbi3IeR12zB126Xn49nL5b8gKLoCZrZL+iXBMsQ8+wx7bRnyD?=
 =?us-ascii?Q?PlcN0+rSWUS8JUnHrdTjIDPWA8nfOFwUxzgcf7kESiT46JeU0J3npJIVA/SD?=
 =?us-ascii?Q?slq8XGFubND1T7/eUvPI13uq8LYUyqgrz0sVxmCxUToP8GbjZ2zHtHljD5YF?=
 =?us-ascii?Q?5x5gIRkIuD14wLdoHSqczvFdWrJk0+yqTButX2c6Q79l72ZDkdZBAqzHvHHB?=
 =?us-ascii?Q?m+XtDkhIfG5b9P2KrywK3g1ogyKKPasP8eUC4byXvMMudNf2QQrVR9rTSZG4?=
 =?us-ascii?Q?TdDt3/7zNceWEQAIbdP+mY12jvlrhAh5nyI6pMFQiglQkz3Y2LfQDSRuyRDq?=
 =?us-ascii?Q?zV986WIq9q0G2j5SnqvPxbLwvTAmExmvMi4dPNZI/s7ApneSSD1KKS4HQT9a?=
 =?us-ascii?Q?GSENbbCcirpr4ygQhy6oyzNZ9AHmuVCteu3f7LBXM8PJ0slS6+Ea7a/vJb+h?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8728704d-d9e5-4768-a55d-08dc283b4978
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 00:17:08.1772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVPrAngahwNHOB7Wg9D0Hz4jpZmAxMaQYnXHwv5/wXv5lmeAEZy3nnnxAd+TDZuQeMksv/+9fuTcrH7mZPTqInSBFvIskDaTl05NRN4LxIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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

On Fri, Feb 02, 2024 at 12:52:18PM +0100, Francois Dugast wrote:
>On Thu, Feb 01, 2024 at 02:47:24PM -0800, Lucas De Marchi wrote:
>> If there's no GuC firmware entry in the table and the user didn't pass
>> an override path, the error message is very crypt: xe will simply try to
>
>Here ^ and in the title, isn't it s/crypt/cryptic/?
>
>Anyway, LGTM: Reviewed-by: Francois Dugast <francois.dugast@intel.com>

I fixed the typo and pushed both patches.

thanks
Lucas De Marchi
