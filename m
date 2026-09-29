Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141CFCA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDED10EFEE;
	Tue, 29 Sep 2026 18:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXrV4ehD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31A10EFE8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790705067; x=1822241067;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pNE7o7SKaSaz0bKd6K0n9QH7BejVlPscVCWlcVZH3ac=;
 b=LXrV4ehDxzwDmI4tOFaoIT/FEr9zBUP4ez24+OV9htNErq5cu5bq8Gul
 i/V+L8txyk0JKwaQrgidR8qfoirE4AO/u4gIPHKeL2HImNDAaDysH3V4l
 NOq6wTlhDzbqUqchYc1OVKily4tEb1l46MOVWXw/1/deGKUXhJCf2LdVz
 Tg9WlOgk7x1xqaM84ScMBya+yrjzK9sc4BbNKDCkXrdWPE0Jh/blGMTVR
 7KnVB5ne9/4oVAOGX7QHipPhniwFpiejN1Ki7fuuJC18q3T8qKwq1Hk5O
 7hEQo/tq04pMCx+geHPjE+IC00aYmo1BuWogFo0+dJ/g1rzwSpEwn6VsP w==;
X-CSE-ConnectionGUID: CGM3tsgLSF6rn9S+19Yn/A==
X-CSE-MsgGUID: drHbk8V/RWesf2c2J1LaPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113218838"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="113218838"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:04:26 -0700
X-CSE-ConnectionGUID: IM9tZGY5T+ydyIzkqOmZWA==
X-CSE-MsgGUID: BhyIvumLRXmDAsmSNlPiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274651904"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:04:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:04:25 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:04:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLAjp4/x1WRe/Bv7JzTszS9aiDPpOnn1Ol5TNZg9SxOGsO1aIHmh2/0a1bQPQoAQpsMSNO9V3k0wLVZSW8ny1uQ7AANm9kU3Rk4CocjvhcTIGxG9E8ZaOQS53LyRyGvjs32JZytAonbZdh9aL+l7jptwdnWlpehM9rpOkkkG9F07Q05ngi4Cbf85AI12FuOY8VeVN3BFtEALT7toOq2RpMqdq8pt05amO4R3MxJpBtY6Gw3sMkFbIciad6Px7sEzChb4vt+0b7aIZ+H1qhCdJDthO9bTE2BmJPBJbkvROtyOofn2J+DxEoHxUVsK6wpRYBKI9zlfiJsqF2x7RSiuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpYDsMgxXChL674xecabzw4+naaMk6qUMeGFd5VaYno=;
 b=IuyNe0ycX2VU4/hJZkxOoawVO/LxGX0Uacr+prwrw96xZKaLBAMdYOAsJfaWxS90fHhEdP88xSIWmGpHweYbv+Ws/QD7Gc+Y7Yk6duOQHkeB61G8OjH6dCg8ZBqrWfiGyw9JNqbyGrF92oxYVTk3FgQM/jrCGIPgI1yohojo2RzmbjHTAkQhfhI04Sz/vKU1Q2Vp9kOqr+YsOxUMcCVJNQ/a9It2YXeIGnqwXjSmKotb7TJioibhiE1yQMPuoybxi3kGDrFtWrJbl6tw4VSgOv+Vhk5v/0M/P2qi/biiKPPSukI6GLSMgDsB0k8LvX5hU8FmEdA7G1/Jzf1kbxegDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Tue, 29 Sep 2026 18:04:20 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:04:19 +0000
Date: Tue, 29 Sep 2026 14:04:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 10/13] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
Message-ID: <arv9lBb85GqnSxdi@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924205429.2846256-11-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6d206b-8a65-4aec-63cf-08df1e541538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gAvkuC5gGDC3gxbR3Ek1OtK0ihfZ0I6KzAnjq4FvpGAo98NwLpUnw9vhJ6ioFzm1s8Vv+PMUHggfHyAB53g52zXdPd5IyRj9mv06AUbr+EceKYNjdZiTBRreV1cEb0rfFU/C1LzueCa4USPp45xYQPWek45Hu5q2Qjezg/gIaUr/xdkNDqZUiIwKdU6cJTTtKZqOwBfasRoqTwCSb5vfYTGqOl8mT9dfRhOBkLBP2Go8KXU1nr1f4xrr5guk3oRdr2LJQRqsWFdmTcpGBfn1z6K0QKgeSrIWrPNmpdBM5Rzu3Vt1nh9sgn3Xb46VBGln/lbosMYtMiaJkshiIrWiKDoHPo4u9kyiLjmg7dRHycR8Otogxf/84Sb44kqGzN33jee4U/ti/Uw8kZnQ6Rl5JHuWgItA00DeR6rUhti6OsNtym9kFWXoYnvj66ewVK0V3VhdnHKq7Wol/u57p6J15zDBN6NtPR3ln3XEUaHE7Mo34yhWXAVNVJB+foOvoFua+JJxLnbr5uk8KeEO+xPb8zmMueYaUceVTZQw7gMhVlAox9ikWWcOhyT6siEVPSf9dIAQY/X/xybA/4JRdOa4jZhWo43+oaTbtzqrVZYhViKymUl+JsHs3BgQjFcZrJd+9agPXIRrNKIesy8b47LziEewmCz5FTtSvf9Eywuzotk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Qsye60JANZE351WESNWH4mFQasNyYpQ5C+YakGNm4kNxK676CBXj84a6Di?=
 =?iso-8859-1?Q?3Nv23s+f9pEKS8YLWS5tLu2JKpcBNBJtVNiyJhHaNpmabTSJt4SGSzAUcp?=
 =?iso-8859-1?Q?L31fxP0CUPOY2AFK1T5Kx8gHKXa+T1oB1/OjWmj1uHPqAD2B+NZhFyzA3w?=
 =?iso-8859-1?Q?yjNAs4BY3M44nyooq7YQ3ecq6vrEpzZ+ELQSuiC+X7kRkTrxJqIG71eMNx?=
 =?iso-8859-1?Q?WjhyQ2bVE8/MfM0Qr3w0S7AMOgiOwRD0dbNzXqWqffwMfdX+2Cb/0+K3gT?=
 =?iso-8859-1?Q?tGdJvgJ+StXdjQzSzJBywQ07vy8kIZ9eCThoqrHDwG6cLsKAEpQm9Z8tQS?=
 =?iso-8859-1?Q?TPJGmolb9/wtFzZO+1135/xD+J19zQKl335h74Xn8fYKvEvOLJCncQCUaA?=
 =?iso-8859-1?Q?XnKhQ21wH2fCwYGKKm1Apw+vf64iYSgaVD3fNINx/JH29XDa9fnqpmmr9z?=
 =?iso-8859-1?Q?/dnSw8X9mhQPZbVg/vzuqtspVhxMSt+3SLRCvmElnr8o2AQ4Dk0XjlXXit?=
 =?iso-8859-1?Q?3e9j3CQ3ui/qBJkQboVTVyktlbZ1XR6xwd77WLWFjW9fx+SnW9JxYlhi0L?=
 =?iso-8859-1?Q?rQPdxgOrP1TiawzA/VtNz6+km0oCiZaECHAFAi9X6ZLigPC3tCqWBD7BfC?=
 =?iso-8859-1?Q?tNXyAMK/znz1Cec8dBJYywUiMsnDRUmHlmmN8LAgvy4mCdhQUX0jOn2Pdk?=
 =?iso-8859-1?Q?bTpBywSCR5bvNI0qwY+QVAeTP5OFpgaSWrnSjNIrct9y1nM+mPhRnvw9No?=
 =?iso-8859-1?Q?jiiJYrmeQ7PI/VfqRUdgiyUR9Eanh5iXXicoyS2g6Dz95T9kJuFTgEq11a?=
 =?iso-8859-1?Q?X4fcB5WAP+RMh2QTPdbfAK7tklFHB2JmeS5enZm9nWq5t1zZf9KnD5YL4C?=
 =?iso-8859-1?Q?EnAQd0o3GaVMZZlx+LlpZiCfAxtnvpVNlcCasTjRPUOPxTp31hX1lSVkOh?=
 =?iso-8859-1?Q?N2eUi5lkoKzK9ppyfNUsCMSR6SUrQTM0+0l44T51fqLc7xMi3FlnFSzhCT?=
 =?iso-8859-1?Q?Zbfq8bxFrUN1IVP0YbnfQAhvL0xiC11491T+LtpSzBme+Fdry296u9iILm?=
 =?iso-8859-1?Q?oZMtEfWmkHtoXKu4g4zD4ZjuQydOQ8JI5rS4j1+D1e3uidmduEWRJ/E9tF?=
 =?iso-8859-1?Q?yPYGYIPae5MB63DTsJzWKyjrtxmRxiGQV0S8rLZNpD3AbryPcJB6Ec0TP4?=
 =?iso-8859-1?Q?eXN0ZtEm3yq7UQErKPp2Y4c/tkpSfW7gCSikcCOV8sITns3zfPsPf7jJjT?=
 =?iso-8859-1?Q?q+6yKBxmw9ddDQH0r30zR+b72yX98sl4M9wEh70YIVqA8/aZnQ+gnJdEgr?=
 =?iso-8859-1?Q?hMAhLPaogbTWTCjTDSeutwAwRFa1N8+02Ocoovh2skAcTu0bAlhhAPoo7k?=
 =?iso-8859-1?Q?DJW3Ab02UW8zB7GXRdlfZdUo4p540MjX4/DMKvizbcMv3iBTcHOetPh6ph?=
 =?iso-8859-1?Q?05PqyHdaHB/LHEmFA+xBZvqtLGfHLwnfc3TgNbvEd1DcEMK8jQvtfVKGoY?=
 =?iso-8859-1?Q?trNvLZMnixgcPKb2Hcs/iP0W0Tg5JwVzVf2tk2JbeVYfpMFKjOx5BxdbcG?=
 =?iso-8859-1?Q?I9HmARtHAKu60Pa6YSf+Wj0Y7uVoZX2yUMgIY2CFJQVsjH7ucvzHheAonC?=
 =?iso-8859-1?Q?OEgD+1b3lm0KuXct8rKJiV4FgIfNMA2iwklDw+0wpxn+gCC7JxdhGcsnA/?=
 =?iso-8859-1?Q?3d11N+G7uiHa/22YRKYvQfXnML2iyOjjK3G9FsV9NecwlodXBXtV1sBBZM?=
 =?iso-8859-1?Q?Ebgibd0HSHOV63/Upk0C18M26zgBGxXOPbWjSbdPubsSynICl9GdRsMQ3f?=
 =?iso-8859-1?Q?/7g+sxNeY8nWJD7JzwsdOJ9G6xF0LEw=3D?=
X-Exchange-RoutingPolicyChecked: YzYYcDz2hRQ5NEXI8wE9qlkkcwlpjxmymkjTIA57ZPlBjhTHizD1+sO0tnl8LrDGn6sFd+wNTOy8dOBWjB+L4T+pGEtk68UJVf0G1MzU8NTvLBZk8GItUdEwyf+JcUorJKdGIvmaRKiizeLfy9/X9p8WPBtvNTFq+uiKJig0LGAn21FN7uRybH1XVkgLxAAmPOfFiIsOZTcNOzoEW8bUmuUeresRnWiwsaQAbCS5AKqFExTqAM9wM4C8hQYgISGp4CLai1GGFWzNmO/AO2GmCCBT0Q6RjoIDUKdc0PH0iwH/VzppX3chxpbowpUnyq+eWMVl7lS1dIos2H/UuPMZvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6d206b-8a65-4aec-63cf-08df1e541538
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:04:19.7434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsDQEX9wBf/luFEtQ0Mmo2EHjvBWyqQCHxIygXzHfpTDdOxGUUHtwbOta9x1/65tyqv0eYDkCsu6ZcA86EhnSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Fri, Sep 25, 2026 at 02:24:26AM +0530, Karthik Poosa wrote:
> On CRI, derive the number of available VRAM temperature channels from the
> CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
> VRAM_CHANNELS_PER_MSU channels.
>  
> Increase the maximum supported VRAM channel count to 80 and use the
> derived count to control VRAM sensor enumeration, channel access, and
> VRAM label allocation. Add a has_fixed_vram_channels platform flag to
> preserve the existing fixed-channel behavior on non-CRI platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2:
>  - Use the highest enabled MSU index to determine the VRAM channel bound
>    instead of counting enabled MSUs. A sparse mask could expose channels
>    beyond the allocated label array, leaving the label pointer unset and
>    potentially hanging during sysfs reads.
>  - Also return an error when no temperature label matches the requested
>    channel.
> 
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h    |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c           | 164 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pci.c             |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
>  5 files changed, 154 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index a969661f0c95..d9e4847dd68e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -28,6 +28,7 @@
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)

can you please share again the ref to this?

>  #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
>  #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
>  #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 87554605fa41..8a1ca65f5665 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -184,6 +184,8 @@ struct xe_device {
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
>  		u8 has_fan_control:1;
> +		/** @info.has_fixed_vram_channels: Device has fixed VRAM temperature channels */
> +		u8 has_fixed_vram_channels:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 1b2e2fbe43c8..0422db647d11 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> -#define MAX_VRAM_CHANNELS      (16)
> +#define MAX_VRAM_CHANNELS	80
> +#define FIXED_VRAM_CHANNELS	16
> +
> +/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
> +#define VRAM_CHANNELS_PER_MSU	4
>  
>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
> @@ -48,6 +52,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>  	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
> @@ -144,18 +149,22 @@ struct xe_hwmon_thermal_info {
>  		/** @data: temperature limits in dwords */
>  		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>  	};
> -	/** @count: no of temperature sensors available for the platform */
> +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>  	u8 count;
> +	/** @vram_count: exclusive upper bound for VRAM temperature channel indices */
> +	u8 vram_count;
>  	/** @available: temperature sensor availability cached at registration */
>  	bool available[CHANNEL_MAX];
> +	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
> +	u32 msu_mask;
>  	union {
>  		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
>  		u8 value[U8_MAX + 1];
>  		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
>  		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>  	};
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>  };
>  
>  /**
> @@ -269,6 +278,14 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  	return ret;
>  }
>  
> +static bool xe_hwmon_vram_channel_enabled(const struct xe_hwmon *hwmon, int index)
> +{
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> +		return hwmon->temp.msu_mask & BIT(index / VRAM_CHANNELS_PER_MSU);
> +
> +	return true;
> +}
> +
>  static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>  				      int channel)
>  {
> @@ -281,14 +298,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return CRI_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return CRI_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>  				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_BATTLEMAGE) {
>  			if (channel == CHANNEL_PKG)
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -798,6 +817,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,

I was wondering if there was something better we could get here...
and LLM suggested me a reduction from 80 to 8 lines:

#define TEMP_CFG_CARD HWMON_T_LABEL
#define TEMP_CFG_PKG  (HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | \
                       HWMON_T_LABEL | HWMON_T_MAX)
#define TEMP_CFG_SENSOR       (HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL)

/*
 * Indexed by &enum xe_hwmon_channel and zero-terminated; hwmon derives the
 * channel count from the array contents. Sizing on CHANNEL_MAX keeps this in
 * lockstep with the enum.
 */
static const u32 hwmon_temp_config[CHANNEL_MAX + 1] = {
      [CHANNEL_CARD]                          = TEMP_CFG_CARD,
      [CHANNEL_PKG]                           = TEMP_CFG_PKG,
      [CHANNEL_VRAM]                          = TEMP_CFG_SENSOR,
      [CHANNEL_MCTRL]                         = TEMP_CFG_SENSOR,
      [CHANNEL_PCIE]                          = TEMP_CFG_SENSOR,
      [CHANNEL_VRAM_N ... CHANNEL_VRAM_N_MAX] = TEMP_CFG_SENSOR,
      [CHANNEL_MAX]                           = 0,    /* terminator */
};

static const struct hwmon_channel_info hwmon_temp_info = {
      .type = hwmon_temp,
      .config = hwmon_temp_config,
};

static const struct hwmon_channel_info * const hwmon_info[] = {
      &hwmon_temp_info,
      HWMON_CHANNEL_INFO(power, ...),
      /* unchanged */
};

can be done in a follow up though...

Everything else looks sane... I just need to double check the regs again...

>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -812,15 +895,37 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	u32 config = 0;
>  	int ret;
>  
> +	/*
> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
> +	 * set the count up front so those sensors stay visible even if the thermal
> +	 * mailbox reads below fail.
> +	 */
> +	if (hwmon->xe->info.has_fixed_vram_channels)
> +		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
> +
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
> +		hwmon->temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
> +		hwmon->temp.vram_count = fls(hwmon->temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel bound %d\n",
> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
> +			drm_warn(&hwmon->xe->drm,
> +				 "VRAM channel bound %d exceeds max %d, clamping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> +		}
> +	}
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>  			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>  	if (ret)
>  		return ret;
>  
> -	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%08x val1 0x%08x\n",
>  		hwmon->temp.data[0], hwmon->temp.data[1]);
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> @@ -1025,6 +1130,14 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  		if (!xe_reg_is_valid(reg))
>  			return false;
>  
> +		/*
> +		 * On CRI, VRAM channel presence comes from the MSU enable mask
> +		 * (applied in xe_hwmon_get_reg()); the temperature register's
> +		 * 0xffffffff sentinel is not reliable for VRAM channels.
> +		 */
> +		if (hwmon->xe->info.platform == XE_CRESCENTISLAND && channel >= CHANNEL_VRAM_N)
> +			return true;
> +
>  		reg_val = xe_mmio_read32(mmio, reg);
>  		if (!mmio_temp_valid(hwmon, reg_val)) {
>  			drm_dbg(&hwmon->xe->drm,
> @@ -1042,20 +1155,31 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  	}
>  }
>  
> -static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
> +static int xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
>  {
> +	struct device *dev = hwmon->xe->drm.dev;
>  	int channel;
>  
>  	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>  		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
>  
> +	/* vram_count is known only after reading thermal info above. */
> +	if (hwmon->temp.vram_count) {
> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> +						      MAX_LABEL_SIZE, GFP_KERNEL);
> +		if (!hwmon->temp.vram_label)
> +			return -ENOMEM;
> +	}
> +
>  	for (channel = 0; channel < CHANNEL_MAX; channel++) {
>  		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
> -		if (hwmon->temp.available[channel] &&
> -		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		if (hwmon->temp.available[channel] && hwmon->temp.vram_label &&
> +		    in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
>  				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
>  	}
> +
> +	return 0;
>  }
>  
>  static umode_t
> @@ -1551,8 +1675,10 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> +		else
> +			return -EOPNOTSUPP;
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> @@ -1580,7 +1706,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>  	.info = hwmon_info,
>  };
>  
> -static void
> +static int
>  xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> @@ -1648,7 +1774,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  
> -	xe_hwmon_init_temp_info(hwmon);
> +	return xe_hwmon_init_temp_info(hwmon);
>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> @@ -1677,7 +1803,9 @@ int xe_hwmon_register(struct xe_device *xe)
>  	hwmon->xe = xe;
>  	xe->hwmon = hwmon;
>  
> -	xe_hwmon_get_preregistration_info(hwmon);
> +	ret = xe_hwmon_get_preregistration_info(hwmon);
> +	if (ret)
> +		goto err_null_hwmon;
>  
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
> @@ -1687,10 +1815,14 @@ int xe_hwmon_register(struct xe_device *xe)
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> -		xe->hwmon = NULL;
> -		return PTR_ERR(hwmon->hwmon_dev);
> +		ret = PTR_ERR(hwmon->hwmon_dev);
> +		goto err_null_hwmon;
>  	}
>  
>  	return 0;
> +
> +err_null_hwmon:
> +	xe->hwmon = NULL;
> +	return ret;
>  }
>  MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e656fc012902..fa32436ecf6f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -416,6 +416,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_fan_control = true,
> +	.has_fixed_vram_channels = true,
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
>  	.has_mbx_thermal_info = true,
> @@ -794,6 +795,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_cached_pt = desc->has_cached_pt;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
> +	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 0041ec5676d3..4d1048ca7abe 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -42,6 +42,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
> +	u8 has_fixed_vram_channels:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
> -- 
> 2.25.1
> 
