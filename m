Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE229C3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 19:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE2C10E2F7;
	Sat, 20 Jul 2024 19:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gviQZdhI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BA310E2F7
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721502281; x=1753038281;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eMC0WKz/buwiTK8b7anlH2N8SKlIeVlcJHgXuKXFoCs=;
 b=gviQZdhII1Dju2SNXf0XvVvMOaul/mlDoSKRWYb9fYoJ7QecYCTyY88d
 72BqH5TQlA9BenLntsgg5zbXxqOZ0v+t/+WofjzBOcBFbMS4u8UTDbXgm
 /PmfNaP5iL3Ldc3LUUf9upXTmkIk6OMB38WlabHbFbanpUZrgMKiEkpM2
 /nSBACDdrjtnNJ/FLacBWpo1ld7GyvAJBVZuvCssiao1OM6ILM7wlgqTd
 5kQ/kix1q64jJ6/y8+9iD0hGcl1iqpfleBp2NyL7KrlIdnEtaM9TYUc0M
 eMcd3yB3c1ssYLWYEW+7DFF+9w1N5O73BgJVURhZKm4Ui79sXadAubCS1 A==;
X-CSE-ConnectionGUID: p96CR/4xRqeVawVPGQ0PsQ==
X-CSE-MsgGUID: JpsmzeA2RAy4odguwW5qKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18925511"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="18925511"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 12:04:41 -0700
X-CSE-ConnectionGUID: VxruPIbeQRu/q0tulcRggg==
X-CSE-MsgGUID: b5cYrBtBSJiEiNzrvxvdow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="82479576"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 12:04:40 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 12:04:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 12:04:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 12:04:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 12:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVdN/BMDOG6Q2jqVk8+ZxbzIgN5vUQG8CzGrRj8yt13kvW0jUBDcJ/Ms02784KrBo7G0H02i6RWNAf/3CqEwac8EQI42YmxUqOYJY1+Lljv99H+t55bVvMvnzJphDbNJhpNaf61QJ6O310R8TwIfoVtEYWQiJVej53FLge9ehewY977JHYrJtiRgfigt6wYcYRhcIuzBkNXf4MFuS2B32yfdzv14eYObzbQM1/u4XG2y/72ugQO4cECIcDJLHfnp8Y/ZhQDsd6yQRTbeyj4VD35lb8HKAXxEYg0gQ3O8raWrkV8Zokz/0I3GXnbqv3gikn+exwvCH89l/2KcMY4PGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvRWuDhv3k459CRwyB6zokNCFggGvZLA1AXBnssF5dc=;
 b=wEx3sY//2SnbOXpQwm6pmNXngyN382K8dkOe194O5+8MnrQXrSGBXaMWHecdnl9dqGrSe+ciPDEUmb2gBXxWbagRODMh98iJqrZJEgHztxKs5O8+o43UK4hZfGx8QCnmueuzTwydUQoDow5koanzf/Gc7sXE2I28AgSizVplQEwdUr9/rIbPWHPr5dtkSSNsUBmK7DApp9G9zpADcCbnwmv2W7rRKULVyniNJY5+NGbGAVKSdsAhHTBoNYaq/G8kVu2W1BYP6Lj4tGiabNk9KRRwHZiylqb1qEHfJ+ObJpNDu20O5WD/69eT2tM0a/v29vtVm/H2dkyHaIwXo+3UKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sat, 20 Jul
 2024 19:04:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Sat, 20 Jul 2024
 19:04:35 +0000
Message-ID: <3bf93639-74b9-41ff-9d6c-1911506772a2@intel.com>
Date: Sun, 21 Jul 2024 00:34:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <paulo.r.zanoni@intel.com>
References: <20240719172334.1527484-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240719172334.1527484-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: adcddeed-c515-4168-b6c8-08dca8eecb54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEJRdFJQMmowOENSbWYwTWJQbS9sWG84UlR1LytNUjFSMzVqZW9NN0NqS0FM?=
 =?utf-8?B?c2JGNGQ2NVRvYkJnckJ1ZUlCTm1BYmFhbE1LaklneG1OeWRNVGxRakJteWhC?=
 =?utf-8?B?WEF3MEtIWlpYQTBXUDN3cTJIRnBuajZBRVVla0Ixd05IekMycXJFNHJWekZh?=
 =?utf-8?B?Umg2NHdjblJjVVVRQUROc29CYkNadlNvdzdsSFhnN240a29tVTUwMXY0T25Y?=
 =?utf-8?B?bWg3cEVJdGt4empUU0NORnJaV2h4QS9GLzNXeFV2ZWxWT1hUcDVUK2ZHRDEx?=
 =?utf-8?B?V1d0TXRmMXhjdmJ1bndGZHM4bllncDV6R3hpdHF2cUlVdjhhbWlEU0IwdWd0?=
 =?utf-8?B?bzZoSHFocko3cEVCV0hCRzhSQVVmb1c4Vm84VERMZWs2ZHZFL1ZoUGZRSlJT?=
 =?utf-8?B?RGFZZWdZaWVlbXZmU1BqQnpiclo3dEw2RTgxQXBpc24ydnZVNy9pK2NyaXhE?=
 =?utf-8?B?cFlUVUVJU2NqQm91cHpVeFRwYkxaMmU3OGhIYW4zalp0T1FpZnRYbm1heSsr?=
 =?utf-8?B?bXBjcS9PQzlXSWY4QmpsTG5NL2piQmVDeHc0Y3JMS0Jldm9DZ2U3dXZvWGMw?=
 =?utf-8?B?WnJXZG14NlluOWtCT2FHWEJaMTBFRnA1SVVwRmNzNGU2b05LU3BCYjd4YmhE?=
 =?utf-8?B?bHBkY0xRcjdDeW5CMi9vbGJNbjBjemNlSE1iZWlPQkl4bXpDN2FaQ3hXZjQv?=
 =?utf-8?B?eU1Qeng4a1VZSmdGRUwrZmVjUWl2WjBocFB3V3hZRVB3VkdLZ1M3bmhqWGR0?=
 =?utf-8?B?WnRPcEI1aGxWaTQyQjVHNG5pclRaMDJJbElRUFkxdXc5azBlUWZyMVIvRlYw?=
 =?utf-8?B?eFVDNkdTVTF0azZ0R09wN1M4S3QzdWptWSt6aFJLbCtKM0ZXaHZ1ZG8wNHQz?=
 =?utf-8?B?TmZoWDJzU01idGNqbTJIZ1dlQ1dtUHZhT3c4c0g0TVYwRUs1Yi9lZjhWU0JT?=
 =?utf-8?B?RVdJbWVvKzRyeWd5cUt4VFNpYkczek9qWVd2RW5QcnZhZGVXYnM4eXlvLy9X?=
 =?utf-8?B?Tk9xTHJ3WmhwNnlKQWg3MDBzTC9KNjdyZmt6cWcreHJMMDFoY0M5Qk9sS1ZC?=
 =?utf-8?B?dU01czZYVEdiYVdQTFVwQTNNVW53SXRzWG1KbmFQUHhDckkvTXFuSHE5WHB0?=
 =?utf-8?B?VlV5MW03cXozVkdMN1NFYjFRVnJwZ28wdDdSaGFoMjdvSlBtVC9Kb3NHRGkw?=
 =?utf-8?B?OVo0OUNjV1BiRWxlVXlGdjVkV1Y1UUFyR3NsSU5Db3pPcnIzdUkyWUFTWGdF?=
 =?utf-8?B?L3ppdThFblJSSmpwSHpxOGwzK3JUYVA5dmpGUVkzc1YxSG8vYVQ4cDlORDNI?=
 =?utf-8?B?aExOYlJXKy9MWWI2eVc1Q2lvcEg2YkNsYTJpSGdMSVpaZTJMSkdqb2FLMnRi?=
 =?utf-8?B?VUxNSU4zL21qM1VqVUlMYVZHSHRKYjhlZFRHays4b2dzVXVDZVVxZUx6S29S?=
 =?utf-8?B?ajFpajF3dlpaSjAyckJ6U2JTMGk0aHVwSk13ZlEzRTExcFJnZUNZU1puNlBT?=
 =?utf-8?B?N2JPQ0xMR0V0QmFwSWtmVjliQkcrcG5kdzhFZStYallkb09jTGRQdlA2NUM1?=
 =?utf-8?B?S0gwQ2tWdEhkWG40RjJwSDhBRTBFbmhzb05vNzZSdXZGZ0pkMWczTzE1Vkd2?=
 =?utf-8?B?RmFJNWpkZTJCY3RWcnBDcnFESWx3eTIxREEzL0NSSDVNSThGUWZGVFdJYmNE?=
 =?utf-8?B?MzdXRjR3anNKMFR0bGN6NG1iQ21MOWUxZWltZnByOHZYbEhxUnBNSDJzSld1?=
 =?utf-8?B?enBFUGVJNCtpRDZuNUJPV3p1N1ZNMXZwUExMYWFRSWVtdXJxT04wUi9ZV1lR?=
 =?utf-8?B?aDNwc3JYVlNKVzQwM0Irdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkYzWWtGaHFuMzdDbnhPellXVnQrcnNsOVZ5QXo3Y1ZUVHU3V0tMZXUvQUZ5?=
 =?utf-8?B?UjBCbXQ5aGxscjhZeURCZkpveDF2MUlHVFU1Y1N5V0ZRRFY0M0diM3ZzNURt?=
 =?utf-8?B?K1BTRDkrVytaRy9uaUI2azErYjV0REVRZURrTEZ5YVdHQkFaVFh3TURwQVR3?=
 =?utf-8?B?aFo1WWRIcUlQdFpNczVySkJSaFFMeVJ1c01naEMvWTFnSWNBby9uTTVZTloy?=
 =?utf-8?B?SEl4MzlDTVRkNWUvMWZTckMxbUFUaC92a21laERYQnpTY2J3UDlEZUwyQlYz?=
 =?utf-8?B?TFFwUjZmRVJ2cmpXdVNNS0V4Mm9oQllBWm1ldHRzMFVCZHZvMkFoRVNFaVd4?=
 =?utf-8?B?bHBtUVlIMDhJblV4L1ltTjVtQ3ZTNUJibDM5T3V6bk5GYlZ3ZFZWdndDS2pD?=
 =?utf-8?B?VWcxN1Q2N1ZueXI4cGNZVzZqbG1GR2toV2s0aFdJZGdIbUprVVBIQ3BUK3pC?=
 =?utf-8?B?WjAvTmVaUHR0Q1cyK0xqVXpTNVBmb3U0c2F5SVUvekJtOG1sd0NRSHcyY1Vj?=
 =?utf-8?B?dklJc0FTWVRuekdmbXM1R2I3dG10Z3BLSWRjUVMzMDNGZ3FBM0xuQ2xYZGc0?=
 =?utf-8?B?SitNamlvK2NOVVQwb0VFL24zaGluTjNPUlg1RmFBZlJvMzZsWmREaXd4MXE5?=
 =?utf-8?B?WmlPbGxvZVE4c3ZHVkE1K0FQaldrU3h1L1NGdXk4ZU9EbWp0cFdXUUFwSGZI?=
 =?utf-8?B?blhMWFRZZ0ZySHVJdGcxeXU3dzloTUxCbGlpY1RTUUFUb1lvYWxlVDBzMWdh?=
 =?utf-8?B?MlU2RVh6V2ZZZ0N5MmhtMVRaSmpYWjU3M1hURHJuelg0YWo2d2NxUXFiN2w2?=
 =?utf-8?B?VlFtZUs0b1NQaFNENEFvUWUwZ2k5WHBxKy8xODRJQWJ4WXhkc25QbDJxSjFx?=
 =?utf-8?B?Qzl0alpHY1l0NVBTMmtlOVd4ZndpeEMxeVBIT1R0NjhCNzZubm9rQk1YV2dF?=
 =?utf-8?B?VUhHQWc1T2tpZWJZSTB3LytzT1RGMEZka2sxZXAwenRuMVgzeC9tSi9ST21U?=
 =?utf-8?B?cWNneVk1YmhkdzZHbHJhajFRQXNHMDlLMDUvZkZXNjFydHhwdFFtenQ5QVdJ?=
 =?utf-8?B?TUVWbkltQkRJblI4R3h4L1VFQlcwWUZxV3dHQTd1R0lFZUxMa0NvcE9yM0lF?=
 =?utf-8?B?S00zSG12NVpTTS9LV29mYnlNbldlVFZVWWlDSHF4YmFaRWc4NjB3bVVrUXA4?=
 =?utf-8?B?YllVQjZzWVBGSXlKNGszdGYybElKN3lySGgzZ0ZaQW9lNWZOU1poazd0c3Y3?=
 =?utf-8?B?SmgwcGJ3RGFiVUN5bGgzejY1RndwTEtiR3kwMU9sTFRrMVVGNTVuRUVzeDhP?=
 =?utf-8?B?ZHpVeU82N0R0TWZWU1F2WVZhTE1Bb1FRb3dVU1FBRzlCYzdGU2ppenVNVWRp?=
 =?utf-8?B?WkpXUFpWVmUzWlhjQ3ZmVmt3WnptV0pEVjZNNmZKWGdVcDBGNHg0M2N2U1d0?=
 =?utf-8?B?amNsTkJxM0dMaC8yOEVRdG1uV0RFOW14RDFVZlJKWnBncG0xL2o0bG5wN3Q2?=
 =?utf-8?B?Nko2bTlHQmFBVCtleHRxWnRpMm1veFBiZmpYdnRKSjRhQ3FPSmlGUk5pdHE0?=
 =?utf-8?B?M1NXZ21BKzBFUTlPSk1SY2Z4NGZOMWg2OWxFSVFHVWhLMWRXazNzMjBXS3Bo?=
 =?utf-8?B?WnltQSszRENydTJpTDZGMTNUOHN3NUE1b3AvMThyOVk5NDhkbGxEamNkUXNU?=
 =?utf-8?B?MHA3REVibDdBL01aaHFiVkxXWnplVmhua2hQY01nRG50TFZreHBXYzFKYWQw?=
 =?utf-8?B?STJLTlUxZGNJMnJacC9kTk9JaWdMWktOeG1mN3piYjdCM1ptd2E0Mnh2QUV2?=
 =?utf-8?B?Mk90aGFQZmRKYmxVL0Y4ejFYd2t2NG9LTnRtUnNMMDNCMGNvZGVrYTNGQWFS?=
 =?utf-8?B?MGdRYlR2WHVoNURyTVFCTk9yb3kzeW1NVDMxS1dsVXRGNWt2dVBjTjZISGJk?=
 =?utf-8?B?eWhIU3d0VUhXMHN2cWRLTUsvTXpUcmw5U2hZV1pSYStpVGt0MDZ4bVFBS0dn?=
 =?utf-8?B?bWp1K1BYSG5YSUFPR0tmZmdTNUI3bFhCbEFnSm5BTGN3dkZrTnFzT0JvdFpG?=
 =?utf-8?B?OWpjWnFQbkZOcE5YeFBvdjNnTVkxYUtHcjF2UzdGNDZhTy95b3dDcFdWd0Zs?=
 =?utf-8?B?K3JYUjR5Ylk3eXUrWS80UE02aVNtRElTazZjcFNFeS9oYk5kVmFoNXBMYkRV?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adcddeed-c515-4168-b6c8-08dca8eecb54
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 19:04:34.9618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6shSsARc0VC97stRlaHaqnRDVFi/p8nyt0aMzNaLqJxHz8SCkBEnvosZDsnQSMqdI/atDc7tR2RYQXd0oNezAheDYvhRJlLZlkGia5Zpy4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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



On 19-07-2024 22:53, Matthew Brost wrote:
> The size of an array of binds is directly tied to several kmalloc in the
> KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
> the case of these failures.
> 
> The expected UMD behavior upon returning -ENOBUFS is to split an array
> of binds into a series of single binds.

Would it be appropriate to have some doc/guidelines in the form of 
drm_err or kernel doc regarding expected behavior from UMD if the ioctl 
returns a -ENOBUFS error ?

> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 3fde2c8292ad..b715883f40d8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>   }
>   
> -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> +static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>   {
>   	int i;
>   
> @@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
>   				      sizeof(*vops->pt_update_ops[i].ops),
>   				      GFP_KERNEL);
>   		if (!vops->pt_update_ops[i].ops)
> -			return -ENOMEM;
> +			return array_of_binds ? -ENOBUFS : -ENOMEM;
>   	}
>   
>   	return 0;
> @@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   			goto free_ops;
>   	}
>   
> -	err = xe_vma_ops_alloc(&vops);
> +	err = xe_vma_ops_alloc(&vops, false);
>   	if (err)
>   		goto free_ops;
>   
> @@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>   	if (err)
>   		return ERR_PTR(err);
>   
> -	err = xe_vma_ops_alloc(&vops);
> +	err = xe_vma_ops_alloc(&vops, false);
>   	if (err) {
>   		fence = ERR_PTR(err);
>   		goto free_ops;
> @@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   					   sizeof(struct drm_xe_vm_bind_op),
>   					   GFP_KERNEL | __GFP_ACCOUNT);
>   		if (!*bind_ops)
> -			return -ENOMEM;
> +			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
>   
>   		err = __copy_from_user(*bind_ops, bind_user,
>   				       sizeof(struct drm_xe_vm_bind_op) *
> @@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto unwind_ops;
>   	}
>   
> -	err = xe_vma_ops_alloc(&vops);
> +	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
>   	if (err)
>   		goto unwind_ops;
>   
