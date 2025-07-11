Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327F6C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76EC10E2DB;
	Fri, 11 Jul 2025 21:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyaQZwhR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FDA10E2DB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752268871; x=1783804871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=N92mjbk3QQ/vw2V6vi+BFp2OyWCkbwOCPW/Ll4FueXo=;
 b=ZyaQZwhRMAk+r65I+s+uDqfw8w4Py/KHYtfPIFkHoFV0XIwzdHZhypIF
 2Pa0BNpzfpHxE6bydkrmICGJuwcWJ8TnELMy5bi9xo8QFsLnzmn3qsKNu
 W5ZQEVNpVNZKROxgOE3k12BuM/7o8Ls7hKbofWdJY64+NDj1JU70nvBOn
 RrBwVa3BCHguFJHm7lmf5G7qHX/8E7kwEoixHFL15miD5kL10ZNJdIduA
 N8qJSOAh6Sj1ytiR7kkhp6wYFT656hmmxdBZsEPnBsjzYjsT2j+/8EUD6
 OjZ+IVko0ZXEqnV/MY7OcS++DPsDepynIZT2DbS/ZGZSfAYF1QxgDPh4U Q==;
X-CSE-ConnectionGUID: +jHcP6DET6SRF836/u4jug==
X-CSE-MsgGUID: 4nA7Ijc2R2qjoBwquMljQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="80004189"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="80004189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:21:08 -0700
X-CSE-ConnectionGUID: 6rlzS3+kQge1ESw584vi/Q==
X-CSE-MsgGUID: RynMbDCHThG7/71IaEREfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="187451986"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:21:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:21:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 14:21:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:21:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPzh2JEoyXELbtacAACapx8pqA0ZxShnC9cPnc2R5GYt278gDkEuDXULiU6xsPO91cIW7Eq+DuQd6E4u4DiKrpE9MAdlhvJgX1lKKS9SKL8zafL5e6PROL+t4/lnBOqvgKXeauq/Yy3Q4pMDOw5fBmUT4lmTfkBs6bF7azfL5qd1gLYwFPJH/m9tigyn2wgoV4ZmSVFR3p0a0QKvXymsH8s+YV9OFfYemivXbyl8FPJ6I4KCJEsPtMR2HlEbxWzVMfJLEojGyx6x8/7bCpxfqR8z2jMgluK9rY043Na/O4054Vl+5/5AFg/g+3XQp1S0GyjHQjvfjNToRTQEVyguGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N92mjbk3QQ/vw2V6vi+BFp2OyWCkbwOCPW/Ll4FueXo=;
 b=X+QzAGlfzsdw/1XT4pe7AOG0s4wde1BNuWLwR1QMM/dEYBScjoIio3XliZT41FTnNRceP5Fe5h3pPfQ7IdMlfBLnPmh1kDRA3Ty5uYeUCnw7Rp9MaX61k6b3dz1KzS1XIfXo+ihqSN7aPh/hGlk+QModkuvS2NPIfi66Kx2e6yCsP+YWrujLHQUU/gP2mXAXrIvRIGbAO8wIJYbCsTZXdDgU0+b8SAZ1toy9rkQdmEpd2avGMNkBjGvonmtHpQQ4nf6h3/4geh80zncZ28MxG1hGUnWFJsOd2W0Tyhzh4In3pRnvHyU5rbyIzh+8V+WBaq3HPZFGc992qrbjDZXvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB6687.namprd11.prod.outlook.com (2603:10b6:806:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 21:20:18 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 21:20:18 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/9] drm/xe: Explicitly mark migration queues with flag
Thread-Topic: [PATCH v2 1/9] drm/xe: Explicitly mark migration queues with flag
Thread-Index: AQHb66rHWhkWs0vlQ02fL1LSn3Tb+bQte9sA
Date: Fri, 11 Jul 2025 21:20:18 +0000
Message-ID: <41bf49abf4c487363a4bc8a836080ff52b849d41.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-2-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB6687:EE_
x-ms-office365-filtering-correlation-id: 9816e5f7-4ddf-4d06-f8e9-08ddc0c0bc93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ellSVlEwMDFzYUFXSHRLQU5EQ3NEVFlmMWpiZHB6MEpIUjhHaDJBakh2azNP?=
 =?utf-8?B?Yks4VmVMWlJweEZoWElLcHVkVkJSYytHMVNKeTkxQUpadmFCdnNIandJYllr?=
 =?utf-8?B?eWNJWTRXZzRpSFRXckE5eTVxTDNRSXlOSCs1ajFVdlE5dnpwOHBDVC9WMDNK?=
 =?utf-8?B?a200V0M5YUVCUnlnWmlncGNhdEE3Q0RzWGh3YUJWTmdRMVNDVGZ1K2NWdlJn?=
 =?utf-8?B?dDN1eFQ2Mms2dWpadk5HdU4wdWJjZTd3c3NQYUdoT0pzMXErU3U0YmVIcmlO?=
 =?utf-8?B?Q1dvQVpCeVpOa2RMd0d4dlY2eTFkWDFyVThLQndCejY0QUE4SUF1dW0rbWV0?=
 =?utf-8?B?ZkxsY1dWSFBUeHVRc24xdFNKM05zTW9YckRaSnp0bHFjdjc1cFgzYm5qcWFp?=
 =?utf-8?B?d3huZjRjNVBaQ0V2eHpranFHL29YbVgwd0VLOEVTczhGckh1MkQ5ZXEwbnlR?=
 =?utf-8?B?cDlKRHVKWXI4djF1S1lBSURPekIyYlI0N3AxOVBQYk44SHo5T2h3Wi9MQWln?=
 =?utf-8?B?L0hkYzlLVkZ6VFNiWDdNNHpZTUZPMTBUdkdxbHhWcnJiRE5XUE1yTEkweCs1?=
 =?utf-8?B?MkFDS1ZFL1QycFRDdHBHSG9KbFZDZ09hUXZQUGRZL0hPUVdxaEtSYlc1WjFJ?=
 =?utf-8?B?bDlvT25RbS82d2ZLdnFGT3RNVHl0R0dlblM2S2NGeUVSL2IzTHpOcCs5ck9h?=
 =?utf-8?B?UVJMNEdHQ0Vaa1ZuZ2xRRkF5NkFiSm1idkViakZJdE11RFcweUw5eXBVUzRL?=
 =?utf-8?B?eGtTVHFIK3QrWVZQZTIvQ3phVjREMnBKNWZIY0drekVlZU1iMnp2T2RYVlJr?=
 =?utf-8?B?QnIrUlh3UDZ2T0hHUmw1TWRmTEs5cERiZlRDajhjYVlMWldFMnU2S05KSkRY?=
 =?utf-8?B?dG5tVlU5Y3BxSnloQXVrTjN3YmZ6WUtxMUlJSitvL3o0bE5tdjN2YzZMam9I?=
 =?utf-8?B?VzF1WGpXNS9PbVIvcjhOQk1YeFpYTmNwZFJhR2dHZitHRmZHcWdQeDBqMTRF?=
 =?utf-8?B?eFZBUDltYnBmYVBqaXlaNWxkQTI5QTFkQU9oT2pUUHpIZFZnNlM0Zld5a3NK?=
 =?utf-8?B?TkcyaUNTcTB2QTNUUy96ZXZYZmlwTmkvRzNGNmQ2V2ZXaG5ZcE5ZZXNuZU42?=
 =?utf-8?B?NlEyMjFvbitCblRCdURydnVzVkFYdUVNQzFkTG45QlNSbXlKVG1nYXo1TU4z?=
 =?utf-8?B?VzIxam9EUkJBekZlckR6RFhWMVZ2VmZwL0RCR1MxMUJ4NzB3NU40cVdNb2RS?=
 =?utf-8?B?cUpqSmVIamNRclgwYnhxV2ZjRkJyU1IrZ2NwSzlYZ0lFZDNLQ2QwV0k0dUNt?=
 =?utf-8?B?NVlBWHZ3YnlmMWtNTFBGTlQrTHRWOWxxVnR0T2RoQVFrZG9tVXRidFJOcjQv?=
 =?utf-8?B?WEFuQW03YWJpM3V6aU5Lc0JGOS84Z0lmL1hSSmNmcUZXWC84U0RobFExZDlq?=
 =?utf-8?B?Y0Urc0s4azRLWnY4Ym45dWsxamo0dkkzbjBiN2FqK0krNndER203d1V1OUc5?=
 =?utf-8?B?N3d5bzBiSlFJZE9ZRnNYTE1XUE04NmlRL1k3cy8xVmdWd09LWFpmZWl6bzgv?=
 =?utf-8?B?UklpOWF6SVo3R1o2bmltQWtMNTFHOE1JRnZ3b0RBbHFaRUNoazlNVHdZYXB5?=
 =?utf-8?B?dVEvbnhjS2pITU9sUGdzL1MvdFM0K2hTY2daS29zUCtZNFl6OXpyK2JnNVFx?=
 =?utf-8?B?OVRKcVduQzIxZmFlV1ZrQ1RYdkdQS2xPVnVZVDFRbjJRZlJXS0dpWWRMUHZ4?=
 =?utf-8?B?WktnWlBqajQ5L0dLZkxIaVFNYXF6Ly9heExkSUhqemp3cjk0UGc3UWkyclF6?=
 =?utf-8?B?VGRyb3pIZjMwVWRNYWtjR0xOWHVxV0hYTFlwTTBoZWd3OGR3djB2Z2xHNGdm?=
 =?utf-8?B?dUlOY296RjQreEt4QUpQZmxZMzY0Ujl6d2VzbXNxT2p2YWZIZzllOTF3NmNt?=
 =?utf-8?B?QnpYaUo1c0NJbCs1S1BQbXFibnZNRjc2M0JHaGJMTldTSEFxbm9zQTg1RWpv?=
 =?utf-8?Q?G1KBFhxbBtSrYO6sl3HYNAvfrROjKc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWxaeWlrQzc2M2I2cVJDa3RKQ2EyTHJOOTVsOGF1VE5ablpDRU50M0ZlSGZs?=
 =?utf-8?B?aUdUYmFhWlY1NlA2R1o1T0dnSDJWa1F0OTYxZFV0MlJaNTlLMlhaQ2pJQ0pU?=
 =?utf-8?B?ZWtZdlNGQlNWMnZKUEZHQ0RENlc3YWdkQTBMZFk0TzdJS0VJKy9Tamg2OTNs?=
 =?utf-8?B?S08zeHpxY0Z3YitBcDhZU2toY291UjAwZ1RLeFlUcWFTaEZhcVFtRkV2RVpm?=
 =?utf-8?B?L0diUlpxeFkzNElhbW9CVGZHRmR3Nkl0RGJJM1JDRXBKMU8zSmRxNE5QYWR5?=
 =?utf-8?B?c0IxQ3NoN2lidTR3QjRZVm5sdTAzN3BTSmNvdm1RdTVyRU5pRk4rSFNxMGNt?=
 =?utf-8?B?UkVSUytVSXZZd0hKZ2cxM1NxTW5HQldUUDZBVUtubDdOYSszTDJRa09vbHpB?=
 =?utf-8?B?WnFZUWE2blJreTNhUXJFNXR1T0hHTy9hampselRZUE5vQ1B0MHluVXp6eCt2?=
 =?utf-8?B?Y3cwYk9rais0R0I5bGJUMmk4TzkvUHNyL1Q4WTlVMjdmMEgrRnJEaUY4RlFy?=
 =?utf-8?B?NlZUT0FqV0hwWmJ5QjIrcERZTzE2ZUJqeE5Vam5ZMmlqdUZ2M3NTZUdQRWpM?=
 =?utf-8?B?S3BMM3RKM3VwUXUreS9URi8wbGpnTVVmaGhuNnFmK2xmdWk4Z3c4ZjJPc0xY?=
 =?utf-8?B?SjlNZk9jcWdvTjZIWFlZTkg5YlRUaWl5QjZxd0ExSnd0ZWJUbE53UGpkQ2NZ?=
 =?utf-8?B?OFFpWEx0L2xkeUxaOXJ1RTNtTjg5eW1LR01kWDZCS1M0V3RrODhoQnJveUpC?=
 =?utf-8?B?RmY0bmhXT1JZaW82SE5oeUF1VFE1L2c1ZWF2NWpVeHk1ejhOK0ZFTlNmRzgz?=
 =?utf-8?B?OFF2UVlHUzdSdW1sWDNFZXNyY00zTkZ6WWJqR1JHbnVraUtwK2UvYnljaDI5?=
 =?utf-8?B?R0RPS3g2Ry8vYlljWHBTT1BaanpURnFRTTN6REhSQU42bnZmSmdERHZpc0VR?=
 =?utf-8?B?c2d6YXd2T245WVdibGFKT1VOT2VBY3FDV0Y3WUtIRHk2RTk1a0d5SEtjNzJv?=
 =?utf-8?B?ZGNkdWJDdmQ5MVVKQkJvdTFWMk50bFFsa1NXL2dQckYxVEc4ZldWSC9mRmR1?=
 =?utf-8?B?YzdKaDUrMFRtWjEyTjd4UURXdDhtcGtna1Q4N0JyT1dOQjNteU94bnFuYWZX?=
 =?utf-8?B?YUdBdzR0b1RxUjdzOW5oL0s1R09WVDZTaEpmVysyRXdMMU9QcnNTM05aQmRD?=
 =?utf-8?B?MDVkeGsvcGhaVFJIeWxQOEI1UFFoRDYwZHlKcGhDVHZlR24vYktLZUJ2NDda?=
 =?utf-8?B?Y3JyYXBDSldZRXpRa0lBUWVqZnNlZWRxbEtjV3JTdzVFallXYVJZR0tKMDY1?=
 =?utf-8?B?VUsrQWVOYm43ZjNLZGxxam5qVG1PVWVaMmFUaHRtNzFQRnYzcG5kVHRjcFlV?=
 =?utf-8?B?TXREYXZuTkJNbXluNFJXdUJNdTZvbGJsVFVTUnVHOWp3b2NFY2Z5SXZkSUxL?=
 =?utf-8?B?dHN0R2txeXhOUkFkWWwrbUd5S1grQVRGRWtoRytQU1l3S3lPWjEyUmVBeXhP?=
 =?utf-8?B?Z3c3REJqZWRZclkwM3NMakFIVmgzczg4aUNmMnIzYjdZcVg4YWFlMGE0WVdV?=
 =?utf-8?B?b0tLcEZMTGtVcEJjRVc4T05iTkFXK0U5RkwrQ1AwUFcramxJT0EzaFJ0dGZZ?=
 =?utf-8?B?djRhQUZpK0s3NGZNaUc1RDdGT05TcHhtVVNzNUZCN0txRUpFOUE3aEVYdjNT?=
 =?utf-8?B?ODBya1JHREtkREUrVUtrQ0dUQ2NvTW9zKzFKZ0FkZWhETGxucjNoQ2ZzZDBw?=
 =?utf-8?B?SzBFeFlHWjdyT3lwMGVRQ3krZDdrT1Y1ZVJoSG5IbzRycWN4LytaZXdNWS9w?=
 =?utf-8?B?Zk1DMUZMd3VYVU14RURleDZJeXFoU2FDN2N2c0ZLekVsYjVOazNldVZnQWI5?=
 =?utf-8?B?L3YvV0FLdjhQY1BvcVU4YkpNSmRNTWRWeGZLT1lWbk9OTkd0YzRNZDFpQnV0?=
 =?utf-8?B?Y3BRSU9hejFEV0lPZ0lLRGRrRHVSWkNuNzJmNGhST1JLQUJFallkVk5hdGJZ?=
 =?utf-8?B?V0lMZlNYb0lORUtRODVQVjc2cHNlenU3NmtDdWtGcUpFUkhTSmRCcFFFTmVO?=
 =?utf-8?B?YUVxNVpVZWVmQXNwYjgyaGdKdlpRT2VvcTE4eDRNb3h6cUdqSTZSUm1mNEU2?=
 =?utf-8?B?S2VuRVlwWUF3VjdVWUxmdkFWTFZHRmZjRUNSUWI0T2FsbFh2K0sxQzc0OTVC?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98FC87A65CB1A245AF48178001B080D0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9816e5f7-4ddf-4d06-f8e9-08ddc0c0bc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 21:20:18.6514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDtz8nef75k0Vnp89dZaOxixPzkBFi/U0pZXUL7UzlG0UTRqySlNto6yer9naKwdQT4fWc2OFhfzKBm8AxEode8eXSakD0sm25jvYjlBjEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6687
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE2OjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFJhdGhlciB0aGFuIGluZmVycmluZyBpZiBhbiBleGVjIHF1ZXVlIGlzIGEgbWlncmF0aW9uIHF1
ZXVlIGZvciBhCj4gZmxhZywKPiBleHBsaWNpdGx5IG1hcmsgbWlncmF0aW9uIHF1ZXVlcyB3aXRo
IGEgZmxhZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNA
aW50ZWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5
cGVzLmggfCAyICsrCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jwqDCoMKgwqDC
oMKgwqDCoMKgIHwgNiArKysrLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlY19xdWV1ZV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90
eXBlcy5oCj4gaW5kZXggY2MxY2ZmYjVjODdmLi5hYmRmNGE1N2U2ZTIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaAo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgKPiBAQCAtODcsNiArODcsOCBAQCBzdHJ1
Y3QgeGVfZXhlY19xdWV1ZSB7Cj4gwqAjZGVmaW5lIEVYRUNfUVVFVUVfRkxBR19ISUdIX1BSSU9S
SVRZwqDCoMKgwqDCoMKgwqDCoMKgwqBCSVQoNCkKPiDCoC8qIGZsYWcgdG8gaW5kaWNhdGUgbG93
IGxhdGVuY3kgaGludCB0byBndWMgKi8KPiDCoCNkZWZpbmUgRVhFQ19RVUVVRV9GTEFHX0xPV19M
QVRFTkNZwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQklUKDUpCj4gKy8qIGZvciBtaWdyYXRpb24g
KGtlcm5lbCBjb3B5LCBjbGVhciwgYmluZCkgam9icyAqLwo+ICsjZGVmaW5lIEVYRUNfUVVFVUVf
RkxBR19NSUdSQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgQklUKDYpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyoqCj4gwqDCoMKgwqDCoMKgwqDCoCAq
IEBmbGFnczogZmxhZ3MgZm9yIHRoaXMgZXhlYyBxdWV1ZSwgc2hvdWxkIHN0YXRpY2FsbHkgc2V0
dXAKPiBhc2lkZSBmcm9tIGJhbgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
bWlncmF0ZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gaW5kZXggMDgz
ODU4MjUzN2U4Li5iNWY4NTE2MmI5ZWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBA
QCAtNDM3LDEyICs0MzcsMTQgQEAgc3RydWN0IHhlX21pZ3JhdGUgKnhlX21pZ3JhdGVfaW5pdChz
dHJ1Y3QKPiB4ZV90aWxlICp0aWxlKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bS0+cSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKHhlLCB2bSwgbG9naWNhbF9tYXNrLCAxLAo+IGh3
ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFWEVDX1FVRVVFX0ZMQUdfS0VSTkVM
IHwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFO
RU5UCj4gfAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBFWEVDX1FVRVVFX0ZMQUdf
SElHSF9QUklPUklUWSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IEVYRUNf
UVVFVUVfRkxBR19ISUdIX1BSSU9SSVRZIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEVYRUNfUVVFVUVfRkxBR19NSUdSQVRFLAo+IDApOwo+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ug
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbS0+cSA9IHhlX2V4ZWNfcXVldWVf
Y3JlYXRlX2NsYXNzKHhlLCBwcmltYXJ5X2d0LCB2bSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAo+IFhFX0VOR0lORV9DTEFTU19DT1BZLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gRVhFQ19RVUVVRV9GTEFHX0tFUk5FTCB8
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IEVYRUNfUVVFVUVf
RkxBR19QRVJNQU5FTlQsIDApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAKPiBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFORU5UIHwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gRVhFQ19RVUVVRV9GTEFHX01JR1JBVEUsIDApOwo+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIobS0+cSkpIHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3ZtX2Nsb3NlX2FuZF9wdXQodm0pOwoK
