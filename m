Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B1AD78797
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 16:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A0E10F02A;
	Fri, 19 Dec 2025 16:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAp5xPCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9952C10EAD7
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766160522; x=1797696522;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QM4Swy/6qfvuEsk8xk3AvFENImikcQZOdZOGvTSHyco=;
 b=PAp5xPCxKs6ycgSgffd2iO/xPWJfQXNXMrO7WiC1q3CpILMIk5f6O0ZN
 u0Rp6SvEs8O8LLIwERDEXoJmd2MFG0X5WBi4Ti5NK839+zg+zanXG5gVu
 3TJ9kkdtOPZIpLRf+Z5Fd1+jgFRiqeVENyAyOFUFgJYJlHwVORVPJiUQA
 zivCr6/cLZ4ANdMtVAxt16tBxkG36FMmlPbcWnWH+sNu9WIgCvGOXc7UA
 wltJ3zw91B/Rmo/JlaMbMEiAAJ/hGOhH7dy9OpjRfPyL3O2eyfI0BvVbu
 ECDEYP89tlmk841NWW8fhbrIcYbTnmubn61OV8zFCLjdiUv90LqmXdrmB A==;
X-CSE-ConnectionGUID: m1uolp++TRGt2HQGTYMrmQ==
X-CSE-MsgGUID: bqRY7NBuQO29Vqw+/kG1EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71752231"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="71752231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:08:42 -0800
X-CSE-ConnectionGUID: uMxXYOnOTAS3Y8klz1lgHg==
X-CSE-MsgGUID: vecTUWNISl24OxjM3VJkxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="229578343"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 08:08:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:08:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 08:08:41 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 08:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay1zy9ZzKeS2Dzd3QHtU2yHDX1JRuC5r8YcwVexYUQ1Fu8dGW1lahdNKODngLESUFYyv2bZTAalmfSd+oYLn/gMesMZ/ZfffkV29gnH0w24CpVxZvSamyeuE18G/B3IGuBKgcnyUsODMraqLZZRyWfL2c4vTnb5j/IKBsuG6RUjqxqwt7P6U3uPFcwZqs1H4NjdRNZkjdWwDGZ6/ZsL19i9ssNBTHzOHonn5vvkq45VjYj+xxlSNHFaS8RrYIuIc0iwX6PO96stUJ5usUZk/7a7GcPP7Jw5n9KrJbHCAKyETjYTHXe1kUNe9VhESPOhtw1HUQaBCWf1ziu46CpjoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0EM2L7budHnvQssRUexfvq1dB42LuKiHMILnThNyT8=;
 b=IKGO4JYnPJcrCfwT/kZPy7+qIt0NnIc1IxwQ59Ah+juyjrxnepSVxh03EITWLT+oUk+PkN36B+t01iBsiTOZ6hKuGsHongxakhwjRmo/zXBfhhHwJ/Q25DHaUWwKbCsvet9g8Ukm6Vs1miHk4vpq3+wT/8FON3LLMRmO5XIoURit6E6tNIU24xgTt9mniWxcaEaTfQpRXUmVYKJBlKcSoaBY6dgitMVODVlDfS9h2KeSs6+3WzkTvTM54RXGP3yNumW6jjF+8gjDBy6LaJZuq1jKbuy6R7+/tDprqL+KK2B9dhHVbP1J14L3zEliBWOeek2AnctaIrCF3ywW7GmWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 16:08:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:08:30 +0000
Date: Fri, 19 Dec 2025 11:08:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <dev@lankhorst.se>
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aUV4eX7XXpApdnCN@intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
 <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
 <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
 <aUTc6kypmsbHNWC1@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUTc6kypmsbHNWC1@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0272.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 6170c722-a791-4dfb-5ded-08de3f18da42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXQZHaXTVwl2jYxNXGOh+DyROJ7ezozutNoOXNRV08XOYbGXfuE/AVb/S+84?=
 =?us-ascii?Q?INu0vunqqBBMpkGCjHv5eZmRz2WJRDEqhfRi+bN0Z9T4hOUuGiWoQAVsyNOz?=
 =?us-ascii?Q?A+oRSKPg85iOGrEL/GiuYBdTJPFCJdLit2qE6HD2s1DTNcHnxKSCVwWv89nF?=
 =?us-ascii?Q?NoTKAAQLUywZ1GBuHkLaS7qwX3R8zKUs1y3/IypjSV8+rT8R1KSl56VtWhU9?=
 =?us-ascii?Q?XDZTOu31yj8HgmndpUDchzZFHsmQWgOC1P9omDKTYvF+ZJKUuUuxbtFWRZFa?=
 =?us-ascii?Q?PKWFghtsGezuFnkvmn/78J733TiZhZ4yiKjCFywCJ7uc5/3Iv3G3BuHrZjd9?=
 =?us-ascii?Q?+y1L1ATGGwelBeFJhsMTOK9T69VthStnRg5KcgHZqCA+eOWxpFQf+cZCVoXz?=
 =?us-ascii?Q?rEHKssblD0MQ/7PxLDpLZwzyarwtz2U+T5vgFZtNWceWyX3xXeOD8+ex3Cq6?=
 =?us-ascii?Q?0u/2zvhQkiPh0EtjaX41r7rBvf/C6YfvHYE3ca1gYvaCUv5vSa0KAdCbqyeq?=
 =?us-ascii?Q?N5Mf4/HuNlYM+xc5sdcXMRqJ28QmaJCbYtPVoU2bK4pXBVaYTS9pjllPv5pK?=
 =?us-ascii?Q?pZEM1+yZ4A+aJOYwZxbhO9Con3YPDEWpixga+Ek/b01MTdKrabKTdHVC8gl5?=
 =?us-ascii?Q?/ViR34pRevrFVdW9mYT54EGor3+ewXmzZxQUEkVJUfeavMTJh7234+cDUkzl?=
 =?us-ascii?Q?3OgZ6+V4A2dy487p3ucJ8PvcuJdNvDFAAgCQHxRsMYtS/0ax0Z+kWTvhqhN6?=
 =?us-ascii?Q?uA02DgtjvRpQBogTXhxrUUlD+Ka65WtgW+lDBR/YJ0LXlbizxDJsGO/+0981?=
 =?us-ascii?Q?23vrcLY/wfElZPNYcoCAoIzLHxcadTTmNM43eCUh7oX8X7oaGc6gYxDxuBfG?=
 =?us-ascii?Q?QW6D/Xmi2huIgorj0bLJBbcy2DVAkexGvkAHt1FR+KfLVE54toViBoBr2isO?=
 =?us-ascii?Q?WoWd/B/BFvgt50/7dtwNBOz8m7X5R9acBQfPNQDWLxTsbEX2J4Vkvt8g+vmC?=
 =?us-ascii?Q?NUFoxxLvr3tI0baPk3RHnu+P+gVPs2G+Qw8X93b4aGY/XIMLfh0TGvusSsAD?=
 =?us-ascii?Q?TVTx04CDNFl5W9viBDDkz01p+AYeFB4UlsfbW6dw8RGPySkH4oH+ugxgy9vE?=
 =?us-ascii?Q?Tc7pXX3+fCj8cV8Srao+Bv8ABsA56HsUgWGPNp1qhBP/LK8f85g3n55fpJSS?=
 =?us-ascii?Q?WPEoGprjWjT+NuKJbvkGi1ist81UBMNDD0OhkNUey8F1h5XNwvYJlFHzcoWf?=
 =?us-ascii?Q?j+71GbvpWuGFjc4DY6VtQPJ0pkJAkWbXG5+lJmjS0v+oAmW8mwE3Ez/3WbrS?=
 =?us-ascii?Q?GCY/ty9P8/owSe67CyRNNplVPVtWFlXEtIMMXuwvjBZdoiIeXYAE8Y3mdctJ?=
 =?us-ascii?Q?Es4R/AeCR7N1/XOt0sHJputTjrO6LAf+2266tE3UM8O8DkzTaDmixD8gFNvF?=
 =?us-ascii?Q?MoiTrwhKuyX9Mk1aoVS30sn263ilngWqmCXxlrVxcu19xYhzcpfXJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hl9t67zGLbKoXbwWYzNo+63qEqrEWosnkOoZ+Sa/opT3MD5Rg+Fh8o3rHfyc?=
 =?us-ascii?Q?ABq0hPA56b8wou7ZElmXIOHcxnKejfDhZI0GsEQzIWJ9jOSICkJ781T0aPyG?=
 =?us-ascii?Q?8glw5ysKe0t0d9MpWwI2kr71d+kkmszltVVi1zbGgACLAGHz+kg31cPZaPcm?=
 =?us-ascii?Q?2OAXLgVmiQv2WYSeZsCipugeCnUFwGa3T84PFonZDlhqRxUh87hLZ2I+0Ky1?=
 =?us-ascii?Q?3xGd4+u/h8svwJwT4r51cNuvt1EVrEoQQ52QOFp/3qd/tpx7+21cuPHGnNPK?=
 =?us-ascii?Q?t+sMegmHhGxdcQY0pTTj6nSHSGsez2fa2liCdxI9cmmGpu/+4hkjiWFOXk5o?=
 =?us-ascii?Q?XBncGGaClPtwV7rki23IuX2pNqde04Dzb/02PWvGxC/5rkHr6YuP9dUh/omH?=
 =?us-ascii?Q?GZEnACnit6/hXQd1SadV2bhu6fjymy1vlADXNNd2OazEHaOZQxK1iHSOKUw2?=
 =?us-ascii?Q?TLgrOoiwEZCEVWfTASq7B8wz4HedPnhoaj+HW94IuVJT6BPMmYg1NKpgKLwM?=
 =?us-ascii?Q?yS4gghfYh6DFSco41oi+xGAr/TkfErmbCqUpyx7x6Sit+wEwCJgvbBnATHYd?=
 =?us-ascii?Q?Svu+47/9QwdgFbLNlcA/gjfqUUL00oBTKP9QBM8lADaqkpOIA2YxzXfGJzXu?=
 =?us-ascii?Q?Pa5uGOU+82j8qtBcq9mwBv37Vp5aEzgEt4yfPJplk+0aJcNY4LXUckNcEpLf?=
 =?us-ascii?Q?+GgzAFAibiDXBvHzQvt2uWTDFFZOlmA38MnUhN3RW+6+0A6h740sewt2ThYy?=
 =?us-ascii?Q?akOVDsiylR/tbGNHlNn1VPi61nSfIuzvpmQsxUAeo9ZgM5JX1bUiHvIZ+UzL?=
 =?us-ascii?Q?c1y17hNmQTPbx8amYSd0m8Qit6yM71IUbhQTilhn2cLPPcKrkI7mll8cPdAT?=
 =?us-ascii?Q?PunUcWQQtZpMEKTdCuz5tTGe3OTSitWFSASg3HFLcTtPLujgzJDKs56luWkO?=
 =?us-ascii?Q?xCX4McVnexL0ROrbVepCmBpWSNUzhRr5XbRYqRyUd07OzmJhH5BddKvY69oe?=
 =?us-ascii?Q?Xf66msrwcf5Agsa0q3PZjuBqR5gaqtBuV4k8n6jH8dN0/NcJO+CRFpQr4dFO?=
 =?us-ascii?Q?+Xvr9jiP6AreasHSGqCfbNcfpCsvmIZnWwsS9x657X5wSzDUWQkmGhD3gQL7?=
 =?us-ascii?Q?Rt/jqIgxThbn+GJ8Xn0s6pQY7Lpcxc3tX9Q1HzjbQZabIJWK2sQZpgjEgJsY?=
 =?us-ascii?Q?olUUlCOHuCY6DWbNr/qwUXaRjfxte3hnXZUuPKZjGihNFTAcuZc2IJT7FfD+?=
 =?us-ascii?Q?ZIrdBFkyM78d9ugkSvQKAl0/0sf7ymTjg2ZRvWj3XUxhOePa2N0d1roqG4hT?=
 =?us-ascii?Q?SPtzngoC3hfb4fLOqHNsNSyaoDfWaYJzCdgncVDAk7cAytaBUUrSOXb/2Sc3?=
 =?us-ascii?Q?3JAtGKJ8tL2YeJntcO94Y5t3VhzGPjWjQjWCz07KB2LmAcIrRgEBd6wc7vxV?=
 =?us-ascii?Q?xczqQzSWLVZ6KoSF2+XSED/iJ2iNrLC12ITE9KeV+Z5MvH9JotoDzGpeWTPN?=
 =?us-ascii?Q?7eHvowkn/euj6JnsbH/J2eZ1RlSL1T6YNyma5GjtKlSW9h0M0PTcJMvtoK4o?=
 =?us-ascii?Q?ZktKiz9a8ovcbz34vU3oG/5/Ftn7iZB6kmzucUtipM2Q6Cz29/Gn8oHVUL32?=
 =?us-ascii?Q?q8FcDyjixG4M82+RiBIP3MaiXVtFVnHJDAg3kWijP+rpsjXOAgXM2gO0qsig?=
 =?us-ascii?Q?2P7bNxxf08E2ln7l8j3+N3eOvJSvsrAmC+n8uUqeQg7RtlGg3uP5I6zDekV8?=
 =?us-ascii?Q?+CGxFFo3Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6170c722-a791-4dfb-5ded-08de3f18da42
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:08:30.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ec1sFop9oqBspfW7sK9WcFKAKVIwhaSRkgn3ExmaPNTmh+n9GzFgIBpsY//pfmRGPag8wr7MpWWjJRMecFTSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

On Fri, Dec 19, 2025 at 06:04:42AM +0100, Raag Jadav wrote:
> On Thu, Dec 18, 2025 at 10:46:10AM -0800, Matt Roper wrote:
> > On Thu, Dec 18, 2025 at 12:12:59PM +0100, Raag Jadav wrote:
> > > On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> > > > On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > > > > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > > > > We've been historically ignoring GT resume failure. Since the function
> > > > > > can return error, handle it properly.
> > > > > 
> > > > > I probably had a reason for it, but since I didn't document and
> > > > > cannot remember it, let's go forward and make the clean flow.
> > > > > 
> > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > index 4390ba69610d..a8b50091d62e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > > > > >  
> > > > > >  	xe_irq_resume(xe);
> > > > > >  
> > > > > > -	for_each_gt(gt, xe, id)
> > > > > > -		xe_gt_resume(gt);
> > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > +		err = xe_gt_resume(gt);
> > > > > > +		if (err)
> > > > > > +			goto err;
> > > > 
> > > > When we propagate these errors upward, what's the end result / where
> > > > does it eventually get handled?  If the device is still [partially]
> > > > usable after an error, wouldn't it be better to not bail out of the loop
> > > > immediately, but rather at least try to resume the other GTs, the
> > > > display, etc. before returning the error at the end to indicate
> > > > something failed?  Then you might still have a partially functioning
> > > > device and have a better chance of at least having your screen turn back
> > > > on to show the relevant error messages?
> > > 
> > > I had a similar question when I came across xe_device_probe(), but as
> > > Lucas mentioned[1] that the expectation here is pretty much "all or
> > > nothing". Again, not my call but I think we should be consistent.
> > 
> > I think device probe is a bit different --- if you can't bring up the
> > hardware successfully at the very beginning then something is pretty
> > wrong and it's best to just not enable and start using the device at
> > all.  But the resume paths are different --- the device is already bound
> > and in use, and was working properly previously.  If we intentionally
> > don't even try to power up other parts of the device that might still
> > work (display, other GTs, etc.), then we're making the situation worse
> > and that could be the difference between the user having a functional UI
> > that gives them a chance to save their work and shutdown/recover
> > gracefully vs having to just power off the machine because their monitor
> > is black and they don't have any idea what's going on.  Powering up
> > other units like display also makes it more likely that we can get
> > useful debugging information out of the machine to figure out what
> > actually went wrong.
> 
> Fair, but this also means the existing error handing in resume path is
> redundant and should be removed.

Not necessarily. Otherwise resume itself wouldn't have the failure path.
I believe that Matt is suggesting is that we need to scrutinize them all
and handle with care without a one-rule-fits-all.

If there's a chance of getting display back even without some engines
for instance, perhaps we should try it.

Imagine that media gt failed to come back, but you still have everything
else. But user will try to open the lid on their laptops and will just
get a blank screen. We need to avoid this scenario and work for a more
reliable platform with more granular and contained error handling.

> 
> Raag
> 
> > > [1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/
> > > 
> > > > > > +	}
> > > > > >  
> > > > > >  	xe_display_pm_resume(xe);
> > > > > >  
> > > > > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > > >  
> > > > > >  	xe_irq_resume(xe);
> > > > > >  
> > > > > > -	for_each_gt(gt, xe, id)
> > > > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > +		if (err)
> > > > > > +			goto out;
> > > > > > +	}
> > > > > >  
> > > > > >  	xe_display_pm_runtime_resume(xe);
> > > > > >  
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
