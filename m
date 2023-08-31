Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DDDC83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 19:02:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153A10E6BA;
	Thu, 31 Aug 2023 19:02:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD1B10E6B4
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693508559; x=1725044559;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4F0cx6dsoL1867unupZTlENAylMjivs/CHLuntOxAHY=;
 b=Wtdvw3F4Zo+00+1zQpgFkWvvHGnn3dla2ifI9C4SOrWSjpfnMPhI/N4I
 xAANOE6AuRc45RTME2bQxgcxGnV423ueGgsEshJoc6HOuieGozjtYCoed
 8/FpzWu+wG14F1Gqe8HYt99cFeLf24T2rijUt52OfdcTfdYMuCWwFUr41
 nv8c505RJDAeVSVlPPPUH4u3izroCe4enLuqvoVOK4RoQbrf0xNgikiTI
 Of8HFzTC3KjWSkRYFzj53XUQlR7y8wp/5cyXuwhFFCJAOIU9stEhkNYZy
 wFnmLhEO3GN0BpZErXAcBaxR9XW6Tj/joG7fwiimx8NXQXoLLj+PPY8Nq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374946404"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="374946404"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854389468"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="854389468"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:02:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:02:37 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:02:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:02:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZqw2nIsaye50QA/G4DGLtDZF5lFB9eYB5I6Gh0EE8Lk+1gCQyAt/tPEqg6SVHXsv0gs+blf8N/BankIIimpou20Ot7TPT7HVQD+d6YUrypF1ZfeG5ZH2v4QmvSGnkxHTE/dxvNe71Csq0922/IJaQBjrE4FRg9g274hZ147ZbnIe1jWt9G/yR+R3pBhTXO9MMYP4hZxo4WPsZ9wSbzRasmlKVXgRh7U0GmpWcNLkqgs5LPuKaaGb3zr2nXzoEgLVQOMZBFIjXt2bWGu+3de0DSXVgakkvvm8BB3pR1oNnR0SAUqlwoaSNZC7EICUoo4MvmB8IFQNZJIHhTVGvL8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD/iZUyEwnhBp6dH9hhuMB/0J+G2XOYxTFveC8s1slw=;
 b=G7Mt7YN2R51620VZ5eAYk0qJCF2xg14yqg3ahXcALSUy6B+6lk8I82E9TYubPJxrVtNJOd7VMkYiEAr03nBJPdmlpkcUlODFOh3w2GIXluMilRgw+Tb9SLPRqol5XJIT5UJ0h3ant2AR2di2nLqfGkTJh/sshqXdMOgK8skdI+dJEYBaT3hjq/cMHq25vYEfqSO8zRwwO306AzDYLgQf27ekUbgXugqXY9P6dtKaaRzGm/rirsQU7WuqjRxMQJSxs9scI2Rf2FbpHCcPffqrLl2rqYP5Xvyji/pqFhhHRR5x6iQ/lsuJfPz9ejSOk/trh+vmWN1eKXgoIziN/LecWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 19:02:34 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6699.035; Thu, 31 Aug 2023
 19:02:34 +0000
Message-ID: <833fb5fd-2c95-08cf-5643-968dee6e5ca3@intel.com>
Date: Thu, 31 Aug 2023 12:02:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230823050955.1226024-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fefc97-27df-4628-7ff8-08dbaa54d58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLM27rTrx21VVQQ8Nhf9VfU58GUmQapEmSfxGVmXhKz9bnCwPqcLuXT292CgZ4ftDbBrvK0zd+qTcQ3UWB/rTVqXiBzt7ndS3rs1bRNyflzMSqgnYMvtByVAtnvie5wplXQLxUHxx9OSe8GRmOjIYaEHe1tZBauLTvf8qwok/p7aWQgxROR9iPrsFuwjXl7YAp6d3QOFcl38aTQab6ugbzGJUjIUKLY+cDbv4rzMZn0ZyVjPCO6qVSfJXfxhtlebTJHfbHJEEmWd90SZXbPufG+EEgP9DKUGFyU3qIE12hT9LCbeaRtR9sUS6qAK0VeInbNf8dknOTwoj3YFR+oTH4kgMjM+lKWyxIVBPQJudSZBj4OTITQGGktKehU94Xa6ZISWn8HQtJ6xEWGHZO4aqtYbexsfR4BsCvpWQv29FeAR0RZww28gqmeJmQWbWE9suiIKqE1q1Jc4IFbS0pJi5+Co68ftawPsgkkRRuXhklgLD+NQ2yMm5Fd8cpLaYMpBSG9MX7lcv6jR61SeenLTGpI9jt3tTuJOlNuMMrsGKsvAP/aGOdVzrqt272Fj0Py63AL4mQ7tIyDdnTabtFM4ljWJHWTcQIiSyKb9sQXmiD7woDPxIU5mOai1z89y9Kh9o3DPG3+PZ+CNzWAY58sQq8EPtbpdC9H0WQYOByh2gnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199024)(186009)(1800799009)(31696002)(6666004)(53546011)(6506007)(6486002)(2616005)(6512007)(38100700002)(66476007)(5660300002)(8936002)(82960400001)(8676002)(2906002)(110136005)(86362001)(36756003)(41300700001)(66556008)(316002)(6636002)(66946007)(478600001)(83380400001)(26005)(31686004)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZOK2xYOVp2WmtRYWp6cU5NUkFOUjJpSjlTbTl6Qk1tbGdPOWd1OVFoNnp5?=
 =?utf-8?B?WE9VSDNKMk5GRGdQOHVPbEdQVXdFbDE0dkVKcnByOWNib2hHWnVjWG5mTkdW?=
 =?utf-8?B?WC9QT3FYd21zc2h0RSsrMkY2N0tzbDBsRCtuWVRxTGZ5czJYbHVMUEorQkZP?=
 =?utf-8?B?WEUxM0cvR3hYalQza0NyVk12UDVaL21UVlg3NGl2S3lvR0JVRDZicFgwbmRN?=
 =?utf-8?B?czBRQmV0bWVYQ3ZBeUNvVWNjSTRTRkcrUTdNQS96MTYyeklyRWE1ZHo5d3hN?=
 =?utf-8?B?a0IvVU1OTExUYmMyL1c0em0xSHgrNGlKQzNCL1RUbUY1RHdlOTVRVG9FUFpM?=
 =?utf-8?B?bVU5N0Q2YU4rTVJ1Q2x6TjZDR1l6WUo4QytYSHdrcURNcjhQYWRKVGkzWklu?=
 =?utf-8?B?cjBraG9ONkhvNVB4V1JmMkV5YzBkaWo1S1Q3MVU0SFIwUWdNQlpERnhYQ1VV?=
 =?utf-8?B?V0tFNzg5VWE0ZDh0YWVTM3o5UnFYZk5uUTJxVjBuN0pQcTUyQjhFOCtPRGZs?=
 =?utf-8?B?YS9OSFBMd3owSlFXRTVoR1FmNW1JdjEzQ0s5L1VwMUtVczU2c3hla1dVNmp3?=
 =?utf-8?B?SjkrVWRoaXVVWllKU1Q4cG9jYmdkYUY2c3puUnpteFdYTDNuWXRtbTAxUllZ?=
 =?utf-8?B?dHh2Z0lucWNEQ2YzNHlHNDFqNERmMzY2VVcrSnZucUdqMlFBb1B2ejhKSHRL?=
 =?utf-8?B?QXl5dXBCeWJWZFdKZFE4c0g3MURXL3RsalA4Um94R0ZNRWk2Tzl5dG5NVndz?=
 =?utf-8?B?TnlBc0dtLy9Pb3Q1T3Ntd1E1dGcrTW1OelhtUWw3RnhQTzVLakh1M2F5dGta?=
 =?utf-8?B?YUxhQ3hnbmdWNTVuS25tNGxaY1ZxZWo1UXV6aEpZOWxoa09YZnU0aTI2RjRU?=
 =?utf-8?B?T25oYjdHQ0RhYkNOOXpnd1cvbVpJZVMxQXVKRnlsWXNSRmxkSXljR2VDSWpv?=
 =?utf-8?B?SnJXbHFvdGkvQUE1T3IwY1k0QXd6OGFyTktaMUZZaWx5RUpnbk81Y25sU04v?=
 =?utf-8?B?eE9saWJ1RUcvZDJHZUJ4dzFyRUhIZTN4NjVtd0NRREM4dHo2NVhkc25sNUp3?=
 =?utf-8?B?QmRCaVlOYjRKejBkUm5GbG9lMElSa2Y2TlM4cHp0U0daV1k1QUQrcVIzZ1Rk?=
 =?utf-8?B?b0VLMHVPMjh4WFl6M3JON3Q1S0YrSWxETHFWOEljUFM3dGxmZGJwZzMyRUNV?=
 =?utf-8?B?Rk5haW4xdlVxS0FuemFmSGJ2QUg2NE02bW10Z0F2Q3RIM2xkcXpOaXFGM1BE?=
 =?utf-8?B?MFRCTVMrMXhFc0I5TC9MbDAzQjNFZjBSeEFnZnd5Y1VHbE5qcHY2VGZEcnBI?=
 =?utf-8?B?bTg1M3VsV0xEQXBSVW5tWjVTMFFOdUd1TWVhN3YvS3U0SU9WRFh1NXlxUHlu?=
 =?utf-8?B?ekFrNmZDN1VFc0RVdGIzK1dIZDA3N0RqSk5mdXY4MXhIS3A3TDRUWEhsNDQy?=
 =?utf-8?B?S2pMQlppZHphWGtwb3k2S0c3VFBDcVJ5U3hCdXNVTUJjbGFDTkkva1BoYnJl?=
 =?utf-8?B?eEo0QkF1czNzdzVrSXVNNld0RGJQMHk4MEg5ZTdzSThheU42TFBZMlpWcFJF?=
 =?utf-8?B?aTFoWVNOM1FlS3VLUERsa3l4c2Y5YlprQVlWU0VJVFlNQ0FUY3cvYVlrd2RN?=
 =?utf-8?B?YllNZ2c4citEUHFjZkwyLzAxc004RHMwZWtwUWsyTUJpUTVQa05RNS9FdXBX?=
 =?utf-8?B?U1RwTGY1OFpITCtFTnNSN1pKSUlBb1RpbTA4TVBzK0ZsOHFRWUp6ZmtHbUJO?=
 =?utf-8?B?SmZja2tEL0NHYW9Ic3dxZndzMHYrRHBxeTZVR2ZxUVZHb2NQdWZiZm5CeTc0?=
 =?utf-8?B?NEl4YjZqWjNiWnZEOVNLOXA4ZlZmQ3NwM3gvVmlJRWl6RVdzMTJLNWFPZjRv?=
 =?utf-8?B?Vm9JSm1lU0VYVmh6b1h0ankzRXJUMjRWNEdFdmo1ZTJQSkV5Ti9sRzZWb1Ez?=
 =?utf-8?B?QlNzdTBWdVJDczlYRkxNZmxTTjY4OVpvN0dxb2ZoQk14T3pTY21heGhicThF?=
 =?utf-8?B?OXo4dk5OQTlKd05obGlKMElva25uUVk2ejhmakJuK0JrRWhIOWN3ZXAxWnhY?=
 =?utf-8?B?dm9iR3d5WmNtQlZ2S09hNTAwaXh6dmVlRTJ2OVZRbmJjbkI5a2Z1aDZQd01W?=
 =?utf-8?B?YVZIVDlhYWlxUk1oOU5nTmQrZW10dktsRXFGTXYzeERZLzd0czJzRlVKbzJN?=
 =?utf-8?Q?/+PyIwToF4eKocoq/3BWPvI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fefc97-27df-4628-7ff8-08dbaa54d58e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:02:34.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fKcmLlM8QloqJFYWxMjKCLTVjGUdhmBMxJIKRDJAslAURHwbPQzjavDels6NCs1uT4Ukjs84jvvJ7/vFh2PvX3C83ao5Y40bHiIfr3gg4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
 for D3Hot Transition
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



On 8/22/2023 10:09 PM, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> only enable/disable ctb communication.
>
> Add a function that enables/disables CT communication when d3cold
> is not allowed.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

xe_gt_suspend and xe_gt_resume do more things than just resetting the 
GuC (e.g. marking submission as disabled). Shouldn't we need at least 
some of that in the runtime suspend/resume scenario as well?

Also, which paths and how much we're actually looking to optimize? Are 
we interested in optimizing the full suspend as well?
To elaborate, we're not actually killing the GuC in the suspend flow, 
we're just resetting its SW state (i.e. putting it back as if it had 
just been loaded); the actual reset happens in the resume path in 
xe_uc_init_hw. If the GuC and the LMEM have survived the suspend/resume 
flow, we could theoretically just restart the SW side of things 
(re-register the CTBs and start SLPC) in the resume path instead of 
resetting and reloading the FW; this would be a lesser benefit to the 
runtime path compared to what you're proposing, but it could benefit the 
full resume path as well and it'd have the added benefit of keeping the 
2 paths the same. I'm not sure though if the LMEM management could end 
up breaking this approach by moving the memory around during suspend.


A couple of minor comments inline

> ---
>   drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h |  2 ++
>   drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
>   drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h |  2 ++
>   5 files changed, 85 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 13320af4ddd3..0d52621ce64d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
>   	return err;
>   }
>   
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_suspend(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_disable_communication(&gt->uc);
> +	if (err)
> +		goto err_force_wake;

uc_stop() might already cover what's needed (or could be expanded to do 
so), although unfortunately uc_start seems to not be matching and 
therefore not usable as-is for the resume side.

> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_info(gt, "suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_resume(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_resume(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_info(gt, "resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>   				     enum xe_engine_class class,
>   				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..e6574e51004f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>   int xe_gt_suspend(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 0f06d8304e17..6bc01bb45fc2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	}
>   
>   	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_runtime_suspend(gt);
>   		if (err)
>   			goto out;
>   	}
> @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_irq_resume(xe);
>   
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_runtime_resume(gt);
> +		if (err)
> +			goto out;
> +	}
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
>   			goto out;
>   	}
> +
>   out:
>   	lock_map_release(&xe_device_mem_access_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..b5b53c8c3edb 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
>   		goto again;
>   }
>   
> +int xe_uc_disable_communication(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_disable_communication(&uc->guc);
> +}
> +
>   int xe_uc_suspend(struct xe_uc *uc)
>   {
>   	int ret;
> @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
>   
>   	return xe_guc_suspend(&uc->guc);
>   }
> +
> +int xe_uc_resume(struct xe_uc *uc)

This should be called runtime_resume.

Daniele

> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_enable_communication(&uc->guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 42219b361df5..29bd692d8800 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_hwconfig(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_init_hw(struct xe_uc *uc);
> +int xe_uc_disable_communication(struct xe_uc *uc);
>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_resume(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
>   int xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);

