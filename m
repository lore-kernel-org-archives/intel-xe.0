Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA2CE7718C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 18:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A5710E09D;
	Fri, 20 Dec 2024 18:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heBm+3y0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF3910E09D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734718129; x=1766254129;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m+TmA78XhCBIWQBlyGmBl3ELIIBN+sAiTxy8hroC7B8=;
 b=heBm+3y0kbSnBctiOJ0a6YRndsoCIymxu+uKpVR4guhib91BDwdHjYKR
 RSTXK3DGeC90HJrvlo3TECtoPASl+OBALihPdBCkj0x7ZOL5BVe99oZ7k
 3c9Sw8mBtC/bOPuIePB6hXuvEbl1fZ9i5+QBRsuYpUvHwbX2IwjNmMXaf
 Jx/ZefBGi16h6KmQL0uKAUCS3lL74UbSpg8OETgNBlsiVPG6/NUWqrfn5
 dWSqFXPnJcYvouvKm2PkR0W0FLpvpqQz3jbVb0suBSMuZ1JN0UQKEV5js
 wZD3fcwwffXWlsgI5gYHNkAgnWseyQMFLJ1WBeTJW9kgTTRGyc/mQTwhQ w==;
X-CSE-ConnectionGUID: HAInG804RvSJhWFV6kjlgw==
X-CSE-MsgGUID: BW8QKTVJQKC3jaVFLf1p3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45766172"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="45766172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:08:48 -0800
X-CSE-ConnectionGUID: G8/tOR52QZ6Nfx+mzF20WQ==
X-CSE-MsgGUID: ZDpBRBiTRI6k8/A1CPI9TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="98348903"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:08:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:08:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:08:47 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:08:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcCvOd4KZUyDbsZ+tpLSBmfOhtdGPpUNRLXYE4mLnf1VmF0whbLMuD2cxxV/I74AfJEndTCKOFjrTdAsrnel8OGYa9xO62fJr9jFkSKvkAMLL6+pgqdM7AxMdIGXdHkwg9NzysAN9mxS5sEWUeFKSr8F1rOWAyvWA4IPpeMQXirxd5I9BKn+rBSC6NWuzcC9a9tEDd1C9+napDjyY8c75TECiPdPtXRD0mspADBA462tyo2/5kZIdHylP/TqdXnwDkKB8h6pyvATb/KZrSRnKeStFlTAALWYNsTQwufN9F+SVvFM+4AAOO2ZF0QtJHc0qU19EWIzU++Grm5rRg+Gow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxO3ADO9+jacUgJhvmAz4k3Xf56FyD9eRDEN+f6oHI4=;
 b=V0wPJA8lJJgHdjB2WywFkJoR6BQbUIcQwAJvgWLzxuGZez9Kj0MPYKJ5x0D5as4pjP76BHhE8dFdLRlMMDS07bfswnVKKjCV8Z7GUsF/RECFNFbDMBE3cV03aR+Wqbvi5u+FrDuSSEaa4DkZpLhwsRuAiEw/8B5PVww1W0Bgh7BaEkgBFRCN0ZiLm/OrlIBczt4lk1dc1kCRESA/C0dX6vLmxLvA4j7H5InlN/A8oT7VJIFwSeO56Mql6b5EuPMvaqhm9AQnoVVxa0qJDU7cjc58sqKQ5e2cgUmOj2BFkvxz3+LV/NEVycVejXRnQh62DFJyrWIHJorOEXfzsR19iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 18:08:41 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:08:41 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Souza, Jose" <jose.souza@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Thread-Topic: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
Thread-Index: AQHbUwNkteZZg17O60KykKAUERALmLLvZ/zg
Date: Fri, 20 Dec 2024 18:08:41 +0000
Message-ID: <BL1PR11MB54457FB542D12F9E10AB2AD2E5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220171919.571528-1-umesh.nerlige.ramappa@intel.com>
 <20241220171919.571528-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241220171919.571528-2-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|BN9PR11MB5242:EE_
x-ms-office365-filtering-correlation-id: 2da198c9-d766-4490-d006-08dd212155f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bUrpmrQOR3IMZ1LVUjKK+dIzJi94eqLy8ZOxGmm+O6nWJfMKP+HcVGiBNV69?=
 =?us-ascii?Q?gEICn9Z6/yRBVZhL1Bq5+jEcK1qFVYBpjt2zXtW0/U2xgE6ugZnIbGnN00xL?=
 =?us-ascii?Q?4PEoiojDlQuFrDqaDdnBifHSa319bClkYlZPBAZMcnp9/p3V4BA1/KtBWe0q?=
 =?us-ascii?Q?MRA/MrWNkQ71Mxs1W6Zbqi5xxmDXAZcaUV9yFKnRg0yC7kYCC7NEqWVkBg2a?=
 =?us-ascii?Q?GTTKDpEV76vcHv94za2LafvVyvh5lAU8ygB/EA3VeNlJj52dnIeB8d8gLhOx?=
 =?us-ascii?Q?uy5GkgtvXnYrgY+xDRt1YSTWVwTSILjJmcQQYm4EhxYRBVYVJO5vcSXqhuK4?=
 =?us-ascii?Q?vUTXi4CK7GajlJPx2X+1spPh54gCLnXFcLSWb+7KlwKpNsN1t2aI0R/eClxU?=
 =?us-ascii?Q?CUZVfsDK3yuCYO9cD21sTYgGicVlR552uVZ/k0YXuSa/JtH6oi7JOcwxIWvz?=
 =?us-ascii?Q?e0FM66DUJLlfN5m/P/HQUvUKAM6SRqUSlfS7STHQFe5IAEjPemtv5cdNT+FH?=
 =?us-ascii?Q?q6H3ZQYsFsd7HLsI3G7dBMMF5h3tyXj+JyVIW3HEoGPt2Pu8PfSYxag5H6+4?=
 =?us-ascii?Q?BSBh+vRwNsJE50lZzWhk+frfjJrYfacbTXY7HH32Ejucr4Gzvmp4dEcFYQZs?=
 =?us-ascii?Q?ISDyn1wyzqWqhjL0Y6rRFNYdBeD0Rzmr8TVdffACozBWC0AYQw5zOdkTXAwm?=
 =?us-ascii?Q?SMWNhMjwS6CMiq7El4Sc8I9sK+L4O4YYaTWcdTGe6iTXq9Yj2o9i98DvWmv1?=
 =?us-ascii?Q?1SmgqrJrGIgqx2Wstit3fka2tEzA/ffcZLg55XfskW8ObLgpxBdoXpc8SaLc?=
 =?us-ascii?Q?7LWqojRJ2x+4z/nKcsdNVQZ2dHMA73L+uLh42YEwMRf0HNKNum3nYidV8gP8?=
 =?us-ascii?Q?Uw3xLGFy74t/Loy3v+Sh2wsEvartgyPjV71NSIR43JWm3YMOtfX7sBbZcGtt?=
 =?us-ascii?Q?rIGLGdylnI00F6QsurHF5zqT8tTKTM2ar/akqhKixXb7WXJHoCtV2ed+ZfjH?=
 =?us-ascii?Q?crGw2DbC4QrjN198Yr7plKhkQBtCbFE22sCXquonSOXwKi4LTkO3RmRWWnBO?=
 =?us-ascii?Q?i6EPcnuKCNmtLb22yDvpkgFKMzCrcuZW/dmn65GBRWTz5gnrO/iZ3YMtTEJg?=
 =?us-ascii?Q?85JdfkuqTrRwNw7HqORhqFGKr6pKwqcnIgkcGkzupmBq+IZZYNe3fZgMx99k?=
 =?us-ascii?Q?kDTAl7CBU8ZSt3m/MRGEUJHnFu9sI1r2ZrycAib2scOUumMYv+tEvGLdLLYx?=
 =?us-ascii?Q?qFlK4PAZNweYGytaLkZLCT+BWKmyeoF9J803KVleltKtyPsdbS+bKJdyGdUH?=
 =?us-ascii?Q?YdVmoSG3LxeF7VSXGClNxQxrrVxQCRN5sGGK4MsirF/7U2uMM4cmFjSMUBez?=
 =?us-ascii?Q?icEX/RAl2xELrVItm27eYqJ0fr8N9h6Xk83ASMiJmp/UD5TsIYn9HS81PuKf?=
 =?us-ascii?Q?JfvbioGtud242UThQHc22IuWdMxywEKZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wDCl0WJ45Mwuvj6XM0hEPkSMHwKtrfKtEzx7y7wjsf1X9HKAr7vOLvhRcphT?=
 =?us-ascii?Q?CYc7fPR2txDOcWfyyQEaJFd1GCXLbPJd6ROdgj/ED5jHJocM0IlZIcRuzJxl?=
 =?us-ascii?Q?LZgQtSEU/cApuH5lx/mBwOwkrDJMBE8hrLKfkwJYlTh0PIE90WfqX3AZ22p6?=
 =?us-ascii?Q?TPgJJH9g4S0GRAWhWZJt/JdD/5+Gx8aNwZlm5inEykJO48oDmNQxviX6NXfo?=
 =?us-ascii?Q?z4qBuNGzFVRxSbl+Z0/ab/jeaZBth488+MPxAjY0OOlX6pU6aHEPyDYTUPGw?=
 =?us-ascii?Q?odEvJcOg8aaNj1lGticTx2Fk0g0YygBKBB0JW+PmZoLVpXHoq2JTYU92pvOE?=
 =?us-ascii?Q?hKqBtYNjXRftd6olSXmTOdEQxenWnzR/Ak4dAZUrtSqJsUyEzyXaijN4aMhV?=
 =?us-ascii?Q?xuXKp2Lbqh+bV1O5YQBNPnT1CSqbILqUdNL7XAJ8RNIg+i6fBpISLNWAB/CE?=
 =?us-ascii?Q?8LIj9SsSeCJKB0doUxVK3/QRQ/tsuTDfP0Bh5LDJ7wZoLmbbr7+k23BWMnDe?=
 =?us-ascii?Q?/f7M7fjD/IIjCzOOl47/3AiR+5YgbCCvQ38Yt0i/i8bANCQOUH+IGDAdlX4r?=
 =?us-ascii?Q?2VIYOyrHcfinIrXoUjuwJSwNu7rfx8gcpsUWZb9v9ZUtcoQqnJ2DON7cD1Ka?=
 =?us-ascii?Q?Z1C1IzP6DF7ZpJNRfPfULQ7LLoLxsQcZsuo2ncLRVnGBZ5avVWyhxO+AyJWu?=
 =?us-ascii?Q?fMl9BpoIjI/WdjAlFrvFjUW4DpBpU7S9R4vNsbQn1qrZKJ7jzz+19OkXBC6k?=
 =?us-ascii?Q?8oYYMBJBzygE+ql8MwNyvMIlHrF6A+8fJOdZd5LgNpcM+8zLpWvVj5+lPmBI?=
 =?us-ascii?Q?jR5DFYbTM97DCP992otRTAOgQKJJ0G4PFPD81GVUrBJjRq6M/id4C+AuXILj?=
 =?us-ascii?Q?UBT3FYQ0APPBLOkQNyjnjC7yEAHA994U1duT+3iW+7pFe9ARt1HB4WHpvUrC?=
 =?us-ascii?Q?HJhuhK36mHwozaz5QdZeCIA7vvrFyRjfZHEuH+V2SEBVHywLwa0phxgExEXE?=
 =?us-ascii?Q?MtJndZTXmx5jHPR/RZBPCgnL2+/1QmXoA3NRwr8WlUuTJOAS2+M8iZy7ytVr?=
 =?us-ascii?Q?fviOPI/kw3s7iUXpssYLA8wHQBPRRGzccbGo//ZzOV+EOaTcFJcsC5c03rSa?=
 =?us-ascii?Q?P+UgXOCIDC7xyA1yHxhNbueaSzIGnwbh1zsWR/bxBcyMgis4g7ty6Mdwx5jA?=
 =?us-ascii?Q?3u/XWZOAfbHeBiXa3GYoEW+aIw0skimx+bZ3BFghN67thmnbcfZtmXXg+wEf?=
 =?us-ascii?Q?4uqhyPhwrXG80fWbmx7ekpSQWCIYnpoJ9cM8cE9sZ7wQ8icTHUuzXjLwX2VR?=
 =?us-ascii?Q?etsSijfMONVd4/81qyOhx4bjV4/lR8vY5A0x3YI7whQLE3m4A9Yw4CVsW8kd?=
 =?us-ascii?Q?vzG9KOA3xYp/e3n6XdikKXcIsKLvMU0KfcKF4d6rDvt7j0F+Gmf7DyzNKePq?=
 =?us-ascii?Q?Sze7rUM0s+zRMX1a7KE002YEAf/kABbiUcUBbW0ZR/P34iNbuBtTJUCiHrCZ?=
 =?us-ascii?Q?FkdzpH7+nVaIuli3YBVGfeSs1iO/4D/33fJ3TC7F+bKJSs7v00h8mzLOAcpR?=
 =?us-ascii?Q?LbwZRmZnDiyvjfgsEs+/pMBpijJsPmY2f0FhsM6Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da198c9-d766-4490-d006-08dd212155f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 18:08:41.6050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWDMHzGNGjIBOZtVvmPsMwXBwkz3sB/GogHSGklF25DHB54aqBR0n5UZnLHlTJ4z8p+NtYO9EEV3f06vU/zl3nS5O8DJprYuw5s5Qa9T1MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
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


>=20
> -----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Umesh =
Nerlige Ramappa
Sent: Friday, December 20, 2024 9:19 AM
To: intel-xe@lists.freedesktop.org; Dixit, Ashutosh <ashutosh.dixit@intel.c=
om>
Cc: Souza, Jose <jose.souza@intel.com>
Subject: [PATCH v5 1/2] xe/oa: Fix query mode of operation for OAR/OAC
>=20
> This is a set of squashed commits to facilitate smooth applying to
> stable. Each commit message is retained for reference.
>=20
> 1) Allow a GGTT mapped batch to be submitted to user exec queue
>=20
> For a OA use case, one of the HW registers needs to be modified by
> submitting an MI_LOAD_REGISTER_IMM command to the users exec queue, so
> that the register is modified in the user's hardware context. In order
> to do this a batch that is mapped in GGTT, needs to be submitted to the
> user exec queue. Since all user submissions use q->vm and hence PPGTT,
> add some plumbing to enable submission of batches mapped in GGTT.
>=20
> v2: ggtt is zero-initialized, so no need to set it false (Matt Brost)
>=20
> 2) xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
>=20
> To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
> Setting this bit cause the context image size to change and if not done
> correct, can cause undesired hangs.
>=20
> Current code uses a separate exec_queue to modify this bit and is
> error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
> the target hardware context to modify the relevant bit.
>=20
> In v2 version, an attempt to submit everything to the user-queue was
> made, but it failed the unprivileged-single-ctx-counters test. It
> appears that the OACTXCONTROL must be modified from a remote context.
>=20
> In v3 version, all context specific register configurations were moved
> to use LOAD_REGISTER_IMMEDIATE and that seems to work well. This is a
> cleaner way, since we can now submit all configuration to user
> exec_queue and the fence handling is simplified.
>=20
> v2:
> (Matt)
> - set job->ggtt to true if create job is successful
> - unlock vm on job error
>=20
> (Ashutosh)
> - don't wait on job submission
> - use kernel exec queue where possible
>=20
> v3:
> (Ashutosh)
> - Fix checkpatch issues
> - Remove extra spaces/new-lines
> - Add Fixes: and Cc: tags
> - Reset context control bit when OA stream is closed
> - Submit all config via MI_LOAD_REGISTER_IMMEDIATE
>=20
> (Umesh)
> - Update commit message for v3 experiment
> - Squash patches for easier port to stable
>=20
> v4:
> (Ashutosh)
> - No need to pass q to xe_oa_submit_bb
> - Do not support exec queues with width > 1
> - Fix disabling of CTX_CTRL_OAC_CONTEXT_ENABLE
>=20
> v5:
> (Ashutosh)
> - Drop reg_lri related comments
> - Use XE_OA_SUBMIT_NO_DEPS in xe_oa_load_with_lri
>=20
> Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA str=
eam close")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: stable@vger.kernel.org

I don't have any major blocking revision notes for this.  Feel free to
take or leave any of the questions/suggestions I left below.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c              | 136 ++++++++----------------
>  drivers/gpu/drm/xe/xe_ring_ops.c        |   5 +-
>  drivers/gpu/drm/xe/xe_sched_job_types.h |   2 +
>  3 files changed, 51 insertions(+), 92 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index ae94490b0eac..9add60097ab5 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -74,12 +74,6 @@ struct xe_oa_config {
>  	struct rcu_head rcu;
>  };
> =20
> -struct flex {
> -	struct xe_reg reg;
> -	u32 offset;
> -	u32 value;
> -};
> -
>  struct xe_oa_open_param {
>  	struct xe_file *xef;
>  	u32 oa_unit_id;
> @@ -605,19 +599,38 @@ static __poll_t xe_oa_poll(struct file *file, poll_=
table *wait)
>  	return ret;
>  }
> =20
> +static void xe_oa_lock_vma(struct xe_exec_queue *q)
> +{
> +	if (q->vm) {
> +		down_read(&q->vm->lock);
> +		xe_vm_lock(q->vm, false);
> +	}
> +}
> +
> +static void xe_oa_unlock_vma(struct xe_exec_queue *q)
> +{
> +	if (q->vm) {
> +		xe_vm_unlock(q->vm);
> +		up_read(&q->vm->lock);
> +	}
> +}
> +
>  static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, en=
um xe_oa_submit_deps deps,
>  					 struct xe_bb *bb)
>  {
> +	struct xe_exec_queue *q =3D stream->exec_q ?: stream->k_exec_q;
>  	struct xe_sched_job *job;
>  	struct dma_fence *fence;
>  	int err =3D 0;
> =20
> -	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec=
_q */
> -	job =3D xe_bb_create_job(stream->k_exec_q, bb);
> +	xe_oa_lock_vma(q);
> +
> +	job =3D xe_bb_create_job(q, bb);
>  	if (IS_ERR(job)) {
>  		err =3D PTR_ERR(job);
>  		goto exit;
>  	}
> +	job->ggtt =3D true;
> =20
>  	if (deps =3D=3D XE_OA_SUBMIT_ADD_DEPS) {
>  		for (int i =3D 0; i < stream->num_syncs && !err; i++)
> @@ -632,10 +645,13 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_=
oa_stream *stream, enum xe_oa
>  	fence =3D dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> =20
> +	xe_oa_unlock_vma(q);
> +
>  	return fence;
>  err_put_job:
>  	xe_sched_job_put(job);
>  exit:
> +	xe_oa_unlock_vma(q);
>  	return ERR_PTR(err);

Non-blocking note:
Hmm... I'm not a big fan of needing to call xe_oa_unlock_vma for the
two separate cases, though unless we wanted to completely
restructure the ending sequence here, I think this is the best option.

Though, I guess this is what the ending sequence restructuring would
look like if we took that route:
"""
	fence =3D dma_fence_get(&job->drm.s_fence->finished);
	xe_sched_job_push(job);

err_put_job:
	if (err)
		xe_sched_job_put(job);
exit:
	xe_oa_unlock_vma(q);
	return err ? ERR_PTR(err) : fence;
}
"""
So it seems restructuring the exit sequence would be less of a bad option t=
han
I had initially thought, but it's not a necessary change.

>  }
> =20
> @@ -684,65 +700,19 @@ static void xe_oa_free_configs(struct xe_oa_stream =
*stream)
>  	dma_fence_put(stream->last_fence);
>  }
> =20
> -static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc =
*lrc,
> -			     struct xe_bb *bb, const struct flex *flex, u32 count)
> -{
> -	u32 offset =3D xe_bo_ggtt_addr(lrc->bo);
> -
> -	do {
> -		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM | MI_SDI_GGTT |
> -				    MI_FORCE_WRITE_COMPLETION_CHECK |
> -				    MI_SDI_NUM_DW(1);
> -		bb->cs[bb->len++] =3D offset + flex->offset * sizeof(u32);
> -		bb->cs[bb->len++] =3D 0;
> -		bb->cs[bb->len++] =3D flex->value;
> -
> -	} while (flex++, --count);
> -}
> -
> -static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe=
_lrc *lrc,
> -				  const struct flex *flex, u32 count)
> -{
> -	struct dma_fence *fence;
> -	struct xe_bb *bb;
> -	int err;
> -
> -	bb =3D xe_bb_new(stream->gt, 4 * count, false);
> -	if (IS_ERR(bb)) {
> -		err =3D PTR_ERR(bb);
> -		goto exit;
> -	}
> -
> -	xe_oa_store_flex(stream, lrc, bb, flex, count);
> -
> -	fence =3D xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
> -	if (IS_ERR(fence)) {
> -		err =3D PTR_ERR(fence);
> -		goto free_bb;
> -	}
> -	xe_bb_free(bb, fence);
> -	dma_fence_put(fence);
> -
> -	return 0;
> -free_bb:
> -	xe_bb_free(bb, NULL);
> -exit:
> -	return err;
> -}
> -
> -static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa=
_reg *reg_lri)
> +static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa=
_reg *reg_lri, u32 count)
>  {
>  	struct dma_fence *fence;
>  	struct xe_bb *bb;
>  	int err;
> =20
> -	bb =3D xe_bb_new(stream->gt, 3, false);
> +	bb =3D xe_bb_new(stream->gt, 2 * count + 1, false);
>  	if (IS_ERR(bb)) {
>  		err =3D PTR_ERR(bb);
>  		goto exit;
>  	}
> =20
> -	write_cs_mi_lri(bb, reg_lri, 1);
> +	write_cs_mi_lri(bb, reg_lri, count);
> =20
>  	fence =3D xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
>  	if (IS_ERR(fence)) {
> @@ -762,71 +732,55 @@ static int xe_oa_load_with_lri(struct xe_oa_stream =
*stream, struct xe_oa_reg *re
>  static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool=
 enable)
>  {
>  	const struct xe_oa_format *format =3D stream->oa_buffer.format;
> -	struct xe_lrc *lrc =3D stream->exec_q->lrc[0];
> -	u32 regs_offset =3D xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol =3D __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_=
MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
> =20
> -	struct flex regs_context[] =3D {
> +	struct xe_oa_reg reg_lri[] =3D {
>  		{
>  			OACTXCONTROL(stream->hwe->mmio_base),
> -			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +		{
> +			OAR_OACONTROL,
> +			oacontrol,
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
> -			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
> +			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
> +				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0)
>  		},
>  	};
> -	struct xe_oa_reg reg_lri =3D { OAR_OACONTROL, oacontrol };
> -	int err;
> -
> -	/* Modify stream hwe context image with regs_context */
> -	err =3D xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
> -				     regs_context, ARRAY_SIZE(regs_context));
> -	if (err)
> -		return err;
> =20
> -	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
> =20
>  static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool=
 enable)
>  {
>  	const struct xe_oa_format *format =3D stream->oa_buffer.format;
> -	struct xe_lrc *lrc =3D stream->exec_q->lrc[0];
> -	u32 regs_offset =3D xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol =3D __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_=
MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
> -	struct flex regs_context[] =3D {
> +	struct xe_oa_reg reg_lri[] =3D {
>  		{
>  			OACTXCONTROL(stream->hwe->mmio_base),
> -			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +		{
> +			OAC_OACONTROL,
> +			oacontrol
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
> -			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
> +			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
> +				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
>  			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
>  		},
>  	};
> -	struct xe_oa_reg reg_lri =3D { OAC_OACONTROL, oacontrol };
> -	int err;
> =20
>  	/* Set ccs select to enable programming of OAC_OACONTROL */
>  	xe_mmio_write32(&stream->gt->mmio, __oa_regs(stream)->oa_ctrl,
>  			__oa_ccs_select(stream));
> =20
> -	/* Modify stream hwe context image with regs_context */
> -	err =3D xe_oa_modify_ctx_image(stream, stream->exec_q->lrc[0],
> -				     regs_context, ARRAY_SIZE(regs_context));
> -	if (err)
> -		return err;
> -
> -	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
> =20
>  static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool =
enable)
> @@ -2110,8 +2064,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev,=
 u64 data, struct drm_file *f
>  		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
>  			return -ENOENT;
> =20
> -		if (param.exec_q->width > 1)
> -			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lr=
c[0]\n");
> +		if (XE_IOCTL_DBG(oa->xe, param.exec_q->width > 1))
> +			return -EOPNOTSUPP;
>  	}
> =20
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index 3a75a08b6be9..c8ab37fa0d19 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -223,7 +223,10 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value, b=
ool stall_only, u32 *dw,
> =20
>  static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  {
> -	return job->q->vm ? BIT(8) : 0;
> +	if (job->q->vm && !job->ggtt)
> +		return BIT(8);

Non-blocking question:
I'm assuming that xe_oa_submit_bb isn't the only function that can submit
jobs for get_ppgtt_flag to decode, because otherwise job->ggtt would always
return true?
-Jonathan Cavitt

> +
> +	return 0;
>  }
> =20
>  static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe=
/xe_sched_job_types.h
> index f13f333f00be..d942b20a9f29 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -56,6 +56,8 @@ struct xe_sched_job {
>  	u32 migrate_flush_flags;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload.=
 */
>  	bool ring_ops_flush_tlb;
> +	/** @ggtt: mapped in ggtt. */
> +	bool ggtt;
>  	/** @ptrs: per instance pointers. */
>  	struct xe_job_ptrs ptrs[];
>  };
> --=20
> 2.34.1
>=20
>=20
