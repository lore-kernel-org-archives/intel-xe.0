Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482A7EEC2AE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F35B10E464;
	Mon, 23 Feb 2026 23:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLYmVqB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5253110E464
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771890863; x=1803426863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T8MsWIwUyuxYPdJv9RMSktNjJGyHDuKNsTJdMSkG7aE=;
 b=nLYmVqB+uwdnAY5PQ7PEJpZsRAA0cCiTzfjtFp6O/M1qDqF3EXqTBpk9
 3F9BTZdTmQuSlNwSxi3bF1D832EC2HGkM/d3Pk3VRFNZvtLSO+4PBDclD
 10zduQj0tBJg9FdelSdhDgy0mi0ULkzxqXZrMK/jzI49/Z8nT7raIhVrC
 6QE1JmWPTeMOI4n/UZc1c5rtO7ehhQsHzrv50kKtdiWhhaeH3JGZpMjtl
 BXh/yEZ32ViytJOlmQxtr3P69UNkhsFQh2M5GXqM47GxFwIiYf2X4QI9w
 fmhgRUdXFhluo0aUNj84/oQfwtbEdo1GNgw0UmsxH2UWU+Aw84mUAwfMe w==;
X-CSE-ConnectionGUID: PQC3kirCRNOx2G/evZV7kw==
X-CSE-MsgGUID: aWb+/mPtSEOlf7ptFDe5Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71928742"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="71928742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:54:23 -0800
X-CSE-ConnectionGUID: rYNcDR5WQR+NGERswmVaDA==
X-CSE-MsgGUID: RYiGWIH/Sma2R/VATrYmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220245164"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:54:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:54:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:54:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:54:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBPYwcOiE953Oa/FJxYs6UC1jv2Avf0nE3EdqsNDsdR5iStGi/xOAze94I+YmSq27+PC9sOePdLyJ50CGagSwtNjZSlvd1JG9jQBx8u4JliXMoIi5bPs7NeOrNiUeBzmSkimo/HLjWBAWv8We46fLSPcrWBZhg+utFc9lQEpZX7WhTb2ZVLpl4n3Y6lHpv1CL5NPgTn0HB//IApI1TsdagL/KOUCdEqrSgP2C9c8mk11ehd17ZuL5MkEf1alw14bQ6hZF88bFQSmnb5fJzC9O0+uPneY11n7cpuY+cgiVjje99H7KvzlcU803Z5oSzNioDBAn7scFBR7ctqjSnv2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8MsWIwUyuxYPdJv9RMSktNjJGyHDuKNsTJdMSkG7aE=;
 b=lBK5ckrL2Jhf3yVNk+ApoJwNKyN/om8iodDrJrJ6r/ud7HdieTSMJnROm8aervm9S2W2bywA9++OBvrPOG79a6EFmja8zDInvmJ/NfBUGthyuk1vyd2LmGOHENgdADJmSGXpFWfuMOXSwzLGXsdLyvw/xH1EXGuekmcP/hT5fLE4M2FdbE1TXI1rZ3nXGLg7pipiFzQLseGVxrMc2gFEggjX+pJmH6hQf+PNk5DUiojHSgtbOK4AP8mfXyVRSw0SiQI+3WiTvY9ua8lzrBdd5j+rO7z/hT8FzCtERgqfBPtiIb7yHOi75bV4RiiIi+kHKHGE+q/0cuzqx7O9YRO7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 23 Feb
 2026 23:54:20 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:54:19 +0000
Message-ID: <c79630dc-9c45-46f5-8d55-fc0b08398a14@intel.com>
Date: Mon, 23 Feb 2026 15:54:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pxp: Remove incorrect handling of impossible
 state during suspend
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-7-daniele.ceraolospurio@intel.com>
 <9a612289-7c41-4d19-8095-59348ed107c5@intel.com>
 <5f2408f2-55dd-4c9b-a86a-73af08c81fdf@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <5f2408f2-55dd-4c9b-a86a-73af08c81fdf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8ff221-dae0-4a02-5078-08de7336dc6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXE3ZWM3SnBibnZDT3B0NFJBR05DNi9FVHJUQlJNMFZzNWRLemt6ZWc4Zmo1?=
 =?utf-8?B?QUlpaVI5RW0vcDBJT3hVZDZhb1Bxa2ZEamlVVDAycTZGMUtFTUZUbEdKa1RF?=
 =?utf-8?B?cGQ4T05QeTVyQjl5a1I4NFBaYm01eW9OMG5vTnBXaDNSS2N2cG9WblRvcmUw?=
 =?utf-8?B?VXJzMm8wOTNudVlOVUV5Smt2UmNkVndGZHpJNFNUYjArVjJQYjIwQy9SN2RX?=
 =?utf-8?B?M3gxMlV6bnRBbndLeWRFcGgxcWNQK2tZTkpEdDg4YmhLVHNxTVRvYlBoeUh3?=
 =?utf-8?B?UG1lWHdxVE1FTGViMFJoWC9yWUZRTTM4WEVNMkRtRThkRVZuN1BYaytRdTRY?=
 =?utf-8?B?aTZQTzRja2VMQ1d4aEpDWG1Fdkhhd2Y0VmpiMFNuTnl6NHozL0UrSXh1QVdm?=
 =?utf-8?B?ci92RHIxYjZIQ01vN0N3Smw0Vm9nMFgyUys2VVIvcmd6Tlg1VTJaRDZWdFZv?=
 =?utf-8?B?VWJpZHpaaEs1NEc5blJHRUlmaUJzSEpOWmpqbHhQckhoRU11UVhZdnowRXNQ?=
 =?utf-8?B?TDc0QmtSYnZmYzZIM3p0Y1gvbUloTVI4UDg4N2NDYlhsYml3eFlvOEV1bDQ2?=
 =?utf-8?B?TVFDeVRqUVlLVml6UUU0cEc3d1VPSERwZGNhMG5FTXZlOEVrYkZIcFJGako1?=
 =?utf-8?B?b1ZOLzM4RFpRQzlnMzZadGxGNWRYcG1rVGFyVnJRZG05ZGlrYS9lQUU2emRM?=
 =?utf-8?B?RFUrMUYwYUIxUC9uaVcxUW5qeVZENkJsUG9tUGJmS1RTV3l2OFpsNjJRTTlU?=
 =?utf-8?B?TzVCVGgrZlZaQlJkQXlMeFFkKzNaeENVS1NEeEhNakdDc1B4WWFHYS81V1Q5?=
 =?utf-8?B?bzVkRkNraVZ1OW5sS0pBcEtzYWpOTzEraFJOQ0I1TFZwTFVoUExOU3MyTkZt?=
 =?utf-8?B?N0l3eHovRDNYNjJvZkdQdzBzVVRuc1JlMHFXMWYxNUljd2t0ZGVCYkh5M05j?=
 =?utf-8?B?MlVmM0RPbmxINkt4V1lockJTSGE5OUVtVUFaN2JWcWhXZDZTaTUvVC9YZDdH?=
 =?utf-8?B?dXZpR3haNmF6UEtEMGtnK3Z4VWdtTDhZVjdEODdhTFFwd2ZxOHZKQzBpNUEw?=
 =?utf-8?B?S0dmeGFVckE1VW1Ock5Gc0M4UFE0L3U3RUpMWkVESERWcW9zeXFVTzluMkVM?=
 =?utf-8?B?N203YnJucnFPRUJPbXZIa3NlMjRPK0gzRS83N1VXcFB0ck5UOEw0ckNscm9p?=
 =?utf-8?B?TU9zakFoa1VTT3lFZWQ5WWV5WXhDc3lYNWZIclcvcFN6SU1SdnE2ekpIazlL?=
 =?utf-8?B?d3BXYnZiN3RjOHplWXViOFlmWGRsbEh1N0doNG1KTndQb09vVWRSb2VtUDZI?=
 =?utf-8?B?d3A1YVAxcjVaMWlSazlQUHZOeCt5ZFgrYnRqQUFiSDJ0MWdlOE1uYWl3Rjhv?=
 =?utf-8?B?Wlp4clVTQnVkcTA4OTUzNzNGVkdXaGpOSFVMbzhSMjEwV0h2NDR0VGtWTzZE?=
 =?utf-8?B?WFFmWFRqeGhLYUtJUFUzM3BzeERpL0VUNzBWbm56aldGVUNnVVUvak9PYXZB?=
 =?utf-8?B?bWFlakY5M2dvK0xVeWNYbmVBNFU2bE41UE1nZlRzeTAxT1BTbkkyeGV5Z3JC?=
 =?utf-8?B?TUwzeUtLZDhDVzdDVGF5Wk1JN0k0d05HVFhhVk1YcFFLWEhvUEZzbFBwNXhs?=
 =?utf-8?B?RU8zT1YwcUtUTGxLZWlEUW1LOWRkWW8wK1V0dzFqcnVDU3EzVUFUakNpR1ZE?=
 =?utf-8?B?L3ZKYW14MzFjbEllTisyaHdvREg3Z2xITUZ3S1g3SmZsbGNISVBPQzlQZEtk?=
 =?utf-8?B?RTkzZnZkMCtGWG9XZE5KVk02Z2tOd0VwKzBQekpkUk5HWm1XUEVFUFVHblB5?=
 =?utf-8?B?M2hZYWgzOWhvWTE2TDdXT0VseWlnMTdmZDErNW1IZjRWUTd4Z28wQ0RySlh0?=
 =?utf-8?B?Tkc4NmFNdEdkVnBMSksvdHBFdEFIVTVWM2tiWFVFM1hTMU5RVE1tNmRaSnZO?=
 =?utf-8?B?MXk1d3hmc0JVMmFXNy94OEdZcnNmMUlNSFFzRVp0ZXI5L0gyZWEzSVVLSHJh?=
 =?utf-8?B?U0E2NXE3WGU4SnFHRloydWNBMGpYOE9XT0JEcmpTbnJyby9YckZBRDlpM3lH?=
 =?utf-8?B?bFpwZGNBd0ZTVzNJcTByQzhGUGlmSFhsNWZ2U2xFWGtKRkhUSWplM0xNS2FY?=
 =?utf-8?Q?x8+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0poTEVCMitBbW4vNEd0by8rYzJBV3IzOXVURWl2Z2lLdlByNEhISFgxTng0?=
 =?utf-8?B?NERpdit4b3hGRTlWZ2RJOGZCY2krbWdzNHFHNzV1dWpKZ3BIWHp6TXFveVUw?=
 =?utf-8?B?aUhvUys0KzB5MXJBQ1pEVmpiaGpoRm5wYmlWVnBtMmE0NkhIR3JOWHlvb0JJ?=
 =?utf-8?B?QU1EU3ZnRFE1Y1ZxM2p0NU9SdXhaSXU1ZVplZEF0OTVKWk5rK1hlaVZMRmZV?=
 =?utf-8?B?eEtoVVlLK3pqcGZlMzNRNTRlWUUzTzBSaGdHY3VEU29JNm9CRk9hL0xWM3Rx?=
 =?utf-8?B?SGZKazNzbkxNRnk1L1BqeG03QTVWaTRheUVmYjdMc3FPVy8yRVRmNUc5YWlH?=
 =?utf-8?B?QWZ3WVlGbmVvNS9BVFc5Y0w5Ni8vUVM1N3hXaVJwOEFFOHdPUllDQWIzdGRB?=
 =?utf-8?B?OVh0NEdlS21FelZQc2srZjJsSUVXbEg1blNlNUFFNDkwRGl3Rk1xTzlWUEFF?=
 =?utf-8?B?ZHFMQlhSeklGa2RWMVRJRnM3UXNOU0MxUmkxV0JjQW5XVkg1NVowOFJhdU9a?=
 =?utf-8?B?MnhtWlEyUWdyTnhXL3lRSTMvZlpvYXZaeFU4OWRZWnk2MkQxdUNsWHlJWWdY?=
 =?utf-8?B?WWl4S0Z0cTFtUFdCTWs1TFY1K1FvdFNIOW4yaFRXeW5ESUpCa0c1Uzdja1hX?=
 =?utf-8?B?YXI3SFRaa1NVRlZEMG9FWnczdVRYMFlLdWQyZ3VhcDVzbW1DSXdOUzg0N3dn?=
 =?utf-8?B?Nlpyc29ZVXgxZ25oKzFEajVrbFFKOU4zeDdUOElXaGFWb0c1YTFZVGx0T1Bz?=
 =?utf-8?B?b3cvTTltUytSYXk5UFg2VW9uVXNRVTFSK0QvcDRVcHptcTF0QnZRQ001bEFT?=
 =?utf-8?B?VEVxdmo4YkdjMmszYllVK0REbDh4eTdsRTV4aHJjbkV2M0lvV0hVMERXOHB3?=
 =?utf-8?B?OVV3bVlkejd0YStTRUVxcUNScGdPMU04V2MzSGY4K3BvSDcwMTIwYndYQjdu?=
 =?utf-8?B?VXBESU52a3Z3WWUwWWI5UVZzT01WWHBzMUNBc05MODk5TWhScmNmMjNwcUFo?=
 =?utf-8?B?bDkrM2h4blRrRTVUNGN4MXR5NHZmRW93dG9ZTExUVHpQYlM0S3YxNE01dkhj?=
 =?utf-8?B?T1NHdk9MYUhYT3NHUHlWdFlQdTFhVFJPbEpLek94ZTlicXI2K01IWWtqZGtQ?=
 =?utf-8?B?Ny9qL2VtRFV4RWFBUXFiSm9NWTVPZGljN21meHFabytlTjBGMGVSZXZlMzk0?=
 =?utf-8?B?bW1KcEV6bGRSUnVLQWRkYS9vN25rTHBnWHVCK2NBL1M1RHVNWTExeU0wOFNX?=
 =?utf-8?B?ZDJaMjZWZnNldlpMcUpxcnNwRDlIOXpFYkE3bzBsZWN6a2VYdWZUNHNiQXFX?=
 =?utf-8?B?d04zZEljY01EYUR0SzJKWERRVWlLWFh1WE9WVVVTNzdpUDhmdUQvQWJhd0Rm?=
 =?utf-8?B?VytVYmN5OWQwR2twUHlsV3p0Tzd2RWUxL2U5QlFZZE5QUTdTQ1Bpb3VZWk9o?=
 =?utf-8?B?L29oRWNoMksrYTVybHp4bGx5K3VncGtYNk52SkhTcGJQaVQxR1NwRjRpTVg4?=
 =?utf-8?B?bEtiNXJ3Y3VRWE5BM1RVTHVhcS94Z09QekVOZzFVcFFXcHIrYWUyWktZQnZ5?=
 =?utf-8?B?RTJwcFlDTk5qVWs1L1h2TEJJa3lqOFpHSTAvRFFzYXRMdDlvaU9aOHRNZXNX?=
 =?utf-8?B?M2NqRWVSY09MaEZzZU1SK3hnVW11YTZhMGI3VnFyTlg5MWdyWXp1VlFzZkVk?=
 =?utf-8?B?ZDdwaXBxQXg4eUVZTDRQOCswcER2ZVNmSDl5azVyRGRscTM5NUo3RWE4SVRm?=
 =?utf-8?B?aG9lSXZlZGpySkNLcFExUTlDSEFudFc1MFFjSTFUWitJcXRzeDVmeXppQngv?=
 =?utf-8?B?N2F1cTVMbmxyaU5FWXJ5UkNXbCtjQWJFVWtMN0NaSm5MWFdGYlEyRGZoNjJJ?=
 =?utf-8?B?NGp5NDQ0WWtpQ2ZadGdFM0FCRmxiTDRBSGFrWDhDMjJuR0dub05YVFh5Mk13?=
 =?utf-8?B?MC9GRGgrSW9Sb1lSMC9qOEExRVRERkxBTjVMT0tpUFVQUTcwV0t2bFZBaEw1?=
 =?utf-8?B?SkNKLytDaC8vMFhtdDluUFdsOHAxU0tKY3YrTWswQ1JLaHpTYmI5TDdRTDRG?=
 =?utf-8?B?SWNJV0lrY3dCKzh5dkxEWi96Vkt0LzBoUnJLOTY1Nks5b2o3aVR4RFJYWFRM?=
 =?utf-8?B?ZWhNaEppUDR6UmQzbUUrUGtSb0Y5alR5dVpoQW9YNzY0cHRBaDZhZHpYU01H?=
 =?utf-8?B?V3FtYUpqVFVGWnhwaUh1YWtNclRjc3E5d2V5dzl5RCs4Z3I5SDZVMUFLZmhn?=
 =?utf-8?B?a2NyNHVkeldrb3NFUGRXM3U1OXRWUkJuUDFxeFQzNVpvbkRiZ0k3alFaTmsw?=
 =?utf-8?B?azlmSTFKZGd6NnhDMzhGWkthN0xmYzM3eG1qaTlYbHB3V2Z1NnRjeU9ib1lj?=
 =?utf-8?Q?rhj665xmP7FI4PJY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8ff221-dae0-4a02-5078-08de7336dc6c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:54:19.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NII1OoQ5uMb6NwUMkOyIlpSSL5Fz5qIp21fMw++awcXAO/7x/6zSHeiDuCuS5P03ftiP8XiliNP/onY6xrVhERfsCdO90FUphvzPMF/Oaxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

On 2/23/2026 2:48 PM, Daniele Ceraolo Spurio wrote:
> Which check are you referring to? it's impossible for that code to ever
> be executed, so keeping it doesn't actually change anything at runtime.

Was referring to keeping the default case.

Sounds good. Let the compiler warning keep us safe!

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
