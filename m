Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558E3CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AA410E706;
	Tue,  9 Sep 2025 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNu9VmJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D2410E705
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757422923; x=1788958923;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4fOzbgHg29vXE7c/dtHDZgIguIMclVBS/71rnNrnscI=;
 b=YNu9VmJfUZxopzFzsARi+4vQJ70h0ApY+BlUtNIe6dqV6hLZN4fv6sZk
 MAV/h6Opd0+7CizttLwe202ueMJZgGhx92FqI+uulG6MGXiSd9tpbh0kk
 6EVpLSxWJLwshkQ14R37yojQIVAxg3lwcPhclUTCd+iVRLKpHNkrv8/MO
 t9UNWCKyCFLUKHZKalRTOqSiL8byYlHdpUO+3JR2Y621hcDCSUFKEy5WZ
 o2X+Ij1gmVKT9t8YqkJmn+Uyrc9mGyTnnNVnVfkIsRhBXUriG2fKELh61
 2wnjEvZmu3elAmSQGh23apWpVFWsTjyIX4shHgH0Baagkdr6zSZmECff6 w==;
X-CSE-ConnectionGUID: lGgu2A31QHemHekjeMJIuQ==
X-CSE-MsgGUID: T4vEU+4PQ7mI8CIH476J3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63534468"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63534468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:02:03 -0700
X-CSE-ConnectionGUID: 82DhqFbzTBqiQ/fGFHCZJw==
X-CSE-MsgGUID: 1L4t5vp1SECzGnh8j7nL0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="178304200"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:02:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:02:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:02:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.82)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:01:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+9e7M/fG3oRdLb+uXb/m7ZLTUaKEZN4sYuC9AOKamPOvYaICmtQ/rc64gEHdUsHLfZQRVKTgu+K/9rv81ECyKG2lmNcRxrEZNEE/aqCM9HhZQFhi/LKvRPY1XIhyz/qGv/sszOUHcfnYCe4732sWwPxHdO6FoArxTAB7HV0LFqvYsogaR8RDVAs4op91/0ubT/l+b5NQDbf1noRs3sjrese4KZkoVxmSjS/l6MIXxje8xif3LAMSDZyP3k1b0hYfZozKNhEtUXoQwiREGookXaVEQMtqvJMkmEG3vY64nZlzW6Oprav/Q1UN27YeywV+6E2LSgVOz/tdsFxzJMLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3Me8bhI2JLA9d6nfz9IpRIkC9w72vO06WVlM+xrW1E=;
 b=RMqD7bG9L2iL3/HtfMa2Z+47Q8aVXKVltvyIL8n2IOHthkiQyCRPo1kqEI7txuXrDjwarNKh09nufbQYOAmam963Bc7DrdRpjTiafZy+kjUQIReOFYN/UoWVMDf9/CBtdlfweTJOI94WA7VMvFKJHKI2Bt4fMcDr0/iSRzQThB/0pGPAB2F9Zp2GOn/UEw8qlgN3syLL+nlZ3erOAM2OvgBNJvFmeL8FAvGPx5SQeQPqJLL3Ym/NkwD2wF3LnX1eGoPYrAZHY/Fb4U+S7kmDi2w0KWpqYWm4mSjoD+oRMPMfuXnYrrPhjNEVWkkMY7T6QyYXdjlx4Y9hUTjjHEBi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:01:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:01:55 +0000
Date: Tue, 9 Sep 2025 08:01:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
Message-ID: <trmhqavvrqo5ujkot2apdmtmiylbkhpnbinfocnotyvh3fo2v2@so2ll7po7bzn>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
 <175710134539.5916.1325336923027423466@intel.com>
 <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
 <175734053228.1838.4745774366865518571@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175734053228.1838.4745774366865518571@intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: b93a9313-9752-4e7b-ba98-08ddefa10d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnJ4YWN5SWoxeEVzdTlqWjV5Q3dDVlNHSHlyVUhJSjd5L25Rb2VPSTZvbnE5?=
 =?utf-8?B?U0lqQ2h5aWcvVWcwV2tKYzZ1Q1pXTTBuekVIdmJDME1JZHh0RU1YeWVhRGw5?=
 =?utf-8?B?Q2tOcTNZL3VxbmFacThielUwMklwNzkwelY0ZmIyZXllYStBYWdCdXRBNExM?=
 =?utf-8?B?UWhFS1ZIaDdMaFZ3bDUxNTJMZEFyY3ZJQWRhdER0amtiWFNnR2J6dE9zSzMr?=
 =?utf-8?B?VC9qaDhTTEJ4aTVwTHZNU2Z0dmV4YkRUa01QWWtnMEY4emU2eGNLeVJjV1hY?=
 =?utf-8?B?VlI2R0hNRmNpUk9kemZ5SE9LUFlZMlRBVWpLbGRsL3lXVlBZd2J3Um9idXIr?=
 =?utf-8?B?VG9oYnYxMEhBZDE3dWMxUGp3UnhaVllJOEtJSlFlVXZ5Mm9TWUJ5UkRHek1Q?=
 =?utf-8?B?L0JIVVBHRk50K2hJa2QxdWZqY2lCdFA0WjFkS2tVWTVlRzlnVEQyamdmWXdF?=
 =?utf-8?B?R3Y4SE9IT21oNjcvZ3YyOFJvRXhZS3dZZUJsTVVkYUZuRVZOWEt2bjZUNVNU?=
 =?utf-8?B?OFJGOUxYQkVqelNtMUx3V2NjQzBsZ2wwMHhENkM0ekp0YS9zZzNsYTE0b1Ft?=
 =?utf-8?B?cDFQRW9qeVV0cXlOVFRhWkR0aXRxbW1CM2ZkUG1SWDY5cWpzOHBXSFZkb1Va?=
 =?utf-8?B?R1ppNUN5RjdmYUxjdWpkT0xVRzBKMHNaeG1HZkVERGRCd0MwOGljMWZTc0FM?=
 =?utf-8?B?Tkt2ZHh0cDBKTEZhUHNMUitCZWZVbC9uZENmT2dNek5IRlI4TkpoT2t5N1dU?=
 =?utf-8?B?cVJhZnBsYWZDSUZQeU0yOURZQjVDSUh1OENhdFM0Q0dEc1dUSU9mdmFCYWVP?=
 =?utf-8?B?K3ZBSU9mb1lUOVYxT1gyam9yYVZydUgzbnJZUkdqNStmMkdjbHF3b0ZnNnBX?=
 =?utf-8?B?NU5LV1ZRQUVBZllSMGdBcnA2Zk1OY1B2amtwUGw3ZXNqa3VTSGhaSXpPeHY5?=
 =?utf-8?B?TndPTmIyWnVPeHFFSkVkUCtZM00zc3ZRTm9EZmVpMmhPbEQ0bWVucjVaQXNa?=
 =?utf-8?B?SWpZQ1czMk12UWo1d1d6dVZrRzRnZ3BycWtab05VTzkzNDRDVzRKaURma2hP?=
 =?utf-8?B?Qy9LVlFlWmJ3b2RFVjRtUk5iZm1TbEFhYnZHeFEvM29RdjhqQmJjV3pGQmpU?=
 =?utf-8?B?NThLL2hMVG84U3RmcWZYSmdxSml1VjdqS1Fmc25jdVNhWm9meEc5YVlVRkQ4?=
 =?utf-8?B?d1RMdWhXQWtiN2I5NlNVOWwzY2lZci9Fbm9MalduTXdRdTZEQ2x6azgvNnN5?=
 =?utf-8?B?dE8rYjlGVW90MjR6Z3RDNUd6YzFScE9TSHZPZTNhb0MrUDFjN2kvSmpGYjYr?=
 =?utf-8?B?cUJJSXEvZERsc2RoeENmdnduQjFBMTl3Mi9SY2NIMnh1b2IrLy9FNDNTajhG?=
 =?utf-8?B?eEo4ekd1dC8zeTBSTUhUanFBbktmbXZJWWhCQndGV0NrYVNaMzkwdE5wZSt0?=
 =?utf-8?B?RW9VQ0t6K2ZQZ3ZjM0N4Sys5cWd5YnVzTzNjRDFuYzdRSThWZ0VrVEkvSDNy?=
 =?utf-8?B?OHNBakdxSUhBYW5PclhJRFNIaWM4S2xUVlJGN1AzK3U3dDZIZVZUWmtRRWM3?=
 =?utf-8?B?TFp5dmFSVXFvQUU2LzBFY2UzWXFoUXVJOUJCcnpKa0Jnc3FaNXhqSXRyK3Vl?=
 =?utf-8?B?c2ZScjIzVXVLNkNpS0p2YzFOcnNoUk1HRkN3LytGVlc2SVdRMVFvWVJKL0pi?=
 =?utf-8?B?VFBsMlZPMVZ1R2lKQWlRYTVXbHIrQy8wbXVmMjRXNWNiRmc1OVNXb25zd1Nr?=
 =?utf-8?B?Mnc0Q1VtMzBvdU9GVUtmR1RKdU1pK2VLTmE2eUJxMll4K2taZmJlL3VwaWc2?=
 =?utf-8?B?aUpSZng0cGRoNWl1RVNGUllXVEpwT0xRbHhvaTRycDZXSFN0OUg1QmVGWjRq?=
 =?utf-8?B?ZmZVNUprS25BUklxeXF3RHF5ZnRJdURaMU9SWVVzL1N1U1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFVZaml6STEwanBueHlyYVRCUGRUa0dZQUwzbEtiWWxsUEUyTEkwZ29SZ1k2?=
 =?utf-8?B?RWtwdjdreWplVWt4ZW1Nc2ZNWlZuU3NNNEdNMlhnSkR1dmZ5aVRHT2dMTDFq?=
 =?utf-8?B?NVRWWDRKUVZpZjBuVVZpY3Fsb3drdFVUNGZJbm81d1lDT0hVK3lDOUpjY2Vz?=
 =?utf-8?B?ZjNZeXg5ZmpuQjJTR2I5b3oxenhiSkdDaGdGU1QrcEh1c0VKMXpWdk5wZVg3?=
 =?utf-8?B?L3ZLQzhXWmIrTWpsREV3WGdIS1ZPeEJWZGFXYXJxRWRuSkg1SUpXYkt6aWpr?=
 =?utf-8?B?Q0NOcXJ6UWxwVE5zeFpOUWZKSHd2WWhRSHFvVzFlZ2k3THRRNmZWam5DZ1dC?=
 =?utf-8?B?VnJKRUxtbXB0c016dUNhcjk4NXF3S2Nob0VsTEU1bDV6TVJBSjZ4N2h4cWNv?=
 =?utf-8?B?YmJFRG0vcm1lVVE2WkhnUEtXOWlsZCtsaGZIc01WSmE4SkwwVk5ibG9aY0tJ?=
 =?utf-8?B?MDQvN2QrS24vQ1hTTzViTkRMLzNSZUw2aGNyYkdILzB5dXJOcDdXQkQyeStO?=
 =?utf-8?B?SXVGSGxIWTFzZ2lTNk1HV0lCSmxXN3V0QUszSFVyOFNDcGJLMXFwcW42blE2?=
 =?utf-8?B?WEtlY0NwbW0yZDFrcCt4eFZkT2Q1ZkZEUTV1ZWUzdWF4bDRxeDUybVJWWFk5?=
 =?utf-8?B?N0c4OEUzMlE5WitKeThtQmE3dGlUd1hXSzNSaVZIVGE3djJySjBlSjRvTDB3?=
 =?utf-8?B?aERqem5hV1FZdmZ3Tk1Udy8zWUZMamtlSXkyWGtObmVjTkU3Z1I2THpBbHFv?=
 =?utf-8?B?bllLMGc0YzczOUdCcGFOc0hIMDhGNjJZSWJWU0lDQkd5OG9ST0piVXlLWlM0?=
 =?utf-8?B?aG9oMCtxVGloQWNaeTJWYjhqa3NxQ3lQaFN4ZllLU1dFakpkclZGcEk4MHlr?=
 =?utf-8?B?REtEVHM4MjZ4anNIQXhJcnN5RkdvdG5jajhUL3pHRDBUdm5XVjFCZlc5WEZu?=
 =?utf-8?B?OUNwaDBDT1BXNmtwMndMN0lXRExpeGlMcW4yc3dHY3dESTNyMTJxOFAvL1dJ?=
 =?utf-8?B?NFJJV3dqM1k3S01wU2E1K25hMndobkJnYnQzSUc2dzFiVFI3QzVpblBVakNj?=
 =?utf-8?B?WTdHL0szRXRKRmRGalBtSXNaMTU0V3RpVHpYdXJTN3hrZVgvUVRPUzMxUmFD?=
 =?utf-8?B?clhSYTFNNFR1VE9lRUdIZ2w1U3Z5bVI1ejhDNURBS3VEVkZ0S0pzQkxUYnNs?=
 =?utf-8?B?akpEcWg5bU4rYXh1dzYyc2JjUnZ1b0o1RFArZ1UvY2t5MVRxZEkxdVNZaTRU?=
 =?utf-8?B?S0x5akVWeURjVVBnL21kUDZERWgxWEdwQ3Y5c3lOY01FYWpuVFhUbGRRdVhm?=
 =?utf-8?B?QTRnRnY3anBZSDJaZ216bE5Ed2RzMXhrdGQvb0Vnb0ZCaTBwYUVrQnFpQm94?=
 =?utf-8?B?Qlk1ZklBWG9PRm1Lc1NTSjlnV1VEc0NpM1pTZkZuVjF2NEF6cFNyNWlFcUtV?=
 =?utf-8?B?eHlvTytOSWVrZTNrcm1aUHNKVVpSc1pFK3lkV2o1VlV4Ukc2bElpSFZTbzFQ?=
 =?utf-8?B?Z0t0MlJ6TjNDc3dEYW1OTDVvRTVkc3llczZVZEJSN0ZEL0F0LzdwamVGRzcv?=
 =?utf-8?B?NDF2NXF6R1N2WFRhbkt1L3pWaHJXbEVDdEt5T1B3N0VMMUx0TG9rbzdQTllG?=
 =?utf-8?B?WFF5Y3NpQ2N3aTZGZUVhbVI1TVJUd3N6V1hwVzdGdkVXVVFtWWdPc2U3d1dW?=
 =?utf-8?B?Y2JpNUJQTVpmWDZrVkZkWDVQSWExb2J4YXNoOUxyMnBiMzJNTXgrRnl1NXV1?=
 =?utf-8?B?WHBPd0pJcGord0hYZjZseUlMM2RaSEJKYnJpSHJxOTdOUzd6QWgzR2NzMGMv?=
 =?utf-8?B?K0hyYzF3NlpzbjZrWU5xRjB3MHFZQUFGa3R6b1JpUDlqeTRzVzdyVmVEejlo?=
 =?utf-8?B?MllKamh6Z0E2NXFXb3M3d1B4VEZZN2NoTWNScUZCT0FFZTR5cFk2c0F1VVZ0?=
 =?utf-8?B?YW13RUhaWEtSUm9hTGEvMENON0MxeVQxQTB1ZktEYW8ySzJPVFFNcW4rK0dD?=
 =?utf-8?B?anVRajBsVURqbWRzcmFlQklMUUl3N3N1aDZYcy81QmtKT0grbVRzVjFlQkhP?=
 =?utf-8?B?dzZ1cHRMVmdCb0hpdlNZZFVENFY3R3pUVHdqYUhCVEJiQ1RHZ0Z4ZlQvcEYy?=
 =?utf-8?B?NzVtcVpvQlh0ZzhTNUlNdWRHdVRIS2VSdFlYNkpUQkVvalh3ZGhFckxpck9p?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b93a9313-9752-4e7b-ba98-08ddefa10d34
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:01:54.9625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjmcP+RH35aBauiUtLzWnMBScR+jAyTmkObyku8c07Pz0RnflNYGqWV/N5hKxnLM7WUgJHyHEMsbew8Y2fxLJe6odp+euJQ2QZ6z6scSPF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
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

On Mon, Sep 08, 2025 at 11:08:52AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-09-05 18:38:28-03:00)
>>On Fri, Sep 05, 2025 at 04:42:25PM -0300, Gustavo Sousa wrote:
>>>Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>>>>configfs has a config_group_put() helper that was adopted by
>>>>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device").
>>>>Another pending work to add psmi later landed in commit
>>>>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>>>>the helper.
>>>>
>>>>Use config_group_put() consistently to hide the inner workings of
>>>>configfs. No change in behavior since it does exactly the same thing
>>>>as currently being done.
>>>>
>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>
>>>By the way, after taking a look at how we are using configfs, I wonder
>>>why we are defining each "device" as a config group instead of a config
>>>item. Shouldn't defining them as config items suffice?
>>
>>The xe_device maps 1:1 to a group, i.e. the <configfs>/xe/<bdf>
>>directory. When setting/getting a file (aka item, create from the
>>attributes), we find the group they belong to and use that single
>>lock to synchronize:
>>
>>                  1:1                                1:n
>>        xe_device ---> configfs_group (xe/bdf) <---> configfs_item
>>                                `->lock
>
>Unless I missed something in the documentation for configfs, the
>attributes themselves are not config_items, but they are rather part of
>a config_item.
>
>I believe our current hierarchy is as follows:
>
>    xe (the root config_group for the "xe" subsystem)

which corresponds to static struct configfs_subsystem xe_configfs,
that has xe_configfs_type as .su_group.cg_item.

This is responsible for creating new device groups with the device bdf.

>    |
>    |-> <device0> (the config_group for the "device")


>    |    |
>    |    |-> enable_psmi (attribute)
>    |    |-> engines_allowed (attribute)
>    |    |-> survivability_mode (attribute)
>    |
>    |-> <device1> (the config_group for the "device")
>    |    |
>    |    |-> enable_psmi (attribute)
>    |    |-> engines_allowed (attribute)
>    |    |-> survivability_mode (attribute)
>    |
>    |-> (...) (and so on)
>
>The way I see it, we are defining each "device" as a config_group, but

why would device0 (which in our case is actually defined by the bdf)
not be a config_group? the rough mapping is basically: each directory is
a config_group. In sysfs it's possible to create a group without it
being a dir, but it doesn't seem that is the case in configfs.

xe/0000:03:00.0 is a config group created by
xe_config_make_device_group(), that is called when userspace calls mkdir().

And then we have the plain config_items inside it:
     |-> enable_psmi (attribute)
     |-> engines_allowed (attribute)
     |-> survivability_mode (attribute)

Maybe the confusion is because there isn't a .make_item defined?

>we are not using it to create child config_items; and we are using the
>group itself only as a config_item.
>
>I don't see much need for us to use config_group to represent the
>device, at least not today, since we don't create child config_items for
>it.

not following. Maybe it's easier if you write a patch to refactor it as
you are saying would be  correct. From the docs:

	If the subsystem wants the child to be a group itself, the subsystem
	provides ct_group_ops->make_group().  Everything else behaves the same,
	using the group _init() functions on the group.

That's what we are providing: a make_group that creates the bdf group
and has the items inside. Compare that to e.g. one that has the items in
their subsystem's root: kernel/crash_dump_dm_crypt.c. In that case we
have a make_item() defined and this is what we see in configfs:

	# tree /sys/kernel/config/crash_dm_crypt_keys/
	/sys/kernel/config/crash_dm_crypt_keys/
	├── count
	└── reuse

Lucas De Marchi


>
>So, I believe defining the device as a config_item (which would contain
>the attributes) would be enough, no?
>
>--
>Gustavo Sousa
