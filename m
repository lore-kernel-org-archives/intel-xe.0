Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFF4CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 19:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AFE10E454;
	Mon,  6 Oct 2025 19:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOYjTRME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062C10E454
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759779747; x=1791315747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6cnxrAy13KC9Cp1dfwMlCvhfDLl8egiAIbl5y4xCaow=;
 b=hOYjTRME+I5sLDTyJYO1IIwcDbXsR0jwjFPU2ehXcQ3URis7va+dvlO8
 BKksy7CGn6T7p2p1cKyrbfYU93g7zzUUmyq2NW9jXPOko/sO+9oMiz6Xz
 j9H2RGTS+ROJpNEh+UjncowL47Znzj142m8CIvz2VU45QTjN8Q92GNcJk
 4jEPg8OHlDrOfUhgcgurrlUq/p+XmzW2Mz6RbFebMFr3cmc7kG7UVVbvg
 YeioXVPD+XO9H4e0+1xuOY+58ORP3HMVLcCvLZrhCUylBsvX1tFS+tokj
 AnM0jRQ1NhS1z8fdGYZp2IER6o/KpJFr6UVtGne/mN1jH78SChgaMahLD Q==;
X-CSE-ConnectionGUID: 1TetAAKyQj+25YHTi/8JrQ==
X-CSE-MsgGUID: nvJGphs8S9S9IQ3QEBk+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="87426216"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="87426216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:42:27 -0700
X-CSE-ConnectionGUID: 0EkRE86pSHKl98mZDzh+OA==
X-CSE-MsgGUID: NPBQ2lssQJCT5RI6z8WPfA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:42:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:42:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 12:42:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZ7GbPWg6FCZaOs28oVUkcEaRX/CYpykRZHzS+5muTUL5FpjTvELx9O6nIZrYWFpHJLyehMQf52yu5MNlz44YfmLXaSU8IXh+eCyhO6y5fxcudNPOsdzVicEI1f1sl2Kn/eBYIXAQxT1xeHRf38r9tm5KSsfgrcvqm/ojJA/dbRBLlSzGFVoZ+SctWZ8FXeXcuxUZWDmKKdo5nRlkkvzTjiHnL9aZ7f6M1ceTUxSM1Az75KqKood3IUTndL1YTVjd6qn7um5o08ogqq0nJOBlmXrTyDxqB/fQMPDcADmeDzFDPCzBPCZCsgUQ969UU9kdIXDsy41TcHFPvXF84ckew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArAEygc5DtWunc7w3xRtbJS6ftjrpZ70+8wSUZvcXNM=;
 b=homNDIFC1WkHcYYB1mIE7gfxgND+HH7GiwQyP6++p3/sSeFoU+jXjNL/c8sEwBHVcsUgq3JnDT0xe+H56mXGvduzef9FeqFvkjEmDta/lM+OiN50EcYWlDbPWslt8UzYPNd8t5JjtQHmAQi7z5tBqwn3g0vrvhi1SQRCS3d+cLnBc6raRnNxrl6SBGo2cxkQFzstCnDJTpgBPWSYLVeL9VjsybCbq3/NO0QMNkkLXzT1tDX41E6TDjpGc+WezmrUXVHr0A/+fSbzMKpWriV74ihfhrnKJRCMxGuPRzitJrvwoJPsUjP9i0KgylOBas9jCdc6r47a0H4CvF3ZC52xIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 19:42:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:42:20 +0000
Date: Mon, 6 Oct 2025 12:42:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Message-ID: <aOQbmYZzw21jRTU2@lstrano-desk.jf.intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
 <20251006152443.12269-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006152443.12269-7-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a2fa4e-d6a5-4704-b651-08de051076a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pvICum4Hzs2BwW7N8VreHh/Jf/vWjvEakyNOh7sIzsR1rJXWxwruVEOqA3ew?=
 =?us-ascii?Q?Rh3k62ViPogEZr6bv7eUBYiYsbwiWsR7fnudgtg6vGwecNo62hKBoAu+CeVk?=
 =?us-ascii?Q?vqwGayrlsVTo4xBlOtTJWv7pByFc5Ih4m/6+mZ4VBQmT3n7uXDJEu/ONmst7?=
 =?us-ascii?Q?8pMVgs4kFBaaxiaY6bSPuENuc+MLj2YUlLeEBTlcRuw1M1a/gNyYkkOXlE1z?=
 =?us-ascii?Q?6R6oeTzbwZGIcl55bUOR69jwq/SfZoGEli4Zxpv6/vJr2anMP4NCfzc5Pmhq?=
 =?us-ascii?Q?v8s7yHjD6u+/ioZOyqicWh6GFSsQgwJqvTD+8CSg/x64NLQPT1dDn0cfeyhE?=
 =?us-ascii?Q?/RIfwOJjspFHSlPYHMnlAwYvZ/onZxkLKlmoFDzuj882wMVur0BKTptp3PdW?=
 =?us-ascii?Q?VTXxOGbhcDDxe+XpEoNd48w76yySgGSTPgZ2+EksAaeu82U7zt9+8jtbe5fX?=
 =?us-ascii?Q?lg8H/aLDu/pptXprpbpfkEq24H/Mi7tMojDbrelfkXMjsMsXTAkdRMog1yRd?=
 =?us-ascii?Q?nPvLapSyz619XkAkLw8mz667lLGaS6mLLHkpEYmMFj5hOnjtP1U2owj+Uhd4?=
 =?us-ascii?Q?zxdmRRDsTatBRMPMyeGGt99nDW/Dh0AFmsLHj1E/vcVP2lSAJQtniDWHrEgO?=
 =?us-ascii?Q?IFOpPdD5yGw3iib5xX7QYfxSFfbmJ5qwFcf3FJJtaE/o4vKpqdmWv/wjfem3?=
 =?us-ascii?Q?407Qm/TPeg9t43jHVDKRUMtNWTIG6k7Y/aoJv7hEA/FZdxhwJv3RWaz6q9T4?=
 =?us-ascii?Q?Csx1WLlex1t2dTTXrh6RZBqxzB0u4aGqR/l2vl5/JGd9N9RcMFF35ERsMkyC?=
 =?us-ascii?Q?Aq3o+YnJVIeD8fjnwVn6b0mgHRVC7UmTrJHlZNT5fCtNN2yjZdPv+/cGeXf0?=
 =?us-ascii?Q?jPEEa2wEt7uYcu0JBtIX+94OUjNp1yfA/3/O4yyW/OCsvliOH+uyPX1EM4/r?=
 =?us-ascii?Q?5vZuiu4AkAf7e2yK/0QLeB1JsvceapUkEDLUetH3EUdkzbQt2DzSis6CP7eb?=
 =?us-ascii?Q?HQ4gvWs+LCp7kB0aUpIIrU6uoydX75YeIkCcRP08mom/aJp1XYHDpmie+fFA?=
 =?us-ascii?Q?6XPm06xRISbuq5+iBy5gmTi09dcpMG43lbWT0Rywa8x13+k4FNJ03sowYb9n?=
 =?us-ascii?Q?R3Cpq49RuhWUFGK25QCqIobCqV2i1ZLtjuGTtq5kgZO3lBtF7qc+EMcBtSiH?=
 =?us-ascii?Q?0Y6wQQXYMQ7TUrphrh3oOWpRhC+DhtFEZrJzxxF09Gl0eBg9r89ZotnJ7Q5E?=
 =?us-ascii?Q?lRl1OmORfWT9tdcwKA4j8JumTUpHLI3hAv1JUmePdCsBHIJ+Oj45QX6oyHbJ?=
 =?us-ascii?Q?5Hsv12bix+iFvX+W4YtOTWRKEPm+oF0UP3gDMgcjTieHbhIQElS9614VdUgi?=
 =?us-ascii?Q?GFm3BtTlWH9v1Mhphx1ivHs6j42aSHPi9/ic7KsGL6Oh3v80fIJQ/HB40fs4?=
 =?us-ascii?Q?e/4Wve2scATutXqF1ALHwASgQCe/4ZtG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5a+ZIDVgykQWlvrDsYg2UoumGIzBQSTF+A1Hc41ZxeM4+P+JA+CD5e13NA+?=
 =?us-ascii?Q?Ky2G9wDprpYytJ2fygGVwHYjh3AYwRuFLcJZ3ZFdNzTz9mAJFyfXBWvTqF2R?=
 =?us-ascii?Q?CFlKSZPAdOEDGK7vKzz347lggAmVZxuo+0wD8g7cT+iR9eRrT1bBen5buU4s?=
 =?us-ascii?Q?wZOoOTGnavk5LT/l1E8e9d7R0PNELKPUf6ikLCzCDWrvg/dsPFjyQ1gFaEjR?=
 =?us-ascii?Q?0w8R47u6e2FL4nUHES1gQQBUHM790mxee8zzJcDhsSW7Nlpi3u1xQXAOTgBC?=
 =?us-ascii?Q?Aq3n4FK9dF4xdJvrh0B+c07+oevWbnr6szEfuKz9iVnqBk98GydEmLwtE6k/?=
 =?us-ascii?Q?h1aiqMCNq2h1274wzawY6Ca1uCWWHA+Fm1jyrKWMTH1UK+uo0ER8AG0LGSXY?=
 =?us-ascii?Q?X+KIj8+mMBvb4WpJruKti856J/Fx2teol0TE3dow++GyDbnUT1E+Bsimi6lr?=
 =?us-ascii?Q?SWwwObvpnGZ8kA3+JwDFN9TU3BgVSuFUbkjfgynOzJbAuPF6xvu1uXJizIrH?=
 =?us-ascii?Q?mzEsFZS3TW9t4fR7nl/d/M1xSFGJ+m9iCre/GIQA8VvBNM17G46nlH2tCHmT?=
 =?us-ascii?Q?FdIgxxtZiYqTrieV/Obc2p+iAQGmLYAdJnGSl5H3OzFajEM3AF0A05CM04e7?=
 =?us-ascii?Q?n45HmUr+QIdS48cjiEWP/BTcaTCpdmXyFu+BE+PM7irsxaXOn/SU5F1uawQp?=
 =?us-ascii?Q?EIX+u4byED/L7Nou5Ii0OzUhAu1RWfDocoybGcLUD0qIoYtrSo6JbA11KPQb?=
 =?us-ascii?Q?Q0pCWnSlNSrb5LJoHAZyguG/U/mpz+qttWYimqVXiTeChw7rFm/4eP7y6tWy?=
 =?us-ascii?Q?XConRiAE+4sn5AINZ9tvCr3RUkL4wHQIPQzXmZGMbPmVYhyY1NyoDWOmRJgn?=
 =?us-ascii?Q?ocus1XiC3PzC7ocCkZoOSITcFRLaZttYTjap5zZcAI/X37Ub8ZO0DT91+zb/?=
 =?us-ascii?Q?M3cAjm+3Wd8wj4bykxktOaEciqjShDUmR11FsCmaXwJBMAhO52P4yVmbiGO+?=
 =?us-ascii?Q?WKAAhLjzcvr0wLgB7f+gcWeAgod5jXyJAONXNTreKhJ1FD73XBNK0cwhAd4A?=
 =?us-ascii?Q?iwCU+FwCLmoxgY/UEzfMVKRb+kcQLs3GLIEIM2xAI3kYqpyDR4ntMPVGvLmJ?=
 =?us-ascii?Q?1dvNiAjlBPv5QSA8rPosZ7rg/tzD4IHeCqLgiZd9ZYURf4Aca5k5X7hTOP6a?=
 =?us-ascii?Q?YTBTvQ26+FXhq+Vh8T0ar9hKDcxWqHsyZsDBHdnsRoqPCNbMBjc5k+GEIjEc?=
 =?us-ascii?Q?FU+pbnG81Kl+ncZ2oiKgID9spLpTWvyj/Stfao9GDT0HJaRYqzQWpEu1mQeR?=
 =?us-ascii?Q?XAm3vRwky5bWs3T9EfFUz+vj84OO6cZz94ABfH2ppcBvWah7VwtBBwzbUYev?=
 =?us-ascii?Q?hkH1Mus+I4ntc6Az7L2wjZaj8e/RTYwhMw/g7zxkYckIBkAG862DgEliI5uw?=
 =?us-ascii?Q?5uEzRU9ybEo9a9gTJJtbPYtMZJY2ollRZr4aPSBqYt+ypLh6ucAhihKsQ1pO?=
 =?us-ascii?Q?hVNaMnRomehJWGYC6ApBZRsclGawEVMAzIgqD/vTg2z1Og8lYWyYFFC1inLE?=
 =?us-ascii?Q?qZVqdVwWY3wYOOalKzQudyD8bjbmzYTmYXnjfz17gVQxm2lItMlGMaQ0vHSV?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a2fa4e-d6a5-4704-b651-08de051076a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:42:20.4254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYzCLDczF4xv2AUgpK/45ovvTygbiNZyWsLT8Ex9yEdjNd2Smjk/cjcj59GhBHlntDXDXTIxLEmwa/cVci01rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

On Mon, Oct 06, 2025 at 08:54:46PM +0530, Satyanarayana K V P wrote:
> The MI_STORE_DATA_IMM instruction header is quad dword in size. If the
> vCPU halts during save/restore while this sequence is being programmed,
> partial writes may trigger page faults when saving IGPU CCS metadata.
> Update instruction header atomically.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V3 -> V4:
> - New commit added.
> 
> V2 -> V3:
> - None
> 
> V1 -> V2:
> - None
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index b960fdcecd88..4c575be45a76 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -606,9 +606,14 @@ static void emit_pte(struct xe_migrate *m,
>  
>  	while (ptes) {
>  		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> +		u32 dw[SZ_2], i = 0;
> +
> +		dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> +		dw[i++] = ofs;
> +
> +		WRITE_ONCE(*(u64 *)&bb->cs[bb->len], READ_ONCE(*(u64 *)dw));

You don't need the READ_ONCE.

This patch should safely cover the vCPU halting case.

However, I think we still need to work out how to handle the case where
vCPUs are unhalted and modifying the buffer faster than the GPU can read
it. For example, the instruction header might be read as a NOP by the
GPU, but the CPU then programs the subsequent store values, which the
GPU interprets as invalid instructions. We can figure out how to fix
this part in a follow up as it will depend on my VF migration series
landing first.

Matt

> +		bb->len += i;
>  
> -		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> -		bb->cs[bb->len++] = ofs;
>  		bb->cs[bb->len++] = 0;
>  
>  		cur_ofs = ofs;
> -- 
> 2.51.0
> 
