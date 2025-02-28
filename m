Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1686DC282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 22:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFD410ED5B;
	Fri, 28 Feb 2025 22:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqaDwEUg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C310ED5B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740781717; x=1772317717;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6l3HXav8MkWlmvsOiMz4wj3aYfDU3rVCIqX2VoR22Sw=;
 b=fqaDwEUgruZDEKZUNw8j8MxDEpv3SSZRFbgHLBu9hQI5FrM3LCFhUxDM
 o5ppNbbRlU2odB/hVlA7PayxhU+c6VDxrW7F54t1lg9V7ch7GQkxn/Vq+
 F2nnDpuvPjaXOY0dnxHMH8aULsfWFPeapxUXCVxRFg7/+ohhvsI8SP17b
 3KpqhpWiO+gmBE5rRG78uzhSaHQs8IXimYMzsLQDB3EbRPBkbGTljRIOS
 f9yjMqq9aRny6c0WqCyoH7926mJ2VdWfmXJ6s44g0DIlkZq6cNyDT/Fte
 tbvoEHNdXmaBD5YnsJjBOJ1LFYJ63BIS2TMIgudFwgduOEQw3TlbDj85Q w==;
X-CSE-ConnectionGUID: hFc3f1vrQTyuw4Q89la8fA==
X-CSE-MsgGUID: 1/AAtQecS3aamrVPq4jI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41747762"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41747762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 14:28:36 -0800
X-CSE-ConnectionGUID: zuF70sAVSd+uphNJ0SuQXw==
X-CSE-MsgGUID: EecbStWRT2CDMOakWZoeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122696527"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 14:28:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 14:28:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 14:28:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 14:28:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnJRCeDnVzXZSTJGk27fEt6kuw+LzJJbc2BimIscGbnRSe2T0Ltynldvy/nt2FMcvzm0r1nVxWB7kjHpK1QIllTFKOJq47eB6EF7h9ZffPLdC8GSpXkxXzDJQL+1m7a2f4Bppr/7Fq6K9bsLoM8ch+AAI35bcs7g01VOnf4OFYUiw06MoeOuEGNfMchXj4MOSSU6qr29IbmXmZW/PT3kGjww4Vzf+uFRCGq+mqB7PGndPQeOZC/Ozd5QcHzLT9qeiLyqTXiXYJvaGppUR7ZsxCXdSd9s2p6TX2rXfiajdVU/MxcpZhdcVOEnTpHMQrEPwjV4zE2+WkWZwUZv+NyWng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9uwq/6R7reZjzQjk+su48l5M5gKDs/Ph3CBAR5cLeM=;
 b=aqrlDZYF7AuQv+AjJMFIZUoqN1+RqFdHt1rglCA4PswcK2xHHG3mgHZjH5xXcMZXhiWJFZtWqIM/DXjUl1siFrDaAUmTWRYWSaS4ziA9bRe9rqbCMpzrJ1xIA3Dc9HKMrJj5O+1RnYVZZY43Ur1qOALK81zxfkQh35cvxM1vJ8Xi6SxvC695kNMDhIn4jpBDQeebs1vXJ8CUd/PnVbX19u0vZRuobV31MI668Pt+r9iYMazZtCBFNnzOGDbw/5VX65bwal1YvHwd5NOKBZf8Nv9aIkvKt0Grj0MMLcGKIClL5IHR4zKk9GLWfe+W/qEoDRina4P7TfqxY7hXdCL25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 22:28:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 22:28:19 +0000
Message-ID: <3191c065-1977-4a03-9693-d7622cea81f9@intel.com>
Date: Fri, 28 Feb 2025 14:28:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/vf: Store the VF GuC version in the
 compatibility struct
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
 <d5ca7fe9-aa20-402b-85b5-4f4832c0a0af@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d5ca7fe9-aa20-402b-85b5-4f4832c0a0af@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c1a10b-7c4b-4b74-552d-08dd584733a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWhUOEVNZ2lieGdqZjZHeGpJenBFaUFpS09qajJyNEY3ZGhxenBNYy81NU9T?=
 =?utf-8?B?amhRWVBjSlp5MVdpVUZ0YVdxZEhYVWcvKytNSHYvcE1wRVRsMFVHZXNBVXor?=
 =?utf-8?B?WU1aOXphTXFVYm03S0ZJcGhYdzJPVnFUL1ZUQXk1Y3dQMk4zeWNCUHY1dWdY?=
 =?utf-8?B?M3hpRW5VM1UwMFVNQ1lqaXlHREduM0dYYlNYQmdiZWVZZXlGWXpHN1BEQm82?=
 =?utf-8?B?SHFmM2FKU2dFM3hPekxxamIxbzQ3WktwYkpHZ055dFFsMkgxeVJDS242QjQy?=
 =?utf-8?B?VkYrZGNvSUphV0NYNTFNMUJ1WEhQV1dHalJkb2VPT1ZRSkpIRjBtWnlUNzFj?=
 =?utf-8?B?SEVPQkQzNFdZU1pRZFlicUI2dTJRZFpsMzRLdVhTa0Z4OUVHSVNpY2hLdlQx?=
 =?utf-8?B?T0Z4eDYvVW1SOVhibVlySTdJUEx3bjRIRjl4a3JUQjRHelhXbEp6RVhSc21u?=
 =?utf-8?B?Q3BPZkZISlRmOFRBZTQ1QU1ndGM1Qm1vWjA1TWtUODZHL1VXUCtvOE1qanFZ?=
 =?utf-8?B?TXZEcVlUN1NzQTVydXhkMjhtTVFSSFQrMXM1UHlrNVdDMGhWdnc2ZEFBOGRR?=
 =?utf-8?B?OHVLQkR5NW5XYXNLeC9PUjNDS09GRU0xeTRWUFR0Zlo5Z2k4cTNJOU5HejQ2?=
 =?utf-8?B?Q2pGNUVGNXkrMHRWeS9lNUJxVjFOS2hwVTVidU84WmllTzhmZUlYNjVLUTV4?=
 =?utf-8?B?Zkk3dHVCSm5rcVd4aHNiRm84dGErMlZ3Sy9WM0tqQ09ENFh4WlhhTXUxMGNx?=
 =?utf-8?B?RW9uR0sreFFNcit1MjVoeWFBeC9NWGp4alpKY1M4cXh0VENZWnpJb2VIVldX?=
 =?utf-8?B?dlpEUzhtV2NZeEV3Y2Rac1NaTFR5TEc5Ull3blIvRklTV2JpU0hoVjZYdEgr?=
 =?utf-8?B?VmZVWmQxbXUxaTlXM2drbjFKN1VlT1lQNzFVOW5GUHIybXEyUFQ1Y0pkUzZF?=
 =?utf-8?B?eDE3eGs0MTJiT2dYMVlCUzMwejJCZTMwTjdQTjYxQmh1S1BXcERsaEN5ZkUv?=
 =?utf-8?B?dlF1YnRNUVRJUS9icS8zd1cvQTFuZkQ3MkI2YTIrTnV5dWZjeFlYZ3BSdk1N?=
 =?utf-8?B?eGZHYVU2eEZ5eEhncXJBdnFaMW5GQ0wySGM5d0lpNlFjM29kRTBMdFQwdXhl?=
 =?utf-8?B?ZU1qTjQydHlGdnV3bE9CaGRidGJNMmJJZ0JsMFo2R3BSS2lhaGJsTDBoaG5E?=
 =?utf-8?B?YWwwRmxMVEl5d1pCbGR0dG50VFhQeFlrQzN1WktLVGZtSnV3NWVURUdqU2VR?=
 =?utf-8?B?WTVmU2ZDdTl3d3pNOVhOUDlQTlpWK2tuWDRFVVRWMmpURExuQTRmY1Y2MVZC?=
 =?utf-8?B?SDFmS2dVOXM5REY1K3FGZVN1VkRXbGhoTzFXaFdraldnTDhxZEpQQmJEdTF5?=
 =?utf-8?B?QXVwUi8wUkJpQTEyZXl0clhRV1VXWUxaRHpKeVdvd1dtdjlZb3lndDVNVmNX?=
 =?utf-8?B?VVV2YjJPWmZyS3M5YmhkQjcvam9hVlRESUNTbzA5UUhSQnZ4ZnlaSTZ2Yzhq?=
 =?utf-8?B?bE1GWnB3cmVJcGhLYm1WRWRYYkE4eFZHNEV2WCtiNmlYTFI1R0IzM3BXbm4r?=
 =?utf-8?B?aFkxSjJZM2x2MU9xaFFYcisyeTVKZW9qcDk1clA4aWM2a3ByZ0lQeGoxRHhM?=
 =?utf-8?B?VUo2aDZORk5oSDU3Y2ZzSlp6cnE5UUdKRDJLMUMxS0Z4Q0hLRW5pMFY2b3c1?=
 =?utf-8?B?MU05bDMxSVM3RVVHbTNRa3BOaDM3eWlvQk1ubXI0SlliZ0Jvc3lZNXpDT1Z1?=
 =?utf-8?B?RFgvRHZDU3hlZWZwUFB1RXg5RVU1Nm9Bc2FkZWJpWDl3Z2dDaDdPaXkremha?=
 =?utf-8?B?d0dKTkNTUmpyWFNsVldsdjd3VzNjZTFESDl2c0labEtpRGVBRlhyRzF5VG1r?=
 =?utf-8?Q?CL+Ukha/RfKWk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFrc0dRWHgvaGNOcmh6cW4zOXdodUZnZ0xuMnlLS1hJSGdsWktTVmxycDRy?=
 =?utf-8?B?eU5hOVBaUGJ2bkM3N1Fha3AzWTBtS2VQZmhXbzJsSnpkVFJoeVZWYVhXb0gv?=
 =?utf-8?B?dGdlQ3luUzVtOS9ZbVd2QnVpd3Frb0V1M2sxSWRwS052aE1uSmU0SU45ZjFO?=
 =?utf-8?B?WW5RKzJ4Y0lFMzM2d3BwSHJyOFozZ3krUXVKaUpkbmtDMUE4VWF3ZmZYU2Yy?=
 =?utf-8?B?ek5HUWNPZUw5T0J6T3owdXFhZ2h1ZjJvd29BRE9ibjVkRnFCck1wdjc1S29C?=
 =?utf-8?B?cG9SYWcybVdKVngxa3Z2SXNGWWNtSUJvMitPUC9XZGhGQld3NVRtV2xhU2lu?=
 =?utf-8?B?KzdxVXFDRi9mMU53Z0dNTTR2bjNCdk8zVm1IbEFHVUVQdlROSTcvcXkvRmJW?=
 =?utf-8?B?OHZJRHJOMWR4V3lyQ2ZrWVlXaWUzRXlTekxITytxQ2lNajZhTkdYMlRyVEp6?=
 =?utf-8?B?Z1pjRHJGNWhRWEtUelpTMEU5RHYyREExUU11WkZvUk9uMGZ4OVNLRENEdzlX?=
 =?utf-8?B?UGo1NVp2b0Q2bnFyNm0ybkNkck1MSUNVSzhRWHMydlRYQ3NXQmFoS1VtTk42?=
 =?utf-8?B?STFaR3h5UGMvb0d5N0Q4RkRTZTcxV1FjYU9qTExVSGZwZE9lN3h6RmlHQytW?=
 =?utf-8?B?SWFsQlc2cVBSQTFhK2JhY1oxek0rem93UWlrZFJNS1hCT1BlTnlId2ZLbWZX?=
 =?utf-8?B?MWVPREpKb1MweFo2MzVnRzRiRjBOakpkbWNlTWwyZ0JQcmp0RjhHam84ZHpW?=
 =?utf-8?B?NnpKZEtDMnRQa0xUVzUzbEtwTVJ2OTFHek1qTURjQktzays5YlBWMGFrMU9k?=
 =?utf-8?B?K0hLa0pCczNBMnE1RjBWRU9STlNLb3JGQkpKMGM1cThkQnpmdXZWV3hpSWxR?=
 =?utf-8?B?NzFHWVAvUTBiOGI3aytOODVaWEtzQlh3Ylp6RzFqSW9ZT1NBRVp4SHI0YXoy?=
 =?utf-8?B?SlloanRhK1Q1Q2lWOUVQRFAzR0I3L2RBaWU3SDZUTWUxUHkrSmFJTll5eGpx?=
 =?utf-8?B?bVl4bUZvR1M5aHpTM1c4bzloN1UyMWg3MEQ4U3I1emwvNFlZM3dQclpESG8y?=
 =?utf-8?B?WU80QXJMRUdVWnd4YTRLZ3FIUGI3aHE1a0dXdmV4ZWx0bGN0ZlNRdTNQMkt4?=
 =?utf-8?B?NG40eTdzU3lPclo3S0pxU0VDRm1xdUtjTWprN0tVVjBMclFiaWt5Z0dvY3g0?=
 =?utf-8?B?NDFGUllqbmFUcmRsT3BFUGxCK3hWK2tTeGJHL0t1MExpV09EVStXbWJXVUJX?=
 =?utf-8?B?UGltQ09SUEkvbHBkOTE1VHJwbnRvV1ZFZmcwU3ZLVkdaNXgxd1ExTTZKcHkx?=
 =?utf-8?B?R21pRUdkUHBlc3loOE12RW44T2Frc1hZQWxoaXM2Y1F6L0RqVnZTUUVGVDQ5?=
 =?utf-8?B?U3J6bUdRRVhiSGNISGluaXZWM2JhT1BzT21OUGFhQVdLNGlsK0VleUJQaU1l?=
 =?utf-8?B?UGZRbTVleEZBaEtiSlpvOVBhSVllaGFKREpranBkbjRsbWVxSFVrcU9Qek55?=
 =?utf-8?B?dEVhbWRFQVFaSCtJNDduZk16SS9MQ1M5dkJ2cnl2OVQzL0ZqOGFBbWF1WmMx?=
 =?utf-8?B?T0I2b0UyMk5qaUpQQWY2TUlpdUFmbmpQM2I2MUFMK0hwWjFjbWsvRkdLMEN6?=
 =?utf-8?B?ZXVrUGpoRzZIQWM0L3pTZkRXVStNSUpYV2tJdmdBMS9ZS3JWYU9YQzFQTnBu?=
 =?utf-8?B?VGlER09vandGaXBMRytMQmdNaGJabFYvaWNrNmtZR0FJbHJmRERJaUF0OFZm?=
 =?utf-8?B?R3VKVWp3Tm1lT2VNUFJySGpPNWc0RlFIM3REQjhlUm8wR0hlZTZlN2dIZWdV?=
 =?utf-8?B?dG90YTRzc1BFeVFDb0lIWUt2cWJ0S3NQYzh4dlIvNXkwb1hrZno3Wnl6N3J6?=
 =?utf-8?B?MkFBM3FHellPQVUvUjIxOHJMZWN1ekEzK2lUZFNmUlJRODFKL1U5VTJEZkg5?=
 =?utf-8?B?enAzUDhjQy9keTFpMXRYV1Q2NnowaHdLTnVPaHAxWVhjR2hCRFVsN1BVYmpq?=
 =?utf-8?B?dnBWN1JpQzJJQ2s2ckNFcXNndldMa3hLRnV3NjVNbVM2UDNtMU1YUDRVR3ZS?=
 =?utf-8?B?Umc3eGplVmF2TVlsU3lNdHhvaUZvTGhCbkdla0dxeURZaC90Y3pUbDNTTnpS?=
 =?utf-8?B?eEsyT1dUUXM4WmNXWVBSSnh2MG1rY0REVlBJOTdwd1crUXYxRGt2aWJDQmho?=
 =?utf-8?Q?4QbWJzZXKyb+lrS0bWIG3hM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c1a10b-7c4b-4b74-552d-08dd584733a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 22:28:19.0586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c35R6T+nqStI4x/I+4fwalqiGWHUIysBDuwqCvZI+OUFU9LzRRvwkxh+qLmyt73xwUAr6FdZ/Rv4dP5JSoZqzR6lZfy+3466jXICaDXyilg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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



On 2/28/2025 1:26 PM, Michal Wajdeczko wrote:
>
> On 28.02.2025 21:02, Daniele Ceraolo Spurio wrote:
>> The GuC compatibility version that we read from the CSS header in
>> native/PF and the GuC VF version that we get when a VF handshakes with
>> the GuC are the same version number, so we should store it into the same
>> structure. This makes all the checks based on the compatibility version
>> automatically work for VFs without having to copy the value over.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 121 +++++++++++---------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  16 ---
>>   drivers/gpu/drm/xe/xe_guc.h                 |   2 +-
>>   drivers/gpu/drm/xe/xe_guc_engine_activity.c |   8 +-
>>   drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
>>   5 files changed, 71 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..eeccbf4cb4b4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -82,17 +82,17 @@ int xe_gt_sriov_vf_reset(struct xe_gt *gt)
>>   }
>>   
>>   static int guc_action_match_version(struct xe_guc *guc,
>> -				    u32 wanted_branch, u32 wanted_major, u32 wanted_minor,
>> -				    u32 *branch, u32 *major, u32 *minor, u32 *patch)
>> +				    struct xe_uc_fw_version *wanted,
>> +				    struct xe_uc_fw_version *found)
>>   {
>>   	u32 request[VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN] = {
>>   		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>   		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>>   		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
>>   			   GUC_ACTION_VF2GUC_MATCH_VERSION),
>> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted_branch) |
>> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted_major) |
>> -		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted_minor),
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH, wanted->branch) |
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR, wanted->major) |
>> +		FIELD_PREP(VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR, wanted->minor),
>>   	};
>>   	u32 response[GUC_MAX_MMIO_MSG_LEN];
>>   	int ret;
>> @@ -106,71 +106,84 @@ static int guc_action_match_version(struct xe_guc *guc,
>>   	if (unlikely(FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ, response[0])))
>>   		return -EPROTO;
>>   
>> -	*branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>> -	*major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
>> -	*minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
>> -	*patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>> +	memset(found, 0, sizeof(struct xe_uc_fw_version));
>> +	found->branch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH, response[1]);
>> +	found->major = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR, response[1]);
>> +	found->minor = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR, response[1]);
>> +	found->patch = FIELD_GET(VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH, response[1]);
>>   
>>   	return 0;
>>   }
>>   
>> -static void vf_minimum_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
>> +static int guc_action_match_version_any(struct xe_guc *guc,
>> +					struct xe_uc_fw_version *found)
>> +{
>> +	struct xe_uc_fw_version wanted = { GUC_VERSION_BRANCH_ANY,
>> +					   GUC_VERSION_MAJOR_ANY,
>> +					   GUC_VERSION_MINOR_ANY,
>> +					   0 };
> better to use designated initializers (as we don't know when someone
> will make yet another changes to the struct xe_uc_fw_version layout):
>
> struct xe_uc_fw_version wanted = {
> 	.branch = GUC_VERSION_BRANCH_ANY,
> 	.major = GUC_VERSION_MAJOR_ANY,
>     	.minor = GUC_VERSION_MINOR_ANY,
> };

Good point.

>> +
>> +	return guc_action_match_version(guc, &wanted, found);
>> +}
>> +
>> +static void vf_minimum_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
>>   {
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> +	memset(ver, 0, sizeof(struct xe_uc_fw_version));
>> +
>>   	switch (xe->info.platform) {
>>   	case XE_TIGERLAKE ... XE_PVC:
>>   		/* 1.1 this is current baseline for Xe driver */
>> -		*branch = 0;
>> -		*major = 1;
>> -		*minor = 1;
>> +		ver->branch = 0;
>> +		ver->major = 1;
>> +		ver->minor = 1;
>>   		break;
>>   	default:
>>   		/* 1.2 has support for the GMD_ID KLV */
>> -		*branch = 0;
>> -		*major = 1;
>> -		*minor = 2;
>> +		ver->branch = 0;
>> +		ver->major = 1;
>> +		ver->minor = 2;
>>   		break;
>>   	}
>>   }
>>   
>> -static void vf_wanted_guc_version(struct xe_gt *gt, u32 *branch, u32 *major, u32 *minor)
>> +static void vf_wanted_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver)
>>   {
>>   	/* for now it's the same as minimum */
>> -	return vf_minimum_guc_version(gt, branch, major, minor);
>> +	return vf_minimum_guc_version(gt, ver);
>>   }
>>   
>>   static int vf_handshake_with_guc(struct xe_gt *gt)
>>   {
>> -	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
>>   	struct xe_guc *guc = &gt->uc.guc;
>> -	u32 wanted_branch, wanted_major, wanted_minor;
>> -	u32 branch, major, minor, patch;
>> +	struct xe_uc_fw_version *guc_version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> I'm not sure that we should go so deep into guc internal structures ...
>
> maybe we could add some small helper to hide where this GuC ABI version
> is maintained within xe_guc
>
> 	xe_guc_get_compatibility_ver(guc, *ver)
> 	xe_guc_set_compatibility_ver(guc, const *ver)

ok

>
> btw, maybe it's time to s/guc_version/actual
>
>> +	struct xe_uc_fw_version wanted = {0};
>> +	struct xe_uc_fw_version found;
>>   	int err;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>>   	/* select wanted version - prefer previous (if any) */
>>   	if (guc_version->major || guc_version->minor) {
>> -		wanted_branch = guc_version->branch;
>> -		wanted_major = guc_version->major;
>> -		wanted_minor = guc_version->minor;
>> +		wanted.branch = guc_version->branch;
>> +		wanted.major = guc_version->major;
>> +		wanted.minor = guc_version->minor;
> then:
> 		wanted = actual;

I purposely avoided a direct assignment here because the patch value 
wasn't being copied over in the original code. If it's ok to copy that 
as well I'll switch.

>
>>   	} else {
>> -		vf_wanted_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
>> -		xe_gt_assert(gt, wanted_major != GUC_VERSION_MAJOR_ANY);
>> +		vf_wanted_guc_version(gt, &wanted);
>> +		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
>>   	}
>>   
>> -	err = guc_action_match_version(guc, wanted_branch, wanted_major, wanted_minor,
>> -				       &branch, &major, &minor, &patch);
>> +	err = guc_action_match_version(guc, &wanted, &found);
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>>   	/* we don't support interface version change */
>>   	if ((guc_version->major || guc_version->minor) &&
>> -	    (guc_version->branch != branch || guc_version->major != major ||
>> -	     guc_version->minor != minor)) {
>> +	    (guc_version->branch != found.branch || guc_version->major != found.major ||
>> +	     guc_version->minor != found.minor)) {
>>   		xe_gt_sriov_err(gt, "New GuC interface version detected: %u.%u.%u.%u\n",
>> -				branch, major, minor, patch);
>> +				found.branch, found.major, found.minor, found.patch);
>>   		xe_gt_sriov_info(gt, "Previously used version was: %u.%u.%u.%u\n",
>>   				 guc_version->branch, guc_version->major,
>>   				 guc_version->minor, guc_version->patch);
>> @@ -179,47 +192,43 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
>>   	}
>>   
>>   	/* illegal */
>> -	if (major > wanted_major) {
>> +	if (found.major > wanted.major) {
>>   		err = -EPROTO;
>>   		goto unsupported;
>>   	}
>>   
>>   	/* there's no fallback on major version. */
>> -	if (major != wanted_major) {
>> +	if (found.major != wanted.major) {
>>   		err = -ENOPKG;
>>   		goto unsupported;
>>   	}
>>   
>>   	/* check against minimum version supported by us */
>> -	vf_minimum_guc_version(gt, &wanted_branch, &wanted_major, &wanted_minor);
>> -	xe_gt_assert(gt, major != GUC_VERSION_MAJOR_ANY);
>> -	if (major < wanted_major || (major == wanted_major && minor < wanted_minor)) {
>> +	vf_minimum_guc_version(gt, &wanted);
>> +	xe_gt_assert(gt, found.major != GUC_VERSION_MAJOR_ANY);
>> +	if (MAKE_GUC_VER_STRUCT(found) < MAKE_GUC_VER_STRUCT(wanted)) {
>>   		err = -ENOKEY;
>>   		goto unsupported;
>>   	}
>>   
>>   	xe_gt_sriov_dbg(gt, "using GuC interface version %u.%u.%u.%u\n",
>> -			branch, major, minor, patch);
>> +			found.branch, found.major, found.minor, found.patch);
>>   
>> -	guc_version->branch = branch;
>> -	guc_version->major = major;
>> -	guc_version->minor = minor;
>> -	guc_version->patch = patch;
>> +	memcpy(guc_version, &found, sizeof(struct xe_uc_fw_version));
> better:
> 	xe_guc_set_compatibility_ver(guc, found);

ok.

>
>>   	return 0;
>>   
>>   unsupported:
>>   	xe_gt_sriov_err(gt, "Unsupported GuC version %u.%u.%u.%u (%pe)\n",
>> -			branch, major, minor, patch, ERR_PTR(err));
>> +			found.branch, found.major, found.minor, found.patch,
>> +			ERR_PTR(err));
>>   fail:
>>   	xe_gt_sriov_err(gt, "Unable to confirm GuC version %u.%u (%pe)\n",
>> -			wanted_major, wanted_minor, ERR_PTR(err));
>> +			wanted.major, wanted.minor, ERR_PTR(err));
>>   
>>   	/* try again with *any* just to query which version is supported */
>> -	if (!guc_action_match_version(guc, GUC_VERSION_BRANCH_ANY,
>> -				      GUC_VERSION_MAJOR_ANY, GUC_VERSION_MINOR_ANY,
>> -				      &branch, &major, &minor, &patch))
>> +	if (!guc_action_match_version_any(guc, &found))
>>   		xe_gt_sriov_notice(gt, "GuC reports interface version %u.%u.%u.%u\n",
>> -				   branch, major, minor, patch);
>> +				   found.branch, found.major, found.minor, found.patch);
>>   	return err;
>>   }
>>   
>> @@ -376,7 +385,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   	xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) || has_gmdid(gt_to_xe(gt)));
>> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
>> +	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(guc) >= MAKE_GUC_VER(1, 2, 0));
>>   
>>   	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
>>   	if (unlikely(err)) {
>> @@ -537,7 +546,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>   {
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>   	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
>>   
>>   	return gt->sriov.vf.self_config.num_ctxs;
>> @@ -554,7 +563,7 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>>   {
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +	xe_gt_assert(gt, GUC_COMPATIBILITY_VER(&gt->uc.guc));
>>   	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
>>   
>>   	return gt->sriov.vf.self_config.lmem_size;
>> @@ -1079,19 +1088,19 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>>    */
>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>   {
>> -	struct xe_gt_sriov_vf_guc_version *guc_version = &gt->sriov.vf.guc_version;
>> +	struct xe_uc_fw_version *guc_version = &gt->uc.guc.fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +	struct xe_uc_fw_version ver;
>>   	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
>> -	u32 branch, major, minor;
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>>   	drm_printf(p, "GuC ABI:\n");
>>   
>> -	vf_minimum_guc_version(gt, &branch, &major, &minor);
>> -	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", branch, major, minor);
>> +	vf_minimum_guc_version(gt, &ver);
>> +	drm_printf(p, "\tbase:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>>   
>> -	vf_wanted_guc_version(gt, &branch, &major, &minor);
>> -	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", branch, major, minor);
>> +	vf_wanted_guc_version(gt, &ver);
>> +	drm_printf(p, "\twanted:\t%u.%u.%u.*\n", ver.branch, ver.major, ver.minor);
>>   
>>   	drm_printf(p, "\thandshake:\t%u.%u.%u.%u\n",
>>   		   guc_version->branch, guc_version->major,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..e3d3eadbba8c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -8,20 +8,6 @@
>>   
>>   #include <linux/types.h>
>>   
>> -/**
>> - * struct xe_gt_sriov_vf_guc_version - GuC ABI version details.
>> - */
>> -struct xe_gt_sriov_vf_guc_version {
>> -	/** @branch: branch version. */
>> -	u8 branch;
>> -	/** @major: major version. */
>> -	u8 major;
>> -	/** @minor: minor version. */
>> -	u8 minor;
>> -	/** @patch: patch version. */
>> -	u8 patch;
>> -};
>> -
>>   /**
>>    * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
>>    */
>> @@ -71,8 +57,6 @@ struct xe_gt_sriov_vf_runtime {
>>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>>    */
>>   struct xe_gt_sriov_vf {
>> -	/** @guc_version: negotiated GuC ABI version. */
>> -	struct xe_gt_sriov_vf_guc_version guc_version;
> we may still want to keep local copy of xe_uc_fw_version to hold what we
> actually negotiated with guc, even if we had to reject that (and thus
> not set up in the guc submit code as found compatibility version)

ok

>
>>   	/** @self_config: resource configurations. */
>>   	struct xe_gt_sriov_vf_selfconfig self_config;
>>   	/** @pf_version: negotiated VF/PF ABI version. */
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 58338be44558..c81544ff1cb4 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -18,7 +18,7 @@
>>    */
>>   #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>>   #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
>> -#define GUC_SUBMIT_VER(guc) \
>> +#define GUC_COMPATIBILITY_VER(guc) \
>>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
>>   #define GUC_FIRMWARE_VER(guc) \
>>   	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> index 2a457dcf31d5..e7aeb530715b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -98,7 +98,6 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>>   static bool is_engine_activity_supported(struct xe_guc *guc)
>>   {
>>   	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> -	struct xe_uc_fw_version required = { 1, 14, 1 };
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   
>>   	if (IS_SRIOV_VF(gt_to_xe(gt))) {
>> @@ -107,11 +106,10 @@ static bool is_engine_activity_supported(struct xe_guc *guc)
>>   	}
>>   
>>   	/* engine activity stats is supported from GuC interface version (1.14.1) */
>> -	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER_STRUCT(required)) {
>> +	if (GUC_COMPATIBILITY_VER(guc) < MAKE_GUC_VER(1, 14, 1)) {
>>   		xe_gt_info(gt,
>> -			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v%u.%u.%u or higher\n",
>> -			   version->major, version->minor, version->patch, required.major,
>> -			   required.minor, required.patch);
>> +			   "engine activity stats unsupported in GuC interface v%u.%u.%u, need v1.14.1 or higher\n",
>> +			   version->major, version->minor, version->patch);
> little unrelated

This is because of adding the branch variable to xe_uc_fw_version, which 
breaks the way the "required" variable is defined, so I had to do 
something here.
If you want to make it minimal I can instead do:

struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 1 };

But the change is small enough that IMO is worth keeping as it cleans 
the code a bit.

Daniele

>
>>   		return false;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index ad3b35a0e6eb..914026015019 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -65,6 +65,8 @@ enum xe_uc_fw_type {
>>    * struct xe_uc_fw_version - Version for XE micro controller firmware
>>    */
>>   struct xe_uc_fw_version {
>> +	/** @branch: branch version of the FW (not always available) */
>> +	u16 branch;
> yeah, lack of this field was one of the main blocker to use uc/guc
> version structures, that's why I bed on local definition that was
> aligned with VF GuC ABI, but I didn't imagine that it's so simple (and
> let's hope harmless) to just add it here as yet another extra field and
> it will not break any existing macros!
>
>>   	/** @major: major version of the FW */
>>   	u16 major;
>>   	/** @minor: minor version of the FW */

