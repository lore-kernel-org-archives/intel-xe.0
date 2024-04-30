Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8866BC10F16
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 15:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B891125CC;
	Tue, 30 Apr 2024 15:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGSybqvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B30D1125CC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714492588; x=1746028588;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HTa1s88cDxhtFTQ74iL8XtevqSPLctNGyCbMdWCLZdQ=;
 b=SGSybqvYOOFY+MjU4tn4B1+jlpxwviKcx600+C2BXj5rWqH2fD3wUd6D
 F1sLqqF5KgIogZx9h3cvOcLBSMdU0lLArqUcHQiB3jKHoL0jXXXTj02id
 7Sexr6fK1q3hR9afxj7pDcuAOYwqaFJtxt6gbxKXyFVxUqf5LPVDvtmFm
 cWgNrocl5Bc5A9eitt8ESRdCKV8zJ1o4//TxZ+nvVsK4CUpvr0/BOFlYQ
 X/2iPAWOpO3wQ5gQ7wUH+IZCG3qFa6XamNsVL52Ka8O/PNSTzLu5wBobg
 suzbgzrX1IPXFT0u2rKwvWZalc/qgiLgTHES2SiIPwNGf7imrvBL+AUx+ A==;
X-CSE-ConnectionGUID: vRrFjHNoRaGrRd9jmNpk8Q==
X-CSE-MsgGUID: csyqAVaQTNadeJ6ApsHQ6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="27656268"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="27656268"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 08:56:28 -0700
X-CSE-ConnectionGUID: YhCeTN0kTMiWJVAaR/qbdQ==
X-CSE-MsgGUID: k6A56rO/QHy0N2zG2jVFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26588175"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 08:56:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:56:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 08:56:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 08:56:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 08:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5XnmXhjEHOr0axbI9fM82/5izIxuaWp06AhckZTRfEDN/fwOKuHIHJPyZpHGpxn/+umEoFdNYYxw0z235TG3nTWxGPbcACcoXKSpfJwss9wMQubYH9GouXsGZvgZeWMQSmu8y7AW8JYH4TZFRrIMhVfsLnuLtwIeARaxFJohTzvdoqjQ66yVTt4sF+JXoaUqnRM3Bn2v3HZgkLXKVjHYJ0h42MPIXzwru+w8ZCRtlYF05PEl/qeVwLz4koIUtqHW5NOb6ZF4VUOONr9XFEEnQ5gWKSvSME7bEz33m7GkCgCaHqPxYztm01qDXI531AMqjr1m4gtxmO4GuTktHZkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uevIVvhqOZXMMrBog3ElU2RioFqJ1GPAKCdE09FKCXY=;
 b=H2jPCn/FJfmzXrC7KP8q/FPrjcMXGTM89w2kJ6uhVG7rP/m8iId7is9NJ4FTZqB9WYsR4OkPfxlLOxJfuabfQj0wNyy60fpNw77X0MsqErP82vLs3C3+XfPJQcdqSE6J/j0Vod/cdJjaJo+n68AvyrG/PvIy4R+qtl+9eELQUk88cyVUz32oDVPrd7GOsVz9qQZpDjXGbnLz+oyqezRi2X1Xaq9mZoNCNvskGzwri2ti0U+qLieQH+kfjpwBd3tEWBuOLv/Pd5F9ofHIhISNRrHHf8EHw0U8yzNEH6m3yMOHZ0RF2hiKIMPs/F6Qt2kU5ku48X4Inq4asapl3Gpwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 15:56:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Tue, 30 Apr 2024
 15:56:22 +0000
Date: Tue, 30 Apr 2024 15:56:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <ZjEUm9LD8irh+eKh@DUT025-TGLU.fm.intel.com>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com>
 <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
 <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 8895b33c-3086-4704-8ca4-08dc692e1545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LklrQ2iHegbHqWuK0lb5G8V+qjQH/Fz7eTohWZkc/6mQjJjht9grI5+VTvzf?=
 =?us-ascii?Q?SZCpKfNBVapDnKgfkpbUfmL84U+3WMfiVHMIYqBBlpxK9Jd+KAavv8hwdFyR?=
 =?us-ascii?Q?wG6fCoH4NWhsvcVZFapUvLFgSwimuzkiY7tXTn7kK9opbyJ30FP99e5GnWNQ?=
 =?us-ascii?Q?yYCQXSTuB2VVXwJItmIkZ954vwWPG32ngnZMVAeR5MzRS/ndU93pEMmLxTDW?=
 =?us-ascii?Q?z1lmhrgbj598F6jHe6M7IDmUtdR54vPE6bPAAAU/MO7tK4Z+AcGF9KXfoVRS?=
 =?us-ascii?Q?aZlBOpgzvzOu5lgdN9Pl6nSfbPfeIckwvkEjFy7zSb9LZjPrliS5eeD2hXeA?=
 =?us-ascii?Q?Cb1apqDWRib6M13nfXx+oHjRBkwdmPNq3mjYePwbeOUySaxgvek9a1IMX8Ga?=
 =?us-ascii?Q?CYi5t+ROQYZZu+hKQe3zepHDWto3jjO+LwiVt9lSBCNMnKZLfbJOYXc/e3T4?=
 =?us-ascii?Q?1SncDquhh1Xr0jonCXf0Zy2NnuF64YoUT37qhiEv80X47piiGwvmvwLO23WJ?=
 =?us-ascii?Q?LdPXMnO4jxHbXWiIh7EMdDsqyPDgtgWm/7Hp7n2a/Xr3dJBepPCSyILtL3A6?=
 =?us-ascii?Q?PTc2NNV383ydYI7fQndDkGBxtqXDSJ4+QyTbWZJQ1MwEIhT55csS0+Bpajnn?=
 =?us-ascii?Q?RD08CLuEbSddCiOoNTn+ieJoZUvEUd4SdFidDa45RePPuPMVaS7FzP5QOamD?=
 =?us-ascii?Q?wu6IhaafAi7l9VXB4G8LDr0i5xsv1KnPjjxxO5tau14c4R+kcgJCfJvrHVP9?=
 =?us-ascii?Q?+hJOdi3ZYixDGGhfOk/xRzoj4hdRFVcaFSBuqAhxP8IRTISnfv0aScZhNmKE?=
 =?us-ascii?Q?qFa/VS3Wyq2/IcAa4GfSBWDvrFlRkcfXr5sktTYpQxItWKbD6lwptlIcgo2u?=
 =?us-ascii?Q?L5hqCxS5GAbbl/J9PPEbGty4ZWc+VL3X4zvGt/RmWxKRkA7t4SCYaNI1blkK?=
 =?us-ascii?Q?pdNTNwNTDxOi1gglpB8T3Yux/8UXc1LdH665aoy6C3WzA+umchiGFfeaPdiy?=
 =?us-ascii?Q?wX7kpdH7OQJb/OV2+IIun6zzjWDWYofhdtteXC0Kwl5CZdEZw7KLpeRjc0kS?=
 =?us-ascii?Q?g3YeB5QnlM1RYWtYHlTxBtT4V9bIunVqy/5jY7jx6uxjH7wrSIoqGvqMqMqV?=
 =?us-ascii?Q?tl3RLnK4R09WMeNxxGjiSN4V2WGN2udwxRwnGOoGxoO4JKzCvd5/PzB6sKA5?=
 =?us-ascii?Q?nA+Kt3AHrbdcKaPLliP2bclieRu5L8OCsnbjLMsfcAbJnaHMjQH7Gecv9sc7?=
 =?us-ascii?Q?BSk29+fWdbT9LVfHdFSlr5YYNeiSpksCTF7FrqELSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wbaksGljJbcH5dxRB/HOArtF8VJnhvUXidGHx8w9FRwVXrU8VZ8FZiHHVW4B?=
 =?us-ascii?Q?eBCkCGGTMg/wr3es87VPAyFIXrv8Q9FF4NVT9rs+NESMbkTbQQ0NVXinLdQ1?=
 =?us-ascii?Q?NpUeJIw+omAGVfADAP3UKzTJ4NYURT8wcWtHcBznDQsDW7aBAL2Udr4FSO4F?=
 =?us-ascii?Q?zeY8ZjNqc3j3+J+t6dteutAyH/pP2AaDa93juJ1Mncn4AIPQrNzRHo+TFXoV?=
 =?us-ascii?Q?2ULKTGROlUUwTrawaww8VpkCupIs0BwElijKQiC/1lZ/Y9klOYF63aT9B3w5?=
 =?us-ascii?Q?AJSw7mQJNgiw3cg6iQzfq9zGkzfNgY5KXO73kl2WsR+3ZaUbw0272cWun3kv?=
 =?us-ascii?Q?qMKLr9NeyfUzbU5OmKLGYgFqh/kLijNkw+dOLJPyl6vm0LxlIbtWYFlLJxXO?=
 =?us-ascii?Q?iEnoXUO6g43gWu4ZJ8+drlXwBLgtk1+bVeQqFWdUw7JftBMYp/JswQCHOCI3?=
 =?us-ascii?Q?vYNLUS6xn0HxmhcsQIRtboxju8cdqcmFHbZXdDFcTSXVkLnI/A2rA8Oina7F?=
 =?us-ascii?Q?3XZO54TxihkI+jGwPirUIBa8HEj6ZMCEdZGZxjzZh4ZqB4nNLOedFIoGpdUx?=
 =?us-ascii?Q?iZHl51o3KMO0WhweBP7ajYgmJIGmAN12MHZsgW0A7Aa57C/eRgFLOJKpq1Ww?=
 =?us-ascii?Q?bAgNIMbQvgWToekV5wRXu6k6y6FqlXvqHppmRGrTkJPJZmALTBQwYB9VSp45?=
 =?us-ascii?Q?dogRJ3/uIBMLvwyA6fykEzXDruw5gYREvu69rwLq8T5SrBWqIVuaHiY+XnMk?=
 =?us-ascii?Q?YOqO/jdFWmE0/QL0Wqjgjkb/lcGcX2aYm2llrsC2UJzV7btyl4wmpedUMucU?=
 =?us-ascii?Q?gAnd7V2IbGpj/zO5SvkXnE3KOLgjCmJKZDkMmv4+DI1eFcNsAcFBK0fA1wte?=
 =?us-ascii?Q?/rsGPCf02J1ZLOPrYoadTCeEbq430sSa1GOO2sNEeW4nxFtLu44IOEQTumL3?=
 =?us-ascii?Q?NJD5gwfPGe/qBJAg9TCCdLKcLYjaeR8dNaSeZjZlL13lxk/nAYPv0m4S0+hw?=
 =?us-ascii?Q?t+YZJDON7z2X6fqhz2SQLt76eaCk9IgmdBQikPMk7YHxhWhG75bt8fMUnYRG?=
 =?us-ascii?Q?1DgKcw4CpoKdtZ6J+fRxKYQHJTSMWAe0Ic8skeV5tI2yZ0tb3funjIbthOtM?=
 =?us-ascii?Q?WBCFN2JuPJhiIa4mU8aVzPvIYvVCAsfJfhTPSOfezf5uHe0aAXLXnvMNG+UN?=
 =?us-ascii?Q?JJvT6ykVfRC6zPs46G6r3zZ5xBTEVdrTlXKOtUDagt/bEUpm8gYuOTpjpjsR?=
 =?us-ascii?Q?8BKZjVTR0adbqVhaTvVAZ5vEjAzy8IB26jX1jCNKoRPdZ45Q/WY0sGwgzD1N?=
 =?us-ascii?Q?TSxu/GjOwIeuEBV81xRDZkZjYQmpwDswIfA+EW1Q0XoUVTeNQE/gk1MVn3o6?=
 =?us-ascii?Q?RGCgWV18k0wKUuA/R6Of5imX5vf6WktyzpHM6ybDt1BCpgPxDuzyk58HdGEu?=
 =?us-ascii?Q?+FYH9YZfhpqpzSV3dnjwtjgsUq1kLmH/3IYuKfg0df/9RbGuNVMyFXObaSA5?=
 =?us-ascii?Q?8EVfsvhV3f04bJ4fqNCBX0m1UfvtL6tVD+DnqojvM0LT3Nj2zEhy3GrMCYM7?=
 =?us-ascii?Q?1PYvOrqktiNkZt7lgkBNPfG/MrVsezIcR+pZ+jLHnykc964W+JcJHuSULk7b?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8895b33c-3086-4704-8ca4-08dc692e1545
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 15:56:22.7287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2y6SRHWg/mvDwXn+Iuah7y7mnGoqCrfh9+P1d1Tqw1bjzk3uWZLf31MImS20ejEkA9xz2I6R305P+yJZsr0Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
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

On Mon, Apr 29, 2024 at 04:03:25PM -0500, Lucas De Marchi wrote:
> On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
> > On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
> > > On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
> > > > Not really used, it's just a copy of engine_mask, which already reads
> > > > the fuses to mark engines as available/not-available.
> > > 
> > > I got confused trying to understand why this ever existed.
> > > It indeed doesn't make much sense on today's code.
> > > 
> > 
> > That was my doing with the intent that we never use the engine mask
> > until after hwconfig load as the engine mask would be read from that. Or
> > alternatively in SRIOV via CTB (or MMIO) relays.
> > 
> > i.e. it was fake way to enforce correct load ordering.
> 
> but we never used it from hwconfig (instead we kept the fake copy here)
> and we never will as it doesn't have the info we need.
> 
> Instead we just went out of our way and started using __engine_mask
> instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. I fail to
> see how exactly this enforces the correct load ordering. At most it
> would return the wrong value and we would silently ignore it (e.g. if we
> had a call like xe_hw_engine_mask_per_class() before that point since it
> uses gt->info.engine_mask).
> 
> For SR-IOV, nothing overrides engine_mask anywhere. Not even if I look
> at the wip branch for VF.  So, I'd say that if VF needs it, then please
> add the prep together with patches making use of that because the way it
> is is now it's too fragile.
> 

They should read the fuses via a GuC relay.

> > 
> > Assuming fuses are read after this removed LoC, the load ordering is
> > correct.
> 
> fuses are read much much earlier than that, in xe_pci.c. Why would it be
> wrong?
> 

I was thinking the fuse read required hwconfig step (also brings up
CTBs) but now that I think about this, I believe the fuses can be read
via a MMIO relay so the current location probably works. Double check
with Michal Winarski on that.

Anyways don't let anything I say hold this up.

Matt

> Lucas De Marchi
> 
> > 
> > Matt
> > 
> > > >
> > > > While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
> > > >
> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
> > > >  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
> > > >  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
> > > >  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
> > > >  4 files changed, 4 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index e922e77f5010..00a22cf2f5b5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> > > >  	if (err)
> > > >  		goto out_fw;
> > > >
> > > > -	/* XXX: Fake that we pull the engine mask from hwconfig blob */
> > > > -	gt->info.engine_mask = gt->info.__engine_mask;
> > > > -
> > > >  out_fw:
> > > >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > >  out:
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index cfdc761ff7f4..72568414fb7d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -116,12 +116,6 @@ struct xe_gt {
> > > >  		u32 reference_clock;
> > > >  		/** @info.engine_mask: mask of engines present on GT */
> > > >  		u64 engine_mask;
> > > > -		/**
> > > > -		 * @info.__engine_mask: mask of engines present on GT read from
> > > > -		 * xe_pci.c, used to fake reading the engine_mask from the
> > > > -		 * hwconfig blob.
> > > > -		 */
> > > > -		u64 __engine_mask;
> > > >  		/** @info.gmdid: raw GMD_ID value from hardware */
> > > >  		u32 gmdid;
> > > >  	} info;
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 9f6e9b7f11c8..59a3f24d31e6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct xe_gt *gt)
> > > >  	 * all of the actual service copy engines (BCS1-BCS8) have been fused
> > > >  	 * off.
> > > >  	 */
> > > > -	return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
> > > > -						XE_HW_ENGINE_BCS1);
> > > > +	return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
> > > >  }
> > > >
> > > >  static u32 emit_clear_cmd_len(struct xe_gt *gt)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index a0cf5dd803c2..6b2086ea24ab 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
> > > >  		gt = tile->primary_gt;
> > > >  		gt->info.id = xe->info.gt_count++;
> > > >  		gt->info.type = XE_GT_TYPE_MAIN;
> > > > -		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
> > > > +		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> > > >  		if (MEDIA_VER(xe) < 13 && media_desc)
> > > > -			gt->info.__engine_mask |= media_desc->hw_engine_mask;
> > > > +			gt->info.engine_mask |= media_desc->hw_engine_mask;
> > > >
> > > >  		if (MEDIA_VER(xe) < 13 || !media_desc)
> > > >  			continue;
> > > > @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
> > > >
> > > >  		gt = tile->media_gt;
> > > >  		gt->info.type = XE_GT_TYPE_MEDIA;
> > > > -		gt->info.__engine_mask = media_desc->hw_engine_mask;
> > > > +		gt->info.engine_mask = media_desc->hw_engine_mask;
> > > >  		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> > > >  		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> > > >
> > > > --
> > > > 2.43.0
> > > >
