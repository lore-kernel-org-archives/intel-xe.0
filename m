Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89056CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 12:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220B21126BE;
	Wed,  3 Apr 2024 12:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+MCksjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8051126BB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712148755; x=1743684755;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZT98x9dvAwo9Vq6bzQVFXOmoAozLVnPwzVdIpPyOBio=;
 b=R+MCksjtESEcYXEHYWwiN97w9ppmhl2j3vRXeVlv2VwxNFchwhFTKjyB
 bpxYBW4YubLb30FhAaD5yCQInySSOOh+WWo05eBeLHAMqVbT4EQnrY21D
 1GkUqdRzVOa88nduz3YhZHMF9klP42POs7dSCfNhYgSgnkezYS1vYmlpn
 hnSdBDn1vZuqfVq+LenGcjX9+cZpNbQpaeXPfJtr+CPzVlOqAtKiN/JwM
 l9xBN+0MC194rRz9ggblE620Q39MK5fnei/+ri0xGMfiIBafBYVv3BSb5
 2OlEUO51O3iyWLMUhSEBB/D4g+pATQeP/HoMuTiyl/yN7c+Ru7A7MUCrW g==;
X-CSE-ConnectionGUID: /zc45tFBRKiF4jsWGAs/+A==
X-CSE-MsgGUID: rhePVkjyQZGCIgDCsq0vQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="24877179"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="24877179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:52:35 -0700
X-CSE-ConnectionGUID: 4pEKL355Toe8YmXQSVz5hw==
X-CSE-MsgGUID: AuofYND1ROiSz31HoEjAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="22900641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 05:52:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 05:52:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 05:52:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 05:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw5BNqtQm9IXh2YKcm0AAUcKA7alvjjTb0dYiSmpU6EJWFbEePc1BRI5cF4XBKxMl6C9ipMc+e4janmIwwqqg10/0yyysGkKazb5cGS+gWsh2JTli45Es6kO1VkQeaz7mtPShpi9s5J25GAh70Wdyd7Dj6srVl9qdnI2tzJL9bMHTGOIYX0UPpUXAFw11GvV6WKUQo+gjgEhhvnnGkz8LPJjPaWLaX+g0JFLRvtmrWUAg5ZXJsk9c+npzv8EFe+0Tm3Mt4RdK1HjzzVXqo04mC/O6jZsMZokadkGYcjJ2Cy0eCLPNlZMD2T8Ur0UZCGvHM1wZzU5zw8CWTVMzMFhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SEuzYRWDmFfhRync0Yq3CSiiCYEopBCz9vhrnuUduk=;
 b=hADcElzftMjCl9SNf0oZ+iDKACGSAwV4oaDK3XaaagRFztVg1NeGyHI4o56GjcmAz6MQQmnXZC60YX/Wksr1jS9P1yNG61SUVvOKSA0NH+G6grbZb49LNsNgYjnEp6vpwh0snZxFF96liCqnV6PCJI5f47v1NJ74cEcIwfHKK64xPBh8w1dWPaRGvGbxnSwohoVg7ZfHnVrksKsjkSF5Yxls3frHMkfvZcmp8pKr3qyTaC0jjadNNX0Y5/iQaJufFY9m3y/BAXYQcnJhQ5dgprezSreuUclzAizkYNXndU0dMmuY1n0NQbvx3rOc4IVK24SRh8y+KoeHB6toihdEzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 12:52:31 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 12:52:31 +0000
Message-ID: <a1895347-354d-43f5-8160-90d59ec7c597@intel.com>
Date: Wed, 3 Apr 2024 18:22:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Update xe hwmon with couple of fixes
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20240402180956.508398-1-karthik.poosa@intel.com>
 <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SJ1PR11MB6106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIROiFat8JmaR/P0Qg4f2FbRy0oz7Ng0LX+mg2ujjOkoTFCTLgFS+j7ARRgafjCKbwMDAJc0r41hKIjPQrhYiqGW4Kn78grEjxyExqjG7/b6wiwkxjbgzHAsOr8+6TgAphG5EF4wZSYcgg77YWspO0Wg/gErK0BQFn7X0wJfnlOjClpH8WPVUqFEMJxUqZR8v1XVCQXqt6QcHDTSWTWu790b/DqcGWF62O1bIb1Ayu2qSOsMokSzygK0v/+BscGM6kkPqoGeSgbyHqK5YHk08ExJs/5uDoSH7iBqffeUrzR7dyF6huI6kIcw2uVzLyS6/mYwgWj07tOPxpbn9LOINSIBPG8ZHmePgE4xvcsIdIHNyUACpX5w9WcPpWxwlWVN1su1A55Rb2dBxDf/H+E7MYKWBHwWpqJ6qna3PhG+hQVkRMgaE7I/tCaBKyOZdUGb0hnroZqePAp7W3bhzhENmNpM/TxJqytWsabuE6RNvq5aJ0sADzsUPhys5MChv4aXvAua3eO5s7rWFb8pZgbByPv1ta3G0oZINudciKGG6+vRvPUTcnvsCfn0cX79iu7cMXiSOKCAO1RwDUO1Wx/4MJ9gTL8Ai6uEh9kGs/CQyWJLPzd11nZmaKJ76LexQvJH5dSTET9/AsSiaBFtMMOzqQcfGLmS6PDfg7tQMzDUXnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b216amNoRTk2R3c4VzM3VXRua3RaUWJkU084My9wZHNLV2N6bjNEeFMxV3NC?=
 =?utf-8?B?QTY3emEwVGdZbTVEUDlxY2lmNzQ0TFRHUHdTVDVLSXVOMlg2TmplSE1nZTN1?=
 =?utf-8?B?R3ZYZzNLOW1GbFBSb2g1TCtVYTFUbDFmb3dGdmUxTHltTkJCUkx1SWdKTHNp?=
 =?utf-8?B?bnF4eWowN1VzcDhwRlFUTzR2cnZ5WUxBWGthM1ZOTHlFMFhSSTlFcXNtWVI0?=
 =?utf-8?B?clZZdU5MU3Jsc0trUytqaVg1dW1VRkZWc2F4Tmh5QlVzNlkvVldpRnNlMkp4?=
 =?utf-8?B?djJyQXAwQjBNZlh1OW15S3llb1BuNnJFRU4yTXdZbG5GZCtoYWFCb0hYemZD?=
 =?utf-8?B?QjFiTWIvWlN5ejd4OUQycDd6VzQ4c1F0RjMyZXllU0pXL00wZE9NNmJRRkRB?=
 =?utf-8?B?OUtkd2tJbHBZOFc5R0YwdHBhQTRWS1RadFZ0aHhFczdOVjdreDR0Ull3Q21u?=
 =?utf-8?B?SUxRaTI0SmdPN3Y0dUo3WGlDMCt0eTBlVkdhcVdEcWk0OExFWlJseXZwcE9E?=
 =?utf-8?B?L2VQeXorV0VZVDlZQ1h2U1NKSlVnUUNzSDEvNHdhY0pSbFV5RFRXOW1oeTZK?=
 =?utf-8?B?QVU2aklST1pBa1RiY0ZyMGtXajNCMDVaMkhxQ2RWcVZhU1Y2NDdQeDdxS250?=
 =?utf-8?B?bDU4V0svY2ZzOHNYSndFYUwydllGTjZMb21SdGR0L2RZaG1pRGszM0t6cTZl?=
 =?utf-8?B?bURsaHNkRUptaFE1cGhxL0lKdmpZamlsSkk5SFJRMVgxNVZYYkt3N2w0eGNj?=
 =?utf-8?B?bS9RenhwdmlBZS91R1M2dWxuZFRVaytnNWVyVVpCQzl5VFc2dVgyVGIrWi9G?=
 =?utf-8?B?bXp1RENxK28zSUltbHRXSHl1dFkrL0dVTE5pdXdUUFpFRTNtV2ZjZW5nRzdw?=
 =?utf-8?B?dlNJeWZzZ1hDK3JDdldIdFA1cnFpNjZPdElOdExlWUN2WDF0bEJJMDR5UHVV?=
 =?utf-8?B?Z3RnNEx4VzJuQ0FtbWdEVjBUd1F5Y2QyZ29YSkNwZ3prYnJJdnVndXcxNVZC?=
 =?utf-8?B?SHpyU2ZJRmZKM0MyWFpsQXdIVUpocVRCKzhjbWxuQis4VCtIN01zeCtHVXZR?=
 =?utf-8?B?emJhTjRESlVLSnJtaGZSblFRZ3B2cm4rVXE1b1dxMm1wM2w5VmVka3MzUklu?=
 =?utf-8?B?M212bWxoN1ZEZ0F5c0E5MldmcE03cWZRWXhjZzlJRkxUUndHREJrbWUrcE5S?=
 =?utf-8?B?dTRtR294UlppaUwybWF6UWtDL0hXbUsxQlJ1YWtrUFBWckRTck50cG9mdWFT?=
 =?utf-8?B?ZDRxMW1VdW5VUXpUQWZqTlJhcVh2dGRXM09TZHdpMWdIMkpVOCtWU3h5RThJ?=
 =?utf-8?B?c2czcWFYcm1kQUkyZjVzR3o3b1paQW5HTUxXcUt5Y25POVBHQk9HVU9Rakpi?=
 =?utf-8?B?cFV6WEg1dHpJZ25leFg3WDVZNUR1ZTBWMUNsZXN0cWNCYkxUZk1MUWtoQ1F5?=
 =?utf-8?B?N2Rtd0dwT1ZZSlE2WHl0c254dFlrZUJGTm9oWmRLcERoVk95SzJ1UmFQL2Yv?=
 =?utf-8?B?ZGUrb3NDa1l2YmVtUDc1dFEvUXRNWmRJYWRJUEtLdjRYNTgxVWVFNjAvL2Vs?=
 =?utf-8?B?MnBXNnBjMXNaaXkvREI3ZzZkaXNTSk9kbHNlZ2NBL2xvT2NnRUpBUnphRUdX?=
 =?utf-8?B?WWNlaklLc21ncmFkU0kvMjhKaTBsS3VhajVUSWNIUGlqTWdYK212VmVyYmtL?=
 =?utf-8?B?UDl2QnlRZnVqRmVXMVlOMTBEMkRlbXl2RjY4RHE4ZXVHRlpNQVRRYTkwUS83?=
 =?utf-8?B?WXFtNGtYTVZ4U25wUGVSTUdqRitvQ2pnc1dHQUc5T3lXU2F4V3d6dUpWYUZW?=
 =?utf-8?B?bENoZzBwZWFwby83K3hNM0tTOUlIdkt1eXQxMU5oUHN0bHJzZlIwZkpaQ0pa?=
 =?utf-8?B?MlNZNWdMZ3Q2Tzk0anNYOXNzYWVMeTRBN1AyZFhhRTlCUGppNG0wRm84Qnlk?=
 =?utf-8?B?TUE3bFJieERrR0JzSkJIa3dlcEhOek9IRXc5eDF1eUF1ZVJKUGVhQ2gyYWtP?=
 =?utf-8?B?UmthemJZWk1BTDBTaTBrbmVsZ1VndU9Yb2k2YlRhbW9lRnVnc1JDUUlTblpC?=
 =?utf-8?B?ZjRiU0JYTTIzcit3S3VnUCtheERjb1kxU1Rjd25UOExtTXhWbmpsd0p3Tm51?=
 =?utf-8?Q?rH+pC5B4XCV/zzqSdQgF09uYT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d644f6-6c9f-4cba-cbd2-08dc53dcecb0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:52:31.3381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u//IvjETo01H2HjeX4DgLCKZlas7+U5u0xvFsNdy7JI97JGLBjaGqENtFPLTIU8ILINsy9PwCYxRcI3IO3OWcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
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


On 03-04-2024 00:48, Lucas De Marchi wrote:
> On Tue, Apr 02, 2024 at 11:39:56PM +0530, Karthik Poosa wrote:
>> Address potential overflows in result of multiplication of two lower
>> precision (u32) operands before widening it to higher precision (u64).
>>
>> Initialize variables which were being used uninitialized.
>>
>> v2:
>> - Rebase.
>> - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>>   With this change caller function need not initialize value to 0.
>>
>> v3:
>> - Update commit msg as per review comments (Rodrigo, Lucas).
>> - Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
>>   and output xe_reg. This is to have abstracted usage of xe_reg. (Lucas)
>>
>> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_hwmon.c | 60 ++++++++++++++++++++---------------
>> 1 file changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 7e8caac838e0..8c805ace592c 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -79,46 +79,48 @@ struct xe_hwmon {
>>     struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>> };
>>
>> -static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg, int channel)
>> +static bool xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> +                 int channel, struct xe_reg *reg)
>
> patch 1 could add xe_reg_is_valid(), just like we have for i915. This
> will create the missing abstraction
>
Should this be added in xe_regs.h or xe_hwmon.c ?
> patch 2 could change this function, but rather than returning bool,
> return struct xe_reg (yes, by value). The caller will then do a
> if (!xe_reg_is_valid(reg)) return. This will unbreak the abstraction.
>
There would be a call to xe_reg_is_valid() after every xe_hwmon_get_reg.

Can't this be as part of xe_hwmon_get_reg itself ?

>
>> {
>>     struct xe_device *xe = gt_to_xe(hwmon->gt);
>> -    struct xe_reg reg = XE_REG(0);
>> +
>> +    *reg = XE_REG(0);
>>
>>     switch (hwmon_reg) {
>>     case REG_PKG_RAPL_LIMIT:
>>         if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -            reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>> +            *reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>
> with the return by value above you can update all these with
> things like
>
>     if (...)
>         return PVC_GT0_PACKAGE_RAPL_LIMIT;
>     if (...)
>         return PCU_CR_PACKAGE_RAPL_LIMIT;
>
>
>>         else if ((xe->info.platform == XE_DG2) && (channel == 
>> CHANNEL_PKG))
>> -            reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>> +            *reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>>         break;
>>     case REG_PKG_POWER_SKU:
>>         if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -            reg = PVC_GT0_PACKAGE_POWER_SKU;
>> +            *reg = PVC_GT0_PACKAGE_POWER_SKU;
>>         else if ((xe->info.platform == XE_DG2) && (channel == 
>> CHANNEL_PKG))
>> -            reg = PCU_CR_PACKAGE_POWER_SKU;
>> +            *reg = PCU_CR_PACKAGE_POWER_SKU;
>>         break;
>>     case REG_PKG_POWER_SKU_UNIT:
>>         if (xe->info.platform == XE_PVC)
>> -            reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>> +            *reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>>         else if (xe->info.platform == XE_DG2)
>> -            reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>> +            *reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>>         break;
>>     case REG_GT_PERF_STATUS:
>>         if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>> -            reg = GT_PERF_STATUS;
>> +            *reg = GT_PERF_STATUS;
>>         break;
>>     case REG_PKG_ENERGY_STATUS:
>>         if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>> -            reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>> +            *reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>>         else if ((xe->info.platform == XE_DG2) && (channel == 
>> CHANNEL_PKG))
>> -            reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>> +            *reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>>         break;
>>     default:
>>         drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>> -        break;
>> +        return false;
>>     }
>>
>> -    return reg.raw;
>> +    return true;
>> }
>>
>> static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> @@ -127,10 +129,10 @@ static void xe_hwmon_process_reg(struct 
>> xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>> {
>>     struct xe_reg reg;
>>
>> -    reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>> -
>> -    if (!reg.raw)
>> +    if (!xe_hwmon_get_reg(hwmon, hwmon_reg, channel, &reg)) {
>> +        *value = 0;
>
> setting *value to 0 would be patch 3, with the commit message
> explaining why. Although the code seems weird returning void and setting
> the *value. Why not just return u64 with the value?
>
> The caller is passed an uninitialized value and hoping it's set by the
> callee rather than doing value = xe_hwmon_process_reg() and making sure
> the callee could possibly forget to set.
>
>>         return;
>> +    }
>>
>>     switch (operation) {
>>     case REG_READ32:
>> @@ -143,6 +145,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon 
>> *hwmon, enum xe_hwmon_reg hwmon
>>         *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>>         break;
>>     default:
>> +        *value = 0;
>>         drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg 
>> operation: %d\n",
>>              operation);
>>         break;
>> @@ -298,7 +301,7 @@ xe_hwmon_power_max_interval_show(struct device 
>> *dev, struct device_attribute *at
>>      * As y can be < 2, we compute tau4 = (4 | x) << y
>>      * and then add 2 when doing the final right shift to account for 
>> units
>>      */
>> -    tau4 = ((1 << x_w) | x) << y;
>> +    tau4 = (u64)((1 << x_w) | x) << y;
>>
>>     /* val in hwmon interface units (millisec) */
>>     out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>> @@ -339,7 +342,7 @@ xe_hwmon_power_max_interval_store(struct device 
>> *dev, struct device_attribute *a
>>     r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>>     x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>>     y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>> -    tau4 = ((1 << x_w) | x) << y;
>> +    tau4 = (u64)((1 << x_w) | x) << y;
>
> as said previously, these 2 hunks are another issue and should be in
> another patch.... make it patch 4
>
>
>
> Lucas De Marchi
>
>>     max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + 
>> x_w);
>>
>>     if (val > max_win)
>> @@ -397,10 +400,11 @@ static umode_t 
>> xe_hwmon_attributes_visible(struct kobject *kobj,
>>     struct device *dev = kobj_to_dev(kobj);
>>     struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>     int ret = 0;
>> +    struct xe_reg reg;
>>
>>     xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>>
>> -    ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? 
>> attr->mode : 0;
>> +    ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index, &reg) ? 
>> attr->mode : 0;
>>
>>     xe_pm_runtime_put(gt_to_xe(hwmon->gt));
>>
>> @@ -493,19 +497,20 @@ static umode_t
>> xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> {
>>     u32 uval;
>> +    struct xe_reg reg;
>>
>>     switch (attr) {
>>     case hwmon_power_max:
>> -        return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) 
>> ? 0664 : 0;
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel, 
>> &reg) ? 0664 : 0;
>>     case hwmon_power_rated_max:
>> -        return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 
>> 0444 : 0;
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel, 
>> &reg) ? 0444 : 0;
>>     case hwmon_power_crit:
>>         if (channel == CHANNEL_PKG)
>>             return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>>                 !(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>>         break;
>>     case hwmon_power_label:
>> -        return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 
>> channel) ? 0444 : 0;
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 
>> channel, &reg) ? 0444 : 0;
>>     default:
>>         return 0;
>>     }
>> @@ -585,10 +590,12 @@ xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long val)
>> static umode_t
>> xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> {
>> +    struct xe_reg reg;
>> +
>>     switch (attr) {
>>     case hwmon_in_input:
>>     case hwmon_in_label:
>> -        return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) 
>> ? 0444 : 0;
>> +        return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel, 
>> &reg) ? 0444 : 0;
>>     default:
>>         return 0;
>>     }
>> @@ -609,10 +616,12 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>> static umode_t
>> xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int 
>> channel)
>> {
>> +    struct xe_reg reg;
>> +
>>     switch (attr) {
>>     case hwmon_energy_input:
>>     case hwmon_energy_label:
>> -        return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, 
>> channel) ? 0444 : 0;
>> +        return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, 
>> channel, &reg) ? 0444 : 0;
>>     default:
>>         return 0;
>>     }
>> @@ -758,12 +767,13 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_device *xe)
>>     long energy;
>>     u64 val_sku_unit = 0;
>>     int channel;
>> +    struct xe_reg reg;
>>
>>     /*
>>      * The contents of register PKG_POWER_SKU_UNIT do not change,
>>      * so read it once and store the shift values.
>>      */
>> -    if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
>> +    if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0, &reg)) {
>>         xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>>                      REG_READ32, &val_sku_unit, 0, 0, 0);
>>         hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, 
>> val_sku_unit);
>> -- 
>> 2.25.1
>>
