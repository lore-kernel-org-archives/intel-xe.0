Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA520C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B5510E195;
	Mon,  2 Jun 2025 23:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGDZzucy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3E10E195
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 23:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748907187; x=1780443187;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fTB+Cj7eh/kEQnqXq3AkwPWvO8lE2SF9v8G3kk7F7F0=;
 b=fGDZzucyVnZWn/Og7jIqePSnoRP6cZ3yatbNZyxbUryA+kl4ZDUY0nh4
 61UiRmIGqLioTDKmZY4D7gzYaryId+zbV7ooA1clUidfSorcJmb+BdnK4
 zsP8NQ3cbU4pnjPrKm1iLmdf/pqyTdg1dYpzVeJtrEUBwigw87Crzp6xM
 QwzqHW++1aKXrmb/3F5sQcIUsxnPgeEozCzmxX71cnnDBLkmNzIe+X3Gs
 mJFWoVAnSSUWCOB86eo6c3F1+AoRAjie2ZuM4EB1f8ayygAFWmRkvYjZa
 ms+9YjbG+AHIByOY2qDIHZXy3UhdDtEc19ZBypZV1ZyAge3N7I2qlkchb Q==;
X-CSE-ConnectionGUID: 8KMBnj5SQIS/GDbucar1fw==
X-CSE-MsgGUID: JC3Yo8XbQjKV0qP0ZMwJPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50845136"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50845136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:33:06 -0700
X-CSE-ConnectionGUID: DFY5UOiuQj6xd7VM04OmOQ==
X-CSE-MsgGUID: BZBDUuhyTcaA7dvJ3vxdaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="145608949"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 16:33:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 16:33:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 16:33:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.82)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 16:33:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hpv/is/mwvzCqAFFZCjibNl0xarED1qt2mJz2eUBsCaxJgMgCuHo4bGKMJxTqLvxZkrLBBfQ+3lWgfHliJVbdXzPlOyNJDminajzDoFtK6RJQaGUDfGyVa1eAAj7CuUU91eWKAh7FYM0j86eV806Yyt1kOSGAbH8FMCFykknk5cqiT7DkFUdRCtcK1feUoqQ++i2zDvYtbjSQ/EtTypVSlNZP2Fw4vBkjSRxgqkMxiXOWHk14b3XaY5nsHMk7baKq9138ug6Yxxitd/OqUpWR0c4y3ZEAt3xgjmKAzJHHZmiZMx8bBo5wMeF/3GdapcdLJ7glzTgrYAaf3yEnpGagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK6H0mwll/UMPfbIvfasSuaoNyIzYQerRLJKVbNHm5Y=;
 b=mKt39uPl1elNu7J0pleVDOGWkFNsQ1X6nZ2swSFdQKYT7OVii6wUlDjupwhvxfyL4bnN1jUIamI/lkUqrog/3Zvx7QiYFbrwKCfyCxyc4EF8cBOk+JU9M/jekgHOkFu3KBI0lbtu90iEuSzf7DCnANAD5RNE9um2N25oTPRnK4ye1QRiU5OCTUPbDrQrotsXGXzmRL2NV5kuDtGVUTVWOfzBnI/tAJE/ugYa84l/87nb26Vn4HAe66xAFREq8nw1tcJI7laST1G9Hy0v9igataS9UaF97VP3v7XHIznhMwNq7mX7zRY+obeGEdMcIZLpaN/kE9ZjqBE0PVjPulyy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CH3PR11MB7391.namprd11.prod.outlook.com (2603:10b6:610:151::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Mon, 2 Jun
 2025 23:32:47 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 23:32:47 +0000
Message-ID: <5ed24516-fe4b-4eaa-833c-ce383c2d7f85@intel.com>
Date: Tue, 3 Jun 2025 01:32:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Move tile-related VF functions to separate
 file
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250602103325.549-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CH3PR11MB7391:EE_
X-MS-Office365-Filtering-Correlation-Id: f1efce3c-2ded-4f79-070d-08dda22dc858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0dOZEtPck9sTGt0TXRUN21JaHhnbjN2UkVWRElNQlpRV0JmTFdSZmp3K3pp?=
 =?utf-8?B?bHRKbjJWakxtNFRObFplTG53WTREL1l1TzEwR3ZseWh2cjZzTHdBTEtlcVlx?=
 =?utf-8?B?cFlZdzV6b0pNbVcwWEIvWkIwWVhzbjFKc1NITHZUbjFtMVN6SFJHdW1GazBw?=
 =?utf-8?B?bGo5bzFrYVZGdmcva1g2bGJHZHptaFVyZjFXSm1VbEZ4em45ME5LR2owYzdB?=
 =?utf-8?B?Z3NCMHBLRnNYRTY1WVRVcFovS1NUbEZZWW1DUXFzNWlNWUgxQk1Ua2xqa0pC?=
 =?utf-8?B?TUhXSFlQdStreHk2VUtUMDc5OUxjb1JYMGpyZlk0SWFYQTBWWGRSaGNPTmtK?=
 =?utf-8?B?b0IwZGdiM2tBcDFRWFhuWi9QSjIzV0FtZEtYVHEzaUhRejEzemU2VzBOUlNY?=
 =?utf-8?B?SWdXTldLTndYSCtDTXVvUGdVRTBSMkV5bDF5YXJGa25PRXZnQytRMG9tQVlI?=
 =?utf-8?B?NUQyWTBvQThnTHcxd3k4anVOTzl2YWFtWWdZTHBtMTErSWFZVFRudEV2Uk0v?=
 =?utf-8?B?Z2U0RkJXYlZLWnZWdGRvWkw3QTA4MnpuTGV4T1ZQVFJsVU5qMjJzK2g3Q0FJ?=
 =?utf-8?B?ZlNvaFFrSmxQYm5MajRadXZrR0xjbGRTM2NjRUFLUDJMWE5vY1dETGZUOGJT?=
 =?utf-8?B?bzFYVW4yUVhiOWZpUlV4UTlBUUxiMXR6bUhuMGRTWUVUSU95aDM3K0V6MEw3?=
 =?utf-8?B?bkcrZFhPOWg1azV5Y0MrbkxiZkwvTkRFTXBtZUJZc1B2Y2dXYzN6eEE4YzNY?=
 =?utf-8?B?c0lyRVJDaE9HWUtnNlpPaksrRjZzekdBYzlLVjFZK3JialpQMDUvNFBLVzM5?=
 =?utf-8?B?MURDZHQwL0xhaXk2QlBEZGR4SkMrdGtCZTBUUmNjYkc4RzJqbG1pTzY4ZlVy?=
 =?utf-8?B?UTgzWjlZTkVNY1RKbXV3T1dqb0lQQ2NqWmRnOVI1dXEyNlhxblduYVU2V2VG?=
 =?utf-8?B?TUxOZHVvcDNjM1Q2anVxMmFzMFhoQmVRQkE1YlYyYm5xMGFJK1BaK1plaTM1?=
 =?utf-8?B?eVhjNVVBOVkxRVhKdm1DYjRWRlZnNjZUbmxJV0NuS1B4dDhOR1hNZmZGS25y?=
 =?utf-8?B?d09OWUpMandpbWgxVzJ5WS9Tc2FTQVc3TmwzWFJGV0lsaFJ0QUgzQ0ZpODFh?=
 =?utf-8?B?MWlFRldwa0MyQVRCM28yd2NNVExkQmFqb3JQREs1bG5SS2VlajBwMlViTlJn?=
 =?utf-8?B?aks4Y3RCcWNHSWpiaFFlTTU3Wk1ZZzdFR0xjQ1FtOE1Rc09nWk9mWThFZnFz?=
 =?utf-8?B?THFtR29lTlNveXozT1VwRk0xbzhaSUpGMlo5SzN5ZFpxR2RaV0ZMYmpaQmJW?=
 =?utf-8?B?c1NWUWdVZkYrVTJFWm5HY09qNkp4M2dORTh4b0NqRm5oQlR0bEVjZi9NQWVo?=
 =?utf-8?B?dmtDdGFGTG5ZKzhvWDZ5bFRWQjdtZlpWREFoWVhPcGYyNU5mZXUvb0s2bTJw?=
 =?utf-8?B?cjhqeFdPaDF0QWY5dXlPa3ZWb0JMMkI5OTAyR3c3b0dXMEd5OTBEZkxaZnRU?=
 =?utf-8?B?SnJRb0hLK0RGUFJZT1Z3UnV2ekE4c1JQZnVZQURDc1FlRThERzQzWlErTW03?=
 =?utf-8?B?YjFiQ3NEMUV4YkhtcTJHaDdYWGdyVnBkamUrdndhV2sycjZwbWFQYUxicUpI?=
 =?utf-8?B?SDhSb3ZaNkFnMlUvLzVQNkduUFdSMFBCZHNrWXpUL0pLZDJCZ3FPL1gyUGhI?=
 =?utf-8?B?eitZYWNrWmIybFNCQTNOdDdnNzMzYmY5cDVCQ2Y3WWJHOGFDcElMalZOUyt1?=
 =?utf-8?B?VGUvc01KcXJwclZ2SVhMYVFkbmZpYzRQUkJROHN2ZDQvTTRoS0FlYlpudzdr?=
 =?utf-8?B?VFhkWkVGTmptZWMzL2NTOXB1cWxuOStPL0RQRnhmMTBuYi9LYXUwSzZ0MXln?=
 =?utf-8?B?aTliakdMUkZieWdUTitNelM0OXRaaEorZDZpWXE3ZzZ0b0ptZ1Rqak5VbzZP?=
 =?utf-8?Q?xbLgYEvx5po=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FzdzQ4a1pkN2ZCQjFWMG9hbFpGRjV4dDdyRGJ2ZDFSaXgrRGkvc1VJVWxG?=
 =?utf-8?B?ZHZ3L3htMzhnRllJWDVZZFBmNjgrb2lwb2pJdVJiUm91YTV5eW9qRzh5djJS?=
 =?utf-8?B?WXZ3VHVoNGlhZGZCLzNQQ2lySHdzaXJveFZMeDU3b3RScTFjTHY2ZW5jZ2k5?=
 =?utf-8?B?eDdZOFRXVWxpemFrUWNOSlNyTzQ3Q0JkK3dEQ0tWYjVmU2YwR05OUUJKRWJq?=
 =?utf-8?B?L1hXOHoxNno3K0ZYTVNVZWNsVGk5V0d1MVRmalVZM0JjZ21vL1JkaFFUK2FE?=
 =?utf-8?B?V3lCaFBLMFFKcmMwaW9ERU1id0tIUTBlOVFJbDNQWkhyS3FSSURsRFo3UjVt?=
 =?utf-8?B?N0FsTEFsdjNFcVo1cFFYUzNvbUZTbkhyRVpIYUoya2dHSFd0TDB6UmVkelYz?=
 =?utf-8?B?V3Z4d0F4MkJ1VEIyVjl5WlN4TkQ2Nm9aVFpOUGdyVUp4SmYxVG04ZFZNK05m?=
 =?utf-8?B?OXpXL1h6aXhQdTV5SU50QW54bWNJTzlZZHVyVlFIbUxKTENUb0toUUNuUTdS?=
 =?utf-8?B?OTJWTFFQKzBaL1luQ1I4OXovbkU2MTEwZ00weGVHT2ZWdEllc1kzbTJVYi9q?=
 =?utf-8?B?d3VmdEJXK1JpaU5VTGJORm8vN0JnMmpyNUEvQXBwWFNMY1pWRWRGVWl5SkJx?=
 =?utf-8?B?cHcxdml6Z0RUUmpXUUV1NFdEN3hUdGJnY1BLdnlwNVFJMXBDYjg2S0plZkxM?=
 =?utf-8?B?dkpQMGNMdGVuRGV3NkQ5VGZmY3Fta2tpc0YvNnNvdEJnRjFSZWVHc2Y3Z3py?=
 =?utf-8?B?MzM5SEpEL2ZkRjgrMVdHbFZpWlJ2QVZ3SDJPYndGcXRLdWw2TXNRWTllY2FJ?=
 =?utf-8?B?ZndwWDRaTnQ5c1JXaXVjTWN2ajZ4WWlvUjV6K2VPNFd1NzZza1J0bWlsNkl4?=
 =?utf-8?B?MW04N2E0c01vTkpzcjNLMS96cDBlN2FkbEZoSmo3M2FDblNaeGNMR1B1c2FB?=
 =?utf-8?B?d2hxODhIaW9WNzZmU2JuaEV1eUVuZkxFOWJldjVTQlo4SCtKdzRVelhmTHpQ?=
 =?utf-8?B?N0IyeWxQYmVpRFFWWEdVZ2NMZllodHpmSVgxMmIvTlE2VnFYZ2ZMV2tlYWZL?=
 =?utf-8?B?Sy91bGE0TkRwdkZkV3dtSytMRFVmWG00RVVGOUNybXNoajlDZzBxTnkxbW9p?=
 =?utf-8?B?Wm8wZlZ3SVlULzNsSVcyWURDYTRJNGRTSWJOOEhVNzJaVkt4dlowei95U1Zz?=
 =?utf-8?B?eXpLb1U5MWQzd1hZOENoVWY4eis3bXZLUUlrbjYrbHdVNGhIUTdXZGpWS2g4?=
 =?utf-8?B?NXRndlNDSFBXdEpYR0ZJZFdLMDFVWGhVVnpFRVRROFRCanU2bW9teGtnMHZm?=
 =?utf-8?B?MFpQUkt5NXYzMVBVdzd1WjhjT01tdnl1bXJuNFd5ckdtSk9JdmFSOEdtTlFR?=
 =?utf-8?B?YlY2VjRzSmlMUzlSVUxJUFVtQlZHYmVyTXducFFLU3JOUi8ybWFRZDV4RDFO?=
 =?utf-8?B?cnJFRVVhN3AyS1FINFNMMkRLZ3dWQUhpaUFJbGJWWiswY1hxMmRFbTA1RXNw?=
 =?utf-8?B?Tm1zZTU5em9HN01SU1VQejlJOURlcVkwY1ZxZ3Btc0gvWVZMNG85cnNxQ1h1?=
 =?utf-8?B?dVNlZGFLblJKdUJMWS9OWTYrTFNYTHRZUkl2TVFCY3doY2dBYTdNNTRCSmlD?=
 =?utf-8?B?YjZ0aHV0RytyK2QvYnl0bVpTdnhuQU9ibDFoeXRjaFRHc0NtZWtjcithc0hR?=
 =?utf-8?B?UnB4ZkhLa3lBaXlsM09PeEFRcXBXRzlqRWNldkM1Ui83N09mQ2MwRWlsVE43?=
 =?utf-8?B?MkMzWG1lUitJaFB4RlpZSUF2OS9DbVNLRnlhWURVcU04M2lTQnh3NWl3c1B6?=
 =?utf-8?B?MjNMTnJUT3prN3lsVjdzWUZ5elYzMTU4eDRZUGFZZ210TzRoSHU0QllzN3Fj?=
 =?utf-8?B?cm1Qa3k1eTlyUkNwZC9DUHUyYVF6UFNCNkhUU2xvbjBiMkIyaUd1VTZ2VmhK?=
 =?utf-8?B?QmlaUVA5K1pzSERrWFVQYmZLMU1yVzZTT2pRY1c2bEZnRmp3NHptQzk0ZzYz?=
 =?utf-8?B?YUc2ZWQ3d3F0Vmx3TnB1dE8vdnJ5eEJOUnM2Q1NvN2FmTzJhOVVyRm9uUmJh?=
 =?utf-8?B?d1Fra0ppREFmc05XYi9tdmJlNW9RYUUvMzJqeGY4VkJnV05HblFra29OaVdH?=
 =?utf-8?Q?xvmyUN3W2jkM7E+u5d1OPZmsp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1efce3c-2ded-4f79-070d-08dda22dc858
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:32:47.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xf/5Cns6DdgHlcVJDyOgy2mPQUIN3rgtZ3SFNY1Fm4rGs5Dz7Ct3Cxmh+O4nk7IWO3MQNs5sbBEROPTb4qQD8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7391
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


On 02.06.2025 12:33, Michal Wajdeczko wrote:
> Some of our VF functions, even if they take a GT pointer, work
> only on primary GT and really are tile-related and would be better
> to keep them separate from the rest of true GT-oriented functions.
> Move them to a file and update to take a tile pointer instead.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>

No issues. We've switched the ballooning error from ENODATA to ENOSPC if 
ggtt_size is zero,

but that was very hard to reach anyway since `vf_get_ggtt_info()` 
returns with ENODATA earlier.

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/Makefile           |   3 +-
>   drivers/gpu/drm/xe/xe_ggtt.c          |   4 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c   | 245 --------------------------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   4 -
>   drivers/gpu/drm/xe/xe_sriov_vf.c      |   3 +-
>   drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 245 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_tile_sriov_vf.h |  18 ++
>   7 files changed, 269 insertions(+), 253 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
>   create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4bf484d4121..f5f5775acdc0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,7 +139,8 @@ xe-y += \
>   	xe_guc_relay.o \
>   	xe_memirq.o \
>   	xe_sriov.o \
> -	xe_sriov_vf.o
> +	xe_sriov_vf.o \
> +	xe_tile_sriov_vf.o
>   
>   xe-$(CONFIG_PCI_IOV) += \
>   	xe_gt_sriov_pf.o \
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index af8e53014b87..b9a0fd5ccaba 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -22,12 +22,12 @@
>   #include "xe_device.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> -#include "xe_gt_sriov_vf.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>   #include "xe_wa.h"
>   #include "xe_wopcm.h"
>   
> @@ -258,7 +258,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>   		return err;
>   
>   	if (IS_SRIOV_VF(xe)) {
> -		err = xe_gt_sriov_vf_prepare_ggtt(xe_tile_get_gt(ggtt->tile, 0));
> +		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
>   		if (err)
>   			return err;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index acfb3b1b0832..792523cfa6e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -613,168 +613,6 @@ s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>   	return config->ggtt_shift;
>   }
>   
> -static int vf_init_ggtt_balloons(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -
> -	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> -
> -	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @gt: the &xe_gt struct instance
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	u64 start, end;
> -	int err;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
> -
> -	if (!config->ggtt_size)
> -		return -ENODATA;
> -
> -	/*
> -	 * VF can only use part of the GGTT as allocated by the PF:
> -	 *
> -	 *      WOPCM                                  GUC_GGTT_TOP
> -	 *      |<------------ Total GGTT size ------------------>|
> -	 *
> -	 *           VF GGTT base -->|<- size ->|
> -	 *
> -	 *      +--------------------+----------+-----------------+
> -	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> -	 *      +--------------------+----------+-----------------+
> -	 *
> -	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> -	 */
> -
> -	start = xe_wopcm_size(xe);
> -	end = config->ggtt_base;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> -							 start, end);
> -		if (err)
> -			return err;
> -	}
> -
> -	start = config->ggtt_base + config->ggtt_size;
> -	end = GUC_GGTT_TOP;
> -	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> -							 start, end);
> -		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -			return err;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -static int vf_balloon_ggtt(struct xe_gt *gt)
> -{
> -	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @gt: the &xe_gt struct instance
> - */
> -void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void vf_deballoon_ggtt(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> -}
> -
> -static void vf_fini_ggtt_balloons(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
> -static void cleanup_ggtt(struct drm_device *drm, void *arg)
> -{
> -	struct xe_gt *gt = arg;
> -
> -	vf_deballoon_ggtt(gt);
> -	vf_fini_ggtt_balloons(gt);
> -}
> -
> -/**
> - * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	if (xe_gt_is_media_type(gt))
> -		return 0;
> -
> -	err = vf_init_ggtt_balloons(gt);
> -	if (err)
> -		return err;
> -
> -	err = vf_balloon_ggtt(gt);
> -	if (err) {
> -		vf_fini_ggtt_balloons(gt);
> -		return err;
> -	}
> -
> -	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, gt);
> -}
> -
>   static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>   {
>   	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> @@ -870,89 +708,6 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>   	return err;
>   }
>   
> -/**
> - * DOC: GGTT nodes shifting during VF post-migration recovery
> - *
> - * The first fixup applied to the VF KMD structures as part of post-migration
> - * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
> - * from range previously assigned to this VF, into newly provisioned area.
> - * The changes include balloons, which are resized accordingly.
> - *
> - * The balloon nodes are there to eliminate unavailable ranges from use: one
> - * reserves the GGTT area below the range for current VF, and another one
> - * reserves area above.
> - *
> - * Below is a GGTT layout of example VF, with a certain address range assigned to
> - * said VF, and inaccessible areas above and below:
> - *
> - *  0                                                                        4GiB
> - *  |<--------------------------- Total GGTT size ----------------------------->|
> - *      WOPCM                                                         GUC_TOP
> - *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> - *
> - *  +---+---------------------------------+----------+----------------------+---+
> - *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> - *  +---+---------------------------------+----------+----------------------+---+
> - *
> - * Hardware enforced access rules before migration:
> - *
> - *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> - *
> - * GGTT nodes used for tracking allocations:
> - *
> - *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> - *
> - * After the migration, GGTT area assigned to the VF might have shifted, either
> - * to lower or to higher address. But we expect the total size and extra areas to
> - * be identical, as migration can only happen between matching platforms.
> - * Below is an example of GGTT layout of the VF after migration. Content of the
> - * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> - *
> - *  +---+----------------------+----------+---------------------------------+---+
> - *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> - *  +---+----------------------+----------+---------------------------------+---+
> - *
> - * Hardware enforced access rules after migration:
> - *
> - *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> - *
> - * So the VF has a new slice of GGTT assigned, and during migration process, the
> - * memory content was copied to that new area. But the &xe_ggtt nodes are still
> - * tracking allocations using the old addresses. The nodes within VF owned area
> - * have to be shifted, and balloon nodes need to be resized to properly mask out
> - * areas not owned by the VF.
> - *
> - * Fixed &xe_ggtt nodes used for tracking allocations:
> - *
> - *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> - *
> - * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> - * overlap; but our node shifting will fix addresses properly regardless.
> - */
> -
> -/**
> - * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> - * @gt: the &xe_gt struct instance
> - * @shift: the shift value
> - *
> - * Since Global GTT is not virtualized, each VF has an assigned range
> - * within the global space. This range might have changed during migration,
> - * which requires all memory addresses pointing to GGTT to be shifted.
> - */
> -void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
> -
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -
> -	mutex_lock(&ggtt->lock);
> -	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> -	mutex_unlock(&ggtt->lock);
> -}
> -
>   /**
>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>    *   or just mark that a GuC is ready for it.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 2f96ac0c5dca..6250fe774d89 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,10 +17,6 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> -int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> -int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
> -void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
> -void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 46466932375c..6526fe450e55 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -15,6 +15,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sriov_printk.h"
>   #include "xe_sriov_vf.h"
> +#include "xe_tile_sriov_vf.h"
>   
>   /**
>    * DOC: VF restore procedure in PF KMD and VF KMD
> @@ -211,7 +212,7 @@ static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>   		shift = xe_gt_sriov_vf_ggtt_shift(gt);
>   		if (shift) {
>   			need_fixups = true;
> -			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
> +			xe_tile_sriov_vf_fixup_ggtt_nodes(tile, shift);
>   		}
>   	}
>   	return need_fixups;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> new file mode 100644
> index 000000000000..88e832894432
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "regs/xe_gtt_defs.h"
> +
> +#include "xe_assert.h"
> +#include "xe_ggtt.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
> +#include "xe_wopcm.h"
> +
> +static int vf_init_ggtt_balloons(struct xe_tile *tile)
> +{
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> +
> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> +		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> + * @tile: the &xe_tile struct instance
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +{
> +	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> +	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u64 start, end;
> +	int err;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(xe));
> +	xe_tile_assert(tile, ggtt_size);
> +	lockdep_assert_held(&tile->mem.ggtt->lock);
> +
> +	/*
> +	 * VF can only use part of the GGTT as allocated by the PF:
> +	 *
> +	 *      WOPCM                                  GUC_GGTT_TOP
> +	 *      |<------------ Total GGTT size ------------------>|
> +	 *
> +	 *           VF GGTT base -->|<- size ->|
> +	 *
> +	 *      +--------------------+----------+-----------------+
> +	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> +	 *      +--------------------+----------+-----------------+
> +	 *
> +	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> +	 */
> +
> +	start = xe_wopcm_size(xe);
> +	end = ggtt_base;
> +	if (end != start) {
> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> +							 start, end);
> +		if (err)
> +			return err;
> +	}
> +
> +	start = ggtt_base + ggtt_size;
> +	end = GUC_GGTT_TOP;
> +	if (end != start) {
> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> +							 start, end);
> +		if (err) {
> +			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int vf_balloon_ggtt(struct xe_tile *tile)
> +{
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	int err;
> +
> +	mutex_lock(&ggtt->lock);
> +	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +	mutex_unlock(&ggtt->lock);
> +
> +	return err;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> + * @tile: the &xe_tile struct instance
> + */
> +void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
> +{
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +static void vf_deballoon_ggtt(struct xe_tile *tile)
> +{
> +	mutex_lock(&tile->mem.ggtt->lock);
> +	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> +	mutex_unlock(&tile->mem.ggtt->lock);
> +}
> +
> +static void vf_fini_ggtt_balloons(struct xe_tile *tile)
> +{
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +static void cleanup_ggtt(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +
> +	vf_deballoon_ggtt(tile);
> +	vf_fini_ggtt_balloons(tile);
> +}
> +
> +/**
> + * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	int err;
> +
> +	err = vf_init_ggtt_balloons(tile);
> +	if (err)
> +		return err;
> +
> +	err = vf_balloon_ggtt(tile);
> +	if (err) {
> +		vf_fini_ggtt_balloons(tile);
> +		return err;
> +	}
> +
> +	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
> +}
> +
> +/**
> + * DOC: GGTT nodes shifting during VF post-migration recovery
> + *
> + * The first fixup applied to the VF KMD structures as part of post-migration
> + * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
> + * from range previously assigned to this VF, into newly provisioned area.
> + * The changes include balloons, which are resized accordingly.
> + *
> + * The balloon nodes are there to eliminate unavailable ranges from use: one
> + * reserves the GGTT area below the range for current VF, and another one
> + * reserves area above.
> + *
> + * Below is a GGTT layout of example VF, with a certain address range assigned to
> + * said VF, and inaccessible areas above and below:
> + *
> + *  0                                                                        4GiB
> + *  |<--------------------------- Total GGTT size ----------------------------->|
> + *      WOPCM                                                         GUC_TOP
> + *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> + *
> + *  +---+---------------------------------+----------+----------------------+---+
> + *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> + *  +---+---------------------------------+----------+----------------------+---+
> + *
> + * Hardware enforced access rules before migration:
> + *
> + *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> + *
> + * GGTT nodes used for tracking allocations:
> + *
> + *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
> + *
> + * After the migration, GGTT area assigned to the VF might have shifted, either
> + * to lower or to higher address. But we expect the total size and extra areas to
> + * be identical, as migration can only happen between matching platforms.
> + * Below is an example of GGTT layout of the VF after migration. Content of the
> + * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> + *
> + *  +---+----------------------+----------+---------------------------------+---+
> + *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> + *  +---+----------------------+----------+---------------------------------+---+
> + *
> + * Hardware enforced access rules after migration:
> + *
> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> + *
> + * So the VF has a new slice of GGTT assigned, and during migration process, the
> + * memory content was copied to that new area. But the &xe_ggtt nodes are still
> + * tracking allocations using the old addresses. The nodes within VF owned area
> + * have to be shifted, and balloon nodes need to be resized to properly mask out
> + * areas not owned by the VF.
> + *
> + * Fixed &xe_ggtt nodes used for tracking allocations:
> + *
> + *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> + *
> + * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * overlap; but our node shifting will fix addresses properly regardless.
> + */
> +
> +/**
> + * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @tile: the &xe_tile struct instance
> + * @shift: the shift value
> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.
> + */
> +void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> +{
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
> +	xe_ggtt_shift_nodes_locked(ggtt, shift);
> +	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +
> +	mutex_unlock(&ggtt->lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> new file mode 100644
> index 000000000000..93eb043171e8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_VF_H_
> +#define _XE_TILE_SRIOV_VF_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_tile;
> +
> +int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> +int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
> +void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> +void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +
> +#endif
