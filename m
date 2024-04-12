Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8854C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 13:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545A210F62F;
	Fri, 12 Apr 2024 13:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d37k3iU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0F810F62F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712927669; x=1744463669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eicJCnT1Q/rL9lxv0RqB3fmzIADk437isorAbS09DaA=;
 b=d37k3iU85ij2IB0jyR/+wWwDNMC2ejCRsm9/MoUbdi7EZuOZkvBg6JAw
 ecFJilc3kpTxqBmGl1KpfAvwNh6o8WbFtrcud+NGSzUV8HFrU5yME8cIE
 UX8MsAVXNF6ehYc4yB9oujnGsI6O4OpBpujGLmmwxGP3OP05kjaQuROv4
 Grm+MzXxU9iUgEN+4RyJ2IPEogkfDdD2Zs3oPkP+J13mNkitW6FIF4Pla
 HEkDEJUJDGoI1RpjQ0C0SEBupyOhoPgi7UU2ke6TZmglBOpBQsTn44382
 PFdYT4g2oXBW/xvG/tRuHFIp3pMzdFqIAKsUg+R61yrR7bvpKjvfckkXM g==;
X-CSE-ConnectionGUID: 6/KuUnImR7y/TBh9bsjrbA==
X-CSE-MsgGUID: vOFyBWI0R2qbow9SeLzWzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8557460"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8557460"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 06:14:28 -0700
X-CSE-ConnectionGUID: ELAQxbyuS0ela+Nk9u2M9Q==
X-CSE-MsgGUID: jhjzJGwMRZWBPvFY9HFsnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21315555"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 06:14:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:14:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 06:14:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 06:14:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 06:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzLjbMxBpho9jewqHy7NJd7pCwr9VHVj4tzi9O7r0kYGcJDUiIq+VPNCwGAnzNDWIy1diW5/wUorLIjUyUTO+vjPuikNxi7BBCB/qybVMRQCH0UAw+xZ4VlvE4q7RHB6xNA+o3T2NqXjMgM5XKk7pzhi/EvDSMwqKGdRC148JufPeMZcDzU5Bz1EYb0c35LaMHgL5T7KLE/6nPXJsLI2lMTz6gACCxOVV6pGBZZzEaBf+E7LjOtzLUpe6mU0AAVGQ6HGTY6ex7iozNoWtrYQEcYf3gRc9pkSPztQTeinj+rMV1ohqPRyQNAIuDoy+VcvX2mpabJFQYLuG6nyyVzd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDy5akPkMP2n71Me35BwkkTJUaDWSpZuEOWhRDEfRKo=;
 b=EZDkVRczFfn1mVlX4mQnLpfwOCHS+lOjR5kMW5tCilAIs9d/sf7R7YZ0rThPATaKlLbzo3Ys5wnqicLjEbR8GrlJvCiFdqz2q1wFcXCIWcX19duNLWl8Fuvw6oXu6ei+3M5GCY+dvnjNa/cBmW1rTEmQ4twZi0ZTaM2kfsphMgdKcwcMcT3b29vb+NGOBuSclJKQMsv5nbdOhnOOTO/JFg67cVdoIh6cP1ZbTOxXIslMvv6UaY+6WVEKAC5lIe4kpyAsNiJzQsLdeVDWUO8xvnS/KmOyIbndHJwDLLAF54g5MKF1Tv4zqvZDguS2z0vRQt8zums9Dr3pib4assRqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4561.namprd11.prod.outlook.com (2603:10b6:5:2ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 13:14:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 13:14:24 +0000
Date: Fri, 12 Apr 2024 08:14:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3 3/7] drm/xe: Incase of action add failure,
 free_gsc_pkt only once
Message-ID: <4sgzyhtdho2d4ubjmbi3iuyu4qwdchycpr5vttayjlxxeu6crs@c6u4w7d5v6ha>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-4-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412080245.1044902-4-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4561:EE_
X-MS-Office365-Filtering-Correlation-Id: cac388df-dfd4-45cb-e365-08dc5af2794c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l06LoNbzSy850Ymhw6wMUtqBhDx0pMHyWTGelm1bmL9YSJVc+/Ozsms2sSH9hLT6EA7NE257mtvdPp2g68lCjyr3ZE8YExXlVnKA1R4TvA5czUjvCXId6M86fGjAMXGkn6yT0tlvRTmfOpdg0kyMYl25n3JoumQc/61LSByyppZ46cCqCXkPa2oEK7IgAPUTYaI1ey3WzB14fXNjpVUrU/UM5dknLYbvw4mosCzM4SDAPLRw5oOsY0af8rL3SxyGcb2yGPBPvkJavbyObigJ0nRL0YrOPlX6w523qtvmTYOD0Y82GCGNH19uPNA5WYyD602M5K+qi6k5H0rnUoKOScu6L1utT17VDy/gi78NtSax6T/4X/yLE/W1HALMgFouVMjp8BMenJ7i5DMjRxCqCuffVDOWPtVupn+4qTmLcrKzfTR+QdY3u2cWftt6VT3FNx+mHPWkIqwidB6eerSWzCREwEQKp719NaKUOUHz7JWGguDyqi8mXNK+TPu/mIkEFm+XzJkrGslx6lWIqoihNzlQ48WkWrlLMooVfSgNkj+UP9603PM1FMcoBlET0O1D2EhBa+slYNgUzUBwS6SAXR17j3N/x282fGwxuy5ehd8gRI5tILDZx7k6gXppimE+WOELLJFda2whHaZhn1oYzoVNMtEIvJuaZiEJ+3/jTGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Iu6KOQHPaeqS9iBCLivNOzljq/i2tgQ7s8N+1uHVmeOR46QFrf+yss4ecWvc?=
 =?us-ascii?Q?JwCIJOekEAiyG4nWwOHoYd26wJBdnQCDxBldPDZdbLQXoyzyS2/s4PQ7p0jk?=
 =?us-ascii?Q?0RYijju47BFNKIaM6kbud0UGBUGwB8h3Tb0hUkdL1/Ip8T/iR2IWOYf05gv0?=
 =?us-ascii?Q?IXE2pccbBAxkjIUHikiMBFoLaWVZrB3KgF/JunKl49Z5q9bu62c7uyyp6LF7?=
 =?us-ascii?Q?oeTekG4iVJqq8/V0NsFwlDTaLdwTLa3Qcckkp1AijKmnNDKj5O27qUGYAAZq?=
 =?us-ascii?Q?EbOYfqNrg+gs/2l90846uf76B2oNQ/MdUxPlYniKeocZDK8ho8X1vA2gRDaD?=
 =?us-ascii?Q?KSKjOmaaboL/FG+idgvplGZ6HMSTfD7jSs3lpyu5l+1pnR5kRExuAIKgN2zU?=
 =?us-ascii?Q?7UA0KyOI4yQbxbd/VFjC+bNbzWjqs52Y2rbNvvc+Lu81xJR8LfPBTfQggIEY?=
 =?us-ascii?Q?G5spINilSbTqt6mplquQItsKbBETsRGv6tHwPqri4HJjnkkI0mxGNQD7gFt2?=
 =?us-ascii?Q?fvhfntMwR6rXh8YX+X5WuVFbGwLH0rFnHovBFYynYZsun1bKY9+9BnY14xnx?=
 =?us-ascii?Q?gdEVutMWq8SOiunOSyI6GtBYO43Grm3iMo1b57Buu97LsrhHE0Ky9CVt3tQ6?=
 =?us-ascii?Q?yeg+tTr1TwIs+6t7D9kP6xzBsLpXYwEIOZxkfoPTaZd2C6tyMCblC8T7nrH/?=
 =?us-ascii?Q?h/TY3I4J/ywlDPiu4crrlMJVESWtPH9JXQ3+cL5oNeAsVv3RYikV1+kcXRCc?=
 =?us-ascii?Q?nU6YQSuL7BSn6OSYgdyJwk5i/9PEPJaRc2UicoQ/GFssXkB0igJyxxnoDXNG?=
 =?us-ascii?Q?+g5zUN+zdTTdQ4Jfqp3Rxns6UpHdRp3VaRFDFkCBDAL2Sywy6GPcGAGFYZ44?=
 =?us-ascii?Q?R4llXGEbeWB5lLgseBt8e6H8+Rkjguz9FOVGZJYDMenzcmXOwOkDPQEIkMDY?=
 =?us-ascii?Q?tLLGaN1quKDjNcks/QNz245Dg5YH6qUy/g7kf/06dfmdPInH6JaQhDglmRvI?=
 =?us-ascii?Q?IcBidN1QFqpuuUSe7qH1dmQjkq/550I8arWPwMsliIHwpw2HmZqyYm/YvKkT?=
 =?us-ascii?Q?jZEttuZEd+gnK7rfuW+B7V2/19WQBuGsONi8t73I5cQTEnPcr5QIWwLVG50A?=
 =?us-ascii?Q?m5Zjd9/MpRnmAnzcwNJpybnc62FsD+zj+hrSfFP42zrGpiXEosh5ewqau42f?=
 =?us-ascii?Q?myRXZGKOOTJPlPUTJeX/78ZEZxRqQhTzxDr1uAnjZvqK6RtWSpsCSrsUbPvd?=
 =?us-ascii?Q?nB2p3qzb08sjzbxxFyjCCLOk5RQAZfHqzvyKTlUCdAAvLVc0gykVrVZ0GxeR?=
 =?us-ascii?Q?qK3NOOi3MSqROF7q6EBIkhnuF5WT1ftuwd9Ngr3VMAf7FchXUJkr+2AKUT9z?=
 =?us-ascii?Q?aFcXwAhGamuoE7K8vnnqOCAdBjt7f301Mr6VqzKWQfRmKACS6XpAq60Knc4B?=
 =?us-ascii?Q?eow0OSgdY6hWWYdMeUlDVZyQueBW7ZXmXS75FZM1rx6EcvcKilsrc66F/VkH?=
 =?us-ascii?Q?u7QFteanvVzksa633Ur90E2MHJo32Ylc0Jy3w8sQzaNwyhtl5O9lqvqJBf4p?=
 =?us-ascii?Q?YzZ0Y1PMG9YI0LB7arJtSoF2Pd8T/Uz7MQcYaa0QCKx7M/DxfyMA4VMdCxcf?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac388df-dfd4-45cb-e365-08dc5af2794c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 13:14:24.5211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtYki2u8yGH1AqLnOEY8LHDoSrevUk4WdTdwx0K3V8iNqO+gL+4QxC1VF/OMWTp5YVbwsSxHloNbR68UQI4n6/HgoJSk8A0cREIsaN/325g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4561
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

Same comment for commit title as in previous patch. Otherwise lgtm.

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

On Fri, Apr 12, 2024 at 01:32:41PM +0530, Himal Prasad Ghimiray wrote:
>The drmm_add_action_or_reset function automatically invokes the
>action (free_gsc_pkt) in the event of a failure; therefore, there's no
>necessity to call it within the return check.
>
>Fixes: d8b1571312b7 ("drm/xe/huc: HuC authentication via GSC")
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/xe_huc.c | 9 +--------
> 1 file changed, 1 insertion(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>index 78318d73e4cf..39a484a57585 100644
>--- a/drivers/gpu/drm/xe/xe_huc.c
>+++ b/drivers/gpu/drm/xe/xe_huc.c
>@@ -53,7 +53,6 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
> 	struct xe_gt *gt = huc_to_gt(huc);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct xe_bo *bo;
>-	int err;
>
> 	/* we use a single object for both input and output */
> 	bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
>@@ -66,13 +65,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>
> 	huc->gsc_pkt = bo;
>
>-	err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>-	if (err) {
>-		free_gsc_pkt(&xe->drm, huc);
>-		return err;
>-	}
>-
>-	return 0;
>+	return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
> }
>
> int xe_huc_init(struct xe_huc *huc)
>-- 
>2.25.1
>
