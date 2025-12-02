Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D26D116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 11:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1468710E631;
	Tue,  2 Dec 2025 11:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YExTcr1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A310E631
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764676212; x=1796212212;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6XlTpM3VKr/jkdEwLb1zpFvHmcuelXF1WfBxx2p0ORo=;
 b=YExTcr1gMqvrm7Bo/WFT2LBc7wg2zvdIQYR+ubDfF0+S0qdMVhyN8R9q
 6P88ZiOLRMwC6Qc3IvqSVCk9Y39VI4g5V5/W0uqRRckJKwjhENfx9gcgu
 pEHGXXx8BUtipSBb1+OM8t8YDyr2c4KlDLVoL63yommEfmn/751xdmIBa
 vJcSTnwreQ3U0t//lxsGaATAiOt1ReKOheNvK9OUVWG5yzc/qGUSI2VKp
 0qtfrMpnJJdEBWUHYK46J5sm5F7IOtK3Rkwgfylm1uiMd/jvxBEBozreG
 RcGixkcMHe2ttfL30rK9hZe+g5kx3EdX5U45SabOBzlTYtme/wXgpbKhD g==;
X-CSE-ConnectionGUID: zNtS11KlRgihxGu/sV1E1Q==
X-CSE-MsgGUID: TUMRt91DQym22J3gMx1Qrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77325705"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="77325705"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:50:11 -0800
X-CSE-ConnectionGUID: xmpzNzeYReubdmfpvAQ+wQ==
X-CSE-MsgGUID: DuX92JGnSaCVOFuZjiIwpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194444747"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:50:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:50:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 03:50:10 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:50:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZCKSNr7/JlACmm8yEX6uXrj5JUNZ+/29+lTpBVuBiIOpQ0MZgeBAJ0wVjPBwHTfo334NXja7TtfTgrd5vDhwZe/BeyiWTLdmKlk7YQUSoyYFU2fVOquP+tk5czjIWI265C1hIXeMD3Z6Wc7zWRSI+zRxqSK3ZAnC0ZuHW/nRtDq5hk6DNly5fiTxXduvnCK2g2VSm90HNug7kfL5pwRBIrIsemb+argLm2+SrSg5vUIb35ORduLmnPb9QbqbLIMKFKJuwL3sKh1acKSa1lstx1MDw+v1r94ObnrePnxkEyS1aXIE9+tML2RpPg80rAtXOLFOwpFGnheeEggACsDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+u10TUrTn2gzeAkm17DLxmXlKWcrSUVy8aFNcjn5N8=;
 b=n8T3fOUPgIuy5xki08CpBN8MnqNIo9Y5I5+6U6mvYvU6KbFJdDH1vJOgNatkSPViJZX4T21mzkWRXnfITUyRp0B5ig3I8MTiu/l5H07GI/0nJ46h+k8So/oQavXC6UzS7/1mvDrJ4r3fM1AczcZe2QYDqQnnTMHgupd7J3yIVI/fZhZ+mZP6BoFQ/qH1vJO3Z7e6Z1e2kXfVnOAJA2GMJ4VU234AaifK90EUfckp8IHdByaTEr9/iiTDn27NHohnoZ6IvMgZp4SihUfvlw7zkXzd9X9jLSby7JXrRR6CddkqDb/DQAFIba9ULMkYVnd+/xWqXD1mpQogLjhQ0Iy8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:50:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:50:02 +0000
Message-ID: <cb4816e4-f0c9-4f1d-8628-ff8d3eeedb9b@intel.com>
Date: Tue, 2 Dec 2025 12:49:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-15-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-15-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:802:16::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f71968-8f16-4e93-64e2-08de3198ed47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTdSUy80d1RYZEpVMmNPY01Ob240UWlXOCttQjF2aDlubUg0N2dMbFc3T2FY?=
 =?utf-8?B?N1NJL0JqcWxPRjFUajNMSDhOZGdXdVhiMDlRMWZuUUpsMmZxN0I4ajlsbUFW?=
 =?utf-8?B?T0ZsSDdmbDZueVJuUEhNdW5BQm1hRWFmY0tLc1oyeGJEQlozSml0MStpVTlU?=
 =?utf-8?B?VG5xRjRnYysrd3ZGaS9NdHFKd3l5NE4xY0d3dSt5L2JZN2d4UWFndlFRcG1l?=
 =?utf-8?B?RGhJdVFmcWhoMFZEQ3lXQ3FWbUxPS0psMUlTYmNhanh0aCtwV3l6d2xCQmVU?=
 =?utf-8?B?RFdSQjdSTlpaN1B5NkJraE4rNUV4bnIyZU5URCtodmxKbDF0dFhDWllZWkRX?=
 =?utf-8?B?bHVVSFZ3ZFF5WU90YXpHVGxzMFh6aUtlWkV3UXF3aVlxRDRnNzVSclZMcXov?=
 =?utf-8?B?OThsV2NITGRKYzl6NzE1TjN0aDlOVzB2VGxLQlFsOUJxdHB3dC8vOWF4MHgz?=
 =?utf-8?B?clBoM1NOLzR3NmNNTVBpSzE4alRRRGpiZzZVNUNDWjY4ekxNUEV4OEJDVXJJ?=
 =?utf-8?B?emVhamsvZVI1SmsrWDViYkJLTmtObWFqdGtLcTRrREhKTndCbnpOMFZnckZ4?=
 =?utf-8?B?Q2lRLyt3MVRJWUQ2U3Y1Z2w5NzE2bDIvM3ljemxWK05KazExNXQ1UTBGKzFB?=
 =?utf-8?B?bEJsQk1IRmVndWFyWFBFUjlhMFpnck1TaXB4UDNCeU9ndFcwRzg4K0drWXVn?=
 =?utf-8?B?VHBid0pVcE5YYlB3QzdCTUp2bVQrNXpxTkw4Qlo5alQvVnhxaUovdkIzWUFp?=
 =?utf-8?B?THE0b1kyVWdOV0pPbURCTmlUbm96SC9zRllzMWxXWnpCNmdaM2QzcXlsZkw5?=
 =?utf-8?B?dEM2QU1nZHpRZnJjS3FhR1dzZ1F0UXRhRlJZbnZ4ekU2dzlCNjI2NjNXckhN?=
 =?utf-8?B?eENMSm1uNWI0aE1ZdnYvNm96Y3F4UjhhRHFoaHUydmRLZlVnaWtNUWQ1aW1Y?=
 =?utf-8?B?TXlNZWZ6dkhPYnlvSHhERy9COGlydXJCeHhJRHV5aHdBTU9vRzI2bEord3Rp?=
 =?utf-8?B?WTdjcDcvU09QZHo0MlY1a0V0a3UzZGZvQzZ4NVhsWU56ckVPWm5JZlF6R1Jq?=
 =?utf-8?B?L0xFTi9sZUlRdVZ2ZXFBQTZTVVY2M012RjFsQjM1YnBBTFVkWFgyMlBVdXk1?=
 =?utf-8?B?MndmRUk5MFQydlZSWThKTjFVeWZPTjVtTDJBTUlUN0NmQ3hYMFRhNUFwd2Jx?=
 =?utf-8?B?K1kzZjZsV3pUcW5qOUtaWnN3cnpjSnRRaW1Yd1M5NWpIMGQ0OEN3WjBsRTQ0?=
 =?utf-8?B?cC9RSlFXRUR1eDZOMmpaOEh2U3pabU10NjZHUWNsVW94TGt5eWNPTWF3TEtj?=
 =?utf-8?B?RzUvNFg2MXpxRkFTNVRoRVpFUnpuZDhaMDJsMUoyZTJ3LzczTHhOd0dBQ1lt?=
 =?utf-8?B?dUxJM0k5cWFUOVgvdExubjNKSHFVMVhsL3gxeDNDQXQ3OTF2bnBER1UvWUlu?=
 =?utf-8?B?NzBHV2NIQWFob2lmM2U3RGs5RUd3QnE4ZVB1dGJWb2FJYmxFaDJid2xxbSs3?=
 =?utf-8?B?TEJoSEh1dWdUdVAxRWcycUJSU2NCS0ozUjByUnBZUmdYdXd0bnJFRHN6cC9P?=
 =?utf-8?B?YTh0SnFkaUVEcWpRZG9kSmdXVlRMRDh5N0lVZW9TRURQaFpFTjhNa0I1RHVR?=
 =?utf-8?B?TmtHMHkrdVkzTkpMa0hmRU9yN2hMQjVwcndKbDlkSUowNnI0eTcvaTlUaHJ4?=
 =?utf-8?B?eDVZblRHZnZndlNUbjV2aHBrQTdDRWs2eG52bUdNcW5kOTlsaWlXZUhvTFA4?=
 =?utf-8?B?YUUwY2VaOWJ2Rzh3U1R1eCs4dDR2RGxOQ2srdVZtSUE4aVlGVmpNK0dJMGkr?=
 =?utf-8?B?UFg0Ni9Nbi8wMDNOM01Rc3dERlVOWmwvOEpvM0hrN1VXNGhCeTRod0Q4eVhm?=
 =?utf-8?B?Sm92djJlTU5XR1NFQzBEVHpCejRjWGtKcWEwZHNXZzNoYlBMNHdvcTU0Nncx?=
 =?utf-8?Q?PnurVM+L4TsoKuMk86xRRMqWq/l7Kqsn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1orY3c0eFc1RkpxMW5ub1hYeGZvb1hsOC9KMzZMMXdIV1BKdnhSNkYrTUtv?=
 =?utf-8?B?T2QyOUd1b2h1TUpKRVRQdytLSEtINEc1aVVNOUtVVzg3QVl4SEw2NStSUGFI?=
 =?utf-8?B?Z0JLOStpS3FrVDViNytqcVFvZEJ6UFN1S1FxUXFXY3docHJJT0tLeTdEMElh?=
 =?utf-8?B?UlB5eFEzd3FJMWNIbnR4ZW1rVkpZMXFSTFFPSitkb2podFBoOWVsSjB3VGxH?=
 =?utf-8?B?VXhiTS9kSHJZbUVvMjJ1RlhxaDBGYzJVN0NwdXUvQTM5ZCtyK1pqZW5uMXlL?=
 =?utf-8?B?QjVNN0J2WW82OTZPZStHcXBsM3dDenl3VHZOOTBlRjJFK2FSc3RWNW56Q1R4?=
 =?utf-8?B?b3Vha3ZqQVhhUjlKUlBTVmliNC9vN3FETUJFWStCckFpbGFBNThoREExM2RP?=
 =?utf-8?B?WHBRR0ZiZXpHdjROdmNkaFo4ZTd3WGhLYzBCUENTVDltMFVEUmJmOERMMy8z?=
 =?utf-8?B?MXRJaDhkTGVaNDZUZGsrZ0lQODNsQzNmcTArRjd4dTE4VCtmTmxISThqMzFx?=
 =?utf-8?B?TjVKNnNyME4xMUVpNFRkWElUaXNuVENkcVFpY0UyUW11UlNzWjJwOG1MMHBQ?=
 =?utf-8?B?dXozZ0RNbyszZ0hnREljRDJGQTE2WGt6QkdaZ24xS09rRXlBU2RKblVyWFZo?=
 =?utf-8?B?QWliMWRtajFsMDFqS1hJSytlNnJwZHlaVnlrWVhCMHVBcWNDU3BJV0NIN0ZQ?=
 =?utf-8?B?UEJIaFdjaG5Dc2ltWXhPWjl3V0hYV0RuWE9TcXJmaXcvUnkyTnpKQ3BXQmdL?=
 =?utf-8?B?UGlUZENpLy8zbnJiS3FNMXFIT05zYjlCYXlTbjdEbExBRHNNZkdIR1ltd0VZ?=
 =?utf-8?B?RHdUODQ5TzZkSkFiSDFkeStHOXlId3JZSW5jZlo5TFBzRFhob3JJUU91OVRv?=
 =?utf-8?B?c3RDeTY0QWg3QjRFekRPVzBwSnhuUS9lQjRCRVN3WWhtQjU0OHR1U2RQajN4?=
 =?utf-8?B?M0g1QzROTldXMFJ0dWRieEJUYTFnak51aW5IbEhBMWFwN2FWZ01oRHkwYm9B?=
 =?utf-8?B?ZTVlUXFkMjNwY0FPd2gxSzBobzFia2VWQlJHNXhHbkdXNUl5ZzRkQW9KK2p1?=
 =?utf-8?B?OXJ2a0MzUjBnLzhWNWdMbzhYa0hnNG91NmVGamZYR2hBYmp6dkExMG8yaTlq?=
 =?utf-8?B?QnNqVnJwOGpWR1FJazJEZFZ2enp6TkhZdndNNmxrcGtIeWFXNkVESXBHWUVi?=
 =?utf-8?B?OGlGOEZOcU5QS3AyWkVZRzlOS1Rmb3VSdml4WEx3bGVuS1ZGSnJTd0RpWitm?=
 =?utf-8?B?a0xlZWNLd3g4TjBsc1RnMHN4aE8rOVBUOEk0c2ZMRU1Zd0xiV2FJUVU2RTNz?=
 =?utf-8?B?UVA3U0Y4dHNZTURiRjV2K3NPUGhJcHRyR1dSMmlJeDU2aTYzckxwejN2L1Yz?=
 =?utf-8?B?bFRMS3lDenVXMXJSbkNoNTRpZWIvS3RGcGFXVWlleFpxclI2S0ZoOW1wR0sr?=
 =?utf-8?B?dXhSanl3YWF1aXFML0s2REJKbmZpR3VtNHl1S3hWazJlOVBUK24rVXhIbUxY?=
 =?utf-8?B?MkV3TjFuWEVtcXNVQmZRdU8yTVVYa3lUL1h2aXFwVTVVUWNsalEyRVZ1QWdH?=
 =?utf-8?B?c3RPRFpLZTEwOVNPTHdoODhDNGQ5TytnSENZUjFhWEVMYit4Z0htbTE5VWI0?=
 =?utf-8?B?a0s3NXBaR1c1RVQ2R2xlNGNjUENvMndsaU42NkNhNWRSNHJHeGhaalBGSFcx?=
 =?utf-8?B?Ukw4a29sTDlKZHowZTlXbXJMRVFmcnJleW9BazdlTnFvZFhyaHdmY1Joa2lW?=
 =?utf-8?B?SkZmblFLbU5FT0VEY1lrQjAwYVVSMzcxWWs5OHh6YlN0U0ZCb2pIdDBocVk0?=
 =?utf-8?B?RDMrVWhobDJqOFhYMHpGeFQ2RFpHN09oZFJybmRxdlpJcnpYNjdTUjR3aFFt?=
 =?utf-8?B?dkNQTXVnaUtWSFVSZythM2NwQTdyNHprbDRCeVk0ZjgvY3o2TG9Uc3FZc2R4?=
 =?utf-8?B?WGNFU1I4SkY3V1BGNkI2bVY3U1VWV2lWYVJLcTduUTlQbnptd0paaHZ1VWFS?=
 =?utf-8?B?dGJ6cXdZRGgxVTZhaWJNbkdLWSs0a1BHcEdBMktDYjZ3bllpQm1FU3p6Z24r?=
 =?utf-8?B?SU5uVElWb3NPNjhweDZ1UGhIZlMyTXFoTGdiRmtORjlKWlZPQTdBSHRJT2sz?=
 =?utf-8?B?UVUzSVBtd3ovVXdNZkEwbWNRZHpJTXZxQ1h1azhDejZqTTh2Y2RhZFV0anla?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f71968-8f16-4e93-64e2-08de3198ed47
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:50:02.1265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcyKOeAhbwnVu5LaHgSNc1Xg28tB085ImvAESRjiT276tJpFYZ7zoUaFX2dSO7z8mE1xJgCtYs4aR1ZpkYYE6GWXvK0Uvx7mPYah1OH5Jk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Schedler groups are enabled by sending a specific policy configuration

typo: Scheduler ?

> KLV to the GuC. We don't allow changing this policy if there are VF
> active, since the expectation is that the VF will only check if the
> feature is enabled during driver initialization.
> 
> The functions added by this patch will be used by sysfs/debugfs, coming
> in follow up patches.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 129 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   1 +
>  4 files changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..274f1b1ec37f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -200,6 +200,20 @@ enum  {
>   *      :0: adverse events are not counted (default)
>   *      :n: sample period in milliseconds
>   *
> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
> + *      Ths config allows the PF to split the engines across scheduling groups.

typo: This

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

don't forget to update xe_guc_klv_key_to_string() to recognize this new KEY

> + *
>   * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>   *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>   *      up Stale HW register left behind by previous VF)
> @@ -214,6 +228,9 @@ enum  {
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>  #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>  
> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004

maybe we should add some _LEN macros for completeness?

   #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN	0u
   #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
	(GUC_MAX_ENGINE_CLASSES * GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)

which then can be used in some asserts where we prepare KLV payloads

> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8> +
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>  #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 9b878578ea90..48f250ae0d0d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -97,6 +97,25 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>  	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>  }
>  
> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
> +{
> +	u32 *klv;
> +	int err;
> +
> +	klv = kzalloc((num_dwords + 1) * sizeof(u32), GFP_KERNEL);

no need for extra alloc, use 

	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);

> +	if (!klv)
> +		return -ENOMEM;
> +
> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
> +	if (num_dwords)
> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
> +
> +	err = pf_push_policy_klvs(gt, 1, klv, num_dwords + 1);

and then

	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);

> +
> +	kfree(klv);
> +	return err;
> +}
> +
>  static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>  {
>  	int err;
> @@ -444,6 +463,7 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>  	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>  		u32 *masks = NULL;
>  		u32 num_masks = 0;
> +		u32 num_groups = 0;
>  
>  		switch (m) {
>  		case XE_SRIOV_SCHED_GROUPS_NONE:
> @@ -463,6 +483,13 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>  
>  		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>  
> +		num_groups = num_masks / GUC_MAX_ENGINE_CLASSES;
> +		if (num_groups > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT) {
> +			xe_gt_sriov_err(gt, "too many groups (%u) for sched group mode %u\n",
> +					num_groups, m);

likely can be replaced by xe_gt_assert

> +			return -EINVAL;
> +		}
> +
>  		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
>  			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>  
> @@ -473,11 +500,112 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static bool
> +pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
> +}
> +
> +static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
> +{
> +	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));

hmm, I still don't buy that NONE must be represented as valid BIT
IMO supported_modes shall only hold bits for valid configs/modes
and supported_modes == 0 would indicate no support for EGS

> +}
> +
> +static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
> +{
> +	return pf_policy_has_sched_group_modes(gt, BIT(mode));
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

having helper for explicit disabling EGS would be nice:

	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY, 0, 0);

> +}
> +
> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!pf_policy_has_sched_group_mode(gt, mode))
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
> +		return -EPERM;

maybe -EBUSY instead?

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
> +	if (!pf_policy_has_valid_sched_group_modes(gt))
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
> + * xe_gt_sriov_pf_policy_set_sched_groups_mode - Control the 'sched_groups' policy.

new BKM is to add () after function name

    * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control ...

> + * @gt: the &xe_gt where to apply the policy
> + * @value: the sched_group mode to be activated (see enum xe_sriov_sched_group_modes)

maybe at this point we should already use enum instead u32 ?

> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
> +{
> +	int err;
> +
> +	if (!(pf_policy_has_valid_sched_group_modes(gt)))
> +		return -ENODEV;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));

in Xe we started converting driver to use

	guard(mutex)(...)

> +	err = pf_provision_sched_groups(gt, value);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return err;
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
> @@ -516,6 +644,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>  	err |= pf_reprovision_sched_if_idle(gt);
>  	err |= pf_reprovision_reset_engine(gt);
>  	err |= pf_reprovision_sample_period(gt);
> +	err |= pf_reprovision_sched_groups(gt);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	xe_pm_runtime_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index c9c04d1b7f50..36680996f2bd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>  bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>  int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>  u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>  
>  int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> index 3b915801c01b..5d44d23a5ed4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
> @@ -27,6 +27,7 @@ struct xe_gt_sriov_guc_policies {
>  	u32 sample_period;
>  	struct {
>  		u32 supported_modes;
> +		enum xe_sriov_sched_group_modes current_mode;
>  		struct {
>  			u32 *masks;
>  			u32 num_masks;

