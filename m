Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D654C25B67
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 10:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE6410E971;
	Fri, 27 Oct 2023 10:18:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B607510E971
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698401881; x=1729937881;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=66pFvx1ffU5eMofuyZFC0XMH/7oF+Tdn+mLNXYoociE=;
 b=Sz3RCom3WIyLZ1xk+akMWPGj+A04FiUJ6ZnlefygpaaoUJ512usVBx2k
 OSk1j9Kl7yZau6zIbSM/lB14o4NSGrjx1EikdQxtUmWcWjFouwh5xtEM4
 emFiPLPC8sAcXbAXzQ6KCTD5uNgJ3sOEjKHH1Kn5o3DhVYGYx/B5Ng3+F
 GVl/ycYd4PvQWBHI7VyfNXgHytyhiPivvx6XotOUlTnLpHYtX61Wj9UmZ
 U7fMph+NYU0uSngREv83iYYvvpm9ROscoeMbLHY4Gi1AXL3KUep5byJ9G
 fMb5hiH99sKE/kQY9Z6xoBZU3qgoIxOfkqQykO2vlRTyBvqOtZVF7gcBD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387563039"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="387563039"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="850204323"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="850204323"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Oct 2023 03:17:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 03:17:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 03:17:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 03:17:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 03:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgIhWCuId/ZjuhW7r/tTkRH4byqmyTTcbSfPtJeEdhH2vb7aMRBegSKfagjhQUn9YNMm/81Ci6uVSCO0ZqGLW8+sUpuhs04DTGIIjLRpDsXDybzMZ4x1nEsIIwJ7xw/XBroi3GosPuFl90IfPzCqS/mLc1rF79OLLYUwD99fytZ1nmB502shNBUaaXkUjlZ3E+uG8pLMuE9D5ydA47okklhTGpRw0HmPyBnkImqSYYuHYVWuPo/++aw0YWZSu+ADjP7kSH6Xhz/GKOjIgTzEsoj6Y0h/zWOo6XD7z0Fp9KQLHi6dnEWTefKw3/G3HcYOSUkqacfqxgchGQtHyRwS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66pFvx1ffU5eMofuyZFC0XMH/7oF+Tdn+mLNXYoociE=;
 b=obkz2Rx9cYfP2MF1f8bIbG6INcVLXw56jfnm4qbxD4eho+503INhHM3j97gFv2fPueLUKBZ06cUNMG0X9RY82JII8aBV3LQQ8bz+MKEzSuSNYERTeYbXvX0y3vOLIa0nitW+CO9U+LCgvQc3UcHSkjCY9e6ZnYnjJmGx6EXyNs/yt8CkVq7DlDOHfjZyjBdeweVpceLdQmIF7WD3EmKOFvQ6goU6nQezl9dRIOW+IMANP43a9yaMPdjqsEU8JDUdvzmtDKVPmmAMEbl+s5xw5YaimBG+OH5Lhuic3+d0HY9vl51bn/+uziUHgZpHVJVJM14PVcUARUtXLST7ljauBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 10:17:56 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 10:17:56 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [06/10] revert intel_frontbuffer changes.
Thread-Index: AQHaCL7aOaYrOLHA9kG/KFn0o9X9jA==
Date: Fri, 27 Oct 2023 10:17:56 +0000
Message-ID: <f1e3e455d7b775aabcf0ef5d518a0387f433e426.camel@intel.com>
References: <20231025102045.817068-7-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231025102045.817068-7-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB7613:EE_
x-ms-office365-filtering-correlation-id: d282c26c-961d-4251-cb1e-08dbd6d5fd0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PkygyqvWX6fANkM3VwkvjDcqkJ5/8444u6jRwDcjhggU6tHVvaf+cegzunySa+SUyxqAurUcCXgXayiN12PThir5IQ5LJsyAlPr3p1vWMPE0iHc4BWvxB7UMRbSF3oRQ7pLv9cGKbyJTGHtTEPsReJ+pNffM/BsFyVlSPDPM5Slv2Uab1BvOdMsJem32FEYhPIntzkfdH56Qoj0zUsWFZFt5d6fCZ1Enc+yDEXAhjbX9fzMCbcFJjPFSbh6ObMkkAwqYquNNBSGgTIXtk+l8/mWCW8PgSZm8ovSu3yF/mNiHeOKb/wnfqfWZnnHQp8GBz7lOGDWeFC6jEnN7air4eEGFYfzlZ08RusoCIc3VYBcza2g0Ruo+TP8J4EJKs5svnEZNYddb9QmzYBij1IUAjWAeM7T1i8JQ1vDq6s11uTHao4FTZsAD+1MTNZ48WCp3IXA0T3pXRPEyfOR0CIqx9YFXLoGzC2TFtHOs/LQwCseKgIs7Hw4eMbst3jK+AmubPfWUzM1z2QXiTGWNI0wmDc/p9cGV9lGEsep0+W1YmeY9fcYosJNCqHjzctZ3VQBtkJ4fDLXO+3S+IcXB23s+6Iog+moHsJYZuOG7B2MaHCSkc06zZ0Zs2yiVZ3aGGFWo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66476007)(2906002)(86362001)(38100700002)(41300700001)(64756008)(122000001)(66446008)(76116006)(478600001)(91956017)(71200400001)(110136005)(6506007)(66946007)(316002)(66574015)(66556008)(6512007)(6486002)(83380400001)(82960400001)(36756003)(5660300002)(2616005)(8676002)(8936002)(38070700009)(26005)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTdTUlVmYTJpM2ZSM3QzTlYraFVpZy9mQk9OMFE1M015c1plbFZ2Z3kxL3Zz?=
 =?utf-8?B?bHoxbUV2QlJ1QWFzN3ZqSk40aVJEVVJNcUVJUXR3dlljcjk4TEkxRXFlWnk5?=
 =?utf-8?B?RGQ0b0NWRDFRbDhkekU1SlRvRDlSQmtkT0VXNGV2TFdaSENuY1owUTYrUUNG?=
 =?utf-8?B?OWwzanlicS9nNTFrdzJ3N0dtVFJnbVN1ZDJrbnJPNEljdWkxQlZlQUdUb2Fh?=
 =?utf-8?B?clJzbjJ6bk9NNzlXa3Qvc2xwQkhKVzdwZVQxQU5JYWdBWGlra1RmYnAzeGR2?=
 =?utf-8?B?bnFvcUJnM2JRdi9zaFZlUFZ6SXhOaTdrbGVabGYvSWxHZzZ3dlJSczk5N21H?=
 =?utf-8?B?ZXJxZDBlMXluOEl3Ky9ESlZ0blBtODdNTGtoczZxdlJ0WUR6eVNWcHJGeXZa?=
 =?utf-8?B?T3NzRmgwcytSNm1aSElOSzZ4RlN0OG50SHhTdksra0tnVEJ4WTQvUDFmenY3?=
 =?utf-8?B?SE9TakZCT245QmxKZDExU2dja3NtMXgvdmVacUkwZG1kdG51c1VBb3BxZmFn?=
 =?utf-8?B?OG1JL3FXYkJSZlIzVVcreDdVWHhVd0k4U2FlWENxd0V5dkYxVC9oZmpOc21Z?=
 =?utf-8?B?YnFZMDc3ZmlGdlNhWXlabjRmdDRPelAwOWtPaHVQZ3ZmbGRlTWg3Z0oxaWtZ?=
 =?utf-8?B?aytKQ3R1em52ZUs1SStaN1lTa2lGemNyNStxR2Q3cU9MNktZRjJkcFdLOVo3?=
 =?utf-8?B?UXp4SWQ1ZlQ1Q0FVN29kVUEySTBTY1RhckdDT3VxSHdINEJieGh0RHdKVWoy?=
 =?utf-8?B?ZjgrSlFGbC9DSmE2M0hMbGtWeVNvQ2dJdkxTWG0xRERJVjhzMXZOeHhmbm9Z?=
 =?utf-8?B?YVkrOVpQUDBPYmdONjVJSXdLem1mTU5PVTV6Sk10Y2tBQ0lrZkx6RXpXbE5i?=
 =?utf-8?B?NUlIWXJ0UER0RzF6b2Yxd0dXa0R5bWpoS2ZBTjZEeGFMQ1RCcHQrZGQ5Y2c2?=
 =?utf-8?B?OEJDTGFydGpTVTlaZzVxdDAyckhrTGY3SWdqUlFqY3ZCdlVIZ3FZOUdCeWVa?=
 =?utf-8?B?dEhjaVU0TGtobENIRytpQkxQQnErNWxtNkVtR1pDQm1mVE9md0J1OEhoOXFu?=
 =?utf-8?B?a0l1cE90T2RIbmxsMHhObjcvbUk0WWFJMzRDSktjRTh3VFhicWFHTEZtOTFC?=
 =?utf-8?B?eDViWjJWb1lsdTRKV1lpL1MwWXJheDY0cE93MG81V0tUdkRMbzBiQ1pwZ0ZV?=
 =?utf-8?B?ZWhFQlZ0WE1iNWtyd1Vua0dIQXMrek1yOVRGcmxZcmkwVHBBQnFJVG1aMWZP?=
 =?utf-8?B?VWxQYTJRN0FMRHdnZ05hR3phUE1tOVZTaXkwVGMrM3Y2S2Z0TXhmaGM4LzBY?=
 =?utf-8?B?VVc1cXN4eHUzcEpUY2VYTjBqNG1MUUNlYi82Vmc0WFNId0ZiaUJheGFpMEtP?=
 =?utf-8?B?RDJ5YnhzZE1CSzZYbTloRitoSVgyOG1Uckg2cUQ4YWN1OWpGcXEweFB4R0lO?=
 =?utf-8?B?K2NhaWF3MkRRRU8reGhXWmVSZll1UnZmcisrWVRxRWhJSXFiN3RhNHZWRXZ4?=
 =?utf-8?B?REozaWVuZUNneXhraFJWRjhOaWd5WmhNVFA5NHliWThPK3NWMU0rTG5nUEcv?=
 =?utf-8?B?MEhOSDlEUk9OQzFsazRhWFU2ZFdXKzdQWXlTci9XSTR6OUpDbjM1MS9OeUxz?=
 =?utf-8?B?ZWg3QmZmajNxRUhYZ2VtZHhOUWo5bHlIZ2xPM21jQ0tXMHZDdUZ1cHE1L1k3?=
 =?utf-8?B?d2RWUExTK0FZZnJ0MXFvMjZZOXJEUjNISTA2VHBQUkd6L2RxQnRBelZrYkhp?=
 =?utf-8?B?UmRrTTJRcmc5VlpyUmxnWUxpZzFLcVNrTGdyeHo4VkdkODVBL3hLaTFnQVFz?=
 =?utf-8?B?R1FnK1FNUHZ4ZDZvaElxdXRiUGEzUnFoVUsvL3BCdmFWbjZhWWFtckVQOFZi?=
 =?utf-8?B?aTZRV0s0d3JiemFCN0Q3eVdYOVBmVjYyNWhoMjNySFo5QWJaeFhrZEpvT0xB?=
 =?utf-8?B?cXJSbDhrM0ZLejd2ZzVMQldZanU2R1JkNjBWMHFrTHZIUzR0dGZvRk9hNjVW?=
 =?utf-8?B?YXlnNHA2N1dpMUd1WWNubVI1d055Zi9sRUdqR3Q2blpzbTRWTVhTQWd2dzdQ?=
 =?utf-8?B?YkllY3lCUTJRM3pFeFN6WkNnMlhtN3Q3Q1BOTlVQSFNwV0t2REZmTDNNNjM1?=
 =?utf-8?B?K2RYZUFZdis2eEJvS2VEcVhlVnV0ZEFSVUw5K0tFNEl5ZnZaT0FJb0RGTHlH?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65D3575241C40042BADF60146F6FD576@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d282c26c-961d-4251-cb1e-08dbd6d5fd0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 10:17:56.4640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHqnApAotEBlNBZ3oEhdV2HYUMb3ZYpdBX8Via6moXIzj+7jbz5eLjRteVe8n/QOzvbQqelxsiUqLmOWgdSVvNjIpNj8YAL/uPxoQ+rEaf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [06/10] revert intel_frontbuffer changes.
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

T24gV2VkLCAyMDIzLTEwLTI1IGF0IDEyOjIwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSwganVzdCB0aGluZ3MgcmVtb3ZlZC4KCkhlbGxvIE1h
YXJ0ZW4uCgpJbnN0ZWFkIG9mIGludHJvZHVjaW5nIGNvbXBsZXRlbHkgbmV3IHBhdGNoIEkgdGhp
bmsgeW91IHNob3VsZCBjaGFuZ2UKdGhpcyBhcyBhIGZpeHVwIHBhdGNoIGZvciAiRklYTUU6IGRy
bS9pOTE1L2Rpc3BsYXk6IFJlbWFpbmluZyBjaGFuZ2VzCnRvIG1ha2UgeGUgY29tcGlsZSIKCkJS
LAoKSm91bmkgSMO2Z2FuZGVyCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmMgfCA3ICsrKystLS0KPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuaCB8IDQgLS0tLQo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZm
ZXIuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mcm9udGJ1ZmZlci5j
Cj4gaW5kZXggZDY0Y2U1YmZlY2E4Mi4uMmVhMzdjMDQxNGE5NSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmMKPiBAQCAtMTkwLDcg
KzE5MCw3IEBAIHZvaWQgX19pbnRlbF9mYl9mbHVzaChzdHJ1Y3QgaW50ZWxfZnJvbnRidWZmZXIK
PiAqZnJvbnQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVu
dW0gZmJfb3Bfb3JpZ2luIG9yaWdpbiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGZyb250YnVmZmVyX2JpdHMpCj4gwqB7Cj4gLcKgwqDC
oMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBpbnRlbF9ib190b19pOTE1
KChmcm9udC0KPiA+b2JqKSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUgPSBpbnRlbF9ib190b19pOTE1KGZyb250LT5vYmopOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoGlmIChvcmlnaW4gPT0gT1JJR0lOX0NTKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzcGluX2xvY2soJmk5MTUtPmRpc3BsYXkuZmJfdHJhY2tpbmcubG9jayk7Cj4g
QEAgLTI1OSw2ICsyNTksNyBAQCBzdGF0aWMgdm9pZCBmcm9udGJ1ZmZlcl9yZWxlYXNlKHN0cnVj
dCBrcmVmICpyZWYpCj4gwqDCoMKgwqDCoMKgwqDCoGRybV9XQVJOX09OKCZpbnRlbF9ib190b19p
OTE1KG9iaiktPmRybSwgYXRvbWljX3JlYWQoJmZyb250LQo+ID5iaXRzKSk7Cj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgaTkxNV9nZ3R0X2NsZWFyX3NjYW5vdXQob2JqKTsKPiArCj4gwqDCoMKgwqDC
oMKgwqDCoHJldCA9IGk5MTVfZ2VtX29iamVjdF9zZXRfZnJvbnRidWZmZXIob2JqLCBOVUxMKTsK
PiDCoMKgwqDCoMKgwqDCoMKgZHJtX1dBUk5fT04oJmludGVsX2JvX3RvX2k5MTUob2JqKS0+ZHJt
LCByZXQpOwo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9jaygmaW50ZWxfYm9fdG9faTkxNShv
YmopLQo+ID5kaXNwbGF5LmZiX3RyYWNraW5nLmxvY2spOwo+IEBAIC0yODksMTIgKzI5MCwxMiBA
QCBpbnRlbF9mcm9udGJ1ZmZlcl9nZXQoc3RydWN0Cj4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2Jq
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9u
dGJ1ZmZlcl9yZXRpcmUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEk5MTVfQUNUSVZFX1JFVElSRV9TTEVFUFMpOwo+IMKgwqDCoMKgwqDCoMKgwqBJ
TklUX1dPUksoJmZyb250LT5mbHVzaF93b3JrLCBpbnRlbF9mcm9udGJ1ZmZlcl9mbHVzaF93b3Jr
KTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoHNwaW5fbG9jaygmaTkxNS0+ZGlzcGxheS5mYl90cmFj
a2luZy5sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgY3VyID0gaTkxNV9nZW1fb2JqZWN0X3NldF9m
cm9udGJ1ZmZlcihvYmosIGZyb250KTsKPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2soJmk5
MTUtPmRpc3BsYXkuZmJfdHJhY2tpbmcubG9jayk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChjdXIg
IT0gZnJvbnQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJlZShmcm9udCk7
Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gY3VyOwo+IMKgfQo+IMKgCj4gQEAgLTMzNyw3
ICszMzgsNyBAQCB2b2lkIGludGVsX2Zyb250YnVmZmVyX3RyYWNrKHN0cnVjdAo+IGludGVsX2Zy
b250YnVmZmVyICpvbGQsCj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAobmV3KSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9XQVJOX09O
KCZpbnRlbF9ib190b19pOTE1KG9sZC0+b2JqKS0+ZHJtLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBkcm1fV0FSTl9PTigmaW50ZWxfYm9fdG9faTkxNShuZXctPm9iaiktPmRybSwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YXRvbWljX3JlYWQoJm5ldy0+Yml0cykgJgo+IGZyb250YnVmZmVyX2JpdHMpOwo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljX29yKGZyb250YnVmZmVyX2JpdHMsICZuZXct
PmJpdHMpOwo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuaAo+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9mcm9udGJ1ZmZlci5oCj4gaW5kZXggMDA0NjdkNTEzZTc0ZC4uYWJi
NTFlOGJiOTIwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Zyb250YnVmZmVyLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Zyb250YnVmZmVyLmgKPiBAQCAtMjgsMTAgKzI4LDYgQEAKPiDCoCNpbmNsdWRlIDxsaW51
eC9iaXRzLmg+Cj4gwqAjaW5jbHVkZSA8bGludXgva3JlZi5oPgo+IMKgCj4gLSNpZm5kZWYgSTkx
NQo+IC0jaW5jbHVkZSAieGVfYm8uaCIKPiAtI2VuZGlmCj4gLQo+IMKgI2luY2x1ZGUgImk5MTVf
YWN0aXZlX3R5cGVzLmgiCj4gwqAKPiDCoHN0cnVjdCBkcm1faTkxNV9wcml2YXRlOwoK
