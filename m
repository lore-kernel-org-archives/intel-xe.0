Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947E1C8303F
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6D710E27E;
	Mon, 25 Aug 2025 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/I5dvj1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AB710E27E
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146241; x=1787682241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UEkUYIO+zVnaWThxRQp9kHjI/l+4ePZ/+NGwGrU10RA=;
 b=Q/I5dvj1k1w3kjCXPFlDKx+3P2YpMmaGj3BtgOzp900G0G3U+sKqjirY
 kHOtfazRACrF+ytQrJyY8z1R1IwCLV8koFzxz2KV3ihRt2Jbnho7tIycC
 LZcSfj/lvn/vz7zC/6J9XyhScdcPDQMuOU2sllc4zGLW0SewWkKATDse4
 2vog/0b4HgMZHpKwp0Dhyjopo+sYDa0TwhwITq8mv5oXxz6BJ+qSw2tc0
 5TBvwg7oM7U65RSk4TGN6UDEmzYpao/TFBU7ALOcmHTEzt53A2TVy513z
 B7v8jCmNBL1bXjt8//amtfipM03KPdvi2pm6aDr8j4qEXt1SiVObofI7L g==;
X-CSE-ConnectionGUID: P2alNimPTfmZOtkYNVQ/hA==
X-CSE-MsgGUID: paaF+1V/REmDU/lyVU7ElA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69801904"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69801904"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:24:00 -0700
X-CSE-ConnectionGUID: a00JCS8eSy23KPu3u4DHqg==
X-CSE-MsgGUID: HhFpRM2QTQGpArPAsnkZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="173543810"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:24:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:24:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:24:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL/uvvKPQT2HSg6HsuWGWmry4jn5sCStVNub3Pf9x3jpDvEYi82KxXJd0yNlqnNfrmNMqhFv9TtaUwDuP7PE/NfX/gr9r9xxJGx7opnxSz2n2bEvkZOMnTc7AqW7nZCV83NunekvV+Y1AnViQy0TUcl6W/JPC2IMiVEaiz45CAsu7a9vq9MyJqBFqdL7VLiNGl7jvMKCq0I882fBGMaF+jE6IOn1rhPVZiXkG1lnIcXxqq4gjeT4frBwnFoJbeXtAualB+ox41/bQWr3ZI0qXCeBcZdOfQyusxx18btB9H6J6T3a35wzYSNdaYl73wQSS5dkPCzbPabQBjOnlcl+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEkUYIO+zVnaWThxRQp9kHjI/l+4ePZ/+NGwGrU10RA=;
 b=o0Y+9CyiKnvxj+3AUVt9fsGMBkpx0mZ8yT6urEAb2FF5SBlXOLKOMzSdxLR75QewjK/JHFFhxDOvtxhiUgdfWVGD5nvZrnvNYo0ONnoNAQTc3QJzJSzdVeZE3HQyLdCIeCvPsvYtNJskUmVsojn2m505kgLBDIF6zqxCMrxZRDr9x95HFwHNytHjIfZoxLlubJWQ2PMAuijqvsCxyD3nLyg6QJfdUIsQeal54JZ8hX5abe9Z/rSaCnws36VLSCjVjtT6PVyIzkkosgurN+yS6Oz/NmUuI5+zH+MaJnh3RtT0vPcRTfx/XPXbDwQog7dzchF1KXk/DMZCBWtSCHBlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Mon, 25 Aug 2025 18:23:58 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9052.021; Mon, 25 Aug 2025
 18:23:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Topic: [PATCH 2/9] drm/xe: Cancel pending TLB inval workers on teardown
Thread-Index: AQHcFem/ACFsQ5t8tkCx+eaQ1GSwB7RzqjKAgAAD3QCAAADygA==
Date: Mon, 25 Aug 2025 18:23:58 +0000
Message-ID: <d126d7e70a034297c39a65105b3c28d9ea135751.camel@intel.com>
References: <20250825175721.89129-1-stuart.summers@intel.com>
 <20250825175721.89129-3-stuart.summers@intel.com>
 <049695bfb6f8496cafef33310f574b0a52737761.camel@intel.com>
 <aKypcLC+rauQ7sBN@lstrano-desk.jf.intel.com>
In-Reply-To: <aKypcLC+rauQ7sBN@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4991:EE_
x-ms-office365-filtering-correlation-id: 3b4a614c-0955-4fd7-3d66-08dde4048ee1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QVhyZmc3RnVUcXlnSGtEdnlrMGlYbDJhS3pBRjVJMXNhSW0xVVVZLy9LS2Yz?=
 =?utf-8?B?b0k3Yk8vL2hCT3FhMzNMaFMvZTQrdkxsWmpGR3NzUXl3am5JNi9zT1Y0MGFJ?=
 =?utf-8?B?NzNkS2dYMWI5YzRvc3pXdHg0NkUzbGl3N3FIbjVjOW1laEJxNlNsMnRPc1o1?=
 =?utf-8?B?OVZ4MFlyQ2lEbW43REd4MzdwaURxZkZYTEwyMlhhYXl6NWhSYWpLMExwNnFU?=
 =?utf-8?B?Y2gzOXJBTFBxejZwSWo0cU9GeHZkdnBoSk9qWTZJTjUyUko1WGlzdWhvM3BX?=
 =?utf-8?B?U3EyK3NGc2VtZEZOU2ZQaExHdnRIaUFVN0p4NEdBRUJoOElxd0Yza0lGNHRZ?=
 =?utf-8?B?c2F3QXlvbWVoTDd4M0FRenY3UlpIOHVlT2hzbjFyUnVoUGxCc3JWbC9OVVRK?=
 =?utf-8?B?K1NJVzJ1VjNYeE9PbzJmcmZDTzU0MVErNmpOcldyY3Q4NzlCZVZSc283Wk5R?=
 =?utf-8?B?aWE1MEhuY3ZTd040ZnJGMGE1QW95ZVpoU05zdTE1TktZbHZGaG14VCtjMUpP?=
 =?utf-8?B?azR6Z3FIejRkVGJOeWxxRkowVHVFTUtzc1REQ2w0TmtMenRqMG1YZG4vYmFv?=
 =?utf-8?B?NDBuVi9Band0czRzdHhQUEpCd1oxZHNEaUwrTHB5R3hhbEJreVNiWDhOby9E?=
 =?utf-8?B?Y2phTTFDL3ZUKy9sUDByM0tvTzNIenN3ejVmeVgvT2doNUt4N3djeXJ3c1d1?=
 =?utf-8?B?cUxtQ25TS0xSc25DdlFNd2xmckNxVmtiYnpVeCtEdGpZVnM2aVZWenR2MWha?=
 =?utf-8?B?Q3ZpWXV6aFNGYUR3NXpFb010VXpZQ1ZoMmNuVjIxSnh1UDJLV050ZkF5UmpW?=
 =?utf-8?B?UFJjUk82aWV6ajhxaXY1bVp3bCtJQ2dYMWFBZWIvbE5nRDBkK1UzcnJiUVYv?=
 =?utf-8?B?WVZlK1RWaWFvMGtGZncvWjZhSmRsKzMwMzYrVEpET2xqU25GY2hjRm1UVWdm?=
 =?utf-8?B?ZlkzVFc3Skh4ZExFVXBKcnhTWnczeGZVNGNaSzRHZEovWk5DMEluSnJ1M2hH?=
 =?utf-8?B?YnQxWXRtR3puclg3UVMwOVFickZBc09hQzFBclZGWWFaa2xCLzdKS1VwWTRu?=
 =?utf-8?B?L254OHlwQUl6Y0VpYWM1d21SMSt3OFhiSjU0aWdYZ3M4WHJtTHZMNGRZTTZH?=
 =?utf-8?B?TW0wN2NEbjA2WlRmNHBveW12dkhJaGxSMzVNZ3FBVWlTSmZmTmhTN1pXYjFJ?=
 =?utf-8?B?Z08vUjIrZElrNWlVVWVsOWdjSmlaRWkvUnhCZDlaSVVOVHVoT2hzbWZwdGNp?=
 =?utf-8?B?b1NsdVdJczdzcHZCUTEwM040eVpDOHVLQVh6WlljMW1mNmx3Z1VleGVmdlQx?=
 =?utf-8?B?Ymphckwrc0h2S0czZ2NZR1JqTEkwV3ppR25LTXFFeGRFS3dpcTlzdHNGSE1y?=
 =?utf-8?B?QWZZRGYza21hQ0NlVWlWc0Y3bEZURy9ZQ2FWdkozNVFuVis5ZGRPN2NibGF3?=
 =?utf-8?B?TW8xaXZmWnlUcHd3U0FJWE5TTlhObTlrOWtuWVVsbE84enhqb2ZKOHAzTGJP?=
 =?utf-8?B?ZjFVV2pwc1pmWFgweU85cHo1V1diTjV3VjJhTXF2N1EvbzFVQTV3TTU3c0Nh?=
 =?utf-8?B?YUFOenhtVHYyNGJtSXp4TG52VGZ0TUc1REpkL2RZT2NPcDRIZENjUm9pejA3?=
 =?utf-8?B?QVBSbVBSWExuWVN0eWpVbmFXOWVic09QS0UvVDNQdGdDekV6aElxaFhvOThw?=
 =?utf-8?B?ZkxObzJJNW1WTHAvWXZsQ1pMT3BKa3RrMzlmdG4wNTF2UzlvOVpuazlWQnN0?=
 =?utf-8?B?K1gzK2JXaWRZR2FhU0Y5Qmo5TWdTb2dDcXJFMUFZMnpVU3o2dnhwRll0MTNG?=
 =?utf-8?B?QWxZVEFmWm9CUFlaYmdDUWJJZ2JjbkcwV1RsQzVJYTZVZ3dxejhrVzJHVUNx?=
 =?utf-8?B?UWg4Mmh1UWxsdlRFZ2x6SSt4cUM1eEFVQUQ2ZVE3OGlYM0doSDJ5dHQ4UmpY?=
 =?utf-8?Q?KJSVaDomu8U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eURsTGtjNHFycTdNa3RiTkZhTWpacVhuSk9RVDR6aWhvckNLUThhTGI1N0xW?=
 =?utf-8?B?WnpZR1dkNjRaeWxVQjBxTVpjRTdwZS9MdEVQOXJUQVpFU00wTWlGa0p2U1ln?=
 =?utf-8?B?NmlkN3ZYclNlNnNONjFBMUxWNGRKRzJOV0xLeVJZM1YyaS9JMExsYzlLU3Zp?=
 =?utf-8?B?NHZQeEZkYm8yZ3FObUpUeWJhZllhRmRCWUowcHMvVVBjaDFKZ1Z2U29tSkJm?=
 =?utf-8?B?K2s4dTJvZnlQWVpOT2lGVnN6d0tUNXA5d3A3TldPTlRmYUZMdkFnTGIwaHk0?=
 =?utf-8?B?cWlKbGVpbFBSTWQ2bmhiMU1zRFhlY2ovd2VsUDQxWlhRaEJhVjZ5WHNPekhH?=
 =?utf-8?B?Z3pKU3Joa1VTeEdVQXhBRlpvelZIVGZlczh5OUhnRm9BOHd6eFd6R09WWHFl?=
 =?utf-8?B?MEt5RWpoV3k0RTR4YXZScnRnZDVFdFlRNEZRUnE4ZktrdjNnYXpQV0NjdC9m?=
 =?utf-8?B?YktESENtb29BNGNoeEZEUzEyeFdlQ3hKNmtrN3gvVm9MZ2g5T1E1SzJoditk?=
 =?utf-8?B?VXhCekxMQjVWQjc3cjVsRWlzbmFuaDJGWFlYNUh0VDZsc0pGejA0Z2Z6UnlZ?=
 =?utf-8?B?ckZUbWVOc0lPRFI1WVdWV1JvbStGZlRDMWM1ZlVxUkh6OGV6dVdVR0pjVGhJ?=
 =?utf-8?B?MnBqNk1XZ3Bsek5MVjhmUUZxcFQ5VUQyQnBNRkdPWkJaeHJDWGZIUGlhRWJj?=
 =?utf-8?B?bGdhR0hZSlIva2UzaXB0clJJYnNGcnpiZ1M4VGV1OUlXUmZTWGVOTFJrcitp?=
 =?utf-8?B?RlRmb1NzOFlSTTdXTUMzeExtUEpsOUpDV2dsSUhWeXd0VkRrM2VUbTk3TDNV?=
 =?utf-8?B?bk4yS1pGem5HclFRUWtjZ1poZW1HL2g5ZFdUMld1V2hOUFVWbHQ0cU1oWDdJ?=
 =?utf-8?B?aWRsYXBPVzhhdWFzbzdnTGhBY3BjUFNkUWd5dUZxNGFNdWRYMEZja2h4WVJ2?=
 =?utf-8?B?QkxtY283NVpPazhTd1RNNXhvWkZSZHhXRnRaODl5RjBlcVZ5WCtUR2FJWmc4?=
 =?utf-8?B?S1ltUkRkY2FzQkFiR3YyQkhLeDVyTWpqZFhVeW5vQWFKU29kTjIzLzdQSkd4?=
 =?utf-8?B?S1lYWEI4Z05sdUxDcGh5SE5VR3lYUUJ1ZGFkSm1sTy9DQ3pFbnBBbjM5U0Qy?=
 =?utf-8?B?UGg4Q1NSYjhnL1Y0QzM0MjRZQ1czcm1saDlnTkRkNXRObHhuYk4rczZjMzN4?=
 =?utf-8?B?QnZmdTlXeUNqdGYvQXNFTDhDUXVXT2F5cmd5Q2VCcW1QdDJDemFNaTZhQmZP?=
 =?utf-8?B?RHpVRDd3NkRySTNZYXAxc3dtWm9OdW1tSW9UbHFTTTk1L2t0cUVkZitYN2Vp?=
 =?utf-8?B?MVRrQ0xXYlY0OHgxeE9PMG1FL0NpOUt5ZkYzL1gra1ZaYjRKQlhZRWo1MHlG?=
 =?utf-8?B?ZkluVCtpS1F4K3k4WnlWWWlheWRxWUV5U011NHVxTmtPVncvNlRWRmJGUHZx?=
 =?utf-8?B?WGZ4QzNRQ1N3RTdjb2ZWN1RNM0ovT0JSU1ljcjNXVU94dG5jTWZNNUpQaTNK?=
 =?utf-8?B?ZzZTRkRVMTZUWURlT0g4OWs2UW0rTVd1UnJLTmhkQWZLVHA1V09qdnVaWGha?=
 =?utf-8?B?OTc5NG9kb0l6cGs4VVlxSTE4OFd0YmlWcDZiOUtCSHJlcnFIQTk4YTJrNEJw?=
 =?utf-8?B?a3R6VXBQc1d3QU1mL3Z1cW1vOUJsL0FFMG4vb05Rb0VpUnhQbXcyOHBBL3g0?=
 =?utf-8?B?ZVMzdFRXZVhaYUlPOFJHM1ByYkY4elpKZk1HRWI5aDFEZDVsOEdiY1NJVVAw?=
 =?utf-8?B?VHNTb3FvakZyNE5sRDJXczlkUGl5aFZpb0taMW90Qk5rRGRvUHN0YzZObWpF?=
 =?utf-8?B?RXNjOVlHc2E3MGdIaE9wN1BDSjR3MmgwV2FaTlRjUGdvbDJYR1FLSUNKWXpK?=
 =?utf-8?B?dXZWN3lEcU5Ddk9xR3dIWExpUU43Z25FNm42cndnK0dHdnB4VFdSZThDS3hW?=
 =?utf-8?B?emtxZjUxY2dFWjM2MzVPRC9CeGtOZGk0RlVJckxSSjE0eW5UdkdCT3FKMEYr?=
 =?utf-8?B?ZVhzTnhNOENWZGZONDA0azRmK2JHSERxQ0Jaa1hyMXdIdHdwYlJ5TmJKMjlM?=
 =?utf-8?B?UXFUTmhZNWQvUDIzL2swZ29KMm5mV2VaZWJDRndtRzh2Nzg4emYrVFBaSm5q?=
 =?utf-8?B?MHFMNVBhTjFuNi85RktaOFM5ajZsSmpkM0R0NDduVC9WSnpxYnljR3VXdWdw?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D67A9BB2A061849B744BB118F1E4BD1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4a614c-0955-4fd7-3d66-08dde4048ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 18:23:58.4198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OU7qW32Hn/QmApGdYxW2StbvLqu63VJE7kFPW0uEnb18eLzZ8+vUWZg7ARz6rVbEo71RN9eFIA9ElyVCYhcHkLFGTtK5B0FCkTXiDO7bdtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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

T24gTW9uLCAyMDI1LTA4LTI1IGF0IDExOjIwIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIEF1ZyAyNSwgMjAyNSBhdCAxMjowNjo0NFBNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI1LTA4LTI1IGF0IDE3OjU3ICswMDAwLCBTdHVhcnQg
U3VtbWVycyB3cm90ZToNCj4gPiA+IEFkZCBhIG5ldyBfZmluaSgpIHJvdXRpbmUgb24gdGhlIEdU
IFRMQiBpbnZhbGlkYXRpb24NCj4gPiA+IHNpZGUgdG8gaGFuZGxlIHRoaXMgd29ya2VyIGNsZWFu
dXAgb24gZHJpdmVyIHRlYXJkb3duLg0KPiA+ID4gDQo+ID4gPiB2MjogTW92ZSB0aGUgVExCIHRl
YXJkb3duIHRvIHRoZSBndCBmaW5pKCkgcm91dGluZSBjYWxsZWQgZHVyaW5nDQo+ID4gPiDCoMKg
wqAgZ3RfaW5pdCByYXRoZXIgdGhhbiBpbiBndF9hbGxvYy4gVGhpcyB3YXkgdGhlIEdUIHN0cnVj
dHVyZQ0KPiA+ID4gc3RheXMNCj4gPiA+IMKgwqDCoCBhbGl2ZSBmb3Igd2hpbGUgd2UgcmVzZXQg
dGhlIFRMQiBzdGF0ZS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1l
cnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKysNCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24u
YyB8IDEyICsrKysrKysrKysrKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxi
X2ludmFsaWRhdGlvbi5oIHzCoCAxICsNCj4gPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNl
cnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gaW5kZXgg
YTMzOTdmMDRhYmNjLi4xNzhjNDc4M2JiZGEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3QuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMN
Cj4gPiA+IEBAIC02MDMsNiArNjAzLDggQEAgc3RhdGljIHZvaWQgeGVfZ3RfZmluaSh2b2lkICph
cmcpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndCA9IGFyZzsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gPiA+IMKgDQo+ID4gPiArwqDCoMKgwqDCoMKgwqB4
ZV9ndF90bGJfaW52YWxpZGF0aW9uX2ZpbmkoZ3QpOw0KPiA+ID4gKw0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoGZvciAoaSA9IDA7IGkgPCBYRV9FTkdJTkVfQ0xBU1NfTUFYOyArK2kpDQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2h3X2ZlbmNlX2lycV9maW5pc2goJmd0
LT5mZW5jZV9pcnFbaV0pOw0KPiA+ID4gwqANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+IGluZGV4IDc1ODU0Yjk2M2Q2Ni4u
ZGIwMGM1YWRlYWQ5IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3RsYl9pbnZhbGlkYXRpb24uYw0KPiA+ID4gQEAgLTE4OCw2ICsxODgsMTggQEAgdm9pZCB4ZV9n
dF90bGJfaW52YWxpZGF0aW9uX3Jlc2V0KHN0cnVjdA0KPiA+ID4geGVfZ3QNCj4gPiA+ICpndCkN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF91bmxvY2soJmd0LT50bGJfaW52YWxpZGF0aW9u
LnNlcW5vX2xvY2spOw0KPiA+ID4gwqB9DQo+ID4gPiDCoA0KPiA+ID4gKy8qKg0KPiA+ID4gKyAq
DQo+ID4gPiArICogeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9maW5pIC0gQ2xlYW4gdXAgR1QgVExC
IGludmFsaWRhdGlvbg0KPiA+ID4gc3RhdGUNCj4gPiA+ICsgKg0KPiA+ID4gKyAqIENhbmNlbCBw
ZW5kaW5nIGZlbmNlIHdvcmtlcnMgYW5kIGNsZWFuIHVwIGFueSBhZGRpdGlvbmFsDQo+ID4gPiAr
ICogR1QgVExCIGludmFsaWRhdGlvbiBzdGF0ZS4NCj4gPiA+ICsgKi8NCj4gPiA+ICt2b2lkIHhl
X2d0X3RsYl9pbnZhbGlkYXRpb25fZmluaShzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+ID4gK3sNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fcmVzZXQoZ3QpOw0KPiA+
IA0KPiA+IEkndmUgYmVlbiBzZWVpbmcgYW4gaXNzdWUgb24gZmF1bHQgaW5qZWN0aW9uLCBydW5u
aW5nIGluIGEgdGlnaHQNCj4gPiB3aGlsZQ0KPiANCj4gSSB0aGluayBmYXVsdCBpbmplY3Rpb24g
Y2FzZSB3aWxsIGJlIGZpeGVkIGJ5IFsxXSB3aGVuZXZlciB0aGF0DQo+IG1lcmdlcy4NCg0KT2gg
ZXhjZWxsZW50LiBJIGhhZCBzZWVuIHRoZSBzZXJpZXMgaGVyZSBidXQgaGFkbid0IHRob3VnaHQg
dG8gdGVzdCBhcw0KSSB3YXMgd29ycmllZCB0aGUgaW5qZWN0aW9uIGVycm9yIHdhcyByZWxhdGVk
IHRvIG1pbmUuIEknbGwgY2hlY2sgdGhhdA0Kb3V0IGhlcmUgc2hvcnRseSBqdXN0IHRvIGNvbmZp
cm0uIEkgZG8gaGF2ZSB0aGUgYmFzaWMgZXJyb3IgaW5qZWN0aW9uDQpjaGFuZ2UgbG9jYWxseSB0
b28gdGhhdCBmb3JjZXMgdGhpcywgc28gbWlnaHQgZmxvYXQgdGhhdCBpZiBpdCBkb2VzLg0KDQo+
IA0KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTI4NzAv
DQo+IA0KPiBGb3IgZ2VuZXJhbCBzYWZldHkgdGhvdWdoLCBJIHRoaW5rIGNhbGxpbmcgdGxiX2lu
dmFsaWRhdGlvbl9yZXNldCBpcw0KPiBhDQo+IGdvb2QgaWRlYS4NCj4gDQo+ID4gbG9vcCwgd2hl
cmUgb2NjYXNpb25hbGx5IHdlIHNlZSB0aGF0IGEgY291cGxlIG9mIHN5c2ZzIGZpbGVzDQo+ID4g
d2VyZW4ndA0KPiA+IHByb3Blcmx5IHRvcm4gZG93biBvbiBhIHByaW9yIGRyaXZlciBpbnN0YW5j
ZSwgZm9sbG93ZWQgYnkgVExCDQo+ID4gaW52YWxpZGF0aW9uIHRpbWVvdXRzLiBVcCB1bnRpbCB0
b2RheSBJIHdhcyBvbmx5IGFibGUgdG8gcmVwcm9kdWNlDQo+ID4gdGhhdA0KPiA+IHdpdGggdGhp
cyBzZXJpZXMsIHNvIEkgd2FudGVkIHRvIGJlIHN1cmUgd2Ugd2VyZW4ndCBjYXVzaW5nDQo+ID4g
c29tZXRoaW5nDQo+ID4gaGVyZSwgcGFydGljdWxhcmx5IHdpdGggdGhpcyBfcmVzZXQoKSBjYWxs
IChvbmUgb2YgdGhlIHJlYXNvbnMgSQ0KPiA+IGhhZA0KPiA+IGRlY2xpbmVkIHRvIGluY2x1ZGUg
dGhpcyBpbiB0aGUgb3JpZ2luYWwgc2VyaWVzKS4gVG9kYXkgdGhvdWdoLA0KPiA+IGV2ZW4NCj4g
PiB3aXRob3V0IHRoZSBzZXJpZXMsIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoYXQgYmVoYXZp
b3IgKC1FRVhJU1QNCj4gPiBvbg0KPiA+IHN5c2ZzIGNyZWF0ZSwgZm9sbG93ZWQgYnkgVExCIGlu
dmFsIHRpbWVvdXQpLiBTbyBJIGRvbid0IHRoaW5rIHdlDQo+ID4gc2hvdWxkIGJsb2NrIHRoaXMg
c2VyaWVzIG9uIHRoYXQgZGVidWcuDQo+ID4gDQo+IA0KPiBJIGFncmVlLiBUaGUgcHJpb3IgQ0kg
cnVuIExHVE0uIFRoZSBmYWlsdXJlIGhlcmUgWzJdIHNob3VsZCBiZSBmaXhlZA0KPiBieQ0KPiBb
M10gd2hpY2ggbWVyZ2VkIGxhc3QgbmlnaHQuDQoNCkdyZWF0DQoNCj4gDQo+IFsyXQ0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNTIwMjJ2OC9zaGFy
ZC1sbmwtNy9pZ3RAeGVfZXhlY19jb21wdXRlX21vZGVAbWFueS1leGVjcXVldWVzLXVzZXJwdHIt
cmViaW5kLmh0bWwNCj4gWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvMTUzMTk3L8KgDQo+IA0KPiA+IEkgc2VlIGEgZmV3IHRoaW5ncyBpbiBjaS1idWdsb2cgdGhh
dCBjb3VsZCBiZSByZWxhdGVkLCBhbHRob3VnaCBJDQo+ID4gZG9uJ3QNCj4gPiBzZWUgYW55IHJl
c3VsdHMgaW4gdGhvc2UgdG8gY29uZmlybToNCj4gPiBodHRwczovL2dmeC1jaS5pZ2suaW50ZWwu
Y29tL2NpYnVnbG9nLW5nL2lzc3VlLzcxNzU/cXVlcnlfa2V5PWE1NzA3YTRkM2FlMmViYjhjMDRl
ZjZjZWEwZWY3NDczMjJkZjRlZTENCj4gPiBodHRwczovL2dmeC1jaS5pZ2suaW50ZWwuY29tL2Np
YnVnbG9nLW5nL2lzc3VlLzEwNDEyP3F1ZXJ5X2tleT00MDJmMjYxNTQwNmM0YWZhNDgxNGEyOTg0
OWIzMTJhMGM3YjY2ZTljDQo+ID4gaHR0cHM6Ly9nZngtY2kuaWdrLmludGVsLmNvbS9jaWJ1Z2xv
Zy1uZy9pc3N1ZS8xNTAwND9xdWVyeV9rZXk9ZTBjZTYwMWFlNjllYzc2YmJkZjI3MjkzZGMyOTE5
YmEwNzM1N2RlMw0KPiA+IA0KPiA+IEFueXdheSwgYXQgbGVhc3QgZm9yIHRoaXMgc2VyaWVzLCBJ
IHRoaW5rIHdlIGNhbiBpZ25vcmUgdGhhdCBpc3N1ZS4NCj4gPiANCj4gDQo+IEFnYWluIGFncmVl
LiBJIHRoaW5rIGlmIHRoaXMgQ0kgcnVuIGlzIGNsZWFuLCBnbyBhaGVhZCBhbmQgbWVyZ2UuDQo+
IA0KPiBXaXRoIHRoYXQ6DQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJy
b3N0QGludGVsLmNvbT4NCg0KQXBwcmVjaWF0ZSB0aGUgZmVlZGJhY2sgYW5kIHJldmlldyBNYXR0
IQ0KDQotU3R1YXJ0DQoNCj4gDQo+ID4gVGhhbmtzLA0KPiA+IFN0dWFydA0KPiA+IA0KPiA+ID4g
K30NCj4gPiA+ICsNCj4gPiA+IMKgc3RhdGljIGJvb2wgdGxiX2ludmFsaWRhdGlvbl9zZXFub19w
YXN0KHN0cnVjdCB4ZV9ndCAqZ3QsIGludA0KPiA+ID4gc2Vxbm8pDQo+ID4gPiDCoHsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBpbnQgc2Vxbm9fcmVjdiA9IFJFQURfT05DRShndC0NCj4gPiA+ID50
bGJfaW52YWxpZGF0aW9uLnNlcW5vX3JlY3YpOw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmgNCj4gPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uaA0KPiA+ID4gaW5kZXggZjdmMGYyZWFmNGI1
Li4zZTRjZmYzOTIyZDYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdGxiX2ludmFsaWRhdGlvbi5oDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdGxiX2ludmFsaWRhdGlvbi5oDQo+ID4gPiBAQCAtMTYsNiArMTYsNyBAQCBzdHJ1Y3QgeGVf
dm07DQo+ID4gPiDCoHN0cnVjdCB4ZV92bWE7DQo+ID4gPiDCoA0KPiA+ID4gwqBpbnQgeGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbl9pbml0X2Vhcmx5KHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4gK3Zv
aWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9maW5pKHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiA+ID4g
wqANCj4gPiA+IMKgdm9pZCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX3Jlc2V0KHN0cnVjdCB4ZV9n
dCAqZ3QpOw0KPiA+ID4gwqBpbnQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9nZ3R0KHN0cnVjdCB4
ZV9ndCAqZ3QpOw0KPiA+IA0KDQo=
