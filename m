Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B497F606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k6mLP39L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A01910E470;
	Tue, 27 Oct 2026 19:15:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A3510E477
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793128522; x=1824664522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Ow+KangcQ3SuCIKIwwooouI8Z9yPFzhi5FgDaXwIao=;
 b=k6mLP39LSaGtEE5jsPJ82I+Q8ajN/qJkROxsPWOB+L8LxVFZO4y7SULC
 izD2GO4nAB9nEUYbhQEaRd5WAu9Zdyfvbpz9OBSijyNfnZZw75Isaq1d0
 olJp3SzAls4sXt9gAYwVEWc4gzyanINZKRSI5uyOxfNFz99+g7pKkxbEC
 9omoeemAZ5s4yfiCLa4zQlW9FA/xSZmiiymx0IR0fl1EZwpmxtIvtEqe4
 h3KxAWnHq6XclIC7X29UtluCHcrDkGuFebacAaMQuUNt6mPNAX62DIROn
 TRB1qLDCQPn5YR0jx1oF+kYAB8skqEu2aXMruA9PS2VsZblVr9yWB5fGI Q==;
X-CSE-ConnectionGUID: 3EwDCjGtSp28MkCKJfCMiA==
X-CSE-MsgGUID: g8QtmOy/RQOsjf1Qdla+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1849393"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1849393"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:15:21 -0700
X-CSE-ConnectionGUID: zNHHe/LARgatB2wFi4svnw==
X-CSE-MsgGUID: OXkq5YscQp6Bj2Ogm3HKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4524037"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:15:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:15:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:15:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:15:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O72iZUuqTEX3FchFCXTWi9r3JqFNRzH/gjdvaoBKBJrsrc864eydFg1hI9V+sHoknzrSg5VZXQ+jpyqt4vjiVqVKSG7sIZ9TokrHw16/yWsDxZGCAO7s3lW/UsxZ0Ikfpy+eu9zgg7cTz9JoGTHvKakqH8V0pd44Pu0ujRB/LjiE/afSfMZrWhkpfpqI1QxgzIh7Jue6AGJpayJ24RNCIpdUVLRHx1cvpBA052/1t2tTIE9yjrBCnmHBRrY0f/nanM7+guv+aaocMtFbScqaQw8VVhsPaYz405tgKBFXno/4w9EHApjHT+F0AypYeMLbzkh5Do4vjAd5NzDLCZJeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CWvSanCfFfTB3Q/L+vKY6ZxrbWn6v9BWjG5US5ISew=;
 b=TbrdAokZmzu38ocTIe6vtYRsh+edzwCozP+Kfmx5cS+hFlIq+H3Qmy54gTjOIC0zLo9aWgc53HYoXz6tvHByWA5pCCZFSRwq/vFxbRP3khAnjOrrzZ8V7Bc04Zor5pNzSo/jsBRfhEjfQROiNuPG+Hwsjt/YRbllBeEQH0k5+Eu3KPVa7jYk/ro8K6A/RRKIvVHqzINg1HWF660qDN3Q5k4aWnVOuEFDUWUKfk+u+yM4WIN6CxlFUQ8nukmFwpRTjjluVz1SIu2arJLWkG7g6qqYtf9N4R+liEzGnUCaS8s1ZpFuXbjkVOKgl7rnbEPhI6OLiyDx0grFUr0ZsxRABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SAWPR11MB9569.namprd11.prod.outlook.com
 (2603:10b6:806:4e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:15:17 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:15:17 +0000
Date: Tue, 27 Oct 2026 12:15:11 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/10] drm/xe: Bail from adjust_idledly() if in VF mode
Message-ID: <20261027191511.GA203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-1-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-1-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SAWPR11MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d30240-5017-4960-f779-08df345ea2b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|23010399003|4143699003|11063799006|56012099006|260925021911599003|261021121427099003|261009223027099003|261021123027099003|260925021311599003|260925022911599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: C6EO5QaBdYw0HNyrAaKIvDaRRZMoLxjLFFOq2pkhn8MsUWna7UD5aidq5dnPryewDyODlqKyZKSCmQw+xCtHqyuNbQESS1MNeDSGXyIWjQf+2kSfitSPgtHV43ZgZO8jG/PVDI0ajxBLwIlnEJ7mLrr1hD+OhID7h0/RhWqjJdjg/7mVbFPaSsHyKyAWv3YdY8orJDR62mwNG2GL7G4nkqffwt3T7/nouWil61ceHurOBvy2OiQ1QeflNmJTdN68JUDUCHboQW1ta8pP1DIVnUN9/+IKQTKTNW7efO4QwpO/5elDxZgjN4E4qiZl80qCAv7ZKwVMsYTmPDb4bIKmiyOooEaPf3DVnFBalc4x6/+flhfMo/MguqVqKmBZXxTMHk/kPjlPkE4j5kikhuACW5zt6GcJHuQNenceHHxF9gGavQRgstSzvsmp2ClWgAjXXaCe4HEzhDL3d+fyeyJkinM3EklHwUY7a77Y6HXldH2xe8rDDgSo8qBCY3+xRHdrmlX/oF8B3dz2unMy+xI1X3MEDhT770rLpIx7xjjvKrM35s5caFkAlZs7pGyRejgGoegQrECfQDQ2qGFs7WAgoUMhl6Qwg//Ylb6EIkh8ajgyyQHztVPESwlN0QVtbtP4oTgFeYQTT0xO7waDHLxeP9dvO00Wjvc4L+NJunM+oEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(260925021911599003)(261021121427099003)(261009223027099003)(261021123027099003)(260925021311599003)(260925022911599003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14gqi3Eta4VfxrzII1/gHS01hrAGQ7YPGX0U3phOJiFgmuajBIUEZ4LWFWz3?=
 =?us-ascii?Q?o3a1SmHk564+kXA8T0WpdCbE4rPiKZHAh27L2m2gRgJzEHLrMJJiR0TkBPqv?=
 =?us-ascii?Q?ZGTW8xHt1nGNiCrXtAVeUsvhWHVHUoxuZ01lGsz+0XiFjFomslZbdTAJ8GI0?=
 =?us-ascii?Q?efGsG1K2ugmc4/j14zR3E8KtN6qvFeYEWhrjM3/0srd+5MGk/QVmhePXxfyN?=
 =?us-ascii?Q?wAA6A2wsLFHqpyoAj4VignFpynn3+PmG2M3KvUd56phVL8x6qg9x8eldhJAD?=
 =?us-ascii?Q?jWVh3ke2wxWCQHTuz9vP4FQecr4CCLA8CrOvR8XEuPrfXvCe9yuFzBkM5Vee?=
 =?us-ascii?Q?xovMES1WKGto8bG6OmOdMB3pSNx1hSQEGgOjB6EvpkIuvIwKiADW+c35zkm1?=
 =?us-ascii?Q?gbhhrbyzegDNSw1WH2+vwLzHgCnwDuMmnYlgxD5vS5+z8vgby6+15XSvBewz?=
 =?us-ascii?Q?ObnnhWnXmD4pd3rSwiMVkz5MObI7FrlpOZf5rpVlMThEhc43/qL1tyVGXwKI?=
 =?us-ascii?Q?FjWKWoEKwTOZLGbc9hLtOrNC4N6LDdsNdvHvpPdKSqLXFg10I/7ACz25LryW?=
 =?us-ascii?Q?IEvkuJws6+scVuQN1jSjITSDL2dbqzTbElxgTdWZaDvR88Hzb6UBSxeOdcnI?=
 =?us-ascii?Q?NUo6HtHQp9I5SzX8PPSuuouMkUn1nxb9AcVJYithxGpbeXV9TBkiuZiORXG8?=
 =?us-ascii?Q?iLmVwMSJi2y3oQEoAXJhKQWIHjF1GBUIBbqVZYcCaQxknTAk0c4ftLvImEOl?=
 =?us-ascii?Q?Xs6PGF1eAcRmQKdgzCBQcQDH17bJ+umer+aif+hGdwlR4gEhYAXtff4jzIDc?=
 =?us-ascii?Q?/cfEpw/rXT//nZlqS0S1DxnCBs7U3wTHHZp3MiIYmyXO1+CSyPJwNfTw4XCe?=
 =?us-ascii?Q?zkLe3bHfmseoW9PnPEDYK2PewzFegvkzJQCIpHu+C8O8k+nRoODnVpftChS0?=
 =?us-ascii?Q?+nIFnGsFdJaRqKdQQvXnGOGGImXKf15VbUwYvSV5tO1K8d7RX0ctxMaIn3Zu?=
 =?us-ascii?Q?PbtOA37TpAbztuknGIXJ5E1aaqaVEDdcaY4s6W8dsKp3YmVfhkkhsna/yyCh?=
 =?us-ascii?Q?nTw8VQb384tTFwLXAdg9f+fUVsRPQglz9Gbb82+1pnOy9f1gLCOR+eajuhNW?=
 =?us-ascii?Q?aI8kCK8aJFox5V6wGoFqu40T6VOqLUOXRYUThEvOc8Xo9pMKfovcNEXeBo3h?=
 =?us-ascii?Q?QyZiUYiSZWHUG/zGxnEyuh3Ob0tlq0gPuDJT+kbxYtphvO1VuRHZS0nSYZAR?=
 =?us-ascii?Q?amOkvjMG+ecpYXPTM6tw1wTpuY7cRzcXilM7Fp/xsts7RJteGTsRjIQ9aDT8?=
 =?us-ascii?Q?jyo+PqnSPiEC4LRNqQpeX+e2iFoTpz0eslx3TMHh/l05cWGoguwOVhWJka7S?=
 =?us-ascii?Q?XXHb+025T72V9oKo/CUeHEGewUOEUPOOW7B2XEtl9Vfmjc5ZKjZrRUaCr6q3?=
 =?us-ascii?Q?hw9RjSRlMebJuNF4+QmTuFJgOljnrvsLipThz5G+MfiyesDymJNwORWEJlKQ?=
 =?us-ascii?Q?wydyWbbBLr0prHnqrPeNagd6fjhBc17jSCY69k5uBKR+wHwUKA1TjmitpHzJ?=
 =?us-ascii?Q?Y/8uu7jbRCqxdd3HL2PUIkRWLTflRgS/MrnX7XfrN0KhEDdTD8a+b4q7yonw?=
 =?us-ascii?Q?Zin/ZzKBX7NAzjrwlaUenvFq2s23GyNrVXbEpSTbu/H2pr6j14pIH4aojgwy?=
 =?us-ascii?Q?Sq5TmFw161KfFgeemi/QSTUlYaR3XUyJm6OwehJe/RxlEMUAMz++39dMAiXS?=
 =?us-ascii?Q?1s8qHIVb4m1S2gBpfVHLppX6qHqN/K14cNvvHz0dxXDJkUBWx7xl+EyykXFy?=
X-MS-Exchange-AntiSpam-MessageData-1: 07p16t2Xcrfjf30JwEtRFELmbmCZMthnXs4=
X-Exchange-RoutingPolicyChecked: qd8bw11w6Y2Mp2ibIe1JV2vFZr4iDQUvy22BpcuJCyWFcuYuz/cm71GXmM5Pa+vhJOoOr+4RxFsTIzDNZElGZ5r+EAWcBOYzi8Is6HgHZ9ddiJdFmbJ3/czAYsj7yntTW1pzgTvFX7SLNjQxrDTOqc/sAFiIFpCFe+UwCVt0DoQ00LeF3OIMLQ3z1qCLomgni+WA9tvvwFd0DWTB9zy32KHE7k5HF96RZ0HmfjxbG5gHJfhRipA5HQu8LnLVZm1A58On830N6pR9u/SVHlKDEORwIllE/pEJ9HMMna3ZYdgLGIwpls8AfnCqekKTdtPQUZOxviwGiIfRHf3XL277bQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d30240-5017-4960-f779-08df345ea2b7
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:15:17.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/g48Bg8d+dpSPDZDEuJ4IxBCwMqosBnNIifZ3vED2rPDUOhat8zHZozd205wBHUK5kTriiz+zfVedCfliQSEdEm5JblGqJyrwhPvwvkpl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9569
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:29PM -0300, Gustavo Sousa wrote:
> Both Wa_14025941587 and Wa_16023105232 apply adjustments to
> RING_IDLEDLY and take different approaches to avoid SRIOV VF mode.
> 
> Let's converge them into a consistent approach.  Since
> adjust_idledly() should avoid SRIOV VF irrespective of what
> workarounds are enabled, choose to add an early return in that
> function instead of having each related workaround add
> FUNC(xe_rtp_match_not_sriov_vf) to their rules.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 6 ++++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 55ee0c892c1e..50e8c5103bdc 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -611,8 +611,10 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
>  	bool wa_applied = false;
>  	bool clamped_below_maxcnt = false;
>  
> -	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
> -	    XE_GT_WA(gt, 14025941587)) {
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
> +	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
>  		u32 mincnt_idledly_ns = 5000;
>  
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f35181fc4e49..6a1d5250ba1b 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,6 +73,6 @@
>  16029897822	MEDIA_VERSION(3500)
>  		GRAPHICS_VERSION(3510)
>  14027054324	GRAPHICS_VERSION(3511)
> -14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> -		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
> +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
> +		MEDIA_VERSION_RANGE(1301, 3503)
>  16030224309	GRAPHICS_VERSION(3510)
> 
> -- 
> 2.56.0
> 
