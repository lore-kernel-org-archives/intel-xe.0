Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE0CC6B0F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 14:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB4010E817;
	Tue, 13 Oct 2026 14:03:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7196010E85F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791900185; x=1823436185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dcmR/1pNO2fAlnDON6+PJ7l7Fju5g/MYsf1kjBXeIsA=;
 b=VFRYZnpbal03WDnJ+M7M2wOK7lpNKHSDnsWAy+fL5Zljn/7f9CLh7o2V
 1skI8hOAH7Gc2yfFI5AnQTUUWLZF/VHq2x3+dgco+xosiXlsgD3roUH1M
 QfkdpdhjoqGFbC6uGj8UZ/EVVsWo9qF/T4wpHftG7IrQxmra8us+FYadG
 Fkk70QIzWtPaMJ3eH/S23dT1cx2Aq4EL/gRtmkFx3K2H0D5Uvr9DWtNU0
 TcwWL9wJJQtXg5srqDV8Hg8wjYvmUEmIvjDhGqCsvWR9RWAWvETKom56U
 OH1ykpeWokLHz5krLo1wB//tRCGAKQQCgGYobpNsXKHsWSWLc7VIYm21t g==;
X-CSE-ConnectionGUID: IqOuZro0RPSK+rz/rAclTQ==
X-CSE-MsgGUID: hDhSIKFgQ8uQeFF+OXLVIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="527462"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="527462"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:03:04 -0700
X-CSE-ConnectionGUID: CWRS1vYpRMSuln1FxfX+hQ==
X-CSE-MsgGUID: hwQRxvBAT7uFwD+FG6Fe2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2941332"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 07:03:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:03:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 07:03:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 07:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LI1rUch9XyJITqYP2D5HhXGm29moxweknI5m2qU8fB9nJ7ikthlPDyqvkhIWRPOn0tt0Y3y1F71wcLNvitPElOp6isUBWqDsLeF8NGMUY/GhqGtnR0/8bhl4BxOSyzgMprWfd1/wLsZFHjxCzTIT1mpcDnOzsa+Tv736ePpBTytFaoTne1FqNcUY/HDJOulY7/H94da9YPMuclpeY1PQAcWuRGi3Vp5ymjGyptGY6NIUKNt3QmPaTPrqhMyhusswYBzn2xQsvXWzHAQ+/iN1tYcZ/gu3AlDIU5GqJu2Intid5uZaUByyzBW+tq8hTKQMIQLKElwUQn1JmRi+Q0sJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D817OQwXYWZ2CprPwHUH/ARAL/1B8ajglLTszlZ9HvU=;
 b=pQgxGp5rYpQC4zcuSpUY0S2YSUHBwlKWvXRUWGP+GyoSuEg6kaNZ0kC6jYuQXQF4cW1frIwr3ZPg5LQemEr1iS3Wdalg4kXuXOlIYb0R8+hKuesI5oV8teCv7nkDLqlUH3+80cQV9iBSFnZm0lR3GE6/9vZxlij/RnWmrLAMkNgVV0G/fFbxjsou1yGUmz0Cs1WhwoAJy7Zg8wirgvzTDJWIefYpixFnJft59Gy9+XA6PPmQDUezqB+6ai3sX/LwZzIDzWDiUXZ2V8u58J8HRha5NO1/FRiTCfA5SqHxCqAkqHNbcZIoeHOX20/rDumu+HUhEzj2X9ifRH/p0PuawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 14:02:57 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 14:02:57 +0000
Date: Tue, 13 Oct 2026 10:02:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: "Kumar, Sachin" <sachin.kumar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <Kumar@freedesktop.org>
Subject: Re: [PATCH] drm/xe/uc: Add missing HuC firmware entry for Alderlake-N
Message-ID: <as46BD7nRhDPLqGq@intel.com>
References: <20261005081549.1594153-1-sachin.kumar@intel.com>
 <40510a3f-1800-48bc-85e6-00b3e1aec932@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <40510a3f-1800-48bc-85e6-00b3e1aec932@intel.com>
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a39591-8cb6-4376-c324-08df2932aecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: A3cj5RSgwJbs+t8qHidDB/70zRGMi0AEuoc9Z5InUctaUXgjUsTGMM2R34kyCBn30+0EPF9zt4AO0aE033JPorXIp6B0QVu91dJQICB3giMn+dLQ2aGMpXxXYiXie4fhM+A/Lb/VLtIgtjbSaLUd2ruRVkUvnGiy/f1b2X6ZK0hG4Qanz/5cMy6nJHspvDDkZ5DUNPfi/WS7V265GpVvqphr6IV9Nju7NyNM5jvpMBXxv9OEWB4WDfUX9QW19rngQZiNXePreje5yveNbZAtFCwrYH/QKiWBjNTcBeJwJs1/lk+b0R5mHqVyiXWaZk4fngzAYjkqhx5+7mtM14pWjoHxjGEwQ5Mab/fMcdpnfbbpGzupXrQu2yj3oPNJyVpWYqePNBHXc34M9yftv3xvIIGrZwZ2ZImOq3Ye5weCeuk84ukqE6dDzPONc7L+GDQMWwzUkF/qfYOADoB3sBdZsYwMotyCkHskMd5yYT7oSfHsUeTmscMR3IBVQZd6c8J0o9GJnTwBh9fGy6gG0dqWmzTbjWUg7SFg3bRKKZgBPtE8tFoj8/z8XMY4sOGk2MQzwiJ61PFThDpmYrr7k6lT073MdbFOS0hxkUnBDWmC0p8i5DEX3rGVScO9QyvlhSXn2H6/uFO/K2BapJ5sMT+6hazUnfiMv+pstQB4N5fZOkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZCMDGbBv7J8PJWaKODljBlfGmZ6ckNU7roFOpBzToL6L7dO68kmsApFZ6P2d?=
 =?us-ascii?Q?fEV2OP0yEFwiJjWmmZVtIInmXxdZym8cDmG61QLkWj5y5se9X+M9RRCJ9P3D?=
 =?us-ascii?Q?3278xBZj674prrdKqObHB9Pq4vgOy/HvNWdr8LJyAERnhdWLfKpatw06hvg9?=
 =?us-ascii?Q?M1ezctXUuAnu3FPPxG71M+09LdojcXM8BLty6uFpa+L9IG+5MFC9zdVwNqb/?=
 =?us-ascii?Q?3eu4wrqOoqSuVw2MzGWIfCAqheibdjP5LvumHBE735kaQ2fDlHTc25nhyXp/?=
 =?us-ascii?Q?ucIDGy+ZHprmdUm9/AN8kVNCvLWNYs7cZEQVKPXQ2dMZcyX/0BcJ62aZl8Ly?=
 =?us-ascii?Q?LF2MTnK1yEz8b/EpLNCkeBUirbhobo+2sIQVbLjuJN2GmD+EnMI9KwsF+1QO?=
 =?us-ascii?Q?JwcBOpah4LTQouS3GEkfIKimAul3NvG5/ZtQ8T2hIIWVd/EtL/x6IUp1uLBk?=
 =?us-ascii?Q?vIZfoMLfbE4vB3hzwzmddg0oax9fV7fmZniB9y8hFZea5l3V+EfrIn+d51CS?=
 =?us-ascii?Q?TBubgSJfVVg2C1k2ES9Zvl8qwzK99HsW9m/kYnd1/1ywrrNaiKX6QrUYeb2g?=
 =?us-ascii?Q?/776kfsXzWUTcCpbgguLckVQ9FUqIR6lQ0txooaOhnQ3S2hYbW94++TQTFC2?=
 =?us-ascii?Q?Ii3ZhzcGAEfEvbqUjl8WO/bkIPZNQpLPvIA76JIpviYh6Qv5Y1ffI3MyFv7b?=
 =?us-ascii?Q?4AQRIW03j1/HlqfLHPPWu/zr6yWM43ZbHUQLJMyrO5gUKitFca5XhSUEn86G?=
 =?us-ascii?Q?W0RR3uSV9NfKcdDRBAOr3F8LVCYuxOv5xji24tW8kYdU44WnSThkOpCm2ID6?=
 =?us-ascii?Q?Rgi6V1AQouYjZEAlU9gpDQ2MpNOlobyF48mjhahG0jQwqDgCWFLHj+3hrGNC?=
 =?us-ascii?Q?+nFfKA9Kfqy8PA4dzSrfXtPRWfVkTa7Zf3rx5kRjixF3wLuUmDNM/7hwR4CE?=
 =?us-ascii?Q?09oJv08Hiy0tJJgUPeRppq8g1kkG+QjzHM5Y/vGCHofHXKx8SHGVW8wSSmMB?=
 =?us-ascii?Q?KykJFBYUqdwmfm8qLnj8jXeq8FdHoJtrFHky5GWMnEfnzz1zjUJ36MgWyifs?=
 =?us-ascii?Q?chfmImmz/1FnBpS1rcfWO4f63Z6gjmo+9ovqyqY5NSvMISj3yBO51c/C3YyH?=
 =?us-ascii?Q?eJ881OmcFXKUoSH10h3t43XB0qvkZ/f+GKLHQQItWUpTswebFM2XVvtj69fp?=
 =?us-ascii?Q?Bb1KBuxBwJd3YSX9B7OfmS6DtQDg40GgWqnSpe3mkoGVyumOc5enOxrQzMar?=
 =?us-ascii?Q?Lt78rDlw8k3ZurKKF1tAdm94y56/S5wbqIeBRuqV6r7IN6ygImTQ8haAdaoE?=
 =?us-ascii?Q?4wWiAY8APB13nekLwR7GVBwV1gwdAl6gHrGcVke/jAdD/pGW1FuVLJfFepXl?=
 =?us-ascii?Q?6idOE29uuwDJycz7C5E5+0dJ+w8j19TEK4D650KtI5Olc1m7vqUQvmr8eqvA?=
 =?us-ascii?Q?PSd9bAQHzCni2Z7GYe/e8g/WR7OTQUpuGg4hriPZJ0zhIf1m+C3o/9zBcmv9?=
 =?us-ascii?Q?QWDl0sQHB5DWEVs4NCY3jQOFzJ2AVTd8XS9Zhjn0woFshLavh53CLj5Afx6j?=
 =?us-ascii?Q?sSrEgqBUxagjKQPNm3VmrAK0txdgnvT6SrgxP45fanVS41zbTPwrp98NbFWY?=
 =?us-ascii?Q?6FlzQF/4OtjQqUu2H9+xXBuJ5olddjrc8R0V5FJqv7RpXhUMEb4Jg0tByR41?=
 =?us-ascii?Q?FF2LKuIr6K2fJcWmETv8fIab7Bm+X9tMtzXe6Y3DoU9OXv/JTjnfV6T/Feoe?=
 =?us-ascii?Q?NdxvtUYT+LpRHLPfMfCCryFt1TmhNTk=3D?=
X-Exchange-RoutingPolicyChecked: km/yVcehFZVbw54+jFKSLRkt3FhBZ5AN5JKUICx69loAm8jc1E6SP93NrDYgWFmKycDqfw46vxEGtI1y/aoYBnSzOWSfuwDEyGM0YMV9lS//OGnzpurC8uP1Vkxv7CQpw6C1QJDYpcyLdcK9kkfSi1LzA+rot9PSpXCMs/vdY5zes6Mf9h2Oehtzjr8HAn70fqeOnRZH1UnFJMPlhQONxRuINIL3lvTto3helFFC2oAm9f4/KrhehOJ+tMoYk8kV5FFnB1FyelBYgeSbqOnMAe73peHtJNWAGTYi3QTcxooSVoqV5bfhfuVJZIw53pkrN4tCeYDdjnr3fvRJklhxwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a39591-8cb6-4376-c324-08df2932aecb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:02:57.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBUpCRG0atw3Ec1cTsLmdagzK0YxoZ85qOuK1hEt7NyH0YDH/wbcR4XX6hjUkGKsOfgSPmil3YyFIOIXhB0/Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
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

On Fri, Oct 09, 2026 at 11:26:00AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 10/5/2026 1:15 AM, Kumar, Sachin wrote:
> > ALDERLAKE_N is listed in XE_GUC_FIRMWARE_DEFS but was missing from
> > XE_HUC_FIRMWARE_DEFS, so uc_fw_auto_select() never finds a HuC blob
> > for this platform. xe_huc_init() then silently treats HuC as
> > XE_UC_FIRMWARE_NOT_SUPPORTED and returns early with no log output,
> > so the gap is invisible in dmesg.
> > 
> > Media encode that depend on HuC (e.g. VP9 VDEnc BRC/header
> > probability update) assume HuC is available and still program
> > HuC-dependent HCP/VDEnc commands for the VDBOX engine. With HuC
> > firmware never loaded/authenticated, the first such command stalls
> > the only VCS engine on this single-VDBOX GT1 part, which shows up as:
> > 
> > xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT error: class=vcs ...
> > xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: GuC engine reset request failed
> 
> I noticed that we don't expose whether the HuC is loaded via the query ioctl
> for UMD to check like we did in i915. However, AFAIK there is also a way to
> check if the HuC is loaded or not from within the batch, so maybe that's
> missing from the UMD side? Might be worth asking.

good question...

> 
> > 
> > reproducing on every run, on the very first VP9 keyframe, at both
> > 1080p and 4K. H264 encode is unaffected since this driver's AVC VDEnc
> > path does not depend on HuC. ADL-P/ADL-S/RKL/TGL are unaffected since
> > they already have a HuC table entry.
> > 
> > Note i915 never hit this: i915 has no distinct ALDERLAKE_N platform
> > at the GT/firmware level (ADL-N is only a display subplatform of
> > ALDERLAKE_P there), so it inherits TIGERLAKE's HuC blob automatically.
> > xe gives ALDERLAKE_N its own top-level platform enum, so it needs its
> > own explicit table row.
> > 
> > Fix by adding ALDERLAKE_N to XE_HUC_FIRMWARE_DEFS, reusing the same
> > "tgl" HuC blob already used by ALDERLAKE_P/ALDERLAKE_S/ROCKETLAKE/
> > TIGERLAKE, which share the identical Gen12/TGL-LP media IP block.
> > 
> > Fixes: 500f90620cce ("drm/xe/adln: Enable ADL-N")
> 
> not sure if we want the fixes tag, as IMO turning HuC from off to on by
> default is not something that should happen in a point release. I'll leave
> it to a maintainer to ack or nack it.

because we have the doubt above and because it is a platform under the
force probe and because it is kind of a enablement, I removed it while
pushing the patch.

Thanks for the patch and review.

> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
> 
> > 
> > Signed-off-by: Kumar, Sachin <sachin.kumar@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index a8e6f18cc9b4..80f657ada0ac 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -134,6 +134,7 @@ struct fw_blobs_by_type {
> >   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
> >   	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
> >   	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
> > +	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> >   	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> >   	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> >   	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
> 
