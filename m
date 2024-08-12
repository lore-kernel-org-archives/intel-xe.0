Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4DC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 12:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC1410E1F0;
	Mon, 12 Aug 2024 12:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJ1TSQ2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9423C10E1F0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723466923; x=1755002923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y8J4+Pe2eAdXl/vaz147tRZRHq9z0+jJ0iggywm4ZOU=;
 b=NJ1TSQ2A7cURRcMXjmCXtbGKsRRN4kV0qDXgfz4UOfdeuyWQBisswm5O
 YBf05oM880TYU7MhPY9buwtpZJWZYWnUvF1jhHxT4fHOBT/gzmPxXrIMY
 nC/1hptpBvQP2hjXpKM1fY8/xJSAO9wyC0LS1l2OZX+mhfI0iCkdqTLOp
 eRaDYqU5omZD1dYMSTjpqKZa3IScZ4ZMNd7ghgNz/YpnsWwmdnztLU2sw
 rs3byDoFJ+J0Ec5BECM8+vRLfWL4V1PmzTwXX9X0HZ3knk+MOkwrc0hF9
 EG6iqp0JgoPiewdkCZExtTHfxOa1Wjq96GhA3zPSOjmgGCat7gHLL5upS w==;
X-CSE-ConnectionGUID: 3CdlUWg0SkqRRGDImcNWXQ==
X-CSE-MsgGUID: k7ZfaOd8SsyGmmUczNkUtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21735646"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="21735646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:48:42 -0700
X-CSE-ConnectionGUID: l2fTzUcjTDGcldS3yLoLLw==
X-CSE-MsgGUID: tvVXV1D6Q6Wmx5Tcwc+KDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58211177"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 05:48:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 05:48:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 05:48:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 05:48:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 05:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF5QR4iN3PhfhnZ3w+6ayjO4b5Jt/9uKPuohWP4w2Mt0jhRn7VT4cysT4VH3zLXGILx/mniVZVy8wBRh+8ZFV2Hc8CRY21w0txP2lkooPX5m1TD/wLkPoEiwYvbyqukCB9zlKIXUbxrdsMjHkafv5gRcER2H5BTylvSgFsVPYOfYwo7MGLsZonmK7sVo9DaxX8nHR1kBMS+saFolgoHC5oFURdm5G2emvH43LLX3pU2+WXKNeT1QRSMRJTPqVWAKyRxGRcnXIQ9lZwxd5osIKH6gT6UP7IYceS0CKqTGA6frGI+rpvxfRPBd95bnrUt9oVOAKSIhdWCfNCbBMc45zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8J4+Pe2eAdXl/vaz147tRZRHq9z0+jJ0iggywm4ZOU=;
 b=rgOpUMQElth7YBlbBwiScbVB2eBp4S+ciYo+pT759lR/ZJ2LXmvDSCuKA/H9mQJ1Pu/vLVJeRI+z0BfHi2VFTcj9sLMN94X7w2tzUcZiBeRgVVvPDUs8FC0Mu4TqRPcNBx5ka4h/xGb5repyFAOVF6eQOjW2HWqy4wMql6ohA4Px+BgTyf5PiZbjY+nf1vnrbNb9BFto5xGVsrH7jVov8+i699SC0ZJtLXWq2/3HNmYDhgneKXSFJTuKHgz/lHgu3/zFbkNbpgBMHoBNk1Ne4xJJc4XwzRbq529aE5Oty90oV4fH1A5ExCKpf64eqZTWtNCaErX01MN3WeBqhaMLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 12 Aug
 2024 12:48:39 +0000
Received: from MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5]) by MN0PR11MB6208.namprd11.prod.outlook.com
 ([fe80::7a1b:645a:6e80:3ef5%4]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 12:48:38 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
Thread-Topic: [PATCH] drm/xe/xe2hpg: Add Wa_14021821874
Thread-Index: AQHa7IV7cAah3MkbF06O5oxH6K7CCLIjPt0AgABTkzA=
Date: Mon, 12 Aug 2024 12:48:38 +0000
Message-ID: <MN0PR11MB62089AAB6D089B844091CC5281852@MN0PR11MB6208.namprd11.prod.outlook.com>
References: <20240812070251.796744-1-tejas.upadhyay@intel.com>
 <b649bd68-1bb2-4f5a-aab5-f9345a145e83@intel.com>
In-Reply-To: <b649bd68-1bb2-4f5a-aab5-f9345a145e83@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6208:EE_|PH0PR11MB5078:EE_
x-ms-office365-filtering-correlation-id: e3abab67-78e6-4cd4-d54c-08dcbacd1692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dG9DQmtISjNFSTdWOWJHVU0rZk15M3kxL0QwOTYvYUJPelBXbHNIRzBab2Qw?=
 =?utf-8?B?TGY2ZW1tZTVkcFlBNmR0eENDbVAvdlhmMHJGLzlRbENLd3BjeGFmZFpRZ0xk?=
 =?utf-8?B?S2dhR05ZTjBSTjlBaGZsN3pKTFNlQ29ta2xTMHVqV1NNRHZFSHBHMVlUTXVk?=
 =?utf-8?B?SVpMQ1lha3hDSURLRi9jakkyeGV5S1NJMkQ2M0RuSWQ5dUplMmo0aVkzc2Iw?=
 =?utf-8?B?aWhtUi9WR3ZzakJ1SkJ3TE1rSXZSc1lXRnY4YWgyWkw4ZXNjZG11WDBVTDRm?=
 =?utf-8?B?c1Nqa1BEbkhMZFlDd212VlJLa2FPa1ljRU9rNExnZ2VUYWhGazVFWDJPZS9t?=
 =?utf-8?B?anBQWE9xcUF3Y0tPeS9tVkc4OGEyeS9PMDlRZzNIU1lsb3pPOStkRmI3aUkz?=
 =?utf-8?B?MmRQSGhaWUYvcGNUZUxzUlIxUUhOVTAxR0E0S2NiWU9STlJNM1RNdjFSQzgv?=
 =?utf-8?B?eS9FQ2dXYkNtVmJvNUg5TXpyeWpiZDJnbms3bnYyRHIwY3pLdWZEV2o4NzN1?=
 =?utf-8?B?Y1FrUFh3cC9JT0ZYaThPbzZGaXp4U21pRktJT1NhbTZLU3RoNFJ3V3U5c0py?=
 =?utf-8?B?QnR6d3JSWkxOZFllQ0NkRVdjNyswei9SbWtvcDdWSmdqeUFUa3VvQVF0YWJw?=
 =?utf-8?B?U2lTWUtJMjZnU0l6ZFNRd010QVdZWGVsVHZ2T09GNG9LdWUwYjFwdUZaTm5v?=
 =?utf-8?B?cUltb3NaVDRaMFE2OGtrclFOSFdqUTZqczFYWDJNaG1aeXM3aVZBL3YvUjlK?=
 =?utf-8?B?YUtOWTBtdnhkeER6K1lPZzRSK0lCRjAzcys3enhoN29MdVE0eXkrK1ZiNUIr?=
 =?utf-8?B?SnhlejUyNk02eVJ6UTc2dG9YNTNMOWFkZTVRd21rK0s4eGpZMExsSStTbEpW?=
 =?utf-8?B?T3hxVlBIWkpGcWpZbXNJbVlIRWpCQ3J6WGFMNWpRWE5DS0YzbWVOckUxbEZq?=
 =?utf-8?B?bGhtR2VjY21mYTdGV2trRmdtSUU0bXFVMmNrMmFPb1MwT3djUCswWU00cDhi?=
 =?utf-8?B?aGVFNUF0bFoyeXY3Z2pHak9ib1FvV2RqcjJWM3Z5TlJVQTViUDF4aUVxcEhl?=
 =?utf-8?B?Q20yOGpUT05EcW1BdldZUGEyTm91bEtIUmtlekZUcWNsRXdyeHpvdzFERmha?=
 =?utf-8?B?T1N2RUdUeFpNSm9ubTdxNGc1bk82U2JwNk83bVNqTndBcU50VGJicUFFQjFs?=
 =?utf-8?B?TXhOVkVvQkRDMk1hTDlud1h4QnhoMm1vV2FhdVp2Z1k0aGVkSThjb1VwajVB?=
 =?utf-8?B?eEd4bXErVXVsQ1pYL042eFhmalhzVVRkR1k5ZHE1Q2lrSjV4YzFwaWRtQVBK?=
 =?utf-8?B?Z252djF4Z3NrWWZGV2VNRWpaRTFKSHRrSURWRFFPVTJDK24zOGp5OTFWaFNl?=
 =?utf-8?B?MW1tQ2FpWkZhRll6NEZsSEE4V2xhZU4xampNVzZiYWU5eU90SzM1S3VlT2R5?=
 =?utf-8?B?WkcvZldISld1eWZVRnU2Zml3Nno3cVg0UWU2azNRS3l1eGFaS2lBZjlvb3pG?=
 =?utf-8?B?STkxZ01WUnQrMzZHdkdWc2RjdmJZaG01Y0pMU0pBTnk1YktPaXhBcXJZTXFR?=
 =?utf-8?B?WlhDNDgvYVF1NkkwYTNBQzlQdTNhS2JaU0szaGJqY2ZUeGdMamFRWDgvRFBk?=
 =?utf-8?B?YzBVd1NKYWxCQ2ZmbW5YNC9tQTJYVDZWK3FocWh0V0o2MDlXSkh5ZlFBN3RN?=
 =?utf-8?B?Vld4MUNFVnRTcXVtdTZzSDVCU0ZvOEVFK0NsTjVGdWg4VlBkWWFPcXVWREM0?=
 =?utf-8?B?Tk1OWVlrc1dqSmRSeFN5a2FFRHpaK2paZW9JWnlEaTI4WEVRQlZXM1Bwbkhj?=
 =?utf-8?B?eVFHQm9lTEt6VzJNNUVJUVk1Y01YMzI1V0FTYVJNQTh3QjZvOGJsaytKMzQw?=
 =?utf-8?B?eUk5YlZIZElrR1B3ckhHZUN2dDRwREZsQ2w5TklpSjBXYmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azdJclRjSzF0anBhVjVyMVF0c3VUbDhOTXJWNkl1SmVHek9LMWYyMFFjUnNY?=
 =?utf-8?B?c0J0c3pJWFJkWHo2bWJwQnYzZWQ0WUFtTzNSSTNLekFickF6RDlwTFZDVGtJ?=
 =?utf-8?B?dDhiUTNKcWtFSSs4aUlhYndXdHppTnRBTXV5SlZzNHVIZWwyZUVqZFdrSWtX?=
 =?utf-8?B?c3hNSmtYNVN6V1Jya3MzVGhMeHM4ajh0bGp5MVAvcEdIZzEvT3h5cWc0VnFG?=
 =?utf-8?B?K3FSd0tob3Uvd2RzeWNYSVlhZnM5R28rMmsyWnh1TGRncnMzaGp0Nm1Cbmc5?=
 =?utf-8?B?Wit5VFpkdHFYb281dmVkNHBTbnVvMnBxeWI5emhkUE4vTy9RNXQ3akpBUHZu?=
 =?utf-8?B?MmxmMlFwRWRtWHhXUlpGR3o0L0s4NENrR3JqZXRnVE1FckZ6aGdJSkZPdEhH?=
 =?utf-8?B?eTlTTmNsYU4rWEhMYThXK2hyRWx5aHZpT2JOT0cySWFrdzBadHVEaENlelBr?=
 =?utf-8?B?MzFLZTdMZnlUSDVwODlHTjFweGtlcndPUTZjU1J3ZElLeTJZUlREc3J0WU40?=
 =?utf-8?B?SE51RlBNM3B3SXJqbk9HSjdsb3JZUnJqNzlOTTYrTXlRdHhSNHExVTVrZTdH?=
 =?utf-8?B?LzM0RzB0VC81dmVjSlFSWGZZWllVQjN5R0NMcE1mNTczckpTc3pMQjdFbkZi?=
 =?utf-8?B?THVGV3VtanVMUjNBTzFveWN3UEx4RVNld3ZVTTBwUDhYSW1CQ2kyT3NBL1Rk?=
 =?utf-8?B?ckFoZk5GTW9weGx1bjhSY1dmNHpVNjRqbEVRdWx1cXRnWjZpUzBSdXVxTzNK?=
 =?utf-8?B?cnJTV2dBRElkQ3NYZW1qcStlQmFYYzhUbDdWaUgwaGFVNjIzaEZPbStNc3Vz?=
 =?utf-8?B?NDV5ZnpVM2ZlSUJ1OE5uU0ordFBrMWpBSW12eThpUUdMZ1BnZnk4cC9WNVB0?=
 =?utf-8?B?d1greFhpaWdvYWZ1N2xSWEhMYVRCSGtIYytONDJWN2lmSFZpZXRmU1FRMkVC?=
 =?utf-8?B?L2ZobFM3d0NiWEdIc2dXUjJRWEtJZ2hsMDBEczVUaTBUdGZQcXdVNEJwYVRO?=
 =?utf-8?B?ZldKK1QvTGJ6TUFydDVaQ0xpVzA3dmJrNHhQYUFIcVFwSUUxQWxQWnB4UXB0?=
 =?utf-8?B?QkZ5UTdhclUyc3NqbW5oL1ZYQlNldWtWeTdOTU95UDZsUHVoYis5cExPek5J?=
 =?utf-8?B?aVl2MnhjM2ZSalVSaFM1ZFZUY2lxTWxVbFR3K0FkcXBZSzFKcEJva3RCcXNY?=
 =?utf-8?B?eXNMWS9wR2RvNlVNdXdDdUhuUGd6UitrMGQ5ck5OWnA0WGFlTzlPam1pM0w0?=
 =?utf-8?B?eTJGbkpkQkI0ZFlOY21oVkFNaERiVFUvTng2UFBnSHNqMlFnUm95Q3QwdUdm?=
 =?utf-8?B?YmY4dGE5Q0gyWlV3VDlYbkZGVDBwbER3eDRhYlp2Mjh0MkdJcEY5VS9jb0pi?=
 =?utf-8?B?UFBWV1R0enM5SXVHdE54emUyU0xDak5sbnhIYmZscStrY3Rrek1XSHJpMzBO?=
 =?utf-8?B?amo0Uy8rR2RXQ3lBN1M0RmoxbC82QXhMaVpkU0NBVnc4bGhMWmdFSlpzMlFQ?=
 =?utf-8?B?S1JJcHZ2SWMxcEdBYkxJTG5lcFNRWWRveHZjU0VMdi9ZMXh0L3ljdU4ybndx?=
 =?utf-8?B?Y3NHbUNLUWl5VFBEMGFQdi9lSGdkVjRiVWw0T0Z2K3lMVVIzRGJ2WDJNbVY2?=
 =?utf-8?B?cEJqSytoNDF3eGFRbnNlSTRURFB1MHRYZzNPbkxMMkc2UGJNTEJWSVlDdnV4?=
 =?utf-8?B?U3d0MTI3T1ZKamVoM3lWTU1vbnUzZDlmSDBldkZ5c2hoUzR1TDQ2QU4xQ1pk?=
 =?utf-8?B?aWYxNm93VXBPZ084NWcrWVBxK1ZMUEhTNlpuVlEySTJJMnk4T1NCUWQ5MFFo?=
 =?utf-8?B?NEVneW1SL254TnAxNUg3S1BmT3cxQ0d3eERyU0tUQUpNUTJKVmlabnJPZUw4?=
 =?utf-8?B?TnAzeW5CR0xRZDRsSk5JUmZyOHVzNnNpUEtXVi9sbFh0VnFXeDFhbFh0a2dh?=
 =?utf-8?B?TjFORWhFVEhBQklHMzM5QlJvRzB0SUk3ci9mMHlSWDJYMlV0VXd3YlhUZkN1?=
 =?utf-8?B?WGRSamF2cGI1MHJNeWpzWlpLbzlnK1g3ekg5aDl3THNVZkIrdWhqY0ZBWTJo?=
 =?utf-8?B?YVU3OGFJbDlvbHIrVDJKTUxudFFERFFjejJYWUJUVG9yZ2dVRFNIZ2NKVlQ5?=
 =?utf-8?Q?Na510aZOm0TaV/DgBArFnm6s6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3abab67-78e6-4cd4-d54c-08dcbacd1692
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 12:48:38.8986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jjAAu2DtnHYE/CDIeuq0yiY5nqnoRExK8kNyBpkYwCii3UsE/muTIhna4zJtgSX28dsRS9w70DDpnSSF3PRL8ZPzff2RsaOxVhx/0dkSAiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2hpbWlyYXksIEhpbWFs
IFByYXNhZCA8aGltYWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBdWd1c3QgMTIsIDIwMjQgMToxOCBQTQ0KPiBUbzogVXBhZGh5YXksIFRlamFzIDx0ZWphcy51
cGFkaHlheUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBSb3BlciwgTWF0dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBkcm0veGUveGUyaHBnOiBBZGQgV2FfMTQwMjE4MjE4NzQNCj4gDQo+
IA0KPiANCj4gT24gMTItMDgtMjAyNCAxMjozMiwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4g
V2FfMTQwMjE4MjE4NzQgYXBwbGllcyB0byB4ZTJfaHBnDQo+ID4NCj4gPiBDYzogTWF0dCBSb3Bl
ciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWphcyBV
cGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oIHwgMSArDQo+ID4gICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfd2EuYyAgICAgICAgICAgfCA0ICsrKysNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3JlZ3MveGVfZ3RfcmVncy5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9y
ZWdzLmgNCj4gPiBpbmRleCAyYzhjNGQ0MjE4ZGIuLjkwNTQyNTNmNmFhYSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9ndF9yZWdzLmgNCj4gPiBAQCAtNDUxLDYgKzQ1MSw3IEBA
DQo+ID4gICAjZGVmaW5lICAgRElTX0ZJWF9FT1QxX0ZMVVNICQkJUkVHX0JJVCg5KQ0KPiA+DQo+
ID4gICAjZGVmaW5lIFRETF9UU0xfQ0hJQ0tFTgkJCQlYRV9SRUdfTUNSKDB4ZTRjNCwNCj4gWEVf
UkVHX09QVElPTl9NQVNLRUQpDQo+ID4gKyNkZWZpbmUJICBTVEtfSURfUkVTVFJJQ1QJCQlSRUdf
QklUKDEyKQ0KPiANCj4gTml0OiBzcGFjZSBpbnN0ZWFkIG9mIHRhYiA/DQoNClRoYW5rcyBmb3Ig
Y29tbWVudC4gSXRzIG5vdCB0YWIsIHNwYWNlcyBvbmx5LiBBbHNvIHN0cmljdCBjaGVja3BhdGNo
IGlzIGNsZWFuLiBMb2NhbGx5IGl0IGxvb2tzIG9rLCBkb27igJl0IGtub3cgd2h5IGl0IGxvb2tz
IGxpa2UgdGFiIGhlcmUgb24gbWFpbGluZyBsaXN0Lg0KDQpUaGFua3MsDQpUZWphcw0KPiANCj4g
UGF0Y2ggTEdUTS4NCj4gUmV2aWV3ZWQtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwu
cHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT4NCj4gDQo+IA0KPiA+ICAgI2RlZmluZSAgIFNMTV9X
TVRQX1JFU1RPUkUJCQlSRUdfQklUKDExKQ0KPiA+DQo+ID4gICAjZGVmaW5lIFJPV19DSElDS0VO
CQkJCVhFX1JFR19NQ1IoMHhlNGYwLA0KPiBYRV9SRUdfT1BUSU9OX01BU0tFRCkNCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2EuYw0KPiA+IGluZGV4IDU2NGUzMmU0NGUzYi4uMjhiN2Y5NWI2YzJmIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3dhLmMNCj4gPiBAQCAtNTQyLDYgKzU0MiwxMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHhlX3J0cF9lbnRyeV9zciBlbmdpbmVfd2FzW10gPSB7DQo+ID4gICAJICBYRV9SVFBfUlVM
RVMoR1JBUEhJQ1NfVkVSU0lPTigyMDAxKSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiA+
ICAgCSAgWEVfUlRQX0FDVElPTlMoU0VUKEhBTEZfU0xJQ0VfQ0hJQ0tFTjcsDQo+IENMRUFSX09Q
VElNSVpBVElPTl9ESVNBQkxFKSkNCj4gPiAgIAl9LA0KPiA+ICsJeyBYRV9SVFBfTkFNRSgiMTQw
MjE4MjE4NzQiKSwNCj4gPiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMjAwMSks
DQo+IEZVTkMoeGVfcnRwX21hdGNoX2ZpcnN0X3JlbmRlcl9vcl9jb21wdXRlKSksDQo+ID4gKwkg
IFhFX1JUUF9BQ1RJT05TKFNFVChURExfVFNMX0NISUNLRU4sIFNUS19JRF9SRVNUUklDVCkpDQo+
ID4gKwl9LA0KPiA+DQo+ID4gICAJLyogWGUyX0xQTSAqLw0KPiA+DQo=
