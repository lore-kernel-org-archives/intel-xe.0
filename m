Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6F0C47422
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 18:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F1E10E09B;
	Thu, 25 Jan 2024 18:11:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976D210E5DA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706206280; x=1737742280;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2Pd4Xa8P1BE6HCihovNvMa6ZrOHWV5o2SeBq9osuJLs=;
 b=OaXe1nvu4SMjsy2SqDUsHZlMVM6uny1yiBZWUCWyYMJuxsc+dJqizoSz
 SfiElstiBqiLK4ipE0ZZbxQHlnVjTIpGpuMXQpUIs8CbWXzUkpIbFORNr
 NqS2eVbSQiSuwtbuIenriplNZUcvP/BIM4OaB/GKP4NAaQuOhUrLDU33k
 liIcOXBiUdRto8T6aEzA1R1kmxIf+I2uryoUjcGZauHVbmtmCmdd7mX7v
 h4x3+2IQ3vX/BbtQsKwXRYzhUGGQBCzQBefiiQDNquXr1X0QC8Z7fEQkI
 QrqqrOtxV2GUrlnrDhFZhhwF/anUa9nCkGFREuJoGHAR4cmYGN2urbslu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1168784"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1168784"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="959926680"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959926680"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jan 2024 10:10:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 10:10:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jan 2024 10:10:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Jan 2024 10:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m85lGguAQcRPlsRVnnOvTmkPFCXg3fGM0SuGaWunh3ZawZEG33F5ECd6Ne+kipQX9M4DeNqhAjkuMFVq5oVP320ddqJEJd3/meaiee9hbdijKSoUOlRCIUAU7Fas6yfYSfsnY/PylhyNaneU+CZ3CRHbBx18TtE03N9+RmzMRzveCwuAhdriLedVaPTmnsQ3V8qazh9edHF2CbFdWqQ9ZTX4BsSq3e6zMJXC+/7gB5lPPLVfwQAiSFLkLoYxyZdFad73yTDYl/czXDTrngdFLitJ3s4STtrDS4o3o2d66Cpq0gHwc+dXr/xZiTbs8m4fqhnHUfOGNf78HVMgUy7ovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Pd4Xa8P1BE6HCihovNvMa6ZrOHWV5o2SeBq9osuJLs=;
 b=g8eTKa8RAk2e0MHZbYu799ordR9yOdftk57nhoFZ4XB6n78YRJTTbunMt8BgIGe77hBjj/Kob0q+677aTSCuygfvn8qmabcdCfyL9fVTgOj0hT8DcqxNAce1Mw4d/ucrQz4stpXOBoIkJe6cJts2GJFPPZamiBexNEOt93no1I52VZyC6uCHtuvy2zTJf/JnbKSah9+wxaGj7aCBHrXcym+MhUxBC2NpTs20Aq933JB3X3JEiqTmONEp/3c+fOF4sJ8l3r06sUu4lCApSPoeS8WBE3WJVYc4UkE9mK6uGvxKyZv/FaAKnKE2UgdKehevb8wmqiJ60lTsY/yE2yV2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.22; Thu, 25 Jan 2024 18:10:52 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 18:10:52 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Thread-Topic: [PATCH] drm/xe/xe_guc: Reduce a print from warn to debug
Thread-Index: AQHaT65kNJm6hTYs3UOmftrcO1nBCrDq1EoA
Date: Thu, 25 Jan 2024 18:10:52 +0000
Message-ID: <8f62f47391873d21f9151a2d4be2ccbfa1bdd040.camel@intel.com>
References: <20240125165652.3764711-1-karthik.poosa@intel.com>
In-Reply-To: <20240125165652.3764711-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7405:EE_
x-ms-office365-filtering-correlation-id: c93987a3-af93-4c24-6d93-08dc1dd0f767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3zpwBrikye4DzboFgOZVbalWxbpWducxv2Ig1EasgSqB3g+SO8otHtnlSsoUG4262bS0TdTjY6ehRzH3Zl1axnY2NnRndFllKXPIi0hUkNvR7UC2zzG3nv+odh2YPo6VGmEzW5MQVEa2renC2NFOq4A4sXOXnlQAS3xUqu+kGX+vvbgmPExTLQq+OfJL/vzkPPIEckJAI8oLx8jcux1rdy4hRtNVjrvroDocoxzJo83+l+yGl5A6traytqPcgRuHHS3ba7ofx0Wb+yGy8GAc7du3KtiE/3hkb37s1DAOkWEIHgoXRiSy45a4SZYqZVJLITNVMJN2R6hvSj4NJmzsXm2ETe5cdTGuscpvZ1Bob3zJNuv8r8Y8dGvHlGGwusava149Wjhk9Nv2AUP36WDNhiux5pykJNX1fQ1SyZPzvmhAWC0EZIqQ7zftmvozrBeJQ9lJ2yS3v0h3fioxm4S38GARdCLdL8heCmjLBLsFReJV4tZQAejcqI3mJxa6+cUZkP7+650Ow9GtL3zfldIJ4rqXROvmk/AveqhFiDPo6M0YNf1sNgE7gKV+ji5dYDweS9d5jZBFmLSyLUNxkFugVkMcJ9Z2tc2FsRAw2KZYJLDMM7Cj8zg5Se6AUVWH+LFqB5RTFqzUEfJZgU8+lXUj3xvL3o81TPO2akPGGbzFk0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(71200400001)(6486002)(41300700001)(478600001)(38070700009)(6506007)(2616005)(66946007)(66556008)(76116006)(64756008)(66476007)(107886003)(110136005)(66446008)(6636002)(316002)(26005)(36756003)(8676002)(5660300002)(4326008)(83380400001)(8936002)(6512007)(122000001)(2906002)(38100700002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3JHbXU1RldxZEU2SUJXa21IUEZTNEtDSERYVXhFblYvR1VpK1hjdlp3YTFG?=
 =?utf-8?B?RlhEcU9kNkJ6NWRhZXFVbGVmelhZRFFvRUxGdUdab2xncE5hSTlMR1ZyajdY?=
 =?utf-8?B?M3l3Vm5SR0RaVWsrYWFqVXB2amRFcGJ1RmtqMGpra3dxZkpqRTZlamkrL2M1?=
 =?utf-8?B?YXcrZXMycHFOLzV4VUN6ZzQxZ053Rjk3T2xISFgrUUZpcW9hdzZQRHdRaGNp?=
 =?utf-8?B?aElDUnIvbUFBSEFpVWptUnhSbmRzVGFtelQ3cThoV2J0U3JYNnJ3SnlhS2ht?=
 =?utf-8?B?elkwL2tSY2tKcDMvcnRHM2VzaW8wZmsyaTU3MitKc2xXUy8yTGVzN3ZYU1o5?=
 =?utf-8?B?ZE5FUHIzRlpwOTRuYnlpUmV4YXB2NE5OTk9IajNyT0VtTFNyLytvZkhkcUR2?=
 =?utf-8?B?VWVpMlFXeFJYK2RKV2xsa2xwUGtvRFMvM0R3VXI3TGdFVFNSS2diSDVKWWo1?=
 =?utf-8?B?Z3IwdU1OL1k4VDBaMkdYQWRIcUZ5bnMvN0pqT0tCQ0R4WVorem5BYVZvMWVy?=
 =?utf-8?B?VWxoUzRvWUsrbHp5STJFM2Vzc0ZwVEh2VTVHYk1sekdySVAxYzR6am9PdE9r?=
 =?utf-8?B?OThTdGNmM3dTTTE2VThJVDl4QUxkZW9YVHJqbUYxeDFPY2dUczFUb1JoZ0Zw?=
 =?utf-8?B?TXpCZjhQNDZVUm40MHdTZUFWZWdvbjNPWEF5WFc1cEdDa3pJWEcwMFliWGpp?=
 =?utf-8?B?eEdNZTd1NVlxM3dFWWYzVnJlTC9Rd0t0SURVL0lrejZDRHByaFVaOTk4TThK?=
 =?utf-8?B?cytncEtHZzNRckVzK2l0eDNIN09GVUpjMWVCQXRwWEM2R000b1NYN1ZBY3Q1?=
 =?utf-8?B?aEhaNWMrbnRENmlnUHpIZ09JVGorSmtNeWVkQnorWmVaU05HMkN6L3g0Zlpq?=
 =?utf-8?B?TndyRjl3MXBiLzNpQXJVMFlmc0cwY0tWZnNOY0FWbXNSTi9ZcnBTMVFXdG4w?=
 =?utf-8?B?cDJ3ZGgxUFk5VThxVUlqSm1mUjFYcFJCaHUzL2JkSGZrMTJzaVZvbUpJT2tX?=
 =?utf-8?B?emd6YmRnVE9jbnlxa1NuUERZY28xcGUzQUhIemFLcGhpQWhtd25FYSsva2tT?=
 =?utf-8?B?YUlUdDYrL0ZIVVEvRTY2Nm5YWndsanJLWU1uRHZPMTdIVENXcWE2SERwRjAz?=
 =?utf-8?B?SWo0WU9mT2dacndicHhrNSsyMkJqNFJBQ3dvcHNNN0I1Wm9ocUVwcHZSNnNK?=
 =?utf-8?B?elRoWEJCek91WDFqcHE5LzBTZE5CbG9TdkR3Yis3Ry81ZWpkQnBieUxEVGRX?=
 =?utf-8?B?UXRSV2phOFZZNUJPYy93QWFVUGNsTHhvL0QwSGNqWTJUc0lCSk1BSWw3dllx?=
 =?utf-8?B?SUpVQW5JSHpQakF4cENaOEwzWmg3WmtKemhEZW4yM1BtNU1ZdVlvZGpSbFI3?=
 =?utf-8?B?bVpBMVRQWmV6dnRTd3N5MWdMYjc0QnNhQks2dHBGOW5TeXJ1OGx6bGd2YVdq?=
 =?utf-8?B?Q0lMbmNZcHNsN3l0SU9Ec3kzeGpJZ2J6QTc0UTgzUmkyRXk2NHZ0ZzNQVXVN?=
 =?utf-8?B?d3dxZzRXRlRkcFdqb0wyb1Z4eXJEamt2cXhQNSt4dXE5MHNObEQvNmxRSjV0?=
 =?utf-8?B?YXh6bTJsTUUzOUVLTmJNMzZzZm5sVXB0RWZYa2h2S3dCNFhMSEd5enVhakw4?=
 =?utf-8?B?ZzhTT2hoS1plQlFuemwvUG1LSWc1clU5WGMrTlFRVTRPVEtjRDJaRlZtd29T?=
 =?utf-8?B?Y0g5ZWFYZzR5cWV2aCtTZ0hUV1RsV1pFZGFmeXh3VmYwSUtkQ04rQS80UFRn?=
 =?utf-8?B?am1HbzNDd2Roazg1VmY2T2ljOW5ZVjN3Z3ZWR3hQWUNKRlZUNnNYak55ZVkz?=
 =?utf-8?B?VkdyV3BGS1FkeGJnY2JFWS9LMDFjZFpNN0pPbFI0TmFCd3BaWllzUjdRQnRY?=
 =?utf-8?B?RUh4Slpxd1JSMWNpU244TVdGYkE3clJnS2hjaE0wRUEyR2F4VmxZbjU4WkxX?=
 =?utf-8?B?dE9MM1BjT1dlUmtxV0U2UWFlaEtVZTRtYUVHd0d5cUpOamJjSVhOWUxDSnF3?=
 =?utf-8?B?NFc3Tm1BWktVWE8vSDFVYUpyeWsrUGNyb2tzMTV5VVNPUS9CRDRzN1UyRUxR?=
 =?utf-8?B?eTFJR28za3RvWTR0WDhuSklEYVZBbC9JMmxpQTlocEZJeSswMHR2TExwcEph?=
 =?utf-8?B?RlhWTzEzMm5LUUVBN0dtQkhsMXNFa0hvVnlHNWpiMVBjc1hOcDR5NjNwZDls?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <098EEA5AC9AD3F45A45679858F1C9D8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93987a3-af93-4c24-6d93-08dc1dd0f767
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 18:10:52.0807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZneIjDIzuQcCnlPYpOO4Kq4/wxBqtZyYH9RSUUbd6Be1urvkiKA/VLZzX2bUv9gr9tvZVWpgyTDKPNwNAaNLy2mfi1aBsQ/gryWDruU64Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI0LTAxLTI1IGF0IDIyOjI2ICswNTMwLCBLYXJ0aGlrIFBvb3NhIHdyb3RlOgo+
IFJlZHVjZSBkZWJ1ZyBwcmludCBmcm9tIHdhcm4gdG8gZGVidWcgdG8gYXZvaWQgdW5jZXNzYXJ5
Cj4gd2FybmluZyBtZXNzYWdlIGluIGRtZXNnIChMdWNhcykuCj4gCj4gRml4ZXM6IGM1YTA2Yzkx
NjlmMyAoImRybS94ZS9ndWM6IEVuYWJsZSBXQSAxNDAxODkxMzE3MCIpCj4gU3VnZ2VzdGVkLWJ5
OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBLYXJ0aGlrIFBvb3NhIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4KPiAtLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyB8IDQgKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Yy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMKPiBpbmRl
eCA1NzZmZjJjMWZiYjkuLmY0ZTU1NTYxMWJhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3VjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMKPiBAQCAt
MTc0LDggKzE3NCw4IEBAIHN0YXRpYyB1MzIgZ3VjX2N0bF93YV9mbGFncyhzdHJ1Y3QgeGVfZ3Vj
ICpndWMpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoR1VDX1ZFUih2ZXJz
aW9uLT5tYWpvciwgdmVyc2lvbi0+bWlub3IsIHZlcnNpb24tCj4gPnBhdGNoKSA+PSBHVUNfVkVS
KDcwLCA3LCAwKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmbGFncyB8PSBHVUNfV0FfRU5BQkxFX1RTQ19DSEVDS19PTl9SQzY7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fd2FybigmeGUtPmRybSwgImNhbid0IGFwcGx5IFdBCj4g
MTQwMTg5MTMxNzAsIEdVQyB2ZXJzaW9uIGV4cGVjdGVkID49IDcwLjcuMCwgZm91bmQgJXUgJXUg
JXVcbiIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZlcnNpb24tPm1ham9yLCB2ZXJzaW9uLT5taW5vciwKPiB2ZXJzaW9u
LT5wYXRjaCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkcm1fZGJnKCZ4ZS0+ZHJtLCAiY2FuJ3QgYXBwbHkgV0EKPiAxNDAxODkxMzE3MCwgR1VDIHZl
cnNpb24gZXhwZWN0ZWQgPj0gNzAuNy4wLCBmb3VuZCAldSAldSAldVxuIiwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2ZXJz
aW9uLT5tYWpvciwgdmVyc2lvbi0+bWlub3IsCj4gdmVyc2lvbi0+cGF0Y2gpOwoKSXQgd291bGQg
YmUgbmljZSBpZiB3ZSBoYWQgYSBtb3JlIHByb2dyYW1tYXRpYyB3YXkgdG8gaGFuZGxlCndvcmth
cm91bmRzIHRoYXQgaGF2ZSBhIHNwZWNpZmljIEd1QyByZXF1aXJlbWVudCBzbyB0aGV5IGNhbiBh
bGwgdXNlCnRoZSBzYW1lIHByaW50IG1lc3NhZ2UuIE9idmlvdXNseSBub3QgcmVxdWlyZWQgaGVy
ZSB0aG91Z2guCgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4KCj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXR1
cm4gZmxhZ3M7Cgo=
