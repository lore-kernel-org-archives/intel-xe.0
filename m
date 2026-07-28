Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E8C54F51
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 23:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7341010E5C1;
	Tue, 28 Jul 2026 23:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8sQxr/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C550610E5C1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785281840; x=1816817840;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YS6KHZn1AnXy2Egt7bA78LaoUfUU1Zu+bWO53ammpeU=;
 b=W8sQxr/ex927lZB4BzwAuyqWJcW5tLIGQJhg0PpoXUFMRgMjhQMYFPvV
 LNqKJcwlibH7hOoZM2fpaXLEFN4qDMlr08oOKajXTRjT0PCY3zNSr/uGe
 q0EE7Jb0aYoBFHxJLYcQVJodJBoD12wiMYpIMQEvJwycK/2Ixms+g7RJu
 NSU1ZH5a+PUTPXOTGxu8umRJ74+LUTdAfo68M2FYWpFS/sDJwNl9hMV0L
 BpPonTLR5c6dCu5EcZLjFaucBCKBVRmC3apKkEwAhddRC98vehRXMZeht
 WCrgVHlsW52MFTecagc6ECcw5ixFYQn9JV8+46QGNELABenGOrQd6ZouT g==;
X-CSE-ConnectionGUID: HZD/GyxLQ1OwbnoTwsqiuA==
X-CSE-MsgGUID: q3VyjKmKQsCT5ZgjL1Y0cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96238326"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="96238326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 16:37:19 -0700
X-CSE-ConnectionGUID: agTgi4tmRq67+OCDQZ9u2A==
X-CSE-MsgGUID: pJp3VjF7Q9yuGBZo/94DIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; d="scan'208";a="253512241"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 16:37:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 16:37:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 16:37:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 16:37:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF2oGH2A6r+sPOyWL56FFWetsODu2jVPnZsWQ1o5YSyZDoSRQkdbDNUn0uhH6OqpxvL2/4ikai4R7CkdTb2Onj6rN/yU6m8Mtu5IPlebJYjzJxQNHmuDQbxNcQO0rwnikiQInxdHQ3aoOx1WL34kNupqQaaCSyWTXkBjtGh78uAU3rgskpUkwSW5t2kKMvW8KDncNmXSsPqnO4rVRdfTpvGh95Mgrdb4fdLT4XZ76R+utvk66kRdImNsH0j9tNiQan8eRgegoHN3cVh50mx0RBgdHSBCueTtKSsF2q5f3Lmo0iyNhUyIYmLq4wE81cNDWwtdqLeUN+8QH7b1heeuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NacZDgxM1bHghzZkX9tb6mUb/5x35oLmjBBlakaPQCU=;
 b=l3GQ4dhDgmuNnrmbc3aRwlQzQpWpcVfkIXw2fVoWbjyVZDFV4rMIkbhfYj/+RJ+AWlRcw0kuZH4ZN0mSZQTG+kDz4i/r/8nICqYcgrNBVFzEHtidMzXdcQRBpn9lMwdxWB8W97quFi7CUxwdn4o4cVdrA8u6n2dB5azzyfavqDS05s3tbnAPoiqBqsIXF+WEpkct6HYAdi0rQQgE3tL88tDKAPBUdJesr1bjx0vujJgXXkZ/5m4kS8ErOu5OOsYw1VDTJghl0oSnpv41uKjlfdfpz+bWLTGdsJqn9LUsGtvRE/qLGpuNC0oWCXsHSr2sa6NwAcC+Rp4uVc4WgQor+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA4PR11MB9083.namprd11.prod.outlook.com (2603:10b6:208:569::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 23:37:12 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 23:37:11 +0000
Message-ID: <07bf5f1c-faf6-489f-8e3d-a8cdf1a684e2@intel.com>
Date: Tue, 28 Jul 2026 16:37:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/memirq: Size report pages from static engine mask
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
References: <20260613001652.2614612-1-x.wang@intel.com>
 <c81950909eac486e56ea541baa61edf1616b0e51.camel@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <c81950909eac486e56ea541baa61edf1616b0e51.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA4PR11MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bb0c57-84f6-4370-426d-08deed0125a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|42112799006|23010399003|1800799024|366016|376014|56012099006|4143699003|5023799004|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qfFUp1+pBd3DyYs6jSTf8iRKvZIm/JdGqmO6g74DZVD0V2UnGYT2MZQd9ZKiifbCaWv63zIlv/3dxXHkihhofhioeAO4gI6DA8UXBhLpJDz71Jf/dGM0VU4eO+Kz1KB0YzbiBMFlsQ0b3dmHk3G2AzbPrJdb5OAqwEHjfjyVTGBr/2R2Vs1MVKQfaTDBw/loivM4L6uaagUKx5EP6NR5rkJOoflFtr7JwHug85z+FpvDf9G5dYzj77NniRLFXXQY5MmqgI9w3TSUFSLdb/qYqF5nLaqmCJSBS9jAXpKsI8r9mH+cB+we6W41smLuFMOJ5kR+CzNZC3hgfqvzp+i+U1WmIWKywB2FzIA4VZt1rlJ4ObpRCrH7uUN/mJNua1u25R1/PH9nJg7+f5ij4sX6zI/vXvGN5cPpvdmHQkBfydjK5rMW+szZH8PeOtcAoiwOLVP250FQfX2e4TQbHGHRO9eeBmfvPfPS5KIKpO+j9rZSzEORg0qWF6sojiwN5fDPM/FD9qQL/PdRSTQrWSXTei4vk8sUbVdh5eIE0ARF527wodK917A0SFo9sqYQ9+YtxhdI0CFAALhPVmZbiWdotSy0Xzua4hZcCQzjmV1vIyixLngckMK+73BXrsvR7WWc/AdAswGVR335iduj7eGTnPkOM5LxHlCI0zW0/mRVbeo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(42112799006)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRZYm9UVUI4TW5sUGJ4TDZDM3IzaDNOUWJ1R1VhWmNVa1dTL1ZHYWhkRllh?=
 =?utf-8?B?dnA3a0RJMXAxSS9jRDFITDNmWkw0OXNBR2txaDA5QnN0bWx2NGg0K1R3aFJz?=
 =?utf-8?B?UDlYQWsyVFY0R0xyY0hyZHlUYUN3V1Uzc0wvZjdaaS80dENyRERHTnE5RDZ0?=
 =?utf-8?B?RzZoVXZjMmVXMWhZMTh4V1ROb0U1UjhGekJIT0s1N3lIc0lGaGdLc25qN3JK?=
 =?utf-8?B?U2x4bWRDY0RKanplZ0x5UmE4MHlBNVl6b1NDRXZqejRERElmdXlMRkRTODgw?=
 =?utf-8?B?YnNIRFpwV0pmeFVFdjZXMnhmdldNdTd1alhrcFJSWnZsRmYrZHpPQmRwbk45?=
 =?utf-8?B?eWZZZHpCcTI1OGZVellHSXV3RWhiTkpCTXJYR3hPNjZIRVFwZkxxSnNXQXAw?=
 =?utf-8?B?elFDbnErRm1mVzZNQXFyL0R0d2tFdFlOR1F2c00xaE45M21PWk1Rb1BmbUFK?=
 =?utf-8?B?RkpmUnJDMzVBbHJPNzJDeU9VcGVOeXpBK2ttbHRGaDRSV1V1SnpuYWh2Njl3?=
 =?utf-8?B?WitPZkptVVlTR1ppS2lKdEE3cVZDb2M0NU5KWXNFU1F1dkg4aCs3azYzYTJ4?=
 =?utf-8?B?SVFRc0xkM2VEZW03WXhDQVVoUUdsREdvYmRvdi8wRU1RSGVuRVEwaWVtOUJH?=
 =?utf-8?B?bWxLT0lyM05BdWNoUFYrRTZnYVNCbDJnV3AvQXF5RlVvOWdiSnluUEtvcWxC?=
 =?utf-8?B?cS9ESU9HeFUvQzdoVERJYjRKSmNTRzFUdjU3VmE2R21tc1pseWMrRWNiMURX?=
 =?utf-8?B?ZTR0anRXRXNEb3RGQ2ZkeDIzMnpEbjE5OS9PN3MyYWRyRG9UZEE0cU1SZ0No?=
 =?utf-8?B?U20rSDVBWkFTdUs5UWgzVFpoTFBTVFcwdU1iWC91a0NrVGxmakMvS0w0UkM5?=
 =?utf-8?B?V21BZkhIS1l1eGZHU29KSUJKRjhEZks1aTYwcHNRc3l2Ty83UHJWTkVORGtt?=
 =?utf-8?B?emhPcFQ1SU0vOXovbXZMOTlYV3Z4cDNyWDRJRFdJZndPeEExekVLQlEyei8z?=
 =?utf-8?B?d3dQc0tEc2xMaHBndVNtWXdoZG5GZ0dYSGJiaFdOVVlmN05nb1V6UVBieUg2?=
 =?utf-8?B?eDBwNkhCYkNMdldzUGFTbi9YSE1oZjMyUEFZakFxQmIyaXJYek9ZcFpBQklz?=
 =?utf-8?B?UERjK2tzbUs5WHZFVm1NNHpNN2JhZElMRnY0SHFBa2tLUUhUcGpicWRIWFNq?=
 =?utf-8?B?L2Q1SkRYcHJwWERXekpKWTZXby94dmVsYWlGckxuVE9kc0ZOYUdlS2ZkQjBn?=
 =?utf-8?B?RWt5LzZhdHBrcWNxQzdxY0NwV3RNZHpXMHltdlpmb3UwM1ZhOFBQZ3Y0ZTNW?=
 =?utf-8?B?U0JJb3hTcWV2TzVQb3FFV1JpazJGWDZzTWl0YVJTQis3UndtRlRuQTZCcXRq?=
 =?utf-8?B?ZzZZYjVIb3FiaGJLd3ZnNEtDY0NDLzlpZU81QWYrcVdpL1FTYXZ5WURmcFIv?=
 =?utf-8?B?Sm03Z2RYSUdieVg3MHRSaXVHd1RsR09sYWRTc3ZoVXVYZ0dTQ3BnUEVjLzBN?=
 =?utf-8?B?OWJUem5mazZEaGp2L2kyMVM1ZmR4aXllUHRSWVcyM3Mya09hUTVlYmdjd2hL?=
 =?utf-8?B?VnBCeVZWV1AzbE9xdEkxZGNPeG1KdmRLb25ZU3NaTGtHb0lxQk5NL1NlTCtB?=
 =?utf-8?B?aTdJaUhyM2VOVEluai9raTgwNGY0akIxYVNzemh0VVFPN0JYUlhTdjZqK29k?=
 =?utf-8?B?UlhwS21LWGZiQU9DSkVIcTBSbzVzSTRpSGpFRVg4amxya1BOQXJjK250TWQv?=
 =?utf-8?B?bUFXelc1K1JJZlNKZFRJMDVRd1FtYjBid25YbUxMSFgzTkgrampYUWZ4Vmho?=
 =?utf-8?B?d0RwTWtJcENONFR4dUNVNXowL25wV25Ec0ZIUSs5ZXY1TzQ3SWMvWU55YWZk?=
 =?utf-8?B?Rm1LZ0NVak5LS1BHWEpQM3IxenprK1JNSUdtR0lRbW5DTTltWGFEVEZaWXhO?=
 =?utf-8?B?Y3BPejZidzRIUk1RbmhjOUpwWHhwOVFWNnJUY3ZPVktyclRGckxpTDg1OFFE?=
 =?utf-8?B?TGpybFNQVUtBbkVNVFZJK0RGZlA1QnRQMXJ0KzVWOGE3T09oL1BVN04rOUVX?=
 =?utf-8?B?ajVYaXdPTWxhamVkdU1tbEhweVRIcWVQQzJYTTVsZkpqYi9XK0I0VzFqS3o1?=
 =?utf-8?B?V0xGSHVlS0NXaFRlSFJTNHdvWlB1dUxaUzVCUzhXZEFEaVBrcW5ucks1dW15?=
 =?utf-8?B?VTEra1AwZEFQMjdLYWd0UVpLSmFhSU9vMDYvYXFITWpFeU43dXlZNWRhaFR1?=
 =?utf-8?B?OFhNU0I3Y01KOUhoRm5DRTB6MTdUMTVLdENVWTdnYzE2MVJHNENWUEYyQUVE?=
 =?utf-8?B?YzNDeVZTOVZQQkk2UEY1WG5yb0tJQUdTUnNEdFRkWVNDeE5nR2E2SWlOY2xI?=
 =?utf-8?Q?2TvAhFZVPUraR1rbHGGdr5M7NbEEr+bW6RMI0Lg2qz6yD?=
X-MS-Exchange-AntiSpam-MessageData-1: uuM6wKSBHxfFCA==
X-Exchange-RoutingPolicyChecked: p0WioDN9GNSaqONzgvK41BTINMvCUki3jD+SsYCuP4DLGGU8ANVUfKlRogMQitNJ7gBTE1Sa5KSko+dCIBA+R2e3Kv478hEJtJ7UVxiZODLkAAQ9R+kjdWK9LFzvjW/YJqEze/xxm6Fe1vVoBRUVrcRq5EuYbfZdZMUGKLSAvK2Kzx8Blj8ozn2+IDz0XbwMS4iolwPY9HpcU5Qz5VPhz6LPA26pvo6zJGVb7EHZzVHjR/VEZFc58scBH50zrJmbqhyc3yktMO9qpAgb650sNQxh1QiSgm5Gqppr3WhRtDrFYID52rGDB9DlAqhodAkPY+NqSYwNA1+24Knx4AghhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bb0c57-84f6-4370-426d-08deed0125a2
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 23:37:11.8270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgUJFe6BX66FKaaUuict9V00NZGq0TzmdMpyiB97/N6erQhCgCKjYGeusjacEDA0NxvDv68Nf94aoAQDnY3dFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9083
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



On 6/15/2026 15:26, Summers, Stuart wrote:
> On Fri, 2026-06-12 at 17:16 -0700, Xin Wang wrote:
>> xe_memirq_init() is called from xe_tile_init(), before HW engines are
> Can we move this to xe_gt_init_early() instead? This is dependent on
> the fuses of course which need to come later, so I'm thinking we have
> an xe_xe_hw_engines_init_prefuse() or something that uses the engines
> defined in xe_pci.c to come up with an early count.
Re: moving this to xe_gt_init_early() -- I actually tried that approach 
before
sending this version. It doesn't work as-is: too much of the state this 
depends
on isn't ready yet at that point in the init sequence (the fuses/engine 
info
aren't reliable that early), so xe_hw_engine_max_instance() can't be called
safely from there yet. Getting it to work would require a broader 
refactor of
the init/early_init sequencing first, which felt out of scope for this fix.
Happy to revisit once/if that refactor happens.
> Maybe I'm overthinking that though... It would be nice to have
> everything in one for_each macro, but then the macro would need to
> comprehend whether the fuses were read already or not...
>
> One downside of this approach is we're allocating more space than we
> really need to since we might not be supporting the full engine set
> you're querying. Maybe we re-allocate after the engine initialization
> is done?
>
> Or maybe we move the memirq init later in the load sequence? That might
> have consequences for VF load though - would need Michal's input there.
>
> One minor comment below as well..
>
>> initialized. hwe_max_count() uses for_each_hw_engine() to size the
>> memirq BO, but at this point hwe->name is still NULL so the iterator
>> yields nothing and the BO is allocated with a single page, which is
>> insufficient on platforms where engine instances do not start at 0.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
>>   drivers/gpu/drm/xe/xe_memirq.c    |  6 ++----
>>   3 files changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 98265293f2dc..16ff37756ddb 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -1018,6 +1018,32 @@ u32 xe_hw_engine_mask_per_class(struct xe_gt
>> *gt,
>>          return mask;
>>   }
>>   
>> +/**
>> + * xe_hw_engine_max_instance - Get the maximum HW engine instance
>> for a GT.
>> + * @gt: the &xe_gt
>> + *
>> + * Compute the highest HW engine instance present on @gt based on
>> the static
>> + * engine mask. Unlike iterating with for_each_hw_engine(), this
>> relies only on
>> + * @gt->info.engine_mask (set during early PCI probe) and the static
>> engine
>> + * descriptor table, so it is valid even before hw engines are
>> initialized
>> + * (e.g. when sizing the `Memory Based Interrupts`_ report pages).
>> + *
>> + * Return: The maximum engine instance value on @gt.
>> + */
>> +unsigned int xe_hw_engine_max_instance(struct xe_gt *gt)
>> +{
>> +       unsigned int max_instance = 0;
>> +       enum xe_hw_engine_id id;
>> +
>> +       for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>> +               if (gt->info.engine_mask & BIT(id))
>> +                       max_instance = max(max_instance,
>> +                                          (unsigned
>> int)engine_infos[id].instance);
> We can drop the cast here since the variable is uint also.
I don't think we can drop it. `instance` is declared as an 8-bit bitfield
of type `unsigned int` in `struct engine_info`, but per the C integer
promotion rules, an unsigned bitfield narrower than `int` whose
full value range fits in `int` gets promoted to plain (signed) `int`
in an expression, not to `unsigned int`. So without the cast,
`engine_infos[id].instance` actually evaluates as `int`, while
`max_instance` is `unsigned int`. The kernel's `max()` macro does
a strict typecheck between its two arguments, so dropping the cast
would trip that check (build warning/error, and likely a sparse
complaint too). I'll keep it as-is unless there's a cleaner way to 
express it.
> Thanks,
> Stuart
>
>> +       }
>> +
>> +       return max_instance;
>> +}
>> +
>>   bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>>   {
>>          struct xe_gt *gt = hwe->gt;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
>> b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index c3ee37f8cfc0..838abf7092a5 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -55,6 +55,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine
>> *hwe, u16 intr_vec);
>>   void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>>                                  enum xe_engine_class engine_class);
>> +unsigned int xe_hw_engine_max_instance(struct xe_gt *gt);
>>   struct xe_hw_engine_snapshot *
>>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct
>> xe_exec_queue *q);
>>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot
>> *snapshot);
>> diff --git a/drivers/gpu/drm/xe/xe_memirq.c
>> b/drivers/gpu/drm/xe/xe_memirq.c
>> index 9dfe965cb46e..5a87ac42351d 100644
>> --- a/drivers/gpu/drm/xe/xe_memirq.c
>> +++ b/drivers/gpu/drm/xe/xe_memirq.c
>> @@ -175,13 +175,11 @@ static inline bool
>> hw_reports_to_instance_zero(struct xe_memirq *memirq)
>>   static unsigned int hwe_max_count(struct xe_tile *tile)
>>   {
>>          unsigned int max_instance = 0;
>> -       unsigned int gtid, hweid;
>> -       struct xe_hw_engine *hwe;
>> +       unsigned int gtid;
>>          struct xe_gt *gt;
>>   
>>          for_each_gt_on_tile(gt, tile, gtid)
>> -               for_each_hw_engine(hwe, gt, hweid)
>> -                       max_instance = max(max_instance, hwe-
>>> instance);
>> +               max_instance = max(max_instance,
>> xe_hw_engine_max_instance(gt));
>>   
>>          return max_instance + 1;
>>   }

