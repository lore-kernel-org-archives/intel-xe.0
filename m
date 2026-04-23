Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1950CF99373
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE74010E404;
	Thu, 23 Apr 2026 11:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqwmUVIL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796E10E404
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776943000; x=1808479000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xrTnQ0xJFDKTQzh1XYNMdrd/3nP3QTdGkfmm2o/xYws=;
 b=OqwmUVILIrzw1zQT1WfCxxjijRY8JIirz9V63G7Ahl1f3C81x7actG5a
 d2iPzEE+EAgi/lFuBI9QD9JdVUnC+NFVlzGO9ODcaEiFHShoVJZIMQhlk
 urQkNvzjUZUZW6oqHwWJH3LP7GqqThpqOsTvc8dQBSVX+raQ4+9/zLM8b
 F+YlTx/SRylPdnR3wmS2PEO2IbPdnjAmIrfFaSsVy8FC0MALgNZdT2vFx
 bzh9PvQAYFI7ldGDHc/Kjm7ZcxQj4qjSdJ5o+LyTCuq2yLUNplwX9zgua
 f5dV8vO807dl1p8+VFJiYnC7kRtz/AiVD576ToBufUNeLqZbaOH2Ac43Y Q==;
X-CSE-ConnectionGUID: RsE12xCgSi2PnOmUCrsUyA==
X-CSE-MsgGUID: OKIlEfmWRI+Ecier8gh00w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78022521"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="78022521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:16:39 -0700
X-CSE-ConnectionGUID: ht8XB5R0QBeCf62GUusnmA==
X-CSE-MsgGUID: 8rD5aJBrQsC9h/iWKW2c1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="229971489"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:16:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:16:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 04:16:39 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 04:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1KBl23UHGhYYYXx6srV24asGHWdf2/2R6qk5lIWm+Oad+tC/ZqUJuHOjXjnxPKEuWdVBuKjEZohub5iLyfd8q08c7ZVVthpOD87YJAGWTRDXneY6a+ZecTqMuP1hCWPVxGeMYeiRAeYgWCYL6g3Mq35MwqkjcHmCV9igPSJ8chsDxxpC4/SX0M29zdpYd4zc2nYrfRmLJlqtY+HvoePE8OnElbxG5uY9quMVHzw3+yj+LT4XdfVdgnaqRhyh5YXlQEiVSVWrAw/FnqvQ77wkQ09mMm4qEj2PDnvykd1y2FrCgSUMGCC65WjGJeXVximj9DSUNyehRKqf/6BQqM1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZRBfSq+7rf7fhxGBEUkWy7TUcSymXkXJ5aKIczTrqg=;
 b=P2JkUuYolmv24quojm+zbEpuKRAX+V10ZqjMmlobmlLFFVPirPUC5i2qpGnEa890xGzZsB2PyFk1JLIbD+7uw4htSXHsnssdHFpyCBi37T1koeNLf2Uz8y5h1rauw8qPBjUQcZ/7L1Wv+aVIoV4yRc1TSSO2bLy/zAmC/9VKIbsHOWe2/vIkORC3uta+ZhmIMrDnl0zSICLvg7s1m36POV7wigHOIDJiRVlftSZCkSq7OicASKPjskpgvG0YFkUd0lKP0SmAehhUCcOip6AilmaPatMJRiaBvsyc3E+e4woc8GEshlFdf3MRUvgTwMiFzdTdhpLwAM3PWsbhdpXvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8020.namprd11.prod.outlook.com (2603:10b6:8:114::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.15; Thu, 23 Apr 2026 11:16:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 11:16:35 +0000
Message-ID: <ca7b405c-f7fd-40de-805f-5b82b0db9c6c@intel.com>
Date: Thu, 23 Apr 2026 16:46:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/xe_ras: Add helper to clear error counter
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-10-riana.tauro@intel.com>
 <aen8FiaftUl2o9uj@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <aen8FiaftUl2o9uj@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0234.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 98470123-7c31-4a1f-b92d-08dea129c7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: xJ1LmBUjrOz0bCcMAYj4LfXjg/R53t5rvwmRlqsTMs7Hqkb+6B/HdZlBcHoHmZKQqvFIHDm7Q1JOt77hfvcptL2sUQ7Puz+anTbq5tv+wH95HWZZX2knHjf/HNQkLaSuIrPtCk+JfloZKkp2eWe3sAY61tFZIvPT7XlmSbBGRUEYZarxFJZPxDt8zNNYlXzBsHoaroZ8ga4yQ+k3E1XADwFbDci0D+wcfR9LaiE9giD2diyIQa2bBw1wKSWrv+O+ij+dTkjTZtd++6zyjOTP652iJ9TSZRcju1hAnS/4jA8XtuoOEAdBbXrsyDrbxKs91ff6zDaGtFGjHWQgxPBVltpblaVBdFO5p2eYu+H+P+9g+ssTk34rl5uJyWeZnZmvgOAbhagUR7KkPCa7MaeQ9Sq44QGhxV7xp7nCNqe5/Bv4ubsuwp41xzN4MILS13GZAesIMAnVlqmaR9SHtMZhUGrMy/DWajarYXfMd3+2/dlhO5CCQDG5KWA5sjv4RRJ+geTLvIfpG7b9NuGGz4KrV84tF7Yz7NnNcpT3H8tJc41DjKYzZywUfhtzwu0tXpXfP4/zp6oAuzUuH5qwqYZxl3bP220YgVBtp9iIixzj7S2AB8JZr3UqDAAZ4+Vw372SQfjhc7he+ZnP7VtjP4wD1zF/U2w1+v5Aa65zDexBfLTXjRg9gOooQ0pndxAIbx/NwfbXOuQUnBO5ob7z5iut6OptNcsAeAe/VxVVAsR2yRc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUlsWGxqTzBxSHdTQStSMndwcHFLcGUvY0NsSmlYeFFER08wUlkzRjJTSm9v?=
 =?utf-8?B?ZXc5YTI4R2tkMTdsaW84MmMyZW5HZ2U0OFNyYVErVTRnVSsvRXVHWlFLN3JR?=
 =?utf-8?B?WkM5ak1MZTN5ZXVKSDRYUUgxU093NXowanpqSFd2Rkd4MWVRMi8zWGJsemhH?=
 =?utf-8?B?RlNLamFPeDJRbnpIWVJsdmVoZnlWVzNmZ2tEclk4UUpNM3lJSUptNU9pa3B5?=
 =?utf-8?B?QWhLQ201L1FMaDhzZWhaemlOZnE1NlQ5MTg2b01ZdU5JMTB3OVMxdmhhVVE2?=
 =?utf-8?B?a0JYcndJczhIVzFvT2w3QUFWeGNMaFIwMkt0YlFIOUs5QlhkTU1LWTJNbUpN?=
 =?utf-8?B?bDBQSDdIb2ZGbUpLeUcwQ0RHUGYyZzVLRGk0M0NlLzZqYWZCa3RkNUVSSndN?=
 =?utf-8?B?Z3lQL2FtanpHQWZGQkFMMVpuZDl2clk1THcyQ1pOZ3Q3OTNwSDI5b0lMVk1P?=
 =?utf-8?B?NUkzeERMUjNPSFF6dFkxWWEwKzh6ZkI4NDh0VFZzTUsya29FaXpUU01Pd29i?=
 =?utf-8?B?ZjJuSWwxelQrQ2xrM3c3cW9LNmdEZlZJSjF1UDk3bnhYUnVIYzBzRG9PbEUy?=
 =?utf-8?B?TS9TVHEzby9OSWc1dFpadVVPSXFYZzlRczhsS2hsMmJTQlNjbS9GTmllbzQ2?=
 =?utf-8?B?bG1Ua25Nd3cvaHJmOHlYTnBjVGlrYTY2Si9McWNXV0FlNW8wWUZTR1U1aWhZ?=
 =?utf-8?B?Q1dubTlMRWdmOSs3OXBrNGh1SFpNT0k5T0t6NzZ5M09vcVliNHp6elhESERn?=
 =?utf-8?B?ZEpPUEtqUzExb21jRlZ0WnRyTTJKVjhRRzBsalJqYmFKQ0V4L0gyYWI2T1k1?=
 =?utf-8?B?ZlF6blFtUXBELzJvS0Z4YVJKbmQ4YzVzRjNSbXFtam9SWXlmRC9TcHRqRkky?=
 =?utf-8?B?WlFyNDA4cUR5RExTcm9haDVsTVFWZE5LVTJCVVZUK3ByTFB0TmFTMmVIaEVF?=
 =?utf-8?B?TEJkOXg2aHpObGN6Ump2UjNUMkJZUnlheWl5NEYrZjBmQjFYeTZSMUJ2VW41?=
 =?utf-8?B?cThKZlA4VDhMdnJMbHRKcGR2MmZqR3ZHSXFISmFQV21qQ1R6YW51citPaHFY?=
 =?utf-8?B?cEMzdDdjbE9XWEdEOERZNGRhUm1GbisyeThBK2RWdTZNUUtTRTQyV3p4cGhJ?=
 =?utf-8?B?RkJ1VkNxRzJWVUgrUUV5ZVJ1Rnc5LzVuS3lCNXNsWjFMSVE0b2VYOFVMRnBh?=
 =?utf-8?B?TFN5dlMwVGNJV2UweXdQSUh5VjhXamVzUGZ5MjYwbmhycXN1R2FsWTRkdnlv?=
 =?utf-8?B?VWdtMFVPUGplNkVEL2xmUlRCcWIvYjhuOGZkbHB2ZjMxVDIvd1R2NzFsRis5?=
 =?utf-8?B?RjJVTDBZSi9DZTdFN0NPOThXOTlaZk1CTHdtQVhabWFRNDdBSnNGVittenZC?=
 =?utf-8?B?WFJKdzMxZCtzbXhMeVVtdGUwRUJIaSsrLzJYblVXMzNRWjN3bS9BZ0R2QVoy?=
 =?utf-8?B?NjJ3R2xYc0lPcXJHMklYc2FsTUsxaDFHbUFDVFN4Yk9FUnRsWU1rOVhtSVkr?=
 =?utf-8?B?Mm1PeWQ4eDlPRzU4dkxFaml0bjJwclllajFtaUpDb2JON0J2VkJ0bHZ1aFMz?=
 =?utf-8?B?US8zWVVGTHdwZmtHMDFNMW9DRG9nMHZSS3Y3Z2h2VXpIMWx3WmdzTGZ0dm12?=
 =?utf-8?B?YmhaQzhuN202U2JlQkdacmhDa1VYdExYdkdQTFBteitPUXpHMHd0bG1GNk00?=
 =?utf-8?B?YVZXYXlBVms0Y3l3UlBWVWE0YkdTaXJWUGNSSVV4OUppd3I2T0ZMczNSQzBG?=
 =?utf-8?B?VUE2ZVI4RUFYYjVwUG9lM2tvb0JjYS9LU3FWNDdRTnlGMzdVNkhLaUNGZTht?=
 =?utf-8?B?Si91dzhHQmNoazRzSkI1eXZFKzdaL3N4VVlOYWE3V3o1cGJGcDRPQmNucmxj?=
 =?utf-8?B?aDlMUTQ0TUFMS2NVZEdKazJNcjlPNWhkT2FMZlRIUTNlK0MycGZ1bC9yUi9K?=
 =?utf-8?B?RGdqWlJDdE5td0xJSlZDOXhIMVdzZmQ1TDByZVdUaW1Yem5lQVU3OU5wNFpp?=
 =?utf-8?B?cXVSOUFaNVgrWjZEYi9yNDlGUGdWUVdOVE9HMjlINHVjSkJFV0pqazl5QVp1?=
 =?utf-8?B?RHhKUVR4b1JSZThQcmVWeVllaW41ZE4vM1B3S3lHNjBlS1NBY2lnN211TG5H?=
 =?utf-8?B?aDlnN3ZRVlJ4S0hpNFE5NmcvOWs4WHdlbStBbEw4OFRGOVkvY05JSXJ3SmxU?=
 =?utf-8?B?c2NtZFVna2NzK2JHOTVadWZTZytxa2NFQ3dycUU4TE5rRURBdEQ2b3lJQnRo?=
 =?utf-8?B?dEovVzVlZXo4Uk9ISFd1b2hrYXZ2SE9uM3JYL1NWN3dHMEhndXZFY1hhYmJ6?=
 =?utf-8?B?R1dZMFAzakdIeEZKOXlnZy8yVDNqYkg5YXlJVXprT2QvUEw2eUZWUT09?=
X-Exchange-RoutingPolicyChecked: Js5+SioWLpOd56rT/yLG3sOnWO/tntnT5Jn5IPz3zkRX9osGpIg0Y/NmvkYz48SyM6ky1cm6APyk0/KUFNPf5a5Eo43LBTvoe2xcJqYY/onVCUszzcf/lHYtwShQlwucXRdGaGfl1RjWE1P+Wx2dR8e6LUJdN5/R3QWCig9wA5qCFxhK62b9aqO/+/PQqq0tA57CxPUB2kk24ug2PLEezniWSThY/czuM9CopbuUxwIvs0nE6XELRAjSdHo+zk6x7rdUFGM2Q6O80QwUoBcn5aDaKxVhCbsk/LIlLEASle1osMScfV5FrWshf1fyiaEQFz9zhL5o/Licnd/SYZmCVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98470123-7c31-4a1f-b92d-08dea129c7f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 11:16:35.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+j5hl1F4Hkn+DUEF1axY3JMr8rMMK9et0MpKUJOdhC1eU46GgbIRcSHJnGqWiL0gcEdYtKOfq33zFZx2mqpNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8020
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


On 4/23/2026 4:31 PM, Raag Jadav wrote:
> On Tue, Apr 21, 2026 at 08:20:59PM +0530, Riana Tauro wrote:
>> Add structures and helper function to clear error counter value.
> ...
>
>> +/**
>> + * xe_ras_clear_error_counter() - Clear error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be cleared
>> + * @error_id: Error component to be cleared
>> + *
>> + * This function clears the value of a specific RAS error counter based on
>> + * the provided severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_clear_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> Same comment as last patch.

Any reason? clear_error_counter is better since it states what type of 
counter to clear

>
>> +			       u32 error_id)
>> +{
>> +	struct xe_ras_clear_counter_response response = {0};
>> +	struct xe_ras_clear_counter_request request = {0};
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_error_class *error_class = &request.error_class;
>> +	enum xe_sysctrl_gfsp_cmd cmd = XE_SYSCTRL_CMD_CLEAR_COUNTER;
>> +	size_t rlen;
>> +	u32 status;
> Shouldn't this be int? Or why not just reuse ret?

status from firmware structure is u32. Reused the same

>
>> +	int ret;
>> +
>> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
>> +	error_class->common.component = drm_to_xe_ras_component[error_id];
>> +
>> +	prepare_sysctrl_command(&command, cmd, &request, sizeof(request),
>> +				&response, sizeof(response));
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: cmd %d error ret %d\n", cmd, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: cmd %d response size mismatch. Expected %zu, got %zu\n",
>> +		       cmd, sizeof(response), rlen);
>> +		return -EIO;
>> +	}
>> +
>> +	status = xe_ras_status_to_errno[response.status];
>> +	if (status) {
>> +		xe_err(xe, "sysctrl: cmd %d failed %d\n", cmd, status);
>> +		return status;
> Hm, so I'm wondering if this is useful to end user? Note, anything exposed
> to the user will be hard to change once in place.

These are general error codes. Why do you think it will not be useful to 
end user?
It could be an invalid error counter or a timedout operation.

>
>> +	}
>> +
>> +	return 0;
>> +}
> ...
>
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>    * enum xe_sysctrl_gfsp_cmd  - Sysctrl Command ID's for GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    */
>>   enum xe_sysctrl_gfsp_cmd  {
>> -	XE_SYSCTRL_CMD_GET_COUNTER = 0x03
>> +	XE_SYSCTRL_CMD_GET_COUNTER = 0x03,
> Redundant churn. Please add comma in original patch.

I followed the previous feedback to avoid trailing commas on final 
members :(

>
>> +	XE_SYSCTRL_CMD_CLEAR_COUNTER = 0x04
> Also please align with tabs for readability.

Sure

Thanks
Riana

>
> Raag
>
>>   };
>>   
>>   enum xe_sysctrl_group {
>> -- 
>> 2.47.1
>>
