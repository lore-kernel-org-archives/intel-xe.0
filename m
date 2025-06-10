Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6E1C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 13:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367389369;
	Tue, 10 Jun 2025 13:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVJSIMWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A689369
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749562931; x=1781098931;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZCXDKobz4ZIfur1RBJo7HmzeIglt88rq4zRyDIGrP5I=;
 b=AVJSIMWPXG8PcE2SplIsumCrafmU7Fk38UApQx6Cs21j/W8i2anj6YUx
 I5VDNt157XfoAhBXgNyZw39N8buQZ9OASjhOpzIq4hoD53VXJxdslINvT
 tpAfsLGOz4QsWFlcSb+l4R3/oEEeNw4N5SBvGJwcM6c2knNybxwlArZ14
 Il1HgjoYtW/JXhHDUu9E2HLoLAhMWB5Vr1O1MBaYnE5OtWQgVToB2fmmd
 tBisAPEtwav3ya4ByMMojYoMhtAn5Sizwu85SPUFmXif5JUm2jAauRa5O
 AKzXHpNkZB6mKlV7sOQ5I2+NlY6n4UadQJKYLMOczx7OIw3OtPMxMeEA8 w==;
X-CSE-ConnectionGUID: J9whMCbfS1mER4w/JJpDJQ==
X-CSE-MsgGUID: jFJd9ut5TtOnJhzPIXDBKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51553693"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51553693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:42:10 -0700
X-CSE-ConnectionGUID: rjduGQzeRQCMRDwC+jk48Q==
X-CSE-MsgGUID: ureZOYPYTYCjtv+/ntNSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147353821"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 06:42:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:42:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 06:42:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 06:42:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYdGc31pgy0U0H07Pggy92FByOSB43x9vBKj6hmw7nGDkPrdWdwTMqv4Es7wsmLYpqitd+UqkEBRKB50uEQG+9RKWmi4l8rIBY1ABeawR4Zo6AuppvFYrjutz2VlDV1IVhyIFhDj9S5U3T68OZQSlf69EYCOORw7LIi1pphauDdQJLV8shO59SdQGk6KZAAF0SC7deLHlZHQpllXUb3xnzxhaIsJjDaV4oVhULcM2NOp6Zy8Q0YoS3CAG+F1osssBLt2jFjskQcg7M5+dAz54Xi7yRnZlSlF4uj0uYK0XmgLmaK1K2bWxM3Z/Ldwf9XPmHB46tqPOdVfkwQdiE9gEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0wcaYGEXwZEw1lxoH3EnBoWgaDf2CDhjzU7/98lem0=;
 b=UmKOmrK35QJUlB8hOpTdaLv62Y9i7GrFPhOborgRS667yfkbh6/p5NvG/9iAqwuv4rgS2oW+u3ixoYHg9PzLg5r48N0CuBJJv4xiwWey12YyvKbovE6JH50tHc8v2BJuJZjmiZ6yHcSVrDgbDwaNARVj19VqzJdaKGIk1Je9AQKga/n1VKcMXT3v5GFkJLXepTVxGzH/UNd+kY9WRA2ev1kIYl40GlQWLt0RrARvaPr5+g6/ypFU6Y6EFKPzqYboDHi19cmsR7RNyrIjX26ifmc/uHblf72BdAxF3P1V9+f46mmRR6wDOWZdf6XzIGMF381VfU/sudPhRNWBC28Buw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 13:42:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 13:42:06 +0000
Date: Tue, 10 Jun 2025 06:43:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe: Enable ATS if enabled on the PCI side
Message-ID: <aEg2jRP9vHMTfkQc@lstrano-desk.jf.intel.com>
References: <20250609135408.102001-1-thomas.hellstrom@linux.intel.com>
 <aEeAVQLCj21e600V@lstrano-desk.jf.intel.com>
 <4ac8fa8a01f22c34f5094b6f47c416423af9ff3a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ac8fa8a01f22c34f5094b6f47c416423af9ff3a.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: f1302c72-90ec-4ef0-5e79-08dda82496ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Du6aqvhsY3vVxd8PeRyhDxDReWbILyiqxK31C9fzSxLuzKAjdXTlDHAG4J?=
 =?iso-8859-1?Q?DBtEqTvNny3+Ho7ux9MhhVMbnJNdZ//QnbV+rSmpn8E7wzpm7t6Do3uydU?=
 =?iso-8859-1?Q?wQOdIKpgNN2g9t9w40gLJ+gb6Etu1p5NPSSmG0c05U6S6r4XeQJJYUlcl0?=
 =?iso-8859-1?Q?9tHmV57G9hYc1H24qZwiTBvAsNOtOkVVJf2dMBl8h+FqnTV87hri6IYCFB?=
 =?iso-8859-1?Q?ZTWPk/64WUDUPC2zTJp4PkJ0MANmtmRbGuUbZgNX0g9Nyqd7oburKhNoKr?=
 =?iso-8859-1?Q?NPv2vsfjRfL9PjwvVvOSC6BIp5wV4fQASAmkbYogt2B2EvS/mlXe9Aw8qq?=
 =?iso-8859-1?Q?5s3PJuMkl0doNEPXW9VHRxkM8moRtm5Zm2xP0LEs7UwBywya4XwVIJxgw0?=
 =?iso-8859-1?Q?SNNoGn7SMduo9jZjwGtb3SDFCKaHouEIwdClogLUTVmJyZ0Wyy2zXw0sWH?=
 =?iso-8859-1?Q?1z8RRYjL+Yn6rvic5mnfXQ8pQsn68p3KoeItuQbhv9nTWDkX0KWKyvPPBc?=
 =?iso-8859-1?Q?C5wWs7u80syxV1QXpVwWtGu3hOjjrPlmLeUKlaZpwNAtQ88K062Y5sTBDS?=
 =?iso-8859-1?Q?xwSOhtBSrGjN94apcY2srhPXiUPr7bOujwhFiNA1ZurM5s4cSe9LlotJeF?=
 =?iso-8859-1?Q?ugGFFzyOTy7QwLFtnlqfO86yrfc7JMmjwM/xcRBGe5GZMYcFAb/Lpv0Sp6?=
 =?iso-8859-1?Q?vFnbGtC39nTfwkcz9nY3oTxRbq7OJqA8a4wHkkRRsQbHxL+sZmwb9iqzhT?=
 =?iso-8859-1?Q?VRhDJGnSgkDUuCmrQCM0wtQTXuo4IbWOtddZWfFYjZBmqJSTemcp+Qrphc?=
 =?iso-8859-1?Q?uUIlRs+agJT3xk8nu4WacrMS95E0Xbs8Q2ELnkPy56kP7Cx7sG2Fds0Rvu?=
 =?iso-8859-1?Q?O/f7BwrjQbo0OsBVLslz/B7ACz8dlP45YQI64hnthA63k24vxK+Qhm/b4K?=
 =?iso-8859-1?Q?aJhQlOxJSWIilHSj0+kKs2aaU4tlcmtZ036StfQC3T6UcldVzebD6vq/iy?=
 =?iso-8859-1?Q?jrrUFCo/yN70I0jCm9rEmqgxuzuV2mywMt/GIftZQrBIMYot2qcrY38TFA?=
 =?iso-8859-1?Q?Qi3PIoXdV+5eGkwqFh3tz0BavwVMxvAQlZEqRK/+K6vksWU8sIYPIAlVQt?=
 =?iso-8859-1?Q?53fmb3q088WaSK1CEWFG6pIuaF7Dl5idp8MsHejOgl1BJfJwq5s9rl2wC3?=
 =?iso-8859-1?Q?2q3xq+ubVlBuYeF5tWcPInAKx/x9zAVwCSzlpY3YZvY3HJySpBdFHdRdcA?=
 =?iso-8859-1?Q?m+HEjy2ozrzdvlaM3aT1G7qU4Z5IsRaTUEFxAm75hhxm7Up6c22Vu8UjiV?=
 =?iso-8859-1?Q?Ak6n86DuGpFcCjNLYLchSPAxzZ1ZbQI4auupjCzWtglSYRRN+l8boo4lwQ?=
 =?iso-8859-1?Q?/aeFuOZ77eiyjO5idVur2olwlht3rdjbi9tzX69/ZyOWazWSsvnKVsT5VN?=
 =?iso-8859-1?Q?KjZebTHVfnIf3HbkdnmybqeUl2QdEYyqGTsiIfvMN5giMtpNRf5x5gFtDS?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7occQsvrhz9q5Sixac7yRuU2RIIUGUabkEMsYpWjZnlxVh3y+9YQKjyZWz?=
 =?iso-8859-1?Q?Ywt7rAlUDfCi+GqxfHwgF4iOdM5ygufTY8iYMY2xQaA4vf185pmxXWAPCE?=
 =?iso-8859-1?Q?3qS1+Iz+ArQPaiflteB2/klnFDWXNXefNd6KMi3vjDP80Jd7N8FZDIXmYS?=
 =?iso-8859-1?Q?OffU64CKRltlHd0LkNWM6Z68cz4Baz1ydFacZPWam7CGrrXQdBOx+gy5Cu?=
 =?iso-8859-1?Q?1hlMyZbSs3OhgfSaRlybi7t3WJ34Jrnc+OgFzRCKfe93olq40GkRfcmJEM?=
 =?iso-8859-1?Q?rmNeZXBK3xMv2fVmATtv0kgBnzc8rijF4auQtjoyZIYSKvSLhaTZwrUIJI?=
 =?iso-8859-1?Q?172jZ4pNVverRKwBMQIilZqAkt279/LaP9fcpm2d4eyhZqyssDsYKBV52O?=
 =?iso-8859-1?Q?Zjm/K6BB6l57/A5IKgLSIneSlzXeCAGFPDoQlwLqhFScYmdXYMApP50pLg?=
 =?iso-8859-1?Q?D9Qg8Gc/giNgFsVpO/abAdKOQZ6PmMccGARdFOuh9fn1Rzb66QA+67f0ec?=
 =?iso-8859-1?Q?AHlw6iqS+C7TkFDhmZR5w5dln68bEr5UGnTiYMPuef2yI2ng0T//6t6M9L?=
 =?iso-8859-1?Q?Nn5x1xOMPZ6RiRoJ5l7JswX6YxetHw0ID8EbFGCznVbl/lS8G9obT1qTMI?=
 =?iso-8859-1?Q?BqsLHJwkgtrTUqksOGe4LKfgGXrOhKKeSKOEG0FKBLnQfmWaLGC+53h32Y?=
 =?iso-8859-1?Q?qmZPd7ojnruf3JWFC/Ehm0wg81kOJ8WmmLqeTkGsVvEecIFU1cD1bb/o9q?=
 =?iso-8859-1?Q?bk+6v1IJxIstkW360gjAXIETMR5Zo6aOB0Sbm/Ti+17HpX1QSwV+ui/qPQ?=
 =?iso-8859-1?Q?pBqnKeFXo6poaYRtKFVe0C/jLg4lGc+Fcuoo7jr8rve25yPB2dVg5H4QEP?=
 =?iso-8859-1?Q?jxgVEvj9zaZFC9FlcpKvZn9IQJV+cdJAISpEWiVsoTeNf4EUPRqU8kMZCz?=
 =?iso-8859-1?Q?0GkVhaIwE6MgWqaNdr9O0f8x3QhmP2ZRWkghMafqd9PUBhFdcGka9EIlXC?=
 =?iso-8859-1?Q?CovjgI2En+p7Tie/+Hhq/qQoZQAbkQN/fmzqwZF0jb+FYPB47xZY+kae4R?=
 =?iso-8859-1?Q?yY4WGPiFE0csVclpniVW4nH4Bc4KRMZAsNR5LDPd296f1gZDrBkr2w4Caa?=
 =?iso-8859-1?Q?a40TA99PKBV9gLELqJ2z6CVutTy5YhXHK0rbtPsRKQ6bBadD1RJ3kuP0zI?=
 =?iso-8859-1?Q?RkDXtpG4qV/R5UVqzfpKjUoPqUaHu0WSkl6MeKPOlhma7W7og9knWHv0re?=
 =?iso-8859-1?Q?22SAjVdYK8UEqf6kjdpzJHcJEOGZP6rXGHq1c/YObH2F9jOYUzhqS3w5t+?=
 =?iso-8859-1?Q?QB9ibWXMnBdMbDoGEQ7rfparN3KCBiHVGGfu3vz222ET14OoHz7Keqqvlq?=
 =?iso-8859-1?Q?cDxknQmqqFZ8jZfOsHsCY5hQ4WZPzhH3tLp6FMljgYu5VLJMf3+4HRkaad?=
 =?iso-8859-1?Q?TE00RL4ZGiwLrjWxs2LHJjWWfkpgFqvqhCPdr4gfcXO6JR6hX6mAJ44c6H?=
 =?iso-8859-1?Q?0hyur6zNpvVgZKyswZoiNrrSTwZoIgWKgXELiuuEDJKl8ldlNy/21l4DUo?=
 =?iso-8859-1?Q?W7lNUeZwLwH5CMCcSMWOz78HMSr++IzIO8spQYleQb3YAegHBCB/L2WsC8?=
 =?iso-8859-1?Q?1ZjgWiQXOVbHl5o5qRC6+GHBkpD1aoMHVJ5hPEEcMsAtD/fPfdIRaqig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1302c72-90ec-4ef0-5e79-08dda82496ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:42:06.3717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 954JpK6KgQUgiCAvFSLM/ftM9jjNT1vE+h2XFRdRl/MvFnurDZWsecvFb/zv6SgAnaLPZM80X3hUQuiGxTBXgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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

On Tue, Jun 10, 2025 at 09:20:19AM +0200, Thomas Hellström wrote:
> On Mon, 2025-06-09 at 17:46 -0700, Matthew Brost wrote:
> > On Mon, Jun 09, 2025 at 03:54:08PM +0200, Thomas Hellström wrote:
> > > If IOMMU and device supports ATS, enable it in an effort to offload
> > > IOMMU TLB.
> > > 
> > 
> > Can you explain what exactly you mean by offload 'IOMMU TLB'.
> > 
> > Does that mean physical addresses are cached on the device rather
> > than
> > dma-addresses for system memory?
> 
> Yes, that's as I understand it, one (the main) purpose of ATS. Instead
> of sending untranslated addresses for the IOMMU to translate on each
> access, the device sends physical addresses stored in its translation
> cache, thereby reducing the translation burden on the IOMMU.
> 

Makes sense. Follow up questions - then.

1. Do you any platforms have ATS enabled?
2. Have we measured performance difference on either synthetic
benchmarks or real work apps to see perf differences?

Patch itself makes sense, and force fault usage aligns with what I was I
thinking.

One nit below.

> Thanks,
> Thomas
> 
> > 
> > Matt 
> > 
> > > v2:
> > > - Set the FORCE_FAULT PTE flag when clearing a PTE for faulting VM.
> > > (CI)
> > > v3:
> > > - More instances of FORCE_FAULT flag. (CI)
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
> > >  drivers/gpu/drm/xe/xe_lrc.c           |  5 ++++
> > >  drivers/gpu/drm/xe/xe_pt.c            | 36 +++++++++++++++--------
> > > ----
> > >  3 files changed, 26 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > index 4389e5a76f89..c6b32516b008 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > @@ -33,5 +33,6 @@
> > >  
> > >  #define XE_PAGE_PRESENT			BIT_ULL(0)
> > >  #define XE_PAGE_RW			BIT_ULL(1)
> > > +#define XE_PAGE_FORCE_FAULT             BIT_ULL(2)
> > >  
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 61a2e87990a9..085f7e0568e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -976,6 +976,7 @@ static void xe_lrc_setup_utilization(struct
> > > xe_lrc *lrc)
> > >  
> > >  #define PVC_CTX_ASID		(0x2e + 1)
> > >  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
> > > +#define XE_CTX_PASID            (0x2c + 1)
> > >  
> > >  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine
> > > *hwe,
> > >  		       struct xe_vm *vm, u32 ring_size, u16
> > > msix_vec,
> > > @@ -1104,6 +1105,10 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > > struct xe_hw_engine *hwe,
> > >  	if (xe->info.has_asid && vm)
> > >  		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm-
> > > >usm.asid);
> > >  
> > > +	/* If possible, enable ATS to offload the IOMMU TLB */
> > > +	if (to_pci_dev(xe->drm.dev)->ats_enabled)
> > > +		xe_lrc_write_ctx_reg(lrc, XE_CTX_PASID, (1 <<
> > > 31));
> > > +
> > >  	lrc->desc = LRC_VALID;
> > >  	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE,
> > > LRC_LEGACY_64B_CONTEXT);
> > >  	/* TODO: Priority */
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > b/drivers/gpu/drm/xe/xe_pt.c
> > > index c9c41fbe125c..6227ea238b1b 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile
> > > *tile, struct xe_vm *vm,
> > >  	u8 id = tile->id;
> > >  
> > >  	if (!xe_vm_has_scratch(vm))
> > > -		return 0;
> > > +		return XE_PAGE_FORCE_FAULT;
> > >  
> > >  	if (level > MAX_HUGEPTE_LEVEL)
> > >  		return vm->pt_ops->pde_encode_bo(vm-
> > > >scratch_pt[id][level - 1]->bo,
> > > @@ -163,17 +163,9 @@ void xe_pt_populate_empty(struct xe_tile
> > > *tile, struct xe_vm *vm,
> > >  	u64 empty;
> > >  	int i;
> > >  
> > > -	if (!xe_vm_has_scratch(vm)) {
> > > -		/*
> > > -		 * FIXME: Some memory is allocated already
> > > allocated to zero?
> > > -		 * Find out which memory that is and avoid this
> > > memset...
> > > -		 */
> > > -		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
> > > -	} else {
> > > -		empty = __xe_pt_empty_pte(tile, vm, pt->level);
> > > -		for (i = 0; i < XE_PDES; i++)
> > > -			xe_pt_write(vm->xe, map, i, empty);
> > > -	}
> > > +	empty = __xe_pt_empty_pte(tile, vm, pt->level);
> > > +	for (i = 0; i < XE_PDES; i++)
> > > +		xe_pt_write(vm->xe, map, i, empty);
> > >  }
> > >  
> > >  /**
> > > @@ -535,7 +527,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
> > > pgoff_t offset,
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >  
> > >  		if (xe_walk->clear_pt) {
> > > -			pte = 0;
> > > +			pte = XE_PAGE_FORCE_FAULT;
> > >  		} else {
> > >  			pte = vm->pt_ops->pte_encode_vma(is_null ?
> > > 0 :
> > >  							
> > > xe_res_dma(curs) +
> > > @@ -865,9 +857,21 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw
> > > *parent, pgoff_t offset,
> > >  	 */
> > >  	if (xe_pt_nonshared_offsets(addr, next, --level, walk,
> > > action, &offset,
> > >  				    &end_offset)) {
> > > -		xe_map_memset(tile_to_xe(xe_walk->tile),
> > > &xe_child->bo->vmap,
> > > -			      offset * sizeof(u64), 0,
> > > -			      (end_offset - offset) *
> > > sizeof(u64));
> > > +		struct iosys_map *map = &xe_child->bo->vmap;
> > > +		struct xe_device *xe = tile_to_xe(xe_walk->tile);
> > > +
> > > +		/*
> > > +		 * Write only the low dword in 32-bit case to
> > > avoid potential
> > > +		 * issues with the high dword being non-atomically
> > > written first
> > > +		 * resulting in an out-of-bounds address with the
> > > present
> > > +		 * bit set.
> > > +		 */
> > > +		for (; offset < end_offset; offset++) {
> > > +			if (IS_ENABLED(CONFIG_64BIT))
> > > +				xe_map_wr(xe, map, offset *
> > > sizeof(u64), u64, XE_PAGE_FORCE_FAULT);
> > > +			else
> > > +				xe_map_wr(xe, map, offset *
> > > sizeof(u64), u32, XE_PAGE_FORCE_FAULT);
> > > +		}

I wonder if we could prepopulate a KMD page (either in SRAM or VRAM)
with XE_PAGE_FORCE_FAULT and issue single optimized memory copy, same
goes PT allocation / scratch. Might give us a small perf gain I think.
Can be done in a follow up.

Matt

> > >  		xe_walk->needs_invalidate = true;
> > >  	}
> > >  
> > > -- 
> > > 2.49.0
> > > 
> 
