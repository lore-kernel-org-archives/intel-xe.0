Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7025CD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 04:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B05510ECA0;
	Thu, 11 Jun 2026 04:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6OkXcp5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADC710ECA0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 04:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781151582; x=1812687582;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K0vv5SerYJqCwjp85eZjXGQi1G/AtrYos1vCIDFOQ0c=;
 b=P6OkXcp5ffXtzQDikqR5UmcH5bvcn6Dj3CE2hRvhVJKUEak5t8Ye0dBW
 kmSGV+jtNFvK3WrUzRjxYhpCZ6txEzmmOvsG4Wm75twOnEmeBIIo0OJWA
 XaW59DZcuCWf47PlFs6O93z3JGIFit7cB0XT1uItp2j/LjAv43A2+I2Is
 ci+KxKZ3WtD2908cl7Mf6ri4iIOC9fy72AnLi92OIDi63t4hfRItyBniq
 ylfRzwO+olxPbXdQKT5kwTdoplpFczLpT8AryaEBn9YWJH4cVslaC620e
 xL3ppl292PjsBOETI1oHbfJgqqSmzymLb4UlWxiwzYytiNlXf2MTcIXns Q==;
X-CSE-ConnectionGUID: dCdu+zyNSgOal3P0WFif4w==
X-CSE-MsgGUID: rux4PxGsR0WzFweJ1+LkwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82065818"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="82065818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 21:19:42 -0700
X-CSE-ConnectionGUID: 8G1Lso/AQ4mAyn8PGU/GIg==
X-CSE-MsgGUID: UmdFg59tSgm24AKxAmM4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="240020530"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 21:19:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 21:19:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 21:19:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 21:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obVGPg+UB9uPE8JZ9XlUZgGDzHgZRn8E5pSJPmhU9Rv534NZPohxl0mPRKtctXjYgEfxopBNWo3OMsUT6rfa0n0YJGxd4NkzhjKK3BZHPF9wAZOUM4FE0cz+p48FXTM4w9OK+5NnRE1+3bvMEWfYKxrP81rPxGNfRP6QFSKyBpP3BCmdtDRL4384WM+MaxZFw2JzwmXjADG9/y0JShqB/pGCaiOEm+NpCOlhkxj55zfdJB5L01xm16QbH+dAnp+PcQKiysjxnNIhhUAeGrFOL9m6/2Je3uRIx6D/JQkUVVMvdXWuD971pq8ZnTZJrX54/XttYCRJo0SeqY6utEcPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcjulBe4dG3M9d2UQHp3i6rAYSRm4KlQix+ao2Sw/KQ=;
 b=y8bycGCl3UW5xQsrxsx9vPAKEs87otsteI74PQL3331rnHMzh0OVb4ESVDJrEOcmAzWkUekM7flO/doXwJ/ijjLrmKuRzTMOE+BjGbKKBBVOdTYDfgr4FBMpXBqyxtSzpcWr3sZxv8DCFNzZ94kUUghOPFiwcluoDv3edoMYOm6MrLZPLAqLSZC5Je7NoG/RZ94G2YuJQI3S9J77JC7oKS6sWNgxNOY4gXC57T2O5BXHYoU94bslkKA4fZUYImc7s8U5V0F/7pS2n/3GYcWR8ih/dfAgxV8ZMw/V5VyCBRw2CvffK4JGrRqaEg5/mmlvALHGLHXXG3f6bw2iGr5sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 04:19:32 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 04:19:32 +0000
Date: Wed, 10 Jun 2026 21:19:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/multi_queue: preempt primary on queue group suspend
Message-ID: <aio3UTA5FBDMnUDb@nvishwa1-desk>
References: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
 <ainBeTIG8DkoxI4G@gsse-cloud1.jf.intel.com>
 <ainYa3M6FkFWUpaG@nvishwa1-desk>
 <ain+J8bCGhLtnCJB@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ain+J8bCGhLtnCJB@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 9347c22f-2ee8-40cb-4f15-08dec770a367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: a8bA7J50q7kn+qb2PzJQcjm1Zraz5YEa6AO/JJzuhCE6w6kQft9wCq9lYDjcrKbGF+PkmMeR1JoYd+i0RLg+YAcmdf/QRxpavHR97EQZW4APb85hWlN/JPpkKeXgCKqD3dEhmXwkk0r3V9vwC2X8f5L8HayDxOJ12YW8kZMqe3N33calTanYZNG9wxgSh8URIrlzkO/xSKMcuZvTlSjRwlFE4a5vGFC0iISRdbovD/DSr2SpEnhNqo5/7fVWryGgjv7Oo1sfYT4jWUXAlpVr5iJjcmgn5DqQVcCl1bWCTzGr+Fb65pG63V9UDZdOM6Y2TAqucoqAQTn1xVvUBw+7hAi9i3B8WD62Yl2oXHn7O/caF2UQLnVQunast66Hy+wEKhx7jXTOaNTmDSi4LrP6ZZ/ln1tMjK8rhIHqubKw5kAv6c7GthJw8U08KKe97MT28PrXhdLXzHMKy89hK4/5Vl1cXOft8YgvyZy6FoHK7hDfQnVyG3L7j0fLEhtyqtUMc1JoGxrVghPZUtLoARWHrD1VTko4WT1CmVIyIqOZoh5bSH3brH452AlF4/01ifizhdSVdPg/1p846XtutsWzrsyo4vW71lh3TxmkievnwV8vgwgjA5YNHQBblutpleBVzsYeY5Gc00VvytpSmmhtrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zll1Y2lkWXBkVHV4REdGZ2I0K1ZDOHc1SExKR0JnazdTb2NuNjgzTmcxczB6?=
 =?utf-8?B?NVdnNWJmK1dHMDY5YS9HNVIzZFpHZm94b1JDV3ZoOE1waWNXUXk1bEZsSlM3?=
 =?utf-8?B?TUlCZFVCNU55QWVWbTRxUkVuSDBTK05WdCtvVjdyaTdmUU9mdXJDVUt3aUN4?=
 =?utf-8?B?elljQnM2Q1o1cW9ETWkzNFpEc1dHNmlhdng3eWpYWWlKRmpZSlVNYm54LzI3?=
 =?utf-8?B?MGRGRklMakZnTlhlT3RnMDdvdjBQd3Vkbno5NkpTcVd0YzRBSmp3MDRqaDE3?=
 =?utf-8?B?TVgyTWFpVldnQUZpaDBHQnZQTVV5OEcrWmRPMkpzZ2ZNTVJxNDl3dmN4RG04?=
 =?utf-8?B?OTFkN3VSV2liVU1CQy9kbnpMRi9nR2E5RGxnSHYzeUtjQmZheDFCSzBaS0Fj?=
 =?utf-8?B?aDUvaXhiT2NVc2xXRHZtK29qWkZicVFJUU8rVFBCQW53aUsxY2JFeVpFdG41?=
 =?utf-8?B?ckRHaUpiSytDOTZFVzhFRE01d252SkxLZnZjaGZIdTZva2tBeVJmaDVXVzBl?=
 =?utf-8?B?UUtSbk4zSmJaLzFqaE9DalBaZHBZVHBLcUo2OGU5TmNOK2xqRVJZZzBMWmxL?=
 =?utf-8?B?WS9naE1UZGY4MGl6eEQvMGgzanVpeU5Ganh4UzdubWQvQVFNUnVtT3c4M2NQ?=
 =?utf-8?B?cXlVK1B5RzNiTmEydGpWOHlkc0RwTGZ6SkxUdXNQVG10aExObDR2bGwyVDl6?=
 =?utf-8?B?eUJ1TFljQk95emM4QVRYME1zZkVSZk5FT2JVQTd5aS9FbHVpekRXUW5kMndp?=
 =?utf-8?B?NFphdzhUMXdCQW44OFlGR2VCZTFNNCtTOGJ6ejVPWUxDaG1YWUJSNFFzdkl4?=
 =?utf-8?B?THJsd2h2ajdhc3hBM0JYK0xzSitoUWhVUWdUR0l4OENCRlVzbjdlamkvMWx5?=
 =?utf-8?B?RzJaOEpKZ29kU2NvSzNtRjRyUmhDVXNpcG84cXdZa3B6MDdWcEpBckhUQUdE?=
 =?utf-8?B?TTM4aTVyaVo0ejJHTER3V0JPY0ZqNnQxNjA3Z1Z4U0dud3JYVE9yUk03Uk9q?=
 =?utf-8?B?a3ZXSEh0Szk1dUJSNHI0T2JwVDVoZ3ZLSldBV0YyNmpkRlpZcGtmaWRLSUdR?=
 =?utf-8?B?RWs3S3BjK1ZtbldzU0Z6dmtZOFMrVkx0ODlYWWZFeW04QkhBNzdpR0hGRFE3?=
 =?utf-8?B?SUdiWUZzWUU1QlRZV0hMdVU1MWJNc3BqMURscXU1Ui8zOFZnUWRyZlR3YWs4?=
 =?utf-8?B?RmhjVytTY0dZWlR5NW9nQVJKVFg1M2dTd0NqU0Nwa1RPRndwN2pDTzVZbHdV?=
 =?utf-8?B?OFRqSmhSZzF4cVVEeExmSXBjcGVBUXhIRUIrSzN0N1NCNDdCUFp3RDRsZi9Y?=
 =?utf-8?B?VVZLSm45SXJXKzVkSzVudDIveU12VlR5TkpZYWFrbFNrM0tNa1ZrVk9YeElO?=
 =?utf-8?B?OXR4M1RGK1NaeVMrYVIxOG5NV1J0clJ6MzAxbVBGY09uNWdoM09YR2hSYlpF?=
 =?utf-8?B?aU9aNWJFNERZaWFTdjg2N1Q2eFp6TkdOdnA0ckVXK1FuU0I0cWdoWHVBSjAz?=
 =?utf-8?B?eTZTaVhqaTBCY2RQTTBHWmNrUVVyVGlGVkZBaTVkSWxaNWRwSDg5NmtoODFJ?=
 =?utf-8?B?WTd6aHRPMzNaQjBxRnI1aDJrWVp3TFVWQ1hNZU5MK0FRdUtRNTBOK1AvYUpw?=
 =?utf-8?B?WjNrT0ZydnJtMjM3UzduenVCOCs5b0EzM3JCa3BHSTJSeXpnTE1rdXhxV0g3?=
 =?utf-8?B?NmpYSDRQRHFuNWFyYnJ6T2NaNnNnM1VRNGxUa25kQ2pJdjVuQkVDZTNORDNJ?=
 =?utf-8?B?Q0RGRTZHTUEwRkFkdU5JY2QvSnJlWWJrV0crcWdMQ0thN1JlNGpFM1lyOEFP?=
 =?utf-8?B?MUtuOEEwQ04zNktFQ2h1dlYyU3V0Y1hKUkdCZThMV2duRnhwT3NNbmk5VGdx?=
 =?utf-8?B?bVl3L054cGx2Tlg4L2EybUJDTE1oTkt3WExWdkdoUDU4L2E1Z0t2dy9ycHJu?=
 =?utf-8?B?RXBzQ0l4ZTVQSExEemx2U1k3TUo4eStlM0tpQi9FSEFrT1BlSDk5dmorbzMr?=
 =?utf-8?B?elVVanN3d3V2K2t1NEZ6WWREb3ZWVnhmQjhwSVBZRXhnVUJnRE1wOUtycVhk?=
 =?utf-8?B?eHRMUjdvcEt5aVZoVXhad2FQZjl5Sjk1OEpySnhnK0dwK2l1Z0Vtai92UFpT?=
 =?utf-8?B?Tk9KbGhUK1hEZDZZeXFQM1RhNGQvZ0c1TG4xcEU2YmdHang4eHZ5UkZsTnVU?=
 =?utf-8?B?aEJDQTQrekJQbmtyTnJzbjgySVkxTU12MDJMMmRuZXc2ZjN2QWh1b2NtVUpP?=
 =?utf-8?B?MlhhMnBHV3g5clpXUVBibW9pbE1KU3ZjenNVdkhqbDZHYnJUdHdrSENzWkhw?=
 =?utf-8?B?N3E5ZlVOTEh5RUh6UmtvZHo5UnBaYW1HbXVRNk5wcCtZSmh1OTBxbElEdU5X?=
 =?utf-8?Q?PvOGPVPJBXoRwss2Q61NsKoMbFqWu2+vYSDcG?=
X-Exchange-RoutingPolicyChecked: oNquWRsRGMWI+uL+cAmjGOV0jv+R2QjUUpG+cThbkUEE7/0OxyJw/YQ2S0l6vKfKB3qzjbpANXA1LF9o1ycCv2tzTUeum5DuORy0FGrjIAyIzJvNIUY75zfAyuXs14Vzvz66TcsiLDrg9tS7DMzYkRlqSgYG3eFuaPBknzCK7gqMHmLMUWm1sr6gvxPBL0UPJ1aIsA6UxPtcrFD++KSIh44Peo+Wpc+HNsrKR3hNx0KjWGBJ5kQXRR6wV+Sm4X/UKbBpvMjDcOqernpSbzD6Baoj0d1XbvQTbiVwykPMQfw2s88IRMmhmYLX9m00MQ6cR12F67dVJPou8iu/N55NRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9347c22f-2ee8-40cb-4f15-08dec770a367
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:19:32.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXEiiQLQMUZtysrt6uhFVeqFQdoxnKDFf8MvhF0pNEIfHykeMD51PiiTL+JGPZ/+1D0Bn4gSNAyWncDC1WXateKwXaFnF5bWmUZg+OBMi2TLVl+WUwhvYMvUKDWNOtWZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
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

On Wed, Jun 10, 2026 at 05:15:35PM -0700, Matthew Brost wrote:
>On Wed, Jun 10, 2026 at 02:34:35PM -0700, Niranjana Vishwanathapura wrote:
>> On Wed, Jun 10, 2026 at 12:56:41PM -0700, Matthew Brost wrote:
>> > On Sun, Jun 07, 2026 at 07:11:00PM -0700, Niranjana Vishwanathapura wrote:
>> > > In a multi-queue group only the group's primary queue interfaces with
>> > > GuC for scheduling; suspend/resume of secondary queues is handled
>> > > internally and is not forwarded to GuC. As a result, suspending a
>> > > secondary queue alone (e.g. on its preempt fence signalling) does not
>> > > disable the primary's GuC context, so in-flight GPU work of the group
>> > > is not actually preempted.
>> > >
>> > > Route group suspend/resume through the primary using a group level
>> > > reference count. The primary's GuC context is disabled on the first
>> > > suspend of any group member and re-enabled only after every suspended
>> > > member is resumed. A per-queue preempt_suspended flag makes the
>> > > resume-all-queues-each-rebind-cycle behavior idempotent and keeps the
>> > > count balanced, including on queue teardown. The secondary's own
>> > > scheduler state machine is still suspended/resumed internally so its
>> > > state stays consistent.
>> > >
>> >
>> > Overall I believe this makes sense. A few comments below.
>
>I just reviewed Thomas’s patch here [1], which is conceptually similar.
>I’m wondering whether you should first pull into Thomas’s patch [1],
>rebase on top of it, and make the suspend count logic congruent between
>the two patches.
>
>Matt
>
>[1] https://patchwork.freedesktop.org/patch/727811/?series=167032&rev=3
>

Yah, as Thomas's patch refcounts the suspend/resume, it will simplify
my patch here as I can simply suspend/resume the primary everytime the
secondary is suspend/resume'ed. No need of separate ref count and
status flag. Ok, will review Thomas's patch and rebase mine on top.

Thanks,
Niranjana

>> >
>> > > Assisted-by: Github-Copilot:Claude-opus-4.8
>> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
>> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  17 +++
>> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 173 +++++++++++++++++++++--
>> > >  3 files changed, 181 insertions(+), 10 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > index 1b5ca3ce578a..df95855a3d61 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > @@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>> > >  	group->primary = q;
>> > >  	group->cgp_bo = bo;
>> > >  	INIT_LIST_HEAD(&group->list);
>> > > +	spin_lock_init(&group->suspend_lock);
>> > >  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> > >  	mutex_init(&group->list_lock);
>> > >  	q->multi_queue.group = group;
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > index 2f5ccf294675..30c5dfcc58fb 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > @@ -62,6 +62,16 @@ struct xe_exec_queue_group {
>> > >  	struct list_head list;
>> > >  	/** @list_lock: Secondary queue list lock */
>> > >  	struct mutex list_lock;
>> > > +	/** @suspend_lock: Protects @suspend_count and queues' @preempt_suspended */
>> > > +	spinlock_t suspend_lock;
>> >
>> > Can you mention suspend_lock is nested outside of the queue's message lock?
>>
>> Ok, sure.
>>
>> >
>> > > +	/**
>> > > +	 * @suspend_count: Number of queues in the group currently preempt
>> > > +	 * suspended (e.g. due to their VM's userptr invalidation). Only the
>> > > +	 * primary queue interfaces with GuC, so the primary's GuC context is
>> > > +	 * kept disabled while @suspend_count is non-zero. Protected by
>> > > +	 * @suspend_lock.
>> > > +	 */
>> > > +	u32 suspend_count;
>> > >  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>> > >  	bool sync_pending;
>> > >  	/** @banned: Group banned */
>> > > @@ -176,6 +186,13 @@ struct xe_exec_queue {
>> > >  		u8 valid:1;
>> > >  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> > >  		u8 is_primary:1;
>> >
>> > For valid and is_primary, could you mention that these values remain
>> > static from initialization to destruction, since part of the bitfield is
>> > dynamic and protected by a lock?
>>
>> Ok, will mention.
>>
>> >
>> > > +		/**
>> > > +		 * @multi_queue.preempt_suspended: This queue is currently preempt
>> > > +		 * suspended (e.g. due to its VM's userptr invalidation) and is
>> > > +		 * accounted in the group's @xe_exec_queue_group.suspend_count.
>> > > +		 * Protected by @xe_exec_queue_group.suspend_lock.
>> > > +		 */
>> > > +		u8 preempt_suspended:1;
>> > >  	} multi_queue;
>> > >
>> > >  	/** @sched_props: scheduling properties */
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > index 4b247a3019d2..8ec3ab24048f 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > @@ -1657,11 +1657,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > >  	return DRM_GPU_SCHED_STAT_NO_HANG;
>> > >  }
>> > >
>> > > +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
>> > > +
>> > >  static void guc_exec_queue_fini(struct xe_exec_queue *q)
>> > >  {
>> > >  	struct xe_guc_exec_queue *ge = q->guc;
>> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
>> > >
>> > > +	/*
>> > > +	 * A queue can leave the group while still preempt suspended (e.g.
>> > > +	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
>> > > +	 * which suspends it). Drop its contribution to the group suspend count
>> > > +	 * and resume the primary if this was the last suspended queue.
>> > > +	 */
>> > > +	if (xe_exec_queue_is_multi_queue(q))
>> > > +		guc_exec_queue_multi_queue_drop_suspend(q);
>> > > +
>> > >  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> > >  		struct xe_exec_queue_group *group = q->multi_queue.group;
>> > >
>> > > @@ -2147,20 +2158,82 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>> > >  	if (exec_queue_killed_or_banned_or_wedged(q))
>> > >  		return -EINVAL;
>> > >
>> > > -	xe_sched_msg_lock(sched);
>> > > -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> > > -		q->guc->suspend_pending = true;
>> > > -	xe_sched_msg_unlock(sched);
>> > > +	if (!xe_exec_queue_is_multi_queue(q)) {
>> > > +		xe_sched_msg_lock(sched);
>> > > +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> > > +			q->guc->suspend_pending = true;
>> > > +		xe_sched_msg_unlock(sched);
>> > > +
>> > > +		return 0;
>> > > +	}
>> > > +
>> > > +	/*
>> > > +	 * For a multi-queue group only the primary queue interfaces with GuC
>> > > +	 * for scheduling, so the group is preempted by disabling the primary's
>> > > +	 * GuC context. Route all group suspends through the primary using a
>> > > +	 * group level reference count: disable the primary's GuC context on the
>> > > +	 * first suspend so the GPU is actually preempted, and keep it disabled
>> > > +	 * until every suspended queue in the group is resumed.
>> > > +	 *
>> > > +	 * Set the primary's suspend_pending while holding @suspend_lock so a
>> > > +	 * concurrent suspender of the same group cannot observe a not-yet-pending
>> > > +	 * primary and have its suspend_wait() return before the GPU is preempted.
>> > > +	 */
>> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> > > +		struct xe_exec_queue *primary;
>> > > +		struct xe_gpu_scheduler *psched;
>> > > +		struct xe_sched_msg *pmsg;
>> > > +
>> > > +		if (q->multi_queue.preempt_suspended)
>> > > +			break;
>> > > +
>> > > +		q->multi_queue.preempt_suspended = true;
>> > > +
>> > > +		/*
>> > > +		 * Disable this queue's own scheduler state machine too. For a
>> > > +		 * secondary this is handled internally (not forwarded to GuC),
>> > > +		 * but updating its state is still required. The primary's own
>> > > +		 * state is updated by the GuC suspend issued below on the first
>> > > +		 * group suspend.
>> > > +		 */
>> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> > > +			xe_sched_msg_lock(sched);
>> > > +			if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
>> > > +				q->guc->suspend_pending = true;
>> > > +			xe_sched_msg_unlock(sched);
>> > > +		}
>> > > +
>> > > +		if (group->suspend_count++)
>> > > +			break;
>> > > +
>> > > +		primary = xe_exec_queue_multi_queue_primary(q);
>> > > +		psched = &primary->guc->sched;
>> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_SUSPEND;
>> > > +
>> > > +		xe_sched_msg_lock(psched);
>> > > +		if (guc_exec_queue_try_add_msg(primary, pmsg, SUSPEND))
>> > > +			primary->guc->suspend_pending = true;
>> > > +		xe_sched_msg_unlock(psched);
>> > > +	}
>> >
>> > Maybe a static helper for this code? e.g., guc_exec_queue_multi_queue_suspend?
>> >
>> > Also assert is multi_queue in the helper.
>>
>> Ok, will do.
>>
>> >
>> > >
>> > >  	return 0;
>> > >  }
>> > >
>> > >  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> > >  {
>> > > -	struct xe_guc *guc = exec_queue_to_guc(q);
>> > > -	struct xe_device *xe = guc_to_xe(guc);
>> > > +	struct xe_guc *guc;
>> > > +	struct xe_device *xe;
>> >
>> > This should be able to left as is given guc, xe shouldn't change based
>> > secondary vs primary, right?
>> >
>>
>> Yah, makes sense.
>>
>> > >  	int ret;
>> > >
>> > > +	/*
>> > > +	 * In multi-queue mode the primary owns the GuC scheduling context for
>> > > +	 * the whole group, so wait on the primary's suspend to complete.
>> > > +	 */
>> > > +	q = xe_exec_queue_multi_queue_primary(q);
>> > > +	guc = exec_queue_to_guc(q);
>> > > +	xe = guc_to_xe(guc);
>> > > +
>> > >  	/*
>> > >  	 * Likely don't need to check exec_queue_killed() as we clear
>> > >  	 * suspend_pending upon kill but to be paranoid but races in which
>> > > @@ -2204,11 +2277,91 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>> > >  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
>> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
>> > >
>> > > -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>> > > +	if (!xe_exec_queue_is_multi_queue(q)) {
>> > > +		xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
>> > >
>> > > -	xe_sched_msg_lock(sched);
>> > > -	guc_exec_queue_try_add_msg(q, msg, RESUME);
>> > > -	xe_sched_msg_unlock(sched);
>> > > +		xe_sched_msg_lock(sched);
>> > > +		guc_exec_queue_try_add_msg(q, msg, RESUME);
>> > > +		xe_sched_msg_unlock(sched);
>> > > +
>> > > +		return;
>> > > +	}
>> > > +
>> > > +	/*
>> > > +	 * Resume is called for every queue of the VM on each rebind cycle, so
>> > > +	 * only act if this queue was actually suspended. Re-enable the primary's
>> > > +	 * GuC context once the last suspended queue of the group is resumed.
>> > > +	 */
>> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> > > +		struct xe_exec_queue *primary;
>> > > +		struct xe_gpu_scheduler *psched;
>> > > +		struct xe_sched_msg *pmsg;
>> > > +
>> > > +		if (!q->multi_queue.preempt_suspended)
>> > > +			break;
>> > > +
>> > > +		q->multi_queue.preempt_suspended = false;
>> > > +
>> > > +		/*
>> > > +		 * Re-enable this queue's own scheduler state machine that was
>> > > +		 * disabled on suspend. For a secondary this is handled
>> > > +		 * internally (not forwarded to GuC); the primary's own state is
>> > > +		 * re-enabled by the GuC resume issued below on the last group
>> > > +		 * resume.
>> > > +		 */
>> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> > > +			xe_sched_msg_lock(sched);
>> > > +			guc_exec_queue_try_add_msg(q, msg, RESUME);
>> > > +			xe_sched_msg_unlock(sched);
>> > > +		}
>> > > +
>> > > +		if (--q->multi_queue.group->suspend_count)
>> > > +			break;
>> > > +
>> > > +		primary = xe_exec_queue_multi_queue_primary(q);
>> > > +		psched = &primary->guc->sched;
>> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
>> > > +
>> > > +		xe_gt_assert(guc_to_gt(guc), !primary->guc->suspend_pending);
>> > > +
>> > > +		xe_sched_msg_lock(psched);
>> > > +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
>> > > +		xe_sched_msg_unlock(psched);
>> > > +	}
>> >
>> > guc_exec_queue_multi_queue_resume?
>> >
>>
>> Ok, will add.
>>
>> Thanks,
>> Niranjana
>>
>> > Matt
>> >
>> > > +}
>> > > +
>> > > +/*
>> > > + * Drop a leaving multi-queue member's contribution to the group preempt
>> > > + * suspend count and resume the primary if it was the last suspended queue.
>> > > + * See guc_exec_queue_fini().
>> > > + */
>> > > +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
>> > > +{
>> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
>> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> > > +		struct xe_exec_queue *primary;
>> > > +		struct xe_gpu_scheduler *psched;
>> > > +		struct xe_sched_msg *pmsg;
>> > > +
>> > > +		if (!q->multi_queue.preempt_suspended)
>> > > +			break;
>> > > +
>> > > +		q->multi_queue.preempt_suspended = false;
>> > > +		if (--group->suspend_count)
>> > > +			break;
>> > > +
>> > > +		primary = xe_exec_queue_multi_queue_primary(q);
>> > > +		if (primary == q ||
>> > > +		    exec_queue_killed_or_banned_or_wedged(primary))
>> > > +			break;
>> > > +
>> > > +		psched = &primary->guc->sched;
>> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
>> > > +
>> > > +		xe_sched_msg_lock(psched);
>> > > +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
>> > > +		xe_sched_msg_unlock(psched);
>> > > +	}
>> > >  }
>> > >
>> > >  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>> > > --
>> > > 2.43.0
>> > >
