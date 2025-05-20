Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0FC54756
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 08:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C281410E56F;
	Tue, 20 May 2025 08:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIgh2ciT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4C810E550
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 08:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747728843; x=1779264843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ad4UBlR7LqkoC21THBZLZ8+B2em9eCgIK6aWDbtvTSg=;
 b=YIgh2ciT5eu0JcgmaWzACDhaZNWE1gDoQh5Ot+cMZthpOMaLPcOD3BAU
 o2HWnb6dzxAkatOfsNE29BDvbEuezYg7aK/Rkbd8puS8yZySmYrkE0ljT
 6CN7YZRJbRQ1cTujHy3Z/I2Y/031TBrKShXabnY8tN4lL8rzJUZt19QmW
 wOouH893cbrT9VYwbZ6JrRbDjrNcXs2x5jsvy+nmw5JC3mb1+QETTNQxM
 eA/p+rvyyA5+8cKffCeFamVdt8jEYe4NUuJuA4MvcxZV/dZmnWpATp7VP
 nYLixqE1fiDk/6TdiCVhFNsDKWyXu2MS9EyYW0QKlhM4F82Lf9cHILuEf w==;
X-CSE-ConnectionGUID: VBZXOPEsTPy3KytRUO47rg==
X-CSE-MsgGUID: C/XR/k3HSCqtYqhQeYE7Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60992789"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60992789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:14:03 -0700
X-CSE-ConnectionGUID: 8aOF4NZXSp6mvwIYvL2OjA==
X-CSE-MsgGUID: FRdnEjVDQaGRly6iN5tKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139504493"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 01:14:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 01:14:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 01:14:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 01:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1CaxD0/yye5RVnGxV3ofHUBSwQ/M0Anli5tu9Ox1NhwQ4lo9D9Twn2vXSf45KwSR9T620lIZiBQVC1cDKfNRLZVOLo9lNbXV0Z9y6Cu2xesa1jvS16yAE5ZsAO6x9xlbvUjOQBSLrKdhwUV6kBkCYwirUxfW02bX1BMHqM44uI0YrgRsIZjRFkyOhpsFxIIeT7HvPTPXcqg3LOk3Lr0AaZ7HhnAgWMubtVkZDEMI7B5HeJcptwkcbpOP3sCs90IkjvBs1VMuK178+FnmgRyYPuY6US3NKQBhUHOR9ddljGio1FtTY7Je+eiVCRLxixBoQE6u9QNThYMOTv7oq4xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg4PvC9n5ZJUo/d04wFXKqHyoe2IcH01PDZ/PmQI7Co=;
 b=HqDAfmsSpKqcgxoR5uAY+iKedn2n8iUwK9XcB9CuypcCxho+1AhgNmWiod75c/C54Z8dlKMABVYKEonMbKjdgU6WaXIv+/kiH1z45FVQyhBHDQVih41HzVypQ3Ul+GmbSIWUSUQCnGPDiNz+Iavu2n3R+l5hCMTGJtWyXm5lmOnaKN6PRD+UrgWIxJ+BFYCNxsCjFHPSrrui2Cvim19vykEAybIM6dZQ0U5Kl7uVvFpWXSh1X/y+m4Ln/mWv2jy/eBmsr+bs3SpOOVLv7a1ucw0f3RGlRfFuvUdeLHtZJ5m+4UmTy6Smab9oq4oXlo29wpMTiPA0T9nTotyqemwLLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:13:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 08:13:18 +0000
Message-ID: <c1072eb7-6909-418b-b30c-aa1418978362@intel.com>
Date: Tue, 20 May 2025 13:43:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <dfa4302fee599374c8bffee9e9ce8dcb1598a23d.camel@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <dfa4302fee599374c8bffee9e9ce8dcb1598a23d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::30) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: c7389158-1566-4664-8b00-08dd97762d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0MxY3Q1THBzRHdKaE9XMjNvSVhIT2hjdHlHVGhkK0dVUDMwREN6cDQ1Ym01?=
 =?utf-8?B?QTdvRWF4ZnFiMTlCNWU2N1NFTGFkVGRiYlgzbGo3ak1VQ000bkg0Q2s4U2Uz?=
 =?utf-8?B?RGREa1lPbTRoclFSWmtvemFBeHppcEp2RmxzVDhJaUJVNUV3YjZFM0ZEajZY?=
 =?utf-8?B?d0pIQjQzMXJqMitPSFdqQjE5bm53dWluZ0gvMXBuMjEwZkFJbGF0U0RDSUdv?=
 =?utf-8?B?R3p2MnN2RHRacUNJblpMejJ5bTRTUGl3SUNXZnNxalJMeXo1TUJsN3M3aE1x?=
 =?utf-8?B?RmRUNms4ZGkrQ1RsN0ZLOTBzdWNTNGVMWCttSEpiNFVkVU82ZUZsTEtMTjh6?=
 =?utf-8?B?ZUQxMVdDK3ZGNlJvckFUb3pvRTAvcGVuVDFFa04zUnpkYWUvNWE0ZDNQN1Iz?=
 =?utf-8?B?NkJTRmN5dFp4SVRvU0dnWkk1dzFrUTV2NFpuTVBBdisxYXVrWFg5Y1RGVDVt?=
 =?utf-8?B?a0dqdGVFb0JuK0NnV1FnUXgxcGRQK09uYkFJeW9WcGVIOFcvdVpsZm0xamo2?=
 =?utf-8?B?em1mMFhwNUFYeXNCTkNSME5SWTNwdUN3WTFKektMS1hqR1pyVDEweDRJczIz?=
 =?utf-8?B?cktWS2RXZTIwYmpPK0RmOE93cEpQL2NJSldlbDU0ckVsNk55R0U4ZmMvUTcr?=
 =?utf-8?B?QkpGMS93QS9BSUN2SjlCajZXSlhYV2V5WjNtZkl4cGcxcnFzTlhpanN4STEx?=
 =?utf-8?B?MWhSUmwwN3RxT0Q0TW1RckR2eVU0K1Aycllpd04raWlYYjFjQVNoQUhYNWtn?=
 =?utf-8?B?Zm1qMTdBU0ZPaWFEbmJiczVMZWowTis4MEdVZXM2YXM4Vk1tMjBjSnB1YnFz?=
 =?utf-8?B?T0d5VHhkcHJzOXpnR1V2QnYvLzh3dEE3dVhaUzN5RUZHcEE5V1VaaTRUMGVn?=
 =?utf-8?B?cmNGaXVGYWU2NkY4TjFwKzJvcGRWc21ML3o4TC9pcDRUN3dIK3VoUjBCZHVn?=
 =?utf-8?B?eGRENkw3V05oSHN4N2dtNGFKNHlxTXNyNkhMUkNMSk9oRGNGb3VqdzJrVEh5?=
 =?utf-8?B?UVV5ZE01Zng5RDZTVk1DcUljU0lMOXM4WkM1U29FMk8xTmVpb25yQkxQdW1T?=
 =?utf-8?B?RktDck83OW9QYUdtUXNFTVA0NnliaEorbDdsZGR2OHJZcFBYV3AwL1dYQlVB?=
 =?utf-8?B?Sm41ZndZRE5oRHYzVXZobFFLU3hRNFlvT0d0bzhpWXFtMVZSQjZJYUFzZnk4?=
 =?utf-8?B?UUdBSmRZN0ZxeW10d1o4ZEhZT2ZRK1JMdXBxTHFLY2NSY2dGZHByT0w2akM3?=
 =?utf-8?B?c25Nc3ZvKy9EZGQybFZOTThjQ0I5a2p0anRzSmh3ZjRKUUpVZkVjSzNmelpS?=
 =?utf-8?B?RHpDNHdkd1o3cGlOSzZYcElEMjk4a3lyWWRqUVdyemlrcDJQWFc2TE56Q2tT?=
 =?utf-8?B?ZC9YeVlId2plWnN4MWxoMGxnOEJ4ME40UHJxM1hoOHIzZUsyZHREa1NJeDcy?=
 =?utf-8?B?R3ErcDNLWXhjU3pWN2xlSFRGZVFRc0RiNWd2Q2tnQ1RRWmowQm44N2tOSzIx?=
 =?utf-8?B?S1NWWUNtdVoyNUZodE51ZjNvZEpFdTA3U3g2R0g1V05Da3h4R2ZFV01LSmZL?=
 =?utf-8?B?M09pSHozbDIzWWhFMkhkMlFVYzZWQk1ENHlNN2pWUmdHenJsMmNyT0g1UmY0?=
 =?utf-8?B?MFlZaWJ0RGhYcUs3MkVGYVNZc1NRdi9iMmlvaEp5NzJ3WmY3TGVMMmlZa2hG?=
 =?utf-8?B?NEQvUXVqOHoyeW5ib1g3RTk4YnRGTWNJemdySkNsWTYwbU1IZWk3QUdOSGtU?=
 =?utf-8?B?V3NsT3FGczlYV2JFdzI1d296K1crVTR2S0dZSHlSanhrK1p0amJMTHp3eElS?=
 =?utf-8?B?NkdxL1owL1ZudE93akl5MFJNTHBMTUtDNjNBdTZ6Y1FNYUJCVUZaNkNCMXhm?=
 =?utf-8?B?NWMyalZzTlh3U0Jyc2pHcDJJdkt6b0ljUnZVU2lBVCtCeVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S29pNEljdFN5dlIrdi9rTzN3TlJRWHpPM0U5bmQxR3U1OGRhV0c5M2dOcURC?=
 =?utf-8?B?Z3lHZFVmZHhoSC9tdUFlOGp1bUhJWkFUNUYrNUJxV2IwQmRRWnY5YzJzM3lY?=
 =?utf-8?B?VUpYYkFWWGZNWC9nWTRsMEx5eVJweGdsU2lReVd2MDM3WUY3YnA0NHRoVDNH?=
 =?utf-8?B?OE1JSEZKVllWS3dKR1Z5TEJLQmtEdzJ1QUY3U3NsamJmYTFqVDJ1dkFsWTBL?=
 =?utf-8?B?MG11MGtLL2x2dUMzNnBvcWsrRXVLd0ZobXhjdksyODFLZWpwR2dZUXVlOEs0?=
 =?utf-8?B?Nm5JN1dSVExwbzlUTG8yRnl5YWhvYUdPZWI3NEFtM05ubnNKcnhpSlVvN0Ez?=
 =?utf-8?B?QXNQdXVqaXdrWWZzSGNiR0YrZHhseU05SDFwWVEyRmV6VU1PWVA0aEprcm9Q?=
 =?utf-8?B?d1VZSklZV1VqREFMUXJSRmgzdmVSSzFzeTJuUG40SHRBQXRQaWlHa2VrY2ZD?=
 =?utf-8?B?L1VUT0FrY0pjZjBzdWFJTFdmM21BN2tDVjV1R3BVMzVtMDloVjNNWjhtRVJi?=
 =?utf-8?B?WStxLzVDaitEbHNtYklZdkVQam01aXJQK05EbGRKSlpTTXc5SUdQcWVtZ2lD?=
 =?utf-8?B?WTQ2SVJIRDRsbm9JanFMdklOUUFDcWxVVjB2VHpIWnBDTmxTditXMjJtQUhH?=
 =?utf-8?B?Unlld3pHV1JtT0pFWUgvOHd4d2NBaEh4dS9kTWhadWMvM1dkTUI2ejVNTkN5?=
 =?utf-8?B?aitMb3NiNU56UXEyNmN2YmRsK3A2SXloZWM5a3BCUWhtL0k4VktYWFY0a285?=
 =?utf-8?B?ZTlYOTB0TVhYUi9rQ2UwTS9MRGZqdVBvd2NqZSsrZUh6TVpiNTZDSmIzMTRJ?=
 =?utf-8?B?KzVEVmVtZGFleVptSUlxVzRSUjExcTUxa0d2aENFUldEbG01Zm5LNDIxc3dE?=
 =?utf-8?B?V09XTGtRNUlXYWpZSTd3Wmo0UkcyV3g2bW9ocXdPdGZsUHI0NzhFSy9KTVlp?=
 =?utf-8?B?NDhZVUlYNnNIWmQxblo1UDNYZTNoZHZTaWFDbU1ZL1loVWNnUHJUMzBUaUdO?=
 =?utf-8?B?THZrVGVZZ293RkxJQVE5VVVzL2cwdnRoUGxUeDZIL3IrOGh3RnVhcnQrYW9s?=
 =?utf-8?B?UnphOXBQRGoxQ2hzdzVLbEZFTTNQOXdsejl1U3dEUXMxb0hwb2ZUN1dwbTVU?=
 =?utf-8?B?SUM2SkdCWmRreHdOb0xhUHVIVTNDSnJIeE9kYnFIcjlCVUNjODJwcy9HOUt6?=
 =?utf-8?B?UXI5NVl5SHkzVGxRNDNYTG5sVUN0M1F4Y0R5TndrMWNiVXlQeUxjNHgyWGpp?=
 =?utf-8?B?cGl3OFdSdXBBY3FOWHhCejlGeU1Da0Y2UzdvYURiVytHa21STTRIUnpIVWM0?=
 =?utf-8?B?YXBmeHo0OW5uSmtIK01PTFdPMFVzZmZqWnZhMkJrblJjVmR5UG5semcyVkZr?=
 =?utf-8?B?d2lCTFhnWVZYN2VnUFRZdEs1bjBPZUtmUFlaM0Fkd3A4enB1QVNaVTFEV0FK?=
 =?utf-8?B?WEpTV2hBUlNJZXRBOS9MV3NQaElhSzBjdmQ0aVJ2TVBZdXlJV3JkaXNFQ1pp?=
 =?utf-8?B?ekpGVzlFaE9YRGQ2Uk5kRXgyN0RNWHJCbG1XU2dGQWtMeldIOVZBdFQxNVUw?=
 =?utf-8?B?aHZlN20wWEVCVUh2cXUxbFJFV1JoT3EyTDErbWN3S3hBZldaallKMXJjNUpm?=
 =?utf-8?B?NDRaSHdzdktMTncrbDRlMFNtK2ZuVVFTZVI1OElldHFrZVRJTjVsVExtQ2N5?=
 =?utf-8?B?dmNJeDBSeDAwQzgrY1F0MDFCRDQwa01Rd21oR3Y0WFp3SmpYdDVrcEEyOXM1?=
 =?utf-8?B?dHVsZ2xIVng1emQzTWl2UjJMMXRidTRjekxKWTRpRHlwYndQZE0xdXRrUDlG?=
 =?utf-8?B?Um1BcXhXa2daRXM3UHpGcU0wN01ZWFp1S3ZWTHFiNnFHcGNXTm9CTnZwM2M3?=
 =?utf-8?B?Ui9qVitQRHN4UEQ2eW00Mm42V2RqVjNqY0crTndSL25zeEZPS2Y2S0V5bmxY?=
 =?utf-8?B?TDlBbEdBQVJTS2I2Z05WUXJCKzBEMHVUSzl3OEpjdXNwQ0VFYzZsS25kRXVK?=
 =?utf-8?B?c2ViK0h1TkdrUVN3R0ZYbFE2TUU5eVVqbmhDMXdiQ0JWMzZaSGtwYk8xcFVR?=
 =?utf-8?B?UVBsSC9PeDhhQks4dG1NeFlvcHJiMHhQWmpyWHZCTjFnNXpheGQzVFp6MzVZ?=
 =?utf-8?B?YXdlV2txT29rVWpTSE81QytJQ3hId2puWmtKc2xGTVlZMmZjeldVcmRWMFBp?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7389158-1566-4664-8b00-08dd97762d5e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:13:18.2948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeQKnq5R47feXfx/XaXvnSu+s2bP5no4kDCbR9w+GCGQKFDS2xBAiUYCk+spiMNGXPSQUwipLStZLV0XUCMo5aMsmTaCYrCWhVKuQcJhuuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
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



On 02-05-2025 19:30, Thomas Hellström wrote:
> On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
>> This commit introduces a new madvise interface to support
>> driver-specific ioctl operations. The madvise interface allows for
>> more
>> efficient memory management by providing hints to the driver about
>> the
>> expected memory usage and pte update policy for gpuvma.
>>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 97
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 97 insertions(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 9c08738c3b91..aaf515df3a83 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -81,6 +81,7 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_EXEC
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>> + *  - &DRM_IOCTL_XE_MADVISE
>>    */
>>   
>>   /*
>> @@ -102,6 +103,7 @@ extern "C" {
>>   #define DRM_XE_EXEC			0x09
>>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>>   #define DRM_XE_OBSERVATION		0x0b
>> +#define DRM_XE_MADVISE			0x0c
>>   
>>   /* Must be kept compact -- no holes */
>>   
>> @@ -117,6 +119,7 @@ extern "C" {
>>   #define
>> DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>   #define
>> DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,structdrm_xe_wait_user_fence)
>>   #define
>> DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
>> +#define
>> DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
>>   
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
>>   	__u64 sampling_rates[];
>>   };
>>   
>> +struct drm_xe_madvise_ops {
> 
> Suggest using extensions also for the ops, like for vm_bind, since we
> might come up with complicated ops in the future that don't fit the
> union + resvd below.

Sure

> 
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> 
> Is UMD currently really using and exercising PREFERRED_LOC? If not, I
> suggest removing this op and invent a reasonable default behaviour
> until multi-device is in place.
> 
>> +#define DRM_XE_VMA_ATTR_ATOMIC		1
>> +#define DRM_XE_VMA_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
>> +	/** @type: type of attribute */
>> +	__u32 type;
>> +
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>> +
>> +	union {
>> +		struct {
>> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
>> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
>> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
>> +#define DRM_XE_VMA_ATOMIC_CPU		3
>> +		/** @val: value of atomic operation*/
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} atomic;
>> +
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> 
> I think the purged state, at least on i915 was only known to the KMD
> (so shouldn't really be visible in this header). Also we should
> probably define the semantics here if
> 
> a) There are multiple gpu vms with conflicting purgeable state.

If even one VM says it still needs the buffer WILLNEED, we play it safe 
and keep it around.

> b) What happens if we call dontneed and the bo is deeply pipelined?

return -Ebusy ?

> c) What if a willneed madvise fails due to the bo being purged? And
> that op is embedded in an array of unrelated ops? Should it really fail
> the whole IOCTL?

Either drop array of op handling in ioctl or return status for each op ?
I am not sure what is better here.


> 
>> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
>> */
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} purge_state_val;
>> +
>> +		struct {
>> +			/** @pat_index */
>> +			__u32 val;
>> +
>> +			/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} pat_index;
>> +
>> +		/** @preferred_mem_loc: preferred memory location */
>> +		struct {
>> +			__u32 devmem_fd;
>> +
>> +#define MIGRATE_ALL_PAGES 0
>> +#define MIGRATE_ONLY_SYSTEM_PAGES 1
>> +			__u32 migration_policy;
>> +		} preferred_mem_loc;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>> +/**
>> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
>> + *
>> + * Set memory attributes to a virtual address range
>> + */
>> +struct drm_xe_madvise {
>> +	/** @extensions: Pointer to the first extension struct, if
>> any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +	/** @num_ops: number of madvises in ioctl */
>> +	__u32 num_ops;
> 
> Should we really support an array of ops here given the experience we
> had with rollbacks on VM_bind? Also WRT this, also please see the
> purgeable state above.
> 
> 
> 
> 
>> +
>> +	union {
>> +		/** @ops: used if num_ops == 1 */
>> +		struct drm_xe_madvise_ops ops;
>> +
>> +		/**
>> +		 * @vector_of_ops: userptr to array of struct
>> +		 * drm_xe_vm_madvise_op if num_ops > 1
>> +		 */
>> +		__u64 vector_of_ops;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
> 
> /Thomas
> 

