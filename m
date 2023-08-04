Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4DFC001DF
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 00:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3004210E05A;
	Fri,  4 Aug 2023 00:30:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4463010E05A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 00:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691108998; x=1722644998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DjdfN/NKAeTElmDfOQhvSwM65q2QjjTr7fePOaF3Raw=;
 b=dz/vS8+Vcr3YQREhJaDFaVIlvLC4XfLGWKqX3qVUqdRRVhO/hy40Ep7j
 wuZzKDd7hRsIJrBHJzUxugeGhtqv7jx8IQjvGvewQfRdoqW8mCtlbp8RQ
 4kKyd/OKr12xNMqjy2eu9F2cI22KupwXHrCxdnfXGizdoAayK2JrsBwd2
 lwmGOaSHZfZDibuz1iXuFac6o8uBn/Yk6sR8crRYvH47VidCDXu9BbrMo
 Owrufb6amqAXyeuEMtR87dvJ1/USlVPEZ0bs7dZpSdOkQrFpKBzcuyw+8
 pE6/oqPLxiInBR34DSLhX1UN/Wo6HnTdIsUT5V/can4VGN7bIpLmM1uNt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456401591"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="456401591"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 17:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="873143251"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2023 17:30:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 17:29:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 17:29:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 17:29:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXDdNjp7wTGZAOaqSJ/CKkwcQu89oAR88lJfP1+5UtBzCOrGGpLF4dSSwXCt18w1VjwtBZWwv5/u5ufIMLbNm2Pw1TLL3sKpj1nrlIYEGAjmgekK4tpkw5PLAawgkLABQM7yR86tr8BVhs8iM4Ok6UGuDhF9TPbIvG2z5hwBRIm8RYK1dse7jT4m8FuC+fjPoI43zXF83f9gZXzWEdiY5Ye2/t3Y2EPTxTKA4tfpx3kirxtqEWULrKmG3AtRUPu9vma/lC2PCpKjm3B2qvk+6rbXwGortq97CtD2Os3fLHre7nLcAWzdxIp59JCLBRXC2v2QW1jd5Wz3v+OxChdmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTOel9L1CRCII7Al7VIL7MH0y4QdjahIp21ki6DC+Bg=;
 b=ksN7XQOZbrFq0bCKNM3qMQw+jN3EQpMnvUeaVKz9EIQxZy1WqINDCa/q3eJ4nj7UxgEoprD86J8WG2DEoxSQfwd7RAO+xCMEyy1AGaupHjTC2qWsG9Xi0cHEJqWcMZWqie5o0KoUvVfFVV0wrAKThvZKTjBWlz67XTfXJF/Z9M66wSV7180cC6FxETd9+rwWI6DI+NxKAAil293mSFrNdVUTfMjSrZcQCYjLLTt5xVRdx7Hd1a25TQdwme3PUXDaCdoOGhNNUQ9W5Bf8PoEQfYjejQcHg3usNxDQaxHS2UL5qXxMlKmA7v1IuZ/v7MXJ5zPGmZJh3HZWwiZPNwSRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Fri, 4 Aug
 2023 00:29:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 00:29:52 +0000
Date: Fri, 4 Aug 2023 00:29:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMxGTIEXnbHhRYH4@DUT025-TGLU.fm.intel.com>
References: <20230803234209.881924-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803234209.881924-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f63e9a-5d15-424a-ce9e-08db9481eb20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: La0AlPlYw3eh56Kt7JNqVHTxhDK9P5+fw83S3h+J13wbtSXN8j0LJzLTQzTOl/8pt/LYAs95F2iDydM7eXdRv+KcdIkPB8ZtiqnMbUueykRw29XQ19fXWR7yDVb5FfL0zOmYO2u2zXFFSulPMcZKuT0zG7AROePfkW5sZfoPMnfpWWhcu1IcYQGRdNdqhdv1El3fEUYbk6tXWD7XV+Cpzzs2oKp8BSBOBUqWtu6iLqijCYlZHp4PPBoRInB+vNtibrkovqa3llpjsNWdxqPjA2NZ6xeq0EHAuWzhVrmMAXXVlYPDXR7aDl6Z/dF3ilvSipvAcvBeloP8JywCPl3HiD6LB3oz+b/CmsHHsFckpeT5sEoYSU5q2uDTjna3MgALvF0hdDWFE4ChKCDvefJtC2MUcmd/IRdECiSE+zXpR0lF/1wjgT5JScZVYsaEL1GogcpgpsDvhRoP37ApVVX0EI7IK5Q/UCqBV3CjIPVBaYi4mj28e8A499VJ++JvEUpBI1qCZ+ljjPvYtqhHmMcCGCrQDGroait8k/vk53cpn62PvrTxgGxRnfHavX/Rey7n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(346002)(366004)(136003)(376002)(186006)(1800799003)(451199021)(478600001)(38100700002)(82960400001)(86362001)(6512007)(107886003)(6486002)(8676002)(26005)(6506007)(6862004)(8936002)(66946007)(2906002)(4326008)(6636002)(44832011)(5660300002)(66476007)(66556008)(41300700001)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Py627VJRa6HErwWS9PtO2+pYv89mFX8ywqTVg9g9qy9C7Xzy0cjSXYddo+2x?=
 =?us-ascii?Q?TjufTjOmcSHOj23OFBcfj7XjmpMg6TchPEQT6ne6i6d31+wcW3/SXBY0C8YS?=
 =?us-ascii?Q?djEzrrg2a5nfeswVIitbYojfj+38+6WK6WJ4/d7IUA7cBmivRZMG4hPDf+u2?=
 =?us-ascii?Q?k1Jj1CWpTllsdHOqn6uyz5N9jnSRcpG3n/YzVo8h8erkla2sZ7oyS1kGt5dR?=
 =?us-ascii?Q?odVR4tbISkcteWrLG0lvstzV5TWQ/JE5FB1Lp8vGv66wc2726hwnA9yn2RIO?=
 =?us-ascii?Q?ek58329HFuhxTiz70UkIhV0nmpQxExwnp1JGIj5EM7EbpkH2cFmgFnLp3IxR?=
 =?us-ascii?Q?Aj8mSZu8LHLaTynkkxLRXe0KVdLZmrSR4Xs986vcWL/N0Ioa10LsMZLBpi7c?=
 =?us-ascii?Q?/1R4KLCieuQ2i3elSsfQFGDlI5iColvW+rqmVEz5Pk56scyhT+9vD0gkO8dH?=
 =?us-ascii?Q?FvrwiayUjb/utTzJ9bHT9UqnsgZJP9dLus5qqK5c7iS2J+nDLoijpIqBb5zn?=
 =?us-ascii?Q?NeL3+YcUbEZIIoJ3tmu0Z5YOhReBBm1PYzrpZfy5AQMhWTJwphQmlnNMkvRr?=
 =?us-ascii?Q?Q+Wy1SUxG0oHhODAxiS5+75NQ6Lj6KedtRKC18iozWU9eJDMIcOwa7vWrJyY?=
 =?us-ascii?Q?gRYNRF3SlBL4+dYiZc1J7N7ta0c49nspisPDKYu0xageW+0OypflMPsDdgaV?=
 =?us-ascii?Q?RdwMFv5EiQuM3Ob92ifC2aUYSsoDfZ4t6Q31olxb8gYBgJEK4tuIViiK5BJC?=
 =?us-ascii?Q?QiW1fe2HJ2vSotzeFaZLXxeWtI8Zpf0cP0nITxwsXDAfYO5C316FR7puBvBi?=
 =?us-ascii?Q?IlWuysTTCHE7UMfqdESZOTnXdRHZBN7e7AdpAHq+ng6tPducMmWbyWgxXSbV?=
 =?us-ascii?Q?LT/K8yp5bWBmv8RKt0IgqObmRDBKyGMR5+Gu419MSZwwN7AmbfeIvYmEYzKz?=
 =?us-ascii?Q?tRDQUM9uOY6UzmF5u55Jodz9JCfNm7Zb4DvDcO2hLTx6L3gn52Q6tQtaZeHO?=
 =?us-ascii?Q?nJ4xHVLqqoxU5kAofizy23xUuF4jdgMfpdY4Hke+INuOrrfzKVshen2AeLht?=
 =?us-ascii?Q?IEsnSWBLhod1c1a4xfrtpsJPfVFNi66hfqjU9RUZmr00VTND71DuGW/203lh?=
 =?us-ascii?Q?xkd2dgs1F+RvB8Z3TGOCLJ5Y+R8eaLd2fuPmPFhP+E62qm+OHdcOTs0T01RZ?=
 =?us-ascii?Q?JvUJkY6k/PJ58XEj5YRj74OT9OFvpyGJeARNJwrqMnt7Dgn4l9RuKrPVKqt/?=
 =?us-ascii?Q?bkrPNVPG+CLqoWq1MeRR+0FofRqgrYCJQ/LKj72y2ZCzqMRA4DmF2tTZCmiY?=
 =?us-ascii?Q?ppeKoSIfB6Z/7P325FTBdn1QDHxKM6Z67GcAAd0ebxflUTINS8kpdOiBB2Mj?=
 =?us-ascii?Q?j5XjLh6OHbKqIjNfeDYsg811+qDD0a5pGznY/jy2bEBU8LXlvJdGNFOU5PLM?=
 =?us-ascii?Q?oGBcZtp0ix3AbPkEG7JtnzphIgF8nS3QF/+EP0+YU99rQZDPvg6mW3LaAhkc?=
 =?us-ascii?Q?SuPYktEgMvw1qCoF/fztPNjhVpLRQimjIlfOiJXis0Vb/cYmUf6icdOAse5w?=
 =?us-ascii?Q?/53W2X3Z7IXh5mSstiFjsv2BYMcKJ4y93ZHeFTrJRAop19GnLin95/12wlPG?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f63e9a-5d15-424a-ce9e-08db9481eb20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 00:29:52.0396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZVJ8zyIHU/8Cz2iBy+Flzxg1cYsKqUB+WnPYgbmE33Z+XnFM0agXIDLryuPgLCjl/0mLaypvWCDXZO9WkmHmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix error path in
 xe_guc_pc_gucrc_disable()
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

On Thu, Aug 03, 2023 at 04:42:08PM -0700, Lucas De Marchi wrote:
> Make sure to always call xe_device_mem_access_put(), even on error.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 91a3967fd799..19d743f92f43 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -745,25 +745,27 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	int ret;
> +	int ret = 0;
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
>  	ret = pc_action_setup_gucrc(pc, XE_GUCRC_HOST_CONTROL);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	xe_mmio_write32(gt, PG_ENABLE, 0);
>  	xe_mmio_write32(gt, RC_CONTROL, 0);
>  	xe_mmio_write32(gt, RC_STATE, 0);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +out:
>  	xe_device_mem_access_put(pc_to_xe(pc));
> -	return 0;
> +	return ret;
>  }
>  
>  static void pc_init_pcode_freq(struct xe_guc_pc *pc)
> -- 
> 2.40.1
> 
