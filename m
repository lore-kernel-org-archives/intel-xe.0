Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CF1EE49AB
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 23:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384210E03C;
	Tue, 22 Aug 2023 23:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCCB10E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692747281; x=1724283281;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ChONyv288Z5K3+DdV2iBKsleBFi1TJ7iNV4BRJ/JbiI=;
 b=fAqy1Zv1S2jAUf4N/jNgGfrmScssMtcAxdl+qYkED/v6Cbq3/evQH9Ep
 jL4fDivrDHU+o3P3fYbowI1qrYZ/tFuQ5/L6wJ4zFkaVbj5A5BtyQyeFm
 mlqHaWmG/o7MupjPk8YmgMaGFy8qLb9cDYDBbpfR7fmfR0ahP3LCBzI0l
 W/Vn57Pb0j2kqCTsE/umm8qDg39fhFhD7e61Jk9NE9drd374PPvuCqceM
 QF620PcT0+O3JwbyVurQjwK8NobXJxyrovlj9k4FvYcvD7LPTgF9LfPwx
 9AnSn2JwTSUDqi/jGK/vwHA6Gth2dGGvD9TQQzWocm8ItJ3xG5/ykdevN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="353577614"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="353577614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 16:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910272760"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="910272760"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 16:34:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:34:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 16:34:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 16:34:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 16:34:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGe2bIda0B1iwuabV38nApSmnhjYdpkI52c+dg63Gzb85v11bgiegITyVK02f/MtrVvj6fO0WkDwRJ5FZ3pmaEny53Y2QCxyZSqk3ZcNOmqNUalygxjAGwAJ8652b9n+taGYEfKzqUm5dzZeGbduQRjZuZY82a5lVKy/D/nd9W7PQfT704zHw2ibgLzvUKrxAMPCmoXHMUq/IPtWj3eaR/XYumuKkGx1hZB6E3ua70B2aybqkHU9pjd8p77kZVBCqiHus1bQAcp6retKZifEoYYY4/3caeXXZfQ2kHecYLLyzDevWSbmE3eNQ0QVYKZ7kTFtgcAYIofRoxgEEiHorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/zuzuXXrrD53m/yt0xTGMC6CrblOq8J72icz4B5DQs=;
 b=FNRgQiPUmsJsPUyF3o500pMt60GlxtaarFH3w777T0jsof0PudvjT/ctWnYMmxipfYpCISblixq6NnRRoawg2tpJdeXFlQuP7qahyIgogVejqo/EUTtVXgTdo0gMbLjWm1IsdWyfpd4jjIee+GQjZ4UELf0bESKlb+THSLSxYTClrZMkzfwtMFjR8nWaEk6Wsf813t6CKr297gsJixZv/x6yOEec2XcUpwN9+6s3c7MWYZwAuV09B2paLcflH9m++GcMvBONSk+7xZv3RC3UwHKKki2AmU+PaXNxrQdUdOIvfq6sB/0jP3sGcMNDFneD3GS5/u/v2HE9EAeQp5CfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 23:34:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 23:34:32 +0000
Date: Tue, 22 Aug 2023 19:34:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZOVGBL7zos78OhuV@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
 <20230817043148.740495-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230817043148.740495-3-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d99c14-c1fa-40a8-cb3f-08dba368560f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +dGlu/f6Ck6UhvmRL1LVfNcYxX38h8xNc9zCZwxWnL/3LVpjkyLzluEkMjTXOCE4tfzCg4AtsEDK3n62y4f3E+BtV3Wqj5Htt9p31B05NpYkM6YnlnREISM5uQOUAJpIow8f/voHU9HC/FZWkzA9tlBEiobXgUdzR8nmpe6pMzG0gvwureqXK1AvT/m6mIEkSklcC1CU9RLD/1Bf2E0w0Pl1GWIR5q4LmbIusTTmKnch16MDL34L6JnQrGHb6TYpg13vZyJTLehHKZCOnxynveNjujVZB4+/Is1CdbLtvKLcjbwMoRddqqC058Q2BwsgLKTGVBQVzE90e31S28zpWjQsPZymSD70w9Qmki0ibT1x9z+fzHorIGZ4ywFktUel96lxxxXa3K27G5NjsW5URIpY6IDiN+voulpBDhlGudt06Iq/cXiXo6q9B+ddgKv2rb4MWgOJ0oFYSIe2m5bM8EzghKDzp0Jf0BUMlBQKbTFDWIDPnt9DeVxF3iA+l201r+gQR7japnow68OrH8SDz/1OENiOkWQ9L1Tl777DskoUa/khjuFC1Lwx13TKTIRd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(451199024)(1800799009)(186009)(83380400001)(478600001)(26005)(6506007)(6486002)(2616005)(6512007)(6666004)(4326008)(44832011)(2906002)(5660300002)(37006003)(66556008)(82960400001)(38100700002)(6636002)(316002)(66476007)(41300700001)(66946007)(36756003)(8676002)(6862004)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BUDGCl95qZJLG13wtuzdB9nLfeNaUkgsH4wQLZOMWhyuTu+5dme0Odzeb+PS?=
 =?us-ascii?Q?IfQRHQvZhCjSpF+Y7r5iXYBKR/xQCJlXlB1dvyu5yQuNQXJiCcy8euGx4NU4?=
 =?us-ascii?Q?c40j2EuxktqXCY8Wj3jfJW+uTfvCaADrDyYjNq2onxGSgGSO/4mOVR5SsD1n?=
 =?us-ascii?Q?Unz9hbj70F5r0y+2YqPROLfLuAqD+NlajD9wuPP4rNTV4z0Dap3dvAq8mEsY?=
 =?us-ascii?Q?1vJKUiMNjpjXS6Ohx17EQCSpG//dH/i7RsUQ91O9BIn6IEJReaxNM6p53ruH?=
 =?us-ascii?Q?DkH0QqsIzplFVvnLJ16+U4iP0kFD1e3KFEnXWmxlhjlYxun2tRGj5yZ7Xh7j?=
 =?us-ascii?Q?AIhQ2Y/XDla5Iy3TIamq0vDV6eq1ytPzHjOixUxcL4rnkqmzdC+yveMvxLte?=
 =?us-ascii?Q?7WSgNbTndYqJZYEPbAHaj0RHgMj0kxO7+5oxBt0CqZrlYBE8EIr8H73KDcef?=
 =?us-ascii?Q?ecqnLLuPhzCbyPh7SXjbgFY/v8kMx6HiHcyhHv8BTH16Gg9Dakl0QY2SfXOc?=
 =?us-ascii?Q?cdtDt25tWQ0IZhvjyu0RQadPi58glVqin4Wzj3qLgELMQGKhMLsblznE6vaY?=
 =?us-ascii?Q?aqmpdZpgqXOHlCfS4zVVwgUOkr8W0YLOp9CpS5f5E+1PgBoFv5QbSXiPec79?=
 =?us-ascii?Q?IwlkEM7Knv0GzZAy6GwOWnTK1uDTCgMBzvwSw/4hl7eVdqSZcpu7tEWsVm4w?=
 =?us-ascii?Q?chIUJ0caV3vOgRF3E7ockHfX6gPQ3KK+FTMHd1EAIkO1R6/Pfau2s9NKEzR8?=
 =?us-ascii?Q?xKSuue5E7PBA7Q+A1aAHUFUNJ8hvGo4XYDJxrL13HAEuzjr0CXhF9vaP0k/N?=
 =?us-ascii?Q?9azUwyPcVPrpWtt1KFFRU6fhX5B//PJt4kM1hkTsB5IFVjZmdm/zmE5dgMBF?=
 =?us-ascii?Q?M/+ockaffRxtRXPAnToQHBNFLkzDRG7SqFQtcbExLvdizxKon7wMseB1qW1+?=
 =?us-ascii?Q?ept9YtymA1cKIL/SCEXVXPNmuMSrfCcDplOpNaMkATdEYqXX/F89c+VFfoem?=
 =?us-ascii?Q?3VlDBJY/hWseRtYcKrPRcMtcEThNNJ7zVXVzqsm7IYWdRQZmixSyEa5rHMEP?=
 =?us-ascii?Q?HfW7d+vXy3j/ASYUs6cYiD0NEj/kHvFpuNimfIcDVniCmSOa0a9OEUZmuQiE?=
 =?us-ascii?Q?sdLyY1i+GjJaYugSB3asDqi9T6YBgGW7DeJwoE0qppEVeXtWuM7QW5Fmos+3?=
 =?us-ascii?Q?zSIFnedKN9aCIViOtbFFI7dF0TyZe+VNtxLTR5pIgiNlZtseuI+LciMEIk2E?=
 =?us-ascii?Q?lGP2rjnQnLfaNJQg5YZVvDI57AvocPWCahNT2TcrWm4stoXXAaNj0iWG8Xj1?=
 =?us-ascii?Q?3JQ+trnd1QaYAf0DXFmYscggeUiZJY3LqnKFB5eUvHHwJThu+Bp2a4hJYv3/?=
 =?us-ascii?Q?Meafi6/XOi/I3X7OF4zUzJpF49e2GMJTFsSGKD9ilTlF8BrXJQ+6MG46GFDV?=
 =?us-ascii?Q?8UeQyHYhqi7znAwRycBVVXo93C1tP2ZNotiTPOVpPdcMOmEacRb4FGu1LP9p?=
 =?us-ascii?Q?4zHcYs6cM2Y84OSZSuNPPR8N+DVvaIZEmM6wJo45lymcytVqYEynI2ma4yNr?=
 =?us-ascii?Q?U9BiX2ChfU50U3HmNl33Ki8rjKljHkDse+MjBBAM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d99c14-c1fa-40a8-cb3f-08dba368560f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:34:32.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3shv66LwGeFbncP9rc8fzP+NKi47+2mdOxdBypVSWEJojJDa6zHaKMYdp5ON9kPcEXTm4RgvQ78wvxrK3sl3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/gpuva: Add
 drm_gpuva_for_each_op_reverse
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

On Wed, Aug 16, 2023 at 09:31:47PM -0700, Matthew Brost wrote:
> Xe will make use of this, add helper to walk op list in reverse.

I believe this deserves a better commit message explaining why this
is useful and not only that we are going to use it.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/drm/drm_gpuva_mgr.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index c6678b1dc5d2..455eef90db21 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -616,6 +616,16 @@ struct drm_gpuva_ops {
>  #define drm_gpuva_for_each_op_from_reverse(op, ops) \
>  	list_for_each_entry_from_reverse(op, &(ops)->list, entry)
>  
> +/**
> + * drm_gpuva_for_each_op_reverse - iterator to walk over &drm_gpuva_ops in reverse
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations in reverse
> + */
> +#define drm_gpuva_for_each_op_reverse(op, ops) \
> +	list_for_each_entry_reverse(op, &(ops)->list, entry)
> +
>  /**
>   * drm_gpuva_first_op - returns the first &drm_gpuva_op from &drm_gpuva_ops
>   * @ops: the &drm_gpuva_ops to get the fist &drm_gpuva_op from
> -- 
> 2.34.1
> 
