Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68346C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E674488CBF;
	Thu,  9 Nov 2023 15:00:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDC710E8C3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699542046; x=1731078046;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version:content-transfer-encoding;
 bh=3Io+pf1USzqz+PchXv/T+LlTF/BK9ats2zozCcBW5q4=;
 b=Javtk++ZgFrZDdJ8Jvlb7wunsvgQpMu96o9jKclRfEq6XaY3F14QAl1p
 r0egiuwc/r2KerKjaGkHT0/Ezitss8BKS7bmN3nsS3LHJJ8S7qJMJViIc
 WknwmW+PoTBXpxJIaJ/u+EvQz/NASsMb2sTu2A28Z07/LiOl4BKyVmulf
 Fn7Wc0H6dQgMWlQFA9l1hTsZY0B131dX+21vkgh5MzO2MwC8h1s3ZaYUD
 tJj9XiykkUtg+YS6nSWNgAS/Y1aR9BbxKyrk+CyTnHQ11ma+mM8KgZPpE
 Tvd8AhqsM5jP/u+i8DKffKhIHavlNwgmV8NDAoKjWCPZhSdxr/3RQITMi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454301210"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="454301210"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4562073"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:58:52 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:58:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:58:51 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzMK/6jNVvVWFtHWaxowEIR8D+9B5jnu3G9050mCXt2i7UCtXIGIz/Tn7w/evgSpESpALtIXLr71bIxYFMIVSa91nY6ZznDdK+fr7Vq7ZMDFI+06zwOeLuoVUd3zF1/4mpIA2P2d4WAK9rUvZOEeMXeyggWJA578IuaHKyjk0VIRbeZIYlkiOyK0uEG/ODYsX1OKAanQVM2zXqP1lp9voytFHjav3OMNfchZcV6FqiwwzI5+TgQd1CQoSRcZCK7ZXNEX6jg+bvZlZ3nDusU/T0aESUBhMfSahNjODgC6ud58PeH5h9ByWlWNCVnmr9Q1zQ8zG+tLsL0Mysu5ohCTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKSHOYIeyGeqZBXEKxCLFbU0lckRZQD6fMNbBKHiY1I=;
 b=OVdILZpROQy0dB6rLxkCTl5cOfEo0cvJWpBHf7w59T2bbqK78IiVyhzZOFACIf9tjDBooe+KEXnAiv/0ZUi0IcFWdxyFE6q6QscvT9uZBuTglzBcnY0gWHY4a3mlo/8kDKu2NT2Qs+bpNZFPJh7WIZDf5mrTG+iQY3NhIZ/xQmCUT4Ps2xGNLmfj3EQ/wcf1J8pfBSWS3Nxa7LClEXC3djILzVqxyJGorS9GulnGwGXW05wJrDtt6Boi/rqhsQJwSJuN/MipGtkdgYmloBmlzgxF/uTRQ4Q8PW27yptYJwve6jbCIIijhJK8UMa58ebcWWuhFPfTgEBVU17NXmQjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 14:58:49 +0000
Received: from CH3PR11MB8494.namprd11.prod.outlook.com
 ([fe80::6895:75a0:cae5:6fb3]) by CH3PR11MB8494.namprd11.prod.outlook.com
 ([fe80::6895:75a0:cae5:6fb3%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:58:49 +0000
From: "Milczarek, Slawomir" <slawomir.milczarek@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, Tomasz Mistat
 <tomasz.mistat@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Arteaga Molina, Jaime A"
 <jaime.a.arteaga.molina@intel.com>, "Cetnerowski, Adam"
 <adam.cetnerowski@intel.com>, "Chodor, Jaroslaw" <jaroslaw.chodor@intel.com>, 
 "Dunajski, Bartosz" <bartosz.dunajski@intel.com>, "Harasimiuk, Artur"
 <artur.harasimiuk@intel.com>, "Hoppe, Mateusz" <mateusz.hoppe@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>, "Jobczyk, Lukasz"
 <lukasz.jobczyk@intel.com>, "Kasper, Kacper K" <kacper.k.kasper@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Rozenfeld, Piotr"
 <piotr.rozenfeld@intel.com>, "Wilma, Pawel" <pawel.wilma@intel.com>, "Wolny,
 Bartlomiej" <bartlomiej.wolny@intel.com>, "Yates, Brandon"
 <brandon.yates@intel.com>, "Zdanowicz, Zbigniew"
 <zbigniew.zdanowicz@intel.com>, "Dunajski, Bartosz"
 <bartosz.dunajski@intel.com>
Thread-Topic: FW: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support
Thread-Index: AQHaEjcCJWKz3C9WAUSdmbCOc+dmErBwUtkAgAGxZAA=
Date: Thu, 9 Nov 2023 14:58:49 +0000
Message-ID: <CH3PR11MB8494CC467BA08CA3D00B7EE59DAFA@CH3PR11MB8494.namprd11.prod.outlook.com>
References: <ZUtv1eH5uiHl3j9N@tmistat-desk>
 <0c8104df-3c51-95a4-aec1-392b4b92efb9@intel.com>
In-Reply-To: <0c8104df-3c51-95a4-aec1-392b4b92efb9@intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8494:EE_|IA1PR11MB7919:EE_
x-ms-office365-filtering-correlation-id: fa483783-1b39-4699-4621-08dbe1346164
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjOrS5tOvQHeVMTeKPshaqogOCDjvaYh298hwia698/+wUqjHx+D5T2Iihl8QCA0M2564iqCEACkIksczyUwwXyCl9Gbp3Sj6mVvdz6XEzGs460YsfT7YsnYlVGZ6YSjXsRV6IgUeSRduKQsIzbNI5eb0cnp2ZNE0stOm+7WwVty+TOG6faXuSAca/1Vfz66hj1KlHukPn5keLicatW56t00wBCwQq1ZcMBoXt++/R3Qzg/+WkObJWj8NVeMrttdMTr//I8ad36IEQzDwabYMwrG1/clCAu5E7mbdx/zZNAYvMPaYxQBGDu2R8k46eAITHy9ao3dT8sd7CoFFaGlgU8ikpBHMj1AjA8/xKm1cRDIUoFZLwiPfitEMywL3Rrhd85U3582y+kkiUjDYIzsbgAxCzmM77PpXRYOWuV6ARFjd5Koe5pdH7zSZdIy444H/Tzzaliji8oskj4gYmIsSKPHHZnjhfGmcIYkX9OrC9W+Y0nXFxJGoZ7LirWz9wrguUYKx5bwsAjntWCu/RvaLvj3si01IzmyuWRjNlkN+zoa3Qov7lULVFuFbaYnu35mDoLFneuM110o72CPFNh62UtIHg7xe3iWp99B0kKyJMM2Uk46oc0iTR6MP8I8/0qdBUxr8lD/UTASdoFLcrfxVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8494.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(966005)(71200400001)(66556008)(64756008)(66446008)(53546011)(6636002)(110136005)(2906002)(26005)(66946007)(7696005)(6506007)(316002)(9686003)(66476007)(8676002)(52536014)(8936002)(41300700001)(5660300002)(33656002)(122000001)(82960400001)(86362001)(38070700009)(83380400001)(38100700002)(921008)(76116006)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkFvakd5QnJxZHg3RTFQMVdtK1lTY1A3K3VMaTZsYVZrcDNpVWhmMmxpR0M2?=
 =?utf-8?B?cmRwcVk1RlNpVWVLMGU3YjNqamk3TEY3aVRwaUhqQUM2Z0RYaXZHZjFoeEhF?=
 =?utf-8?B?VzdGcGUwWm01MUtGbFd5a0hhQjZJdElzSU1BbHgxcGRBVWhieldlSzIxRkE2?=
 =?utf-8?B?UWcvdnRmaXBQZ2k3SUZzV042Kzl6b0ZsZDB6NDRLbXlxVWxpcnQvVFFUdHJC?=
 =?utf-8?B?T213Mm9FUkFlZnNmekFzTXVXWmx4RWxpSE9tM0l4dm5ERzhNVGJ4QjZXSU1I?=
 =?utf-8?B?eXhtNzVKc3ZjOEU1b2R6cFdTZm02VEY2QWt5Y2hZa2VsUnRvRHVVNkh0UjBt?=
 =?utf-8?B?aUt6S2ZPemlqdzNjdFpCZHFFd1V6TkpwbzkvRUZpcnIyUHMyeXVBS044L3FO?=
 =?utf-8?B?UnFVVUR4cFh2Z3ZrTDRwb05sRGNUWkFYQWpJRitlMi9nYU9STGZleWkxbHpQ?=
 =?utf-8?B?LzVjVWRQeEdKZWtjQ1pTMGhTVzRpSVFvT2J4a0ZrclNYSkhBUVRZSy9kcHJU?=
 =?utf-8?B?b2RtWitONm9aVkVKZmZ2WkxaRlhDMTZrTzdoNlpYZEVDRHVmbmlOVWRjZS8w?=
 =?utf-8?B?dVMrNU03cEgyakVXVmMrMnVqSEw5YUZ1TklhQ3BiQ1JXb3JrUXVDcTZ5bHho?=
 =?utf-8?B?WTZKTitwV3RKck1kWEQ1NHY4TEU5c25SRTJSaEdQU2Rtb3UrUFpwc1pxckw2?=
 =?utf-8?B?WnVwZitVOHhVR1lFckc4d0txSC9jazZUN2dzV2pLMWx1aTQ0SkFFYi9JbU0x?=
 =?utf-8?B?ejhsdUdWREx0azRGYTZLOWRJNEhtZVdvNmRlWHB0Z3R5Uzk2V0NYdEhNcy9H?=
 =?utf-8?B?TTJKZ0ZpMUJzODVKcDgzOUhnTVkxdVZYV3RNd01pUndrSkM5NnhTTDlFbkdo?=
 =?utf-8?B?b1JjbitZc0NHRldrdElNZDBFYnp4NGV3VytBcWxJQ09FSVB1Tm5ocUpTRTdu?=
 =?utf-8?B?ME82TjRXYVh6RUlpUmVWQ2RPUThSVHZmQmtqMmNBSHdYWlJzTmZhdFUzbnhw?=
 =?utf-8?B?ampySnd1TlhnZXRNQmw2MG9TV2xiZW5VUEh5WjZxVEZOSkVmRE5xaVlMemNB?=
 =?utf-8?B?c1FpdnRWeHozSUNKZHVKSEg2QzZZbVovSmNKd1ZvZHRzWDR4N3Q4NnNkVndx?=
 =?utf-8?B?M0dwbEtsbFhxMWxPeUdkUElBQ2kwM1hRejNyY1BNYVhyQVN6UmRVYk1pS1ZR?=
 =?utf-8?B?NXd0VFkvSVNlRS9ob0F3L1VWRVgrd1NENGFrTzU4QnpFMVFQdHJpU3Y5SUhp?=
 =?utf-8?B?K09qMTZxVmM2a2FtMERsSzYybFJqdTZJWGdHSm44K0FsM0RKcVdLWnVuWTJm?=
 =?utf-8?B?ekxxcFF4OTMrMUZxbjlIWW5yeVczWm5qR0svL254L1VwUys0WTBZQktxTy8z?=
 =?utf-8?B?SExWK1VnSUtRNm5jcGtUVHE1YVBGL0gxclVqUkdjc3V3NitheVMxK3JZeXh2?=
 =?utf-8?B?S2ZVYktYaVdNZXFISXRBQnJBYm1OT1BndHRjVWRZOEgrblhndkdQbThpejBM?=
 =?utf-8?B?bU5aRUlvVHdZNGRMY2xUc0dFL3VFQkpCdG8zZG9QcVRBVks3TDhkMWc3eERm?=
 =?utf-8?B?NUtocEtDQk1rY3kvSStPbFE2MzJkUlJpb0lvckI3Z3VZUTE1cWNzcjVUdEVB?=
 =?utf-8?B?QWNVL1ZNMVJOTzRua1hydUxabExUMmptZjJOcEZ3RktlY2Z1WHh5bmlNbFQ3?=
 =?utf-8?B?ME1SN2E0Y3VRRFVlRHQ3c0FzREh5YjBuM0JKVWdZWjJRRUxqeFEyMzhoTStk?=
 =?utf-8?B?a0lIaXJlWGIrTFdHbzQ4eUVPaVB6QVByOHJwSVZ0TzlTeCtPQkZVMDZEbGNi?=
 =?utf-8?B?UVdoYW5BL01WNnZtcVRjOUpsSEc4TEhSNzJmeWU1VmNxRzNZVmsyYmRuMi9Y?=
 =?utf-8?B?MldFSHdrTnpEazdQVC9qZFNZNi9FNWg4UEJ5RHhmaTR6VGx3VlcwN0lFWW5I?=
 =?utf-8?B?TE1tZmFqZi9vTTJzTUdZNDhHUDRpOUMwenp0MklmU0ZiaTAvaS8rQlZsTUdo?=
 =?utf-8?B?MmhJTFV1ZjVQcnRTSUU4YW5WZHIwZmE0ZEhURWVtS3VGOEhkNXlXbmtZQ1Zn?=
 =?utf-8?B?KzUra1pSa2FPVGwvYjdaM0FsWFduSmZTSHk3UEdXMVdoblIrRmU2eTF4UFEw?=
 =?utf-8?Q?xFnL8x36+cbE0dihU/bKACkFo?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8494.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa483783-1b39-4699-4621-08dbe1346164
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 14:58:49.1139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f824a3g943zljrAZfxWjJIqcSYD8zkrjiBR8VUQEtUK5TO4Cm/d8q8sO7vOUa0wVkPcRz6GkWcC7+JFc5Bll3ryZk373y5owyVlmwJZ+C0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
Subject: Re: [Intel-xe] FW:  [PATCH v9 0/3] PAT and cache coherency support
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

SGkgTWF0dGhldywNCg0KSW4gdGhlIGNvbXB1dGUgZHJpdmVyIHdlIGNhbGwgR0VNX01NQVBfT0ZG
U0VUIHdpdGggZmxhZ3MgdG8gc3BlY2lmeSBjcHUgY2FjaGUgbW9kZSAod2Ivd2MpOg0KR0VNX0NS
RUFURV9FWFQoKSBhbmQgbW1hcCgpICsgR0VNX01NQVBfT0ZGU0VUKGZsYWdzPXdiL3djKQ0KDQpT
dGFydGluZyBmcm9tIFhlIEtNRCB3ZSBzaG91bGQgYmUgYWJsZSB0byBhY2hpZXZlIHRoZSBzYW1l
IENQVSBjYWNoaW5nIHBvbGljaWVzIHdpdGggR0VNX0NSRUFURV9FWFQ6DQpHRU1fQ1JFQVRFX0VY
VChmbGFncz13Yi93YykgYW5kIG1tYXAoKSArIEdFTV9NTUFQX09GRlNFVChmbGFncz0wKQ0KQW0g
SSBjb3JyZWN0Pw0KDQpUaGFua3MsDQpTbGF3ZWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEF1bGQsIE1hdHRoZXcgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+IA0KU2VudDog
V2VkbmVzZGF5LCBOb3ZlbWJlciA4LCAyMDIzIDE6MDQgUE0NClRvOiBUb21hc3ogTWlzdGF0IDx0
b21hc3oubWlzdGF0QGxpbnV4LmludGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgQXJ0ZWFnYSBNb2xpbmEsIEphaW1lIEEgPEphaW1lLkEuQXJ0ZWFnYS5Nb2xpbmFAaW50
ZWwuY29tPjsgQ2V0bmVyb3dza2ksIEFkYW0gPGFkYW0uY2V0bmVyb3dza2lAaW50ZWwuY29tPjsg
Q2hvZG9yLCBKYXJvc2xhdyA8amFyb3NsYXcuY2hvZG9yQGludGVsLmNvbT47IER1bmFqc2tpLCBC
YXJ0b3N6IDxiYXJ0b3N6LmR1bmFqc2tpQGludGVsLmNvbT47IEhhcmFzaW1pdWssIEFydHVyIDxh
cnR1ci5oYXJhc2ltaXVrQGludGVsLmNvbT47IEhvcHBlLCBNYXRldXN6IDxtYXRldXN6LmhvcHBl
QGludGVsLmNvbT47IEphYmxvbnNraSwgTWF0ZXVzeiA8TWF0ZXVzei5KYWJsb25za2lAaW50ZWwu
Y29tPjsgSm9iY3p5aywgTHVrYXN6IDxsdWthc3ouam9iY3p5a0BpbnRlbC5jb20+OyBLYXNwZXIs
IEthY3BlciBLIDxrYWNwZXIuay5rYXNwZXJAaW50ZWwuY29tPjsgTWlsY3phcmVrLCBTbGF3b21p
ciA8c2xhd29taXIubWlsY3phcmVrQGludGVsLmNvbT47IE1yb3playwgTWljaGFsIDxtaWNoYWwu
bXJvemVrQGludGVsLmNvbT47IFJvemVuZmVsZCwgUGlvdHIgPHBpb3RyLnJvemVuZmVsZEBpbnRl
bC5jb20+OyBXaWxtYSwgUGF3ZWwgPHBhd2VsLndpbG1hQGludGVsLmNvbT47IFdvbG55LCBCYXJ0
bG9taWVqIDxiYXJ0bG9taWVqLndvbG55QGludGVsLmNvbT47IFlhdGVzLCBCcmFuZG9uIDxicmFu
ZG9uLnlhdGVzQGludGVsLmNvbT47IFpkYW5vd2ljeiwgWmJpZ25pZXcgPHpiaWduaWV3LnpkYW5v
d2ljekBpbnRlbC5jb20+OyBEdW5hanNraSwgQmFydG9zeiA8YmFydG9zei5kdW5hanNraUBpbnRl
bC5jb20+DQpTdWJqZWN0OiBSZTogRlc6IFtJbnRlbC14ZV0gW1BBVENIIHY5IDAvM10gUEFUIGFu
ZCBjYWNoZSBjb2hlcmVuY3kgc3VwcG9ydA0KDQpPbiAwOC8xMS8yMDIzIDExOjMwLCBUb21hc3og
TWlzdGF0IHdyb3RlOg0KPiBjb21wdXRlLXVtZF91YXBpX3Jldmlld190ZWFtQGludGVsLmNvbSxi
YXJ0b3N6LmR1bmFqc2tpQGludGVsLmNvbSxzYXVyDQo+IGFiaGcuZ3VwdGFAaW50ZWwuY29tLHVs
aXNzZXMuZnVycXVpbUBpbnRlbC5jb20sbWljaGFsLm1yb3pla0BpbnRlbC5jb20NCj4gLHRvbWFz
ei5taXN0YXRAaW50ZWwuY29tLHBpb3RyLnJvemVuZmVsZEBpbnRlbC5jb20sYXlhei5zaWRkaXF1
aUBpbnRlbA0KPiAuY29tLGx1aXMuc3RyYW5vQGludGVsLmNvbSxmaWxpcC5oYXp1YnNraUBpbnRl
bC5jb20sZmlsaXAuaGF6dWJza2lAaW50DQo+IGVsLmNvbSxtYXRldXN6Lm5ha2xpY2tpQGludGVs
LmNvbSxrYW1pbC5rb3ByeWtAaW50ZWwuY29tDQo+IEJjYzoNCj4gU3ViamVjdDogUmU6IFtJbnRl
bC14ZV0gW1BBVENIIHY5IDAvM10gUEFUIGFuZCBjYWNoZSBjb2hlcmVuY3kgc3VwcG9ydA0KPiBS
ZXBseS1UbzoNCj4gSW4tUmVwbHktVG86IDwyMDIzMTEwMzE1NDMwOS40MDIxNTktNS1tYXR0aGV3
LmF1bGRAaW50ZWwuY29tPg0KPiANCj4gT24gMjAyMy0xMS0wMyBhdCAxNTo0MzoxMCArMDAwMCwg
TWF0dGhldyBBdWxkIHdyb3RlOg0KPj4gQnJhbmNoIGF2YWlsYWJsZSBoZXJlOg0KPj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL213YS9rZXJuZWwvLS90cmVlL3hlLXBhdC1pbmRleD9y
ZWZfdHlwDQo+PiBlPWhlYWRzDQo+Pg0KPj4gSUdUIGNoYW5nZXM6DQo+PiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNDY2Ny8NCj4+DQo+PiBNZXNhOg0KPj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21lcmdlX3JlcXVlc3RzLzI1
NDYyDQo+Pg0KPj4gR29hbCBoZXJlIGlzIHRvIGFsbG93IHVzZXJzcGFjZSB0byBkaXJlY3RseSBj
b250cm9sIHRoZSBwYXRfaW5kZXggDQo+PiB3aGVuIG1hcHBpbmcgbWVtb3J5IHZpYSB0aGUgcHBH
VFQsIGluIGFkZHRpb24gdG8gdGhlIENQVSBjYWNoaW5nIA0KPj4gbW9kZS4gVGhpcyBpcyB2ZXJ5
IG11Y2ggbmVlZGVkIG9uIG5ld2VyIGlncHUgcGxhdGZvcm1zIHdoaWNoIGFsbG93IA0KPj4gaW5j
b2hlcmVudCBHVCBhY2Nlc3MsIHdoZXJlIHRoZSBjaG9pY2Ugb3ZlciB0aGUgY2FjaGUgbGV2ZWwg
YW5kIA0KPj4gZXhwZWN0ZWQgY29oZXJlbmN5IGlzIGJlc3QgbGVmdCB0byB1c2Vyc3BhY2UgZGVw
ZW5kaW5nIG9uIHRoZWlyIA0KPj4gdXNlY2FzZS4gIEluIHRoZSBmdXR1cmUgdGhlcmUgbWF5IGFs
c28gYmUgb3RoZXIgc3R1ZmYgZW5jb2RlZCBpbiB0aGUgcGF0X2luZGV4LCBzbyBnaXZpbmcgdXNl
cnNwYWNlIGRpcmVjdCBjb250cm9sIHdpbGwgYWxzbyBiZSBuZWVkZWQgdGhlcmUuDQo+Pg0KPj4g
VG8gc3VwcG9ydCB0aGlzIHdlIGFkZGVkIG5ldyBnZW1fY3JlYXRlIHVBUEkgZm9yIHNlbGVjdGlu
ZyB0aGUgQ1BVIA0KPj4gY2FjaGUgbW9kZSB0byB1c2UgZm9yIHN5c3RlbSBtZW1vcnksIGluY2x1
ZGluZyB0aGUgZXhwZWN0ZWQgR1BVIA0KPj4gY29oZXJlbmN5IG1vZGUuIFRoZXJlIGFyZSB2YXJp
b3VzIHJlc3RyaWN0aW9ucyBoZXJlIGZvciB0aGUgc2VsZWN0ZWQgDQo+PiBjb2hlcmVuY3kgbW9k
ZSBhbmQgY29tcGF0aWJsZSBDUFUgY2FjaGUgbW9kZXMuICBXaXRoIHRoYXQgaW4gcGxhY2UgDQo+
PiB0aGUgYWN0dWFsIHBhdF9pbmRleCBjYW4gbm93IGJlIHByb3ZpZGVkIGFzIHBhcnQgb2Ygdm1f
YmluZC4gVGhlIG9ubHkgDQo+PiByZXN0cmljdGlvbiBpcyB0aGF0IHRoZSBjb2hlcmVuY3kgbW9k
ZSBvZiB0aGUgcGF0X2luZGV4IG11c3QgYmUgYXQgDQo+PiBsZWFzdCBhcyBjb2hlcmVudCBhcyB0
aGUgZ2VtX2NyZWF0ZSBjb2hlcmVuY3kgbW9kZS4gVGhlcmUgYXJlIGFsc28gc29tZSBzcGVjaWFs
IGNhc2VzIGxpa2Ugd2l0aCB1c2VycHRyIGFuZCBkbWEtYnVmLg0KPj4NCj4+IHYyOg0KPj4gICAg
LSBMb2FkcyBvZiBpbXByb3ZlbWVudHMvdHdlYWtzLiBNYWluIGNoYW5nZXMgYXJlIHRvIG5vdyBh
bGxvdw0KPj4gICAgICBnZW1fY3JlYXRlLmNvaF9tb2RlIDw9IGNvaF9tb2RlKHBhdF9pbmRleCks
IHJhdGhlciB0aGFuIGl0IG5lZWRpbmcgdG8gbWF0Y2gNCj4+ICAgICAgZXhhY3RseS4gVGhpcyBz
aW1wbGlmaWVzIHRoZSBkbWEtYnVmIHBvbGljeSBmcm9tIHVzZXJzcGFjZSBwb3YuIEFsc28gd2Ug
bm93DQo+PiAgICAgIG9ubHkgY29uc2lkZXIgQ09IX05PTkUgYW5kIENPSF9BVF9MRUFTVF8xV0FZ
Lg0KPj4gdjM6DQo+PiAgICAtIFJlYmFzZS4gU3BsaXQgdGhlIHB0ZV9lbmNvZGUoKSByZWZhY3Rv
cmluZywgcGx1cyB2YXJpb3VzIHNtYWxsZXIgdHdlYWtzIGFuZA0KPj4gICAgICBmaXhlcy4NCj4+
IHY0Og0KPj4gICAgLSBSZWJhc2Ugb24gTHVjYXMnIG5ldyBzZXJpZXMuDQo+PiAgICAtIERyb3Ag
VUMgY2FjaGUgbW9kZS4NCj4+ICAgIC0gcy9zbWVtX2NwdV9jYWNoaW5nL2NwdV9jYWNoaW5nLy4g
SWRlYSBpcyB0byBtYWtlIFZSQU0gV0MgZXhwbGljaXQgaW4gdGhlDQo+PiAgICAgIHVhcGksIHBs
dXMgbWFrZSBpdCBtb3JlIGZ1dHVyZSBwcm9vZi4NCj4+IHY1Og0KPj4gICAgLSBSZWJhc2UsIHBs
dXMgc29tZSBzbWFsbCB0d2Vha3MgYW5kIGZpeGVzLg0KPj4gdjY6DQo+PiAgICAtIENJIGhvb2tz
IGZpeGVzICsgY2hlY2twYXRjaC4NCj4+IHY3Og0KPj4gICAgLSBTb21lIHNtYWxsIHR3ZWFrcw0K
Pj4gdjg6DQo+PiAgICAtIFJlYmFzZSBvbiBYZTIgUEFUIHRhYmxlIGFkZGl0aW9ucy4NCj4+IHY5
Og0KPj4gICAgLSBEcm9wIGNvaF9tb2RlLg0KPj4NCj4+IC0tDQo+PiAyLjQxLjANCj4+DQo+IA0K
PiBJJ20gc2hhcmluZyBkb3duIGhlcmUgcXVlc3Rpb25zIHBhc3NlZCBieSBiYXJ0b3N6LmR1bmFq
c2tpQGludGVsLmNvbSANCj4gbGV0cyBjb250aW51ZSByZXZpZXcgaGVyZSBhdCByZXNwZWN0aXZl
IE1MDQo+IA0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDgsIDIwMjMgMDk6MDUNCj4gU3Vi
amVjdDogUkU6IFtJbnRlbC14ZV0gW1BBVENIIHY5IDAvM10gUEFUIGFuZCBjYWNoZSBjb2hlcmVu
Y3kgc3VwcG9ydA0KPiANCj4gSnVzdCB0byBjb25maXJtIG15IHVuZGVyc3RhbmRpbmcuIFdlIHdp
bGwgaGF2ZSAyIHNlcGFyYXRlIEFQSXM/DQo+IDEuCUZvciBnZW1fY3JlYXRlIHRvIGV4cGxpY2l0
bHkgc2V0IGNvaGVyZW5jeS9jYWNoaW5nIGFjY29yZGluZyB0byBBUEkgZW51bXMNCg0KWWVhaCwg
eW91IGp1c3QgbmVlZCB0byBwcm92aWRlIHRoZSBjcHVfY2FjaGluZyBtb2RlICh3YyBvciB3Yiku
IElmIHlvdSBsYXRlciBtbWFwKCkgdGhlIG9iamVjdCB0aGlzIHNhbWUgY2FjaGluZyBtb2RlIGlz
IHVzZWQuIEFsc28gYW55IEtNRCBpbnRlcm5hbCB0aGluZ3MgbGlrZSBzd2FwLWluIHdpbGwgYWxz
byByZXNwZWN0IHRoaXMgY2FjaGluZyBtb2RlLiBUaGUgY29oX21vZGUgaXMgbm93IHJlbW92ZWQu
DQoNCj4gMi4JRm9yIHZtX2JpbmQgdG8gc2V0IFBBVCBpbmRleCB0aGF0IGlzIGFsaWduZWQgd2l0
aCBCc3BlYyBhbmQgY29udHJvbHMgbW9yZSB0aGFuICMxLiBJdCBjYW4gYWxzbyBvdmVycmlkZSBj
b2hlcmVuY3kvY2FjaGluZyB0aGF0IHdhcyBwcmV2aW91c2x5IHNldD8NCg0KUmlnaHQsIGFzIHBh
cnQgb2Ygdm1fYmluZCB5b3UgcHJvdmlkZSB3aGF0ZXZlciBQQVQgaW5kZXggY29udHJvbCAoYXMg
cGVyDQpCc3BlYykgeW91IHdhbnQgZm9yIGVhY2ggbWFwcGluZyBvZiB0aGUgb2JqZWN0ICh5b3Ug
Y291bGQgbWFwIGl0IG11bHRpcGxlIHRpbWVzKS4NCg0KV2hlbiBjaG9vc2luZyBhIFBBVCBpbmRl
eCB0aGUgY3B1X2NhY2hpbmcgb25seSBtYXR0ZXJzIGlmIHlvdSBjaG9vc2UgYW4gaW5jb2hlcmVu
dCBQQVQgaW5kZXggKGNvaF9ub25lIGluIEJzcGVjKSwgc2luY2Ugd2UgZG9uJ3Qgd2FudCB0byBh
bGxvdyBjcHVfY2FjaGluZz13YiBhbmQgY29oX25vbmUsIHNpbmNlIHRoYXQgbGVhZHMgdG8gc29t
ZSBjb21wbGljYXRpb25zIGluIHRoZSBLTUQuDQoNCj4gDQo+IA0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVs
IFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8uby4KdWwuIFNsb3dhY2tpZWdvIDE3MyB8IDgwLTI5
OCBHZGFuc2sgfCBTYWQgUmVqb25vd3kgR2RhbnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFsIEdvc3Bv
ZGFyY3p5IEtyYWpvd2VnbyBSZWplc3RydSBTYWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBOSVAgOTU3
LTA3LTUyLTMxNiB8IEthcGl0YWwgemFrbGFkb3d5IDIwMC4wMDAgUExOLgpTcG9sa2Egb3N3aWFk
Y3phLCB6ZSBwb3NpYWRhIHN0YXR1cyBkdXplZ28gcHJ6ZWRzaWViaW9yY3kgdyByb3p1bWllbml1
IHVzdGF3eSB6IGRuaWEgOCBtYXJjYSAyMDEzIHIuIG8gcHJ6ZWNpd2R6aWFsYW5pdSBuYWRtaWVy
bnltIG9wb3puaWVuaW9tIHcgdHJhbnNha2NqYWNoIGhhbmRsb3d5Y2guCgpUYSB3aWFkb21vc2Mg
d3JheiB6IHphbGFjem5pa2FtaSBqZXN0IHByemV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28gYWRy
ZXNhdGEgaSBtb3plIHphd2llcmFjIGluZm9ybWFjamUgcG91Zm5lLiBXIHJhemllIHByenlwYWRr
b3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9tb3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVuaWUg
bmFkYXdjeSBvcmF6IHRyd2FsZSBqZWogdXN1bmllY2llOyBqYWtpZWtvbHdpZWsgcHJ6ZWdsYWRh
bmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSBqZXN0IHphYnJvbmlvbmUuClRoaXMgZS1tYWlsIGFu
ZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvciB0
aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gSWYgeW91IGFyZSBub3Qg
dGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVs
ZXRlIGFsbCBjb3BpZXM7IGFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uIGJ5IG90aGVycyBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkLgo=

