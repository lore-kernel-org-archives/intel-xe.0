Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D37C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 22:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706C210E0F4;
	Mon,  8 Jul 2024 22:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMqQoJUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA7510E0F4
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 22:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720479576; x=1752015576;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YoPSV9qr60wbKMC0MGFlZIKs7Qz+dGhT8FzGt5qhK2w=;
 b=kMqQoJUOn1pmgWk8ZdtxeLImaXleKMo4tPIIf2mNwbDtmmMH64kdajRy
 WMk3N7bWXHclC/Lr3eV+chqgqscSE87Nbkeq5g6CbrCKQy30VeDCItbqM
 rTcf7yoa4a0Z7wfkBHGboXkAmU1uTcKPlK77m9S/40EIObghT6T17zny+
 2n+sG9IdQDteoRUik/jMvTaG4oYSrgWQ6g45yDFZp2EycxcTjB7ZKI0xh
 cAOu3SIlrQZ9Gy+1dRyIozkxu1ndWER3FDzyfOeDrje37Gu4QRmrYO+QO
 nsOYDzqU/hJTLaXQ3Oyj6t0jsPGvGHRkVef4d2Rs58TWOUmk21tkJFfjd A==;
X-CSE-ConnectionGUID: owbCEDYrT1637umF052YCQ==
X-CSE-MsgGUID: iV+2TGVWQG64uHayXTYDgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21573592"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="21573592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 15:59:36 -0700
X-CSE-ConnectionGUID: n1bdAnXSS5q6SCne9KDVPQ==
X-CSE-MsgGUID: Q9TUvHy4TCWcyi3mJ4S3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="78392269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 15:59:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:59:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 15:59:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 15:59:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 15:59:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bmcbw5V08t5o0+TwLMT1yTZrsNG3u3RjI8xRwmNyLTNkWxmP0hUB2n3KGVkb4vNeijj7UaLx64zq7l7K0on8UPpZ5z8pWcvh9348FTNpbCNdRSNytC1gxRPxhUH3tT3x5WkrMgXOj+KtMoA1g4wTIfvvuKNAODoo/V4e9wEf1a+wcKS6uP9R04LxNGXGVwcmr22CtWMHKwktcVRDmxHUtAcWJPnP9iksgZ/5EC+qyhz8Idc5zDfc6kL/cak9e6Lej+YZ4YRO/LbNtjGuHRTI5ReO1BIrdeppFSimNssIUvmpEcuRsCaaof7O/rXdda1FLDsg2An2Q+z3SBMR+87InQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2l0lAGdRK3X3cgALgjAFt6ZPIlwG7awbo//N6YL7wI=;
 b=JMn4A7EWSjw6wVu9gAM2iL6+27yv55Ty/JXuacmTsbPVR1SN2K28MO8tngcBaojlBvg4sve6QFuZ9Y+3K6AFGgpsQAo+X+r79YtkNeTnCQ5TZW8sf7JaBjXOrb35aiRXhRI2YY3MpCWiRnJ/rufUO9zObWJy4YKdBD9IUq1jS787qYRZktRA4MQfZ1xBuLGBQ05ykRzSHj6c7V0I6DiANKatzZXhe98Y9R5Kcr7bvj1XvFL4+8+4AI7BI+gm3Y2AhQMQdsGp/4cc6VUDP80TTH6dSt5K9F83RlXckMM1q5d5cK0caTcyCIxWHcZ+k3shdcTN8UFy1lInMJnHuVTsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 22:59:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 22:59:29 +0000
Date: Mon, 8 Jul 2024 17:59:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <ryszard.knop@intel.com>,
 <ewelina.musial@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Reapply
 "drm/xe/gsc: define GSC FW for LNL"
Message-ID: <f4nrn7gsnhasnsmflqi2kaocxmpjdmyzwsxarqtjsmyzboumb4@rjxiqvosw374>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
 <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
 <790e4a09-a383-47fd-8c1d-2b8994c6c0b4@intel.com>
 <ct6pqzwxnhlmgkal5yjbaaukl7kcshlg2ifhjiodxu464o4xth@6lnkhu7lrwck>
 <11752a39-1aa0-4140-bc26-15283f045607@intel.com>
 <2urugervd3spw4vtlkpxu4z2rwd3axojxponwhpnwutv662ntj@p3mr6qxe7kh4>
 <ZoajuaN7JrWYAOwI@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoajuaN7JrWYAOwI@intel.com>
X-ClientProxiedBy: MW4PR04CA0297.namprd04.prod.outlook.com
 (2603:10b6:303:89::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a4cec8-59c7-44d7-7db6-08dc9fa19f81
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rZiC7GRkhi0OWPIhAb1Fr3NjE202CsRpjje4c8UQu+g25PpcrOaY/dXsNM?=
 =?iso-8859-1?Q?3TLBK3sBqu5ni+KwOCnTkNBQRi4qUTkHH7uPaQbXm8OE3JC4/5V+H4LpRi?=
 =?iso-8859-1?Q?7VGXdXXOa7B1ZFtHHe8XQky15prnDOjYzo2tP9hWYi3lLwfkj44Pe+QIK2?=
 =?iso-8859-1?Q?wi6dTxXNjv8d4hYxWcGMXipcOIZzoD8wN2xVUXrW9LeTGwu7x5K3ZrPK6W?=
 =?iso-8859-1?Q?lWGY4Dm1p8Lv8Was2bidRSgA8VDXOb07/WaZK1yNm4znbb7c6j5jkQtOyR?=
 =?iso-8859-1?Q?u6mh9dxXMj8sfsWfcXMxpKFZ3lYTRoxmVDYZcOWe6OGOUIBZLH5MbSR1ib?=
 =?iso-8859-1?Q?NHBFlBWRXm/ZQokpCb+7dcJswlMzfPTtH/amu3kfxKn351tC4CHx7NI/XA?=
 =?iso-8859-1?Q?SRFIFSjBdFQENK15hQCA27KMN3wmIYTpyfWFjb5nvdsg01pHavETNMMHCk?=
 =?iso-8859-1?Q?wO7oISsqpADxg00w9AMV2GdZuSv8tnA85e1K5ipbroxejNypLaNQ1MsMPU?=
 =?iso-8859-1?Q?/qXEGJBBCeJkCF7vnggvvTeOsTNHSxt94NwlUFnUzFarqs4lsPDDNPjrI8?=
 =?iso-8859-1?Q?YHAFbTcs/kKukbuwI2M/URZu5nFL7lbRVxbx9S6UZv0vAdNxuULczGnrpm?=
 =?iso-8859-1?Q?V7rOpZh3PWki+/KWBF6TGJUOu0huFtP//FDCMAEbxVF1gcCwOECLXZ7Ijv?=
 =?iso-8859-1?Q?HKQnehh0GenOlafk2okng0Ye5nQrEPBdS4aWQzxpcJ6KsBEjUyW84CLP27?=
 =?iso-8859-1?Q?3Eqd+xV80NxmzilKkPPNBqlHadcVt6SUuDeTDc5l7+Gg24ekHfUF/hXWBJ?=
 =?iso-8859-1?Q?PGFvYv8bRfuNFPNd/ITODchcRpRlxFDJOscL43fmVOUp4kMc7BlrORJQej?=
 =?iso-8859-1?Q?aOg95PRmm2lGw6pBjRboMLN9aZi60TZ8YxVA4TYkauhBe8WYVEMfEZdt85?=
 =?iso-8859-1?Q?XvVXM/YNYn9d+/Br3yqNe8v2kG+pI6KCtdonvTVQ2BLNRYWi+ZBvCgY6SY?=
 =?iso-8859-1?Q?z0s4ianKAKQ6qzVs9YKmGOw8RB4WM2trIiEn7Lb96dvwxzNxKntwhxvRuM?=
 =?iso-8859-1?Q?wCbSz3Fxkzf+2ORCRbH2z2p0MH70nOu2E6P3AFyPIh4NCSKxVYnS/vEPsc?=
 =?iso-8859-1?Q?rqfqm/p7YGSpCq5HlTHtr+gYfYBsEDXKGfde54aGJeTSAicSzdkVhGEcSQ?=
 =?iso-8859-1?Q?XMGtkH2wj6BFgo2AFTcqhadnfeaMKL32/DsZvkcy9bSbyOMsWnEYgNgc5P?=
 =?iso-8859-1?Q?ZrBL0V96L8Q1A8g6sFWV9M8vU+UjQ45cH8YLpBVxPocSgYyur6s4rvi+Gi?=
 =?iso-8859-1?Q?EQ8mfdcnqpwVEPrKGUPte15niD8xRr8V/ecP73C328+X8kg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LRssC8rfHyZz8eKAHJM/K9UbZAFPvaT993SdVu1eKF6n/mAhzwbAkxQaOz?=
 =?iso-8859-1?Q?TlGN5c/MfAdJfOMVpz7+KbusxheetSwHsMcL5NTO21mkbId8WfXIu9tG0B?=
 =?iso-8859-1?Q?KPC3+JqDAb/T5hM1YK/3biFN0sL66el96yDziVzcBaVo0oa4Dchmuz2EA7?=
 =?iso-8859-1?Q?3C4fiNrZ/xF6VIf85wta6gX5dfi6/v4bQyL/cUt5lD/tzv69UDBCgdVltG?=
 =?iso-8859-1?Q?pP0RJ8FZwhMG4LaHzJXj7QU3tU+hGz1Rjb7n2mAdf2wOZyx6FOw76UTWGs?=
 =?iso-8859-1?Q?yCyAhATRaAghKffGUHytleMOJbbg2dfZsC1B1AwlOs8viCXONN2W8gD/Ff?=
 =?iso-8859-1?Q?zfJJusSPcs/me+w/KqZcKZg+3uo9pJhDCi5dxyNDgl7Iln5n1re+LjBupL?=
 =?iso-8859-1?Q?lDnFyXXARwIMk73xbEJiwhVCRDljOhZb9YkwOf+jPQhPfpgl+hRjkvh++T?=
 =?iso-8859-1?Q?m47jh8ZFRfGIvvAzVhNt1+ycqRwAlITfugKlPFLUCsFyFp/BVL9K8LloNx?=
 =?iso-8859-1?Q?ppJjXtsGUiGz0Ag+OgsaPlgWvjHVLadxV/E32BhV9a1Lv0DjioMCX20J1r?=
 =?iso-8859-1?Q?xWLK+o7G4Sg+RAFsxVD7lfshPxMBuwisbTllyYu/SLS/hSpie8pFaVhsrz?=
 =?iso-8859-1?Q?b1tCPzvl8cDMb/byttARtQZ0Tp0XA8DvsQmrwX2ouGT0uSVNGsH4GmNIf/?=
 =?iso-8859-1?Q?VSeQMK4YJwbLJ66uNMZkdR0a8S2PAUU67XS0f96s8qimM/qWx8q9CEfgTq?=
 =?iso-8859-1?Q?hoZ2mhSe14rCq6TkA/m650T2+O/KR1PzdFQwxppMMn/5lPqsvGn4Zvktio?=
 =?iso-8859-1?Q?3YBFh3fpGULQ5dMeGCFsGmlukw9kdTgURS/4xcxwh9sionwwsDqxbTivVK?=
 =?iso-8859-1?Q?2M1M8bxRQUyyzxz9W4OZy/AtyBPMWPVHJqS+JKCS4FHK700X2u880Znoe9?=
 =?iso-8859-1?Q?JugzcS4FPAKgWFselXFYKyJeFi3dhKrqIQDf2YwrJjwpFFKzvIJg5eD5N3?=
 =?iso-8859-1?Q?wqxFTm/AsrYXWbSEmFcCj59rn1Po9SgyG14CPfRpkrfekAjQIYolcsfr9a?=
 =?iso-8859-1?Q?18qgJW50XUp7V65IlsCX28k9OaR7UpOxIvr953yW4G1MAlEIP0RwtxGYfO?=
 =?iso-8859-1?Q?1wtd8FZjRZ0Okq+aSGPqo/KOlZEnfPc0Di22z47xPPMmmUQMBMty7Xf4Jc?=
 =?iso-8859-1?Q?zztstpW2+MBi9GOe9aRi80fWT/aXgk5XIrTHgPAMN06WkFQY8wislRPkZP?=
 =?iso-8859-1?Q?6kR1BQvboTN1Gy3S0KKyR/TVjMjE5cZ8up2OieM7lR4MXCg/qMSehdWkLp?=
 =?iso-8859-1?Q?SW4bogjuR2auOOJS0zbj3JnU7Enlo8THNTMclWlxT5/xJQXWKfC1nyA0ul?=
 =?iso-8859-1?Q?GP28lcXGlhGP4s7yobOtVSv+gS9zS5o/KO0kLRSAh6EhIAWWB0GCsL4Qbb?=
 =?iso-8859-1?Q?ijODG4/GCqqKSUEeeoHuAPexq1va1KYPN/t4ISaha/Np2geS+fQn3/RPYt?=
 =?iso-8859-1?Q?nu7qiVW61CcfFqbyZPKs5NT6AA1pYW/8IXOa2QGMEyAKtlJhk0nb1hGOQr?=
 =?iso-8859-1?Q?WmckG5M1zxRISLCo41mBX3hI12laQ1THIoYHrSUOlMZHiexhA+xrtvyw4R?=
 =?iso-8859-1?Q?8Ct9Xr+hfORSwCPNy4hiWw1yLg2Hkv2NvKJomlAUUxGhL6cGpzEjgBhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a4cec8-59c7-44d7-7db6-08dc9fa19f81
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 22:59:29.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFQVKX5f1MZryTKYd7FZBI48whM1Bo2HCfkyB1a3MEAyuaj+DBaDIsBsoYKkJzmdO7fRZC5/NGGlkO6LsOL93mnpwKgBvqyZ6yKQZxRYYk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Thu, Jul 04, 2024 at 04:29:29PM GMT, Ville Syrjälä wrote:
>On Wed, Jul 03, 2024 at 03:22:04PM -0500, Lucas De Marchi wrote:
>> On Wed, Jul 03, 2024 at 09:38:54AM GMT, Daniele Ceraolo Spurio wrote:
>> >
>> >
>> >On 7/2/2024 11:02 AM, Lucas De Marchi wrote:
>> >>On Tue, Jul 02, 2024 at 09:25:31AM GMT, Daniele Ceraolo Spurio wrote:
>> >>>
>> >>>
>> >>>On 7/2/2024 7:29 AM, Lucas De Marchi wrote:
>> >>>>On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>> >>>>>== Series Details ==
>> >>>>>
>> >>>>>Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>> >>>>>URL   : https://patchwork.freedesktop.org/series/135623/
>> >>>>>State : success
>> >>>>>
>> >>>>>== Summary ==
>> >>>>>
>> >>>>>CI Bug Log - changes from
>> >>>>>xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT ->
>> >>>>>xe-pw-135623v1_BAT
>> >>>>>====================================================
>> >>>>>
>> >>>>>Summary
>> >>>>>-------
>> >>>>>
>> >>>>> **SUCCESS**
>> >>>>>
>> >>>>> No regressions found.
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>Participating hosts (5 -> 4)
>> >>>>>------------------------------
>> >>>>>
>> >>>>> Missing    (1): bat-lnl-1
>> >>>>
>> >>>>I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
>> >>>>be considered "a reliable machine from the CI POV" so we don't have
>> >>>>"CI.BAT: success" when LNL execution is missing?  Or is there any other
>> >>>>reason why we report success in this case?
>> >>>
>> >>>Damn. I can't repro the issue anymore with this WA applied and
>> >>>even in CI we weren't seeing it when I sent it for testing before:
>> >>>https://patchwork.freedesktop.org/series/134099/ . I did 3 runs in
>> >>>that case and none of them hit the problem.
>> >>>
>> >>>I've triggered another run to see if we get any better logs.
>> >>
>> >>this change should NOT make the machine "go missing" really. Actually no
>> >>change to xe-only should really make a machine not have any log at
>> >>all....
>> >>
>> >>I believe it was a very unfortunate coincidence and there must be a
>> >>network issue or the like... but we can't consider success when we don't
>> >>have a report for LNL. Particularly for this patch since LNL is
>> >>the only affected platform.
>> >>
>> >>"try again"  in patchwork sounds good for now.
>> >
>> >It died again, but this time we got some logs. It died during an fbdev
>> >test, which makes me think this is due to the display side of the WA
>> >still being missing. I'll try again to repro locally and if I can't
>> >I'll send a patch to move the FB out of stolen and see what happens.
>>
>> I think it needs to be out of stolen, no way around it.  We are fencing
>> the number of writes, but if the fb, that is user-accessible, is
>> allocated in stolen, there's no way to do that.
>>
>> Also, I have no idea why it's currently in stolen. Looking at
>>
> 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135667v5/bat-lnl-1/dmesg0.txt
>>
>> 	<7>[  321.798108] xe 0000:00:02.0: [drm:intelfb_create [xe]] no BIOS fb, allocating a new one
>> 	<6>[  321.798743] xe 0000:00:02.0: [drm] Allocated fbdev into stolen
>> 	<7>[  321.803371] xe 0000:00:02.0: [drm:intelfb_create [xe]] allocated 2880x1800 fb: 0x01621000
>>
>> so, we failed to get the fb from BIOS that would be in stolen (why? not
>> sure), then we go ahead and allocate in stolen, for what benefit?
>
>Using stolen for this is not entirely unreasonable as otherwise it
>might just be completely wasted memory.

well... the problem is that we keep having issues with stolen
when uCs and hardware IPs have their own things in stolen. And then WAs
showing up due to lmembar going back to system memory. Ugh

The stolen is used to pass the initial fb from BIOS to driver, but it's then
expected we won't use it after that anymore. At least it seems the trend
with MTL and LNL. Hence my reaction "if we are just allocating a new FB,
why is it in stolen?"

>
>Though we should probably have a bit better policy than the current
>"1/2 of stolen". A more sensible policy would be "make sure we leave
>enough for FBC". The problem is deciding what is actually reasonable.
>One easy idea would be to just do something along the lines of
>intel_fbc_cfb_size(intel_fbc_max_plane_size()). I'll see about cooking
>up something like that...
>
>>
>> It seems like drivers/gpu/drm/xe/display/intel_fbdev_fb.c is already
>> missing the MTL WA that avoids stolen
>
>Technically we shouldn't need that w/a on MTL as we now bypass
>LMEMBAR and access stolen directly.

c08c364102d07288610734de34111a666e730ae7 and related stolen commits
above it? I'm not sure we can follow the same approach for the LNL WA
though.

Since https://patchwork.freedesktop.org/patch/602631/?series=135861&rev=1
passes CI, I think it would be more reasonable to merge something like
that (maybe changing the WA to do usable_size = 0) and on top come with
a refactor bringing back objects in stolen.

Lucas De Marchi


>
>-- 
>Ville Syrjälä
>Intel
