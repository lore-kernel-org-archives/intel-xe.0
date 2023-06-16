Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7F3EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C3110E685;
	Fri, 16 Jun 2023 20:37:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940D410E685
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686947835; x=1718483835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=D6lxpnJavQHkuYVtGvmVXWAt7neOt7nGFtVOb9fYqhk=;
 b=HwugHbWf66X37pkdwvfHPW6WskN+BUNiVpjdWXVkrNDeImT3uUPSI0HT
 mw9yH2FxwpP3+WI4z4wSeSGWkYbIIBjDFuF8AXwS71MBIg6wlF/DDbo8b
 QDuTij98F3roncVvZRwQOD6l30+Xir8GsUuSak6x9IuvsSqZcax9kASiW
 wEnox3OcynPb86Nn5v7n0ei4Y7gXGLOFeeX/zklqQRFQcUt5cc7oGuOxS
 4Z5p+1hxb3M0W+v1pBA4E/LKZyeVG5qf8AXdzmS6AGwF52qzEQykq9weo
 bvkYejasnqiA+gRSnklSRBeBqABhf0NvtVYU6JSATsEda5bKOET1Ujdta w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="425247362"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="425247362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="825868814"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="825868814"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2023 13:37:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:37:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:37:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:37:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrrD5QPbsAHCdwGePMp3sgA5wHf0IBMb4ZvtrJzQEa3umDyXdEfACYxWAj+cWpaYUcnuqTk8UuYdRf0fkN+dHj9j1bzy9EM4Bf9UJrje36NMFTuk/0klvbHPEXw2aAv1tC0bGj75EvI7kLj9unN1j+G3I/6FGwk66g57PbF066WC5yD/+gTnUyrnGXagx3gtR8V8L485Tky0Z+Rkehv9fSBM7GJatjdPX8DoO7F50M/Yoa6No1hqNOpAaAYoZ2X0ka+pq24wCL93fAiXVfatUmFkdTnrm62gZnr6bQcSvSntkgZYCsFNqoaswJdUNHrb9yA1R506CudadeP66SFCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azadxjtJIhxXRUt/rdhxkGHYXRGLXkwdS8rRNYS9qXs=;
 b=WqzCj6JzfHPzgs2iTu95dlEdSjbrBdik8bR2leKLHPdDaBlyWHLBqJqPuTBcTB3ZM6A8XsY37K6CjyTLQJPVtLExLuBGorZ8ssnBgp307Hf2sToAwF4Sj+EXf8xWeYP9dbgGF6oqNoD0KEAWtWdjbnU5HVjOY1ZDeAnI9+MXcbCAEay/3V/Ba1rnpGzXPpiuYNS1h2eHXqn4Qlm0IMvOtZaKIVgrGYMRtylYVR219/tGlEozmZg51LbgUEn2G6UrfCAxIZKJdnVZrTL6QCIFHulceoRdRatSG+XYRz05FzwDOV330VpF72WCrz9GR7BP31t21P5DmHiujnDD8WCgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 20:37:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 20:37:11 +0000
Date: Fri, 16 Jun 2023 20:36:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIzH1PtdZ+O5+TTN@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ec9ffa-5691-4ecb-9191-08db6ea975fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFLcEWAqVDj7HLE9bpT7NzEF6xplm1IfR3NjuZlDpverF23DvJ4cK7v6ZfY3z4OjNbwcbBgJt1vTM7IoQMCNNPyFOSd8oBKB52wUkE0TCAOijB3wfgEoLOLSVL2QoinQYawu+1QSrlB8e5/2QahGDRI2nuO6G/QlG2vAmBo3epJ9OBIlifytqGP+ng8t4Hg3Wp3w4jzp8PdHPpR6kbYLrGUwK7iwg8ejwpulXF77Euq8mKYC2TutVIKPgLsfzclmhKeJwS9zajRuTwqPS1kvTes438ODw+o6xVL8hOqVLthNTZZjJmIRqUERGtO+hNw9lMSiQ8GmBHVkh3cvHNqgl6TpSRP0GAkF4QWShuSPh3S9yUqjERBP25kBUty1VaqHXrrLJGXGhDKtjaNEOV/uOkjSHGSggnfMvy0TNawViLLhmz56rUrHj7tlxjjHKqj7ZerJ40znX84rwZEf0AH6AGUyGcG6UTqN4syMdJvJm82kE0t3ilQoJzDPSi67lX0jjdYSvuA8epnXDscJ+SHyUHMkgfCQGahpFbhRrO8ViAQmPv8fXNyx6jEIJizutDll
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(86362001)(82960400001)(38100700002)(5660300002)(316002)(8936002)(44832011)(41300700001)(8676002)(66556008)(6916009)(4326008)(66946007)(83380400001)(66574015)(66476007)(186003)(6512007)(6506007)(478600001)(26005)(2906002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HPsaGAWTTFVdGo2QJrb8FF2QdnAbWvgXyauGkssS9Z6iZC+w6rPjQ3BA5B?=
 =?iso-8859-1?Q?Do6RTxBJXyhOub7kKginttqhrTJ3NCPA/npBCrVeQ1DZPE1L7KNVao6XVb?=
 =?iso-8859-1?Q?8le8nKO3Tkr3v4BzX8cZzGAlCGyg+6i6CU9S5gw27dGErdInE186texLdu?=
 =?iso-8859-1?Q?7TYXo3KyPZvFfJmdH8BA460B7DzdU4jHDIF7xaq5OCgeQYDCF9xXz1LOsz?=
 =?iso-8859-1?Q?CfFEaYsF9LhzNcpIBaRAyDE/9FaKwpoXF83OrG6b0C0+o6cLGFU8Z53GRx?=
 =?iso-8859-1?Q?/HcmGo5huoOAeDPpGPB6if8Kh+QXRS69WdePostzuMVvqkXdrIb9qQYSqH?=
 =?iso-8859-1?Q?8KmHptHyyBqoyCpRJB2Q8mRJ9/zwBxT9Ks0f+F0e8ns39AqPvuZrK70QvI?=
 =?iso-8859-1?Q?H/XjXKb9Wc0DED0ooo1S8ZyTGYuSuUKzj5imTx5auFUkYAb93JIzhKqWBH?=
 =?iso-8859-1?Q?Utt1n5eZVwiy7OiZ1Kfna4A5eN7Tf5Un43Pkh8NDm53RuqWC2XfPCa9FnM?=
 =?iso-8859-1?Q?jtFxOBhsp05VP/Bx2vBpIYeIy4Ikn/Iu5mnb0hlYgq+14TC7fYcOAYODjS?=
 =?iso-8859-1?Q?JnwURDyg/7hKexYqF6YK/aKw9+MzRPQxp19yHVQQ7oJEMbgxOHNE4iH0KO?=
 =?iso-8859-1?Q?ynGm+F05rRk6qyFY1VF7el7A73IK8RZvhKG+0ckJF9HxYmZgOELDtEbWhx?=
 =?iso-8859-1?Q?YijmngT9QstLzWrGV2qm3290okHpYba8nXqmQJi6q3tElL56SFjBu0T95Y?=
 =?iso-8859-1?Q?ET1erMkifdfMbzlUQAK6K0/9VHohi7eCBXn1fRrTNGWIa698+LSEx2S8HZ?=
 =?iso-8859-1?Q?lCGhxijgFIih2sE6WzzwMPkLRr9MILStgS+UEZFGYEh84xAwP41UqfpeXs?=
 =?iso-8859-1?Q?cephD9hOtEx63ECy2DlnURafgudd7KlKnu02NWBGWpMngOP/1HLY+o2lTd?=
 =?iso-8859-1?Q?jEAtfxoBpAZfiLIOsTliGMxW2GXbjxUuIU+b4TqdHtbYiglLVvbH0vEhXz?=
 =?iso-8859-1?Q?jmxpJ8+EgbfdZHwTHNFYm0wUJHjVNNqxJygAuY/jZ48is0ZkxjwDxVpqqt?=
 =?iso-8859-1?Q?G0y9qMEmagNioNpXbqrvb5R1wJD6+r2o5RQCVV7TKMiYYQG7n8dtxL7fJx?=
 =?iso-8859-1?Q?g3TGrwh4Gpref7tdB+AqOF1Oll+tG+oZe7PZPWDxMCLVcOi3bpPn4zvL5G?=
 =?iso-8859-1?Q?2TY11J9EWVFLDxGoA3M/sk9VYWKzH3wT2lfvFHKk3Eo2PsaqFXvuBXI/S+?=
 =?iso-8859-1?Q?PMAaHyxMa40c/LvgZgGoKsJU8BE0jLjwNKcrigiFCOnlYidmgzMNU+NV+6?=
 =?iso-8859-1?Q?B//xZJnSGvjVFnUVPROk2Bb6uoM/WfeMG4P1/zOTF6nF2Dx7K9HYfbm66z?=
 =?iso-8859-1?Q?X2xPX0moOoMceg6+bYVAS7hrELmib9s0tHaxP0qCf0dRmy5Aed+bsdVtPC?=
 =?iso-8859-1?Q?UzYt4YwPAfG1VXdqlLbI+tTA68Rs88e4DRvN5lpxkjzU2mZRiRR1J6OnjX?=
 =?iso-8859-1?Q?TUF4827PzSxvZqV5IqvM1EjtmVlPATZSkUr4NcSibCBMkO4lo+F0yVBKsO?=
 =?iso-8859-1?Q?b5bDhDg8UCXK53Uw03oN9CRX58C0B5G5vay4VP5TTccbx4TVSD3SXcOM+g?=
 =?iso-8859-1?Q?mHQY0znU5ZiwJbknx3N4h5HVLR4i5KKyIrEjOvmbo+KpXndPGCoOIZ/A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ec9ffa-5691-4ecb-9191-08db6ea975fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:37:11.2427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDXQ9kq/KUX2fhP1Zayjvn6EmTTvVdPNI/Mq4S2ZTX56etc4lzsj4TW7UBgfY3wXZamsfxEbw6MUzcug0BlnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe/bo: Gracefully handle errors from
 ttm_bo_move_accel_cleanup().
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

On Fri, Jun 16, 2023 at 11:55:02AM +0200, Thomas Hellström wrote:
> The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
> move, and in doing so, needs memory allocations which may fail.
> 
> Rather than failing in a state where the new resource may freed while
> accessed by the copy engine, sync uninterruptible and do a failsafe
> cleanup.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 94dd11066f51..77d5c5710688 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -689,10 +689,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (!move_lacks_source) {
>  			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
>  							true, new_mem);
> -		} else {
> +			if (ret)
> +				dma_fence_wait(fence, false);

Should it be:
	if (ret == -ENOMEM)
		dma_fence_wait(fence, false);

> +		}
> +
> +		if (move_lacks_source || ret) {
Should it be:
		if (move_lacks_source || ret == -ENOMEM) {

Matt

>  			dma_resv_add_fence(ttm_bo->base.resv, fence,
>  					   DMA_RESV_USAGE_KERNEL);
>  			ttm_bo_move_null(ttm_bo, new_mem);
> +			ret = 0;
>  		}
>  
>  		dma_fence_put(fence);
> -- 
> 2.40.1
> 
