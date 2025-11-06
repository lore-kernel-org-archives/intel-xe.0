Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386F9CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 19:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EA410E9C0;
	Thu,  6 Nov 2025 19:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgfhM0q9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E810E9C0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762457301; x=1793993301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XNEQpCCqwNhD0AzJTljcULb122DEcNxsyPlGkeANnME=;
 b=CgfhM0q9Cakv06fqALy0qsJf6utdNy+6kiYrM95bijKpMMX0PupDDB/Z
 2GmnDXDzfrVxz2Mdx5D4Pb0UUeM2DkqE0nUhl39nV++PN/RnZg0UoAUXO
 +XLW7wufatA7gVJ1WigOgkhRAicNuxukCzuCsf6PQgL09k5x0tS5qTX0G
 A96ghqjqkkDC5Lrl45/ZY01Gcv2rfUN2O0bXJnrytiDnZ3jf8BBiRaXtY
 1t6Zflv6rwdQRFRzq8VB3HVqrEIXBlnXSVqzG9TOmg5+nGOWgnE1g8lgC
 bIUcG31bGD7jX+zqifXIS4HTkrC4xkA5wj+CgFapH+hrUUGPr5Pv79yvp A==;
X-CSE-ConnectionGUID: bf0ZZdm/S/++SndGneRNVw==
X-CSE-MsgGUID: 9cR/ME+CSfW+EeDGNlT/Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64703021"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64703021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 11:28:20 -0800
X-CSE-ConnectionGUID: G1hpekurRIuw3lE8MJoplg==
X-CSE-MsgGUID: 14XWIKX0SVKx2plQWzkQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188285608"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 11:28:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 11:28:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 11:28:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 11:28:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2EFINBpV0DM80X08Uh0FyFx8a+wZqkHa1h0oVHVqVxRfAyzemg4PVkw9+eKeSBhTseqyXxE1ieAGxKWCnMybI7syn5YFOg40pl/lAEvmHmnY3KK+XLDGLKg7BEmNMozmBJLk113Tkgshf7gdYJZUGD6OtgZ3vK2CxijdlOquPO+n+Btl3gZiCbqjmUmZKEyEelxIU27wG95s5Y/cEawBHs6ing44ksUCO2JvSWwnC2IyJ8/X3dxUK3Y5ZC3Wb3E/uYmqhXPzf6HoBYMlHjUJsjupT57HezdA/6QZwnMFIZwKBXHMWoXDP0VRjvr3yJEamZYm0eyjwnuY1SZctaiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4EF8puiUDRfuaBJ3Eqqct3kAV1RTaD0M3fKbhefNT0=;
 b=Aihml7C59wmZNNn0ihKK37UtPMRK6QBMIX+lp4ZSs18+dn/OrFMdHHYjOBtWQQVAlWcUdcLNQLS5L+fPXNxdpCPSOvh40X7IMy72RMmxtsw542M9/4FAyvLPxmoFaHyzCPiTTkb+N5R7FXABXcjZeSqNF5pYIDw/rhjGKAgqW7qF+3gvlBltMZYBc73cH/Wp6qDzaeMuUGQDB+9MOoJn2zkxtXfwS5XJ8lkg886BpiEDHy3ES7VRs49kJsl7THxuAV/ruWoEqWWJwW7q+Mp0jTEuCHHAAM0pwBzdV4e1baPC79qQuyqnnbi0+Sh0Ielg29EhKeJBFKJz0eqQi8Sjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 19:28:15 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 19:28:15 +0000
Message-ID: <0cd12e26-3679-43bc-8a40-72f9415bc183@intel.com>
Date: Thu, 6 Nov 2025 11:28:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/uc: Change assertion to error on huc
 authentication failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20251027214212.2856903-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251027214212.2856903-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::45) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 714b8926-03d6-47a0-10bb-08de1d6aa1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmxNdFd0UUk0RnZaK2NvMytscXJNYkx4ZGNVTnZXVDRkOW11dlN6NGJ2eVJr?=
 =?utf-8?B?RVIyYnpJU01sZjFlQnBtK285U3pkVUs3c05yN09jM0duZ2FCSGR2N1IzeVhZ?=
 =?utf-8?B?NlNwaDJuYXNSWlRvMDJwZXlJSlBTZ3BJdVE0bVpaV3E2MFdFVDZ5WW9DRUFK?=
 =?utf-8?B?NkR2N2hSSFByQXVrZHZjUFkzR0t0ZmFBa2dld1JiUHVWZjJlcG82MDZIODJs?=
 =?utf-8?B?Skw5SHNLT0pVVW93bmtCTFNqU001UjUwaWFXMFFmcCs2a1FSbHJiUjd6K1Vm?=
 =?utf-8?B?NDc0Qy93LzV1UVlBenRYL3lKWjU0VWJPclRweGoxL2NBSTJ3ZFBQRHBIZmhZ?=
 =?utf-8?B?WktIcVozbk9KK0psRDVKRjg4SWtMN2VldDUzWmFMbEpXaDUxcXRqWUs2VVRj?=
 =?utf-8?B?a0kyTzhlSWxxeEwzL3NOeHYzektLT3FNT3FGMStWY3FQWlNOV1MwR1lCWTM3?=
 =?utf-8?B?NlFTeVQ3Q0N4VFhrbVMvMExhN0pyemFNOHhIRGE0dHRUcXRCSE5TTlhyYkpw?=
 =?utf-8?B?eThhOGpXMGVZUURwWmV2aG1CNXpVN1lxZ2VkWURXQXh5bEFQNkRhWTNPZHBx?=
 =?utf-8?B?aEhmVkUxakwxU05uYmliZHB0YUFTNlZrUGZsekZSSituMzlHc2JodVNnYmF4?=
 =?utf-8?B?VWlaVFozWkZxaXpSY1FmUEtoOStOaEVOQTczRk90UEI2ekg0Q2J5by80bkNN?=
 =?utf-8?B?V2UxYlV3QjBnV1dUUUk5VEYwbHd3TnQwYTFpT043TDQ4VXo4SWtySkRSc0pv?=
 =?utf-8?B?SE9IRkRDVFo2Q05VeGFoNnkwVGlFWEovVldBOVliYlVybEVmcjV4UDVvZFAy?=
 =?utf-8?B?VUJNVUo1MHV1SUdqVDk3SS9hRERLRjY5cFZUZHRldlQzRHJwMXBqc09OSGhO?=
 =?utf-8?B?UGhldi9GOE1iRXQvVUtuYWxjNDNGWUI2VlkwL0NXbGJwNWZEOXJBYnJTN0xa?=
 =?utf-8?B?Ykp6SW0wcVdEYU9PY0xZL0VoOUplcE1WVEZjWW1VaXBjSEJZTkpKcWNiZkRs?=
 =?utf-8?B?S1ZGeHhuQzdZNmFXRUlkY2tkNUtxMldnalM2amwzUHdNOEhvNTZJa0szLzRr?=
 =?utf-8?B?eDVPTE1TR0hSNzFDT3QrSnlVYUxhazArSnNYNVExYlVTRmVSU3loakc0UnVp?=
 =?utf-8?B?em81RUllSlYvdEwvdHlzbGhhRG90QllTWjUrOWorZXhzNC96R2l5ZTJTLzRh?=
 =?utf-8?B?Nm53YWJiM3hMWE1mN0FzMkZiMHdIL2ZTRTBqTk1oOVJ5eXl4YWRySUpUYWtH?=
 =?utf-8?B?d1ladmVBRDBWTDJva25VZ3F4Z2JrQ05MaDQ3TXQ2QzR4VTRHRWIydlhKVXQw?=
 =?utf-8?B?M2RUOWd3em5MMHdKeXdNQkNhZmZ3ckErS2srYllOY2hEbnM2TmpEMUNnVnVV?=
 =?utf-8?B?K0JJelhVZ01IQlJJaXozeVQrd0MxbVpTekFiUVJGVHhrUU5RMUtwTmFtUnF1?=
 =?utf-8?B?em1ERXdmanUvNThKcWo4TDhUZ2Q1Vy9xaUJ2R2pWYVFwM2lvWnF1ejd6L3Jh?=
 =?utf-8?B?aExGSjFGNjRHR3dwSUh3dUVaSWxoSk1LL2lJSzlmMnVMbmhiSU9FMVpsVXFI?=
 =?utf-8?B?T0psUXFQMWU2MTNpNlU3aDl2Z1lBZTFCa2p3OFA2dE1FbzJHMnl5VVJFcVlh?=
 =?utf-8?B?c2lHdUVZL3JLaDl6QnA0dXF5azdyRUpyK2hWYjVmd1FpTDNpTll3cU0vcS9h?=
 =?utf-8?B?eHQ4dWVGYnRrcFpPam4wYm9BdVpUSnFPZWFIZElHUWdyLzBGZ1dpYTVtOVZq?=
 =?utf-8?B?THJPaFRmdmdMYmM1NWM1VzVKU01FdGp1L2w2QUtWVEt0SGovb014REE5dkw2?=
 =?utf-8?B?Qit6SGFxaEhPREtWaDNhRFBweWpmSFhGelE2cGpjV1p0dTZsUTc2UkpaMlBE?=
 =?utf-8?B?NGhoTTd6ZkJibklpUHpCekdtU3JTV1gxWjBYckRQZjZMdVpvUERwUVFTTVdJ?=
 =?utf-8?Q?XamHXXSj+n7uESIhFLG2VxOQA3rN/tD8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1JMYllUVGxFeGlUOGZtMVRBVk1YZ05XUldlR1RLS1lRMXBMczB6ZzFMZS9X?=
 =?utf-8?B?OFZTSHgraURkNnNUaE9nWnVIQ3JsRjZRNmdDSU1YZkRSSy9waVZlcHV5Qk9S?=
 =?utf-8?B?UkZNdHpIUkdXc3NuMlFnSUZ6ajMxMHdNOS9lSzZ1U3pDREpPMXdZbE1XdVpk?=
 =?utf-8?B?Wm1GTG5rbUs5RE83WjhTT1kvc3BrY3VkbGN0d2FCczBtMXpGUnF5UU5NZ2Ew?=
 =?utf-8?B?NjdmWHBSejdnTHlrYzVJMjBkb2ZTZ2Z6MVJabEZxczUzYkZQeVEwMDRMQThL?=
 =?utf-8?B?ejNTS3FIMGVxMUIzWVRhKzVsT2ZhbzA3M0oxLzZWT0VMZ3lJR2VoQ3dxQ3gr?=
 =?utf-8?B?dWthM3hucEY2MDllci83N1hLNm52M0E4QkFobi9MQXJaVWpXdUhBVWREeWx2?=
 =?utf-8?B?dERuZVNadnB0TDkrc2pURENNUUVrUTN1VXN6VWtLRzlRY1VVM1k2eGxXOEpG?=
 =?utf-8?B?V0pXWGIxdnNUMzdiRlNwYXRKMWgwUUdFdzRESGZiNDdoZW1wdWhnbS82dmhy?=
 =?utf-8?B?SHZCa3cyNjNHWWJxMlFMc000UGtIRkdabHpFQUxXZ3d5Q2tyUFZ0bTBrT0Jl?=
 =?utf-8?B?M1lPR2hhbW1MVlpoYTNkU2R5RERNSGVBU3A2N3ora05UeEpPNzRvZ0Jid3ZR?=
 =?utf-8?B?T0FnSUxTRUppM2x2L3FTNjdWMHlPZHh1SHRRM3Z3NUFRVXNFVXc4VG5pS0hs?=
 =?utf-8?B?a1EvQ0twaGF0Q2JOY0FxNVFQclJ3STBwZVlyajNKYU5UR0FnWVA4cmVaenUw?=
 =?utf-8?B?d1ZlWWVHbEdYVHRhWTNpb05OSmIxOGRXQm1ORXZwZjJxRHQwRTV5d2xxVlZC?=
 =?utf-8?B?WW1oclUvZkVJT21FWEEyVFFjR0JwUS9ORnJxQVlnVFhZVjVpZlRIaWJNeXA4?=
 =?utf-8?B?TlQxUGY2TVFzVVM4cHVrV2VJQkgrSllwd0NHQTNSVE04NFVma0pNNFJIMU1v?=
 =?utf-8?B?NDJXUDNFYUlHRWs1TE0rMWxRQXhENWN6Tm5aUDNYcHpiTGt5QXVGYVpNQkZX?=
 =?utf-8?B?b3VmSk0rK2QwODZWaDV6ajBHd1VFMnZaRDM2aTdVcjc1S1RIVnJNd2FobEFh?=
 =?utf-8?B?eWQ0akQwRnZVQ0pYenJmcStLeERJQkU3V2tRa21RR2VVZ1VxcnFwR0NwL0VI?=
 =?utf-8?B?dGNpODdibllYY08rZGlaaFY2cDRGcm5jS2lIaitBM3EzbExhYzBjVFRoNmNI?=
 =?utf-8?B?ZVl6b0JtaG82RElDQnZKN0JRSXZtSDMxbElhUGN0OHBXdzB2YXBFbm05c1VG?=
 =?utf-8?B?RFcwQWxmRTRPNjFQVGlpcjZLbEpubEFmZEJiM01OekdIUnZiQks0Snh6ZnZh?=
 =?utf-8?B?ZlY3WHd5Rk5TL3UzN1BRZllCOXNtWWx1TnltWXJMVHVqN0VRQUJwYmVLS3No?=
 =?utf-8?B?UUl0NEVQNUVublE4QXozczJEZlNCSGxJb0RUVDlxeWFnTW5Ed3M5VEhrdm1M?=
 =?utf-8?B?Nk1uRHdLdUovU2QySjduem1SWFBESVhEemY0VnQ1cGVHQTNqWU5oWFhrVlJa?=
 =?utf-8?B?SDU2UXkzL3lmRU0ySmFwaFZpeDZQVWNmbUZPN0MzMittczI3U3haYzhhQ2Nr?=
 =?utf-8?B?SXpOM2hVNk1HWjBNRFgzakF3WWJ2RWdvV2Rod2tWa1ZiUnNlbEhjeFRqMmE2?=
 =?utf-8?B?ZVdNa1pEcjZqQnkyTDNoRDh3TFRodDdBY3NSc0tTRkkwaUpWNFpOL3BWTllS?=
 =?utf-8?B?Z1lqV1E0WU9CM3BLY0N1dkNLdmkyL2Y4OGt3WkErUEk5UXN4L0YvT0VKajVR?=
 =?utf-8?B?aTFUMEIyVU9FMGQvQXdCNG1oK2w1S2c0bW9uOG81dkxHZ3lZSnlxSTFPZ3J3?=
 =?utf-8?B?MVZWV0FsR29mdy9oazlpUXNBRG1CdlAzeUU4dCszRlF2NVlDNkJVMWVKWmcr?=
 =?utf-8?B?bVFrTUxaRVoxNi9YdGU3cnlLbHRidU5oeVhoU0FGZEZGbEJiV21SS0xvajhI?=
 =?utf-8?B?c0FrazBqYUQ1VUhBU1AxREdBUEIvbVQ0TjNQYmNVaHdRWDRrK3pqMnQrUDdi?=
 =?utf-8?B?OGN0a2s5OURUNW5hY1p3RlRYTkdvanVQRThhZE1Yc1JSZHYydFp1QmE2Z2sw?=
 =?utf-8?B?ejFXdFZ4L05PUjB2NVhsMGhRbHl3c2VKSld3WnF6Y3I3ajB0aDNldUt3THJ6?=
 =?utf-8?B?MXhKMDF1ZmhuNVJJNDd0S2RPWWNlSi9XQjJkbVovZzk5WGp3bzJtUWM3WkNZ?=
 =?utf-8?Q?FDmFcHRi5KhSKEBRD6wFrnY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 714b8926-03d6-47a0-10bb-08de1d6aa1ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 19:28:15.0844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1oBAS8JHadj7Lvq4yN3MpiarHfJ9Cx/PGwO50B6WhCFrLRUIeRrovH/ELLW7V3tAYq41SqKvoa6En1ln8dpk4E+46rTonKNQquTsWzYl3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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



On 10/27/2025 2:42 PM, Zhanjun Dong wrote:
> The fault injection test can cause the xe_huc_auth function to fail.
> This is an intentional failure, so in this scenario we don't want to
> throw an assert and taint the kernel, because that will impact CI
> execution.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
> History:
> v3: Add return code check, update message text
> v2: Update commit comments
>      Remove warning comment
> ---
>   drivers/gpu/drm/xe/xe_uc.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..40aed4a66bac 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -218,9 +218,12 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   
>   	xe_guc_engine_activity_enable_stats(&uc->guc);
>   
> -	/* We don't fail the driver load if HuC fails to auth, but let's warn */
> +	/* We don't fail the driver load if HuC fails to auth */
>   	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
> -	xe_gt_assert(uc_to_gt(uc), !ret);
> +	if (ret)
> +		xe_gt_err(uc_to_gt(uc),
> +			  "HuC authentication failed (%pe), continuing with no HuC\n",
> +			  ERR_PTR(ret));
>   
>   	/* GSC load is async */
>   	xe_gsc_load_start(&uc->gsc);

