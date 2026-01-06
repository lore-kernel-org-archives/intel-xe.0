Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC4CCEFCFD
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 19:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6859C10E1FD;
	Tue,  6 Jan 2026 19:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kt6ggFEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098AB10E1FD
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 19:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767728260; x=1799264260;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ceVpMQRm8kVnO75fJNBlohRNIGVONf0o7jxtF76l7Fw=;
 b=Kt6ggFEWN39u7ifjKFZfzSaTnFokl2GKJkJRVg3iZPG2OsVybkMxM3gl
 1ihoLlAUGIcZZL+m+I99v8sSNiFKVezF0mjWZz+80EC6GNMNis/pQMOJq
 0RCMJNzNoVSdOhXvUJ6sKgjQ9X6cprX6jBQFZoVyc57CpKrWJDWfFdtyg
 CEpjHJDuE0nEuj9if6jAEl64uc/fhMT1wYMHaLKfRgVA6if+ZgsBAydOn
 TnoelLzI9d2PAa7NVyREP/b7uT4SQbAhGQN5lSezkkFnTAF4+8g+KZxLw
 Zthk+6V74tGBAbNXDguq+djSdzSk5Yy6njzE6wITIphqNvwqMo+gEYg5q w==;
X-CSE-ConnectionGUID: AahN8xPxS0aFXIip6HR7Ig==
X-CSE-MsgGUID: 7cSWnbc2Sguw5/M+Ii1kjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69007589"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69007589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:37:40 -0800
X-CSE-ConnectionGUID: tX/8YsNiSs62ZKVM3JqJHw==
X-CSE-MsgGUID: lA/FrWe3QhWEYK2wIl94nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="203672343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 11:37:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 11:37:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 11:37:39 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 11:37:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqn1SGAKqsDnhZKXuoaPKur4j+zkmAKR2YRw3LkDyH21mvys16QCdIXZ2ViTJp59S1LldEIqNhcQqq/u4rdGmOlaUwg3GGUfVMJZLGWoMEcfDCgwXGrsTZ0cGCsI4kwFmNwr/Rr+LZJ78qWEfTXgr5UB4jszUBLVz2ck+Z0Z0VXkniiP5hcuMfNVW8EfFaTjtZqpW0o+eAZP8sCc/N9TEcFgv8tvxm0/aEPJCLlRGOgg/eDNF5xnaDi+2Zn+62v4StSolMZ8X6VhmAfRbHY2ztVZKU1LLZshwGSSKIVBzTDPc4LUXsAw+XT9Dh8duemDqLX435CpTceJR71yhDVCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceVpMQRm8kVnO75fJNBlohRNIGVONf0o7jxtF76l7Fw=;
 b=a8K7jbr86OSdl3BFjSqbzyNHsyZhMWtYX7x9twvmzcnuISPY1e0XCf6iOh2Gl81HiLba3k6rA4zkqqgAPmszqbVlxkvjPW1jeW5LIh173CwFr8iJ8KcIcMtoX2V+PJp6vei0s++uwyeUwlsiOxISezpxK0ay0OId+fqCxL1hLweMCyIWrpmBfWfIhNXos+yLtOkzVh59BivL2gLi6um+AP1V0XunhWg/bvyyVbc54uOdWmDzD3Q+KtUQ81OOk0RFRDcwODPNwki+wbQsAJMya7tRFLfZwKwag6jVrG3LNehgxF8kHsbVhQQn6ERthd8kDVvx5mrk5JdWCEQN2YY/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 19:37:37 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 19:37:37 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Topic: [PATCH v2] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT
 reset
Thread-Index: AQHcdGBJOubY3DcNa0asMHnZXyZ4k7VFnw2A
Date: Tue, 6 Jan 2026 19:37:36 +0000
Message-ID: <dfdceca79ef128c36515cdaf6f6d934b6ec56a62.camel@intel.com>
References: <20251223230248.59814-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251223230248.59814-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB6470:EE_
x-ms-office365-filtering-correlation-id: e518ed4b-98ac-49c3-c6bb-08de4d5b0be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?enBDekdYcmFKendjTktFcytDM2ZhdkJqU1ZvR01DdzlHY2Qwa2lkR0grOEZp?=
 =?utf-8?B?a0pvTFdVNGs2ZUhURkRDME1tZ0R5S0Z1WUtTVmpWS05UQ3pVZHdDMWNVQ2NU?=
 =?utf-8?B?OVlsT3dHbUZSRmY1K1UyanlQc051Uk9mQjhYRjdkYys3WWVVTVRqRHBRWlVZ?=
 =?utf-8?B?VFIzRFE3QlRYT1I1Rk9sVTlXWjQ2ZGpmbXcwQVMxWjNCTGxjNWErZjFUd2dq?=
 =?utf-8?B?VnhxTmtwSEpRM2dFUHFxNWVpRUwrUklENVo3a0VTSDZPS0doYS9RWFVUemV0?=
 =?utf-8?B?WUtvNHltOUIyUjl0V2xuRy9qeUdBR2tkcGIramZQcmdHbW5ESmJzS1FmRjlG?=
 =?utf-8?B?RWo2MHVBaWhHWUZuRjNRRWF5NThHM01rN1JrQjA5ZFIreDIvR29JUnNuZmN0?=
 =?utf-8?B?NDhGZWRmeDEyQXRhTGFmKzRMK2x4V3VSNlRWSncyNW5NdUl5Q1p2M0htQ1Qv?=
 =?utf-8?B?L01GZktNcG5ZbDBKbi95cHVwN0FsQkZvMnFuMVUwblpwVllsRFVINjVYOHZM?=
 =?utf-8?B?RlNrdDZHOElsbitPSmUzZW4wY0Y3OVRtMDlkRVVZTUtJY0lnYnJPOEEwYWlK?=
 =?utf-8?B?YkdMYUdhUFl3MG1nY2dnTnNQbEJSSHFmSTJCRkdmZ0Rha0xRSm1wZmxKdlNv?=
 =?utf-8?B?eEltd0s1cTQydVZqQVdleFJ2YzJmTEdjczJwWktsUEU5RWs4ek5jVmY3bi8v?=
 =?utf-8?B?NktFRnk3Qmc3ZmZ1ZDg0cG9ieVhzZ2lPM3h5UjlrN3NQNGlwT0cwenRVeVFw?=
 =?utf-8?B?b1pCWTk2OFBGdUJHcXVUTzhOMXdiODByanlncWZ6Mmhza0F3S3lvVXdrWUZQ?=
 =?utf-8?B?SytiYnZuVWdGUyszWk5Fb29ScEJJSHkzbFEvVFMvK05KL2V4eUFFQkJCNG1K?=
 =?utf-8?B?ZkZBV2czR2FYOFZzYUFtSnlReE1pellXM2x1Qk5mSUh1SUMxdmZWeUp0RGx4?=
 =?utf-8?B?R3BOWmcrbDFCK3VadnVJa0NpaUNjOWliV3pBdkNJMHk1UUVUN1Nydkc1WXdS?=
 =?utf-8?B?RFlLTXFPNThSa2FQRkVTN2VVT0FqeHoxRVp4djFnczhDUlNFOTU3UjhPSUZt?=
 =?utf-8?B?bzJUaDZKcEtPYm1CbllRbHdzYnNuaXlQbUdrZzE5akZXMEFSV0hlT1V6OXJY?=
 =?utf-8?B?ZlNZblFXVDFQS3ZTbTNDZDZTNm4zVElwMm5zR2RsLzI5cUpEMzNMNlAvOTZL?=
 =?utf-8?B?MFJrS29vc25yd2lFazZvU1RnTGFreDkyN1V3N1JrUWlvWXc0eFVPOC9KdzAv?=
 =?utf-8?B?aHh2R1Z0N2d4YlZCNFo1NDNzMnZBVEJ6MktTcy93QmFSSDJpckhIenUzL1NO?=
 =?utf-8?B?ZlZyYk9YNnV5M3VXRnVuZm5iV1RIOEdNcERqWFBiRlBpamVZRUJqUkg4WUUx?=
 =?utf-8?B?OFVyTk5seHloR2VVWG5JQU5Sb1FEcHZueG1NMUxPbEpqSWhOMTFNZ0hoVzdH?=
 =?utf-8?B?YmhVQU5iVTVTQWdhU2RZRlJvRCtMWlJrV3piZ1JVMDV6UStITm93d3YwdTFP?=
 =?utf-8?B?ZDUvdlA4c00xNnp6VVptSWlmVmN5L1dlMTNQUGs3U3djZ3ltZHV2bXl2Tm0z?=
 =?utf-8?B?YWRjQ2ZpOTZqZExjWWk5NDhDckhCaEZ5YzFCRHB5UjUxZlFnL0dlYWxPWkQy?=
 =?utf-8?B?ZlJKUHorN0gwQ043SzdjZm16aTg4dnlOdCtRS3FoQXovS0V2T3U4VkFCajhM?=
 =?utf-8?B?cFZpbkRldks2dU9yMWJxOWJ6WVE3UTBEbld0SjV3ZWlzckx2amxNS3lkTVNn?=
 =?utf-8?B?OCt2Yk1CV0prMjJnbnRXQkc3QzJQczBkc0pFa1dOWHp3RTNZNWV3SU5zNlUv?=
 =?utf-8?B?Zk1HaHJoaDlVWlJmaUhHV2xtaGRWdThZUjFSUndQTVlOcHNBY0g0T3VzOG40?=
 =?utf-8?B?R1VMZTBnbG4yQUN2bjBnRXdkQ2V4YThzWjVkdTBmQWdidEVuQVlpNytqTXFW?=
 =?utf-8?B?aHVPYTUxVVlZbzJkRWFMMk53ZGd3a2ZlY1RFV0hWeW9VSzVONTZ5azZnUXpr?=
 =?utf-8?B?aGNUaWo2dTZ2YkxKWDBPT0lwcjJIL3hKOGhCM2FqRUFURzJJMkYyNGd3akYx?=
 =?utf-8?Q?dWBpYc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEVEWGZZTnY1T0dlL3FFZXdSckNGQmZ2V3owZlhsYWZXU2xwaVNLN1l5QkZh?=
 =?utf-8?B?ME04R05LQ0pTSEE5VW9idmtteU5HNVNDemgxRmVoby9KUUVPbEJaWWNINGI1?=
 =?utf-8?B?WFVoQjFHOExWTTREaSsxYmkvZ3pEcGxKTzhCYkJ5dTJtbjNzc3lqdWs1bTBQ?=
 =?utf-8?B?YnU0ZTZoOWRqTGl6QU5tR3UxdGNNbkQ1L3g4UG1PSDNUTEVyMXQwQllXcWFh?=
 =?utf-8?B?WFJSY2E3bkhYN1lWcUxacmRzdW1EN1UyUGhGQUdsOFBZSFpCbVNaV1dIemt0?=
 =?utf-8?B?QzdQL0JkcU5WV0lxQWhuR1lJYWVhL3hKUUd5R1ZYNTZuZnNYUndQcjgzd3Qy?=
 =?utf-8?B?V05QL0JEYTh2OGFsQjRPSWMwUXRGZlFCTHRNbEUvYWZkVHV4K1VhdjIzZ21m?=
 =?utf-8?B?bTFFUC9rY3Ryd2dkZ2pQMloxcHZadERXY1d6TXBkcDAvU2hFVnp0eU80Nnc5?=
 =?utf-8?B?dS9ZSFhrbStZK3JsQVhvZmlDZWVyUCtDdkhhZzJBMnVWeUoyUE5HakdqR25X?=
 =?utf-8?B?ZzFUcnphUitXMVp4b2YxSWVQbHlvTnNLdEVuaG12dWwwUkUvV1p6NWJBaFFH?=
 =?utf-8?B?U1dZU1kvMjFWS21FSzY5eVFlY3lrS2phWFB0OElLejJUOCswbzl2a1orN09S?=
 =?utf-8?B?ZkZUMHcxS2xJVXRKdlpFVlllQkZUYXJkQUZrRlNmSHhoQzdVUUtpUU8vOCtz?=
 =?utf-8?B?amE0Y3BzNGVMMUtUTjVDTGJrUXRldkNvblIrTEdKL2ZGTHMxVTdQT09RcGlL?=
 =?utf-8?B?TFovckM1N2FrY2xvc2kySlZ2WklhN0llaldQK1I3djVLa2k2WTdBRkdSVGsz?=
 =?utf-8?B?UW9ZWjVJV3BDL1RPUzRQbjBNUVIzcWpsdGpSeHAwZDNSaTdHU2lRVlBLZXI1?=
 =?utf-8?B?N1NGM01qVTJQcnRmN3hBcC9pUUQ4aWp2cFUxZ21tRkxlQ3RDOG9naWRhUFpU?=
 =?utf-8?B?VXFFeFlPTjlaRDZuM0NoNzA2M0NFTXIzcFNqaG1KV3hnOXRvZGN1c0xzTjdy?=
 =?utf-8?B?WGpuZVdGZks0TzAxYkZsUnhKWUIxdm9aY094ZDlUa0hBeWxqVG5tdmV5Q0dJ?=
 =?utf-8?B?bjNCU1ordXhuU2lQZFNCakY4VVdNVUpVaUlYTVdET0xIMXdOME5HaUF4dHAw?=
 =?utf-8?B?YktkdDlXN2hOQ25YYWlyL2ozeVQrV3ViOWtlbnJLWW5OWEdmdTVBRWpJUnk0?=
 =?utf-8?B?ekloamU4blA2d2JUSGZTVElibHpzdDl3TUhpV3NVRmg2TnAyLzZ6N0FNNFdi?=
 =?utf-8?B?Sm9qSmdwNmY2YlFaK2pyb1d5Wi95ektzaWZGOUlFaE0zWS8vQmRrNWFpRmhB?=
 =?utf-8?B?ZjczRGdYMkdZczBKQk9lQXVqZEZxVmV1Z1Rac1RTRkcyVVlxRkN1Q2ExYjRO?=
 =?utf-8?B?Sk03cWlPMGVkNSt3TUhHNFpaY0VUMENnczVtZSttYTVaSDAvMmhCWGc5dTA3?=
 =?utf-8?B?T1k0QktZSkNQZVM5UlZpQmpOQmh3cGJ4c29nMURJVDFNQXlDOWpHa29jS2NJ?=
 =?utf-8?B?QWlDT25IRzY5QURjcmRtNjI1THdncHhXcFlTdVJjSEdwU3pYYU9MWERQcGNE?=
 =?utf-8?B?YjBuNFJZVnJya2d2aXhIZ2c3YU45bG1mMnhMSFhaYjB0L2xDZmNmNk9BalBu?=
 =?utf-8?B?Q0JiQ3BVNGdGQWt2cGRZWTVQVjd6TDFxcFNXUkNxazFsVVlnQXN4RVBGamJ1?=
 =?utf-8?B?K3dObDZRZS9nOUVZZzEvcjMvNmd5aGx3ZVJRRHdLSlo5TkdPYkZ6NENxMzcz?=
 =?utf-8?B?RjIwV0tHWW45OEJJSzc5cU96ZEx4TW9rejJsbENIdVVRR2pSczYvWk1FbzJv?=
 =?utf-8?B?V0dnMDlydERPVnFiMlJSZGVkendlWUpjOEQ1dmtDdzg2OWtiTzBIN0hIeFkv?=
 =?utf-8?B?WFVRai80ek9LeDhyMXVrMEk5NzZ2ZzN0TUZkSys4eEFZZSthdDF2VW16dE0v?=
 =?utf-8?B?Yk01YWJqK2xUTXlpUEVMZytVVHMzTkN2TkRpTXlQZFdaL2tXTnhXcGlSK2tN?=
 =?utf-8?B?N2hZRjE0U3dsTW9TYyszTGtPMm53SnZlcmtON3N3eUozZkYxdTdaSXk0U2k1?=
 =?utf-8?B?NURUNzl5VmtzRnJHaSt2eVZuZ1ZuZ3pMWUU3N3ZDL1ZwejB6T2lxbFgyWWE4?=
 =?utf-8?B?Mi9QQ3hQZzEyWmZKODQxdjMrL0s1R1hwZFpRR1dWdTF3UkZyeHFZUnlVUXFx?=
 =?utf-8?B?T2lFTGxGUDFDTy8xa1FCK2grbVU0QnZBcjFhQ0dhVE9yZEJtellvWTBhdGpT?=
 =?utf-8?B?OVlNRHUzWkZ1TStjM1hGWnNPVzZwSkZxWDYxUnFJc1BlRUJFQkxxVjh0dUov?=
 =?utf-8?B?bkg0aDZLSUU2MDZzMW9pRWxGMHEwT1Z6Z2oybmJWazhSTk9UNTJnV2Q2bjI1?=
 =?utf-8?Q?nM0wTZ5R2vuZd26A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78373C9FCDE5294D94B9A27281FB0069@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e518ed4b-98ac-49c3-c6bb-08de4d5b0be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 19:37:37.0020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndMCvtMR9FuD07D8IAS+fZqQTNYqMCyyvDuRnBDFmQ3N7kBxAogd7C4PU5gXAlRf6T88WxcJIG1AIeSBJSsJunE93HD1DeHzUAiWx8wogJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDIzOjAyICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IEl0J3MgcG9zc2libGUgaWYgdW5saWtlbHkgdGhhdCB0aGUgR3VDIGNvdWxkIGJlIHJlc2V0
IGluIHRoZSB0aW1lDQo+IGJldHdlZW4gcGVyZm9ybWluZyBhIGd1Y19jdF9zZW5kIGFuZCB0aGUg
RzJIIGZlbmNlIGNvbXBsZXRpbmcgaW4NCj4gZ3VjX2N0X3NlbmRfcmVjdi7CoCBFeGl0IGVhcmx5
IGlmIHRoaXMgaXMgb2NjdXJzLg0KPiANCj4gdjI6IFJlYmFzZQ0KPiANCj4gU3VnZ2VzdGVkLWJ5
OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyB8IDExICsrKysrKy0tLS0tDQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gaW5kZXggZGZiZjc2MDM3YjA0Li42NGFjOTg1ODY3YWUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMNCj4gQEAgLTEyMzgsNiArMTIzOCwxMCBAQCBp
bnQgeGVfZ3VjX2N0X3NlbmRfZzJoX2hhbmRsZXIoc3RydWN0DQo+IHhlX2d1Y19jdCAqY3QsIGNv
bnN0IHUzMiAqYWN0aW9uLCB1MzIgbGVuKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsN
Cj4gwqB9DQo+IMKgDQo+ICsjZGVmaW5lIGN0X2FsaXZlKGN0KcKgwqDCoCBcDQo+ICvCoMKgwqDC
oMKgwqDCoCh4ZV9ndWNfY3RfZW5hYmxlZChjdCkgJiYgIWN0LT5jdGJzLmgyZy5pbmZvLmJyb2tl
biAmJiBcDQo+ICvCoMKgwqDCoMKgwqDCoCAhY3QtPmN0YnMuZzJoLmluZm8uYnJva2VuKQ0KPiAr
DQo+IMKgLyoNCj4gwqAgKiBDaGVjayBpZiBhIEdUIHJlc2V0IGlzIGluIHByb2dyZXNzIG9yIHdp
bGwgb2NjdXIgYW5kIGlmIEdUIHJlc2V0DQo+IGJyb3VnaHQgdGhlDQo+IMKgICogQ1QgYmFjayB1
cC4gUmFuZG9tbHkgcGlja2luZyA1IHNlY29uZHMgZm9yIGFuIHVwcGVyIGxpbWl0IHRvIGRvIGEN
Cj4gR1QgYSByZXNldC4NCj4gQEAgLTEyNDcsMTIgKzEyNTEsOCBAQCBzdGF0aWMgYm9vbCByZXRy
eV9mYWlsdXJlKHN0cnVjdCB4ZV9ndWNfY3QNCj4gKmN0LCBpbnQgcmV0KQ0KPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKCEocmV0ID09IC1FREVBRExLIHx8IHJldCA9PSAtRVBJUEUgfHwgcmV0ID09IC1F
Tk9ERVYpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsN
Cj4gwqANCj4gLSNkZWZpbmUgY3RfYWxpdmUoY3QpwqDCoMKgXA0KPiAtwqDCoMKgwqDCoMKgwqAo
eGVfZ3VjX2N0X2VuYWJsZWQoY3QpICYmICFjdC0+Y3Ricy5oMmcuaW5mby5icm9rZW4gJiYgXA0K
PiAtwqDCoMKgwqDCoMKgwqAgIWN0LT5jdGJzLmcyaC5pbmZvLmJyb2tlbikNCj4gwqDCoMKgwqDC
oMKgwqDCoGlmICghd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoY3QtPndxLCBjdF9h
bGl2ZShjdCksDQo+IEhaICogNSkpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIGZhbHNlOw0KPiAtI3VuZGVmIGN0X2FsaXZlDQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gdHJ1ZTsNCj4gwqB9DQo+IEBAIC0xMzA0LDcgKzEzMDQsOCBAQCBzdGF0aWMgaW50
IGd1Y19jdF9zZW5kX3JlY3Yoc3RydWN0IHhlX2d1Y19jdA0KPiAqY3QsIGNvbnN0IHUzMiAqYWN0
aW9uLCB1MzIgbGVuLA0KPiDCoMKgwqDCoMKgwqDCoMKgLyogUkVBRF9PTkNFcyBwYWlycyB3aXRo
IFdSSVRFX09OQ0VzIGluIHBhcnNlX2cyaF9yZXNwb25zZQ0KPiDCoMKgwqDCoMKgwqDCoMKgICog
YW5kIGcyaF9mZW5jZV9jYW5jZWwuDQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gLcKgwqDCoMKg
wqDCoMKgcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KGN0LT5nMmhfZmVuY2Vfd3EsDQo+IFJFQURf
T05DRShnMmhfZmVuY2UuZG9uZSksIEhaKTsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gd2FpdF9l
dmVudF90aW1lb3V0KGN0LT5nMmhfZmVuY2Vfd3EsICFjdF9hbGl2ZShjdCkgfHwNCg0KU28gSSB0
aGluayB3ZSB3YW50IHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIGhlcmUgdG8gd2hhdCB3ZSBoYWQg
ZG9uZQ0Kd2l0aCB0aGUgZ3VjX2N0X3NlbmQoKSBjYWxsIGFib3ZlIC0gYmFzaWNhbGx5IGp1bXAg
YmFjayB0bw0KcmV0cnlfc2FtZV9mZW5jZSB0byByZXRyeSBhZ2FpbiBpZiAhY3RfYWxpdmUuIFRo
ZSBpZGVhIGJlaW5nIHRoYXQgR3VDDQpzaG91bGQgZXZlbnR1YWxseSByZWNvdmVyIGFmdGVyIHRo
ZSByZXNldCBhbmQgYmVnaW4gYWNjZXB0aW5nDQpjb21tdW5pY2F0aW9uLg0KDQpUaGFua3MsDQpT
dHVhcnQNCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgUkVBRF9PTkNFKGcyaF9mZW5jZS5kb25lKSwgSFopOw0KPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKCFyZXQpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBMTkxfRkxVU0hfV09SSygmY3QtPmcyaF93b3JrZXIpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmIChSRUFEX09OQ0UoZzJoX2ZlbmNlLmRvbmUpKSB7DQoNCg==
