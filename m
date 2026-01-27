Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19FCD2FED9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 20:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A4810E5BF;
	Tue, 27 Jan 2026 20:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOxerzj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AA610E5BF
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769547011; x=1801083011;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qTO+lNo8Bd20ds24wyGSFW3FTQ4uDQAbYkkT5BSkYgQ=;
 b=KOxerzj2Za4nTRr8wy7PUq20b4ewtd2Mthpe05XcXKeZV0pXnm3ixR4P
 wjnWFwBCS5r4njVBGqPnNALowegAeDXLMPAdKVO+YuIXP7niu5A8xgqCf
 sSW9cZaJl81+JzDkXB7wx/ft4iK9jks+ZyxbHdj+FTued2tNMy92PyQqA
 iksXjmfiadEapyDPUdglbfB8oJB1JGgEiQP5DdV7Eo7Olyw+CeEBX53Yu
 NiAos2pgdST+1JShE22gBh8EMVaz1u2BAByY9BFQDVjqJRFbn30qhVr07
 uo2CH4X3Ml1tFRJDZxoTcWvLzRS0wx/QyDS3PuQzf+eSB7DpV4C1tISkb g==;
X-CSE-ConnectionGUID: tmh/IdZXSIO8RvKfQEeh0A==
X-CSE-MsgGUID: iIPaV3T8SpiI1XMGw3XB4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69953116"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69953116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:50:11 -0800
X-CSE-ConnectionGUID: 9+ibxnWZTSKPtN8DUmjMTw==
X-CSE-MsgGUID: +XpaTk0ESeKg042MUq1IYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="239330103"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 12:50:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:50:10 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 12:50:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 12:50:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFd0pNQFuiuGFyx35+XygprbMFm5dYmsyulO/54AJZ8LaLZ0bHO3tiyNDk17k2IWKEvNdaKchahO/XVsxzj81SQP8/d59bojVdk5sHG/klHzb0geoERnQ+CLaNPSxc/NkwWcOgUw61J1oL0X7ByJJisXVcingemOm20rSaCnLWEePbW49hKUC8f+4NiDFO3JFWBmGocjl2Jl+3kvPrP4pBfgGUKTkNzpjtV/fgMQxwaW+DijWDtWYIsEZxheauXUfEDRjIrYOq0RoX1RvVMHVLAMgDzIGTUzqRLDHu7VDyXPWV8ZPsXof8+2sLchgl5LL/xLY7foR9vKyhup9/VYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPJ8/m14jYmxeqI9SsbM+8oqGss08o6mEyO9DT2E37s=;
 b=VgxktVq7KA2Ldmg+e364tp94bLC0QqqIMg1fw329IO+myfFKw9P50ufmVyjh0U5gS5pN0/cWZy+d5XrUSOpFQ+06Tahlz8qqRDvHheQuAt08EbnmizFn+xwaEaZSnCZkE4VjBt26YIMsOgoHXV/MDigvMB3a63ZCFoFoebg7z7YZ0SeOKOVodZkNdQ7i01CdfY/XSsUnFd/7ao6OG7G0v3TQsB6nFyxWl8k042DJ9fAgzrLZYAVXO2oVV114NeL9+Kd+MZ0hDqv5GdiKJtet2XmPhP2zuQm2rzrUT4GyL3NVI391C6kVKUYC75bfJV4t9rdc1eRP5Ot/H4pCRMTFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 20:50:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 20:50:07 +0000
Date: Tue, 27 Jan 2026 12:50:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 69665607-bce7-42ae-18e6-08de5de5a77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NF+vzvzDsCoVOlwCvKgvsQePUwtq4AKKnLctJi3y5XIbg7CRTm6+r5e+/Yc8?=
 =?us-ascii?Q?UnXeFqZrB5DLD70+E5Z1d2jUB5/QtEKSRsnE5PkRkplbhiKpjIliAx8wKI44?=
 =?us-ascii?Q?GKjlLEP1LoDznHFwsypAkyDRuDqbsBdbQNkudD1bQnbN48rZcdDsc6dak9Af?=
 =?us-ascii?Q?7d+sVr/02FFrzvL7xG9Naq7Cm0rNs9k65YFCqIEA0hfI8D3srB92Gc0Ul2Ls?=
 =?us-ascii?Q?q0LPsXVq7RRI585E6uQFZnyTAKG2pp1BYYZa9pRnJ72VCjWOCZshnCM4U+3W?=
 =?us-ascii?Q?qi/0zW9Bb+UyqnTnRITBj/yzvpkGEVhNWE/MayHguH1b5Tx9ePugLql4p+Vw?=
 =?us-ascii?Q?JlKI+IIyGrDjvpRhmnZlF+5onhLl5huaRSh+O7PqeWC86PuZORmshV6g9pe6?=
 =?us-ascii?Q?UZWgG6ZA9LNOt6Jv/CjKrywP3JDm6dlIFwCrSYp/mhhVwLdfGueGVJ58JqB0?=
 =?us-ascii?Q?LgV5O0l9UD3LjEGXb3rw2i5z3i840oz5LNpvRpi6xWIOUehqD7bNBYp3kiTW?=
 =?us-ascii?Q?Glowj1c3qYJg4rU7h69MAAzNOackM0cezRwH8flUTiLZ/D8adQ1uoZiYuChn?=
 =?us-ascii?Q?OC3YXrpAvnIg6j2w7nAG+w11dmJ7gq2ptyn08f1MITIFfrHRih5PyrySAOSm?=
 =?us-ascii?Q?4ZPxDfhM9c0jKiLnAPyd5El1mCLC3UeopjsrOqzd5bx7yLW6F9EFuVhA1Far?=
 =?us-ascii?Q?flCOo+ystnRml6MZkgXYAIeFL3OW2DXSf90VR+T0YNYPs+edyavzqCDzR7JG?=
 =?us-ascii?Q?udwU1vtRYxkj/ojQGoKI1gPC5h8NmleRZn4EELOzuLcpjAIO2cuCgfw3jALn?=
 =?us-ascii?Q?f4MNFlSChlBhqNeVu0P4Oh1W/CwbMlGLZnABz/OojZVXyS/QWjlG9z3WiJRB?=
 =?us-ascii?Q?Qc91ITGpV2/HU4qIs/A7Irifc1eU2Iq+CPOjtauWIJkR3zA0XgUCphIwDcZl?=
 =?us-ascii?Q?UxfESBEMaNVCO8quB5IO6kVPFmLfYGnKycyHubnraAj6UdGNDUrW56IMikqB?=
 =?us-ascii?Q?m5Ud0w87h/tvYkdvFbHkiL4TUPnPLjMjUubpucEu/pNByJMKo2YkFcY2Ovy7?=
 =?us-ascii?Q?O2urKrA31DcnKm+0B0KDogU5qzQM9h29iZaf64ER5lM7G5WtPqmQElkQwmLT?=
 =?us-ascii?Q?LbilElppVr2g9zc2tZGBTIwGpr+tkBL8IsC8PQPKdbwwr1NBQy/Mbf3p+Mts?=
 =?us-ascii?Q?6yoAfVKFOd47l9y5LB+C5GumRuEexnHsfJczD1VSrRWg6MfpXE0Y/mblzJgF?=
 =?us-ascii?Q?Lx5y+z52dIshCQTBLDBywrVXs7WG4mfpOCSYMFCQ9DbYMSWkfwIbCfw4Bbzo?=
 =?us-ascii?Q?NGLpNR2YbzSYawEjPZWuIPEpdzHp+zVuLq4wWCP34/5TtFXmkzwkK+vSAvwD?=
 =?us-ascii?Q?NuQVfOuMKxsVtfLYtC3Pf/1xgrNIgAPlGh9HPm/B97aKCanoDFq4vOEsXjB8?=
 =?us-ascii?Q?uhFMOVUv/jfOVtJRsTAGbQl1ciB6pOkBABIpfDgKFp4B3yEb0gb5RNULnjBh?=
 =?us-ascii?Q?NObpt2+nD0zrc6s932P84tsw6Jv0zDZj9e6S4LemjsrOWxQGFgNHj2XXrL07?=
 =?us-ascii?Q?M7LX1J9FZPSIAZWTtPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOT3grPbE0g4Fnd7oKIg6dPW9rPVhZk+oM0gRyQYRBBqsPG9BN4PRh9ZpwnI?=
 =?us-ascii?Q?NDbsNRMNgEpbv3Cr+i4G0cC3oLVZveRseKYrjXpxgtLaRKECZ8lYc9UxAiOG?=
 =?us-ascii?Q?xlgNAtAwcd7RUNPdIuE5WVixhbJQc2HaCivfNj42zmtKvc70MdzPmCUGPt8U?=
 =?us-ascii?Q?eruI4ZSUjeubquA+d8v4B5dUQYS8RhvG8CBwN/ZE1E7Z3e0MSHx4Oeau6O09?=
 =?us-ascii?Q?Z/2s5QH4bF0cE/94C3Xv7rMwtsWkxmxIH+fl8tGof/StdNYnQe5Cg2iS2yFV?=
 =?us-ascii?Q?w5f6xbiLq+sRk4zEWawMFqtON9+GeidBi6hJdJndIB9RQ0G4OIg1piAIVZbW?=
 =?us-ascii?Q?wIi9OIn/QWw97LJLHLeP1xadb2m3IDzsoSBWhb8vBjEcIHQFunneIB6Lf5Zd?=
 =?us-ascii?Q?HN+PAhQpDLco1vZ5o6C7qRXJQAHb8qzZhRvKTsY4jShj+FxknQ8yMKur2tsn?=
 =?us-ascii?Q?3i19K7vsHCD+qdTvtpy6RTtXy+TQNpdyODP8S6Vut+zrFTefMp0wbKEKfO8c?=
 =?us-ascii?Q?clbZWfSPoPSEGp1OggtyU3CJS+wORVuMx2oD8GZR6+WRIe5WeFn9STuleIa/?=
 =?us-ascii?Q?TlEhqhaXKPixuFc8WM9zqDlN8X4ZqJmaq9kkA5S6ktf78fTCEU5HfyhdVR9g?=
 =?us-ascii?Q?2tHx4JMV3QRUd1woJB2faof7k+WtlF0avAyFtY0vXE65I7pOd+DA42TuPFvQ?=
 =?us-ascii?Q?HWT9xPDrk15ll53+VkV8AG3Gy1774xySyWzcx2Hh90jNNM4hWNXG0GPtrB+x?=
 =?us-ascii?Q?04Ez+HTaEmtnCTbr0W5u5oBDAr90kVc8VbmTJ4ZZ5G0mVEm+XfZvZDX0Batz?=
 =?us-ascii?Q?KobgOKBnGTERrnvpcSc2DrLxxOAYMcqZdbUA4yXhqF++lVAdym+TxbAkwHyo?=
 =?us-ascii?Q?n510ln/xh83aR1UfNok8MLNgEAh9kn5RbkRzZW5C902eKOYl1gIIoZm6+xgG?=
 =?us-ascii?Q?oPcCHOVpCmtVRjt+PUIZa6vxfD2wJldJ8N+wpiHaWlxUXhgmJEgNCHQfK78l?=
 =?us-ascii?Q?sF0rEO6RdxSs2hNYglqE6aNt8DYndNJ1RYU915sLRcBYshWPdfiBvTCwpjs0?=
 =?us-ascii?Q?E0LPYz/SvstquhRWMli1Cms5AyC4cskCKPcS96chullgHDM6v5JDSc0K8ri4?=
 =?us-ascii?Q?XU54cXWHDDa3aslXwmO7BWKQIjvh0sTTeVTUtUC1fjA0j4EnFDag6vZI7JlG?=
 =?us-ascii?Q?NjHosRutC2Ooz4jQvU+iC257K7IsZsTgQR9IJeBvWJPtVX1/8+xaad8s0MS9?=
 =?us-ascii?Q?vNFDM8hi9LDakiwdMlATfccnj31gkErT+PI8fxcDADiMkW/eIv8OyRJW16z7?=
 =?us-ascii?Q?yV2b6V0TlhoWUnUbmeF4BORU/V/RRsyIWoZszyjbjVpR8IUEJFnrTnStXtaf?=
 =?us-ascii?Q?wvULVWjDV+iaFHa+PJ4TmChNmIHm2bEE+JbZF6e9bTnPw3u6DlJJmY8UEa1C?=
 =?us-ascii?Q?ta63ak576QhIRr0uaFXqOYjmJmSVZBql735EWjJwC2ga+peF+zawA59g1e7z?=
 =?us-ascii?Q?l1dEzbJY+j44ieQ/I6PBaqoAWlD1pV/hhUA0Mj/UgXbpwcTiEieUyFZWSGGE?=
 =?us-ascii?Q?QNZQOQo+Vyz5lEb0YEVD3iuc2XVCTiNI5PbafX9LpDLak1GgTOUmtfS0EXYU?=
 =?us-ascii?Q?WojJiBZEkqRWuRb7zQuUhfWt4HsdIvgTGIWpdQ/q+HSj7bMuoYjphJhmDONP?=
 =?us-ascii?Q?jEzXgPhfVTOYuaaPW4SuFKbZ4vR+8l6+/SpJlYCu8yxeSjhOW/MYVKNCDFsu?=
 =?us-ascii?Q?8tdfHq2/yga0NeAofNCzAD2qwMBazCM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69665607-bce7-42ae-18e6-08de5de5a77f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 20:50:07.4292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0P4s08znVKZKuryjhrdgXmNzUvI5uGB5o27BmtxDqkyDpIbJSOADYlFOmTooHACaZHysFC6D1kzK31tpEfYTkPvejFMKJOF6KMjElXOwJFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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

On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> 
> Bspec: 56024
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a991ee2b8781..1153a7363cff 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("18041344222"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_rtp_match_not_sriov_vf),

We don't need this; nothing on the engine_was[] list applied to SRIOV
VFs so we never apply any of them.  This RTP match function is intended
for OOB functions (and possibly LRC workarounds).


Matt

> +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> +	},
>  
>  	/* Xe2_HPG */
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
