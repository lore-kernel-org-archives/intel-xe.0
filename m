Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB4EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 03:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CAC10E3DD;
	Thu,  6 Jul 2023 03:59:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CB010E3DD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 03:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688615985; x=1720151985;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W+JVwh1AKW/0/J39olOflWEOAYbO+qyRDi8nXu4myI0=;
 b=nrIGRwjXprS8SwVGYMFoC47r3fWyFNwfk4QpqYCVeRd+sjuoSIQ86VPv
 a3BUPBhtS+At9fik0zlzhE7xw55EAI10pnEPi+9e7KqRKwCCG15/fsnfG
 fHdW26uNLjlhP8pdI1oKVoopqpQNMMT4AWmc6OC22sbAzWvaJVn+yRHbZ
 bD5HfPyytSTKuUArcgZadelcGurGZXVCM6C3G0Pyh7Gn6GZSAPkFhk9Ca
 h4zcrEmsKb6Os7oxJUI8xrsP4T8g5Fj4d23gc8EoY2Sz40y+Q0aSXdLNc
 8n1dhgHpK0xXZ65Shr9NvoI59aw/bfQ5n0OUXH737Kkn/krv3wR2zQ8QD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343093270"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="343093270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 20:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="1049939628"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="1049939628"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 20:59:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 20:59:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 20:59:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 20:59:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 20:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuHTRBN1J3pnCgkcxicWxbxmdjbxdxQEzyb4P1osMAhz7r4Sk1qXU9Sjxxx3SXTgii4/JihjskrqY4FcuPUz3YHShXCDzFNYphtA5V16MpGVV9X14x6ibEq+HWCM4CmFCdM53uOjCU90reIAbTKfW1FgDFxwl0w8PM1zbIHK63zY669E1L2T3ny57PZG/ExtvxcNmG846TL47ZBakvxGU+9QA97lWjT2XAycPhKRgFdN5AQ5hvG7jASWRSOw3XqNIYir0PQydTlumcZoi8ahMC2HAREz/lazqnlpziG7bPMvMaf7/houMFfuW8p7blzlOphSEln5YfQndfSacFqflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZlZHKv4ZgdzlP9WO4gqS167EuUcgJzBu3WJFAsE1v4=;
 b=dnCU2QNauyl1h8l2Yn7ru8SzzB6HbUqus2mYcDO4gRqm2CeJTWKiK2RsVbvZbkp9Mbd+cuQCm18+FP8rWyXhsdKWKJEaR2ExUNsjjsF9KXFKZbCVN5nP4SkHI7RS3YNxqvkKL2fiG2CdIAE+qKyVoeXtJrxZRKMaf5wh7lONyyER+WAhIla/m1bvkf0/J316FLgNuOErYB+3EcEO4Mps4gn8tr3fTghiEvhtTbCsUsubGCtVw478urX2tVRo/tOHpzKDKrPRrbJXZVpovAR8935oU1ELFdDnI+ojL0AioODqm70LIcmj4H/6l/rA2sDLE7RWLXRMV8rn+dhSRCna4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 03:59:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 03:59:40 +0000
Date: Thu, 6 Jul 2023 03:59:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKY8Bgldf5j5K2KC@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230705160602.237213-12-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de12c5c-852a-4445-7d45-08db7dd56c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1av0veg6PI2+wzpiPNnzl6oeLBuDjJIzoII7E00tOVz3bi/r8LrZez5aMQ8vvvx17ifgojcyYwmlzQyoq6ArVlJDHo+mMHx1Or1AAaUh7/ufjSR6HYxXTIZ1G+7Dsdbo4HNPD5VEDqCDlfQhS1c2LWCHLXV76dJsAZsQrUHrYDjPs6182lvgSh86RLsazYEuBYlQWqtooj8RA/3PZFpJVDlbJj9fxCUPwvXEStQTYuTK9f3sAHxOD0Ojs2VEhMejdcAkPjCHtVTzgbyc6f/IebeJ4Z4szQT/DqHk+x6WlLGBhuAT7WNhX0wvFR72WCiyd9q3pjqbWLhwDqoqQiiiQVpQI8/EZwP6YSYgD1ILbfEKW04bQxneyu7+bmFsoHj00115jOaOITSqJvzIBYzefeex8/0s3zM4+2k6uBcM/UUkZmKmR8P1F75mlyM8CNf0NvBxW8sH5EiuL+lkpg/VTId3V3FawiwzWTK+hNRU7xKudF+AB9z+PkucfOOOfRuUHJiet/DBA8Ep9gHx0X99WmT56MavSa487Q5PS2ZO+QBiWMEHT6qGVC4MZcjE6K2n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(44832011)(26005)(6862004)(8676002)(5660300002)(83380400001)(107886003)(186003)(6506007)(8936002)(6486002)(316002)(2906002)(6512007)(41300700001)(38100700002)(6666004)(82960400001)(4326008)(478600001)(6636002)(86362001)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q1d8VQW0QvPO/AJXOQTKJ3pG2I0q7RLHWsp38MQqxM0VpGa090Xj9XsZMM?=
 =?iso-8859-1?Q?dh0Nn9A7+eKVrXe7PgsKm7EwKR0brAIHGqnMBb8FUi8gm8VrOjo6/sMlKB?=
 =?iso-8859-1?Q?mw8d4O96ZeMMbSEoimyHkFCaKDn9l4MBIJ+rmt8kriJTZxJdCYhlNY8xX5?=
 =?iso-8859-1?Q?xoipXYezp9mzX+ILKhpdwaUg7+b8LNG/oHdVkF4bDzVfQuccbwsppEZyDc?=
 =?iso-8859-1?Q?/smPy7kyFaU62unyTDFQGpAMStJsMCsQ3aqOmVDQg8dOYWkckGOjmVBsQg?=
 =?iso-8859-1?Q?AyhWxOckG367sVjinaTrsB2Xm3Y+5pk12+FP53RLlxdeMi0Uv5QZUqf6h6?=
 =?iso-8859-1?Q?8PIg29AnsrE0cRkgOY5CYkYA2/VQOP96R8m3yEdo7M9V668QnUu525gpiG?=
 =?iso-8859-1?Q?vw4kOnrKPMxMbqJILgCTzerqcdErPfooTVRep9ho/FneHlseMDLA3cRJZJ?=
 =?iso-8859-1?Q?wtkfU9WesFFhN67Z+w9LhiWcsKgEWhMSCPrCrQ3CW9ragLCrlN0BGVhETS?=
 =?iso-8859-1?Q?MomnRr3Q/pDuuK0r7hLP9MImT+9ywbb8lKrf4Rx+uef9u8aunkkoC4YE+G?=
 =?iso-8859-1?Q?SQqxvG7afoWFUXHk6L5flP2UbXx3NlWSzBVADNn79pjWQpvHzM/xgLdmA8?=
 =?iso-8859-1?Q?lhwBO7qcxR6j2W2kGqDGl319L3AvUkffdBswGN3K3Om3g1tD4rC6jQrL0y?=
 =?iso-8859-1?Q?rbu7sPerc5dZI0Qh3MmFkK6MPhwk39AK6RIxKaI9KkXvlyigUj3NT70rmz?=
 =?iso-8859-1?Q?RgGEVBMgPQcbauf9JOZyOJdJHnSttqjiRS5/hRHDWmZZdV0/PPF1Ii5+LW?=
 =?iso-8859-1?Q?RnCyF4wjb4VHANPSGkCTvAMOyJuZjel0QDi3o/qx1IwXou9HCRHNuWYalQ?=
 =?iso-8859-1?Q?Y5yRmDLPEgrJgGPEPwy7+TGwha2ge9hyLLAAOmNcSQzhOmvAvgejE1foLS?=
 =?iso-8859-1?Q?z5WR17i9QrDfupVPkOvHqcmrSmO+Z5gZJzJnnhSGeIGjuytWzJbTtRfW3c?=
 =?iso-8859-1?Q?PSReGTv4sMaff/cC3tjHfkpQC08bkJlv9keJseJVvPqoLke8Vt2mUvBxgZ?=
 =?iso-8859-1?Q?vj0bg1wEOi0I4KVLTiAbWxeP5+XuwE0OAHJgdRKDtAiB25OuAcn/TE3V4Q?=
 =?iso-8859-1?Q?vKhZwkvM2OzSnszWIsfZWjInR5420sJHYsRWlQ16gH3hwPhsBKCjEjLVaC?=
 =?iso-8859-1?Q?3EcWL7grC2GkmmzOeaAS94WJVdybOVfEBYpS5top9aTNtTe4duK9nUGgoT?=
 =?iso-8859-1?Q?VxOwj2AdL2j2vLCrCiqoHookqe6KxIsXFbQd4Bpui2WE9vcoa7TiYcO1An?=
 =?iso-8859-1?Q?BdXsHMHuncEIIPJtBgV1iyV4RPInfDDQWtWlrahyio3q8Xd/+Dff/QsIXE?=
 =?iso-8859-1?Q?uokPA7yoUfELFc+Zfjug4k9GtMoORsc/BD80Peynl5RtPtSZESHyp9c5JT?=
 =?iso-8859-1?Q?GZZZkpriif5+pYZHbR6B1+JXZkScZa89+6wOgYYtS/DnjxaT+6lQk6x+Nu?=
 =?iso-8859-1?Q?4kZDu8eL+Q4dhjkYjbX0UalJT84B+SCJyVURGVWW3seo2p1XEnmqS2Gsug?=
 =?iso-8859-1?Q?2LQ6HzuR9aDIqZEdoDOWV4fo3M96OjQcwDGhhIB29fjLhTAeCLeTkvOupq?=
 =?iso-8859-1?Q?mkguUEsHFSav9hKnbbu+D9BEQZIBMwCWjXy4hAmLv71X2gWxwA6c492g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de12c5c-852a-4445-7d45-08db7dd56c97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 03:59:40.7986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mOBigWrammRgc4tN6j5w/oYrHucDn5TvgPa0tFJK9B+LyvqJOpnE9D0BRvX2HdasulzxSoxF/IYzTaG81QWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5420
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 3/7] drm/xe/tlb: increment next seqno
 after successful CT send
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

On Wed, Jul 05, 2023 at 05:06:06PM +0100, Matthew Auld wrote:
> If we are in the middle of a GT reset or similar the CT might be
> disabled, such that the CT send fails. However we already incremented
> gt->tlb_invalidation.seqno which might lead to warnings, since we
> effectively just skipped a seqno:
> 
>     0000:00:02.0: drm_WARN_ON(expected_seqno != msg[0])
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 2fcb477604e2..b38da572d268 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -124,10 +124,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  		trace_xe_gt_tlb_invalidation_fence_send(fence);
>  	}
>  	action[1] = seqno;
> -	gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> -		TLB_INVALIDATION_SEQNO_MAX;
> -	if (!gt->tlb_invalidation.seqno)
> -		gt->tlb_invalidation.seqno = 1;
>  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
>  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
>  	if (!ret && fence) {
> @@ -137,8 +133,13 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  					   &gt->tlb_invalidation.fence_tdr,
>  					   TLB_TIMEOUT);
>  	}
> -	if (!ret)

Do we now (after this entire series) have the another race where the
below warn could fire as the CT fast path executes before we update the
seqno value? Would it be better to just roll back the seqno on error?

Matt

> +	if (!ret) {
> +		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> +			TLB_INVALIDATION_SEQNO_MAX;
> +		if (!gt->tlb_invalidation.seqno)
> +			gt->tlb_invalidation.seqno = 1;
>  		ret = seqno;
> +	}
>  	if (ret < 0 && fence)
>  		invalidation_fence_signal(fence);
>  	mutex_unlock(&guc->ct.lock);
> -- 
> 2.41.0
> 
