Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D02C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDB110E640;
	Tue,  9 Jul 2024 19:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNPUYjvg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29CE10E640
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720552032; x=1752088032;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ry/VVYsVBbfr7XDGN04zkulv5h85KgeNPTciAi8ameQ=;
 b=jNPUYjvgWKp/yfCBOUCy2Fxu5nP4KoN50NYmsP/8c3k9u9HKG3aZPNC8
 xE9v9/woajJyIAhfc/eO4HVWsJw/TgCZACDQ6W/Px7sNgFK8EuXIhAs1t
 pM9cmDngfqZUFmfxLsz0zlusx3eC2y2T/dJPImm+DqBKeH0d0xGGSGHPr
 iQdTTykNunryIWs+Ikc8Sh13rZjNKGjgwXL60ECQ47Wh5NAdaPGscB6xH
 6mtW9mg0LNCq9mg43019BQh+JlR/uzmsC6FbtLklVwkcTqVKTT/tbJm7a
 S7sIe3vfkA4TBadSf9dosFFg9gtGT65fJsZ5Y7xfhhsUolqqTzRAfdwiA Q==;
X-CSE-ConnectionGUID: IKTifop2SbCxfSm4tFX8sA==
X-CSE-MsgGUID: qU8+EyV7RjWx56QE8GTgTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28504892"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="28504892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:07:11 -0700
X-CSE-ConnectionGUID: rvKB24vpSpCclvJYxQtxLw==
X-CSE-MsgGUID: Ayf3v9EzT1yJObtGZz+L2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48400977"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:07:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:07:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:07:10 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVxHIljAaVhVd+wjcOfbNr6Q7YYhVdHiqneQ6y+imngRAd2Wt1w0VbtgQtAYlQYzFXW4H5yWAo/94M1aLwYKMcQ1SqW602AAgAgH2Unb/5+8r6pMQ/4zH1wThQta/Xdx4awD7oS38NTrE1B7l7V5FgOCuDgCK5XKgNDKknp9G3hd+n2HiFUlPL43yT0iwza1/DlFF79AFNvE1xftIvhE6lWBwBuhI+xxJDat37cCHtqrF0Xpk2a1/Z0bG6V0fDHa/q/51K9+TKCkWcArl2W7MQ8CviBu+Hh5oAOa4WAyISt9c09TRbY1HsFzLO/nHIzv5Y7mxqWwtULMrKiojY8rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9ZJ9HneZZUyVoo4jqmGVl0hmxZTUpdmUPU5z4YjMi0=;
 b=ScQLOMJfmlNFJfohJc5SkCsbrGTuiDBNMKMBLdiaioNkDpQL6NPgFHul/SNHoHqvYfy7Y+Rp1ys55/PX8knq7NzXm1oU6np4i7uF4gFrIR+PCaekD5lC8ZT/CRs2tOEuVgRP6Vxr9V7RTDOW8FKIuShItnQECpnkdL/4RiG2Ea1cDNAbCFMUIWDcNO2hxWoPdWqns44Z42ULKVqle3RDwcyv15artzMa/oI7GMRq1DsRhqg0kdAowKu3AhOmmljoW3bLJYmU5NNQPwtmf74R1CC1ksVjSMgtOcCqfiRsR91s8VorPckD7uuZUuex47Y2+5yAObTekfS+sfVSRVD2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 19:07:07 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:07:07 +0000
Message-ID: <6dbeba39-4076-4806-b7af-581c03a61341@intel.com>
Date: Tue, 9 Jul 2024 12:07:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Implement compression support on BMG
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
 <5f2c5b72-6111-4ad7-8635-6a575c17aae8@intel.com>
Content-Language: en-US
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <5f2c5b72-6111-4ad7-8635-6a575c17aae8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a9e301-6886-49f2-1966-08dca04a53a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1FjL3gxL1YxQUwzSEhiaVBJNGRoZkZTODM3OExWTmdwQmhmUTJiZzcraEZ2?=
 =?utf-8?B?Q1I5ZXhPZ2tVZzVhOW82UTgvb0J1MDg1VEJuYWtVVnY2T29tYkdLOWZZY3pi?=
 =?utf-8?B?YmdVb0Eyb25yTFJNZ3JEZU1XbTJyM1dUbWVudUhRdDY4RHBpRWQ1M20xZk11?=
 =?utf-8?B?SzBYdlRVNmZ3UEgycVBNN1FjNXF6VVBQTnNjaHdBR25FTW8xVERvZ3IzN0Nx?=
 =?utf-8?B?b0ZhcUlkbzh6ZHdFVXZzMzdaWTdtT0VBUHJRQ3p5d3JPdWpNYzVzQ2xNRURY?=
 =?utf-8?B?OHVFODY0SXNWWURHZW50aXEwa0tLTDJiTmJQNUdtOGF4bmZVSUQreHdUUTVH?=
 =?utf-8?B?TlRtZm9hTnY1UmUzZEx1WkRhbDlERTMrZnJ3aHdYYjQ0L3ZRMno4N1F4V0pO?=
 =?utf-8?B?M3FxQ1psNnlMbmN0ZE1CR0hBSWhraVkrNkNlK0lIcE5ZMTVySHdPQnp1Sjdq?=
 =?utf-8?B?RThVblRkanhST1p4M3hXeHlaVURLQWZqY2RXM01sNG9SMWNUQXlGKzZPMWdr?=
 =?utf-8?B?aXhVZncxOGxXUXFBeDR5OGlhZmRiNlRlRUJwWS9TU3ZJSURuSGxwSW1qUXNT?=
 =?utf-8?B?dTludzVQbitKRy8wYzF5UDFpV0J4VklpYy9jMlhyTkcwYkdPMlRkQmRzRTgr?=
 =?utf-8?B?dU5PNGpUamJ6eTBET2t3YlhaTWJoeHk1T2prRFBBL0lEUFZtZHFlM2wrQ0Er?=
 =?utf-8?B?dlpYUzYyQ3dpRXcrUGpVd0xhUTV0VDlOTVVSRmJ6aFQ1Nm9kai91NWZ3TFg2?=
 =?utf-8?B?Nm50YkhmVWQ0eUxoRStQTllnV2xkQVg3cVB5MU9IUEpOVWxMYTVuK0h6NUg4?=
 =?utf-8?B?QklVOEF5ejVabi9lRG1mdFh5N09JY0ZqYldqeWtzdUdCM3pUdGpzLzBoZnhj?=
 =?utf-8?B?Myt6RW1SRVZlVGVTZVU0NWY0UVlIWlFwZW1XR21wakRkVU5EbEtoN3hCSkVB?=
 =?utf-8?B?TlVzQ2pOK00ybTRHQ1ZCOFlKZFZ3MVF3Y2x6WHk5alM4Y3pHbTVyeGY1OUtw?=
 =?utf-8?B?TjNiUnByN0lTcElvbkxCeFlLM2NPMEU5ZE5iU3JnTFlNRnN0YVJDQk1rYkRa?=
 =?utf-8?B?VjQ3eFlyTmVBR2NETHE5R0JpQ3FrclZCTkdubFdMZnJtVjA4VTdQdW1EcHlB?=
 =?utf-8?B?RHJaRHk2dXJHM045WEpOb21sSjNjTjg1L2RMTkd6djltWnZ2YVVzU0xxUDlj?=
 =?utf-8?B?cTA1b2RBbU1xbzZLbTUvZ21oZlFFVEFWZDZvWFAzRnZJWEQxY015Q3hDbmxw?=
 =?utf-8?B?emVNRXZBQ1RjcmJWcDNldkpmVnFZMkM3VDc4b1ZMKzlJQ2ZiNGNDV3ZBWXVt?=
 =?utf-8?B?TkpnTi85VU5qeE9EajY3Um5Dd1NubzRUR2hpZGZSck9TcXBNSUtCb2xCendl?=
 =?utf-8?B?UmRRWGZvVjYvZmc4SjRVQ2d1TTR0ZXprbEpqQWRMSmtSdEZaZGYvMEg4NmhX?=
 =?utf-8?B?UHIrRytXMTg1ZDR0Szk0VnNvRnozSkJBVUU2bEowQ3R2azFvME1kcmw3TTZN?=
 =?utf-8?B?NHNCWG05dTduNmFIYjB3UXY3ZzhVZk5rSWtIYTVhZnRoQlV5RGJZa25JL2Qv?=
 =?utf-8?B?b3MxVjZJL3ROb1F3UGRZRnlJb05CekF2eVIxU2liTzhacHBLb3BVR3JYdlFS?=
 =?utf-8?B?bmhiU2VmZ2tReG9WS2VSVThNVlpWZ25nR1FjbXBwVE91VFo0TkQ0NDRrMXdD?=
 =?utf-8?B?RHNHbld3a0JXaWgrOGt5LzAyTHBsU1IrY0srTDI1d3VMcnVSVUtkM25SS3FU?=
 =?utf-8?B?clhwYTRhb0xMUVU4Vm1WY29FOHZnTnlLaElJSGUvbVM1cEtLdzF6Q3NFbm1v?=
 =?utf-8?B?V25oQWg2ME9ldUZkUDg2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHg3czkraHVtbWhZUndlS3dvR2lxekMzT3hnTUVCdUNKSTFKLzZpSzNRZVUx?=
 =?utf-8?B?L1VFSGtjVjYrcmhjRlYzOVNIRkJkZUl0dy9ITG9JVmlRRnFOZ0lPR0J4cVl5?=
 =?utf-8?B?azVhOXU1dEJDVC9jbnNyMUNpMzZaS1JVZnJ1ME5wYTRWcCt4eGx4UnVLQ1Bl?=
 =?utf-8?B?VXpWR3FzWFNJMXk2emc4ZmY4ck9hWDBjQnF2bGYyb21abVdnUGt2dHl6Rm1j?=
 =?utf-8?B?TVBWYitYWjZIM0g0bG9jbGtXSW0vVm1yR3pTM1VIbTNpazhvbEpQc1pNSFRt?=
 =?utf-8?B?NEtVUm8ySERzVDlyNXZvalQvQzV0NmgrUTR2QWp5ZjB4alhKZEFvL3Jlc0Rr?=
 =?utf-8?B?VXFablRCVmtjMmNTbms0cGpxV256SHVFOG1qMTdJQlF5Nzl0MzNZWndOY2dj?=
 =?utf-8?B?cUtSdWhWaFFweXRqR2M4c3pUQndXNGd5aktNNnFXZVl2ZEQ1WUR2dG1tZVN4?=
 =?utf-8?B?WDdRdGxJSWdYYUpFTXRwckxnS3AwL3g1bVNXQjM1cDJ4VURvNXBrR20wR1Z3?=
 =?utf-8?B?VTJiVUpBdFB4U3E4NjExSnFwaXRUSEQ5ak5Vbkloc29DRlFhdGFUUTVyNnFm?=
 =?utf-8?B?RXY0QkMvaTJpY01aK2Exa3Nkak9aNVIrNjA0ZHA1N0xUWjZOVS9vdDkrVU5o?=
 =?utf-8?B?S2gxSk15YjNOVTlGMUJGaGo3NGJmZVFLMk93bmZ6bDdneFllUXVhTEdiSWxW?=
 =?utf-8?B?N2xTYU9QYVRqLzJMYnI4T3BNYmFRVWhDOS9kZGFqMUg2YU9pVG11R2NJQkRP?=
 =?utf-8?B?bnpwSk9rbld0UVgrUzJKWG0yS29EejlzbjJCeFpRZ3FqekpmRm1jbFFDVHFT?=
 =?utf-8?B?V1pCU3B3NUhyMUlDd3laSzlTQkJWZG81MktWdEloQ0ZldWpyTEJjK2kxSkl3?=
 =?utf-8?B?b2ZjL1FKVlVzL1Bsdk9UdkJ6bHRFaTgvemhiRmRnOGhzZTJudUhQeEJhOHlM?=
 =?utf-8?B?L29XbmNqZUtiVkZ2Z09iSEE2M0dYMTFybmp0U3dxMVZmNjVGcHVVNE5tVU1V?=
 =?utf-8?B?Zm1KUTF2SjQ0YXZLRDd2NS8vUVV0b3EvdGhqemgyajZVdXR1ZzEwd054SHpM?=
 =?utf-8?B?T1JkcXF1bklKZS9qZGswdmdZd0FIbVhkN0R1TUtBMytucVFkNFFNNEpvbzlO?=
 =?utf-8?B?UGxlMCtkQ1QxdHl1a2FMT1FsTEtDUHJKSUlqWjcrSEJBQjBGZzNCZlV1YzU5?=
 =?utf-8?B?bGJlSFZCVUpiM1Q2SHpBYlZqWWwxZlViaDMvODMreWQ5WnhKZUJaZWh2QXlY?=
 =?utf-8?B?dUtVVnZuNGJqYjNmVHNNa3l5UDVTM2FqdVc2ckxqSy9UWGlVd2NzdUI3cGJH?=
 =?utf-8?B?eWFJb3lkM1ZZUktrQmhVTmVVNU1XdDFNNDlnTWxtNmpFZnpLMEtqUmxybm00?=
 =?utf-8?B?TU9FVzl4QnBaK1RwYzRTMkNYRUVyQWllRFpYMFZZTlpIa2lYZ2xlZ1FJc2Zz?=
 =?utf-8?B?RG5SZ09qZk5LOUswdUJ5enRTL1pybGVqRk80VSthQTFwZUNuOWdCR0ErVU02?=
 =?utf-8?B?TEJQaU5jMjlFOVpqYjV3WTB6Nk1IZmlRVHdjRnFnMjNIbG5BWVJBVTl1dUkz?=
 =?utf-8?B?eEJhYmU5UUExdnpPMHpIcFJuZFFtOTZhSE5mQnJKTDgwdE1jdXN2WC90TjMy?=
 =?utf-8?B?WnBPcU9YekIwZGQxd0pDT0RjYVJTRWUrOU1VTzRNaTZhWDFzVzVjdmtEcURS?=
 =?utf-8?B?Uks0anltYXJMa2ZsbVJVdVgreXJ2QS9VMHRkaEQwajRIcE9HdmpybVI0RFMz?=
 =?utf-8?B?ZXQ4aGYzTFBKRnZkdFR1UUpYQlRFT3pZNFA2U2IvcHBNRkJ2cUlocVdRWnFQ?=
 =?utf-8?B?Y2F2UFJMeCtZUWZ0eEpKUjdpQTA4R0RXdXFqdUdBNm5DblFORVJpcUh2VGE4?=
 =?utf-8?B?UXpUN3BaMktuMXVJRVVBQ3ZhQ1FRTkJaS1dMNS9OT0Nqc1NXZ0h6VUUyZy90?=
 =?utf-8?B?WExLR3lrOTNzMlFNRkIwUTNCd215VGdCY20vTmoyeUVnS1Q4UXorRm00YVdz?=
 =?utf-8?B?dTVJTFJjaVg1QzBRZUtMd2kwQ1pmWGxQYzR0RzVwRTc1bGNDWG5jOURQVUlD?=
 =?utf-8?B?UnY4RVdxeVpkQTFWYi9KYUQ5ZFJWZ1hDN0FRbnk2RnZML1dGTUMvSDZpaDdQ?=
 =?utf-8?B?YUN5Zm1TMVFLRWVGOFgxUEt6U3dPUTlMSStWOU9YaTFyQmprTzlWeXZSVVJ2?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a9e301-6886-49f2-1966-08dca04a53a3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:07:07.2992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJQZSa854jIAkutlWlMiK99IyY/8Ge7BjhMuRBBLH1XdyU4Y3R9AFFeTZuJGNPlntSX+CxGSrYBXnEKLvtYfCxKS4XHzl+iQJghOcSgZhRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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


On 7/9/2024 3:33 AM, Matthew Auld wrote:
> On 09/07/2024 11:49, Akshata Jahagirdar wrote:
>> According to the SAS for BMG compression, we need to decompress 
>> during eviction,
>> and not recompress on restore. Due to this, we need to introduce 
>> encoding pat_index
>> in case of vram too. This patch explores the solution of setting up 
>> an additional
>> identity map for the vram, this time at the end of previous mapping 
>> offset and
>> with compressed pat_index.
>> We then select the appropriate mapping during eviction/restore/clear.
>
> Hey, I don't see this series on the ml. Are you subscribed?
Hey Matt,
Yes, I am.. seems like there is some issue with my mailing list 
subscription,
so its not getting reflected on the website. I just resubscribed , would 
send this out again.
>
>>
>> Akshata Jahagirdar (6):
>>    drm/xe/xe2: Introduce identity map for compressed pat for vram
>>    drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
>>    drm/xe/migrate: Add kunit to test clear functionality
>>    drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx
>>    drm/xe/migrate: Add kunit to test migration functionality for BMG
>>    drm/xe/xe2: Do not run xe_bo_test for xe2+ dgfx
>>
>>   drivers/gpu/drm/xe/tests/xe_bo.c           |   6 +
>>   drivers/gpu/drm/xe/tests/xe_migrate.c      | 388 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/tests/xe_migrate_test.c |   1 +
>>   drivers/gpu/drm/xe/tests/xe_migrate_test.h |   1 +
>>   drivers/gpu/drm/xe/xe_device.h             |   5 +
>>   drivers/gpu/drm/xe/xe_migrate.c            |  66 +++-
>>   6 files changed, 449 insertions(+), 18 deletions(-)
>>
