Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3346BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85410E231;
	Wed, 30 Jul 2025 20:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebMtlAte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DDB10E231
 for <Intel-Xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753906065; x=1785442065;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XeUmYMzo0oIEA5uwVXJRJwIiVLJvUx+0m3/2zz790k4=;
 b=ebMtlAtejpf7lnHzrngnsOkZeEfvzvwMalD5bBtP/L3Oth12gRJTpwUj
 I7GIReX9QhxZg5dY0MxhQeCcPyVO05m207lBSIOXe46gpGiTneZ3f9rFL
 8DhdKxtgsSkcFJlPoH//CThEuSR6ahJkzK/6QJG9WYmWn6/wof/GDH+zt
 d561IH8/Xv0oa6S+lixwFpoBRpFJ1T4i9zjBK9F8Q5aTRnkpxwEPxmA+Z
 RVAmDLrTW7Cw+Tbsz15okLa2eyu6h0V+0vGW5kghrGTlJp2yReLxwDAjs
 ty48pdo1WcX5GGIkQ5Ya70N9vJUlUTDo7/+IHabQxiSWC8lyz8b5E6TzN g==;
X-CSE-ConnectionGUID: v6T+CTJ9SAq3goK6Yi5Qlg==
X-CSE-MsgGUID: f+gKs7VXQcmO+fPqqzffsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67580526"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67580526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:07:29 -0700
X-CSE-ConnectionGUID: nkOW5H8pRNqicJXJvbT66A==
X-CSE-MsgGUID: A7u4jKGRRDadQ9kkufLGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186770714"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:07:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:07:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:07:28 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZHrkOTkLMVPoeIDbNKHjBn26Znuxn69OAYEMyq+cK5k2Pg3hTl7ueDkpSgbNDFtqVdpVu3Lu05tFfN7E8ryPdUwFGyulQ9t1g4X7DI70si1aaZWrmqkQqke2SafbWY98naL1F6m3KSpHOsE5hTsDbRYK4x0c/U/WR7goYsmX/ucs/dJdnzFKlKbcRMXVmpgZkVoSG7vBbePkdsxZT04bbTtJ3g5P+804OJQ4LEt+FTZbBE2/as/V2fBuaqTZyXN2XKgfjVPJuXoy2I38j3Idm729Ynm8rgWb2hKjrKFkopSY1IYrRJBt43WsWOjmBFS3FPY5FkehRnCMDbhmsOucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oIiD/O9boHwl38PSpq7N8btzVtNpt2ZCnw7wPQo+vI=;
 b=YX8HHm/yRpKJBIiaPEU8L/1HIH1ZFobx/LszzjL+KU3+mY8BKjNqvb0V1RzvNjgupxjuoxHvvdCOjKWxHtn2h1d3z5c5Y2bY8NlxpKWujeh+etUdJc208BJvvWy76ygo1odH10UNzmhg8cKqXkwxopBLmxFyhkF5zztpeT/l70e4XjxlIgeB0kAJ3WinPdlhy0WsfmTVA6ULBximgFugzs/sie8ysm2PKcOXedDaTZ9TtJcv9iOUj4MaBO7SHclGMAvu9CX1m+mCfJf+dQcskROYmRMTtVd0k0upCm9uU10ri5EnOePsmbTWdkZTK/yU+7hVK56Azd/N786UF1GZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA3PR11MB8894.namprd11.prod.outlook.com (2603:10b6:208:574::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Wed, 30 Jul
 2025 20:06:58 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 20:06:58 +0000
Message-ID: <a2b6b0c3-d31a-46d0-8aab-fcc5a78159b5@intel.com>
Date: Wed, 30 Jul 2025 13:06:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/guc: Add firmware build type to available info
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-3-John.C.Harrison@Intel.com>
 <90ee2b17-5744-4e7e-88e2-d715946b056f@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <90ee2b17-5744-4e7e-88e2-d715946b056f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0274.namprd04.prod.outlook.com
 (2603:10b6:303:89::9) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA3PR11MB8894:EE_
X-MS-Office365-Filtering-Correlation-Id: f79aeb8f-807b-4c8f-3f4e-08ddcfa4a39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk5LTkdTYVhxdTJiUHptN1A5aXA0RG16SE9rOXNsTkp3aU5yZko5WmI0VDJT?=
 =?utf-8?B?UVlYTTZCZWIrODd0MklaM3p2NlBpekJVazNoRms1Y0txRkNFb1VsbWdnTmVV?=
 =?utf-8?B?eFA1TXJqcHlGUk03L25uNERKdVZIZENMU1V0cExVN3o3NERqL1dlMjNHNklN?=
 =?utf-8?B?SmxlUmxoL05HK0ZVdlYyYTZxanRoTXVrTGo4UVNiK0JSYzRYTUtXWUd1YnNm?=
 =?utf-8?B?OGJaanI4S2hoSVNnL0xsTkJPblo0Nlo0bmFGekFKWElCWFAwSEFJcnZ6YndJ?=
 =?utf-8?B?MFdZcUluOHByQUJhNGMydW42bGFpWFc5RG1Wamw0YjhpK2dreXZMZStjTmNP?=
 =?utf-8?B?MUhIdWhxdGEzeXJKbk9UQldrb3NrUjB3amJ3YnhzdnVubUE5bkZFc3o0c1Uz?=
 =?utf-8?B?cHUyODR0V2s5bEFFUkp0aUhRS0lodkJ2Rkk0cnlxMkExSGtCM3VEemU3MlJ6?=
 =?utf-8?B?aG45S2FQTmU0VUdqRXdZRTRsQ05na09hNWNtc0tKclZZSHdFUHJtbEhIR2cy?=
 =?utf-8?B?TElsZ1hFZ0FqSHlZT3hsbFNGWVF3cDJuYnJxc0JqN1N4L3pwMWEwVjRjY1VR?=
 =?utf-8?B?dHVYZk5ETktxVkZneG1IV09YUlRhWHZSOU10c1h3SmxPWUk2V2JENDNmSCtm?=
 =?utf-8?B?Y0hteTVJME1WYjFyYVgzMlo3VFovanQzdnQ4TW1Qb3ZyN2Z3a05SWjZSRzNV?=
 =?utf-8?B?TkN6YXNoSlluNFcyQVNIQUxac3JJbUs4UGhGV3UvZDk2V0xVcFp5d1MwOGVy?=
 =?utf-8?B?akZDdkkrTFRnaG9VR1RpazRFR3RNMXZlK0JlNUlZTURjRWV1Tm5XNXYwLzhU?=
 =?utf-8?B?RlhQMC9jdS9iUnBMd0F3clRjSE1EdzhDTGdYaTNoRGw3dE10LzIyMFZaQVIr?=
 =?utf-8?B?TVBxMGs3Um1lSXRRTE1ML3VtZzdtNlhzS0hsejgyc1Z1MnZQZXRNU1RBTzlL?=
 =?utf-8?B?Zk5SbnNxQmxaRitLSHFidHFCVTJZZjIvc1h2S2pHUDZXUFVsSlg4OXVaR1E1?=
 =?utf-8?B?SUtDcmdEdzQ5TVBxL1NZQmFVWWc2Y1BYSGdEN255TWtxWlREVGFJZXA2QW1a?=
 =?utf-8?B?RHEyVFhrZFE0YllqQ0FFWnNUQlV6My9FK1ZlTWVmS1V5dHFzZnAwbEJQaTVI?=
 =?utf-8?B?VkEwWUlZMVZRMmtjNHFnbWF5OVFVZGtMejJFdk5SZ2lzbXlDNVgrckxKRmds?=
 =?utf-8?B?aXNWc3FTekhYVVNRR2NaWGJvVTFpdUg1T0gzM1IrczQvTVBDOXM5UTVOYWc5?=
 =?utf-8?B?UktLQlc0TjJ4OHZxd0NGTnRqOTkxTlFrU0JhSDhTYW53TEQxMmdCWG9Oa0xZ?=
 =?utf-8?B?TjJmQys1UUJuMDlqQkNkdzRtMmVCYjdoWStISFJJWnhyb2p2TUM0bzh5TXJ2?=
 =?utf-8?B?Z2MyTlpwS2o1MXpGL0pBeGFCSFZLY1FGZFBEN3lIaFcyVmgwSzhMcG1LanFh?=
 =?utf-8?B?T2srZkVYS2tFT0tLWk1Cc0JHV0JBM21tT0xDMjlTSXRUT01jZmVvcHFBenl2?=
 =?utf-8?B?V0RVNE8vdXBXeUZDUUsvbTNjemJXWjNVQXlhYkFHMm1zeDFOWWtYWHpUUGw5?=
 =?utf-8?B?VEtsZGJ6aXpCbzFyVjNsRzAxOHNDNEszcGpnQ2NhQ3krY2ZLdHo4aUdxalIy?=
 =?utf-8?B?eUpOU1JDV2FCUTJJcjNYMzJ5dFdlQ0Y3RDREMUs2SHZjZHdiVk9kejdsN0hs?=
 =?utf-8?B?WHh1ZndQakhsNmRYZnNXTVpONExML2NlYi9KRmh5TTg4VFRwM2FoYVdWV2Vr?=
 =?utf-8?B?cEswZ2pKVlY4dVBNeHRJK0gwall1UlB2WVdFVUJRak5FbW42WUVxT1RMRVRj?=
 =?utf-8?B?Q0hKb3JTSkpzeHBPM0x2cHlEVzVhOEhXQlBZUEUrUmpMQW1OU2pCWURKUytD?=
 =?utf-8?B?cUpGNnovK28xTFZzV2l2Ri9OeWk5eGVzOHIzL0NJRVF4ZEFTQlFmbkhtVUd1?=
 =?utf-8?Q?y9o4oOWF9Bw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5DaXpGcUNmd1pWUklWcGRJVk0xalJiQUt6MmFGWTlxYnF0eC9UdU8xRVRk?=
 =?utf-8?B?bUhCQmhnTytMNDBEWVMwclRob3ZnbzNxVnV1NTRJWXhjbUxzVEk0c21meW1D?=
 =?utf-8?B?UWRyNDRYUDBBOWZrQ3FLUTZRUlNlRWZmZ214cHNBbFZ1Mm9KeG9DbUlKVVQz?=
 =?utf-8?B?aEtHZEZSSzg1QUhEb01HN3hOV1FPdTdZUlRUaDZNUkQ5S0tzS0U2eEp5aG4r?=
 =?utf-8?B?WHZpdlpIb2xvUjFQYkxoOGk5TnllS2ZlSUVHVURWUlpZZDdGRzFNNnhrOU45?=
 =?utf-8?B?VndNcGd3Vit0czNPbDZWbWVDTGt5N2M3MUdyVzBUWnRFMGdQdVoraVcrckRo?=
 =?utf-8?B?K3NmTzUvczU3YVBYdHZJNllFcCsxVDJKNHY3YzlHQ2Y4aE55KzFEaFFSM1ND?=
 =?utf-8?B?NUI1Y0FVU0Z4eWkxejFTTW9nbDdObTVQWDM3YlkwaTIxVXN5UFYxTDBLTEV1?=
 =?utf-8?B?RFd5VFd3NHkwNHFodjFISGg3VnZ6R3QzV1RTbnF6L3cvbzhkSWVvOFVwNURk?=
 =?utf-8?B?L2pvalhjbkxidmswcWlVeDZ2MStoSUJsa2xMR0pYNkkyc28vZ0xuOU5MWHJZ?=
 =?utf-8?B?TWZ5UG40cXVzcUozQkhSelZMSkx4dFYxaFl0cjVDMzN0OThVbnpTdSsrbldj?=
 =?utf-8?B?Q1h3RERVQS9zcHJ1aWxyOHhQNGNRSWprQXR1VGtZSk1kMi9FNDR6TllMWG5G?=
 =?utf-8?B?MSt2Q0J1QTB2bFM1Q1pYM0l4YTZxc21Qb042UWhDWHBoNFk1TnIxenhGbGti?=
 =?utf-8?B?UG93a0l6R3E2MTZZU2NCRW0rdFVOZGFqZmlxd1FtVEJsMXBVQ0VVU1ZVMkw1?=
 =?utf-8?B?WVRqeGpYYWV1bU9CTFFrWjEyanhXSjFYc1hkWXQzQko3WWFQaHI3WHM5U2dK?=
 =?utf-8?B?bUZEUVZUdzdPbEMrVWY2ZFNrcHE5M3AwRlVxNFJaWXpIM2p4bzNTdzNwVjN2?=
 =?utf-8?B?UFRqYWoxeURud1psRkhBanY5VlF3SVpJMFRvVmUwTngyVWw3MzJOTWVmcXdL?=
 =?utf-8?B?cU1YeVpRazl1YWdxYThqQ21oVEt1dFRDUmN6aVJPVy9weHZkcEdhamtvVUhB?=
 =?utf-8?B?YTgvem9uNVdVUFR0U1hUQUNvSUlhd1poWGhDOFRhRlVpWDNhUWtqYStqc1Av?=
 =?utf-8?B?WVhXNmhEVng4WTdpVW9UbFpDZTYyM1lDZm1oQ3BMYlgrZ1I5eGhYY3ZBWnRN?=
 =?utf-8?B?OFlvYityc0VmK1pFcm1UbkVLRWRwZjduUEc1bGhIUGRMc1d0Rlhoc1VGcVhE?=
 =?utf-8?B?a0FEM1U1a0RHaXEzY2xOVytWY3pEeVNJV3c4anRoTFFWWGdqaVBBbW93TUFn?=
 =?utf-8?B?ejdxeHA1K0RTYmc0WnBSZHhEd0EzVDBLM3k3RmJCMGV5bkg3c2Y0cU9aN3JN?=
 =?utf-8?B?Z05CZXVBRWJKQlhRdTM2VEtQbG9nRjYrTVVJcitTTDdEOTBQZFpXVmtlejNI?=
 =?utf-8?B?MGZHem5vWFdUZXVVbk9aTGY2MDM0cC83MTAwQmlJK1ZseGJuMGdRc1Y4Nk96?=
 =?utf-8?B?T2l5SmtyY2NoTUtoUGRLdXZVYUhycjVwbEZSTmpTWERyclRQK3p6RjdTdU00?=
 =?utf-8?B?TVVLL3o1eE4wNk8vZm9wSEloU2xUQjZtOGY5NGlWUDNYZFZuck9VeG9IRVdF?=
 =?utf-8?B?ZCsrVmVCWHpjWU1wdVNZb2l5UGFPUnRkNXQrdHhZYVRYVXVJS0dJMDJmb1ZC?=
 =?utf-8?B?UkhqSkxIUHJ0MmhqRU12OEEyYTJySGVTb1UvTzFoQmVNZ0hlMXpLTHpsMjhZ?=
 =?utf-8?B?TVJIQWt3T1pUcEZPRG9UbFBrSS96ZGRKMmVNdXhoYU9LNS9kNUJIdExuMDh4?=
 =?utf-8?B?OVBVeDV4b2hpcU1ueTE5MUhqMVI5U2QvWHlJenUxL0ZYS3RxdlpQQUpGU1ZT?=
 =?utf-8?B?dyszajNRUlpGZlhZMU5rQVUvWm9tWTZYSjJxSUt2MmtMUUdRNHdTSnNOTDEy?=
 =?utf-8?B?UjJTWWlsalJiS0ZYUGdZV1UwbmdWSkVzVk4ydDRPTnlrNGpBc3hzVVlOcGlx?=
 =?utf-8?B?Zi9PeWxES1F6SUJFWStTNnFGZ1pjY2dQVGliNzRMVlBaaDVoNW5YaHh4Y0tk?=
 =?utf-8?B?dm0ycjJEOEZRcVNtbTNQd05mRVBUazdGcEFxaU10bHhCd2pNTkRocENPdSt2?=
 =?utf-8?B?Qmo5REx1a1crQkc4Z2F1Mnp0dThQVHVURGFhY1Jobm9uK0xrRWlCc2VBdE1O?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79aeb8f-807b-4c8f-3f4e-08ddcfa4a39b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:06:58.4125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV7kCsn5n5pi2UZkeRtFHvwRxzeBF+ul+J0E3D98lMiHKec4UszxgsluAM/CFafp0dDKEEzKSvQwM7Grw1LsN8m9ViZyBjCdjMfibxB5NHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8894
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



On 7/25/2025 1:39 AM, Michal Wajdeczko wrote:
>
> On 7/25/2025 2:21 AM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Some test features are not available in production builds of the GuC
>> firmware. So add the build type field to the available information
>> that tests can inspect to decide if they should skip or run.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c       | 1 +
>>   drivers/gpu/drm/xe/xe_uc_fw_types.h | 3 +++
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index c8378f3e0032..d51827c969b8 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -348,6 +348,7 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>>   	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
>>   	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
>>   
>> +	uc_fw->build_type = FIELD_GET(CSS_UKERNEL_INFO_BUILDTYPE, css->guc_info.ukernel_info);
>>   	uc_fw->private_data_size = css->guc_info.private_data_size;>
>>   	return 0;
> maybe we could extend our info message to include build type? instead
>
> [drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0
>
> something like:
>
> [drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0 debug
> [drm] GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.47.0 pre-production
>
> or
>
> [drm] GT0: Using GuC debug firmware from xe/ptl_guc_70.bin version 70.47.0
> [drm] GT0: Using GuC pre-prod firmware from xe/ptl_guc_70.bin version 70.47.0
That gets quite messy to implement. The version print (and the code 
which calls it) is generic to all firmware types but the build type is 
GuC specific.

It would be easy to print something in guc_read_css_info() when it pulls 
the field out, but not sure it is really worth an extra line of debug 
output just to print the build type. It is almost never a question. As 
in, a given platform will be at a given level of build for quite some 
time and then switch to the next level up with a version bump. So for 
official builds, knowing the platform and version will tell you the 
build type. And for local debug builds, the developer should know what 
they are running with!

John.

>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> index 914026015019..77a1dcf8b4ed 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>> @@ -147,6 +147,9 @@ struct xe_uc_fw {
>>   
>>   	/** @private_data_size: size of private data found in uC css header */
>>   	u32 private_data_size;
>> +
>> +	/** @build_type: Firmware build type (see CSS_UKERNEL_INFO_BUILDTYPE for definitions) */
>> +	u32 build_type;
>>   };
>>   
>>   #endif

