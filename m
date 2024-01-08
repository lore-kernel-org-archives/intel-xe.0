Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89794C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 19:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7DC10E2A0;
	Mon,  8 Jan 2024 19:32:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675C610E2A0
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 19:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704742371; x=1736278371;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=swfRQk2IxT3rNkqR6SaljWQ1x0ydZQoYRuBwFJgEU3E=;
 b=DP/EdjEwNBoGaej7SCRgJvG1EjRbPA5JogJe8IMHhm9FfNEaUpKT+Izz
 FMGCy1uKeOFpJJV03kic/BlbDulpnPhfcIVttNrNTLAEvaFtY/f34lrlb
 v33eLvxygQqqmj5EQ17tHuw2W3dPcIwTNJ+zJu+L7RArXAUMY2/BvClfS
 Sw7ijrPhR3Wx3uDNt9fNVf32zXFQowquQFYoZ87Xvz83hR3GA6F9NLxfL
 9KWbSCzleoJ/tWmnxW73s89ZT6tEVLmNK3oPBd2o4EAldImCHwyRgW1pd
 Oj1JtfvynjhMorq1AOGLopY2xJyPVWa1D/zaZvelOBn0IoV78r0WhZXUQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5350377"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="5350377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 11:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="16012328"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 11:32:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 11:32:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 11:32:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 11:32:37 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 11:32:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKOZTr93jxPB9KcAadcaIGyHM0nz3r6JyQ8xhmEqLfBH+BWlJOxGI56+BFCaY3jybF+CfXiWOWexqZayIbpWsGSOJ/QIYEQbEj+jGhBEZTDR623qKgG6Hy/0WQ8eRb/wIxw0CfKKlFLH9Ow4LR7KyaUbsqiCijGiEfbdZ86eYxM/3bf0tLL7Ke/Yng4fFTjlzZOwPu7u+0+ZTphHp0pRi7YQrfgM6MdbEGS7W88/xACTRCGrMaWv8Q6xM35JOBu+j58/YpTKUnhOh09l6yH+EnumGrBuCRih7rbTnswL2E+KCDffQJDutcMEqAbVo1vbURobtbcTyunS6Wl/kJ0SgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swfRQk2IxT3rNkqR6SaljWQ1x0ydZQoYRuBwFJgEU3E=;
 b=oK/afVnEaoQcCdCPdgd8DPQK5YCTghu/4sBxnkMMMxfLC5AguNQ7Ltkx/ZHhqAnsdvB+34QSRiEk6tYJdkPUfQ3TnOIGoW2fNj5BjvAZ900GWQbm3qnnglK4L6auxnEoIdCoxJRz6qXojW1LvTAuZYFBgicBqTWwgJC+49J24d8HjEqDJyODE145k/+fLI6r+FrjdF+vOngqccqGEbuh1IG1P1ykUgtmxbKJCL8p7KuCLLCfjcH3h6O/6TDucZ5evFfK5Wf7pzXYFM1pBSHFCpzkUxe4Z5k4WYovIT5D07tHWLqdsqrym5Kw3/5aLqPBZk4MRFKu229MMkqsPOIosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Mon, 8 Jan 2024 19:32:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::da85:3d5:65fd:4a21%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 19:32:34 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Topic: [PATCH 2/2] drm/xe/gsc: add support for GSC proxy interrupt
Thread-Index: AQHaLJdkHXlD3jMZiE2UtSBkunUqoLDQeacA
Date: Mon, 8 Jan 2024 19:32:34 +0000
Message-ID: <da9150ba144d47c347ec3e17d3ec81b8609ce943.camel@intel.com>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
 <20231212010600.3479465-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231212010600.3479465-3-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS0PR11MB7768:EE_
x-ms-office365-filtering-correlation-id: 6c301b81-8a60-4ba4-683e-08dc10809044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l3MkaaZD1syuhYIjiMVeSSt1yqgVdu68f6BjCp5V0ZspGyOLJnJnzci6n1GJ1D0VEhbuNsnaXz01ckyZwrttOtUzrqQEK8SODfdGkTwK1e5h7Muj9bGBfEjLF5UZeQb6xT33RAv07uNLPsqNU199ITbOqcYWcTKTlr8zCx1BaiTlNwGzc/FVEPUrkdtDCWqkJ/FkKYJHY6+rJLPkQEY4m07mqZZ3YNH1SMaG1/I6diZNEOa6hp0Dvu6EQgu2WnQXX+zF/M0sPSd40tFIlj/COOulgFkej9MA/0kE6mLH0A8X2Tmd7vDnUdzT+vpA4WfvYqXHh2w/hmrm/PMWgRc57XLaLVAPWi0VukeL55zJ2Y3TUhxFSTC21ZYL4Hwmo55z8fEusp6sjsmyUaf5QUwHUIZ0ZdQX82VLWHUZVCvr9MjaERM6To6gdg098zSKy7ROk1ERc2ckQ4UgxArYCLNxF9ESgJ6xhoIJNoyl2NySeEOt0hRcsKu8AN0bbfvDkjC/+Pu0yocgARLeO6WFCT4eh6MEiE0jM2wqYdG/aGn2XytFAMRUeau6CrRklv/JVfLMpDNyqahxSt2w/CmPBPIcpnxyNMUcWj4Xnd+b5NPMeOXcSsxeHuvQRp21UV5yHzrO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(6512007)(6506007)(478600001)(26005)(71200400001)(6486002)(38100700002)(122000001)(86362001)(36756003)(82960400001)(4001150100001)(41300700001)(83380400001)(107886003)(2906002)(64756008)(38070700009)(66946007)(91956017)(110136005)(6636002)(8936002)(76116006)(316002)(4326008)(5660300002)(66556008)(8676002)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXMrL1hUdXc2dTBTai9rZDNkZjdDU2JoTXBuTGtyWXA4WW53bEVST1JXcWt2?=
 =?utf-8?B?N2xUR2hVT0krN3ViMHgzdE1RN3lxWUlNOTI1aTFqODJaV2Zpb0c2S0hiUVQx?=
 =?utf-8?B?UzBXNU1md0RXaitFT1NtY2RNSkFYUW8vak5TdlRWQWtxVmQvQlpXc1kvY3VJ?=
 =?utf-8?B?S2htS2lQaVNnendGUlFNaEZFTyt5OU1pUkNBRlRDVEpDeUhrenpZN2VjcEg5?=
 =?utf-8?B?YWtJVkxCZDZ3L0ZXMThibFUzZ3VmMnAwS3ZaQ2ZoY0I3WVh2bTk0VFpqSkxv?=
 =?utf-8?B?YTVydU1MdGJ6eS9hOWhpcmFubjVud3M2alVZOHZuVGI5ZXNadG5ydlNrV0R1?=
 =?utf-8?B?VWl0YkJWSWprb2V1a3VacFlhcWdGSXdEVGQ4NFdGTlVGc2dCZjB2ODYyclQw?=
 =?utf-8?B?aXN0WXdyVUd4Y2ZTNExwUzZhUVRRZTFJaVM1bGI3aDIvUTdQZUFLU1NZUkpt?=
 =?utf-8?B?OEg1UkdYd0J0UmZVRGg2NTk2SmJsZStTeHZIbkRwRnBQNDVmcEJhR0hLMW1S?=
 =?utf-8?B?TWVobzMvclB1d1pYVVVBNlpsMDVnRzA5UHVnZ1hqVCtOUnk2UWhwczJxSUl3?=
 =?utf-8?B?WHk4emNUR2RsZVUrZkd0LzhmTitMeWlyeWhzOC8xM2trYkQwZFB2QzNlaUo4?=
 =?utf-8?B?OGZ0eDVNY0JXMWhhaUkwdzY5ZDM2MjIxa3JHN1pVYTV4S3lYV1lpZHN3bUFG?=
 =?utf-8?B?MWVFS3hERFVhc1FZSDRwQ3BGZ3oyM1FKTkROSzZQMzlVVFJvdVJ5SXFvem0z?=
 =?utf-8?B?aGVBSlE5V0dQQWNwMUVnRFhYME9JbElUL0VXdlYwZXJwaHg4Y25PUDZoblpZ?=
 =?utf-8?B?SUExckUrTmdWZGFSTHNTR295ZEpyZitMVlB5UDdWRzJvNHBCaVZ6WG51ejBN?=
 =?utf-8?B?MTk3ek5KL01pOTM5UTZ0WkRwZ2xIUXJDbW9SRFk0Uk5ON3lVL3JWdDUvZmJv?=
 =?utf-8?B?ejkyZzUwcUJSbCsyYWc2ZmNRZEx6Nit6czM2YktxbjR4UGlWMVB5M1ZwSUpZ?=
 =?utf-8?B?eWJLVWJjaUVpcW5lWHluaXpNTW1IU2ZUVHhlNjJGbDArVlBZeG9aNXlzSTVC?=
 =?utf-8?B?VWV2ZXhPSzJRMnIwUUpJWCs5bVdWS3pqQTljNEtCS1h5Q1drM3dFamRROE1F?=
 =?utf-8?B?bGVVMDBuem9PYTViQUlTalVlVmNhZlVNRUxYc2VlUmlrSG1YU0IrQ29haG1H?=
 =?utf-8?B?WGdOSnh5SGVQZGhHQ29kQ1RuMG9YTHpCOXA2cnN1dGJ2Zjc0R3BtcWNyUk4x?=
 =?utf-8?B?UXcxU0hyaWVYQmhaT3RMNm5FL3FPdnZRMXlKNmxkWHlscWRCZEhGWjM5QUdu?=
 =?utf-8?B?cEdVdWluQll6L0MvSk5BaVVtY3BxS2lCMjNaQkF0d2hocDJWQk9yOFlnUXY4?=
 =?utf-8?B?aXFPUlh3Zy9BMFZ4OVFldnhHRTNSNm1jZEZMblllenV5NFFjTHVsRi8ySFNM?=
 =?utf-8?B?bEhZNTdIRXVvSGZyc0JDOUxmbkJHdGhSeStqSndJT25sTWlrS2NWaGhHemZ6?=
 =?utf-8?B?SHYwRGE3aGlaL1c1aHRVamtxdnVEaUNDekMwRWNpU0hPTjhrd1RSdG1xWTRv?=
 =?utf-8?B?MjhhUkdqUTF1NjBvMkhxZEJFQy85YTdOd09UbitWdVV0eGVSeTJWaU5ocHY4?=
 =?utf-8?B?WGJtcnNLckJ3R3BKNDVJS2NVSVkrVE11Nll4QWNpWWFiWTZmYkpZajBrZmht?=
 =?utf-8?B?bXN0SUdIU1Z0TVNjRnVPcDVvTnkxRGthQzlZUjFhcWJvZ1JTL1lJNFZDLzkv?=
 =?utf-8?B?eXVaSW55NkkzRVd0bUdYYkpUN2Z3UTFGb1ppRkVkYXJWcU5RbHpSMVRCZ3g3?=
 =?utf-8?B?THdaWkN0OWYxckc3SnJDRmMydVdnQ2Rpb2FVSVFZOW1WZWpRb01vQ2E4SXp1?=
 =?utf-8?B?YjVSNUU2UHREdmRqS0hQWFNvTTk3M0N4bXhKTFFFb245TjVXMjZCeDJIZTU3?=
 =?utf-8?B?NlRSUlovN3hPVFp5ZU83N2xQZ25iblgrMmt4Qm9OaDJJR1ZDdzZzdEg2Wldy?=
 =?utf-8?B?amtaeDhxQUgvOFpZVW12SmRnaGhTY2lRdkFhd3FES1hGajJKcnZnVlU3WkhY?=
 =?utf-8?B?Z0ozazk2c0hsRGhkR0x4SzduaUgybnlTM21lVnVmVHdBaVZXVXpvbFB0cU5E?=
 =?utf-8?B?STlwZU1CejlTcyt5ckZYcEFIOFU2VUc2b0t4ZEw3RkVyU3ZKczFXcE80NXYy?=
 =?utf-8?Q?sdX1F6no3zyDKbwNN+ri5js=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24F37EFE70CE4546B63D18D29831A8C7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c301b81-8a60-4ba4-683e-08dc10809044
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 19:32:34.1673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6w9Hl6ws+kdDJCNQo+DhnD09vms1aZA8lTLKa/Q3YugzuPlzjAs6ewvMV7T6/HKsrKMnIYXAMldOLMkYhRvM8XKVxU+LnJ4j0UKptqtbMwiV/YRMxvxiC3shMbNtOKYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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

T24gTW9uLCAyMDIzLTEyLTExIGF0IDE3OjA1IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBUaGUgR1NDIG5vdGlmaWVzIHVzIG9mIGEgcHJveHkgcmVxdWVzdCB2aWEgdGhl
IEhFQ0kyIGludGVycnVwdC4gVGhlDQo+IGludGVycnVwdCBtdXN0IGJlIGVuYWJsZWQgYm90aCBp
biB0aGUgSEVDSSBsYXllciBhbmQgaW4gb3VyIHVzdWFsIGd0IGlycQ0KPiBwcm9ncmFtbWluZzsg
Zm9yIHRoZSBsYXR0ZXIsIHRoZSBpbnRlcnJ1cHQgaXMgZW5hYmxlZCB2aWEgdGhlIHNhbWUgZW5h
YmxlDQo+IHJlZ2lzdGVyIGFzIHRoZSBHU0MgQ1MsIGJ1dCBpdCBkb2VzIGhhdmUgaXRzIG93biBt
YXNrIHJlZ2lzdGVyLiBXaGVuIHRoZQ0KPiBpbnRlcnJ1cHQgaXMgcmVjZWl2ZWQsIHdlIGFsc28g
bmVlZCB0byBkZS1hc3NlcnQgaXQgaW4gYm90aCBsYXllcnMuDQo+IA0KPiBUaGUgaGFuZGxpbmcg
b2YgdGhlIHByb3h5IHJlcXVlc3QgaXMgZGVmZXJyZWQgdG8gdGhlIHNhbWUgd29ya2VyIHRoYXQg
d2UNCj4gdXNlIGZvciBHU0MgbG9hZC4gTmV3IGZsYWdzIGhhdmUgYmVlbiBhZGRlZCB0byBkaXN0
aW5ndWlzaCBiZXR3ZWVuIHRoZQ0KPiBpbml0IGNhc2UgYW5kIHRoZSBwcm94eSBpbnRlcnJ1cHQu
DQoNCmFsYW46c25pcA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdz
L3hlX2d0X3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX2d0X3JlZ3MuaA0KPiBp
bmRleCA1ZjVhNzJlOWQwZDguLjlmNWYyMTUwMDM0YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9y
ZWdzL3hlX2d0X3JlZ3MuaA0KPiBAQCAtNDUwLDYgKzQ1MCw3IEBADQo+ICAjZGVmaW5lICAgSU5U
Ul9FTkdJTkVfQ0xBU1MoeCkJCQlSRUdfRklFTERfR0VUKEdFTk1BU0soMTgsIDE2KSwgeCkNCj4g
ICNkZWZpbmUgICBJTlRSX0VOR0lORV9JTlRSKHgpCQkJUkVHX0ZJRUxEX0dFVChHRU5NQVNLKDE1
LCAwKSwgeCkNCj4gICNkZWZpbmUgICBPVEhFUl9HVUNfSU5TVEFOQ0UJCQkwDQo+ICsjZGVmaW5l
ICAgT1RIRVJfSEVDSTJfSU5TVEFOQ0UJCQkzDQphbGFuOiBzaG91bGQgd2Ugc3RpY2sgd2l0aCBP
VEhFUl9HU0NfSEVDSTJfSU5TVEFOQ0UgdG8gbWF0Y2ggdGhlIG5hbWluZyBpbiBvdXIgaHcgc3Bl
Y3M/DQo+ICAjZGVmaW5lICAgT1RIRVJfR1NDX0lOU1RBTkNFCQkJNg0KPiAgDQo+ICAjZGVmaW5l
IFJFTkRFUl9DT1BZX0lOVFJfRU5BQkxFCQkJWEVfUkVHKDB4MTkwMDMwKQ0KPiBAQCAtNDYyLDYg
KzQ2Myw3IEBADQo+ICAjZGVmaW5lIFZDUzBfVkNTMV9JTlRSX01BU0sJCQlYRV9SRUcoMHgxOTAw
YTgpDQo+ICAjZGVmaW5lIFZDUzJfVkNTM19JTlRSX01BU0sJCQlYRV9SRUcoMHgxOTAwYWMpDQo+
ICAjZGVmaW5lIFZFQ1MwX1ZFQ1MxX0lOVFJfTUFTSwkJCVhFX1JFRygweDE5MDBkMCkNCj4gKyNk
ZWZpbmUgSEVDSTJfUlNWRF9JTlRSX01BU0sJCQlYRV9SRUcoMHgxOTAwZTQpDQphbGFuOiBzaW1p
bGFybHksIGkgYmVsaWV2ZSBpdCBtb3JlIG1haW50YWluYWJsZSB0byBmb2xsb3cgaHcgc3BlYzog
Q1JZUFRPX1JTVkRfSU5UUl9FTkFCTEUNCg0KPiAgI2RlZmluZSBHVUNfU0dfSU5UUl9NQVNLCQkJ
WEVfUkVHKDB4MTkwMGU4KQ0KPiAgI2RlZmluZSBHUE1fV0dCT1hQRVJGX0lOVFJfTUFTSwkJCVhF
X1JFRygweDE5MDBlYykNCj4gICNkZWZpbmUgR1VOSVRfR1NDX0lOVFJfTUFTSwkJCVhFX1JFRygw
eDE5MDBmNCkNCmFsYW46c25pcA0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3NjX3Byb3h5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjX3Byb3h5LmMNCj4gIGlu
dCB4ZV9nc2NfcHJveHlfc3RhcnQoc3RydWN0IHhlX2dzYyAqZ3NjKQ0KPiAgew0KPiAgCWludCBl
cnI7DQo+ICANCj4gKwkvKiBlbmFibGUgdGhlIHByb3h5IGludGVycnVwdCBpbiB0aGUgR1NDIHNo
aW0gbGF5ZXIgKi8NCj4gKwlnc2NfcHJveHlfaXJxX3RvZ2dsZShnc2MsIHRydWUpOw0KYWxhbjog
bml0OiBqdXN0IGEgcXVlc3Rpb24gLT4gZG9lcyBody9mdyByZXF1aXJlIHVzIHRvIGVuYWJsZSB0
aGUgZ3NjIGhlY2kyIGludGVycnVwdHMgaWYNCndlIGFyZSBub3QgeWV0IHByb2Nlc3NpbmcgZXZl
bnQtYmFzZWQgcmVxdWVzdHMgYnV0IHJhdGhlciBkb2luZyBqdXN0IHRoZSBwcm9hY3RpdmUtc3Rh
cnR1cC1wcm94eQ0Kc2VxdWVuY2U/IChpLmUuIG1heWJlIG9ubHkgZW5hYmxlIElSUXMgYWZ0ZXIg
dGhlIHByb3h5LXJlcXVlc3QgaGFuZGxlciBjYWxsIGJlbG93PyBidXQgaQ0KZ3Vlc3MgaXQgZG9l
c250IG1hdHRlciBlaXRoZXIgd2F5KQ0KPiArDQo+ICAJLyoNCj4gIAkgKiBUaGUgaGFuZGxpbmcg
b2YgdGhlIGZpcnN0IHByb3h5IHJlcXVlc3QgbXVzdCBiZSBtYW51YWxseSB0cmlnZ2VyZWQgdG8N
Cj4gIAkgKiBub3RpZnkgdGhlIEdTQyB0aGF0IHdlJ3JlIHJlYWR5IHRvIHN1cHBvcnQgdGhlIHBy
b3h5IGZsb3cuDQo+ICAJICovDQo+IC0JZXJyID0gZ3NjX3Byb3h5X3JlcXVlc3RfaGFuZGxlcihn
c2MpOw0KPiArCWVyciA9IHhlX2dzY19wcm94eV9yZXF1ZXN0X2hhbmRsZXIoZ3NjKTsNCmFsYW46
c25pcA0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjX3R5cGVzLmgg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjX3R5cGVzLmgNCj4gaW5kZXggNjQ1MTY2YWRhZTFm
Li4zMTBmMjU4MDk3OTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2Nf
dHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3NjX3R5cGVzLmgNCj4gQEAg
LTM5LDYgKzQwLDE0IEBAIHN0cnVjdCB4ZV9nc2Mgew0KPiAgCS8qKiBAd29yazogZGVsYXllZCBs
b2FkIGFuZCBwcm94eSBoYW5kbGluZyB3b3JrICovDQo+ICAJc3RydWN0IHdvcmtfc3RydWN0IHdv
cms7DQo+ICANCj4gKwkvKiogQGxvY2s6IHByb3RlY3RzIGFjY2VzcyB0byB0aGUgd29ya19hY3Rp
b25zIG1hc2sgKi8NCj4gKwlzcGlubG9ja190IGxvY2s7DQo+ICsNCj4gKwkvKiogQHdvcmtfYWN0
aW9uczogbWFzayBvZiBhY3Rpb25zIHRvIGJlIHBlcmZvcm1lZCBpbiB0aGUgd29yayAqLw0KYWxh
bjogbml0OiBkaWQgeW91IG1lYW4gImluIHRoZSB3b3JrZXIiPw0KPiArCXUzMiB3b3JrX2FjdGlv
bnM7DQo+ICsjZGVmaW5lIEdTQ19BQ1RJT05fRldfTE9BRCBCSVQoMCkNCj4gKyNkZWZpbmUgR1ND
X0FDVElPTl9TV19QUk9YWSBCSVQoMSkNCj4gKw0KPiAgCXN0cnVjdCB7DQo+ICAJCS8qKiBAY29t
cG9uZW50OiBzdHJ1Y3QgZm9yIGNvbW11bmljYXRpb24gd2l0aCBtZWkgY29tcG9uZW50ICovDQo+
ICAJCXN0cnVjdCBpOTE1X2dzY19wcm94eV9jb21wb25lbnQgKmNvbXBvbmVudDsNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9pcnEuYw0KPiBpbmRleCBkMWY1YmE0YmI3NDUuLmRlN2NjNmU2MTFhMiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2lycS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9pcnEuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KPiAgI2luY2x1ZGUgInhlX2Rpc3BsYXku
aCINCj4gICNpbmNsdWRlICJ4ZV9kcnYuaCINCj4gICNpbmNsdWRlICJ4ZV9ndC5oIg0KPiArI2lu
Y2x1ZGUgInhlX2dzY19wcm94eS5oIg0KYWxhbjogYWxwaGFiZXRpY2FsIG9yZGVyDQo+ICAjaW5j
bHVkZSAieGVfZ3VjLmgiDQo+ICAjaW5jbHVkZSAieGVfaHdfZW5naW5lLmgiDQo+ICAjaW5jbHVk
ZSAieGVfbW1pby5oIg0KPiBAQCAtMTI5LDYgKzEzMCw3IEBAIHZvaWQgeGVfaXJxX2VuYWJsZV9o
d2Uoc3RydWN0IHhlX2d0ICpndCkNCj4gDQphbGFuOnNuaXANCg==
