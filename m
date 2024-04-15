Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96962C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 22:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184410E159;
	Mon, 15 Apr 2024 22:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiOzlEcy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC6110E159
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 22:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713219833; x=1744755833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PgOCcHMO4D546TYBuMQi61wXMhg3mKZpGTjY3J02inY=;
 b=CiOzlEcyuXSetYiddhIoTF+7o+NoCxlDp65ex6yKvm4+l2I4yEbmT7Yc
 eBO0EmQ4WPKW3Q5P50qljwkRhOw3PCYZ8n4GS8MpNkd+wUACTSORp961G
 1502jmU/R7zSM7/9cWJy4E4iPlrDMakn+EMpl07GQweQ0nXLf3dlhe30t
 SntBusRh70GrWBwpUoT6kq0i8Gfnch4HiNWU4ZTwSrpG2hYZzF3aRnYaP
 0x68e8MOgeXgaEneSxGljqqEF7W5BNbJfkBcgebVI3lw+oXgihqome1cP
 NBf+IN/eDBIwpxx8t1QnsTKqXBLDRNAMZ6IaFkppE1Ruras49N+m+PwNm w==;
X-CSE-ConnectionGUID: ucBSaCGCRBOiBfKu00fyOw==
X-CSE-MsgGUID: eAbznemMQUWKdp8hgXfh7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8506459"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8506459"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 15:23:53 -0700
X-CSE-ConnectionGUID: ilTcxC6AT8OxARPCIftYKA==
X-CSE-MsgGUID: 01xWpCdrSCuZdG2de7YmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="53240285"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 15:23:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 15:23:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 15:23:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 15:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC0EkEIazgmAkB2JaFBseC5FPqzE3i978tT8f6+km3BZmTSn/Lj1eNzlNwlGu3ec64cpvDxzw0xtXbwE5acNKflWhkrhLACHWsLx+1V3jixFmnpr8t0hRFJzPOePTtUEFNNbcgBdNAdstuLs79bQCOV5Buz8di3WNXroc9YOjUtGdEwP1hH6eSQFv3Fgt4zQUSn63JEujkvZ15Ga4le1Q9imtBGTxx5WWmN+yCSYXKW95ozhR4ilbDqYB4FK+CSyaVwhzmepmt4M+E1mCh5qGj0jKDrp6OlRYHf/Fn2iP4Iiny52z2vpPw7az3JPds7Ro2GQ2vK1PNnF48vegHQBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgOCcHMO4D546TYBuMQi61wXMhg3mKZpGTjY3J02inY=;
 b=JnpTU09+NQAypOclVUUvRX0/9IheGFyrvcwNtseSos9/mYXw/KYOwL3rBRBoEMqNzZZvD3MlLVpMRWTQGFd6DsWKA51RuBO8Gv/x/D9bQJAKyHQQL+zDFM9zqvfVmg1tfitJLbMDmd3+AQzEMR2umuQlQwE43OcI5sQO7qTkgAbTrCLbkICmP+wGP79MDI2otbbp57DyRpVyF0KoTIj5M/8WcshVNNx6V+iszm38+QEsQGSRl6ygWgcZfgOmsB0SDHZmIXxqw7zpF+sUSsiXwqwY55AVAIOKK2VZtEY8g4cG71BKKv9xTNpcwlg7qXpjE8myc17yGaBkE+Jk8E/8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB6213.namprd11.prod.outlook.com (2603:10b6:8:ae::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.29; Mon, 15 Apr 2024 22:23:49 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::36d1:7f54:624d:aabf%6]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 22:23:49 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Topic: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Index: AQHaj2dpu4NkcfZ3OkSyM6EQP5aqO7FpuDiAgAADmoCAAAvOAIAAAMEAgAADawCAAByLgA==
Date: Mon, 15 Apr 2024 22:23:49 +0000
Message-ID: <ac576c169912f5f6663a38b1c273e7ef84122ae6.camel@intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
 <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB5444382EEBFD7D79F6CB7763E5092@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zh2OIMAqvo310IZr@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB54440A904094FD4CFC89749AE5092@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54440A904094FD4CFC89749AE5092@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB6213:EE_
x-ms-office365-filtering-correlation-id: 3dec7b69-98ef-40ed-c6a1-08dc5d9ab930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Y+2jkGeVi2A43yKBTKi2G0uL/+G2DTGIXkQ7DhwC/zz5k/9jsU41sCtWTpGvDDmw2inx35QhdQYVkUxhhh8J5NqXTxLMa3LIYnUGS3Jxtoodw1yj36KJuIVVWV8ZtX3U9gaV8YMAgxBKRQANHqsIYZyUAWU45g24+4luiS8sHKYQ//s5PalbRGl1vudnxSGFeitN1iQaOOWRSnI5gGyKikIb4Ao+edCTL5Mp2GH4gFFBXFqQqwoskAJDPAioccXS2br8SUibNr8lymPH0Zu0Ennd0i6OT8ss7TYYAu4Dhgi0Eo7fhkRbPgNDfCWawjmzyl4+yxWbkcjQ45/tHPNhPF+fngXUmaGP/biQusJ3Ns8Wh8pb2MC3VyLnNPyq74KdNS+RP+rS7kNs/sYFaOXAOvDB2DU9LWcSf2PC4UrDXuXTMNAuRveco+7GsQVkDPYNwtt4PMvzb6kvWI87Cz++sJS2G/A0mGf6/FJO9sxr/NMYWlRvJi6NqvU6lAbaTsMTy4Xf4boqEOlkKIQ4RglKc434gcsVc1spe/FrA/nyadVnLk9N/3N3cYgzGwdjz1TSWFrytDBLzLIs761pOyiIJYcXUlK130LnLBmdY6W2DS9c8c+HKRYCZOSL9fZ3VU/ns2bY9QVxXaL4J/ECvY4Q+tkUPz4cLZlbN5tYoza1ItX9uD+Gn7rDNGfPVgZYP8B2aHkC9BBuO5GMTg/ipcaJm1vHpKx+P+It2Wnq74Dz+w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjJJV0MydzRTYW9SMytSb1g1cGVYclR6Wmh2anZPWFJrNnpKMUNyZXJWUUl0?=
 =?utf-8?B?Ty9FU2lRSUtYNlJyb3VKTlp4dXdMdFlOaW5QTlZJeXVxakNJZEkxVWVHTUIx?=
 =?utf-8?B?ZUF3UGNKSGFFZS85VG9UNyt0Ryt5cWxQRFJieStZcTlCeHNOZ1NIWHhMTlJs?=
 =?utf-8?B?aG51bDZOR3c2aFA2ck5oeElWWHhIN3ZnMkF2elhwY00xejBpK29vS1JXNUgx?=
 =?utf-8?B?VFRlcnBScjhnMUd0c3JjVzJtdTcrNXhoZ2ttaDdvQW53OFNpU2NnMFJGMUoz?=
 =?utf-8?B?NUdiQXFzeEszaisrblRyL2JnMjJWTTVPVmJIR2hMOFR1a0h1MUlqSW1hNnRT?=
 =?utf-8?B?eFlwU2x0QjR6azlOTG5FVWtnQmVEQ3VQMVB4MWRjTTZ1K1FDV09va2l2MFpy?=
 =?utf-8?B?dzk4VGJFNGgzaWk2UEVoUWtIWmtsMUphRnFPWFplT3dkSkxuZkxXNTZoNk9z?=
 =?utf-8?B?S0Y4TkxzQ3hnT2UxUG1jS0NHMWlpQ0FKMTBwV1ZXNlVyK3d3blJBV2ozVFVE?=
 =?utf-8?B?Vkk4cjQvZmJGNVh0UDZmNGROK0pQOGhVRGFkQ0FSRnc5YmpUQjV5T1dyNHFB?=
 =?utf-8?B?YVQ0OE1XaCsyWk13Sk1FNFBTT05pTStRbjIyNkhmSlgvZ1ZqM3R4ZWo4Qkxu?=
 =?utf-8?B?WGZ4aWZxS1B5M3J0U1QzcTRiMDVHb0JrN0xBUXZ2QW4rSW5zd1ZUOElySEVI?=
 =?utf-8?B?eDFrVjJoYlhGYkNYUTBJdWZ0cnVpRFVnczdhUHBNZk1CTTRjRzVCSlZuZlBZ?=
 =?utf-8?B?TmxFMjZLNDZKR0NLTDBwbjZHR01VRysyWEwrNy9STXlhSnZOWENqbjI0aml4?=
 =?utf-8?B?WitYM2lpdkVnbTRaTGw3SE5jeHNRbW5EQzRXZW9sQUNnOEpEdk1XNjg0d3Q0?=
 =?utf-8?B?eTVPdmYrVjg2RnBaS3h5NVhxcXJVYjRXckRRY2VscVF6YXFKVFRYaXE3a0FR?=
 =?utf-8?B?US9wKzZDUEdzc0tJTE91TWRtOCtBQTQ5ejBKZXpUa3I5b1FmNVA4djBtVEJm?=
 =?utf-8?B?VmRtY0xkUnhaOVI4YlVGdjBiSzZETG9NTTNuVDROMmtxS1BHNTlMV0Q2QnFj?=
 =?utf-8?B?MTZocWN4Yk8zdzhFV2pJeXNvMi85dWxiT1VQUGN0Q09CMHVOK004c3J5U0J4?=
 =?utf-8?B?c1ZMdzVWUDRFV0JycUovaGZkOW42MncxRlNqU3JaNGdFcEtwVjlYbDcyWk5t?=
 =?utf-8?B?UkcweU5WczFwMGlMQXhYbjFGUWpmOWF3bkwrWmdjZUNRUEk5M21OWEVqOUgy?=
 =?utf-8?B?bzBsL1dDaVI3NGd4bEhjZTBzWTNxMVhvNnAyY1ZPRWU5WHBCVkRBbjE0STkw?=
 =?utf-8?B?Tm5UTEtrYkltMDdpZ25vYlZPSkk5b0RpcnV1cGMzSE91NTVFRTZrc1J5YVRL?=
 =?utf-8?B?UHg2VWhRQUtwYXNUWFVPUGF2aTRyWDAvL1ZRd0gvemJCUWc2ckFjMUp3bHJM?=
 =?utf-8?B?UG5nSmdLcjZkdmp0RlFveUpLYlVsWnJraHFJdGJncVVrNEtrZHNqZ2RhUmlO?=
 =?utf-8?B?QVgvbVphZzNYK2JRT01COGhIOWZCbFYwMHN4QzNrQ0wwazV0L20xYXdWOTYw?=
 =?utf-8?B?dTVKeE91VWFrbUd5UENGTFY4bUhIMVNSNlIxZEJLeU4rMTVZQUlqNUVCbnBv?=
 =?utf-8?B?VUE5ZUhtVHVaYmFrY0xLTzI1b0ZRVnpLUzcxcnRPSjJnamxvL0xZd2RzSldS?=
 =?utf-8?B?RUNtL3UwSzBxRjBGMnIxRWs4WHE3VjAvTnd3bERNS21sa2ROVnVseGQvejdx?=
 =?utf-8?B?VE9sdnlZeHNpbHdxb2tLTXJPOEJZK01yOEIrcEZYOFk2VnN2WFNlUnhtRFdu?=
 =?utf-8?B?aS9oZ05sNGJaaVJJNkxieHlORHZISStFZk04SHAwTEVvM2R5OUFENGptRVFz?=
 =?utf-8?B?cytvS2pGMmRHTXQrZDhNaXpaMzQ4NFpubGpDK0Vta1EwTndmbEV6Nk9HWTNR?=
 =?utf-8?B?QlpiNDRhRGtjelpnc1Z3OWZWTjFxNzRWVHZxODVjTkJEMXFkNWxIc2U2Uzl1?=
 =?utf-8?B?UkNNV3JlWE8zOXBYcVh2d1oxK0NmbHUxTWZDZW1IaXJ5cXFDRHJLTDF3bHky?=
 =?utf-8?B?RUhESmtZMVNWemZ5R0ViSnQrM1U3dzl0WWhWTnA3Y2dpZlhqUmE1OGtiWlFK?=
 =?utf-8?B?amdrN1JLVm5MOEYzZVBGMjVRU3N4WVp0Q2UrWGN4N01BdTlFaUxQWk1OdlAx?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA77F62F13BCE14AAD28F0CDEDF90B71@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dec7b69-98ef-40ed-c6a1-08dc5d9ab930
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 22:23:49.2471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPwLoBRN1AeTU560PvoaRvTIWInCLhj+UFP42XUyqVl05R+OzKebA4v8njORTFeDliaXBR2EOFqDuMAurKX2YGXOYz/oFoMwtndRA4o6Yu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
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

T24gTW9uLCAyMDI0LTA0LTE1IGF0IDIwOjQxICswMDAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3Rl
Og0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcm9zdCwgTWF0dGhldyA8
bWF0dGhldy5icm9zdEBpbnRlbC5jb20+IA0KPiBTZW50OiBNb25kYXksIEFwcmlsIDE1LCAyMDI0
IDE6MjkgUE0NCj4gVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQo+IENjOiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47DQo+
IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSGFycmlzb24sIEpvaG4gQw0KPiA8am9o
bi5jLmhhcnJpc29uQGludGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+IDxu
aXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IEd1cHRhLCBzYXVyYWJoZw0KPiA8
c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEvNF0gZHJtL3hlL2xyYzogQWRkIHhlIGxyYyByaW5n
IHRhaWwgZnVuY3Rpb24NCj4gZGVmaW5pdGlvbnMNCj4gPiANCj4gPiBPbiBNb24sIEFwciAxNSwg
MjAyNCBhdCAwMjoyNjozOFBNIC0wNjAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3RlOg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEJyb3N0LCBNYXR0aGV3IDxt
YXR0aGV3LmJyb3N0QGludGVsLmNvbT4gDQo+ID4gPiBTZW50OiBNb25kYXksIEFwcmlsIDE1LCAy
MDI0IDEyOjQ0IFBNDQo+ID4gPiBUbzogU3VtbWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0Bp
bnRlbC5jb20+DQo+ID4gPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBDYXZp
dHQsIEpvbmF0aGFuDQo+ID4gPiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IEhhcnJpc29u
LCBKb2huIEMNCj4gPiA+IDxqb2huLmMuaGFycmlzb25AaW50ZWwuY29tPjsgVmlzaHdhbmF0aGFw
dXJhLCBOaXJhbmphbmENCj4gPiA+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNv
bT47IEd1cHRhLCBzYXVyYWJoZw0KPiA+ID4gPHNhdXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFJv
cGVyLCBNYXR0aGV3IEQNCj4gPiA+IDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgV2VsdHks
IEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY1IDEvNF0gZHJtL3hlL2xyYzogQWRkIHhlIGxyYyByaW5nIHRhaWwNCj4gPiA+IGZ1bmN0aW9u
IGRlZmluaXRpb25zDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBNb24sIEFwciAxNSwgMjAyNCBhdCAw
MTozMTozMlBNIC0wNjAwLCBTdW1tZXJzLCBTdHVhcnQNCj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+
ID4gT24gTW9uLCAyMDI0LTA0LTE1IGF0IDExOjQ2IC0wNzAwLCBKb25hdGhhbiBDYXZpdHQgd3Jv
dGU6DQo+ID4gPiA+ID4gPiBBZGQgZGVmaW50aW9ucyBmb3IgdGhlIGZ1bmN0aW9ucyB4ZV9scmNf
c2V0X3JpbmdfdGFpbCBhbmQNCj4gPiA+ID4gPiA+IHhlX2xyY19yaW5nX3RhaWwgdG8gbWF0Y2gg
dGhlIGRlZmluaXRpb25zIGZvcg0KPiA+ID4gPiA+ID4geGVfbHJjX3NldF9yaW5nX2hlYWQNCj4g
PiA+ID4gPiA+IGFuZA0KPiA+ID4gPiA+ID4geGVfbHJjX3JpbmdfaGVhZCwgcmVzcGVjdGl2ZWx5
LCBleGNlcHQgdGFydGluZyB0aGUgbHJjDQo+ID4gPiA+ID4gPiB0YWlsLg0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNh
dml0dEBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBDQzogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVy
YQ0KPiA+ID4gPiA+ID4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+
ID4gPiA+ID4gQ0M6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+DQo+ID4gPiA+
ID4gPiBDQzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPiA+ID4g
PiA+IC0tLQ0KPiA+ID4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMgfCAxMCAr
KysrKysrKysrDQo+ID4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaCB8wqAg
MiArKw0KPiA+ID4gPiA+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9scmMuYw0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gPiA+
ID4gPiA+IGluZGV4IDYxNWJiYzM3MmFjNjIuLmU5MWVjYmNjZWJhNWMgMTAwNjQ0DQo+ID4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYw0KPiA+ID4gPiA+ID4gQEAgLTgzNCw2ICs4MzQs
MTYgQEAgdm9pZCB4ZV9scmNfZmluaXNoKHN0cnVjdCB4ZV9scmMgKmxyYykNCj4gPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB4ZV9ib19wdXQobHJjLT5ibyk7DQo+ID4gPiA+ID4gPiDCoH0NCj4g
PiA+ID4gPiA+IMKgDQo+ID4gPiA+ID4gPiArdm9pZCB4ZV9scmNfc2V0X3JpbmdfdGFpbChzdHJ1
Y3QgeGVfbHJjICpscmMsIHUzMiB0YWlsKQ0KPiA+ID4gPiA+ID4gK3sNCj4gPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoHhlX2xyY193cml0ZV9jdHhfcmVnKGxyYywgQ1RYX1JJTkdfVEFJTCwgdGFp
bCk7DQo+ID4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gK3UzMiB4ZV9s
cmNfcmluZ190YWlsKHN0cnVjdCB4ZV9scmMgKmxyYykNCj4gPiA+ID4gPiA+ICt7DQo+ID4gPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4geGVfbHJjX3JlYWRfY3R4X3JlZyhscmMsIENUWF9S
SU5HX1RBSUwpICYNCj4gPiA+ID4gPiA+IFRBSUxfQUREUjsNCj4gPiA+ID4gPiA+ICt9DQo+ID4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gPiDCoHZvaWQgeGVfbHJjX3NldF9yaW5nX2hlYWQoc3RydWN0
IHhlX2xyYyAqbHJjLCB1MzIgaGVhZCkNCj4gPiA+ID4gPiA+IMKgew0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IEkgc2VlIGxvd2VyIGluIHhlX2xyYy5jIHdlJ3JlIGRvaW5nIHRoaXMNCj4gPiA+ID4g
PiAoeGVfbHJjX3NuYXBzaG90X2NhcHR1cmUpOg0KPiA+ID4gPiA+IHNuYXBzaG90LT50YWlsLm1l
bW9yeSA9IHhlX2xyY19yZWFkX2N0eF9yZWcobHJjLA0KPiA+ID4gPiA+IENUWF9SSU5HX1RBSUwp
Ow0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNob3VsZCB3ZSBjaGFuZ2UgdGhpcyBjYWxsIHRvIHVz
ZSB0aGUgbmV3IHdyYXBwZXIgYWxzbz8NCj4gPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IFll
YS4gQWxzbyB4ZV9ndWNfc3VibWl0LmMgc2V0cyB0aGUgTFJDIHRhaWwuIEl0IHNob3VsZCBiZQ0K
PiA+ID4gPiB1cGRhdGVkIHRvIHVzZQ0KPiA+ID4gPiB0aGUgaGVscGVyIHRvby4NCj4gPiA+IA0K
PiA+ID4gUGxlYXNlIGxpc3QgYWxsIG9mIHRoZSBwbGFjZXMgd2hlcmUgeW91IHdvdWxkIGxpa2Ug
bWUgdG8gdXNlDQo+ID4gPiB4ZV9scmNfc2V0X3JpbmdfdGFpbA0KPiA+ID4gYW5kIHhlX2xyY19y
aW5nX3RhaWwsIGFuZCBJIHdpbGwgaGF2ZSB0aG9zZSByZWFkeSBmb3IgdGhlIG5leHQNCj4gPiA+
IHJldmlzaW9uLg0KPiA+ID4gLUpvbmF0aGFuIENhdml0dA0KPiA+ID4gDQo+ID4gDQo+ID4gZ3Jl
cCBpcyB5b3VyIGZyaWVuZC4uLg0KPiA+IA0KPiA+IG1icm9zdEBsc3RyYW5vLWRlc2s6eGUkIGdy
ZXAgQ1RYX1JJTkdfVEFJTCAqLmMgKi5oDQo+ID4geGVfZXhlY2xpc3QuYzrCoCB4ZV9scmNfd3Jp
dGVfY3R4X3JlZyhscmMsIENUWF9SSU5HX1RBSUwsIGxyYy0NCj4gPiA+cmluZy50YWlsKTsNCj4g
PiB4ZV9ndWNfc3VibWl0LmM6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2xyY193
cml0ZV9jdHhfcmVnKGxyYywNCj4gPiBDVFhfUklOR19UQUlMLCBscmMtPnJpbmcudGFpbCk7DQo+
ID4geGVfbHJjLmM6wqDCoMKgwqDCoMKgIHhlX2xyY193cml0ZV9jdHhfcmVnKGxyYywgQ1RYX1JJ
TkdfVEFJTCwgbHJjLQ0KPiA+ID5yaW5nLnRhaWwpOw0KPiA+IHhlX2xyYy5jOsKgwqDCoMKgwqDC
oCBzbmFwc2hvdC0+dGFpbC5tZW1vcnkgPSB4ZV9scmNfcmVhZF9jdHhfcmVnKGxyYywNCj4gPiBD
VFhfUklOR19UQUlMKTsNCj4gDQo+IEFuZCBpbiB0aGUgc25hcHNob3QgY2FzZSwgd2UncmUgc3Vy
ZSB3ZSB3YW50IHRvIHVzZSB4ZV9scmNfcmluZ190YWlsDQo+IGluc3RlYWQgb2YNCj4gdGhlIGN1
cnJlbnQgcmF3IGNhbGw/wqAgQmVjYXVzZSB4ZV9scmNfcmluZ190YWlsIHBlcmZvcm1zIGEgYml0
d2lzZQ0KPiBBTkQgb24gdGhlDQo+IHJlc3VsdCwgd2hpY2ggd2UgbWlnaHQgbm90IHdhbnQuDQo+
IEdyYW50ZWQsIEkgZG9uJ3Qga25vdyB3aHkgd2Ugd291bGRuJ3Qgd2FudCBpdCwgYnV0IHRoYXQn
cyBzdGlsbCBhDQo+IHBvaW50IG9mIGNvbnRlbnRpb24NCj4gdGhhdCBtYXkgY29tZSB1cCBpbiBw
b3N0LXJldmlldy4NCg0KSG9uZXN0bHkgdG8gbWUgdGhlIEFORCB0aGVyZSBpcyBhY3R1YWxseSBt
YWtpbmcgdGhpcyBtb3JlIGFjY3VyYXRlIGZvcg0KdGhlIHNuYXBzaG90IGFueXdheSAtIHNvbWV0
aGluZyB3ZSBwcm9iYWJseSBzaG91bGQgYWRkIGFueXdheSB0aGVyZS4NCkknZCBzdWdnZXN0IHVz
aW5nIHRoZSBzYW1lIHJvdXRpbmUgZXZlcnl3aGVyZS4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4g
LUpvbmF0aGFuIENhdml0dA0KPiANCj4gPiANCj4gPiBNYXR0DQo+ID4gDQo+ID4gPiA+IA0KPiA+
ID4gPiBNYXR0DQo+ID4gPiA+IA0KPiA+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gPiBTdHVhcnQN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB4ZV9scmNfd3JpdGVfY3R4
X3JlZyhscmMsIENUWF9SSU5HX0hFQUQsIGhlYWQpOw0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbHJjLmgNCj4gPiA+ID4gPiA+IGluZGV4IGQzMmZhMzFmYWEyY2YuLmYzNTViMGVl
YjU2NTggMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJj
LmgNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaA0KPiA+ID4g
PiA+ID4gQEAgLTI0LDYgKzI0LDggQEAgdm9pZCB4ZV9scmNfZmluaXNoKHN0cnVjdCB4ZV9scmMg
KmxyYyk7DQo+ID4gPiA+ID4gPiDCoHNpemVfdCB4ZV9scmNfc2l6ZShzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgZW51bQ0KPiA+ID4gPiA+ID4geGVfZW5naW5lX2NsYXNzDQo+ID4gPiA+ID4gPiBjbGFz
cyk7DQo+ID4gPiA+ID4gPiDCoHUzMiB4ZV9scmNfcHBod3NwX29mZnNldChzdHJ1Y3QgeGVfbHJj
ICpscmMpOw0KPiA+ID4gPiA+ID4gwqANCj4gPiA+ID4gPiA+ICt2b2lkIHhlX2xyY19zZXRfcmlu
Z190YWlsKHN0cnVjdCB4ZV9scmMgKmxyYywgdTMyIHRhaWwpOw0KPiA+ID4gPiA+ID4gK3UzMiB4
ZV9scmNfcmluZ190YWlsKHN0cnVjdCB4ZV9scmMgKmxyYyk7DQo+ID4gPiA+ID4gPiDCoHZvaWQg
eGVfbHJjX3NldF9yaW5nX2hlYWQoc3RydWN0IHhlX2xyYyAqbHJjLCB1MzIgaGVhZCk7DQo+ID4g
PiA+ID4gPiDCoHUzMiB4ZV9scmNfcmluZ19oZWFkKHN0cnVjdCB4ZV9scmMgKmxyYyk7DQo+ID4g
PiA+ID4gPiDCoHUzMiB4ZV9scmNfcmluZ19zcGFjZShzdHJ1Y3QgeGVfbHJjICpscmMpOw0KPiA+
ID4gPiA+IA0KPiA+ID4gPiANCj4gPiANCg0K
