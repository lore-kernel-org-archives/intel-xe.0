Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE12CA0EF5
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 08:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B2910E54C;
	Tue, 19 Aug 2025 08:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwOntYyH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8484C10E210
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755591639; x=1787127639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7tjqBA2p1d4q/87FHnJzVDHFtXIUKC2jzHHdtVFXDY8=;
 b=UwOntYyHi83sWmy9I3cv9lfzcZCbc2cWviUU4c44UWsrw+NZkhJhNaWw
 TcEc0sKCg5HjPxR4S8sI/BJKgJQQcO8Efd/eN3x1gHMT8lS34c0wUH7XV
 VQ97NiJiM8Ll7ZhfRRFEaJSk2z0IHO4c9xZpwlR7CipNLYyz25GjxRX2e
 jEoILIdVZH10B3k6uJPCEHYWFKRfHNtvnoScsG0KF3cerU7ekUa3Y/TY+
 8mnR9LPE9A9RtIip4522VdpkfmNTqN4OiWh2wJHPWD5b+N/E7AJ5hHjea
 NRAHy/YZ1aMJUqmvwJNjsKI/viCjMbEJRFaeEEXvyeS1kvK8Ade6uWWUL g==;
X-CSE-ConnectionGUID: 47L1IdR6TzGGSZbGb4AVXQ==
X-CSE-MsgGUID: 1pkbVQBHRryCpr2zXXcUcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61661001"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="61661001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 01:20:39 -0700
X-CSE-ConnectionGUID: bC4mCNnlRsWwSLzzdLLfug==
X-CSE-MsgGUID: H9CxfVCMSqueuRNdUc/IEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="172214977"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 01:20:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 01:20:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 01:20:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 01:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTN6GQbCUSJWW/sTZiARDUtD522X5oXpbyZ1b4VxY/ibveKCZtqi0aYVpGqyMb1Zx/RbDjM4dH71bZAkKujsFMjVLyj9WXs6+9HkuegIhOWjHFIPaJyKY/CVvH8HsUhFsV89453LbBs/WmMHIVQUnPYervw6NA+otAnKLG80gSPB4i2323hiszzyCGXgWtZ7SMg04qUa4H4DmK6wMGwC3fqwqNRAI0CucUFvCeMpVt+c3w5pHXYxl0s5AyOHgB7h0qpBseFdgpQTQQz8Tuikh2r0C5DQM34E78LU2dWBtd7qN8dwWKl2GwQATnL7/0n3O7eE/LXPCVSafz8gu8pNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6eDo/CIn9mE9aJfNvnW2MuLc4INbTCv1kkQxXblbFs=;
 b=CGek2Pf5Re0qpi+AGqFE7S2PZpJ0RsEgsbhrBPfHRe8aiHgwYtB5RjO1i5qj+zSoj+Pm/ONwv84nZWQ1F6kxZWXx7ODem0NrDmqgQ5kUuyfV7yDykMKfvUvD39GkleY7mjPmH31vwpqzhcYxyqyzfWxQTlgBBlk/rfBHbMpPzQ2GgMAwyMEf7dpaoNTgf1pw5ZEyRdUJs2s8AZTlJaTSbJcC/UfzIwqCW3oJgiCG0/keypvXY/RbsqWJKCKkq4jg9GfGJCSVozpRf39igHkJgjEcSsbarM21MmdOZRTgHKGJsr71QDJJ0kALQlp4TgDEngUv31BylQUwBIC1EsMqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 08:20:35 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::92e5:185a:2a3e:2349%2]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 08:20:35 +0000
Message-ID: <73b13979-0729-47ea-9525-88d09818a191@intel.com>
Date: Tue, 19 Aug 2025 11:20:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/tuning: Apply "Disable NULL query for Anyhit Shader" to Xe2
To: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20250819061151.1272622-1-nitin.r.gote@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>
In-Reply-To: <20250819061151.1272622-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|BN9PR11MB5228:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a67700f-669a-4282-331a-08dddef9459a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWlZNkZ6Uk1IRDRqQ2FicDZwTFRIVU9YTU1IZWdSa3psdVVEVmpGZzYrOW16?=
 =?utf-8?B?bldxZW9LckdyZGxWTUVPMWI0Y0hLTXlEeUdtV2VZcDE3N1ZCYTBWZVNGN3R1?=
 =?utf-8?B?WmlnL3pMdTF2WVlOVlcwOUp4czA4RUhuU0R1RWNwNzliZytCcDlOa2hyOGkr?=
 =?utf-8?B?ZmVPZExjSE1CSFpjRnpHamVyK1RrWFdnbmk0dUIreVFQWjNvTG5MY0pZb0xh?=
 =?utf-8?B?c2VHcUZwNnByZTJSNDJST2xYSVoxNTkrTnovSityVWhoMVlvWEgwK2RSZEZ6?=
 =?utf-8?B?eHVCd1NMWHNFSWpNOHFoWkpMMmhseSsxd1J6MTJ6MmdidXYwa3VpajNmMnpP?=
 =?utf-8?B?T3VHSk5jRGxoZ0RtbW5DaFpKU3JaYWVBcmpGWlJ1TkVKdDd2OHZ4disyS1Js?=
 =?utf-8?B?UHczT2JLQXI4M1p5YngwZUp2S2k1UXJJeThuL2RRTGFqU1FhSFdRRHJYc2VU?=
 =?utf-8?B?SGpFVFVvNGlRWW5VN2sxNUtBQitGTGU3WVdmMHdzOWx4ZzJ3YjcxSmw2eklk?=
 =?utf-8?B?ZXNwcW41MGJSN1hCcHF0NnVUNE43UXRIWTdQUHNweFNERE84TnNTUDNOb21s?=
 =?utf-8?B?NzdxNEZCQ05ENXl2WE9JbUF2ZlJtcVNqaHVlNVMzYXlHU3Y2TjFQaEtvckJq?=
 =?utf-8?B?M0ZLbmo3djRJSVJuaWN0eWhKRzVsa2YyYXlVTkVjcEpsWnp5Ukg5UFRMWjlC?=
 =?utf-8?B?VEdvRTJhRmx5dW41bFNxQktBWWtIR0Rob293V0dYSzZTYTZNd3RoU0pzVGRC?=
 =?utf-8?B?elBZdG10V01DVXptMFYxOWI3a01vRUdmT1JxbzRpOFc1dUxic09Hbm1xY0l2?=
 =?utf-8?B?NzBFdEo4WVkwZHd3QW5rV3c1L2ZBNXBmKzZpU0JqRXZ6MlpiN0ozb28zbE9F?=
 =?utf-8?B?RTNLWVFQRzVGMHJlRlk4MFhxRUMrTUZvNHN0SUhKR3A2ZlU5OHFIcWNSd3Nj?=
 =?utf-8?B?ZndLSzFjMjRYUnh1SFl1K3Q3eUxIdFEyQldod3RSN3g2czRDbDZpSzFvcC93?=
 =?utf-8?B?NXdQWk12SFozTTFNWUw1em0xa216emtaWktCemRFNWJ0alI4WnFaNXcyYVh5?=
 =?utf-8?B?a09xbWdBV3U5M2ZwSXUvYzMxeDlrU25Ud0p0NDdYbGdoa0s5eXcxNndjZXBq?=
 =?utf-8?B?RmNYMmVZMWs0QUZLSkU2UWFrN21zY3Ryc05QL2VDelV1dEtMbHpLb1IwL0xt?=
 =?utf-8?B?Tjh6ZDRqdmhjcjYvNDloU0dqVkduS1YrdUpZYkVVQk5vNER1d3dPdmdDMm1B?=
 =?utf-8?B?RXBlODA2S0REUDdyRHVYSXZHVTIzSm10ejhBVDFOUVBLdm9rUUVoNjljcHhy?=
 =?utf-8?B?c0xjWXZtcklsbjFjTDlMb1I0bDlXYlBiNFdHVkRuTGJ5aGs2UHF6MWVGOGVu?=
 =?utf-8?B?WDNvZHJwVVlNcC9SNVh1bXpZems4RWp5SDlzRWJicHhDNyt3REVZa2FRYWR6?=
 =?utf-8?B?UWZLWlkwT0s3eTBvMnZZb2M0VWJ0cmo3Rld0ZXl1b3JYVTA3Ui9vcFJDOGh1?=
 =?utf-8?B?Wk1CcHV1dE03NTFteW5BeGdNU28zMFpoT3lIUnJmYVA0ODZmVHdIWFQ2Zlg2?=
 =?utf-8?B?ZnhyQ0lQR09BSEhVc1dXbVhIYzg0RzNCOHpMUlIzVDJ2UDAzUGphTDN4Q0dQ?=
 =?utf-8?B?ZlpHWEFtQVNUOFpXOXN2SnlzWnRwNm1ReGlwcGpBVmNib3hlU1F1aVB2cGdl?=
 =?utf-8?B?VDNFczZ6eDdoUTRxV09kVUFrMXA5TW5yanplL1hhZTROYWQ3ankwMDhyRndG?=
 =?utf-8?B?d25xRkFEYVkxWmpRWXVxM1lvTjdCUU9JN2gxV2ZvRllyMzFHT1ZBeUlDZ3Fn?=
 =?utf-8?B?U3hGTHV3TEs1QzdqNHAyMThYODZhaWJVQWtRcGlMU1pQc09Ib1IxMUpkNjRn?=
 =?utf-8?B?T0pObk82OERFbjNmenFJc2hLM1Jrb2V1VU1MNnR5VnY3cXN1TVdpVkY1NEwr?=
 =?utf-8?Q?Y5aNhH2XhbA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkdRVlRJQWJLeHZmS004c25KQlorZUJTeVVPeDRMZVVINzFoS01nRVA4VE5z?=
 =?utf-8?B?bnV2NVhyYy9abEFSUWk4dDl2ako5eW1Kb0pCWVdxSG43eVpNY2Y4VE1hZFVH?=
 =?utf-8?B?Njdlcngza3pQN0VIVytYZHFnRk5lZXZIQUxhVERmektLQUVueFBKblVFL1ls?=
 =?utf-8?B?WXUybDNkOXdRNmZmVERaYTF3VlRqSFZXUmxZNFh0dzdmNWVrdUV2VS9GdUpC?=
 =?utf-8?B?RXZwaERudHl4NDRhcjJBWWc5R3pXUVp0Z2I4TVhhbGV4bDV5d28zME0xRnNP?=
 =?utf-8?B?MGgybjc1Yk9EWkVkS1FzVm9vejBrdjhnOTdpa2duQjlLUTM1Nk83U2tacDRI?=
 =?utf-8?B?MCtEbVVqWlZxNTlvMDJXd1VGTWhUbGdlNlQxYjRvVVVwaVJvV2RvTUJoVjJ3?=
 =?utf-8?B?OW8vMjcvRG1tY3ZkeHRpcklpc1o3enNDSmxLSFlxSkdrSnlVTVkxNzFWR053?=
 =?utf-8?B?d0o0KzQ0RlJXdEVoVTVPYkxCaXpBVjR1TkhLbDVseHJPem1GdVpkaXpEYzlo?=
 =?utf-8?B?c0ptSHhzSm5rZy9NOUxtN21JZmtSU1BnbHZJRWIrZk9TLzJUbWRqaVVoUllv?=
 =?utf-8?B?Uk1FU05WSitEWURKaE1wVUQ1Q1BmT21weG8xbTJzWGxOeXl0OC9IazdRdEVz?=
 =?utf-8?B?QjRmVHk0czJpS3FkVXpaWFRobGJoMFRteGwvSnVvU09zWTlKcXhYQkdydDdV?=
 =?utf-8?B?NWsyT0tsWjRKVjROU0lwV2dZSkh0UXVkbTBlTGJGU2gwaXl3MHpBazd5ekI4?=
 =?utf-8?B?VEc0RGdqQ2VNV2FVbGpSdjNnVGZ5ZGdDQkNyTUNQbDlLSUhnZGd4dHVEUGND?=
 =?utf-8?B?VjhQZ29yYnk5b3NCeHRYTmVBM0VNMXhXNVVmcEEvNE1OZENUV1o0SjFYaVU3?=
 =?utf-8?B?ek9RNlhteXVhWk80YUtETVZGbE4xNmxPWkxSL2xLMmJ2RlRCUHR5MHpXb0hp?=
 =?utf-8?B?WEpUTlBaNk81Y3FiaFQxWEEyNzhXUCszYVBITHVyQ0d3MnVrdDlvem1mSHlx?=
 =?utf-8?B?MW5ZTmthcEdrV3ZBekdGdkhnMXdNSytGN0syM005S0Jqd0NucVpJMzFRUUxD?=
 =?utf-8?B?a0VDM2hLRnh2UXE5VExvRitVQmVRd2dMZGRybXVqR1J1bWl5V2NvemF1Umt5?=
 =?utf-8?B?ZmowcFdXNmFNZzA5VzhiMnVPUEVRNHRkQXJWYWw3WDUrS0lZcDhRVUJMS2hx?=
 =?utf-8?B?VzVWTHlJNHdnY0NjS21rd2xMdnptNWE2Si93U2dGMUxSOHFBU2NCY29aeU1O?=
 =?utf-8?B?Yk9iemh4VjhsVm1xZmhyMjFPcjh0Zkp5OGUxeC94bmpMWks4ZjAzaWtxc1VF?=
 =?utf-8?B?SDZ0aGk4RmpqN0NwaUtsTnQ3YVZJYThQQmNlMnZ0c29FZG1SUkJUSzBYM2ty?=
 =?utf-8?B?c1ZFRjhCVkhiZzhpNXZ2S3pnVitoYlVGdjZGd25mTUlXclE5bFRYZjE5ZHhI?=
 =?utf-8?B?WFF6YUFBY1RoNmQvdExFT3phM3RYN2h6TGFLNGVLbUJaTlpCcWZSdDFpNVlV?=
 =?utf-8?B?MmxKT2xFVTZUTTlFSGVRNm5zOXRUTUhpWWNFOGRRVkxqN2g5Qnp0T2RUb0ZD?=
 =?utf-8?B?dVBEN2JKZTVsTE5wMWI4aldNNDhsbzZiZjlqUUplZkhtZENCRjNoZFVBaVZR?=
 =?utf-8?B?a09KczF3VXRhRWhrUTF4SC8ycWt6Qm5lQzMzbVhPazVNRjZQUVVhZjhKQ1Zn?=
 =?utf-8?B?UGVyRjF2UU1MdEdhTUFJTW5rc2RzNlJKelNBb1prallBQ0RHVC84SVlPbWpz?=
 =?utf-8?B?MlJLR1hCUGhiY1MxSDFlL3NScmo0YXU2RW53VzlmdlF6OHBYbnNyMnB2TWZ4?=
 =?utf-8?B?YmZlenpVTy9XeEhUY1lzOHlvKzVKN0Y1bWlidjcxZERyZzJXd250bGhycmxM?=
 =?utf-8?B?U0dpQkZ0RGcyRW1UTWZxQmhQYjh1QXMyOHN6NEl4QlZHNThVbWxybHk3SXQ4?=
 =?utf-8?B?NXp5cDJSeWNvek5DL0Rxa3I1WlBXV0JIVVV3bGxmZDJpUTVoYmR4eHAxNmUx?=
 =?utf-8?B?RDQvWnZhRWkrc1V1YllwTUNlRFE0QlFqKzhkcWZ6ZXZoeDExQlhNVFlPUGpL?=
 =?utf-8?B?MG1ZNFgxdHNIY0RSSWNFZ2lYdFVRY2dEMTVnNnFUajk4UEFnWXBxempKdVJ4?=
 =?utf-8?B?SWVIOE5VK2t0T2Y5VklBcjAvUjlBaFhKRGlVT3hFbFVCL0tmd1lsZWpPV051?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a67700f-669a-4282-331a-08dddef9459a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 08:20:35.5530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4weNgh/XrnI53nnEdRLyMWeNxCV//DmLxE59D1LbQj1UmT7Z2pOecoScNBVJk1W10MnQ7jY9U3xqnOUm0rfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
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

I did round of testing on BMG with this change applied on a drm-tip kernel;

Acked-by: Tapani Pälli <tapani.palli@intel.com>

On 19.8.2025 9.11, Nitin Gote wrote:
> Extend the "Disable NULL query for Anyhit Shader" tuning to Xe2
> (graphics version 2000+) platforms, in addition to Xe3.
>
> This sets the DIS_NULL_QUERY bit in RT_CTRL to disable null query
> for Anyhit shaders on both Xe2 and Xe3.
>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_tuning.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 828b45b24c23..a524170a04d0 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -99,7 +99,7 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
>   	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
>   	},
>   	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, XE_RTP_END_VERSION_UNDEFINED),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
>   	},
