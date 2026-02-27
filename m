Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAD8104891D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 21:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAED10EC46;
	Fri, 27 Feb 2026 21:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIj+g1G0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E0010EC46
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772229170; x=1803765170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZSJamjHd0AqxmKLBhsDG8VTKjof+m9+kQy+4LVOo1xg=;
 b=YIj+g1G0QAdfIlcgShmGhaOqahZojWMv1Dlj9mRX3PbXLUQHfWRlB4uz
 aHxAJIx0EF0B/auF+nRDlJ4k0pWdZuIHUex9qeiDQJwfw7JKiByzRQhx9
 kJvzpFLtSspwvJgCCb0gfNhzBILVqiuHVK3Hx7xf9+RoLSgW24w2amSu+
 yCzt6q50uDpaBE6Wv7XnaFykjsQTxsg85ECuqrppSNYlHpO+ZvIHbR2TZ
 SOl5pgrgwUKaOiHOg0JmkMyCfec6gsE1QwdcNP+retJGOf1ux95wkVej5
 NHujZvzzIdEchx5VPpMxm0X3whH30ywOiEasU+fegOyYi06OhQaIY2bA5 Q==;
X-CSE-ConnectionGUID: D+mxCMorQuqFRDOo/ojTLQ==
X-CSE-MsgGUID: 131exVnFT/KJeeqk/J88uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77187701"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="77187701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:52:48 -0800
X-CSE-ConnectionGUID: pHtTT7zwTxS3Y+IzwOHaIg==
X-CSE-MsgGUID: m2SAZ4nWTHOllwiZXuEGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="254830058"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:52:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 13:52:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 13:52:47 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 13:52:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyfBk80LVIA4XU5f3T1KNYlV/5BuMA/YGKNOVuGRRdexqOkLkqHrcUEGqYDm6lhT3ZQ4oRPJJIHXtrnQ+Rs+90CpGPyIqwPgSW5LguS2rV/x7vR83cyvmyKjcIuJiIZAiw7N0iVc9PciPiEd62xFMnkNOvLLj1LDUuliU2OvpctLFpAfLp25CsUjhozPDEDDKNQpryY3eABoZLfXe97B6CG6XnaMQUUG1vCccEdzX2/rf10QgYP8PL2tuS/vJAiWSNaLrHqRBLECmz9yGjsEeRjGl/0yFtspKDt5aD+diIYhezBNMDJAXQVL9LgJkqQWlvTfX8Kc+2XlGYOOvm+V6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw6884zAuyPouqWIPfyG2TyWeqfTDgqAgfWBEN673/A=;
 b=wxudy2jzv9XV+cjtvusL+l+hq5irDdaIHCU2avyeS1s1/JtxAehnmDpzdaUe8+VC6pkmnFX/pJRVrw1sYG8vBQBTyWO6bgbA9nxGNp2BoKG23gQ85/Cf9lrp7RIds51eSCRltrQ4OIHyb4eq7GsnxfO7dnAnaW5bVLCVoT/TfAePeGgn9ZExqitnrwbYEx+DhXLT94HBdlosfvCuT6Hj4vfjd/+P3ox2RUqrSeJDmJGE7dQb3BZ5wGHomdp7UVT94lgsumm35+Xyco5BDEtKDZCm+yX6gHUm4ZEWCECwt2+3qg/UwVFY+OS5jd3WOZs2GdQjDDvWkiHdg/iYbu4dGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 21:52:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 21:52:45 +0000
Date: Fri, 27 Feb 2026 13:52:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Add Wa_14026578760
Message-ID: <20260227215243.GH4694@mdroper-desk1.amr.corp.intel.com>
References: <20260227130020.2846392-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227130020.2846392-1-varun.gupta@intel.com>
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5c1ac3-bd4e-495c-d5e1-08de764a8a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: OWSBtHaHPNv0due2opFRCV1BtDF4dX6+KGy/P7hcjHKL6BFFJcY3cByzKYXyqdZzA2ZfTw4WpOhq3XwdA9JldywXqnPPIjAXPktFjXCEp7zQfg/460iSyFhyzfn1j/FSsYc/CTu69X4Z+rVIydPHm/fsDlXBTJlYHF70U4Iq2FXuoS4xGU7qLk5ePRRMnw9KBYTyg22fW/L2w0Aa58mqR3UvOXr53gV5eBQuXPe/kZRyw6qh7bJ86Qpeo9Ke5/1yhE0LdYX3vcHy9RWHBUTxh4uE6+9QNDw9gjpIZzG9gSJUBJFm+5BqK29oqxBCKpV0Nr8Fl2avQScooja0QgRVLbWRCfKAQvkNwVSaBppgqSlPGJxRtf7HKCMUrsgGkykuxL2zQuOLa6LUg12KGPmGjk0rtejPos2VzbRAYmK+mP3MWcNHybvrdvwkMm23w5TZstvzZWIRY9+PJWLCJgMjSrF4nWHvuYIxPqu03YZtsoV+mEFRpq5nAndxn0WsVATWk+2myM9RLj3SC4J74klJpvEYhfPsy9wGBmWfdDTPiXPb65kUwmEt1c89u0tlL+yRwmipG8Cql6M3SW12gd9GJWehEMTPGaDa6QycdtP/zGcKoXLJ4wxi/qInWpOIfAj41+S21RBj597Xh62gMdOHSaOujZQJCx2s8AMJbLvtRqOik3g/5zAj1Fcl8qj3SjSMERngy3B7bCVodm/3NckwD6JvaLItlY7/f6CeI+HEkBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ufNveatJ3P0xfSMYzyyj6bgvrZyw2xfG3WvnzrdD6f/KxOjVAnc85N3HdVk9?=
 =?us-ascii?Q?SQ+favqdNzAVAZg0ZEcDLmIoCW/SIcKCY9JbhbIoR/Uu5QSSjpgBM2x3Ps2B?=
 =?us-ascii?Q?VLp5GMv/XqIBLJXd3yY4+yB0deRiWiw949xkd08Sh2t0sNy3UN1CIB0RW2rf?=
 =?us-ascii?Q?bL5vS6XHRVFGVI+6zjMA9+Ez1CVrJLZ5JVkbHAqB9bk92G0Wq6DHRkC3B1rE?=
 =?us-ascii?Q?8jVxu2EXGhehvjMHaeKw7vBM2bADAtI3vYlqDNL4nx1iOEeOPrM5uMj+3Jz8?=
 =?us-ascii?Q?W+0SJYva41RkxNYj+RB1uDPvsPhfEQ4rYgweQqbiSLNiKb0X6A+dPxIbfgza?=
 =?us-ascii?Q?YtDOgEbY/JlKlvws4k2pgTxPI+K0rKZrbfSbD8HvybTt8YfwGddEpH9CWCbZ?=
 =?us-ascii?Q?YPqF9GIeQs2Ca9b+NHR0fZTbrxm45GHCvue/OIfFoDsCWFyn/0ipxrfPro57?=
 =?us-ascii?Q?bTH+gpzAj4yCfleDHkLWcW97mg5ujRSsWw3dvToJMndKoynVqZPhlbF0lCag?=
 =?us-ascii?Q?Jcij2+n6A+mC7Lj0S0HSVujZxz/khF9Evqne8YGlPlJYyLwrMX24iSN12Veg?=
 =?us-ascii?Q?9RWa07XovdyeYPOcSjBIxLb4H09AmzaMiApFVZspx/H0iYMianwiTUQ5A1Di?=
 =?us-ascii?Q?9aoM7Jk2eaTJ92ygmHpVCoMZptXJOcOl17L1gzP7niK+iuuNt2rM0GCiuq1Y?=
 =?us-ascii?Q?FgkH4hkXCk/mLCnxcETGj/A7TuyOyu4W4bFAL3zI7rJqVSeHWBM1eoKPdiqJ?=
 =?us-ascii?Q?p3fYOvL0OnQ9WIhI5kfexujHqwk/BpDJlcPDqnUTC0FmHi/1rcINo6C/eCFN?=
 =?us-ascii?Q?meKWjHeZ4fm5VqeF4fDIF7bZo5B5ERon2ll1q7ZOK4V/ZnCW8VzQU05ZoF90?=
 =?us-ascii?Q?MbH/9yph1gBf8IY0x7BdmnEUasWtIof4idyY8ztgOtv4kVOnYOXmF28+LRQE?=
 =?us-ascii?Q?n9V03011sOEAHfPP0hnOI2CC0B8Z8erp637PgLHKF54Ye0H3b3IOrdIzmqSF?=
 =?us-ascii?Q?RZbtIT+dwjiYiREXQgLysEN0JDj+qi2l0dElEJW9S+pE1Rt43sZOXQdL1A6/?=
 =?us-ascii?Q?+XEvONr4yeed/r4EsLAhJ2GHrx60b2onEFtDfW8LtnkWt750skKItRtepVFx?=
 =?us-ascii?Q?89pDPlcJHtH3sTwYolsmeQkXtqQJGbXDBIAofVrU/905/UY+qW+FX5h8eZ8G?=
 =?us-ascii?Q?tt2KqJoBeNAT50geNNmZrkUBf39alcraDaJ42XnHLKlWCvT9ZVPa4ffWWmLK?=
 =?us-ascii?Q?dEKWiNkUVcHmbwMwHtAeIViZpJpdg669fbaL8OcAGpBVG8UK2PJlnYuEQfUT?=
 =?us-ascii?Q?kMgWEz067cI1vEx7pfw/8oEo3BnFrCUex8DY3USbOWi84LHFtkqa7KbxfJjN?=
 =?us-ascii?Q?i3gNfWfuH5A9nDBBlOjFNhFWQ/TKfFzvEdP06MOJRxMDMbBrfe8rcfC7uotX?=
 =?us-ascii?Q?e85oNwuvu7sO1YWmSruoESHBo2TepRfbUVg/faJk0F8jpL0ZvH8WhTz45/0h?=
 =?us-ascii?Q?PREwQiLSwyqxCe1q8EKh6c/c/ctq9CWZIT+G1w9uZ8RZomojjvpI2oIo9HxG?=
 =?us-ascii?Q?3wOAPs+AbroX+JjaBc1wwBXCeThB8lWmBTzsRHReBK2g1dsQ+dcZsnDAh3xb?=
 =?us-ascii?Q?uCtBFPTJIrMpK+FhFG86nxEhCsiHVbDSHFm/CnRAcjMVzi/AIdAlxIFgCI4L?=
 =?us-ascii?Q?Xm/BVILkxuJsFZn6DJfhE9ose8nUGQkZmA4ZlkJiefBW47AO9wLbZZiE9gaG?=
 =?us-ascii?Q?jJn+/6bcvOi90TKUXzl2GgmCh5eiX/A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5c1ac3-bd4e-495c-d5e1-08de764a8a53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 21:52:45.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DN8DEkj5sibmowyoma40VItpfVsTlBHpV/k/l4YzVMZcOb2/JNrFxsIHH4xwW2MAHsGjgD8Ah4Z9gY+0dIo/4GrK66ypu/SI2TTXu9RaiiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
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

On Fri, Feb 27, 2026 at 06:30:20PM +0530, Varun Gupta wrote:
> Add GT workaround Wa_14026578760 for graphics version 35.10
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..08b05f3c7510 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -103,6 +103,9 @@
>  #define GAMSTLB_CTRL2				XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>  
> +#define GAMSTLB_CTRL				XE_REG_MCR(0x477c)
> +#define   DIS_PEND_GPA_LINK			REG_BIT(13)

It looks like the sorting here isn't quite right; 0x477c < 0x4788 above.

> +
>  #define XE2_LMEM_CFG				XE_REG(0x48b0)
>  
>  #define XE2_GAMWALK_CTRL			0x47e4
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 26950b8a7543..30cd47b1dc4c 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -299,6 +299,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL2, STLB_SINGLE_BANK_MODE))
>  	},
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3510)),

It looks like the workaround database currently lists this workaround
for not only graphics 35.10, but also graphics 35.11 and media 35.03.
We should make sure we capture all of those (and probably move it up to
the area near the top of the table where we have workarounds applying
across multiple IPs since this is no longer specific to the Xe3p_LPG
IP).


Matt

> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL, DIS_PEND_GPA_LINK))
> +	},
>  	{ XE_RTP_NAME("16028005424"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
