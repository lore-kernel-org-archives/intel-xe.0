Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50326606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DLeTzBfv;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fMhpKhhZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBD10E043;
	Wed, 25 Nov 2026 21:20:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBE310E043
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795641595; x=1827177595;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wC5EK5taeNmV7hplz3ZpIj3Dp6285nHocp3wpM76tOo=;
 b=DLeTzBfv1sg4CLMyFogc+DrHRg9W/rn1+gojUEkgwgx0pr3SNEQe6Q1y
 oznzYbpY2pOC2q1hDF4Kr1xaIFbmMIwaeAlbiP3KnPbZ3CUuCtq/6YYcc
 sSC1sp4duIVsbf/RsF37oBxK8HjugbaxxxPSm3fSnRzwF/MLgY1J89IxM
 SPqLTzKMASqf7OuPcZAgs8wU9vHOkyMcZvYkfp4SPUevjeLjRYYYeKprT
 WHHeyswQXum4NxepmXx577ZrT2kMeburQtlwvoPPVHtNp0OxWIRcqHLFE
 t3dxh90UgaX3L45AO5DUk53WrS7zfFoMr4WMvHo65cJYAk9Pcy2mq975m w==;
X-CSE-ConnectionGUID: MrApZu0uQTucLXFO1NvdVw==
X-CSE-MsgGUID: 5ZyWJDLRQraCtDI4Almiag==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4550619"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4550619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 13:19:54 -0800
X-CSE-ConnectionGUID: PXjT8efcSl6CPaNsqEBSIQ==
X-CSE-MsgGUID: tpCZJAAXQf+hguknZgFPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12298289"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 13:19:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 13:19:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 13:19:41 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 13:19:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mv4L2jslpbMZvjWycKSMeUphYkOPaf3woxz5AgpRL6kontyGDqpzjWPD6OPS79sb8fmc2WDnOIRE36W69+4Tb0i6a0ot/qDkcDhi1gYka5zucR4PWM+9aeVkyRs9SKqel8Y3Dy5N1xWZ3uyT6jfdhiwY53Y5QSORdGh89uJl7fOD516rPVR4TvNo/ceVGIHoJ0BsAvpsYtew0fEKK98Sph3wkI4JObrKjCX0fgGnDLSKe6MNbjX6yME2GR79l8qwSHz5XJnAumOb17YFxJ7Dw1eaUKAPo9Vtbj3/QFR+FuuEmbejZ56ZAf0srs4fJQ1+P3u09Pcpv5pWPMWDshPIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE6hNmpqzxmie3755bgBlvspcvXMfgfSwB2aVilJtig=;
 b=xRTiR2sMhjBnU5awDL78i0OEuod8sxatDlLOhHe9kKSmbAxZO8KHd842CpguDoGfNKAwYuAXjq3YO/DYRq6P2La+uxblk0E57pu7J5ccUG9g9ws2js8aGgnuOlC6n99v/gCZAvrymTK7Nhd/7cxL9F0wwucw1h2vAEXXZHmrqHRm0UPdxNsvNKb3Po+FxrXaEY9EecipKe2PycUc9ijN44aFO9bafc9qCFweKug5rmkHBIipCBINoF96ym3Br4lDOWUrAH0u+kfrrOAunyg5mQvda45Zf3S6rMgTSns1sdTTGVbIKjoTpIE8rwqClK0PhG5LtY4C2rLYE0VaxbpLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lE6hNmpqzxmie3755bgBlvspcvXMfgfSwB2aVilJtig=;
 b=fMhpKhhZoIDKMKqKpMXWQSBPPm6zbd8HSmiH/YLpO9jo83o2EW7eI7ZMnYz5h4UCVBdTYyEn9bhI0m66dW576EznBh4xEO1a0Degml3UcDOHQHB9VwOcXCHl6PsBpjw/oKxW+enYfk8rG4SZAOpSYxDqh/H5u8ZmeqsKrKjirhc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by MW4PR11MB7078.namprd11.prod.outlook.com (2603:10b6:303:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 21:19:37 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 21:19:37 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <tejas.upadhyay@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe3p_lpg: Implement Wa_14028597154
In-Reply-To: <20261124130657.800225-5-varun.gupta@intel.com>
References: <20261124130657.800225-4-varun.gupta@intel.com>
 <20261124130657.800225-5-varun.gupta@intel.com>
Date: Wed, 25 Nov 2026 18:19:33 -0300
Message-ID: <878q2ga9sq.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|MW4PR11MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: d94b45ec-45b4-4a2a-3423-08df4b39cf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261009223027099003|18002099003|22082099003|3023799007|260925021311599003|4143699003|56012099006|260925022911599003|11063799006|261022115727099003|261028144727099003|261102123227099003|261026121527099003|261021130227099003|261021123027099003|261021121427099003|261022075727099003|261022113327099003|261026140227099003|261022105027099003|260925021911599003|10067099003;
X-Microsoft-Antispam-Message-Info: d8+8tS19T2oOAfTjnftFEUbqgoAb/D65rQpx7L3m8KkvPndYu4sJ61Qk8lER7S0ioinGRyLkXHXGWMLMj3NDLS39EJT5IiPc4EGRhYBET1GCgnqYVwQ5I42ULBIbcPPEDx32uvl7hyOSbvhpwI04LwbLb2tFVl/CDVQFJd18HAz/nPgN45w9rWBfHlZu6VnvRVp/xBY1XuXhFwtJTYi/w7kfJu2U+oU8KTUhwDgb7ejUPepsPJ67inlp4nbt+NhPFlG+TvVR2We+4o2Usb+NGvb1f1i9q7D7N3rlBQsgxu2/KLUk1dFuCT93WbA91z1teg0B2eFrlqE8JLiJIOABnEL/bhgdJTbcNebc44IxaXQkRiBdDEcWMCSLCfUSW/BaHxi1ZA5d3Goc9+aFTEgJwFEhPjzxVhuZIq+Dr2ArNTyTnIQxraV3ddTFmuP2jMSkXqGpu6OquseatPLPh4/XWS8aLdNASWMf3O54cNbLyXtKZhmSJNq4SptNW6MOBKevq4OabuC636+TrFdba86RTYGrEQcA5Ku1lidYYSRp90O1bAXzK9BB5wkikaVTSTurZpoBHwaaU6Xg2/CWimLUibdCF99dNH0nL1aMxG67z+EY3FjhtMT7+4CpACia030XlrF19RcJWXW+Jdrs2U9R41NYdiornHN4NyCgmOX6Qhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(3023799007)(260925021311599003)(4143699003)(56012099006)(260925022911599003)(11063799006)(261022115727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022113327099003)(261026140227099003)(261022105027099003)(260925021911599003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqq75n4QzrGXg1YMTZuyflqVC25gQ/Iz4yBBS8+0fqzyIzJ+VCe0gzwJOOmJ?=
 =?us-ascii?Q?9ORTPP0xnzm5ZavN97Dn5uYsIQ9bczz+MFjBx0qstnnUBcCqaWn11DYKaCPu?=
 =?us-ascii?Q?1LUKDesGdSXYe9tv0bbF/AOMqZrekpFg1sL66BVL9LpJdd6qqIfV1STPtKOg?=
 =?us-ascii?Q?05dp4bjtREBUoWqLSN5n60aBlM11wx7h1sRbhJ6Uo2scr1yodKq4bkS7pV9J?=
 =?us-ascii?Q?P1KMDdIIz2ZdLcfy4wFQ2k+F2Qv6ZaSL6qW0y/g6tenb6/TkbdIE6Zjo+SCm?=
 =?us-ascii?Q?c+VYZCFzX+bUFiWYDiVWYYTjsCC+gtHd4WaVCXHfpZgj6uPNYz20IhrnGO/d?=
 =?us-ascii?Q?EE4NnELKfWnBiiNSR8uSFaQxDmV+l3kFmjwTXiy3RKUZrjtoaY/uNU45vz0i?=
 =?us-ascii?Q?MI/PoGG6JyBI8D1SctYgxnQvlj6yw2ZPU8kLse7lx3NUmYYgwwPtb/TJbez8?=
 =?us-ascii?Q?m2QlHS0uDGRlkFflPS6EO5Kg6oA9TKfG/ttoG9bQhCLbLf9cP0QoZ3BdzIAi?=
 =?us-ascii?Q?33DnHMeu84+LvCJI68mdQm1Y0+8IEApXDMWxmXyvYgRWXjkmLqWorDvqKLnS?=
 =?us-ascii?Q?kH2b1HDfl9n0IRmNIOfWVyK2udPBNUQdzSHmYsFXt/0czW1zV3O8r/SmhzA6?=
 =?us-ascii?Q?UkIA2qBqBERa6Vj2TJ9luRzZuJOyNrtaSKEyruy7er/qLuZn1RA69+KzzAau?=
 =?us-ascii?Q?UxRwaXvz8inUgJOXW0ZCyoiEedmq9cVFNVKbG6/osN1wq/KWhllmH7+kHIHs?=
 =?us-ascii?Q?GqHipliG2AyK57HJcowy51HfgN9LCnGSN9GaHIqIEejd/C6AM09hrJF8+RST?=
 =?us-ascii?Q?eZANbi3EXPPqlJHA1XHoaBeVih2CDBG/MVYlVB+RzBnt/vBufEF+TSex07Mj?=
 =?us-ascii?Q?uKb2Mfmxevdgyub5PIxo4LWGiq18QIvGilidURBMg1YAs3RN/q+YePrYd354?=
 =?us-ascii?Q?B7oDfDb6JogN48eTzIEkz/GI9mKtU97GOawbZR5ytXzNf6JqXZCylIl1usGU?=
 =?us-ascii?Q?W9yIwLDweK+wRh4bDHml9eFNo2NJZ4B2ikvmidsg0BfeFZX60C4AshOWUsRW?=
 =?us-ascii?Q?DO6ak4RnR0kCYi9DKnZbn43Pk/Ha1mI9pXbDIX8HtY7C716o20HUhvMy07rO?=
 =?us-ascii?Q?eWnJqEQvHuKbQGcogHeqGp2d9eUBwrJlLlNl6754AWLgd1xWQjxoBjcmKEac?=
 =?us-ascii?Q?K1vMFEnJ/lzGoKlG8Cvc47iLhbWYidBV0Pn/4RL0BKIhtwQWpLe9sigp8rmX?=
 =?us-ascii?Q?VnS0WqqEgvUATHLSamBX3/fQ2dQ5jZ4zkO8oDXbesPaGn2+tHACQA5XB7M9Z?=
 =?us-ascii?Q?x6msgjdzuuwQBs47Raj3n7NwRaCeHGUVY83Zzg7K0RdNS8m7MTu32Sso0A3N?=
 =?us-ascii?Q?B1CfQX0mr7+gCobQGwMly3gH8UMPNsodDu4bjabqssFuL6yldigLuXJ0rzR/?=
 =?us-ascii?Q?3seSz/NB3inDO4YoE8ZlqYUnOVOJpfip3kiQ/85ivgWkoNsjJWjdZPYEaZRF?=
 =?us-ascii?Q?UH8HSv/ioYn+p7LTvLAK71MueD5q2ywc0xnVKoPn4AkH19VDCdIBDUZmtSSy?=
 =?us-ascii?Q?dAArKJw3pP/NQvVuQ+8i9wRw2mudKQXRTB++M73qkGzo6lcy92dNOBe70VSd?=
 =?us-ascii?Q?+P/F7isciIXdeKYjAjppBejiXpc3jEf+bj8NIUcGfHSb83AWSUGyYCu5Ku6D?=
 =?us-ascii?Q?TLjE70r0Q4S3qKs+Ud+FxHXL52A+ULUI/ciLXo6/ZpkpZRIKuLi5/dNVQZzX?=
 =?us-ascii?Q?8MTccgK7Tg=3D=3D?=
X-Exchange-RoutingPolicyChecked: HutF+4xT3YQDxj4B14jAMQyMmJH1m1oJWPOK9ZB/iCWcgtXztuv45s+f9EF12jWqxRU+PHb+SIQIz6j3yCThaWKAmOCmEtwLySY3PB6wLsO93RabM8enMngiBm8JOu4j2pKSe71pmA1G0wO+ZhFLUFZRGj1ftzlNJyVztim0AEnNLrW24InQgB4hK2ldBsSs/YM3/7/usPxK+GL8QjGTk8FaauZdFbdocuAeFDhbqPfq80zUT9D+QFOQb8awaLFWXwZfoijorZAQGIf0SYxHoNGlvAkCjXCP07CQIOUYiNnQl+D1vEpFsxURKEJEyVfs42SjrIXisqJ5m7BsYEgeYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d94b45ec-45b4-4a2a-3423-08df4b39cf46
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 21:19:37.6884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HPq1lsV99rXN5Eev8GR4mR0vEaFykfiQul4MybnVRRP7hCwsW1Jqyzky6IVysmEQPbTl2f/CkP2Xs2qSDnG9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7078
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

Varun Gupta <varun.gupta@intel.com> writes:

> On graphics version 35.10, when multi-queue is enabled, CS can compute a
> wrong address for the semaphore token it writes on a queue switch: the
> intended GGTT address shifted right by 10 bits. Those writes land in the
> low 4MB of GGTT, below the WOPCM-sized range the driver allocates from
> and never maps, causing GGTT faults and CAT errors.
>
> Since the tokens are also lost/overwritten by other aspects of the bug,
> there is no need to preserve these writes, only to make them harmless.
> Back the low-4MB PTEs reachable from [ggtt->start, ggtt->start +
> ggtt->size) plus one trailing spill page with a dedicated device-managed
> dummy page on native and PF, and restore these low-4MB PTEs on suspend,
> FLR, and D3cold resume since they are not covered by pinned BO restore.
> The existing GGTT scratch page is left untouched (it is not allocated on
> multi-queue GTs), so stale translations in the allocatable range keep
> faulting.
>
> SR-IOV VF support is deferred to a follow-up once PF/VF ABI negotiation
> is in place.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     |  3 +
>  drivers/gpu/drm/xe/xe_ggtt.c       | 90 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ggtt.h       |  1 +
>  drivers/gpu/drm/xe/xe_pm.c         |  3 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  5 files changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index eafc66d686e2..b02610d2cfe1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1510,6 +1510,9 @@ int xe_device_resume(struct xe_device *xe, bool flr)
>  			return err;
>  	}
>  
> +	for_each_tile(tile, xe, id)
> +		xe_ggtt_resume(tile->mem.ggtt);
> +
>  	xe_i2c_pm_resume(xe, true);
>  
>  	xe_sysctrl_pm_resume(xe);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 86fc3d186fc8..eca9c085ddb9 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -130,6 +130,8 @@ struct xe_ggtt {
>  	unsigned int flags;
>  	/** @scratch: Internal object allocation used as a scratch page */
>  	struct xe_bo *scratch;
> +	/** @low_4m_pte: PTE backing GGTT [4K, 4M), 0 if unused */
> +	u64 low_4m_pte;
>  	/** @lock: Mutex lock to protect GGTT data */
>  	struct mutex lock;
>  	/**
> @@ -250,13 +252,27 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
>  	return ggtt->size;
>  }
>  
> -static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> +static void __xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
>  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +
> +	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +}
> +
> +static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> +{
>  	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
>  	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
>  
> -	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> +	__xe_ggtt_set_pte(ggtt, addr, pte);
> +}
> +
> +static void ggtt_set_low_4m_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> +{
> +	xe_tile_assert(ggtt->tile, addr >= XE_PAGE_SIZE && addr < SZ_4M);
> +	xe_tile_assert(ggtt->tile, addr < ggtt->start);
> +
> +	__xe_ggtt_set_pte(ggtt, addr, pte);
>  }
>  
>  static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
> @@ -552,6 +568,71 @@ ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>  static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>  
> +static void ggtt_restore_low_4m_locked(struct xe_ggtt *ggtt)
> +{
> +	u64 low_start = max_t(u64, ALIGN_DOWN(ggtt->start, SZ_4M) >> 10,
> +			      XE_PAGE_SIZE);
> +	u64 low_end = min_t(u64, (ALIGN(ggtt->start + ggtt->size, SZ_4M) >> 10) +
> +			    XE_PAGE_SIZE, SZ_4M);
> +	u64 addr;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	if (!ggtt->low_4m_pte)
> +		return;
> +
> +	for (addr = low_start; addr < low_end; addr += XE_PAGE_SIZE)
> +		ggtt_set_low_4m_pte(ggtt, addr, ggtt->low_4m_pte);
> +}
> +
> +/*
> + * Wa_14028597154: multi-queue CS may write semaphore tokens to (addr >> 10),
> + * i.e. into the low 4MB of GGTT, below the range we allocate from.
> + */
> +static int ggtt_map_low_4m_wa(struct xe_ggtt *ggtt)
> +{
> +	struct xe_tile *tile = ggtt->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> +	struct xe_bo *bo;
> +	u64 pte;
> +
> +	/*
> +	 * TODO: SR-IOV VF support for Wa_14028597154 requires PF/VF ABI
> +	 * negotiation so PF can assign the VF's low-4MB PTEs and VF can map
> +	 * its own dummy page.

Do we really need this negotiation? I would assume that the SRIOV
implementation for this would be making sure that pf_provision_vf_ggtt()
does what is instructed by the workaround:

  (1) Ensure the start and size of the PF GGTT node allocated for the VF
      is 4MiB aligned.

  (2) Ensure that xe_ggtt_assign() also assign the respective PTEs in
      the low 4MiB range to the VF.

In addition to that, we would also need to ensure that LRC allocation
follows the recommendations from the workaround.

Thoughts?

Cc: Piotr

> +	 */
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	if (!tile->primary_gt || !XE_GT_WA(tile->primary_gt, 14028597154) ||
> +	    !xe_gt_has_multi_queue(tile->primary_gt))
> +		return 0;
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, XE_PAGE_SIZE, XE_BO_FLAG_SYSTEM);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	pte = xe_bo_addr(bo, 0, XE_PAGE_SIZE) |
> +	      ggtt->pt_ops->pte_encode_flags(bo, pat_index);
> +
> +	guard(mutex)(&ggtt->lock);
> +	ggtt->low_4m_pte = pte;
> +	ggtt_restore_low_4m_locked(ggtt);

I think it is better to use scoped_guard() here.

--
Gustavo Sousa

> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ggtt_resume - Restore GGTT entries not covered by pinned BO restore
> + * @ggtt: the &xe_ggtt to restore
> + */
> +void xe_ggtt_resume(struct xe_ggtt *ggtt)
> +{
> +	guard(mutex)(&ggtt->lock);
> +	ggtt_restore_low_4m_locked(ggtt);
> +}
> +
>  static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  {
>  	struct drm_mm_node *hole;
> @@ -668,6 +749,11 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
>  			      xe_bo_size(ggtt->scratch));
>  	}
>  
> +	err = ggtt_map_low_4m_wa(ggtt);
> +	if (err)
> +		goto err;
> +
> +	/* Also invalidates GGTT TLBs for the low 4MB entries above */
>  	xe_ggtt_initial_clear(ggtt);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, ggtt_fini, ggtt);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 59b2f0287019..78e68c2ca3ad 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -17,6 +17,7 @@ struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
> +void xe_ggtt_resume(struct xe_ggtt *ggtt);
>  
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f73f68bd449b..6a20a6648253 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -650,6 +650,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		err = xe_bo_restore_early(xe);
>  		if (err)
>  			goto out;
> +
> +		for_each_tile(tile, xe, id)
> +			xe_ggtt_resume(tile->mem.ggtt);
>  	}
>  
>  	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 03b713f55dfb..6bae09c0b3ff 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -81,3 +81,4 @@
>  14028709524	GRAPHICS_VERSION(3510)
>  14028250015	GRAPHICS_VERSION(3510)
>  16031259911	GRAPHICS_VERSION_RANGE(3510, 3511)
> +14028597154	GRAPHICS_VERSION(3510), GRAPHICS_STEP(B0, FOREVER)
> -- 
> 2.43.0
