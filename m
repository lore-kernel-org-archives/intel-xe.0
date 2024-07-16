Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A0CC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 18:39:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD43C10E16C;
	Tue, 16 Jul 2024 18:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/EA9s+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D689E10E16C
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721155178; x=1752691178;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XH4zuItEIO53gOyuY26IF1r89RNbAaelngmlxw+shZI=;
 b=M/EA9s+5BsHkeErHkHYkXdiN+mIXYD3L04k8WJlPeH0E9vmVnkCNMTou
 7jquTae3tSXF8yMy9Haq4vzbSi5EYGbjk3NRvprnqCH1oT/90Tn6do2nU
 OnFsSbLYZ+qS+91dU5+0Vje9/SdVeCD5IsJTfQGaaVSityaSq+taJBPe0
 ucJb3K9qGH4CFn/Jeq/6I3rMx7MJrLqyQoq4GbqslQG4psHJqUF40qC+V
 3K2qPI0ugaysF6c/+kjx7a1J4leT8OKdgg5DpDb9MHNpUTRAF2QPQ0BII
 Y8r8siA4Pw+uC52xvhs/zi1zTYXNHDeCnrd+gxRO+ng6iYFar8nlzcIBc w==;
X-CSE-ConnectionGUID: 8c9J/ui5RLK4dmluj1Sm6A==
X-CSE-MsgGUID: QB3VNRBlQHum1+fI45p8PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="41144363"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="41144363"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 11:39:32 -0700
X-CSE-ConnectionGUID: ppcU9h77SuS4xdFPay9xRQ==
X-CSE-MsgGUID: bJOvvxd8TVyztcs0M5Oysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="54970258"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 11:39:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 11:39:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 11:39:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 11:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYDLOhLNxH+sWCJMR1K8Q2c8Szn+XpuMMWQKYqZ/isOxMJgFm0riAMUJ9A0ze6Nu4veq79yCZ0mCUYoIYSfjg3ugqtDx1OmQAbs1kgvuHIhxzRIQKBSRd9jxVI3VyyRhEfk+8ndJkWepGiBuDKW+k0HIBDtNI7bfX9AG+XyOXdYxgeEYz434Kdt+xnyC8xMTg73JKooxkgwJ7XCv0PIz5AYrhGTazBHatXMZHjTE4VW/nZIVkleGMLOtNiQPyUnDzaLlizuJIkERaofFwIgUOS3HKqyo+1hjpdoOv7ojms/70TjDVnvwNeHoLl2zatYk1x5T06ffoKX2AwQIBn25Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH4zuItEIO53gOyuY26IF1r89RNbAaelngmlxw+shZI=;
 b=LBUXSyY9jmKvgA5BPEp/zirPneCilX0bLuY/+VzufIdxeOA5p12NTbA2w3Q40XcuDt+JnrFEY4tbQskuqr9YZ1AR021rq4nlH/nJ7I9+nz+WvPy2XIQeTpsce16SKXlWQ6KWqL8xaZCWQhRuzc4yTCSpcin7EzcOYIJroIjWS08RmG7oq4y/SbkkzG7BVROElSdm2fG0RMEYDSrECi0pCBiE4JILre7YKOX0BMuo4AJVUmoSLFJfCBh+/86NuecrxUweWc4laxI7nMzmEpJiMacrHIiJWqr7MsLRmCYb9uNSOp7pDBt0CQwIfC6Uxp3yiyKevMdxLoaBSz/A7WWAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 18:39:27 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 18:39:27 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Thread-Topic: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Thread-Index: AQHa0xU88S41YaOgL0W9i1Ee+SQfErHxzgGAgAAZaICAB4NsAIAATfYA
Date: Tue, 16 Jul 2024 18:39:26 +0000
Message-ID: <ddb6a30acade05a9e1a95c934d4201d68a89a990.camel@intel.com>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
 <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
 <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
In-Reply-To: <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH7PR11MB6053:EE_
x-ms-office365-filtering-correlation-id: e9d2d79e-f13c-4436-7629-08dca5c69f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NEkzcVloN0g5dGtGVXM3ck5OMTBnd3ZMK0Rvem1FMzBLNnVFUURNTGFBSGtG?=
 =?utf-8?B?bzNSM0J4blVXUkRxOXRFNndYcS9oekNrK0lHVTRCbUoxU3lGdmF3TXIrTjAy?=
 =?utf-8?B?NnppSGllWENNSTRyZ3VTNkZwVlYySjlQT1Erb0E4MTJ3RERlenBMaU9QZzdS?=
 =?utf-8?B?VFNVT3dvcHhyT1Rxb0tES0JVYmN6M0lSanZuaC9lY2R6Nlk3QTFJRkZVYlYv?=
 =?utf-8?B?RjJRTDFOamZ3ZkpDNVl5VEE4UFNkZWl1NjJLOXVaOWs0Z01EUTE1WHEwUEZI?=
 =?utf-8?B?YzRTekZkVU1BdUdhL2lZRThCdC9qOWI3SS9zUE83ZjE4bXFZWWd0dkttSWtn?=
 =?utf-8?B?OVNNZGpWcWpGNUREdTBjZ2tUT0dZNklFMUZ3b2ROUWg4YS9uSnNqRVRHMTRF?=
 =?utf-8?B?Q0lndFE1cVFDdncrZDJtdG14YjBRWDgyUGtKa1NkZ215V3dzd2RGVkFEdXU1?=
 =?utf-8?B?cnNvZG5RZEkxNzRCWVJrYzk2SWUwbzNVVm41NFNuVmR0YndySjlhTTZsY2hR?=
 =?utf-8?B?eEt3VmZlekdEdnF4V09vUVBvMHJURTFBd0c4QWpsZWEvc2p3ZlNydDZoa1hq?=
 =?utf-8?B?UUl1dXN0ZExqdi9xZ0l1TVFLL21XNExqWlpLVXArMjdnSUVXYlVmTWRPcFhq?=
 =?utf-8?B?Z2xLUHJoV0dDMUtqRTRtQVh5SGRHOE4yQi9vM2hXK25qNXptV2wvTUdBdzVU?=
 =?utf-8?B?RmxvdmxBRmVUVUdUOUFIZlU5TGcwMGtEZWVJU0w2ZHEzMFBOd0FCb3FsdmNw?=
 =?utf-8?B?c3kvYXNtZEI1MVVrSWFGd3JFQk9Ya3huRVVkMXRoNlQ0UWtBbndmVnhjaXR1?=
 =?utf-8?B?a0V1T2hqcFhmV293dHVSRTA4N3dvNWR1Zld2ZTJTZHM2Ym93bW1raHBvZC92?=
 =?utf-8?B?U0k5OFVOOERWUzBDc010cTAvK0hpRXVzUk9NeVpVcU0ybUd6MUE4eDQzWWht?=
 =?utf-8?B?RFZISEY4ZWw0WS83ekFCRml4bENSaFhNYVI1Q0Q1dU9BaDVEVkRZRHhabmNQ?=
 =?utf-8?B?UHpiejRwekVxRWZJL2hMakQxcGhMQXBxc29INktiVnIzMUhQYWdkc1F2ZFd4?=
 =?utf-8?B?R1Z6Q1JpcW5aS1FJbVU1WWVPTTJOSE1sZG9zV3ZTNTFGUDdGWExjY1Q5emtm?=
 =?utf-8?B?cEhtTzZtMDY5Ujh6V1M4RElicXArUkx2RXlLeGphbmY1dHdyTTdPcE5jeGwy?=
 =?utf-8?B?NzZSWGhDeVZTUXVsQlgyT2xoQzZQc3U2WVArWnY0Rm85cWJwbk5LMHhZQ25h?=
 =?utf-8?B?UWxnK3JLeXFWaHlkdFlXWTlVc050d0hGYW9RdExydzlWK0p1SHFsSmo0b2FK?=
 =?utf-8?B?Ynd2VnlPNWtEV3gzUWFycGJJRFl3S0hEWkVLQmNNNUE5VGhPTy9neHUzUDU2?=
 =?utf-8?B?aXRRdXpGdXJveUdQVllveWFUSklBWitPN3orMHQ2Tk50RlRLYmJ6WnB5a04w?=
 =?utf-8?B?QmxGM0FrWVQ5RWc1L0pVUFh4MzRWdmE4UE9IQ3Y3ejNMY2M4K09vTDNmQXBF?=
 =?utf-8?B?djAyT0ZaeGlud3pZbmNMSG1uL3NvWXhJZDBGMDNUMmRMdWlScmpNQ2hHdXBK?=
 =?utf-8?B?aUFrTWE2RXpCVHJnWFJrSGFyVkxlc1ROYjhPT3pPbHFzY1VmVFNRS2Z0aWVU?=
 =?utf-8?B?OUVuVFF3dlNQN0YzelM2Q3dRMGZrYVZOSmtZRGdobVBGN1BuVlhkMVRERFpJ?=
 =?utf-8?B?d1lQcGlRb2xSNWJ6cWkzaERtVDF5eXkvZWRFSm8vdjNVWjBQVWgraWRjc0F1?=
 =?utf-8?B?cjdIbXI1Q2wySlFBUEsxUkxwTmo3U3BRNFVsZ3EvSWZnUkplT3JDbkFtcmpr?=
 =?utf-8?Q?v/mRbdwSA8FenFa8ZLQtaC+2eFb/VmifaPUa8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Smo0VUNzb2YxUlh0ZWt0ckRpVzZyejdXTmwrRU55d25wYllWR04zZVJjUytq?=
 =?utf-8?B?WDJIRTNXc1YyM1lYaS8xczROdkszMWNEeGlERmZPcnhpV0VZcWxpRmZqL1k2?=
 =?utf-8?B?bmNLQmM5djFheld1RjN5Y2k1TTdIMTRzVkZGSGhyUTZkTWppSk5QNTBRNGl3?=
 =?utf-8?B?RkZkclljUnNpRVRmOVJDNVA4K2dDcVFtdzlBdkFmVEtkaUFOMzZqZDhJeGxp?=
 =?utf-8?B?dldnUGNiOENVMHlrM29HOWZFZVA3WmNIVTVqeGI1ZFBxUEp6QzA1dElYdGU4?=
 =?utf-8?B?K1p3ZlJXbGhlS0tTclNYSjNjdjk3SFpZT1JGMS9la2daR3JEZDJVVzRYY2w3?=
 =?utf-8?B?RTR4bGxINFhhNUNvb2x6N1dHdlhlczBHZk4wOE9FM2ExREZvUDE2VHBIU1NX?=
 =?utf-8?B?bFVwdVhHSE94K0ZwdXl6ZEVNamZEZ3hhd1JMR1RodktoMmdCc2NObGR5MXNn?=
 =?utf-8?B?R0s4MG0vYThZckRTZGphUEIzWWttUUliWmxOUmVVV1BWSUlISlZFMElTckNu?=
 =?utf-8?B?dTFaVi9NTnNrNWdRSjQzTTU5Uy94SEpXNERCMXJaWklXRm1CVjJaUnRocmpq?=
 =?utf-8?B?YkFLWEZ5VEZRMjVqejV3emI0UDVaTEtRcmlFR1owU0lXYlo3b0ZTY1ZxSkhU?=
 =?utf-8?B?ZWk3WUdiamhRV29wNG1ZbXVUcE55TW1YazJjMy9JQkZZSlY4cTNBRjRIWFVo?=
 =?utf-8?B?akp0enFOZm9DYjNDTXNZbHZRNG1kd0M4Nys5L056SHJhNlZyRnZ6VTB0akFq?=
 =?utf-8?B?Ujl2ZEc0UzJlQTU2M2w4V1ZtNWVzSmhDQUM5b1hrNVV3cUhrSDd3UFdLTFZ5?=
 =?utf-8?B?TFNCREMveE41T3lWcUlxNGd2MEtSUUNFRDN2VzNtS3pCNG11UU5ReGlqVU4y?=
 =?utf-8?B?cnVvSG10Nm5sNUxhNHdZNWp2dlE4bnYydk8zeTc1NUlUZ043UnJnM0ZsRDNV?=
 =?utf-8?B?amYzeHZpcWRIdXRuMEtxdVlzd2JwYTBudlcxbWZ5WDlGczVzb2JkQnRTMStR?=
 =?utf-8?B?WHRselA2NUVIQ0wwa1BZOU1tUmRqTHNXSWdXT2dRTFpVWXNRRUNvYlg3MUV1?=
 =?utf-8?B?Zk1FZklmOUZqaEZtSzZrZmtWamJXYlFtVkZTckZlQXJlM0E4T0p0TW1FSXJl?=
 =?utf-8?B?b2F3MjczQWJZQjNZQTgxUVk0L0JVeUgwWnM2SitXUWgwU1duUnRqSDdocEFC?=
 =?utf-8?B?aVVmejkxb0V3L0lNSzg2K3E2YnVmSWFPZytQYTUvL1p0Tjk1VmpmUStLNGFX?=
 =?utf-8?B?blFrU3h2K3doY3pTQW0wZ3J6V1ZvU2kycERlNXB4akcwTmpNWmc5UWpmWnds?=
 =?utf-8?B?aE5HSkVuMnp5ZW0zYzluSlY1bDBXRVJESzZSK3o3a2RQUk9wc3g0ZWNGbXNP?=
 =?utf-8?B?ZnArRDBsWVI5VXFGTGZ6K1J1bXc4MmFVTWF4ZlNobWhUVEd5RFp2VUJOa3lY?=
 =?utf-8?B?aW80Y1BSYUplRWVCWDR3ci9JSFlvQUNMdUlITGpjLzEvdm9Ua2l0Z08zYnlk?=
 =?utf-8?B?VjM1UjNDT2xtWTVwdlUzRTdRcFFjMGxLLzI4aXBTbzVNNUFBUStnSWdnV0g1?=
 =?utf-8?B?cHhIUlhUb1ZkN0ZQY043S0lIQ3hUZmVESVRRSFVJcVZYclJjT0RiODgrblFq?=
 =?utf-8?B?TmYvc2xoSStDUWt6QmR3aFhRLzFTN05XT0J3UUdKRXpYTUVsVmViR1lTTFJD?=
 =?utf-8?B?TW5ydnQwayt4SDQ3RjBKQjJBUDFoNXREV0JIcWtjcTJqaEtXckVMMi9iRWFT?=
 =?utf-8?B?c2NsdSt1eWQrK0dpckhtODNsZXZuSDBUcFRyNnhtVEtsUlBlQWZDYWFuUG90?=
 =?utf-8?B?clhIdVI3ODRLN3VzRWE5NFRKWDJmMWZGVW92OXlVeklBZTdDZ3duR2FtK1hw?=
 =?utf-8?B?UGdGSjN4MjhtelUvcU5qUlIrSTRNRWhSYUxVNzRlcnFQdk1HWkFjOTBxeGxp?=
 =?utf-8?B?eXkyU0QwYUdkVkV5WVZlb3FENDFZV3VKM0ZoaXZBcEdXdTJhOHpIbmlaS2hi?=
 =?utf-8?B?dGcyVEt5QzRHOG13dURZc1FaeHVqY1oyZGJQcWtLVDZnK3U2citzcm5PS3V4?=
 =?utf-8?B?SVkzQWVYMTJrUEpqVlpHOWJ2elM3Ui8yOFBtT3lWNWpBQlI1bzNQNnR0bDVG?=
 =?utf-8?B?aXdhNlU0QkU3RXRvcElTRWRUZFJTeHZUb2xUT0tFbUFUbEVnV3Z1VHlnK2FJ?=
 =?utf-8?B?Wnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8F6B9C0235FD3418C398E9B9F1E6266@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d2d79e-f13c-4436-7629-08dca5c69f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 18:39:26.9711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8ViTrVXS4v5D3jZlDMvjUJIpjz9Kyhqk4JBeXuS1ywhRVFVIEjjUGy6frPjlFs4H9MkBTzksqU5XiYz7MpHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

T24gVHVlLCAyMDI0LTA3LTE2IGF0IDA5OjAwIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgSnVsIDExLCAyMDI0IGF0IDAyOjE2OjExUE0gR01ULCBMdWNhcyBEZSBNYXJj
aGkgd3JvdGU6DQo+ID4gT24gVGh1LCBKdWwgMTEsIDIwMjQgYXQgMDE6NDU6MTVQTSBHTVQsIFJv
ZHJpZ28gVml2aSB3cm90ZToNCj4gPiA+IE9uIFdlZCwgSnVsIDEwLCAyMDI0IGF0IDAzOjAyOjI3
UE0gLTA3MDAsIEx1Y2FzIERlIE1hcmNoaSB3cm90ZToNCj4gPiA+ID4gUFZDLCBYZTIgYW5kIGxh
dGVyIHBsYXRmb3JtcyBoYXZlIDE2LXdpZGUgRVVzLiBXZSB3ZXJlIGltcGxpY2l0bHkNCj4gPiA+
ID4gcmVwb3J0aW5nIGZvciBQVkMgdGhlIG51bWJlciBvZiAxNi13aWRlIEVVcyB3aXRob3V0IGdp
dmluZyB1c2Vyc3BhY2UgYW55DQo+ID4gPiA+IGhpbnQgdGhhdCB0aGV5IHdlcmUgZGlmZmVyZW50
IHRoYW4gZm9yIG90aGVyIHBsYXRmb3Jtcy4gWGUyIGFuZCBsYXRlcg0KPiA+ID4gPiBhbHNvIGhh
dmUgMTYtd2lkZSwgYnV0IGluIHRob3NlIGNhc2VzIHRoZSByZXBvcnRlZCBudW1iZXIgd291bGQN
Cj4gPiA+ID4gY29ycmVzcG9uZCB0byB0aGUgOC13aWRlIGNvdW50Lg0KPiA+ID4gPiANCj4gPiA+
ID4gVG8gYXZvaWQgY29uZnVzaW9uIGFuZCBtYWtlIHN1cmUgdGhlIHJpZ2h0IG51bWJlciBpcyB1
c2VkIGJ5IHVzZXJzcGFjZQ0KPiA+ID4gPiBkZXBlbmRpbmcgb24gdGhlIHBsYXRmb3JtLCBhZGQg
YSBuZXcgaXRlbSB0byB0aGUgdG9wb2xvZ3kgcXVlcnkgYW5kIGRyb3ANCj4gPiA+ID4gdGhlIG9u
ZSB0aGF0IGlzIG5vdCBhdmFpbGFibGUuIFRoZSBuZXcgbWFzayByZXBvcnRlZCBmb3IgYm90aCBQ
VkMgYW5kDQo+ID4gPiA+IFhlMiBzaG91bGQgbm93IG1hdGNoIHRoZSBudW1iZXJzIHJlcG9ydGVk
IHZpYSBod2NvbmZpZy4NCj4gPiA+ID4gDQo+ID4gPiA+IHYyOiBVc2UgYSBkaWZmZXJlbnQgdG9w
byBpdGVtIHdpdGggRVUgdHlwZSBpbiBpdHMgbmFtZSB0byByZXBvcnQgdGhlDQo+ID4gPiA+ICAg
IG5ldyBtYXNrIGluc3RlYWQgb2YgYWRkaW5nIHRoZSB0eXBlIGl0c2VsZiBhcyB0aGUgaXRlbSAo
TWF0dCBSb3BlcikNCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gDQo+
ID4gPiA+IFRlc3RlZCBvbiBMTkwgdG8gY2hlY2sgdGhlIGJlaGF2aW9yIGluIGRtZXNnLCBkZWJ1
Z2ZzIGFuZCBpb2N0bC4NCj4gPiA+ID4gVGVzdC13aXRoOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9pZ3QtZGV2LzIwMjQwNzEwMjIwMDUwLjIxNjk1OTYtMS1sdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20vDQo+ID4gPiA+IA0KPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3ku
YyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gPiBkcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfdHlwZXMuaCAgICB8IDExICsrKysrKysrKysrDQo+ID4gPiA+IGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9xdWVyeS5jICAgICAgIHwgIDQgKysrLQ0KPiA+ID4gPiBpbmNsdWRlL3Vh
cGkvZHJtL3hlX2RybS5oICAgICAgICAgICB8IDEwICsrKysrKysrKy0NCj4gPiA+ID4gNCBmaWxl
cyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90b3BvbG9neS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gPiA+ID4gaW5kZXggMjVmZjAz
YWI4NDQ4Li41YTE1NTllZGYzZTkgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90b3BvbG9neS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90b3BvbG9neS5jDQo+ID4gPiA+IEBAIC02LDYgKzYsNyBAQA0KPiA+ID4gPiAjaW5jbHVk
ZSAieGVfZ3RfdG9wb2xvZ3kuaCINCj4gPiA+ID4gDQo+ID4gPiA+ICNpbmNsdWRlIDxsaW51eC9i
aXRtYXAuaD4NCj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPg0KPiA+ID4gPiAN
Cj4gPiA+ID4gI2luY2x1ZGUgInJlZ3MveGVfZ3RfcmVncy5oIg0KPiA+ID4gPiAjaW5jbHVkZSAi
eGVfYXNzZXJ0LmgiDQo+ID4gPiA+IEBAIC0zMSw3ICszMiw3IEBAIGxvYWRfZHNzX21hc2soc3Ry
dWN0IHhlX2d0ICpndCwgeGVfZHNzX21hc2tfdCBtYXNrLCBpbnQgbnVtcmVncywgLi4uKQ0KPiA+
ID4gPiB9DQo+ID4gPiA+IA0KPiA+ID4gPiBzdGF0aWMgdm9pZA0KPiA+ID4gPiAtbG9hZF9ldV9t
YXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhlX2V1X21hc2tfdCBtYXNrKQ0KPiA+ID4gPiArbG9hZF9l
dV9tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHhlX2V1X21hc2tfdCBtYXNrLCBlbnVtIHhlX2d0X2V1
X3R5cGUgKmV1X3R5cGUpDQo+ID4gPiA+IHsNCj4gPiA+ID4gCXN0cnVjdCB4ZV9kZXZpY2UgKnhl
ID0gZ3RfdG9feGUoZ3QpOw0KPiA+ID4gPiAJdTMyIHJlZ192YWwgPSB4ZV9tbWlvX3JlYWQzMihn
dCwgWEVMUF9FVV9FTkFCTEUpOw0KPiA+ID4gPiBAQCAtNDcsMTEgKzQ4LDEzIEBAIGxvYWRfZXVf
bWFzayhzdHJ1Y3QgeGVfZ3QgKmd0LCB4ZV9ldV9tYXNrX3QgbWFzaykNCj4gPiA+ID4gCWlmIChH
UkFQSElDU19WRVJ4MTAwKHhlKSA8IDEyNTApDQo+ID4gPiA+IAkJcmVnX3ZhbCA9IH5yZWdfdmFs
ICYgWEVMUF9FVV9NQVNLOw0KPiA+ID4gPiANCj4gPiA+ID4gLQkvKiBPbiBQVkMsIG9uZSBiaXQg
PSBvbmUgRVUgKi8NCj4gPiA+ID4gLQlpZiAoR1JBUEhJQ1NfVkVSeDEwMCh4ZSkgPT0gMTI2MCkg
ew0KPiA+ID4gPiArCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA9PSAxMjYwIHx8IEdSQVBISUNT
X1ZFUih4ZSkgPj0gMjApIHsNCj4gPiA+ID4gKwkJLyogU0lNRDE2IEVVcywgb25lIGJpdCA9PSBv
bmUgRVUgKi8NCj4gPiA+ID4gKwkJKmV1X3R5cGUgPSBYRV9HVF9FVV9UWVBFX1NJTUQxNjsNCj4g
PiA+ID4gCQl2YWwgPSByZWdfdmFsOw0KPiA+ID4gPiAJfSBlbHNlIHsNCj4gPiA+ID4gLQkJLyog
QWxsIG90aGVyIHBsYXRmb3Jtcywgb25lIGJpdCA9IDIgRVUgKi8NCj4gPiA+ID4gKwkJLyogU0lN
RDggRVVzLCBvbmUgYml0ID09IDIgRVUgKi8NCj4gPiA+ID4gKwkJKmV1X3R5cGUgPSBYRV9HVF9F
VV9UWVBFX1NJTUQ4Ow0KPiA+ID4gPiAJCWZvciAoaSA9IDA7IGkgPCBmbHMocmVnX3ZhbCk7IGkr
KykNCj4gPiA+ID4gCQkJaWYgKHJlZ192YWwgJiBCSVQoaSkpDQo+ID4gPiA+IAkJCQl2YWwgfD0g
MHgzIDw8IDIgKiBpOw0KPiA+ID4gPiBAQCAtMjEzLDcgKzIxNiw3IEBAIHhlX2d0X3RvcG9sb2d5
X2luaXQoc3RydWN0IHhlX2d0ICpndCkNCj4gPiA+ID4gCQkgICAgICBYRUhQX0dUX0NPTVBVVEVf
RFNTX0VOQUJMRSwNCj4gPiA+ID4gCQkgICAgICBYRUhQQ19HVF9DT01QVVRFX0RTU19FTkFCTEVf
RVhULA0KPiA+ID4gPiAJCSAgICAgIFhFMl9HVF9DT01QVVRFX0RTU18yKTsNCj4gPiA+ID4gLQls
b2FkX2V1X21hc2soZ3QsIGd0LT5mdXNlX3RvcG8uZXVfbWFza19wZXJfZHNzKTsNCj4gPiA+ID4g
Kwlsb2FkX2V1X21hc2soZ3QsIGd0LT5mdXNlX3RvcG8uZXVfbWFza19wZXJfZHNzLCAmZ3QtPmZ1
c2VfdG9wby5ldV90eXBlKTsNCj4gPiA+ID4gCWxvYWRfbDNfYmFua19tYXNrKGd0LCBndC0+ZnVz
ZV90b3BvLmwzX2JhbmtfbWFzayk7DQo+ID4gPiA+IA0KPiA+ID4gPiAJcCA9IGRybV9kYmdfcHJp
bnRlcigmZ3RfdG9feGUoZ3QpLT5kcm0sIERSTV9VVF9EUklWRVIsICJHVCB0b3BvbG9neSIpOw0K
PiA+ID4gPiBAQCAtMjIxLDYgKzIyNCwxOCBAQCB4ZV9ndF90b3BvbG9neV9pbml0KHN0cnVjdCB4
ZV9ndCAqZ3QpDQo+ID4gPiA+IAl4ZV9ndF90b3BvbG9neV9kdW1wKGd0LCAmcCk7DQo+ID4gPiA+
IH0NCj4gPiA+ID4gDQo+ID4gPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqZXVfdHlwZV90b19zdHIo
ZW51bSB4ZV9ndF9ldV90eXBlIGV1X3R5cGUpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3dpdGNo
IChldV90eXBlKSB7DQo+ID4gPiA+ICsJY2FzZSBYRV9HVF9FVV9UWVBFX1NJTUQxNjoNCj4gPiA+
ID4gKwkJcmV0dXJuICJzaW1kMTYiOw0KPiA+ID4gPiArCWNhc2UgWEVfR1RfRVVfVFlQRV9TSU1E
ODoNCj4gPiA+ID4gKwkJcmV0dXJuICJzaW1kOCI7DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJdW5yZWFjaGFibGUoKTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiB2
b2lkDQo+ID4gPiA+IHhlX2d0X3RvcG9sb2d5X2R1bXAoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0
IGRybV9wcmludGVyICpwKQ0KPiA+ID4gPiB7DQo+ID4gPiA+IEBAIC0yMzEsNiArMjQ2LDggQEAg
eGVfZ3RfdG9wb2xvZ3lfZHVtcChzdHJ1Y3QgeGVfZ3QgKmd0LCBzdHJ1Y3QgZHJtX3ByaW50ZXIg
KnApDQo+ID4gPiA+IA0KPiA+ID4gPiAJZHJtX3ByaW50ZihwLCAiRVUgbWFzayBwZXIgRFNTOiAg
ICAgJSpwYlxuIiwgWEVfTUFYX0VVX0ZVU0VfQklUUywNCj4gPiA+ID4gCQkgICBndC0+ZnVzZV90
b3BvLmV1X21hc2tfcGVyX2Rzcyk7DQo+ID4gPiA+ICsJZHJtX3ByaW50ZihwLCAiRVUgdHlwZTog
ICAgICAgICAgICAgJXNcbiIsDQo+ID4gPiA+ICsJCSAgIGV1X3R5cGVfdG9fc3RyKGd0LT5mdXNl
X3RvcG8uZXVfdHlwZSkpOw0KPiA+ID4gPiANCj4gPiA+ID4gCWRybV9wcmludGYocCwgIkwzIGJh
bmsgbWFzazogICAgICAgICUqcGJcbiIsIFhFX01BWF9MM19CQU5LX01BU0tfQklUUywNCj4gPiA+
ID4gCQkgICBndC0+ZnVzZV90b3BvLmwzX2JhbmtfbWFzayk7DQo+ID4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90eXBlcy5oDQo+ID4gPiA+IGluZGV4IDZiNWUwYjQ1ZWZiMC4uMDFlYTg3ZDg4ODZiIDEw
MDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiA+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiA+ID4gPiBAQCAt
MjcsNiArMjcsMTEgQEAgZW51bSB4ZV9ndF90eXBlIHsNCj4gPiA+ID4gCVhFX0dUX1RZUEVfTUVE
SUEsDQo+ID4gPiA+IH07DQo+ID4gPiA+IA0KPiA+ID4gPiArZW51bSB4ZV9ndF9ldV90eXBlIHsN
Cj4gPiA+ID4gKwlYRV9HVF9FVV9UWVBFX1NJTUQ4LA0KPiA+ID4gPiArCVhFX0dUX0VVX1RZUEVf
U0lNRDE2LA0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAjZGVmaW5lIFhFX01BWF9E
U1NfRlVTRV9SRUdTCQkzDQo+ID4gPiA+ICNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX0JJVFMJCSgz
MiAqIFhFX01BWF9EU1NfRlVTRV9SRUdTKQ0KPiA+ID4gPiAjZGVmaW5lIFhFX01BWF9FVV9GVVNF
X1JFR1MJCTENCj4gPiA+ID4gQEAgLTM0Myw2ICszNDgsMTIgQEAgc3RydWN0IHhlX2d0IHsNCj4g
PiA+ID4gDQo+ID4gPiA+IAkJLyoqIEBmdXNlX3RvcG8ubDNfYmFua19tYXNrOiBMMyBiYW5rIG1h
c2sgKi8NCj4gPiA+ID4gCQl4ZV9sM19iYW5rX21hc2tfdCBsM19iYW5rX21hc2s7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKwkJLyoqDQo+ID4gPiA+ICsJCSAqIEBmdXNlX3RpcG8uZXVfdHlwZTogdHlw
ZS93aWR0aCBvZiBFVSBzdG9yZWQgaW4NCj4gPiA+ID4gKwkJICogZnVzZV90b3BvLmV1X21hc2tf
cGVyX2Rzcw0KPiA+ID4gPiArCQkgKi8NCj4gPiA+ID4gKwkJZW51bSB4ZV9ndF9ldV90eXBlIGV1
X3R5cGU7DQo+ID4gPiA+IAl9IGZ1c2VfdG9wbzsNCj4gPiA+ID4gDQo+ID4gPiA+IAkvKiogQHN0
ZWVyaW5nOiByZWdpc3RlciBzdGVlcmluZyBmb3IgaW5kaXZpZHVhbCBIVyB1bml0cyAqLw0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiA+ID4gPiBpbmRleCA0ZTAxZGY2YjFiN2EuLjczZWY2
ZTRjMmRjOSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ID4g
QEAgLTUxOCw3ICs1MTgsOSBAQCBzdGF0aWMgaW50IHF1ZXJ5X2d0X3RvcG9sb2d5KHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLA0KPiA+ID4gPiAJCWlmIChlcnIpDQo+ID4gPiA+IAkJCXJldHVybiBlcnI7
DQo+ID4gPiA+IA0KPiA+ID4gPiAtCQl0b3BvLnR5cGUgPSBEUk1fWEVfVE9QT19FVV9QRVJfRFNT
Ow0KPiA+ID4gPiArCQl0b3BvLnR5cGUgPSBndC0+ZnVzZV90b3BvLmV1X3R5cGUgPT0gWEVfR1Rf
RVVfVFlQRV9TSU1EMTYgPw0KPiA+ID4gPiArCQkJRFJNX1hFX1RPUE9fU0lNRDE2X0VVX1BFUl9E
U1MgOg0KPiA+ID4gPiArCQkJRFJNX1hFX1RPUE9fRVVfUEVSX0RTUzsNCj4gPiA+IA0KPiA+ID4g
aGF2ZSB5b3UgY29uc2lkZXJlZCBzZXR0aW5nIGJvdGggZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxp
dHk/DQo+ID4gPiBBbmQgdGhlbiBoaWdobGlnaHRpbmcgaW4gdGhlIGRvY3VtZW50YXRpb24gdGhp
cyBkdXBsaWNhdGlvbiBpbiB0aGUgY2FzZQ0KPiA+ID4gb2Ygc2ltZDE2IGFuZCB0aGF0IHRoYXQg
c2hvdWxkIGJlIGNoZWNrZWQgZmlyc3Q/IQ0KPiA+IA0KPiA+IHRoYXQgd291bGQgYmUgYSBzaWxl
bnRseSBicmVhaywgd2l0aCBzb2Z0d2FyZSB1dGlsaXppbmcgdGhlIHdyb25nIG51bWJlcg0KPiA+
IHVudGlsIHNvbWVvbmUgbm90aWNlZCwgcHJvYmFibHkgYWZ0ZXIgZm9yY2VfcHJvYmUgcmVtb3Zh
bC4uLiBhbmQgYWxzbyBicmluZw0KPiA+IHRoZSBxdWVzdGlvbjogZG9lcyBpdCBoYXZlIE4gU0lN
RDE2IEVVcyArIE0gU0lNRDggRVVzPw0KPiANCj4gaHVtbi4uLiBpZiB3ZSBkZWNpZGUgdG8gc2V0
IGJvdGggZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIHdoeSBub3QNCj4gcmF0aGVyIGdvIHdp
dGggdjEgb2YgdGhlIHBhdGNoPyAgdjEgb2YgdGhlIHBhdGNoIGRvY3VtZW50cyB0aGF0IHRoZSBF
VQ0KPiByZXBvcnRlZCBpbiBFVV9QRVJfRFNTIGlzIG9mIHR5cGUgWC4gSGF2aW5nIGJvdGggbWFz
a3MgaGVyZSBkb2Vzbid0DQo+IGFuc3dlciB0aGF0IHF1ZXN0aW9uIGFuZCByZXF1aXJlcyB0aGF0
IHdlIGFsd2F5cyBjb252ZXJ0IGJhY2sgdG8gdGhlDQo+IHNpbWQ4IG51bWJlciAoYW5kIGV2ZW50
dWFsbHkgdG8gdGhlIHNpbWQxNiBudW1iZXIpIGZvciBuZXdlciBwbGF0Zm9ybXMuDQo+IA0KPiBz
byBzdXBwb3NlIDUgeWVhcnMgZnJvbSBub3cgd2UgaGF2ZSBzaW1kMTIzICh1c2luZyBhcmJpdHJh
cnkvYWJzdXJkIG5hbWUNCj4gb24gcHVycG9zZSB0byBhdm9pZCBwZW9wbGUganVtcGluZyB0byBj
b25jbHVzaW9ucyk6ICB3b3VsZCB3ZSBrZWVwDQo+IGV4cG9zaW5nIHRoZSBzaW1kOCwgc2ltZDE2
LCBzaW1kWCwgZm9vWSBudW1iZXJzIGZvciB0aGUgc2FrZSBvZg0KPiBiYWNrd2FyZCBjb21wYXRp
YmlsaXR5IHdpdGggcHJldmlvdXMgSFc/ICBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlDQo+IGFsdGVy
bmF0aXZlIG1lYW5zOiBpZiB1c2Vyc3BhY2UgWCByZWFsbHkgc3VwcG9ydHMgcGxhdGZvcm0gWSwg
aXQgaGFzIHRvDQo+IGtub3cgYWJvdXQgdGhhdCB0eXBlIG9mIEVVIGlmIGl0J3MgdXNpbmcgdGhh
dCBtYXNrIGZvciBhbnl0aGluZy4NCj4gDQo+IFNvIG15IHByZWZlcmVuY2Ugd291bGQgYmUsIGlu
IG9yZGVyOg0KPiANCj4gMSkgdjINCj4gMikgdjENCj4gMykgdjItd2l0aC1mb3JldmVyLWJjLWJl
dHdlZW4tcGxhdGZvcm1zDQo+IA0KPiBCb3RoICgyKSBhbmQgKDMpIGhhdmUgdGhlIHNpbGVudCBt
aXNiZWhhdmlvciBpbiB1c2Vyc3BhY2UgaWYgdXNlcnNwYWNlDQo+IGRpZG4ndCBhZGFwdCB0byBu
ZXcgVUFQSS4NCg0Kb3B0aW9uIDEpIHYyIGlzIGJldHRlciBpbiBteSBvcGluaW9uLg0KDQo+IA0K
PiBMdWNhcyBEZSBNYXJjaGkNCg0K
