Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A8ECA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928110E819;
	Tue,  2 Sep 2025 18:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6qxX4yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7E610E812
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756836648; x=1788372648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vni0L7bUm9j4QJ/1bu616XLk2w/D52/1YQmlT0RD/eg=;
 b=c6qxX4yhL2WVFdQgdmEh9UYjghmwWSVajggdbbSPf19Mzzkqi6pJkZnV
 nslOIMnrwJU14aZVGr9ddEFVHQnQ2M7qaBTn1AmEIysQhtSD1UOn/2Dmh
 22/mANdidgL7UN9XeGOKJXdj2sPBOORe0/8ovE3E61J6XwxaXsfGG7A8S
 2ZeJf+PT7iKCe7kqcO1BdJyY8i3yFVxEz1hCmqzIbxly8jRw8wMmu1+By
 Ff1myFnr4VmPWoOPAr7yLX2OeGbj85cB977DfZNj7fiM7Fqo3HyaB5y14
 5xlK/ULCYH3q0cgnD/0CCaLgLksnO8+kqQuU0NAoVt6Q/H0NpbtpV42bE Q==;
X-CSE-ConnectionGUID: c/7nd7LXRq6RatRQvmlFEg==
X-CSE-MsgGUID: f/WiHxW9TtOXnJyQgyOROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81711206"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81711206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:10:48 -0700
X-CSE-ConnectionGUID: 31WerL6ySwCXXhSKPdmZ/w==
X-CSE-MsgGUID: K2CgxvJRSN+EZ8836NBuLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170616513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:10:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:10:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:10:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fixI2SrHxua7iqBa6AGmRakVYdNiS/KHX50gNsH9PspkO7rfZP5bB6t+EjfOBhBGbrG/MY9/GG/quulTJHQFr+74KzEUKjDeqTYsJVeyDBSXFdLHkdP6Nda6GGaFH2CCkokJNx7U5RYbfenEXl96qWVVG4CItmrOoSQ5OgQaXAAjGJedrfvscUf3u32YAh6kCqMRG1SrSHq4lMMGltxzA1SC/bpokiewac+OJf8KlsYedqUfAH0Xr6zGMP2qwEurSUfUxMjrxxaXOWinmPRlwAJ/x+W+YjCRfgpiizsJXb21OUR1gXZJ1IWsNEj+psjKFnxTRlhTv16iCxBd1jYBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63ppMC2Mv6ALjnle3D7FzTwAMGwiuNRN/fNkBc2zT7U=;
 b=PIj/NxiDm2zzFUwEwg+YINxmkknoMF1ECX3owWA9yr8UFCJNt5+Z0dM/ocJwiG08Vx+soRJQVtoDtDAOQ5qPMyVSXWz7qBmC1WIXil8EQJ5TmKzT+DWw9/GayhCjLtbWrBHavuC1i5XttAMlWw+040zhl2PB2Yb9Yo/H1bfzSyqTaGD4dEaGtquQK1y73Xw3TGnlBvug6cvbuqp1NAtKZw+WdEsbies2tiYBxWgfZtwieUZyWG/2bK+7NN+ehrClz0ExLcB2UnXhy/zV6Cr+iUxRObOFSam9cxzz1kyKNK+YtCKPANbyq/DOsQeIckGu4mlVwd4Fm2ExtjtJ1HaKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Tue, 2 Sep
 2025 18:10:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:10:39 +0000
Date: Tue, 2 Sep 2025 13:10:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/configfs: Don't expose survivability_mode if
 not applicable
Message-ID: <pouowk5agqzzzmnj2bfve7vpmnwdbsfeya6ojbunflwlhughkd@p2davpr4dyoo>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250902131744.5076-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd93d84-00c8-4fd9-716b-08ddea4c0617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q1EEMCicq0XrD3eh35gCvRZlHs+hJyFxyaqEgWv7Kc0xYYO16Av/8dWmTh3Q?=
 =?us-ascii?Q?xhwbLlNQP0248lA5yNDhtVgp/Bp06Mb4IlnNlTRcCgMYiIuj8qOm/ZDyDp8U?=
 =?us-ascii?Q?obyX4lw/x0utJjG5tWHLoACmTjGYCv//wHbTAFTVjLherLD5eWfk6nRZiO90?=
 =?us-ascii?Q?nLQmQz2/5d1I1zzhfVFby1iAsuLyiKjJL8C/le1jgMH609Y4KIexwKRCV1dD?=
 =?us-ascii?Q?Y9gvwyJkUKbxg7vC/5p4tz5Z5E4YODAsgm49YCm5S1Ray3EMcuEEJ5MnvjMd?=
 =?us-ascii?Q?4FAY9f058mkJks5JeVwBCOhV9es4mA5GKgErcCM/gOQHKJoF8rdvwbYYClk5?=
 =?us-ascii?Q?sJBCrLdJ4Nz0p8h1VCPGswssu9IUW5HBw1R7qLvbLCsMjInC6Tqzy6n1qZy7?=
 =?us-ascii?Q?9kRXWc7gS8d0G/u2Z6RvtwiIfr2Nenh1x/tcs/c0o1jOm2fmboWqcKEbppUJ?=
 =?us-ascii?Q?nYe9+NiMsQ3HJTJydFUzPVx+lJbkx2GzGxBJ3JMSNGLLN9yGN9tvANX6f++s?=
 =?us-ascii?Q?KwFDXH0Jbwkp+St/SFVBDcWW8yJ15O+IC/cEk9+sjLYT2z+PR1Od5sAEZHnQ?=
 =?us-ascii?Q?vQ4HdVF+mMGnMdJ2XyojtcbUXIL8gk7mnVr6xjzrpmdJheaFJVkni6HkIKYz?=
 =?us-ascii?Q?zla6TS3dSM5+KaAjGMMHphmjDwLCy7xBbYKOKcaQFbMC30BytMJFXp+7ufEu?=
 =?us-ascii?Q?J1w1wD3sm5ftP+tR7QigWXK0jez+amWkANYbXT3ceWNlJJQaRx0nVhfUFgFR?=
 =?us-ascii?Q?fCIi9dhJ/08BmDfVaeio2Yc9zbrbhdU5yAda/UpTMsIB93HJjCvISFrr6AVP?=
 =?us-ascii?Q?WS7HpitGhUQ9MGwuXg7rgqPiEeUYwYIEFTGLfKCx1T1beuDQ0kAahHUS8gDj?=
 =?us-ascii?Q?wjMHWjYy+D6yOVWJ+swcYDDMYNAZTdzgyGdVfr/luE0IRUSN2KDrGFNTlj8B?=
 =?us-ascii?Q?VBJakWKQFNdz0ZyTIvo39Ls31cYxwqztqMe6SIG5AhrvpauRZk6YU6pnroUa?=
 =?us-ascii?Q?wTibxaxOEaNOxCMxPKj79OiWpelJfh8PXdcCEq3fAhsbTbNx9ygD+6z3aQgC?=
 =?us-ascii?Q?68Y0PNQCpv3EqKULlLSFStexhLUVm1SVSpQVS2YEqkgs4A19U6e5oG8wpdu5?=
 =?us-ascii?Q?onH3Dkxc0wK9IpUH1F9pqRVz6Aq7HTKViCnxhrY6NCfFKq4NtJ0Hn1KqR+kJ?=
 =?us-ascii?Q?KBNIZKalRMo9Qnt7wDnjGhqFGI9IpkWD0j70ivl9SfZFQL8aWl4518cc1fIr?=
 =?us-ascii?Q?9ncXHLfodDCWycYJVqE5ww/YxT0izzh+DHSdW95CQycNGiK4zGvG4m/a5MB1?=
 =?us-ascii?Q?bpmeht6qaAlGkNQdqPDXJ5oNG2IspUMnnARECC9l5GVQaFtyR7/5RyWeo6m3?=
 =?us-ascii?Q?JzHvGstWfmyb2CJTTOPZY3PmK1YDnKED9gBeapU53bl0/kqaZPHal4nL19p7?=
 =?us-ascii?Q?IVlCWAnqlyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xW7GzpFSVYNAdLHwMZd0NoHVJWfLB87US6OpcEqVza0IKQuGhRpNhMAbeGP?=
 =?us-ascii?Q?CJGCRf4MjaQuI1X++8enz1SuRDvY2s/7EzzwzwZKJ6zw09DOxzjciO7bz2e0?=
 =?us-ascii?Q?TcPTLbxFMlGIl1+Ij98NOOWSvbgUBIJskEVvYyBciHS4pA0/mHwjTo+Fy1gh?=
 =?us-ascii?Q?UmD6Wlxxma/d2kGg7OliLuHkDG5rIMiUzPN8iAYuPxOh9OMzTb5x9j0gSu79?=
 =?us-ascii?Q?ru8XfUT0wynP+hQrBrCJaExhwevuFOADd3pQa7CqWZ6gfyB8VQDiPM30E3e2?=
 =?us-ascii?Q?rUTyEru44mK+A5yLoynSMP4PAeM+HPNBZ66JkVJrKyHhRjbXncumGXzxMmft?=
 =?us-ascii?Q?4vy2jdV9QXURFQnHHmOOEM3EwDMjx86zlb3Uieng33xigS2WCBBVFRJc6Ffu?=
 =?us-ascii?Q?yTbZBKqS+g0MduGwAsigXJhbNIYpP2y1rflUHbfSN9IqUWvxB0XBZXL07PlD?=
 =?us-ascii?Q?eXj7av4uup3oCeJN++lX7ir/IZFHg7QsZkAM1MyNuCF+7jFhXpS2oJiEj+rv?=
 =?us-ascii?Q?ZkJpA9f/jShu+jiOl/ytnnBfgr4VC/C0J4U4yTp6tghfpqT2Kpjz3ZgI5NRd?=
 =?us-ascii?Q?aMJuGuM/oj88qT2EE7ndSnq0xA/c7n9HjwBVaqYdqFTzYEDZ0rjCHxetY82/?=
 =?us-ascii?Q?HXRqOuNOrKg9adfwEjGAV9Rk0bnHNs0tPXdqTYNha20n/2EvTTBvo3spuBba?=
 =?us-ascii?Q?7uoCdlUxxSP/Gg3J6KZ2vOlisaRt9Fl9tqX0lLLDmq+ki2M25YXcH2Wi0ouf?=
 =?us-ascii?Q?Ue6sRkTOQIBz1t3jasCik0pavBbvjjwMlzuhe2CjkMdwNmhnEwu1UCVzd188?=
 =?us-ascii?Q?ZuuHPheVtu2OkiA7/N9+9F58mALu7D8zFUTmx3ZRf/gZfitY52vaPtb+TgbU?=
 =?us-ascii?Q?Fk4/AeD+jRJlK8bq0OwDNn6f1GWFh/MZaKHlGKkmz1eu7+fL+mcNfmyapMya?=
 =?us-ascii?Q?hydUyGZ5Hb46w8copgieQiHsbM+8MZCH33V9LdTpOY5Ts+TT73vKTbyrY80a?=
 =?us-ascii?Q?BjPTxZf/chZ7kbHJly/Zno4I193P5Jl081LqB6Pjyj+jekfeALJiqmlDqRrV?=
 =?us-ascii?Q?lHGRefo9oXOgaWy3Kshe0WuV7GdmxfEUiFxfC3uZpAHxsL7RbOuPBNySLaTp?=
 =?us-ascii?Q?qRiJeyVlWKGIge7wveqFZ03wL1UrSRDYKIKYisytzFRIhlaWQenrYDFlc/Dl?=
 =?us-ascii?Q?78917YmVra9U3SbwCqNrMokjdbPKvqY5507hTwvwus1ohYM6kzOaAb94cNwF?=
 =?us-ascii?Q?2Xy8nphWTWkjE0tlioRZeJzYJrVi95XTpE42oSlDMkvXzOuATnpKWoJYC4qk?=
 =?us-ascii?Q?MBtyZxdpqbcNDp/LLDe7OEWE4HQFtjhSn66205ki8g4iJ4Fpip8Ti/nYJw+L?=
 =?us-ascii?Q?aIG/bfrMLw76RuNIp9SxlkfyOVfaXgiQYr9PLOawrSIcIqmzyxTqDPwAMy+2?=
 =?us-ascii?Q?lOo4tZlTcLRUORQTSOgorczlVpUdpZ1bs3k0EzvYaNR/dyeJsVYsbXdE1ciU?=
 =?us-ascii?Q?jeTMh+N4OHHkViCNw8wRn52QdqYErsmQoJ58NUvBsTmUhexEcvra4tXriNuL?=
 =?us-ascii?Q?Wxaa+1zpDZupBo3oP8dZ/9kd2QCKKmMjQX6Nae2lDp75AEeoFxti51Y9GGQT?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd93d84-00c8-4fd9-716b-08ddea4c0617
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:10:39.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRcRbyJZ1HA976G07T/w6tZJFwos3EbjZzkWMQQFQa7A2UD0ESzmjKjeyAKxCXVQhsMDdZvKnlziu4FqM8av6meCB2paRvApyPE3ozRSKjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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

On Tue, Sep 02, 2025 at 03:17:44PM +0200, Michal Wajdeczko wrote:
>The survivability_mode attribute is applicable only for DGFX and
>platforms newer than BATTLEMAGE. Use .is_visible() hook to hide
>this attribute when above conditions are not met. Remove code that
>was trying to fix such configuration during the runtime.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c           | 24 ++++++----------------
> drivers/gpu/drm/xe/xe_configfs.h           |  2 --
> drivers/gpu/drm/xe/xe_survivability_mode.c | 11 +---------
> 3 files changed, 7 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 43f000260752..0337811864cd 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -369,7 +369,12 @@ static bool xe_config_device_is_visible(struct config_item *item,
> {
> 	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>
>-	return dev->desc; /* shall be always true */
>+	if (attr == &attr_survivability_mode) {
>+		if (!dev->desc->is_dgfx || dev->desc->platform < XE_BATTLEMAGE)
>+			return false;
>+	}
>+
>+	return true;

maybe it could be a `return true;` in the previous patch so it's really
an empty implementation. Squashing the previous patch in this one would
be another possibility.

> }
>
> static struct configfs_group_operations xe_config_device_group_ops = {
>@@ -558,23 +563,6 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> 	return mode;
> }
>
>-/**
>- * xe_configfs_clear_survivability_mode - clear configfs survivability mode
>- * @pdev: pci device
>- */
>-void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>-{
>-	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>-
>-	if (!dev)
>-		return;
>-
>-	guard(mutex)(&dev->lock);
>-	dev->config.survivability_mode = 0;
>-
>-	config_group_put(&dev->group);
>-}
>-
> /**
>  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index 58c8c3164000..1402e863b71c 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -15,7 +15,6 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>-void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> #else
>@@ -23,7 +22,6 @@ static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>-static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>index 79426ea46861..19a1732e33d4 100644
>--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>@@ -287,19 +287,10 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
> 	u32 data;
> 	bool survivability_mode;
>
>-	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE)

I don't like the < for platform, but it was already there, so let's keep
it for now.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

> 		return false;
>
> 	survivability_mode = xe_configfs_get_survivability_mode(pdev);
>-
>-	if (xe->info.platform < XE_BATTLEMAGE) {
>-		if (survivability_mode) {
>-			dev_err(&pdev->dev, "Survivability Mode is not supported on this card\n");
>-			xe_configfs_clear_survivability_mode(pdev);
>-		}
>-		return false;
>-	}
>-
> 	/* Enable survivability mode if set via configfs */
> 	if (survivability_mode)
> 		return true;
>-- 
>2.47.1
>
