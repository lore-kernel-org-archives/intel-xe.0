Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839D6C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 23:20:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C5D10E112;
	Tue,  6 May 2025 23:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCg1K6r3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD9D10E112
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 23:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746573616; x=1778109616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ptuv5jb4En++RlmF9MaXOpjDGPv8meOxDA0c4Sjx524=;
 b=UCg1K6r3ZfVUhrNo0/PODPkXiE6TlsBigW2zVzk62muz78KqeRun+rfr
 ypaIOFqijUbV+Sh+HkUEvdY59L5/LkBdrgnZp+YNGbNWGo0K4EP0foBO7
 NSUVNnXg94/YxAxkwy3uuU+x/A1kwzcB4vfkX0Ag7Kcdz85kcN2FPe6kX
 LhGdYtOasySrVtk1vA+QSm8Ba9AgguHRPsuiy0BjLNHcnYFahCpthJCd7
 7T4DwGBWny0qhdGLvK2zkSsHqkFnyRbzB8QoiuCedagPNKMmhBSa6Hf7H
 Xz7il55jJ1fpuuqLmJn63B7J4CAF4J/rVE7t5Aebc3H5wIf3NkgncyIKP g==;
X-CSE-ConnectionGUID: wrrs1j4MTLKo1/4rYFxsNA==
X-CSE-MsgGUID: OhJIDYjrQDu87vC+TEJqog==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70780673"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="70780673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:20:16 -0700
X-CSE-ConnectionGUID: G6qsIO5jT2WEWErfrG8iCQ==
X-CSE-MsgGUID: zS66HRNCTmKgO9XkiDWmxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="135642617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 16:20:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 16:20:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 16:20:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 16:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfTLBgge7nOuVbgPG/3ALBRIxRUgHyKk6Y2of2D86RAbFlrAzr81al2h906Mme2xX29pQintdsLhBxGyvmPDn2LSDHFed4zCYfGoK0NG6pbOcylnE/wIt6WV9Zlc9v2YFv43npsim9R6SdynVWZY6p0CKFcxd5rP2+1junUxFGVd3yWrB9FHekWyb6iU/8JsBNc1aLjeexGtS5rOTEARNfBLEO2ezoWyENOuPJADqCVlEMmw0DO3yrEQRoxV+QNsWAmOQ7C7eLRXc5wl2MWD1zobpvBbwznPq9vF/3ns4dVUwbRI+UwoBhdL5KFuTbNQvEYQvFCGVsRas4D0INrVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/mpdBrfj3wJFcOeQXSI86znKcC0/bd6jH2x6FLsx8M=;
 b=VzSyyQyX5D/CSwh9/+QrtH7itvLLwEBR3PA5gVxaoLuZ9PLeljF1hdHsG9edHTDCKSCWdW3TONyJBpRByDgplW58LYxFGTNq+aYjJ9Os5sjhrKgkyuH32Ao/5tSlM7abF56fcaCpa3UQM++rMfcWeK5nRz5C8tbAM0kqtm2ElLxsrGahISmNI6ZluzIvlVp934ps6aCEJmlhxmTqyjVKziRW2S+qdTJKoMyaEHhT2p0sMnaZNdSpymL3XPhML12p0l8Yw4eRhLjYjUc/hD50hakO1hxYxBsLAxSsHDb+mDsCsKTRYzL/Ba/vJ0YUQX4YtIxYXR2V+wfv+QQYpn3IXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 23:19:40 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 23:19:39 +0000
Message-ID: <ac18b7a1-c149-4182-bc6d-6b73b943525d@intel.com>
Date: Tue, 6 May 2025 16:19:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aditya Chauhan <aditya.chauhan@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250430131710.20532-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 22457bf8-0ba8-427a-65eb-08dd8cf47999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGJSSXpXWEVLL2QvUytTaUZyWVhzN2kwakR4SmJFekgrVzVvTUhLYnlwczZS?=
 =?utf-8?B?bXFpVmF3U0d2cldKb2xpN1A3bCthU0ZGc2c0OE1NU0xneXFRTTI0cFBML3J3?=
 =?utf-8?B?RVdKTGFZVzZqRmFQQ1pFaWlCMDg3K1dCZmFxaER6M01WTVBjTTBxc01DcWR3?=
 =?utf-8?B?elVtY3lvbTNKbThiaXpydjY2ZnVGZmwyRjZac011V2xJMnA0V0F2MDJVMjN4?=
 =?utf-8?B?aUpYcnQ0ZlpPNHFHV2xnd0tOeXFrOFBpallpZEV4MFdSbGdhMVFqSktFV0px?=
 =?utf-8?B?SFc3MGdzK2dBUk1iWVEzYTVnUFh5bkpDRlI1cTdGbHQyQnZsdE00VFc2YVpi?=
 =?utf-8?B?ekxHc280N0VYd1VkZGZhSWJtcHZvQ2lPeTV1c2ppSVgwWTgzZGtpdUp4cGdl?=
 =?utf-8?B?NVhtN0t1MGZSUUIrU0tFdG5NQU9RbnNrVEpuWVpvNUVEdEYxcmNJYmN3Zm5V?=
 =?utf-8?B?RnkxdWxrSjFZSzNEaVdvL0JzMmJqWmxzVUREQXUya3hIbnlYWkpjUithU1Vt?=
 =?utf-8?B?TmNGdVIzb1dXdHc3TGwwRFFwZWxUM1llbUpwS1BnQnhEb1pNMGE2bXA0VU1r?=
 =?utf-8?B?a2lMSTZablh0Y2hqQkUzUFlmWlRHNGdzSGhRQXlPTUQ2VVpSYWY5cTRmYmcz?=
 =?utf-8?B?aU9tY25GMU9OTmFadytsVENwVmMzVExMcW9kcktPSXN2M2JQdVVTakYram9X?=
 =?utf-8?B?VGhTOVUxSHVTRGtGNys2clR1RDlYbkwwY3k5eHJFNEFOeGtTLzY0R0t0ZTVw?=
 =?utf-8?B?Y09UN2JoWW5vbVlvRVVJclc5NDRUR3BFUzhBU2RwT0tQOUxSZ3hIeTdNUDMv?=
 =?utf-8?B?YXp4aG9hM1VGd1J2TThNSlYwRmMrRmJkUUMvS3FpdTNDVVdtRzdIeE1TdENW?=
 =?utf-8?B?RTNjUy9TQUNNZDNBMGZobWZDUzhBNFBhZlg3TGFma3RnTVZXMGVKK1ppY0xB?=
 =?utf-8?B?QVQxTjF3TmtlQWhNd1VGSUY1eUgyVXBNSGdmemNqdHBOMkhDYXJITUxETjNq?=
 =?utf-8?B?TUxJSFlRNjMyUGYxWHhVZzJ3OG9lZGc1Tm1ST1VWUEJCcmNkRGpPYm5ORG52?=
 =?utf-8?B?SFJjUlZJOCtMSG5WdUxHcWpRK09QWU5manFmUE03VWc5SDdGRzRBdWF4NHNt?=
 =?utf-8?B?NlMwdFZlc0h5QVJxVXNkanpFanAwRDJFQ0EyNFBWMHNZOGVOcGZhNVlCTUZP?=
 =?utf-8?B?NGllR0ozbS92RXJsa3FLQ0N2TlZmaExlTlpYbkdyWFR3Z2RTREVvdlgzeHY1?=
 =?utf-8?B?cklBc25mUG8wT1lDYkhsbjY2MTVtYjNMVk9uSVBFUENpVzZsUUxNZkFYNFBV?=
 =?utf-8?B?VVBKWDZsb05JRTFZYW1XTVRhQW5XdkVwVmFrRXd6bGZBUXBiVXZpMGRncmpH?=
 =?utf-8?B?MUFzeEdKcjBYci9FQVlJMERNekZ3UkNtUmtBcUZoVnlkRDZxdDhlUTZObzhH?=
 =?utf-8?B?NEFFZHFzUlB2eldmYXJQeE9pd2wzSTIvL0I3a0xZVHlsRloyNlc5Z0xsTnRp?=
 =?utf-8?B?WmpqSlJiZWw4eTlsMmNiN3d1Y3prQVlRVnlJZy9zaVdWYnN4b2RkNmFZdk9V?=
 =?utf-8?B?ZzJtdzNHUUo3MDV2QjQwdXA3eEJ2ZXVVZEZLRDEwa2RaNjBXTmtKYWJiV2s1?=
 =?utf-8?B?dUsyVHJ5eDlzQ3VvTzMzSzR0L01yc3NyVXB3TXpGK2VtNGJjMDRaZ0hrZ3Z5?=
 =?utf-8?B?S3FIRjJaa2RGVXpQdll4b1lYdnJHU1lFaXBHOU12U0xsSnY4dTc1Vjg5N0ta?=
 =?utf-8?B?aXBaWU9uVEZKVThtVFpFUWQrQWFxVFlmRDBIM3VDQ0RmZnBwZTVXUkp5ZTJj?=
 =?utf-8?B?U0VFcWhMR0kzdk9uMFI0bDMxUVNObWhsaDcvMjhXeWZQTTJpS1VSVkNXM0Uw?=
 =?utf-8?B?SWw1b054TlJCa2pERDI3S2VrVmU2dnQ5NVpDaWlvVFNkZjBycUtqR0cydFlV?=
 =?utf-8?Q?DClclnrs80Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eng1L09Kdkl1OU1FYUV3T0xhSjFIWldPdG5MWWdsYXY4aXVMdVRmbzlmSUZ6?=
 =?utf-8?B?NTRlV2xGVmpOaDJxZTNTVHZkVW9Sb0dEM1BtR281RWd1QmM3ZjZtdHUzcnFN?=
 =?utf-8?B?ODBZRmU1MFNYTTh5VGtGOTVXNnU3amNtYUZDaGFIRTJhZTZXZVBMVUs2dXpu?=
 =?utf-8?B?M09xUFUvMTRFV1RVSDdYZ1lwaFhCMFpHc2JxQzVZUUsrQVlmdWdJdG5TZm41?=
 =?utf-8?B?eUl2K2pFRDJNakZXUnVJZFYwNkxxcjJlZVg2UG53azVLMHk4QkM0cTVyQ2dK?=
 =?utf-8?B?L1VuRktoUU8ycjV0V1lKMDU1emhCeU05c1F3bVZsa2cwVFVnWXF0dDdTaGd4?=
 =?utf-8?B?RXJLM1FFejNaZ0JZMGlveGJmQlRxR1Z1SDQ4SG9RQU9Zd2dIZTd3WXBNalhl?=
 =?utf-8?B?Q0tuemQrYTVxK29PVnFsZFljbVdreGhRK3lXWU1JdDdhcGZlN0ZFQjR3SjQz?=
 =?utf-8?B?RmtuR3JNN3dVU01KV3VXQ1BVekFaMWcvbzV3VXpxOGZ5UmhwbndJR0QzUVQ1?=
 =?utf-8?B?UGZjQU55QlUwZDhhL2VZa05ac0JlVVN3QnltK2RYVGF0RVVZVTRNd2dWRlF2?=
 =?utf-8?B?SVZqNnY4R3o2V09CM3JKUGtaOXJpNUhWcmtDUUlOU2E2anFheklXWWZGY08v?=
 =?utf-8?B?dUFIZTBkcHdEWDNvYVB2c21lVHU0YTlXbmhsblIxZGlQSm5KNHdVWXgrZWZB?=
 =?utf-8?B?M3VzSzZ0aUkyeVVPSHpjbGJCV0FVT3ZEMTNqQVNjVjRtQ3UzMjltTHdsTVV5?=
 =?utf-8?B?RGczYXE1cTNaTnYzZTdwcHZGbjhIRzVkc3hsMUx5TlZyQ09neHBlVkdzdndD?=
 =?utf-8?B?ZmdYb281K2J5QUFvcXN0REtwaFV1V2lhbEFqb3gyOUNYV1d2QW9wQzRlcGhM?=
 =?utf-8?B?a0lScFBJOGhMVnE0UXVGS1pCSGdqeUh1b3BPV0ErZU93MlBhWDNkTEw0bjdx?=
 =?utf-8?B?M1pnVTRSZDdFb0pKUG1tUGlqSzhyZitkUnFTQTlPa2UzSHhmc2tyNUtTU1I1?=
 =?utf-8?B?bDNXQ2NpT1FLMWRjUkx6QWUzWkZZcWFaWjNaOFNDWWk1YXVscGhyalBZc3Yz?=
 =?utf-8?B?L2VqOStvWFJDQ3BqYkEwM252U2grbDRyZlBoU3RqVEZtRFZpS3Q3Z1dPWFFC?=
 =?utf-8?B?VWR2QjZjWjFLU0pBYm8rVXJQOFpQYkgrcVc4SEM5NEVGRVFRYi85ckhMNEVX?=
 =?utf-8?B?NytveFkrUnlja29EZ1lqTi91STdZY3hrOUVkS0ZKdVplUzliTFZHSTFuK3E0?=
 =?utf-8?B?WTlpV2V1WDM0dUErTG5KL0p3YmFQNTVEV3MwbFBjRU44QmlMNGhZaUQvNjYw?=
 =?utf-8?B?TllQbkRjcWZ0N3IveW9ub2RrVnBFU0F6Y0F4aTBFaHp0QjJ1VWZxcHlVN0Vx?=
 =?utf-8?B?WE5ldjE0N0JHZHdRU3YxdmxpMVMxR2x0RHFtSUNkRWtoNXJ2ZWo2d2NjaUVi?=
 =?utf-8?B?djRvOU54TXVIY2kyYmVFR01tVUpJaER5UEt4QTFTaTlvNlpyNXptYTMzWk54?=
 =?utf-8?B?NnF3cVpaWjZkMzQrRjlJZnNReGI3TXFENlh1NWQ1bkRWaG8vYmp6SHZDaEJl?=
 =?utf-8?B?aUh5cnF0RnBBNkdPSkI4UkFSeEMxa2ozUjV4clBVckt0a01zZDFRTnR1cUZk?=
 =?utf-8?B?L2dYU2tYdHVGR0FpQU8zbWhYajlSRmNoTEE0L1dNS2ZDMElwMlB4K1JURThj?=
 =?utf-8?B?NEVPaEo5ZmVXT1gvb2tTSnRxd1hDUzVyQnppc1NIbGExMExWdnp0S2Q2amRm?=
 =?utf-8?B?UnpxWHp5RkZxWGxqT3I1UXQyVjFBK3NzdTRiWUs2UDZGR0lFdFNNOGZjSFNR?=
 =?utf-8?B?SUsvRW9HRlFGK2c2MmVwNkFxYlEzM21RY01kc2REOG1BbHVlYks2UHBTOVpr?=
 =?utf-8?B?MjkxZG9oeGFkRkFseHcvbVdZTHF0c0VaaFFsWGo3R3JEYUFCd2FKRVpKd1Mx?=
 =?utf-8?B?cVFFMUh2YmsyQVM2WEt6eE9Od2dqSTZ3aFYzdGQ2U2pSbWtVNEhsOE1HNDND?=
 =?utf-8?B?Y1pkV1BUZlJpZTJuQ0pENkVSdzhjNkkrOWZ0WGZ3MmxYNUNISkZvTk1rUUY5?=
 =?utf-8?B?SE5HblE5MGV3VHk0QTIwaXp2TVpxY09oQTR3NVVWYmYxc0ZTTXVEbzJRdHVR?=
 =?utf-8?B?UUkvdlJOWEpzZktxTTU2bmV3OWg4STRGMytLNy9sdGM3R0FadU5TRDlYQUxO?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22457bf8-0ba8-427a-65eb-08dd8cf47999
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 23:19:39.8049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kFwa5kMOEUdi0ySx3vo3TIUv35BZoFW1Cv8P7ugHnV9EW1drA8UUO2ojlE2EPFDALjiFRSPrGhLXNx6l20cFw+PEN5Q58B91XI15sytAG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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

On 4/30/2025 6:17 AM, Satyanarayana K V P wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_should_fail_ct_dead_capture() helper function,
> ct dead capture is avoided which suppresses ct dumps in the log.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
>
> ---
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> V1 -> V2:
> - Fixed review comments.
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2447de0ebedf..d6e7a8b80d8c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1770,6 +1770,20 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +/**
> + * xe_should_fail_ct_dead_capture - Helper function to inject fault.
> + *
> + * This is a helper function to inject fault into ct_dead_capture().
> + * As fault is injected using this function, need to make sure that
> + * the compiler does not optimize and make it as a inline function.
> + * To prevent compile optimization, "noinline" is added.
> + */
> +static noinline int xe_should_fail_ct_dead_capture(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(xe_should_fail_ct_dead_capture, ERRNO);
> +
>   static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
>   {
>   	struct xe_guc_log_snapshot *snapshot_log;
> @@ -1778,6 +1792,13 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>   	unsigned long flags;
>   	bool have_capture;
>   
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_should_fail_ct_dead_capture())
Is it worth making this a more generic 'is_error_fault_injected()'? Then 
it can be used by random other bits of code if/when necessary. And maybe 
also have an inline/#define version for when 
CONFIG_FUNCTION_ERROR_INJECTION is not defined?

John.

> +		return;
> +
>   	if (ctb)
>   		ctb->info.broken = true;
>   

