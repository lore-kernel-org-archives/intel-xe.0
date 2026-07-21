Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF23C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 09:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB210E815;
	Tue, 21 Jul 2026 09:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgVW+0BU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634FD10E80B;
 Tue, 21 Jul 2026 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784624499; x=1816160499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5gIlPj5rxKMvBeaCL3AOIVH0iMMzNqcc1hYH3hvp2oE=;
 b=cgVW+0BUAhIHvusAKa3sLes3okWkw7OOPVcQlK+j0Ty/Ficf3QMwlOBy
 EyonBOdNYho/zLNeXjjTidIymc/aH6XxOma0h/Z+Dn3/WjTpZ1sGAfxLr
 RWmzeVXRw86ol33N5tV+ElTiRCnMUacQpD4iiESUoXRuBMJMqshpCUohg
 W72s8AwYb4AfaIBsD9bqHyb2HADgImz7dYlXxXE5JbU0L+iWkHpCzEjw5
 Z1xhR53KMgWELYtCfvJeWrX/AwCYXwZtqkYNVvGQB72oA73x64IuZH5Jb
 KOod4aFnIHCTccxver8Wqo2Iqt/q2cDLozJIYiNVOW6/+t/s27Vf74NEv Q==;
X-CSE-ConnectionGUID: CD9gQDcJTmCfmMldiDvalg==
X-CSE-MsgGUID: O/EVEtAQT1moupzR0UFrbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72753047"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="72753047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:01:38 -0700
X-CSE-ConnectionGUID: keMlF945S3yyId8L2v4zBQ==
X-CSE-MsgGUID: v4mHklscSxq+qEFfs6n9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="254296103"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 02:01:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:01:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 02:01:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 02:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPZrmuC4ntgtycSUMSxLOw/vPlEUoIsNF2oKUkO12znqTMe42TfmRYw6Ls5O+CSVr7gy/j6kzHfJ85MkSjfUsi6ps8yh7nZLoHlRY5G3jYVE56qNBfeQyNJ99Wpdx7uCgjP07bbMPFucSBQN2mLubv6YtOqowgjaAYckPhAk3VarhFTSuMvdJh9vLaBrKA0h7uRRM7p09bZoJ3ypuG7ecZwHWjovSbeUpvCWZtUMbdKrWcsKbFHcnRkIIby+qpEbxWOuaBwDwTB0z8wDZOe0VCLkUc7KB6qIo4u2MN9+HXLV2s07Aaj4sVplCyW5VQh3SPsOAvICXLdUsn5X2hFDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gIlPj5rxKMvBeaCL3AOIVH0iMMzNqcc1hYH3hvp2oE=;
 b=I8dxXQakemQjSTdwj/iccVaEGNbphpgE3pJEPeceRPfisBcfCBJzkXma0HMs/3ehcnnpuIqGuCAB5MAW5NnrbC+PUZxxyekgdGWyIMF03r85nyGFihuat0T8wC8LpHIcVX6B6OeTbX/gNU/Ydp/tYYwAIx1TwuQXjH6Vz7C4kGGlO9vUKXHwLG/fIq8HMgnEFyRLXbGHHJiMxrwLAB/2CQ05Y7Bm30ASAcUfN2ajzu7mSVTq4Gwa2v59EtImZW6HmZn6o0ErIKPsUXH09rFtunhvNf9TWZhGJ5/4NOZgGPoPmlUXPinM+HYzdUyDPuYxbcdBaH6GinQJ9pfuYQuZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CHAPR11MB9654.namprd11.prod.outlook.com (2603:10b6:610:302::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:01:35 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 09:01:35 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Topic: [PATCH 3/4] drm/i915/fbc: xe2_lpd+ don't require any hardcoded
 plane width limit
Thread-Index: AQHdFXb/RbqIpSe1wUuGQSV8wRzJj7Z3tCAA
Date: Tue, 21 Jul 2026 09:01:35 +0000
Message-ID: <0206cb61e7e0a4746b1ca561ba9123ef85d097e5.camel@intel.com>
References: <20260716225956.555995-1-vinod.govindapillai@intel.com>
 <20260716225956.555995-4-vinod.govindapillai@intel.com>
In-Reply-To: <20260716225956.555995-4-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CHAPR11MB9654:EE_
x-ms-office365-filtering-correlation-id: 340bda43-473e-49ac-609e-08dee706aafa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|10070799003|376014|366016|10067099003|3023799007|5023799004|4143699003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 2mQg9sSTp6wmUYwn/m3OmNqd002Y9Z4G6r6olcv9aCQtBBazPMqNIXJBCx/5QAXsmbMP2vFdlkQNY4MTt/TCk6tzMkfSmmggZaOwGh5b9z5wP1vf3Y24L0qo1ibFrXj76ScfMU+52b9R1eypFV2WKTS4NWCtm4L6UuPR3luuGhgTyqfQko7eSIcs3FUHfLbezSDVv54WhGKkal57f7oTADRyBLRaG7z6pF8ikUgXHogqKKA0g/uAfCayFTtMqPSVV0V6h1TOYJYmRvifa12p+/arGisi8kTcrar8NOXiitgVfR/LMKLJ87XDcWO7+54Lx9bFRYXM7jG+94QotlMfMMOkwUwErPQyvPZD4lmSMtTJhD5Swk6K/9HpKTQfrY3twFo6ATxlEtyVNJfCZED5w0JtK4rzojx8lRulSN1e1PWPvXJL81DpyliuRjKNURctzio05btnBOqRobSJHaH8XpjibHFzsaE8Z+SvFA8RJKu8vn+CsIQk1+SawSbgeN/DG7i/sU/0pLIkCzoSxwnvsQ/Jhyxt7bc3/99GyN8wjn+myI1w9VBbmFsL6qsNwLDrMTe86E2HDCHR2p5lzP7Z4UjJkBKo9Cya5A8c7tNBvj1+iedLH+EKA1fQIJqmn4+GrZApGINrAdr+bcf8UioQHZJX8Ft/IK0X4QE0yGm5Coh7Od7UFIj5//Ghlcijx9W5Uh7tQSstgzZFmhJ79PrC83HRC2JwlsoWujA8MOnrXSE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(10067099003)(3023799007)(5023799004)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRsbjZINXhCdEQ3S09TRWZkZUxsS2oyUHdRZEdZTFR5SGtGaE0wck5IbGRG?=
 =?utf-8?B?Smx4by9SMUN4UHFlcjVDMjBOUm1uYTNKNWE2RmtmcVNUQW9xTlNjMTdaTXdp?=
 =?utf-8?B?a09sTldxWHQ5RHVHVVVvZUNIRThxbmRGOEFBbEcxUmgrS2drVWlNczVibFh2?=
 =?utf-8?B?Q25TSGQrR0xOVEhya0tWbGRaVXBnT3VtZUx6YnZOOW9Jc0RDTTF3eGN3UmhY?=
 =?utf-8?B?WHNmSEVTQnlQcEE1NGZ2UjlidTZpUEUzRThvemJ5YTlEVkYyV21sM2g1aWxI?=
 =?utf-8?B?L0VvdHNtOVd1U2dKV2JPcmNNVWtoZmJHMmJSQ1YxeTFnWXhYQnl0Mlp1b0Yr?=
 =?utf-8?B?N09VWWIyOTROS01CM3V2TDVCT2Q5ejZJRUQwRVI1eGJWZ2o2L0hxUGNTS0dY?=
 =?utf-8?B?VXYxSWl2b3orTFlWS2F2aWxUY01wSkJMQW5GaXRFbWdtMU5xMDErZEVLNHdu?=
 =?utf-8?B?M1h4c1lCNXNzeSs0WTc5ZnF5UmFzcGlxdFJISXJEeUdLQVIzZkxrc1JObk84?=
 =?utf-8?B?cmpTdDhteHp1RHE2SC9leDYzcUNVZE1xVks0UTVXNlRsKzAzdDRySzBzQ1hj?=
 =?utf-8?B?aWRGeDQ2d2djYlI3SWd6UDRUNjJFTFZiQ3B4SWg0eUNOUCsxdGtGSVNLU0Ey?=
 =?utf-8?B?WkROeVp3UGkxWXJtdDloQ0YzWlpsZmNUU0dOSHV4cU03TG8zUWY5ckV0YXhL?=
 =?utf-8?B?eHROWVVOUEozTFlQK2FjcGNqc0FuL0ZvWCswM3FoTm93UHpUWVVoRU10ckFG?=
 =?utf-8?B?eFNRYnA1MkMzR1dKaHlJNHNNZTZhOXVXZXlud0owM2h5TnVTMjdZVTNpYm9L?=
 =?utf-8?B?MDlOMmswMm5Oc1NPSHpnV2c3eUpHeXZjbmNlWUQzSXBFRWF3cWRob0VsVjY2?=
 =?utf-8?B?K3FWTFhHNy9Qb3lqcTcrY2w5MnlvdG9iZ2Q4OGFXTEJBMW0yTk5lSk1uRjU1?=
 =?utf-8?B?SmNOWURmam5tS09xRmdlK1MxRzd0U0pRT3FibEhxWDAzZXFMWGNXbGRMVlFs?=
 =?utf-8?B?MGJhdVYzSGwwdi9MVUkzeHl0LzRzSi9jcmpPRE9DSTBWUGkvZkZIaGpOVWl2?=
 =?utf-8?B?Z2FPOGQ0YXVjWUp0djh6N29DYWdrdXB1M0xMOWZDTVFsRGxBTFF3bFVCSlhh?=
 =?utf-8?B?a3MvSWE4TzVlVGl0SjVEUDVsYk45M2NuRXpoQ2NRK3UvTERJRVlRMXNMaGhW?=
 =?utf-8?B?RlllcGIrK3E4c0NnaEZsUEkxZVgzbWtWc3ZkLzAxMHhZYkFZblQ0TVc3Yk9r?=
 =?utf-8?B?bUo5U1N1aUZqc0xxSTFLdDRlb2tOcXkwSmxUZGdZTzhibnVqY211Y1hxZFRH?=
 =?utf-8?B?dFA2Z29vSm9DdU5UUGFQeEtpWVBEYXQ5ZFM3SDBpVUtuREJydnloaXJNVzJi?=
 =?utf-8?B?NHBLalh2ZlpMWDFuWG5XMUY0ZU5XMmZVb2xMS1R1c2szZlpMczVGaEZJMVFJ?=
 =?utf-8?B?UWorMnhtcjJMQzEwN3VRZ0c4N1JHdE5Mcnl1cnNHNThhZTVsRVc1SGVXRlJq?=
 =?utf-8?B?dVlRaXN5Y0lYNFhSWFRvYUhIaGhMakRuOHUxbG9QV1FlV2VMRXNwK1NNMTBZ?=
 =?utf-8?B?a2xpcDNBbXAxSWYvWk9YV292U3JaNWprZHVGYUh6eXBVL2R5WXBmeWVZWlk2?=
 =?utf-8?B?SVVXVFFwd1RQN1pncUJuaEUrUUZIbUtqcUhEYjZ5QmZKTHo2RmNRTUpYM2hL?=
 =?utf-8?B?anRmOUdPZFFIN0JZOERzSDNNQVIvd3ZyUk5jMTFkVFFtSXpFYm1GeUNSMkZV?=
 =?utf-8?B?aUQyY2E4Nm1vZEY1b01nalNWQ2lZalRBemYzTE9CRDNXbzVSV3k0emhiRG5l?=
 =?utf-8?B?UThOMHdXNmpING9yU1lTM1F2NXF6ajd6RGROdnFwR3FPOTdJZWlBb1ZuQzl0?=
 =?utf-8?B?VGl6L0xja1RzS1lCZDNrS1NJRVJqZ213UlJnZHZncmlzNFlYOC9URDJPNnF0?=
 =?utf-8?B?OVpRVzFtWm9HRjRBdGhGeFRaU2FYaXpnbmJYVVMzbS9XKzF0VlBzd21tN3dX?=
 =?utf-8?B?OWdrS3p1ck5ENDBIRVd2OXJYalo5bHc2QzNWM29hK1JYVWw2d1U1S1Y5RlNx?=
 =?utf-8?B?QmxDL2ZGOXdsc3RtaXNnaXdlWTN3VnhFTzJ0TE5rcDQxY3dsczI1YjE3dG9m?=
 =?utf-8?B?QW5YVTkrZlVKK0wwVTk2bHp5bjBCSDJmWk15WnI1eGJzZ3dzRzRVajFoUUxR?=
 =?utf-8?B?aEVrcmljRGdyVTY0TVJ1aTJST3FnRUlNU2tFcUZtbmxDbkswREJpQ0k4WUh6?=
 =?utf-8?B?SDRaL2dZclByQmhnOUZ0a2w4S2lWay9IaWJFREZFZk1VWVcvTU1DM2pIOFNP?=
 =?utf-8?B?M1hpTk4wY3UxK1V3NXVzclNkc0dBVDZzdUNQTmk2RStzSFFNMk02SldGVmxu?=
 =?utf-8?Q?OjzHuwEapValCEtfGQENrbNZHXyUFwayEUZzR0UEneHpY?=
x-ms-exchange-antispam-messagedata-1: k1+zMpyedhlpYV1y+lgPoXXY9vQ4plq4/+E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6D76AA1D76658429E260B6EB0C869C9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: X6QNu6Vog/ylbp9FGMFAD3pnvL3QYRhOR6On3Xk0E+ZO9VgfBj7ViBoAnCkfk8kkvjEUgaCBtzxKJkTdSJDaOxwZzQolg2bFHxGlxiebh85naNklPG1gA6On2X1/jT+hFxpy2Nu1cth2AUZOLI76BBzWV7ecIBvmFmNqHeI7dMuXyNRL+ZpNg70hOmmNbywPyntbYVyJJubw7sr99EQMm4mJ8c3aXDTtWrp1OVwcP1FzUX2hKmU2IUAvOZzQJ8pGcwnEkvbIZS4XiD57EOZkCWZ6LtwDRndsyZ3emOKHZvpQzKTQMT2N36cc/H5o/pK8TPFM/CLWDPAL9S7uLOwoNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340bda43-473e-49ac-609e-08dee706aafa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 09:01:35.7317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNlCTWGYgfmQbcvgKbDrVBV4BPNC0vhAOAR1igLGukoPGgl9vtPXl/Zq28VkxZIog/xZ3QssCiebE8ouTpqNkhiyfeUmR42RZDX3VeJJ5L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9654
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

T24gRnJpLCAyMDI2LTA3LTE3IGF0IDAxOjU5ICswMzAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOg0KPiBJbiB4ZTJfbHBkKyBwbGF0Zm9ybXMsIHRoZXJlIGFyZSBubyByZXN0cmljdGlvbnMg
dG8gZW5hYmxlIEZCQw0KPiBvbiBwbGFuZXMgd2l0aCByZXNwZWN0IHRvIHRoZSBwbGFuZSB3aWR0
aCAtIHdpZHRoIGNhbiBiZSBhcyBwZXINCj4gdGhlIHBsYXRmb3JtJ3MgbWF4aW11bSBzdXBwb3J0
ZWQgcmVzb2x1dGlvbi4NCg0KSSB3b3VsZCBzdGljayBpbiBkaXNwbGF5IHZlcnNpb24uIFhlMl9s
cGQrIHNheXMgbm90aGluZyB0byBtZS4NCg0KPiANCj4gQnNwZWM6IDY5NTYwDQo+IFNpZ25lZC1v
ZmYtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5jIHwg
OSArKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9mYmMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMN
Cj4gaW5kZXggNzgyMjhhNWU3NjVmLi4yMGYwMmVmOTM4N2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmMuYw0KPiBAQCAtNTksNiArNTksNyBAQA0KPiDCoCNp
bmNsdWRlICJpbnRlbF9mYmNfcmVncy5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9mcm9udGJ1ZmZl
ci5oIg0KPiDCoCNpbmNsdWRlICJpbnRlbF9wYXJlbnQuaCINCj4gKyNpbmNsdWRlICJza2xfdW5p
dmVyc2FsX3BsYW5lLmgiDQo+IMKgDQo+IMKgI2RlZmluZSBmb3JfZWFjaF9mYmNfaWQoX19kaXNw
bGF5LCBfX2ZiY19pZCkgXA0KPiDCoAlmb3IgKChfX2ZiY19pZCkgPSBJTlRFTF9GQkNfQTsgKF9f
ZmJjX2lkKSA8IEk5MTVfTUFYX0ZCQ1M7DQo+IChfX2ZiY19pZCkrKykgXA0KPiBAQCAtMTMxOSw4
ICsxMzIwLDE0IEBAIHN0YXRpYyB2b2lkIGludGVsX2ZiY19tYXhfcGxhbmVfc2l6ZShjb25zdA0K
PiBzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlDQo+IMKgCQkJCcKgwqDCoMKg
IHVuc2lnbmVkIGludCAqdywgdW5zaWduZWQgaW50DQo+ICpoKQ0KPiDCoHsNCj4gwqAJc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPQ0KPiB0b19pbnRlbF9kaXNwbGF5KHBsYW5lX3N0YXRl
KTsNCj4gKwlzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lID0gdG9faW50ZWxfcGxhbmUocGxhbmVf
c3RhdGUtDQo+ID51YXBpLnBsYW5lKTsNCj4gKwljb25zdCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IHBsYW5lX3N0YXRlLT5ody5mYjsNCj4gKwl1bnNpZ25lZCBpbnQgcm90YXRpb24gPSBw
bGFuZV9zdGF0ZS0+aHcucm90YXRpb247DQo+IMKgDQo+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3Bs
YXkpID49IDEwKSB7DQo+ICsJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID49IDIwKSB7DQo+ICsJ
CSp3ID0gaW50ZWxfcGxhbmVfbWF4X3dpZHRoKHBsYW5lLCBmYiwgMCwgcm90YXRpb24pOw0KPiAr
CQkqaCA9IDQwOTY7DQoNCkJzcGVjIHNheXMgNDA4OC4NCg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXIN
Cg0KPiArCX0gZWxzZSBpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPj0gMTApIHsNCj4gwqAJCSp3
ID0gNTEyMDsNCj4gwqAJCSpoID0gNDA5NjsNCj4gwqAJfSBlbHNlIGlmIChESVNQTEFZX1ZFUihk
aXNwbGF5KSA+PSA4IHx8IGRpc3BsYXktDQo+ID5wbGF0Zm9ybS5oYXN3ZWxsKSB7DQoNCg==
