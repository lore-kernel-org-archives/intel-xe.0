Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45773C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 21:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B60810E81C;
	Tue, 23 Jan 2024 21:06:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F31C10E8E1
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 21:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706043973; x=1737579973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rXgW4zTeUZqhnhMw7jmCBJ04kq3nPUUslmKp5Yn9HF0=;
 b=Kgo50nZ4u6MFd81pGVEAUkhfL9Q6JscBrOecoC8jaNaFYDBQ9qzdI5LA
 LLbg6OqHgJzKx1sVrt7ns2FxWfaEOhQz3pLjRtZKY3JmpFlQ+x/8NLq1Y
 RPEJjxj/hR9pmJ/OMjZRShlJ6oo3MROabEWgkO2yAT8KYuevaFpQfDzAK
 YBTL8rbkUvnT/6v+4Q5H49ZlqhLKF+IFaqK2pvrF3NwNk59nL7mfWDz/A
 zwMTnjGs1tj4s2GeGkWz+vJx3MsLln6bUs1BdkqHlb4EieQNuhcY+E46J
 G6Pvp0+oQOB3Fl28v7mMiIj3oprnzDyklinn2Mpqt2a2cZYoFOufKV/Vw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398808281"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="398808281"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 13:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1746568"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 13:06:12 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:06:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 13:06:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 13:06:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 13:06:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/ZVO4gf3iclB1k7TARMN9kTzWZLciwK8EbnkXwUkmaJa3KbqHxRUI+3W9Ukb56EznoToUO7jJKj7J0sm7A1VJOz8bQTX1bFLqWOi7qr7RjuWK9B8cNig0DQxHFPK2ClqRIlWrmiJAV4SFyOln2BGfIzh7K+tahnBZiLAP4mc/UHhaVCeeEeDQU56UOJhYSz+9H462FTgSJ7d2gZtP0QQcn/Angg+Jb2ABiJvr5bPVwOeZYU0VS/QR2fmBAaMwfSF0kvkLxzrHM5K6MgxvWJrqqhHc++tqJoYDylr+aCPhZU+UOCcCK2MatjKxGIWnSp0ZkH1NnSqg+8qxIOZygEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urA+G1dwW44MBhKdTy1+GX5gNZuXdeASlJz/VJHC8rU=;
 b=UIFekqMQmLg2sz6IWQ1+9Hz9lwfLsxlbvLL9MoxdOXasmVYl1r7Ak6tOjLObCl+e56V0chIbN9Og+Y4dljzLy7Cp9r/N0+iGNCNLkfJzde4+tPAXLuZZh54iPMxHYZnTEYai5HsbC0W/LA9u4qZG9BAuv/86moaVlINWKFL2+LViGJjkRM4Ie/eavyauJVP34dRp06Chi3duw4zzjpjj4eTxV4jMDm+JTXshqBZU9qafENFAO6glrf4/VBGs1GJCrTtYmDFGl8K1RA456oNYZy4NLIFE1V4d2Az8xYQ5oIGScp12G3zSmwteH56RkIrjxA1Z0OEhEj1IDyHFbs3aLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 21:06:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 21:06:09 +0000
Date: Tue, 23 Jan 2024 21:05:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Use LRC prefix rather than CTX prefix in lrc
 desc defines
Message-ID: <ZbAqBYW4zhbi4/fW@DUT025-TGLU.fm.intel.com>
References: <20240123185530.1595588-1-matthew.brost@intel.com>
 <laifryu47rwkwhhjddhmvfp77n7idxnbhb7jih53bst2y3imax@laru5h2zphzb>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <laifryu47rwkwhhjddhmvfp77n7idxnbhb7jih53bst2y3imax@laru5h2zphzb>
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 56133b83-ba07-48c6-593e-08dc1c571f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TEyBphcfOcm0Cb15OvzoA8Zu7+RAPLHQCL373hpWgCB7YcAGzRwuVsLpiVWaWCfaYzMM2Qc2tqHHLENMbo11NMHHWqoI5C+yV2OkXIj17lFA+9DsVuN1W+4Lg0tCXDKD6BK9oK9MKfpX7NUkF4FIoEqAcd5BffOvrllUehtI1tHDsN45H1n96/T14catxzftmVAikJLpHlOAlHiNzZE8XvooKTTLQAqlBuT3zmeKEuguL0JCKo4AmC4ULSFTtz2xuLwaxNMvZJSIp5QaKzGOCFR9aUjDTq8uxAoL5XzKZ9uLIe8sQhZj7A8AD1/6WNsXD6WZ3EB10MVxfMkASVnbKyR6+nvWOoB3aMYBBwrc6kiW+VABf+X1JGRrJWRY0QWQa/95XeBOGE7vx8yeAwCJFijsoqzXwMuxuEl812CoCopeVizlSMWVDj2Uq4D8t+jNtddtuV34+X1owWznIbUpSLz/reveUhlNwcoI/teRo3T+lYe1d1Hm2OqSTgkKNIkQAqsEgcoD9+oHRnvth4nAjg/4bi7XfNR9C3VCxFEG6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(5660300002)(44832011)(316002)(6636002)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(966005)(6862004)(6486002)(478600001)(38100700002)(82960400001)(86362001)(26005)(6512007)(83380400001)(41300700001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4avB89EJYF5ychWhqwLOkzSoQNn6LEYPXWRVXICutOvYE61t63wK4WbiZ0?=
 =?iso-8859-1?Q?XxQx/xkcEqUv9VEJ7LNW7EorLV6SS5j2BvmPyDypDcCzA+mMsKqhlZZoqF?=
 =?iso-8859-1?Q?mzUHgsOR1+R+HyAQDJ5CsHF0bQ14VJNxCKNT3DNcMfO3SFAJLLq9sxlxba?=
 =?iso-8859-1?Q?BhoV1o2NqtqSXukbpHesr2jWi7N3DB44zCtV5M+G+a8WgsFlq1yv8I0A8R?=
 =?iso-8859-1?Q?AeIzAIXIRWlL7Ci7QD72itw5jHIP0npKFDsI3IUxBFZHt/iIauKH2KHuGW?=
 =?iso-8859-1?Q?+1FIp4w2x1SprUX0MQgxc0Z6a04l9VQ+44mMtr/aEIF5BPpkgEdX3TBzWp?=
 =?iso-8859-1?Q?1T8+o7+Dk8KiVrAmY5GAP00fm3MgkTB44oeOgAc/7A9rIASlT1tR3dblqH?=
 =?iso-8859-1?Q?Ky1GpqFyh7BeYfIEj/7eylYNP0CCsPRc8nEGmkehEG1vMDnAWQNiqlTwft?=
 =?iso-8859-1?Q?99RiMXx4nHO+QV9FzQhtlKa5O+rk/aT4/KQjf8AgS7Uid+y6j+QfwAOn4p?=
 =?iso-8859-1?Q?xb/NyNwRXJs4WOXPEunJV5Bj6xjSpfCNRDAqv96xPeZW+P9+GOuOe/sp9A?=
 =?iso-8859-1?Q?Ih56FrUnOP4zLEktFlblb3h5ki67cXqRsK9UdopIR1Ub5iQmjtX1Gp6kwS?=
 =?iso-8859-1?Q?fG8mCmQOqdOyKyb2jzNneFJf20gwGR2+sKmLqUcLITgPwRFFJ5JT4FCR4d?=
 =?iso-8859-1?Q?e6gTTPg9UR46+i7BMB8et2UXLYTnsLueeUy18Uv79vVQZ2X3WEEQFl1QIz?=
 =?iso-8859-1?Q?WVfdnU2dkTgMzi9jNXT+LOtMDmenlUeuOdz4QfK2Uz9MctSlaLRVg+VxIX?=
 =?iso-8859-1?Q?pSI7V+Pp9ejZRzaiuSW/S69D7aVdIezUDzumYS6dwSJU2IeGUtY6SqOi5U?=
 =?iso-8859-1?Q?U9quXRbJu2EBscdqTuqeatJdTVuvRYArM1zBBamYSbmve0yfByxVbKm39n?=
 =?iso-8859-1?Q?7ZKTn8c9KYsm2yYCa6t3oUd8VBUaKW2HCCQvEKoYGj6Jq4yufN7VT4mope?=
 =?iso-8859-1?Q?KWmFpnteVeLBUvJV40TGZS1tCYHGCW3jC4vmJyDNi62J9P5vInQe8AdEca?=
 =?iso-8859-1?Q?itO7zC71Z4l02tgdbDJGuR4OaR1AA3o2vaaXnHPVjyo/fWyfqrDltPQ0w4?=
 =?iso-8859-1?Q?A6SX3x6Yv8rCSF6cV7HA9M0jflTHLMxGa4/aEGJ+EWGbZrF7pOGYU5gS3s?=
 =?iso-8859-1?Q?UzH0TqOM30AFfrCqiSyIiIdP1pJLXrcIauacNoNu0FBJlpD/o9rcA24LI9?=
 =?iso-8859-1?Q?whCCOxO+n7DWmsVCrKzPPHVWX/8aEdtlpFnCDeP1MgztSy6967AFU7XxgL?=
 =?iso-8859-1?Q?1OZWz4MB4Nw0zsNfBOPH0lkYgu0BktRcULVWCWTpX6kDxlkPkil3BMIkUu?=
 =?iso-8859-1?Q?8woegXERkPobh7i3VYF6XOF6iNBldSGHTUpKZxhHRls4I12TN1Vui00fXI?=
 =?iso-8859-1?Q?cbb/eZxulgNAvh3kNpvEn5Mz3V3YTulY3z6f2d2m13Xh8o2trTUt8goMT7?=
 =?iso-8859-1?Q?uPa+EgrIxnOoVAmn8z4WLZwSwzFXIVLXrjcS1oJk5E8JQL/knBd4euY/vQ?=
 =?iso-8859-1?Q?VRiHLXLEY2bTpVtpEJ51/TjsF4L/ooyM3vvs7Mfg/8TQZhnRqkL85HFvMI?=
 =?iso-8859-1?Q?8fZfCEC4XQhQrml1LI94vZthw16gAh1gobNlX8bv/IuvU6R0p8cXuDoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56133b83-ba07-48c6-593e-08dc1c571f36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 21:06:09.2678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pgeD0w+jj/fzh4tFll1GOP6nx2Mk9BS7MGS5hLhEhJZ1OdAsg1BE/xji8TNzqBENCIJ275RFiY6PyIm/dnR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

On Tue, Jan 23, 2024 at 01:56:28PM -0600, Lucas De Marchi wrote:
> On Tue, Jan 23, 2024 at 10:55:30AM -0800, Matthew Brost wrote:
> > The sparc build fails [1] due to CTX_VALID being redefined. Fix this by
> > using a better naming convention of LRC_VALID as this define is used in
> > setting bits in the lrc descriptor. To be uniform, change other define
> > with LRC prefix too.
> > 
> > [1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112267/
> 
> how reliable/stable is that link to be in the commit message? maybe
> better to point to the email @ lore.kernel.org?
> 
> > 
> > Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_lrc.c | 12 ++++++------
> > 1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index f17e9785355e..c005e56847a1 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -23,9 +23,9 @@
> > #include "xe_sriov.h"
> > #include "xe_vm.h"
> > 
> > -#define CTX_VALID				(1 << 0)
> > -#define CTX_PRIVILEGE				(1 << 8)
> > -#define CTX_ADDRESSING_MODE_SHIFT		3
> > +#define LRC_VALID				(1 << 0)
> > +#define LRC_PRIVILEGE				(1 << 8)
> > +#define LRC_ADDRESSING_MODE_SHIFT		3
> > #define LEGACY_64B_CONTEXT			3
> 
> maybe this should also have the prefix (even if it didn't have it
> before)?
> 

Good idea. Will respin the patch.

Matt

> Lucas De Marchi
> 
> > 
> > #define ENGINE_CLASS_SHIFT			61
> > @@ -786,15 +786,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
> > 				     q->usm.acc_trigger);
> > 
> > -	lrc->desc = CTX_VALID;
> > -	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
> > +	lrc->desc = LRC_VALID;
> > +	lrc->desc |= LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
> > 	/* TODO: Priority */
> > 
> > 	/* While this appears to have something about privileged batches or
> > 	 * some such, it really just means PPGTT mode.
> > 	 */
> > 	if (vm)
> > -		lrc->desc |= CTX_PRIVILEGE;
> > +		lrc->desc |= LRC_PRIVILEGE;
> > 
> > 	if (GRAPHICS_VERx100(xe) < 1250) {
> > 		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
> > -- 
> > 2.34.1
> > 
