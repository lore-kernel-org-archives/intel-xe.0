Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E65BCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EDF10E2E7;
	Fri, 31 Oct 2025 16:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSwLGxk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5EF10E2E7
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928332; x=1793464332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eXTUyZbOmL+OGs4eZFm4pSAFGhBlP/C5rDNSfZpkPZ0=;
 b=lSwLGxk92caIkTXnc38Cn9eEvwM/hJXUkz2VZ2U1dS2fPtOL8mkcpco+
 +GwA1AR/2zIJNbg92xCwdYR1tIfSQCSLuhTv6OeaJF0PrZ9+aQ5Ul/Y61
 YvW7WRYB5zHQ1lIB5sgg6PCxJS4gfjvpX/5x/jzyr5NCg+T8wHIXhFdkc
 lnHj7zrL7eB0og1xYy5LQSfoYpgIyadgSB+cE4YxlyG0TYkgoBPM6Fsoi
 xwP0Q+YghHTAN28GsrcqZN0W+f0GIkH5lD0g9BPTrXSnaIl+Y3QTxGcx9
 HNv58SSzBbcoKdUEJeRarr/gvyU659Q+nNRzCEAMmfH1hkKa/xla+Cf12 w==;
X-CSE-ConnectionGUID: +/sHgbNXSh6kWqSy9ZisLg==
X-CSE-MsgGUID: okrpq5FuSnezkZUEtZUMfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64134323"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64134323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:32:12 -0700
X-CSE-ConnectionGUID: suSa6LrPQwGoZwscgzdr2Q==
X-CSE-MsgGUID: RJI9YrMdRcm2YvHvweUEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186394065"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:32:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:32:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:32:10 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVthqfoikjasTEwWK2CN3tYiMnvH48ogPTr5sdn7x1zMJbjqg+CWl6UY2Z/0LViLoolWLzlq7l21DUYpKmlz8xrdcFLBkSIT/9QH7mygemQffPrd6rjAvxMtw6qPFADC6+rcbPKjQcqElOJhGjyb/U7K0SFFyvdkx4cqSKR3DP/bip1T/DDpoL21UGVyhf7H5NjeciQhAVFnWdLl749DUKsoTROS5MOtVyBSKN6QwO4nYb273o4OSEZbAH7Jn08CGLNwYOTchPX8ENITQAZDkeFGdRwao+KW091A/h7InUF+OD67jj42xusubYVhvMC29oGQt9CXPSKJLDh5P7LgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06qYRKi02zHMw73rQ4U8WMYP2STurcHyPLuudJYetkE=;
 b=mTg9/7nigJg/Ux6o6YzS6iw9z3+UkTzPcTMyGaWD6jP18eI25/V8k9cKxnu8+LG1Wgwfqo2qY2C/Cv8OpLVxUSicSftdRUlHpphv3Wt71mUwa25doRUy5qfQBekig9smlanzzOeLfwV6aIdfox1bw0Pv8M5CiTvcX4oOtRSkTMLBZkqfleqmB8Qp171jxvQv8G9JslmbD6PbKnElLhuXnFWMCkLTKd5HztYeva7Rw3lLmHXCvyi57kvU3KvbAinAV1/B7vHGCh2AL2pN/w86D/VprNevlM3pJ0w9/uAD/LJ7ht+Do0CZBit7VVEfrlGH4XwYPaXLCiN9O1QaLfz+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:32:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 16:32:08 +0000
Date: Fri, 31 Oct 2025 09:32:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <aQTkhpPCuIi5KQPB@lstrano-desk.jf.intel.com>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
 <aQTYJbU0qtl1CMYw@lstrano-desk.jf.intel.com>
 <dfzjptjbgrawrl4evjyubgtqc6uag3sj7ntxkjrxp3f7ssyzsv@a5zdt4oqvhgl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dfzjptjbgrawrl4evjyubgtqc6uag3sj7ntxkjrxp3f7ssyzsv@a5zdt4oqvhgl>
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: b222bfb8-a435-4328-9fde-08de189b0911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DXZ7rD+wsc6t7aWFRR+YIlbCivwHKm5WF7201r3K3TIH7YMdvvKM71wwWLiN?=
 =?us-ascii?Q?Va9tnSgCEKrLGPK+zbvJCtoCDJzZmIQvmlztomIw6nAYFpzr+WDRalCxz86c?=
 =?us-ascii?Q?Ik4/+eWBGafuICvZalnIX5V+1fxRabU0Rjgd9SjB4Vk5R9m+V5Bk55sHUDjI?=
 =?us-ascii?Q?L80UuRHtY/fcjy1WmvZewzt1YQ6UxzQgHibklwof5oaSDc0kSpfRizTVceEV?=
 =?us-ascii?Q?vSA2Vj9JApsgaPsLZrJRzu0XJBPsMw/IRuLJThzQCbDH+zQ/6Qq9EqjtwJCc?=
 =?us-ascii?Q?3M2EF9T25yIy19tuwvZkaKyNb1gITeJnZof4eYl6j8TU6L6NRaq+5I9zrC+A?=
 =?us-ascii?Q?v576AacRGTdx0E19jUPW0Uwb+eH9oH32sjCAHa7vqQi9Or6V47KIGuMpIjj9?=
 =?us-ascii?Q?WDqxjd65lwLWdarw/rUZT5MVUifknvu1JOFKDKFvOn6OIJfGcXWNB8UwysXL?=
 =?us-ascii?Q?KOEnAuoETIgbiZZem04ZLs1SoTXCCPJIxAKkY6oWO6m5bh8sdrKYKjUwnFro?=
 =?us-ascii?Q?Yuks9OtqCkpopwNmQouMz1cl3G9958PsXKgxvZACSZBHUoT/HolWa67SYIL0?=
 =?us-ascii?Q?C37DDq75bHTtsy4ex6xfMcB7jHV0uFcy9iXnrBkqqO+hNFMNfb4OceTuy8Uo?=
 =?us-ascii?Q?4KDRt1dJmtiSSZBQ88ihyaI5F5xOfAK+rYOEOjVux/kzgh2E+UizJnT8jnv6?=
 =?us-ascii?Q?rOB9HTdfSjkOJREuS8X7uCngYfMunR+lAKKHJYe3r7WO1Ko6n5i86VS7jreH?=
 =?us-ascii?Q?ZEnyNvlLVFvJHyNCh6/B4zig0WnuEh2juuUSMEuQm7vmuJ2mDfRrcoIdwch9?=
 =?us-ascii?Q?2LnZ9iOq/1TUOIPwxLx77ggRe8jRK9PtTthk9f5UdG1r7atBl1Z6GreGuX6+?=
 =?us-ascii?Q?t493iT0XIMmrM0Lszo6R630exrLSCPx1N0vcw8wInKzg8fcerlOYp7sUGDE+?=
 =?us-ascii?Q?3pHtomJbcxE+Lxu63w1UaZ63Mzp1LNSSEbC2FB2TpMYfh20OHQ3ZzeIoI4bq?=
 =?us-ascii?Q?E+GGwBMg04zpdtAODGLdPxpMqeAVWOsENsrReZJOtel2gUQYyZ9yGWDR5DJG?=
 =?us-ascii?Q?8jKQW1dfOCxz3E/pr54+b9rlTnpuUTJtamfIaYxoQfsvw30/KnYBl4ki7RCb?=
 =?us-ascii?Q?c7bicSwCvHGOiU7kpKu5WIgc08SuCYEopajQvoH8uXQtE+cx767mb9YuOrux?=
 =?us-ascii?Q?c+i82/uqDZu6qZ1R3P8W94wFQwayXNIcKi4GK9a/nb8M68nn4j26VErdmy05?=
 =?us-ascii?Q?WWktkDUKatSR7ZeU4fGsN1QxDzHXtQFZIo1MBYVD2v/ufKx//3toQhGWMmiH?=
 =?us-ascii?Q?4k37LsM5cn0/goX+b980OmAUS4gtmZsjbsbe4WzTPOb1yV9PlfPEmOUk1yw8?=
 =?us-ascii?Q?bBEYAdW1ZuixUW7Evk1hpNyu5Y9QYH83GEhPepLO6+YoJuLvrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/0x5trMkvESrpDzRL5bUbI4Ff27lo+imqowOkDom/hn6IHOYBfknpKi2p3SV?=
 =?us-ascii?Q?MxL7TTiUkfAYmZdzLazln9RtVaovq9/opMAsdhWMCMmgozicB666vhacSNHW?=
 =?us-ascii?Q?nLtEuIA61OGmyNjVYmXYcBm2qkcQzxYIA5s7DDcr7U5ZD4QMn7dRMDsb0Db1?=
 =?us-ascii?Q?NDNmsDhYyVh2jFlxwI2z7WOywLKyt+YrSlaPAf2p+Zfnx2b3U42ZdQDdhJRo?=
 =?us-ascii?Q?BUB+24JOjpxwZ0tL7f11NBDgXpMa/9Q6QFj0lksc8g6nwqDbWltSN8s6Hhp8?=
 =?us-ascii?Q?y+joJFpz6oSKgvqts3HVtOtcwMMnUkb2aigwzx6vcO0lDI5ZN3wxdd9A5M1i?=
 =?us-ascii?Q?ObydsBphK7HTOh7jvXUs5Ymjxh4m6T7Jar4y/qwyxRiPZyr8ihJGs1rhEyVb?=
 =?us-ascii?Q?imSvTli42hrXXjz+yJvYSy0v4iz54Nf/mVCpSymSs8QAZunUMhmu3rzeGZ78?=
 =?us-ascii?Q?/kW5I0wAoNLOFpj3hKS8WtKSGZj/p/1LPzcqAUoEnGpSglW6SJiOrxf+vIe4?=
 =?us-ascii?Q?2rVW8wDhtfFwwqM7evhWIIdcGYCiltYNJzm/DpwD3c2k6gf99SuSraQ4hJLq?=
 =?us-ascii?Q?WKVgoZTSjm0HDwZaw1pjCBYK5c9Y/qXux4aYHTmmNYpkm0BnNHNUN7zLGS8G?=
 =?us-ascii?Q?HncKj4qyAO46leH9xgPFIuMq43K/gVjfuWg+GUtlCVBLZe0sGduSRWl5B9fn?=
 =?us-ascii?Q?UkhYgpW2t6BVRIJDKr4tmVHNF6Gsf/lH8MyLoAnvgp5xsXEB+7j6tmGoxxKs?=
 =?us-ascii?Q?VmE2nds2qhuUt3V9qgOFnNkvUPMjL4sra29qehaByxeymyC9bo76kT99gSu4?=
 =?us-ascii?Q?JVtkd7t40JCyCt/8KYyt/ayAlOo+Hw73JAj/zf7Acw6lZK/DDua2qpxl4xyI?=
 =?us-ascii?Q?Ni29lYGbDYUg31+Mf8IfNyxZtZ94RenaiHXSu+A3aCYn/XoJAjaf/BtKdJCV?=
 =?us-ascii?Q?ufkTokx/G9nbIjmPj8oxU5v3QMZ3G5qx+PnpW1hYSZ4NGZ24dnrpwdW6vglT?=
 =?us-ascii?Q?w8BcRTArfFI2/KAsUBKLqDyfC4O/XxzN5yH+36MKGGnlUUG9per+feem8+5B?=
 =?us-ascii?Q?1Ogn2WxkicMj4ltpcv3vPdGuoERMf44f+jBRlvs7/VbQmFbCNYUaW+Ht5NaV?=
 =?us-ascii?Q?cdpJjW4EswGRj/1jGc8FEMZKMo+NWoyZlLNmzYQtTMM1FqJ4J04GsvTzo2US?=
 =?us-ascii?Q?tZ2R1o008Xsn18R+XYpYMOT6E2Q3GqAQmkYfPylQEt0VHLtu7+omCSL/BJS/?=
 =?us-ascii?Q?KyDKd4BufZzC3GVeKfR4m2I17Uq+saTeN5E/lR3PSZxTloqxoPo94l/E5pfN?=
 =?us-ascii?Q?emKI624x2UBEO4WH4SNe2wS43nTLEIOgnxwgpj7u49hwitImKT6ao2cJVuSR?=
 =?us-ascii?Q?sBOHEd0tFw8p6NlsHzsOvb40dfFXaj34AHFtrasBr7k/gam0E7eyuAq7TXn1?=
 =?us-ascii?Q?iOy0xhMgSxnYu9Sw8rc4hCLju2U2EHWlpXceebxt/+z+aOxhYlOXyrQzMNbq?=
 =?us-ascii?Q?3agrVY90Skx9hzFHQqdsN6s7nTxUChvC3SVxuPniR/vAOLmJxgMaWfkseTWO?=
 =?us-ascii?Q?V47U+0odVN5Lt96kEkJ6GKv2v/hT3xrOGujd4fBrSg671owzS5B3a5ucX0pi?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b222bfb8-a435-4328-9fde-08de189b0911
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:32:08.6356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1HKvNBR9LTSpyIdTWxEUEUNQMadsYtFKzw3lHJlLTUy2wgqJy9FdmbFzMdIBhjYyS0xIjjUa6gwl4uTxaOTqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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

On Fri, Oct 31, 2025 at 11:17:02AM -0500, Lucas De Marchi wrote:
> On Fri, Oct 31, 2025 at 08:39:17AM -0700, Matthew Brost wrote:
> > On Thu, Oct 30, 2025 at 08:41:24PM +0530, Balasubramani Vivekanandan wrote:
> > > When unbinding wait for any GT reset in progress to complete. Unbinding
> > > will release the mmio mapping but mmio operations are performed during
> > > GT reset causing Kernel panic.
> > > 
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > > v2:
> > >  - Use the managed resource release function to wait for GT reset during
> > >    unbind (Lucas)
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 89808b33d0a8..d0f8c40bc51e 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
> > >  	struct xe_gt *gt = arg;
> > >  	int i;
> > > 
> > > +	disable_work_sync(&gt->reset.worker);
> > 
> > We recently made a change [1] so if GT reset worker is queued it holds a PM ref.
> > 
> > So if disable_work_sync returns true [2], I think a PM ref needs to be dropped here.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/patch/682622/?series=156292&rev=1
> > [2] https://elixir.bootlin.com/linux/v6.17.6/source/kernel/workqueue.c#L4471
> 
> yep, it looks like there are 2 v2 of this series. I replied that
> yesterday in the other thread:
> 
> https://lore.kernel.org/all/faewe43nslu62dt5donrrddkbzspnwicrsrm3llwp4xg4tdq7l@zxc7u6vd5ceh
> 

+1, we have the same comment.

Matt

> Lucas De Marchi
> 
> > 
> > > 
> > >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> > >  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> > > 
> > > --
> > > 2.43.0
> > > 
