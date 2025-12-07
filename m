Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24347D1CDC6
	for <intel-xe@archiver.kernel.org>; Sun,  7 Dec 2025 21:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE62810E372;
	Sun,  7 Dec 2025 21:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKGQedIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ECC10E372
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Dec 2025 21:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765144684; x=1796680684;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SORoej5GKkV4XPl2leLtjKbQuG3hrR7DkXZp9zZu/fM=;
 b=QKGQedIbdxm3X+Eg+Z26GhEozGF0YTlYXhQ1/xtvU7BaRUbVAABJgaua
 GYGxsqOTz0wuPKahgpYt8jwLyOAw8wo2OpHRVWc8trnKpt8807aVc3X/3
 7VUqIBNTSu4LkyxSY/vJLVAjPSIh8qzy6cb6/O0aVUro49Q+vKo0a9YmC
 d8M1uWePXcCzdAtPQ8OrnPJ/kbQZa2M3GAiUUT1lWiyLFlnT3qLFozcIi
 NWEgAvRQU/7Gjfee39VFacg9KrA9tPZWU395EckQMIq/QiCZwGjbHt2p7
 dOr7adY0qPolpxok74EJx3xfTcGWQeil2TP22r5Va/INA53OxYDUYvMwb g==;
X-CSE-ConnectionGUID: m5WfHNJgQaqvsCwyMQIbOQ==
X-CSE-MsgGUID: +tlqEWaIQqGO3++xiJy7vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67140384"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="67140384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:58:04 -0800
X-CSE-ConnectionGUID: p5D4ps3JQr2VQU3IJB82OA==
X-CSE-MsgGUID: rW6U0TLiSGGReFOQGWc0dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="200697425"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:58:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:58:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 13:58:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:58:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofhdYPWIwi9FWvRn9CTJU07QJMFmAs4WgRPUbZlptuUDdVfe6ICO4aHHVEGm5iJuDwK98QFJFjHfkvULq1IA6e+BxdNVJDmPxbLDXFE54OTYz1us9JZNo0WaWBLCAVCNIvRDxo5z73+2tEObaW+aC8kOb2gGeTmgTu1J3X6E3aevxjkzXmPzYf6xoFGFc/UM7v1ek19IjnnbaQgnox3Go2rA+yrNy9iO8bzNik6zPwC9JTHnHnI5vznvy1grrOUuEKgvPocW2iVhNvHKt/wHBuHD/qx7JatLDQEV2buX+wTN3V/KZAK712Of8tIM5Vtc9THnDHQggIOx9IMGb0gArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNjypIabuocGuoY4ElnMGIh1wYn9fQCg8plLzqjUn9A=;
 b=XTpPPPDVEch34JyvKtCeljnFFSITpKnZZPfsRkXE31tJDWZmoq8oneddJWGYnGpbqkRuIrN7ODSIPM7i7/MMbVagcl4h9Mtt5VM+94k7YeOXDnAa7p3WVaooPzLMfCJnot67nYX5irkUpXQy8u/62Ndsogd/Wu8/7NUoCQGBYc1Q2pmhHCnYTrVAU63617FQtn7WDPA31DHEV9QZhBA8eH3LIj5uOFkS1D1grxw1oO4c7jGDZfgQ1MyxAOmOxTLFBg6SctNW7qTuAESNHOVEk7eCEz29j5nP1WtQ6a7WtY/uh1ID/gjGYvzIOXODWo37Y8BGXWoeITlbkKKMMhwmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Sun, 7 Dec
 2025 21:58:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Sun, 7 Dec 2025
 21:58:01 +0000
Message-ID: <5e09411a-0f84-434d-9d3a-8fa813353c26@intel.com>
Date: Sun, 7 Dec 2025 22:57:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-16-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-16-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0277.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::44) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 6444ea2b-0f91-48de-e355-08de35dbb07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzdiQkdNUHpqMUh1NkcvNWJsREJLWnRmaDJMd0h4VldxMm42Y0J4WHR1Z2Zy?=
 =?utf-8?B?eVVRRDVvMkQ2K3VJSUd5TjdqOU1jYUNFT2JuKy83WmxLUTltbFNYRVpNNUdj?=
 =?utf-8?B?ampjSjY0NWdVdXNSbXp4cEZscDhKc1M3ODRwblVvdCtQbEpSSzUzOU9Zb3RM?=
 =?utf-8?B?cUhrNE0vTkFZREp3OEY2emViRytqOWVHRzlyU3BqV3V5WUkyK0N5OFhTL1Zw?=
 =?utf-8?B?SzQrcmw5b3hQT2Q2SW1KZGo0ZXJRRmJkeEhrY0xVSXBxbk41VHpHanFYN1dW?=
 =?utf-8?B?djFPRUNlUVNSZExtTjFSRHNmZXcxMEU1OVZMMnoxZWJOeU5vcjMxM3QyelRB?=
 =?utf-8?B?U1EyUEJXL20vMk5JNHVJRjVaak04Rjd5eG1FOHFQbGRQVW5yODVLQ2UvM1JL?=
 =?utf-8?B?clJoUjhuK1g2bkJXS3Q5SllOalB5WGc4cG9qKzJuV1p5QkUxcWlQT1JDemIv?=
 =?utf-8?B?NFpaVmVCcUhjZ0hoVnFIaE5TVVJOSlltL0ptMThBRXZwU3JXak1JeEVEWUZi?=
 =?utf-8?B?SVpLK2QrNnNVRGtWS3U1NkZpemhtZ3R1N1NnTjlTNWoyR3pDT1F0VnlHblBX?=
 =?utf-8?B?WmFReFo3ajlXN1lhWHF6MThzQmdKK2hEdVBSaUt1TENPY2Q2OE0zeUFKSnJu?=
 =?utf-8?B?SGxqUkNSVnc0ZU10cXcvZHlXWXVRaTVHZjdWajlEQ0dKKzNRQ1lCWUp6WjVD?=
 =?utf-8?B?TXpUb09McFlzVFIydmpoT1FiNkRMMkVMWG1ic2dnTjUwa1I0UkRqU1VzWVFs?=
 =?utf-8?B?TUtXWE1VYjZXYXdML2RNVTRwQmthTytNN1R1YTI5bHNsc292akhYeFdVOVI1?=
 =?utf-8?B?VWpaTGVYUVRjamxrOTJUOUg5VUdYejFDbEZrN3VSWGZ2WU12S1dnSHlnbUlI?=
 =?utf-8?B?d0JlWFlseFd5NW83Z2R6akMwTDlhZmJJVHhMbDJRbzI3eE1ZQjVRU2NjMDZN?=
 =?utf-8?B?TUdWam1hMDhRbkVTRDhjN2k2ZFBqaEJNOVBscWYwMVZjL3kyTzNoaGxlRkpK?=
 =?utf-8?B?RlFyKzVwL0hVMUdYUWtscU1jbXgraitqa1lUeUpmWHhZTXQzcmF4YTFVRnFU?=
 =?utf-8?B?MTF2M3VWaklsV1FOOEhSaFQrR0tLWDVaUHkzL3UzUk56RFJLMGJXb3ZkUEtR?=
 =?utf-8?B?cDVUVkR0dWhTUW1KODJkcGNKWTRsOTd6MWVVQnNCT3RjVG5LRXQrR3NzTldp?=
 =?utf-8?B?NURlMm8wUmFFQ3o5SnJCa3A1eWtPK2pONHdQcTA3bFN4UzRCOE43alRTcnZq?=
 =?utf-8?B?OFp4RDhoc1ZBeThMUkdFYnI5SHNxbkk5VGJOdmorT2dVdnlCTmYrSGVtcjBO?=
 =?utf-8?B?dTNjc0RHRFlnMi9zRXBiVW51d2xEMXdxRzM5T3ZTUXd5NHhjb2ZzUjJ4RWZ5?=
 =?utf-8?B?YnhQT3UxR1V5S0V1NHQybWlwU0tDS1RFcVJlUHpjWEdoWk1NQmczcW5KUThP?=
 =?utf-8?B?dXM5aEJtemhYSUtHK3hHSkM3NVhzRzlGbUdUVzZ2Znk1STErdWowSkVNMGR3?=
 =?utf-8?B?K2pwYkVJOUZSamVNd3hyMURMdkM3aVBoc1VuZjRFNWhjM3UyNDZQZXhLUmw1?=
 =?utf-8?B?bUpjMGU5cFNOSFdtZVZ3bDJvdkczcHluamFkalpZdWg2S3piWkNNQzNnc3dZ?=
 =?utf-8?B?RVRyOFJMTG1HTi9ySFdydENLbWduWWZYWERDcmVKUGpiaUtEVjFxYXNkbDdR?=
 =?utf-8?B?SEEwaVNPcXhzNjl5QWhHaUZLeFNlc0t5R1dQNzQ1Uml3SnlyeFRteENmdjl4?=
 =?utf-8?B?YUI4c0N1NVpvWUxNQ3gzYnJWUVhSdEhlTGZmOFBGZzY3RU9BbjE5dGg5aEV1?=
 =?utf-8?B?YTBpUFJFa0hObjMvNjdOTDZ1N0hDNTRCaHFWb2hMcWs2TllJQjFCL1FJQi9p?=
 =?utf-8?B?Yi9qN2pjNVZZMUNNRUNUT3g3T1c1aG1WN2dNYzNYdmZTQUtPU3VjOTdNZTRT?=
 =?utf-8?Q?noRLRyn/wh83VaAOQyMIeLfFJx5YMwHI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGR1anllcXZvZlpFZlkyNGxIcGo0T3d1by9iaHZ4WU05S3RXaG9QTDRGWWly?=
 =?utf-8?B?cHdrYWlpakwzWHJ6RjI1UEE4VUNYNXlsYXBMbGZmclVXcjBzVVAzY1oxVXpM?=
 =?utf-8?B?TytKQXM1QmdWY25QSlA2V1BjZXhIMUhuNUhXalRPaW51TDZCNVhPSmh4dlRs?=
 =?utf-8?B?OHBKQ2dCVnFKWUNvZURLMTJMN0ZxalVsaHdOMDlIemNLV2I1RFZqdXJqNzZs?=
 =?utf-8?B?c0hYUEpOU0dzMFpZem5Rc3pBUGE4MnVTazl1SXh3RERQTUk0d0Q4cGo3MnZX?=
 =?utf-8?B?WWorcDZ3d3hUZGhHR090cmNjWmZDbjJuU2w5QjZNb3FOcGFFNTE5dlEvR2dn?=
 =?utf-8?B?S2drVlR2WW5meW1zSi9QdzQ2N1dxWUpnVGhhUzdpY0hUaFc1WDdPeXc1TlBJ?=
 =?utf-8?B?MXNsMnBzUlZYWnhSVXV1b250QkQ2ckJYVVlSRURXOFhtTzZRNTh5R2dWRG5p?=
 =?utf-8?B?MTNZWjB3d2dGWnlJQUpldjUxVmRSSEFzUWhDVzhjUy9FWFB6OTRhY2NaNXZN?=
 =?utf-8?B?TXFvcHFwQ3lTSHgzREJtWUdqSFM3aEpxYXB4Y3F2MTRna21kMHZHUHBVK1Az?=
 =?utf-8?B?WEF4WURQcW9LTDB2Qk1VNkxTMFVBRGhlZkRnV2JiWk9qOE90MU1LK3E1c3Rv?=
 =?utf-8?B?SzRST1Q0bDVYd0Q5bWk5Tk5Jc0dQLzExemFaMksySHY2Y0dGRlhXUUQ3ZXc3?=
 =?utf-8?B?VUc3NlhURUw1RU5IbVU0RlJWK3NlVlJBNVRCeHRkSFNYUlVVUWZtMzkrQUph?=
 =?utf-8?B?dEhtZGF6a1ppbUdhL09aM3VRd0dZcVY1a0xxN0lwdmZudDYzTDA4RzdCclFm?=
 =?utf-8?B?VnN0ODZLSzlXbFJ2OG85eWRLUGcxOE1xNzFXWVBnbEcxRkV5aU1XY04veVBQ?=
 =?utf-8?B?MmV5T0VhRkRlcGo2cmwzZ0U1RjB5VXJ3a3RybjYySDNyTGRHV1kyeFFpZ2Zw?=
 =?utf-8?B?SEJMbWVPRWJ4RXMzZjk5SHQweENGei9EdDc4Z3VveHpNZVBmTzFncytNNGc2?=
 =?utf-8?B?MkNGQU1vb2dUQldpTVpoaWlwb0J1eE9qTSs3MHdSaUloRC9hMnFXWkZhYmpG?=
 =?utf-8?B?eit4UmJyYWRGOTEwcVE5WDB6ZnNSUmJ6OUxTZjJRN0R0WFhwSFp1RTZpS3dZ?=
 =?utf-8?B?VVZVeGhaYVhGSkc4NVpYTFVFTUVDS2dSOTc4VjFLRHI2dlYwM3VrdlYzWHFC?=
 =?utf-8?B?SGE1ZkhuaVRWVVlha1NOaktOT293NmE4M1BEcVNrNGpJd2ZKQjNYUC9acU05?=
 =?utf-8?B?THc1a3lrTWhhTXUvdDFUajI0MjhRcWw0RWdSUFhKUjRMV1VZTjlUcEtRVVFN?=
 =?utf-8?B?ekNmWjRrOEdwMGgyRStvZHE4ZGVLQ0FxcTRTaDhvVXViY1U0OHBCTWtlQ2Vh?=
 =?utf-8?B?S0J1THh6SDdZbHZMS05RdnRLM0pBQ1IvNDJjRzFDaFBsVEV0ZXVqVlR4Vm1m?=
 =?utf-8?B?bUpaRmo2UkZldkJGcWRYVlNuWkc4TjNUc0tiR2ZLS0pQbk9GdU1ETzJDQ2tq?=
 =?utf-8?B?N2ZaRVpCekN3RXdDWWxETmREam81UEZuT0dYL2JveTF5RG1EYTNFVko5WjB4?=
 =?utf-8?B?bXRJeVR5djBFZXZyL29RVWwwTG9OVGlVSjJEaVZXMWN2cjVyRTdwTXR3S0VI?=
 =?utf-8?B?YURxY0gxeStSU09kVkx2U3hoNUJCeEpwMFNpZi82N0ZZc2FvdlpoVXFEWjFm?=
 =?utf-8?B?L3pRZUE4WE1USForUTNBaUJEaUJoVktTLzgwemhmakg2aG0wSnBVOG1jU3FU?=
 =?utf-8?B?TUJKUXpwMTJyRXlRek5rRnhmdnoySllzV25vK1NZSkE5S21KMDZ0VllwazNx?=
 =?utf-8?B?SDR5MHNTZTYybHFtYU5ZTW4wY3hRMXVHaDdjNHhYdFBWTUg2cUIyMmNFdTN4?=
 =?utf-8?B?cmYvTWRGWXRVZnF1MUQrR3dTNVloUjlkbTVuMXJScjZUY0I5bmFRVklZdHl5?=
 =?utf-8?B?YWMvckQwNG80Z0ZRUmdlWVBaazgrM0U2bU5aYUtxRFMvVU9hcG9UVFIzNjFi?=
 =?utf-8?B?eEZiREEwWWFCNjliOEJweHlpSi9XMm5ERWZCblphSHFWNGtaZFNxaUlNY25X?=
 =?utf-8?B?aGRlN2VOZDhTY2J3dlp3VllzcDY2UHpROVQxY2JrNG0yVWVzVi9WZ2dBVUdo?=
 =?utf-8?B?MXpLTmZEL2hlZXNXS0J2NEprNk1PNDRuZ3BjMytOaDBWSzRlbkc1NXNFYjF1?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6444ea2b-0f91-48de-e355-08de35dbb07a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 21:58:00.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExcNcYZ7WJaMdpmLBcm+nBriyJhA+pfdlCgbr4P7hvC6fIN7OkS4YYWfNKClUS6y/f+vPrARAtv4sqWIDFxQ1IL2HrDD5e424p4qe86OHSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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



On 12/7/2025 12:03 AM, Daniele Ceraolo Spurio wrote:
> Scheduler groups are enabled by sending a specific policy configuration
> KLV to the GuC. We don't allow changing this policy if there are VF
> active, since the expectation is that the VF will only check if the
> feature is enabled during driver initialization.
> 
> The functions added by this patch will be used by sysfs/debugfs, coming
> in follow up patches.
> 
> v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
>     XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 136 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   3 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   4 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
>  6 files changed, 164 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..45733a87183a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -200,6 +200,20 @@ enum  {
>   *      :0: adverse events are not counted (default)
>   *      :n: sample period in milliseconds
>   *
> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
> + *      This config allows the PF to split the engines across scheduling groups.
> + *      Each group is independently timesliced across VFs, allowing different
> + *      VFs to be active on the HW at the same time. When enabling this feature,
> + *      all engines must be assigned to a group (and only one group), or they
> + *      will be excluded from scheduling after this KLV is sent. To enable
> + *      the groups, the driver must provide a masks array with
> + *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
> + *      which logical instances of that class belong to the group. Therefore,
> + *      the length of this KLV when enabling groups is
> + *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
> + *      must send the KLV without any payload (i.e. len = 0). The maximum
> + *      number of groups is 8.
> + *
>   * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>   *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>   *      up Stale HW register left behind by previous VF)
> @@ -214,6 +228,9 @@ enum  {
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>  
> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8u
> +
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 158d68aff4b7..1109fec99fc3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>  	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>  }
>  
> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
> +{
> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
> +	u32 *klv;
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	klv = xe_guc_buf_cpu_ptr(buf);
> +
> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
> +	if (num_dwords)
> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
> +
> +	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);
> +}
> +
>  static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>  {
>  	int err;
> @@ -476,16 +493,134 @@ static void pf_init_sched_groups(struct xe_gt *gt)
>  
>  		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>  

please keep asserts together

> +		xe_gt_assert(gt, num_masks / GUC_MAX_ENGINE_CLASSES < GUC_MAX_SCHED_GROUPS);
> +
> +		if (num_masks)
> +			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
> +
>  		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
>  		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
>  	}
>  }
>  
> +/**
> + * xe_sriov_gt_pf_policy_has_multi_group_modes() - check whether the GT supports
> + * any scheduler modes that have multiple groups
> + * @gt: the &xe_gt to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT supports modes with multiple groups, false otherwise.
> + */
> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes;
> +}
> +
> +/**
> + * xe_sriov_gt_pf_policy_has_sched_group_mode() - check whether the GT supports
> + * a specific scheduler group mode
> + * @gt: the &xe_gt to check
> + * @mode: the mode to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT supports the specified mode, false otherwise.
> + */
> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
> +{
> +	if (mode == XE_SRIOV_SCHED_GROUPS_NONE)
> +		return true;
> +
> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
> +}
> +
> +static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
> +{
> +	u32 *masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].masks;
> +	u32 num_masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_masks;
> +
> +	xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
> +
> +	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
> +				      masks, num_masks);
> +}
> +
> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
> +		return -EINVAL;
> +
> +	/* already in the desired mode */
> +	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
> +		return 0;
> +
> +	/*
> +	 * We don't allow changing this with VFs active since it is hard for
> +	 * VFs to check.
> +	 */
> +	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
> +		return -EBUSY;
> +
> +	err = __pf_provision_sched_groups(gt, mode);
> +	if (err)
> +		return err;
> +
> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
> +
> +	return 0;
> +}
> +
> +static int pf_reprovision_sched_groups(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	/* We only have something to provision if we have possible groups */
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return 0;
> +
> +	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
> +}
> +
> +static void pf_sanitize_sched_groups(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_NONE;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control the 'sched_groups' policy.
> + * @gt: the &xe_gt where to apply the policy
> + * @value: the sched_group mode to be activated
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
> +						enum xe_sriov_sched_group_modes value)
> +{
> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
> +		return -ENODEV;
> +
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +	return pf_provision_sched_groups(gt, value);
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
>  	pf_sanitize_reset_engine(gt);
>  	pf_sanitize_sample_period(gt);
> +	pf_sanitize_sched_groups(gt);
>  }
>  
>  /**
> @@ -524,6 +659,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	err |= pf_reprovision_sched_if_idle(gt);
>  	err |= pf_reprovision_reset_engine(gt);
>  	err |= pf_reprovision_sample_period(gt);
> +	err |= pf_reprovision_sched_groups(gt);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	xe_pm_runtime_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 52312d24d527..6b3e294bc934 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -17,6 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
> +bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>  
>  void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index 1d4cdc87e069..d9928c200d72 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -23,12 +23,16 @@ enum xe_sriov_sched_group_modes {
>  /**
>   * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
>   * @max_num_of_groups: number of groups supported by the GuC for the platform
> + * @supported_modes: mask of supported modes
> + * @current_mode: active scheduler groups mode
>   * @modes: array of masks and their number for each mode
>   * @modes.masks: array of masks for a given mode
>   * @modes.num_masks: number of masks in the array
>   */
>  struct xe_gt_sriov_scheduler_groups {
>  	u8 max_num_of_groups;
> +	u32 supported_modes;
> +	enum xe_sriov_sched_group_modes current_mode;
>  	struct {
>  		u32 *masks;
>  		u32 num_masks;
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 7d93c2749485..c2e0a2dae586 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -46,6 +46,8 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> +#define GUC_MAX_SCHED_GROUPS GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT

actually my idea was to have here:

	#define GUC_MAX_SCHED_GROUPS	8

and then in the klv abi header:

	#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT GUC_MAX_SCHED_GROUPS

as IMO the KLV definition follows FW capability, not the other way around

> +
>  #define GUC_CONTEXT_NORMAL			0
>  #define GUC_CONTEXT_COMPRESSION_SAVE		1
>  #define GUC_CONTEXT_COMPRESSION_RESTORE	2
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 146a6eda9e06..1b08b443606e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -26,6 +26,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>  		return "sched_if_idle";
>  	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
>  		return "sample_period";
> +	case GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY:
> +		return "engine_group_config";
>  	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
>  		return "reset_engine";
>  	/* VF CFG keys */

