Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2AAFD45F6
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 21:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFFF10E04E;
	Wed, 25 Feb 2026 21:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYFjHZa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0582010E04E
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 21:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772056335; x=1803592335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aG9idWffn8l/mSKwiUGNH3P4o6mg5StjZA71Z/KyJ0g=;
 b=OYFjHZa5VWbidKODG4kIjohkUW62iiaZdBCUesP6NltwobwBEJqX82b+
 X1TJXAoqsH6bMG3eVEHJPl+FsT1cieGi+lYpg8A89a2q13nuS1q5UtJvu
 GvJvGOGMuKm3Wqi2MUjy3K7Hr/Smm5VZvAzMrSMNKwwbhWOnXl+tAKOI6
 fhWupjS3ZQr9HO/v6mF353JQuxPSybNK1rSRxvkkVm9SGKh2I8Pfa3wWJ
 WAQpgzTkPtRMdTqzuCSnTUkKTf4sN9jaNi+PyoZFU4hw4tMhUobCJPYFy
 M8NRFfpVltE5O1jrvBC2yk9WBVUC28g6LCxLNdYWNdvIlbnPeTKhmOX+B A==;
X-CSE-ConnectionGUID: WMCl/UeeRdC9UDV07o0U3g==
X-CSE-MsgGUID: j4ZBfym8R/mrv4hiTwuWTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73083459"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73083459"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 13:52:14 -0800
X-CSE-ConnectionGUID: uwZREXHgQj+EmnLPd5qbaA==
X-CSE-MsgGUID: WB0pLAGLS8WFG0i/oH0CWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="214428546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 13:52:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 13:52:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 13:52:14 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 13:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJmyjVrpNUI1F9MTuNDBAFdnaiJWs9GtP/WRREMGQSNorYhzpaqC30G35KFJdySptCTREGCV//lm1fTNkURooT5tKbMKezojl2G/yD6SU8BO1ODRmUCZRGUoWK7XVFlJsDf4i4niV07aU7F9rLT78kHSpsNbWxiHnzOgRJcSyOjY1H/PpCyauWSDAw72LZduHy0NNEAzayWGDI/pdl4fODavRVUews9E2+gFAtzYwapW6b1dst8pLEH7nJvuOAQgd/CeUxcnOlEULZQS2zPsIx2U2iHNtvrI7yvAiUbY6XB605qeQeD/kUxlLnEirQUi12toPba30DBx5raTRxRJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG9idWffn8l/mSKwiUGNH3P4o6mg5StjZA71Z/KyJ0g=;
 b=CB1MwCVSu+BUZPPWJ9G2UNSBZJc3mqVBjvXAygyIKBn23lM1c5QH98petpBd25lgmbNUQfQj3aSQGkDjvb1k3nl7CYP44i4aXSk+4ZsY46qVfwoemvM5/JOsey1co81qQKLvgyKotocrSduuwCaxxCdtudI49NrHEsKjSH4lxVi/EqoQlnUzDcTu2c/Jw9zlY1BBRTWy2JXGCdtccvIg/+mETNVFsd1NTdSQVs0OSbQuTDEaCPy3YAWhJ4cQQKM6+W6nSRzG4nBRm6AnxWqFRvlSx9qMBJgtHqpsmwFi/cs3fjiq0efm/Nw/IozbDrvY+oSOnc9T0nkRphncjuKd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 21:52:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 21:52:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHcpc1ACopzm9zQd0mkapYwt88VObWSjoyAgAFn1IA=
Date: Wed, 25 Feb 2026 21:52:11 +0000
Message-ID: <0e02e8acf4391d49c0a6d6d7a9aa0ef747033338.camel@intel.com>
References: <20260224203616.365912-1-stuart.summers@intel.com>
 <20260225002417.GO4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260225002417.GO4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB5114:EE_
x-ms-office365-filtering-correlation-id: a155c044-d2ae-45c7-a799-08de74b82130
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: NP8wwt624BNJblljaxAJEWHqMM62Zo6W+OmNBTuE6QJS1R/Xwiq+e+En+Me5ati0K4Aq5caWOH8RRTuCRzzqVwuHsKeGViYsxXeZ4CZglxRh2gSEFRXV/RmXDAQ/JBiZaKiwQelanclZOURavlVmtapwdr+rlEgsEB0xf2IRJk45Cj4crVnorOque2Cb7s8Y2Xw5cV+IQdQJZLwoK5ENLEZ/kLV8k1mellpXu7WFJB/IMw3CciPylYWvx1hIvVuh2yz0AYCt+a3s/Ehiavt0jFWMcbZ1Q+BEoTrX3O9F0AiXPhY5GDkgFcr9iTJPwZElJ6S9rxJ3ipSiOz5UPWgj5/+vHyrID1bIjz/awu7aFbN+G+Qc6+y096s3c7opp+P35+ah70Gp7QYsiuQmu+KGuRn0emTg3VvwQ4qTzC2/u0ri1hv4TjD8k1/TcCNFAbuFdTnPz/iL3jtdLb1dTAwaYxJ4+jfiPVPAGrQ6w1lYswm31S9FYNTXx+WaCBZVUvnwpRBx0DQAz3U7QAIt6QQoblKDJkJKPiELrFka+n4sKtpVI6mX25ee9dYQpO9RkIMrwKokkxhiQSmxo2hqYHUvZPwbHd0biMfa7XxletfRXylurEpaGb/js+xZ5HDyKk0F1YVPgj8a/9UxL3uzhIoSKxOKh4MfB0IHe1Wj424RYVf3+e+veGeaqKP700buHJz2frX6KYBlzl40M7Pn+rA/aUExmNOfjKDVEK3x2pA7MSuu+jnsSb2NlXZTcQX9PZyy1ygMzYx4ttYm3PwA6OLOlAYKIklmC7Jmk50vjLOBsOc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkJBME53cjNTOENia3pHV0tpY1p4bEJleE51N09DeDE2Tzl4NlB0V0JJNUV3?=
 =?utf-8?B?b1NIK21qMWt4Ty9WNkMreXVDK2orcGI2TURMaGthd2NEaVNjeGZWWnNsZ0t4?=
 =?utf-8?B?bWxLUU9CUkhyeDMweE56K2doeG5wZWhIYUpJbndRdHJId0k2ZkJ5dDZXRFZw?=
 =?utf-8?B?ckpCV1hVaStQUVhPMXRBVmUrWGNwNGhCV2lzQ1plNDN0em1mTGlvcjV6MHZK?=
 =?utf-8?B?ZW56R1VrQlg1ZkJheUNRVHAvaWRmUGZRaUN3c1VtQ251VWdHL2ErUDJVZ1Y5?=
 =?utf-8?B?OUFzYnplWEp0eWZBeWdxVW04SExKek5lU0VhcWp6cEZESHNodnZoeTgrUmZR?=
 =?utf-8?B?Tk5UOEdMTUxwUzc1WTMxNis0YkVGdzZ3RHlQMlRCNFoyOGhYTWRQbWhtUGJv?=
 =?utf-8?B?MlI4UlJQYjBVUERaMVYvb0NjbDBKRlk2YjVSNFVrN3o0WWt4bm5tOFduMGtr?=
 =?utf-8?B?Rk9saHdaWlN3NlArb2tiSXduMndrQXl3YjBLbnYyZHBjckNGdHlQWmR3M2dH?=
 =?utf-8?B?bUNuUlJsTVR1YzJyRGFpRDNXSDQ1eFlPMWQ3aXZLUnlvNk40dFFhQmJqKzBN?=
 =?utf-8?B?K2Q0eUoyaHFnSUtJYmp3SFZwck1xYU1zdm1VRWJpdUxjL0JxYzgyTFo4WDhD?=
 =?utf-8?B?YXYvdzh6aEJISjNFczg1OFZpRWhaWnlUNmtPcmRkcHBMU24wbkV4UHRVRHJU?=
 =?utf-8?B?Nk9nN3NvV2hibUdOQWZiUCtab0pmbm1lT292ek1xdWpNMm1LUS90MHh1Y09E?=
 =?utf-8?B?elVMY3RCRXdPdzZqWFN6R0taMUdBMVpHRFBoTnRXUldCNUUrQ1FUTXo3QklV?=
 =?utf-8?B?QnBCUkFpQ09aUG9mYUsrVGxDNkdJcDdzUWw0MWlabzRFakFGZHJUUXo0V1li?=
 =?utf-8?B?VW9zRGE4emlZeGs0cmxEYTZ0SVd4YUk1VWhMMGFONEUwYkxkOStIWjQ0NXU5?=
 =?utf-8?B?UStVNHgrWVNFamo5TEVoZUlTTmY4ZFFFRG9xakp6SjRoTU83d0o0T2t2dG9R?=
 =?utf-8?B?aXdGRVFKMVdQVUpiU2NPMTRwQ0FqM1FaUXFGKzA4ZHRUZ0dNMWxLdlJFVHhj?=
 =?utf-8?B?SU1FN3p1eUU2NjRhdVlpK0Rrb3UzZ0hIMmhSeTUxbDNOL203ZXY3VExiZ2JC?=
 =?utf-8?B?YjdjTWE1TkorUERkRHNDeXhRWDVQNmFrUUlFeGlMdHI5VHp6R0dZL0FxY0dB?=
 =?utf-8?B?bFlFU09UMHI1bExsWitvMVdvL2l6dGlmazFjVjQ5UTNsQ1ZIT3I4NmI0TERS?=
 =?utf-8?B?TGV1NEtqS0pWdDJSd2trUXd4cGZLVmYwN1dlVmdNbzJtRXRGMlRCVEFCNEFr?=
 =?utf-8?B?WWY5dnZmam9RRmk0dHphblRrZEYzM29ZcEtIZjFtR2hNS2taUUNJd0poTlhQ?=
 =?utf-8?B?OVRWY0Z1MHNVNmoyR1Zlem5mdUhOeDd2RFF3RWVhdHVsS0JjT0xXL3BhdTR4?=
 =?utf-8?B?WWJxc1pqRElKVFQ5bXZjZDVseWoxUUMvS0pkRjU1Z1lRQkdSS2xYRVNjbm15?=
 =?utf-8?B?TXdGRlFMZW1Yd1FsMlRxSldQclQ2REZuZFdNQnVJY3d4ZG1zZE5HK3VaeFBH?=
 =?utf-8?B?aGFuQXlrV2ducWdQNlI5dytiYmo0UVVkSWZQVzdXOGE5TGFOSUIrcy9RV0Nv?=
 =?utf-8?B?S2JJUTZONERiRjZ6Ymd1QUd1dnBVdGwyK1JOZnhxUytETWdaalJlY2lTbG1s?=
 =?utf-8?B?YkJEQ1pIV2VkR0lHc3FJc0pNNXJEOWJQbzVYOTdmZWdDQUJvZTJKa1ptVjUx?=
 =?utf-8?B?aVJLMHZHMDF0c1lEdnNVNzEzUThDSjloRURBZ0hhc1kyQ0RCVFNSTE9HblVI?=
 =?utf-8?B?RUdFeE1HRjYvTXp5MlZKaFNGRWp4NzFERStzc21iTkpmK0ZnZktsa1pLUW8y?=
 =?utf-8?B?ZHhOdXBGcWhTeEVGemNVVFFlU0VmZ1hpLytCeUtpZmVOejdWTFBYN3F3OVd2?=
 =?utf-8?B?ZmtrVk50TVhRempuUHVwUHgyM2ZLa3Z2Rm5oQVNCMzhTSkVtYzNXY0FEczhP?=
 =?utf-8?B?d2dhSTZyQ2lwYXZIZnJXYVZHV0V5dmZhdWRIektYWVFoS01qQmtpRzJqa1lB?=
 =?utf-8?B?UVdKUWl2N2ZyelVCbElsMldoMEJ5SDllaktmK0oxdTlwbHYxWFdZdGFsNEZS?=
 =?utf-8?B?b2VFcUJ5bndZRDNYYXJLbFlMdkhIYXZnOTZ4QzlFMVNsY0h0UVdRQjg2Yk9a?=
 =?utf-8?B?eVNXeWlrTUtpWmgxK0NCZ1FGTjduK201cXFaZ1VKZkxXZmNHRkRneGhGSVFD?=
 =?utf-8?B?ZHBZTHgyR1NFVGIveTNLeTJUY0lPQ0lCemtvR2FWcGFsZTVrUTNWZDdha1lv?=
 =?utf-8?B?dnk1OWpLVGZUQlo4TnBKYWRSakk4RzRPY0xhaGNSdlNCS0V0Wnl6Z1V3UmxS?=
 =?utf-8?Q?dO5d7Rs+1Y7zJoWo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B3C41C260E612409C3249C994F34E1B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a155c044-d2ae-45c7-a799-08de74b82130
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 21:52:11.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOn7kpQSvIbNPpKSmKAyohHc4vGCGnu+Bra+WO9GOvDuL9Y7lThYRtjmiNEF3RZbvuQJtsIHk70y/1BxzKMsg5hiW+sxoMIiJ4++PmCHaQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDE2OjI0IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUdWUsIEZlYiAyNCwgMjAyNiBhdCAwODozNjoxNlBNICswMDAwLCBTdHVhcnQgU3VtbWVycyB3
cm90ZToNCj4gPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29t
Pg0KPiA+IA0KPiA+IEd1QyBwcm92aWRlcyB0aGUgYWJpbGl0eSB0byBnYXRoZXIgbG9ncyB0aHJv
dWdoIGEgaGFyZHdhcmUNCj4gPiBpbnRlcmZhY2UNCj4gPiBjYWxsZWQgTlBLLiBGb3IgY2VydGFp
biBkZWJ1Z2dpbmcgc2NlbmFyaW9zIHRoaXMgY2FuIGJlDQo+ID4gYWR2YW50YWdlb3VzDQo+ID4g
b3ZlciBnZXR0aW5nIGxvZ3MgZnJvbSBtZW1vcnkgKG9yIGluIGFkZGl0aW9uIHRvKS4NCj4gPiAN
Cj4gPiBBZGQgYSBob29rIGZvciB0aGlzIGFsdGVybmF0ZSBkZWJ1Z2dpbmcgbW9kZSB2aWEgYSBt
b2RwYXJhbSBzaW1pbGFyDQo+ID4gdG8gd2hhdCBpcyB1c2VkIGZvciBHdUMgbG9nIGxldmVsLiBU
aGlzIHRyYW5zbGF0ZXMgaW50byBhIHBhcmFtZXRlcg0KPiA+IHBhc3NlZCB0byBHdUMgZHVyaW5n
IGxvYWQgdGltZS4NCj4gDQo+IEluIGdlbmVyYWwgd2UncmUgbm90IHJlYWxseSBzdXBwb3NlZCB0
byBiZSBhZGRpbmcgbmV3IG1vZHVsZQ0KPiBwYXJhbWV0ZXJzDQo+IHRvIHRoZSBkcml2ZXIuwqAg
U29tZSBleGlzdGluZyBwYXJhbWV0ZXJzIGFyZSBncmFuZGZhdGhlcmVkLWluIGJlY2F1c2UNCj4g
dGhleSB3ZXJlIGFkZGVkIGR1cmluZyBlYXJseSBkcml2ZXIgZGV2ZWxvcG1lbnQgYmVmb3JlIHdl
IHJlYWxseSBoYWQNCj4gYmV0dGVyIHdheXMgb2YgY29uZmlndXJpbmcgdGhpbmdzLsKgIEJ1dCB3
aGVuIHBvc3NpYmxlIHdlIHNob3VsZA0KPiBwcm9iYWJseQ0KPiBiZSBsb29raW5nIG1vcmUgYXQg
cGVyLWRldmljZSBzb2x1dGlvbnMgbGlrZSBjb25maWdmcyB0aGVzZSBkYXlzLsKgDQo+IEl0J3MN
Cj4gYSBiaXQgbW9yZSBpbnZvbHZlZCB0byB1c2UsIGJ1dCB0aGF0J3MgZXNwZWNpYWxseSBva2F5
IChtYXliZSBldmVuDQo+IGRlc2lyYWJsZSkgZm9yIHNvbWV0aGluZyBsaWtlIHRoaXMgdGhhdCBp
cyBvbmx5IHVzZWZ1bCBmb3IgbG93LWxldmVsDQo+IGRlYnVnZ2luZyBhbmQgaXNuJ3QgYWN0dWFs
bHkgdXNhYmxlIG9yIHVzZWZ1bCBmb3IgZW5kIHVzZXJzIG9uDQo+IHByb2R1Y3Rpb24gaGFyZHdh
cmUuDQoNClZlcnkgZ29vZCBwb2ludCBhbmQgeW91J3JlIHJpZ2h0LiBJIGd1ZXNzIEknbSBhIGxp
dHRsZSBoZXNzaXRhbnQgdG8gZG8NCnRoZSBzYW1lIGZvciB0aGUgZ3VjX2xvZ19sZXZlbCBnaXZl
biB3ZSBoYXZlIGEgbG90IG9mIHRvb2xzIHVzaW5nIHRoYXQNCnRvZGF5IGluIENJLCBldGMsIGFu
ZCBjb252ZXJ0aW5nIGFsbCBvZiB0aG9zZSB0byBjb25maWdmcyB3aWxsIHRha2UNCnNvbWUgdGlt
ZS4gQW5kIEkgbGlrZSB0aGUgaWRlYSBvZiBrZWVwaW5nIGFsbCBvZiB0aGUgR3VDIGNvbmZpZ3Vy
YXRpb24NCnN0dWZmIGluIHRoZSBzYW1lIHBsYWNlLiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGlu
ayB0aGVyZS4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IA0KPiBNYXR0DQo+IA0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWZhdWx0cy5o
IHwgMSArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmPCoMKgwqDCoMKgIHwgNyAr
KysrKystDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmPCoMKgIHwgNCArKysr
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmjCoMKgIHwgMSArDQo+ID4gwqA0
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlZmF1bHRzLmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWZhdWx0cy5oDQo+ID4gaW5kZXggNWQ1ZDQxZDA2N2M1Li4x
OTQ1MDBmYjBhYjIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlZmF1
bHRzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVmYXVsdHMuaA0KPiA+IEBA
IC0xMiw2ICsxMiw3IEBADQo+ID4gwqAjZWxzZQ0KPiA+IMKgI2RlZmluZSBYRV9ERUZBVUxUX0dV
Q19MT0dfTEVWRUzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxDQo+ID4gwqAjZW5kaWYN
Cj4gPiArI2RlZmluZSBYRV9ERUZBVUxUX0dVQ19MT0dfVEFSR0VUwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoDANCj4gPiDCoA0KPiA+IMKgI2RlZmluZSBYRV9ERUZBVUxUX1BST0JFX0RJU1BM
QVnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cnVlDQo+ID4gwqAjZGVmaW5lIFhFX0RF
RkFVTFRfVlJBTV9CQVJfU0laRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjLmMNCj4gPiBpbmRleCA1NGQyZmM3ODAxMjcuLjEwYmY2M2MyMGExNCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiBAQCAtNzksNyArNzksMTIgQEAgc3RhdGlj
IHUzMiBndWNfY3RsX2RlYnVnX2ZsYWdzKHN0cnVjdCB4ZV9ndWMNCj4gPiAqZ3VjKQ0KPiA+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoIUdVQ19MT0dfTEVWRUxfSVNfVkVSQk9TRShsZXZlbCkpDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmbGFncyB8PSBHVUNfTE9HX0RJU0FCTEVE
Ow0KPiA+IMKgwqDCoMKgwqDCoMKgwqBlbHNlDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZsYWdzIHw9IEZJRUxEX1BSRVAoR1VDX0xPR19WRVJCT1NJVFksDQo+ID4gR1VDX0xP
R19MRVZFTF9UT19WRVJCT1NJVFkobGV2ZWwpKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZmxhZ3MgfD0gRklFTERfUFJFUChHVUNfTE9HX1ZFUkJPU0lUWSwNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqANCj4gPiBHVUNfTE9HX0xFVkVMX1RPX1ZFUkJPU0lUWShsZXZlbCkpOw0KPiA+ICsN
Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoeGVfbW9kcGFyYW0uZ3VjX2xvZ190YXJnZXQpDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsYWdzIHw9IEZJRUxEX1BSRVAoR1VDX0xP
R19ERVNUSU5BVElPTiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfbW9kcGFyYW0uZ3VjX2xvZ190YXJn
ZXQpOw0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmbGFnczsNCj4gPiDCoH0N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vZHVsZS5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4gPiBpbmRleCA5MDNkM2I0MzM0MjEuLjFh
ODEyN2U1MDhlNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxl
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmMNCj4gPiBAQCAtMjMs
NiArMjMsNyBAQA0KPiA+IMKgc3RydWN0IHhlX21vZHBhcmFtIHhlX21vZHBhcmFtID0gew0KPiA+
IMKgwqDCoMKgwqDCoMKgwqAucHJvYmVfZGlzcGxheSA9wqDCoMKgwqDCoMKgwqDCoFhFX0RFRkFV
TFRfUFJPQkVfRElTUExBWSwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmd1Y19sb2dfbGV2ZWwgPcKg
wqDCoMKgwqDCoMKgwqBYRV9ERUZBVUxUX0dVQ19MT0dfTEVWRUwsDQo+ID4gK8KgwqDCoMKgwqDC
oMKgLmd1Y19sb2dfdGFyZ2V0ID3CoMKgwqDCoMKgwqDCoFhFX0RFRkFVTFRfR1VDX0xPR19UQVJH
RVQsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5mb3JjZV9wcm9iZSA9wqDCoMKgwqDCoMKgwqDCoMKg
wqBYRV9ERUZBVUxUX0ZPUkNFX1BST0JFLA0KPiA+IMKgI2lmZGVmIENPTkZJR19QQ0lfSU9WDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoC5tYXhfdmZzID3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
WEVfREVGQVVMVF9NQVhfVkZTLA0KPiA+IEBAIC01MSw2ICs1Miw5IEBAIG1vZHVsZV9wYXJhbV9u
YW1lZChndWNfbG9nX2xldmVsLA0KPiA+IHhlX21vZHBhcmFtLmd1Y19sb2dfbGV2ZWwsIGludCwg
MDYwMCk7DQo+ID4gwqBNT0RVTEVfUEFSTV9ERVNDKGd1Y19sb2dfbGV2ZWwsICJHdUMgZmlybXdh
cmUgbG9nZ2luZyBsZXZlbA0KPiA+ICgwPWRpc2FibGUsIDE9bm9ybWFsLCAyLi41PXZlcmJvc2Ut
bGV2ZWxzICINCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiW2RlZmF1bHQ9
IiBfX3N0cmluZ2lmeShYRV9ERUZBVUxUX0dVQ19MT0dfTEVWRUwpDQo+ID4gIl0pIik7DQo+ID4g
wqANCj4gPiArbW9kdWxlX3BhcmFtX25hbWVkKGd1Y19sb2dfdGFyZ2V0LCB4ZV9tb2RwYXJhbS5n
dWNfbG9nX3RhcmdldCwNCj4gPiBpbnQsIDA2MDApOw0KPiA+ICtNT0RVTEVfUEFSTV9ERVNDKGd1
Y19sb2dfdGFyZ2V0LCAiR3VDIGZpcm13YXJlIGxvZ2dpbmcgdGFyZ2V0DQo+ID4gKDA9bWVtb3J5
IFtkZWZhdWx0XSwgMSA9IE5QSywgMiA9IG1lbW9yeSArIE5QSykiKTsNCj4gPiArDQo+ID4gwqBt
b2R1bGVfcGFyYW1fbmFtZWRfdW5zYWZlKGd1Y19maXJtd2FyZV9wYXRoLA0KPiA+IHhlX21vZHBh
cmFtLmd1Y19maXJtd2FyZV9wYXRoLCBjaGFycCwgMDQwMCk7DQo+ID4gwqBNT0RVTEVfUEFSTV9E
RVNDKGd1Y19maXJtd2FyZV9wYXRoLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJHdUMgZmlybXdhcmUgcGF0aCB0byB1c2UgaW5zdGVhZCBvZiB0aGUgZGVmYXVsdA0KPiA+
IG9uZSIpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbW9kdWxlLmgN
Cj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuaA0KPiA+IGluZGV4IDc5Y2I5NjM5
YzBmMy4uYmFiNDNkYmFjYWEwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9tb2R1bGUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2R1bGUuaA0KPiA+
IEBAIC0xNCw2ICsxNCw3IEBAIHN0cnVjdCB4ZV9tb2RwYXJhbSB7DQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGJvb2wgcHJvYmVfZGlzcGxheTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IGZvcmNlX3Zy
YW1fYmFyX3NpemU7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGludCBndWNfbG9nX2xldmVsOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoGludCBndWNfbG9nX3RhcmdldDsNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
Y2hhciAqZ3VjX2Zpcm13YXJlX3BhdGg7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoGNoYXIgKmh1Y19m
aXJtd2FyZV9wYXRoOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBjaGFyICpnc2NfZmlybXdhcmVfcGF0
aDsNCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCj4gDQoNCg==
