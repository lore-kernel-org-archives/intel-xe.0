Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9093ACF6D2C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 14:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58810E758;
	Wed,  2 Oct 2024 14:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etA+qVCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C210E735
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727877604; x=1759413604;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=oLVzimgBZciVCG6Kaob1Fjx0qd0NxUpHF6dSp/uwDIY=;
 b=etA+qVCwWlHB0ZmFbGHh/yQJSur8/GtNZhv3SeOOxEGyQwP+/zdgothA
 VVVziUdP93c3nBjkueWVPkbxGufRECDJh+83W3wXJl0bG5G3SCq6egcWK
 0/UKTg3AHjHGTsRj7n+omvUVqWm3ldIDqa8+oHNfn8bDA5Jo8io1bE9vH
 jAuQYnQfY4MU0DRi1+Adi/0n6OxVwocDnP2D5D8HB8l4MNMzj4hKgbpJ3
 J1jZrdgXQeLzHeT+5L+7AymXK0VbU+nLY9+1cgXnT0ZbrfwQ7KSvJjS1I
 e5GWXNjwe3JnzEfVL7NTokc+yiqiK3sjcPodCj5A1Pmql20yJB8IQESIJ A==;
X-CSE-ConnectionGUID: 5d/Yz3PcTAOuPgcrtNoemg==
X-CSE-MsgGUID: XuC57zl/RQ+iW9SgmU/RcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27133207"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27133207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:00:03 -0700
X-CSE-ConnectionGUID: 2kbTC1tXTu+U8FKBRKWuHQ==
X-CSE-MsgGUID: K4Zb+4GKSpKvehNBbqRzsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78747832"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 07:00:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 07:00:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 07:00:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 07:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sf1iwlao0TtuIWXs5FWNgPdaD3mzktJfRt7NgAwamH04r2y0AU4RGKdQo8OBTNXFf9fyG7jLWkIdsMWM4bvL+N/Had7YREZBiTFqpM0IA92LOX8SmSN/1fMMRlkPq59UlF0NVgOhJePYljAg+/BF9wyyr4ApSwBY+n6UmzMtSI0eP125cqzL1HhHXga4x3byWyDUYw+ChTPhgogzR9hFekNwc0jLAlYTDXbUojuUk0I903cQ2v1OrqHux6srNMrnbdtX63HfbF4S/Pu8WGKtuq0O3g55E5RcYqJbi4hO4s3DeEdPfaFeazbicNn9dKETrO4AlEyJ8hbd1/V5U5kaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLVzimgBZciVCG6Kaob1Fjx0qd0NxUpHF6dSp/uwDIY=;
 b=RSASzmNFIlmCbbtwtaDcuAdCnsDyK20dMLSG6hWYtSmZNLkwucqyYU9VJzfODYkyA8UTO43AjdzV4XNE6cjYUUQvez8olQvCHoRoUWNqi4ECbMIbISWLoaZdnooqKtvXXpXYurM/xGlYtGc1IIFR3IomFnvrNq6OZipz0iEW/bNM5etJW/+sNKYc1UiUgLPd0Z4Heeko0HiRCQ5Hqy6J6eMX7cLSBBj0RUEeMRSkYcZKGJqqk4ZEpZDmlLQW/foE6rjZ3scWkJXOfRk6Gkq5WqQurK4rz9FhTvguCyC+ukYQv3YMLwmRBBdL58jlzEoqCgu+DLDfPxqQvK4hEbGD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by CH2PR11MB8833.namprd11.prod.outlook.com (2603:10b6:610:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 13:59:40 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 13:59:40 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 13/18] drm/xe: Debug metadata create/destroy ioctls
Thread-Topic: [PATCH 13/18] drm/xe: Debug metadata create/destroy ioctls
Thread-Index: AQHbFBHA2UJQBwEPkUGpZlTLEb+GXbJyFQsAgAFpdQA=
Date: Wed, 2 Oct 2024 13:59:40 +0000
Message-ID: <bfd458511e20b37a99b23c10d9d0e88f99112ac4.camel@intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-14-mika.kuoppala@linux.intel.com>
 <7b0e1435-a6d8-4148-9e99-2085aa2208bb@intel.com>
In-Reply-To: <7b0e1435-a6d8-4148-9e99-2085aa2208bb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|CH2PR11MB8833:EE_
x-ms-office365-filtering-correlation-id: 649493c6-9a60-4441-270e-08dce2ea75c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SkM4WURMVXhhZW5GQkFSanZWd1JqT1hKY2l6MkJwYXBXZ3dQN0VPRnVhUEtC?=
 =?utf-8?B?bUc2bmhFQjREWmRYdndleTF0ejczMUZXZTRMUXU1Z1VpOEVFUEExaVNEOC9q?=
 =?utf-8?B?cFNSaVNvR3ZlbmcxcmQ1RVhweVk2ZjZjZVR2dWVpTGg5VzZ0SUtHSDg0Z2pN?=
 =?utf-8?B?OG52K25KVDRlTnh2ZVVMeXV1ZWEwOWNLOVRyMEtQR3dKQnYybXc2K2ZiRDZ0?=
 =?utf-8?B?TjlIQVJQSEJ3Nm14c3JXVHNORlJXMVc3aDBQeXJuN0E4Nk9jM1lUeUY4cEdv?=
 =?utf-8?B?RS9LYkc2aTN2NlF3RkxxWk9iaUx1d2xPb3hRalVrKzcwWmVrN3BGL1UxMzJw?=
 =?utf-8?B?THRJVUJrRUlua1ovQ0c2c0tmRFdzOFZLUDNkUXhTSmdLZjdKbmhlTitJZXhU?=
 =?utf-8?B?U1FjRi9xTzFlU20xbS9OYVhZRHBvRVNXQ0JIMk10dm8wSkhpQkJuWUlpRDl3?=
 =?utf-8?B?eldSVHArWWprR3RpNjF3cHZRYUpXeUs0bk5rMVllQUdrdlYyZThVUS94Mktu?=
 =?utf-8?B?M3B3ODRnTjlsWXNjTG9pRzk3azJZRVNqTW1nWW92TThUbDJXbDRjQkxhYU9E?=
 =?utf-8?B?cXJtSXlMZzRaZnVNK3dMajVjUldrNXdvQkU1eHJIeWx6UTdsWFdkdjVGUVdZ?=
 =?utf-8?B?U1ZSSnExZHY2UkFkUU1ZaGJpZ1ZhUmJSdGQ2VkdxQXljY3dWNzcyRXo4NU80?=
 =?utf-8?B?S2dCVmkzVlhrYnBhSndBMTVpSVdDcDdRZG4rQUpQODZnYkhlYW8yRjdoQ2JB?=
 =?utf-8?B?U3QxMUg4Mnp2ZEFGT2lTL21tOE1BeFJtNUZHa2Erc0paWTYrSDBOb0tQSGJJ?=
 =?utf-8?B?RlJNUnJjTjB3eURVZUxXQWE1VmVnenMweTNrbDZ0WW83K2kzeVJBNzBMQ1VI?=
 =?utf-8?B?VEM3L282VVhNMG5GaUNCb3VpZnphcWQzTDdnRVNBZEx3bWxTYlYyQmRWMWZn?=
 =?utf-8?B?bTIvYXVsdTNVRTNXN0RSd0VSWGJTTjRRUC9XcmVnT25UeWsrUEVLVHRVUjE4?=
 =?utf-8?B?TjRMVHc1VnJuSWRYR3hRNmE3eUQ4clBoUW9jYnBPNXJuMmVtZjFGYVgxSVhN?=
 =?utf-8?B?UmhpZ0ZWUWhwVG1KdTJpMWxpWDF2eW9aTGR4RHljQm5oRDM3OExQRDVWSVVa?=
 =?utf-8?B?aE8zZlhOSUJ2VEJMZ1BGMkZWdHBKWXVHdnRLY2l1ZzhLN0JnTDRVLzhTNWVt?=
 =?utf-8?B?N2tEWm94K2VYWHB2a0xuL05DVmljRmNPUmRqb25xVUp2ZFQyZlpHblRjR3VK?=
 =?utf-8?B?blNOcXpreGVlWnNEbmNCQXRRdi9JWXJRb2RKRXBUS1YxQUtPUC9ucUo2Sit5?=
 =?utf-8?B?MmFuN1FXUlJUak5KN2d5b1NzcWw5ek9mRytiTS95UjdSQTZ4R3Q1MkU1RENL?=
 =?utf-8?B?QUhpZ3pETlY0QkpjdEg5TENmYUhzbXdMSCtCODZiMFlTenhjMmRNbXl0Y0Qw?=
 =?utf-8?B?QjlUSmRzSmRpNnBJWHZHdGZGcko1WllNQ0E1OGlUcjBJVTZzSmRpQm41M2RF?=
 =?utf-8?B?YnVyREFKVjA5cUVad0JybE94Qm5Gam1GMGZWNzhaVENJTXNEUUNmK0pEY3BN?=
 =?utf-8?B?cUlEYm9iL1c0UHVMMnZwVm9VWEQ0YyttcVh6K2Z0RHhTUHd3T2xaZnF3eE40?=
 =?utf-8?B?SWozNUZLd3REV1crZFc1TlU5UFliVlpFdTRHSnNQNnhzY3psVng0NXJtWHFO?=
 =?utf-8?B?NzR4cDkzYkg0bThsUWx0SE1rZTB0TEtncE1pVmlpNjFtNnNGWXZpTUErbnUv?=
 =?utf-8?B?dzFQN3dOZTZGYlkrSHVFc0wrRlhYWHdlTFJrVS9NVnpXcjdmZ0tFVXU3dzZD?=
 =?utf-8?B?TDBYVUFtSWwvWWdRSjlhZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDBMR3ZkS3QzNGFVMHM3UzZJbm1wV2JjQVpxUmljNndzWWlTYUZCMVhhVm9x?=
 =?utf-8?B?TmJES2htYXBIclBvTFB0T1VXQWFxMkZpZ1YzRWpYZWVxWW5nQnBHSXB3b1pQ?=
 =?utf-8?B?OVBPajB4Z3FHSnZNNkhqSjBUY3pZRnVySllyY3BMN2hmaHVSNlBLb2tlc1hU?=
 =?utf-8?B?V21SUUZQblFweW9LcVhCUjI2cnhMdTlpK1QyR2xRRzlNdm1obitJRFYrUTJ4?=
 =?utf-8?B?VHNsaDhoeWg2aG51a1pTZFBxbFdFUG5GUVJPcGFFenNLcEVHZGZyKy9Zd3Fq?=
 =?utf-8?B?Q3V3dXlLa0ZnRUd6cjViaGdxRHU0N1FCUzRIZ3I5NWl1dUV1RDJ1S1pIZXRK?=
 =?utf-8?B?eHVXSjQzWm9FaXQ3VlBxWE9qMHRIVmFvRk9tRjNwM2JPcFFlVjBJSTh1Yk1X?=
 =?utf-8?B?Vy9yS3RnQVAyRlFueTdjWWNqNHR4UEMzWW9VSmpWWTR6ZUFnMHIyQ1I4SXBB?=
 =?utf-8?B?THNHUGNQbVVTOEIreXRHc3BSOEE2ekZ5MXN2ejN2V1ZHZnhuVkM4ckRIOGkw?=
 =?utf-8?B?OElhaEllMHhjL01LT3AxL0RucS9iVmtZVzE4TVZTa2xVcmpCbW1jZERwdzB1?=
 =?utf-8?B?aVRsSE5kUDlYSm9BL1lzMlhVWllzY0NxSE5lQWNaRFBOUmpsZTJYY3NzOW12?=
 =?utf-8?B?Wjgwd1RDT3BWWWgyT1pMYWJ6YWNza2lvYkM4ZzcwNFpuQlBBY2F2WExRN3o5?=
 =?utf-8?B?eG5uMUtGUEgzSWNYczNxbEJodUxZeVNWaVhNZktFYjJHTkZQWjFjcW9Tbmt2?=
 =?utf-8?B?c3dpUjJEN2RuWFNMZUtMd0JMaVN2OFNuK3hYWVZhNkJEVStRSU1HS2JTN0cr?=
 =?utf-8?B?NGRyVUxsbEVPOEc4bmpCUzdlL29SNTROZHkrL1pTZjBieFFnUHl6L2RqU3Q4?=
 =?utf-8?B?TVhyVlcrV1NvMEtvdzBLVitNZkJwOXdyVTBlSHlkaDN4UXd6ZzZQYVFFT21J?=
 =?utf-8?B?YTRqKzJwbVZiNXlXQ0RyY2ROK0laVlV0djhzZm80T2NMZm5nbWdqVm5jZjMw?=
 =?utf-8?B?SzFQM1YvVFNkbkpqcm5WWHVjb0dleVE2alhrbDVtYmc3WVpPRHhTaW5TZHlF?=
 =?utf-8?B?THZ0SkQ4OUFGeDJ0NzlTWmZuOEhYanJ4WVJVMG12di9DMTVFU0tUM0xUYzF5?=
 =?utf-8?B?dG9DcEpmNCttVVgya1NpdU1EQ2dzdHZ6dFJRWkRKRDEvVU9yZmFNRmYrR2M4?=
 =?utf-8?B?S3VkNEx5dGZBdlJnc1ptckZ6SncxWDV4UG15Zjk2KzdQUEtsVUtqbHpNMEtL?=
 =?utf-8?B?ZEphUFZxTTU5Z0ExSnNRYXIzeGFFbVYraW9iZGltNEFYRnk3dGlVWmVINlor?=
 =?utf-8?B?c2l6RlBHbmpadDZJK1Y4cmpnaTRQZFFjRTc1N01XVGIvQWNyb3RNNWd1Y3dW?=
 =?utf-8?B?STlaVCt1ZzA4R3l4dnFFc1Q0SzV1eTVwdGtrZGJxNnhNRUdUL0tEcXdjNHdM?=
 =?utf-8?B?ZEhlT21zUzFVcVRFcUI3TkRod3VmSWx3YjJUS3ZiN2RHUW9FelFPNEpHVDk1?=
 =?utf-8?B?SXY1SWd5dGR2Zm84aDZPb0Fpd1hMZk1pVWtCa1gzWStReWlmbmpOZXlwNW9j?=
 =?utf-8?B?WU42S2VuUy9ORS83VlQ5UEhHbDhaKzlyQkNqc01HOGt3N0pWOUp6aGd5aFE4?=
 =?utf-8?B?UTNlaGpCeUVQTGxOYjBleHJsMFI1d0VzQlJiclBwK2VsOGgyUXo3aVdoT1Jy?=
 =?utf-8?B?L2FlV2dKTGYrRDh0WmlpSUtWc2RNaXk5V0V2Z1JEZ2xBcXkrYmcrd2VJMURZ?=
 =?utf-8?B?NXpPMzJSdkFkMHdBdGkvSjJHbHVWdHlMbjFnaUlBR0dXNGp6cWF6YWE2MnpX?=
 =?utf-8?B?TWhZWlRDQXdLN0pVUExrR1MvNDZ0MDBxMjBwRVk4dldyeU1FbnlDZk1KaTFX?=
 =?utf-8?B?czlybExxN0o4am0wZ3dQaVFNYnUyZWxmQWxScVkvUkFSazYxTU1JYkhMNUx3?=
 =?utf-8?B?QmRvTjA4RTR3dXBUK2svY2RaUFpiZFZoS0ZNRzlCNzlxZ1NJYm1TTzJrTGRF?=
 =?utf-8?B?NW9SNi90Y01na0pOOWR0cGR4MjlCNFp1Z3JSSEJWZnA1V1RJQTdXUXpiZXZX?=
 =?utf-8?B?TytRNHBXVjJQNXZNaHJMRHd0Rmp3dlVQcm9nWlFTTHFFV3BESDlodDl3Y3Z4?=
 =?utf-8?B?YmI1YnM1akZHeTh6ZjFieExTaXVlVDB6VUY3amZ0RWJ3b0R5anNxNUpubWcr?=
 =?utf-8?Q?yVgHovFk8xlH4UbqwaiAz5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <749E3847D9F90C4B9F162AFA721F86A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649493c6-9a60-4441-270e-08dce2ea75c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2024 13:59:40.5464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xzR3pdqJZ/6XJlE1qZfpVoEMgzb7cpiiU4vbBS3yYsw0m77F8npak9LaJgag02wDbE8UVQMiIDzADnOILbFOX69UQOgBrFRTYMbDpWJjf5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8833
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

T24gVHVlLCAyMDI0LTEwLTAxIGF0IDE3OjI1ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gMDEvMTAvMjAyNCAxNTo0MywgTWlrYSBLdW9wcGFsYSB3cm90ZToNCj4g
PiBGcm9tOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+
DQo+ID4gDQo+ID4gQWQgYSBwYXJ0IG9mIGV1IGRlYnVnIGZlYXR1cmUgaW50cm9kdWNlIGRlYnVn
IG1ldGFkYXRhIG9iamVjdHMuDQo+ID4gVGhlc2UgYXJlIHRvIGJlIHVzZWQgdG8gcGFzcyBtZXRh
ZGF0YSBiZXR3ZWVuIGNsaWVudCBhbmQgZGVidWdnZXIsDQo+ID4gYnkgYXR0YWNoaW5nIHRoZW0g
dG8gdm1fYmluZCBvcGVyYXRpb25zLg0KPiA+IA0KPiA+IHRvZG86IFdPUktfSU5fUFJPR1JFU1Nf
KiBkZWZpbmVzIG5lZWQgdG8gYmUgcmV3b3JkZWQvcmVmaW5lZCB3aGVuDQo+ID4gICAgICAgIHRo
ZSByZWFsIHVzYWdlIGFuZCBuZWVkIGlzIGVzdGFibGlzaGVkIGJ5IGwwK2dkYi4NCj4gPiANCj4g
PiB2MjogLSBpbmNsdWRlIHVhcGkvZHJtL3hlX2RybS5oDQo+ID4gICAgICAtIG1ldGFkYXRhIGJl
aGluZCBrY29uZmlnIChNaWthKQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbWluaWsgR3J6
ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAz
ICstDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdfbWV0YWRhdGEuYyAgICAgICB8
IDEwOCArKysrKysrKysrKysrKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGVi
dWdfbWV0YWRhdGEuaCAgICAgICB8ICA1MCArKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZWJ1Z19tZXRhZGF0YV90eXBlcy5oIHwgIDI4ICsrKysrDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgICAgICAgICB8ICAgNSArDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggICAgICAgICAgICAgICB8ICAgMiArDQo+ID4gICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggICAgICAgICB8ICAgNyArKw0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V1ZGVidWcuYyAgICAgICAgICAgICAgfCAgMTMgKysr
DQo+ID4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICAgICAgICAgICAgICAgICB8ICA1
MyArKysrKysrKy0NCj4gPiAgIDkgZmlsZXMgY2hhbmdlZCwgMjY3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RlYnVnX21ldGFkYXRhLmMNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVidWdfbWV0YWRhdGEuaA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z19tZXRhZGF0YV90eXBlcy5oDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9NYWtlZmlsZQ0KPiA+IGluZGV4IDY2MGMxZGJiYThkMC4uYTk0Zjc3MTUyOWE0IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IEBAIC0xMTQsNyArMTE0LDggQEAgeGUteSArPSB4ZV9i
Yi5vIFwNCj4gPiAgIAl4ZV93YS5vIFwNCj4gPiAgIAl4ZV93b3BjbS5vDQo+ID4gICANCj4gPiAt
eGUtJChDT05GSUdfRFJNX1hFX0VVREVCVUcpICs9IHhlX2V1ZGVidWcubw0KPiA+ICt4ZS0kKENP
TkZJR19EUk1fWEVfRVVERUJVRykgKz0geGVfZXVkZWJ1Zy5vIFwNCj4gPiArCXhlX2RlYnVnX21l
dGFkYXRhLm8NCj4gPiAgIA0KPiA+ICAgeGUtJChDT05GSUdfSE1NX01JUlJPUikgKz0geGVfaG1t
Lm8NCj4gPiAgIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVidWdf
bWV0YWRhdGEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z19tZXRhZGF0YS5jDQo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjcyYTAwYjYyODQ3
NQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGVi
dWdfbWV0YWRhdGEuYw0KPiA+IEBAIC0wLDAgKzEsMTA4IEBADQo+ID4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjMgSW50
ZWwgQ29ycG9yYXRpb24NCj4gPiArICovDQo+ID4gKyNpbmNsdWRlICJ4ZV9kZWJ1Z19tZXRhZGF0
YS5oIg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNs
dWRlIDxkcm0vZHJtX2ZpbGUuaD4NCj4gPiArI2luY2x1ZGUgPHVhcGkvZHJtL3hlX2RybS5oPg0K
PiA+ICsNCj4gPiArI2luY2x1ZGUgInhlX2RldmljZS5oIg0KPiA+ICsjaW5jbHVkZSAieGVfbWFj
cm9zLmgiDQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB4ZV9kZWJ1Z19tZXRhZGF0YV9yZWxlYXNl
KHN0cnVjdCBrcmVmICpyZWYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB4ZV9kZWJ1Z19tZXRhZGF0
YSAqbWRhdGEgPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgeGVfZGVidWdfbWV0YWRhdGEsIHJl
ZmNvdW50KTsNCj4gPiArDQo+ID4gKwlrdmZyZWUobWRhdGEtPnB0cik7DQo+ID4gKwlrZnJlZSht
ZGF0YSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3ZvaWQgeGVfZGVidWdfbWV0YWRhdGFfcHV0KHN0
cnVjdCB4ZV9kZWJ1Z19tZXRhZGF0YSAqbWRhdGEpDQo+ID4gK3sNCj4gPiArCWtyZWZfcHV0KCZt
ZGF0YS0+cmVmY291bnQsIHhlX2RlYnVnX21ldGFkYXRhX3JlbGVhc2UpOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtpbnQgeGVfZGVidWdfbWV0YWRhdGFfY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsDQo+ID4gKwkJCQkgICB2b2lkICpkYXRhLA0KPiA+ICsJCQkJICAgc3RydWN0IGRy
bV9maWxlICpmaWxlKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHRvX3hl
X2RldmljZShkZXYpOw0KPiA+ICsJc3RydWN0IHhlX2ZpbGUgKnhlZiA9IHRvX3hlX2ZpbGUoZmls
ZSk7DQo+ID4gKwlzdHJ1Y3QgZHJtX3hlX2RlYnVnX21ldGFkYXRhX2NyZWF0ZSAqYXJncyA9IGRh
dGE7DQo+ID4gKwlzdHJ1Y3QgeGVfZGVidWdfbWV0YWRhdGEgKm1kYXRhOw0KPiA+ICsJaW50IGVy
cjsNCj4gPiArCXUzMiBpZDsNCj4gPiArDQo+ID4gKwlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdz
LT5leHRlbnNpb25zKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwlpZiAo
WEVfSU9DVExfREJHKHhlLCBhcmdzLT50eXBlID4gRFJNX1hFX0RFQlVHX01FVEFEQVRBX1BST0dS
QU1fTU9EVUxFKSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwlpZiAoWEVf
SU9DVExfREJHKHhlLCAhYXJncy0+dXNlcl9hZGRyIHx8ICFhcmdzLT5sZW4pKQ0KPiA+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArCWlmIChYRV9JT0NUTF9EQkcoeGUsICFhY2Nlc3Nf
b2sodTY0X3RvX3VzZXJfcHRyKGFyZ3MtPnVzZXJfYWRkciksIGFyZ3MtPmxlbikpKQ0KPiA+ICsJ
CXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCW1kYXRhID0ga3phbGxvYyhzaXplb2YoKm1k
YXRhKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIW1kYXRhKQ0KPiA+ICsJCXJldHVybiAtRU5P
TUVNOw0KPiA+ICsNCj4gPiArCW1kYXRhLT5sZW4gPSBhcmdzLT5sZW47DQo+ID4gKwltZGF0YS0+
dHlwZSA9IGFyZ3MtPnR5cGU7DQo+ID4gKw0KPiA+ICsJbWRhdGEtPnB0ciA9IGt2bWFsbG9jKG1k
YXRhLT5sZW4sIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFtZGF0YS0+cHRyKSB7DQo+ID4gKwkJ
a2ZyZWUobWRhdGEpOw0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsJfQ0KPiA+ICsJa3Jl
Zl9pbml0KCZtZGF0YS0+cmVmY291bnQpOw0KPiA+ICsNCj4gPiArCWVyciA9IGNvcHlfZnJvbV91
c2VyKG1kYXRhLT5wdHIsIHU2NF90b191c2VyX3B0cihhcmdzLT51c2VyX2FkZHIpLCBtZGF0YS0+
bGVuKTsNCj4gPiArCWlmIChlcnIpIHsNCj4gPiArCQllcnIgPSAtRUZBVUxUOw0KPiA+ICsJCWdv
dG8gcHV0X21kYXRhOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCW11dGV4X2xvY2soJnhlZi0+ZXVk
ZWJ1Zy5tZXRhZGF0YS5sb2NrKTsNCj4gPiArCWVyciA9IHhhX2FsbG9jKCZ4ZWYtPmV1ZGVidWcu
bWV0YWRhdGEueGEsICZpZCwgbWRhdGEsIHhhX2xpbWl0XzMyYiwgR0ZQX0tFUk5FTCk7DQo+ID4g
KwltdXRleF91bmxvY2soJnhlZi0+ZXVkZWJ1Zy5tZXRhZGF0YS5sb2NrKTsNCj4gPiArDQo+ID4g
KwlhcmdzLT5tZXRhZGF0YV9pZCA9IGlkOw0KPiANCj4gSnVzdCBzb21lIGRyaXZlLWJ5LWNvbW1l
bnRzLiBQb3RlbnRpYWxseSB0aGlzIGlzIHBhc3NpbmcgdW5pbml0aWFsaXNlZCANCj4gZGF0YSBm
cm9tIHRoZSBzdGFjayBiYWNrIHRvIHVzZXJzcGFjZSwgYXNzdW1pbmcgdGhlIHhhX2FsbG9jIGhl
cmUgZmFpbHM/IA0KPiBNYXliZSBzYWZlciB0byBsZWF2ZSBtZXRhZGF0YV9pZCB6ZXJvZWQgb24g
ZXJyPw0KDQpUaGF0J3MgbWluZSBvdmVyIG92ZXJzaWdodC4gVGhhbmtzIGZvciBjYXRjaGluZyB0
aGF0IQ0KPiANCj4gPiArCW1kYXRhLT5pZCA9IGlkOw0KPiANCj4gSXQgbG9va3MgbGlrZSBtZGF0
YSBjYW4gZ28gb3V0IG9mIHNjb3BlIHNpbmNlIHVzZXIgY2FuIHRlY2huaWNhbGx5IGd1ZXNzIA0K
PiB0aGUgaWQgYW5kIGNhbGwgdGhlIGRlc3Ryb3kgaW9jdGwgYmVmb3JlIHRoaXMgaW9jdGwgcmV0
dXJucy4gSSB0aGluayANCj4gcHVibGlzaGluZyB0aGUgaWQgbmVlZHMgdG8gZ28gbGFzdCBvciBu
ZWVkcyBzb21lIGtpbmQgb2YgbG9ja2luZy4NCj4gDQo+IEFsc28gYXJlIHdlIHN1cmUgd2UgbmVl
ZCB0byBzdG9yZSB0aGUgdXNlciBpZCBpbiBtZGF0YSBpbiB0aGUgZmlyc3QgDQo+IHBsYWNlPyBV
c3VhbGx5IGZvciB1c2VyIGlkIGttZCBkb2Vzbid0IG5lZWQgdG8gdHJhY2sgaXQgaW4gc3VjaCBh
IHdheS4NCg0KSSB0aGluayB3ZSBjYW4gZ2V0IHJpZCBvZiBpdCBmYWlybHkgZWFzeSwgSSB3aWxs
IHRvIHRoYXQgaW4gbmV4dCByZXZpc2lvbi4gDQoNClJlZ2FyZHMsDQpEb21pbmlrDQoNCg==
