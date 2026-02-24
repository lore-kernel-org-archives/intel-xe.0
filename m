Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD747F4BB93
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 22:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F80310E339;
	Tue, 24 Feb 2026 22:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwnHohja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4F10E339
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771971641; x=1803507641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4VpWTw+Sknvgf1PNYwrrnJ199cFdch4XSaxh5WG3lmk=;
 b=QwnHohjaA+vvx8NZGPqe1mr3LqOXJJondTZWYy1xQ8scua2TI900q9bH
 nEATIgs68U7FA58tk9EL1cZl07hLVRQftifFenYNpusWM/ukbpt+h6YJJ
 4dSKdrfF+jteIOSDVvBJmM4G704oGVoUWJHcKahffHZAhH6SUb4dyZyVU
 44jKYMPL07XM4AmIhW7+b5q8LBDYE1FNO38y4YGMtCyAIHDL28OSM7pn2
 8Z5PaqkG/xlKxX/QqqAqDmNWOfXJxEyhbbHaNCvg6DVcexstO6uEusBaI
 PumI8BE3iUom2gmr017Y8xb5P0zA8JhOrmF6slGaDavMY6hOqbM9uXtnr g==;
X-CSE-ConnectionGUID: v1BjVQFpQfOODUKEEsE6fQ==
X-CSE-MsgGUID: c6NSX3JJTfeWMVfNYy7Z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83323459"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83323459"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:20:40 -0800
X-CSE-ConnectionGUID: /Akq9ZkdR9i/riRdgs5KdQ==
X-CSE-MsgGUID: sT2+2dsHTQCIUg6/n6nEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="214868875"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 14:20:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:20:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 14:20:39 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 14:20:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJCF7GoNlBNwqmWas+vC6VAG0VZ+a7w8mhLSDyXEnS6uIXOihxjFLCqwO3LmA8/b3PeBv9dMtJa4g4gAv6GcaULoiq4XpB7VHcaMuIlsAFf7Co9BVtU2UODLs+14866Bm6u36VIQBKfJn9OTCwyeXJExRz6YSJdHVyxw2WAn611Zxo4SWNC4dd/Mfm/Roa26+yCm1gmDE9ec1Y3lqzvgH9vbpmxXcLGO1S5tWOaKUmvpbBWozlSolFiPFr0VF7ZOF5vbzuXD/K/THc10rEMWoWyQFaX6M4AABTOQwjAQ8zknA0bUz5vQCRpYNAdS8X/mGuyB9+rWfuphwBLPU5gexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t3bz2r0zJ00ltm357bcfKtJARdJcik1Mu/Nce5F5jg=;
 b=jrJyoMVHnp2iLySD39AXl+kZF8g6FW+yST0J5IUWZBPZDwZmWOJxAsITYLskG+AHkSq5xfMkYvcE85egQbsfybaPkLNPz6bSfSVsFm+uxmsYox0Ar5NmNqDzufb8nWehR8W45IKTFCUQ2L77NrxLwsDJPBNeAq07VdM8uEz5WQ8EudqiIP1EAGH3PbCOFP6eNJT7LwFVhtKz+X9wBgQExSkQ+8HsFYfZvvHt0KiVRHcBq7sFDp3b/YKrzmechLn1TxJU9bMNehU/5FuSseQucVPXwDmDxiseE0LF8jFLFpU+fdHH5oM7QHA8ZaGosCZc9OBJEl/ncNu9p67g2pnXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:20:36 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:20:35 +0000
Message-ID: <c42a6636-c639-4c4c-93a7-3755baf351bf@intel.com>
Date: Tue, 24 Feb 2026 14:20:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shuicheng Lin <shuicheng.lin@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
References: <20260224023354.182306-1-x.wang@intel.com>
 <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|MW4PR11MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 9768948b-9759-4940-87d5-08de73f2eea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|42112799006|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGkxWEpOQldFd1YwZTI5REc2UFlOLytrTDQvS1Yxb1JWMElpVUFSck0vY00y?=
 =?utf-8?B?cFZMSDdHR3NqVzRSZDRxNTM3c1dTeHhRQ2RlclphWlFJa0R6TDZ2WU41ckhB?=
 =?utf-8?B?UWJETUU2OVB6UElSUCtpWDRlNU5lZ2Fubkd0c2JzSnI0bEJkWmRGaHg0THd5?=
 =?utf-8?B?NHcwUjNuMjZLaldONVEyNllqVGFpM2ZlajdvNHNlOEJIbE1uc2hpM2pYcDV3?=
 =?utf-8?B?UTRndU5ZUWNZUnNUbzRRamQxOE5SREkzdzh3RmI5QXEvVUhkSmFlcGVXU0h3?=
 =?utf-8?B?VklJUUs0NHk1azRzQmdLWXovQjdQT1B0Qi9EbzE5Q0N1YXZZeHFUREhQVzlP?=
 =?utf-8?B?TEd4TWFiNUVoWUxzQTZwYktIbVhhbVhBUFB0UHJ0WktGN3g3Sk5Cdi9ZK3BI?=
 =?utf-8?B?bEUxeDhtdjhPL1hYVW9EelNOczVYWmF3ZHVObnUyYTFBRXAxSkJDeXdnTGhk?=
 =?utf-8?B?Q3Z1dm4zNS9XcDBHR2VndExweHYvL3RPYVRIM3dzcjNUOGFpay84VTJpYUU2?=
 =?utf-8?B?dnN5Rkx3SVcxSzJCT0QvUS81RUFHZWJER2VJVzlBSlF5dkZHVTF2WHdNdEVu?=
 =?utf-8?B?cWFZWHJLVWhnZDRORmwxdEpTYmpJU0Nwa2dGZEdJODByaVl5MzNiRUYxQ2FG?=
 =?utf-8?B?STBOTVJvbWRWVDljNkhVU1JaeVg0Y2FQUjQraVJORmdJOGwxRzJwU3Z2Mmpp?=
 =?utf-8?B?RThQUUk2ZVhldk1TZWRFN01TTUlVWndXTWdYZ1FrcUV1SU9qOGRZYjNvSklp?=
 =?utf-8?B?YjlBbkxzeUVma2docDlTaFNOcmN3aVVYTS9nMEJDT1IwZWd3c3RRSm5ESnh4?=
 =?utf-8?B?Q05TOUs2aE5GL1VNRXk5SGcvaVJPVnlkNjVBT1ZqU3g0RExJZVZDTGpod1lt?=
 =?utf-8?B?Y1NoaFpKendyZlA0M3RsTWxEaWdVZlE3d29BcU5qV2U4Y3BlOURINm1Uc3p3?=
 =?utf-8?B?YUl6dVgrQzNLdGYwV1hBcUFPN2ZKakxqNHRCcENCUC9kQ1FvNHl2cHZqMHZN?=
 =?utf-8?B?enNKdUpORHU5T0xuWlU5UERQOEczSUpDR013NEZFL2taU0RSdndkdnlFRFF5?=
 =?utf-8?B?and3NkoyWnRQRXZhcUJndzVjZ29xVXV2c1QxTi9Ra2pQY2tPN2FxMDlnVUJR?=
 =?utf-8?B?RzJFdHlhTi92OFRjaDNyeXp4YVNXbW5sbVpkcXMzV29VcHNXVCs1aXVrSEY3?=
 =?utf-8?B?VGxJREF2RmxtMTRMMWZGZmZlY0x5eFhORUg4OUxwQTBIRnk2Q3hpU2dXZEo0?=
 =?utf-8?B?Z3pwaGk4aWtRVEhldXpuVmtTQ1ZzbWNobUUxYU8vREpKZ0wvUmE4NDhZSE56?=
 =?utf-8?B?VEpIMzFkaGJRb1pZc1lzdVNaSGJEeTdrS1BwTnRUQlRLSjE4aGlwSHZZdmxP?=
 =?utf-8?B?bHZpcHlJQzNSYk84cVFUU2FpRGNrZG5KRkVubUlINFUySG1oalM1MXN3Y2xo?=
 =?utf-8?B?SnJ2azRDUkZpdy82MXdXdWVBNGdvbFViUnR4ZHk2dnpWcUFnSno4VndnRGdn?=
 =?utf-8?B?QzV2MDVybTZZcXVpZUVISEZoTm92N21CY1B3WnowdnlweEFtV3c3WTZUeGN2?=
 =?utf-8?B?TUtJRzBMdmZXSmd3ZURJYlpnalQzUm56OGZxYXBPcUdwK1o0amJ5bzZvYitU?=
 =?utf-8?B?Q3BOOENNcEVBaklDS21qcE9NalVJQ2pJMm51RFMxNUxuSWszcVRjdzU2YWN6?=
 =?utf-8?B?VHpVZW1oVFNKNkZZUmVPVU5LRlE0RXdWejd3bDZzNFpLcUVsTEdqSkxJMHVG?=
 =?utf-8?B?czBEemJUYlJEWGFYSlVJaTgrbmtFcktSRHNqQnlTeE15cThqVW9BWmU3bm1v?=
 =?utf-8?B?V1ZxaFhyd0tjNDlKeEdJaFY4OTdYMW13UHpuZENjamFBSlcrSFNrdHZBdzIz?=
 =?utf-8?B?ZkpZNFpXd2NzNFNZSEpBUTgrWmV6cjRvRlQzNE45QUs2Z1o0UzNhRTJ1U3hs?=
 =?utf-8?B?S3k1SHBWTnlxSjArRnpJWXppM2dNM3Areng1a3RxaUZicGtGb0N6OERrVW5p?=
 =?utf-8?B?RUkvRzhRcU43RFQ4Y1Znb0ovZGFqcTJZWnBPa1g1MGw4amZxNnZSRDU2KzR5?=
 =?utf-8?B?cWpscnVJNExMSkFoSmNqL2dORFVJbGs2cmlQM2NOQVpqOHdlRFlnRG9IdXNk?=
 =?utf-8?Q?W28E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRaU1VPV1o2NDBtaERyK0JTSTRjSTNYM0hobUJoZ1pEc2dpWUNUb0VsSUdh?=
 =?utf-8?B?cjBEZkZib0czcXRxMk9XNXlyWE1Gd1hNSlpsVUF5K1JJckdxai9TOXBNc0pE?=
 =?utf-8?B?aW4zYkw3TlpLdERzNUpGS1p2ekVudllFSjRnS2YzMHZuc3VsVEJKTzFDUEZY?=
 =?utf-8?B?NEhiVURobXNXeDNjZjY5ZlFZcmorbEFIR3ZOZ1RKOWJRUjFSemY5MEU5QzBl?=
 =?utf-8?B?NXdXMFUyWmRMQXdNQW9QRlA4R2NXTHNvUFVrL3hYM0dJcUkrbU9yd1dTZDdq?=
 =?utf-8?B?UkdOUjBodmNXd01kM2pvMUJXSXg4SFJiVTl4KzJrS09oNzA2b0k4VTd3dUZj?=
 =?utf-8?B?c1c2MHlwaXI3VFNYbFhLOUk4V042VnhCOTIxR1VMdll2U0lFRGxHeElvTDRM?=
 =?utf-8?B?UEpwQ3A4cEF3ZEtrc01jZTR0emtrT29RV2ZQbFdnaXlJN0wzNUhpRjZ1amty?=
 =?utf-8?B?RUtwaDZOcUJMYmJ0Y3pWRC9vNWRLK2g2VnVTV1hkT3IycU5oYlhEcVRZSDlp?=
 =?utf-8?B?a1lOQklkOVdERDZZRnQwS3B5UHBJeGtwTUIzN1Fkc2tyd0I3elJiYmJFV0Js?=
 =?utf-8?B?TnQ3T1JNWU1YMVNOWHZRdENZSGtKRUhJd1lpZ3FNME13VmhJWE9yZ1orbi9N?=
 =?utf-8?B?N1ovaSs3cXFwSTd4cWFNOVNUM0NrVnM2aEFjcURRYi9KYUNtNVBBelBUYkNV?=
 =?utf-8?B?NjVaQzAyVjJ0MHdhckZDZXdDNEUyRWVQTW85WXlXS21DR0V6b0s3QU1HN0s1?=
 =?utf-8?B?OG9XUjN2cWloM3ZSeHV4NmlUNVd5cmtsZXFveEpxNnJGL0pUdUQ5Z0FKZURk?=
 =?utf-8?B?MjFkNkJYdUtRLzZDSE9lTUlyWTBCTHFMNDRHZHU4bE5JcnR5ak1aSGJ6Yk9Q?=
 =?utf-8?B?YUhXam81Q2l2R1VkVFRjMmprSHozWlNvVFNZWjZIak9mdThHNFpoZHN2SEVw?=
 =?utf-8?B?d3A3NmdTRnNHUThmcGt4dTMzOUZrU3Nldm9LMVRPYy9CVmJtQXRpdi9NbEpk?=
 =?utf-8?B?VjloZDR0aUY5QlNVQi8xeXk4ZWJqVk1NejUxaGc4K2lRQlBwaUNndUdZTWVD?=
 =?utf-8?B?Q3FCWkUxcjdSS2svZzJydkxFaTY1MUlySWxZTDVMc0dJUDNGa0h0bW5meFpx?=
 =?utf-8?B?Nmx3czNoeUs1YmpGVzNGQlY0MmxvNHYzUERhQ2JvWmpnQmZjcFpmZk1SbkZG?=
 =?utf-8?B?WnFKT0RXT2dyYUFBV2N5RkVXSExLYWN0OHNrRjNidzRPK2doZHlIbHlvb2pa?=
 =?utf-8?B?dnhGb2JxWERibWV4dzlEU0owczRjZ3VJNGptS2lVTXprUU5wMmVjRTRQNzVF?=
 =?utf-8?B?cGdKMTlPNEJ5Tk55QjZkN0ZZdUJiSUViNUJDU09BdHl1MDdydEFiMGVwb2c5?=
 =?utf-8?B?dHZiTE16ek02dTlnWEZxQVdYakQxSEZZcWF4VjhGMkpKZVNtemc1S2RPbFdI?=
 =?utf-8?B?RGR5V3VsYTZNbkxtZlVqa3N3VGtTNjRVTnRqdTFncGowTFlhQnFuUlU2akFD?=
 =?utf-8?B?S3VueDkyTXI2UFhPcXJpS0JWMkgvVXQrMDh5bGVJVWo4MUErZ2VLV3ZmL2ZU?=
 =?utf-8?B?Mm1UUEZJMFFlMG12TUF1bGw2eXVsU29uLzJtMnkzUEtGVVkwMFF1OThmRmRC?=
 =?utf-8?B?TFVsc2srWkdIRzdWOEhXcGlxN0kyOVZFNGQwcy8yK1o4TUJPTDN6YUdOdmY0?=
 =?utf-8?B?Wng5ZGwyZmV5RnhlbmlVQUtUNEk3dEZLRCsvM3JvVytpeE9qejdab3JhYmFw?=
 =?utf-8?B?dVNVY0ZyTVpHVTJEMjRjQzloZ1ZFVzdUa1M3K2J4Tk1DcFZyQjhoRlpEL0dY?=
 =?utf-8?B?N05QTG5wa0pkTUhzZ1VsMXNFbHNrUnRvNjh0b2tjZzFobmtMalVWcjRxcmM4?=
 =?utf-8?B?dEZGN3gvNVFiYzFkYWsyaS9rbEdKeEFJVWMxbEZpOVpkSlV0dy9MN1I0YzN0?=
 =?utf-8?B?WFl1eHVhWmg4UzMzSGQzdEY1SEozazRlei92VHFUb1JuY3JxcTZqbGlZb253?=
 =?utf-8?B?ckowYXlUWnNFc2lFWGpPK1JCZENvdldlTy9Cc3RHYXRMS2JUYnh2cDZ6VkJu?=
 =?utf-8?B?Wk93RzdKVWhKZjRCMitZU3YwRFhvR1ptZlVzdWM3VE55SW9BQW1OcThydkMy?=
 =?utf-8?B?V0Zsc1laY05GVkJqNHhKRjB1K2pXS1VPMVpDUERDbzh1M2FLVWJ3OEFWcHUw?=
 =?utf-8?B?ck95RUlDcjR0YTdUNExCSkU3dDFYQkxKS01lM0d3NTIzRDdZYzNxOUlQcGVl?=
 =?utf-8?B?MU1GeEp2dDBienByb3ZGZnhtaEYwQU91ek16U1BXRkY0SzZFVDJ1bFExWStQ?=
 =?utf-8?B?Z3lqWEVDa3ppMWxLemM5aFc0anRnNm0zOXV1THhVU0F2ME9QMk4vZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9768948b-9759-4940-87d5-08de73f2eea5
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:20:35.7937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqKovh6OdW7nSym6kEzazGPdNIe8TKVA1ykeifKtFvRY1LJ8Kpu50unB4y/YFD8ODIMB/qhFQmyXvxLZKOPYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
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


On 2/24/2026 14:05, Matt Roper wrote:
> On Mon, Feb 23, 2026 at 06:33:54PM -0800, Xin Wang wrote:
>> Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
>> VIDEO_ENHANCE engines only. This check should have been in place from the
>> start, as the driver typically avoids allowing uapi cases that we have
>> no userspace consumer for.
>>
>> Additionally, the GuC firmware on ModSched platforms no longer supports
>> multi-lrc on non-media engines.
>>
>> V3:
>>   - store a multi-lrc enable class mask in xe->info and populate from
>>     xe_device_desc in xe_pci.c (Matthew Brost)
>>
>> V2:
>>   - correct the typo (Shuicheng)
>>   - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
>>   - remove the graphics version check (Matt Roper)
>>   - input more details in the commit info (Matt Roper)
>>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
>>   drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>   4 files changed, 25 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 8f3ef836541e..caa8f34a6744 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -138,6 +138,8 @@ struct xe_device {
>>   		u8 tile_count;
>>   		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
>>   		u8 max_gt_per_tile;
>> +		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
>> +		u8 multi_lrc_mask;
>>   		/** @info.gt_count: Total number of GTs for entire device */
>>   		u8 gt_count;
>>   		/** @info.vm_max_level: Max VM level */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 66d0e10ee2c4..5abb29454d1f 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		if (XE_IOCTL_DBG(xe, !hwe))
>>   			return -EINVAL;
>>   
>> +		/* multi-lrc is only supported on select engine classes */
>> +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
>> +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
>> +			return -EOPNOTSUPP;
>> +
>>   		vm = xe_vm_lookup(xef, args->vm_id);
>>   		if (XE_IOCTL_DBG(xe, !vm))
>>   			return -ENOENT;
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index e1f569235d8a..fe63387d4077 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
>>   	.has_llc = true,
>>   	.has_sriov = true,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> Is there a reason why some platforms list both VCS + VECS but others
> only list VCS?  The new .multi_lrc_mask is intended to restrict usage to
> just the engine type(s) where we have a real userspace consumer, and for
> now I'd expect that to be the same across all current platforms.  We
> should double check whether the media driver is actively using this on
> both media engine types or just one of them (I don't know off the top of
> my head), and then set the mask accordingly.
>
> An ioctl request for multi-LRC might also get rejected on a platform if
> the engine fusing indicates that there aren't 2+ engines of the given
> type, but that's an orthogonal check that's independent of the
> multi_lrc_mask we're defining here.  Finding out how many engines
> actually exist on a device is something that we can only find out at
> runtime after reading the fuse registers for a specific device.
>
>
> Matt
I checked the specs and found that some devices have fewer than two VCS 
or VCES
instances. In these cases, I don't think it's necessary to allow 
multi-LRC to
those engines. This would prevent the injection of some illegal ioctl 
parameters.

Xin
>>   	.require_force_probe = true,
>>   	.va_bits = 48,
>>   	.vm_max_level = 3,
>> @@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
>>   	.has_display = true,
>>   	.has_llc = true,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>   	.require_force_probe = true,
>>   	.va_bits = 48,
>>   	.vm_max_level = 3,
>> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
>>   	.has_llc = true,
>>   	.has_sriov = true,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>   	.require_force_probe = true,
>>   	.subplatforms = (const struct xe_subplatform_desc[]) {
>>   		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
>> @@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
>>   	.has_llc = true,
>>   	.has_sriov = true,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>   	.require_force_probe = true,
>>   	.subplatforms = (const struct xe_subplatform_desc[]) {
>>   		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>> @@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
>>   	.has_gsc_nvm = 1,
>>   	.has_heci_gscfi = 1,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>   	.require_force_probe = true,
>>   	.va_bits = 48,
>>   	.vm_max_level = 3,
>> @@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
>>   	.pre_gmdid_media_ip = &media_ip_xehpm,
>>   	.dma_mask_size = 46,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>   	.require_force_probe = true,
>>   
>>   	DG2_FEATURES,
>> @@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
>>   	.pre_gmdid_media_ip = &media_ip_xehpm,
>>   	.dma_mask_size = 46,
>>   	.max_gt_per_tile = 1,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>   	.require_force_probe = true,
>>   
>>   	DG2_FEATURES,
>> @@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
>>   	.has_display = true,
>>   	.has_pxp = true,
>>   	.max_gt_per_tile = 2,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
>>   	.va_bits = 48,
>>   	.vm_max_level = 3,
>>   };
>> @@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
>>   	.has_soc_remapper_telem = true,
>>   	.has_sriov = true,
>>   	.max_gt_per_tile = 2,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>   	.needs_scratch = true,
>>   	.subplatforms = (const struct xe_subplatform_desc[]) {
>>   		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
>> @@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_soc_remapper_telem = true,
>>   	.has_sriov = true,
>>   	.max_gt_per_tile = 2,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>   	.require_force_probe = true,
>>   	.va_bits = 57,
>>   	.vm_max_level = 4,
>> @@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
>>   	.has_page_reclaim_hw_assist = true,
>>   	.has_pre_prod_wa = true,
>>   	.max_gt_per_tile = 2,
>> +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
>> +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
>>   	.require_force_probe = true,
>>   	.va_bits = 48,
>>   	.vm_max_level = 4,
>> @@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.skip_pcode = desc->skip_pcode;
>>   	xe->info.needs_scratch = desc->needs_scratch;
>>   	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>> +	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
>>   
>>   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>>   				 xe_modparam.probe_display &&
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 470d31a1f0d6..47e8a1552c2b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -30,6 +30,7 @@ struct xe_device_desc {
>>   	u8 dma_mask_size;
>>   	u8 max_remote_tiles:2;
>>   	u8 max_gt_per_tile:2;
>> +	u8 multi_lrc_mask;
>>   	u8 va_bits;
>>   	u8 vm_max_level;
>>   	u8 vram_flags;
>> -- 
>> 2.43.0
>>
