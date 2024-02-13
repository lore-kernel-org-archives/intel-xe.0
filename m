Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD2BC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 05:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC2E10E7FD;
	Tue, 13 Feb 2024 05:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERkG2ENE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A0110E7FD
 for <Intel-Xe@lists.freedesktop.org>; Tue, 13 Feb 2024 05:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707801440; x=1739337440;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RxMia/MeqDkiiYkwzjfaQNM4S9ufbDZrneYu6o1NJlM=;
 b=ERkG2ENEVPgygQXon5j0P3IicJsTK8/L+uGUsL7vnabps432s9gwYnOC
 U6nXnD7D8Ro0AfYBclmAUucp5F9R/ypvqtYSNEB9yzYgHyHpuC3goYlR/
 W4uzU/a4m8qfQIOwO770Ux9ikHx528S7swOkNcwZn6IWdvNR4IngP2xUz
 7jes9gA5UZF33HerFIAJjs/TV5JbHFYNu7WMtj4GWbx8FoXQP7oBMOf4s
 L/gJdOcOC7SK1XxmdaV/141dkskFhCGko8iVbO7eZUb6jYmy7JYRs+M9S
 ooQky7b1vruy5P6QqNjc9faD0MBFTFNbt08f0sr9E4ykqjb4lMHFG7vsi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436943352"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436943352"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 21:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7368625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2024 21:17:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 21:17:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 21:17:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 21:17:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 21:17:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4G6XJtU+VtGL9dECKcs3RUAyPBjM/TsUJNXsiVVYfEPTWeBd9kphtMwsa3bZm6qklRB8o+BQEfkt+nYYO1rGRKoMa911EL6xUfgEvD9YIvn12RGnygUbC67MRTNvTn6ujpMGy6z21Kb49glpRv41nMOzo/ZuDC68mtTgOyGdQYZuSi41Xn8bCnMtYZYRQ64ZO9L6llBJF/pc6WdD/80W+wtwbnWK2fDAzCk+TEL+kSL2stZmQ32t/onXy2OWy1goHgMv666pKVElHixs19rqbrFCE1PZnND+tASPb/ofaQp4HmxpZnHK96EW/ccHI9jIFkdaUv9ZzpHNFVLd8Gdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwVaUe8PTYBOPkF3wusm/yH1mMWRvs+rj4HXFDKUfeY=;
 b=ISUNcivDVJJ+eNSRlgbb00lc4qjfjA/efVoSWUFtLE9CIR1HFIzXcl1es6gaiMBkSBPKMSp/hgSiEGsC7v7xgI6xapbzAzaUNALv/p6+vvOO5ExIoktGdYJsE8eb4Pgkv+qSDAK5ezvl0TNsrdywUe5RwzcjQyJvO2zO7xGRXFka080iFUf2PC99YJAIUdqX9/xRUb6WKXEHB83veb5cUQDb/geVx6AmIlzG2LcsAnZ3rcne24wWBx+ZJarDp6YVvsr9i6bFPa9WYOEV5lybPuTS2/3D89f0FP/d1KD9qna6044NwbpbhBOyJW3F8yHHntlJirXZh7x0sWN8ZcPxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.41; Tue, 13 Feb
 2024 05:17:11 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 05:17:11 +0000
Message-ID: <d8ec5d48-b356-42c6-9140-41c6868a1546@intel.com>
Date: Tue, 13 Feb 2024 10:47:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-3-John.C.Harrison@Intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240213003426.3943662-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1000b4-73d2-49e3-fb48-08dc2c53083d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2GachnEW1CnkP+XlRLquHfDi+ZoQ8ezdin2fI77viIWmL2Ngx2HbhFM9hiIHTFobGUX0gZAB6JaTwj1f/yPk666MzU3OZyWw1tzfcQl1rKBTeaExtAfZEq96drAVVBDzy116pYsiED4eOMAjAc9DfB3+NKFKS4Vi96BqUlbR0vcxZUXfS7rZViyILY5FS7FJ5CeRJ3JwalWl8ynCsMmT/LZLEUJ8PxJljbFfidcfKP3ab6mWWlg2pLsf/K+V8CbNNDWbHZ2dCMoaofdmazqO82k0uX/rlqtx8fLoSuo+xF+wo4+5ZzKqA3OeEsPBYh4CUY116XKP+gNEy4zR9ImAx52D2bDzeC/LBiDPXmB/4nEJ8JPQ6cgnx5yZlI969fK04mnNvWPeyCdTO+O0IhyYrJWNX9WAX1pUUbeyLadG3FjKdhma59cgWX8q68oTyuXUiM29Nd75TOQMj+eZ9VhOXN0sx2MDSwQcVcGoobSPPBWbCWArpJznQWvRxWxmLR6Fi3RzLI2tuHRK1DRyDosHy6rCa+BXQT4QPlkSQ8Z7GXP+pKNm+75lqflrXpsreAK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(2906002)(30864003)(31686004)(53546011)(6512007)(26005)(6506007)(478600001)(2616005)(36756003)(6666004)(82960400001)(38100700002)(83380400001)(86362001)(31696002)(66556008)(66476007)(316002)(8676002)(8936002)(6486002)(66946007)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmdxWTUrYzBZYTdCVWtQR0JBNzBrSzBjQTFudU9aR2F6N2JpSWhPUVVvWXV1?=
 =?utf-8?B?RjhUTXpvc0h5a2wrSDl3b0U5TytodWNXbEZCdFBtRVlPTFI4VTNpcmJVbkRk?=
 =?utf-8?B?Rnc0TlJtbWcrb3NPSElnMGpvcFpnVWM3Q0IwVkxnZ1hSb2h5aWN0MERkR21P?=
 =?utf-8?B?YlFxekxxN2FEekpjN08xYS9lbkFrdnl2cjgwcVhMREw3aTFxQUEvQ092NnRJ?=
 =?utf-8?B?MXpqQms3MGNUaHVWZjBhR1U5WktrSVk4cXBKaUV1d1R3aUVqcEtuenJQS1Bw?=
 =?utf-8?B?NU00enEvYTI4K3hqaXdjTWw0dklnaE1yUzJ4K1p0UVlvS1VINEhBRE9TM3pI?=
 =?utf-8?B?OWJhT1kyVmJFeG5qVTBpWmc4a0dEZ0pIN09hNjE5cG5rR2Z4YWtndmxYSWZx?=
 =?utf-8?B?NU9KcnRqcFV6WThsY2tQQTY5aE1WbkhPbDlpYVFZcW51TmNQd2V4MGJUeHhV?=
 =?utf-8?B?UE1WeENEc092QjRNSGVGZUNpYlNhanRIc3pkUlpYV2RFTUNac3ZJbWVVbDk4?=
 =?utf-8?B?bTFLTE9wbGQ5TXhRL2N6VmYycnJwRU95K3dsVGQ2Y1R3Smhubk5ENWJFdlpu?=
 =?utf-8?B?cE5ZdWJHTTdicWNrcmRkU1RNZHhJSUpZNmZ3b096Q3paOVBxTklyOFlpN1VV?=
 =?utf-8?B?OTAyTCtlNEFPcG1KM3dSZ2IxTUFmeDJRelNsUFdUblpJbmZzeXpIOTVHSFhU?=
 =?utf-8?B?K01jdnozYzhsQ3J3L2RoK0oyb3BzQ3lZUXlBNFEwWUtNYjY1eGJJK2luMEFY?=
 =?utf-8?B?QnBna25TOFkvRnV6QTNVTlFRdW5GemYwRkFEN0J5WmU0QlRCS3dzMDZDdFY2?=
 =?utf-8?B?YkhJdGt3cXZYemxXSStlZmlnYkNJVHJWdzhuakF2c1NIelpHWmVQWHRubTVl?=
 =?utf-8?B?RU16M29MekJZUDM4aTdiTGt2bUVDSFBMOUgxZTZFOHdDdjVmaEhpYkRhNS9J?=
 =?utf-8?B?UVN2MUl6MVNmY2ZDTlRBZm4xd21YbDVVdXkvQWM4TEJCNjRLQzlWM1RJVFRo?=
 =?utf-8?B?U1JKdmV4UmFLYVowT1Ztb0ZnRlM3aWtPbkR4Zm4wTGxGY1RtSkVQNHBvMmJ1?=
 =?utf-8?B?UlFzdGp4dktzVnhtL3FBUEl4YTRPY25rdnB2dmNFazBlN1ZtU1UwQVcrRWpW?=
 =?utf-8?B?YzJ2U3h6cG5seXpaZzdkdTlkd1N0bTNFbWdWN01KVUUwQWlNNUUxL0tac0Ft?=
 =?utf-8?B?VjJrUXJVR2kyTVVNNnUvYnlxOGpzd2p6YXRESWlzdkljN1NTR0h3SE9MaS9w?=
 =?utf-8?B?Q3N6bVJubmE1MnlxWDBicWNJZHpNVzE0ZUpHajkzTnhhM0EybXl4NzRlUSt3?=
 =?utf-8?B?K3N3VXZmSTBvejNwM2paOEI5TUZIWC8yUy91cHR5Qk4zaVZsT3pWR2FTMWwv?=
 =?utf-8?B?UjVHNW9RMDFPWmppaGVjNmc2dFlzZHFla0xRbTlrRlRsemFBQm5KcW1ZWUlV?=
 =?utf-8?B?dUZEM3hxK04xQmo5MkJzWjVNSmlmZ243LzM4WmEzMkE2bXBRekEvK0VBb3pi?=
 =?utf-8?B?K0tEUkN2VkJJS0JUa0pUQXBjZ3crKzdSREx1b0NQTXlMZmlGd3FFSm93RVRF?=
 =?utf-8?B?MS9aeWpCN244anQvVFJkUjByM2J5eWlvT1VhU215WUo2S1psVWZPKzByQW5l?=
 =?utf-8?B?a0NhMWliUnNYTDZIaUtKeUhyWUJaRnZOQkVadnhsVXNzY0cweHNEbTJERTM3?=
 =?utf-8?B?eUkvc2pQTUN6OGQ5NnZzWHdoTk4zQzlaU3FsS3dmaC91SEMvWVI2OFF1OWhB?=
 =?utf-8?B?YnFLbDI2ckxUTERFTjRka1NucmZ6OWlDNWlMaXdCelVETzJxOWFUVENzNy8w?=
 =?utf-8?B?TVFwNnAwODZzNUVOTUtWZFd1K015TnJBdHN3U3R6UGw1Y2g1Y1hNcVd0MVZ6?=
 =?utf-8?B?UitvQ1lGVFUyRDdSSHJZYnB1dFJ3V1FmZklsNG85c2RLTXE4amhIallIbGRh?=
 =?utf-8?B?NWxvV1oyMTFLVFlrTmhEWjhLVlNQLzVvOURjcVEyU2VrQkR6OVFiTDZwV05y?=
 =?utf-8?B?b2xZSHdFS0lPM0RicjVqdkN0djg2V0hHVnE4VzZYeHhNZXlxd3ljejB2S0xx?=
 =?utf-8?B?MlFURDVldDA3SEgwbU13ZDNKbkdyeUh4ZUo4THVwcG94b0QrcGEvMmpXRnhL?=
 =?utf-8?B?bnE5SmwrdU1aT1BKY0tLb29WM0NkcUhQT2l0Y0VXWjhRaTBUYk5EVVJoRllp?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1000b4-73d2-49e3-fb48-08dc2c53083d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 05:17:11.4910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EEM6SheA29PRP00IOD6u2wVmgGcYZT9wSArJLjnMQ5Sm2g8MDVB+rMA8WPAFVd8imX0rMlhtqebVAvT5Rqzsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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



On 13-02-2024 06:04, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC loading can take longer than it is supposed to for various
> reasons. So add in the code to cope with that and to report it when it
> happens. There are also many different reasons why GuC loading can
> fail, so add in the code for checking for those and for reporting
> issues in a meaningful manner rather than just hitting a timeout and
> saying 'fail: status = %x'.
> 
> Also, remove the 'FIXME' comment about an i915 bug that has never been
> applicable to Xe!
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>   drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>   4 files changed, 214 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> index ec83551bf9c0..d0b5fed6876f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -7,8 +7,12 @@
>   #define _ABI_GUC_ERRORS_ABI_H
>   
>   enum xe_guc_response_status {
> -	XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
> -	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
> +	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
> +	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
> +	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
> +	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
> +	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
> +	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>   };
>   
>   enum xe_guc_load_status {
> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>   	XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>   	XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>   	XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
> +	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
> +	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
> +	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>   	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>   	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>   	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>   	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>   };
>   
> +enum xe_bootrom_load_status {
> +	XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
> +	XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
> +	XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
> +	XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
> +	XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
> +	XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
> +	XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
> +	XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
> +	XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
> +	XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
> +	XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
> +	XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 92320bbc9d3d..a30e179e662e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,8 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HEADER_INFO				XE_REG(0xc014)
> +
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
>   #define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
>   #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 868208a39829..82514d395704 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -16,6 +16,7 @@
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> +#include "xe_gt_freq.h"
>   #include "xe_guc_ads.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_hwconfig.h"
> @@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +/*
> + * Read the GuC status register (GUC_STATUS) and store it in the
> + * specified location; then return a boolean indicating whether
> + * the value matches either completion or a known failure code.
> + *
> + * This is used for polling the GuC status in an xe_wait_for()
> + * loop below.
> + */
> +static inline bool guc_load_done(struct xe_gt *gt, u32 *status, bool *success)
> +{
> +	u32 val = xe_mmio_read32(gt, GUC_STATUS);
> +	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
> +	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
> +
> +	*status = val;
> +	switch (uk_val) {
> +	case XE_GUC_LOAD_STATUS_READY:
> +		*success = true;
> +		return true;
> +
> +	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
> +	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
> +	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
> +	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
> +	case XE_GUC_LOAD_STATUS_DPC_ERROR:
> +	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> +	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
> +	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +		*success = false;
> +		return true;
> +	}
> +
> +	switch (br_val) {
> +	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> +	case XE_BOOTROM_STATUS_RSA_FAILED:
> +	case XE_BOOTROM_STATUS_PAVPC_FAILED:
> +	case XE_BOOTROM_STATUS_WOPCM_FAILED:
> +	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
> +	case XE_BOOTROM_STATUS_JUMP_FAILED:
> +	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
> +	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
> +	case XE_BOOTROM_STATUS_EXCEPTION:
> +	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +		*success = false;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/*
> + * Wait for the GuC to start up.
> + *
> + * Measurements indicate this should take no more than 20ms (assuming the GT
> + * clock is at maximum frequency). However, thermal throttling and other issues
> + * can prevent the clock hitting max and thus making the load take significantly
> + * longer. Indeed, if the GT is clamped to minimum frequency then the load times
> + * can be in the seconds range. As, there is a limit on how long an individual
> + * usleep_range() can wait for, the wait is wrapped in a loop. The loop count
> + * is increased for debug builds so that problems can be detected and analysed.
> + * For release builds, the timeout is kept short so that user's don't wait
> + * forever to find out there is a problem. In either case, if the load took longer
> + * than is reasonable even with some 'sensible' throttling, then flag a warning
> + * because something is not right.
> + *
> + * Note that the only reason an end user should hit the timeout is in case of
> + * extreme thermal throttling. And a system that is that hot during boot is
> + * probably dead anyway!
> + */
> +#if defined(CONFIG_DRM_XE_DEBUG)
> +#define GUC_LOAD_RETRY_LIMIT	20
> +#else
> +#define GUC_LOAD_RETRY_LIMIT	3
> +#endif
> +#define GUC_LOAD_TIME_WARN      200
> +
>   static int guc_wait_ucode(struct xe_guc *guc)
>   {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
> +	ktime_t before, after, delta;
> +	bool success;
>   	u32 status;
> -	int ret;
> +	int ret, count;
> +	u64 delta_ms;
> +	u32 before_freq;
> +
> +	before_freq = xe_guc_pc_get_act_freq(guc_pc);
> +	before = ktime_get();
> +	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
> +		ret = xe_wait_for(guc_load_done(gt, &status, &success), 1000 * 1000);
> +		if (!ret || !success)
> +			break;
> +
> +		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> +			  count, xe_guc_pc_get_act_freq(guc_pc),
> +			  xe_guc_pc_get_act_freq(guc_pc), status,
I think this should be current requested frequency xe_guc_pc_get_cur_freq
> +			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
> +	}
> +	after = ktime_get();
> +	delta = ktime_sub(after, before);
> +	delta_ms = ktime_to_ms(delta);
> +	if (ret || !success) {
> +		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
> +		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
> +
> +		xe_gt_info(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), ret = %d\n",
> +			   status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> +			   xe_guc_pc_get_act_freq(guc_pc), ret);
Same as above.

Regards,
Badal
> +		xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			   bootrom, ukernel,
> +			   REG_FIELD_GET(GS_MIA_MASK, status),
> +			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +
> +		switch (bootrom) {
> +		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> +			xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
> +				   xe_mmio_read32(gt, GUC_HEADER_INFO));
> +			ret = -ENOEXEC;
> +			break;
>   
> -	/*
> -	 * Wait for the GuC to start up.
> -	 * NB: Docs recommend not using the interrupt for completion.
> -	 * Measurements indicate this should take no more than 20ms
> -	 * (assuming the GT clock is at maximum frequency). So, a
> -	 * timeout here indicates that the GuC has failed and is unusable.
> -	 * (Higher levels of the driver may decide to reset the GuC and
> -	 * attempt the ucode load again if this happens.)
> -	 *
> -	 * FIXME: There is a known (but exceedingly unlikely) race condition
> -	 * where the asynchronous frequency management code could reduce
> -	 * the GT clock while a GuC reload is in progress (during a full
> -	 * GT reset). A fix is in progress but there are complex locking
> -	 * issues to be resolved. In the meantime bump the timeout to
> -	 * 200ms. Even at slowest clock, this should be sufficient. And
> -	 * in the working case, a larger timeout makes no difference.
> -	 */
> -	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
> -			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> -			     200000, &status, false);
> +		case XE_BOOTROM_STATUS_RSA_FAILED:
> +			xe_gt_info(gt, "firmware signature verification failed\n");
> +			ret = -ENOEXEC;
> +			break;
>   
> -	if (ret) {
> -		struct drm_device *drm = &xe->drm;
> -
> -		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> -		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> -			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			 REG_FIELD_GET(GS_MIA_MASK, status),
> -			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> -
> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
> -			drm_info(drm, "GuC firmware signature verification failed\n");
> +		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +			xe_gt_info(gt, "firmware production part check failure\n");
>   			ret = -ENOEXEC;
> +			break;
>   		}
>   
> -		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
> -		    XE_GUC_LOAD_STATUS_EXCEPTION) {
> -			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
> -				 xe_mmio_read32(guc_to_gt(guc),
> -						SOFT_SCRATCH(13)));
> +		switch (ukernel) {
> +		case XE_GUC_LOAD_STATUS_EXCEPTION:
> +			xe_gt_info(gt, "firmware exception. EIP: %#x\n",
> +				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>   			ret = -ENXIO;
> +			break;
> +
> +		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +			xe_gt_info(gt, "illegal register in save/restore workaround list\n");
> +			ret = -EPERM;
> +			break;
> +
> +		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
> +			xe_gt_info(gt, "still extracting hwconfig table.\n");
> +			ret = -ETIMEDOUT;
> +			break;
>   		}
> +
> +		/* Uncommon/unexpected error, see earlier status code print for details */
> +		if (ret == 0)
> +			ret = -ENXIO;
> +	} else if (delta_ms > GUC_LOAD_TIME_WARN) {
> +		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
> +			   delta_ms, status, count, ret);
> +		xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			   xe_guc_pc_get_act_freq(guc_pc), before_freq,
> +			   xe_read_perf_limit_reasons(gt));
>   	} else {
> -		drm_dbg(&xe->drm, "GuC successfully loaded");
> +		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> +			  before_freq, status, count, ret);
>   	}
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index daf56c846d03..eac8f2c9fba5 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -15,4 +15,36 @@
>   			    "Ioctl argument check failed at %s:%d: %s", \
>   			    __FILE__, __LINE__, #cond), 1))
>   
> +/*
> + * xe_wait_for - magic wait macro
> + *
> + * Macro to help avoid open coding check/wait/timeout patterns. Note that it's
> + * important that we check the condition again after having timed out, since the
> + * timeout could be due to preemption or similar and we've never had a chance to
> + * check the condition before the timeout.
> + */
> +#define xe_wait_for(COND, US) ({ \
> +	const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * (US)); \
> +	long wait__ = 10; /* recommended min for usleep is 10 us */	\
> +	int ret__;							\
> +	might_sleep();							\
> +	for (;;) {							\
> +		const bool expired__ = ktime_after(ktime_get_raw(), end__); \
> +		/* Guarantee COND check prior to timeout */		\
> +		barrier();						\
> +		if (COND) {						\
> +			ret__ = 0;					\
> +			break;						\
> +		}							\
> +		if (expired__) {					\
> +			ret__ = -ETIMEDOUT;				\
> +			break;						\
> +		}							\
> +		usleep_range(wait__, wait__ * 2);			\
> +		if (wait__ < (1000))					\
> +			wait__ <<= 1;					\
> +	}								\
> +	ret__;								\
> +})
> +
>   #endif
