Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CBAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 14:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC71B10F69C;
	Fri, 12 Apr 2024 14:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeWvn4MQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABD210F69C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712933669; x=1744469669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4kt1CDnkLMfarz7txC/os1gAtnNVzQBzJr6KsLK5anI=;
 b=LeWvn4MQbnV+ChLjhM01mbnl0TiOL2J9hDiJTWTDCnYS5wtWoTG1v0Tt
 c36eUseVPE5eHGnTLbhDVXDF+YZVeqt4Mud4hUwMuVNpgFvGRJqCKPE7I
 H1Ix2DuT1fkB7JJsdPm36ZyXyNWSGxs3LQbEXB7m3eKMrAOuuqCGjUCnX
 YioMFQGXLadOHSCpIAvkLSHiFlUFedVvT6ZtJl9RzFrX3q9xNNK0Hcfy3
 drLP4TFr1nP7d1rQ9BLeIDWq9pHCLSGcH5v4Bp32SvsJsycqkdPYXqaB+
 49bcfLVcN83AXS0rhlEb3tBKogQr4sWvyf8wyGy4XgYdbmAejr2MRwrPu A==;
X-CSE-ConnectionGUID: qAOj4tqBRD+aqdZkYGvIgg==
X-CSE-MsgGUID: 4cWYpdwwRNWftGcluHgdeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8946126"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8946126"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:54:28 -0700
X-CSE-ConnectionGUID: WjA362HGRtOg8jMajo3WuQ==
X-CSE-MsgGUID: JY6AsoTITGeJs0VNMejRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21819760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 07:54:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:54:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 07:54:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 07:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1+vpsLla0zznDV0BjshyxyVuewhf+jydAEnp3Misd82lcnEG5gGsGhe+5LCLbPcvnHNZixE6ZpoM9M3mQhzcdQIfO2PmHogY/bhKTiG8vuAyLt1Cmn8tCuIsSYZ6GLWpn2mMl5XM98Fg1vnGyGqmleWVUwiq7iqGHJ4uzIkWAhe3VTaLktrjB7KlFNUYeTkCCBmjqM2IrpyLMEsywIyhb8S5V6IFKYSSIVWgAazzrKO824uxdK08PLQzkr3vc9cIbxt6hwlCcGEBOMigBtYUIVM4uG5t/We+GwR0il8uEjeYas+uW9Zp5VGWIv+vkC126wibaz+OzZSjebm4tQvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kt1CDnkLMfarz7txC/os1gAtnNVzQBzJr6KsLK5anI=;
 b=j31y1fH6Ephp5+DOh5l1g6J4DRKA+y5H7QgcYaB4UdbSgJ41rf78/C5uBMhveD2hiuUxqnacmdvcCmaXILwTs7WcaZPo/Q+yzJ45q36XfaUi7gRZlDeb8MC4F/Gj2kpVavBhIRj/1YKbql1A9j+8mRGDENkK4E4fkIYN//dwR7jZi/ZHs4AewHD/8ueLOwzMUsAyrQeox/vCJj7dc/NQ+8dc/pgrNRwElfjs7NUCCCAzab72jjL7Lbb/TY+qFNvvCcJQYBIN+m0fLYIX2lv4+tKmfNZ22LLi1hmxkgzcAhSanj3SwU0OND0zChKnBE8KcwjzXWh+RYI1x4vn7z7N4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 12 Apr
 2024 14:54:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 14:54:20 +0000
Message-ID: <fd5c6cce-bc4d-4f35-90c2-0875e02f4f0f@intel.com>
Date: Fri, 12 Apr 2024 20:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe: Simplify function return using
 drmm_add_action_or_reset()
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-2-himal.prasad.ghimiray@intel.com>
 <mhkrjisvy5xjgcupsgck2ps3efpjfsq3jgf3buawdj3ji2ogqi@he4rysy6eg7a>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <mhkrjisvy5xjgcupsgck2ps3efpjfsq3jgf3buawdj3ji2ogqi@he4rysy6eg7a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::32) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: b3874e3b-52a2-431b-6832-08dc5b006eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+IycQpZFFKV4xBcNQqP26V4hsRqLFSoqZgq/rPu6b3Zzuv6ekV51SEqcqWIY06Y0pyNs34L5A/FnUMhyG5SZQCOPkE78UH+ctA3/4iqSDKjevNPMWWfaNYotMy63fA9uXeSnAMKdcyg6icheEWZMw23Nk2eUHXd/mho6cSUJQgWUhvxQesf2kS5pZK935s5LfolfvUlZEW26ifmF2+tkR8Z6LPnUGXPjblGIAi1Kpk+5Mt6/Fi2CAfDreo6+sVnPPrAbpT2HS8V+nFL25XlR1EGzPEzDz6SubegTe4h7fF9J5TKFOvLDrG3g6RbbtyuHxFY7PPNSdr6wYJSgbW2/2lNJ+1PKRM3vB4lNOflPUMmS5On7FpafDJYJmtCyCDTuSoAocbrA4Owzs93FN74pU+txffpYdOC7Jyh7gEH3i9mD/3y8PIyP/hT7X0AhBxhv4VmXvtNgdKYsgDcRRQFrle1nNWdlUfRJVzsyif9bg6LpCY5fS4+dwRSeEjsqAmZU+4ecVxDUSGHsGvutSyb1BjoAq6NLINHkP2irJm6v8VEupdZQES7Asyo79CAGOOWEOfQc8O3Eao5P1viMMGKFNtN/MtFTRIgAO/06an1gcsmfbIKk8uLKUopQH98u4WEwpu5ITyFwn5RiVO3x0VSC10RbWM+52DJm5YbpFgqJC8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRYSUtBYnNnL21ZZ0VOWnZoSmFDeUtIcFZaVVdtajRvOUVUZW01VU1Hb0Vt?=
 =?utf-8?B?d0JuRGZhRHY4Wm9TenFMTG84Z2lNM01qdldyaHFJYzIzelFrUXVITlRnbUR5?=
 =?utf-8?B?UjZlOHJ5ak16MVdnRVNINXhPa3ZIYjJtZHNNTG9KenArQm9VbVBjcm5CNlpo?=
 =?utf-8?B?d0pvVUo0SWlYMHZFMnFYRHpmQ1k0SEQ4R3V2T0EydURlUmt3YmJxbUhnUHNN?=
 =?utf-8?B?YU5xV3JURm8vNVZ2ZTVOK1NSNVhwcjVrOU12VG1seXk1bVF0ZDhudFZXYXBr?=
 =?utf-8?B?UGhmR2FwaU1IYkpXbnZ1TzBOaGozN2dPSmx5aGY2d2hXUWd5NTBjNXc5V0JK?=
 =?utf-8?B?RU9aMGJEM1RYVnQwTFhybWR5aHFmbWRqRzcyQ3RlbmxtNTBISWRzMTdJMENP?=
 =?utf-8?B?U0dYanc3KzJxdTAyNVl5Y2VjUGtZMExxMU1vMmhvdWlvRHNVUjhYbVhHV1d6?=
 =?utf-8?B?anF1UU1VZkxucFcrcW0rUElZSlJpci94OTZXQ2NqTDVRcTN3OVVkZ2ZPSjE3?=
 =?utf-8?B?bFVoUi8zVHE4MU5WMWxRS1l6TEVGdGFlWEowMWJiZ25HbVFVRWQ1Qk43SjZ0?=
 =?utf-8?B?TVhFVmdKVjYwVDNabmh4SUhoOEJnUytDNVM5aTg2czVMUHMvOEtFSm5wWlo2?=
 =?utf-8?B?SXZTK1lqL3c2bGFvQ3MwVTlmMmFLbGhiU2Y3TGxJSWFZakNod2xoQ2xVWXh6?=
 =?utf-8?B?WkFvK1psVGZyU1N6cCt2ckhKakQyYVdHVUZiV1lweXYzT1p2SEhiNFhlRVpr?=
 =?utf-8?B?SU9KOE5FK3FLbm8yMkRIb29ldGVlZWp3bkZnN2xuYXpzUmh2dTVONTVVTzRw?=
 =?utf-8?B?by85QldBVmpLOHhyUExIRDNtQXFtVEwwN3NGK1I2UkFKTXlsNG9BbnFucGlU?=
 =?utf-8?B?U2FMMW5nZnp0UVZ0ZjA3KzIyOHhxK1Y4ODExY2NxUlkxWDVoRnVGbWNEdVBp?=
 =?utf-8?B?RjJLNEdtc2R2RVJxRWFyb2JCc1prSTB1V2toU29weFJFZi9veVhLSmRZU2Jn?=
 =?utf-8?B?bXk5Y3VRWWRJbC9BaW5jSmJUdng4WllpTmw0SURoNEg0QkJaWmtKY1JzZThB?=
 =?utf-8?B?eTZIN0NGaDloTEI2dkd4TElnYStpRkVYbk9lY3o2dHJRNWdwSDVZekpYdjdv?=
 =?utf-8?B?bVdxYVRGMmFDYlhhUmU0OGNFM0pLNDArTHJ4OUZnRTUvSDVHc0ZDSVpzaXUr?=
 =?utf-8?B?STByNVBoUmpLeXIvbm9zMHE0WUd2cU5GZXdidC8zVnI3VllmOUtzbVpLNWty?=
 =?utf-8?B?bDhPb3lnM2M5SUx2QmVPUGlDOC9mdkFSK09DK21xWXdreDJZa3NXV0FJdXNj?=
 =?utf-8?B?WUlhOXJIL09BSmx6c0l1d3lQcFdwRlBvVDNJVldLSHYzVk1yQ0dIYy95Y2NB?=
 =?utf-8?B?NjNXbGtZbWVKTDhpelNGNFlVdEpBSVNNWU81SDlRMndoKzRhVjVlOUpGdUti?=
 =?utf-8?B?ejFwS2RQK3dxNVJNVEpjU2JyRnFyWlJnajVwRFZlSDNQdnBkaHhLakJmM2lJ?=
 =?utf-8?B?UnpNK2dmNFFoeWlqdHRzdWd3SWhLbWtRSG9PaWpKanl2amRGU3FucTkwV1li?=
 =?utf-8?B?QWZqVXFxaTh2c1U4Sm9QdFdoNitFMXUrd2JNbmNjbXhGdVVDbEgzTGlCVGFx?=
 =?utf-8?B?T001Vk56UUZNRkRWMXFiN0Z1TWVOOWRyQmpjWnZ0YThNNjRpWnIra0tsWWIy?=
 =?utf-8?B?YVhQSjlnUVY1SWhrTFhRbC96ajV5VkdWVE9lUVNkZE52bFF5VFFqRE5EV3lS?=
 =?utf-8?B?WFlIbXYzVlMxSFhPQnp5dVlNb3VPeklYQTZmWE5CNktxT0VCczQzSkdaQkpJ?=
 =?utf-8?B?bm8yQlFuQSsvUVZ4UnVhbU03eVU0U25VM1duN043ZWYvTm94dk5NSVdxN0dL?=
 =?utf-8?B?SHQxbEhoa2wwdjZ3OVFOa2llODZPVkVvc0JuVE5FTDB2L0w2VkJCYmdHSDZI?=
 =?utf-8?B?REdOUFRRMGlSbGJ1VEN6T2lKemtvVkRWQVpRNUFIK2xGV01NVmNHNnFFcjhq?=
 =?utf-8?B?WHBNQ3loeEpxdERjcUhsdkhWSGtMd2RpYmdrY0VwNUljNEVRVUhiTGpHQkE2?=
 =?utf-8?B?RUlpbTVlSDQ1TjlsWGJYMS9RRGszS09VdENTcCtEQUs4Mzd1R244Vk5WS05v?=
 =?utf-8?B?eG8vMjdWNy94eTJoSTErT1ZEalFHLzlGRmlIUzRSbGUyaUYrcWlrRThuTTA4?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3874e3b-52a2-431b-6832-08dc5b006eeb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 14:54:20.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTN665xjls+o9VR66G6h3ucOBpm+OR0AWWWThwmrdjPtduI1qIJf48xS3GxN39r6P8H0TrwTK/On3uEW8t4HAKhYcglbEWmQS7FqUoPgFVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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


On 12-04-2024 18:22, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 01:32:39PM +0530, Himal Prasad Ghimiray wrote:
>> Instead of assigning the value of drmm_add_action_or_reset() to err and
>> returning err in case of failure and 0 in case of success, simply return
>> the result of drmm_add_action_or_reset().
>>
>> -v2:
>> cleanup in xe_display too.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Thanks for the review.
>
> Lucas De Marchi
