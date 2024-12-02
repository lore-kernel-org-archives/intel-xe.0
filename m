Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5487CE69E85
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 19:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532610E072;
	Mon,  2 Dec 2024 19:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeVbPWDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5F910E072
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733166967; x=1764702967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TEH6404XtQpakhKPY8DIPvOTVcblXBSu8MhH5obgqIM=;
 b=UeVbPWDP7cu83wA6dghn3BiyQ/RbcJrlD2Hqj8t6iApTLIi1r2MphgP/
 65Ob0KM1VnEYt+yp9VPy9r4DCopT7b/NK/uE4fDzgUcVN7cUYU1NsbPCE
 DK0HSv68U7wtaAD5TsRsRxk5NsZo4oLhi5bILJvgh2IUyxRtAka2IO7DH
 0UwhIRMQXj4XK7Q3m6JRMVd803BhcerMF3Pw9D7kUT6gdxoHh8ftUBSwV
 +GzP4+dUo5Qn6GoFL3cCmgaWa4etfyHBPWtuqqExbXRy3DS5v3TDrkBUa
 TpmEGVIKEByGzRJLOhJjWpz/8iRhl9HQ+MHQ+ilAR4U3cadBAEcD532i9 A==;
X-CSE-ConnectionGUID: xRN/DQ48Rm+egK1rhNUhwg==
X-CSE-MsgGUID: CjwBs22lTleTjlNUwjuXoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50766474"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="50766474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 11:16:05 -0800
X-CSE-ConnectionGUID: sHcM9oP6SIW6DM5lUGLOqw==
X-CSE-MsgGUID: K+Huq4YkSYmaw/4XkA9wMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93665716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 11:16:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 11:16:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 11:16:03 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 11:16:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuMHkyJQ6yu6T5NbaeSaYx9Z8EhYNGQW8c/SLHOr3C24N3PIfuNT68SdujMawte4OiUNL0Cf0/xrjetYY8VBm/Hx1ByMHk0OV4PHe9Rn5ofbThczhr8KGF9L+KrkZCXwuwdASy8uDW+8JaQ4rmr1xw3TQ/5pR04FPPxm5O532SOp+hgyPGTuUJDBEcCEYnhF8O3WJmNX6ejpA7+NsptyqUXPBbWWqJ5fUlSWr22nFXXj8Cgyp64ljI1ReqK9Vu0zDrIhkE5/Rh/AKaDp4TI523OnlJn14aqPDKe0kIafxS5Ny2xLRhuoQnjzf1xm774H5tGLnlSn5s8XEsLa8CyY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVXpgsAWU6Tiu8gO3ZPwMBL2StPBowmsd/POQYgHO5k=;
 b=hnDfVDYCaNsagn//OW5uY6cpbwTGmKkvRUlUIiwT8kFvdXZvVr326fw7ciTrK9ThZ6GMmQmchAGaQAIvblrnMen/PKonivP0bj9Mte/1kGhADfTN79nKkIBBWzGnhnFxYaTMsLvm1ldtFvO8bjZ6Myxc0OLV3XtnV4wSX28v+FnCLP1BGS1LcPzHwtgnto8r0xQXysTvDUERodWAtQ1cABFst22HskoIHW+fpV3P+xBJwwV19AsJGMkoe6pr/oonOapGd6mR8QpNiuwf19K3xkqEoBAozvE6BupXkuXc/HgKS08tGjpjcSNAFUNTxXWsRHWa8a/g4TSFdJBMkypFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 19:15:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 19:15:53 +0000
Date: Mon, 2 Dec 2024 20:15:50 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 3/5] drm/xe: Initial MSI-X support for HW engines
Message-ID: <20241202191550.xhbagbl3kkefi7jf@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-4-ilia.levi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241128125345.1115-4-ilia.levi@intel.com>
X-ClientProxiedBy: MI1P293CA0020.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CY8PR11MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 292f8172-477a-4bc8-3841-08dd1305bd62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTF1a0VYazBrYmJRQUorSk5XckRIMmtsa0lLMHVQaFFaVW50QXExVVlXRGxi?=
 =?utf-8?B?UTNIanpsbExlL3VDVE8rWjNqVXNGcUIwUTZLRmxRekhXTFBvRlpRbkRSRU9Z?=
 =?utf-8?B?SzF0VXFSUlU4NXluSVBDYmN0dW1HVTZxQ0JxemZjQ0JJemRZbmZUSjQwV2lw?=
 =?utf-8?B?TCtpVVpnbFQvdDFGQjMwaENVdi81UGZ6czBPQWpxaWMwVnBBcm95RDU2VFhM?=
 =?utf-8?B?aGdyQ0RjZ2lvQmJsTEVBVXdmWGZhSUUxN1dwaWhLQnRBYk9SdThNdTlmdUFt?=
 =?utf-8?B?WmQ4WERScDFzTmFFT2ZRL0VkQklpUndva1VXMTdra01NekNYZFpMamxwM2NL?=
 =?utf-8?B?NUZkMXR2bnlYZktDS0paNlluVVZ0ZXdXSUhYY3cwNjdmQUNyV3FlZnNkeEEv?=
 =?utf-8?B?VWYyT0FxT0Q0NVkrOEJKRitSNHQwZnpqZ1lRZ2RYT1JIQ05PbmFFU3dXQVVK?=
 =?utf-8?B?VXhjcnRoVWYzUFJ4cVNvYk1wRTBvUE9VZFNFTm1GV2RSYnR6N1JjU3E0ZFFU?=
 =?utf-8?B?aGxsVWdJYXhDaFBLTG9HVzVhRWx0ZkFKYlRnMEc2RUlXTFZjYU1XcEE1emtx?=
 =?utf-8?B?VWRick9ndHFOeS9JM3BBK0RBc3I1TkdOeHU1TWdBRUZONjFQR28rcFJoc21P?=
 =?utf-8?B?RXVsUVpabWlHSHI5SWhiSFQzZDNvZUlxNTBZUlgwdXUwSEgvcHh4QnZBSHU1?=
 =?utf-8?B?ejRQa0tNcU1OaGkrQ2p0bTc2TzJGQ0crdGpwbW14Z2IxaU5ZbUdjZWhyRFJY?=
 =?utf-8?B?RnF5byt5YjZBeENPZDBCOXkyakdCeFNtYVk1NDhxRWFUelVRNndDZktEL29T?=
 =?utf-8?B?ZXkxQVZhcmJmOWhseHpZamM3bTc1SXU2NC9meC9HM016MHF5WVp2RFJWc3kr?=
 =?utf-8?B?M2lPSGhWYUxNM015b2hmcG9mWWppVDh2NEdVMzUwU1VmSlpaNUY0NHd1R205?=
 =?utf-8?B?MTBPdHN5TEtVYjhuWjE5a0NjcTBSWHhVekNKNXBGUUNXM3NJNjI1ckZVaytV?=
 =?utf-8?B?QThFRTJNcDQwOGVwOFhHc3JDZW1EMjZCTGwxVnJ6Slk0ZjdFM0R4SFliYzVS?=
 =?utf-8?B?TnNFVW5nazRjZVV4dzZIUnNQaGpoWTczZjZ4NUFIWldHUVRYUlBVUStqLzl2?=
 =?utf-8?B?dWprQnZSOWhKMUE2ZmhHTzd1UkNBWTlOMmNqbWFCdDcxVjhYZlB4THpiTXR1?=
 =?utf-8?B?YlVwbmpDdnJPNTB2VFlhZXZBUFpucE5WRER0Z2pNNU9lWjdMeE1ON1d0TWZY?=
 =?utf-8?B?dDc2M1VrNlNxSkpZSi82cVRaQUtOYW9DOFZsZ2NnN21qTTdCczBCdFpkRStD?=
 =?utf-8?B?VncyVlJKM1BJdHR0WFdDQ2hkQWR2dXdNdFVjM25uc2U3MStKT2ptVTh3R1B4?=
 =?utf-8?B?UlEzSGljaUNmbGtLTFgxdFgzQTRiUURSVVhGQXNIU3VDeTFCaDJsQ0FyeVNI?=
 =?utf-8?B?Z1VPOGpzYUlManZBdWR6czZNOFlKd3ZtNEp4Vk9mTEFlTGhKcDJQNEdyNGlZ?=
 =?utf-8?B?YkVsaHM1ajJKUi9qQlRCaHBOc1VNUW4wQkUycWVOVGUyenlCQ1Q2emhvZmNs?=
 =?utf-8?B?c3dqWXZtK2puVnFpK2N4elIrMi9sdkhpS0dVYnhlOXgrZzhHVVc4KzhPUStm?=
 =?utf-8?B?SmhCZHh6aXg2TWVhVjc2TTdrd29zTzIwR1NMUkk3cEo2ZzVqY1ZBY3BRNklT?=
 =?utf-8?B?RkpBOVZUUWFUWUV5aVBJNHdmbnRjUGpscy9rZTM5VXRRUW5aeVk5MENvVWFD?=
 =?utf-8?B?Yk9EaUNLYnBkSU5lT1BSZkdXWUlQRkVaS1VWS1o2dXVIUkh4VkdiWjk4RVox?=
 =?utf-8?B?aWtKNnExZGtnRVAvNGRMUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxSeXFmMjQwOXlmTjAvRm9MZVRabVJuazdONVFDNzA4UXJ4b2EzbVQxbisw?=
 =?utf-8?B?bVhSamgzeVRPS2VXdVBaMUNsUnZnS2diWFQ4WnB0OEpLamIvY1VEa0lQb285?=
 =?utf-8?B?Tm1DMm13OWw1di94VVZBZXI4ZlFqbjY0THBpNm9jeVF3VUpNbFBHYVVDQThw?=
 =?utf-8?B?aVg2eXJoNkE2bHJ5dFRUQmdNUlNrTGN1UjdjT3ZmMFZCTWpQS0M2cm8yQlJV?=
 =?utf-8?B?ZmluSHpqL004N0h3WTRMUWN5MEtkK28rd0lsRHZxZTdDUlRUVEZMY2FMU2JV?=
 =?utf-8?B?VGg0RVB1d0ZSZ2NCWmcwcWdSU3hqL1d2RXNTNldMc3hTWjlpRHo0NEd3d1dS?=
 =?utf-8?B?cjJCQTN3dUJobFo5L2QrVllIN2loa010dVgwZHNKTVc5V0tQVXpzMzFUU2ZW?=
 =?utf-8?B?bUNTc1BOdmNIRGtJM0J3RXp1TysrYjhVTXlQOGJ3bUZUQVJhd2FGOTlBU0JL?=
 =?utf-8?B?QklIdTVEcmxqZkxhUGkzaHBKMjVwVVBDUStNdGdTTkt6TUJ6aUE2bEk5TFlK?=
 =?utf-8?B?bHNkSms0dWlYcFpFQy9SeHR4SWNENFZ4d3FvUjJkblZzLzV3MFJzb2dIMm9C?=
 =?utf-8?B?SjhVS0xQL0ZkTEFjOVpVNjNLdXZ3dVY5akxxM20zMkZPZlJ5V212VW5CVUZM?=
 =?utf-8?B?MDNjK2hqOTUvb0JJNUdwYUN4MnNteDh6cmE0TEhOcDBLYTNVTnJBWmtaalRR?=
 =?utf-8?B?WmxXdm1iUm5IalphVHVlM0d1U3NqelduR3oxUExlTHU4QlVhMXA2aDBPUmMz?=
 =?utf-8?B?eGx0aE5ubmtiYWFrNlk5WkpSbVNVK3VqWVBydEcyQVMwdytodEdLVmphVHVw?=
 =?utf-8?B?WjliYXZNT1JnMXlqdzgwYzF3d0NjYmxjbFh2dEFGb0pZNGZNUFpycUJobGxK?=
 =?utf-8?B?d1pWUVlXSCtDV3BTanZKcmR5cnp2UUxsMVp2YXVqNXpza09td3QzUy9QSjBQ?=
 =?utf-8?B?alFLMEI0RzRKYzFnc2pMRDQwcld5RUkyWWpjd210KzBMeHJ4aGJFcDRmSnlK?=
 =?utf-8?B?bTViVzRZei9GQ0VYUm5BVWsyeG9nQTdEcjJTaEJhVG1DUEtLYVhNbEFCZkNN?=
 =?utf-8?B?UHc4WUg1MTh1T2R1WGFQcnVndXNCK0p3dkxvZ2tHVUxlaTMya3NsQjhlRmdD?=
 =?utf-8?B?WVlWOUJmdTVQZ2NZczJyZVowTzF0Z3ZUT2F1ZjhTV2pPUmNKaUNmcDF6b1du?=
 =?utf-8?B?Rm1vSU83d2Jlblkxc2pDSnFMOElHejZSUG1xRnpFWThzNzhBcHhyb2NtdkQ4?=
 =?utf-8?B?T0NrL3dGdFUzZ3NzVE9OOEhITUJVRkZpMDJDTlhhamxrelIrNm1RTmNod1RE?=
 =?utf-8?B?alJ3R2RGMnN3VU96N3NKZ0grYWsxamhXNTdxSUdTODJhQUYyajFReGp2UTg0?=
 =?utf-8?B?eS9qQXNYb3pwY2s0Q1hIWUdoMWxENkV6K0VJQUQweng5bjdxV2hPNkRLZkVE?=
 =?utf-8?B?V2JXTjVYU1F1bzlzZXN3NVgzaEhEYU1nSVFZaUt6Tll2S0pKNEFyazROWVhE?=
 =?utf-8?B?RFgzQ1lkaHBHeWxTMGRsejZrbDk4eEd4aXJJWVRjcGE5SVhvZWpNWTFaM1F4?=
 =?utf-8?B?L3ZsSUhQSXpkcDR0djBHa0NRRk5zVkVWRW55VXErMFZLcUZWNlN3UEdnUGs2?=
 =?utf-8?B?TGliMHpkeUZHN1VNdDl4V1dqMkErVXdkcFBVR01YcEROVWxSTWI4YTdVMlZO?=
 =?utf-8?B?RGVoVzlOL2tlMitLeHdMaVl4ZDdOaUhnSnhja1VPTGZaM0Nid0FEend3U3V5?=
 =?utf-8?B?R0RsV3MwT05tODBUeitncWtjemQ4Q1pvQ3E5M25hZEs5M2xmRUEvZFZMWjJp?=
 =?utf-8?B?WlVDUHZkWlFhT0FrYXc4dElVaWtXM0VGa0VmTGNHVkg3Q2JoYkxqVnlEZDNy?=
 =?utf-8?B?Y0E1UDBUdzlYaUdjQjNGOGFBaDhGMU1MZlRRVnl2NGxYeEFSYnQzb2hWWHo0?=
 =?utf-8?B?YTJZakY4Q1g5dXZyUW1WUnR5UVBoN2lva0hoWmFjZnAySkszeEN1QnphKzR6?=
 =?utf-8?B?NFlDYWFTMkZWcG9Pc2lrWGhjSTFJRFpzNkprRGlJbXZMeWwwTmcvSEs0NWR4?=
 =?utf-8?B?VVJ3Qk1PMjFrRE9MR2MxUnlyM09VYTR4eDhXSWRBUjI5RFNtNVowQTN1ZFlr?=
 =?utf-8?B?a2Q4b29TMFppbnVla2dkODdUR0x3YU5zS05JNjlFeTNFSmNaQmtycWE2dmk2?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f8172-477a-4bc8-3841-08dd1305bd62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 19:15:53.2063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXABQ9CY3NPp7sp5hZsQQsoD5hoUJOFRVh/3d252kJBaY3DS2o+bDDa38t18x/LYWYjtGFxantBYrc9SS7qPUALx6ZhxYUM/cVngFq/9g7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
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

Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:43 +0200]:
> - Configure the HW engines to work with MSI-X
> - Program the LRC to use memirq infra (similar to VF)
> - CS_INT_VEC field added to the LRC
> 
> Bspec: 60342, 72547
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  4 +++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_execlist.c         | 10 +++++++---
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  7 +++++--
>  drivers/gpu/drm/xe/xe_lrc.c              | 24 ++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
>  8 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 7c78496e6213..d86219dedde2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -83,6 +83,8 @@
>  #define RING_IMR(base)				XE_REG((base) + 0xa8)
>  #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
>  
> +#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
> +
>  #define RING_EIR(base)				XE_REG((base) + 0xb0)
>  #define RING_EMR(base)				XE_REG((base) + 0xb4)
>  #define RING_ESR(base)				XE_REG((base) + 0xb8)
> @@ -138,6 +140,7 @@
>  
>  #define RING_MODE(base)				XE_REG((base) + 0x29c)
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
> +#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 045dfd09db99..57944f90bbf6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -25,6 +25,9 @@
>  #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
>  #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
>  
> +#define CTX_CS_INT_VEC_REG		0x5a
> +#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index aab9e561153d..9c94be571900 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -16,6 +16,7 @@
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
> +#include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_migrate.h"
> @@ -68,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->gt = gt;
>  	q->class = hwe->class;
>  	q->width = width;
> +	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
>  	q->logical_mask = logical_mask;
>  	q->fence_irq = &gt->fence_irq[hwe->class];
>  	q->ring_ops = gt->ring_ops[hwe->class];
> @@ -117,7 +119,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  	}
>  
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 1158b6062a6c..eec8f9935a58 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -63,6 +63,8 @@ struct xe_exec_queue {
>  	char name[MAX_FENCE_NAME_LEN];
>  	/** @width: width (number BB submitted per exec) of this exec queue */
>  	u16 width;
> +	/** @msix_vec: MSI-X vector (for platforms that support it) */
> +	u16 msix_vec;
>  	/** @fence_irq: fence IRQ used to signal job completion */
>  	struct xe_hw_fence_irq *fence_irq;
>  
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a8c416a48812..5ef96deaa881 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -17,6 +17,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
>  #include "xe_hw_fence.h"
> +#include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -47,6 +48,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u64 lrc_desc;
> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>  
>  	lrc_desc = xe_lrc_descriptor(lrc);
>  
> @@ -80,8 +82,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
>  	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
>  			xe_bo_ggtt_addr(hwe->hwsp));
>  	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
> -	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
> -			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> +
> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
> +	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
>  
>  	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
>  			lower_32_bits(lrc_desc));
> @@ -265,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
>  
>  	port->hwe = hwe;
>  
> -	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
> +	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
>  	if (IS_ERR(port->lrc)) {
>  		err = PTR_ERR(port->lrc);
>  		goto err;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c..0a1baaedff38 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  {
>  	u32 ccs_mask =
>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
> +	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
>  		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
> @@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
>  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
>  				  xe_bo_ggtt_addr(hwe->hwsp));
> -	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
> -				  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
> +
> +	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
> +		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
> +	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
>  	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
>  				  _MASKED_BIT_DISABLE(STOP_RING));
>  	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 22e58c6e2a35..bbb9ffbf6367 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -584,6 +584,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  {
>  	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
>  	struct xe_device *xe = gt_to_xe(hwe->gt);
> +	u8 num_regs;
>  
>  	if (!xe_device_uses_memirq(xe))
>  		return;
> @@ -593,12 +594,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
>  	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
>  	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
>  
> -	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
> +	num_regs = xe_device_has_msix(xe) ? 3 : 2;
> +	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
>  				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
>  	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
>  	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
>  	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
>  	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
> +
> +	if (xe_device_has_msix(xe)) {
> +		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
> +		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
> +	}
>  }
>  
>  static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
> @@ -876,7 +883,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>  
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> -		       struct xe_vm *vm, u32 ring_size)
> +		       struct xe_vm *vm, u32 ring_size, u16 msix_vec)
>  {
>  	struct xe_gt *gt = hwe->gt;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -945,6 +952,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
>  	}
>  
> +	if (xe_device_has_msix(xe)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> +				     xe_memirq_status_ptr(&tile->memirq, hwe));
> +		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
> +				     xe_memirq_source_ptr(&tile->memirq, hwe));
> +		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix_vec << 16 | msix_vec);
> +	}
> +
>  	if (xe_gt_has_indirect_ring_state(gt)) {
>  		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
>  				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> @@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * @hwe: Hardware Engine
>   * @vm: The VM (address space)
>   * @ring_size: LRC ring size
> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
>   *
>   * Allocate and initialize the Logical Ring Context (LRC).
>   *
> @@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   * upon failure.
>   */
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size)
> +			     u32 ring_size, u16 msix_vec)
>  {
>  	struct xe_lrc *lrc;
>  	int err;
> @@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  	if (!lrc)
>  		return ERR_PTR(-ENOMEM);
>  
> -	err = xe_lrc_init(lrc, hwe, vm, ring_size);
> +	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec);
>  	if (err) {
>  		kfree(lrc);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index b459dcab8787..4206e6a8b50a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -42,7 +42,7 @@ struct xe_lrc_snapshot {
>  #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
> -			     u32 ring_size);
> +			     u32 ring_size, u16 msix_vec);
>  void xe_lrc_destroy(struct kref *ref);
>  
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  /**
> -- 
> 2.43.2
> 

-- 
