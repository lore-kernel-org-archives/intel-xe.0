Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8A3CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 13:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F75910E7EF;
	Thu,  4 Apr 2024 13:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPmIMipT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC310E7EF
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712238568; x=1743774568;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kSTiYfkeTrcB7MO2T0YXRn6kwJdWF6GlazFv6lclwjc=;
 b=jPmIMipTPyoEw46BdCcrg3Q5kv8/OcUZi0azdF6f+jHPKcBF8FIYMagp
 oGDp2hnw3sLXzjWBnWcLY0kUvFhQgdcX0XbiEFyjwtqF4L8CQS49a7Lcd
 FpIb7z6f/q3TiIbak5y4wSWi9Y6gNRaVmJvmCYWC5/WH/Fjrwr2ByciWA
 Z/HKxLzLULoargbTvDG7diWIh1XKCJEISihZOKcJ1UxhEpy1nrfmmRjJc
 btIWFkbJK6jg7JFCE/A4JQ+VPcG2LadbPoFXb562DVWFRo1cX9B3vB3Nq
 c1SlPYWrfewQo/u1CJW0/CJGH1E7H8Vs6a7IwAxV66ZUcTLLMoCKE40BL A==;
X-CSE-ConnectionGUID: ElBPwAjERbWOmhr4ZbYcJQ==
X-CSE-MsgGUID: 5d5pqWMURhmwtHbXtSnmLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="29972253"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="29972253"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:32:16 -0700
X-CSE-ConnectionGUID: /WVKOyHhS0W+XwRgIe082A==
X-CSE-MsgGUID: ctqoh667RTip+v2/aaX4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23430421"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 03:32:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 03:32:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 03:32:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 03:32:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 03:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfyO6hEgwdVfh3CKbg4FPB/4ABpxmW/XgHyUO4qjvw9SDYpJU5jGdxEu3zMFe35rma3Ga1eNPLVb+6Y1E9/mixCUi12ZA6R3XMuOxtfxD39mHGxu6axOG5bZUnDkRKEUo0+Xd/E5MRNysFFtwM8tWeHgX32xvCbTHKNh4TkfcoSJQL+ptAVIdgA3qnsexvEqjVELodythjHDFHpY8Ki5D3nvF+SXytYocd8yLJ3qWIVli1x8EzQ/N1WXqKaUIBwB9wq25NdyZtZX5DXQrx5Rbu8XR+5KLhPiLBeTMcRRGuqp3XmVfDETAfCtn4S4rwm1uIH+u/3zlGz10090A24cVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjOqviDF9D/gwtpuNG/+vEl1NqGWsmNEQRyyDreK2T4=;
 b=T72XbYZCT02hqmp1Vqd0AKfvhu+uIz/BdZK6C44f7wgrQUvGY4Lb8cBB6vLpG7HIcKH1pY/sUGfo1EoZPDNBbSOWItop0+yIEfhgKUpLh08f1YzNzSBhTOvwGvA7hg0LKYXWvUvnzrjIzEYfCJF9Jq9pHL96eiRkE5KnVsHJd2X+zAZWP7ZPcb5DaFe8YuVFyRVPLJ+SDlEuGuzOLi6AVT6pkDAWI4IjB8NeqfGFg7FIy5XH0XHKwtwLLhoDLAAfK9haM9qomGcu6Qfl+nDDWpE4Dx8xontpmlCnah/gSbSViYLqYet9m8byM2MImC1yM+T7R5CHuhFIsUHxdHENyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Thu, 4 Apr 2024 10:32:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.031; Thu, 4 Apr 2024
 10:32:04 +0000
Message-ID: <66364872-fd7e-4a40-8abc-f84f0a4bb6a7@intel.com>
Date: Thu, 4 Apr 2024 16:01:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/xe: Define XE_REG_IS_VALID
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
 <20240404035441.965590-2-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240404035441.965590-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5273:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElNoUP08IBM1H2NBsHPCkSP4Fr5rBOP9Tt2+7WgLr1Zm3YYxu0cZQBqKZ506siHBXZ2mSjO6zKW0Q0gm041so87YUeCveGzLC+FR6XojRnQm3GtsyFhrDLS5w3TdQzE7FuX9WAeK0FY6AKCq8JLfrDG7HfOODbdEfa+Npa7Tvoye3/Ju0+Jyv5WVBiai/wsxQS8qjoY8o4Ta9NAr2hpPIZWCkvtviVQrHxAgQMG0EBJSSHx/qEFxARwdRKQ6d8nrhtzWuIIV7emMyvJ/sicfKMiz4ETo57Wifh5Dk7Id9sjsvu0tC2ZIEctPAEAMHx4QbRQx1PrBlSAYVSDW0+Da3WnsWFNemCWLROMLcOzTTArlr8hQ9fyGKKRzpnP6FtovdUStMmr2YIDXElDC27R/jNWOGu2rki/hZiBPuuENwujhDrD9WcAH4PKDcnnRUvkFakXf1Asc0/nKhmDgHzZNvU+jqC64H+u0ddzHmlqjE7/rWszkedoXLD7YzEJ2GQ2KAzTslJ+GKpDuzm7RC/n1WFBJfYbJ/sHZOdKPVeFKWgMD73foyGL78ocz8DpTBNG09EmSVBPJV8CHX7889OgzWI+k9G1PqI3M6gaob010CQMfBENTWSAiGzcA1R3TkdiT+9M0Qpu6di6+XqgvSKcRdDBnbwyOlMcbrCSYvs5HJW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJQeWhDVnVGUU5qNTRPdmQ2eEIrbmw3OGExZlFid3Zkd0hvbGZYRDBzV2pR?=
 =?utf-8?B?MG1VUUZ0Rk83Wm9Ucm1GdlB0U3E2dWk0R2FCamIzVWVoZ1FtSnQySXhkMjRx?=
 =?utf-8?B?UkNYbTVMeFFyRlhFL04xU28yN2VjeWJQQjhvSlo3QkUxUjJkS0JWcVZKSlFM?=
 =?utf-8?B?N2pwOWRVbjV4V2YwTlFtdGJPZkUvMTIwTHRzbXVSdFg1Mm1CRnRzb1Q4ZkVM?=
 =?utf-8?B?OUVWempFbjByUnB0Rkdwb2lHc1hCYmpjS2xLVlNjcC9LMFhFMGRFc3k3SXFI?=
 =?utf-8?B?SjBkOUIyVW9OMTFFREtSWWVwVkJTTUJJMlByTDNxMWJmVmVydjh0R3ltdDNw?=
 =?utf-8?B?QytDdi9aZm10Z295Mzc1dE9BbjZ2RWtJbGplNnVWM1lXUXdJOXZuUzQybkRo?=
 =?utf-8?B?bG9iN1pWUSsxa09IWTNCYTgrelRtMGdhMm94a3Q5Q3cyUjhRNit2QTNmbUpt?=
 =?utf-8?B?VVgzRlhLNDc1bGU5RXpaUGM1WG8vR1p4N3pXOURIeEZNeUFSZm11T0l6NXZY?=
 =?utf-8?B?L0w4SDZyTStEdVc5Z3RmT01yZ2ErUFFhMmNPVyt3K3d4cFZId1BCeE1raHI3?=
 =?utf-8?B?Ris3ZDFBY3NhbHNrZm9jb1RzM09rdjc5ZGszM0tpRUkxKy94a2FZWE1oaDJo?=
 =?utf-8?B?TzI3RGUzSGlMOEZhcFJ0NHkxWDVKb2xWemJxcFRTK1JoamNVUVZMbnpJRnRD?=
 =?utf-8?B?d1U3NTAyVEdKQ1BLOENGNjNmbHVpV1hNdlNZdHBER1NueHQ4YVEwN0I5Szdy?=
 =?utf-8?B?bTNlbjBYa1BoaWtidno2SytIUVZOUE9mUHlCUFR2NTljNkZQa1VKRGZ4dmtV?=
 =?utf-8?B?Z0hsZG9xMmMwL0JvU1VydW43UzJBMURZQktadW52ZndJanNpR01NaWVyU2lV?=
 =?utf-8?B?ZC9WZGcyRGVGTmxtVGZNZ0RzNnFlM3VobW1iWUdwVFZEYkRHb2JKcE1NUGI2?=
 =?utf-8?B?b3VCZERDbUlDUG5WNjhtUTlIKzJ2OGo1Q0tpZ290U3Nma2piRjFzT0pBUzMz?=
 =?utf-8?B?ZDRsdjBvbXcxcWorb2hMeXNLeitXS1VDaCtKcHN2Zy9NVkQ5TWFFTE5zWlpM?=
 =?utf-8?B?WnV2ZzBFQVVkalpqbE5EZ25zWHczMzZsS2JFMHh2eWNmM0F0NVkwclhqU2dz?=
 =?utf-8?B?dXpIVW9XZnhZQitlVnFZYWxXQVhHaS9HekdxNVd3VDhWaUsreGRZaUQ1T3By?=
 =?utf-8?B?aVhuWjJmQ05iZ1dxWXVaR2REcmovZndBRnErbTUyRS9nV3NWb0xsZ2JHeXFH?=
 =?utf-8?B?dkh6emFZRkw3MVVFT2Y3Z21OYXdNaVVZb09mZnNMK2RUQVRTVEs5VndIYmI4?=
 =?utf-8?B?dlB4YitvWjNGSE1QN0VYZkIrd2hObnhMZGY4YWxYYXV3UXZsaVRmOTlGRUxp?=
 =?utf-8?B?dFFVdGhxVmJHSG5CaUdtTjA3eHJKV2t5b0hyOU1VYjMwN2VSZHA4NHoyUEtR?=
 =?utf-8?B?ZVRuZ2xCOHpUdlZaQS83Q0VjMTNzZFF1cWsrSkErK2h2UHpYN0gyYms3WmpT?=
 =?utf-8?B?ZzVmY3pVS3hMUUhPN3NyTG8zYlhMM3NzbjdhTjdZbFBQbDlrN0tUdWNLMkZV?=
 =?utf-8?B?aHRzQy9LSmlSeXpxWjZUUnRaYXlhWUZoWEFWQzNZMnZoZml3bjlZZzJnM0Jw?=
 =?utf-8?B?T2pQYVlRd0ZkUWJFdkRFbUpMWTYwK2c2NTlVc3UrbmhoTUpnQ3dMa0dKNGtD?=
 =?utf-8?B?L3dGUDY4L1JJWU04SDlrU3ZiVGZyU0pRMkxCWjlhKysvYnVBNVdGeGhxbGZJ?=
 =?utf-8?B?aExoZjA5WTJ6ZWlLL2FnME11aEtJWDI3QzZWeExDNk0xb0VkYko3Q3VuVlFw?=
 =?utf-8?B?SzNsa3QybXUyeHpHV2xEQXZjOGdLcS9hdnliVTRPNGkwVWg5dENUUnNSVkFM?=
 =?utf-8?B?QUd2NlBiTCsvUC8rcStoZDFxWVpFSGtjNlVuVmpXQllheDQwMnI3ZjM2Wisx?=
 =?utf-8?B?Sm00eDVDcE1xTG80Rm5yaktOakt6ZnNycjdLVk1JL3ZHWlRnaGtHREVIOGJv?=
 =?utf-8?B?MDBWdGpFOElWdUNwdXB5Tms3WW84aS9FaVdGdm1MbDlVVytUNHBQOHBBTVB3?=
 =?utf-8?B?LzhJY05CRjRmLzZhRTVwZ1dDVUJTb0xCYVo5US9MQVNZekFzZ0pYOGY5ZXRw?=
 =?utf-8?Q?H3khMs4wY7mVu13oWeLr5aTvB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126591c9-0ccc-472f-67d8-08dc54927809
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 10:32:03.9462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGnuIXrTVvfjIFFx6am5euMQTyShwFnDy05YDiOoO7SL/liYU0FuzQw+x2alUTiHrttt1Nnu17rzxSoHqszRIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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

Hi Karthik

Add a general commit message and add the suggestions with names under 
version history. For all patches.

On 4/4/2024 9:24 AM, Karthik Poosa wrote:
> Add macro to check if struct xe_reg has valid address. (Lucas, Badal).
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index c89ef2b79a3f..42078643be6b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -131,4 +131,6 @@ struct xe_reg_mcr {
>   				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
>   				 })
>   
> +#define XE_REG_IS_VALID(r)	((r.addr) ? true : false)
Why use addr instead of raw?

Thanks,
Riana
> +
>   #endif
