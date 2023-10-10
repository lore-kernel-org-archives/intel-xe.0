Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9933ECD8CAB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 16:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED5410E3AC;
	Tue, 10 Oct 2023 16:50:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0398210E3AC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696956645; x=1728492645;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vyvoHfAJvjSllmSeHIIWJkR4K7nf3xUGlsndZJHXS4A=;
 b=SuGDNiNCZU3AXZ0ODCDxKFE6E2bfpzMYJ0vVKfafXrD9EhqePM/rnQ/9
 ihxIXw4f/emnyGDJvN36lkxvhmAP6qO9Ok3Vn7EQyWcQV9zT1TakoPcud
 NWa3TGhxc24m3Emy507/JcRn8Y2nzrpWCPesuL2DHDSISE1RcmMumZ3qO
 NLI0GQm/vIV/vxqik3PZjUK0NLEE/0dj+JOmpcduDOlu/N0U8JtQS4LiW
 VleObOF9x+K5faVPf3BayD4O7frTi4kSooGki2OwPqZmdU7oSTk5EUbeO
 ebXHUmCNBDxoaBy92EndVIE+OM8B5jAz6tWrt2hYPVYtzMoHYUIAvrmeK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374797634"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="374797634"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 09:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753466280"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="753466280"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 09:49:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 09:49:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 09:49:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 09:49:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 09:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF+ipBLB252v3i5+Fx+um8yR8fw14Ouo0X7oY2FYkW23rMNugIAWeUEpv2SY0+iWnkW5dgu+uNWnaFUjg61JnuWys/81kZdKBhNTY95zD+kpb3kkD1wVoWvSaSFVp8QHy5s7X4N4rV24WCUqIh4B/Je3IhaOFHs2dIj0qcj4YqIrkbS+rk1jGcZ6UVBAWB+EAc/gDsrBi8HHxMk4v5+Iazk6BMXz5l8oDnmHrUXzuXVSiPo0yG61zGqZ5WXdIUXLkOzjz4HEwGsd8QJPNclGz5zC5E79ltqvMVaxmyFgj7r1Dye9SCUDig36ZZXe+GQhLzM5rRY9KKCb3fS8GlekKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyvoHfAJvjSllmSeHIIWJkR4K7nf3xUGlsndZJHXS4A=;
 b=VvzFtg9oJR2Z3WpA7wiqDtKg86IRNpGJJ1kt4Yw96N6ns4wwLDw6F8+0Bg9NLepHzZvSjypK6C/JbZZgT2/YqC3tFuW1kuJaOEgHi/o1AKuLlu5vSE1lQjwsa3qropwgTNmYOM1D7SXBajs06jicQ4m7cpvKod75KONnKemSe8VVIqur1gJA21ylbZ3H26L47fOXQZqjomiR2tjalkM0NiSfiXBnYN4efIUsoPaMpstskuF3fw3PPn2MOoOkWCqI4nePe2oxHSZgl3Nyy+fWQLBcMtMCPPpaSiAv6G2NpuwT3niTibaoSkdmmsZAGOkhPlIyU7kwVHQlfD6yL/o0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by BY1PR11MB8078.namprd11.prod.outlook.com (2603:10b6:a03:52a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:49:50 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::413:a622:bff4:bdd6%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:49:49 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
Thread-Index: AQHZ+ngSWfvuJ7zodkylA2OWE7H427BBIu0AgAFaSwCAAAb6AIAAgqyw
Date: Tue, 10 Oct 2023 16:49:49 +0000
Message-ID: <CY5PR11MB6211880DE6240A91E01CF50F95CDA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231009062209.4009360-1-riana.tauro@intel.com>
 <7c044a59-be46-4945-961e-1fb42dc28d6a@intel.com>
 <ed0e85f6-5149-1c91-5af8-bb40ee7826de@intel.com>
 <236ff168-372d-f620-7b53-57d9cfcb10ed@intel.com>
In-Reply-To: <236ff168-372d-f620-7b53-57d9cfcb10ed@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|BY1PR11MB8078:EE_
x-ms-office365-filtering-correlation-id: d8e37fb1-d499-4152-5b90-08dbc9b0eb0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VmiacvY2dJPdjEP79SF21zgZcnjrrKOeb6QczUqIGii6NWNh8EXOoqqCbBg0IUhIhzlbqz5RSdoKDHPNZwyNlOQ0RXsp+RyQKoq+lUZ5W7PROs1XCIiYXHG9b/xM/skl5E8pvYXd3IRxJWa+OXYudD7nFnuNzMiQWo+SLe/WKca+ueRYEQJ87SadNOVu4IKVqW20MAEBxBu7XCvyNe+Otrf3Z1Hyvi3yQoJh8Y/FYiyIaylnYn55Gz129d+Wat5vuj/OTPEKNg0Ku9eTSQOdssqJwVX1ttmMWqKSlzkpvCs3rwDS7cOpKrQvWY+U9kpIhUDl63fmB46v04T6sGvktDmUxy/CQv7MOFVjl9bA6NgLaqVsCn05B8zIKa6APsqLtGBdBguGxpwLsyJHaP+SwzoiBHm6mjvONNJ+nnrHprxmanJE9eM/dSDQHxe/0FbhGSKwDlYhLKiFHPF9LRjRkIsT7MewQUPHF1r+ak4za18D3R1MiJbE62uir+VkWnL8xGasNt0gLVq412zJ4sVU4BmBmMSVHVBFSqIXjG5C+MS90HRHln2WUkxfQ1RIagTrS8LCbLsQjcuyiyP9yF7I4xNzlCa258NX7eMHzKA4E4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(66556008)(83380400001)(8936002)(8676002)(66446008)(66946007)(26005)(66476007)(76116006)(316002)(2906002)(110136005)(64756008)(5660300002)(41300700001)(53546011)(71200400001)(52536014)(6506007)(9686003)(7696005)(478600001)(33656002)(122000001)(86362001)(82960400001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGM4VWh0NlUvREhhbkwwNEJyY0Z2M082VGkrRGFjUWNYQzBEdGJ1TUxndVQr?=
 =?utf-8?B?cktmQXE1U2g3S3hCTXVRWEZHSktJMlRVT0RLbkJDMXc4WDBHcmVtYzBpbHRm?=
 =?utf-8?B?d0ZybldOYnZpQzN2QXQvcStaYjE0aUozOVJKRWdKcWZvaGpFd1kyQll5Z0kw?=
 =?utf-8?B?dWgvOGV5bFhEeDJwend3UW1vMkluYWJaR0ppNXVIbWk1N3ZGSVR1UkFRUWhj?=
 =?utf-8?B?WEJFUTZVL21TTXhJUWZINTBTTVlCUm1CaklRaGV2ZHhYQTZON2pRZkxtQzJV?=
 =?utf-8?B?QjZpd2czaDJtV1RZNHh3WjB0ZzRMVlRPRHB3L09yc1RJTHg0WXNKRFlzbXJF?=
 =?utf-8?B?S0ROdUw1WjNibTN4VkNsSHVKWmVxTjhRaExkdjgwaFBQT2Z2NThXelY0cjlN?=
 =?utf-8?B?cGJRcXVYdzJlSUVWT1RQeExROTZPRmFHZXF2b3JmUjdhSXVUYXp1VVpscmg1?=
 =?utf-8?B?VWtTMjFvV0VSVm5EK1pwZzY3b3ZRblMyUDN2RUJjS0tzNFNLTDJBNXNsUC9D?=
 =?utf-8?B?SE9HY1FXU2EvQjdxM2RzUFRpQWJCanFiUWcwMDRBMVlWcm1BbTB4Vzl5eGdK?=
 =?utf-8?B?TmlnS1N1cDN3dkQrSUhBNzlabTNqQzh6M0pOeTN4cmNXbURZUnZLVWRYZDBk?=
 =?utf-8?B?czU1SGg5SGJxZmVhZnpqY1pGVlVJcU1tVkhDRXFyUUFvQjRUbnY2enorallL?=
 =?utf-8?B?djkrUEk5WW51eGV1N1BhdmxsZGE0TG5NYnoxSmNsQ2lTSlY3b0xFbkhIa1dY?=
 =?utf-8?B?ZlhhMk9lWlJwbmp5MzkvZURNZDE3UmRDRTA3WllIMHNoc2lmMG80VGZMVmpS?=
 =?utf-8?B?UFUzVERuWmNpS1REc2lFQkNRT0oxOTNjOU1RRHNnek9oTWR1L0ZxdTdCRnQv?=
 =?utf-8?B?MEp6SGFwV2RzWXYxOEtFblJLdFdsZnFnRGJvblpWZ0xiOFhzb2V1OEZlTjlJ?=
 =?utf-8?B?K2ZhaXhTMDJ0eFNEajlPU1NVMWc5eEo4TDVsTFVXQVFvalRDaCtLVCtsVTBR?=
 =?utf-8?B?OUY0b0psRnFMQXZRY082ODVHTTBEMWhJcmptY1Z5ekVDZWtxdFNXSzZXSTJo?=
 =?utf-8?B?VGNoRUdxdDYyb21LZ2trakF4U2Zib3hLdUovU0IzV3hWS0VITkNZMGxqVDcx?=
 =?utf-8?B?T0JNVHZ6YVJlV2J5bncyakhnVERINlAwOG9MWE9nTGVHblhrSDE0VnhEUldH?=
 =?utf-8?B?ZS8waWhKR1VoWG44ZXI4N3hrUkhyWHB2MkU4N0hEdzBSV05rMW5PQWIyelg3?=
 =?utf-8?B?cFJ2QmFGMi9qc2dVdTJVc3Rqd2w3eVUya1JYTzk5cGVMTm5wdUs3TGNyNjZt?=
 =?utf-8?B?TjRJR3dsUW16RVRBaUZzc3hWMFh5SDRmVVpWSmIvUUR5OFIzWCtYNkRtYUJC?=
 =?utf-8?B?bkNsQms0TG5KQ0ZiNWZlWnFlVUpKWEw1dDR5bmhtVkZBNVV5clg0bk1vTXZm?=
 =?utf-8?B?RjU4UW0yT1FEM2QwS0FjVVZWQ2J6NmNoZjh2YS94bFRVMkxIc2J5T3BuVXR4?=
 =?utf-8?B?dTU1Zk54SE02TGtWRUl4RFZ6a2I4ckI3UVE5RGY4ZjBOK24zWXp3SHVQUWhJ?=
 =?utf-8?B?Y1BWM0ViVjc0VUlVYU5EQmpseHlBSURERGg2WkhsNzZvQStyUHFTZ3pQbEQx?=
 =?utf-8?B?T0VpQm5FdFRIVTEwY2dkaFhUYUQwTFJzekxpZnEycTFFNlFUOTF5YjRaMUZ5?=
 =?utf-8?B?S2xSbHJtc0JUaTVUeW9xVnRjUFVlbWwvdStIRmd1d2VJNGNURXZlZENFZ1h3?=
 =?utf-8?B?YnZVR1VXMmZnTndOWSthdkFXRk4zSkpLRTZyM01qTEpVU3VWc2g2c0U5OXdl?=
 =?utf-8?B?ZHZxWW5mQ2I5WjViU3dWeGI1eVVnT0tiWlgwL1dodTIwMkc0MGxBZVVCd21a?=
 =?utf-8?B?aVA5aHhnSVR3ang5Q2s3aitMZFgwaldYMjZKNFJUMkxZT0NmcWJMZWJhQzJ5?=
 =?utf-8?B?bSsxb3I1aU5SbEh2ck0vbVR1TytMNlJPSHl2Wkl1aWEwTFVTY2FPbWJlNkxT?=
 =?utf-8?B?YmJSWnhGRjAyUWl3VmZpdHhRb1ZVWnhRZWpPck9zNWJvOEp6ZUcyUXhpdk5p?=
 =?utf-8?B?MFNoMFdFNzlWczdzVHhaQ01hNzBnQ1ppbFB5NUpEck1tdWFjSFB6MnFPclVB?=
 =?utf-8?Q?YWxI1V+AeNWR74gp4T4CXgvRS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e37fb1-d499-4152-5b90-08dbc9b0eb0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 16:49:49.7588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRYSsJuZ22RoiWDga6N01ViS3TZqLyjMxu/UXYm4t99BfBUmSA9Cn/UWZxec+F0/EddMs9jboe9Q7n3rBOxXulC0HPC5raqyFPEnYDRBYho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8078
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] RFC drm/xe: Add mem_access_get in
 gem_create_ioctl
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUmlhbmENCj4g
VGF1cm8NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxMCwgMjAyMyAxMToxMyBBTQ0KPiBUbzog
TmlsYXdhciwgQmFkYWwgPGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPjsgR2hpbWlyYXksIEhpbWFs
IFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW0ludGVsLXhlXSBbUEFUQ0hdIFJG
QyBkcm0veGU6IEFkZCBtZW1fYWNjZXNzX2dldCBpbg0KPiBnZW1fY3JlYXRlX2lvY3RsDQo+IA0K
PiANCj4gDQo+IE9uIDEwLzEwLzIwMjMgMTA6NDcgQU0sIE5pbGF3YXIsIEJhZGFsIHdyb3RlOg0K
PiA+DQo+ID4NCj4gPiBPbiAwOS0xMC0yMDIzIDE0OjA4LCBHaGltaXJheSwgSGltYWwgUHJhc2Fk
IHdyb3RlOg0KPiA+PiBIaSBSaWFuYSwNCj4gPj4NCj4gPj4NCj4gPj4gT24gMDktMTAtMjAyMyAx
MTo1MiwgUmlhbmEgVGF1cm8gd3JvdGU6DQo+ID4+PiBnZW1fY3JlYXRlX2lvY3RsIGRvZXMgbm90
IGhhdmUgYSBtZW1fYWNjZXNzX2dldCB0aWxsIGl0IHJlYWNoZXMNCj4gPj4+IHhlX2JvX21vdmUu
DQo+ID4+Pg0KPiA+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIHJ1bnRpbWUgc3VzcGVuZGVkIChpbiBE
M2NvbGQpLCBuZXcgYm8gY3JlYXRlZCBhcw0KPiA+Pj4gcGFydCBvZiBnZW1fY3JlYXRlX2lvY3Rs
IHN0ZWFscyB0aGUgYnVkZHkgYmxvY2sgb2YgdGhlIGtlcm5lbA0KPiA+Pj4gb2JqZWN0cyB0aGF0
IGFyZSB5ZXQgdG8gYmUgcmVzdG9yZWQgYXMgcGFydCBvZiBydW50aW1lIHJlc3VtZQ0KPiA+Pj4g
KEQzY29sZCkuIFRoZSBydW50aW1lIHJlc3VtZSB0cmlnZ2VycyBvbmx5IGluIHhlX2JvX21vdmUu
IFdoaWxlDQo+ID4+PiB0cnlpbmcgdG8gcmVzdG9yZSB0aGUga2VybmVsIG9iamVjdHMgaXQgZmlu
ZHMgdGhlIGJ1ZGR5IGJsb2NrIGlzIG5vdA0KPiA+Pj4gZnJlZS4NCj4gPj4+IFRyaWVzIHRvIGV2
aWN0IHRoZSBuZXcgYm8gd2hpY2ggaXMgYWxyZWFkeSBsb2NrZWQgY2F1c2luZyBhIGRlYWRsb2Nr
DQo+ID4+Pg0KPiA+Pj4gUHJldmVudCBkZWFkbG9jayBieSB0YWtpbmcgbWVtX2FjY2VzcyBnZXQg
ZWFybHkgaW4gdGhlIGlvY3RsDQpXZSBuZWVkIHRvIHRha2UgdGhlIG1lbV9hY2VzcyB3YWtlcmVm
IG9ubHkgZm9yIG9iamVjdCBwbGFjZWQgaW4gdnJhbS4NCkl0IGRvZXMgbm90IG1ha2Ugc2Vuc2Ug
Zm9yIGludGVncmF0ZWQgZ2Z4LCB3aGljaCBkb2VzIG5vdCBzdXBwb3J0cyBkM2NvbGQuDQo+ID4+
Pg0KPiA+Pj4gwqDCoMKgwqBJTkZPOiB0YXNrIGt3b3JrZXIvMToxOjQ0IGJsb2NrZWQgZm9yIG1v
cmUgdGhhbiA2MSBzZWNvbmRzLg0KPiA+Pj4gwqDCoMKgwqAiZWNobyAwID4gL3Byb2Mvc3lzL2tl
cm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzDQo+ID4+PiBtZXNzYWdl
Lg0KPiA+Pj4gwqDCoMKgwqB0YXNrOmt3b3JrZXIvMToxwqDCoMKgwqAgc3RhdGU6RCBzdGFjazoy
NTI3MiBwaWQ6NDQgcHBpZDoyDQo+ID4+PiBmbGFnczoweDAwMDA0MDAwDQo+ID4+PiDCoMKgwqDC
oFvCoCArMC4wMDgzOTVdIFdvcmtxdWV1ZTogcG0gcG1fcnVudGltZV93b3JrDQo+ID4+PiDCoMKg
wqDCoFvCoCArMC4wMDQwNjhdIENhbGwgVHJhY2U6DQo+ID4+PiDCoMKgwqDCoFvCoCArMC4wMDI0
ODZdwqAgPFRBU0s+DQo+ID4+PiDCoMKgwqDCoFvCoCArMC4wMDIxNjFdwqAgX19zY2hlZHVsZSsw
eDZmNS8weDE2NDANCj4gPj4+IMKgwqDCoMKgW8KgICswLjAwMzcwMl3CoCA/IF9fcGZ4X19fc2No
ZWR1bGUrMHgxMC8weDEwDQo+ID4+PiDCoMKgwqDCoFvCoCArMC4wMDQxMzNdwqAgPyBfX3d3X211
dGV4X2xvY2suY29uc3Rwcm9wLjArMHhmNGYvMHgxZTYwDQo+ID4+PiDCoMKgwqDCoFvCoCArMC4w
MDUzMzBdwqAgc2NoZWR1bGUrMHg5Mi8weDEyMA0KPiA+Pj4gwqDCoMKgwqAuLi4uDQo+ID4+PiDC
oMKgwqDCoFvCoCArMC4wMDM5MjJdwqAgdHRtX2JvX21lbV9zcGFjZSsweDQ2ZC8weDQ5MCBbdHRt
XQ0KPiA+Pj4gwqDCoMKgwqBbwqAgKzAuMDA0NTg2XcKgIHhlX2JvX3Jlc3RvcmVfcGlubmVkKzB4
MjAwLzB4MzIwIFt4ZV0NCj4gPj4+IMKgwqDCoMKgW8KgICswLjAwNTAwN13CoCA/IF9fcGZ4X3hl
X2JvX3Jlc3RvcmVfcGlubmVkKzB4MTAvMHgxMCBbeGVdDQo+ID4+PiDCoMKgwqDCoFvCoCArMC4w
MDU1MDNdwqAgPyBfX3BmeF9fcHJpbnRrKzB4MTAvMHgxMA0KPiA+Pj4gwqDCoMKgwqBbwqAgKzAu
MDAzNzkxXcKgID8gX19wZnhfZG9fcmF3X3NwaW5fbG9jaysweDEwLzB4MTANCj4gPj4+IMKgwqDC
oMKgW8KgICswLjAwNDU5N13CoCB4ZV9ib19yZXN0b3JlX2tlcm5lbCsweDJlNC8weDQ3MCBbeGVd
DQo+ID4+PiDCoMKgwqDCoFvCoCArMC4wMDU1MjFdwqAgeGVfcG1fcnVudGltZV9yZXN1bWUrMHgy
MGEvMHg3NTAgW3hlXQ0KPiA+Pj4gwqDCoMKgwqAuLi4uDQo+ID4+PiDCoMKgwqDCoElORk86IHRh
c2sgeGVfbW1hcDoxODM2IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiA2MSBzZWNvbmRzLg0KPiA+Pj4g
wqDCoMKgwqAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNz
IiBkaXNhYmxlcyB0aGlzDQo+ID4+PiBtZXNzYWdlLg0KPiA+Pj4gwqDCoMKgwqB0YXNrOnhlX21t
YXDCoMKgIHN0YXRlOkQgc3RhY2s6MjM2MDAgcGlkOjE4MzbCoCBwcGlkOjE4MzENCj4gPj4+IGZs
YWdzOjB4MDAwMDQwMDINCj4gPj4+IMKgwqDCoMKgW8KgICswLjAwODM5NV0gQ2FsbCBUcmFjZToN
Cj4gPj4+IMKgwqDCoMKgW8KgICswLjAwMjQ4Nl3CoCA8VEFTSz4NCj4gPj4+IMKgwqDCoMKgW8Kg
ICswLjAwMzI3MV3CoCBycG1fcmVzdW1lKzB4MzQxLzB4YWQwDQo+ID4+PiDCoMKgwqDCoFvCoCAr
MC4wMDUyNjldwqAgX19wbV9ydW50aW1lX3Jlc3VtZSsweDUzLzB4YzANCj4gPj4+IMKgwqDCoMKg
W8KgICswLjAwNDE1Ml3CoCB4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXQrMHgyYi8weDYwIFt4ZV0N
Cj4gPj4+IMKgwqDCoMKgW8KgICswLjAwNTE3Ml3CoCB4ZV9ib19tb3ZlKzB4MmVmLzB4OWYwIFt4
ZV0NCj4gPj4+IMKgwqDCoMKgW8KgICswLjAwNDEzMV3CoCB0dG1fYm9faGFuZGxlX21vdmVfbWVt
KzB4MTVhLzB4MjMwIFt0dG1dDQo+ID4+Pg0KPiA+Pj4gTGluazpodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy8yNTYNCj4gPj4+DQo+ID4+PiBDYzog
TWF0dGhldyBBdWxkPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5
OiBSaWFuYSBUYXVybzxyaWFuYS50YXVyb0BpbnRlbC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIHwgMjIgKysrKysrKysrKysrKysrKystLS0tLQ0K
PiA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gPj4+IGluZGV4IDYxNzg5YzBlODhmYi4uZTQ1
M2E1MjY0YzgyIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMN
Cj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jeGVfZGV2aWNlX21lbV9hY2Nl
c3NfZ2V0IEBAIC0NCj4gNjMwLDYNCj4gPj4+ICs2MzAsNyBAQCBzdGF0aWMgaW50IHhlX2JvX21v
dmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0dG1fYm8sDQo+ID4+PiBib29sIGV2aWN0LA0K
PiA+Pj4gwqDCoMKgwqDCoCBib29sIHR0X2hhc19kYXRhOw0KPiA+Pj4gwqDCoMKgwqDCoCBib29s
IG5lZWRzX2NsZWFyOw0KPiA+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsNCj4gPj4+ICvCoMKg
wqAgYm9vbCBkZXZpY2VfYXdha2U7DQo+ID4+PiDCoMKgwqDCoMKgIC8qIEJvIGNyZWF0aW9uIHBh
dGgsIG1vdmluZyB0byBzeXN0ZW0gb3IgVFQuIE5vIGNsZWFyaW5nDQo+ID4+PiByZXF1aXJlZC4g
Ki8NCj4gPj4+IMKgwqDCoMKgwqAgaWYgKCFvbGRfbWVtICYmIHR0bSkgew0KPiA+Pj4gQEAgLTcx
Miw3ICs3MTMsOCBAQCBzdGF0aWMgaW50IHhlX2JvX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0DQo+ID4+PiAqdHRtX2JvLCBib29sIGV2aWN0LA0KPiA+Pj4gwqDCoMKgwqDCoCB4ZV90aWxl
X2Fzc2VydCh0aWxlLCB0aWxlLT5taWdyYXRlKTsNCj4gPj4+IMKgwqDCoMKgwqAgdHJhY2VfeGVf
Ym9fbW92ZShibyk7DQo+ID4+PiAtwqDCoMKgIHhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7
DQo+ID4+PiArDQo+ID4+PiArwqDCoMKgIGRldmljZV9hd2FrZSA9IHhlX2RldmljZV9tZW1fYWNj
ZXNzX2dldF9pZl9vbmdvaW5nKHhlKTsNCj4gPj4NCj4gPj4gSUlSQyB4ZV9ib19tb3ZlIGlzIGNh
bGxlZCBpbiBldmljdGlvbiBwYXRoIHRvby4gV29uJ3QgaXQgYmUgc2FmZSB0bw0KPiA+PiB1c2Ug
eGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0IGhlcmUgdG9vID8NCj4gPg0KPiA+IEFncmVlZCwgeGVf
Ym9fbW92ZSBpcyBiZWluZyBjYWxsZWQgZnJvbSB0dG1fYm9faGFuZGxlX21vdmVfbWVtIHdoaWNo
DQo+ID4gaXMgYWdhaW4gY2FsbGVkIGZyb20gbXVsdGlwbGUgcGxhY2VzLiBUbyBjb3ZlciB0aG9z
ZSBwbGFjZXMgaXRzIGJldHRlcg0KPiA+IHRvIGtlZXAgeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0
Lg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBCYWRhbA0KPiBIaSBIaW1hbC9CYWRhbA0KPiANCj4g
SSBzcG9rZSB0byBNYXR0IEF1bGQgb2ZmbGluZSBhbmQgaGlzIHN1Z2dlc3Rpb24gd2FzIHRvIHJl
bW92ZSBpdCBmcm9tDQo+IGJvX21vdmUgb3Igc2hvdWxkIGJlIG9uZ29pbmcgaWYgbWVtX2FjY2Vz
c19nZXQgaXMgYWRkZWQgZWFybHkgaW4gdGhlIGlvY3RsDQo+IA0KPiBSZW1vdmVkIGl0IGFuZCBy
YW4gdGhlIEJBVCAsc2F3IGFuIGVycm9yIHdoaWxlIHJ1bm5pbmcNCj4geGVfbGl2ZV9rdGVzdEBk
bWFidWYuDQo+IA0KPiBbICArMC4wMDcxNDJdIENhbGwgVHJhY2U6DQo+IFsgICswLjAwMjQ2NV0g
IDxUQVNLPg0KPiBbICArMC4wMDIxMjBdICA/IF9fd2FybisweGE1LzB4MjAwDQo+IFsgICswLjAw
MzI1M10gID8geGVfZGV2aWNlX2Fzc2VydF9tZW1fYWNjZXNzKzB4MTcvMHgyMCBbeGVdDQo+IC0t
LQ0KPiBbICArMC4wMDU1NzNdICB4ZV9ib19tb3ZlKzB4MjU0LzB4MTQ4MCBbeGVdIFsgICswLjAw
NDE4NF0gID8NCj4gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMrMHgyM2UvMHg0YTANCj4gLS0tDQo+
IFsgICswLjAwMzc2NF0gIHhlX2JvX2NyZWF0ZSsweDIwLzB4ZDAgW3hlXSBbICArMC4wMDQxMDld
DQo+IGRtYV9idWZfcnVuX2RldmljZSsweDE1OS8weDYxMCBbeGVdDQo+IA0KPiBTbyBpIHJlcGxh
Y2VkIGl0IHdpdGggb25nb2luZy4NClByb2JhYmx5IHdlIG5lZWQgdG8gdGVzdCB0aGUgZXZpY3Rp
b24gdXNlIGNhc2UgYW5kIGNoZWNrIHRoZSBkZXZpY2UgbWVtX2FjY2Vzcy5yZWYgY291bnQgdG8g
dmFsaWRhdGUgYW55IHByb2JhYmlsaXR5ICBvZiB6ZXJvLg0KVGhhbmtzLA0KQW5zaHVtYW4uDQo+
IA0KPiANCj4gSSBkaWQgbm90IHNlZSBhbnkgZmFpbHVyZXMgaW4gZXZpY3QgdGVzdHMgZnJvbSBC
QVQuDQoNCj4gDQo+IA0KPiBUaGFua3MNCj4gUmlhbmENCj4gDQo+ID4+DQo+ID4+IEJSDQo+ID4+
DQo+ID4+IEhpbWFsDQo+ID4+DQo+ID4+PiDCoMKgwqDCoMKgIGlmICh4ZV9ib19pc19waW5uZWQo
Ym8pICYmICF4ZV9ib19pc191c2VyKGJvKSkgew0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8q
DQo+ID4+PiBAQCAtNzM1LDcgKzczNyw4IEBAIHN0YXRpYyBpbnQgeGVfYm9fbW92ZShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QNCj4gPj4+ICp0dG1fYm8sIGJvb2wgZXZpY3QsDQo+ID4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChYRV9XQVJOX09OKG5ld19tZW0tPnN0
YXJ0ID09DQo+ID4+PiBYRV9CT19JTlZBTElEX09GRlNFVCkpIHsNCj4gPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlOVkFMOw0KPiA+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2RldmljZV9tZW1fYWNjZXNz
X3B1dCh4ZSk7DQo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGRldmljZV9hd2FrZSkNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHhlX2RldmljZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+ID4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+ID4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4gPj4+IEBAIC03NTMsNyArNzU2
LDggQEAgc3RhdGljIGludCB4ZV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdA0KPiA+
Pj4gKnR0bV9ibywgYm9vbCBldmljdCwNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvLCBibywgb2xkX21lbSwgbmV3X21lbSk7DQo+ID4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihmZW5jZSkpIHsNCj4gPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoZmVuY2UpOw0KPiA+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsNCj4gPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkZXZpY2VfYXdha2UpDQo+ID4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHhlX2RldmljZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+ID4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4gPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9DQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFtb3ZlX2xhY2tzX3NvdXJjZSkg
ew0KPiA+Pj4gQEAgLTc3OCwxMCArNzgyLDEyIEBAIHN0YXRpYyBpbnQgeGVfYm9fbW92ZShzdHJ1
Y3QNCj4gdHRtX2J1ZmZlcl9vYmplY3QNCj4gPj4+ICp0dG1fYm8sIGJvb2wgZXZpY3QsDQo+ID4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+ID4+PiDCoMKgwqDC
oMKgIH0NCj4gPj4+IC3CoMKgwqAgeGVfZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsNCj4gPj4+
ICvCoMKgwqAgaWYgKGRldmljZV9hd2FrZSkNCj4gPj4+ICvCoMKgwqDCoMKgwqDCoCB4ZV9kZXZp
Y2VfbWVtX2FjY2Vzc19wdXQoeGUpOw0KPiA+Pj4gwqDCoMKgwqDCoCB0cmFjZV9wcmludGsoIm5l
d19tZW0tPm1lbV90eXBlPSVkXG4iLCBuZXdfbWVtLT5tZW1fdHlwZSk7DQo+ID4+PiDCoCBvdXQ6
DQo+ID4+PiArDQo+ID4+PiDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4+PiDCoCB9DQo+ID4+
PiBAQCAtMTgxMCwxMyArMTgxNiwxNyBAQCBpbnQgeGVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZQ0KPiA+Pj4gKmRldiwgdm9pZCAqZGF0YSwNCj4gPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBib19mbGFncyB8PSBYRV9CT19ORUVEU19DUFVfQUNDRVNTOw0KPiA+Pj4gwqDCoMKgwqDC
oCB9DQo+ID4+PiArwqDCoMKgIHhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7DQo+ID4+PiDC
oMKgwqDCoMKgIGlmIChhcmdzLT52bV9pZCkgew0KPiA+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZt
ID0geGVfdm1fbG9va3VwKHhlZiwgYXJncy0+dm1faWQpOw0KPiA+Pj4gLcKgwqDCoMKgwqDCoMKg
IGlmIChYRV9JT0NUTF9EQkcoeGUsICF2bSkpDQo+ID4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKFhF
X0lPQ1RMX0RCRyh4ZSwgIXZtKSkgew0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVf
ZGV2aWNlX21lbV9hY2Nlc3NfcHV0KHhlKTsNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU5PRU5UOw0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBlcnIgPSB4ZV92bV9sb2NrKHZtLCB0cnVlKTsNCj4gPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoZXJyKSB7DQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4
ZV92bV9wdXQodm0pOw0KPiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZGV2aWNlX21l
bV9hY2Nlc3NfcHV0KHhlKTsNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBlcnI7DQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPiA+Pj4gwqDCoMKgwqDCoCB9DQo+
ID4+PiBAQCAtMTg0NSw2ICsxODU1LDggQEAgaW50IHhlX2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UNCj4gPj4+ICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgeGVfdm1fdW5sb2NrKHZtKTsNCj4gPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV92bV9w
dXQodm0pOw0KPiA+Pj4gwqDCoMKgwqDCoCB9DQo+ID4+PiArDQo+ID4+PiArwqDCoMKgIHhlX2Rl
dmljZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+ID4+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7DQo+
ID4+PiDCoCB9DQo=
