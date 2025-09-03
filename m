Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F364CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9010E94F;
	Wed,  3 Sep 2025 21:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLnhYOEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E810E94F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756936762; x=1788472762;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sCB62q4svmTMoZFX4RnmZbegQidUiwrkMegMR//WS28=;
 b=eLnhYOEyO3cyY9EP9jCHT8RNu6/piU0RAXwAenLSVbSJlDUA103z4NVZ
 KOqwZVcNKj0Px57XvH/0UZjMA99o370wVY+7uwlwtXvbv/IXArs5GxsWh
 J/e0LtpFr7M96oLF04pgAl4/elMpcwXti8R4+5yNz/QzU0U4a5htl1Ncj
 gYZmz0m1SHwcmRaSgt3UmCEj7mbsggH4lXez/CJe+oPoOzvSessqq8mRB
 L+LEKIyhIHxVuUQDh49fCEE60GecB0WAsmDrpH6CHgfI8wfDZJGuWyQVm
 NqqurTXu1mZ3IhZpNuuFHveytrJGysPdyQoJd7f3X+EKvs+duOCmq3ndr w==;
X-CSE-ConnectionGUID: leJJyC68T/6MnUofulae5w==
X-CSE-MsgGUID: qL6P4oKXTj6tyiKVLP42SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84693157"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="84693157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:59:22 -0700
X-CSE-ConnectionGUID: mJVqggegR3yVtRnD9R+TaQ==
X-CSE-MsgGUID: KMasoKnFSl2CLCL//Ser6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="176061976"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:59:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 14:59:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 14:59:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 14:59:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csw9G1TO1YWZHJtX/ghsRgNNDiUrz57BTe2bLIxwsRJgZntkSnM/6UUfNMxjWkhnK5FtQXRhuM2Ou4WKGPhqbCJPjt0L/FjzlQH3O1Pegr2IwEFbrfgERbGgoCpLrKRQUm3RbHbv32YZf2s7FbMWIzDm/xEA0yg44W4f0VZ1Mh09xY6tPbD7FSV/PctUEn/85l4UyZHzU8ACN2vkGVr2e72SyApcbKgBNroaC5Z7FYEAANNMmP0O/pQ0eKItRbKqXWBawdOgsykdZbJ3WEkGGjiSu68Jl0fwi2r/dXGEVTojDXiU3Efqk6m5AtxfQ81EktA8/WQJ2Ul8FyNU+9YWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMmT+eMonBBNRgnMWidOIBuc9Q6hSuf/U23oWeAzOkY=;
 b=J7nzRWBohacdCB1B492joo9uQew1PQMllyZVQFOvacolgegOnGzEOx8t9v/bmE11Yzt9GVa3rr8vyc5nw/3K0FVQ8adVqcE/kfEQ5anGeunZGI1Fxw9SP09q+klA3dSIKn/refvlshLe4o4pQepR5XTdJBz1ae/TYzdFnXgk115/dw2PCdsyWef9odpWb64kvVJTRo3f/POXksmyMalnQJ+KdQiwSUyKi1Ll8phMDVwvEDJOybo8Wa/+AdSjTETmcwgB6Ihy8mza6njd57D0iaq/HJqgIWoBoeQP3ArwVcvtqPa5c3wEVt1qtfIufjo9nVNdHdZi+GP0SpUheYZxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8010.namprd11.prod.outlook.com (2603:10b6:510:249::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 21:59:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 21:59:12 +0000
Date: Wed, 3 Sep 2025 16:59:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/xe: Keep xe_gt_err() macro definitions together
Message-ID: <sae5p3cztqtjarqa34ftykb6hitomwcpdbftu7w5nmdv2b5ekf@msyhs5un4lyj>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
 <20250903213712.6364-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250903213712.6364-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d7ddf9-c9b5-4f5b-0b1a-08ddeb351de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJGhl2QibZ55H6A5Wsrhh9rVEiaRTn1w0L4oF7tlFCaBujoQ4QHb7FmhvRmo?=
 =?us-ascii?Q?Wm36zBBOPZJZ/xZCCzaZ1wj1nI73iwxnYhkjNJNnr3ob8nOx57WXnCSnogb0?=
 =?us-ascii?Q?YcIm/Uohit0/RPrhoTuU/TCG8NPXtkIB7CfoVUJU00o6XC9BS5BWpj2MdBgQ?=
 =?us-ascii?Q?irnuK6xgc8N/0cekwsgqwp1KdZZjK2r1dXjic8dsVonKiEh7xsCN4wPZbqtX?=
 =?us-ascii?Q?jC2NwcsGTHpPBet808azYasTiRgsoyszIYuTPsDjhr3GGILD/9eRFac/BvD+?=
 =?us-ascii?Q?6BILFE/mv/G8jrO/JYhZMwPlE1Ma+HFhC2tyMVmD9nC/e2lHa08Y/xBbCetQ?=
 =?us-ascii?Q?ted+buQaf7EtOz8K6VJwndet+ZPc0br0wY30o8tlHqHMnIUFjqFDX/Lw/VZE?=
 =?us-ascii?Q?Y2aq6WH/HVo8k17E6THUDy0Vt0pXGT0iQlzTvwWL6We+VTzTASz25seeBKow?=
 =?us-ascii?Q?PLUPxpJKDVY9PFg7u0FQeLwDTG1XwqO8IzD7qqCESwT0Gssw1vPr7ltI3g6+?=
 =?us-ascii?Q?Zc+TqJP0YISY8j2iDpk2CmPIcdLQh+PF2fdeXwaJMcCAdmpjBzm2svwxXdX2?=
 =?us-ascii?Q?Gx0d4E31jzT0HNaHggViTD6VkTaBWkfWgoATp6vEEu0Jg7Y1CEj9Lc+P3ILR?=
 =?us-ascii?Q?8/X45MtOJIC3X5vCUBtg4aHdzahoCQCTnNgj8HD8XO80+efsH6sePQ4b3XiT?=
 =?us-ascii?Q?+4oRTs48aQ0tcFUTnTbiWJ/8gJ/RhHqE20SEe2vnx93BHbDBQ0dzhPkNhqiN?=
 =?us-ascii?Q?zDvH42BEGZXBOZ+V/ZWiUwxBjH0n4hq6WAK2Vq35NrbmdQkVsmJcUtIFlwUQ?=
 =?us-ascii?Q?jXUsld4p/s1G5bFOSb70UA2LmnyQZuVRSH4/ZJ55aGNSEUgd2vYpSGIay2mO?=
 =?us-ascii?Q?qsBIWYnH6WU3r0oUhjpVfz8/zdiAN5MjRdxviFFT/R3hubNihaUOEPyC6XfX?=
 =?us-ascii?Q?u60SdduUdnqaJJs4k6Uyi+3+kZGBwDhvlINdBimoUu5WUyddd3Mbmvhpm3zx?=
 =?us-ascii?Q?JEPlomZCsmWzVy0pMdjdYkO+JGnTQ6Z1YgAOkUMZndXnKok5UZhf78RN4Ko2?=
 =?us-ascii?Q?oPa7JQSxABAmf2Doz03FdY1thgy2TD75MvFP4VlgCZOTNfEkkvyDoLRDSJd3?=
 =?us-ascii?Q?x9iC6zVJmHcW4W5aEhhglXiTH63ExONXrj/Hc1ZPj9QxCFd2xIQ36f0WU2wj?=
 =?us-ascii?Q?p8r4gzUuxwn3qrL5SWPcVZY+Sl3VPE8dTnsbdRLP1NOS0W4l4+nUIcDjaduL?=
 =?us-ascii?Q?eNjGkxoPuu1GhZHqu1ga/IIrke5wKrip9Pv8Yj8B7ZY8i6TxcTAQtNwcRLYL?=
 =?us-ascii?Q?UZOngiLTK4ibf522HtTnSnnFYXiQ1xJCRAZIhfzlKYbFAkZDe2I4NsZpywUg?=
 =?us-ascii?Q?9WEiPLXme02d0hw5uPEYDihW7Tz9a31NZSEyS2ac7W/6S865aUDxb9ck7cqF?=
 =?us-ascii?Q?dBDvnz6PDb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbTFN9wHXXm0UY224zjDkGCMELeYV3TKhqQNMnvL5SLvFlJQcPNAqebnP1S5?=
 =?us-ascii?Q?WRLtG1YGdN/ul3wFhOMc6w0tmbCh/ZLlpPinyCbFdmrFQ6wzSnuf+QsccJiR?=
 =?us-ascii?Q?vbybZPmPlDtjqSPxMmCfS+2jSkiRMnrEiWVTtWt6ZBn0pi/HDmCRUeZ9dbeZ?=
 =?us-ascii?Q?5PqP7O2HuxMdSulZFWlRYgYBRNAQxfpxOoDLhourh6OOT7DMohVRCeOXS+DK?=
 =?us-ascii?Q?AXJqrShm4Zezyi1hU0JH20o3Ziiy70PpQ+4N8XZfgVjKGUj77rZYxnEoXDYU?=
 =?us-ascii?Q?1Gn/IpauFutk2qel2W7T6PI9Sv/sxYWz6IPJnuhAlc0zVqEu8mKCShftphF9?=
 =?us-ascii?Q?4gDnAK8t80eOH6w6m+GVFliX+5hca2Dsch6S+yvlUdk/u0WRzmA4HDtLN+mr?=
 =?us-ascii?Q?MjOS6DBL4DhixUanxkVDpnC7UgDjXmcCjmB10QJ1ZY1SIvm+h8HUHVAtgFyW?=
 =?us-ascii?Q?Cd2laqaIKnvrwOTWwcGOQ6v5iEdfascGBoVgVQ0fUsEY/8cF0qEJB9ab1WuO?=
 =?us-ascii?Q?e2r4Z4uESrnKfUuEtGKyY8uM/utmRJxGnGYOenuabiED1Z44rNLGvEc1eQ+L?=
 =?us-ascii?Q?3magrL76SVK0GKYzgT9BxZOf3+PYz0En6wN8FdVj51WFC6kUvVXuJFY5IJG9?=
 =?us-ascii?Q?8Rlp6UPSKjvZCCRSIJSb04BLWm6QEiwZh6ByHfNcX+47Ucp7NAw5eC9HAxTc?=
 =?us-ascii?Q?iFwqf+0I7n3+729YFF4m/3I4JZ2NX+C8p8ESkV86zZc6raAeGDnTslTt9/3u?=
 =?us-ascii?Q?XiyySC0f4FzZw3VGavbSdAnVQpeBAB43So2WVoRYVzC5sEduXdJPn3CEs31S?=
 =?us-ascii?Q?NXIDcUK9JxrbmdTLPpDkeMfTgWMtlpXBP+MEFssJD0jsypoIagR0vcDNNTDO?=
 =?us-ascii?Q?LK+r2+Idfhc+D1mVFePoMSHhKX1pcqd1BkTpaiSNA0hyVLqDPC02PAy4carD?=
 =?us-ascii?Q?tp01UyQ3Hn7bz+A6C88W6y0OBmBM8Xkv1RaOvJnIiQZ3RdoBRUAVYf9dJAko?=
 =?us-ascii?Q?aP7NsJNKwGRcWjjTWPa57t4AuMy7V6+rHL9uwQOjqrKDWwX+FDGELKgsXAs/?=
 =?us-ascii?Q?Lrt6b+pGWWeYC61pyoeJ7Hg3yiyJGKFYPb8ZqId62yqDZFG5pBTuOgG99bxS?=
 =?us-ascii?Q?evSSTBaQhzMgEbwB9YRHgygE4ivLyqwhvZOIt+W3+i+ircXBbQc6RrxSVt2E?=
 =?us-ascii?Q?1eJVthdsBFCyOmuZ18HSWcVQS286wsdhjdaAE88s+ro+XnycQBEoxZ4J/ssv?=
 =?us-ascii?Q?w1WLKMvfbrGIAnnRlk4hoGca5DW4ON6jR9flDsm+YoleNIPxJwO+KMbXKwv+?=
 =?us-ascii?Q?fV860bYCP+Cjpklz363b94aI/aNbDVPxdATOLroRKTuBIc0KGB6IuMxJRDgb?=
 =?us-ascii?Q?0Toew1tKRkVo5AwURVEO44hmk6gIbCpnYta9wzPFhx/cg2NoV/u6gLHnsthi?=
 =?us-ascii?Q?HePeBt3y1nM/vqozL4fy+eLE1NQyxn8xtND6bKq9ci0Y6NKN2Q/L/RCstb5r?=
 =?us-ascii?Q?XA/Z/RVZaRLoYrFsNnHOluHbEi+MAbm/KipPdgm0ewmxymzJIh9Jr4TuSqiu?=
 =?us-ascii?Q?CbOoMNrAEw7GeECY23+KUdCdk78nIAk3J9C2swsu+Ph1E0muSSsQK4dZ8wBs?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d7ddf9-c9b5-4f5b-0b1a-08ddeb351de2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:59:12.7145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NM+Lu9CpwW3kfvNCTk3calrEcNNe2ac93AgPBAPRxwtGNTFw85sBMZZBAsrmbLX0ykCmBqPd5mAZ89PxtTYXpS/Go7XA6NcsKqqYyEtWZII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8010
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

On Wed, Sep 03, 2025 at 11:36:06PM +0200, Michal Wajdeczko wrote:
>There is no need to keep them separated. No functional changes.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_printk.h | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>index 11da0228cea7..fd9cba14383a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_printk.h
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -13,12 +13,15 @@
> #define xe_gt_printk(_gt, _level, _fmt, ...) \
> 	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>
>-#define xe_gt_err_once(_gt, _fmt, ...) \
>-	xe_gt_printk((_gt), err_once, _fmt, ##__VA_ARGS__)
>-
> #define xe_gt_err(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
>
>+#define xe_gt_err_once(_gt, _fmt, ...) \
>+	xe_gt_printk((_gt), err_once, _fmt, ##__VA_ARGS__)
>+
>+#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
>+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>+
> #define xe_gt_warn(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
>
>@@ -31,9 +34,6 @@
> #define xe_gt_dbg(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>
>-#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
>-	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>-
> #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
> 	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>
>-- 
>2.47.1
>
