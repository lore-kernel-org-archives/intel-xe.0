Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5069AC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 22:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23C410E00E;
	Tue,  9 Jul 2024 22:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkMekk9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7D10E00E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 22:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720565597; x=1752101597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o7jvtzbhmw7UC0eqxq2Q6fuyGRM7ouKizQtkNFJYFbs=;
 b=MkMekk9u24Akw+ns+aDUt+oeecgCqM82Xv+hpOYFO6I8CTVGPxXL1j0r
 5MR7Kk0SEeYKlLaG+5hX/Ap1pPA+ViyIMyFkGGYvydexGXgNjxEal+7V3
 L7GDPwjiL6a/eajF6sqYNLGbSzA4UggO/F+Yp+Y1QdhJjzj1BusXqy71C
 lZPTIjfgZrE4OAvAONpjgBITVYn2y2aYN3dGRVOnjnNdHp+Evw0+Cj1BC
 YVhkGP5X4OfDz/VdtvjvvBmuFvANmw5YAItDfAf0JwwV9Rx2FjPkBXHis
 dVxIRCQeRazgKSR/6hSQBMmTLVhGk5WtncH25+sEqvDPgPKNUM46jtdr5 Q==;
X-CSE-ConnectionGUID: LSJhozEES8SpnO3Bwl/kow==
X-CSE-MsgGUID: aRuyi7q7Qr+U/XdqNOLweQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="43279774"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="43279774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 15:53:16 -0700
X-CSE-ConnectionGUID: LndSDAscTmaypFQ5Hxt1aA==
X-CSE-MsgGUID: 9LqgsWq/TZy5KGuFGlTGyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="79163000"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 15:53:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 15:53:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 15:53:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 15:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQc0Aw/jei1BQ3ngDC/xZiqb9fS9tSc36GgOKRESsvLaGdhVnmJL0iY6/o2RE8YUZ6YFz2jS+Y/8cXp1m5qKCiXrBe8X2CxzC3OMevdXFCZOEkD5dHqpsfsJRYdPW5sJENmTl1XnUri1iy/Oo6th14/T0yAax07S1C/XfVlVwifkdKJK71t3mcukK8i/B4q9J/7RuZxr777jIknCNDk4no4Mx3Eudz9Szp/lOoS8Kv0vFD4X4Tyf3zIM0Y+1HW+EdH9wcge2z4Den8Rg2q+cxRzKfXX5MBz+f8Wm+f1iGzFWMxcw0/twuGHUKcKqB6hFxCWUfUA92IE6AGWlx8WKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7jvtzbhmw7UC0eqxq2Q6fuyGRM7ouKizQtkNFJYFbs=;
 b=BbDu4Q8Fxr65anQ1K39xVdnRoLi/tQQITjHsMyY9H0SNTSuuSlodVwAIhLK3pawW29NkMFLJfSFZHCGCkOY+1FV/I9edd01i5k7nuGka002V8Cus7w5faX9uaKUWfqPNfDgL2x9dz4n6QTROjxieyCWlgz1Ljkaeic6LOH1+nBZzZilPhpTpjhIDZgSirfiRZ+G+WILxMLlH4DIf2m8BWZp4AnViYIjBh9TFCW+dKXJtNE8x5ybt9qPbMS5Vebw6Ym53UsQhxditWlH6Ju8u+zviK3HkgIVRY+ePRQLpFV8oz8LAIW4gUL+jlE3lcbSEhKzqLeapsegeJ5MCuCeNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8219.namprd11.prod.outlook.com (2603:10b6:208:471::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 22:53:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 22:53:11 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHa0i+fzQ2GW9y/kEOG6riv7NsSs7Hu34uAgAAhn4A=
Date: Tue, 9 Jul 2024 22:53:11 +0000
Message-ID: <d13595de1186ff8e1ed96d9231f406576ff77ed8.camel@intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <b50f7ae95234b15bd08d4cebd61a564faea7a8d9.1720550129.git.stuart.summers@intel.com>
 <Zo2jIfm1ceFclXZa@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zo2jIfm1ceFclXZa@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8219:EE_
x-ms-office365-filtering-correlation-id: 0df93b55-bffc-4c1b-0582-08dca069e8e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXFCNzZ2MXFrT1ZWbHcyMnB0NDlWaGxjZkd0bVVGVFdkcjRzckNTYnBoSkVY?=
 =?utf-8?B?YWovS0Rvd0JMZUl3cDY4RngrdHRMdElWK2c0M0hkQy9rOWVTUjFwTHVyMktm?=
 =?utf-8?B?bFpqcTV1bUc4bWlSUUdMQmY4WlQ5cmJkWmYyZEdyRzB0aVp6TVhuOTdpaE1Z?=
 =?utf-8?B?Z2NYOGswaEdsanVsYzk2UnExVEE4MGEySHJFTTBVTmIyaWI5UGVaUWNkRHBw?=
 =?utf-8?B?YnE3bkxjNTF3aWxtVW5vNUsyLzlzN0kyNE5zTzZ1V0ZYckZQNGVGd0ZReEVW?=
 =?utf-8?B?bG1NMDc0OGFMeklqbW1wLzl0a2V4aXFSamdTd0Y3N2orQldjbkZiOG1DcFg4?=
 =?utf-8?B?RC9pVDVXNi9yVzRCVjBpSnZOWVZxdXZHU0RYU3dBc2cySUpZUXdTN2hMMm80?=
 =?utf-8?B?cE1ickJ1SUsveFBjd1B4YkxyMGpkNUExZEk0Q0FTd2JwZmd6NWNhN1BmSmVp?=
 =?utf-8?B?Z09TV0dKc1pKNklQMUtxRlI4NjJvU2NqaVhGVGZCbGgzRUNLNDBrQjBYd3Z2?=
 =?utf-8?B?dVl4NVBLK1g3aEN1S3ZYRXNDMlJMZVcva2FYQVNWQ1owc2ZoUmdQNE9ZcWtX?=
 =?utf-8?B?ZWdrRFlXZ1E0UTVpeXRoTTF1NEIybHhzZ3FjQUY1Ym9WV2FVemh0eGFBMGh4?=
 =?utf-8?B?c0tnQlEyUTNQSlNMVkxkTSs1SkhyWkw1UzdtTXhRdnFKWkNqeDg0OXQwMTBW?=
 =?utf-8?B?N0hZdGZSZzQ1LytQL2ZGNEZ4eUxlN25FcldzVEtxYk1HenNKcHpUM2t6VTB6?=
 =?utf-8?B?UHNrKzdPaWluU2h3RnZlcHo5cHdUZjd4cnd0b0lHWWJJdDlqWlVvbXljYkFy?=
 =?utf-8?B?SUNhSTNHakFEZFU0emFqZWlnQmg4R0dreWs0cjRzS2lzWXg1Q2szOTc0ak9W?=
 =?utf-8?B?eEE5emltUXZSVzRNbndNbkUzZ0NaQ1NacCtJRXdtamlEeEdZRmdlTzV3YnpQ?=
 =?utf-8?B?cDN6T05ySkdCRW13NEF1K00zVjIzSXJURkJ1eVpCYjlQNnVTUTAxM1VLbCsz?=
 =?utf-8?B?bnN3SFVVR21zaG9uSmhyWmxKWnZGVDh3WXB1WUEwVkZ2N1FQZTI1OHNqeWla?=
 =?utf-8?B?K0FpRHlDTUt6NEFtbVo0TTNBRU82RTQ0MFBCWlROY2xOMENZZ1JZQlpQcUpB?=
 =?utf-8?B?Q2M3Y2gwRDVDVDVYVnh0UDkrMXpmV0FNVDZmMU5RTXZ0VnExTi9JUkRrVlFr?=
 =?utf-8?B?eUhkQ3VrOEFQVm1pOWZLZnMzYlY5YThmOWZ0NnNNcWxWWW9ORlBucmpQT29H?=
 =?utf-8?B?elowbWp4SkVZMXd6cWFNTTdsU1U3MGwyMVIrVFlvSGsxbU1RbXpMdTc1RUFT?=
 =?utf-8?B?MVVVc3V6ZEtRY2g1cFJzYkVsSW9uZzUzQUwrSkhBNGNJa25SVksyZkxydWti?=
 =?utf-8?B?ZkR6TnlDL21kMG9uOHhWRmthdGxxZzFVMjQ1S0t3S1NOZk1HZkFFLzNlTzkx?=
 =?utf-8?B?N2I4N1MzTmwydVJZY0k0SUQ1a21IbkFBeWFlNXJrSk9KalNMQnpFTlVXbFVD?=
 =?utf-8?B?bDlvRkhPVXdud2htTnlQV3hpcysxNllIeHIxdGpMMW1QTVdjSUJVZ050bnZT?=
 =?utf-8?B?SElkRFFueWJoYnVzUWkxVGJURitPR08xWVBwOHpDUVgxakFISXRKZW5LTWhJ?=
 =?utf-8?B?Y0tQMWQ0UVVxWjhodll0RVNaWWtCZEVhZHhaK2tHWWo2YUJoVGJqNWhyN1Zh?=
 =?utf-8?B?M00yZldSY3hLWkJLdUM5VnhlMXQxQ2xSNnl3dEo0dWNFbVM1eEU4bDRCUmdF?=
 =?utf-8?B?aVc0SnFJR2o1U3JzWHd2WWtya2U4VXFpcGdkRmxoZ3kyNCtMdzU1c29TOGdz?=
 =?utf-8?B?V05sQTM0c1crNytYRzZoQzNoNm9WNHQvSFBjWDZ5azVRYnNjcnljZ1NhdVN3?=
 =?utf-8?B?NGozNFdOVm1jUUtKL2YzZHhlcmltKzdma2ZkQ3QvbjNDN3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFBaeG1qK2Q5Q3BRREc3YXJmUmhaMnVWbTJqaDU1YURwVHNFVzljWC92WVd4?=
 =?utf-8?B?TTZWdjRLcGxGVTJZYVAzNnoxVU9WVVVickszOWZrUy9iakRzMUJQQkhFYXlB?=
 =?utf-8?B?dTZpUGRrd3BqNllTM2EvRzlnLzM5YVdkaEc1ZUVSLysyVDNZRGVmanJGQUwy?=
 =?utf-8?B?eTRKR0pJcDREa0RZSGo2a3lNYTJHOUJJWjg1K2tySjFRSUFZL3pqSU1QeHJ6?=
 =?utf-8?B?UGVKTTFUdjhjdlFuU1dBR2hyRDY4UFkzdm9MenVTR3crRklVbm10bzVMRENB?=
 =?utf-8?B?bHllN2JPMlUrTE05U2FvcmZiU0U5NnE1NjNjdzdqVDIyYVN1dCs1UWl3QzZY?=
 =?utf-8?B?WER2MXhoR085R2ttQlluYVNmQ2NoQTc4UGQrWHpGTTFja21vUDVMZ1lZODB3?=
 =?utf-8?B?WHJja1BmTVFxdEhuQ1Q2OWh5S2k2Q081S1ZValFCWDlNeWJRSk9obThTeE5H?=
 =?utf-8?B?Q0gwZWhCdGh5aEhqS2wvU2xtQUlzKzRzWG5naHM3YXlVaWo0SkVkU2c1N1Bt?=
 =?utf-8?B?bHVhUldnMFoxSkJxenhWcnFFUEE0L1JvRWRoRndqN2p3emM1TU9pOTZoZXBR?=
 =?utf-8?B?RTIxcnAzMW91TnlvUTBaWEkrWGdWVGlaU0RiVi9hWFBpK0I5WFBxWXFmZU9p?=
 =?utf-8?B?K0FSeEFYbC9tVENKeEVVT1NGRDJPWkxma0toVzliQkVzWXRyUm93aHlvMmtk?=
 =?utf-8?B?L1IwRDJMbUNKakVib0hpYnpnbmZUT3NXUU1nb2JhYm1QWXdkekZiRG0vYkZU?=
 =?utf-8?B?QVU3ZlNBWDVoMzFJVjJaZlJjMXA3clNWVTFrVGJXRTAyWTNlZEZ2YVFibzJh?=
 =?utf-8?B?N1pBWm5MN2ErS3J2dUg2bUNEYlZVODdoSWltOE92dkhDdk5OTUJBUDVlTHlV?=
 =?utf-8?B?RU03d1Z2QS9lNGY2QVEvZWUzUmVDRlBvSy9BKy9kUzV6Q3VxS08xazRaS1BB?=
 =?utf-8?B?SllEN051TW9IdE45Rm0rZmxLMEk4a1RSbVdlK3AwR0dIQThzdHo5WGp6dGY5?=
 =?utf-8?B?MjRTRURYWmVJYnR1aDlHY2VYL2IxSGRRVEtuMFAwOUpBOXowUnR1SXZ3d1lS?=
 =?utf-8?B?S1gyZldPZkorK0JYR1QyUGJ0Uk4rNUgzbWJrWDhGZ25QZWdtK3lnczBiNTlr?=
 =?utf-8?B?MXFkMndrVkMrMVNqZS9QYTY2cXVNbzgyRHBRQVFvb1ZiUXF2eVZTSjI5ajlG?=
 =?utf-8?B?M056bGIxWEtwSi93WGltdXlZdHNUaWxpaWRDNHJEK3MyaEpkckMxaVlBRzNK?=
 =?utf-8?B?VE5sRGlmdnJEdjMyZ1VLUjRwMlRGM1pzVmFpaHFuMTBnU2ltaHRsQTkrN3BS?=
 =?utf-8?B?RkJxWFAvdzQzT01KNXM5SkdBMmtZQkdaRUdqMEsvSHNTK2RzRXl3Zk5yblRj?=
 =?utf-8?B?VGFGRU1vbFlvU1h5d3VrZzBGamdxRURRY2tQOG10L3R1YWJ2dTIyWEZwc1Y1?=
 =?utf-8?B?VHlrRFFOVWJqK1UrRWZmNEhEaG8xbWk5VG5lNlJJWkEzdnIwb1U3VGlvelFi?=
 =?utf-8?B?VVBxcXlzOW1GYWZ4bjVWZFpvd2pRL1RNLzcwMWhORlhQQXlySDdvUnNUaGVF?=
 =?utf-8?B?cnZNSkxWVFpqS3lXQVBjZlNkU2RFTGdJdEJsM3lwWXYzdVZFdU9lY0pZZ3Br?=
 =?utf-8?B?K0tNQm1lS1J1YmpaZzFzL1RYc1ZrYlBwc2JGQlZOWk9xTStGMlZKMjYrS3o4?=
 =?utf-8?B?QkNGT2NUQU96cEhaaXlCMnNObjhDWklxaDhydHNCWXFjYVNkK2VQOGpiK2xs?=
 =?utf-8?B?T0dlNGZtSHdPNE5UK08rV0w0blN0aHJHM3JHT3J2R09KRUFpNDkvKy9DRlNk?=
 =?utf-8?B?Wk9BeUpnM29Vbmh3aGpBVTdOZVpxcGlIZDYxeGlhaTdjUU1SUklrRW80Qm1u?=
 =?utf-8?B?NHF4U0ZaSFA5VmR1cWIwQ1I2VWFHb0VWNnQ3b1FJa2dpaW1GU2ExV3Buemxi?=
 =?utf-8?B?dzFNM2g0UFR6RnpObDBDb2Z5TVBNaHM4Rm1ZSi9VN0ZUODFlUW42ZzBVZHZl?=
 =?utf-8?B?Lzl6SFkxUkN1OVg0d2tNNFp6N3lQNWlTRkRrWHEyL2VTWGxDNGtYUUYrdlZV?=
 =?utf-8?B?bHZ3dk9YekhieDh2ejRTNWltdlZhYi9EQUl0bXVwdXJTMXQzQjF2Nndrbzl5?=
 =?utf-8?B?MExuNmhPZXYrd3J4aEJVdENaUXh0ZDErN1dSeWNXcGVvMlJRT0JGR3BROEV1?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E64AEE240D11E44C952B6F834BE1D47B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df93b55-bffc-4c1b-0582-08dca069e8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 22:53:11.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nxq3iLpcTw8K1GIg5Xw3L8AHQe62jzBbq6sD7bybDhOD5fsATZYzE7DClH6CzjIuiBqPU3aYXRWwHeLJbvH9ZSsvtzj4Gn3EHBeYMHR8whE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8219
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

T24gVHVlLCAyMDI0LTA3LTA5IGF0IDIwOjUyICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDA5LCAyMDI0IGF0IDA2OjQxOjAwUE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOgo+ID4gQ3VycmVudGx5IHRoZSBwYWdlIGZhdWx0IHF1ZXVlIHNpemUgaXMgaGFyZCBj
b2RlZC4gSG93ZXZlcgo+ID4gdGhlIGhhcmR3YXJlIHN1cHBvcnRzIGZhdWx0aW5nIGZvciBlYWNo
IEVVIGFuZCBlYWNoIENTLgo+ID4gRm9yIHNvbWUgYXBwbGljYXRpb25zIHJ1bm5pbmcgb24gaGFy
ZHdhcmUgd2l0aCBhIGxhcmdlCj4gPiBudW1iZXIgb2YgRVVzIGFuZCBDU3MsIHRoaXMgY2FuIHJl
c3VsdCBpbiBhbiBvdmVyZmxvdyBvZgo+ID4gdGhlIHBhZ2UgZmF1bHQgcXVldWUuCj4gPiAKPiA+
IEFkZCBhIHNtYWxsIGNhbGN1bGF0aW9uIHRvIGRldGVybWluZSB0aGUgcGFnZSBmYXVsdCBxdWV1
ZQo+ID4gc2l6ZSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIEVVcyBhbmQgQ1NzIGluIHRoZSBwbGF0
Zm9ybSBhcwo+ID4gZGV0bWluZWQgYnkgZnVzZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jIHwgNTQgKysrKysrKysrKysrKysrKysr
KysrLS0tCj4gPiAtLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5owqDC
oMKgwqAgfMKgIDkgKysrLS0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCsp
LCAxNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZh
dWx0LmMKPiA+IGluZGV4IGRlZDhlM2MzM2E4Mi4uOGY3ZjY4MDMyODA1IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiA+IEBAIC0yOTUsNyArMjk1LDcgQEAgc3Rh
dGljIGJvb2wgZ2V0X3BhZ2VmYXVsdChzdHJ1Y3QgcGZfcXVldWUKPiA+ICpwZl9xdWV1ZSwgc3Ry
dWN0IHBhZ2VmYXVsdCAqcGYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBQRkRfVklSVFVBTF9BRERSX0xPX1NISUZUOwo+ID4gwqAKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnRhaWwgPSAocGZfcXVldWUtPnRh
aWwgKyBQRl9NU0dfTEVOX0RXKSAlCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoFBGX1FVRVVFX05VTV9EVzsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdzsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gdHJ1ZTsKPiA+IMKgwqDCoMKg
wqDCoMKgwqB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxKCZwZl9xdWV1ZS0+
bG9jayk7Cj4gPiBAQCAtMzA3LDcgKzMwNyw4IEBAIHN0YXRpYyBib29sIHBmX3F1ZXVlX2Z1bGwo
c3RydWN0IHBmX3F1ZXVlCj4gPiAqcGZfcXVldWUpCj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKg
wqBsb2NrZGVwX2Fzc2VydF9oZWxkKCZwZl9xdWV1ZS0+bG9jayk7Cj4gPiDCoAo+ID4gLcKgwqDC
oMKgwqDCoMKgcmV0dXJuIENJUkNfU1BBQ0UocGZfcXVldWUtPmhlYWQsIHBmX3F1ZXVlLT50YWls
LAo+ID4gUEZfUVVFVUVfTlVNX0RXKSA8PQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIENJUkNf
U1BBQ0UocGZfcXVldWUtPmhlYWQsIHBmX3F1ZXVlLT50YWlsLAo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZl9xdWV1ZS0+cGZfcXVldWVfbnVt
X2R3KSA8PQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9NU0dfTEVOX0RX
Owo+ID4gwqB9Cj4gPiDCoAo+ID4gQEAgLTMyMCwyMiArMzIxLDIzIEBAIGludCB4ZV9ndWNfcGFn
ZWZhdWx0X2hhbmRsZXIoc3RydWN0IHhlX2d1Ywo+ID4gKmd1YywgdTMyICptc2csIHUzMiBsZW4p
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGFzaWQ7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgYm9vbCBm
dWxsOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoC8qCj4gPiAtwqDCoMKgwqDCoMKgwqAgKiBU
aGUgYmVsb3cgbG9naWMgZG9lc24ndCB3b3JrIHVubGVzcyBQRl9RVUVVRV9OVU1fRFcgJQo+ID4g
UEZfTVNHX0xFTl9EVyA9PSAwCj4gPiAtwqDCoMKgwqDCoMKgwqAgKi8KPiA+IC3CoMKgwqDCoMKg
wqDCoEJVSUxEX0JVR19PTihQRl9RVUVVRV9OVU1fRFcgJSBQRl9NU0dfTEVOX0RXKTsKPiA+IC0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAodW5saWtlbHkobGVuICE9IFBGX01TR19MRU5fRFcpKQo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVQUk9UTzsKPiA+IMKg
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgYXNpZCA9IEZJRUxEX0dFVChQRkRfQVNJRCwgbXNnWzFdKTsK
PiA+IMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZSA9IGd0LT51c20ucGZfcXVldWUgKyAoYXNpZCAl
IE5VTV9QRl9RVUVVRSk7Cj4gPiDCoAo+ID4gK8KgwqDCoMKgwqDCoMKgLyoKPiA+ICvCoMKgwqDC
oMKgwqDCoCAqIFRoZSBiZWxvdyBsb2dpYyBkb2Vzbid0IHdvcmsgdW5sZXNzIFBGX1FVRVVFX05V
TV9EVyAlCj4gPiBQRl9NU0dfTEVOX0RXID09IDAKPiA+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4g
K8KgwqDCoMKgwqDCoMKgeGVfZ3RfYXNzZXJ0KGd0LCAhKHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1f
ZHcgJQo+ID4gUEZfTVNHX0xFTl9EVykpOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoHNwaW5f
bG9ja19pcnFzYXZlKCZwZl9xdWV1ZS0+bG9jaywgZmxhZ3MpOwo+ID4gwqDCoMKgwqDCoMKgwqDC
oGZ1bGwgPSBwZl9xdWV1ZV9mdWxsKHBmX3F1ZXVlKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAo
IWZ1bGwpIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWVtY3B5KHBmX3F1
ZXVlLT5kYXRhICsgcGZfcXVldWUtPmhlYWQsIG1zZywgbGVuICoKPiA+IHNpemVvZih1MzIpKTsK
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+aGVhZCA9IChwZl9x
dWV1ZS0+aGVhZCArIGxlbikgJQo+ID4gUEZfUVVFVUVfTlVNX0RXOwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHBmX3F1ZXVlLT5oZWFkID0gKHBmX3F1ZXVlLT5oZWFkICsgbGVu
KSAlCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBm
X3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHc7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHF1ZXVlX3dvcmsoZ3QtPnVzbS5wZl93cSwgJnBmX3F1ZXVlLT53b3JrZXIpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGRybV93YXJuKCZ4ZS0+ZHJtLCAiUEYgUXVldWUgZnVsbCwgc2hvdWxkbid0IGJlCj4gPiBwb3Nz
aWJsZSIpOwo+ID4gQEAgLTQwMiwyNiArNDA0LDU0IEBAIHN0YXRpYyB2b2lkIHBhZ2VmYXVsdF9m
aW5pKHZvaWQgKmFyZykKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAq
Z3QgPSBhcmc7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90
b194ZShndCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKCF4ZS0+aW5mby5oYXNfdXNtKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm47Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1
ZXVlKGd0LT51c20uYWNjX3dxKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1
ZShndC0+dXNtLnBmX3dxKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkg
PCBOVU1fUEZfUVVFVUU7ICsraSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBr
ZnJlZShndC0+dXNtLnBmX3F1ZXVlW2ldLmRhdGEpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
aW50IHhlX2FsbG9jX3BmX3F1ZXVlKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBwZl9xdWV1ZQo+
ID4gKnBmX3F1ZXVlKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoHhlX2Rzc19tYXNrX3QgYWxs
X2RzczsKPiA+ICvCoMKgwqDCoMKgwqDCoGludCBudW1fZHNzLCBudW1fZXVzOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoMKgYml0bWFwX29yKGFsbF9kc3MsIGd0LT5mdXNlX3RvcG8uZ19kc3NfbWFz
aywgZ3QtCj4gPiA+ZnVzZV90b3BvLmNfZHNzX21hc2ssCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgWEVfTUFYX0RTU19GVVNFX0JJVFMpOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgbnVtX2RzcyA9IGJpdG1hcF93ZWlnaHQoYWxsX2RzcywgWEVfTUFYX0RTU19GVVNFX0JJ
VFMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgbnVtX2V1cyA9IGJpdG1hcF93ZWlnaHQoZ3QtPmZ1c2Vf
dG9wby5ldV9tYXNrX3Blcl9kc3MsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYRV9NQVhfRVVfRlVTRV9CSVRTKSAqIG51
bV9kc3M7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiB1c2VyIGNhbiBpc3N1ZSBzZXBhcmF0
ZSBwYWdlIGZhdWx0cyBwZXIgRVUgYW5kIHBlciBDUyAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgcGZf
cXVldWUtPnBmX3F1ZXVlX251bV9kdyA9Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgQUxJR04obnVtX2V1cyArIFhFX05VTV9IV19FTkdJTkVTLCBQRl9NU0dfTEVOX0RXKTsKPiAK
PiBUaGlzIGRvZXNuJ3QgbG9vayBjb3JyZWN0Lgo+IAo+IElmIHNob3VsZCBiZSAobnVtX2V1cyAr
IFhFX05VTV9IV19FTkdJTkVTKSAqIFBGX01TR19MRU5fRFcsIHJpZ2h0PwoKWWVhaCB0aGFua3Mg
Zm9yIHRoZSBjb3JyZWN0aW9uIGhlcmUsIHlvdSdyZSByaWdodC4KCj4gCj4gQWxzbyBJIGJlbGll
dmUgd2UgbmVlZCBzaW1saWxhciBtYXRoIHdoZW4gc2l6aW5nIHRoZSBHMkggcXVldWUgdG9vIGFz
Cj4gUEYKPiBzaG93IHVwIHRoYXQgcXVldWUgZmlyc3QgYmVmb3JlIGdldHRpbmcgc3VuayBpbnRv
IHRoaXMgcXVldWUuCgpBaCB5b3UgaGFkIG1hZGUgdGhhdCBjb21tZW50IHRoZSBmaXJzdCB0aW1l
IGFyb3VuZCBhbmQgSSBtaXNzZWQgaXQgOigKCkxldCBtZSBjbGVhbiB0aGF0IHVwIGFuZCBnZXQg
YmFjay4KClRoYW5rcywKU3R1YXJ0Cgo+IAo+IE1hdHQKPiAKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoHBmX3F1ZXVlLT5ndCA9IGd0Owo+ID4gK8KgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmRhdGEg
PSBremFsbG9jKHBmX3F1ZXVlLT5wZl9xdWV1ZV9udW1fZHcsCj4gPiBHRlBfS0VSTkVMKTsKPiA+
ICvCoMKgwqDCoMKgwqDCoHNwaW5fbG9ja19pbml0KCZwZl9xdWV1ZS0+bG9jayk7Cj4gPiArwqDC
oMKgwqDCoMKgwqBJTklUX1dPUksoJnBmX3F1ZXVlLT53b3JrZXIsIHBmX3F1ZXVlX3dvcmtfZnVu
Yyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgfQo+ID4gwqAKPiA+
IMKgaW50IHhlX2d0X3BhZ2VmYXVsdF9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpCj4gPiDCoHsKPiA+
IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiA+
IC3CoMKgwqDCoMKgwqDCoGludCBpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGksIHJldCA9IDA7
Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8uaGFzX3VzbSkKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoAo+ID4gwqDCoMKg
wqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBOVU1fUEZfUVVFVUU7ICsraSkgewo+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT51c20ucGZfcXVldWVbaV0uZ3QgPSBndDsKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmZ3QtPnVzbS5w
Zl9xdWV1ZVtpXS5sb2NrKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJTklU
X1dPUksoJmd0LT51c20ucGZfcXVldWVbaV0ud29ya2VyLAo+ID4gcGZfcXVldWVfd29ya19mdW5j
KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9hbGxvY19wZl9x
dWV1ZShndCwgJmd0LT51c20ucGZfcXVldWVbaV0pOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIChyZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqDCoMKg
wqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBOVU1fQUNDX1FVRVVFOyArK2kpIHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QtPnVzbS5hY2NfcXVldWVbaV0uZ3QgPSBndDsK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+ID4gaW5kZXggY2NiNGY3YjJiZjE1Li5l
YzY3ZDZhZTMyMjYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlw
ZXMuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiA+IEBAIC0y
NzIsOSArMjcyLDE0IEBAIHN0cnVjdCB4ZV9ndCB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCBwZl9xdWV1ZSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQHVzbS5wZl9xdWV1ZS5ndDogYmFjayBwb2ludGVy
IHRvIEdUICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0Owo+ID4gLSNkZWZpbmUgUEZfUVVFVUVfTlVNX0RXwqDCoMKg
wqDCoMKgwqDCoDEyOAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoqIEB1c20ucGZfcXVldWUuZGF0YTogZGF0YSBpbiB0aGUgcGFnZQo+ID4gZmF1
bHQgcXVldWUgKi8KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgdTMyIGRhdGFbUEZfUVVFVUVfTlVNX0RXXTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMyICpkYXRhOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKioKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogQHVzbS5wZl9xdWV1ZV9udW1fZHc6IG51
bWJlciBvZiBEV09SRFMKPiA+IGluIHRoZSBwYWdlCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGZhdWx0IHF1ZXVlLiBEeW5hbWljYWxseSBjYWxj
dWxhdGVkCj4gPiBiYXNlZCBvbiB0aGUgbnVtYmVyCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIG9mIGNvbXB1dGUgcmVzb3VyY2VzIGF2YWlsYWJs
ZS4KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICov
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBw
Zl9xdWV1ZV9udW1fZHc7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAvKioKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIEB1c20ucGZfcXVldWUudGFpbDogdGFpbCBwb2ludGVyIGluIERXcwo+ID4g
Zm9yIHBhZ2UgZmF1bHQgcXVldWUsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBtb3ZlZCBieSB3b3JrZXIgd2hpY2ggcHJvY2Vzc2VzIGZhdWx0
cwo+ID4gKGNvbnN1bWVyKS4KPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKCg==
