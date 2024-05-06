Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEDCC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 18:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C2510E6BA;
	Mon,  6 May 2024 18:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ny529dLr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DC810ED67
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 18:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715019020; x=1746555020;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+LBbf+hVMa9C33Ex36uMyvrrkWp/HP83VEifZ8QQYx0=;
 b=Ny529dLrGtk4vjSTvByyc3h6FuOanW0wfwtjmEV1Q0jcRUTYnSOKyiKo
 pAVuX2m8b94E8FA0XVC22ah4h56nlrjvGwOaqwMLzTrZap1W7046ORQJz
 oKdUF9FZLIN5Bc58WbwRFbc4ipsTAK8o3ZDQLbG1Zv7pNUuogGPG41QgX
 G42ON3T4Z1heA93/wS+xfTxbcmvFMarQOGlHOO4gpZmMqk2dc6QHHtLKB
 bkIlRQZo+vbhiqkJ74M3W4Nr+zkzxQuRQ1k1fYXwplf8RxzV49VUb0RGM
 snLApUySQ2hEjj0JtdTbe1/VVprnmXpDGP5MqySXi8cuYVfHWAchYWdhU A==;
X-CSE-ConnectionGUID: T4/VXwGJTrqVDakx06mnkA==
X-CSE-MsgGUID: S3quWuueTWKUxxyVm5h3JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10941079"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10941079"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 11:10:19 -0700
X-CSE-ConnectionGUID: odG0WfNgS5CMQaONSaOxKQ==
X-CSE-MsgGUID: P0nc0nYXSuqvjMHFEJoYPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="59099976"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 11:10:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 11:10:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 11:10:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 11:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeyFydGllQ2lImWGqGdznZV1at/kiO0dffPGjVQ/NIT/7TY3k797ju6GJ+OouHqU726oCvBCH5R/0y/f1wuHwcQAvqdeP73IVz0+nxO19pAAl0utIesbEHoU3F8rp6zwzPUpVTwc/5aygfPqdElIAnxj/LiOk7ZS1TFMIHvoVXnMA3vdCz/9TT7hn4qYsi0tRVYAPGArSZtbGv6lVRBFttwdpy8SXr/X8Jp6J3dwYgiMuYAws/IECg8+nJVpfSm/FMQv0MUo6116vqVb1cPJSNXfwM8+E8dV1pIMj1jSup9nITtkPVr54woVKLXKKi0vZxVYc9nFY+O0WphuHExpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LBbf+hVMa9C33Ex36uMyvrrkWp/HP83VEifZ8QQYx0=;
 b=Agn0VirD+0I3kN9Og0TAaUmpVErmeRMtz2zyyjQI2+oBpCflOIV4CaoFT9WcYLO4GGHfDi61hF5wDbq96iF49NZdyVPzg6zWJiJtDz+D7h4Y6yzbvkLD3ILp6SoU3T5oYqXPpxvIVMAAZiXQ6fEI+WKTzOJAPnLfrUx+NRiccO+V6b+yIMcO0g39Tq7A0RW/2H+IICQ9WmTZUvBjBOU0ecIi/YBi0MphmyqRWBCnvcLNzESabWw2XC3hZygxaW5nPARNyBC2f5UeoJCyyMQKxkcSseIvVRQTVVWw2GevwPTHGsCxp6c6Zy4zRQ2PYtce7RHajysby7MTTMsmh3tLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.42; Mon, 6 May 2024 18:10:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 18:10:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Dump Indirect Ring State registers
Thread-Topic: [PATCH 3/4] drm/xe: Dump Indirect Ring State registers
Thread-Index: AQHannvCdmJTm9AVckegnRQCBkjeD7GKhEiA
Date: Mon, 6 May 2024 18:10:08 +0000
Message-ID: <af406b41b55a464a89437fa528f2560f0a697c49.camel@intel.com>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20240504233503.16095-4-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB4941:EE_
x-ms-office365-filtering-correlation-id: 86871ddc-c89a-484a-ac29-08dc6df7c3e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?QkZuTkhON3picVZHbDJ2MnpDNFhjaFlHdlFMQnpLS1BhZTR6WmJ4ZEFMMi9l?=
 =?utf-8?B?RWcvZVhIYXdTMGs3UDhYV21UemZLUi8rT1pjTGFCWFR0M1BVckJiOGRRTWZ6?=
 =?utf-8?B?R1h4RVRMcVExNlUzanlYUitNWjBldWwwZkxLcmdCWUp5c08xLzdIMDFQK0FH?=
 =?utf-8?B?ak8zY3c0Y1ArZzZpcjhZVWNIaWdHVVJRNmFaYThOYmVPTkhmNzlDRktDaGdn?=
 =?utf-8?B?TGU2Mi9uUEFkdTRmNnk1bnZIZXo0K0dSdStCeTl4T0JqZXdXdGhvaWo0bFJZ?=
 =?utf-8?B?aGJnVmV5RDFFRkxQWWtwTDJpM3JrbUxraEw0bEphTDRaUVNXMnV0VWRmdDJj?=
 =?utf-8?B?MzBrTkN6MjVGTmg0b3UwV29pbnlpcHN4NVBZS054aGdXNFM4YklLUmM2NVpM?=
 =?utf-8?B?T0Y1ZHpuOU8ycTB3aW1nVGRGY0hSMEFwRlBHbjNGd3NQdGdJZVZOWFpFT05v?=
 =?utf-8?B?dGZRZy9FeTlGa2pqdkF6aUtzSHRoMzJCNGVMdUEzMVJCMk13dGwvcUhCbEZz?=
 =?utf-8?B?Q0lMUCtOTHgzdjljRXhWb0o4b1VPcWxYRXBPamt0VDFrTUpvWHBxTVllUzY5?=
 =?utf-8?B?cmF0eEwxb3dVb0g1a1krUk9tcUNnUUs0R2xNMzlPMHhrYmtpKzZ3VUJmNGRs?=
 =?utf-8?B?TXVoSHZmbFRqZTJNMzE0RkNnREJSc0w4VDhVMVpYeWVZV0xsRk5YQ01wYjFI?=
 =?utf-8?B?TW5LWHladkVWa3BtZ1NnNHIvQnNoWVVrV3hNaTBCYzlMalVQUkhZZy9oSDBa?=
 =?utf-8?B?NU5JVE5hWEJSenluZktvN3RLVk1jS1NST1M0enpYb2NvM1MrbVpaS0xabDE3?=
 =?utf-8?B?S1RtV293aTdLNnlmNGlUTzFWVFk0NEY4bWwzUWZVNXM4S0hlQ1N6OVNVcTdo?=
 =?utf-8?B?QlFMOW1pV0xxUEZMQzk1bGlGdmFNVUgxN2N6TjV3R0JydHN5Uk1oSjc2MHJ6?=
 =?utf-8?B?c0NVTHkwNWNnSytFU1FubDBhOHNBNlRpU1NFSG0rZTZrbEVZTUdDaVBTRmIx?=
 =?utf-8?B?NjhMT2pHM3NQVFVKUEpBMjRUb3YyUmJSbUFaa1dCYlh4cXQ3a0lubzIxbEFj?=
 =?utf-8?B?cEIxa09jOE5uSnJXMTNzdDNUbEFGK24rN2ZGR3I2V252VkloRjRqQTFLd1Fn?=
 =?utf-8?B?TFNLUWl2UDI3VkIvV0hLMFpGN1YvUFQzYTdYVDhyY25nckx0QzdyWTV4MndC?=
 =?utf-8?B?MTNBRVVDZmhxcGNYd21Rd3ZudTlLMnNpUk54YjdRUzZ6TGlPS21SN2dPZHpK?=
 =?utf-8?B?SHQ4bEdUSmdyRmtCZ2R3czdvTEkvV25iUVpISGluWktiZThmV2lQZnFla2Vu?=
 =?utf-8?B?cmpYY3lHR2RnSEplWDRKa1hHMnRlSkE4UXl3d1A2NnhaK3ZVd29HV2xOYXhN?=
 =?utf-8?B?VUpaZUwvYmlaWlh3bVRYVG03ZWZ5SzlpZkpIUnRPSmJwU2l0aEZrT1lINmRm?=
 =?utf-8?B?bGpEeDNiQ0NvZUtSckNTVnd1SXUzT1NIdVIyYTV5Zk9jTVpTaUJmditGUDFp?=
 =?utf-8?B?SVVoRytrS3R1ZFFQRGtCaVdUSU9tRHphSFplRmVqWnlCR04zZExkMVNqbzB1?=
 =?utf-8?B?RmgvclVvWCtiR2xUd0k2YmRDeS9QQ1hpamM5azBaN045bVhpNFpmeU1MTW1s?=
 =?utf-8?B?WXBQc2UvY1o3YjBtNm9ySFlnS3Z5M0ZZbnZuVC96cm8vTzgyNy8wRlJCRm5K?=
 =?utf-8?B?V1luSmJrVDFhOGVkNmFFczJSYllTbFhCT0Fobkl5bWVBZTdrSmgyaGFqTlVo?=
 =?utf-8?B?clBrV292dTlBdUhWbDcvaFpRbjd4RmptWkk2NlBpZmYwVmZBaEkzbHNiWFcr?=
 =?utf-8?B?OWhOcEFLSjVOQm1OODJGZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmUwazdoQmM3UFAyckNQSG5vNGdpUStVbTUxWFdnMU55Tk1xdzJVaFdaSFpw?=
 =?utf-8?B?TUx3anozS3RTcjhubnIvOUV4S1hXcU9uT3J0dmNRaEFWUElvN2JMQW4yd0Nr?=
 =?utf-8?B?amprKzU1VWNtV0FHTGYzcW5ubHVRektNV3l0Y09vZWFzWFQ4bEZhSUVwV3Zm?=
 =?utf-8?B?aFZWVFd5cTNjRGJCN05jZHJoaFN1Yk1EN1BxVGlmKzlIcUlNNE5GcEV2MHNH?=
 =?utf-8?B?Z0haY05FY0pXeEpQQkhONFE5OVR5MksyclpoaSt6cCtKekFyNWJ4U01LOVdn?=
 =?utf-8?B?N2p4K2lKMFJqVnZpUmoyL0czRWFwMWlYenFvU2Mwa0RmRk5uSjdaZGFUdlJW?=
 =?utf-8?B?LzNpSFg0QnJiNURMaGRCd2k4SWppTmduZ0t5M1B3TXBZL3NCcVhrT0NwNVRh?=
 =?utf-8?B?dFp4REgzYXVscXpQbER4WFJBWHZINnFscElpejYwU3RRdkRaUUVkSHNMVUp3?=
 =?utf-8?B?MXFvemg0SHkzbDdLbG5aaTQwb1YrbEZnTzZTVzBQYVNodHVERWpmdkViVnRp?=
 =?utf-8?B?MkYzZ01oZGIrV1BXSjRnbWZodi91TVFZaFdrNGdNRzRDc0xTdlhwaWludVBS?=
 =?utf-8?B?NUVDNFV4NkF6ZUVlSUUzS0d1ZEgyK2NLbjEvQTErc1I3a0MxSUZSakp5S2FO?=
 =?utf-8?B?eHBQZXR6NzlTQUk3R1NjdFpjUHgrbzcrcW02bWIyRjRZQXpTTkkvWVNxcGt1?=
 =?utf-8?B?blZ3Yno5QkQyaW4vQnlrbHQxK0VldXpGRDZVQTM5akxPUWV0TzZMdFJyQlFx?=
 =?utf-8?B?eXVJaWhqc3Q5OUZ5SW5jdHFxU0t0RlV0dTIwYWZqdGZvbTRtaHJBMzZlVXhU?=
 =?utf-8?B?bXZOb0c4YmRVQmdYQnhtbFJrSkpyejd2WmlpMkZwcmwzMHNreWZyUXAwMjBO?=
 =?utf-8?B?ZzhEVXRod0w0UTdHM3UwbC9CQVVCVEsxbldkeE9PUWFwT2N4TUVDVkFrWG5l?=
 =?utf-8?B?RzRDVEJHM2pod2NPMnZGQ1hzSHJMa2RuTDRmRGJLSDhRdm9UWnUySllxbjM5?=
 =?utf-8?B?N1FnV1FzV0lSSmhPOVpGRDFoZXViaGFJT1FrdjhCK04vQUg1UURGelpJeEVD?=
 =?utf-8?B?TkJhdm5DMkZWSkxsL2JMcmtzRER4ZEtjY1NpTVd4andvdThuVHk4V1lPaGxQ?=
 =?utf-8?B?NzZkWW5RM25BeGIrd2ZZVVdpZTdRblRiMjF4TFBMR1FGTmZkYk5LREplb2Zt?=
 =?utf-8?B?QjRQenBKQWM0cFB3bnR3UnczOWROQ1k1ZTljTWwxOHhFczg5NGVqcngwaU5C?=
 =?utf-8?B?SG13V2ZKM0k0SEZVK3dNaDdLL1BsMUQxT3plMDNvWU44RUNnWnNXNjVrVi9s?=
 =?utf-8?B?Mng2RnlnSWdMWElYTzFGb2xIM3ZOWit1a01JNlM2NWJoMm85R25sVnV2dTlm?=
 =?utf-8?B?cmhzUjMzRmdFSzdmSTk3eml1TWw5SFVmeWkxbGhnWlAxbmVtcVdDSXA3UVFU?=
 =?utf-8?B?MjZqS0tNTlFzTFdjQXZVSjl1ZjZBMXF4YktBejlSQUEwZDdHa3ZJTllTZ0xV?=
 =?utf-8?B?ZUdJUEZRQmtTaTdxODBiSk81NnI5Z2RIeFJ6NzhHZ0RwaTZLNVRZWnFtNC9N?=
 =?utf-8?B?RkQ2VEtFdDF3Sml5NkliK0NnYS9GdEhTb1FiTGZFQjJuUktrNWVWazVydWoz?=
 =?utf-8?B?bTNKN091ak1YL2NabUNKS0szbnBPTTZTQUE3Y3VHREh1Q0ZLWExBanlRYVVG?=
 =?utf-8?B?ekJqT2IySmRIdHNXQjNuL0tqbG1DNnJhR0U0bWI2VkhCeVVEd3RxQkpwdlM3?=
 =?utf-8?B?RDNSOHNQTFY2VFQxUlBXTjZSN3RrbU9lSFUrZlFNOGdHVWJpMENkVlcrR3FC?=
 =?utf-8?B?bTFxQnkrR0RqYU40aHUybkZIcnFKRy9uNHFuUWJZc1JZNEpFN29BbFlMdmli?=
 =?utf-8?B?SkVuTGJUN01GeFFCb3F0eVA0T3hLZTRGOU1ld3BreTRxbTc5ME5uVmpXcWpS?=
 =?utf-8?B?YVdNMW1Hck1nMjZWVU0rbmJRZVRZMmRJdE16QkhTUzRJOG8weVNxaVNmNTU4?=
 =?utf-8?B?SUtoQ1dkWDFhL1BDOGl6c0ZkOWdnSjFjQVZ4S1dXTy9yY1hKdVQwZXlaSkFN?=
 =?utf-8?B?ZGVNZVVuT2pPWXYwMEQ5ejJHN2w1dGRPZzlQYTVOcElhMUJvb0lLdEhud28x?=
 =?utf-8?B?aGZCVTBvS2h6Z2szVVlHanpaU28xNFJTZXF4UnNEOUh0MDlsZHIyMi9QdDlp?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B76BB87AFF75B548AF43DCC64E0915DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86871ddc-c89a-484a-ac29-08dc6df7c3e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 18:10:08.9932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdyUpWQUonbKahevNF2A1Uz/3V35dX/oDixsAkYCZYBQog5TC6l7gUx+benpeiLHABzHDkvPPHKQe+0LWnRrnYVjDgcQLZpWPFW/aef5L88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
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

T24gU2F0LCAyMDI0LTA1LTA0IGF0IDE2OjM1IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IER1bXAgSU5ESVJFQ1RfUklOR19TVEFURSBhbmQgUklOR19TVEFSVF9VRFcg
cmVnaXN0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEK
PiA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVyYUBpbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogU3R1
YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oIHzCoCA0ICsrKysKPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9od19lbmdpbmUuY8KgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrKysrKysK
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaMKgIHzCoCA0ICsrKysK
PiDCoDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oCj4gYi9kcml2ZXJzL2dwdS9k
cm0veGUvcmVncy94ZV9lbmdpbmVfcmVncy5oCj4gaW5kZXggMjYwYTQ0ZjQ2ZjdlLi4yNjNmZmM3
YmMyZWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfZW5naW5lX3Jl
Z3MuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2VuZ2luZV9yZWdzLmgKPiBA
QCAtNTUsNiArNTUsOCBAQAo+IMKgI2RlZmluZcKgwqAgUklOR19DVExfU0laRShzaXplKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgoc2l6ZSkgLSBQQUdFX1NJWkUpCj4gLyog
aW4gYnl0ZXMgLT4gcGFnZXMgKi8KPiDCoCNkZWZpbmXCoMKgIFJJTkdfQ1RMX1NJWkUoc2l6ZSnC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoKHNpemUpIC0gUEFHRV9TSVpFKQo+
IC8qIGluIGJ5dGVzIC0+IHBhZ2VzICovCj4gwqAKPiArI2RlZmluZSBSSU5HX1NUQVJUX1VEVyhi
YXNlKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgWEVfUkVHKChiYXNlKSAr
IDB4NDgpCj4gKwo+IMKgI2RlZmluZSBSSU5HX1BTTUlfQ1RMKGJhc2UpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1JFRygoYmFzZSkgKyAweDUwLAo+IFhFX1JFR19P
UFRJT05fTUFTS0VEKQo+IMKgI2RlZmluZcKgwqAgUkNfU0VNQV9JRExFX01TR19ESVNBQkxFwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBSRUdfQklUKDEyKQo+IMKgI2RlZmluZcKgwqAgV0FJVF9G
T1JfRVZFTlRfUE9XRVJfRE9XTl9ESVNBQkxFwqDCoMKgwqBSRUdfQklUKDcpCj4gQEAgLTExMCw2
ICsxMTIsOCBAQAo+IMKgI2RlZmluZcKgwqAgRkZfRE9QX0NMT0NLX0dBVEVfRElTQUJMRcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoFJFR19CSVQoMSkKPiDCoCNkZWZpbmXCoMKgIFJFUExBWV9NT0RF
X0dSQU5VTEFSSVRZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFJFR19CSVQoMCkKPiDCoAo+
ICsjZGVmaW5lIElORElSRUNUX1JJTkdfU1RBVEUoYmFzZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgWEVfUkVHKChiYXNlKSArCj4gMHgxMDgpCj4gKwo+IMKgI2RlZmluZSBSSU5HX0JCQURE
UihiYXNlKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgWEVfUkVH
KChiYXNlKSArCj4gMHgxNDApCj4gwqAjZGVmaW5lIFJJTkdfQkJBRERSX1VEVyhiYXNlKcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFhFX1JFRygoYmFzZSkgKwo+IDB4MTY4KQo+
IMKgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYwo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jCj4gaW5kZXggZWM2OTgwMzE1MmEyLi40
NWY1ODJhN2NhYWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2lu
ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jCj4gQEAgLTkwOCw2
ICs5MDgsMTMgQEAgeGVfaHdfZW5naW5lX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0Cj4geGVfaHdf
ZW5naW5lICpod2UpCj4gwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5yZWcucmluZ19od3N0YW0g
PSBod19lbmdpbmVfbW1pb19yZWFkMzIoaHdlLAo+IFJJTkdfSFdTVEFNKDApKTsKPiDCoMKgwqDC
oMKgwqDCoMKgc25hcHNob3QtPnJlZy5yaW5nX2h3c19wZ2EgPSBod19lbmdpbmVfbW1pb19yZWFk
MzIoaHdlLAo+IFJJTkdfSFdTX1BHQSgwKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5y
ZWcucmluZ19zdGFydCA9IGh3X2VuZ2luZV9tbWlvX3JlYWQzMihod2UsCj4gUklOR19TVEFSVCgw
KSk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHhlX2d0X2hhc19pbmRpcmVjdF9yaW5nX3N0YXRlKGh3
ZS0+Z3QpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5yZWcu
aW5kaXJlY3RfcmluZ19zdGF0ZSA9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBod19lbmdpbmVfbW1pb19yZWFkMzIoaHdlLAo+IElORElSRUNUX1JJTkdf
U1RBVEUoMCkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzbmFwc2hvdC0+cmVn
LnJpbmdfc3RhcnRfdWR3ID0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGh3X2VuZ2luZV9tbWlvX3JlYWQzMihod2UsCj4gUklOR19TVEFSVF9VRFcoMCkp
Owo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoHNuYXBzaG90LT5yZWcu
cmluZ19oZWFkID0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGh3X2VuZ2luZV9t
bWlvX3JlYWQzMihod2UsIFJJTkdfSEVBRCgwKSkgJiBIRUFEX0FERFI7Cj4gwqDCoMKgwqDCoMKg
wqDCoHNuYXBzaG90LT5yZWcucmluZ190YWlsID0KPiBAQCAtOTk3LDYgKzEwMDQsOCBAQCB2b2lk
IHhlX2h3X2VuZ2luZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QKPiB4ZV9od19lbmdpbmVfc25hcHNo
b3QgKnNuYXBzaG90LAo+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICJcdFJJTkdfRVhF
Q0xJU1RfU1FfQ09OVEVOVFM6IDB4JTAxNmxseFxuIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc25hcHNob3QtPnJlZy5yaW5nX2V4ZWNsaXN0X3NxX2NvbnRlbnRzKTsK
PiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiXHRSSU5HX1NUQVJUOiAweCUwOHhcbiIs
IHNuYXBzaG90LQo+ID5yZWcucmluZ19zdGFydCk7Cj4gK8KgwqDCoMKgwqDCoMKgZHJtX3ByaW50
ZihwLCAiXHRSSU5HX1NUQVJUX1VEVzogMHglMDh4XG4iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5yZWcucmluZ19zdGFydF91ZHcpOwo+IMKgwqDCoMKg
wqDCoMKgwqBkcm1fcHJpbnRmKHAsICJcdFJJTkdfSEVBRDogMHglMDh4XG4iLCBzbmFwc2hvdC0K
PiA+cmVnLnJpbmdfaGVhZCk7Cj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYocCwgIlx0UklO
R19UQUlMOiAweCUwOHhcbiIsIHNuYXBzaG90LQo+ID5yZWcucmluZ190YWlsKTsKPiDCoMKgwqDC
oMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiXHRSSU5HX0NUTDogMHglMDh4XG4iLCBzbmFwc2hvdC0K
PiA+cmVnLnJpbmdfY3RsKTsKPiBAQCAtMTAxMCw2ICsxMDE5LDggQEAgdm9pZCB4ZV9od19lbmdp
bmVfc25hcHNob3RfcHJpbnQoc3RydWN0Cj4geGVfaHdfZW5naW5lX3NuYXBzaG90ICpzbmFwc2hv
dCwKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiXHRBQ1RIRDogMHglMDE2bGx4XG4i
LCBzbmFwc2hvdC0KPiA+cmVnLnJpbmdfYWN0aGQpOwo+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJp
bnRmKHAsICJcdEJCQUREUjogMHglMDE2bGx4XG4iLCBzbmFwc2hvdC0KPiA+cmVnLnJpbmdfYmJh
ZGRyKTsKPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiXHRETUFfRkFERFI6IDB4JTAx
NmxseFxuIiwgc25hcHNob3QtCj4gPnJlZy5yaW5nX2RtYV9mYWRkKTsKPiArwqDCoMKgwqDCoMKg
wqBkcm1fcHJpbnRmKHAsICJcdElORElSRUNUX1JJTkdfU1RBVEU6IDB4JTA4eFxuIiwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbmFwc2hvdC0+cmVnLmluZGlyZWN0X3Jp
bmdfc3RhdGUpOwo+IMKgwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICJcdElQRUhSOiAweCUw
OHhcbiIsIHNuYXBzaG90LT5yZWcuaXBlaHIpOwo+IMKgwqDCoMKgwqDCoMKgwqB4ZV9od19lbmdp
bmVfc25hcHNob3RfaW5zdGRvbmVfcHJpbnQoc25hcHNob3QsIHApOwo+IMKgCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmVfdHlwZXMuaAo+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oCj4gaW5kZXggOWY5NzU1ZTMxYjlmLi41ZjRi
NjdhY2JhOTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90
eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZV90eXBlcy5oCj4g
QEAgLTE4OSw2ICsxODksOCBAQCBzdHJ1Y3QgeGVfaHdfZW5naW5lX3NuYXBzaG90IHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiByaW5nX2h3c19wZ2E7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHJlZy5yaW5nX3N0YXJ0OiBSSU5HX1NUQVJUICov
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgcmluZ19zdGFydDsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEByZWcucmluZ19zdGFydF91ZHc6IFJJTkdf
U1RBUlRfVURXICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiByaW5nX3N0
YXJ0X3VkdzsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAcmVnLnJpbmdf
aGVhZDogUklOR19IRUFEICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIg
cmluZ19oZWFkOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEByZWcucmlu
Z190YWlsOiBSSU5HX1RBSUwgKi8KPiBAQCAtMjA3LDYgKzIwOSw4IEBAIHN0cnVjdCB4ZV9od19l
bmdpbmVfc25hcHNob3Qgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyIHJp
bmdfZW1yOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEByZWcucmluZ19l
aXI6IFJJTkdfRUlSICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1MzIgcmlu
Z19laXI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAcmVnLmluZGlyZWN0
X3Jpbmdfc3RhdGU6IElORElSRUNUX1JJTkdfU1RBVEUgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdTMyIGluZGlyZWN0X3Jpbmdfc3RhdGU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKiogQHJlZy5pcGVocjogSVBFSFIgKi8KPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHUzMiBpcGVocjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoC8qKiBAcmVnLnJjdV9tb2RlOiBSQ1VfTU9ERSAqLwoK
