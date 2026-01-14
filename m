Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5439D3900B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 19:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9610E66C;
	Wed, 14 Jan 2026 19:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKrIHlub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3029E10E66C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768418050; x=1799954050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=2BRtHyX1Q1QThSfraHJFqpuutpchiZf8arE0gm6aEHk=;
 b=TKrIHlubrN+Wg1TOTRTpGgI98Bu4Dlbq8NYHFeX7wfqooQgAVNjrAmEp
 OYvsYYhexxyqFkzow2v00OEiMfp3c0CFpN02IFCPkvaVR/muyB2y/IxYR
 jzxY/CHJ3K1JzwWAwrqLh9Sh81k98dLzo7c3+Iv4jgYChXfFEEGNsM15W
 mXeBEbCL03QvrdFEmLWiIUpcUnArO8V7e4E34WaKWx6EC8q9hWvQo13dZ
 ZVrbKfhkWOuYILbfwaNaR3Msmyop33H1m9iitn/HlPY8prd57pyn02c6P
 oevzrTkXUJoPllvICo7qAQSuzMt0nxTPFYeQ9G/5Ae67+37AgFwYXvuq6 A==;
X-CSE-ConnectionGUID: j8l64o65QWifrhDISMQZRg==
X-CSE-MsgGUID: JIguA9gxTZGFDUVSek1r3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87304931"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208,217";a="87304931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:14:09 -0800
X-CSE-ConnectionGUID: 8JhFQuXmT/aYksMSawT/RQ==
X-CSE-MsgGUID: 47PXPcLFT2ep4G7CYXk8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
 d="scan'208,217";a="204377267"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 11:14:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 11:14:09 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 11:14:09 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 11:14:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGbJmlcosQOGkaIdF1Q23SLZdpD12kvbQHqw9uYEcWVj89oxPpH6moL27MbGB40pZA/HuC1U3qVU7Y1IvCgd0hvJvpIRmvjDR3bLrmUdVwe0Nmem2+dyVtNtbOHyUonOI1amCCvfa5UTiLd4Qpytk8QYLSe6XoFSZREy+9vimQ+NlRUGJco6eSzl1a1WWr/xDOND2inm+8xVL72I+vOjcWaGfOkiqjFUfKV0SPEmJUtudfu1vXQfIqLcCDGR9TJHtXQhWbUZTV81SFR8kP2bd6DU0E293qFlvHVg3HmoJVX/HDmDeF985ebwdKq9j8ZeoHFpBqm0RIyep4GanncRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHYs8kpxOdWOuNluHud2sncY6p/4mgfnSAXtahdN6gc=;
 b=XU25PisWBP9rZmpp1H9lS1aLxHbRCvmXn5mOonePFbmMeGf0IFFPPXNk04PWZX4QOOhcEH/UB18DDZtP9+tsVKaoeZtIMmgXBRxUGZbNB+dLh4Gta/x2nTQHVPxh6PT0/2q+qVOpr7s7Ckd3sWPQmo50+dB+k1iXj4S1CL0pB/8RpMGUyRazCiEZApLzZy0aAcHpprv8/enmyvQvO9Csvm4V3n3zo34ko4a82D1zFggymh1tE1FL5mYdbTMY7Ataeqmysm2VwLyZoirKSkedW6fdeST+N2C5SWY955XpiJxYC3bPUciW1kyANcRkOa3suI1JfvR8sKYLRCttKQzRyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:14:03 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 19:14:03 +0000
Content-Type: multipart/alternative;
 boundary="------------0SsISH9tc5cYI5icc0hePUPD"
Message-ID: <da92c74a-7962-42f6-990e-5c5e00b1be06@intel.com>
Date: Thu, 15 Jan 2026 00:43:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <daniele.ceraolospurio@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260114130015.3917770-4-sk.anirban@intel.com>
 <20260114130015.3917770-6-sk.anirban@intel.com>
 <d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com>
X-ClientProxiedBy: MA5PR01CA0235.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::17) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: df4b7c11-1e43-4217-1fab-08de53a11443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVZINGZPY1BhdE52azF3MzNoZmRVRkl2cnNJMFN0VGRwUWNxcVpBOG5TcWYr?=
 =?utf-8?B?dElBRGg2TlcvOHlKclk5Um1vVjdlYngvZ3NKMHR1cWpzSXpCN0g3NEd5OC9s?=
 =?utf-8?B?RVEycng4MVNCWC9lelIvQmhXVWtiNGFlTEdMbUtIbHprMXZCSElUUSt6a3Jo?=
 =?utf-8?B?ZGU2RWU2MW9iRUd3WlJDbExoV0ozUUlCOE4rb0xwaWV5OFB0eGE0WDNSK3dG?=
 =?utf-8?B?UW5IZFhjK2RGSUExUERHWThxMzRqcWVMSm42b1RrL21MSkdURjd0SWdEdFhP?=
 =?utf-8?B?TjgvNk8ycVR6cGIrVXo5cnB4NjBVVWVTWTNva2YwVWptQnRpWjl1Wk8zdS9y?=
 =?utf-8?B?WnVvSmVQMUNPTHZXZ2EwL2hwejQ5MmYxazlGR2E2VEwyMnc3ZWRCU3pkUFdo?=
 =?utf-8?B?aWQyeUFYWmxtQVJyQmJROXBPdXRMR1g1d210cUZ3c0E3aGx2MXQ0ZHZuQ2ND?=
 =?utf-8?B?YjJjWDM1azhZTFpVSEt4elEyQURhTlc3Y2tsYWNBcnpKVVduSWhlQ0JVMmNs?=
 =?utf-8?B?V3ZlLzA5Vm9kSVpaUzJzQ1ZObGdZWC8zMDdDcS90UlhvT1hTUlVUbU8wNWZM?=
 =?utf-8?B?YXo5QytxbkUyYXpFemx2bUFEZm1KVjllejZXRU9kOXpiTGh6VGRaakxyQnUx?=
 =?utf-8?B?bEJEUVlLbEFHK0JrcS93S1JSUDJSQ1dKYXNGQ1JtRXVhUmdRZkZOVVJzdlZ2?=
 =?utf-8?B?cjJxdE1lY1NFMVYxN0dUODk0SVE2YTkxbUhBYkF1Rm9vYi9GN0hDVXJKeHEw?=
 =?utf-8?B?K1ZJVnQ2VDg1L3l5a0tYWHlBMlA0TG4zbzdRdkhwNng3aHd6UWRsUDlmbWtm?=
 =?utf-8?B?UVUvS2NJTWJrOTVhcUZwbjRJZU5wV0J1QmlxUmlVd2MzdGpyZ3F6Qy9zc1VF?=
 =?utf-8?B?d2JRdHY1MTVyTWpGUjBBM1FhR2ZtR0dXeHFRL1RjdVc1SVpySmNQNWNPMkFv?=
 =?utf-8?B?TlNOTFpxbnV6RzB3aFYxTDlKRjRMVHpRZXEyNjZrZVJXdldqQ1RZcjBaVUxG?=
 =?utf-8?B?YzBUS0lDNE11NkhIekhWc3pXS1FTRXVuZnRyYjB4RWlzaXdIZGh2Z294dFdR?=
 =?utf-8?B?NDlpS1dIY1pKZ0NldW5xMElhbTZxRCtvbVFlMC9RMGRmRHFNT3h3UndhWlVv?=
 =?utf-8?B?aHpvUEZWT3IvRmRQM0lRZnFsUjQ0VjlGZkZ1MUUzSnMwMXRsSmRYZ0FWcWFZ?=
 =?utf-8?B?b2V1NzNEZWcvYUw0YWxqN3EzU1J3VHJsWkxuNy9KRU9aK09tRytDOXZCOWN1?=
 =?utf-8?B?QnFKRlk0TUt5ME1pN1NTYnlNbUFScXR6eUprd2RHZFpkZDNEOElGNEEyOVNH?=
 =?utf-8?B?eHdNWlZmQ1gydi8zVDlXUFQ5T0VOS2FpUHdwd0k5RVlQeEZ6V3BJZkI4M2o2?=
 =?utf-8?B?Y0NlR1BaZWJ1UHdqdUVDMENGazFYUFRFM05pTU1ZekZNcGw1NGx6K3kyMDRM?=
 =?utf-8?B?d3V2Y25EQzdiMU56TFVYd0taMGFzZExkRWxwbWU2Z3N0RklXN0dHU3F6NEpn?=
 =?utf-8?B?R1p1c3I5VFdpcjV6bTAvWWZvVVF6TlltWlJBSWd1MXlqbzRvRWVBcU5YWHI2?=
 =?utf-8?B?TlM5dXFLOTc3V1hIVStLTU1lazJBdUswbDhDV3NKTzJTN09uRFh2eTdMWkFm?=
 =?utf-8?B?TGd3VWMxeWlIQlJYcjNsNnBZRXBXVktscVRUV2pDd2U3dzN2ekVleUUxUllG?=
 =?utf-8?B?OWZ4QXEySjVZWjVwOVFEU1Z3elE3QkRHd2VYWFhOMFZQOXRuSm9WTE0wWVdH?=
 =?utf-8?B?d0dKMjFxeXlwaWFjT0xUUFRjWDR3WC9QbStzU01UQ3JicFBMVGQzMHNocEZ6?=
 =?utf-8?B?dVR1dXVnN2EyVmljKzJjV2cyRzhEaEc2bHN1NW5YZjRpRVNJWXdvQk9ZRkFW?=
 =?utf-8?B?aTExNWtrQWR6V2UxSkNMTnRHcnArTW1JZjg1Z2t1L0JTdnh1dDJyOFd6SHor?=
 =?utf-8?B?SjBXVmRMWlBHVHlQVmYybWZVbEx2eUwvajRSajVvTFJkY3lHZ0JhaVVYUGRz?=
 =?utf-8?B?cWk4SjM1QmExVWdBa0tsdENkN0Q5Vnl6bllpYmhDYmt6czNVVVNDTWJnaSsx?=
 =?utf-8?B?QVd1WVBDVmVuQkhlemUwRU5sQW9IUEgrZE5rTmJXanUvZHNSUFQ2bVk4ZUJm?=
 =?utf-8?Q?XD00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlzeXlMSU5ZWWE5OFM5M2xEbkdXK1M3MW9YazlTRmVWaThPU1EzTGt4akFJ?=
 =?utf-8?B?anliUldIekJxMVMvMDJYVGtVOUROZ2Q5eTdGV0xNcDlBOGRMbHRQMy8xTUpa?=
 =?utf-8?B?K3Rsdy9YQXpjMmdhUjV5MWw4VGFKV003ME5LelM0NFlyb3BtNnVXVEtENW00?=
 =?utf-8?B?YVUyQlFKT1I1YkJWQXlTYUkyb0lycCtucXo2ZGV3dmJzbEYrNExiU0NxRjZK?=
 =?utf-8?B?WXIyVzNpQ2FTZ1NDamxYK2NtQnUxaEkyb000SUlMNHpGZHFjU3lrMHpZOEx1?=
 =?utf-8?B?eHRmY3VOZGRBbUFBZDREVVhGYzd2eUlvZmxJWUkrY3l6bEdNNlBNNXUvV2x0?=
 =?utf-8?B?WmVVSkJMRVNVaXIvVHpnWTh0dmsxTkxmUC9DNDJwRGRqK2ZOQXVSblpZVlZB?=
 =?utf-8?B?d3l6bHQvMU9WQnprVEhyZHVpN1dFU252OGVpcmFLd3BUc25DTERJMEVKc3k0?=
 =?utf-8?B?WVJxb2Nva2czaHROZnVsa09rdWlTRGZkQzRueGFsS0syeWhxMk1UMWJ1dHgz?=
 =?utf-8?B?T01uV1NocWhTam5YWCtwdWFmMUZHZlBNMHVvSFMzb3lOWiswbkxjcHB2UWY2?=
 =?utf-8?B?cm5sL3pQcjN4KzNxUTFjemo5QjRXdHJjYUZpYWVPTmtJazBlbVVZYXM0a0tM?=
 =?utf-8?B?Y0ViZ0d6RnNYSlZ6L1praUhRYWJ6NHVPdXF5V3FMWitPTzJma2Vsc0g1N0tE?=
 =?utf-8?B?MkR2eXhITEtIVHAxOFA1RjcvN3FzeXZXSlNoVTM5b21mSGJ4Z2xFR3pubmgz?=
 =?utf-8?B?QWRqY1QvdVdOcEFsaGthN3VnMUcxcS8zUE9acFlGamo5Uk5wNlR5aVFxeTY1?=
 =?utf-8?B?U1BrdXVKcVZDVlV4TWsyVUVRY1JwVGlsL05uZ2E5RVRiTTAzZ0tPcDdwOXFL?=
 =?utf-8?B?NUFORW9GaFg0aUpsWlZLMDErZFAxNW9XQ252OEpxdmN2ZDUzZVAyUXBJM1Uy?=
 =?utf-8?B?eExRaEFXdHh3RlhSYm9oWVNaYXh0a1Rvb2tIZTBWaTNlS1d3Z0lsVDBGMjJ1?=
 =?utf-8?B?WTRMM2NndTNJU1FSZkJFc3ByVUtzTG5mMk9Hc2VtakpwaHBqU1IrMUFaL0o2?=
 =?utf-8?B?eVVnSERoWUJ1bVRwQXFDSnNDRTI4YWpLQ0xVVEhIU053ZThtRTd2ZEpkQkdR?=
 =?utf-8?B?VSt4b1Z4YjNDZUVSNVZkUmh3VkYzQ0x3bWQxSCtGZGg0R2dUWFFacUNac2Ey?=
 =?utf-8?B?OEEreHpQblRGV0ZyQWFOeWVSNWR2TFhjVWFkUVFMM2J0R0Y2eTIzc2VkNWFm?=
 =?utf-8?B?NjVxRDdLTkV2U0EyU1A4RjNhQnFraS83YmdmK2s2YjBQV2doQTRudDZ4ZDZQ?=
 =?utf-8?B?S2ErallmOEJmNEZnNzVWMmltYzRKeDRoMDRxTS83SGRWR25XZ3VaRkxNaHZ3?=
 =?utf-8?B?UXZjUE1XaGZtc0MwWjF5ZTNjZzlQUFNieWhucnUxcldWK09pRStqN1ZxSWs4?=
 =?utf-8?B?aUdVOUUveXFqaHU3cmFjQ01Kblhza0hBeWsyb0V3T0RDcEN2Z1ltRjd2Nkox?=
 =?utf-8?B?enVtb0VBQ2c3bnJ6REhvNTllWkhOaWdOMjZtSStPQko5enJ3RmNuODNwM3lR?=
 =?utf-8?B?bkdBWTJnbFFkVkxqSXFqQitLVzJxbUd2RE1iWW0vc2U4OUN5YlZ4TWt2R3k2?=
 =?utf-8?B?TXRaM2VhR0lNRVBoVHgxd29KbkRaMkg4bnU2clMwR3JHNmlJMzJpdjRQU1BQ?=
 =?utf-8?B?OXNjTzJqdTlCRmpWZGg3M1Q4M1RNOUREOCs3czgwTE1LTlBZTFZaVjRBRmhY?=
 =?utf-8?B?UmpwbVAxSmFlaElWSS85SG5IWDJYZEh2WDFyaW5wMnQ5QUVjNlR5M1ZjZ1hU?=
 =?utf-8?B?RVNONElqTmZtMjFQT2t3aU9jSUkyYW4xeWJuWXFRY3hKcjlvWEFndUpPRjI3?=
 =?utf-8?B?WE5SQUpTWGZRb3htOUkyaTZvMENPZVNrNElsUk0zYjlCQ1VVZEZaMThMWkFr?=
 =?utf-8?B?S1VzajlNN2dLTWlSdHB2by9SSnIwandRY0xTWEVtelh1QnAxc2lTblFONWFB?=
 =?utf-8?B?RTBIRHJ0SGdBd0pKekVKQXZSRFVVZ0VFcUhQZ3Z3ajJoYmFFNXh0d0pIY1hm?=
 =?utf-8?B?d1NJV2Y4UWlxejM2bXVqSGtCTXpwTUJpYW5ReUxQdmk2amR6ZmNFV2UvSGFI?=
 =?utf-8?B?c3dFaFZHclBrZDEzRUQ4S3ZSczlhU1RyTXRyZFNyUFAxcEhESmdtNzJGVTky?=
 =?utf-8?B?Y2tIc3liL2J5eTZ6Skl0aWQ0ejA3K0V6emNrV0pzNDl3cmI3UlVUcUdWRWlD?=
 =?utf-8?B?Y1pzRkFKQVlSeEhPSzJkMDNML3RqV2l6aVNtTGtxVGVkaVYrenJlVExTb1JE?=
 =?utf-8?B?RFNuL25sZFdzcVJ2ZktCc3FNOWk3TE5zWFVSdDEzL1JndG4vSlVZZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df4b7c11-1e43-4217-1fab-08de53a11443
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:14:03.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3suOFtlH/CEA+WDZ+safEL9UMOG3GuNRBrtFY56fkCXWnA5n/BtCgwKASrP2t1y8Jz/2JwWCD3qqiL0DwIAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

--------------0SsISH9tc5cYI5icc0hePUPD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 14-01-2026 09:45 pm, Nilawar, Badal wrote:
>
>
> On 14-01-2026 18:30, Sk Anirban wrote:
>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>> idle flow and verifying SRAM handling completion. Without this, reset
>> can be issued while SRAM handler is copying WOPCM to SRAM,
>> causing GuC HW to get stuck.
>>
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>>   drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
>>   3 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 87984713dd12..2f38fd231083 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,9 @@
>>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>>   
>> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
>> +#define   GUC_BOOT_HASH_CHK			REG_BIT(31)
>> +
>>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>>   
>>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
>> @@ -83,7 +86,12 @@
>>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>> +
>> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> Fix the indentation.
sure, I will fix that.
>> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
>> +
>>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 44360437beeb..b5ec08a16aaf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>   	return xe_guc_submit_enable(guc);
>>   }
>>   
>> +/*
>> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
>> + * SRAM save/restore operations are complete before reset.
>> + */
>> +static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>> +{
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	u32 boot_hash_chk, guc_status, sram_status;
>> +
>> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>> +	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)
>> +		return 0;
>> +
>> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>> +	if (!(boot_hash_chk & GUC_BOOT_HASH_CHK))
>> +		return 0;
>> +
>> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> To function RC6 properly re-enable Idle flow after reset.
I am noticing that the idle flow gets re‑enabled after the guc reset.
>> +
>> +	sram_status = xe_mmio_read32(&gt->mmio, GUC_SRAM_STATUS);
>> +	if (sram_status & GUC_SRAM_HANDLING_MASK) {
>> +		xe_gt_err(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
>> +			  sram_status);
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   int xe_guc_reset(struct xe_guc *guc)
>>   {
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> @@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
>>   
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   
>> +	if (XE_GT_WA(gt, 14025883347)) {
>> +		ret = guc_prevent_fw_dma_failure_on_reset(guc);
>> +		if (ret)
>> +			goto err_out;
>> +	}
>> +
>>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>>   		return xe_gt_sriov_vf_bootstrap(gt);
>>   
>> @@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
>>   	return 0;
>>   
>>   err_out:
>> -
>> +	xe_gt_err(gt, "custom GuC reset failed with %pe\n", ERR_PTR(ret));
>
> Rephrase the error message.
>
sure, I will check this.
>
> Thanks,
> Badal
>
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -73,3 +73,12 @@
>>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>   16026007364    MEDIA_VERSION(3000)
>>   14020316580    MEDIA_VERSION(1301)
>> +
>> +14025883347	MEDIA_VERSION(1301)
>> +		MEDIA_VERSION(2000)
>> +		MEDIA_VERSION(3000)
>> +		MEDIA_VERSION(3002)
>> +		MEDIA_VERSION(3500)
>> +		MEDIA_VERSION(3503)
>> +		GRAPHICS_VERSION_RANGE(3000, 3001)
>> +		GRAPHICS_VERSION_RANGE(3003, 3005)

Thanks,

Anirban

--------------0SsISH9tc5cYI5icc0hePUPD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 14-01-2026 09:45 pm, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 14-01-2026 18:30, Sk Anirban
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com" moz-do-not-send="true">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 37 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 +++++++
 3 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 87984713dd12..2f38fd231083 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -40,6 +40,9 @@
 #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
 #define   GS_MIA_IN_RESET			REG_BIT(0)
 
+#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
+#define   GUC_BOOT_HASH_CHK			REG_BIT(31)
+
 #define GUC_HEADER_INFO				XE_REG(0xc014)
 
 #define GUC_WOPCM_SIZE				XE_REG(0xc050)
@@ -83,7 +86,12 @@
 #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
 #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
 #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
+
+#define GUC_SRAM_STATUS				XE_REG(0xc398)</pre>
      </blockquote>
      <font face="monospace">Fix the indentation.</font></blockquote>
    <font face="monospace">sure, I will fix that.</font>
    <blockquote type="cite" cite="mid:d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com">
      <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">+#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
+
 #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
+#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
 #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
 #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..b5ec08a16aaf 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -900,6 +900,35 @@ int xe_guc_post_load_init(struct xe_guc *guc)
 	return xe_guc_submit_enable(guc);
 }
 
+/*
+ * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
+ * SRAM save/restore operations are complete before reset.
+ */
+static int guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	u32 boot_hash_chk, guc_status, sram_status;
+
+	guc_status = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_STATUS);
+	if (REG_FIELD_GET(GS_UKERNEL_MASK, guc_status) != XE_GUC_LOAD_STATUS_READY)
+		return 0;
+
+	boot_hash_chk = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_HASH_BOOT_CHECK);
+	if (!(boot_hash_chk &amp; GUC_BOOT_HASH_CHK))
+		return 0;
+
+	xe_mmio_rmw32(&amp;gt-&gt;mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre"><font face="monospace" style="white-space: normal;">To function RC6 properly re-enable Idle flow after reset.&nbsp;</font></pre>
    </blockquote>
    <font face="monospace">I am noticing that the idle flow gets
      re‑enabled after the guc reset.</font>
    <blockquote type="cite" cite="mid:d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com">
      <pre wrap="" class="moz-quote-pre"><font face="monospace" style="white-space: normal;">&nbsp;</font></pre>
      <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">+
+	sram_status = xe_mmio_read32(&amp;gt-&gt;mmio, GUC_SRAM_STATUS);
+	if (sram_status &amp; GUC_SRAM_HANDLING_MASK) {
+		xe_gt_err(gt, &quot;SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n&quot;,
+			  sram_status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 int xe_guc_reset(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -909,6 +938,12 @@ int xe_guc_reset(struct xe_guc *guc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
+	if (XE_GT_WA(gt, 14025883347)) {
+		ret = guc_prevent_fw_dma_failure_on_reset(guc);
+		if (ret)
+			goto err_out;
+	}
+
 	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return xe_gt_sriov_vf_bootstrap(gt);
 
@@ -931,7 +966,7 @@ int xe_guc_reset(struct xe_guc *guc)
 	return 0;
 
 err_out:
-
+	xe_gt_err(gt, &quot;custom GuC reset failed with %pe\n&quot;, ERR_PTR(ret));</pre>
      </blockquote>
      <p><font face="monospace">Rephrase the error message.&nbsp;</font></p>
    </blockquote>
    <font face="monospace">sure, I will check this.</font>
    <blockquote type="cite" cite="mid:d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com">
      <p><font face="monospace">Thanks,<br>
          Badal</font></p>
      <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre"> 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 5cd7fa6d2a5c..ff2efc7a68cc 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -73,3 +73,12 @@
 15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
 16026007364    MEDIA_VERSION(3000)
 14020316580    MEDIA_VERSION(1301)
+
+14025883347	MEDIA_VERSION(1301)
+		MEDIA_VERSION(2000)
+		MEDIA_VERSION(3000)
+		MEDIA_VERSION(3002)
+		MEDIA_VERSION(3500)
+		MEDIA_VERSION(3503)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
+		GRAPHICS_VERSION_RANGE(3003, 3005)</pre>
      </blockquote>
    </blockquote>
    <p>Thanks,</p>
    <p>Anirban</p>
    <blockquote type="cite" cite="mid:d3fe7cda-3428-49a6-9104-9b3b729e0c9c@intel.com">
      <blockquote type="cite" cite="mid:20260114130015.3917770-6-sk.anirban@intel.com">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0SsISH9tc5cYI5icc0hePUPD--
