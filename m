Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E46CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 10:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D9289226;
	Wed, 18 Sep 2024 10:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObZ6yITv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235D89226
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726653814; x=1758189814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C+5Wua31sDKrcyr8SvQ+ktjVCc1t5n43opzU5STrqeo=;
 b=ObZ6yITvyDui3lq2fuXV9ZOfFunkmZvoPPNMQLtYMsvMQ5OBe2VKNta/
 vyXsWtWJSgPVmEE/NjMd7nAU71OTCuEVhF144dCLoFMOQyb90xQqOxQUW
 ekThe2KnhkOgEaOdGJBzjUdzlB7+I3o858EK1ROW6MHviRXPY2VIpCP97
 H5koOMSYLdRuHbodZcDlyghz/qeoYwrKCxqdvGkyrCIf8TGFL4oAQ3o7T
 5SK9bHEy0goI7BzKbTpZeKn1kpPb3nlk1BlhHWK75NzLdPl6rsKxcUOMt
 4AzW0Hgoosb8vOt91fY+ehwYbVL20B0qgJRGATHrJdVzfzlQ2i8YxIJgz Q==;
X-CSE-ConnectionGUID: lgBrVI9VQ1qFSjAAQrqMxg==
X-CSE-MsgGUID: PllLT6Y3TQ2cE1EGi3LjCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29342241"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="29342241"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 03:03:31 -0700
X-CSE-ConnectionGUID: 3d4uo0RYR26R0BYt6fE69A==
X-CSE-MsgGUID: Xa8gKrE3QZq+YV5rE0dVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="74324084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 03:03:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:03:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 03:03:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 03:03:30 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 03:03:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVJf54oLlsHdGTqeGkDmFhm8Ta+J1mgcJX14NHGteeeNyGgTQCJ1NHYDw7kwqbTQi38n1GFKiqZbI+IZWXrHnnVATTzAg9TVu4nITJNNE2EezKmpiKNeRyI7zTIiEE0eqa9rIIl9qPuh9NQ7ZaICvPurKN4IRul8irOfjqJeTtx/pRX+uPv7Q3LSTO5zX8H4rkExJtt3zg69D2+oYyGPiwUyBGNIlkYl9/1qDxOESPCQP8Hv0hmwz2D+zd2ZQnndW4EWJIom/GMDJrz/BgFeOStiG4w+qwxLWLghWQDWLO76w1uZM4NKIvrIexAHWoLrmpmdYgjN5J1dJIZ+vjo9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1geyOpJKWemRZF2va3kb2Y5Bns6prE9ECrcIYxPIYlw=;
 b=CQfDzML0l7ej7xzN4x1vCT8fFwc+wp3a+JRTlWQaScInpiezozQQ3NlQnHHazh0pKecoRBbH4FMrtLtbAjjsUxzm+4e6VzK9n/xL0SpZrRTETV6vfYIP4qPnsUvuTQK1U4JE+fjLt1SmOYiagc3Z7vlaayXOaLqT58k0z8g+9uHEEdwuP1yzy+Q5vNeJ0/7YEKflWRo31gFTf5ZPxGzqTdYKWcb9beV/QFcC/V2wWRGum7lpvUobSGMNiZYlfHJy+6mNs2e0u5aQFgEHr8xhBOx4BhF4FN2lAuzzXrQCpY0QngkrDKCEGYO141AzCuf0eR5kLXA652aYRcPzZZ3U1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 10:03:28 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 10:03:28 +0000
Date: Wed, 18 Sep 2024 15:33:07 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
Message-ID: <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 158bf93a-5ed7-4d1a-91a7-08dcd7c92450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlA5UDdJRlpnNC9vQ2xDWWdQZHlNRDZOMnZsTzRiQ2RqcGl6dGF6T3BVOHJs?=
 =?utf-8?B?UWdJNDkvMGZDWTI4Wjg2RmtMMytxNHJ4a0ZCNDhwQWpyVkhvNDdwU2hEZUtG?=
 =?utf-8?B?bHkvKzJnWENlcU8vYkc2elBvYnJQS1dzbkJVZ2lwaDU1ZkVCbndsb0hDbDRy?=
 =?utf-8?B?YmhYREcyd2Izc0laSnpVNThtQSs1Y1RicjN4UGZqR29xdS9TeW4wbUh1TEpy?=
 =?utf-8?B?U0xxL2hzbHZlSXhMWDVLNWJremlGaXJCSUQraXFKU0dyWThVMjhqUHF6MFFw?=
 =?utf-8?B?L2IrN2ZSWXpWNnBhaHVQMkEzUHYyaWM2QlJhWEpNY3hHTzlvRzFlKzVyM0Fq?=
 =?utf-8?B?OTBBbDVBdTF0N1FqSUZwcm02U09zY0xmWVBSUXJBcVZqcWVqK2UyS1JLdjU0?=
 =?utf-8?B?Y0Q0RHh5dklHcHRvSjVLZkN2MmZmM3ZJR2ZuN2l0RHB5NkF3UVpvR05XNmJQ?=
 =?utf-8?B?UzdHQW9Gd2p1OTZkZmFUbS9SVEVmSFEyalljNTlaSTZtN2VQaGl2OXIyNXNp?=
 =?utf-8?B?ay82S0prMTVKazJiWVBMMmVaZTh0L3d6dENoRTBzODJEMlZEV1ZPNFoybjZi?=
 =?utf-8?B?RnZQZkVHa1pweHFOV2VsV1lmVjZmcmwxczEyQW5HT2RsazFvUXZEWHJZS1ZV?=
 =?utf-8?B?S0I2K2Erd2NMTm90dm5zb0VNaThYTEhtTkFUckgwc3ZHVUFkRDdVYWMvcko2?=
 =?utf-8?B?ci9mZVQ4akFGUGQ3d1NoTWVzRnlDTVN3RE01T0d3MnlwK2RId3BmQmdNaWln?=
 =?utf-8?B?dC9nSVp6TThBalVFbTRSS0RnSVpIZllQVWI5VnFEcXFwd2Z3eG1lRjF0Yko1?=
 =?utf-8?B?OFFRUmllelVkY1JLZXhodmVRSHpSMVl1b1lqbWRVcGROT1MzV2E3aTNuQVF6?=
 =?utf-8?B?ZVFnRWVrb0QzbnAxcWlYYnJMSEM4OERaekZvRVVEL0NkZVJyS3h2MnRISHVM?=
 =?utf-8?B?ZHJPbTFkWWMwUHQrRENnT2R6T1FpbjV6b3Q2bWRKWm9pZFI0Q1FDSGxBMFE1?=
 =?utf-8?B?OXZWb3czblRGWDcyVHFhcnZlMmVjS2g3b2tFTXU5aUg2TGJtamh0QzJvVEg3?=
 =?utf-8?B?MVBVN3p2YVhJVEpNcHZtYUo2aEFJVDN3dGdzTndpQ0dYZ1lZVmxNZHkwYng5?=
 =?utf-8?B?Q3RUbUMvcWN0MnJJRFhEdTRBYnBjdVNGaDQvdmdvMEkwUkRScmpSbWFsbEs0?=
 =?utf-8?B?UTRRNnZaNXg3dVNaQ0xwWEs5dXZFa0F3Nm5BRWhkQnJUOFdvYy9OZHc0c1J3?=
 =?utf-8?B?em9wZWVHYWYwUSt6T1BBUWtjMm5UVlJXWUJ0VHVtYTQvTWtSNlQyT1FRYU1w?=
 =?utf-8?B?MU1qRldFdzBxK0N3OFJad3A0Mlhnd3Ixa3NjREtURnJtbkQ4dHNwWUZTd0Iw?=
 =?utf-8?B?Ry9sQU45bFJEU0F0eTBnTFA2OXcvVXpEblRsVi9wMlVQNTd1encwUUtEWWJ5?=
 =?utf-8?B?VGgzaEdJUXBwZVBTMCtOYXlqZmt2aklXY1hjbDB2YmVQclFPUThwa1pSWUZE?=
 =?utf-8?B?eXF6ZkFUbEJJcUs5ODFXbmFneU9lUncydG9MSi9zME1tbmdsS2JsYUV2R0tE?=
 =?utf-8?B?WFV5czB6R3JPMC85WGJHbU5Rb0hQZjBhVWRjSjZmUUVyMTltcTVKTWtDdmZK?=
 =?utf-8?B?a0s0RklPWEZtdDQwRVFtdWpRaHd3ZUc1VXhRUk5icmp5RU43MDBvb0hhNFh6?=
 =?utf-8?B?ektFVWdHOG4xNXdpU3IwRGZsRkRSQVdhYzJVeGMza2ozUHVtNFl1cy9NaEtU?=
 =?utf-8?B?dlNFbFpPakFaUDVYWGtkeDA0Y09UcGVkZmx2dkJqYXY2cmJqdjRLVDEvRXVV?=
 =?utf-8?B?OUJGang0SmtpUk1KR0Exdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lwd2g1K1RLVDFKUHRUQUlGUmRJZnE5b0taVWMybGxYaTFHeHlVSFZ5bEdT?=
 =?utf-8?B?MXhCTHMva3ZmMG5EbGp6Y0hQZTY1R2VlU1dJeVJMZWpTdzE4b1JIdXVKL0to?=
 =?utf-8?B?NGZyQUlYVG5yRUZlczhBQWZFZkZxTXlkdmlWWVVxeTRjcXcrRllsMHZpSVM4?=
 =?utf-8?B?Q09HWkhRWDFFOXhoNmMxemptR0Y2RkhrY2VDMlRpVUk2ZHFrTThiQ2txQWZU?=
 =?utf-8?B?V2xheGpEOHMyWVc2T0ppZU9hUTI0YVVPU1BaUTB4TEZ3SjVqdnBHbkF3YlpH?=
 =?utf-8?B?dEN4TDJobFdnNE9qME5FTytPMDlOa01BVGlRRTVzaC81NWpMdm9QTUxSQVB6?=
 =?utf-8?B?WkZXeDdaQjNydzNqZmplSUg5TE1JakhWdkZ6ZUdjVDliQUlnNE9xTW5ZNVpp?=
 =?utf-8?B?V3ZYSlRJZGFxOS9nTW5teGw5KzZUcjhRZ2RrTUI5U3hsdkFkTzhldVZIL0RI?=
 =?utf-8?B?V244Nmk3alZHakN4U3ZPcFBGVGQzNHdSa0VRdnhLcjhEWG9GY2gvRDlqYXZ3?=
 =?utf-8?B?TkJpSTlCM0IySmpSMmNoRmxNUGdGODFKakNXMDh0d2JNTHRxdkozRktMTjlJ?=
 =?utf-8?B?aGdiUGd3U3hhUG1CRWZaOHd4ME5ZTUMrUkxxbGhuSk5FVTFwUW9vNGVoQUJM?=
 =?utf-8?B?djFXMU9GVG1QUExHWUw2MzhaS0Z0WWY4UUtVOXlkTmJ6clRERHBFTDFkNzdE?=
 =?utf-8?B?QnJTSGo2NnU4dVdZVjVFc0o5cUxvcE90M05TVm9vQkR1cDBVUTVpZm0ya29P?=
 =?utf-8?B?clh0TU56TWp5SHp2L1FHaUNZSHBFTVdyY3BXVGRzV2xNcUhlZGh2a2ZPRjBY?=
 =?utf-8?B?clNNaS95VTVxdm9RT3p2RW5Nb1BpMUFNUHp5Z0swQjFQaGtiZ0NDK05RUi9n?=
 =?utf-8?B?bXhUOHdjSE1XTmZRS3dMUDFHOUp6SDNtZXFoL2hpWTR3STdOVURrdkVmSUla?=
 =?utf-8?B?RGNUT2VtOW1XbHFxVkMrQitXZ0dkaXJoK3JNUWNNWm5Jbnd0WnlyWmVBUGZO?=
 =?utf-8?B?SHYyUVlPV0x0NG4zckJ4Y21zbzZNak9WM2ZjcDQ2WVFXbzlaU1MwaS9iTjdS?=
 =?utf-8?B?WGFPenlyMlZsZm5wY2tKbGVLU0NoaGZORXFOWVA5SU0zRU9VZnBiUjErNVV2?=
 =?utf-8?B?dTNzNGh2UXU0MWdyS0dNWlZTRHpJSTF3OUNOL1Z6SHJ1TWdWQS92aGw5YjJx?=
 =?utf-8?B?N2NSUVBNNUpuWURDSnJNTlByQVdJdWZMU21WcEQxbGk3aFIrWlUxZ0FwT0Jp?=
 =?utf-8?B?MnN3S3pFcXRQc3o2VUdXQkxPd2ZLUnRKV21rZHpiRzVsRk5hVlUzeGZnallm?=
 =?utf-8?B?dVdEWHFJU1pSUlRjOEZ4TzB3SGIySGtpL2YwUVU0SUl6ODhTUFUrcDRZMjJO?=
 =?utf-8?B?di9vcTlqYXNuYU80VHA4MWxrZWJIK0xGMG01bnBBdDREQUZTcEdlalBqRGRO?=
 =?utf-8?B?ejN1QURMeEszQ2JNbTczd3phMUpZMUp4TlowRGhiSWg2UjNVYkduaDZZS3JH?=
 =?utf-8?B?N2l6TlRrd1Frb2tLTFNENXBlenJaTk02aTV2MHVBMHEwVm5MbFdSQlNUQS9V?=
 =?utf-8?B?bGRIbkZ2dC9tUHI4djQxNFdzTkQyd3ZLcmFqZFFSQ1I0ODJpcUY0dUVMbnZH?=
 =?utf-8?B?Qy9JQ3B0d3g1bmJlK0Y4YjB0aDdMc3had2tlUnFQNGtNb2FoaTdjbVV2R1Bm?=
 =?utf-8?B?TFdSelZUQlBUUUFBdkloK3h2aE1aWmd2NlFkTTdDYmYwMlpmRThtRGV0YzBQ?=
 =?utf-8?B?Y0Y3S2g0OGdTK25WQ0VQUzdTYUxRa2d2YUl5b2lxQzNWZmtWSHk2TGNlNnB2?=
 =?utf-8?B?cGhlRis0UWlGcXFPT01zenVJM0l2Yi9LMVVTb0loOVZRYjVrWkNLR2h2b1Mv?=
 =?utf-8?B?bHptcG8reHFxT2RUVXliTC8zWnUrL2ZrenYzSXFXOGtoNnpTUWFFeXBMTXZU?=
 =?utf-8?B?VkdtYXFrV01MQmxKWDBBT25renlLOU1EN0pINDFRWGV2YXFjSlRkRHBoalJD?=
 =?utf-8?B?enN5Uk55Nks3bWpoZ2IxdkhrcGJFdnVuS1FGN2NmVjhsaUdFYWgvOC8xa1Z0?=
 =?utf-8?B?cjhDc3BJQ2l4SEI5ZmUveUxPbTArU1Y0ajZFK2RtWHV4aGtoTGRReUhsTXc5?=
 =?utf-8?B?Z290VjdhOFFFenpOSzhSY2JrTzI3dG1Wa1BrMFN2c1Z4cVN1QjhJNWk1LzZU?=
 =?utf-8?Q?RkSwhMxI7LFkWrfezI1919U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 158bf93a-5ed7-4d1a-91a7-08dcd7c92450
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:03:28.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVk4n+TaJITtJ+cvZYoIIg4eV2sFhPHyxHyd2SPdov0cRtjXJDaZNFejBD0R8FB9fQKFRGVnY+oX01B5/K7YJ8fKJp05LK4jJsVlqOI2x4RqfI/zu1S2ed8MGP9V8RsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
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

On 18.09.2024 15:09, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Balasubramani Vivekanandan
> > Sent: Wednesday, September 18, 2024 1:42 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> > Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan, Balasubramani
> > <balasubramani.vivekanandan@intel.com>
> > Subject: [PATCH] drm/xe: Decrement client count immediately on file close
> > 
> > Decrement the client count immediately on file close. It is not required to be
> > deferred to the resource cleanup function. Otherwise there will be a small
> > time window, where there will be a non-zero client count even after closing all
> > open file handles.
> > This affects ccs_mode(xe_compute) igt tests as these tests try to change the
> > ccs_mode immediately after closing all file handles, but the driver rejects the
> > ccs_mode change request as it sees a non-zero client count.
> > 
> > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4d3c794f134c..3bccea6212ff 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device *dev,
> > struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
> >  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > -	struct xe_device *xe = xef->xe;
> > 
> >  	xa_destroy(&xef->exec_queue.xa);
> >  	mutex_destroy(&xef->exec_queue.lock);
> >  	xa_destroy(&xef->vm.xa);
> >  	mutex_destroy(&xef->vm.lock);
> > 
> > -	spin_lock(&xe->clients.lock);
> > -	xe->clients.count--;
> > -	spin_unlock(&xe->clients.lock);
> > -
> >  	xe_drm_client_put(xef->client);
> >  	kfree(xef->process_name);
> >  	kfree(xef);
> > @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device *dev,
> > struct drm_file *file)
> > 
> >  	xe_file_put(xef);
> > 
> > +	spin_lock(&xe->clients.lock);
> > +	xe->clients.count--;
> > +	spin_unlock(&xe->clients.lock);
> 
> The file_close here is sychronus and serialized call with respect to userspace. Any settings done through sysfs post file_close should not required this change as far as I know. Would please explain scenario better?

In the current code, the client count is decremented in the function
xe_file_destroy which is not invoked synchronously from xe_file_close.
It is called when all references to xe_file are lost.
References to xe_file are held during creation of vm and exec_queues. So
the somebody might still be holding reference to xe_file while
xe_file_close is called. Therefore the invocation of xe_file_destroy
might be deferred. 
As of result, driver might see a non-zero client count even after all
file handles are actually closed which is incorrect. We can defer only
the freeing of resources to xe_file_destroy but the client count can be
immediately adjusted in xe_file_close.

Regards,
Bala
> 
> Tejas
> > +
> >  	xe_pm_runtime_put(xe);
> >  }
> > 
> > --
> > 2.34.1
> 
