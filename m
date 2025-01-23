Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE40C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 18:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB14F10E02A;
	Thu, 23 Jan 2025 18:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g726FDwO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B33F10E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 18:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737657940; x=1769193940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Hvd96dTE8DYWNTLck064OY66m9oBnLu3SPwbcOTNQ9g=;
 b=g726FDwOiM6qC1FP/JzDF6a9q/q0YtPjA65EvZTlEjgQzHVXs+RLppmw
 B3feIutzUs4ROOTCodqis3Etn3goXfkEYi+wBkYHV9hNIfOujAU0ax+cA
 3JMKMe/MrGerCb3eVYYJ5YlwF5hGLBf1yTB2xMyBHwYqgUxMHL0hoDmAR
 EuqV0s80QdxAX7Eo7u5Wczjl3hWH7AXqIX0Dl91ieMeONu+CiUdElLfH4
 yqw1gRYFrj5FfqrZUJw20ngMPVxOE7U6oloebAMDTkD63GzSZVuRXCx6s
 VGXaSQHxH9/hpH8KQ01pCEECQnHnLeHIeUwXl5NSepBKwyfQPs1Ghu3ap Q==;
X-CSE-ConnectionGUID: V3Veza6WShuWo2q4K4j7FA==
X-CSE-MsgGUID: UJ9kAYYBSdWHJMMtNC0m0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37873931"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="37873931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 10:45:39 -0800
X-CSE-ConnectionGUID: eEJ9mmUGQ5CUj2KR7tCjeA==
X-CSE-MsgGUID: gewNUGUQR9aVLH+x6CjBFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="112566530"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 10:45:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 10:45:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 10:45:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 10:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gojp+TVVeEpiJsW2E9X+jF1VyoOoVh3VNcFTcia5sHkSEj1QjbG6iGXD54D5u6OSIZs6sKEU8CBkRYlugioVDV8kMujJTFp1NDQO/D1ziyS3ckoVFtSQbPRFVkfJutRdROrxGmeEnMmT0EicD487lWl2oialc/qDII+C/uPBSAc8URzsIm78eLK4SoVmpdKmyolBr0cAUIrDxJMHbcVsOrqEkUyKmpqPACs5EIDeFV4msWZo+XEN4Z92cndxfEwwBHImbTcqyb1xuv1vgYJ9mlJwApb4w155X4HqYcAhFuq78NgoNIPSfhrLuKlBJyyM/GXiaf981LD6lUF90d1ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hvd96dTE8DYWNTLck064OY66m9oBnLu3SPwbcOTNQ9g=;
 b=igbGzHydtsUO211VkkJeCPlB7hWBDe8tvWCNSWBdIMAg5NIEdC4AEyW05Hr6yzWIboLG5AvFo1KXid+ac68PfkNF51Hx4Ox9HAdVCpSzkrqshYjB3Dxd6YXKtddZsjKrNvrPwgAksDtIUlN5baf71tG6EBzA7KPMhUIe18Y3s8+gfC3/S54pSIqpE7HvshZkB2T/B1Q290akYXKCzXDVNXgIrlKtSC4CuSbO1O8AZwvS1GICss++D5zR87fi5wyfD+Xiby9Uv946Z1Cjpyt08rD46h/rm0zAwShdBjwE0md2Fx2SnF0zadhW7feDaLShl2yl1RX4BahbbMqgsQk6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ2PR11MB8469.namprd11.prod.outlook.com (2603:10b6:a03:57b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 18:45:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%5]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 18:45:04 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
Thread-Topic: [PATCH 2/3] drm/xe: Make GUC binaries dump consistent with other
 binaries in devcoredump
Thread-Index: AQHbbcEpYSCao2jhxUWUP1+Y/PqHjrMkqp+AgAAHsAA=
Date: Thu, 23 Jan 2025 18:45:04 +0000
Message-ID: <c9c4edd6ff425db18c189e09d12365f27aefbdc7.camel@intel.com>
References: <20250123180320.66198-1-jose.souza@intel.com>
 <20250123180320.66198-3-jose.souza@intel.com>
 <9c1e56c4-4809-4f11-a41d-ecf6754de6ca@intel.com>
In-Reply-To: <9c1e56c4-4809-4f11-a41d-ecf6754de6ca@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ2PR11MB8469:EE_
x-ms-office365-filtering-correlation-id: 798caf17-33e8-44a6-a760-08dd3bde0d0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WGtraGtpTzV1Z2FxcU9iTFB0K0hJaE4wZ1VYKytIV3pJTXRJbzYzOUd6MkpF?=
 =?utf-8?B?cEdIa2ZWRUNqVVlDNmNPM3NQZUppbit1N1VEY1Y1azVPRVNtZDlQSEwrMysw?=
 =?utf-8?B?bVFjWWdVZmU4OGJObngxeU5DZXIwL2pjZ2ozaXA1MjdudVBBRWthMGQ0SlZx?=
 =?utf-8?B?b2ZlWHNld2xsRnNMb2dCRHc4VTk5MUNwVUtPamxnYm83bzFxcEM4eXkyWWJL?=
 =?utf-8?B?amk1V3IzWnJERTRYNWE4OEtPOVdjWVpINFJTMkpZU3NiVTQ0Um8rWWJXWHV4?=
 =?utf-8?B?M2ZiTFZyQzdZeE93ZTJuNWxmb0dkZ0xsVnNvT1NLV3ZPdVlJUyttR1hpQVh0?=
 =?utf-8?B?cVFIa3RhYUhtSVZWcUNaVmYrTjNBQktuMjVIQ3cvOCtWOHhET0hiN0RaVnhQ?=
 =?utf-8?B?NFdvb04vL3B6bkxEelVHVlVPdVFuOCtvbDcyMjRqcVp5UlJzaytWY1pVdGpC?=
 =?utf-8?B?YTNhSzJBTzRIdHgxOEJrUHlFZDBGc0xDcDEvWTJwMUZ2SWdkcEtkSDJtVmdQ?=
 =?utf-8?B?UXFhNittRzdmMzNwUm56TEpGbFlWU0ZOOUNWdjFqb2F4dTBlS2pYcTB4Wkx4?=
 =?utf-8?B?eWd4Ty93YTZiK2hXQUtpaFBHTjVFVW9QUWhHYnNjemVHb3NoU0hHWFlXNVVM?=
 =?utf-8?B?RndNZ2k1Tm05RnUrWTFlS1NBSnFqZFVTcWxoTlNFUUtpOTZNc3pIUnV5RHQ5?=
 =?utf-8?B?WXh1RXgvVnlrUVRwSUUvMTRoeWxJM3NteEtTcHNJVU5Sb05uaEIvRFVmdWxI?=
 =?utf-8?B?cDVoQ0hiaElYamNmd0F3YVRGalBXZTdVUndPaVlBYkh1TkZ6ZkJZUzFBZ25W?=
 =?utf-8?B?TVl0S2tMUkpYUzByVW81QWoxWHdxWjlnS29qcjVGUnExNHJYRUV0UVNqbVYy?=
 =?utf-8?B?Y0NEOXZEbXpzV2pnS3NoOE4wdUtYVWI2N2h1RTFtUXViQ2dxYUNidnJxMEpL?=
 =?utf-8?B?Tms2MlBTMDRnODhIT2c2Mld5bmJYS2Z2TkZYQ1ZObklQQmZ4N2lqMnFHaTBV?=
 =?utf-8?B?N3JINE1aa3lFK0NYOStJR1lTbHdvRTF0ZFI3N1A4MmpYbWN3YVRzc2gxN1ZJ?=
 =?utf-8?B?TkhzU0lMSVlub0FyZHlYVzFzVEtMYm9SMWo0dmEzZnhrYnBPS0N6L29nVmUy?=
 =?utf-8?B?Qlo4WUczSFlDS0tXdmtGV1BBMTNvTWpCWEpWcHpmRm1EMnJ2WUllUXVsc2li?=
 =?utf-8?B?eUNhcGRwcGtpOHRBaFR4RWVGNUZMTnVyellUU2RRNlZOVm9lR3lSWEdQV2FT?=
 =?utf-8?B?eDlQWEhXVWtIaUpsODlQZXBZSVVVQXlnQW0vT3dHa0RGWnJ3WExJeGJpRlgy?=
 =?utf-8?B?Z1VxWHNHMGVQdG1kK3BKSUxPR2hJSGMvUXpVREFCWWQ0ZmN1Zi9uZEVVT2I1?=
 =?utf-8?B?cUlibEZNbjJLRVljSTJtRDBucFlCU1VGbVgzTUlqRG5BQStEbmx1VENjL0xR?=
 =?utf-8?B?LzU2WUVKdGZKMlIxWTA1aGN3b2ZEWGJZNEVyd2dCU3B1TTN1V1RpTVFNMkpx?=
 =?utf-8?B?ZDZ2c1pZVmhMMWlReEcvRGRuSzhmMTFMRmZ4b2tOdHNHZjNCK1hEOFRSdjlu?=
 =?utf-8?B?YWNKY0hFbFY5c3BnZ2dNdkhBRm1YQ2xwY29iOGhtOVdoLzJJU2xnbEdoSG5L?=
 =?utf-8?B?Q0FYS2luOG1oV29ueUNRc2djZG5jUzFrQVFTblZwQ052V3FYcGdMQStNd1pu?=
 =?utf-8?B?dTl4UldUMC80ZFU0TXNyUm5RbWtmOHJkazAyOG5nR1g0eFl5NmZibk9ublRY?=
 =?utf-8?B?TVc1UDFqeDhBbmVPVnJnWXpHaFdtTmNJaW5GWGo2bnczL0xoclJ4Z3AwSHh2?=
 =?utf-8?B?RmJlcEc4bFdjUmF5YWx0ODBIWkphdUxSK2laV1VBNU9nNGE3Ui9ockYwdFNl?=
 =?utf-8?B?bjhOaS9IaHJqaUhOYmtKeVByb1RxbDR3MTNtYVByaDZuSnE5aWxUNXYwaG9t?=
 =?utf-8?Q?ON1r5v8GVMq3nP1aCmIqdtssm4jqIwwi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3BZMWNrMEphRnpZTkdhMUdZT1BadmszTTR4cmhObGxPRXNsTElxQ1VKenc3?=
 =?utf-8?B?K2pYSXVzQWJNRGYxMlVOT20rdWxDbjVFRHFNcG54Z3pzWkhBbHo2V2R4d3U4?=
 =?utf-8?B?N3c1UjlRcjAyQllvTC9scWlOd2FLOGtlZVhucEpwekZ4ZFYyNWo2a3FtdnZL?=
 =?utf-8?B?LzdCRkVNUFRrY2FOcm4xY2hjbTdON0NLKzJYVFJ5U1VKR2xiRFVFZGNiY01U?=
 =?utf-8?B?U2VJaDNpcW13bi8wbndwZHNuVjAyaHJwb01pNUJIUTVvNlFkSE1uVHhUOFVi?=
 =?utf-8?B?aHBxQnNFVXFJSDJTNDVSdFRKT0crTFVNNkJ2NGw2U3FLelBVaG1nL2NqKytm?=
 =?utf-8?B?eXl4eWZtaXNRQlhKZFZCMDNoM0lLazlCQnB2M3hPYlRiMDRvd0xKL1NualE1?=
 =?utf-8?B?aGNQWGR4a3FGSy9pQ3pSbVNFR1R0bXRnVFcxSnhMTkNOSzhmZkl5NWdCTDFx?=
 =?utf-8?B?d0NaY0wvdWdPUktPRXFTb2trenluZzd3a2FTR1o1Y1d6dUdoV2tKSXdMYVVk?=
 =?utf-8?B?eFp4RkJmZHo1cE5FSSt2V2duVmZDOC8rV0ZNS1EwSzgwSGVSd2ZaemR1SmdX?=
 =?utf-8?B?a2xjS3BHRFdjY1NZcFRwYW5vMFlaOFllREo2cEJnOHhYQWYzdkQvRUlTMlZz?=
 =?utf-8?B?RVlIZnNsMXFQOGM4MXoyQ2UyU1liVFNUN2RBVi96Q09ZKzl6MkpHbUdvK09j?=
 =?utf-8?B?S0pmSzlIZzJNdVdEQmh4OHJETit4M2ZoYnV1M254aUFCZDYwdXY4emgrZERD?=
 =?utf-8?B?U2h0SG5GV25WVHhhelRIMHpWaUFBQ0h0RFhiRkhWWDdrRWhtUXJIMVk2VVc0?=
 =?utf-8?B?Vld3TDArVjFiRFpYU0lUcUd4L0kySTJTQmlJTUc4alE1UGtYMVBKUzN5Y0lP?=
 =?utf-8?B?SzIrajZoa0lES2t0S3VEMWZPdWhOdzcwSEEvK0xYN0FHelJLSjlMTGlSb3VG?=
 =?utf-8?B?Szd3Y0VjYzgzcHcyb09DWDFpc2U2YzdHTUlDc2UyRkVYWGdDVFhGWDJLV05V?=
 =?utf-8?B?MzhFeHpCZ0hINzRqbE5ESTNzSVBudW11VnVRMmNIbnlwS0VhZ0xGVUE5RkV3?=
 =?utf-8?B?cG9od0xGYkFTL3dxVWRId2t4MkE0WU5MaEpZQ3BKeFhxOE5wenl2OXRzWlQ3?=
 =?utf-8?B?SG10VFE0TWZjcHNacyt4YW9tbU5zWkxRYXB3bnhOQ0VidXlsaW1SWDVOZzNU?=
 =?utf-8?B?RjlCTnpEaFZOc2VBL3B3dEtlU1Rnb1F1V1pKM0hYQmtkWUErRlV3OEVJR2oy?=
 =?utf-8?B?RlN4ZUxPT1Q0ajRBRlk3c2NyQnpuNzZQcEdpZlN4R285dHZBQjQyZ2JtbU9L?=
 =?utf-8?B?UlFQYWJhYTkycGtmQWJreG9zK0FSSlpwRUg4c0FvQ2p5Ty9QbEVyTmJzU2hC?=
 =?utf-8?B?cHhZaElJZVJDZjIyMW9JbXQ4N1kzNGROS1FmbHhoSEx5MmhQNnQxNVYvWTBk?=
 =?utf-8?B?cFZyUjlXdmZwclFBTnVGR0p6RmxDRzgwSDJraEtYSGc3MkRoam82K1dVc0wy?=
 =?utf-8?B?U0hwblo1WW5Bcm9NMWdjb1ZLQWJIUjJMdUFOT2xCTWJuQ2loTWI3Z0VBRHl0?=
 =?utf-8?B?cGl4MXV6TW5nMGRPZThLanZZOHk0d3g3VXY0SEhvaUJLZk9YY3liTGNkeTBw?=
 =?utf-8?B?SHJCTS80WWg5M2VBVHNhaFJQQjExanY5ZG9pM3FrMXJmR2xEdWJPMlpOcEI5?=
 =?utf-8?B?T0ZWSXY0UGFDYkVWRCtuaHF6bjNDdWdPTXFhRzUyNEp1L1VZOXdUQjF6d0Fl?=
 =?utf-8?B?cENTeE9PTDJNdm9Cd0MxUmlEa0pVU3NhS0JqK1RsL0REV1hsNjMraGo3WndI?=
 =?utf-8?B?LzNsTjgrckVXZGQ4YjFYZEs4dVBOTG5EN0NBQW9JNXRDYmVZZ0hxcGtBWUlQ?=
 =?utf-8?B?RTVnNFNNMEQrSDNHcVNYbGxKNldxa0IxWG9lWldaNWthOTRKRU44ZHY5ZE52?=
 =?utf-8?B?anhZcDgxalB1ZHMreTM3WHZJU2poNXdKd2w1SnJtYU1xeWhvYU96dU4yMTZX?=
 =?utf-8?B?U3NBMDJiNUIzejV5emJrWHUzOERmNWowZUxZcFlybEQ5RHBnbDJBT2VxM016?=
 =?utf-8?B?R05OWUhMaXFIOWI3UjNOekFMNTQ1RitJK09lZHEzMkR1SVkwN0hEQjlZRjNx?=
 =?utf-8?B?cTJrUCtRU2hTcFVjRGk0N1VHUS8zODhKNThKM2N2Y3hHSC9IRW9pNWliTjVJ?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <387D80E92153244486FF8B77F5A481AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798caf17-33e8-44a6-a760-08dd3bde0d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 18:45:04.3622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/CCP4X1rWgmPqDifH0bup6oc+3zUXIHoYXDQELwb2UDMKdQuyLrPkgONjb6NvmSP/ASFGJIUpR9dRXlbMIEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8469
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDEwOjE3IC0wODAwLCBKb2huIEhhcnJpc29uIHdyb3RlOg0K
PiBPbiAxLzIzLzIwMjUgMDk6NTksIEpvc8OpIFJvYmVydG8gZGUgU291emEgd3JvdGU6DQo+ID4g
QWxsIG90aGVyIGJpbmFyaWVzIGZvbGxvdyB0aGlzIGZvcm1hdDoNCj4gPiBbbmFtZV0ubGVuZ3Ro
OiAweDEwMDANCj4gPiBbbmFtZV0uZGF0YTogeHh4eHh4eA0KPiA+IFtuYW1lXS5lcnJvcjogZXJy
bm8NCj4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiBpbmNsdWRpbmcgdGhlIG5hbWUgaW4gW10/DQoN
Ck1ha2UgZWFzeSB0byBpZGVudGlmeSBpZiB0aGUgbGluZSBpcyBhIGJpbmFyeSBkdW1wIGxpbmUg
b3Igbm90Lg0KV2UgaGF2ZSB0aGF0IHBhdHRlcm4gYW5kIHNob3VsZCBmb2xsb3cgbm93LiANCg0K
PiANCj4gPiANCj4gPiBUaGUgZXJyb3Igb25lcyBpcyBqdXN0IGluIGNhc2UgYnkgc29tZSByZWFz
b24gd2FzIG5vdCBhYmxlIHRvIGNhcHR1cmUNCj4gPiBiaW5hcnkuDQo+ID4gDQo+ID4gU28gdGhp
cyBHdUMgYmluYXJpZXMgc2hvdWxkIGZvbGxvdyB0aGUgc2FtZSBwYXRlcm4uDQo+ID4gDQo+ID4g
Q2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+ID4gQ2M6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jICB8IDYgKysrKy0tDQo+ID4g
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jIHwgMyArKy0NCj4gPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2N0LmMNCj4gPiBpbmRleCA1MGM4MDc2YjUxNTg1Li40OTcwMzY2NzVhMzhjIDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiA+IEBAIC0xNzIzLDkgKzE3MjMsMTEg
QEAgdm9pZCB4ZV9ndWNfY3Rfc25hcHNob3RfcHJpbnQoc3RydWN0IHhlX2d1Y19jdF9zbmFwc2hv
dCAqc25hcHNob3QsDQo+ID4gICAJCWRybV9wcmludGYocCwgIlx0ZzJoIG91dHN0YW5kaW5nOiAl
ZFxuIiwNCj4gPiAgIAkJCSAgIHNuYXBzaG90LT5nMmhfb3V0c3RhbmRpbmcpOw0KPiA+ICAgDQo+
ID4gLQkJaWYgKHNuYXBzaG90LT5jdGIpDQo+ID4gLQkJCXhlX3ByaW50X2Jsb2JfYXNjaWk4NShw
LCAiQ1RCIGRhdGEiLCAnXG4nLA0KPiA+ICsJCWlmIChzbmFwc2hvdC0+Y3RiKSB7DQo+ID4gKwkJ
CWRybV9wcmludGYocCwgIltDVEJdLmxlbmd0aDogMHglbHhcbiIsIHNuYXBzaG90LT5jdGJfc2l6
ZSk7DQo+ID4gKwkJCXhlX3ByaW50X2Jsb2JfYXNjaWk4NShwLCAiW0NUQl0uZGF0YSIsICdcbics
DQo+ID4gICAJCQkJCSAgICAgIHNuYXBzaG90LT5jdGIsIDAsIHNuYXBzaG90LT5jdGJfc2l6ZSk7
DQo+ID4gKwkJfQ0KPiA+ICAgCX0gZWxzZSB7DQo+ID4gICAJCWRybV9wdXRzKHAsICJDVCBkaXNh
YmxlZFxuIik7DQo+ID4gICAJfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX2xvZy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiA+IGluZGV4
IDQ0NDgyZWE5MTk5MjQuLjQ2MmVjNGJiOThiYjkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfbG9nLmMNCj4gPiBAQCAtMjA0LDEwICsyMDQsMTEgQEAgdm9pZCB4ZV9ndWNfbG9nX3NuYXBz
aG90X3ByaW50KHN0cnVjdCB4ZV9ndWNfbG9nX3NuYXBzaG90ICpzbmFwc2hvdCwgc3RydWN0IGRy
bV8NCj4gPiAgIAlkcm1fcHJpbnRmKHAsICJHdUMgdGltZXN0YW1wOiAweCUwOGxsWCBbJWxsdV1c
biIsIHNuYXBzaG90LT5zdGFtcCwgc25hcHNob3QtPnN0YW1wKTsNCj4gPiAgIAlkcm1fcHJpbnRm
KHAsICJMb2cgbGV2ZWw6ICV1XG4iLCBzbmFwc2hvdC0+bGV2ZWwpOw0KPiA+ICAgDQo+ID4gKwlk
cm1fcHJpbnRmKHAsICJbR1VDXS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwc2hvdC0+c2l6ZSk7DQo+
ID4gICAJcmVtYWluID0gc25hcHNob3QtPnNpemU7DQo+ID4gICAJZm9yIChpID0gMDsgaSA8IHNu
YXBzaG90LT5udW1fY2h1bmtzOyBpKyspIHsNCj4gPiAgIAkJc2l6ZV90IHNpemUgPSBtaW4oR1VD
X0xPR19DSFVOS19TSVpFLCByZW1haW4pOw0KPiA+IC0JCWNvbnN0IGNoYXIgKnByZWZpeCA9IGkg
PyBOVUxMIDogIkxvZyBkYXRhIjsNCj4gPiArCQljb25zdCBjaGFyICpwcmVmaXggPSBpID8gTlVM
TCA6ICJbR1VDXS5kYXRhIjsNCj4gVGhpcyBpcyBub3QgcHJpbnRpbmcgdGhlIEd1QyBmaXJtd2Fy
ZSBpbWFnZSwgaXQgaXMgdGhlIEd1QyBsb2cgYnVmZmVyLiANCj4gSXQgc2hvdWxkIGJlIGNhbGxl
ZCAnTG9nJyBub3QgJ0dVQycuDQoNCm9rYXksIEdVQ19MT0cgd291bGQgYmUgYmV0dGVyIG9yIGp1
c3QgTE9HPyB3aWxsIGNoYW5nZSB0aGF0Lg0KDQo+IA0KPiBKb2huLg0KPiANCj4gPiAgIAkJY2hh
ciBzdWZmaXggPSBpID09IHNuYXBzaG90LT5udW1fY2h1bmtzIC0gMSA/ICdcbicgOiAwOw0KPiA+
ICAgDQo+ID4gICAJCXhlX3ByaW50X2Jsb2JfYXNjaWk4NShwLCBwcmVmaXgsIHN1ZmZpeCwgc25h
cHNob3QtPmNvcHlbaV0sIDAsIHNpemUpOw0KPiANCg0K
