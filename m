Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C0CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 17:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C064110E98B;
	Thu,  6 Nov 2025 17:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZG5lYfYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD0410E98B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762448922; x=1793984922;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NnQnnObGVim0fBRhuk9WaRUx9GTj3bUxsWmo0C6XOF4=;
 b=ZG5lYfYLqJg4Y+sA05gbGX8s2q+v8CuNJPPlQJsYr7eT+Srq/OSu7Qff
 rsAWNDX6z02lzNvv1YappYKQ0U3gJxfX4EDFmzEoRMPd9z62BO8J7ER31
 ECVO7z4if79H435lD1boxCia4aEG39GAzLPC6TyFa6BFPdAQKWHV/VxtV
 x9mAcTrT3XI+YL5ZNYHEZ56k/t2k7QGsvwzyv0ChDOTip4alyaafCJQk6
 cXWrnYNmZes8oZfi6S3oywpG/eZyfEI635onYESI//jjSNPVGU7mzkFtJ
 RyvLMsntYpiBnRk4pBOGaGdae2/X5qe9q567lJ7vO1lQgEUEx4jIZyvEw g==;
X-CSE-ConnectionGUID: +A00CYR3SM+phobp9IXOYg==
X-CSE-MsgGUID: w0Cr+e8TQ7CIJEINoslnjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64630567"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64630567"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:08:41 -0800
X-CSE-ConnectionGUID: FQZ7Syt0QpONI185K/T10Q==
X-CSE-MsgGUID: s4khqDqPS5a/llm530VxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188249574"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:08:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:08:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 09:08:41 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFwqTVnw9hi0sDckUMZ+Xmf9s5IYC3tCivsJuqGGRSnHd2vFYZq2qQL4KO57ZPdy6zKwlXc7AmyYX7PMQE2I7R6k2aRa4TkUD8RbJ5OkomIXVf95bAfKsEieV52/eOXVJCleNZQiUeLE8Hm97jzJiyQh9MhqyBGV8jEseOqclAdWgkH1I47APWwPW+/lJdnca0CnJ/P1vpyh2p5W0YiCIUN9tinuSapeBli9dugBwDmj3zwFWaEcqCzLfYzMx50SExwvWESRzhvIqFwKcaTKxayh83Fnj8/YHtGgfAZWpPmo5vElKLoDdh5Ak7A0mzcyRroRRaBn0/zRh7K4mHWWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wwnxNHrscn272oj0uOp+KerlLszFsyaE6CGdsluWds=;
 b=FU7eQjK802BjnVhUQGKH2vcigkJBrk19ubQHWSKxZ5fQbzEWUlhd8HNzMnih60JszZu9Rb+khP9hhOWeKWoCrKrkInPbKybVqaCG25nqzJ8Qbag8fA+QtV8b7r5pQiOMUG7rxBH5n/Dq7n1dE9AdaVFocBnMCfNvDcoapecaKQoqumYZYAwTr+WYdeMfRjTmuwfx9N7smJ7euaDcB8tvgreHc6SJiriuSkePHchtFbNV4YXCw8cbtzJJspX25LEEwQ70+84CdIRJ93hO/jzYWk/DWeRrYuaLx8tjlVA647yWtUVYpcuPbYHM6pGMC5jkvcCD2RcLNYF29tsBKgzhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8724.namprd11.prod.outlook.com (2603:10b6:408:1fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:08:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:08:37 +0000
Date: Thu, 6 Nov 2025 11:08:34 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 1/4] drm/xe/vsec: Refactor to move remapper logic outside
 vsec code
Message-ID: <b46tseoczpw5yf4qmtevxlgfxjzwlzmo6hepzr77bfqrg2rkom@ya3kvgayi7vh>
References: <20251105234753.603647-6-umesh.nerlige.ramappa@intel.com>
 <20251105234753.603647-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105234753.603647-7-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c77da7-9060-43fe-3cb6-08de1d572021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nhCkkwJdc0ykWfanjpblBj3H2O1kNAKyBKV9SQ6HURTbAStQPXylUlnNpF?=
 =?iso-8859-1?Q?O33jZXFYGRs48xE1BvmSjDlZkXqtNZYH83yRvUXWyAQJV1I62JLrixBfLy?=
 =?iso-8859-1?Q?PiKnUvENLpesAD0JLQxhgXYTqaDKtdNdBrZ92VbjFFvtrDqU2Fsevs5+cT?=
 =?iso-8859-1?Q?nvY2GvebPrLl3qYRIbfENror6dluJ/2UKAI4VlUcjkob5RuPQfsiaT6Gao?=
 =?iso-8859-1?Q?W5oo0taqgPc1ALpwyjtsfxTyhc6h5nxgO4On5fRqSVXEHaRHhV8rrr9SAb?=
 =?iso-8859-1?Q?/2V690ycGCw6Hhp5GtchGjBDCeFcwCZc6e5DSzHZn8ptHkzLG/V0oukXQi?=
 =?iso-8859-1?Q?UaR8JvG2//DWBV7ZrnSZJsdB/QJwhupiUJi7Vjkta1sfnr8cDyXO5e+7Nu?=
 =?iso-8859-1?Q?BFEaK1srTYD0yQojeg7nU3qxlwSbLptd/mDR9AJbDUSUnyrAFkZADFXzVR?=
 =?iso-8859-1?Q?W2m7UtMZU3zxGtuZQnFQM4LbrIJcpgBbG4IvVO7fHuURq7Hf134/8n1jOv?=
 =?iso-8859-1?Q?js74g2TsQPzckMX2b5JkyFSoX/t12RQS0hgidNr3n6P9Xj1ZhciKE9HJzK?=
 =?iso-8859-1?Q?8tLJBtDZQftGNZd8wpArQ3e7S9bAqZBfQJgCcLZSbgF44zeW8ehfrjTCSi?=
 =?iso-8859-1?Q?Ec2V5GE4pGheY4A9CXtB+xWqZKHvUDzz+qwkx8vTWzHHxUACbFRQQ0J+1s?=
 =?iso-8859-1?Q?DcRAhD7polcnJnjebKqIKObPhEbWttAO0jY00cUi7CYrzvl6jgdxuzry9K?=
 =?iso-8859-1?Q?33kwPDfen23prhdtYF1nsyS6nsRxBNtgl1w40M0XxQ8O56OMBJgYJzmqeX?=
 =?iso-8859-1?Q?RAYaV9RwJ5zuPckUkmp2be3kw2ju6QXrMbWMAVq9jskTW0Amk9eGOdi3cN?=
 =?iso-8859-1?Q?UvcRlqXz+DANpKp2IlhiXRI800qqpEieDbH8OcMzvwS4ZTv6ggu0JjOh1e?=
 =?iso-8859-1?Q?kyc4O52hCt82rmf+dcFwmpTbCsnmWn4hJg59ysxL+3YUzQxfwxJmJqNCfK?=
 =?iso-8859-1?Q?QjjOfCeFZvHmyCA/bkZ3kTVRbS8YQcqvFp0BLTWUnFv/CqC+iyYgSG41EF?=
 =?iso-8859-1?Q?tdSwQ08JDRgD9DZz6RdrCYszf/43gEUpT8W7w3SZnnVwNG7evqPVXhL2C/?=
 =?iso-8859-1?Q?vGNVMo7Hcb3Wgt15HCGwT0Jd/Oh00BDMOGlh1EC6XZrumy6yirSPmEUPuW?=
 =?iso-8859-1?Q?SfBswXcve2yUDQxqXfJNp8gfeQqd7ohxZ7fgizVRCmVppnbEKfF36Yz4gW?=
 =?iso-8859-1?Q?g/B/juCGVnshTzMwNl+bRgyA8EcwYVuCxdbGnMl0MQMMWnQnyKCOLQygDs?=
 =?iso-8859-1?Q?Xux3EKGeN25ER7uzMS99L1S6oxJoxAyy4aIpTVA5+nxnRfk3MSfKHrhV00?=
 =?iso-8859-1?Q?3sEv4eMRX1odWRLTe38XFY/+MmNh3beCgO/cRGqy4CUoKnTPmadOXWemhm?=
 =?iso-8859-1?Q?U+zp9aMrabHPpJf1mbz715OJ2XCBIyFJqQBrf2//ZlD3I9HAWYmWVl9YgA?=
 =?iso-8859-1?Q?/JJGGlSlgAVnOj59oI451S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TSjwwonAr9jx5W6bMjTL4kpacoJfQV8KnIkS3XEAzWQo2lKN9yIolb8VOq?=
 =?iso-8859-1?Q?b+afC3OGR+pD1TgBXZpewDyp5THFYqcy7pFVRJhJY+GN9ur7HoEY+UXDqv?=
 =?iso-8859-1?Q?c37WyM64q8BhH/XAhDxgq7+nRHl8OG7e+WMhYAku98MPbfOokMZftXJ5tb?=
 =?iso-8859-1?Q?KskpWfLD9cXtwy6hFn9WbiSt62Ubhn8VszHXUeQZEOFMPtX8EK2zOQGxhc?=
 =?iso-8859-1?Q?gcMNG1Qwf5s7KNtfVnujNTHURZ1KizDfJ5OvZSVZg7xUtmITDalFFt6T/P?=
 =?iso-8859-1?Q?Fc/bz3iEh7MaTY8hOUQpJK3ESKBciJ6nPXvmSBU8OhEVjwdRkY8n2dyH0i?=
 =?iso-8859-1?Q?wPFNlVlgVA8JsoLDrIt97KSShqF6aHeNJoM0+AiXYxayrUQowE/lDhko0x?=
 =?iso-8859-1?Q?1Nei/RVH33w9uS0aQsgsei/zH6WSHc3ahJH4HYktT9WK8c20hFmVuBpyZu?=
 =?iso-8859-1?Q?j6PhwOM2qWkkL+7PiSnLNV6DHK91xADHOZq1s0LmtmmOKWKky5Nl2IQ8rT?=
 =?iso-8859-1?Q?L0ns2fFQ2zTsXCBPteqwg+xNBggOFjv740CbrZ1Yr5oetUITOshP3fjIW4?=
 =?iso-8859-1?Q?CGOBTuLfhi9feLY7FTLIofGuh6pVL/Ybte2JjBGn8H7mUSHti6yMXGyRWq?=
 =?iso-8859-1?Q?Ro/03GQRRaWs1263mq+ZrEa2x5r9kAXLOpL0f3NMMMat2KTGEgutQKJzr1?=
 =?iso-8859-1?Q?LTT4aJtYwWKEiHexB1IRg1lNGHvUPaZsBlBJ+CT3K5DGBbM20jJ1YACbXA?=
 =?iso-8859-1?Q?CcVnc+CD0Cm0o8F6EewLiTdLg5zza4LVh04gxsxWWOnY+GIe/6lxws4oGf?=
 =?iso-8859-1?Q?0SxwGvvak/hJYfBs4aXVTbUjSAGdfiaYa9bU94AKYHRXIaXDhzpQClJIQR?=
 =?iso-8859-1?Q?4E4fRbYbNhuYwZfImzVHtlzEQqABlOjlFy41uutyWsnceo7OOJxJM5sQHT?=
 =?iso-8859-1?Q?tQu85PggPZD+i/PgWJNNDc3Cdvj5e0UZTwNfHvcYPCvML8QpPFApU8M6Gr?=
 =?iso-8859-1?Q?pAvLRMrrWeg1KJJIr5gOXlbOtagStgQd7S31r8Bi23h+oqxTiM6nM6gzoR?=
 =?iso-8859-1?Q?HGSyopo1JoQWEqIzoXpJ6wZsFBhDgvRXpWBHXrqwJEwfkLyNrLGKtzfPas?=
 =?iso-8859-1?Q?VCgTKkzqOm1aZiTWyN3QkicrzEZIm3wBSd+x91GJqHHcMGofBK1syA63Xy?=
 =?iso-8859-1?Q?ufXx98Io11NzndtY7yXmJkTUi2SEdCF68uK6Su7cWRdhS2e+q8D6m0azoU?=
 =?iso-8859-1?Q?TJkqZoOCI7dG11zJ1a+sfsLHkDy6rZNV+H6N6pYBV+s3BL/dK3+aXANBpH?=
 =?iso-8859-1?Q?7kzywSLKQcgRUiku2z6kqfSg27mVvIW3Y1gUgmL8kDAcwb6H2CmLKS7nph?=
 =?iso-8859-1?Q?UILMtOMPTXKTvXmLFkxYxbMNLF4W//Je6Cx2o3RvcSuRszH7PjyNh3VQAV?=
 =?iso-8859-1?Q?hUPM8z5MTQGLerTEJ36N87kq6KCcQZZTvu1vRCZnbnehhsT/bamS/3bk76?=
 =?iso-8859-1?Q?PhxQt2z4tWw3L7WNw/u9amQLVNYhOg28GUH7ze4A+1LRm5cSkZPAnAQK63?=
 =?iso-8859-1?Q?HlT5z7TP7TERk7S1lTXe2w6LsFMPaKysPMOwocWS4tJWlgDze2e7vamaE2?=
 =?iso-8859-1?Q?yBpvMXcs7yrZX3UBX0rojU+nXhMWz8j+C6SRQQZ39bxr0OsmW8wHsDUQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c77da7-9060-43fe-3cb6-08de1d572021
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:08:37.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZSiUx3IOpaztyocDJWwsT5Ngd8bX/XubCe8BxpclI7337DJy/G8FZGLzKdirS5d7UjJJuJbjFyPle+iPP3L7nFBE40jNQBQif978nWdhxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8724
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

On Wed, Nov 05, 2025 at 03:47:55PM -0800, Umesh Nerlige Ramappa wrote:
>PMT is not the only user of SoC remapper, so move the remapper code
>oustide the vsec implementation so that it can be used by other drivers
>when needed.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/Makefile                |  1 +
> drivers/gpu/drm/xe/regs/xe_pmt.h           |  3 ---
> drivers/gpu/drm/xe/regs/xe_remapper_regs.h | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_remapper.c           | 16 ++++++++++++++++
> drivers/gpu/drm/xe/xe_remapper.h           | 15 +++++++++++++++

agreed with Ashutosh's comment in the cover: xe_soc_remapper would be
better

> drivers/gpu/drm/xe/xe_vsec.c               |  5 ++---
> 6 files changed, 47 insertions(+), 6 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_remapper_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_remapper.c
> create mode 100644 drivers/gpu/drm/xe/xe_remapper.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 3fbec058facc..765dc35ae2a3 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -109,6 +109,7 @@ xe-y += xe_bb.o \
> 	xe_range_fence.o \
> 	xe_reg_sr.o \
> 	xe_reg_whitelist.o \
>+	xe_remapper.o \
> 	xe_ring_ops.o \
> 	xe_rtp.o \
> 	xe_sa.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>index 264e9baf949c..ffef22a0dff9 100644
>--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>@@ -18,9 +18,6 @@
> #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
> #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>
>-#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>-#define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>-
> #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> #define BMG_G2_RESIDENCY_OFFSET		(0x530)
> #define BMG_G6_RESIDENCY_OFFSET		(0x538)
>diff --git a/drivers/gpu/drm/xe/regs/xe_remapper_regs.h b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
>new file mode 100644
>index 000000000000..96bfc445555e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_remapper_regs.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#ifndef _XE_REMAPPER_REGS_H_
>+#define _XE_REMAPPER_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>+#define   SG_REMAP_TELEM_BITS		REG_GENMASK(31, 24)

we usually add _MASK suffix for masks, maybe fix it while moving?

>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_remapper.c b/drivers/gpu/drm/xe/xe_remapper.c
>new file mode 100644
>index 000000000000..1374fc2f4dda
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_remapper.c
>@@ -0,0 +1,16 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2023-2024 Intel Corporation

2025

>+ */
>+
>+#include "regs/xe_remapper_regs.h"
>+#include "xe_mmio.h"
>+#include "xe_remapper.h"
>+
>+void xe_remapper_set_telem_region(struct xe_device *xe, u32 index)
>+{
>+	xe_mmio_rmw32(xe_root_tile_mmio(xe),
>+		      SG_REMAP_INDEX1,
>+		      SG_REMAP_TELEM_BITS,
>+		      REG_FIELD_PREP(SG_REMAP_TELEM_BITS, index));
>+}
>diff --git a/drivers/gpu/drm/xe/xe_remapper.h b/drivers/gpu/drm/xe/xe_remapper.h
>new file mode 100644
>index 000000000000..df6b726a97a7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_remapper.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_REMAPPER_H_
>+#define _XE_REMAPPER_H_
>+
>+#include <linux/types.h>
>+
>+#include "xe_device_types.h"
>+
>+void xe_remapper_set_telem_region(struct xe_device *xe, u32 index);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>index 8f23a27871b6..81b1c0fe20b8 100644
>--- a/drivers/gpu/drm/xe/xe_vsec.c
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -16,6 +16,7 @@
> #include "xe_mmio.h"
> #include "xe_platform_types.h"
> #include "xe_pm.h"
>+#include "xe_remapper.h"
> #include "xe_vsec.h"
>
> #include "regs/xe_pmt.h"
>@@ -162,9 +163,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
> 	if (!xe_pm_runtime_get_if_active(xe))
> 		return -ENODATA;
>
>-	/* set SoC re-mapper index register based on GUID memory region */

the comment can probably stay...

thanks,
Lucas De Marchi

>-	xe_mmio_rmw32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, SG_REMAP_BITS,
>-		      REG_FIELD_PREP(SG_REMAP_BITS, mem_region));
>+	xe_remapper_set_telem_region(xe, mem_region);
>
> 	memcpy_fromio(data, telem_addr, count);
> 	xe_pm_runtime_put(xe);
>-- 
>2.43.0
>
