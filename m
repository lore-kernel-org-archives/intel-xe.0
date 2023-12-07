Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E76C10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 08:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C6010E074;
	Thu,  7 Dec 2023 08:30:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9D310E074
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701937821; x=1733473821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HdTfrxWZQUkSghme1mGTQeCKIuPB4gMp+4h33jPhOtk=;
 b=GHw9oxcyix9JQbie/hz+uRd+0q1hM4T9vKaKdkmLT77KqKNekQWi18cE
 LppZqWMlxEVvKhYQSz7yLqWGUNirnx4J7ylT9TXMZo3SWuor0IjWnA7ug
 535wEOck7Bg21PwKqmGk9fWs9YsrrMKdbb+w4FeHfutNitsqj+8DVGLZr
 9PJMn+6ShovTwbqguiYk1v7Pc1wuX1Wq9OjTcbxlb1Ibv3VD4NZm1VkOT
 EHfBzKIR9crb3oDv6iVw+gTuTEID6bR817PVy/kdb+V0bOSTLlrn/Ox4p
 jffjeIZOxUpi5vsrkZhrP3qAevIeoP+IT4tciEPbyoJxqkwiuKSPdENwi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12911152"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12911152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19632065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 00:30:21 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 00:30:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 00:30:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 00:30:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El9HeYqfisu28JEtZ390MIkVxWXnZTgu1mPHZKqNp2GWt7fQYsBO+SgZerRxEnMC1K+Ph4PIWiozNUEfb/36ZxijVf5w6XOj+CwoLoxLg9gTszuPZ88/jaJrQ+LVX7Hk1BZsvnYjJmQTRZk5wDB8lzY9VOc+pKyxCeX/S9UWqEgoqz/x42BesldJyne4KGREV1JwXTYV1TehpsJn5uQCouaTHkAR3e7vgGr5GO67qw9wvYIAW0/AU8EKFJTaLAWQ/yJY2dKS0J+9/zjcBIOyI/PkYKIQBH875osMDnho6+eVL0MKPxl0oRqtNGD4F5ZLR3ZfzrAfDU8cIOrpQ+fViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdTfrxWZQUkSghme1mGTQeCKIuPB4gMp+4h33jPhOtk=;
 b=g1aalEX8Pi7+AHJEvzFBfGobXZGMg/Fy3wGUuoaRYvtf5rXE+Jt7o5uEPxTf6cMZy+sugTGJqVD9jNhjKUUawNP1F4MEvkteIwpOtu12a0P/5R1Qx4SfxFS5xNszeu6wgr9kGvzU0rJysv73KszfeYoIxuXUE9SeJySWmyre8z/Mo/EgqjonxwJLtOa0HfkOmLYWb9irkFYzhChEwLO+Eu0Loo/Y1X+EP1Td6OP4GrT01sMlNgGlwp3f5IKK97+sRqPNvTNFiqDryDJqA6Nid4KWqHuaUVHMuREHKEj1K0oKU5bcFP8mwvEinA85hOBbiXnr9gw8o+jz/zzrZdYzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 08:30:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::399c:3488:d511:adef%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 08:30:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under tile
Thread-Index: AQHaJ/1lvSh0mtb24EupUiCAkv4727CcJcKAgAAEAACAAAGMAIABHD8AgAAC/4CAAAyWAIAACN+AgAAN5ACAABClEA==
Date: Thu, 7 Dec 2023 08:30:17 +0000
Message-ID: <SJ1PR11MB62046759B76BE89DA0672809818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
 <20231206044735.966213-2-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62113FC5A386520506F9912C9584A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d9e06457-ec98-46b4-9235-8e9b3b71ffa0@intel.com>
 <7b70c647-6fb6-46ed-98e0-8e898625b5a3@intel.com>
 <SJ1PR11MB62049D5B2C629111948A668E818BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <65cbe85b-30a2-470c-974f-ba811ec38b52@intel.com>
 <a4be4be8-700e-44b4-b0af-1d847774054a@intel.com>
 <d6d0fd1e-3c13-4992-8969-ea6533b7128a@intel.com>
 <38a32c29-fd64-4770-82cd-6e3660d14191@intel.com>
In-Reply-To: <38a32c29-fd64-4770-82cd-6e3660d14191@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW4PR11MB5934:EE_
x-ms-office365-filtering-correlation-id: 4112a2f5-200d-4ef9-874f-08dbf6febe48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: diUfcmce2AsrpVmbNOOggsueZRwlWP2Y5V9dl26yhz8osnQuz0PPXePQ+/HYwgVnK9H4p42pNtpgLBlSvAhhMrcc5+IdFARz8PLlWJC2YmcqPVu2GgLk2afyBXVj959fROOmX7tXu6AhJWpE9jNdFQ7TBnTeT902B8LDbr7XolU/r/cdcHukErce8zzkHnsbPdSH1Xme8BEzJdMSK3Cz+tGx3TO7cUud+v98+p5vXM8Qr8qldAItzp8t7fn+liEHPNC99XFvndCB3UdbrehS0IjlSLdf0GC0i5/MZ7s6C0DIv9NZIH06rDi5/M+IQriPvFDvHfcpbNr77p/qgV/ijI/eSEpEaA/woOCWr3Bu9cHRZay+QVs4QZJ3qSqFRMIS1NGR3wk1zRVwoASVRcw6Ew7EY8Z9Wx8J5qdE45bIWk6ZfgSXTC9qGVTG6vbgLkkvdkXkMS/fmzKbRJCauVv47hT0tGqr5g01Nn8DwJ2oNo7H8zoSEeQyqP1Aq+2cwd8sgXloPociWmWzZalhbulYMb0D2xC89bY/V2kjYVZ1aquUlGKByU6yDBEGcgXKR1kw9+RD1iumJ7tHbXShwWkjxCBG4Iftwkc3wUB+iJpIDt5z4YqN67fI+hItLI3mdHPFCi0B+zD64jX27YwX182Zzv6Ohq25KIilWnOnmiCxcMY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(55016003)(9686003)(53546011)(107886003)(26005)(122000001)(38100700002)(82960400001)(86362001)(38070700009)(33656002)(2906002)(316002)(52536014)(478600001)(5660300002)(83380400001)(41300700001)(8936002)(4326008)(8676002)(76116006)(110136005)(66946007)(66476007)(66446008)(64756008)(7696005)(6506007)(71200400001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2c2VTYrNnl0QWgvc1pwQUtBbDVualFtR1FMRXYvdEVkMDFHaTBPV1V1RGZO?=
 =?utf-8?B?Wmd4QWVRYVdhamNNZHRScFNEeXowK2lKRTg4RWl3dnBFSWJnTkhaYjJpdnhY?=
 =?utf-8?B?bDBmVy9uK0xqdUJsaTMycHJzWHkvdVYwWWYyQzdpRno2MDJ3TW5EV2lyNGR5?=
 =?utf-8?B?K2VROU1TT3ZiaGltTXVqbXZWL2xDZlFxSGdiNzk5VDcvVk5FK085OVBoTHFG?=
 =?utf-8?B?VXpXY1dmRXcvM3J6TE14cXdFKzQ0cDZyWFc1OWlFV2pOVGRHOVRoMHFyTlV5?=
 =?utf-8?B?VlZCOXZaUFF0QWJ2b3hOUWloS0dVUERMWGtlUkNSYThFYm83K2pMamxHdm9E?=
 =?utf-8?B?OGkrb2FVdm1HZmFJa3RHOEdoSXRYWGZKbWxzOTRSTFN3ZCtLalBybmtvZERl?=
 =?utf-8?B?MjY4ZGRlNXl6OEJUTjFwVmdvSWprMmlCcnBUcStSUldKb0NKdXN6TkMxc1RH?=
 =?utf-8?B?R01rSFBOcmxpS3FYQzFlVUd5eW4vQ3BySW5mRXlteUgrY3ZhZ2ZsYzNOOFoz?=
 =?utf-8?B?MXhJdUFtTEZPbXozRHU5T29DSXZRd0RDRGpacllURzlGUFh1R0U1cE51ZThl?=
 =?utf-8?B?VklMV2MwelRpdENSME5adWgwRUhmOEF1dVhVUEdUWlR2bHdmYkpnUm9HWTlG?=
 =?utf-8?B?cXpDT0JwbGtFbDYzcllCTk5HSkNYYVhEVUJRTVFZc3VzeW1NTHFoMmZUVVVp?=
 =?utf-8?B?dWlHbUZzWnFNL2FiZVViMUxLWTZDbmxuQmtXVXNUb0NRSjAwMVpTR1NuWW1P?=
 =?utf-8?B?OXltSDBlNDJmR1J3cGNjNWYzcno5US9Zc1pZQWZRcEJKSFg5VFZZSDM5RUpj?=
 =?utf-8?B?YnBrQnB3SG5RcTRleXl0SXFjMzFpaVUvLzBHZkVPQTBmREprWGliZ0Jvdzc2?=
 =?utf-8?B?QlZnWmRyNnh6RGFPb3FnbW9jdVZ0NXJjMXNrYjdtWFQxNWQzc3NXcGgzelhE?=
 =?utf-8?B?cmM2MVB5S2MvcjV1bVlSODFyTGMzbjF5dThLYlpjMjlUU0dianNHenBGVXhN?=
 =?utf-8?B?cFBLQjdiZk51T0lNZG1od2dBRzRyK0JwQVR0dW1SMDZlc3BueGdBWjU0WHZs?=
 =?utf-8?B?UXlVWlVURmVFVXpBNHRoeW01c1djOGNZR0tMeDRvdXdydlhlS215U2ZJMkFJ?=
 =?utf-8?B?MkkzelFUSVlOci9iekFVdG1DS3NwN1h3WnAwbGM1VW92RitwNG82ZDFreVFD?=
 =?utf-8?B?a3dCaGg0QnNNemNiaFlYbGx6SVIzQVhycDF0dnZZSzJtaXA0akNCVnRFaVFu?=
 =?utf-8?B?QTkyTXp0SitLQ1FzbnFycmw4cWdKcEZuOTVQdGs5R3k2MVFmRXM0VDBzZVVk?=
 =?utf-8?B?bS95anJUT2M3T0R4VzhwZUg4NmR1N2pFVHhSM1JaV0ZHY09WelhyMHdWREIz?=
 =?utf-8?B?dlNmOU1rYURNYjVoUFQySWE2aWNXS0tTeXVCaDBmcTc1VlBtcHRmakgvUWFq?=
 =?utf-8?B?cTFDRStTSDQ4Umd3ckxNeGtwTDkyNjBmVWxsZC8xTUQzM2lVS1BaT04wM2tk?=
 =?utf-8?B?dWRaOC9WWmpTby9EeFA0UnEyQ1FDSVpzbWpUT3ZIdXkvNDArcEZVUkY5TzVw?=
 =?utf-8?B?dFprQVRzNmk4RStaQzQxWENVK3lTbW1ueHFvU1NSanA5ZG5hUHhsRFNkOHdu?=
 =?utf-8?B?VUZsV0hvUVNVRjlnV3NWOW1HSzlHcXo3cW5NajdaVlhlSk5IdGZWMko5RU9H?=
 =?utf-8?B?em9KVTJtVFgydkZlbDc1QzNiM1VpSHQzZnk5MWptMTVoVkpnYWJqU2dEMTM0?=
 =?utf-8?B?bVY3YUZCaXR6YzdmRmZmRGJUNDdsanJmODZaQWNEL2xLdHBKUW42N08vcVU3?=
 =?utf-8?B?TFU5dnRJdWlzQmx3TnMyaHRCN3hzTys4MTZqVTVtcEMrRnpuaTlsSUtCV3d3?=
 =?utf-8?B?cmUxRXBhWG1WOVpCdlA2VWF2TmZrRHFIU1dkb1ZQMzd4U28xVUpldUZjbkhp?=
 =?utf-8?B?cmVwRkFMckhPWTdGVlR1N0xWTUdNd0JKU0Q5dGJrS1VXT2V0bDlnTXFHM2hX?=
 =?utf-8?B?M1V2YW40NmlLb2M2REExTEUraEo4TCtsblhyWU5LV2hnWFBDN2UzZlRsSllD?=
 =?utf-8?B?a29OaDZiY2wxaUhaZlBaOWhibVp2YUpsN0U5WnRWM2RIanBiWFhZRWhHaEdJ?=
 =?utf-8?Q?jmXPnxEL35QNfGqw/RNVx07Bm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4112a2f5-200d-4ef9-874f-08dbf6febe48
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 08:30:17.7113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hcdor+jLOBBoYvoPGEJbmgVWx+CBkXBkHVWyC8TyDEf8YWttNopKwIzSRQYNSjxwkZvWt3cWeslRCz59CwlndfteJu9aLbBZW+2pmbwjNwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 1/2] drm/xe: Add a new memory directory under
 tile
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VuZGFyZXNhbiwgU3Vq
YXJpdGhhIDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBEZWNlbWJlciA3LCAyMDIzIDEyOjU4IFBNDQo+IFRvOiBUYXVybywgUmlhbmEgPHJpYW5hLnRh
dXJvQGludGVsLmNvbT47IFVwYWRoeWF5LCBUZWphcw0KPiA8dGVqYXMudXBhZGh5YXlAaW50ZWwu
Y29tPjsgR3VwdGEsIEFuc2h1bWFuDQo+IDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+OyBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFt2MiAxLzJdIGRybS94
ZTogQWRkIGEgbmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXINCj4gdGlsZQ0KPiANCj4gDQo+IE9u
IDEyLzcvMjAyMyAxMjowOCBQTSwgU3VuZGFyZXNhbiwgU3VqYXJpdGhhIHdyb3RlOg0KPiA+DQo+
ID4gT24gMTIvNy8yMDIzIDExOjM2IEFNLCBSaWFuYSBUYXVybyB3cm90ZToNCj4gPj4NCj4gPj4N
Cj4gPj4gT24gMTIvNy8yMDIzIDEwOjUxIEFNLCBTdW5kYXJlc2FuLCBTdWphcml0aGEgd3JvdGU6
DQo+ID4+Pg0KPiA+Pj4gT24gMTIvNy8yMDIzIDEwOjQyIEFNLCBVcGFkaHlheSwgVGVqYXMgd3Jv
dGU6DQo+ID4+Pj4NCj4gPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4g
RnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYNCj4gPj4+Pj4gT2YgU3VuZGFyZXNhbiwgU3VqYXJpdGhhDQo+ID4+Pj4+IFNlbnQ6
IFdlZG5lc2RheSwgRGVjZW1iZXIgNiwgMjAyMyA1OjQ0IFBNDQo+ID4+Pj4+IFRvOiBHdXB0YSwg
QW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IGludGVsLQ0KPiA+Pj4+PiB4ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+Pj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+DQo+ID4+Pj4+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFt2MiAxLzJd
IGRybS94ZTogQWRkIGEgbmV3IG1lbW9yeQ0KPiA+Pj4+PiBkaXJlY3RvcnkgdW5kZXIgdGlsZQ0K
PiA+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiAxMi82LzIwMjMgNTozOCBQTSwgU3VuZGFyZXNh
biwgU3VqYXJpdGhhIHdyb3RlOg0KPiA+Pj4+Pj4gT24gMTIvNi8yMDIzIDU6MjMgUE0sIEd1cHRh
LCBBbnNodW1hbiB3cm90ZToNCj4gPj4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4+Pj4+Pj4gRnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiBPbg0KPiA+Pj4+Pj4+PiBCZWhhbGYgT2YgU3VqYXJpdGhhIFN1bmRhcmVzYW4N
Cj4gPj4+Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA2LCAyMDIzIDEwOjE4IEFNDQo+
ID4+Pj4+Pj4+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPj4+Pj4+Pj4g
Q2M6IFN1bmRhcmVzYW4sIFN1amFyaXRoYSA8c3VqYXJpdGhhLnN1bmRhcmVzYW5AaW50ZWwuY29t
PjsNCj4gPj4+Pj4+Pj4gVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4g
Pj4+Pj4+Pj4gU3ViamVjdDogW0ludGVsLXhlXSBbdjIgMS8yXSBkcm0veGU6IEFkZCBhIG5ldyBt
ZW1vcnkgZGlyZWN0b3J5DQo+ID4+Pj4+Pj4+IHVuZGVyIHRpbGUNCj4gPj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4gQWRkIGEgbmV3IG1lbW9yeSBkaXJlY3RvcnkgdW5kZXIgL2RldmljZS90aWxlPG4+IGFu
ZCBtb3ZlDQo+ID4+Pj4+Pj4+IHBoeXNpY2FsX3ZyYW1fc2l6ZSBhdHRyaWJ1dGUgdG8gdGhlIG5l
dyBkaXJlY3RvcnkuDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IE5ldyBoaWVyYXJjaHk6DQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+IC9kZXZpY2UvdGlsZTxuPi9tZW1vcnkvcGh5c2ljYWxfdnJhbV9z
aXplX2J5dGVzDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IHYyOiBGaXggaGVhZGluZyB0eXBvIChS
aWFuYSkNCj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoCBGaXggY2xlYW51cCBlcnJvciBvbiB1bmxvYWQv
cmVsb2FkIGN5Y2xlDQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFN1amFy
aXRoYSBTdW5kYXJlc2FuDQo+ID4+Pj4+Pj4+IDxzdWphcml0aGEuc3VuZGFyZXNhbkBpbnRlbC5j
b20+DQo+ID4+Pj4+Pj4+IC0tLQ0KPiA+Pj4+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV90aWxlX3N5c2ZzLmMgfCAxNSArKysrKysrKysrKystLS0NCj4gPj4+Pj4+Pj4gwqDCoCAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2Zz
LmMNCj4gPj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+
Pj4+Pj4+IGluZGV4IDE2Mzc2NjA3YzY4Zi4uZThjZTRkOTI3MGU2IDEwMDY0NA0KPiA+Pj4+Pj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGlsZV9zeXNmcy5jDQo+ID4+Pj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90aWxlX3N5c2ZzLmMNCj4gPj4+Pj4+Pj4gQEAgLTI0
LDcgKzI0LDggQEAgc3RhdGljIHNzaXplX3QNCj4gPj4+Pj4+Pj4gwqDCoCBwaHlzaWNhbF92cmFt
X3NpemVfYnl0ZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICprZGV2LCBzdHJ1Y3QNCj4gPj4+Pj4+Pj4g
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyICpidWYpDQo+ID4+Pj4+Pj4+IMKgwqAgew0KPiA+Pj4+
Pj4+PiAtwqDCoMKgIHN0cnVjdCB4ZV90aWxlICp0aWxlID0ga29ial90b190aWxlKCZrZGV2LT5r
b2JqKTsNCj4gPj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qga29iamVjdCAqa29iaiA9ICZrZGV2LT5r
b2JqOw0KPiA+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCB4ZV90aWxlICp0aWxlID0ga29ial90b190
aWxlKGtvYmotPnBhcmVudCk7DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBy
ZXR1cm4gc3lzZnNfZW1pdChidWYsICIlbGx1XG4iLA0KPiA+Pj4+Pj4+PiB0aWxlLT5tZW0udnJh
bS5hY3R1YWxfcGh5c2ljYWxfc2l6ZSk7DQo+ID4+Pj4+Pj4+IMKgwqAgfQ0KPiA+Pj4+Pj4+PiBA
QCAtMzgsNyArMzksNyBAQCBzdGF0aWMgdm9pZCB0aWxlX3N5c2ZzX2Zpbmkoc3RydWN0IGRybV9k
ZXZpY2UNCj4gPj4+Pj4+Pj4gKmRybSwgdm9pZA0KPiA+Pj4+Pj4+PiAqYXJnKcKgIHsNCj4gPj4+
Pj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV90aWxlICp0aWxlID0gYXJnOw0KPiA+Pj4+Pj4+
Pg0KPiA+Pj4+Pj4+PiAtwqDCoMKgIGtvYmplY3RfcHV0KHRpbGUtPnN5c2ZzKTsNCj4gPj4+Pj4+
Pj4gK8KgwqDCoCBrb2JqZWN0X2RlbCh0aWxlLT5zeXNmcyk7DQo+ID4+Pj4+Pj4gV2h5IGtvYmVr
Y3RfZGVsIGluc3RlYWQgb2Yga29iamVjdF9wdXQ/DQo+ID4+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+
Pj4+IEFuc2h1bWFuIEd1cHRhLg0KPiA+Pj4+Pj4gSGkgQW5zaHVtYW4sDQo+ID4+Pj4+Pg0KPiA+
Pj4+Pj4gQmFzaWNhbGx5IHdoZW4gc2FuaXR5IGNoZWNraW5nLCBhZnRlciByZWxvYWQgd2Ugc2Vl
IHRoYXQgd2UgYXJlDQo+ID4+Pj4+PiBub3QgZG9pbmcgYSBwcm9wZXIgY2xlYW51cC4NCj4gPj4+
Pj4+DQo+ID4+Pj4+PiBrb2JqZWN0X3B1dCB3aWxsIG9ubHkgZGVjcmVtZW50IHRoZSByZWYgY291
bnQgYW5kIHBvc3NpYmx5IGZyZWUNCj4gPj4+Pj4+IHRoZSBrb2JqZWN0Lg0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4+IEJ1dCB0aGF0IGlzIG5vdCBoYXBwZW5pbmcgaW4gdGhpcyBjYXNlLiBUaGVyZSBpcyBh
IGR1cGxpY2F0ZQ0KPiA+Pj4+Pj4gcmVtYWluaW5nIG9mIHRoZSB0aWxlIGRpcmVjdG9yeS4NCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBUaGlzIHJlcXVpcmVkIGEgY2xlYW4gdW5yZWdpc3RlciBvZiB0aGUg
cGFyZW50IGZyb20gc3lzZnMgaGVuY2UNCj4gPj4+Pj4+IHRoZSB1c2Ugb2Yga29iamVjdF9kZWwu
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhhbmtzLA0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFN1amENCj4g
Pj4+Pj4gQXMgYSBjb250aW51YXRpb24gb2YgdGhlIGFib3ZlIHJlc3BvbnNlOw0KPiA+Pj4+Pg0K
PiA+Pj4+PiBJIGNhbiBwcm9iYWJseSBhZGQgYSBrb2JqZWN0X3B1dCBjYWxsIGFzIHdlbGwgdG8g
ZW5zdXJlIHRoYXQgd2UNCj4gPj4+Pj4gYXJlIGNsZWFuaW5nIHVwIHRoZSBtZW1vcnkgc2lkZSBv
Zg0KPiA+Pj4+Pg0KPiA+Pj4+PiB0aGluZ3MgYXMgd2VsbC4gV2lsbCBhZGQuDQo+ID4+Pj4+DQo+
ID4+Pj4+IFRoYW5rcywNCj4gPj4+Pj4NCj4gPj4+Pj4gU3VqYQ0KPiA+Pj4+Pg0KPiA+Pj4+Pj4+
PiDCoMKgIH0NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gwqDCoCB2b2lkIHhlX3RpbGVfc3lzZnNf
aW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkgQEAgLTQ2LDYgKzQ3LDcNCj4gPj4+Pj4+Pj4gQEAg
dm9pZCB4ZV90aWxlX3N5c2ZzX2luaXQoc3RydWN0IHhlX3RpbGUgKnRpbGUpDQo+ID4+Pj4+Pj4+
IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRpbGVfdG9feGUodGlsZSk7DQo+
ID4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsN
Cj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBrb2JqX3RpbGUgKmt0Ow0KPiA+Pj4+Pj4+
PiArwqDCoMKgIHN0cnVjdCBrb2JqZWN0ICprb2JqOw0KPiA+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAg
aW50IGVycjsNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGt0ID0ga3phbGxv
YyhzaXplb2YoKmt0KSwgR0ZQX0tFUk5FTCk7IEBAIC02NCw4ICs2NiwxNQ0KPiA+Pj4+Pj4+PiBA
QCB2b2lkIHhlX3RpbGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSkNCj4gPj4+Pj4+
Pj4NCj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIHRpbGUtPnN5c2ZzID0gJmt0LT5iYXNlOw0KPiA+
Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiArwqDCoMKgIGtvYmogPSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRk
KCJtZW1vcnkiLCB0aWxlLT5zeXNmcyk7DQo+ID4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCFrb2JqKSB7
DQo+ID4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBrb2JqZWN0X3B1dChrb2JqKTsNCj4gPj4+PiBE
byB5b3UgbWVhbiB0byBwdXQga29iamVjdF9wdXQodGlsZS0+c3lzZnMpIGluc3RlYWQgb2YNCj4g
Pj4+PiBrb2JqZWN0X3B1dChrb2JqKSA/IGFzIHRoZXJlIHdhcyBubyBLb2JqIGNyZWF0ZWQgYnkg
dGhlIHRpbWUgeW91DQo+ID4+Pj4gcmVhY2hlZCBoZXJlIQ0KPiA+Pj4+DQo+ID4+Pj4gVGVqYXMN
Cj4gPj4+DQo+ID4+PiBZdXAgdGhpcyBzaG91bGQgYmUgZml4ZWQuDQo+ID4+IEhpIFN1amENCj4g
Pj4NCj4gPj4gUmVtb3ZpbmcgdGlsZSB3b24ndCBiZSByaWdodCwgYXMgdGhlcmUgYXJlIG90aGVy
IGRpcmVjdG9yaWVzIChndCMpDQo+ID4+IGRlcGVuZGVudCBvbiBpdC4gU2ltcGxlIHJldHVybiBz
aG91bGQgYmUgZ29vZCB3aXRoIGEgd2Fybj8NCj4gPj4NCj4gPj4gVGhhbmtzDQo+ID4+IFJpYW5h
DQo+ID4gU3VyZS4gV2UgY2FuIHByb2JhYmx5IGhhdmUgdGhlIG9yaWdpbmFsIGNsZWFudXAgaW4g
ZmluaS4NCg0KSWYgeW91IGp1c3QgZ2l2ZSB3YXJuIGFuZCByZXR1cm4gdGhlbiB5b3Ugd2lsbCBu
ZXZlciByZWdpc3RlciB0aWxlX2ZpbmkgZnVuY3Rpb24gYW5kIGl0IHdpbGwgbmV2ZXIgYmUgY2Fs
bGVkIG9uIGRyaXZlciB1bmxvYWQvcmVsb2FkLiBTbyBlaXRoZXIgeW91IHJlbW92ZSB0aWxlIHVz
aW5nIGtvYmplY3RfcHV0KCkgYmVmb3JlIHJldHVybiBvciBkb27igJl0IHJldHVybiBhbmQgY2hl
Y2sga29iaiBiZWZvcmUgY3JlYXRpbmcgZmlsZXMgdW5kZXIgaXQgdG8gYXZvaWQgY3Jhc2guDQoN
ClRlamFzDQogDQo+ID4+Pg0KPiA+Pj4gVGhhbmtzLg0KPiA+Pj4NCj4gPj4+IFN1amENCj4gPj4+
DQo+ID4+Pj4NCj4gPj4+Pj4+Pj4gKyBkcm1fd2FybigmeGUtPmRybSwgIiVzIGZhaWxlZCwgZXJy
OiAlZFxuIiwgX19mdW5jX18sIC0NCj4gPj4+Pj4+Pj4gRU5PTUVNKTsNCj4gPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybjsNCj4gPj4+Pj4+Pj4gK8KgwqDCoCB9DQo+ID4+Pj4+Pj4+ICsN
Cj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChJU19ER0ZYKHhlKSAmJiB4ZS0+aW5mby5wbGF0
Zm9ybSAhPSBYRV9ERzEgJiYNCj4gPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHN5c2ZzX2NyZWF0
ZV9maWxlKHRpbGUtPnN5c2ZzLCBwaHlzaWNhbF9tZW1zaXplX2F0dHIpKQ0KPiA+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgc3lzZnNfY3JlYXRlX2ZpbGUoa29iaiwgcGh5c2ljYWxfbWVtc2l6ZV9h
dHRyKSkNCj4gPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3dhcm4oJnhlLT5kcm0s
DQo+ID4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiU3lzZnMgY3JlYXRp
b24gdG8gcmVhZCBhZGRyX3JhbmdlIHBlciB0aWxlDQo+ID4+Pj4+Pj4+IGZhaWxlZFxuIik7DQo+
ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IC0tDQo+ID4+Pj4+Pj4+IDIuMjUuMQ0KPiANCj4gSGkgYWxs
LA0KPiANCj4gU28gYWZ0ZXIgYWxsIG9mIHRoaXMgZGlzY3Vzc2lvbiwgaGVyZSdzIHRoZSBmaW5h
bCByZXN1bHRzIGFmdGVyIHRlc3RpbmcgdGhlIGNsZWFudXAuDQo+IA0KPiBSZWdhcmRsZXNzIG9m
IGFueXRoaW5nIHdlIGRvIGluIHRoZSBpbml0IGZ1bmN0aW9uLCBpdCBsb29rcyBsaWtlIHdpdGhv
dXQgaGF2aW5nDQo+IHRoZQ0KPiANCj4gdHdvLXN0ZXAga29iamVjdF9kZWwgYW5kIGtvYmplY3Rf
cHV0IGNsZWFudXAgaW4gdGhlIHN5c2ZzX2ZpbmkgZnVuY3Rpb24gd2UNCj4gd2lsbA0KPiANCj4g
c2VlIGFuIGVycm9yIG9uIHJlbG9hZCB3aXRoIHRoZSB0aWxlIGRpcmVjdG9yeSBub3QgYmVpbmcg
ZnVsbHkgY2xlYW5lZCB1cCBhbmQNCj4gcmVwb3J0aW5nDQo+IA0KPiBkdXBsaWNhdGUgY3JlYXRp
b24uDQo+IA0KPiBUaGUgc29sdXRpb24gc2VlbXMgdG8gYmUganVzdCB0byBhZGQgYSBrb2JqZWN0
X2RlbCBiZWZvcmUga29iamVjdF9wdXQgaW4gdGhlDQo+IGZpbmkNCj4gDQo+IGZ1bmN0aW9uLg0K
PiANCj4gSSBhbSBvbmx5IGhhdmluZyB3YXJuaW5ncyBhbmQgc2ltcGxlIHJldHVybnMgb24gdGhl
IGluaXQgc2lkZS4NCj4gDQo+IElmIHRoZXJlIGNhbiBiZSBhIGNvbnNlbnN1cyBhYm91dCB0aGlz
IGZyb20gdGhlIHJldmlld2VycywgSSBjYW4gZmxvYXQgdGhlIG5leHQNCj4gdmVyc2lvbg0KPiAN
Cj4gYWNjb3JkaW5nbHkuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBTdWphDQoNCg==
