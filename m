Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD5CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE4710E661;
	Tue, 28 Oct 2025 20:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUSjZlsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4D810E65F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761683366; x=1793219366;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9rSl9UvVUv1unwCJ5Y2O5DJ9nEssABO9scdrtx2hLeI=;
 b=UUSjZlsO8hG0dWB0WND4SbpdgIWBj9KkWQfwcetHY6ZxImuLbM50A5jL
 6796Qp4ydYhUtuXPyIUci8XNfXR+FsF6sSPo6zrZ4zLuE+GQzoHYjE+xh
 pz8RS7By4FONTlgYw61XAdoVwFqwJSD6LMzYsZoxSs6gm31qOetS56SRn
 PzwVYwIQkm/6S5s7YDat/LNq2s4aPBRfp+aTVnXDD76LlAHHbSRcsvmu8
 JLtQCsKLygkHpKOTIARXpTXHghq4Y37N1XPRtFztugjGVZdoc78/dqDyI
 2TdVgU1m86tlAh5XGLz29zjf3AYEjJj9aVN7QBT3Qyiwzod+ecpAXLpdc w==;
X-CSE-ConnectionGUID: 4ggvDMaVT6OqooK10mpTnw==
X-CSE-MsgGUID: 9IkNJ1nWTcG3f/gn9Qmkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74086122"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="74086122"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:29:26 -0700
X-CSE-ConnectionGUID: EWfWaFiFQmKdY+AxaJCXVQ==
X-CSE-MsgGUID: Id3YVBwmTfGV3zYDFqkonA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185342206"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:29:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:29:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:29:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcwB8JyKg5w/GuhVfnlvR6IIBZYxqtseL8M1z6NEaMdyLeZsQOT7C9OIIjuRy+QDF5L09m5doY4hVBPGHR2stn6kDRQLDjphGkAtpvtZgYILs3GmU2Chu33NzZfbMPNb8ubUcDzv3Ee7kJOAxO9LUZu3RQCALfFWZWyMdBByE/TESd1tA5tEBJYkFVHkUJnUIue4h1yG9WOqbvwejCocArp+nLVmA4gskSzi7uQ71uwGD+VIG0Nhr/UDkPucu+HreLiCiHbQXD7cMeNOkDTxMKLCpvg+A8bZ33Uw37qafhd1+xBnquUiBn1JK5XKFmWEExnIKxJnNhg+JbtiEwECSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NawJN0ravSBSrKlpZnJXNogikJoe658BLtPYSxfjPKE=;
 b=RByPsTm4ub7dSVAhu+YJsKUA76CPj4ILIq9GWcQBIQHRMMEiaijwFA/e+kdNSSLHAzi+PcRifcUXAqrY4CjVjMkCV2RuzTWu+IPxo1ePiK/t0fdUJKBOJ4JlG3zr+mNh0QmTCX6Tn0RLbL403X2uT0fc0pYZ0zmfaUMZSlrcngaYLi+7nV68kr0W/WexqEA32uYleuul2bH1JisOxvk9DzXvNHCdNcFl++lsdOLwhD/yzu5SvuxQPVm02eHxwvJUxODqR51k49asgSXQSfq60w03E/2xboklMFsI7KwXiIfO/VsAgtlpQDXSztJx2e0VPvP2i10PbN1pQj9Grd3Itg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SJ0PR11MB5215.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 20:29:23 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:29:23 +0000
Date: Tue, 28 Oct 2025 13:29:16 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <zhanjun.dong@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Add new exec queue trace points
Message-ID: <aQEnnJ3YxbcKwYJH@msatwood-mobl>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-5-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027180412.63743-5-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SJ0PR11MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 0335b7eb-6909-4046-4494-08de1660ae6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUlLRGNlTVJIK1N5d2hST1RITnJyc3NXV0RuZkVtYmRBcGUrY0ZlWlpnV1Zx?=
 =?utf-8?B?aFk4eHQ2bzk3T1h5Q0ovZzIwZ1AzTnNkSlFMWjVFTGtMeXlFVW5MeTQzMllk?=
 =?utf-8?B?KzlCa1hvcmRNL1VLd203bWRpTVprNXgxY08yS21MWndXMmNzTEp0YlhMM1hB?=
 =?utf-8?B?VUlKVS9PNGdmRUtPZVVRN2FQNFdVUUdJNy9Lc3FjWG95cVdwVDg2TWRzT2Rm?=
 =?utf-8?B?ZmhTSVNqMmF1MVdkdWZmcG9TdHhuZzdBYUFGdVhxd2lsV2RBNnVSbG4yTlhT?=
 =?utf-8?B?TWhYM3dwRXhzc3BhUUFydUluNk9zZFNLRisyN21ZWDlGbzR6cUY3cUwzeVdv?=
 =?utf-8?B?ZkJvMk9XN3p2cWdxdG1kUEczaTZMOW9ReGtQVnpRS0hSUzlPMUpBWDc5U1ZT?=
 =?utf-8?B?dnRnWmVHd2wrN3BHenBFVC9zWXJiN3JjNXc1UXc4VnhqY2VBRnRDcjU1Qy9j?=
 =?utf-8?B?Y1ZZN3FBSExCMHZ4ZXVqZGswSm9DMXZlaFhuMUEyOWRhekZKREthTkRRcll3?=
 =?utf-8?B?aFpFSGQxeGxLdVF4cU5lSHYxK2hDaEhzVjBHbVljWlVtaTFkYnFvYnVES2dh?=
 =?utf-8?B?WTJEZlBmUGlnaGgybUw5WkVpTHNRUExPTXBYZ1FyalE0d0dqaEFXRDlFRGNE?=
 =?utf-8?B?NHNjT1dzYm9QenRJOFVmK25VL0V5ZlFaVW9pMnFXZnd1NmFyZTJKSjlOZkJh?=
 =?utf-8?B?Ym5EdWRJLzNoY3Z2aXBzb3U1QjIva2ZPVjlmV1RSWWwvM2dvSWpiU09Cb2ZV?=
 =?utf-8?B?enlKUFpTT1BsS3J2ZGxCcnNldWdLK0t4c0F3RkY3T0E3bk9HeGxVQmR0RjVz?=
 =?utf-8?B?UlJkQit3Sk5CSC9nOS9WNm1OWWJoSnNCL2d4OGp1d1hBY3dJLzNtZlJLQUYy?=
 =?utf-8?B?TmdFMGd6TFp6NzhaRWg0ZE5kckpzWDdnUGtrWlRLd3Q4b2V0M3lSMlZvMXo4?=
 =?utf-8?B?Z3JGSFhMMXM3OUpjWnczTXI0UE1DQytNRXpWR294YWZibTMwM0J4NlJSNXBY?=
 =?utf-8?B?WGxwMmtHY1FFRDl4TWlZNisyWTZXYlR6RW5kS2RSR2plUGgwa1FiNDUwblJs?=
 =?utf-8?B?MWRpQWNQOWtsSkxKUkRTVzdqN1p1bFRDUUtmTC9sRnZRZTZIc2hFYkk4ZFNB?=
 =?utf-8?B?ZVhiU3ZCd0dKTW5EYm5FUllGQTBtL2RycXlFbkcxY0J6UUhja3lJdUJqMUE4?=
 =?utf-8?B?c1Yva0VWZjNWWmxTczU3bEJMclhUQ1IzM0V6TkxPUXZycEpERlM0aG1NcE5V?=
 =?utf-8?B?VjI3VE9jcTZaR3hMYUM1cDZJSGtnT2tZWlY1ZTBIN2ZodGNYVm1ZUjBoTjFt?=
 =?utf-8?B?d3BxOW5Md2N3OVl2amZhNXJGUktOblVMMFVVRENKQ0FYYnVXM1RHS0VJbmEx?=
 =?utf-8?B?emV2UVpoZ3dUdlJCVGpwY2hNeHJ6RUsxK3hseGZiU0R6dTVmNDZUR2R6N0hu?=
 =?utf-8?B?RkV2OW15VkdPQzBlRG4rVDllMVpxQWl5RzNvcmFaRmludTNjNVVVNVh5d1Np?=
 =?utf-8?B?cWxVUC9RZ3E0dHRnazJCWTFWbXM1RHh1WWFnNDRpT2JxQWhmcldRQXdwOWJC?=
 =?utf-8?B?UmFvc2Z4dzl6U0J1S1QyMmxpODVPaTkvUWNveEVJZHNGbmg4cmVzcDk4NGJT?=
 =?utf-8?B?QWkzeTFVS2J4SEwxMUZoMS9ZR3Y3aXhBMU5Yb1J6WmpURlRZVm9PZ1ZqZXpE?=
 =?utf-8?B?LzNJeERRNXhzWkFVNHBSZUhrUEg4eWJFbkV0VkhHT2lMSno2b292M21MT2tV?=
 =?utf-8?B?UGcvV0MxY0JZWGhrVVNXOXo2Z2pIenlvU0NxYURXekxTV2xOMEFjRTdkYURZ?=
 =?utf-8?B?ajNObk5BTnJIZnFiMUovWXJES0U2dVpkL1dtOUhubnFoZHhzN3h6VjAvZmsx?=
 =?utf-8?B?WnBaeTRzaERHTWE2Y1NORnpwQ3V0Q2VqWXRCTStVeWpMcmdhTURldmJMTXk0?=
 =?utf-8?Q?FVsGdYrshKnk6MeJ8u6TecMWKZVpHUlp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGxmNFVUcnZPdGxxSzhKd3R5NlVnODgrUmYzOTNRbjUycTBxL3RuWGl6RWpk?=
 =?utf-8?B?QnhkbFNubHlIMklOenB2dWJseUcwWkZ5ZkZDZnpvL2kwQ1VNM29xZC9qZlYx?=
 =?utf-8?B?NHdrQXNmMzBuTlM4VnBGUWVONlVoTVZMRndTUmdzVi9DelcxR2VFZFNGZzBK?=
 =?utf-8?B?WWpTc2xhZ3hpK240TStPU3NDWmZJc2RQOFo5ZWo0Y1FVYWk5dHlYRDN6cEFU?=
 =?utf-8?B?dDVjY3poMHczOFl4LzliMkFpeG5jRDFJZnBvajBWT3dsTG0ySlVmUzdKSUpE?=
 =?utf-8?B?azZjREE3b1FMVm9mblhnMGRTU1BFOWliUEdSZkJqTlF6UmYxeU1JTG5LZnEv?=
 =?utf-8?B?QmdFNXoyVmdpaldoWGIzM1k4cERrR2x3WUQycUMwYnM4bThUbyt0aXU0cC9X?=
 =?utf-8?B?ZEh2T0JpbStzUUpmeE9Rckl0ZkQ0dTdYdDNDQnpwd0djOEZZc0VpcjFDem9H?=
 =?utf-8?B?d1FYSEhZUHg5MllHUkJrTVFRb2NmVUFmYWF0bHg2MDVONEs3WWdwNFFOcDFv?=
 =?utf-8?B?YnBIemFpS0EzZGxTU3gyaVlraFdaaCtNYXZkbmx6bnUxWkJKcjRzVWtYVlY2?=
 =?utf-8?B?ektVdnRCTkZQbjYvZXUvL0p4SEM4R1M2MElaVHgrdmxFaVZtbkZIM3hIZWQ4?=
 =?utf-8?B?aFA4RjY0dlg3ZjhKK0p3a3RxMDdBeDNPYVJtN1pkOVBzS3VxOUxWUm9Cd2R4?=
 =?utf-8?B?ZElBc3MrVFNMVytFNFF6SitMaS9KSmUyY3VYSjROTHNIUVppRSsxdDM0V0xr?=
 =?utf-8?B?ZDZwWlZ3SjQrREtWOS9FbXBvL2NFMFpwSHQvTGN5d1JGOEtVZnMzWUYwQkdC?=
 =?utf-8?B?UnRhTlhRbCtkRXQ4Rm40YUo0YWFrSi9wZmxOOGYwU1JlVmQ0Z0ZhZ1BBSmQv?=
 =?utf-8?B?cm5LaEEzcy8vNHNIdmpkQmFIY2hIZmhMVC9ab3Q1QklORllhenhzYmQ5WXQ5?=
 =?utf-8?B?WkQ3a3F2Qjg1QUVTVkh3RnNMZ0JBL0VNSjc5eTZkdTNlOXBWWXg3NE43WXNp?=
 =?utf-8?B?aWdvRW9xNHROUWVCY2M1M0hnUFJxQStXcFR5WkhFdDlMTElsSW5lWERKRzRC?=
 =?utf-8?B?MXNINWVLYk4yenlWdmNNRW9hemxsTHRPQmxjRnNJMXdnTEVNeU5SSElLSkRL?=
 =?utf-8?B?VXZJT21GNTBTWVlYTkpaaVNkQzhGdjMvNzBXTFUyZmtON1RPSVJZN2labHBq?=
 =?utf-8?B?RzZXWEFXVGpIRE91Rnd2Ty9OS2NKS054OTgzUFk4VldtbittblNlTlFheG5l?=
 =?utf-8?B?WFNRUjk4Y3ZBWDlZeE9qRlZLK2pSWUwySDIxTkFRMzU2MURGSnhZbGFRL1hS?=
 =?utf-8?B?R1JVZ0k1d21HcmpPK1pvb25NOS9Tb1dGeWpCdEdBTzlYVjFLZmhIMDd0NE9F?=
 =?utf-8?B?aTBQWkMrdUs0MVloNG53bHFjOGUxV3pEUmtOWW5VZXcxdVFKYU5HZ3dyOCtK?=
 =?utf-8?B?OFFmaWpUVkliMVBEbjM2REo2N1NQNCtsQVVEbGdJYWVjeTVwRnBYTWxHbG5s?=
 =?utf-8?B?NzE5bGtuSHdNUEpaeEZ6SGZrYmgrbjBnZ0E3NWM4YnBvcy9COFBxZ3BIRk1T?=
 =?utf-8?B?Qm5DTzc0MlQvL0ZtVU01UC9JTTB3Q2lJck5lU2RId1NSZFp6U1F1YlUyMTA5?=
 =?utf-8?B?UXRrTmFjMDBZYXJOMlBjSkdXK1ZjdHhzeWVNT0tlajJrSnA4TzZIcGg2ZWpS?=
 =?utf-8?B?eHZQWlNiNDRrNHVJZ1NYaDNrOFN5cldYYlBjWkJ6N2N4THNLT3M3aU12VlM2?=
 =?utf-8?B?V2ZlUnYwbVFhdVh4TDRmd1puNmVNQmFNalUwc3pLQXVWRjI1djdrWVZiaDRq?=
 =?utf-8?B?NENrcEt6RnF3Ly9qTWdPSUhXZVExdkk1VFJmcHYrVmlLYUJPMmZLM2FxK0xY?=
 =?utf-8?B?bEk5TzJxaEk1ZFl3SmdVZTVRUHFyWUtERFhLY1FyMGxpOXRVeEFWRUgrZm50?=
 =?utf-8?B?TnE3Ry9EeW45YkFpOWhsV21XN1NDdS9rQ3Z3SWFZQjlIelo2TVZiMkdtbk05?=
 =?utf-8?B?Zm9xQTJxb1V6VnVCVnd2c2JXVTlKbGtDLzZQNHdLOFBJcXZ4UVlYVEJmTHpG?=
 =?utf-8?B?VHFCSE0yS3JHZEZRaS9aOTdSZWMxT29wMy9FVzFndW1tYjVLck5SVHR1Q29F?=
 =?utf-8?B?aHRLcUhnNlBwVEhIU3hwdmVrNjhVUks4T2k2bVNISUhobW5zRWJIZnZsTzRy?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0335b7eb-6909-4046-4494-08de1660ae6e
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:29:23.3852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIboM2NftFGVhQW3xlURUtnoIkmwpRJ5Uwt+zBco8TndTnCvltJ9/4hmbupquhZ1lpqN3DosYuI/Zt1jpitFtT//ZPCGOK8E9WDO1OzbB4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5215
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

On Mon, Oct 27, 2025 at 06:04:10PM +0000, Stuart Summers wrote:
> Add an exec queue and guc exec queue trace point
> to separate out which part of the stack is executing.
> 
> This is helpful because several of the guc specific
> paths rely on responses from guc which is interesting
> to view separately in the event the guc stops responding
> in the middle of an operation that would expect a
> response from guc otherwise.
> 
> Also add in the exec queue pointer information to
> the trace events for easier tracking. Contexts (guc_ids)
> can get re-used, so this just makes grepping a little
> easier in this type of debug.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++----
>  drivers/gpu/drm/xe/xe_trace.h      | 22 ++++++++++++++++++++--
>  3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..a2ef381cf6d9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -377,6 +377,8 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>  	struct xe_exec_queue *eq, *next;
>  
> +	trace_xe_exec_queue_destroy(q);
> +
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>  
> @@ -953,6 +955,8 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
>  
> +	trace_xe_exec_queue_kill(q);
> +
>  	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
>  				 multi_gt_link) {
>  		q->ops->kill(eq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d4ffdb71ef3d..3f672355b3bb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1004,9 +1004,12 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	}
>  
>  	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		if (xe_exec_queue_get_unless_zero(q))
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		if (xe_exec_queue_get_unless_zero(q)) {
>  			set_exec_queue_wedged(q);
> +			trace_xe_exec_queue_wedge(q);
> +		}
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> @@ -1456,7 +1459,7 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  
>  	xe_pm_runtime_get(guc_to_xe(guc));
> -	trace_xe_exec_queue_destroy(q);
> +	trace_xe_guc_exec_queue_destroy(q);
>  
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
> @@ -1727,7 +1730,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  {
> -	trace_xe_exec_queue_kill(q);
> +	trace_xe_guc_exec_queue_kill(q);
>  	set_exec_queue_killed(q);
>  	__suspend_fence_signal(q);
>  	xe_guc_exec_queue_trigger_cleanup(q);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 314f42fcbcbd..a5dd0c48d894 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -71,6 +71,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>  
>  		    TP_STRUCT__entry(
>  			     __string(dev, __dev_name_eq(q))
> +			     __field(struct xe_exec_queue *, q)
>  			     __field(enum xe_engine_class, class)
>  			     __field(u32, logical_mask)
>  			     __field(u8, gt_id)
> @@ -82,6 +83,7 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>  
>  		    TP_fast_assign(
>  			   __assign_str(dev);
> +			   __entry->q = q;
>  			   __entry->class = q->class;
>  			   __entry->logical_mask = q->logical_mask;
>  			   __entry->gt_id = q->gt->info.id;
> @@ -91,8 +93,9 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
>  			   __entry->flags = q->flags;
>  			   ),
>  
> -		    TP_printk("dev=%s, %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
> -			      __get_str(dev), __entry->class, __entry->logical_mask,
> +		    TP_printk("dev=%s, %p, %d:0x%x, gt=%d, width=%d, guc_id=%d, guc_state=0x%x, flags=0x%x",
> +			      __get_str(dev), __entry->q,
> +			      __entry->class, __entry->logical_mask,
>  			      __entry->gt_id, __entry->width, __entry->guc_id,
>  			      __entry->guc_state, __entry->flags)
>  );
> @@ -147,11 +150,21 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_close,
>  	     TP_ARGS(q)
>  );
>  
> +DEFINE_EVENT(xe_exec_queue, xe_exec_queue_wedge,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_kill,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
>  );
>  
> +DEFINE_EVENT(xe_exec_queue, xe_guc_exec_queue_kill,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cleanup_entity,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
> @@ -162,6 +175,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_destroy,
>  	     TP_ARGS(q)
>  );
>  
> +DEFINE_EVENT(xe_exec_queue, xe_guc_exec_queue_destroy,
> +	     TP_PROTO(struct xe_exec_queue *q),
> +	     TP_ARGS(q)
> +);
> +
>  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_reset,
>  	     TP_PROTO(struct xe_exec_queue *q),
>  	     TP_ARGS(q)
> -- 
> 2.34.1
> 
