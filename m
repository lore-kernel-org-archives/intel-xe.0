Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF753E6F060
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 14:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939C10E2E3;
	Fri,  1 Nov 2024 14:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+uvbVjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FF510E2E3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730472208; x=1762008208;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RKDHOIX1zSdiBDfRNoWNgFwcuY9Ysqo8cVaHtPLWeLg=;
 b=B+uvbVjhKNmeadZp+rcqWUEsgKP7eidVtNY49unMTnR5pAsQSuRDgmhx
 R7QpEzHDdwyivGKh4krcUX9T3WesCjN+h1OtcgWGF/+raaXlsdEAguSPg
 5jWcAeYVxTwTdpvuLuRXg47JkXr6a49AGWV9j4GnxiTupPz5vtnQX8QaI
 6+Vz1ByvFkXMkqUuEdfOgoPddMNxFJYkaHtmA6gQrYhzM8hfTWZ94lBKP
 IIMKLI9qwKyoAzL9c0w9EODJ4ePmd3XO9uzdBlkGjTwJ0QDsY+DVy6aK/
 /ezOTOLIkhQWLWmL4kDdP0nnH9lNqRL/gtD4FHMu6jWZEN5yPsl0o1udF A==;
X-CSE-ConnectionGUID: LJhRnZg2T0mqXVdU0yDnaA==
X-CSE-MsgGUID: yK9NBRgGQ4CobJcXvAr/zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30003960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30003960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 07:43:27 -0700
X-CSE-ConnectionGUID: 7OPGeQYmQlCHFcOE76w72A==
X-CSE-MsgGUID: 3YiGdaGzTGCKteB891/gKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="82511258"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 07:43:26 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 07:43:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 07:43:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 07:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMEQyg9x6DIEM07mfLHK9Moj7G++sZQ9NKqUOMDS9cefAlmsy9vPWtXI59+T3n3o+RG2r7UywluOcbPB3D2jGvoPx2l2YRNlEqjlaJKT9g9M79+Ij9HV0S4U3bahWmqSXwyyfxbNSKpsu2kk4vSX4cpWFyfTl+URpyNeP2Hb1oSEBYsFsPPhlCve5p1Zpbvb3fDnjrpE+OnHJzzHWXc5u4+5EtWrPZqQ6UvOEopIxJjqXnSBOEucERCSXfayczsdEUJDk3S2FBZKAWV20R3gHQk2fcF+0fgB8BM4086WUqkFiCbIkoY7O96BUm9sbMXlErOywYGoKciPaTlPc2TaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRbx5YbDFGXnc5A644R1bRu2Qu3kMJDgjLEykZVYg6M=;
 b=BJEV1gjwWMPK1aGRMUWSvbF9uV4CNnoBpFi+h2Eu9dcpVUrCrmD5I7qXWdnilLMVdOTaWdeRg/BtqMfTHiPTX+TAW82WSVUZoypASt3nufjCvgGCXNVlCjsxmVS96sakbMULGJ7k7IZeqREmw+fZGH4DU8cFiVPaxeBg9kAcM6mAIsSJPjzDUbydHfNfnKIsTUd4wDC01t7HaVTQYDC6voa6cAOC95dupIXlew7gCHI2ZyqNcpC1V3tdj/6Ar7yzBWET1OqNJQ3wz+FsL/Dp80qHN6yKWYe0HZ+qW4Ix4blBR7E0pl4QYO1LcXSy600zq9piIom1a5Ytp/g/PW8ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 14:43:17 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 14:43:17 +0000
Message-ID: <f7127402-d36d-44e1-bad0-3953426e3f44@intel.com>
Date: Fri, 1 Nov 2024 10:43:14 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Fix missing init value and add
 register order check
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241023192307.746525-1-zhanjun.dong@intel.com>
 <ae2c5a7e6467859249c3c90cead887003ee70425.camel@intel.com>
Content-Language: en-US
In-Reply-To: <ae2c5a7e6467859249c3c90cead887003ee70425.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 43097851-30aa-487e-4d0e-08dcfa8385eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnc0NHplbk5rR1h3akZ2eWF4ZkZOWTRwNEEyQnJSWHhmc1FQZ1BxTXZtbi9q?=
 =?utf-8?B?STN6Szd3aldLN0luTUJudmE0UVRZWGp6MFdVdDViN1hLQzA2RGJJMUlOeCtR?=
 =?utf-8?B?MDBUWkUrd2dROVh0bnJIS0xwN3YwRHhwVUtxNkpEcjFXbWxvWnJFa21FeWhH?=
 =?utf-8?B?aUZwejhsQ2JJVlA5UXN2RXozSEhZbzh1NzhVY1lmZUFLTGtBRWxyMTk5WEVC?=
 =?utf-8?B?b0praTVWdG1Ma3grTXQ1Rm1DVlI2eUxUMXkvV2hLMlFqbXF5b2tlNHI5QlJ3?=
 =?utf-8?B?MWZlSGRHRDI2MFh6dVVQTkx6MlpNZ085QXpCZmloOVNBZ3AzYlBwQTRCS3FX?=
 =?utf-8?B?Vm5BS1JVYnBPTWlJTDVqQVVKcGZ0YTIxbzlWYm80SGhFakFTcG1iL1VjK2x5?=
 =?utf-8?B?cWJQUW1YRVkrSGU0YlFxOVhCQ0FWUCtzTk45c2tsenJ3bUFUSWhPUkFqRGxC?=
 =?utf-8?B?azJBQU9naGJxelhqNnQzVUJBYVhtb25uY0YyU0NEd0s1cFdJWHpna3F6QVE0?=
 =?utf-8?B?d1FoQ3k5SVZKVWZrTk0wK1EwWTlSd21rS3R6SWEvMk52dkNES1J1dFNsb2w5?=
 =?utf-8?B?enlEVVhrU3JjSHFYK3gyMG1aLzMzVGFzL0pJWmxweVNuVklrc3Q2dlV4Qzlq?=
 =?utf-8?B?blRCTnlWR3VjVGplOGhZYUVmSW9mQ0lKWkZvWkN6Qi95c1FsYmxiRmljWkh2?=
 =?utf-8?B?ZHJ3WVVRMEk0MnBmSE1aVjhHeDFmRFQwN1FTR3JGQ0RBNmpMTDZUbXFmSEdt?=
 =?utf-8?B?UGVweWYwSUlOdjlrQTdKUFduN3Q2TGtQRHdybjU0K0U3RlUxQkFUdjhzeFBC?=
 =?utf-8?B?SnovV1VUTnl1N0s1MEx6TEViWGxKQW1La29PTTdRSEtsZzUvclhFY0R6VlhV?=
 =?utf-8?B?UGlsQVkvdVJrZXJtcDF0Njhtbk1RVWZpdWNvUUpnVE9Gd2pTMVI5dEY3bGxY?=
 =?utf-8?B?R1p5SkhWUzluNXpKRUNySVJkUzFDMWRvVFNGMmNpWWZiZERTU2Q4cXpQV3Ar?=
 =?utf-8?B?UWMzNWl3L0dGckEwZVdPc0hKSVd1YzRhSVRHYUNpR3JDSnd3WUExdnFNTTQ1?=
 =?utf-8?B?UHdjelFPTExSeTRBYXlERkFmbDMrMVpwaFFrYytiR0RaVXh0UExnVzFnUCtZ?=
 =?utf-8?B?NEExK1g5SHo1TFdKYUJTNm5mV3M3ZHJmOFcvd0FBNklPQTc5RFdia2MrMElh?=
 =?utf-8?B?dGdVRExsMkRBandSNEdabjJRODB6bi9HTk5IZ0VrNjdlN0tNS3gxbEdia21r?=
 =?utf-8?B?a0lUVytwbkFZUjgvVytjVzcrenY2aGN4ZGVZaG1MTzlIYVhnOGF6dlBOTS96?=
 =?utf-8?B?RytadG9VTDBaMmpTNCtmSU1JWmRJMkNzTHY2TmNlNEtNWC9idlpyM3VvTWM5?=
 =?utf-8?B?Zi82dUdNdU05MHVUcUkzOTZPNldtNVVoRFdwMXo2OXNNWUlPTEZzTUNtazNj?=
 =?utf-8?B?VTRpRjBuS1plVytwK3NFeWs4S3k2amFIMWxSNXBHeHpFSmVmVjhEajZ4NGJk?=
 =?utf-8?B?VE5laXN3MGVvcGdYUWNMZjF5Ym4zZXpUTjJZVUZ2YWFUaTJ1ak9JckoxSFgx?=
 =?utf-8?B?VHBaaXhkSmFBaUpad0tJcVNLSCt0T0ZhRmZrNVM5ZzVmajdKQ0pyUWRpSFJY?=
 =?utf-8?B?MytCbzg3ZU9SYjFzdzB2aVhNU1dFVHVBL0YyeER0UXkyV1RIb2JSWDVteHNr?=
 =?utf-8?B?T0d0SW8ybkg0NkVZN1V2azdhU213L2dxWGZ5RHNYVE5zeTFrMHBVdmtPSEV4?=
 =?utf-8?Q?iOHyVdh8P2hylVUDCw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NUTW1DQ3NqTTRiZUsrTlB5dlBGSWtjN21YVFU3YTlvalE4Rk5XajYwQldB?=
 =?utf-8?B?ejRsVkJhbVlNYnJ6cXMxb3daRkplVExSU3RSVkQzV0dlYlZ4MlVZWVV5ME5u?=
 =?utf-8?B?NVh4SmtpQkJBMVJsZE0vRVpXRURsdmJ5bVlzNFZ0RkpRVmpsYi9zQkkxMFI0?=
 =?utf-8?B?R2ljb29FRzlQclM1Vjl5a1d5cWc0Rk9BdUV5dHV0Yk03VWgydWt0ditYeTIr?=
 =?utf-8?B?NXlSdlpSdEVZUVVTVGg0cHJEMUw2dFFQaExmU1BjbExhMUJISGRKQVFuVnlJ?=
 =?utf-8?B?VUZsbnh1T3NYeHJ2cFdwZXNSWEZHWkNZV0I3Nlp3VG9ORlVPaTJUODQvdklw?=
 =?utf-8?B?QjBaa09rc21xVVRQU3pHZWd4bjg2aGxrdk84KzRXWncvVHY3QmYyemtPWmZC?=
 =?utf-8?B?b0RJem1iYk5NVVYwL0xJb0dUS3kyazVjOWl6UTI1VFdORG54Q2kzVGx6M2hl?=
 =?utf-8?B?ZlhmcUtHZERhSkpQTjRGNXNzVVRCQjhwdE1ZRmhuTFBjWG9kK2xWSktKK3FX?=
 =?utf-8?B?bXFuNStkVm5LVDJmRDJMNHd3ZjlDZDVnY3RvbUt5c2h4cnM3cjlQTDBySzA5?=
 =?utf-8?B?N0JZOHpOSS9za3dMbUlHQXQ5K2l0eDgxYlBUWEx0OVIvY3hIY21GMXN4VHk1?=
 =?utf-8?B?amNvbkFWbmg1WS83WGEzeFRzQS9idTVsbVdQQmN4ZWIwcWpFNm5BYkY1dmU4?=
 =?utf-8?B?MDdhN0dBNWhhVGU5V00xNWtqbkdrWEdDR21ndnUzOFR4bU4zR1dkSzlCNmIx?=
 =?utf-8?B?NVNqaStBRUxGeGNyVU5RL3laQmlac3hwK242QjJWNEtwYXM2dTlSTlhJeHBO?=
 =?utf-8?B?OExiR09qNDFkSjZTL0dFNzVmWTNJdkpscDdiY2ZjY3BFNDJ2aFQyUkhmUmRS?=
 =?utf-8?B?QXRxQ2Y3MkcwbE5ZMHJCdGtRZFBVQXEzK1l4dEZ6WGlZd2F4dXA1d2hJZTRG?=
 =?utf-8?B?OEtUTzViS3hPSjVpTXUvKzZja2pJL01manhHL0l0YkNMQ1RrSk9MbVBVbDg0?=
 =?utf-8?B?Tlh5K2JwbnkveFN2MzF2bURPN0pnZmtGSkRkbkRJbEdaa0FCQkh1MnpFOUNI?=
 =?utf-8?B?SGp1T1RWTUZHbGdCZjQ5aVptbjEyakFTbmdFeWdHdTJXaVFhWlphcTlEMFAw?=
 =?utf-8?B?QjM3NVVaSEpRQXhrdzZSOXgzKzBENy9EejAxSFc3NER4Q1FKN3NLNnVkbGw4?=
 =?utf-8?B?QnEyQVV5R0tvSWlqd0pkVC9NVmdGaE5EOWs3c0FSV2YzL2JlN2tjM1lWcVk2?=
 =?utf-8?B?RnhJZzRrbytCR0d3RjVGYysyWEI1bENqSWxONHQwZnZnWC9nejZIVXBmMFN5?=
 =?utf-8?B?ZjlMMUpxVjVTdW9nYmhYVVRpSkZtcmViUURDbjhtQzZuWHdiVUxjMEsxbGx5?=
 =?utf-8?B?cGd3OHI3Zit0bnBUdVRybjVwSE1mY3dDQmhvTUhLTkd0Mlh0Ny9IYkM1YThx?=
 =?utf-8?B?VlZEMTBGWkdiTVgxSlhadVNRQmgvKzZ0N0pUTm1ybGV5UXVMeVlmTWd2YUwr?=
 =?utf-8?B?NUhIUDJ0bHJIMC9JVUFBK3JBemNHdklrNFVuRDg5R3dhU1E3d2wvb3owY0xz?=
 =?utf-8?B?Z2pFR01hY3lTaWt4a3VjZ2hVME0yNUdjdlgrVy9IaEpWQkExdWx1U2hwV1Jt?=
 =?utf-8?B?Q1d1VXZXS3RlajNaUkZ2Z1U1WXFxVTU4NTBnNmR2bDJCNktzcDN4RlpwaFBm?=
 =?utf-8?B?ZHhjbVpnamR5YnZRdzZpQTlOdDhJVWNEbHZBRVNjOVlGVTVBMVFhTHJSWXJq?=
 =?utf-8?B?K1ZBUGo2Ui9USjBCYU5PN3NzWkxJRmxvVGQ1b0JOaHgrZ09rK2VERTdhUzBh?=
 =?utf-8?B?eUl0WVprWUhxSjFBdzluTk5iaVVPODdHc0k2Z2FLbzUrSG1hUkxzcnhOOXNV?=
 =?utf-8?B?THRwODNld05McXhJeHBabklHMERCVS9ObzVqNjl4dmt2UmdXYmRhazJZUjRw?=
 =?utf-8?B?UU54eHdzbkJWaTFZVjBJSHJ3TFdycW9VTjArVmZ1WjZESklZVFBNaUMwa0Fw?=
 =?utf-8?B?OEU3OVlaM1BQVjdtbnhnNk9rZytxTkdJYkhFZDBXTGJTVndDWXF4RlgyVU4w?=
 =?utf-8?B?L2JVN1hsTklmalVMZkV3VHBZNkhuM1c2Y1loRWJTNTkrcmRtNkkweFBKd1A2?=
 =?utf-8?Q?QL1dNopaf/ShVTEGoGZ8GAryk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43097851-30aa-487e-4d0e-08dcfa8385eb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 14:43:17.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ2jol8UzgYZzlqoPZjtIm/dfmPSYOUbNTEsOpQPW561hwSqU1bEpVGe5cD/DyuO5g7IXA4iwwWeYgwfb+IzGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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



On 2024-10-31 6:38 p.m., Teres Alexis, Alan Previn wrote:
> Thanks for the clarification this morning - as such, i should have reviewed sooner.
> 
> On Wed, 2024-10-23 at 12:23 -0700, Zhanjun Dong wrote:
>> Fix missing initial value for last_value.
>> For GuC capture register definition, it is required to define 64bit
>> register in a pair of 2 consecutive 32bit register entries, low first,
>> then hi. Add code to check this order.
>>
>> Fixes: 0f1fdf559225 ("drm/xe/guc: Save manual engine capture into capture list")
>>
> alan:Should the fixes tag be applied to this instead? ->
> ecb633646391 ("drm/xe/guc: Plumb GuC-capture into dev coredump")
Yes, thanks for correction.

> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_capture.c | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 8b6cb786a2aa..d7ff7dd60a1d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -102,6 +102,7 @@ struct __guc_capture_parsed_output {
>>    *                   A 64 bit register define requires 2 consecutive entries,
>>    *                   with low dword first and hi dword the second.
>>    *     2. Register name: null for incompleted define
>> + *     3. Incorrect order will trigger XE_WARN.
>>    */
>>   #define COMMON_XELP_BASE_GLOBAL \
>>          { FORCEWAKE_GT,                 REG_32BIT,      0,      0,      "FORCEWAKE_GT"}
>> @@ -1678,10 +1679,10 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>          struct xe_devcoredump *devcoredump = &xe->devcoredump;
>>          struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>>          struct gcap_reg_list_info *reginfo = NULL;
>> -       u32 last_value, i;
>> -       bool is_ext;
>> +       u32 i, last_value = 0;
>> +       bool is_ext, low32_ready = false;
>>   
>> -       if (!list || list->num_regs == 0)
>> +       if (!list || !list->list || list->num_regs == 0)
>>                  return;
>>          XE_WARN_ON(!devcore_snapshot->matched_node);
>>   
>> @@ -1706,11 +1707,27 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>                  value = reg->value;
>>                  if (reg_desc->data_type == REG_64BIT_LOW_DW) {
>>                          last_value = value;
>> +
>> +                       /*
>> +                        * A 64 bit register define requires 2 consecutive
>> +                        * entries in register list, with low dword first
>> +                        * and hi dword the second, like:
>> +                        *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
>> +                        *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
>> +                        *
>> +                        * Incorrect order will trigger XE_WARN.
>> +                        */
>> +                       XE_WARN_ON(low32_ready); /* Possible double low here */
>> +                       low32_ready = true;
>>                          /* Low 32 bit dword saved, continue for high 32 bit */
>>                          continue;
>>                  } else if (reg_desc->data_type == REG_64BIT_HI_DW) {
>>                          u64 value_qw = ((u64)value << 32) | last_value;
> alan: (just a comment) i see that we continue to print the values out irrespective
> of ordering issue, but i think that's perfectly fine since an attempt to mitigate
> could be completely wrong without knowing how the last developer incorrectly
> modified the reglist. So this is fine.
:-)
>>   
>> +                       /* Incorrect 64bit register order. Possible missing low */
>> +                       XE_WARN_ON(!low32_ready);
> alan: perhaps we should catch errors in the opposite direction.
> so perhaps we need something like the following before the first if(LOW_DW) check above?
>                     if (low32_ready && reg_desc->data_type != REG_64BIT_HI_DW) {
>                             /* Incorrect register order: higher-DW not following lower-DW */
>                             XE_WARN_ON(!low32_ready);
>                             low32_ready = false;
>                     }
> 
Good point, there are 2 possible missing hi conditions:
1.
	...
	<REG_64BIT_LOW_DW>
	} // register list end
Which is covered by the XE_WARN_ON below.
2.
	...
	<REG_64BIT_LOW_DW>
	<REG_32BIT>
	...
My original thought is this will trigger the above #1 warning as well. 
Now I think might be add additional XE_WARN_ON, so when it was 
triggered, developer could get more info from line comment.

Will cover this on next rev and put possible error example in comments.

Regards,
Zhanjun Dong

>> +                       low32_ready = false;
>> +
>>                          drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
>>                          continue;
>>                  }
>> @@ -1727,6 +1744,9 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>>                          drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
>>                  }
>>          }
>> +
>> +       /* Incorrect 64bit register order. Possible missing high */
>> +       XE_WARN_ON(low32_ready);
>>   }
>>   
>>   /**
> 

