Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658E606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1UQr+ol
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1AF112ADD;
	Fri, 23 Oct 2026 12:09:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2006112ADD;
 Fri, 23 Oct 2026 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792757390; x=1824293390;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=TySkyNwHRwkE5BZ7vIUDliEhRf2MZ3d/g4HpZ7GyVEE=;
 b=d1UQr+olbczrySxo9+tpcJq2qzUWwcsKPakCfzwScnTAAOGP/F55wL1k
 ZaaJ39zKTcuCqAwsodoyoj4EOeZOo6HMCvkk4yWHWKz5F/IAKVExguHtk
 BQF9Yd4lsTMdkQb3Tn9KCyWvSbRa4EVCs5Af8cgia7GcLNqDMH4cJIb4z
 dioz79I3PaDmoezPbiRRHzUDYYVKL0ivlnvq2emebRMcQv0T+6ON70E2w
 4nmlp8+99CXqOypxl4YS6zjV7nXQdTFAockd35A6YH3zjh6+DqlDxxgDw
 2tn6RsmB0y8r2p8yPLuCwsoHykUKGxehdx9WvHgmILi+SlUN+OGOEFny6 A==;
X-CSE-ConnectionGUID: FdmJV71rSFq3j1zatmlcUA==
X-CSE-MsgGUID: mQ9bwafJRAWx3t8ussBDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1528218"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1528218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:09:50 -0700
X-CSE-ConnectionGUID: enJmYzpDTLiBbDpCZuBT/Q==
X-CSE-MsgGUID: Mwav34WQRvW6mPZajm9B3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3523408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:09:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:09:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 05:09:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:09:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0ct6ADSCgZOT0rzktKO+WZcFbAJ0IZTfyRR3ITDtNOi/2ENhEzw1zoqyDqPYcWRswJuzrHATerL1w3kI+jcMq6aX134/L9Ztcn0O3lcEaGerQwtousYxAa1SlJnMxxrEFoTcpovisg3Rhj4kgJ9WGSEafDpEH2CWdjJYulWzab/xncrY9UOIBFTp0GoGBDNULjk8LrJiIK2asNYZRLZJkJoVTFgl4eB/euwaphEFh6e1FKpChLTeXcGFArFZegazunU2KlpEyHT3fbgoiUkzyyuRowmOSj8UUOQB1JjxPgfRsQx7TOHnKTcBL/2GRiDBrISYNsJZbgNq1B0r/AXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TySkyNwHRwkE5BZ7vIUDliEhRf2MZ3d/g4HpZ7GyVEE=;
 b=Eo43xyF1l5boRUve5144fOAwfiSxhjAOwdRL+njGsPtog7FbpsvsUojhxs0dnZ3Us24+ptf5KKlcjAU23TR2/c4TBM5Uhx4OconhLbmmbjShoZ+rhLLtTMU9AmvpG7/Xf9n7hKUMWsWmbVBgk0j6n7JIXBhIa1m5c3umdE/FDkLDcPXtHJ+dLt5Dsxp4VMA78U0l8D1jmlVdffF+PymkyPT7EM5FYdY9nQ7il5PBJbPEVlG3ChSrZ1RM08orNDY+ER5s8zBGOCiR8LSszI8r7/tah+flx6YzxDj3zbD3Np0TQNSuOF87ufKqs845mUx+BcOvLEnXHRDH3NG5LXm8IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Fri, 23 Oct 2026 12:09:46 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 12:09:46 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/9] drm/i915/psr: Take the selective fetch area from
 pipe_src
Thread-Topic: [PATCH v3 3/9] drm/i915/psr: Take the selective fetch area from
 pipe_src
Thread-Index: AQHdYtVs8jY5EAEXf0mDpRHOACv7fbcLCRwA
Date: Fri, 23 Oct 2026 12:09:45 +0000
Message-ID: <8283557f6c26ba9b1518fc3abc7bba11b899f722.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-4-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-4-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BL1PR11MB5302:EE_
x-ms-office365-filtering-correlation-id: 92f7929c-2d26-46f8-3e5a-08df30fe8754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|11063799006|4143699003|261009223027099003|261021123027099003|261021121427099003|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info: vAeztscRK55+acX/gFT6zWCHL2K7VNsY2bijtWPSdRQYSy1v57E+nSRnoi8vSvOigYNaJ1skKb12BK0oxAJq1/f+uw0gIishOcHfo6t3Lhu0UkZuynp+4XxYsmt3DRoVkPgVgga6HmTSAbWV+zAUdP4icJvyLmWUOH2k0Cd+8E3iEI3arDnO1eH3yQzhJO1AZm9zHebjjypV63lbIjwW/HkWUplzcIMGeRBvqo3pVhsLF0oq0vU20cQ56pkJFxdE2qP1X0L6jAzNX+YOwosWcpPaw5fBaxVJK1RlvOBcYLcWW/YN/LkQx8niFgIVYeab4lzpbtR86xnKqxhzk7dcBqLWSNBWTcxJ2TYub3DHdnik1VyR+S8NdlopiNLg+T+JVijJWX2M/BjbilVfp5fj4I1ieCtffB+T6Efk3ofBQZu956LbFGT1iih5O+RXwuI5xjD9xXD97/5ZXIGF5KxOl2cTERko0k7TpZBGoY6BDWT5vtgb1NbMT6EptHTt670STXJI3RDRsAtOYKtdII7tUmA92ieOR+nSXHJgyZIvFpqYvLvdzpknXC1TbIgw04yk0GVtG+k3e6RI8tga7rGb4OlPOzEfbFonLLewo75mFv0Co05dIr8i5z+c8B7yJiRwQ9UhKINxwvIDRSf9ejJzslC6kMGdkDnu5axsPbCti39+XU8jr2EgOoeTON0185YzFU6tXWtvLmCXO/HtHvuXUHwA2azaSqa27WfVUmCG4h8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnkxMC9xSVI0TkZoNjl1OTNuZEJLVzVta0t2OWZqSm9nVTByM2t2aGlKVlMv?=
 =?utf-8?B?aVR1VGhiemZ1MFNUblVoVEpVcnlOZGh5UGx2S1JFalBrTTJqZnZXNnRKWDRH?=
 =?utf-8?B?b3hCb3JuMmJmQm9JTXF4NVlOUHVhZ2JmN09lUDJBazlyb2J1SU9SbVJmWjU0?=
 =?utf-8?B?RUNneU1rLytEYndzay9GbnNWbTA3TVBQRlNuOWJXWGE4NTh6K0ZZTjBBL0VU?=
 =?utf-8?B?a3hRLzNVZ1lCeUgwaW5ubGhpQkNQWXQxTlROWnJneFNIK09PSEpoZDJjQXM0?=
 =?utf-8?B?SzMxVEtIS1FmbE1Xc1ZzTERYQjNtbi9teGQxRnR0bFZmcnlSaUF0b1JpRDRD?=
 =?utf-8?B?aUlTbVZod1hQNWJTeUtkRkdpOHdPV01lVmNxdVRHeDRzT1hqM2xrMkpLMS95?=
 =?utf-8?B?NEJRQUJOaWhEblpjaE1uVDBmZTFJNXFHK2pLWHBGaGUxajVnOTNFayt1amIx?=
 =?utf-8?B?L2drSTZIYUY1YXEzTFo0L3hTR2g3UWhaQ1VpMlhrdWVNM3dGejBUWU1tRGMy?=
 =?utf-8?B?VzlSQndNTXlTRnduMkxWTFVwMGdwWGxhNm5FVUdCK25QY1kvZVp3em8wbXdI?=
 =?utf-8?B?WDY3cTlpdXV4SWNqOHdTdlphS2tpQ2t5Z21QUnRwSCs3ZVpIdDMzMjM0L2NU?=
 =?utf-8?B?ejJFNzRBd1pBYXpzeTNkMmdkWTgzRWZGWWEzTVpBczB1Z0xBYyt1TkVmVUxp?=
 =?utf-8?B?YWE0dFNKaWQ1WmxOY0VXbWRQV0hBcmVJUHpKK0cwdkY1QlFWNEhHcHNsSnhn?=
 =?utf-8?B?TmhqNmxYMzV2UHpidGVKcHB4ZEkybTNBYkIzNEd5WTA0UEdpL09pUUZZMWxZ?=
 =?utf-8?B?Y29QN3J0TVAyNktOYVQ0WHZoV3JXV2srOEZEeC95eHI3TGMxcmkwSHNER0lu?=
 =?utf-8?B?NmUvTkZkWFZlcVcwN3pBclQzV3NvLzZDVHZ2Z0c0aWU3bVNGZy93eGhkRGEr?=
 =?utf-8?B?ODRkTUdnaUtudCtYaDc0YnFXWEFMOXVpR3cxaU9rMHFyMy9ndm5KWDJ2eVhR?=
 =?utf-8?B?S0lURmxydngzb1BqcXJjWCtrNlNseXBOUmlidjN2U1h2SGJ1cG1kaU1KTnA1?=
 =?utf-8?B?NEVheU16a3BvNnRKcUhXTERFeWl6TkRwbnhXNVZNcXBidmgzMjlIKzhrSSs0?=
 =?utf-8?B?eTJ0ZER3QUZHbkI4ZitZR3IwSXZYRHFmdVJvdy9jR004d21xSWhyZlY5Y2pR?=
 =?utf-8?B?STNTM0h5T3NEd3ZEeE9UcEFJTmJRcUxvQ0lJSWJQOEFFRTZmRlhodDY5ZVZt?=
 =?utf-8?B?Q2lNa0QxMGJldWUxbVhmQ0JxSThBOFd4a25iZUVoUXFmWmxEbjZoWTBkQTFv?=
 =?utf-8?B?NFJhN3RjNC94emF6UFk2aU5hY0R4ek5Fbm56ckUyM1lxa3o5dmpYZTd5ZXd1?=
 =?utf-8?B?R25MR1l5RlpKaVpIemFVSHhrenQzcTlZWEZSd1dvMVRwRndtb0F3Ym5GL2Zt?=
 =?utf-8?B?UDBTRmFPVFdhd2gwNU9EbnQ3dzlTR0h3ZWl4YTl2ODBDR2VORWt0OVE3VkJ4?=
 =?utf-8?B?Zjd6UEtaVVEzQnUxVHdnTzZZN0J1blRyakkyeDR6VUhwLzVjVE9kZGxTbTBp?=
 =?utf-8?B?UmMxK2s2QnMrZ2REem4rRTBra0tNc0FOKzArcm82S25hT0NEV2JKZlN5cXZp?=
 =?utf-8?B?QVlLd000THZIcUNISzBLWWhiM1B2aG9XLzc1cTBmWlpVc2dva21EaFA2WHVI?=
 =?utf-8?B?SEk4WEFyYTZYbis1cGtVTFVYRENVa0FWZWxMOUFadUxGUk5hV3lNYkNET05D?=
 =?utf-8?B?M0IzNzRQdFI5OTF1eGIzRTBtKzBhM0YybFN0citPdDErZ0FhOWxCQUNNOWlx?=
 =?utf-8?B?cEJZaDRrc2tJZkk1Q0FhUVVQdnZHQ0c1Tk9GVE1mQ2VsQTFLSkRiR0pzSHF1?=
 =?utf-8?B?RHYwMUtFeHJaQmxGeXhQRHBqRlBRK0hUbitDQytCWml5M3BselI1SnNJdUlz?=
 =?utf-8?B?UU5JVGNvbFBEWjB5ZFZPNXBxdTIyd0lZbU0xWmFBZGd0clM3SFNlUUMwWlNV?=
 =?utf-8?B?Q2pLOUV0T0Y5RmNYRmFFajBRVlpwaUtsWWVNK1FQMHZJTzgzNnhkVTZjc0Z3?=
 =?utf-8?B?cTVSNU9TYXZ6Zk9oZ2FHYXozSUczSFlBR1F1MGdqMkJjTEtmRXloQ2dNZVBV?=
 =?utf-8?B?UFhpUkU2eTZFZDJlOTRzbFhvRWtFa0labXNqTk11RktFMEcwR0ROa2Jnbkpv?=
 =?utf-8?B?ckFHWHRSVTJVRDMyL1ZjKzVLNnhCRXZtSWdtMURIdThHOTBYdDlJZmZtMEtJ?=
 =?utf-8?B?NlVGS0ZUK1BHeGE2NXNySW5sK2t2N1VzNXdvMi9jR0FTdnlHdjY5cGdKbm9n?=
 =?utf-8?B?dmVodDB2cGZ4ZVA5dCtlWEJlTUlXNG9WK013SEJ0YlpDUVl1ZDZOVFlDOEdI?=
 =?utf-8?Q?lLUkYkNM6xgZr4fA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3703CEB8F2B71E489A9D79964C50F747@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LNE+Ofz7J+arRhfzCjhxcnsLlYNYQblZjsgLVgm0Ik4Wlft+WMyfcwCF3seEaw+B9caodO2eE4MyOkAMlgpL0CqXgKbcPxpZ/5GXMvipwYOD1yslekKfk9ex9iuLAnkH2z4pXDrlG6+wctp5da0ZA3ESg3ICLYqa7SUSMKJSEIdhhP9ZXSNv8CFioTNmtOCQAhCQ6gXM4YthnXdaxeyAdAt2u1KAIh7yfe0/kQWun0P4AmZ9UjhnTH1go/HWZCpYO16Huf63KBjGYvSj1JBdhBQk4GyxgAK45ljwwoMK4nRt8eYqX58Rb34yzQ2Swa6pCHFK/clsNl8Nqc9ZhtQxHg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f7929c-2d26-46f8-3e5a-08df30fe8754
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 12:09:45.9952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLEd9MbOE4PXDbEd5V/0E5Jk70J1GcUXXqBpwT3nRyIyUNfN555hEY4J5F/Y49LSiV7UXeicbYs5qBrkkUyvK/igwNK3VvCYtW9fnwNKtrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
VGhlIGFkanVzdGVkIG1vZGUgc3BhbnMgYWxsIHRoZSBqb2luZWQgcGlwZXMsIHNvIGl0IGlzIHRo
ZSB3cm9uZw0KPiByZWZlcmVuY2UgZm9yIGEgcGVyLXBpcGUgYXJlYS4gcGlwZV9zcmMgaXMgdGhp
cyBwaXBlJ3Mgb3duIHNoYXJlLCBhbmQNCj4gaXQgaXMgdGhlIHNwYWNlIHBsYW5lIGRlc3RpbmF0
aW9uIHJlY3RhbmdsZXMgYXJlIGNsaXBwZWQgaW50by4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLCB0aGUgdHdvIGFyZSB0aGUgc2FtZSB3aXRob3V0IGEgam9pbmVyLg0KPiANCj4gdjI6IFVz
ZSBwaXBlX21vZGUgaW5zdGVhZCBvZiBwaXBlX3NyYyAoSm91bmkpDQo+IHYzOiBCYWNrIHRvIHBp
cGVfc3JjIChKb3VuaSkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmth
aG9sYUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhv
Z2FuZGVyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jIHwgNCArKy0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9wc3IuYw0KPiBpbmRleCBmYjliNTAxM2E5NjQ5Li4yYTRkNjY4MWQ1MGUzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gQEAgLTI5MTcs
OCArMjkxNyw4IEBAIGludCBpbnRlbF9wc3IyX3NlbF9mZXRjaF91cGRhdGUoc3RydWN0DQo+IGlu
dGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IMKgCXN0cnVjdCBkcm1fcmVjdCBkaXNwbGF5X2Fy
ZWEgPSB7DQo+IMKgCQkueDEgPSAwLA0KPiDCoAkJLnkxID0gMCwNCj4gLQkJLngyID0gY3J0Y19z
dGF0ZS0+aHcuYWRqdXN0ZWRfbW9kZS5jcnRjX2hkaXNwbGF5LA0KPiAtCQkueTIgPSBjcnRjX3N0
YXRlLT5ody5hZGp1c3RlZF9tb2RlLmNydGNfdmRpc3BsYXksDQo+ICsJCS54MiA9IGRybV9yZWN0
X3dpZHRoKCZjcnRjX3N0YXRlLT5waXBlX3NyYyksDQo+ICsJCS55MiA9IGRybV9yZWN0X2hlaWdo
dCgmY3J0Y19zdGF0ZS0+cGlwZV9zcmMpLA0KPiDCoAl9Ow0KPiDCoAlib29sIGZ1bGxfdXBkYXRl
ID0gZmFsc2UsIHN1X2FyZWFfY2hhbmdlZDsNCj4gwqAJaW50IGk7DQoNCg==
