Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3869EDEBE2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 18:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FD10E084;
	Tue,  3 Mar 2026 18:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+glkbcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FC310E89C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561548; x=1804097548;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MnohGMgaQ8vcrdMXiWoi07kMMytVCMVRVd9a4dO8GkQ=;
 b=C+glkbclqIOaqQp8Mh3oqLM7B6KhmMmr3zru3OfXP8voL+sx3UgNt/dx
 Pkq8fb4omFNNVMxMIunkJ0/7W7PTiVsvXVGMkxJlSi4TpKoo3xSKivlMd
 I04KKFttD9DLbd05iA2k5lXhlOMaYvV/ZDzSygU6slw7xA+dlIiCwrV2m
 n2S04k5UiVVAzUXt+A2Wh6mrB9L0n2wghMWsiNlqlXuBPnUyrIEwcSPaW
 B6ORlrb//DOCBOcmCiCz3JBQ/q8tXHdCba2y0LfZBDibG3Yae/AWXGXdH
 yGDIbMTfizy+kLU/re3KkGXaTwJPk61euxZ/aANfmLErCk1LygHznvkFk g==;
X-CSE-ConnectionGUID: Nj+mi8umRhC4c6suxIQLnA==
X-CSE-MsgGUID: 69GYRxMeQyyY6SKcJtoSZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77454768"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77454768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:12:27 -0800
X-CSE-ConnectionGUID: d4i6B4BjTpuB+vOag8N1Zw==
X-CSE-MsgGUID: 6dn66zEDSb+BvOzg8/TLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218031142"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:12:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:12:27 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:12:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:12:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzCKm2oSbAs2zlLbAtpW9hnwzpXvJthhNRL/OT3ItDsKQ+mQOKYrBmTdzMGyQdF/ZQJzKMGz1hHbSrKJ7ohMqvm5GU+0hpk6jMVkMrkHHNdn7yxImr0vmnbxnTgpd++X0GbtBaJk3hf230D2RLFOY/xpQHnIa6VGFp5EbhqdpBynNmI9j47c+ktNAK7D3U9WaBLZTrMew3yoeKBMXtPXT7x9h+149momwmiuD7rhf5qz4rIxrXFWo/pXbqvaB+xpS0IWxhb7kTA7h9AeYAhu6HhVeTDhYPX2qpkwxB+D+/tMudntZemzm+LNhJmK2M8X1f7fzXEkciGcCJXDeogdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gh1HC/W6q959fCyVtvkfDrsB2pNS1JGZ3tdzahfiUV4=;
 b=dEbFFfVH8Olnls8G+PVwBTUjndgXO7fYemWuQOFy4BXMHdtw7vLdAoruazCn5fPRcPEYfb8pP5nsuluxeEUnmhAiouM382ZSm4txXxMlrV04TcPoJjW2Imfbb4aPjI6Yi37Z51RpuvKoXPvjx7MVaPH7iq711derl3B5k/FE6+gG9NkrDyx9bqUNrxacbLxR6lFebBWEc7R8IQ02zMr10eNXOrtnqetPFrDxcO7gGA6RksngB+uL8SdQCsC6LzyVP9smoHgB6VS648iLHrG9hyHFZ5A7A4mN4UuaYz3TTfRIwec4zC7RPntwke79XUJ6WAv/US+kJokmlZDefhulBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:12:24 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 18:12:24 +0000
Date: Tue, 3 Mar 2026 13:12:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v17 2/8] drm/xe/xelpg: Limit AuxCCS ring buffer
 programming to Alderlake
Message-ID: <aackhUyGcBsH-Kea@intel.com>
References: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
 <20260128101333.37765-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128101333.37765-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a88bf4-e4c1-4f21-e08f-08de79506b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: VsFvlxjvocJY+ooW5y9PUhMdENii2k215tr0WL0F/u8v6oMpeHWuqMDLJPM+p9nM4FDvrTd7OnpX0EvLNlLZaLXxHshqzRgnMFeDOH1S5vG2DDyhU1uq86wYDVjdYu2NABzp4plpH8J9SWFe6VVaV1n0MT6mFHEi0QQXwWmFGk5G2bhT3BS73hpfxccA5D/58RX9F2ftsPpZE2qStxTrEeNmWudnk/jyBjCIf/LnfwJdm48JzAwVa45eiikSJV321t71GrP5Kn4AVsz6kDO/gMfdu+/k7xvOvt0bb3rlqRXUUws0T1OSXmcvzz6T4lLJmbkPmggnUxmVvtbqYhyuUR3FrnBsPcqXlKGmjwrhLl+690+Ki/3LSLZjIXzmLOaOpdj6qVBuealkYe62DKRl2AvmTkqcw/1uSHaBWTluBJ+h3ScjJTeZwmU82iJK4yQ+4vvC5WyDc67yrzzUsL3Mn59Hv1/1R1vSgOaSxZSxlS8inRm1PqJ1VUzzM31BYP6118AUFCFPRKbZYKl0+vdfHnZ9MNxt88qQszOadtZfSjciN5BTD4RwUm59PHwdMoN9kxScjVjdH0p9GA/NsiZ7NnVwWfF5UV5Lt7BD2QY2n1ZCdZk/dFAcy+bJWaA/O1TveeemflQm5bitocSohyMu1hEDjq1Z2IoliuG8H7g1fyoaHr7+oaTp5WAbY/h+yjiWKLoihNS3bJRoP9aD9CRfdT1+lfPUEVYQuDdXD91Oq+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABaO2sM6cwXsxWsR9QgmVcInF7Dz5mFT9mhzFtyg77KA2ESpgG83xU2NZiMr?=
 =?us-ascii?Q?d0j66B1t0snN8gg13bifd6HrDFcIuGFKeNXq+IG/Rmj25G8/0rvCuXOnbs4M?=
 =?us-ascii?Q?O9xkppWiD6fAoejJd6fKmaNkASCRAMwlU2UW7uqAgOWWYMNnNZB9p8DGjTK+?=
 =?us-ascii?Q?WWcZ8h6mQ4pkKoRp+stGpEMG0Zu3Dq4pRdhiugq/tYthx3c0y9b5nhdZN8Rm?=
 =?us-ascii?Q?r38T7c9nqC48z4G1FXmoMub9fxMuEFk9KLRqGVwe46v1vBrjjLcN361F8AlT?=
 =?us-ascii?Q?Gc5+ICN/nRPqzhCiQ8SA7mMfOiKbnAtTay1wujwxQ/BK7epNozt3rXH2u3Lz?=
 =?us-ascii?Q?cQgQ/5TV/HF/USSNdw+f7mu89ABDka0AqfGLbA/1+aTvK7GEyLOCndVZ9wUM?=
 =?us-ascii?Q?kYCTC3pi9lSVyNM6H2GG2sV6XrNDUZnehzoFPZiCCZcZVoBch/ixC9RcKMzs?=
 =?us-ascii?Q?RKEvxFMU2g12xdV9nih3nPMqwY+GnzKaSmI4T+SOkHa3s1xXwmQPIoqsFLY7?=
 =?us-ascii?Q?Fs9hWqXemrdVgzZAvN3pkH+peiPp7cMLsOPqlTJPlNKP7C8iOJUZSmHo+86b?=
 =?us-ascii?Q?AE9yngl1HIMW8TiEH0ixvfUkYgoqd4vK4LWIFQjR3oy0YpKE4BVFWMn1MiJV?=
 =?us-ascii?Q?KaxnDtv9hSUj/XN+8J1fslyNGaLmdETGbaoR2XKo7dCqlsAcgJEDsVBb6Ly8?=
 =?us-ascii?Q?yiUqvny0jjlYZsG4/gmE4DWMTOBaIvwM69i7yv+PQtwTUgRGp3ffgV5CnrFT?=
 =?us-ascii?Q?SgaRakhl+714QJfEpwbHFcVzi8rXmGidLXtNdfHipLiLlSDjFRNbTeP5hEVx?=
 =?us-ascii?Q?TPdYx+fyQrzwe01qQw8nUrRi4Z/U6ZlvDS1KuyQ4YDXyEBp7xUP9pmyA7K/a?=
 =?us-ascii?Q?Uh1bcOBuTjB9spGKJ2cUm9Ium4rJINlw2qcJHMuNSui8nH1opr8yFyJh5spc?=
 =?us-ascii?Q?AOOoHX9a3/ll1FxDKwIRg4VtqVa6UNCnqiQjd7KSWhDe8ockslDUe11UkLbA?=
 =?us-ascii?Q?qODsap8rLvH/++Dn/83il+N5v/wCGoc4txSvTIbTMMg5j4lijpy4Fc26EvAA?=
 =?us-ascii?Q?0ViOHTdWV3cgQhpiirKnIzGT+SnoVHk31O89VoD0AahTzLAAODcysTbwRcfb?=
 =?us-ascii?Q?lXKpfzCPNLPOjOyiOvk0C6I0ylU6QZ20SlHB4JlG7JG7lwuUgbVzt4KAsiOY?=
 =?us-ascii?Q?1n4p5CKnda9FVAdcB6eHPFs6pEekcaO2y9aBRc79MrRNJX+6VAuDvs0WCTgk?=
 =?us-ascii?Q?1SKctMnnJYfP1CaHgk2hct6Utfy/MnQk2talYix/f2qzXHrutvvkV2omBEHH?=
 =?us-ascii?Q?/TslRyZMuRNqtK3kAhBP24jKsv8UEsRq4SSaj3N+wt4FGnlgdhmSR34I89TS?=
 =?us-ascii?Q?q+mf0sTRndZjkKZ/HiWEaIiSsHCh8QDuB211O/VS9wGKxO80B9hsZoiJ0der?=
 =?us-ascii?Q?MAf480IpfuKmP1sqpdDpZFxVkPAOZ8IBGrlMdMPTkdBkG4EbTTgCCaRbMfT5?=
 =?us-ascii?Q?JKNgchfBNye5u2BeRTQ+zIR8l7JsqtYJlHkQms3KkygwxGE1EVppi+L6ObVt?=
 =?us-ascii?Q?reougAS0d4jD/6bbQPWU+1FziYcfwU/UQL5bGmc30FHoJ0I2lfg1bgL8GqwN?=
 =?us-ascii?Q?LBvx+WchqNoQpnx7QGgtxXlJ2fIJA2SLZ+uKXW6c0BKS3C6jn0Tkgk7EgRNj?=
 =?us-ascii?Q?0wR9F+zQtKZ6Cc+WStBm+dCvp6dPGzklcHOCbOcG9Dh08NQ8goxveCaoPOFC?=
 =?us-ascii?Q?vIp3I4kt3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: tRr+AuZf+vHBd26hEVNnfQe07SX23S9aD1Vt+WptCxk7jNccLCrjOUHL/feoQXFHblVyqLBaBX6N8bpQ6HfpEKPNmW3DcGgduuysxYKJ3dkyQROL+orIXcgCZGYoqCdcLqPdNfku3R6I7vn8RvGNzmxfqyso4R3YazI8W2Areq5qdFXyCfplx9Cmi6oh625b7BXBNrrTH7Q9mhVk7AsxaoHDER9XB7/Pfv28tanCwpLg/GijcXolghXJ44JAX7zIE+rdTRFAdzU70br8RiNjxQTou/YrP5AyvknXnAuVAguICy9ByQDboScGmVs5ygJGGk415ZNK9exMYGeN5qYsyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a88bf4-e4c1-4f21-e08f-08de79506b51
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:12:24.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq8OqWy4PUD1biCGwuiaU1tvaSXFPVHUQGpP+Vbsdgnnq25aRByGW67MTXuq/jMMwysIv4ZO3AIsL0Qv4mCrJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

On Wed, Jan 28, 2026 at 10:13:27AM +0000, Tvrtko Ursulin wrote:
> At the moment the driver does not support AuxCCS at all due respective
> modifiers being hidden from userspace.
> 
> As we are about to start enabling them, starting with Alderlake, let us
> begin by limiting the ring buffer support to just that initial platform.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 248620b0901d..dfa0cd25167b 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -302,9 +302,9 @@ static bool has_aux_ccs(struct xe_device *xe)
>  	 * PVC is a special case that has no compression of either type
>  	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
>  	 * onward, so any future platforms with no FlatCCS will not have
> -	 * AuxCCS either.
> +	 * AuxCCS, and we explicity do not want to support it on MTL.
>  	 */
> -	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
> +	if (GRAPHICS_VERx100(xe) >= 1270 || xe->info.platform == XE_PVC)
>  		return false;
>  
>  	return !xe->info.has_flat_ccs;
> -- 
> 2.52.0
> 
