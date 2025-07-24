Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC6C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 12:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1814D10E00E;
	Thu, 24 Jul 2025 12:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MIZ34xHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198E810E00E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753360811; x=1784896811;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ySY4lQoKcqUcGD/cXjxAWTGtvmEkz3blsA7f3OE0NWE=;
 b=MIZ34xHsw79xfbCO4OwJUPiKiYq13M8qvbu6dn5XKmgwp571X+3VawNH
 9ZiFX1V6DB46Xus+59c3GoXLG1kG9vsK0FGiQKicu7u+l4qSlhBg7R5Da
 E0zLbLmNs2xAGeVWwwTY42vnJgSU0Qre4x6aPOTQudzZnmfWr2mGIKFjv
 mOln08J52lUlYZEgW39Fld9NK18wWs1VWXM0oTY3FBafjHnHnfQvdgpyW
 DxQ0Is2zWD017OdxLW68ViU5g0QLdUNzmQnxvihTY3DHPct5TmQNE4o1E
 WlbkKFMD79VjA8LlY4Q0GCt+/72Sn9kpOWpBoLviA+Usc2Fd4wGz0DSNx g==;
X-CSE-ConnectionGUID: byzeSXohS+yCRSFQuKsu2g==
X-CSE-MsgGUID: gwWWmv18RCWQfqYu4NTclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66237734"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="66237734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 05:40:07 -0700
X-CSE-ConnectionGUID: a/oXnzVnQY6eubaUQevCgA==
X-CSE-MsgGUID: X1ED4q0hSGO6ffXxt5PY1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="164422741"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 05:40:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 05:40:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 05:40:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 05:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WasC/3gEAFxkWQEdUTm2byITn2lsWtdcZkz6+KLQsX/0TAjFpEgKLPYve4qoRRAb/6XMZIt6WJL1NnrNWRmu6HoiFJXHc/KyTvCGnH+uLnX843WyX9SSdb0dQV8U18WJB8lTVCjN9+pdURIYoT9U3cQZ5yUoJLpH4SUwHaYsfKcwtCnTxayHk4VwMJzdm2X1VNPafhbf69gItQH8Jf3Ra5sHsFRSZEVCYcuRza3dVVE5W8GbTGs+8wMPTogX+aYoFKucKuOK1rhRJPXtuE7b4hpmp5dyAovMFFOyOy9AtVYa/HKigmWzvNdOlhK1+hOUIhhu/E3kijHjeyP9tK5/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yIs5Sz6qcBAjUApD2ANAZZHOngvpLNN6FkZYR55m4o=;
 b=f9aqBCpcB70NKYjPb10il3948jhys6LXw573Izd0T0cLvbBnvyR2Fz32tmpMT0gGSNjwFSDXILnMnwr5kY5h1DAXFQkl4KN7IeWdZPAdHda5YRocTKI6FFheEAn3ZTz/DXJ/QC1ZhOaHmb7X3GdofF51IRMk0x3xsciPfX7gdMyb/hkuC06cWF9uKv1MDeU0VUUv2BC58EOMjnCeHVQwIUZ73I4+8D93s4N/uP3BRUjMNL2UliaUqRhA+8fSrT8IuP1vJV7uGM0YrOK/m5lTR/R1T6ydnClLRfNrmjyugfbOiLqc9fNDb87vLUXhyeWCjyOAqjjizeKN62GLN7m3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 12:40:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 12:40:03 +0000
Message-ID: <4a9d3605-beb9-42cb-815e-772cfad99fb2@intel.com>
Date: Thu, 24 Jul 2025 14:40:00 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IE1h?=
 =?UTF-8?Q?ke_GGTT_TLB_invalidation_failure_message_GT_oriented?=
To: <intel-xe@lists.freedesktop.org>
References: <20250723133015.206601-1-michal.wajdeczko@intel.com>
 <175330064645.184315.17035596305382107081@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175330064645.184315.17035596305382107081@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0039.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db88450-ee36-445d-6af5-08ddcaaf3640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkRDOGNUakFwaDAxS2lVUmJLZ21SaGpYYkxXS3N1dWx1Zys1dzRGMFJobWVH?=
 =?utf-8?B?RGUzbVV4L3VYQ0lkbVU2WXpSVjA4dTg0eDdLZ2FuaUF6c2U1dlJMUUpRendJ?=
 =?utf-8?B?NmpReFYrc3JkZzRrd2p3NUdXWUduVFZRb1dIREJZdmFKQ2RvNG81bUdmRXZn?=
 =?utf-8?B?RWU0T0RCcmJmODkwMWJxYXEyQ2VNVFBJTHlEdUc4RjUzVDF5SXh3Nnkvb2hu?=
 =?utf-8?B?NklsN0lwNDVpZDlzSVFEaEdwR1BMZlRDdXVySWNBb2JOWjlnMmMrVzVGMy9w?=
 =?utf-8?B?cVdrWk5qQnlYTkFPZWlIRS9DTHNXcW1FTXZYajUyQS83Um90T28yUm5EVkda?=
 =?utf-8?B?bU5JQ3V4bFR0OS9JSlhIZVNjQ0pZYzhkOFhUT2J6VFJuREx6cXhRSENKK0la?=
 =?utf-8?B?andQRkhLTGZYQTR2dFVwYWVucm42eUtOTmJjSDZVZDB0TCtna3Fpb2pJcjc4?=
 =?utf-8?B?NVdqUk5EWVVVMTc4RE9kYnBaRE01ekYxc1VyZ1hzOVVCZlNSbVJtK2FyNDAw?=
 =?utf-8?B?N2ZaNk9CbXNWVmx3S1gxcUVTa25TL0hsdVhBb2ZUN2JjVFBld2VCaFl4bFQv?=
 =?utf-8?B?eEhxWjltdDdsWXgrTXFVUGVHSFBqMC8rbG56WWMwdDFmR0RVblpKMFV0S2RF?=
 =?utf-8?B?SUVQVFJ3NzNzRnAxa3BqUjBjK0lvdUhqMTF2cmFiQ1owUmw3VXhBdGRndzA3?=
 =?utf-8?B?UFFKU3NLaUZmUmpoM2ZXdEEvMmFuZnYxeC9DN0hoNDJSUytabGo3TFUvYzkv?=
 =?utf-8?B?VXlUZWUwUG5RaFBLQ1JtbkgwM2pTcDJYUGVvQzlVMFE1TnpFeGV3ek1wMUUw?=
 =?utf-8?B?NWNLaHMrTEVkSWxOU0xZenJCcG1PNHpRUEgzTnF3ZkdER0JPaFNPMTV6Ulp2?=
 =?utf-8?B?Y2c5bzQ0S0NZMVhzK1JaY1BQaU9Vc3FWbnRhNlk4L2NDcGh0RDc4cGZPRHR3?=
 =?utf-8?B?RlRtUmk5Vkl1aGR0Z2dEUVdoaUcyVHBuUGNCa3hhQ3k4ODRES1c1YXJkTldC?=
 =?utf-8?B?WEdHYzAwSWM0Ymw4VFd3STJVS2s4QXlHczVjS2IwVlJ2N2Z0Z2JEQlJPSG1u?=
 =?utf-8?B?T3lCVUpXbGxnMm1NMmVuMUc3dnNLM3EwOUM4bFRlbWNMWlVDaVl6SDZpS1Ey?=
 =?utf-8?B?U2RQK3o0SWJoYW41NzdDV21FM2VEdW5KQmdvU0loeU00OWljVDFvMDJCL2E0?=
 =?utf-8?B?UVpuOW9kZ2VCaDJvNTgweGt2T0NNcXo1QVVDS2dodUtUQ0JiaEVxVjJVZDZH?=
 =?utf-8?B?N3RaOExNNHBhS3hHdzl4VzdzODBvclE1ek9EeFpRMlBQeG9iYkFudmdvVi8y?=
 =?utf-8?B?a1JGWnp3VzMveGhXY1ptZjhBaWJFYkdCUFRaeDZLeFkzalJidTBoTFlHR3lC?=
 =?utf-8?B?UW9pVER3SStKZDB2OC90U09NQ2Z1R1BuT3FXbDNmM0d5NXRvdGNqRUVrcUd5?=
 =?utf-8?B?bVlHWmR3eFhONm01aFlVajlmTzNZSGVLQmZMZzRkZ3UxVmJtZVgxZzloblE5?=
 =?utf-8?B?cFVSOGQwSWJmZTJGbldLVzFOallGQk1aTzUvNGtHS0d5ZVhMaEVtNWtMUC9Z?=
 =?utf-8?B?Y2Jxb0FRdEdsazhTNExuSzJzSm5vdjNwdUc5UzhaRURDNkJUckJHSUFDNlhW?=
 =?utf-8?B?NzIzTU1yNk1HZFRrYm5vN1psa2htQkpuY1VvckdzTjlURUI1VXlnSUJqcU42?=
 =?utf-8?B?OVppSk9wMjRyc2dIT3Y0T3pDdmh5bmsxUXY0TDVHaEJxVFNrVUxaM1dJcmQy?=
 =?utf-8?B?VFZxK3NXT0tkelNJTXJXS0xmOHp2cTMvdUpFM1FpSk90cm11QTNrV1Z0ZDh5?=
 =?utf-8?B?K0luV1BBSmhaeEJMbEVTUDR0QXBuZCtYSld1M1hVY1Zlc1dHeFBjZkgzVVZr?=
 =?utf-8?Q?Udp9sDtaM7cKZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZxQ3NTcnErc1ZLMkdQa09qY0I4Tm5RNGRvTGNpQmRNS0ZMYllVNGdQMnZj?=
 =?utf-8?B?eG0rcll0b0hmd2pmdVhsck4yQTRvcjlYMXVlNWt5WXkzMzJoaXVtM3VzeFQz?=
 =?utf-8?B?RFAxelRYUVMxQ3g2bjJqT25kWG43MGJvclpHTXVaUGszTWV6OHpqWk1FSEFy?=
 =?utf-8?B?ZmtsSDd1Tzg5RXp0RCs1MVI4WG9IeERweFJ1a0k5V0ZSOHdmdXY3eFEzMCsz?=
 =?utf-8?B?R2ZxVWR4NUhXQnVkNGJ6M0FUN00yOGhlOGZYK2YzangxUFBMaVc5aDVvQTR1?=
 =?utf-8?B?TEJRbFUvZmszaUV5WDJUc3N1cVZ5Q01FcG5tcm1MZ0I1K0paUERwT2JUalI0?=
 =?utf-8?B?VUQrRE95OUxFeXJza0ZuTEVaWGZ4eTRvN0lTem5LS256SnNpbzFHNFJrdU5L?=
 =?utf-8?B?NXczTGF3ajk0YkJNdlByQ2ZTZGp1UHB2ZTRiaHN4K3hBdnErWkFzdzZQekpl?=
 =?utf-8?B?aGtUdS9tcGxpNGJpMVp0S0psRVlEYkQ4SHUwb3dtVWlLcFF0RTBSdWM2cTlK?=
 =?utf-8?B?aGRsKzN2SUhyNXlXWTcxWTkzSWw0a2RwRlVJTTRYcWxDU3E2QlE2eGFXbURa?=
 =?utf-8?B?RysyRzU2Wk90TVJiS3VKYnZ4bUUwalR3emE1ZWpDVk5JL1p4WnFtVTZVMStu?=
 =?utf-8?B?QnQ0VjFBVUhrdnBhZDg2WG9xZm5KcVZWMk94QTlUWS94Yk1iNDFJcVl5YTN5?=
 =?utf-8?B?N2RuSk9veVhIVlN6NzZoUWU2SWJPbDEwVEdRQ2lCWDBiY0J3cjdvVENCNUlx?=
 =?utf-8?B?RU40WUtsR3cxbjBGTmF0MytsQ3diS3JuZ2k0UE5GNExSbTZUTU1td0lmNnY5?=
 =?utf-8?B?SWwrUFcra3Q0RFVHdVFWaktFSmlkaVV0QXdackMwamJtbmRzM2YrL2FnZklN?=
 =?utf-8?B?b0ZqaGM2MkV2R3R4d1BReUd0aU5QY0lxaGl4NElZM0QwWnpEamM4K3JhYWQ1?=
 =?utf-8?B?NDd5Mm5sTVZuYjFDbVRDQ1l2MlNoUktFTlNaK3NsWHh0UXZoVjltTkFQNnJl?=
 =?utf-8?B?UXNlSXlWSGZVRGhlNmhlZmN2VnNWdEZDaCtyR1BlcVNlOGNBVEtXTDdWTFVw?=
 =?utf-8?B?dmZvL0NvblF3WEhhTkFydFl5RnR3Y2xQMDJ6QUFwTGVvK25JY2w0U1NWY2xL?=
 =?utf-8?B?YWxVa2dvR2c2OVk0T0loakYrU09rQ1Jaa3FDSzZGcnQyckpDZEZ4LzBqRDRT?=
 =?utf-8?B?Q3ZGMmN1bWJDMXRDQm93SE4zaTNBOW1vdzY4Znk2RW9pTlgwVnhGSGtONjNh?=
 =?utf-8?B?Q1FGamlIYVJDbmY5SjNIcHN6MHJ2ZFYzM2ZxMlQvUjdKTFBseDJuRUc4N2Jt?=
 =?utf-8?B?eUsvOXRZZHozNG1kRUp6bVMvRFBTcFN2TEhQQVVPK0N4MTJ6eGpqK2RicjFQ?=
 =?utf-8?B?ZGpqd0t3a1F0eklBMFJjT3dORUhVajR6UHE5dUJ5bEQ0U091cWV3U1VMdnlu?=
 =?utf-8?B?UEFEZlN4MGorb01WRVBucnI5UnB1RzhDZ3VSRmVWSE9SVkpuSkF0M1JZMU52?=
 =?utf-8?B?V2JEQlJublpDTE1EN1dGeVpzK20wbC90QVVuNkRnQStwZmo3Y2pTbWJiQ0No?=
 =?utf-8?B?S1E1L3ZDRXlwU0JzaGVEaWprUjFHSHFFd0ViMmxFVURLSEw2RVFjOUFBQWJD?=
 =?utf-8?B?NXh2T2lpdWdENVA5bE4rOXh6eTBvY0srZXlPZm1GMnk5Z1RJa3paY2lpdEo2?=
 =?utf-8?B?QytNOW14SkUzcVRvV0g4QytPWlVVb2preXRURzFkU2dCeG5CR3o3eHhMOVFu?=
 =?utf-8?B?UUlkMmhjZEFPQ29ZNUlMVWFacnBELzNRcWZSeXBMTEl4ZUVoakt2KzVzdnRX?=
 =?utf-8?B?OFpnenlmNU82RFAvUm4xU2plWEVPUk5jMXhsem1QOThQVlRPR0xvaC9nb0tE?=
 =?utf-8?B?MWlvcS9BV0FSR252Rkx5dlBIMHZ5eVBaVlVuTTQzOWdBd2M1YXVWRm9Cby9D?=
 =?utf-8?B?Y2wwN0NjK3haOEN3NFB1K1FsKzdYVnFyS3F0ZkRkT21iYklCdzFMNGNlcXdI?=
 =?utf-8?B?UlpncVZ6ZjlPY0FZR2l2WmhRdURmR3lJSmE3b1B1ZGVsQjRSaXR1ZS90a3Ux?=
 =?utf-8?B?QUFEM2xRbU5GMU9uV2RSb3dIbHcyc3NWTXVqd3RWQkRuT2pSdGIwdHpkUEJX?=
 =?utf-8?B?eHM5ekdTZ0toYU5YeDlGeGsydGd2VXpRSUd5dEVHVEhpS1FoaVhvR3lmTjNl?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db88450-ee36-445d-6af5-08ddcaaf3640
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:40:03.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwVxaHAHtzaiOjdwqaRKFuqcsfW0GfP/D8TL7jP0UCLqLpzzXxgYqIjSFGAfgKIVm6p4xaab4F1uPUCQKS5eJ9G6VY9PLjaQUurcqu0BQKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
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



On 7/23/2025 9:57 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Make GGTT TLB invalidation failure message GT oriented
> *URL:*	https://patchwork.freedesktop.org/series/152006/ <https://patchwork.freedesktop.org/series/152006/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152006v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152006v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3464-aee6c447a624b071ccee8629d739fd89c6387ea1_FULL -> xe-pw-152006v1_FULL
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-152006v1_FULL need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-152006v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-152006v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3464-aee6c447a624b071ccee8629d739fd89c6387ea1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html> (Intel XE#4917 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> / Intel XE#5466 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152006v1/shard-lnl-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>

this is still #5466 just with new logs introduced by this patch


