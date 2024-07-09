Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6D6C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 14:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4596310E149;
	Tue,  9 Jul 2024 14:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIPbskqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575A310E149
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720536410; x=1752072410;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XF8p7/l8c2yd25RwQ+EBrxwfNP1AXSxPNtPcuGjdmSk=;
 b=dIPbskqDPeLr8jlQK6BrLDWSDlRfL9z3MBhi/DaVBTtawrvGTrauxc2h
 63U9uf08CFx9MP/D7vizOQJtY8REckWv7RgPxIfVXzSF3r5FWvdJS831g
 JLKXAYbiQBW6zgjX8+NJHQ/ZJYZrpl9tGhzxpfN96dxVwhRvjOZkvNpTv
 F/AGYdIOAHVD1hlAWblk/RLaavLCbR3vQ9f3UAJQY4H+Yax7Tuyfp8Tyg
 iLyzpADLO/iSTfbCqDVw5wK9Wq/ywL9QZaIam2Ef/KZ7saGsDneXG2V5e
 v3eV2v5MgnU2c+hz0syQlgfMAs3xpW1ooKoLuXw55oQtWtuUEaXWv9egM w==;
X-CSE-ConnectionGUID: RSpFQmpeQ96rQbQppigyjQ==
X-CSE-MsgGUID: rGPpD+B2SJmhnSkyrNojvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17934027"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17934027"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 07:46:50 -0700
X-CSE-ConnectionGUID: MgLDZHvIRxW7X/FNpvCCAA==
X-CSE-MsgGUID: NPS6/owgS/SGLEhWgnUQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47664683"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 07:46:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:46:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 07:46:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 07:46:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 07:46:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTo80qcXuVlvo4RZULikZMemFfafJg3XEdIphXuaw1mCGG9kFbkg2IRLIFmnajqWx1kwcyNz3+pMj3QBUfpMcPJsQhZwhphRgrnPoC7gdso4bWU5WlLiWLNOiz2FcCKTdDkc4a6fx2erMuzmovRKo2k5R2pyHtVjDBffE29qzzRVyortD8w5z3DDUaLPfMCOIGu4PA7Wo9fEZXtvbj4f8OTKVf5zUyJYoYgKGMCCYOQ2uQDkjK5yOT4jS7QOlDtLuZ9LPzSh0fQNcYPxTY9W3QGN7FzgAHyUGa74T6kjRDcyfEYF610DFZW8Hh6zvFvyKiyzFEsH6c2vMOzrnd0Cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF8p7/l8c2yd25RwQ+EBrxwfNP1AXSxPNtPcuGjdmSk=;
 b=Aic+cjxaVqh5L07hAXBKx2dlbuNQVl6vWHZ0/MRRE+UF2IRobGnM5wcvTFaqQaZ4Ol3ZXNe23fQ4NSQfgZYQm0ga0Ij166yO3OfUig5b5h12IvGDLZQ67mCdcRdRDbQzUwvoShUg26Y3Ee//EwxrnEd9HGtXfnMSa6Qg/9TJ7JxYp+aLCRnrvpxGWXcnIchxBWiyWkTS7qveAJsScY5vCEHXVhvbaGjRa9vOj/XLZ3+jpeUihgQef9K1eOD2989LTT80YdhngRf5WakmGZUlIgwFIapP2wLGgjrovbluCVsnD+1MVTcE2BBlTqCquObkCHln3y/Rn4juC9kU6sAnRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4607.namprd11.prod.outlook.com (2603:10b6:806:9b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 14:46:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 14:46:47 +0000
Date: Tue, 9 Jul 2024 09:46:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe/kunit: Simplify xe_migrate live tests code
 layout
Message-ID: <ydbyrl6mymzzpf2qfqkxspzqb6chvletaqoe6a5fdobkvut2d2@z7rybfx4pso2>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240708111210.1154-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0257.namprd04.prod.outlook.com
 (2603:10b6:303:88::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 13188526-e94c-4648-f8af-08dca025f561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j4YGYfzc5rlqbrZl5naoIIRCBuDKovXXl1uRW+IVtIidgIQx1xcdHrAfZdMi?=
 =?us-ascii?Q?rbWn98rk52Ym8SvyhTdkMxxubKDwkEbWZjhNKCtCbYbOgSrQQeHbHUrH2s3y?=
 =?us-ascii?Q?vX/shCY5wHUmiZ7Aczf+K2+LW8hpkuwum+SCWjiAQt4M5gRCXsCLSryjM4wg?=
 =?us-ascii?Q?5DrVhJ0SDTtJmrlpuAW35EAQpxJIOsRps7oFaxuRa2QzClDCdOBVTB1GrIzD?=
 =?us-ascii?Q?YLSV7yt/nC3IQXyFTRKKxTYQlXEA7mdUTEFJyFN6jBjLl7IifGteGQ/1TIqh?=
 =?us-ascii?Q?Nv+oRHhZuyi/VS5yP2ZcirirqOItaNMYEszs/EzqMZep2J3yMVrMy8z+bSXU?=
 =?us-ascii?Q?QNKBvg+Ocgs5sAlaiR1fmHAwYFEdd/a4PhBUaFyFrpNcYInS2mfz+aJawVaw?=
 =?us-ascii?Q?7IveGvpwYwn1Z7ygw4m3EPe3I/UPorcZPfFraC60q1KYXs3Ur4rQNq8rWvDd?=
 =?us-ascii?Q?2Fo1lXhSxYSNitlHviCKSpd/HueGdccZlHTjki7BaeVh0yxPvPqMkhP2jvBX?=
 =?us-ascii?Q?6vK+/Oo1+V2H9We83l9Mg+pGivoLLdAeoLAKXlgCh2XoCRrUBa+dWIQxK/Ru?=
 =?us-ascii?Q?YOQdeTCngzssCA7AQhQfUlFSPUYAgrIJt/A3Gwjhkgo5QGoS3DW9ig/rruOk?=
 =?us-ascii?Q?1veopYtMFvFy2PjOCrw3PLhHQ2JBlbtJzZ9phZitjYha7D6ZJuVCjtbVMP/Y?=
 =?us-ascii?Q?/aYz8Sjg/BxPCFEGGw5KZw8jOTr2Twtiwel+dv8f39O0EYjImiR9OfY+MWvi?=
 =?us-ascii?Q?Jq0QfhbrRc48bBoqsJlvXg5MtA5vZg4MDlV51NP9mM03Lj6SrHxQzI3yFJQz?=
 =?us-ascii?Q?3Tgp/L8jCL2SFsGukFT30bwlKZ4fIiuuzFS67A+OfmowFfs16g8KN6JPUT5Y?=
 =?us-ascii?Q?AX/HFoLw6rMngnH6JXeDAJmrec9no12QsphdfFS59mAW0boSrFysew77HErI?=
 =?us-ascii?Q?fPFZ377BUiShAQ8Euj8hmGFXsbvwlQBXve1gHinbjV1+iEKOUf2g5Bq8mafM?=
 =?us-ascii?Q?y58NBntdkQDIp4AvsSVnWEkX7FTqaTafaZTsrv0xCjLDjZyWckMrHoYa+unR?=
 =?us-ascii?Q?PwFdoDHEfn+rOWLnUniFkZ4opi8bVP1ZzvP1fN4zUY9n/ORTt5LCyvKPq3pJ?=
 =?us-ascii?Q?FkypABtAUEHboNY09cKm/BdTdu3bzA+3/HpgMpw+P/rEEvK6ykRUjXLMdne0?=
 =?us-ascii?Q?tmruCBna0mwcvzivTmPQ0LQ6xcgNoRGHvAJBVoGT32fo/8rXdoUbE0CRxUw6?=
 =?us-ascii?Q?Pfk3983nbKVw+Bg5bNQOvowYP0D7j8NBBDvPtF1g6Ixk5HxWbfPRCvETBFIY?=
 =?us-ascii?Q?bn0TuW1tN9UIQO8cUO6WnicYzAaZfjTuOsWpw2TAmIdp5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PBzy0M/xP/gBzUUmqDKIJkgwFgdr2lQJFqLG+mtqSc30soobYDqW0e1P7GVr?=
 =?us-ascii?Q?XyHh0wxL9YcX/61FG3z23T5l+VvdeEO6r+VmPohp+RsqCTBTTqJKk71eS5zc?=
 =?us-ascii?Q?LWCmmUAUpILeMhn+HzhCOOmvC1U+EibL/+U9+NCE7WRI5QGRDR11uVUknf5F?=
 =?us-ascii?Q?1n+0kl4pXM+T8oGG/yMLlGypgnO4Y69MML+JKQusBnT7TBpUKuRm1UZ6N/xr?=
 =?us-ascii?Q?mfHsdyu/dYk4dMC6fVWd1yDzkOR18107WYI0mOwiSPBrlCFgzrtVsfpDW66f?=
 =?us-ascii?Q?3OT4YGEryyQcBUVIwLfNcM1624H/SlmCIt5Eh895lvJukN6KRac68TfnOpCa?=
 =?us-ascii?Q?bovyoNH+75h57dQQ011l4B5DGvQZDqOkScCbnlrJ1phePTf49Y9ZH0Ws/C2Y?=
 =?us-ascii?Q?sDgRLyEsi9CBWCNu2P9ZXpZWQGqpZEeFCzWTXvwR5WTJ6r1m3PGAeGYWy9pn?=
 =?us-ascii?Q?96trGdc7r2HPBwC/893aYNxcSoKXwNKsFJtle+LyL/hQHiqw0U8axgiGFeCS?=
 =?us-ascii?Q?HTFD2IyMh7ag0/nAu4KFA6d9UhwdoGythxiTHWbTEAcloer7bm6T8Vil0RLg?=
 =?us-ascii?Q?5pZo6GHOSHt3mc7Ay25TBmamzKLAipga1niEZrdFi9q+AsAZjEegwVSf62VY?=
 =?us-ascii?Q?BeVCNVBT2py+42BdpDmnWmwQir2jno8NYgQ8hC3PAfCYOLdZ9Kqh/t6fWskv?=
 =?us-ascii?Q?7EPaYIiywLchg6zdfV5/Xnh/Dlsj/4a31lbWIYBiffXo77If47EMngNfqdk9?=
 =?us-ascii?Q?Uq5DW3l+rmpXBjybTtBseYsRC/HZWm2mNnhcuzbth5KZ5aloD0KtjgIb5zbD?=
 =?us-ascii?Q?bIbT4hYcMJEdEfLwgG9DBVFE2H8KvGy1jTUwlV9D9J7V/oVqMIJa44DY5NvO?=
 =?us-ascii?Q?pvkI5E+AAT99WvMLDytTb3MnYpW0eGMihthgtZpEn0UHvx1KTmWclKWamnGe?=
 =?us-ascii?Q?tUdlBDI2DAmynVSrcfWtonUgGghQ0DQ8g82/b2y0x89rJhnnc0/KSB2SCN5w?=
 =?us-ascii?Q?v5u/sXGD+A67Glu11HY0j1UZys6Azm76+/+HXn2Y/nV5YVwXrZY78G/Qq4vR?=
 =?us-ascii?Q?HHRgOlu1iy96BL1nPJyigW/2NAveLEgNq/DHrGxg9ZSuwNdRz1FB5r71umlw?=
 =?us-ascii?Q?XjvGn7Pu8/lNvoAP+zbMQfK6ZLZwUJnrzl6YKq676V88JlRwVU8lbQ6B6PWl?=
 =?us-ascii?Q?thnzRuECoqsWzH9uSADjv/f/Lc+1+up9DLG8KyrmrmLzKd5XiUWvbJhUU8j/?=
 =?us-ascii?Q?7h6vu5xScreRz8PIJE/3eIbpRNbImiO1Sw1/h4djytQFm/jpw2A+JjSeRXuE?=
 =?us-ascii?Q?jve1U73D35tPKBNdWib/3bg+vqkiA1f3Fu4Wjh3viVVVgTADzZYNpojYjj0d?=
 =?us-ascii?Q?oZEvvMJ+DsCJUtvDYdE3z0mSxD7FVaDCQcoO5Sbev5VJSZK1OUZTuBa3iNRI?=
 =?us-ascii?Q?fn8OtVXzCOkTZBRCDWUGNkWS7p/VIuZnwmcpQT557FPJYWyyO9ipq6itIp78?=
 =?us-ascii?Q?uOUQSXrravYm6K7aPD/ak8uUzM1ZTdEelCVrxrsIY8zbMM0uvwFceKw6yQSo?=
 =?us-ascii?Q?Mbs5siPVbCC3tmzQCAUmUXSAc9IU/mLqoQSSzvsQ3+B1ftsNxT8ehhxSfdlC?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13188526-e94c-4648-f8af-08dca025f561
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 14:46:47.2093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vILqzKZA2PzfTdoitBpa/QbjlOGkYHC3KDmKovftQ+7EHGILVOHBnQOZcmaUzwKs2YdgAdS0ZWjQgwc5OTbN6r5xXFSXLnNoA91/lXMBkWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4607
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

On Mon, Jul 08, 2024 at 01:12:09PM GMT, Michal Wajdeczko wrote:
>The test case logic is implemented by the functions compiled as
>part of the core Xe driver module and then exported to build and
>register the test suite in the live test module.
>
>But we don't need to export individual test case functions, we may
>just export the entire test suite. And we don't need to register
>this test suite in a separate file, it can be done in the main
>file of the live test module.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
