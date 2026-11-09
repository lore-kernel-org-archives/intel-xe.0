Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E3606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 22:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwZR46Oq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3810E116;
	Mon,  9 Nov 2026 22:18:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01EF10E116
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 22:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794262713; x=1825798713;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/DsQA/+C5wEOwZia84r2+RBzPTGEf/WzNToIPL3jv00=;
 b=cwZR46OqAe3MJPwjOLVFCX8NbBYIgzM3XHi/jh09HdGlT+JhA3aHYJLi
 q0UvmYcXfzhtNl6nO1yBZJe7f4Qx4pThSbhVcIXsnU9/7AlPOZWj9gScm
 njKl3yB/a0+niOZaYfeu0ld2Mkrp3/Ry01s+4NVF9LZYDwCW6ww9Bby2L
 3gOFqvlI+qA4Q7zvmpBiFIoRV2zNY14Zc3qTtjdd71/F8H9u8NpojZ/GO
 IcpOOjRy2ETUchuOa9/eN8qvw8vPK036SQea+7mWHnB3u/3J69doEiCqx
 6Ylum7j9BDl1vwjehOrevAaCIT0X+4dDIL5eHwDcY1+GMEkjkcX++4K9g g==;
X-CSE-ConnectionGUID: 9UfWsuRQRKKR8rG2yxNv8g==
X-CSE-MsgGUID: cnApKtUATjOtMmPVGHD1uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2878762"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2878762"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:17:56 -0800
X-CSE-ConnectionGUID: 09xHLScFSMyVRJ16YIs/Nw==
X-CSE-MsgGUID: nqwDTsUYTqK5nXKvPLK7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8293349"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 14:17:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:17:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 14:17:55 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 14:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMnpI9PjlHHP2alMDwlTjP4Oet6cIBBq/nHMWQlRclHk63QQWk+Hdv8rURzgX9OyLqYj7gbKtAXq9C7IBAwKRYr0gCMItDJNwuLGVbfTcXzVXGpdmdJp1AIyMrA1jklQyp+qjjuliZxK2IsJYU7SYfWP0s6i+fyVsXvwVolMeEZIB6Iq/dQb+6xIW2eNOQr7jvUTYiVNiRYkE9Xn2h4kKLcZjT5Jf5vNKdaHATcJbeLryK9Eyor29+6Btz4HMZPIOTZgxmqoLuSN3lrhjCdvv6qOL+t2iZ0lC4jblAUGaBMSlKTPBCujb9xQxaYcI8pRXdEu5kDtTxIxvpnjvq8hTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfwjaBmcLfp0WoQIaRJ7AzfwSu7vGB5prkVxou85OtY=;
 b=g5s+ka/DnKqWQVpukQ/CCiDkS+1YNRY/HvHHIf0xoJq2dpCQpHy3JEOOd02YthbACnUAG+I2aVTeSz3gJ5ZOd0iTDKzSKa9+vwGJ5yMoWasij/O9M5mEiciXC0MsM4wwoIj1DdBbnMdDtS+7ImWqszugmcWodVnrHnTkM5d4AV9tS5DA1t42IW7VrwSsdZJs8pNqoKA3mXP48517am2fJvfhcLFrohhCfFCcj73aM3TVzVOmN/AnO/8Dm76C6MlYf5GysTlsWl/98MwQLW0buMvA3RvrdGjNrL3m6oJZXy3cuDFaWrDpYkGSUqP+Le6eXi2lZJgxDyIO5T3xnMN1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CY8PR11MB7058.namprd11.prod.outlook.com
 (2603:10b6:930:52::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 22:17:53 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 22:17:53 +0000
Date: Mon, 9 Nov 2026 14:17:50 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, "Tangudu, Tilak Tirumalesh"
 <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH v2 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
Message-ID: <20261109221750.GA11724@msatwood-mobl>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-4-919fa1c27070@intel.com>
 <auiFQzhrWnqYnoNE@bvivekan-mobl1> <875wyeqa8r.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875wyeqa8r.fsf@intel.com>
X-ClientProxiedBy: MW3PR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:303:2a::13) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: a63446e9-e26c-46b8-6e03-08df3eaf4c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|260925021911599003|260925022911599003|260925021311599003|11063799006|261021121427099003|261021123027099003|261009223027099003|261022105027099003|56012099006|261026140227099003|261026121527099003|261102123227099003|4143699003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: NYZBiXsEpnr/bUwKHX+5Me7fwFprfDiUrRTv5Y4oz9WPNOFXkSU8McNzCt9//5XBbLGaP6T7moYZcDVKO0oOXYZsSz8boYU/FSqdC/db9z3wTLRZBDt1sYa4fSPxQjBFskwONMzmU2E1D21Xx9qcypXtOrcC6xw1i/f5QdqhvMiPyEIyFFLc9YQBUaqiARhLgibMSn7PSwDc9NLmPRbTUQPzqDWfJT4vfM6yx/o/rr73raRMCyb/hempPAJd5oHev4sUX6pfba3MCPvfWIbB5AQz/b4SluyxXLw+6XEu7a7ai7nFw76OmUsT2tG6EN/jYHc73F9bucgfwMI3XyNnq229qo8badpIYcLohSOkIerotkvDssCdfYyQzLeKSrwNPoePLjwM4X2GPOKH6OvF82ZHZMYSz2PRrsPXEkxtrLjrl7HsAz7vYAfLhOispebu+VjIxje46B42wtsdw+EIMGviU2ExfUaqSEnwE3jr6LLgO2nDrwAIywOTGEhSv6ipl9l2v33DdQKLaR4OE9cEMynYAfjF1Czogh6ERDXT2NyAz0vmB/mn74citaJu1rEVKnIXO3F4uWV72fIRSuT3UKeHXbKRwTXJHTnXQr1Xwlv4Xbygp14TWdD5Gxe4XXc3c2D2GM/NA+HvF6PUBOKIaMLgmJyGgwsHevmTTiby/II=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003)(261026121527099003)(261102123227099003)(4143699003)(261028144727099003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HJ6rV7x/rq7qV1zyaLvH9cZj+r0rJK3E5hQlTf5P3XYZzE7NKcOb6RdY+qBw?=
 =?us-ascii?Q?HPquSHqKv+X3wQWpOikSxEJM2KXABcnQMKoWWJWG4XxhUZdlF+oJ0ebikSz2?=
 =?us-ascii?Q?+ZzNUmJAmXkAscuGaumGO87Yv884kugcdhEIqfSMuyCdcf63ifEmCtQUqc6y?=
 =?us-ascii?Q?meGnc7twJPccGRHOcZedqfd6KjDxjd5+c89+YjubPQ3e0qkbZC8V7Ig1WP+W?=
 =?us-ascii?Q?pgSAGsuhFPLRgTlJyTicsrlegbjvHRbeiIY729PBEudv5EYw3RZWBA2QngVX?=
 =?us-ascii?Q?CIZijaJKN3DEdF1DQ4FoqH6e00QbZX1G/4g1ULoQVQ4f7YMij6zBJ2O8KbEW?=
 =?us-ascii?Q?fIerzmR4QIvX93BFkL9I5crpICQfLBvhpW936Q/aUhwDEhzXmUhWWJk33kI7?=
 =?us-ascii?Q?PgEZnF1hVil6/hQRe6TWup9qxHEz9iXN3hEroN+x9aPlpePC8FAjnXLjVNk+?=
 =?us-ascii?Q?Ivr0tu0mxyOxUT1NwxcdTBnJKOwGiERLmJi29qy6e5GLGXgoyQMksSgT69qv?=
 =?us-ascii?Q?Ralk/vJWngtXlNuaEyYuvkJv5IF03+AvpK5MQlLhlBRp94X2+z3IxBmXFToR?=
 =?us-ascii?Q?hGBfskhB2a9D88A+lirJRwwBKk4HSXu0kEz8GLIxDPaKD9Y6uNEH7im8I4Sj?=
 =?us-ascii?Q?3G0xObc8bEGirWVLnRTcf73Rtna0qOUnFyTSrQSeee8R7jrLlfDh8tdQ322f?=
 =?us-ascii?Q?HFormbeIEYyWI4KQ8MzM4fcCAcRe6HBJaUjOd5/ke3dc0AXwjxWfD922Akv2?=
 =?us-ascii?Q?JHGgQJzu7W6mciJwFCeOYb5W7PU48iMjvVBiIDRtgY1USr2WJB9Q73zkIcnU?=
 =?us-ascii?Q?8SEX4vUgkyiQnvKW3o1LtbteC5iEMp143u1bi/Z4vZQZ9qaE9K/1Re3Qgj25?=
 =?us-ascii?Q?1hsPqAx2KjJdeMszeV+tmCC/cHh4SmVCxY/7FJVYma5c/HDgK551sYT5sYRF?=
 =?us-ascii?Q?8RD6s0sZ9wq8zFgIzT296DDwYnBR62FSd5eeftJtMb1f+1ShVpPy95k6yynO?=
 =?us-ascii?Q?KnLICA0b/B5HOXHo+j8Dd8rBDbx55z9Qi82kTnpRF1nM+RHq8Fba53W+D7+i?=
 =?us-ascii?Q?kGfbzp73f2NeAcJMRnFTHeq9UTBJTk7Yn6g0zKfhzUnTD2zH3bZKirb4Tpsj?=
 =?us-ascii?Q?YOEhlUjqdTqZjlwUUSqd86p0Hyj4K0NO8pF5xI8NVTldQaNBTPihPDtlsDSJ?=
 =?us-ascii?Q?j0GltK5EOoqTDZiSanQ0Y78BCDGhll5BQL3Q7VtFCLgQungYwdC9dv+h5+j0?=
 =?us-ascii?Q?TNohGmSXCg9O07iwjUIRBt7jAr/qrfm6QxXX1il4LESz+1Izo4gDUboIh1lg?=
 =?us-ascii?Q?cViyigjaj8sUhKk2tsoENdBO4NxHbhQ4OSB1Wqfexo2lWUOVV3hE7lvubMR+?=
 =?us-ascii?Q?GUzuEdXzWczhWl8AhagC7/qWY+Jee34Q1Y1gGtd2YFgNT6qNRzj7LYYkmV7v?=
 =?us-ascii?Q?fHQY5zJbOJPePQDqnCarENZc06iwO3p0wNH9mFE0ADM+nZcmWoqy0Q6ga44N?=
 =?us-ascii?Q?+w8jO1OWV0m7JEDqPEQh2Jys7/kgFlciYTCVMy+Ni0KVaGYNPCY3Rk4F0kjw?=
 =?us-ascii?Q?WMWb7ePTwnJxHIcMPFONIfRzIz/EmsE4DYEeWR9VFW10eqFeKn3BpWbsWgAy?=
 =?us-ascii?Q?pFVNP4ZJrnOOQvu+6bW+u1utvSNflXlhDbNcI5eBrxjh7BtFm76zzTmxV1Vb?=
 =?us-ascii?Q?OfT+R2+wvckNL/QmGiNo0Xx4FMblDmCWmeILo8o+po0/G7mkLUfuUj3/xrR/?=
 =?us-ascii?Q?XXe1hFrIHFbAWHprZCqttPYTnsGnCHI=3D?=
X-Exchange-RoutingPolicyChecked: Jf3MCHQVewUz+P11ADSN9A3vxBOXVc/ivlExVMXgBuJWRxfXqOOMVpypwwAvHgpYIahwv+tuyvbLh4R0NPhI3zuhIk17OeOTPGjktxstRi/Y34H/AR685Yh9zQlWWlu/6lEzrt4yk9uC9Ev3t/LAQSPlBgf4bRthXQsbl/Y7KJyyOzqgJGks5mM4TU5LRHz/85alar9jbXTUy5OHZbl4qmD+cQDPLuOHkMEOWPEMhzaDq4Z26Bv1zQIu1wKm6XFEQekavjZCTO2WwmaSDNVoQCCXWE5i6LCtznqTwUOl3mKMgZbHeIdFlo5fOW/TOSQ0c+hhtHLwzkGRRWl3AimZ+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a63446e9-e26c-46b8-6e03-08df3eaf4c47
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 22:17:53.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uh9aXZaBwLTss2PwFODxGnEXkLGYLiCnkSe1psSaoGUQNaO/IIfrp0LgzDx2xJ8grvfcsIDbxBiTi6BF2Jnc5eNxL1JSneBM6t6UzbCXNQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:07:32AM -0300, Gustavo Sousa wrote:
> "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
> writes:
> 
> > On 30.10.2026 19:57, Gustavo Sousa wrote:
> >> The function adjust_idledly() currently does the following adjustments
> >> to the IDLEDLY register:
> >> 
> >> - Wa_14025941587 defines a minimum value for the idle delay.
> >> 
> >> - Wa_16023105232 defines a maximum value for the idle delay and also
> >>   unsets INHIBIT_SWITCH_UNTIL_PREEMPTED.
> >> 
> >> We have an upcoming workaround that will also define a minimum idle
> >> delay.
> >> 
> >> Let's reorganize the logic in adjust_idledly() in a way to make it
> >> easier to reason about and also easier to extend.
> >> 
> >> Do that by having the workaround-specific logic only responsible for
> >> defining min_idledly_ps or max_idledly_ps, and then keeping the logic of
> >> how to apply them to the register field (with the right rounding up or
> >> down) separate.
> >> 
> >> This separation drops the helper function idledly_floor_ticks(), the
> >> clamped_below_maxcnt variable, and the extra quantization check,
> >> arguably making the code easier to follow.
I agree with Gustavo here.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> >> 
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_hw_engine.c | 100 ++++++++++++++++----------------------
> >>  1 file changed, 41 insertions(+), 59 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> index eb99284af3cc..01a7baf061eb 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> @@ -596,99 +596,81 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >>  	xe_reg_whitelist_process_engine(hwe);
> >>  }
> >>  
> >> -static u32 idledly_floor_ticks(u64 idledly_ps, u64 idledly_units_ps)
> >> -{
> >> -	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
> >> -}
> >> -
> >>  static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  {
> >>  	struct xe_gt *gt = hwe->gt;
> >> -	u32 idledly_reg_val, maxcnt_reg_val;
> >> +	u32 idledly_reg_val;
> >> +	u32 idledly;
> >>  	u64 idledly_units_ps = 8 * gt->info.timestamp_base;
> >> -	u64 maxcnt_units_ps = 640000;
> >>  	u64 idledly_ps, idledly_hw_ps;
> >> -	u64 maxcnt_ps;
> >> +	u64 min_idledly_ps = 0;
> >> +	u64 max_idledly_ps = -1;
> >>  	bool inhibit_switch = false;
> >>  	bool wa_applied = false;
> >> -	bool clamped_below_maxcnt = false;
> >>  
> >>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >>  		return;
> >>  
> >>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> >> -		u32 mincnt_idledly_ps = 5000000;
> >> -
> >>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
> >>  		if (!idledly_units_ps)
> >>  			return;
> >>  
> >>  		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >>  		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> -		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
> >> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >> +		idledly_ps = idledly * idledly_units_ps;
> >>  		idledly_hw_ps = idledly_ps;
> >>  
> >> -		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >> -		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
> >> -
> >> -		/*
> >> -		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> >> -		 * priority if the two ever conflict (not expected in practice).
> >> -		 */
> >> -		if (XE_GT_WA(gt, 14025941587) &&
> >> -		    idledly_ps < mincnt_idledly_ps) {
> >> -			idledly_ps = mincnt_idledly_ps;
> >> -			wa_applied = true;
> >> -		}
> >> +		if (XE_GT_WA(gt, 14025941587))
> >> +			min_idledly_ps = max(min_idledly_ps, 5000000);
> >
> > There is no need of check, we can directly assign 5000000.
> 
> You are right, but still I would prefer this approach as a standard way
> of setting min_idledly_ps.  It makes it easier to add new minimum values
> before or after this "if" statement.  This also makes it easy to
> move/drop this statement in the future if needed.
> 
> --
> Gustavo Sousa
> 
> >
> > + Tilak
> >
> > Regards,
> > Bala
> >
> >>  
> >>  		if (XE_GT_WA(gt, 16023105232)) {
> >> +			u64 maxcnt_units_ps = 640000;
> >> +			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >> +
> >> +			max_idledly_ps = min_t(u64,
> >> +					       max_idledly_ps,
> >> +					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> >> +
> >>  			/* Clear the inhibit switch without disturbing a valid delay. */
> >>  			if (inhibit_switch) {
> >>  				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >>  				wa_applied = true;
> >>  			}
> >> +		}
> >>  
> >> -			/* Warn only on the value read from hardware. */
> >> -			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
> >> +		/*
> >> +		 * min_idledly_ps is applied before max_idledly_ps, which takes
> >> +		 * priority if the two ever conflict (not expected in practice).
> >> +		 */
> >> +		if (idledly_ps < min_idledly_ps) {
> >> +			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> >> +			idledly_ps = idledly * idledly_units_ps;
> >> +			wa_applied = true;
> >> +		}
> >>  
> >> -			if (idledly_ps >= maxcnt_ps) {
> >> -				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> >> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> >> -				clamped_below_maxcnt = true;
> >> -				wa_applied = true;
> >> +		if (idledly_ps >= max_idledly_ps) {
> >> +			if (max_idledly_ps) {
> >> +				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> >> +				idledly_ps = idledly * idledly_units_ps;
> >> +			} else {
> >> +				idledly = 0;
> >> +				idledly_ps = 0;
> >>  			}
> >> +
> >> +			wa_applied = true;
> >>  		}
> >>  
> >> -		if (wa_applied) {
> >> -			u32 idledly_ticks;
> >> -
> >> -			/*
> >> -			 * Wa_16023105232 requires idledly < maxcnt, so floor
> >> -			 * that clamp; otherwise round up to guarantee the
> >> -			 * Wa_14025941587 minimum survives tick quantization.
> >> -			 */
> >> -			if (clamped_below_maxcnt)
> >> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
> >> -			else
> >> -				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
> >> -
> >> -			/*
> >> -			 * Tick quantization can still push the rounded-up value
> >> -			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
> >> -			 * priority even in that case.
> >> -			 */
> >> -			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
> >> -			    idledly_ticks * idledly_units_ps >= maxcnt_ps) {
> >> -				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
> >> -					  hwe->name, idledly_ticks, maxcnt_ps);
> >> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> >> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
> >> -			}
> >> +		/* Warn only if the value read from *hardware* exceeds the maximum. */
> >> +		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
> >>  
> >> +		if (wa_applied) {
> >>  			idledly_reg_val &= ~IDLE_DELAY;
> >> -			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> >> -			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
> >> -				  hwe->name, idledly_ps, maxcnt_ps,
> >> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
> >> +
> >> +			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> >> +				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> >>  				  !!inhibit_switch, gt->info.timestamp_base);
> >>  			xe_mmio_write32(&gt->mmio,
> >>  					RING_IDLEDLY(hwe->mmio_base),
> >> 
> >> -- 
> >> 2.56.0
> >> 
