Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BFCC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 20:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287410E187;
	Thu, 12 Jun 2025 20:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oyw6NZS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D87B10E187
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749759804; x=1781295804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aWD5W1RwIK2Xx8WTv6aWRLvoNPZP/x/n07gXna+1giw=;
 b=Oyw6NZS3Jp7H2GF8JbsziMdwT3xpSCHRO6GOWCUY1DJjRqca9yWeIYjy
 n0mgdekJWoecH5dmfVGCl7f4QIBIaQro71zXqSXnHFhO7E4X8A6ayFxRR
 l6Os7SOCorM0oTQnXsm4dut3/TTNiCh42YFOKk2Csqn9SXkb+l08pDmye
 n2sxYr1oWUYAxLDTYZMX7QxPiN2nJUoPv+4Ax3ywVR2sz8elCF8inWXy6
 tOdh00dgS740+cWrRqUEp3MqNEvFpNjH1SUlJsasdE3F0YeIeITgoQNeX
 kCZuyLe4X4O1JGTNgVYg9Dq3P/yGEXDL92lxmam35HNkO9TPaA98Bl2xq g==;
X-CSE-ConnectionGUID: ojrfx2EMR7O1gTl2puCmYA==
X-CSE-MsgGUID: nj6PXDDhTJ+juOycm8XHNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62238418"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62238418"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 13:23:20 -0700
X-CSE-ConnectionGUID: KaTh3fxtQmugS02yHHdbPQ==
X-CSE-MsgGUID: fXtJn+fJTLusUYmzKle/TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="184864325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 13:23:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 13:23:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 13:23:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 13:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yf1E5S4UWJlkoXesJm+FkgrcYRwfFljCUsc3Hpc6rkt26HhlrOpAr+2/zXVuquuD+k/8arIGTmlrEf1gdXDCSWIOcwMfSQx5MUUazF6QsuwTTmzmZNsW+Q7OajZGUYEzMMyYxZVNgNdaWabWp84oU9LVwuuKs31ETW4v2dUAn1SkCqzowrOpaleuUII4KidP/eiSpeKdMDPzzBBTaiwDP0vRzFviCqSXzSMKUiGXzSH0fx19ShM3GIFV3H7gh6QCpWY1bXQUScMrp0tBDG17oL4ZlHO92wqDaSY1LU2C7C+l2OJKqK0K1FPb67tCPRzMXkryqs3Ey2ZjryhkcAzoFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWD5W1RwIK2Xx8WTv6aWRLvoNPZP/x/n07gXna+1giw=;
 b=saVU7QQYi16u3SMb6tIlVa/C5flToEOA+LpBrj8r+a31Xrn231YrrdFQzcuQgBEjqqMgZpON/hMhPUyoQblqdK1qaiR2EAqBuvDGuhM+je5Gn0fmSyPAGM0TgRZWv7ppvffO5yM3BP23xl2yJnLBaPBioGYdSamLir10dJ+MG6VHAeNivbXr5hq5eqZgY2Iml3i7CszyVGK+nPi4nCmEFe3WUF8DHta4og/TTHV2HhseEPspSs98Cq0spa9aFKPiPd5rG8SjQdMcJKGMUxM7YSTCE7TIMtqZ/VcnlPlxQkhZ2LeGKo3ZIaNZlRe7x5OrcH1peWNVvgIs2xeIvRaDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Thu, 12 Jun
 2025 20:23:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 20:23:04 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v4 3/3] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb22jx3OilhmcdxUKYTQ8oA/XCjbP/5dKAgAAEbYCAAA6GAA==
Date: Thu, 12 Jun 2025 20:23:04 +0000
Message-ID: <9ba620913fc7fcaca4dc3f24f9d0d616492b627a.camel@intel.com>
References: <20250612-wa-14022085890-v4-0-94ba5dcc1e30@intel.com>
 <20250612-wa-14022085890-v4-3-94ba5dcc1e30@intel.com>
 <928717cd75ee2ee36dee435d31bd7bbf7ab60f0d.camel@intel.com>
 <rghvmypkecku6r45fef62b2epqkcknz7lp2xim4yubx6akdap4@2skodbxg6gjs>
In-Reply-To: <rghvmypkecku6r45fef62b2epqkcknz7lp2xim4yubx6akdap4@2skodbxg6gjs>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB7716:EE_
x-ms-office365-filtering-correlation-id: bfdcf918-d777-4637-c23b-08dda9eeefb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L1RiNjBKdUxiTVF4U0xUell0TG8yTDhEUUlmbWZHUzZCK1U5THM4MWxxVXJG?=
 =?utf-8?B?Zk40Mk1yanJ4Wnd6RUt5bGx4WUViTGZzVFJQNDN3ZzlMMTRmYnREMURZUVYx?=
 =?utf-8?B?ckJJRWRzSHFxTHFmWFFyMUlxMVFQUE1uMjJodW1QazVYSzFoUkJYdXppdXQ2?=
 =?utf-8?B?dHVqZWJqOHZucnNnbnhSbUF2d1hLOGtvVmVNZ1NEUEtIWGQzYzdMemFscHVs?=
 =?utf-8?B?R1RsNUtGQXhqb1FaRG5UUmJiS2hYL09RbjdHMG54VEU5WGdnc3JhbUF3cUli?=
 =?utf-8?B?WWczZUlWbjQ4UVpIeWJIMko3K1h4anc3bHNtZG5GanFhSElsWTdVQ21rcnN6?=
 =?utf-8?B?blRxa0cyM1ZaZGJIV1hiVGhyZE5Tbi9YaW9Pd1RnZVc0NE5SeG45OTdlS1BL?=
 =?utf-8?B?bVpSOXpxeFJ1SkhBNnFRUUZyMXpiSlZvbVRZYUQ5NXFCeDhOS3BIWENsUTFX?=
 =?utf-8?B?RVNnYmpiNk1VWllhOUVVVjdOUUQxTGFld1FYWVoyUlphUzVlTUpLS0NCd29H?=
 =?utf-8?B?SkJRS0NEajZ4MU9TMHpwZm1FM2k3enpYaHVkMmFzVDhIT0RHeTJLWHJyak5O?=
 =?utf-8?B?cHBlSnV3cGZDeDhyVXhUK0JWKzM5UDVidGE5clFSTElxVjhKa2N1Q1orcjg4?=
 =?utf-8?B?Rmo5RVdyMU9NcTZDdTlsbitSZW1YcWxScG5DMDJFRkNYUXdndG13UVJ5T25o?=
 =?utf-8?B?TE50VCtHTHQ3ZkdzaTRzYWRmK0duS01kUkxlNmZ5WnJ3d1RnTmVvdXRWakVI?=
 =?utf-8?B?Q0NSbjVYUlZGMCtSYTg1c0RrUExnWVh5b3RzajBOQ1NPcmJVRGFYcFJ3TnhC?=
 =?utf-8?B?ekk4Z3IwOC82NVMrMFVZLzhjQ2hldWhaU3loOEpBdm1NQ0lKTGFIV3BmYnJD?=
 =?utf-8?B?NzVtREh4Tk1ZZUtkL1BwMWY2TFJnQUhSaDQwcjBVa2pWaVJYM0FUdmhUQXhU?=
 =?utf-8?B?SmZiUnBUN0hMUGxxbEg0Tlgxd2pOazU4a0ozUlRTWFp1VzdybXVSS2NKazJV?=
 =?utf-8?B?MHBRV3drd2MwNWIxUk9Dc2crSWFOMVhJcnNWNnhaSWUvL3ptTkxVTDRxcHlO?=
 =?utf-8?B?VFdVU1gvZStQWmlQN0Z0enQzUE8xRTlTVC9uNmE5SnFzZUV5Y3RIbVRxWThv?=
 =?utf-8?B?WnZsOXZpY2pPZENhaVRKMkE5VGhEeTNwc1l6T3NnR3FLRkl5Nk13amx5Q05j?=
 =?utf-8?B?UXpvY1hJRURQSWEwWEpGUlYwU1A4U0R6VGIzeXZsc0x4ZkVpYUVnbFNUZStp?=
 =?utf-8?B?VjFmNmdhY28zeStQZkp5Qjg4a2ZLYmpZY0JFQUxueTBMUngwUGVnVWh3RG1H?=
 =?utf-8?B?R1duNzZLajhLMVlwSjJxbWthUnFOeWU3ZTNNUS9BZkZQZDFyRG1IWGpuZDF5?=
 =?utf-8?B?M2tYRGg3c2JSWFVTUXpkRmMya21EUG5vc0dycHdmKzAvb2VSeTR2RmMzeWFu?=
 =?utf-8?B?TGxzNDUxZlVDWFRMU3BaQU9wSHBqMHhybktKQjdQNjRVMU9xODJhb0pqaXZW?=
 =?utf-8?B?ZHRSUVpTUmZnditWYzBoSTh0Zm9mZ3dlWUFncUpzSFE3M0ZUWlhaN3JUVEpN?=
 =?utf-8?B?NTBaYmhQdklGSzdxQ2wyNU9yOGZzWmRGQWlNWVpFcjN3aVpDc2ZQQTh1Wk1B?=
 =?utf-8?B?ZHk2bFVsMEJlK1dHTXJXRWtkWTMwZ29ZWFVxTU1hMWRxVXVYNGZFblZLWmk4?=
 =?utf-8?B?WVVKQUE0OE1wUkFmR1h5SVBNeElaWUtWbHpaa00wa0dTZlJURjFFVkVRQmpB?=
 =?utf-8?B?emp3enNITGpJdnRrMG53SFc1a2dDZEpHTkREWGppRHVFNWx2SkRrV3RIOFo3?=
 =?utf-8?B?SFgyNWxwSUFRbkFQQlFhaitZa3p6R09Gd3l1cnk1TXpSMzFzMnVHQWhoTmhT?=
 =?utf-8?B?WSttOTFBV00wUlJMOUVvNmFvMW1BcU9lamFMOWl1QTFTRHd6N2ZPQkwyZDNC?=
 =?utf-8?B?TmVUYWtZR3JXanVseVhvQnBEME9zU1NlREFRcVo3V0VDWS9tUW02RVJiMml6?=
 =?utf-8?Q?Ad8bduWFZPvu7XgLnbilTo4ZeXFuTY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHRuRFhrMnpwcE9XUURjc3dWR3I3Z3dJdklJYUVqbk1KZklsTVdYUkE2K3lu?=
 =?utf-8?B?NTRpZ2tHS0g3WFpDVmVUZlhvQlIrbzJ0ankrTGVYVFdFd2lnL2VWK1dTdTdv?=
 =?utf-8?B?S3QxcXlQdVFpUVU4MHlORlJGNkFSdEtUdlpkUUgyOFlKTmJYU1VrOE9NeWVI?=
 =?utf-8?B?UHRxSUwyeXVuR3ZYbWUxdnJWRVdIQ0hjbWRHQXdLMnRUNGs2UFVtYitqRzhp?=
 =?utf-8?B?S2VCSUlOR3VyYk5PZ1VGRitLYzJsZEV6U3RSZUZ0NkJ5SmFXTXpXbGZCU2NZ?=
 =?utf-8?B?Y3U0QkVJdFBVeHBiZFkvRGE3TytWSkRhemRNS0pBSEEyUnJSMnNOMlFIZDNo?=
 =?utf-8?B?SHBEUk9QQ0RxbjFBTUhuUnBHK0xVNnVvZ2taaC9FL2hOTzkxTHRWVTJZbVg5?=
 =?utf-8?B?cmNUeU5UVTNMbzR2d0VRdjNWZ3o4OU1BYjlObk5BaHA0L3J1eGROWkU4ZFlV?=
 =?utf-8?B?NTJWVDFsUXlsWnZVc2EvNWtjcldNWnh5KzFZbjZDdHQ0cFdZUnZCdFhXT0tv?=
 =?utf-8?B?VU5RUWw1Y2pMc1pHK3RHT2dUMHVHRG5Dck8wY1hReXZPMm1pOXZDMUJSNWlU?=
 =?utf-8?B?T1lDb29DTlhLUSt4c3ZPRGtXR2lJVGd6VVpGRjk0ZlJHbVdxYURZMHR4ZWpl?=
 =?utf-8?B?S1VzZ3ZHWDQ5QVZjNmwvRDVyMXlqWnR0KzNrdXJ6dlg3eVZ1Q0YzNGorK3Br?=
 =?utf-8?B?aXRTWXVQait0c29oeklkazBXZ3ovR0hNa1pITlRCUXdXTUVEdXBHYVZIVVVX?=
 =?utf-8?B?T0dBNWxnT1FUcTAzQXUyOWVtd1F0NExGaWxlbGxFWStnK0VsUVRUSmpEL2RI?=
 =?utf-8?B?QUkyams1RGNMZEk0cmFnUk5XY2kvSFQwMjdVNlMxTVJXeEhXZVJHTTRCVjE5?=
 =?utf-8?B?WUV5R2h6NSt0dEcwS1FhUU9Ub0s1QzQzRnVXa2tjVWdTUUpwSUdBTkJUWDV2?=
 =?utf-8?B?RU5RakU1ZWF6eVE3VGoxbUhiRXI1TG5jcVV3anhTRFVyaW5MalJFSnVmRGc3?=
 =?utf-8?B?MHpFSUJGVkx2bmwrdklNYjhRS3NNYkdFOGRPWC9HcjNKaTV0eDhFaXQ3RVhT?=
 =?utf-8?B?bUVySDREMlJnNXliWVVtR3ZaZ2pLcE43QkZBT3ovaHl2V0d0Q1k4L3cxVjJF?=
 =?utf-8?B?STZnQ2s5dTZyMkNtZHhVa0UwTS9Gb0J6QlpXcGlJenNjS2R1UlNKZUZaaG4z?=
 =?utf-8?B?TTB0TEIyMU8wMEFqM0dabFJ4Q3ZsSitIWEV2c2s0OWRnZURuZEl6ZmlKbFZ4?=
 =?utf-8?B?YllBYUkvb01kcEQ3ZmZYUXZ1NTJCRThSQlp6TVdLdC9VaTRCbmxvdVB4UGhi?=
 =?utf-8?B?UDdIaHRsNFZMdm5kcTZqOEk1WXBTSWdYODZRRmE1S0VQZndaNnVGM3RlTGIr?=
 =?utf-8?B?SEFSKy8zd0RHOUJ3dXhDQUlnbEpIVHI3Wmd0Y3d3QWRieHBLVXNVWCtCUVhU?=
 =?utf-8?B?WXlmV1hWRE4wK2ZYZEtmd3BMZVEyRzI4L1RBVzh6QjlxaEMrazFaeXozZDBr?=
 =?utf-8?B?dXBZMGc4RUwxVEdmTjQvOGo0RWFpcUwxaDkwc004aG84TjFENDJRdS9NYlc2?=
 =?utf-8?B?VU1vTUhMU2pCZWlLZmtTeFpXVzdWejl0ai83WTQ2WWRlSmloMS9ORmpNQ0ly?=
 =?utf-8?B?MDdCNElTRi9Qa2M3ZThyUVV6RFpJNE1kREhlaSszN3dtWkZGUDV2VktMZ2ly?=
 =?utf-8?B?dFpDeUpVczFWRE5sSWltQnBLNy9HYlZpZU1pOHJqQUFuOFVYdUtTdDYwU2hD?=
 =?utf-8?B?RjlJaDRFYlVPQ00xQ0xqNTlzejhYUEVFM1pyb1ZvNWpNd0pZZ3BiK3RnWGsz?=
 =?utf-8?B?YzM2M0Z5UE5tbTNLcHExcnpSc0d1U1BJWXk3a3JsbmpSSHVBQjZVTHFYZzQx?=
 =?utf-8?B?RGY1YUw4ZUxJMjVRSmxIT3Vwb0NTdHMwWnRGMEpUNkNQZlN2RXpUQ1piemY5?=
 =?utf-8?B?RGNvUUJZK0VJWDlZSkNIQ3NCS29yRnJtd0pyem9TN3FTZ1Qrd0ZoZlR0Qm90?=
 =?utf-8?B?dTRhNkREVlpoWHhvY0ZpdWE1WklzTmovRlJMYzhlajdPYmZjNzRVd29LNWtN?=
 =?utf-8?B?ZSthV2xFbEd0cEJ1K1NEWXRxOTV0ZkIxQjZ3azFvNVZlUHdLZ3NoSVNSUFNX?=
 =?utf-8?B?VDQrd0lqUDl4ZFV4c0EwVlJzaGtzUDk5c3BpWjV1S0JWeWRQK3M2TGNEUWxD?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91BBEEA7B705AA4FBBC134295E6BC6E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdcf918-d777-4637-c23b-08dda9eeefb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 20:23:04.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9a1nalNWkkCA5XZ76hs+ewTe4AkAgXOWafSg6qMcP3AdPQ8smdaiFKj+LlHTsji/9Q8j0JfPzK8OCFA5RqCGj+QtDwE0K+K4dwtnGVKTOZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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

T24gVGh1LCAyMDI1LTA2LTEyIGF0IDE0OjMxIC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFRodSwgSnVuIDEyLCAyMDI1IGF0IDA3OjE1OjE0UE0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9v
b2IucnVsZXMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+
ID4gaW5kZXggNDI1Y2I0MDFjMjc2Mi4uMzhiNTg5ZmU5MTk4ZCAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+IEBAIC01OSwzICs1OSw3IEBAIG5vX21l
ZGlhX2wzwqDCoMKgTUVESUFfVkVSU0lPTigzMDAwKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBNRURJQV9WRVJTSU9OX1JBTkdFKDEzMDEsIDMwMDApDQo+ID4gPiDCoDE2
MDI2NTA4NzA4wqDCoMKgwqBHUkFQSElDU19WRVJTSU9OX1JBTkdFKDEyMDAsIDMwMDEpDQo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE1FRElBX1ZFUlNJT05fUkFOR0UoMTMw
MCwgMzAwMCkNCj4gPiA+ICsNCj4gPiA+ICsjIFNvQyB3b3JrYXJvdW5kIC0gc2hvdWxkIGFwcGx5
IHRvIGFsbCBwbGF0Zm9ybXMgdXNpbmcgdGhpcw0KPiA+ID4gKyMgZ3JhcGhpY3MgdmVyc2lvbiBp
biB0aWxlLT5wcmltYXJ5X2d0DQo+ID4gDQo+ID4gSWYgdGhpcyBpcyBhbiBTb0Mgc3BlY2lmaWMg
d29ya2Fyb3VuZCB0aGF0IHNwcmVhZHMgYWNyb3NzIEdUcywNCj4gPiBzaG91bGRuJ3Qgd2UgYmUg
dXNpbmcgdGhlIGRldmljZSBJRCByYXRoZXIgdGhhbiB0aGUgR01EIElEIHRvDQo+ID4gZGV0ZXJt
aW5lDQo+ID4gdGhlIHdvcmthcm91bmQgYXBwbGljYXRpb24/DQo+IA0KPiBkZXZpZCB3b3VsZCBi
ZSBhIG5pZ2h0bWFyZSB0byBtYWludGFpbi4uLiBpbWFnaW5lIGVhY2ggdGltZSB3ZSBhZGQgYQ0K
PiBkZXZpZCB3ZSBuZWVkIHRvIGFkZCBjaGVja3MgaW4gbXVsdGlwbGUgcGxhY2VzIGluIHRoZSBj
b2RlYmFzZS4NCj4gV2Ugc2hvdWxkIGFkZCBzdXBwb3J0IGZvciBTb0MgV0FzIHByb3Blcmx5IGFu
ZCB0aGVuIG1pZ3JhdGUgdGhpcyBXQQ0KPiB0aGVyZS4gTm8gbmVlZCB0byBkbyB0aGF0IG5vdyB0
aG91Z2ggYXMgdGhhdCB3b3VsZCBtZWFuIGEgbXVjaCBoYXJkZXINCj4gcGF0aCB0byBsaW51eC1z
dGFibGUgYW5kIG5vIHJlYWwgYmVuZWZpdC4NCj4gDQo+IFRoZSB3YXkgaXQgaXMgbm93LCB3ZSBl
dmVudHVhbGx5IHJlbW92ZSBpdCBmcm9tIGhlcmUgYW5kIGFkZCB0byBlLmcuDQo+IGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9zb2Nfd2Ffb29iLnJ1bGVzLiBPciBldmVuIGp1c3Qga2VlcCBpdCBpbiB0
aGUNCj4gc2FtZQ0KPiBwbGFjZSBhbmQgZG8NCj4gDQo+IC0xNDAyMjA4NTg5MMKgwqDCoMKgR1JB
UEhJQ1NfVkVSU0lPTigyMDAxKQ0KPiArMTQwMjIwODU4OTDCoMKgwqDCoFNPQ19WRVJTSU9OKDEy
MzQpDQoNCk9rIGFuZCB0aGUgMjAwMSBmcm9tIGJzcGVjIGRvZXMgc2VlbSBzcGVjaWZpYyB0byB0
aGUgc2t1cyByaWdodCBub3cNCnRoYXQgaGF2ZSB0aGlzIHNvYy4gSXQgd291bGQgYmUgbmljZSB0
byBoYXZlIGEgd2F5IHRvIHRlbGwgdGhhdCB0aGlzDQpuZWVkcyB0byBiZSByZXZpZXdlZCBpZiB3
ZSBnZXQgc29tZXRoaW5nIGVsc2Ugd2l0aCB0aGUgc2FtZSBHVCBJRHMgYnV0DQpkaWZmZXJlbnQg
U29DLiBJIGtub3cgdGhpcyBzYXlzIFNvQyB3b3JrYXJvdW5kIGFscmVhZHksIGJ1dCBpcyB0aGF0
DQpzb21ldGhpbmcgd2UgY2FuIGV4cGFuZCB0byBzb21ldGhpbmcgbGlrZToNClNvQyB3b3JrYXJv
dW5kIC0gY3VycmVudGx5IGFwcGxpZXMgdG8gYWxsIHBsYXRmb3JtcyB3aXRoIHRoZSBmb2xsb3dp
bmcNCnByaW1hcnkgR1QgR01ESUQuDQoNCk90aGVyd2lzZSB0aGUgcmVzdCBvZiB0aGUgY2hhbmdl
cyBsb29rIGdvb2QgdG8gbWU6DQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4NCg0KQ29tbWVudCByZXdvcmsgaXNuJ3QgYSBibG9ja2VyIGZvciBt
ZSB0aG91Z2guIEZlZWwgZnJlZSB0byBrZWVwIGl0IGFzLQ0KaXMsIHdlIGp1c3QgbmVlZCB0byBy
ZW1lbWJlciB0byByZXZpZXcgdGhpcyAoYW55dGhpbmcgd2l0aCAic29jDQp3b3JrYXJvdW5kIikg
d2hlbiB3ZSBkbyB0aGF0IHJld29yayB5b3UgbWVudGlvbmVkLg0KDQpUaGFua3MsDQpTdHVhcnQN
Cg0KPiANCj4gTHVjYXMgRGUgTWFyY2hpDQoNCg==
