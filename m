Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24245C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 21:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA35010E055;
	Wed,  9 Apr 2025 21:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCf/+N16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB80A10E055
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744232710; x=1775768710;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=4hLlaHgbNiY/7c2PkQu/7Yac3TZYWoL+aa12zwYuExk=;
 b=kCf/+N16ulseBbIv+zmza7eGiTapCPmjGCFrbmS7Y3orPNaOyEOQtRxO
 8wdbOEUPziNKBDhUbsHko7l0pj1bMvV8K5ZhDBAuu6gRcd69HjfYfxot3
 cKgc+Jo+B22HXlGwPyRoiS9y3G0A8NNqOwvTv0zAvswiyP9aAA7ZJXU69
 cilJabfIi89tTAZAEc+qjdhB0d657zCQwrYIrS36iFnoCmfmycho40Ajc
 rUGhJeI55N6/kSLCB+RZPmONhfy2pEj8uyPPwW8IdiIAG54JvkW8Fv0Hs
 EfdfsKTiMzpNmDk7i9FW6WylKEaL7FrKKyj+JmXyQ/VfLsERjSGbVNWli Q==;
X-CSE-ConnectionGUID: GD7b+xCPSKmZg6RZg4OIWg==
X-CSE-MsgGUID: ma5jmqH6RgSDnc97AhdFRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49529448"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208,217";a="49529448"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:05:10 -0700
X-CSE-ConnectionGUID: AY5Qz3p/TzCVdq1tHr6RXg==
X-CSE-MsgGUID: Fd/8PPVxTdyhXslT+Y6LjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
 d="scan'208,217";a="133675951"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:05:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 14:05:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 14:05:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 14:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlQxEXrTxhaak+8thoQGlj4E1rJyaJ+1t8fHGckiqizOjnNnZGI7O1sYKQG0EIocdj0l0Rb2gBtyEke/AW0/2+YTG3d+jnEN1BcbRP+DvOx5747eQb8jjcT2rNEC1IJS2Cq/BXUShH+r9cdUvsgH7MQPj16OoGENjL93OdGS8PecfnGWAM+kWQO0p2jfToqiTQu32R7oCryv1CwNuHDCMTVjMZ9fUgaE8U88anJv93HhWYfPoSZ2R7OBg/6DU4RGh+AQ83OeTCdGflXiceTK61OweqMIE8qFbT3RHHNRYDbL4XPQT1ty3ABEjZpgS9ypd4deV9tWu8J2LbksG2N/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0n8qKZe82Zbsm0tl7MMawp2OBBtqVHfAoFSfoyZx0Q=;
 b=ssOL7g5sscgVcE+4viGIBKYhhghImbdk5PxcudmFLLSz6Ejv4wlryAb+WTuZRrcuGdlOVTGbHwEuVRn8rbXhk8HosnTwals4lqim+7iADCgQm2plT3hq8kBq0m7QlCFTSkjBrJksU1bRNQJtnjOKBwDRZ7zx2lLBwWxiuIUEuQc6GSxmxvnAc+GTsc7FuV0j3/rs8fnZvALGE+ceDhaGYXMMKoFSnRj8czHI5jCi8sF1Pw8t0hdGRbFYs/boQaM7fhBStpFXCv4erze0v7iomy1cDdg/EAu4U9GQynmAebVXtHM81R0AWcdLOh4leRnvSbUTu2pSAnoOH6at5Nlb/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 21:04:51 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 21:04:51 +0000
Content-Type: multipart/alternative;
 boundary="------------CNlXTYLnlGu4Emy4aBfcWuCG"
Message-ID: <2f2e9385-6175-4c1c-aabc-6073c508e65d@intel.com>
Date: Wed, 9 Apr 2025 23:04:43 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 3/4] drm/xe/guc: Introduce enum with offsets for
 context register H2Gs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-4-tomasz.lis@intel.com>
 <b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com>
Content-Language: en-US
In-Reply-To: <b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com>
X-ClientProxiedBy: WA2P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::28) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f3d092-e5f8-42e7-9bcf-08dd77aa2b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFhIYUVnYzRQdVlLRGZ1TnBMU01TZGVnOWhjTXRQMHJHY0wrMngxeHhYZmFZ?=
 =?utf-8?B?bGRaUFpneXZvV0dxdk0rNDJ6c2dnSzhyc2x1UkZQVzhuV1VQVCtuTTlLYm8r?=
 =?utf-8?B?bFFaamtjS1drVjhiQnE4ZFZ4ejlsekpja3gwYlFUb0I4czNsVm1zQ3crU3lk?=
 =?utf-8?B?bVVRZEUzSllEWmY2YUQ3VkFIcnZTQnlqNjhUQXh0NzlzemFSSDJCT21MOTV1?=
 =?utf-8?B?L1BtcTRmUHlTbDB6dncrSDM1ZytZNVc3NDhzYVZyRFNQS3cwNXpkMFR4SGFn?=
 =?utf-8?B?dHBmQjIvQXBRZVpKcnJabTJVWEZOOTB6TElpbVZLaHhsa0FMQ2diR0RYVWVt?=
 =?utf-8?B?enFVLzBQbktjeGdaQ0RIYm5VYnhJS3BISUdWQ05JS014R2Y1OFpwQitucG5P?=
 =?utf-8?B?R2c2MUgzRVB5anNWeE9BMTQ1d1BSRis2bmhBTnB2RkNJZEZqZmh2dG00M01T?=
 =?utf-8?B?c0I4QVhKMUdlTDFCbmRwRE1BRVVZZzk4a2M3K21ObUJoakNzV2kzaXJuVDFz?=
 =?utf-8?B?N2dQSGRoVWpFMUV6d2k1cG96amZwZHdYeVppK25ieHJpb0xpQ29PSjZGRmVv?=
 =?utf-8?B?VzcxdytCZ0c4bDR5ZTM0ZzN4VVgvTFY3VXJUR3J4RTJlMGxJM0lmRnFvQ29y?=
 =?utf-8?B?MnBWcHZuL05FZDNJS3VpenVGZ0pjUWVWRlNhdWZRRFYvTkpsVDNnWG0zcFpj?=
 =?utf-8?B?MWZoeU5Vb1Arb09FU1FZeWEvaDVwa3orK0NMUnhFRHhsY2VJSkN2aUt5OEYx?=
 =?utf-8?B?ZE1qWnUrdmJBdzR5SDlIUFFSVkM4MXZJQ3hSM1cwZ1pQTnBmSXhJTnpvdXM4?=
 =?utf-8?B?NzMrOVhHOFY4YWdxOTd3Y2tJK29IUHFSMzAzclRKZjVNMVBlMUNUK0pDUi92?=
 =?utf-8?B?dDJXZTRlU2loVkNOZU56Y2hCVHFYYTZxaW8yUHYrb0ZNWkxzWVdvK3JJZ2Mx?=
 =?utf-8?B?SUUrVDVPbFY0TCtkUmY5TjhkQzFYZUd1OThITFF3MnB5YmZiM1RaNHVjb1NO?=
 =?utf-8?B?eU9LTEtsb2x2T0huVXRoQk5scEdneWQvUytPREQxdWIvcW0yVVd5dFJyRjlO?=
 =?utf-8?B?QVdpck9rbmpjVDNzM0FJWmdTNm1NcG9hME1vdjU4cEEva0k3Rk5HSjN5Q3dv?=
 =?utf-8?B?L2lqT21kVWxRZlg0RnJnVGhoWjVWWDVpQ2wrSjljaFZlV1cxczRkdzFQOU1T?=
 =?utf-8?B?TUptQzR0TEJteXRBSDd0SDQvUUZpdWJQRlN1RHRGQmxLQlpDU3pHeEk4RnNr?=
 =?utf-8?B?eGRWZ3FhdS9meFRPOGVoNmFqQ1ZyaVE2Z1RxUmprWjRKQTArSEkrcDRsMDJl?=
 =?utf-8?B?MDdvSytxdkIwUjVMYkRhZ3RWRzlVUzAyOHJ4MHpEZmhab0NrbHVIWTd5a1ls?=
 =?utf-8?B?NVdIVlZrMVZDdlFnYkJ6SDVTcEV6TW5CaDlQdGVhdVhWQmE3RHR3ZXVLTjN2?=
 =?utf-8?B?YkdIa1d5ZEZTUnFBMXFCcjlQWFM5YXlkaFZrOE5YVlRXVGZYRUFQVWdDMVV0?=
 =?utf-8?B?WVpjOGdRMEZBR3pSVG5ZdnZyL3JhU0hkZ0M3Wjl6eGVZcGJ6eFh0MWlIMERx?=
 =?utf-8?B?WmprUnpqUFZNUml1bnNoRG9zREVYQVZ1SkdNZFprc1EwQjIvd1dnQytJSEp1?=
 =?utf-8?B?bTJab0tPWTNINTBWVzZRai9oZlhmSFNGSUIyUDhzbm42cHc2a0JVY1hCZTVK?=
 =?utf-8?B?V0lSaW44QWF2UjF0MFR4TGdQUVh3YWJDU1lGMGJWZ20xVDRDN0hCYVRia00v?=
 =?utf-8?B?UlJURWdMbU1ZVmVGZUVvRjZpSkkwdmE1QUEwRENndSsxNTNtak8rL0lwWHJ4?=
 =?utf-8?B?NUFXclptUWgvdW1SK1FrZFFvTHhVVG5mOGc2RElEdjVoVzhPbFdzek9RWjlJ?=
 =?utf-8?B?UXp6T3NNTURER2hXRWhuajU5QXFjWVNnaHFNUW1SVWM4dDdSaDBTbkNZczBm?=
 =?utf-8?Q?rFsfzVam1ZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUxKaTJ6ZFBaSzNXaGErUUxndUJQTm5LQmp5ZjdtcU01VFRYZWZIK3pIaFQ5?=
 =?utf-8?B?cDVQQU1wY05pQTI1L1VUR0hKcDRDaEdGSnJjdGJ3ZFQvVHFoMVFjNFg2UXZa?=
 =?utf-8?B?bVdQMWMwMkZZR1RDR0d4cHNqYVFUK0RGNmFCakl3SG1PblBUbWlubG1CaFIz?=
 =?utf-8?B?TENWNjRveXoxRGg2elVLbVpyTnYwQ21XT2RYMlBMQ09qb21lWXowSjBuMDdu?=
 =?utf-8?B?M0JIaGZIbCtudnZuQk5OVlBsTzNhRjdCR0lZTDFxUHBveU52Y2I3UUUvTjF5?=
 =?utf-8?B?R1lxejh5ZGpFYkVKM3JydkJoY0tyUDBVa3A5ZWVpOFAramdPR1FWSlFtQ3hw?=
 =?utf-8?B?NXMvU1lVKzZnT0N0Rmg3RGlvRmQwL3AzQjhFd1pBMTdRdTZldCtpR1NabHha?=
 =?utf-8?B?aTRoeTNqSnI1T3I3YysrVkk2MGlFbk8reHVuSlpVRERGNlFsSHU4WExyb2dZ?=
 =?utf-8?B?VUptYmZlMXN4d25uMnlnYm0wR0pTNnFBOWVkQWNLOGdiZmhnbTBma3pPWjZ2?=
 =?utf-8?B?TUJ0am85SzdYUGdBNXdGaFkzRjZ0WSs0dWxQTTVYUXg3eFZyc2lCc2kxWktq?=
 =?utf-8?B?YUh5SGREMUhQYnVlWkI5cElveHZEREs4UmpJbmI3WkNlSUhNTkN5ZE9tUU1z?=
 =?utf-8?B?SUJMNXFmU290ZmNZdzdwMTZLQ3A2RnpyNFBaVHdDblVEU25VYkRXeEVrVWJ1?=
 =?utf-8?B?dUlSOFV6R0xkaTBsN3ROTFFWdGtWVDdQRHNrclovWWhYTDlXT2hFd3JQVFRo?=
 =?utf-8?B?Mit4U1BXNzlCOVZIek1XUXJYK01ZaXNpeFFIVFhtSFdTa1ljSGprcFMzOSt3?=
 =?utf-8?B?WnVhTnM0RURoQXB2YW1IVnlQci9RSDFpaUhkdFRyYTdQeXA1Si9nTHdESS9N?=
 =?utf-8?B?RUt6VmhIay80ckZ4Tzd0QWFWeTJzTmVMVnZHdGtIQnV5VitPVmNJYlhUMlpZ?=
 =?utf-8?B?UTFEcW43WXVrV2IzbG1MRmJoUW1acGVKYUllc1BmeUI5RVNha0ppeWxiZk9r?=
 =?utf-8?B?eG1LVkFuNVkxUlNlQS9lZTJidFkyYXJ0Yks1Z1g1M2JxeTNCbDAyaVpzTGt0?=
 =?utf-8?B?QUV1MVRzY2ZFZXF5WGZlWGtYUVBEZW1mYnQwb0p5OEN2aVJyTkpjUTE1N0s5?=
 =?utf-8?B?VHZmeWN4QWF2Vk5SMVBnUm5xbytVYnFNTEUvSWZZdFdQUUh4Q1dGbW9EZXJM?=
 =?utf-8?B?eFZqWUgyT0NQaW45NEc0NEZnMFhFMGRLLzdrNi9Rb0hNVVdsUzdWU3hZM0dx?=
 =?utf-8?B?S0ZJMk84aXBpWEN1U2NlVFJXbnU3aWVqWmtxbnh3K2VIWkcvSlBVYzQ4akN4?=
 =?utf-8?B?NGNuS0JJbGwyK2NLSmFGWGpSSGVvbjFrTkJ3MjF3cFVQeFVJbkJVajVUaEti?=
 =?utf-8?B?UnBzUmluMC9hWlB0dnRFV1Z3bUNEUy9ybkhTZ2J3a1RSWExJaHlqZGxmT0hV?=
 =?utf-8?B?UTZyaXJFS1ZHZlJtK1B6VVVJQW1xZVI4SklMbnV0QlJpTm1XVlovNFREV1J1?=
 =?utf-8?B?UWd6NHI2YlQwaCsrNEdiZmJtRmZ0QzdZdlNqVk15bmJVZDJVWjh0ejFISnhV?=
 =?utf-8?B?UjVOMmx1MjJsNWxlajBpN0pMc0xmaHhuY3JVOG41NUhRNTZsRDJodXRoTnBa?=
 =?utf-8?B?ckQ2MkRHN0QwS252K0VhWTVEQjBQazE1MWVtRDZPQ2drOS9PUUNlTDJEcEg4?=
 =?utf-8?B?QmI5T2hpc00rK240dGdTUnBHSkdrZ05nU0ErTWxDT2lkRnlBa29rbzg0VTVD?=
 =?utf-8?B?NS9OMnNzbVV3QnFsR3NoTWtXWXZMTmNaNkRZYVMyTmdFUkl1Mk13V3BVK2Nk?=
 =?utf-8?B?eVp6THNxN3ErdE1tTEhrVTJjaUJSR3RXWldpZ3IyZjMwck9qaG9SMmlaRVlp?=
 =?utf-8?B?cWM1S0gyV29KTnpyNkdUMFNSNlR1S3dxNm5GZkpidVFDM1lnRGNpTGQxTjMv?=
 =?utf-8?B?aG5WcU9hV0JpRnpvRGFBU2VqR2Q2TUtDNWo3cjRKN21mN1c0ZlVONEwzSldn?=
 =?utf-8?B?UzNzSitROCtxUERRdlBQL1pwVHQvTnJvZ29mYTBWZG5pa3BmYjJ4QkNGMjMy?=
 =?utf-8?B?cU90Mm9Cdi8vYjJpZlBOd1h4b2h6ZkFVWTczWXNWN2ZaTU5ZWWlLVnl3RWlX?=
 =?utf-8?Q?AZI8KxGiDPd+FT9e6MMNkeHSf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f3d092-e5f8-42e7-9bcf-08dd77aa2b45
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:04:51.1998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8IEB7LPPynAdbqindMQNG/mMHU6lZ67n6ASI2GTyTHY4xiDbrQ3hxiHfGNjTxZZX2qwUXW3iFURn3+/M4LyokQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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

--------------CNlXTYLnlGu4Emy4aBfcWuCG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08.04.2025 15:34, Michal Wajdeczko wrote:
> On 03.04.2025 20:40, Tomasz Lis wrote:
>> Some GuC messages are constructed with incrementing dword counter
>> rather than referencing specific DWORDs, as described in GuC interface
>> specification.
>>
>> This change introduces the definitions of DWORD numbers for parameters
>> which will need to be referenced in a CTB parser to be added in a
>> following patch. To ensure correctness of these DWORDs, verification
>> in form of asserts was added to the message construction code.
>>
>> v2: Renamed enum members, added ones for single context registration,
>>    modified asserts to check values rather than indexes.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Suggested-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h | 29 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 22 ++++++++++++++++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 448afb86e05c..64c71526356e 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -161,6 +161,35 @@ enum xe_guc_preempt_options {
>>   	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>   };
>>   
>> +enum xe_guc_register_context_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
>> +};
>> +
>> +enum xe_guc_register_context_multi_lrc_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
>> +};
>> +
>>   enum xe_guc_report_status {
>>   	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>   	XE_GUC_REPORT_STATUS_ACKED = 0x1,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 31bc2022bfc2..63ef06d3a28f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -485,6 +485,18 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>   		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>>   	}
>>   
> nit: if we want to keep these asserts then small comment saying
>
> 	/* explicitly checks some fields that we might fixup later */
>
> will not hurt
will add
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]
>> +		     == info->wq_desc_lo);
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]
>> +		     == info->wq_base_lo);
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]
>> +		     == q->width);
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]
>> +		     == info->hwlrca_lo);
> maybe we can spare one line in each assert by:
>
> xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
> 	action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);
>
> or by introducing:
>
> 	xe_guc_assert(guc, cond)
>
> or by ignoring 100 column limit - it will not be first time in xe ;)

will switch order of operands.

a macro wouldn't be much better, unless it merges the enum name, ie. 
`XE_GUC_REGISTER_CONTEXT_ ## part_name`.

But I really don't like such techniques, as I then _always_ hear someone 
can't find the name and is confused.

-Tomasz

>>   	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
>>   #undef MAX_MLRC_REG_SIZE
>>   
>> @@ -509,6 +521,16 @@ static void __register_exec_queue(struct xe_guc *guc,
>>   		info->hwlrca_hi,
>>   	};
>>   
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]
>> +		     == info->wq_desc_lo);
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]
>> +		     == info->wq_base_lo);
>> +	xe_gt_assert(guc_to_gt(guc),
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]
>> +		     == info->hwlrca_lo);
>> +
>>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   }
>>   
> otherwise, since I don't have better ideas for enum names, LGTM
>
--------------CNlXTYLnlGu4Emy4aBfcWuCG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08.04.2025 15:34, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com">
      <pre wrap="" class="moz-quote-pre">On 03.04.2025 20:40, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Some GuC messages are constructed with incrementing dword counter
rather than referencing specific DWORDs, as described in GuC interface
specification.

This change introduces the definitions of DWORD numbers for parameters
which will need to be referenced in a CTB parser to be added in a
following patch. To ensure correctness of these DWORDs, verification
in form of asserts was added to the message construction code.

v2: Renamed enum members, added ones for single context registration,
  modified asserts to check values rather than indexes.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Suggested-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 22 ++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 448afb86e05c..64c71526356e 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -161,6 +161,35 @@ enum xe_guc_preempt_options {
 	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
 };
 
+enum xe_guc_register_context_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
+	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
+	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
+	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
+	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
+	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
+	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
+	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
+	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
+	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
+	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
+};
+
+enum xe_guc_register_context_multi_lrc_param_offsets {
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
+	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
+};
+
 enum xe_guc_report_status {
 	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
 	XE_GUC_REPORT_STATUS_ACKED = 0x1,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 31bc2022bfc2..63ef06d3a28f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -485,6 +485,18 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">nit: if we want to keep these asserts then small comment saying

	/* explicitly checks some fields that we might fixup later */

will not hurt</pre>
    </blockquote>
    will add<br>
    <blockquote type="cite" cite="mid:b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]
+		     == info-&gt;wq_desc_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]
+		     == info-&gt;wq_base_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]
+		     == q-&gt;width);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]
+		     == info-&gt;hwlrca_lo);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">maybe we can spare one line in each assert by:

xe_gt_assert(guc_to_gt(guc), info-&gt;hwlrca_lo ==
	action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);

or by introducing:

	xe_guc_assert(guc, cond)

or by ignoring 100 column limit - it will not be first time in xe ;)</pre>
    </blockquote>
    <p>will switch order of operands.</p>
    <p>a macro wouldn't be much better, unless it merges the enum name,
      ie. `<span style="white-space: pre-wrap">XE_GUC_REGISTER_CONTEXT_ ## part_name`.</span></p>
    <p><span style="white-space: pre-wrap">But I really don't like such techniques, as I then _always_ hear someone can't find the name and is confused.</span></p>
    <p><span style="white-space: pre-wrap">-Tomasz
</span></p>
    <blockquote type="cite" cite="mid:b999151b-923d-457b-97eb-ef656cd7c1d3@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	xe_gt_assert(guc_to_gt(guc), len &lt;= MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
@@ -509,6 +521,16 @@ static void __register_exec_queue(struct xe_guc *guc,
 		info-&gt;hwlrca_hi,
 	};
 
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]
+		     == info-&gt;wq_desc_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]
+		     == info-&gt;wq_base_lo);
+	xe_gt_assert(guc_to_gt(guc),
+		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]
+		     == info-&gt;hwlrca_lo);
+
 	xe_guc_ct_send(&amp;guc-&gt;ct, action, ARRAY_SIZE(action), 0, 0);
 }
 
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">otherwise, since I don't have better ideas for enum names, LGTM

</pre>
    </blockquote>
  </body>
</html>

--------------CNlXTYLnlGu4Emy4aBfcWuCG--
