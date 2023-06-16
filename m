Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B381BEB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 11:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4E10E5F8;
	Fri, 16 Jun 2023 11:49:19 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5747010E5F8
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686916157; x=1718452157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mmx4LwT7o8kuxuCB0m7I5c05Vo3q6lAztlSLRkC0FXs=;
 b=dk4ooFNjl56iVBhjQuqT5x1Z0j8/IUSyqeI0QsuanUzyuHEYYs1UUstI
 /XfB12EFTGvjANh0wpxm3IOYGVR9NDHxX9YA4AaKAxTNVRbkI1/RcQ5MU
 Hx3UMzlAPPxVK5MBwpywxFWWywzz1+CcDbhNjsNUQkeLKiIsePCasxOLA
 J0dCpC/TBJSj1oPr1T48ITpZFdMgbgp0xOl8Ty6JT28z5vCDByLitHIHT
 5FjA/H11dnbIqJMWDJj69xOaoJQR3J65m5ELhKpei9Ba7F01jeDblD6zt
 26/BhM0xOmnqrV8qWXkboNS5aZP+q1Z8xwzLpgiSzhlW/eCQT27rkz5Uh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339525954"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="339525954"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 04:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="887089617"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="887089617"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 16 Jun 2023 04:49:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 04:49:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 04:49:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 04:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgMrhQB1z0uoXFsEvAHBwGs9BZsCxc8vYKNnKzbKV0OutwvL/gZH7TD6b9VWpJiL2ZFcAL2t4Vp8EEDbnZYx3aegkX7xT7tvWCS6E+M3954t6cnfgAegfq7RTiLeXQyZpTta73FLuUPUU8yXpYXgQhzeHIObfzrf5F0w1+ssU7WmWvsAMI577Ga4bgWOiUgyrX7tTQUPEgo61VGmfcz8aMHE1hHL185L0RQpcepkWjo0epRDb5GVK/EaMkMKzsWshAjhXSzqpydxUZ0OtLZofVL5ZsWFTyQVtyuNppq9Cmm2kPwQSzXqJJkUslGRX9N5QvDfa6SDBeKaru0RaNdt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0t8PApVwuoFNripIjYobONo89AZK7S1OuRx/Tncg3U=;
 b=OXQchgy7EnDq/Wa2ZmlywMcNbZ6bsXrBWq7DZYA8X0+elC4Sx3SytYpS7AFTGqOMUnfO+WbgkM5zeWvU1YGGYHAde7st7eYiYBdyxULwV+lkn1hhmlRnUZotBqSF0gzmi1n9JN6lhlaVdDDlD+ZowQSCiwLpLm5y+qSbu397IVBphHlLQUcmLjsYolML2b153huORIsgSrSnW+QC+8s/Ydf2j4ZIF4O2gDoA4ngFQlJTRfwMmWTNBWBiRl3FH3/U93BR63tKmX58xpGLU3QQc1AzjwbnxpIM0Q+jL/8vAhtjS7+lv2j1vDOI/lwhYyNcPpuGsjCVsa1xDob8DhVUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 11:49:08 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6500.026; Fri, 16 Jun 2023
 11:49:07 +0000
Message-ID: <47086e43-dd9f-3299-cfdf-eeeb923b1ad9@intel.com>
Date: Fri, 16 Jun 2023 17:18:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20230616092521.3862926-1-riana.tauro@intel.com>
 <20230616092521.3862926-3-riana.tauro@intel.com>
 <CY5PR11MB6211493B04135E0E8E63AE579558A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211493B04135E0E8E63AE579558A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 3833f619-4534-4f9f-442c-08db6e5fb0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQI55MeKZl2nsKm4B18NHGQLCRtofefzp2Qfju4q+NNuoBxdpV9p5SwCglLL9XgkpY//cOz+oSBjRGhk0oHIbB1n7ShrcBkCE+WY3mUS4ujOFI3nLcq5pLyuljmq1qqN9xZUFi3AXHVIPI85IALgcncl1KqUKjhtorjL9LcVcETMX0SkQVr+/FB8/AvP2Lk/ADRkHIMmScAo5WbWS3CowsxCqDXubuvLySC1S5CMJ9LrUGquEj7d5eSs7LzDol+EvA34kpAhl0a1KZaVq4QH4Km7P451NIGHTKWZ3doE/tqx6CTS2256vSJSwjUi6Ajvv8a4V4qWxffOMzJKtsc6xalhwOpWiFPnKw4JQRDCuL6ES69rE+U5QJncreh/Wepe0nGwbYUr3mWvMKfgG0sSgMm+7cp8pn2iHPR3EYCpghLlwHf9lBHSihyWVp0RZ7XOkmxnBbil72m0HgG+wiGwgo6bMWf6jjFhCw7X2j+ZS4kPTt2ZtBMKig4p9VBX7QyOxI+w342F5d0oataPmxqBxFucANNdKKGR0to8ZjYE5ok6deQi5qBHqaptHBVf9QHUBnHXRjAM/pdB4UctOhr8DeIhnW2NOl9UhEFBxnt09K6ycjYxzc9n5atSwtrAmPgfAqe0vXKkwNnirBwcFGsSlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(6486002)(5660300002)(66556008)(66476007)(66946007)(6666004)(8936002)(4326008)(83380400001)(316002)(31686004)(82960400001)(8676002)(41300700001)(36756003)(6506007)(6512007)(186003)(26005)(2616005)(38100700002)(2906002)(53546011)(478600001)(54906003)(31696002)(86362001)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJKK2x1NUJ4NUFDYnp3alpHd0tqdzRvKzFqL3JSK3h6MFFZcW1uUlpITTVZ?=
 =?utf-8?B?dmNEQStlbjBSaENUTUdDTFZzS0JiYzBZemx6RHphdGxiRWVuWllramFNdW1K?=
 =?utf-8?B?TVNsNXVoT09XRFNBRFhXT1lpVDlMRlBSN21LVTBwSnlkaS8zbUtIZE5rZE5V?=
 =?utf-8?B?aEJ0Tmp3ZW93bE5oOHNCVC9IRXdUaTdMQ0FicWtSS3VzN0hoNUhrRngxd0s2?=
 =?utf-8?B?L0Zya09zbmxlQnpDRVlJdG1YRllXc1ZBcXFlM3phNkR5NTlLNjF6V0kvN0pt?=
 =?utf-8?B?eUtQL3M5VlNmeHZWOGlRblF5WU1ISVVMV1RoU0pDZ3JoNmtxbE0zZTU3K295?=
 =?utf-8?B?Y08xa0xCdGZuNmNFa05tOTJjODJFZE11RCtSSWdwRlM5c1Y5OCtSejZjWStx?=
 =?utf-8?B?a21ZcUNxMEJmYml5bkcyZlJ4RU83VW9QODBLclpBd2NVWXVxUUVWTkRYZ2Jv?=
 =?utf-8?B?NzVUUVRNZE5KQVA4MGxZV0twdzlxRVZVME5EODE1cGxjZHp1Nm14R2VIemxn?=
 =?utf-8?B?dlVmb0tUMnZ4d0NZd2ZoTW1nU3NMMXdsUFVQMGdzV1RqZmNrR01UYzE1OGxz?=
 =?utf-8?B?aHRMMDE1OEpCcWRUZmxKZFNvOWRPNlJRV2JZbWI5Z1AyM1BkQmh0YnFXMlJa?=
 =?utf-8?B?ZlJjcktuYTUraks2elBmSG5JWWNOQno0TXF0Y3R2MXkrbXFwNmNSVWxTUXln?=
 =?utf-8?B?MHF1ekhLSDNFTGFYTEQ5aStBQURMNGdzckNRR2JnT3htWldCTEZ0ZmluZE5B?=
 =?utf-8?B?YnFETHJLZHpNTjFQYkhkZDhZQUVzTHVBTmtuemFhOGRwa0dEVWhveTZuQ3Jq?=
 =?utf-8?B?WkVYaUt6QU5VM1pycDBwb3h0L2phVE1WZDNMNCsrREdMUHJwbVJzeGVQTTBo?=
 =?utf-8?B?Qjhvc0ZOaG1ydXFjOE54c0gvWEJUZ0FoUWdVcE1leWZVVjBjRCtCVkFhV1U0?=
 =?utf-8?B?QmQwNTQyWGovMW4zUXNwN0J2QVFhYjZLcXVVM3FSUDlVQlQvUWxaRUlpSE05?=
 =?utf-8?B?QzZFSFpjZ2ZxUDBoMnh3TmkzZlFhYmpUWFNsOGhjWTJwa0lpckhNT2ErTzIw?=
 =?utf-8?B?NDdIVGE4dkZNak45WUVoQTh3QkcvbXhKMk8wNmRwUFlPaC83SlRhbzBzRVQ5?=
 =?utf-8?B?NnR3Z3ZNTzZ0K1IzbytZVVlIeCtlVFoxeStkWVlpbEZ6YXB1dkh4eTdTVXZj?=
 =?utf-8?B?bHEzYkVOanlmQWJ3V3FlaEFNSmgrT2VHbnY1RGQwQjVzbVJCT28zUXFvemZT?=
 =?utf-8?B?K3RyUytoRlltWENYSzRuWE5ldjFJQTR5WjhUSGdsNzcwRkxlRjQrcS9BL2lZ?=
 =?utf-8?B?UFBvc2M1L1BZN2ZuWE1helpzMjNLNXZjSG9HVHdSaDFLbnZXSTNzMTdRUS9z?=
 =?utf-8?B?aWJNR0N5UzNoU0J4ak9PdlMwRkNkWFJiTVdIZFpnN3I5NC8vYlA5My8zSktv?=
 =?utf-8?B?ZUg2eEVaN1VzR0ErSzk0bUFDV3NoK1JaL0ZKdWFwUGYvcTZWdGFMMnkrN1kz?=
 =?utf-8?B?THdyOWZlZDEya0NaNXM4cWF1bHkyd2N4bzN5azQ3Y1NoY09rSmdFRkNSL3F4?=
 =?utf-8?B?RXJUdTcyRUU2SHZvL0FpUDRNSkJPN3NKZjBWbllCemtScjdFWWFvMEdWQlVi?=
 =?utf-8?B?dmIvTk1va1ozMFdjdkJjSlBZN1BNYXIvU2gyNU0xMytySmpNSWVDeVA5aGEw?=
 =?utf-8?B?YVFLRmlDczlrUFJEVXVyQTNoZXpsdVlyd3UydWhCNWFzUGpiSjNhOXdyNm0r?=
 =?utf-8?B?N29RUEVIdk9MSFZxZXlSUmFTUTZVT3NUTHAvOGsvem1sN1AwL0xWT3Z2VGs3?=
 =?utf-8?B?eEpLUjc5eWJtcWVEdXZma01ROEMvTTRTZFExSUxCem51YWw4NE03c29kd0gv?=
 =?utf-8?B?UDVCaGxsUHR4djBGSW1uR2ZJREFsbklZbk0vQUcwWkQ0NWtFSmZIZ2FiZHJy?=
 =?utf-8?B?R0hwTlhELy84N1NCM0UzQklka00vRFlqU3ZvTHN6MHUyRW0wcmxqQUUxZGZJ?=
 =?utf-8?B?WXpiSnRQSnBRQXYwS1QySnhlR29iZ0p5MGZBZWFIaEMvVHdPV1RMZDAvUWdZ?=
 =?utf-8?B?MHJjckRraHVZdXNKdTczcmhvYVJFWmJzNG9qNUo3NC9QLzBVZ1M4ZGIwbmhP?=
 =?utf-8?B?b3dJM2M3bytkeUovaGdtUTh4U0YwSldrT0tabFk1SkUvWVkvdXJEYjh5S0Zv?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3833f619-4534-4f9f-442c-08db6e5fb0eb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 11:49:07.6497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuy9YLPY4OjiOU4/LPDccTU1YnzyNdxFEHfvFQDXZwNqgLlp2qqhQs1v0ZYY7iwVwWQfFe3zn+B1xi27Kd/PqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman,

On 16-06-2023 16:28, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Friday, June 16, 2023 2:55 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> andi.shyti@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>;
>> joonas.lahtinen@linux.intel.com
>> Subject: [PATCH v2 2/2] drm/xe/mtl: Add support to get C6 residency/status
>> of MTL
>>
>> From: Badal Nilawar <badal.nilawar@intel.com>
>>
>> Add the registers to get C6 residency of MTL SAMedia and
>> C6 status of MTL gts
>>
>> v2:
>>     - move register definitions to regs header (Anshuman)
>>     - correct reg definition for mtl rc status
>>     - make idle_status function common (Badal)
>>
>> Bspec: 66300
> Please remove this space.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 11 +++++--
>> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 15 +++++++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c        | 42 ++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_guc_pc.h        |  3 +-
>>   4 files changed, 54 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3f664011eaea..d654f3311351 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -16,6 +16,11 @@
>>   #define MEDIA_GT_GSI_OFFSET				0x380000
>>   #define MEDIA_GT_GSI_LENGTH				0x40000
>>
>> +/* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
>> +#define MTL_MIRROR_TARGET_WP1
>> 	XE_REG(0xc60)
>> +#define   MTL_CAGF_MASK
>> 	REG_GENMASK(8, 0)
>> +#define   MTL_CC_MASK
>> 	REG_GENMASK(12, 9)
>> +
>>   /* RPM unit config (Gen8+) */
>>   #define RPM_CONFIG0
>> 	XE_REG(0xd00)
>>   #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
>> 	REG_GENMASK(5, 3)
>> @@ -349,10 +354,12 @@
>>   #define   FORCEWAKE_USER			BIT(1)
>>   #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>>
>> +#define MTL_MEDIA_MC6				XE_REG(0x138048)
>> +
>>   #define GT_CORE_STATUS				XE_REG(0x138060)
>>   #define   RCN_MASK				REG_GENMASK(2, 0)
>> -#define   GT_RC0				0
>> -#define   GT_RC6				3
>> +#define   GT_C0					0
>> +#define   GT_C6					3
>>
>>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>>   #define GT_GFX_RC6				XE_REG(0x138108)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> index ec77349dea76..1a1016ff3735 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> @@ -142,11 +142,18 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle
>> *gtidle)
>>   		return;
>>   	}
>>
>> -	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> -	/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +	if (xe->info.platform == XE_METEORLAKE &&
>> +	    gt->info.type == XE_GT_TYPE_MEDIA) {
> Hi Badal,
> Do we need MTL specific check here, gt->info.type is not sufficient?
> that will scale this condition  for future platform as well.
Yes, gt->info.type is sufficient here.
>> +		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
>> +		gtidle->idle_residency = xe_guc_pc_mc6_residency;
>> +	} else {
>> +		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +		gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +	}
>> +
> /snip
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>> -	u32 reg;
>> +	u32 reg, gt_c_state;
>>
>>   	xe_device_mem_access_get(gt_to_xe(gt));
>> -	reg = xe_mmio_read32(gt, GT_CORE_STATUS);
>> +
>> +	if (gt_to_xe(gt)->info.platform == XE_METEORLAKE) {
> Similarly can't we check gt->info.type here in order to scale this condition for future
> platform ?
In MTL this reg is applicable for both gts so platform check is needed. 
  Here we can :%s/((gt_to_xe(gt)->info.platform == 
XE_METEORLAKE))/(GRAPHICS_VERx100(xe) >= 1270) .

Regards,
Badal
> Br,
> Anshuman Gupta.
>> +		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>> +		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
>> +	} else {
>> +		reg = xe_mmio_read32(gt, GT_CORE_STATUS);
>> +		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
>> +	}
>> +
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>
>> -	switch (REG_FIELD_GET(RCN_MASK, reg)) {
>> -	case GT_RC6:
>> +	switch (gt_c_state) {
>> +	case GT_C6:
>>   		return GT_IDLE_C6;
>> -	case GT_RC0:
>> +	case GT_C0:
>>   		return GT_IDLE_C0;
>>   	default:
>>   		return GT_IDLE_UNKNOWN;
>> @@ -607,6 +612,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc
>> *pc)
>>   	return reg;
>>   }
>>
>> +/**
>> + * xe_guc_pc_mc6_residency - mc6 residency counter
>> + * @pc: Xe_GuC_PC instance
>> + */
>> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc) {
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u64 reg;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>> +
>> +	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return reg;
>> +}
>> +
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>>   	&dev_attr_freq_cur.attr,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> b/drivers/gpu/drm/xe/xe_guc_pc.h index 976179dbc9a8..370353a40a17
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -12,6 +12,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);  int
>> xe_guc_pc_start(struct xe_guc_pc *pc);  int xe_guc_pc_stop(struct
>> xe_guc_pc *pc);
>>
>> -enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>> +enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   #endif /* _XE_GUC_PC_H_ */
>> --
>> 2.40.0
> 
