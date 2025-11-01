Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4614ECCF9FE
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAB610E10D;
	Sat,  1 Nov 2025 01:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXlE8TGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B868E10E10D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761960803; x=1793496803;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=pzDGkQj0DJ9/dD+dvx8EPr9VkZUJfMkN8nxG+wHVOUc=;
 b=lXlE8TGxTp8PVZL29+AyI2ZVCmFOny/ovgmS62ewHx0/mHmn04Bzsh5e
 VQfVxxBd2BLxgCYteIajtcAWW211T9FT2H+3D0wVfWl65wIE2eP9UZ8GZ
 9jk53BaMs+SLeQofCiFxQ6AQym5uMYDcDd3A/AN9ZqHY1bhud4iQa6tFi
 lQ5HU3Q212KBlmf2YVUVyQg3Xb2cOK7fsvXHUhVqSBtFhbO6A3cFaS5qe
 3IxYKA/HQPG96Qju7nFECblWJHQVzGt92DiLwGEQy1WYn3fBoJrOgETQ6
 OfE7l/LXzA3HjkvNPw7QvExYLpq+9BDrGNll5Sq5tBiwodKdokNsh0nXR A==;
X-CSE-ConnectionGUID: bBxgBT3RQmuV71pJHzuBAQ==
X-CSE-MsgGUID: p//THt9DSEySkITzgfVgbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64033109"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="64033109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:33:22 -0700
X-CSE-ConnectionGUID: nI98bxebQjWhe1O+IHWoGw==
X-CSE-MsgGUID: bwEdNd1MSXCnLEbHSnlODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
 d="scan'208,217";a="190455183"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:33:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 18:33:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 18:33:21 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 18:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivHth0zDNDTzQF1Llstf36xQlbso086CFKuYJ72IDEIb4qcZpKjagXjOj6wFotWg7W2btZxbMUN9ShfB2hL8EaRjIHwKaTQJkR5E/18OCq01jlb5nSruqjm6B5UE+typkqTy7y6eTd1J/GD9V6zk9p1tWSijS6u1qHRjlpjYVgIcUEDGW0QNlREyZmzrl+19J0qnce23vpKItmfH/tq198ogZ8DHhmbQTFThg5yv3YeLpJbCoRSyLBXcT92cCpEPrx/znCF0dwpakZwULnfdNxI4goyS5kB+GvD4Br1KAtnf0B9kCl7w9tUWQjMXNjuQxY4BxLl6bbkCOk/U5QcNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1E3BmjWKO6t8upWzLQAfBnN9uNRoBmak2PH2GVSkwk=;
 b=M0VqwLoBUZCcVt/TvrsNnvOWwPbT2OKNwFa6v3z2VNGIi2ZGGWL5tG3j79TS1QR3kRRaYyK9m6yvRviAVxgzOnHK4OL53t1RYqWy5wCjjp8j074l3hFK3zPp6aZamKyucZTidccBT4gBRvqWwPKYW1ToGo2t5X+fhFCoPXZQvidQqLbCVd7OGDBU/tvzjyVVBQqa/OqXNo+i+eIuDwWIu191W3afmS8mLkVfF22bdHNzfKAe7siQzyDz3qQk7JF+eARaM5uREB5M6erl7PtxOSlsr6LCp1cejHKyUo64ajUQFwaF5xXZoTzZyrr8TBksIJrt0NmIGtX7ObGQzA8Yug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA1PR11MB7111.namprd11.prod.outlook.com (2603:10b6:806:2b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Sat, 1 Nov
 2025 01:33:11 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 01:33:11 +0000
Content-Type: multipart/alternative;
 boundary="------------dBpWF9Bxkmxpnp0FvgSXBG9f"
Message-ID: <9c179328-bc36-49c6-9147-869b9ce2f77b@intel.com>
Date: Sat, 1 Nov 2025 02:33:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vf: Start re-emission from first unsignaled job
 during VF migration
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20251031201345.3015516-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251031201345.3015516-1-matthew.brost@intel.com>
X-ClientProxiedBy: BE0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA1PR11MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d13552-afda-4fb2-daaa-08de18e69e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2phMENwSllJd0R1UkExTHlzb2k5M2E1RElKVnhSek5TTUNrdmRnSzVGZXor?=
 =?utf-8?B?aENLTzlWMjdnc1AxRWh3cGhIOEhlWjRxQ0ttdElJVm5jNmVVVGxMd0xXdFpQ?=
 =?utf-8?B?SWVxVE4rNkxpUXlLYXpueVRFUDZCSkdscW5jVXZKZjY0bW9BWTdDWXFjRG83?=
 =?utf-8?B?TkdvdDNGNmRrM2U0S2pBcmNKZFdKbDExeUs3QkR4TlUwU05Ldy9vekl5d2tG?=
 =?utf-8?B?TTFLeWZvcGdPeVlHaGhmdG5GVVJRaUkwdjZmbW54ejV0UW9ZTWQ3aXlVTWM5?=
 =?utf-8?B?S1dpZFB3YUtOUWhmM2hZZVZLZkVJOXNaWnliUk5Ed1poWWlUUGVxcW55QVRH?=
 =?utf-8?B?THhqWVlENGk5eUxwN3VSVlF0RnVsdGlxNVduYmNCZjNsWHE4TXM1SmIxQnQv?=
 =?utf-8?B?NmhsL0lDNFkxTVlneGx5aTN3cVhrc0hPSjV4bmREMktPZ3o4NVkzRjN4WjZ5?=
 =?utf-8?B?bFJUSjE4UHQwem04ZkF6aHRLQkVmd1VTR3lVTU43dkYvclloOHRIeXdNUzlv?=
 =?utf-8?B?ODFPeFN1SHZKbFludHE1M2xhNy96VnJ0Nm9zQmpIRE1xK2YrbUtkUTNtQ0lu?=
 =?utf-8?B?UmtySkRESzdJQ2ZLKzJZL3ZqL05sYmoxbm4zMjBPdWljaWhWd1JQMkpET1ow?=
 =?utf-8?B?c3lPM3VYRXFKZmFGaGJiNTJyNVRwdFdHUklnenVLU0VzODBQVWQxMFBvaGln?=
 =?utf-8?B?aUdyR0JuY0lOc2J4SThHaTJ5UjdaRlcvY2ZLM0VKMjgyMmIxM293K1NOY05n?=
 =?utf-8?B?aUphQWUrUWFUS01BeS8wVVNpZzhxcmdneG1hU1FWaDkwSWFwTVBHdFlHbTRB?=
 =?utf-8?B?ck93NUFCVmJCMGRrUWpVZzRnemN3WUJ6NFZmb2dyRkJyTUJrV0ZxQ3BBeEo2?=
 =?utf-8?B?RVJOYjdrSFlOUDlvVVd3OUR5SXNvcWtZWFM1Si90a042NnkxRnhId3lsdFZr?=
 =?utf-8?B?MHRhZ0Rhb1FUeUxHdEVoNHZpeWVNYW5TMmZHV2NXLzlYRWhYVkNocXVhS3M2?=
 =?utf-8?B?ZzhyVDVtZm5hU2NFZDhaTHEvaFBPNWpGSUZLV09HTURnSGxFOHVGMlo4K3pi?=
 =?utf-8?B?VzFMUCttZDRPRE9CZnF3NTNlR1RuMUdKVmFOKy9hSGJRYVA4ZnR1dkRqbGQy?=
 =?utf-8?B?YzM5anNHdkV1eUcvT1FkTGREa2ZVSFZTVUNDc0VrN0pScTJlekN0bURyMXlM?=
 =?utf-8?B?d1N6bmR5SEtLdzIzZFlPUkNHSWx5SVRLV3pMckFRMUpJc24xdzdpd1VZY2tq?=
 =?utf-8?B?aUI1QnE0KzVXZUQybmRpc0o4MUJzaXhsRmxJeUd2L0NwaXlMNURXYTNFR3JK?=
 =?utf-8?B?dVVnM21OYXFWOGFJTVBNQ3BSOTFyUVdHOUswSG5CN2U1a0VDWm4vLzlzckdZ?=
 =?utf-8?B?azJ1RVo5WUlZMnFRcU1mbHk3c1E3L2FaVENQcFk4cTRzejdEbFlRZU5BeS9M?=
 =?utf-8?B?WGFQSi9CcU45ZFZCdHE2b0hlVHg0RnphM3RkWHVkS3RMTjNSdy9WQjVyQkFh?=
 =?utf-8?B?a1NJenFFZ2dxSTJxL281RSs2aWZjYk1tR0xEUmZHSDhPOGpjcnVsVzlwb3lR?=
 =?utf-8?B?aGw0VWNUOTNyWUhnOG9YWDgwdXQxTXNEbG1oODBWNmZ0MXd3SGVHcTFkb2xv?=
 =?utf-8?B?dDBIYURsTkM4YTUwWFlFQ2V5QUhMdnB5UkdpS2lSNU1nRlNqVGYrbTRITHNX?=
 =?utf-8?B?aFdlUnVjc2d4cE4vdHpBdU5saVNRS2FWWk5QQUV5dCtaYmZCWHBueTJ4eUFC?=
 =?utf-8?B?Nktna1lrcUVOOHUzZUdjMWVJdzJRVTY1alhZK0tockdrcmtHSWZ6Y2IwcnpK?=
 =?utf-8?B?VWlzL1lmZ3ZLZXkzbElnQzBpbVI4UFYvSDlMM1FDUFlXbzMzeDNmRUhxRnNw?=
 =?utf-8?B?NXMwaDdTMDBrZVQxVUorWWpabElFV28xM1M4MVRSQnRqcE0yZFMzN3VuVjBi?=
 =?utf-8?Q?d/WjuLcShzlSOgRjVr/zUFYhUDjEOFHz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzNUYWpFM2puNm5TcjE5WkFWRnp1REpIa1dSM0tteVRZamdoKzMvaENQVGFO?=
 =?utf-8?B?djNPYmc5alY1ZXJ4T1lZWmxGVEF4NHdjNE00Z0NnS085b0dXd1l5d0lNc0Qx?=
 =?utf-8?B?Qmlhd01ya0VyWUZhOVVKWDdEeU96WDBHV01SbWYzU0Y0N2xoOVl1bS9hUCtE?=
 =?utf-8?B?dmhUWlU1WHRmNWZZeUI5dWtOUUZFZ01DazRJbUMxWFE2THZ6M3VmU3BiRkND?=
 =?utf-8?B?OGVzNm9VWU1MdHA4MkRhS1I5L1AzVGp2akhSRUtidG1XbE4ycnllLy8ya0ZF?=
 =?utf-8?B?UzFIYnk3b293TFJoUUpVZ1BnYlVVZk8vbUtOY0ZVTW9ST3laT1RpQ3JwUHJZ?=
 =?utf-8?B?RUQzN3RmRzZkNEh0S1pSYTRlNGJnKzMzaDNQdTc5ejErYmpyRDRVd0JmRDNm?=
 =?utf-8?B?MFBqZ29UOGV6Y1I2NjIrWWdkdjN2VG02czEwVzh2d3pmTHFPczFhbHJ3YTNr?=
 =?utf-8?B?Ym9PVEJPanNaWmJra1A4SkkrM2hKZkVoVFVhZTZodS9BWXdCYlE0bHdVUk9z?=
 =?utf-8?B?VjM4d0V1NjBRSUZ5TWsyNzMwSERyM2ZWTCs4b29zNGpEODdKemwza01hQW1S?=
 =?utf-8?B?YXlCekxpSGN3clgvcjJtSnA4YXpwcE1Zanl6WVlaM0luVWlzT2oyUEkzUXFN?=
 =?utf-8?B?R2d1MFdoS0hxZW1RMjF1eTVEeWJxMGVUV1NJUkI2NW5VY2NwQkt5VUJIWHNx?=
 =?utf-8?B?U0V1OFdjOHVVVG1WTXpzQlNvUUJLYTlFSXVDMkZjTmlyUFZUZWRxbk84eTJ6?=
 =?utf-8?B?NXoyK2xRdmpMWDMrWmJDMDZnMU5xU1B2MHlYU21JMDJpaFk4Y0FmbUo1RjNa?=
 =?utf-8?B?eGlRbEtMRWFlNWR5TFhDemNjRTZ0VVhYdm1zS3JFZzJRMWRwU2ZwTFJuZHgr?=
 =?utf-8?B?MWczcUZCK1ZVTGtjZkxlZ2xGZ1RVNU9sYzU5WUZ5aTdleE41anRUZFdtWmpC?=
 =?utf-8?B?c2NKN3ZVTklvaFRuVHJPVUpnSXJvb1UxSlBGUWVRS0lxc0xycVVkYWlBa3Ur?=
 =?utf-8?B?eXlnZjBmdkdsd2h5M2FSZ3NiNmd1VGFjNmd1U1N5RSsxdE4yL3Z1RVoza1VP?=
 =?utf-8?B?RWhQZDBEcWN5T3N1cndJOXJkelVMaTFSdDliekRNamZyTmVIWjg3V3R2UWZU?=
 =?utf-8?B?NUFNcFBOQWxVV3F0NmlnZVVacHg3NndtZkxIVnprM3ZxTElWemhTNk52NEVG?=
 =?utf-8?B?TDRKWkJLTE94N1dlSWdnOGtxWnExbnRuYlJpMmJMaE1zZEdlMUw0djU1d2sw?=
 =?utf-8?B?YnZFbVduKzFzOXhxSE5uZU05Q0dNSjZ2NDNtc3BHaHZ1WjNkcW9BVDlsWkxj?=
 =?utf-8?B?NGlDSWlqdWppcGYxbWQyMXQ3aXhpNmJvMS9tcHJYRUdvQ3djbVZLWnpwTzlL?=
 =?utf-8?B?NXZhS1FQZWtsSEVWZWV4SFBFdXczTkdtZTNTSFdwNDBwTVlBc0VCYnU4MjNh?=
 =?utf-8?B?alpCbkpVRWJVbVdpcE1sUVZJRnJEeTZCRFZJM2Y4d1A1MnBWRlNvbXd5dStu?=
 =?utf-8?B?WUE4QVRsMVJHUEkvbWl3ek9YR2M1V2ZDSGlBTjB6R3JlR0NPN1hwZTN6MXBn?=
 =?utf-8?B?MjVLcjhPY0dvbE1WcjgrUnVRL0hnR1B2Z3NYVmdaK0lsWjA2d3pjcWFzR251?=
 =?utf-8?B?Y1ZpZExpWnE1bXhJZUJ1TnR3ckc1VjljM3pMVWprM2xORDRjQ1ZMSFdTaVNh?=
 =?utf-8?B?U1ZhV0xESlVFUTU0bDVRN2FUQ1RmdTA3RHZTdklTT2swZmpYdENmTnR4QXBQ?=
 =?utf-8?B?bGx1K3hIcjd1eCsrUkFMSDlkZ0NQZjBxRkFKSEVHSkdFZmI0dVgxV093bms1?=
 =?utf-8?B?RGFRd0loNmUraGNYRGtGRDZDQmx5cG52bjNsWG1zUEIraHJVTUN1MVlMZEtJ?=
 =?utf-8?B?dHpMMEhTRTdqRHVLYjQxR3hESDNHU3NIazlOL2VvSnF6N0NZMHFReEFWdjdW?=
 =?utf-8?B?MXNQS1I3eEtyT2tVYzJSYmxqaHNSZmVEL1Q1Qk5qOG5TMFdGWENIeWs5NlBL?=
 =?utf-8?B?ZFFuckNyZ2tyL2cxRGtjQzVxVHY3NVFDNzdTWmpWb2Z1Zml3V2ZYRWQwYnQ5?=
 =?utf-8?B?T1dmYzF6YlNiMlhsQ0FXWkZJMHY3bEJPV3RRSVRMSUFBa2hheGUrejNwbWRR?=
 =?utf-8?Q?Wn0KvdhjqfIc0ZR+CyreV9idx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d13552-afda-4fb2-daaa-08de18e69e19
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 01:33:10.8857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7h+rkANP2SQKuW5Jxcq3z1raA0n/lTOCJP5wIbB5TomgYFurl4yZ05CjIlA/bCembE94Vh2PTJEy2UkAINjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7111
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

--------------dBpWF9Bxkmxpnp0FvgSXBG9f
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 10/31/2025 9:13 PM, Matthew Brost wrote:
> The LRC software ring tail is reset to the first unsignaled pending
> job's head.
>
> Fix the re-emission logic to begin submitting from the first unsignaled
> job detected, rather than scanning all pending jobs, which can cause
> imbalance.
>
> v2:
>   - Include missing local changes
>
> Fixes: c25c1010df88 ("drm/xe/vf: Replay GuC submission state on pause / unpause")
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
>   drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
>   2 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 9955397aaaa9..357afaec68d7 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>   static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *s_job;
> +	bool skip_emit = false;
>   
>   	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>   		struct drm_sched_fence *s_fence = s_job->s_fence;
>   		struct dma_fence *hw_fence = s_fence->parent;
>   
> -		if (to_xe_sched_job(s_job)->skip_emit ||
> -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
> +		skip_emit |= to_xe_sched_job(s_job)->skip_emit;
> +		if (skip_emit || (hw_fence && !dma_fence_is_signaled(hw_fence)))

This looks ok, but what is the mechanism which could lead to a job after 
the first  `skip_emit=1` job to have the `skip_emit` flag lifted?

Wouldn't the only possibility be that jobs were executed out of order?

>   			sched->base.ops->run_job(s_job);
>   	}
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d4ffdb71ef3d..f25b71aca498 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	job = xe_sched_first_pending_job(sched);
>   	if (job) {
> +		job->skip_emit = true;
> +
>   		/*
>   		 * Adjust software tail so jobs submitted overwrite previous
>   		 * position in ring buffer with new GGTT addresses.
> @@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>   					   struct xe_exec_queue *q)
>   {
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct drm_sched_job *s_job;
>   	struct xe_sched_job *job = NULL;
> +	bool skip_emit = false;
>   
> -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> -		job = to_xe_sched_job(s_job);
> -
> -		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> -			  q->guc->id, xe_sched_job_seqno(job));
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		skip_emit |= job->skip_emit;

All emitted jobs have the skip_emit set, unless their EQ got submitted 
to GuC which clears it, but if it got unsubmitted without finishing then 
the flag is raised again.

So this does seem to select unfinished jobs.

Though this introduces an assertion that within Command Streamer ring 
area of a job, there are no GGTT references between seqno increment and 
end of the job commands. Maybe worth commenting in code that we're 
working on that assumption? Example issue would be if someone introduces 
saving some kind of metrics there.

(this assumption was in power before this patch too, but now as we're 
skipping fixups for finished jobs still in pending list, it becomes more 
important)

Also we're emitting jobs which have a flag names "skip_emit" set. This 
disconnect needs a comment too.

-Tomasz

> +		if (skip_emit) {
> +			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> +				  q->guc->id, xe_sched_job_seqno(job));
>   
> -		q->ring_ops->emit_job(job);
> -		job->skip_emit = true;
> +			q->ring_ops->emit_job(job);
> +			job->skip_emit = true;
> +		}
>   	}
>   
>   	if (job)
--------------dBpWF9Bxkmxpnp0FvgSXBG9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/31/2025 9:13 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251031201345.3015516-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">The LRC software ring tail is reset to the first unsignaled pending
job's head.

Fix the re-emission logic to begin submitting from the first unsignaled
job detected, rather than scanning all pending jobs, which can cause
imbalance.

v2:
 - Include missing local changes

Fixes: c25c1010df88 (&quot;drm/xe/vf: Replay GuC submission state on pause / unpause&quot;)
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 +++--
 drivers/gpu/drm/xe/xe_guc_submit.c    | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 9955397aaaa9..357afaec68d7 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -54,13 +54,14 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
+	bool skip_emit = false;
 
 	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
 		struct drm_sched_fence *s_fence = s_job-&gt;s_fence;
 		struct dma_fence *hw_fence = s_fence-&gt;parent;
 
-		if (to_xe_sched_job(s_job)-&gt;skip_emit ||
-		    (hw_fence &amp;&amp; !dma_fence_is_signaled(hw_fence)))
+		skip_emit |= to_xe_sched_job(s_job)-&gt;skip_emit;
+		if (skip_emit || (hw_fence &amp;&amp; !dma_fence_is_signaled(hw_fence)))</pre>
    </blockquote>
    <p>This looks ok, but what is the mechanism which could lead to a
      job after the first&nbsp; `<span style="white-space: pre-wrap">skip_emit</span>=1`
      job to have the `<span style="white-space: pre-wrap">skip_emit</span>`
      flag lifted?</p>
    <p>Wouldn't the only possibility be that jobs were executed out of
      order?</p>
    <blockquote type="cite" cite="mid:20251031201345.3015516-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre"> 			sched-&gt;base.ops-&gt;run_job(s_job);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d4ffdb71ef3d..f25b71aca498 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2152,6 +2152,8 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	job = xe_sched_first_pending_job(sched);
 	if (job) {
+		job-&gt;skip_emit = true;
+
 		/*
 		 * Adjust software tail so jobs submitted overwrite previous
 		 * position in ring buffer with new GGTT addresses.
@@ -2241,17 +2243,18 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &amp;q-&gt;guc-&gt;sched;
-	struct drm_sched_job *s_job;
 	struct xe_sched_job *job = NULL;
+	bool skip_emit = false;
 
-	list_for_each_entry(s_job, &amp;sched-&gt;base.pending_list, list) {
-		job = to_xe_sched_job(s_job);
-
-		xe_gt_dbg(guc_to_gt(guc), &quot;Replay JOB - guc_id=%d, seqno=%d&quot;,
-			  q-&gt;guc-&gt;id, xe_sched_job_seqno(job));
+	list_for_each_entry(job, &amp;sched-&gt;base.pending_list, drm.list) {
+		skip_emit |= job-&gt;skip_emit;</pre>
    </blockquote>
    <p>All emitted jobs have the&nbsp;<span style="white-space: pre-wrap">skip_emit<span style="white-space: normal">&nbsp;set, unless their EQ got submitted to GuC which clears it, but if it got unsubmitted without finishing then the flag is raised again.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">So this does seem to select unfinished jobs.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">Though this introduces an assertion that within Command Streamer ring area of a job, there are no GGTT references between seqno increment and end of the job commands. Maybe worth commenting in code that we're working on that assumption? Example issue would be if someone introduces saving some kind of metrics there.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">(this assumption was in power before this patch too, but now as we're skipping fixups for finished jobs still in pending list, it becomes more important)</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">Also we're emitting jobs which have a flag names &quot;skip_emit&quot; set. This disconnect needs a comment too.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">-Tomasz</span></span></p>
    <blockquote type="cite" cite="mid:20251031201345.3015516-1-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (skip_emit) {
+			xe_gt_dbg(guc_to_gt(guc), &quot;Replay JOB - guc_id=%d, seqno=%d&quot;,
+				  q-&gt;guc-&gt;id, xe_sched_job_seqno(job));
 
-		q-&gt;ring_ops-&gt;emit_job(job);
-		job-&gt;skip_emit = true;
+			q-&gt;ring_ops-&gt;emit_job(job);
+			job-&gt;skip_emit = true;
+		}
 	}
 
 	if (job)
</pre>
    </blockquote>
  </body>
</html>

--------------dBpWF9Bxkmxpnp0FvgSXBG9f--
