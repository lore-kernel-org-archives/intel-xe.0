Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427CC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 13:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD8910E02A;
	Thu, 25 Jul 2024 13:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWJ1rohR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125410E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721913345; x=1753449345;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VPZZPHy6bevLXv3IIVB7SRwC8ncdD7LFrw+CJvWH/xU=;
 b=iWJ1rohRI6RlI+FGxX2aw10yRlO65Uva13iMobPNdqENkHEeouCNGGtZ
 vocUu6A7btLObP1PuiEq1FMEllFcjcwMv/UULmfFq6Ht/zbkWoSmgSC7q
 mVT7NvM+fxqTvzCGSwtpUDZuPCZRNJJnGYwanVl2JJ64cdKvs3eJDc+km
 T7PB22DvrdUSLIKe4Cf9rWQtrY1wxIoRKT/y+hQTQeJ2SqppslPcBEhTH
 4esVCKEstqkFv+LKiM91gvcw7hRiocczklNWTSkGBUR0shv0uTCjgqDP4
 6dZt2YwXo5Tz0sbpbJC5dCBvP03f+/Q/cv3NkV271/lWpdsY680pQUXcN A==;
X-CSE-ConnectionGUID: Alm7aX9iT7qw8B/bmtx9UA==
X-CSE-MsgGUID: eSwRNYvAQou9Q9CgkgeD5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22557961"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="22557961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 06:15:43 -0700
X-CSE-ConnectionGUID: RQzjXlQaSI2oYMCcQdWFkA==
X-CSE-MsgGUID: g2g8QrJXSRC2qNrb6A8YAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52999253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 06:15:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 06:15:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 06:15:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 06:15:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 06:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCxIvnk+BcVmbFtKk8KV0Swc+0VZlovHUzcqmQgmwC7iyV62yxoyLtpXgcFD4Tlqy42RnbqPrvzV95clyQKZAwd5D+b/6NOtbhyKW+LwLGqGBbtFn+szsYBm7H01IpixN6aeFLL8KO8+/1Rc1ziYZDVTNlltRxpaRlO/6qP41GPddnFg/vf9iPqduS9bgsp+modHmf6hfBcwKiVSwDTo6KAWcYYe7Vex2q4TPCeVZ3YpkGVAdqsCe+pWujD8y3XtQwr7JchERFweZR26uSYZ2ApQbMPGgT0xv0kipw8/LzknoDZjcnf8n8AvVELXp1AtCueKXyghKTmb5pb7LhRZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lu7eAx3Ysp8tR0hh6kpwB+82ZRffHfCBpE9VTV1/7w=;
 b=UmXAmyON254B2Tud18V8xZS1R+yCq5S7ymFnACHplxaYWOd1R2vslByQZIcYnrjv5IP9m7Uo9q8awmrjCTkkxiZr63M9+T/R5u8zaCsxWB6cDyOc+FPiR3G+0LfC6fdqOFMeLHA6wq3bj6DV+VwZy4/vWzm5hXxlADh8s7YFvxkYsHwS1Jwma+pRxR/nQuj103q+mMEfw/n+fnosf4ZgIZ3s8R8RfmZ6ZqIjjOtBgcIolRUU7J6q8C7BaX/+IvdPeLaFp410UFnXMaNynCOK1POZmia4wgt+sK+KMXJF7jv+jhYj3k+hMOzYk7qaqbRkvbxzycMaN+SmG7h1EtOB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Thu, 25 Jul
 2024 13:15:35 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 13:15:32 +0000
Date: Thu, 25 Jul 2024 15:15:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Message-ID: <ZqJP7uoOCf-H4igI@fdugast-desk>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
 <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
 <84b81613-0580-4baf-85fa-a1025df8d8d2@intel.com>
 <1bce8ff9eaf181193401ab2eaa4337a4f9dd7dd9.camel@intel.com>
 <fcc4e0d9-7218-4fdd-a1d9-56636e540ba1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcc4e0d9-7218-4fdd-a1d9-56636e540ba1@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f9f7b6-d459-4f5f-83a4-08dcacabdd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KrpxXY0s9ReKTmhcN96sPsV7pSzU6YouuahObDRxE4RufrrpuQ7+YIkMbx?=
 =?iso-8859-1?Q?rbr9MGiGEDgVfVNNdHPEawO12x9KxhRfh0dLtxTgyftFXfdIxOcRks8nq+?=
 =?iso-8859-1?Q?kqngx+jvlP0j1sgAMvqTtLLhC0v40wMK7/yK1cVQT/tdhelg4IjpAD3WM4?=
 =?iso-8859-1?Q?yn0qp03FU0lcRA4spevmfS/gaKJm8UNucy2mlbfp0qPW5LKIisZ/Q1+cjw?=
 =?iso-8859-1?Q?1SaLNi64HtvH+C4ZEk85japhVxJVyhPPS9Lbj+UuRb+rZL7slWlB5qhiyy?=
 =?iso-8859-1?Q?M4avreMNQRlItD/HiW/730wMZ7fAjiIFdeWmvGwQ73Wa5dT7JSVLHBrjvb?=
 =?iso-8859-1?Q?lpN8Qnq7uoyPXxi0JpCoGj7r/tupuwqE5AjqSM1wHmFChjJGxJanNI54+F?=
 =?iso-8859-1?Q?QzmHboiZIH0IvRhm5fjKl6NT3tkdvbpDqnsxEwJJ2SruCVnur70sMRb10f?=
 =?iso-8859-1?Q?aM63BxT1j8YXUgIuOGR5OEaR8w5fUQtQVohzjjFPRTYOaQKHV3qBuMT81O?=
 =?iso-8859-1?Q?o/dbnleSoSTYuDbmtRIiD1YLqe6yGAGogUmqbjftVVrUVaJM68bKdxkPKU?=
 =?iso-8859-1?Q?hzjI19KhNe1SJY0Ymxgq3SvQKHOv4uySmiJ4D6yoikde34Ik2odWlThw9U?=
 =?iso-8859-1?Q?cWNI+173uupXDHvIWpPhSCjvkYanlAnC0Mtic5LaZFvHT+vMf6w9IsvH/R?=
 =?iso-8859-1?Q?/8qzQH0diD/4KnWS3QGKyCu/0V1e8Czh8GeBx7lvwyAU4IHhZtmzoUuR/c?=
 =?iso-8859-1?Q?ExwjlwLP0XaiXGiOdYwkK7homi2qVyOpwrNMffqoOq4vc18Ij/1yowOzeX?=
 =?iso-8859-1?Q?H6zlkSKY2XQo7YgFJVUOvfuPtuWmJgzhvQpimRMxFarCUrUbvfi4Ya7bnI?=
 =?iso-8859-1?Q?yDAuJCjvVKsxq9hffU9eXYCiP0EzthkrOib5zxhUNL28FzzBFrjDSawb9C?=
 =?iso-8859-1?Q?e3M9wr8NDWI/19A+wdP8WSEPQ2suTUZqa7EYV9DkFTPlChvXEArddej4xw?=
 =?iso-8859-1?Q?5KX8cqZUWeJcSXZ1ITQs+RPdxzCsv25Ta9QRN5GBA0P01rTx1qJDM/FkbJ?=
 =?iso-8859-1?Q?tB6MsOj9xkwztzjIQZ86u5aZLDmvF8WXlLRJ79vkFyKzVZuIWSxqeutJKB?=
 =?iso-8859-1?Q?gOSgBS+qJFVG1JFS5p10U63TjCYivJHzhrphyqL+uoKEFoQmaVIF9UVFOJ?=
 =?iso-8859-1?Q?rrY6G+wbI4tOW21FrFsT8iuLMbH57TTMOmy5mBSlhQzeWRc6CS+CybhseE?=
 =?iso-8859-1?Q?xbLaJe34VdS8221yRPmKs7lJ/XMAmVWUsuJzA/0XCkv6zY1C+KGCFttO9+?=
 =?iso-8859-1?Q?1iTy86yIbJObFT/kOAVws6zTpGKld2VXCn86WMxEZB+daYzIK91EoxT5It?=
 =?iso-8859-1?Q?RAvsozUuYBlaFr4Um73tHU6328hycyQw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YSY8Sjrl32mF/5LoxakQxCdloEDLTA287dl+5M/nKmKsTQp83AI5u827Mv?=
 =?iso-8859-1?Q?gZDNG0azH9MzV3dTS2mkwFZCRCI1QW+rwOC4gmJ3rmYwjubBPF5QYkO3OB?=
 =?iso-8859-1?Q?/g/lOoXSZ4wUQbgOOKFZz6KnZ4QyX2ihGMuOWk88omgRRoW5VQSN0InIP/?=
 =?iso-8859-1?Q?Ws9o020w8WT3qU9nm39jxPFN8udElxEcwzx1qxbrrYgNOrMlRSvDs5dJ8f?=
 =?iso-8859-1?Q?MSqOLKB8P+zEth4mFH2a2DqYPYWNfQ14SAt5nJBW81TjlBIxIp1AqRNo9a?=
 =?iso-8859-1?Q?SXjFZJrzSREg9G6ld9c8zjRYvA+zsQnkULnzJqoyhGTXHZP/i6BY1Z1lmr?=
 =?iso-8859-1?Q?N6HPVviydGS508YCw6UT6i/U6aIdwv36vLIifx5fjr6uTBXb+4iIDc017C?=
 =?iso-8859-1?Q?Gm69fibUfg2C3qoujtX9KIC39Bk5+Oj7XIAacqcKuNbhHXnWNBU+I7hetM?=
 =?iso-8859-1?Q?aoxg4zJrrM6eLY5JQQhmyiPEyMooVncqxHDykf5Z/z/3hQGm97IHDbIyc+?=
 =?iso-8859-1?Q?7mMaxHHBV/kfTnIlBynZT2qcMJ98ckJnaLwq8wRZFGxyN5TUh5+S2W133n?=
 =?iso-8859-1?Q?qAXK8dtDxDKuxm2v4AQ8+3gOnGUKi6Y9eEe2YVahOranIyxDtdu3zOvqux?=
 =?iso-8859-1?Q?14T97R+qROXbSfUlDPM1cziLiPD9izFIFDekt+d5kexOHt4LAWfp2aig4f?=
 =?iso-8859-1?Q?FK42QCGoAghcYNyldethLqZPY25Z6xa+KRBZclWY+uOEp7xbh1U7ngDwGO?=
 =?iso-8859-1?Q?n912f7V1zMCfNO0a2mnQBTtKQtNzoTGZw6CPOuSPr5yxxiepEXZ+gTrwkI?=
 =?iso-8859-1?Q?UkF/tvLvjCgyZa2kaAYsY3us32A2lO1gbIlCLq8E4i6+d/r4N3SN+us9mS?=
 =?iso-8859-1?Q?X1uCWvo9j9EFnyouIY67kitAvCQ/fgw7L7EjoPIYVNBSZwAbSpn1LgAiN0?=
 =?iso-8859-1?Q?KuJePuGjRbIUm4AFm8CJlp5uqMdYHKkxco2i7qGAswRlgRihxPzIIB805w?=
 =?iso-8859-1?Q?q1wjaFvVUyLZWcBaTcUKXqS8Bf+hlEOP5cxQZPRXkvzO9mBJdbySk7YYGf?=
 =?iso-8859-1?Q?TxntpqGZjKhpv0cRDhEXg6eUps1Y9iXUu/Sm+xfWzXRtSCNQE9/tUpGuBh?=
 =?iso-8859-1?Q?e8XBWLmISRBiwpjjsDpdUGcvUoB26NmFdFK1aWyO88QD81IjPuQAJsGGPJ?=
 =?iso-8859-1?Q?hhEI2gRlCIBO02PHLN2Nt+1bVIcZ/LK8zOSTMw/HwTme/9xK5p5yhOGcxK?=
 =?iso-8859-1?Q?JKLCsKAQSLbCUFYsdO3/2sObjv0H5X/8NG0go+BBx5MMTCXfLCsKUJpACc?=
 =?iso-8859-1?Q?PytQ3PaVbP84CgWRnIiIwf0vsS0QV/hrsE3vlNcUIzh/2ZzpD7Y3O3pO5Y?=
 =?iso-8859-1?Q?WFoZa+opRT6K6DDuqIHBfiehuj28I8jf9BNOMHRaw7S5TFOZhtfnXpVPzK?=
 =?iso-8859-1?Q?nbpZ4OD5+wX1H+R/28Jx1bGWkAiU/o0qu1vBRlOYqWfoOFfJkVpPtICY85?=
 =?iso-8859-1?Q?sj3Bs4MPV5KPS9ahZ695kfEHAMX2ge6rM+WtEA66eUz5enND/kN+0BFym7?=
 =?iso-8859-1?Q?P6lnKuy5zFTF08BigiQzVKo3woD9G0++bUe4LgbrGxQgX1ootEjiBIyBU3?=
 =?iso-8859-1?Q?8uQ6zANKQ43Lt+DYQlVFFY77ooac6M+ylwB7Ff6N172jQniBurKFtQPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f9f7b6-d459-4f5f-83a4-08dcacabdd05
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 13:15:32.8309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oumGJYbtpA/QNkdFq70igUIHA8taFjmQzBDuRE5Svdse8QohI4QEAqPZRSRhOuWZ32OhsASHwWL/a/8+KaDGobHfZl2JNP+NfNmYc5vXlHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Sun, Jul 21, 2024 at 12:45:47AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 15-07-2024 23:44, Souza, Jose wrote:
> > On Mon, 2024-07-15 at 23:26 +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > On 15-07-2024 19:35, Souza, Jose wrote:
> > > > On Mon, 2024-07-15 at 16:25 +0530, Himal Prasad Ghimiray wrote:
> > > > > There is no need for converting regular address to canonical address in
> > > > > driver, therefore remove unused xe_device_canonicalize_addr.
> > > > 
> > > > I can see several places that should use it but are not.
> > > > Like every place that does xe_exec, the address needs to canonical in Xe2+ platforms.
> > > 
> > > Hi Jose, Thanks for feedback. Isn't it the responsibility of UMDs to
> > > call xe_exec with a canonical address ?
> > 
> > Yep but xe it self also does xe_execs.
> > 
> > > 
> > > > We are probably not getting any issues so far by luck, so I would not remove it to add it later.
> > > 
> > > Can you please elaborate on what do you mean by luck here ?
> > 
> > We are luck that so far none of the xe kmd internal usage has a batch buffer with that address that sets the va_bits - 1, if that happened the address
> > would not be in canonical format and HW would not execute the batch buffer.
> 
> Ok got it. Thanks for the reply.

Just a thought: could be good to add a test for this in IGT.

Francois

> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_device.c | 5 -----
> > > > >    drivers/gpu/drm/xe/xe_device.h | 1 -
> > > > >    2 files changed, 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > index 06cebaffb451..eb3bb434b180 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -885,11 +885,6 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
> > > > >    	}
> > > > >    }
> > > > > -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address)
> > > > > -{
> > > > > -	return sign_extend64(address, xe->info.va_bits - 1);
> > > > > -}
> > > > > -
> > > > >    u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > > > >    {
> > > > >    	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > index 0a2a3e7fd402..14d4171c467e 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > @@ -158,7 +158,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
> > > > >    void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> > > > > -u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> > > > >    u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> > > > >    void xe_device_td_flush(struct xe_device *xe);
> > > > 
> > 
