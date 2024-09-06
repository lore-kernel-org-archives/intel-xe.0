Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C5DE6FE2F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5709110E1BF;
	Fri,  6 Sep 2024 15:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3fCcDWm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCEF10E1BF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725638359; x=1757174359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bph9YxhjCKLSgKJpmumllgrsaUu0k9j7hBGpDbNuUic=;
 b=V3fCcDWmU65BMxiChE9AX5n2Ss0hAHYChiYwCwGGRy0l7ktpcYCUYzzF
 9Rz4bwwWqfj6pRZ/GCYZJ3XoBy3YjweyMlTL6bEqMxLRDdm/h1wHEUXBB
 Pba4hj1OdC++HguQdKkiM3vCyZkVSmjUpWZCZN7O2U0KWNbr1UDcXzEVM
 UGlLF0iXjt4dGalStpjiDbWkpbRVAJdyQ+jk+inXkCFLL6wScChva3JCS
 ANvc4tvh8cNhczN/XDejaaY0aCaa/KwMh2b0danrCwiTlTrgbclMK2JPe
 jk5rKCeBVPv556pX/vYKzBbQCRpybxExkk1HwKQo8lxF3/TdFA8ZNZaGf A==;
X-CSE-ConnectionGUID: KqNtrxGzTGWbiLICA91Fkw==
X-CSE-MsgGUID: tnQj9gYuRgi1Gn5n6Ac6zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34977661"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="34977661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:59:17 -0700
X-CSE-ConnectionGUID: OOylMUrtRCaUa/7oWKzRvQ==
X-CSE-MsgGUID: kjeW5OL1TFKTDEZw/EinsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="65681996"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 08:59:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:59:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 08:59:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 08:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLgqqQlP6io1C/u05wr5QFyqYKZlz49iiFnAVadKlR+P0FmSt3NR0Sjet4OaLOPgz6eoc1+OrUCHGO9OPN3xERxWOtfflzSHCiKSLRUrpxgE7x8kxf0/gAjync2qiVd5mZDMIZklnu0l93M18iJTiz04gqo9KPNnq66FTPahXDJS5AA6YCpvkWQp5rnlieW4Cc/u8qFQDzy+19dJ01F900D8XsWHFIUE0/09l5FzsK41yBC6nDlN+EIpO02dvusA3Zx/KeaKd2aOzf6qIE3lJwm9WrEho7nJanDa9OWDky3nHlThybj8Ha0Ql2f4p/18JVTTSxcNRU9pDGLlYTvgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPh/BTUucRpYGFl1ffpq3XYw62x5A1dS2/zGjMjoIpk=;
 b=XrWzaxm0SGzYx1yooO5uNMwirF0CIFvT4N5VrCwLCOMaOVPB7ewfUcXj/kkYzzG6odkQ1DuUFPpHzWEHwNJL7JAUMTL2b+wf5VAmx9x1AxID+Nl1+G3YeD+PWbkni5n1Okfj4B1vWmhZFS2ShY01QHl8sy8sZomC2OhTfdNOaFxvEtGC1jPy3fZ7DAPi2QluGtbbhZP0nWaw+FJhz0vwBvxMu6aMFB7DCSjLq1SpySq0pqPxDuYIEiotVCN8ZwBR0ovrqvxU2GY6wEpDXwVxF/Lfuv82HEA86sN7feTI5ttEp+cJwYdKuNCAzrTrJ476GfeNndaUDLnprMwG5GngaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:59:11 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 15:59:11 +0000
Date: Fri, 6 Sep 2024 11:59:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pciids: Add PVC's PCI device ID macros
Message-ID: <Ztsmyp6L4vZEtad6@intel.com>
References: <cover.1725624296.git.jani.nikula@intel.com>
 <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ac1829493a53a3fec889c746648d627a0296892.1725624296.git.jani.nikula@intel.com>
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: a5711f50-9807-4f96-64f0-08dcce8cd937
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CX6YKaFgGJh+soghHmG+6VxFrMiBwLaqLS58RJfKaZDXkdvJUh4BiZPgl2?=
 =?iso-8859-1?Q?nSHCPZ46qUwPTSamnelWLo5xQRkA5BBpxFwrTdzhB+p6vvGtoDzYgBasnr?=
 =?iso-8859-1?Q?GM9d+sf/Rcnuarqmn60HMFy37b6XpWkEvMeDMkLeAZdVqal7YvYiIoTypA?=
 =?iso-8859-1?Q?aD2jsTbThYu35iVQOEihOZW/r7CLGQhLvsMf1gXP5BvaxtNqLhCq+9WvFf?=
 =?iso-8859-1?Q?3rNW6mRbm0rGiRDHrcseyqdRqx0ZnQZAnMhZn1i1ouDxOpjKgVhiHT31iD?=
 =?iso-8859-1?Q?L95xmf4MX19S5R8NmIuxokcNaxVNNwWWv6D3D5oR5SG2EYl2EIZ/NIRBpp?=
 =?iso-8859-1?Q?WN+C4rl2y96HzwAxRnFjZdH03RCaP0IMtducOBCIXukgj1Hn1LdNH5/dcO?=
 =?iso-8859-1?Q?tOsxQWy4XoaJqYOpO9efuiMtrMS8k2syl8C6FmmAw0Ehz3doLHUZTkW401?=
 =?iso-8859-1?Q?gxiWOblOjzowDGeahB+drqThksbodANOfdpGk4fO0l0ps6VfSS4vKmXu/+?=
 =?iso-8859-1?Q?TELs8j7efhaWfOrrA6EhVngP3SlQiqSAid/ioXo+kcwRxTeun3jTAh9T5t?=
 =?iso-8859-1?Q?soWpGfQ+NHRA73Rsu2M2tmgIlLnR50xZOpbyuxvbHKfGTypOytgTvMDKwB?=
 =?iso-8859-1?Q?N3ZWL+6p/gQMvqKkyWc8oZUwuTHH2x1GaKVb6UX3Ta2qIKGaE9UkM+zIVZ?=
 =?iso-8859-1?Q?mpaZI5ZbHmuQKOVkhKAqhGMNHGj5lu9+aj1P1gC2IOErQfYlt8UUnFsMwu?=
 =?iso-8859-1?Q?XxnfxTDYwX2briFms1i7eT3MtE6kJJkYvG6BKjSApzhbKsgd3aHwsxyMqa?=
 =?iso-8859-1?Q?MZSGQdfxFQbQOWgImRaXz48uiXRHUDe0wixcjEhBZjEgJedK3vIBXAw95s?=
 =?iso-8859-1?Q?Rh4ZtqofNA1G4tD9Ah8DCwLhyAXvRz5ySfythRULWTeDrw2hmgaY8bQaWk?=
 =?iso-8859-1?Q?wvm8LSiNJlUqO5tZyr1TX8Aq5Yp2ZevFS0Ao4SkpSdQrJ6iNpQ59rbXHQU?=
 =?iso-8859-1?Q?XkkWvSplS5fEnAMZDgrOsSrM5eAaeST1wcWTK+7zoAxsuXVzAEnWFRz742?=
 =?iso-8859-1?Q?FCCe2qk12HvfmSflSFr16zfpI3lNnQpDyRVdnWMokE0xI9E9uYvWylddtQ?=
 =?iso-8859-1?Q?0sKXjvdBPdQXUVZEptrgfSCj9R+IfZWzsIfsFAsOUmifR8aJ1gWxmqlaoB?=
 =?iso-8859-1?Q?pTMXGOc0TjjWjZmIPALIcNbAEgcwb13dFbxgQdJIDJfouZm1gySlhulq5/?=
 =?iso-8859-1?Q?6pyS1ktC1OwI9aKzQOk0acTfwpe2NTUF5HVaqL1ay3HCYQtJe/hBCGIy4H?=
 =?iso-8859-1?Q?bT3OyhZQTTnqxO3sQDpyrFoiv3WardU8ex+ZpqA7a2jlr03eNfbfxePpZd?=
 =?iso-8859-1?Q?HA/b5eQYLod9ntltTHnDN0j89c2NEYuQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4kZxLaoUH4vQK08w1S+KtUHEcJ5wlliFakbjmYvFUUXWG9EFC8jptr6RlX?=
 =?iso-8859-1?Q?+boWx7bU2bcdstA2a6QCG2SdNJ3uX5w5Q60mCM0xAgKjDZD1Iu7BeDsAtV?=
 =?iso-8859-1?Q?s4W3Id/DiDqu4Ygbpdq+zVMdBe1RjjN8WNrSxzEdISA69TSUQiau1A5UgF?=
 =?iso-8859-1?Q?YqEWOrRZi5jgE/wRAitWMt31nw53DQJ6wew9xZRqeNxCg5qeuft+s307Yt?=
 =?iso-8859-1?Q?OCvBY5+9cQkjfUArWYXH3mExDJ7N8GQe70j+umFt+ugF5BEq2ogblhrhLk?=
 =?iso-8859-1?Q?OurtfBhyBAXHQXGe0CzcxVykl41ocFafvixnLKpGnenVNtouLp6WDANjSw?=
 =?iso-8859-1?Q?xvj8ElpJP7scYQapIxEKuS+8GeKaQA2m3S7j+R4sfH00SphcFoCMjRd4Ma?=
 =?iso-8859-1?Q?dgx+p2vReoq1yvAC12frw7O5dqDIu665rV7X1Md69EAcMYwZEa2c+/91co?=
 =?iso-8859-1?Q?e4qUN6pYjepvII6dcyzTdI76wOYylsUJyBLg7rdI3ZxLgBc7NzyzkZNKdf?=
 =?iso-8859-1?Q?Ujy/C/RLkjoKQbl8U/KbpyNTe2jYIaGsb8QSY4jPpVa0vpk0wHHPcRWFk+?=
 =?iso-8859-1?Q?RqM18Mw0Yfm8oaL49k+c4uy8Kn6BqcjqvyD6ZH+TIssvYfrl2bYYZx/sNQ?=
 =?iso-8859-1?Q?22Vb28SA//YlrNsl2tKXx2q2cRvyM0sBHmlupggh1Se84yhD9MZfJvUf3T?=
 =?iso-8859-1?Q?qNPedHH3nPrfxSmMHqhx27b7VHIoj3aTy6iDH+yinzzgo2JcKF81TiwZ2t?=
 =?iso-8859-1?Q?blLFUWQBipoG7nvO+PU/w1VUOlKTk+Ck7/tXba+mSaabJHVKQiiymmpa86?=
 =?iso-8859-1?Q?UY7HW3m3O42o2lBN7mIpVZIqpQerTN3rgWjhroDy+qLPmD2fQ4aGkyGrX/?=
 =?iso-8859-1?Q?NAoKMW2MFlyepO0GQSKvRdmRkadNmsO3ejKwu6W6hoVFmLSpm9khL4PPf6?=
 =?iso-8859-1?Q?KgiYORnzYioXgwgz9VlXMrm1BUaItdYh3VooCXFGYop9SX60ksu4VsvQoD?=
 =?iso-8859-1?Q?/2poGwojBtgRkkCsPXlIkmHw0/O3lYdrgjo/InyEtYm5CKAnBA4ws0wxil?=
 =?iso-8859-1?Q?qWWGixtakG8wLANBUWsx0TcQdP9tdgV/acad6D3TfUThuvkiwulEmKB2dc?=
 =?iso-8859-1?Q?4r9bg6IB/G4Vr8qY4wVYuyUZHbb3xmXVttAhN5LsD+WuLeXf/zCww9n1OK?=
 =?iso-8859-1?Q?rA8LcuwgHcsZLMnfMAD17Q+A2Eb0luWqkpLhOwwAi1LelYUeZk0C9ql67t?=
 =?iso-8859-1?Q?O7lskY22wNMmCY7K4/GgcAtlMRE7+4VjTL0UWEJqg4yFOOSg/jnZNn/qHM?=
 =?iso-8859-1?Q?9iseayU2hQDN7NXbs07zCd52d0wfgrqHEVYYzyplsrnXlZXafz8SDhezfy?=
 =?iso-8859-1?Q?JOjLuKy25fJClg6QLTRyB5g8odQKBTeNMnFw/v5ixxeJPqkV8XGnr35t0b?=
 =?iso-8859-1?Q?kcPo6SEMAMpVPLz2Ysx2LfSzX2bjNItka7jYEjt1wSR7qrzMmv8NCVkKuD?=
 =?iso-8859-1?Q?XaTgAEybkCeqrr0iQtW628VuAfUvLYXbEuXZJLkLE6kTnp6JTgA/RsUdzg?=
 =?iso-8859-1?Q?Qy3Hc6SqN31SqbPh5TqYzvSkUK46iVPAFWVcZ+c7eU9C/y8r42HvFo7ST4?=
 =?iso-8859-1?Q?JFZEdLc8Px9SZub0ETvI3pr573B8MBtX1MAVAYSvC1w+msD90KWz5JwQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5711f50-9807-4f96-64f0-08dcce8cd937
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:59:11.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQEtkryH9Ck+A1QM/2LR5hSqc0PiK2I8aecoSxbliZuE615jcwksR5klwue2NalRIANkTmS3azcsRjopbLF0SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

On Fri, Sep 06, 2024 at 03:06:03PM +0300, Jani Nikula wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Add PVC PCI IDs to the xe_pciids.h header. They're not yet used in the
> driver.
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> This is for drm-xe-next. Functionally, having the PCI IDs defined
> doesn't mean anything, but it's easier all around to not carry these in
> xe-for-CI.

Cc: Simona Vetter <simona.vetter@ffwll.ch>

either way works for me. I believe that recently we got more conflicts
on the other file, then in this one here. But I believe it makes
more sense this way since this file can be more cleanly synced in IGT...

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm/intel/xe_pciids.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 644872a35c35..73d972a8aca1 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -187,6 +187,22 @@
>  	MACRO__(0x7DD1, ## __VA_ARGS__),        \
>  	MACRO__(0x7DD5, ## __VA_ARGS__)
>  
> +/* PVC */
> +#define XE_PVC_IDS(MACRO__, ...)		\
> +	MACRO__(0x0B69, ## __VA_ARGS__),	\
> +	MACRO__(0x0B6E, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD4, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD5, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD6, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD7, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD8, ## __VA_ARGS__),	\
> +	MACRO__(0x0BD9, ## __VA_ARGS__),	\
> +	MACRO__(0x0BDA, ## __VA_ARGS__),	\
> +	MACRO__(0x0BDB, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE0, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE1, ## __VA_ARGS__),	\
> +	MACRO__(0x0BE5, ## __VA_ARGS__)
> +
>  #define XE_LNL_IDS(MACRO__, ...) \
>  	MACRO__(0x6420, ## __VA_ARGS__), \
>  	MACRO__(0x64A0, ## __VA_ARGS__), \
> -- 
> 2.39.2
> 
