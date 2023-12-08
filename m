Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751EC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092B610E12E;
	Fri,  8 Dec 2023 04:01:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAFB10E12E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 04:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702008077; x=1733544077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lwv4SliUnTrjebK7xlTF/95BMWvs2wp3PDaxSpJSQxE=;
 b=a48814Hc+rpxHYYE4bnblDaA7+kKSj/WD5EYit4yzOOARe9t0DyrMEoi
 H8f/YIefdf5ckNpDSBoS4RDDaOVO5z1c5GqXzR9BR28lcTodKEQ8Eq58h
 b//uOBbtJq0usW6PUyQORDY6wDg0ipxbamX6Yfo2dlgQVuQkSlPAozYwN
 4NbP8NJ04f939262CSQmTfSfeOG9qxNUnPLnQ5YfT/X6n58RhyyqOx3Eu
 ZT/yd1oTsxrLMXwfkQa4+y1eXJVcF3cVsDrot73JpdeDQHhiZFoRyAKjz
 aPAb5/iMM8kvkp6nNOX2Khz9D7fLhikOAHNu87YhpapbL+Olwnc1ZgyXG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15905162"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208,217";a="15905162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 20:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="800968941"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
 d="scan'208,217";a="800968941"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 20:01:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 20:01:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 20:01:15 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 20:01:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8WDNF3VPKbGLh3YHKnswtaIankmCktENNgfFDW1+NLfAO880QpSTPNjYU1olPcURzlDu+WBS1z8j55ZVEyADOJ7ByZmpDbMN1Y/UFfzbvvKRS+JGb1u5dAzxEiZqsISO2HuRkvcl/xw4q9hn99a1NW039zt9qaaWoWC/7rg5Ea4TeUJDfJABl6JKBJxM3Xz48aS14oM/kJp0bFxAHTVfCB899LxnT0s5YOl6eYKbNlmBdvGb3MtmgvsCQ9xPLWZGIuRYbj0R3f7DdIIWsDumwpZBA5yJ7KIaG6L7g3NSjaGoQ1vk9/oRKPLXf1UGN9JN5suMeTcRYRlfkRO+Y1lkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocheTEWVNcKI5H5MJ1owciB6Vqq4BFNXFHeOgxsSwh8=;
 b=EyiFcwrIqAkC7GW5xp/mG1zvIbAiPni52CGN1PfrtNIBbRgPG6ooj5HPkFGxxHn7Kq5d4PWvAx/3Ap1hujTQtkh8gYm0Rafa8Gk4khNTukfcmSmWKAJSBG4+/G5MUSlo+Jlh9J0Zmd2GoeSLbe9Iu8jlEAqHmbFnI1q+qLn+idkT+qvTfy+qxPMQelFmm0Oi2+poxaLpjwnqzx7nxpw3wow6IBEO504ZDBnnwcRDyshRj/f6TdC0DpdsjWDIgmXQrwaFQNmorvTK5Qymu07822ZQfZI6WjYJd2xoOCQWNjXr2ovlRwlSro/x4Vnmp5zTzwJcI+iE6i9TagXfmqeM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5347.namprd11.prod.outlook.com (2603:10b6:610:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 04:01:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 04:01:13 +0000
Content-Type: multipart/alternative;
 boundary="------------Z7Z3reFEsJUfIuYdzOaBnpzy"
Message-ID: <e9efa93b-2fb9-4e8a-ab09-9214b966498d@intel.com>
Date: Fri, 8 Dec 2023 09:31:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 3/9] drm/xe/xe2: Updates on
 XY_CTRL_SURF_COPY_BLT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-4-himal.prasad.ghimiray@intel.com>
 <20231206232242.GR1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206232242.GR1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BM1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::26) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: bd93b8a9-d1ea-4cb2-3dc2-08dbf7a25187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cWuoGrs9aA3nmYLp8h5XBsrtdZq8lHo7N67nHp50+uPGvOK0cm9j4wsYaW0Ie2+2GiYS+qF28rTY0WqZWHgOX/KU6hIahz5vHHDPTlGvbM96N1R5e9qoohPfg1V7gPqBskv8TjojxQeWxR2vPByrnsVyjbUuKeOt5LbtMYbQpoowxAv0500LEk5UMLvxwy0m32CRRrHMUZJlxTC9vlKbBt9QsQTES0eRzRRyjknAp3pIq1b+KtoHNzDszHtgxNu5R36h0o0OyLgVvCSvSH49nHrkxXKhJLlEK/HlPSevZpPoVBIKo0Wd6n0a4/nDwhrPlmos32TIotfoBB+eoQvbfWzEsAK8K8+D55mSo1W44t7HMk4K3LGcQOuylpYuOkC2eHfm4sfRKLtaNkbHhwOFFNSeanxnsv/7l8dWaHQH0fT/7BlggiZM4F7Tb10HZ2FFIvGbwDd15Nnbp5xTLNCyY/F0btmgew6bdQCHxPFEbf1z98ysFfdNT/KQYvVEyagNwGhzuPVhoTuBpdaWCCaKPEnSFjC48NKDqxAX8yvKmQ/em2TGbP4/ql3EMZNMUJtRVCuwcoSS1Rbfv77i0hBAMEyazW1MMXvbtRYNClDFKThrpM80yKEceqQvUFO1Ju04a3cprYjoHFq1AeZUJSWWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(33964004)(53546011)(6506007)(83380400001)(8936002)(8676002)(26005)(6486002)(31686004)(2616005)(66574015)(6512007)(478600001)(38100700002)(6636002)(316002)(37006003)(66556008)(66946007)(66476007)(31696002)(41300700001)(86362001)(36756003)(5660300002)(82960400001)(4326008)(6862004)(2906002)(15650500001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3QvazBoYkVLK3BhdnVKVDNvNDhEaHp1RUxHTzZBVUdUNG9wU2ZBR1NZdXRp?=
 =?utf-8?B?ZFVpU2dGZUxiV09Qbmllc3Q4T2h4dUlLZVVXRWVmYVJUNmVvRW4zSU5Wd05n?=
 =?utf-8?B?M29BY2k0ZmhjSy82YS9ncHlUUSs2YVh5TlRVS2k3dnI0Y1BJYktYR1BZU1NM?=
 =?utf-8?B?bjRRamkyaFppd0V5RWhwclliTFNZNG1GdzhhY21Lam1ndXpteTFoNFVMQ3VP?=
 =?utf-8?B?QVhrV0o5UW5MMnFqeHBwVEhFYXl0K0ZIMnNWNklHMTM4QnBtOHltdWNlM3J1?=
 =?utf-8?B?Ti9oTnNqZlErQWFHSER6Ky9LMnBTcjQvY0xkQldyMGN2ejVhYW85TU9JTXZo?=
 =?utf-8?B?bE9CM0tmaWZTYSs1NEMwZnplU1NYdG9tSVJDa21EQWNjQVczajVNbkF1MytZ?=
 =?utf-8?B?bU9ZZlRwZUkwdFp6TkhmTmZTNk43MGw4bjRaTTVkcHBTNnpCbkJrSGxrTGpZ?=
 =?utf-8?B?MVdUdnlUTlZXZnFMQXRTSGVaLzhxZWpoV1hEZUlDb0pCdFFFY0RHMjZZdzVY?=
 =?utf-8?B?WFhGL0FKbGY4S3pMM1JDeVF1d0crbk45cTA3V2tmY3lnSCtiU0JpZXJid0tU?=
 =?utf-8?B?OW5UMXBTZHhxb0sxT3loR3FmOEVOWEdIQWgrdmd1ZnF1SGpsMFhhc3RBdHRE?=
 =?utf-8?B?VmdrK0xWMmZaanovOTNtOU01UVJqQ1VsM2hzQUtzVUhYaEtZaEJMa2dUQmY1?=
 =?utf-8?B?blNKait3SGNrMERBL0ZVaEt4VnJ6SVhTbUV2b2Nycno4bU1pM01qek8va1RV?=
 =?utf-8?B?Tm1CRVNiNFNVN0lFMXhtSzJPM0lqT0ZwRVdBL1h1UVJOTDdSOXFGUDl6N1B4?=
 =?utf-8?B?V0IxbE9sTXhDbUZaWTFRMzg4dmJNamk0UXhCcFdxUEZCeWNwcXpmR0xyekY5?=
 =?utf-8?B?M2Y5UE5vS3BXbXo5RXBkUkhrai9PU0ZsVTBmM1lnWlpEdGlvakJwOXl6N1Bu?=
 =?utf-8?B?Vk5VOERPaEtDclpxOUNJczhmTlAxaTFpOFlNQjd1RlFnNUFlR3VQY0VwQ3g1?=
 =?utf-8?B?bXllUmxRWWZEcTRlVWs0cEsyZlk2QnNZWWZtcVJWQjB3WE1ZeElhTnM2b0Iv?=
 =?utf-8?B?bEVMNHRhWU5kSHNuSmd4QzJSTmNwYlA1bGczZ0lIcFZqendpTU80clVEVmtC?=
 =?utf-8?B?clZ2MWlzTDMyaHF3dVQ0ZHZmcVdQck84TTcwL3kzaEJKdFZOTjFob0ZPY3hh?=
 =?utf-8?B?NUsyajRVdGlKNVRVaUxoMFVTZVdFOUJQTnhNb3IvQlVKVjVTSlZaK2dudGhH?=
 =?utf-8?B?VXFnZWkzeXZBNHcxWnM4MlNIb0J2ZTNBTGtpcEpXenFZMVJtNUdqZ3lFb05D?=
 =?utf-8?B?b1NBbGltV2FWSFRrVHEwNlVPRWRWRmxVQm1JekllcWtST1dVWDNYaFdKQ1BG?=
 =?utf-8?B?VWpVVDBBTkljdFJoT3BsL2ZSbHB0Zi9oUGhKM2V3RmlLSnhReWpWbWh4bFNL?=
 =?utf-8?B?YmFodllqdTdGa2F4TmxmL3BkS1FrRWw5RUdHRkpiQnUxSDR2T0JHOHpVYjBT?=
 =?utf-8?B?M3oxbWhKdnJPSWpNb1Njc3BHZ29ZazRpODlnalFGVEdLUTRnaXArL3VlQ3NG?=
 =?utf-8?B?TUczcG8ybGR5bmlnbDFVSUNRU1FxdHpuejRveWZpYWswQkhJb3lYSnkrOTJK?=
 =?utf-8?B?WWRPVGs0QTNqODVaRjd6QzhGY25pQWJTYTlmUE1oakwrZ3h5b3NkNEtvc3dK?=
 =?utf-8?B?Sm9jLytQdkdRSHhLcHVuV3RZTk1Yb0Y1L0VqbUt5MC9POXJMSW41Y0ZHL2FX?=
 =?utf-8?B?Z1hkNUJUNkphdGEvUGxBSFFHenNyRW9EUDFYSjJ1MHVzcXZDbnFBYWVvUEZt?=
 =?utf-8?B?ZTZwb0Q4MlAxK2prVzBsQStxWmpUK3hvQk5JU3pTYk1uWjhSWHBaZlZvVFVn?=
 =?utf-8?B?ZWFVYVpVRzJLcWgrcGU4L0tVcDZmNkxsQ01VODBHeitja3hUZXFlaDRRZW40?=
 =?utf-8?B?ZC84eDhqTGd0aHhhU2UwOWh0NnlUZDN4bU1Qc1VkSlV0SGc5R1BlTmxURFF2?=
 =?utf-8?B?Wk9lUkdmTkp2dkRDck04d21haTNUUTRibm9kcmFZWmJtTEdFTUZKV2lkdWlj?=
 =?utf-8?B?M0pyNW8vWWdtakxIak1TVDZIaVlMVFVOQWdOV0diTE5ySGJXVFhRRVNQWXYx?=
 =?utf-8?B?Ukp6SW41SE9nbXFld1FYNzNFTGJMbXJVWDN1U2dTOVdaQTVQR1RESUxpK0tr?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd93b8a9-d1ea-4cb2-3dc2-08dbf7a25187
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 04:01:13.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Karywki/rE0JhLiANaJBnvz/uSPCv2N2GrxsM9+pb0z0TA5pA2UFGNRTmFr1DYxbB4JMJZCeKfxjCBZM3tw6nKc9QRT3sT8ibtS6iFsihZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5347
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--------------Z7Z3reFEsJUfIuYdzOaBnpzy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-12-2023 04:52, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:20AM +0530, Himal Prasad Ghimiray wrote:
>> - The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data expects
>> size in pages of main memory for which CCS data should be copied.
>> - The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
>> shifted one bit higher in the instruction.
>>
>> v2:
>>   - Fix the num_pages for ccs size calculation.
>>   - Address nits (Thomas)
>>
>> Reviewed-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>>   drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
>>   2 files changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> index 1f9c32e694c6..6ff6c7aaa648 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> @@ -13,6 +13,7 @@
>>   #define   DST_ACCESS_TYPE_SHIFT		20
>>   #define   CCS_SIZE_MASK			0x3FF
>>   #define   CCS_SIZE_SHIFT		8
>> +#define   XE2_CCS_SIZE_SHIFT		9
> It would be preferred if we just removed the shifts and used
> FIELD_PREP() to put values into proper field masks instead.
>
>>   #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>>   #define   NUM_CCS_BYTES_PER_BLOCK	256
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index e8b567708ac0..7ef068451b59 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -526,21 +526,30 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 *cs = bb->cs + bb->len;
>>   	u32 num_ccs_blks;
>> +	u32 num_pages;
>> +	u32 ccs_copy_size;
>>   	u32 mocs;
>>   
>> -	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>> -				    NUM_CCS_BYTES_PER_BLOCK);
>> -	xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
>> +	if (GRAPHICS_VERx100(xe) >= 2000) {
>> +		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> +		xe_gt_assert(gt, num_pages <= 1024);
> Rather than using a magic number here, FIELD_FIT() might be better.  We
> can do the same for the other branch as well and get rid of
> NUM_CCS_BLKS_PER_XFER too.

Sure. Using FIELD_FIT is much better. Will update in next version.

BR

Himal

>
> Matt
>
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 2000)
>> +		ccs_copy_size = ((num_pages - 1) & CCS_SIZE_MASK) << XE2_CCS_SIZE_SHIFT;
>>   		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt->mocs.uc_index);
>> -	else
>> +
>> +	} else {
>> +		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
>> +					    NUM_CCS_BYTES_PER_BLOCK);
>> +		xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
>> +
>> +		ccs_copy_size = ((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
>>   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>> +	}
>>   
>>   	*cs++ = XY_CTRL_SURF_COPY_BLT |
>>   		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
>>   		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
>> -		((num_ccs_blks - 1) & CCS_SIZE_MASK) << CCS_SIZE_SHIFT;
>> +		ccs_copy_size;
>>   	*cs++ = lower_32_bits(src_ofs);
>>   	*cs++ = upper_32_bits(src_ofs) | mocs;
>>   	*cs++ = lower_32_bits(dst_ofs);
>> -- 
>> 2.25.1
>>
--------------Z7Z3reFEsJUfIuYdzOaBnpzy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-12-2023 04:52, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231206232242.GR1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Dec 06, 2023 at 10:01:20AM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">- The XY_CTRL_SURF_COPY_BLT instruction operationg on ccs data expects
size in pages of main memory for which CCS data should be copied.
- The bitfield representing copy size in XY_CTRL_SURF_COPY_BLT has
shifted one bit higher in the instruction.

v2:
 - Fix the num_pages for ccs size calculation.
 - Address nits (Thomas)

Reviewed-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_migrate.c           | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 1f9c32e694c6..6ff6c7aaa648 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -13,6 +13,7 @@
 #define   DST_ACCESS_TYPE_SHIFT		20
 #define   CCS_SIZE_MASK			0x3FF
 #define   CCS_SIZE_SHIFT		8
+#define   XE2_CCS_SIZE_SHIFT		9
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It would be preferred if we just removed the shifts and used
FIELD_PREP() to put values into proper field masks instead.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e8b567708ac0..7ef068451b59 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -526,21 +526,30 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 *cs = bb-&gt;cs + bb-&gt;len;
 	u32 num_ccs_blks;
+	u32 num_pages;
+	u32 ccs_copy_size;
 	u32 mocs;
 
-	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
-				    NUM_CCS_BYTES_PER_BLOCK);
-	xe_gt_assert(gt, num_ccs_blks &lt;= NUM_CCS_BLKS_PER_XFER);
+	if (GRAPHICS_VERx100(xe) &gt;= 2000) {
+		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+		xe_gt_assert(gt, num_pages &lt;= 1024);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Rather than using a magic number here, FIELD_FIT() might be better.  We
can do the same for the other branch as well and get rid of
NUM_CCS_BLKS_PER_XFER too.
</pre>
    </blockquote>
    <p>Sure. Using <span style="white-space: pre-wrap">FIELD_FIT</span>
      is much better. Will update in next version.</p>
    <p>BR</p>
    <p>Himal<br>
    </p>
    <blockquote type="cite" cite="mid:20231206232242.GR1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
-	if (GRAPHICS_VERx100(xe) &gt;= 2000)
+		ccs_copy_size = ((num_pages - 1) &amp; CCS_SIZE_MASK) &lt;&lt; XE2_CCS_SIZE_SHIFT;
 		mocs = FIELD_PREP(XE2_XY_CTRL_SURF_MOCS_INDEX_MASK, gt-&gt;mocs.uc_index);
-	else
+
+	} else {
+		num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
+					    NUM_CCS_BYTES_PER_BLOCK);
+		xe_gt_assert(gt, num_ccs_blks &lt;= NUM_CCS_BLKS_PER_XFER);
+
+		ccs_copy_size = ((num_ccs_blks - 1) &amp; CCS_SIZE_MASK) &lt;&lt; CCS_SIZE_SHIFT;
 		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt-&gt;mocs.uc_index);
+	}
 
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) &lt;&lt; SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) &lt;&lt; DST_ACCESS_TYPE_SHIFT |
-		((num_ccs_blks - 1) &amp; CCS_SIZE_MASK) &lt;&lt; CCS_SIZE_SHIFT;
+		ccs_copy_size;
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs) | mocs;
 	*cs++ = lower_32_bits(dst_ofs);
-- 
2.25.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------Z7Z3reFEsJUfIuYdzOaBnpzy--
