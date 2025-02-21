Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31777C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 16:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8D10EB04;
	Fri, 21 Feb 2025 16:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcqijVIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AED10EAFF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740157170; x=1771693170;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fFR+VnRDgSTEpYgCnIUkovqc1FpX3O/ODADlCCsnOn4=;
 b=UcqijVIAFnixHfzRaCKdH9I+zaCc16osv8wXCcgxQmzHWTz6Ll4ybTRf
 zX79l8nxjRWfoZRRJMCvpvyaViUevQ2fi/nV9jjHSLHlZWy0r3mlP9n4U
 rfIc8aQmcbVbu1CSVyTYNNYtNNGTSTNOIno0ZxRCe8lnt/5ah43N/aDMM
 j1CfY3SdGOWzcsSEIQclxBQpz/CDf45iliPhb3JUOT8vMh60vug1mh8bb
 p57Q6f83ehZyWKSjHnMUR3FeJ7SV2AspuojD3HXDwoAH4wV1hfImLDxBb
 e8NXYQh2h/2HC7/TODJxiaVROgO3Pw4gmpsN/9ucGvUYRnwM8qz9C8aev g==;
X-CSE-ConnectionGUID: aOT1tpwTQl2komHHKpkSdg==
X-CSE-MsgGUID: txg2qe5RSf6YzQ/kDlMGVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44630723"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="44630723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:59:30 -0800
X-CSE-ConnectionGUID: v5mfIhf6RnWhkzb5ubyS2w==
X-CSE-MsgGUID: aoFAkeoTRcGP8hO03Z9Dzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="115619646"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:59:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 08:59:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 08:59:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 08:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+1KaVPew7BJKX1UWzqQeHPtfpcqfW1knakKZNZkiMcEusgID2ShFBL+FYYNPZzIrSTZIsqIAX38s0rdyaiwb+NQt8FiGErWGh5996Du6bOoTbuWKAghz4hSNvDDjHGqz7VZY0mbtPzrUgiGRBHT40GtFSr1OwJo9Kdl+etfNDY7QO/Cy6BmHgKud41XmSbtfX5b+Pf8S1oInQXf9kJkN0Z5gAraeA46x2FvhqbKYycxeXIgSM9HJXmAMjGwo79xLbk1OYnvif4QuM0k93PNhCtLCGSgEYE4RRiLgcSDuCV2C3wTDOYtyceOZS9uXeYKm4Ayxi6E6Rfj2xqjo/vdvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIDSMRROLLnY/zHdV90K042wYs/034OePxnfhtFesEo=;
 b=ODy1Js+xjyEpsUz9IJfCg4E7ucHi2w/VS+ZEiRBTH3CKJXHkSIotNtgc+FFb9BN28NIAB8TTvYZEZ3Zf/4YyQQpDsTNV9ZB97DNblxY4X/ie4CzsE41gd5Qlc9hHLXE1ZXFlYmkuDg/FdfqtnGEHsMu1AEa7bU9DEl7TunK5Azn4FOhNb0ixAisCLRH/tgBhI3XycIqBKmgcPJMaCzKvrL1tX7/3TiFXloiKKOJf9LJLCm9b889xNx9cAiDEgPnvcJKf2pcy2EzuoOwcmxVYKPQiP6rzo+njJiewYKANS9QDczu5mUq0VIA9Hx6RiI1A8qLTOEN61eR/myZAVdy9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 16:58:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 16:58:37 +0000
Date: Fri, 21 Feb 2025 08:59:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z7iw/CKVpez3qv8G@lstrano-desk.jf.intel.com>
References: <20250220234557.2613010-1-matthew.brost@intel.com>
 <20250220234557.2613010-3-matthew.brost@intel.com>
 <7685842d544a4e9673dc4ec2645044a8ded58848.camel@linux.intel.com>
 <Z7iQ/Y2VIo8sjvsh@lstrano-desk.jf.intel.com>
 <fc92aa5518b0969a504b5849d21ee4866ec4965a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc92aa5518b0969a504b5849d21ee4866ec4965a.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff4daba-a2ed-44b1-ab6e-08dd5298fbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wA5PVCY4tLbeHQ3VKhojArTP0pNU5LDJjs6vyoxkvyZIU/rEvv18RR8agt?=
 =?iso-8859-1?Q?wmoTYkl7O3Lngip6JJzcRPgYNkywYX9fr2Aers/mLUm4k4En/MT2BZrECf?=
 =?iso-8859-1?Q?/tOHtqkNxlVSX8NMozEbAXWkYxaxVVytZKcIBCroZUjGE9h+OThyCecMsd?=
 =?iso-8859-1?Q?Q6rRsxLZE/So+E0mMdCLpGtkAIvp2noTUZMY+CAOl+Xg0zNcXw/YVXRDga?=
 =?iso-8859-1?Q?Z1W+zXWSthib0LP4LCQE5Ol6e4KO6KKwee+HNuiLI1lfzGCVuK1MW1pqzD?=
 =?iso-8859-1?Q?kT9aaFDE9hGf/znQTdxJF61F3uEjPtZKzYxHLu58wpn1RQFdam3jAVl9FF?=
 =?iso-8859-1?Q?/YtRPCqqRaUF2hHicRZKhFGGt4HIR5fJhovGfzO/5sLgv+P2hGEmR9Lba7?=
 =?iso-8859-1?Q?WNBq07tH5ErhdDaev8B+LD1nm2jVK009t9WjMq5+M2490lwENA3gNrvtcG?=
 =?iso-8859-1?Q?CrcKwH2ry70kzO+FfBe1nfQjTTlFNauciKSq4y65J5EH/XdzoCT3dHRDKN?=
 =?iso-8859-1?Q?JPBYZSI8M5gDThQaEgFBSeMOqw1ksvuJBcyDBM8f8YAiVDF2ab7M2AvN+t?=
 =?iso-8859-1?Q?/RVeVmuqL8zVYWKJbNX9J9mOlFMTTbVGsZm6m04wJZoU/Z3UcECAHobFeb?=
 =?iso-8859-1?Q?+6oKxJlMJIezZGqs4sNw0g2+nWLkbXYpZRY/WRjVBI53ImuEiqgwP2QyV7?=
 =?iso-8859-1?Q?6l3zODINiTZ6GtDcQnrt3Z/KSLi+nBOVNKcq0PZezztdxq91OdKDQDxxe0?=
 =?iso-8859-1?Q?Ms9lMyypYIs0A+xdBTpdcsBPFhl6GvgZLNLWqgXrdMklTNN3OkllB/SlIA?=
 =?iso-8859-1?Q?TS4VjSkZEKry9G0iv5FK9ck6sSD2Le0sa2ZO33CbSCbyox6qWSVhNyMiER?=
 =?iso-8859-1?Q?ZBfydEARzQCrTMKsmMgS777GFu8YIJsj4IeKgQ6Dd/1wQd931aRMMdIi/b?=
 =?iso-8859-1?Q?gQZhqsTnHYWydic0/NIFg8UMpZgLK3HGcCRt3HNi4pY8YWMFEhlMswtRRO?=
 =?iso-8859-1?Q?ngKIPAAxJalX8ygSp5zT5yI8Nf0k6kjH6CFiRyv/zdQrNEgntWNd3JKt+u?=
 =?iso-8859-1?Q?n77jifc4WrQHDn+i6BrDpJgrO/AORSST8ToxF9tvD9oKzquVfLOZ50TVIS?=
 =?iso-8859-1?Q?maLbphaNqxf4XlpkH5NwBokKP+OgL7JjjXOl74PU/wnD6xUcKHMXQyR2CP?=
 =?iso-8859-1?Q?J6EJRMeLzQNagKUw77qgp2s//kWHxD1KIl7xSOG3fhHJL0QDd3EWSJhuco?=
 =?iso-8859-1?Q?FnvObHRzAopED5lr3BQmJOK+JOc/o9YmkoJAwPEJMI/B7U85PU8bGKwPZb?=
 =?iso-8859-1?Q?M5jh7yb1xeeQS4qBdgH/PlqnmiTGiHqnvV0rlbg9uPn9E+/MGPn4YZzC/R?=
 =?iso-8859-1?Q?VmpAcOdI4B8THi4WcUCPe6aPT/euQZU1QxZi/bYnXQtV0II0NnItZfVqpJ?=
 =?iso-8859-1?Q?X0P5QllCy9EBS5us?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FfQzlgO7IWrViQZCyuPsYTQe4ehhpPTVUU7TyR0jKjBcZUQtLOiys7RxGR?=
 =?iso-8859-1?Q?yzeXhTahNhc+tfTmKk1Z/ZGstkgqvOte4c9KeMLcS1FtU9F2TBquwZSx21?=
 =?iso-8859-1?Q?221qJD/IDTHGOIcEDYJcpZCgQnLMX7JoMEBpW2jiUMem2aEZRrv4FtOtqZ?=
 =?iso-8859-1?Q?bjfL4D+CE3/U6kXxzwwJurIDGJBUAlDlwZZFO0XKnAg7ceHB5dNjj43Ejn?=
 =?iso-8859-1?Q?vCU3asgFEmUbN159S/ndCIuyts1uqnklE5iaodET8whPcuYfHf/vVc6Tnr?=
 =?iso-8859-1?Q?ms8cCGL8nARbTEIucVubO+qTa0tHVNhOwZ1PiyAYkSvzK8g727D89ffv5y?=
 =?iso-8859-1?Q?DmLSTkPO702tl/nx0EJdV61yQUuqInz3njwHjKDOOkf8zINiDD6OVG8NMr?=
 =?iso-8859-1?Q?BV214WnSwpxwwZ5tCQHo5VPnW0fdccDHkrx85XPswoxB3kguLFIFng/dcP?=
 =?iso-8859-1?Q?t/deHh+vrukDB2Pk1es+geEYb/JRfY/0uns+41bm8apedrnA8XZv+YUvG4?=
 =?iso-8859-1?Q?6bYezHTl+5jZB8kXOFBQ52MCOPmqK4m5oIf9nmpEf1c6ZkDxMclrFLYLQl?=
 =?iso-8859-1?Q?IF5p6a02ugigc2P/ICdHhwlIDWdeLBv+xxTThgsepxYHs7ZNZgGdkWVWM6?=
 =?iso-8859-1?Q?3mswN5U+CWn//N8EMdqecFpr7RPlIw22DfeIe9h/0HJM/A6beCHVwkt5HF?=
 =?iso-8859-1?Q?ko0eajdbIXsx+fli4jK8KqxplrY50jRl3LoKCm4Du6vNHI5U9UXKBzdSn9?=
 =?iso-8859-1?Q?0o5qJHXJo0/eV+KW8r0JpQgV2lpjX+Pn73sFtBa2X6aDS4hdRipUdTGI6s?=
 =?iso-8859-1?Q?VX8iMhD1SBX0IeFmk5zldNWGmEAdEPfrzUlhJwzx0d70VCMbedQxmPK1IE?=
 =?iso-8859-1?Q?x8sEvlCY1PMjE0+NCTaDXcITl1hyQIA2REg9tlcbjqHYG8X9me7Lm1wH0h?=
 =?iso-8859-1?Q?doe0QajO9r3KVs5OnhrdGoXzFTHP1P33oBbOYzxbbsTP2T97eeBLZk0Nnv?=
 =?iso-8859-1?Q?y50obsFGTp77Cq1ZhEW+WSqRPpFXUWqehzcUW0SH/lpMUEfWXawytNTbFp?=
 =?iso-8859-1?Q?p3gJCQEn/UWdfODaAb2pcr00H7M782KZsXX2cQkYdqLxRdBLrGJk8WKEuW?=
 =?iso-8859-1?Q?v7m40GMmzGRfNy4b4VqapryD6eBlnKZjZ2vnB8jrrYpMBj8jA2hzljGClr?=
 =?iso-8859-1?Q?2TpfAdaVLQv873u/W6bnACJf0pnlTZ8E58UGQQUiG+Z1Zji3ZjXir1oh6l?=
 =?iso-8859-1?Q?om8gI2hSHqdf2QuPxpi1WBrLhX4V2+Zbm2rmZ+cl6NZMRIVUJPggNcR6da?=
 =?iso-8859-1?Q?JOL07s1DuBcXoRe0qsCeYCt28JonJ7XPLPWuX4+nlGYn4o6CeZE0twst/N?=
 =?iso-8859-1?Q?vRvaN8fOzQGwD5i9Pn1lDLSR1c9B0XdtviOzLMqqpHP23ylXzYTGPEnJd6?=
 =?iso-8859-1?Q?sNuuh6p0pduIiT6/X5Gf2RqnkSaGuFXYtQLIpQAAZRNt4jn6oVfIru3yfS?=
 =?iso-8859-1?Q?OBT9UWJ4v4vhdjovDOAlRJGzv28+iFTizBT5FcMAnGRMZal+eq9u4reihk?=
 =?iso-8859-1?Q?+f5yl5L3yRwwXMnvbo1pnOjkj7b7SQlcjU35nHe9CaLN7od5HVWxU2dwan?=
 =?iso-8859-1?Q?peZ57yIpC3jppxCtBOf9GCGo3+OahsD462yZHTkaNuDvoYiCleZE7WgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff4daba-a2ed-44b1-ab6e-08dd5298fbf2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 16:58:37.3471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I91Bl731I124dRGy1qHmyiyFtUby186dMIZhEtcjNzCLGRpLW+YKhmLwje/kQ8Pe80Q2TaYYKRoxMCBNMheTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

On Fri, Feb 21, 2025 at 04:27:36PM +0100, Thomas Hellström wrote:
> On Fri, 2025-02-21 at 06:43 -0800, Matthew Brost wrote:
> > On Fri, Feb 21, 2025 at 12:34:12PM +0100, Thomas Hellström wrote:
> > > On Thu, 2025-02-20 at 15:45 -0800, Matthew Brost wrote:
> > > > Squash bind operation after userptr invalidation into a clearing
> > > > of
> > > > PTEs. Will prevent valid GPU page tables from pointing to stale
> > > > CPU
> > > > pages.
> > > > 
> > > > Fixup initial bind handling always add VMAs to invalidation list
> > > > and
> > > > clear PTEs.
> > > > 
> > > > Remove unused rebind variable in xe_pt.
> > > > 
> > > > Always hold notifier across TLB invalidation in notifier to
> > > > prevent a
> > > > UAF if an unbind races.
> > > > 
> > > > Including all of the above changes for Fixes patch in hopes of an
> > > > easier
> > > > backport which fix a single patch.
> > > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: e8babb280b5e: ("drm/xe: Convert multiple bind ops into
> > > > single
> > > > job")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
> > > >  drivers/gpu/drm/xe/xe_pt.c            | 86 +++++++++++++++++++--
> > > > ----
> > > > --
> > > >  drivers/gpu/drm/xe/xe_pt_types.h      |  1 -
> > > >  drivers/gpu/drm/xe/xe_vm.c            |  4 +-
> > > >  4 files changed, 64 insertions(+), 28 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > index 4389e5a76f89..ab281e721d94 100644
> > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > @@ -13,6 +13,7 @@
> > > >  
> > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > >  
> > > > +#define XE_PPGTT_IS_LEAF		BIT_ULL(63)
> > > >  #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> > > >  #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> > > >  #define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 1ddcc7e79a93..26b513a54113 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -389,6 +389,8 @@ xe_pt_insert_entry(struct
> > > > xe_pt_stage_bind_walk
> > > > *xe_walk, struct xe_pt *parent,
> > > >  		idx = offset - entry->ofs;
> > > >  		entry->pt_entries[idx].pt = xe_child;
> > > >  		entry->pt_entries[idx].pte = pte;
> > > > +		if (!xe_child)
> > > > +			entry->pt_entries[idx].pte |=
> > > > XE_PPGTT_IS_LEAF;
> > > 
> > > I don't think this is needed.
> > > 
> > 
> > It is. Will explain below.
> > 
> > > >  		entry->qwords++;
> > > >  	}
> > > >  
> > > > @@ -792,6 +794,24 @@ static const struct xe_pt_walk_ops
> > > > xe_pt_zap_ptes_ops = {
> > > >  	.pt_entry = xe_pt_zap_ptes_entry,
> > > >  };
> > > >  
> > > > +static bool __xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma
> > > > *vma)
> > > > +{
> > > > +	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > +		.base = {
> > > > +			.ops = &xe_pt_zap_ptes_ops,
> > > > +			.shifts = xe_normal_pt_shifts,
> > > > +			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > +		},
> > > > +		.tile = tile,
> > > > +	};
> > > > +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > > +
> > > > +	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > +				xe_vma_end(vma), &xe_walk.base);
> > > > +
> > > > +	return xe_walk.needs_invalidate;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
> > > >   * @tile: The tile we're zapping for.
> > > > @@ -810,24 +830,12 @@ static const struct xe_pt_walk_ops
> > > > xe_pt_zap_ptes_ops = {
> > > >   */
> > > >  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
> > > >  {
> > > > -	struct xe_pt_zap_ptes_walk xe_walk = {
> > > > -		.base = {
> > > > -			.ops = &xe_pt_zap_ptes_ops,
> > > > -			.shifts = xe_normal_pt_shifts,
> > > > -			.max_level = XE_PT_HIGHEST_LEVEL,
> > > > -		},
> > > > -		.tile = tile,
> > > > -	};
> > > > -	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > > >  	u8 pt_mask = (vma->tile_present & ~vma-
> > > > >tile_invalidated);
> > > >  
> > > >  	if (!(pt_mask & BIT(tile->id)))
> > > >  		return false;
> > > >  
> > > > -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> > > > xe_vma_start(vma),
> > > > -				xe_vma_end(vma), &xe_walk.base);
> > > > -
> > > > -	return xe_walk.needs_invalidate;
> > > > +	return __xe_pt_zap_ptes(tile, vma);
> > > >  }
> > > >  
> > > >  static void
> > > > @@ -843,9 +851,10 @@ xe_vm_populate_pgtable(struct
> > > > xe_migrate_pt_update *pt_update, struct xe_tile *t
> > > >  	for (i = 0; i < num_qwords; i++) {
> > > >  		if (map)
> > > >  			xe_map_wr(tile_to_xe(tile), map,
> > > > (qword_ofs
> > > > + i) *
> > > > -				  sizeof(u64), u64,
> > > > ptes[i].pte);
> > > > +				  sizeof(u64), u64, ptes[i].pte
> > > > &
> > > > +				  ~XE_PPGTT_IS_LEAF);
> > > >  		else
> > > > -			ptr[i] = ptes[i].pte;
> > > > +			ptr[i] = ptes[i].pte &
> > > > ~XE_PPGTT_IS_LEAF;
> > > >  	}
> > > >  }
> > > >  
> > > > @@ -1201,7 +1210,30 @@ static bool
> > > > xe_pt_userptr_inject_eagain(struct
> > > > xe_userptr_vma *uvma)
> > > >  
> > > >  #endif
> > > >  
> > > > -static int vma_check_userptr(struct xe_vm *vm, struct xe_vma
> > > > *vma,
> > > > +static void
> > > > +vma_convert_to_invalidation(struct xe_tile *tile, struct xe_vma
> > > > *vma,
> > > > +			    struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > > +{
> > > > +	int i, j, k;
> > > > +
> > > > +	for (i = 0; i < pt_update->current_op; ++i) {
> > > > +		struct xe_vm_pgtable_update_op *op = &pt_update-
> > > > > ops[i];
> > > > +
> > > > +		if (vma == op->vma && (op->bind || op->rebind))
> > > > {
> > > > +			for (j = 0; j < op->num_entries; ++j) {
> > > > +				for (k = 0; k < op-
> > > > > entries[j].qwords; ++k)
> > > > +					if (op-
> > > > > entries[j].pt_entries[k].pte &
> > > > +					    XE_PPGTT_IS_LEAF)
> > > 
> > > IIRC It's a leaf iff op->entries[j].pt->level == 0 ||
> > > xe_pte_is_huge(pte) (xe_pte_is_huge(pte) needs to be coded)
> > > 
> > 
> > The 'op->entries[j].pt' here is overidden at this point as part of
> > the
> > code which handles the unwind on error. See
> > xe_pt_commit_prepare_bind.
> > 
> > We can't reason whether the pte is a leaf without knowing the level,
> > thus the extra bit here. Ofc this could be coded differently. Open to
> > ideas but this might not needed if we just return -EAGAIN - see
> > below. 
> > 
> > > > +						op-
> > > > > entries[j].pt_entries[k].pte = 0;
> > > 
> > > This should be a scratch pte unless it's a faulting VM?
> > > 
> > 
> > Yes, if the VM is in scratch mode, this should be set scratch.
> > 
> > > 
> > > > +			}
> > > > +		}
> > > > +	}
> > > > +
> > > > +	__xe_pt_zap_ptes(tile, vma);
> > > 
> > > Umm, A zap here would race completely with other pipelined updates
> > > right? Why is it needed?
> > > 
> > 
> > The PT tree is fully updated at this point. The nature of an array of
> > binds means each operation must fully updated the PT tree before
> > running
> > the next operation. Thus is safe to call zap here.
> > 
> > This is needed for invalidating leafs which are part of an
> > unconnected
> > tree always setup by the CPU.
> > 
> > e.g. A 4k bind on empty does this:
> > 
> > - 1 PT op to prune in a PTE at the highest level
> > - (Highest level - 1) to 0 are part of an unconnected tree setup by
> > CPU
> > 
> > Here we'd only want to invalidate the level 0 PTE which
> > __xe_pt_zap_ptes
> > does.
> > 
> > What is missing, as above, the zap would need program a scratch entry
> > in
> > the VM has scratch enabled.
> 
> What I meant was let's say you have *pipelined* a number of bind-exec-
> unbinds, Then the zap might be landing between a previous bind and
> exec, since it's touching shared page-tables. The userptr notifier
> waits for all previous PT modifications to complete to avoid this.
> 
> The rule we have is pt structure updates are done sync, but pt value
> updates are queued, unless they are touching nonshared pagetables that
> aren't published yet.
> 

So we'd have to wait here on BOOKKEEP slots before calling zap? I
thought zap only touched leaf entries?

e.g. VM has single a single VMA 0x0000-0x2000, zap would invalidate 2
PTEs at 0x0000-0x1000 and 0x1000-0x2000 not the higher level PDEs even
though PDEs are not shared in the current structure.

If zap hits the PDEs, then yea this would be an issue with pipelining.

> > 
> > > > +}
> > > > +
> > > > +static int vma_check_userptr(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			     struct xe_vma *vma,
> > > >  			     struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > >  {
> > > >  	struct xe_userptr_vma *uvma;
> > > > @@ -1215,9 +1247,6 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	uvma = to_userptr_vma(vma);
> > > >  	notifier_seq = uvma->userptr.notifier_seq;
> > > >  
> > > > -	if (uvma->userptr.initial_bind &&
> > > > !xe_vm_in_fault_mode(vm))
> > > > -		return 0;
> > > > -
> > > >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > > >  				     notifier_seq) &&
> > > >  	    !xe_pt_userptr_inject_eagain(uvma))
> > > > @@ -1231,6 +1260,8 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  			       &vm->userptr.invalidated);
> > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > >  
> > > > +		vma_convert_to_invalidation(tile, vma,
> > > > pt_update);
> > > > +
> > > >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > >  			struct dma_resv_iter cursor;
> > > >  			struct dma_fence *fence;
> > > 
> > > And I really think here we should remove the open-coded and
> > > undocumented invalidation (It took me like 15 minutes to understand
> > > what the code did, and then I'm already up-to-date with how
> > > invalidation works).
> > > 
> > 
> > Yea, this ended up being more complicated that I though it would be
> > and
> > took me several hours to get this (mostly) right.
> > 
> > > If just returning -EAGAIN doesn't really work here for the preempt-
> > 
> > I think return -EAGAIN should work. A quick hack got what appears to
> > be
> > livelock on xe_vm.munmap-style-unbind-userptr-one-partial with error
> > injection enabled. Need to dig in more, but my guess is this test
> > does
> > user bind which results in enough internal OPs so the error injection
> > is
> > always hit on every user bind. If this is the case, we could tweak
> > the
> > injection algorithm to use a counter based on user binds not internal
> > OPs.
> > 
> > In practice, getting an invalidation between getting the CPU pages
> > and
> > this step of the bind should be exceedingly rare, so return -EAGAIN
> > doesn't seem like a huge deal. But this code path could really help
> > for
> > SVM prefetches where perhaps a single page is touched by the CPU,
> > thus
> > aborting the entire prefetch. If we could just squash that part of
> > the
> > prefetch into an invalidation, that could be useful. So weighing the
> > complexity of an invalidation vs -EAGAIN needs to be considered.
> > 

Can you comment on your opinion if we should pursue this patch or go the
-EAGAIN route /w updated error injection? I don't see other options here.

> > > fence case, Then I suggest that the error injection intstead
> > > triggers a
> > > real invalidation outside of the notifier lock.
> > 
> > If the error injection really kicked the notifier, that would be
> > better.
> > 
> > > Perhaps using mmu_notifier_invalidate_range[start|end]()?
> > > 
> > 
> > Off the top of my head unsure how this would be implemented or if it
> > is
> > possible. Generally a bad idea to call low level core MM functions
> > though and I could see that upsetting the core MM people too if they
> > make changes to whatever functions we need to call.
> 
> Good point. Maybe we could call our userptr notifier and update it so
> that the check for first bind is done after the list addition.
> 

I don't think we can call the notifier to mess with the seqno unless we
enter through the core functions. Without a notifier seqno update, we
won't get into this code.

> > 
> > > But for now since this is a fix, restrict the -EINVAL inject to
> > > cases
> > > where it works and that we want to test.
> > > 
> > 
> > Not following this.
> 
> What I meant was Just test the -EINVAL error injection in the cases
> where aborting the whole operation is the expected result (IIRC that
> was with page-faulting).
> 

Still not following. I don't see how -EINVAL relates to the
xe_pt_userptr_inject_eagain code which is how test this code path.

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > Thanks,
> > > 
> > > /Thomas
> > > 
> > > 
> > > > @@ -1252,7 +1283,8 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op
> > > > *op,
> > > > +static int op_check_userptr(struct xe_tile *tile, struct xe_vm
> > > > *vm,
> > > > +			    struct xe_vma_op *op,
> > > >  			    struct xe_vm_pgtable_update_ops
> > > > *pt_update)
> > > >  {
> > > >  	int err = 0;
> > > > @@ -1264,18 +1296,21 @@ static int op_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma_op *op,
> > > >  		if (!op->map.immediate &&
> > > > xe_vm_in_fault_mode(vm))
> > > >  			break;
> > > >  
> > > > -		err = vma_check_userptr(vm, op->map.vma,
> > > > pt_update);
> > > > +		err = vma_check_userptr(tile, vm, op->map.vma,
> > > > pt_update);
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_REMAP:
> > > >  		if (op->remap.prev)
> > > > -			err = vma_check_userptr(vm, op-
> > > > >remap.prev,
> > > > pt_update);
> > > > +			err = vma_check_userptr(tile, vm, op-
> > > > > remap.prev,
> > > > +						pt_update);
> > > >  		if (!err && op->remap.next)
> > > > -			err = vma_check_userptr(vm, op-
> > > > >remap.next,
> > > > pt_update);
> > > > +			err = vma_check_userptr(tile, vm, op-
> > > > > remap.next,
> > > > +						pt_update);
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_UNMAP:
> > > >  		break;
> > > >  	case DRM_GPUVA_OP_PREFETCH:
> > > > -		err = vma_check_userptr(vm, gpuva_to_vma(op-
> > > > > base.prefetch.va),
> > > > +		err = vma_check_userptr(tile, vm,
> > > > +					gpuva_to_vma(op-
> > > > > base.prefetch.va),
> > > >  					pt_update);
> > > >  		break;
> > > >  	default:
> > > > @@ -1301,7 +1336,8 @@ static int xe_pt_userptr_pre_commit(struct
> > > > xe_migrate_pt_update *pt_update)
> > > >  	down_read(&vm->userptr.notifier_lock);
> > > >  
> > > >  	list_for_each_entry(op, &vops->list, link) {
> > > > -		err = op_check_userptr(vm, op, pt_update_ops);
> > > > +		err = op_check_userptr(&vm->xe->tiles[pt_update-
> > > > > tile_id],
> > > > +				       vm, op, pt_update_ops);
> > > >  		if (err) {
> > > >  			up_read(&vm->userptr.notifier_lock);
> > > >  			break;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > index 384cc04de719..0f9b7650cd6f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > @@ -29,7 +29,6 @@ struct xe_pt {
> > > >  	struct xe_bo *bo;
> > > >  	unsigned int level;
> > > >  	unsigned int num_live;
> > > > -	bool rebind;
> > > >  	bool is_compact;
> > > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> > > >  	/** addr: Virtual address start address of the PT. */
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index ea2e287e6526..f90e5c92010c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > >  	}
> > > >  
> > > > -	up_write(&vm->userptr.notifier_lock);
> > > > -
> > > >  	/*
> > > >  	 * Preempt fences turn into schedule disables, pipeline
> > > > these.
> > > >  	 * Note that even in fault mode, we need to wait for
> > > > binds
> > > > and
> > > > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		XE_WARN_ON(err);
> > > >  	}
> > > >  
> > > > +	up_write(&vm->userptr.notifier_lock);
> > > > +
> > > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > > >  
> > > >  	return true;
> > > 
> 
