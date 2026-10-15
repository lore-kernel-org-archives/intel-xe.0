Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8871ECCA462
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 22:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4529B1124EC;
	Thu, 15 Oct 2026 22:03:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4924B1124EC
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792101779; x=1823637779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ab4TXFVkMMPD06cs45Vy0AVZ/747WYF8fKE6T9sTmCQ=;
 b=bsCcyKUvZ+FN4fe4RGNhC2ti1osZNy8Wp2Vo8PGhuMbQIfOnw3jGF90v
 jEwidxRPE7L7BVIY4KU3ofwXNXZboUrwglkgFVYFOMPxNF+/JXPjVt4dt
 SY2Dr+Z/xZTv+0lmDuT9Z2srb5Ez0tHk2hD0+BrybG3/fxG1UrP6XNdmA
 HTXGxjAwmvNrAs/YWwLolBbFFTkaoPMlilsD+uclvAXoqK9HJwMZS+MT8
 5nkcNU4LrmUSEDqvorIFlDYK64m+bPWPMCq6qCQVTF0Sl8ppJ/BSFqpF5
 CTkZgO3D8ZaSDf6H/54EodI3sWMUO5Q/XVBgQM/GaoYsRdElXQymULg87 w==;
X-CSE-ConnectionGUID: B8Ryak+xRSqas9pMLfUREg==
X-CSE-MsgGUID: tpFhe0BTSxyWTHeeD2WgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="775881"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="775881"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:02:59 -0700
X-CSE-ConnectionGUID: lSwyPN0HToaF+6sLNDP6PA==
X-CSE-MsgGUID: fTPSdzg6RTaT7LfVJQ4pxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1773153"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 15:02:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:02:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 15:02:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 15:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNABHIg4FNTKgC3kC9RyobG5UXNwb80eSnKhVQpNAnzCe250QMVDZiW9JMat8D5RiCHYiZAJxuEwyWsjookvTFRQqb1t002PJuP1ALiZQXhlSMTCzZUM76Tfx00ob9bO2G+Gu9Zv2LeKxhSLhawox1a3MBUzT6hhrVzFRUbsSlK+udd+agXWeibhIhQMCwfhIZxUDzzyb3JxZE7iBE8rwX6LbfICfu2JBjy/XnKBlFUB+7UPsVox34nI1LX0izKlE1uE363rAjLAm3w54tJs3clc0NMu/Pe8HIMKArgqvQwGgHi6Mhs9L2Nw39MCanBK29yOi3umjy2pd5ru1b5cww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0kupZZThMeUM32jk3aNMgEvxNdCzc4BbB/mGevYuLI=;
 b=qzDc2GelbSxejlSxv/dEuHBbazJC93EFj/QCDRCCiz/txd6M7p/i1+GcwmxiWIDuQ1QAbrTOYtfVoM73HI2ObKOmpuAbqwuW9hCrgjDXhHy5IWojKKbw/XS3gy8nwdrDuU8wkdmJZXLds8wWCcJFWH0xGryKlT3mDUkLrX+o81OREPljVKR9HbMTrtEFaAgCjnvNn//nSiCnuWpZ/22JGaiOKSgR4R1SQxu1MKO20i2nSFfYnIO72xoQp5cz2Z1BSXdWafHfl7f0venoTUHPRODiY3hFrff4vSiDLbOSphqQaunwG7qo6OmWsuEebBCvR3rZ56k5uVjEZz8wdUAJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by LV2PR11MB228740.namprd11.prod.outlook.com (2603:10b6:404:300::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 22:02:56 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 22:02:56 +0000
Date: Thu, 15 Oct 2026 15:02:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/2] drm/xe/tuning: Stop applying media
 CCCHKNREG1/L3SQCREG3 tunings from Xe3p onward
Message-ID: <20261015220254.GE578251@mdroper-desk1>
References: <20261012171901.19508-4-nitin.r.gote@intel.com>
 <20261012171901.19508-5-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012171901.19508-5-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|LV2PR11MB228740:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc1df70-8ecb-4c17-2aec-08df2b081178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|22082099003|18002099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ac2d/8r3ndI9iG//+pJa2gbc+bwV9UCk1ADOZDg1+oWAcWPKF2J7d2xpacQuiZzk86aMPCUdpzc/YPgrF7bk6LgjY8CdhWGHpaUzAD7alVwK9e4NLETw0PyhC3uTCE3+N89fKMLafPkpNkepVz5Z5OgDHDfFRkZ1Zgwid4gCgdz+7JeIhmyJk/XpRB+wmZDM6nFVI/JQdD+LGyH5FdWS152jr2S7SprUHVB368JB5l4w7TeJKoFa16b9wroukfPyAdtOkIM3CuKxy2EAEn4/o83q0lxMWbh5JgGhbC/D4WEaI4KQkYb7UvLHCEWY6X877RxSZ9xXp89KnRYAyQM+So3fzWMo9mxchiHlawcdfg085MODFDt296CR2swaYeJk7D7L4DqU5Fkw2iGJmwEZEG+yf2g+UikVDxFb4uwZ5in+T34vlRHvW0p3ymmxKg5QJGWbnEdsWmZXWqwe//AapH/XV+AdhYkJt5P762lROxONinyU5VBfHwZj3Kg85jby3N3wAQz3EE6+HLT/nxTk6cqhG+d5N8lnvM6jkKVnOas6opaPjn/PeUuCjTA57pF+/k1+cx6Kc6JqnK1pSvMS1jideCW/1mbpEFHu9zYz6XHz/4aztAPGuurzK8BL4rizX/oTiiqYlB1uxpsIJdhjNIQKrNRToIiXOdxKJJun8fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vm8eyKeMKtOHRwz5arlKBiLmSSjTaocGqDSqrKymu2Z/amebuGbAs29ffXBE?=
 =?us-ascii?Q?CwX67WQqWIiA4hwdFnkmuCgOx0IMXx+hx1YIofFp5mOGltkM1kTRf67PjacY?=
 =?us-ascii?Q?7PUa5Y9qz8Eu+YTeOMTUaL0TeJpytLNnhS0kvgXYSFMzKMnFhdjushCnshP7?=
 =?us-ascii?Q?Ry+1nZfZG8hR81lGGY29uzFD9kDGGrlv9ShXFs1nXqaTROnEcNhNd0HkpzOk?=
 =?us-ascii?Q?HdDaY49Uyi4VRYRijefjCaNDRIHbPnaaxMbHMsup6e7kmRk4xlmSieyZH4L4?=
 =?us-ascii?Q?RNeC/o0TlFhlAkNNY7MJilttoor2fVXK78eDxucoDLSR0/dR7KmZf+tbxCJa?=
 =?us-ascii?Q?s86yHVZHxnD01/uwg/dom7qfjP7zaZSATyL8jYCcpNvUAub4vzEbfZtIJLnl?=
 =?us-ascii?Q?IiOru1gBr0GGeUt+QPzeMfHQcLL1DIOP8ymmXyBDlHTIrCYkOSqDYgkzzC8D?=
 =?us-ascii?Q?zuB1+1Qui7OYe70L/Rw9sg31AJft7qiBBhAZpvf6DD5i8f/6E/Qptj7uxhht?=
 =?us-ascii?Q?W2fpkh8FOpWzgDTBkazHR6zIqm6y+4RoqerCDeMOI97IzcymXxDBg6U2EnWB?=
 =?us-ascii?Q?4j4OaLSseKHezdrW8p6Ek3+sjpfXdHyBJ4Cmz78vJcIfHGG3KbDWzfidw4Po?=
 =?us-ascii?Q?OUgJVpQigI05jPuR5KXIY9mJIPQVEXEH7brM8ht9+JP8N0nnsJCNJ0Lf+5qh?=
 =?us-ascii?Q?d0Tl+kko6cK93SVAE5lUpHgI2JtExklXinbtiGzRHPo79I5ILeSs4gmBjoMD?=
 =?us-ascii?Q?1DfVcbrr0u/dGee5MRwuEoCo6uuSOmwqMaf0SsqS3Cys1U2O+376ryjwaay5?=
 =?us-ascii?Q?A2mBM+h+Cxoch1kmmnyGJ/eVB4fItE6OLGt5EKkpbQ/b/FjwmAguJUOZAQFl?=
 =?us-ascii?Q?YyS0p1XUCWPHqVNKSSzoF5FqMqjEfyppr/FnTQsfZ98Z8LLb6ifZKcviEhle?=
 =?us-ascii?Q?0Ge69t3aXNO2X1DCNj6nrWss7kFV9USlyz2Ijqbr/dAtVfjX3A4sAgiQsDPT?=
 =?us-ascii?Q?wcMFIMtEThmoXqlOdhzcrLhRepw3rzJNfGx3NkLPIoFMW4FHeaIvLqSv9lcW?=
 =?us-ascii?Q?/AdRkhxxtlQbutshr0ea0bWDlzjiIb9QykbPRJO7mc/orez/kTzjGmFc4ZKl?=
 =?us-ascii?Q?QhKd5ceSMi/dVPADq1zyO5fwFwpUopd0eX6Eqz+/Y8Ct22miQRWgpdJvQy26?=
 =?us-ascii?Q?BXryh/ritZrCZujXJ7keJ8YfXhLIpIWN7rQuX788KLzqVr+aoVHqNrbAjgra?=
 =?us-ascii?Q?QYdR95uAthWr51V9bsbXZf+e8SwUioPdZ83Mon6fGwkdxDysTAnbdXeeClzY?=
 =?us-ascii?Q?MWWuJry6Ox6Vd/flmllz99djMWXwJNcEpaRaLxevnaW3gBhupY+0xBIFDGYE?=
 =?us-ascii?Q?H1U8LOBxtkDn4B1H6LUFTOmhmj1Q5BfnbYGobMxDoGcgqCBDm6XIRXsmpgd4?=
 =?us-ascii?Q?sot7r9ZEW8ycPzD1aZ0cv2xWYlyV4fiEzhb2m99P1052cNQsWSP+QIlHrUga?=
 =?us-ascii?Q?ItI6Sni8HledApPJW3AEPR/Nn+Q8cwGWq8jo4xskKEHZ8XpTTaZud5cI7XMI?=
 =?us-ascii?Q?iVsFMFF4xnD9jQJX5X1AjJMJqu/sD2FgiasEm7LiGEjgPyAKZzuTb0i55Ksu?=
 =?us-ascii?Q?XwM1/mQ82ZrlTJwACESb6t0olDGFDhke6VOuRQSAro0kudTfBvYW11iY33rm?=
 =?us-ascii?Q?+X1Z8oEreh20NMVrlH4pLFb3b40zKH+YtQtRv7Wf47FJl6Co0KwzDBIygiwg?=
 =?us-ascii?Q?67d27BGdzc9Sqyd4hRfP7djV7cTvIjo=3D?=
X-Exchange-RoutingPolicyChecked: poEdzDTYSylJ6gcet6llAdSlyR/A3PLNdYze4aFe35T5BoqoKhKusGzpks6ZzlwYapd+9YnL2gM/3huZ9SiNNBX5FgPLJYfOn1akS4zoUUsg8YNg+50LAZQXgbDuY0cF8pbZa5OwUxhQ+0N/jkO6o6oCfRLEVF55U0DorgLTqdufLmtneliHm7sdt4izb6msnRa73mtPXd+iCNDW3FnGN6O79ovTZktCY4Wy2vBOkeShhwK76t4iKm8xviuQx22WYvYMwTXPWN77mkopEEBn/Sy3TsuIT9cT7h4usylV6uupxP4iJrkOQ282iUaBTFDay0mUm0IVzRjqeF+LPHpVGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc1df70-8ecb-4c17-2aec-08df2b081178
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 22:02:56.4133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNCMdJ+dleO8r5VB3jDV76dFinmo2K0gnHwKOR/piV+2slzHhsTtTstSV0h1sUo4lcNzdwZfbTvyzCG3vBH++ZDnjGCbV8g/OW9c0c42VKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB228740
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

On Mon, Oct 12, 2026 at 10:49:03PM +0530, Nitin Gote wrote:
> Commit 288b775a1cd4 ("drm/xe/tuning: Stop applying CCCHKNREG1 tuning
> from Xe3p onward") bounded the graphics-side Compression Overfetch
> tuning to graphics version 34.99. The media counterparts
> (XE2LPM_CCCHKNREG1, XE2LPM_L3SQCREG3) were left unbounded and kept
> being applied on Xe3p-generation media blocks. Both were caught by
> igt@xe_debugfs@check-gt-reg-sr on a CRI media GT:
> 
>   Mismatch on 0x82a8, expected 0x800000 got 0x0
>   Mismatch on 0xb608, expected 0x10000000 got 0x0
> 
> For CCCHKNREG1, the tuning guide (Bspec: 72161) still lists this
> programming for HUB_DIE (media) projects on this generation, but
> bit 23 (L3CMPCTRL) no longer exists on CCCHKNREG1 on Xe3p, and
> bit 25 (COMPOVFDIS) is also absent. Bit 18 (ENCOMPPERFFIX)
> already defaults to 0, so clearing it is a no-op.
> 
> For L3SQCREG3, the tuning guide doesn't document a removal condition
> for bit 28 (COMPPWOVERFETCHEN) on Xe3p, so this change is based on
> the observed hardware mismatch rather than a confirmed bspec removal.
> Bound it to the same Xe2-only version range as the related tunings,
> and flag it for confirmation that bit 28 is actually gone on Xe3p
> media, the same way CCCHKNREG1's bit 23 is.
> 
> Bound both media tunings the same way as their graphics counterparts
> so they stop being applied from Xe3p onward.

I think we need to split this into two patches; the first part
(CCCHKNREG1) is pretty clearly the right thing to do so no concerns
there.

But the second part (L3SQCREG3) is a lot more fuzzy.  The spec doesn't
support this today so we're guessing that they probably forgot to update
things appropriately for the media IP.  But it's possible that something
else could be causing the test failure here (e.g., failure to read back
the register value properly, some other unit clobbering the value we
write, etc.).  So I think on that one you should reach out to the
relevant hw architect (probably Karol since he's the person who
generally updatings the tuning guidance for these L3-related registers)
and get confirmation that our guess is correct.  Unfortunately it's a
common problem with this specific bspec page that tuning guidance
updates often forget to describe the media handling and we wind up
needing to reach out after the fact to get clarification on whether the
recommendations apply to both IPs or just to the graphics IP.  :-(


Matt

> 
> Bspec: 72161, 59928
> 
> Assisted-by: LLM
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index a9bd3f8969a5..514deded1163 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -49,7 +49,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
>  			 SET(CCCHKNREG1, L3CMPCTRL))
>  	},
>  	{ XE_RTP_NAME("Tuning: Compression Overfetch - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
>  	  XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>  			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
>  	},
> @@ -58,7 +58,7 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
>  	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
>  	  XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>  	},
>  	{ XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
