Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07909C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 04:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F7610E0BC;
	Thu,  9 May 2024 04:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iA8ewGAK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427CE10E099
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 04:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715230230; x=1746766230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zRVD3cxVSLNGIaQl5KXri8B5MT+v8x5uKOlgRrODmbg=;
 b=iA8ewGAKTjIYUTxX2/WIqtuDkj6Pl60gd7NY5IUlJi5Fx65h/cn8cruA
 EYRLEloZQSOOiVH/XH3wCY4eRBHHdhg2lr5jUjLhuNm6LwTanFlapSlhQ
 fuab1h6C/UaalWa+Zkuuu5Mrg03eqZDI490SNfPxB2rALNYGM2RulX9Y1
 bMz448ggy2SQGA24nNM6kecnAxgXFOJJdHEV3txHWetiHgfesLd0TdRLe
 SN6gGIwc1Jl/MnVyMScPRJ62Utcl5o6l52rUaJMuvq5FpCukc4zzZChJA
 aarzXb7NHCOf3C86kl8xeNTwTNHpmpB6m1OVB/yTHUBiZz8Kp2oJCcMyX w==;
X-CSE-ConnectionGUID: VGZ/8fTGTuigB9aLhXV7kg==
X-CSE-MsgGUID: Alv8vAK1Tl2AoM1EKy70tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10995917"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="10995917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 21:50:30 -0700
X-CSE-ConnectionGUID: hUndc9k6Q8e02D+IU69/dA==
X-CSE-MsgGUID: SEIz/6h6RAeHazIsEqM2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="33679496"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 21:50:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 21:50:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 21:50:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 21:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8Y56S6xqLDA9kuNku6O1YWfSXPD9f6u656TRBpHs2tC+MrgiM051m9PCK2skdBXiOLLI6Ull5ogyrORVQCXSVarsDat5i1AuZah6rss62mDAhWYzd9UIIhIiv2Od17uJUeswo/QZGjq3iTYGvzyzssj4U5/s9bm0hgbmWbZJg3eFiCwPmLSfuDZVzS8ll5sMi4rKw7zk2w3of/Gl8DUVyNtx05LKvpnwT0OsPUghztQnfTkyfjSkBezlu5hztqG2smKtaSjAZWTjzIUy+RE83DBpda/UFuvVG9gAvsW6Ca/QEnNBbPFL7CX1hJoOooJrNViv+/WbZ8CuCqif79s2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRVD3cxVSLNGIaQl5KXri8B5MT+v8x5uKOlgRrODmbg=;
 b=FXbH3om18IU3NZcSt97vm+EJxCiwTv8v1Lnd58qpCyhSfDwL0hCLrJrUSjIVoiDcBb/TXIL+f+/duZIY+oNnu9LU6lbO63DWtiFsGXEbCqcMAzEjchQujNxKp0VE8NrN06zpxaZjfjbf7P30eyY2z2PBUAyptHvNG4tFjNtVDGzPgmha6E5PTNIcNisSW7pu6ZqLva3ArnglxeHJI/vLezcNf9dI7AYhbmvWEfxeIBwvTjW2HhovaJtrdaHZofwPsMMrYDUwC4eSIaCMBhlL4AtMmrHL9Me7RBNZo5I900TtM3dOH6hVwq6TID5oDCRE4OStOvYwlRkd5YQLgxb05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 04:50:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 04:50:26 +0000
Date: Wed, 8 May 2024 23:50:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Message-ID: <bbfiii5zmld6mxaym7sb6ht3wvm72h5zurlyr3yy6a5nzcnijz@eg3alqjc2o2m>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
 <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
 <DM4PR11MB5456DE457A372789DE992861EAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
 <c2tkhqhxf5zr25p3cj6ibljqzvltrb7lwiaauep5dlphhu4k4g@gwitycdsle6u>
 <DM4PR11MB54560F2DCAF1B82DA2580CFDEAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54560F2DCAF1B82DA2580CFDEAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: e071db4d-ef80-49ca-001f-08dc6fe38b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MROE+VZr/9hdFDAawCuK/bDqOHfw8wjwfviaJuEt68Lf33Rqq47q9275hzy/?=
 =?us-ascii?Q?K56GSQByRV4rmeBkGlitfJsIgcPh10ITFfRG5GEt0pyB3lYXlDjFnffVhovB?=
 =?us-ascii?Q?WhlB0ebCY3XVG6UXE0RyJt6QIjLTs5w+vcGBQZBo10HCOLVIuScs4l9CSmSl?=
 =?us-ascii?Q?80lcDgNVo+4sP+35Z0JNLuiEpujDcTzKbaFD+VCzl7JQFO52b2XgJNFWTwOm?=
 =?us-ascii?Q?xGmggYByZkbbKO8QwzA2zBqcugqm8SqcEX0owC7zbVQmvEZmbEbZSm0a3G55?=
 =?us-ascii?Q?k00bEx45xSbxpaZ7ZzuZhAqnNapW0C4KpAbZ5/469VEgpRIfQf7KmlxhTZHP?=
 =?us-ascii?Q?uVnRpWm10+VUFfBNkTg8aFv5ZUkVcptjy8hZ2OWnggsATH/d9WPD/vUzlfz8?=
 =?us-ascii?Q?Lk5zsegrBodfaoDYPEWFmqA+fOkD0bVEhEhSjjDP7IsZSS3Vw9EJb0H44ZKO?=
 =?us-ascii?Q?8Vvq5aqDFEOTR0IUO4NEIY4SqflyZFy6wTO+lZnCFeBXhsnT65Z2nIdNfPW+?=
 =?us-ascii?Q?BERAEM9r6Yn+fEWdxWP7uh0525kSsxt492v7298UpY/C1OXs5Is1oUiQhKlS?=
 =?us-ascii?Q?YzE4nXYbZDv0FNMB1gYqSj5VYqxxegffFrndeQC9LANqgdZOhaMTeW/6XslL?=
 =?us-ascii?Q?XEX75DRwJNKTvy87+Z/WOJq7fB2twlPf2X43gkUn987+X0qc+kvjAXtWCuVr?=
 =?us-ascii?Q?NkQddeYf3W17VV+4XJSfYiOESph1EURNkO/RmAuanAyKxp8XPg4o9qadcE57?=
 =?us-ascii?Q?9LdnnZMH4L12iXV2L1ScQNJOvSKeQrIGDgs6BHSbT8gpn70onb+un0A0I89d?=
 =?us-ascii?Q?H2zQkWdIs3xdguwIrHNogpggitUalRZazrcp2BJLSl3PTEXXKJ34KR0lY5Ht?=
 =?us-ascii?Q?0ZbXqlVG3xnYyFl6vsj6eTkZv/Tavef8z1WC+UG+OCh/lYV3zo3NJcKniyXN?=
 =?us-ascii?Q?/cH6h5nc+8eqaczP7AgCdVBCEP9M+99I5Bpo2y5JLXvYh5a11ZDOTU0vgoo3?=
 =?us-ascii?Q?UmDTrsLJtr0UJqKoeTjjAVTZlSFT6RxvGpRBp2pUFSlWkIRETFPzJaR8meQz?=
 =?us-ascii?Q?YYDA/mrXpYOr42wq2AyVM2v8jzVK7mTmENaFqrEsbrDHg+0yuQ9u36MGpBaQ?=
 =?us-ascii?Q?gVhJAic1cmdbimn0doz3YVLILDr6cueOKhx1hn0Jn6DLZPbk4NMeM/pDiljm?=
 =?us-ascii?Q?hV7erAzfNyyEyHlYJW0rz4zo49aabETbqvSTiFlFDSB0i1s5+NE1QVzntKd/?=
 =?us-ascii?Q?i7svZje8Yk1xDeGYjY/giIoZ1umAu/zTsfmv0XX5oQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mMWeRWbYgkgmyklu8vDTkV3n+1IlSnduyrLUCcYTj50TXMlIr5ABA2bgpts5?=
 =?us-ascii?Q?Cf2PA9aulf7yP8R6ZQpB7qMb/tpR7BvQzzymaYeCswJl5cjPZU1uLatYvgHC?=
 =?us-ascii?Q?KLE12K+ulXNWA3vh29/x3keJg9yf45MplHFmKrkVyQ0IahFzhnXPfF5C7K3Z?=
 =?us-ascii?Q?5SfZOkADH65bECXY96BP70emRsftunxUGcfUaLYgSYZbmXHHa7gjdAiuRSv0?=
 =?us-ascii?Q?h7mmBXh8d4a2c5w5tvYg/F1Hi/edOVt5SA54tUzaLGbMt2ObX8cHUjYocQV/?=
 =?us-ascii?Q?yNZtpHv1DIxop9hgpqf8wZ48J1N2SfRa2jLzH4U0vTC+/I2T1gTAtpf9qr3p?=
 =?us-ascii?Q?5KKdxXDFOIRC6xhy/P9rfpfeEev+lDzO4ZA5S0MfZlpJc6qQkVLRkjApi5R7?=
 =?us-ascii?Q?9Z7lujOjSpM3YPdhdB21GrnA0VwUGAaJQ3tJLN0puaaUFN8i4Zvx4JfaITM0?=
 =?us-ascii?Q?XsvAnflFVseHVUMtUJS+ZP9+XNy4zltoQfJZnc3Jj2zvZuX4qHsX82vgK3sO?=
 =?us-ascii?Q?qHekA/Em/tVulD5EJR7m2vI4jijJ0WXTSP5upOX/AymdVd/kz2aaxa0W/fjC?=
 =?us-ascii?Q?SBYkKku7T44OLpxIK5r8AUpZd+5Xlx9XerkH1vZMvAws/+LaZ3TbHs7Zb+Se?=
 =?us-ascii?Q?9sjTDVBYrWwh3iiXxyv+l7CZe8fBgb2naHZiI7I7HbnsUgBSQYk985M8ZqGE?=
 =?us-ascii?Q?mRxio45shkHdMXna6C9j4+xY3HnUMAU/KtdDkdzp1ZLJbIO3kny29x71mLaQ?=
 =?us-ascii?Q?czzgXeU+FCoFCvBxx6efi/yf8n61IslK0vFCa52DAA6alwiFE6Jc40b7aGSg?=
 =?us-ascii?Q?kYdeUPT/VOLTEiiUud8gtpwTjDGmleCSvzxj37YC2b9NsfNpTB3TeTWpvZpO?=
 =?us-ascii?Q?Yin8GHzTh8XF1pHDUCrZTaG4AX6O324IJu/Z8xjq0e4GhXu289n03bNk22NL?=
 =?us-ascii?Q?Db0l0gmc90GqXZTYM/Xk9d3kRrnnaIzjsrW2qyFSQMOBHWc7FlNEBl80tjfB?=
 =?us-ascii?Q?yipnicGxGH89PdZxZ6xwHz28+PSwKx3JsydwEcCGekMMgn6zk0GCNKjBIM6t?=
 =?us-ascii?Q?mdv3tsQwol45y+z3c6YvyVeolBZ0V8QC0BRRcleyCfJR3qvYFsWRd0Wpg4Kb?=
 =?us-ascii?Q?6AbDbWQoJhT/B9K9QnvEXH10prOwj7KDKa1Y5Dxy1wpP5h873h4alRZ3/6P3?=
 =?us-ascii?Q?bDExpunYko2KyZcPe3eQNVez/AyZMZaKewix1jY+WSS+JmPEvXoBpKLfAjHH?=
 =?us-ascii?Q?cPLEO9a67w/0+TMOceyAMK5KpeMuR1JMmLcf//4yUswC1x7VdCQ9L3Y9GzIz?=
 =?us-ascii?Q?7El2pId6inRSS55YFDLC+5wf3Ubi1DI8oAOElww9sxxjcFD27k6x9plW2tVU?=
 =?us-ascii?Q?N0qPLGBB6zBjzs17QgadvlDwoxd5yqm1dVGAM+pEpSqGvpgSv5xk1cqvqgjm?=
 =?us-ascii?Q?5emsHhJQnB7aNjVvwOiEcM1exAv8Goa0MNWWoqFiKZyAxm40zP2kf6y4WQjX?=
 =?us-ascii?Q?ZuLh3vAYT6vVjWepOb6p1yDZ/PPfPSV4VdSUyuHuoXSbHez2Q2BKvm2rd6jV?=
 =?us-ascii?Q?ngwNZ8bVvLCNd8r0go+8ReyzbizOn3Tu1FsT4JVoSQTgeihJWUQU1jpCU5mX?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e071db4d-ef80-49ca-001f-08dc6fe38b0e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 04:50:26.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3FXDv7ZSpHC4o5u3hxpWjBxLmV0yDaqqc2tuNcwBrAgvZZ0OxaoX492XQ34FMM4ZAMvxsxLHePhGrf66Mks6lqLkvYI4eAoQte4gyuzF24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On Thu, May 09, 2024 at 03:45:46AM GMT, Lin, Shuicheng wrote:
>Sure. Please help reword it.
>Thanks Lucas.


applied to drm-xe-next, thanks

Lucas De Marchi
