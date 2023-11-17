Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444BCC197A0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 00:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01826891C0;
	Fri, 17 Nov 2023 00:10:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA26891C0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700179798; x=1731715798;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVkPcFLBK8tQpOgz+ReU/NO1GNJqHOHel4E872A682o=;
 b=TFgFiMlF5blBxk+9gBAp/aqn8P7frDNEzx7P+bgsZ9glRp7LaSyqxl5q
 JJfl2S31pNAIhzG/7selp6GE8rTYNJjrVsi8gdtZZWjpEfjGqaexhzhXj
 wTo9dcxnEMKxGTDyelR6EOCn2zxiFWm8CBN5s+J1uLzerXbGyjVTZil0q
 AvR7YR1jbW6dHPBFhx2rKFp5A6Pa9LoSNaUoEfAoapzCQlnEau20y88BR
 PAsBCvJK7045kBrEBDHQpGAoR265JvbBCO3fymhH7Fm2oNcu7pvlQVBhH
 77X/VObWtInaw8erxeRj4E1yAG3TNyBkKhs66/uhTRUh2nIDRJtdqD2mA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477427231"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477427231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 16:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="794662687"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="794662687"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 16:09:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 16:09:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 16:09:56 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 16:09:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoaYxanIkbTQfcwuNiYwNaqtQm20M9Wz2uvJ9ko4m+eAAvgChfjYw+/dVzw1UfOEOTwJyZQuqfeJyg2oHwLR8ZFYqbsMdpXanhl/+Ih6D4ZGG82oGRQsnYGZ9xYhgpGTbyiPIVHh6PqpKDkbVRaIRAc8W3w+u+uIeMwHpJ2odu8UYjFFLkgTLmmxkrNo8Fn/IZV/QHQfFXG732Kvj29Ue0ezs83uV5gjyHC1zUU+uJkBNbS1gwh9rlXkCbB3vSm3R9gm9VqN/5WP4tIMf0SX4WbILOOBrnAakycxXxdSc9V2TOJli0+eVYIGKuWvOQC6LdALiz0HidDsn7er+Vl5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIZGvVkB2tmhgKmDnv3wVObnjxbnxWUklWgCcXjCi8o=;
 b=DcPPaVR10KVJwfk6qd4fiFgwpdjna1AGmqlxfgxP5yxrBXeWd+MqxoCpn29qn2M28Ndcy/M+wUEgQhVLw99oetZq/NN6hJF3W4sP8rH55gRR+eSjHjzDdoAomfD5vYULwajQt0ISCgnJsob7b3pqr53t/NMDn16XV3JnHuhJxUL4LxoHtoPB9cQAtSM2pJaIUGvb9ZRESFPNlCuRvjKmGbWxDweKmFLd8ISzzM8EN6xUGqmAWqQ0BH2DHc7FP9HPmXj1n1IGJRTUiqi7s1QiGWJM8yAHBMI93RGWQTqn+/7H8hCjApkO8f+4Wir64Phbb7bhVt3WkgC0TiUoVzOrXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 00:09:49 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Fri, 17 Nov 2023
 00:09:49 +0000
Message-ID: <998d9126-8ebf-4412-9b0c-641611cfd607@intel.com>
Date: Thu, 16 Nov 2023 16:09:46 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-12-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-12-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0296.namprd04.prod.outlook.com
 (2603:10b6:303:89::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: efb563cd-8eab-442e-1b96-08dbe7018368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KTI8rCfwe0zRi5VhYhwelL+8bungI0N/vO3kjhCc8MAlNfkgXAVEYEqNpEC/u0IJ1u/wmr8V2XXK0PJUCikEsGJe5+Q0LZEqYn7KThPZLgzOPegsAbaiEtYQbp6B/E62lZWFAY9/rqAE4vcF3iV0ivqMSklWM2oX/yIc8mH70+VkPwaGr0eEaso0qKsOiy7VGVP26C6eSxxu/XlvlNeWbqnOBeo+Wnj6n4DnK21UsGrwtGtGiMEjWupWYvXFwcjRJdVasZmezHMdUgaEXUwOPE1F2squVhlQ94F47zXVz6ENpmUutWJg477eqa81EuEPAG/YnwXNHomYuNC8NDdFd07+rs56QkADarg1n4iYMQMPr3Pi5Z/QI1XMhhFfT/+GQFSFsH7YskbJD5yoUZ7G+zy8uqfHudv7eF0jyykuiTw1f1YjqNfeDVqbhw67L8/UnNDOgbcw1YBuxzN25JN0h0JMTsUwjpJsglFHg/8nnK7Plqm7OQGj+Zybo2j7oFvUvvHKPBycwHj6p0dBHXGpcTNxCeJhx8ge2MkVUVEbSv27SkxFlVPyg/dL9s+3yzE/orqnLl3YDeCbM4aRj/wkYoQSRdiapRjwJwcP8zju8Srp21BTQzq/6awfzm+qaM0MtuOunPJ0EKwhn3tNpl99NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(6512007)(82960400001)(107886003)(478600001)(2906002)(26005)(6486002)(31696002)(41300700001)(4326008)(36756003)(86362001)(5660300002)(8936002)(66946007)(316002)(66476007)(8676002)(66556008)(53546011)(6506007)(6666004)(31686004)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdsbTBkbXFrQ1JXS09LS2lBdkQxcWxwb1lZTTZiUGtzc2JoQW1ZZlZFNHNG?=
 =?utf-8?B?S2w1Q1d3OVVSeVBzMUhDSUJGYVJWNGhxemgwUFd1UEtzM2UvTGZxVmZHcytC?=
 =?utf-8?B?dlo5MXRWMVc1NUZwZUpiVDAybzNJRDZBcm93ZXBudHQ5TnRLaFQ5RTg2UFZh?=
 =?utf-8?B?amhYTnlnT3BjVDY1WGhtS3pXZDZlUzd1Y2VtdGM4ZFpMWVl4U0hZRVZEcVJO?=
 =?utf-8?B?TE9QVlNqVFBHRDNFUjN5Mkg3eXdlc1Y1L3pPczZBL3oyem1ReTdjWXM4d1g1?=
 =?utf-8?B?SldiamxoQlh6dGd3WGxkalZxaE1OSVpHVllabVZFVFluc1JvMEM0ZHRxUlUz?=
 =?utf-8?B?RHJnL2ZFOUx4bksyZTJDTnB1ajFNYmg5ZFhYNnE3SXM1MEw0ZU5qR2RXdlFG?=
 =?utf-8?B?cUNLTE81QXVENndsVkdZR0ZlajlLVHJGOFc5aDQ0Ym55ZldrY04vZXBFbG1H?=
 =?utf-8?B?R2RLZkFMTU1tNHEya3dEYWlhQ1E4MERraytNc21udk0rWDR2Q1A0NGhjcTcy?=
 =?utf-8?B?cGxkRXVrdGlKMEk1VnYyMmtVZ3RSOEFsaThONjB4dGxIOTFTeW1Xc0NyNzRC?=
 =?utf-8?B?cmZ4c083UHNIeEtIeFZIZmxFOHF6cFVkM3pMeTdNcU41b1dVbzFzWkpHREx2?=
 =?utf-8?B?SjhqOVFxeWRuTnpnWFg2K1ZvaGtvNG1oWkdhMEdLaUd1bHdFVU5KeXlTWHdh?=
 =?utf-8?B?OXRJdWczZTQrMy9XTmlUSUU4MlM0UzNkZ0dEaHBEQTJrSzVKeE8rOVFrNFBa?=
 =?utf-8?B?ckE4b1QvZzZqNzcxMGg3ZzJydDNNUEZsbW9VRTZlcWVzaUVXclc4MnZLSWtn?=
 =?utf-8?B?UDlJRXptbzJaUk5IS1dEcjRFcFFHMitvZU9xNVpyMVNrU3hnMnhUb3orRzVz?=
 =?utf-8?B?U3g4ZkNmWHo1b1VrT3N6QWNaekFxcE1oM3I5bFBqMkJjNW9INzFYaVFMalAv?=
 =?utf-8?B?eCtMZ210TVZJUmt6N01rSUgzODB1Nmd6UGxIeVdYUkVnWDI4V1YvUFFEVTNT?=
 =?utf-8?B?SzMyd2ttV05GRTFTOHlGTVVGdnk2QW5KMDdoUmRNMHBrVnB1YnpiSzRZU0JP?=
 =?utf-8?B?Q2ljd2RzQWFDdUZQbGJtaURwNzhxUnlxTVhmMng3bnM4L3owR2ZXcGRjUHJm?=
 =?utf-8?B?TjJVS2JsbE9ZSnRLOHhhUmZRZTF6K1hhSkdvKzI3cmZacm5naG1UZTRrcnda?=
 =?utf-8?B?MkduUUNuTW43V1YwcFhNZmkxYVBhMnNGT2k2WUlXWnllcHM1bGRqbURoZVUx?=
 =?utf-8?B?TnJ1L1c0T2tsZEtudXhza1ZqK004cXA1L2tpZlF2SDZLMEYxM3Z1WGZnRXBt?=
 =?utf-8?B?WVVYYS8rUitWR2VTeGQzTFpvV3NEb08rbTYyVGZyZ2JtSzA4UXpzUjFVY0pa?=
 =?utf-8?B?UTE4T0d6RXYwcGxjV3ZUUGQ5aWdpSWZzdU41OXlMZllyTVk4WHcrckpMcyti?=
 =?utf-8?B?WkVVTTNreCtiZHNlK2U2N1JUSjJ3RENjcHc2TUM5c2N3SEt0bjU3OEJCdGxV?=
 =?utf-8?B?RkxmUzh6ZDN2cExMNzE4VXlacXpkQkpGYllzOEtGclJMaDVhOVl2RW5qcVlo?=
 =?utf-8?B?Z1BEdzFQR3hGZXUzWHdxY2tXcm9ucTNzN3BKdHhFNkNhZEtFQ2VpeXFsN3ZN?=
 =?utf-8?B?Q0RkL3ZvbElLdDV5NVRoME5yNENkNnJWTUlqVzdPS0RiTmpEcjQ5M0k1VUl2?=
 =?utf-8?B?MzduK3dZMlV3UDRPV1AwQy9sZHdVQ0xQaUorY2pMbGgwaEN3b1FWU1dFM21m?=
 =?utf-8?B?NGN3ZFA4TzVVbUt5WnAweXB0QVljKzc3cXpaZjJYUklTZVJGL1M1bFo4QzFV?=
 =?utf-8?B?NnBFdGVqSnFENUtoS0F0WEZYU1VEbVovU3hmVEZNT2VpT1E4ZXJwMnFqMERq?=
 =?utf-8?B?Qmp0cVVCWGs2cGRrU040TWdzVVFyVEFjOU5pYWZ1QjdyV29keG1BSUV0RjBp?=
 =?utf-8?B?bGFndHpFeEpPV3JZd0hibFA0L1N1ZEpBQ3R4KzRCV0UraHlxTDhaZmN5RVJq?=
 =?utf-8?B?S2o5dVNzT1I3K2JMM3Q3dklOcWtNeFowcVc3Q0hwY2I0MEpVK05oTEJ6T1M1?=
 =?utf-8?B?NnB0dG5WTmUwZm5PZmg4bjlQbmVyUW9qK2NFQUp4bjJYRzMxaWxCdDVTSTZw?=
 =?utf-8?B?bUloMk5zOEhMMGZkd1N2N1RUeE9GMXlEWGRxNVQ1SjFLYjloSG1XOXZ0ZWVB?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efb563cd-8eab-442e-1b96-08dbe7018368
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 00:09:48.9673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJ2cjjF8FQdodhdUQ1HjLc7AxISaMPHmox5rFE0nyGW+D1iogbjyUsJufyCLpSKn3QVM/L6MyRFNUc3b3VoQSEDOZeAI0HsvDrewXa9mw/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe/gsc: Define GSC FW for MTL
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> We track GSC FW based on its compatibility version, which is what
> determines the interface it supports.
> Also add a modparam override like the ones for GuC and HuC.
>
> v2: fix module param description (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_module.c |  5 +++++
>   drivers/gpu/drm/xe/xe_module.h |  1 +
>   drivers/gpu/drm/xe/xe_uc_fw.c  | 20 ++++++++++++--------
>   3 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7194595e7f31..93b6bb23d4a6 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -41,6 +41,11 @@ module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>   MODULE_PARM_DESC(huc_firmware_path,
>   		 "HuC firmware path to use instead of the default one - empty string disables");
>   
> +char *xe_gsc_firmware_path;
> +module_param_named_unsafe(gsc_firmware_path, xe_gsc_firmware_path, charp, 0400);
> +MODULE_PARM_DESC(gsc_firmware_path,
> +		 "GSC firmware path to use instead of the default one - empty string disables");
> +
>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>   module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>   MODULE_PARM_DESC(force_probe,
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index e1da1e9ca5cb..7f49f95630d5 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,4 +12,5 @@ extern u32 xe_force_vram_bar_size;
>   extern int xe_guc_log_level;
>   extern char *xe_guc_firmware_path;
>   extern char *xe_huc_firmware_path;
> +extern char *xe_gsc_firmware_path;
>   extern char *xe_param_force_probe;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 062fc1eb591c..36bf902ac459 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -121,6 +121,10 @@ struct fw_blobs_by_type {
>   	fw_def(ROCKETLAKE,	no_ver(i915,	huc,		tgl))		\
>   	fw_def(TIGERLAKE,	no_ver(i915,	huc,		tgl))
>   
> +/* for the GSC FW we match the compatibility version and not the release one */
> +#define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
> +	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0))
> +
>   #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
>   	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
>   
> @@ -155,6 +159,7 @@ XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   		     fw_filename_mmp_ver, fw_filename_major_ver)
>   XE_HUC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE,
>   		     fw_filename_mmp_ver, fw_filename_no_ver)
> +XE_GSC_FIRMWARE_DEFS(XE_UC_MODULE_FIRMWARE, fw_filename_major_ver)
>   
>   static struct xe_gt *
>   __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
> @@ -196,23 +201,19 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   				     uc_fw_entry_mmp_ver,
>   				     uc_fw_entry_no_ver)
>   	};
> +	static const struct uc_fw_entry entries_gsc[] = {
> +		XE_GSC_FIRMWARE_DEFS(XE_UC_FW_ENTRY, uc_fw_entry_major_ver)
> +	};
>   	static const struct fw_blobs_by_type blobs_all[XE_UC_FW_NUM_TYPES] = {
>   		[XE_UC_FW_TYPE_GUC] = { entries_guc, ARRAY_SIZE(entries_guc) },
>   		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
> +		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
>   	};
>   	static const struct uc_fw_entry *entries;
>   	enum xe_platform p = xe->info.platform;
>   	u32 count;
>   	int i;
>   
> -	/*
> -	 * GSC FW support is still not fully in place, so we're not defining
> -	 * the FW blob yet because we don't want the driver to attempt to load
> -	 * it until we're ready for it.
> -	 */
> -	if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> -		return;
> -
>   	xe_assert(xe, uc_fw->type < ARRAY_SIZE(blobs_all));
>   	entries = blobs_all[uc_fw->type].entries;
>   	count = blobs_all[uc_fw->type].count;
> @@ -248,6 +249,9 @@ uc_fw_override(struct xe_uc_fw *uc_fw)
>   	case XE_UC_FW_TYPE_HUC:
>   		path_override = xe_huc_firmware_path;
>   		break;
> +	case XE_UC_FW_TYPE_GSC:
> +		path_override = xe_gsc_firmware_path;
> +		break;
>   	default:
>   		break;
>   	}

