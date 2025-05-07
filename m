Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383CEC3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B0410E878;
	Wed,  7 May 2025 19:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZDRnW86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E029A10E1C9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746646230; x=1778182230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ynHWFs+vMJq5ocstHRlEEhLw1zTuMOrIXmCN41lr8bw=;
 b=ZZDRnW86skOUaxvIzoumgYS23tblCJZZdP4rvxJ8grc8uX5rxG2ObEHJ
 pJm2y9ynd7xYm2SYcuo9zm7JZpSg5JanLTNb2fMdi0JXauoVO7zOYyWfz
 HhQMYrGbfR8uLY/NQ98puJ+wOC5nVdcr8R2+N3o3ggiJUU9kmKUi7SRCO
 UuJVDVOD8BzjRVTyVjI6mHod6nwzBJIzD+73YyJ17T1mmCsVIm5huDy7l
 d8vWEEm0ey0LHNKmZS4gP1OSzN+lPEKn8xU2mvopWjEzC9vNQ02AJFh2K
 SbKc4ov3LOhFBH1DEpApewnkgyzqAf3CTOqXiIY3EcvTp4j3ad8mZk3ZW g==;
X-CSE-ConnectionGUID: rVOkFZSNQ7+xRRS+KZMfLg==
X-CSE-MsgGUID: ZTtXWZ9tSUW0ki0wWfDGbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52212541"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="52212541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:30:30 -0700
X-CSE-ConnectionGUID: aF6T7Vw6T76m/kmfR0qMAw==
X-CSE-MsgGUID: muGSNS9iTZaG46V41B4Hvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="166984132"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:30:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:30:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:30:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU2yZXCYlz7Gl+xv50DLswxGET/CjW8FTmrIRzJ3VkhMf27kW7cc909EhcEqp9p62CTAprwF6Bb6SfFeurr2Ge25lSmQbilTodEpZo+84PwthDYG6l9hLxLAYiF7Wc9tbyvqjfiFnQ5C7+faNZNZcWqFw27nSL8Gfr3nHxwSwtIVQCGLWo7+FXTHnHYHNAnbDZjDsVvQHECK+6nH2uB6mVnam+C7ahIGD48u/3ai7v9eEtMlmlr9u1niZjwLULk+kR3mUVkAB64IqXRaMic+TYE3PZvhrINLqrr7Os3VziLZsYIoO42buqfPf7ROAQlrdG0ws4rqYnN9YRWAUmuLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z08OUQj1y+WJR8ZGvGoXOZJ3Zdaa78pc6iOHwEPC5W4=;
 b=toDIzbmWcQzPfJAktC/Z6iWIjPtemYE/gecmZonRNYoSGEsgZorfNiYHegjRbuQ544j0K0/B5TqP6msx8JcO3FIsOfthtQxE9GvH3idq7JrBj8Z5zRcd7TSpKc+LsHV6Ir1mrEx/ghLP7hT/Zx/FiUAvoNVWE56ELDZJhKJFvmJp7h6ouw4YaaeCbDplAGKpAmmg33ubOmT7lTZ3ePz7L9ZMQ7Nl/oU5xOg9/q+EFGxbZ1g9jkctrjnCR1PNWo2DYIdmg3mfIkee4Hwk6KxIMyl7MR6+T2acSTPvTdGp2mV0uXXKdfHg+Xw/Em++wfFNWb0OcIl291ieYIfdbjDCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 19:30:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:30:25 +0000
Date: Wed, 7 May 2025 15:30:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Release force wake first then runtime power
Message-ID: <aBu0zzXBjelQUy2d@intel.com>
References: <20250507022302.2187527-1-shuicheng.lin@intel.com>
 <91469b5e-170a-4f18-a694-61e26acd1ea8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <91469b5e-170a-4f18-a694-61e26acd1ea8@intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 92983d87-061a-44b9-2092-08dd8d9d9ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbwOx9vA1MjDtHdFgvgHGZL3EvQGraw/07xi8xevp2bud+r2GXxDtPOi8NlV?=
 =?us-ascii?Q?cc2cXciNYZA3O+Q7lF1trj4kLKp0Rx88i+KMcofg05Z3xLy3wKwjjC+KYKdp?=
 =?us-ascii?Q?Ym60mKrLoYPy5ryPvPXcgROkDeCQdrYmIP6BVviUiN4f6Ttu9WUqCOpR7S3J?=
 =?us-ascii?Q?+TyqPHmYWslqYJ1ZYKh8GTMzceTpdlifySU/b1+rUe//z7OLJ/zjb5y72L9T?=
 =?us-ascii?Q?VEZi90g+/8Hre6WU/kQ6PMqvo5VKc1qD+0mdyATJnb8Gwur2T+8mVsrW2POU?=
 =?us-ascii?Q?F5Sf2oVxRvEiZgv4KQGcg2uPS4TRVJaSWvTCZxammE7wncBeP0Hm/jUkEe8S?=
 =?us-ascii?Q?s/n/rF6BTr1w7Uw2WZTvzpeS9sxKnnvWy7uEu3u2t699Ovm7lkgvnHQMyGHx?=
 =?us-ascii?Q?hjVv6K32IIXr3HDhMD59ADdQbo7g8EmfHEOLpFhV1e4qzgl9mMA+nqLL/uIC?=
 =?us-ascii?Q?f3b5jqzfN4fkD6xxXh22+VKy7QKM51M6JYr59RkkFe0cVtj0BfbB8ql7oJi+?=
 =?us-ascii?Q?Q5r001FksGmTDJ/tBN+nWUtRouurbMG+ZNaRckWHH1VRxM2AQx7Nm+hzVhqt?=
 =?us-ascii?Q?Vyc/IoHLORlTqmyCkWiJieLasZmXXox3GOeEFXOuumsNEKECQNKFaNm4LGdX?=
 =?us-ascii?Q?3Q6nOXqoV3AG1sFTHfgxZqqulDF1wF2KgFIAlTFaRKL27G+pC9Yt5LLzioOz?=
 =?us-ascii?Q?PO6W2CD3HufrIhC6l/A/T9KV5kh7BrIMma4NE0BMXWzpWZOzjVmTD9uNKmIU?=
 =?us-ascii?Q?C/9QOLaZ1ticEV43DzR/zB+TkM3ZWzxEDX/L5b/8TVUj772Yt91QgSvWEp+3?=
 =?us-ascii?Q?oR9TGwmHM5WnOPygHrbEvBnP7ChgvhROD2KJS7DdBzYiiQIR7X5HK7imeIyW?=
 =?us-ascii?Q?vei7HxH2WMRQsji/Ud5i5UU7jBS5QTysS1WEGpgJwezFMuIk+5AZxzl18YfF?=
 =?us-ascii?Q?N2Z9Hr0Xkc679JX5unCmQoFwqrqdYm7l1KEkSVjdj/a0US56/uRAv3cydcZw?=
 =?us-ascii?Q?5m4TUF2VWW7/73j7bL8XmJRaLExnY2vi9CE4tz3hHGEkgGBCgW/M3BPhYtUy?=
 =?us-ascii?Q?NqJ/2tv5UqYmLwLH4ukqXmCIg8744rQDvEXwPBwRgMok3F4IhgXt/JLnC6rn?=
 =?us-ascii?Q?VFnCNtifxTrjyaiSc+itbyeovcwfV104WxXERrCdoaYdjg6ny0E5uVUTPu64?=
 =?us-ascii?Q?0xPm+fDsAETcmOOdUupfmDQhtQXz9eCCbw7VyxM/EL+UlDkHpFpImSWhp783?=
 =?us-ascii?Q?UE4blwZeHge98Rd7ir9spxfdvDVNxmJUVqF+lka11i25J2fn/RfYRnPDH6x/?=
 =?us-ascii?Q?fKwvg91I2NitY+jKT69v6/DfB9mTOA+PGPaXa5yiNmxTR4YHtrrsi+qiInur?=
 =?us-ascii?Q?+2k8PdX/BzUVtcaFljJjEN6/a/IPHjU1BcQuKfGGKN8bNGJlBU/LvY2ln+M+?=
 =?us-ascii?Q?TdwqYXhJAok=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SNhxkqni3fXNQqp++i/DFPEr06B84Bhxl8XSBcv4UlCqq7OT5NPUAvb9mGa4?=
 =?us-ascii?Q?18iWrEB5vPXtcC5MMjEEprj3cYzHe7P0ACEVF8w6P0i7e1x9hpj1BcxnGL3r?=
 =?us-ascii?Q?zfUHDotrZrXTtBQ9TrVPLBEntExvgEZD95rXnDRePVsgux2DTpw+94G2bUq+?=
 =?us-ascii?Q?SBdnP5cAEkPeduU/tRqxjWkMHgJCM3vAU4oiOCnxgf0njLLdoaCncHvgGweh?=
 =?us-ascii?Q?HJlrALt/Et49KT+ZHnMJZLZ26eXJ77hv1ulMIB0wYc1jnKo7eTGns8hxiQ6W?=
 =?us-ascii?Q?SNE/n7uqI8hD5ITppBfQ8fTSUnG7FtMxHqdaIkFtMDuiSbbieMK3Eebo5Rmj?=
 =?us-ascii?Q?aozc7X0VJIQHcvWLnaW77/h+Q2jy95ZtDysc94SRl33p1O7QcpW4bAcKqzED?=
 =?us-ascii?Q?yYAMQKb+alFH0VQ10fIUsga3cegM9ZgzQRe2gwqo805rq+UTb0wMDpG3ZnDC?=
 =?us-ascii?Q?djlpQUZ8UP7Lx6Ez/Mj3i+Tl6mkVw0bwIm15SQaP9VxUBDkOgkM0n4C8jnUO?=
 =?us-ascii?Q?CzUE4SFLIeTYdkZw9PNHLSgmBZf/3wfdaxqTpXTrT7VdhK1Pf9Rs5WRWNTdh?=
 =?us-ascii?Q?iRPsqH8l4HgW+aizGxS5drHkJdKod/urMxJuoOJpclQmJBbTNfsYAXY8Z4eV?=
 =?us-ascii?Q?wzh3AeVKr9CyAZWTfvqy1Qfne4m9m414tHkaXyog8bdYo1/LKhzEE7H9/kgO?=
 =?us-ascii?Q?+FghIMoCaVPCwwElU60skA6rcLiVHu/q3nS/BtnI+DEDCi98yhaizhrSp0dU?=
 =?us-ascii?Q?h25IFwgBb33DH+VtXHfEG+ZBpFWLQ7bV15809F1NS1XO9pRbcEwObnYtCdI1?=
 =?us-ascii?Q?R8nF4f6pqpMc32L3rLyhrELdjnk6i8Yw0UbhXNm28ip5r8PHAiBXZPFTWAAY?=
 =?us-ascii?Q?J5YTJMhxl2js3gar3IXANQIhzXPP6Cq/fvWXPEWcaauYlcNjKIO2mrsqXXru?=
 =?us-ascii?Q?hcug8ZP7lqWe1jR59TzfD8e6J451fCTrPhwIk+zpQ5f0K+4IJASb+hPLAnic?=
 =?us-ascii?Q?jN5wsXhfg7OOlsNVfvcVF5odQ0edStaObAy+2EtVjlIHI83B2FomA6vvX9fi?=
 =?us-ascii?Q?h1IgZOpAFY+APNMvcuJqM2sAMCkyfMi3yGn1+JQlXK4HMBQwvBHnX49UUfqJ?=
 =?us-ascii?Q?PHhM0tnzyylo1//97azN0C7ejv11p7YMI9D/+0pULJlWptd1gQXuOpsGS566?=
 =?us-ascii?Q?836K23C1hdRym6l5QVOMiI4gHMAGY7WQSJ0XRwgpqDHdr/TJJFa7GNfmKzAG?=
 =?us-ascii?Q?33YsqeI54gBncRbtnFI8dOC2nwoYSXTkOzdiyeue2lAwmhH4CH23ANcbOr99?=
 =?us-ascii?Q?Vv7Twh3BSC8zaS290XU3Mm93N14ep1Y3NXQ9FUDpKn57uLAHu2yDFA6YTbN/?=
 =?us-ascii?Q?5O8VxMSrUJozLostLTQiKBvd1BeInbLvL1wtP+WbPFZk/e3Gsw9TBEnMV6jN?=
 =?us-ascii?Q?979yc2QEgVXxdd3cOBmELA6qjrENcEZC791EGOZXei7vyqT7CZ3t2ZexQzdm?=
 =?us-ascii?Q?qrhDxqAgtdqoBDd7gICtNUj0/R4P6VdSqxOaZ/cGTFtFdXBH2Cv8vWw5GhPv?=
 =?us-ascii?Q?L0mhvVmLtBLlYK8YrxudXMZk6WO5kg9WsRjGfsioIUVC3ssp/pZfndxTMD1O?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92983d87-061a-44b9-2092-08dd8d9d9ded
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:30:25.7707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXU03GjL3kuDm+G4CpGnIwFUsB0BAZCv2uMASCMBMti8O5SXu6aXk2cYxzZapGnlMOZJ0dPSveiqWhCuc+3iDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Wed, May 07, 2025 at 09:19:31AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 07-05-2025 07:53, Shuicheng Lin wrote:
> > xe_force_wake_get() is dependent on xe_pm_runtime_get(), so for
> > the release path, xe_force_wake_put() should be called first then
> > xe_pm_runtime_put().
> > Combine the error path and normal path together with goto.
> > 
> > Fixes: 85d547608ef5 ("drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return")
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> LGTM
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

pushed do drm-xe-next, thanks for the patch and the for the review
> 
> > ---
> >   drivers/gpu/drm/xe/xe_gt_debugfs.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index a88076e9cc7d..119a55bb7580 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -92,22 +92,23 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
> >   	struct xe_hw_engine *hwe;
> >   	enum xe_hw_engine_id id;
> >   	unsigned int fw_ref;
> > +	int ret = 0;
> >   	xe_pm_runtime_get(xe);
> >   	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >   	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> > -		xe_pm_runtime_put(xe);
> > -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > -		return -ETIMEDOUT;
> > +		ret = -ETIMEDOUT;
> > +		goto fw_put;
> >   	}
> >   	for_each_hw_engine(hwe, gt, id)
> >   		xe_hw_engine_print(hwe, p);
> > +fw_put:
> >   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >   	xe_pm_runtime_put(xe);
> > -	return 0;
> > +	return ret;
> >   }
> >   static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
> 
