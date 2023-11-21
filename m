Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C7C61D94
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 13:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC3C10E2A6;
	Tue, 21 Nov 2023 13:36:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55E310E2A6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700573817; x=1732109817;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D8eyfDIwbP7GWNyIhQs1R0BaNBFyeeG999h6zxjn5Es=;
 b=UyoneTaKp6O229vwvAZYWIMhwg9VJkWwzsOdW6adLEFfmwBqajACIN+m
 rKHAY8ZvJRDIjV5077bU3ENEdU3iAGy+1ptfggS3bOFNSr1ob4QJFHdG2
 YvhJW0bU9kAjgivzwSJ9Ceuvxk/NaHpEwDnUxJmYLJaOmOTbvH/AnlXP/
 g2/rRNe0WYRn5EimBGXucaEa2w8070Ge4OqAy/XeziEf3W99eG/x4CJ2P
 rfD/eik9GPrk9FBt3ULavOVgGVgMf8V3dZEg+miwn2IVoBGcGXwaz2sZI
 sFSxHwMW2lCdaLoY9gNdqVTJQE9xzwT+0D0aV+Hi8nidprRDjcoJYOU3P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="371173785"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="371173785"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 05:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884213737"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="884213737"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 05:36:56 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:36:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 05:36:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 05:36:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 05:36:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUjgUVchyNijpEgxwe8iAu1gqS/qVQX/0UzrDoLLwKoclZf+5NtV3bZDX6fzL6oFVDYVpUcTNUj/5V1BdivqzhZUG8S8thb5tJUIQxYZVz1esnu5aroqJdOMXUmVAzD7B3eb0k2FWgxaxju7K8SNlpql3uGxGTTVqtwkmTrCJL3zz6FLSJOOkA5FGPbmP18PG64RR3MCBiI/UnnZmu8bCUL5eoz73FXxsb1R45uGJfmZbmtBQ+Jj92zf9G1vz5CNp2ar8rTvj+k62Wjub++vtrhUM3qsOBQCuqvIxMYBDuu/J2mrOU6BOj1XIGCDxn3mIqRYR3VZtNlGJb187aF1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZINfJ1uLMz/fPpXqBSd7zxv133lnMru1OjWNxHAZOA=;
 b=GA6SWpPq5aTd5hiAL1HNZe0gkQk89LEY15XbvtYfgcAy95loH5oP5HMLbYNOPzsc/2gmxypyD73gh8tuXdzeyBI5bIn8HWPzVuv5BvIiT2wBeLcLD2y1edbe7tvKENiQcCbybX74Fxzi3AtQ11YO8Lj20NbiMHm1InG0bFxoTUz9/DNuNetx9E6I4iz7+Tt7wNMdlIqd6jKouRJ0Mbb6Sv9Fb5odfIsJrGtLpMxSO0WJZyQ6hAbPH4cbAYPZjhMo5qbDlVCPUTcIGg3IrnDeKnPcSHhlz65/vZumCSJv/rkIfxnJxAavZTDXSTJNsgOFfAh6s77BXiZ0tVaDnOaj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.28; Tue, 21 Nov 2023 13:36:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 13:36:53 +0000
Date: Tue, 21 Nov 2023 14:36:50 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <oo4aez3zgfrrsxodefoshqzpd3nb2g5edvnp5dnlq2vudxsbai@3qv67a2fjyze>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-18-michal.winiarski@intel.com>
 <fcj4ysjh3miaxnuqaoemjdw64m7xkzmnvhgefcyhhqr7wmvfao@4hbst6eluwrg>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcj4ysjh3miaxnuqaoemjdw64m7xkzmnvhgefcyhhqr7wmvfao@4hbst6eluwrg>
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 4642cf41-ec5d-4fe3-48b6-08dbea96ebf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n1r55dTVzQaaJbUMz8zD6cnL1DvtjwcO7VxcgF9avUW8Csesh5385S00IEOrX7/nGE++sCUgLwiDLlWbYZFEThTlb4dSVvBDQtPwSqpaXVyKC1mzEiBQPG19OKuQPV+/HtXmHFUdzKTT5W+agJmS3vpm70l/Lc6KWnhjR9+ZqnHLBHFlzfKBXfBV0Anvte4L8OMz3PEOU71OQleDOslZJV2Qf8y83iLFlzBC9/8zWPKx07JmT80POGFOSo87cH5xHnsZcH0e2M/uBv6oG8RLrwHA9KAHs+kumBMEAXlAnq+0R2XxioohteDe9gaPwnOeOtC9baf8I7ulgSymVu+u4flODb40L2jalW5j8h3BlxdDAt9jDIQRatC5/AKV2lkghLST2w7t12pmmAMeclb9V9h505m0lUh8jeqCxFpmgR5jT1DPUrj7af3hbZ76TTFXaQK+J3zYNH7bgaeR0OtKNyuLOa0NEJNW5thQFysdclGoPl2IA6+sG+tNyZOlu/lEsTIaXwIkRIx0s7bn6+KaNF390qCjgb6a0w+89WEiCkspbZwyegHE7Zz5KdKVnO6E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(6862004)(4326008)(8676002)(41300700001)(8936002)(2906002)(6636002)(316002)(66946007)(66556008)(66476007)(86362001)(26005)(107886003)(6486002)(9686003)(6512007)(478600001)(6506007)(38100700002)(82960400001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snk0NnlmK1RUVnJGaTZQN2QwYmFtY3dVcEU3NFMySkJGSGswb09TL1hMWHYv?=
 =?utf-8?B?VXNGbVk4KytqZCszSVlSSTRzRlVVSXcycUJvRWJEbExlR3ZjQ1pMakJJcGxa?=
 =?utf-8?B?NW5ad3Q1UE1SV25BcUd4b21jNjFKakRsSTFTSVhVQ084NnlFcy9rM0NLaWk4?=
 =?utf-8?B?bHFLYXplNnQwVDlQT2pSWW1ibXQwUkt2N0w1alR4R2tLbjBqTFRNNXNvWFkw?=
 =?utf-8?B?YmhmVWdFdzhXcENiRzIydDh1c0JqalJ0ZkJXTE51ZzNoamowT1VSYXpwK2RI?=
 =?utf-8?B?UVM2WmxDcVdlMEh6UWdiVHc3UVpRTWVpcDlxOENzY3B0UlNMcFpIYVZhM1I4?=
 =?utf-8?B?UVJMWXpUSkxkejhUTHR4N1hkT2x3UXBoQ28zdU5GMnp4MFJhN3l6MDF1UG81?=
 =?utf-8?B?VCtnTW5NbTE5RnlpbkIxRGhFekI3RHRKVDJtUyt3Qy9sblBDRDk2SHRFU05B?=
 =?utf-8?B?YUgxRWlMNzZmbWQvcWJlYVd5Q0VDa1VvSm1JMlR3YWdMUVBxYlBSVFhCWExo?=
 =?utf-8?B?VkJ0SDRDV2c4YVRoVnFnNGdneThRQXVvTlluTk5ncENBRmFmRGFGUGx4QXF5?=
 =?utf-8?B?T3FXZTNPeGp2a0FTZ2pQS3BTYkpKa1J4Vk53ZWJjR3BheFo3OGF1eE8yQUxv?=
 =?utf-8?B?cTU1WDVYaFZvSFlLSGFxUEo2SE1kK2lvMXpnZkZtTURZQlFpWVdFWE91dkZo?=
 =?utf-8?B?T2Rham5NUHRleUV5TUtOMVd4N0ZacWdGMWpNR0NINk1QU1ZlNHNZb2dkaHBH?=
 =?utf-8?B?VjlEMWNLamVPVktiZmxvVWlSOWdCU251MGhuTXVyWnJyampiRFFjU1lGT1dM?=
 =?utf-8?B?OUFxYzRKKzhURkxaQ2tIVkZiUDBaWmw4cmw4RlRzSjhXMklENCtCanpnVml5?=
 =?utf-8?B?SUpEeG11Qm5jTk45OVM5U2dkeUN6TjdPNUZ3dDgxSytNeFNNVG9VRUhJeG1R?=
 =?utf-8?B?cERhbTJKdjAyTGlEeC9TMFQxUVdzamx1UTFlTFY2eHhQSTRFbERWTmVkVGVW?=
 =?utf-8?B?QVo2bHpxY0g2R1d4MEpGZFV4dGVEL01BcTlTNmtaOExFVm9POUowSlRDWlNk?=
 =?utf-8?B?M05MWnRhdndHd1FrSlJ0OFBIbDJEOFRyVjM2MExsMU8xSXV3S0YrMnFlaFdZ?=
 =?utf-8?B?aE1VZm1EOGtQTkU4clNuRXhNZ0xZWFB4dTlQZ1JZR1lRZ1h3bTRGcjAyTlhi?=
 =?utf-8?B?aE40Y2hReSsxSW1PZm9JYktBQkdna1IxalZud3grUGhGQ0lIYXVkUTZ0cEdl?=
 =?utf-8?B?bDJCNnhqRnlTbEdrbm5vcUh5VXpDMER0aDMxc3p1M3pJS1NDaWd2VmZ3UnQ3?=
 =?utf-8?B?QldBZUdrcDVOMDFvRDlCMlR3cG52UUlzekV1QWFlL214WnBKNHlZMWlOaE4w?=
 =?utf-8?B?MGdBM2w0ZkJsQWoyYjdrYjkvbE1FRHlvNDNtdmZUWGJzT2twU3dyWFE2ejYy?=
 =?utf-8?B?SlV6M1E4Z3Ntc2MrOEtUVzhDODFjZEFwazd4encvSmQ5K01BQUFRK08rSk44?=
 =?utf-8?B?L2ZqSkRsZTZPR2RHK01HUnhsNERCVkgxR010bFRuL2srWVNnd2ZDOGgzWkJU?=
 =?utf-8?B?U0Zybm96R2ZmcTdPcjRhU0V1RWdBUitaRjluRTBwMXc0LzBMWDNZanUrL3B6?=
 =?utf-8?B?WE53WHNldTBMWU1maXJEQ0hobUJKRDBMc1RodVFZQXpQdVJwTUZ0UXhsTzBV?=
 =?utf-8?B?UEdpYklySUpOVEgzOHRIanNEWFNiR3NxYUdGakJxT1BIVDMrQ1ltYmNzTURN?=
 =?utf-8?B?dkxsV09iZVNDN3JMVkNiMTZaWTJ0NmhWcWJwMnk2amJocHJKRXgwV010NUNK?=
 =?utf-8?B?VnA1cDZqQjRDUHdjV092ajVLQ1dxV3dZTnh5ZUhsZFp4MnlBaFVDZ0RJZWhi?=
 =?utf-8?B?ZUxSVFhUVGNzeVdJSFk1MXhnN1F2RHZPMFkyRnhoVWlKZEZBcUlFY1lrZGtr?=
 =?utf-8?B?ZUVkZXd6bzRlTWlpaXZWZDVtdlpoTERyY1ZKTCtzYm9rZC9FWnFqeVpKR1ZF?=
 =?utf-8?B?NWlBZ01ra0lrVHhGYjkvZzNIOEpCSmNkTEwxQ1IxZlpBUFMxMVNIYTlRS2FX?=
 =?utf-8?B?a09JQXRjaVlZTkJrNmloUlRLWjdDZi80RjNMZjJ4TkNBVlBicmhzRng3VjVE?=
 =?utf-8?B?Rzk3akdvYUFOVTdMU3VFeEJBRDlXckd3OXZLbjhuQVNYMXRnUFNGcmlTTThW?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4642cf41-ec5d-4fe3-48b6-08dbea96ebf4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 13:36:52.9892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR/7XCcNroJmHiD7g2c+uVgTlCJ3TpBbAQ+dMIi4DbBaZMNcRfCgo0//JADd2BKQxt03vVA9cOq0w5I+OLdavKfg5Uhlu/4kJjAn8NO1sBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 17/20] drm/xe/guc: Split GuC params used
 for "hwconfig" and "post-hwconfig"
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 02:09:26PM -0600, Lucas De Marchi wrote:
> On Tue, Nov 14, 2023 at 02:02:28PM +0100, Michał Winiarski wrote:
> > Move params that are not used for initial "hwconfig" load to
> > "post-hwconfig" phase.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> ... but I thought we'd remove the double guc load. Did we change
> direction?

Unfortunately, some things are still missing.
Let's take GuC log, if we would want to load GuC early during probe
(where LMEM is not initialized yet), GuC log needs to be allocated in
system memory. Unfortunately - there's no interface to register a new
GuC log buffer, which makes it problematic if we want to transition to
LMEM GuC log.

Perhaps the transition to single load will make sense in the future, but
I'd like to see SR-IOV VF code merged before any further refactoring.

-Michał

> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
> > 1 file changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 84f0b5488783b..d1181ddf4bdae 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -192,6 +192,26 @@ static void guc_init_params(struct xe_guc *guc)
> > 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
> > 	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
> > 
> > +	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
> > +	params[GUC_CTL_FEATURE] = 0;
> > +	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
> > +	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
> > +	params[GUC_CTL_WA] = 0;
> > +	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
> > +
> > +	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> > +		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
> > +}
> > +
> > +static void guc_init_params_post_hwconfig(struct xe_guc *guc)
> > +{
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +	u32 *params = guc->params;
> > +	int i;
> > +
> > +	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
> > +	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
> > +
> > 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
> > 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
> > 	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
> > @@ -289,6 +309,8 @@ int xe_guc_init(struct xe_guc *guc)
> >  */
> > int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > {
> > +	guc_init_params_post_hwconfig(guc);
> > +
> > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > }
> > 
> > -- 
> > 2.42.1
> > 
