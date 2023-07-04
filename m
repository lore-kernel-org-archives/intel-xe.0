Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613DFEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 18:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F26610E30C;
	Tue,  4 Jul 2023 18:19:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D0D10E30C
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688494785; x=1720030785;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=o6aQunnIOEXu1FpuRdH0PaGlL4xbdlJYGKEWznfzQ5k=;
 b=lrzgX0Z6AUaGifaW4cCXgy2x87IuI9fSXH9v4BZof22I0FHcU+MVEYni
 a2qZU/RmDWJRdoTvtw4mDz/poLN9YmhhBppnMZh6FZBSTv+sL0soitryU
 79gzQe+YaTXkZHMCflzhq6Gz1xvB4Bn8IjL6XfdzetX0xnfn+q1w5P/D+
 /ZqJVipKCebY5CeE0LkfkhWWVx7cf+8FAD7lKkNUMTrGswTK8FM1RIuDj
 SdTf7dSo2P+T5LA7y8dV3NTxNqZm8VrPinkc7ikEpxGZGYkM98Lj1QQbn
 MjemVn9k5cz5wqTvIx48pewbwzwO2v6hC/uMn9TaVQkdZNY3iCba00PCj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343506739"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="343506739"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 11:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="712938486"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="712938486"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 04 Jul 2023 11:19:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 11:19:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 11:19:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 11:19:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1qcPww1uauPJbCzj3ykrNERgYY56sfI0uNRvdV/Y+pabvnEdmW3PzAZz6K8olNGOS2aqsEOi+CU15VJpUE8ZKCtnrMAaWUN6pUvMYidLzuRDlltdlS9/0sT+UqAzdhqTzj/n8MFcJnr/aSuCjKPH1wFd5QYmj14OzozkQzYilOZOxs9EHVhucvuUb2vs9X8lYr0vhVKoklbTz59dlrL4sO+vgynHNINeOmW6HIBLOi7M7FUXZOCMtdR3gV8P5xv4qTplkCFCMgRvV8hv+Fm2nAGpbyZIRbP2AM368RFIrVlVC+CN5yeYjnOYoCeH+Wu8B+1dVF1/8s0UPa243F+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6aQunnIOEXu1FpuRdH0PaGlL4xbdlJYGKEWznfzQ5k=;
 b=QBYWJ+tv1Hy3Cb8ifEwPg4DUhWNy92kn6GUGH2yQNdsZ++5Ty55VyMhgZ0mU4YhogCAmip8aD5cVVGY0WcvCvcpcoVsFTOd+EeFGN48MFsT0nbng/kH4+lHjwOEYrUwD8xL3KNnWw/Wh/x1dFiHQzPhG2AG/A51TP2CKU1YC0DDYfa96vvunCqybEbvczc1UT2FsM2TmNi60vFYwwREQ4WkSrFGU+34De//lsVS9gIpwh38QYmuKpJZ5QrHXbCxayvY62/OKAjrDMqRhRp3KtrOB3fCwa0SBXf8bENqg0sVb19No+FmLoM1/JR1IO3cuAeLsf5pzGp5o0jALKCL/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB7727.namprd11.prod.outlook.com (2603:10b6:208:3f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 18:19:39 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 18:19:39 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v3 0/5] Try to handle TLB invalidations from
 CT fast-path
Thread-Index: AQHZrn31mbJE6dlYFUipzh/MXfjGXa+p6zEA
Date: Tue, 4 Jul 2023 18:19:39 +0000
Message-ID: <d899032fae79b3e4a6f1827d0a18746ecb2b5d21.camel@intel.com>
References: <20230704134524.138377-7-matthew.auld@intel.com>
In-Reply-To: <20230704134524.138377-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB7727:EE_
x-ms-office365-filtering-correlation-id: 4734f186-67f8-4fd1-574f-08db7cbb3adf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rAFDTjGI65Svh//vuB1lHOSLncThkuwj1BRzfbPcCoJPA0QguMvP1a0aHWTE/gkgPL0Gr8q3ZRoZgNhQV9mDKBLfIBqAWlOKb4o9aMWTSM9f/RFcQZMP6yAyfbxHdRrD9qN0oT+BC4pW5lvHKL3C/shF1vdaWoBMwAIP8w2qI7xDyJyVyCktjGJ+G8LAHPmpIVRLAtlqlPW4tmYX4fF4m38TXis5urnbH1CzQIuZ3B7yyNDm0+RDJXULfsZjuEbgZt33bPvPp/89osNyEUOwUGUO7LA/e8KX+JLSmdfhsX4mmvy+DpV2AkSleI6LZp5ARpLbvWPFE4ro6TIWufG9nNWhHLf5/7oQg93eD31+6Ke1ReAf5nirmUBj8JnecjIng3ADFn5DeJjit8NQ4x3Ldyl32Ki/saIaIThHpA0X0SgmJujZGCrVYTv4wRLcxDhZa4qmzt+jmXYEiZYwNCMHOfh/NX7ll0BPXvkTiuUZK69q7bZe3Tat/EuiowQQ2blE/7Z8OpRJqJJDIED8N3eY1e9qPZWIj2/kRkH76MVZb4DbefLb9S5Wd5sx8dnHq/8ODWYt9+PvuWuQPhOSVM4dyECqT3DT34SSHjdQImv8lrk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(38100700002)(71200400001)(2906002)(4744005)(6486002)(38070700005)(8936002)(8676002)(110136005)(36756003)(41300700001)(5660300002)(478600001)(6636002)(76116006)(66946007)(64756008)(66556008)(186003)(91956017)(86362001)(6506007)(66446008)(6512007)(66476007)(26005)(316002)(122000001)(2616005)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckJxSGpqY0ZCNm50OTRldW5JRXFyY3Z0S0tpTzBRSXUxY01qaGdQU3FLZzF5?=
 =?utf-8?B?M3JOUU1yYk5Ha3dYZ0x1YVY5Z0FqbkVVQVRWMWNGN0l2TTVMU0FEN2ZyTlpM?=
 =?utf-8?B?YS9OS1d0NFFMaGY5WWplbld6RUN5aDR6ZnZVNEI0bUZOb2p5azBmbXdrV2Ir?=
 =?utf-8?B?UzZoUFhWRldrYXJ5OEkrUzBxbjAzRGpERVBZT1NESmpkRFBnd0JxL0szU2RU?=
 =?utf-8?B?UnJ5elh6Ujh2ZEljU1dvMzllOUFqRDhxTWwxVGZ6eDRlcWptZU45a21wNEIw?=
 =?utf-8?B?SXdXVXpZYUFqV1ROWElKUlJYWHRXTy9pQzlkQ0phOE1XWEI3aEV0UDVscnZr?=
 =?utf-8?B?amVnSzhuNmNyWGY1elpZSlRialFMVFJEK3RndVUyaURheE5yakVSZ2FVK1Na?=
 =?utf-8?B?eXNKWS9MZGgrYThrZGJNVU5mMkJKcC82bUZydkRqR2VIL3pya3Q1bmhtRTJB?=
 =?utf-8?B?RXY5L2htRldmOFZ3QzdlN0szeCsvNzh5TUlrL0VWVG9SZDlWODA5VVh2ZDJi?=
 =?utf-8?B?cnBEL2U2N1lJUi9LUTFCUzJvZUpJVWdmVjhxUlpJekdQTVYxVjlmdTdvOWor?=
 =?utf-8?B?aGpjd28xMlpUQ0dLbTJLQnFWN0dUck9rMXZnczF6Vk5udWtXbldtYkg4c1Q5?=
 =?utf-8?B?MEpXTEpYY3gwMHZVK1hNdWV2eEtrQ01tVmZwY2xQSWV4d2FCNHVabVl0TVR1?=
 =?utf-8?B?WTBob3hkaEV2Sis4OEtQWVZoYTJrenhzVkIyVkcvcU9NeG9PQnRWUDJFdC9T?=
 =?utf-8?B?V2ZKdGtTMjFWQWJGWFBVY0crczFYbmhpVlUrK1dJbXd1T0NYbUpTYldYTThT?=
 =?utf-8?B?cExWWkFTMVFsY1N2Q1EwaHpNWVRMNHFmVVFtMWNBYzAvdmhDMlllMjlQMU9M?=
 =?utf-8?B?VVpyaXJJZ3F0SjdmK1Y5eW1YR1gzOHRRVHRid1RMU09HSFRONFhPRlNIVlNV?=
 =?utf-8?B?ZktVajNZM3BYOHJnQ2xUM2RYei9kYnZyQ2ZwZlQ0czhaV081WUtvZGc1WTB3?=
 =?utf-8?B?OEI1MEl5aTdVb2Y4MFpaTTZjN1NjTGI3VjRwUVJ4dkI1cXFCMFJXcmp1R25z?=
 =?utf-8?B?UHJyZjYyeHNDek12NWMwMkNzaGp6UEFrWWhSV204U1FRZWRQa0wwczgxK2NO?=
 =?utf-8?B?N09tQ0FDazJzbU5zcy9sYVJpUDVUTzJCeWtZMW1YUlNOYzJWWDJ6WlFCeWZ2?=
 =?utf-8?B?UTZYZzAyQVZoL2xJekF5SVBUS3VpWmtmSWpXdEdsbkQwa0ZYSUsvWUhvMjJN?=
 =?utf-8?B?Tzd0Y0JDSkhTc2ZtREd4dkpwOUliVzVPNmZTeUZEdFl1QUhkYjZUdDZoeS8r?=
 =?utf-8?B?WWtzaWIybFpIVE1LUDJnSHBKMktGMmlqTU1qM1QvQUtxeXphb2FlQldIR24v?=
 =?utf-8?B?dHhoczFyQXRacmJUdUJNUEZ2MmVqb3lRbS9YYThFZWZpc1RZSForWit0WXRI?=
 =?utf-8?B?eWFycmViaVJMMk5vVGdtMGJpU3UvY3hWTHVZRXNoRXVlWDRhZk0xNmpQRFpN?=
 =?utf-8?B?TUdvamxvQm9qRjlCTWZDdFR5QVFDWnk2RTVKUk1lRkpzWUxwUHRiOERxaU5I?=
 =?utf-8?B?enhTSDJWbWpCb0oxU3E2cEs1Z3RGNUJGeVBGN29DOWlmcjBmUnVmbXpRZVQy?=
 =?utf-8?B?M0tUVFRTQWRBV2ZqVzBTc2FiK2JDMUxwbEZuZXNCRkwzRmQ4S2Fxa0RRbURS?=
 =?utf-8?B?NjQrOUxtdnVyZDFuTlArZm8yK0I4TWtidnhUUFB4NU5UbzBQdUsrbjhNMFdy?=
 =?utf-8?B?MnNjZFhuUzdadWdsajFMWjZNWnAxVGcvbTJiR1VHcmFPZ2g5aDllNTl6akFZ?=
 =?utf-8?B?QW1wVS9HMEVTQzlOcWh2VVZXQjE0YnZvdXFKM1lvVVRWUG9lRUZsY0RxZlRp?=
 =?utf-8?B?STk0bGxzMk4rRndqRUtQV2lzMlpEMTk4dEM3TEtWcXh3UjdVUFFmaWJnM3Uy?=
 =?utf-8?B?b2o0VFpiVWR3TmcyeDR0THA0NXZFcHJQRUx6d1lYdnV2SFJEdVlDYXBBeXpW?=
 =?utf-8?B?VkE1dE9mMW5hdHFNQVRkOU8yMkd6OWw1c0hGcjQ3RVJ4N1Bxc2NWdEdkYWMv?=
 =?utf-8?B?T3c0Yi9GMkhFUVpxdVYzRHYxc2pZc3pBMFhlSlJBSG95a0kyS3BoS1c1YUxH?=
 =?utf-8?B?VnBQS0hzYlRFdVJ5OUY2MWVpZkNGRHlQUU5Rd3JWaXBNSnRkanBFdy9ManlU?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B550C24FFCA9C84D87D2AA37A88F146A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4734f186-67f8-4fd1-574f-08db7cbb3adf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 18:19:39.1445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnmgGGWQ5tSoW87EyL+cYAhiumf1g399Tsf8gaBQqPOw6iu06vMo99QWPx3Van2YOVU+fUAYF0MPbTTW/YC1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7727
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/5] Try to handle TLB invalidations from
 CT fast-path
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

T24gVHVlLCAyMDIzLTA3LTA0IGF0IDE0OjQ1ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEluIHZhcmlvdXMgdGVzdCBjYXNlcyBhbmQgd29ya2xvYWRzIHRoYXQgcHV0IHRoZSBzeXN0ZW0g
dW5kZXIgYSBoZWF2eSBsb2FkLCB3ZQ0KPiBjYW4gc29tZXRpbWVzIHNlZSBlcnJvcnMgd2l0aCBt
aXNzZWQgVExCIGludmFsaWRhdGlvbnMuIElmIHdlIGhhbmRsZSB0aGUgVExCDQo+IGNvbXBsZXRp
b25zIGRpcmVjdGx5IGZyb20gSVJRIHdlIGNhbiBzZWUgYSBiaWcgaW1wcm92ZW1lbnQuDQo+IA0K
DQpUaGUgX19nMmhfcmVsZWFzZV9zcGFjZSgpIHdhcm5pbmdzIGFyZSBmaXhlZCBpbiB0aGlzIHZl
cnNpb24gYW5kIHNvIGZhciBpdCBpcyBzdGFibGUuDQoNClRlc3RlZC1ieTogSm9zw6kgUm9iZXJ0
byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo=
