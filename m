Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135ACC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 23:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC4110E111;
	Fri, 14 Mar 2025 23:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LNXDnkUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7699210E111
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 23:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741995972; x=1773531972;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=2o7fZhg8n3ja21Lq+/CG138dahboGDhSlnfVNg9tlRQ=;
 b=LNXDnkUL5p6g8j5KEAukfdQamO/7Kuqdz3pVUYwM1oZrbXlXc9ywDvtK
 pC3481rtSuAaI3jUW+VnbXJwKGMHLkDj9NRqUovQTAXFFvCd5vcL0/dHi
 W//hROJVMhz4Uc9qIXouwAtQFKHwPwmCxDexHQWrwwHe8eOhdi6UgzpK1
 C8XTy36y/0FxyATwDMlFfeVaOcBVPmLmJshHta/08mFsmcdZuZTramcBk
 UzWfRSY1OV2En9gBb8+B2NrKfdJP4upaSBGDIYkxU+EmJrZBr4etyTtA3
 GbqU6mQnONzyfTPAMnZLZIwWTJgRqJrbQCx6m4CM49Es67UtsL4lVOfZp Q==;
X-CSE-ConnectionGUID: 0qU6VvAHRZW+4Z+dMS1OSw==
X-CSE-MsgGUID: sZL7zuH9TeqHQDOIawVxuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43200337"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208,217";a="43200337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 16:46:11 -0700
X-CSE-ConnectionGUID: p+fT0GTpTuKQazyE09XGBQ==
X-CSE-MsgGUID: NXng6jlBSMeFhpGdMlwjgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
 d="scan'208,217";a="121610315"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 16:46:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 16:46:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Mar 2025 16:46:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 16:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rbm8af0fnOFjB00zBLZdFV7omzxNDl5JWkVA0531g2ACzKr4/jD12Pusxg9cbhDtEMTTdsPYDEbkkNG1AygPLU4YDJldtTaxdQ77oFG7xfsCLWECq//R7uMEWRelH8WubXCQ518VXlgVrX6+HiSdheGtX9+i18idVlEaUru1carBG/usS4I/Ci5Ahw0/39+UHJUcl/DVn8/Lq4ateDeAoednZhmy7Dl442XNY90MIpHlLi5FZjjniLiBTxBgciXMzoqAbpuC5InSYHXUMsoHt6kyAMTFiJr4/hMY7Z3rdVqajYIYfkVgDUm04htUW0YwxHE8iwbjTpx5oVoogfKQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISXDdvMZfTfUQ20Y7cP/h2OCe4JwLdtZZw/d6FQwhik=;
 b=eHX45ZKBSbeYpvWNASOX3LYbtlumWvLwWHfUi7Sw6mu9yB33GriKY9VdiTVpTGFVifiBBeymr3C4yQq2u8ZVWYjYPda1+h6Kk8VUS/8vOChh3wnMLKAfOrfS3ftTPC8Anli/Fl+mk8vTmuHqcRt3EKnrHJ9TzAIVvyBaDZnHKsIuxOs94ng4pr+oNi6sbJ6iRTurCGfCF1MZmeK+NDMc0zkVt9Hn3Skjko24POjQMhm6MoI5c6mRt+2oTfZCOUeUMx2lK4nFms3XFDWAxvy7iWMlkMocQLEvvq7usFax7tqZnKzhaKdIfdM4UNMlkRDPDT9fW1sdUPfOHWzlKWcUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.29; Fri, 14 Mar
 2025 23:45:52 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 23:45:52 +0000
Content-Type: multipart/alternative;
 boundary="------------AGHBrvWmmfK0i4p3PJPKJLKA"
Message-ID: <4b91723b-d291-4a8d-ab92-68f7df253ce6@intel.com>
Date: Sat, 15 Mar 2025 00:45:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-3-tomasz.lis@intel.com>
 <1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com>
X-ClientProxiedBy: MI0P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::16) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|MW4PR11MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 62051b03-1b57-4d39-de6f-08dd63525aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RC9kbWlDS2lrclF4czlGNVZ0eklMNFZCZTZsbm1SNDdkdHdGTzRaSzhqL2FY?=
 =?utf-8?B?QlAyc1BudzdaYTVybGVtZVFNUHpjVFJsZm5TZ2VwZjAwN0dETVdORlJ0QmZk?=
 =?utf-8?B?ZVMrY2RCQVowTldqMEtPMFY3czVKamx3SG00bnROM09HbVk4Y1J0MEs5R1ow?=
 =?utf-8?B?RFZnUHlBdStBaHI5aFczUk1Eb3dtOFR4cjQ5a2o0dGIvdllDcktPT3lxQ2hT?=
 =?utf-8?B?ampheXdvM2FUMWtOT0l6azFPQ1JkUlF0d0xUZi9DSWt3czZSRklVYUJDcmVr?=
 =?utf-8?B?WDBBbjBsUmdyWEJlVUE2WThJWER1d0FLOS9BM21uMm9YU0pqYWZHNEdqdEdZ?=
 =?utf-8?B?RzFZVWlqa3R4Qy94NHlROEhpZzdSQjFhS1NweGNhVHdkc204ZVdnYXdJOHRo?=
 =?utf-8?B?RnRZY2xMNDUzYVJQWXhKOHVtU3BjeFczQmhvTWNiREM3UVpSdEpmUzlKU2lt?=
 =?utf-8?B?QkNHd3hIN1JxQ1dNdENOOUdsa2k0Y2J5T3J1Mi90YUJ0cWZzZEc4bGlDcjhj?=
 =?utf-8?B?TXQyVkdscWRHVmVTRStpTWR0NjFkWjBQZkRUeFpYdFR2WUFEc3J0Q0pmYnJU?=
 =?utf-8?B?NVNJLytFOWJaTUswQUV1clFhNWRnaTRTY0ZkS2FVTGZvcFloanlQRS9GSEY3?=
 =?utf-8?B?cU9hY0ZSb3dDUnNHMXcwNW54REZTTzA0T2IvV1l0UEVRWFVaSlY1eFUzaEp6?=
 =?utf-8?B?THlYYlhlOVByamh3Q1FMWWw0MForODJjTmFVQTNBTE14K1MzZGZ3NjRPRzFi?=
 =?utf-8?B?RmQ2SFprWVlkVDR1U2czNmY1S3Z5TkFtelNPbkQ2S2RxZDJnN2pWQndrZXhx?=
 =?utf-8?B?VmQ0eGVMN21vOXJYYmJsR21ETVFLQTJBNUhucjFSOGJSZmEwV2dqVWQ3V2p1?=
 =?utf-8?B?OWFncDR3c3hIZmoxVHMyQlRDNjNXbGFjckU4S1ZLQXZTNm9udVZGdmZUOU5P?=
 =?utf-8?B?dzFHVzFQN0ZVd1dsM3cyY2hNdG5IdndWSzl5UUJCQnd1eSszbmxKK0NWL2h0?=
 =?utf-8?B?WTY0SDAzRnQycDFvT0xhKzlTTTk4OFF3KytxUU8zQnJ0R2gzUUYwK1QrMHZw?=
 =?utf-8?B?Q0lMaCtWbzdRYnFoZ1VsSVQzZ0Z5bjhLT1F3T3RCUVVGcWRlSWY4RnRPMDM5?=
 =?utf-8?B?dnBza2dpZDZLRWpOenR0VkxWV2dCVnM4VHpZZnRQMlc2d3RYdDh2NmZXeGd5?=
 =?utf-8?B?ZWt3UElkMWlCWmY4ajg4WEU2TkduWVRUZDZZTmNGakFheU4zamRsSFN6eEQv?=
 =?utf-8?B?MlVtMXZMdyswMjhjVm5JV2o1TlNzV0VjWS9BbkgyUS9UZnVrdG1mQ0pUcWZL?=
 =?utf-8?B?RUFGaVJUbXRiWlZ5YVJseE8vMVhyUG1WTnBwYTNpSWFoRENreTdJOFNlYUxO?=
 =?utf-8?B?Tm9aM2hJSHlRL0Q0eTVSZGF4cXF6WDJDT2ZFL0xJbmg1VUk3MldCN3lwUVJX?=
 =?utf-8?B?dnNLQXF5bHRBZ2Uwc3JvU25hcERJMVhHME9WdmZDNmZZTHVPNkQ3cWxjWW5n?=
 =?utf-8?B?UEVscXZYTURlTTF0UlhhUlpONEZDUHhiMmxRajdoRW1FVU9Zd25YTmFOclZh?=
 =?utf-8?B?bUVqS2VHUVlUeERnR1l0RyswbWZKMlorVEZpWVdDQ2RtcFFKSitTOU9LaGJk?=
 =?utf-8?B?cVhNcFlGaWpJVW9hMndkWmcrVW1rTkx2NWZXazIrdnUxNXgyRXQ1cDZ0RFFG?=
 =?utf-8?B?RHR4NW94bk8xWWxRTEltcHRQVGt6alMwKy9nR1RudXAzQ05oRytoRDNaRVA4?=
 =?utf-8?B?dTB2OVdXc2JlZWk0RytJeUVZaSszQ3c0dVNCZXZ3MGVCWUhtTzJ6SllycXAx?=
 =?utf-8?B?YjhzRmZmVE9SNGdvbDhvcW5NZHpGYnl3bGthVUZzSUdZd3pPeW16SVpYZXB3?=
 =?utf-8?Q?RwKLfXsh6uig/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0o0OVpoclB5MkVvV25uR1NxZ3EzcjRQNE1lWFRZZWJNWnJ6bUpjdUZQdVVN?=
 =?utf-8?B?Z2RNMG9Ua0F5UW15TXQrb1hMSit3NXBjRWhzcXg0WU9PdGt0U2JCazFwQ2Zh?=
 =?utf-8?B?TUIwRzhEdlE1M1ZybGJXQXVkNXRTb0Q4M2MvejJVSkd2ZFlTNkw0MGFzK29Y?=
 =?utf-8?B?ekY5REVTK3gzdThPU2NZdFRQVXdYSS9kbTlqeUVZM1lYTVcwQmRPa3hoclc4?=
 =?utf-8?B?VUZiRGZtVUJ3bU9SaDRoWkF1eUU3YURmVVJkTWhDUjRpTVcrZC9jQjZMTW50?=
 =?utf-8?B?UGYxdTd2K1M0TzJ1ZU1Fb1plblZRaGNZUlNDWHRUT1U1N2dvOGxoR1pvTHlG?=
 =?utf-8?B?cEZQSUNzRTJ3ZS9zQ21vM21pMWhjTWxKeFNBZHlGL2twL2hRL0I4UVhUMjBK?=
 =?utf-8?B?WmNBRnQvTGVja1E5TlRmZlFsc3dxdnVRYi9oQ2dJZzVWdFl4am9BSTMrUU5o?=
 =?utf-8?B?TWdiN0h0eHdRUGd5N245VHR1eE96eGg3SkVRK2xpWWh5UmlBK2diSHFGSEtp?=
 =?utf-8?B?NERoendLYXNQTjczMEduZmh1WE5YZHRSWEJGR3ZKQkh5ZGMwbk1lR3QwTUpE?=
 =?utf-8?B?aUY2aHpPd1FGc21xb29MMWFoVGxyMmZ2cHFuWEZDVmJYZ1hTZk13YVlHakpa?=
 =?utf-8?B?QVpGa21iTC8vckgrVzBVRTgyVExvMEg5MFd2bWtyZS80L05kSlltMGo5aGdh?=
 =?utf-8?B?SzVIQldYd3pEaVlQK3F4ZHZMSU9hN1gwMlpJSDVpTW5yM0YxbUcxVzV3UVl3?=
 =?utf-8?B?aVN4b0xEMTZWRDUrVUlhdHBqWWZIOEhBdTF3azErNHJCd1J0cG9aeThIK29I?=
 =?utf-8?B?a25RSTZ1N3AxekZheC9IdG5PUDBmM3VCaVRoWit0b2RiWEpPaVRZVi90dUtr?=
 =?utf-8?B?NnBuTEZzcHFSOUNoRlJMVmhXQUxkZFUxNkYyZ0xhajJ4U0diR21yMmFSb25B?=
 =?utf-8?B?RE9VM2tia1RPeDdScUo1Q0xBaVZ6U3NHYXR5OGU2K1NBM1RZUmxZZGpCa2tI?=
 =?utf-8?B?VU16TW5URDRadXhNYnNKcTdMcTJoMG15ODEvSHFyZ1lFUTRUR1J3R0NIU0J1?=
 =?utf-8?B?SDAxSmY4dmlVTzVSdE0vYWt3MzQ5T1dVQWs2bFAzVVRPUG0vczh2TFlMUk5Z?=
 =?utf-8?B?ei9XUTluaHFUUGovYlBITkExbUVTcVdCTVcvVDNMU21HSmYvNVA0b0ttSmpI?=
 =?utf-8?B?VWxJbG1CNndqOVQ4M2pmdEM1a3pRR3A1QjdqZWQ3UGplZGpmMjZlMDlHMnNM?=
 =?utf-8?B?UE9kcTkxRzE2Mk12K0pKd1FjTTRKbTdVNVVEUFdaMGxqcjlEVjZSY0M3R21y?=
 =?utf-8?B?L20wNmxXejNGcG5BcG8waUQ1SzF5UTJqS3N6ZitiK3paNVBHL2h1dktBVnNL?=
 =?utf-8?B?MmJmOEY1VEpsL3VTeWpaemVHb3hZM3d2ZDdiMHlSNEhxcWlJb0xvMW9pUUhV?=
 =?utf-8?B?UENmSlAyaTIrUGMrQVRwRmlqbmhFQVRkZ1Q5cFJzaGdXejdPdGlyOTZiZTRN?=
 =?utf-8?B?ZUxiaWRXeUpsWDBKSXZqUHlQWkF4NURtR2pnMGZ5dmpJWDN2MkVLOG44UG0x?=
 =?utf-8?B?UGZ0dWF4QWYvdm9pdGUwU1FSY28xMTFCZ2d1T3U2MEd4NWFxWEdXc0pHWStN?=
 =?utf-8?B?VXdtTjNYU2NFelBCcGtaZG13TkJqTkpQa0k3cUNxYkRBSURWYVV1T0E5N0FX?=
 =?utf-8?B?QmFDb0U0UjhQc2s1Y0xaSTh2U2N2V0xseHI5bzQ5ZFhzd1d4Z09ieVR6UFk2?=
 =?utf-8?B?Y0hHMEpnVlRtbDMvMWU2a3J5NUpTMDc5RTkzQy80c0Iwc2taNDRDeFI5bFlr?=
 =?utf-8?B?UWZ0WHE4SHRSMmJRcXhsYk1XSXBqYkc5ZjMzSTgra1hSb01RbG5kQ2F5WGE5?=
 =?utf-8?B?TWNjTHFPMGxtYVlicDZoUFVkUHRMbExGdmFBUkVRemVLL2tadDJnVUVQdytI?=
 =?utf-8?B?VVUrQWFUMlp6K3dxdThCMzBQVGNhNXY5ZGtoWlZWUk5KVWdyVS9ZTGZ1SUN0?=
 =?utf-8?B?V0lHVWZoSzhmMHl4b2s1ajcxcUdITHNsMjVwMFcvYVh2UWQvMHRaMjFwd0NH?=
 =?utf-8?B?MVA2RG1odEpNT0RvUEluTERtRk05MkRpNVI2b2hGTEEyNEJheGNwMVA4Mzh1?=
 =?utf-8?Q?TQIY3mVTPEz8TvVhrqM/ucABa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62051b03-1b57-4d39-de6f-08dd63525aed
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 23:45:52.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVn7APiG8R8KNLIk9C1/AstRk/ilCyOvD8sR3eVHwDdvBFFoRheNuFNTd2MauUl9ToXz5QjEgqiUZp1edXZqCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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

--------------AGHBrvWmmfK0i4p3PJPKJLKA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14.03.2025 19:22, Michal Wajdeczko wrote:
>
> On 06.03.2025 23:21, Tomasz Lis wrote:
>> We have only one GGTT for all IOV functions, with each VF having assigned
>> a range of addresses for its use. After migration, a VF can receive a
>> different range of addresses than it had initially.
>>
>> This implements shifting GGTT addresses within drm_mm nodes, so that
>> VMAs stay valid after migration. This will make the driver use new
>> addresses when accessing GGTT from the moment the shifting ends.
>>
>> By taking the ggtt->lock for the period of VMA fixups, this change
>> also adds constraint on that mutex. Any locks used during the recovery
>> cannot ever wait for hardware response - because after migration,
>> the hardware will not do anything until fixups are finished.
>>
>> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>>    after querying; improved documentation; switched some warns to asserts;
>>    skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
>> v3: Updated kerneldocs, removed unused funct, properly allocate
>>    balloning nodes if non existent
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++
>>   6 files changed, 216 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 5fcb2b4c2c13..6865d1cdd676 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -489,6 +489,169 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>>   	xe_ggtt_node_fini(node);
>>   }
>>   
>> +static u64 drm_mm_node_end(struct drm_mm_node *node)
>> +{
>> +	return node->start + node->size;
>> +}
>> +
>> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
>> +				struct drm_mm_node *balloon_fin, s64 shift)
>> +{
>> +	struct drm_mm_node *node, *tmpn;
>> +	LIST_HEAD(temp_list_head);
>> +	int err;
>> +
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	/*
>> +	 * Move nodes, from range previously assigned to this VF, into temp list.
>> +	 *
>> +	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
>> +	 * ranges from use: first reserves the GGTT area below the range for current VF,
>> +	 * and second reserves area above.
>> +	 *
>> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
>> +	 * said VF, and inaccessible areas above and below:
>> +	 *
>> +	 *  0                                                                        4GiB
>> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
>> +	 *      WOPCM                                                         GUC_TOP
>> +	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
>> +	 *
>> +	 *  +---+---------------------------------+----------+----------------------+---+
>> +	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
>> +	 *  +---+---------------------------------+----------+----------------------+---+
>> +	 *
>> +	 * Hardware enforced access rules before migration:
>> +	 *
>> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
>> +	 *
>> +	 * drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
>> +	 *
>> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
>> +	 * to lower or to higher address. But we expect the total size and extra areas to
>> +	 * be identical, as migration can only happen between matching platforms.
>> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
>> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
>> +	 *
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
>> +	 *  +---+----------------------+----------+---------------------------------+---+
>> +	 *
>> +	 * Hardware enforced access rules after migration:
>> +	 *
>> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
>> +	 *
>> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
>> +	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
>> +	 * are still tracking allocations using the old addresses. The nodes within VF
>> +	 * owned area have to be shifted, and balloon nodes need to be resized to
>> +	 * properly mask out areas not owned by the VF.
>> +	 *
>> +	 * Fixed drm_mm nodes used for tracking allocations:
>> +	 *
>> +	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
>> +	 *
>> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
>> +	 * overlap; but our node shifting will fix addresses properly regardless.
>> +	 *
>> +	 */
>> +	drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
>> +					   drm_mm_node_end(balloon_beg),
>> +					   balloon_fin->start) {
>> +		drm_mm_remove_node(node);
>> +		list_add(&node->node_list, &temp_list_head);
>> +	}
>> +
>> +	/* shift and re-add ballooning nodes */
>> +	if (drm_mm_node_allocated(balloon_beg))
>> +		drm_mm_remove_node(balloon_beg);
>> +	if (drm_mm_node_allocated(balloon_fin))
>> +		drm_mm_remove_node(balloon_fin);
>> +	balloon_beg->size += shift;
>> +	balloon_fin->start += shift;
>> +	balloon_fin->size -= shift;
>> +	if (balloon_beg->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +	if (balloon_fin->size != 0) {
>> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +
>> +	/*
>> +	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
>> +	 * We can re-add all VF nodes with shifted offsets.
>> +	 */
>> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>> +		list_del(&node->node_list);
>> +		node->start += shift;
>> +		err = drm_mm_reserve_node(&ggtt->mm, node);
>> +		xe_tile_assert(ggtt->tile, !err);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_ggtt_node_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>> + * @ggtt: the &xe_ggtt struct instance
>> + * @balloon_beg: ggtt balloon node which preceds the area provisioned for current VF
>> + * @balloon_fin: ggtt balloon node which follows the area provisioned for current VF
>> + * @shift: change to the location of area provisioned for current VF
>> + */
>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
>> +			      struct xe_ggtt_node **balloon_fin, s64 shift)
>> +{
>> +	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
>> +	struct xe_ggtt_node *node;
>> +
>> +	if (!*balloon_beg)
>> +	{
>> +		node = xe_ggtt_node_init(ggtt);
>> +		if (IS_ERR(node))
>> +			goto out;
>> +		node->base.color = 0;
>> +		node->base.flags = 0;
>> +		node->base.start = xe_wopcm_size(ggtt->tile->xe);
>> +		node->base.size = 0;
>> +		*balloon_beg = node;
>> +	}
>> +	balloon_mm_beg = &(*balloon_beg)->base;
>> +
>> +	if (!*balloon_fin)
>> +	{
>> +		node = xe_ggtt_node_init(ggtt);
>> +		if (IS_ERR(node))
>> +			goto out;
>> +		node->base.color = 0;
>> +		node->base.flags = 0;
>> +		node->base.start = GUC_GGTT_TOP;
>> +		node->base.size = 0;
>> +		*balloon_fin = node;
>> +	}
>> +	balloon_mm_end = &(*balloon_fin)->base;
>> +
>> +	xe_tile_assert(ggtt->tile, (*balloon_beg)->ggtt);
>> +	xe_tile_assert(ggtt->tile, (*balloon_fin)->ggtt);
>> +
>> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
>> +out:
>> +	if (*balloon_beg && !xe_ggtt_node_allocated(*balloon_beg))
>> +	{
>> +		node = *balloon_beg;
>> +		*balloon_beg = NULL;
>> +		xe_ggtt_node_fini(node);
>> +	}
>> +	if (*balloon_fin && !xe_ggtt_node_allocated(*balloon_fin))
>> +	{
>> +		node = *balloon_fin;
>> +		*balloon_fin = NULL;
>> +		xe_ggtt_node_fini(node);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>>    * @node: the &xe_ggtt_node to be inserted
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>> index 27e7d67de004..d9e133a155e6 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>>   int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>>   				u64 start, u64 size);
>>   void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
>> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
>> +			      struct xe_ggtt_node **balloon_fin, s64 shift);
>>   
>>   int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>>   int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index a439261bf4d7..dbd7010f0117 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>>   				start, start + size - 1, size / SZ_1K);
>>   
>> +	config->ggtt_shift = start - (s64)config->ggtt_base;
> btw, is it safe to keep ggtt_shift after we're done with fixups?

its value is always set in `vf_post_migration_requery_guc()`. And fixup 
functions are only called after that, and will never be called outside 
of recovery.

So, yes it's safe.

>
>>   	config->ggtt_base = start;
>>   	config->ggtt_size = size;
>>   
>> @@ -938,6 +939,31 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
>> + * @gt: the &xe_gt struct instance
>> + * Return: 0 on success, ENODATA if fixups are unnecessary
> if you really need to distinguish between nop/done then bool as return
> will be better, but I'm not sure that caller needs to know
I don't really need this. Michal, this was introduced on your request.
> if we need to know whether there was a shift, and thus we need to start
> the fixup sequence, then maybe we should have a separate function that
> returns (and maybe clears) the ggtt_shift

No need to clear the shift.

I did not checked for a zero shift in my original patch. I consider it 
pointless to complicate

the flow with this skip. This was introduced on your request. If you 
agree please let me

know and I will revert the changes which introduced this check. I can 
instead make a separate

function iterating through tiles too, if that is your preference.

>> + *
>> + * Since Global GTT is not virtualized, each VF has an assigned range
>> + * within the global space. This range might have changed during migration,
>> + * which requires all memory addresses pointing to GGTT to be shifted.
>> + */
>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
>> +{
>> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>> +	s64 ggtt_shift;
>> +
>> +	mutex_lock(&ggtt->lock);
>> +	ggtt_shift = config->ggtt_shift;
>> +	if (ggtt_shift)
>> +		xe_ggtt_node_shift_nodes(ggtt, &tile->sriov.vf.ggtt_balloon[0],
>> +					 &tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
> maybe to make it a little simpler on the this xe_ggtt function side, we
> should remove our balloon nodes before requesting shift_nodes(), and
> then re-add balloon nodes here again?

I like having balloons re-added first, as that mimics the order in 
probe, and makes the flow more logical: define bounds first, then add 
the functional content.

What would make this flow simpler is if the balloons always existed 
instead of having to be conditionally created.

Having the balloons added at the end would not make the code easier to 
understand for new readers, but actually more convoluted.

That would also mean in case of error we wouldn't just get few 
non-allocated nodes, but unset bounds.

No reset would recover from that.

>
>> +	mutex_unlock(&ggtt->lock);
>> +	return ggtt_shift ? 0 : ENODATA;
> and it's quite unusual to return positive errno codes...
right, will negate.
>
>> +}
>> +
>>   static int vf_runtime_reg_cmp(const void *a, const void *b)
>>   {
>>   	const struct vf_runtime_reg *ra = a;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index ba6c5d74e326..95a6c9c1dca0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -18,6 +18,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index a57f13b5afcd..5ccbdf8d08b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   	u64 ggtt_base;
>>   	/** @ggtt_size: assigned size of the GGTT region. */
>>   	u64 ggtt_size;
>> +	/** @ggtt_shift: difference in ggtt_base on last migration */
>> +	s64 ggtt_shift;
>>   	/** @lmem_size: assigned size of the LMEM. */
>>   	u64 lmem_size;
>>   	/** @num_ctxs: assigned number of GuC submission context IDs. */
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index c1275e64aa9c..4ee8fc70a744 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device.h"
>> +#include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_pm.h"
>> @@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>>   	work_pending(&xe->sriov.vf.migration.worker);
>>   }
>>   
>> +static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
>> +{
>> +	struct xe_tile *tile;
>> +	unsigned int id;
>> +	int err;
>> +
>> +	for_each_tile(tile, xe, id) {
>> +		struct xe_gt *gt = tile->primary_gt;
>> +		int ret;
>> +
>> +		/* media doesn't have its own ggtt */
>> +		if (xe_gt_is_media_type(gt))
> primary_gt can't be MEDIA_TYPE
ok, will remove the condition.
>
>> +			continue;
>> +		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
>> +		if (ret != ENODATA)
>> +			err = ret;
> for multi-tile platforms, this could overwrite previous error/status
Kerneldoc for `xe_gt_sriov_vf_fixup_ggtt_nodes` explains possible `ret` 
values. With that, the solution is correct.
>
>> +	}
>> +	return err;
> err might be still uninitialized here

True. Will fix.

-Tomasz

>
>> +}
>> +
>>   /*
>>    * Notify all GuCs about resource fixups apply finished.
>>    */
>> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   	if (unlikely(err))
>>   		goto fail;
>>   
>> +	err = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
--------------AGHBrvWmmfK0i4p3PJPKJLKA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14.03.2025 19:22, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 06.03.2025 23:21, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">We have only one GGTT for all IOV functions, with each VF having assigned
a range of addresses for its use. After migration, a VF can receive a
different range of addresses than it had initially.

This implements shifting GGTT addresses within drm_mm nodes, so that
VMAs stay valid after migration. This will make the driver use new
addresses when accessing GGTT from the moment the shifting ends.

By taking the ggtt-&gt;lock for the period of VMA fixups, this change
also adds constraint on that mutex. Any locks used during the recovery
cannot ever wait for hardware response - because after migration,
the hardware will not do anything until fixups are finished.

v2: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
v3: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++
 6 files changed, 216 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..6865d1cdd676 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -489,6 +489,169 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 	xe_ggtt_node_fini(node);
 }
 
+static u64 drm_mm_node_end(struct drm_mm_node *node)
+{
+	return node-&gt;start + node-&gt;size;
+}
+
+static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
+				struct drm_mm_node *balloon_fin, s64 shift)
+{
+	struct drm_mm_node *node, *tmpn;
+	LIST_HEAD(temp_list_head);
+	int err;
+
+	lockdep_assert_held(&amp;ggtt-&gt;lock);
+
+	/*
+	 * Move nodes, from range previously assigned to this VF, into temp list.
+	 *
+	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
+	 * ranges from use: first reserves the GGTT area below the range for current VF,
+	 * and second reserves area above.
+	 *
+	 * Below is a GGTT layout of example VF, with a certain address range assigned to
+	 * said VF, and inaccessible areas above and below:
+	 *
+	 *  0                                                                        4GiB
+	 *  |&lt;--------------------------- Total GGTT size -----------------------------&gt;|
+	 *      WOPCM                                                         GUC_TOP
+	 *      |&lt;-------------- Area mappable by xe_ggtt instance ----------------&gt;|
+	 *
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *
+	 * Hardware enforced access rules before migration:
+	 *
+	 *  |&lt;------- inaccessible for VF -------&gt;|&lt;VF owned&gt;|&lt;-- inaccessible for VF -&gt;|
+	 *
+	 * drm_mm nodes used for tracking allocations:
+	 *
+	 *     |&lt;----------- balloon ------------&gt;|&lt;- nodes-&gt;|&lt;----- balloon ------&gt;|
+	 *
+	 * After the migration, GGTT area assigned to the VF might have shifted, either
+	 * to lower or to higher address. But we expect the total size and extra areas to
+	 * be identical, as migration can only happen between matching platforms.
+	 * Below is an example of GGTT layout of the VF after migration. Content of the
+	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
+	 *
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *
+	 * Hardware enforced access rules after migration:
+	 *
+	 *  |&lt;- inaccessible for VF --&gt;|&lt;VF owned&gt;|&lt;------- inaccessible for VF -------&gt;|
+	 *
+	 * So the VF has a new slice of GGTT assigned, and during migration process, the
+	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
+	 * are still tracking allocations using the old addresses. The nodes within VF
+	 * owned area have to be shifted, and balloon nodes need to be resized to
+	 * properly mask out areas not owned by the VF.
+	 *
+	 * Fixed drm_mm nodes used for tracking allocations:
+	 *
+	 *     |&lt;------ balloon ------&gt;|&lt;- nodes-&gt;|&lt;----------- balloon -----------&gt;|
+	 *
+	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+	 * overlap; but our node shifting will fix addresses properly regardless.
+	 *
+	 */
+	drm_mm_for_each_node_in_range_safe(node, tmpn, &amp;ggtt-&gt;mm,
+					   drm_mm_node_end(balloon_beg),
+					   balloon_fin-&gt;start) {
+		drm_mm_remove_node(node);
+		list_add(&amp;node-&gt;node_list, &amp;temp_list_head);
+	}
+
+	/* shift and re-add ballooning nodes */
+	if (drm_mm_node_allocated(balloon_beg))
+		drm_mm_remove_node(balloon_beg);
+	if (drm_mm_node_allocated(balloon_fin))
+		drm_mm_remove_node(balloon_fin);
+	balloon_beg-&gt;size += shift;
+	balloon_fin-&gt;start += shift;
+	balloon_fin-&gt;size -= shift;
+	if (balloon_beg-&gt;size != 0) {
+		err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, balloon_beg);
+		xe_tile_assert(ggtt-&gt;tile, !err);
+	}
+	if (balloon_fin-&gt;size != 0) {
+		err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, balloon_fin);
+		xe_tile_assert(ggtt-&gt;tile, !err);
+	}
+
+	/*
+	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
+	 * We can re-add all VF nodes with shifted offsets.
+	 */
+	list_for_each_entry_safe(node, tmpn, &amp;temp_list_head, node_list) {
+		list_del(&amp;node-&gt;node_list);
+		node-&gt;start += shift;
+		err = drm_mm_reserve_node(&amp;ggtt-&gt;mm, node);
+		xe_tile_assert(ggtt-&gt;tile, !err);
+	}
+}
+
+/**
+ * xe_ggtt_node_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
+ * @ggtt: the &amp;xe_ggtt struct instance
+ * @balloon_beg: ggtt balloon node which preceds the area provisioned for current VF
+ * @balloon_fin: ggtt balloon node which follows the area provisioned for current VF
+ * @shift: change to the location of area provisioned for current VF
+ */
+void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
+			      struct xe_ggtt_node **balloon_fin, s64 shift)
+{
+	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
+	struct xe_ggtt_node *node;
+
+	if (!*balloon_beg)
+	{
+		node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(node))
+			goto out;
+		node-&gt;base.color = 0;
+		node-&gt;base.flags = 0;
+		node-&gt;base.start = xe_wopcm_size(ggtt-&gt;tile-&gt;xe);
+		node-&gt;base.size = 0;
+		*balloon_beg = node;
+	}
+	balloon_mm_beg = &amp;(*balloon_beg)-&gt;base;
+
+	if (!*balloon_fin)
+	{
+		node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(node))
+			goto out;
+		node-&gt;base.color = 0;
+		node-&gt;base.flags = 0;
+		node-&gt;base.start = GUC_GGTT_TOP;
+		node-&gt;base.size = 0;
+		*balloon_fin = node;
+	}
+	balloon_mm_end = &amp;(*balloon_fin)-&gt;base;
+
+	xe_tile_assert(ggtt-&gt;tile, (*balloon_beg)-&gt;ggtt);
+	xe_tile_assert(ggtt-&gt;tile, (*balloon_fin)-&gt;ggtt);
+
+	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
+out:
+	if (*balloon_beg &amp;&amp; !xe_ggtt_node_allocated(*balloon_beg))
+	{
+		node = *balloon_beg;
+		*balloon_beg = NULL;
+		xe_ggtt_node_fini(node);
+	}
+	if (*balloon_fin &amp;&amp; !xe_ggtt_node_allocated(*balloon_fin))
+	{
+		node = *balloon_fin;
+		*balloon_fin = NULL;
+		xe_ggtt_node_fini(node);
+	}
+}
+
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &amp;xe_ggtt_node into the GGTT
  * @node: the &amp;xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..d9e133a155e6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
+			      struct xe_ggtt_node **balloon_fin, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..dbd7010f0117 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, &quot;GGTT %#llx-%#llx = %lluK\n&quot;,
 				start, start + size - 1, size / SZ_1K);
 
+	config-&gt;ggtt_shift = start - (s64)config-&gt;ggtt_base;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
btw, is it safe to keep ggtt_shift after we're done with fixups?</pre>
    </blockquote>
    <p>its value is always set in `vf_post_migration_requery_guc()`. And
      fixup functions are only called after that, and will never be
      called outside of recovery.</p>
    <p>So, yes it's safe.<br>
    </p>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	config-&gt;ggtt_base = start;
 	config-&gt;ggtt_size = size;
 
@@ -938,6 +939,31 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * @gt: the &amp;xe_gt struct instance
+ * Return: 0 on success, ENODATA if fixups are unnecessary
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
if you really need to distinguish between nop/done then bool as return
will be better, but I'm not sure that caller needs to know</pre>
    </blockquote>
    I don't really need this. Michal, this was introduced on your
    request.<br>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">if we need to know whether there was a shift, and thus we need to start
the fixup sequence, then maybe we should have a separate function that
returns (and maybe clears) the ggtt_shift</pre>
    </blockquote>
    <p>No need to clear the shift.</p>
    <p>I did not checked for a zero shift in my original patch. I
      consider it pointless to complicate</p>
    <p>the flow with this skip. This was introduced on your request. If
      you agree please let me</p>
    <p>know and I will revert the changes which introduced this check. I
      can instead make a separate</p>
    <p>function iterating through tiles too, if that is your preference.<br>
    </p>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
+ */
+int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &amp;gt-&gt;sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile-&gt;mem.ggtt;
+	s64 ggtt_shift;
+
+	mutex_lock(&amp;ggtt-&gt;lock);
+	ggtt_shift = config-&gt;ggtt_shift;
+	if (ggtt_shift)
+		xe_ggtt_node_shift_nodes(ggtt, &amp;tile-&gt;sriov.vf.ggtt_balloon[0],
+					 &amp;tile-&gt;sriov.vf.ggtt_balloon[1], ggtt_shift);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe to make it a little simpler on the this xe_ggtt function side, we
should remove our balloon nodes before requesting shift_nodes(), and
then re-add balloon nodes here again?</pre>
    </blockquote>
    <p>I like having balloons re-added first, as that mimics the order
      in probe, and makes the flow more logical: define bounds first,
      then add the functional content.</p>
    <p>What would make this flow simpler is if the balloons always
      existed instead of having to be conditionally created.</p>
    <p>Having the balloons added at the end would not make the code
      easier to understand for new readers, but actually more
      convoluted.</p>
    <p>That would also mean in case of error we wouldn't just get few
      non-allocated nodes, but unset bounds.</p>
    <p>No reset would recover from that.<br>
    </p>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	mutex_unlock(&amp;ggtt-&gt;lock);
+	return ggtt_shift ? 0 : ENODATA;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
and it's quite unusual to return positive errno codes...</pre>
    </blockquote>
    right, will negate.<br>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 static int vf_runtime_reg_cmp(const void *a, const void *b)
 {
 	const struct vf_runtime_reg *ra = a;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ba6c5d74e326..95a6c9c1dca0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,6 +18,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index a57f13b5afcd..5ccbdf8d08b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
 	u64 ggtt_size;
+	/** @ggtt_shift: difference in ggtt_base on last migration */
+	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c1275e64aa9c..4ee8fc70a744 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
 #include &quot;xe_pm.h&quot;
@@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
 	work_pending(&amp;xe-&gt;sriov.vf.migration.worker);
 }
 
+static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	int err;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_gt *gt = tile-&gt;primary_gt;
+		int ret;
+
+		/* media doesn't have its own ggtt */
+		if (xe_gt_is_media_type(gt))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
primary_gt can't be MEDIA_TYPE</pre>
    </blockquote>
    ok, will remove the condition.<br>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			continue;
+		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
+		if (ret != ENODATA)
+			err = ret;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
for multi-tile platforms, this could overwrite previous error/status</pre>
    </blockquote>
    Kerneldoc for <span style="white-space: pre-wrap">`xe_gt_sriov_vf_fixup_ggtt_nodes` explains possible `ret` values. With that, the solution is correct.</span>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	}
+	return err;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
err might be still uninitialized here</pre>
    </blockquote>
    <p>True. Will fix.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (unlikely(err))
 		goto fail;
 
+	err = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------AGHBrvWmmfK0i4p3PJPKJLKA--
