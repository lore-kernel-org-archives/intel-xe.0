Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DA2C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 20:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D20E10E257;
	Wed,  5 Aug 2026 20:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVvOhBbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC3610E257
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785961027; x=1817497027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KfYKK1U5PzVW9Bs8ZVTebALj0x0St1O38i6eZA7yhoE=;
 b=YVvOhBbKw0eqwdtsS+70tT8alHJ6fZlcCn6AXQx1B0zay/LRq5pBZHaG
 KEivZXGHdZiTG6fCpZTXVZc/r8tNjgv9yVNEDNs1uQEcywANFhkMs6T3B
 lbj3qauwxUKtuSB+xJg/hdwpX4IJbAEn63swpOOd/JEchwAgqhcRcF2bc
 3rpgAhitjnkqhRwx8KZyZsHew60xdA5Zgm8p8LYVZv3DbU3+ViGAizvNT
 G/o5ecB3mW7cfdrwazAXY30aXReFECd5uhAwyIbpuu7Rg0PJkyQiLnUqG
 1O3TwDEQIa8d/qn3nFSYt+1c/uAdEFwlC12JTiKX8w4G59g3R626zPY9w w==;
X-CSE-ConnectionGUID: zmhLgBCiR8WmIpCy10RF8g==
X-CSE-MsgGUID: WncWU3ujTwaixQCj+By1UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103949147"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="103949147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:17:07 -0700
X-CSE-ConnectionGUID: O0F68/MSQNuy/X9LeIfEbQ==
X-CSE-MsgGUID: J1ozsBIeTUGKePRWjgcWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="291826645"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:17:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:17:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 13:17:06 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkDtQEJ5Cnz56KD/I9uSLDbDat+f1ImbyTdX5FkI8XVZznOUEzEqKPf9OUgarBj1LzeCZ8PErLseXIm2UypGSK40tXEYRnIP538jxv6E9FVmrCTQnvHNoqtU2IMJGI8DTdGtKkbMQgtKCInqUv+cerhE4FFF4ug7SXGPHVuLdo5l/6IMjcTrFlixuSk2AQ39mqtgmuwmwiUuEVFK7jGbxDSjC8gpLLko6vM8gSou4N776Uqv51mIjCZrzZywr4sWJndXNUvKVCwjkQPxSBGgF5lxoPy3RUZo7gS7oEs+Z8uPK9fHVxNOQTkUqWkZYT2zuaoTIV/mvGUQ9f7FqjuwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfYKK1U5PzVW9Bs8ZVTebALj0x0St1O38i6eZA7yhoE=;
 b=j+aDnyhxDd9cEWj0kitX2b8LXaWKOIj11skHmte8KLVLMEEIT1M1HxiEO862T3QG9HsA4/D0YyjP3MRf81Mt1EudO6vyWl6f89Kfj7ynVF7dI+orOQc31VH9xPG8bs9GFLneQqcwLoTe/g9JbFsJjI3lhy9uX4kuSxkKaTm8NoEBmNkdG/zgchpNXOOHFlt5QzkgXuk516AaWCIS3H5KobdwSjxwZfPsh5JX7+A24UvO17W2kOslmRLOKCmAi41TFaDWQLSY8G2JrwzVI3oL/KIXHSrbvKbxZzoHEBXfhfzm6urHGTJG61LZNzYjn2KOwaD6RssUKixES3giaVSGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 20:17:03 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0270.018; Wed, 5 Aug 2026
 20:17:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add a new debug focused configfs group
Thread-Topic: [PATCH 3/9] drm/xe: Add a new debug focused configfs group
Thread-Index: AQHdG6qjF1VL0nOo1U6Aq566cYWyw7aMtgYAgAIRIICAATBBgA==
Date: Wed, 5 Aug 2026 20:17:00 +0000
Message-ID: <0d440820c7f6a8a7a779d84578c302d9d1a6a4cf.camel@intel.com>
References: <20260724202539.53850-11-stuart.summers@intel.com>
 <20260724202539.53850-14-stuart.summers@intel.com>
 <16435244665fade9cd1079386c572b0bb6edf4d7.camel@intel.com>
 <anKbATzRlRva4Bg_@intel.com>
In-Reply-To: <anKbATzRlRva4Bg_@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|SA1PR11MB6686:EE_
x-ms-office365-filtering-correlation-id: 3b0036d9-c24b-4201-a556-08def32e81fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|3023799007|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: Aj+3n3QqQ/Gfz2CoLTBCJsRuObfCMbJf2qnZwaD6Ii00bRdd/hKmp+MbAz1ZcIqnewaj+n7ZMmzsu4kRdWP5F56Vhr9dv7Qx/r4eGZBdxZLJlIYfy9rVsoLermEgjzB4nhjvCsifGdBZ+NMp8+K15O5pShTJCYt7EJCE0UTj0gz60QHBVt0q5VpVPR4Sju8nSOS4SrYBhxeEgylADFnIvC7QfH02Z4sIs4/JEsi1ZR+9rY7bWOldKa8b5xx1GkUaGzU7QNfVEKwowyKoNJ6riZQ6GiNSoL/h9U9aO6hW5pVdOSz6U4cLMEB6fKayXZaWoi7O/Bucy+ezrwZyvdY4L1HV4BBuU8hd344n3J3ZSzTXGs2sgqBBe8Vl+8W6U4mGqaAZTtoEOCbrMWgURWOqsomzp51ACCuiZxWE/jdYCzcVy+Sl1OyEgBZ/O1OMmEDMQ+ntRm2kvG0wmZ83dsumpEodtb98aCvjZf183QtIVM3hde/NIf1/3tA+Qg8pNmrXmCAyq35/E3swyF/uxoLTiebDGZ9OQwnVukFtP0XU+CfjPxke3TSvbfl6AMqNdNsQQqIwErwbXO3PuIXHCAk0MiTcmEEG5nHAFvZr4KhFqtA7u1JKeOyx3SFgDsOXmzp5ZlYk9azW5rs0bgDPyvoMFm7LWmxo2It3/Gt+GZBdN4M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1RwdUFpWlA1eGhCOXU4MEc4V3JWdzE2NWVNUW9xU2JJRURGaGRPUE1RN09K?=
 =?utf-8?B?TFNESzJNeGxsMmtxUTlBKytGM25jeXZpSHhZSk1FU1NLbzRLSUlzd1M2KzFQ?=
 =?utf-8?B?cjdWVVlSWXp5MFZCdVBtQlVyZmtiKzlxa2I5dDdSSjUzdzJ4SHF6ZDRIU1Fl?=
 =?utf-8?B?S1E0THBiZTlTRStRQk9NaEpOTGhaQjF4ZVdZejJQcis1ZTNHVE5kRGx2ZERm?=
 =?utf-8?B?NEZDeXZoV2s0UGp5SDUzRk1pYjJDYk41aEhtUFNycUJsM25PcFNNQ2hDN3ZI?=
 =?utf-8?B?MVhuUGo1Y0c5UnFDazJrbDFRVUtXcWRKSHZvWm1TUWRPTUVRclg4R2gwWDdl?=
 =?utf-8?B?Mi8xNXlPWTZVa2E4Y0FNUFgrVlh3bUhwd0VQM2t3cStUWkFNbWFNK3dwWGRv?=
 =?utf-8?B?bm9CeVIwbjJrMGYzWndaOElVaHVUT3o2eEtnRE1jYkFNUUQwNzNwekYrVTlJ?=
 =?utf-8?B?T2hSZENrR2gyK2FZL04vQy9Vb3gwSFVvNlk5bURmU294QjRFdUF1dHlSRWky?=
 =?utf-8?B?YzRES3JneE1zVzd1S2VFanBkT3A0SHV1RGFSL0tRMVJPSEtNamZvbFVueHZl?=
 =?utf-8?B?d3NhSU1aTllqQmtvMndFa1ZTZUEzWFN4cDM2ekN5Kzd1bUR2U2VPMll5cVAr?=
 =?utf-8?B?OTV0L2xJU3BjbFJYc2w4TUtQSGd3aHhndCsza09hcXlZcSt4c1YvSTlOMDFt?=
 =?utf-8?B?LzF3YlNkMUwwaGhrVGNiU0oxdnhaMHU1TkRSMHpQZ2l5d2UvTWZwUlJFWHND?=
 =?utf-8?B?T3liMS83Mk96bXg2bXVsMkxRNWFUVW51czZabTdLVklMWE9QTldsKy9NYU52?=
 =?utf-8?B?YVB5MEl5aDE3VWQ3MVd0M3l3Mk9ITkpVdWJDY3lrbFJzbDgySXlLcGhtaUFT?=
 =?utf-8?B?RGl2S3AxUEJXS0VYYVJMZ2ptTFVhU0dCZFNWbWlhYm1xTlY2Q2wyUHdoMUdC?=
 =?utf-8?B?TndKc3dyMU84ZGdtTDF4bzg1OFlBYm5wTFdkbUpIQ2xFbVJPcStUYUtVazFn?=
 =?utf-8?B?M01uc3BMejZycnJkREY5VmxTOG5SclNLUUlZU1d2Vm1DTG9iQ0dWay9RUGEr?=
 =?utf-8?B?a3h0NmJ4ZkVQa1JSVEoxKzJMYzBsK3VqUzZKczlHVnRPdTkyN0MrNElVcGR6?=
 =?utf-8?B?aXpjdllyMUF1SkIxa1ovM1B6cmwyVnB5N2JzNEFobXh3NVUxeUp2NEl1dEpO?=
 =?utf-8?B?L1BweEVnZzBkM29MZGJUS25QcVlRRXNFamxlVkpyczJUWlBlNytscTFPQmo4?=
 =?utf-8?B?MXpiSjlPcTd2cUZyWnV4OWhPZmdzWm1ZQURiNE1DWS8yRzgzYmc3Y1E2WXFR?=
 =?utf-8?B?Q0hSeGt6YjRzNkorTjhTQlQrdTY2eFhFeVZnQmFxRVhDWElpWVhGOHg5YTB1?=
 =?utf-8?B?MHVLdUhVbHBJNUdvQUk2bUFhOFZrVVJmMWg3UmpMbk1iSDBZd2RRL2R4azRm?=
 =?utf-8?B?bFordWk1UDlROFpzNGJsNUJ1T001L0RwTjVkTlJEcGsvcE45TXJsZENmUlFG?=
 =?utf-8?B?aFF0WHR1OS8zbFdEV2V0UEZFSWxCVVE3b0ZsdHNiWG9GaXAxQ2ZjVHBiWlFW?=
 =?utf-8?B?UUg4TVk2KzFjZ0grb0ZQdExlVHFDeFBldDNlYWpTSFNiSWtKNGFTZzBHUld4?=
 =?utf-8?B?ZkVFRGFUYURWY1h5S1VnTUhZNWRuTXg4MUhZb1JGcXpmaWc0cVBibDg0RVZG?=
 =?utf-8?B?TlpyS3A5SGpvWmFYNWRiMndJMks3STFZanViQUlCR291WUxIaHVzMVNLYmpU?=
 =?utf-8?B?OUZsQU1VeWcrMnBvOUF6TUJBeEZsMzB6YVFDTWp0QStoOFVndm9PYWR5eDRs?=
 =?utf-8?B?SkI3cTFEajFiTmlCQWtrNmYrUks5akNuUjB6MHVoMis5MTEwcmxtdmt6aUtu?=
 =?utf-8?B?bDhBQ1Faa3NkZUNrd3VlTldxak1LUlZpOFkwc3Q5bFlkTWdRN2FxRmRVdFpC?=
 =?utf-8?B?UDlaMy9QM0JZYUZFTFBxRVlneUg5aG4rQ3p2Q2ZPV09VUjYxNTdsS2JDT2lx?=
 =?utf-8?B?Rkh1Z1hoWGFFNmdUUGlIZ1ZMY3EvcWF5N0dBN0hjQkZ2bDJBT3JKODZHb3RH?=
 =?utf-8?B?SUEzeUg4Q2duL2NROVk3RFBJVFYwdTRVYUpJYkZwbnpaQU5neWV0WDZJS2Jm?=
 =?utf-8?B?MXVXcVBRZUc3TjRWQmxxcEhUWkZSb3dHUEd0YTFPaTlMYXVVZzhYOEc4Q1Rq?=
 =?utf-8?B?YmxDUTBtM25BcEw3dGVSdUFmWXRZWm1meHRnMzl1THNLZElsbndQTkRmd0FQ?=
 =?utf-8?B?Q21qM2dlb2FFTWQ4c2NPOHhLMTdlWlY4OXJ0K0J3bXdCQThmeWozakkzLzdX?=
 =?utf-8?B?V3V0UE4xYlljc2hHQWlObmp5ZllaNHZGRjdmaDc5dE9PaFZyTXdsZzhEUGZr?=
 =?utf-8?Q?d6L/aumPtriSTJ8Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F195AE1EC8B54A46AE9E22BCFDB805D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eWKvJwJNccJ5IsBtKxBlfGYE8f4XQxtepEaVDwNSTMuhL0sexzwLGePTrUe/9WXEmE9rl4bipSLMAz2B3Hzatz1xXn4zJCZdQan+smGp/CxgxHtCywRr4MT+ReHUwpSvt+VJ5+CxwtIU2rKKVrtFZmex1ikwrshuFCkl0/5pJ2VeEJDiB0y0Y7F1Js9cZY9+YYLKVImannqWXxQINQnL3kDHBKRWx1riyC9fU5zKLL79kma1oKxcXLER+vq0Ij+B3UZiUmUHqyTcjcTmBSbM0/4I/fyPj55w0Gf8a2EOmwLCuNeDfWQbhygA+QRK/THSayBv/R6EqVVF9Yd3JbkcEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0036d9-c24b-4201-a556-08def32e81fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 20:17:00.7784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1thf+7N4dCe02OWUpV98pVNgUlgFYuzuB1fUdZekA2J52yhdssyfcBtDsSj/tnzs2WjDt2Env8RwbhhSMU8/une2zMMpHFwotCub/EiF5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
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

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDIyOjA4IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgQXVnIDAzLCAyMDI2IGF0IDAyOjM0OjE1UE0gLTA0MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjYtMDctMjQgYXQgMjA6MjUgKzAwMDAsIFN0dWFydCBT
dW1tZXJzIHdyb3RlOg0KPiA+ID4gQWRkIHRoZSBza2VsZXRvbiBjb2RlIGZvciBhIG5ldyBkZWJ1
ZyBzcGVjaWZpYyBjb25maWdmcyBncm91cC4NCj4gPiA+IEp1c3QgYWRkIHRoZSBzdHJ1Y3R1cmUg
Zm9yIG5vdy4gQWN0dWFsIGRlYnVnIGNvbnRlbnQgd2lsbCBiZQ0KPiA+ID4gYWRkZWQgaW4gYSBz
dWJzZXF1ZW50IHBhdGNoLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3Vt
bWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+ID4gQXNzaXN0ZWQtYnk6IENvcGls
b3Q6Y2xhdWRlLXNvbm5ldC00LjYsY2xhdWRlLW9wdXMtNC43DQo+ID4gPiAtLS0NCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAr
Kw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuY8KgwqDCoMKgwqDCoCB8
wqAgNSArKysrKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcu
YyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmc19kZWJ1Zy5oIHwgMTMgKysrKysrKysrKysrKw0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfY29uZmlnZnNfdHlwZXMuaCB8wqAgMyArKysNCj4gPiA+IMKgNSBmaWxlcyBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspDQo+ID4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfY29uZmlnZnNfZGVidWcuYw0KPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX2RlYnVnLmgNCj4gPiA+IA0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ID4gYi9kcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUNCj4gPiA+IGluZGV4IDY3YWRhMWQ2YzJmYi4uNTc2NTc1MTc4MWFl
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gPiA+IEBAIC0xNjIsNiArMTYyLDgg
QEAgeGUtJChDT05GSUdfSFdNT04pICs9IHhlX2h3bW9uLm8NCj4gPiA+IMKgDQo+ID4gPiDCoHhl
LSQoQ09ORklHX1BFUkZfRVZFTlRTKSArPSB4ZV9wbXUubw0KPiA+ID4gwqB4ZS0kKENPTkZJR19D
T05GSUdGU19GUykgKz0geGVfY29uZmlnZnMubw0KPiA+ID4gK3hlX2RlYnVnX2NvbmZpZ2ZzX29i
ai0kKENPTkZJR19EUk1fWEVfREVCVUcpIDo9DQo+ID4gPiB4ZV9jb25maWdmc19kZWJ1Zy5vDQo+
ID4gDQo+ID4gQFJvZHJpZ28sIGluIG9mZmxpbmUgZGlzY3Vzc2lvbiB0b2RheSB5b3UgaGFkIG1l
bnRpb25lZCB3YW50aW5nDQo+ID4gdGhpcw0KPiA+IGhlbGQgdW5kZXIgYW4gRVhQRVJJTUVOVEFM
IGtjb25maWcuIEkgc2VlIHRoaXMgaXMgYWxsIHVuZGVyIEVYUEVSVA0KPiA+IHJpZ2h0IG5vdyAo
dGhlIHdob2xlIENPTkZJR19EUk1fWEVfREVCVUcgaW5mcmFzdHJ1Y3R1cmUpLiBJcyB0aGlzDQo+
ID4gZW5vdWdoPyBPciB3ZSBuZWVkIHRvIGFkZCBhIG5ldyBrY29uZmlnIGV4cGxpY2l0bHkgdW5k
ZXINCj4gPiBFWFBFUklNRU5UQUw/DQo+IA0KPiBkZWZpbml0ZWx5IGVub3VnaA0KPiANCj4gUmV2
aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCg0KVGhhbmtz
IQ0KDQo+IA0KPiBGb3IgdGhlIG5leHQgcGF0Y2hlcywgcGxlYXNlIHRha2UgYSBsb29rIHRvIFNh
c2hpa28uDQo+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgZmluZHMgaW4gc29tZSBwYXRjaGVzIGlu
IHRoaXMgc2VyaWVzIHRoYXQNCj4gbWlnaHQNCj4gYmUgd29ydGggdG8gYWRkcmVzcy4NCj4gDQo+
IFRoZSBwcmUtZXhpc3Rpbmcgb25lcyBjYW4gYmUgYWRkcmVzc2VkIGFzIGZvbGxvdyB1cHMuDQo+
IA0KPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjQyMDI1MzkuNTM4NTAt
MTEtc3R1YXJ0LnN1bW1lcnMlNDBpbnRlbC5jb20NCg0KWWVhaCBJIGRpZCBzZWUgdGhpcy4uLiBJ
J20gd29ya2luZyBvbiBmaXhlcy4gSSBzaG91bGQgaGF2ZSBhIHJldmlzaW9uDQpvdXQgdG9kYXkg
b3IgdG9tb3Jyb3cuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiBUaGFua3MsDQo+IFJvZHJp
Z28uDQo+IA0KPiA+IA0KPiA+IFRoYW5rcywNCj4gPiBTdHVhcnQNCj4gPiANCj4gPiA+ICt4ZS0k
KENPTkZJR19DT05GSUdGU19GUykgKz0gJCh4ZV9kZWJ1Z19jb25maWdmc19vYmoteSkNCj4gPiA+
IMKgDQo+ID4gPiDCoCMgZ3JhcGhpY3MgdmlydHVhbGl6YXRpb24gKFNSLUlPVikgc3VwcG9ydA0K
PiA+ID4gwqB4ZS15ICs9IFwNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfY29uZmlnZnMuYw0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0K
PiA+ID4gaW5kZXggZjhmOWFmZTgyNDg4Li40YjkyZTMwNzJkNTYgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmMNCj4gPiA+IEBAIC0xNCw2ICsxNCw3IEBADQo+ID4gPiDC
oA0KPiA+ID4gwqAjaW5jbHVkZSAiaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmgiDQo+ID4g
PiDCoCNpbmNsdWRlICJ4ZV9jb25maWdmcy5oIg0KPiA+ID4gKyNpbmNsdWRlICJ4ZV9jb25maWdm
c19kZWJ1Zy5oIg0KPiA+ID4gwqAjaW5jbHVkZSAieGVfZGVmYXVsdHMuaCINCj4gPiA+IMKgI2lu
Y2x1ZGUgInhlX2d0X3R5cGVzLmgiDQo+ID4gPiDCoCNpbmNsdWRlICJ4ZV9tb2R1bGUuaCINCj4g
PiA+IEBAIC0xMjMzLDYgKzEyMzQsMTAgQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXANCj4g
PiA+ICp4ZV9jb25maWdfbWFrZV9kZXZpY2VfZ3JvdXAoc3RydWN0IGNvbmZpZ19ncm91cCAqZ3Jv
DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9pbml0
X3R5cGVfbmFtZSgmZGV2LT5zcmlvdiwgInNyaW92IiwNCj4gPiA+ICZ4ZV9jb25maWdfc3Jpb3Zf
dHlwZSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbmZpZ2ZzX2Fk
ZF9kZWZhdWx0X2dyb3VwKCZkZXYtPnNyaW92LCAmZGV2LQ0KPiA+ID4gPmdyb3VwKTsNCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9E
RUJVRykNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGNvbmZpZ19ncm91cF9pbml0X3R5cGVfbmFtZSgm
ZGV2LT5kZWJ1ZywgImRlYnVnIiwNCj4gPiA+ICZ4ZV9jb25maWdmc19kZWJ1Z190eXBlKTsNCj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGNvbmZpZ2ZzX2FkZF9kZWZhdWx0X2dyb3VwKCZkZXYtPmRlYnVn
LCAmZGV2LT5ncm91cCk7DQo+ID4gPiArI2VuZGlmDQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoG11dGV4X2luaXQoJmRldi0+bG9jayk7DQo+ID4gPiDCoA0KPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5jDQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40NTYxNzI4MmNlYzUNCj4gPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1
Zy5jDQo+ID4gPiBAQCAtMCwwICsxLDE0IEBADQo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IE1JVA0KPiA+ID4gKy8qDQo+ID4gPiArICogQ29weXJpZ2h0IMKpIDIwMjYgSW50ZWwg
Q29ycG9yYXRpb24NCj4gPiA+ICsgKi8NCj4gPiA+ICsNCj4gPiA+ICsjaW5jbHVkZSA8bGludXgv
Y29uZmlnZnMuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiArDQo+
ID4gPiArI2luY2x1ZGUgInhlX2NvbmZpZ2ZzX2RlYnVnLmgiDQo+ID4gPiArI2luY2x1ZGUgInhl
X2NvbmZpZ2ZzX3R5cGVzLmgiDQo+ID4gPiArDQo+ID4gPiArY29uc3Qgc3RydWN0IGNvbmZpZ19p
dGVtX3R5cGUgeGVfY29uZmlnZnNfZGVidWdfdHlwZSA9IHsNCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oC5jdF9vd25lcsKgwqDCoMKgwqDCoMKgPSBUSElTX01PRFVMRSwNCj4gPiA+ICt9Ow0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmc19kZWJ1Zy5oDQo+ID4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZjkzODQ1MGFlZDINCj4g
PiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25m
aWdmc19kZWJ1Zy5oDQo+ID4gPiBAQCAtMCwwICsxLDEzIEBADQo+ID4gPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVCAqLw0KPiA+ID4gKy8qDQo+ID4gPiArICogQ29weXJpZ2h0IMKp
IDIwMjYgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiA+ICsgKi8NCj4gPiA+ICsjaWZuZGVmIF9YRV9D
T05GSUdGU19ERUJVR19IXw0KPiA+ID4gKyNkZWZpbmUgX1hFX0NPTkZJR0ZTX0RFQlVHX0hfDQo+
ID4gPiArDQo+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJVRykgJiYNCj4g
PiA+IElTX0VOQUJMRUQoQ09ORklHX0NPTkZJR0ZTX0ZTKQ0KPiA+ID4gK3N0cnVjdCBjb25maWdf
aXRlbV90eXBlOw0KPiA+ID4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgY29uZmlnX2l0ZW1fdHlwZSB4
ZV9jb25maWdmc19kZWJ1Z190eXBlOw0KPiA+ID4gKyNlbmRpZg0KPiA+ID4gKw0KPiA+ID4gKyNl
bmRpZiAvKiBfWEVfQ09ORklHRlNfREVCVUdfSF8gKi8NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfY29uZmlnZnNfdHlwZXMuaA0KPiA+ID4gaW5kZXggM2JlN2Q2MTYwYjRjLi5lMjJi
OTQyNGY3MTkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmln
ZnNfdHlwZXMuaA0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5
cGVzLmgNCj4gPiA+IEBAIC0yMiw2ICsyMiw5IEBAIHN0cnVjdCB3YV9iYiB7DQo+ID4gPiDCoHN0
cnVjdCB4ZV9jb25maWdfZ3JvdXBfZGV2aWNlIHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgY29uZmlnX2dyb3VwIGdyb3VwOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBjb25m
aWdfZ3JvdXAgc3Jpb3Y7DQo+ID4gPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ERUJV
RykNCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBjb25maWdfZ3JvdXAgZGVidWc7DQo+ID4g
PiArI2VuZGlmDQo+ID4gPiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC8qDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgICogRmllbGRzIHNvcnRlZCBieSB0eXBlIChsYXJnZXN0IGZpcnN0KSB0aGVu
IG5hbWU6DQo+ID4gPiBzdHJ1Y3QNCj4gPiA+IGFycmF5cywNCj4gPiANCg0K
