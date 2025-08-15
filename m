Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32790CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5710E288;
	Fri, 15 Aug 2025 20:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yzcc2cqa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4C810E288
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755290027; x=1786826027;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Kdc0jIXc417UtAulHmLpbNlvdtqVBjeWZqiE3cQb9Nw=;
 b=Yzcc2cqaB2v3xvXPuzLKWlUINjgWDHDRHB2NLSeFAlpZ7ywZgNADxyVm
 FcLCorvhvhozjWX9F0CxBxUqxeWTgjFcykvvkfyEnrpYX4M8poz6sIEw4
 iQOS6afUpFC890j91gz5dWwPTgqGx/XIr1++OBVdiGxSaMFthJhsij2lf
 R25pio08Bvg+roAOCBahl4Cj/sVrlXPp8wIYc5hz7JI0vLXuNE78cIkkD
 QJx+IMqpsIxXUpKlUADUm5Q0WbM2ZDqAGwwycylGa5uep/DUjmYf2h/9w
 u6YTEsEZdWHsh1CMCHZ9ByboRH8F61RUIuuEf+kvnRQtXCCxWx2Ar2dg1 w==;
X-CSE-ConnectionGUID: 6z67Ap2IQwKw38G5UhBsxA==
X-CSE-MsgGUID: np9A7N6VT0+KGTjadKnJNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="67879866"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="67879866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:33:47 -0700
X-CSE-ConnectionGUID: jQ5Hu76YT3mJBvizP+tT5w==
X-CSE-MsgGUID: EMFjbRrsTXqyKcS5zVhh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167054324"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 13:33:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:33:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 13:33:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 13:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0gENUDxdLS4U7OaQSfDDDLFmHDpNi3Fx8u6RuaWgAkAeXjS59hPUnFpmgMxhwVV9+f3En2zTqR8PEsepEy6Xh97k+AtZb0cZf7avDECe955Q5rR0Ijq7ExLEA4+4mwgHtivhBACY4lsX73CobT9C3CazNyfsPNWzs07uMVFbZ6lMyRKM5HMjO/JOaZ0ACkfThlt6w5IvZus4ibwzSH//wohp79J+itYps0VCA70qpdG2AXoMLdFZN1DIadYUbQnlXpD0Kg1ED6NFD388GlVna2zHH4MDmsY1zKgGmTWC2MIeGMkL/D9YjZLh/6ZgMu2PNI5CFDB3bSBfL4esOYMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdc0jIXc417UtAulHmLpbNlvdtqVBjeWZqiE3cQb9Nw=;
 b=F1sVD2UxdqegSFtsCF/w5TmZBuvc5mRVdDuOIXyEKM1jO5tZOmKeSdrwSFoFTfimNmt1+XpvBRUKIZd6QwB8E5v1NZ0L+3L2is3M9fm2eW994id5Gsy7Rp4PG/2wtpMONP4CQlTY8EfiWJJtVbGQZFlrTyIJiz3tDopie6WGR8NBlnX84IVl0OoHkroRZd8MIaQH/pgsCKK3rGNlwGjgLoJ11+xuHhGQi7LQXHe8fyvJi7RCuKILjHm7Z20zFLFm6g7j4pZXi91TkmMKqLTgBXKssgm7bEs8g/tab88fm8wuMQ+BSUo9SpqmpPW1AAvo8vTI7DGCbA6Jsy/DKMlj7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by DM6PR11MB4546.namprd11.prod.outlook.com (2603:10b6:5:2a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 20:33:43 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::b6c3:37a3:83ff:3b75%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 20:33:43 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kassabri, Farah" <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Thread-Topic: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Thread-Index: AQHcDIs3JbvXFKypOkmekO4Jnztm0bRhFscAgAABaACAAxaAgA==
Date: Fri, 15 Aug 2025 20:33:43 +0000
Message-ID: <ea6baee7c2251d5c3c1a7f382ec7eb03fde78fb2.camel@intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
 <20250813194806.140500-3-stuart.summers@intel.com>
 <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
 <aJ0ChtKtA9O8vcVv@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ0ChtKtA9O8vcVv@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|DM6PR11MB4546:EE_
x-ms-office365-filtering-correlation-id: d40fb8b3-3d47-44af-5482-08dddc3b0722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0lLSjZKTk4wLzdBcVBtZUZEOGFyaHJBbW1KbCtlQ2JPZ1UybHlJTWtFQXNI?=
 =?utf-8?B?UDZZTlQ2NHljUDV3ZGJjVlRpOWluTXpZeWcwZ1NlZFhieUFHV2o2Z3Nadko2?=
 =?utf-8?B?ZmZjTC9DV2IwdmdVNzVBR0JXdTVPeGhoQ2M1eDlWTzVMbDRRamxrOEVxMGtw?=
 =?utf-8?B?MnhLdE8yNGR6WDQxSzNLVWhuc1laZ1pxWk5PcUNYZUR3N2lyRFVaODBxTzN3?=
 =?utf-8?B?SXM1RmNDbnNYcDB3UFJDbjF3RG5qMURDWTl0TmFud2MzM0Q5RHlVRWo3ZXQv?=
 =?utf-8?B?VzUwQU9kdTF2VlpEcXIyOFVGcVh3VnRBSHNLMEV2bTVaNmlkVXEvQmF5K3ZG?=
 =?utf-8?B?ZmFwaXBHZlBsMStGUWpaVEh6akNqN25iOHgyRkpUNW1SUHd5OFliSWhHNW91?=
 =?utf-8?B?bGdkZFpBMWQwSVFNZlpQQjVTQ1kzRzZ0Rk8wTUgwcnErN0xsMzNkT2JaUjNS?=
 =?utf-8?B?aDBJNVd4blNoeDNsYk84dmQ5UW1TRVdYcktKVWdtUWdpOXlyZkVPUnJ2cXBT?=
 =?utf-8?B?cVNsNEhLdWFBTWNPdmx0d0lyR1hwNjFhMGFxWG1CdHZnelEyQzg0VGxtRWpi?=
 =?utf-8?B?ZW5HNXNETkkxajVvcGl5Uy8vdEttbjJ5M1VBYXRpY256d2tKK09yNTNzSGVM?=
 =?utf-8?B?UzVsR2RJVTFsQWZLK3pBUXQySVNud2FvVHAvdFl6THU4Q205aEY4Q3V6RU5y?=
 =?utf-8?B?cTBZWVpvTzlGQXpQcCtpUHg5NWVtcC9HL0JoQW1IbTh6TStDdzgyTUk1VzJ1?=
 =?utf-8?B?OHdqc2NLcFdTZDZSNGJhOFhXZ3M4YndIcVRFaGx4VXVXZjE3Z1loa05pWUUy?=
 =?utf-8?B?MGNQTG1HOVBYTHVSZUsxelgrbGNmWG13c0ZKUnYwTUxwelYwaTc4Q1NrSnIw?=
 =?utf-8?B?RDRkUFVWeXVxQUpxNVgzSWFhMVdrd1FDVTE3NE5YL0JnT2NvV1cwMElUcHhU?=
 =?utf-8?B?VDYvcjBJTzZpRHlleFBPMi9qSURnZERENE1qOXlTV2J5NWJ6WU85cHBBVFNm?=
 =?utf-8?B?SGtmaERFNnpyNUpWQTQxWHdsOWRyRlQzUVVQUlVBeEx3ZnRQT1AzMnFaVTVU?=
 =?utf-8?B?OTk2MHVOMzVHOWFhL3RPdm03TmJycE5FQzJvYTJtUXVnbGNPL2JrdlB2SDRY?=
 =?utf-8?B?UmkrNUVuV3pqbGQ3bU9qT3RIdlRLS3ZNUlpzdzZuQWhlUGtqeGU3aUNMeCsw?=
 =?utf-8?B?RnJkcmJnRGNHNmJSZWREMzhBWlJoZkFEeWlNTFRHL0FNTE53NUZyUnRHbmFX?=
 =?utf-8?B?MGh4dE1EWkdxdTFzaDFyenhKS0JCdm8wTUFKb3dkTC9IOXVRZlBFYnZKN25y?=
 =?utf-8?B?VytrKzJZS2xSU0RQcitUMk03ZVNFY1dyVWpHVFd2d1cvSGVHV0p4eFZDL3RB?=
 =?utf-8?B?NWtFcmZnVlpsK0RNMExPRUJkYzNNWXFQOUxCN3haR0l2d3phR2pUelVPaGpS?=
 =?utf-8?B?Wkt1M3VmZmd4dmwvYTJycWE5NllzNjQzaFhNcU5EMlFRVkkwMzl6KzMzTmR0?=
 =?utf-8?B?bko2OG9yZ1hMQ2l5ck1XMWMxTmpINys5dzJYRVBvY09mV3VRc3F4UXlWSndr?=
 =?utf-8?B?R1EwQXp1TnNnS25LY2ZaelRrM0MrbkM2MUNPM05hcUdEQjJyN0NPQkhIaC9l?=
 =?utf-8?B?aHRLdHNGblJWRm1ZaE5jTkVCM28rdkF6czJraDFpc0pYRDVJcHVTNGFYNnNU?=
 =?utf-8?B?QlU3RlF2TDBqcDN3VlpmQmFxL1JpYldlcXhMMWpJeUFCS2tCdHJVK1lCd3Jn?=
 =?utf-8?B?WUx3WTlaR2Q5bDhyTmNNZWpnU1owRjVpTU5sdXBBbkNwNXlZMjNqa1dCUTBi?=
 =?utf-8?B?c284UmdyaURMWCtrNmxMRUFSU0x0d2ZybDJIRzBSRXhZMktOSk1DeHNHbE5T?=
 =?utf-8?B?enQ4MGZOUTEvYTh6dVVudHVYcDVKN2daK0tLdFFmZEV6RWplRUFTdjNEOXZ2?=
 =?utf-8?B?RkxOV01LRGQzZ3VLN1ZOVGhNNjZTd3M3YmZFcXFzb0J3TTl0Q2FXYnRlQXRO?=
 =?utf-8?Q?et75hfNW7eHQJNkvS5/Keq+iwdEQrA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzkyWm54OEhOZFBKNDVRYnkweEdLV1FnemZyUVNRSDBuUnlhay8vQ2VaUjdQ?=
 =?utf-8?B?R29mWTRMMlgrQXdjVlF5Z240UzNLOTlqYkczamhYZU5xWkVPMnlCT3BGcTY1?=
 =?utf-8?B?WHBtRzh4U0htVlQzMlV1c2wvOU5XRDdWZjg5cTFqeDE3NHhxSVREY1pDNE5P?=
 =?utf-8?B?c2k1eG0vY0VxOVNFRUI5VlFJcXMxVlhNK1dXSnRmVzlaQU1reDBWbFE5dTVk?=
 =?utf-8?B?MWlHUVVZRG5zTnZFd1pNWDJvUnc2R2dkMVhDZUw0U1ZDZ0gvL0JmamFpNUF2?=
 =?utf-8?B?Rld6clVnaGRGWDZPNXNNNVVjdUFIK3ZOVmFtWTYvcU9xRlV3N0NKL2cxbkZi?=
 =?utf-8?B?TGJrSkM1bnFjSGZMS0I2WEhNOWFjUkZsRjc5ZWs3M1JRRG5kRGZFQkJlNXNw?=
 =?utf-8?B?ZHI3Y2J5eUlwSlpjWFFYeWpzMVRLemZ4VWhVMEFLTWJFb3FKS2xBN200RHVM?=
 =?utf-8?B?Y2h3Qkh5UklmUzUwd0ZQQ2VZRHRhckp0UWxnSG5Ba1kyN2I4WmMxSVF1TERP?=
 =?utf-8?B?MjR4NG9Gcys0c2o3ME5jbzl5a3d3MEwwdHV2Q2JpRWh4U3FIQkp1MmNJNWRs?=
 =?utf-8?B?UkhxbHVQTVVCaEpmNjRoMytod3NJV2ovRUFkdzBYM0R3aHBVN0RycjBJZXNh?=
 =?utf-8?B?S0o3dmJ2Vi84L0o1WWNXa3J0Mmh4SXppcUM5L0QrODBGVkNOL3h2b2xZL2RL?=
 =?utf-8?B?ZkVPam9PUmVmeHlMemdXMGg5YkttdW9NVENPcThRS2lGOE95VEJlMzZJKyth?=
 =?utf-8?B?RnZNY1U2YnRYSzFVU011Z2VhTHRxVWU3YmNieUsrMVRpTGZLZjA5YTB3M013?=
 =?utf-8?B?VzZpNmc4dmxvdjFHZkQ1SVowdWxzNlI3V1F4cks3TzBvK3NlcU5KWGZqOTIr?=
 =?utf-8?B?NzIyVWM5TTFUblV5TVhDTFFvWWZjTHIraGl5WlFLeUhWV0VMcHl6cEZ6QlhW?=
 =?utf-8?B?R2xSWm14K0FiczVpWTNVY1QwcSt4MTd5eDkrRVZ5aWJXeExxenowYVI3WGg5?=
 =?utf-8?B?M1N0UC9zN2tLN3VUUFlnY0pHdldmMzZHaFlyQklFS1llUmFJN2JLeTd4NnVo?=
 =?utf-8?B?TFJpZTJGOVJWK0RnNFMwRGVjZ29ybml3RmFzdHdITXJsTm1oQTg0OUltSkVo?=
 =?utf-8?B?ZElwOEVjV1ZBNHk3UTNjYkdQdStQZTZqY2czc0IrbTR0d2xaRDk0eVZXQjd5?=
 =?utf-8?B?dHFNTTBURDFQZ2pBbjI1bkJkUXZubnMxcXYyRkNlTlpBQ3FNNWh1dnlTQ3pQ?=
 =?utf-8?B?NnJCL0Z6azE0QUkyRG56WVFlRFJpVWNyenAyVXE2UEUzUzFqR0t0QmxPN2Rv?=
 =?utf-8?B?Q1BRWkgyck45QUlRaDZlV1F0VXk4eTQ2dVE1aWJ6MVhjSzZzVHV4Q05MTW5o?=
 =?utf-8?B?Zkt1Z0RydW13eGVINU9qeThyQk1oSWlnMlZsNkFkYnJLUHhwaXpYbVF2K2Vz?=
 =?utf-8?B?RHZ4VzdYdzltT2cyT3VaL0tBMTRkTk5KSHhUdEMxcW03UlJPaGp2dTZ2dFc4?=
 =?utf-8?B?RnZxTHA1U3hWQ1lmZW1DNEwyS3FzUWVkc2Z5VDhueDFtS3VraTduVmt2NU1R?=
 =?utf-8?B?enNZVXE3bmtHWnp6cm5lNzk5anBTaWxSZ0JHTFRjdkhXZUlWR0R1L1cxVU1T?=
 =?utf-8?B?djhnQ2dQa1NNSFdPSXYzbkhMUm5SSktjZTR5YVBnTk1rYjRmVmxkdzk3dHha?=
 =?utf-8?B?QzlQZ0o3NWxvOC93RDU0UGg3cXVOMW4yNTN1OWhXc29qNTlvdzVPT1VsZVk4?=
 =?utf-8?B?a21Dc2lWdGFiUHBMUXZDRzB1b0h4dnBSSnpnRFpkeEoyYTVtWXp0NWNkRTB6?=
 =?utf-8?B?SVVmSkpEaDJuNWp4MGwzc1VLaXRVTmZxMGFCNE9qRHgvZVduQjN4QU12RnFP?=
 =?utf-8?B?elptdU4rVWUvUHZRWnJEemhBc2phUUxMZ1pGUHhKRFhhNHVqRUdMMVYvZms3?=
 =?utf-8?B?VWo0ZjlwekloQlVDOHJoVGU4THBhTEJkZlRkdDd4RE1pRGFWc1U5Nmc4WU0y?=
 =?utf-8?B?WGJiR1dyb0ZJZERIWUZYKzROZHYyOUFwMlFHTEVaK2JNOG9yeDBMc3JxR1Fp?=
 =?utf-8?B?Y3FFL0xYTFZ1ZndwUTN4SHR5N2d1QzNySWJoMUJ4V3JoYWovTExuc3kzYVg4?=
 =?utf-8?B?dkJaWERlViszeUhLajdnWVlDSXMxTkc5d0hzTHMwbXl6VnFXMzlRUk1UczRv?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <105324A3D4CBE5459D0C6F5EBA548C9C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40fb8b3-3d47-44af-5482-08dddc3b0722
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 20:33:43.6707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cSv5QgTRtqzb3pZ8oAOwfRCmgFZuTuiR0UjNZK582Ef7GOe4PuiVvve39PHqdbhfuCWSL9bdLqyi9/Gh/+X6IJuKtd3kcBEOw78VXIGBOAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4546
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

T24gV2VkLCAyMDI1LTA4LTEzIGF0IDE0OjI0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEF1ZyAxMywgMjAyNSBhdCAwMjoxOToyMFBNIC0wNzAwLCBNYXR0aGV3IEJyb3N0
IHdyb3RlOg0KPiA+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA3OjQ3OjU5UE0gKzAwMDAsIHN0
dWFydHN1bW1lcnMgd3JvdGU6DQo+ID4gPiBUaGVyZSBpcyBhIHNtYWxsIHdpbmRvdyBvZiB0aW1l
IGR1cmluZyB0aGUgZHJpdmVyIHRlYXJkb3duIHdoZXJlDQo+ID4gPiB0aGUgVExCIGludmFsaWRh
dGlvbiBmZW5jZS0+Z3QgaXMgc2V0IHRvIE5VTEwgYnV0IGFuIGludmFsaWRhdGlvbg0KPiA+ID4g
d29ya2VyIGlzIHN0aWxsIGFsaXZlLiBUaGlzIHdvbid0IGNhdXNlIGFuIGlzc3VlIGN1cnJlbnRs
eQ0KPiA+ID4gYmVjYXVzZQ0KPiA+ID4gdGhlIHRsYl9pbnZhbGlkYXRpb24gc3RydWN0dXJlIGl0
c2VsZiBpcyBzdGlsbCBwcmVzZW50LiBIb3dldmVyDQo+ID4gPiBhcw0KPiA+ID4gcGFydCBvZiBh
IGZ1dHVyZSByZWZhY3Rvciwgd2UgYXJlIGxvb2tpbmcgdG8gc3BsaXQgdGhhdCBzdHJ1Y3R1cmUN
Cj4gPiA+IG91dC4gVG8gYmUgc2FmZSwgZ28gYWhlYWQgYW5kIGNhbmNlbCBhbnkgb3V0c3RhbmRp
bmcgVExCDQo+ID4gPiBpbnZhbGlkYXRpb24NCj4gPiA+IGZlbmNlIHdvcmtlciB0aHJlYWQgb24g
X2ZpbmkoKSBzaW5jZSBhdCB0aGF0IHRpbWUgd2UgYXJlIGFscmVhZHkNCj4gPiA+IHRlYXJpbmcg
ZG93biB0aGUgZHJpdmVyd29ya2VyIHRocmVhZCBvbiBfZmluaSgpIHNpbmNlIGF0IHRoYXQNCj4g
PiA+IHRpbWUgd2UNCj4gPiA+IGFyZSBhbHJlYWR5IHRlYXJpbmcgZG93biB0aGUgZHJpdmVyIGFu
ZCBkb24ndCBuZWVkIHRvIGNvbnRpbnVlDQo+ID4gPiBtb25pdG9yaW5nIHRoaXMuDQo+ID4gPiAN
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IHN0dWFydHN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVs
LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2lu
dmFsaWRhdGlvbi5jIHwgMiArKw0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJf
aW52YWxpZGF0aW9uLmMNCj4gPiA+IGluZGV4IDc1ODU0Yjk2M2Q2Ni4uMDhlODgyNDMzYjEzIDEw
MDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRp
b24uYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRp
b24uYw0KPiA+ID4gQEAgLTQ0LDYgKzQ0LDggQEAgc3RhdGljIHZvaWQNCj4gPiA+IHhlX2d0X3Rs
Yl9pbnZhbGlkYXRpb25fZmVuY2VfZmluaShzdHJ1Y3QNCj4gPiA+IHhlX2d0X3RsYl9pbnZhbGlk
YXRpb25fZmVuYw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChXQVJOX09OX09OQ0UoIWZlbmNl
LT5ndCkpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsNCj4g
PiA+IMKgDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYW5jZWxfZGVsYXllZF93b3JrKCZmZW5jZS0+
Z3QtDQo+ID4gPiA+dGxiX2ludmFsaWRhdGlvbi5mZW5jZV90ZHIpOw0KPiA+IA0KPiA+IEkgdGhp
bmsgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jIGlzIHdoYXQgd2Ugd2FudCBoZXJlLg0KPiA+IA0K
PiA+IE1hdHQNCj4gDQo+IFdhaXQsIEkgd2FzIHRoaW5raW5nIHRoaXMgd2FzIHRoZSBmaW5pIGhh
bmRsZXIgY2FsbGVkIGZyb20gZHJtbS4NCj4gDQo+IFdvdWxkIGl0IHdvcmsgYWRkIGRybW0gaGFu
ZGxlciBmb3IgZHJpdmVyIHRlYXJkb3duIHRoYXQNCj4gY2FsbHMgY2FuY2VsX2RlbGF5ZWRfd29y
a19zeW5jIGFuZCBzaWduYWxzIGFueSBwZW5kaW5nIFRMQg0KPiBpbnZhbGlkYXRpb24NCj4gZmVu
Y2VzPw0KDQpPb3BzLCBJJ20ganVzdCByZWFsaXppbmcgSSBoYWQgb25seSByZXBsaWVkIHRvIHlv
dSB0aGUgb3RoZXIgZGF5DQppbnN0ZWFkIG9mIGFkZGluZyBGYXJhaCBhbmQgdGhlIGludGVsLXhl
IGxpc3QuLi4NCg0KQW55d2F5LCB5ZXMsIEkgYWdyZWUgd2l0aCB0aGUgZHJtbSBwaWVjZS4gSSds
bCBoYXZlIHNvbWV0aGluZyB1cGRhdGVkDQpoZXJlIHNob3J0bHksIGp1c3QgZmluaXNoaW5nIHVw
IGEgbGl0dGxlIHRlc3RpbmcuDQoNCkZvciB0aGUgc3luYyB2cyBubyBzeW5jLCBJIGRpZCBzb21l
IHRlc3RpbmcgYW5kIGl0IHNlZW1zIGxpa2Ugb24NCnRlYXJkb3duLCB3ZSdyZSBpbiBhIHJhY2Ug
Zm9yIGRvaW5nIHRoZSB3b3JrIGNhbmNlbCBoZXJlIGFuZCB0aGUgYWN0dWFsDQp0ZWFyZG93biBv
ZiB0aGUgd29ya2VyIHN0cnVjdHVyZS4gU28gY2FsbGluZyBzeW5jIGhhcyBhIGNoYW5jZSBvZg0K
aGl0dGluZyB0aGlzIFdBUk5fT046DQpzdGF0aWMgYm9vbCBfX2ZsdXNoX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrLCBib29sIGZyb21fY2FuY2VsKQ0Kew0KICAgICAgICBzdHJ1Y3Qgd3Ff
YmFycmllciBiYXJyOw0KDQogICAgICAgIGlmIChXQVJOX09OKCF3cV9vbmxpbmUpKQ0KICAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsNCg0KICAgICAgICBpZiAoV0FSTl9PTighd29yay0+ZnVu
YykpDQogICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KDQpBbHNvLCBhdCB0aGlzIHRpbWUg
d2UgZG9uJ3Qga25vdyB3aGV0aGVyIHRoZSBHdUMgaXMgZnVsbHkgdG9ybiBkb3duIGFuZA0KYXQg
bGVhc3QgSSd2ZSBiZWVuIGFibGUgdG8gb2JzZXJ2ZSBpbiB0ZXN0aW5nIHRoYXQgYWN0aXZlIGlu
dmFsaWRhdGlvbg0KcmVxdWVzdHMgdG8gR3VDIGNhbiBzdGlsbCBjb21lIGJhY2sgYXJvdW5kIHRo
ZSB0aW1lIG9mIHRoaXMgY2FuY2VsDQpkZWxheWVkIHdvcmsgY2FsbC4gTWVhbmluZyBpZiB3ZSB0
cnkgZG9pbmcgYW4gZWFybHkgc2lnbmFsIGhlcmUsIHdlIGNhbg0KcnVuIGludG8gaXNzdWVzIHdo
ZXJlIHRoZSB0cmFuc2FjdGlvbiBpcyBhbHJlYWR5IHNpZ25hbGVkIGNhdXNpbmcgaGFuZ3MNCm9u
IGRyaXZlciB1bmxvYWQuIFNvIElNTyB3ZSBzaG91bGQganVzdCBsZXQgdGhlIG5vcm1hbCBHdUMg
dGVhcmRvd24gYW5kDQpUTEIgaW52YWxpZGF0aW9uIHNpZ25hbGluZyBoYXBwZW4uIFRoZSBvbmx5
IHRoaW5nIG1pc3NpbmcgaXMgdG8gY2FuY2VsDQphbnkgb25nb2luZyB0aW1lb3V0IGhhbmRsaW5n
LCBiYXNpY2FsbHkuIFNvIHRoaXMgY2FuY2VsIHdvcmsgY2FsbCBpcw0KanVzdCBtYWtpbmcgc3Vy
ZSBpZiB3ZSBleGl0IHdoaWxlIHRoZSBDVCBjb21tdW5pY2F0aW9uIGlzIGhlbGQgdXAgKGxpa2UN
Cm9uIHRoZSBlcnJvciBpbmplY3Rpb24gY2FzZSBoZXJlKS4NCg0KSSdsbCBoYXZlIGEgbGl0dGxl
IGlubGluZSBkb2N1bWVudGF0aW9uIGluIHRoZSB1cGNvbWluZyBjb2RlIHVwZGF0ZSB0bw0KZGVz
Y3JpYmUgdGhhdC4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+
ID4gPiArDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfcG1fcnVudGltZV9wdXQoZ3RfdG9feGUo
ZmVuY2UtPmd0KSk7DQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZmVuY2UtPmd0ID0gTlVMTDsgLyog
ZmluaSgpIHNob3VsZCBiZSBjYWxsZWQgb25jZSAqLw0KPiA+ID4gwqB9DQo+ID4gPiAtLSANCj4g
PiA+IDIuMzQuMQ0KPiA+ID4gDQoNCg==
