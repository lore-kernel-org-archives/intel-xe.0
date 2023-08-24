Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BE5C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 14:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7A510E059;
	Thu, 24 Aug 2023 14:21:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED1110E059
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692886879; x=1724422879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3XavI1gDwz5T2waTPy8i1+RiAf2syVtwd64/8UCMWHM=;
 b=SfKe/YM09S0+vEcHMrupPR4eik4Zc20gI8hs0spvWmjuA+wy6BqNQxXJ
 M1ToCDnjMQhUGnuxtxzSlhIGoZqJokELC7LA2bLFx5exE8TNAULBcf4o3
 kEWFZiGdxnwL09FCi4vvdq9lO0DEPdKb9BdjlRJ7P8+7/3JHkFUZGnlVF
 WY1drEeXkBU4MPauh1UswPoR6SFg6MdokeMxHAgIDF5tiwDBPmY4H6aai
 B0uRtDTYS4e0Gp4OKgG/jNd0EWLy7GjqbQ/g6zDLw1LNQ/wdaSgZwQ/GY
 3wNZtFHYvUuaXaq5LpRQWZ2swNqk0Xc449CsaEqmfckzGt+TZkSKClpqO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438400145"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="438400145"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 07:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1067852153"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="1067852153"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 07:18:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 07:18:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 07:18:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 07:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVE5ObB1Tr/NK1ZXm2PUe19Ydt5ohB7NigSmNLMsrXevOtTvhlAPn6z9IWk+6b0xx6LbHx0Ru/F1nIm2SbRiyRx4MkaHk5RCj9QHknY1eM/OkamEeADNQdoTlgF04h3sT5JfB1nLArcBH+GF02TFG6O73QGBUpGZdk7/qfo/DualE+tuzUAH8UbNKYiy7BKs/300l4eBtpWFgYJ9WC6GOGxddtVDAiXJtX/pji82gklvGt7dAXoJeXGEhJdflfMk4S3Gx1KC9pkd87If2+hJOyQX+mnByMVlBtY/bGh43zE8UHDAwndGAiLbPkb+eHe+US8xipjsIsN7jgGT4TZI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrCx2iF9LJ1IbLKPHPFBKK5SG/61BNYk4l7vPcWem7o=;
 b=JgfslCy1Em8we+Gl3nn56cOH1+HWW3sauYtYBNu2AdLj0ORC9Ib9WsH/mXW1pqVeqNkmt7jNtuQmakm+ATkRfuQccvFoPfQxURcArehzxkvG1LGwqhsQglBvRdyDtu8qY2m3zI/6MIbJhv5+yedOu8h9sD0+USfVQV2KdpDFoGqGLbK99RMSfh4Wz4z3HwzTLaQveMx7Z/YjIs1P32iVRNfl1nVF4CTfsJAK3sjml/Ww6iHl7LTgiRiMcmEpG6SK3PVLkm5DysAcEliA3lQq7jsKaSpzLVfpzVRbArrF1o98XNZDB/CAj7MQOEgi3H7EdSXPGRVW1mjxh7MyeAp8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:18:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 14:18:56 +0000
Date: Thu, 24 Aug 2023 14:17:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZOdmfvPOzSew/yO2@DUT025-TGLU.fm.intel.com>
References: <20230823175551.230686-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823175551.230686-3-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 00785325-b36c-4979-dce5-08dba4ad0d43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xg0zPA25KKnOfgu6hdEA+LPfMaBCzQX3rS1giT+FPYII9b2CrTDiJTUGZy16eDX7jF4ZZBAxTzf5gsnji36yv2CZ3tan3AnR0RTlzIVB4kT/+6m1Hwuigsd4SQTwZUT7jAl/RWmAbvq93aG0T35pMtmKkwVDNTFm7UxCxGN+yjCEil5jDt7c2ekdDPWWeotl7TVJnrDsgvzdexLDDbXuX5svSY8mOgW0AHmyCuxf23ou9N6EB8V9o3RUv2tmqIxO3z3VvRF5QIC7R66ya+bXDgpct8JZBX+2jbRD1WqVyXYyvukI+bjJ4wWceANeUVUp/4EP62W2+LP7LLB1RCxMUuLjhTL2tFhXpMGgf41CNA05VXwD3bk42n2RKv35Exp2Ak91K0WLA/KeSrIBEyHQu8Hw5Z62OONWArlw2Dq9Jupr2zxYvwavgcYkcSEmsbVrRY5fuP9c0K31r5LqfqXtbp+jhxWkCnsdmE7SIlStqimKsuUXfuitIblUFLLgyUErC+3Yp5sOhB+HCXesg2ZKpiKtR3eAk4d39AYZGJrANXpKp1B+FBekSK+/pUwuOMuf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199024)(186009)(1800799009)(6636002)(66556008)(66476007)(66946007)(316002)(82960400001)(478600001)(26005)(44832011)(38100700002)(6666004)(41300700001)(86362001)(6486002)(2906002)(6506007)(6512007)(8676002)(8936002)(4326008)(6862004)(107886003)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8tPLiRlCpA9PcAzf0zcayn+h2qbrhf/shR7yoNK9K8PGYAwS86rqwc6msSY7?=
 =?us-ascii?Q?kVE8iDIwNfsQVUAVQZHGL9k+k5Rm779A4k1Uwc1/kbzWKDCGGB/8xm6RCRJe?=
 =?us-ascii?Q?NWJEEI+hFOnU2urnqYthb8tqAcXKkwv651/L8Y3LSaIAuJFHQjPjwf4A5t/B?=
 =?us-ascii?Q?wskImEpIotrVoO6BRem6816oDsBjpBloIeud/QlO8ft1smkk/VemF7ORGdvV?=
 =?us-ascii?Q?GjYbDpt689nmYP6zweOQyzorSsuyw6SyaFC4Xjw50R0jbqFpeBOdhXePWLru?=
 =?us-ascii?Q?gDPg1rcJeGx/0AybpDqMzQa9Y4kL1P8OF7i1uLJTxOy3xOf9NnvyeYqSi65D?=
 =?us-ascii?Q?AhSJUQDnJbMQcSPL3l24t0uW6mFAkCqMu43OEthpZm5OSknILURr6zYWKfpd?=
 =?us-ascii?Q?/ufPsSF9TzNdyRIhvi60m/sSBpyUa25fTN5Vlegfql52fOxEdKhpBJS11eE5?=
 =?us-ascii?Q?oP9cOSgTbvXHOVXLMcVVEFzkHkEUyxWrrJezT2awzYiObp8/aaywZoRnUINW?=
 =?us-ascii?Q?bLLtqoP+49gDGVLp0sakLPHnLVfAnWK2yeGnS/gzNtR6rRLdZ96mLq0tdavM?=
 =?us-ascii?Q?2OfTknJn/sgegfXwQHWrMpIUQ+p4QWjOGZfq2D4ZbfViiCchDv3cr7wYPB5q?=
 =?us-ascii?Q?Kr4cg6Y3GkIw8TBnS+C2F8EmMYe0HAe8BhF7SVAa41O9jEuo4oj65DvEzQQy?=
 =?us-ascii?Q?lq0WuJdvbToRSjbaF0/ALhK78zq9X/o81bAs1VX8p98Ou+3c0Y0z8Yb13fPN?=
 =?us-ascii?Q?Mcy+QDpzu7JOwVOMnai+gKweOKM7hBUfKyw3A7FleMjIYJbtBTaTEInkD22X?=
 =?us-ascii?Q?PE3p4xGtOHXnWvcMnQoWEYIaw9CEDvjf9N556We+Xy2xn8naREzezDmscWRX?=
 =?us-ascii?Q?UU4tNErd7NCpzyOfaaUTl4qr1o4Efom2VSmBdNicPAQMZvqnYXYJnWf+W1Kv?=
 =?us-ascii?Q?psodUS/AenUpLZw/M8iUDToOTQhhXdYTmsV5fnn1YUom21qlhmdLl4dv4XEH?=
 =?us-ascii?Q?m78PyyoNWfsItuz4CVmTrsa9OHWo+eD8Xp6Jw5VQLq89snpnSZOF6+Xrptzo?=
 =?us-ascii?Q?sbQvxX8g+kverN966GxEybbp2dm2gZpbeYVdl36v1YU7sROHgmRgHt5bPDR6?=
 =?us-ascii?Q?r+QB3RFReZJDya0ppuBKTNg0Kosbswq5rLCkyL+FLbrK4IDQddNwD1ftrhr6?=
 =?us-ascii?Q?KgDXeM0zCDdSfdpPiohAJuWICMsFBQbYG0i87F/YnWkAbTRBwRlZmkbqHQgh?=
 =?us-ascii?Q?CPC0PP2aoMA1QbFAVj4myeIVYSXAH2Z8gbrR/Oz5fxtIrWVzqLiXgQmasOXj?=
 =?us-ascii?Q?NgghQlpxz7p97Pq25txSMmV/LqniQ1Q2LXQVp9wFpmzpI6qk0GMxIAz45b2e?=
 =?us-ascii?Q?hOGGaBWRSdtmWOjJuBfMnPolK6K4bguLBq13Ju/3VWbGIz4zwKfoo+Lib0zD?=
 =?us-ascii?Q?7R0eMD4kVlV37pCnNQOlsnGPZzIdQG9t2DR97AGMb1Ya3hpAaWelXu2oI68E?=
 =?us-ascii?Q?C6gi/FkjcQICzp1I2Pverp+ccICO8RZ3Z8DDRZooEg3U4ujzT0hO7VcGKpR4?=
 =?us-ascii?Q?QwTNXs2sy4nnHF3d8YeBrHiyaFAntXxcrayWfXxFZ2zrm09DoEyRQV2gSoMM?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00785325-b36c-4979-dce5-08dba4ad0d43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:18:56.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq2T6bTPTwOMH67lfIstRdXru+koDS/s4op5bQeguVWij4is5igkMp7dDMb0CkjVWeFBw6+fUnSgLLvhGy87Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/ct: fix resv_space print
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 06:55:52PM +0100, Matthew Auld wrote:
> Actually print the info.resv_space.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 59136b6a7c6f..b92e04ba8f63 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1180,7 +1180,7 @@ static void guc_ctb_snapshot_print(struct guc_ctb_snapshot *snapshot,
>  	u32 head, tail;
>  
>  	drm_printf(p, "\tsize: %d\n", snapshot->info.size);
> -	drm_printf(p, "\tresv_space: %d\n", snapshot->info.space);
> +	drm_printf(p, "\tresv_space: %d\n", snapshot->info.resv_space);
>  	drm_printf(p, "\thead: %d\n", snapshot->info.head);
>  	drm_printf(p, "\ttail: %d\n", snapshot->info.tail);
>  	drm_printf(p, "\tspace: %d\n", snapshot->info.space);
> -- 
> 2.41.0
> 
