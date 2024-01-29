Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50421C47DDB
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 16:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188C310F723;
	Mon, 29 Jan 2024 16:57:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC83B10F723
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706547455; x=1738083455;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=zyPq/gGHAvlA+2J4Vxn+KL6nEepk9YxaTm7FTlTUCYs=;
 b=cXbjf1LUujKCL5jbGUOSj17MZKXTJ52dZ7HmZ7S1zk+5QgOhFjTgkIjR
 e9Fcn2WuIGqYhmv41gD//ZlVs4z3/y9dvDoYjWwIoVdPIgICojSTpGaHw
 AZFNtwVlgaB2YZrvQqULdrTQCLBw8K5HmM6ODtpqP2ViCEE3TGjx56utR
 9WBq/nk8Va8h2jqgjUd3WyDgR8ZIq52TZ0Vd83/3p0F4m3dhbm5i0G0wT
 GQ4lSGBtylcbnzWWrsDL9o8NDDbtYcGzhqfvuxSoWxuxTohVEESzheIA0
 uSyFko3gqpQ5Tq/Ts5a5Sdk0qHWSVRPZJuCAuRwuiG4d2vSghP239gbvV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2870679"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2870679"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 08:57:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="911122919"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="911122919"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 08:57:34 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 08:57:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 08:57:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 08:57:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 08:57:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb5D2NWyodptvHY/xJBiizTiya3ezVwhaPtTf+3ktuioU4DzPAPB110KUG2jdQWfUICdvFDj7vawSE8pKDEltEQHDpM7f92opCiL/QN4C8zh6OS3CftKw7vTV6VY32gujCdyqhmP6qi+XLLZy8B0a3RQSZ4GBk2zsQ51NxH1Rfw/WP7dSSJ0wZwXF0Cwb+E2X/2bEAn5309zUSMw6dcYu0lOF1T+Auk0Mzy1Rov6ca3S2kzYv//RmU+by5P17Y+nnGTlbKC9huULeVrHmSQjrCnX6qnhlkOIjij9Kv/5j8QKZFchTRyU8fXfPNPsP3J2D6yku3GP5dU6IwF9I+y5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMY8La5cPF7/YjiGujvG295QqKBhCvpNuQqfVS1jDDs=;
 b=W+QVASfQo+SueCIAUSW97/Dx0itb5BY5QbVHk1dVFfXWQORKUW9OaiuWtQdQN5Gq25XEIHujSsRmgozpv/Ciqsym5fxGyL0OT9xWMM/37CY/T+M/20k8rqtFpG9RCpmIegUtgrs0Q7v7d+NzzdZLgi9nUsn1bp4XhW6t4i5sOyPoDJCHrXIkR2xC1n6pgdLnc9D1kxP5P6jxrJodbN+aNeR6oU4eYy7HRF3ofrFrow1CuBqinVwCI8pwOW7XH7ywhS01TrBT9pKFn6BY0jAqV7z9VH7KJaTuiad6hYP5+eJ58AUDpURq4oEmqiw+7U/FoWyPRRoKNiPg5ijr8CXUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 16:57:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:57:13 +0000
Date: Mon, 29 Jan 2024 08:57:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVDogc3VjY2VzcyBm?=
 =?utf-8?Q?or_drm=2Fxe=3A_Gra?= =?utf-8?Q?b?= mem_access when disabling C6 on
 skip_guc_pc platforms (rev2)
Message-ID: <20240129165711.GA1201779@mdroper-desk1.amr.corp.intel.com>
References: <20240126220613.865939-2-matthew.d.roper@intel.com>
 <170654578715.806401.16166121334742078158@5338d5abeb45>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170654578715.806401.16166121334742078158@5338d5abeb45>
X-ClientProxiedBy: BYAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc41788-0c30-4bd8-0ad3-08dc20eb5784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSCVo6lnWLR1eSQjgSfi2Ty5bNWPluhST6OPvXHehGde2HYMrivs8AY00ffZKj/Sbbiratd7+aSUJp4irT+gqUnRHpciseSMf+wKXdttQJATKhsww+L8JvUsuonx5LJv5bXupQ3/wqXw4LmbPmXLQkcmhuE1M3hNezKVUCFaWmya9naXceItgtGdQzDOzcUSG3SDJHfj1D8666H8YnRiM0ae8otHcnn2Yz2jNUBW6YlD+6udsH6IQk3mb41k2fQvKK1YRtsGad8N5uEMtuvk5mkS3kDWqio6ll2B1hY9f+th7Vo42zL1atUknlaOT/cfYXzDpQqsYWrM0q81L8rRkCowhB+9B5n3dqcLCSG4rR3oarD0TAGQJAqtl6D2nkzdkx217LvoxZOKENdkODn5Ou8UNgT7tj8XhfDMpPmMHg2Cjp+gWaYTbu9o3AGn6QhmimAHVqCFo3tCEYsqTvHDPP5XoD4o4Oi++0Jtt1of7T7FXiRamMf7u6iweuqXDrNdPijb5lOfRFbkW16mc3N+BnPMIL0LcXu3kRDSyQ6WC08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(26005)(1076003)(66476007)(6916009)(316002)(6512007)(966005)(478600001)(6506007)(83380400001)(6486002)(38100700002)(66556008)(82960400001)(66946007)(2906002)(33656002)(86362001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N6SokGA9p6c5HXcOL66ol+QsKNZs/Fm57fTby5tRiHidgklXl51bKD0DjXjm?=
 =?us-ascii?Q?H4txdgZ30UFavcAaJd16HrTA0nb4HhIzsIvqeRZNM09VoBqFxl60GT4YWXhl?=
 =?us-ascii?Q?zSsB0xnuQsB9rD+utB07txQXFq4OFKZuXoZTyraJg7dCK2vukV27RkIHmkst?=
 =?us-ascii?Q?MUYBHN7+bLZGbRAohUyNgGhtxQJGOh8oI3PPu1bY8P6RI72hWn0cb/NY7Iv9?=
 =?us-ascii?Q?NdIc350Dc7lU87uR7GjO4bMs0BfF+YGyOyn+9JXNpPS9uf4DPL6Jer3r0zET?=
 =?us-ascii?Q?3x9uimlxPB3ppPZC5ZN1xG+06H0ypTjXlBZHO8HYqhCrAVXuB6RI3Qcpf8CC?=
 =?us-ascii?Q?UHHDKr307TF+e9T5dGX6gMJkVNyoKCtK5mLAR99o1aVg/d2NY5oWufZOkFYR?=
 =?us-ascii?Q?+XCHZte+9HHWWW8x6g5tVDWtSMPjVLUCIhvEKvS1yaeVZNUeQOmSUrTRz7WM?=
 =?us-ascii?Q?pflI5vmHwb0sqviEvY3KHIV9sLajaChW6vT9xfWQszFH1o2JXgQnsgP4zlz/?=
 =?us-ascii?Q?LdQedm7Xlamz1rcmNft4Mv7GtEdJehT9WgjDiC5HRqRjMVjCycZqsyhzdnps?=
 =?us-ascii?Q?jVaN66x+UVJbSbOt2A+eBx5Uusy3xvuM9+UJTqrCpRJ9Sc5QD7xYeBVJnBlE?=
 =?us-ascii?Q?9nnXXSvJIBoqQ0VbiilFKSBFqGVU7GSlyhiC6Hvn9XENs8jJurAGIvcHYbxV?=
 =?us-ascii?Q?d11YQseu6P5YhSeK+8KTfyB7UEEB75iWt7FjumtTK92Yt1rjxbFsGnwtFCKG?=
 =?us-ascii?Q?kKzvDkibNSEuDasV0PG3y4pXEYsvZpPR8FC39VBJF2VV8vGApazlUIT+RZn8?=
 =?us-ascii?Q?MQG16bfk41JJ2nb2DoabopxIL5Xxfbh5MUMAef+hNLsULjgT6DrY0rV1X9wx?=
 =?us-ascii?Q?zdOeq9bxoktZELKqnPVymthSJ4qsxGiXlaJKIUZDm/M+rKOqsx+m1YLO3m3N?=
 =?us-ascii?Q?x18txJGlCHFAPWMQDh0DFBRkVFa5qIcOKKAk5XGuP98s4EwamrwgFoh+KpF/?=
 =?us-ascii?Q?f5lTzhWpEcgpIMMtSlyC3PXvHYCiSTKHqV+K3xV+AobW1mhQBj2e8j8KBQ3k?=
 =?us-ascii?Q?50UixeKGnPmCX5RmIs/uGZqK+GDgQs0J/q94rsW1hzhvOQeU9zMJgwRYFrq5?=
 =?us-ascii?Q?TlApaTO79G6yLu694p0Fgrh03tz+FOt04wvNYnv+dZ8rlnfP4HTAdRKzKW8O?=
 =?us-ascii?Q?cVPZ24W1SESlqKICQAIDkVbf2dopWvoFoZT6w40GpjuDhl1MTOC68CMoJanS?=
 =?us-ascii?Q?UI7UyxZsBM24Ef5GZxuhlM6ov0WvA4Ifztkz0LwT3PWQMu8uA4+LINbKQxjZ?=
 =?us-ascii?Q?dAQmfYxXAvI466qrvUBY4JXJlhomRVbiUpZJYMwLE55nSV0YL8G8cBs+phf9?=
 =?us-ascii?Q?tbfZtvfz/b4u2Y58kgq6VLXhodryWJrEqjBt/o6pn7tGhFChfB+zKUwWLH1t?=
 =?us-ascii?Q?51uySgqxtMLp3d1dQoii99BleMWpJ3Bt37Q3iBSRO7LA0O6rswKcDbD7goE1?=
 =?us-ascii?Q?A1c3dkKJ6tJXUQujxAP7wOcwn5D0pydz4A4w2y75RuHASrKTE1vcB6xQylA8?=
 =?us-ascii?Q?8LwD+hx6uRAplYZA0J4MKGm/8oz4xUpTPDX3hhm3hLlxheSOmixNW5qm6UJs?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc41788-0c30-4bd8-0ad3-08dc20eb5784
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:57:13.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DypYGrcTe7klhb8rb9Kh7jCxln9/RpAjlXyQmcHg3DNCbic4az0O9MWlsqxnL2RSlHWBtbETk35Rn3qdPy+11OmQ0yw5dFZ9mUqISibrz3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
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

On Mon, Jan 29, 2024 at 04:29:47PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Grab mem_access when disabling C6 on skip_guc_pc platforms (rev2)
> URL   : https://patchwork.freedesktop.org/series/129221/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259_BAT -> xe-pw-129221v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Matt Auld for the review.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259 -> xe-pw-129221v2
> 
>   IGT_7698: af750f5e7eaad98d40d8c924eb5f05e99d3c668b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-697-114c7e14fc8f30c4f3e0a39819b7d138ff5ef259: 114c7e14fc8f30c4f3e0a39819b7d138ff5ef259
>   xe-pw-129221v2: 129221v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129221v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
