Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5CACCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:11:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D110E65E;
	Tue, 28 Oct 2025 20:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8qSRjDZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758C710E65E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682279; x=1793218279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jHY0l/jNB+ER1EhrDZTA4MSmnSMqmH/KE2fMcy4XaEc=;
 b=m8qSRjDZj+SLRjyIHeuEGKuy/cjJdmLtnqUn9l8MD4MjZyWluYZA8J9Q
 NlYGRIlS5GAFCsmHUi/YscdeblG314qE2r60LxystQIhJ4dY4zeJTCG70
 pdVtGraqFyGIk4mwfBmx6xsfSgJcpafhry6XaoTVWBKOOK1iHBvW5egRn
 gwvNYrvW1ABgx7oq+kqVZjoml+VNx0LNoJ/VAhsZjdwALUGr7hePWq7rX
 uU19FJK8gkx3CfTPiB/ArD4bcsXyv3+wgI3o+ParUshtJEMA8Fe8bZbb4
 QfjrHtsx14ErqgRYM0PZQHpYQPBhxQuGaqSLqmVWicNOuEyOmYffn/1wZ g==;
X-CSE-ConnectionGUID: 99Axd31sSDanTBJCrKmAbw==
X-CSE-MsgGUID: VVC7d6h0SESlsxOaKGA15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66410295"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="66410295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:11:18 -0700
X-CSE-ConnectionGUID: lLNsMUYKQ4W0/564Nku5rw==
X-CSE-MsgGUID: 5tN4a05iRPO0zOhwg7OX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="222669048"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:11:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:11:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:11:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwnBIisb9JGkQlyEJfBYom7R7mkmGtaEg0KcsRg5OysAqSqd7/cbt2NmdOk+h+P3fql56TNFoIqb9Xf0RcxQgytxbyFuJcQDXcAPpfeWJqMowzByzK0J0VkoWEKFCFZMl1sAR8omgdsDomhpNHY6mArATYQRUEnUG89yyl//Pb5n4xG//FI6NeZjvaFtCYt9sHlB8l1dUXzH49i5BRblD3FHJ1bmcn1wUZL0LB2VOmVs5vFr21CNcA3ZKW9ffqIvXrPrmjZ3y9JdFGr9bWEKIPaAtcUAg9qbU0H2QE36b+CSUMHnpmM/oVTf3fE+/OXwiqTXFAAvN38GO6xrfX2CKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHY0l/jNB+ER1EhrDZTA4MSmnSMqmH/KE2fMcy4XaEc=;
 b=n+hi7hBuLa9B5KzREqNZI7MVnHDK/569GCiI6JsXmCWXCXfVnafDPYeoGEu8Cn45Sax53/FCB16FBPb4PdrxrO9PFUcxk3GIQtAb/wYa1OA5Uk63aC4WFdaJeaIxQ6aibcuPgV8tfWm+rrnwmmZTBzIMeh1Yh6wLSNN6SZoUqq+LJckkP8XGxyhBB/7kV7wyEb9Gmyd9ZLr7f9Ijt8fbNXsMI3hc/M08eKhx+fLfFzQMfs9sjs9+iE/WidppJATBswJIqWvxs02XEjkghiFiq2VmgBqa4MvkwzPvs6+4wTTrM+84HI4eHH0NIPAdFp9ZJeTd4uB5/HG1x+ZGGugZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:11:13 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 20:11:13 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Atwood, Matthew S" <matthew.s.atwood@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Add additional trace points for LRCs
Thread-Topic: [PATCH 1/6] drm/xe: Add additional trace points for LRCs
Thread-Index: AQHcR2wkZpPKbjrjNkW2P5895k24ZrTX+FsAgAAGzoA=
Date: Tue, 28 Oct 2025 20:11:13 +0000
Message-ID: <684cde2640b6cbf3f6f684d48dd613cb78f8b275.camel@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-2-stuart.summers@intel.com>
 <aQEdqpNYfI-TDnYZ@msatwood-mobl>
In-Reply-To: <aQEdqpNYfI-TDnYZ@msatwood-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7270:EE_
x-ms-office365-filtering-correlation-id: 2c58167a-e297-4ecd-2fcf-08de165e24f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eithMVpiS3FkbFlNYTEzSzk3TGd5L2NINFhHbWJZVEEwZmtUTnE3d3RwQ0VN?=
 =?utf-8?B?N2J0UEZZakhjRjlFTTdlUUJ4NCtjTHVydlBXTzB5NktZeCtPWmRtc2ZCSjUy?=
 =?utf-8?B?azZkblpuNlpISm9JODdPVTVtUC8wSVVYdmFWMHJySUowRkd4WGcyMURBQXUz?=
 =?utf-8?B?ZHFrNThqZFBDZHZJTjBNcEI1UDFEajdEVTNnbmtIMlhnQ2FHMG8xb05ZbTY3?=
 =?utf-8?B?bkljYjRBb0R5L3RnMEJNdEN6SWFjSHhTUFptOWRCcHA3NVF3WWltaDdsc0R3?=
 =?utf-8?B?cUZEOVdrVlhQa2prYUFPeHpZYmVDRzYxcXFiRkVSQkx6eEhOem8rd3FHK3dt?=
 =?utf-8?B?K0ZpWHV4NmhGUktEU1R5WURaQm5VY2JzNjNCbzl6cDBOZWZmaVlacnZrb3dL?=
 =?utf-8?B?ZDFHTWdqZEVpMElnMUR4Slk4bUxINFBRWDFTRmhnMW5pdllmM1hMclpoLy9v?=
 =?utf-8?B?V24vY2NxWlAxYjNHZWp5dC8yZmpxamFuZWZ4eUN4aXMxM1lmT2wwenpuRTQ2?=
 =?utf-8?B?K05ydk15SVZrZG1XaW4rQTV3dStjdWFuQTZyM2ZjeFNpZzk3YW5idjlQNmJX?=
 =?utf-8?B?UlBsbFR5OHhqYXBkcWRjQTFaZHVHd1BETHJvRTM5YWpxWmJTUitYbWdOazh4?=
 =?utf-8?B?ZmNpdzlNd3pTckI4TkxSNlFOY2U2RW5iUTFxRklHZVFLSGptL2hHaEFUVUwy?=
 =?utf-8?B?Q01DRHdFMFJUMHJObE56ZVJ4MVFyOHZvRUg4UHNRcTVjTVJqZFNlclA2S1Fv?=
 =?utf-8?B?VnRvUU00cklldEFQMkIzZ1k5NGV3bnFsMU9WQ0lrVEpqNXlsODJPelFyTmEv?=
 =?utf-8?B?cFRncEtneHNMZWN5Q01ma2JFUWFkeG9qMVRSQlhkQnRtdGNvUUFxajhpamdm?=
 =?utf-8?B?cFZXZnREUFg5Zi9sVTlKMXNvWnJveVh0b0t2Vm9hZlV3dkErNVRiRlJndC8r?=
 =?utf-8?B?ejNDUmdvRXEwbGxkUzZteXFKYnJNb2JKdkt1MWFQcEh3WDZHaWZaOUY5ejlX?=
 =?utf-8?B?V0RCRVRTUG9iUzR2Q0VGWnAyVmg1Vk83OUlwSFJ5cXFQTXVXQVhDVDNqOHpB?=
 =?utf-8?B?QVBmM2NuSmZlWUxLSlFFZXl2bkZubXlKdEdkVEJsMCtIS0cxWXB3ME5MbXhE?=
 =?utf-8?B?cHhVQlNqS1NoN2E2R2VGSzVvTzFIb3crQW9idWkrcWpaQUhxeFBVSGUzWDZH?=
 =?utf-8?B?QWR6MFRqTGJRcUJzUEpTb091Q0E4NThReW1QcjNBeURWamd6Vk5GR2FUSm5i?=
 =?utf-8?B?VzFKVkd0TUJKWjg0azhaMklqZGxvaStQZlF3OHhWQUNNaU9MTXduc3lNYXFO?=
 =?utf-8?B?eWhaRHNsMVEvT05lZExJZHNEa2lGTG14WmJoa2FIM0dieUY1RDlyQW0zOEkr?=
 =?utf-8?B?Q2gvY1Rsc25vUFpSdmd1QWVSaTVTckI1Y1Rmb1h2ekdTVll3RXpHcnhNL3lw?=
 =?utf-8?B?L0g5bDMyK1ZCOXludEEzMENBdmIxdUk1b1huK29RZzBnTnpFSUs1SG9hVTBm?=
 =?utf-8?B?OHhzeDU4NjlPK0p2RWlXOFAvTjNFMDhTcHRhTCs2MGFYdUIzekg4TGpTK3I0?=
 =?utf-8?B?K3BWSXBzT0xEWEN3L09TVzJnMXRFeVhvY3EwNWdBMVRUYUEzM1Q4OHdHYVc0?=
 =?utf-8?B?Z1dKWlJHa2k2MGM3Yjc1dzEvSXE5VUZHU0lhUXM3SVFIczl6V2ZFbFZvSW9S?=
 =?utf-8?B?b1JkQmwxWkkrdnlRbXhFampBc1I0WG9GbWNaWDNRa2dGRW9vdFZWZExPMHA2?=
 =?utf-8?B?M0phNWVxcmRIMFRJbVo2SGdKT1lCOFAwYkxiaWNmcHVsK0pnVFdvMUFzSVI4?=
 =?utf-8?B?RTlIYkRXeXRpZDBJNzgzQlFMQTJ1eFZlOGRQeXFGME8yVGdtSnh5MVNOaFU2?=
 =?utf-8?B?czg5aXNhaUtGdFlmYVROSHZwVzJhazJnalB2WDU4dHFONnJaNTRpckVPSHE4?=
 =?utf-8?B?dkdaa2hMbzN0dExGcjh3Wndqd3BNQVpNWjBtZS9DT2hLdytRY294UFMzTVlq?=
 =?utf-8?B?Z3MrYWl5bklVK2VUdVNld2dEa2JlbVk5K29jcTFHT29EZURMcmZWMi9uZGxW?=
 =?utf-8?Q?WbTqPk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnNDZmE0bnE5RUwxdHd0ZFVoYXliMnVDVVFCNXZEekRzSHcrZ2Y3OTJraWhF?=
 =?utf-8?B?blBtbWZ1T3JhdVlvLzBsRUtJdnl5ZUg0eDI4YXZsMVB4dkJBZm1ZQnNpMHRY?=
 =?utf-8?B?bi9vQmE4MUh1NVpkcXhac2RIU09rRXE2c1hDR1lvR2Rxa0RmM3VmZVJ0M1Ja?=
 =?utf-8?B?TjhmZ1VyL0J0bTR2c0VaL3FoVFZSR3loZ1Y3ZVdZUW8vVUNWd3AwZEx0MS9Z?=
 =?utf-8?B?eUpvdVBpbjdLNVBCajhGejkrVkdXdG1FK3dCdHFFNmdsbnRrZ1dMREVUalJv?=
 =?utf-8?B?WC9tdWI0OEUvSjJlT1Zta0N1YTRVaHVJTnpVSlNXdXEwL2cyM1RQaWRwaXNs?=
 =?utf-8?B?K1FmNHpONzF1dG9mRE1JcVZwRkxKR3dOQVJxNHV2bWlEekVHTDFtRWxDbk1O?=
 =?utf-8?B?WlpRU1BCVXFsSlFNb09Qc2hsZklKM2c3bG5WNFVmYk9tcFJVNUpueElFM2Fa?=
 =?utf-8?B?SW8vc08wSDM2UjF0bHhnQmhMd0pscjlWVEJWVlozaC9sT0VLMFpremtYcDlQ?=
 =?utf-8?B?R1Q1K2hubWlaMFpSdXFyalVSYXZlYXNaTHpWYXNjY254SlpPd28xeWJFMDdI?=
 =?utf-8?B?dlYxV3poV243NDRWRml3WjJOVDRsODZmUTRCYjBrTFlOM042UnBKdmJUMzBJ?=
 =?utf-8?B?Ulh6ZG5LZytXTUZNRFFnR09ZRCs3dVdGZmVzVE9ydjVDV0k1bnF1TWE3Vkgv?=
 =?utf-8?B?WlNJaUpqZjduWkJKcU1PYnpwL1c4cU5TdjJRcndiYjZsbE1YR0JPYTRIdFpL?=
 =?utf-8?B?bjVYdXhyY3NobHdNcURYK3l5Nld1bVFNWXM4ZW5IaFZSQjh5QnErM1hJUFVt?=
 =?utf-8?B?d0psOVlsYW9FRCtycjVDU2dJazNTeXF0clRTbXZqbTdtNTFacVJtT01uQ1hP?=
 =?utf-8?B?V3R1MVlqZlJ2NFkrZ0Z1YkpoWWk0QUpTc3EwNUNGb0NRTjJLQXk3bVh3MDM5?=
 =?utf-8?B?WW9LOHhtVXpSOGdRNFRwRmxxUnNmYlI1a1RmM1BTL3dRYXJ6UTRNdzRWS0VS?=
 =?utf-8?B?SHJmbWkySVZYWUhQQ0VQSkRZUGxoVUtkeE1rdVg4aU5sQnlYTXNQZ2hSdlhi?=
 =?utf-8?B?ZHpIVmxaYkt0RHArZnNQNUtjNnN0U2h6WVBXakFzeVpJUFVyVGREZXJxaENH?=
 =?utf-8?B?clR1bDdTTXcrQ25xRURZVFo2alFDM0gwWS9xS3pXTjJFbWNLT0s1eXNUdmo3?=
 =?utf-8?B?VlRldUR5MlB2WHQwZmM0bS82dnBtdEhBKzBzZUlHY3B6cVhrN1lXcitTSXJn?=
 =?utf-8?B?K3ZSTElQaTFYRGpsQ2FIZWR4MDV1dzVMaFlSa2lBNXNUMjVhYmpva0x2UXhk?=
 =?utf-8?B?UW5Tanphbjd5TWFkc2ZmdjBDaDRRSytGbWI1M0VPUFZhSnNPbnh5UjRoTDJH?=
 =?utf-8?B?Uk9mOFcvK0JaK1Z2NERySzZpQTJocEs4UCs4NlVQT3kyN2VqQ010cVY1OFlJ?=
 =?utf-8?B?dDhJZFRja09CYTkxMzRSd2FxRTBxUU9GWkFaRStIQXo4a21LbndOak90RHBZ?=
 =?utf-8?B?Q0dLalZkUm4yR1BzcWc3ZHAzWXM0VC9saWQ1NEhvVTl3cjVoZnFmdDk5ZVdN?=
 =?utf-8?B?ZERoRUFDMjE0Q1FmSWthemlqUW5ZZVlzWmp4ZHpJZFA0WGFJbmsycm5PTStP?=
 =?utf-8?B?Z1k1RjNqVU1xM2xVK1JFWkNuaEpMdWxjdjZhRmVNMlZYc1pWc3JlaW5sakhC?=
 =?utf-8?B?WVMzR0lWWmFGZFp1WmFmdysvUDdPYkJicjdFN0pSejJKOSsrbjZLTXVOTUda?=
 =?utf-8?B?emtWNk9adWZRTmkzSUFnZ3phYnZKeUlDanpRRnFRRENwMmI0UU41d2d4NjRs?=
 =?utf-8?B?cTFXVmM0RDg2cXVNRCswZ0Y5OGZyMFNVQWhHK296NDVuNG9EOThTZ0JRcDZF?=
 =?utf-8?B?Tm1KcExSR3FlL0oyZjlUV3NsUEpWSXlUVndpcGduNHprdWd6NmYwaVdSVFVq?=
 =?utf-8?B?UG9ZVTVZdWtTNEh5YWF1VGlBNzFCeU1CelVoREJSK24xUkpMdWErTmdnOHRF?=
 =?utf-8?B?TkhJMjRueW96RWFNZ2l5WW9ORjVpRnMwc0xkK2lmZUkxcG1wSFNIcFJzZHl1?=
 =?utf-8?B?T3lPbElMWnVGV0x3MzRXbG40TkVoZ3JCTU5RajcwR2NlL2kvUmkrS3JGR2Ev?=
 =?utf-8?B?SUs5ZTBqeVQ4aWtnQlQ2RUpsNkFHdHFOU0RuVFdVbS9aTU1IanFyRUxtYzh0?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFD13BAD9989FD499F6292C25CE09B1F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c58167a-e297-4ecd-2fcf-08de165e24f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 20:11:13.5613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9+M/jPa3FqRpOOKuCxrWQZhkOo1Qn+E+yDoquuo/OV+rvT6j7j3EFIEtY+uGRXdDDl6YNGqX3w7NIFRGZVJ9tduFWA7a2SfpJ9fJK+wKZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
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

T24gVHVlLCAyMDI1LTEwLTI4IGF0IDEyOjQ2IC0wNzAwLCBNYXR0IEF0d29vZCB3cm90ZToKPiBP
biBNb24sIE9jdCAyNywgMjAyNSBhdCAwNjowNDowN1BNICswMDAwLCBTdHVhcnQgU3VtbWVycyB3
cm90ZToKPiA+IEFkZCB0cmFjZSBwb2ludHMgdG8gaW5kaWNhdGUgd2hlbiBhbiBMUkMgaGFzIGJl
ZW4KPiA+IGNyZWF0ZWQgYW5kIGRlc3Ryb3llZCBvciBnZXQgYW5kIHB1dC4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KPiA+
IC0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmPCoMKgwqDCoMKgwqAgfMKgIDQg
KysrCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuaMKgwqDCoMKgwqDCoCB8wqAgMyAr
KysKPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlX2xyYy5oIHwgNDIKPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+IMKgMyBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbHJjLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jCj4gPiBp
bmRleCBiNTA4M2M5OWRkNTAuLjQyZDFjODYxZmUxOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9scmMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5j
Cj4gPiBAQCAtMTU3NSw2ICsxNTc1LDggQEAgc3RydWN0IHhlX2xyYyAqeGVfbHJjX2NyZWF0ZShz
dHJ1Y3QKPiA+IHhlX2h3X2VuZ2luZSAqaHdlLCBzdHJ1Y3QgeGVfdm0gKnZtLAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUihlcnIpOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoH0KPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV9scmNfY3JlYXRl
KGxyYyk7Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGxyYzsKPiA+IMKgfQo+ID4g
wqAKPiA+IEBAIC0xNTg5LDYgKzE1OTEsOCBAQCB2b2lkIHhlX2xyY19kZXN0cm95KHN0cnVjdCBr
cmVmICpyZWYpCj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfbHJjICpscmMg
PSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgeGVfbHJjLAo+ID4gcmVmY291bnQpOwo+ID4gwqAK
PiA+ICvCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX2xyY19kZXN0cm95KGxyYyk7Cj4gPiArCj4gPiDC
oMKgwqDCoMKgwqDCoMKgeGVfbHJjX2ZpbmlzaChscmMpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGtm
cmVlKGxyYyk7Cj4gPiDCoH0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bHJjLmgKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oCj4gPiBpbmRleCAyZmI2Mjhk
YTVjNDMuLmZkNjc4MTBmOTgxMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9scmMuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5oCj4gPiBAQCAtOCw2
ICs4LDcgQEAKPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiDCoAo+ID4gwqAjaW5j
bHVkZSAieGVfbHJjX3R5cGVzLmgiCj4gPiArI2luY2x1ZGUgInhlX3RyYWNlX2xyYy5oIgo+ID4g
wqAKPiA+IMKgc3RydWN0IGRybV9wcmludGVyOwo+ID4gwqBzdHJ1Y3QgeGVfYmI7Cj4gPiBAQCAt
NjEsNiArNjIsNyBAQCB2b2lkIHhlX2xyY19kZXN0cm95KHN0cnVjdCBrcmVmICpyZWYpOwo+ID4g
wqBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9scmMgKnhlX2xyY19nZXQoc3RydWN0IHhlX2xyYyAq
bHJjKQo+ID4gwqB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKga3JlZl9nZXQoJmxyYy0+cmVmY291bnQp
Owo+ID4gK8KgwqDCoMKgwqDCoMKgdHJhY2VfeGVfbHJjX2dldChscmMpOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBscmM7Cj4gPiDCoH0KPiA+IMKgCj4gPiBAQCAtNzMsNiArNzUsNyBAQCBz
dGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9scmMgKnhlX2xyY19nZXQoc3RydWN0Cj4gPiB4ZV9scmMg
KmxyYykKPiA+IMKgICovCj4gPiDCoHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9scmNfcHV0KHN0cnVj
dCB4ZV9scmMgKmxyYykKPiA+IMKgewo+ID4gK8KgwqDCoMKgwqDCoMKgdHJhY2VfeGVfbHJjX3B1
dChscmMpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGtyZWZfcHV0KCZscmMtPnJlZmNvdW50LCB4ZV9s
cmNfZGVzdHJveSk7Cj4gPiDCoH0KPiA+IMKgCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RyYWNlX2xyYy5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZV9s
cmMuaAo+ID4gaW5kZXggZDUyNWNiZWUxZTM0Li5lOGRhYTVkMzIzZTcgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHJhY2VfbHJjLmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV90cmFjZV9scmMuaAo+ID4gQEAgLTEzLDcgKzEzLDYgQEAKPiA+IMKgI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiDCoAo+ID4gwqAjaW5jbHVkZSAieGVfZ3RfdHlwZXMuaCIK
PiA+IC0jaW5jbHVkZSAieGVfbHJjLmgiCj4gPiDCoCNpbmNsdWRlICJ4ZV9scmNfdHlwZXMuaCIK
PiA+IMKgCj4gPiDCoCNkZWZpbmUgX19kZXZfbmFtZV9scmMobHJjKcKgwqDCoMKgZGV2X25hbWUo
Z3RfdG9feGUoKGxyYyktCj4gPiA+ZmVuY2VfY3R4Lmd0KS0+ZHJtLmRldikKPiA+IEBAIC00Miw2
ICs0MSw0NyBAQCBUUkFDRV9FVkVOVCh4ZV9scmNfdXBkYXRlX3RpbWVzdGFtcCwKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2dldF9zdHIoZGV2aWNlX2lk
KSkKPiA+IMKgKTsKPiA+IMKgCj4gPiArREVDTEFSRV9FVkVOVF9DTEFTUyh4ZV9scmMsCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfUFJPVE8oc3RydWN0IHhlX2xyYyAqbHJjKSwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9BUkdTKGxyYyksCj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqAgVFBfU1RSVUNUX19lbnRyeSgKPiBUaGlzIGxvb2tzIHdyb25nIHN0eWxlIHdpc2Us
IGJ1dCBpcyBkb25lIGluIGV2ZXJ5IGluc3RhbmNlIHdlIGRvCj4gYW55dGhpbmcgbGlrZSB0aGlz
LiBNYXliZSBNYXR0IEJyb3N0IGNhbiBjaGltZSBpbiBvbiB3aHkgdGhlIHN0eWxlIGlzCj4gdGhp
cyB3YXksIGFuZCBpZiBhIGNoYW5nZSBpcyBzdWdnZXN0ZWQgaXQgY2FuIGJlIGRvbmUgaW4gYSBm
b2xsb3cgdXAKPiBwYXRjaC4KClllYWggSSBoYWQgdGFrZW4gdGhpcyBmcm9tIG9uZSBvZiB0aGUg
ZXhpc3RpbmcgdHJhY2VmcyBlbnRyaWVzLiBJIGFncmVlCml0IGRvZXNuJ3QgbG9vayByaWdodC4g
SSdkIGxpa2UgdG8gcHVsbCB0aGF0IG91dCBzZXBhcmF0ZWx5IHRob3VnaCBpZgpwb3NzaWJsZS4K
Cj4gCj4gUmV2aWV3ZWQtYnk6IE1hdHQgQXR3b29kIDxtYXR0aGV3LnMuYXR3b29kQGludGVsLmNv
bT4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCi1TdHVhcnQKCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19maWVsZChzdHJ1Y3QgeGVfbHJjICosIGxyYykKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3N0cmluZyhuYW1lLCBs
cmMtPmZlbmNlX2N0eC5uYW1lKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF9fc3RyaW5nKGRldmljZV9pZCwgX19kZXZfbmFtZV9scmMobHJjKSkKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoCApLAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX2Zh
c3RfYXNzaWduKAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19lbnRy
eS0+bHJjwqA9IGxyYzsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9f
YXNzaWduX3N0cihuYW1lKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9fYXNzaWduX3N0cihkZXZpY2VfaWQpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKSwKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9wcmludGsoImxy
Yz06JXAgbHJjLT5uYW1lPSVzIGRldmljZV9pZDolcyIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5scmMsIF9fZ2V0X3N0cihuYW1lKSwKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZ2V0X3N0cihkZXZp
Y2VfaWQpKQo+ID4gKyk7Cj4gPiArCj4gPiArREVGSU5FX0VWRU5UKHhlX2xyYywgeGVfbHJjX2Ny
ZWF0ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX1BST1RPKHN0cnVjdCB4ZV9scmMg
KmxyYyksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9BUkdTKGxyYykKPiA+ICspOwo+
ID4gKwo+ID4gK0RFRklORV9FVkVOVCh4ZV9scmMsIHhlX2xyY19kZXN0cm95LAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVFBfUFJPVE8oc3RydWN0IHhlX2xyYyAqbHJjKSwKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFRQX0FSR1MobHJjKQo+ID4gKyk7Cj4gPiArCj4gPiArREVGSU5F
X0VWRU5UKHhlX2xyYywgeGVfbHJjX2dldCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQ
X1BST1RPKHN0cnVjdCB4ZV9scmMgKmxyYyksCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBU
UF9BUkdTKGxyYykKPiA+ICspOwo+ID4gKwo+ID4gK0RFRklORV9FVkVOVCh4ZV9scmMsIHhlX2xy
Y19wdXQsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfbHJj
ICpscmMpLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyhscmMpCj4gPiArKTsK
PiA+ICsKPiA+IMKgI2VuZGlmCj4gPiDCoAo+ID4gwqAvKiBUaGlzIHBhcnQgbXVzdCBiZSBvdXRz
aWRlIHByb3RlY3Rpb24gKi8KPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKCg==
