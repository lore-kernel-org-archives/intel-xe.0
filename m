Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494E2E83F05
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 18:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF6510E734;
	Wed,  4 Feb 2026 18:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aB4hGG/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF2610E734
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 18:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770228910; x=1801764910;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gw4zkNRsTSODCwOJC/3244XHS4eLmX/rVplkxboayTE=;
 b=aB4hGG/m20AW1uGD1fGpUtzQPUtSXjRA7aKth9NpX36nO9MMzpqTqKBz
 4VZerWjyv/NqY9AoxqpBHSn3MsKvA5i4NtZCZQxeONcLxeOdQ4nUIpT1S
 2CXq6E+A4SoAlSHkr6+7JBXqv0LSq1LUC3DEbQZqv8V+cE8TGuGAp/rSG
 R9+cVrqKesoQ5N8q90+Wr52bLLgoG1ZaB79Dm5jRtdgBWAC2PtdoXt29e
 9+RNYkZj0nWaB5EnKK9LcQ0Dq2pd3o40pVz3ioltyTXf4Y0sLujq5TJRB
 bWvG64ywyGU9bTK7Qrt8dGjz03gPDylU8XR02WIUIXZp86iEbigXW1LmU A==;
X-CSE-ConnectionGUID: CEcfNdUJQjuUWq5hNt7jhw==
X-CSE-MsgGUID: B8QByMF5RtKkofb3EkT2Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75042052"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75042052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:15:10 -0800
X-CSE-ConnectionGUID: mIZhYEM4TnuKlMgYPG2C9Q==
X-CSE-MsgGUID: 84Vv7JRdQWaGmFYNrXk/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214769767"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:15:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:15:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 10:15:09 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 10:15:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9RmpNgWclfIzycH9fUoAtKyI67vD6d9DQMuO77fuxiLXqyzhg4xqFquX/bZbzWbrgy5hav4/SHQshq/R7TXCsAQGRj9UAh4/ufjQ4YvIRutT8vtAS6HBWLKvGXFHNKvos6+GW100MIQInlJUPsFLreU+FtSgSs2b55dFOfT5WhLjTvhvmqvQoIUHnU5FM4zHyfMKFAwReiu3E3VPjoJPV9lrk3SR0cgRejQn+w674nstzg0IRvR1R9fd1lb7o4zNnWd4rtVIFxLNOyFWoJW+j4QxWZ6d4TFYYWMxAYWyqop8Lh/Kx3e9hoeEsXGs0VQ0qh8FGtfK9QfYHNquGeP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw4zkNRsTSODCwOJC/3244XHS4eLmX/rVplkxboayTE=;
 b=yxGPfPR2Ot1KcfB9ZtPNPDR0wxlLWVRJ2PgMVrmimnidLXpt0CprN2fPsI8RNtgFM4+rHDq/Ejt87qcMFtnqeGqDO3KeJUR366SX5RPyLI9Ae53gweRi1ypECte1XG+rOYNgc/V31gqNcpL9MzL8MUXwh3I7rQufl6HwkyfQWXIGy+sMNED0tDrHpxOp2+km1l5s6SGDadiOqEqzKYzlcu7v71dtDCJ8RerSdsXz8c4S7oTXma4X9RYbqHq5F+zZIusfesbZwwiSBDChm9gJwAWfgmH+MGr+pq1lyd4Jle/tbatkCFsrAIHrSFYgWzCzsvZVh5S22QA8nqRGrwoP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by IA1PR11MB8863.namprd11.prod.outlook.com (2603:10b6:208:598::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 18:15:06 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%7]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 18:15:06 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
Thread-Topic: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
Thread-Index: AQHclVEVYAqyNghOzUC9uCF1QzakkLVyr4sAgAAqEAA=
Date: Wed, 4 Feb 2026 18:15:06 +0000
Message-ID: <PH8PR11MB8040896B4DF18BE1393ACC50F498A@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260203172045.1154546-1-jia.yao@intel.com>
 <20260203210659.1194480-1-jia.yao@intel.com>
 <fb29d021-a0ed-4b33-b6e9-07918e966b8f@intel.com>
In-Reply-To: <fb29d021-a0ed-4b33-b6e9-07918e966b8f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|IA1PR11MB8863:EE_
x-ms-office365-filtering-correlation-id: 42459b9d-9625-4085-a9bc-08de6419531c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OG5STjhVd3ZqWEtJRURsRXFRbTNDdUhVMjQzSHJ3aGlpYWdqd2J6VVY4NWR4?=
 =?utf-8?B?QmJveGV0QVR5TXRJdjJTSjA4QUxCVDdGRWtWYXZheVFuL2pOWU5TTCtFVXlE?=
 =?utf-8?B?dFRDODhMUFgrMXVNQTgrUXVzQlZzcG9PYysyZEhrdXFKM3o2WHMzM2t1cGtJ?=
 =?utf-8?B?cEFvNzlkZGt0L2phVSt0YTB3RmJUNytBRFc4L292V2pVQ0xadGFadVJvbEtx?=
 =?utf-8?B?dThKcGRzd2FObVhrUEp0TGNVTzhXbWlTVGxPdHVoVGtsQlJFU0RqeUVDNWVr?=
 =?utf-8?B?clNvdFVLZ1ZORlVLYTN4bSt3VC9nNzBjdnhhazZZZlJYclJKZHZXVlAwMjZi?=
 =?utf-8?B?aUkzdFJrUnQ2dDVHdnZFV1JwclBra2pnelBMVjlYOWxTcGdpSWpoOUhUSnd1?=
 =?utf-8?B?M1RTR1VvU3NoeDRiRVV4WDVXbzYyTEQwNHIrZUIybjhFSllZZ0RyelIwUW9R?=
 =?utf-8?B?UC9RZDRRbk5mNG5MZFBiS1AzcDRVUHJFVG8vZ3pSTHg0MGZlb2xTeDhXSitM?=
 =?utf-8?B?UXhxK2x4bHA3RHowME00UFp1aEhLcVFqWEt0MmhZSEJVaW5KMUJ3R1hqaHlh?=
 =?utf-8?B?dFd4T1NwSGlqL08rZlErMDlnUnFVTFJzcjhpN1liRHE5ZTl0Tk1zY082RlN6?=
 =?utf-8?B?VjRFRk1WTVdzemtvK2YyRTNLa05FMW9rTE9DcHhhd0ZKMDNoMElibXc3T2dn?=
 =?utf-8?B?c1RieHhPa1ZzYzhmTDdEcUc1c2FSMlcyWUU3VVBCZSt3cUY0ejRWcDMrbVNs?=
 =?utf-8?B?bU4vd09BZmN0VEQ2ekd5UVZzQjBWU0JmV28zSURDK2Z3M0RyZkN5bS82eG9v?=
 =?utf-8?B?UzBhY2NjaThYcHNXWjN6VGtVZnIzbmladHAzN1h5YW41ejZ2TzNHamZiakRW?=
 =?utf-8?B?NmFHVnlzTHRUQW9DUkRnVlE1OFgyTlUySkllNzhxVkMyd2llZytKV1BRblUy?=
 =?utf-8?B?bkE5SFFZREpwMHBYREppWWVISEUzZU5sUXVKT2UvbGlnd2EyeFdJTHNFNXNw?=
 =?utf-8?B?MG1XWFJCQmZxQ054R09tS0laSy9ja2hqZzhrb1IvS1FqVkRNMTdJRWlUWW9X?=
 =?utf-8?B?SStjdGhRQUo0REQxNG1EaVppQ3NibWRvaWtFd1RhMllyT1V1RXdTV0tRNzd6?=
 =?utf-8?B?UDVUbDVadk5SV3RkRGxmR3RXV1orbFB6SkMvM1dkYzNEaU9PT1VMYkJXY0pU?=
 =?utf-8?B?QlhCRjlwb0JpbEp0QTVPN2xIQnQxSkRoY29VSWZvdGRTWlRqL1VJT0N4RnFx?=
 =?utf-8?B?TFA5NjM2UWZhQjF4WHE5RWVFdmY5SUtFaEtpR0ZINUl0RjEwcEx4SzEyZUxB?=
 =?utf-8?B?RDExRkk4TnlEK2dLdGx5NGMyc2grT2ZpZGRXaFpMdnpzcXlzcXQ3L2l6NGRy?=
 =?utf-8?B?MmVkc2ZFTUJWeGsxRFNRZFhEN1BhbmFhWVpQcm5SbkNuNmVQaE1FQUJOZjhv?=
 =?utf-8?B?RURYVVBCRnZxUVliV21kOGhjL3dHNEpRVy9iMXJlY0FSZmpKUUZtdlU5WHdx?=
 =?utf-8?B?eDVuUHdYbE9nRkpBbThZNFVPR2UyM3IzeGZlT3g4Z3NYd2p6MDBNNFJJQnM3?=
 =?utf-8?B?VmcyTGpXRGkvNHNMekJSK2lBYW01UldqL2c3blV6ZExsTUlkV2JESFN6RUto?=
 =?utf-8?B?R09MUm40V2ZtVEtkK2FXdEwzeDh6TDRMd0R0MDdMOHdER2JmbVp3cUtXZDQv?=
 =?utf-8?B?WVZLMGxGY2R6ZlFDN3RaeVpBNzNhc0x1MER5SjNzMWpyYmpyK2ViaEVsU1U1?=
 =?utf-8?B?MnVucER4MmJIWm9xb3pzZ0ZkaWN2bEd1dlQ5bkFpanRLYjM4bmszUzRuZll5?=
 =?utf-8?B?SVVIV2J4ZFVNU0ZGNFpJTUlJRWpFMVlOeFM4Qkg0Lys5QkhFY250M1hWSS9p?=
 =?utf-8?B?UU9TMUVDVmVSdmtFWm1IK0Nnc20zUVByNG1DNGJPOFhBTzdGVDEwV2ZKWUZU?=
 =?utf-8?B?aWZWcUthanZySW5FLzBlQ0hjYnVoTDdRZ1IzTzlFYTJYekNJMXJ3UXJIeTdZ?=
 =?utf-8?B?cTlMelhsc0RiTzNvYnBmQ2hRZEg1NThVMTBpcTQ5OGh1d2dpZ2lhSStDVHNK?=
 =?utf-8?B?VTE3RGRaZGo1c3MybVdOT0FNNjNxWnk1S0pZS1FRQTlnRUtNa0JYcGVoTGc2?=
 =?utf-8?B?RThwL2ZNZDVOcER1TnlEbFAwVFRad1pXWCtYeFp3Qmh4QnpMNVpVOG41Q0g1?=
 =?utf-8?Q?Sted4gQJrYCgwavjmqhC5kg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXVrL0dmdFBTV1ZpRm1TYVFjS3YyektXTlNIMGJDLzlmcERxVk9Ick16RlVs?=
 =?utf-8?B?NXk4Unc5ODRUQlBmc1BMMU1SQlpXdC9lQUFYcURQU1RaNjVTZDc1VVhTbkNK?=
 =?utf-8?B?eDlWbFZiT01IKzMxa0dsOWlzcjNQTUtOMUhacnVLNk9ZclZNZGlHQVAxZTdZ?=
 =?utf-8?B?M2FjS2FReXdNMTFkZGsveFdHbWlTUThSV01jYlVtY1JCMW5TUk1yOXFCY0R4?=
 =?utf-8?B?cE5MNFVsTllUZ3FFQmM0QmhLNXZsaDFINmlrLzgxdUNvaTdDdHFPS0orWWxY?=
 =?utf-8?B?b0NkejFBUkludmV5M3NsZlM2eGlMVXlsemU4SkZQS3liTU5TM2JHcXpVZ2hr?=
 =?utf-8?B?LzJuT3RUYW5OY01obE0yVHRkM1RvU2RoZXpVVzNkdjR5c21oN2FCcHdQVEJP?=
 =?utf-8?B?YmdKZmxHR2hKSG16THNBVHdBdGt0eEZ4eUU5b0g4TE5NeUhXSUt6Y3ZFZlJo?=
 =?utf-8?B?dnh1alRuUnNGZCt6MWxuUzdpQjI3SXZKSjg4VHNzUm9mSjIvdWtKdkdCVUp6?=
 =?utf-8?B?Tkcya2piYnRKZWlpNVZWL09UQkl1eXJsMkVGdjhNUGJzaHdFbWdJL3hRdVov?=
 =?utf-8?B?aTRrMlI1L253OXdkZC9NNGJOTlRQZDJoUlBYdjc0N1I3Z24zVU5QcVdwaHBY?=
 =?utf-8?B?T0wwRnZYWkxqSXh3V3FwUjc4bTdqNjE3ME9lZS9vcWdlaklkaFJLbUxnYndO?=
 =?utf-8?B?ak0wZjJjNWFiTnU0N1N5dnRKVTJKa0VJVUx3NlNGOTBHbXNFaUJ5U0l4MWY5?=
 =?utf-8?B?ajRWNlZTTWN0Vys1MDBXYndnYlVIQTFPWFZIUyttU1A0ZjUxNjdLWEIxRENU?=
 =?utf-8?B?MllrYzA4Z2VKcndHRXc5czdYV0ZRSnU2M1IwcERPOXRJSjRybWtWZTFFQndL?=
 =?utf-8?B?QUVieFMreGlYZURoc2M1YjFaVTVROXRmZXJxbi9JWG1iNWFRb2JwUHdTNytt?=
 =?utf-8?B?cjJwWk1WOWxpNUxFWHVtOEIyTWNFMitzUUpBbXorTlBreE56b3FHeDlkS1hQ?=
 =?utf-8?B?Z0tjREdHaDUxaTdkbkRrQitlcXRxc29KWW1tcTAzdGRiVHpTaERTNU0vZDlC?=
 =?utf-8?B?VS92aG5TSVVKc0QwOGJwKzYrdXAyWVNhUnN2b0NaR1dscHBSemo2SG9vMkpT?=
 =?utf-8?B?dVVLRFJWNlZzR1Q4TCtHY0g4MkVlaEMzOVdqUmV4eG5oaDlWR0NTLzVFa21V?=
 =?utf-8?B?UkExUWlXUmUvcUhPVkFLNXJvOThZelpheGFhSm9KR3ZMb3pFbEtITHU2Smxx?=
 =?utf-8?B?RzUxTUR4SUpOZU1KMU5GRTBwQm1NbmtMSzdKTndvL0FIZTN5QnR1a2R4NEk3?=
 =?utf-8?B?SmNBMHA0NmtvVnB0eVUxMzRmak1TM1RDWWdqL1lPUGJlUEQzR1VmeDRBQ2RX?=
 =?utf-8?B?Yk81cHRCVVk1eXprZGtJNGd4NFpidld6eTcyRU1nNDV3RDF5Rk5QRmxkQU9m?=
 =?utf-8?B?bWhnOVhWcHpRVGpUSWYzcnlLQ2hjUkY5SEdCZjJiQlhuRjdmZ1EveEs5b1Rj?=
 =?utf-8?B?Z29ENTJPSE90bTlOYUlyY2VUQ1ZxaGljSmVuVzYwcVNzNzBqLytOcXZKVDV3?=
 =?utf-8?B?OE4rTTdTQlZHa0VpSmpvYityaFZtZk9hV3E5eEgybWhaVGxkTVhFMDArcUZq?=
 =?utf-8?B?UXprUUwxcXUrRW1TL1JJM3VXZTZkNUsxSWJ5bWFneVd3ZXVUbGM1MGUyUVdJ?=
 =?utf-8?B?cDVxTkhObm5zVUI0UnplYlV3NzBDM3pOU0dvWVFxOU1IWHdxeGh2U21DLzc3?=
 =?utf-8?B?YnJ1bGVxUHRCOGxKN3NFS2hGSVlyb2N3dmxBOUxCY0QwVC9LWjBaL1VDNGhS?=
 =?utf-8?B?Vmd2L1Nqd3BoWmdCWm5jWGp6cVAvWEZaQnlwRTBmYXE4VDhYTklkWjEvTjdk?=
 =?utf-8?B?dC9idm1hc2NJS096b0ZPc2o3UG01QlRIcmhuUCtnTWZWMTZ1bW1MRTcwKzJx?=
 =?utf-8?B?UGd5djQ0OTF4NFNvL0tKZHNzOVB4TS9aOFdseE9BdUY2K20wQVh3Zmx2R3hW?=
 =?utf-8?B?bnorTHdRZm56bjJnbTJCNzBLM1NYcXNCKzFnR0hiMm1yMW1hTE8xakRSb0pK?=
 =?utf-8?B?OXE2NGs1RFhnQ0Q5QUZsNVVkZU9NL1dldFp6YnlDS1diVUNZcE9nR1A3bGMv?=
 =?utf-8?B?T1FCSGNnaFBvcHhpKzFmdkphMzBhWW16cW05NDBhcEFFczUyYWJkTEtkUXpN?=
 =?utf-8?B?bU10Wkd3K3BsMjMzQU1hQkxVYThuZC8vSUUwUFVCUzV2M0tERHBiUDBDdFlk?=
 =?utf-8?B?TTdPOXlXaTFZL0pWVkpHR0VwSHNWNm42dEVLeEJYTEVNNnF3cm5PU2MrZExG?=
 =?utf-8?Q?Esg6X0JQ+OT2oxp3nt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42459b9d-9625-4085-a9bc-08de6419531c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 18:15:06.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okkCR2wCwZXOgGXVLp0hemuSBUGA6Kc1smQmxXvp5DPncKg2g09t3iwmD3EodadKHXeW347QarprVSC3ymVVdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8863
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

VGhhbmtzISBNYXkgSSBhZGQgeW91ciBSZXZpZXdlZC1ieSB0YWcgaW4gdGhlIG5leHQgcmV2aXNp
b24/DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhl
dyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSA0
LCAyMDI2IDc6NDQgQU0NCj4gVG86IFlhbywgSmlhIDxqaWEueWFvQGludGVsLmNvbT47IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQnJvc3QsIE1hdHRoZXcgPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsgTGluLCBTaHVpY2hlbmcNCj4gPHNodWljaGVuZy5saW5AaW50ZWwu
Y29tPjsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGlu
dGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS94ZTogQWRkIGJvdW5kcyBjaGVjayBvbiBwYXRfaW5kZXgg
dG8gcHJldmVudA0KPiBPT0Iga2VybmVsIHJlYWQgaW4gbWFkdmlzZQ0KPiANCj4gT24gMDMvMDIv
MjAyNiAyMTowNiwgSmlhIFlhbyB3cm90ZToNCj4gPiBXaGVuIHVzZXIgcHJvdmlkZXMgYSBib2d1
cyBwYXRfaW5kZXggdmFsdWUgdGhyb3VnaCB0aGUgbWFkdmlzZSBJT0NUTCwNCj4gPiB0aGUNCj4g
PiB4ZV9wYXRfaW5kZXhfZ2V0X2NvaF9tb2RlKCkgZnVuY3Rpb24gcGVyZm9ybXMgYW4gYXJyYXkg
YWNjZXNzIHdpdGhvdXQNCj4gPiB2YWxpZGF0aW5nIGJvdW5kcy4gVGhpcyBhbGxvd3MgYSBtYWxp
Y2lvdXMgdXNlciB0byB0cmlnZ2VyIGFuDQo+ID4gb3V0LW9mLWJvdW5kcyBrZXJuZWwgcmVhZCBm
cm9tIHRoZSB4ZS0+cGF0LnRhYmxlIGFycmF5Lg0KPiA+DQo+ID4gVGhlIHZ1bG5lcmFiaWxpdHkg
ZXhpc3RzIGJlY2F1c2UgdGhlIHZhbGlkYXRpb24gaW4NCj4gPiBtYWR2aXNlX2FyZ3NfYXJlX3Nh
bmUoKSBkaXJlY3RseSBjYWxscyB4ZV9wYXRfaW5kZXhfZ2V0X2NvaF9tb2RlKHhlLA0KPiA+IGFy
Z3MtPnBhdF9pbmRleC52YWwpIHdpdGhvdXQgZmlyc3QgY2hlY2tpbmcgaWYgcGF0X2luZGV4IGlz
IHdpdGhpbiBbMCwgeGUtDQo+ID5wYXQubl9lbnRyaWVzKS4NCj4gPg0KPiA+IEFsdGhvdWdoIHhl
X3BhdF9pbmRleF9nZXRfY29oX21vZGUoKSBoYXMgYSBXQVJOX09OIHRvIGNhdGNoIHRoaXMgaW4N
Cj4gPiBkZWJ1ZyBidWlsZHMsIGl0IHN0aWxsIHBlcmZvcm1zIHRoZSB1bnNhZmUgYXJyYXkgYWNj
ZXNzIGluIHByb2R1Y3Rpb24ga2VybmVscy4NCj4gPg0KPiA+IHYyKE1hdHRoZXcgQXVsZCkNCj4g
PiAtIFVzaW5nIGFycmF5X2luZGV4X25vc3BlYygpIHRvIG1pdGlnYXRlIHNwZWN0cmUgYXR0YWNr
cyB3aGVuIHRoZQ0KPiA+IHZhbHVlIGlzIHVzZWQNCj4gPg0KPiA+IEZpeGVzOiBhZGE3NDg2YzU2
NjggKCJkcm0veGU6IEltcGxlbWVudCBtYWR2aXNlIGlvY3RsIGZvciB4ZSIpDQo+ID4gQ2M6IE1h
dHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IENjOiBTaHVpY2hlbmcg
TGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4gPiBDYzogSGltYWwgUHJhc2FkIEdoaW1p
cmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiA+IENjOiAiVGhvbWFzIEhl
bGxzdHLDtm0iIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiBDYzogUm9k
cmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENjOiBNYXR0aGV3IEF1bGQg
PG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmlhIFlhbyA8amlh
Lnlhb0BpbnRlbC5jb20+DQo+IA0KPiBJIHRoaW5rIHlvdSBkcm9wcGVkIHRoZSBzdGFibGUgQ2Mu
DQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtX21hZHZpc2UuYyB8
IDcgKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9t
YWR2aXNlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bV9tYWR2aXNlLmMNCj4gPiBp
bmRleCBhZGQ5YTZjYTIzOTAuLjM1NjRlMTQ0MjY5NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm1fbWFkdmlzZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZtX21hZHZpc2UuYw0KPiA+IEBAIC0yOTEsNyArMjkxLDEyIEBAIHN0YXRpYyBib29sIG1h
ZHZpc2VfYXJnc19hcmVfc2FuZShzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSwgY29uc3Qgc3RydWN0
IGRybV94ZV9tYWR2DQo+ID4gICAJCWJyZWFrOw0KPiA+ICAgCWNhc2UgRFJNX1hFX01FTV9SQU5H
RV9BVFRSX1BBVDoNCj4gPiAgIAl7DQo+ID4gLQkJdTE2IGNvaF9tb2RlID0geGVfcGF0X2luZGV4
X2dldF9jb2hfbW9kZSh4ZSwgYXJncy0NCj4gPnBhdF9pbmRleC52YWwpOw0KPiA+ICsJCWlmIChY
RV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnBhdF9pbmRleC52YWwgPj0geGUtDQo+ID5wYXQubl9lbnRy
aWVzKSkNCj4gPiArCQkJcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiArCQl1MTYgcGF0X2luZGV4
ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGFyZ3MtPnBhdF9pbmRleC52YWwsDQo+ID4gK3hlLT5wYXQu
bl9lbnRyaWVzKTsNCj4gPiArDQo+ID4gKwkJdTE2IGNvaF9tb2RlID0geGVfcGF0X2luZGV4X2dl
dF9jb2hfbW9kZSh4ZSwNCj4gcGF0X2luZGV4KTsNCj4gDQo+IG5pdDogSSB0aGluayB0aGUgbm9y
bWFsIGNvZGluZyBzdHlsZSBpcyB0byBwdXQgdGhlIGRlY2xhcmF0aW9ucyBhdCB0aGUgc3RhcnQg
b2YgdGhlDQo+IGJsb2NrLiBUaGUgcmVzdCBvZiB0aGlzIGZpbGUgc2VlbXMgdG8gZm9sbG93IHRo
YXQuDQo+IA0KPiBPdGhlcndpc2U6DQo+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+DQo+IA0KPiA+DQo+ID4gICAJCWlmIChYRV9JT0NUTF9EQkcoeGUs
ICFjb2hfbW9kZSkpDQo+ID4gICAJCQlyZXR1cm4gZmFsc2U7DQoNCg==
