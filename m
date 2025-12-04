Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACCBD24458
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 18:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E79E10E997;
	Thu,  4 Dec 2025 18:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvN+ZBIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9D810E997
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764871529; x=1796407529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h54FbMD63k/Y7FmI37WN9kfyXs2igOT3GfBOGVD7k1M=;
 b=cvN+ZBIkPRZ/wVTjuZsietfU0hqH9xdZA6dMkAjS4IJf0fwDTP1RJ9wD
 aXBJXzxrAicj31Eil2Zy+WG4W932I8HEk+QOXbfwm8ZGO9yQsJ4KwVqoc
 c9Fqh+h+qc449w6rKVc1viHIgXffJoTfuL2eJIG2svk9mHdQVREncaFTs
 Wxuat15To94TCgBdwqfMqqmcpNPnQyCQ8LjuT/7Ebihfg7OOxWW2o0k6i
 2fBY3TcYZ/UMebb2tNAkUtl1vz2eLKOiUX15yFO3f3cINXPsQD7Gqthv6
 pV1SuSrtCsU2bylh/9hZpiHtjRQ10a4J/cm3mnIfDB+pCRKQePz/5r8Q+ g==;
X-CSE-ConnectionGUID: SvvxE2AeTdO2+dRsOktdTw==
X-CSE-MsgGUID: ZUXygoeMQW29/QDmfjoTCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77584190"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="77584190"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:05:28 -0800
X-CSE-ConnectionGUID: UsDU205ERCG7wW+O0WmOEA==
X-CSE-MsgGUID: 9LnllviASdOVzyVzsQrpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194329103"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:05:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 10:05:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 10:05:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 10:05:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVJr/Jzaq0XhnqiOzTxz0QjIg5AD8cxbnzK4i3QztzRPvIFPtxnjg7OQtLM8GjLoiZUUviA5z6y23pyLpenhMo3K7p14nI7/M3SHRzIh0fSATVjrG13TPevgJHUaSr2bCo64U/ewusnOMgVwuLhpU6tTTMBzZFQJ5XPyQGcu4pbTE+34c69kJEpK/7ZJlq6NdM+8ongm9+p6G9P7VU301K8waNiNAcjsR0d/aZIAqUMlT6w5GfesJ9KVUC9Hf3iOQvr/uxyWnzcYIF2MA+lGv7rtD3cnVlCPl6dU5kYTcOyjDlFhBA/fD4meCX1hRernW5WlhILANoCI4z1znbzd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X2iXg4sfqYohm9CO6uSH2rETfpZcBp8dFZVGO4n3qY=;
 b=pq+bnl2A05w+ihVIrxOJIhXQzU83tlvJ8SMjoQOATNit/4hQC/z/n69pI9dJGH+MTjXm8MQviT7eqyn50dINCBIJriUDVQkr2ANiDQFEGp5YFeJ6DyDjQ1/II5V2W6Ous+qeM6EOHic6rTKE5tQO7IXpbMiwes/KqgAn8EkI3JSvwuqSN188HSdIDWP3tARXThV1oLR8b6HcDrlAmTGEMv+yu6D68hyX/utTRVtoWjRCqmqm8/U2vPrfTZZUOQ1i8o/U4Tn0+VeuYNpdrjD7scETJV34g65JtHzpqf4Cy5yoHRyTVx20wVb6AL1SukJC7KYt9gWYG0epRSANq+FhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 18:05:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 18:05:23 +0000
Date: Thu, 4 Dec 2025 10:05:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Message-ID: <aTHNYbsoSJV/hNdx@lstrano-desk.jf.intel.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aTDh3/SkCvIgj3yg@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839764A5C743C00807BE25AAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB8839764A5C743C00807BE25AAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5137fe0e-6847-45ab-dffb-08de335fb209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AFNKJQC9I9DPkMgGZX8n2Y0Vk7QyHYRbHKGQPTfe0RGTogB0p7ZsTSlqpU4c?=
 =?us-ascii?Q?YEkQjRSWuskKJtRNtprvn3Ta1RzcYGFQST6LRqmnEz/m/ZP0ZLFROe5boKx2?=
 =?us-ascii?Q?3pnVY1eX/ReZE56jjYflre0hVTcW1n0sOQ17BJqcqvVnUC7yT8v+yd2ainrI?=
 =?us-ascii?Q?VCKvUDCoIqIXje48JslNGDSdhP0XcbFA6iJl0KNtmF4F8270wZYMyQnKwBce?=
 =?us-ascii?Q?392ztszv7oMu80qPDK6+IniFsJgDS6CBlk+5hPmBu7xqm1hkNewFeJ6P//9a?=
 =?us-ascii?Q?TNluiB/njdMiCLFusDQEwYvR+okEuG1WmdVXEPurmuDEAKXjt83zGNV0zhD0?=
 =?us-ascii?Q?4TjbcCxA7aKUr48k/9z9yc5TyXLhUXPJkEC/zaZDk6GXHYCGAnOEqAjECdXq?=
 =?us-ascii?Q?uKuu1HQKjj14kW022KZ5JGwngkEiDT2s+FCNMtPlDCDFTKnctYQfh4IksmgP?=
 =?us-ascii?Q?Xv7pqyV5Ts7voNZBhaBLUKdVj8fWkUMpdoxpCtGt3CK6WXsNMRhSStk4eZqR?=
 =?us-ascii?Q?XMZMS5vp3wAv6K64RieSors5uOpswCQC9KP640FV82yx0eoqWWYLVBeiThIw?=
 =?us-ascii?Q?Reg0R1bVHw8if0ORJ1z+F5Nstbm7j7cB5JEFbqF8kQJ2HJV9qvCMeoR/jVKW?=
 =?us-ascii?Q?Ep95TnaoVPdZPdSBw3x4qYOkrQbmF7xHEDBdQxG8W4Z+Nqllj2iHjAy7Ho2w?=
 =?us-ascii?Q?3mLvwiPeElR+NK6wbPY33UfYTbk+nT3xfer/78LXDLxD9I99DDZGLKuLd8mf?=
 =?us-ascii?Q?pm51MQymscCfz/wBJ+AejCxSgtmbGcXniMNNo+27iBlEpoI0uYAwQMIOOQ7M?=
 =?us-ascii?Q?way+nCuaZPl16TZqfTnyj7+aFGMg6KP/FE7ldfSB/aDJuLDtO8VxmJlcCa5n?=
 =?us-ascii?Q?6ADbguvXm/Iw5HZfW1zEh2KKPcSUHC3TPXGjgqZBEECubiVxaHJQ9k6Z/+cs?=
 =?us-ascii?Q?1Ky4GVKG3kzIWe/hNWDmnC7JkoTIJuH9izZFtPJdshcXTx+BqVM+k4+WR9mr?=
 =?us-ascii?Q?zEDnbGz4V5GTlZk2VMF2t4wGsMvmK4JoB1Uu3MVQh+5DP0jr4+ANp58/KgeF?=
 =?us-ascii?Q?X8C8DgLXaYnGlc9rAshkxK9wya8OP0awoHuhlPryJS3tniqUuJPajMAAmOqD?=
 =?us-ascii?Q?CCzjJRNWEE2nh02i8IdYnf1ADS4coMXUS/cB5InMusUGuvCn/V11Hww18o4I?=
 =?us-ascii?Q?c3I/2h9pIF1EEYaBbQyHTwsD0UDvq17bLetWrx34q99b5EffYxHTp0qChxF/?=
 =?us-ascii?Q?QDLi7uHiWP86vNJLb0rqXCkNeoX5ZCddEAyvyF1kmVJclQmn/z2hDDEhkEAo?=
 =?us-ascii?Q?KmTBw9Q4DaC2gidG2S0MTot5A429+t9uQqNAuKnIS07J7QEOJXwvyRAv/HAQ?=
 =?us-ascii?Q?Ard3GBjNGwTNbeHTmKUKJlizzqXNy5ASBaJF4X5vjXBIObcMtO+X0MnWDnJ6?=
 =?us-ascii?Q?n0pdxYGV7TmMPh7+r7MHqP5CVeHOb9ez?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qC9bZ8GZIdSqGpjhLDXa2HULUkx4jIiw5COljZZT9/le3DmsNqWtVB5tx6En?=
 =?us-ascii?Q?t4eJ7WziIPfCPOtHWw/uAMohPXRirBTR0uik1nWjS8PJ1wBS0gwnV3ZKjSpG?=
 =?us-ascii?Q?euVEk4iRvGy+cy3Iht+TKkqbP1w8TPvekUc1ENexDSoLx2n2EaqBnaHKgdUe?=
 =?us-ascii?Q?K0lUGY1nSOXeqbC9LHQSHHkSM7q5hR+C2GX7pA0xs2HSlTKRu525/rvp8p3O?=
 =?us-ascii?Q?hWW7NNlneCVm3yPE8e7QmemwhgNO0NsZs7TjTWrh5el6jgGUcwy4EsPgSSOk?=
 =?us-ascii?Q?qwiabDiqOBSjrs+a1YULgmxkwJS+6yOa071krqfB0qjj1rzWjKJZ27btR49O?=
 =?us-ascii?Q?yNK6hu4EJNUDJa3gttkGN+R2KUARVNrHMRnIvXxtgN3wQLjdzXw0OJ53nOrM?=
 =?us-ascii?Q?wB/Zcx3jf4osscNNVSTPobOkxEI6FVtGpk2LnMSEptF76djvr6/OLM3VKycd?=
 =?us-ascii?Q?lyzzsC/jVfzV1H4wjKQ19XEIUxJnwqD+bANmQnCcptCJ9vxDordZoT11r/6G?=
 =?us-ascii?Q?3E6ej0MPfpZROnIszbqaQOTVKEQUKnBGHW9kb5DK+vf/X1st0nnbMajiGqMS?=
 =?us-ascii?Q?vese70vLFQ1HZ0Nq/ww31Finl+HT2fyBOGkNVzxDxMuqPGErxRDBv7TxhV68?=
 =?us-ascii?Q?P1dRPT46EGlzX0yUss9/FHvorFnB7dKXStc0+O/KKnVSKif1mD7rlbYV+yKV?=
 =?us-ascii?Q?31zETlmEfqSzbWvxF/hiX6MW7LOLU+8tdH6XQmtWz2jqBaBuBUCzh1jfeVni?=
 =?us-ascii?Q?QP84sMSAfz/EjkRm1M2q9bZGGxFyuOmqXkJkvwog8aOksAa3g9MnLGZLUSZC?=
 =?us-ascii?Q?IBpAmxyhH+SI/CC0tnE2iDzOYOwTsoSjXHisFfTOOZbo1BLYSfLng7sL/8AS?=
 =?us-ascii?Q?5uPiXyMXcfnakpB3eDgUzvn9yD+BrS5dpp5jscic4w+3rv/g+GFfAvbjxewy?=
 =?us-ascii?Q?pSt2+vIgVFt0GR+mOSkxmbeES7lO010bLjkTfPXw2WSlbFpfNtkzMRt+9nnL?=
 =?us-ascii?Q?6WQu2U2OelNWJ54IIfSShZrqyGlcyzH1DiIUy9macxKxxKlcnKLHHqy6fGGq?=
 =?us-ascii?Q?X7kVEePHzgJZGmBMkDtUOTaOt9ncKS5zqczpywypjgooi+ZCFKNPPgfljhLi?=
 =?us-ascii?Q?nIU5ejQ0Bo/Nax2zyLfevVEb7YWzy3p/cbDx6sXh8SyfMewtC4VKRpL+62UX?=
 =?us-ascii?Q?ysn8eix2UZl27qhW6MeOlWhYC3EJepIXvClrYP0/VORoDGTzq06ub1IryUme?=
 =?us-ascii?Q?BSO1x5ldpR51BN19LMzqA1HaiCdkPxrRdDaG6lviSmbTnXyTPnQjdNjyIrXP?=
 =?us-ascii?Q?CqrPom9WKZN70wFZU2EW99VGcYGKOYW2OAkAisjwq8cIX1C83cfcXlbDNhAu?=
 =?us-ascii?Q?W80cYiW0YFUGJB3diP6hj0jMmrMVuMTQr8q8tjbfKq9BO1vuMJHo+Pbnqjbr?=
 =?us-ascii?Q?x6EJqvvSDgPyIIH1Vjsn6PyDdYXxvhRTkwGPCCBEkqYUaYdf+jTQr0nwpAus?=
 =?us-ascii?Q?5D6XAna5CT+UyKiN/ZXgDAxG9VuhU3yKlF+y5rEQsw0bNvlpNHIjDXqMOfon?=
 =?us-ascii?Q?dprF7M3RT8o8B0SLp7uw+VIh7G0OTZt46yvxHewh7q9O2XMYypgGPyb7UCgH?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5137fe0e-6847-45ab-dffb-08de335fb209
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:05:23.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vMfYSSabymOfyEgsaLQ1nZ9KIsnx+cYPgjFu+7tHrCyPgUV3HY7tb35QRaEXc2ymjm4HDnIMagghySc2X1lyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
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

On Wed, Dec 03, 2025 at 10:42:00PM -0700, Nguyen, Brian3 wrote:
> On Wednesday, December 3, 2025 5:21 PM, Matthew Brost wrote:
> > On Wed, Dec 03, 2025 at 05:22:10PM -0700, Nguyen, Brian3 wrote:
> > > On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > > > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > > > Use page reclaim list as indicator if page reclaim action is
> > > > > desired and pass it to tlb inval fence to handle.
> > > > >
> > > > > Job will need to maintain its own embedded copy to ensure lifetime
> > > > > of PRL exist until job has run.
> > > > >
> > > > > v2:
> > > > >  - Use xe variant of WARN_ON (Michal)
> > > > >
> > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26
> > > > > ++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_tlb_inval_job.h |
> > > > > 4 ++++
> > > > >  3 files changed, 36 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > b/drivers/gpu/drm/xe/xe_pt.c index 347b111dc097..833d6762dd8d
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > > >  			goto kill_vm_tile1;
> > > > >  		}
> > > > >  		update.ijob = ijob;
> > > > > +		if (pt_update_ops->prl.num_entries != XE_PAGE_RECLAIM_INVALID_LIST) {
> > > > > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > > > > +			/* Release ref from alloc, job will now handle it */
> > > > > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > +			pt_update_ops->prl.entries = NULL;
> > > > > +		}
> > > >
> > > > Do we not need to do this on the media-GT? Or is issuing PRL a single GuC sufficient?
> > > >
> > > > Everything else looks good.
> > > >
> > >
> > > It should be sufficient per tile. KMD will request GuC FW per tile and
> > > afterwards GuC FW will issue Page Reclamation to all the primary XeTLBs, for GT and media within the tile.
> > >
> > > However, I realize that this means we should be disabling PPC flush
> > > for media TLB invalidation otherwise, it will conflict and do a PPC
> > > flush anyway. Will have to rework some of the logic to handle this if so... Taking another look at this.
> > 
> > Yes, that's a good catch and would've missed this part. Now I'm wondering if on upstream devices if flushing the PPC cache on both
> > primary GT and media GT is really neeeded. If not, this might be small perf win.
> > 
> 
> I asked Nekkalapu, Satyanarayana for HW perspective confirmation. Media doesn't have any PPC to speak of,
> so, it looks like PPC flush bit for media translate to a NOP so we wouldn't be getting any perf here on upstream,
> maybe skipping a handshake at most.
> 
> So, regardless of PPC bit enabled or disabled for media, it shouldn't interfere with the primary GT caches.
> 
> Therefore, I will plan to keep this logic the same for simplicity unless you suggest otherwise.
> 

Can you just add a comment around why we only add the PRL to the primary
GT? To naive reader of the code it immediately looks like a bug that PRL
is only attached to the primary GT.

Matt

> Brian
> 
> > Matt
> > 
> > >
> > > Brian
> > >
> > > > Matt
> > > >
> > > > >
> > > > >  		if (tile->media_gt) {
> > > > >  			dep_scheduler = to_dep_scheduler(q, tile->media_gt); diff
> > > > > --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > index dbd3171fff12..2185f42b9644 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > > @@ -7,7 +7,9 @@
> > > > >  #include "xe_dep_job_types.h"
> > > > >  #include "xe_dep_scheduler.h"
> > > > >  #include "xe_exec_queue.h"
> > > > > +#include "xe_gt_printk.h"
> > > > >  #include "xe_gt_types.h"
> > > > > +#include "xe_page_reclaim.h"
> > > > >  #include "xe_tlb_inval.h"
> > > > >  #include "xe_tlb_inval_job.h"
> > > > >  #include "xe_migrate.h"
> > > > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > > > >  	job->start = start;
> > > > >  	job->end = end;
> > > > >  	job->fence_armed = false;
> > > > > +	xe_page_reclaim_list_init(&job->prl);
> > > > >  	job->dep.ops = &dep_job_ops;
> > > > >  	job->type = type;
> > > > >  	kref_init(&job->refcount);
> > > > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > > > >  	return ERR_PTR(err);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > > > > + * @job: TLB invalidation job that may trigger reclamation
> > > > > + * @prl: Page reclaim list populated during unbind
> > > > > + *
> > > > > + * Copies @prl into the job and takes an extra reference to the
> > > > > +entry page so
> > > > > + * ownership can transfer to the TLB fence when the job is pushed.
> > > > > + */
> > > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > > > +				       struct xe_page_reclaim_list *prl) {
> > > > > +	struct xe_device *xe = gt_to_xe(job->q->gt);
> > > > > +
> > > > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > > > > +	job->prl = *prl;
> > > > > +	/* Pair with put after bo creation */
> > > > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > > > +}
> > > > > +
> > > > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > > > >  	struct xe_tlb_inval_job *job = container_of(ref, typeof(*job),
> > > > > @@
> > > > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref)
> > > > >  	struct xe_device *xe = gt_to_xe(q->gt);
> > > > >  	struct xe_vm *vm = job->vm;
> > > > >
> > > > > +	/* BO creation retains a copy (if used), so no longer needed */
> > > > > +	if (job->prl.entries)
> > > > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > > > +
> > > > >  	if (!job->fence_armed)
> > > > >  		kfree(ifence);
> > > > >  	else
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > > @@ -12,6 +12,7 @@ struct dma_fence;  struct xe_dep_scheduler;
> > > > > struct xe_exec_queue;  struct xe_migrate;
> > > > > +struct xe_page_reclaim_list;
> > > > >  struct xe_tlb_inval;
> > > > >  struct xe_tlb_inval_job;
> > > > >  struct xe_vm;
> > > > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
> > > > >  			struct xe_dep_scheduler *dep_scheduler,
> > > > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > > > >
> > > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > > > > +				       struct xe_page_reclaim_list *prl);
> > > > > +
> > > > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > > > >
> > > > >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job
> > > > > *job,
> > > > > --
> > > > > 2.52.0
> > > > >
