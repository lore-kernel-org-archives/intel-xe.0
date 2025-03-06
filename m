Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0D5C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866110E02D;
	Thu,  6 Mar 2025 22:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="krcB7ZC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2337310E02D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741299370; x=1772835370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HpZW3R6PqHodHSjszYsPyZ1sESG6KtOx0s3zENEBbZo=;
 b=krcB7ZC1ZyzYAwgcI9s59YFv2qj0xfd4KaFaTUCjQA9FHCyeeOZSifvy
 Lc83pS9idlBqvQqLAvNIq+4JpGjLc6q+2T8/gwB3tGwsV23V9DKYX4xZU
 ZLWnfgxrQruYGhJP4r8584LDACVA7m6Kvf3BHRMb/eC+TTFwIRMY0lFDx
 5GQYLudYQzUMRcB5ecVoFkcEBU0FjB2ezKXskQgfX1l7t5feXtlXZ/o37
 8SivxEpmOGGYU50ajpYr8X0ZD/hpZyY930rENkGaSQvP7ethMSkfux6dl
 UBbuwSToik2fQoZhcoiR8lRbQfY7+rnedVFS2WwL+mw4Hu1nJW5VASYjf A==;
X-CSE-ConnectionGUID: 33QIY7JySZWhrRp/d6GLmA==
X-CSE-MsgGUID: yrT0ZqQfSCKPj+phe2KdUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46262232"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46262232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:16:09 -0800
X-CSE-ConnectionGUID: Uh8P1WVER3m3tfY5YsgCZA==
X-CSE-MsgGUID: hTNrmnevR5eRlhmLMbwFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120065508"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:16:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 14:16:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 14:16:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 14:16:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cy0ZeY8WvojzVpKuVvLZlwZDAHl09TTyzEclg0WXxUgLTvCSqEwhc9AcMGmnjReS7gyYK1RFmQxH2KkkMRORIpRP9AUlZUJwP7lGBNA33FvMETfPFWtsB1e/O5gKN3uE9K48ZqEl2ve+hGXl4u1Fp2UILQtKmfP8VRfKCgJrr8+O3uIJDrUM4pFUthRDsOBrWfUd8RuLGgZ0c9xPx8ySgNXOS51UpRVvS6N+MqU9sN2D45GLeeySVVTvLi3a8skDmpwjocnPY0D3wZstDb9/6dRTsrnnG6k+LWyM+LfIpBX3dleW14PJPOJw2aufRnUgnmRuhpaYBUmZnEeOnSRypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpZW3R6PqHodHSjszYsPyZ1sESG6KtOx0s3zENEBbZo=;
 b=PgZPsYN1EHo/F3v/S0v/8pChVGtIbLLj4A9Ilza0yWecRSmPHp6sY4WioDm0tnF7HBhl0/fcmst6TLta+hmBbMENEcrNsHouC6Vyb+pN5BdKYGvwD/SyIqI4fBTyM2GGhIb0F8KY2v93V0y8NjS+PLB9nUcwGtyeghtcmdTe1vxhva5t5AlXeDCKoxsK96rU/xGyG4Xv2O04SMpsuKxGdFJYhiFw1xakc5nod70nNxMyPkOpkjVKYiyx6/0TtGr6RKcv53rVf/Rp8x+e0kFkGpPnByzCEWNuht5zqAj6fS8ag8EG5eUVtqUHpP0HGrmSLk8mard7PBnDOuQbqh8dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB7298.namprd11.prod.outlook.com (2603:10b6:610:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 22:16:00 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 22:15:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Remove pointless gen11 assertions
Thread-Topic: [PATCH 1/2] drm/xe: Remove pointless gen11 assertions
Thread-Index: AQHbjuRMzwO6UVwnM021AZPRQ9od8rNmrHKQ
Date: Thu, 6 Mar 2025 22:15:59 +0000
Message-ID: <CH0PR11MB5444498C4DCB1B70F0A3DDF7E5CA2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-1-03683e56006a@intel.com>
In-Reply-To: <20250306-drop-gen-v1-1-03683e56006a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB7298:EE_
x-ms-office365-filtering-correlation-id: fa9f5786-3ea6-4e0e-cc8c-08dd5cfc7975
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WUlMNDNaLzhOTEhHLzNyZC91bTF2RHI5YVkxVEZBRlRBbmY0dGN2VU1BZXhy?=
 =?utf-8?B?ZkNuY0x1VE1QZ1JDUEJyWWZjU1ROeWg4cmNqVmlISFNVR014RmkwUzJ5dlhh?=
 =?utf-8?B?NTFVaHArdE5uWWZBeHdNVWlHL2hoRjUvS3J0a1JtdTVXRzkyelBvajR5elZ5?=
 =?utf-8?B?Zkt2NFMxZDZtRWx2elEyWVFoY0JTcU0wMFFGOWFNSzB3VmlxTit2U3hvVkFz?=
 =?utf-8?B?aU1pMVI1QVJNLzYwU0VFeHhjOFFZeEZqZ3ovcGEwdGkxSGF6Z0JMWGNrWDMy?=
 =?utf-8?B?ZTYrTXZ2blpvY00xa1lNQkF2Z1F6bVBvQ25La0U4UVhKTExOdE5yRTY2TWMw?=
 =?utf-8?B?eWJhQStqQ0kyM21PVGZ2S01oR3pLU0VJNkppZ2w0YjVpT0xyNHNTbFAvM0NE?=
 =?utf-8?B?VUNNVitvcGd2ZTdRblcyQVdhWlR5NDVmcG9vNzBDZFo5QXNraVdINWZWNnEw?=
 =?utf-8?B?UzFRV0lzay9qMHAvMXMzamNZcE5WcUd6YmNWT1BzMHpLOWxJeUIwVGw5NU1L?=
 =?utf-8?B?dEprb1pEYTdyMlZ1QUR2NWs5dVdrYlFHcDVabHk1VVVoblVBTFVCaXhncnRH?=
 =?utf-8?B?ZHI1SzUyaEtrcTZhcTc4Sm9uTVkydDA3VTlheXdGS1pIdUhCVWhaZSs3clRh?=
 =?utf-8?B?dFNZVDRqK2RhL0NSeUd2bFArTGJIVlYyYkVXdG43QXVNUmdqTU1yVUl6MDlJ?=
 =?utf-8?B?cjRVZGpoZUEzMlFnVzhHZUQyVk9mcjgvWC8zci82M09kTFdTRmFkSE1wZUQr?=
 =?utf-8?B?WmhDSU9IWmh6WVE1NUJIcWNXQkJya2ZaUWF5YnZzajRWcHJVY1FGYUtuU0NL?=
 =?utf-8?B?OEVQb0IyaFYvT09yT2RReU4yTnEyVTU1SlZiekhaMlpoNDRBTUJlUmNCbHl3?=
 =?utf-8?B?RjhCRFl1OEdjWFVkY3VTNEJtWE5vWnJhSHBrR1hFUDZuQ3hTSlJXOHFXOFcv?=
 =?utf-8?B?bXpURksyeUNXdWp1eVBzbEJWOHJWYllub2VGa0tIM0VhK0dhNzVML2tEZFpQ?=
 =?utf-8?B?OFJnSk5HYUtFY0RCTmJJdnBNWW5PbFZZaFdYWHFCc2pvaHRuM1VONEJLTGN5?=
 =?utf-8?B?b3RBVnowb3d0UFFMSGsrY2lHYmhpdjZiWkFkaE9vZ2o4RE50cW8rS1BBZ3M1?=
 =?utf-8?B?RDBtUlRENnVJOXdLQmgzWllCRWozNTFWRE9IMjNNaVBiM1lGU2xReGw5LzUv?=
 =?utf-8?B?b2RYdjhrUXZUNzh0cm43YjNKYUdnY01MNkdVT0sxRG9qa0t3VERwQWt5TUMw?=
 =?utf-8?B?MGhXRDBuaGZBVU9SSVEwQUUrQ3lCQTBwQ1hCNnVIaCtLSGxmdHpUM3A1ZXdF?=
 =?utf-8?B?YjlNbTZsRTduUHg4K1RLaDhHQnZKb0FOaDVmUDJjb3Q3ekRwbG1CbUFpV1ha?=
 =?utf-8?B?YXZrRHR5SmxwN3RZcVdWVWRkTzl5UHhDelRqYi9nMERjeGROb21HckFBQVBz?=
 =?utf-8?B?em9ROUxPcG40NWxTT21kSUYwa2Z4YzBBTWVPVzlJR3VBMDlLM0F5UGZ0d2pN?=
 =?utf-8?B?NUtnRGRkMU9MblR2UHZrZUZXUldiVHo5aVlpUnUraWYyR3F2Y3ZheDdQZzNC?=
 =?utf-8?B?SkFXaTFneU1BTi9DRDNkaml4d1pGZEJKUGV3Y1pPSnlqM01jN2hrMXNCT3ZK?=
 =?utf-8?B?ZWpMQnRoUzg0VlRXSHAwRldScVJhVHFIc2Ircy9KdGNWanV0OVNOT091dW5Q?=
 =?utf-8?B?dktiZ3VNWjFmRyt3WmFTL0diMDU5eFRudmNxQmIzbGdqazk3M0hBeDllU1ZU?=
 =?utf-8?B?NkVCaklIblFZcS8xQXczSVN4SytzZnEyY3VGYzFLSHJjVGM3NGZ4WjFRbmd5?=
 =?utf-8?B?T1A0S21Nbmh4K1JsRVY0LzZtOVZLUGxJM3k1VlBodXE4QXF4YU1rVjlSZGZv?=
 =?utf-8?B?Qy9NWkJlbEVIc0RUZHNHN1Y1dG55bStwcEZBMmw5RUFNVms2enY0UXUyaDZR?=
 =?utf-8?Q?s2pGTUgvmmycXdkNVd/dI1ue0XWT8feL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eklPYmRVMDByeU8yTlRIcDIyQ3g4NTNTTXFBaGZNVm81UHFVWHVmN2E1bk5W?=
 =?utf-8?B?QjRpNEQ0eVIzVGN4NWJvSUNRa3FZMUczZE9zY3V0NWdBcGpKNkFsVkVVdEZU?=
 =?utf-8?B?SUNGNXpOcXJYL0xzU0VLQmhhL3Bmd1FBUUVEOHRNQmJuR0V1WE93cWlHN1BZ?=
 =?utf-8?B?Q2VsMHFQTlMxU0g1WjBHbCtNK0ZVdEY5bk1NTkdraG5iOTcyNFFEOE9uQk5j?=
 =?utf-8?B?cCtZR3VzaDNjNVhrdzIva0htZnFzNm9YS2ZJWjJKYkpRQ2wxYWhadnpGY3VV?=
 =?utf-8?B?SGxvYk1wK0N6Z1dYUDZjcFdzUlpFaWYvYXFTdVkwd25aeDVrd2QrWGtxU1JT?=
 =?utf-8?B?b0tIcnJ4MmpSOHUydXJaTnBZeW1rcTNQaHJPZWFLMjh0SGFYa2kyN0tWWVNW?=
 =?utf-8?B?VlNHWUFjVTZFNWFiVWhQanJoWUVnY2NISExYdXUreU1SNnZvWTQyVE9KdlFt?=
 =?utf-8?B?RTJYMk5kc0pOK0RLcTNlaW90dmNGTFZtZnNzcmRxL0hKSGp4S0VvV1pvYS9t?=
 =?utf-8?B?V04yUFN0Z2NGRU92VGFVbnE3blF2eFozRWFmSnVxZ3E4amtNbEMzK1luVnc1?=
 =?utf-8?B?ZFJvVmtpTzlybHhDUUhxU01aWk9ONkxabzNrYURoY09PbEUwQWVFKzVzaXRY?=
 =?utf-8?B?YUY1OXFQNWRGZDBaV0hUQUhqUjl5N2dOS3BlSzU3dnNadHhSQUhHRGhzakc2?=
 =?utf-8?B?RXFZS2FRRU9VU0l4dFhoZGlNaDRnVVFJZzcyRmFMZE5NU09la01oRGI4Z2Ir?=
 =?utf-8?B?a1RJTGVqUDZGL2lpRjdHV2Z2dE5nb0pKT3k2djJoa1ZQWmVYWVg2RFpjbjll?=
 =?utf-8?B?bC8yMW9YSnFSS0R4NVRJbkRLZlZKL2x5VmxQMGZFeFBYcFFTWW9zems4Uy84?=
 =?utf-8?B?MWxiZmZDNU9qdDBMeHh0OTJ2SFdERWpqS3pTMTJPR2R2WFFDQWpKYm1lUHNK?=
 =?utf-8?B?VG9XUkpmSUozRUFwMUVEY2NtNjhuTG45TG9mbldlNko2OWRvbTc0SzZ2dWFk?=
 =?utf-8?B?UWI5ZTJJcHRTRTZiK1MyRnFmTHVYR0EyNUhLdDR3aW1CbkEwYW9uSWR3U3VB?=
 =?utf-8?B?KzZnQzRnUkdpcGZ1TnB1clV6YjQxZWRmNWszL01EUUJvMDNxN1BSalVZYldX?=
 =?utf-8?B?R3NxN3lPS1hRU2NXb2RHNVp0cmdWd2hQS29hdWRad1gvVzEvK3FROHVxZXIw?=
 =?utf-8?B?U0R4L3ZSdXg2VlJUa2xDQlFJdUhrTk5UbEhvRm9qSEZGd1B4ellDWGVleU9z?=
 =?utf-8?B?WHJtb3RHNnh2NDlTRlc5ZEFLZDZQTnY1N2QvMlBYQ1dDbWw4dTFHMDdSYVlr?=
 =?utf-8?B?QjBKdm9KTUtHT1loM0w3YzF2WHNRNTdsSHNBdEc3aWhBOEUxanpINHBJS1l1?=
 =?utf-8?B?Nlc5RTg0UXBqNmhkNjQzMlNmaE1GY3YvZ01iUWt0ZGJveGk3bGFsenhQUWRW?=
 =?utf-8?B?RXhkOWpUQlMwRHJlc3F1TU5Nb0t2WHovT3Jjayt5b0ZpTmliMVBhbjRCQjA2?=
 =?utf-8?B?Z3ZxZXo5enhxSngzbTNiQVRxTUU1bmV2MXpmdkx3QUNJZkJZREZVdnZTSFZT?=
 =?utf-8?B?MExoM25GOEFFVnc5QndITzZkNUxrN3BpT1YwYmZLeGhDUThuS3lxYlg2aHJp?=
 =?utf-8?B?TTNGSGliWnVkMGd2dHRzcVgwQjAwSE1xaE1jZ0NYWmp5dmR6cFJCbUgvNll1?=
 =?utf-8?B?a3NhUzlFbHVwYm8ya2hneCtpRzg5aDdEQldqY2FkTmI1MnhkT3dkSFRNaUtL?=
 =?utf-8?B?OXZES04ySTlINFF3SUNrK3EvM2xneTZxdmZLOVFvUk92SmIzQnNobnh3MWRH?=
 =?utf-8?B?d2FJYTMvRm94WHRsVGVGTm5YejRGalMyV0NtNGJrMytQVHNOcTRjUWtZdjFZ?=
 =?utf-8?B?NDNpQVVHTUJQVGxpN0R6VldybmQwMWNUSXJlbU1rNkE0QUNwcDhQZ2hZR1Fv?=
 =?utf-8?B?U1liaGcyeVI4dlBpYncrSWgvL2xqNTZaZXpqbGF3L2dNdG0wc3lBZ0xsODZN?=
 =?utf-8?B?NDZmeU1lY2hIeVlvSHlUZkhDZllzRUh1QTgrZ1VSdnNJSXpaTDVqMWtNMHNh?=
 =?utf-8?B?RzVjYUZ3WE0yUW5JbzBQNDV0YWp6Sm84NlhwdFd5VmdQekVyek0vZEEyRU9S?=
 =?utf-8?Q?IZhqVdIUvUvYGzOIrkpndN0o2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9f5786-3ea6-4e0e-cc8c-08dd5cfc7975
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 22:15:59.5544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4mhzrkaCiej+UWXfEZxcBsp06EF0RqLqZEGjL/V3l58VtS7yExyxmz514v2k4qhdzQJuhJ/K+YMSqz3QTv6CcWC703HKwvTxMBOldmK1Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7298
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEx1Y2FzIERlIE1hcmNoaQ0K
U2VudDogVGh1cnNkYXksIE1hcmNoIDYsIDIwMjUgMjowOCBQTQ0KVG86IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGlu
dGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS94ZTogUmVtb3ZlIHBvaW50bGVzcyBn
ZW4xMSBhc3NlcnRpb25zDQo+IA0KPiB4ZSBkcml2ZXIgZG9lc24ndCByZWFsbHkgd29yayBpbiBn
ZW4xMS4gU3RvcCBhc3NlcnRpbmcgZm9yID49IDExLA0KPiBhcyBpdCB3b3VsZCBsaWtlbHkgZXhw
bG9kZSBhbnl3YXkgaWYgdHJpZWQgb24gc3VjaCBwbGF0Zm9ybXMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCg0KQXNpZGU6
DQpUaGVyZSBwcm9iYWJseSBpc24ndCB0b28gbXVjaCBoYXJtIGluIGtlZXBpbmcgdGhlIGV4dHJh
IHNlY3VyaXR5DQphZmZvcmRlZCBieSBjaGVja2luZyBmb3IgZ2VuMTErIHBsYXRmb3JtcyBpbiB4
ZV9mb3JjZV93YWtlLmMsDQpidXQgaWYgd2UncmUgYXNzZXJ0aW5nIHRoYXQgWEUgc2hvdWxkbid0
IGJlIHJ1biBvbiBnZW4xMQ0KYW55d2F5cywgdGhlbiBJIGFncmVlIHRoYXQgaXQncyBhIGJpdCBz
dXBlcmZsdW91cy4NCg0KTEdUTS4NClJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+DQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jIHwgNiAtLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9mb3JjZV93YWtlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZS5jDQo+
IGluZGV4IDRmNjc4NGU1YWJmODg5MTNiODFhMzY0YmIzOTNmNjI4NmQ1MmJlNzguLjhhNWNiYTIy
YjU4NjEwMjI0Yjg1NGU0MmI5NDMxZGNhZTE3NGFjMWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9mb3JjZV93YWtlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2ZvcmNlX3dha2UuYw0KPiBAQCAtNDksOSArNDksNiBAQCB2b2lkIHhlX2ZvcmNlX3dha2VfaW5p
dF9ndChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgeGVfZm9yY2Vfd2FrZSAqZncpDQo+ICAJZnct
Pmd0ID0gZ3Q7DQo+ICAJc3Bpbl9sb2NrX2luaXQoJmZ3LT5sb2NrKTsNCj4gIA0KPiAtCS8qIEFz
c3VtaW5nIGdlbjExKyBzbyBhc3NlcnQgdGhpcyBhc3N1bXB0aW9uIGlzIGNvcnJlY3QgKi8NCj4g
LQl4ZV9ndF9hc3NlcnQoZ3QsIEdSQVBISUNTX1ZFUihndF90b194ZShndCkpID49IDExKTsNCj4g
LQ0KPiAgCWlmICh4ZS0+aW5mby5ncmFwaGljc192ZXJ4MTAwID49IDEyNzApIHsNCj4gIAkJaW5p
dF9kb21haW4oZncsIFhFX0ZXX0RPTUFJTl9JRF9HVCwNCj4gIAkJCSAgICBGT1JDRVdBS0VfR1Qs
DQo+IEBAIC02Nyw5ICs2NCw2IEBAIHZvaWQgeGVfZm9yY2Vfd2FrZV9pbml0X2VuZ2luZXMoc3Ry
dWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX2ZvcmNlX3dha2UgKmZ3KQ0KPiAgew0KPiAgCWludCBp
LCBqOw0KPiAgDQo+IC0JLyogQXNzdW1pbmcgZ2VuMTErIHNvIGFzc2VydCB0aGlzIGFzc3VtcHRp
b24gaXMgY29ycmVjdCAqLw0KPiAtCXhlX2d0X2Fzc2VydChndCwgR1JBUEhJQ1NfVkVSKGd0X3Rv
X3hlKGd0KSkgPj0gMTEpOw0KPiAtDQo+ICAJaWYgKCF4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSkN
Cj4gIAkJaW5pdF9kb21haW4oZncsIFhFX0ZXX0RPTUFJTl9JRF9SRU5ERVIsDQo+ICAJCQkgICAg
Rk9SQ0VXQUtFX1JFTkRFUiwNCj4gDQo+IC0tIA0KPiAyLjQ4LjENCj4gDQo=
