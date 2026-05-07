Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A3CCD37AA
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 21:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA00B10E2C8;
	Thu,  7 May 2026 21:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVjp5SsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAAD10E2C8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 21:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778188038; x=1809724038;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fxOOLp1zp/LltTapIeJEuEJN+77TimKh1NQCNA8g6hw=;
 b=nVjp5SsB10Uxcn7PqJ1F5X+rar+zNIQghE1hMO23SOXA2DO57u+sS9HM
 6bId7n5pV1cWGD36C9AuBgQNKlG3G/2RU6EXwbZ9Bs9cLnOWgRkW1xjxX
 WqsPn+1ALUlcTW0sVGEVGuOPIE9DfkXu5V3R/tlhejiRwWLCIQ0Ip3Qup
 OXzAnMpZwYdNRwhqBXXDU0y3zfkDuGlHL/WhtUWbUOathgqiiPB+yuLBT
 AMUYl3yuU+2xZuqQQlskLfjJWaCTdAmLC+dG282tCjF+e2m8nvQroCJvE
 JmEC6BnQ3WZTbUzTZOT8qS2uBKqlODjje3B7PqQcyPSqGf2j/RPg1TbTL w==;
X-CSE-ConnectionGUID: sQyJfRwqQ/aafdlttO/Tqg==
X-CSE-MsgGUID: X+0VYv9WTKizHugQr1T8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82997925"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="82997925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:07:18 -0700
X-CSE-ConnectionGUID: mMXm9wu0Qie1cRt0stMkog==
X-CSE-MsgGUID: JqTkinxYSo6OO9Rpfn3AIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="236677568"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:07:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:07:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 14:07:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXBrdG82mJT13FKnlHyPiW9o4VugNXCS0hxsQKbnyCRAvyS9fpw3L0d3qa4Ag80XKdLftuu1vxKOetoQeY89PM1hl1i6GBO01iTpdidJ75I+aXcVnLM8+Gdkvef8GIym5v/MPBwh5piyaI32D3bpziDApAS8lb6ktdMJpCyrUKFMmr7js6kBWENtzQmCXSoy7nU1Wa0hH9eoFYIKahPYhJsaEf+QuCRBxhp6/smV7Fi4Jauy9rnzLzaGGJ1nUF/LBe6lV3cuvYCzS9aJwtukvPvNbHvIo6HsbAAs1CUUxLzCasGimoL4fk7A/L2T3f/YN9gmtMRkQ9jQmkh7ymh1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIKfzGhk1wwYx1TMVfK1D2ezsey54/kuoVqIgNPWfRw=;
 b=EwzBansylQHGOUK/H4qZpc7oYYH93MSBf6J1x4WTp4t3Qxt4/85x4F5z88xy7LmsiQvw0RnNnIBwYYoxL2rjjbxMVpO1cEQRQ7l+gjF298ujVLn6mb12J5dOudYmSw0U7N7DeGIFVjGvCwzusNqDpJ9lisSw/XiYXKCnNxDAz9ZUTnc7iFxPsTlC8tpm2YjMG0pdQhRIM/zm0G6qZnsQPjgTpeHOcH2ppjYPsGJy911mz+vJSnZs9xmJIxCHffNETMn5qqC3I/1mkqd2EHUb8NtqSCz8URg8OUSroShhDTnebUsBSUxu312lNfhtv686pCHaXyCnjeIlbR2y90rp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Thu, 7 May
 2026 21:07:14 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 21:07:14 +0000
Date: Thu, 7 May 2026 17:07:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [RFC v1 3/5] drm/xe/fwctl: Add Xe FWCTL type definitions
Message-ID: <afz-_dAiuf7oFk9i@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
 <20260320072528.1780651-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320072528.1780651-10-anoop.c.vijay@intel.com>
X-ClientProxiedBy: BY5PR16CA0009.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef877bd-cbea-4ae8-319b-08deac7c9cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 3xktsLyCqiMwjENrObUQi02Spr3qQVuC8+PNq2X+HAb662Qt4yWHbEw/7qck5X9GjJhqTU7NofqiiisoxsNJRVykvJtAGlzoXo+B0vw6J5BsNuU0GsFjHBY3qtUEX/WI9x1uxli09ECmogPEJUs+VKRWXOHeb+jTtwusesLrhuBGPu2K8WMUhG/C+ydZ6ByV7RHq0LGU5gsGK1fQVhkt/Mu+n0XbW0h7ONI6+3kiMC3uoeRM6Ns9L3SLHLi8nZwei3M9ov7SBWn3DZFlTi140iq8zA1md87KRbNXuGpX9ZUrTSxUhomfXksvMOOacqfXvoHPnMwqUJVGb1/WU1G3DWsh3bb6DptuRuUfaPMnzl/MKHpxFHyCOm9hwYUe334SheZKYRnAE3rowalce2/ho80JdHibiMn0nKEdlbWYQAWEtadR/21L0nNAdY4HBaFMhNBirFKHzXbDlnolJ4BN+mq/tsvZF761oDKDprn64hcm6WroD8OR47OvNp6Bqbwm8wGYBxuaDZ4duXRlmvpRg/RZVGHsJWckYWTINiSa2v8fEqk027tUynqzon2bfHlszpd2TzASKHKNavPRYR1YDfoRRtyZYUVFYSAd3gsi7S0+k4RLfg780MTUrJkCAdPrDFWia2IDTess1tLk7s5jFzIccbgI2zxCJFAOBtr2JGOVBrHMYdkdFQrPMmW+FQgI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?APpBhdOGVlbcMCiOVEPhhTUqwFyjLdXoBneNpZdVl0zN+V1r05fIkDAhwT?=
 =?iso-8859-1?Q?SucVgM8/ydIEO8X5FVrYpOqZUAySBdty1nH35xeQwcf4WbsPt2Uuoynr1s?=
 =?iso-8859-1?Q?vilHIblGw7i1rysCWPOZD3sGSTq6fJpnVv6+pquJI5AcxucJFsB4hzAoxY?=
 =?iso-8859-1?Q?a+loF6JN6XmpNs13ZVFQLm1FeHqMMZkmPPvufAKBSSdd1o9if5k3PFxtuM?=
 =?iso-8859-1?Q?73+EuGdMMpq9ugab8nLWacN+5HZ9FVHGS7mFtuaxD2g/bFHd/DnrXj62eI?=
 =?iso-8859-1?Q?QmifQLmq7eQ6R3hirE0XNo7iG0Yy0WadO2DVFzeT1LjExjkc0H0D6g61Pj?=
 =?iso-8859-1?Q?Upq4rSJYPnkDZb5sv8VsQ4hLOQYzUqCZGPNb/BoumiaoiS6n+mx+i2bVbq?=
 =?iso-8859-1?Q?s7kiokdovuL7CD4TLUFhA02kRPsqDM/cuJE8hDIGIi8lyJid4YtHkfIX57?=
 =?iso-8859-1?Q?hl0IPXojyBBoZlR7VaveRE61dFzoWczFMfwhQ401YmCVGRtef0v2ayqCBf?=
 =?iso-8859-1?Q?xmJksMht4rBOjhk6UyJamy1mu5rHndcuN9r0WrZyxzBRfXNpiRMcsYEHSP?=
 =?iso-8859-1?Q?2tfDur2FWhxmBMKdOrlWF3dvHFDoNO06nOqphtND09uC59I0R4hLOeZE92?=
 =?iso-8859-1?Q?AA+q7qg6UdI9sBIPXHFMtywMa2r62I6W7j8nzejqj4EXBe41ZCEPHBnSgM?=
 =?iso-8859-1?Q?IePmFUNPIY6sczQ6UKyTvuqCKNzobHvzebI9aXyBRBr8JdB+CoTIxvrlsW?=
 =?iso-8859-1?Q?XZn65QwRpXmO9iG3e/zigwHCF3toFae0Elfezmz1IENEVw0ADmv/2A3ReW?=
 =?iso-8859-1?Q?RxfNtuYVbAfAdOvjS/GWcwPzvQxumH00vMyOPvL7g3fTOxbf/0+D4PV0jf?=
 =?iso-8859-1?Q?KEUBBKYlzfNF612khEGnKttByC3Ud8/meKi+I6LyamQXTGKd5TVVzrvR4W?=
 =?iso-8859-1?Q?OiNSV02OkXuq2sirwIjJFK09VG0wu+6k4yjeLfEal0v3scc2JdTahuRaNr?=
 =?iso-8859-1?Q?lqQBqSCwkeKjN6ZLMBJK4oRBLHyeKdoKr46htmKyvUsDHstKyBcgjShOuZ?=
 =?iso-8859-1?Q?W/nk8/U+P1CdLRbubYhOOsfXLLcniS8ERvCdihqUXJOFexv5lvJpTwU+zE?=
 =?iso-8859-1?Q?7L/cRQYheTGiNWnm0ZCwxVDO4a4KuHgmEFBe5fUAHoCV/W1fIj0tcmVHbN?=
 =?iso-8859-1?Q?m/tGwydI/B3dRrBs17HQGX/cowPgf7ZokWatM4iiWBRc3652xyHD2uYd+i?=
 =?iso-8859-1?Q?w7+MnIGzS9Q0QJpCNScXjUdZ5YM9mfsgnd67UzZ956B8Q9wk6pEIKE9+R6?=
 =?iso-8859-1?Q?p6F4q+0/uDqfv/uoYCHZ/ouhNJsXHQalrTFXdxlr9RViHSmsU3BcOI7Nr/?=
 =?iso-8859-1?Q?JhX6h+6BfAmzZOxNf86jseeomIoO5ZXPz0+l5/Fv8wic/zLwQmeqHFhYLw?=
 =?iso-8859-1?Q?EJ3XPdyrv0XGmoW7xVoo3LfHaJdWlR3ILp3sRf0iDFBWlWPSq2OoSfob8E?=
 =?iso-8859-1?Q?pLQy5SNtBbWdvzm/4Z0GM/A0NWEx2DKGoHA2UE9eDkomsLvF/lw/zzqHVb?=
 =?iso-8859-1?Q?aFHPwetVTzTrtoO6fXrOqw3pzAKHJrnlCaWnVtthVDAFMNiAzyBUA9p53d?=
 =?iso-8859-1?Q?VHy7mp6bFTSEqEVrb4nDw9xzF62Xt0NwDCJBNNyCkqVW3YToo1HV5attrz?=
 =?iso-8859-1?Q?OAd8TtCj4ozjevQYhxiFnN6Pgkvom8P1JOK0MTCWsXBZdJrM4tSp8jfhwT?=
 =?iso-8859-1?Q?yxx6DoGNg7FrjwC7MwSfER0r0yofIfl0wzonl4glp8MER8w6Xn7gik1yxP?=
 =?iso-8859-1?Q?1d+AXW4Nug=3D=3D?=
X-Exchange-RoutingPolicyChecked: Hl/98SBM/Z30FKRhZ+oLQJ7sLl0k2pRQToDA2/1i+ang9bFtoeaRAGjQdnmdMTRnvsbg/Jnq1bURu6hYYOU+o1Xn+IOywNydcZEg2tSwUXBPOQCyPR67Dm3Q6S6QX0wEzTv+PjWN+J3jyQGTp+5gktoDNkzykoePhjzBUaTymybJ+0Q0k/wYBau2a6YB0tjgSa+SEER3jheFAX6K85lEEgAxuPBwu/8Jr5yAf6BG38dTKpUAIgCW6AgNkR3mdFgy4epOWnQhWWKGP3Gjuad7ZhsT9eLvYvGUpUJmtXLRESFIJQ+fgYYQ6JIRSW7XMV2z2WhG0w3lzSnLc9zCFGqsGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef877bd-cbea-4ae8-319b-08deac7c9cf2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 21:07:14.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIFzB386ZXG2qNZLSJKJ5ThsJksTFnDI+f+CxtGKJHE+F8s9UWA8EwDoDvTT7foKW5JAK30vVZ0ozhZcET+Itg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
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

On Fri, Mar 20, 2026 at 12:25:31AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add type definitions required for Xe FWCTL infrastructure. Introduce
> xe_fwctl_types.h to define core data structures used by driver,
> including Xe FWCTL device context, per-file context, and firmware
> operation hooks.
> 
> This patch adds type definitions only and does not introduce functional
> FWCTL logic.

I know it is counter intuitive. Most of the times splitting the work into
smaller patches helps to speed up the review. But in this case here it just
make it a lot harder to review.

A single patch like https://lore.kernel.org/intel-xe/20250429073804.972137-10-badal.nilawar@intel.com/
is probably the way to go.



> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_fwctl_types.h | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_fwctl_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_fwctl_types.h b/drivers/gpu/drm/xe/xe_fwctl_types.h
> new file mode 100644
> index 000000000000..22498f2b2fd9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fwctl_types.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_FWCTL_TYPES_H_
> +#define _XE_FWCTL_TYPES_H_
> +
> +#include <linux/fwctl.h>
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_fwctl - Xe fwctl device context
> + * @fwctl: Base fwctl device
> + * @xe: Back-pointer to Xe device
> + *
> + * This structure wraps the fwctl subsystem device with Xe specific
> + * context.
> + */
> +struct xe_fwctl {
> +	struct fwctl_device fwctl;
> +	struct xe_device *xe;
> +};
> +
> +/**
> + * struct xe_fwctl_uctx - Per-FD context
> + * @uctx: Base fwctl context
> + *
> + * Per file-descriptor context for Xe fwctl operations.
> + */
> +struct xe_fwctl_uctx {
> +	struct fwctl_uctx uctx;
> +};
> +
> +/**
> + * struct xe_fw_ops - Per-firmware operations
> + * @name: Firmware name
> + * @rpc: Execute RPC
> + * @validate_scope: Validate RPC vs scope
> + *
> + * Operations table for each firmware type
> + */
> +struct xe_fw_ops {
> +	const char *name;
> +	void *(*rpc)(struct xe_device *xe, enum fwctl_rpc_scope scope,
> +		     void *in, size_t in_len, size_t *out_len);
> +	bool (*validate_scope)(void *in, size_t in_len,
> +			       enum fwctl_rpc_scope scope);
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
