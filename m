Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35848D1951A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 21:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D532910E265;
	Mon, 26 Jan 2026 21:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCJLF2wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778710E265
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 21:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769463553; x=1800999553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wx/xjnLZu8qMWFR73yzs5v/Zn+NuF5uDShqgd0prfog=;
 b=dCJLF2wkBmUA2kh85uJ6W9bKYfvXutjrQ53sonT6H+tXMe8Z+rExQQqI
 ptckAIfrfm1l7R5gKl+kvzR+a/USdhTS9eSDicePISizELcEc/5AoWlmg
 vublny5PYdsaArrSfHY1WiaPhFb9tmsaIyOSxmNXLRP9LGd32lVBR4k3u
 mVVOs/6C3IhRu4by0BwuhFWFHzuFkKWs6mB4F98HmNeTDtuJzyrX6MC+C
 yYQdobqyUGDdSCOCv0z/WBJIJAWLC4dPotwx7HhI34r8VP+kcNgEb0JgC
 Rz0HuCZ/lnNuOaxi2OW+735NFV7iSxyWZiO0K1/3bkWj/K7YxIOwWQEG0 Q==;
X-CSE-ConnectionGUID: StaEYYwtQG2D+P9Od1Aa1A==
X-CSE-MsgGUID: +BIaywlcSC6pZGZPw0rHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81368010"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81368010"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 13:39:12 -0800
X-CSE-ConnectionGUID: 1rUwh8sMReCZCW6QGKcsrw==
X-CSE-MsgGUID: NZ0iAhMZQc+V2BnL5J6cHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207857189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 13:39:13 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 13:39:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 13:39:11 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 13:39:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iBbrvPfW7944FHAXeDjfXFBbm+JPPcIYTn5EvV6pOdfWdzGnwhsRJAGMUaxNktrM/NIG2LQAkBYE0kJNRKD3HD7QBPeKeDgwzUWajWv1ofrLsHIWwZ+A93IlM01w0v/FowxL3DIMJ4z1izeFrNl8cIydjaDDn6p1j+T4F9Ki7C0RpmhhZ5bLIKvIvEX9Spfd6r3NjdRmkzcaj8ALqPwz0nlKciyVjQttFnYp+dzCHcKnhZ77sEgjE3ToMxEM9cgR3umn0u3gp4LWMbwDFkBDg7jYBJdXyGzGXgy5vaMhvV05Ama20DDS71QzODwVYf8mokFOYFFzysdG4zPxgQFbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIhE5jN8HcXR1bul6DCqnYkRAObEkpcnRKNmkh4Gnw8=;
 b=o5NZ1nAW9D+dp1+tb98zgeMDN8grM7dK00erVg/nLkyDCGGk6uncioExTx6I8D7EjPvTgYJt417EI3txFx6KhxHHZ1X6KZSLpSPsEqtNlhTRBUJRqPvHzqbKoN/SOivRrgAVZ10hPq3lOdK6s2+CpO0v147sVN8XVZKXAWpCEjHxJ5QrunYnixJ+NAfPvtWsQf4evb+xlX9xy4oD+a5lOjEAgs8sOCTLLnJF65yiiga6XtV143lkKVXpwsgY+okUxXwyDTquQsTgVXGcL6mxOJWeUIMoJ7nHDENcMhnZDB32YzC/1soQpfI4+V/BPoBR7mk8mf5QnUbI6LWkYlb4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 21:39:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 21:39:09 +0000
Date: Mon, 26 Jan 2026 16:39:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/xe/ptl: Disable DCC on PTL
Message-ID: <aXfe-QSKb6qJkzNX@intel.com>
References: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260124005917.398522-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: b8493bd1-7ae3-4eb9-d1af-08de5d23565b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?atK6zdKgaF2vgenDdd3cFphnlXxErKcFeweCnO9ncJnjJfRmWXTWcy35Maqs?=
 =?us-ascii?Q?jqnYfW4OURvcgTQ36227gj/jiqlOX3E1ZkwlZ7+2l6HZGeQuAPqts76df5hi?=
 =?us-ascii?Q?ybv1MEdKmXP4DUSp/Z90L7+tobfN7+xcAnhHjIdI64OxclFgvYCOtryUQS8c?=
 =?us-ascii?Q?DV6zT/MHaJfWL8NJsYFwYkHwCnXRRT7Uj8xy2njz5WwjrzH2enCeb2Mpytw8?=
 =?us-ascii?Q?xnxfTHHc2GOTazz4pWBu4KUeMGqaZ8bQ5lCnhyGxOIsLtxSRtSLesWLl/nBK?=
 =?us-ascii?Q?bw2XO7le01fXc7jRtBD/7tANPAZCyDNLAFNSHprY5YL5zqOhKNaRpwXL/2w4?=
 =?us-ascii?Q?WX1Xpiyy5DdYXLpcm4E65s72KK0EG4PBM9tBZZEXLde2ErEUwh0DctCDCklM?=
 =?us-ascii?Q?uxVNOiQkCIlIFbeLo0eR+kepWblFfeS4pHE1C3Al2w9q3shvs7erkCEVGpbF?=
 =?us-ascii?Q?zSie35LRek7VaVY2ztQtz0uoAGZ7jn9kb0XACxGYBRy4X8mUhRzMf0GFAinF?=
 =?us-ascii?Q?UEL6l8KIKoJCY3KIAwLNW4ihTFQ7AYQkriPrtdXuj4ZHV6Max3L4luJLjdyB?=
 =?us-ascii?Q?Ryq/omhwEoWMhdfDLWz5TnxvOYzKCkzDJ64iGG13fS1nu36hpoy3Q5HvhsML?=
 =?us-ascii?Q?K6mqiFGGIkUz3oys9igaSV1vi2lrxCQxClO8dm2iHGnSfUwiWofgpxvVZTky?=
 =?us-ascii?Q?6FGKNZDcXZdGefaOM7tUq0ho6LHorw2bGOoIu4yW4aGlQldPyMgVp1dH96z4?=
 =?us-ascii?Q?P24doGsLwA9rvG8YA+tYXDnxUR89q9SOgVLuXtfraifUX2jDzZQ+d8AX6fpG?=
 =?us-ascii?Q?qEFwVV5qeUKBy58U6YXfO0OGmQOcrQnoSkrxCc/EEJkBAIG6t7/N8KHmVN0Y?=
 =?us-ascii?Q?r8hfSfVj+eps//npGMzRjr1yxtHh7DIvVx9MSXVXc+s+xJGNX6lH8W3e8FX1?=
 =?us-ascii?Q?ZOI+3Kg6WY2ICcGj2OD2KDK3btebg8TgN+0CiU8Y9I49TcwRjyAJ6oPhsz4o?=
 =?us-ascii?Q?pGXxomAM17TGGGUPnvfA7SlLbXw9PP3VUuP1fyPLfzSbU+iw8abyL7ya+dhv?=
 =?us-ascii?Q?8FFR/qr0Pzk51nvkS9JsnizKlcANxSe0/JZueHGydSvjECLoakm8UsgzAy/I?=
 =?us-ascii?Q?dJAmWNuv68bAfjtjGsbuTlZKSwbERDAmfsm3/M6tKV6a61omzf/wpz07clZR?=
 =?us-ascii?Q?dge66TtEScT3PHvmuCZOB8XATaPDNe2bcSQV/0PhHuyb2rf6lge9JAQKwFQU?=
 =?us-ascii?Q?lSVulDIJUCtIbwtuU1Sr9pn8q6J3+SuhaX16ryDVDuLA5rDLNimuX6N03WIB?=
 =?us-ascii?Q?ObT+dCVD5HZKX2GKznuzNviVf4gc95SSKQihUZNNRGvk0TtPoy3uTBMl7aYl?=
 =?us-ascii?Q?yIwXtR/eGZ1vW+u++D9aMwymbSvaE1dhWxSxdt5Bbv56dD/+RkWP1HiQ7jQG?=
 =?us-ascii?Q?2+97ZlRt/aeAOSacXK2afGAoLbdOzew9NTGnWJKP1VHAHa1oAoF2iluzEyW6?=
 =?us-ascii?Q?TmNA4ynxOXgwP3PM05EAfHwTJvxV7zFPY/kHCcMDVhthLv+vim9sB7Bnii/h?=
 =?us-ascii?Q?NvJ0A/NJgYG9CemJXPU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+mtqVz8kpeW6KeWOdAeSCXnS2ensiHteSnq5lCdPcSxsBUvV9BIRmnwZMcy?=
 =?us-ascii?Q?yNAUnQrFEPUHneuynR/F6WwOTAGi7Uj7pH3mAKgZaJjnytPKnkJQ94+JWl1C?=
 =?us-ascii?Q?6FGdfqM9P/cszfQ9Sjb+qWx1hEehHo8fD2/dJK7krfw5BSu/g0xJDAqAKVSK?=
 =?us-ascii?Q?Ln9rMN2Bh/8P0G6x6xJ0KK2hl3S0IK2B7caCNndhePWnNnPiZpTTkD6fPruZ?=
 =?us-ascii?Q?v6hjwsH5pqi1fhJanTAJw+R9EQBLtedI6LIYHIX2R2AjxfIcR2klreL10dNp?=
 =?us-ascii?Q?0f32NA3XyDOk8PTOg2+exUx6wkJbN4B8EhqXNVUh94b4HPrth3DSF5bE3l+R?=
 =?us-ascii?Q?1d6/0B+LOPhzj2jEX8uPk+LijdUJc7sUwILxwS7q9Vd68sn2XYJ34UbivQMk?=
 =?us-ascii?Q?oEkibImjK70tTf7sWBMVayfo+AUPdpC9M/bWXRYQCNTFfciAP7AVAAOnE3sH?=
 =?us-ascii?Q?GHaaqc2QTSvkPWxsK3YJmP3t64m0+tGFaSP30zkPh7MG8FAQUV+Q4HyRD/mP?=
 =?us-ascii?Q?AdZoeHXvtJxo98Vvmn+1eBu4z1UKOPdB13iQjiMp/koLRMYONSay/z7T8C9v?=
 =?us-ascii?Q?H3q9nyh+CbMuHpDjCliJmEJWcQ166KzrogMof4JLWaMLWe8iynhcl9PO2Xk+?=
 =?us-ascii?Q?uTnMpvLRwat/qowRlbaIvTctMRI53K8wscW6PW0pGQmQVGacuskS7gHRlZ4X?=
 =?us-ascii?Q?6imuisQ1yPaTLZ8+WaQQ9kbJ7lEh7XKwuLEVYcB/YAkYt3ADAw1pAVDHj4BI?=
 =?us-ascii?Q?YRF/lNOsjZIAnN1FuI7pdY6KJW31c47RsyoLYTaEVxeC6GsMK/a5G+9/RPl5?=
 =?us-ascii?Q?xs7gvflOySi7BD5pgvnrjYVVX0JtcNDHLI6/+NOteh4SIlEtyKjJsPHssgG0?=
 =?us-ascii?Q?75W0cTIBYRp5Ywfbe4yweyA2OZdmK5kxnXgA6SXwYpRg3ZdENsyYyH6k+w60?=
 =?us-ascii?Q?eZwfcN9V9MmpAeMoyAHEeF8u0PXw7Am8pAT0JelN/qowr+P55i0F+fkccd57?=
 =?us-ascii?Q?eJei6C2fNBS2RsFBE8ltmmjd1KW8WpZ8LG+oQMC7SPu5M5+sR/0OZGSvrn5L?=
 =?us-ascii?Q?QiQUcI/7LzCtEfryrUknWnPsPQXT1IBzt83H4PKZV/33jVC/M8z0wXoS2E1z?=
 =?us-ascii?Q?N9JEqApbMg/ul5WOeqNPoGcPjhV6WWJtOEhondrhSWp0BzhuJkCA3GdXnOZP?=
 =?us-ascii?Q?dKeTYEK2RuMcE4EtYJuANOJatqHtzY1ODzBzq2t9GDLO9gCiAKlhLG8vfel7?=
 =?us-ascii?Q?x3wmXyE2600qVYaW8vtqEmMpHg8S4A/gNGeSaYx8jSsjHzGI5mU8rG36AVVX?=
 =?us-ascii?Q?qxwW7lesWTxRfjPbQumO3LiacdEj5rptMgUqwwSXmnfZACAaWbTEpW2GwxGP?=
 =?us-ascii?Q?XpM/28xahp5oog69EK7WJd5G6/FD9/X9Lv5S6anNbkdtmoKZRm/a1jLQOND5?=
 =?us-ascii?Q?PjDw1UIJrgydldea9nFNr1CqTzl4xlCRAaRAzrWP7zc2p4eNCTWFDlz496jI?=
 =?us-ascii?Q?EMlDalBmpjfQCnUI94mB2UcTgMDF2qB9U8q5qYQ5zo3a22tVMN7fKxFhDPfr?=
 =?us-ascii?Q?qwNdcHvBB9e5Ueqdk1sxE9J7DJKMkxqKreOeWkB7P3PAjo0nVcZeH7Yxpn0S?=
 =?us-ascii?Q?/LF0AcZciO2leya+8VsG/06bXkg9RoSWtUJIN4pXTQ7m8j7ffE5xdVTEolp4?=
 =?us-ascii?Q?rrpib5oiesVSvBOGExVr7YX9KJNOelISvMZMeLfO9HXm9kG0RV0YzKhMbYTY?=
 =?us-ascii?Q?Z92kYkxieA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8493bd1-7ae3-4eb9-d1af-08de5d23565b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 21:39:09.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyMYnH+ko2B5+j3RUJAC410CkN96hztQaxqJVfu/j+D1Igl9Oob8d/GTfQ20XlXTtheJX6N/ZWHXUolleg3s9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

On Fri, Jan 23, 2026 at 04:59:17PM -0800, Vinay Belgaumkar wrote:
> On PTL, the recommendation is to disable DCC(Duty Cycle Control) as
> it may cause some regressions due to added latencies. Upcoming GuC
> releases will disable DCC on PTL as well, but we need to force it in
> KMD so that this behavior is propagated to older kernels.
> 
> v2: Update commit message (Rodrigo)
> v3: Rebase
> v4: Fix BAT issue

Since the only real change in v4 was the typo, I have modified this
note while pushing the patch.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
and pushed

Thanks,
Rodrigo.

> 
> Fixes: 5cdb71d3b0db ("drm/xe/ptl: Add GuC FW definition for PTL")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 54702a0fd05b..5e5495a39a3c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1198,6 +1198,36 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
>  	return ret;
>  }
>  
> +static int pc_action_set_dcc(struct xe_guc_pc *pc, bool enable)
> +{
> +	int ret;
> +
> +	ret = pc_action_set_param(pc,
> +				  SLPC_PARAM_TASK_ENABLE_DCC,
> +				  enable);
> +	if (!ret)
> +		return pc_action_set_param(pc,
> +					   SLPC_PARAM_TASK_DISABLE_DCC,
> +					   !enable);
> +	else
> +		return ret;
> +}
> +
> +static int pc_modify_defaults(struct xe_guc_pc *pc)
> +{
> +	struct xe_device *xe = pc_to_xe(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret = 0;
> +
> +	if (xe->info.platform == XE_PANTHERLAKE) {
> +		ret = pc_action_set_dcc(pc, false);
> +		if (unlikely(ret))
> +			xe_gt_err(gt, "Failed to modify DCC default: %pe\n", ERR_PTR(ret));
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_guc_pc_start - Start GuC's Power Conservation component
>   * @pc: Xe_GuC_PC instance
> @@ -1249,6 +1279,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  			   ktime_ms_delta(ktime_get(), earlier));
>  	}
>  
> +	ret = pc_modify_defaults(pc);
> +	if (ret)
> +		return ret;
> +
>  	ret = pc_init_freqs(pc);
>  	if (ret)
>  		return ret;
> -- 
> 2.38.1
> 
