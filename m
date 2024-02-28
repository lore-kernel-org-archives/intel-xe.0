Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C6C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DEF10E593;
	Wed, 28 Feb 2024 16:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bf+SMlmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9DB10E593
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709139138; x=1740675138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=1pMkx0W6eQ9xw1CVYQYeeJK5e6GsFvRdqL1Xf4Xsji4=;
 b=Bf+SMlmMIo4D6mf3qj1YYyJbE2MruTwdINFf95u3LG037bcWMzIp8KIq
 vSQAHeDWNbjqQZwS0Fv6H8JC0sv3GZoBCE/ufQYAG3BUCF0G1Hsqcotv/
 B+nfkSeO/M2Ul9exqsoMQtu8FscdNythkBsMTWsjUrm8wlkgQDvKJZUtp
 FaiyEWuBYi8e/bJJZqAPxRW5d137AnCynUSE8TrnDhYUrGAmDzAiYdx8e
 T/t/OaiHI+QJPq7xFwV1F6FPqp+jKd4p96Kp0dBSoNHNgRD/XNvwNaq33
 IqmwbGpTTDh05RgcIOLiYcUFN3JdlwhYlFtjEI7spdn3+0N18Wl/GaMe6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14988788"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208,217";a="14988788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208,217";a="38338018"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 08:52:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:52:02 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:52:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 08:52:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 08:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGO33d66GgTvG43ur1sHqDgRjB9axNOTkZcYEnvDmT22DROexgwfxuribaVJUreXrNt2OulwHjwRLYFxIty0SiI+Dgk9XgQdTJoTfNk/QnKNS3ngLHIlS6sO3v4mQS4rFwaqEbCaF/xKBCsIC2jKrG4lyiGlxnsyTfN7fBVGCzQsRwkGkzsqycx8DbQUsZC/ipkbTd7Lq36c57Ny9nJaNvReIzyptafnzCvm6K3GyBQ7v2JK1kbay7241yHum380y1om8vWvUL7jStJCh10hugASy52ruhwHrEoIHDOn5L3PWmDM6gqV60r6AIRBDz7pNK+w8x8tT7gGCtRemlYohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhVCHqfKhLwHI3Xtnns3lDnRuZ/eI5vem/LxVkFBx4s=;
 b=N+cx1CPLs4dAE/rQm5+Qm1zz81a1PLAYtSCmk8h0XhPTaVx/ft2utpu5cSIOGP1EPTXc5ZF/WXifh/67aPsw/KatVXeVOyHrjvq9NUsVF46BsUjpzq5S2YfC1sUn5Id+jZO7oIyep/dtAosApePqoYoysGYTtbMWVRbw5vFFfxuu3/sJfH+qMrTqbS06V8Vjj0uEh4hltk6zFZyJpP2nlCKlHIYb90LRgv6RSbVa3da3hJQVIH3EzhienUdNLGRsSYBhVtsqxF/RXgY7X2YzNqtIeKD9oSte60DjSIlVJd9nQlnYYz3YhhDK8iO4u7vJWYRI2ttn5wdhvXlTgpbD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Wed, 28 Feb
 2024 16:51:59 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::ce60:5b9:e62f:ed8f]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::ce60:5b9:e62f:ed8f%3]) with mapi id 15.20.7339.022; Wed, 28 Feb 2024
 16:51:59 +0000
Content-Type: multipart/alternative;
 boundary="------------FFCNjEbFP0sDbe3NreTW4QqA"
Message-ID: <0b679efc-9dcb-4c31-bd08-c853b25cf566@intel.com>
Date: Wed, 28 Feb 2024 22:21:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/lnl: Modeset sequence change for DP on LNL
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
References: <20240228161144.648776-1-shekhar.chauhan@intel.com>
 <170913866639.9528.1555853125695537276@gjsousa-mobl2>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <170913866639.9528.1555853125695537276@gjsousa-mobl2>
X-ClientProxiedBy: PN2PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::6) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8f8a89-c007-400f-61e2-08dc387d949b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k4Q3h3gH7H4sMzjwHbwNT0UoZaEuIzrOBN9s2Oerfq8MDz+t7XGYjLQxOW53/qgqiOHCqu9OOzuRdFnOWfsvt3kmG39aYU5Wmi8/E9gm84olvEqrKEKbRRHbTp/nm9beYJAG6qNWUvk7z5iB8/PV8AFlZJlFVOgbBLU87rXc+EYwFpz5prZaxmP0C6n142jV7BYgWadFmsQC6xtmDXXIzC24pzCgPyo+/6fGNCVCGOGM6Fd6/ij9zSSikwFwoSbOjfw9Nzek8Y89xdqJ1JyGCNJDEmpOit+qcZqxVvfYmALujCuFqZfTs4PqqJajCGax+ASV6ox+0tGxjOf9luOpXkMI4E+oy+clbMI5aEb4RDeNDL9hC8k/xFhEkYvgaH1mzYD9h9FQP45jvaBHYspBoVsSrNOO/dGbD7ulIsYyEF9WGHA8djiePIyyj8g8x9JNOXE7zldPKpO1o41IeuEwt3EGf0tcSbULnG5erWfb+uqNRwpXe7lCSwgUEJZy/u2yq3KL0+gTl1Nhb6Pbtg8mr+u7//xDj9pBjIHLFKTL/QTaE+CKV/fHZw4EZBHF9ut5BYYwjfWyM6Fonzks4v+WwcRMHiOeUw6CiPcFwkFVF+v+jhXy9wsYWy+xaKbISnl8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enhDNzAzSkxGalpzZUh6VTJ2dkZOMzFRRXl2cGpUU3ViNHlONENERnc1MEpD?=
 =?utf-8?B?L1J0Nmc4eUxSMWZyMmg3b3FTUG4ydVcxbm05c1grRW1QNWwrUGxvVE5GNW5O?=
 =?utf-8?B?di90TUl0RGxUMXRPZnc2QVVZcWN2SkNWWGZtMSthTFNVVm9UaW5zYnpRMmta?=
 =?utf-8?B?bEVIbmhzd1pqbzFwNVpiZ0lHam9lUlQrbHJZZlk5SkVwdEVIOFRFckU5ZWtu?=
 =?utf-8?B?TEJWSEg4L05DYTJkUTRPM2JmdTViU1JhV1N2Z3N4UTNSTEEzWDdOVjRscTRs?=
 =?utf-8?B?OGE5aVNJR2hJZWxxUWtxWmRjT1g1dUZ0dE9VN2RxRTVxQzFEemJzRElRejM0?=
 =?utf-8?B?c1AyMFFaT2pQR01uU3ZpQm1ueFpSNllqMjhQcTlFcDgrRm1DUFhOb2tSQXdo?=
 =?utf-8?B?RWZ5T1Jrd1BFY0RtY2tSRDVTb1JjdmxRVUQxS2JvaE8rN203MW04QStuSnVq?=
 =?utf-8?B?Wi9hS2pnUUxkZXN3SkdZTzdZWW1KWEF4SVc5RjdIWU1LTVpIRHBKWVJDZisy?=
 =?utf-8?B?VzUrR0ZxQXZWWExzOUMxVTdVTFpaWmpLNjNXUzJCbmFIM3dyS1ljYlYwdlMw?=
 =?utf-8?B?emZsT2VtaFV6cGZ1LzViZ3pTZVljRVRlNVZWMFgxaFo3Y1Q1b2hqd0RNM2xW?=
 =?utf-8?B?VHcycFNIY28wVHFNbU41S2llQ0J1aUQ2ODdpSWNJYmp2RmFSZnplVjFxaUtN?=
 =?utf-8?B?YVR0d24veURWaGlISFExUEp3ZFI3SlpSR0xVVjQrZWQvRDh2MlVFdlpNTWgz?=
 =?utf-8?B?enE3WGZwYnNNL2d1Y3dmaDNES2JLTDFmVTV6L2hxQjlXQ0pUZ3gzSW5kMUZU?=
 =?utf-8?B?cWNJbjZIeWxBcDlTKzRNTjNyUFArTEtQSEZjdGdTNVRWTzBvTTd3OEdpSUEx?=
 =?utf-8?B?dTVWWElpSjYwUDhJR09HK3JkOVFOZjdaMFlPTGRCUktSaFFvbzlJVHFRZmZI?=
 =?utf-8?B?cTdMdWhxRlRLZ2EvTnl6QS95bE5qbXRUVzdRa01CQks0QzYvUGpQSmRIekN5?=
 =?utf-8?B?a1JJcnUxaXRyUTN1dmduRnhTRGhzSFl3ZXBFZVZWTU5BS3I4cE9jN2QrNVEy?=
 =?utf-8?B?SGNGQnpCd3J5ZWxVVFN1WUx3cXluWmUrVU9TMkhweUhQQyswdS9kd2V0YUEw?=
 =?utf-8?B?NURQZzFqc2NVM20zUlEwcGYxSnh1Z1gzb1daR2FnczhxUXZQQ2pnQ0dVM0ZU?=
 =?utf-8?B?OVMwbldSU0xnOWY5dWdwazVBTTZUUVpHNEFqVXlSRXlOMDVwaXF5WUp5QzVu?=
 =?utf-8?B?by8ySGlLVmJMZmZETUwvY2tTa0hLYVk2bmVxR2QwVUE2NWNic0FXMS9oWFU4?=
 =?utf-8?B?aFo4NUN2R1ZIYVEzQzMyOEJoL05RdkRTZGdKdmZUUldjR1ZwVitQd00zTkNp?=
 =?utf-8?B?V2pPbmk0WnBMUDVhYUo5SHBCdXBndXRwZVFtaHg2Y2dOajhKUWVTYlFDamRq?=
 =?utf-8?B?MVBzZit1dldQZ2pnNTY3dXk1NXJSTTUvODcvb09jKzlyRkIzZHlrdTNCeGlD?=
 =?utf-8?B?bUpic2kxeHNCL2VaRWFNeU84SDJ1bmd3K0FzZ0NzWTRGZFc2SFhFVVJIODJ2?=
 =?utf-8?B?T2ZqR2hJeTlsN283VlBXaHhkTW5OWUJ4MnFGamtMZXA2Z2cvNDFwM29DbDRC?=
 =?utf-8?B?TVZVQkJTNk0wSFpuVFZwZHA3L2dzNjZMUWhQOGRoWkdzcUlicXpZS1VJcENS?=
 =?utf-8?B?WjNUMnJITThQdDdYQ043cUhjNDE2elhITm8zK0Q4d1BEU1RFMjhnVUFSZVhH?=
 =?utf-8?B?UEZiRk5yYjNqVE80UmRadzZBRGdzVURvaEZpSzlKM3B5aHFWbnpKRExlbm1K?=
 =?utf-8?B?cExmT2dNcE1Pc0hUcXY3M3R4K3g1YmFnTm9XM1pnZGpSUVgvalBvVmc4UE90?=
 =?utf-8?B?bVljOEgzYXJ2VlpkWmhBQmFUVDZQVGhoVWxCc0t5bDR0VVlDcThZaGVqeWhi?=
 =?utf-8?B?bzNhUmlXWDF3d1dCd01leUxWSU1tamNJVGV0Yjlvc2xlVzRvZHZkQTNVbkl6?=
 =?utf-8?B?dmZwejdzeWU1VDBxd0FYRzV2MTZ6YW5PenkzSGg2NzRnN1ZHOXI1bWNIb1pG?=
 =?utf-8?B?b3c2WHpxSjI4cWx1elVBSmxVRTVnanVWL1N1aGVxb2hMVloyV3FKQlREbHkr?=
 =?utf-8?B?L2Jic0x4d0Z5dlJxY29VNVV6OUpmaGhXb3hXRXoraDhZNDFpcmtRN2FCeDJ3?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8f8a89-c007-400f-61e2-08dc387d949b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 16:51:59.8192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErKwKqPWnf+2WWgkdeOPfHnVnB4/3GjOae7B8hZkX3I9YnyUdQEAIg81LvYswD+yZ+IebopmYxLjHZwoaCqIj1Zh2Lxl7JMebKYUNLJEvX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
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

--------------FFCNjEbFP0sDbe3NreTW4QqA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Understood.

On 2/28/2024 22:14, Gustavo Sousa wrote:
> Drive-by comment: display stuff should be sent to
> intel-gfx@lists.freedesktop.org.
>
> Quoting Shekhar Chauhan (2024-02-28 13:11:44-03:00)
>> Currently, the driver is only waiting for 1ms for
>> idle patterns. But starting from LNL and beyond,
>> the MST wants the driver to wait for 1640us before
>> timing out (which we round up to 2ms).
>>
>> BSpec: 68849
>> Signed-off-by: Shekhar Chauhan<shekhar.chauhan@intel.com>
>> ---
>> drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index bea441590204..05ba3642d486 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -3680,7 +3680,7 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,
>>
>>          if (intel_de_wait_for_set(dev_priv,
>>                                    dp_tp_status_reg(encoder, crtc_state),
>> -                                  DP_TP_STATUS_IDLE_DONE, 1))
>> +                                  DP_TP_STATUS_IDLE_DONE, 2))
>>                  drm_err(&dev_priv->drm,
>>                          "Timed out waiting for DP idle patterns\n");
>> }
>> -- 
>> 2.34.1
>>
-- 
-shekhar

--------------FFCNjEbFP0sDbe3NreTW4QqA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="Courier New, Courier, monospace">Understood.</font><br>
    </p>
    <div class="moz-cite-prefix">On 2/28/2024 22:14, Gustavo Sousa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:170913866639.9528.1555853125695537276@gjsousa-mobl2">
      <pre class="moz-quote-pre" wrap="">Drive-by comment: display stuff should be sent to
<a class="moz-txt-link-abbreviated" href="mailto:intel-gfx@lists.freedesktop.org">intel-gfx@lists.freedesktop.org</a>.

Quoting Shekhar Chauhan (2024-02-28 13:11:44-03:00)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Currently, the driver is only waiting for 1ms for
idle patterns. But starting from LNL and beyond,
the MST wants the driver to wait for 1640us before
timing out (which we round up to 2ms).

BSpec: 68849
Signed-off-by: Shekhar Chauhan <a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
---
drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index bea441590204..05ba3642d486 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3680,7 +3680,7 @@ static void intel_ddi_set_idle_link_train(struct intel_dp *intel_dp,

        if (intel_de_wait_for_set(dev_priv,
                                  dp_tp_status_reg(encoder, crtc_state),
-                                  DP_TP_STATUS_IDLE_DONE, 1))
+                                  DP_TP_STATUS_IDLE_DONE, 2))
                drm_err(&amp;dev_priv-&gt;drm,
                        &quot;Timed out waiting for DP idle patterns\n&quot;);
}
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------FFCNjEbFP0sDbe3NreTW4QqA--
