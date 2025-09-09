Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5269CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FEE10E767;
	Tue,  9 Sep 2025 13:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSBJwzpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F310E767
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757426339; x=1788962339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xbdikt8PYoAho0vIuf7mp7Sd8r+rgG319BV+p40o91E=;
 b=XSBJwzpkbgT1LfRAtKkLXx/u6ONVilPy9xSmtD5EPixxNdVXciNZ0VPI
 xYhtrzRAOwYziEZ75JzSkRn/2GjQBKiyae7OFtyvnfB4HTk67z5mYxvvv
 jYycBo9r/62mW5ggYWRj9dwm339zhnCTHDw529nD4/MZFg8U+55kLPzoo
 BgOlIbf5YCZNZPNw3g69F3Je4WnIZC12Gsk/GmppuCRSu5fnkoPAgGOC7
 jlJeeZGWTDWOMlA1atE/obXENsORIJub7OaeBhW418LCQXxVzSBBM5lFx
 NgG2xWjZklK9n8+uBJvSJCUuaqTyZqKcPlHsBCQFV9aRE17w8mEqGYzQ2 w==;
X-CSE-ConnectionGUID: GbQt/ezXSoWIwFoD0DHUSg==
X-CSE-MsgGUID: tGxCpQxfTTWEn6CHUdjjCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="62338048"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="62338048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:58:59 -0700
X-CSE-ConnectionGUID: IP/eKeN3S+qRY+O9L+uucQ==
X-CSE-MsgGUID: by37xZLmTZ2MCghVSlRMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172670519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:58:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:58:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:58:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.60)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0gKusJ3Q/N0M1FiMCUPJGRMBy73Qd+Td+6Ci/yOZbP9v31O29U7uLnqxc05UhhxLOyyDrtKuM7aF0sQsuHsIFYUFUU/nUJkIrso7Owl1lpu8d7KkqxYxXYeIpr8OK/UK+mal9d7QGBsGY2C0TpQaWmRGYq8vkPeZndmsydlIyWXQuq5FlvbrEnRe7ysg6d2UJkic5bZsAKkko0GX7ExVlMlxFLk9djBUsouiwlvcY4AnL86dEQL1EUxoN2DQtfZzxlS+XfW42aRCHpnd29fFkmpKvIlCZYbXgaDKzUXr5FzQFVmkIrVBvEHLnLDdvNiwUmMfkC1YXJWcvgYFXqBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teBBohsMQRMwdLrygRplA/Kr31DYDEMCcsuc0sCsdRw=;
 b=bt75MBT6qVZSvA6g92HJa8LvOT9NEySfTKzi/cxcfEcIspbaWbXBg0QwfslsVaQFfXDJUU/NOuDaNQ8UetBhKPYO67SpPbVTbTYB3Zlquc0lWVfMw30yHmFnIN7f9Wy0HRE7X+0AC2F7tXtcUNcrmv615dQ2/PejdaONEZKK2Jl+0mESgXI4sIP2prN/ko3NjjSpZkLYG+Z5r8sy2SqQyZrTPAblWSmX5rth/GAsh3vv5oaRKTkZ4D1jwafhMsPhemAg23GCVe3/JnYDxFNENHg1DgSTutIRQEziLXclr1AjGwr5t5cVjSyJ4mSfLDQesuUrVfEMwDd5EPqxKfK4Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:58:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:58:55 +0000
Date: Tue, 9 Sep 2025 09:58:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Use tile-oriented messages in LMTT code
Message-ID: <aMAymwDRaJtb3Dky@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b2fa21-5b19-4db8-23ac-08ddefa903b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1GQO7Bh4+biiNyFWoE1jgL7ma/rpLQOPUFCzEIsg/yq8YojIOekCVG79MbW+?=
 =?us-ascii?Q?K3KSk3PdxEiSjTCgjZ0tYxSDk9a37hjSeWew5CjoBcFRyXMVv15l0tGp4eK4?=
 =?us-ascii?Q?Nmdm5VUGG/nbt/a175pMWp6eI1wtM6l8Y66XUdvvkUpqdrYoQE24yUAsIYKu?=
 =?us-ascii?Q?iDqR3tH1MEuJREQXA4AZ9JXAFSufM9rzv2twxNjud/733pT+IVivAAHcPXOh?=
 =?us-ascii?Q?/LapFZc0FX03zkooBPidAq57JFrjlwb40KmLfjqDvr1rFZ253MG792WT9CQ1?=
 =?us-ascii?Q?lbZ5yLqtxgG+yTSssc6Nwi5t2mKGYbSHCTCNwePeaTODL/lf8wgl8z1P95Fr?=
 =?us-ascii?Q?FTy5VFAj2UfeBUAlXsUaDG4Ttd7PftmpVZUBci/1WF8AdSEvpBYwEFv/mkoR?=
 =?us-ascii?Q?Fyqzh3OIMT+lUgHI2B5ScYuC9yPrQqjkuSvknn7CQ+zYxIBy9zHddOF/EoCC?=
 =?us-ascii?Q?VdMOYYmwEoxfUv/5hhHphOH0HJcHrcXSGfHwPjV3K6JQVidrkjR+p0FvthBR?=
 =?us-ascii?Q?j54KQrJl6MVvXRGL5daq6Nld8IFuvVYBJ6FFHOhDvy9NFxVuQZVwoBk5sl8v?=
 =?us-ascii?Q?7/jqgs5g++EsL3+IFWohqF4iD8dkQc1uaRQgUvgvxv4RwCg1pKIFL8gO+HEJ?=
 =?us-ascii?Q?MFzZi9h+SNEvngt9D9B+CkHFQFjrVMT9yeKdNUrlbKY3092sSvP6cnhBm0PA?=
 =?us-ascii?Q?GlyvJc9Z15beqNZaUUHkzPOZsdFbOgmJoUlOpLt2YJo93i0PVDaZb8/ystFp?=
 =?us-ascii?Q?d6vlNN6j2OSGj82qr6XN2T1/NNLflcfpqtcs7rz0G9ZQpxjnUMkZ0ASaUke3?=
 =?us-ascii?Q?bql9FiSgvbx6XoVUAGYtImWUeki3Nkcyaw6AnnsRZ7BdqG1X3m40RENDEkZK?=
 =?us-ascii?Q?IzXsrk5cgsABPkrMk/++TBJbq0fM7lxn+hrq7uFFO1Y21f7B4VG02cUIfqqp?=
 =?us-ascii?Q?3cGbySpDfkhMNefh8T+QrdleP4c/FBZIswfrlJhbVkN7BcfcY3wpAp/sDngN?=
 =?us-ascii?Q?y2adUxMrWBPaMOeppeyxv//EnOcyQY9Nz0SK+vJ50BIgQ19x+675IvtMsya9?=
 =?us-ascii?Q?gU2/XI5NKQCE3Ao262Kgy4MKc7rfSkcixfUDRIbcLLWC3enPnHGEQkosOjcP?=
 =?us-ascii?Q?ogRjG3hQKDphKa4HJwxPAsaK9APzfc3YT8GkvlWbEIc3LCyeEvP5R3gAR998?=
 =?us-ascii?Q?6cOiNjY4Sb5ZNHL23EFkFobQxRXYcy3j93Adsnjugxl+DjwjCIPmKz3iRkmB?=
 =?us-ascii?Q?/+4guxCOScC+lma9/NFqOEEBdPIqeoQC0zSrKslb+4sf5qAZxGqlJnZZwHgi?=
 =?us-ascii?Q?51eCscoLpFcP+fWnnFAlc1o4VIbQPGGD8UWw+JedVKexAeAh7HDSd+84Hf13?=
 =?us-ascii?Q?64VusclnzXtqMzLaKKEwTjs/mFwpmR9sJ/0dEoHizWmm+pr3chPRr6yZJm3q?=
 =?us-ascii?Q?uNM79/gy+Kc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1dZDIOMV9OqSpoQuCLMgIK146O7TNzF9PP9rR96NlnmLBmYpR4nk6GhudD9L?=
 =?us-ascii?Q?qDut33K6xTxZr364DmToE8T71zCAyeMk2WoJzP6lOhBeXtzWYP5tTCZ8DWg8?=
 =?us-ascii?Q?EMKfHCV9RZz2Do+PK4z97AoNZciP7uCUOhwK2rRX9LwkI8Vl6CZA4sSgMrYb?=
 =?us-ascii?Q?HKRL1MwU3PMVxfjlqQ4ZOChzm+wZS03XxsaYR1XkHo0o1tcnBWQyKvKdBmwR?=
 =?us-ascii?Q?yCJij1t4z15aS6cdbxW7uhUFH+mW7SK6S78C0/O2IyVKaxsANe9dqJ3xdBVb?=
 =?us-ascii?Q?sOPzdJnGtt4AfDJuN64YC+lRSKK1WQPuz2BkILos+8vw8PuALNa0XyQvzKen?=
 =?us-ascii?Q?uRS4eXieCmmh0H+5SjtJvrpUQuvlzP4trE31pnsGbb7aMErhnokrCrgtc6H0?=
 =?us-ascii?Q?b24V8HBLuQtDTg5Ni4XSIp0zp70kVhMlRNMwEwaUzQtYCe/qKEJsKWEeCMGB?=
 =?us-ascii?Q?PwW3eVkn8oOsubNIBz2gjKR6htXOVlIuXQTzRUmkaf98X5WZ3VMxfiOGMPAj?=
 =?us-ascii?Q?2TmOYndKwlkSjNDqegNNCbBEBoLYA4GHMZG3QtwiguT4Bx6tt6kcWUOSLyS6?=
 =?us-ascii?Q?sRH/BkYK4u0aifMPvorppo/jLPcHg8yo+GD0QmTxe3Zy4CwV8V7XJATgmKkY?=
 =?us-ascii?Q?MKsKMdedOhaS0dV/2cVgxfPhgsuvuik1sTnC3kWJes8N0o/JmOPpvMfw+a3C?=
 =?us-ascii?Q?qX75nWpwEQtwcdN9Vj00+wblYXS851joqGdPFKosRUibbU5hnKjLfy4tXIMw?=
 =?us-ascii?Q?P+RPfOTUyc055hTNSVAhHzKBQ6ghsP6T2sHtsY5oDJJV7J683HQQNMw+jxp9?=
 =?us-ascii?Q?phugPjNujC3NNr5v1AVOLng2jCEyLkdEOT3p8Yyt3Z9yu5pUErpyg/EW3FRC?=
 =?us-ascii?Q?sPDTfsLIljesQ7bPY0jcbT+vE/oFZCrvaZ4km7+Wk2tQ8affA/0XKc6EqHuu?=
 =?us-ascii?Q?RepM7cMXkxGSQyNxMoWohg+/ljcmGApL63E6bFmW+U83MeEiGE9wrivGPsbV?=
 =?us-ascii?Q?isUK7rRyCDDzoMRtcOoB9WO/3VK/K2XPNYOnVgZNb7Ec59L+/jD/OX/wJe64?=
 =?us-ascii?Q?MJj3iEUWTxGtbaVqovV/nlLttVa0x5o7ROSHK5luW8Z9xndlkhbtWLhxBFX8?=
 =?us-ascii?Q?KW4XjKCj+Eg8efagMbySmq5c/pakZ3NJw/R+2bLNJca5xi5yIr7uQZniSqqp?=
 =?us-ascii?Q?2iI3qhLunDRvxelC3gAoWh9DHsIJxM5a4Uo2WguLaqYEcSaszZRPtqkrF42t?=
 =?us-ascii?Q?twqIS71bIQVb5PdfPyOmfVYAwl/3VlxH/kYtK6Iafzfv4ljgyhuBKu44PwG2?=
 =?us-ascii?Q?VJ/SI2pB6iCkvLo5iq7/Bq4sBZ+2VpxlMlegUAAG96WSMX6hguKM1cFexJzi?=
 =?us-ascii?Q?mOuE5qGyjCb1QKCQKaLdqQyzUmFsv+XvNU9gonrxEGt1VLP821sLoCly/PYt?=
 =?us-ascii?Q?rtOv90beiHLNs+Rl4sJowweoY0ByNz2yzyMDLIFkmiejjfQnb6fJxy1xNuun?=
 =?us-ascii?Q?CLJ6+mhRrnXnV/2L6JQvzakdhgxcP2/SVQd+xKurIbNwA0QJEzc4qRbu83VE?=
 =?us-ascii?Q?O3NNGzcFoiF/biF5ekR2nd91cruDlMtuzlcQlT1YadhdajBXjwqa1gXy1WzF?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b2fa21-5b19-4db8-23ac-08ddefa903b3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:58:55.0161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnANAnOsS2D3hdpnaxnhSafRKhT2Eus0XxIhCH3CQ6z0WBP2PFXnnYKHHZ71gKeDCfo0MrHpQabhAvnhkvSswg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

On Wed, Sep 03, 2025 at 11:36:12PM +0200, Michal Wajdeczko wrote:
> Use recently added macros to print tile-oriented messages.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index f2bfbfa3efa1..d4412ee074a5 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -18,6 +18,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> +#include "xe_tile_printk.h"
>  
>  /**
>   * DOC: Local Memory Translation Table
> @@ -32,7 +33,7 @@
>   */
>  
>  #define lmtt_assert(lmtt, condition)	xe_tile_assert(lmtt_to_tile(lmtt), condition)
> -#define lmtt_debug(lmtt, msg...)	xe_sriov_dbg_verbose(lmtt_to_xe(lmtt), "LMTT: " msg)
> +#define lmtt_debug(lmtt, msg...)	xe_tile_dbg_verbose(lmtt_to_tile(lmtt), "LMTT: " msg)
>  
>  static bool xe_has_multi_level_lmtt(struct xe_device *xe)
>  {
> -- 
> 2.47.1
> 
