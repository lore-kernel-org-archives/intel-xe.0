Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB71EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 18:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E4E10E49C;
	Thu,  6 Jul 2023 18:55:20 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185A910E0CA
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688669718; x=1720205718;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=czui6AgXqPOnYrL6ZhcnvsJ4qjuuIbhfpY9Vfg2rPZM=;
 b=OInzF+nbsagA/IcSSJqX5vNUTn0chkbKsU6oqM30TBiFaST21uDXybZ2
 WavsGBZySLVu9AJ3YBFUB8OFWImFOkUXXXwMIMAdoO7ty1OS47xnFzvky
 LQ3XrxmeyrYZ3jZzBP/eVnMXMVsQ3UDA4lNMidacMgH+NiHz58XgbQ2EA
 tHdtyNOyV7Oi70b16YFRyaedQ/A+UULKKg0mHtLj1WZWF4AvVCh10FLR+
 nlcIMuTFb8JvhlsRLRxQnsbYz0/2XFqD+lwn1Fv1hgdXQQgL3ohO8X8LQ
 SnZ1B39UQwdVl7k4fgjMz3SWdYN31pt33GSKQ7CM8TzIjHRMAndQX5WsH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353530671"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="353530671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 11:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="785036486"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="785036486"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jul 2023 11:55:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 11:55:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 11:55:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 11:55:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 11:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVOAMgotkwGIeZ8iqAKtUk+gBoaqyqxgC0de/nX23E9Cwbqx1R2NmKWqMJxGP3URdARKcYJAjdLObo0JH2LemHZ/w/IKGawwc/NZYAhjwmnnremU7YqTET5Dz3O1Qj7QKoJMfLmbIlG+9yS5p+sgpm/ITkij1Iw6V7rgxA83aXnmgbP1U1wcdoacTGT3xc+mvvskxu0ekgrOUrg6Yekkwq2TL7744HFvMUxnJPUz7d50tUAqPYuDoM3/xZ1VNx8Y3Mo5+rlWEgvxxfeIPxZC6ysO4Z2xCCb29lkAMLOqnXxvsWzW+62JKlJwehZBtzNysTDR4cAtItGKGxZFCNRccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Z375eeYUIb2Lg/MXYWnhGUo00mU8GMYLbK7HcT0mMI=;
 b=mjh6yIm/q9EteAN+Ri9Ddf737tFVLI2D0/QfKxxlbobRWBUg2TJ5PDZJ7bdrSGkdhdMcua6H9iM8Yho564TEZNcFUcPPygIbZi6OLfgM8PHv+OFt1Em6joA+CiC0baIQnGL94FzmWMuTzzeCTq6AN1C7Rf6SJ1B6YKYHKJcSEkGZrRrQG0ioRE3zWJEmVoodQtsLH1D6taAYlIJ2XX/k2h/CLlZzvawmna6lVzC+lobxlZ1b1DVj1TNXEZ1j1OZOwNKcDtQEZ8nAn90hOfMJSXM/qrlHeW9b4lxnk0Ct9B/MjuSBfFPo+Xm7OzjizfJ4MjwL2odREK0vDSAZkoYrug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 18:55:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 18:55:13 +0000
Date: Thu, 6 Jul 2023 18:54:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKcN6Xrsnk5Xv6QN@DUT025-TGLU.fm.intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
 <20230706162003.427026-22-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230706162003.427026-22-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN0PR11MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c71058-600c-4de7-c1de-08db7e5287bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYtF5Eof+Ztob23Od1psxmZCW04jH1/fQ9wFnUJOmslA3BhxfiNz/1U6NSX0Z0bjkTYYkVr+POJYZB315WJp3nzHvvfIvvvaXz6199u1SSoApdNjxll5ei/82BTUm8D/rzarMdP2j1OKoKXyED/qByaPswzskAP68rgSrJ64JAU6h6WaMBKrWxzNXNg9LLsgZ+gy2vSJ7jd23hoBgzh2VCGjVXH6piILu/6UwjGO1IexJL3PXbnZaLkKnqDGlXxkGKNO8KNKwmJvPFC3i9ntRuJO3PeYzqlRERFsCfCGsJvkKZvbcPoidDMU1U1/K3QZLfSpq12CsZZpkb8XWZe5WJqtrzPYb2SmknPGBUsGlG4wbDOaY8oOc2UNiITaPiPKaAklnW3vsJxsWKypZcNebFTnh3r8s4n9ixIG2q+yXY2LAP95Z51ETARfLlghcJlt0M9TjHRzSuDYTEzLVhhw0w/L12Muf2jCxACrptO9aZRUS9Wr6mkgBC8AjVZlb7Hmk/l601Vd6Fhf5U/JQCyrtnStgKvJLU9j4ZmcwMMQIiPf2zKtucfiHfmxKY/RwCTJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(41300700001)(107886003)(6512007)(478600001)(38100700002)(86362001)(6486002)(82960400001)(4326008)(6636002)(316002)(83380400001)(66556008)(6666004)(66476007)(66946007)(2906002)(44832011)(6506007)(26005)(186003)(8676002)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OQKSFWcwg23WWKzBPJMZlRCojMMy4lgFp5Iys6CqxatDuap/5N+fecAbQQ?=
 =?iso-8859-1?Q?B9Z3mnzOV9fRZirElFIIrP1KRFErqJOmYd5LBgVwseL6+Y71iPX26+tYdG?=
 =?iso-8859-1?Q?uBRlzYgGleNucnYN65XC5TP4PsjP4SxQziuOE9v00UmPihOnkG+Az9XNUX?=
 =?iso-8859-1?Q?g+w4KzDE5EHFa4G1FH5kKljHVoLjtZTeQ+dN44rFFTIqpX8fIEIY45zYzB?=
 =?iso-8859-1?Q?tsx3fmyq2XFyJz5Kr5S0XFsKJmPIDyaMUzOU/dGdMiU329eEAQfcZ352No?=
 =?iso-8859-1?Q?NWcj+gxChUmin4QKOmhXEuKnXabOxzgft5/19yKUEe937KVaQO2OCwJ+HR?=
 =?iso-8859-1?Q?z7MIAYNDhmnI6vbuUrve/lHxzbp6YWVpinnxuWd0xxfgmMnFzyySOCfL9m?=
 =?iso-8859-1?Q?+P1gWNAJNxeQaWWln3HLauUAoHQ9B95v+aSHphg8audF5vFZaUSiJk6llX?=
 =?iso-8859-1?Q?NKz21T9Sm8bZqUV+r5ZBgMs5vLgBAcuTATIIobg85E7JGiuR/C6QhA37Ho?=
 =?iso-8859-1?Q?gj3PqcGOBf371FRPYpmhs33VvD7R45H5rph7mQqoBai0bhp33ZIyCAcXxI?=
 =?iso-8859-1?Q?oUG2Eqv9zhoXxQkeNsM2Ha2IbLk5vB7XJjhPvsqZzg0M1WGjLOOd6H5HVV?=
 =?iso-8859-1?Q?lGj23G1LQv2lWIIokHBGh8VH5pyY8TSCmlCfgYJh/2CxlCFBEb/oa8EoI0?=
 =?iso-8859-1?Q?OT+QH9xADBQ+Nmbq6QWufTGuYmK2sseoVBKHEsEx59iZSGJLjOgAHByMYB?=
 =?iso-8859-1?Q?cX0Csfjuq+tzmyGSU/HpsiDf9k2CfDeiT2gnycjmxWFQHiqq0VZQdbt/Oy?=
 =?iso-8859-1?Q?Dh1HLWJdMQrRXRDsWdB/OHmnBoCvpRG8tLInEo2E7F9yEwxUIMcIbEGwo5?=
 =?iso-8859-1?Q?CqWKO6AopIJkBAqU5bbTnCSpeX84dxG8bqppdPsiaYF+JrB0SUnK7wyW9/?=
 =?iso-8859-1?Q?C2lVsLXgv0u5Bkdh72EkQ+w6iOrrDqxmgYqbeoWSF/2Buq8BZvlKlLW9R9?=
 =?iso-8859-1?Q?6o3p5MSo+rM2im87TxHZJsbBTN0O732WNTdoWpUBX1zyT6cAC4h+Wc0hKz?=
 =?iso-8859-1?Q?IAOkMH2szxicEL2k2oVL+VEX4kVcPtVcNRWI/X+ekrwBXjMx27Cg5ARIQH?=
 =?iso-8859-1?Q?ndpmYBILMo7D8l+zCtIiPcHR1dLn15g6Mw12CSwdUBuacBQ+D+ocb7YUZE?=
 =?iso-8859-1?Q?1uYkbDJYI5ZpVtv8crrWm/bETffm+CVTt1fjCsGMAYiUym/pSBdG/Te2rR?=
 =?iso-8859-1?Q?h/i/J8mBhofdXq03ZuzwtBfXpcim2GwGnZJeYwJ+y3+OXZBW3oT7Pyy481?=
 =?iso-8859-1?Q?evKrSvgB2pnk7tLKEpLyHYDGhqp2E21pXMbzWvzqCfUNNrysu32UUQx9HA?=
 =?iso-8859-1?Q?19Ea5LZcd7T7stYjSqPDwo2mNJHw5Suyo9Bvy1uhSJ5NjfuEMZFyTWx1jl?=
 =?iso-8859-1?Q?Rf/qWwlU8VrsrW7nsFQZKqv3+AsDhA2hxX7O3eYEDsI6LkgmiigSq+CyR7?=
 =?iso-8859-1?Q?izzm5xq9ap7C0zsQPl14A9QE+aJGyKTMOuqOXFkuNUgiS8hbSfRrayZCP7?=
 =?iso-8859-1?Q?FAW8Y2FzhH/YTYiClJs6MDfaZBlzo+REgHag9Oq0HTRs57tDYU6MLojfNl?=
 =?iso-8859-1?Q?Hs9D9PMgS8T9n2Yqn47i13Wa61qnCds4jtllTzE81kPXwF1Zh7AqgIcA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c71058-600c-4de7-c1de-08db7e5287bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 18:55:13.4679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56u+CsbGEFQEtGEg6cNPnbS5jKkBWjS7MYNpCUfnc+cKmwy1xcmo1wb3IRVq/iNy4BcsMIT+TPQeqVvqjR1OnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5694
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 10/10] drm/xe/tlb: print seqno_recv on
 fence TLB timeout
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

On Thu, Jul 06, 2023 at 05:20:14PM +0100, Matthew Auld wrote:
> To help debugging, sample the current seqno_recv and dump it out if we
> encounter a TLB timeout for the fences path.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 94fa24f360f5..94040a4defb3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -35,8 +35,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  			break;
>  
>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d",
> -			gt->info.id, fence->seqno);
> +		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
> +			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
>  
>  		list_del(&fence->link);
>  		fence->base.error = -ETIME;
> -- 
> 2.41.0
> 
