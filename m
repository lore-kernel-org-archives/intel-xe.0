Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB5E74AD1
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 20:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010610EB6F;
	Tue,  3 Dec 2024 20:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpqISE8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB0610E164
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733258248; x=1764794248;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qEINKTgJztjN67fffS/bAMebmR1THMFtxw9wq6ifjS8=;
 b=DpqISE8hPWC8Yz9Y2LtvnND9xQMhjRWn70d4fU0DEFaMbXD1h7IvpJ7J
 2JY2fGtcgUBCzOv427kAdjYaKIw8fnX+iwCtVOKiebY8IdMFwfkXU4rGU
 ExVCsuakGVdOj+QP/hcxdBGQREfKM6sQnf/yYa4XI6e0Ry9TD5CCqcKGa
 2U49Dce3+tWBcTh7ccgh5Kej6W4RVAipY4pMq6DuplwK9geIhWOBezerB
 Ez87zj+7n4VKprVtQhFzDuMIqQpPPz43an3puPRAwsu0g4GkgnfkQ+9Hi
 sg0fC/c2GMwJ5Fi1MojDjso4GDA+q4A+zQ1g1efuJc7MBbpJCflqn+yf7 g==;
X-CSE-ConnectionGUID: 7scmBm4BR4+uB+bYDZz4SQ==
X-CSE-MsgGUID: ZRTx1TSWRuSrym3nuLtefw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37155401"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="37155401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 12:37:27 -0800
X-CSE-ConnectionGUID: cUVUZd31QFWdkJfkvV6TCw==
X-CSE-MsgGUID: ilYhm7WgSR66j5NGepthRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="94007741"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 12:37:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 12:37:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 12:37:26 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 12:37:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXn9kb4GXoOP+s0kB/rE4tFYbdHx44pyvJtjhmPa8QTWdqDRlYdLwRLC88z+D511DPqAZJ7RJvE7PtDXHojrkRrilZOdJnbLvcjGnlSXfiFCPkU0MnNRhmZRFBubOt/lcVut/IIA4x/dRa+FsqOSAJjk9SQCYbTlHZwxBylj63WS2Mj0dMyRyBcZfn0e2fFQpI9rP2+US8qSWRfgFmUYNqq26oUfx02w4X22tycFiGcwZx1U32aMJgYJ/M2MHHXiUbF6VUq0CtddlRa9gObxwGp9LixPBjVJNZfn1x3MGJnLnazKYXtyXQFawWvQPVTh7LzuWGYsLx1a7tlikS13tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHmoWrXGMIUbfFm93+rUcWBIR4/G3vKL/usTqZ0GzoE=;
 b=pB7Gcmp9dn8YsmeCuoL3fTMlzxSZ5egCjxE9i/Lm9jkjU+kkXgApt7m+Ah1ZWE0iAHXdHXTlTfAjwq3yVZdp12Hk8XWzdBOII8PAjWJgVKuBg8P5haVAMAC62sFCAwcMHuH63N7rnCi//rJYbggeaH9qkjRPai5RkkUy4zKyE2n5RdEV69QhDzOwjq7skuTyWVYJIIiKXuyqOTUSx4qT8ZiLTDNkKNVG4KMrXUNsnbzSK1dS/1P2+OnNXLsDTaEOG1QzMFj+sQv9IbDgIi3DqniU6Cf+7twPCXwavT+OUp7OGoKtHIhkwN+xsutJjwQv9Z7ku9WsbcZr5FOSRHx67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 20:37:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 20:37:18 +0000
Date: Tue, 3 Dec 2024 12:37:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Always setup GT MMIO adjustment data
Message-ID: <20241203203716.GL4891@mdroper-desk1.amr.corp.intel.com>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <20241114175955.2299-2-michal.wajdeczko@intel.com>
 <yzyjk63jmruhujcaqpkx4cd64ymrqvjmikwlltgbf7pmbg6s7o@ycn665ds4ile>
 <3dde1c69-39f7-4ae7-8ecd-31338ce94a80@intel.com>
 <4drzjxtmbgwjiwwuxxu6436parjojvohwhuqcyzktvihvpbomm@m2j64wuicfr3>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4drzjxtmbgwjiwwuxxu6436parjojvohwhuqcyzktvihvpbomm@m2j64wuicfr3>
X-ClientProxiedBy: BY3PR05CA0045.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f4fe9f-621d-44b5-09c5-08dd13da47a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8LyqC+0zfzwZntnkNhtSjaPMTL+A+u8GGGZUGXDgcV66SODaSsxDGQq2CI?=
 =?iso-8859-1?Q?oKeNIDrKY715UFfvheZ7UE20hkE+P8+V0DMtPiF7svmYAiOQP4VEonWABc?=
 =?iso-8859-1?Q?fQJ/uTTlwBKgAdN5adL33WQRceGYxU2ghDH97t89CjX/EuetaslrhVtd/d?=
 =?iso-8859-1?Q?WxzbglhWJNxPvTVrPZtNFjEAdaSpQRFx/PJyHrrsQ+Lejo3Q9YuSiOns4p?=
 =?iso-8859-1?Q?pzF4cG3M9bEDB/CkmK666P9cU2Vzq8K1inzvSFL9/m+DisLJzSyNfmntSl?=
 =?iso-8859-1?Q?sbz0HKgswh3e5RojeI73Fp5de7BHWq7T9lIuIB0t2LUffCYebFhOVkBaEF?=
 =?iso-8859-1?Q?8EnhCONsBfExh+tzUe5cLQV0IGxZrqDq28WPCk0IG+jozKY/CSTMF+PVPa?=
 =?iso-8859-1?Q?xr7Y7oof61mQFUv+PmlYZJODRrnVYztcO6uqOjiHvR3ah5bdu+BRYEt7iv?=
 =?iso-8859-1?Q?zuAwwlNQWiT8pwQcWQT42YIs8g969VBCfJrl+qoKlx284IZLkRE2eSj2tN?=
 =?iso-8859-1?Q?6duzgH75/O/4lKG9cuujbxXhzPCpm/C9+5r8V0t3NmKsVPZjLXfaFO9PiG?=
 =?iso-8859-1?Q?HQCVvTYAR0bIpjZrM5b7GFuDkgg8CrGbfW754TBNscnrBkF6qqj3vLBmKG?=
 =?iso-8859-1?Q?dLqorGmPTD+CTpW0EhNz/8+iRuFRsj5GWRCMaK2qT9/j7ZEilaWsx/tPfs?=
 =?iso-8859-1?Q?yRJJ8JSaCvcD1kYvK1DqyMFLF9EdawpW1wOLaK2QgUOGN9j+U3EUjMhA1d?=
 =?iso-8859-1?Q?ELg1lkD1ebnRBxJfwfapdsHjnms81nR+Ib8XE/5J1z1AMcldSGWEEdNIf7?=
 =?iso-8859-1?Q?MFF7kvdOukXyZcW/rRAVwK2872E8y3i3I/n1kiMs13RShkbIHeZlxjglTf?=
 =?iso-8859-1?Q?Sl8ILXOdfFFIZZu0+MZPPJDkP07lQKCMQwRT2FzBynps/5BIuQ5TwcFJH3?=
 =?iso-8859-1?Q?AKKbHUPb8YEFxJvBHkAD0Vxnjzwq8XA/1Y4/xXgFg/ZnL8SKl19557nIcI?=
 =?iso-8859-1?Q?vx2fWsQAeYwBgW7Uunx9KJApSzA2egY57nzFRQeeH5VP5MoqEUeMVC7LvZ?=
 =?iso-8859-1?Q?bPIx6UdCBAD150/qyohihOaakUWrfbQAv9Z7KZVxhaOrv5cWpwHyq0y1ah?=
 =?iso-8859-1?Q?pnbImUt5S5nLGmh57qstlYwQxQoMUcD4EhpmwU1J7tnUES3L/b+x26r9H+?=
 =?iso-8859-1?Q?NPSV/xZz1CSfn51rI61D+8F3TCBxXA5YCR+PtjR0GyD3rMcargSi7p1z+p?=
 =?iso-8859-1?Q?lKbZBZYzgsnNEUiYVZ/Y0AO1w3qMaoGTfpSsnrPQ1F1CSYldGCZETTdy4f?=
 =?iso-8859-1?Q?jvUscYCW0kVgJRk2hxyL47dOyL1WXNv6tZl59w6LXDj5n/ZA1JsH+SU5dY?=
 =?iso-8859-1?Q?E0kglM1G0Ei/IweOP6UhKfHJOVXh3rQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YIrMCy0JNzNr1LkEk68GgMRzV34pn5xf7E5js/qK6IIpWXcR1JrBnNiC6o?=
 =?iso-8859-1?Q?4YDN37USb443YHW+SKm4yCAcqrqDUfphqahuIjYHrgKW/DftuxfbfLnygu?=
 =?iso-8859-1?Q?d7j9sEE2BztYzAX/yom6ynulrmE1N4iidhf4z9Hw131yHvHSA1xzdTxSqa?=
 =?iso-8859-1?Q?RozF/a5O0SQ1QYNtWnWejh5YvpyeNsvrsQXne/QKTAAXBzl6cjZSC9bwip?=
 =?iso-8859-1?Q?l3uiR8kHv/SkhkNo5PwWGtakKdYg+mWkHA7/3Qn3rXDTsdYHgGm2tTkw1p?=
 =?iso-8859-1?Q?zgSJ67vjrGcjupATP+QMyBTNvjt5KTQ4D6HVRd4TJ9zaaFtsBqh0isvrqL?=
 =?iso-8859-1?Q?s8M5rzgbYgYbrf/k7wfuzwZS10ZyMp7qCLatbYvrVsNXWYa6BV1uNud5Pj?=
 =?iso-8859-1?Q?9rO7dbqBy/RvL7q03Vf1CLmUSCN2BwUJY5oVVfASUhb2Ua+BQFYgs+vsbw?=
 =?iso-8859-1?Q?3PXgtVCNSJ67OvohBCNjH+KKod6Uhgi9IPv67M7sCrfrDGO6An0fj8Lq1L?=
 =?iso-8859-1?Q?flgDrHtcCynrGVNi9XROJIRMNZIEJLSk5BuxB7VAw/rmV3NPR1xHX2qtyT?=
 =?iso-8859-1?Q?tj+tQKl4FnEwIt4oxr4v6zzvYwPiDNDS7g9qoNuWiZ0rSIRRSp45U3C6zH?=
 =?iso-8859-1?Q?+4gsffstdBp9iSL6f7BuxvVshomLGJOW0D13Tv2e5HrqYHIJVATy+hteYB?=
 =?iso-8859-1?Q?CQmQpR4O2KonXoukhnUPtjLVcJOa2h55ClmByO2nc+tfxBMeQ4XwcEBCEG?=
 =?iso-8859-1?Q?dZFtWN1ozpHGyyJVLCNUnEgmoh8qkU+MKNeNNR+wy7qHZ9dKZzp94bNTTi?=
 =?iso-8859-1?Q?FKp5B6bJVJOlGxBedZDTbBF9AI55vNRL34VvG0m7jUnwa8fTFkNsmaP61C?=
 =?iso-8859-1?Q?CfP/2NWoKaWliGsTc7hnScvWNtPNhNO14z98qJkYvrhcVQOXaN3ctoBXTE?=
 =?iso-8859-1?Q?TsRt0eVlbvNCmY6mQsa0InEZQNMQiwjq0nARr8fJZrEvex/o9r2DOg1bpj?=
 =?iso-8859-1?Q?Hj4ogzhvgB98S2rud+38fE19WQd/F3zRoHTvP3DyV9fpd/cMvXMXn/ou2/?=
 =?iso-8859-1?Q?V4kXLDwzcBxEvWP3BJisV4gN+e3wlI+wgGNM4DQMMqlGEDyr5MNnkbzvPb?=
 =?iso-8859-1?Q?W8OLLb9aqKVpy/YwQ+5albwHRpYsQbr34aVnPv37HgpSrQ9cV7K//Dx+S3?=
 =?iso-8859-1?Q?QQ1pjGR9xwgy8+5sbELm2ToTd3Zsfl91iUD/aNXqdkttv02RxXNUt4AwHv?=
 =?iso-8859-1?Q?gM3q9Bdm2OvP/IgURRVYxk+rPpouLNQFrJNDQWJhZCyatJ2aDyDEPzAD/q?=
 =?iso-8859-1?Q?T06vAJ/e/JaL1B4ZHJVtRLJ5gA3zYJgN7kPeWrp3b1LoeZGJTwRIzlj8LA?=
 =?iso-8859-1?Q?cOEdbgH7vxkV16u9ku8sFGOUNQFnmjL7db+0IAgkjHwpDY1lHQjBFpM++Q?=
 =?iso-8859-1?Q?PZ4DSQXPst/p6Tfj5uNtU9JEg9aRHtkVTxHNWjYcY2HpPavfSHCMPuFnNd?=
 =?iso-8859-1?Q?126pSIQ7dKoBPEfwtUxp7zAXO1CmM2TFi5uSeOWwh5YgFPKjkXIQ43dkVi?=
 =?iso-8859-1?Q?LcUClrXf2L9iDkr+Hxrg7k8QaiyU6i131SZPw46V4el8ZEpvWl3AJkWE4P?=
 =?iso-8859-1?Q?IFiFQ11/1sahLJfDEaUhs+z6ajWRbCWyWNX6tqKm1W7kpmRqTkmow0xA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f4fe9f-621d-44b5-09c5-08dd13da47a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 20:37:18.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v7t2qLjLpaiVBIScrP7OLdKsINQtnowqR8h+K22/vA5MZ+yVqaCFDR3NjTrrs42I4j/CjuQtcDWWdvHjlogEMdFF0g0UHLdY9ozhs0ulhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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

On Tue, Nov 19, 2024 at 02:33:28PM -0600, Lucas De Marchi wrote:
> On Thu, Nov 14, 2024 at 08:36:46PM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 14.11.2024 20:23, Lucas De Marchi wrote:
> > > On Thu, Nov 14, 2024 at 06:59:54PM +0100, Michal Wajdeczko wrote:
> > > > While we believed that xe_gt_mmio_init() will be called just once
> > > > per GT, this might not be a case due to some tweaks that need to
> > > > performed by the VF driver during early probe.  To avoid leaving
> > > 
> > > can you be explicit where this is being set on the VF case?
> > 
> > it will be used in read_gmdid(), see next patch
> > 
> > > Shouldn't VF
> > > itself deal with fixing up what it did?
> > 
> > in read_gmdid() we already said
> > 
> > 516      /*
> > 517       * Only undo xe_gt.info here, the remaining changes made above
> > 518       * will be overwritten as part of the regular initialization.
> > 519       */
> > 
> > and it looks that xe_gt_mmio_init() is not overwriting everything as we
> > would expect
> 
> We only need to read the gmdid and for that need the mmio struct to be
> filled out. We end up needing the gt as a context, but this all looks to
> be fixing things that shouldn't have been done.

I think the problem is that when you say we "only need to read the
gmdid" that isn't a simple register read when running on an SRIOV VF.
Rather it's a handshake and query sent to the GuC, which actually
involves reading/writing lots of GuC registers to eventually get back
that single version number we want.

SRIOV has a lot of chicken-and-egg problems; in this case the problem is
that our driver needs to know what IP version it's running on in order
to know how to do basic GT initialization.  However at the same time we
need to have already done basic GT + GuC initialization in order to even
find out the IP version since the VF doesn't have any direct access to
the GMD_ID registers.  So we wind up relying on some ugly hacks like
this that do a partial/fake initialization of the GT (under the
understanding that a lot of other GT functionality like MCR, forcewake,
etc. won't get used) to do things "out of order" compared to native
execution, and then we come back and fix things up later.

I think some of the headaches here are really oversights in the hardware
design (e.g., why doesn't the VF BAR expose GMD_ID values somewhere so
that we don't have to go through the GuC?).  But I don't have any good
ideas for handling things in a cleaner manner, aside from having a
completely independent .ko with different code flows to run on VFs,
which I don't think anyone really wants.


Matt

> 
> without looking deeper I don't have a short-term alternative, though.
> 
> Matt Roper, any better alternative that comes to mind? You did the mmio
> conversion and acked this "misbehavior" for VF earlier, so I'd like to
> hear your opinion.
> 
> Lucas De Marchi
> 
> > 
> > > 
> > > > any stale data in case of the re-run, reset the GT MMIO adjustment
> > > > data for the non-media GT case.
> > > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > 
> > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt.c | 3 +++
> > > > 1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index d6744be01a68..d45d2cecc4dc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -643,6 +643,9 @@ void xe_gt_mmio_init(struct xe_gt *gt)
> > > >     if (gt->info.type == XE_GT_TYPE_MEDIA) {
> > > >         gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
> > > >         gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
> > > > +    } else {
> > > > +        gt->mmio.adj_offset = 0;
> > > > +        gt->mmio.adj_limit = 0;
> > > >     }
> > > > 
> > > >     if (IS_SRIOV_VF(gt_to_xe(gt)))
> > > > -- 
> > > > 2.43.0
> > > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
