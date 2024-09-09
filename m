Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F2ECE577
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 18:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F0B10E62F;
	Mon,  9 Sep 2024 18:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOrF0g+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0363D10E62F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725906230; x=1757442230;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=M1OXjgVFg/K16xikrDpGK2IBAxh1GZMZb8nnEESKRrY=;
 b=OOrF0g+6nz9qDKIPBqrLLo1PxXTvk5o+bGkW+dBKx5z8TkHW8BkKNdFt
 tdN8F9M4vJC1qzRM1yb4DC9tPnmeYSTVvdhx8FU8vVRdBLTLoK+jdys80
 tNM3wGdr8rSlcZAvgLbh82iYwjpSLNV04phYgzD8vIm1Jdm0RKYi31qnd
 ayBS+xwYT64YIW3xSBj8vl0Wd3zsz6xWgEW9043se34huRxvm4BxWLUGh
 v5cAQR3XkKyAtgsXSmmKseeU9rS5S1cLkWTNJdIIPIVfpSS/8wq4JGhrT
 lr1KAsCwZf8BmGMEI23M7EoUk+53Cq/xb+/znNGZ/C0ElJ/tPyl9KmbEI g==;
X-CSE-ConnectionGUID: 0Sr2+T1yTmeLHl8C996s8g==
X-CSE-MsgGUID: rv68QD3/RrWqwxX5OCA6Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24771979"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="24771979"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 11:23:49 -0700
X-CSE-ConnectionGUID: XO8At316Q0Wiv6E3edbwQg==
X-CSE-MsgGUID: ty0zeG5yQrGsxTflgCNzVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; d="scan'208";a="67492146"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 11:23:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 11:23:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 11:23:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 11:23:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 11:23:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ+FqjUBNh13EAkoII03uKj3wiJZ3/LZJPfV57Nx79tljXXtcvt8edpMzn4YtF8GHJ+8Q2eqOWjMjd8O+oRf37SAFbatHWQ7BDxeO/chklBaKM7AdcawBSoutXuKXQSYE1SkipIhY8ppWhdPFx0WLIunuirwO9vGIf0zuWBd/G80FMeopJdEE3jgyN+BoWrvKgwcZir2GgHuHt7w1hFSlZOIJJNysv3fqlcCQ648CNOgmyDNsFACIL5T6YaljvvO9sFLcTPAFK44oveHjWooUGvdSIl7vU900pntF7Un00XE8eQIt2jOX/Wq7Sqz+FP2mOyUfJ8hHk05H215U9/o0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1OXjgVFg/K16xikrDpGK2IBAxh1GZMZb8nnEESKRrY=;
 b=dTGcSs/jgjHLqawlmArkuG+TgC1beV7eo+Fk2gZB/8Up2dfLQqrZdwvo6E8ah8ijkKFT1uVIfQOp5fkeeUGGBX15BVfxdC2iH0mQpVtPvC//qQX0/NpjlunE/lJ5qjmNTjrTh9iME0l62PNMSarJVEjv8jWggsUu0Ql7P/Dv+ZrPI5ch/AKirbzgUST3m3XPY8sX0fOcNwRQG+EIbxaYNekCIY0Z11XheIeS4EOxKI44CckqhQ37NSVAAHm0Os+RaoF8OETxOUOyN9jtKKM2zuLLUkM86FULL9bjELASj/UyJPzg3OD1qZ/Wk5VD9BrnY0kCfgexA8GN77x6Rod3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.17; Mon, 9 Sep 2024 18:23:35 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 18:23:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v18 1/6] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Topic: [PATCH v18 1/6] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Thread-Index: AQHbAKr68/QjN4CcP0aT743J302iJLJPyWuA
Date: Mon, 9 Sep 2024 18:23:35 +0000
Message-ID: <e0e0374734fe7066f132928cdf1dd378ff862291.camel@intel.com>
References: <20240906222006.279581-1-zhanjun.dong@intel.com>
 <20240906222006.279581-2-zhanjun.dong@intel.com>
In-Reply-To: <20240906222006.279581-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4820:EE_
x-ms-office365-filtering-correlation-id: 21301655-3534-4984-b00f-08dcd0fc8462
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MUxvQ2Mxek53Y3Q2aWJaSlFreDVlZmlVTldGWjcxQS9BbnJGVXZjWDlocFJX?=
 =?utf-8?B?VWt6a2E4bEdpdWg1UjRrKy9pekllQSs3UFlsQyt2dEQxeVlmcWhBOHYzak52?=
 =?utf-8?B?WnBqWmgzQzBhckpaZVMwelpSbTUwUndic2RtU2V6WkhMYmpvQ0IyeUNiZlM2?=
 =?utf-8?B?Q081WnJSRjYzK1BLWW5od0piZXpVdWFTcXJNYnA4QWR0Slk0bGJUWFlBNFcz?=
 =?utf-8?B?ek5YM0cyRHkzRFhsdHNValJTZjRZU2hQbWdHdlJGbDRyWmdKaHZGbDM5ODlp?=
 =?utf-8?B?M01zY29sYlB4Tm1vR1Y1cnlveVJhcFdyRFViREppVmk4ekoydnVkdk1TS0VX?=
 =?utf-8?B?LzYwZGJMMzIwSmhiM21qd0lZaU9JbUl2Mll5TURhcGQ3Y1RLSFlCajZRR01W?=
 =?utf-8?B?NU11RGhEWS96ZFRJSk1taS9aRFFLb1dtZlh1ZUNqeDdMeDZSeTZjbE1qWDJE?=
 =?utf-8?B?STVMMXg0TEZJQ0NFMTdaWUVYQTZiYi9mbWR3THBlc0w3TEZENGtyWXJySmFN?=
 =?utf-8?B?TmNURWd3Zk44cUtEZVNXTVBZQlJBTGlENEFnTlF1MTNURGw5eDllNUt5RnE2?=
 =?utf-8?B?MU0rZlVUT2tkQ3U2NkROOUUxb3N2R1JXMVZMbnBRT3pHM2hESzU0ZCtNd0dZ?=
 =?utf-8?B?d09RUmd5VmZYa3RrU0c4RzFOTzNUWS9aMndRZXZ6cnVxV0pqc1RXczQrL25q?=
 =?utf-8?B?SFFZeTQxdU0yS2RHa0NwdEduSXdNVnBVaEpsaXdNMnIzTko2YnZ3QWYzd2pL?=
 =?utf-8?B?YjRuZlQ5SEdPQjIvblhoMmpmbGE4eTh3eHJvcmRrWWhFM1NOSUFQRFJSNHZP?=
 =?utf-8?B?Q0IwaWlrVytlRHJuckhBaTVoNXAxNGhaUFg2VGViQXM0Ym4wcC94clArSGpz?=
 =?utf-8?B?dDJndGpMYXBDWkozWjh3Z2tQYktYV1VVYlFyTlF0SEhxSUJaUlRkMkYvYjVn?=
 =?utf-8?B?VFNiVGVBYkRYZjNUaGhiVzg0MVdxektVVmlWbmJWVTlOaEVXQitza3BDaTNv?=
 =?utf-8?B?UURPVDJkTzN0YkFRQndqSzBQdWNRcEZRVWRCUzIvNlJDaDk1aWdPR3k0VXp1?=
 =?utf-8?B?VDgwWUFjZ3ZXNGVIdytyN0NpamNnRzdGclV5YVE1WFlmbktUOStvOGxzdldJ?=
 =?utf-8?B?Tlk2bUVKWEdtSHRkRTJ2b2s1VFF6ai9FQXhjeHNPaUg2OTJXSUJoS0pneGt4?=
 =?utf-8?B?UVhSVyt4bzhLZzlXczRZaThYakMvZjlCT0g0RzVGMXJ6b3prVkp0QTdoUXhR?=
 =?utf-8?B?VWFjNWswOXkwYkwzYzFOUFZnTDRLTDEydTJMa3VUem1obHJlUmVkRDF5NkNO?=
 =?utf-8?B?OUpwUnJyYW5oZVFUMTJrM2VZc3RUbHRGUmZEQXhiZGNIT01YZU1wNDZVMVNO?=
 =?utf-8?B?SHRra1JsaVlORzZmYzNBcC90cHMxdTZseWwvTmlWdlBPcXRqSFRoTkNVYVZI?=
 =?utf-8?B?N2xYMnp6cElzY0p3b3JzbGVyek5obGRaNkt5Zm1CRW94bEFNekhNWXJaclgy?=
 =?utf-8?B?TENHd3ZIdk9SSUsyRGwyN2V1eVU5NUxLWDlOTlhzb01YcGxkdmpYbjVDSUNv?=
 =?utf-8?B?bDB6bHVCa3Exc2UwZWEreWVRQW92dEVEcWR1dk1XamtOdlNBVnVZaFVtV1dW?=
 =?utf-8?B?WWwxVXcvRXFadTE0NXgwTmxOdFJSU01td3hyeUZQUkRNY0RsbkJFL1JrZmVu?=
 =?utf-8?B?RTNXQjhVc3Q0U3k3WHBieUVRSUVXZU1Za1c0eDJpQThoSnVxMWd1V0IzY1B3?=
 =?utf-8?B?Y2FoclYxbVB2M1JjTzhBL3c0dEFiZ0p1d2tnQTB2b0tpeFNQQytITVN6L3dp?=
 =?utf-8?B?Y29GZEIzR1FBNEtab3llajRaTmV1TjFzOCt4TjRFM1hkbHlQK0p4TGs0MUxC?=
 =?utf-8?B?NG1GenErOUFRVy9zckZqSjZaUkU0UGpPRnNWUGhtd2hwalE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEgrcG0rZ0FNeUQxbXg5UkI3RDMxczAvZERyL0hxRjVzWk5neTJzN2IrK0la?=
 =?utf-8?B?UCtzTlRycEQyR2FSZTZqcThESXdQN3o5ZzYySHBvaCtaWUpLZjEyeUtOWXdT?=
 =?utf-8?B?UEo0V0ZiOE5UMEcyMmROT0RiejdLalNjS1RERlNvZmtuTU5jMFRCS2pyN2VD?=
 =?utf-8?B?L29sbCtIQW1pUGhJaGJHUitVTVA4QjdQQ3p6a25XK3AveWpsQ1pqSWc5azdo?=
 =?utf-8?B?Ykw5K3czTGk3a0ZKOTBrUHJ4UEROWGtLeUV5a0ZScTZsVzV4NjRvbWlhZ1R1?=
 =?utf-8?B?VjVJdkFhN3FIZlFYOFdLZlUxeDhscldISEpUcmU2dkpoY2E3MThqN29hK0hl?=
 =?utf-8?B?ekthU3hQMDVrdVFwQzEwNE5qOXNFSVRGRWdoa0xvYUpFMDdNZzFLaCsrVlFv?=
 =?utf-8?B?cUhNNEdSN0dzQUZFS0JFVkZjYnRaMDFlK3NIZ0xyQzQrVk1oZTVhdWNxWUlL?=
 =?utf-8?B?UytOWFU1Rzd3UEFmVzBONGxTVEoxYXVWMzcySE9PQ0pheTdUSVpHMllYdldH?=
 =?utf-8?B?SktzOTVRR1VtMEtKaGdPald0eEhscDF3dHYxWlhjSDZSeE41RUp5MUFOQmVC?=
 =?utf-8?B?WmJVaVZ4WlFFdGJ2cDcvV0o4RWlCeStxVExLdndFcW5ITVAyUVdnOVF0ajc1?=
 =?utf-8?B?eFdWTi9xSHdRYlk2VWtGMWZQSmdUNjMvZWVNNy9ZcWQwQUIwanNaSEdPNFNX?=
 =?utf-8?B?MG1TdWNCZktkanNDUVdvazB0UlVtTGJxN2RDOXRCS09GNnNLOUQ4MW05UFp6?=
 =?utf-8?B?VnBISEcvWXMxM0JKS2ZibXpvMTZKajZ6Tzl5OU42WUh2bnRtTmRMUExFVWgw?=
 =?utf-8?B?LzVUdHR3WFpya1RpdFFFR3I4aE96TE4vaGJndVBjc2o4NGEzazlmVHY2WFZ1?=
 =?utf-8?B?d1Z2UTdJeHNnK2hmYi8rN2thbXY0VCtoRjU5c04zamd6R1hRUVhKS3JST3g0?=
 =?utf-8?B?aUMrVFQ3RE9NQkZZS0ZJNExncVFkeU5qcVFOWHh5c1Z0TTZNVnFYYlphQ1Yy?=
 =?utf-8?B?MHA0dHJzWStSMFhGbWl0RmZSR1dkaFUvaEhzNklxajUwbUpwS3RPd0NCUW1z?=
 =?utf-8?B?RHI0UC95dVFKdEh4TDBuV1R0ZHkwakQ1WkgyOTdKdDN5dkwzOVllSy95bko5?=
 =?utf-8?B?emlvZmQzS2JZS052YytSUmx4UUdDSlRRbE9PQysxVm8rMENVUVlXdEZXTUh0?=
 =?utf-8?B?aEtIMHhudDhXelhyWVUxMUtGb29EejExVUpibGdKdUxhODQ1WXc1b2lxUHY3?=
 =?utf-8?B?MkVQWHpoUTNkVWIxZDkrY1RRbjl1a1pzTGFTVXpCbWdpcVFZNUtsTVFuMjNC?=
 =?utf-8?B?SFRXY1BBRGNaTGJaTVlBTmp6UWttMnZTUmQzeUxZRVZWcGhpb0VVYkVFbWZP?=
 =?utf-8?B?STd5MDNKUVJzRi96RkI0TjV5VHlaNXRVR0hrdVA0OWdaL0sxUlE2cEZINE1y?=
 =?utf-8?B?R3loc0RxMzVhaXgydHgzeGR1WUhrRG1xbURCSkx5b3FHbGtuaFFkZ3ZhSTVu?=
 =?utf-8?B?QWgwd0FKL253dWtlbzRDN2toVjQ5bW9YdU4wU3RGTjMyOURBNWZ1YXJ2cVNH?=
 =?utf-8?B?OFVNeEk3MGFublNqRFRFOVpMdCswN1Bkc3ZIcW9mUW9vM1NwZXFQZ3ZvdXFU?=
 =?utf-8?B?SlJtUEoyekNoZDhhZENWSWV6U1BKSnd2VlAzYWJLSzlZV0ZmSGFENDk2d29C?=
 =?utf-8?B?VC85REZhMzNiUzFIeUFnT3lMM1RpWGRUY1FTWVVwSmdUWlM4VytUVW1vSitB?=
 =?utf-8?B?UkRodUZIeHBIMGFMTFN0djRtYm5oUUp4QVVKc1FDb2krUTNIem16MmhBTmVK?=
 =?utf-8?B?U1J2OTZHT1RkWEZ2L2tsbnhwMDZUdTdvcjdVTUNHUCtlNm95bENqYnBOeDJN?=
 =?utf-8?B?akVhRGNHNjVxZ0huZnlVR0g4SnpHbTNneTUxM1Y1K1d4bTVucjlGaWJTdXJG?=
 =?utf-8?B?Z2FHZWV0ckI2dGtWRDk4WXI0RC9xRVpFdXFGVFB3YmIyRmdUNXNOY3dBaFRz?=
 =?utf-8?B?bjZpU0ZWRGl3NXhXbEFHclY0eDFOeWo4cHdBYmpFMzUyaDJGL04ycDFjVWkx?=
 =?utf-8?B?ZTVzTDk5akdNRE9EZ1VhV2hLQUptMGwwQnY4TnBoa01uL0ZiR0xJNW1KZEpt?=
 =?utf-8?B?YTJneDYzajVMU1dPb3A5YmdUQnVRWk1XOHZwcG96bTFWc1R6NmxQZlNQNEJj?=
 =?utf-8?Q?blTxoCI5ZFTsqsYwlEC/foE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B40A5C27AE6734DB5E84A91F1E77BEB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21301655-3534-4984-b00f-08dcd0fc8462
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 18:23:35.0543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIEnRKjTNM04/lizWo229xsYOibPcqZpcKt9pfJ0lTmg2TLeDyPT1N5PDsz27uShEFRybOs/E6Ake4D8kJlm1fMD0IFYEJMCyAV18UMqwB7BEpREyDVz4vaX1O+MGfz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

T24gRnJpLCAyMDI0LTA5LTA2IGF0IDE1OjIwIC0wNzAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEFkZCByZWZlcmVuY2VkIHJlZ2lzdGVycyBkZWZpbmVzIGFuZCBsaXN0IG9mIHJlZ2lzdGVycy4N
Cj4gVXBkYXRlIEd1QyBBRFMgc2l6ZSBhbGxvY2F0aW9uIHRvIGluY2x1ZGUgc3BhY2UgZm9yDQo+
IHRoZSBsaXN0cyBvZiBlcnJvciBzdGF0ZSBjYXB0dXJlIHJlZ2lzdGVyIGRlc2NyaXB0b3JzLg0K
PiANCj4gVGhlbiwgcG9wdWxhdGUgR3VDIEFEUyB3aXRoIHRoZSBsaXN0cyBvZiByZWdpc3RlcnMg
d2Ugd2FudA0KPiBHdUMgdG8gcmVwb3J0IGJhY2sgdG8gaG9zdCBvbiBlbmdpbmUgcmVzZXQgZXZl
bnRzLiBUaGlzIGxpc3QNCj4gc2hvdWxkIGluY2x1ZGUgZ2xvYmFsLCBlbmdpbmUtY2xhc3MgYW5k
IGVuZ2luZS1pbnN0YW5jZQ0KPiByZWdpc3RlcnMgZm9yIGV2ZXJ5IGVuZ2luZS1jbGFzcyB0eXBl
IG9uIHRoZSBjdXJyZW50IGhhcmR3YXJlLg0KPiANCj4gRW5zdXJlIHdlIGFsbG9jYXRlIGEgcGVy
c2lzdGVudCBzdG9yYWdlIGZvciB0aGUgcmVnaXN0ZXIgbGlzdHMNCj4gdGhhdCBhcmUgcG9wdWxh
dGVkIGludG8gQURTIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBhbGxvY2F0ZQ0KPiBtZW1vcnkg
ZHVyaW5nIEdUIHJlc2V0cyB3aGVuIEd1QyBpcyByZWxvYWRlZCBhbmQgQURTIHBvcHVsYXRpb24N
Cj4gaGFwcGVucyBhZ2Fpbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoYW5qdW4gRG9uZyA8emhh
bmp1bi5kb25nQGludGVsLmNvbT4NCg0KDQpSZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4u
cHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo=
