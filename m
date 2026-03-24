Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A051F532D4
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 06:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10410E30C;
	Tue, 24 Mar 2026 06:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXWVfph9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DE810E30C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774334285; x=1805870285;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hd3CbyjGVSiTN32tKWyeqF+VA/A7SPzNbPvfB35goIo=;
 b=FXWVfph9KDW3FVqUG7/FZAiUHMg4KFEZhDkWVaNPSExERusTRVL4BzkL
 nhzUwLfymEj/Ywht8Q+///FoL44xltolKv0wY4i0hkF/za7+FtPPCDicu
 5zXqbDLrxU++OCCPWKoCjsxnYttLdUaRVBLCq2g2HmOChLX7tzH8HFQqz
 HfVcz11Tu+6RsIDF/+VLvbWI3jo8a4WQKvkuKa0QDxEhiJbCiFsbr1NWn
 VRn1IP3HaDGuHsGV4U+gbQDcIvqvbweuMAm09qJ0aI2IWwDDyq7DnvR90
 35ErL35OAFQyH95tpts4PptloX5ZLIyf395hWtcMg2/4ElgZzj5kJpZIb g==;
X-CSE-ConnectionGUID: yLd49yOHQwCXO1oG+VxW+w==
X-CSE-MsgGUID: hAhujIVbQmGsYMQRYNvWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92922352"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="92922352"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 23:38:04 -0700
X-CSE-ConnectionGUID: sJvFIOVGQFydTZqVANkgnQ==
X-CSE-MsgGUID: k/Va9sdFQzWg5E+02mo8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229198430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 23:38:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 23:38:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 23:38:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 23:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9mkBWhalKiMi/jIp2Aq1hIrDXJ3u5GTAwk3Lvjlb00XbrvYGINgIV7vJ+TKKqAzNZHt4vEkd+UALAOUKYklLJ1DHk7ok4xintBAB+e9d3G7T2iqmvRB6DmxBVITZcjdM4IS6+g4f6N2gglp9FJwkvBJs5HpF68/gkAznOZkHCnnRqEjRCSoofmqeNVfqKjzOAcKKmkQ9Oo9H3d0b76DCUjtPKQiw94Ij+2D82vX60V/EB4BHNzDZYYPqCG7z4sai3TL4sGWI3IuCynecanuKUh/2bLzEt3hkVHBSyA4NfejOZXSqZ03JmhoJ6J1T9BtZEcHsLxekERlJN9kHLRoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEStPddyFUIpi8YSa4kXOH1W7gdlyPEdI5K5QMF9ofM=;
 b=LZanu1pFzFopX6DZgp5DvTwmYKhgqLF8Cti/ob39FHqKYOUmk4xhIL254plwG5ky9vtq1wGK5KriClKU61gR8P1PX845Tn63pw4LZXN2Ak0D2seRmfd85t6FcnwW0FTM5xvnbfglzxq1ycCqLKJlzNAmAPuFbF18ZRmRTeKgiGOzziYdue9qXAZ1tCeWIGlGcmw/392AIpfF/2mzukvyH4XdQM7IWKiHC6y89Pw0Hr+k5sS2Dw1PtqBZ8zkj9FN3wX32LnE70rYeSiyYoUKSZYgX8DPk4H9W9qNUFjlR5qrL57uhWNkYE7QXVHXAUunujIbhk2qiURoA3nb4x4GYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 06:38:01 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 06:38:00 +0000
Message-ID: <f0e3a270-6206-4bb3-ae8b-d34816ec7188@intel.com>
Date: Tue, 24 Mar 2026 12:07:53 +0530
User-Agent: Mozilla Thunderbird
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
 <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
 <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
 <662754e6-5a2f-44d7-a83d-e0d5f9a1274f@intel.com>
Content-Language: en-US
In-Reply-To: <662754e6-5a2f-44d7-a83d-e0d5f9a1274f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::11) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|SA1PR11MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: c8abaa8e-a17e-43cd-a6d7-08de896fe4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info: 7EVhL7xNJEAYXFkie9vI+b6TmQCAupmjGYQ81oa/EJnV9drOuCLK4Cua29R8uj7HwKaead3YFjUV8uzw3Qj7omeLS5mOr6Bb9If2bvfokI3zxMLBUfQxs/NlMviMVhT8yxRaPZwrwr45xHUb1bAx7DvORiY56CAiRUKcSmWPmMvcfLrVx5eXSxlBoN1iHp+hicGrMLzTts0vpNVi40vxvPktRpBS3ROQlcyl7p7iljPomhtTACRatJVrNHx5rXsOK8zwAZinl7psoroudWxKa1TqD5Y6OzRy/RVW2am9lUivg0Ra+A2exW/YRZVWRt9YSpcRzBkdPWpBMdL56YXQ3+Vyl8Zfk1IcVMqCZPBbJbQFreeE/o8/23zHoxCRP0PfH0Lll//bOFrIVw2ch8KL4bjqzJ4doepASLx2eoA1EYLrnB6fCcukEvgbhdHjqes1Oug0qGo+emYxiDeSpGg+KcYz63HG673AOx/MahuX3q+KOf40HfkG+XafpjW76ZFp3mtskz+MCTYmLWZu+B6VAyOQ+EoBG+1p3jN2hEDFJqE5tWpf19iD8eArODYn4ymgEcFtc/3tBomQaeZZELboNmvDib0jz6BDFtWJJEXlIGcUTngFNOi4/kx63UNJBAXUnZQxQlnDVfMG1Hl2gMabBm8pSxXytv4yyju6ZxIyA+fXWIliWbSmcVunbz7puJ3hyRCzwSMuAx+sPPyyhPJ0Sajl2fgyw1i7E3ClAMBRbA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(7053199007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFR3eUh3MWVxUG9TMERVSFI3MnlMLzIzM0E0SVRPSDNTbnNPV0ZvdHdYZDZS?=
 =?utf-8?B?Qyt4REw1b1BxVEh3cU9nUW9UQzZGQ3cwRWR0dXVrU2FxTlkwdWk1d21SVWo2?=
 =?utf-8?B?R2pmdHZ0QVF3YnhMbHFRKzV0ekVYSER6SU5MVm9ZMWdBSkVYZTQ5aWFUZGRM?=
 =?utf-8?B?VG9lRlRFQURJdC81eGxNUmhKWW1JU0dnNkMwZ3AyYS9RMU42QncrdmJrRXNZ?=
 =?utf-8?B?cUgreEh6aCtibnJvOEE3eU4zeW94VzVYbDlNOHlwQzhkNlJCN2grRjZHUFhs?=
 =?utf-8?B?TWwzOHdGY0NOdkhEN3kzSlJRN2NnQi93VVJ2SmRsV2REN2N0eFFBc0VUdGk4?=
 =?utf-8?B?Q2E1K1dOb0FmbGN2Zk1qT1FmWUR4cno1bUdKWE40cmNmNDRzRURkUHJvbzJo?=
 =?utf-8?B?VzdGV0tyenMyUUxFdU4zY1c1TXAzbzN2NThUMWsvSEZsUHdvdnRUSVQ1R2I2?=
 =?utf-8?B?SVZlTmZXSTh4M2t0cWZYY2h2QzJrNGJLRmlxdThRVTBHV29OTjREZmVJN2FB?=
 =?utf-8?B?dzRvdVBERDdDUmx4MjFSaXJKSzdpeU12QUdHemFwZkFsdWNTNmZQMjZTUG44?=
 =?utf-8?B?SlFiOGpMNmt0OVY3MGphUjNmUmVXb0oyZkJlZGZreXljRWZ2NkF2Y1I3VStj?=
 =?utf-8?B?eEVjZ2Fnbk9qRmlCVGJjOTFreGxHRHNibVlUaWpGc3VISXFwekFYK0ZRcC82?=
 =?utf-8?B?dDM4dG5EVWN3aHZGb1dBaEpGWEpSdVBFWEQ4UFpOaVFic1RqMEo0SmZzMVZB?=
 =?utf-8?B?VE9tNS9haUk4ZGtJL2lRYklpUzBCZW1zVCtTTDB3akU5WjdOUkNnQ2F4U1dX?=
 =?utf-8?B?T3lOejJ6dzhTejBoakR1UEV4TlFwV3dlejVFMEx4UU9OTWZnU0JvNHZQOGll?=
 =?utf-8?B?VW52cFc5bXdnQ0s5czJiUGtiSmZ1cVVueC9hRkZDSUUrNVAzTnI5TDdCbEJY?=
 =?utf-8?B?KzBJNmcvMHMyZFM1SE5BOFFYdzB2NUp3dS9HYVRFTGxyeHlrVmlTQWxxWFVC?=
 =?utf-8?B?TUZyL0lRV1VnNyt5T09WWWI5TVFYNHBiR1h4RitobEJkT2R0ekdVVkdHUUVy?=
 =?utf-8?B?OTB2MjZDZ1BTNjRvbTBxeEZVWUlZakVvMUwvaDh3S2JsajFDR3YzOG9SaDZm?=
 =?utf-8?B?SWEzVS8yYUJ4QUl3UEdpUGFPWS9wbUdLYU9YOEdiMDJBRXJyRmE3SmRWbUpj?=
 =?utf-8?B?cnY4aFpNdUJ3V3Z0d2NGWXE1MS9qeFZFa0VXajYzeHdHYUd3MXpLMGtzTHN2?=
 =?utf-8?B?dmpoSUdabUJPSmZyT3BiNjd2S1J3RFRVVGNJRkhjY3JmUFQ3RTZRcE92YmJE?=
 =?utf-8?B?aHAySnRxUUQxM1pCaXJPa0ZyUmhDR1h5Qi8wTVAvQzVsMHU3RHhvTFdoa2xY?=
 =?utf-8?B?Zk91Ni9ZU0w0d1dVZUZUbW9CY2dDSnJ5RVZpK050cEtlYk82eDhrZFg4TEN4?=
 =?utf-8?B?NFR1YmJkWHQ5Mkx4bS9ITGdldzdhRnVlNC9JeWVxekEyN05BVjBjMDBjam9a?=
 =?utf-8?B?YlFnQ2hrQU9TVDgwVlkrY29OekR0Y24vL0N5Rjh0OFVmdUxDZjJHbmpQVzQy?=
 =?utf-8?B?cG90c0ZTZEIvWkhLWjlWVkd0QmUxdjJza25ZOXM1ckIzNDJVbEU5T0J1RUJv?=
 =?utf-8?B?UlVBV21Pa1IwQmg3L0NmK0J2RDhrSHViVU03Rk50aHhMOG15akg5bkpsN0ps?=
 =?utf-8?B?S2MzMkMrZ0U0OXpHQUplVVZHRm9jTUhKNlRZT2FjTG5SeWRFL284SXJYTEVq?=
 =?utf-8?B?eHptZTJ0VUtyRldtcGxIWTNYS0hOOWQrMXBCZ2lBTmFnZldjYnhmcDlndVBK?=
 =?utf-8?B?SmJwZlNXNXdyeThNS20wRzIzUkNnY1BhTktWV3FLS29KVkp3VkhQOCtkOFRu?=
 =?utf-8?B?V3B5VkkzbU8rT0NsQkpnWE9PNWlYdGNXaXpKaUhZdWZzb3EzOXVQcDRaYlJJ?=
 =?utf-8?B?RUY0VVZxSE9NSWZDTlR5UjRkczVsVXoyVnVDeTZyWE9wdHhRTm9OVGF6SWZJ?=
 =?utf-8?B?Skp4ek5hTTRmOXJINk1SeUdkTWR1TGp6Y3haU3EycHNzTTVIRjB6TVhkOUdS?=
 =?utf-8?B?Q3FCZFdLR0VhWHVFY0tDVlk4MXlBbE9VdzVRYmcxVHlBSWFDQWoyUnQ2Z0U5?=
 =?utf-8?B?UUNHYUpXR2ZON0FIUHJDUzk3dHZqS1c5Nk5vN0UzS3NlZnFiTGhUa3dobHE0?=
 =?utf-8?B?TjZnZ0p1QzFFS2pSWlQxWlk4bG41VXZiS0VRMC80RktPaDVWR3BiK29FNDNH?=
 =?utf-8?B?MXo5bEVZS1QxQ21kMml0a2dmK2Q3L01KK0ZMdEdRRzdYNGxWeCs3cDg3bUVu?=
 =?utf-8?B?Mml6eFI4Z2JPQ3puNTBrV0MvUEFzOE1FUEZGZEVSb3YyUXZtSkhmN0J3bXBP?=
 =?utf-8?Q?9TLEkjKwhpQzPhGM=3D?=
X-Exchange-RoutingPolicyChecked: XgJcuJBRd2DukEJT9MFWnvWwoIuWkqTSieBPaxi41mE2ytCS+qQxFaNPPfJGWmnSk64aOz3NEY9LKH3LiiT8q2XFVoPqlBHNf/6J/BoLuZ4tJXlEQw+qwJuliHF4JWjNH6tDBUxuORftgcKDhFtZt2m7OqLIIBsklOmy0c8f5R8PDrUPqhqCoNFabpNgo6Va9eYfP6kTX6GwxaFoEzLSeFLAeIGW5iyig4AksKKnR7sR+HUkwotUp2IhtREiGYZDWwwf5mVAMyqEq2w7CgRMfSpB3mqdiv9KVoFH44s41AJmPAV/urvUgeVXz2mqUImtkgqN/tfIvR1oUIjICsuCJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8abaa8e-a17e-43cd-a6d7-08de896fe4b5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 06:38:00.8557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndkULqxQpu+OamaCiHBXr5KCnj/U1qPXS7ChdO22TNea0PflsRjC1rtZLvQZaY+Xw0PeOPmSlMo+6zkLul7wgIjDyZHP8ZDSl8wlamPAY1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
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



On 24-Mar-26 12:57 AM, Vodapalli, Ravi Kumar wrote:
> 
> On 2/20/2026 1:03 AM, Matthew Brost wrote:
>> On Mon, May 12, 2025 at 06:42:03AM +0000, Bhadane, Dnyaneshwar wrote:
>>>
>>>> -----Original Message-----
>>>> From: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
>>>> Sent: Thursday, April 24, 2025 3:00 PM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
>>>> Roper, Matthew D <matthew.d.roper@intel.com>; De Marchi, Lucas
>>>> <lucas.demarchi@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>;
>>>> Taylor, Clinton A <clinton.a.taylor@intel.com>; Atwood, Matthew S
>>>> <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
>>>> <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
>>>> <haridhar.kalvala@intel.com>; Chauhan, Shekhar
>>>> <shekhar.chauhan@intel.com>
>>>> Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
>>>>
>>>> In existing code for PIPE CONTROL post sync operation instructions
>>>> POST_SYNC prefix is not present in the name, add it so that it will 
>>>> represent it
>>>> is a post sync operation type.
>>> Is there a specific reason for this renaming? Is it truly necessary?
>>> Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and 
>>> PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive.
>>> If renaming is indeed required, it should be applied to 
>>> PIPE_CONTROL_WRITE_TIMESTAMP.
>>> This refers to all the post-sync operation types defined and used in 
>>> the code within the Xe/i915 context.
>>>
>>> Renaming can clutter the Git history with unnecessary changes, making 
>>> it harder to track the evolution of the code and understand the 
>>> reasons behind certain modification.
>> I don't think we should consider git history too much in when making
>> choices about renaming. If this is a better name, more inline with bspec
>> I'd say let's use a better name. If we need to rename more operations
>> with post-sync prefixes, let's also do that.
> I have checked bspec only these are the changes with POST_SYNC prefix.

I could see more places this flag is being used. Please make sure it 
reflects all the places.

Dnyaneshwar

>> Matt
>>
>>> Regards,
>>> Dnyaneshwar
>>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
>>>>   drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
>>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>> b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>> index 8cfcd3360896..75efdacc4979 100644
>>>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>>> @@ -54,7 +54,7 @@
>>>>   #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET        (1<<19)
>>>>   #define      PIPE_CONTROL_TLB_INVALIDATE
>>>>     BIT(18)
>>>>   #define   PIPE_CONTROL_PSD_SYNC                (1<<17)
>>>> -#define   PIPE_CONTROL_QW_WRITE                (1<<14)
>>>> +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE        (1<<14)
>>>>   #define   PIPE_CONTROL_DEPTH_STALL            (1<<13)
>>>>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH    (1<<12)
>>>>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE    (1<<11)
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index a7582b097ae6..da50213b78c5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, 
>>>> bool
>>>> invalidate_tlb, u32 *dw,
>>>>           PIPE_CONTROL_VF_CACHE_INVALIDATE |
>>>>           PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>>           PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>>> -        PIPE_CONTROL_QW_WRITE |
>>>> +        PIPE_CONTROL_POST_SYNC_QW_WRITE |
>>>>           PIPE_CONTROL_STORE_DATA_INDEX;
>>>>
>>>>       if (invalidate_tlb)
>>>> @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
>>>> bool stall_only, u32 *dw,
>>>>                     int i)
>>>>   {
>>>>       u32 flags = PIPE_CONTROL_CS_STALL |
>>>> PIPE_CONTROL_GLOBAL_GTT_IVB |
>>>> -            PIPE_CONTROL_QW_WRITE;
>>>> +            PIPE_CONTROL_POST_SYNC_QW_WRITE;
>>>>
>>>>       if (!stall_only)
>>>>           flags |= PIPE_CONTROL_FLUSH_ENABLE;
>>>> -- 
>>>> 2.25.1

