Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCEAC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 10:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B0910E047;
	Wed,  4 Jun 2025 10:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTWLKB2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF5910E047
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 10:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749032260; x=1780568260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lBMNtgR5qfqcTlR3vw+kXw5UzDshmnYPs88qSfQzpvk=;
 b=NTWLKB2j83o2Jg6FZAm969lqdcDMVsCEc/hoTTo68lNFm/LvW40oL3wa
 Ji6ryrxha7SEkFAX5qDlBEeLbukSXzp/O0P/zmV0nB8fi6YiowDpnsAaz
 hszPQLGSoSClxBFW46mIErnMszv1Fn7kJPAubtIhrfuvTR7cntp4uOllX
 AwyEgCN0FDI89wueKUmC+EFkoTMGQZ/hMzyMY5XTRgEK6BVySauwC7+1j
 JVIxbBPAsXPVuYSFgC7HUEIW1XjWwNvfvxHXRPKrzK5REj0kMn+41Wkxw
 3nzqqz99L7UBzpfwMtFjCvEk3/JRJHBDfArbmPkGfD6J8NhnRAH4hgJGm A==;
X-CSE-ConnectionGUID: J+3tdvTVTTG3dVIct/pNHA==
X-CSE-MsgGUID: d116YcAGRJ2mypZtBrV0nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50968259"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50968259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:17:39 -0700
X-CSE-ConnectionGUID: Thix9F9STLKul+dOfX/+8g==
X-CSE-MsgGUID: wP0PxZVvQROjNgLLEKW4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="176013740"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:17:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 03:17:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 03:17:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 03:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0K5O1JNNTAK0j7TR8oHbRTB4Biyt7PtNqUcYAHNhIZIj64827HzjId+/GfQQHNhg3Op9EyMA9xt4VcPVmDreXyDxFqL131B/O/dAbpce8waUyfSgk3zXLNvhbGcxf/GCqklas2YD/msUn5vw0EvxXsHkR3PtRm6s9opYPHyfM8dTCTfvFiKOnRw2skoE0Bt2ra7rPbNa289Sbdk0gADd5COH4+Cb+TGRQWp+6I8bCwEfF8QP7KaUMfAjgdD/8L37Yx6EiuNpNNv0DK5ORw5Hvp6PBxNiWWghF6WIj+tsUUuyFIC5MX7NUE4rc73KSmDFqC31zIvxyTHT1XmnrOAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBMNtgR5qfqcTlR3vw+kXw5UzDshmnYPs88qSfQzpvk=;
 b=M5zVDN7/B99oEYFhn0TGryLrOk2HIlNmXvE89pMixa6Ftt7jxGk1JBowvz5RZB/0nQqH5QFLebsuKij8+C2KONm1nS+R2/qz1Mluj4ZofKlQlc6h52dZLiCDndtAWwIK61U5BnEJMh3+RHk4am5pFthml00kYZQ62806aZIMbYxm8TScTlmF2hP8aCu8IeipyGiPZo+KNhU/n4LCI6nLE829gCVA7mT9hWwxQSsv7iGfEfILEgGGr2r9njgyGs3SMTx5aSLe+esAxSGuyNs3b5krrSvqpNH2Uop37bruRTFYQ5uIbp4gFv0UFKCrrJYxel/GLAbCb1Ch5WFQK10GVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 10:17:07 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8792.033; Wed, 4 Jun 2025
 10:17:07 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Topic: [PATCH] drm/xe: Add ASID to range invalidation feature flag
Thread-Index: AQHbur+ippUzLv0l80G3f3GWxodQDLPxUuoggACMZQCAAR4ZYA==
Date: Wed, 4 Jun 2025 10:17:06 +0000
Message-ID: <SJ1PR11MB6204626DF59519B9197A5DF3816CA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250501173626.64481-1-stuart.summers@intel.com>
 <SJ1PR11MB6204AC486F6787E80A78BD30816DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <deedf582ebc0c88b2047346cd4f861bc15999366.camel@intel.com>
In-Reply-To: <deedf582ebc0c88b2047346cd4f861bc15999366.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB6901:EE_
x-ms-office365-filtering-correlation-id: f21e2888-e2d6-4f7b-3f9a-08dda350f59c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VzV6cEQvdVd2UzdKbWlQYTVVN09Dc3c0ZFI1UmE2S3Q0MzBhQm53MlY3dlNm?=
 =?utf-8?B?WXg5UkluVXdGZ05KeTdvbHprdWp3Z1dSZy93aFdlTHZNTjh3NDdaamhFNmpW?=
 =?utf-8?B?ZmRnUlczYktncE9weCtNKzNIOVBwQXFTbnlNK2JnbHVacW1INmxObFZkaHJY?=
 =?utf-8?B?WmcxY1VLUWZaQ3UxQUJVZ3hnRjB1emxjcUxFNDZNYUl3RkpXbTEwMENrZ0Rw?=
 =?utf-8?B?OHRtQ0pZUGo1dG1nTHVTSjRtVkpOMWd2TCtSUzVZYjVFZmp4L0N5cmI1dlYx?=
 =?utf-8?B?Q2NFTWpMSFNOanNRdnVIbFpvRmxrWkk0RmFuTEI0QlhSNy9oZFZhWml1dm1Y?=
 =?utf-8?B?NEsrckkvcHJnK0RJbWdRWlhpU2FYNThVSmk4aUgrdmY5RFB1UHlMMGt3YTZU?=
 =?utf-8?B?WWU2Z01IOVVhSm84Zko5ZFluZGtFanpkalpjam1MbExzUzFGc24yS1dJN3d3?=
 =?utf-8?B?d3E2ek5JcEZKTHFIU2h4ZDduMzEvOWZqRFVxeUdXTTUwUEVlZ1F3aGRESG9m?=
 =?utf-8?B?WkduOE4xT3ZoZG1zUzh1M1I2c1ZCdGZnWWtjQTlaWVljbTlOQ1lvZmwrQUZ6?=
 =?utf-8?B?MnY4ZFRvNlVSQUZsZmVwWjNlUk14MWY5RUkwL3hJcGdXWm81d0JuLzVENW1q?=
 =?utf-8?B?b04zWm0xdlMvWnROWmwyNFZnT1hMcDg5T3J6eVhSNENKa1BVd0dWNms5Tlpm?=
 =?utf-8?B?TERlK21qRzkrWDlhZ1Fncm5kTFJjZXp2MHFNUnk5UHlFNHVRODdpZlJsa2Rj?=
 =?utf-8?B?K3ovYzZKZUlWcE5DYzhyRDlrVnRWWnJTT0s3elRwV3NJejV1Z0xPanhHY2Nu?=
 =?utf-8?B?T0NCK0IyU3R0MndOalBUVGU0NjZZMTlCTVhieThjaEUrdFZJWXFMNHU3YmZo?=
 =?utf-8?B?WkJtOUpHQnlOWEZCVHFsVmNqdUNQd0x2cGtWK3paYVB0S2s4a0VrOUtZMnVI?=
 =?utf-8?B?Z3dwakJxZWlpYXBvaWVKdzE5TGF3RE5MNGorUkhzYWRhV3RHM1RCbklqQzVU?=
 =?utf-8?B?YktwQ2xlN2xNVUZ5Qno3ZVAxQXkyUXd6anRmTFNTV1JuazR6Vk5Jb2VvT1A2?=
 =?utf-8?B?N3FNemxKOWtucWl4bERzNi8rS0tvaHh3YWNzWTExRHdqTEtscWFxRWRzRUFW?=
 =?utf-8?B?K3JxWldMeWY4UXowYkdNRkFkSEoxRU52VW5sRnZhRE41cUM4YU1PeVNpWFZi?=
 =?utf-8?B?cy9IWEQzeHRod1FiZmkzRUV3VHBScWdqcFovQ0I4TUJ2eGE0OGUzYUVjZmEz?=
 =?utf-8?B?T1hLK0o5UGd1Niswa2VacTgyZjR4V3BFYzJCa3lyVlpmTWYwQ0t0R0VPV1lP?=
 =?utf-8?B?YVREclliaTU5aXNtaVY4ZndnQXk2MjRDbng2VFoxdjNOOVZ2QmVGcXFKRXl2?=
 =?utf-8?B?Vmx4K2srclZMWE93K3JjdlgzVU1GTUhCd1RWdU55Y1lDQVBhSTdEVzRHbWJ5?=
 =?utf-8?B?N1hoL2hGOHRJSUJIbFBJR0NzZC9BazdqTkY3bTkva1VLN05vVUNHN0hqcXo0?=
 =?utf-8?B?ZG1vMTMvT3BvNjBwNlRDbHZJMzB5ZnVsUGF1VlduNXc3UHRlRUVSc1dLU29K?=
 =?utf-8?B?T0lLd1I5aHJlZW9lc1pvOUp6elhRY3g1NFdCeXdvSkZhNVNIVytoQVNXcyt4?=
 =?utf-8?B?M1RlaXNZWlRIWjBMUGVoSXBORFJjdHA3TEtxWU1lbnA3dWtVNW9hbkEwUFUr?=
 =?utf-8?B?SGRKbndzVzU4WDR2YVYvb2p2VEIvSThERTFmQnBPNUxwNnkvY09aTTlkK0kx?=
 =?utf-8?B?Rm55dmtaMVRzVXdydlhDSWFlVWNpV0x3OVlvK2R2dHJUazFhU3ZRRG9KYTFE?=
 =?utf-8?B?bXA4eGc1cUEwWUxJMlBKVXlxMjF6ZVFDWVJKRndHSXlvT3ZCbTk3THN6K1c5?=
 =?utf-8?B?RFNpdFF5eXBVSVA2VEpRVVVLMnJGWmtxMUNKK254K3F5RnJHWW9kWFc1R0R4?=
 =?utf-8?B?YmM3TzFOWHRCOGZwRnlTTm1aRE9xZVVpVTRGdWIzU3FtdTcvSnFzL2RkbTUr?=
 =?utf-8?Q?OO3XCvHvlqbGcawFdbP45by/nqD3Sc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnJ0QTM4MG1JR05wUEpMdlJPT2NLWngxckxwSzdSS0tOQWoyYzRIVDZWNlAy?=
 =?utf-8?B?VjVSeDVDdDdnK0hqWE9VRkhKQ0JvKzh6MmxtL25iMmh1N2NpUnBJbHRIQkNp?=
 =?utf-8?B?R3R1YWU1NWdjWXQ5USt6ZXRkL1lOQk1GU2IwUGpTb28yWmNjVUhtSkN1a2RT?=
 =?utf-8?B?N2hqV2xxaTQxVkVLSXg5d0NDdDY2anl3SUtZSmREaXFJRkNzZkJSdHhEMHVM?=
 =?utf-8?B?M0UrZUZwc3l6Qm5IU0t4RTNSZjlpTFIxM0xHWGZmRGtEbFRPOGltdWZWNWVL?=
 =?utf-8?B?NHhvZlRKU3ZQTENYVGJBdTlmWDdzSCtnWjAwL3J6dnI5MGlIQVB6dXdhZDFs?=
 =?utf-8?B?VFhMZjBMakYvVnN3dEtpZjNIZDRVeWZhVlUrNnR4bUgxQ0VJU0pIYWlySWZG?=
 =?utf-8?B?OUVJT0REUEhRM0dvNWsrVG5xQ3ZyRU42RVNkT2paaWdBN3l5dkJnQW1kOTA4?=
 =?utf-8?B?STNWNTVCRi8xS0VLc1BUajArandFNDJzWFo5UTlBbHJBd2xnVGp0VVQ1eUVv?=
 =?utf-8?B?TVNrckJGMGgxMEtlYllqbGFoa0JTN3JZU093SFBwdlVXVm4yU3JDRGhjMm54?=
 =?utf-8?B?TE1ZZmhYMDgyejVFemJISEUvMlh6MWhBSUV2L3d4ZGlaaW8zOFlWcjkyWWtI?=
 =?utf-8?B?NVNaMXp1clRoeS8za0pBV2ZWVS9NUHJHTkVvenp2RlZ0YWVUbm1qdDRwKzBU?=
 =?utf-8?B?VGVQZmlYam5ROHE5T20vdnh5V1A2TllRVFp1bHloV0gwTnJKWGtqWUNpRUx0?=
 =?utf-8?B?c3crWS9BbWxJckVDbjBsWVdhM1doa29LYnRQQ0JqQTR1RUdqbTFVY3dyTkZY?=
 =?utf-8?B?MlNqUCsvTlNvOFJWK1hoRElHVDdrK01iWUlzWFV1TTNwVk1FZDNIR0ptajBK?=
 =?utf-8?B?TVlQSUFrZmZhTVJPbDM1OXZ4bHJaQlZrQ1dDUmNzWnptbWRkelQvVDRJUC9R?=
 =?utf-8?B?YzdrMm1vTGFYb1Vkc3FOK3Z4RDhwL0RHUzFtQWtUR04rWmd2RGdUSlZXNlBk?=
 =?utf-8?B?Yk5XU1AzUWxLdjh4N0dzR3hKelJhNmRpU1F5L1JKMUtPMVEyVnV2dVJTMy9k?=
 =?utf-8?B?bnRsTVJVQzRPQ1lsK1ZRaGwvV0IwZWRIWVoxY1EzZitRY1lVUmlVend2azZ1?=
 =?utf-8?B?aysxbmk3Ync1cW9USXpLYmZkTE5LQUZzUURMM1d3L21VbW1RRTRXb29ieitP?=
 =?utf-8?B?NDJYU1BIUlJvQ2lTZzFYbjhrSFJuUVlOVzQ3b3I2UTNHVlZIRVArT0JXaGxr?=
 =?utf-8?B?bGxpTzV0NEhhdDBRMWx6WGlTYWpKWnBORGtOMk1XMUcwK2c0U3REdkh1TXVo?=
 =?utf-8?B?UGVmdGZyclMzdCttc09BbzV1Ymc2MDBZOTlNY0htZnphNUtaaml6OFJIRWZo?=
 =?utf-8?B?eEUvVlJiajlRWFc1WEpVelJHOGVCNi9NbFZQcUUwMWxSa2xJQWFONENtNzVi?=
 =?utf-8?B?aFkvaTEzcnpyVUhaOTlKbEhmVTZIdEJzcDFrZTBTcnBaYmtpUTQ1V2hETlo2?=
 =?utf-8?B?ZVBDWC9kS0V4UTF0aDVDUXBhenlOcGt0UHhzaVUzNk1LcStwbTRYblphWFJP?=
 =?utf-8?B?WERPSHVualpnN09sRzBoUHpCT1pSUnJoWHlvVlNHcFE2djB1L0Q5SmM4YjBt?=
 =?utf-8?B?bXBKUmtMQWErSXRIclAzUndEbDRsem8zUVhKMUhLa3dSZmpGd1ZDNnN1S05w?=
 =?utf-8?B?a0JjYlQrWVBKQllLL2lRZm84NHpyMVh5blc0YzczYmsyN3NrYzRNNnllM1Uv?=
 =?utf-8?B?QXJiWFQ1RkhOaXI5YUNSaFdrdlB6M0RzUmdIUnQ1SXQ3d2ZMOHVkTWJQU0w1?=
 =?utf-8?B?Mk9jdzlrZjB1MzgvTWs0a0tVSEFIbTZ4aU00OEJFZTBSZ2VldXdyNFRUK0RL?=
 =?utf-8?B?Wm9nT2VyR3c1aERBMGZTdlQ5bkxyUUtiSk13aDRkQlVQSzRTOWVpaGRnNXJ3?=
 =?utf-8?B?a3pjcnM4eGEwRVRmRUNRZW5CelJQd0tBbks0Y2N6YVNrUHhYUVJOZHdWamJP?=
 =?utf-8?B?cTg0elBwRjVrSVc0VFZIV0ZKVDRNcUNhSDdsNUhUVFhET1BRVFo4VEFmRU9Y?=
 =?utf-8?B?ekhnMDltSkt5WER2bUZabUJoRGhNTng5cEIyUjhzekpSNkhLbnN1amRjdHB0?=
 =?utf-8?Q?16ShbP44vVhiHzrvybRdzlS2X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21e2888-e2d6-4f7b-3f9a-08dda350f59c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 10:17:06.9392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGhyfyPE+sBtMDxPGgc88UzL55g1LQSnlx7fMjzcopCza+gN6bsOxbmifll1QsIBh7w8KdD6DgguZRQNRTuA/6jr06jyMsqC1WxMx00kQ+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VtbWVycywgU3R1YXJ0
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFNlbnQ6IDAzIEp1bmUgMjAyNSAyMjo0MA0K
PiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5h
DQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtL3hlOiBBZGQgQVNJRCB0byByYW5nZSBpbnZhbGlkYXRpb24gZmVhdHVyZSBm
bGFnDQo+IA0KPiBPbiBUdWUsIDIwMjUtMDYtMDMgYXQgMDg6NDkgKzAwMDAsIFVwYWRoeWF5LCBU
ZWphcyB3cm90ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YNCj4gPiA+IFN0dWFydCBTdW1tZXJzDQo+ID4gPiBTZW50OiAwMSBN
YXkgMjAyNSAyMzowNg0KPiA+ID4gQ2M6IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+ID4g
PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+Ow0KPiA+ID4gaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTdW1tZXJzLCBTdHVhcnQNCj4gPiA+IDxzdHVhcnQuc3Vt
bWVyc0BpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS94ZTogQWRkIEFTSUQg
dG8gcmFuZ2UgaW52YWxpZGF0aW9uIGZlYXR1cmUgZmxhZw0KPiA+ID4NCj4gPiA+IE1ha2UgaXQg
ZXhwbGljaXQgdGhhdCB0aGUgQVNJRCBpcyB1c2VkIHRvIGlkZW50aWZ5IGEgVk0gd2hlbiBpc3N1
aW5nDQo+ID4gPiBhIHJhbmdlZC0gYmFzZWQgVExCIGludmFsaWRhdGlvbi4NCj4gPiA+DQo+ID4g
PiAvcy9oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbi9oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlv
bl9hc2lkLw0KPiA+DQo+ID4gV2hpbGUgdGhlIHBhdGNoIGxvb2tzIG9rLCB3aGF0IGlzIHRoZSBt
b3RpdmF0aW9uLCBpcyB0aGF0IGd1YyBkb2luZw0KPiA+IGFzaWQgYmFzZWQgaW52YWxpZGF0aW9u
IG5vdyBzbyBjaGFuZ2luZyBmbGFnIG5hbWU/DQo+IA0KPiBUaGlzIGlzIG1vcmUgYWJvdXQgY2xh
cmlmaWNhdGlvbi4gV2UgbWlnaHQgYWxzbyBoYXZlIGEgdGltZSB3aGVyZSB3ZSB3YW50IHRvDQo+
IGJlIGFibGUgdG8gZG8gaW52YWxpZGF0aW9ucyB0cmlnZ2VyZWQgYXQgc29tZSBmaW5lciBncmFu
dWxhcml0eSB0aGFuIGJ5DQo+IHByb2Nlc3MvYXNpZCwgc28gdGhpcyBnaXZlcyB0aGUgY2xhcmlm
aWNhdGlvbiBvbiB0aGUgaW50ZW50aW9uLg0KPiANCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+
ID4NCj4gPiBUZWphcw0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJz
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5owqDCoMKgwqDCoMKgwqAgfCA0ICsrLS0NCj4gPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyB8IDIgKy0NCj4g
PiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5
cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0NCj4gPiA+IMKgNCBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiA+IGluZGV4IDA2YzY1ZGFjZTAyNi4u
M2U0OWI4OGE4YTYyIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV90eXBlcy5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gPiA+IEBAIC0zMjcsOCArMzI3LDggQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19sbGM6MTsNCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc19weHA6IERldmljZSBo
YXMgUFhQIHN1cHBvcnQgKi8NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
dTggaGFzX3B4cDoxOw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBA
aW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbjogSGFzIHJhbmdlDQo+ID4gPiBiYXNlZCBU
TEIgaW52YWxpZGF0aW9ucyAqLw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHU4IGhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uOjE7DQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uX2FzaWQ6
IEhhcw0KPiA+ID4gcmFuZ2UgYmFzZWQNCj4gPiA+IFRMQiBpbnZhbGlkYXRpb25zICovDQoNCkNh
biB3ZSBhZGQgcGVyIGFzaWQgaGVyZQ0KDQpIb3dldmVyLCBjaGFuZ2UgbG9va3MgZ29vZCBvayB0
byBtZSwNClJldmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tPg0KDQpUZWphcw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhh
c19yYW5nZV90bGJfaW52YWxpZGF0aW9uX2FzaWQ6MTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyoqIEBpbmZvLmhhc19zcmlvdjogU3VwcG9ydHMgU1ItSU9WICovDQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19zcmlvdjoxOw0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFzX3VzbTogRGV2
aWNlIGhhcyB1bmlmaWVkIHNoYXJlZCBtZW1vcnkNCj4gPiA+IHN1cHBvcnQgKi8gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+ID4gaW5kZXgg
MDg0Y2JkZWJhOGVhLi5jNjhmN2NjOGUxNzUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiBAQCAtMzY2LDcgKzM2Niw3
IEBAIGludCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX3JhbmdlKHN0cnVjdCB4ZV9ndA0KPiA+ID4g
Kmd0LA0KPiA+ID4NCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0gWEVfR1VD
X0FDVElPTl9UTEJfSU5WQUxJREFUSU9OOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGFjdGlvblts
ZW4rK10gPSAwOyAvKiBzZXFubywgcmVwbGFjZWQgaW4NCj4gPiA+IHNlbmRfdGxiX2ludmFsaWRh
dGlvbiAqLw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNfcmFuZ2VfdGxi
X2ludmFsaWRhdGlvbiB8fA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNf
cmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkIHx8DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxlbmd0aCA+IE1BWF9SQU5HRV9UTEJfSU5WQUxJREFUSU9OX0xFTkdUSCkgew0KPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Rpb25bbGVuKytdID0NCj4gPiA+IE1B
S0VfSU5WQUxfT1AoWEVfR1VDX1RMQl9JTlZBTF9GVUxMKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqB9IGVsc2Ugew0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Yw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgaW5kZXgNCj4gPiA+IGE0Y2Fh
NjIyMmI2Zi4uY2ZhZmNmY2JiYmM2IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BjaS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4g
PiA+IEBAIC05MSw3ICs5MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZ3JhcGhpY3NfZGVz
YyBncmFwaGljc194ZWxwDQo+ID4gPiA9IHvCoCB9Ow0KPiA+ID4NCj4gPiA+IMKgI2RlZmluZSBY
RV9IUF9GRUFUVVJFUyBcDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9pbnZh
bGlkYXRpb24gPSB0cnVlLCBcDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9p
bnZhbGlkYXRpb25fYXNpZCA9IHRydWUsIFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAudmFfYml0
cyA9IDQ4LCBcDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLnZtX21heF9sZXZlbCA9IDMNCj4gPiA+
DQo+ID4gPiBAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZ3JhcGhp
Y3NfZGVzYw0KPiA+ID4gZ3JhcGhpY3NfeGVscGcgPSB7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
Lmhhc19hdG9taWNfZW5hYmxlX3B0ZV9iaXQgPSAxLCBcDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
Lmhhc19mbGF0X2NjcyA9IDEsIFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX2luZGlyZWN0
X3Jpbmdfc3RhdGUgPSAxLCBcDQo+ID4gPiAtwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9p
bnZhbGlkYXRpb24gPSAxLCBcDQo+ID4gPiArwqDCoMKgwqDCoMKgwqAuaGFzX3JhbmdlX3RsYl9p
bnZhbGlkYXRpb25fYXNpZCA9IDEsIFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAuaGFzX3VzbSA9
IDEsIFwNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAudmFfYml0cyA9IDQ4LCBcDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgLnZtX21heF9sZXZlbCA9IDQsIFwNCj4gPiA+IEBAIC02ODAsNyArNjgwLDcg
QEAgc3RhdGljIGludCB4ZV9pbmZvX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgLyogUnVudGltZSBkZXRlY3Rpb24gbWF5IGNoYW5nZSB0aGlzIGxhdGVy
ICovDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGUtPmluZm8uaGFzX2ZsYXRfY2NzID0gZ3JhcGhp
Y3NfZGVzYy0+aGFzX2ZsYXRfY2NzOw0KPiA+ID4NCj4gPiA+IC3CoMKgwqDCoMKgwqDCoHhlLT5p
bmZvLmhhc19yYW5nZV90bGJfaW52YWxpZGF0aW9uID0gZ3JhcGhpY3NfZGVzYy0NCj4gPiA+ID4g
aGFzX3JhbmdlX3RsYl9pbnZhbGlkYXRpb247DQo+ID4gPiArwqDCoMKgwqDCoMKgwqB4ZS0+aW5m
by5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkID0NCj4gPiA+ICtncmFwaGljc19kZXNj
LT5oYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbl9hc2lkOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oHhlLT5pbmZvLmhhc191c20gPSBncmFwaGljc19kZXNjLT5oYXNfdXNtOw0KPiA+ID4NCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9yZW1vdGVfdGlsZSh0aWxlLCB4ZSwgaWQpIHsgZGlm
ZiAtLWdpdA0KPiA+ID4gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmgNCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oDQo+ID4gPiBpbmRleCBlOWI5YmJj
MTM4ZDMuLjNkMWM3NDVkZTJhYyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wY2lfdHlwZXMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90
eXBlcy5oDQo+ID4gPiBAQCAtMTksNyArMTksNyBAQCBzdHJ1Y3QgeGVfZ3JhcGhpY3NfZGVzYyB7
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX2F0b21pY19lbmFibGVfcHRlX2JpdDoxOw0K
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoHU4IGhhc19mbGF0X2NjczoxOw0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoHU4IGhhc19pbmRpcmVjdF9yaW5nX3N0YXRlOjE7DQo+ID4gPiAtwqDCoMKgwqDCoMKg
wqB1OCBoYXNfcmFuZ2VfdGxiX2ludmFsaWRhdGlvbjoxOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKg
dTggaGFzX3JhbmdlX3RsYl9pbnZhbGlkYXRpb25fYXNpZDoxOw0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoHU4IGhhc191c206MTsNCj4gPiA+IMKgfTsNCj4gPiA+DQo+ID4gPiAtLQ0KPiA+ID4gMi4z
NC4xDQo+ID4NCg0K
