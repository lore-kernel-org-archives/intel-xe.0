Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73609C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 20:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031C110E193;
	Mon, 31 Aug 2026 20:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VimfmaFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8C210E193
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788209439; x=1819745439;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P0A8HO/m5R0JPU8SG9y1mGPnmYlVpFJ53Pi9s4uBvrA=;
 b=VimfmaFjQF2h/KmT6wqpasBtKLf8loXb5d0H+CCAwwqEYaonzlHCjjOW
 MCfwdxdVBO09PgcWhyMJ484fVQYTcwEFphqRUKeJhg/UeaCHl9XmIsWly
 wuBZDYC0QRBrmyEOHd51Ki3opK8tcrQRUTqjCUMs8uJKA4SUnjETPcCtQ
 AHoLSdpCCDq6qMyOlCab0jHhGMf0izD9IWWNJuAOKyNcYo/D+7kQuothC
 /5lAtZSwYM4YnaofgsHJDHfK5PYcWMdTnder1JtbNAzgz2lO2haQhJiob
 MmShpFQOEMIOOTCDNRJheLqjqhyZsQ5ZzygeGiHlpDYpO1j+0kTO+Lrcw w==;
X-CSE-ConnectionGUID: LobamlIWT5ecd1inIkB6eA==
X-CSE-MsgGUID: l8TmRVNqQQGwU9MYi7UtkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92438802"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="92438802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:50:39 -0700
X-CSE-ConnectionGUID: 73GTRXFrSYqzYWWGpxm1cg==
X-CSE-MsgGUID: GhJ4UVjVSd2Qgdog4MDAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="266313116"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:50:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 13:50:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 13:50:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 13:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiiNuXd+80tJMi/ZMi5L0Z2GDS4SHtDVeeOR8YoPMbtdcjaLq9OhrgXkxmWBpwzUMnNB3ddBOtbAiIm3oC/cHvpHL8R2oz7gzgbDws29zbx5u2u0OF1vEGyvMdum48sYi+X7h29mYNnnl97fSqJJ3gobfxehagaW+R5yZebMLMxv1KdYcZk90SEGyWKNboONltVSEsP8dHATlb4fiaoDcq3kaSZH4rgVSkiUqw09ANhGQAb2gQu3xeNtwqNoLdhPy9QIrK5fZJFpXRND6gy3jD0FLiUWZbJeBr6iYB7ytBlTXmMsRfgOT+9poWRelm0HawrpaJ94CZt5qCf6zfiWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvvuI9wuEcWYLozT+FAFXI8tWHSwgs5P93xvo8iJYzY=;
 b=GBr+OH2bi3OaAvqy5PblvcqNJeCQK6l2UW6D8TmympF9sqz/rzhWhwb2PZeUhFst9BlhmRb3B1aBccL/esEAWtOLlbLYp3g86YUcv3O9DLVQUUBT0EyOhTut3gTHFdR3fNgm/RnqsZMMltBHKI/3tzuMNHjMTEo0IdrMLW/LeBcVsvPj2/wgGX7nbmpVlYodDU7qshwm7ThER0J2q36nw87w35iaVO/POwfebAbu2ouiD8PUVxnVomIJaDG4wljzgHCiAp+0/j5EC7/QTtjJfpTVK49csS/H5P73Rz2fV2x+f3wmi1aV26UlXLdFEz962H+/db4Mgtd4ZFVW/JUw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB9851.namprd11.prod.outlook.com (2603:10b6:806:4d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 20:50:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 20:50:32 +0000
Date: Mon, 31 Aug 2026 13:50:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/vram: add early VRAM health check
Message-ID: <apXpFrudX40122y/@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-12-matthew.auld@intel.com>
 <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
 <apHoVwMsJtrSDIVb@gsse-cloud1.jf.intel.com>
 <CAHk-=wgfOhJwVoe_5AZ5LYRG-hTmBZiBh1EydqCn2qjTakRWow@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgfOhJwVoe_5AZ5LYRG-hTmBZiBh1EydqCn2qjTakRWow@mail.gmail.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: f946d3cb-a126-4d73-6289-08df07a17fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|5023799004|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RUNYsJssRfolTWECizZD484QF28ckw4lUBp87E3ZWW966zZoLLioM0iIHQo0iF1jiEL6kZ1XSNuYTkKogK9PAu2+8VS7KD92kihvfQWobvlyluVSVDX3m3Rr9m1Mci89T5RVRCBBCY5xBnYIaag1/u3GJKqLun4uzuhOrC33Ie87LdPRIMunEPkap84eqv6fdS9eLF4y685Spis8ABSS4oyVnaIDkbCOBvK6ATCZ2xS/NL+PhxLwVaBZtJ+KkEbxHoqNojbuy4Pc+q0ltyhBNjwhFovmZt9Dkvcl4HB+osaeguev8SahrRf+q+z5iCVRG2C0pCW+E2mMzv8psiSX+YugGxg9s35XM38r8q/5iDVIfSPYlX0cLUH+gF9buKGtBLd0ldQsrHRKnMOfQfgTL3zhZ6TF6w8+7qB63lig3pg7ifDFtsSaSa7Y4MDdAi+VTN6Go7dUePUZUM/cdEjAdLqxNff78omaJfSc0LOLIG02e15UV0um9UkyVffd/2oREW9x9WlEELnE2bqqIoeixYCS14UgquEwQ1yliWC7eGH9w06mxlnealw7y9RrAKl7Mo/3s5Zu5xfzj2oJr5/HbseXDFL3WrKB8clLCtoHlsRcWywKsUfvq5Bu0qGXS+TbRnwa92MUH/U4pJEyeR/BjyNmhArZiwWFLXjBgTAnmGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cv86eyYTxtWIAQv4C/y7IWDeDDN7xTkaTEgMgUljz/p5dOoJwVdtVAXHgqpC?=
 =?us-ascii?Q?vTRSUZNE7krTLYkEv7ZPrThp+J7Kr1eWjbrGeTHyAevIKvSwUfSAa0kDdj7p?=
 =?us-ascii?Q?5p/roZlkbD/uloWhGOvri2P9U3U8JohgtjQqDpj53YlIodwdmNjtljZan0Wc?=
 =?us-ascii?Q?4B+9i9cfnoiXDO19kvTlsMyo/Wyj3kqz2qxf2PofiEUZ/UbY//K6M+lzwMQy?=
 =?us-ascii?Q?KTlZf7PQp02/pGytoamxhA6UWgrFMJw+lM4zsypLMp2+82fkifp/U4oK/BB7?=
 =?us-ascii?Q?mbpR13Nu9kRYAthEISdLxDt/m13sIy5sos89Cz1wuFJyGqSkN95ls1PLR6+m?=
 =?us-ascii?Q?b4XamW09RsyxjiWcewNZsz3Fb1qJc9uz/OluVhdbMKUxWmFCG8pnkAHOAjLi?=
 =?us-ascii?Q?/+iprj1MTj1fPZJHQB60Sc7CkxHqCeTBjPzgvYLgyTxePMbyW+kpPcLQ8xIu?=
 =?us-ascii?Q?PwoT2Y5s9D/vgIZXz1jj7B2o6Sg1B+6ubp1j1S1mlL3B3QOTrci3N7Qiwlbz?=
 =?us-ascii?Q?3OXWaX021U/1zuCJ85pIPXJbR4m12Lwn6RdfHn8LwiXjozkN0+Yq6dp1Q9i7?=
 =?us-ascii?Q?HigyIfkUyEbJNoY05EtHxkknWN4vE0gkz9VOoRc6b44ElzqgpkUZPDfT0Cks?=
 =?us-ascii?Q?dg/hTpUE0Wk61etCwj75o7JFN71KNN3qenLiHokVeIWVQ0iGchWbatfmcIk+?=
 =?us-ascii?Q?DdS2ABKkRDli3k/SYarwwAP5PNs3dSBLrZbRflTIvZTdovdMpvlLVH2rnPEp?=
 =?us-ascii?Q?UPW6+9UD5bdcQAa7iXn3bUO4wbEyyujL+Bf+Cg7EbBFrX5hBJ8gNxcqJfb/T?=
 =?us-ascii?Q?5wKdu0u8nRGgRsSO1cEHOtiFW62QMoW0aaTlibk/gc2Ab8SOZPTiOdkxZXo8?=
 =?us-ascii?Q?D1YnHW0fRcUPQ10DoOujZeEFBGcCjwUw7bOIVJLOmVmgQE4yISBorbIdeuQy?=
 =?us-ascii?Q?/Z3s6lkfMzPDO9hNdIHoc5+m7Borw3G325i1C+O/KJTXCIy8cl71+b3iPmn8?=
 =?us-ascii?Q?9vh+LT+POtDgNr1mSka+6fdyOQRwZhU9pfGim0Q1rzRAVj/UKqtr0fwt1duc?=
 =?us-ascii?Q?/rmQSiFOH6s/CskHX3lwnmqxXB+sLyNP1mKyf8k+zKMkWWERgQm/FwBwyP/U?=
 =?us-ascii?Q?Jif+pPDNpIaJZXtguVbW2zPLvChZAJEfFkh//9lIluw0bxb3+fF68Lrrzag1?=
 =?us-ascii?Q?QJzn9bkDhr44gygvwo2YIBtnaYjYo6O0cSOItUzOxWA8+/9yvSMGs1WvPOaG?=
 =?us-ascii?Q?8KuyWT4r6Gn9rzg26JBLZsi6c9tazU0Q3FAJW0QZVoyZCDZ+2d25fIIyky6m?=
 =?us-ascii?Q?8s6V3w/LRxh4pusaOpJHnLZSFH7AfZHgGFq3l10a6gJeWpAxJlrHKtVgifhB?=
 =?us-ascii?Q?q5IJeYViEdEcKcMzEIr7OJcNPRRHRjbvtYP6tVVEt6KxNLapkflU6iV4l3DP?=
 =?us-ascii?Q?AqYgbsEKlR8i+DtSb0gUhFy2rlx+H3GwtdW3hLN70vA4JiAJHUgqybv+xGHo?=
 =?us-ascii?Q?oNW+EEm8bdvHJkObA6NwcgdMEheZsxY4oAvjLn8iUxGXLFJLiGQWLY5nyo9Z?=
 =?us-ascii?Q?RHgHRMRPqU+2ihjtVDQ89MM/jX/Gz/BVS/ZwWjfG5P2NTzTIWMUIlhYYTiVU?=
 =?us-ascii?Q?NFfNa54Hjxska+rieB3ZwwMpo2INKgziMl5EiYGc7hHEPbAY7bwuD9ljNXRN?=
 =?us-ascii?Q?uF9VbXlgUrW87jAnK6aOiXfLI2q3mzZqumkI65LulSJY6L0/DGYj0yMXtHVK?=
 =?us-ascii?Q?3bc/ftT9c8E0NJ42T28uF6WFOLiXQfI=3D?=
X-Exchange-RoutingPolicyChecked: NCNEgubBmYGfo6b2hogvcQcLsSZxe1lVIju4GNQ/N29kCnp3ReQl5czIx6Y/xFxKQRIQ1KxcwDjROC4NyIAl62Y5y6q60PclNu2oAQxiN6JAAW8zjyxMmV1txzua0FgC2I59IPB0gfAvgrnJyIia3sOU3X1JjrDdcUD01yMAqspbrvyW4PI9ly2DcxFoxTP41p/+174X6pd2UCpC2SDe/+wot40HIY+K6reO1ULr7C/hEqbJro7WN+QjzGJl7pHMoWSOi3uz/o3I7MHruTHU4mlIAQePcb9+vDpEPRt0e2tOhIZ3x+hjzQh0uw0fuyWoEJbWmC5NnUmmDMhx8rvvxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f946d3cb-a126-4d73-6289-08df07a17fe5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:50:32.9398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+oxZnMjMCEmiZb/BlZ0I++3+3tlXiP4y1poymjW6vzoLUtzs52eG4/hu0k6klx3snK/h8eXCgaQ7bQGE5ODUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9851
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

On Fri, Aug 28, 2026 at 01:32:31PM -0700, Linus Torvalds wrote:
> On Fri, 28 Aug 2026 at 12:58, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > I think it's OK to go ahead with backporting your patch to stable. I had
> > an open question about whether we wanted to implement the fix slightly
> > differently to avoid asserts triggering elsewhere in the code [1]
> 
> Hmm. That patch is odd.
> 

Yes, a little.

> It says
> 
>  "When VRAM limit (usable_size) is no longer 2M aligned (e.g. because flat
>   CCS storage size rounds it down to 4K)," [...]
> 
> but that was never true, even before my fix. The usable size was
> either 64kB aligned or 128kB aligned - it has *never* been 2M aligned
> as far as I can tell.
> 
> Now, obviously, if alignment never did anything at all (because CCS
> was already completely aligned), then that 2M alignment could be true.
> 
> So maybe the 2M alignment existed in practice, but it was certainly
> never guaranteed by any code, and any 2M assumptions were completely
> bogus long before my fix as far as I can tell.

Yes, this just happened to be true because of the rounded-up 128K
alignment. Nothing actually enforced it, nor was it required.

> 
> But that commit is odd in another way: it changes the  code to do
> something completely different.
> 
> Before, it didn't use "usable_size" at all, it used thje *actual*
> physical size. Which really *was* 2M aligned, becuase I don't think
> Intel has ever sold any other configurations than 16/24/64GB of
> memory.
> 
> So I don't think [1] actually exposes anything in my fix and I think
> the whole 2M limit wrt that code is actually an entirely separate
> issue.

Also correct. Your change prompted us to audit and clean up our code.
That said, with your fix alone and CONFIG_DRM_XE_DEBUG enabled, our old
bogus assertion will trigger, but it is meaningless. In any case, no
production kernel enables this option.

> 
> But I admittedly *really* don't know this hardware very well at all.
> 
> But yes, this kind of "my fix exposed *another* bug" was why I was
> worried about backporting it without further testing.

That was my concern too, but our audit showed that the only issue was a
bogus assertion that fell out. It isn't a blocker for getting your fix
into stable.

Matt

> 
>               Linus
