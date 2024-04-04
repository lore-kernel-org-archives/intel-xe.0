Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C6CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 13:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F1D1133C0;
	Thu,  4 Apr 2024 13:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIcp7JHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCA310E779
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712237562; x=1743773562;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VfFASz/QwebKHO0JvwJeibOQFH4XmZ2S6sl0OVAwrbs=;
 b=SIcp7JHK0rMTvStCo37cPeqRNwyrqxTOG3y8iF1wd/yG/FPYXwwUHH98
 giqBW4Uet/TmrfuMu7s4ZaJH0RPowdOxnfxF2dwfhTleISGCjas1UbduE
 bufaumlZpHDrln7DJdAsBPCqNx/RROrFSiZy10XQiXUmck1xbfFdgk1kq
 PStTEtL7engi2/KlDPIc3TQe8zPuRnF+uKw8wwx9vtd+LXqVjolgYmVmx
 LTLqq1ji9qM+ScmzzYHnE20ZMjwKYEDjKSQN6LKeaosKqDlxUTAbCOldr
 dZ0TmtOlgu5h0Hh1T0bZpeOCZQqAZ0Dr+ExN3skv6iXRvSCR3BAD831gK g==;
X-CSE-ConnectionGUID: HGuZ2YxnTD6QM+yQMQyfWQ==
X-CSE-MsgGUID: lZ6nA0G3Twaknm4glBb3Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18668308"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18668308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 06:06:26 -0700
X-CSE-ConnectionGUID: p0gEawAxQ3CoIDdkxkDqDA==
X-CSE-MsgGUID: xT9iM5hFTqmY+BVY5srl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23536354"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 06:06:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 06:06:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 06:06:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 06:06:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 06:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccgmDO3HU19tCH9UGOxL8qQChjTeIBajlOMwi/i2/cQ9oOl3p70UYt2Lwh1V0XwRlDNPRANXHHVVZ7o/s/UpX+K3L88TC/3Fe2XyMUuF0k/Zg/tNUIY6KaLHlr8ZYnpgkUhBrtkW0Hl2JK9ifl7NivnyRIEjdVyrfL2y4RhKK0kGyec+b4DaVjBTys5RiOOw1SHRz8/nWndky2TVTaxGvjsIaP8Wb6Idly0uZtX2np6coKyU44WIK8pW1xlALtDudFFn1zVWW1LT8xXmIgxgb4ZsOQh+wKyCyODbYzBU2AlnPyHEw+lO+5v5uUHnAF/8uo8RZuLLM/7OY33/MOPmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS07UVdDTK1+Og5ID9tzeVnJGKrrdv2MaI79SwyoRh4=;
 b=FmSgphouoE/GBw587Pm+TsU0PHxEZqgkfhQb7aiRnYXoWuMDhybjSCYL8c+zHDiZTB6K9dGUTqoG75Wrck6qaeHjfaYiAncSGEgIdnMBZsMdhsuJ1s95kCXJkodcyS0Weg04O8MPbuWn3Z+60k6xhH/QdqSHLIAbA9O55KTaDEE38nNuKfX3JnMzKbIo+PaxV1TsySaZ9Naiku9qw3y1gTu5tlA+3NrM52btnia8L1WfGCQpnpOm5fkBQ+bNaanxcm4QTtt/1Rt9Rlkx1tIrWKAPQrmemkwAJLtYTrxaj/Oh7BGlB9so88ciHVuuGemS/XXPtxiDmqeU//zSAGgupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Thu, 4 Apr
 2024 13:06:16 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 13:06:16 +0000
Message-ID: <3a33ab35-2a92-482d-8ba4-b74e08df52e8@intel.com>
Date: Thu, 4 Apr 2024 18:36:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe: Define XE_REG_IS_VALID
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
 <20240404100827.1109447-2-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240404100827.1109447-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::4a) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA1PR11MB8317:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPuAcC4uvNkKtA0yUMIK7xPMXt9wNQ9q1LUPOpKSgsfNXuwMZ/ROq70BZHJ8dYTzXrDj4mJs+kqA1bdzYUcSUfoFeVgta/AIdTXr5o0DYihmupZ78CXrQXtZYMYAFAkLAT01iicEIF1EgQXGtb08PFvvwsVNXwQfq0fq+k6TXAmaT5aEmHtD1RRk9ymAomlUtJCYEHf5CTg1tn9PJfsRj+s5xrrd+QGmZIEv7MbIJafonPI/KdFUjwW82E9qzA36xOl0omxNQLnyN+ocAUbKCfNZPvmeBSBhT2MWO9pxQvp5KAmBagkyVZiW6zL6z8+Wa08rHxoIKxfolBnZrujJp6EJrJxebaWGpRLhHs0D4r12KFWrIBd2vdDrNG1T5EACp7hSRRWdrVO3Ehxek5hdxRJp788CL81ol7sFTJ8S0x7y6OjbhAB+mc0WkR6wbM4EoaHN938/SfDGnGO/b92VtSNWxE3Od1ZrBd0+D9VGQAGrQx2cGrykGxgVXWOSO7SHBbzgtS7bnGZdmovbtbNBaA6jxm5Hjpw+tnDpuhLL/p51GJgv54lHs3mmZjatNleuRaszTWAxQOd1mmPyeAq3g0ea1FO/fZXgMvlNdSp6IVuE3mKBsXyQuz6GcGtmBt/y4z/aL64rDJLI1mdRPGbdEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzltZjdSZHZJL2xqb0pPV1J3Zi9Ga2ZqYmZuOTBnMFNuM00rTGlSTzNKRk5q?=
 =?utf-8?B?bkFxT2c4MytqbmorRVJyTnd1RDlyNXlHQ1BWYzd2d01DRHIzbllTSWZkU0ts?=
 =?utf-8?B?UDJoa2EzdWQ0Tml0Ui9qdUNmSXdJSENBRVlXb2l5OWlta0ljMXBXS2ZrNlpH?=
 =?utf-8?B?Zk5BZzQvYnZCb2lzN0VmV05XdHlna1hIKzlTSDBPSWdGYUhNSndIS3hCNndT?=
 =?utf-8?B?RkxNQmp0UzRER0tES1lXT3ZJVUw2cmpkK2VWb1dsT1V5cjBGUkVGM2VlTkli?=
 =?utf-8?B?K2hoTEtnMVFCVERUczRYSmZZdVNpb2hrRG8wcVdOdXRURjByY3ZyaEZOKzNv?=
 =?utf-8?B?KzhBZDdoa24vZ2c2WmJyeDBoOHZHZGs3UFNVVXhZSHZ6QVJIN1habFc5cUJK?=
 =?utf-8?B?OUNPQktXME44TU1jZlBYVjRPek8zVHZ3OHBUZXNzOW1zSjNKaTM3RjlBOWhm?=
 =?utf-8?B?MmNKOTVHbytZRGtndGQ4b09KZmRpL0F1NW9zcHNhU2l3NU5KQ0FwbVMyTHdL?=
 =?utf-8?B?WFFKZGU5cGY1bFVacEQvdk9OV3BtN0tkQU40L1ZjbGFwTlRMU3RFMUJ5Y2dU?=
 =?utf-8?B?eFNRSnZPeFBqSi9ydjBDME9ScmFIdFJkSlI3K2dBQUxXeXYvdjltMTlRM1FP?=
 =?utf-8?B?YnRVc1ljRnF0K2tvb2NmbEtpa0ExK0sxelhVNS84djJ0WU1vZ3ZEM0ZsVzBH?=
 =?utf-8?B?UEwydTJJd05oNGxNS25mYnpDMDhDQ2hnTmJnV2JVTytJYlNCUWFBWENMNWJk?=
 =?utf-8?B?U214YXJOWm43RlhqVDdtTTNvQ3RXcng0RUJZd1dIRDFaVDhjSGg1cy9NS1o2?=
 =?utf-8?B?QW51VmhGRklxaE9mT1UwejBneDM5MGNoUVlxRGwycHZHaTRMdjFPOUZ6aVEx?=
 =?utf-8?B?WkxpRE9iamVnUjErTFFBZnJjVkRTV1VXc1dzclRDL3pFZi93OFJjRGY0blNk?=
 =?utf-8?B?MzhRNWV5MktWZHZzT002eUJUaWlZb0VSallERXpMV3ZmcVd0a0tKNldYZ3B5?=
 =?utf-8?B?emx3WUk5ZXc5bHhZVW8rYnRPcWVmLzNCT2FLUWhMa0dzTlJtQmxmaFpEKzRF?=
 =?utf-8?B?clhNNDM2WWlHcGptNWYzdGE3djdJcFQ5Vmdha1JCWUJ4QnBSYzdEYTNXd1Jo?=
 =?utf-8?B?UGFWdTFmcWdCWUVNQkNRSVNCTmNKbzRXY2g3Y1NHdlhGbmJrSU55K0FBdWZs?=
 =?utf-8?B?RFJPSUFJZFdTTHJyZ3pGR0xqLzA0UkJTcW1uL2UwLzRZT2tPTUhCemNXY0tI?=
 =?utf-8?B?bzBPMHdScHJNY3JyQUd5NkZNSzZZTEFwUHhjZXpnNDNLV0lkU3Q4OXlLMnNJ?=
 =?utf-8?B?Ny84MFVjaXJkYndKUno4SFk0ams0Um1YaFFrcFFvMEhTNDlmOHZUYjh6RlZ6?=
 =?utf-8?B?NkV6YUFTdlZlQ3l3K1VvM3Y3cU1TcmREMEZ2SklFL2RpR0h3dmNIL3RVcEpL?=
 =?utf-8?B?ZFJJWHlLbnZSbUQ2VlpWeG0zSnBLK2JvQjZpb2tXUVhlbTRHUEJYbWNXalVk?=
 =?utf-8?B?U1lBanVmQnl2MWo4N1pZU24zWVJic21ueDBIZU82Y1JkWW4wdVo0MGdwNThj?=
 =?utf-8?B?ODJEWk9TZWNoc0pWS3FKUmNxV0R5eXVOR1VJZ2NSeGxYYk1xbTZONW9LRUlF?=
 =?utf-8?B?bnZLQlRWaHFGZnNPcEZwWVdHWXgvWmR5bGY3NC9KMkxCQVM1ZUFta2ZoazFz?=
 =?utf-8?B?NlVudWxUWGxjUDJHeGNYNFdLQUdTbXJUS3NvZEk0RUF6VHZVcDJGRUZaVzJ4?=
 =?utf-8?B?MjdUWmNVcDVoTE1sdHduVTB2eXB2S0IzUkg1YUhDMnhISytFTEFwb1Y3VlFt?=
 =?utf-8?B?dDVIOWJTc2RVQ2hYWDgxdWh0dndMSHM5a3h1Wkg0N1FONG5iNlpnWmhidzVh?=
 =?utf-8?B?ckU3bTY4MzFlY0tmc0FiaC85VVdxcEFqdVl6T3VsQnl3bk1qRDRpNWJFZDdw?=
 =?utf-8?B?ajE2YWZqN0RCZUFqSEY0N1cvVExLdVQ1MkVSYTgveC9pTDRBUVZxM3NtaC9K?=
 =?utf-8?B?RXErWi9CeWlTLzFsdGZ6Um1kbUlac0dtNkRtZG15YzBSdmxSU3BjSjFvcit5?=
 =?utf-8?B?L0RyVHF2anlUZUttT0pJTFhIMnJYajZuVVUybGJvZjFaV1JpVXdwV2JheGJD?=
 =?utf-8?Q?vwDd2J/CVZKxA7hLrjCiVmoGm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfb7cd0-dd7c-4fa9-2454-08dc54a80324
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 13:06:16.6979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB/pBkMWKzT6iCztdFQtmIWb27JEqTWa6qfhQ3NcgcmvCdGzXKwH1EOWp+XV0urL44I//i1on+qUCOv8jR2HJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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



On 04-04-2024 15:38, Karthik Poosa wrote:
> Add macro to check if struct xe_reg has valid address.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
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
> +#define XE_REG_IS_VALID(r)	((r.addr) ? true : false From patch 2 intention of adding this is to abstract the use of struct 
xe_reg. Since this is macro I don't think this is real abstraction. How 
about using inline function instead of macro?

inline bool xe_reg_is_valid(struct xe_reg)
{
	return (r.raw ? true : false);
}

Badal
> +
>   #endif
