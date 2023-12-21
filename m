Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA232C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 13:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FB510E6CD;
	Thu, 21 Dec 2023 13:17:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6186210E6CD
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703164639; x=1734700639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1OGf0pcMffxK/nD7HnZ9++AKTy4mCUEd51+FrzcSO5g=;
 b=QSEhmbfRRuUvKJpgnqXf8UEPDyrtlM5jesmaUcrkV7PAYChTQEUpRrxL
 IiJKMYHJc3TYQ5aLXbuEgiVmGnE9LkRwcYSXgde9oNvndCaM8H6/qXySa
 5uYQPDZY/U6uLUW+nW1SFwWM2Zs5dxU6MtDkhBuAGKUodljFxNxSdCoZm
 ImnwFkK0K+z/Mp0uJMxSSn6Unzfmv1L4vUPB8aMGMxAcQZzi60ppqkxF7
 A+cJ4Se8h0Gzo8mNTA2E/iILdl6OjxNpjTlBnfEDalscEvP+LHoQeoqSZ
 fdeYubCcv2Y+saxn07NcHHlU8yJ84iAHaDhsqgCPM6Ti30NOOc586XZ5V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="482153902"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="482153902"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 05:17:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="847111048"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="847111048"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 05:17:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 05:17:18 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 05:17:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 05:17:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLPhZUMWYf5FLv8/5Yike//t3hJShrqHe/1S4O1zgjohA/1vo9ZT4jgofIpB1IqHFad9gYFe/L1wRDlH+HyYOy21/cfNkEH6SAADhi92Wr7giaCyGCmPMLtTGINxh89rto6oJlnn8WwU+K4byz7QhAk9slIR+WnqZCyNIho28h5hZYQqIr2r2l1uBz2LKJfXvHkqIEtyIc+tTqXdR7cYWgdRorpmUlDorkn0dfoOAjiZmjcwOO0GjxBOe7KawyOocVYSAmbgl4xrNT7GjfdhcMtKm1y7MfxQUBy79HvzGcABrCTBh4kZFhdqln2cbm1ZX7O/DfuqOlq+6T/qfC8y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OGf0pcMffxK/nD7HnZ9++AKTy4mCUEd51+FrzcSO5g=;
 b=eIBIkCHkg+WnPMsh4dUF8r1PNb3mSMiH5OwwXOZDyTmdm6x9gCE2dgIWFriJhXoT/hNqL0JrOyFroBvYROrCx7lB6IJTZJD1stvVgegkf/iEMbzsSRQByleU09Kxj7AwFdULZ075i6qpArSGu2Vn0xnjnllY3R4o99PHPLnYDTYqgX8EUBxYUZlXZ50Gxt3D1aQ2VJXM4+ivUXmv4FNG3olEo8WM43MdixHbv+cdkkzpM9LcbkELP4jmvdJEiAyCqz6W9Mcx2gl7g5Y6bMAHs8fecMn8UJnShBbyu9AhHgP71pycEgwn5B23BqcqbdlvOeNersMOtsAujkJ0A5N8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Thu, 21 Dec
 2023 13:17:16 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 13:17:15 +0000
From: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 0/8] Engine Busyness
Thread-Topic: [PATCH v2 0/8] Engine Busyness
Thread-Index: AQHaKQv+VAwnlTnep0u/KZKl10cKy7Cd5giAgAmjQ4CAAO2TAIAIvecAgAC/HgCAAHS9gIABJ6+AgAA9obs=
Date: Thu, 21 Dec 2023 13:17:15 +0000
Message-ID: <B7964DAC-797C-4E73-9140-A1DEE800389B@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
 <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
 <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
 <b1573816-c1f6-4958-8171-d5c43a3d2766@linux.intel.com>
 <ZYN/mkkRT+oFJLSo@unerlige-ril>
 <ebcec5e0-236c-4cd9-b676-d7ca7d46cb10@linux.intel.com>
In-Reply-To: <ebcec5e0-236c-4cd9-b676-d7ca7d46cb10@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2987:EE_|CH3PR11MB8441:EE_
x-ms-office365-filtering-correlation-id: 8a521973-fe72-496c-aca0-08dc022726a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fbTM3i7Y1fAJy58QTBxvSlFAYR3j6aCYBiGhYHwsZHe/PUm2NdLBFRpyKiMqWYA/37gfXozcWVU+jmu32RlfCAVRoi4uK/AST7FH/BAN4bk3a3YBrvvDeZYW3KJJzsraRiYlEruWUcOBGciNQAzKHy9pzmeVZHdN6E0AreaaCKkCUi+okf3fGpneVut8AlSvOSskRVkOU4YXEaBLxF3hAGv5L28mougbm6Z+e+NdneYX03tqm6YbEh9utYTnCeCheUaHiUKYmLTeFHpAkb1kupiIgQLfsh5CcFelQ1QYFnoPZQEnr/rVeWdPILzsL7NsEx4X4bDwFW/d4Nxz1aKNKDpVTw2PvoP9P81WPm9wcdv3IoSEhKa8fopbkdbR7/gZ8Fri7Cl9BAMv/LHl7kMd9qbGqu2AskXt5fPOf4UHd54484N91S9IKxpPp1j7hDc8ttp4CKRixUaIHnB4SyCY0Xq6PUpMi5NZt7vqQU0mlK3x1MEZNgsRHS9U27TaVJW7wUnT+6CUOWPCe+xRvZRA3V02oWjX3etEaTzrCX4MTpF8HoY991xpCtVqkl2rpBE1BaU+VX9PLnYkPaEksoZUll9a+nMsWHy99wtzMdpQRjkg9YaEFKNXBg72Dd+dlrO2QmZvI0r4pQhs8Hxvxtbtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(2906002)(86362001)(122000001)(82960400001)(41300700001)(38100700002)(66946007)(66556008)(33656002)(76116006)(64756008)(66446008)(66476007)(2616005)(54906003)(6916009)(26005)(316002)(71200400001)(53546011)(36756003)(6512007)(6506007)(6486002)(478600001)(8936002)(38070700009)(8676002)(83380400001)(4326008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1VvMDBlL0FhUjF5QVBEY0pIazdEWjhxcUNEaTRVRktOaWVOSGU2eTZaTjBh?=
 =?utf-8?B?bWVSaGVLZjJvU3h0b0VLZERmNnpqTGh1M0x1Zi9ORTdmWkJkOTQzMGRpTmx0?=
 =?utf-8?B?OGJ5SDVESTAycHl5djBReGcwU0dHb2NyYlQxQmkvNEIrZG5zNms3eTIrZE9r?=
 =?utf-8?B?TFViUFNpRlBvMVFFSzVab2ZSTUhiOUJEcTc4REI1Kyt4cmxlbDhuVG9Rei9D?=
 =?utf-8?B?blRTcmh0cmRHWnVxRTRDSG16cUNFMmxrY0RPSXkvOThuNkNtVTlOVlNkM0tY?=
 =?utf-8?B?SUN4MG8yeXV3VGpCN2REQmNPTDlqUkZUeVQxUzF5dmJHczRrMGFvSFdQbXFQ?=
 =?utf-8?B?NXJWbFNlWndDdHFwWVdyMG9zU2gxVm4rMVVGNWtTS2hXNWZnWmhnZ0gvYmlW?=
 =?utf-8?B?U1JLa2Jkb2U0Z1hBWExzVDV4RFpKck5kRWYrZGtEVjNKcXhzQ0xFN2JNMTh5?=
 =?utf-8?B?NFJleUMzcnpVQUFnMnczMGhHVmozaGZsYUtDVWFmSW5ucUNqN3lFZWZ2ZXZC?=
 =?utf-8?B?d0VzdmFBRStrSUYxcGJCWGlQQW5wZnU1N0o2aXAwYkJNRnNkTzF0WnAzUlNH?=
 =?utf-8?B?QnpJc1hwOVpwU2t3L05EQitXUCs5U1pqKzBsWnpYaUsxSWtlR0ZONmJmWHQ2?=
 =?utf-8?B?L2NuNFNuSzBRT2p5eHFBWHRRdGpYMnMzMFQxQytURm54aGxmNGFvZFlNcDhu?=
 =?utf-8?B?TnBVM3dZWmVQaFoydVUzMTBJRGszTjNoMkRHdjEwMGRzZUYvNnBPeXA5K2x4?=
 =?utf-8?B?MXp4V1hjaDkxMWlURWJTMldKbXNaMFdsUGg1ZnpUMGF5eTBJR1daQXQ5ZS9w?=
 =?utf-8?B?d0Z3U01pZlV1V1BNT29GNkw4dEU2VlNRQyszUDRoNmFpeWZhVVVQRWJYSUVy?=
 =?utf-8?B?eGdUYXQ0azE2TmZDN0VEbG1BYzhuWHI1b29vd2tTR0xGcTF1NEVXY2JsWmNR?=
 =?utf-8?B?REhjam91MHRhODd4OEZJS0JobktUMEhHZ2pJL0lZclRPSDBBV1lmWlJWcCs4?=
 =?utf-8?B?eTl6M04xSjEza1hMOS9tdzdqT0RGWEdoNG5LRUpzWUNaYW9uQWdaanliaFpn?=
 =?utf-8?B?UEVBMzVSZndDMStaUmgrM0NQL0ZrZHlnQ29zY0FVc1hnaTluVnJtbzVLazlv?=
 =?utf-8?B?bVZUVmQzVkxmTzJCaWlVYy9HcXVKb1dOb1REMEJPYVp3RFdERk14WWJxbmxW?=
 =?utf-8?B?U0MyUmN3KzlOMEhGdXVldnVIbHovOEUwZGVvMlR5NS9uQm4zSURiOEdZbVlC?=
 =?utf-8?B?WnVsWlI2MSthNDFyNFMrVjhWZkNNNk5JdHl5elFQK0xJamd1UUY1eGpETCty?=
 =?utf-8?B?MlAxMkRrUDV2ekpodmRPSDI2MW5FeDc1UHFWQW1OaEtUR1h2R003Z0VQakZw?=
 =?utf-8?B?L3NCQ0dNb1dxRkZ0dTVDUHJ0c0pFbW1MazM5K1hUUDRwc09QYkc1OUhGWU0x?=
 =?utf-8?B?aXJraVI2Z1FkQkROMElTWmludlJKMk85cUYzb0U1dnY0QW50c1RzTkFhb2RR?=
 =?utf-8?B?cW15ZGVFdTVCRkhybTlPZEJMd3Q1K1N5NFJvcy81Q0R1WllZZ05jeHdSNXNR?=
 =?utf-8?B?MEtYU1J4eHY0YUNCby9ZeWNKMEpoTE90VmpyRDJMNzJYVkk5akFlTHFjbTJG?=
 =?utf-8?B?QXlvQUVadExTcVphTDVabTJxR1hsOU5tREJXNEJUVFJKeDRlWHFHMG1tQ05r?=
 =?utf-8?B?ZlVqd1B6WHdvUVhDejl6SmpqQkF5NGhpcFNXME1JMGhMRVd6dWx3YmhRcU1I?=
 =?utf-8?B?cHZvazBydHJQb2dEdGxUcVEwTS9pTnA2bFNRV1JyTERSSFJNRDk4cm0zMUtC?=
 =?utf-8?B?T25WMTJMZlhvUXMzL293U2Q1ZnR1eVNUd004VS9WMHBFaUV5MkdwNE44SDJt?=
 =?utf-8?B?UFFOVzJPaHg4cWhKbVlxL2NRSFR0VDF5SFpjYjB5R1gwWTBMbUxLNkRYNk82?=
 =?utf-8?B?TVB3QWpyWlYwZlMvYTJlREFiWjl5Mm9xcnlRNHNZZXFGR0hiWllqcUpEMXpt?=
 =?utf-8?B?NGN1Tk1ha3hjaXVlRGR0RU1BMDdiOXQ5c0JZbW1xaVpaWEs2VlNOUHY5UjB3?=
 =?utf-8?B?Vyt6WGIvMnNORHBSWVp3SWhKMHc2UGpCUXdaNERWcG9ISkJIc3RoY2VULzBn?=
 =?utf-8?B?cTlFTXpISzlsOWtEZE9xUTl4VkpQYWlwUkFSSm5aeVU3MjU1L20vN3A4TU5U?=
 =?utf-8?Q?Z/5fDgXGh8YFIqPCYXeEpGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a521973-fe72-496c-aca0-08dc022726a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 13:17:15.5162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UR+qGiDO/C3rqoTjKHPz8AyJ2j/6FXm+61F9Stjhub7rVFXpnppL9ZR4a7qJeHEjV7ulgt6t0U8zcABDt+4N8E8hem7WnEy62c8iT+KzOcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQpTZW50IGZyb20gbXkgaVBob25lDQoNCj4gT24gRGVjIDIxLCAyMDIzLCBhdCAxOjM24oCvQU0s
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
PiANCj4g77u/DQo+PiBPbiAyMC8xMi8yMDIzIDIzOjU4LCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+Pj4gT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMDk6MDA6MzRBTSArMDAwMCwgVHZy
dGtvIFVyc3VsaW4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMjAvMTIvMjAyMyAwNTozNiwgVW1lc2gg
TmVybGlnZSBSYW1hcHBhIHdyb3RlOg0KPj4+PiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCAwODow
Njo0NkFNICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gMTQv
MTIvMjAyMyAwMTo1NiwgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3RlOg0KPj4+Pj4+IE9uIFRo
dSwgRGVjIDA3LCAyMDIzIGF0IDAyOjQ1OjQ3UE0gKzAwMDAsIFR2cnRrbyBVcnN1bGluIHdyb3Rl
Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gSGksDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBPbiAwNy8xMi8yMDIz
IDEyOjU3LCBSaWFuYSBUYXVybyB3cm90ZToNCj4+Pj4+Pj4+IEd1QyBwcm92aWRlcyBlbmdpbmUg
YnVzeW5lc3MgdGlja3MgYXMgYSA2NCBiaXQgY291bnRlciB3aGljaCBjb3VudA0KPj4+Pj4+Pj4g
YXMgY2xvY2sgdGlja3MuIFRoZXNlIGNvdW50ZXJzIGFyZSBtYWludGFpbmVkIGluIGENCj4+Pj4+
Pj4+IHNoYXJlZCBtZW1vcnkgYnVmZmVyIGFuZCBpbnRlcm5hbGx5IHVwZGF0ZWQgb24gYSBjb250
aW51b3VzIGJhc2lzLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBHdUMgYWxzbyBwcm92aWRlcyBhIHBl
cmlvZGljYWxseSB0b3RhbCBhY3RpdmUgdGlja3MgdGhhdCBHVCBoYXMgYmVlbg0KPj4+Pj4+Pj4g
YWN0aXZlIGZvci4gVGhpcyBjb3VudGVyIGlzIGV4cG9zZWQgdG8gdGhlIHVzZXIgc3VjaCB0aGF0
IGJ1c3luZXNzIGNhbg0KPj4+Pj4+Pj4gYmUgY2FsY3VsYXRlZCBhcyBhIHBlcmNlbnRhZ2UgdXNp
bmcNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gYnVzeW5lc3MgJSA9IChlbmdpbmUgYWN0aXZlIHRpY2tz
L3RvdGFsIGFjdGl2ZSB0aWNrcykgKiAxMDAuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJIHRoaW5rIEkn
dmUgYXNrZWQgdGhpcyBiZWZvcmUgYnV0IGRvbid0IHJlbWVtYmVyIGl0IHdhcyBjbGFyaWZpZWQg
LSB3aGF0IGFyZSB0aGUgc2VtYW50aWNzIG9mICJhY3RpdmUiIHdpdGggdG90YWwgYWN0aXZlIHRp
Y2tzPyBJbiBvdGhlciB3b3JkcyBjb25zaWRlcmluZyBhY3Rpdml0eSB0aW1lbGluZXMgbGlrZToN
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IDEpDQo+Pj4+Pj4+ICAgICAwICAgICAgICAgIDFzDQo+Pj4+Pj4+
IHJjczAgfHh4eHh4LS0tLS18DQo+Pj4+Pj4+IGJjczAgfC0tLS0teHh4eHh8DQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiAyKQ0KPj4+Pj4+PiAgICAgMCAgICAgICAgICAxcw0KPj4+Pj4+PiByY3MwIHx4eHh4
eC0tLS0tfA0KPj4+Pj4+PiBiY3MwIHx4eHh4eC0tLS0tfA0KPj4+Pj4+PiANCj4+Pj4+Pj4gQXNz
dW1pbmcgMXMgc2FtcGxpbmcsIHdvdWxkIHRoZSBhYm92ZSBmb3JtdWxhIGNvcnJlY3RseSBzYXkg
NTAlIGZvciBib3RoIGVuZ2luZXMgaW4gYm90aCBjYXNlcz8NCj4+Pj4+PiANCj4+Pj4+PiBZZXMu
IFdoYXQgaXMgdGhlIHNpZ25pZmljYW5jZSBvZiBjYXNlIDI/IEFyZSB5b3Ugc2F5aW5nIHJjcyBh
bmQgYmNzIGFyZSBleGVjdXRpbmcgaW4gcGFyYWxsZWw/DQo+Pj4+PiANCj4+Pj4+IEluIHBhcmFs
bGVsIHllcy4gQ29tcGxldGUgb3ZlcmxhcCwgbm8gb3ZlcmxhcCwgb3IgYW55IG92ZXJsYXAgb2Yg
YWN0aXZpdHkgaW4gYmV0d2VlbiB0aGUgdHdvLg0KPj4+PiANCj4+Pj4gR3VDIGFjY3VtdWxhdGVz
IHRoaXMgb24gY29udGV4dCBzd2l0Y2hlcywgc28gdGhlIG92ZXJsYXAgZG9lcyBub3QgbWF0dGVy
Lg0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4+IEVpdGhlciB3YXlzLCB3aGVuIHRvdGFsIGFjdGl2ZSB0
aWNrcyBpcyBxdWVyaWVkIGl0IHdvdWxkIHByb3ZpZGUgdGhlIGxhdGVzdCB2YWx1ZSBvZiB0aGUg
YWN0aXZlIHRpbWUgKGRvZXMgbm90IGRlcGVuZCBvbiBndCBwYXJrL3VucGFyayBzaW5jZSB0aGUg
dmFsdWUgaXMgZWl0aGVyIG9idGFpbmVkIG9uIGRlbWFuZCBmcm9tIEd1QyBvciBpcyBhIHZhbHVl
IHRoYXQgaXMgZnJlcXVlbnRseSB1cGRhdGVkIGJ5IEd1Qy4NCj4+Pj4+PiANCj4+Pj4+PiBUaGUg
ZHVyYXRpb24gb2YgY29udGV4dCAoaW4gdG8gb3V0KSBpcyBhY2N1bXVsYXRlZCBmb3IgdGhlIGVh
Y2ggZW5naW5lLg0KPj4+Pj4gDQo+Pj4+PiBCdXQgd2h5IGlzIHRoZSB0b3RhbCAqYWN0aXZlKiB0
aWNrIG1vdmluZyBkdXJpbmcgdGhlIDAuNXMgLSAxcyB0aW1lIG9mIHRoZSAybmQgZGlhZ3JhbSB0
aG91Z2g/IFdoYXQgZG9lcyBpdCBtZWFuIGJ5ICJhY3RpdmUiIGlmIG5vdGhpbmcgd2FzIGFjdGl2
ZSBkdXJpbmcgdGhhdCBwZXJpb2Q/DQo+Pj4+IA0KPj4+PiBWRiB3YXMgc3RpbGwgdXNpbmcgaXQn
cyBhbGxvdHRlZCB0aW1lIGFuZCBoZW5jZSB3YXMgYWN0aXZlLg0KPj4+IA0KPj4+IEFuZCBpZiB3
ZSBsZWF2ZSBTUi1JT1Ygb3V0IGZvciBhIG1vbWVudD8NCj4+IFRoZW4gaXQgaXMganVzdCBhIHBl
cmlvZGljYWxseSBzYW1wbGVkIChieSBHdUMpIHZhbHVlIG9mIEdUIHRpY2tzLiBUaGUgcGVyaW9k
IGJlaW5nIDEwMG1zLg0KPj4+IA0KPj4+ICJHdUMgYWxzbyBwcm92aWRlcyBhIHBlcmlvZGljYWxs
eSB0b3RhbCBhY3RpdmUgdGlja3MgdGhhdCBHVCBoYXMgYmVlbiBhY3RpdmUgZm9yLiINCj4+PiAN
Cj4+PiBIb3cgbWFueSB0aW1lIHdvcnRoIG9mIHRvdGFsIEdUIGFjdGl2ZSB0aWNrcyBkb2VzIEd1
QyByZXBvcnQgaW4gZGlhZ3JhbSAyIGFib3ZlPw0KPj4gRXZlcnkgMTAwbXMgd2Ugd291bGQgc2Vl
IGFuIHVwZGF0ZWQgdmFsdWUuIEZvciB0aGUgZHVyYXRpb24gb2YgMC41cywgaXQgd291bGQgYmUg
NTAwbXMuIFNhbXBsZWQgYXQgMXMsIGl0IHdpbGwgYmUgMTAwMG1zLiBVbnRpbCAwLjVzIGl0IHNo
b3VsZCBiZSAxMDAlIGJ1c3luZXNzIGJ1dCB0aGVyZSBpcyBhbiBlcnJvciBtYXJnaW4gb2YgMTAw
bXMuIEZyb20gdGhlbiBvbiwgdGhlIGJ1c3luZXNzICUgd2lsbCBkZWNyZWFzZSBhcyB0aW1lIHBy
b2dyZXNzZXMuIFRoZSBlcnJvciBtYXJnaW4gaXMgbW9yZSBwcm9ub3VuY2VkIGZvciB2ZXJ5IHNo
b3J0IHdvcmtsb2Fkcywgc28gSUdUcyB3ZXJlIGNoYW5nZWQgdG8gdXNlIDJzIGJhdGNoIGR1cmF0
aW9ucyByYXRoZXIgdGhhbiA1MDBtcy4gSGF2ZW4ndCBjaGVja2VkIGlmIElHVHMgaGF2ZSBiZWVu
IHBvc3RlZCB5ZXQgdGhvdWdoLg0KPiANCj4gU29ycnkgc29tZWhvdyBpdCBpcyBzdGlsbCBub3Qg
Y2xlYXIgdG8gbWUuIDopDQo+IA0KPiBHdUMgdXBkYXRlcyB0aGUgR1QgdG90YWwgYWN0aXZlIHRp
Y2tzIF9jb25zdGFudGx5Xz8gV2l0aCBhIDEwMG1zIHNhbXBsaW5nIHNvIGxpa2U6DQo+IA0KPiBh
KQ0KPiANCj4gd2hpbGUgKHRydWUpDQo+ICAgaWYgKGd0X2FjdGl2ZSkNCj4gICAgICBndF90b3Rh
bF9hY3RpdmUgKz0gMTAwbXMNCj4gICBzbGVlcCgxMDBtcykNCj4gDQo+IE9yIGIpOg0KPiANCj4g
d2hpbGUgKHRydWUpDQo+ICAgZ3RfdG90YWxfYWN0aXZlICs9IDEwMG1zDQo+ICAgc2xlZXAoMTAw
bXMpDQo+IA0KPiANCj4gPw0KPiANCj4gSWYgYSkgdGhlbiBkaWFncmFtIDIpIGFib3ZlIHdvdWxk
IHNob3cgNTAlIHJjczAsIG5vPyAoV2hlbiBzYW1wbGVkIGF0IFQ9MCBhbmQgVD0xcyBhbmQgZGVs
dGFzIGNhbGN1bGF0ZWQuKQ0KPiANCj4gSWYgYikgdGhlbiAiLi4udG90YWwgYWN0aXZlIHRpY2tz
IHRoYXQgR1QgaGFzIGJlZW4gYWN0aXZlIGZvci4iIHVzZXMgYSBkaWZmZXJlbnQgZGVmaW5pdGlv
biBvZiAiR1QgYWN0aXZlIiB0aGFuIEkgYW0gYXNzdW1pbmc/IExpa2Ugbm8gcmVsYXRpb24gdG8g
d2hldGhlciBhbnkgb2YgdGhlIGVuZ2luZXMgaXMgdXNlZCwganVzdCB0aGUgZmFjdCBHdUMgaXMg
bG9hZGVkIGFuZCBydW5uaW5nPw0KDQppdCdzIChiKS4gQ29ycmVjdCwgbWF5YmUgdGhlIGNvbW1l
bnQgc2hvdWxkIGJlIGNoYW5nZWQgdG8gcmVmbGVjdCB0aGlzLg0KDQpSZWdhcmRzLA0KVW1lc2gN
Cg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IFR2cnRrbw0KPiANCj4+IFJlZ2FyZHMsDQo+PiBVbWVz
aA0KPj4+IA0KPj4+IFJlZ2FyZHMsDQo+Pj4gDQo+Pj4gVHZydGtvDQo+Pj4gDQo+Pj4+IA0KPj4+
PiBSZWdhcmRzLA0KPj4+PiBVbWVzaA0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4+PiBJIGFtIGFsc28g
Y3VyaW91cyBpZiB0aGVyZSBhcmUgcGxhbnMgdG8gYWRkIHN1cHBvcnQgdG8gaW50ZWxfZ3B1X3Rv
cCBpbiB3aGljaCBjYXNlIHBsZWFzZSBjb3B5IG1lIG9uIHRoZSByZXF1aXJlZCByZWZhY3Rvcmlu
Z3MuDQo+Pj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IENlcnRhaW5seS4gSXQncyBpbiB0aGUgd29y
a3MuDQo+Pj4+PiANCj4+Pj4+IENvb2wuDQo+Pj4+PiANCj4+Pj4+IFJlZ2FyZHMsDQo+Pj4+PiAN
Cj4+Pj4+IFR2cnRrbw0K
