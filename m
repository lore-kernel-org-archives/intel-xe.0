Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AFBCCD195
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5510E304;
	Thu, 16 Oct 2025 14:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dho2/sjz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6206910E304
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760626047; x=1792162047;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r4MX1dlqAKJiikeX8zsWtVwfKHir5QSCPpn/mvqrRBA=;
 b=Dho2/sjzZ41hkaXT24URUnkohm0+7CUnKLzYkVTiI43P68s7+QDPNRJC
 AWD+DGrfVycLxnDCOdNf/1mSsVJ7Sm982o8egSVPMDXBwJsOBCNLx8EnY
 nc5BqvyIbDzBmqe2wq5YtoUuqhMaLQGd84p0vvOdcbMLQlgaEkHjgXT57
 HgDWhNCJlKQyxnfhluntflBSqrecTl6fWGHcRoYABIyzBw1dHs/HgLcfw
 z3iPxJHBhv7p5Me6nwptB9dWyYbAOTXoe3WdsreFjLFqHbT9RSzF/L0ow
 hEGOJJVcqSZubGliocFIuKbfU0By9/N1N69mMZ2E1+QJTWy2dOQTEL/W8 A==;
X-CSE-ConnectionGUID: aRTzhxTLS76jjXOG4Sg6Wg==
X-CSE-MsgGUID: XMKKJev7SdeNQ2aRq/kuMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="88289914"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="88289914"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:47:27 -0700
X-CSE-ConnectionGUID: xmL0RH1ySW2xEgRMBbIdnQ==
X-CSE-MsgGUID: KsWTcOtZQ0m2mh48C/stPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213070819"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:47:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:47:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:47:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy3DB15Kkm0gsstluTZTRkdIamwKaNID53PLOa7tSMvkjOkGCQnChIVXBfAFddXiFtix0+SxZCLUgYIzGZYRSzN6RP/Gtz5cDGRrvNG0uPkV+iz230HUO2Xu1/c0xvFHcx0Lj8gzLC65ZlP3AqGoxv093dF+RanWpo+D7IOhASqmSolzvmIDXDf2U8JswiIkyQkXN9CKzaIqLqV+b7/f0xidTuOqUjoOTf3Tn5hwlBhUMrNkadDmw8poKCTsQo8B10InjkU4RH+KXSUxQ5THYrLyG1mgk+6UbKtxz1+SYY+uXZWRg76TMQBzZBF2Ny2oPv83EcvFXE4s0DMMtuSuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ6qLHILt5/hk5HF1/bOBRBZILZ+MqXeZg6IkrJgEkc=;
 b=fZ5lnhada6p4Ni6qJKwQcCmV+6WgzxpbqQqcVF9KVnD+K832wHjFaIEU48fXfSwr6KSSKOR67eWT7UkaUJRK40vNsqJ89WPyvL3+2Zd6cK1GxIqsstWZ/zG5BOz39Nb6hwYU8375ANBnP234PQwR+IKIVFdp95eMUTOvcxbY9hf7S89X+YqNfu8oQZlSuTTkNZ13K3F8DYdeDv02WO5g21VEiRiTeSL3KHiLb/GMBSDxc/psZZSKULn5UOganqMcV2fvEX261yUU8GZNB9aqUgsnjA/and/mAjFBHYB+AzgCIfOupIHmqaPOCryA5oPrmnBimUiV9XpZEtxoE/TnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 14:47:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 14:47:24 +0000
Date: Thu, 16 Oct 2025 16:47:21 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/pf: Always expose VRAM provisioning data on
 discrete GPUs
Message-ID: <20251016144721.lzms3fkvs575kutz@intel.com>
References: <20251016122233.3789-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016122233.3789-1-lukasz.laguna@intel.com>
X-ClientProxiedBy: DU2PR04CA0338.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bd65a1-1c6e-4b2d-49a7-08de0cc2eb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0RZM3pvTFNraU9TZWVRa0Y5Qnd1NlovVXBKYkhhUmxiS1oyMVpxeE9NdXdC?=
 =?utf-8?B?WFVtVy8wZE4xcnBYZ2xQWExoNS9rbEFnaUcyZDdPUlZIa3kvSXplbVlDVXQ2?=
 =?utf-8?B?ZTFTUjR4NU1Rdlhtd2dMMlF5TUlWdDk2YXRuTG5tSXprQm9scENXSk5peFI1?=
 =?utf-8?B?ejV5NUtCbnlzQ3NFTWVQWUZ5anB0aGI0RUgwM2VpVW5aMyswMVZlSDJqVXBh?=
 =?utf-8?B?cTdhTDR3Z1psQXRSWG1zcWMxY25LY1hHc3F5WndWb2RMaU5SRlRIMWtVZ09Q?=
 =?utf-8?B?TnJyQlR6Rmx6cmFjaHR1aVRNSWlVUWp3TEE2R3NzTjNOSWRIQi8rWDdkNS9x?=
 =?utf-8?B?K1g0WnZIZ2FvOHhqek5laUFHUGxONkt6cDlPN3pWb0QvMEloUldaR0cyZmRu?=
 =?utf-8?B?MmMvbE8wdnBFakttbC9JdGw4Y0hGd1FDTGd3WXRONWV0dFh6a1phaFl1amc5?=
 =?utf-8?B?cFlVNndTVDNocUVSU3g4cnJDRTl3STQvdlU1bG5uSDVjWEFRSWlnYjdjeE1U?=
 =?utf-8?B?K1R4Um5yckpxRVAwOFNWQ3RmZGRpS1RJcnliUGl2MFcrQzhzOFNXdlNISGsr?=
 =?utf-8?B?eUJZd0R1YXUvMkVSM2J2UmVKMDdlcGJ5d1ZKU3diMUtNd2daY2pTa0owU0Fv?=
 =?utf-8?B?Q2g0K2xtektGR0xDUjVXQWF4ZkxsUzF2WXNTWHVYQ0trV2hYbFBFdnhzdjQr?=
 =?utf-8?B?cEZDOTlkQTE5T2NMMGh4YmlCbm1Dd1FMT0grWWtCalFTWGlrQmtaaGl0aFVH?=
 =?utf-8?B?Nzg2czh0ejNHVW1lcVpSK0tuRlcxZWJuLzd5VUlZMnB0T2d1WFM4eU1qaXF3?=
 =?utf-8?B?NFYzbGx0eDVJSWp1SXBhb0lDbU0xSGtvR2sraWxLZ0haTENDK1ZpdWx1RmVa?=
 =?utf-8?B?TWVjTnFLR0NHc09WZHdWQ0RFMmtqdXNpV1VPVjAzTmlyUU9UdlVOREhMdzdS?=
 =?utf-8?B?SHR5MlI0c1I0MkVBcURVb3ZibUhBUXMvanJQdllwUHBhYm9DNkhZSlA2ZGxU?=
 =?utf-8?B?bWJDOXZCNlFBZm1ocFYyU0VIT3ZpSzFOZnhQaFA3REpLdGNVQklHOGdHOG9r?=
 =?utf-8?B?WEtYNzloT0YzOHJId1JLcW14MU1qVWVvMEJwSitPZW13SUwxSTVJeEpjWFhk?=
 =?utf-8?B?dTRvaVBNT1lVWTIyS2tLcWhzOGI3bFM3d1lVamM1bVdVZ0g1YzNvYStNeDAv?=
 =?utf-8?B?N093ZXZ1QzgrbFJPYUo2QUFROTJzWEpMVDFsa01jeVBJSWRINmRGR1VoVUZl?=
 =?utf-8?B?Y3kwRXI4ZjdQRnV6YU9sWWZ3L1hxd2NUOXRuSmgvVEFTWmJqUFRrZXViVEJj?=
 =?utf-8?B?R2ZYZEdnY1dVdVBpSUVlN05FV2p5NitJTDFnbjlGZU8yWk0xa2l1V0wxRnFw?=
 =?utf-8?B?ZmpUTVVOaFpWWkdWY0VRNW4wdG9wODF6MEU1dlFwS0EreGgwRWFXR3B6eEZ1?=
 =?utf-8?B?RzhhMlJXcFUvdTdyYVBVaXdLV29rUWR2Rkk3NmJXT0p5UWVJTThORWFoTkp2?=
 =?utf-8?B?UzlhUkhhSUZuUU5Ob2twMTdWaEh3NEp0WWFjUk5RcFNEbGVuTlZNK1BSS3BN?=
 =?utf-8?B?OThRdTFLVHdIZDBNWUtTZmlFRWsva0ovNjZpV09VUy95dUZSTXIxUkR1cUtZ?=
 =?utf-8?B?WWJSd2FqTk9HY0IwcXpoTXAzRkQyci9DUVZad2hVYUl5bFJxVjUwd1M1RVh6?=
 =?utf-8?B?cEdtRXRxaURTKzlLNlRWb0gzSXlWaVZCQktjb0w2SG12NEZEMEZmQ3hsQXd1?=
 =?utf-8?B?U2tqUzdNUzhqeGJyNHlTdkE1NHJWRStDQzNhUEJTRmJ5NGU1OEVGQjZpWFI3?=
 =?utf-8?B?V1FLMVIvQWEzL3dzNk43Zlh5MlVDSFZqM3Z0dHdWWGJSWmpmRUxpRDhCUkNG?=
 =?utf-8?B?THBoVS9SRGFUalBVcFdUWVI5aWdVR2hETEQ0RncweFFRbHhWK1NkUnNvdXM5?=
 =?utf-8?Q?MVcJDLyRDbvuJbWRT5elRPa0KCe5NoiK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFR3Ym92d1QyMlBpK0d0a1JkcGZ6NURjSlRzQTJnUWpkRkQ3SGVxV21mcHNQ?=
 =?utf-8?B?SXE5Nk9mVERURXpsclJKVVlGaDR0MTZiMHpMbTNPSE5PVGRDcEhHdUpOdEJk?=
 =?utf-8?B?eUlzYkx3QnFBTHNjck94MVJUY2xsc1VkNHhpWU94cm1Gbzc5VzNLampEeVJ5?=
 =?utf-8?B?cFA2VGtkTVNVRkczRkg0TUMvYTdIZ0piS1RNS3QvUGZsQ0tuM1p2MEV2L2My?=
 =?utf-8?B?U01vR0JXVkx0YkpTWW1zNU1rNHRnV24zTmlvd1NJR0krSTBiK2VQMlBvR0Zh?=
 =?utf-8?B?NTUxN0lROTVZT3BQb3BLSGJzSGEvM0U5UVoxQjFZUEMvQnRJa2hZWU5Wb1kv?=
 =?utf-8?B?Z0ZUaFFOTnFaTU1MbURyT3J5ZDR2ek42VW9GVHpaQ0lsOUE1K0VMclJHdkxY?=
 =?utf-8?B?dXBFTmNvaVVONE5qcWh3T2lBZzJmMUpwWGFDWGFRazBhUDJKMUx1eENJRXkr?=
 =?utf-8?B?SS9qeUFsODR4TEI1bHNNQW9idmlCSG4zL0NOY2lzdGFJcnZhTDZBcjMvWHN3?=
 =?utf-8?B?VXdMNnJJNUhvRXVBSkdXNjNIVjRJWDdVd256N2RFb281T1UvVjBGSC9zK0JE?=
 =?utf-8?B?Qmh4c0Z4OE02VVJ5WGFEcTF4eE1mcDNvSTF0cUNML0UwQms1bmJ5OWR5WVRh?=
 =?utf-8?B?UWYvWjIvaVAyVndJelZtMEhDaERmUkZ3Ri9weis1VmJVMmpiMTZXbndsN2Nu?=
 =?utf-8?B?ckVHeGhQT3VKZERwZHJCSEZXRW4vMHNuZ2g0V20wVUtXN0NhaFRRSndqTjZG?=
 =?utf-8?B?S1kyclZCenM1WGdCTnpQQnRqTFpZbzZvQVVCV0YxN1JnOUJoTThRN2dnTUJu?=
 =?utf-8?B?V3U1VzlnMzR6dlYzLzhSUUs1cGZqempxM21UdWh6NVEvby8zMDgwYmd6K2Zo?=
 =?utf-8?B?c1RVSkF5NkRXTVZXbEJqeXVnVXl1Q0w4dkZSM0hPYnczNUFieHM2bStWc0NR?=
 =?utf-8?B?RGJocjkxWG52bUUycHExK0hvc01sMDIrdVpsQ2hMcjRpeExRNEUrU1IvT1VB?=
 =?utf-8?B?WXJLczVWclhBMDdyWEJ3T2tvSjRFNDB5RWxEZzNHdmVZckNneU5FdDdjMjhx?=
 =?utf-8?B?bUhJekVqSGxVcFJlOU4zb2h2czdrc0NLUlh1OW1DNGg1MWx2QUUrd0VuZnRU?=
 =?utf-8?B?bGJCYldnZFF4SnJFeVdVY0lVSFJQOFRiVDRGclkyYXR5ZEtyU1J5N1BJSGpL?=
 =?utf-8?B?cVp4NEhicTl0K2Z2TjVXRjVTajFsZXEweUkrU1hSbHJvV0VuQXRSdFYzM2s3?=
 =?utf-8?B?MXdxektpb1p1WFVaaGF6NHBieUp6d2pHVDVKRjluV0tabVYvMmRyT1RDcmZm?=
 =?utf-8?B?eW5FeGlSOUoxOVBpWE1ueWpWcVdVbXJGMmp3Y1VDdG90L0twVmVGZHZFSXpv?=
 =?utf-8?B?d1Byb3BNY09yQnU5cENBRzA2aGpYOWhNMW95SjNYUFQyL1N1ZmNNTjh0Mk9T?=
 =?utf-8?B?NW9CcjlTSGczTGJMd2F6WmRPeDhNUWpsT3lIV0NrUEMyWUtmcXJrb2lWRU1B?=
 =?utf-8?B?RGJnZDFEdVg5MmdSaS9NQldsV2pOK1V2UXY5ZUNseVlOaUIwNU82amlGOXNa?=
 =?utf-8?B?VjdybUpPenl4OG9HYWRXQVBFVFhZR3lLbTYyb0ErbFR4QTlWemlmaDhEOFBO?=
 =?utf-8?B?eGVRbGtCbzl0MU9GaGtGdFMyRG9yQWlma3MvYkZMaFFiNXV0WWpDYXVzaURP?=
 =?utf-8?B?UFlUSWNjSnJsbFhMYVdRRFJxQ1gvU09CQUc5T2VTRWhwREo5bjJZL1lFaFpG?=
 =?utf-8?B?dk9QT3lFbDFyRFZUS0M2allEVjdJMXF4dGovbUw4azFZc2s5eWdDR3FsZDhz?=
 =?utf-8?B?MWhoN0NUbCtDNDZnZGdlSEdkaWp5L2d5N29BT3FqMnk0bXhqK1hqWllOcXd4?=
 =?utf-8?B?dEQrc1FIYmFqVjVIbDJQcUtEditnQkM5OU5mbHVuOUsvVVdOMlN0NEtvTmFN?=
 =?utf-8?B?K1ZhazhmeGZmN2k2ejdMVjVSbmE3b2l2d2NDTDRpNkZjd2JKRzc4VllRb3lF?=
 =?utf-8?B?VjJFVHBIMzBFSXdFaFZvSzhHOFBkeXZkdUtqenNQS2ZXTmFUa1cxNG9LOE5r?=
 =?utf-8?B?YU13UGtFUE9kN3FBMkNzeEJORkllbGxCUHV6YyttN0FjcVpEaU9Mek1Hek81?=
 =?utf-8?B?QnE1M2FseS9jd2Z1M0NXbGR0cklrWXFaL09OU0FxbFFMZ1Iza0NiUDg5c3Ft?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bd65a1-1c6e-4b2d-49a7-08de0cc2eb10
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:47:24.4161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtCuQiGuqqPSouXrq8/DvlQXPuxd5VVuS8Qo8rRPHM1x+MVAqixF1nnLip4Ig9gZLbmHZcC7jMNScTspZdR7gHfwUqQoxep+4LVHTIkqgZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
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

Lukasz Laguna <lukasz.laguna@intel.com> wrote on czw [2025-paź-16 14:22:33 +0200]:
> Currently, VRAM provisioning data is only exposed if the device supports
> LMTT. While it should not be possible to modify VRAM provisioning on
> platforms without LMTT, it is still useful to be able to read the VRAM
> provisioning data on all discrete GPU platforms.
> 
> Expose the VRAM debugfs attributes whenever running on dGFX, adjusting
> file permissions to read only when LMTT is not available.
> 
> Fixes: 921ddb37d87c ("drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device")
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2:
>  - add extra protection against changing the LMEM provisioning (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 3 ++-
>  drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b2e5c52978e6..c0c0215c0703 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1548,7 +1548,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>  {
>  	int err;
>  
> -	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
> +	if (!xe_device_has_lmtt(gt_to_xe(gt)))
> +		return -EPERM;
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	if (vfid)
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> index c8df18af4d00..6ba2332c77d4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> @@ -165,14 +165,17 @@ DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
>  
>  static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>  {
> +	struct xe_device *xe = tile->xe;
> +
>  	xe_tile_assert(tile, tile == extract_tile(dent));
>  	xe_tile_assert(tile, vfid == extract_vfid(dent));
>  
>  	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>  				   0644, dent, dent, &ggtt_fops);
> -	if (xe_device_has_lmtt(tile->xe))
> +	if (IS_DGFX(xe))
>  		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
> -					   0644, dent, dent, &vram_fops);
> +					   xe_device_has_lmtt(xe) ? 0644 : 0444,
> +					   dent, dent, &vram_fops);
>  }
>  
>  static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
> @@ -188,7 +191,7 @@ static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned
>  		drm_debugfs_create_files(pf_ggtt_info,
>  					 ARRAY_SIZE(pf_ggtt_info),
>  					 dent, minor);
> -		if (xe_device_has_lmtt(xe))
> +		if (IS_DGFX(xe))
>  			drm_debugfs_create_files(pf_vram_info,
>  						 ARRAY_SIZE(pf_vram_info),
>  						 dent, minor);
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.40.0
> 

-- 
