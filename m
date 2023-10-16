Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311AECDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 14:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53710E1FC;
	Mon, 16 Oct 2023 14:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042FE10E1F0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697468382; x=1729004382;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zL4g4Z9x3Ea6QwXNRJXpyX+WSwocaDD3v1JqcXCjZ+E=;
 b=JyQdtaXOXZehQAROrCM0H/T0o5IvnKX2GKqbQYl6DFPhwGsu/KjEyTQ/
 0QzV0MFjrN6hGDiWLmLtPJujgsaua0wBFsfA2DQ3TpvZRTZCJ3Ip1sDqi
 sKOkFZYEbPzVPJlDKVR0QuOZHZLLfbDjohB7lJUUgZbUiMYkrOOKZ4V77
 GwluD2IjxXqSYTva9w6Fu3/pO78OVumdiuqyovw64q5INBKwNRR/wDjMF
 zF7WHnh7FEvpebOL4kWMkj99gKo3qFF/aX6ByQeNmwhyvgAn8kp8zluIG
 bbflhDtIOgBYGNEBVW05kpI939g4hheDFG21qJrYElP2EDvtjG0AVcSve Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="452025954"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="452025954"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 07:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1087098365"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="1087098365"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 07:59:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 07:59:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 07:59:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 07:59:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 07:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fam3VMS/2BZwvtenJC4jOSjwVq0Q5j+M3CrhSbI+1prpsjJs2Q2KaFZ5MVLwZ/Mczd6iKDPCM85EZkKqK0xbn76knybg0Ev5E64s4NZqpOUiEphL7MN0sKk0hmra2iReIAoPzyREpO79OZox5o3xbTKP2W50Sz6gNO617zLsrWP6H/+FS28oR6xVHBF5LcZ1EniFD/pVBpf+5I3eX56WQG+cLBvMw9cT6rxq1i+QxMED+MOcWedUkGNpu8WJkjExLtHov/yMqhA8UseohHfQNcT6x1F7ZOkFHrILQzKrB8AlY8zOK4w2Xo0Lv8NEeTyGUvDU+yKEHKT0DIttWcY5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zL4g4Z9x3Ea6QwXNRJXpyX+WSwocaDD3v1JqcXCjZ+E=;
 b=FiFqv44vtgDomt6mnAoHtmnKaqclYwhfP1ZwdHahqnLAjppdc0BQObxWtKbhyfXDryHDUlYBebbHA0f+cWX5ZLmTKHO21CIhsnCx9claSIJ1+Y+6t/ffhV5vNfiRt99ywwC6J6ghfZt7opnxOIVG6VPGWtc0aXQ48pfkfBncj+h0gJxMYyJtkiV9hd3wbIUgfF1mMZRgCdrPJ6qRQV2ETb/4b0aVZNq8kZsoif/43zjX39BNccDnf2L6TeOD8l32HJPE53sT3XSwrh2C/vJIUO8Bvtxyj+OLyuiS2hDueKzyGDhLcIC1wCSKPTudbRIHl7UMBXH5LADUAmnspxEE8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 14:59:37 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 14:59:37 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 2/2] drm/xe/display: Add writing of remapped dpt
Thread-Index: AQHaAECW1jhg7Vrz3EKUOP59V0HTZLBMgZdw
Date: Mon, 16 Oct 2023 14:59:37 +0000
Message-ID: <IA1PR11MB64187E4465B3630A7EE6971FC1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231012135209.403827-3-juhapekka.heikkila@gmail.com>
 <5b377d00-3047-7aab-b606-25cd89b1d801@gmail.com>
In-Reply-To: <5b377d00-3047-7aab-b606-25cd89b1d801@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SN7PR11MB7539:EE_
x-ms-office365-filtering-correlation-id: a566f90b-0bbb-4aa8-3160-08dbce588451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aHP7B7dDmpmxe5yG31z7cgq8uRne+3xQdDd+JUVBxDYOKt2GnnpJU3oi4n/tMf3bjCQWjhM8t8pYWvzCWvfpF1lF2rkqyvlg3FkdhCzW55AUrXzHAtwRIUPq7xv0hdAaL8qD7nYSRwZlJfMMxswbATrHXXX+28US1SpYMyKOsAKOxB/SJvWZ0FIZJzfUFsNpED/Ao7zfQkoL82usAkc6fSfelEk97zQBlRnjIPXv1SQ2oNsJ3A87XTmHc1AtlnDntHIKXeb/RMc1FcleEiBgT+AbOHGOes6zzlS10QRiy6MHgwB2Skt6o+PFkhk75YDJ6X4Nt4Jf2EoOtkqyoExgHr5+s+yOiUlusfOA1gtfS42JK1GL7hGLqEpnBX//xSbY2iQHBTYo0h+vIhztNd2NADY+GiWxvJ0TmrTnIg3Wag3wz0i7MsoQ4yHKARok1tyBkjdxhbJqL5Gq3kZCv0/ZR6SQ9110UpTVCcOn0VuZFwBDiDlX8rUo7mubZOUz/OGZmQFd3NK+woc3p7GMHrD7kRImV7JN6NDr+yVajdKuO8g0ccx9T2dzABqBSDBBVQaD1sqVQZBCxaMbSuFAKFblHLmrNGWWzjlUyhpk31l7g/oe2J5eeAmnGpqqgmE2icoE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(66476007)(64756008)(66556008)(66446008)(8676002)(8936002)(110136005)(76116006)(66946007)(316002)(41300700001)(5660300002)(52536014)(478600001)(2906002)(71200400001)(86362001)(7696005)(6506007)(33656002)(55016003)(122000001)(82960400001)(9686003)(26005)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1NPdjhoS0FRVmhJU0NWd3o1d1MxVTFXdnFHR3Q2U0lpZzhQUUsxTlcxUkdS?=
 =?utf-8?B?b2hLSUlpR21TY2gvWlJDb2hjWjB3K2gzcFRtYno4bFFTQVc4dnpiaUhDa2Vi?=
 =?utf-8?B?VjZROWpVUFFucktqbG9QM1g0SnFZaE1PZk9ZZTRBbVNmam5jYVZUQXNPeXZL?=
 =?utf-8?B?aWpqTER5T2JZWXhRM0JBUkkwM2ttbW4vVExzalVjSEQ1MkdvWGMwQUJZVHhp?=
 =?utf-8?B?Z28yOUNZTEJqeVc1cEJkNHB0R0hieDJJSFNaRjRhazBjY0tjVDJXTDZ0TFRN?=
 =?utf-8?B?KzBJYmhPbC9KaFkwUUI3bGJZd2l3RTFlak45OFNlWDJCSHJUcGV2a3dsS3pE?=
 =?utf-8?B?VFJCajRCSWlLNTJqaHF0UkRoUVVxdTdXUlhyYk1xQ2xMRzV0dlVDSC9XNXVy?=
 =?utf-8?B?emdkWkIvN3ZzRUprdXp3MzRIVjVaZC9CVXBsdlRsSVQrY21sODljU0JsbmdN?=
 =?utf-8?B?MC90cFhRUitPald1R05vRC9Pc1lqM0pkK0xySjBjQ2lqU2lXekFMRDA4UEpx?=
 =?utf-8?B?WU44QzNHUVBQQ3Q0dkpvMUl2a1BVUkVoQXVQM0NkL3hHQkg5SWhFNGVsTEdF?=
 =?utf-8?B?RU1VY3dSKytUUjZTNlNVbWIvWndDK0xZdnBvNWhJbnM1azZORU5qQ0tnRFVK?=
 =?utf-8?B?d3g1MlB4SkkwbXdFcy9sT1Q2TnI5Sm5ZZW9wOE8rM0UzbjFPeHpQOGVsdWxW?=
 =?utf-8?B?S0JyblpURGYxQUFtRDJtT3BxSUZRVnVHOVhkdGgzeDlrTXV1RlArbDBsdk1S?=
 =?utf-8?B?S3lNaXNlKzE2WU40ckV1SUt1V2dCVVZkQ3lxV0Z5bDBFUFlLVUpBc0JQbmdm?=
 =?utf-8?B?Wm1EZS93T2RpdUVUNW1vTERxS3Q2OGJENjNVbnRmVVpNSkRSRmhFTCtVY09P?=
 =?utf-8?B?aXhHUk5tR3hNZDJkVnArMzFaRi9OUE5wdy9CR0RObVFMZDRvNFRoOHA2bGwv?=
 =?utf-8?B?SHMwQVQ5bGFiREx0TjJVenVXdDVBWnhobjVaQ0o4VGlSMndRYk5Qb2M1Vjlj?=
 =?utf-8?B?cWxUd1dMa3RsL21ob2Y0YVFCS1k4VWd4SjMvSWc1M2EzMkRrWVZPaWg0bFB0?=
 =?utf-8?B?TFhTSVBmaHJ3U21jNmZ3Skl3YzV0YjFhVkovZWdNN291MnFlNUticGs2Y0FF?=
 =?utf-8?B?d2EvUDNkSElOSEI0MHFJV21ZT2F3U1RsQWtsWjlnMzdSeGlUeENWd25EazBs?=
 =?utf-8?B?UFFUSHlTUFhoYmpQMmk0KzMyY3BRellXMlVBQmVkQWR2TXJOLzYrN05pSXZa?=
 =?utf-8?B?cHZYeGwydEVuN1dWa0NhWXpYR0VYa0liY1UyR1ZDVStSdWFDV3VpcTFFMVJR?=
 =?utf-8?B?b2xvSnZMYlVJeUZoYXpIc0xQUXk2SHFQV1lnalNPZEp2eE42SHZaaWhJYXZ6?=
 =?utf-8?B?TmZ2c3Awd2FpQXVkTlB6YUpqZ3NKWTF0ZGM1SEZxU2VZL0VMV3ZjLys4QXBI?=
 =?utf-8?B?VmhaUER4WHYzNGtRNFJ2Tmd3YUFYSG5GRCtUOXJXZVBCNzNBRW1TKy9vSVVw?=
 =?utf-8?B?em15aWxnMjhrQmFCMXRPZlpPVlk5Y1ZSQnVNKytmLzFBV0FSem5QRmQrU01v?=
 =?utf-8?B?aUZOeWtmc0M5VjBUTmlxY3dEYzZhRmc1VktkeFRVZ0RncDJnOXNPS2xGNW4y?=
 =?utf-8?B?dHBCaDRTT05QbWJpYldvL05DSnRYVm96SlZqS2dzZGgvQ0Z6c0F3YlUvRUJn?=
 =?utf-8?B?aXVCVm9tQmVPd3pmdk8wU1lFM1JVMlF3Z2pqTkMwSUg3RkxzVk1Ma0dXdHZW?=
 =?utf-8?B?RGlBL3hYRksyS3Zaa01DUFZkdnplVDVpY055d0hkTmpmTTZzWHhEbnBFbmQ3?=
 =?utf-8?B?cFcvZ3dYSis3Q0FCMTZqcy9tZ1JTOVRQVXVpZFA0VGpjNGgyS2RFcGN5VzlJ?=
 =?utf-8?B?ekoyV2J4UmdoMjIza0hGK3V5cVZGeGVwTVluN0RIQi8rcmxNQVEwVnZkNmI4?=
 =?utf-8?B?Y21FK29iZXJ1clk1cUNCNnhzdFlZbXQ5UlJNcHhEcTVPVVR3RTNDZDlrKzlU?=
 =?utf-8?B?aGJqTnVxZ0NhUkVjVGp5QUZ3M1VDdllxWWJhNG9vQzNrQW92clVCQzJjUlAy?=
 =?utf-8?B?Y29UWFV5UE0xcG5nV3d2UENsMDY4L3pkTTJDN1dIUCt4bnVYVGpIZjVxNVVM?=
 =?utf-8?Q?LHJKC48+jACmfXRNgJ8gzkdhi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a566f90b-0bbb-4aa8-3160-08dbce588451
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 14:59:37.5221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqArjLHlUu/TMbYeATKw4Nu12p5LXYkCMrmtHzmQbIs4ZbYa3E9ZHy8+if+mKVcM2yq6yGawawe+rdG/3Se6UhDwZ9jkqnRO+b23rMXNq+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 2/2] drm/xe/display: Add writing of
 remapped dpt
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj5TZW50OiBNb25kYXksIE9jdG9iZXIgMTYs
IDIwMjMgMTA6NTQgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+DQo+U3ViamVjdDogRndkOiBbUEFUQ0ggdjYgMi8yXSBkcm0veGUvZGlzcGxheTogQWRk
IHdyaXRpbmcgb2YgcmVtYXBwZWQgZHB0DQo+DQo+WGUgbmVlZCB0byB1c2UgcmVtYXBwZWQgZGlz
cGxheSBwYWdlIHRhYmxlIGZvciB0aWxlZCBmcmFtZWJ1ZmZlcnMNCj5vbiBhbnl3aGVyZSBlbHNl
IHRoYW4gREcyLiBIZXJlIGFkZCBmdW5jdGlvbiB0byB3cml0ZSBzdWNoIGRwdCBhbmQNCj5lbmFi
bGUgdXNhZ2Ugb2YgcmVtYXBwZWQgZGlzcGxheSBwYWdlIHRhYmxlcyB3aGVyZSBuZWVkZWQuDQo+
DQo+U2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxh
QGdtYWlsLmNvbT4NCj4tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bp
bi5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPi0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPmIvZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZmJfcGluLmMNCj5pbmRleCA4OWNmNjVjNTgxOTEuLmZmZDM1YTU5ZjQwNSAx
MDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPisr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+QEAgLTQ1LDYgKzQ1
LDM3IEBAIHdyaXRlX2RwdF9yb3RhdGVkKHN0cnVjdCB4ZV9ibyAqYm8sIHN0cnVjdCBpb3N5c19t
YXANCj4qbWFwLCB1MzIgKmRwdF9vZnMsIHUzMiBib18NCj4gIAkqZHB0X29mcyA9IEFMSUdOKCpk
cHRfb2ZzLCA0MDk2KTsNCj4gIH0NCj4gICtzdGF0aWMgdm9pZA0KPit3cml0ZV9kcHRfcmVtYXBw
ZWQoc3RydWN0IHhlX2JvICpibywgc3RydWN0IGlvc3lzX21hcCAqbWFwLCB1MzINCj4qZHB0X29m
cywNCj4rCQkgICB1MzIgYm9fb2ZzLCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUzMiBzcmNfc3Ry
aWRlLA0KPisJCSAgIHUzMiBkc3Rfc3RyaWRlKQ0KPit7DQo+KwlzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSA9IHhlX2JvX2RldmljZShibyk7DQo+KwlzdHJ1Y3QgeGVfZ2d0dCAqZ2d0dCA9IHhlX2Rldmlj
ZV9nZXRfcm9vdF90aWxlKHhlKS0+bWVtLmdndHQ7DQo+Kwl1NjQgKCpwdGVfZW5jb2RlX2JvKShz
dHJ1Y3QgeGVfYm8gKmJvLCB1NjQgYm9fb2Zmc2V0LCB1MTYNCj5wYXRfaW5kZXgpDQo+KwkJPSBn
Z3R0LT5wdF9vcHMtPnB0ZV9lbmNvZGVfYm87DQo+Kwl1MzIgY29sdW1uLCByb3c7DQo+Kw0KPisJ
Zm9yIChyb3cgPSAwOyByb3cgPCBoZWlnaHQ7IHJvdysrKSB7DQo+KwkJdTMyIHNyY19pZHggPSBz
cmNfc3RyaWRlICogcm93ICsgYm9fb2ZzOw0KPisNCj4rCQlmb3IgKGNvbHVtbiA9IDA7IGNvbHVt
biA8IHdpZHRoOyBjb2x1bW4rKykgew0KPisJCQlpb3N5c19tYXBfd3IobWFwLCAqZHB0X29mcywg
dTY0LA0KPisJCQkJICAgICBwdGVfZW5jb2RlX2JvKGJvLCBzcmNfaWR4ICogWEVfUEFHRV9TSVpF
LA0KPisJCQkJICAgICB4ZS0+cGF0LmlkeFtYRV9DQUNIRV9XQl0pKTsNCj4rDQo+KwkJCSpkcHRf
b2ZzICs9IDg7DQo+KwkJCXNyY19pZHgrKzsNCj4rCQl9DQo+Kw0KPisJCS8qIFRoZSBERSBpZ25v
cmVzIHRoZSBQVEVzIGZvciB0aGUgcGFkZGluZyB0aWxlcyAqLw0KPisJCSpkcHRfb2ZzICs9IChk
c3Rfc3RyaWRlIC0gd2lkdGgpICogODsNCj4rCX0NCj4rDQo+KwkvKiBBbGlnbiB0byBuZXh0IHBh
Z2UgKi8NCj4rCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMsIDQwOTYpOw0KDQpUaGUgdXNlIG9m
IDQwOTYgaGVyZSBpcyB1bmNsZWFyLg0KDQpTaG91bGQgdGhpcyB2YWx1ZSBiZSBYRV9QQUdFX1NJ
WkU/DQoNCklmIG5vdCwgb3IgdXBkYXRlZCB3aXRoIHRoaXMgdmFsdWUsDQoNClJldmlld2VkLWJ5
OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCg0KDQo+K30NCj4r
DQo+ICBzdGF0aWMgaW50IF9feGVfcGluX2ZiX3ZtYV9kcHQoc3RydWN0IGludGVsX2ZyYW1lYnVm
ZmVyICpmYiwNCj4gIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgaTkxNV9ndHRfdmlldyAqdmlldywN
Cj4gIAkJCSAgICAgICBzdHJ1Y3QgaTkxNV92bWEgKnZtYSkNCj5AQCAtNTcsNiArODgsOSBAQCBz
dGF0aWMgaW50IF9feGVfcGluX2ZiX3ZtYV9kcHQoc3RydWN0DQo+aW50ZWxfZnJhbWVidWZmZXIg
KmZiLA0KPiAgIAlpZiAodmlldy0+dHlwZSA9PSBJOTE1X0dUVF9WSUVXX05PUk1BTCkNCj4gIAkJ
ZHB0X3NpemUgPSBBTElHTihzaXplIC8gWEVfUEFHRV9TSVpFICogOCwgWEVfUEFHRV9TSVpFKTsN
Cj4rCWVsc2UgaWYgKHZpZXctPnR5cGUgPT0gSTkxNV9HVFRfVklFV19SRU1BUFBFRCkNCj4rCQlk
cHRfc2l6ZSA9DQo+QUxJR04oaW50ZWxfcmVtYXBwZWRfaW5mb19zaXplKCZmYi0+cmVtYXBwZWRf
dmlldy5ndHQucmVtYXBwZWQpICogOCwNCj4rCQkJCSBYRV9QQUdFX1NJWkUpOw0KPiAgCWVsc2UN
Cj4gIAkJLyogZGlzcGxheSB1c2VzIDRLIHRpbGVzIGluc3RlYWQgb2YgYnl0ZXMgaGVyZSwgY29u
dmVydCB0bw0KPmVudHJpZXMuLiAqLw0KPiAgCQlkcHRfc2l6ZSA9IEFMSUdOKGludGVsX3JvdGF0
aW9uX2luZm9fc2l6ZSgmdmlldy0+cm90YXRlZCkgKiA4LA0KPkBAIC04OSw2ICsxMjMsMTggQEAg
c3RhdGljIGludCBfX3hlX3Bpbl9mYl92bWFfZHB0KHN0cnVjdA0KPmludGVsX2ZyYW1lYnVmZmVy
ICpmYiwNCj4gICAJCQlpb3N5c19tYXBfd3IoJmRwdC0+dm1hcCwgeCAqIDgsIHU2NCwgcHRlKTsN
Cj4gIAkJfQ0KPisJfSBlbHNlIGlmICh2aWV3LT50eXBlID09IEk5MTVfR1RUX1ZJRVdfUkVNQVBQ
RUQpIHsNCj4rCQljb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfaW5mbyAqcmVtYXBfaW5mbyA9
ICZ2aWV3LQ0KPj5yZW1hcHBlZDsNCj4rCQl1MzIgaSwgZHB0X29mcyA9IDA7DQo+Kw0KPisJCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHJlbWFwX2luZm8tPnBsYW5lKTsgaSsrKQ0KPisJCQl3
cml0ZV9kcHRfcmVtYXBwZWQoYm8sICZkcHQtPnZtYXAsICZkcHRfb2ZzLA0KPisJCQkJCSAgIHJl
bWFwX2luZm8tPnBsYW5lW2ldLm9mZnNldCwNCj4rCQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtp
XS53aWR0aCwNCj4rCQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS5oZWlnaHQsDQo+KwkJCQkJ
ICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uc3JjX3N0cmlkZSwNCj4rCQkJCQkgICByZW1hcF9pbmZv
LT5wbGFuZVtpXS5kc3Rfc3RyaWRlKTsNCj4rDQo+ICAJfSBlbHNlIHsNCj4gIAkJY29uc3Qgc3Ry
dWN0IGludGVsX3JvdGF0aW9uX2luZm8gKnJvdF9pbmZvID0gJnZpZXctPnJvdGF0ZWQ7DQo+ICAJ
CXUzMiBpLCBkcHRfb2ZzID0gMDsNCj5AQCAtMjEyLDEyICsyNTgsNiBAQCBzdGF0aWMgc3RydWN0
IGk5MTVfdm1hICpfX3hlX3Bpbl9mYl92bWEoc3RydWN0DQo+aW50ZWxfZnJhbWVidWZmZXIgKmZi
LA0KPiAgCWlmICghdm1hKQ0KPiAgCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCj4gIC0JLyog
UmVtYXBwZWQgdmlldyBpcyBvbmx5IHJlcXVpcmVkIG9uIEFETC1QLCB3aGljaCB4ZSBkb2Vzbid0
IHN1cHBvcnQuDQo+Ki8NCj4tCWlmIChYRV9XQVJOX09OKHZpZXctPnR5cGUgPT0gSTkxNV9HVFRf
VklFV19SRU1BUFBFRCkpIHsNCj4tCQlyZXQgPSAtRU5PREVWOw0KPi0JCWdvdG8gZXJyOw0KPi0J
fQ0KPi0NCj4gIAlpZiAoSVNfREdGWCh0b194ZV9kZXZpY2UoYm8tPnR0bS5iYXNlLmRldikpICYm
DQo+ICAJICAgIGludGVsX2ZiX3JjX2Njc19jY19wbGFuZSgmZmItPmJhc2UpID49IDAgJiYNCj4g
IAkgICAgIShiby0+ZmxhZ3MgJiBYRV9CT19ORUVEU19DUFVfQUNDRVNTKSkgew0KPi0tDQo+Mi4y
NS4xDQoNCg==
