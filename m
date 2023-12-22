Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AFBC46CD2
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 23:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043410E0BC;
	Fri, 22 Dec 2023 23:27:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1410E0BC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 23:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703287658; x=1734823658;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TtcZtWNLZSDKMEIx76OWDwpluSzE+sqZWavSAvRsoik=;
 b=AthFL+10+pvA2lV6kV3KR7kUd9MbQ1N72dnqg1Ou8whR5dmPPdBGe7Mq
 8KFrINrXS94b/ic+LzqYa0OUAK8VVkW4utc0xm8DxVbtgobTrGpjeOlek
 giD7zBHrwGBeQvf7az+Z9bh3zVVryqmynuh1TZQEdzhWNcCJVYMA2ML5T
 6/e7VqKNUMua87BA1OyMeUo6umTEDzCKZVYcqHsYPClN4JCVCK8KYjCcv
 XFupujbx/ifXoYftehXWcjdSHxv6wturQCwiNo1jLGILMzLe/VkjE3Pb0
 DliQgTEzYBswUQ7bFYm5RL8vvmHBQIOF/6X9SC8ZftVj2d4XEVLbY4/Im A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="386599147"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="386599147"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 15:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="895634467"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="895634467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 15:27:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 15:27:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 15:27:36 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 15:27:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbwgWJMgfzjmMy3vyUKy5B9RCZXc9ahOeOE5VsSBPehdbjCwC7tUgGvBNooOVpavCstT9uzJ1W9un8kcgSyfwP3EG14477vTIuoThzeVpX6rJl0624PIbPblRDCDqEL5IYHKI1QjC55pdkPOpmbG2DoR1AcOca6mnbfiNEk84AJZAtktNQ9GkNgkCql5M2MnAlv5dtzQY0U5WFJUMpTjxJYG5cNkg+RLroHczNoPn2zbzzp6x7SUvOdmxO9RzVvSGjJyBG92k1INEY5nALm0N1fDnuvRwiR7ezqzxPRtRLOyCpHJ20vfp2yMUVSOftICrEZnN4VTS0rksR4TfJd1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABDTv4CH3pRzLKq06mo8ZVLwiRLi6OJxriTDr9es48s=;
 b=ngTWx0htg/2BzWuiXH8xBeUA2hcw8AK4PEiHgN8uCdYqXj/xEKikqi4rxIPLvEYu15IqdyhG5eVjvnTtmlysuUKOASOXk+pdb/UGPRrZZMClZfOzoUwChztaqN72aew7sg0V4EdIgEPm0N8lW1E8kH60iSPtcB6OIyGVXLixvvoO3zoVD7cpwoewyVEVpiOtPlepTVkfUScIqzC7OvQ8IJpvOPlB2lvsnchJInPs53BHqpllb7iKwLmtA9mX8+oehMtTbgc2o7IAjmpCNaLgosgN1PY5i3YsiwOd05F3ahC7zZb7ML90eeLHnME/Gqtjisz3HE9wOSujN4OW2qw1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 23:27:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 23:27:34 +0000
Date: Fri, 22 Dec 2023 17:27:30 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Check skip_guc_pc before setting SLPC flag
Message-ID: <csyaomj7vxclwjnryt5gksgqtwbw4nnj4hgaooe6qh4vmuwolf@fsa4kwm3dxvp>
References: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231222210109.533215-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 857c2056-bf59-48a6-8874-08dc03459331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Bt/bHm96aQ4vApQzVW273uHG7+ox0X4GOuc4f6OG+4aDuB0p6Ym8L1PeyYrMzfCRmi3+CvtkFI6QYJ3l0xJkJ8vnZ4Rh+ZBIsOTpEMx3XJM5jVkuG2k64nPervS9l6ftc3DYEOCFeuWghIDvglkZRP3wNVZlVQmqKyQBLBCineNG12JBmRYqGpzC9UHnlhh6X3pMB1riu0B9ZqmZORbkeX1EPEMVfhMqwxSA/x1ixZC7mWPMW+rFlNvN26ULagyLiNXzA6jw5LZai1RM654ELKc255Pmv4RHR/dvUgtQntP1wTSI/bNw4OW1j/ihlgl02BRIs6pmUb0zzLBXfU0sV6Z0oHV6Td8jlKsnhB77i4PYPfbECdjjMSxJns6aDolDceLZt09bRPzekazlQh1CSzs4BfLx2TU0aFbxSBCSwpY1tRFhMOA51mojnUUXcDEhDkYtHOI9mE2rSWQJyEBDI9UPbQttA3FmaiBi3g2E7ULLI6QPBPGr8fq4sChpn2RGw+nDcpEsq9vH2/nYVRs085oekd/Insr0x+Wh22xEJpDiCKSOOkb9kjctjLZIjHk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6512007)(6666004)(4326008)(38100700002)(6486002)(478600001)(6862004)(82960400001)(5660300002)(66946007)(66556008)(66476007)(8676002)(8936002)(6636002)(316002)(26005)(9686003)(83380400001)(41300700001)(86362001)(4744005)(33716001)(6506007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?alcUMCS3j+VDSMrILY377qaWj1ZteXvpXdq5gPLo+ezYQGnzxxquMoO9eyGY?=
 =?us-ascii?Q?W9XQtvq3Ri3/uLwX6be51yeYyRUyQ9/yvTQLv6zt8Gy3ACNr+HlzCM6C3X6K?=
 =?us-ascii?Q?Gsx++nWhd3a9qzKt3YkkB/HYjvZUMotYAzVPsF+kohT8+mPnyT7oFSored2Y?=
 =?us-ascii?Q?DYvhcURq3Mf8NLVeIXgG9Ry4NJO9LImBlNkpwTHQwDkWRpzWGQR1B5MqpfZq?=
 =?us-ascii?Q?wDOhFv1oxQXubxNwTpNLatcQV29fuNmVgmu641NzunfkVYpJCrkXvGFw6tZG?=
 =?us-ascii?Q?Wgkrfo2s/nd+iwolGwdk/uMR81hcSmjAzBxCw76a/tglGOqh5lrI7kU8Cwzx?=
 =?us-ascii?Q?v6KzIXMx+X05WgZSzHwit4KTrNcVooq1C9/L/jDyLjYyVzGJCt3WWmP2FHu9?=
 =?us-ascii?Q?e7jTdbJAByu5IotQffAYQXqcTzm5HIty54AcM42wVcImlxxDfJdoAnJwa/2T?=
 =?us-ascii?Q?VKgZ5wtjBMjLrWFx5F9dcaq4Rg8+dk/jNS0H+uWhEOP2k9ZiEJS6sYToMMYR?=
 =?us-ascii?Q?ax4dXfi6OfwCkUZdMN+O2U0fkU7XDYfvBSD9u2L23sGd6J8BC2Ta2UwNhKxl?=
 =?us-ascii?Q?y8y3tuQnO9CSSHMkqmTHEsckeV44+Urt5gX0HNqfpnGLOW4GmZWex0RJaNQT?=
 =?us-ascii?Q?d++IAwrYd+vXDaELDfE+jeiR0Tb/diVJSPR4++Ke9GTSb+pZsXaNDoVFs6by?=
 =?us-ascii?Q?mAe3847CrHXnPrz0H7M08eDFY6jtu1HGAlMs6bXOj12hFtlZgpQq7RdXl+vc?=
 =?us-ascii?Q?OZbD/MzQ5b8ZTPaDwmR2UEXW7C64N+ITZruz5IyrSsASO7sJ5MvI7b32hBkO?=
 =?us-ascii?Q?36XEBG+9B9k1W84UBtD663Qj7MVQQsDJ9ilyt+RpafDneNPvl6ffo2f5aD7V?=
 =?us-ascii?Q?o8grD7CM9fFTvRnZt+wCxz3Cpzp/0N01FwFsCZwz5cxWaPQZiYAJzoulcF9T?=
 =?us-ascii?Q?U2/Gx28XiQfRcbEyqqRdnFu+SNzp+QxBdDQcObImfyw4HOv8HoVCTa0nTV0b?=
 =?us-ascii?Q?yU9Pd5xEV5F4Vyh8PJbaUxNR0E7nxqDbQ7I+5K/Q7G6I0o9T96+zhKBrKVLs?=
 =?us-ascii?Q?hgnFx5OWs3YrY5CnFgCSkDTIZrHkkAVqYI8BStXFoqlyMr2k/3/OfDMBemxP?=
 =?us-ascii?Q?Zb4yqhqoP7NCU9VEaMTvFCaRm8TD0EyP1VTIzlrw3y4copNUGH7m0zSvZxQB?=
 =?us-ascii?Q?Y70NP7mhnw3qYWbxuaZon9YBVRQs4+ftJQKdlvxuoiaOpxyStIZxbdY/eHLa?=
 =?us-ascii?Q?aMBCxDbAL/F5HtZH9hZj+uCduCFUJsDoziyxfdUSSNkrEO1756jVJyAqREPT?=
 =?us-ascii?Q?n4rE0M9IybyAXsm/8ByVZRHj6JP4aqqj6g0d3wnHozv112pxT+I0XI7auTpX?=
 =?us-ascii?Q?O4zUY20ykRM1ETXuJF3tc9aAg4HMjdKr7jebJmxmg2qUaIUm59+at1BDT1vg?=
 =?us-ascii?Q?H6UsjKrRdkX9vgIEjx3WsQ2ZptIdsDfErcKwX1jDPWLWE24AX5Oq/RWSdQoa?=
 =?us-ascii?Q?auWEJfhbTT5NVLUKPt3WKKUekUsWQIExpTGt1qyijv8qz5KovLIdaDuIVCtY?=
 =?us-ascii?Q?NjLqB5WlgVS3PWZZDsKj1ezgHFw63Qy9DGV+n9t4teYrzil1NmwaQivdkZpJ?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 857c2056-bf59-48a6-8874-08dc03459331
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 23:27:34.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpkBxGcEm6ldF47ndx3urTvogC+tv2TCd5tmpjnYUeso53htPFW0J33sVuBdPGNIBuD9JLxnNfVj6wdn3ZTID2v7opXOIk3iZcu6dw+cCdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
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

On Fri, Dec 22, 2023 at 01:01:09PM -0800, Vinay Belgaumkar wrote:
>Don't set SLPC GuC feature ctl flag if skip_guc_pc is true.
>
>Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 811e8b201270..0e112b144ec8 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -62,7 +62,12 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>
> static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> {
>-	return GUC_CTL_ENABLE_SLPC;
>+	u32 flags = 0;
>+
>+	if (!(guc_to_xe(guc))->info.skip_guc_pc)
>+		flags |= GUC_CTL_ENABLE_SLPC;
>+
>+	return flags;
> }
>
> static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>-- 
>2.38.1
>
