Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DBC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 19:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2595510E15B;
	Mon, 29 Jul 2024 19:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/VshbJg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3FF10E15B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722280610; x=1753816610;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9NMHWEIjr0mOk/4uHunUzVE5wclRiOHtVoVW5jllcZQ=;
 b=K/VshbJgAjxau8uTJI29I/caCpWVk/uNm64TSyEImCXv8inmsodvM67V
 sTUuM5jpm0xf3vDoGQ7V1PL6hZPS8LDKvNxN7nVro7RWX6Hvuh0gy3YGy
 lF6gwmfL0P7EkNCzVIbNSeFltwsgOUNsv/drFUwrCz+A81JzYkaTjVp66
 L2/x3FU3KnbmfJnQ1DVHN85JxrDEE3sG4hB/SMuhTNT/qGqNLrfk8ZlgA
 2UvsdfOfHuKAW2i14gX+ClVrVDN64V3D1R2OWyUxuqtEx3weDa9FyTPhD
 C7TBkZMLmYGR4P8HJaGcoFXsW/WATzoJUB2kK6cRmP7ERlqM3+PKZSZ9U Q==;
X-CSE-ConnectionGUID: NwmHixoSRaCpUQwr6MMbwQ==
X-CSE-MsgGUID: SuiHaWLVSgKEar0yO6RjXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19860893"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19860893"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 12:16:49 -0700
X-CSE-ConnectionGUID: SGsb2S+NQPKLPjonDw+pdw==
X-CSE-MsgGUID: zlVpIFNVQz2QMQZaZK49cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53724186"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 12:16:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 12:16:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 12:16:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 12:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsMhiBlr17rpsMvWBhCINitdPAfrZHifWf92GRmSOjx6zZQoBHKY8U9uqyRV2oqvb9jsVaJKZBLufn9W2Y7YokIoeXIrmPaSqeo4o5znjKL06fzpd6t8M7ZAnIQFPgddaEXjfJJvV3rg99AMPGRhSCHfuLmHGIgoACvY1ieIGxmI+E+uC8P0gqR1OeJzf5xuyj76R+H8Nd/ADqOLsOU4dnGt5FSH+E4eh1Eq+ycf20QeinFMaTglcVjdmAIwn56Zn1Hoy/BDLUaDCKtxumsWmcSalotMNy8t0vIxoPf1Le3mK3GasYdtD/XEAo0Yu49O1khprCe/3NHPjbDvcz2J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlPJx5bEVLRPtGp7dPGB1swSiDbyYAjpqUHKpgCdXG8=;
 b=aMkgljKjxfPghWbwqKKBrns+GTDcN/VRnrENJLipAvXkkeRitMKLJRq1A8MR8Y9K17PVDIA5SDOXMphpcpHQabuiwKNQ6dmQwgHFyVDwsSVRpVPKNUa4YJ9cjr0fEDCqQmiH2hLSoIhm5F+jQpQXMhqNvWRnzbkBCM0b0u1j44cz2x6lJlpk5ohXGOh5wbDHKTF+baRa8Csy92NL4vnWSM+91FU73hvbfs3TJUDTelEH7mtmGUbRO7uT0aKW3iOOYEazTTF51izK6ctqggZK6hVgzbbpWqKTXvd+yOKu6Ih4NlQE/1zc0rjapAY4GUxyGmNEKJ4Azqfir4l+VW2YUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 19:16:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 19:16:43 +0000
Date: Mon, 29 Jul 2024 14:16:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 08/21] drm/xe/eudebug: hw enablement for eudebug
Message-ID: <kglowukspj3merqbopdb7qz7tmrzgy5o55xxdioxtq2sdzbtcr@q32wfve577ch>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-9-mika.kuoppala@linux.intel.com>
 <icykmctrrffrulnbf6tnvb2jxnsasejdkk3zxxysizdqn3fsok@qrfh2iyol2ii>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <icykmctrrffrulnbf6tnvb2jxnsasejdkk3zxxysizdqn3fsok@qrfh2iyol2ii>
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3ff75e-6383-4625-1722-08dcb002fb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hlN9dsAfM8xfGeCzE386nbPlpFsXd97DIXl0h1AsBqMv7w0DXwDqDUctbUiO?=
 =?us-ascii?Q?l4vlSIr/mUvH8ob4zCmuqfCffYNiaOrePCdWSeVjj2aRYDxeUDS0sk5Nq7W2?=
 =?us-ascii?Q?eTF1r5HCEStTvBW+sQus2AVolHsfqZcb6Nn9MbACpYBuNsdMws+4MdLl8VA5?=
 =?us-ascii?Q?RY8LB1/b2uOC5ryOPwk1DzSKzRwWexn45HRbInmQ67SBsWGFwJclyaIDx9ef?=
 =?us-ascii?Q?Ul0HGkJJ2Pt0WmJUiN28NGLaN9cxeYslw/O6WLMghL2r2fP70qEgbCEmFy2u?=
 =?us-ascii?Q?BSmgy113YLZrj5jvQVeq1R8SvQVoN1RZWDhUqB1P4b3tNoEBG7FF14kPMQ7U?=
 =?us-ascii?Q?/8PsHpMwn+a/AbskSSKtJ/ICUZ16jd8xQAn1JzwxWWRptGSfGx6pqost0jZH?=
 =?us-ascii?Q?baKk87t3OKYuHLHgjgXmX70CZXBACaYIp0elhR0DJoq2NPH5G0WXvpSprshu?=
 =?us-ascii?Q?z6rmr8eahk0TpX82orjxIf7xUBMLl0CC9Ogs8VeFi/Ri8u+Go0HW50RRm9F7?=
 =?us-ascii?Q?ntHzlCANzHKcG0Qq7Gid7Noj4XWmYGuioVS09gvEvkWsWlbgGaDi99ezM281?=
 =?us-ascii?Q?6hiu56hMovm1eY7agZoHfElTte4CTGV7BS8CVYWGlXlmTzdGCjh5p7B2kv6n?=
 =?us-ascii?Q?QPTlaQdX0fPvfopC+H94t7EhFE+NM/mKceiB7wFkoxRP/x1nLUu5MzwFXrQN?=
 =?us-ascii?Q?G7ne4vlhQmLbI86xtpeCRlnoH4voqgqOhYoSRqWpnRjAy4QsZcg+6XLBmxWH?=
 =?us-ascii?Q?maRfqg/7JXnj4ylpGiUQxRpqq0SkLs61KM2qChzdvx0AQPlg5ZVSTFpjpd3i?=
 =?us-ascii?Q?iCIhneGCQ2yXhyk+ibTv9anoFOilj4uwB9bVnqU15wcP1wBiQU6IT0bJXITl?=
 =?us-ascii?Q?B5OVkRu1w9QDYyJqUzEWakDnMtshN1r45VFNvMTiYM1NOrXS1w+Nm5jFFQEQ?=
 =?us-ascii?Q?LzIX4y8zUxuRXt0eaCt66QMVd1ckuGCnVF7XEkXEOxWXPP0s6r+ArMvaicSh?=
 =?us-ascii?Q?5ZOHElkKZw492lPBKrRUjSLlRmbxVbmuCHxQtsIh4gQbg0ySKlsR8H9LObfy?=
 =?us-ascii?Q?7F4hBJXwjTcWp/GQHnxxa65i8a3LPOl9bkfH3e9mOJGC2dwiAFncEFRcURAN?=
 =?us-ascii?Q?kIJZgpSffDzvolXU5/IXC3ZN3Xrfw8x8f9LYCbz2HFMs9pVo7zvYsk41uFQM?=
 =?us-ascii?Q?VuHupRMu7a8v4ZuhDTs5atksBzE4I9Osu2ykwtAh9j0LKW+AgRWQ/vkzQpDk?=
 =?us-ascii?Q?+zpVSUpnyzTXoI4DccG9r2eKT9/IhFJZYJjCKENqtQj1gSaG7QtZT1aerBhC?=
 =?us-ascii?Q?+0fgQx/+kAQT2kdELPOOIxOQRKwtWEmiYllWh0D1gYv+4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Jz6E+1jRkIwF9xBr9ZT44BbK9cDL7ysHaG3W0qYBdMQvAzPMeNMLruRmbHc?=
 =?us-ascii?Q?R6eKtgubH4Gg9m6jV0c1+DL4vwC/NKKODdzb6keOCciiuQfjNvg+G//sleO3?=
 =?us-ascii?Q?tQbvDtxSUM6HAncaYpJKfde5zlX6RGl7DrhhyNQAJbY4wzCMrfehme9nub9I?=
 =?us-ascii?Q?r/jGbWSpRlWEzGv+ey+EoM8xnswFYe7LWLe6uyWX2ePVjkyd36kSzLSbo+Ek?=
 =?us-ascii?Q?rEREKv+t7oT58sf9BQWyZ4e6xKvIgRs8Iwxwj/KnfdiMBHznBPrKwxwcG+bE?=
 =?us-ascii?Q?wtPJobPmBXjXTkGFgdx53e3/l8Udq1/vDbkltq54NHrlmEtVyL0QUH6OLDdJ?=
 =?us-ascii?Q?BrIVN/PeCCK/FpUMyaJycEDC/yNCrVXrtJ9N6uqM/KVi5+z8TQTULfAZ3jxJ?=
 =?us-ascii?Q?QKu6owpZS+bD91kSvsDnZ+BrbVA/l66nbEdAyvCqRF/lYCxuZvcAxY0xS3EY?=
 =?us-ascii?Q?2d0Fb9ie1q6Yr6s6uUKY60qD83QFctYKGzDRWzAQayouNTYnR9VnEnDoJ8xt?=
 =?us-ascii?Q?Q+ShNOUomm/F78/BhHcROYgJJTKUalBCaWlhyA3VrNpR0C4DOzXcBMGOP5fL?=
 =?us-ascii?Q?thW5H4tkTZZp/ruQMDzbCBgB8PbMCKFOjqQtR53/fNqpHIZ+/OJ8Rf11ozl+?=
 =?us-ascii?Q?9NubXH2dVw/TW2qfzKSnCoDriDEyxClfVE6eM8PeOz6pHyAknH5TZxRcvOqy?=
 =?us-ascii?Q?DeIrNvee3RkT1RYJ1N4niiWwMBk6379RtM/2O0jnmI365MaBcqBTmNbNVDzS?=
 =?us-ascii?Q?0xKM8VXHoRNrDKEOSC25fxN0po9uZc0jhz4+hGI9uR8FI1IRofcg8KNG/si8?=
 =?us-ascii?Q?mO6UcxXXBohweFedXyULwA8IN/8neFtsflHV/IazLWeD6a5+lfdsovjUgtGk?=
 =?us-ascii?Q?9Hxv3lCFAmSFKDDRtDoEgF7PQECHeL3RmuFrYnBaJEF3Nn0F2NLuePz1KSPy?=
 =?us-ascii?Q?YOX8TXrU8cdAjEh6uo9lGSkvWoI707wyIS1ovyVZKbNjngC/b3QjHnvx5APK?=
 =?us-ascii?Q?GUOdDdNJ3FA5lvSo8MDV8GttUq0pHFUhRakG/wdcuZTBs5YMdx3AgK7JVXX3?=
 =?us-ascii?Q?0KATSsEUN0tTflm1X0OqOCia5ChbnF4DOTJwqBpR6re6bcaGCr0t7zqghCAg?=
 =?us-ascii?Q?CsDjBHvj9Z/GCTETnhxVK0ibE9PefJQYOt9WtKtuatlN7n8DcPSil2xAfYyO?=
 =?us-ascii?Q?eWiR2y4TOivev0Oyr8mnLcTLR6WTNiyNrISCA3Q+Xdz03lS5iAHtc9hKC7Ev?=
 =?us-ascii?Q?gBc4FEDDYiW02kO0/huvZK1mr8Yotg/TP39h3IY+LQuMTqoHOaCADf/y6YC3?=
 =?us-ascii?Q?s1hr4Ler4aiLwQ7h/sBS2F6gGRWhqFFKjMIeDCgPJyKc6C5llz+JRD5iKeHU?=
 =?us-ascii?Q?PMApuFtbBk6Xl4gSRems0gu/Q2l0Bmku+YuTsOUVApuLixPoSwn85XKUGRvo?=
 =?us-ascii?Q?dW32Ib1zY4dDJMpKrdAr5MMgjtAXISXZn1gZ8njAm0zkWsWErCi60iFLNkbQ?=
 =?us-ascii?Q?+kISUv6KFA1rVzk7U3+ih7CL8oG5NJyJsF1PtrIS1X9TCe5gJIvQebBvoSQ1?=
 =?us-ascii?Q?uHmnhfZUE8C2zTakaoRNtKt13VmZ3swL5hqyj3lX5te0bSAPQfRo70NwGr4x?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3ff75e-6383-4625-1722-08dcb002fb51
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:16:43.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6MOBV+wZg9hVgmpwGyuUloaOk56537UvWy0plzJnvLvjV6O9Z36X2PtVPSqcHBsidB6mdM2Pt0qvWs6HJhlkouNwQN16HkQGr8mJRunlNDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
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

On Mon, Jul 29, 2024 at 02:05:25PM GMT, Lucas De Marchi wrote:
>On Fri, Jul 26, 2024 at 05:08:05PM GMT, Mika Kuoppala wrote:
>>From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>>In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
>>and some other registers needs to be programmed. Implement eudebug
>>mode enabling including eudebug related workarounds.
>
>nack for the workadound part. See below.
>
>>
>>1) Enable exceptions only on platforms that does not have per context
>>  debugging functionality
>>
>>2) Fixup 22015693276:
>>  Use lineage HSD instead of per platform specific, be precise defining
>>  graphics range.


also no idea what "1)" and "2)" are here.

Lucas De Marchi
