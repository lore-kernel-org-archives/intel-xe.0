Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E705ECCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E61310EA17;
	Thu, 30 Oct 2025 20:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCJ9ET5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6120C10EA17
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761855215; x=1793391215;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NUS2FhkndsD0SJbNkpu9QhvGUjNFuvccVjjQ+Rc8TVY=;
 b=iCJ9ET5/1q3QWQd56yIS8EbyCDVeNqmX8PIqv+hgHsnNk+VUBdpXdCF6
 LxT1y3yHm+F44viR75VuMDtRSXKwERw0EbixAsiByyJKcvQT59/Oo/4r5
 EaWBg6DmyS+xL5uXRjf9rzCWXF+1Y29NfRhJ0JwCL+KYHxQNymXO5GwUZ
 q+uC/z+Jy21w9QstVdXBpDy5NcgfaYH2TBcFPvIlMggh5iOY14FwiRBj3
 2cfCELWJhgsZJCQJ74lkbhJ0cgVVynpvpUN5AmiVs78RRdgzTKHYdO1XZ
 bSbd0g8obkteRxzbciDwkPuQOpCWiqoDazqAbDPw70TDW97IfYfPZtOeq A==;
X-CSE-ConnectionGUID: Outdo0QPSh25vwTYetm27g==
X-CSE-MsgGUID: I/+BWi12TciKKfBQw3JJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63707296"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63707296"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:13:35 -0700
X-CSE-ConnectionGUID: as5va5vjQ8CuFsBC9+Knxg==
X-CSE-MsgGUID: WSluKMXEQbm4cgIys37ePw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="186386817"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:13:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:13:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:13:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORskBZYriU6OIA2AEU6v6AuKRiYunehTNbKdBnyskVQgjhRfXHbZ8ORm3HcDON/Pa5GOWjAPx6x3fci5oEHFm+5TCoxceXSLJiAez1AP7/wCsLA1yItYoc5yufVlcsmVt4MIVd4VsZdxHN/ix7L8qWPNZ+ZCwUxcc+9rSPJRN2RhHTzubGw9VlnV/h+6VUDSk1G+DV/xQPQBkxVdC5ToiNc+VtCb1heI8gRSRg1RTpfzMKm0QgN+j3Rt95769Rb075aATMSC6pvjK7CJ+VBmTOT3HatBwZ8MhVQlzuUR/aC4WDwDziJKGgqdoBwR1xuvLwe3y6MFjn5+p+hHFadL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq0OXrkwZeYZ9MDQo7oxRYdK4tfSrlYl/frW3rF6Ve4=;
 b=sovaH2pan9YM8n2Sd11QjcFRFomHMbQu7YP/Vurhd31pWyO+P5B4l4hIIln2+VINfsSHwW6/7jmo8sdKjRBvNOqpvSqTXxF+cCZq5xwjqJlQYpkLEnyxA7NTYjTSLgBlN01oofOiLPKhI3Q5cozASQdIo5NDg6rWTa5+0BnSkJmwQ9SnMJgsekUbaBKRAmtuSgdJwh6mzi6g7nMX1c6hLISpc5jaEA5vND2exI1er1w2Z3S7rggZuuXoww40nv7DsK0ggzyy2rsGScWaued54nuuB4Z5rvKGG16A+43XV+3i2E7ueIE2rGrTcMP2NP8x/Jr1rbZz2sZLW3uCECJhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6462.namprd11.prod.outlook.com (2603:10b6:930:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 20:13:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:13:30 +0000
Date: Thu, 30 Oct 2025 13:13:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Message-ID: <20251030201328.GI2806654@mdroper-desk1.amr.corp.intel.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <20251029233959.778689-1-x.wang@intel.com>
 <20251030163538.GT1207432@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046353AE0BBAE6A4A804C6F86FBA@SA3PR11MB8046.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA3PR11MB8046353AE0BBAE6A4A804C6F86FBA@SA3PR11MB8046.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 305ebefe-a0c7-4c51-76b0-08de17f0cb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iztTOaR62mEM096pAdTzDrS0K4CcJEYAmjJUDCeyDJqMi7qtor0O7DLHSFjX?=
 =?us-ascii?Q?ZjRHCKVl+ijOYmCdDOOrlFpbbkBh+VB9ZROkHZ+E35fjdmm1znNaNftt1Z0i?=
 =?us-ascii?Q?Qc3k9UuRKQc8OZDrLtRtIIiLaHoeeYEcZcEFFN5woe0dAsKUpPW2zlO543Df?=
 =?us-ascii?Q?FVOFi2ou+3FFdNv2NKMyc8JqgCE4AYvvQvKhN4UXIQC02p0W2xz6VTKnc5E3?=
 =?us-ascii?Q?5mAc25LgTlDhmFd4slH7YxRiuU/BmgQ3um8+jIuqJGfMvMJsuOxk5fP73NEz?=
 =?us-ascii?Q?SNnMJjVrSvXh35TFGsQLvaezVOEzd0om6djQ+UcD+Cyy3E7hbYJF3LdZR4Sa?=
 =?us-ascii?Q?XKJt7G7ZhDtP32Ka2oMrlHTpaTP8mMJGxaoxgQvf5fUiKE7/Z54Ug4edy+g7?=
 =?us-ascii?Q?i91qOze2LJn64GBmYROEjoLBy4QoouUAF8o/oQyWMpesVDYRpVeM+hoX5rt3?=
 =?us-ascii?Q?GAubise/68b51P0sNU3AY/pfX6N8j++bYf52EssNsIzXXJyVmDZBcoQKjeU/?=
 =?us-ascii?Q?p8V7HmacZAkYskohvk6kjQKmoqRhx3wO37fvuMAFUCQfgYxlHSCmf6+t0SIP?=
 =?us-ascii?Q?jax3IL++d62gKpgT34bRaI4baUYDzym84NnNzO0aCqKA+7KQ8+L4WAYzcLJq?=
 =?us-ascii?Q?hpM50TiPB7foyZHHqfouw3XHokUEig9SrPMzCJazdRVEYSng/ynCYpnUrnBm?=
 =?us-ascii?Q?Z5RYAlb+3IMfGzfiDFcqxNxTMbcrFV9E+ROP2jJNyUf53rMGjs6jrHiFfbRm?=
 =?us-ascii?Q?1sThWl7qTC8YG8monRd32TAlN7IQWVHXa41/T9VguutRKZrgP/YY/eL4nqiZ?=
 =?us-ascii?Q?WBB82FqbTjNZbvsq/fx2Hj0YKnmlrqc2fj1fPkyUXdk8JP5QITdMYsLulLIi?=
 =?us-ascii?Q?SoJ+WNgfgxbWpw14NS/xVs5G1XiadtVsUpbl6/p7p1wNMulxAU4sJnVyMEG0?=
 =?us-ascii?Q?vM+txrVD9w1WJvf4rbLIioNxm6RNLuyKIYGsHxdwawDWWMIiPkQPEznTkuu5?=
 =?us-ascii?Q?zEs8f+KxARvDZrrHY3LGW881n7XzLV0FHoH8HaWs5dtwewzjVrcpCG8WDczf?=
 =?us-ascii?Q?ONnBFnGDNGv3XuJihZP2Zlciwe73X+UOJWcv8vAkLGnq9GGzoXzFbyy/cpGT?=
 =?us-ascii?Q?PzSlfPgTFNccg5btqIu8B9N7xnvYp6X2jzl43jNRvl6iNMWyhP3I0GS0JFV0?=
 =?us-ascii?Q?Q/OURPYgdOK8D/8CcBMcnI7LfibpOKyS2AJFrRFCoBcEQPamrrUUhJuFT+9B?=
 =?us-ascii?Q?5Y4vdCDaWrBXh+jOND42OaNKrH+Zxl0H9RQLxeDXyNXsTI1LcP3bkqwqxdz1?=
 =?us-ascii?Q?XOsdU7Z6LlvGuGh63evoQU8Vtulxm1LVkyfLPzk5JGOrgoOKilnK9lN4bWGl?=
 =?us-ascii?Q?31e8S3dyX8MXaKMxfuJTyJxgl66CzHQXi3sNQVtUXmrDefpicBguVOXrFCrJ?=
 =?us-ascii?Q?9Hz0pc1+FweQI12CiE4jNTd9rzgI4qTL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sX9f+sJuy3ionn+olctFlEe+XLdZVyUOEKRW/Y9NzE1uvxGIAbNkimEMA7x4?=
 =?us-ascii?Q?TUt13s879p5DlnkWbtZQFsyVpRpznYH3ZgsW3xq7FTccYXlqFxtQCpkQVj0Y?=
 =?us-ascii?Q?a3Q4Zh8kmd6UBL8iPj0N+2f0RGyXvOp3O0z2BuE6uMxcRMhbFDKZYd2sx4UI?=
 =?us-ascii?Q?uW3/r7scB8M5SQ3TcdKN1zK/RUMBtVhkO/0yOkQ3r4zfJZ9+gzCG4gLXCjbw?=
 =?us-ascii?Q?XQIz4XmgKnh4ded7DL4igKMEj3X4ZY/7R2vOEB9U32eTxCadN2PSdvgEBY+B?=
 =?us-ascii?Q?4PkPtfkqll/KILZctU88oiDY6lGPFfVbGE2+T8ivqZbjGqrfKlxjl2fYvur2?=
 =?us-ascii?Q?a0xzEGppBTaDPQC/cQj1trJDzAxApAwgHXJLT4QhX7NWg/TL+PLroiK+N7EZ?=
 =?us-ascii?Q?ttpYJs5b5HLJ+E8E7XeRvR03GQanvJ7M9WF/lnirSUrRctRHwHmHFRvlovYg?=
 =?us-ascii?Q?SO+0gDjrKRxLj5gnGORqoR89pwk50Aojz1vKSnAwI16TDfE2dqlArEJcZh8S?=
 =?us-ascii?Q?ZrjU4VOpAODaibr+AgkYSry55WTF28BTKLM/soDVKxC0KBu0AsFkwqjZY0jb?=
 =?us-ascii?Q?WN2+eDovp6tXsAn/1Zf0eXif6fgS0e/9yb7VUdfXhlWcR6uFKJROM72sIzgr?=
 =?us-ascii?Q?rwBMO6DFHpdsgfo4Md2JEX8l0WYd2RaZba0oByVPW03qqO5BGNYqosiPeayn?=
 =?us-ascii?Q?fSvPZA8Kd7lNJJUWgY6KUC0GFSXtUOw1fwnn4lPVH9mu1d7Kr/GH4yFU0YSJ?=
 =?us-ascii?Q?/CS9UhAsk1FxpJHEBKs6LFSygpyBLvG/1MEvwQY/oe2jDVx/vPgR6mGBrblr?=
 =?us-ascii?Q?FbP/Cm4hWVE8WQwvb6SU4eiXaZpv5ODek7N43ELqmFC150NpoP+QJZ8jxgGb?=
 =?us-ascii?Q?6NwEsve5YzyPx6NKYLb4gdqjassL9qQs0+989q3zeBJMAC9/GKTFFnkQ5Evf?=
 =?us-ascii?Q?yyu6T0MvPVDBYbmPVdwoXCyTr5buNy8RkFCD8kCdiuoxd0k5OIJLx9ykhPWN?=
 =?us-ascii?Q?zOdQ+llb2K5wCfERJ3/owPenJNkdFDL5XY7yzmCtiIWvkSD+26FXeaq6lPbG?=
 =?us-ascii?Q?x7/ySsg+yfLgkDw9tC27SZ90wMuKKh3xw46K+v6HSQ8Vu8WVzNilfKB9gH6f?=
 =?us-ascii?Q?tDPmouSnPn1QnjEjZiGw7iyS/WgoJT77MJyV0W0sEegwwZRHfmLiq56pwvE0?=
 =?us-ascii?Q?eCjZgtL7H8U05gWRqek+Q1q/xmE89uInHi9AZMIJnE7kQk528/8j6sbB+4uG?=
 =?us-ascii?Q?qDC6HKeptMYKVf9q08mfzHnxjz6955CQq0aJF2EwAeLOnDMmTp4IhgIzcjC4?=
 =?us-ascii?Q?Ltxd6Gh4XGkdWeieuG2kD73EM/W3yy4DqWQSLDaQ9FM8Nig765px+ogvqDLi?=
 =?us-ascii?Q?d2MWlLmjTiDhKvWSS6eCO1dUkMCNmKyw7Q2gRz4htbhEol7SNgr3cVa+NwXL?=
 =?us-ascii?Q?XkiOBScTCwKnB2/HDW0Mo+Ni+XsvlgbHRdd/6VQA03VxgooG45HAqtVMhQ91?=
 =?us-ascii?Q?i9QIs7hH6irM7hdZXLBbfPBInaXawNYLZxOKVQ2+3ZF86fhyxewQO7MSiMRs?=
 =?us-ascii?Q?Jfa7ltd/3r/4q6Wmvr0WPFR8E85sv/310Bah274j9pjUv94MP0pUM7/1kWAH?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 305ebefe-a0c7-4c51-76b0-08de17f0cb73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:13:30.7588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZtbirppGUpy4vVdD7GYlvAxVn6sEDR9g2qNzuH0bPRFFSIkXKPcsw3+FNuw1PYOEN4nWoJtrj4G2wbAUwJvN5jkJSyDgYa8fyngdU5JriE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6462
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

On Thu, Oct 30, 2025 at 12:55:12PM -0700, Wang, X wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Thursday, October 30, 2025 09:36
> > To: Wang, X <x.wang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.com>
> > Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
> > 
> > On Wed, Oct 29, 2025 at 11:39:59PM +0000, Xin Wang wrote:
> > > Enhance the PAT table dump by marking reserved entries with an
> > > asterisk (*) for improved readability and debugging.
> > >
> > > V2:
> > >   Added a note in the "PAT table" header explaining the meaning of the
> > > asterisk(*) to improve clarity for readers. (Matt Roper)
> > >
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pat.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index 7649b554942a..d9f9d5bb8e5d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -368,7 +368,7 @@ static int xe2_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> > >  	if (!fw_ref)
> > >  		return -ETIMEDOUT;
> > >
> > > -	drm_printf(p, "PAT table:\n");
> > > +	drm_printf(p, "PAT table: (* = reserved entry)\n");
> > >
> > >  	for (i = 0; i < xe->pat.n_entries; i++) {
> > >  		if (xe_gt_is_media_type(gt))
> > > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> > >  		else
> > >  			pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > >
> > > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)\n", i,
> > > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]
> > (%#8x)%s\n",
> > > +i,
> > >  			   !!(pat & XE2_NO_PROMOTE),
> > >  			   !!(pat & XE2_COMP_EN),
> > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > -			   pat);
> > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > 
> > I think you still need to add a 'valid' field to struct xe_pat_table (and then set it
> > as part of XE2_PAT()), right?  At the moment your patch is still checking against
> > coh_mode, which is going to mark a bunch of legitimate entries as reserved.
> > 
> 
> The .coh_mode has been set to XE_COH_NONE(1) or XE_COH_AT_LEAST_1WAY(2) in
> the XE2_PAT() macro, for the reserved entry the .coh_mode value will be zero.
> So, it should be ok to use this value as the valid determiner.
> 
> If we change the definition of XE_COH_NONE to 0 then we need a .valid field in xe_pat_table.
> 
> 	/**
> 	 * @coh_mode: The GPU coherency mode that @value maps to.
> 	 */
> #define XE_COH_NONE          1
> #define XE_COH_AT_LEAST_1WAY 2
> 	u16 coh_mode;

I guess if the only values we set right now are non-zero then this works
out okay at the moment.  But it still seems unnecessarily fragile since
there's nothing documenting that we're relying on coh_mode==0 to imply
something unrelated to coherency.  If someone reworks PAT coherency
handling in the future and changes the specific enum values used here,
it would be easy for them to break the valid/reserved status of the
fields since it's not obvious that we're relying on 0 having a special
meaning for anything not related to coherency.

So we either need to document that we're relying on this clearly (both
in code comments and in the commit message), or we should just go ahead
and create a dedicated 'valid' flag to help prevent any future mistakes.
Since the structure currently holds a u32 and a u16, there's already 16
bits of unused padding at the end of the structure which we might as
well stick a 'flags' field into and use to track validity explicitly.


Matt

> };
> 
> Xin
> > 
> > Matt
> > 
> > >  	}
> > >
> > >  	/*
> > > @@ -426,18 +426,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt, struct
> > drm_printer *p)
> > >  	if (!fw_ref)
> > >  		return -ETIMEDOUT;
> > >
> > > -	drm_printf(p, "PAT table:\n");
> > > +	drm_printf(p, "PAT table: (* = reserved entry)\n");
> > >
> > >  	for (i = 0; i < xe->pat.n_entries; i++) {
> > >  		pat = xe_gt_mcr_unicast_read_any(gt,
> > XE_REG_MCR(_PAT_INDEX(i)));
> > >
> > > -		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > i,
> > > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]
> > (%#8x)%s\n", i,
> > >  			   !!(pat & XE2_NO_PROMOTE),
> > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > -			   pat);
> > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > >  	}
> > >
> > >  	/*
> > > --
> > > 2.43.0
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
