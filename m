Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC675C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB1A10E924;
	Tue, 25 Aug 2026 07:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI+RkGRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4369F10E913;
 Tue, 25 Aug 2026 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787644513; x=1819180513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=79fflCQaWwBuJRHmDQNDJ4ncUUwZQaFaXBBMMAgUGtY=;
 b=nI+RkGRiUtHVUX17tBXs+ZVZDtbAorZHGSwt7f+dycoFiuButfu5Zrc5
 BV8w4Azh4RJsr/RG9WcfPmzR/OEVPJzEBuHqUSgDaeF3bdVatRiiFj+IT
 PSEXtkaWmLkk8rF3YRTDhKTQ8aSm+4laqyfgocCoBR1q6LWhSNxfGd9C8
 sTjCE1yjeEz7i7vxrqKJYBrdbR/FTXcF515B1Yqc5pnLoSwledYLOa9E4
 sUa4rhAwz1ypdRI+7M5pjFWx0gl/GCKhszmge8WHyd3j5QN70gbZ9u6Wi
 RP469bPwGVoArYiHGC2rLH8Dy+ZoZYsMYJJ72b/3tC68MUGrLBwDuK8bY A==;
X-CSE-ConnectionGUID: JCjdol1YSr64QclzVcAOZw==
X-CSE-MsgGUID: DEJzYFL/T4KWepltnpAHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99627619"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="99627619"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:55:12 -0700
X-CSE-ConnectionGUID: Cfuxm6p8TF6huHv3pVPQuQ==
X-CSE-MsgGUID: cWZmEdJvQz2NCjWbo1gLLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="305450005"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:55:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:55:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:55:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:55:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFTjkp6hXnUqaPOGGuEw688E7WZU1WyRPhItOMi+UgDmtUnA/VdHZn+Mw5HOzOYlwlZ8uVYgTUd4Gmb+WyoOoGldFChuY272E9lkgesbwKWHGdbeWUDGSBX/RcBRk6+DuhIEDeBcy+CVJ+iaA/5Jmr8qMRrpEH8ldUgI8ylN4PPwlSx3vtYR+O/7bzXuxprBPmLRL7XR/Th4cnQkz18jofq/r2EF0zB42o9DJ3qgxDx9RilzkOVSPuZfVfH4TwB0Er8qoAVz5llezOravkvEcTE9eWGZaJX/rIQ0HMm2/W2snhl1da56C+6VYPYpbrxapojuxoFS/yl4pEFmmErMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79fflCQaWwBuJRHmDQNDJ4ncUUwZQaFaXBBMMAgUGtY=;
 b=b6/OsvVK3fooLyY1pATQIzc3eATctKZLc8eut1VWbYXOLnezjyvX3jw9hIwMu38OGV+biq1I0ZB89W36cTRK/H7vODh5iGt3fr/3J+9l6UgG5O1Mg3sprIwhPhTq1BMEu3II4CSgIzBM/S8PXwuygW7NIuTxsxkxBfkuzk1XXOTj6cUFp8Si8rSO2zQfmlVx7LbC6LhZCZbNL+HvF9Q9wkMa75IGR4XFNIo3ouzcnkl12iVQ4DW+EzszLiwOgCj+u03Cn38jqL2yPlNGBVaPBOc8L3j6CQS8En92Hk3tIxrtG999CCn/HWR+/7ltx4z7mHqIzKu1TcprTqleyJ+RTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by DM4PR11MB7760.namprd11.prod.outlook.com
 (2603:10b6:8:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 07:55:09 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0339.010; Tue, 25 Aug 2026
 07:55:09 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Hogander, Jouni" <jouni.hogander@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v5 01/15] drm/i915/alpm: Add DPCD definition for DP2.1
 ALPM capability
Thread-Topic: [PATCH v5 01/15] drm/i915/alpm: Add DPCD definition for DP2.1
 ALPM capability
Thread-Index: AQHdNFmsBNZy/ov1zkOL95UH6SWhh7auZTKw
Date: Tue, 25 Aug 2026 07:55:08 +0000
Message-ID: <DS4PPFE901A304F3F70FB9295CD69B33A37E3AF2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-2-animesh.manna@intel.com>
In-Reply-To: <20260825054536.3455704-2-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|DM4PR11MB7760:EE_
x-ms-office365-filtering-correlation-id: ea45c6c7-4916-4faf-57dd-08df027e2f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: J+jO+TlIRXiSftmr+v/w4Waw1mbn+KAad/1U3X4EmvVSzZKac09v2CQtHi5djhoCJWvguOsiDKLObahHmLnIuL2kyeM8VbSmm7K/R+Z6jDk8RhkALH/J4bUGIgtxq6ZqR3OA5Bwd2BK5vLvYKcaTFLU2/J9uFxbyIGZ0Bfq2YRJBujsfMX4L5l2MlLqFTsYjqv4ofuEw1cIJlXe2qLW/BxKKW6E1Bdl8qoghez1Uy72aSpTGXYj/N0wIQF2BNbfjD4IvKirynbQc+SJN9v5zDZHgePAfrlYlwM//uqUmpts8k3747b87jOASXm1K8zlqQSM3hOR+otPkdKkB4Br9UkMXeNWqNXQhSvj+qpOHifnnabkVDNRnmeyByRhMRj4CGEWZTLsxJROaZ6cnmxg9w4GI/oK8gR5Z/6Fa5EIZkj6z9w0qHsdSedPY3TjTkWNNErPZK3rjrSN+1egtuOrx96cil07J1vfQokxVnvTbym024P+ESrhJFH9RW1meavtxYq/pGxetNIheqg3MIBoKKixev0InmVJ1Qf+1yQm+FIcNLEOld6vRhQ0QhJ2fpkAkrP77PlbhAuL99zxYsF26mAJWMBAwJ/fg22G/FO8nQbveMSNSWX+ZBgy+5BhlI5OE/GWXG2DMM0IfG2mPtHtx/yyFpn3Aa2xmDvfPAqVVYw5hTmw02nlEM4DEa+0BFNH09+bFmOH4xZfpLDrBSprywEhK5ZKZ/Euj930MX5gX848=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEVER0E0aGhUeE11SzlaMjhpL1V1Z0VaWVpiS1E5V0t0NkdBT1JRaEZja0hY?=
 =?utf-8?B?U3RjdTU3SmhkWHlpQU9PQnR3aXl0c2QrREgrMTk1MFlxYTZya0xPb1FwOUNq?=
 =?utf-8?B?YjBaR0c4QnQzZGkzSFZpbHkrS2llT096b0xIY21SdlBrV2RNRjUwU3hka3pv?=
 =?utf-8?B?YzdNcGhZNVdzZ0hiYVJUWDRoWVJhbUxkRDRWMnpuczVhdWV4eVlLT3dTcW5T?=
 =?utf-8?B?UVRwVjlEYVp6ZUNVZlY1WWl0Y0x2SUpnYUZwR25OS0FoWlpyNTdQMUhYRElO?=
 =?utf-8?B?SXgrbGdpQVRSMkxTVVJOZ1VEMkczZkNld1dvd0ZIcCtJQVM0NTJacVJQczJJ?=
 =?utf-8?B?VHBiVktNbGFIRzVpb1FjNDJPdXFXaEpXSzZSMTZ1Z1VkYWljbjdsdjhXdGp5?=
 =?utf-8?B?OTl6RitRN3NZaU1LVis1bzZRMHR2MThRZ2JJRXh2NEJoWXRxOUxJRGl0VW1L?=
 =?utf-8?B?SG9MNTBFd3RJTkJnUW9Zcnk1Q2FldFFCdGk0V3NMbEdJNjhlczdzSlluYUwv?=
 =?utf-8?B?M1lFMDhjRlBlSnRQNXp0YTdibnlNVU5ESStNVEp6S1Z1amhRU0U4YWxJaUVv?=
 =?utf-8?B?L0pHQkUyOXBFUGhpY3hYaHJTY3Q3dUlpSWdsZm9vZTZ2ai93VCtCejQzM1Vw?=
 =?utf-8?B?V0NvTWlWaEpmaGI2OXJ0RlFGSVR0WlcvMHdqTGZVbnNhN2NkSXl6MjhxTDhk?=
 =?utf-8?B?b0p5M2ZEdjM0SFJuRzJvYXdDTlgxdS9ZaURxZFd5MHQ1eWNBL0FuK2NWNk5R?=
 =?utf-8?B?TWs5TVhGaXMyMldEV09FMGJ4dEJpL1ZEWjhyLzJ1SWdrTEx6RXBDalpRNjJi?=
 =?utf-8?B?SG5hV296eHJmdUs5ZEYwTjRLLzd6UjZ4dGdPQWYvVWUyN0VqbzAyMGEwK091?=
 =?utf-8?B?ckJyZDhZOGJLcUt0ZW5EWHBFclFtaVc1N3Mza091cHlXYWxGSHNOTnhZcHVF?=
 =?utf-8?B?RHVTS3VHSkVGdlJWYko3SGJtb1lveVlteS91anlHTWZUaFoycXNrbnRlellp?=
 =?utf-8?B?V0JqZmxGZG1VMGtGb2NGdnNOMGFUT2pDWmc5WWhJVUhTL0lzUXZHSXdrVjFS?=
 =?utf-8?B?clRvdzVKMFUzSVU4MnB2L1pDMS9XUmp1WFp0NDZUeGU4dDU5b0pjYk1TdGZu?=
 =?utf-8?B?a1lHMkpLRGZodll3MCtvcmFhRDUrTEovaVFXMmxxZ2N1OUFOKzhDL1U4ek0w?=
 =?utf-8?B?OUlPUENXSnlaeWZ5WEd4TFJLK1NNR3N5ZEJZbkkreUYyWS82b3EwYVZRQ3Rq?=
 =?utf-8?B?czJvMEJBL0lXeVJEblZSblJ6UldHSm1JUlh0ZUJYWXRZMTVjRUxpeklERUxF?=
 =?utf-8?B?VkVmN0p2K2VTdmNWVVQ2dE9OOGp0dW93SzRmOVNFVkZuU2MyK3dROVg4bkJ4?=
 =?utf-8?B?TGlrQkYrSjVoOVBjZkpzQUpUK1Bya1h1M3FhMUM2d1pBcGZUa1l6bHQvZmtn?=
 =?utf-8?B?em5tVVNVbU01ZEE5TmJBRnE4aVZIbjc2Y3dVOEh3SU45eElqellPb0hmMGNs?=
 =?utf-8?B?RXZVT2pmd09qbmsrM3dQSVBjR1V6YjhxeW9sS3NWMVBQS1AyOW1hWFNJSVla?=
 =?utf-8?B?YnVYSjIvZ09pN1MwKzNDdXV6aVRFcld6cVFhc3Jvb2N0Z2lCNENGbDNwK2ZX?=
 =?utf-8?B?ZEFLVnhNaTM1YWpqcTBIVTkzc1hVMytWV1c2bmdqOERSZnoxYmFuZE1JRnVJ?=
 =?utf-8?B?SUk5MnY1WldtVkVFNHVBdUhWb3pET1VHSXpiNlArc3dIUGpoNjQ0T2pHWW9k?=
 =?utf-8?B?UE04enE1YVhmM2NkRFFnbDBmZTdMVWg5V1dCcy90QkdhaE9Ua29nT2NPd0hP?=
 =?utf-8?B?emFTdys5cGFWZWN5RXdWaXJVTWlJd1k2YklYaVNFc2VQTGtPRVc3TEdPZmFp?=
 =?utf-8?B?dUhzV0locVlrTG1mclhSM3ZkaFg4MzJoamtDRngxTVJiZXZNRmErZHFoQzJy?=
 =?utf-8?B?MCtEajZucWpYZkNRdzc2VklzNDhRaTNKL2RLTGNkWWsweE5sTVJDZURXZHlv?=
 =?utf-8?B?TTQ1NWdINVNpNEw5Z2hscnlZN1dYLzlWa3BDeTVDVHFSYkM2Ym4xODVwbVh4?=
 =?utf-8?B?cUxzYUpoeFp3Z2RIWEViR2hmcTBnZXZvU1pLUDRSZitpOGxkWVR2S0pRSUc4?=
 =?utf-8?B?MGlRcmJzbE5WMGZyQUhKaXVzU25nZUhCRHo2OVJDZyt4N0ZqZEF0eEFzWlg2?=
 =?utf-8?B?WTZ5cGh6UjMwY0tKQzdoTXN2UE9BN2VzQmlHQUVyUlVkMnVYYUNCbGFFWFJG?=
 =?utf-8?B?YU9Da0V6VEZZZUFWTGgvaVVhSGtaeEZtcTZVOEEzTU4rSnFPVWE1VWhUbFcx?=
 =?utf-8?B?Y25IWFVSQUNQSFJxQWJlS05zMkFRbENDTi8vem9MOVRNZVZlczJrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: L3jp1qJ0O25d8lNCgpFSLUn8CQKWy1ys1gx8xw+eFxDh51Jb1yo2E1oIutApZQOKn9HHBO6U7U8eL+BlM+KJia1jzeB69l78pdyfamJbshaEd/2KgPNshnsBkKhgas+c0fI4pxHoAwdgMXOc80PKEbbsTdQJwJRg6SAkG0K68E1Ixzsd3iwP54H40q262aMgz0M3xE4ONxuyhd40FqUygjDNtb1hMbOROsmzIBFuKKlUqQQ50spAQqGGKdC5msuwRjeVQNDoy9SpmRGpLvx1kD9u7qmh9btGpOgP3jV2v+ts3rW2gF9Jy5M11JrX0sNPauGJH7Tij8iXE1xMZFzcqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea45c6c7-4916-4faf-57dd-08df027e2f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 07:55:08.8017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2bD/7eaRf3AACfhG1vC9N7ZhjV1u69pSp4f8+tc43ObY3PD0wBP1fcrKAcek/YvJQiVwngPj7toAJWoPBTP9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjUgMDEvMTVdIGRybS9pOTE1L2FscG06IEFkZCBEUENEIGRlZmlu
aXRpb24gZm9yIERQMi4xIEFMUE0NCj4gY2FwYWJpbGl0eQ0KPiANCj4gQWRkIHJlcXVpcmVkIERQ
Q0QgYWRkcmVzcyB3aGljaCB3aWxsIGJlIG5lZWRlZCB0byBlbmFibGUgRFAyLjEgQUxQTS4NCj4g
DQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gUmV2
aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCg0KRllJ
LA0KTmVlZHMgdG8gYmUgc2VudCB0byBkcmktZGV2ZWwgdG9vDQoNClJlZ2FyZHMsDQpTdXJhaiBL
YW5kcGFsDQoNCj4gLS0tDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwgNCArKyst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaCBiL2luY2x1ZGUvZHJt
L2Rpc3BsYXkvZHJtX2RwLmgNCj4gaW5kZXggZTYzYzdmMDc1ZjU0Li45ZjFlOWVmNWNkYjYgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gKysrIGIvaW5jbHVk
ZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiBAQCAtMTU0MSw2ICsxNTQxLDggQEANCj4gIC8qIFNl
ZSBEUF8xMjhCMTMyQl9TVVBQT1JURURfTElOS19SQVRFUyBmb3IgdmFsdWVzICovDQo+ICAjZGVm
aW5lIERQX1BIWV9SRVBFQVRFUl8xMjhCMTMyQl9SQVRFUwkJCSAgICAweGYwMDA3IC8qDQo+IDIu
MCAqLw0KPiAgI2RlZmluZSBEUF9QSFlfUkVQRUFURVJfRVFfRE9ORSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMHhmMDAwOCAvKiAyLjAgRTExICovDQo+ICsjZGVmaW5lIERQX0xUVFBSX0FM
UE1fQ0FQQUJJTElUSUVTICAgICAgICAgICAgICAgICAgICAgICAgICAweGYwMDA5IC8qIDIuMSAq
Lw0KPiArI2RlZmluZSBEUF9UT1RBTF9MVFRQUl9DTlQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHhmMDAwYSAvKiAyLjEgKi8NCj4gDQo+ICBlbnVtIGRybV9kcF9waHkgew0KPiAg
CURQX1BIWV9EUFJYLA0KPiBAQCAtMTcyMCw3ICsxNzIyLDcgQEAgZW51bSBkcm1fZHBfcGh5IHsN
Cj4gICNkZWZpbmUgRFBfRFNDX0JSQU5DSF9DQVBfU0laRQkJMw0KPiAgI2RlZmluZSBFRFBfUFNS
X1JFQ0VJVkVSX0NBUF9TSVpFCTINCj4gICNkZWZpbmUgRURQX0RJU1BMQVlfQ1RMX0NBUF9TSVpF
CTUNCj4gLSNkZWZpbmUgRFBfTFRUUFJfQ09NTU9OX0NBUF9TSVpFCTgNCj4gKyNkZWZpbmUgRFBf
TFRUUFJfQ09NTU9OX0NBUF9TSVpFCTEwDQo+ICAjZGVmaW5lIERQX0xUVFBSX1BIWV9DQVBfU0la
RQkJMw0KPiANCj4gICNkZWZpbmUgRFBfU0RQX0FVRElPX1RJTUVTVEFNUAkJMHgwMQ0KPiAtLQ0K
PiAyLjI5LjANCg0K
