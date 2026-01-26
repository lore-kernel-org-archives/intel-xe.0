Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2E0D19520
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 23:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA8510E03B;
	Mon, 26 Jan 2026 23:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="am9J+2/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F61F10E03B
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 23:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769471476; x=1801007476;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GI4UQX9hcUwg/QN6CBc8sENHaSZiXDS7SsKZOR0WonU=;
 b=am9J+2/25iLJhKj6Vn0z2n7J5EATsmIjo4H/V2OR1nHjvcKOpGvDChIs
 OKj+REdyrH+O5ODkg21wmby0H2k8ifMfCcrGPRi5wfCREnolEbc4jZfN/
 GiXk9zPpAJirOf5AOUkHf4APpuVnhwGeqtvd0Z7cMAKwe5b4B9QRUXgED
 X1vTUKUiDAO6XIxtXJtTxM0MaympAN92+WOapDNCFxTkxVKZS2ObUyciq
 +DJokXvYrlHsXs7pYFP9wfOw7HXLfFX1yGWf9Hp+tTYuB+hRF+G5dP2X0
 e9qjjpA4DJcQ8IQPogcR19zaBaEhstrxqeSnp+hNR70TP90eBMdeWdmAP Q==;
X-CSE-ConnectionGUID: CGEHSmAET8+JWu+Pcx3ypA==
X-CSE-MsgGUID: 40hjf6TYSQq4qYZXsAuCxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70814774"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70814774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:51:15 -0800
X-CSE-ConnectionGUID: 5Iy91eWxRCe26WoIPg7C+Q==
X-CSE-MsgGUID: vkD2XT2IRVmlB+CQUxBLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="238490743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 15:51:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:51:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 15:51:15 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 15:51:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrQIgh37xg+zYVw67CNJpuuFv0N1EfErfFWcg3cqam8TxHP04hli/IiSdj+ON3jiGW2GaXJU0EKNre0T6mlrvnNjno6tm1hQujJTelwZQLw8sy5CrlXJ/l+kZ0v+IvheF1uQq/xSZhF/JllskcOl8Wk6tVr1oVZoXeS/wNmk8fjR2DnqOJMdmaCykzQh7MzmeH4C4SvG2LORbBz+h/xFKHqq/gFYOKaHbJJbO+Eah7TsfhrRHSUF+q9v36BS6i2+K067wfq5Ow6qzNY5dQOmJhm/uso43uog7XbRooQXTHS+l+C8qdpb5cd/OHL+SKGgMINfhQFtv/uNiDHqVBacMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epu71o6zTFRLIbLJHDvcGsx6m++npNlluZmxGEL5gr8=;
 b=swMQYo5W7IqczJ7VNBaEV1bKo+anhu8yEeDzwqob4R9wQe8QomxOrdPJtfHBXzfnoG0pUHy7tZ0GIWQOLURf6VKojgZvVjqMnNw7Cko8yA698ETuGhjm0p86ucdc+FeTiuMa5IcM/9cFKffYAxCEh9I525PFWTOFaWywiPUnupAcuJF/dZjOzSZOF6Yiqsfhvo0gCh06ftEk06aLaG+/OiVglS4mIWTgw5rmIfXYxEJXKjXq/RTnaEywX2zifeLIHflNsNWRZknhedBw6ZiQn9Qgc5t7c059GGyxIoqmU2mUT8KcI0oxm+Za0119wxkrJyDWMLKCNwEtpRZ2w6hd4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 23:51:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 23:51:11 +0000
Message-ID: <e93d772d-2225-4448-a64f-4fe083e6d0f3@intel.com>
Date: Mon, 26 Jan 2026 15:51:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/gsc: Add devm cleanup action to
 xe_gsc_proxy_start
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260123175920.230494-1-zhanjun.dong@intel.com>
 <93e5739e-245c-42d0-ba30-c3eda5ca5510@intel.com>
 <a57f9620-7608-41cc-8177-59d39f107258@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a57f9620-7608-41cc-8177-59d39f107258@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c91ed1-e060-4a16-36a4-08de5d35c880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3pQbURmVERtK01nMlV6eDFtYTRXZHp5WTlLYW05M3JhM3lmWjhaeTFDTXlL?=
 =?utf-8?B?UUF2ZTFrSlhmcUlCVGFFd212V3BPdUpoZlJZYlk5UFRDdnNtYy9UVFRoQzdS?=
 =?utf-8?B?cWlZeXRoVmhJNjFaMWJKSGg1WFJ0b0xMemVrYkh3Q2g2NGZFSUZFRERiTE5C?=
 =?utf-8?B?aURWcVlHYzlUYXpVcjZSUDdQQWYwNEhGR0UybVI3cHIwNXEzRVJCREdtQWZx?=
 =?utf-8?B?alpxbjQ2bkQzSmJFbDJEVnUwbUE3eUFKcTE0d2tyZzVkMUhaS2NUYjBNZU5r?=
 =?utf-8?B?VGIxNVJRSVJadXpmbnltUVh3Q09XK1pPNDZaQnZtaFI1bktXZnBuVWlGbW5M?=
 =?utf-8?B?Vm1aWEhFN1JuS1puSzIzS045aXIvd2RraE8wY1ZUd3hnUHNjRXJDUWdwWE1p?=
 =?utf-8?B?d2pwQ0RhV3UraUk0Z2hIZ3FMOTQ5S0pZUWduZFVnbEZHdFROclJwdWVGdURQ?=
 =?utf-8?B?Z2ZNcHh0Qmdud3VNdU1SUzlOTlJqQm1oQlFiTFMyZ3dsQS9EcklibFRQSjhx?=
 =?utf-8?B?VzVoNUtQRTdNOHcrcFBEREt0a3BIUDZBQWd5eTJ4MHdMOHB4Zk9obHBoVEt4?=
 =?utf-8?B?dmlVSVJVU2p1aWRRK05GY3BWMCtkcVZxTkZOVC9nZ29TNWlyTFlBYlNyUXFl?=
 =?utf-8?B?UjEwUU5TSXF0b2ZLMFBCUjFnVGNTTGNrbG9tY1dCRVpYVlJmRER3SFVtN2Rl?=
 =?utf-8?B?a01pVzU5NERscW1hTDhPY3pxd25CSEppQ0FxZ1RPWm1EVEdTL1BFZDJNWERt?=
 =?utf-8?B?QlZJanloWkhSbWFOTkNEYzdyRTRHZWxoV2RaYTNWd1AxYm84OENMa2liaVY1?=
 =?utf-8?B?VERNVnZmWVY2NFpyUjNBbjYySWZaZi93b2h5cDlQNG9OY1U5MGhIcGE4KzNU?=
 =?utf-8?B?a0RCVnFPTmw0bFJPa0JaSWlTelY3TU9WRjhWbnc4RFBydlZObFJTV2ZnRlIy?=
 =?utf-8?B?VnBTQnVNaHIwcG1qOS94RkdZTU52Vm9vS3V4c2ZSazNUcjlvUWtSQnBIdDN1?=
 =?utf-8?B?cnJNZzhMVUU5YmxVS1Y2VmFOc2NOSmxoNm1PK3k4U1JkdEFyczhWMzg2dXYy?=
 =?utf-8?B?N3ZjMytLcklYQWRNQVYyWWdyNTZSQTFGUjNRMGJSOHViY1IvcTlYTkNVNmFG?=
 =?utf-8?B?bWc0ZENtM1IrcTFsM3llc1hHRjNtOUZiaUtKNjJhSGFXMWZhMlNNZm9ndWJT?=
 =?utf-8?B?RHBFaHdnZzN3MERweWs3SHBNeW9DazNERFBjMVVwR0s1TE9tdUpubHZvUWN6?=
 =?utf-8?B?ZHBDcDZ2YkYycmdpVUs1UWl0NGRyV2RJcE9XTkk3YUE5dVZEL0dJTjRaL2lM?=
 =?utf-8?B?RmJWWUV4enhzNGF4Nk1SWFJwSTdzVzY5QkZhUXE3ZGF0cWc0Ty9QM2tQaGFi?=
 =?utf-8?B?M3NWZmNNa2RjUkNQc1YraTFkQUc1ZS94ZHR4aDdFQlJMQkxPNFZTdk5jUFA5?=
 =?utf-8?B?YlFPS3diRmdnbWk4cmRHbTdhdmUvRmp3UG5nVTl6QSsxcUJEQWJFaHJqTXNl?=
 =?utf-8?B?OTlJelJ6MUlWQ1hJc3N4Z1p6cVQzTlNDV25TMzYxWWZJaDZvRlk3UWlWMHpX?=
 =?utf-8?B?K0ttdUtQTHprSkZYeDRwdHYxcXFnb1JwelVsRkxZbHdwVE90UEtoMktZd2Fp?=
 =?utf-8?B?b1pGWDFQQlNSZ1F1bGVxaStsQk9uUkpTdHR2eDAwbmRQZWpZVjZScW42L2Fy?=
 =?utf-8?B?UmVtKyt6a2ZRTHBxVkx5MkFQOFBuSnFURVQxQW5JdlhPaVNPZUdOOEZia09O?=
 =?utf-8?B?NElybTFWeVZ6WFc4eE1Ya3c0eFY2NzZxR3RKYmJiRm9IRy9vVVd6WGtMWDM2?=
 =?utf-8?B?SXZ3RXZza3Z2TGFKVXc0RzdHR2dCVEtjc2VDbitkbWw5NlNUSEFNYmlZUkhQ?=
 =?utf-8?B?Ti8vaGM5SUo3TkJZMDAwUEIxSDJpSGJIYkpERWhKTTRmRkRsUUY4MUp3VzBM?=
 =?utf-8?B?aTRTTGF6SHNOQ3dmN1k5aWxTNE8wZStSc2U4TUU2a1c4RnNIMXpzZjZYS0lU?=
 =?utf-8?B?VE1RZjRsMEtHQVNUTDQyQkJwTExwbElGRGJWdGJzbFhsK2xqVmNMR2JuRG95?=
 =?utf-8?B?NUJhN2d1ZlVPT3NuSktpWEorMTk5TnJ1UVdXbXVUQjJKdTlPMnp3TnJmY3M5?=
 =?utf-8?Q?FW4Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklNNjRsUmhnb1IwZCt2eFRmYXlOTlRQNkRGeUpkSWNENHdhbGF0Y0xHNzJl?=
 =?utf-8?B?RTRjdzVmWk85Z3pteTQxTHZuUjA0a1k4bjRKWENDbEV1c280aHoxS2JSYVFG?=
 =?utf-8?B?YklHUENJMDllSGNYZnFCY25JeFkyNXB5Q2w2NWdCZlp0dThFUWlrZFk5QTFK?=
 =?utf-8?B?ckRlNTN3RGtQWVFmWXdsOWxCajlFQW9mUXZiSFhTOHBnQXdqZnFXNTF3RHlE?=
 =?utf-8?B?Tk8xZHhFQzQ5d0FkWHFVV3B2ZWttSWxrWjliTFl5eFBxSGhBcWxneHhXV01R?=
 =?utf-8?B?dS9RVlF5TnNmNkFVQzF2U0tyWjhINkxaMERrN1JNeDBGTWVnU0dUSzRXQ1Z4?=
 =?utf-8?B?TElmNGNVWDZZaUtqR3ZxRHdHbVIxSUpmdUJ4Y2hDcEFVZHRjbVRUbUF5NHAv?=
 =?utf-8?B?ZVgvQ0JrRHNnbm02WmJQSXJGbHlVTDRJZHdMMElsOFp0TWMwQzg1K0ZPb25t?=
 =?utf-8?B?RW1UUmljd3RXTlpuK1hNZStBK0hqd1ZUUVZ6cHAxOTlnU1UxZGNSM1BzR3Bp?=
 =?utf-8?B?R2NOMDl6aTdnRXR3MkRQWCt3aVI4LzRIQlh0Yk52NUdTdGx0UnhrTUdkZWFk?=
 =?utf-8?B?eUZKVlhuZGZzWWhXZVM3ODZteUlrdDlRT051ZUs1WXlLREZPTGdHMVZyK1Ju?=
 =?utf-8?B?R05kaHJQcEptYXYrS29Tc09aUjA5TG12SFlCblpWaHBKb2NaeEZmMmJkZ0Y4?=
 =?utf-8?B?cGY3QVd6Q0VyZkNQczRPY1Y5cHRNQVZqWSt6R2EwU01aTGh5aG1SenhrYzU3?=
 =?utf-8?B?ZWtBZnErTXk3MyszbGNEdmxORHAyQkFCN2RLelBPdGsyTGJrTm82TEErbGlM?=
 =?utf-8?B?aThaL1hwekUrNklkbGhjR1ZtUys3YndaQm9GVUdZbkFONkE5K2hWQWN3aXht?=
 =?utf-8?B?ckNFL2MrMFRMbEdxdkRvZWtYQWtwRjZLTVpVSWVDOE5JNTA5eERPMEd1dHN0?=
 =?utf-8?B?THJWMGdHVXF3NStnT0c0VitKKzFDV21xNTY2YTZPdmFueGJ0ZW13K1l3Unk4?=
 =?utf-8?B?TE9xdTE1N3UzbitmVkVBaG9BaWt6NGdYajhsQ3oreVVYZFQwQUdRNDF4cFRV?=
 =?utf-8?B?ZDk2c3JUWndRQjNzTlpFaGFpMjFYUnZsNTJyeC85czgzNk04RlRXdGlTR295?=
 =?utf-8?B?V2FGWEhmazl5Vm1udUFYa3p5Zjk5Q0liK2JlQkI4d2lmdjZYZDFveGFPeURj?=
 =?utf-8?B?czMrSHBFMDVWWWNXMUIwL2FFcmpjMUlnMnpvMk9ZMG5qcVFKblpVc1N0dFFw?=
 =?utf-8?B?ZDFxeG1UR2kyVXpqQlFlL2VHa3M4YUZMQmR3RnNxYTBpbmdscTFYMCtxcldV?=
 =?utf-8?B?MHhZMTB6MFpQMGFpRU5FdzNPY2hmdmhsVGpTb3JlL0VoQVBEVDhpZ3EzT1Jz?=
 =?utf-8?B?UTFTRFBsQytBQTJlaXhrTy9aWW5McVA4MVA0WW5RZmd4ZU1XYi9PS1dGVnJa?=
 =?utf-8?B?RXdJbi9aODk4TVhtaGxEc2ZxZjhUSFhvWkxJNzNCRWFYSlQwVWprV2ExV3Vk?=
 =?utf-8?B?a0Vwb0JzVy9aUmYwV1hucktmL2JDbGc0SVlnRDJuTWVlbjM1cDlqS2Zvbmxr?=
 =?utf-8?B?OVY5bkJjcW5oMmVJaElYTEYwMmFnZklmUnB1aTVBaVU5M2FOU2JQRHJHdjBJ?=
 =?utf-8?B?YkdRNUl4akRTTkJWT0JWZCtrZkt0K1ArOURoZjB0Zzg1blFqbnR3aXNOZzdv?=
 =?utf-8?B?M0dYQ1Nwd2lSQjZaaElKaDdiZlFMd1dLMC9FTVZ4RE83RXljZzZ0c2RSenBx?=
 =?utf-8?B?cDIwVzlBSk1CRDR6MFBhWTZMNGYwZkFpMGFIa0UvbFF0QjZ6ekNHRTFybzk0?=
 =?utf-8?B?TXg0czFBd1N5aHRHZVRZMmh4b0hMT216MjhLaEFDTStTUThoRnI4ZGpxZUUr?=
 =?utf-8?B?V2t1NXN5OWRhL0FrT3I1Wnd0eUxJZUl5UW13Q0ZKNDdaMGMwMjMyZ3RaVXZ2?=
 =?utf-8?B?U2VOZDRhNHdtZ3RzVFk0bjVFN1A4VDI2c0Vwbzk0ckY5MWJNNkk3KzhGU2xM?=
 =?utf-8?B?Nm9tY1ZyelQvMjJOYUtzYWJaNE5RUFNSWSszVWZsbzJVNnF3WUJLUWtndlBJ?=
 =?utf-8?B?QXhmS2JvUkdBYjFadytRMFNTemxPR1RTUU9HU2xaL3Z3YnpYNm83WEdWdUdX?=
 =?utf-8?B?L1dPdmdNTzFPdlY4Z242SlRoWE5OT2trSS9iLzlkRzYrMXJpV3MwQ3pWZlBF?=
 =?utf-8?B?RDZVOVBvcTJuSVNrSnk5Uk8zVnh0bytzM2VtZU5ta2c2WmNMSHQwNDRSYk1x?=
 =?utf-8?B?ajdGU1VHMlZRY04wZlp6ZDNyRFBGekRLU0dKZU1ia25RWW0wM0w2T2Q3WE9X?=
 =?utf-8?B?TUp1emZGVG5vSXZGSENLUzdSOHpra0Zoc1EyS3Z4d2FsNEJXWmZNcVo3Y0kw?=
 =?utf-8?Q?v3S8GeUWWzPf9B60=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c91ed1-e060-4a16-36a4-08de5d35c880
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:51:11.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGYavzaQqBW6YKjCMjNQiIB5BjbKDv/NXZJ2toBHPl7xr5Id0bSG2Z37i5LnZIUY7FNu/r3dQUwNksVGBAi40bxA2XrBCg907FF8tJeggVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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



On 1/26/2026 2:47 PM, Dong, Zhanjun wrote:
>
>
> On 2026-01-23 4:05 p.m., Daniele Ceraolo Spurio wrote:
>>
>>
>> On 1/23/2026 9:59 AM, Zhanjun Dong wrote:
>>> Split xe_gsc_proxy_remove into two parts: xe_gsc_proxy_stop for cleanup
>>> operations and xe_gsc_proxy_remove for component removal only.
>>> Add devm managed cleanup action at the end of xe_gsc_proxy_start to
>>> ensure proper cleanup when the device is removed.
>>
>> This is a bugfix, so it needs a better explanation of the bug it is 
>> fixing. Something like:
>> "xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init 
>> and xe_gsc_proxy_start; however, if we fail between those 2 calls, it 
>> is possible that the HW forcewake access hasn't been initialized yet 
>> and so we hit errors when the cleanup code tries to write GSC 
>> register. To avoid that, split the cleanup in 2 functions so that the 
>> HW cleanup is only called if the HW setup was completed successfully."
>>
>> Also needs a fixes tag.
>>
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/ 
>>> xe_gsc_proxy.c
>>> index 42438b21f235..0b76b29bf2d5 100644
>>> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>> @@ -435,15 +435,12 @@ static int proxy_channel_alloc(struct xe_gsc 
>>> *gsc)
>>>       return 0;
>>>   }
>>> -static void xe_gsc_proxy_remove(void *arg)
>>> +static void xe_gsc_proxy_stop(void *arg)
>>
>> I think it might be worth moving xe_gsc_proxy_stop to be right above 
>> xe_gsc_proxy_start, to keep the opposite functions close.
>>
>>>   {
>>>       struct xe_gsc *gsc = arg;
>>>       struct xe_gt *gt = gsc_to_gt(gsc);
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    if (!gsc->proxy.component_added)
>>> -        return;
>>> -
>>>       /* disable HECI2 IRQs */
>>>       scoped_guard(xe_pm_runtime, xe) {
>>>           CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>>> @@ -455,6 +452,16 @@ static void xe_gsc_proxy_remove(void *arg)
>>>       }
>>>       xe_gsc_wait_for_worker_completion(gsc);
>>> +}
>>> +
>>> +static void xe_gsc_proxy_remove(void *arg)
>>
>> xe_gsc_proxy_remove is now purely SW management, so we can use drmm 
>> instead of devm when we register the cleanup.
> Try switched to drmm, but got this:
> [ 3869.024154] BUG: unable to handle page fault for address: 
> 0000000000002780
> [ 3869.031132] #PF: supervisor read access in kernel mode
> [ 3869.036329] #PF: error_code(0x0000) - not-present page
> [ 3869.041523] PGD 0 P4D 0
> [ 3869.044097] Oops: Oops: 0000 [#1] SMP NOPTI
> [ 3869.048340] CPU: 4 UID: 0 PID: 15240 Comm: xe_fault_inject Tainted: 
> G     U              6.19.0-rc6+xu4438+ #5 PREEMPT(voluntary)
> [ 3869.060184] Tainted: [U]=USER
> [ 3869.063204] Hardware name: Intel Corporation Lunar Lake Client 
> Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3223.D96.2504232223 04/23/2025
> [ 3869.075573] RIP: 0010:xe_gsc_proxy_component_unbind+0x10/0x60 [xe]
> [ 3869.082024] Code: cc cc cc 0f 1f 80 00 00 00 00 90 90 90 90 90 90 
> 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 54 53 48 
> 8b 47 78 <48> 8b 98 80 27 00 00 4c 8d a3 f8 1a 00 00 48 8d bb d8 19 00 
> 00 e8
> [ 3869.100945] RSP: 0018:ffffc9000a2af9f0 EFLAGS: 00010286
> [ 3869.106233] RAX: 0000000000000000 RBX: ffff888173d9b940 RCX: 
> 0000000000000000
> [ 3869.113446] RDX: ffff8881171e5390 RSI: ffff8881241cb818 RDI: 
> ffff8881070ec0c8
> [ 3869.120647] RBP: ffffc9000a2afa00 R08: 0000000000000000 R09: 
> 0000000000000000
> [ 3869.127853] R10: 0000000000000000 R11: 0000000000000000 R12: 
> 0000000000000001
> [ 3869.135064] R13: ffff8881171e5390 R14: ffff888109b1dc40 R15: 
> 0000000000000000
> [ 3869.142283] FS:  000075ff95df2940(0000) GS:ffff8884eb8e0000(0000) 
> knlGS:0000000000000000
> [ 3869.150463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3869.156278] CR2: 0000000000002780 CR3: 000000017b3c4003 CR4: 
> 0000000000f72ef0
> [ 3869.163489] PKRU: 55555554
> [ 3869.166243] Call Trace:
> [ 3869.168735]  <TASK>
> [ 3869.170870]  component_unbind+0x56/0xf0
> [ 3869.174764]  component_unbind_all+0xc2/0xd0
> [ 3869.179007]  mei_component_master_unbind+0x21/0x40 [mei_gsc_proxy]
> [ 3869.185256]  take_down_aggregate_device+0x35/0x60
> [ 3869.190008]  component_del+0x99/0x140
> [ 3869.193730]  xe_gsc_proxy_remove+0x45/0x60 [xe]
> [ 3869.198416]  drm_managed_release+0x8b/0x160
> [ 3869.202657]  drm_minor_release+0x5f/0x90
> [ 3869.206631]  drm_release_noglobal+0x7c/0xa0
> [ 3869.210865]  __fput+0x10a/0x2f0
>
> I guess here:
> struct xe_device *xe = kdev_to_xe_device(xe_kdev);
> devm action first, then drmm, when reacted here, dev no longer valid.
> If no other concern may be keep current way and let it managed by devm?

Yes, it's ok to keep it as devm.

Daniele

>
> Regards,
>
> Zhanjun Dong
>
>>
>>> +{
>>> +    struct xe_gsc *gsc = arg;
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +    if (!gsc->proxy.component_added)
>>> +        return;
>>>       component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>>>       gsc->proxy.component_added = false;
>>> @@ -510,6 +517,8 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>>>    */
>>>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>>   {
>>> +    struct xe_gt *gt = gsc_to_gt(gsc);
>>> +    struct xe_device *xe = gt_to_xe(gt);
>>>       int err;
>>>       /* enable the proxy interrupt in the GSC shim layer */
>>> @@ -528,5 +537,5 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>>>           return -EIO;
>>>       }
>>> -    return 0;
>>> +    return devm_add_action_or_reset(xe->drm.dev, xe_gsc_proxy_stop, 
>>> gsc);
>>
>> You're not doing any cleanup if xe_gsc_proxy_request_handler() or 
>> xe_gsc_proxy_init_done() fails and you bail early from this function. 
>> Need to change that so that interrupts are disabled in case of error 
>> exit.
>>
>> Daniele
>>
>>>   }
>>
>

