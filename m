Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42713C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 07:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B99210E07F;
	Wed,  8 Nov 2023 07:02:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA010E07F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699426957; x=1730962957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3rsj1Or7AVigC/X54pXWhkovdBxy0rsLypugJaDvjW0=;
 b=UlkdF1o0Q8kEreFKX/sZZfCYo30+xykNXdtUWq6Ex/dXkr2vxIdBHelw
 oZHn/FpUiw3DRos1v/EEwZjBQexE7xsm46xQoJdWttSvZqWdm5LRcAkCc
 T/VWqa2/q3zqjJgtVmXD0J/SLx97O4WfzTXwT3HzfpMi4aMSDzfTKi1fi
 Jv0XcV0pbr6anloaJEPn5JNOtHWhTbbSMS9gU7d4W/O/sHIbRQn+gEtN9
 xeGzgLXU72Sd/b0Ue8t7YH+r1uB9eZ/reT+7RKHCbw++fUT8y0ZyuIPkG
 m30S91vBvfGr6aEIP2Rlhu2PuIM8FGWtIrVzQtp+9NBLCA3bWKvPbXFsY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="475937259"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="475937259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 23:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880113420"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="880113420"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 23:02:35 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 23:02:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 23:02:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 23:02:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 23:02:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK89sKWJEYhyR65lDUf4gv8RLTDmtREoDtcT0HSECfdQ9clv0LhxyD6lRBn4jTaZOLGnaUUkdbykMtMPyaCZWWFslYVacraVtaOc3crr1btsude+csN5W2s50ouuY1O5gmut6KhFwFBqY00wvFKvJ08D7kz4NNnxrUY/aMG1+ZunWsN28cOfvtffOHXl3yyeDXyrBvnA/K8M/KfBPYhxBDU8/qwqdRSdQIVa0u3HDr+FYYFJ+RkL0U1eimMbZjcgjirguyUal4735s15HI/WOCcq2B1CyHDGkMB5W8SQZ7r/58jVcD0xsIGTQUlJcTcxOC+k/jYTFCHlV9952TJkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rsj1Or7AVigC/X54pXWhkovdBxy0rsLypugJaDvjW0=;
 b=YAw/JOBPRY9wWMlCiS6pHLT2HcVT0uyYll2sEBH1h3c+4egWYP+oNwEtpcWvYD+vSr7FmpWY7zFFBFyyIJgKx3s7ssdDUBrTsDu/1TfTIDW2YYIbcvqoEX/Otc4koMz2Wws4gpTZ09IY9DwmSxC5BBgwLlsOi0z68u5pu6TEUuP4yKGLPw+7nrLhiJUfV4atbOPafV1vqVqvj1DS8OhBhp62AGQ18b0U+fPiMcO2pvdPhtyoF/vlnHbRrXztZdno+J63ftUU1ruecdjkNhrxrUO2JuRHH6gzdbnZdvyOYIw88Fdr0tAX52wt73WeHb22KFu0SQvUc0qofLyS2xZyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 07:02:32 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3%5]) with mapi id 15.20.6933.025; Wed, 8 Nov 2023
 07:02:32 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [PATCH v2 1/2] drm/xe/gsc: enable pvc support
Thread-Index: AQHaEXIkblI2t6XeDkOLmB1UK+qAarBvXx0AgACgTDA=
Date: Wed, 8 Nov 2023 07:02:31 +0000
Message-ID: <CY5PR11MB63666A2A6C4DCFBDD97CF8D0EDA8A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20231107115559.248879-1-alexander.usyskin@intel.com>
 <20231107115559.248879-2-alexander.usyskin@intel.com>
 <98bebcf8-f997-4e32-8aed-c977fd5b1d42@intel.com>
In-Reply-To: <98bebcf8-f997-4e32-8aed-c977fd5b1d42@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW3PR11MB4537:EE_
x-ms-office365-filtering-correlation-id: 46928f9b-da14-404e-312e-08dbe028adb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5WqYrDCppMvsnHXZ023NOZvkSNI8KT2OKqkjDAkpCk0tW/DtmIxmpAOQlwll0TSs078T+LWlKYKVXP0onXTBdNxt+XkaFl1YGA+P2lPnMITn4MqvvVt3+dFx4LpBtBBf51xGsoGmlnm89vR4DA1Fe8ILyB3pIGExQBzRoVh5AEVR2plYJ0rcJiKdbceIKDkBhW1rorTGrQDxQlGlzRDezRiIfETdU0JWmWDojtbGCBn15IRixQPCc1Gg6ZEZ/WgrXMsbhtMzXCQF4MaNMpsDGLVty6cEjEc0L2Fj2BVH128FeAqx4VQZenaMjg6KuVXDEhucPxe1hUEMOqZfXn97wTAzHgA5cA3GQJcNYX3bOGc56G2zFX56UnI5DvUHVhTvCKOfVOemHAz+JTukjSusKmYIBWrG+BgkaYVYsN+ihwKW2NSaDc96VoVAUQLQ3d9b3YcOwi0ygDI+74EHAisCcuCNMmXfWOfwuVrKB6DuRmgdNPvnN94iydhHdB2AfrHh93qX9Q8fshiFtV+Hba63aQBFV5Ixqk05TwnQhV3A5d5bRXviuUwDKljbXeb8CdlXt67r9eqHVknkCzgH6i/wMazDpoviwgkQ4iMvz4rI2EgwavV1mEGooJWcGxAfQ7BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(2906002)(83380400001)(122000001)(38070700009)(82960400001)(41300700001)(38100700002)(8936002)(8676002)(478600001)(55016003)(52536014)(71200400001)(4326008)(7696005)(6506007)(86362001)(6636002)(66946007)(66556008)(316002)(76116006)(54906003)(64756008)(66476007)(66446008)(33656002)(110136005)(9686003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NExwQ05BeThxNDdoVms4ckd3Y3M3TVFwMFRsRXRha2dMVzRIckwxYWlkRUMv?=
 =?utf-8?B?czZIMXZPc3BNbnJkQzdGMlZVRE1JVTJRL29Nc0JHS0lHOE9NWThlaFVkbU5Z?=
 =?utf-8?B?QnV5bll6U3lNVzJoZkR6eGZOQUxxSGtjNkdTMUJQem1mcHRSSlozNnV4ZExt?=
 =?utf-8?B?eTJtWmo0eDRKYW1pN29KVU1nSy9ENXFDeEkwUm1ham13b1dPUWxtelZLejhs?=
 =?utf-8?B?VWxaanh2Z2F0VWk1c0hlTGFvUmRXazZlNUwvVDdUZ2doMHIybmNTOXoxSkVi?=
 =?utf-8?B?Qk5ZVDRXYUoxVUZjWmt3Y1VHK2FxOWJUS2ZtSzFEYTNSaSt2T29DL0hrM3kw?=
 =?utf-8?B?eEZjRGhzKzNOZ3lFNjljMm9RNmdPbzBscGY3MDdsbjRqQTF1VmJDZzc1aWY2?=
 =?utf-8?B?MnBaVlF2dWtwTUhlWDNCSllWK3N1WDUyRmZlRlRlTE5jaDdMTnQ1b1lUTzEv?=
 =?utf-8?B?UEtoLzQ5QkREMkxaZHA5RUNCeld0amdQbjVxRkQ2Z2Y1TklYb21oZFpZam9h?=
 =?utf-8?B?UlNOTVMwZnNwWmozU1N0dTQySmc1Zm5pYTFrYjcvRVFzenFzUjRhVDd3cjlU?=
 =?utf-8?B?dWs2b0NFRlBoVmx0UFRtTldWZEtvWWlVUS9MSThqMzhhK3hPbTQrVUt6UEZO?=
 =?utf-8?B?MjZBQThKQ2p0aVp2YnZaeXdFc3NVeFA5T0x2UU4xZkk0c3k2S0xGUmNTRGxW?=
 =?utf-8?B?VFB3a1UzZjBZcnVkVHdIY0NVVlJRYm5oVXZqNGpxNDY2ZXlxWXBnRDIyU3o4?=
 =?utf-8?B?UGpua0VBY2tPK2dMNHpxdXZFMTNCejJhQlhxc0w0bEdtWFRtQjBGN0laamxN?=
 =?utf-8?B?QnJUVFRVYXJJZElFNHg5eDN3SG5KcW00UERLRzUxaDYvelFBVzBSVUkvdU5h?=
 =?utf-8?B?VkZpR25rL00ydXc4MmRGNnVacFl4WXIvUi9qLzFRcWxtMGRaQ1Y3KzJhSEFL?=
 =?utf-8?B?a3diVEhsOHptVnpkMjVFL2tMVDdmTndHU2hXWEpHbmRvQ0RJd3pWbjZPYTJ4?=
 =?utf-8?B?Y0VjVmpoM1RkV2JKUWI1WFhpRExtSXFyTXc4KytnbmQ2elMxVWwrcmdQVjgr?=
 =?utf-8?B?Zkk0cUI5TnJDblB3QTRuTjJ2blhNcXd4VE9raDRpUkNPeTBWelArbFVXdXdh?=
 =?utf-8?B?elFBL2d2bVR4NUpoTVkrN2sxeHExNkNFVWtXM2pHd3B3dmc1Ti9BeE1GUk91?=
 =?utf-8?B?YUFjV2lpZTFXMjFManFIVkZ0Y0p1T2FTdUtPZktQTDJhaDdBdHJrc3VaYlZz?=
 =?utf-8?B?cjV5WFNuZm9SNUhNK1M2Qk9hazJaQ2tBT2ZxQStJZmdmcDV4d2xuWFhKeU54?=
 =?utf-8?B?YklZbFV4SnhUVHk5YmpOTkZwcVh3SFRLZDlyaE8rSDZ2cWVsY1lpRlJEWE5M?=
 =?utf-8?B?REdKVEVkTnAvcTZ3WGVaOHBITXJGc0pQN2NBK05wR1hNdEh6dVYxaTVBRk9Z?=
 =?utf-8?B?YW5zWVp6M04rc3lWQ2wvc1JUSjFqdUJEMnVUdXdFYWtqUmc2MXQ0N3pSWTdq?=
 =?utf-8?B?OTFEeGVqWkc5ZWJZaHdyZTlKOWdyNlJCMmkvM3IvVGU3UjhWcm5JU1F1REhP?=
 =?utf-8?B?aUlBNElmTlhPSVpZUUxDWGVtZlBtclR6RmdmYXJqaTQyazBETEtJelUwaUpt?=
 =?utf-8?B?NmJjNHVOcEhyZ0t3WTJ1NXVTbW9qVXBTR21BZk9VdHFjeTgxeFFWOTZCUUc0?=
 =?utf-8?B?eUgxak1ac1NmckJGZVFGUkYyaGhaRUlyVXJtYXVUZWRCb01lWlE3MFB0QXp3?=
 =?utf-8?B?ZUs4WlR2S29hajl2Unc2bFVWSmNhc29oUlpnNlpVWVJhSmtzTGk1ZklQaGVm?=
 =?utf-8?B?Z01vTUtoekQwaDBjU1IrNWx6Y2ZScXllZTZUeXVOSURub0w5U0FPNGJjcFI2?=
 =?utf-8?B?RGtvVGYvZGVBT0I3MUlFQWZmb0R4OTdGaVVwYzVmWjdlU01mLzM1clhqT21L?=
 =?utf-8?B?VndpeDI5UXVDZ05qd2FWeHduRVNpSUw4T3pkaCtibENsZldDZklKZlp3NHhY?=
 =?utf-8?B?S3c4UjF3eFlyblF5YUZvU1Z4WE9CSCthS3RFOFkxOGNoNS9JclBpb2pTUlB2?=
 =?utf-8?B?VFJOYytlaUl6YzRvUkMyVFppR1Vualp5b2tHcUtkS0tScE4vV2lLT3FaaGRn?=
 =?utf-8?B?Ympyd0pTTk52Rkg3clFnSDQxaTJIQ2VGbFVBMG1kdGJmd1NWS2xkdU1nYlBK?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46928f9b-da14-404e-312e-08dbe028adb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 07:02:32.0066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdDGnqvB1IKbWbPGw+t43wIUp6mNNFTW6oXRckWpSbjvw71t+14PCsbXwWzHsBOzS63NHm0PT119ZwnhS+fGTmDrD4ThGFCA3SP7sgkgmGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/gsc: enable pvc support
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
Cc: "Winkler, Tomas" <tomas.winkler@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

PiA+IENvbmZpZ3VyZSBhbmQgZW5hYmxlIFBWQyBIRUNJIEdTQyBzdXBwb3J0Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS9yZWdzL3hlX3JlZ3MuaCB8
ICAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5jICB8IDExICsrKysr
KysrKystDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgICAgICAgfCAgMSArDQo+
ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgNCj4gPiBpbmRleCBhNjQ2ZDEzYWYw
M2EuLmVjOTM3MmFhNzM5ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVn
cy94ZV9yZWdzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9yZWdzLmgN
Cj4gPiBAQCAtMzUsNiArMzUsNyBAQA0KPiA+ICAgI2RlZmluZSBYRUhQQ19CQ1M4X1JJTkdfQkFT
RQkJCTB4M2VlMDAwDQo+ID4NCj4gPiAgICNkZWZpbmUgREcxX0dTQ19IRUNJMl9CQVNFICAgICAg
ICAgICAgICAgICAgICAgIDB4MDAyNTkwMDANCj4gPiArI2RlZmluZSBQVkNfR1NDX0hFQ0kyX0JB
U0UgICAgICAgICAgICAgICAgICAgICAgMHgwMDI4NTAwMA0KPiA+ICAgI2RlZmluZSBERzJfR1ND
X0hFQ0kyX0JBU0UgICAgICAgICAgICAgICAgICAgICAgMHgwMDM3NDAwMA0KPiA+DQo+IA0KPiBK
dXN0IG5vdGljZWQgdGhhdCB0aGVzZSBkZWZpbmUgYXJlIGluIHRoZSBtaWRkbGUgb2YgdGhlIGVu
Z2luZSBtbWlvIGJhc2UNCj4gZGVmaW5lcy4gTWlnaHQgYmUgY2xlYW5lciB0byBtb3ZlIHRoZW0g
dG8gYSBzZXBhcmF0ZSBzZWN0aW9uLCBidXQgbm90IGENCj4gYmxvY2tlcg0KPiANCg0KR1NDQ1Nf
UklOR19CQVNFIGlzIG5vdCBpbiB0aGUgcmlnaHQgcGxhY2UgLSBJJ3ZlIGJlZW4gdG9sZCB0aGF0
DQphbGwgZGVmaW5lcyBzaG91bGQgYmUgc29ydGVkIGJ5IHZhbHVlIC0gaXQgc2hvdWxkIGJlIGJl
Zm9yZSBCU0RfUklOR19CQVNFIDB4MWMwMDAwDQoNCj4gPiAgICNkZWZpbmUgR1NDQ1NfUklOR19C
QVNFCQkJCTB4MTFhMDAwDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
ZWNpX2dzYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2hlY2lfZ3NjLmMNCj4gPiBpbmRl
eCAzMzI4ZGRjYTQyZDAuLmQ4ZTk4MmUzZDlhMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfaGVjaV9nc2MuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9o
ZWNpX2dzYy5jDQo+ID4gQEAgLTcwLDYgKzcwLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGVj
aV9nc2NfZGVmIGhlY2lfZ3NjX2RlZl9kZzIgPSB7DQo+ID4gICAJLmJhcl9zaXplID0gR1NDX0JB
Ul9MRU5HVEgsDQo+ID4gICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaGVjaV9n
c2NfZGVmIGhlY2lfZ3NjX2RlZl9wdmMgPSB7DQo+ID4gKwkubmFtZSA9ICJtZWktZ3NjZmkiLA0K
PiA+ICsJLmJhciA9IFBWQ19HU0NfSEVDSTJfQkFTRSwNCj4gPiArCS5iYXJfc2l6ZSA9IEdTQ19C
QVJfTEVOR1RILA0KPiA+ICsJLnNsb3dfZmlybXdhcmUgPSB0cnVlLA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiAgIHN0YXRpYyB2b2lkIGhlY2lfZ3NjX3JlbGVhc2VfZGV2KHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiA9IHRv
X2F1eGlsaWFyeV9kZXYoZGV2KTsNCj4gPiBAQCAtMTcyLDcgKzE3OSw5IEBAIHZvaWQgeGVfaGVj
aV9nc2NfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPg0KPiA+ICAgCWhlY2lfZ3NjLT5p
cnEgPSAtMTsNCj4gPg0KPiA+IC0JaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0RHMikgew0K
PiA+ICsJaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX1BWQykgew0KPiA+ICsJCWRlZiA9ICZo
ZWNpX2dzY19kZWZfcHZjOw0KPiANCj4gSUlSQyB0aGVyZSBhcmUgc29tZSBwb3dlci1yZWxhdGVk
IHJlcXVpcmVtZW50cyBmb3IgR1NDIGluIFBWQy4gSXMgaXQNCj4gc2FmZSB0byB1c2UgdGhlIEdT
QyB3aXRob3V0IGltcGxlbWVudGluZyB0aGF0PyBPciBhbSBJIGp1c3QNCj4gbWlzdW5kZXJzdGFu
ZGluZyB0aGUgcmVxdWlyZW1lbnRzPw0KPiANCg0KVGhlIFJDNiB3b3JrYXJvdW5kIGltcGxlbWVu
dGF0aW9uIGlzIG5vdCBwbGFubmVkIG9uIFBWQyBYZS4NClJDNiB3aWxsIGJlIGRpc2FibGVkIGlu
IHRoaXMgY2FzZS4NClNvLCBubyBuZWVkIHRvIGltcGxlbWVudCBtZWkgd29ya2Fyb3VuZCBoZXJl
Lg0KDQotLSANClRoYW5rcywNClNhc2hhDQoNCg0KPiBEYW5pZWxlDQo+IA0KPiA+ICsJfSBlbHNl
IGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9ERzIpIHsNCj4gPiAgIAkJZGVmID0gJmhlY2lf
Z3NjX2RlZl9kZzI7DQo+ID4gICAJfSBlbHNlIGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9E
RzEpIHsNCj4gPiAgIAkJZGVmID0gJmhlY2lfZ3NjX2RlZl9kZzE7DQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2ku
Yw0KPiA+IGluZGV4IDJmYWU0NWI5ZDg4ZS4uNjgyYmExODhlNDU2IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wY2kuYw0KPiA+IEBAIC0zMTUsNiArMzE1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4
ZV9kZXZpY2VfZGVzYyBwdmNfZGVzYyA9IHsNCj4gPiAgIAlQTEFURk9STShYRV9QVkMpLA0KPiA+
ICAgCS5oYXNfZGlzcGxheSA9IGZhbHNlLA0KPiA+ICAgCS5yZXF1aXJlX2ZvcmNlX3Byb2JlID0g
dHJ1ZSwNCj4gPiArCS5oYXNfaGVjaV9nc2NmaSA9IDEsDQo+ID4gICB9Ow0KPiA+DQo+ID4gICBz
dGF0aWMgY29uc3Qgc3RydWN0IHhlX2RldmljZV9kZXNjIG10bF9kZXNjID0gew0KDQo=
