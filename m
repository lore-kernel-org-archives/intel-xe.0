Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A1FC590F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 08:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379110E885;
	Thu, 26 Feb 2026 08:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aIZjisWe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0910E885
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772095848; x=1803631848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6YuOeX+YnFPhYVX8owDcdrCadWjnZqfI/Nl5pVGE7Qk=;
 b=aIZjisWerFvvCTnRGfa8GFwbmyApzYHS9hKkXrQbuefoSNojo5KI+EsT
 y8dEx22ymx9t3MX/8Y020r1JFJZgVzOdLHqUNtEn5btz+tBqE7Aen+bUg
 MJLWqeqj3luR5G7nWR1MaLpFVhyyX+2nieymPJHBSbIxCMapFgrSb6nyk
 nUPA+GlRANbcQiL1wmlA/aIDg6BZwWKToV0vXt1JSUiuVWdpJzpWrGM8K
 O+4WDDEd90pjfR1lPGTtbWV65i5ap2SX04hz+Sm8q9Q2+u3ACBYzC7Ms/
 CzftKEMbi1J+hEKNuAheJh04egZVVHMt9CWAAtZxaGXeXvPwiKmE1FAw/ Q==;
X-CSE-ConnectionGUID: mcggr80YRCukkgmuM0ymeQ==
X-CSE-MsgGUID: 4N2W8U2XTTSXnw4IGuFf9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="83782148"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83782148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:50:48 -0800
X-CSE-ConnectionGUID: wFnjbb9QQ0q2QY+EnAvkLw==
X-CSE-MsgGUID: hOujScOfSPyR8/JdlXqFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221123507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:50:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 00:50:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 00:50:47 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 00:50:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in2VqpDpuKPThXLbfbTALv4+VPCQQWOYAUFaf8Y2L0UUqYrfWLIp0y33JKmrpMIlJ7vfHD2h7afH2cmMzVcoKAveQuHmjIQYerp/x7iMOItfXoydj752pW56EFatTU2NPvprOeSn6FHCi8EGt76+vQyF5YX/x0GhKKgGQ1R+Jfw/ubyLaKrV2vq6s27qdsKNF06sAvWivSuCQM4qw8DxcRR4N1tB/8NWd+PrUdju1DIKQ15Fnl1Eyw9F5v4xNcRqd1E7mfj3HCVZcW9u4S5xh6a3pgy8B+IXDhqhlj2Rb5Qkb9UCe9eFVnfha5F7AkkHJ9ooyMS8YVIJsir5u0qkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKpmjUZXTnY/PXkBEqhQrmbNDlcAfNDl4LV2tbGSYVI=;
 b=ZkGe9wvsdwIVfB4mnQcFXcRdZQzaYxr7RLOjkpebDvtEBspoVBSazcZBOwX5HOVpWsSpZ2QsgKJf1ig9Ix+AK2uz/0srMQMUt+JAlizW4rJkDETe5Q1iQuJjwlmxgSG2GGjY3HxPZZqhGEn8BeQBJMbaYoZwUkMV5hBkJpPXghxOlhpvP/8CXMfYINAEYV1LABZFRLNW+ICAnYH+46+xoRkoutt690AblfYWrIEfcQ0+R81utcZG8aXe/gbnhPl+n8tockmYb5lrh0Buzl8OgWz96jfbOoxQEw2CG44groJPeQwhKwOTuGUsWyYoV0cqyfk0tG7iKVDpp0a9z5UP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 08:50:45 +0000
Received: from SN7PR11MB7138.namprd11.prod.outlook.com
 ([fe80::7ccb:84e7:50c3:c201]) by SN7PR11MB7138.namprd11.prod.outlook.com
 ([fe80::7ccb:84e7:50c3:c201%3]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 08:50:44 +0000
Message-ID: <4600cfb3-2609-4510-bf2e-d2ed6248c4a8@intel.com>
Date: Thu, 26 Feb 2026 14:20:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Shah, Ankur N"
 <ankur.n.shah@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
 <4603e26486bdeeafac19dc8a4d0c64aa3fa988bb.camel@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <4603e26486bdeeafac19dc8a4d0c64aa3fa988bb.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To SN7PR11MB7138.namprd11.prod.outlook.com
 (2603:10b6:806:2a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7138:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: bb90bb84-91df-4061-1154-08de751420d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: r8D2vwTurS4TEG3pxitQqJnQ/eiF+UPk4KZoJ5TFLSjOL5jSLzyDENLLvzO37QnJ1CKE8cpktyE8EXgtkjqxzSif00dbQH0UnqvD/q9Sss/vrLjSx7gNQh6LTvPwEaOuDIO9+7G6f+YyDXWNULojglZyqs9ae3X0xNd4ft/xwJuz2ZtNUePlcha/WTOPPjYgSCdTVM3+rqRC8Jo51GwnlX0XTRIO3z9Tyvxi/rVb+fx0tXRbyNk1GS9C4r5AWI3PfMrbuUbK45IgklaE9TUsJFmzWeCFYpFTkKz2XnkKfjT5ZQfcYNwYM8D4a6lqIqMwzvjFYJJO0WPrnOty3P70iFuAloAYIFGto0FK1TKxCX7YO+jVIV2S7PCyaCcsCBc29nv3MmnnB/PWng6THtYFCwk7l4jlQl+cMOdHb7LmmjVspf5abmBFX63TG1WKWxXeX+cZ2+zlqyuVfB98XeHuHq9V+rlyYcgS3y6pB+FfwH+oRQKzEEUhGvfjaGZwu7bO+7L/InLokm62U2Cv5bNLtqREwJD21tM8iTXWiKMRaXWBYJ4GU8KjfvjZ2TKa6A7fOYMMnGRbe/TbgVDZmwsjUBGtEMsLlGHpHqCIAn1KuKUeI7fwd2v4cVpCuEv0Y7Eb+HuLjUtELDPYi+LTJKBRjetbKGYhzKxUMOmSHZ1Wgai+G5LF3xJmT2YT1wV0mN8NPObUmDuGtoPOvKebV4FbS2OxL5RmvwOoNEGhbUbcmcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZQOFM2KzJiK05lL0J5VWt2ZUppQmVrM28wdnJDK1NZbEtUdCtsMER2aEJ3?=
 =?utf-8?B?czE5YWxLVEE5Q3pUTSt4ZG9JZVB1TmtQTS9LdXFQSTYrTzBuZ29DMDZzZFhB?=
 =?utf-8?B?OXp4ZTlMWU9NY1VhRWt0VTBuZEtneUx0dzYySUhyQzREWFJIenhic2lJcEVl?=
 =?utf-8?B?OTRHME9idUFMK3AwM2hYZmxRZm0xZGRHOHBndldnbTUvbFBNVUE1SFdCUE5t?=
 =?utf-8?B?cGpZaUJHaERaTHIzNGd4K3kwWUZsanVyZExCMUJKQVY2dFYrRmlZRmxXQ0Vm?=
 =?utf-8?B?cWdXRC9KOHhPQkFyT0g4dEVwSWdzanFaNW1DMkxPOVFQMjUxM0FjYkFWS21o?=
 =?utf-8?B?azNMOU9UOGw2a3ljZWVkMWQ4SHk2b3JuUGtIYksweTRSZmljM1RoeVAvZXdZ?=
 =?utf-8?B?eW5NMjMwcjNLV3RmTFVZVVJJWUlqc1ZBMFppYWRjV3ljRVBEbVdlNjhPQ0lC?=
 =?utf-8?B?c0wwOURpR1U0a0U3L3NDQjB5a0RSUlFoc1ZtZVk5eUZVZWh2SEZ1RStsaFVj?=
 =?utf-8?B?dGR0NjR3WkpOR2E3T0tqa0N3MjYyQUs3UmFJK1M2SXQ2S1N3OS9oQk1OY2s2?=
 =?utf-8?B?N0hHUDRwbDJKQStVMmJJR0tzUVRDamJENmY0ZWk5VkZwRzg0L3pSZFpyeTAz?=
 =?utf-8?B?bGhoZityQjhKWmpraTN3MkJoQTZYOE5iaWRnMm5CWE52YUN0ZTFzRzRGMUx0?=
 =?utf-8?B?dTdFems1NDBtZ25DOGZpQm1aRklzWnFUeXVlU0d3alorenJlRFNscmt6WCtw?=
 =?utf-8?B?eG9OVFZVY1JTcjc0OWx0WER2Tk9ySWR3Um1QUXBCVnBxbFFrWFUzcDBnZW1I?=
 =?utf-8?B?N1Q2ZG1nYThoOFgvbzNENXNuR3p2QnZ0QjUzVEtJRUdNUDB2T3paYUtDMFF5?=
 =?utf-8?B?dFdOaVBaZmF0bVVZUk0wTWRDMnduVXNjMUVnaVVmUHRYeWJaYW01R0xiT1E4?=
 =?utf-8?B?eUFzLys2L2cxbmJOMnI5c0tKTGFqeVZkNkFmSlVRaHg5d05sck1vK09rbytp?=
 =?utf-8?B?M1p5MVFXT0NQYlBFNys1am50bUFEbFU1VGJJdlV1ZDhDekJrWmFmb3R0alM2?=
 =?utf-8?B?cmFrNmNobUhJZWlVZ3FEZUhNSXlsNm9tMmptSEdCTi9nOGxBRm4vTkJuQ3Z1?=
 =?utf-8?B?RjBLSjlaa29jY2ZVUWIwcXZJWWovVE5WZG1YZURJakhCWHVUb01GUnNlemFZ?=
 =?utf-8?B?MXRobVd3MkhRNVBSRWdMVExBbTlLeXcrc1NEc0JKMlo3L0JWelQ1YWN1NExL?=
 =?utf-8?B?QjAzZitneWFsQnAvMkwxbmtlSXUxbnhkSVdEa1FhbVFUVk9nOU82UDM5VE4r?=
 =?utf-8?B?TVFhTzJxNloxVjJoSE9KeWJKMk1QRW03N0JPcjl6cndlMmFzUGdTRkppaWNw?=
 =?utf-8?B?NE1UUkNoYmR4dFNOV1E3dnNrWWt0b01RSHNlUG4rVzhNSzA5cXF6eXFZNjdZ?=
 =?utf-8?B?Z21vQmRuNmJRUnZQU3BuZldmUERRdmJORE5GWHdNdFUyVmNaaVVWcHhRWk9Q?=
 =?utf-8?B?S3dLVmwzd0RPQzhEd2pLZDBidmxYZURQdFR2N0NrbkZkcG1pMFBZcHVtamx1?=
 =?utf-8?B?R2o4bVhlREplQjc4MXRpamRzTGlQUDBEUWJTNDZMKzJqV2dXbzBta2ZLOE1t?=
 =?utf-8?B?RmU5MnpkTFQzdlZPMk96aFVOczU3MUdhOFBlUkY2b0traE5qWS90QW51Y3g5?=
 =?utf-8?B?WElzNEVQRStPblBTVDVvNkFNUWVCV1R3bmVXeWd2eUhTL09QazZGbzRacTBt?=
 =?utf-8?B?a1htN1J0REt2VjhQUUFLYWFnblVVVFNFMlJwV0pwcW1CTGxpYStwQ2lBdmxK?=
 =?utf-8?B?akxKdzlpdklXQ0MrNDNZUWsyUHRya1U4cXkyMWxzTjJObWZIS1ZnMTk3blZZ?=
 =?utf-8?B?ZkdyRFNHdlhxc3dZdWs0d0xQV00wc0wyZWw5YzdVUUh3c1doY2dCcUJ3aUFy?=
 =?utf-8?B?S1luWTRnMTdoT2o3REh6MnJjMnB4dW9uWUZNRjVEaExVdUtlSHJkalE2dEM1?=
 =?utf-8?B?RWVIVzR1cXQ5NGlVbFRmdlF2eHY1QkJCWktQUmZUVGlkTTVSVjRBYWEvUVlE?=
 =?utf-8?B?QU5oOElHUmcrcEFPS0psK25QU1lHeDZGUjBUQ1BaaVFabTB0QTd4dkVUMW9o?=
 =?utf-8?B?VDVLZlNiYzV3aC80dVJoTC80UTk2K1FERTY3Zlp3SzJjR3ZBaGx5bUQwdEp2?=
 =?utf-8?B?anl6d0d0QXFDMjdaVHloZWpxUitzTDBGbGtwMlVwNkxqUytCMnR2MnhESFhX?=
 =?utf-8?B?OXRmTzFlWTVhSnhnaGUxcm9FTkpLalVIYWtRRnd4SStlVlpPWHFSQ25WVm9r?=
 =?utf-8?B?QzQxN3VzcEpMSlZ5OGxZZ01MSmYxV014MXRQQjdFVU9SUWl2QTM5UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb90bb84-91df-4061-1154-08de751420d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 08:50:44.7564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgF9C1bLQn7pF6N63l6b74TsTyxfSN70XdV+y1ZGLwrVtJDZUBFHQhjIQUA1/QCCuC6pQLfNxk8A/ScMsrKAAB0a/prWfvgjGpLRMVBaK4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
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



On 18-02-2026 14:34, Hellstrom, Thomas wrote:
> On Mon, 2026-02-16 at 19:21 +0530, Nareshkumar Gollakoti wrote:
>>   While previously applied only to the BMG G21(Battle image) platform
>>   via workaround Wa_14022085890,this 1.2 GHz minimum is now the
>> default
>>   for BMG and CRI platforms.
>>
>>   Setting this frequency floor(1.2GHz) default is critical in multi
>> GPU
>>   environment for supporting effective Peer-to-Peer(P2P) transactions.
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 5e5495a39a3c..881054c9cf92 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -860,6 +860,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>> *pc)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>>   	int ret;
>> +	struct xe_device *xe = pc_to_xe(pc);
>>   
>>   	lockdep_assert_held(&pc->freq_lock);
>>   
>> @@ -885,7 +886,13 @@ static int pc_adjust_freq_bounds(struct
>> xe_guc_pc *pc)
>>   	if (pc_get_min_freq(pc) > pc->rp0_freq)
>>   		ret = pc_set_min_freq(pc, pc->rp0_freq);
>>   
>> -	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
>> +	/*
>> +	 * Setting GT RP min frequency to 1.2GHz by default for
>> +	 * all BMG and CRI(For BMG G21 WA do the same).
>> +	 */
>> +	if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
>> +	    (xe->info.platform == XE_BATTLEMAGE ||
>> +			 xe->info.platform == XE_CRESCENTISLAND))
>>   		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> pc_get_min_freq(pc)));
> 
> Copying the reply given to the cover letter for completeness:
> 
> Wasn't the idea to do this only for the Arc PRO BMGs (server SKUs)?
> Perhaps the compute team would want to chime in here for the scope of
> this workaround.
> 
> Thanks,
> Thomas
> 
> 
Hi Thomas,

As we have conclusive scope from compute team
about having the change for both BMG/CRI.

Let me know if any further review comments.

Thanks,
Naresh

> 
> 
> 
>>   
>>   out:

