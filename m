Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E96C54E68
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 19:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6710E8B5;
	Tue, 19 Mar 2024 19:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4TURzyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7262010E8B5
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710875412; x=1742411412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iD9IwKHEsjxjMzFvPbMmAv0gf8M+bEavI/vVBUD0dNc=;
 b=X4TURzyECRyp/zAo/fgu5aHHrycYf1PqfR6UFP0uguFa71SBblnDIvPy
 GY0dhSnXLg1fhyNadWUXRfGuN+sS1yd8Ltq+aHE3Wp2IyslybLBiUEgN0
 3LTmuRZOydqD6fRdDtWBppoC4OJtglNxg9z84ZLSy3GVIVyM5g2JH8WOr
 UCfGItyik5NOBPSy4eznOWeeXr60ccA86tome7jtoPQR3nsthZnJj909G
 11lcRehZGt8WuN+9Bp92+cIFjXwQID5HphX3rzBmDfb64VRftnV9ohsZd
 NUmvMZARhiRR4umwdqu/dCodsgs+ZUZiTpnAd6F/hHpJAaKfVoqE0HqjX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5608622"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5608622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 12:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13940487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 12:10:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 12:10:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 12:10:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 12:10:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 12:10:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHJDgoOPjyTg8oNRx6nhfbiboHeLeTzdJoROH3L0Re0NP4E0c3p/aZ+FtxaveMlvYaB7uAXnPyM/rJxIFuP1KOF2ZsrkYcXjWBZ7RgQcYkqYjFflt3XJ8hJu3kBDWYdqu6mPqm+cfAKVWhtptjC2ll75uu/LyTmoLrgFXU7JEmL25uHRDxwUWe01T0SOGaYHlf1zeZ1iNpxH64TD1Fyouj4NwY3X+Z5Rs/WIDbyYvaf8IBW96i29gz2XspOH6IZAj6u3brp4iedAehDKh7ww1AAllx+7Nk84tW6hxTG9Qz7QmRUXw6svnooyoOnP7sDbLCTNaCe6uJVtKra4ua5KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cESK5Atsrwen7W09kaZArTyvVAjIOI0UG8RdNJcKoDw=;
 b=ocu4fWrPPNy1UhAo9rvJNlqMQnQKVhRKxheaEtSH7E9OYSj7R1WT22rBRRb4P4+iMtUO0gCNbyWMBzvMrqUwzasMOspQW6JUab4KAHikrFLMKcQL3esKGw0f+WUdClJxgnZ9fh5TeD6Qs6YcpyPQJwfDmjTeS048+U33Gk3QIjiOjYyQ2zUmqPjz5tSz7tRoUCiaGTFE4znVZ+EnI+H9c/XYYurRCfNaSh0EbxrZ4kC6clGsPgEHdYfr3OhrvBogre1fEz5kYgPWdidly2hGonmQ13nNIdObSdhfwxWzw77yJWp+zHZ5q445f4fxO0McDMoWnpCmIl3h25i1lI0RXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.9; Tue, 19 Mar
 2024 19:10:07 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::5144:aca9:5cd9:42bf%3]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 19:10:06 +0000
Message-ID: <68168f0c-91cf-4e13-a3fb-ad792a2634c1@intel.com>
Date: Tue, 19 Mar 2024 12:10:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Don't support older GuC 70.x releases
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
 <dw54uqzedkjsbhoiadem4lzjhuwpud7m7njenel7tfbc5fuxwm@latczhpxzijn>
 <ff14df57-690b-46bc-986e-90b428cd694c@intel.com>
 <d817e344-71f2-4d7b-9607-7c63483b0228@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d817e344-71f2-4d7b-9607-7c63483b0228@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 546f6593-6b62-4ad1-2cac-08dc48483065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zROD12obMfYayyiYo90MNwQLN4+a3smqJiGtvwChwSN7R2Mf/i6P0/7j3itwqUDPO0H4cX5tpKJ2n3jf2VY1fnBwBH8TXKxOr61FZsHGj5Ub1j/5epcg0SvOmcQKEtH1uCZU6+ZboauCxNacA4AIVAC5o+T/VCmyHLOduKytcqZpzBcB0q+G3iTqWAmnawjReokx4X+q1Nxv74/cqisjP9CJ3I7HH5/33R7o4cQBCeTLVgqpOjBftRi05c5Q6SPW5WYC/b2H0bBvKjW4DJA9GqzpGR8Q8SyxB4Qb8JnovNKvD/3Ai2KiJqHERwLHT81l7sFgcxQAUgu32uiKxGTE8NicpP0x9bmYpBy0fXwUg8ImrIpZ7Sj0mfYuXtZu0ZFoXED1FGYmOdnBoPmlON+O8UFvq7zMwq8HEjzvcAiBvRfvcK2x23YnyH8qzYuefI3dSSY5eI0alfr60lPd5LjCUN3kkT7rdbaMoyKk0dBjYxNBdEiuvKrEsC7ExuGH6N419zy21J0B+Fn68kzqZYu01P3gSt5deXLAzZGfuRVeLTeJHmyP/fMwQQPbcyggtf7LSVG3jg8e39Zb3lgLY3ITgJ4FVns7o/d7gPyoAg8AsmCF/OWWD7s7XQ8M2Sz2kTm/75UfRmn9jfTWTTD5MHiNfsj0bQY8XOxvQGZirNbQ2q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVppL1htU0l4cEFzSGNMS2tGY0dMbXVTSEp2eHBQdCtzbGJEMXA1NHpiNUk0?=
 =?utf-8?B?ckRabXZrSUIvK0UrZUxZVlIwYmovRnNndklpV0hBNWx5RWZPaXpvd1pQRGV5?=
 =?utf-8?B?MjFTS1VmTmY2MEh2V0xtcURIK2VGNmQ5Y3h0c3oyVGxxWEZjSVNmT1dIZEta?=
 =?utf-8?B?blZxZGU5WVZOYXRXMlMxZFBxWFljVVJncUxQTU9OSEtDUlJHQzZKZ2pldFI1?=
 =?utf-8?B?aGZVVWNSTGVYOWRiN2h3TThaYmpCdDBjR1JEbGRyUkRLWjhNRi9lL1JKVGxT?=
 =?utf-8?B?YTV1VlVxUU9XeVVuMUZhU1lESisxZ0M4TjRvcnQvaDdLVUtWZERraTUwcEtl?=
 =?utf-8?B?VUxMdWhuMGJSZFdYWGY0Q0xHUlZVMkVsZlJJcDU5T0NhbXg5bzY1bmRKOExW?=
 =?utf-8?B?dElXS3FISmpPYUhuT3dERzFEUXhRWTRPQTdPektmMllXM1Zlb3Y5K3ZDeVBT?=
 =?utf-8?B?SHQ0MWc0TEpxRDFOV2RNckFwZ1g4TTA4Q3ZGUDByVkw4M2x0UGwrUHMvTDhB?=
 =?utf-8?B?elQ2aUtUS1F1Tm1aY3hGcGd2K3dSN1BTWTJZV0RUNytDcGR5RTV6RVd4L0kx?=
 =?utf-8?B?Rmw4MWdCczFOS3lYV2VKRzJSbFQvbGI1RGE4SHpnaDdGSWx4TEs5eVMxSWRl?=
 =?utf-8?B?WVBqMGVMU0wxNmJxTUZlZ1lJZHVoZlBIOXUyVFZCVG9jMDJXUnpISTNvc2RK?=
 =?utf-8?B?anlOQXUzTWk5Z0xhQ01USmZPYVZ0S1hQR1d6U2kzejlUYTkyRzhMSnVCTWI5?=
 =?utf-8?B?VnlhT2hvalBHSWR0UkxRMU9jcU9lWDQwOCtTUGtHWG1nVGhNZTJ0YUZ3ZCtz?=
 =?utf-8?B?c1dERGgyb2NCYUpWc0UyeW5wUWMvM0J1bkJKcE1kc1JvZmdmYlBYalA3cTJU?=
 =?utf-8?B?dmFVSnZISURRaWtTcC9UY3ZKL3g1U2NTV2tNeEdhMW9jQ2lmb2ZiQ3dROTBs?=
 =?utf-8?B?WnpqMnR1VmV0MnVEWDJpWHl4VCtDTTBkeEx4NzJjVFFLeThRZ2x6eit1NElO?=
 =?utf-8?B?Lyt4ZlVOS09IMG5aZHg1WUQzcWI0YTQ4TDVYcjlCSXdGNE9jU3I5am5LU2ZD?=
 =?utf-8?B?b1pZbkxBN0R2Wjd0OUxwRXE4U1RYU1dVejgzZnQzbHFNRlN2VU1SdlJlMi9l?=
 =?utf-8?B?bDgxNWxKL0JpQXJaZ0VGVmVXUzV6Ym8rWjVXQW0rQ2NlbG54cEtjWVpPcU92?=
 =?utf-8?B?L2lDaDczRWJZaWJEQndmcTd0cHlyMEN4cHdGejUyVFo3TW9VMUhWL3NpdU5O?=
 =?utf-8?B?ZVUvYTkwdzJYWXRHbklEYkRzdUdlSmlCVUhHZTNoVjBib0NqMXVPelFkS3ha?=
 =?utf-8?B?eDFPN0VNdlRUMWUyYiswTEFLaWNVTkI3SXlyN1NaanpMMW5tRk1nSFFiY3Rk?=
 =?utf-8?B?SUl6N0lPMXFLUzRZQlphV1A2NWt2eERxb1VzWmk5N0REZHQxZ2d5cjc5M3RO?=
 =?utf-8?B?b0pDOFJKcUZEZDE3KzVEZWdleGpnblBmM3ZteXJqUDY3OTFadjM2UVE1RG9x?=
 =?utf-8?B?OWpnaEpqcWVRTlNXeGNFOEkrWXh5SmJSang2TFNGQWpQV1VvbFFYNUxmTStE?=
 =?utf-8?B?QzRqQjNkY3V1S0ZGeG1sVnBPWUQ3UW9MaFJqNnlySnhMeHdGWFBKSlpVc2Uw?=
 =?utf-8?B?OHJkTGs3YTdldkF3VEs0R2o0L2Z4OEsrdHk2ZTdwNkViaWVJaTFPWHJncjU5?=
 =?utf-8?B?ckdNWFNvQXFhd3FpRlVOelZDZDFtcE83ZjhVUW1zN0JRNWJzMEZ5OSttOThG?=
 =?utf-8?B?ZGNkbDhLZ3FNWnF0ek94R25rL3Zpdy9QY21SQlIya3JsdDFqOCtzSUFyQkFa?=
 =?utf-8?B?UTY1MktJR1psWkVscmEwblh6L2lsRXNoUHBPdUFpNWhQaXBGQkJ2NFpSeW1i?=
 =?utf-8?B?NnJ4dlpITGNZNXpGeU1IL0ljcUFkanBRZTVYcUMrNlZhZU1aM1VWVFZ2bVN0?=
 =?utf-8?B?UzRlWlJRMVRtUEp5SkVjb1I4WGpqNVNOOEFaVHhwTHhkUXVObURkcnZzcWlP?=
 =?utf-8?B?UDFzZ3BBT2JBVHdiQ1R6WkZkK2dnUDBnMmZ3K1drb2NNSVJScWxIb3JSMUdS?=
 =?utf-8?B?YVZQUUQrMlhzM0tKazdraGQ0a1dYa0tFbWZtSmlYZ2c3TjdtOGt6OTE2VnpL?=
 =?utf-8?B?ZjhCcWtHcXJ2OXJUUkNOVXVEY2FRWWFhbTRzdnphL0ZVL242NlcrRk0rT0dV?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f6593-6b62-4ad1-2cac-08dc48483065
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 19:10:06.8015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: figniOYc1YYlp5EsibtMtqK72hfloMz6PQ4acshME9SImJ/4yRk6et2Zmu3LX8Mpg17zjzUiUQBAsD6OVQE/vfgQIbT/GkeRrSFvblTmNXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
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



On 3/15/2024 11:37 AM, John Harrison wrote:
> On 3/6/2024 03:06, Daniele Ceraolo Spurio wrote:
>> On 3/4/2024 8:38 AM, Lucas De Marchi wrote:
>>> On Mon, Mar 04, 2024 at 08:26:16AM -0800, Daniele Ceraolo Spurio wrote:
>>>> Supporting older GuC versions comes with baggage, both on the coding
>>>> side (due to interfaces only being available from a certain version
>>>> onwards) and on the testing side (due to having to make sure the 
>>>> driver
>>>> works as expected with older GuCs).
>>>> Since all of our Xe platform are still under force probe, we haven't
>>>> committed to support any specific GuC version and we therefore don't
>>>> need to support the older once, which means that we can force a bottom
>>>> limit to what GuC we accept. This allows us to remove any conditional
>>>> statements based on older GuC versions and also to approach newer
>>>> additions knowing that we'll never attempt to load something older
>>>> than our minimum requirement.
>>>>
>>>> As an initial value, the minimum expected version is set to 70.19,
>>>> which is the version currently in the firmware table, but the
>>>> expectation is that this will be bumbed every time we update the
>>>> table, until we remove the force probe.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>>> drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>>>> 2 files changed, 16 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index 0d2a2dd13f11..ba2ca6895917 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -133,15 +133,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>>>>     return flags;
>>>> }
>>>>
>>>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>>>> (pat))
>>>> -
>>>> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>> {
>>>>     struct xe_device *xe = guc_to_xe(guc);
>>>>     struct xe_gt *gt = guc_to_gt(guc);
>>>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>>>> -    struct xe_uc_fw_version *version = 
>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>> -
>>>>     u32 flags = 0;
>>>>
>>>>     if (XE_WA(gt, 22012773006))
>>>> @@ -171,13 +166,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>     if (XE_WA(gt, 1509372804))
>>>>         flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>>
>>>> -    if (XE_WA(gt, 14018913170)) {
>>>> -        if (GUC_VER(version->major, version->minor, 
>>>> version->patch) >= GUC_VER(70, 7, 0))
>>>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>> -        else
>>>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version 
>>>> expected >= 70.7.0, found %u.%u.%u\n",
>>>> -                version->major, version->minor, version->patch);
>>>> -    }
>>>> +    if (XE_WA(gt, 14018913170))
>>>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>
>>>>     return flags;
>>>> }
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 7751d6ba6ce0..fa06b57d2af5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -297,36 +297,28 @@ static void uc_fw_fini(struct drm_device 
>>>> *drm, void *arg)
>>>>     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>> }
>>>>
>>>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>> uc_css_header *css)
>>>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>> uc_css_header *css)
>>>> {
>>>>     struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>>     struct xe_uc_fw_version *release = 
>>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>     struct xe_uc_fw_version *compatibility = 
>>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>
>>>>     xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>> -    xe_gt_assert(gt, release->major >= 70);
>>>> -
>>>> -    if (release->major > 70 || release->minor >= 6) {
>>>> -        /* v70.6.0 adds CSS header support */
>>>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>> -                         css->submission_version);
>>>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>> -                         css->submission_version);
>>>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>> -                         css->submission_version);
>>>> -    } else if (release->minor >= 3) {
>>>> -        /* v70.3.0 introduced v1.1.0 */
>>>> -        compatibility->major = 1;
>>>> -        compatibility->minor = 1;
>>>> -        compatibility->patch = 0;
>>>> -    } else {
>>>> -        /* v70.0.0 introduced v1.0.0 */
>>>> -        compatibility->major = 1;
>>>> -        compatibility->minor = 0;
>>>> -        compatibility->patch = 0;
>>>> +
>>>> +    /* We don't support GuC releases older than 70.19 */
>>>> +    if (release->major < 70 || (release->major == 70 && 
>>>> release->minor < 19)) {
>>>
>>> there's slight chance of this getting out of sync with the firmware 
>>> versions we
>>> define. What about adding a define with minimum version just above
>>> XE_GUC_FIRMWARE_DEFS ?
>>
>> I thought about that, but I was worried that'd make it easier to 
>> accidentally update it after the force_probe has been removed, while 
>> updating it here would have to be more deliberate. I guess I could 
>> put a big warning comment above the define for safety.
>>
>> John, as the one who most often does the GuC updates, any preference 
>> here?
> I'm not seeing a need to tie the two together. Indeed. it is 
> absolutely forbidden to tie the two together post force-probe. So what 
> exactly has a 'chance of getting out of sync'?
>
> For sure, you could have a define of the minimum supported version 
> rather than having it hard coded with magic numbers. But I would keep 
> that define local to this file. Nothing else but this one test should 
> ever need to know. Or rather, anywhere else that does need to know 
> needs to be coded accordingly. I.e. if the check is above the minimum 
> version then it needs to be present but if the check is below the 
> minimum version then it should not be coded at all but just assumed.

Thanks for the feedback. I'm going to go ahead and merge this as is, we 
can see if it needs changing up if/when we actually need to bump the 
minimum.

Daniele

>
> John.
>
>>
>>>
>>> Anyway,
>>>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>
>>> for this patch or to carry over to a v2.
>>>
>>
>> Thanks!
>> Daniele
>>
>>> thanks
>>> Lucas De Marchi
>>
>

