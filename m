Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D3AC36014
	for <intel-xe@archiver.kernel.org>; Mon, 31 Mar 2025 20:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448C510E494;
	Mon, 31 Mar 2025 20:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjaVzzJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD2F10E494
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Mar 2025 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743452389; x=1774988389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jWykowpFZOUnJTBoyligaL0aAks/ZzobzLSE3FJpdUw=;
 b=QjaVzzJilrurINdwfQkHKTupcl2yOUQuGHoRcauB+E7obR1ClNYLqBci
 PKjfrsJRU9KJOJHBE4CUWQ2hkjOq4l2OJ7Uv8jKqAP7chLmQq48VBPuJj
 C0dgf2RmaOaO3zV7D4NqWijJ5NWrlS92wpnDnJMqO0KGK9k+8Klbtxtkh
 VkKhRTNF9PRd7YeZq53hwIOCuBTZYiPHw3b2Mzt+fITMDi9XEOcjZ6urv
 B2XU/RepN7NdshQw96eDz3EgmbJ/is0hMo0ubg6F8TXXRvTcQrvHwYTaY
 TfBEe3icmT7yjIaekU9nFejAIZE86OUYMeCM+Sge9pSgiB0yVVY2fr68c Q==;
X-CSE-ConnectionGUID: cAIXBaBnQK6GOalaC6pi7g==
X-CSE-MsgGUID: OAKO1neoQuKaokMZOAKMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62145929"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="62145929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 13:19:49 -0700
X-CSE-ConnectionGUID: KRrg1jtMTdSG6iw9+sbyEQ==
X-CSE-MsgGUID: 8UYrC842Tu6hvtsGXvjkJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="125936496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2025 13:19:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 13:19:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 13:19:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 13:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDOniR34vaL0nnOXGhF4GHfSuemhWTl+RW1cXs/WR2fanyWNUZcjYeJlDiYNobAiIDh31rCLGWhpThreK26Fl3CNbZ5q2674WTFrzZKs44vwga6hbg8n70WC17zo+Xk6HGlAXVbxVDqDLAanXW2WelD/lfm0JTTBSq/MtKY8XU/ALITezuyFGn5EpLhhxc3ZSH50qK9fh2aEC1HpBaJ9Xhl1hiXICqS8QI4KheqIS1vGTD1UbdHvoVk6qC9BBpFQVHY6gYi5zyt15ugLbeyKN6yPO3clrt5gpmUjWdy+LRcpXdjXUvrvjfemukdv1nDO7QCGjxHO9y0pbgkiZQr3Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnFhsTSd2JmFVRZO9zzRmTwAF+WZ1CACBWkuG65s8n0=;
 b=a2keQhow/VsF3nYKVBKRnu1lY34pj7yBxj4xOBoFHk4GxQO/u22hMb4ESaMZpV6uClisHMBCWdgWWq7IoKcfIS9T7+IjjL9KLd5fJ4acLNKKj4xCa9vhW2gpz/eDQR1GHr+c7JYkhQWV63C9jz2HGgAH9yjrPIizQIQSl1QlSbFsP6hjy4uOWnjMAgY4gky+yDkqXGXXLdJKOynOT4nmFhwb9IEPJa06R+SlFVMu/W11Ra4UbklV7K1bDfcOl3Mzu4t2Vv9flW4Im14s2rA0xd7rMorleXIcTzqfx4HqJ9BoqCROzMgDfbkJUpiDDn39nlf0SPpZeyYk0qRC2BNKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 20:19:32 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 20:19:31 +0000
Date: Mon, 31 Mar 2025 16:19:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 0/2] Add configfs support for survivability mode
Message-ID: <Z-r40FFDDRVzI7wb@intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zvdiclntjpojrpdzg6fehnecirfigza7vwir5f7go3rmzwee6a@fqazbweelg54>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 34de3551-6599-4694-6c0e-08dd709158ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W9ByAr9AGku2Xfx+AkxRMIT+g4gzlAdTkQGNMZtDWeVta/67juklk9eHLGR/?=
 =?us-ascii?Q?/3e6cFQ5nPefXPifoBntZ5EegEZvQ8JKkkru0IJJHbXp28EsQAJ1FnpkLVri?=
 =?us-ascii?Q?ENnAJe32+rGyt39e4xKhIfMK4SEnioD9IJ699cQv/4vHBCtkoU9BlNDNXUfF?=
 =?us-ascii?Q?Koxwg7PUi5du/a/2tj/7H52Lgfn+nC9H60jLBuhRCrar70NqBAGTTlwgM84P?=
 =?us-ascii?Q?+Tc4nQYLcxi+uMWfFXBT5oQnrLD9vLJBXaqVEgDN5YUmMmXvVlJvv4mM+X0l?=
 =?us-ascii?Q?6llIxdBNN7gbJMr/xO/a4I3gPGCkHFsUqALk5F3K/5xa+tS0pgrqjdtjEmu2?=
 =?us-ascii?Q?6fBO3LmFR3NxT+p314jQVM5UVmvsq6dghthuSuNLvsNy8WXmSNusJtE+CAWQ?=
 =?us-ascii?Q?gSW/f9K4U+GgvyQR6tH83CucynVv8utqyYgS/3hDRTYEBWULdhHuotjDqU9T?=
 =?us-ascii?Q?jHOQ9Y4HLkzv2q62p/PaEej7ZBrUnWFUsQKqFddZY1Hp9shIOywZp2igonRE?=
 =?us-ascii?Q?AvypfxLuUjub9pB6nfd9KQFMmvdk6IbLijH1ZQU6e7BeQXv9c9jyApuLcX6f?=
 =?us-ascii?Q?i/X23YQHXwQSElqVKGSc39dfzahX2iJtUTzTfykSnrjjTrXVD/izsYsp5xL5?=
 =?us-ascii?Q?zZMxLeULGdUYht81LmDiiHGs1okwOJ2lkC6iHru0buC3XIxTHNcgZfN8dCeG?=
 =?us-ascii?Q?xkAlpjTNYOjgj1QMMUm/P30zOtRBNOOgg8so8iCxwSApa9oeXPPfd3WrAhhA?=
 =?us-ascii?Q?+6RjauV/zmHoMTNXEMBLKFdTLoPb0tOuqtLa2HF2OqbSMkHocYQI4p+9WaqU?=
 =?us-ascii?Q?+ACFOCubygKSwSL2tCAtoNInjC+Bnyxh54aks2mSycLTCKOkJsyWzAFP8Xm2?=
 =?us-ascii?Q?HjgTQMgZDo/slAMxAjSCWZiEqWON88EGxVWv2BR8AKKWhf2e3TrCJGXLQOLw?=
 =?us-ascii?Q?5tkvWmQ9bPT48zQRHEAJuWWo5wHYT47sK1tkhExTVTyS+QrtwdGpjAhLjpUi?=
 =?us-ascii?Q?IZHaR+dTMfW1Ry4KOTTD4YJy7WZ/Iupx3ML9aQogSyxyeJVyToJKhMfvg17n?=
 =?us-ascii?Q?7CtusBGL7e5i1fnnM5XSQlBtBxWk3PvEeq9rOrZdR9oSldx0mBTONlVJjo+y?=
 =?us-ascii?Q?38HAX16F/U6P7k/zQW5NzcKNqe88Gd7QEanBBcyQxu5I13rQlunj/Nk1jLqC?=
 =?us-ascii?Q?J4dlDKrBYCFOYS752YT39qBHIsoRW8bofDZG9j5EL0nFtoSq+gSVH/QRP5ZN?=
 =?us-ascii?Q?FsTwydFbw95wS8S9MM3+73MOScxCG5bW0ABVQZM9hzevuy2dCrf7vBsWPMjj?=
 =?us-ascii?Q?tb1QrBWzssQ5F5zYZjFtHGrc0ZS7RVoWNQ1NGxCsJmRXJZ3P1P5DMx40yHHv?=
 =?us-ascii?Q?yKh7Brmny1hO2f4z78fgXnDe4LXX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6mMdLcEvB82v/TtuaSOQokFNAw5WqPUrTxl5xYkgIdENiOiBm3hyeLYAL6jB?=
 =?us-ascii?Q?wvpQkqbv1vp5jMwbGlD/yPkMdBKYN304RwTmNfEWos0+2MDfBPUEPwBbRZL7?=
 =?us-ascii?Q?uGeARlD7MkFWWnTUs99gTllfrK8Z8O94P47znxZ6V1owmw3OlLfIqMJUDyPL?=
 =?us-ascii?Q?H9KNJ8bsyd/Vi0K31BaLGuDwW/XlOUeaOjFEdJ3GfiyDHJyLf11s6yqermQT?=
 =?us-ascii?Q?N9MkZCPyEzMtMz5bkMTtfPGR5obkwhI8z3VtFaSBaeWSAlIusuHfH2WvGdPV?=
 =?us-ascii?Q?6QuhW0Q6f/Wf4wV60nALU7ilzor+kJ/uyoNMOHtPErCmQlA+hEjtJAkq5w0N?=
 =?us-ascii?Q?NvZqI7HIWxpOYgUQqMzc9ER72Jgc12uqR2CKh8VP6YmMrai0IwFSO3FVISwK?=
 =?us-ascii?Q?ozzf4ZoHx2fy+L6XDNd74i4PPscJKZsnqy1xUiaRMuTc/zvUkkmxkm94cU59?=
 =?us-ascii?Q?lPdj3fxZe/0QAG96EwIewHleTOjulq7+7KcNfq3UNEBMToTEH0BYusPVinRW?=
 =?us-ascii?Q?ri0pWK8HkDEVWdHYokR3cvII3fxoGET+xfg+W8leAsvAhFeMt/313KbkPvjt?=
 =?us-ascii?Q?lhF5Yx6h7+PHunPpWA4iZMhGNG9FmrmnKfagAGAGPLjH2NCd1rui9cH+y3BB?=
 =?us-ascii?Q?2rjsNBvffz94uSXnKNtop6lTy7E1x6zLeClM3tMvAlMd0R/D3JJ+XBa5hR3G?=
 =?us-ascii?Q?xmuCeWZXi+kjSVV5gRBQiMa4G+fB78hu6F7IuNNCB/ruatb93HwXy7n/7e02?=
 =?us-ascii?Q?fxTez8OP8wSgc5fqtUqligTlXalJ6pBRF0rAh0iVuVjYn3liSeFWQnasEfjY?=
 =?us-ascii?Q?/N8aJS8kDFTevXy6whw/PxFTS104zg79lkmj3xegViNBofxBZUfKLEHgBvvc?=
 =?us-ascii?Q?GeUHkhPA4lpoLu5Qmu8134+Mzj1ZNHHAnGjg9SgVQC8pmTjG5FLGBfjcJU2t?=
 =?us-ascii?Q?HU8FIsk/sDZaixRM2ysQP7JzuM1ORosLkAkIHKivTBZeMJ7tIclWFIrd3Lb5?=
 =?us-ascii?Q?blTm5rkmmfjv64Z7lJQoPGecmJngoYy0tv3z/kIt6nkpYtRjdI9btggNE4/C?=
 =?us-ascii?Q?SI54Jm5Krz4rzHo0TlbT1N6JVCrvlzLP9X3zxSVumsDdSfJdgHwUV2gN4qmG?=
 =?us-ascii?Q?weftHwMaIZzLcWptoq+jKsXODqyeYnTcGuCBpvWX0ATQxvwP2MZPiOKwFwqn?=
 =?us-ascii?Q?CqPspuyncGHs+s/XZIRFWkR+FJ+5dggflDzXizP173DImh1uqZVDLQYR/ZPe?=
 =?us-ascii?Q?Y0XAddPSnHvHGiGfNg9ekxz96VghgSmBxWS4X7y+gcjz9pmyr1yPDtP4OQNR?=
 =?us-ascii?Q?AU83egzDJspMOdaIyU6YfKYmDLhzipFcdrMhpodb/fjlKkdosZJ/CpTnN21m?=
 =?us-ascii?Q?ZiuH5vokBOEdwR/Cw9IO9mA9hlTFb8JGTBTlzgddDhc6UNj9pKyyQQ7s+3jl?=
 =?us-ascii?Q?+aQktjeBX0X6ckxjvtyeNJ7oDUgjLdQA5ZGpadGDr/JpWtlDlsxXyJIYNaMJ?=
 =?us-ascii?Q?F9ladTnUA4cGq/0dDO6dSo1XzZEdkWcT87mDqdu+lDwOB7BqCjcPVqvOP4xg?=
 =?us-ascii?Q?ZxdbA2eHvQYI3sj+8vxEwH3xReM0vFjKm+JKgWmhLX565Nce+Isxba/22peA?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34de3551-6599-4694-6c0e-08dd709158ab
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 20:19:31.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4a8lw2HnvqYBikqLe+KkRKY21152lh8nzpGLdCMlJe/5sQSaFFmS7WN60X+JNmic/jSNIH9bEeOqMDAJZ5GD4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7056
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

On Thu, Mar 27, 2025 at 09:40:39AM -0500, Lucas De Marchi wrote:
> On Thu, Mar 27, 2025 at 12:12:00PM +0530, Riana Tauro wrote:
> > This series proposes to expose attributes via xe configfs
> > subsystem. Xe registers a configfs subsystem named 'xe'.
> > Userspace can then create directories for the devices they
> > want to configure and set appropriate attributes
> > 
> > This is done by
> > 
> > mount -t configfs none /config
> > mkdir /config/xe/0000:03:00.0
> > 
> 
> If we need a new version or to document anywhere in our docs, I'd add a
> comment here:
> 
> # If driver is already bound, unbind it as this configuration
> # applies only when probing it
> 
> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
> > echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
> > echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
> > 
> > This is an alternative to introducing module param that causes
> > all the connected and supported GPU cards to enter survivability mode.
> > Manually entering survivability mode is useful when pcode does not
> > report failure, in field repairs and validation
> > 
> > Rev2: use config_groups (Lucas)
> 
> Awesome. I have some other work pending that will make use of
> it. I will play with these patches soon.

I really liked this new flow and I was giving it a try here right now.

However it didn't work. It didn't take me to the survivability mode,
but also, I cannot unload the xe after creating this configfs file:

sudo remove /sys/kernel/config/xe/0000\:0*
rm: cannot remove '0000:00:02.0/survivability_mode': Operation not permitted
rm: cannot remove '0000:03:00.0/survivability_mode': Operation not permitted

Tried to unbind and had the same failure.

then with the configfs there we cannot remove the module:
$ sudo rmmod xe
rmmod: ERROR: Module xe is in use


So, it looks we have some stuff to adjust here before we can move further,
but so far things are looking promising indeed

> 
> thanks
> Lucas De Marchi
