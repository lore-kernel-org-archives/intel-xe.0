Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836A4CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 15:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4330210EAB3;
	Fri, 24 Oct 2025 15:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhNeXqub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A186510EAB3
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761318020; x=1792854020;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o2JML29cbf+VZNPU44ZFMxRk9q4Dzi6D9KWLsmHsxRc=;
 b=lhNeXqubcIiHs+mBBXluYO6M8iDCNEa1AOdDKhcsETWEHI//CttB8FS+
 6mFa/9cg1WZNbFREjVzZF1GRwh+zUbd6nWBisfNXMKnf6MBV4iv8QstYT
 LuN8SjQFgP8LUnhr7xzrFUALFlW6GZ8vYhdFAY1YMryHPd+vNFRM7EDbJ
 jpLeFKvUCv5ormqv8HrZbLwa9hExRdxJ3PD+V2B041Y0kGc6WQ2L80AZF
 52aoEPLuap5ykSRDMegnLHcHNJdSY8i3VGduiyOOZpoMmf57uecR6tFGp
 10tUo6VYEwZTDxcbVScpCxbKnsllwAnM8w1TKTGUWMZdVBZJIvKjXJehn w==;
X-CSE-ConnectionGUID: 9K3e8dnHRz+6sLikqTb4sQ==
X-CSE-MsgGUID: yQ7yA+gjTV+0gOuhzhvLpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63536764"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63536764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:00:19 -0700
X-CSE-ConnectionGUID: QnrIFM73SgKMyptz/9Iwgw==
X-CSE-MsgGUID: Vld7UUbxSL23uybuVjxztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="184365834"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 08:00:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:00:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 08:00:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 08:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfZCxLgm9A1sOnfuUUsZzVbnKUjx6iCkA27qypxmAUnq1Q80AIa/7w0Az1Cu/rqgXsnvRkVFGuFdRAQi0b5gjncqChAkQWSE44E3P15663j6sPZEl5cWmXABXjBUL0rKJdDCpMBxeYlk1nMOVAwq5wnehejMxPqklvLbTRyQt5ukNF8E9wKgr/bZeWdy50ojaJb4HQ3sbWnqDhUlabqwVT1J7dcdJ7zisgjx+8D2yqMEaT06zSKUDTm4BeLVtJC0sEJGJGjjPYKvT27qQ3HxqkvEtMry0YK2ELreC9IihY/lVRIG+ujaGFVmnTXNkhJ4/E2Y1bAWwE7PFDbyV7/uiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3sPhsitHiLlw70OUr8G7XtpBjEcANEAKt3Pb8U5g3c=;
 b=bIx6DbJReeZGTRZ/kuEgweMV/ZPpqw3SRXdTY81YQaUQQJe4kNii1GKTmNTcBhOnOupTZe2Be6AtEKz+82/ErcxeDWSDQ43AhI6QV0mLiG8qEJ0NyKna0hYXaDpIgjudWzM7lcpFxzLTKUHUdi/CQvpv2rjg0ar24HDxowOO+HbtUtpNXoDux1s5nLryfkcbkdoqByP/x6VKEzcUKn5s+Z32scc51YjzQys3GlhYEibFreHYuRnK/0orB5OAjaA8nddICAcxc315OGUhzE6E8wpM1/W1TstqS7oa5KDqmkolL600YAaYmSpuxVVpxsjFKtnHO0gIBPMr9ipfm6WCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8896.namprd11.prod.outlook.com (2603:10b6:208:57d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:00:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:00:09 +0000
Date: Fri, 24 Oct 2025 08:00:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: share USM BCS engine via root-tile helper
Message-ID: <aPuUd/NwtfvIVo1g@lstrano-desk.jf.intel.com>
References: <20251017122253.149187-1-nitin.r.gote@intel.com>
 <aPJ+JszqVdAOSvtf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPJ+JszqVdAOSvtf@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:303:8c::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c55ff8d-deff-42be-bb1a-08de130e0691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVdQNi95VUJ1ZGFaZExJamxPZmMvYUpicHc1S1hDSkExSnNyY0hyK3doZHFG?=
 =?utf-8?B?ZnVxcFpzUGo0cWl5b3E3TjVUMlZkdktwbVZ6SWVEQ2l2ZGZEMkZzRi8xL05Q?=
 =?utf-8?B?S0VJRFVJdXl0THR4cTJHSUlPZ3lVRHBzMGcrZlRBTmpzQ2p2TEIxbGt2b0hh?=
 =?utf-8?B?L1NwQjhwdnEyanlMcDhWZmo0WTNHTm1UWU5UZmpZOG9Uc0xlSm9KMUo4Ymli?=
 =?utf-8?B?aTM0ZWlNRjBtNFRNM2Z4SjlheWl6R1U1b0pwOWhIZi9MVFU1MGNXN1JoclJa?=
 =?utf-8?B?QkRCdTUvNzBudm5hUDRtKzlrdStFSkRvRjgrYXZnU1RmVHl0QlFOV3FTRlZI?=
 =?utf-8?B?UzBRbUhtT2xJZFE0QnM2c0JocEdhdjdTOG9yZHpNTGxPZW9yVEp4WVdqeHEr?=
 =?utf-8?B?MlpwSzgwZ01PcVJUNm1sTnVUUjhFK0VqTEpkM2V3d21HMEUyTUNxdVJMUmxa?=
 =?utf-8?B?VzNNc2hrVW1hWDJJQkNuSytFdU5hSTVsL1BVZWVVakNIOC85UnNCRkJxa296?=
 =?utf-8?B?a2VIdm9vUjZ2RnNjRzV2VXhMVlRvWEtDZVpMcHRIRDdYRi9iMlBzWDdib0FJ?=
 =?utf-8?B?eXA1K1cyYnpQRkpTZ2Q3d05aOUs3T3hkd0daN3RCSVhFOTh0TkJQZzlKWEt0?=
 =?utf-8?B?clg4ZnEyRlRXaVhiei9KV01oTXJndzlUUjhaMkx4UjRjamJGcENVc2syYXBy?=
 =?utf-8?B?Z2pUL1ZrTngycjVNc3gzclZFejFoKyt3R2VxbVNBZm1rUnFIc2ZGVmF5NWsx?=
 =?utf-8?B?SkpUMUZIVC9DWjJzNGZTRWV6alp6ZU9IR3pUbUpIUElMVmIyLzBadGlRR05O?=
 =?utf-8?B?QkZZdkpVbmdUZDk1YzNtbVY4TU1MbU9MSHhLendZQ3JqS1hnbHZsZURGZ212?=
 =?utf-8?B?azBkam5MTXo1VGpCeHlhY2pWRW9wS2FlRDBnRHJ0Z052OFI2UnFLOUJySHhn?=
 =?utf-8?B?bldsTVh3YWsweFRpVGRqZ3YrQTVZQkFvYTl0ZFFoWUlVeWRxL1M5OEJlUGxC?=
 =?utf-8?B?clZNb3ZlNmtWb0FqWFVUZ3NxZ04ydFRLRHRTTHQwT0FsdWZrUXZpV3dlM2R6?=
 =?utf-8?B?R0dKdWFXeHFzS0hHTVQ3aDVsN2NKZTgzc2FsWjU1amkrREZJVm92MmlDeEpn?=
 =?utf-8?B?cXZKQ0dUVnZrS0RNbXlXNGpnV2JDcjRUSzJLcGx1KzRub0Vwc0FjK3BKZm16?=
 =?utf-8?B?T0lkVmc2YW1ZRkRKMmNKTGxRdFFOcjZNMnljcXJjZEVhSFF5S0xHMncwaHZw?=
 =?utf-8?B?RzlwNFVsWlB3alpxRExEWlgveXgrUlNMdmIrZ3drUkRxcEpwT3ZjREgyeU53?=
 =?utf-8?B?b2E0SHRVZDlveXMvR1RqN3ROY1VxN2lGVEdhN1FhdmtLUWdPeksyTHNTNndt?=
 =?utf-8?B?MXk5bjRrZ2hXVlVncjJDNFVjWklXdjc5V2JEeGw1aFYyQ2trNm02SmFad3FF?=
 =?utf-8?B?SGpjMVdiU3dlcG1wVDRKdHZvSG9HYStnVGNnOUdTem16WFpreG5wa0pwcXVN?=
 =?utf-8?B?UlpJU1VVL3BvNmJyeTRyYUNHTEZZU2hZaENZWmwzdU1iNjhwa1JINU40Q1g4?=
 =?utf-8?B?ei80aWZhVTBKb1BmVDE3VE43cGE2NWdueEpEMmtzMkh2cmFSQ1daVmVmck4r?=
 =?utf-8?B?MUdaNVJqcGM5NTl6dlFnWlhkNFdMZnNMS0hIeEJ4OFNSV085Mjl0ZHdxNjda?=
 =?utf-8?B?QlNOSFU2UVU2Ujh1bU9KY1B2RUJxVkVmQWF6RFBrRVFiOXorY0pVOVJiZHZI?=
 =?utf-8?B?WU1Db2JOZTZKQnBGRERqa1Rqc05tWTBrK1piU0ZJUFhaM2U1cTliaGVNVllN?=
 =?utf-8?B?SHR2WlhTR2ZoMnk5T3RDN3NTWnJUQTFkRnpmSEpnUTR3empkME8zbEhLL0Zj?=
 =?utf-8?B?TzN3YkQyQ3JmS0xNZGh3MndvWFVHUHhsOGtEZm1KZEdVeTJpQjl5a0ZIS0o4?=
 =?utf-8?Q?FxK3U33xXr/dniLU+uWrZ3pnFL0NN3kJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhaODFDUFVaYzRJWjd4ck9mZmNTcU5tSnk5YmE4LytkVWVXcXhDaFdWZnE0?=
 =?utf-8?B?YkFoTGhTK1VXemVMelJMR1hJSEUvRHc1TFFYNTBKWEZ1WVllNHM5NzE3Tk5Z?=
 =?utf-8?B?Q0o5OGJ1OERVbEtMUFR3ZkhobjBXbDNsb20zbkVYUVF5bU13bkV1empYdDBp?=
 =?utf-8?B?a08vcFNJWVVlV1ExZjdKN1J1N1pTTnBJY1FRQUhKZUFKeGdvbzh2VFJ4TzlT?=
 =?utf-8?B?Qmp4dWgvUStqZHNBTjVIRU0zSlgxSStpckwwVUMweVUxbjd3QVVVaFNxcWlV?=
 =?utf-8?B?cTdUdlZYMlMxL3Jacnp2Tyt5UzM0OGNEYzRDMGdTZWtsckFaeDRzNUVZWm1r?=
 =?utf-8?B?TjJLVlVHbkZGSy93RDd2SmlwQk5SbmttUTZZeE5ueDBnRXh0L0trNElLMms0?=
 =?utf-8?B?UEwyOUtFc2lIb3U4TUFJenlUR2xsUlp2WHhpeTYrTURzS3BJSFRwclljS0FK?=
 =?utf-8?B?MTNFL0VTZUNSazgralpDUFU3SjQ2d1d4M29VNUEwVTlxYXU0NHpyRXQxalR4?=
 =?utf-8?B?Z25NVkliTXk1b3EzL2dYa1VBVnJRVldSMVk0RzRJMHZYTHJaVWxHNm00bm5a?=
 =?utf-8?B?Z1NINGFOdjF5NWExM05ZU1ZJSjN2OHZYYjI0bUZ3czJ5UmxrMkVrZHhGdG9r?=
 =?utf-8?B?YU5TajlUSjlpKzg1N05icUxDMlhXRnArdFlhU2dMU1FOSjIyOUFHRHpzbzlY?=
 =?utf-8?B?UER0bjZRS2diMXhMY1JnbzBCT09rSjFQak5hZy9nZGpocW5sVzV4NTh6UnU1?=
 =?utf-8?B?Rm1qY1JHNXJXMTZFcVpJbFBTU0VTSEhFOVF2TGJ4STY4aUc4L2ZYWTY0eklK?=
 =?utf-8?B?ZmJvdkRoNVAwcFV0cUkwYlFzODRMWEJRenFVWThTSjE2RTVvR3BIeG5zaVZ4?=
 =?utf-8?B?cTA3V2lBRGVVVEpuYlNSUmhLbHUrL3I2QjFDM3ZlL1gxSVFsTDA3dVBpSlFq?=
 =?utf-8?B?UHpPKzFqSG94eEZ6bXlSczkrT3JOT25QdEVHUU9PWU5HaUhPUktRUkE2N3pT?=
 =?utf-8?B?WUxtSTJBNHZqa1YvelBBR3N2YnE2OXZPRkdGaFlvOWhWbjJ6Z2djcFNLSE5k?=
 =?utf-8?B?TCtOMDJSb3ZDalkwVFAvYUVneGVjbytmS1RsN0dPWVc2Zkl3emxuN0RRUmRn?=
 =?utf-8?B?WTNuMDlKRjNVQjJKRWgrT0wybUlzM1g1VDdvcW53YllMM1NkdHAwUlRqYlhZ?=
 =?utf-8?B?eklnamp3OEYwbFNQOFdmak9wYjNST1lwQitLMDJVcmIxMjVLUmtWMjJycU1M?=
 =?utf-8?B?T0VCcXdtbWkrMi9xQVVuUzh0OHQ2RXpJb2RDMjlWdzRtZGFRRG9scG0wSzhJ?=
 =?utf-8?B?eDBFRHVuYlRVYTNlcWdhSXo3aFplWkRqdi9IQVNkVDA3dlVGanBpczJ0RVU3?=
 =?utf-8?B?RkFBbHFiTHBBaTVRVzkwR01nTDhFWGhmU3hRQnJIbXFSS0k2Q3NWZ3pUOFBG?=
 =?utf-8?B?TXFoQWprYVRZd0tDVXIxODROVHR4N1FxUitBNkkrcTV0c054bnlraGtnUjI0?=
 =?utf-8?B?dW56QXdEMFdjblp0VHZhZWViS3hKWnJ6M2V6SnNJaysvZDg5a3FKWnppekE0?=
 =?utf-8?B?S2VtekpSclk1MVF6N0xvQ2lFbmZTalpYVUVtVmhPWTFtRUhkd2Nmc3RGLzcw?=
 =?utf-8?B?Y0owOFJpcCs3czFFWmREU0xsTTdYNXdDTHB4aE1vMTRVZm9CbnpkOVhmaGI5?=
 =?utf-8?B?YlhmSjBtY213L0tRRUtab094NTBEMVRjNlp1cTFiQTJLYUxKaU8zeCtDYTVM?=
 =?utf-8?B?NlliK2cwUzNZSlpBeFREY3NMNFN1UXdmbmI1dWkxYmJCbUZ1TmlxcUdJaUN5?=
 =?utf-8?B?elpUMXdzT3BiTjJrTWlhQ3FJT0w4R25OUEdKN2ZveUNUMVh4czQyY2ZIK0dH?=
 =?utf-8?B?TU1CMmcwQ05ZQ292bmYvT2VBdlhQdmxjMVBiamhuMVk5QitWdGQvMWcwZHhw?=
 =?utf-8?B?aFArOHgxSkZseG0yRHdXY0tobDd6RzNKK3haVFlIeWp2NUR1V1VmRzJsb3h1?=
 =?utf-8?B?ZTU3VksrdFJJN3Y0dkRKd0ZLb3ZDakdyY1dzVEQzSUlLOUk2QTV0UyszWXE3?=
 =?utf-8?B?TEVOMXZFaVZkR0paeWlpL2syWVkyRzlBZDBiMmpIeUE4SklTUWswZEJTYzVz?=
 =?utf-8?B?VnNweisxdW01NE5NTFVxVFNvcFpvdjBiYzc0UWM4dktmYXYxTjRDbnZsYmFV?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c55ff8d-deff-42be-bb1a-08de130e0691
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:00:09.6220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njgM3p7ZySiU5tY9QPXm8y8c9C2j395N5HTXi3s30d5gZXbM+klufQl6PBKC4oTI277Wfl4TawWbkcblAFRv1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8896
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

On Fri, Oct 17, 2025 at 10:34:30AM -0700, Matthew Brost wrote:
> On Fri, Oct 17, 2025 at 05:52:53PM +0530, Nitin Gote wrote:
> > Introduce optional root‑tile USM BCS engine sharing controlled
> > by the device descriptor flag (info.use_root_usm_bcs) and a
> > debug module parameter(force_use_root_usm_bcs). Each GT records
> > its USM BCS instance and hw engine during hw_engine_init.
> > 
> > Add helper xe_usm_bcs_reserved_hwe() which, when sharing is
> > enabled, returns the root tile’s USM BCS engine; otherwise
> > it returns the local GT’s engine. Exec queue and migrate
> > initialization now use this helper, avoiding failed
> > instance lookups on tiles lacking lower-numbered BCS engines.
> > 
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> >  drivers/gpu/drm/xe/xe_exec_queue.c   | 12 ++++++++----
> >  drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt.h           |  1 +
> >  drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
> >  drivers/gpu/drm/xe/xe_hw_engine.c    |  7 +++++--
> >  drivers/gpu/drm/xe/xe_migrate.c      | 13 +++++++++----
> >  drivers/gpu/drm/xe/xe_module.c       |  4 ++++
> >  drivers/gpu/drm/xe/xe_module.h       |  1 +
> >  drivers/gpu/drm/xe/xe_pci.c          |  1 +
> >  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> >  11 files changed, 61 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 02c04ad7296e..8f3ea6c637b3 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -336,6 +336,8 @@ struct xe_device {
> >  		u8 skip_pcode:1;
> >  		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> >  		u8 needs_shared_vf_gt_wq:1;
> > +		/** @info.use_root_usm_bcs: share single USM BCS from root tile */
> > +		u8 use_root_usm_bcs:1;
> >  	} info;
> >  
> >  	/** @wa_active: keep track of active workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 90cbc95f8e2e..06c5585b01fc 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -348,10 +348,14 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> >  
> >  	migrate_vm = xe_migrate_get_vm(tile->migrate);
> >  	if (xe->info.has_usm) {
> > -		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
> > -							   XE_ENGINE_CLASS_COPY,
> > -							   gt->usm.reserved_bcs_instance,
> > -							   false);
> > +		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(gt);
> 
> Can we just call single function here which figures out the HWE?
> 
> > +
> > +		if (!hwe) {
> > +			hwe = xe_gt_hw_engine(gt,
> > +					      XE_ENGINE_CLASS_COPY,
> > +					      gt->usm.reserved_bcs_instance,
> > +					      false);
> > +		}
> >  
> >  		if (!hwe) {
> >  			xe_vm_put(migrate_vm);
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index d8e94fb8b9bd..b84a2c38c4aa 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -49,6 +49,7 @@
> >  #include "xe_map.h"
> >  #include "xe_migrate.h"
> >  #include "xe_mmio.h"
> > +#include "xe_module.h"
> >  #include "xe_pat.h"
> >  #include "xe_pm.h"
> >  #include "xe_mocs.h"
> > @@ -519,6 +520,32 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
> >  	return err;
> >  }
> >  
> > +/**
> > + * xe_usm_bcs_reserved_hwe - select USM BCS engine for a GT
> > + * @gt: GT whose USM BCS engine is requested
> > + *
> > + * If root-tile sharing (info.use_root_usm_bcs or force_use_root_usm_bcs)
> > + * is enabled, returns the root tile's reserved USM BCS COPY engine pointer.
> > + * Otherwise returns this GT's own reserved USM BCS engine.
> > + *
> > + * Returns:
> > + * Pointer to xe_hw_engine or NULL if USM unsupported or engine not ready.
> > + */
> > +struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	if (xe->info.use_root_usm_bcs ||
> > +	    xe_modparam.force_use_root_usm_bcs) {
> 
> Don't check xe_modparam inline, rather on device probe override
> xe->info.use_root_usm_bcs with the modparam.
> 
> > +		struct xe_tile *root = xe_device_get_root_tile(xe);
> > +
> > +		if (root && root->primary_gt && root->primary_gt->usm.reserved_bcs_hwe)
> > +			return root->primary_gt->usm.reserved_bcs_hwe;
> > +	}
> > +
> > +	return gt->usm.reserved_bcs_hwe;
> > +}
> > +
> >  static int gt_init_with_all_forcewake(struct xe_gt *gt)
> >  {
> >  	unsigned int fw_ref;
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 5df2ffe3ff83..2a896ef28fa0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -54,6 +54,7 @@ int xe_gt_resume(struct xe_gt *gt);
> >  void xe_gt_reset_async(struct xe_gt *gt);
> >  void xe_gt_sanitize(struct xe_gt *gt);
> >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > +struct xe_hw_engine *xe_usm_bcs_reserved_hwe(struct xe_gt *gt);
> >  
> >  /**
> >   * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 8b5f604d7883..3aca91686e0c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -212,6 +212,8 @@ struct xe_gt {
> >  		 * operations (e.g. migrations, fixing page tables)
> >  		 */
> >  		u16 reserved_bcs_instance;
> > +		/** @usm.reserved_bcs_hwe: reserved BCS hardware engine used for USM */
> > +		struct xe_hw_engine *reserved_bcs_hwe;
> 
> I don't think you need this storage. On GTs which don't reserve BCS
> instance reserved_bcs_instance would just be clear.
> 
> >  		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> >  		struct workqueue_struct *pf_wq;
> >  		/** @usm.acc_wq: access counter work queue, unbound, high priority */
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index cba4375525c7..175407ae3ad8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -35,6 +35,7 @@
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> >  #include "xe_mmio.h"
> > +#include "xe_module.h"
> >  #include "xe_reg_sr.h"
> >  #include "xe_reg_whitelist.h"
> >  #include "xe_rtp.h"
> > @@ -633,9 +634,11 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
> >  			xe_hw_engine_enable_ring(hwe);
> >  	}
> >  
> > -	/* We reserve the highest BCS instance for USM */
> > -	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
> > +	/* Record BCS instance for USM; keep highest instance seen */
> > +	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY) {
> >  		gt->usm.reserved_bcs_instance = hwe->instance;
> > +		gt->usm.reserved_bcs_hwe = hwe;
> > +	}
> >  
> >  	/* Ensure IDLEDLY is lower than MAXCNT */
> >  	adjust_idledly(hwe);
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 3112c966c67d..e96fcfb13e24 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -450,10 +450,15 @@ int xe_migrate_init(struct xe_migrate *m)
> >  		goto err_out;
> >  
> >  	if (xe->info.has_usm) {
> > -		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> > -							   XE_ENGINE_CLASS_COPY,
> > -							   primary_gt->usm.reserved_bcs_instance,
> > -							   false);
> > +		struct xe_hw_engine *hwe = xe_usm_bcs_reserved_hwe(primary_gt);
> > +
> > +		if (!hwe) {
> > +			hwe = xe_gt_hw_engine(primary_gt,
> > +					      XE_ENGINE_CLASS_COPY,
> > +					      primary_gt->usm.reserved_bcs_instance,
> > +					      false);
> > +		}
> > +
> 
> Here, we'd still create a xe_migrate instance per tile but each migrate
> instance would point to the same HWE but be different queues. Different
> queues means we will be context switching on the HWE and context
> switches are quite expensive. I think what we want to do is if
> use_root_usm_bcs is set, point all tiles the same xe_migrate instance.
> 

This is more complex than I initially thought—we’ll need a broader
structure and a rework of the bind pipeline. Currently, each bind queue
is tied to a single tile, with two TLB invalidation job queues (one per
GT on the tile) attached. If a single bind queue targets multiple tiles,
it must now issue invalidations on remote tiles as well.

We also need to decide whether we still want multiple instances of PPGTT
mirrored across tiles. A broader architectural discussion may be
necessary to clarify what we’re aiming to support and determine the best
path forward.

Matt

> Matt
> 
> >  		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> >  
> >  		if (!hwe || !logical_mask) {
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index d08338fc3bc1..9c3104c36897 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -80,6 +80,10 @@ MODULE_PARM_DESC(force_probe,
> >  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details "
> >  		 "[default=" DEFAULT_FORCE_PROBE "])");
> >  
> > +module_param_named(force_use_root_usm_bcs, xe_modparam.force_use_root_usm_bcs, bool, 0400);
> > +MODULE_PARM_DESC(force_use_root_usm_bcs,
> > +		 "Force all tiles to share USM BCS from root tile (default: false, debug only)");
> > +
> >  #ifdef CONFIG_PCI_IOV
> >  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> >  MODULE_PARM_DESC(max_vfs,
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 5a3bfea8b7b4..61332b0ecc18 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -23,6 +23,7 @@ struct xe_modparam {
> >  #endif
> >  	int wedged_mode;
> >  	u32 svm_notifier_size;
> > +	bool force_use_root_usm_bcs;
> >  };
> >  
> >  extern struct xe_modparam xe_modparam;
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 24a38904bb50..c7dffb21b18d 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -638,6 +638,7 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	xe->info.skip_pcode = desc->skip_pcode;
> >  	xe->info.needs_scratch = desc->needs_scratch;
> >  	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > +	xe->info.use_root_usm_bcs = desc->use_root_usm_bcs;
> >  
> >  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >  				 xe_modparam.probe_display &&
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index a4451bdc79fb..cbbb338ee580 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -53,6 +53,7 @@ struct xe_device_desc {
> >  	u8 skip_mtcfg:1;
> >  	u8 skip_pcode:1;
> >  	u8 needs_shared_vf_gt_wq:1;
> > +	u8 use_root_usm_bcs:1;
> >  };
> >  
> >  struct xe_graphics_desc {
> > -- 
> > 2.25.1
> > 
