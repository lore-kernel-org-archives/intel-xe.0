Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA508CAC59B
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 20:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7435810E178;
	Tue, 16 Sep 2025 20:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqXI0JkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA910E178
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 20:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758053024; x=1789589024;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G1ga2iL0YuotJJfNBHFZvttkxJsSA7ieLwg4qiUTLWk=;
 b=QqXI0JkZJZS64OkEJMTAY0ZdA9xKpGL6X1Dk7jRH/mqB/xIWAhc0gbUM
 KJ/nCLttR8S3lucoSukRfAciV1poW4+Ucjyq7LUKeIibx7ccth1VktkR4
 2UBIboMCWQZc2ROE4rv7JYfhdIOtQ2K6DNSmsDTP0t1qF0hiDjFnLQVVf
 YbFa2rxD/hEHRUMwQRuO+FDmCSajWGQoLgle8MwB7rWD5Cy4DR+OQcBAu
 h6P/q7FI+xqZCHap+GF8yDvIeJVAHQhrJ8FwbJNfBH3Sgb92KwPPh0C3W
 YTgj3HK3iTBMsaYyxhx7HujeQUcFqVFlJFTCThdX40c0MBID+O7lFelyY Q==;
X-CSE-ConnectionGUID: yyn6FgN4S4uWWzlZA9KMvg==
X-CSE-MsgGUID: zBvvmzglTFi3VJOxEYbQ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70971463"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="70971463"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:03:43 -0700
X-CSE-ConnectionGUID: PtP9FLJ0TK+wrzX9ROGBnA==
X-CSE-MsgGUID: eSzV5GN+Te+q47qqDeXM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174850072"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:03:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:03:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 13:03:42 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEWaYZtgxKu2h+8TjpgUIYqPtffV3aQBiZRZE/ZwOTaGxiajWLqRQ/UEWctbQ4MpdOQHG99R/yGOc2HNmLvzcBRnHpAkuEL62jQlXPAHzW6F70iTNfxzB6wPbMlrAbw5FXph0IhxoR5Kk6i5vXpIyN+uyiREibhzJSV2ev+H+5Z5iRaOmNJq/7TG6vaFrtKYGyUu4GkX7i6Y+UAGbsi8GgSQAs10cy76T1WRAFTlyAyl3aREqkII4sC7NdkaECoUnMGOT5KDGtrxYj9ASsKfR0zDiGTIckYHekxgjbGkjM9zGwJTVZJ3SuMusVhphIpFsYLXtgLWjoc+JBT+7FF8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es37c3CHNTaXi8rkqdzSk94iZPOREsDhNaUf+7agrHU=;
 b=cCMhEJ3KBwIR0k9Kmh7OKkxq/uqXDAh5Vi9INZBSfabDQRdxsZ4JrnWlp4koSEjygCBddemyTgIg31cmKhK4auhhBjy9opSFWhBJ3nKCWTpCqkIq6ijep3dJJnAuzYW7FVtDKt/IVzPZ/8ZzXnqnzfJxBkUtw1DpP+4Oehz4gsERxxoPYVWYTcp5g16VyKYvBVdWN+J6JEjBEm94dM4iS1QFFgOmX0gldFHiDQdKM5HzLgoggbJLZu79FRv62dx5+S7UE+Lq94SmHSTcZGqrPt6vrGQDTAnVraaqF2X2b3SHFm/XVGnzOXBp4TR4/0HVp8ig+ol38fzHYzouP/tFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 20:03:37 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 20:03:36 +0000
Message-ID: <f6800471-5495-4fdb-8b60-79f03b7ea39a@intel.com>
Date: Tue, 16 Sep 2025 13:03:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/guc: Refactor GuC load to use
 poll_timeout_us()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
 <20250911-xe-iopoll-v3-5-6a95f1cc3b0b@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250911-xe-iopoll-v3-5-6a95f1cc3b0b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:303:8e::16) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: e8512039-19f6-4306-f9ec-08ddf55c1f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHFkamRoamoreFkxR3hwNHJWUzlZU2JDb2R0ZTNvTkFlRkp5dWFsak1pNWR3?=
 =?utf-8?B?MERlU2NraHZGOGVINGVubVNBNktVbTIwZUtHWnJWMktETVBMd25aZkZCSXRI?=
 =?utf-8?B?T3l1WTlBU1hwaUNVbGFhd2VwSEt4UUcrNWhIVkxIWmlHNUd6M2xBYnJ0ZkNH?=
 =?utf-8?B?RVNLam9zRE8wYTAvUEY5dkxjUkxPTFFwaGx3L0ZoSDdzbXJ2ZFJrVGYwS2JW?=
 =?utf-8?B?MjBmNWxwdlpoU3BHdmhhWU8rU3RVRFhFU1pSM1VwQ3kwcE5aZDY3RGhxVkx3?=
 =?utf-8?B?NGNRVFBsRzNSNTMwcVRSVWFLMVNwaU8ybXIwU2dkVXhTdnVhODV3b1V5bFk5?=
 =?utf-8?B?VUdOQVVIUmFBU2tja2NBVlZCSGhrNWpNcFdiZWJpdS83OExqZFJ1dXFRdEp4?=
 =?utf-8?B?VFNLVUh6bTV6cWt6RjNNcGFGN09FUnZncHBlU2FuQ05wRGdwZlg5MUN4Y1ph?=
 =?utf-8?B?Q0JCTm1wN05tWWpJVWtxNmZKMWc1NjlYZ2lZQ1NncHVFZHZXZTB5RVZXTEhM?=
 =?utf-8?B?d1Y4dERWdUdBQXEwN0ZoSDZUT0pwU3hYMk1wM2RlQzY5Z2JKVlVnWFlzbTJZ?=
 =?utf-8?B?QXR2clhjVUZ1QUV4Q2d3K1F5YVZYSSttOG1jaDVGQ3VaM2hlbmRNY0x3NHVa?=
 =?utf-8?B?Y2pzMldFZmNySURyM0p0bmtsR1RLQ1RTcnpaUFMycnVEejFGQ0xFVEtzaWgv?=
 =?utf-8?B?dUl3MWtEbHd1M0EzejY5dUhsR2lTbkFlVmtROGtYbFlzNjlobkYrb25UOUJi?=
 =?utf-8?B?K1RPVElJK0pIVWlYUEFSQWF0M1gzZVpjTGtZdmU0TVdmUHhNUmZXdHE0b1Vm?=
 =?utf-8?B?YkRSY1NvbmJLdXJ0bXcvY0lYSEhkQkxUQmJoQ08wVUs1SGVOdmxETVpKcFpk?=
 =?utf-8?B?OUM1cExxWmpFVm9nUmlWdXlFMGR5OFlnanAraFpqYUFaM3BkV2p3bGFESytI?=
 =?utf-8?B?c1BWWk81Y2ptQlliRS9hK2hnQ1E2ckN1azcxcTdVS0dOc0c1R2kyTTgvRmZC?=
 =?utf-8?B?K01pYzVvL2tpMEt0SlBSbkUxSVRQVmYwcGJlRVFNdkQ4SlZhZFZ5WXVNeHZI?=
 =?utf-8?B?RmtlZU1SYzlnY09JVndhYTV2T2pES3FPN0hBY0dUTFpFYmtDRlpXRFJwOHE4?=
 =?utf-8?B?b3EvN2tsRzJUUXlZQlUvZVRFOGZNYW4xd1BOZnZuT0cvYkQyejlxVVRtRlBP?=
 =?utf-8?B?bktqMnNEbGE1Vk85QlJxdm45eG10ZDNiaFFuRjdJUzVoQVp0QTJLWDB2VTVs?=
 =?utf-8?B?UTZUcGg4YlQ3cXVIb3p2cUo4ckcwMUZVMTZTc0dpQlBxOUkyc3hoTVQ3OFA5?=
 =?utf-8?B?Z3F5cHgxM2V4LzFlL3dJV1JEeGhGVEJ0cEUyaW8wcHcxT3BLM3V1Rk8vYWtj?=
 =?utf-8?B?cGxWdUVvcUNVY1lYOXkySVRtT1FEMCsxRC9WNFAxcHdTN0NuNWNzL0lhRnI4?=
 =?utf-8?B?REZ0aGlEaVhGb3N5dUxtSFc5SkhsSWQ2MEZoMTRnSU5ZbVhaRHZXRlM0blpD?=
 =?utf-8?B?VzNibDMvSFQ0Q1BaMnlTMEJEZyt0NUlWcGNVRFRIdk9rR09BaUFTTjVTT3JP?=
 =?utf-8?B?OGF0RVpqenV3Z0RyeFZUUWNqVnpiK01ZODJVeDd0OUdvWTF1UkE3eW5kbDBx?=
 =?utf-8?B?TnUzVE5KNG81V0xtR1BlTkZ4UmhCb3dTeHJGWFA2djJvM2hPYkFLTGVLY1lR?=
 =?utf-8?B?RExoYjl4eWVoZmM3ZGNTOEhMUU5Lb2gxSnNVQ0E5T0RsS0lnVFpGV1lqb0xk?=
 =?utf-8?B?cCtLZUpuSjFMOUpyTFdMTnNnK0prWisxMElBRWwwWkg2MktCcDhYYU1UN2Vx?=
 =?utf-8?B?ZlNoeVl4L25qQkpZWjJFRW5XaG9vcDYvcHRORjh3U3dHQ3ltZExuUGFKYjVn?=
 =?utf-8?B?ZGNjUUZpUkZ0N0Vqc3NDZFpRTDZzNkllUG0rcDVIQis0Wmx6U3lMSDZQVzNL?=
 =?utf-8?Q?tbDPDtQHU94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNLTkV5bTBwVEV6STBYOEZLY2psU25GK3k3dE9MR0NFUmFYYUx4YnZSd1BJ?=
 =?utf-8?B?aVB0YlM4VkFoODZaRlU4Y3RnSjlXUlBERC81QWhXSG11cE5CTkd3dzlRMStK?=
 =?utf-8?B?K1JGWUkyUnJvbUg0Qi81cVVRMjdPbVA2K29DSWFmbldDUUU1VFRWMmJUb2l5?=
 =?utf-8?B?ZDFzZ1NUN1ZTQXZrZ0dmR0hBTFhrMit4TkJ6MGpseTJJZGJIc3ZrdmxmMEZS?=
 =?utf-8?B?WmRQU3dkNitydHpYSGpvMVowM01GSmt0eTFacDM0SG5GanFuT2RRR2xhWmpa?=
 =?utf-8?B?RnZVOXYwUjJ1bGhTelQ2d3Bjc0QrM3ZxcXYydUlsdHU4Y0FXYngxWlRidzV5?=
 =?utf-8?B?cjRsMytHenF2cjNqR2pvcUtOb2RVVVkzUDJaTDM0NjRkQWxkQVl2TlZlV3Z0?=
 =?utf-8?B?OE5xOC92dWloRmNnNGNzTHNFejJmNVllVmdqTXZSMTV0ZHNmNVhwV0I1NERn?=
 =?utf-8?B?NjJUUVBMd3JyUWlhYVAzbVR0YjNjYjl6ZnRBdWNvZGJOZkFQN28zQmlPSE9Z?=
 =?utf-8?B?RVB3VFFUeXN1S2VkbFJ0QmtKNWkxVy9ob1kwSDh5dmZGL290d25Rak54MU91?=
 =?utf-8?B?ZDBKTDdacWt6Z3UzTmovWEh0YXRoeUJKaEtwT0hXVlRvaGplalNQT1RxR1pY?=
 =?utf-8?B?Sk55RVBvUEdER3ZIbndtdllXMDlXUUFsN3dmUGlTenVVMlAyeUk5ZjdrSCt6?=
 =?utf-8?B?cDQ5Q1ZRc3hGa09iOUhKcy9RcDFpVGhNYmhOeXRML1RYeCs1dzBZOG56Y3dW?=
 =?utf-8?B?enpmcXlkUXh3ZFNpdVQxeC9rYlpDVFozN1o2YlpvT3FpRDVUcG1wSHV1UlNJ?=
 =?utf-8?B?VDc2cjB6TU9Va2tsTnBoTjFlanh4M3g3eG5QSExPR1g3b24yK2w1SE8zSnRq?=
 =?utf-8?B?d08za1FEMUtHUmUxVHFIQ2IyaXkwOEp2SjNIQzc5K2E1ZmR4ekNlYWl1NkYw?=
 =?utf-8?B?VHEwZTRSK3ViODZpSVdDRjlvRjJLVUZReXRJeURHZWpLOUVqYWpnL0czaXp0?=
 =?utf-8?B?ZXYySUYxYWZ4U1gwNWFaQzMvdjZkUFJDbmlTWXNFZGNjNjFuYUszQmRvOVh6?=
 =?utf-8?B?SWRYR1NiQ1ozaHI3Q2hQTG9ZcXJXbFU0aVJjUWtHNk5CS0VVaW5iMWxydTVI?=
 =?utf-8?B?cHljS3U2Ty9naGlBK0lORm81YUNYenNOQWRZcU9VQjR0enFSc2pLdkN0b0J2?=
 =?utf-8?B?V2dZRnd2VVMydy9KcGZqbWNvL0RiRnc5eFloSmppQ0xXa3RaaVptVXU1ejha?=
 =?utf-8?B?K1lwZDlmMnU0SER5cFEwNlFzVjVBODFrNnlaR202bTdZTCs4a1A1RXpZd2Q5?=
 =?utf-8?B?WmhuS1lPWFptaW95akU5ak9CMGV3MFlPN3RpdFdiczkreWoyb00wZ05nZnYv?=
 =?utf-8?B?bG80THBYcjJ0Uzd4QWVnT0N0SEtvREFjVCtCZUxKbmpETWRZSzd4NWxVbXRk?=
 =?utf-8?B?S29ac2M0b2crZzBSSEtTQUgyMVVjdUdCR1VrTTZ5WHlBQ3h5MnhkNjdVbXZy?=
 =?utf-8?B?cHNZelR6VVNyQUJ0OE0yY21LNG53WEpnYmE3SmpOWlFHemhWN2p0Z0Y4RGs5?=
 =?utf-8?B?K1dKcTZpZzV6TStoWklibHFpbjdKMllWR092OFhFTUJmTzdYZkFsTGRwS1po?=
 =?utf-8?B?MVlVKzJpaHdGWFVvUDY4R29hTmZ0dVZFclRFN2p0czNYaGxPMXpEOFRiMFEv?=
 =?utf-8?B?MURUd1lFbG9ncm5FU29idUFLdStmTmVyVEUyeVJHYUhCa25GenFaQnZkbnBH?=
 =?utf-8?B?VGVQWkhUdEs4YlFYdGswVnQxVi85b0ZzOVpEbmhUSXN1d2w0NXE3SFdtTU5t?=
 =?utf-8?B?a04wUUk2WVI2MzhIZE5TS2J1VmRkbVVUcTVIMmtBUkJCN0xHTmR0dDZUUUMw?=
 =?utf-8?B?eHNCY2FhOFR0Nlh1MFo1a2FoakltZlovWUt0WXhZQWMva0Z5STVsWWJ1MXo3?=
 =?utf-8?B?aDI2c2J6enFZZ1ZPOUoxMjdPb0wyQ1dkbzY2YU94MDZuWUdubmo3c0p1VHZr?=
 =?utf-8?B?SkFYSE90RXVOMjVIMVg2dGVyQXJvTnVxYWZ4QXZRWE1jSDdRQWdNOUY2eU9z?=
 =?utf-8?B?S29wT1FqUnQ3ZnlyalV5VitOdGVoUmpmRUdCSzVXRDdLd2g4VktOazc5eFd6?=
 =?utf-8?B?dU13L2NwOGxNanlNV2JWZ0h6OUFrQWs3cEpVMHdHdW5CeG9aMjBaMHhMdFhT?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8512039-19f6-4306-f9ec-08ddf55c1f05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 20:03:36.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxtdN8tMJ02WAi1I7oW9AyEf1WMuk+PbcMB7+iEdA6yHc4L9yi8ynSsE/+CrCfZuwILZCt8bpqBe+SU4o5ylJ1lYdz5shbdCP129PK2kgfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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

On 9/11/2025 10:25 AM, Lucas De Marchi wrote:
> Currently there are 2 wait loops for loading GuC: one in
> xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
> generic poll_timeout_us(), refactor the code to use that and be more
> readable.
>
> Main change in behavior is that there's no exponential wait anymore:
> that is now replaced by a 10msec retry.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2: Fix typos and leftover comment (John Harrison)
> v3: Leave the addition of print_bootrom_ukernel_err() to another commit
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 213 +++++++++++++++++++-------------------------
>   1 file changed, 93 insertions(+), 120 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index da1bb4939c6b8..389576055cc5d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_guc.h"
>   
> +#include <linux/iopoll.h>
>   #include <drm/drm_managed.h>
>   
>   #include <generated/xe_wa_oob.h>
> @@ -972,82 +973,27 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -/*
> - * Check a previously read GuC status register (GUC_STATUS) looking for
> - * known terminal states (either completion or failure) of either the
> - * microkernel status field or the boot ROM status field. Returns +1 for
> - * successful completion, -1 for failure and 0 for any intermediate state.
> - */
> -static int guc_load_done(u32 status)
> -{
> -	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
> -	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
> -
> -	switch (uk_val) {
> -	case XE_GUC_LOAD_STATUS_READY:
> -		return 1;
> -
> -	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
> -	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
> -	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
> -	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
> -	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
> -	case XE_GUC_LOAD_STATUS_DPC_ERROR:
> -	case XE_GUC_LOAD_STATUS_EXCEPTION:
> -	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> -	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
> -	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> -	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> -	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -		return -1;
> -	}
> -
> -	switch (br_val) {
> -	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> -	case XE_BOOTROM_STATUS_RSA_FAILED:
> -	case XE_BOOTROM_STATUS_PAVPC_FAILED:
> -	case XE_BOOTROM_STATUS_WOPCM_FAILED:
> -	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
> -	case XE_BOOTROM_STATUS_JUMP_FAILED:
> -	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
> -	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
> -	case XE_BOOTROM_STATUS_EXCEPTION:
> -	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -		return -1;
> -	}
> -
> -	return 0;
> -}
> -
>   /*
>    * Wait for the GuC to start up.
>    *
>    * Measurements indicate this should take no more than 20ms (assuming the GT
>    * clock is at maximum frequency). However, thermal throttling and other issues
>    * can prevent the clock hitting max and thus making the load take significantly
> - * longer. Allow up to 200ms as a safety margin for real world worst case situations.
> - *
> - * However, bugs anywhere from KMD to GuC to PCODE to fan failure in a CI farm can
> - * lead to even longer times. E.g. if the GT is clamped to minimum frequency then
> - * the load times can be in the seconds range. So the timeout is increased for debug
> - * builds to ensure that problems can be correctly analysed. For release builds, the
> - * timeout is kept short so that users don't wait forever to find out that there is a
> - * problem. In either case, if the load took longer than is reasonable even with some
> - * 'sensible' throttling, then flag a warning because something is not right.
> + * longer. Allow up to 3s as a safety margin in normal builds. For
> + * CONFIG_DRM_XE_DEBUG allow up to 10s to account for slower execution, issues
> + * in PCODE, driver, fan, etc.
>    *
> - * Note that there is a limit on how long an individual usleep_range() can wait for,
> - * hence longer waits require wrapping a shorter wait in a loop.
> - *
> - * Note that the only reason an end user should hit the shorter timeout is in case of
> - * extreme thermal throttling. And a system that is that hot during boot is probably
> - * dead anyway!
> + * Keep checking the GUC_STATUS every 10ms with a debug message every 100
> + * attempts as a "I'm slow, but alive" message. Regardless, if it takes more
> + * than 200ms, emit a warning.
>    */
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define GUC_LOAD_RETRY_LIMIT	20
> +#define GUC_LOAD_TIMEOUT_SEC	10
The old code was 20s because we did once see 11s or some such in a CI 
run. Would prefer to keep that.

With that reverted:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>   #else
> -#define GUC_LOAD_RETRY_LIMIT	3
> +#define GUC_LOAD_TIMEOUT_SEC	3
>   #endif
> -#define GUC_LOAD_TIME_WARN_MS      200
> +#define GUC_LOAD_TIME_WARN_MSEC	200
>   
>   static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
>   {
> @@ -1087,66 +1033,94 @@ static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel
>   	}
>   }
>   
> +/*
> + * Check GUC_STATUS looking for known terminal states (either completion or
> + * failure) of either the microkernel status field or the boot ROM status field.
> + *
> + * Returns 1 for successful completion, -1 for failure and 0 for any
> + * intermediate state.
> + */
> +static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
> +{
> +	u32 ukernel, bootrom;
> +
> +	*status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, *status);
> +	bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, *status);
> +
> +	switch (ukernel) {
> +	case XE_GUC_LOAD_STATUS_READY:
> +		return 1;
> +	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
> +	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
> +	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
> +	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
> +	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
> +	case XE_GUC_LOAD_STATUS_DPC_ERROR:
> +	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> +	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
> +	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> +		return -1;
> +	}
> +
> +	switch (bootrom) {
> +	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> +	case XE_BOOTROM_STATUS_RSA_FAILED:
> +	case XE_BOOTROM_STATUS_PAVPC_FAILED:
> +	case XE_BOOTROM_STATUS_WOPCM_FAILED:
> +	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
> +	case XE_BOOTROM_STATUS_JUMP_FAILED:
> +	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
> +	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
> +	case XE_BOOTROM_STATUS_EXCEPTION:
> +	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +		return -1;
> +	}
> +
> +	if (++*tries >= 100) {
> +		struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
> +
> +		*tries = 0;
> +		xe_gt_dbg(gt, "GuC load still in progress, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> +			  xe_guc_pc_get_act_freq(guc_pc),
> +			  xe_guc_pc_get_cur_freq_fw(guc_pc),
> +			  *status, ukernel, bootrom);
> +	}
> +
> +	return 0;
> +}
> +
>   static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_mmio *mmio = &gt->mmio;
>   	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
> -	ktime_t before, after, delta;
> -	int load_done;
> -	u32 status = 0;
> -	int count = 0;
> +	u32 before_freq, act_freq, cur_freq;
> +	u32 status = 0, tries = 0;
> +	ktime_t before;
>   	u64 delta_ms;
> -	u32 before_freq;
> +	int ret;
>   
>   	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>   	before = ktime_get();
> -	/*
> -	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
> -	 * It could return a thousand intermediate stages at random times. Instead, must
> -	 * manually track the total time taken and locally implement the timeout.
> -	 */
> -	do {
> -		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
> -		int ret;
>   
> -		/*
> -		 * Wait for any change (intermediate or terminal) in the status register.
> -		 * Note, the return value is a don't care. The only failure code is timeout
> -		 * but the timeouts need to be accumulated over all the intermediate partial
> -		 * timeouts rather than allowing a huge timeout each time. So basically, need
> -		 * to treat a timeout no different to a value change.
> -		 */
> -		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> -					 last_status, 1000 * 1000, &status, false);
> -		if (ret < 0)
> -			count++;
> -		after = ktime_get();
> -		delta = ktime_sub(after, before);
> -		delta_ms = ktime_to_ms(delta);
> -
> -		load_done = guc_load_done(status);
> -		if (load_done != 0)
> -			break;
> +	ret = poll_timeout_us(ret = guc_load_done(gt, &status, &tries), ret,
> +			      10 * USEC_PER_MSEC,
> +			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>   
> -		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
> -			break;
> -
> -		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> -			  count, xe_guc_pc_get_act_freq(guc_pc),
> -			  xe_guc_pc_get_cur_freq_fw(guc_pc), status,
> -			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
> -	} while (1);
> +	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
> +	act_freq = xe_guc_pc_get_act_freq(guc_pc);
> +	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>   
> -	if (load_done != 1) {
> +	if (ret) {
>   		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>   		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>   
> -		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
> -			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
> -		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +		xe_gt_err(gt, "GuC load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
> +			  status, delta_ms, act_freq, cur_freq);
> +		xe_gt_err(gt, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>   			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>   			  bootrom, ukernel,
>   			  REG_FIELD_GET(GS_MIA_MASK, status),
> @@ -1154,16 +1128,15 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   
>   		print_bootrom_ukernel_err(gt, bootrom, ukernel);
>   		xe_device_declare_wedged(gt_to_xe(gt));
> -	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
> -		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
> -			   delta_ms, status, count);
> -		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			   xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
> -			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
> +	} else if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
> +		xe_gt_warn(gt, "GuC load: excessive init time: %lldms! [status = 0x%08X]\n",
> +			   delta_ms, status);
> +		xe_gt_warn(gt, "GuC load: excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			   act_freq, cur_freq, before_freq,
> +			   xe_gt_throttle_get_limit_reasons(gt));
>   	} else {
> -		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
> -			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
> -			  before_freq, status, count);
> +		xe_gt_dbg(gt, "GuC load: init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X\n",
> +			  delta_ms, act_freq, cur_freq, before_freq, status);
>   	}
>   }
>   
>

