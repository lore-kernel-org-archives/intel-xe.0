Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782F2C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9F10E199;
	Mon, 13 Nov 2023 21:41:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2A110E199
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699911675; x=1731447675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BXBorm9Ax8QzQF2Qn7jXLfAsQL08KItEyjMycLaatY4=;
 b=SD8dd/QDX9sQd2rIORsnQDSruuvy3o9j926lIc79Y34pMOVSuWFsw1LU
 5VG4fjzbbdR6OkN1Pf6f4O2GphtSxFb0NkzVByuq+Mc8mlbvgzydjh3fT
 kGF0VPf/qgncGQ2zpYDBUJ43RO92OAnlgHKfe6HI2410ZqEklum6XTP/2
 4claxzRkJSplR6mneCuZROrfmerq4Lc2mp/WC4mm6C1Ke3t6Cl4EUq87e
 wL2Szg6AtywiHlX6mvJEQ4RB8Jdz54BAhb/sODfXDxFTvYMpqxZeH0imx
 z07GIGJgLz7M1Ov+R/Uz5GqkM5JDf0SXJCdWpQTC6vTP6vBCQ1VFuPHJF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387682409"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="387682409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1095866632"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="1095866632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:41:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:41:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:41:13 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:41:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:41:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiHgO00O6mJIIPHUslIDVPvwQpyEdD6BN3f0WVg58pwDeDQSYKrvFKhqt9YShQ1EJbGSM/jB+tTmTORvWXhW7+zy7jmlurxWukZEztUKqiR0h7XuWXmRuZBntTaArofGDh942vAOnCSNtKr1Ve4ixb6Wur81tIimfLZwDhliWpiRmv5+n9lqChK/i+lmtPACEiQSx6BOp7B7BnM7RIyUPbLmnIq1WB4qRfrUjXt+hgT6lzgGFZhYeFsAAz5EVzWJTKFjQ6BTj8RXchyx8FMMr4lQED/5lcCJgcY5IOpn6QAvJZKrx0hw30aptfqaTuFSyBqae31qMUC1lxcf7wdq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXBorm9Ax8QzQF2Qn7jXLfAsQL08KItEyjMycLaatY4=;
 b=dIIAcsDn+zTtsWp8twKONdvbQ6cPdPh8w8+E4ACVmfQEhMzChZLU5Wm0fAo/61RK9vPajY/shvNaDZDV5pGUCrikIbF6UEnvtFua2aiIRkj8nXBz+jajpp9u7SgTetfrX1wS3hAiq1wQf+v2cP08Y50N0S6ECO0mCxiUKJIzZ1ZFHOZxcUbstNLUwQYe9IvWLPFyj4Em1za16d5PN2E+ZOhbWfsSm0PYZw1bUEWxRLIpnAocouqxcLaAEo3f9iI+AgvVXGfRXqcjV3zH/Pz718niFJrnzRrymTq77lrvMYtOc1dn9VYLpWqUsaldOA4JmbEmmOkZ6gRNdoiK3xnWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5181.namprd11.prod.outlook.com (2603:10b6:a03:2de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:41:11 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::78d8:6f60:e1a1:7b15%6]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:41:11 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Maarten@mblankhorst.nl" <Maarten@mblankhorst.nl>
Thread-Topic: [Intel-xe] [PATCH 1/4] drm/xe: Add uapi for dumpable bos
Thread-Index: AQHaBnTp5AIpE2DrkU6wTdluVU8WF7B451CA
Date: Mon, 13 Nov 2023 21:41:11 +0000
Message-ID: <a21675dc43a85f298107f04b3e99aae84766e920.camel@intel.com>
References: <20231024122256.19512-1-dev@lankhorst.se>
 <20231024122256.19512-2-dev@lankhorst.se>
In-Reply-To: <20231024122256.19512-2-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5181:EE_
x-ms-office365-filtering-correlation-id: efd63378-4581-42fc-c2a9-08dbe491411a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gS/t+swBc0ac2TGgxEAIgOSA4Y1jAy/N259sB7SLjwarmrWa6IX5AwXGlv+0NOoCiFqMdJMxk3RBNLwXYlgEwkbn4NWk2BwlQ3E5JJSQKdlS7oO3krZGTOraJKTx0DIiQw7IaszjiofRugu4Shqq9a1HCtwI4yGvzjN6XvlJuss1CZTxVlPEypnI9DPkyzFYM9D5mZ4weQwp+DcMGZQqxE80Yt+QeZtMpaGc2saJ53gr1RFy+WcB11Sccpa0MdBMtBUbI8xNsJljvWDbacvmQntwn4ClUkm1JkqQmyW86RqFAe2/0hB8nG1RNircMwJeOMlRsIN/hR0pzhzvxTN8KyXJsUHUF7+9/2bgResFdPdQOMAsdP9D2RDO/5GV4JOImpwPmSRSecBypq9ObFF6wWAvUBR+adb48HUU12GysjoZJ8ccAuHkZ75Cg+3Fer24TMG2QTrqdwhKHnW48U//KxbB1dOYbVTi9ACC7uYYUXVTXmhgtRZ6tEKtYl1YMk7W7Ou9wAW5sE9GtLleqHK7F/uqoK9YtPdxn6rJzfyjmKyofz25mRKz9jJXsSH+htpR2kYqUnZrudeJ1vN2GpOkjWcvxmMMnohDO2tA1RLXJX+bFwAWFjAM46E6XN20/t+N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38100700002)(2616005)(122000001)(8676002)(8936002)(4326008)(6512007)(6506007)(83380400001)(26005)(82960400001)(6486002)(71200400001)(478600001)(91956017)(110136005)(66946007)(76116006)(66476007)(64756008)(66446008)(66556008)(316002)(38070700009)(36756003)(41300700001)(2906002)(5660300002)(86362001)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVlFZHFNY0lYamV1VFQrYWlJOGJ4QTlaelhORFVSdjQ1M3c4bU95aTFuQ3ZB?=
 =?utf-8?B?QzJMQ29iaUlVNTJsNUZuYk5WOEdTRzg5QS9TUjJBVVZQcUlpKzh3VUttaFg2?=
 =?utf-8?B?Sk1mT0FLNWwrWEJSZ29iZHlQOFN3Q2toTCtUNlFGRHF0VGE1bTJSSXhraURa?=
 =?utf-8?B?ZVhmNFZ5cHkzVXpnelc4a0ZPMXpnZldCdW1lVm0zMDB0ckNPMWQrdlIrSE1x?=
 =?utf-8?B?eUJ4L2xsT2JkQWZpVXRySWRaazNJdW1mNUxKQmtBTnVpV1NWL1RNYjg1ek9T?=
 =?utf-8?B?UVA3OHMyL3pGNkNVNnMyYjhKR2ZIZjhRaVloOXNEM1ZEMFlwdytOb1ErZjNB?=
 =?utf-8?B?ZXJESTdhYUhVMWRER0ZCWVdTSGQwdC9sVmVKb0djYlhZYjB1L0Z2dmtKNTlX?=
 =?utf-8?B?NUtJUGZxZXVsRmdwSzQrTThVMklBMGYyeVczUTBTZDhYRGxhaCtWa3dEamF0?=
 =?utf-8?B?Y2Qwb3NybHlaL1VXR09zemRBdWpkTmxPcVpkNWpCaDRJeDNPNmV6VERBV1Ey?=
 =?utf-8?B?Y1A5ejVnTjEwaFNEYlFvVVRXZGFIUUlrbi8vU2ZTMEZsaytkT01EL0dxZi8v?=
 =?utf-8?B?bFprTVRqakhUb096YlNwamp4MVh1UCs5ZEoxL3BQaDFYS2xGS0IzaDZLdlYz?=
 =?utf-8?B?cEdOdEZvL3p0WDRDSDRQRHh4eTMxeUFmT0gxWU1BOEVVSzhhQTBpSGk5Z21X?=
 =?utf-8?B?ajhLOG1QOTUrYy9kaUk2VDNnb3VvejNRV0NzbFBaZC9SR21KZTAxZ3EyQTR2?=
 =?utf-8?B?WmdMd2dQanFRaWVmWHBiU2VLNi9OcjBmUGJWVTAzUHlMSldnMTJJK1hvSEhK?=
 =?utf-8?B?dlNzZEM1SzNCR0VOell1VnFQcVRMUVpQakIzb2hyNFNXOE1SS3JZdlJOWEJq?=
 =?utf-8?B?UE5vQSsxbnZ1V0dHaGdmR1VBOHYrWTEybm02OXc3aGpGQTR4aVJQbXAyKzl3?=
 =?utf-8?B?aytvREJOZFNzcTMzK2NQTjd5MFhGTlJyL2xmajdpMStKMjBGUFJobzR5WG5w?=
 =?utf-8?B?MVM2RUR3WkJVZDdGWnAyM2lIcEhQdkxtSjB3aldDMjhmcWx2V2pWc3J0eFhL?=
 =?utf-8?B?L0NMUkxrRzhkeWN0TUFINVk4NjBSeFFBOU1qaTE2T0UwSDEzamQ2NVhIb0JS?=
 =?utf-8?B?akxWdzlybFJvRjl3dkJ6M3U5WE5vbmhROS9NK0V1cnN0aVJjQjgrQVl2MnlX?=
 =?utf-8?B?RlRxMThQRXZrMXZ3ZjVSOTlVMjNmTTFzQmRZVnBPMlFLcXJiVHl5aTMxa2d3?=
 =?utf-8?B?Zk03S01VV2x5TDh4bUFFbGIvdm5PUUtFWFBwam5MRmhJV21selpqT1dXcmNQ?=
 =?utf-8?B?TG56UjIyVFozRC9kR1ArZ0JKS21lRlhobFdDMWJ4elovQjVjSkNxR0NBd21W?=
 =?utf-8?B?a1VmeXJmOEd6QnpQcHNjY2FOaU5kL0tkMU1NTkUvWFBuUjcwVmhjNWNaWDVE?=
 =?utf-8?B?RFdRN1V5cFpBUnV4ZHJIMm5ySjB2ZXdDSWZCaGliNWs2cm5DMTZYaTd6dy9y?=
 =?utf-8?B?cmNhQmJvSHlOb2ZDc3BPeFFWY1MrL1dlQzh4MU1NMUd1bmZVTFVPMjJjRVEr?=
 =?utf-8?B?WUExYVhDM0hTMjlTUmp1QWFTa1JLdEtQS3RMNXRzZ2c1WGJkblVCQlVNNzhv?=
 =?utf-8?B?cHM4TjI4aXRFZ0hCNCt5emh1Q3JGdTEwNEVaMngzRU5URm50V3RJTTdUZ29n?=
 =?utf-8?B?SEtsUzF1YVVmVndIMXY1Q2JzMGxyZUpKV2w4eFoyOVY0c2U0bm1ueDZRb2Rm?=
 =?utf-8?B?bGRMVnY4Y0lQMTJueEY1UnlPcFhFRGNXeEZvVWFNVUxwOXNkQVdFWkxvYmMx?=
 =?utf-8?B?OGE2eFRETVF6cGxnMTRZUWRwN2tpQ0RYMFhVcUQ1MSt1eGZ2bGU2WnA5Qzdm?=
 =?utf-8?B?NWNaeXpqZmdWMXpTejVFa0VQSGlBY0tmUGgwOEtLVFMvM0FtdmR2QTl2K0Z5?=
 =?utf-8?B?Q2RWRU5HN2VON1QvV0s1RTNTUEQ2bW1BaFBJZ1lYWkZDTEsrVitJUnJOWkFD?=
 =?utf-8?B?cUx5cjlBYk5hSXdqZ0xoQ01MTHhCU0xKUkp4akFldldoK1V5M1FGRUVhdXI2?=
 =?utf-8?B?YkxEWjhDYW9jNDJnY2d5cmVSOHhlaS8xbGs4bk5saDdpSlJ3bmhLTUgwN0ND?=
 =?utf-8?B?Szc1QUhsRGErMkJ2RDJqYnVSMG1JaW5WYVBBMjNrcFhFZGl1eVRGY2JpWS96?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF5CBB3D4A51D24D959437525907FA90@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd63378-4581-42fc-c2a9-08dbe491411a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 21:41:11.6268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFRPmJ3tDjIc3FNpiNgl+zr7Np16w8RzA5ffSsR2OJspSWr5uZUeIuAyYsC/lbnSkZFCsWE3fCuuDMzh3+6nAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5181
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Add uapi for dumpable bos
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTI0IGF0IDE0OjIyICswMjAwLCBNYWFydGVuQG1ibGFua2hvcnN0Lm5s
IHdyb3RlOg0KPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4g
DQo+IEFkZCB0aGUgZmxhZyBYRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgdG8gbm90aWZ5IGRldmNv
cmVkdW1wIHRoYXQgdGhpcw0KPiBtYXBwaW5nIHNob3VsZCBiZSBkdW1wZWQuDQo+IA0KPiBUaGlz
IGlzIG5vdCBob29rZWQgdXAsIGJ1dCB0aGUgdWFwaSBzaG91bGQgYmUgcmVhZHkgYmVmb3JlIG1l
cmdpbmcuDQo+IA0KPiBJdCdzIGxpa2VseSBlYXNpZXIgdG8gZHVtcCB0aGUgY29udGVudHMgb2Yg
dGhlIGJvJ3MgYXQgZGV2Y29yZWR1bXANCj4gcmVhZG91dCB0aW1lLCBzbyBpdCdzIGJldHRlciBp
ZiB0aGUgYm9zIHdpbGwgc3RheSB1bm1vZGlmaWVkIGFmdGVyDQo+IGEgaGFuZy4gVGhlIE5FRURT
X0NQVV9NQVBQSU5HIGZsYWcgaXMgcmVtb3ZlZCBhcyByZXF1aXJlbWVudC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgfCAxMSArKysrKysr
Ky0tLQ0KPiAgaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgfCAgNCArKysrDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dm0uYw0KPiBpbmRleCA0OThjMGIzZTFkNzMuLmRjYTAzZDhhZDk4ZSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3ZtLmMNCj4gQEAgLTI4MTksMTIgKzI4MTksMTIgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3Rs
X29wc19leGVjdXRlKHN0cnVjdCB4ZV92bSAqdm0sDQo+ICAjZGVmaW5lIFNVUFBPUlRFRF9GTEFH
UwlcDQo+ICAJKEZPUkNFX0FTWU5DX09QX0VSUk9SIHwgWEVfVk1fQklORF9GTEFHX0FTWU5DIHwg
XA0KPiAgCSBYRV9WTV9CSU5EX0ZMQUdfUkVBRE9OTFkgfCBYRV9WTV9CSU5EX0ZMQUdfSU1NRURJ
QVRFIHwgXA0KPiAtCSBYRV9WTV9CSU5EX0ZMQUdfTlVMTCB8IDB4ZmZmZikNCj4gKwkgWEVfVk1f
QklORF9GTEFHX05VTEwgfCBYRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgfCAweGZmZmYpDQo+ICAj
ZWxzZQ0KPiAgI2RlZmluZSBTVVBQT1JURURfRkxBR1MJXA0KPiAgCShYRV9WTV9CSU5EX0ZMQUdf
QVNZTkMgfCBYRV9WTV9CSU5EX0ZMQUdfUkVBRE9OTFkgfCBcDQo+ICAJIFhFX1ZNX0JJTkRfRkxB
R19JTU1FRElBVEUgfCBYRV9WTV9CSU5EX0ZMQUdfTlVMTCB8IFwNCj4gLQkgMHhmZmZmKQ0KPiAr
CSBYRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUgfCAweGZmZmYpDQo+ICAjZW5kaWYNCj4gICNkZWZp
bmUgWEVfNjRLX1BBR0VfTUFTSyAweGZmZmZ1bGwNCj4gIA0KPiBAQCAtMzAzNiw4ICszMDM2LDEz
IEBAIGludCB4ZV92bV9iaW5kX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gIAkJdTMyIG9iaiA9IGJpbmRfb3BzW2ldLm9i
ajsNCj4gIAkJdTY0IG9ial9vZmZzZXQgPSBiaW5kX29wc1tpXS5vYmpfb2Zmc2V0Ow0KPiAgDQo+
IC0JCWlmICghb2JqKQ0KPiArCQlpZiAoIW9iaikgew0KPiArCQkJaWYgKFhFX0lPQ1RMX0RCRyh4
ZSwgYmluZF9vcHNbaV0ub3AgJiBYRV9WTV9CSU5EX0ZMQUdfRFVNUEFCTEUpKSB7DQoNCnRoaXMg
d2lsbCBub3QgYWxsb3cgZHVtcCB1c2VyLXB0ci4NCg0KPiArCQkJCWVyciA9IC1FSU5WQUw7DQo+
ICsJCQkJZ290byBwdXRfb2JqOw0KPiArCQkJfQ0KPiAgCQkJY29udGludWU7DQo+ICsJCX0NCj4g
IA0KPiAgCQlnZW1fb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG9iaik7DQo+ICAJ
CWlmIChYRV9JT0NUTF9EQkcoeGUsICFnZW1fb2JqKSkgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXgg
MjRiZjhmMGY1MmU4Li40MmY1ZWI5NWQzMGMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9k
cm0veGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtNjc3
LDYgKzY3NywxMCBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KPiAgCSAqIGludGVuZGVk
IHRvIGltcGxlbWVudCBWSyBzcGFyc2UgYmluZGluZ3MuDQo+ICAJICovDQo+ICAjZGVmaW5lIFhF
X1ZNX0JJTkRfRkxBR19OVUxMCQkoMHgxIDw8IDMpDQo+ICsJLyoNCj4gKwkgKiBkdW1wYWJsZSAt
PiBjb250ZW50cyBhcmUgYXR0ZW1wdGVkIHRvIGJlIGluY2x1ZGVkIGluIGRldmNvcmVkdW1wcy4N
Cj4gKwkgKi8NCj4gKyNkZWZpbmUgWEVfVk1fQklORF9GTEFHX0RVTVBBQkxFICAgICAgICAoMHgx
IDw8IDQpDQo+ICAJLyoqIEBmbGFnczogQmluZCBmbGFncyAqLw0KPiAgCV9fdTMyIGZsYWdzOw0K
PiAgDQoNCg==
