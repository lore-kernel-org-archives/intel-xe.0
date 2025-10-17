Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05957CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 17:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9E10ECA9;
	Fri, 17 Oct 2025 17:18:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OTV4TxdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E62210ECA9
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 17:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760721497; x=1792257497;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u5n+DUvsOe98Bh3654+tcqCANo/yjiBkLzTvICnA2RI=;
 b=OTV4TxdRZIIp7DtOMH3Nq6iCNsVy2NW1kJT57J7nZQ8gBq3bkkifviJT
 obtBIuY3K8LDkhA7u48mz9ix5ItBzZPANcgJL/FWvm2fjney5RiE1cfXA
 vfoi/cA1sUnEU6+7yIjQ1YOTKugRqR/ULtwYaosu8Os75OtnMI2078/7P
 VZKFzgrlm3uw3zvM9cFgK1hEzW45qL6ZQtSQMYLkzab3wMHr3HC65i9fw
 LugSylj+VYSDx6vpjGqkvnzzBrTqLc7gC0mP/Uzkyvb6S0/BBloasWQRW
 ZKx14l03lLPD25Pbel4ADAs0umFxjdql7JUEKAawRfWsRwW7vwBOwx8mm Q==;
X-CSE-ConnectionGUID: jm/EXV0+QjGYe6BhEHrRcg==
X-CSE-MsgGUID: V+WKjJppSOmF1v7P6oDh7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73540905"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="73540905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:18:17 -0700
X-CSE-ConnectionGUID: +f6iVpIzS/iqjboh+7xXTg==
X-CSE-MsgGUID: pnUOudY4QNGOaoqQpvz08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="206494050"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:18:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:18:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 10:18:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiiHokRFN5jqpY71+zjsaolE0esIHY+3MiDPo4ljhwXLFnitidziFNNpen+RbHYl1aEQhW30gtqTeuhU/4DWEfGHRwUdeKHrp/mjUG3YqeW8zBXlLm1SKQYRAf8Ck14QOMq/K1fIfsqp5B1C7SKC24YDgAn4i9biJlSnB/r5Vk9nniV7unWmoLWTFsWwWNgOxJ+5yo9Kx7qvobx1uH2AhQyL8jOA3Hb3A1n7XEtEkJVPqoa4uBpA8H7eqEsGb0ABDEoEvXaFBVyuWqUncxDpdPaVVcQ5CPLRX7jB/HoPwXi7feH/e+dwoLlNwRE062Qe4MZ6+54xBztdgVMdiPTpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPrx1mJGiJfk7U4Dkfh4n0K7fiG8Wza7z95cM+VWjuY=;
 b=VvlBFlaKbPTGbNW+CQz996fpJeolXhreQm/7ARzXeMqhPkRVRjIesQIWwnLvCgZBYGkT0dixuQUNY1m2bhXqcsgv5Zj81InESqOe/0DfwftJaTyIjFH62xj4KGjDDyeljqyEBOc/+XhM9Dclm0XJ9OnoneHbuBzQ1WP2eqP3eD4cB51vzUrtBXKGM1FMMG4FyC6G84vsgcc1zMIhN61rF+61jUSAcJZv06t8mCUeybu/1xScZP6zb8azB6P4C4JE3fyPhLsEBGn5x+rvRtAb9ShG2j28E3V/WldmnP/GiOiBdKFS0LFsMGJayxUq6Bii6mGpNjqsB0Q+PSKxGdV20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 17:18:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:18:13 +0000
Date: Fri, 17 Oct 2025 10:18:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 23/24] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <20251017171811.GV5409@mdroper-desk1.amr.corp.intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-23-3dd173a3097a@intel.com>
 <aPIjEfXpEQKjewIS@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPIjEfXpEQKjewIS@intel.com>
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 413f0dc7-f4cf-457a-6c82-08de0da12748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?te31Cf20qHbG1fLD1WwLJmWrT1C6DVqit633p6zQfLPeQsgQsNIeWu7+HZ?=
 =?iso-8859-1?Q?Ucme+65cileN1Xx4Cv5WpovzJMwHYYwVZrZyj24UZMFrYiZeRTqJOQHP/J?=
 =?iso-8859-1?Q?Ozw1QVUqNVsRq8gmsQVwN1I++hWXczu/kR6cb0pIPRDl1yLm+F/b7M1NPg?=
 =?iso-8859-1?Q?CsN8c4wDMvCB9tGeaB7WI17hZdq69O8Xgp67j+oS7uwtdOUJvIgZx6+G5o?=
 =?iso-8859-1?Q?ibZOdrVmjDUvZIRVYG5JEDeAmSbTRxXbjFWGkmprkg0mmLjLFAPY+wsRFf?=
 =?iso-8859-1?Q?J3sn16I14W/POxN0wTjUfOa4KfE2NaBX0nN8lrFPN0fwaH9z4FpwH+4vh5?=
 =?iso-8859-1?Q?Cbilfe542wS9CXKeGSv9Wf0YEVt1sazYvjXcRgKv+7mMe5sWVgzypc/Q68?=
 =?iso-8859-1?Q?+PX/4M/x8N7WuD3FqP+nNzJ/RBWjooVWi2cAWTZUXyDdBqudI3xXvJnSi/?=
 =?iso-8859-1?Q?Zc6OIRzMmvZr+kNr33ToD1i+6vdhrekJ+dffHOe2xjAk4xZnLmR/1eYe8q?=
 =?iso-8859-1?Q?EnkzD8NYDSkBsDyRbOoY9pKOFsoc12VFYrkAyt/xC+nkslp6k3YQZAp8vp?=
 =?iso-8859-1?Q?yt+cRwAvZDG6toTC62bagUMF91DujS6Pyn8MpbfJJ7p8NVQp5nHWzEXi/x?=
 =?iso-8859-1?Q?ugk16PPCPQfx5Nqmz8+KkZpCrItGQJs3oMT5SA0sP8Vgj53b8YM6grrB39?=
 =?iso-8859-1?Q?8ZZliPxDPPsMAK/G5CVMWmsYS55r1XZrEWC0LpSxjvGtWjRjaKNSF2QOPE?=
 =?iso-8859-1?Q?U418ke9GkX50/NkrWpsu+5fPTnCJAsHPNcSItiUoZIAEtMkI5LDXPpQknf?=
 =?iso-8859-1?Q?AoUCo6l0pN76S/niaC2iyi1XKZSiju8Zt9Ixm8VHMoxZs5WtQUsi/fqYg2?=
 =?iso-8859-1?Q?HSfajovvzCz4sktWCmAi55iF5rPRb/VM/GqfVRH5y1/6NvFzikNt5yYJ6u?=
 =?iso-8859-1?Q?NkMlCuoXBjrEF2p9aaCQQxOZoojSUHH6k8OG8oVctm3Yj+e6Ll4zU8l2EN?=
 =?iso-8859-1?Q?OQdRF05elBEWddtfrrVG++vS0+IOHdFprUXJTbbwsMRAuBpwuF8w//8/GY?=
 =?iso-8859-1?Q?yK+hWLmocpxR0yl838mxk0acY4FNQsiC7KC31gSoSg8OjnKy0xqHcJgLbL?=
 =?iso-8859-1?Q?w4Gv1nplcUa1hSi9Ffpnjh0mJTP+9HhG2mbLpnmwJqRxPsiuRw0lBViaA9?=
 =?iso-8859-1?Q?CZ5+a2+nJ1dXdudZwSsdxghNqarKtOvBwxxBKb4J8s/CTBUsLbQJMMW+G8?=
 =?iso-8859-1?Q?yO50q0JHX6IUJ8UeQB8/XEkZRwoeuBXofTEegEDQBwkXg7JC7eJEBIgUeN?=
 =?iso-8859-1?Q?nDaUE2HKv2Ds1RrL93s/Gsl/HtXU1rlvzgIWf42jPx+Wx/giq+77PTvWni?=
 =?iso-8859-1?Q?xxB5CxQEGWRsMrIgcCuSAjlPxJ6VPy5q82AdIjMmqHyzsDLQZ8kkARu5Sr?=
 =?iso-8859-1?Q?jPuk/kADQm13Ym+zCYOTEX/Unz86VIhpj0/6AOG47ObN/ixt96u4PY93WN?=
 =?iso-8859-1?Q?dJbiruZtCHpggGGmbbpgK4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?weWD8SJYXdnZoF1sKpkrNVX3bBEG1+ibNXr+rjaVh6cdZOvrqnNfT5o9zr?=
 =?iso-8859-1?Q?MAtnOYFoQHfZiso4qMEwLq9ofJPq/eDNLdh4SJx8lUG92yq24w93RQXtVf?=
 =?iso-8859-1?Q?C0KgVc+Fr/PuCvjM7NP/MngmtR7mVLZCO+wTuyzdOv6PhlLDerhzua2/EU?=
 =?iso-8859-1?Q?C1luk8NADmRlOCp8IMQ03I/V8W+VnZUJjeGmpq5z82y9HUfE0AeGw6W0kt?=
 =?iso-8859-1?Q?Dw42rpjYbhjgO7wbQIotxtVOCCwgNeedLejTNcv8j9OopxLTig5yQ/NSsV?=
 =?iso-8859-1?Q?Y7ThoVybyhXW2FolJrabzdzvglxjslKos5YFL/DPIuUu5e53EFuutNE11q?=
 =?iso-8859-1?Q?iIbsxH31A6I5gu+GwqtGvVDgC6sgxyV0RhufG0upcF6Mp4dcDQIYpGyMuH?=
 =?iso-8859-1?Q?ITiJbRxjE08A7Pof7LP7X4mogzdNhbUS7axuOGTrW6Bl2zBwu9xwrJWVAN?=
 =?iso-8859-1?Q?9kaUE4GecEDfLpwpuX4hqgL96/rVC9awhq15BtE4tzaDKarIEogW15VXF4?=
 =?iso-8859-1?Q?eZ1jFj6hOxOSKt98ZgiY4/CifZtdmigNs3Iw6RQfl8qfCe3o+3zlfigkfn?=
 =?iso-8859-1?Q?O3XC/reA+LFU1GyoZtLqXfJF8q/tGdMX6NcaNonmJJH3kAZLKoZTwiAmmm?=
 =?iso-8859-1?Q?CuX5J+vuge11Jz91LX8u8TEYffP2IpdDoUnHc+nosCHM0B0lUEQzsOLhcZ?=
 =?iso-8859-1?Q?XujrNhzwZiY6jEEKlSb5TN8nlcaYBYaOUKT9XCuZeZBG8FU13LFkGuTqEm?=
 =?iso-8859-1?Q?oXu5Agv10ccFdrrv+vkL//tW1xQmjtbeG68AXt+PiI4/Dw68ZNlrzXi9ET?=
 =?iso-8859-1?Q?NkHOu2P109w7BMHFtgKVyyBwm8s5VK06EbJpCSVyA+SnadUafWc0JC3fmL?=
 =?iso-8859-1?Q?p0xCxjf+b/9FtO7fCYG+/dvzVfZ4Ho+itDuRX1cAj00BFcDkRFgT5EF4Ie?=
 =?iso-8859-1?Q?Fbt+5oC+Ma0u27IUpE7Wxp8MapF9dRpchvBBZXUTcS4Ayi0U77hG8oCYex?=
 =?iso-8859-1?Q?TXnAImKapXV5XAkeixlnC5LPEvHI0pAulb/0WsN96PdVBUdSEzH1L5Wv/j?=
 =?iso-8859-1?Q?xvHeso4CxYyWZe3LGiJMRBMDTPfn9AxW5/Qbg+SvznlFd/zWojBc5gPfHn?=
 =?iso-8859-1?Q?leybtzyW3M9PhcoW3lsaE1oPIFchgJ9x/8Rjct3YU4UBdcQ/z9GHw2x5MF?=
 =?iso-8859-1?Q?R8XvwjKJKtFfIssaBQzwrVpF9ddHIzAd8nPsK/b54ErlTznDzh65g8g6f5?=
 =?iso-8859-1?Q?+Jyv0rq8YwcB6uJe7NA0vvJfCrrxwJDuJIwjeVZm15D8C88X/F0L5jLOI6?=
 =?iso-8859-1?Q?gDprnVLIe++NS8usBYGVpCH5zvaIcjQE0bim75J23bNc6C7c1Bzltrlq7V?=
 =?iso-8859-1?Q?uOSP/0hT4BZwDiwXE2vn4894NI3hzhl4j/GK9CvN2XNg2u2oI6+gF4RBjl?=
 =?iso-8859-1?Q?crVmp0wCtteP1vzsS5h9f685YrMzB1KKkGbiAxDf6P+jdbJret7CbzWF4B?=
 =?iso-8859-1?Q?Ji5TC7QAbQoF0nyCSva4rf20KQCqM1e3nolqctVKcxUiy9f9s+3j+2V8LI?=
 =?iso-8859-1?Q?S443wnCknFPqdnYYI8+QonRWYUojpSISKfYRfgLwVn1B6ThmxaHJFZyiI2?=
 =?iso-8859-1?Q?ebMAuQaCngbSG1SEyJvNgHn/QX1GxleDrIKpYJVRz/5PazUtS6Fl7NQg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 413f0dc7-f4cf-457a-6c82-08de0da12748
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:18:13.4499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0UvIw/sAo3rmNmXP9ae4ToERHoF+PkqShIosUkMesxdkURpX0BPq4VPsk4RrBI+bsXCCCIAkKy4nz+mFc+zY5dX05Fadv4e3Ps728H4sKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

On Fri, Oct 17, 2025 at 02:05:53PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 16, 2025 at 07:26:42PM -0700, Lucas De Marchi wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> > column than the Xe2/Xe3 tables since compression is not supported.
> > There's also no "WT" entry (which we wouldn't have used on a platform
> > without display anyway).
> > 
> > Bspec: 71582
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 95 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > index 6e48ff84ad0a0..7649b554942aa 100644
> > --- a/drivers/gpu/drm/xe/xe_pat.c
> > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
> >  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> >  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> >  
> > +/*
> > + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> > + * option for compression.  Also note that the "L3" and "L4" register fields
> > + * actually control L2 and L3 cache respectively on this platform.
> > + */
> > +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> > +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> > +
> > +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> > +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> > +
> > +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> > +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> > +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> > +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> > +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> > +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> > +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> > +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> > +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> > +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> > +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> > +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> > +	/* 11..22 are reserved; leave set to all 0's */
> > +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> > +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> > +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> > +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> > +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> > +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> > +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> > +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> > +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
> 
> Why did we go from human readable names to raw magic numbers?
> This is now completely illegible.

For Xe2/Xe3 I think it's actually a lot easier to read since we have a
kerneldoc right above the tables explaining exactly what each column
represents:

 """
 * The Xe2 table is getting large/complicated so it's easier to review if
 * provided in a form that exactly matches the bspec's formatting.  The meaning
 * of the fields here are:
 *   - no_promote:  0=promotable, 1=no promote
 *   - comp_en:     0=disable, 1=enable
 *   - l3clos:      L3 class of service (0-3)
 *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
 *   - l4_policy:   0=WB, 1=WT, 3=UC
 *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
 """

Trying to write out symbolic names like we did on i915 became pretty
illegible due to the long/wrapping lines since we have so many fields
now.  It also became a nightmare to maintain since it was easy to make
mistakes (and also easy to overlook them in code review).  This approach
gives us something that exactly matches the presentation of the table in
the bspec (so easier to add/modify without making mistakes, easier to
review for correctness), and a key in the comments that makes it really
easy to quickly understand the specific characteristics that relate to
each row.

For Xe3p_XPC, we should probably duplicate that comment block (minus the
"comp_en" field that's not relevant here) since we lost a field compared
to the Xe2/Xe3 tables.


Matt

> 
> > +};
> > +
> >  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
> >  {
> >  	WARN_ON(pat_index >= xe->pat.n_entries);
> > @@ -380,9 +415,68 @@ static const struct xe_pat_ops xe2_pat_ops = {
> >  	.dump = xe2_dump,
> >  };
> >  
> > +static int xe3p_xpc_dump(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	unsigned int fw_ref;
> > +	u32 pat;
> > +	int i;
> > +
> > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > +	if (!fw_ref)
> > +		return -ETIMEDOUT;
> > +
> > +	drm_printf(p, "PAT table:\n");
> > +
> > +	for (i = 0; i < xe->pat.n_entries; i++) {
> > +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> > +
> > +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> > +			   !!(pat & XE2_NO_PROMOTE),
> > +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +			   pat);
> > +	}
> > +
> > +	/*
> > +	 * Also print PTA_MODE, which describes how the hardware accesses
> > +	 * PPGTT entries.
> > +	 */
> > +	pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> > +
> > +	drm_printf(p, "Page Table Access:\n");
> > +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > +		   !!(pat & XE2_NO_PROMOTE),
> > +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> > +		   pat);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	return 0;
> > +}
> > +
> > +static const struct xe_pat_ops xe3p_xpc_pat_ops = {
> > +	.program_graphics = program_pat_mcr,
> > +	.program_media = program_pat,
> > +	.dump = xe3p_xpc_dump,
> > +};
> > +
> >  void xe_pat_init_early(struct xe_device *xe)
> >  {
> > -	if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> > +	if (GRAPHICS_VERx100(xe) == 3511) {
> > +		xe->pat.ops = &xe3p_xpc_pat_ops;
> > +		xe->pat.table = xe3p_xpc_pat_table;
> > +		xe->pat.pat_ats = &xe3p_xpc_pat_ats;
> > +		xe->pat.pat_pta = &xe3p_xpc_pat_pta;
> > +		xe->pat.n_entries = ARRAY_SIZE(xe3p_xpc_pat_table);
> > +		xe->pat.idx[XE_CACHE_NONE] = 3;
> > +		xe->pat.idx[XE_CACHE_WT] = 3;	/* N/A (no display); use UC */
> > +		xe->pat.idx[XE_CACHE_WB] = 2;
> > +	} else if (GRAPHICS_VER(xe) == 30 || GRAPHICS_VER(xe) == 20) {
> >  		xe->pat.ops = &xe2_pat_ops;
> >  		xe->pat.table = xe2_pat_table;
> >  		xe->pat.pat_ats = &xe2_pat_ats;
> > 
> > -- 
> > 2.51.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
