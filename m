Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F8C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 21:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A619710E37A;
	Tue,  7 Nov 2023 21:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B0D10E2D7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 21:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699391323; x=1730927323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L3Y3J2jLDKl+M3GWLfG3To9ro3aPbsH+kWMGDyVS8CU=;
 b=F+4YBAZQ74tef2BocbAiGYUqxqqL6Dbg/ylWayUWTZN9/+0UlkFidXj1
 ewUH37Llt47MtDrbb18JMQGrkpjnB46k4tHaBDQnMKDtTWyv3DTf/yf0P
 nisGyDNwT8H0A4giy5U2TE920yICyIPV66MRQKHISPR1pa4BS49EG2tch
 wXVEbJOrS2KL/dO+lrb49ikiqS2oVDwehQee6dQE8mYuqsIpbs/KJMwua
 Zgdh+MwgA83yqIxJtWKi5vTIfsFHav0Nie9Fyyc+82O8cC0FV4DzEDM41
 4Z5RyPOEqb6EjP5Wyxd9kz0pZ/gyzg1NrpyUOJ/Q27mP5gvFRAYu7ABZR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="369824799"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="369824799"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 13:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886436105"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="886436105"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 13:08:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 13:08:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 13:08:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 13:08:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVhSCHRMhDny/cM+qw47NGl1e7iI8dGdpky8GZum+Xmn9aE39OyGJwBTYUs7GmzNg9kWuI0Kianep7NckUmXOjGFMEEALVr8jQJWuBcn9olBvJnilxG65KH9p4DIrFrwsD4IwRjGN14HRSJ64sLxQoa0VxYcTx3LInikSm2qEEcTuh4AYQSabZ5/vFIVmLLLK3AW2HLfV8b87b/Ujwj0UrgkK2Cxj8Ya9X2g0Tid1PkwJrhAb3cAm7Rxpez6qboJJB1GDj5ki2iGF1PY1dSTaNp8y4waW8s9h/C1bRYDUPq6xiI6UoU4kp5MkKKA5KVlTt1bSVyp8z47fDDqxP0LVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Qmo4aK7mjNWeYSU/CjNcUfQUzMtiND4N6J6K9AFFSk=;
 b=mv/B/TwK9fTN1ZdMEEwxqFTdhJaVEgEIuL/gD8kk2FkYblCTlxJSq1GT1DzfJXNq73mAFgaSXdZa1EwoSwNEYn7bly9rSNbMC6gbCRgkZMoyde88rPN1Z2tzMF6A3K+chcGVW8gOCd5DUN3iaTg+pc6mXb+XpQ33e5dcKQVVr1K0PMuLQu8kOf3KQlYnVQ/k2j94L20IBOQkoCH3r6xOl7NU0+LIF44sFR8HaOaloBygLFKAeYp5fPZ29BIME+ZirQKgs3cW3Fb97MuRvtY8qPwgCczV9Hqrl42Ya4SJJeB1tM5pgvWSbZ3dNbV04Zoy+nzydpos6E71mF0K42cAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 21:08:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 21:08:39 +0000
Date: Tue, 7 Nov 2023 14:07:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZUpEuvYaUyV5m2Wy@DUT025-TGLU.fm.intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-11-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231103143456.7-11-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 5116d533-1909-4b93-9fe9-08dbdfd5b711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EbaVxXfkhNEMBnQn7i0ckxWFXFAQDX/stOCTueURwDCGLpyt1XUXV2N7MMAGOtahWVv6POIYjxhjEO1vvekgE0m3jxQSgpXoroiMVVpu1LpAUJN7kelo/9ZNU4t77WOwx2fzeulCPGEDY9+qPAqwHWPJsLiCORH3hGtEwfZ+kF6u9Bg55zOtAtrenXLYhic9xouOdW7aaR9yBLQ+tOUQ5VwIr6HVcvApEjA8DqkQg2mdZ6kmBOearGv3n60eItUn+NH4nvPhEHlIxRQo1dcZt0J+0ZQGhI6NMZlpf9EL6DkV8T981MAhXWfH3sJ0yjeSHpSFxu+WAm96enaqZfniqha5IeesXVEAnOcDi1ZCq4nfVeiIbV59+RxYkLI6laUmxXTovwNTvZMJE/uvU/dj1pk7p6p2JFPY5LGb+aYczJWxEwaV16zI1H0RYbP/UOTM/4Re5yywpkDHZU7XWUIg03Ekz2MIk03LurloVEmhkbbJN+tSU2ZEKVzj0dC72suKCxH6w+iXiKCqx4jWoOLP3OUT0VvuuL0EsmHKKLJLfCifs1eHbyGu186gMeb8hGycNqNTAF1Ku8bo7ra02vMgqzixuVg8713eHXO4kuvBzKAa6rDoG3d2YQVvrZ8/C69F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799009)(38100700002)(6666004)(6506007)(83380400001)(82960400001)(6512007)(2906002)(41300700001)(86362001)(44832011)(8936002)(8676002)(4326008)(5660300002)(66556008)(6862004)(66476007)(66946007)(316002)(6636002)(26005)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K3LFMPqQ8VmZmUJ2ofRAGC8gFTw0TI4v3j9l+NJK0y2/OuRwBn+7trLBJiKx?=
 =?us-ascii?Q?B27TRJOptPVMF1DWSRqZsQqkURA+Qsk7241FnCn342BD0nI7HEWQ6kZVZCBy?=
 =?us-ascii?Q?ZJncgvGFB/ReFAPH3i0Ccla/YxAZQFMa2zQ64xxnQz8TGAPx19nyGdILBMpA?=
 =?us-ascii?Q?PKW1uL4QK9P+Sj+5YPNScPqVHEZQoCjIfXmtSV8f3wnjZtJxm1wEJv3jVxtZ?=
 =?us-ascii?Q?9v0dmXQjc1wEgzMuVRkjvUhdzIBIeH0a8+ZwMw7mjl1EsPvupyX8GIMuzE6z?=
 =?us-ascii?Q?X/mkXTEQDj5d01MUeuP9R6zhKhZsEgTX7XCe1kWPJQjegV+iCafUboA6aPn0?=
 =?us-ascii?Q?ihkCHtTdK/zp19xEYmN4SHApDCMblE/jqqxh7mD92tNxgE75w8zeOw1+m5RE?=
 =?us-ascii?Q?SazlMT7LSfiI7qmekQZGOPQoR5Yktvz/+Jk86VvgeqQYUfU1zEv4O/p9E/2R?=
 =?us-ascii?Q?/VMlBmzppJPoeKB0RhwDVyiJmhGLDX761QUWnpN2nzjn32viHH0cwU5tKSr8?=
 =?us-ascii?Q?BN4ok+dCVbnfBXnctlPdQnwAPdT+YS+ZDa4foy86Z3ZHx/ET+7S38i+dxleu?=
 =?us-ascii?Q?Mc/cP2MMDgff23EiFUxXzzZK5EJkL4Ip/vFnRA7sKwjU5OCsqvq940HcH2H6?=
 =?us-ascii?Q?6WJ9ULXOm71wAJz9bjDd4+gbY1eiWmDx02MKaeDYNKFzy8opba0Na96DyARi?=
 =?us-ascii?Q?e55zDjn4pg7qlcln6h2XvxI5jcMaB54/OlODr7AzyhBP85vpd6EDgdgF8ZCA?=
 =?us-ascii?Q?wQZeJV1h761FtLGZSarzH0xCtwlkkrci0HD/C88wObXMNO/SXSSGdk0xQk7i?=
 =?us-ascii?Q?r2WElPGB/aNfvjKSUKpMacyJvLeHOtAnMDmdIHNbxoOAiZMXr6G98A2zJYGb?=
 =?us-ascii?Q?ZQka8MEZ9G9DSlhyas8FXnQ9sEZ0RlYbAsQhGvwzqedgvrr/Q1KKfTX+l589?=
 =?us-ascii?Q?mqdDmBzi/Qrh879WbliNwFGqpQ+IXFOVyHP9cdi6elH0hBCUa0fsqPRIMYqo?=
 =?us-ascii?Q?VWwRIuym9WHITzhzycDOg7kj95Sw9tD39xc2/psBBXOEhqG9VMS7cuCwhMiS?=
 =?us-ascii?Q?jOVn5QDcdiYEEFe2yo1AayDsml78CDxSFSF8hTRzO8jVURysXfTQGwKRrJRi?=
 =?us-ascii?Q?CHT13QKtVhON/g/oq6eDcHZWkV5EkMJcdroZ6pvGyIHMSarxP3nAD1b2iHtF?=
 =?us-ascii?Q?GHSpu6oy9ER//fLSsDU4IO0uXfxfME1Qr9mTaND9Zh+EeJkRROSf+LmDTWP9?=
 =?us-ascii?Q?Bro93msVgkqKOfPcrug/sBZVe+SXe/jOvmopgBib6gv8qt5qa8OV0cljEMHl?=
 =?us-ascii?Q?cN9hvkmMKGs1PwLn7yQ7StOIsCI7r6e75YtZpBNVaNDiWB3cCVW9NfTqpO/W?=
 =?us-ascii?Q?n2eWrXzwKp6JIW4J+zbG/ywQpZSoRqKeo6fbrOY0hTanmPP5uzfS3FR9DReN?=
 =?us-ascii?Q?9/yS9CBT+jxF9uH3hScCawjZGr7MkzLYjkR19MAUkFi1VUedZV7D98v8wdfc?=
 =?us-ascii?Q?Uk4J6X7oLOug2PKvV1vH/7iLzFfn/cMggYg3xMr8J0I6niy3JI/AEMAY5BTf?=
 =?us-ascii?Q?RVy6xt+AnojdjYfXiTmfJI84jwRJ7ejbM7mv5efyot97Zhstm8VPJ3YsXMe1?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5116d533-1909-4b93-9fe9-08dbdfd5b711
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 21:08:39.7018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP528wPU/KdbP8OzfvfZUXNU94axzBu8F4FwJbHW6/1ea1oxlwEr4Z0nyS3h6yEKO/yp1Urr4kPPoTwxL1vJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/50] fixup! drm/xe: Add uAPI to query
 micro-controler firmware version
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

On Fri, Nov 03, 2023 at 02:34:16PM +0000, Francois Dugast wrote:
> Remove warnings below when building documentation:
> 
>     ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'uc_type' not described in 'drm_xe_query_uc_fw_version'
>     ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'major_ver' not described in 'drm_xe_query_uc_fw_version'
>     ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'minor_ver' not described in 'drm_xe_query_uc_fw_version'
>     ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'patch_ver' not described in 'drm_xe_query_uc_fw_version'
>     ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'branch_ver' not described in 'drm_xe_query_uc_fw_version'
> 

The orignal patch isn't merged yet and include in this series, just
squash this fix into that patch.

Matt

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b53b3d9882a1..b1e9d8089d5f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -486,13 +486,13 @@ struct drm_xe_query_uc_fw_version {
>  	/** @reserved: Reserved */
>  	__u16 reserved;
>  
> -	/* @major_ver: major uc fw version */
> +	/** @major_ver: major uc fw version */
>  	__u32 major_ver;
> -	/* @minor_ver: minor uc fw version */
> +	/** @minor_ver: minor uc fw version */
>  	__u32 minor_ver;
> -	/* @patch_ver: patch uc fw version */
> +	/** @patch_ver: patch uc fw version */
>  	__u32 patch_ver;
> -	/* @branch_ver: branch uc fw version */
> +	/** @branch_ver: branch uc fw version */
>  	__u32 branch_ver;
>  
>  	/** @pad2: MBZ */
> -- 
> 2.34.1
> 
