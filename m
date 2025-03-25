Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F65C3600C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 23:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2A610E61E;
	Tue, 25 Mar 2025 23:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzgExYlP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A110E60F
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 23:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742945121; x=1774481121;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=TLKwDA7UrZm1seblViQpwmgPVebys3DD724AM3DX9Gw=;
 b=YzgExYlPmy1kOpx+cpgM3tSUcJcv72hFlwxClt1csF3h6sf5LvjgCq+X
 YpC/IvhZmknuryTokOusNOXweor7HMunZpqMdhJaf+qJA8BPh5OOF1wKn
 7tfMsmH09kOx4jXCTnPn8RvdObCbJ+zVlOfDASUXHqcl21/SdzEtcZibm
 G1isY7ru8X07nfER+Pws7L4oFe4LlS6RyidjVsi0z3IGu/WlSkRrMS2C5
 135EHR+6t5JH1kl42RWje6cT1Hkik4a6gzMyiuTUwyAtkyKw8rqguzuL7
 oV1DuLXt8YBdww9mSKcaK4wJ2p7KQAwn3IgQWvaujWL4zpzigbdhVYuvy Q==;
X-CSE-ConnectionGUID: rzx5qB+8T72p7KKvwldZRg==
X-CSE-MsgGUID: cm6g4nlUTXuZeyTS0m1Ihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54879594"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54879594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 16:25:21 -0700
X-CSE-ConnectionGUID: kecq0E/6R/GNbyeRGSAlGA==
X-CSE-MsgGUID: 5iNZNhCNQrWd+rfE8MYFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="155536676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 16:25:21 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 16:25:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 16:25:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 16:25:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwwKcyH37y/jPkk2BSYsVtg3aVyPqmx9XuBgIhmVz3CmbyibhzxJKUiynedMli8zBYBFiahpm2H08VNg5RDxjwGugwabOw4LDgesrj23jLcv1Y+s4fe6JLk8UYN6CYPHuEBa//ySpDsb+uFzASQTs8YBPLXaz5rbt/t9XCKv3huU86pOpadZDhNMubXhvZmuXYyfupugvd/lCM4ij/nrK6I8MjlU7MPV2cTdYUt7TTq/XROBVaa0hJTHkM787Iac2IvEIZgGEKLUJNeYsEJUmKUf9BFuXr5IuAR3pDad56ZuBZI75LPOoou5LsxWty1WD5bIR6IDYugWzC+5X8CxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLKwDA7UrZm1seblViQpwmgPVebys3DD724AM3DX9Gw=;
 b=w3VDR+0kgCqzkD1qdyQdIEAxQXbdVjFJzOATHmcIdGSRNWdn2LsUbkzcg1IyJVOOcAE7kC9vm0vYLs/TteVtkmEYGXOM72muaNgfb4dcKM8kOoJbAyLTsXjpF5yJAuPuv9Xl21JOTsHP4AWO4DlwvvlUua8vEB2syfSaVTcUufYse4U/fA6JPN+DP/nsqhV6ejLmL+T8l4uYi35ArUgUaR70cRDJ3RBMzNfdTYUAScoUCxu6Y3S9ECPzLFVWrYPqRFn8Nl1bRcQwCRYFUd8u/n8meUTBS7fc3FnMqXJHkXoqcQz8GlmOq/nkHPpUivVnENn70M2HPPvhc2T0bHSs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 23:25:17 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 23:25:17 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Add one additional PCI ID
Thread-Topic: [PATCH] drm/xe/bmg: Add one additional PCI ID
Thread-Index: AQHbndfmEMbTFmWmN0qOGdH3jxmmKbOEfrAA
Date: Tue, 25 Mar 2025 23:25:17 +0000
Message-ID: <0e64fbe4309b874fb70db7b5918fe951254780f3.camel@intel.com>
References: <20250325224709.4073080-2-matthew.d.roper@intel.com>
In-Reply-To: <20250325224709.4073080-2-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|DS0PR11MB7334:EE_
x-ms-office365-filtering-correlation-id: f9027265-1b2e-43be-d95b-08dd6bf44d89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWlIUEhPQ1ZqYklQR01lZDBXWlRqdFN4b1NxRXlpUkZ0NHdBa2RzQ1p6ZkUy?=
 =?utf-8?B?WXhweE1SOTl6K2VhVFhkVHZsZFUxOUVkVHB5MVRJSDRSb2NkT0NvWDdHS3Ns?=
 =?utf-8?B?MlNrc3BCY1IrTXdFYldXWjI2aDEvbkpnbU43MTdreEdTeE1ydW5WTGNKaG0z?=
 =?utf-8?B?aTB6TnJNVlgwQ1RHMTJGR0g4WWhNb2J3TXBzVEhHeU1sekxkcFlycjhiVGM3?=
 =?utf-8?B?TWk5ckNGbG4yRXM1ZzV4KzJGMG1BR1lCQmxOM05HTSsrY0JueDVaeEVUZUhM?=
 =?utf-8?B?enc0NGVDa2tPOUU2V2t5WC9lU3NISlFtVmtBdzU3Um11bC90MnNseVF6anh4?=
 =?utf-8?B?R0hGUmlkUlBKNXFlWmdiVWNYSGcxOU1VWDlGYXk3dU5OOVBWQWpvQ2x1WkRF?=
 =?utf-8?B?ZnJ5Q0FpUjZKOXVScU9XQ2F1K0JXVXk2WTJiUWVWZGdBNFVLenhhaWpRZlRU?=
 =?utf-8?B?SFB0NnVwNTAzRERUQXpvVWJkNFVINCtBRW5OVHJxdFJLd2FjUHVPSWpFdTBt?=
 =?utf-8?B?THl3MzhWTUtCM0EwMjBOaHo2TTdvbHdMUVVKR1IrQ2ZycVZGcUxTOGtYYThx?=
 =?utf-8?B?TmR1MlJucUZzUkNVdlFaMWpYays0WllyK0paOHVNSTdEeUhCbzRzaGh4bkh5?=
 =?utf-8?B?TGduZDVtWjB5OVpQb1RyTmV6UnNCWVVwMlJMeDVkMzFlMHhXa2xEYVI2Z2dW?=
 =?utf-8?B?cEs3MTh1RkNZWjZvZ2F5U3dEL2NBSmdVcFlFNG4rRklnUThpc2J6VCs4MTFm?=
 =?utf-8?B?ZHNjWVFuK0puRmJ1RGM4VUxPT1hNeFR2V1NGam50V2ZTZmY1RjE1ME1aVllQ?=
 =?utf-8?B?NExoOGNuYnNESzdETzJ1VWo2LzlEdHlIdjRGRlpyV3JsWjJ0Vi9kM21odGRr?=
 =?utf-8?B?NVY4QXh0d21OWnA2SFVvTkFaYXFuL2syZkErWEJhelNpKzF5cDdNMHlUTzQv?=
 =?utf-8?B?YWdPUGVOVCtLVi9ZNXJnemhCdXV5R2JWODZMS0ZENkdQSnYvOUJjU1JFRTRD?=
 =?utf-8?B?aXRDOCtPalc0SytHOE5IOCthY3EwM2pLV1RkNTkwS2dPZ0JDVitwRVlxOWRD?=
 =?utf-8?B?ZUpnbDZUT3JLUTZEalJrSUxRTzZLZFJ4QnI0bnU4K1hiVGRvakR6VGszazFV?=
 =?utf-8?B?Nm15RlZLSVNNTHc4WDRNQ0ZzdUpyL29rTWI1OSt2b2JPd0JiQTNQblpuazJ2?=
 =?utf-8?B?MjJVYi9YMGxFODhsaCsrTmVZTnlha3h5UGl3RExiaTNmcVhmOXYrbVhzNE4w?=
 =?utf-8?B?M0xtSGl4djY2S3FoeUp1TUJ0QjdaamUzSjBhcnoyOWxlT2V4eXpzb2ttcnho?=
 =?utf-8?B?azZGbkdxSXROc1ZCUE03Q0pBcW53cHNvVDBib2VDVitPRURyZnF3MjBzQmxk?=
 =?utf-8?B?ZHhydHIvV2lOZkNicFdhZTNUS2cxWGdqUEFpeS9ZcU9QYThCTmJneXlPU2U3?=
 =?utf-8?B?OGVwNHRQRm9HRitPM3Z4MVBlSjVsL3FIaklYZmdnZkRzN0xtNGgvU0RJY200?=
 =?utf-8?B?OVpqVnB2dVRvdVJxb290SXFtZE8xUjRSVDRjdTRWNWtPSEZHaHZmNldTVzZI?=
 =?utf-8?B?c1lLRUhDK0Y0SFBmdGNtOTZ1eHZqYmRONnloYk9BZ0htOXpURnVOWnVWS1Ny?=
 =?utf-8?B?YjBHK3VnTUk0VHRSc01rVEI2VW9BTmRyVU1VUFhBZXdKT3FJTnFUU0xYSFpV?=
 =?utf-8?B?N1NrT3AwbGZHTnhEYmpxQ2ZaNU9tZmlRalRuc0xPT2NOK0ZseVhtTXNiU2lF?=
 =?utf-8?B?WDN2SHkrQ2lqT1o2eTZWUlhrVjNiWHlRd3ZINitEeVdwTXdPYVA3UUJTaUVE?=
 =?utf-8?B?R052cStQYzJBVGZkRTlJUlVjOXJSankvVkVRd2FnUXBlUC9TdmZGOHRtZjMy?=
 =?utf-8?B?QnZUQ1hBaytQWk11WG43M0ozY1o4N3praWg2UllmVGl0MXIva2ZWUldodEhE?=
 =?utf-8?Q?p1sLg4iCLzXc82mSiRspycLm/Bpi7Xpu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2lja3hvNm1JSktaT3o5d3NYaDhhWDJrRFY3M0NiUWhkd2lGY3FDUjlKY2dI?=
 =?utf-8?B?OGh5MnVjUlM3WE5nR2RzaEhzaW9tMWJ4a0F6bWdTMkRxN3ExREtuQS9ybFJ6?=
 =?utf-8?B?cjQyM2JBRnUzVkNoMndJeWxlTW9UY2s2ajdrUjFsV0hmcEROQm5GWGZrbmlD?=
 =?utf-8?B?Mi9VRENzNVJUbGZabWJ4eERrRXQ4VDVERFAvdUMxMjhrR1grNm9ScjZUM1l6?=
 =?utf-8?B?SlowUWNKSVhsVFhOSHdkbGI1djlEZlFBazRacHlNRzl6TC94ZzlmSlJmUXZB?=
 =?utf-8?B?a05QblA0eUh5cHVzbk9TS0pubzFMWkNpUUg5a3RDc1lyblVmVW5NcmJabzVK?=
 =?utf-8?B?UUxveEF1bTdxR21ncVZmR3hiNHBLNTVlZlBOaVdUNWwxKzVuNW9IK3ZoOEJH?=
 =?utf-8?B?N2VDMU5sL2xPMmNwWlBobmg4UU5TcmdaMEtXQzArblJGUGxHSnJRVE9NMnl4?=
 =?utf-8?B?YjcyakZLUXRVSnI5SjEyR043eVNQV21NKzFqbFljaE83VEVxM3lpbHZGZVRO?=
 =?utf-8?B?REhHbVp1OVVVak1ITlQ0cVphMUgxV3lqdXhBL2hrYkxBOHN6WUdwQ2xTVkpw?=
 =?utf-8?B?UGRaeFpKOXBDb0dGR1oxV1FJaFVOTjRhYmthUzBxQ1h6MmszRHB2T0ZZbEQr?=
 =?utf-8?B?ZGxxdDQ0SGdRbXpma0x1cVFiWjY4cGtVdnZWU1R4eUdpV1lqSng2WTcwSGJC?=
 =?utf-8?B?V1VUMXlFT2FzbXptS0RSaitvUEZOc2l4OEwwd2I4NndUQjgzd3ozV3lsNExN?=
 =?utf-8?B?algyWUNOQzZNUUhYQjkwK3lPNHJ2eDRqdkdKZkowNVVMQ0tkVURrOVZLZFBo?=
 =?utf-8?B?NDJaZjQzRjdqVnJIV3FManRrdEo3WlBvcUhBdHBxUDRQU1U0UXdBN1dHNUhI?=
 =?utf-8?B?cVNIRzRPMDE2V0xFMit1c2FiNUN1SUUwUkpsVDRSVDh6V0QrMTNZVncrTXkv?=
 =?utf-8?B?azc1TTIrMnBBbjlEQ3YyYVUwWXV1eWdxYThZUjJmcCtIUDBCZXoxNGZ4Um5h?=
 =?utf-8?B?ZmR4QSt2b1Q4RnNYV3p2VlR6V002MmwrUFZaUE9iWXEvRWRVUVQ2Y21HMWtX?=
 =?utf-8?B?ZjBjR1JNVG1MejFnU0VHaEVlVjFGWVZ4Z3dydkxSQitjVW5yMUR0V0J6OTVR?=
 =?utf-8?B?YjlOR3M1cWZqRUV1K1FQNFNLeVJ1b3NhWDljc3RtOU9Ma0hSeW5wMXVuOW0x?=
 =?utf-8?B?a0FZN09ubE9Tb0hTcGMxOUtDZnZlLzV5WDRBaTJiYkVyWkU1cTNENllWR0tR?=
 =?utf-8?B?bVZvbnlaeWs0UEtCak52dVI0dWYyWnExSGw5V3FMU0pnaUNnT2h5U3ZpTVU2?=
 =?utf-8?B?bmdWWmlkdVRQTjh6RHVuRitlNzBVVzFLMFJNNGdocU1URDdNQjNrejdtMGMy?=
 =?utf-8?B?a3ZkZTY4MlRwdjJsYXhQZ3ZMRU8vNTRiTnZCczkyWDdNaVM0QjVBR1U4aElj?=
 =?utf-8?B?ODgyU2JBWW12ZW0xVktJb3c2dDE4S2MvcEpGL0s5Z2ZpN1hyWi9sZUhEQ2FV?=
 =?utf-8?B?SlBtSnhrRmdRRU1CSmVSaGxYRFErUW5vc1lsVXRsM2JFNllqVVdsQ3Zqdk1F?=
 =?utf-8?B?alJPRmV6Y1IxLzZmT2ZGdWV5NVdTL2JNZVRxYWVHZ255N3dGZlJEMjcyb29v?=
 =?utf-8?B?MjZ5Qk1DRCtnbU5hVUZ5NW5oa2Npb1hjY0xoRTJDU2JuVmE0dU10Ulp4WEZo?=
 =?utf-8?B?K1p4bFNnVFBwLzR1WFRkYVZuMURTbTBocHRDUHZRYUFxdzl0ZWYwMXp0WERZ?=
 =?utf-8?B?S2JDNFhNMCt2ZHhSUGFkQUFwUjRJSHdZTmt3QnZJRFpPZ3FJcWI1R2NvRHkv?=
 =?utf-8?B?WkFIQk95V3g5VHlTRnNzc0ZnWUNyYzFWdFBuaEY0cWwzSGRtVnpoNjNMMVJh?=
 =?utf-8?B?dWQzbGtRazFwVkVNVlpCZTM4ODZFWTI1VjUrZGd6ZmVWYWdreFZUWS9FUm9p?=
 =?utf-8?B?SmcxMmthVVJ3aXJPaVBhNmpENDVNS2tDdEdCak4ycDdsQVRoMXllci9CNkJ3?=
 =?utf-8?B?MzZHQkJubkhkVTVESDdVUXRaaTlNcWpraFJvN0llR0ZUZVUzRCtpT3BRQ01V?=
 =?utf-8?B?azdtdE85aUdDR2RVWnVzckVTaUxzbGc1RERnVGhmVW9Vejg4bDdMUVF2cW1X?=
 =?utf-8?B?dWVPRldxRktFU0poZVRzaytMZVhKejhqbVh6TnJtQnRlcVZQTE5rYVVsY295?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F893315A3C5A849A0E333663626C17C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9027265-1b2e-43be-d95b-08dd6bf44d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 23:25:17.3093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0XDFOuzH2dS70EjTQBpdAxWqX6wwiUTDn6jXkPvDCeIVuKP6dEcAGXxkdS4dMgPExTkKqusoEiFKBIZ2TeKPXzLNAKQ0qzpVTdphD0oV61U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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

bG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5B
LlRheWxvckBpbnRlbC5jb20+IA0KDQotQ2xpbnQNCg0KDQpPbiBUdWUsIDIwMjUtMDMtMjUgYXQg
MTU6NDcgLTA3MDAsIE1hdHQgUm9wZXIgd3JvdGU6DQo+IE9uZSBhZGRpdGlvbmFsIEJNRyBQQ0kg
SUQgaGFzIGJlZW4gYWRkZWQgdG8gdGhlIHNwZWM7IG1ha2Ugc3VyZSBvdXINCj4gZHJpdmVyIHJl
Y29nbml6ZXMgZGV2aWNlcyB3aXRoIHRoaXMgSUQgcHJvcGVybHkuDQo+IA0KPiBCc3BlYzogNjgw
OTANCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4NCj4gLS0tDQo+IMKgaW5jbHVkZS9kcm0vaW50ZWwvcGNpaWRzLmggfCAxICsNCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9pbnRlbC9wY2lpZHMuaCBiL2luY2x1ZGUvZHJtL2ludGVsL3BjaWlkcy5oDQo+IGluZGV4IDQ3
MzZlYTUyNTA0OC4uZDIxMjg0OGQwN2YzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9pbnRl
bC9wY2lpZHMuaA0KPiArKysgYi9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiBAQCAtODUw
LDYgKzg1MCw3IEBADQo+IMKgwqDCoMKgwqDCoMKgwqBNQUNST19fKDB4RTIwQywgIyMgX19WQV9B
UkdTX18pLCBcDQo+IMKgwqDCoMKgwqDCoMKgwqBNQUNST19fKDB4RTIwRCwgIyMgX19WQV9BUkdT
X18pLCBcDQo+IMKgwqDCoMKgwqDCoMKgwqBNQUNST19fKDB4RTIxMCwgIyMgX19WQV9BUkdTX18p
LCBcDQo+ICvCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjExLCAjIyBfX1ZBX0FSR1NfXyksIFwN
Cj4gwqDCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjEyLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4g
wqDCoMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjE1LCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gwqDC
oMKgwqDCoMKgwqDCoE1BQ1JPX18oMHhFMjE2LCAjIyBfX1ZBX0FSR1NfXykNCg0K
