Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF6AE95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 10:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DFB10E25B;
	Mon,  9 Oct 2023 10:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6691E10E259
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696846475; x=1728382475;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7Accs/45N8H6xFEHMrI5F3G5VRrWOSrcjiSCu1UCsmU=;
 b=ke1UWovsQQg5aXAItya8qD5vv337kMW3D56yOWCv3jTXeU+VT0kT2KQQ
 nopNGU62aIY8sPZMsJ0Tg3vbJM9dNPlXxyVBFrrn7E4aB3Yt3YI1GP3TM
 dZQN4Y99deQw1BAHYm5D9007wbSBIH88UKSND+wa9uspcjBS68Mz1ZWfw
 SVUHuE0pFwQhN1PZY+wPvLswjM7J7vSnT/ES1ayPy6qIEvoSkunIgGzsB
 brfs5Sd3MJJ1OP3aPH9air4wltsSy+AvyQrf0E+RPpK7MWAjQVcggIzs9
 uXjCur2nn3Bc5rk8QbslPy1oYWPweD3utW1QZaERu29HNb0X+4v/0QSab w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="386954941"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="386954941"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 03:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="702848956"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="702848956"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 03:14:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 03:14:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 03:14:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 03:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1rJ16RkqIcqY0m7n13Y7Ve17mRLVmAFvFY967puxLFbqQwq1CTwqLnMurHnz7RX17/NmrxkdW5xiJlIwI+0mwD0D2xpa87EA8ol54uZUNufLaHKSZp+3ruBSngYQ9UlDosePUPJ+SsRXTgq3xqwfrjY4PExmH0Pu5igoJ4MmuRuelE2NhgAbieDagI+f3mAFR+3jYyFap7j3rb3FGeLmm+8k5bPocD+nauSRTdep0ZwmRdCC6WebN+RvViGhIO94301sz8gAHqChx+gC//RpGKCq6B3wSydxII8Hqcu5BdsCLhoF6JTO85JS3py9dEWkspnmZvK/HHDYsghGzS/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOWgXqsfBDXkkrPHq6GxNAPQDRN7uIn4WtLL3Dvk+TM=;
 b=WWg6x2wc+Wp0IAWkut1y6jB8NgVUhbhbc4/ZOfY9MS+KlnQzIR/b4xqOrjTFWYwXUkH/tRWJKSn6F2Po3yTTz2OUllK1dsOyhDJ/oyaSTwborsaBAvdVUj3AwR4XhjsikweIIW3xJcLF40U53Gjlh3wWXwdIah5rhVOIUPxRLt3n0qHChzfrqtFpqMRvl/F6B7Bnt+qoxcE3ykpLhS+5+sEPOlCqW9uSC/P01ZRV9hqWTyOcrrZwedITfdLDAHzKOUmm55aFE1Xf8LSdtEbWnQAnPbGy4kapcPVR3R9IpputuoDOQ2+DwJNICUWKUq/qrWiUwcytiFnaMdkH6W0i5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA1PR11MB8099.namprd11.prod.outlook.com (2603:10b6:208:448::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Mon, 9 Oct
 2023 10:14:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 10:14:31 +0000
Message-ID: <8192493d-fdd9-480b-9788-8bb6df7e8aec@intel.com>
Date: Mon, 9 Oct 2023 15:44:21 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
 <a136ed15-ade1-a2ef-9e48-4ab5faa96bdc@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <a136ed15-ade1-a2ef-9e48-4ab5faa96bdc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA1PR11MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: e1faf45f-bc7c-43e5-7718-08dbc8b0876b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnlPJk1Om5sYhyPKO2ro/YMXwrwJ9JmvzrGY+K3nE7jK2Bix41W5xxmWs7eJVv3Uu0t/+n8qmYJQUepptIx3Zq+58uyv1pBOR9Yw3lBEXL5MnsluQrXKsqW3DgaiGLE6QM918oqQiLY1OaMsFcc9rps53LL0jyvPdGteiLfKAyjhkrGBrGK8Ps6mh+6+pPTDJT8UxepCtN6zak4eFEpMNjTLvx4INVhZhIty0FHiX4sACQbjyNUigDUYAIqnvj609Z0lAtjMu+xomO5DLxJOmJ/NQuoXz6LgvFg4oZ2d5F4e6Bd+28F3HzcNCzLr966rLX4Z133cxu5Qyez6N9k4TxvhEvZCJd5FRHHTiO/5cDtek47nbsdJD9V84Qn3l/KQXtyF5SCwqtEprp/FlqrLfL5aOLBWG3WCF9gXN9DijmaEO7r48ZGgsH0/6b0CfZLLiPqaIZp72eos2nh6GZ58IflDcAaIhhd9AqfjfgwrGgTo5UqkfKaNjOv4Y4dVyyim3BaWICE9+F53IdCu1Vo55+OkjObxpex4cmPJv8nBImDc0sndioLMsjQVg4Rkt93C2B90iukBW98mFLU/xh+bqn0o67wT191G5eVfHI4L0eAa+5dABCeC6OPbEbksmDbhZ8Lza3M4padRg5zxt/TW6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(36756003)(66899024)(82960400001)(2616005)(26005)(53546011)(6506007)(6512007)(316002)(66476007)(66556008)(66946007)(6486002)(41300700001)(8936002)(6666004)(38100700002)(478600001)(83380400001)(8676002)(30864003)(31696002)(2906002)(5660300002)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjhBUVBUeDFNNE1TL2JHM1B3eks2Z1c1RFRnSkZPbG9BTHFHQjFaeEwvSlNa?=
 =?utf-8?B?dlBVT09XY3JXZGl1TnU2L1VWVlBvVjVFaHYzWDZZaFBzMk9GaC9ELzVPaEVL?=
 =?utf-8?B?K21BL3VUMTlLTXdURjA2bXZsRG5mS0c0TXRvdkw3TVlaajVhQXo5Z3pPenh3?=
 =?utf-8?B?RlNsNkZTM2VBVXVWQjZNQThmaDRkdHZ2cm1Bb3FJQ0krZzgrNlgwVFBwNXlm?=
 =?utf-8?B?b2NyZW9XWFViZTArbXkwek9iWEpvemt5TkJTV0JaQisvNWZWZG5wa0dxdnlN?=
 =?utf-8?B?aEVuREZWL1daaVRmNGdJRTcrVmZtdzBKSUZOR3NyV3BXbFJOVlg2bVIzNlJE?=
 =?utf-8?B?Yk1PWnVKQml6Y2hYZnhMZFU1TXNpZXJHa1lmemtqQktuVzNPQmM5d1RmUTQ2?=
 =?utf-8?B?Nk5abEFSTnlxejhJL25BNzFHaWpPSFNiWGY1M0JFeXZZbWNsOTJRRmNnYkR0?=
 =?utf-8?B?bEJWenVMcXRTbWV4YXdNNlVjVUVMb0RBR1FjdHRLQ2h1ZGlVeDZIbU1PU0lq?=
 =?utf-8?B?cjBCdUFSZi9iWi9FQkd1bm5DakxPRW9SZ2ViY2lPNUVJeDVWWjRwcmFVdzNi?=
 =?utf-8?B?VkFIWGZRTmFRZFVHVEwvM2NaT3dPS1RYZndHWTczTnFnamJ3MkNNNzVTbGE3?=
 =?utf-8?B?YjVLSVdzWUZhMk5PV1o0L1VyRlZDbm5NbCtIRUxnaWczSlRqTlVHUTJxTWMx?=
 =?utf-8?B?MFBidlNPRXl3Q1F5bkt1cHFXcFJGZ1YxRkEzOEFMZmtUYUFHaytCQm5YYmls?=
 =?utf-8?B?Q0VJcjI2WkV0Y3RFSkQyUHRJVFFiL2phQThWdEFUL21CT1NCZFFSeW8rMHJH?=
 =?utf-8?B?ZndCOGp3UElkRGtOR0RnUThIangyUzZyRW0zZ2lIRy9SbldnbEVBMVgxb3Jy?=
 =?utf-8?B?ekoxWWFrQXROT1NoZDNiZzZ1Y29DbXhlTE5VcisxWStrNGh5NmtRb0w2dHFT?=
 =?utf-8?B?ck1jOGU4cjdJOC9Kb2hRa3Z1MWZJOGh6dFVBQTFjUUwrRVlsYldCVzhiRVlT?=
 =?utf-8?B?MUVXQ1NYa3krVG5KNTZwblhwQnozMWdUVDg1SDErZjFYcnp1QXVBdVRJV2Fj?=
 =?utf-8?B?ek12TllQSHBMZmxPdjIwYWE2V2M0dHZyUVBGOW1CMVBsRzl1eUt6TDdHcklk?=
 =?utf-8?B?U2hvSUxPSDRuQ0tuT1l4TGU2RldSR01vWmlnN0pIZ1ZNenhyWGNCbVJucUFL?=
 =?utf-8?B?NE1CZGYxRitVdi9qNnNqZm90V3gyTDRzUUZMMTdRZDIwcG43QVkzcXFxL2pi?=
 =?utf-8?B?K0Qvdkc3bmErQWo3OEhOTjh5WXY5YmFrRUlCUUN2dHZyQU5wUUlGaVlrbHg1?=
 =?utf-8?B?ZG5lUWxSaUtGM0NWdU1aNDVIcG9sV2tlNmdET2I2QzBVeGFTMVJ3eWpud0lI?=
 =?utf-8?B?UHdxMFNUZzh1SUtVYnQxVVY2elRGeVhhTEoyUklwaVZVeFNqbjBsNnNEVzkx?=
 =?utf-8?B?ODI5QXlpa1N4RjVqdXVZejlwcm9sQVM4MG96WkV0dzJCVW05ZTYwbE1HYTdx?=
 =?utf-8?B?emxBTWVjUXRzWlpCditaQjlKaGQwbzFyN3B6OUFobTZ0Nll1RHZqejhZeWhj?=
 =?utf-8?B?bzdJbXF3OGlsenZWTmd3VGdMdHJ2dmJGZC8wKzlxOTUzL00xdFJrem50eEpl?=
 =?utf-8?B?RjRPWjhJY1Y2YWdVQnhsQlZTS0NvaUlDN1ZKZklmWnpXRHlUaUQ0cXNuNXgv?=
 =?utf-8?B?QkRtWUlPVi9KQWNBMXVKMFNzdi9ZdmZGQTRVZmw3dEV1K3lTOHhOL1lTcU11?=
 =?utf-8?B?SWZuMWR4SkRtNmxjSXRPZWNkNk1OWUNzWWJ4VkJhWmZaNmlIdTBIY1J3b2pL?=
 =?utf-8?B?eGFQcmMzZ05OUUZSQjFYQnNVMmxHQWw5U2tvMFBQdHIxQkNxT2hPaGtCbkVt?=
 =?utf-8?B?Q1JBZHRBemVzOXVzTDQ4eVNtbVFhb0wxbEhzNU1KT1A2MGM3S21GSzlKb2J1?=
 =?utf-8?B?dHFxcjFDcUpsaHdNRjREZW9UQlN3Lys3alp1UGUzcVdhbHQ4eHJNK0xnWkFY?=
 =?utf-8?B?aU05UER5eDV1N0JtdmxIejBEbktQU3FQNTA5WDFKUUd1SjFDSkR1R2MrY3Zo?=
 =?utf-8?B?bmF2VkdSUGtrR1MrOWtiK1dhTmhxa0VheXJzcFJTZzZXNUhaakdoTzFOQkhO?=
 =?utf-8?B?NDJpMnVNOEtiMlpDV1RhaXRzZW1WNUVOamdhdlZtUVBCdG1iMVE1R2xabk9x?=
 =?utf-8?Q?uOSVkigmuH1elUf1eoBP6ZI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1faf45f-bc7c-43e5-7718-08dbc8b0876b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 10:14:31.7893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oP0TZcll/PtJZZuohsxI9tmI5/q1wpvLqrgVNBtUzRBSSloXUUUXAKeEmmZCE8k9152LEJoBzd2u6l9Lz+MQcGEhS94KWuBYqbSBNDeeofo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error
 handling for PVC.
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


On 09-10-2023 15:22, Aravind Iddamsetty wrote:
> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>> Report the SOC fatal hardware error and update the counters which will
>> increment incase of error.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c             | 170 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
>>   3 files changed, 254 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> index fa16eaf9436b..04701c62f0d9 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>> @@ -20,4 +20,32 @@
>>   #define GSC_HEC_ERR_STAT_REG(base, x)                  XE_REG(_PICK_EVEN((x), \
>>   								(base) + _GSC_HEC_CORR_ERR_STATUS, \
>>   								(base) + _GSC_HEC_UNCOR_ERR_STATUS))
>> +#define SOC_PVC_BASE	               0x00282000
>> +#define SOC_PVC_SLAVE_BASE             0x00283000
> why do we need to prepend the register defines with 0s ?.
We dont need to. Will fix in next patch.
>
>> +
>> +#define _SOC_LERRCORSTS		       0x000294
>> +#define _SOC_LERRUNCSTS		       0x000280
>> +#define SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
>> +								(base) + _SOC_LERRUNCSTS : \
>> +								(base) + _SOC_LERRCORSTS)
>> +
>> +#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
>> +								(base) + _SOC_LERRUNCSTS : \
>> +								(base) + _SOC_LERRCORSTS)
>> +#define _SOC_GSYSEVTCTL		        0x000264
>> +
>> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GSYSEVTCTL, \
>> +								slave_base + _SOC_GSYSEVTCTL))
>> +#define _SOC_GCOERRSTS		        0x000200
>> +#define _SOC_GNFERRSTS		        0x000210
>> +#define _SOC_GFAERRSTS		        0x000220
>> +#define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GCOERRSTS, \
>> +								(base) + _SOC_GNFERRSTS))
>> +
>> +#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)		XE_REG(_PICK_EVEN((x), \
>> +								(base) + _SOC_GCOERRSTS, \
>> +								(base) + _SOC_GNFERRSTS))
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 76ae12df013c..fa05bad5e684 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair gsc_correctable_err_reg[] = {
>>   	[2 ... 31] = {"Undefined",					XE_GSC_HW_ERR_UNKNOWN_CORR},
>>   };
>>   
>> +static const struct err_msg_cntr_pair soc_mstr_glbl_err_reg_fatal[] = {
>> +	[0]         = {"MASTER LOCAL Reported",			XE_SOC_HW_ERR_MSTR_LCL_FATAL},
>> +	[1]         = {"SLAVE GLOBAL Reported",			XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
> I don't think we shall count the first 2 bits as they just specify which IEH reported error and not
> the error itself.
>
> May be you can introduce an enum XE_HW_ERR_UNSPEC before the max and use it to identify anything
> that we do not want to count.
Sure. Will address in next patch.
>> +	[2]         = {"HBM SS0: Channel0",			XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
>> +	[3]         = {"HBM SS0: Channel1",			XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
>> +	[4]         = {"HBM SS0: Channel2",			XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
>> +	[5]         = {"HBM SS0: Channel3",			XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
>> +	[6]         = {"HBM SS0: Channel4",			XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
>> +	[7]         = {"HBM SS0: Channel5",			XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
>> +	[8]         = {"HBM SS0: Channel6",                     XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
>> +	[9]         = {"HBM SS0: Channel7",                     XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
>> +	[10]        = {"HBM SS1: Channel0",                     XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
>> +	[11]        = {"HBM SS1: Channel1",                     XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
>> +	[12]        = {"HBM SS1: Channel2",                     XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
>> +	[13]        = {"HBM SS1: Channel3",                     XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
>> +	[14]        = {"HBM SS1: Channel4",                     XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
>> +	[15]        = {"HBM SS1: Channel5",                     XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
>> +	[16]        = {"HBM SS1: Channel6",                     XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
>> +	[17]        = {"HBM SS1: Channel7",                     XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
>> +	[18]	    = {"PUNIT",					XE_SOC_HW_ERR_PUNIT_FATAL},
>> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_slave_glbl_err_reg_fatal[] = {
>> +	[0]         = {"SLAVE LOCAL Reported",			XE_SOC_HW_ERR_SLAVE_LCL_FATAL},
> same here as above.
>
>> +	[1]         = {"HBM SS2: Channel0",			XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
>> +	[2]         = {"HBM SS2: Channel1",			XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
>> +	[3]         = {"HBM SS2: Channel2",			XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
>> +	[4]         = {"HBM SS2: Channel3",			XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
>> +	[5]         = {"HBM SS2: Channel4",			XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
>> +	[6]         = {"HBM SS2: Channel5",			XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
>> +	[7]         = {"HBM SS2: Channel6",                     XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
>> +	[8]         = {"HBM SS2: Channel7",                     XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
>> +	[9]         = {"HBM SS3: Channel0",                     XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
>> +	[10]        = {"HBM SS3: Channel1",                     XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
>> +	[11]        = {"HBM SS3: Channel2",                     XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
>> +	[12]        = {"HBM SS3: Channel3",                     XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
>> +	[13]        = {"HBM SS3: Channel4",                     XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
>> +	[14]        = {"HBM SS3: Channel5",                     XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
>> +	[15]        = {"HBM SS3: Channel6",                     XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
>> +	[16]        = {"HBM SS3: Channel7",                     XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
>> +	[18]	    = {"ANR MDFI",				XE_SOC_HW_ERR_ANR_MDFI_FATAL},
>> +	[17]        = {"Undefined",                             XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[19 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[] = {
>> +	[0]         = {"Local IEH Internal: Malformed PCIe AER",     XE_SOC_HW_ERR_PCIE_AER_FATAL},
>> +	[1]         = {"Local IEH Internal: Malformed PCIe ERR",     XE_SOC_HW_ERR_PCIE_ERR_FATAL},
>> +	[2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",   XE_SOC_HW_ERR_UR_COND_FATAL},
>> +	[3]         = {"Local IEH Internal: FROM SERR SOURCES",      XE_SOC_HW_ERR_SERR_SRCS_FATAL},
>> +	[4 ... 31]  = {"Undefined",				     XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[] = {
>> +	[0 ... 3]   = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[4]         = {"Base Die MDFI T2T",			XE_SOC_HW_ERR_MDFI_T2T_FATAL},
>> +	[5]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[6]         = {"Base Die MDFI T2C",			XE_SOC_HW_ERR_MDFI_T2C_FATAL},
>> +	[7]         = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +	[8]         = {"Invalid CSC PSF Command Parity",	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
>> +	[9]         = {"Invalid CSC PSF Unexpected Completion",	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
>> +	[10]        = {"Invalid CSC PSF Unsupported Request",	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
>> +	[11]        = {"Invalid PCIe PSF Command Parity",	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
>> +	[12]        = {"PCIe PSF Unexpected Completion",	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
>> +	[13]        = {"PCIe PSF Unsupported Request",		XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
>> +	[14 ... 31] = {"Undefined",				XE_SOC_HW_ERR_UNKNOWN_FATAL},
>> +};
>> +
>>   static void xe_assign_hw_err_regs(struct xe_device *xe)
>>   {
>>   	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>> @@ -451,6 +520,104 @@ xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   	xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err), errsrc);
>>   }
>>   
>> +static void
>> +xe_soc_log_err_update_cntr(struct xe_tile *tile,
>> +			   u32 errbit, const struct err_msg_cntr_pair *reg_info)
>> +{
>> +	const char *errmsg;
>> +	u32 indx;
>> +
>> +	errmsg = reg_info[errbit].errmsg;
>> +	indx = reg_info[errbit].cntr_indx;
>> +
>> +	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>> +			    "Tile%d %s SOC FATAL error, bit[%d] is set\n",
>> +			    tile->id, errmsg, errbit);
>> +	tile->errors.count[indx]++;
>> +}
>> +
>> +static void
>> +xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>> +{
>> +	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
>> +	u32 errbit, base, slave_base;
>> +	int i;
>> +	struct xe_gt *gt = tile->primary_gt;
>> +
>> +	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
>> +
>> +	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err != HARDWARE_ERROR_FATAL)
>> +		return;
>> +
>> +	base = SOC_PVC_BASE;
>> +	slave_base = SOC_PVC_SLAVE_BASE;
>> +
>> +	/*
>> +	 * Mask error type in GSYSEVTCTL so that no new errors of the type
>> +	 * will be reported. Read the master global IEH error register if
>> +	 * BIT 1 is set then process the slave IEH first. If BIT 0 in
>> +	 * global error register is set then process the corresponding
>> +	 * Local error registers
>> +	 */
>> +	for (i = 0; i < PVC_NUM_IEH; i++)
> PVC_NUM_IEH is defined as 1 so this will not process IEH1,
> check below.
Bad miss. Will address in next patch.
>> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i), ~REG_BIT(hw_err));
>> +
>> +	mst_glb_errstat = xe_mmio_read32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
>> +	drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +		 "Tile%d SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>> +		 tile->id, mst_glb_errstat);
>> +
>> +	if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
>> +		slv_glb_errstat = xe_mmio_read32(gt,
>> +						 SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err));
>> +		 drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +			  "Tile%d SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>> +			  tile->id, slv_glb_errstat);
>> +
>> +		if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
>> +			lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
>> +										      hw_err));
>> +			 drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +				  "Tile%d SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>> +				  tile->id, lcl_errstat);
>> +
>> +			for_each_set_bit(errbit, &lcl_errstat, 32)
>> +				xe_soc_log_err_update_cntr(tile, errbit,
>> +							   soc_slave_lcl_err_reg_fatal);
>> +
>> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +					lcl_errstat);
>> +		}
>> +
>> +		for_each_set_bit(errbit, &slv_glb_errstat, 32)
>> +			xe_soc_log_err_update_cntr(tile, errbit, soc_slave_glbl_err_reg_fatal);
>> +
>> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +				slv_glb_errstat);
>> +	}
>> +
>> +	if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
>> +		lcl_errstat = xe_mmio_read32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
>> +		drm_info(&tile_to_xe(tile)->drm, HW_ERR "SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>> +			 lcl_errstat);
>> +
>> +		for_each_set_bit(errbit, &lcl_errstat, 32)
>> +			xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_lcl_err_reg_fatal);
>> +
>> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
>> +	}
>> +
>> +	for_each_set_bit(errbit, &mst_glb_errstat, 32)
>> +		xe_soc_log_err_update_cntr(tile, errbit, soc_mstr_glbl_err_reg_fatal);
>> +
>> +	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +			mst_glb_errstat);
>> +
>> +	for (i = 0; i < PVC_NUM_IEH; i++)
> same here
>
>> +		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +				(HARDWARE_ERROR_MAX << 1) + 1);
>> +}
>> +
>>   static void
>>   xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>> @@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_er
>>   
>>   		if (errbit == 8)
>>   			xe_gsc_hw_error_handler(tile, hw_err);
>> +
>> +		if (errbit == 16)
> Please define the bits along with respective register and use here.
>> +			xe_soc_hw_error_handler(tile, hw_err);
>>   	}
>>   
>>   	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index ee7705b3343b..05838e082abd 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
>>   	XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
>>   	XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
>>   	XE_GSC_HW_ERR_UNKNOWN_UNCOR,
>> +	XE_SOC_HW_ERR_MSTR_LCL_FATAL,
>> +	XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_PUNIT_FATAL,
>> +	XE_SOC_HW_ERR_UNKNOWN_FATAL,
>> +	XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
>> +	XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
>> +	XE_SOC_HW_ERR_ANR_MDFI_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_AER_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_ERR_FATAL,
>> +	XE_SOC_HW_ERR_UR_COND_FATAL,
>> +	XE_SOC_HW_ERR_SERR_SRCS_FATAL,
>> +	XE_SOC_HW_ERR_MDFI_T2T_FATAL,
>> +	XE_SOC_HW_ERR_MDFI_T2C_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
>> +	XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
>> +	XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
> we have convention in naming, it shall be source_typeoferror_errorname
> this we shall follow everywhere even when we expose these counter to userspace.
>
> eg: XE_HW_ERR_SOC_FATAL_CSC_PSF_CMD
>
Ok. Makes sense will update in next patch.
>>   	XE_TILE_HW_ERROR_MAX,
>>   };
>>   
>> @@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
>>   	XE_GT_HW_ERROR_MAX,
>>   };
>>   
>> -#define ERR_STAT_GT_COR_VCTR_LEN (4)
>> -#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
>> +#define ERR_STAT_GT_COR_VCTR_LEN	(4)
>> +#define ERR_STAT_GT_FATAL_VCTR_LEN	(8)
>> +#define PVC_NUM_IEH			(1)
> ideally this shall be defined with 2, as we have 2 IEHs
>
> you can define something like:
>
> enum xe_soc_num_ieh {
>      XE_SOC_MASTER_IEH = 0,
>      XE_SOC_SLAVE_IEH,
>      XE_SOC_NUM_IEH
> }
Ok.
>> +#define SOC_SLAVE_IEH                   (1)
>> +#define SOC_IEH0_LOCAL_ERR_STATUS       (0)
>> +#define SOC_IEH1_LOCAL_ERR_STATUS       (0)
> there ERR_STATUS be better defined with registers as
Sure.
>>   
>>   struct err_msg_cntr_pair {
>>   	const char *errmsg;
> Thanks,
> Aravind.
