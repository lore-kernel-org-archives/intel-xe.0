Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7919C606A32E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OC6ImzSJ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=QJJNhCIC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3528310E4BA;
	Fri, 13 Nov 2026 19:51:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D9810E4BA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794599506; x=1826135506;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UwMFVbkueWSLB8Q8bqVkgs3SJNAXOJq6GrxUnyynHQo=;
 b=OC6ImzSJlHRsBfUKilAeVnkfefLQtfXpCb0Qw8OgBtlEFjPYZWi0vH1x
 oUtotn1JqZSX+Ao2Z4CxKJC/3kqIIExLFX5Em9HA9T19teHx3DbaQUJpz
 A/2o9mc2RlKVys6EsTHaelTSw+MMCib7Q9PyToYzITLcD5MbLZ+tWevvr
 3G24iU084NqvVlH4UqPnA0euhE7BM25/eQk/qXA/23UnvZbaTNtXAjjov
 d1qyYhIm4rFWiWKw6l1jTK7YvUmVqPgg1giSQkbqtr0cJD9UxobB22TMr
 J2/QhEpgCWUnZYFJZ7HXLLjCtQeWf8WqAoLKlz2Ce2azqMNflKE8JK+Wv Q==;
X-CSE-ConnectionGUID: dQ0h3YTiQZKj1wCLtLG8pw==
X-CSE-MsgGUID: pJ2/BoCpTRuVUunaukrGdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3302764"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; d="scan'208,217";a="3302764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:51:45 -0800
X-CSE-ConnectionGUID: QsoZSPIrS8SwKjEp7OkvhQ==
X-CSE-MsgGUID: 07v7xt1JSwaTyHvnnig/ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; d="scan'208,217";a="9164723"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 11:51:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 11:51:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 11:51:44 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 11:51:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4eXZfLm1EJeictgMxfXK6jQKCwdHMG3380EDyCqR/YbXK/xvbXbyBxgOrPJLlAx92gWF8YB9cawofVhHdZ4oGaxUZ4IIthL/jpn8JSUTIPirrN58i6PYcU/pJl/xF25W6hodnUWIdBo6vC/HoKxVKIKD1S5YVTjy0LU6ERvnAiJ3BqcdcGx6tHuWw/cmLnA2M+QTXVeMSQQK+8TXlclILstttiOdbkBTOWBQwGuds8ZHeMYHNEkmisTz9W2h8avWzJfBUebX5ikDnL58akHt4bhfN+BgztHnkNcWHvAdF2a54t2lJaxlQQry27xiLAgDWyqPNnjJIxkzElD7RWDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/XxVwXCQL7+EKhkHoReZ1WLWNHD7IEvaVYuO8hENaA=;
 b=o+vKnxxp4oCY5D8K+CvbrFYV5eKw6I3edoODf6Z/5ASvFnwu8O11A80EKT/BrJaeLjRsWeu9s7BszL9JoNToeOHvW1M341ohmukgiiVmcDaZVnWMVUg14JLBuq0dff3EpjfALZr8ApOt7P+T+xyNB/ixQ9rKKdYIw/kg0urHSuuWpSMA/dPk7y8fn0ZFs9YXXyMAwlCuW+4arP6WLUo/Ho4HwBQoAMmTlp9bVm9or+M6gKEURzRe/HjMlYsgv6Z9YTcp8Tw/bkj62z+EoQsdAuVdFdvFktabLvt+KhnYaad+q3ZJpYiAuUz5e1u9Vpaw7T6Ref5zcmqoLyCAyfyYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/XxVwXCQL7+EKhkHoReZ1WLWNHD7IEvaVYuO8hENaA=;
 b=QJJNhCICtrIuB5natDhiTazvubGStinaMxT5JY+Sdo7vnMFkDDV0Hl17dLuZ5gr31F/WXdQ7HDzXm1sU0DTRXdHTDNlkJhhD2t2EuiifBGztuIVtW6YCzGnhvIu4rjFeURe+G3/x6/pyIytxPSj4pibmkcHHEjlp6gbVbcjyAmQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by IA0PR11MB8420.namprd11.prod.outlook.com (2603:10b6:208:482::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 13 Nov
 2026 19:51:23 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0615.007; Fri, 13 Nov 2026
 19:51:20 +0000
Content-Type: multipart/alternative;
 boundary="------------5oaWY5R3w4e7p7rUUG09GqQ6"
Message-ID: <f4facd87-04f7-47b8-8cfb-dfa42fae965d@intel.com>
Date: Fri, 13 Nov 2026 11:51:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Reset GuC before unmapping its post-hwconfig
 buffers
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivekanandan,
 Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Stuart Summers <stuart.summers@intel.com>
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
 <at9epeRtNe-eKEdY@bvivekan-mobl1>
 <3032c66b-9718-4917-b335-caea298c794e@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <3032c66b-9718-4917-b335-caea298c794e@intel.com>
X-ClientProxiedBy: SJ0PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:a03:333::7) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|IA0PR11MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: fb9844d8-471a-4fe0-cace-08df41bf7cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|10067099003|8096899003|5023799004|4143699003|261028144727099003|11063799006|56012099006|261022075727099003|261026121527099003|261009223027099003|261022105027099003|261102123227099003|261021121427099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: sWxFKvEeejZYeG5diXCGAoCHKmCbsAboVabLM1AvLVdEtasG66sJUFAgJo8VqozzO78NrervXloQYgC0KJr5RO9CrK3sMc/V9gkKhwKo4cLQf2Hz7FXyzRRP5mkt8pqa2Lr1o7C/PIGzZNcysxC+GLnRQAeqE1QCzQ+0o7VYxkiAyAfyUenY/AnTCWYvyZ8SjozYLJiP+X91lMpUlKGMWBSX5tlB35j2gdPvTlMJwBy8knQ73faDxRcFUVli8w6CqGHxug0X/Q8XsuIzi8qjeSVWJcPwuh9yeXmDxsy2BB9L7Jvi+2KYLSZrYshTuXz0YQApZjRIOuJAvnOOOhKCt4MR9B0RipIa9Ajbm4IZMmwyri1chPUCqTrv0yv/WlvZQ33oMMuF8+ezvQFPKrm3bshRXIzOGUsI2D3pnsMaDvZnkn5HRDZk+FMnfe/OvaoSkm+6yfMAA/PY3yZvUrenyAk0KbBg16wXZSCuTFg2oS4pZBAVqU4u35vLFt9VqpLlKGhzq8QAOIzT3QmXR8JIs0JcWaksm8aJmKriAkJXx2YSXtKwmhBnbgfNMY06cWCVrIR4EueUgzGg/Wg9GmXs8S25lFL2zBa8FpGysALb6VzEq8kujSzRFuO+l/xcGE+rh2Szbr3xzfJ6m7EvH775tXCvtxGUP3d0TTA5d0EAftc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(8096899003)(5023799004)(4143699003)(261028144727099003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261009223027099003)(261022105027099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStEV1ByTzNCU0VUZGM1NFYyaWpzZGdERURYUm9rSVN1QkVZQzdKSlgrK092?=
 =?utf-8?B?RnYreFZIR2VidjY1L3dMaEJSRExnOUU0Q01PRWI1V0NPOU9NbmYzRXFYcG9S?=
 =?utf-8?B?dnEvSFJ2R3JCNTJ3MUFZMWhIVUJIdFZueFdpbzVrQWRaOG9TY2loYmwzQkRU?=
 =?utf-8?B?WE01dnZoZXA4ODJQdXRsN3RYNWNyelVlemVGblhBcVh0Ynl6cXNhaDVFcWRK?=
 =?utf-8?B?OUdIalVsTU4vYnNXR210bHlzZW1FTUl3UndpWURXMlllaEo2R0tYcGNzbGFt?=
 =?utf-8?B?a0ZjMzM1Zm5GeGx5VWxGaG9HSlZDMHpDZmZvWVhUdVlNSHJ2SG9qQVlSanEz?=
 =?utf-8?B?eExCRWVUbFpvMnMrOGk2S1NDSTZFeG9wNmZsMlJDY1BjMzYyZU9IQzI0WDB5?=
 =?utf-8?B?U3lOc1JxcnVMK29lMSs4QVRMVkxQUzVEcW4yS1U2dzNpaU5YNkI4MHVMQ2hG?=
 =?utf-8?B?dzQyZEpWSzE2aWJneDFsb0NsZytaRXYyZHpFejg4MHpPYVQyUDk2WXZXU2pZ?=
 =?utf-8?B?a2ZYWG5CbVhSd0VXelBJbEhhb0tKdVJieUdvT3Z0TkF4MG5FK3hzVGJyQW9F?=
 =?utf-8?B?Yzl6bHVQOUhNT2xnZjVkc2JQOEM5K0J0YXVITHdQSmwrT0xJQjlhL1I3WjM3?=
 =?utf-8?B?akFmSGtVblRBNFk4Q2cvNEMvWHN2dFdqR1I0R2tUS0MyRzFiSm05dnlvQTg4?=
 =?utf-8?B?L0VOaTB0R1N1QTFTUXpXSnhNLzFrems1SU1YMy9UTi9oZWpzeEtER2RVU0xL?=
 =?utf-8?B?bXNSUDlOMFpXSmFZWmZxUTErWXdMeGNnSEhoUVcvRzU1anBXcEhJMFJQNml5?=
 =?utf-8?B?b2VYVDBqYlVCZHluSnVjY2tZUkF5U2U5cFI3VlhtemozT2tmcS9YRTFqS0wr?=
 =?utf-8?B?RXJhNXhzbEloakRaM3daSFc0REdBY2d0M1JIbUxsRDJzRjFBaW52SW5WUnpW?=
 =?utf-8?B?Q0ZnMzR2b3FYcXJzZEpEQUErNU85dVpkN0p0NGpOZ2dXSnBrb2QvWmZSQmRO?=
 =?utf-8?B?dTlsTzYxd2pPNWNtZEZ5WXpteDFlNDVGNnU3RG51a3ZVWlRjN1k2eVdscTVU?=
 =?utf-8?B?bWhZbzVJcFo0alBYWFRGU0NaVUtFd1pnUkVxOVF1bEM1a0EvSXdIdDM0UVRt?=
 =?utf-8?B?YU9EL1poeUN5VUJ3THkrME1FZUx4Y3VHVi9nQWFjY0Ura1NoSnRnbDNZbGJx?=
 =?utf-8?B?Z3hEYkFuSTJ2VDdVODNHRzFlbTM4VjB6ZloyK3VmQTRQUWw3cWZtMjl1TFR0?=
 =?utf-8?B?QnNnUVJnZWFmTFpyejBiRllNelJHMzFJcVNNaVcxZWdjWGQvNVdmc0FnT2I3?=
 =?utf-8?B?ZTBzWCtybGdWeVZGV2N4K3p4RUJLNTBNNlBrczNiT0dkZkFnWUtVSGx6VXZk?=
 =?utf-8?B?VmVocmZjWGZWYXUzbnlFTmNuaUVmZ0VRWWVnQmE0b05DaWRkN2Y3b2k5cmE0?=
 =?utf-8?B?azZ2Q1M0bmJXczNmOVlRdlVBTCtrYUVISmlKZk9WVWV0TTVtK25JTlB5dUtP?=
 =?utf-8?B?T1RwVzkxb3BGL0Zqdjhvd3MvUkp5KzhCeVNQelN5SjFuZkdnYjY5cXlUbEhu?=
 =?utf-8?B?THZVL0phQlpNdmNvSDdVcTJmSjhHSWhtYzN2eU5yY1JyOUo1K1pIbTV0N29Z?=
 =?utf-8?B?RW5hUzZidzVESEtJdGxGWU42OGZIcVRBUlhueUhuY1BMaDBQR2NmaEZDZHlV?=
 =?utf-8?B?bDcwTVJSc1RQYTdlckk1SDczZ3VLOHhCaEhhSVo5YXRZT2RqM0oyVnNYTTE0?=
 =?utf-8?B?R2RvNXV3bERjWWV5RTN3di93Q1lTNm1mNmxXVk1sbHFzVEVIMmt6VG83WXE2?=
 =?utf-8?B?R1ltNXl2STVPZlFGL3pwdzVjZ0RmdUxFK0kwNjZJL2l1TWlxVGVHeVVOK1pK?=
 =?utf-8?B?V3hhS1hweW5zaGZnT0NuZVltaXI2cTdRR2djdDZ4SHAyRnpIMVpoNFM0MDVw?=
 =?utf-8?B?cDd3bjNLTGJvTzI1eHgwZE1nRmMzWTBQK2VPaVVnTnptckdyR2lUT1dNSjZ6?=
 =?utf-8?B?eE44U0gzMXhndk1scjJ5cDBuMmpnSVhrNkl1SlA4UEMxeTFJaXN1T0NORElT?=
 =?utf-8?B?eHl1R0xmd0VZWnc3bmIwYTg3NjZrcEd6OFhwWkFZTWI0Mjg5aTFuMC95dGJZ?=
 =?utf-8?B?VWd2R0NMYXNKUGYxc1VyQXBMbjNLWmtROU9qWnNWcTZjOTNRcXU1eEZvOTFQ?=
 =?utf-8?B?RGVkWHZta09oZUFWQnZpRXZDRVZzaTJXSFl0NEEvbXd1R2o5UnQxeGxBblor?=
 =?utf-8?B?bnZra3ZCTTI4SE5hdEVKSG9BdXppaC81aXB5ZFljeFA4a0xNZFJPbU0zbHRv?=
 =?utf-8?B?TE5lL1k1cG1HYVAyRHhWN2FvRHRQWm1QbmZGNVdwYXhMV3pUZVIraUtiOWNL?=
 =?utf-8?Q?vEFIbDh5y9RgCfuk=3D?=
X-Exchange-RoutingPolicyChecked: eVMYOlxahUfoG1QrTHcwevzj/QQjxcCT0PxOysLvNJsG40Bet2Jh/li6MLgpJLeE0IkqyjhMj0/ErBIRlDY3zDXkoJ+8uNeaXhrwUU14wWGpWP906V13DtHNAPm7fy/G/qx82uGDK2PvJ67Saj1vGJ4v3FeyvD5ZYNFLBf+jDpiBE8DxoJJy5uZVXGGbRz3MGqYsn7t/aJOGJMEX+hTfFUGAl02Lhtqcq6B5HogUJbPY9u2QRm7CmJ47T2X/CEPNra9X0cEvziyojOG1kHWffx3NCAWPXW+PKLgfcgxFW8XvhmoQ5ldhn5qXsnpHEwTZnexyt9oiq8UJ6dCcKTF/nQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9844d8-471a-4fe0-cace-08df41bf7cd0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 19:51:20.0705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDNslScHSJLQof5Pdi/sc4Q0X5hcxdD/GWFp3L2s1CzkQBrfnsGo/vE0LYX1YloBgTnFGZbvKSwPo4MHABdF87YADhg2W8WdjMFsx0U0C8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8420
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------5oaWY5R3w4e7p7rUUG09GqQ6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/3/2026 11:37 PM, Sundaresan, Sujaritha wrote:
>
>
> On 10/26/2026 7:37 PM, Vivekanandan, Balasubramani wrote:
>> On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
>>> guc_fini_hw() resets the GuC on teardown, but it is registered before
>>> xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
>>> devm actions run in reverse order, these buffers get unmapped from the
>>> GGTT while the GuC is still running and may still access them. When
>>> unmapped GGTT entries are left invalid, this results in a GuC page
>>> fault on unbind or probe failure.
>>>
>>> Re-register guc_fini_hw() after all the GuC buffer allocations, so the
>>> GuC is reset before any of them is unmapped. Keep GuC submit and RC
>>> teardown running before the reset, as they still need to stop or talk
>>> to the GuC.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>

Do we need a fixes tag for this?

>>> ---
>>>   drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
>>>   1 file changed, 22 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 6c35474ab843..14ae73844d76 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
>>>    */
>>>   int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>   {
>>> +	struct xe_device *xe = guc_to_xe(guc);
>>>   	int ret;
>>>   
>>> -	if (IS_SRIOV_VF(guc_to_xe(guc)))
>>> +	if (IS_SRIOV_VF(xe))
>>>   		return vf_guc_init_post_hwconfig(guc);
>>>   
>>>   	ret = xe_guc_realloc_post_hwconfig(guc);
>>> @@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>>   
>>>   	guc_init_params_post_hwconfig(guc);
>>>   
>>> -	ret = xe_guc_submit_init(guc);
>> The teardown function guc_submit_fini, registered by xe_guc_submit_init,
>> is invoked before releasing the buffers shared with GuC.
>>
>> guc_submit_fini stops guc submission and also does a soft reset using
>> XE_GUC_ACTION_CLIENT_SOFT_RESET.
>> The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
>> revokes the log and CTB buffers.
>>
>> So I believe, after that GuC shouldn't be accessing any buffers shared
>> by XeKMD. It must be safe to release the buffers after sending
>> XE_GUC_ACTION_CLIENT_SOFT_RESET.
>>
>> Did we understand why are seeing this issue now but not earlier?
>> Is it a regresssion from a patch, either in KMD or GuC?
>>
>> Regards,
>> Bala
>
> Hi Bala,
>
>
> Thanks for the review. I did some more digging here.
>
>
> The soft reset in guc_submit_fini() goes through fine. Right after 
> that we unmap the GuC log buffer
>
> (0x1e6a000-0x286b000), and the GuC faults reading 0x1e72138, which is 
> inside it.
>
> So from what I see  the GuC is still touching the log buffer after 
> XE_GUC_ACTION_CLIENT_SOFT_RESET.
>

The CLIENT_SOFT_RESET was initially introduced for use by VFs, to allow 
a VF to reset its own state. Although a PF can also use this command, 
the type of state being reset doesn't change, so global allocations (GuC 
log, ADS) are not cleared by this command. I believe that the "log" in 
the specs refers to extra log buffers that can be registered with the 
GuC to get extra info (like the engine utilization buffers), but I'll 
ask the GuC team to clarify the specs.

I agree with the approach in this patch, we should definitely reset the 
GuC before we start unmapping its buffers. I have not reviewed the code 
changes yet, so no comment on those.

Daniele

>
> ee460b8855d4 ("drm/xe/ggtt: fault on unmapped GGTT for multi-queue 
> platforms") dropped the scratch
>
> page on multi-queue platforms. Before that, this late read just landed 
> on scratch; now it faults.
>
> Thanks,
>
> Suja
>
>
>>> +	ret = xe_guc_pc_init(&guc->pc);
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
>>> +	ret = xe_guc_engine_activity_init(guc);
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_guc_pc_init(&guc->pc);
>>> +	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
>>> +					      guc_additional_cache_size(xe));
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_guc_rc_init(guc);
>>> +	/*
>>> +	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
>>> +	 * so move guc_fini_hw() after all GuC allocations above to have the
>>> +	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
>>> +	 * Teardown actions that must run before the reset, either because they
>>> +	 * still talk to the GuC (like GuC RC) or because they stop the CT and
>>> +	 * submission (like GuC submit), must be registered after this point.
>>> +	 */
>>> +	devm_remove_action(xe->drm.dev, guc_fini_hw, guc);
>>> +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_guc_engine_activity_init(guc);
>>> +	ret = xe_guc_submit_init(guc);
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
>>> -					      guc_additional_cache_size(guc_to_xe(guc)));
>>> +	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = xe_guc_rc_init(guc);
>>>   	if (ret)
>>>   		return ret;
>>>   
>>>
>>> base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
>>> -- 
>>> 2.34.1
>>>

--------------5oaWY5R3w4e7p7rUUG09GqQ6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 11/3/2026 11:37 PM, Sundaresan,
      Sujaritha wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3032c66b-9718-4917-b335-caea298c794e@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 10/26/2026 7:37 PM, Vivekanandan,
        Balasubramani wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:at9epeRtNe-eKEdY@bvivekan-mobl1">
        <pre wrap="" class="moz-quote-pre">On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">guc_fini_hw() resets the GuC on teardown, but it is registered before
xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
devm actions run in reverse order, these buffers get unmapped from the
GGTT while the GuC is still running and may still access them. When
unmapped GGTT entries are left invalid, this results in a GuC page
fault on unbind or probe failure.

Re-register guc_fini_hw() after all the GuC buffer allocations, so the
GuC is reset before any of them is unmapped. Keep GuC submit and RC
teardown running before the reset, as they still need to stop or talk
to the GuC.

Assisted-by: LLM
Signed-off-by: Sujaritha Sundaresan <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com" moz-do-not-send="true">&lt;sujaritha.sundaresan@intel.com&gt;</a></pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    Do we need a fixes tag for this?<br>
    <br>
    <blockquote type="cite" cite="mid:3032c66b-9718-4917-b335-caea298c794e@intel.com">
      <blockquote type="cite" cite="mid:at9epeRtNe-eKEdY@bvivekan-mobl1">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 6c35474ab843..14ae73844d76 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
-	if (IS_SRIOV_VF(guc_to_xe(guc)))
+	if (IS_SRIOV_VF(xe))
 		return vf_guc_init_post_hwconfig(guc);
 
 	ret = xe_guc_realloc_post_hwconfig(guc);
@@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc);
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The teardown function guc_submit_fini, registered by xe_guc_submit_init,
is invoked before releasing the buffers shared with GuC.

guc_submit_fini stops guc submission and also does a soft reset using
XE_GUC_ACTION_CLIENT_SOFT_RESET.
The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
revokes the log and CTB buffers.

So I believe, after that GuC shouldn't be accessing any buffers shared
by XeKMD. It must be safe to release the buffers after sending
XE_GUC_ACTION_CLIENT_SOFT_RESET.

Did we understand why are seeing this issue now but not earlier?
Is it a regresssion from a patch, either in KMD or GuC?

Regards,
Bala</pre>
      </blockquote>
      <p> </p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Hi
        Bala,</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
      </p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks
        for the review. I did some more digging here.&nbsp;</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
      </p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">The
        soft reset in guc_submit_fini() goes through fine. Right after
        that we unmap the&nbsp;GuC log buffer</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">(0x1e6a000-0x286b000),
        and the GuC faults reading 0x1e72138, which is inside it.&nbsp;</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">So from
        what I see&nbsp; the GuC is still touching the log buffer after
        XE_GUC_ACTION_CLIENT_SOFT_RESET.&nbsp;</p>
    </blockquote>
    <br>
    The CLIENT_SOFT_RESET was initially introduced for use by VFs, to
    allow a VF to reset its own state. Although a PF can also use this
    command, the type of state being reset doesn't change, so global
    allocations (GuC log, ADS) are not cleared by this command. I
    believe that the &quot;log&quot; in the specs refers to extra log buffers that
    can be registered with the GuC to get extra info (like the engine
    utilization buffers), but I'll ask the GuC team to clarify the
    specs.<br>
    <br>
    I agree with the approach in this patch, we should definitely reset
    the GuC before we start unmapping its buffers. I have not reviewed
    the code changes yet, so no comment on those.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:3032c66b-9718-4917-b335-caea298c794e@intel.com">
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt"><br>
      </p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">ee460b8855d4
        (&quot;drm/xe/ggtt: fault on unmapped GGTT for multi-queue
        platforms&quot;) dropped the scratch&nbsp;</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">page on
        multi-queue platforms. Before that, this late read just landed
        on scratch; now it faults.&nbsp;</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">&nbsp;</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Thanks,</p>
      <p style="margin:0in;font-family:Calibri;font-size:11.0pt">Suja</p>
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:at9epeRtNe-eKEdY@bvivekan-mobl1">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+	ret = xe_guc_pc_init(&amp;guc-&gt;pc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&amp;guc-&gt;dbm, ~0);
+	ret = xe_guc_engine_activity_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_pc_init(&amp;guc-&gt;pc);
+	ret = xe_guc_buf_cache_init_with_size(&amp;guc-&gt;buf,
+					      guc_additional_cache_size(xe));
 	if (ret)
 		return ret;
 
-	ret = xe_guc_rc_init(guc);
+	/*
+	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
+	 * so move guc_fini_hw() after all GuC allocations above to have the
+	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
+	 * Teardown actions that must run before the reset, either because they
+	 * still talk to the GuC (like GuC RC) or because they stop the CT and
+	 * submission (like GuC submit), must be registered after this point.
+	 */
+	devm_remove_action(xe-&gt;drm.dev, guc_fini_hw, guc);
+	ret = devm_add_action_or_reset(xe-&gt;drm.dev, guc_fini_hw, guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_engine_activity_init(guc);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init_with_size(&amp;guc-&gt;buf,
-					      guc_additional_cache_size(guc_to_xe(guc)));
+	ret = xe_guc_db_mgr_init(&amp;guc-&gt;dbm, ~0);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_rc_init(guc);
 	if (ret)
 		return ret;
 

base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
-- 
2.34.1

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------5oaWY5R3w4e7p7rUUG09GqQ6--
