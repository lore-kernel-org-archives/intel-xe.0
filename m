Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B1AC3DA7E
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 04:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3562B10E07A;
	Sat, 27 Jul 2024 04:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CirxAvtd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF6110E038
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 04:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722055257; x=1753591257;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+jrsw3TkILxeSuJTezkn9mIYTjNsSKWQ0uqfqdhVTmk=;
 b=CirxAvtdHgvTVggGbY3PQu/tOHASADiSMWzYh9pNqE6zwuCapyTzy0Ex
 lAAr4aCfAOVNtdSz8XyMKVZQCyUNoy5daAc9yjA/QCDrENbLmzInK3iFM
 F4rA2x6cRmHDYyK3BAK4XQHh48KygGcs9lk0OqUAnIGp5Yc+rxe+dJG/j
 +0UhsNw3VXnH3N0ySsXTDD6CZO8iTn8UZmISHGcsndzsWeq9JZwEzazZF
 Ba/h5ril7AWQBkwljdQBmkCRLQcc2O37/s7K8W+aRR4q41DIIxZ6ULJOX
 60AJ/LMfL2gJqWMruiWbDNSS+5HW46lr6rzaJUGVVjXk0PQV/NYuJDzAh w==;
X-CSE-ConnectionGUID: zogcm3j7T0GgFKAqTA7DJQ==
X-CSE-MsgGUID: S/K30dzwSjqMSZPVFHHYyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31249326"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="31249326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 21:40:56 -0700
X-CSE-ConnectionGUID: WEVLiP3uSKy5gluewOmWGg==
X-CSE-MsgGUID: SOuVVA89QdGJIp8l7KKFbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53521593"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 21:40:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 21:40:55 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 21:40:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 21:40:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 21:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRJePgwRQY3QXeHNpS7aUrdwunK88e/PfHOAAqwjmogX1AaZOTbCUCV7x43bVVfjg89J1twT4OS9fcNye487NW4IX3yiBflAg9UbNXWO24VNTiWdsW6mAJNydi3P64mVjnaxoq0WMMXv9ccPnxzAmLd+Tb2arrD/+ODEHsvGV3NRXl36o0Ia5jKOlEWJbuXnR7HvmSqqLD/cQpJ61jrlaf0GfSHkFf1PNbPvZIzkkD/6qID//eAlfQXkyKZSvtm8wsyiEfG1xfq5gXMhqh7bfjXGvOfPcepTViDCzpWLQk5k3LX5iOyN6H/zgXEU8dB+N4rZSSvvyNYOT1A1yt7cAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7LlJFvM7ea/lh+l0Y4ocP8HoGj+w5/EmHzXXyvwQxM=;
 b=UyNWR6GoOFCmK9pbBmfIBE7+xpcnpgEqE5CvSYmlB6L2kEpuwtkBtrqI94BZ+KR3Ceg8nBI9q5F47cL2kAY39EJLVY/qrOhvxAaBoOoaHB+jJ3HNU6qljWS4ESQCrYe3m930jogT8DjV7dumqzUpLvI4BCajl2OCen/+rPK/qplekjGVbg9f44t5PKeAksGOPJrK/J+Xo/Ae7H5Wnt2SsrDdju8mh8ItAsYWzbRr6rsCmUhn1EVrwngyaYcvjRz5LLmuizHKmd98sP8BaQNCwqVg/aaitWsm9C+BE1tiAkHW1ptowrLNCwnyTDi02AxdCwyre2reMViOHDgNNwIYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB5889.namprd11.prod.outlook.com (2603:10b6:303:168::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.31; Sat, 27 Jul
 2024 04:40:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 04:40:53 +0000
Date: Sat, 27 Jul 2024 04:39:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 19/21] drm/xe/eudebug: Implement vm_bind_op discovery
Message-ID: <ZqR6Ejth81FolA3X@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-20-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-20-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: cbabbc8b-dcb4-4c14-8825-08dcadf64c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ogz3VLukZmC6odYJ7VGwk4VEJOIPDwL2JUfuUYJlpilgW/3+wEl5/Mu4DEm4?=
 =?us-ascii?Q?AxHIQ7m9Gyx+aP+nQaRWjMjoJwheuGCjWxbgwJNCGsaLf25wWcw3V8Yqc0ys?=
 =?us-ascii?Q?hoOFtgFHUGVk6D//X+/PgJyqFbTDyq6riFmXonK+4E61K2PJY/MNR7W/B0ic?=
 =?us-ascii?Q?qQHxpZbUlmnSK9OkgxJW6FTADdzSjlGiyreUJU8iZ5Gfi3IXotOVDe6sTBYh?=
 =?us-ascii?Q?QYU6SZJ5cM2JJ1KaTiegKzOPt2QkUK6ZvX6CxQsjxTNkOROvij4eWykO8RRZ?=
 =?us-ascii?Q?g3h+VVGJE5f94ecp0AueCqY6APIumsNHtta07fIDsaYjXKkkTRH+6Dh+sZ18?=
 =?us-ascii?Q?T/JcuH6zPzYWnprDpnbhEuas1fUei4XrQjBz0AsYyKpOWWKso+/5CXLQL1ql?=
 =?us-ascii?Q?Aeez1MuMC6isJHdL1hlleOqfwgiAumXtftCG6mV6aUoKCxNJSOx8FrdtJdFK?=
 =?us-ascii?Q?RhOy99ZLhe5Gp31FuwnLbGER5KFM5mo9HTQptSMAVYYDs3Jibu4Vl7jaiM27?=
 =?us-ascii?Q?ZanGgf6KRi/zh2bArwkqQgKxgYHnWAB1ytdTHJyxNzm4hbYt6nY0DOQhxwAV?=
 =?us-ascii?Q?A/D5zcWmdSckVfRKn/cyQtMtHnAzlmQwNozWCndq4Kwr/Qb1iqgWR6ifoyV/?=
 =?us-ascii?Q?ljnQORHz8vx/aaFkgYTkPVHIbF3Vwt/6zs4AWQ+iHRJ0gOySUcXJ7udLAyG/?=
 =?us-ascii?Q?u6Q/9LG0d/qeWmaJ7fOw/VKOnybXFru2DiODAk3knlxR5OlePJ+jDDebihbg?=
 =?us-ascii?Q?DYx8a/CHo8gkkLQAcxtUT5Pyu/Rr6p92/boyuNmKGs+iXHLZAnJtf8YzcqhQ?=
 =?us-ascii?Q?wtLNMd8iseJVRgfvBrr2EjkJD97WiwU0yEaZA8WGlwm2Qlc8wVcQtQJdWXUv?=
 =?us-ascii?Q?m/xx+5nEgwolA8wa9eUvF3ej9DFfyOmeGufpVsttdhKd1b3gfC78g3WTs20L?=
 =?us-ascii?Q?jnMk6IBy6OWxGZVDmKRKtS6Yh3agDIfHzM7aTjkl/10dqWXTAJGV6sgZF3fm?=
 =?us-ascii?Q?TabkMNYaCI/X7vr6JmX+vWmuZy4K//7RIt+gBqDXJzoJlqybCoEIXRYsHtdD?=
 =?us-ascii?Q?eozwtn2vN8ZLcm2YdVD9nToMd921CGYk6gdE/FK/jBRNuHYxSahvVIh8Vp6O?=
 =?us-ascii?Q?4mAVvmm1744MelJUaNAG9BR9INbXJat1ySc4Lpxg0Mi9pkIk2n7z2tk1Twiz?=
 =?us-ascii?Q?9s7RBk2qaCHnWt2Zbk2ls9Y7o2DllDD5M/eFhKpKzN0Hujvg/9CHriWiRtsm?=
 =?us-ascii?Q?AhtpYGstL5cjnmOUWuyDoikwt66fp5wyNBH/C/tcoRKEIkF9WJIRRwP5JdRN?=
 =?us-ascii?Q?0VqOAR2ffzvR4rkSObpy+fslfUsKo2EAKcrIcvQ+zevr9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yfXil3UahSW5FFdgCp/81QRcZjiTxJxvFi0WpZAbSZRdjuX32W2tJ1IedCEs?=
 =?us-ascii?Q?y8NCsNLyBuVhYd+14h7iKzA5LtTSXAUMxv5veel8iVUheh88yI3ck7/3dY7R?=
 =?us-ascii?Q?5i8Hzca8iLKny4JtArg6A4oJUgSptPwUHzYq6E/wjpnlJkfU90VopIwCRPCh?=
 =?us-ascii?Q?9GnO9yXO6DXODVFcPXIfqQz5l8vXK7XQgtcdDurmeqp3qqO+kdNk9Rnsrv2n?=
 =?us-ascii?Q?dfhJgrQxMK6yvSt/VPDG7Nzfd98OhdMpIBrSoQkPuqa43ocQgb4t6O/1eT+i?=
 =?us-ascii?Q?smk1imbuHadZdoLghEXvTi3l+rZp3rKmdXpjbPZcuQBlVdxiE2XS4rWhcM39?=
 =?us-ascii?Q?2qfujq1Jfi6ZZmqDrpfXpPSg0YOjaN7x1n6GbpcV3Fe38mCsjHDbGmXd4+eh?=
 =?us-ascii?Q?xRVuAzL/fzzDpsUIQfsStTPvjDZdh/GOPovS2rFAr15SJtR9O1jAOd2FXCAd?=
 =?us-ascii?Q?2m5is0Eik48Djd4+5Vq0yXIRpn1KsAbhE+nIdBBRs9IDyb/YaZk2ajLsovh2?=
 =?us-ascii?Q?iMNXktN5D8RrbMv3PNor93tJCcsT8vCfath4us+xhrO2vHcZDT6JLaB4ddBJ?=
 =?us-ascii?Q?QEFPJ18mG4TQSDI4G/NPcbFUFartiWPtchv7AOga0PP6QantZReR4rbvZQh5?=
 =?us-ascii?Q?X2dqle7sin1qOVO0vMts1G7xOFrutTJS3zr4T5o5PHTPugpmvrUbqPAN8T6/?=
 =?us-ascii?Q?8xYq04++UfinOcJ1ovjAvD9ulMsM7l/PEGW/E//G0Wk8XRNwjrJEunP8Ujk0?=
 =?us-ascii?Q?ulbAICYK/fHeLBS5E2+6Sp6PjsN/y2LHVDXtm3iLY3Q6JcufY9g3VePfnY2K?=
 =?us-ascii?Q?lFEUf8Z0nUNMKhIveGzwxbVL54iVKFvDmBHLUipmzugkyyiWAdB5fBpAv1JF?=
 =?us-ascii?Q?X1W52OV9XjvN9d2FaG0NrW18m9lC9GiURSlVJaot1iTE+0tleb5k7BGWt4KJ?=
 =?us-ascii?Q?NP0klsWnIXcLBj7xjd+lGg4n7AjLV92pXOj1UBmbE8O3E3bHWsmL+EVxYH6D?=
 =?us-ascii?Q?DqkXwdlrR76jme2gY1klDD+7GezicUGtYxif1HVEIpt4gv7AloUn/HRjMxkD?=
 =?us-ascii?Q?NVJK2RtVc9G7XJmLwVKkCUiMutjsm/daQwx7m6CtTAquc/B44Vjdgq471PMn?=
 =?us-ascii?Q?b9sq/UH2NfgceXEmFVMcWPCIUxEyXw84+xuKlHn1tW/IkKnA+k0Nsxf2Q1QL?=
 =?us-ascii?Q?ZYM+D0KP8CllHR/diiZ42OdUtJWd5iIZJDMM6nWWRoHt528r9CUJuQXaa6oD?=
 =?us-ascii?Q?ChjO/7DHkYtvtOvwx5JGBoPmbVdJ85dMxX5aRvG4JOGZRUOh0xiW4G67kaQg?=
 =?us-ascii?Q?fe1XkXBKazHh8dlQLbE0g9b6Ltwrxk3qHOJzIpFOimC5NcyrChBWA8mro2fG?=
 =?us-ascii?Q?VV7ZlbG1ZcrwvPsDl97bbB1n/k7cFLu/o2sKv2e1GI+Qwr35hhOu7qsC99yH?=
 =?us-ascii?Q?903rQevF9OiCo/EZAyOBHXqWegA54WdLgkTcPQpK5ivuDrUBgnOxDmKpiFF2?=
 =?us-ascii?Q?G0FWqX/6B/G0Q33pFyT09Xu16Q7AwSf5ELEsYLdiLBJraN+EwPQyRHTLaeiR?=
 =?us-ascii?Q?7CltUkid7lz2FaeWFyhCCVnNoQDze/OgP8PdxjoZCdSflh2YGH5pWxLllEEL?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbabbc8b-dcb4-4c14-8825-08dcadf64c14
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 04:40:53.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEcbN20ztuq9eWVgI/1nV6GabJT5AvytrkmTZqNa6f0PC3ZUXFEyOiSvE6Oj4uCaOVOuPPj9WqdFKljyf5ob1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5889
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

On Fri, Jul 26, 2024 at 05:08:16PM +0300, Mika Kuoppala wrote:
> Follow the vm bind, vm_bind op sequence for
> discovery process of a vm with the vmas it has.
> Send events for ops and attach metadata if available.
> 
> v2: Fix bad op ref seqno (Christoph)
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c | 40 +++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index f0bec8c8bba1..a80ffb64df15 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3070,6 +3070,42 @@ void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_meta
>  	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
>  }
>  
> +static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
> +{
> +	struct drm_gpuva *va;
> +	unsigned int num_ops = 0, send_ops = 0;
> +	u64 ref_seqno = 0;
> +	int err;
> +
> +	/* Currently only vm_bind_ioctl inserts vma's */
> +	drm_gpuvm_for_each_va(va, &vm->gpuvm)

This is not safe without at least vm->lock in read mode.

This function is called with xef->vm.lock & xe->files.lock and we likely
don't want to create locking dependency chain between these locks and
vm->lock either.

Hmm... How about when discovery_work_fn is called wait for executing
IOCTLs to complete and pause new IOCTLs until it is done. We should be
able to hook in xe_drm_ioctl to do this. Then we wouldn't need
xef->vm.lock & xe->files.lock locks either.

Also to be clear xef->exec_queue.lock & xef->vm.lock are not designed to
be held and do anything underneath expect to lookup something in the
xarray + take a ref to the object. Any other use is abusing these locks
and asking for trouble.

e.g. we do things like this.

241         mutex_lock(&xef->exec_queue.lock);
242         q = xa_load(&xef->exec_queue.xa, id);
243         if (q)
244                 xe_exec_queue_get(q);
245         mutex_unlock(&xef->exec_queue.lock);

If you need use xa_for_each I'd expect to look like this:

mutex_lock(&xef->exec_queue.lock);
xa_for_each(&xef->exec_queue.xa, i, q) {
	xe_exec_queue_get(q);
	mutex_unlock(&xef->exec_queue.lock);

	/* Do something with exec queue */

	xe_exec_queue_put(q);
	mutex_lock(&xef->exec_queue.lock);
}
mutex_unlock(&xef->exec_queue.lock);

It is prefectly fine in the above loop for exec queue to be removed from
the xa, xa_for_each is safe for that. The lock protects the lookup and
reference, nothing more.

Does this make sense? Feel free to ping me directly to discuss further.

Matt

> +		num_ops++;
> +
> +	if (!num_ops)
> +		return 0;
> +
> +	err = vm_bind_event(d, vm, num_ops, &ref_seqno);
> +	if (err)
> +		return err;
> +
> +	drm_gpuvm_for_each_va(va, &vm->gpuvm) {
> +		struct xe_vma *vma = container_of(va, struct xe_vma, gpuva);
> +
> +		if (send_ops >= num_ops)
> +			break;
> +
> +		err = vm_bind_op(d, vm, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
> +				 xe_vma_start(vma), xe_vma_size(vma),
> +				 &vma->debug_metadata);
> +		if (err)
> +			return err;
> +
> +		send_ops++;
> +	}
> +
> +	return num_ops == send_ops ? 0 : -EINVAL;
> +}
> +
>  static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
>  {
>  	struct xe_debug_metadata *m;
> @@ -3095,6 +3131,10 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
>  		err = vm_create_event(d, xef, vm);
>  		if (err)
>  			break;
> +
> +		err = vm_discover_binds(d, vm);
> +		if (err)
> +			break;
>  	}
>  	mutex_unlock(&xef->vm.lock);
>  
> -- 
> 2.34.1
> 
