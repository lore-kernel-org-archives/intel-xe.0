Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930DBCAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 20:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A50F10E7CE;
	Wed, 24 Sep 2025 20:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrCNsMo5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9636910E7CE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758744746; x=1790280746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWevKJNvPKNqgfiQKYmGFwEZtrKOu02r0Ld8oJfdpiI=;
 b=HrCNsMo5odHuGS9YAsiHwC6EETExXjks36Ayyu63FplwcW4o07uW6k2/
 NwsOAQXGXlmLuf5/lujfhq30DYDWTjWEJp3d8hBrZXNko50P0X+jYrFXy
 OfEsmbnKrm3B81RhAx9R7yNQ0Unuq6uPk8ZithysqbewtgIeURiDdMtQo
 wri4zKKQyqNQnwqoHLo/8MyL3xyL8wYINRUcnw1Ml8Zx9YrWDnjQ45V69
 hn5uDUbJbD7/XcsCKGBVB1aleehodkROMJlyh70OEbhEJNVP983eI+cAx
 U9soLa6veExGyNCw0wIpMR/I0o068Y0XXnzOqiX18ETO91czFoF2uuMnD Q==;
X-CSE-ConnectionGUID: EH7Tn8iRRZyvnvwTwfmsag==
X-CSE-MsgGUID: P0CQnhVMRTuK5OvBIER4KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72409098"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="72409098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:12:26 -0700
X-CSE-ConnectionGUID: IH1h42qzRoqq7tNSe+r6Iw==
X-CSE-MsgGUID: c7Ps+klgRUS6K8oVk8MwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="214257518"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 13:12:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 13:12:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 13:12:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 13:12:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSEw0XKynLUCEYWECZW9HvfpiYQF4kWlXQrTiHeZ6xkltpbzMG9ruf1Geci11nMTsPn3Md9FHSs9RST2Up/6tBf53n9heC8e9iMdDTrRoMPjH/s+s+3GMo+RRBs+N1IODPJZhS//aApXIqIXdIAWP/2Q4+2KfSR5SItjt/AG2d/wpZmnCUft0RdZci0pmEHpBMGMPqWwJwpKFSzteQtnCQZN5GKdFM3jgJFmyoPUxOofHUIQCOib42deLNJbFuf56ZVjSb8+P+r7b8tCQLPK2uJY8oNVVCuS1/AmpkwAoSRAsMdkk2A5yYozD+ezZEle3hzinNcXXiFCMWbsk3uhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHeCBkVvPyIQZUj/29RNeUrW/ODy2pBS2BouKSQcXFA=;
 b=hzjWd7u+s1K3Lv7ZAhC+c0WQTMPg05oKNs3QuyAbawfESFovDHFOfYrB5S3q+q/YEr/HG7RjCP6WBubuRFQTiv3WfMFjnndJMJICfIWp3Dhl71nerp+OX58NDBBcvdrwKAJcCP1VwB0wmhhazsfMglcSsiFX7MhFjzhuYdA71211861BPWS/5gtT69FHD4DVJOKtdboI9CWAYagDTJLWgeq0xm1jABa2NpCj89FSue8J5whA+SchWfBbBvLnLTMGTgqMYMZAoYkoIqddxHnlDOyEMD/+dOgnbIfYvkRqRD4sGlsInO4foxYwVOG+jpGOYuEgr0ztPjkbKxT+WxycwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 20:12:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 20:12:15 +0000
Message-ID: <739191aa-d593-4080-a5ca-6d903da8acb2@intel.com>
Date: Wed, 24 Sep 2025 22:12:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/34] drm/xe/vf: Add
 xe_gt_sriov_vf_recovery_inprogress helper
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-12-matthew.brost@intel.com>
 <30efe3a4-0598-44e7-90aa-5283ed8247f9@intel.com>
 <aNRI24axOgeDirc+@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNRI24axOgeDirc+@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 6834fb1f-9c34-4136-b33b-08ddfba6a7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3BWdkxnZTBGckE0VE9rMHBFb3dxaDU5ZHBoZytweDhudTcrdHJnWlNPbnYz?=
 =?utf-8?B?QmN6T040MlZ6azBxbDV6T3pyQ1gyelZOMlpBbXp6VktzVE81YUJadytRRnpX?=
 =?utf-8?B?eUZPN2wvMzRNQmZCRGw2S3E2YWhDQjZvUWswS2s0NnZFTkJIemtHS2NzcWoz?=
 =?utf-8?B?Q2ZSOUQvK3lxR1BuZ05hM243VklqQ3E1UzdCWkpsNm9IbHYvRlhBU1diOFJp?=
 =?utf-8?B?L2t6TC8wMFc4dGVleVM2U05RR0doMTBEMlhRRkhFTlQrMHRJc2ZFWjFwNU14?=
 =?utf-8?B?cWJKZ2NZV2dEMy9Fa1pPcjFKcVFiaHBKbGx4aktjR3dRSVowdWRBRUgrcEc2?=
 =?utf-8?B?RUhVRGEvd25wbmRCcThQOFdzNDRDQTdiWXp4MFN2R05JN2haemJXY2dkMHY4?=
 =?utf-8?B?RHhhSExac1c1c1dIN2M3R0xYMTlmR0xsMVJtVHFzZkVyZUtXaktXdDJ6Z0Fv?=
 =?utf-8?B?VENDeXEyU1RsRFVmQXlDeW5vN0x1RTJMak5mdlZmWXAzcGR4NnlJWVdsdjVF?=
 =?utf-8?B?MkxOU2NlOTlQRDF5ZGZuWlA2VzNZQWdFWmt4TGFqcTExU3JmQ0ZCOS9aNDhP?=
 =?utf-8?B?RWs3NDZCZ0l3WDBITXowMzY5Q2ZsTmQxanVZYitwbG5jMWZYMjNMYTJpVG9x?=
 =?utf-8?B?QlIzMmlrbHhBWStrZVhwbEdaSzNvWWRSbFlvR2VtS2htWTNQMHBoRm5MSGJF?=
 =?utf-8?B?K1lyOUNaQUpJajFieEdvZUtMR0tOWUJCd2xIUGQzWFF0NXcvejYrUVRnTm1V?=
 =?utf-8?B?dlI5RGhXRTBjRkxBbzBvNnRuRit6eDQ5czRLQ1lJWGEzdzNQTGExd0ZEQnpp?=
 =?utf-8?B?N1c2bWpjM21tQ0x1SjhmZm51eUpiWDFveko5dm5XaUMvNWloaVFKczc0ZGhO?=
 =?utf-8?B?SkpEZ1ZFUWljNm91RmNXM2hSZmVydUVjak91NVBIb1JhWWRsWlJzdGdHbThy?=
 =?utf-8?B?VkFJTzF2U0F2Y2JBQWZheFZSMG95TzJ1RlhFa1NEaUtuTGNUYzBCcmdZd1po?=
 =?utf-8?B?SHpEMWJkeFR1UDBaRXk1bTgwaHpNVTNMVHZTcDgveGxVd0lFOHpEZVNhVkEv?=
 =?utf-8?B?Z2VxVEtxYlkrZU5FQmMydFU3OGVhNm1EKzZzWXJLR3hOREdFK3diTWJmb0hE?=
 =?utf-8?B?WnJJMzlrK0cxQzBUYVgrV290WUUrVVNPbFNHSCtPaFhCY20zR09NRFpJam5D?=
 =?utf-8?B?VDRBa1ZNbVIxb3czWUNTQm1rRUpDYUhiNzVNWG9NYXdrRUlKOFFNSU5Bb2tE?=
 =?utf-8?B?OC9IWXpTR0EzakhyZGE0a2FIeFg0NTM4cTNJR0N4R0lJK3FqRUhXMDF1UjZh?=
 =?utf-8?B?WVkwNjlmZXVGbU9WUCthWjd3b2Vnb05LNnl0VENXS0Vua3ZzZ1JBZnVnY0ww?=
 =?utf-8?B?ZFVqL2x3eEtTRnBpdHZGMHBHd01jZVI4SXVRTFpQUDQ4THVWVE9YK1dIOStR?=
 =?utf-8?B?MW1makxXNHE1Tm5LWlFwb0pSNENWQWxKd0x3bXVFMXYwazZJdThZeFJyTkh4?=
 =?utf-8?B?TDVJUUdQaXpFN2Q3aFRPYU5DUkdGbVBFWGNaRUtQREJuUWFhUC9xZVNKM2tX?=
 =?utf-8?B?Zi93YVhGcDM5Yjd2bGJqZnh6bHlhamhGdjd2Ym40OW5JQ0FsZkc3aDVYaHkz?=
 =?utf-8?B?WmZ0QkFWdnQyeUtaS3JtY1FjeXpNNDFkUTd2eXNnaitvYjY0RHE5VXNqbzht?=
 =?utf-8?B?UlBkSVhQYzFHd0pSdWQySDMyaElkMElrblhoWld0SkorN3EzUnpHWGRreDVI?=
 =?utf-8?B?MkhtTE5uNnpiTTFpaTFoazloTUU5cEo2M2RvUStHQjVjOHZhNUcrVzBVajdj?=
 =?utf-8?B?cEZqNk43S3VOMkkyZkdCRlB1UEJ5N2JqUFdjc2FSYkZwVStaYXM0SHVGS2xk?=
 =?utf-8?B?R1M3SFo5SzNRUDZnZng5R3VHa3V1VmRZbTBFV3NmR0hCaC80U0Y5Y0xjT0Zh?=
 =?utf-8?Q?mMi+R5X1mGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZPanBmTFFMWXMxZkFlcnpmdGFmYkN0d05CQlYyS1gveS9oRi9VY0x3TTJj?=
 =?utf-8?B?Q3ZCRHV4bmJOOEJTcXVpajFwYmxFTE1yQW43L3o3V0hPU2ZoSis5d1k2RHFL?=
 =?utf-8?B?M2NEZWVWeDFHNG1mNTFPZmplNVZjN3NQTHBiTXU3QlF0N21TcVhWVEFGRUFk?=
 =?utf-8?B?QXVqZTM0N2owOWtEUUNZYXZZZW5UMEtNaGI2MDZqTXRBVDJuYlBHWHRsNWUr?=
 =?utf-8?B?RkZ1QjI5R05jSnlzM2Y5UGZJMGhWQTZjSkI1TEN5OFZBTGZsQjRRWHhseDZP?=
 =?utf-8?B?VU9yNEtTVHU0dXRUNEJOYWFTMHhsaUZIUks1c2h6M2h5SERoMHJYR3JuSUFZ?=
 =?utf-8?B?VkRYYkxTK0NwVGl5MjJqYWl3N2NseUlpUng3MTkrWnkybExYS1JYUmozekc5?=
 =?utf-8?B?eEk0K1pFREVUbUdSQ0FSb3YydkI1NVFRTnNVS09CWndheElVS0ZhRjBLL1Uv?=
 =?utf-8?B?dXJ1b3ZaNS9ENC9FeCt4QWQ3ZDA4OGd2TVNkQTh1dWVJMyt5RHlRVW1JTWdU?=
 =?utf-8?B?ZHFxZU1NSlF0UVpJTThXN3VJMExSVlUxKys1NDhwcC9tUldhUm92cyt3a200?=
 =?utf-8?B?Qm1mc1BNb0hvaWFoelQySUhoWFJVS1MreTFWY2FDNzdVaVVNVHZxeTd1bThE?=
 =?utf-8?B?akpjTk05U0FTOTZLd1pDbWlvbElZNnloM0hKZWU2bXhFRzlrWFF6SDVzcmdu?=
 =?utf-8?B?Y2NOTWNQbkwyZHdJL0tYajIzcWMyVjhmM09jQW15THFjc0Y2R0pLRzZ1SjIx?=
 =?utf-8?B?ejYzNzF3bGFTcGZ3TGF3LzdPK1ZtZkZpTjJuNWhyUzNBbElrOTQ0em4vK08y?=
 =?utf-8?B?TWxJZEJIUFhyVXZrTXZZTWQ3Z1FNL3BzTHFxSGlnd1ZDSTRVSUljMkZrOEo5?=
 =?utf-8?B?T1oyVGpZdURsdjdHVDFyQ29BUFBjS1JHY3NOMmpHbjBwK0ZiclBQRkRzUHpm?=
 =?utf-8?B?L2ZWODhQOEVRM241Qzg0YWtwUTJZeUFZZzJPTk43ajZESEVzVnVVZlYrblJo?=
 =?utf-8?B?Y2ExOGYvVFc0TTVCTlNNMStXV3Zna1A5SGVKeTZtZUpqYmpxSWpIODlOS28z?=
 =?utf-8?B?amFPOXM1OHZPZCtDcG1leEdhUlBwV214K21kS2NqZWk5bDlxSy9UdFcyNnZV?=
 =?utf-8?B?dGowZGhqcXNGTTg5YzROVUFJaW11YmdtK1VjazBOWm5KTkdTdkhhbWR4c2xJ?=
 =?utf-8?B?YUE4akJQanViUGJ3SFEwaC9UYTQyc3dac29sZ3dnS09FRVQ0WE0zVXQ0MytE?=
 =?utf-8?B?TVZFbWZtbWM1d3Q5NFRGTXdNUGVDYStuUTM3bHFZckwxalJGSW9oYXpVeGZn?=
 =?utf-8?B?N0RtMG9Xc0Y5T2RCeVByN2FaT0JqdVZLVmR4M1hNR04vbkIzSXFGejB4Zmth?=
 =?utf-8?B?ajlnNy9QYUZZTVlkZ1RFcDk4ZXVQUU10VDl0N3hIdGhGRXRsVlBUZUMrTCsy?=
 =?utf-8?B?alhWL2VBWUFQWFNNbjVOa0NQOGNkbzdZaFB2SVU3UEZCSlZKYTRsa0xyMHBr?=
 =?utf-8?B?NzFKVXBCc2FmVm9kaG5mVnh2U0RFNkJqYzdOanVpM0NUM2tMbG5udjRvdHR5?=
 =?utf-8?B?UzJBMGVxK0Flc1VnTkZVZGlqV0k3WHFDNTVqV25PS044TlhJUE9WUHVUNnhJ?=
 =?utf-8?B?VTlQSjRoeTlodXlROHVsaEsrdmx4SEx1NVV6c3BsVTlQQ1V4amc4a3pGckY3?=
 =?utf-8?B?WUhTNVhhSFJBR2hhU09Bc2hNY3RmUkVHcGt3Sk5RUDdaVEdvb2xFeUlxeG9C?=
 =?utf-8?B?TzlGb3k3TmJvb3NBY3o0bTR4ZjhLdzZCUVIwS21zL3pFVGVyMnBxMWlVanJL?=
 =?utf-8?B?Y2dicS9iaXNUMk9JMnc4Z0thQW51emdIa0Vta0wvQXJ1dlFSMXB4dnlpeFA0?=
 =?utf-8?B?VVd2K0Y4V3FtN2VZSHBlNElFd1N1S0xXMTNKQllCR1JEVVNXb2dleGpodEpO?=
 =?utf-8?B?U0VXblI4ZHd4QXVyVCsvano5NVFmNzJIblBidk9JMVY5TlpvWHNWc0VNSStt?=
 =?utf-8?B?Mk9rejBHK2gzRkNoNG94eFphSnJrcFZyVktNNnZTTXVNNlhrTHI1SDhDSUgx?=
 =?utf-8?B?VzNJWDhkYVFZc3NaVkhRcUpZM1FGWVNjNjAwTG9BWUxabkdWU3d1d1lZZFJE?=
 =?utf-8?B?S1pISUVLMmM4Q3Nyd3JYL25XSnRGMk1nOUFiNjNLM2FDdUR4T29tVFBvZVl4?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6834fb1f-9c34-4136-b33b-08ddfba6a7a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:12:15.5242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbnlzuhnxMU9QtUJime3dwPQVxTNB2jw75p1QyzgD7yrVRGChe7AibCE0eOxPQDRClow6FLqyXrj5KeBNidIME1fG3MXHlp1amLQj8TyZoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
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



On 9/24/2025 9:39 PM, Matthew Brost wrote:
> On Wed, Sep 24, 2025 at 12:14:28PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/24/2025 3:15 AM, Matthew Brost wrote:
>>> Add xe_gt_sriov_vf_recovery_inprogress helper.
>>>
>>> This helper serves as the singular point to determine whether a VF
>>
>> hmm, this "singular" looks like a GT-level only, not global
>>
> 
> Yes, it is GT scoped. I will adjust the commit message.
> 
>>> post-migration recovery is currently in progress. Expected callers
>>> include the GuC CT layer and the GuC submission layer. Atomically
>>> visable as soon as vCPU are unhalted until VF recovery completes.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 ++++++++
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>>>  drivers/gpu/drm/xe/xe_memirq.c            | 48 ++++++++++++++++++++++-
>>>  drivers/gpu/drm/xe/xe_memirq.h            |  3 ++
>>>  5 files changed, 79 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 016c867e5e2b..c9d0e32e7a15 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -26,6 +26,7 @@
>>>  #include "xe_guc_hxg_helpers.h"
>>>  #include "xe_guc_relay.h"
>>>  #include "xe_lrc.h"
>>> +#include "xe_memirq.h"
>>>  #include "xe_mmio.h"
>>>  #include "xe_sriov.h"
>>>  #include "xe_sriov_vf.h"
>>> @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>>>  	struct xe_device *xe = gt_to_xe(gt);
>>>  
>>>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>>>  
>>>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>>  	/*
>>> @@ -1172,3 +1174,18 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>>>  		   pf_version->major, pf_version->minor);
>>>  }
>>> +
>>> +/**
>>> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>>> + * @gt: the &xe_gt
>>> + *
>>> + * Return: True if VF post migration recovery in progress, False otherwise
>>> + */
>>> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
>>> +{
>>> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>>> +
>>> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
>>
>> this is xe_gt_sriov_vf function, so it is expected to be called only by
>> the VF code, thus we should rather use xe_gt_assert here and the caller
>> is responsible for the IS_SRIOV_VF check
>>
> 
> That is not how I have coded this. I blindly call this in various places
> and I don't think it could at call site to determine if it is a VF as we
> have if (VF) statements all over the driver. If perf is the concern, we
> could move the IS_SRIOV_VF(gt_to_xe(gt)) part of function to static
> inline and reset of the function in an exported function.

inline will work, preferable not in xe_gt_sriov_vf.h ;)

static inline xe_gt_recovery_inprogress(gt)
{
	return IS_SRIOV_VF(xe) && xe_gt_sriov_vf_recovery_inprogress(gt);
}

> 
>>> +		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
>>> +		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 0af1dc769fe0..bb5f8eace19b 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>>>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>  
>>> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>>> +
>>>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index d95857bd789b..7b10b8e1e10e 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
>>>  	} *regs;
>>>  };
>>>  
>>> +/**
>>> + * xe_gt_sriov_vf_migration - VF migration data.
>>> + */
>>> +struct xe_gt_sriov_vf_migration {
>>> +	/** @recovery_inprogress: VF post migration recovery in progress */
>>> +	bool recovery_inprogress;
>>> +};
>>> +
>>>  /**
>>>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>>>   */
>>> @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
>>>  	struct xe_gt_sriov_vf_selfconfig self_config;
>>>  	/** @runtime: runtime data retrieved from the PF. */
>>>  	struct xe_gt_sriov_vf_runtime runtime;
>>> +	/** @migration: migration data for the VF. */
>>> +	struct xe_gt_sriov_vf_migration migration;
>>>  };
>>>  
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>>> index 49c45ec3e83c..94d5d6859aab 100644
>>> --- a/drivers/gpu/drm/xe/xe_memirq.c
>>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
>>> @@ -398,6 +398,23 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>>>  		memirq_set_enable(memirq, true);
>>>  }
>>>  
>>> +static bool memirq_received_noclear(struct xe_memirq *memirq,
>>> +				    struct iosys_map *vector,
>>> +				    u16 offset, const char *name)
>>
>> maybe instead of duplicating code of memirq_received() in 90% just add there
>> the "bool clear" flag?
>>
> 
> Sure.
> 
>>> +{
>>> +	u8 value;
>>> +
>>> +	value = iosys_map_rd(vector, offset, u8);
>>> +	if (value) {
>>> +		if (value != 0xff)
>>> +			memirq_err_ratelimited(memirq,
>>> +					       "Unexpected memirq value %#x from %s at %u\n",
>>> +					       value, name, offset);
>>> +	}
>>> +
>>> +	return value;
>>> +}
>>> +
>>>  static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>>>  			    u16 offset, const char *name)
>>>  {
>>> @@ -434,8 +451,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>>>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>>>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>>>  
>>> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
>>> +	/*
>>> +	 * We must wait to perform the clear operation until after
>>> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
>>> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
>>
>> but the VF recovery "inprogress" shall be already set in the top level
>>
>> 	xe_sriov_vf_start_migration_recovery()
>>
>> even before the GT-level recovery starts, where is this race ?
>>
> 
> If we clear the interrupt it here, this is before the IRQ handler is
> called which flips the software bit for "inprogress". There would be
> window where xe_gt_sriov_vf_recovery_inprogress could return false which
> is problematic.

but who calls that recovery_inprogress() and why should it be problematic?

note there might be still other threads that will finish some actions
(including sending CTB) that will just be stuck there until we start
the recovery, so even if recovery_inprogress() returns false for the
small window that shouldn't change the picture

> 
>>> +	 */
>>> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
>>> +				    name)) {
>>>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
>>
>> what if new MEMIRQ will arrive just here
>>
>> is it ok that we will clear it immediately?
>>
>> the whole memirq flow is that we clear irq byte first and then process
>> it, so if anything comes right after we finish processing will be noticed
>> on next iteration
>>
> 
> I don't see why that matters in this cabuse. In either case multiple IRQs
> could happen and single IRQ handler runs.
> 
>> I assume any races due to double migration shall be handled on the VF2GUC
>> communication level while sending RESFIX_START/DONE, not here
> 
> I don't think it should be possible to get multiple RESFIX_START IRQs

I assume the SW_INT_0 is set on every migration, even in case we didn't
have a chance to read it and clear it, or we didn't start (by sending 
RESFIX_START) nor finish (RESFIX_DONE)

> before DONE is complete. This existing code upstream seems to handle
> these cases, so my series attempts to handle this too, but it seems like
> something that shouldn't be possible.
> 
>>> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
>>> +	}
>>>  }
>>>  
>>>  /**
>>> @@ -460,6 +485,27 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>>>  	}
>>>  }
>>>  
>>> +/**
>>> + * xe_memirq_vf_recovery_irq_pending() - VF recovery IRQ is pending
>>
>> this function isn't really using anything VF specific except that on the
>> VF the SW_INT_0 means "migrated"
>>
>> maybe we can drop the _vf from function name?
>>
> 
> Sure, so 'xe_memirq_recovery_irq_pending'?
> 
> Or 'xe_memirq_sw_int0_irq_pending'?


> 
>> 	xe_memirq_pending_guc(memirq, guc, bit)

I would make it more generic and provide bit param

note that xe_guc_irq_handler() also takes a bit


>>> + * @memirq: the &xe_memirq
>>> + * @guc: the &xe_guc to check for IRQ
>>> + *
>>> + * Return: True if VF recovery IRQ is pending on @guc, False otherwise
>>> + */
>>> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
>>> +				       struct xe_guc *guc)
>>> +{
>>> +	struct xe_gt *gt = guc_to_gt(guc);
>>> +	struct iosys_map map;
>>> +
>>> +	if (xe_gt_is_media_type(gt))
>>> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
>>> +	else
>>> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
>>
>> nit: maybe just calc offset conditionally?
>>
>> 	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
>>
> 
> Sure.
> 
>>> +
>>> +	return iosys_map_rd(&map, ilog2(GUC_INTR_SW_INT_0), u8);
>>
>> as we have helpers we should use them
>>
>> 	return memirq_received_noclear(...)
> 
> Sure.
> 
> Matt
> 
>>
>>> +}
>>> +
>>>  /**
>>>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>>>   * @memirq: the &xe_memirq
>>> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
>>> index 06130650e9d6..476b8cba179d 100644
>>> --- a/drivers/gpu/drm/xe/xe_memirq.h
>>> +++ b/drivers/gpu/drm/xe/xe_memirq.h
>>> @@ -25,4 +25,7 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>>>  
>>>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>>>  
>>> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
>>> +				       struct xe_guc *guc);
>>> +
>>>  #endif
>>

