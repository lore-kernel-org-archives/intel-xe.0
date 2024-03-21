Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AA4C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02BC10EB2E;
	Thu, 21 Mar 2024 14:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkfaRCsg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA34510EB2E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711031431; x=1742567431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rlU+z8zp+aTbl6uFN71RxdYDS7nERANlkckxGROi0WM=;
 b=FkfaRCsgJe84TNK9MDPyIgnVNz2sYGfOOeCzolqbVNkxJkMaP/AuO3Mh
 7N9bG7mZpgwUSsg4FgUq9skkFYEerBFy4X1PYHDH399iAnbhmokLNKsaH
 WGcAzfTE9b2OqLYd4u7o3JYHl3LG1Tiic6oRrAnOmKgp52a/RQWw1z69t
 KD/SJJ/ZK4U1IqadL3HBQDyKkrU/zDAZn3b2rqrAgFCrZRZKLkI9eWZZi
 Cg/fHjN8/S9x1Zt0BsgzHTI5Tw+LQsj/U7/Ol7Up2oNNKR6dHWsCCZMwb
 DWp2LpKhfMrltK9jte0bdFnJbbIVyFjc5xgNjoW6bWNEpGWUpSS1A1Qmi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9806870"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9806870"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="18996654"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 07:30:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:30:29 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 07:30:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 07:30:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 07:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkqpozfeYU8WiZyCxUPhx5pbUQdXt77omqb9xgDP7VZdWpzw888hdEuf2OzmrfM7UFTyTUR7RRAAvoAQBxmoDA9XFMOR1RHRJ0eLcV50/DcdKGwW4nXEKBcl5GkLcixnyKgB6mW0w1kIXlB6mnTPmkVFX9BajJa9uuy5Sj5enZxDwU/LPW1EHBYEE2dJSXJvGSEXGiDGK/z6UWR6a2R0vkha8hKilFU1fsD9OjRhQDL0JLoLkek0XTugWzwZqMSHjwd1QCIF1Ems2Y8DfPiRNWdCU3t1nZp8XxotUaQCl4cvtdUDIHF1G94OcAScrsCnBFw6sL1VBobfG5xgygB24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlU+z8zp+aTbl6uFN71RxdYDS7nERANlkckxGROi0WM=;
 b=HsxzlgNKrF0Fsp7ygi2c6D8K7dhqlmC+BGrTVEy8aSTF8spzQGwAIR+OS+uVi3rpt27rM7aaGnMWtlh2AynVA4p5H08bYPAKK5bQC5wIpAqy8MkeXCHB5n4oLXU/0pyVWrArtpHgih6lqGTmcetHgCZAzdWT8N3Yv0jR7YMTUta8776eUnTqDcdif7LusUqPoXE3nHBoWHOrWZD/RsiQ/PMj3HVKnxkCEMmP77LgHIif1BCKzNvN4OEs++X9p2EpiKegHJuDBrpQn8ByWVl46yMdRWoLI3or01P0uwUsKPVtxggZgQ1QUlLV7XbGO68VLPJFzXDuT+kKb4DRVtc79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 14:30:21 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::81be:4798:fcb1:288c%3]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 14:30:20 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Topic: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Index: AQHaezXs4yqyr11hQ0a+uNr6WCJyIrFCQi2A
Date: Thu, 21 Mar 2024 14:30:20 +0000
Message-ID: <20ac0abbb1b2cfd83a34c01f2f4540a43081ea21.camel@intel.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
In-Reply-To: <20240321022939.2279979-5-oak.zeng@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CH3PR11MB7865:EE_
x-ms-office365-filtering-correlation-id: ef04ca32-e861-42f8-ed3b-08dc49b3700e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t5X7L3RCnj8fCn5EXPeuruvvzdLLNZyvMYK9qZEe48YaqPgG3bmHS2pT6IeuYZisK/21hTGv8Agth6cOHrwhgOm2aPxS4QIaYUdzjNpzmLlJkMBmM4dvQyj29E8rzLJdohs0RvGy7rq4rN3hihVdu4gcVhB3ZMeNT1GKjsDzwcnupqL14zpZFxlt6uYaTj8kh+3iQdh5raQzEz8xzGGVar0b5wEPBbQ0L86Bd2otFtwKUTbqC59cylHYhsCjo7XuE24MEqIOduRlavVAhYZ29LtXe3VrtHKsNqGlTw81NAzPPjoBRlaA3Xw/GK6wpdBjtO0TJCt59vqMOP7SBShHDBdS1qdYnUdktv+dYomRwK8CVy7+RqLzlff2/ddbnPZJsJKgE8NPnr5aCBETu3YdsCBpP3e7EhiQ+FNohBcvhyIAOGFFaMWpi9yGe9p1uCYvXCz5tfHShJrhOXtoy7PPdDOqlaXIly3Pwx46YhoqMKNkxeLiSAoZsmG09XloEsl04qwgbqjRfNXXzVV6lNKJOAKgk5u/iVvZhlR2iAWwhtAGjXVB2Kdywv4txqlMZGuj63GnSw4/ynYNtlBuLAVGymy//5yNH9hFadMo8O6Pp6yOObbocl0DKWWOOSsa/EIQyya99k9VaYTjV9vH+UAFIs7m9UzkQM95ObN3sLf2RQQ4rukECEFfjQDjOXe71j7UVGMLpHGE4EdHLetOtTwa6dE5V8P2LTjUz1uO4JE1GfA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGljT2g1QUZScERPdzUySjREZ3kzc0Q2TmMwcE8zcS94MUtJZEpzNFREZ2RP?=
 =?utf-8?B?MGpzWFJBdGFRY29vUVdXbCtDMGxUT3RhY1RMMUVFSVpFV0tmUjNMVXFZMVdl?=
 =?utf-8?B?OFFkcU1jcmZDOVZjUUdvQzE3ZnUzN3dZRllZMkJMZDBvZTFsWHRibStUUkg5?=
 =?utf-8?B?N2JaN1hJSnNOQXI1TmtSWHhscVgrTFFIWDJPdDIra0pvUGt6eE5jdkQxQ3F4?=
 =?utf-8?B?NGlicCtLMkVvMVliSlZRMGNFM1NiNU5qT3Q0THdqN0dHMFhib2MwMTUwWDgy?=
 =?utf-8?B?V3Q2bXlFQjEyTnJhdFc0TDZjMWR0VUZ6NFdadVUvYUFpMnROMHNMTDI5WE5W?=
 =?utf-8?B?ZUxxRDV1dXJwZGtXTTZVQm1qNitNYzVwME04ZjBZMTJXREdBMkQ5M0tpTG1o?=
 =?utf-8?B?Rk5USkZmeUFzZTVtTGNONG5pcE92dG9HeGo3Y1pkR2hySkNKZnE4VkJLZ2dy?=
 =?utf-8?B?WW5nSmJDWlNHS29XOFZlc0RRQ3Z3ZjhPVzV5ejFUN3NXYStPYkpNai9BcmpB?=
 =?utf-8?B?OU5tb2dQNkY1OGNOUlVjeWJiaXRCNTkzQ2pLcU5UR0RnVUMwcllSeVZJN2lP?=
 =?utf-8?B?K1hKem55Z0wxZGkzV053QkpSQ3ByYlgvdHdiSmI2VktwUUIvWGtOWWRlSStI?=
 =?utf-8?B?di84dk14aTdQOGhFZVUwK2V2cjRGTUpDenI2eUtyUmJwN2VuTkhOaEN0cSty?=
 =?utf-8?B?N2tweXhobWdMNUZ2TnZ0NFJBakJ4M2dHZkdQc2JFSFBrUndyTVk5azllSzFn?=
 =?utf-8?B?cC9hT3lSblUya1p4OEhMRCs4Y3V4Z2J5SjhEa0wwTmtPb0piSW4yb1Nyc1VG?=
 =?utf-8?B?a1NHRFlLZUlWcWdNUjdJeGx1Wi8yUUJlV0dFTWVrblhpRlVRMENCM3NrZWFw?=
 =?utf-8?B?N0t3MDJqV3F4UkRhTUxvRzJlVUprVG1uRndwTlprR1BOTmpDNms0azArVjJ0?=
 =?utf-8?B?UGl6QkYxN0o4bGp1RWNxWmIzNDB4MmVKNjFSdTVCVUlYTDFDK3dQQ0kvSTNq?=
 =?utf-8?B?VDI5T0FSMlpxUlJ1VmlDSmI1cVdvMkNqVlBtYlRQUCttQ1ZZUVIrZWdjbkdI?=
 =?utf-8?B?clgzV2FLWlcwTW1zTWkxSnpmcllnaHF6V0I1bmVsWEJMVDU3WFE0aFdZVjdD?=
 =?utf-8?B?eUFMclp2d0RFNFBLOWMxUE93QlIrcTFhTno1bkI0K01iejg1aTBmRGNEcEtm?=
 =?utf-8?B?U0JGRWpPTFVBVHFaQTdlUFhsUW1rSkVuOXgxbW8yVFJiNDduYjlRRTFHckZ4?=
 =?utf-8?B?S2dSWVgxN0tlOVZ0V2xUWm8xS29FWGFTZXBMbDliOEgvVVFhVzdpdHpaUjMy?=
 =?utf-8?B?S3MyMGtUNVdkcnpCTG1Sb1ErblFwanlnNTRxWUxra1ZoZkU1WlR0SVNCaG4y?=
 =?utf-8?B?UkVHbHAwOEtzMDA1VEVIcUt2TDcxNlBEeGFaUTVMNzhIN0dIa1dWMHVzSzVx?=
 =?utf-8?B?d053S2U0UXpBZUFxOVovMjNkZVo1V1FoQ3o4V1EzUXBMSGpWMFJ5ZW14bHlp?=
 =?utf-8?B?bm9NZ3p4QzVpOWxTa2tLaUZLNWcwM0QxaWFPazNKOUhGNCt1ZCttdE1XS2Y2?=
 =?utf-8?B?VlB1OHVEN1lYWTByZ0I3TVFQOU5HOFRqSkMrZUlSeTZ6VDNpckxXRS91NlJT?=
 =?utf-8?B?Tk9uVkZrengraTliWHJ4c3JDLzBMM0JTaE9yQ3FtZEVWVjA3aklTcGxsajFs?=
 =?utf-8?B?am1QSEhQU0p0ZjBVTVRYVmZXUWF4N2ZpaFY0Y2orK3hMWHBwWWs4bDZNVWE5?=
 =?utf-8?B?QmxIVlNQaWNHWk5iM2E2bDR5bzNieWRGWktycXZ1TlY4V1hJL3NZaU1Kay9Q?=
 =?utf-8?B?UFJFdDh3TDFGeTg0MGtoY0dwdXV5cTkzVllWZWMybFVIN0FncjVIZmpSbEJ1?=
 =?utf-8?B?RG5ldHlQeFdWTzRUSEQ2ekpTbkZ1SlhRVStlL2t2VE9hSEdCTm9jUzhONzdU?=
 =?utf-8?B?ZTFxWnhkOHdHTGkrc09kdEtEV1pmNTE2bUJUV2xJenMvaGRNZmVnZFArRzNB?=
 =?utf-8?B?ZHQySEI4enV4amFNOEFDYUVTU045MTdIWFZzTUlzeE1NNzVobEo0T05ySWc5?=
 =?utf-8?B?VWMzbjFPMHlPc0pvUXRaUE5WRVBlRjByNHVyTXB3UXpQMkdWckszWitMWTVo?=
 =?utf-8?B?YVZMODJkY1JPcGtYM0ZvSDA5RFFpOWwvbzNtN2tiV3MyRnF3ajJMZktLQ3Jw?=
 =?utf-8?Q?wduXAff6ZL37l32U9sOpueQA5YYzn5+T486kSjROCV6e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DB0227EF4AFE6438A711F303592BF29@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef04ca32-e861-42f8-ed3b-08dc49b3700e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 14:30:20.7422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yDygxosYTqxWPuEs6ndeTb6K3I0lZyVhWsCCCihhkAjVLnYJOcrxioWtsiOjyfkpVNEiH0h0LyBmhF/QOznAFOOACAKBpYpjOrkSp1KLl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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

T24gV2VkLCAyMDI0LTAzLTIwIGF0IDIyOjI5IC0wNDAwLCBPYWsgWmVuZyB3cm90ZToNCj4gV2hl
biB0aGVyZSBpcyBNTVVfTk9USUZZX1VOTUFQIGV2ZW50IGhhcHBlbnMsIHRoZSB1c2VycHRyDQo+
IGlzIG11bm1hcHBlZCBmcm9tIENQVS4gVGhlcmUgaXMgbm8gbmVlZCB0byBrZWVwIHRoZSB4ZV92
bWENCj4gZm9yIHRoaXMgdXNlcnB0ciBmcm9tIEdQVSBzaWRlLiBTbyB3ZSBkZXN0cm95IGl0Lg0K
PiANCj4gQnV0IHdlIGNhbid0IGRlc3Ryb3kgdm1hIGRpcmVjdGx5IGZyb20gdGhlIG1tdSBub3Rp
Zmllcg0KPiBjYWxsYmFjayBmdW5jdGlvbiwgYmVjYXVzZSB3ZSBuZWVkIHRvIHJlbW92ZSBtbXUN
Cj4gbm90aWZpZXIgZHVyaW5nIHZtYSBkZXN0cm95LiBJZiB3ZSByZW1vdmUgbW11IG5vdGlmaWVy
DQo+IGRpcmVjdGx5IGZyb20gbW11IG5vdGlmaWVyIGNhbGxiYWNrLCBpdCBpcyBhIGRlYWRsb2Nr
Lg0KPiB4ZV92bWFfZGVzdHJveSBpcyBtb2RpZmllZCB0byBkZXN0cm95IHZtYSBpbiBhIHdvcmtl
cg0KPiB0aHJlYWQuDQo+IA0KPiBBbm90aGVyIHJlYXNvbiBvZiB0aGlzIGNoYW5nZSBpcywgZm9y
IHRoZSBmdXR1cmUNCj4gaG1tcHRyIGNvZGVzLCB3ZSBkZXN0cm95IHZtYSB3aGVuIGhtbXB0ciBp
cyB1bm1hcHBlZA0KPiBmcm9tIENQVS4gV2Ugd2FudCB0byB1bmlmeSB0aGUgaG1tcHRyIGFuZCB1
c2VycHRyDQo+IGNvZGUuDQoNCkkgdW5kZXJzdGFuZCB0aGUgcGxhbiB0aGF0IGZvciB0aGUgMTox
IGFwcHJvYWNoIG9mDQp2bWEgPC0+IHB0X3N0YXRlLCB0aGlzIHdvdWxkIG1hcmsgdGhlIHB0X3N0
YXRlIGludmFsaWQsIGJ1dCB0aGUgeGVfdm1hDQpyZW1haW5pbmcsIHBvc3NpYmx5IG1lcmdlIGl0
IHdpdGggbmVpZ2h0Ym9yaW5nIGludmFsaWQgeGVfdm1hcz8NCg0KRm9yIDE6TiB0aGlzIHdvdWxk
IG9ubHkgaW52YWxpZGF0ZSBjZXJ0YWluIHB0X3N0YXRlIGNodW5rcy4NCg0KPiANCj4gSSBiZWxp
ZXZlIHRoaXMgaXMgYWxzbyB0aGUgY29ycmVjdCBiZWhhdmlvciBmb3IgdXNlcnB0ci4NCj4gVGhp
cyBwYXRjaCBpcyBleHBlcmltZW50YWwgZm9yIENJIGFuZCBvcGVuIHRvIGRpc2N1c3MNCg0KV2l0
aCB0aGUgcmVjZW50ICJpbnZhbGlkIHVzZXJwdHIiIGRpc2N1c3Npb24gd2UgaGFkIHdpdGggY29t
cHV0ZSBVTUQsDQp0aGV5IHJlcXVlc3RlZCB0aGF0IGlmIGEgbmV3IGNwdV9tbSB2bWEgd2FzIGFk
ZGVkLCB0aGUgdXNlcnB0ciB3b3VsZCBiZQ0KZnVuY3Rpb25hbCBhZ2Fpbi4gTm9ib2R5IGFjdHVh
bGx5IHRlc3RlZCB0aGF0IHRoYXQncyB0aGUgY2FzZSB3aXRoIHRoZQ0KY3VycmVudCBjb2RlLCBi
dXQgaWYgc28sIHRoaXMgd291bGQgYnJlYWsgdGhhdCBiZWhhdmlvdXIuIElNTyB0aGUNCmN1cnJl
bnQgYmVoYXZpb3Igc2hvdWxkIGJlIGtlcHQuIHhlX3ZtYSByZW1haW5zIGJ1dCBpcyBtYXJrZWQg
aW52YWxpZC4NCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8b2FrLnplbmdAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDggKysrKysr
Ky0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiBpbmRleCAxMWE0YmI5ZDU0MTUuLjkwZDExNjNjMTA5MCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gQEAgLTQwLDYgKzQwLDggQEANCj4gwqAjaW5jbHVkZSAieGVf
d2EuaCINCj4gwqAjaW5jbHVkZSAieGVfaG1tLmgiDQo+IMKgDQo+ICtzdGF0aWMgdm9pZCB4ZV92
bWFfZGVzdHJveShzdHJ1Y3QgeGVfdm1hICp2bWEsIHN0cnVjdCBkbWFfZmVuY2UNCj4gKmZlbmNl
KTsNCj4gKw0KPiDCoHN0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnhlX3ZtX29iaihzdHJ1
Y3QgeGVfdm0gKnZtKQ0KPiDCoHsNCj4gwqAJcmV0dXJuIHZtLT5ncHV2bS5yX29iajsNCj4gQEAg
LTYwNCw2ICs2MDYsOSBAQCBzdGF0aWMgYm9vbCB2bWFfdXNlcnB0cl9pbnZhbGlkYXRlKHN0cnVj
dA0KPiBtbXVfaW50ZXJ2YWxfbm90aWZpZXIgKm1uaSwNCj4gwqANCj4gwqAJdHJhY2VfeGVfdm1h
X3VzZXJwdHJfaW52YWxpZGF0ZV9jb21wbGV0ZSh2bWEpOw0KPiDCoA0KPiArCWlmIChyYW5nZS0+
ZXZlbnQgPT0gTU1VX05PVElGWV9VTk1BUCkNCj4gKwkJeGVfdm1hX2Rlc3Ryb3kodm1hLCBOVUxM
KTsNCj4gKw0KPiDCoAlyZXR1cm4gdHJ1ZTsNCj4gwqB9DQo+IMKgDQo+IEBAIC05MDEsNyArOTA2
LDggQEAgc3RhdGljIHZvaWQgeGVfdm1hX2Rlc3Ryb3koc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiBz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkNCj4gwqAJCQl4ZV92bWFfZGVzdHJveV9sYXRlKHZtYSk7
DQo+IMKgCQl9DQo+IMKgCX0gZWxzZSB7DQo+IC0JCXhlX3ZtYV9kZXN0cm95X2xhdGUodm1hKTsN
Cj4gKwkJSU5JVF9XT1JLKCZ2bWEtPmRlc3Ryb3lfd29yaywNCj4gdm1hX2Rlc3Ryb3lfd29ya19m
dW5jKTsNCj4gKwkJcXVldWVfd29yayhzeXN0ZW1fdW5ib3VuZF93cSwgJnZtYS0+ZGVzdHJveV93
b3JrKTsNCj4gwqAJfQ0KPiDCoH0NCj4gwqANCg0K
