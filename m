Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA04DC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 17:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A83B10EA63;
	Fri, 15 Dec 2023 17:03:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2011C10EA63
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702659825; x=1734195825;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=2XbH3RAE1I7lyylO50jZAcinF9zPeJG/c7DcgGcZoMU=;
 b=jZwCqcbr2uzXs0GfzeerMRAvovOI7vCzMm53UoqEa6PxPLXgMSTJo5BO
 lyR4ob9TLhdbhVc+Elzl/+o530xQkE6VLnpODp490mGjcssWmPpkr3WSB
 bQogg/5EqLrCjdKBAkrgtcI2/BnQc80fJWDTtzGn2I2FW7ViUN+WH8Cz5
 xBHAI7cgDGRCRLz6/zvR9ppU+wUkMIAG2cKx1qGcUX+RtZnTBelP3wWm2
 WWYT93q0OQdqVSsyTXFpmaGs+aFYghMCQuqpybvrOA7W5KIF1aT+4qnZM
 Q4nFh9CWetVCZDaaK55KdKSdlgoV1kyvOqvMI01hFk6XsCBIldZkHV7MH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2471284"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2471284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 09:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768046182"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="768046182"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 09:03:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 09:03:43 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 09:03:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 09:03:42 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 09:03:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cer87ZgxZev6w34NbkA3EVNB8hAm0hDB6g45EW0LziDD3KEzg8u08kdwgeTsSRuQDZgyp3VSNG2TiFeHmR78VyD5XQJ9Ak08PakAgjOlLKG083cr2HINS7xD1ImXlJA2GpINuL1R3OIjigMia1/DLHYpWY5zTva0gAHtdWC99s8ee99OEjAaDIGxd3Cafnp/kqkJGKwEw0n3Xm6xhBnujpAI53ysZO69EXXMntYpocEQSo4je2K1ifEldsvWHJq3GhQ77Mv0mciFJGloMvUsRI/kE8BbEXp5Jk5zSiJegyIV73/c6mILQzRwd8oH6nQjMhu+4ODiS53P7o/8C+8PgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XbH3RAE1I7lyylO50jZAcinF9zPeJG/c7DcgGcZoMU=;
 b=Ag0wTiXWlc5QgFcSxos2KPK2UG2UrE+nRIxwm0FjV7qklWucpU4kIXF+Nu3eREKWcCKNAFrVNLw4QlYzpDPH448zdZkqn6W8cwSA5RYGzm55PTDfBQReBBV0dc5M6Dqq/OrvGAhniMvb05YsT1t/n0NYq3apyTF1IxH2nTluVFUY8b/xHKkf4Z125Y3akNMOiLYRqdMrFBtFP4hn6MPQKJQBwa0vJDV+r/BydOA2poupQCi7zh1cTgBybq73ECf+bzCpKy5h46vc5pMmcSSqH/A7RylGXcfD1eyFb9U8SNuSZqo5UCzPZPtt7jFBpmpehBkuODJ8vBmsq70HQKyUUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 17:03:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7091.030; Fri, 15 Dec 2023
 17:03:39 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v1 00/21] uAPI Alignment - More cleanup before upstream
Thread-Topic: [PATCH v1 00/21] uAPI Alignment - More cleanup before upstream
Thread-Index: AQHaL23doXcO8jdN4kKL9zRt+RAIfrCqkmwA
Date: Fri, 15 Dec 2023 17:03:39 +0000
Message-ID: <409d4e8c4a7a4597c43d038b8cf97140d1d14f6a.camel@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW5PR11MB5884:EE_
x-ms-office365-filtering-correlation-id: c4d6d8ca-f412-495d-5473-08dbfd8fc8af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /3cjoqIaNrs04hTyxaocYnnMLdmvmnqt9IJQkfLNw4bde/7GpUGFSLnZIqXc1SM/MA4MT7JLwYDu6l7tA+oklo0I7VxIMcT+AkMJOrefTX/VVbwdwDivg/12dhrRT5WCV5BtwUFwiAenSk4M1WBsGE88kQi83C51a81Y8YS3kdG2pipp4GZ3/rNmfbMY2s/j2LyLSMHSMIcb+H5PJp/f4iDqCp7uT0Lx5Sqa9Uy8OGbH+3Zbd9hqpWIrWWV3gH3q0NTSh2bJIOHaMeeh6o0jNgOpIGOjfXV3u0RCBhbmeP4gEVrVeqBOBld4QU9zN92EocHR+gPgVOMkdEftRvK+y383Y8MymedWrHE5HXuRmz1ymJ0bvgnjuqRnbceg+F+VHhU2L8zyYHdf58FypkBq+RMvfT+6STKbdRbnR6eXr/cxt6o+QaazCjxH0JLLI1Kuosd3l1MZKt5j20waCsWeOXoTvBScZ3SWRg7bNqVGXiii/qyNl9w2SIvZX53dXI4njHcpzUjPMIRieqTC2u8qPtaJX5Zs9fICjqHzrxotnqL86AjTbnH0icz+b3I4RfWBT2h443sLRlFaGR7GMC+/X0msh+dme8PkhFwa2qAIVFla5L2kzw5tmoBrtajxxBT2gN38aUAsRUgE6+o9ZDgfDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(2616005)(6512007)(6506007)(71200400001)(122000001)(38070700009)(38100700002)(86362001)(36756003)(82960400001)(41300700001)(4001150100001)(8676002)(8936002)(110136005)(91956017)(478600001)(5660300002)(2906002)(83380400001)(76116006)(6486002)(966005)(66946007)(66556008)(66446008)(64756008)(66476007)(316002)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVBSNUJDajI0aGxoSEpVNjlzU1lSSHRjK3J3SzB2RldkcEJjSzdBOEpQeWFT?=
 =?utf-8?B?Sjd2T3pDb0lkY1JacU04ZHlXWTI3Q2dpTlZSbzJhSVE2U2FraDFPK3dYUFpj?=
 =?utf-8?B?aURRV3BLV1pjTUwzK1pKVVMrelpJSDN3a2NEeitpVXZXdXhMRmpFQ2hJb3ds?=
 =?utf-8?B?SVNmbmliQmFwTzJOQVRsajhOL0JKMkhhMEtESkR6M3JrSllnd01vRzhBbW54?=
 =?utf-8?B?bWVMUWt3RzE0QnNuUWdSUFdJQmpRMEFlNHBMVEVocVNpZXpUak9MemRnMFQ5?=
 =?utf-8?B?aFBpdWptVDhsNVNxS2RRZ01UVnJ4UE5SZ2JPN21zZmtJNFMyaHNMZC9RK0NU?=
 =?utf-8?B?K20ybzlWTnJUNjVzc09icUFkQjM1ZkJybjJpSVVrTzhmb0ppZFFIQzBOaHI4?=
 =?utf-8?B?ckxuTkcyV3RwNEdZKzM4ZTBzS2E1SGdvelFvOU15Ui95MXdjeGdjYmhjQ2N3?=
 =?utf-8?B?dzhuVFAyZUlXWjNnRyt5dmZZdkptRGFkQ2FKSDF0eDRvSEtxc1B4TUtmVFVU?=
 =?utf-8?B?MG9ibnBNR21HY2R0TGlDTzY0c3lSbXYxNGdrRDZaTWYyQUQ1MU5UOGRweUxG?=
 =?utf-8?B?RGhJRnU4N2F3WVhkSkk1Z1BaY1FPUTZqOVd6M1FNOXFiajRjQ3NKMytUV1dk?=
 =?utf-8?B?MC9VUXhLT0Mzb3Q1OTZEczR1SzZ6ZlB0dFhGM1g5MkFaTG15eXNQOFNwY3FN?=
 =?utf-8?B?NSt3YUNGYkV6Tys3YVpWRGhOU1hIWFRKdXBPcndtZzZNR1dEc3ZxUlZuL05u?=
 =?utf-8?B?N25BVm9UZU1pRGttTEl4OXZCZDUra3JwK2tmYi90aDBGMTloL3NDc0NBS05v?=
 =?utf-8?B?Q1E5OUIzbWpHQXdLOFdxTDdhRkszNjdmZTlXYjFaSTR3YmRtcVFDSVJrNEpS?=
 =?utf-8?B?dHF6VlF0b3VTZ0g5dGJFUTJVNUxicmduREl3Tzk4K0lyMnFzZ1UxZFV2NVZJ?=
 =?utf-8?B?UElHOCs4b1pOa1cyYkIxUnI0YU9IZEpGSTRxQkRQdTY2WlBKMy85SDJSOGo0?=
 =?utf-8?B?Uk84THJNM2R6K25VRDRjZWdNRDZLMmpUR0xuU1BsdHV6UitSWmtXZkRBNTFi?=
 =?utf-8?B?RUp3WkRDTHkyWko5bFQvK3RQUjAwbnR1RDRycXcvU2hRL29idTFXRE42dW9V?=
 =?utf-8?B?K2tBV0hid2ZtVEVOSmp5eVRKVDUrU2kyekpkWDQ0cGtOQitFaGJOaWRxeXNY?=
 =?utf-8?B?NHNPQWpKWHZjMlZoZzJ5MVQyb215K1dwaHdyT1pZaVZvWVJKS29GS3lPOWZE?=
 =?utf-8?B?c2lnNkdjT0FEb0RTQXdjNHlLVUFCTE9rR21CcENkTkcxZG5sZ3JPVE9kWnoz?=
 =?utf-8?B?NENzSmFkWExBTzRMNFpHaFMwdnhqRzZITmV5cG10TE5hdjhwMS9BMG5SZldo?=
 =?utf-8?B?MFpDaHFsYnJTdjdDRUNHVjY2YW9xRnlUaXdHVWZBVk5SZmhseERCb292LzVy?=
 =?utf-8?B?Y244REdMS3hOZXRRTkl0VHNvUUk4V2dhaXdFUEtDMWdUUVlXRk56aXJkc3Y5?=
 =?utf-8?B?aXdUNGNPZzljZThzdE5aTlhTS2h5QkNWUlUzaVV6ek1VR2VDb0tWSzFKaDJN?=
 =?utf-8?B?VTk1ZUlFMmpEdmtTcnZxd3JyZkpYUkdUUElDamUxd25VM0k4a2FnU0xHNVlL?=
 =?utf-8?B?OWlTRm5IN2Foano5QVhGejNNSU8zMnNQQmhQc2NBaG5WQzliSk1tdXZnVGJQ?=
 =?utf-8?B?M09iWUcxUTBEcnFtV1QrSDdZR0Irc2p5ZUtEaDZZY2VhTW9WZzVpR2F0dStK?=
 =?utf-8?B?SGh0V1ZXQjd4WFV5TVZCcXRrd01PTjBMZjQ0cUJaUllkeGxsdjliOEpya2I4?=
 =?utf-8?B?MFJxbXN3SCtoREpFQ1BpdGsvTGpiMDhWL21PN1FLY2dhaDdsVC92OTgwaFRF?=
 =?utf-8?B?ekJkS3lMQk1oaWQ0QmpGZzBXYWREcmE0RkJBUEdMdzVDWWhXN0ZXU05Cb2NZ?=
 =?utf-8?B?dFJpZ2FZZVVwRE1PZ0ZnTmxyNEsxNEszNFJyZiszRStyKzlZMk9HVUwzSE1B?=
 =?utf-8?B?Q0VPQ1dISWJKM2YxNUNHa2FHME9oazlyWFZqdmFlWFNtWkVvSkZwTWZNU2lo?=
 =?utf-8?B?OGFMMncwUVNySzBrcklzU0JLemlNMW83aXVWZ091bzBTQVFzNTJtcmxObEF4?=
 =?utf-8?B?cUh0SW5ydnJmOHdFYXFNRVhISTZMZko2Y0E5TUZ2VEVOTUQ1U2ZpNXNFZ2Jy?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBD37550B4969042B6985C0C7F01CF7D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d6d8ca-f412-495d-5473-08dbfd8fc8af
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 17:03:39.2072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: im54/II89+ME/WFcnUsA1Yro+5zCathUlvqdfo5nR86A/Wqlebj+Bs7pCllzX5GDlSqROsJE032YQIm3g4369A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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

T24gRnJpLCAyMDIzLTEyLTE1IGF0IDE1OjQ1ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IFRoaXMgaXMgYSBjb21iaW5lZCBzdWJtaXNzaW9uIG9mIHNlcmllcyB3aGljaCBoYXZlIGJl
ZW4gc2VudCBhbmQNCj4gcmV2aWV3ZWQgc2VwYXJhdGVseToNCj4gDQo+IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI3MzY1Lw0KPiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNzQ0MC8NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy8xMjc1OTMvDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTI3NTk4Lw0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzEyNzc2NC8NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xMjc3ODAvDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTI3
NDk1Lw0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNzg2NS8N
Cj4gDQo+IEFzaHV0b3NoIERpeGl0ICgxKToNCj4gICBkcm0veGUvcG11OiBSZW1vdmUgUE1VIGZy
b20gWGUgdGlsbCB1YXBpIGlzIGZpbmFsaXplZA0KPiANCj4gQm9tbXUgS3Jpc2huYWlhaCAoMik6
DQo+ICAgZHJtL3hlL3VhcGk6IGFkZCBleGVjX3F1ZXVlX2lkIG1lbWJlciB0byBkcm1feGVfd2Fp
dF91c2VyX2ZlbmNlDQo+ICAgICBzdHJ1Y3R1cmUNCj4gICBkcm0veGUvdWFwaTogUmV0dXJuIGNv
cnJlY3QgZXJyb3IgY29kZSBmb3IgeGVfd2FpdF91c2VyX2ZlbmNlX2lvY3RsDQo+IA0KPiBGcmFu
Y29pcyBEdWdhc3QgKDEyKToNCj4gICBkcm0veGUvdWFwaTogUmVtb3ZlIERSTV9JT0NUTF9YRV9F
WEVDX1FVRVVFX1NFVF9QUk9QRVJUWQ0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUgRFJNX1hFX1VG
RU5DRV9XQUlUX01BU0tfKg0KPiAgIGRybS94ZS91YXBpOiBBZGQgYSBjb21tZW50IHRvIGVhY2gg
c3RydWN0DQo+ICAgZHJtL3hlL3VhcGk6IEFkZCBtaXNzaW5nIGRvY3VtZW50YXRpb24gZm9yIHN0
cnVjdCBtZW1iZXJzDQo+ICAgZHJtL3hlL3VhcGk6IERvY3VtZW50IHVzZSBvZiBzaXplIGluIGRy
bV94ZV9kZXZpY2VfcXVlcnkNCj4gICBkcm0veGUvdWFwaTogRG9jdW1lbnQgZHJtX3hlX3F1ZXJ5
X2NvbmZpZyBrZXlzDQo+ICAgZHJtL3hlL3VhcGk6IERvY3VtZW50IERSTV9YRV9ERVZJQ0VfUVVF
UllfSFdDT05GSUcNCj4gICBkcm0veGUvdWFwaTogTWFrZSBjb25zdGFudCBjb21tZW50cyB2aXNp
YmxlIGluIGtlcm5lbCBkb2MNCj4gICBkcm0veGUvdWFwaTogQWRkIGJsb2NrIGRpYWdyYW0gb2Yg
YSBkZXZpY2UNCj4gICBkcm0veGUvdWFwaTogQWRkIGV4YW1wbGVzIG9mIHVzZXIgc3BhY2UgY29k
ZQ0KPiAgIGRybS94ZS91YXBpOiBNb3ZlIENQVV9DQUNISU5HIGRlZmluZXMgYmVmb3JlIGRvYw0K
PiAgIGRybS94ZS91YXBpOiBNb3ZlIERSTV9YRV9BQ0NfR1JBTlVMQVJJVFlfKiB3aGVyZSB0aGV5
IGFyZSB1c2VkDQo+IA0KPiBNYXR0aGV3IEJyb3N0ICgxKToNCj4gICBkcm0veGUvdWFwaTogUmVt
b3ZlIHN5bmMgYmluZHMNCj4gDQo+IFJvZHJpZ28gVml2aSAoNSk6DQo+ICAgZHJtL3hlL3VhcGk6
IEVuc3VyZSBldmVyeSB1YXBpIHN0cnVjdCBoYXMgZHJtX3hlIHByZWZpeA0KPiAgIGRybS94ZS91
YXBpOiBPcmRlciBzZWN0aW9ucw0KPiAgIGRybS94ZS91YXBpOiBNb3JlIHVBUEkgZG9jdW1lbnRh
dGlvbiBhZGRpdGlvbnMgYW5kIGNvc21ldGljIHVwZGF0ZXMNCj4gICBkcm0veGUvdWFwaTogRG9j
dW1lbnQgdGhlIG1lbW9yeV9yZWdpb24gYml0bWFzaw0KPiAgIGRybS94ZS91YXBpOiBSZW1vdmUg
cmVzZXQgdWV2ZW50IGZvciBub3cNCg0KTG9va3MgZ29vZCwgYWNrZWQgZnJvbSBNZXNhIHNpZGUu
DQoNCkFja2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCg0KDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICB8
ICAgMiAtDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmggICAgIHwgICA1
IC0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9kbWFfYnVmLmMgICAgfCAgIDIgKw0K
PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgICAgICB8ICAgMiAtDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggICAgIHwgICA0IC0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMgICAgICAgfCAgIDkgKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmggfCAgIDQgKy0NCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9leGVjbGlzdC5jICAgICAgICAgfCAgIDcgKw0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d0LmMgICAgICAgICAgICAgICB8ICAyMCAtDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3N1Ym1pdC5jICAgICAgIHwgIDEwICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
b2R1bGUuYyAgICAgICAgICAgfCAgIDUgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BtdS5j
ICAgICAgICAgICAgICB8IDY0NSAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wbXUuaCAgICAgICAgICAgICAgfCAgMjUgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BtdV90eXBlcy5oICAgICAgICB8ICA2OCAtLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3F1ZXJ5LmMgICAgICAgICAgICB8ICAxOSArDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0u
YyAgICAgICAgICAgICAgIHwgIDc1ICstLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX3R5
cGVzLmggICAgICAgICB8ICAxMyArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNl
cl9mZW5jZS5jICB8ICA5MSArLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAg
ICAgICAgICAgfCA4MjAgKysrKysrKysrKysrKystLS0tLS0tLS0NCj4gIDE5IGZpbGVzIGNoYW5n
ZWQsIDYwMSBpbnNlcnRpb25zKCspLCAxMjI1IGRlbGV0aW9ucygtKQ0KPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbXUuYw0KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbXUuaA0KPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wbXVfdHlwZXMuaA0KPiANCg0K
