Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69120606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGhY7m+G;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=l0Uv+A2v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B47810E087;
	Wed, 25 Nov 2026 19:12:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3764510E087
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 19:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795633928; x=1827169928;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MQtPJf4QjIQbOE1W6NhV4MOe4IzoPE8Q1xx+G02xRi4=;
 b=BGhY7m+GonOKw8Jmcz9lesWoq1fmTX4fLH9WUAcZAyR67Q6rXvLMZX6N
 KikZdRidTlRb33et4WmzxikopiwhZldhBFlP+eE/nOJDOm55s4Kf8eXjz
 Gy+sve3i0L2gI2qOmg3Vh9RnoecEgFE+5o6jc/EVR7iWaPb4OLifd+RSZ
 hOHkHvxIwauP8ZFb8FZ4TwQlR1KK7e+VHGxfi++ePf3OmQ/aOh0+unYAr
 +0l9Vusv3mSl0jjiF0NglK/TPGPgh25nRsarjCPwWWpjI+AKV5n69EfgI
 9+ACWqmT0Ha82BdhimvewQgekvKtWKQesypjDzQmBVSn8Oo7MdBV3VLLh g==;
X-CSE-ConnectionGUID: FKIDpC89RxyzFGn5LHN85A==
X-CSE-MsgGUID: yNJju4NGRnG/RwEXiU/zTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4532407"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4532407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:11:07 -0800
X-CSE-ConnectionGUID: TE8cW1GWS0il+e1xr2SQBA==
X-CSE-MsgGUID: 0zoTn4QNQGGFLIvo9GWMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12368850"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:11:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:11:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 10:11:07 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:11:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3GvcZeNLPZ2GX6Ke+quxppnJ+DRfW/Vyn0KJlG0C+jMqQlUD9dDxd4weIGFECcububgYg5eLqVwjgxJ/5s7g3gbc/Gkpa9ax4ufHjMbvikLtKZuP7YvU2ystZTih9ot6EDwhyZTjLQSKI34HDkIduce5dQhlYBgL3bUyH58mG/zlPoHnf9pyOtnaZJhGnQX5d9PGpQwFPkS1qD92U3HV2VJ/wcOAAzkTDoTEgJxSVsjWUQtnF0bS/pBiEvVUh6wZq3luDXYc8vtaF2zlBZqsr7gWUnBnzm2uVg8rzAKMQgpB+3oHrGsrocScFSsmGVcwd1IMdDBCFBYd5N88cc4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oFcOPtoZ7pzLB0+71/4pvmOW42mmt7gHCpzrHHDV+s=;
 b=IMITQu28ooT7qlxrY7mpHQ2w2aOf/7iG2T4JYSrtUP7y2jK3VM2W838NQ6PZffhMbkKwuKHvkWWfCfr0fPWKnASuuHUhwkNATp9DccnRphpd/hLdYlg3wPasBSRzPAckrX3AemmyHIXBeq48EbFTeKZj3FYJwIJZ9EroXch8tfmnZlEpNRF5qJsn9dK9LoRlVLCHu8SRXi/HT+znlv6MM2GTVVNcOTSLJeYEGBUuTNQLJef5TkZYlSzlS0BKM0BNtqvDX2CQoqJzbjWkt1CFruDn8WtgURDAeE6vh7f8f3PsIFjutEcR+/rMsUP73S3vmOdwl8e96m/nuNBOEdBdWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oFcOPtoZ7pzLB0+71/4pvmOW42mmt7gHCpzrHHDV+s=;
 b=l0Uv+A2vslDlGl+HpV0tdFF/V32KVNf7hBrI/+79jELZsFhEju5se6Ope2PVyUNLbvQvBvVmrAa91oqkf5mlEdPNie8TAX/ZNeX8r9i8bZxN856St69792U9a6aaiLtiEcWFSZxRgSnYM2ldY6EWBv+0UIy+clUJlMKnDZCEzKs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by IA1PR11MB9470.namprd11.prod.outlook.com (2603:10b6:208:5af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 18:11:05 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%6]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 18:11:05 +0000
Message-ID: <528732a6-54ec-4e53-ac4b-b4abb0189f40@intel.com>
Date: Wed, 25 Nov 2026 23:40:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Handle SPI out of flash error
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <rodrigo.vivi@intel.com>
References: <20261123070221.1611306-2-soham.purkait@intel.com>
 <1a0d36ce-a7aa-460d-ac8a-5a792c280193@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1a0d36ce-a7aa-460d-ac8a-5a792c280193@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|IA1PR11MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 82303d53-d751-4983-ae3d-08df4b1f78b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|56012099006|11063799006|261022113327099003|261028144727099003|261022105027099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: WQ+uI6ylL8GvG5pKsHhaegy13doacwY2EdMifKKn8XVM98gm5tsU4FXjndM5B6dfKJFybOIdE0capW79weSmC4aGnzk6jIjLC8T1QFaKLqnOO1LfQNja5e0aoLMTbdKeluoyWtFto6ZoCAXm5vQUzfAvYHOvElqXrltXKjI5EwC5m4nLyHF7LVm+g2GVhB1Ak7XhQqsKSvkIDvvTMHDOiuhyZAx9UIVuhSg9EyRe82BeTJ44bHZQeG/4DWgHbFj5hFBbXjzf37DOfzq7XG6E3b7UxVYx1kqeZ11Xo/BSgwVxPTrbF3j0ChQVlZFqAgvKotLmAhD/qLB1F1vxOtVAWF3kElD317iapnoW3d7oBEz+L1HZOUFkgHgsw6GX3GZf9nbIME6Ek+zNsYvIPTbxyEoNRxR/av6g/4+QD1oHxJYRj7GbK9lHrGpPI3mpJke2cJ8LGtAUP5gPHUIzz711mQb1Gn2XYcIaqy3jHKpjIvpPDzjmLSayZFsY8acKH8m7k25qNHK06SUVlpz79mcLy7RGF2FXe4qbz9Kuu0etJZuVpuRk2CNQs5J2iVErp+Iz5bATdHroAqR1yxWHmzt47PXR6LMzq3d1A5quTcJJpx9xlKHZ9UGLjXNeNSAGJBXbN0XdnXvgyuheM9GBkAxczMUnPO3BE6MHxdWE3vWhp5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261022113327099003)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U25XWi9wSlNZU1JGWC9PdmJQc1ZYNkdvRkdERWh1Zlp0eVlXc0VBRjZ4aXlY?=
 =?utf-8?B?eWJUM3VtaXJhZU8wbDNrSHNIUDVhWWxJeVJvM1NPSjZya0lOYmFiYjVxTDk3?=
 =?utf-8?B?cVE4dFhEdkoxODhvVlVrOThqR042b1hNNWsvRlJQNVFJUTNraUVvak5CVlV2?=
 =?utf-8?B?aVNNNHZLbElqYlFqVzBRZExGYWNNSE1OL1F3MzZzMDVwYUNOd2RqSDNOVTFh?=
 =?utf-8?B?dElGSWJrZkhhRFk2YUN2SWFLUUxHMis3TC9tVHV1MWp0d3Y5dyszSGZrZ3dU?=
 =?utf-8?B?bFNEVG5mcDNDb2FBWFR5QXFOL0dPbVpuQ0tZQzNJWmIzTnRXSXJnNUJIUmRE?=
 =?utf-8?B?aWNKRjZQY3Z4bHNub3oyQjIrU1pQU2Q2Ym5kaWtJM29ubkVwcWo1aWpJRmdn?=
 =?utf-8?B?cE1JVENkS05BelNDUFFVZkk4a1dMdmJoK1h3NFhGSzNCeW9wYjRVNk1qd1Qr?=
 =?utf-8?B?R3hVc0dEYVNES092ZFQ1cENrc2FUMXErVEF1c2djQktVZXVoSmtZdW1DV0wz?=
 =?utf-8?B?R3ZtQ3lZakNTR2Mxb2JNUUFPME5Xb0hKS0hnYmZna2tSVVJDbGJLYmhITmli?=
 =?utf-8?B?dm9nTVR3UUMvWk1LaGtqNHpGZk85ZzFKRmtFTExBcHAzcjJYclZjVXFzd3l3?=
 =?utf-8?B?T09NRXdPL0R0Y3lRZHVkcTFuTkx3OHZrWnVlWCtWTGd1aG0wU09JalduT1R0?=
 =?utf-8?B?MUk0Q1JDTG81NHBOcU4vS1hsNFU2cEZyenloTndiUXA2cFhMZm5iYi90UnRP?=
 =?utf-8?B?WXNna3kwL3hqY2c0L0REY3ArbUtVRlZhWmFFSU1EcW9QcEFnVUFnTGdTUzZW?=
 =?utf-8?B?TW9BRWs5QXl2aVYwVXJKQTc3SXphY2VSdHdqNTAwc21LN1JTVU9hcEFNTXUw?=
 =?utf-8?B?OSt4Z0pkUjFnRFdzUjZIbVErb1g3VWZtTUI3bndEZDQzaC9mWVRZeHdrMEN4?=
 =?utf-8?B?Qm1xekJ1VUtzWFZrN2N6Z1RENFYrU255cjNiTWtxd3NrSTQ5SHVEcFlIRzFN?=
 =?utf-8?B?NGVKNGVKODZoNDZxSWRqYzZpK1VXTk9zSGoyd2JEaU9GWmRwK2VEZkVYNHgw?=
 =?utf-8?B?OXc4TGJ6U3RuT0pZQ2hpNkFFQjMvVW5DYmFjNEwvck5hR0pzYjgwaHA3dk9B?=
 =?utf-8?B?Wi9wOU5oWnZwK0Q4eHU5NEg3cytLbjVmaHd0NGVPMTkxUHZtejlxRHVtL0lE?=
 =?utf-8?B?NEZQVzFHWWpIOHRTT0o5emF3bERHWHcvcFVTN3ZJZE5id3YzZER2V1IvY0tY?=
 =?utf-8?B?YXV2Mm1YRDY2QldHdEx3cklqZXR3QVNwQjVPWEZma2haN29EcWNqVHFQTEUy?=
 =?utf-8?B?Nkt0Rmw5MklzSDVXSDhPc0p3SWhtNS91azMwKzBZSGNLQmZZOXQ1UE56a3lD?=
 =?utf-8?B?aUx4OGFvRVZ0RFR2NkhhbTMwc0xPNmRjcVFRVVpwaXZMY2JIelUyNFl3MUFV?=
 =?utf-8?B?M2xCUU95aXl0ZFJvWVBhOENCa2NZb3hrWnVjci9mN1c5RVF1Sm95YVBCVzFY?=
 =?utf-8?B?YmJSNExSTlhFSXFscGl3UWJxeEtxK3FNRHgxZDlRMkFSeVNJQVBnZFo4ZTJw?=
 =?utf-8?B?RllQTVl3U21yMUF6aTM3ZjBpN2hVTHQ1RWZBdGVNWUJEdG0vSFlzM2VGTERo?=
 =?utf-8?B?MXZ4OFIwL2pGdDcyNmtscFd2QWJCb1NBU1U0Y01XejFjRml3bGw2emQrYXZL?=
 =?utf-8?B?aHBrVkRiSnF4ZmZGY1h4NEt1U0ErWmZiLysrVXVTTWt1UmpseXc0dWdYSDR1?=
 =?utf-8?B?VktnbUJVZjdOOHJyUW5NUFhxcVpkV3BKc0ZJVkxXKytxYnF2Z0dMUVhQdGt5?=
 =?utf-8?B?QWU1VDg5eFFiTnF6Y1FUOThSQWttMUJTUUpGRmovUU5EZGFBMnJRNEdUUE0y?=
 =?utf-8?B?N0NWMlZhdUR3RUZwVVkwcHlGS2lrdWFTZTdrOGZWQVFPTWcvM0phYzk0eXBL?=
 =?utf-8?B?SUJpcGR0OTJYNjFveG1KU1JneXBHYnRYT21zMElzWElQaGJ3aXhNakdrWjlC?=
 =?utf-8?B?L0UxQUh5ZnJsWHIzb3FpNkIySmt0MjAvb1UrSHhEYlV2SlUxTXVrWWZiVUM2?=
 =?utf-8?B?QTNkTU1KZVFnN2F2VlpDSWxBbTJBR3dySE9rSDRIZFFBckQ2ZEV4UmQraTZ6?=
 =?utf-8?B?dnllN3h1YzkrckJqWXJIK0RVeXVIYzNBNUU1S0NUem4xaFRWYTJVVzR0OEZj?=
 =?utf-8?B?L1ZNWFE5UWRWU1FScnMrWklxSEdpS3hTTXVtUjNyWkVlZCtUSGNYSGxzVnNY?=
 =?utf-8?B?S1p3N3czdE91L2dmNkwwa0VJYjVETEhJYm5vWjFWeGRZeWZ5akxjekFCdXdY?=
 =?utf-8?B?T25YMjlEYkVueU1Cdndmc0xwMUtVbXVSR1pEaE1uK21MSWJQNmxPRTN0YmNk?=
 =?utf-8?Q?DhhWUM2tF538DaDU=3D?=
X-Exchange-RoutingPolicyChecked: PEfYgDuzUfzjjGwzouojGC9wT9CMjQisONNWP4CJrjYfXidJE1mmLwiYwEMqmZh/fIH7XBhhXfEDO+XWs3Wey8Zar3hw6snZyV5CEQNn3nSKCW8mhdcimDxeIZ3NRfjsPrtcHrBewuQNM+lTacd5TScwXx0ji6PR2yyhnvcWZ/xHDaNGIf/sPPca4hsQNiWJlzNDxOXLtKxC1Jzxv5iCKNWqBkKBZhq94amMC5cJUDwHAqtpt+k8kWWQz1rDLYLw9iTNqnUxtluv13N7rOud6uH7ekGz/XCRo9KeU1i8S6NRR3wuonMZ0cBoWcFTkgw72cDjWdkKpxWTl172KhvxzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82303d53-d751-4983-ae3d-08df4b1f78b8
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:11:05.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlr3VzTTzCfjTNQeNo9y8mVhDRiXiOY2FoJElqcMqrH8pMWN5ChnheQOpz7SBEFD+WVeOm9zQ6RajS3GICjIig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9470
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Badal,

On 25-11-2026 10:49, Nilawar, Badal wrote:
>
> On 23-11-2026 12:32, Soham Purkait wrote:
>> Wedge the device with an unknown recovery method if Page-Offline returns
>> OUT_OF_RESOURCES, or if the offline list is full at probe.
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 0fb891d00b36..76441858391d 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -80,6 +80,7 @@ enum xe_ras_response_status {
>>       XE_RAS_STATUS_TIMEOUT,
>>       XE_RAS_STATUS_HARDWARE_FAILURE,
>>       XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +    XE_RAS_STATUS_OUT_OF_RESOURCES = 0x9,
>>       XE_RAS_STATUS_MAX
>>   };
>>   @@ -226,6 +227,7 @@ static int ras_status_to_errno(u32 status)
>>       case XE_RAS_STATUS_HARDWARE_FAILURE:
>>           return -EIO;
>>       case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
>> +    case XE_RAS_STATUS_OUT_OF_RESOURCES:
>>           return -ENOSPC;
>>       default:
>>           return -EPROTO;
>> @@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct 
>> xe_device *xe, u64 page_address,
>>       if (ret) {
>>           xe_log_err(xe, SYSCTRL, ret, "page offline command failed 
>> with status %u\n",
>>                  response.status);
>> +        if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
>> +            xe_log_err(xe, SYSCTRL, ret,
>> +                   "No space left in SPI flash for bad pages, manual 
>> intervention required\n");
> Why sig id SYSCTRL? Sysctrl has completed the mailbox command.
>> +            xe_wedge_declare(xe, 0);
>> +        }
>>           return ret;
>>       }
>>   @@ -504,8 +511,17 @@ static void get_offline_list(struct xe_device 
>> *xe)
>>       struct xe_ras_offline_list_response response = {0};
>>       struct xe_ras_offline_list_request request = {0};
>>   +    struct xe_ras_state *state = &xe->ras.state;
>> +
>>       process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, 
>> &request, sizeof(request),
>>                     &response, sizeof(response), &response.common, 
>> false);
>> +
>> +    if (state->max_pages && response.common.total_pages >= 
>> state->max_pages) {
>> +        xe_log_err(xe, SYSCTRL, -ENOSPC,
>> +               "Offline list full (%u/%u), manual intervention 
>> required\n",
>> +               response.common.total_pages, state->max_pages);
> Same as above?
>> +        xe_wedge_declare(xe, 0);
>
> This is in probe path, shouldn't we propagate error and fail probe 
> rather than wedge? 

This will be used in multiple paths in future patches.

Thanks,
Soham
>
> Thanks,
> Badal
>
>> +    }
>>   }
>>     static void ras_usp_aer_init(struct xe_device *xe)
