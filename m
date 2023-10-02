Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDFAE7490C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 19:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBA110E22F;
	Mon,  2 Oct 2023 19:24:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973610E22F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 19:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696274680; x=1727810680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y5maUi+sRKoQmpPLCzZV/OAp/VfrzG5nz/PgIVhiRZQ=;
 b=eN/JhXYn+ovVU5VKlbLh0+9ZJOZ2SLq7UZ74JL5f/ms2WkcZf7Nt0jzg
 /kX25JSIkdtWK7yQSQTnXm47oz5FV6Nao1ICdocfzadogllqG1GR4T9ct
 ggaXAFCapLj/aRYhSKKlj3vvHwkSbiNzk1PnF4k1/OD8Z2qhx3W+CWYhk
 KkfuL88XaWOQGn48xw9bHZUMvWii86KFhxSoDeGMzBIha0y98iCU/CVLE
 unTVyJ+6WA6+C4XpswfEUYqN38Uh06YT1/rybhLgSPB0uWTyDHqp9Trli
 Ar04LESwIO2bl5TjqXvBBwNL7g3fUZFC1nMN+H4WrjxGPTgOZO3AbkE2X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446870691"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="446870691"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 12:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="874450148"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="874450148"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 12:06:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 12:06:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 12:06:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 12:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT002uOX+rB9N0YtSsEU1rWMCTHO3qlBwq0KSKp1UPGEhjLo0LrlvBQbAvotaCh+POohfW0MtZP0kgqTTJNWFj7pfceD97lcxxUU00HzYvc1IZ8lpcB8FPesolvRPCSQDf3x6W6OU/fq19+cEuNnl2wj/hjkVbL2x0fOhYlnC0QdDidBXsjdKwd38L1cHP1HQDzmVG2LxhM1txtb0tAdRNhva+oPjrGLABktYWR0qm//4chmylsEuf3NhhZ8am2WCTqeakP601kR2Cwv4tBD6HOm37v27iOQ/HU6Sn5Cf2968jC9UAhJDsCKCw0I5ycn4GOc07Y5051GRtgvymVYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5maUi+sRKoQmpPLCzZV/OAp/VfrzG5nz/PgIVhiRZQ=;
 b=OCOK4S8AkLhOzS4xOl8i1UV9jzC2dFeaFjFnwyyUvsrsFVz8oTGOBYA0qM0sWqJ5Hx7U4J2ixWV96I0R6zzKpCq9yGEzozJf8otvzaCbcr/VYCtL+5lPzwQY/lkvKln4RiUCY0gg9dBf8N1XrJPplpAZb5RaN8n01EK2knSMzr4QLRfrxu/EmEf31ro+rvhAb3UhTXRChO9eNiTEUs6ji8G0gcbhV9a2Tz4lAgmdOpvyrQLC/Z/Ts3afez5LP6R/gakcV976HaJpIeZzbfdX6SQQTDU5FcEk+r4l4060gNQVcxqZVPErEWJr04puaFjuIxbHgURyI8NrrB0KBnUN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8600.namprd11.prod.outlook.com (2603:10b6:510:30a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 2 Oct
 2023 19:06:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 19:06:35 +0000
Date: Mon, 2 Oct 2023 14:06:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <hzmo6zmrr64w5zeqi3d3enymg7ewngq3ma5s4sfddqpia477mf@7rmuu4chz5ch>
References: <20230929051539.3157441-1-lucas.demarchi@intel.com>
 <20230929195811.GJ233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929195811.GJ233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b06cf1-db96-41f3-ca61-08dbc37ab295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYPqf9C7xZpt6S3TBtk74LCuuz4Wm8KjyO6GCV9fmY6qSazJ9FyMxve9tW5ac1e8QjDZN4Iiwq+QECXvSFjBOJL7Mo+j6i/JYGyfp7b/LpG9Ko9eVApvNkkC2uVeadOxeA1tKhyVbLa3HRJhuds5gB4ArWUi1mZGG0WB1jpDkLkH7d1m1NVMDMvjtXlgdiXsxc5a4vxeBt7Z1vpwCOTOxuA7ntSQfHq1eHKQqFgHNCvOxDZuhXUeggvQErrAM8Ow9ihxb0HsF2BSo6ypYZdeO+HbHdeEjNVM3v4tShg5f7tQSy3EVmG9vdvRRezRdeW4BiZ9hhUt7e7ncOqM2V7NKrpSIwIkJfM+Is2Ml8cQnK83fVgsI5Dg+IhQJFTxCcYtj9N6KhY+n09pzBWBqxHEEmWwu2YUeeBxwceVtvikPlWossKIIucydtoY1L0szK4V8sg8TJ7MK2ptJOKsMr98ii2y+dZRvbzbGwPKOFUdG7hWDa/7JPqRGTcNKhbT+McBE7GMR2mHOnMQEzpLJXqmhnE1A4Rb5vsb3hwMTZi1YPQU0gFf7L070+lv8BM2/zBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(366004)(136003)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(6666004)(478600001)(86362001)(38100700002)(82960400001)(33716001)(6486002)(5660300002)(6506007)(4326008)(6512007)(66556008)(8936002)(2906002)(316002)(66946007)(41300700001)(8676002)(66476007)(4744005)(6862004)(6636002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rq4nVNJ3QT0IyXWlD/QfqzXFGbifcRm/d1YCSfUqXXdr5n9iMpDiYyidS+XE?=
 =?us-ascii?Q?tzOVGKCSdFEl/FPU5bBVk+l7X5R7q2+NFURq6n4zvz+ZRY+O+Ejx7TOYY8nv?=
 =?us-ascii?Q?3i/cUCOm6buMXOIHO1IqeizNd6nWJ80QmEmk9A/0/LprXx1nQ2o2n2lXWOD5?=
 =?us-ascii?Q?4Kz5j/k0BsC7/BSI2Kdn7EkBAwyjsmI2IhhnBQFHhLIe8r0m5DB5hclFG62F?=
 =?us-ascii?Q?840ETsP+mjBVK9J+Fj3guFe3KmlaUD2HAlNnwjSMhlBHi8LKMFH+TOQAoUnW?=
 =?us-ascii?Q?FIJ89T4DQUyrez1Wrebbf2PEO2PBAWW1h+YYZxFZyy2OkWI65mxqj5Mde7st?=
 =?us-ascii?Q?NuR9kvHlQ0KS8gz/vCNaKEq2FEqxquJccD0KVnivzVRxq+iBFtm8CFSa+Sgw?=
 =?us-ascii?Q?Fhaxa+J0GyzyvClX/Ycm1Ick8p0ZaQsuTQ6YmwL3hpn1S3W/2SBrGn6ozB4w?=
 =?us-ascii?Q?ysKMpIUfBPSz4WpUZZ1IqnmYEuiiULOGaBI/FuR+5hi2HKG8npZ++K5Gvcu2?=
 =?us-ascii?Q?1EbFcyUk10iGaueo9r/NxM13SyHOXIXbcntX9Fh5nv8u2YwK1xZC7Vru8uIo?=
 =?us-ascii?Q?7hh5XDkEXnuXNPjN+cGagBZ7F4k4ADJeoliyO4kNq4v7v2cIUagzbIRN6Bus?=
 =?us-ascii?Q?NcZDuH2dSQy8g3IcQB85KkVKazk8ozbIv5WBlVfQuci0wosduGpXoZOXExWg?=
 =?us-ascii?Q?9n0TMveSM1G8XT13CK0jd/m6X0zaAro0hO12ghMVkfA/CoaeMAV6Fv8Ztavz?=
 =?us-ascii?Q?lnCa92Xa8nAQOj/gNBGqr/TC/1eVmuX66z7jFJwjFljsIU0/1/mMfnb+/i0o?=
 =?us-ascii?Q?DYP1uNGSXmsxxGvS+hdjh1oz9YqHBTVBMFLOE0OoVpczTi0pAtKJJ4mWVTZY?=
 =?us-ascii?Q?MstL83xaCJHDKQ1lgNyOQlztpXuAmq575p478sLImVlx7lpNzimuE839tniJ?=
 =?us-ascii?Q?sUJ3B0U4bEDfuP8vV6rpjFPBB3AKF4rv5RMjJadrERQLHgPg6YW+pOSS2qRz?=
 =?us-ascii?Q?pPVMxymItyVDNUrGVJ+KySGiATNwGt2sRNnbyfV8hwmCDRzFWYVUKCb2wQ83?=
 =?us-ascii?Q?kxNSCL7hKR/vw0USjfo480pM7EUtGhcA1eZCyG7gUu3ccN+jrtRI+LE+bcWl?=
 =?us-ascii?Q?bVtzSVHEtgIOTzHM1MZir2QpVvtEbk6PcUqSAa/zo65ILdldKveLN2DYP9Y+?=
 =?us-ascii?Q?YQf25Zu3L14/BoJjXpCeFMy7CnT3YP/AtRtiR8/IfaPHvBFsuiKjDd6mVDPp?=
 =?us-ascii?Q?V4AX/p6+gCesMRCRtXY/9azeGNicg7Zre8TLDFGuMm1HuR/XGN+U/K/HH1yt?=
 =?us-ascii?Q?FqXwdNRM7bk2TI/tsR2ztlOYvly3+swfpNEmn5ov5VAAme2G08FfMc+UMupG?=
 =?us-ascii?Q?ivYCLq2jTYWKM7KcbPpdAY+FWvGO/gKKiPzA98SwV4sf0ob3M7phzNPRGAcY?=
 =?us-ascii?Q?ZBInEQ4GW+MzqM5M2/4mV5u6MzHCh+MX32rjne/NrdYK5frSM2xyM53I5SGJ?=
 =?us-ascii?Q?mhHsNswZm3ogXM0VuCAIH1assMsNk+WbTQx33o+Em28u7I2g3D6LXAHI5nWj?=
 =?us-ascii?Q?hVUtGvOMArTs+d7sThvMt/F9d1+SIzFEfSbX+aXCeZ3KN/m2i1gqoPhyPLyF?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b06cf1-db96-41f3-ca61-08dbc37ab295
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 19:06:35.4086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogscxXoJ/qn7AYbhIIoytbeLG17CceCeHp9D2AztNoOuwpB5BvbfWKVLCjLaSMZOPlYznfYcCftx1lyzbOo69/ynMfBazYKjFh+qoQXJw2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8600
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Leverage ComputeCS read L3 caching
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

On Fri, Sep 29, 2023 at 12:58:11PM -0700, Matt Roper wrote:
>On Thu, Sep 28, 2023 at 10:15:39PM -0700, Lucas De Marchi wrote:
>> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>> On platforms that support read L3 caching, set the default mocs index in
>> CCS RING_CMD_CTL to levarage the read caching in L3.
>>
>> Currently PVC and Xe2 platforms have the support.
>>
>> Bspec: 72161
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks, applied

Lucas De Marchi
