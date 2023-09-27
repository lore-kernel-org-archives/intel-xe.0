Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C6E810C1
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5926C10E4DE;
	Wed, 27 Sep 2023 10:45:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946A910E4D9
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695811532; x=1727347532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gl50OzeMmk89U91UinTvKlvam5MMVqViV/LnxSCRHUw=;
 b=eFUj+FXMCISwTc/Lbr86amq7rdZpBooVuifnkbz1k56yP3KGHeEwEjf/
 ZokxbnG1V6Jhr3kGEgy38q3mq5zgQISU7vPWVHjQhnHC2GWiJLyIPYkeO
 SnI8JXc6rmV4ugOptUh8zfs0FlcCH8nAwYD/ZZJ75o6uG1Tdk630Lh2Ai
 ewkzbe3lfD4LXYSWSksBvnh+3N6VC1NtfNAfzYadH/VuJRQoo3x3w40nG
 zX4Unq/coz/is6Wa78xeYkA757o+reUuLe4eCJoInVaWcVaANT7ALk5fr
 5f1YNEJV9wJoxjxsut/Q3f5Nb8Vhq+Z/nEdLcvKuoPLVNEyCv0Qh7yCSU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372136079"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372136079"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080104921"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080104921"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 03:45:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:45:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 03:45:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 03:45:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 03:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9eSih7lIndYxPlBR8V3mB/rEu9B/iNf5fMQrMkEFu5d9JvoWkL2GN4mPJ9EJ+190j9RRTPWk2/7qjS+0RYNNFVdRN6iqPQ+p0KYMt8Co4SzzQvHrRZUYaqNv9tPmIOc+FCqE+OyWu/oCQyG9dORlL45OPS9JxflzVnyQ/RaEqIRd0sQ0TizfwB0bzFFblM/K+dXn2X8HrDmrT0iDy7Y1SRHO8J5R4H0p/RWkoYGGibxHM5MKvjvwHn/9bpojlMeL7OM6OjiaJXI3LdHpH+mDvA3fwbbOIndFW07gNDIx3jU4uMqtP8OmSZyLmBdA1+O5EyJvGFAuQiXOjxckx2bjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl50OzeMmk89U91UinTvKlvam5MMVqViV/LnxSCRHUw=;
 b=C1lEH/BXPqjaUsp9EzXlDvQDC8EdmiU+nZfJvpBFSiQ5nOs8eIkZ12YnuDsMAIpz+1vyk2Devdsz0heAGfLCj61fvsIk29/WwE1gmi7hpHans86brOnkHiYdfV/CleGJSCkw7LyRuKL4yGrcu+KoNtRyzREAq9kAyszQ9YKLNmBWP/G/EMy4vpCvrGxw0TlrG+hLpvrQ4STSWHvsbNBJprTETty5X/3k3FOOcHKYIvlgNK/9/MO/x2ipcm5CVzdTRFB0OG4sHomZwn9t5ZcIO5VBC4/4RXV3mL/S3ZhDnhf9UtS0MhBf0dZ1YG6qc1457N6bd2HFNWePDWlISNfsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM4PR11MB5375.namprd11.prod.outlook.com (2603:10b6:5:396::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Wed, 27 Sep 2023 10:45:28 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6792.026; Wed, 27 Sep 2023
 10:45:28 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [RFC PATCH 0/3] Xe dma fence handling on atomic commit
Thread-Index: AQHZ8RSx7xsxwvkxfEavit+3eP74xbAuehSAgAADNoA=
Date: Wed, 27 Sep 2023 10:45:28 +0000
Message-ID: <2fd37d47aacb192f9d4b4e8491743323536f364c.camel@intel.com>
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
 <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
In-Reply-To: <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM4PR11MB5375:EE_
x-ms-office365-filtering-correlation-id: c2e77cad-b337-4ab7-4e89-08dbbf46dd4f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JKCC0+LfAMsvCMQvjSMlP86sYEzrQ5IgL3rZulc88jyI9BK/pAwakLGeiZetETYZL9YStNQfC95UxOZeATGjemq0HJljI0hZalIUQz99dp1JMeympj4J5zajdJNzMf0mWbPb4777BQGLncfTkcls5ew/wu2LUwoUG9JDvqltHw/83yLwFqOHH4Kncb5Qg776Wli4kQmneCGADRk88wOVgW9CXjjpmUa6FAdQaRS4fxH06gGqCfn3XdTS9YJkndoQ33QK1NPY/DVgYzaxNfjeYejiMY+VbRG3SJg4BNrBh56AcugjHP6nQoLXy1GrLrPI4+8LdBNW+LQCZsz6JYRzNXplnBTsRaviC3kPnTK7hLaXMjVQgWX+nkB2yGOU+VmSzx1FIQrdljG4QPxh9aPyZORnCALoCX0S3Gfwndu/MNpiPOLG4gceCx1hmcAuKS6ATVKJmE79thN8wWAGJh55fP1qEz9p8v6A69jEXHw80osAAzFTstDbFXRLu21cV5TL9KLe4FRCM++lFmc0vhTYNn0Vf5OauKIcjl4OWew2srz5eCPXU/oIICeeryxJ3AX4xCWZ/6+Estz5febpmtgPSqb7oi0wNxomAh9ml/KQ4i0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64756008)(5660300002)(122000001)(76116006)(82960400001)(8936002)(4326008)(8676002)(38100700002)(83380400001)(38070700005)(41300700001)(66556008)(66946007)(54906003)(66446008)(66476007)(26005)(316002)(91956017)(66574015)(110136005)(2906002)(86362001)(6486002)(6506007)(6512007)(53546011)(71200400001)(478600001)(36756003)(966005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVZ4TWh6c1lJWit2QjhQcllKMG9FSkZyc1NGdTRLRVBDVkZxaGVleWg5UFRH?=
 =?utf-8?B?dkxkZ3ArQ3d2RzZvQVdTQ3Y5RS9hVjBjR1ZHVktmRTMrNHZiSXk4YkY5OGtp?=
 =?utf-8?B?bERxVmhkSnppK1FZb2lMQy9yN0RJN2orMHZmSVhzeW53RGh4alpkbkVFU05I?=
 =?utf-8?B?bHFqVzc4SzFiSWpBbytJdkVXRjlqRUVGUVBTbGlxQVpMNjNuNzBWUUZJR2Uy?=
 =?utf-8?B?S1RwOUFWWjB2SG5KUC9xUUlpc1p3ODIyakg0RzhLMXJQU01tMW9yNkQ5VWhD?=
 =?utf-8?B?czlKckxTbnRmZXg3Wk82N0VINzFSSUNPd3NDKytBcDZlb0haK2JJVnhGbWI1?=
 =?utf-8?B?UTdGd2UvbFR5eW0rYjNhM1FSWVYyTzBKcEp4dlIwdHE2VzlQbWZ1VDhPYk1n?=
 =?utf-8?B?cVJiUnlOSnpoZTVYQktMOWVkZ3dzV3FZSDVsN0JSalNBVU9NRlJTQXV4K1Vy?=
 =?utf-8?B?MGxlVlJlOTVtbkdkTlZ6bEx3WEVJLzdzbTAvRldvYzFmUVR2azQrYXRxNmJP?=
 =?utf-8?B?VTM1RlE5MjJ2ZUVteGxpb1NPSWpBV3U3WmxxeDMxOGM5ZEFnbG5MYXlMUlh2?=
 =?utf-8?B?UXNmVVpkRHZrczFWTVpnekxzUUR2cyt5ZUlCa1h5anpIdUFZRDl3aW5mOEZN?=
 =?utf-8?B?OVVOZThFMTNhWldyYzJuY2U4MzB5MFp6SE0rL2I0endlR2xRaEdIQjNsRzlS?=
 =?utf-8?B?Mjhqb2dpY3FIeWZVblZLNlZ1SjZMYUxiVFBSQy9rTEgyak1TVlhmR3R4RUdN?=
 =?utf-8?B?ZjZER3N4eEI3UUJaZFpFa0IwbFdsVTJRa280SHFzWkphRDFTMlVVaEd6M0s0?=
 =?utf-8?B?bXVMY3g3c2VJbjRVRGtDdHZSaWl3Q2hYUVhIVVNHS0N3amduYVJOS2p2MTBh?=
 =?utf-8?B?Vnl0THFkUVFuUGcyanNYL24za05nOEczNnNOd0tGM3A1TG5hVnBYSU9XaFV2?=
 =?utf-8?B?V1UyN0RnNWxnSFpEaUpHdHY2WGEzbStQZHB5cUM1Z0JDQml0RE84dmUvK1Vs?=
 =?utf-8?B?R0lkSzBqYkpEbnJTSmhYOENqUDRyWTRTSzF2bDJja3JCbi9XTkFabFVLZWRo?=
 =?utf-8?B?UGY2c0tHMXZSb2NGNTEvZXdXYjNzaklVV1MySVJVcnIzVEg4bnY4WWJXWVBG?=
 =?utf-8?B?NTJKM1JScXVycTFPQ1FXSmsxZUdYQWJKKy9FcWV6MCtIb0lFTGVFdW1uZmtF?=
 =?utf-8?B?RTgyU2h5ZmViTXhWOWRjcW9KNFExdFN4WmUvcjYrbnV5YTUzakdHN2JKMWcy?=
 =?utf-8?B?MW9Td2FrRTd3OHVlQ3k4QVBOUUJhUFlxYWdLMkllVDY4L0t1cWxMTEJiRGFk?=
 =?utf-8?B?L2d0K3hRdkwrSVI2MHVGY0R5cC9hWUEvcDFESEtzc1JNOXJSNTNYYkZSZmpx?=
 =?utf-8?B?VUJydzlzV0wwdzY0c1dLYStjbll4K0xvbUhDWUk1MWdKMEFPYjJxV1l3WmJF?=
 =?utf-8?B?bnkzNk9pTVlwOXZ2Zk5WbnJrek5CWmdjVzQvVmJ3OXBlMDRzd2Uya2NkSEVw?=
 =?utf-8?B?S0N4ZS9GUjY2ZHlBSmVld1c4d0lWbG9oU0dFWVBBRXVCZlVOSWJCNmg0clVF?=
 =?utf-8?B?SDZJd212OTZSMTBzTHU1dlE2UjZaamlWQzAvZFptcHVnd2RjUktRQ1U0QmFj?=
 =?utf-8?B?SVNQUTB5aDRBWjQ5UGhTQkUrZVBSWGNlNmJBbDJpWlRCUDZrcTF1eG8wU1F0?=
 =?utf-8?B?NDJjZUlXMzY1cjByejRtVTRtN0FlL0tscXNBbnFIYlNZd2h4aFpmTFFlY2s2?=
 =?utf-8?B?VG5YWW1hYmJFenhGSTR3akk0WXgva084TDlJQXJuMXErUDk1WlkxV1NGRU40?=
 =?utf-8?B?cnVucTlKanZBdnpOdXJQTmhzbnNKczIxaFZkZDFoVi81dkltM1lTN09Eem1t?=
 =?utf-8?B?MFYrb01aRlpaWDlsbHR3QmlOdFNZOUV4b1I0NlZ1ZEVHWHVqWllhMi9SS1c1?=
 =?utf-8?B?VW9LQ1lHK0NSU1BQZm1YWFFFTjdBWENtRlpmbDhudHpEME9FUGNaNlRGVG4y?=
 =?utf-8?B?MXNQdERub2RNbWZNZjlOWmN2ek1kRjhoRzMrWUdFR3g5MlJSdEl3dEc3Y0hL?=
 =?utf-8?B?cVMyUXNaNEVVZ0RTUzkvZUFBb1NHWHFmMjFKNWhDeVRvTmlaQXhZZEdFZWRk?=
 =?utf-8?B?QkMvU2RBQk02VC9CQjZpNjREVDdVY3dUaE9CMlBkU1dtbXZySlUvL1dVNVVY?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AC0B23BF5D76E4FB9CE84AE25876583@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e77cad-b337-4ab7-4e89-08dbbf46dd4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 10:45:28.4019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQ7RGG3BNo0UCKWbqEPVqc0SU5rnt5CAal1cg91Jc8sE2OSzsmiRo/HFP96GvCSQtwMra47Vjl7kurq8fbiJ9V1A6Y8k+K+j2OKUL84LpO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: "Nikula,
 Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTI3IGF0IDEyOjMzICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gSGV5LA0KPiANCj4gV2hlbiB3ZSB3cm90ZSB0aGUgb3JpZ2luYWwgZGlzcGxheSBzdXBw
b3J0LCB3ZSBwdXJwb3NlbHkgZGVjaWRlZCBvbg0KPiBub3QgDQo+IGFkZGluZyBpOTE1X3N3X2Zl
bmNlIHN1cHBvcnQuDQo+IA0KPiBJbiB0aGlzIGNhc2UsIEkgdGhpbmsgYSBiZXR0ZXIgYXBwcm9h
Y2ggd291bGQgYmUgdG8gcmVtb3ZlIHRoaXMgY29kZSANCj4gZnJvbSBpOTE1IGFzIHdlbGwsIGFu
ZCBlbmQgdXAgd2l0aCBjbGVhbmVyIGRpc3BsYXkgY29kZSBmb3IgYm90aA0KPiBkcml2ZXJzLg0K
DQpZZXMsIEkgYWdyZWUgZXZlbnR1YWxseSB0aGlzIHdvdWxkIGJlIHRoZSBnb2FsLiBJIGRpZCBz
b21lIGV4cGVyaW1lbnRzDQpoZXJlOg0KDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvNTU4OTgyLz9zZXJpZXM9MTIzODk4JnJldj00DQoNCldoaWNoIGlzIHJlcGxhY2lu
ZyBpOTE1X3N3X2ZlbmNlIHdpdGggc2FtZSBjb2RlIEknbSB1c2luZyBmb3IgWGUgZHJpdmVyDQpp
biB0aGlzIHBhdGNoIHNldC4gVGhlIHByb2JsZW0gaXMgR1BVIHJlc2V0IGRldGVjdGlvbi4gSSBk
b24ndCBoYXZlDQpjdXJyZW50bHkgZ29vZCBpZGVhcyBob3cgdG8gdGFja2xlIHRoYXQgd2l0aG91
dCBjb21wcm9taXppbmcgaTkxNQ0KZnVuY3Rpb25hbGl0eSBpbiB0aGlzIHNjZW5hcmlvIC0+IGVu
ZGVkIHVwIGRvaW5nIHRoaXMgb25seSBmb3IgWGUgdG8NCmVuc3VyZSB0aGlzIGlzIG5vdCBibG9j
a2luZyB1cHN0cmVhbWluZyBYZS4gV291bGQgdGhpcyBiZSBhY2NlcHRhYmxlIGFzDQp0ZW1wb3Jh
cnkgc29sdXRpb24gdG8gYmUgc29sdmVkIGFmdGVyIHVwc3RyZWFtaW5nPyBBbnl3YXlzIHdoYXQg
SSdtDQpkb2luZyBpbiB0aGVzZSBwYXRjaGVzIGlzIG5vdCByZWFsbHkgYW4gaTkxNV9zd19mZW5j
ZSByZXZpc2VkLCBidXQNCnVzaW5nIGRtYV9mZW5jZXMuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5k
ZXINCg0KDQo+IENoZWVycywNCj4gfk1hYXJ0ZW4NCj4gDQo+IE9uIDIwMjMtMDktMjcgMDk6MzEs
IEpvdW5pIEjDtmdhbmRlciB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNldCBpcyByZXZlcnRpbmcg
Y3VycmVudCBjaGFuZ2VzIHRvIGZlbmNlIGhhbmRsaW5nDQo+ID4gZHVyaW5nDQo+ID4gYXRvbWlj
IGNvbW1pdC4gQSBuZXcgY29tcGF0aWJpbGl0eSBoZWFkZXIgYWRkcmVzc2luZyBsYWNrIG9mDQo+
ID4gaTkxNV9zd19mZW5jZSBpbXBsZW1lbnRhdGlvbiBpbiBYZSBpcyBpbnRyb2R1Y2VkLiBUaGlz
IGhlYWRlcg0KPiA+IGNvbnRhaW5zDQo+ID4gZG1hIGZlbmNlIGhhbmRsaW5nIGR1cmluZyBhdG9t
aWMgY29tbWl0IGZvciBYZSBkcml2ZXIgYW5kDQo+ID4gaW50ZXJmYWNlcw0KPiA+IGFyZSBmb2xs
b3dpbmcgY3VycmVudCBpOTE1X3N3X2ZlbmNlIGltcGxlbWVudGF0aW9uLg0KPiA+IA0KPiA+IEFk
ZGl0aW9uYWxseSBjaGFuZ2UgdG8gY3VycmVudCBhdG9taWMgY29tbWl0IGNvZGUgYW5kIGk5MTVf
c3dfZmVuY2UNCj4gPiBpcw0KPiA+IG5lZWRlZC4gVGhpcyBwYXRjaCBoYXMgdG8gZ28gdG8gaTkx
NSB1cHN0cmVhbS4gSXQgaXMgbmVlZGVkIGR1ZSB0bw0KPiA+IG1pc3NpbmcgR1QgcmVzZXQgc3Rh
dHVzIGluIFhlIGRyaXZlci4gSW4gY2FzZSBvZiBpOTE1IHRoaXMgc3RhdHVzDQo+ID4gaXMNCj4g
PiBwb2xsZWQgd2hpbGUgd2FpdGluZyBmb3IgZG1hIGZlbmNlcyBhbmQgaW4gY2FzZSBvZiBHVCBy
ZXNldCBhdG9taWMNCj4gPiBjb21taXQgaXMgY29tcGxldGVkIGV2ZW4gaWYgZG1hIGZlbmNlcyBh
cmUgbm90IHNpZ25hbGxlZC4gSSdtIG5vdA0KPiA+IHN1cmUNCj4gPiBob3cgR1QgcmVzZXQgaXMg
c3VwcG9zZWQgdG8gYmUgaGFuZGxlZCBpbiBjYXNlIG9mIFhlPyBNYXliZSBkbWENCj4gPiBmZW5j
ZXMNCj4gPiBhcmUgc2lnbmFsZWQgaWYgR1QgcmVzZXQgb2NjdXJlcz8NCj4gPiANCj4gPiBDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4g
PiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4g
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiANCj4gPiBKb3Vu
aSBIw7ZnYW5kZXIgKDMpOg0KPiA+IMKgwqAgUmV2ZXJ0ICJGSVhNRTogZHJtL2k5MTU6IGZlbmNl
IHN0dWZmIg0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxheTogTW92ZSBmZW5jZSBjb21wbGV0aW9u
IHdhaXQgYXdheSBmcm9tIGRpc3BsYXkNCj4gPiBjb2RlDQo+ID4gwqDCoCBmaXh1cCEgZHJtL3hl
L2Rpc3BsYXk6IEltcGxlbWVudCBkaXNwbGF5IHN1cHBvcnQNCj4gPiANCj4gPiDCoCBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2F0b21pYy5jwqDCoCB8wqDCoCAyIC0NCj4gPiDC
oCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuY8KgIHzCoCA1MCAr
LS0tLS0tLQ0KPiA+IMKgIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMu
aMKgwqDCoCB8wqDCoCAzICstDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19m
ZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyOCArKysrKw0KPiA+IMKgIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfc3dfZmVuY2UuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICsNCj4g
PiDCoCAuLi4vZ3B1L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmggfMKgwqAg
MSAtDQo+ID4gwqAgLi4uL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9zd19mZW5jZS5owqDC
oMKgIHwgMTExDQo+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgNyBmaWxlcyBjaGFuZ2Vk
LCAxNDUgaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQo+ID4gwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS9jb21wYXQtaTkxNS0NCj4gPiBoZWFkZXJzL2k5MTVf
c3dfZmVuY2UuaA0KPiA+IA0KDQo=
