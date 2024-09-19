Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F86DCF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 19:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7F10E1B8;
	Thu, 19 Sep 2024 19:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5JLEMW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3283E10E1B8
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 19:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726774573; x=1758310573;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=QGTFbcvQWYO4C9fZjnzrMaVpns005+qpBBdC3fH9YcM=;
 b=V5JLEMW2QK5Wr+1mjIq+dtMLgBT4FhAeFN5vK41UA2B2KL11RrMzqkEs
 3YrJTu+Eg2jN1i2GzhTuAvWxF2sw8pCLA5jB+QMH7LII5YP2NlfZOhtOQ
 Ch9xcU24TTdILckWXjTkqXe0dZdyc9vw9QOftoBqTvCN0Wfqht9UGH0S4
 dF4U6dNZURfnUDY5lzrhCBih/vTRVIDkwlUCoPpuF8YIILc5iDjWxZ0Vg
 Z42X0ItncEKqb8/rGzEHIEd+IlWrGcvd92bLu/2EC+xeDpQNt7/joSejg
 0hbhlQFoaSVMwAUAYSJhXMStmCUb9VTaDai/iW+Q6VLXubG2ZAc38I3v8 g==;
X-CSE-ConnectionGUID: UxhJKCYmSg+EG5angWvf7Q==
X-CSE-MsgGUID: i1J/+QAJRu69gkQC1yBo+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25239612"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25239612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:36:12 -0700
X-CSE-ConnectionGUID: Fr+3FOWZSeuv6ez2P+ignQ==
X-CSE-MsgGUID: Ug37NhyzSMut4MbQU5IdZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="75015896"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:36:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:36:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:36:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:36:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6GzCIA4giaM7sSaJZHr3gQ+BHu54UvLqK7ebgPCTcmFFsvy1sfdwxGH8kjgLAKj2FNF/NiHSjkO93OuwS3NQI823IphFePFgtBFVyPWyWhqZKG8FJ/6QRVXIKjMWyYdjb5qtdzt4o1g79SHPtBOxvwerUag19ITQTafU6RF7MpvFe4XoY6nuiVYre5MgMbkSylTglngb/m0KtehXPpkxFAZchTU/l5YsMJ84P22V3sGjhYtD/X8NlrzX8Pmw66TxSe0VS79fk4eQLEf+jR6KLetZm4V4AVGQqigN/QOLAaN7ymgMo1cnAIwusZDy9MMi/DJ6iUBJayNFbpwOAeSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTuxcjJI0LQykt0dmkelqiWYxWisQOPQ02JKLUWVqto=;
 b=sddb5Pjl0WZnhHsCE86mIlJoFRTbSHvjGMNHuu1jplSMPdzfq9rQt/aI335ZHvn4eXPZHtfmszOxUD0cZA47vtr0CNvs7K8bZMPTqnLF3+pdv1gflxfdnVAH5UPJEUDYEGWkJrPFHGyCAkXTf0QPRNi/WSy+0/OLiJKBWi/XtsXyfcEEI85obCHA1Mo1fdK4/ApVrBgrZ5XQIBB1STGT+8IvJQ9Zm4Ddgn1QeC5Gg/7MkePN5hx5+oGTddFk78rrCOF27O7k1Ecz9uP3ch8im13GGW2VC/VP+eDUN5m4/lNRpcmdnoPeBy/aY1Q14xlVnK8vQdx5ns+z8u7yD7LQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.27; Thu, 19 Sep
 2024 19:36:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 19:36:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <172677385930.58088.6492678739635646603@gjsousa-mobl2>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
 <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <172677385930.58088.6492678739635646603@gjsousa-mobl2>
Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 19 Sep 2024 16:36:05 -0300
Message-ID: <172677456514.58088.3176651522327124209@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:303:dd::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f6e919-681a-4ed1-cde6-08dcd8e24fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YW5PZThWSUVUVHhodE1Ecm5ZUjNEWGhtaUZNMWFiVFp6cG5JeVhBL0FBTUVq?=
 =?utf-8?B?Q050cWpnOGJWNytONVB4ZzNOWlM5cStSeXlEbjYyMWsyR3JhTmpYODJJbzdP?=
 =?utf-8?B?NGszOTljQWp4VzAxQ095cE42bXQvWUl1L29xTVN3czhsUzFsb1Q4WkZzOFo5?=
 =?utf-8?B?bms1SnZWcVNjVGxHdVh0ZXVJeUtSRUY5bC9RU3ArU0RISnJSUWlPbjhRM0FT?=
 =?utf-8?B?UnBBT3VhQS8yYTgyTjU3Q3IyLzk3bzBZamwvYkxyYnJKM1ZQbE1iWThnWmpS?=
 =?utf-8?B?SHF5RDVNdW9zYWtTUUZaNHhVdG9BWWhlbDYrQzd0SDEvdDJ0b3c4d2cyajhs?=
 =?utf-8?B?MHk2YXRQRnhuK0x6UmF3RC93bFdjRGUwcnd4UXZKRTdFWU1oVHp1N3dFakEv?=
 =?utf-8?B?cVZyTy9maGRkZmVpRTRCbUxBWGx4V3pNWFFUN1FEclJ0UmtHMVV1cVIybDI0?=
 =?utf-8?B?b01YZ0EyMUREQUZpNjMrNTE5YWtpYXBLNnNDZnpOUjBkMDRvY0ZTK2JUSUZ5?=
 =?utf-8?B?ZFAvRGVYNTJmVCtkV2draVhHSHhabzlpM1lzUHJMQWROTVY5OGhROFFFRHFa?=
 =?utf-8?B?ZXVRMHRpYW5mTjFSOVZhZ1RUbDJ5aitmbW5XeUFxNGdOZkJJWHZDZ2orSWt6?=
 =?utf-8?B?MHRyd05TdEJlbHFYUlA3SWNvc3MvQ1o0bk9NR0tUdzUvOXFSckpVd2VmK0dG?=
 =?utf-8?B?Ujlrdmg2RitENmpRMVZkZHZWdmZhb3I1TkVOV3A3TmRxTXA4dm91MjBTNEZv?=
 =?utf-8?B?RkthMWZyY2k2Z2VUNncxUXBna0Q3Wmcza3hvYlJLbW9Yb0svRzV3RzNMa3BN?=
 =?utf-8?B?ak56a29SRktycWhON2J5enhUa3FuZmR6MkFCaytEcFNDaEFPSEEzZWZzZWxj?=
 =?utf-8?B?UUllR214TSt3QktZaDVFWTE1U3VFcDljY1g0cWU0ZkEwcTRxL3JnSEFTbmlw?=
 =?utf-8?B?RnRRYXpkcGQ5VGpLME9CbUdXeFo4cHE0cFRCSHRoR3pCL2JLVy9MN0VvcjZl?=
 =?utf-8?B?ZkMxczBZWnY0aVl0aEVCRkh4OUV5NE4ydVcxa3EwWEpDRjFsK1lYaGNXTHQ1?=
 =?utf-8?B?Nyt2dGd5VVZ5ZW5aTEx0WkhBZ2pFRHptTW1mVWFjekdmYWpmUmZxTUM0ZGNO?=
 =?utf-8?B?VXdPYm1GbHdqNW9jaGRNVlU4bng2Wk5HWFNYZzNBbldVd2ErSy9QN3RheUVC?=
 =?utf-8?B?R2U2YktQS1pybVJ4eEtrUms5MlVDeGovVFBUcmoyTEUxWHltU2ZJdEdDOEhC?=
 =?utf-8?B?QTVDeW1KaWxhbDJPVDlva0U2L0Y0cU9QTzNkOEtnSHhSV09XSUNzRGFTS3B4?=
 =?utf-8?B?WmFhUHpSMVRod3hjWHNjaGZqWjhNOHQ3cjgvSGtVZ2FaWEpobFlCUS9qTnNh?=
 =?utf-8?B?Tzd2T2JuT3VMd0VKa0NaeElEMmxGYlBmaEwwYXVCdG1Sd21YRnk4SGhWNGpx?=
 =?utf-8?B?L0tOQW55M01aYlFrQUVIWEZDdWdreVZJMzdrbzFNc2tBVkF0Smc0UjJhOVNO?=
 =?utf-8?B?dThvQXZnL0lKbHRCc1VaT1pxWlVUbHM4WGNlNWY5WEdtWEhOb0VaWDE0eitm?=
 =?utf-8?B?RUhObTFVMHNZNkZrWVRySjlTaDg4ZU5jVzNyQVFJbmp3RzdwQ2RLMmZQM3Bw?=
 =?utf-8?B?QVBoczdFSWdla3FQQUlOclU5WWY0Tk9zVXBaZVYwWXZlanZMdGZjUWdHM3ZF?=
 =?utf-8?B?emlsbUxmTUs5T3V3Z1F3alUvUjJPd3U5SENtbUdjMGIxYkZQVUQvTnB6V0Vn?=
 =?utf-8?B?eFFIYnF2MDZHZGN4Nk1KNVc4OTQ4eTFFUHJTYXppSHNIYm5NSVRSZW0zSFFK?=
 =?utf-8?B?ZXlUcGJIM1Q4cEhocnJNQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWdPWHVabmRpdSsyQnhDNktIUExLcWxBN1NVaUlIUi9CaWFIK3lYSVpBOEZq?=
 =?utf-8?B?MU9hQmlCanQ3TTcxaUMzS3FpVVNMbjhaY2UzTWJMK3lwdDV0ZDlFcXAyV3hE?=
 =?utf-8?B?aTJiTGc1NTc0L1pBdFFNSjVwUmNZTlZXSXl5MmVMb01UQU84WHFhMER6QlhN?=
 =?utf-8?B?eTkzKy9oNEhyUUlPc0F0bnZpSXBRNXlFczZiejVpZlFZSWtXVkowaDU3WGpl?=
 =?utf-8?B?VXdBRDJ6RTZLdm1ZTVBjSkF5Yjd6R2FhdUk2MWRRQkZtWnpkTlArQ3RYd0pL?=
 =?utf-8?B?M0QrQkxabkxGbFlYR0tNUlNYamtWL1ArY1dTZ3laL25GbFpaNngrcDNqdkZz?=
 =?utf-8?B?WWd5bVArMzUzclNobjdXb044U25VeVcwZzhHekdBczB3TTdQYW85MmVRekdy?=
 =?utf-8?B?VGNCS1hCTm84TE5mdnh3RXhWMkNQOXZnODk5QkhVUW8zSldiMmZ4L1Bsay9h?=
 =?utf-8?B?clBrYTYwL2ZFMS9MMndVZGt0bkdVQ0hDeHZxc2xzR2FSUXhvRFkwb3AvSFEz?=
 =?utf-8?B?bS9RWFc0UXNteWM5V3kwckJuLzhXcVBsR0dhdklVcDRiMVhidHg2T2FOeTUw?=
 =?utf-8?B?Uk56VjMwT0tXSGhHUVNHWkZ1cEQrN3dVZ0lVNkk2S2Z1THVCbHJWc2dDcnc4?=
 =?utf-8?B?akVQMW83T0VEd3JNbUx4cTB1UjdjYXBxZjViNzJmbUY3SXBBQjUvbGJPN3Zh?=
 =?utf-8?B?cEZ0YWxrS0lzQ0REb05pN2tHTFJ5WjVxUWNXcTFwMGVmbXpjSHVoem5HUXM3?=
 =?utf-8?B?bmkvT1JPZlNxN3VIS1YyOWI4aGVxd2NHU0R6ZitQeEdNY0lVY1JYZlNCTW1h?=
 =?utf-8?B?K2k2d0hFVVlSaUkxd2dwRW5HSkZua2tKbDJjVmhrdmZpMU42STdlcmZrMHBE?=
 =?utf-8?B?d3krczBFZlY0M2w0c1JKS0xEYlBrTFVSbjN0cGNObGNSd25kUDdPOFBzbTJ5?=
 =?utf-8?B?dG1PVWdJV2c0ajF3ZzAva0RoYVM0Tk83cUx5T1BGMmNidzVrS2R0RURBTlRF?=
 =?utf-8?B?ajhNMDlYOTY5emVrVFd5SXNaODVSbVZJQTY5SHNXYUc2QW9WakR3MFBYNXJw?=
 =?utf-8?B?MzM5ai9IVDdySnpJcGlIM3EySlF4bVJtd3hlV1ZYc2k1ankwYWxUZTVQMy9s?=
 =?utf-8?B?Qk5Xd2k1ZFRoRWFjN0gzRnAzbzhHZkNBUytsZzdNTnZPeTJnbjdRZWZJMExS?=
 =?utf-8?B?MTlKR01kR1FKNEZlMzlTdGMweVRRZENjRGZnSkpiTUFtamg4Z2ZHTWtkUHU4?=
 =?utf-8?B?NXN3U1dRR01XUThPS1N5WUl4bmxLSjdhMG5uOE56MWRYOGVOR0xzaU1qeUJL?=
 =?utf-8?B?YytaTnQ5UjAwczNFY2pCNnVvamUxamRVOEtDMXV3ci9vS1RJTUNxczhXTU5D?=
 =?utf-8?B?K2dqOHZCV0lNMFdQVjBXemYyOXVYWDRHUXVRb1psZ3FuNlNFMVkwcmY5RWYw?=
 =?utf-8?B?UmhUZCs3cm5Cc1dWZDRlT0YrR1M3MnhHVEdvbTJoTEZjdFd1OU5RVE9EeFBz?=
 =?utf-8?B?UlVMSzk1aktQNlNZUlJMM01TVHQwbzdEbVJUcysyeVQvdXhnV3BmUHo4ckYv?=
 =?utf-8?B?OXRZNWdNQXlscDBIeGtiVEJvNHhXWjlsSlYxTWlIQy9LekxxQjRIbFBJZ2Qy?=
 =?utf-8?B?WWUxWnIyakN1RFpRNFg4dEtqb3R5M2pvWUF4SDE3MXNMb2pIRklYYWg3aDJY?=
 =?utf-8?B?UldJQVppZmFGQW1iNkhFVG0yZS92QjB4V1VTdmpmbUtnNkRBek84WUZxVE5S?=
 =?utf-8?B?eHcvcWloNTZqK0hzUks0cE0rSW9xSXJRamNOWEtUaFhJTTFPYVJUYkZGU1hH?=
 =?utf-8?B?Q1Jpd2MycmR3SGVuTElaeTJFV256d0ZWR1cwOVJ1bUk3RzdPblNvS2VnVkZp?=
 =?utf-8?B?bnBpNXZQL0VBRnFqNkh4UDNxRGRDS3kvT1pJUHZLSExlamRWSWk4V1VLWHZS?=
 =?utf-8?B?SHRlNnk0VkgvMTJnS2MxSnM3alhPaGczdkNKSTFjY3pLc2loNUVEdE1wY0lZ?=
 =?utf-8?B?WldndXJ0SFUvY2pPYXpqUk50NTZBR1IwZVl3RmhhMG03M3VUbWdySEE3aXRo?=
 =?utf-8?B?bkVuYWVlU3ZNWTBKTVpPT25lRXM1dExGTXFNRFJ5VmkvWUs0MFJ0emVXd2pD?=
 =?utf-8?B?VlM2cFpLejQ3MFd5N2hjbmluQi9tQVRsYmp1TWYwa1NzRUxlT1ozWXNxWitG?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f6e919-681a-4ed1-cde6-08dcd8e24fd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:36:09.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90F0QRos+q7CuQT1GY52pSCAkfpus/KbntazjtD9CaapRSrI/77PJs+pTcChqwmhf6VK9zaBvFmz625lsTZEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
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

Quoting Gustavo Sousa (2024-09-19 16:24:19-03:00)
>Quoting Upadhyay, Tejas (2024-09-19 05:22:50-03:00)
>>
>>
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gu=
stavo
>>> Sousa
>>> Sent: Thursday, September 19, 2024 2:18 AM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>>> Subject: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
>>> flushing
>>>=20
>>> A recommended performance tuning for LNL related to L3 cache flushing w=
as
>>> recently introduced in Bspec. Implement it.
>>>=20
>>> Bspec: 70821
>>
>>Yes bspec needs an update.
>
>Yep.
>
>>
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>>>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>>>  2 files changed, 13 insertions(+)
>>>=20
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> index 6ec2d2c11d77..ccd18cdd5b50 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> @@ -389,6 +389,9 @@
>>>  #define L3SQCREG3                                XE_REG_MCR(0xb108)
>>>  #define   COMPPWOVERFETCHEN                        REG_BIT(28)
>>>=20
>>> +#define SCRATCH3LBCF
>>>         XE_REG_MCR(0xb154)
>>
>>Please name this SCRATCH3 only as bspec mentions.
>
>Looking at our register database, it looks like there are other
>"SCRATCH" registers from other units. So wouldn't it be better not to
>use plain SCRATCH3 here?
>
>Probably SCRATCH3_LBCF for more readability...
>
>>
>>> +#define   RWFLUSHALLEN                                REG_BIT(17)
>>> +
>>>  #define XEHP_L3SQCREG5
>>>         XE_REG_MCR(0xb158)
>>>  #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, 0)
>>>=20
>>> @@ -406,6 +409,8 @@
>>>=20
>>>  #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>>>=20
>>> +#define XE2LPM_SCRATCH3LBCF
>>>         XE_REG_MCR(0xb654)
>>
>>Agree with other review that we should name this MEDIA_SCRATCH3 for futur=
e use well. Also this does not look to be MCR reg. Please double check.
>
>I believe the prefix XE2LPM_ is enough to differentiate this from the
>primary GT version of this register. It is common to prefix registers
>with the name of the IP that introduce the difference with respect to
>other versions of the register.
>
>Please note that the same pattern is used for other registers that have
>different offsets on the media GT.

Ah... I forgot to reply also with respect to the MCR-related comment.
Bspec 71186 lists range [0x38B600, 0x38B8FF] as multicast.

--
Gustavo Sousa

>
>--
>Gustavo Sousa
>
>>
>>With that addressed,=20
>>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>>> +
>>>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>>>=20
>>>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
>>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tun=
ing.c
>>> index f62622f0be85..4dd77b44ac82 100644
>>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>>> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D=
 {
>>>=20
>>> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
>>> UNIFIED_COMPRESSION_FORMAT,
>>>=20
>>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>>>          },
>>> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
>>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004,
>>> XE_RTP_END_VERSION_UNDEFINED)),
>>> +          XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
>>> +        },
>>> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
>>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
>>> XE_RTP_END_VERSION_UNDEFINED)),
>>> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
>>> +        },
>>>          {}
>>>  };
>>>=20
>>> --
>>> 2.46.1
>>
