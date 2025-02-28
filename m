Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4865DC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 11:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1352A10E1F1;
	Fri, 28 Feb 2025 11:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPCkY+cH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EFB10E1F1
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740741735; x=1772277735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=X7Rb5PRs59PSFVQhRMdi3GN1xfcvj4RnX+MnFoBjkYc=;
 b=JPCkY+cH47gCTOQubAMCRP5o7F9QzkVVSAh3Cd4KfPH9AF3cSHz8USt5
 hkP/SvLUSnx63j4qK1euPgPxEktf46kUS2EcK/LjdkQyyBVW5Gl6f/lM3
 47VkOZ7HvorvBNp0eA5aELdC/TsurpGnD4MW/lE38mT7mut/gL4A7R9j+
 O7lVza6rGIzWzSekSqqqUk1/M82MieeFcu07RSL14sWj5untAOaw2Vaf1
 KkxIzomhWyIZ75g+53zt/lUcNdN9GR8ZPQLp6V1XOaa+YuiMDJNWvQb86
 ufUAKuxSkOxLPRVbxu3cVHXWUx15q1M9lJoYndyswdpyw680eBJbwBQoP g==;
X-CSE-ConnectionGUID: uJ4YAgxlQXS8lT5fXkVAHg==
X-CSE-MsgGUID: m92R91ulRAyFjtSRiVYerg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="53055782"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="53055782"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:22:15 -0800
X-CSE-ConnectionGUID: s1s/WcC0Qf2mfILiUdTF0Q==
X-CSE-MsgGUID: wTeYfYwKQguLTR0h51Kgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117346726"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 03:22:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 03:22:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 03:22:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 03:22:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9RgZEa3g9mRyPDG78S2hK+rHe9pkBEC44HCh9O/rmE69dGNCOkoNHx3cWtYS43+X0LPtYxnBX++1DSYO3JBe00gIjgzU4etKcu5zzrO19VkcON333g6P5wewTc6xhqbw/l8NdF6Akqqd2AW8XoeJ/o1Tf6X9V5Tt5ErMmF280qiLuTSjygbDh0pNKNvcqInGw0riGvq0kaXbU3Z+QWGawScDB71TzxrNHu6TMkBi4jhtf2cMmeIkM17etUNUZ0uyX7Lhm6CMipWJmYanv9A+x90W0uGp/zanh/iFUQwIddJp0DJwQqAqD3CTXebuV+9rz9gVX5IGl5sYTmWwHW13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7Rb5PRs59PSFVQhRMdi3GN1xfcvj4RnX+MnFoBjkYc=;
 b=v249EljHmwEPUhYe8xPTl8OzOFvqHvNoov2fW1MqvWOKBKfxAhKgE88+18f+7FI8cMCF9SeEs1hQhzSu/J1nwDgJxOOieeWkLisKjF2R24VBeniJfSy2t9z7H8OwI0gEyvKZACE3jno9Wi8lNUCwes6zrFR0U0pPxqZUH4y6dDezYEcPLRnRpkw0y2IytNSdDg2h1Rg9iwv0fs2E2FYXZ7cNy0E+49cCo/6ouQ4T43UifXShMRogEM2w9pTHJFLbnPMs4ucSQcqT3m1tluuGsnvHP1q66BnI+A0Cig4v0vlSHWNP3Ujbo5dFG+rVQBwUT/vwXyG22c3MXjkNlmblwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Fri, 28 Feb
 2025 11:21:58 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 11:21:58 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Bhatia, Aradhya"
 <aradhya.bhatia@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during
 device remove
Thread-Topic: [PATCH 2/2] drm/xe_device: Evict all the VRAM objects during
 device remove
Thread-Index: AQHbia1wl3KbjSJezUSaKTGeYtWNhrNckpmA
Date: Fri, 28 Feb 2025 11:21:58 +0000
Message-ID: <77a5eb08301f7e2de3fab3e9344c94492ddfac13.camel@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-3-aradhya.bhatia@intel.com>
In-Reply-To: <20250228065224.320811-3-aradhya.bhatia@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CH3PR11MB8140:EE_
x-ms-office365-filtering-correlation-id: 9f1fab1f-d088-4982-2e3a-08dd57ea1d66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OFprMENoSlg1SVNTbm55VVBoWDNwWU9NdDhEclpZZ2ZtTDRhbTZ3V0R2N0pK?=
 =?utf-8?B?R1dOaVd4dVQ1dC92RGNKNFBScjBaODRKZlZWUGR4NXZDUFN2c3VMbDQxSnhO?=
 =?utf-8?B?K0d3S21tRkhhdm9wdGN0cEJKa2h5WGV4djBPc2haVjJsL05LYktUY2JzWVhw?=
 =?utf-8?B?b2JIS0RQS2l2WEVWN0RhQ2dQNFFyWk0zN0tGV3RSMzQ2U3M1KzdYVTQ0eG5X?=
 =?utf-8?B?VmZxaXZhT25OYXNKQzBuMDZpKzE1aVoxUy9BSWpSeGoyVENpS3RrcGQ4cStJ?=
 =?utf-8?B?VHBhYXRmUTBmTlk3anBJUmRWZmZWd2x1ZStOZlk2UDZ1ZDQ4djJDMVQ5cTUr?=
 =?utf-8?B?c2tFZFlKSDE3a0lNajNraUh3eXdLbWtrQnVnMENpc2FBNVBrQzBNL3g1Z083?=
 =?utf-8?B?TXRyK0czV0RySDJFazd4c2RqNTkzcGJPbXRQYmZ4K1hiWEhMb2Ixcm5RTDd0?=
 =?utf-8?B?RzZIQVc1cjJsZmpvL3lBeXEyNnJkS1B6MFhSMklCSW5KK09GK0NBUThPVndu?=
 =?utf-8?B?VTJKL2dZTTZ2Ym1relJMd3RGS21neWpQbk9qamhjeDhYaGF4bzA0ZzFHVk1T?=
 =?utf-8?B?bnVZOVYxZ0xXeGVDTmhRVW1ZcWVNdnNrNVVUQUE4c01vVDFIRExrak5jY2lN?=
 =?utf-8?B?TDB5aFJpejE4YUdYbk0vV2JvdlFjYk53YW1tQjZpbUtmaU1HanRlTkcwalBr?=
 =?utf-8?B?eHlDc3d2M21tQjRjUzhuVUt4RzREbVI0c1FxK3lIVTFLd1ZpK0NFekhYNC9V?=
 =?utf-8?B?QWk5SzRYWFVmTnc2aWtTK3ZMM0ZYWWpFVU5XK1VzaWx1MGRDZ1E4eTRsdE5U?=
 =?utf-8?B?TjR4TCt5ZlA5dWJ6a3A2QlBEYzI5eXZHbGNnRzdaS3hISWZMZGg3RC9peVJv?=
 =?utf-8?B?c3RvUXU0UGwxQklINjVHYml2RXdVRmd0NlRITHpyVFM2RzRZMnViOENvT0pO?=
 =?utf-8?B?Wlg0WFpLSUJBNG0yVC93c05qbUJFcjhzb283SXo3aHAwdTl6MHVpM3V0RG1E?=
 =?utf-8?B?aDZDMDZUMGJJczhUNVFmSDJYZ1I0cW9Oc1BJV1dHRkZvaU8ySU55VHA3Q1Nn?=
 =?utf-8?B?d2xlVmt3MUppcmtKZVBSdkd2RzhEVnVtMTVaWEJrbnp0TG9MU3pNS21aK1Nm?=
 =?utf-8?B?b1RmOFllS0RrcklMYXJhRGEwVW9scjdUYXZTTXN0Z2wzV0lKS3BIVm1qSk9H?=
 =?utf-8?B?MkhxbzBVNVIrVW5ncFRuVm05aUFOQmE4c0RGRjlEUkJnemRLZUJhQ0FrMkww?=
 =?utf-8?B?dDhQVlpsNGpFeVFCVmtsMnBsNEVBamFpUUNGMkg3UW8xRjljWUhZSWJOZlVa?=
 =?utf-8?B?NHF1b0tpVHVrRGNnQ1MrNDNGV3hrbVg4N0dZaXJPOEdnQUwyZWdBZXJGWEZW?=
 =?utf-8?B?V3FuR0VBTG5PRHY2Y0NldUNrK1JHTlpJUFZBZnFmb094R2ZTR2EyTUhhcnY3?=
 =?utf-8?B?cnZrYXg1dzI3T2JBUWF3Ym1TSmZDWjViaGNWTUVoWDFlMGtrMUZpV3NsYS9L?=
 =?utf-8?B?dThVN2s1c29uRk9KUWN6YVFTY3g0YmRtOHRJcmVPNTA3WU9oRGpRSG5pc0s2?=
 =?utf-8?B?ZmQyaWV4RlBwbGhSd09kaGUwNXVUQ3JMMkJEYXltVTF2QndOVDNpRERzSFcr?=
 =?utf-8?B?SkJhM0lBcXU5K1BodXI3bEQrL2ZLclFTZ281aVBjaVpFYkpDOFRiMGRYVmJW?=
 =?utf-8?B?aHduSHlFM1pCa01MTHpyZjhUMXRLZ24rcWxhVEVDazNIZGFaeGh5OG5qZUlJ?=
 =?utf-8?B?RVZuc29zeTJ1dHhONGh3eTIxTjZ5cWIvWFNRd1RyeUFhYUxQUUVMMXdtSlc5?=
 =?utf-8?B?RDVaQXdWYnFyaGdjd2piUzZNNkpOQUR1MFVQL2VBR2lJalp2R0crUTRYZ1lw?=
 =?utf-8?B?YzRpK3kyeEJKbDVITGpzdml5Y0taQTk0KzhsazdjTXFsaDU2TEhCSFV1SmV2?=
 =?utf-8?Q?TZLXYq9RMVIimtu1lSH5u5uf94nqYm2q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDBhcDRVTFNmQzB4anl3aUhEdlNZNGd2ME1IcnJUMVBuaktSZGp6Sm0yRTEz?=
 =?utf-8?B?cXlTdktFQ08zdHl6b3FhWDV1SzZNdUhSNEJLL3kwK292THBLK0FvWWkxWU9I?=
 =?utf-8?B?a3B3Q2ZYd0J6WWpRRnN3ME9ONVNDUXFTMjBxZGRHTlF2S01GaEZwZSswUUxF?=
 =?utf-8?B?YVNNSS9jeklLb2pmZm1XYWI1QU10ZGpiZ0pmRmk4NWZiaVlXN3NhcGFxV0Y5?=
 =?utf-8?B?dHdjU0NhQ1pTdEZWMjg0RHlBWG5VNW9WUWxlVlB2NEYrOFJmQUtPTW5ycnJZ?=
 =?utf-8?B?b3FoaFFUWmxaaDk3RjNSeWowNG1rTFQ0LzZaellKU2hZa1R6NE1KdzU5OEZD?=
 =?utf-8?B?anBuOVgrdXhPVHFpaUhtY1Naazh3UjNKUlltQStDdkp6REtiVHB0MVpaZHYr?=
 =?utf-8?B?N3VQQ3kzS0NFSzVUd0QxV2xUVE1jSVF1RW43UStJNmFHTGYyOEo3aE5qTCts?=
 =?utf-8?B?bVNSN0NzN3RpdWpGZUV1d1ZhOG4xdmE2dkpTeDBwY1d3U0UzbGZUdllERTFv?=
 =?utf-8?B?RFdhNWNSZjgxNEIwK1AxMkZuZ1kwRUhRSFlWSkk1b2pMRjJKV0x0WlJVK1I2?=
 =?utf-8?B?N0pFaDk4dGlQTmM0TXhZdTVaNDNQUkhBbnJrSnBvUmpmM1kxK3VBVkU5Q2d5?=
 =?utf-8?B?MXk1ZGtDditvYzZLR2ZJU0trb0VhNWZvRDFkSjZObm1UWmd2RG9UcmNtYytE?=
 =?utf-8?B?TVJFeHdsWG9raWRVTkNkVjM2NU45QjRVNk9yNi84UHpWWVFDMTltR0xEalVx?=
 =?utf-8?B?aGRLQlVVZDU1SUxqMVBNOEN1SE4wMEhCQXJ1dnh4bXJJcDZHSWpaUDh1QURW?=
 =?utf-8?B?aTNaQWNVaUQ3YjRUemw1YTluNmdCR0xXRzhNa0tYaENQeGVOR2FPM1hLRkt6?=
 =?utf-8?B?aUpzakJrcXd2ZTFkQSs4N0xtSlE4VDVzZVdhLzNZZE51WGVBREZnamEzRnQv?=
 =?utf-8?B?L0VUQUhuV3ZZbXRlU1ArQXloZjJUdXM1dmUyK0VZU3YyTDNIZmgzODR4NndL?=
 =?utf-8?B?Y1FLaWxXUVpwOG5teHhZdEZNaFNGTWg0ZFYwUTN1UDlORW9aNG9QVjNZSGc2?=
 =?utf-8?B?MjI0QjlFbkMvK3FpdnErQjFDVWhGa1dEa3ZjNkZZMGJ0cEh1VDZ0amhlWTQ4?=
 =?utf-8?B?MnRSUnlsQlpJdHlBV245Y2NacGZRem1LSnpvb3RlYm56K3R5SWgwa05HVS9w?=
 =?utf-8?B?NWlIT3ptcE5PMjhwNHh6ck04OHFITFBXZW9NallIMExVNHdDZVhjOVJaQzll?=
 =?utf-8?B?OUhPdlprYldvNzhEZ25oZy9Nakc2MkVzaTFtVE13MjFrbEowL2o0OEk5Z0FT?=
 =?utf-8?B?V1h2NmhQMG9WZStoTmIrSlhDTXQzT3h5VDg3cEFPckIrZ3ljUzhWdzhvNC8v?=
 =?utf-8?B?ZmVBdS93K3BvWllWRWtUSDVSRWwwVHU4YWwxMEZMMkNYeGp3L0hZMUJPeGxx?=
 =?utf-8?B?anpTQmY5T0dmUjVqUFpaTCs1OS81SU1QeTBRdEJoMlRZRzFPL3VTcXVOaEdH?=
 =?utf-8?B?Wm43ejRaaUFNSDdrdzZBZWY4SmZyUTlzWXJhQ1J2Z3YyMTVxRmUrM3hIMHpn?=
 =?utf-8?B?ZDI4cGxpUHpxamVqUFArcVFwTEEvbEUwTG9teUpLWVV4S3BvTUdhU25XQVVl?=
 =?utf-8?B?SXlsTDhMWkZCYi9RSG5ZNUIvYnM5K1pPV3Q3L3FlbCtVMDdZMU1yWHVBZmdn?=
 =?utf-8?B?b2V2dytqcWxXNTMycVZjQWtsclIxdjFKRDQ4Z0hKR2lKbFdNVC9yY05LUENw?=
 =?utf-8?B?TWtXMVpUd0JVdk8vSUZuMHhJaGllL2RJb2lWMGh6enYwb0FHWFE0VW51Y3JR?=
 =?utf-8?B?eFQydWFRSkhHLy9zRllDa2I0aEdLcVZRRHdPQ1hSVGpwdjBWWm45bkdoaXNm?=
 =?utf-8?B?Qnp6TTAzNGpxTHRaamdMYjFJaHQwM1Rkd01uODhPbGJHNGUvU1dlNWpDZURw?=
 =?utf-8?B?V0hnQktkL0VOSXlldjZxNmxZRFpUQVF2eWN1V0tTOEpsNkdCckhtMHpWVmRh?=
 =?utf-8?B?L3lIV3U2UFYvclB2Q1FCOVA5dlF3cWJwVDd4RThPamczc0ZKMkNwSjBMN1k1?=
 =?utf-8?B?eEZoc21rRk1UZE00UTdKcG5XaEZrZTA1M1RYRzBUejFFdHhxYzhueGJFdTJU?=
 =?utf-8?B?TmJiZkt0R3lKTk4xK2IyYUdXSWIyRVVEVmpwUDZyeFVycWx0RnpyWEdQYkRM?=
 =?utf-8?Q?szHawtWwTeuDj6oTilfeUnDeThz8seEcDR+HQc5IFdHZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6884E8D14F0A454D92CD78096F23BC98@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1fab1f-d088-4982-2e3a-08dd57ea1d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 11:21:58.3379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7HKLtIXAOVvzoJeET35uicoPbM2+o0cefsqa/tzyi/bxdjNc0e6PuitBhhKb2qQ80wloa2PyQF+pvlOIxf4bnD5dwZsN5XGs8N/DEGPcXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDA2OjUyICswMDAwLCBBcmFkaHlhIEJoYXRpYSB3cm90ZToN
Cj4gTm93IHRoYXQgeGUncyBtaWdyYXRlIHN1YnN5c3RlbSBpcyBkZXYgbWFuYWdlZCwgaW5zdGVh
ZCBvZiBkcm0NCj4gbWFuYWdlZCwNCj4gZXZpY3QgYWxsIHRoZSBWUkFNIG9iamVjdHMgZHVyaW5n
IHRoZSB4ZSBkZXZpY2UgcmVtb3ZlLg0KPiANCj4gVGhlIFZSQU0gYW5kIFRUTSByZXNvdXJjZSBt
YW5hZ2VyIGFyZSBkcm0gbWFuYWdlZCwgYW5kIHNvIHRoZXkgYXJlDQo+IGRlc3Ryb3llZCB3aGVu
IGFsbCB0aGUgcmVmZXJlbmNlcyB0byBEUk0gYXJlIHB1dC4gV2hlbiB0aGF0IGhhcHBlbnMsDQo+
IHRoZQ0KPiBWUkFNIGFuZCBUVE0gcmVzb3VyY2UgbWFuYWdlcnMgZXZpY3QgYWxsIHRoZSBCT3Mg
YmVmb3JlIHRoZWlyDQo+IGRlc3RydWN0aW9uLiBTaW5jZSB0aGUgbWlncmF0ZSBzdWJzeXN0ZW0g
d2lsbCBhbHJlYWR5IGJlIGZpbmlzaGVkIGJ5DQo+IHRoYXQgcG9pbnQsIHRoZSByZXNvdXJjZSBt
YW5hZ2VycyB3b24ndCBiZSBhYmxlIHRvIGV2aWN0IHRoZSBCT3MNCj4gc3VjY2Vzc2Z1bGx5Lg0K
PiBDaGFuZ2UgdGhhdCBieSBwcmVlbXB0aXZlbHkgZXZpY3RpbmcgYWxsIHRoZSBWUkFNIEJPcyBk
dXJpbmcgeGUNCj4gZGV2aWNlDQo+IHJlbW92ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFyYWRo
eWEgQmhhdGlhIDxhcmFkaHlhLmJoYXRpYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8IDE0ICsrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4g
aW5kZXggOTQ1NGI1MWY3YWQ4Li5lZjI5MzU1MmRiNmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2
aWNlLmMNCj4gQEAgLTkwNSw4ICs5MDUsMjIgQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gwqANCj4gwqB2b2lkIHhlX2RldmljZV9yZW1vdmUoc3RydWN0IHhl
X2RldmljZSAqeGUpDQo+IMKgew0KPiArCWludCByZXQ7DQo+ICsJdTMyIG1lbV90eXBlOw0KPiAr
DQo+IMKgCXhlX2Rpc3BsYXlfdW5yZWdpc3Rlcih4ZSk7DQo+IMKgDQo+ICsJZm9yIChtZW1fdHlw
ZSA9IFhFX1BMX1ZSQU0wOyBtZW1fdHlwZSA8PSBYRV9QTF9WUkFNMTsNCj4gKyttZW1fdHlwZSkg
ew0KPiArCQlzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiA9DQo+ICsJCQl0dG1fbWFu
YWdlcl90eXBlKCZ4ZS0+dHRtLCBtZW1fdHlwZSk7DQo+ICsNCj4gKwkJaWYgKG1hbikgew0KPiAr
CQkJcmV0ID0gdHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKCZ4ZS0NCj4gPnR0bSwgbWFu
KTsNCj4gKwkJCWlmIChyZXQpDQo+ICsJCQkJZHJtX2VycigmeGUtPmRybSwgIlZSQU0gZXZpY3QN
Cj4gZmFpbGVkISAlZFxuIiwgcmV0KTsNCj4gKwkJfQ0KPiArCX0NCj4gKw0KDQpZb3UgcHJvYmFi
bHkgd2FudCB0byBtYWtlIGFsbCB0aGlzIGEgZnVuY3Rpb24gaW4geGVfYm8uYyBJdCBhbHNvIG5l
ZWRzDQp0byBiZSBjYWxsZWQgICphZnRlciogZHJtX2Rldl91bnBsdWcoKS4gT3RoZXJ3aXNlIHRo
ZSBtZW1vcnkgY2FuIGJlDQpicm91Z2h0IGJhY2sgaW4gYWdhaW4gYnkgYSBydW5uaW5nIGFwcGxp
Y2F0aW9uLg0KDQpGaW5hbGx5IHlvdSdkIGFsc28gd2FudCB0byBldmljdCBhbGwgWEVfUExfVFQg
Ym9zLCBiZWNhdXNlIHRob3NlIGFyZQ0KdGhlIG9uZXMgdGhhdCBoYXZlIGRtYSBtYXBzLiBFdmlj
dGluZyBYRV9QTF9UVCB0byBYRV9QTF9TWVNURU0gZG9lc24ndA0KZG8gbXVjaCBtb3JlIHRoYW4g
dW5tYXBwaW5nIGRtYS4NCg0KL1Rob21hcw0KDQoNCj4gwqAJZHJtX2Rldl91bnBsdWcoJnhlLT5k
cm0pOw0KPiDCoH0NCj4gwqANCg0K
