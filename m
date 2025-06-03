Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACFFC5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 17:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9840210E5F7;
	Tue,  3 Jun 2025 17:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFFub1zw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DAD10E65D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748972204; x=1780508204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=u8qlw9aMHjgLqW8hU6qKPJ3LYEAfK7I9j0nVoBBShNw=;
 b=fFFub1zwt0Dw0zTJ0mToNbowXp2ZL6JE/yJpOTDSO0tbA2Uu8a6av8QR
 3K0skM9xBzGlSMCXPshda5DyojTvm1IV8Pvc7IrjwDXIi+ue4GtPHb73/
 biG1zDyOvHibn30vtMTtmxdOlBC7iDtddGFov5EYp6ap78rEtx45ps9gh
 C9AuBHhWWzxJHYCdP3MiLgPSp8xCYm/9cEigKeGmemPTizBHt5XXZEOp5
 XcNNot1g2OpGNW20sbW0leAFFrP6LOGWRMXC4Gy3/IzuyVgGT21TdvvDp
 CEOlo0IGR/DzUj6Jb4fDZJkFjLxefsZ/wAhOPuKktzp2PUliUZn4yv+Vt w==;
X-CSE-ConnectionGUID: E4ndRUnqT8K20Qsok+bXUg==
X-CSE-MsgGUID: JK0zpse9S++HytFpTv7U1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51166787"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="51166787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:36:43 -0700
X-CSE-ConnectionGUID: kZIa5mXKSOemXiuyYDFK+g==
X-CSE-MsgGUID: /JdT4Jg4SOqnpDcnNkmmeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149814590"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 10:36:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 10:36:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 10:36:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 10:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyadvKPG+ELrUdKeLgbKPjbWhi99OPyWZpYRBuz3uyFp0UFug8af9SzrnArI7zH/kuL8uL/HK+dKmb6dqYL2lfX7r1zQcAOccXClQXYUAE5oJv1pguflyAEqIJxVPduoPN6oAV0A+mM+Z2jJmThE1tfg15Nn/IN1/gqZfQ8cZDi54Fm2F99uweukOhMzGzvpIhgVIE0LAnS18PNUzhoOMsHrCehTCn6FUv9OabpXzyBhb3XpMdkVUQMG/C/ehh8sRFTKJC2dkPPDUP2V/ayx8FToWHBBqLCtYExg3ClF3P64x8R5T6za6EEgcS94Vph1wS61i8oX1E9dSQ5wqWF/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8qlw9aMHjgLqW8hU6qKPJ3LYEAfK7I9j0nVoBBShNw=;
 b=R5prWJtQbQQrj1rx/h86FzY6/yFjTbGK0c27Z60JpKSV9TmB2doaG4S3XX19hXF3tSPjnTq0tPoNZThB2XrCVpaIy7iiirinuDqzltHD3r51JQ9C3sQdqU75Xge6/9cF72URBXerffwP5e2O3P45bBmdtrzncDsjIJ7UG5n7Tf41156bf1Cbta4biQPOMaVe43uqdPRuRmTkitlCwdWxNmLN1eEcP2IU69o25h9SzK6YO0q0gzq5GZyRGJ/z18iWgVfpkuS+gmyXqoKeuq8SNUazjgr20IIbKkJuf+xMTqTEIj4Aej+G7yumSgMpvbK5HBz0HMDGCiJQ7fZZ3pRcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 17:36:11 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 17:36:10 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb1Bi2Rz7m/s3aGk2VJ2AWxoSwWrPxs8qA
Date: Tue, 3 Jun 2025 17:36:10 +0000
Message-ID: <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
In-Reply-To: <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS4PPF2A0C3F85C:EE_
x-ms-office365-filtering-correlation-id: 23580a83-8b6b-448a-46cb-08dda2c520e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0xKZUlabG84Wld4SnRtMmhRUVA4RWowOUhGaHc2NmlWalJ1Mk81bVNOeW04?=
 =?utf-8?B?Nnl3NmNDVkxENGpjK3p4M2M0WU9KMWRuRXY1OWk5aGlDVHE3eU1XWjAwem1L?=
 =?utf-8?B?dHhWRGwvTjV0MVU3b2ZJZE8zeVBOOS94MlRvTDBJR2ZQTjNvd3dsZlI0dkdJ?=
 =?utf-8?B?YlpHS0xucDVpZ3IrZWk2TVhEUnFXZjBaVUFIN1piSHE2VUdGblptUlp2UmVY?=
 =?utf-8?B?Q0ZzaHVUNUVRRXkyMko1OHhVNU5EOGF3RkxnaGZSbWpGNGs4RnN1UEpmbHZX?=
 =?utf-8?B?bTRCa2FLcThVbkJkU3N0elQxWmtudXpvWnJhbWI0VW1lTm02OW16MzcvS1Za?=
 =?utf-8?B?NmZkeUtmVkVzdmRGS25MZEFVSi9LNXc3Qk1La3A1aFRWMU5hZWMvMFNDam9u?=
 =?utf-8?B?b2RaZTFVd2RSOXVCY3V6WkcxeGJYbmpzc1dFalYvU1o4cHAxdTNXQlo5STNB?=
 =?utf-8?B?SnUxRDRTV2tGQUF3RHpOZVdCMk93endKa09xZFE4bnJsYnp3WUYrTzE1bklp?=
 =?utf-8?B?WWwyYS9OeDdmT1ZjUVI0WHZkY204WmFCeitZa0I2UmNVQWk4Zm5zdXNjT0gv?=
 =?utf-8?B?K1BheGhtUzhMMDBGMFg3dFUvSE5wazFsbktlbkJOUm95NXRzRkE1UllpZDZh?=
 =?utf-8?B?VWdqK0dmNzlxdXB0cmY2RkVQSVYrNmIrNGFINm8waG4rdlphekFyZktCd1Fu?=
 =?utf-8?B?S0s5NFZNeDBsWXBaMnk5elM4b0hYMVFYaW9jaGl6Wmxwc2dxenpoLzlwZzl3?=
 =?utf-8?B?b0o5b0c4N1pydUFVY2pEK0FRa21ESXVXdEVTeE9oaXVNOXVxRS9sUzVxQ3A2?=
 =?utf-8?B?eFoyVG16V1Jya2tSRVg0T1c3bkdFZUlWNnFIWTROeUEvS0RsaTR5ZjBtYVox?=
 =?utf-8?B?eVhpMk1uaGRkOHk2dUpMbXRTY3BWRGM2YWs0R3h3UExscS9GR00vbmlOY01h?=
 =?utf-8?B?T1liSnh5dmluK1JVaXpMa010RWd1REFEVlM0ZVJlMnNQRUdNRlpjZ2FjMkNY?=
 =?utf-8?B?YzE3YUdIRDBCdlZ4ZFNwT0JkL0o5Y1A4dXRCcXI1ekorMWkwd1F6aWdEYkhz?=
 =?utf-8?B?bitlbkliWGdZbk16b00rNkEwTGhuZnBGS2U5YnljMkYwRHhkNW9LNjJ5UE1p?=
 =?utf-8?B?Y09hdjh1SEp5cjhvSzl3dmo3M0xaYmVXSTNyeVJUdGZhRllIRGc4NmczSWN0?=
 =?utf-8?B?U1Q5cGVYdWtENDB2ZFZpdmpmOGpCZ1p6a0c2UEV6MlRCcCtLSnlHOXcvSmV5?=
 =?utf-8?B?NlhhL3NuUjl4Y1d6U3J0KzBmUmN0Z0lDeWhlM0Z0WVpFYzFnTzNBcG9rd1gx?=
 =?utf-8?B?SnJpOXNTVWhCb1EyVXVieGp5ZWU4N0cxWGRIbHBIM3FNOHQvZWhPbC91M2NV?=
 =?utf-8?B?eVhwVHhVRkt5bEhXWjIyUkRPZmNXem14dlVmSzY5dk9Iamplb1JlcmFPaDNs?=
 =?utf-8?B?VW5HNXkwRDdrQ2pBSEw3bkZiRjc0SnZrQ3Y2SUtaREpCV3JUNjhnZXk1QW0w?=
 =?utf-8?B?UGZJbEZ0WWNLSVYwbEptcDdXTFQ3K3FUODFxTW4wOEtSek00OUllSWMyS2cz?=
 =?utf-8?B?WDNhaGFuMlhxaHFyUWNsZzJzQ1pTMEZ1eXkvdmdncW5FazJlYWx4SnY5c3l1?=
 =?utf-8?B?aWswbVFlcTUvbHMzbzVncUtnVnBjVG56aEJhaklFWTM0NU1OdnQxYXNHbGxU?=
 =?utf-8?B?eitFaTJyWEh4TEtkMUl4UzBpVkFOSGVFamMwNnZvcU9EaTcwaDF2Y29UQzFM?=
 =?utf-8?B?YUxlOVlYbVc5VkU0TVRjQWplYXB2N05TZ0RwRUtDVEx6QjBuM1lFQ25qclFS?=
 =?utf-8?B?VENHZnkwdi9sL3hic1V1VThXVUluRmR0ajZlN1AwVXdPQkx2NEZHaHhtdTJk?=
 =?utf-8?B?VHZscUVjM2RZVEFxRzNyNHc0VVNLalBzMVFtTnFpQVJReTRhS25rREdnZ2V1?=
 =?utf-8?B?dUpMeDhjUFBnYXBhZjVDWHZHTFh6QXloNGhEeitlN2J1SDhackRMOVdNMDdZ?=
 =?utf-8?Q?p15DWpJqlKpl0FhzIdC5CTf8DONpz8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzdaRDc4bERCa3NybnFSekZOSDFub3lQMjM0RkdLUURSd2FIYnFrbkp5dmo4?=
 =?utf-8?B?d1NBbkFmRDllWVh1T3VkYW8vZWVMdUljK1FscnlVMUtubWpuMUlDc0xVVGl5?=
 =?utf-8?B?MzEzMnNHU1J3VmtqdUFMTFhrWHNSTGl0YXhvanUzc2NBeXVDMy9QL09ZOUl6?=
 =?utf-8?B?NWJCOWYwYjk4QjNaWkZCb1kwT1ROWkpaREh4am1EdGJCMTBVaWFRSnFKRDYx?=
 =?utf-8?B?UVNMUnRUMXYzNEl3aXJtTWlpVytIdWtiOEk1UER0NGVTZ2VtZ3EvQmdTbmsx?=
 =?utf-8?B?cVJCWWZHTE5TSkVQOExrbnJ1M21zOXJ5dS9GaFM1aXBjYzJlYVV4L3hBTWpW?=
 =?utf-8?B?Tlp6WUtZSW41VWlRV0ptT2FQSVBCenhjYnA3K2YrMjBnSU41MHJzYmR2WTZR?=
 =?utf-8?B?N0t4NEdWQWpHMlFFNjRlU0szM1FqM0Yvalg3S3Z5VmswTGhZTXZ5WXhuS2hu?=
 =?utf-8?B?dkxNRXVITUFVcjNXSitRbXhWbXYwVmRGS1VhNWlreXVoRWlBbkVRUDk3eDBO?=
 =?utf-8?B?eS9nakNBbkhudmZ2UFNUMlREQmZtdnNrdktGSngyQitvanE5SWpmTmlXNDV3?=
 =?utf-8?B?UzNLZnphTDd6QnVDaG5qaFdrTlVHb3RzTjJDVk9VbVlWRUF6d3djWWFTN1ZQ?=
 =?utf-8?B?VjA2M0FaQlJwV3V1c3hrL2tLUnZVQnBoTTN0Nko4TlN1K29weU9rN0JDUk5X?=
 =?utf-8?B?RFN3RHA3T2FaRHJvNy9TcmlnYjlDc2xob0d6blpiNnJGVDR5N1dTeGplTDUy?=
 =?utf-8?B?RnhDQmQxbTA3TzMxSUdSckJZSno1bHp4bzM1ejNocGVlNTNGbThQdHhnMGZS?=
 =?utf-8?B?RWJCSTlZL0hmRU5hdUsxSDk4K3hUUUxGNkh3K1NTTnJadlhqZEFkZzFKVmgr?=
 =?utf-8?B?SWVGSVArUG41b3NBbTByVnpMYVhjd2JrdkFSTzROb2Q4N1pocGI1eXV3K1c5?=
 =?utf-8?B?WGJPb01QTEdETnluNStFZ2hCVG9XRTk3cnhoQk1OaXkrb2VvcldPTG55Zi85?=
 =?utf-8?B?cGFDRHFtcU5YRnlhVVd0TlZxNTFndmswSlJWQ0E0dVNRVkRZckk5RjFwT1Mz?=
 =?utf-8?B?bGw3RWFOQ3d2R2cybU5YbXA2MS9hZmtQUUxsSnU3YVI2VVdqMlVnbnQ2SU5S?=
 =?utf-8?B?MWZubHd3Tm9aN2lhLzFXemE3clFQSGdTNi9uakZmNzVtQmpYRDNDWXo5enRC?=
 =?utf-8?B?Y05PK1V0U1BXTVRpT21VWThTRlRjSkV2eE82UHMwcC9ENWlGU09zQ2FCYU5l?=
 =?utf-8?B?SW92WHlwSWVoeUZlSDZTMnhVSi9JWFYrdXFacTV4SkRiUnVCeEtoblBTeDd2?=
 =?utf-8?B?c2lEem91SHhBRHVGZDFxMzVOVi94NDZ5NWpLUURMUmFNRlg2ZGZSTi9sQkox?=
 =?utf-8?B?S1hUaHNOMVZRdEpnSkt6bGtyM0xja1JJaXlLV1k5RlFBb1BmY0NJRGJ5UmVD?=
 =?utf-8?B?ZjZmNXFBTU5KbXJrQm9tc2d1d1NDVThnQU8xWXFIRy9RRXdSTlM0VEVQOXR2?=
 =?utf-8?B?Z0gxdktkcVdyZHF5OTZtcmpjSjM1RmNrY2M4T0RaaUg5eCsxVk5FZVp1L2ZX?=
 =?utf-8?B?c3YwQjZxNGRGalBQMTRxdnVJM0VwZkFDY2xqclAzUjBUYUMremFDRWpzaUlQ?=
 =?utf-8?B?Y1NKZVhWeEdRYVYyRTluNnc3Z0ZlRHVnemhTNHFGUkV4bEk2bVN5MXNITGJj?=
 =?utf-8?B?ZFpTYmdkYzBpdFhDbEtheDBzYTJydXpXRlNabitnc1JzY0VPQVR0T2JXdVlz?=
 =?utf-8?B?MjhvOGgzVnZLR1JzNUxYTDlnK0libnZKTGw2eUhySEMrSmZpeEk5emlUNWx4?=
 =?utf-8?B?U0pPSU9wOXFTVGJZRUFJVE1iNHhjVWhrOEhGRTdzSW1ycEhFUXQzbUVyUVcw?=
 =?utf-8?B?bmJrV01CYURpMWpJYzBqZDZTSVBKSkNGbndhN1V4MWt6WnhVMUFJenFjMXVn?=
 =?utf-8?B?YjliVHB5RTU0ckJyZ3ROK29Fb3ZWdmhEZzAxaG55SUNyWWozQ0lwMXE1Y3NI?=
 =?utf-8?B?ajU0dWk0RGlrR0lRRmdVSmU5ZWd0RFZPRGVrYUZOcWVUTXZ3NTNaU2hsaytn?=
 =?utf-8?B?QUhJbGxEZmw1aVVTUlNJWlZpOURBTHFpOXMxekp2NmZTS25zWTd3Q3FUVi9R?=
 =?utf-8?B?cEc0enRiZUs5c0N2TE1PQXlEK0pnUXhLYWxrVFVGdzA2SlJzdHhiOElRVVE5?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39A28A074C0D6E409D036F358183B6A1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23580a83-8b6b-448a-46cb-08dda2c520e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 17:36:10.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxFj8XGBKmP964V+KumQB15dzWa2bx9U0sdWzRPhPgqY0aLQ9wu/1Y0KRmm2u+7VeerUvILcixDjskQNJUfQdRK96HnpJHGp09n9U14DQR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDE2OjQ0IC0wNzAwLCBWaW5heSBCZWxnYXVta2FyIHdyb3Rl
Ogo+IFNldCBHVCBtaW4gZnJlcXVlbmN5IHRvIDEyMDBNaHogb25jZSBkcml2ZXIgbG9hZCBpcwo+
IGNvbXBsZXRlLgo+IAo+IHYyOiBSZXZpZXcgY29tbWVudHMgKFJvZHJpZ28pCj4gdjM6IEFwcGx5
IFdhIGVhcmxpZXIgc28gdXNlcl9yZXFfbWluIGlzIG5vdCBjbG9iYmVyZWQuCj4gCj4gQ2M6IE1h
dHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4gQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBCZWxnYXVta2Fy
IDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndWNfcGMuY8KgwqDCoMKgIHwgNSArKysrKwo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3dhX29vYi5ydWxlcyB8IDEgKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiBpbmRleCAxOGM2MjM5OTIwMzUuLmNiMDU2MzQ5
NGZjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmMKPiBAQCAtNTEsNiArNTEsNyBAQAo+IMKg
Cj4gwqAjZGVmaW5lIExOTF9NRVJUX0ZSRVFfQ0FQwqDCoMKgwqDCoMKgODAwCj4gwqAjZGVmaW5l
IEJNR19NRVJUX0ZSRVFfQ0FQwqDCoMKgwqDCoMKgMjEzMwo+ICsjZGVmaW5lIEJNR19NSU5fRlJF
UcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxMjAwCj4gwqAKPiDCoCNkZWZpbmUgU0xQQ19SRVNFVF9U
SU1FT1VUX01TIDUgLyogcm91Z2hseSA1bXMsIGJ1dCBubyBuZWVkIGZvcgo+IHByZWNpc2lvbiAq
Lwo+IMKgI2RlZmluZSBTTFBDX1JFU0VUX0VYVEVOREVEX1RJTUVPVVRfTVMgMTAwMCAvKiBUbyBi
ZSB1c2VkIG9ubHkgYXQKPiBwY19zdGFydCAqLwo+IEBAIC04NDMsNiArODQ0LDkgQEAgc3RhdGlj
IGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0IHhlX2d1Y19wYwo+ICpwYykKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKHBjX2dldF9taW5fZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBwY19zZXRfbWluX2ZyZXEocGMsIHBj
LT5ycDBfZnJlcSk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZiAoWEVfV0EocGNfdG9fZ3QocGMp
LCAxNDAyMjA4NTg5MCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHBj
X3NldF9taW5fZnJlcShwYywgbWF4KEJNR19NSU5fRlJFUSwKPiBwY19nZXRfbWluX2ZyZXEocGMp
KSk7CgpEbyB3ZSB3YW50IHRoaXMgYWJvdmUgdGhlIGdldF9taW5fZnJlcSgpIGNhbGwgYWJvdmU/
IFNlZW1zIGxpa2UgdGhhdAp3b3VsZCBmdXJ0aGVyIGxpbWl0IHdoaWNoIGlzIHdoYXQgd2UnZCB3
YW50IGluIHRoYXQgY2FzZSByaWdodD8KClRoYW5rcywKU3R1YXJ0Cgo+ICsKPiDCoG91dDoKPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoH0KPiBAQCAtODc5LDYgKzg4Myw3IEBAIHN0
YXRpYyBpbnQgcGNfc2V0X21lcnRfZnJlcV9jYXAoc3RydWN0IHhlX2d1Y19wYwo+ICpwYykKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19wY19nZXRfbWluX2Zy
ZXEocGMsICZwYy0KPiA+c3Rhc2hlZF9taW5fZnJlcSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoIXJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGNfZ2V0X21heF9mcmVxKHBjLCAmcGMtCj4gPnN0
YXNoZWRfbWF4X2ZyZXEpOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIHJldDsKPiDCoAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ff
b29iLnJ1bGVzCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Ffb29iLnJ1bGVzCj4gaW5kZXgg
OWVmYzVhY2NkNDNkLi43NWZiZGFiNjhkNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3dhX29vYi5ydWxlcwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2Iu
cnVsZXMKPiBAQCAtNTksMyArNTksNCBAQCBub19tZWRpYV9sM8KgwqDCoE1FRElBX1ZFUlNJT04o
MzAwMCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05fUkFO
R0UoMTMwMSwgMzAwMCkKPiDCoDE2MDI2NTA4NzA4wqDCoMKgwqBHUkFQSElDU19WRVJTSU9OX1JB
TkdFKDEyMDAsIDMwMDEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNRURJQV9W
RVJTSU9OX1JBTkdFKDEzMDAsIDMwMDApCj4gKzE0MDIyMDg1ODkwwqDCoMKgwqBHUkFQSElDU19W
RVJTSU9OKDIwMDEpCgo=
