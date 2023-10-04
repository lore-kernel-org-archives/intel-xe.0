Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03871E7C4E5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C3D10E3A0;
	Wed,  4 Oct 2023 17:10:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31610E3A0
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696439450; x=1727975450;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3P/is6gaflwlp5Jw8tR94DLQEp4HxHp8eSWL475jbkA=;
 b=VhvqoI1K7uF9gc4uGGpRy//CWSMzvsJUWGsSrSf1XYzJynod/h70ixx+
 6kvhRwXWPOE7peYdH6cUeI0hR+BbBHEjEK+BWjgvdMBxoEJF/Z7L1TaA+
 k8SXIl5HtVlgp+nx8yJYIEHNpoDV4VG7WqSuH91R1PFIG2oWr3AkepdQm
 Lm3j9yxs0dz7gvLFJkrELH8HyPRPnb19aDKRWR6LxORI4vdqtEjFB4PWF
 /mJxWAZOdam9SXIwNdOEeeKf+L63jKbCcq08tzo1nv1Oqzvr6P717Ru4L
 nG3l9GScnKQ6LyZ8TEvIzSuktCH41HvPHgvuFmFXnsg0WugAYjJGWPKxc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380515179"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="380515179"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998563661"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998563661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:10:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:10:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:10:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:10:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrkhsUYdokYyTygQhDMX84avNIecvZJqSZGtpk174CdBzL1aYcCGHvSVJqgtB/9fglVicJ8TY0vtaLKLp08mu9HhXKa/nQJQrWRAbuzAqA+JO+hdOyChE6bo3GypQ/3P5DjBqnhXD+FyKB9ANKeaJkCU72jZIAt7Ux/Qch0JkE7sYL1IFQWkAv2RK1pgf/aiQW384XZYAE6FOFWDVVfXUtN5uS0JaGZ+A4tThvkPGFUOMP90cVg9MGpLYVoNfmHQcx91T1YzHlU3pd8jt0yB0MrTltEAYGPzwAUsv2GM+SkH49eXhXVYpL7MHCpNlghEmORVZzAMPHd12r03y8fdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d2UAn6O9Adosac2dJDyHSrCXDI3OKeby7O724Krhi0=;
 b=DY45k7ovTJp5AMrsKPuOUErCN2+1ORUQQ5wQS8vw0469GAQUsx/N+/CQ+wyC4wrQw89nc0PhP/i62eKjAeDa7Ob041rLYcYZ1T4rcSjjlRE+YuR5bn3iL9mgxuEC5O1VzWTLzPOiHwE0O/gwU+L1xDfao74sOoKzk2p4ENoyytL+aDOJ3jekmDgmyeANOIq19ktwLEY6hb0fxvOJK+FXTMDiEGYD9j7QFS+ywMtE3v5xUUjlQYhZFm7FHIRZIhCrm2aAJnPd0SN+casAWW5ydeRE8qTpnxrSTfop/2VPOc8bxp3aipTYnbsae0V7TxuiNlg68IR6sHVHAFcqhp2QNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 17:10:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 17:10:45 +0000
Date: Wed, 4 Oct 2023 13:10:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZR2ckGE1I01c46HT@intel.com>
References: <20231003202728.132545-1-jose.souza@intel.com>
 <20231003202728.132545-2-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003202728.132545-2-jose.souza@intel.com>
X-ClientProxiedBy: MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d2bc56-d1bf-40a4-d8dc-08dbc4fcd8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nc9JIC7gA9USNue0TEPRnVYrVyx0ih6bAk+h2TV30glNsiNiJ8TpyAGsPfdU/g2Pvisb5vTpe5AQpD7zrM9xMp5nWYrGQsFvj3yM5jeY6FE1kDmwudFBHYdqwSVPa/U9MA1jlNs54BaqtiQ4OvyzQySb2wKCUzctiXoHvH06BkfhVeTjhFh9VlM1BgXeJr5TR/lVwB/TaMWT37V+l2hskymE8aVtaEErb7n3zPO/weGWauRmDQt3NRc8XRYpEgY4Ja6QZpmlQxe/at1QaBu8g0BwsBz8RDHDtnJJzRejcwGfjiZvMa3QDEsO45Ycw/HkhuYtexNWpiu8mqIWwenYGoezz9dCr4AYbIz/XnyV2HNgY/dRczEKIax67/KEJ/u5oIz/uMsZpf474A4TrXDfkpUtUaM5zyuopyTDhddcfz1N2aJBwnd1ofiOPVBKEOHNDUJF0o8u9Rsz/wVDAYMdNehFRk4AJU0ldvSvwCClchju8UPBrBgBRfRvYLHBrRz7/jvPFxJdlLfkkL/43H9Lw+XC0cLpyx1GQou90nnPwoS9ZTUTstg27leXXRKsKQWI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2906002)(83380400001)(38100700002)(86362001)(82960400001)(36756003)(44832011)(316002)(66476007)(37006003)(6636002)(66556008)(6506007)(6512007)(66946007)(41300700001)(6486002)(2616005)(6666004)(478600001)(4326008)(6862004)(8676002)(5660300002)(26005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OSZVEfjEblHtZYaEdRk5japPXcQVEWGHE73GndT3ldenJkhp/7x0AAje6T?=
 =?iso-8859-1?Q?YczYo+HTAdZev2MeFd5+KCPV+TL9uTkjthz381YGj0wbu2pb3D+PMgPcXm?=
 =?iso-8859-1?Q?0aSH+mUTIt7ySBzrG2sH+agpFWlyNgUSa0Fy6w777+M+HzUhz2+0iep7C0?=
 =?iso-8859-1?Q?ncJYgq3adbGe0lwgd5ZhS4W0yA5yklAM5zKWtkz3pexPHZ8v+TkYRq31zg?=
 =?iso-8859-1?Q?YK1bjdjunzk19HiyHdeSFRRyKdwQMPQ1EYwiGIq/YSM8Dv/0DcgEtIx1C+?=
 =?iso-8859-1?Q?mxMOo3smeVX8/NJqvr9SvjEVahCwOCxtdpg6d0EzPuUjwGAHiczdg+KMod?=
 =?iso-8859-1?Q?etJQ8hKX3fPiFOrNCqSfOtAGYpUdfii6PpvEdhZNE76/Nr/Yf6nXV0yFgv?=
 =?iso-8859-1?Q?P9uUaBAg5vJd80iKlJNxzAJg0VxvcInPkmrgTAh4+ve0AhjUgt+dsLo7uW?=
 =?iso-8859-1?Q?vxeCVp54b72FXw8G/DJ9h0zrtxZ6KIfzdHFly5gmvZ9RsFXW+9g3efE5lP?=
 =?iso-8859-1?Q?6dr9LC6dw2trnd9GPfDnbK5vsl56yC1bGGKY9UHYb8VIVDEUncYwyHcXd5?=
 =?iso-8859-1?Q?bJ5Lzj6YIBNxllPm3nEOc1vrEzo11dnwMUbN395ivQ+UlPUTRA073/OuZg?=
 =?iso-8859-1?Q?m8nWR5pPNWhRvWoQ4/5IhiTQ370P8gHDFp/Q1OEkhRePTvAoxqdXMP1gEE?=
 =?iso-8859-1?Q?tBN+dV7U4hWilnPRZkuH46Fs+8ek7FwePX+ZpFlQ96zBUNMGEacX3Wd6/r?=
 =?iso-8859-1?Q?3QZuuy9h/J/LakrjohDcWc82kMwqO/lE+t/Hx8zr6FD3a1yX6v5aGffniS?=
 =?iso-8859-1?Q?XJHJNmsPQq4HzHBf5EFlGrusL2VVDc4Y3rsRwd1kKXKDo/ynohkaMaJce5?=
 =?iso-8859-1?Q?+QJjnFZycjBXGfSsir2iiZ0/xZo4Q088rBYIVEqYeJBl3r3sfzAN+YWqtQ?=
 =?iso-8859-1?Q?tK62ZzT/wTolCpHNgF80NlhCgVHpqim1jIBuvlEGr/kQv2fOTf8Pfz+XwQ?=
 =?iso-8859-1?Q?RxB0XsyH4OIJF8TWhCz3lbTtUDwJkRG/vZ8NLPSNLipOHzzHuIKLWe7UFC?=
 =?iso-8859-1?Q?SBi+56klN5jwe0D0anFizvDd0j1yg+M+jpj7L8+YdESVn3Fyp5269DOfcL?=
 =?iso-8859-1?Q?xkfz0MvNUPaGQC58l/3UWlYkrgyBenChHidEDKKlsbNHV96ftH1mdwgEhD?=
 =?iso-8859-1?Q?Dnd2wb/yGmc8IeY49CFahXQaZDmjpGuvYxAeHDlf91/0aFcupZMrUa9SPM?=
 =?iso-8859-1?Q?dCxElxowcirtn8og0x7fSVAmrSJYKBzYTxHlz5yipBRmX/mgWoG6YkBTr8?=
 =?iso-8859-1?Q?q5zvcg3CtIZyxViUnu0o78j08SNKDeo8C7SqBApJSZyGpzTxb6315F4MuN?=
 =?iso-8859-1?Q?sckYjNjMmNK9Qh0qThIG2iHBqCDDiAhsgshRjg6fu0tQrfZVumXw7Q7Kf0?=
 =?iso-8859-1?Q?8kuNxq0Ws8mplHJIwJoUWUuOA9zl36kGHCEh8xpFI/+4dqEFQY7d8zB8Yj?=
 =?iso-8859-1?Q?6PiOOYCg1FSv8YKhMTEAaccgbufRPEbfEsX7m0A/qTWvMRdLVjNBzLFvBP?=
 =?iso-8859-1?Q?BpAK7XHXAML7OgIVaN0WWKJbYWiFmCnQQGb99zWXThsRcLIO3f7X61FZiH?=
 =?iso-8859-1?Q?jyxicXpw2FtNbXTLEZVHATX7uZ7+dCocTNno+eY45c8pXSSbtTUGgQ2g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d2bc56-d1bf-40a4-d8dc-08dbc4fcd8ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:10:45.2711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITNzoSRX72z3Ds7iog15L3cQjUYFYNW9o4eO6FA74mlM0hNk+0erfVaNNV/jw5Tk3Xh1ZlLTCFHsDHHZi5Msfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Fix devcoredump readout of IPEHR
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

On Tue, Oct 03, 2023 at 01:27:27PM -0700, José Roberto de Souza wrote:
> It was reading (base) + 0x88 but that is not a valid register

s/88/8c

but you probably need a similar commit message used in commit 3.
After updating it,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> and instead it should read (base) + 0x68.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 692213d09ceaa..792d431161c68 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -37,7 +37,6 @@
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
>  #define IPEIR(base)				XE_REG((base) + 0x88)
> -#define IPEHR(base)				XE_REG((base) + 0x8c)
>  #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
>  #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
>  #define RING_NOPID(base)			XE_REG((base) + 0x94)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index dc9dd83d99c52..c2db391cf2674 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -728,7 +728,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_dma_fadd =
>  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
>  	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
> -	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0));
> +	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>  
>  	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> -- 
> 2.42.0
> 
