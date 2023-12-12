Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BF6C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 17:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4920C10E64D;
	Tue, 12 Dec 2023 17:18:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253D610E64D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702401499; x=1733937499;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Hv8PeAupw18Zp0YhRZ6m9w4yJDEB8R3Bc8YITWzo5Dk=;
 b=OtoQ40BVXbllPDh++KAwnKzTDQ//vbBfVgH2VY/qxEsnKIKHUe+FV8es
 oBAySVnFUhlbhBTbLIFbwxdRAevqn70b8QFAiAxPlYV+g13mRRIoJUrlk
 2sH3SOIV343IFboC7Kdm/R+WraXKsLQUHf5TaprJGYHSUsEVbmgxV2F2F
 4TzZTer7JMJMoa5LhCkspR3iqMbjWZyGRYROO7fGnSutS130Rm6+TJ7rK
 ng6Z3y8Fz1Ao2qhNquLw4q3rZ78Rn0l3vFMXHD594rvBgbvcCw30Xdll1
 ngY7ZbR/N30xkyrZXTJYXyRTzwCJkOicL6I6WoHD7X0uTkyUHQ9JsS68b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="459161291"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="459161291"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 09:18:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="946842555"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="946842555"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 09:18:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 09:18:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 09:18:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 09:18:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 09:18:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoFW7A/G9H/Oc+FFk83Xs8SPENVB3oUyMC0pR3zVssDPRxJxrNmchrp8dXmKeA4nPXBZXW49ZM3QPU3NSUlTB3Z6tFnGH6WeWS+caaw+bkhSIdXp3n4xvwDs+/4noFus1Hdy0BkwNZibtnz5nFaONSiWtPPbJSMtKo2Y+uWeRFh4Jvv/L7C9/tu3KjGN8eTEemT6X3EFP614Tm2tvG292HF2LN0n8MlHZCOmtZkRbuSUotnaSl2igxIw0gnp62GEQXSeTyh1pVUmcOGusG4fAQ16MwM2lxfdguO/wtqQ0AtIzesPqy46IliEXRQ07hN/ekV1K7jC/+S/g1tWSpGwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yknReDNtgh5ps7Pqkb/lgjTKAyH6NSseURGJtfhXImE=;
 b=aT7ztqBVMYC0pjZhaNY0W7z3Lal5QqShcIwYWTX+9PTFLwS3mUvNLm2Q0el5Diei+7j22B+EeHrTwRLHkjzWSMMQXQ9ouSVYNWTiBhLE+4B04RNN1Cw0ENR/FAma6IYS72UHKcB75D4ihtBnaQvvPKeRYrw0TCGue6TTadIdSHdfK40wKZodepYszOsnI4qqHFacvV2PWLUzUTONxCXi/2UIqhQbe9HTPm3LwOzjaPEtRABbf+e36Z+74DFdUgDMztEV0jeGuUeJWMdKGmNELkwBuavpGo0sq33d26y1A5BisaqGuQd66yRPLJmGWIJCge2A91YjvqMzIArvNgQ6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 17:18:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 17:18:12 +0000
Date: Tue, 12 Dec 2023 17:18:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-xe] [RFC PATCH 5/7] drm/xe: Take in-syncs into account
 when num_execs or num_binds == 0
Message-ID: <ZXiV3340/iRkrcJC@DUT025-TGLU.fm.intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
 <20231207055729.438642-6-matthew.brost@intel.com>
 <c02d0342-3b9a-7454-b9c6-c40bd0fd61ea@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c02d0342-3b9a-7454-b9c6-c40bd0fd61ea@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd357f0-ca27-463f-759d-08dbfb3651c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XUx57n6u1ts7a6BaQNM3e+l0Ma0GrwKsUxnbw+sKtCaX3h9qM/yKeh0JYCF3LWpf1KAuMCYzlc7Rx7J+HKH0ln1skYeZoJRuW5p3hNI95FiPXtwKyueUc4dAzqpvEV4c65fFJA18q1bZPu8I8+E11YZ+OysDE4wiS2McUSKFfZT0VSeCFElTLdd6HVN9mQgk+owotySaXtges2TW1ozdACpJmHRVsUNFyk+GZmSO3O2k75fij7BnsPjFAlgwMdYnrZOb93b2usniTSFH4e8XbIQcAAT5jgbDv5pdMURGUQDXMynmribS2t+JOMid8NJ6w0FveTlfFN5rqbCyKM8/IJzFG9T51AxE2tQIW7x73EFKux7v++JuY/SQ08uHCAtsUXQoJxNlK8peL8MLUjFlhba6i8UgQ32wg3g1bZTGX2/cxcXPZoY94e7ba46H4Id79RG7Ha7g2m7IQpTDx79ePbIkCu0bKHKGufqBB6cYVXz3tWlY6hUzCTPRPJP2e4k5JAx0NVhD3Tlzydp7gesaey8zlNHnnBoZyo1Skxz73CQemlmkv6yc8T2rqzyxfC5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(66556008)(6916009)(66476007)(82960400001)(66946007)(86362001)(83380400001)(6506007)(6512007)(53546011)(8676002)(6486002)(4744005)(2906002)(316002)(38100700002)(6666004)(26005)(478600001)(5660300002)(44832011)(4326008)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kTTmK3uFAq3yIxlszBiOKFqKgjVYlb2ckbg8wNLWtOkBKZFH3glNOTQLtO?=
 =?iso-8859-1?Q?Ni6GCAR3Q9dJPHwCIgGcjLe2/h1JlCRA3Bip1WRe80jrM6/RykzcldhnJ5?=
 =?iso-8859-1?Q?gML/I0dl5TjMq2aUWswNuHRC90HmM1Ic0met8Urxso/HhztdDNvs00Qj3+?=
 =?iso-8859-1?Q?ulnZQTYmCzoKarjElh2POY6gOlzkzKSMVJl7qLy2T0gInBKY84+5zUd954?=
 =?iso-8859-1?Q?ZR5lRhR1UwVo9uXqSRzJ6KN0KHNn7rGdNivsssdR82xIAg2bTjMwUQfSne?=
 =?iso-8859-1?Q?fIPlkv3VhgjPOJJny/dj20fvZvXe8ue62drxf8ofYRZaBPOYd73J7aD/5J?=
 =?iso-8859-1?Q?fzif80k1BlHrT99Txo6Eli1RubJoKZhZ8HsST7eSQAaK/L5ThnLrzrKpmS?=
 =?iso-8859-1?Q?2XiLnePvgqjpCq/JnyX1gYk3hPA0lYgz1H1CXPvVJKv4rQTV7fMmAKh6DU?=
 =?iso-8859-1?Q?TkrSXsgPYCEhlofGnnX/elnAmct3y1bcGqheoR4LYmCyQIfGbjznLZYZgs?=
 =?iso-8859-1?Q?8z2SNXAeSo5DGirIkcawKja+6IJcEcU3G3o4TUk6prN8JPL8GYEMrVTTBa?=
 =?iso-8859-1?Q?X0IOgoJPTnQFNQ1MmmmjOJ8eSPpETYTJv7XuzD3WshdjNRdR8/XduWrAPD?=
 =?iso-8859-1?Q?m7LufthSxNOX0dGosuxqQHNv53yv8qLbO8UIoZaRF7fMpM3Q3aSkafmals?=
 =?iso-8859-1?Q?1FpQ1Jn0RjXDStScFEkJNPKgMj1Ubo1yJzZ82UIWzyKo6iYAczyLJx9XrV?=
 =?iso-8859-1?Q?DyMK/0CedZg1NgH7TLsvhNIV8tm7G4oUCuhT/wrp9GMDSpIsCul7zLd9yy?=
 =?iso-8859-1?Q?ZEkIfNSMGulJ0sH7eqIjKL1VI1OtYPTa1bC8mGVjDrkg1cg9yzqqGfWeOg?=
 =?iso-8859-1?Q?C3bg7TGlLsVwV/0s0G+btLS1cg0MRaTM+dnIQ3jFapqqkuV6hraJGkd6ET?=
 =?iso-8859-1?Q?rjw5KNGlBdtjednrZw+pzEadqEPckptV5R4QHFO9HZMT14rmJ139/x3WP6?=
 =?iso-8859-1?Q?AEWHx/kERt4T+dWEn2vYSzC/e/z+YbdjKffAufFXTeMV7LX8wSVuBjb/MW?=
 =?iso-8859-1?Q?Qm09jjlroe08RYOYwixtjYAfVgh7jq1+tVR12wQgWYIFAB3mADjBxGMZ11?=
 =?iso-8859-1?Q?nftz2hUwtY6nEahxXj9DPHyORoKBRleIt8jBU51GyD/Ew1WBIMmX1AJ7pa?=
 =?iso-8859-1?Q?FypR9/reajaO+mwqUIi0cAoxecCsgrqr6IkhqOqxL2JMiIBMGysvfx30VG?=
 =?iso-8859-1?Q?61PIWUCpQU8B2lGRqA7nyH35DPBd/jrN5D9gp1/5T8CXF8ipcY9p0LnVyT?=
 =?iso-8859-1?Q?Lo+EiNunKGV1NJY7IZ6RWbNuIFdrMDWfy1zWYF4S3Bn4+P3LmlBk++dl6S?=
 =?iso-8859-1?Q?WgaSaELhqTNKPDNXfTamcocKzIILbbuXnNyFfFKqjIUiuln35ERkw1Muvg?=
 =?iso-8859-1?Q?sSoqMhOlemLoiI2BLQ4eChsi87upaA+Vo60sNYZKoVyCwQaIx/JqFgNnDB?=
 =?iso-8859-1?Q?uhmQ6p1E5vlWP3kMX2//uvKh+woXasdWMgl6CHm9j2yiGFBbJKVWx4Howz?=
 =?iso-8859-1?Q?FGViE/Yvho+p6QiWrv+sdtTegtFtJ/EiqfoptcOyrCWlzgdCaD9XNTIrty?=
 =?iso-8859-1?Q?VEllBHD0vB8QWj22R8SpMgaJc1GeGRHm0ztvIMjUq+KheEyihGeNAhFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd357f0-ca27-463f-759d-08dbfb3651c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 17:18:12.3726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1cyNOvW3f6q5bffwT2unhlpS8UbPlaTbNpbevuFb/GDYQYjgq5SWt3Xj4ljvj63rXRzgBER/QNl2C1AYW1cHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 04:04:57PM +0100, Thomas Hellström wrote:
> 
> On 12/7/23 06:57, Matthew Brost wrote:
> > Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
> > 0 in execbuf IOCTL or VM bind IOCTL respectfully.
> > 
> > v2: Wait on last fence in addition to in-fences (Thomas)
> > v3: Use function for in-fence signaling
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
> >   drivers/gpu/drm/xe/xe_sync.c | 74 ++++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sync.h |  5 +++
> >   drivers/gpu/drm/xe/xe_vm.c   | 41 ++++++++++++++++----
> >   4 files changed, 121 insertions(+), 9 deletions(-)
> 
> Should we move patch 5/7 and 6/7 up the series to that everything works as
> expected when we enable the functionality.
> 

5/6 build on 3/4, how about we squash them into a single patch?

Matt

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> 
