Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC127C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 06:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4C910E013;
	Thu, 30 Jan 2025 06:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GR8A30ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9910E013
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738218917; x=1769754917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j/1kYP1WPx9gG3YxY171Ezg/k3hkIGLdV7gZYE9+QAY=;
 b=GR8A30adTLXIT7HXQhioJ03+TISyCFNmCOSm/jxF5kl4IFlgk7/335Cj
 59OsA6IL4bii+hLRH3touzBqNFEcuM4f9K8owG2YbIDh+tQ+Slmi3dwoc
 bBua7bO/pry/koO6HEi+0MFWK9fpz9c16WO/QOlkaBvKRGlgmOqedjibp
 Acw9pn/NDT+dsZdGNL27g/3gLW8hraJN7ZOf8DLduiEMi9dQiA99I6ioz
 WvnACIymFtuUdJdJQMJvLqesQqpnvH/x5p+lKdxxObDoeJvSeHsUr8E2k
 wWbnlZkd1GypSTpQGhTLme2ThAen/zMuLjRkG6ccTEa2CTNiK5Ew7nChq A==;
X-CSE-ConnectionGUID: rN7MTzwERkScFZ7Ni+CEPg==
X-CSE-MsgGUID: c76WcrKfQsSOVQv7op6XOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42412000"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="42412000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 22:35:17 -0800
X-CSE-ConnectionGUID: R6GKXwadRFq/afj9P5pRRA==
X-CSE-MsgGUID: tCAeqrWjSX21Oh7T7ffZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109095485"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 22:35:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 22:35:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 22:35:16 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 22:35:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqUrVR5IllPNcoYmRDDFoOp8B0CGSjgqm3k5+HfF3h32pFisxT1GnJaksnzCLxtwDCc4B6mMdcl3xLaX57RPD5nlKnmkOQUyhasM2zX4PM2QF7ohLggVTD1+Y9EjBSaxoPiGfmtKFZ6jInaQ2Xk0JJXEESQdBqdSMMW7dN8ScyxkNQ8q2IaychCPhFDCH8QqdLpy/mQx+gVIqGCXXwxhKcdSrlwPjgrX+de3h8ZhT1cBd7GA2fBgr0+nbh0iFkdpUD/vqTDoQulAi/9SrQFE5BD927FrHHPOZCL1sQWPR7i5GFXZOpos7YdbvZZ7TtBvGXHyHFjDgUnLIqcckJCZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/1kYP1WPx9gG3YxY171Ezg/k3hkIGLdV7gZYE9+QAY=;
 b=rXnq8WiMbalhxP7j2XIm173vAEcuKvFIUebekxXZVj+/g1AfJ70AzrAqVrEWXz28XPGCzIbNzOC2dGfgNi5wIv8XygpcdZk8EADZXv21TcUB2d47z/s0tTyQGA6aOkWQ3qKu7RMGG0je/FuVLtemPIwVEaFssXlzIXUJP7O+VQZaTxlEi8RGhiK6kgDnFb4u6YRkFjv8YIldttO5w8eOOJJ4eD68I8aGe3gMGzDnxoSnynBbvsjmfUNqLSjYGxIMbVLVIzAvsLGb5fMHgz960ivn01AXjP2qeOG44tliPVYPoGkE117j2l3hRYAuQWHEMLgfJFQFevbzx2Aq4mU8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 06:35:08 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 06:35:08 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
Thread-Topic: [PATCH v6 2/3] drm/xe: Enable Boot Survivability mode
Thread-Index: AQHbcWgj9JUpM5c5skCa8W0kIS57QbMtWsTAgAGEB4CAAABQEA==
Date: Thu, 30 Jan 2025 06:35:08 +0000
Message-ID: <LV3PR11MB8695762B5D708BC7D18A2730F9E92@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250128095632.1294722-1-riana.tauro@intel.com>
 <20250128095632.1294722-3-riana.tauro@intel.com>
 <LV3PR11MB8695E4F9F25BC4D3E1638459F9EE2@LV3PR11MB8695.namprd11.prod.outlook.com>
 <df142c48-704b-4b79-9e65-61937a4cce40@intel.com>
In-Reply-To: <df142c48-704b-4b79-9e65-61937a4cce40@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DM4PR11MB5995:EE_
x-ms-office365-filtering-correlation-id: 2f927271-36f5-4f5b-c6cb-08dd40f83d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TmxSOVhWM0s5MmF6ekFCWnB2VU44ZzB0dUd0Ums0NjczNlVRcXlOVkxLUUJj?=
 =?utf-8?B?bWhSQjV3OWFlMWdMR2RWZnI3YWV2ejNmQk1RclZZUkFvd1hqTGMzWWdiQXIz?=
 =?utf-8?B?VVBFdkFTam1ZRGdkSmNwSS8zdm5hL2kxUnJhak9PQVNySjZrVUtmZXhMUHYv?=
 =?utf-8?B?dWFrVXZMK0NuQ1lNVktsaThqQVhzdlFvUzRWaUEzTmRzWGhDSnBXMUxsL00z?=
 =?utf-8?B?NkNWNVBxN01UUG4yKzI4cHJmbXR5SnowWElZaG1OUlpBMUI1MnZ5Vktnanps?=
 =?utf-8?B?b0lwRTVURExmU3hNc095U0orZWRTSU9ocWRETEJMUWROTjlrNXg5TmdoMDk3?=
 =?utf-8?B?WERidUhKdzVVUWZlN29pREgyV05rVnlEcThnRTRobnZhNnJVZVU4TCtWbUls?=
 =?utf-8?B?TXMySkdudkZkYmkvVDlLa1BPbGVTK3lubXhNSnBFUmRHdlNMVjJPVnJ3T09i?=
 =?utf-8?B?OHlBRWplR2RxMFpSa2gvV1lvWkU5TitRWGVkQWJUZW1LRGIxRENmYk05d2VX?=
 =?utf-8?B?OGNhQjlGYyt3ZjFzdGdla213R3FSMTJDVzRvMmNvakFHalRPMXhPaExRVGRl?=
 =?utf-8?B?TzQ1SGlCTWllUGVXQzhsVjlVY252ajJUM0VMdTVQRWJYUXYwT3NnMHlLTG12?=
 =?utf-8?B?NzQxQlVzRWlkRHhYQ3hoZG9wMGhlZXlBS1VRWThQU2JtM2lOTnIzWTBmUVd5?=
 =?utf-8?B?a2o2cmlpVUw1bWd2VFhwOFYrQndVNFg4N2ZiTFdWVFM4TU03SWR1UEJRMTQ0?=
 =?utf-8?B?eldObEZ4SEF0K2UzZGNpU3h4enRLNWFpWWVGWW1jOHNVekJkUGlUSWpEdWhy?=
 =?utf-8?B?S2FaK1YrQm5XVVEzYjQxa3IxbTBTbzA5cGVSemIyalRxa1JxT1BEVzlLV0NQ?=
 =?utf-8?B?azZWaG1CUVNOVmJHa2ZPVTM3MllLdHBRZlVtQmU1VmVabHUvbStHVEphMEhF?=
 =?utf-8?B?UWplSE92bkNxOUFueFFQOForcTVLZ2ordWtFN0x2NzluTFo1czI2ZDRZdFhT?=
 =?utf-8?B?cDBsTUhtaFlKZmUvYmRwQjdObTYxQmpyZklSWmZZTTNNWEx3ay83Z0RVQjY5?=
 =?utf-8?B?b2V1NnRVODlMMXlDWmtIaitqeWFOcHptcncvcVA0eDJPcWpINndtMDFKYk9E?=
 =?utf-8?B?eFV6TFhDWExYNllmeTBuZDZhUFJHM3Q2MzRiRzN1Q1dscTBOdEJlaldWc21I?=
 =?utf-8?B?NjczWVFTTnd0K1FtWFZtUlBab1d6YldtbnhkbG1Hb3I0dkN5OTNzdXVEejU2?=
 =?utf-8?B?WnBXN3hkSVM0TWIvSEwydEZnL3BLb0RXSGpsdGtiR2NheW1RRXRWalBOUG43?=
 =?utf-8?B?cHYrY1N4MnNzN2xuTFl3dGNGd1hDY1BTZjNKWFh3UUx6R2FoWWFtSjdHQ2c5?=
 =?utf-8?B?WVBvemtGMXcvR2NVeXZ6M2JnTElQUXdVc0VSZE5LUjhhVzRVMHNCbzlnWTBk?=
 =?utf-8?B?cmRCbW5NN0NDemxGd0Y5N3JGbEl4L0NwSmQ4Q2N0bWdVSllmNzJrTDZuMDNT?=
 =?utf-8?B?R05DbVk5bzRjOTdONnlvTFFQMjYrZ2FGdWZBajQxRVFJeWpLZVBBMlJjaEp4?=
 =?utf-8?B?TVhxN0J4RHozRnJEODlMU0c5d2NBVFhOZWJ1K2tyaGt4VWlmRGJycXJBQSt4?=
 =?utf-8?B?S0d3aGVqYVY4MDdSVE8zSGRUZSs2Z1VGOXNsK2NPWHUxOTcyZTkrSFNsVGtW?=
 =?utf-8?B?RWw1a2Q0Q2wrVUorbWhzVGFqeVU0eTFla2xBSWlIaVFpbm5mL2ZnTnFXckVD?=
 =?utf-8?B?YnFsOWJaNlhkMXlEU25xS1ZNRDgwVlVxd3dMaGVNT0Vqd0w0VHhieE9uMkVW?=
 =?utf-8?B?RVcwV2xiUktrdmtlbXpzUWZNSldtTlc5UUNmT216SGgvQnc4UUdTQ2RrOHZC?=
 =?utf-8?B?Q25wOWMzcHpIVmxWams3Um1UM2k5ZXN2eEhWbTAxTHNSVGhEbm1sTUNwY1dS?=
 =?utf-8?Q?o08rUe8JJ1k7T+FsrfAAF9VNYAq7MdZU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N092YkN6VzFBdGwxeCtQcldRaTVBb1dqV3NuWDFFNXlOTDhVbFVEclNTQjBo?=
 =?utf-8?B?dUZES2pCNzFPZ1RnNjYyQVpITk5DVHRaNWtCRUp6RHpxMHRuZWF1ZFB2S0hz?=
 =?utf-8?B?TE1HU2UzZEN3K2xibjd1N2RyRHdCWm5pMkRpNk1zbys5c3BIV2hwYW1Rd2NP?=
 =?utf-8?B?UzdFRkpQQ3NXbW5uYmRIMU5sSnhBdDNhWEUvajhWeG5nb1BUYXBPaUdReUVk?=
 =?utf-8?B?Ui9KR05xd1JKTHVVQnZubGtBNDcxbFdYN3J5N1RpeFcvNTYvUGxTQno1dlhN?=
 =?utf-8?B?R2p4Wk5NVlU5ZGpPRUJWTXhEVFMwcmh6TysvLzl5OE9DMWpKeEN1WndNUjds?=
 =?utf-8?B?cGtHTzRaeUxEVmZGWnIvUWI2dDVpeWtBclZoa2J1ek1xbStNcU41WUkwTzhH?=
 =?utf-8?B?ejJXQ1M3YWt3ZzhSZWlrVjF3Y0NlR1NYNzJiWGwxanJiUVJlNUFkSHFySUxT?=
 =?utf-8?B?SkpuTXpOMVU2SUd3Q2llblMzaXNzcEhLbkE5RnEvSnR5dkQ4U0Qra1BCclBJ?=
 =?utf-8?B?TmJNcjdhMXp4QjBoZlFTWEJoM0ZsRkY4OXZvdXE0WUVWTm5Xc0JCNkVUenJX?=
 =?utf-8?B?SS9yVGR6YTd6bWFEbjc2N2RzNDVjamcyd2l3b0FhT3R1T0luVHdTVzRQWGpT?=
 =?utf-8?B?eWxOSzRLQURLd05tdUYyaDZvS1BxSUNyOHBjbElkdG9JMlRKSHNpREc5Wk5S?=
 =?utf-8?B?bEl1L3J4RE01cjBNaVNLYnhBRFp0OWR0NHdPWmczYmFiSnZ1TUZ0SFJSYk4v?=
 =?utf-8?B?K245WUJ5dUVUOEt6bHhBOCtlaEppYUQvbXZLeXNaVmxhMTc0cVQwVzM5NW5K?=
 =?utf-8?B?Z05aSTRLaXFCWkJ5UU5pclRjYzQzcnE1V280Yk4xWHZJVmRYVDY0K09wRUlw?=
 =?utf-8?B?d3g4eEpJQlBwbHptZVhsV0lMYWhzQ3MxTGdIK2pObUQzOG1Pd2dUN2J5Njhu?=
 =?utf-8?B?cXNiTE5kbERQSmlITjhtbGVpaXo5Mk5wbFI3RHlmZjlIVjBOcjJmeU44NGNy?=
 =?utf-8?B?NXIxb3dpeXJXYWdPVTJ6M0M3THdEQTZRYnNUSnJRUlViYktyR2kyclhybHBw?=
 =?utf-8?B?SnhTMU1xbXQ2UndDTGQxMWszYkhMZVdhRTJNVUJycU9FQjJMbnY4Q3hpVXdx?=
 =?utf-8?B?Vm1ZbGZRVkhaR0ZnNXNrQWFQZkRtTFk3b3g5b1FWRlYyU3Y1K1FBTTM4OGdK?=
 =?utf-8?B?YTBodTErb3ZGWnRzN1hreTRVeHlETGJvNTAraXlTN1YvVitLbDBKcWFkSXFy?=
 =?utf-8?B?elE1clB6Tyt1SnRSQjd1U3BGbC9oNEF5eDl5UGh2RUU1VkFoYUsrQVA5bmVG?=
 =?utf-8?B?ZVUrMUtlSjdVTjd4dldYMGtjRkNVT2cvN05ubUtXeXRzUEVnK1kzREQ2QjFq?=
 =?utf-8?B?ZnNBYVc2YzZpQUZVeXlCMVJiVDZqY29GQ1U3cUp6L1ZnYjVoTjJCWXFaQUVp?=
 =?utf-8?B?VU9vMWNDd3d1bmE0Z0M1WWNJY2Zab0NZdEh2eWl1Z0J4TEwwb2FFV3NlaU1v?=
 =?utf-8?B?YW9SL0F3bU1KVVVRczk4b3VVZUxsNGhtNlF0VWgvUUdnWi9ZaHlRQndld0xS?=
 =?utf-8?B?d0tubzRQeFBSOVlRd2d0eEJsdERrRk9jTDE1SzhyQlc4V1VCT0NDWE1PTExw?=
 =?utf-8?B?YlI3S2dWZ2N6NW9ldVhvU2ZydjdPRkJtNjkyTmU4T3NER2x6dG5sUHU0ZHFP?=
 =?utf-8?B?TkExZllEQmxkYmQ0dCtSQ21tMnFtemJjcWdYOTE5OWlCZHdnWGJYcVYvdGJw?=
 =?utf-8?B?ODFsbS9BbUd6cWtNbkNaWkE2NmQzTnJINlJpVDQrSGdaVldSTWRFRjkzc0hH?=
 =?utf-8?B?NisyR2ovZVp2d2ZiTk56S3lMVTduMUVtTHAvZ09UM0djQ3dQLy9aNjNtUDVJ?=
 =?utf-8?B?M2M5WFovZ3ZzbFliQ3p2Y3hvTjNQTzMxMEx4bUxpNVFuejBpZ0l1WWhPTWRZ?=
 =?utf-8?B?cmpBVnowRTVmczdXYmQ4VStONS93Qk1aYnNDOXBkM2EvOStPZ2dKYWpLakw4?=
 =?utf-8?B?VVBlRlR5UmdtYkYyTDk5U3ZaREQ0dkVucVVteXo0akc0aXFMb01RLzVVcjJX?=
 =?utf-8?B?azhoYnV3anNUZm5NY3M2c1VXUy9kckpvOHVwWFlXSTJDSzVtZTIrSHZqVkI2?=
 =?utf-8?B?WUVadW1weUdPL0ZNRVVJcFZrb3l5YWtvT0hON1ovOUkxZzdMUGdqZ0REL0Q2?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f927271-36f5-4f5b-c6cb-08dd40f83d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 06:35:08.1787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsonZyxF1fXuhfnsyA60hhbRD8FcFWURaHh9KrPo591abQn+MjHp8sTRYmr9BVl07IQ8tRVnCQ0pwTfen8ryzcQZRkJ5OP9+WRt6mhfjZ3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF1cm8sIFJpYW5hIDxy
aWFuYS50YXVyb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDMwLCAyMDI1
IDEyOjAzIFBNDQo+IFRvOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFuYS5rLnYu
cEBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBH
dXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28N
Cj4gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMi8z
XSBkcm0veGU6IEVuYWJsZSBCb290IFN1cnZpdmFiaWxpdHkgbW9kZQ0KPiANCj4gSGkgU2F0eWFu
YXJheWFuYQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzDQo+IA0KPiBPbiAx
LzI5LzIwMjUgMTI6NTcgUE0sIEsgViBQLCBTYXR5YW5hcmF5YW5hIHdyb3RlOg0KPiA+PiBGcm9t
OiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBSaWFuYQ0KPiA+PiBUYXVybw0KPiA+PiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4
LCAyMDI1IDM6MjcgUE0NCj4gPj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+PiBDYzogVGF1cm8sIFJpYW5hIDxyaWFuYS50YXVyb0BpbnRlbC5jb20+OyBHdXB0YSwgQW5z
aHVtYW4NCj4gPj4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2NiAyLzNdIGRybS94
ZTogRW5hYmxlIEJvb3QgU3Vydml2YWJpbGl0eSBtb2RlDQo+ID4+DQo+ID4+IEVuYWJsZSBib290
IHN1cnZpdmFiaWxpdHkgbW9kZSBpZiBwY29kZSBpbml0aWFsaXphdGlvbiBmYWlscyBhbmQNCj4g
Pj4gaWYgYm9vdCBzdGF0dXMgaW5kaWNhdGVzIGEgZmFpbHVyZS4gSW4gdGhpcyBtb2RlLCBkcm0g
Y2FyZCBpcyBub3QNCj4gPj4gZXhwb3NlZCBhbmQgZHJpdmVyIHByb2JlIHJldHVybnMgc3VjY2Vz
cyBhZnRlciBsb2FkaW5nIHRoZSBiYXJlIG1pbmltdW0NCj4gPj4gdG8gYWxsb3cgZmlybXdhcmUg
dG8gYmUgZmxhc2hlZCB2aWEgbWVpLg0KPiA+Pg0KPiA+PiB2MjogYWJzdHJhY3Qgc3Vydml2YWJp
bGl0eSBtb2RlIHZhcmlhYmxlDQo+ID4+ICAgICAgYWRkIEJNRyBjaGVjayBpbnNpZGUgZnVuY3Rp
b24gKEphbmksIFJvZHJpZ28pDQo+ID4+DQo+ID4+IHYzOiByZXR1cm4gLUVCVVNZIGR1cmluZyBz
eXN0ZW0gc3VzcGVuZCAoQW5zaHVtYW4pDQo+ID4+ICAgICAgY2hlY2sgc3Vydml2YWJpbGl0eSBt
b2RlIGluIHBjaSBwcm9iZSBvbmx5DQo+ID4+ICAgICAgb24gZXJyb3INCj4gPj4NCj4gPj4gU2ln
bmVkLW9mZi1ieTogUmlhbmEgVGF1cm8gPHJpYW5hLnRhdXJvQGludGVsLmNvbT4NCj4gPj4gUmV2
aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPj4gLS0t
DQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgICAgICAgIHwgIDcg
KysrKysrLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAgICAgICAgICAgICAg
ICB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfc3Vydml2YWJpbGl0eV9tb2RlLmMgfCAxNiArKysrKysrKysrKysrKysNCj4gPj4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmggfCAgMSArDQo+ID4+ICAgNCBm
aWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4+IGluZGV4IGYzZjc1NGJlYjgxMi4uOGZlZGM3
MmU5ZGI0IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMN
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4+IEBAIC01Miw2
ICs1Miw3IEBADQo+ID4+ICAgI2luY2x1ZGUgInhlX3BtdS5oIg0KPiA+PiAgICNpbmNsdWRlICJ4
ZV9xdWVyeS5oIg0KPiA+PiAgICNpbmNsdWRlICJ4ZV9zcmlvdi5oIg0KPiA+PiArI2luY2x1ZGUg
InhlX3N1cnZpdmFiaWxpdHlfbW9kZS5oIg0KPiA+PiAgICNpbmNsdWRlICJ4ZV90aWxlLmgiDQo+
ID4+ICAgI2luY2x1ZGUgInhlX3R0bV9zdG9sZW5fbWdyLmgiDQo+ID4+ICAgI2luY2x1ZGUgInhl
X3R0bV9zeXNfbWdyLmgiDQo+ID4+IEBAIC02OTMsOCArNjk0LDEyIEBAIGludCB4ZV9kZXZpY2Vf
cHJvYmVfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4+ICAgCXVwZGF0ZV9kZXZpY2Vf
aW5mbyh4ZSk7DQo+ID4+DQo+ID4+ICAgCWVyciA9IHhlX3Bjb2RlX3Byb2JlX2Vhcmx5KHhlKTsN
Cj4gPj4gLQlpZiAoZXJyKQ0KPiA+PiArCWlmIChlcnIpIHsNCj4gPj4gKwkJaWYgKHhlX3N1cnZp
dmFiaWxpdHlfbW9kZV9yZXF1aXJlZCh4ZSkpDQo+ID4+ICsJCQl4ZV9zdXJ2aXZhYmlsaXR5X21v
ZGVfaW5pdCh4ZSk7DQo+ID4+ICsNCj4gPj4gICAJCXJldHVybiBlcnI7DQo+ID4+ICsJfQ0KPiA+
Pg0KPiA+PiAgIAllcnIgPSB3YWl0X2Zvcl9sbWVtX3JlYWR5KHhlKTsNCj4gPj4gICAJaWYgKGVy
cikNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+PiBpbmRleCBlNmFkMTg5Mjk0YzEuLmI0ODNjNWM5
MDEzMiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+ID4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiA+PiBAQCAtMzAsNiArMzAsNyBA
QA0KPiA+PiAgICNpbmNsdWRlICJ4ZV9wbS5oIg0KPiA+PiAgICNpbmNsdWRlICJ4ZV9zcmlvdi5o
Ig0KPiA+PiAgICNpbmNsdWRlICJ4ZV9zdGVwLmgiDQo+ID4+ICsjaW5jbHVkZSAieGVfc3Vydml2
YWJpbGl0eV9tb2RlLmgiDQo+ID4+ICAgI2luY2x1ZGUgInhlX3RpbGUuaCINCj4gPj4NCj4gPj4g
ICBlbnVtIHRvZ2dsZV9kM2NvbGQgew0KPiA+PiBAQCAtNzY2LDYgKzc2Nyw5IEBAIHN0YXRpYyB2
b2lkIHhlX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ID4+ICAgCWlmIChJU19T
UklPVl9QRih4ZSkpDQo+ID4+ICAgCQl4ZV9wY2lfc3Jpb3ZfY29uZmlndXJlKHBkZXYsIDApOw0K
PiA+Pg0KPiA+PiArCWlmICh4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlZCh4ZSkpDQo+ID4+
ICsJCXJldHVybiB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfcmVtb3ZlKHhlKTsNCj4gPj4gKw0KPiA+
PiAgIAl4ZV9kZXZpY2VfcmVtb3ZlKHhlKTsNCj4gPj4gICAJeGVfcG1fcnVudGltZV9maW5pKHhl
KTsNCj4gPj4gICAJcGNpX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiA+PiBAQCAtODM4LDgg
Kzg0MiwxOSBAQCBzdGF0aWMgaW50IHhlX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwN
Cj4gY29uc3QNCj4gPj4gc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gPj4gICAJCXJldHVy
biBlcnI7DQo+ID4+DQo+ID4+ICAgCWVyciA9IHhlX2RldmljZV9wcm9iZV9lYXJseSh4ZSk7DQo+
ID4+IC0JaWYgKGVycikNCj4gPj4gKw0KPiA+PiArCS8qDQo+ID4+ICsJICogSW4gQm9vdCBTdXJ2
aXZhYmlsaXR5IG1vZGUsIG5vIGRybSBjYXJkIGlzIGV4cG9zZWQNCj4gPj4gKwkgKiBhbmQgZHJp
dmVyIGlzIGxvYWRlZCB3aXRoIGJhcmUgbWluaW11bSB0byBhbGxvdw0KPiA+PiArCSAqIGZvciBm
aXJtd2FyZSB0byBiZSBmbGFzaGVkIHRocm91Z2ggbWVpLiBSZXR1cm4NCj4gPj4gKwkgKiBzdWNj
ZXNzIGlmIHN1cnZpdmFiaWxpdHkgbW9kZSBpcyBlbmFibGVkLg0KPiA+PiArCSAqLw0KPiA+PiAr
CWlmIChlcnIpIHsNCj4gPj4gKwkJaWYgKHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9lbmFibGVkKHhl
KSkNCj4gPj4gKwkJCXJldHVybiAwOw0KPiA+PiArDQo+ID4+ICAgCQlyZXR1cm4gZXJyOw0KPiA+
PiArCX0NCj4gPj4NCj4gPj4gICAJZXJyID0geGVfaW5mb19pbml0KHhlLCBkZXNjLT5ncmFwaGlj
cywgZGVzYy0+bWVkaWEpOw0KPiA+PiAgIAlpZiAoZXJyKQ0KPiA+PiBAQCAtOTI2LDkgKzk0MSwx
MyBAQCBzdGF0aWMgdm9pZCBkM2NvbGRfdG9nZ2xlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPiA+
PiBlbnVtIHRvZ2dsZV9kM2NvbGQgdG9nZ2xlKQ0KPiA+PiAgIHN0YXRpYyBpbnQgeGVfcGNpX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+PiAgIHsNCj4gPj4gICAJc3RydWN0IHBjaV9k
ZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7DQo+ID4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUg
PSBwZGV2X3RvX3hlX2RldmljZShwZGV2KTsNCj4gPj4gICAJaW50IGVycjsNCj4gPj4NCj4gPj4g
LQllcnIgPSB4ZV9wbV9zdXNwZW5kKHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpKTsNCj4gPj4gKwlp
ZiAoeGVfc3Vydml2YWJpbGl0eV9tb2RlX2VuYWJsZWQoeGUpKQ0KPiA+PiArCQlyZXR1cm4gLUVC
VVNZOw0KPiA+PiArDQo+ID4+ICsJZXJyID0geGVfcG1fc3VzcGVuZCh4ZSk7DQo+ID4+ICAgCWlm
IChlcnIpDQo+ID4+ICAgCQlyZXR1cm4gZXJyOw0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3N1cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4+IGluZGV4IDk5MTFlOWY2Yjk5
Yi4uNjMzZjVlZmZhMzQ5IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
c3Vydml2YWJpbGl0eV9tb2RlLmMNCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N1
cnZpdmFiaWxpdHlfbW9kZS5jDQo+ID4+IEBAIC0xNDQsNiArMTQ0LDE5IEBAIHN0YXRpYyB2b2lk
IGVuYWJsZV9zdXJ2aXZhYmlsaXR5X21vZGUoc3RydWN0DQo+IHBjaV9kZXYNCj4gPj4gKnBkZXYp
DQo+ID4+ICAgCX0NCj4gPj4gICB9DQo+ID4+DQo+ID4+ICsvKioNCj4gPj4gKyAqIHhlX3N1cnZp
dmFiaWxpdHlfbW9kZV9lbmFibGVkIC0gY2hlY2sgaWYgc3Vydml2YWJpbGl0eSBtb2RlIGlzIGVu
YWJsZWQNCj4gPj4gKyAqIEB4ZTogeGUgZGV2aWNlIGluc3RhbmNlDQo+ID4+ICsgKg0KPiA+PiAr
ICogUmV0dXJucyB0cnVlIGlmIGluIHN1cnZpdmFiaWxpdHkgbW9kZSwgZmFsc2Ugb3RoZXJ3aXNl
DQo+ID4+ICsgKi8NCj4gPj4gK2Jvb2wgeGVfc3Vydml2YWJpbGl0eV9tb2RlX2VuYWJsZWQoc3Ry
dWN0IHhlX2RldmljZSAqeGUpDQo+ID4+ICt7DQo+ID4+ICsJc3RydWN0IHhlX3N1cnZpdmFiaWxp
dHkgKnN1cnZpdmFiaWxpdHkgPSAmeGUtPnN1cnZpdmFiaWxpdHk7DQo+ID4+ICsNCj4gPj4gKwly
ZXR1cm4gc3Vydml2YWJpbGl0eS0+bW9kZTsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiAgIC8qKg0K
PiA+PiAgICAqIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9yZXF1aXJlZCAtIGNoZWNrcyBpZiBzdXJ2
aXZhYmlsaXR5IG1vZGUgaXMgcmVxdWlyZWQNCj4gPj4gICAgKiBAeGU6IHhlIGRldmljZSBpbnN0
YW5jZQ0KPiA+PiBAQCAtMTU4LDYgKzE3MSw5IEBAIGJvb2wgeGVfc3Vydml2YWJpbGl0eV9tb2Rl
X3JlcXVpcmVkKHN0cnVjdA0KPiA+PiB4ZV9kZXZpY2UgKnhlKQ0KPiA+PiAgIAlzdHJ1Y3QgeGVf
bW1pbyAqbW1pbyA9IHhlX3Jvb3RfdGlsZV9tbWlvKHhlKTsNCj4gPj4gICAJdTMyIGRhdGE7DQo+
ID4+DQo+ID4+ICsJaWYgKCFJU19ER0ZYKHhlKSB8fCB4ZS0+aW5mby5wbGF0Zm9ybSA8IFhFX0JB
VFRMRU1BR0UpDQo+ID4+ICsJCXJldHVybiBmYWxzZTsNCj4gPj4gKw0KPiA+DQo+ID4gVGhlIHN1
cnZpdmFiaWxpdHkgbW9kZSBpcyBub3QgbmVlZGVkIGluIGNhc2UgVkYuIE1ha2Ugc3VyZSB0byBy
ZXR1cm4gZmFsc2UgaW4NCj4gY2FzZSBvZiBWRiBhcyB3ZWxsLg0KPiA+IGlmICghSVNfREdGWCh4
ZSkgfHwgeGUtPmluZm8ucGxhdGZvcm0gPCBYRV9CQVRUTEVNQUdFIHx8DQo+IElTX1NSSU9WX1ZG
KHhlKSkNCj4gPiAJcmV0dXJuIGZhbHNlOw0KPiANCj4gQXMgZGlzY3Vzc2VkIG9mZmxpbmUsIHN1
cnZpdmFiaWxpdHkgbW9kZSBpcyBzZXQgb25seSB3aGVuIHBjb2RlDQo+IGluaXRpYWxpemF0aW9u
IGZhaWxzLiBTbyBpZiBpdCBmYWlscyBmb3IgUEYsIGl0IHdpbGwgbm90IGNvbnRpbnVlIHdpdGgN
Cj4gc3Jpb3ZfaW5pdC4NCj4gDQo+IFRoYW5rcw0KPiBSaWFuYQ0KPiA+DQpMR1RNLg0KUmV2aWV3
ZWQtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29t
Pg0KPiA+PiAgIAlkYXRhID0geGVfbW1pb19yZWFkMzIobW1pbywgUENPREVfU0NSQVRDSCgwKSk7
DQo+ID4+ICAgCXN1cnZpdmFiaWxpdHktPmJvb3Rfc3RhdHVzID0gUkVHX0ZJRUxEX0dFVChCT09U
X1NUQVRVUywgZGF0YSk7DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfc3Vydml2YWJpbGl0eV9tb2RlLmgNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
c3Vydml2YWJpbGl0eV9tb2RlLmgNCj4gPj4gaW5kZXggNDEwZTNlZTVmNWQxLi5mNTMwNTA3YTIy
YzYgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9zdXJ2aXZhYmlsaXR5
X21vZGUuaA0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc3Vydml2YWJpbGl0eV9t
b2RlLmgNCj4gPj4gQEAgLTEyLDYgKzEyLDcgQEAgc3RydWN0IHhlX2RldmljZTsNCj4gPj4NCj4g
Pj4gICB2b2lkIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KTsNCj4gPj4gICB2b2lkIHhlX3N1cnZpdmFiaWxpdHlfbW9kZV9yZW1vdmUoc3RydWN0IHhlX2Rl
dmljZSAqeGUpOw0KPiA+PiArYm9vbCB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfZW5hYmxlZChzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4+ICAgYm9vbCB4ZV9zdXJ2aXZhYmlsaXR5X21vZGVfcmVx
dWlyZWQoc3RydWN0IHhlX2RldmljZSAqeGUpOw0KPiA+Pg0KPiA+PiAgICNlbmRpZiAvKiBfWEVf
U1VSVklWQUJJTElUWV9NT0RFX0hfICovDQo+ID4+IC0tDQo+ID4+IDIuNDcuMQ0KPiA+DQoNCg==
