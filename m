Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E7DC25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 06:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4382D10E545;
	Thu,  6 Jun 2024 06:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YG2esZVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A30510E545
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 06:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717654015; x=1749190015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pjd46+r5RvsrZKeDV/b1RZFRza5dZ6As3O3iGnHuxaM=;
 b=YG2esZVpBd8UNwiorRiZa4o9cMsuwztTyiypuTAZt8zzQhZqN2Bcf1qD
 UYnzvPJZZIYMR8hFGsYQjsB44z1pm7PhGKlvNh/XMbS+z+pSRLYwSai6H
 q9Vifcr21PWWcC67Y+AKxI8gB4QaZRPjPqhAVWUclY7ranJJB2jCEHUWD
 Ra5G8XTg1f5HKNladenyNnQZfJrvcu8cFWPyBv0+ZoUy/2+FXwJ7sMEO4
 ggTESQf7HKOiPH++G79U6viK1opaCbCqMiWd17/xGbcU3MXWeyk4wvasU
 uUYwDDNSrWWFXohXqR5xLg0TkJ+YcOr8Zfp9z73D5E2AJEKP0/8slF1Fs w==;
X-CSE-ConnectionGUID: tTJKQkfwTjSbLHozkYij/A==
X-CSE-MsgGUID: GFkfnjn7TJiAdEhym9F17Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14523425"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14523425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 23:06:25 -0700
X-CSE-ConnectionGUID: xnGUHJ/iTMGLjqF7rN/+nw==
X-CSE-MsgGUID: Yub2N6pNSEeQoeYIsiL38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="75324417"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 23:06:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:06:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 23:06:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 23:06:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 23:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC7k3x9wgHqPJZS+/kD2teowzLxOoDIrj0lZuU3cqa/K4y8q+Jq7awkYuUt1a8GKlSygXu7Zae0qhdisF93sJRjm6tZQK3PVLpPzlGF+V+Oml4TtQt+6oFRpKBDkq58AayklvpitfDrsjwPcBsiIS30iwcWKsalkGgAE+tGAIYaZrArdC4mWv/4iq7+wlMw0r85nshVKwLbf63lfdymN0TDy2JpWsNLMj8GM2wqfnDYhM9cIq26SBmTfhZnHdyyI0cCrO/PYNKF/CiXLj6DOQyDoNZhgm9O4O09jbsgXRh7Oecd53Z7nMzlfKL53M+EgQ75EwuBdHasHMoz9TLx8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBhIT5cmKs8om0X0dHy4NHGYPJU1Ub+ejrl6mDSho3Y=;
 b=ADrm6TzxphkDkd+DjTL2NhKf60oF+ayEGjSPYwli3/sSHhqElti/D4fx72a9NiXMp3L7tEFtZxeHLYkBFS8cjXIlri4NrIqlLndu4PuXRPcUSabkVB7UIM8RdTHogISL18gMMG8MPhHnnMutlCSioT2X8uJYwlomGUIBRnp6/jKAujXD/rtnQqcZhIw8PVkyeo9j4EVGbBJQ/Z6bRLTz8rxku3Dut+a6ftva4AA9eulbnm209FWuLF2ZIOziK4G6BpKhs+EglkJkIgrlfgv2zt3VMLFcbfxBFuzx7vNiAj27zRf08KWwOIv7vRRBd2i6UoYdqaU3RHK6SdcW0iUeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 6 Jun
 2024 06:06:22 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 06:06:22 +0000
Message-ID: <56de0bcb-6154-46fc-b614-81e0af3a34e1@intel.com>
Date: Thu, 6 Jun 2024 11:36:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/xe_gt_idle: use GT forcewake domain
 assertion
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240606055401.934750-1-riana.tauro@intel.com>
 <20240606055401.934750-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240606055401.934750-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::23) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|SJ1PR11MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: f338954d-dad9-440a-c369-08dc85eeca28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW9yU0FvbnBGUGxNUFVTK2IrYlA1VHNsOEJ4azF1UCtUY3JBMndOcEZ2b2l5?=
 =?utf-8?B?em1haGdSaDdGbFlsWS9ZSEdtazJxWHhPV1ZOOHVFVVVzRXh6QWRuMDA0b0pm?=
 =?utf-8?B?QzlGdEVScHpCWWVDTTdOK0NuNGR2QU5tMXVIM29BNzRKRjNnV1pEZEVTRzM0?=
 =?utf-8?B?L2lVamhwQ1NhaDJ6RUJsVFFCaFZaWS9zWFdiUnV6YWhvdkxpTjR1Q2dBTGRD?=
 =?utf-8?B?Vks4ZG9nTlZkUzhtaVl4MHJnZ05Ya2gyOXVzMU56WGVxRnp1Ky9lcUhvdDlz?=
 =?utf-8?B?cS8xV0puTncvbjdkVGJiMENjaTBOaXlicXltMnNOMW1HL3lRS0h0eklVY2JC?=
 =?utf-8?B?Zy9GN25rZjJQcVVFRk5UNWJ1ZURRemR1N1JVSGQ3UE1JeXlnbjBFUExuUUd4?=
 =?utf-8?B?VE9VZHlzSjlDNVFQaXVWODlqUldQZy9JRHNGNVhxNVRxd2lTYi9lNVJSMDln?=
 =?utf-8?B?eUxoQ3g4OEV6T2dKb3hERXRXcThZbjgwaUlrQUdmeXZrZUxTY2RDRXd2NTc5?=
 =?utf-8?B?V09NVG5LanZTZDlDK0E0eHgvcDFrd1hqSlVVSDdoRVFNL0lSLzlONFpJZDlU?=
 =?utf-8?B?VUFTWEp3bzRIdTFwL3lSa3Bjb1BOdHh0aGw5SGdmaVdWMjQyK3RGZ3prUXo3?=
 =?utf-8?B?OUlNY0hlYktMZDYydTd6NWRJeG50VU5xSm9PRU1HOWtrN3hxcnZGZ0ZDdmhS?=
 =?utf-8?B?Sms2M2tSdkVtL0lDemhVaTR0dDIyUTlLemxUMi9jdng2VUJSRG1IRWxKN3FI?=
 =?utf-8?B?UmFYNnpFWDVXdVFqaXVyTWNvbHVsUGhJTWxmb3NqekovOU84SUxZbnJiaGFt?=
 =?utf-8?B?bUtCcE1NN3prdTJCbWppeDJLOFp2MXZlR2FrQTcrTDhuODA4ZCt6Szh6VGRa?=
 =?utf-8?B?Tno5ZUVpeEhIbGNCQ2dCcVJqUnlrSnVFQUtKcHoxWlgvaHR3R2xWMEsxaWhw?=
 =?utf-8?B?bVBnQWFyR2d3QjI0Vm1aZm1TSi9vTVhXb1JzQjBlb2VhanlSQ1RWZzQ3T0dO?=
 =?utf-8?B?UzZYdU9LczRubzRVL2dyall3MkZMTERJMWkxZjdZTUtTMmttR3RJSC8yZnNJ?=
 =?utf-8?B?UW1SU0Zwdk1qd3BUcEhpWnBmTmZOalMzMDBrVmgwbjlQV1VTTWZqNEtYSTdC?=
 =?utf-8?B?cVpGbUZPUjJLdURmb1lwUUFoR3RrMHVwZ3V3bHUwdGlRT01DQWFLQ3NrbWJP?=
 =?utf-8?B?LzhIOUxrSitFMkxkbWdHNitUY0VJbkRSSjdiVGs1NmlLZUY3TUYxMTljUzM2?=
 =?utf-8?B?ZVY4TGorRk8zNjZsMHNTSmpUUThadTVvNXlja1VhSnhuV0YvUko1cjNTSmxZ?=
 =?utf-8?B?bmF5SnJxbm5lK3AxN2pWRVY2MGVvNVdMc0ZBbmlkSlBJQlpDbFBtN2MxcTY1?=
 =?utf-8?B?U1BrSTZzYjlIa3ptcXI1ejUzTk53MUJ3TUxVZm9IRUcrTmhJVGNUS1JRM2lq?=
 =?utf-8?B?MWxQamR0anpYMTMvYmo5Q2ZqM25FdDhGeERuVGc5a1dPQXlMRDFmaWNXYmw5?=
 =?utf-8?B?bHQvWUZFS0lXY01SQVU1M3l5aThZNGg3N0dYeUgyZ0RPNTdmVHlMUzJ6UnRW?=
 =?utf-8?B?TlZjWnBrM0pKdEhMWjdydnlSMHBubjhpMkNqeHJ3V0ZyYVM0bC9vMDFLa3Yr?=
 =?utf-8?B?eFlpSmxaTHRjZWhqeVBRUlB3RFFjWDF5QnFNYzdiODU1VnZuYU1LR3JqNlhm?=
 =?utf-8?B?UHhBSVhKMEpiM1VmUWJrUjRKNkY3YjRaYTBxRGV3R0U0UGtydEpqOUN4Wmg2?=
 =?utf-8?Q?SnPPiWZhBi7mIO/5fg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWh5aHRFL0pvR0E1TEJ0Nlg5ZnpMVW5Pb25XMWExQVNMYTFaWThLSXFyUUZ1?=
 =?utf-8?B?UFhkcWRWK0Zid1BPQ1RBYTUwaElzRVpKaXdQdy8rQVNoTEFSa1FjejVuc0Iv?=
 =?utf-8?B?ckIyU3JzZnJoUE5SZmlCVlJVWkM5eDIveEJlQ1R0VEQrYnZNaTZqbytCd01G?=
 =?utf-8?B?dGlaR2gyWUhTcDY0cEpsQ0phLzNYKy8wL0hyQkVUM1U1cmExQzcvaGsyQUJS?=
 =?utf-8?B?WFFMSTRMaVZVS3VVbTIrNzZId2ttZE9DcWdPUTNzUDhmNzAxRjJ3a3FPNS9k?=
 =?utf-8?B?elBidkQ5ZmV4czMwZGF6VzdjZFprdno1TE1GcStPblo3VEpINEJTUnVNckZy?=
 =?utf-8?B?TjVFcmM4QW00WlVuTGt1VXlCZks3NFhSYUtvcjNBZkNLZnI2SjhUWlJwdUlI?=
 =?utf-8?B?ZnpWQUpiMXh1cGlncFlaRnVQenJHalVIS0Jzb3U5Zi8rSzFEZU1seHlubGFD?=
 =?utf-8?B?TGhlT050VXRzSTRBam95YkxrdUM1d2lEQXM4R2phZlloYkt5RUlINmxFakhs?=
 =?utf-8?B?Zmh1QUVBOUVqU0dOVE1Tam9VajNJMzkzc2dmYXFaYTJOMDNqM0xOcEFQbmxW?=
 =?utf-8?B?MDN3aHUzSFJvck0yblpRTDhLNGV4SytYVUtvaTdKRW1rQUgydDNNa0VHbjR0?=
 =?utf-8?B?c3ZWaGhyaWxJQXR3YmlvbTBoTk45aVA5L25xejB6dzdGSVVmQ1FJWW1LbTFv?=
 =?utf-8?B?cnY5cjVuamdFaFJMVUlTMjFGZXM0aFhSSm9ldkRTNHp2T0cwdURZWHlCLzFa?=
 =?utf-8?B?RGgwMDhrSWcwaDJETW02Y1FJMFJML0t6MGx6TDNWUFBJQmhYQkNXUkJjSy9Z?=
 =?utf-8?B?dnpWUXBYMjYwMGE3OGJUcElKR0orL2JXcEJNLzZ1WEhEL3hTaXVEcW1VeFZr?=
 =?utf-8?B?R2EzcHhCeVI5OWlEdFNPeThUbmVSRklWdXRrNFMzNVFoNGgwdzEwMnNvcTJN?=
 =?utf-8?B?S0NlVERad2NxaGZDQTE1N0p2dmp6dzByRmRvcGQ0VFU0dnJBNTdEQ2U4Q2JJ?=
 =?utf-8?B?WXhCUzZ4Ni9nRTFLRk4xTE9FRWg0cERZSGtxS3B0Wjh4bm43c0FvNk5TTUpq?=
 =?utf-8?B?aU9VRTZ3ZnUxZ1BkTndtekoyL1ZKT3VLdldjQ2ZVcEJ6UzVkcFVscXhrUGFU?=
 =?utf-8?B?ZUo1R1gySnVqcXc4OUpxMkhZWWIzS0Y3Nm4xSW9SRU9UV2tNSHRWdG1tODYw?=
 =?utf-8?B?VDVUU2hKSVNqZkpmTEpkUXdlSklYK1hDMVBock10YTJCWEpJZGZrWThjYWcz?=
 =?utf-8?B?aFdlT1dic0NUKy9yTElKcTFBdWJ6dlhxaklxbXB0bzVoSVdaeXRPZVBXUENp?=
 =?utf-8?B?UExRLzBjcHlVTHJqQlFTMU9PbENwREI3aER1VWxONTJnQXNpNWd2cWhOT09D?=
 =?utf-8?B?WlV2RktsYjFPL0ZIenNsdGRXSVdlR2V2c1NRKzVhVkRhUlF2YnRBdEN5ZW5k?=
 =?utf-8?B?U1ZXYmVNZ1hibGo5VGhrVU9UN1kzNjBxb1Zqc3Zic1RFY1F5aDBCdTV3NTNZ?=
 =?utf-8?B?NENsZzJNYXFpaU5tZVNJbzh1TE0rWFRLSXFVY3F4TkVGdFpneEFRZG9CM2JR?=
 =?utf-8?B?T2RLUENNR1JMMTNRZW4vdFo2MFk1cXVEZkFqWFFTQTFnSjJ5VThna3hoZGtL?=
 =?utf-8?B?eWNwaFZEMDhPRmtqbEhaVWxnY0t2ci9ydVdKMEdIeHRDa0dSVGNDVWJqNlhq?=
 =?utf-8?B?R0xWNVVHQWpBTkJ5eGJyVDJVOEtvTnhlcCtpNUZWZjFTblBjMkVUdnUzS3Y4?=
 =?utf-8?B?Q012K2FUZjZobHlUUHdPRjcyU1ZCYzk3endVRVR2S0o2S1VleEkreG9wbVU4?=
 =?utf-8?B?WEpBWXF6R1g4N21FTDVZQUhCblBpOEl2cWpxcmthUUd5akU4TjNiLzMrd0No?=
 =?utf-8?B?dk1oYU4ya0x2MkswaWxtTU1raDNLb2NGMk80UGdacmFST0Q0bWptUy9RQ3FP?=
 =?utf-8?B?Q0pERHJwWUJ3OEFsRGFISmxBSktlMHliNTVMNHhOSTJESTc5cDYxTmJkbEFJ?=
 =?utf-8?B?ZGp2T3didkFFTGF6T3E5MFVYQ0hvMTZZWHhrNWVtL0R6aHZJWVZiVHhmQkl2?=
 =?utf-8?B?aG9uUnE3VDNQaUo3T3ZzSDJCQmxocFo3R0VrV2hIS3FlVDMrOUFUanIwYnFa?=
 =?utf-8?B?dWltUW94Wlkzbjl3ckhpR0I0cnpGdjFQbHM2YSt3MDJOZXNyc2V4WkNycTRY?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f338954d-dad9-440a-c369-08dc85eeca28
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 06:06:22.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45Gj8TUE4yf9TbnmJ5AJKI4FtUmRnR4nCI1tq0VjFJLjIVG6cxkVE8/Pf7gNOwmaMLvJf16TIukH9UovjDukcovDBU2Pj5mKPAZoFxOZMbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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



On 06-06-2024 11:24, Riana Tauro wrote:
> The rc6 registers used in disable_c6 function belong
> to the GT forcewake domain. Hence change the forcewake
> assertion to check GT forcewake domain.

I think this should go with fixes tag.
with that
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 0109d1d2e9c4..a6ab8bb4571d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -250,7 +250,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
>   void xe_gt_idle_disable_c6(struct xe_gt *gt)
>   {
>   	xe_device_assert_mem_access(gt_to_xe(gt));
> -	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
>   	xe_mmio_write32(gt, RC_CONTROL, 0);
>   	xe_mmio_write32(gt, RC_STATE, 0);
