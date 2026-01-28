Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC3DD46BFA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 21:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DBA10E0BC;
	Wed, 28 Jan 2026 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv8pW7d+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC7710E0BC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 21:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769634697; x=1801170697;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=POWjyAStPghrg5YUsBnZOTKMtrZMZphaOAnj7xny4lg=;
 b=Cv8pW7d+IPyqdupCmE/PrMTrAHBtYei02hpHCoNmcgs6C9oCSPmPufUD
 b/grZC0kTLwpEjF2YNSHRrbT7T2eDXCP/quOut1tmwcQxRA6Xtslfxnb4
 PHpZoJqL41GLlAkDTL9IZPsx3UiEmKWjUZzrHCGJLl5Z+/1Em6xnHPu6N
 VI+Q7TOenAV8eyHvcmumyK65cF9kcSpYxQrLpPVnQKvoxocH06TGLq2Ey
 mBKm3aUx792UFeDT8WG3L+69iJz2wh+fJuB2Gzr0ECnSJHPnQs0S+UBvz
 MqoNHcNIIFPIXgf2o3399AOEhtA4sTg9m6QKE/VNsWBEviHZTiG+XbXLh g==;
X-CSE-ConnectionGUID: EUdzqyVjQeSzcrSXM0D5UA==
X-CSE-MsgGUID: MhSOqr0qQeWrauQR2ixBug==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96323097"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96323097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:11:37 -0800
X-CSE-ConnectionGUID: QUnPe2CUS0G3yXWklABrNQ==
X-CSE-MsgGUID: dGIU96kJQJObmw8RXe6Vhg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 13:11:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:11:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 13:11:36 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 13:11:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwDCqi5W+XMeu8NoydHnTkYpm2rGF72seFYF/e9GszJR0wTf71dHKYimDNRvYsi2FPVpKf2LILjW8Vbq/eKlO3guf1bc7CMJVhJbFLxpfpK46jBbIlAtsttOi8fhkd8/Qt3ux8ZF0wwrp7JiPg+8Py+AgdVpwHUAkbGxtbxJ7HYM5DUcfOxrhqtp2p7KGbf2jNKAXn1hHZnTMS9z3rrhg3jG7aUNw6T/4KfrPSsF84qg5ILbAJoZzkL+2uE+8/HubN+Uix+S4zdzrKdhSg3yLukydiuVBompim8K7dG3DS6sMz0SpN+9uoFkYYbVwg/ZvLPR4JGWDSwY0LOqSTYPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pITpDK5opK+tn+7rDq1Ppmy/diF28hh04XGTNpooFQI=;
 b=CbR48CmQ3mPNB2GUw7fskQmp9oXHCzjXm0NWZhBRpLyDq3hOmnpPsGPVoFhNEiJeM4jD2mfueTgXWaArYEnOyhbgZ3PtbrkbEFUQBZ0bCC/LCh6PWNqXZOPxqZl1dV98MqnBUUJOMR/eJq5lNEsQW6h57haRI2m/W1MEkJjlgKsFJZqV/8QV+TzrIQs+kpTHzbyRJcb551VuZi1DxTj1fnrETicd+yyrUN9nBIGIhiwg2kwvMF+FzE+CprJRZhfjsBaoGyli75ltPvod640B5Tm4QtLJ3FthV7ZkTeC3F/q2wi4yDExG7NTxTsxVI1FjPuMiW1u1KeTm/vHwfhNIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 21:11:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 21:11:31 +0000
Date: Wed, 28 Jan 2026 13:11:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/12] drm/xe/mcr: Extract reg_in_steering_type_ranges()
Message-ID: <20260128211128.GV458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-11-d420b9c1a327@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260116-rtp-mcr-check-v1-11-d420b9c1a327@intel.com>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c5fe17-2934-4a7d-cb4d-08de5eb1cf03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnoBuhGo7hqUtXw1DgQaOVCGi/A0RNpE8UROJvX1ZyBNG7DsHMEf1gC+qyqe?=
 =?us-ascii?Q?u/KONasahVPLp2vlL3Om9QkDgeEUdK2PK4wQhDyZF/BuxalGOXFajztzXeL/?=
 =?us-ascii?Q?Z8V/LpASgU68JOCmBJD3hjYNGdQ+P+EwiH4Xkz2ALnAkX/2MZYMmu0OeuSos?=
 =?us-ascii?Q?Tx9pKjNPz7FhRKZA1eDFVLL2AdUYaslxS0xK95szdkQZwsqiX9cLWVDhNBeh?=
 =?us-ascii?Q?0ndoeeOXvGOaoUpELhX7hC9VMFMLP0O6QlgpCiwaMMk+cYSoOJ8a9MKrqTe6?=
 =?us-ascii?Q?5Rtr4PFI85AbDzxFVhRjvaA/+w8Ga5T3qHLV/6p1cMGZ8WMUrzfnwWiGlNvh?=
 =?us-ascii?Q?8u6+pWkFxZkdkvD9LBdUhwo85NC/b7JAq4+f19USgz/wJdwLdaRER3SJUBrM?=
 =?us-ascii?Q?6NZtU2ef63IEAdrmRQbbTKAQ72mWJKChiRFcMH029RfUlLbrjzMU1BmJK8nc?=
 =?us-ascii?Q?EFThkvcgwHf2mXbFxos3RGFuVq2WEmO34mLeCqd7M0Dxifv2BocuepfQZoKB?=
 =?us-ascii?Q?YeT7btr0OGdsCExgAT/TX2Yn+WLw6xfZrnma2EPyJMyJdMHgG5J+V2VCCSEY?=
 =?us-ascii?Q?AKc6jw+mT8ML6XkvprQD7auEj3M4g8JLBZZjbOpWxzdHswWMtFcJda21LMtj?=
 =?us-ascii?Q?e5MPjw/3kQrFD2p9UOUEJg1YfehvbHeSkCuvhNUZVLfdnq4vMChXwmKi54E/?=
 =?us-ascii?Q?msTGfjPYQ2okfb0LKNWqQWaH3B6on8366OVLo970Qxu5PtIeEa42yKjFslJg?=
 =?us-ascii?Q?/ZGGU+51d/QgO1hifvJKtYOFPB7XFCezVjBjZy7Raq3rPPfjSYqc5n5zAOoT?=
 =?us-ascii?Q?6ctTLA+bz9yD7fuE3B7t6GEKEuf9Zir7wrD8WkmbxqD9aVqNaKwbniKDZ5UR?=
 =?us-ascii?Q?HA6JG4W0R5tMCrumOVluLWgcezr5Q7ltOgcOl9Cej43JEvhkE01QhYG+TFBo?=
 =?us-ascii?Q?lP8IAIeANMRJ1rrXb9ACg8mO+nvEUyN6hhwr8r2O1fggfb9tuLH8Ex4/iNYt?=
 =?us-ascii?Q?/u4BDr4Ro8P785pVybQhActr6aCKBQyi4u+0pHuNcZfDySlTnjuO7PU2LGNN?=
 =?us-ascii?Q?2ZPKHj56Z/rHGufNIQx0+m/0GB1+bHTM9teOM8Q68YM7h8X3EBqiaSZsyMy5?=
 =?us-ascii?Q?gx9iunvawaQtTTntCvREBNln6WZH0ycMgBq4FkFcDMjn/kiX3QYm4wj3rimh?=
 =?us-ascii?Q?bom6udJ2HKsmiBXov4yVKZvFDSMTQX7RT7NpaXqIyVB+uy/pXTLLJ9IpFDqb?=
 =?us-ascii?Q?05P81ba5z19/M5NwLunbNzNL5ovCPGk2+vgxVNI+JPsMcuAdyyk7v22tYOzI?=
 =?us-ascii?Q?o1/wmBLpjpokNxgufxrgDhbAmdWkXBoVy1ki73nv+FFeXY0p+sTxZtX8qsnn?=
 =?us-ascii?Q?AkVhVSLAwvhg9RSdpleEPa0muRWZ8N9aJ2Xbe9yxkI3PDZgNdfwnhWg9JrwW?=
 =?us-ascii?Q?OMqAKi2gOe53cldEmErv3uj4e7NDLSyzzyOBX16/rlnJc+WCfIhhKzpDt22L?=
 =?us-ascii?Q?EhsTobbLnJGNhxblKrTN16zen5Nx9bWyJfZKeFf7YfJk9KqfTC17fqs0LWJ2?=
 =?us-ascii?Q?CiYP4YMYopCRHFf6VVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HDv9sTWmDFMFcwWGiQu24175RLmv9/KhCh8b2M7oqvUMWUQ9JBYVuDEtiN/6?=
 =?us-ascii?Q?yp+Y4efkfHImkv3DVXK95z54ENLGh4NotQ0gFDIlQT23Mh5CULC4LP4NezTd?=
 =?us-ascii?Q?kiU8maYGw6nLPJjDByn1l9tstmzOLQzCKkUiqbZplcRt70+76TIulH8LOviq?=
 =?us-ascii?Q?8MZe4YiLw3RE/8WPbdZ75bEIUpKDxF7A/AztsIn6RHTpsS/y+rxn0/STrlY0?=
 =?us-ascii?Q?oB0wc0a7H9xWpvA0KTbKDYYWAr6RNtcOEzSmKnCa5nyV1/OPtXscoyUtAU2B?=
 =?us-ascii?Q?Bclzpov3QM90nZ/cES8p23lC4kRrOHlvdyC6W5CKjQHoU6HfWX3w6UkLRGQ1?=
 =?us-ascii?Q?vQ+HQe1ewgKcZDaQeY+ednLtkYKDmf5DrbzBLTvMR+/0lQfah6E577Z6OGLz?=
 =?us-ascii?Q?FNHD79DkyfXRWVvR56lWYem2/l5vxh9H+fDVf9H5zYyWvbcUuHQLGU2jb5qJ?=
 =?us-ascii?Q?n7LFISVrfrqzGUk3b72+nZi/aeGoi9AW/HbY0lQpuVmOGlijPZzL/ggv2DLL?=
 =?us-ascii?Q?39oz1bohmmFiNcIYLE4hzvHWczqihujicj+Vn/qFEcEcAr5quBezMM/98iAm?=
 =?us-ascii?Q?LcC6fx7i5Iz7D6/WUTnKxEKJ5nuvq0uublhWElxKlfPWmccmEAkva1W2CaZU?=
 =?us-ascii?Q?vC40kFs2Nw/47CPa+O4gXCqlbcASWHDpcGjtNFEGowh0qdvKTyabZZEZO7pX?=
 =?us-ascii?Q?6wpEAQiqAdRUymF9dIIDWmoyLkHUIqen/foU0ay3qRzgdAR9tl2/cY8mjqo3?=
 =?us-ascii?Q?CU+5g6dd4OS+vETJ8QcwjXU9QqBuq8DsB4INHgTOP/6MOWL/Jmeu3rdp1tV9?=
 =?us-ascii?Q?0HFlXi+2TG5be1FKUPSIFRILY+QFBHUaeSV9amHmK/qwI/ZQKDPRfuEDL2Su?=
 =?us-ascii?Q?7Kw5EBVFUGaEApVVhrhQQiwWfh7g17jyKeH7jU4ibbWzXzxKMGMrKkG+nxUI?=
 =?us-ascii?Q?AtOETYrl0dgNKfHb/tPjW51d4s+jREXp8xxdGu0coaM/GTZKVx/Wns32RWXm?=
 =?us-ascii?Q?AKzuggYTzJnX0/p56jFPjh06WkYC4p1PLrhd6VEuD3skw8WSZfpFcYn14iDT?=
 =?us-ascii?Q?SJmb/jRYD/+X+grRVAtlqJBEi3kQuocTMDtPIWxblY7U4M1mVqv1/Mx0lmFV?=
 =?us-ascii?Q?w14aSfCTjC+qcCuiz6y121HKZdZI0AMvNAwPrr5+mmhv/WljczglKtnTLhuF?=
 =?us-ascii?Q?Bz71UFhSVsgz86CTH8mCtG72/VYexCpS7kq0Z20um2E0xMPxeSWT4btz3J99?=
 =?us-ascii?Q?TUkDzJ/MexV/Gn0IAqUYC5gv9cWyrag1AWUFlBstARRlZV4VHr0DmR3Wd0II?=
 =?us-ascii?Q?O+85WUxdHw4hM4uX8lobXV8QRnbBOAZosPZt8+coyGcLoz4w02HLc1rnXlDg?=
 =?us-ascii?Q?Av4I4f8A07MiyG2VB49xFddLDqf2py774yJjxVCpzBH32+3nb7CbZYaihUrI?=
 =?us-ascii?Q?B0b1ZK4R44bNiQqnHOWUVS5bLc9GeVj8fHHSrxcPFx0nBbhb+qrnUi5dJ7Uz?=
 =?us-ascii?Q?p1RxTNGdT5+7vlqTiI6vEbeo07b4k00Z+0xs82RaJypez1gS2rMIZlvmGaCe?=
 =?us-ascii?Q?ruMluNguB45lGsk2a/gn5FRJ1Mum28gnFexiHnB2MEDxqD5xy6zPLjyRt0r0?=
 =?us-ascii?Q?Y/z7yhQqtHJx01mxvgM/nL0Bfms+6pXhPEp289ODfhZVTc9iBlWudWfpr+rW?=
 =?us-ascii?Q?2tB6M5ZJuosZLoax7ZseOTIKtF2R2zhsChaOpTgszx+IgWZrOktj9QPeF3Ua?=
 =?us-ascii?Q?R0aCub+dxZs9EWm1L5WM+/y2T9jOFpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c5fe17-2934-4a7d-cb4d-08de5eb1cf03
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 21:11:31.0415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lk7Bbgde81SInRNvPGMhkEySzJk/+LIpt379JFwxiPYqdGXfBGCXHyDE4AkBoAYrmxVcgjWPbYxlTX9PF99T2U7OZgPVUFFz1whQy4sh/U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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

On Fri, Jan 16, 2026 at 07:12:19PM -0300, Gustavo Sousa wrote:
> The logic to check if a register falls within one of the ranges for a
> steering type is already duplicated in
> xe_gt_mcr_get_nonterminated_steering().  We will also want to use that
> same logic in another upcoming function.  Let's factor out that logic
> and put it into a function named reg_in_steering_type_ranges().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 43 +++++++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7c1fe9ac120d..e7eb3c6da234 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -609,6 +609,20 @@ void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt)
>  	}
>  }
>  
> +static bool reg_in_steering_type_ranges(struct xe_gt *gt,
> +					struct xe_reg reg,
> +					int type)
> +{
> +	if (!gt->steering[type].ranges)
> +		return false;
> +
> +	for (int i = 0; gt->steering[type].ranges[i].end > 0; i++)
> +		if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg))
> +			return true;
> +
> +	return false;
> +}
> +
>  /*
>   * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
>   *    will steer a register to a non-terminated instance
> @@ -630,30 +644,21 @@ bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  					  u8 *group, u8 *instance)
>  {
>  	const struct xe_reg reg = to_xe_reg(reg_mcr);
> -	const struct xe_mmio_range *implicit_ranges;
>  
>  	for (int type = 0; type < IMPLICIT_STEERING; type++) {
> -		if (!gt->steering[type].ranges)
> -			continue;
> -
> -		for (int i = 0; gt->steering[type].ranges[i].end > 0; i++) {
> -			if (xe_mmio_in_range(&gt->mmio, &gt->steering[type].ranges[i], reg)) {
> -				drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
> -					 "Uninitialized usage of MCR register %s/%#x\n",
> -					 xe_steering_types[type].name, reg.addr);
> -
> -				*group = gt->steering[type].group_target;
> -				*instance = gt->steering[type].instance_target;
> -				return true;
> -			}
> +		if (reg_in_steering_type_ranges(gt, reg, type)) {
> +			drm_WARN(&gt_to_xe(gt)->drm, !gt->steering[type].initialized,
> +				 "Uninitialized usage of MCR register %s/%#x\n",
> +				 xe_steering_types[type].name, reg.addr);
> +
> +			*group = gt->steering[type].group_target;
> +			*instance = gt->steering[type].instance_target;
> +			return true;
>  		}
>  	}
>  
> -	implicit_ranges = gt->steering[IMPLICIT_STEERING].ranges;
> -	if (implicit_ranges)
> -		for (int i = 0; implicit_ranges[i].end > 0; i++)
> -			if (xe_mmio_in_range(&gt->mmio, &implicit_ranges[i], reg))
> -				return false;
> +	if (reg_in_steering_type_ranges(gt, reg, IMPLICIT_STEERING))
> +		return false;
>  
>  	/*
>  	 * Not found in a steering table and not a register with implicit
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
