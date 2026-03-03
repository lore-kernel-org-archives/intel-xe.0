Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8243EDA6A2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 16:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B810E080;
	Tue,  3 Mar 2026 16:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn/oI5Yz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACFF10E080
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772556832; x=1804092832;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UMojrkrRyaoU2qN6RFWLAmTE6mkAgoowi6BQhQ/BK4w=;
 b=dn/oI5Yz5vbPUiF/bfVsixLyiHTK3K2tcOypTCFoTIRX5+h+euecT+CN
 qR/+1D0rYk/KbM47aItNI5oU1f1+CY6QWbYgHEBWz9u/MnpbuB4SMMQa+
 ul+aFNK7L5pvj1hBgo5WYHu+XA4StjLnOjYvkP4qhom0AqYW5wdscTFCr
 gjC99QA0xongU5s0eNRlbkdKqS1TvABMbPq8wLbJ8k2xVmGcDGgbVYKAb
 pbG0nAUedE+526eY6fhKEEXNh+JJdNt+cxFBk+6hHC9cl9yWBAXbmDcUF
 1rTlFNlr/Twbh/ifbeOzrTd0XLjDDtT/boywPpZGH4Go//hGxPZqEwzX0 Q==;
X-CSE-ConnectionGUID: JQxoeO50QVih61YdBidlVg==
X-CSE-MsgGUID: l7ssqrpDSwiHk3LSrZkAnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84694762"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84694762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:53:51 -0800
X-CSE-ConnectionGUID: udNHA7ngSZy6Wf5VXyRfmw==
X-CSE-MsgGUID: TwNveSD1T7O7V+usvoKmPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218179190"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:53:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 08:53:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 08:53:50 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 08:53:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfo3Zn+OlvSUmvZkCLSSje8bEFgG0KXAG47IeXcY1OrNk7ObtTXDuc0Bdp76WUqYpjocSch40fde7JYL4H9qz1qC1dZE6XvGWfo01Tkv6f4NADi1GdAYBq1KCfOT4g+zDG02dTsS0eurXKSqu0uCSuKbvDE8Tn91GXf+EIol/bwUlx3pDyTID9ciVG3G5fSTJygjx5gBGlu7GJWPiVuvrQHj6Cp5ccoTb0BYDzaer6aB1pgxbXLH0LiR8PJdAkhv+7g3d2vrnsOAmQHXYPbkLcaPVkq0/PpI8vEFLyoY42kOUpvJuyc5MarzzeJuV0dAo6R8kqfxg00eMWQ102wGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMojrkrRyaoU2qN6RFWLAmTE6mkAgoowi6BQhQ/BK4w=;
 b=yWEkY/1pCV0Sm5cPoVNQEDYvslQ7JBOjVYaqFowQWb+gUC6/K59BltrmpjrGlTCjedIGn2RkjbIHqefLai4V8qZMURF/apv31j0kRIYMbqcF7uQFPvAXrwLVM0fZdfirPwrfx4wMYBiGcBoQLOb4X/Nl4qgMbLkJG5YdsaCl3he2vWdeVyoaQI62RV7Hq4YUPXr5NmkR8TeeOLU1fHcIAlZmteJZJfi3lGoy8s4hkW9EGiA9wvi7JVnH0SJFq77ibdi60ycEMetvKkJ6VI4LAGHGgNiMtEd62HbH78JeRvwy6s9JEpoCUGwvV3I3LfzpNdbo6msucvtvMCsqJlemTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:53:41 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 16:53:41 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Topic: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
Thread-Index: AQHcqnEtmc97brNi5U2RgvFIjjvkgLWb2hMAgAD8DACAAC+6EA==
Date: Tue, 3 Mar 2026 16:53:40 +0000
Message-ID: <DM4PR11MB5456C9921D64DCF63901C692EA7FA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
 <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <87o6l5m2yn.fsf@intel.com>
In-Reply-To: <87o6l5m2yn.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|BL3PR11MB6315:EE_
x-ms-office365-filtering-correlation-id: 571e3b87-e49e-48e3-24f3-08de79456c5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: CveD1TX7P6ffeZc9UKmAcP21Y9G4p2dWJxpc4jpa8bZGpmYlortubjFWHIOWboMU7QlG1ac8AzhkLx49pponw3HB9lVSegP1zDS1ZADnx9vnbTrbD+Uo9M2S3MXMhC+ckvVOIHpXveIVUVaE3Ky+DKH7d0ZEUjSXuK4yzR+3J2jKzp5JTRTGKfVdwpXFwJ+9ZQcPF+VIAbNmX+YniRdIdNM8s8CA4zJAgV0X6VsT0gzNMcRygxf5FhtdVZANl7eCnJaAQd7f0sfFHzGzUJHTGEROUOgW5BbsApOMINoP+J/gYBLxNsFVxDLewXW42ZSvFl0lxMRvRcH8vgehNSYV/sa1adIzGKLcVcR3Bdf6TC7aFQ9PsCMR5hoKyhhoHZFrkq8kFzTpGGsX8xaf2CQkqAh41pxejSbra1b5H2dvQtZ4JI1ryXebVWZd8j/nGp9LnSP3Zk6jNUK2b1gTlmqv0opS5IUiklNHkpEVsFCAB2FOk8tEkskyjIPF9aF2aiWsXhuZxjPsU8luDdv/VO9xRKHRN5cLXmnIOVtwjily3wrT4X9Eus/GMJxdO0zgYqsaWmR/QnO4fruxTI/teS8c8SncOpnTKy+VWNB2m1xZesPUQn5ZAQvLVjTND0KYxO++K+CYPhA+vd1jQlikqv+NUcttZgGAMLZ5xFGx4jrmNP50KXEFn5O5W78VHXQnaVOSOE6/cRRuJwNiZ23WfnHd2A3rpEZbjdDjgqM8wXpII66gIWt1Qfab7lGP/LOJ7Aqj3yQKKIdUs4FicySTzxVGja/0V/iHIBRmyX3mNyFUTss=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWh0bFl1bmE0N3FEMjFNWEJrTGVXS2lDc28xd2wwdzdQeGlIdUxDL1VlcmlB?=
 =?utf-8?B?Ym1kd3VyK1EreHR4VG5ucStvcXArOWVYV2VSQkYzYVc5Uk5CSWhDTEpKTTBQ?=
 =?utf-8?B?SUJWalYwK3dtZ3A0eWRnc0t0QVUxUzNKS2JNajdSOTJOYzVJa0R4S3dzVXEy?=
 =?utf-8?B?TU9wYSsrY2RaZG1oODU0dHgvQWtsV2VqL0pHb3g4SVpQL0hIZFRqQVp3YXlp?=
 =?utf-8?B?R3NialBOK3FkWVNJWVdqQmk0eFNIOW9KZktVTWlSdWJMZWx3bkptTThXTGJV?=
 =?utf-8?B?SVh3bDBTOFBMWjlZYmpWa2l5QUpmZWkxZXZTTGE4am94OHM0Rm1MRlZkYTAr?=
 =?utf-8?B?NitIY3NnaWRObjJTWkR0eVl6NVp4bEVsWnQrUTNURG51YWZQZGVnL015UWdl?=
 =?utf-8?B?a0RXT0ZJYUdRb3lJL2llOG9nNmtZM1VQb3ZIRllkck1lYkY3Y20vQXRvd2hC?=
 =?utf-8?B?SThnd2RoVEZmaUd2S1YrTmtwZkZjRWVFZ1ExQ2lxb1kyUnFwWkJGSmI0V0I4?=
 =?utf-8?B?TTNpbWpjYXZJUXRKSUhIVXFSaW01VlNHR1hHV21vYUwvSUN3YnRhenpYVWkz?=
 =?utf-8?B?TFcrTEZLVXNTUTlpVVpKc0hKbU5XUGR2Q2UzdVJiSmxiZytCcDVJcDRSajZO?=
 =?utf-8?B?dmQrNjNteXVkMlBZVkk1Qm5yb281VWlLTExTZUVEbDl3SUE4YVAzTEJkRmpE?=
 =?utf-8?B?aHBaMW1SVk95bDJhcDJNa2srRmtmdVB1MmRUaXZKYjRrYmg2N1hUYUZ0WGVv?=
 =?utf-8?B?SEI0dTAwRFBUZWpPc3E5eXdDQnN3eFNoRE13amdPbFpnSldQV1I5dElSSFhJ?=
 =?utf-8?B?S2hwVjBGaEFTdkRsU1VMZjF0OXovZjNMYnNYbTMxQ1FkZU5zMWViZDZtSzJI?=
 =?utf-8?B?ZGJicisvcTdQREp1Qkk0ZUtFR0c3cXE0OEp4aWZyOGRTR2RyVWdaK2ppK0Vi?=
 =?utf-8?B?dnhuWUZDd1BGYTRZOWNZemZRb0xUdXRlTGo3Wlo5UFFObWZPTEFpVVlyV3FR?=
 =?utf-8?B?VFhVVzBtR0l3ei9nczRVWjFTRnA0RzV4czU2VDFHMmlDNzZEc3ZXVGNnczg5?=
 =?utf-8?B?TElyWm84R3FxQ1VheE01U2dsQzFBSlZsT20ycExPWUk3TjFvQTZoU00vZUw2?=
 =?utf-8?B?S2l2RWpVYUtIeEc5QitFUlE2UVRwS0tKeVJpa0EyTXZ4dVpvMzVnaDcrY3l1?=
 =?utf-8?B?SllMUXZxYlc5QmhWZjRNLzErVkk5SnJXV2xhd2RRUVBKWHB3elFHb0xsQkpk?=
 =?utf-8?B?TGNqcHRZTkdYNWhQNkhLa1lsNklHeDdSdWxYN1JUUUN3M3VvU2NnemtkOVp0?=
 =?utf-8?B?M1VUQmNHSGEwSGxRL0w3Vjc4SUNKcHZqQ29aS2tkclJqRjFjcGV6ZGNpVE9k?=
 =?utf-8?B?SGNDOUlOL1pHN0tIKzJHUlVlUVJ5SjlLdlZoVHhBLzUrenlpM3gxYWJFODNG?=
 =?utf-8?B?RHpMcklpaitpUE5jUXBTdUFxdFlCOUJWTDVIUkZzS0JOZk5FekNzMG9icnFT?=
 =?utf-8?B?SU15ODJKR29RODYvQTBXdFBCaW56dHVKQWhUQXhkeVNxUHlFRmF4OU1CWXkr?=
 =?utf-8?B?Z2Y3dW5mbUsySE5EekhuNUV5Z3BsbjBaNmMrV0lQbURra3pmM2dSMTdtSlJu?=
 =?utf-8?B?d2ZpeCtWR21hRHJRT01hRm9WL2FiQzd1em5CaTJZUW8zeWRWaUpWb0ltWm5p?=
 =?utf-8?B?blFzREVCZlVicHo0TWtIYjdsajlzVlJCcmU0MFBka2o5R3B4ZnB0Z2V6ZWFv?=
 =?utf-8?B?NzdzR3ZSOFQyRzBvSER6U0pEclY3aWgxNU84WWIwMEpUcDJsc0hZdVo4YU1F?=
 =?utf-8?B?OWxZWEVMQklSc0FMbU9reTB0aDJHc1VxRG9ya2MzYkh3WHlKZ2hnMjhhSXpw?=
 =?utf-8?B?RDM1WDlnSHUySnFueHBIR1pzRTF3Sk4wMnFMbSthZ3l3cnVGVEtKMkFJK3lF?=
 =?utf-8?B?Q3lqRVlIQUZjZDNqUDRUaGV5dGdVc1Q3T1NUZ1VvNDl1WnJvZjJCb0d4MmNi?=
 =?utf-8?B?ekVodlZBVUVyZ2RIamgwOFEvdmlQcExmcUhRV0thMHZjNnprQ2hzZnltY0lQ?=
 =?utf-8?B?ejh5ZWoyTUkwbzVJeVVPK05INUhKdzd6aE9Pbkg0TmJrdGZ1Ym16QmdmNGNj?=
 =?utf-8?B?L2NCa2ZoclloOUZ1cGlja1ozUGhvRWw5RGsxWnNvbjNGT2xvdnpPeHlQRkZH?=
 =?utf-8?B?UVhmdFNIWUFaOEVpMjc4V08vemZjbEsyZWhoVFpoWXNxb2pWdlFwQW04cy9o?=
 =?utf-8?B?Y0NxQWxQOEFhZXpRQkM4VkZxUDdacUFyTDRaQmNKK09RUnVsbU5MN2dsRjkw?=
 =?utf-8?B?anFjQXR6VnAvS2dld2RjTnFCenp1ZGRsakl0RzhmSk5Qb3Z1MWZyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571e3b87-e49e-48e3-24f3-08de79456c5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 16:53:41.0487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dt80oS/Unu8y0NZJZia93OQE3lz9664EQM+Dh+jUo69qjIJfdwu4AkJnD/t25gKoXzPVC2NKnk0SrlVIjgOuoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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

T24gVHVlLCBNYXIgMywgMjAyNiA1OjU2IEFNIEd1c3Rhdm8gU291c2Egd3JvdGU6DQo+ICJMaW4s
IFNodWljaGVuZyIgPHNodWljaGVuZy5saW5AaW50ZWwuY29tPiB3cml0ZXM6DQo+IA0KPiA+IE9u
IE1vbiwgTWFyIDIsIDIwMjYgMTA6MTkgQU0gR3VzdGF2byBTb3VzYSB3cm90ZToNCj4gPj4gV2hl
biBtZWRpYSBHVCBpcyBkaXNhYmxlZCB2aWEgY29uZmlnZnMsIHRoZXJlIGlzIG5vIGFsbG9jYXRp
b24gZm9yDQo+ID4+IG1lZGlhX2d0LCB3aGljaCBpcyBrZXB0IGFzIE5VTEwuICBJbiBzdWNoIHNj
ZW5hcmlvLA0KPiA+PiBpbnRlbF9oZGNwX2dzY19jaGVja19zdGF0dXMoKSByZXN1bHRzIGluIGEg
a2VybmVsIHBhZ2VmYXVsdCBlcnJvciBkdWUNCj4gPj4gdG8gJmd0LQ0KPiA+PiA+dWMuZ3NjIGJl
aW5nIGV2YWx1YXRlZCBhcyBhbiBpbnZhbGlkIG1lbW9yeSBhZGRyZXNzLg0KPiA+Pg0KPiA+PiBG
aXggdGhhdCBieSBpbnRyb2R1Y2luZyBhIE5VTEwgY2hlY2sgb24gbWVkaWFfZ3QgYW5kIGJhaWxp
bmcgb3V0IGVhcmx5IGlmIHNvLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIFNv
dXNhIDxndXN0YXZvLnNvdXNhQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBkcml2ZXJzL2dw
dS9kcm0veGUvZGlzcGxheS94ZV9oZGNwX2dzYy5jIHwgNiArKysrKysNCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2hkY3BfZ3NjLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0v
eGUvZGlzcGxheS94ZV9oZGNwX2dzYy5jDQo+ID4+IGluZGV4IDI5YzcyYWE0YjBkMi4uMWNhYzAw
YzE3ZDRjIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9o
ZGNwX2dzYy5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2hkY3Bf
Z3NjLmMNCj4gPj4gQEAgLTM5LDYgKzM5LDEyIEBAIHN0YXRpYyBib29sIGludGVsX2hkY3BfZ3Nj
X2NoZWNrX3N0YXR1cyhzdHJ1Y3QNCj4gPj4gZHJtX2RldmljZSAqZHJtKQ0KPiA+PiAgCXN0cnVj
dCB4ZV9ndCAqZ3QgPSB0aWxlLT5tZWRpYV9ndDsNCj4gPj4gIAlzdHJ1Y3QgeGVfZ3NjICpnc2Mg
PSAmZ3QtPnVjLmdzYzsNCj4gPg0KPiA+IElmIGd0IGlzIE5VTEwsIHRoaXMgIiZndC0+dWMuZ3Nj
IiBpcyBhbHJlYWR5IHVuZGVmaW5lZCBiZWhhdmlvci4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgc28u
IEl0IGp1c3QgdHVybnMgb3V0IHRoYXQgdGhlIG9mZnNldCB3aWxsIGJlIGludmFsaWQuIFdlIGFy
ZSBub3QNCj4gZGVyZWZlcmVuY2luZyB0aGUgZ3QgcG9pbnRlciBoZXJlLg0KDQpJIGFsc28gdGhv
dWdodCBpdCBzaG91bGQgYmUgdGhlIG9mZnNldCBvZiB0aGUgc3RydWN0dXJlLCBsaWtlIG9mZnNl
dG9mKCkgZG8uDQpCdXQgaXQgdHVybnMgb3V0IG5vdCBjb3JyZWN0IHdoZW4gSSBhc2sgaXQgdG8g
Y2hhdGdwdC4gQW5kIGhlcmUgaXMgYW4gYXJ0aWNsZSB0byBleHBsYWluIGl0Og0KaHR0cHM6Ly9t
ZWRpdW0uY29tL0BDb2RlX0FuYWx5c2lzL251bGwtcG9pbnRlci1kZXJlZmVyZW5jaW5nLWNhdXNl
cy11bmRlZmluZWQtYmVoYXZpb3ItMzI0NjJhMjAwMTA2DQoNClNvLCBJIHN0aWxsIHByZWZlciB0
byBtb3ZlIHRoZSBhc3NpZ25tZW50IHRvIGFmdGVyIHRoZSAhZ3QgY2hlY2suIPCfmIoNCg0KU2h1
aWNoZW5nDQoNCj4gDQo+ID4gSSB3b3VsZCBwcmVmZXIgdG8gbW92ZSB0aGlzIGFzc2lnbm1lbnQg
dG8gYWZ0ZXIgYmVsb3cgY2hlY2suDQo+IA0KPiBJIHRoaW5rIHRoYXQgbWlnaHQgYmUgdW5lY2Vz
c2FyeS4gV291bGQgeW91IGFncmVlIHdpdGgga2VlcGluZyBpdCBhcy1pcyBiYXNlZA0KPiBvbiBt
eSBhcmd1bWVudCBhYm92ZT8NCj4gDQo+ID4NCj4gPj4NCj4gPj4gKwlpZiAoIWd0KSB7DQo+ID4+
ICsJCWRybV9kYmdfa21zKCZ4ZS0+ZHJtLA0KPiA+PiArCQkJICAgICJub3QgY2hlY2tpbmcgR1ND
IHN0YXR1cyBmb3IgSERDUDIueDogbWVkaWEgR1Qgbm90DQo+ID4+IHByZXNlbnQgb3IgZGlzYWJs
ZWRcbiIpOw0KPiA+PiArCQlyZXR1cm4gZmFsc2U7DQo+ID4+ICsJfQ0KPiA+PiArDQo+ID4+ICAJ
aWYgKCFnc2MgfHwgIXhlX3VjX2Z3X2lzX2F2YWlsYWJsZSgmZ3NjLT5mdykpIHsNCj4gPg0KPiA+
IEJUVywgaWYgZ3QgaXMgbm90IE5VTEwsIHRoZW4gZ3NjIGNhbm5vdCBiZSBOVUxMLiBTbyB0aGlz
ICIhZ3NjIiBjaGVjaw0KPiA+IGNvdWxkIGJlIGRyb3BwZWQuDQo+IA0KPiBZZXAuIE1ha2VzIHNl
bnNlLg0KPiANCj4gLS0NCj4gR3VzdGF2byBTb3VzYQ0KPiANCj4gPg0KPiA+IFNodWljaGVuZw0K
PiA+DQo+ID4+ICAJCWRybV9kYmdfa21zKCZ4ZS0+ZHJtLA0KPiA+PiAgCQkJICAgICJHU0MgQ29t
cG9uZW50cyBub3QgcmVhZHkgZm9yIEhEQ1AyLnhcbiIpOw0KPiA+Pg0KPiA+PiAtLS0NCj4gPj4g
YmFzZS1jb21taXQ6IDQwZTUyZWQ2YzY2Y2VmMDkxNTc5ZGQ3ZmU0OWNjZDJkZTEzNWY1YzUNCj4g
Pj4gY2hhbmdlLWlkOiAyMDI2MDMwMi1jaGVjay1mb3ItbnVsbC1tZWRpYV9ndC1pbi0NCj4gPj4g
aW50ZWxfaGRjcF9nc2NfY2hlY2tfc3RhdHVzLTA3MTg5OGI4YTQwMg0KPiA+Pg0KPiA+PiBCZXN0
IHJlZ2FyZHMsDQo+ID4+IC0tDQo+ID4+IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50
ZWwuY29tPg0K
