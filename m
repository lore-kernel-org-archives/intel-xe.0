Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9467C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 20:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C1E10E061;
	Thu, 20 Feb 2025 20:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2LA5Dhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C210E061
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740082167; x=1771618167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ownd4qInVkvhFfgJG1Jqr1cAReLN+CbRSsO6ZuvbVFM=;
 b=T2LA5DhiV7SMRTNCpuEjV40fQtr96/iV+AsxIA3YrK+RZCO17SQNRFjV
 vTKGOFW3y6GSQ3Sny2DzhPcNj9+KthoaxE3s6kYJzUVx+ebLPc/Nq1ifz
 I3flpAeHp3kPulN1e4nYIbW3KgoVvL56Ew5vCn9DtW98jw832V1MR52Av
 nUfOfWBNyCYV27jYfmfoZ8jQgwhGDIk2lu3ZoAnRQUveou3+dvisHlygT
 gO8qpxqx/IQCtFVl/zFR1E+GdHrAE8aZ2NkrgaBEtRUKxLLVtN1ABZKHd
 JGsUw9d5zSGf2YkJGaTmO/vdDm2ilFwtCj4HPDrgm7qxJ0LaPoinIII/X Q==;
X-CSE-ConnectionGUID: hbSETtowSOmZPn8I0quV/w==
X-CSE-MsgGUID: saF7f1EvTseiGUXaO6Twsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40895017"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40895017"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:09:27 -0800
X-CSE-ConnectionGUID: 4Vl4cCptTpKzhN/z0y/heQ==
X-CSE-MsgGUID: pFhP0r6ySx6B4SV41G3SxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120387869"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:09:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 12:09:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 12:09:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 12:09:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVqxrKaSz/6XbOPkdzgcP8eaccgz0Wa1qx6t5bGJ7h03akAetgCusoseU3JoKctLoCVlWpiDREAdIVU56sb2PO1fGvVluesRMXpLkB+5DtxhNDfsymtPuVdD1jyyOm8JTLKTqhM7j9gBoeNLa3YWPxeeRsoHek3dZX7LYBh+sNIyzNT/avnzbbLhUove2HYPTOSJz17gtSTRUyvIjM9LlCnooKlftOBVQfXYwc1Swm1f1kkk1Tsct+BFgWaOlXDKI95SbpSEsMdWjLdhg569PqgdPi7115SzD61XKgqRBzmJ4POOtE83SJMhFzupNdVDig+zzCJqXkg0qDjlHCxPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ownd4qInVkvhFfgJG1Jqr1cAReLN+CbRSsO6ZuvbVFM=;
 b=kuwTCeMTcpDdl2J69IvWt7X9arl9Bifz7tG8gXKQEgWMEfVRinFzbVg0ZrXFfSM1M9i2dJhjSPN75cZwRUJqTqRf5SM+30geG7wsZby+q8I1DHHT5tkpwE21MgWFH478htiwAoPnLYE1C0kZPBCAPX7rkIzp5fXo1qQ+ZxEOnDU7JEfkTm5ydBmvNdYNGEfscpnGOPkqB9BS55fTQePZynMuMeqQpIhqNbtDG6JX8VAyT0man9H39m7aSe6/4tL4exemv3AQd3AQFygVzSCCofItFP4TyCfVlbPapEB/ICePY3EU+fWKGwfuiPeyqCiMVNpnR/w+mSQkwnnsNRKCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 20:09:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 20:09:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Topic: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET
 action
Thread-Index: AQHbgwnEIcVjYqYueUSSRAUnTbsefLNPHw/QgAFpH4CAAA48QA==
Date: Thu, 20 Feb 2025 20:09:23 +0000
Message-ID: <CH0PR11MB54445213BCD785AD469D5FB3E5C42@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250219192710.281-1-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B00440112FF389883EE1E5C52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <4ba44d2b-96fe-4cfe-a679-e3f6c9a23d24@intel.com>
In-Reply-To: <4ba44d2b-96fe-4cfe-a679-e3f6c9a23d24@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA2PR11MB4921:EE_
x-ms-office365-filtering-correlation-id: f99a6df4-8a0e-4302-c65d-08dd51ea77d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dENKTlF2TVlUUzVyZzN4OXhjcFZUL0lkUUplRjFnWlFOb3V6c05zWEZ5VGMy?=
 =?utf-8?B?MjhzNHJSMDRRVGJmaEhBdm5LWGxZcmtHUTVQZ3JuYkFOWGk2K3NUU0tQZVhj?=
 =?utf-8?B?WFV3ZmRZdGdZMGdWNjhBT3A0eEcwajFuREZmb1hBWElRbk0xM0ZPeUVIaVQw?=
 =?utf-8?B?L2RmaDV6YWFuOG9ZaWZLclJhUE5temZLRDd6VnpIeXVCSGFYRVRlSytUeE1t?=
 =?utf-8?B?b1YvNFlGNkJJc09NSWY2Ym9ieHo3RHQ4RXl2ZWVqR0VteE9UdjhLQXJ3TkdW?=
 =?utf-8?B?VkhZTnpEZjI5T05KOHpuSjVNaHZTUHJqOVQvRmE5R3YzR2xvQ3psdTIxd2xm?=
 =?utf-8?B?NVRmS0xGUCtzR3ZqZ3ZXUHhwVnRlK29kS1pNL3Q0KzZ1aUxMNWwvWjhiYVZl?=
 =?utf-8?B?YzNsVnJBVkpkUlFKNmN6UkJBN1ZNWmNtUE5ZeW1NQXJmMVJNTm9OMzBra0cv?=
 =?utf-8?B?OFkrTE9uWVVnaW9ZbnBlTWxxUlNXN0ladHg5eE82cVQyTFJRWjBxazR1T1hF?=
 =?utf-8?B?eHNhT3hPdGI2SzllOUZRUkRXVUJKUEZaVk5JTU94dUFZaWRFbnRVcU16Ulpl?=
 =?utf-8?B?QnNrUXZNYlFZeVVQa3NVc1RvRGIzSFZzOW5peWJyTzkvNHZZSmMyM2Q5MHlx?=
 =?utf-8?B?eGNXOHdDcTZVdTVwanFic2lhVlo3eTlYTFc5cUt3VzZ1ekI2Q3psdXBiTk53?=
 =?utf-8?B?RzFISDB3Y2N3bXFULzVCdXROdGFmTTdWRHZ4NTZ2c2J6MnNWS2paS1VETkx5?=
 =?utf-8?B?UXI0Y1VianBGZDV5Q2wyekJCNTl0SFdBUHRLc1lIaVhreXIyd2gvWFh5eU1y?=
 =?utf-8?B?bUVKRGpyYUJnUG5HT3BGSmt3ZGtIRFpod1dtbTQ0SVRSdStLdW9FT2N4MEMv?=
 =?utf-8?B?ck1majl0MlROVlVCZVJGcXNOcVBkVDJlUGF6QXhzamdwSDR3THBLWlBmeTNa?=
 =?utf-8?B?d2dDZ1JLWmV3UE90UysydFRONHBTQzBta0ttcFo1dTVEN2pJM3ZFTDdkeWl4?=
 =?utf-8?B?d1lrcEFTNlRtOVYvMUhYVm1vcDlQbnNJTjFDY2w1N2tZS3ZzUGw1U0VmdXpT?=
 =?utf-8?B?SkcrWk95NG1tbHZKNXEraWZST3lHTVhRYjV4ZjV0akRjK1k0NGJ2S1pUWE02?=
 =?utf-8?B?cDlUanF5a1lTWjhWMmRFaUxRdkFMcDhiS0UzclJpajZvWm1vM3ZQNGFCMnFB?=
 =?utf-8?B?amgvVm5DRlcwV2pBcnNFSm8zSFpldXhxeVRHWEZrR0t6dHk4UEhobzU1UEp2?=
 =?utf-8?B?aGZaOGpZdHB1MXlhVzJHeWZnMDNnNW93NzAvbWRkNCs1Sk04aHYzRDk1cFlG?=
 =?utf-8?B?cjMvRFAzOVgwdmZUNG1IenRGdEkyWTN2ZFZUekozYkN1eFpjdWt0dzdKZlZO?=
 =?utf-8?B?UlB3RlIydThnSkJ1cmh4R3BPeUZtUVFQb1hkcjZGUlpGaENPbFF6am5qaWkz?=
 =?utf-8?B?YmU5dGt1ZmFVS08yem9UZVp0U0w0WkNSSG9MSFdtVkRLYVF3NktTbmJrNUpn?=
 =?utf-8?B?cEVEUzRQWFRFQ0V3eHVKNFNaVVdZY1RsMDVWK0pUQXZTZDg4NkRhSnhrMGFs?=
 =?utf-8?B?dmwxWFJFelhEeXdFVXF1Q2E0TVJ5R1FNUlBWai94OWxmYm1YVmd4Y2hUb1ZY?=
 =?utf-8?B?cmdON0tFZ1doQ0l1cGJ2am53Q0NUandmR2dPN1JRdEU0ZFk0M1NlcS9LcEVs?=
 =?utf-8?B?cTJrL2Q3OVZybk9SNEkzWHJOU2c2L2NzU1d2SEE3dDlSTFJteHk3UWZzQ3p1?=
 =?utf-8?B?R3RMSnJYRjVMOHY4TTVuZTRFRUpjYmt5QVU5SDlZQUZIaEVYZ1U4RFlQK0l4?=
 =?utf-8?B?ZWNmL1gwSEIvL2xkekpGT1Qxb2xXQ1pmOHEwaU9NL2JwdGUySXYxckNtVFBz?=
 =?utf-8?B?N0l5b0FOQU1HdjhFNGd5VHA5Vk9mbk9OaHlkSSsvb2FPc05RUUNwT1RmeGl3?=
 =?utf-8?Q?vTdtwtjulpK+PdoQW0oQk5Wq9IK3pmrM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmFPZzR0aEdQZjdEbldkVWwvMVlSWFJLTTVaVm5XNEtxRS9PdGkzd0t2Y2JN?=
 =?utf-8?B?VXBpcUcyOWhsVUsrZHgvRW5TbmhEcEd0b2RLL2RlRzMzWEltb1VNcFVoMHdL?=
 =?utf-8?B?U2t4MUNPSzRrN2RmQWMxL0sxWENZZGtySFREV3ZuSXpJVS8wV2JDRjhYN05C?=
 =?utf-8?B?RGtNd2dmMnVBNEpYVCtjR2RtcTFvOUhlczhwZk9MSmxZKzhvWWFZT1IxU0dr?=
 =?utf-8?B?cHpNRllQc2xVbVYwbUZRUEdLS0dCWCtkVlY1SkNwenRONk10UktoVEJOa1F1?=
 =?utf-8?B?VktGaVNOVkVkQ2sra29VaWluMzBwTFBiQ0xmNllMZ1hoVEdSeU12alVzZjFs?=
 =?utf-8?B?d1l2M0pucERlczdLajQrV3hlWXNQdllDQ05IeThVcGFDTG91eW8reVpwc1Ez?=
 =?utf-8?B?SjIzQzZUeHNrRXM3V0pwTmlyb0RnWkNCYVdVMUtvaVZyL2RYL3EwN002OEpK?=
 =?utf-8?B?RFlWc0gvb0lWb3V0dFA4aUhjanJ5TGtpYWlNaUo2SXFPSHFhVVBIRWNqQ2Rs?=
 =?utf-8?B?NDg5LzNtQ09KeFpra1BJUHR1RGtUS1NSV2tzWGJkcGF1MldiM0xBOFNhb3Ni?=
 =?utf-8?B?MG5wdVVreFEydUh6MHgyMUp4NnJkT0UyQmZ3U04vUHhLeXllam5HZkJBOXRM?=
 =?utf-8?B?ODFJVGRraHZiaVZ0aXQ0SXUvZzhsSThJNmJIbUtrZFFQS3ZhelJLMTh3Y2tF?=
 =?utf-8?B?ZUgrS24rTkZ4SmJJSmlSVDkrUjB1UHdTbjlKbHdZazFqZFc4eEVoUjBiTjRh?=
 =?utf-8?B?Z1BlUElnbXhicWNJc1JabWFpUTg2K0k3SGtzdGhQbmFIdWlZMm1zSlZlcjl6?=
 =?utf-8?B?cWQ2ZTk3bXNuWi90aUdzRkhnemZrRHNCQ3RuZGNKdGFkZ2hBVFlHcHpMajdP?=
 =?utf-8?B?eTkzenJqRHpMc1hYaUFia3dMVU55K3hnM2JYQjJsSnlrdFhaRm9qcVRoQ3Q2?=
 =?utf-8?B?MDV1VGtuTHhYQmpCNWtRdTEyTWtPN3lhbXI0VEJ5amcxM3lBWkpjcDYxK05Z?=
 =?utf-8?B?TytCT2V5ZThrYk4ySmpRQi9Vc1hNa0Z5dEMrVTZGS3JtTHRwV2grbWRUYmNZ?=
 =?utf-8?B?MTBvMWtxeklHVW5lM09HajV6WnRyQVpyYUFoUDg0OG5HcTFWOEpTTnI3YVBM?=
 =?utf-8?B?WjBpMWN1WTNGcXZBYmdyZmMzVlNDeis5eHAzY1ZoQzFPQkdmYWtveUtrNWRp?=
 =?utf-8?B?T3ZVaW1sbnA4Y2ZGL2R2SEhITEFFbTFNWHJVQmtuKzgzQjdGYm1aMHhJRW5J?=
 =?utf-8?B?ZzIwcUhGdEQ2ZXJrZmg2WTRlK2pMWTNmaEJpanAvL25FUGhXLzdCYUQ3VitP?=
 =?utf-8?B?UU1FY0htdlJLL3ErZmlQZUJFekM3ZXFlc0oydEtoRXp4ajc1NG8zajJETzVB?=
 =?utf-8?B?Z1UzWU5PYzl4R21JeHdnOXRIaDBzK001b0NjUmIxbnNoV2ZrZDE0VVJTaGVE?=
 =?utf-8?B?OVk4NnNSTlNlWmVsZG05MW10T0NTU2dwTTh5QnAvTFM3WG9zNnB0VVNIZ25Q?=
 =?utf-8?B?R1Y2UTFKNllGeEg1b1dJRDRBanBnUnpuUnhXZUtmT3pqWjlkM01obnBwb25r?=
 =?utf-8?B?eFRHV2RZU0FZWm1FSVJrYXI1eVBZQ3BwTm5TY2I4MkpKVzdsL0p3SEpwbXpq?=
 =?utf-8?B?cFZvSDR1QXBybzNRRE1od041dnFRQ3U3SXdhRFpyRm44MjNuSmtabEMwUjht?=
 =?utf-8?B?eDVZK29ncEJDVnVrd1BiQ1JOSmpnaTN0QXhHSEtaK0szZVY2OWhhMjdXNnl1?=
 =?utf-8?B?SGtkVk1oL01FcDkyMGNjdDlZOE9pemJVQXhuNnBEbXpVVHA4WW1RcW5hdjU1?=
 =?utf-8?B?YUdNUFVoanIxdFNWUEJhMk01dEhhMkJqa2VjdnBMWFRvVy95N0FzWnFxb3hT?=
 =?utf-8?B?VGJKbU5OTG8rSFhGRmNrNjlmcWNaN1RrUUZqRW9HdVo5OS9icHNBamVoZTF5?=
 =?utf-8?B?bFg1OGRvL2h4cFpXQ3RWWStncFVYQk8wUUV4Q1ZpeHJlaVVhR1BzV2JyZy80?=
 =?utf-8?B?eXk3RW81bC9qL0FENkpRS0RuNE1DQkJ2YUNBNmthT0t5MGM1eG1VOS9idkNm?=
 =?utf-8?B?TCtydDZlOUNWTFZRdzJRUjNFM3lURjkyRDZOT0M1ckR5R0srNkIzZWZPT0wx?=
 =?utf-8?Q?+ZJ6ENLvLkSSpq3az+L4uMnTY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99a6df4-8a0e-4302-c65d-08dd51ea77d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 20:09:23.0429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJOZZLsfIfSxPlpK66PyUR578NQWPkVnp7ZMGBfdrqnLJ980YhrthasS/yNpl6jaOP5NCFjpbaPlGojHjaHJSqH7mVQLvOpni0RTuEV5Eg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4921
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgMjAsIDIw
MjUgMTA6NDIgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwu
Y29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGFuIENhcnBlbnRlciA8
ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPjsgQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RA
aW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL2d1YzogQ2hlY2sgcmVzcG9u
c2UgZGF0YSBvZiBDTElFTlRfU09GVF9SRVNFVCBhY3Rpb24NCj4gDQo+IE9uIDE5LjAyLjIwMjUg
MjM6MTAsIENhdml0dCwgSm9uYXRoYW4gd3JvdGU6DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBNaWNoYWwgV2FqZGVjemtvDQo+ID4gU2VudDogV2VkbmVz
ZGF5LCBGZWJydWFyeSAxOSwgMjAyNSAxMToyNyBBTQ0KPiA+IFRvOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiBDYzogV2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6
a29AaW50ZWwuY29tPjsgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPjsg
QnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQ
QVRDSF0gZHJtL3hlL2d1YzogQ2hlY2sgcmVzcG9uc2UgZGF0YSBvZiBDTElFTlRfU09GVF9SRVNF
VCBhY3Rpb24NCj4gPj4NCj4gPj4gVHJlYXQgdW5leHBlY3RlZCBub24temVybyByZXNwb25zZSBk
YXRhIGZyb20gR3VDIGFzIC1FUFJPVE8gZXJyb3IuDQo+ID4+IFRoaXMgd2lsbCBhbHNvIHByZXZl
bnQgcGFzc2luZyBwb3NpdGl2ZSB2YWx1ZSB0byBFUlJfUFRSKCkuDQo+ID4+DQo+ID4+IFJlcG9y
dGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+ID4+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50ZWwteGUvNWZkNWE0YjktODhlZS00N2Yx
LWFjM2UtMzJhMjA5NjBjNWIwQHN0YW5sZXkubW91bnRhaW4vDQo+ID4+IEZpeGVzOiAxMmY5NWY5
OTAwYzAgKCJkcm0veGUvZ3VjOiBQcmVmZXIgR1Qgb3JpZW50ZWQgbG9ncyBmb3IgR3VDIG1lc3Nh
Z2VzIikNCj4gPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRl
Y3prb0BpbnRlbC5jb20+DQo+ID4+IENjOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxp
bmFyby5vcmc+DQo+ID4+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgfCAyICsrDQo+
ID4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjLmMNCj4gPj4gaW5kZXggMTYxOWMwYTUyZGI5Li5iYjAzZGIzNjE1MTIgMTAwNjQ0DQo+ID4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gPj4gQEAgLTEyMzgsNiArMTIzOCw4IEBAIGludCB4ZV9ndWNf
c3VzcGVuZChzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4+ICANCj4gPj4gIAlyZXQgPSB4ZV9ndWNf
bW1pb19zZW5kKGd1YywgYWN0aW9uLCBBUlJBWV9TSVpFKGFjdGlvbikpOw0KPiA+PiAgCWlmIChy
ZXQpIHsNCj4gPj4gKwkJaWYgKHJldCA+IDApDQo+ID4+ICsJCQlyZXQgPSAtRVBST1RPOw0KPiA+
IA0KPiA+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHdyb25nIHdpdGggdGhpcyBjdXJyZW50IGltcGxl
bWVudGF0aW9uLCB0aG91Z2ggaXQncyBwZXJoYXBzDQo+ID4gYSBiaXQgdW5uZWNlc3NhcnkgdG8g
bmVzdCB0aGlzIGlmIHN0YXRlbWVudCBpbiB0aGUgImlmIChyZXQpIiBjaGVjay4NCj4gDQo+IHRo
ZSBpZGVhIGZvciBuZXN0ZWQgJ2lmJyB3YXMgdG8gYXZvaWQgZXh0cmEgY2hlY2sgb24gbm9ybWFs
IGZsb3csIHNpbmNlDQo+IGl0IHdpbGwgYmUgdmVyeSB1bmxpa2VseSB0aGF0IHJldHVybiB2YWx1
ZSB3aWxsIG5vbi16ZXJvLg0KPiANCj4gd2l0aCB5b3VyIGFwcHJvYWNoIGJlbG93IHdlIHdpbGwg
YmUgYWx3YXlzIGRvaW5nIGNvbXBhcmlzb24gdHdpY2UNCj4gDQo+IGJ1dCB5ZWFoLCB0aGlzIGlz
IG5vdCBvbiBjcml0aWNhbCBwYXRoLCBzbyB3aG8gY2FyZXMuLi4NCg0KVGhvc2UgYXJlIGZhaXIg
cG9pbnRzLiAgSSB0aGluayBvdmVyYWxsLCB0aGlzIG1lYW5zIHRoZSBkZWNpc2lvbiBpcyBhIHN0
eWxpc3RpYw0KY2hvaWNlIG1vcmUgdGhhbiBhbnl0aGluZywgc28gSSdtIHN0aWxsIGdvb2Qgd2l0
aCBlaXRoZXIgYXBwcm9hY2guDQoNCj4gDQo+ID4gTWF5YmU6DQo+ID4gIiIiDQo+ID4gCXJldCA9
IHhlX2d1Y19tbWlvX3NlbmQoZ3VjLCBhY3Rpb24sIEFSUkFZX1NJWkUoYWN0aW9uKSk7DQo+ID4g
CWlmIChyZXQgPiAwKQ0KPiA+IAkJcmV0ID0gLUVQUk9UTzsNCj4gPiAJaWYgKHJldCkgew0KPiA+
IAkuLi4NCj4gPiAiIiINCj4gPiBPciwgaWYgeW91IGRvbid0IG1pbmQgdGVybmFyeSBvcGVyYXRp
b25zOg0KPiA+ICIiIg0KPiA+IAlyZXQgPSB4ZV9ndWNfbW1pb19zZW5kKGd1YywgYWN0aW9uLCBB
UlJBWV9TSVpFKGFjdGlvbikpOw0KPiA+IAlyZXQgPSByZXQgPiAwID8gLUVQUk9UTyA6IHJldDsN
Cj4gPiAJaWYgKHJldCkgew0KPiA+IAkuLi4NCj4gPiAiIiINCj4gDQo+IGFjdHVhbGx5IGFib3Zl
IHBhdHRlcm4gd291bGQgYmUgdXNlZnVsIGlmIG1vdmUgb3V0IHRoZSBzZW5kaW5nIG9mDQo+IFNP
RlRfUkVTRVQgdG8gc2VwYXJhdGUgaGVscGVyIHRoYXQgaGFuZGxlcyB1bmV4cGVjdGVkIHJlcGxp
ZXMgaW4gcGxhY2UNCj4gYW5kIGFsd2F5cyByZXR1cm5zIG9ubHkgMCBvciAtdmUgZXJyb3IgY29k
ZToNCj4gDQo+IGludCBndWNfc2VuZF9zb2Z0X3Jlc2V0KGd1YykNCj4gew0KPiAJdTMyIGFjdGlv
bltdID0gey4ufQ0KPiAJaW50IHJldDsNCj4gDQo+IAlyZXQgPSB4ZV9ndWNfbW1pb19zZW5kKGd1
YywgYWN0aW9uLCBBUlJBWV9TSVpFKGFjdGlvbikpOw0KPiAgCXJldHVybiA9IHJldCA+IDAgPyAt
RVBST1RPIDogcmV0Ow0KPiB9DQo+IA0KPiBhbmQgdGhpcyBpcyB3aGF0IEknbSB1c3VhbGx5IGRv
aW5nLCBzZWUgZ3VjX2FjdGlvbl92Zl9jb250cm9sX2NtZCgpDQoNCkdpdmVuIHRoYXQsIGN1cnJl
bnRseSwgYWxsIGJ1dCBvbmUgdXNlcyBvZiB4ZV9ndWNfbW1pb19zZW5kIGhhdmUgdGhpcyBjaGVj
ayBpbg0KcGxhY2UgdG8gc29tZSBleHRlbnQsIHdlIG1heSB3YW50IHRvIGdlbmVyYWxpemUgdGhp
cyBmdW5jdGlvbiBhIGJpdCBpZiB3ZSB0YWtlDQp0aGlzIHJvdXRlLiAgVGhhdCB3YXksIHdlIGNh
biBzdWl0YWJseSByZXBsYWNlIHhlX2d1Y19tbWlvX3NlbmQgaW4gdGhlIGxvY2F0aW9ucw0Kd2hl
cmUgd2UgZG9uJ3QgZXhwZWN0IGEgcmVwbHk6DQoiIiINCmludCB4ZV9ndWNfbW1pb19zZW5kX25v
cmVwbHkoc3RydWN0IHhlX2d1dCAqZ3VjLCBjb25zdCB1MzIgKnJlcXVlc3QsIHUzMiBsZW4pDQp7
DQogICAgICAgIGludCByZXQgPSB4ZV9ndWNfbW1pb19zZW5kKGd1YywgcmVxdWVzdCwgbGVuKTsN
CiAgICAgICAgcmV0dXJuIHJldCA+IDAgPyAtRVBST1RPIDogcmV0Ow0KfQ0KIiIiDQoNCj4gDQo+
ID4gDQo+ID4gQWx0ZXJuYXRpdmVseSwgZ2l2ZW4gd2UgZG8gc29tZXRoaW5nIHNpbWlsYXIgZXZl
cnl3aGVyZSB3ZSBjYWxsDQo+ID4geGVfZ3VjX21taW9fc2VuZCAoZXhjZXB0IGZvciBpbiB4ZV9n
dWNfaHdjb25maWcuYyksIHdlIG1pZ2h0DQo+ID4gd2FudCB0byBjb25zaWRlciBtb2RpZnlpbmcg
dGhlIGZ1bmN0aW9uIHRvIHBlcmZvcm0gdGhpcyAtRVBST1RPDQo+ID4gc3RlcCBhdXRvbWF0aWNh
bGx5Og0KPiA+ICIiIg0KPiA+IGludCB4ZV9ndWNfbW1pb19zZW5kKHN0cnVjdCB4ZV9ndWMgKmd1
YywgY29uc3QgdTMyICpyZXF1ZXN0LCB1MzIgbGVuKQ0KPiA+IHsNCj4gPiAgICAgICAgIGludCBy
ZXQgPSB4ZV9ndWNfbW1pb19zZW5kX3JlY3YoZ3VjLCByZXF1ZXN0LCBsZW4sIE5VTEwpOw0KPiA+
ICAgICAgICAgcmV0dXJuIHJldCA+IDAgPyAtRVBST1RPIDogcmV0Ow0KPiA+IH0NCj4gDQo+IG5v
LCBhcyB4ZV9ndWNfbW1pb19zZW5kKCkgc2hhbGwgcmVtYWluIGFzIGdlbmVyaWMgcHVycG9zZSBm
dW5jdGlvbiBzaW5jZQ0KPiBHdUMgQUJJIGRvZXMgbm90IHByZXZlbnQgYWN0aW9ucyB0byByZXR1
cm4gZGF0YSBqdXN0IGluIERBVEEwIGZpZWxkLg0KPiANCj4gYW5kIElJUkMgdGhlIFhFX0dVQ19B
Q1RJT05fQUxMT0NBVEVfRE9PUkJFTEwsIHdoaWNoIGlzIHVudXNlZCBpbiB4ZSB5ZXQsDQo+ICBp
cyBvbmUgZXhhbXBsZSBvZiBzdWNoIGFjdGlvbi4NCg0KSSB0aGluayBpZiB3ZSBhcmUgZXhwZWN0
aW5nIERBVEEwIHRvIGhhdmUgYSBub24temVybyB2YWx1ZSwgd2UgY291bGQgc3RpbGwgdXNlDQp4
ZV9ndWNfbW1pb19zZW5kX3JlY3YgdG8gYWNxdWlyZSBpdC4gIEhvd2V2ZXIsIEkgd29uJ3QgY29u
dGVzdCB0aGUgYXNzZXJ0aW9uDQp0aGF0IHhlX2d1Y19tbWlvX3NlbmQgbmVlZHMgdG8gcmVtYWlu
IHVubW9kaWZpZWQuDQoNCj4gDQo+ID4gLi4uDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19od2NvbmZpZy5jDQo+ID4gc3RhdGljIGludCBzZW5kX2dldF9od2NvbmZpZyhzdHJ1
Y3QgeGVfZ3VjICpndWMsIHU2NCBnZ3R0X2FkZHIsIHUzMiBzaXplKQ0KPiA+IHsNCj4gPiAgICAg
ICAgIHUzMiBhY3Rpb25bXSA9IHsNCj4gPiAgICAgICAgICAgICAgICAgWEVfR1VDX0FDVElPTl9H
RVRfSFdDT05GSUcsDQo+ID4gICAgICAgICAgICAgICAgIGxvd2VyXzMyX2JpdHMoZ2d0dF9hZGRy
KSwNCj4gPiAgICAgICAgICAgICAgICAgdXBwZXJfMzJfYml0cyhnZ3R0X2FkZHIpLA0KPiA+ICAg
ICAgICAgICAgICAgICBzaXplLA0KPiA+ICAgICAgICAgfTsNCj4gPiAgICAgICAgIA0KPiA+ICAg
ICAgICAgcmV0dXJuIHhlX2d1Y19tbWlvX3NlbmRfcmVjdihndWMsIGFjdGlvbiwgQVJSQVlfU0la
RShhY3Rpb24pLCBOVUxMKTsNCj4gPiB9DQo+ID4gIiIiDQo+ID4gVGhlc2UgYXJlbid0IG5lY2Vz
c2FyeSBjaGFuZ2VzLCBieSB0aGUgd2F5LiAgVGhleSdyZSBwZXJoYXBzIG5pY2UtdG8taGF2ZXMs
DQo+ID4gYnV0IEkgd29uJ3QgYmxvY2sgb24gaXQ6DQo+ID4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFu
IENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCg0KTXkgUmV2aWV3ZWQtYnkgc3Rp
bGwgc3RhbmRzLg0KLUpvbmF0aGFuIENhdml0dA0KDQo+ID4gLUpvbmF0aGFuIENhdml0dA0KPiA+
IA0KPiA+PiAgCQl4ZV9ndF9lcnIoZ3QsICJHdUMgc3VzcGVuZCBmYWlsZWQ6ICVwZVxuIiwgRVJS
X1BUUihyZXQpKTsNCj4gPj4gIAkJcmV0dXJuIHJldDsNCj4gPj4gIAl9DQo+ID4+IC0tIA0KPiA+
PiAyLjQ3LjENCj4gPj4NCj4gPj4NCj4gDQo+IA0K
