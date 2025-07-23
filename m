Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A475C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 11:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A2110E12C;
	Wed, 23 Jul 2025 11:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdK9tbkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0142110E12C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753269946; x=1784805946;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DJltrMOmI5hxqWu7wIoSdy0F7w5r413zcaPoniuKCh4=;
 b=EdK9tbkwFnVqvFCbrBDF6U4HPxjaEAxQFKQzhYkE8+Y+g26GmVrHF9sk
 HNn8UeuEC4NGft5T2vPigUaxIkQIdXXp8pN582gCV2aNzV/jE71p963U1
 f3e+mUn6BRJo2DbLDre7OpO0OEvJrH9o+muVx3y1jDm6sLVxU34PrVRaR
 klicO+VLD1jAEO6KKoXr6p24KlRpBxqBZDmLBDYK6Yl81dLulS1jWVhgT
 PhS1m5vrECYbzs2yYeqKq6Rm5GEAj7PQJZGR4OIvDEIxfXaYlhUZek2Cx
 UxCgYTEkp5ipWd2K7hPKgr2ZX/0/OfAf0o5RBcneMJuLQyvri68pAU0aT A==;
X-CSE-ConnectionGUID: qpL3NNJpTCWNxMEa+NW//g==
X-CSE-MsgGUID: 3ATNV9hOQFuQLRZ6STCmqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55490047"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55490047"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 04:25:46 -0700
X-CSE-ConnectionGUID: waVStj5+SZqvDr7a7sE4DA==
X-CSE-MsgGUID: D1SIKi+ZSve4TNeVBHjFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="183145586"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 04:25:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 04:25:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 04:25:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 04:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw1LzBMtsPCJBUVHlJq47vb5236kH8fD7nKhHUPWPWLEm1t6vKTrB0xpUomAF0cumd/4uLtmXj4Gqdy9NkeLZcIzkYOUvqPlW3TfLr5+TTVczThrrhKeaeAeSlBQhyKinUoOYQOz/aWtmKya6Wcqd4x6qez2uttxozihOc3zNRXXNJDKl4mFE8zdNEVBQq8r5hn8hNV/wBZZsTiaZFOjytpazInP/M4kSFy30H+rkgQEuJ9T5qjVD3jmKLxT7qAz4Tjihw3ZLI50lZNxCUK0l+vjLaZE6fioUXosWWl5XBrhW7JHug6Uck17I+M+o6xbTDP/2qqB7VlOleJWR5wnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss3jHIRdB614sJhey9nEfm20vBrRpqXtuNwiD2JxG4U=;
 b=beCJWfcp2ryn8T+NNQa/gTyqh9dH1rZq/62v8ga7+JXQy+PWlueKCuXu6LMKU1JSLJTMe8Jd00B5hVTVtRFnVN7Ic9Z9vUMUA7dW1K6DL+JdKjNi8auHWh+7URTU8/sNhBlptmDMxy+WhKHMTjCBNPDs5UcNJmeYLVKZmsoBFVkYVdyA67GmtTvqsdB+VVxOlcjc5rlq6iYzRoy2/fQcbvERpWFfCLmPCmIodytmaO/xSN3TGM5MCLEIm1mKLiqaG5T1rhHBz5/g5cnZe4Rw/6FMvQY/Ie+QOl6PMj7kMwJukVvgFUUrnV3yPijDcGI4DrsZRH32+8DAowFJYDfMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 11:25:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 11:25:28 +0000
Message-ID: <c9b8ccbb-f399-4258-afe7-394aa1cc42c6@intel.com>
Date: Wed, 23 Jul 2025 13:25:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Improve VF provision stability with fault
 injection
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Summers Stuart <stuart.summers@intel.com>
References: <20250723111325.3680-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250723111325.3680-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fb2b9c-bdf7-4323-6c3a-08ddc9dba06f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHJ3R2dYRjZvT28rek1vT2E0U3FRVkgwaVRVdVlpN0ExMENNWVg3R2dEenAy?=
 =?utf-8?B?UTNQQkFCbCtQTmpobWxJRnhGMGNuYWQwaElZemFielNPdEZlaVQ1YmI1NFVF?=
 =?utf-8?B?aTFMeWk5QkMxaGJxNW9aUFBXRTBFdnFzYjZmN0FSTk8xMEpNK0dQOGV6eUh1?=
 =?utf-8?B?dFlNSVNXbTZLSFJTdFlFazg0LzNRR3NGU1o0SkVFNzVmN0lvL0Q5dHBtUVJl?=
 =?utf-8?B?eEEyRkt1RWdGdUlKY1VzcUU1SHdXRmtQQTBQRGtnUFhaS21rU1RVcytyKzJB?=
 =?utf-8?B?L0pFL2pzUXNSaHYzY2poQkNTRHM4WmkvZEZacWRCM25ER3JJZlFDZWRSVHdY?=
 =?utf-8?B?bGYxaGp0ZUJSZjYybXBWUGNjM0ZvdHRFMitjd3JtY1Z3dXIrNXVUN3c0ZmJJ?=
 =?utf-8?B?a2s3TXpLY3c3Y0hnVDFNckJTTW9ZN2FQbXVwN1ZZNmNjQkxodjMycnN3MDFl?=
 =?utf-8?B?ZzZ1SjBNdTZjZTlJTE9IUkdYWHFHb1RFSUtnOHNzY1pYbENncGF0TzhZeW8v?=
 =?utf-8?B?cFo1a2w2RXk1RXV0L0RiUVlubTd5VTlrUEdFTjBxdktCWTMwM3MxM0JGMFlt?=
 =?utf-8?B?WDhzZDFZV3ZKYmZ5VWFKLzVObnhnV2YxK0ZYR0ZjWDJGUldLaXJXSXZhaU4w?=
 =?utf-8?B?QUxhVjYrS1pwV0NNQlVwSk04YmpNODZvTXhtYTZIbit4L0srTEFobWVSTzVr?=
 =?utf-8?B?WXlOdVJ3WVpSQm1oZVVVVVpTM0pEdUM4YXNxNXFQUXg3MHBhelZiRkZVd2lh?=
 =?utf-8?B?Q0ZtUUM5OHBvZEc5akFKRVFxdkdVYlY5SXJhdHlrdlg0ZWRhTmVFTitIdEZw?=
 =?utf-8?B?UEdheDhxWnE3MGNyUEVKb2lHNTUyTGJoMmlvaTlsTW5FMEhjT3g2ME0wS09R?=
 =?utf-8?B?OTZneGkybnNobHVwVE40UmlVbUNFRUtJYXV3VVJrbmJkTEwzcVc2VTlxdmhL?=
 =?utf-8?B?NVlEbmdnUUYxems3dms0TnE1YnRERlJmVEs5MzlPWU9OOTBXbFpyMVlqdTBN?=
 =?utf-8?B?NjZXTUY2blBwdWczckJ1bDJmYnRHeUdCbmpoUEI2ejc0MUNwdS8xcEhybGxa?=
 =?utf-8?B?dmYyUEFHOGhFajRoSnNlRTRGa3NCUUpoakNEeVZ5NjhmNWxjZ0ZRYXpzSnBU?=
 =?utf-8?B?ZnhYZlArRlNsYUZhcXhjcGRtNEszTGlMcUNObE9GR2JHc2NVRVFuWUJaRm9O?=
 =?utf-8?B?L0t2QkVpcWpOVG5nOXZoQ2NyaWhQYnBkU1ZYUEphU3hpYnZzenJXWlJYZDF0?=
 =?utf-8?B?RFc4cldqSE5VUmkzdWxZYUMvMFZwbTNLR3grZktpME85SDFBTEh4VDFOUS9O?=
 =?utf-8?B?eGh6RDdKWXhVL2J5TysycDkxRzMzSFJ0UDhFOERGcWMrWkNSV3RjalhGajg3?=
 =?utf-8?B?SERaYVlsU3IrQUdPbmdlck9TMjRnUzhLMnpGSmZYSFBRb3NPSkl1bzFyN1FT?=
 =?utf-8?B?a200R2pLQ2NVMlo0cHJzZTg2QU56WG5yR3NRNTJPQm1Na2xRZm5MMEM0UlN4?=
 =?utf-8?B?Z1kxNC9Wc3hoeDhudUwzZCtxaVFoSkJmSEIyT28xdkF3aVI5VHNRampFem5r?=
 =?utf-8?B?dUI3OE1uWFlmUExENjhoOFNFeG9NNG51OUwwV0dkWW8xek54eS8vUy9icjJz?=
 =?utf-8?B?U2cvVUh6a3gwV05ETkJUcWJQS3A2VTR4UW9GNlRhZUxjWGdXNXFTcUhlSFlK?=
 =?utf-8?B?QkJDVU10NEtpU0IvVGh5L3c0ejE2SGMrc3lzTGJURm1HNmNWaHNRU3cvUnk4?=
 =?utf-8?B?U3R2WGVsdzZlVGZrVE1yM1pLZENSSThnQ20wMGpudzhNWmhkMGNsTllYdzVr?=
 =?utf-8?B?aklZNUd4c3dZUHNHQ1F3M3AreG5PNmYvWHpSZ1BScTl1b29RTkovQTBqckoy?=
 =?utf-8?B?SldseDJNSUNoY3Z1L2tBL0F6cHBKajRoTEp4YW9RSEpXdy93NFhzSWEzTVRk?=
 =?utf-8?Q?OmRrYMWwOS4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hzOFdPaUJVTEFIbEE2Zi9teFdNazdsNHM0NnUxLzZ5d1pnK0I1L1M4TmFl?=
 =?utf-8?B?L1ZXMlZqdFA3UXRMMnViRlk2a0ZCc2ZPQkNFODBGNzF4TENFUW9wQUtGNHlK?=
 =?utf-8?B?OU9jSUZqUVZWdWxRY1VGdzJNWGh6WmMxZndHcmFXWCtDbXdSUFVVQllud0FW?=
 =?utf-8?B?ODhnRXVCSkk3NlpCNXlHRjMrWkplNENuT0gyK1RwQkZENlRGK0cwV0xoUDFC?=
 =?utf-8?B?SnY1VkFBUXF4aGN5K0M4OXE5ZityaHdFWURTVVR2VlR4YmRGdm50QjduM1Nx?=
 =?utf-8?B?bmwxbERtTk5wQ0xFVEpRZHROcUJKVzZWeFRPcXc1ejI2V1FWSlhZYWNXZnkz?=
 =?utf-8?B?eWxCSkkyYVlkWmZPd2FlUzZ3Sk9XRFY5aTVMa2k0eFVpWmFvWTF6VUtuUjRj?=
 =?utf-8?B?c1Fja2JXSkZZaWM3aDVvRzhVWHZ2WnErMklpREtwRGNGRmZGT2xvYzFnNTcv?=
 =?utf-8?B?MjBKZUg4dmxJc3Z2M1VQSFVrSnJ6dStvL0Y2aXRoMXFDc2FBL20xbnFFSjJ4?=
 =?utf-8?B?bkRya2l2YTVsYkg2VGhXUTZ0MEZjMmhSQ1FvcTREeU9sSCthTzRGeHNCajBG?=
 =?utf-8?B?QmpWTFpjTCtBZzBFZENtbVRBZ0I2SWxXdkIyRTN4cHR5SDg5VG5wMmVKdCts?=
 =?utf-8?B?eG5nQXhEeC9NSFcxRmFVQ1VMSnJ6Y1BabE1xcnBwRERNcE4vS0Nwcy9HSExP?=
 =?utf-8?B?N2VOTEdQNnp5RkJvS2EyYW5rTHM0eDA4YU1BRmdKaWFwOTBndWR5WmFRdzEy?=
 =?utf-8?B?UWQwNmhQNjljTVpnVUR2WkZnRXB4R2VIaDhML3FxeldFOE8yN2krVWJINHB4?=
 =?utf-8?B?R3Rkd2Z3bmo3aFUyNmo5SnVxYm4rV0ZLZGJKbGE2VnVEOWtuTEYvbzZiQ3E2?=
 =?utf-8?B?ZzQ0WnUxTVRPVnRaVTJHSFY2VGJZdFdQZjBZVDBjWnZZZ3VKTCt6ZzNhTm5z?=
 =?utf-8?B?dHdEcWlNZmhMMTRpR0Z3NWVOZlRQQmhhUms1cVVvL096dWJHSFcrWmNKclYr?=
 =?utf-8?B?NktLOUtVbVBkdkN2YStubjhwT0diN2s3UE5Na1N3UkV5R2VGOXBzSHVKeVh3?=
 =?utf-8?B?SVdnM1poYUp3YzhTRkJpWjdRN2pqNGR4a0drcURuamgvYzhUL3d3N1NEdm9C?=
 =?utf-8?B?V2JZdVNHK0o1aEQzZGZ2K1pJT1hIMFZwK0VZanVDZk95a1BYYnNUZ1lXa1U1?=
 =?utf-8?B?RFMzZEJWSWRzNXZZOFZlMXFPbnc2U0xRUmgxODdSQi9rNU8wZkxUQzdiZkR2?=
 =?utf-8?B?ODdRa09CaDJsWFJTY0toRXRQT1h2ek1iWHgzdmF3OHRaMjlQbGE0RjdHcEk2?=
 =?utf-8?B?T3loZTlJN0FNYjZXYThmMHpEK2QvWVhhNmhTTFNneTRBY28zTkdaQmErSkJH?=
 =?utf-8?B?T2lQYkRWU1JaMnd4MnZIUGptMFgxVm15Qjl5eFBwemN1aGV4TDd1WjhBN1pQ?=
 =?utf-8?B?ZjBNdy9ubk9pazZwT0MzSWFEZU5ieXZWdUNZazZreEtmUDEwQ3EvZVB3RWl6?=
 =?utf-8?B?RjVtemJZRmpuN1lxTG5wTTRteGJkRklvSEJtS2dmVHBQZ0FOTWdnaEtCNW5H?=
 =?utf-8?B?OHhHczFzNFVmM1B1eFVrc2lTT0FLSllUMW5zLzI2ODc0YkZ5OU1nMVJvbDdM?=
 =?utf-8?B?V3hXaXp2TzJpWVpzK3o0eVpXSkUrem4xWW1YRlBWQUNPM21nUysrcEJSN2Nh?=
 =?utf-8?B?UWYybVJyUXNzSlFCNlByc0JjbUwwUTc3YlREdG5FNnZtZk1TdmJ5Z1Z3b1Zs?=
 =?utf-8?B?NWFOK3lxb2t0SkRFdGEweEYwQW5jYkhFaW5UTkpZOTNic0NMeTRaMmRlRG9n?=
 =?utf-8?B?T21SL1pjaVoyNkE4Vm5uQzA0aFNsZ2JhUEZySTF3S3Zua3c3M29qNFdRVWV5?=
 =?utf-8?B?M2RwbXcycFdsZlVvWGljWWRWVys0SDloc01yZUpqWGRtWUEvWU5EaDdYaG9Y?=
 =?utf-8?B?K2NhcjByYTl3aGF4b1JnRWVFeWp2cFBxa3htaTlSQ1M0VmtZY09DZFZ5YTJ4?=
 =?utf-8?B?elVmQUxLdk1BQ0poSzBEak5WVEp3NldvdkdVZVN3MnlKOWlXTHRtM05lSmVD?=
 =?utf-8?B?TUZ1RTBCSHh5a2haTlk5enBXZ2FqblNkcUVERjNwZE9hVzRraDZFc2lIVVoz?=
 =?utf-8?B?eWtnZk5FaG5HdkFhaWVPNWxVN3FzdXBzdGx0aGZHN2gxN1gzMzdYd3ZwNW51?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fb2b9c-bdf7-4323-6c3a-08ddc9dba06f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:25:28.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wq6f5QKE6y8TvISLj7t3Ki/XAKIitmcab1sQcmr23BtOsZi3gkiYYsLclhfE1lxyl1vFnxTwoIF2DBu/7Kw3vh7Y58lYZ8BmodQrRKsZH6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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

On 7/23/2025 1:13 PM, Satyanarayana K V P wrote:
> In unlikely event, due to PF malfunction or misconfiguration, VF may
> receive incomplete or invalid configuration and it must be prepared
> to handle such cases without causing a crash.
> 
> When simulating errors with the kernel's fault injection framework, crashes
> were observed during device unbind. These crashes were primarily due to the
> use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.
> 
> The GGTT is invalidated using CTB, which is allocated with the
> XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
> freed before GGTT invalidation completes, leading to crashes.
> 
> Similarly, for buffer objects allocated in memirq_alloc_pages() and
> __xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
> invalidation occurs, resulting in system crashes.
> 
> To prevent these issues, while invalidating ggtt, an additional check for
> validity of ggtt is added which avoids sending CTB to GUC.

s/ggtt/GGTT

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Summers Stuart <stuart.summers@intel.com>
> 
> ---
> V1 -> V2:
> - An additional check for validity of ggtt is added in
> xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
> from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
> (Summers Stuart)
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 086c12ee3d9d..145b5f90e347 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -294,10 +294,12 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>   */
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  {
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int fw_ref;
>  
> -	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> +	if (tile->mem.ggtt->scratch &&

if ggtt->scratch is the only good way to check if GGTT is still
valid, then maybe instead of checking it here, at the GT layer,
test it in the only caller xe_ggtt_invalidate() at GGTT layer,
for which this is internal data, while here it looks we violate
layers by looking up again to reach tile and GGTT ..

> +	    xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>  	    gt->uc.guc.submission_state.enabled) {
>  		struct xe_gt_tlb_invalidation_fence fence;
>  		int ret;

