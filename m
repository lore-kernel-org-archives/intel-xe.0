Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2BC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4318110E0EF;
	Thu,  7 Aug 2025 11:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D80nFyoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50910E0EF
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754565311; x=1786101311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Y2c28wp06a0xI7XMWXKrM9Ue2zTk4eNmmvhSsO6Sn0=;
 b=D80nFyoAvIiy3HUdOQv029nU/6e1MGd7UjtgCfkHqeMjtAMTMkmHlNfA
 iRCZ7Oj7HxWXoKwu2PtXaMzyIZFQmb5iDAUg4+ZkJpIhaOH8iBPpV3Ymi
 emsLXUdOpUOEySFg5ykrR9nM3VmwVzZ94PdU/A7jIkmlu3gqNU7qvc5PL
 01qa6AeOhQRY+KPmGMZKWphBYEXhrqt0IKGkuUe86i+VyK/5PYYttrkdq
 Hk7mR+O90vhywQ9hfJxfYt97TgJu7Q1q9hCjIExskAT/thHIfJoSnR8E5
 b8gp2Ohfbiqw0Peq+Pev0q/B74BCIeXnMzIIGOmSihvZVfg7EUl4qbF+8 g==;
X-CSE-ConnectionGUID: mLROoB9GQsqmXfN3avzDSw==
X-CSE-MsgGUID: 66Cf2z+VT0Knfglmx9diWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56975720"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56975720"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:15:10 -0700
X-CSE-ConnectionGUID: ZusHW/TZTseKJFp4WQ+/Tg==
X-CSE-MsgGUID: aFwyMR/TQs23Nue9tOYkHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169242635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:15:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:15:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 04:15:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 04:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=No76ykplEarjPQvtlxaImGFt4tl93X2PDtlCgAbLmlc/r0UG7bclCKif61YozaiTFi4fKjTpB15Tq6O+iMgCX70ZM+u5w5MiKSxCyCse0tV7vqJ8ciurXR0IajpJddYxkP2fNYqQJxy8b0Gu57UD5MgaJH8Y69Mv0P55zWNgfth6eQ0kRiLGACcunPeOY27uJEffajNtwAyTbxpwBBFaveEtYwu90DvOsKj33JctjRnMCBOPTuJHaGub/f7MSsHjniZWTGTudtvHq7dHjijuW+kCtxNaimByy9AoexcqgNaoaE0tM7mnn3OXv24adYnzExM9AD4kHz9c9KKWqnsULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4uGO46tgH9PNSLtggmYkRuEcquRBo4Vkagin0Fkkb8=;
 b=hjmHemA4ZhT4tM9x7lXxqZSAosfwFKotHGghYO43vBx2aoWcnfSW0i4U99fBLRoPjbgk+7qBHalr+ryHUjJCQCu1NXTPCn/b6c5WyZUVm3ETABkEBdRbKB9oxENjJ8WXjTDSu77N2lnJH625hgyWUY89WeQydFb+wpHNKGEBhbKE6FlsImSSPz+DQlqb9BsB6dYCn+uiUH5QtbcXbjsrPtS10ous37fNWrR0wbglglzwdMVfkN+R8N4lvinhLZS1sWs5biT8M4gif+1yFY5dxzay4zHDhscyuPStJmIWSqBbaiMiFtG1uDQf9BYgQ+rvFGURLng05J7Ub1olkgfZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ0PR11MB5197.namprd11.prod.outlook.com (2603:10b6:a03:2d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 11:15:07 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 11:15:07 +0000
Message-ID: <7afed6cd-27d1-4e17-ac6d-c71ac6275488@intel.com>
Date: Thu, 7 Aug 2025 16:45:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Refactor CCS save/restore to use
 default migration context
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-2-satyanarayana.k.v.p@intel.com>
 <34bc7ec7-eec8-4af4-b954-4c12d167a999@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <34bc7ec7-eec8-4af4-b954-4c12d167a999@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::34) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ0PR11MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6e6018-a97b-4537-ef93-08ddd5a3aa0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHNCSzRjb1R1Yk5SSHlLV0l1Zmg0OFBSaXlBeFBCK0FmQmg1NWl4b3Z2Zmti?=
 =?utf-8?B?ZWwyeFB5TzFoeWpNeTNWWkZDVGFERlNaT1VnQkl2TnJBd3pwQml3ZWtCcjZT?=
 =?utf-8?B?Mmt5ZEl1OVZMdzRGdDJ0YndOSGVoZHpnNUhEUG52UEloMnhxd0FGN041eXdE?=
 =?utf-8?B?RUhTdlFGUmhVZENXRjY1elVxNE5ObnBKeVZnd1dWbGFaTmJ0TFA4STB6MTRH?=
 =?utf-8?B?MXJtMk91K0krVUp0bGthSVJYMHJQZGVoQ2p3OVBIV3dXT2s0cHQyMGpoaFh6?=
 =?utf-8?B?NDl4TUdST1BlOHl3Q3FaOHVoVkVwZVBNbUJGVWdkRFZNU0I3YlNKMGhtdzNP?=
 =?utf-8?B?RllEVDBKcHIyV2Jud2VqQXhENSswdDlUZVd3UmIzbS9qMFMycCs3T0ZSc0ZW?=
 =?utf-8?B?WWplazM5c3ljOVdUZlhubG5CdGZvb0FkYUlhM3A2K0hicXlKMmVyT29MVVQ5?=
 =?utf-8?B?UlJQeTFCT01PL2ZicTNMSVlmWW16SUxGNytHaSs1TTZVYVZmbDlHcEVGaE52?=
 =?utf-8?B?Q0FxemJuNGgxb2IrakY3cmtwRlYvV0o1aDBDbnVkcTYvOEZxUkNsK3hiM2Vn?=
 =?utf-8?B?Sy9EdkRwNFZsMC9RUnBkamRTSzlkMGt0Rjd4RmY3alY1YzFzeGxrM2NkczR6?=
 =?utf-8?B?ekcrUzN1aFlCdDk1MCtDaEpGSDBrNngzbXlkV1V1RE1BRmV4L3lpUmo3cmJo?=
 =?utf-8?B?akpXSVA4T3k2RGp2M3RqOXpYRDY1MnhoTDgzZXpTSVd6R2I3bmtjd29SWUZO?=
 =?utf-8?B?VUd1OERCSE95WmZFVityNDdNNmlET3hTZ0h4azNyNlVUODZYZWFnRlduOGFl?=
 =?utf-8?B?K2VHblFVUGpnblJIZ3p5K2pBTk0rRjJNSFFKTTZXdlVlU20wUm5pWFMxczhD?=
 =?utf-8?B?TzhiTXNZclZaZ054MnNVWDBYQXlhSnpUcksySVB4ZEFvVUtRVk1XWGxVYmg2?=
 =?utf-8?B?WVBFa2IwdlgrZXNZZ0YzQ2o0MnBJQUVFVGpTZWFJT2tkTWxNUXdpWUNnY2dm?=
 =?utf-8?B?MGQxS0UzdHJLRVBncDdSUUswbEpKQXI1cVpjVkM2ZXlGdG5jV1B2b20wV2I3?=
 =?utf-8?B?dE80Nm9nUTNXcFEyY3VwREFTOWlMam91cEUyNEVwK0FUNTBhWE4rY21VQXpL?=
 =?utf-8?B?NlNNYmJVcnRoVjFiZ1RlTDRGb3FjeS9lOEFrMEluSS9tM1BNVTBkRmc5VUlw?=
 =?utf-8?B?K0ZZSksvakJkTFAzbHRqbE50QWZQRThFdlZZaU16dm8yaGZ2WGpNYVZPOEF4?=
 =?utf-8?B?NG9XTEtkU0xqcDFqWThQZEtGZFRZOTR6cmhjQ0UrRURLR3M5aWxjeGxmQmlL?=
 =?utf-8?B?cDlNQ2VuZ0xJVHAzcHZXcEZ4eWFqaE9VejNqbW9Fc3hQdnU3bDlZZmVTbHB4?=
 =?utf-8?B?SFRwNUhLUkdXVTVTZmNwS1VBTHgwaElMUUhNOG5YdlpJaTZUT1ZQRkxlVDlR?=
 =?utf-8?B?NUpaU0FsbDM1LzV0eC9TUE1BYW5LL0F0dHA2S2VYUngrK3RLdTY2dDR6WHVQ?=
 =?utf-8?B?QmY1OUwwVzArTXpmNHBRKzU1bWVVYTVPbXhYQ1c2RXRyeXNPbGFZSzRrY1NX?=
 =?utf-8?B?NUE1NU1VWHFzZnduOEhra1MxUS9oWnIrWUlmVTloNWpZaURIL1h5ZXVvVDBI?=
 =?utf-8?B?WVdKRVhnam94R1ZsMDdGVk40VDF6b2xqOVB6UzI3Z0x2Rm1pZm11ZDBVbHJ3?=
 =?utf-8?B?SnI2YzRwMk1WaGJVL2tHUDQ1eEpkY09nODhkU0VUZThhdmNxL3lRVFl2d1Zu?=
 =?utf-8?B?cUk0K0kydDBZWVlaeEdnR3VxZUFYNTlpeitWTXpzQ01ldExZd3BGdlBBN0pl?=
 =?utf-8?B?dVlxSmUxZm5QclJBQlhOQUNGVHFJNDM1dDVvVk9mSjNPT1JLYVh6bnNpcFRp?=
 =?utf-8?B?UzNxY0ZQeWQzS3BINkhYdjFEQjZPM1kwRHJpdDlxU0RWbWZ5cUNFY1l1QkZR?=
 =?utf-8?Q?+jlcS7deRIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEp2dHNubExVMGNOUGpsZ2R0UzhMOTFablBacGlxNHNwZlM2S01Sc1Zoc09m?=
 =?utf-8?B?ZXAzQXBDamE0VktIR3BZRzl3TnpFSi9tMmVJaFJFQ05XRDV6bmM3Q0gzQjhC?=
 =?utf-8?B?b1JEcXp4ZmN0NVh0NkYzY3JBUHNOWkQ0MGlKWUtiU2lhQ3NveU5Zejd0L0ZL?=
 =?utf-8?B?aTlWNGY3TEdYRkd3UjE3R0NLQVFmZTdiR1FIZWQ4YXNXZDFRZlUwYXJidmRF?=
 =?utf-8?B?cEs4ZGk2OEFPOUw5dU1CbU5RQUw4NUQ2bjM4c3c4Rjhod09yU1pOT3JHcVEz?=
 =?utf-8?B?NzJENmlzcXRhTXJ6WEhmaDZMYkJjNlZHcEVaNTdBdHZQZkM5OEZmb1lZVWlq?=
 =?utf-8?B?dW54SUpvQkpCRy80Mnh0RE9BZUc0ZHU4S0wvakJwa1hvbzY3Qk5EeU5YMWw0?=
 =?utf-8?B?M2lDbStiYkZYd1NlbkczUllPRlRyVmZwc0FWUERuUmo3aXpadVI5Mm1XU0pR?=
 =?utf-8?B?ODZqWEMxNktOV21BY0UrSXBVTE4wQWhKbm5UdHY0MXFZMFhLZEVlSW5CSVd2?=
 =?utf-8?B?OGlhbTVZZEFrY0wrMkVwbEdWakdVTjVXOTJjczYrM1lJQSsvN0NtMFNLWUI2?=
 =?utf-8?B?eHAwSCsvNEdWNWJ6aUJtTjJpWDdMaFlxVkNnMjloOWVSRkNpUSsvSGp6cWp4?=
 =?utf-8?B?S2lwY2lTelpzc1RxSTJ1TlpHK0lZVzVZQ1gzdVk4UUl4NWtnVURBM2NoVEJL?=
 =?utf-8?B?VjRCS3R2a1dYYXJ1R0NUaDYyeXU1aHdoT3FSL2FRZWhoVXBIOUdaaEFsZXhN?=
 =?utf-8?B?WHhyb0JWSENsdWJRUno1cktBMVR6UHdWNy9wQS93TzJmR1RjQUVQclhscHI2?=
 =?utf-8?B?MlNwQTA5UVMreXk3ZWJFeEpDUHBSTjU2WnBacFZsekdsQ2YzUnpuQXJwcURM?=
 =?utf-8?B?SlAyY0owdmtwZC9QRU00MGw1Q0QydUhTMG1Sck5YS1BQRzdKV1ljeEFrN2NR?=
 =?utf-8?B?VnZMQThONStDZGVDTnhNSThsZ3NoVmF6NWx2ekQ1anhrZC9hcU1ac3didTFR?=
 =?utf-8?B?N3VleDhoQTJZUXkzNWIycUdQMGR2WjV4c3B1VUIwNDFLbWh3M1k3NENDRUtY?=
 =?utf-8?B?V3VoS3c2a2pzaTBUM045Q0FNUEk5VkpMRndSVDBIRTBPTlBoZFdWd0d4Z1o2?=
 =?utf-8?B?SW96ZTN1S0NKZnpTZlBaY0E0dXM3NWs5TmdHQjg0b2hPODROOERCN2NMUVJK?=
 =?utf-8?B?b1U5MmQvcnhOV2FKbnNqcE9QU0NiWDA1b2JBRXA5T0JvNXNTVW4wQndzdWND?=
 =?utf-8?B?eHFPS0V6YXk0ZDJUbVBuOXg3Z2tsMHAyODlGV2VYUFc2aVBRYmR0dkNRWXNN?=
 =?utf-8?B?UHVuZHVSZ1hlcDVxanBXeHVlY1pXZk56ekFQRzhHRUl2dnUvb1VIL2htb3U1?=
 =?utf-8?B?WVF0TEJ2QXJKOEk1TFlocFlRZjBIcVZKZ3lYa04yUFpreTBZVWZDYW9BSWVC?=
 =?utf-8?B?ZWRZZWFRLytaeUNxL2FRMlBCcW9KVVRPM0dBRWdJWU9JYUdoZnJaVWExVnY1?=
 =?utf-8?B?dmJXRXoxd1FESWM3L3M4NjBnSDZBZnpZRkZQTWpyTHNUUDh2U2k1Q3BmUWF2?=
 =?utf-8?B?b2QwWUxnbnhsOGplSGYwSDVrc2RENWsyZElENWVVcWdIaklSblVYQm8xbnR1?=
 =?utf-8?B?TUU2RHpEaXF6RW1JUTU4ZXdPclNWdjlhTzVNYVhnRmcveURJUXRtNzNRcHgv?=
 =?utf-8?B?MGYrL0tlYWorZUVhc1M2eFZlTWRNRmU0aEdZN0xxcXh1Q1VnOFN5d1NJZ3dI?=
 =?utf-8?B?R3ovenZ1aU9tQmhLWS81U2hyaGZmbVkxTXlLNXpiOHZ5TUtHNWNhVzRCV1BY?=
 =?utf-8?B?WW1IZDR6bHYyNG9UVm50OTNOcXhaeEpzMGlYSVcrd21SVURnQVNKQXRuM2NM?=
 =?utf-8?B?L3M1bU9odm1kT1ZEYXZMcTVIYjlEUHMyNUZLcy90eTY5d05kQkJiMForUjlI?=
 =?utf-8?B?YVBHdmF1VjFnZkhJSWY1Z2FtNlEwd3ExbFY0cDV1a2RjSjlsUk9mVFhFR3hL?=
 =?utf-8?B?cXJLT0M3cnFhNUc4M0Y0TUZmdmMzalRUTXp3blBoSjEydkVqcE9aYWUwNHI1?=
 =?utf-8?B?Mm1xMTNCZlVHSHFkb0szaWlNMllYQ0p2VGFvMFQ4S1YvN1NFM05xNTFtT2xq?=
 =?utf-8?B?M0FJNjczS1VvTWlaMVBvSWlpRUpUc1dLVzlYZ1Bvbk9vc3RzUDBFOVROaGt0?=
 =?utf-8?Q?KntYlloKccxoeh3fLW9exMc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6e6018-a97b-4537-ef93-08ddd5a3aa0a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 11:15:06.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NltHyKjjn+r5FesBX6b1ot4szSW31+OvnI6GZiRLCGc/ki8PLnUujUS9RBnuU5jMosTwlIIG5GnfpeNuV2h6gPo1IoTSC5vLULyFx0ongN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5197
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



On 07-08-2025 00:20, John Harrison wrote:
> On 8/6/2025 1:29 AM, Satyanarayana K V P wrote:
>> Previously, CCS save/restore operations created separate migration
>> contexts with new VM memory allocations, resulting in significant
>> overhead.
>>
>> This commit eliminates redundant context creation reusing the default
>> migration context by registering new execution queues for CCS save and
>> restore on the existing migrate VM.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> ---
>> V2 -> V3:
>> - Fixed review comments (Matthew Brost).
>>
>> V1 -> V2:
>> - Fixed kernel-doc issues reported by patchworks.
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
>>   drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
>>   drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
>>   5 files changed, 43 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/ 
>> xe_migrate.c
>> index 3a276e2348a2..7d3c7c4e2185 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -960,14 +960,14 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate 
>> *migrate)
>>       return migrate->q->lrc[0];
>>   }
>> -static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, 
>> int i,
>>                    u32 flags)
>>   {
>>       dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | 
>> MI_FLUSH_DW_OP_STOREDW |
>>             MI_FLUSH_IMM_DW | flags;
>> -    dw[i++] = 
>> lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
>> +    dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0])) |
>>             MI_FLUSH_DW_USE_GTT;
>> -    dw[i++] = 
>> upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
>> +    dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0]));
> Is it worth keeping a helper function here to abstract out future 
> changes? E.g. "xe_migrate_lrc(ctx) { return ctx->q->lrc[0] };". Using 
> "q->lrc[0]" everywhere seems very like magic number usage. It is not 
> obvious why that is correct given the very generic naming.
> 
> 
Fixed and sent new version.>>       dw[i++] = MI_NOOP;
>>       dw[i++] = MI_NOOP;
>> @@ -976,7 +976,8 @@ static int emit_flush_invalidate(struct xe_migrate 
>> *m, u32 *dw, int i,
>>   /**
>>    * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
>> - * @m: The migration context.
>> + * @tile: Tile whose migration context to be used.
>> + * @q : Execution to be used along with migration context.
>>    * @src_bo: The buffer object @src is currently bound to.
>>    * @read_write : Creates BB commands for CCS read/write.
>>    *
>> @@ -987,7 +988,7 @@ static int emit_flush_invalidate(struct xe_migrate 
>> *m, u32 *dw, int i,
>>    *
>>    * Return: 0 if successful, negative error code on failure.
>>    */
>> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue 
>> *q,
>>                  struct xe_bo *src_bo,
>>                  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>> @@ -995,7 +996,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>       bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
>>       bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
>>       struct ttm_resource *src = src_bo->ttm.resource;
>> -    struct xe_gt *gt = m->tile->primary_gt;
>> +    struct xe_migrate *m = tile->migrate;
>> +    struct xe_gt *gt = tile->primary_gt;
>>       u32 batch_size, batch_size_allocated;
>>       struct xe_device *xe = gt_to_xe(gt);
>>       struct xe_res_cursor src_it, ccs_it;
>> @@ -1078,11 +1080,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>           emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>> -        bb->len = emit_flush_invalidate(m, bb->cs, bb->len, 
>> flush_flags);
>> +        bb->len = emit_flush_invalidate(q, bb->cs, bb->len, 
>> flush_flags);
>>           flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, 
>> src_is_pltt,
>>                             src_L0_ofs, dst_is_pltt,
>>                             src_L0, ccs_ofs, true);
>> -        bb->len = emit_flush_invalidate(m, bb->cs, bb->len, 
>> flush_flags);
>> +        bb->len = emit_flush_invalidate(q, bb->cs, bb->len, 
>> flush_flags);
>>           size -= src_L0;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/ 
>> xe_migrate.h
>> index e81ea6b27fb5..9e20da6d58c2 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -124,7 +124,7 @@ struct dma_fence *xe_migrate_copy(struct 
>> xe_migrate *m,
>>                     struct ttm_resource *dst,
>>                     bool copy_only_ccs);
>> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue 
>> *q,
>>                  struct xe_bo *src_bo,
>>                  enum xe_sriov_vf_ccs_rw_ctxs read_write);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 44aaf154ddf7..5e8126ca8e27 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
>>       xe_pxp_pm_resume(xe->pxp);
>> +    if (IS_SRIOV_VF(xe))
>> +        xe_sriov_vf_ccs_register_context(xe);
>> +
>>       drm_dbg(&xe->drm, "Device resumed\n");
>>       return 0;
>>   err:
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/ 
>> xe/xe_sriov_vf_ccs.c
>> index f0ca2a9b2bb7..a87f39eae4dc 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -8,6 +8,7 @@
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_exec_queue.h"
>>   #include "xe_exec_queue_types.h"
>>   #include "xe_guc_submit.h"
>>   #include "xe_lrc.h"
>> @@ -168,7 +169,7 @@ static int alloc_bb_pool(struct xe_tile *tile, 
>> struct xe_tile_vf_ccs *ctx)
>>   static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>>   {
>> -    struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
>> +    struct xe_lrc *lrc = ctx->q->lrc[0];
>>       u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>       u32 dw[10], i = 0;
>> @@ -183,13 +184,12 @@ static void ccs_rw_update_ring(struct 
>> xe_tile_vf_ccs *ctx)
>>       xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>>   }
>> -static int register_save_restore_context(struct xe_migrate *m,
>> -                     enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>> +static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>>   {
>>       int err = -EINVAL;
>>       int ctx_type;
>> -    switch (ctx_id) {
>> +    switch (ctx->ctx_id) {
>>       case XE_SRIOV_VF_CCS_READ_CTX:
>>           ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
>>           break;
>> @@ -200,7 +200,7 @@ static int register_save_restore_context(struct 
>> xe_migrate *m,
>>           return err;
>>       }
>> -    xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
>> +    xe_guc_register_exec_queue(ctx->q, ctx_type);
>>       return 0;
>>   }
>> @@ -225,7 +225,7 @@ int xe_sriov_vf_ccs_register_context(struct 
>> xe_device *xe)
>>       for_each_ccs_rw_ctx(ctx_id) {
>>           ctx = &tile->sriov.vf.ccs[ctx_id];
>> -        err = register_save_restore_context(ctx->migrate, ctx_id);
>> +        err = register_save_restore_context(ctx);
>>           if (err)
>>               return err;
>>       }
>> @@ -236,13 +236,14 @@ int xe_sriov_vf_ccs_register_context(struct 
>> xe_device *xe)
>>   static void xe_sriov_vf_ccs_fini(void *arg)
>>   {
>>       struct xe_tile_vf_ccs *ctx = arg;
>> -    struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
>> +    struct xe_lrc *lrc = ctx->q->lrc[0];
>>       /*
>>        * Make TAIL = HEAD in the ring so that no issues are seen if Guc
>>        * submits this context to HW on VF pause after unbinding device.
>>        */
>>       xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
>> +    xe_exec_queue_put(ctx->q);
>>   }
>>   /**
>> @@ -258,8 +259,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   {
>>       struct xe_tile *tile = xe_device_get_root_tile(xe);
>>       enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> -    struct xe_migrate *migrate;
>>       struct xe_tile_vf_ccs *ctx;
>> +    struct xe_exec_queue *q;
>> +    u32 flags;
>>       int err;
>>       xe_assert(xe, IS_SRIOV_VF(xe));
>> @@ -270,27 +272,25 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>           ctx = &tile->sriov.vf.ccs[ctx_id];
>>           ctx->ctx_id = ctx_id;
>> -        migrate = xe_migrate_alloc(tile);
>> -        if (!migrate) {
>> -            err = -ENOMEM;
>> +        flags = EXEC_QUEUE_FLAG_KERNEL |
>> +            EXEC_QUEUE_FLAG_PERMANENT |
>> +            EXEC_QUEUE_FLAG_MIGRATE;
>> +        q = xe_exec_queue_create_bind(xe, tile, flags, 0);
>> +        if (IS_ERR(q)) {
>> +            err = PTR_ERR(q);
>>               goto err_ret;
>>           }
>> -
>> -        err = xe_migrate_init(migrate);
>> -        if (err)
>> -            goto err_ret;
>> -
>> -        ctx->migrate = migrate;
>> +        ctx->q = q;
>>           err = alloc_bb_pool(tile, ctx);
>>           if (err)
>> -            goto err_ret;
>> +            goto err_free_queue;
>>           ccs_rw_update_ring(ctx);
>> -        err = register_save_restore_context(ctx->migrate, ctx_id);
>> +        err = register_save_restore_context(ctx);
>>           if (err)
>> -            goto err_ret;
>> +            goto err_free_queue;
>>           err = devm_add_action_or_reset(xe->drm.dev,
>>                              xe_sriov_vf_ccs_fini,
>> @@ -301,6 +301,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>       return 0;
>> +err_free_queue:
>> +    xe_exec_queue_put(q);
>> +
>>   err_ret:
>>       return err;
>>   }
>> @@ -319,7 +322,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>>   {
>>       struct xe_device *xe = xe_bo_device(bo);
>>       enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> -    struct xe_migrate *migrate;
>> +    struct xe_tile_vf_ccs *ctx;
>>       struct xe_tile *tile;
>>       struct xe_bb *bb;
>>       int err = 0;
>> @@ -334,8 +337,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>>           /* bb should be NULL here. Assert if not NULL */
>>           xe_assert(xe, !bb);
>> -        migrate = tile->sriov.vf.ccs[ctx_id].migrate;
>> -        err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
>> +        ctx = &tile->sriov.vf.ccs[ctx_id];
>> +        err = xe_migrate_ccs_rw_copy(tile, ctx->q, bo, ctx_id);
>>       }
>>       return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/ 
>> drm/xe/xe_sriov_vf_ccs_types.h
>> index e240f3fd18af..1add0541aed8 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> @@ -41,11 +41,11 @@ struct xe_sa_manager;
>>   struct xe_tile_vf_ccs {
>>       /** @id: Id to which context it belongs to */
>>       enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> -    /** @migrate: Migration helper for save/restore of CCS data */
>> -    struct xe_migrate *migrate;
>> +    /** @q: exec queues used for migration */
>> +    struct xe_exec_queue *q;
> Should this be 'migrate_q' or some such to identify what its purpose is? 
> Just calling it 'q' is very generic and open to use by other things 
> (accidentally or deliberately).
> 
> John.
Fixed and sent new version.>
>>       struct {
>> -        /** @ccs_rw_bb_pool: Pool from which batch buffers are 
>> allocated. */
>> +        /** @ccs_bb_pool: Pool from which batch buffers are 
>> allocated. */
>>           struct xe_sa_manager *ccs_bb_pool;
>>       } mem;
>>   };
> 

