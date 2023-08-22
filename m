Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4754BEE49A5
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 06:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DB610E2E2;
	Tue, 22 Aug 2023 06:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AD810E2E2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 06:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692685682; x=1724221682;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dnmGFVTh5DGq4RBhkOWTPzwLDwfKXSBlBsYutlntrkY=;
 b=fhstKnijQAE3umqPlvnM5ShS5gPcGI0TwAwZlYaKkTywyI7dQSsJzPXW
 PbBrbTOearHsTmAT7WDWFTwDB3T4qb4dXYJ8tvu9/ixZxG0ok18rAYNdG
 n/L4cv2ActzUalQhJwulspJ8ym+GkCGb8nkCDQcnwwAznehABvSSwC/NU
 QreZFV50R3BZ/CwPms8YWRN6Lm7EOzrbA4A0r6Of0SumXB/BcwQNBeI25
 299hLuxdW/mwHBcyNzR4EuMfYTSPfQrDv3XqrA/jmNvTrxBTi2rtZM2Rq
 WVrl6l2rStXwpvloTDwcKsMKHrICRo4Qtz26oOD6Wg1ixwkFXHp27KvLv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404794713"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="404794713"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 23:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765625023"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="765625023"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 23:27:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:27:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 23:27:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 23:27:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 23:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPLOeLMZ8C7XD4DTNvwNY6YXdXOE+jZ9SJT5Y8/mxVzwOlnZiBb9Q9K+PvHFfhLmdp4hzdqITST9yzOBSPbTgbE+Hr0Qmjgusa8HmqanNUMKIiytbH6spB2egwcEREL6D+X8rUmxRwintFS9M7ZMpFt/aWh6/uIph+doFojGz3zhzJXXaxIAEZfVt3DVvoAG9qhgsyJ0Z3qCaL9a1TVo7Sg4EI+637A78AKTwoYeDzYIJuzSGN1iqWt4UWDW/8vUdoBiHaJpsdeYjn5kKsHbLRY62fINyQ48ArfVQNlJD9Zkhfh9PPtzkepRQKDtePEvJCe4pD+M6rPdZ8WWWc0SiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUkPMdRfaJMrbnNuEgEmnOAcaVoPXWZ2sm0M8lW6UwY=;
 b=Vo7xxkyee0n5eHbIeEgyOunmk0XVznrCxjMb0+xL5IIsHSMkJdsvU2yPJycIW+TYBkLV/MWhRQKHtkAM4gSdUg3DJwwU2+elSQ3Rhl4Pbb9myix87DaxdM6NK2wKAeIA633uWV/wijLDaaM2Zi+YWKhO3kIY+N+vILJMyEGLNJPwgfcrf1DXnC7Ww/F2n1zYpzN1Osmroy9QZStxfLqS68JxOiEMy4h8Aab8C+LzM3dCunYTefDs9ZE6QUgPkre2dKlgm5SOgUNPBMbUwgqdD2+yyXG2Bbsp5O04Ts4Tc2WgFD4Tg/yzdvzAzR9Tc5xROTzXu4+dUBrv/e5rYQtkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:27:54 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 06:27:54 +0000
Date: Tue, 22 Aug 2023 11:57:42 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZORVXq7lRIk/syNF@bvivekan-mobl>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-13-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-13-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 825679ef-396b-4fa7-e957-08dba2d8eacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gXL66saJ3lw40GgVM20pQbCqBg0osnCnoywVR5y+TBkX6wgaRprIYEXaQdPcjUAcnnt1z2RV303q+5/T7HyzT2YEr7SGp+EBNCQ2z1U6VazO5+mJSu02GL6VPFNnoaiP/ML9H8ZZx6tksaUBFkGSnxlsqV/gcC7OSGfff4o3chv3gvkOdTVzFRPCjKb1oecQ+cNvsSiLrno2kjN6RIBuOIDEx8b/zrNs2mJhNg/ppHOT1cO2lZZ5lS+pqyzR13IpgtH/N+PcEQl8b3ZWZM8LzkO42gZfQzuD/SioqYnhx+wfBmt381FTiGfPOhFL28PwkHwJ5IGf05AnXyDv7SNUSgoMvjjGwW3KEq4gp/ShrOCk1uKWQ0ezhh60gqPJnBLHgQL347DYtgYEF/8n8mFIMTF6k3Cezw0q3EUOOmIzwv/qH3LgrpX/7+G5OsuIvOpPCH8xwlx+LPBYwZ5Y98EXWg+HvEdIgAiPjXiXwZCubj1+UMMl+2WAw5nvH3jmhU8zgcq9y6DsBLkEXNbT8HLGg6hZRjs1JwLVAMAoU4lyFY+ylxlArsZgLBYz4+e85CuG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(2906002)(83380400001)(53546011)(6486002)(6506007)(38100700002)(5660300002)(44832011)(26005)(86362001)(8676002)(8936002)(4326008)(107886003)(9686003)(316002)(6512007)(66476007)(54906003)(66556008)(66946007)(82960400001)(478600001)(6666004)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkNXaFd2UFl1ZXpnOVdacjA5ZTlvaFFOK0t5R01aU0V4ZG1sNVlNUmM2MHk4?=
 =?utf-8?B?R2ZoeGtISEF2a2FONWxrN1NQZWRoWi9IeXdKNXRLL0pDWTNaOU1SY0NmN05u?=
 =?utf-8?B?azMyL0lzcVlwNitNaExlV1I3d0tjUlJSTHlMQ2dpL3duK0wwQlRQd3NYVHpn?=
 =?utf-8?B?S1M0N0N6em5Ic2ZjeTBPc09EYzBFbTgveUhqUU5IU1RuSWlVeVdGRlJmNGln?=
 =?utf-8?B?dGF1TWxKakpFVTNHMmlFUjd1dnZKblhYQStueEN1TzN6UVRqSmtmQ2dJbFV6?=
 =?utf-8?B?bVVGVWFqSHJGeS9teVJ0VlVMeVJSYnhvVHIwYzIxSlQ3RVB5LzZHU2lRN3A5?=
 =?utf-8?B?cGlSWmdCUUxSZTB5QTdKYndiRzR6VW4zNDQxdFgrSUNJcXQ2aG5lNWhUcmpx?=
 =?utf-8?B?c0RBU080Z3FSbXk2Wnd4STNmVW5EZ2dSVTlKOGc1TWlHNzhweHZHZzhjR0pw?=
 =?utf-8?B?OHMzaytBYXNrWHZDRW04cTlWZGFYTGZWVXRXWFdhZitQOVJGUmtRWVpJM2RF?=
 =?utf-8?B?TS9uLzNucktKejkyanRxZkNGZUNTRmUvM2ZrckNMKzZwQWlLMy9tTlVNWk5Z?=
 =?utf-8?B?dGZ5U0dMY3hOdWU1OGFwekFPSXZoL1IvMXo4NFk0WWwrN1pmKzdqaFZLR2V4?=
 =?utf-8?B?TGxPK1E5Sy95TWMrRjF0bUxNcExtM2ZySEVtNU9wTCtUbzEwdGZoeFVONjBn?=
 =?utf-8?B?WTBPVGd3RitYQkptUTMrZ3dkbDV1WWpXdWMrcE5MOWNnT011VkxwZENOZVFw?=
 =?utf-8?B?SjMydVFqVVVGOEpHam1lOXZzZ0g5ek9IOFYyVjdkSmxEVEQ2T0lSUURNM0Q3?=
 =?utf-8?B?Lzdza2s1QXBySGF4T0hRMXZaekxVSlVlcXczdjQwMEpqTkNkK25aZXdrWnFI?=
 =?utf-8?B?WFlxNWZreXRsaGxYOEtoVGRKaGhSSU90ZlA3RkRzUWd6anlLSkw2bGJwa1dI?=
 =?utf-8?B?OWtTYXlEZWE5QTd5bnBoUDBzTVhVK2dDT1l0VkF3Y3ZoN0JOaGk0ZHpwQ293?=
 =?utf-8?B?bVlNNEh6V3JFai8vV0pwMlJrbTIwRDNXS2F5VmV3OXZhZmZjdy9FTWtBOEZI?=
 =?utf-8?B?RjR6c0tBVmwzYmJjUlJPckFjV2RMZU8zUWF3aUN5VnpkQ29aYmlJUG43YU91?=
 =?utf-8?B?MVNmVkI4Y0ZaMUJuYjg4M2JRTEIwM2x6K1N4eUIySTI0UlJhVmROQnVRNnlD?=
 =?utf-8?B?Y1pLb2tpeWxkWXFEOThUN0cxVjlqM21xRDM3NW5GSFJHMEJhN2ZHMWFjbW1I?=
 =?utf-8?B?SjVMZjdic2cwRDQxNlRaREc4VFVKQTJScFA3S043dWdKS0ZVdXFKb0FPTVdD?=
 =?utf-8?B?YVlubDllOXdQSTVjQktGeG5SQis3aXdyS0RaNlJNNG4yd21KR1RNTVNhRFBR?=
 =?utf-8?B?VktWeVBMcWtlS1MreDArQWMvMGRqY0luZmZOc2dncG56Sng2bkhRN3RkMm5j?=
 =?utf-8?B?QUMrOGFsWnJ1Rm9yYmozKzN3VFBPbUFObForQ3JlMjVVRzQ0cElwTjREU2I3?=
 =?utf-8?B?cmdlUzhPeWl1N2V0cyttRVU3bGVyamlJY24raU1tY2dVNzR0a2ozUjRYWXg3?=
 =?utf-8?B?VnBPei9SVTRZY1cvaGFGWFZUUjlscEg3M29WQWozdXU0TEZJeko4TnZxNURa?=
 =?utf-8?B?Q0FybWpKTWNRbklML3A1R1laUVc0ZlpFTC9qN3RhdngveDRZeDMwd2NMeHpT?=
 =?utf-8?B?alAwRlpXWlRWbUlnc0xpRERyMGhsYTJPSk9VcWc3Y1o1TlV0azJndjFCTTVR?=
 =?utf-8?B?SVd1UmFjek9GdDZ1VkMvY3NzcktiQ2h4RTdWdWU4UENXbzFOZHpqZmxGcUQ3?=
 =?utf-8?B?eVFKNHFvK3Y5RWJ4UklxdlY4S0hiSFJ3amM4dkgrejZqZ1pPcmlJZXFmQWJx?=
 =?utf-8?B?M0RmYXRCRS9INnJDOTB0clFLVGRJaFBOTmMyWldiVW9QZ3MrVkx0Zk9jTUVF?=
 =?utf-8?B?VkRhdlZmWThUaU1FdHkzUFhoZ3VnQXpRbjdzV1drRTFXcFlqbGgzWm90eDN2?=
 =?utf-8?B?K0g1Wk84cmNZVmNUV3FNZTNiYVlPMjAzSjMrSGRCOUtSbVhFYTJOQlJVTnV2?=
 =?utf-8?B?VTRyRkN1V25kWnJjbjE3c3RrWmZ1VUt4LzBVNlgrWEhKMHlzczF4dW5mSFgv?=
 =?utf-8?B?MkpoRWtMMHNNaTFWNk1BSWttb1I1Y2lMWFpYdTdPWUZiK2dWSGlaejhzMXN3?=
 =?utf-8?Q?rZKXJ2tR4HM9gKplvYXS3RY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 825679ef-396b-4fa7-e957-08dba2d8eacd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:27:54.2987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzP9i/Tu95FGBocHXpGCuUQ68xJl5fV6y5Pzm+N/d+0qpAR9EThyctsUBVoy6mSm0IFwiRst+0ed3RJuPujG/iJYd2v3PldvcIaLK025j1DIwWA2POOL2orPdC8PhtB2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/15] drm/xe/xe2: Program GuC's MOCS on
 Xe2 and beyond
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 18.08.2023 15:08, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> As with PVC, Xe2 platforms require that the index of an uncached MOCS
> entry be programmed into the GUC_SHIM_CONTROL register.  This will
> likely be needed on future platforms as well.
> 
> Xe2 also extends the size of the MOCS index register field from two bits
> to four bits.  Since these extra bits were unused on PVC, it should be
> safe to just increase the size of the mask.
> 
> Bspec: 60592
> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index fcb747201bc1..ba375fc51a87 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -45,7 +45,7 @@
>  #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
>  
>  #define GUC_SHIM_CONTROL			XE_REG(0xc064)
> -#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(25, 24)
> +#define   GUC_MOCS_INDEX_MASK			REG_GENMASK(27, 24)
>  #define   GUC_SHIM_WC_ENABLE			REG_BIT(21)
>  #define   GUC_ENABLE_MIA_CLOCK_GATING		REG_BIT(15)
>  #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	REG_BIT(10)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2493c5859948..e102637c0695 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -326,7 +326,7 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  		shim_flags |= GUC_DISABLE_SRAM_INIT_TO_ZEROES |
>  				GUC_ENABLE_MIA_CACHING;
>  
> -	if (xe->info.platform == XE_PVC)
> +	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
>  		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
>  
>  	/* Must program this register before loading the ucode with DMA */
> -- 
> 2.40.1
> 
