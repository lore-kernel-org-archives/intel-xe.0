Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2980CC83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD22E10E4BE;
	Mon, 14 Jul 2025 15:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9VAWN2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7300810E4BE
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752507157; x=1784043157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pZt6ZtWibmz1oA5jfMr+n3gIMygbaeSS5ONTjJXHxW8=;
 b=O9VAWN2iWYu+JYPnp9GSX5VPCM+ENueT80GrirM/PQ3oMb/lqQJ1tzFA
 pTrFCp8bvA2L1MYYn94tCmKyf6L6XDFDeJUXE3LMjcfDV29m0kPuS6Q2B
 iS0rdeTNMut8XgQY3AQkDOd/7WRIt5QEOYKyvfg0HQp0gok6GKLRI75Gl
 9ItM65843Xq0CxiCG2hbvKmc+VaUimPUGEsBViv2lus/ExKVmtBWKiMQR
 vd5WXbMAK519ZsvFedmiCGKJBDwGR6a6fI0sI/osa7Bt5xBNBNiv57QLg
 O46tcFkq0k6XJ1pEupV0eUdJ1GETDRj1p/5w3k4VdnRcIW78lgFX/2gaL g==;
X-CSE-ConnectionGUID: pan7fHKNSAiRVqGu1fSFmw==
X-CSE-MsgGUID: 5vtSKh8cTdyGmVuyWdrdDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77238473"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="77238473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:32:04 -0700
X-CSE-ConnectionGUID: uLzGI+uFR966xpzHq3aqXA==
X-CSE-MsgGUID: At9wYuIRQuqEuie1N4hRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="157305287"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:31:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:31:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 08:31:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=attUBmomVbOqiH8s8GVZLSyVPu1MNF844WSUG6SGgwscr75PNxneqspQqxmQTlUpih68GUZ2u08TzBiofR8JnMnl/mA8m2IDjsxdgjlUhsPhDt0UcGd77VNa6EgSnIPlf1kH/Mwvhbr2iRCuSAI4sDu2mTgwDBVaLgImwL4SsC1kepjBTYRxXpz8VW2PFb7ajV+c/Zpn4ohTVJ1/iafMLInQZvqfn6cnILGXfTCjlGq+yIRMkvQar2rIV+BHqoRgaNb6ldU1r7wxBcNxQwQciXLh0KQLvVDVRcHhEd71RpFIw7R6Sc3A5+WiTHWFC1tgWeO//sL36F2FJNpPQ8Ts1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZt6ZtWibmz1oA5jfMr+n3gIMygbaeSS5ONTjJXHxW8=;
 b=H115WU89FC7IB3L5Ewdw4RFaQrnyCGDCWVxzALWWo9UneBzb3my1C4MkIzZElEZyr5ocUjQyAd/3EknIbgm4FWFvV3STuFaeTwNVOxc7zBPdZSVwHWKm3/ehb6yKFKkB9X4vZIMxILgyi2J9xqeIwGexQHaP1flpk96h9CV6y4sHBzj0+mTUPl3fT63SZ2htCQp3qLrf68pxM5B3/m3qDJUJxMYXMQaL3RazMiSk9tRJAS9oYvolJc0sjc7DruTJmDrKQMA05dnIa52NSMDXR9XvD3czXuW51Ejs2rmV+BwuVlkSH8NDQ18+MkncAy95Kcr1sstIOnvRpDiNlZ1Jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 15:30:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:30:54 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Thread-Topic: [PATCH v1] drm/xe: Don't expose device attributes for VFs
Thread-Index: AQHb8pcyww5EjVawgEu0c6lzUOsr/7QtZX8AgABdbgCABAB2gA==
Date: Mon, 14 Jul 2025 15:30:54 +0000
Message-ID: <555ca90e14209445dd5ced8f95ce729fe9b2fda4.camel@intel.com>
References: <20250711190808.2743402-1-raag.jadav@intel.com>
 <f81ace5191cc4e7ca1023d69ff88253afaeb6638.camel@intel.com>
 <aHHHTOdaSAUdNGkq@black.fi.intel.com>
In-Reply-To: <aHHHTOdaSAUdNGkq@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB4969:EE_
x-ms-office365-filtering-correlation-id: 74c27ce6-56e1-4b73-bf80-08ddc2eb6c29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTVORjlTOEtDL1RGWWVQbEtUUlZrMHY3UlFNSVFaajgzODh1T056bGV2cG5n?=
 =?utf-8?B?dnVVek05THJvMjNDT0dkUFJwNWg2UExRNFpwdkFmSzFQNkJtSVJMV0gyRit1?=
 =?utf-8?B?M1hSR3E0dFgwa3E1dFZ1OFdXWVNOWWNjalREQUE4MUdqcDl0WnlsaEZwaDNU?=
 =?utf-8?B?eWxBb2pzZWlrU1VkRFp5R2xSN3N3UENWcndRM1RTbnp1a1ZkcEVOSHpVOEF5?=
 =?utf-8?B?SkFkcWdzR3VLOUt5ZXVVSEJuamtLOE0yNkxZTTVxOExzSDNyN0ZDbjRkQTFS?=
 =?utf-8?B?TU83TnF1NDF0NzFrV0pJT25jM1FaSkRubmJTdVJGaldrWW1wYWs2SHFnV2hi?=
 =?utf-8?B?Y0FHSzhla1I5SGtzU05HYmZueUF0N3p4VHphdHJ5RDBBSXVsME9kNVd4Z1RF?=
 =?utf-8?B?S1pGbDFxamNNVWlUUExWbkNEemNzU3NwbzZmSDVKb0xzUGVOeVhlODZ4RGhF?=
 =?utf-8?B?QmdJUkpXTmFIUnRtc3pEMzRVcHZDSXFiWjdreVE0UExJNEJtWjJ2dm1jVWdU?=
 =?utf-8?B?TG0zeUVkM1JOcW9lTkZvWUdnRWhta3JjWUljUkZocThUVmd4Y2cySmY3MCt5?=
 =?utf-8?B?UkI3elNkYkxjUWpYVnNQMVJscC80NmtMMEZoMTVEYjYzODFCdWxOR0pCWXZm?=
 =?utf-8?B?Ymh0QlZqT3VZQlAwZ0pkWFFjMWdCMXJNSFFnMVRkV0wyMDJLdWthYWxmSHNX?=
 =?utf-8?B?UzhscjgyY0hIV3ZRMk9XM3cwcW9DWGFsUHlNZm1MWHEyZmpOV3g2QnN5SlZ5?=
 =?utf-8?B?aWJ1TXZtSlNBb3k5anBhNzRUNThldWNHbDcvS3B1cTFxZzI4dDZYWWJqRTRq?=
 =?utf-8?B?clpPMEdlK01qQWRvNEZlQkpkMkN0amxLNlhvM0R0cS9HYzRkN0JrSTA0bTBs?=
 =?utf-8?B?V3gyM1JsZGNlalJxakE3bDhMbjgzWHJ5cGxWTFZUVzdlaGdCK21pY1lzVytF?=
 =?utf-8?B?cVI5VmpYQmtHbnJzalVPbXRGcUVWS1NwYVAzSFl1VEJicG9tWlkvWk1aeisr?=
 =?utf-8?B?MFdhMk9kUVA3bEV4VWZqWTU0OFNuajE0OFZMdS90a0ttMXN1MUwvWjdLRWFo?=
 =?utf-8?B?RzRCYTdnZHRkZnZpUTNGcjF0VU13cDFYV0pYSnlTSjE2eWUwa0t3WitoYitx?=
 =?utf-8?B?K0dTNk9JODV6RHlwbFlIV2tsRStlcFEzcDhjRzBUWExGbFU3V1grcW1lVlc4?=
 =?utf-8?B?eHJBLysrVE16bEJCaGNBYkpJc3FCRS9FMERRWk0xU00wT3FzOFE4Rm1rOVIx?=
 =?utf-8?B?M3g3aFVLdDZySUtDTlNaQTZaWE1JczhhRGJMNkxjMHAvYVNhb3h0RHV1NFhF?=
 =?utf-8?B?bHZPWS9VRWNKTGdKMm5Va2I4bGxtbTd6aS85MWp1ZXkrZDRBMDJqeUxVaDVi?=
 =?utf-8?B?STFyNFJvYmtVRlNYTkNYeGx3dkE0WTFLM0RGOU1jeDU2MmZlcDJGZ1BESEtO?=
 =?utf-8?B?N0Zkb3hsZWFxQ0FNU09KdWk2K2d0bFNBQU5yMXNURVJ0azhtT0NnYlpzV2xT?=
 =?utf-8?B?UmY3bEF5aXJEb2RLbVhsODBzSHFQdWhXRVA0ZUMxSGE5ZGdxY2pONi9rekhN?=
 =?utf-8?B?QWxrSGR1dHVtMU9od2EwZmdDOXlsTGt5VEtuVTFsVGJjOHNJOExhQ2hHL3di?=
 =?utf-8?B?OVJqNzgvb1pQR0prdW9DelRQVFVKcTYrQThER2dmdnpjKzVoL29JeEJlOFNl?=
 =?utf-8?B?UHBqMEN2Wnh0RFJtWDlWc01tUWVmcEorNHE4d0VFZ3RGMm1qUkkremQvRSto?=
 =?utf-8?B?TW1RRGVCaVYwdm9qU2lRdnFxSDYrdTBzMmxhTmNOUnBVTWhTWkJONXMzYm5B?=
 =?utf-8?B?Y0xtUXlzS2JMR0Z3OHhVNnVHTENoNGVnRk5mM2lKdldXZDB5NkI0WStIOWRt?=
 =?utf-8?B?WThWbWFhcnFCVmVhUTIvOHpsWExrQWRuMTlOVGRIWm9uRUhhTDR1OHVudHQz?=
 =?utf-8?B?b25Zd0VNczNQN1FwSkVsc1pGRi9vQXFkcDdwUFNtSHoveHJMbXIrSVBrOVZN?=
 =?utf-8?B?clowVTZ1dzhnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVY1QWJuWngxUGs3RHNYTENzQTVObzlwREQ1aEh1YVRvSmY1cWVUY2FhTmJh?=
 =?utf-8?B?UlZqcUNsY0RxODdIS0dHbThOWFdlZHlGRitpKzEyMmdVT1lYVkIydFV3L3R6?=
 =?utf-8?B?a2k1MUx0VHM2YllUOVR4RHQyUTFBWTltd05iM29Ga2RRVTluLzBRbGpoV2t0?=
 =?utf-8?B?SEhkVnFIbGdLT3AwMFlBOFBzKy9xYndQZ0tZVTlTQjlSN1ZjSU0xWktYUDQ4?=
 =?utf-8?B?Snh6cEFEWTNyZi9wOXF0QjYwcHgxYUk5Rm40enM4ZEhOcHBSdEhrbGtEZFVi?=
 =?utf-8?B?bkNJbWFXN1FYQjRyUGNla1gyUjVTYzd6MXprQnBIWEFrcXFvVnNWd3o1WEdN?=
 =?utf-8?B?RVg4L09Uc3ZwMmVqY0xpTEYrT3VDR0xiRHA5L1BqMUlqV08rdlMyaG9sNkM2?=
 =?utf-8?B?c3hzaUV3NlVvdmUvSXQ5WUg1b1g1eU1ZYmRNVU5aS2c5YW5nRy85cnVzM0hr?=
 =?utf-8?B?OWVBY2JXQ0pDSXNldFRLTEV4NUdsSU51eEtMNUVjOXJWaWMyVFUwYmRva2I0?=
 =?utf-8?B?ZTY4YjlKM2F1VGtVZUhTZXBBTk5GeWMrSmpNK2VCc1JDQjVWWmh3d29MSXpN?=
 =?utf-8?B?dnQxVkgwMk53TjRZM3NFeEQxUVhhTzFBcFZuOHFkNnpSd0cwQ0dNaElkc0VL?=
 =?utf-8?B?Z0JoN3pvVUZneGgxOGUySlZENi9LM3d5NHk1SUxYa21KeklEVERGbTFGWEVq?=
 =?utf-8?B?dGtPMERCTld0TE5WT1Zad0dWL1Jta3RDUW9uK1ExdzZPTGJSSTlGWG5QL1I1?=
 =?utf-8?B?c2Myc0YrTms3bzdyOE0wdEpFZkR3eE1jNzNRTC9JWkY2OGllVmVtdEZYODB2?=
 =?utf-8?B?STI4QVBjdXg0Y0dSYjZoSkRvYmlJdG9lK3FGSXJTSWNkeDVoanZ4RGRIYSto?=
 =?utf-8?B?azJySE1vRWw0Sm12b2kyOXhtQTlRK296TnFIM3llRi81elVNOXpXWVp0dnpv?=
 =?utf-8?B?c3BZN050cXZ4NWRRcFM4Mzl6TGF6UFpEVDhnS3hQVTVZWTZpNU5XMlp6WXpF?=
 =?utf-8?B?WXVwNmlzWkdUcFoxSldFT1JxdVcxK1ZUd29ublViSmg5NXVtbWN1dHdtZmFt?=
 =?utf-8?B?Nm05eFhmRmZsZ1U1SHhaUlV3MHBQQ3Z6dGJGUHNDYzRHb1Vxb21BblM2d3dn?=
 =?utf-8?B?enZOTE5lS0tQT2RkUU4xa3pWcmFmZkN0TXBnb2NXMHZSR3JFOEFGRHQ2SjNj?=
 =?utf-8?B?c3VUY2lYKytYa3liZzVvei95QnlaZ0NVSW93K25nUlczcCtPL2pTRmNpNEQ1?=
 =?utf-8?B?NENnR08rdkVablZxalBBYU9DaFozTEhjaWJPMkdHVDIyS1k4S1JCRTU5MktD?=
 =?utf-8?B?N29wS1diMUZwcDF3UmFLdjJLZHJEMU9BM2kzalQwODByYVU5TlpCLzJHcG9P?=
 =?utf-8?B?YTVJdTFkWk54Y0E1Yjk0VXoyQUxUS2dUV1BIZmhXeWpEYVkzU2lOdmZIWkFp?=
 =?utf-8?B?RWZpbU9sc3hqT3BKUVFXK2d6bEI5aGZxVVdYVUl2clB5VmdETWYxc3k5MjRJ?=
 =?utf-8?B?V3FXalZzbmx3M3dWa3JESGVJV05PR3JlcWR6SDRYQWdPSjZSTXBKQVk2WTM1?=
 =?utf-8?B?SU0yNHdqQXJ5bis2ZTgyOEtuWWRYTExYOTludEMxWCtvNDc5OVh3VmJiOWdp?=
 =?utf-8?B?V2p2cWdOV3RIUFI0VDZubm14Yk16VHdFVlNoc1I1ZTFwaERVaE90ZXFydDgr?=
 =?utf-8?B?MGx1NTlrS2NwZVB5bExTdlU5WFlkTVlsQnY2eXJJUTdxTUxqU0tSVVZFZ2pJ?=
 =?utf-8?B?NHlVbEM3WmozZ1g5WVdaK3NNai9SaXJka1V3NERUS2lvcHVmUlovY1JqTm9h?=
 =?utf-8?B?Sk1mclMvRm5aUlRid1NHb1NZU3QrZ0d6dm1UbVpjZWVUK2RhL1N3NDBYamlX?=
 =?utf-8?B?cDczaXJsRFV2Vkc3V1ErcHRmU3VObDJnMm5JQXlXMHM2S1I2SnpueXNLWkpQ?=
 =?utf-8?B?N0UwR3h5QTN4ckRLNjZ6RCtWMEYwNVhVOGE0c0NKV1hUK24wVVdtaUZBMlhx?=
 =?utf-8?B?WHJmN1RuR2NNa0FvVHd5WU5uK0x5OUVBZks3VVhSaU5WQlg0bG1PV2M1YTZa?=
 =?utf-8?B?V3BrY2pHeDJwelpkeUpmd1ZLdGpDcGtYU0VLRTB2ZVhWT1o4SHgvLzB1RHlu?=
 =?utf-8?B?MFZDVGtaQ1JlMjhYdnRZQ3FLUXpXdEFzU0hIdEZ4U0hQTWZ3UmpybG42N1pJ?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41492DC95EC1FD448929E67E6BC7A270@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c27ce6-56e1-4b73-bf80-08ddc2eb6c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 15:30:54.4011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhEzqAv1kLUpcfQjwaiOCsQCRnDI6LRtU/qUWX2OClQx2/y2lP2CUbg6ugAG36E2DWR8p7gMOGINGUSVVS4+mvygisd9PR5KADjXNcY+Frk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

T24gU2F0LCAyMDI1LTA3LTEyIGF0IDA1OjI0ICswMzAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBTYXQsIEp1bCAxMiwgMjAyNSBhdCAwMjoxOTo1MEFNICswNTMwLCBTdW1tZXJzLCBTdHVhcnQg
d3JvdGU6DQo+ID4gT24gU2F0LCAyMDI1LTA3LTEyIGF0IDAwOjM4ICswNTMwLCBSYWFnIEphZGF2
IHdyb3RlOg0KPiA+ID4gQ29tbWl0IGE3Zjg3ZGVhYzIyOSAoImRybS94ZTogRGVmYXVsdCBhdXRv
X2xpbmtfZG93bmdyYWRlIHN0YXR1cw0KPiA+ID4gdG8NCj4gPiA+IGZhbHNlIikNCj4gPiA+IHRy
aWVkIHRvIGZpeCB0aGUgc2lkZSBlZmZlY3Qgb2YgeGVfcGNvZGVfcmVhZCgpIHJldHVybmluZw0K
PiA+ID4gc3VjY2Vzc2Z1bGx5DQo+ID4gPiB3aXRob3V0IHZhbGlkIGRhdGEtb3V0IHZhbHVlIHdo
ZW4geGUtPmluZm8uc2tpcF9wY29kZSBpcyBzZXQuDQo+ID4gPiBTaW5jZQ0KPiA+ID4gdGhpcw0K
PiA+ID4gaXMgdHJ1ZSBmb3IgSVNfU1JJT1ZfVkYoKSBjYXNlcywgYSBtdWNoIHJvYnVzdCBmaXgg
d291bGQgYmUgdG8NCj4gPiA+IG5vdA0KPiA+ID4gZXhwb3NlDQo+ID4gPiBkZXZpY2UgYXR0cmli
dXRlcyBmb3IgVkZzLCB3aGljaCBjb3ZlcnMgd2lkZXIgcGNvZGUgbWFpbGJveA0KPiA+ID4gdXNl
cnMuDQo+ID4gDQo+ID4gSSdtIG5vdCBmdWxseSB1bmRlcnN0YW5kaW5nIHlvdXIgcmVhc29uaW5n
IGhlcmUuIFdoeSBjYW4ndCB3ZSBqdXN0DQo+ID4gdXNlDQo+ID4gYSBjaGVjayBhZ2FpbnN0IHNr
aXBfcGNvZGUgaW4gdGhhdCBjYXNlPyBWRiBtaWdodCBiZSB0aGUgbWFpbiB1c2VyDQo+ID4gdGhl
cmUsIGJ1dCBpdCBpc24ndCBpbmNvbmNlaXZhYmxlIHRoYXQgd2Ugd2lsbCB1c2UgdGhhdCBpbiBv
dGhlcg0KPiA+IHNjZW5hcmlvcyB0b28gYW5kIHRoZW4gaGl0IGEgc2ltaWxhciBwcm9ibGVtIG9m
IGFjY2Vzc2luZyBhbg0KPiA+IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUuDQo+IA0KPiBUaGlzIGFs
c28gY292ZXJzIG5vbi1tYWlsYm94IGF0dHJpYnV0ZXMgd2hpY2ggd291bGQgYmUgdW51c2FibGUg
Zm9yDQo+IFZGcy4NCj4gU28gd2UgY2FuIGVpdGhlciBmaXggdGhlIGNvbW1pdCBtZXNzYWdlIG9y
IHVzZSBza2lwX3Bjb2RlIGNoZWNrDQo+IGFnYWluc3QNCj4gbWFpbGJveCBhdHRyaWJ1dGVzLCB3
aGljaGV2ZXIgbWFrZXMgbW9yZSBzZW5zZS4NCg0KQ2FuIHlvdSBhZGQgYm90aCBza2lwX3Bjb2Rl
IGFuZCBJU19TUklPVl9WRiB0byB0aGUgY2hlY2sgYmVjYXVzZSB0aGVzZQ0KcmVhbGx5IGFyZSBp
bmRlcGVuZGVudCBjYXNlcy4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IFJhYWcNCj4gDQo+
ID4gPiBGaXhlczogYTdmODdkZWFjMjI5ICgiZHJtL3hlOiBEZWZhdWx0IGF1dG9fbGlua19kb3du
Z3JhZGUgc3RhdHVzDQo+ID4gPiB0bw0KPiA+ID4gZmFsc2UiKQ0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogUmFhZyBKYWRhdiA8cmFhZy5qYWRhdkBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jIHwgNiArKysrLS0NCj4gPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+IA0K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0K
PiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiA+IGluZGV4
IGU1ZmQwY2Q1MzdiYy4uODI1MGFhNDYyMGVlIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiA+IEBAIC0yNTksOCArMjU5LDcgQEAgYXV0b19saW5r
X2Rvd25ncmFkZV9zdGF0dXNfc2hvdyhzdHJ1Y3QgZGV2aWNlDQo+ID4gPiAqZGV2LCBzdHJ1Y3Qg
ZGV2aWNlX2F0dHJpYnV0ZSAqYXR0DQo+ID4gPiDCoHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+
ID4gLcKgwqDCoMKgwqDCoMKgLyogZGVmYXVsdCB0aGUgYXV0b19saW5rX2Rvd25ncmFkZSBzdGF0
dXMgdG8gMCAqLw0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgdTMyIHZhbCA9IDA7DQo+ID4gPiArwqDC
oMKgwqDCoMKgwqB1MzIgdmFsOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGludCByZXQ7DQo+ID4g
PiDCoA0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsNCj4gPiA+
IEBAIC0yOTcsNiArMjk2LDkgQEAgaW50IHhlX2RldmljZV9zeXNmc19pbml0KHN0cnVjdCB4ZV9k
ZXZpY2UNCj4gPiA+ICp4ZSkNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSB4ZS0+ZHJtLmRldjsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ID4g
wqANCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19TUklPVl9WRih4ZSkpDQo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+ID4gPiArDQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKHhlLT5kM2NvbGQuY2FwYWJsZSkgew0KPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSBzeXNmc19jcmVhdGVfZmlsZSgmZGV2LT5rb2JqLA0K
PiA+ID4gJmRldl9hdHRyX3ZyYW1fZDNjb2xkX3RocmVzaG9sZC5hdHRyKTsNCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkNCj4gPiANCg0K
