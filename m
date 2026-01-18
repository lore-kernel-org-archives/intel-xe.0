Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB60D4A5F4
	for <intel-xe@archiver.kernel.org>; Sun, 18 Jan 2026 07:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933C10E0FA;
	Sun, 18 Jan 2026 07:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ah7w5VBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B9B10E0FA
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Jan 2026 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768719811; x=1800255811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SeP5efvyiELh1EiMTlv4zdueVWUph/XmHooolwA/Cqw=;
 b=Ah7w5VBzCpl4XViAjcCMEEfKRDODNDKGLzNj6zfVF7PM5ztCd9KF/Ucd
 j5hVfg2/QIet8hFe/BryPfZL4lpQ+44QMGQT8iznL1KHuyBafbYcvPuLn
 WHL5l6gyLGfk0IAS0BvQnrjj++CX00tviMmKnua1wZK+PXdDc/mKaCLqX
 /iQUw14FwNpqKkE6GYWajjw1W+QVIXguLhoKlbbOPCkBGxaJEYNpSlpcj
 qGCm2ecU9I9JCVhsgBv5a53Tv+OamUi7AHZnbL9Y9qaxY6vVKENrxlDnm
 8rqxsKB7u8ArdlUYhhXY8rQsy9MRBoncdQ0rYe621jY8YwZ+ruVIz0E2o Q==;
X-CSE-ConnectionGUID: tBwzCizZSySF7p4GfDyeoA==
X-CSE-MsgGUID: TMsaTtZGTq22YktAKtvYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="57522383"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="57522383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 23:03:30 -0800
X-CSE-ConnectionGUID: JYihl0nrQlCsbAGF40uvoA==
X-CSE-MsgGUID: k3YNulcqRaqvIiCOqUc3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="205626638"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 23:03:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 23:03:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 17 Jan 2026 23:03:29 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 17 Jan 2026 23:03:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKXKP26IxMx0fzTHxaJOmRQYdYGstFoUY4FZL4Guw8wAjGgeymnqP+9+/RAnQiGhVEPUCYDe5u2qbipnRaWvhvbPBJt4Xor7zu/QDq6rPhiH0LagiTT9UgHTXqmmLBgO8ZZpT8T02nqCdiFONPlObdxlBCKSWPW9wtrlwbDpxEuyRNipZWQCJAT48nQw5tuUdWFaYsvK6VA0yGvpjWAkv3z0yN5yl5AZv88ia7uNe9eHx8LrTmNFdmoLzaISB2Popb5n2GXfwJ61UjzmteRhiIrvK2mwyqcKVGTVcVcuKlyWCV+y2UE8YLn0Aa1/oPOMeL0epYoQ8Ot+XPgGXJUBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeP5efvyiELh1EiMTlv4zdueVWUph/XmHooolwA/Cqw=;
 b=jlS43fZ0yCALfahsm2nXZ30qQtwR748B+N9XiLrxpYhQauns78beTqzjiMpZVelwFZtroqfZ0U5cOka44TaZH/r/Ssm22KS8vMVyo/La2Vy0HD6MqfF3SpvtewLXOZLB4jfS5DNGzJ7p+ribmugF63vo4SpDkYurkM5bcyNMfpEtje8H8/7BeLYErTOJPtIF8pCT8VCxnuO0GvLpr6hjQ+fOtN9wQqqDqee9QQS8w7Pb98epQbeqiTx+eIcZkdwqC8vv8d+bY0pMVVWvtUXIQc03Z3w+VJurVKi39FnOE55hCNY8orIGJOqTYvAebtvtc0bije6VJ0T0nwnQayR7iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS0PR11MB7335.namprd11.prod.outlook.com (2603:10b6:8:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 07:03:25 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 07:03:25 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Nguyen, Brian3" <brian3.nguyen@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Topic: [PATCH 2/2] drm/xe/nvm: Fix double-free on aux add failure
Thread-Index: AQHchzFayY6OzIe4VUiee1fjUPLeP7VXgXcA
Date: Sun, 18 Jan 2026 07:03:25 +0000
Message-ID: <CY5PR11MB63669F630DE40D3F6668E00BED8BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260116214055.2882338-4-shuicheng.lin@intel.com>
 <20260116214055.2882338-6-shuicheng.lin@intel.com>
In-Reply-To: <20260116214055.2882338-6-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS0PR11MB7335:EE_
x-ms-office365-filtering-correlation-id: 2aa462b6-5e52-458d-3c2b-08de565facd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MlJuaHNVK0hFTjZKMFF1Zlo1L2x0VXdiWnVCcU4rNnZQcU5RaVFhWWV0OHdI?=
 =?utf-8?B?NWxLYW55ZXNiZnJ0NG9SdFVPY0ZxNEduRzlpQmg5bm1lNTJiRExvNDFPeEpU?=
 =?utf-8?B?cW1KMmQ2aGxrREI0M0l5UEJkSUZlbjk5WkRnVEdlSWpqL3loMWU1dCt3TThH?=
 =?utf-8?B?aXRrcVV5K3krdFFRSmZUSTNRbFNiS1JqaG82ek9QOVNWT1VZN2RnWDR5bHFV?=
 =?utf-8?B?dFZjTnFNV0E0czFYckJuZHVpV2ZWVjc3T2VXZDVyUmd1ek1hMzJaa1BmWkk0?=
 =?utf-8?B?YWRWcHR0T052bldPMHFpNk02N1hTenV1QVcrdTZybmtRTzJQT3FuS1pIZFFj?=
 =?utf-8?B?NVFnYk1FbnJWd2gwNmV4eklnWmQrcURpdzZGbC8vaEcvM0p3YVB3TjM0WnIv?=
 =?utf-8?B?QnlQMGUwUmFGSk5tMUZTVk16YmkzRUh0djhTb0didmcxTkQwTkhiTWh5N2px?=
 =?utf-8?B?TWNQL3lXeEJ3cDRxYm1iSVp1aHlwR3UybzRPY2U0cUZKbXRrSU9ROExKUnpt?=
 =?utf-8?B?aHRYdVJyN3lFMFlzRmhHZ3BJVGZweEJkWSs1OTdBRDJXTHJRY1FqSDh1RVBs?=
 =?utf-8?B?YzE1RWp1Wk1aYUVmTlJNVCtHNll3NWk1dm9LOHZTZ1hHN3RkSnZKSUVQSjJO?=
 =?utf-8?B?RldvSksyOTlvcEdTMkRsem1vbzVqQzJvL2plRmdLOGMxTHdzSjJwMThLS2k4?=
 =?utf-8?B?dVA3LzNIUUdVR2JCdkdjY2ZSVDNVZ2w5Ymd2cWlhR2xaMEZsVFRybGFhQUdW?=
 =?utf-8?B?R0FrT3JNZ1lWcFpGSGhRZUFaTzFSVFZ6cG15NUxuTmhNZ3FOUXFqWVNvS2pp?=
 =?utf-8?B?VmpFQ0hrYUVGaUdBR3BEcGhPM3d4cUV0Qjg0YUp6TlFhTnFmbTZpbzF4T1I4?=
 =?utf-8?B?L2pQSHdVR0NIYkpQaFhOWW1mdVJGUy9PU0hnWEQ4NTI4NTB2ZUpzMDRaZ01i?=
 =?utf-8?B?ZkxFdWhqQW9oY2VwbW9vZTJRZDM5Qmp3eUNNeGxwSDFZcUs0RmJNTjEwWmRY?=
 =?utf-8?B?TXNYSjBaKzBlSGtuaDNXczdoQXFhWUp6UXROOUVMTFdnSVhNOFRRY2sxVFlE?=
 =?utf-8?B?blBZRWFHN1hJSXdPNWFxZ1Zpd1dIQUpxWmdVSkhGbXJsNHFPZTRVdXpLdEcr?=
 =?utf-8?B?QWVpaVdXZmZMRStWMkoxdEpWTlBDazNQZWtjQ01jakpQNDQyUmhKS1pIYUpj?=
 =?utf-8?B?YTlaL0pPdkhvNTlwaitjcitrOTkzcmViTGxVUzVvRTJwajNCM2J2SVV0elB3?=
 =?utf-8?B?QVFvTGpTTlFEV0NWNm5IelpKcmVkMXBPNEk3dnF2azdsL1BJc0RyRkZpRDg3?=
 =?utf-8?B?WkExSXZaN0ZWZXBvNzlTdDN1NXQ0SGxyQXBoaEQwTmZDSHQ3STk3SmRuRGRi?=
 =?utf-8?B?SmxzUEcxNW5KalVpbGVHcUI0Mi9FTW9zRkRjcXFGRGdLN3Z0dnJkak9CcXV0?=
 =?utf-8?B?S3lLZGIzbTA4a25ZaGhuM2ZUU2s1NXRaK0VrMjFHNTdsVlBJcWkrMXU1UUkw?=
 =?utf-8?B?bTBhTUVMdnAyS0twNUFhL0lVU29iWEJKcnFKTWQwV3FSSFhpWVdsbyt5N3FG?=
 =?utf-8?B?VHZiUXVSaWxZckRoWE9xUm9OMWpQdC9nK29zcEFROFJySDdpcGg1Z09wTklI?=
 =?utf-8?B?Z2ZjQ1JMVEZuUTFiMkpPeWE1QWhZUkkvcjlINmNpS3hDZW5wVkZ1d0dwa0FU?=
 =?utf-8?B?SjBhaEhweWlqbC8yTjd6MVNQUTBrMURMbEdWZ2hITDJkUmdCUTNQNEgwcGZk?=
 =?utf-8?B?TnlWbUpRanlZUnZldGpGa3dmQ2NlcnlnYjR6c1NNa09tdVkxMHBGWFFaZnVL?=
 =?utf-8?B?bks4YkxzYVUzU2NteS9JNEFZZ1Zwc0h4bERLOXU3bFI1RkpmQjJOa0lJMUFv?=
 =?utf-8?B?NzRaNWx0eWlpL08vWnl0QWduU2E2dy9hOGJXbHcyRkpYTE42V3ZnSS82QzFk?=
 =?utf-8?B?MUFoNlpKbWhIU2VBcXJzM1A1Y0FXckJ5WmVGYmpZUVJoTjBiSythWU54Zy80?=
 =?utf-8?B?YTg5aUZBQ0NZRkQyYXJvQk1vWnRUZngwN1kyYitPdFJEUXRVc2dva2ZUMStm?=
 =?utf-8?B?Rkl4elRQYzJ2SE8zLzkyWEtEWWxnRlAwVVJzSmZ6THhpL2JuQlo4VE80R1Zq?=
 =?utf-8?B?TUcyRVV4WUFnc2NFVERObmJveEh5R1FyQzNGdkRaK0FvT1B5Nm5HODRwS2hI?=
 =?utf-8?Q?pctE5ba9lWzBE9CWyYzZEak=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmtPa0d0dGQxK1RwaHZ1cUQ0UXJSQndZMEhwM2c1bzAzdXJtZ2N6NnU0WjJR?=
 =?utf-8?B?V0kwTUM4MnNDaTBySFdMVzJJMDNRenltSVRLcG1za1pUajNZUWVmNm5oTml6?=
 =?utf-8?B?YURTTUNIOVlBZFNKWWY5SThmUzFTWlY1K0NTU0xkK0hOMEVsOXMwelZkSFNs?=
 =?utf-8?B?NGNIMDlWRnBYVldpQ2kzL0pnQmpWeXlxM3RKNWU2ZkNUWlBhNjFoVVl0b0hU?=
 =?utf-8?B?K2Y3c1g4NDFuSVUwZys0QzRrQzBiVC9COUNmVUVjMFpSQzBpTFBGT0JtY1Fx?=
 =?utf-8?B?UFErR2YzY2x3SlAxeTM1T3N3alBuQ0h3RmhjczJkN3BEY01RM1hoYlJWZFp3?=
 =?utf-8?B?SE5pbjhmNGorYmRiMkREdksyNzJLcVNXMy9hTXpmbGYzaUQwSGN4WG96a2FK?=
 =?utf-8?B?cWgzT1FZaHdMcVdSKy9oWklVYzhTbjNZeXBhMFVBQXdZaVVrT3laeENkODk3?=
 =?utf-8?B?Szl1T0xuM3RzQnNpeUZjMEpIRlhLZjB5SUF1eWJhZDlwajhKeERwYWM2ZWRj?=
 =?utf-8?B?UEhNUjVMK3dJd0Nuek9FYmxLQTBYdVNqMjE3L0h4K2MxV21FaTM2OEFLWFZk?=
 =?utf-8?B?cE1YaDVBUHprK29OSW11SERFQlZtcjRidVpMazJONVhqODh1UzJkRmFqbXd3?=
 =?utf-8?B?SytSY29CUnpFSGdKdi9mMTNBTVMyN2hwZ1FvbzZaM29ES3Fjam5UTU1ka01n?=
 =?utf-8?B?SG9hS2xTTC9lZ0dnQTdRY0JTTXNLekRuSjJSZUMrWlJyVkIzUFArQzBvdWVX?=
 =?utf-8?B?YW8yYlByd3RpWlZTNC9rbC9Bc3AxaEdIdTg3eXNFN1hKODFxUUJOeGdQNFRW?=
 =?utf-8?B?R3pRQ2srOHc0RXlFNGdadzg5Qmo0Unl3dWgvQ2R0WTh4WUZKVjBOVEdEVUZp?=
 =?utf-8?B?enRTVktOYy94dnF3cUVNS3I2MFZobGFucG4yRndCRHVOMzNVL1BVb3Ivb3Bp?=
 =?utf-8?B?TmhBY1BaV2I3Nmh5YkpGWWEvRWMrSVZlUFR1SitaYkdRVElXUWZnMDZpMXQ2?=
 =?utf-8?B?NGdheGxLQ1NGTDlPcGtOczd4VVpDOE00Z0dmQ2ZTSTlnMTdqenZwTmE4WE9u?=
 =?utf-8?B?YWhsZDZoNEV0eDg5VXZQa2RMTG1QQ2NaNWhrbHFCMHgyaHBFcW5RVSt6YytN?=
 =?utf-8?B?RXZoelhKWFkreGNtUWtlM1hRU1hxVkdrczV6RnNna3g3QlZWU2JyMUttVDBS?=
 =?utf-8?B?ZVkzbXRhb2NvbUJjeWZKU01iWFRza3hPUkFFdUE1V2hrYXozMHBVWUttdmFE?=
 =?utf-8?B?Q0xBZVFHZ0pyanJmRDFENmhkY2JuTmQra2ZuaEZlMzN3U1pQQkFRdDV0V015?=
 =?utf-8?B?azMyejJrNkIxL2VWWEFYVG5XbjkwTjVFR2NuckV6SE0ySjduWXgyUmFaZjZW?=
 =?utf-8?B?TStCeEh2VDNBQjVKUFAyUVk3Snl4MDZGZzZsK2JyS0VPZzZCU3A0amhOV0dJ?=
 =?utf-8?B?NE1EYWJuWXFpYUFCbFFqR3VCWWFGR3hJeHRYZDNKS3BnSVg5aWI3UHRoY2oz?=
 =?utf-8?B?dGtDODJMbThwUWM1dmZKVFN3SXc3RWlFVUVDNnh1a3F3Y2ptcHk4VXFlOGsv?=
 =?utf-8?B?enZrKzJhdDdpVytsRGhwMWE1cExaL2FsbHVITEl0eE4rd2JwMFhVaDdjaDAv?=
 =?utf-8?B?YUFEajdNYnRINHlDbDlGVDl5UktqZVUrSUZQejRTNTFZYUdmMHB2KzBVb0hO?=
 =?utf-8?B?QlVHQTFjNkpXdGkweFdHeTdOS1JoYy9OcmxZbVp1WTVkWEZBTWJKU2FFR0lW?=
 =?utf-8?B?czJ6Rmp3cjV2NmphOVJ4WHk2VzNPc1R1QkhTbitHZEtaOTI1M3hsdFdyVlF4?=
 =?utf-8?B?d2l4NmIvNGE5RkxHVnIwbmRMRk5yMzlET2ZEZSsyUUgramc0Y01YMEs0bmZH?=
 =?utf-8?B?THliam0vd2g2ejhDeVh4SnZ3anNZY2kzS1JubmYwdHFpcTJpOVNtVUp4YUkz?=
 =?utf-8?B?SHBPVHFGdTlsZ0ppcSt3TVltZ1dwQ1lHczVmcmNwZmRoRDBxOFd4eDV0MjRM?=
 =?utf-8?B?N0FnL09wM2Z5MG43SjdOSnlMeGt1WVY1QUtjWlFZNnlZeGNwbUtYQzNpK2dP?=
 =?utf-8?B?TW4wOXpvZ1hFNlBLM3RuM2UxTE03ekx2ckFTZjhKWEVOYlpWTk9ac3BLajNY?=
 =?utf-8?B?b3dxWXJUMXBGdW5vWk9lL0pYT2w2bnQxQkk4VlhkQnIxQ1lhR0t6L0V1NXpr?=
 =?utf-8?B?TDdKbEdKMWp3ZmgzU01Vc0JLa21WOXQyZU1IcEVIQmthdGRFa1AyU08rcldi?=
 =?utf-8?B?RjQva2E1UW9FNVJzWWxaNXgxN2pEODhYZmxlSllyUTUwMHIyeS9Yck5IcHRi?=
 =?utf-8?B?LzJ2Ukd5WlNKWUllclBjRTkyam9CeWNqRnJlR1g5THlCKzdQbFA3SEpRSVpR?=
 =?utf-8?Q?Nf2nVgRoUypJbrzaY/Yf8YbBoHp3GLoEF5ov+W5GHS8Hh?=
x-ms-exchange-antispam-messagedata-1: 9hzLswBYi73ABw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa462b6-5e52-458d-3c2b-08de565facd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2026 07:03:25.4872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRbks3NWOZ/7ceh8JGY1LBSnon8G4L3c676cRaADeC4Pks1qfLhPhcVud3w6FM9piPDk0796fCfpfpJ0V0S8JVsModQtVprHDNVaZipo1Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7335
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

PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0veGUvbnZtOiBGaXggZG91YmxlLWZyZWUgb24gYXV4
IGFkZCBmYWlsdXJlDQo+IA0KPiBBZnRlciBhIHN1Y2Nlc3NmdWwgYXV4aWxpYXJ5X2RldmljZV9p
bml0KCksIGF1eF9kZXYtPmRldi5yZWxlYXNlDQo+ICh4ZV9udm1fcmVsZWFzZV9kZXYoKSkgaXMg
cmVzcG9uc2libGUgZm9yIHRoZSBrZnJlZShudm0pLiBXaGVuDQo+IHRoZXJlIGlzIGZhaWx1cmUg
d2l0aCBhdXhpbGlhcnlfZGV2aWNlX2FkZCgpLCBkcml2ZXIgd2lsbCBjYWxsDQo+IGF1eGlsaWFy
eV9kZXZpY2VfdW5pbml0KCksIHdoaWNoIGNhbGwgcHV0X2RldmljZSgpLiBTbyB0aGF0IHRoZQ0K
PiAucmVsZWFzZSBjYWxsYmFjayB3aWxsIGJlIHRyaWdnZXJlZCB0byBmcmVlIHRoZSBtZW1vcnkg
YXNzb2NpYXRlZA0KPiB3aXRoIHRoZSBhdXhpbGlhcnlfZGV2aWNlLg0KPiANCj4gTW92ZSB0aGUg
a2ZyZWUobnZtKSBpbnRvIHRoZSBhdXhpbGlhcnlfZGV2aWNlX2luaXQoKSBmYWlsdXJlIHBhdGgN
Cj4gYW5kIHJlbW92ZSBpdCBmcm9tIHRoZSBzaGFyZWQgZXJyOiBsYWJlbCB0byBmaXggYmVsb3cg
ZXJyb3IuDQo+IA0KPiAiDQo+IFsgICAxMy4yMzI5MDVdDQo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiBbICAgMTMu
MjMyOTExXSBCVUc6IEtBU0FOOiBkb3VibGUtZnJlZSBpbiB4ZV9udm1faW5pdCsweDc1MS8weGYx
MCBbeGVdDQo+IFsgICAxMy4yMzMxMTJdIEZyZWUgb2YgYWRkciBmZmZmODg4MTIwNjM1MDAwIGJ5
IHRhc2sgc3lzdGVtZC11ZGV2ZC8yNzMNCj4gDQo+IFsgICAxMy4yMzMxMjBdIENQVTogOCBVSUQ6
IDAgUElEOiAyNzMgQ29tbTogc3lzdGVtZC11ZGV2ZCBOb3QgdGFpbnRlZA0KPiA2LjE5LjAtcmMy
LWxnY2kteGUta2VybmVsKyAjMjI1IFBSRUVNUFQodm9sdW50YXJ5KQ0KPiAuLi4NCj4gWyAgIDEz
LjIzMzEyNV0gQ2FsbCBUcmFjZToNCj4gWyAgIDEzLjIzMzEyNl0gIDxUQVNLPg0KPiBbICAgMTMu
MjMzMTI3XSAgZHVtcF9zdGFja19sdmwrMHg3Zi8weGMwDQo+IFsgICAxMy4yMzMxMzJdICBwcmlu
dF9yZXBvcnQrMHhjZS8weDYxMA0KPiBbICAgMTMuMjMzMTM2XSAgPyBrYXNhbl9jb21wbGV0ZV9t
b2RlX3JlcG9ydF9pbmZvKzB4NWQvMHgxZTANCj4gWyAgIDEzLjIzMzEzOV0gID8geGVfbnZtX2lu
aXQrMHg3NTEvMHhmMTAgW3hlXQ0KPiAuLi4NCj4gIg0KPiANCj4gRml4ZXM6IGQ0YzNlZDk2M2U0
MSAoImRybS94ZTogZGVmZXIgZnJlZSBvZiBOVk0gYXV4aWxpYXJ5IGNvbnRhaW5lciB0bw0KPiBk
ZXZpY2UgcmVsZWFzZSBjYWxsYmFjayIpDQo+IENjOiBOaXRpbiBHb3RlIDxuaXRpbi5yLmdvdGVA
aW50ZWwuY29tPg0KPiBDYzogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGlu
dGVsLmNvbT4NCj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
U3VnZ2VzdGVkLWJ5OiBCcmlhbiBOZ3V5ZW4gPGJyaWFuMy5uZ3V5ZW5AaW50ZWwuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMgfCAyICstDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZtLmMN
Cj4gaW5kZXggNzc4NTZmNDYwNzcwLi42ZDE4Yzc3NWQ1NTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9udm0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbnZt
LmMNCj4gQEAgLTE2NCw2ICsxNjQsNyBAQCBpbnQgeGVfbnZtX2luaXQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpDQo+ICAJcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9pbml0KGF1eF9kZXYpOw0KPiAgCWlm
IChyZXQpIHsNCj4gIAkJZHJtX2VycigmeGUtPmRybSwgInhlLW52bSBhdXggaW5pdCBmYWlsZWQg
JWRcbiIsIHJldCk7DQo+ICsJCWtmcmVlKG52bSk7DQo+ICAJCWdvdG8gZXJyOw0KPiAgCX0NCj4g
DQo+IEBAIC0xNzYsNyArMTc3LDYgQEAgaW50IHhlX252bV9pbml0KHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlKQ0KPiAgCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoeGUtPmRybS5kZXYsIHhl
X252bV9maW5pLCB4ZSk7DQo+IA0KPiAgZXJyOg0KPiAtCWtmcmVlKG52bSk7DQo+ICAJeGUtPm52
bSA9IE5VTEw7DQo+ICAJcmV0dXJuIHJldDsNCg0KTWF5YmUgcmVwbGFjZSBnb3RvIGVyciB3aXRo
IHRoZXNlIHR3byBsaW5lcyBhbmQgZWxpbWluYXRlIGVyciBsYWJlbCBhdCBhbGw/DQoNCi0gLSAN
ClRoYW5rcywNClNhc2hhDQoNCg0K
