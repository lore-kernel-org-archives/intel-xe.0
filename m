Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B2BCF9C71
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 19:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F5910E480;
	Mon, 23 Sep 2024 19:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1HKHxOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6237610E480
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 19:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727120725; x=1758656725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sR43V3W3dYsVO/KjRCyAL2KkCAky4aYJtkhR5nmrpvc=;
 b=b1HKHxOghWg1oh/BBGuQ+bo7ix9meo/6vj5ccallsd6HPdXTbxlcyCVz
 6yAPfj8PsWQHMXqJaUL3EN4fucfLV0L+aA7rl02d8MnzDZJdUOCtyk8vN
 +5Qtuo4oTC1DSO585FspTZxFz3R1rODJkHpJZnxybcqlmefUoHHhs2ujd
 dK+1UzRrsdoMLgKAEl9ZM49NJZg7wMIWg5Q8VvHO4N7pKOHE8KLTKDAQz
 h+td6SuTb1eAPTQkU4avKt7IuZTOCy8e6dwnqQc3YlgHAZ93dBHvCBUBu
 DXBeBgiXNQd5qlXpAQ14twwO4pnSlAwQBr9I6VPfgzpSP5N/7rQ9VPv+l w==;
X-CSE-ConnectionGUID: yftCfFI5Q+arFQIoo5QdPQ==
X-CSE-MsgGUID: P/IvyZ5sSZaRa6JRq1BiIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48617419"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="48617419"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 12:45:25 -0700
X-CSE-ConnectionGUID: bn2rm/hUT6OMfun2X/6neg==
X-CSE-MsgGUID: aVNUyLyPQi6BPr0u4M/2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71220207"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 12:45:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 12:45:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 12:45:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 12:45:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 12:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTrKE5h7eZ44+7WOUK9MKzMkl5nm7LEhoHJiP4OlZk/AAHuhJVkurmCdFDoEWM3FDe9hoU5NqReAA/wPxfUS945S4C2apgRRoiHucEmx9m1zs+yAEfmTcDAW2Tk+chW0S9TF1Qzx5VZsV/sOl7LwfBYMN5dAOFKh2raLfRETtT1VgxzRjDigBGU8nz1VTnzf2rW9E5T5tkRAEQh+9kqwfMQXtInLwpj6R5xG68dzWolmE7DZ5RXKPNteXMY8jcSPaumEZN2jXWkeq4uM2tB7ulm1UJLZm9o9Oz8r+NjzWybRmzzUgBjqIj3G1466hn8pqc34BnZRyBCGSClCf7kKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hXMuLFCOp91xFmoaEUE6l42eASv/zPeJZo7Gj72pdI=;
 b=KRdytp8O9vB1UQ0zy5lgwH8yGD8Codr0B4nIODmLiV6ShOluELHN57eXRYsUH9BPUFkIPsfDE1hk57Wu1j0rsIb5Lb3LFxBq8cF38zTSSvwmRcEbfhBipRjJi5Wtn8mJ4TYfxRILyJCv6fvBDaw52D41k9LRGV5QEAGr/OMSK5dZCi57ygcNwW7GeNhMN7NHeTD/WDVA7cf4MTCjlV40IxHP6SMboCje9JFhxW4OGnfBRMeAR3OJnS+Vr0SkIuXyD2JfvYL+qikK/kxLEzCaxm+4z3DeJkUSGl71ALdoa/B4JAz9+Aq0I0NHW9u50SUiNKaX3HexC//n7dqMitWw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 19:45:21 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 19:45:21 +0000
Message-ID: <d3db53f4-e061-4b4a-b90b-93687ad2fdfb@intel.com>
Date: Mon, 23 Sep 2024 12:45:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 00/12] Debug g2h timeout issue
To: Jani Nikula <jani.nikula@linux.intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240920142922.618649-1-badal.nilawar@intel.com>
 <87bk0i8jol.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87bk0i8jol.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c26c652-3e0e-42cc-5472-08dcdc08426f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzkyOEVUOVNPaDRac0dhZmN5Uk9IRGNFNEdpNXFXamRLL3JxUGdVbWFLZEpC?=
 =?utf-8?B?bVRXeGJTcjIwRVJpODExa1RUODg2TzBWRzdhMEJtLy9QODRFUmlNcUg2VUs1?=
 =?utf-8?B?a2wwT2VxUGdFc0REcTNBSktLZnhIRVhtTkM1WmRlZVI5MWFlNGkyZWt1TTZM?=
 =?utf-8?B?NWswcTAxVU11YTFXZE1UM1F5bE9HVTNvODQ5SXFQRk9ITTAxTWJxc1Y1VkJa?=
 =?utf-8?B?azhFYktjNUczdWpiOWQrOHVMNVZMNWtyNFJ2T0RORGhLU3VkTVYxMkZWR2lF?=
 =?utf-8?B?V2xMYkxqZ1JJYzI4a25OcWRIQ0FOR3Ivc3MzckNaci9KMkJ1RFZNRkRyWjFl?=
 =?utf-8?B?OUxhNVB3Wk8zZkN3eXVSTnkrQ3RMejZwMHFrMHdWeTRhN3ptOXBZK2x1a3ZU?=
 =?utf-8?B?d044MTdPdW00RzhuNW0vNVIwWjQwV1V3aDhOM3IyNUNRSlluWG41S3RYZEJs?=
 =?utf-8?B?RmVnaGpBWWpPL1FrQWZRQVF4SWFzMnRZSWZNVkNVMVJsb2xrSHkzaGxFMHBv?=
 =?utf-8?B?V1hzQ3NnVkl2T3ZIWWVsMytRc1c3TVA2ZnBZZlV5VXhwb0RsYlJpOUdkU1E1?=
 =?utf-8?B?Y0dMaFBVQ2ZVbUd3YTEyVExMQTlrR0FLeklZeHJDSVcwenA1Mm9VOXIxRTNK?=
 =?utf-8?B?QXBLUThVMWlNMjVaS2t2L1JEOUpvY1N1T1JTdmI1UnB0MC9OTmsxaVFlS0Rm?=
 =?utf-8?B?Z0MvL01lZ3BjemNiajFCMWhnUkJJT2czVnVZNGthd2dPdGR6dWppbXIzSEZz?=
 =?utf-8?B?SlFLVW1wN2xJN2dERS8yUW1CcFM0akZnZGhjb3VxYjJ3WEFpaG5KUzdYR2FI?=
 =?utf-8?B?MlJyN3FBQkprS1dmMXJ5eVRWRVJSR29aREdIdkZsaS83NGdiZ0RSSUJPanZx?=
 =?utf-8?B?d1ViRnRCK2dENXNvUDIrVzZJTUtieVVDcUdxbW15WkZiTkc0VHE4ODRucTFM?=
 =?utf-8?B?VjlQYWxaenMrSW43eDA3QTI1bFB0QzErd1U3WEZmQUtUcnY0M1RvTHJVbVFq?=
 =?utf-8?B?UFBHM0FvUjBWUEtUd0tTSkFmNVpmRE45OXJuL0NvNVdQbS8ydWxFLzhYaGlP?=
 =?utf-8?B?Tmd0Z3hNbXViZG01NlZzMnduRjQ4RGVsRWdxbUx5NCtkTE9GL2p2cGMvdGta?=
 =?utf-8?B?Z1JhV1pQdmxHMFZvRjJKUHpUQmZuMlBCREpmczVOS0Q3NTRyNFdaMjFGd0FJ?=
 =?utf-8?B?RDF0S1VSSHRJaVh5R2ZBYnRMaVVSUm5ybkF2UmtuSXZyc2dWNFZ5aFAxTjNQ?=
 =?utf-8?B?UmV3ZnlmMUZqMS9XMG5aeXJ3N1VaL0IrTUlMUTkxcDQzdXJnQXpnMHVqT1lh?=
 =?utf-8?B?TEdtc3JYVWlKS0FkTUhZZGw1d3BhMmJydlp1RWZWa0l2dFh5NXk0S3lZQ0ta?=
 =?utf-8?B?Q1lXelRvTlpjWklvb1dhdVR5L2xDM3dsUnc2bmFhdEprMnd2WlV4bkkxeU1L?=
 =?utf-8?B?TExUNmpEV2lrTTlrQTlQTzlHSUFzQ3ZCR3hoWTFyUGgwWlorNU84Q3V3OTNX?=
 =?utf-8?B?SHd5aS9wU2RFYkNvUGdEdDYzTXdub3ZnTVppVHI1aGZCUnN1YlA1RU1Rd2tI?=
 =?utf-8?B?VUhiNm1VbTN3a2NiVnB4TXNZRFVQZE9VQmUvaFdDSDVPR1V4Z3RXb1o3Uis2?=
 =?utf-8?B?cm9rTUpwZTgzS0dwZ1NudkdZSjg4c2ljMHhYRGxkU0Vnd3llYVhsWXdkUVg1?=
 =?utf-8?B?UGtMZTU3VUhOL0RoSFYxVGttS2l3anlTbWpDRksxdm9KZEtEa3dETGczc1B0?=
 =?utf-8?B?MWpPZjZWYkphc0hxUzZjYWxvZ1hZb25nVHlPSEhaTjNQUW50aWlJOUxkanZR?=
 =?utf-8?B?c2k2VUdlczhCMXdaUVhjdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHpRZ1VuYjZwemRVVHBLTmN5YmdQRjBxUzdkeDlWOGhvSU5MWnZaeWhuTTk3?=
 =?utf-8?B?aGptWmlyWGo4SVY2WGRKV28zdURGWlBoR2RZTVQ3MkpQd1VmR1REcWNzcjJ1?=
 =?utf-8?B?bS9aVUVGYjdMOE5qNGNjOFFpc1B1ZDYxb210b0Q2RkNkOXdzSWpwSFUvanBh?=
 =?utf-8?B?VTdoNkNaQitxTmY4UHJvQU1DTzdMVjY1aFprWmoxV05maFp4TDlZM2o3Z0dR?=
 =?utf-8?B?VEZwWnhmbmNRR1IzeVRvaWkwVndEbEd6aFZhSUcrajc2WEhpd3BILzQzZ2RU?=
 =?utf-8?B?SXVEQ2t4K2QrbnUrVTV2L1huZEpRTzdtKy8zdkxxaTV0aW4wenk4STk5Y1BE?=
 =?utf-8?B?QzBxSUZMdkl2ejI2aUlIaW9mNkdQM3dwZ3lKNXAya2dnSnBycGo4dEhoSzRM?=
 =?utf-8?B?Qmp6Ym9DOHp5bGFkYkdGdXhCaEpqMnk0Y3lZeVdTcUVnZ2ZPbzE0MUdBZDVR?=
 =?utf-8?B?ckFkcTNwMDh6Y1E0VG1Zb045MHhSd1ptODkxVHFXNDhyM1MzM1BKbXpiVklT?=
 =?utf-8?B?dnN2ZTZWSnNFNkdIeURaT1hZckFhR1NHWE1VRlQxN2NIUFZnMWk5Mkl2Y01h?=
 =?utf-8?B?ejlLdzJJQUhPUVdnVk4zLzZuZG9sdWVEeGplYTRXMjJPQTMySXlFdEgySTBI?=
 =?utf-8?B?MHNpOEd1VFJBa0c4N0h4N0VzbENBVERXSExQdU5LMzZtMnNJNWxaR25lRlpB?=
 =?utf-8?B?SFlNc3ozMktEL3B3QWFhTk9USU4wYnBMejFCcGM3WFE2L3ZKaGZOSGlxQUJN?=
 =?utf-8?B?bE93U1FLWERCRG9YZHNzemRDaWgxKzZNWTZJWUN1MGxmQ0hwSEJEUWdCL21Y?=
 =?utf-8?B?N2tzU3Z6Tk9acHh0R1pxc0VSTzJZT29zdm1oVUp1Nm1TN2ZURCtKNkc4M3lF?=
 =?utf-8?B?RWh3djBHNzV3eHFTNjUraEd3amhkQmdwZUNFbUtpM1R4dTR0Y01iakdtS0Fs?=
 =?utf-8?B?R09DYTA4Tkxob3lNSis4SDlTcTQ5MlBiNGZkSlYvTTVuVDRZTU16WG94N2ty?=
 =?utf-8?B?UktsRCsrVkVnUk14WENFWWNjTGVVZitVTjJySjBpNS9qN29rcjJGTldiZTJu?=
 =?utf-8?B?c2c1MWx3Rno3L1hOdGFaa2JYOXpSYkptMSthZHh2QllLNm0wNjRqKzIvNjRD?=
 =?utf-8?B?em5lUmFYMGpOcDNCR00wMXRVYUp0RklzTWJ2UVF3alNGSWJWTElhZStjTDNv?=
 =?utf-8?B?dFNhWWZ4NzRDL0RHQ2E1YXBNQTFiOWJidkgvWjFhVWk3K2hkTnYyZUU0VUVJ?=
 =?utf-8?B?S1NpTkNwNFlnTHAvUi9HWkhQRFlGQlBTa2NoTEh3ZzZqVFBTbTltSTVnN2RC?=
 =?utf-8?B?ZTJybk1oQmF3N0tCR1pKdmdYVXpOdnJuK3hxMkU3d3NXbHdXT2JsSWhoME5H?=
 =?utf-8?B?T25BY2d2RE1GREVzVDE0dlhXTDNzLzNIU3hNK3JESk9wdDFTcXBINWpBRlpw?=
 =?utf-8?B?VHBHcWozQmVWdW55bFVPR2NoTVdYQ0pYYWh2d3RYOU5JSE5aUVJqL3dYeXZX?=
 =?utf-8?B?eVN3QzMxRS9DVC9YZmVJVlJ0aUV4S09XMzJOb1hLTS9PU0dKL0U2VVJhd1JR?=
 =?utf-8?B?TUwwd0dtWkZickYvWFlLOEJINjRVT1BTOGNUTHgyTFRrcmhENStwdHBWcHZ1?=
 =?utf-8?B?RGpvMmRyMWdtbnRpOTBtbEFKT0ZVeDMxNkU0OXFaWTBjOVhpTm4xY1FsY2oz?=
 =?utf-8?B?VTY2Uk45MlFtb2hYbytFWjlsaitETjdQQ1A0dm5rSkZudFZlekZOSEJ5d0Ro?=
 =?utf-8?B?R2ZIZXA0ZWcvdmJla1FPMnNlSUVKRG5uWXkzSS82Q3h6MjhHekFOb0N4am5m?=
 =?utf-8?B?VVNnZG5GL0FPSFNuNS9mRjhPcEVFMGRET2Z2bWV4L3RDSTdDNXYxb2s1OXMw?=
 =?utf-8?B?d1dXTENhZGZERWRBWWtyRURtWlliSHMwa1ZYSTR1QXNrOFpDbEJzSkRMRkc4?=
 =?utf-8?B?RmpTQWJwQnY1ckRiYmpDSXRRZlJCQU9YUklXQy9veUtVR2dsZGlRTm9JYjB0?=
 =?utf-8?B?dlQvem45WVdpdG1yVnpjaHlaeHdVWisrM3QxOXV5RkVPQTF0SXByK0d5QmZJ?=
 =?utf-8?B?Y2sxd2gyZ1RvL2NqNFBOUFVJbk52TlJjRDBwcEZBVzZWMzlzcmN2MzczSklK?=
 =?utf-8?B?MzRob2xCelh6NUM3eXR4cjNiRlpPUW5yNUdjbDQ3OVh5YU56aG9FNkJnTDZN?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c26c652-3e0e-42cc-5472-08dcdc08426f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 19:45:21.3869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpM/ZqzxQydl9p/MTJIu8HbVd/+bXotE3ta/GQKte9ObnuJkJw1TBThjffojU+CQUinzjPCJC2ch/u85ehQfVrNGnhKtPrc7voMOO1Je6lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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

On 9/20/2024 07:48, Jani Nikula wrote:
> On Fri, 20 Sep 2024, Badal Nilawar <badal.nilawar@intel.com> wrote:
>> Do not review
> Explanation would go here.
>
> [CI] Usually means everything's reviewed, and this is just a resend for
> CI. And there's no need to resend multiple times for that. Patchwork has
> a "test again" button.
>
> Finally, the patches are missing your Signed-off-by.
>
> BR,
> Jani.
I think the intention here is to just get extra CI runs with more debug 
output to debug a failure that is only happening inside CI and cannot be 
reproduced locally. Although it is generally simpler/clearer to just 
squash the patches down into a single "Add extra debug for CI failures" 
patch rather than re-submitting an entire series.

Of course, the ideal would be to actually get all this extremely useful 
stuff merged and then it wouldn't need to be reposted over and over to 
get more CI results with it enabled.

John.


>
>> John Harrison (10):
>>    drm/xe/guc: Remove spurious line feed in debug print
>>    drm/xe/devcoredump: Use drm_puts and already cached local variables
>>    drm/xe/devcoredump: Improve section headings and add tile info
>>    drm/xe/devcoredump: Add ASCII85 dump helper function
>>    drm/xe/guc: Copy GuC log prior to dumping
>>    drm/xe/guc: Use a two stage dump for GuC logs and add more info
>>    drm/xe/guc: Dead CT helper
>>    drm/xe/guc: Dump entire CTB on errors
>>    drm/xe/guc: Add GuC log to devcoredump captures
>>    drm/xe/guc: Add a helper function for dumping GuC log to dmesg
>>
>> Michal Wajdeczko (1):
>>    drm/print: Introduce drm_line_printer
>>
>> bnilawar (1):
>>    [For CI] Debug prints/logs to debug G2H timeout issue
>>
>>   drivers/gpu/drm/drm_print.c                   |  14 +
>>   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
>>   drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
>>   drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
>>   drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
>>   drivers/gpu/drm/xe/xe_device.c                |   1 +
>>   drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c                | 416 ++++++++++++++----
>>   drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
>>   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
>>   drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
>>   drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
>>   drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
>>   include/drm/drm_print.h                       |  64 +++
>>   17 files changed, 804 insertions(+), 144 deletions(-)

