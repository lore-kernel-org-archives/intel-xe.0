Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F36C5DF70
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 09:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C49710EA74;
	Tue, 18 Aug 2026 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDxAIDEI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AB910EA65
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787044131; x=1818580131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y4fSAvaLE6tNWVpuF4fmZNaxXZt3ZhNWBMozZSTjo/U=;
 b=GDxAIDEIFxO7VlOq/bK32/XRkNuUcCyE4D9udr4J1TO4jfc9pZIYCqpD
 VaYU7D+FMKCIIEHHGrK/xYofXJGv7kKtIZOn/8xCVt+QVr3XN/EPg0t8G
 N0p0hyyfaBSoGl/4PLGq+CulEXVuRjRtBRz7QcWIPgn0ZtDAfPkiHadpQ
 rZuk4ANuPtsnMnzMn3TtRE7/nkm70JsOmgvBm6y3KYseQbhnOhPQKxOVs
 32c6wgSxzCSQ8SQpmYYXV7nvXt79qWg8EB+/8NVDkFbP+cc4f8WhiLcak
 J2VDlkZPQ54gqixh1DRWjdkXZBNFuMYnnRvwcr62g+rkq6ylD20q1F7yQ w==;
X-CSE-ConnectionGUID: yzFtobn3TFyoSTF6J2HJQw==
X-CSE-MsgGUID: ElzKV4QFSdaeP1rCfGZrpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105063796"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="105063796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:08:51 -0700
X-CSE-ConnectionGUID: gE7WbkX/SuSDe9MIP1cMVg==
X-CSE-MsgGUID: gDoI2gP0TOSx5EVDiCbzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="261430895"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 02:08:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 02:08:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 02:08:50 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 02:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYnKVNyRpPgJIIKiUSxExcaoHK3KN+Vzb5yJG1UzUzMfi3PThO34qq+rjiluZvhVF+I0UqemiXBYrwN8VcqQyZuz4ZmFaPgA/oEi78LbogE7O+OvyJ4Fy/Bljc6izz8zwoprx0J8Azw3dGEBuWRaGj/h9J+fgCJMdiVWNC3aLAbcicQOFFNu+LzPLJ36Z7PD6+rQXbUTFOacG1hY/27awsJG74aPB6q5LKhm9ExxD5LKF35sk3zyuTyb7Njriv+pgJX6J8V9YAaCB6OZs5AQHAYkVb3VUBPMxjVx6MjUXouAK/VbYRCTSw+xws4J+5faGo+O4LpOy1KAa1tUvhOfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4fSAvaLE6tNWVpuF4fmZNaxXZt3ZhNWBMozZSTjo/U=;
 b=QVWGH846sznBTDTg1kBCuJyEnuAd8c2EhdwtYt9KApd8dBqmEzfaA0PYG0u+d1JlcVAdLrztiW6CyBLYHom4KigED3truMU6oU401jggS79S2g3XncatjVLHWE3lkhNXptPxa05tp+RpvtbqqsuMaLjMjKbW/30zjFp0gDe4oU1i+ydesmd5LuANXOBqPIjMHec37P5slO6J/UH31CugRmvVeyuqkzefQihZ5jYV/nRZl17VnKI+0m0m34a01EBTbSMF1WzFd1t1G0A5DRFo1xmarYZ8+rXYdqJnEUX638mxKo3GN0BZkzZJngI58aa2OYoo3pHD4vM8ZjwjXiisNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 09:08:46 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 09:08:46 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Thread-Topic: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Thread-Index: AQHdLhTYEi7eie8PVU6Va+HGUymwCLaiGoaAgAA6W8CAABOxgIAAEawAgAAnZoCAAOILIA==
Date: Tue, 18 Aug 2026 09:08:46 +0000
Message-ID: <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com> <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
 <aoNhZwRGQC2uh95n@intel.com>
In-Reply-To: <aoNhZwRGQC2uh95n@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB5097:EE_
x-ms-office365-filtering-correlation-id: 41130cc0-b7dc-4df1-d04f-08defd084f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|6133799003|18002099003|22082099003|5023799004|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 3RxMs73csYtyUnrflZoXjEAPdVaNNEH7FB+g9NMB3HnW/wkYoKHv+xUOpGp6n6sEmCStiWEjrsKHNvfxLssKjAR9a5LARJXlLx8O/4dwC9HD5X3Yp3XBnhCddI/r3pa2WlDAgXoqlvyiLUtKdc45IjEhViQLfbc32Wf+T66EeRAyEIVXnOu/LwRCh/Dya9gvMN0sW9lkdcguNO5j4lYVAgOJJKLLvplsYE876Sy1r1Ser0l6xCfj25+PTCGKZlDtfKXX4jJXuhkoOxOm0iyaciKGkVK5rQDR8p9PcvsnioSzByAS37FHlIJ6teif9UaNe+wVnw1wFiXdjp3At0CgBhxzAY1cpQNRisdG3wpk1sxBlHG3uI6MjeDg0NTZq1I21vtxscMBcravR78ixjHk/mUWYA694m1xU9ISdHd71CeCOAjvD/3lQquQHTNTdeC9JqXiKpDskEHaWbGIILS4Oci+2oIQ7jWh0qb1yprnzhzXik5MZ+jzUDOawkCno2dVve3H44jEFYE+IFaaRC6OnQm+RdOocJZxG53mOUB5oASH1xV2KSjDAhT17nGmdl94QlJ8x03ON0VI4Tc8y7tOh1EnYPPqOARHUHh+PDs0xWiGYw+GeZ5cRkSZ8fv68Q77C1goGtlSzNu4yM3xz+JzbZOR71aymOmrBIANBTAXRqkgCV8Q2FGWkBaVEel2mbk3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1lpL1lZZDc4cTErb2lMWWxJRU01WDB6bEM0aEw3MUl6Um1zWVBxZDA3Y3Zs?=
 =?utf-8?B?VFNCYnJUNG80aWZ5WVZkd0JlRDdIdzRQMzlZMDdjLzlyTmlaQkpCenYySk1w?=
 =?utf-8?B?dmVKckRkVmdjZzU3T2FNY0pEY05COVZhSUR5M1lJNDI2MXRnVHBIVngyVTM0?=
 =?utf-8?B?QTBLMWhRMHQzbWgzSHVwNkVZa1pDQmd3dEFnajEzSEdQcHNkclBGTGdUQkQ5?=
 =?utf-8?B?d1VEdGNacko3bk9tOEtqeWY3a2IvaWV4RzU0SUgrUUQ2M2JjZ2NZQzFkWEM2?=
 =?utf-8?B?aUJUSEZ1WXB1SnZ0RWRGWW04ZldUQzMwaWsxWHc3QUJwdnRnQXBjRFRvYVhD?=
 =?utf-8?B?RjRBSFFKVjk1emtiYXdKN2dpYXhjQ1J6SkhESWhWWEpOcmJpZjF2UlBPVUdO?=
 =?utf-8?B?eWlTSUUzVFFjd2FtbWZRQ3FGSDBXQ05ld1RjbndsRldYTDFDT3ZtNGNLcjVE?=
 =?utf-8?B?OUp6UnNIeVAyTXFFdzBpVER4QXdicVhOanVVeW55eC9xalpUSFNRK2ZBR1V2?=
 =?utf-8?B?a0pMT1c4bWE4WVJEQU8wbWM4RDl3Z3lsQ284MDJHTlRkQndNVjRJY01ZeUdM?=
 =?utf-8?B?a1liWXRrMDc2d1lvR21oSk82VCtKaTBCRjBKZzNpQURZay82ZXdqd0FIQ0Fi?=
 =?utf-8?B?eGdEbkJRSVhMUnZTaGQ4Sm9Jd0RvUVFDQUttcTBkZUlPUHdwOWJ5NkdLQ09U?=
 =?utf-8?B?SW0vUjllMFBmekNRSFhlVk9ydm9qUTNrNERWdGEzeG01WWVVcElLaksvZ0p4?=
 =?utf-8?B?WU9CVHV5b0xLYW54Rkh1R1Y2bnEyM0FWdXB3K3UwMjljeCtjSTE1RXo3Znpn?=
 =?utf-8?B?OXFHeC9sYk5oU2tPd2dpY2V1blBaeHFWWWYrYXFoT0g5MVJXVnh4QUIxeGZQ?=
 =?utf-8?B?SkVYMmRSbXQvSDVoZlBuQ2JBZTVHNmpGOVRBenQ4VVZaa0ZpMDB4MlRDL2Vj?=
 =?utf-8?B?R0FIRWhCaWdGTnUxMG1kV3lkdUhrcXN2RkV4cU0vK1RycVQrYi9JSUxDZkZr?=
 =?utf-8?B?dmhlVTE0WHlyYWY1Z2EvaE11VWJnd1Q3Wmt1WE9rcmNCemR6ZkUyYTUxVXN0?=
 =?utf-8?B?U0FEWFlDNkNkNjNhMmwzaDdGZkJ0b0ZyQk9qeXJlWU90U3l1UEtGM3BFUENm?=
 =?utf-8?B?TXF4ckR2WWE4MTByTVJLakgxbXIyMkxCSGlqZ002ZDU5aGN0bHZ6a1IyV0JG?=
 =?utf-8?B?Mm1ySzR1S0s3R0l4b21oUTVpVlVMWlJQd3RwVVpzZjNyQkZUcEVkMGFwT1Jr?=
 =?utf-8?B?OTVpL0RwK1hyL3RlOHhmMmhkblIvRzhCb3cwYURPU1FpWHh6R0lFcWNvdnN0?=
 =?utf-8?B?RTdjMmVNZFdDNmxYTjlnSUdmMUY2U3I5TXBLM1hSS3drSVh2SjBqZFJJZEpo?=
 =?utf-8?B?MTcyK2RiaEE3VzdPdy8xZkc5U3JRcnIrTXF3V1JKV3R1d0tvcUd6UXIyWmY1?=
 =?utf-8?B?VWJFcEdvblpnUG9jbjF0SWhEQi9tVFdFaUFLa0ZVZUsxL05TaERRdlgvTnhm?=
 =?utf-8?B?MFkzVm5zaldkcmcyTTJCYUZYOXVXRWM4NG1RK1ZDdjU2Y1dMNlI4aVlyU1F5?=
 =?utf-8?B?eElTT0Z4cm1vZkNKT2tmMURLL25aWG9zclJEYzJBTjhNc083dlAxczEyeU10?=
 =?utf-8?B?NW5oN2dUWk9DcmhvYnBzSzIrQW5pcjU4TThRZ3VDTS9PQ2xXRTlJdjJkMW5Z?=
 =?utf-8?B?YWpPOXgzcURRZkcwYk1aTkpFSnZ2RVRUSWZjY1o1ODlGSSsrT0E3aXpCWWFZ?=
 =?utf-8?B?ekJvWjJUOUVsaVM3bDdHamFVZDVwaTAyZ3RRbnpZT0Z1bE50T0gzWjhQdEJm?=
 =?utf-8?B?elRyWTBzc0pSL1NFM1gvd0ttVzU1aUlJTU1jNWtZZmxwek9oQ0VrNjBIZXFm?=
 =?utf-8?B?Qm1qZGI5ejRUVnVMMFF0OXljbm54N29vMnJONmp3NXEya2Zib3ViL2hKNFFH?=
 =?utf-8?B?cDA2ZDhScXFoUnFUL0d6OUowclFIMVNUQjNKM2lrQ1hmYWNyNHJtdFEyRUJX?=
 =?utf-8?B?d1AyZzJZSitseGJsRGd5L3pOd2hLWXlJcmR1U2wzNXBnUXZkZ3Y2MTlWUXhZ?=
 =?utf-8?B?amtRZUFZWXExamxkWlNuZ0llV1UrZ0I1VXVKY3F5Y01SVmpNWFozYmlzd0Y3?=
 =?utf-8?B?TkVSUmNXRmUzU0dUeTFXemppVEM2L0F3QzJiRXRraEdrNm5qbFpxZWxjdTRW?=
 =?utf-8?B?OVQ2YkozTDArRmljZDhiOG5ZSGdGMVl5anlpTFFrbjUyVERBM01Xcm84Njlt?=
 =?utf-8?B?Vkx4TjI2WUx5ZXpqWCtlMXB3UVBUS2czd1h5dmsrOVl4SHZXNWpuMWpoMHB1?=
 =?utf-8?B?dHlROEpkWi9rZmJkYUkzcVJKWERRYnV6TUR4NXhtV3g0Mnc1Zk5CQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pTP7iJhIJ7FsITglT6GFeIa9dCT9sjfYuNSLVCdKVf61lP2ybZHqtdvvRKg9ywY6eX0tZdkkL/SptxCIJQRxInZM2kZ+bp33wzXl+V1/47oOn15vYRIorJYykGC9ZOTMxfbFk/Wc2vNvsom0jPj+FnxFiZ0nTPf0mLwL77CBxfcn1TkcbJwiVFVk0ikVuxvzi0TOOLCa2TIi4NXrVuentJf9xOcjYnfivdlVF2ZmtDCdLEdLmG2z1FZiZJiXCsI2kFpjcez1L3OoZf4ZATJUb7pkmQZjQgabwKGMLaEjysGXAz95EuvhDBrmlN0ptY/3LHquzPqMC4EnasxxWKOwug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41130cc0-b7dc-4df1-d04f-08defd084f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 09:08:46.3467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmTrYZn/hvWZaNEDWQuFIGnDJwMiQJpdhi1OVWl5msv4QsposmwpSF7VwQ2lI8kGCrp6kEzyW4nZNaxP4SM6t2w8oAoxEZ1pet5UT0uXWVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogMTggQXVndXN0IDIwMjYgMDE6MDENCj4g
VG86IFdhamRlY3prbywgTWljaGFsIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4NCj4gQ2M6
IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgVGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPjsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwu
cHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTYgMTAv
MTJdIGRybS94ZTogQWRkIHN5c2ZzIGludGVyZmFjZSBmb3IgYmFkIGdwdSB2cmFtDQo+IHBhZ2Vz
DQo+IA0KPiBPbiBNb24sIEF1ZyAxNywgMjAyNiBhdCAwNzowOTo0NlBNICswMjAwLCBNaWNoYWwg
V2FqZGVjemtvIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiA4LzE3LzIwMjYgNjowNiBQTSwgUm9k
cmlnbyBWaXZpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMDI6NTg6MzFQ
TSArMDAwMCwgVXBhZGh5YXksIFRlamFzIHdyb3RlOg0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+Pj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+Pj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+ID4+PiBTZW50OiAxNyBBdWd1c3Qg
MjAyNiAxNjo1Nw0KPiA+ID4+PiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51cGFkaHlheUBp
bnRlbC5jb20+OyBpbnRlbC0NCj4gPiA+Pj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBWaXZp
LCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsNCj4gPiA+Pj4gVGhvbWFzIEhlbGxz
dHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+ID4+PiBDYzogR2hp
bWlyYXksIEhpbWFsIFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4g
PiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTYgMTAvMTJdIGRybS94ZTogQWRkIHN5c2ZzIGlu
dGVyZmFjZSBmb3IgYmFkDQo+ID4gPj4+IGdwdSB2cmFtIHBhZ2VzDQo+ID4gPj4+DQo+ID4gPj4+
DQo+ID4gPj4+DQo+ID4gPj4+IE9uIDgvMTcvMjAyNiA4OjUxIEFNLCBUZWphcyBVcGFkaHlheSB3
cm90ZToNCj4gPiA+Pj4+IEluY2x1ZGUgYSBzeXNmcyBpbnRlcmZhY2UgZGVzaWduZWQgdG8gZXhw
b3NlIGluZm9ybWF0aW9uIGFib3V0DQo+ID4gPj4+PiBiYWQgVlJBTSBwYWdlcyDigJQgdGhvc2Ug
aWRlbnRpZmllZCBhcyBoYXZpbmcgaGFyZHdhcmUgZmF1bHRzDQo+ID4gPj4+PiAoZS5nLiwgRUND
IGVycm9ycykuIFRoaXMgaW50ZXJmYWNlIGFsbG93cyB1c2Vyc3BhY2UgdG9vbHMgYW5kDQo+ID4g
Pj4+PiBhZG1pbmlzdHJhdG9ycyB0byBtb25pdG9yIHRoZSBoZWFsdGggb2YgdGhlIEdQVSdzIGxv
Y2FsIG1lbW9yeQ0KPiA+ID4+Pj4gYW5kIHRyYWNrIHRoZSBzdGF0dXMgb2YgcGFnZSByZXRpcmVt
ZW50LiBEZXRhaWxzIG9uIGJhZCBncHUgdnJhbQ0KPiA+ID4+Pj4gcGFnZXMgY2FuIGJlIGZvdW5k
IHVuZGVyDQo+IC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxiZGY+L3ZyYW1fYmFkX3BhZ2VzLg0KPiA+
ID4+Pg0KPiA+ID4+PiBzaW5jZSB0aG9zZSBuZXcgZmlsZXMgYXJlIHhlIGRyaXZlciBzcGVjaWZp
Yywgc2hvdWxkbid0IHdlIHJlZmVyDQo+ID4gPj4+IHRvIHRoZW0gdXNpbmcNCj4gPiA+Pj4NCj4g
PiA+Pj4gCS9zeXMvYnVzL3BjaS9kcml2ZXJzL3hlLzxiZGY+L3ZyYW0uLi4NCj4gPiA+Pj4NCj4g
PiA+Pj4+DQo+ID4gPj4+PiBUaGUgZm9ybWF0IGlzOiBwZm4gOiBncHVfcGFnZV9zaXplIDogZmxh
Z3MNCj4gPiA+Pj4NCj4gPiA+Pj4ga2VybmVsIGRvY3VtZW50YXRpb24gWzFdIHNheXMNCj4gPiA+
Pj4NCj4gPiA+Pj4gCSJNaXhpbmcgdHlwZXMsIGV4cHJlc3NpbmcgbXVsdGlwbGUgbGluZXMgb2Yg
ZGF0YSwgYW5kIGRvaW5nDQo+ID4gPj4+IAlmYW5jeSBmb3JtYXR0aW5nIG9mIGRhdGEgaXMgaGVh
dmlseSBmcm93bmVkIHVwb24iDQo+ID4gPj4+DQo+ID4gPj4+IFsxXSBodHRwczovL2RvY3Mua2Vy
bmVsLm9yZy9maWxlc3lzdGVtcy9zeXNmcy5odG1sI2F0dHJpYnV0ZXMNCj4gPiA+Pj4NCj4gPiA+
Pj4gc28gdG8gZm9sbG93IHRoZSBndWlkZWxpbmVzIG1heWJlIHdlIGV4cG9zZSB0aGUgc2VwYXJh
dGUgZmlsZXM6DQo+ID4gPj4+DQo+ID4gPj4+IC9zeXMvYnVzL3BjaS9kcml2ZXJzL3hlLzxiZGY+
L3ZyYW1fcGFnZV9zaXplCQl1NjQNCj4gPiA+Pj4gL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvPGJk
Zj4vdnJhbV9iYWRfcGFnZXNfY291bnQJdTY0DQo+ID4gPj4+IC9zeXMvYnVzL3BjaS9kcml2ZXJz
L3hlLzxiZGY+L3ZyYW1fYmFkX3BhZ2VzX3Jlc2VydmVkCXU2NFtdDQo+ID4gPj4+IC9zeXMvYnVz
L3BjaS9kcml2ZXJzL3hlLzxiZGY+L3ZyYW1fYmFkX3BhZ2VzX3BlbmRpbmcJdTY0W10NCj4gPiA+
Pj4gL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvPGJkZj4vdnJhbV9iYWRfcGFnZXNfZmFpbGVkCXU2
NFtdDQo+ID4gPj4+DQo+ID4gPj4+IG9yDQo+ID4gPj4+DQo+ID4gPj4+IC9zeXMvYnVzL3BjaS9k
cml2ZXJzL3hlLzxiZGY+DQo+ID4gPj4+IHwNCj4gPiA+Pj4gKy0tIHZyYW0vDQo+ID4gPj4+ICAg
ICArLS0gcGFnZV9zaXplCXU2NA0KPiA+ID4+PiAgICAgKy0tIGJhZF9wYWdlcy8NCj4gPiA+Pj4g
ICAgICAgICArLS0gY291bnQJdTY0DQo+ID4gPj4+ICAgICAgICAgKy0tIHJlc2VydmVkCXU2NFtd
DQo+ID4gPj4+ICAgICAgICAgKy0tIHBlbmRpbmcJdTY0W10NCj4gPiA+Pj4gICAgICAgICArLS0g
ZmFpbGVkCXU2NFtdDQo+ID4gPj4+DQo+ID4gPj4+IHRoZW4NCj4gPiA+Pj4NCj4gPiA+Pj4gL3N5
cy9idXMvcGNpL2RyaXZlcnMveGUvPGJkZj4vdnJhbV9wYWdlX3NpemU6MHgxMDAwDQo+ID4gPj4+
IC9zeXMvYnVzL3BjaS9kcml2ZXJzL3hlLzxiZGY+L3ZyYW1fYmFkX3BhZ2VzX2NvdW50OjUNCj4g
PiA+Pj4NCj4gL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvPGJkZj4vdnJhbV9iYWRfcGFnZXNfcmVz
ZXJ2ZWQ6MHgwMDAwMDAwMDAwDQo+ID4gPj4+IDAwDQo+ID4gPj4+IDAwMDANCj4gPiA+Pj4NCj4g
L3N5cy9idXMvcGNpL2RyaXZlcnMveGUvPGJkZj4vdnJhbV9iYWRfcGFnZXNfcGVuZGluZzoweDAw
MDAwMDAwMDEyDQo+ID4gPj4+IDM0DQo+ID4gPj4+IDAwMA0KPiA+ID4+Pg0KPiAvc3lzL2J1cy9w
Y2kvZHJpdmVycy94ZS88YmRmPi92cmFtX2JhZF9wYWdlc19wZW5kaW5nOjB4MDAwMDAwMDAwMTIN
Cj4gPiA+Pj4gMzUNCj4gPiA+Pj4gMDAwDQo+ID4gPj4+DQo+IC9zeXMvYnVzL3BjaS9kcml2ZXJz
L3hlLzxiZGY+L3ZyYW1fYmFkX3BhZ2VzX3BlbmRpbmc6MHgwMDAwMDAwMDAxMg0KPiA+ID4+PiAz
Ng0KPiA+ID4+PiAwMDANCj4gPiA+Pj4NCj4gL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvPGJkZj4v
dnJhbV9iYWRfcGFnZXNfcGVuZGluZzoweDAwMDAwMDAwMDEyDQo+ID4gPj4+IDM3DQo+ID4gPj4+
IDAwMA0KPiA+ID4+DQo+ID4gPj4gVGhhbmtzIGZvciBjb21tZW50LCB0aGlzIGlzIGRvY3VtZW50
ZWQgZm9ybWF0IGJ5IGRlc2lnbiBkb2MuIFN5c21hbg0KPiBhbHNvIGRlcGVuZGluZyBvbiB0aGlz
IGZvcm1hdC4gU28gSSBkb27igJl0IHNlZSB0aGlzIGNhbiBiZSBkb25lIHdpdGhvdXQgZGVzaWdu
DQo+IGJlaW5nIGNoYW5nZWQgZm9yIGV2ZXJ5b25lLg0KPiA+ID4NCj4gPiA+IEludGVybmFsIGRl
c2lnbiBkb2NzIGRvbid0IHN1cGVyc2VlZCB1cHN0cmVhbSBkb2N1bWVudGF0aW9uLg0KPiA+ID4g
SXQgaXMgdGhlIG90aGVyIHdheSBhcm91bmQuDQo+ID4gPg0KPiA+ID4gQnV0IGFsc28sIHRoZSBm
aWxlcyB3aWxsIGJlIHRoZXJlIG9uZSB3YXkgb3IgYW5vdGhlci4gQm90aCBwYXRocyBhcmUNCj4g
PiA+IHZhbGlkLCBzbyBJIGRvbid0IGJlbGlldmUgdGhhdCBjaGFuZ2UgaW4gaGVyZSBmb3JjZSBj
aGFuZ2VzIGluIHRoZQ0KPiA+ID4gdXNlcnNwYWNlLiBBbHRob3VnaCwgeWVzIGNvbnNpc3RlbmN5
IGlzIGdvb2QuLi4NCj4gPiA+DQo+ID4gPiBUaGF0IHNhaWQsIEkgZG9uJ3QgaGF2ZSBhIHN0cm9u
ZyBmZWVsaW5nIGZvciBvbmUgd2F5IG9yIHRoZSBvdGhlci4NCj4gPiA+DQo+ID4gPiBTaW5jZSB3
ZSBhcmUgYWRkaW5nIHRvIHRoZSBkZXZpY2UgbGV2ZWwgYW55d2F5LCBJIGJlbGlldmUgaXQgc2hv
dWxkDQo+ID4gPiBiZSBva2F5LiBCdXQgTWljaGFsLCBkbyB5b3Uga25vdyBhbnkgZG9jIG9yIGFu
eSBwcmVjZWRlbmNlIHRoYXQga2luZA0KPiA+ID4gb2YgZm9yY2UgdXMgdG8gZ28gdGhlIG90aGVy
IHdheT8NCj4gPg0KPiA+IGhtbSwgYXJlIHdlIHRhbGtpbmcgaGVyZSBhYm91dCB0aGUgYXR0cmli
dXRlIGZvcm1hdCBvciBmb2xkZXIgbGF5b3V0Pw0KPiA+DQo+ID4gaWYgYWJvdXQgdGhlIGxhdHRl
ciwgbm8gc3Ryb25nIGZlZWxpbmcgZWl0aGVyICgiZmlsZXMgd2lsbCBiZSB0aGVyZQ0KPiA+IG9u
ZSB3YXkgb3IgYW5vdGhlciIpDQo+ID4NCj4gPiBidXQgaWYgYWJvdXQgdGhlIGZvcm1lciwgdGhl
biB0aGUgc2FtZSBkb2N1bWVudGF0aW9uIFsxXSBlYXJsaWVyIHNheXM6DQo+ID4NCj4gPiAJIkF0
dHJpYnV0ZXMgc2hvdWxkIGJlIEFTQ0lJIHRleHQgZmlsZXMsIHByZWZlcmFibHkgd2l0aCBvbmx5
DQo+ID4gCSJvbmUgdmFsdWUgcGVyIGZpbGUuIEl0IGlzIG5vdGVkIHRoYXQgaXQgbWF5IG5vdCBi
ZSBlZmZpY2llbnQNCj4gPiAJInRvIGNvbnRhaW4gb25seSBvbmUgdmFsdWUgcGVyIGZpbGUsIHNv
IGl0IGlzIHNvY2lhbGx5IGFjY2VwdGFibGUNCj4gPiAJInRvIGV4cHJlc3MgYW4gYXJyYXkgb2Yg
dmFsdWVzIG9mIHRoZSBzYW1lIHR5cGUuDQo+ID4NCj4gPiBhbmQgbXkgcHJvcG9zYWwgd2l0aCBz
ZXBhcmF0ZSBmaWxlcyBtZWV0cyB0aGF0IGV4cGVjdGF0aW9ucyAodGhlcmUNCj4gPiB3aWxsIGJl
IGVpdGhlciBzaW5nbGUgdmFsdWUgaW4gdGhlIGZpbGUgb3IgYXJyYXkgb2YgdmFsdWVzIG9mIHRo
ZSBzYW1lDQo+ID4gdHlwZSksIG9wcG9zZWQgdG8gb3JpZ2luYWwgaWRlYSBvZiBhcnJheSBvZiBv
ZmZzZXQ6cGFnZV9zaXplOmZsYWcNCj4gPiB0dXBsZXMNCj4gDQo+IGRvaCEgSSdtIHNvcnJ5Li4u
IG15IGNvbW1lbnQgd2FzIHB1cmVseSBkcml2ZW4gYnkgdGhlIG90aGVyIHNlbnRlbmNlIGFib3Zl
Og0KPiAic2luY2UgdGhvc2UgbmV3IGZpbGVzIGFyZSB4ZSBkcml2ZXIgc3BlY2lmaWMsIHNob3Vs
ZG4ndCB3ZSByZWZlciB0byB0aGVtIHVzaW5nIg0KPiANCj4gQnV0IG5vdyBJIGxvb2tlZCBhdCB0
aGUgY29udGVudCBvIHRoZSBwYXRjaCBpdHNlbGYuIFRoaXMgcGF0Y2ggYXMgaXMgaXMgYSBCSUcg
Tk8hDQo+IEl0IGlzIGFnYWluc3QgdGhlIHN5c2ZzIHJ1bGVzLiBQZXJpb2QuIEludGVybmFsIHNw
ZWMgYW5kIG90aGVyIGNvbXBvbmVudHMgbmVlZA0KPiB0byBhZGp1c3QuDQo+IA0KPiBBbHNvIHBs
ZWFzZSBkbyBub3QgcmVwZWF0IHRoZSBzYW1lIFBWQyBtaXN0YWtlcyB3aXRoIHRlbnRocyBvZiBs
aW5nZXJpbmcgc3lzZnMNCj4gZW50cmllcy4gT3JnYW5pemUgdGhpcyBwZXIgZGlyZWN0b3J5IGFz
IE1pY2hhbCB0b2xkLg0KPiANCj4gQW5vdGhlciB0aGluZywgbWFrZSBhIGRlc2lnbiB0aGF0IGlz
IGZ1dHVyZSByZWFkeSwgdXNlICd2cmFtMC8nIGFzIHRoZSBuYW1lIG9mDQo+IHRoZSBkaXJlY3Rv
cnkgd2l0aCB2cmFtMCBzdHVmZi4gTGlrZSB3ZSBoYXZlIGZyZXEwLyBmb3IgaW5zdGFuY2UuDQo+
IA0KPiBQZXJoYXBzIGV2ZW4NCj4gDQo+ICstLSB2cmFtMC8NCj4gICArLS0gcGFnZXMvDQo+ICAg
ICAgKy0tIHNpemUgdTY0DQo+ICAgICAgKy0tIGJhZF9wYWdlcy8NCj4gICAgICAgICAgKy0tIGNv
dW50IHU2NA0KPiAgICAgICAgICArLS0gcmVzZXJ2ZWQgICAgICB1NjRbXQ0KPiAgICAgICAgICAr
LS0gcGVuZGluZyAgICAgICB1NjRbXQ0KPiAgICAgICAgICArLS0gZmFpbGVkICAgICAgICB1NjRb
XQ0KDQpDdXJyZW50bHkgaW5mb3JtYXRpb24gc2hvd24gdW5kZXIgdnJhbV9iYWRfcGFnZXMobG9v
a3Mgc2ltaWxhciB0byB3aGF0IG90aGVyIGNvbXBldGl0b3IncyAgYmFkIHBhZ2VzIGluZm8gc2hv
d3MpLCBhY3R1YWwgZ2l2ZXMgZGF0YSB3aGljaCBjb25zdW1lciBjYW4gZXh0cmFjdCBkaXJlY3Rs
eSBtZWFuaW5nZnVsIGluZm8gb3V0IG9mIGl0LiBXaXRoIGFib3ZlIGFwcHJvYWNoLCBjb25zdW1l
ciBuZWVkIHRvIG1ha2Ugb25lLCB3aGljaCB3ZSBuZWVkIHRvIGRpc2N1c3Mgd2l0aCBvdGhlciBm
b2xrcy4gTGV0cyBkaXNjdXNzIGluIGEgZ3JvdXAuDQoNClRlamFzDQo+IA0KPiBUaGFua3MsDQo+
IFJvZHJpZ28uDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4+DQo+ID4gPj4gVGVqYXMNCj4gPiA+Pj4N
Cj4gPiA+Pj4+DQo+ID4gPj4+PiBmbGFnczoNCj4gPiA+Pj4+ICAgUjogcmVzZXJ2ZWQsIHRoaXMg
Z3B1IHBhZ2UgaXMgcmVzZXJ2ZWQuDQo+ID4gPj4+PiAgIFA6IHBlbmRpbmcgZm9yIHJlc2VydmUs
IHRoaXMgZ3B1IHBhZ2UgaXMgbWFya2VkIGFzIGJhZCwgd2lsbCBiZQ0KPiA+ID4+Pj4gICAgICBy
ZXNlcnZlZCBpbiBuZXh0IHdpbmRvdyBvZiBwYWdlX3Jlc2VydmUuDQo+ID4gPj4+PiAgIEY6IHVu
YWJsZSB0byByZXNlcnZlLCB0aGlzIGdwdSBwYWdlIGNhbid0IGJlIHJlc2VydmVkIGR1ZSB0byBz
b21lDQo+ID4gPj4+PiAgICAgIHJlYXNvbnMuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gRm9yIGV4YW1w
bGUsIGNhdCAvc3lzL2J1cy9wY2kvZGV2aWNlcy88YmRmPi92cmFtX2JhZF9wYWdlczoNCj4gPiA+
Pj4+ICAgbWF4X3BhZ2VzIDogMTAwMDANCj4gPiA+Pj4+ICAgMHgwMDAwMDAwMDAwMDAwMDAwIDog
MHgwMDAwMDAwMDAwMDAxMDAwIDogUg0KPiA+ID4+Pj4gICAweDAwMDAwMDAwMDAwMDEyMzQgOiAw
eDAwMDAwMDAwMDAwMDEwMDAgOiBQDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gVGhlIHN5c2ZzIGJpbmFy
eSBhdHRyaWJ1dGUgaXMgY3JlYXRlZCB1bmRlciB0aGUgUENJIGRldmljZQ0KPiA+ID4+Pj4ga29i
amVjdCB3aGVuIHRoZSBwbGF0Zm9ybSBzdXBwb3J0cyBpdCBhbmQgdGhlIGNvbmZpZ2ZzDQo+ID4g
Pj4+PiBiYWRfcGFnZV9yZXNlcnZhdGlvbiBwb2xpY3kgaXMgZW5hYmxlZC4gVXNlcyBSQ1UtcHJv
dGVjdGVkIGxpc3QNCj4gPiA+Pj4+IHRyYXZlcnNhbCBzbyByZWFkcyBuZXZlciBibG9jayBub3Jt
YWwgVlJBTSBhbGxvY2F0aW9uIG9wZXJhdGlvbnMuDQo+ID4gPj4+Pg0K
