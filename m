Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79372C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A9210E1B5;
	Mon, 20 Nov 2023 21:38:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ADC10E197
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700516317; x=1732052317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d97aH1SqQ4Cbwv7XivbjOjhXivZJZ9QPaOjTdlm56W0=;
 b=cNY8GzJyNtDCrQhGz65f4rCCo1O4XNKCMLFTuXQCTBCjCEwb6mwEIxd1
 Zgza0XmyW5qxtplGyyJzaxXj5UDBN/WyKkg4i0/z0cRldZt+awH9s8udd
 c7ghdEFsEGADCS3siTRKksUqZGwxMcsh7Lt5Ir1KfW081Y6ZP4/VKxuzS
 gUPWuPy9s57EnKUtv/xCFItRjlSWYHoZ3iwK2jyBC8tjYhNFt+6H58+oG
 i1+PAxHAZIxmrS9+0hnw7iPu/7GT2GEwnwer6Z6MdBMh50E5/as7wmRLV
 2rX1CjYIix45uaf8C2rHZBgUdpg6jVBpVmvK7CgWFVGb03o7b8LyTCx/A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391491781"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="391491781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="742839081"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="742839081"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 13:38:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 13:38:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 13:38:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 13:38:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiHvhGd4BIrzHilLxI7Q3isy0ezrGL26s1D8afMyi1dIE1JCe0d2YIS3ODAVKhPXXKVAPjb9kvgjheWYYGwu96PQYZVjNkU1UvX1BZd8mCkKhTaEA5MBrbNs/svS54dBfLWovtH95KSH+TlUxoMnty+8y+Nwr+1GwKb5GGy09kxISFzxsM+7Hsi3TgliMkt5M2NiqzlP6OJunbagZ9doSvxFp+ex1AxBfF+WpfUQoEjVAAQ74fPiA3CiGjoo6kXlmYj2mqldkBbZ2vymADmGnUs4rIOIfZ6ELMWIkCYk7YkNrBXdFLO7V6ePmAihNun7L25vBjNJFe8N3s3+An95Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jeim4eUqIPIe6OKi4oZbghvXUzSFVgZFVVNb8jxAeg=;
 b=HI9/tUPHRpfDNlz/G3RmxeoQEXSztRJui8uGMQ1r5HglzNTknHsqH3yBhc2ss4p2dYtJd3Ch8JEA6DXwhgVTQ4H42D4BqmpMjAoqcieVvPd+nLHSl/I4bC7rvBWp57e3+OB5hOTWxutb+eO+jVw9I9gW7UUwGJWoHOdVUWtAIxxt2/pm6Mp1flwp3bElwTXQsEvWtzv9Ff8306KwMCBMlK49qW/ML1W8mlD/KldehaA8vMoVSdsdGPOsJ/gdL+LaOqNzpROeVH89ziNecrligMGWbyYoALyvrlbfCR7Jo6awDzUzBjAZJIQxTxDuTDR01KkT+yG9BVZMnWNpuzWp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 21:38:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 21:38:31 +0000
Date: Mon, 20 Nov 2023 15:38:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Haridhar Kalvala <haridhar.kalvala@intel.com>
Message-ID: <gxsehe6styg7ppvrjlprusohnojjrgoo62a7kbhpsdcrxarecq@gzkxmpqjqp2m>
References: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcf670c-666f-440d-27e3-08dbea110a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZqnSMe0HKtVjLGD3UsjrU9XwZVQ2KPYCUOfPpy2hEMDgCKJZqomuO4uhVW0sMuH7t1SDsRrgEO3c+5Wejnq0MthTNofaQ8QVEptjMRJQRtYrQ2aNUINovEPi2hFV8d9AWN2KNRhyaZaOlLlKR4B2Vs/4ZrmhORK5dy6mKm4CBAssLg2PBnS2RYujId/qLqcujidtYMsrBFaJRInvJMqr9XAEAdKvCUHxiruChPVTGD4nKgb2pp+0SlfJrOaW7t/5seqLP4rvuj7bowI72E+XdeJwuhC1wH2BkMde+g1uia0ji12SlqGqc1Ub2lzAixdmi45DWH7loDLKZuJGmD7/JlN+qhuDsyr+kMxUhy+cdczP6IlIHwWPpirmGCKVc3hmb9qQ8L1yLhjWYyMILjh47/dBWX7JVMXCXnPwOePxQLCYB7RDaCX5Hkl1aJVyjVH+iUOVXX15A03k3zNJ/33QTUO/gysmlGo/6tnfem4ejWkb0+uAoc1TLXEY400hAAAXZJm3IcVPhQ9W6Qe9bcocQrOPErGM25KyU6rUs+WhR5+NMnazdLg9LrhqtuDII4HW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(83380400001)(478600001)(9686003)(6512007)(82960400001)(6486002)(6506007)(66946007)(316002)(6636002)(107886003)(66556008)(66476007)(8676002)(8936002)(6862004)(4326008)(38100700002)(5660300002)(86362001)(15650500001)(2906002)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UBlvY2f75sH464ZoOo1nUMyE5Dq3wBUdRLCWwr5vRfLqPeSo1ilz4YLMzoXW?=
 =?us-ascii?Q?pGIkgVsMVvLdTdORHw07rrsAYRBP5sQZxVduzVmCMbf/0KYbzNB7L/5JFYOo?=
 =?us-ascii?Q?BRMc9jqt54um6eW4jQQbfR1n8xlv2wbm9MSguwAKRQfodRXii/AUEbCg890R?=
 =?us-ascii?Q?YcXkmlKQZJ2DKl+FH2nI4VUg9upb+SBKG6EnV5HimXucvIhr7WXyOjRwmqjB?=
 =?us-ascii?Q?nVpG7fiLj29b1jrxwi46a1AkM73LhZn8HN6U7ZuMmutfwjhxxGyRC5DtHwHb?=
 =?us-ascii?Q?hukM/MaIylbQj4V9Ulm1Ss7ih2cbLSOunb6jryF77a7w//Pfatq505YfovgX?=
 =?us-ascii?Q?XiFm3J5c1dQ52I6A8YltC9zgeC593xaChs5Teh/nGwsGEeTJJPqHPXEln6my?=
 =?us-ascii?Q?HV2BXB54+oy6VjehLTh654qEOPVF7hWqqvd8VSptE4i61syGCl2J4anoPRld?=
 =?us-ascii?Q?qRJIT50yde2IkBHcuunSe7ki8pDH8THLUvw83H6ELzzR9VqW/Pddij36j25Q?=
 =?us-ascii?Q?t0HVsTIQwmmSCpAlOmjqGdNXPrFFOuT7j2H6stpIIputFTVJvjInwmt+xtPT?=
 =?us-ascii?Q?A6ob29TwLbLk5n2cTwzVbhBg5Ts8nRsuCZOHCcE8jXJn4c4L3eBjInR4zE8z?=
 =?us-ascii?Q?vSWSFmJUhwhx5j+Ejfa/Fiu0Poh5qkD4yAK59tcb0Na3VNR3XTZcQIvAHDBL?=
 =?us-ascii?Q?v7ycxdQyUUqsWu16vvzFkSnwKULUG0R/XQM1jiiFN4JCsXlJmGFwewVffgT9?=
 =?us-ascii?Q?U2rBbznN9p1W/Jb2ZvT16DFGnuPw4/NQGZoDLV0Dj3tJ6Fbv5onR9sZC+s6A?=
 =?us-ascii?Q?6TXYk0w5XI85gZCJy3I2m6qoGQzmG4yf+btvNNcAn7yxVuLe8XooZs4yI7iR?=
 =?us-ascii?Q?rkOsOHDKnA1SNvL5d8p2ceSpRipFQecgPCYGSv1cSFCJIsovAoFJIqEosAY7?=
 =?us-ascii?Q?U4sbYmN8iAS8dR8HgIzZYSAxcHmwDlthJa9awvP33cw8Uolq0O8T7Hisvldz?=
 =?us-ascii?Q?p/ganF4gHOGx13jFFNwkgepMjAig8PCQkW25J3OdaOZ9U4Uh4O7h32SVDTEN?=
 =?us-ascii?Q?+zsjfFod3/a1vwScVwMbWmw4fT3QIwVnDy7uy6NNZLbdFNfkhyI1dYIXFbiW?=
 =?us-ascii?Q?RJrXN00tFP7WcVX47OUZuB5ggm1ACdr5m5DFTSk80z3Ncvmd0EMiQA/Pwq3t?=
 =?us-ascii?Q?cFASXb7Y30BLOtVuQVZFk6ELTvenWfoish9YQa10fPMm1nVEYra8yFBue/6Q?=
 =?us-ascii?Q?9PWGwVpGMSSIfzj1qLzZiSa5V10gwU+iEJ9fa0PpRgRLGFNtcjVNbSqQdRLm?=
 =?us-ascii?Q?kHiqMDUneyUR95i1u8F0O9FIaw5xya/k8vi4nQyjZWIV3sa1TvsrLu4Wud5h?=
 =?us-ascii?Q?0Ho1/IUZqz8YcXUsW/3d3Z66FdwaWhQXz8MlEa1czA2SUZNf9c0MBg9pWc9D?=
 =?us-ascii?Q?RBcALB8QPcLWrwtYUULPCyuRANJS8J6+cr0WvSnXmENGSeELkIlh5WOd/zxT?=
 =?us-ascii?Q?7iXmk5sGh8PMF2FGJ1ILEw9jzjfndd0za6a5eNwuhV6PtBj6MqtErGFd0Kj8?=
 =?us-ascii?Q?D6Ft+UCCMtCKn6dOc4cTsiJZlEN5XU2nB3yRYovDLK2WvRWhHb9Z1UGp3ERv?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf670c-666f-440d-27e3-08dbea110a6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 21:38:31.5561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xx3IAnNb2v02LJf5dU16FdJypU9eW1uura5lzqRkD3QV9jwiIL3FNbaAOlaUqYvOrrAirnPH86n1VcHJR0KFuujiFZ3lQjcAiXmtd9tk+3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: ATS-M device ID update
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 12:25:07PM +0530, Haridhar Kalvala wrote:
>ATS-M device ID update.
>
>BSpec: 44477
>
>Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>---
> include/drm/xe_pciids.h | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 68fbab161feb..712eb53f1f83 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -157,7 +157,8 @@
> 	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
>
> #define XE_ATS_M150_IDS(MACRO__, ...)		\
>-	MACRO__(0x56C0, ## __VA_ARGS__)
>+	MACRO__(0x56C0, ## __VA_ARGS__),	\
>+	MACRO__(0x56C2, ## __VA_ARGS__)


it looks like it's also missing in i915? From a word-diff between the
files:

#define [-INTEL_ATS_M150_IDS-]{+XE_ATS_M150_IDS+}([-info-]{+MACRO__, ...+})             \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x56C0, [-info-]{+## __VA_ARGS__+})


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
> #define XE_ATS_M75_IDS(MACRO__, ...)		\
> 	MACRO__(0x56C1, ## __VA_ARGS__)
>-- 
>2.25.1
>
