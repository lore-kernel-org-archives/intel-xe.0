Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BD2C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 16:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169F310E65F;
	Fri, 12 Apr 2024 16:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOWGJ6Fv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEF710E5C8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712939493; x=1744475493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=9b0raTf4yZg2uQsAXRiQB8O0cuSeLhjJomStK0BbtWk=;
 b=UOWGJ6FvfmgM6xTNLURod+KdrVBGD2o2mbxqyYwJ+4fNOU3pvlzVEQ+l
 avRqPS3s7Iz6McKnyyZ1gV4PWDT/VhkaI/vCvd5Vx9oPE9aaIQ5e+WGyc
 1MMDj+AmU+Yh47357h/Pnq7lWfZi8XDMc2nlI/z4iO1tYJrZUacbwXosK
 WhWl5wAYyy51DLqU0/dZZyxOnYem8j+GAofgzO1EuVwRlGTpXJuo5Dslc
 Cv07mfm6zjhUuprpK5j+61UN0tcO74Ynk9kUAs6JTt5uDxhmYu+wLZIf5
 dqKK6rO+nYaftXB6+LpVgS+C8GDW9xbrFbDZ5uWMZG3MmUXwEfrO0dLOZ w==;
X-CSE-ConnectionGUID: he3q+lVwRCqxuj2pyluEZQ==
X-CSE-MsgGUID: 6Fuxu2msTci30tSUrtg3bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19114599"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="19114599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 09:31:33 -0700
X-CSE-ConnectionGUID: wut1hgv8SyWq0UDRhszANQ==
X-CSE-MsgGUID: DL2MTXtWTbWCixA+mzAVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208,217";a="21265084"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 09:31:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 09:31:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 09:31:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 09:31:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 09:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZS8OsbuYuwUircwSk/MYpY7fEPCaRDd7RIwqcFZlfIzgdmtBFMYJfHxBvniyENr84a33zo6dDODaRUP1fTPtD72xeq0JZe/7B87MX88DqU6voVFXzZAwtUUtFgiY+VhjWCYD6HcaR3jew/TO5VRDnUJ45NWxYd5lLZn67pzIt+sgOa5n9LPAOo4VDDNWwGd6fu09JLqkPd9YpbmWpDz252isc1dTashTxGURPcBrUtcZqMKWrLPtuMFPfN4/36ZdSRCYIgOuPkl7NPMJvIWwoTgIdarB8Ms4N2PDSQ7TE8K92HvVJIzXR0PSGwcgQPrUVi+bIPn3/5Cka4xhxglHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivNAXoKtbXoLzmye1fbhzMFtcOpwPJgIoUkukdrGHGM=;
 b=hVbCCTv3R5q0+RaLvUdQhvF8H3567vpAMyHiqyfk5gcVX4m3RE013lqylks0h1zlquY1mNXnVyLrRps9jzLc+HpYG0qXWN2HvwLi6ZXK8TilF9t1WWewR8XJCMcANdPrmwCWRBXf4bsyS5VOg8oHocYBgf8i+t1VRX3FeWf2xwb33fcDdN37tnE/VUo6UN2LOzTS6vfJvHD1qt3z1GkQ1nZHdtb8eC3e1t+1q3sq7Dk+bNhS6aJRh0cJwqSATXnTywPcNl1CcPDcLeWAoid9E97dGep7dVxoXD09S1q5BfwEks9zb/eBsDXK7kQg+b8RDFFdmkE+pWADO94OXxGZ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 16:31:27 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 16:31:27 +0000
Content-Type: multipart/alternative;
 boundary="------------LiJpM1wYbjpc5D9BayAv1iBP"
Message-ID: <5a419e94-cb1d-42d4-9584-29c842c7cca6@intel.com>
Date: Fri, 12 Apr 2024 22:01:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/xe/pm: Capture errors and handle them
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-8-himal.prasad.ghimiray@intel.com>
 <7ioxhkpm4jidj5m4hcc5jsatfk333d4sgso7o5bl2pqmq5xxyc@36dmyunxbviy>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <7ioxhkpm4jidj5m4hcc5jsatfk333d4sgso7o5bl2pqmq5xxyc@36dmyunxbviy>
X-ClientProxiedBy: BM1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::29) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: b37ba2bd-ff2e-45f9-a9e3-08dc5b0e0003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3zCC52JVjd1ex7IB7YDjgbCGCykQpb2g+U42d3sTQS03/whhCbWotfXrv3RN2PwKp9YZDuF9pk5hFK298k+Zjhm+8VBX1OLwEvmQYGdTMpIafC0Gj3RqxWPs9P927KUS9FXBLowmfV4Ts5AmsuHf1GKZxDL+X0WKqenNwYHITlO6zMyX8sXjXaJf1nBFVX0NJoxjkeFRhC2P1QbZH5z9ubJNt2j7i6eTHk5RLk/wBRnoVU7zVuo3/ByTvjVqVjqkxRCIYUeDDAGLiUZN8qHhN9AP9ZY68/+/06ijRX9UQr3oZzWUMopbltV5mpzlhgldDK6o3iXAQaON5RLi+KwFcGysC3kJ97nTQ1fpoe7Ip4oCbS4C7eBzo/8gf4sJf2DjnbSc07u7AjzGKksh3IE8fp5+4K4gPIWdLt8ld0vkDzk0GAsgt2cK2I0zH5kFWehcr8y1AvXXH/EhymjGZfLn8rccRTGZsa9Q7EY34K7dGg+zXfG8opbpbAxwpR7W+wkwYCy85aXbIzqHH//wa1Br3c4kT6Vzrl0c5R3Ua3saOGbktvx03AvQkSzjfJTHg7PtURfZI6zP2FlFOa/jTnm87amElVLPedtYAXe/BOQvKZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUgveFRCUUdxOUY5eTByZzNEQ3FJd1NCeHJUK2dmTjR2aE9zU0xEU2tnVUJE?=
 =?utf-8?B?cS9aOVdJYm1oUGtXWmkwczRQa3Uxa1gzekg0Y0FGSTRsUXlrUGdHSkh4Z2Ro?=
 =?utf-8?B?czFHSlVCNTlCa2lnZmpDcVJ2dm5YU2xac3JtVDEydnRiTzcreWtJMndhenAr?=
 =?utf-8?B?ZmpxTGF5b2hxdEhaWS9hSEVNQzA1SW9EWitXOVFlcytBT1Z6WUFPWm9iM3lH?=
 =?utf-8?B?VmlwejIxckFvZFliaXpBOVdqTldDRHVLclpQUS8xQVRodHRMR3BvVVI1Y3dp?=
 =?utf-8?B?WmZlUHd6UktuQVJ5SnJzTFIzQ1VtdlQ2TEFtOXk1cm9Qb1JDN3ViUmp4WWlx?=
 =?utf-8?B?aWNSdUJtNGtHaVBSN2cydUpTZ09UN1dZQlphRnlvWkhMSkh4NlJUcXQ0QzYx?=
 =?utf-8?B?TG52MVpLTEx3eC94TzR4UEMreEZyNGpZNU4vSHlERlowNjlzNEJJT2RaekpQ?=
 =?utf-8?B?RXpYajZ5YkRSZXczV1NFcFQ0Znp2Z29DK01kdTNLcnBLUVBDMGw1UDZtbkdT?=
 =?utf-8?B?Ujg4WDNIRGlNYzc0VExMSlVMTS9RM1NZS245VzJ0cjAvT3kyTTBtUVVWNnhy?=
 =?utf-8?B?TVI0bXE1RVljV3UxWXhYWXhJTEZlMlgyVDJONmFQQjkwVlBaMWRBUXpRbHJS?=
 =?utf-8?B?aEgvV1hjZDRrSGtvL2UzQ21rdWxyUFRScjlqVHdJNGxaRmVVbkdwNGI5OEgz?=
 =?utf-8?B?c1hpRnVLUHNVRGdvSEF3bTZCUlJ1bWFkaDRaWmNKY0VZM0MxcHJGNmF5NHA4?=
 =?utf-8?B?QWlxVktyTUN0VU9HMEV3d3MzOEJYRkNiaThiL3h6TmVIQ0JCWGVFT3Z3azdV?=
 =?utf-8?B?RjlHZ0pEU291N3Z5bGdLZ2dCVTlIR0VubGxlSlcxRDByaHFmVGVhMEVDblpY?=
 =?utf-8?B?U2hwRit2S0lLdEtTL1phU3FTZkgxbTNUcU1VN1NXQUJwR242cjYybzRIaG1w?=
 =?utf-8?B?VitQS3V5S1RXZzRaQmQxdzgvU3Njb2EyaFdoOHdNc1IxSmJUcFhoVmhwQm1w?=
 =?utf-8?B?Z3RILzBZRHRBMTN5cXJwb0wxMlFQYUVkR3FibkZpRmlHcDh5aEFTNE50bWtO?=
 =?utf-8?B?clJ4c2lBbTdVZ1hrOHZPdlU0VnN6dEhJVE45VlRncGkrazhTRGhKQXZaVkhU?=
 =?utf-8?B?Q2t5c3o1M3prZTJJZnovTzBnQUNBVlBBUzMzV1BoQ1Q3SE43SGVkZzNRUnMx?=
 =?utf-8?B?UXhPTkl2Y0piMHl1Q2p3RCtwYjVMbURuQm54aXpSSzVhN05FU09EaHFzVElR?=
 =?utf-8?B?U0VHUUwxUVpJcUgxaU1CSzEyYi8wVFlzWHJZejd1dERzakJZUlJDNk4yNlc4?=
 =?utf-8?B?SmJGTXg3UUpjcHExZUhuSUJMdUZ6QnpYM2N2TGhLQmdocXUrU1RwVG1USEdG?=
 =?utf-8?B?UlNuK2JONDhlQlhnMCswZk5ldUx1d1RIKzhqdzhNMU1VVnRDSXNJL2Rnd1lR?=
 =?utf-8?B?M1NsbGhZd1FZclVHN3FvdFZBeFJrc0ZSb01HSW1lQ1U1MnduYnJCSG4rVGg1?=
 =?utf-8?B?SWkrRmQrZWZlNks5Y0xLcVA0dFczeWY1QS9WS3F0RFlGNFhvcjJ3QmNvTTha?=
 =?utf-8?B?RXN1bEpyZjZodUZCd0hyUmtkSStJeFZKSU9Dc1ZyNk9tOTdwYXJPOFhONmlv?=
 =?utf-8?B?MmxGYk5xcVhLVTJ1alN3NHlCU0hsenV5TEY3ck1ud25aYmZ0dTBuRFA5eGRB?=
 =?utf-8?B?VHpRSXNBMTV6TGFKWHhUUDhDOUZNQ24rajhzeFBraFFKQWN1MDlHMUxOMURB?=
 =?utf-8?B?NzcxMGNrVXJhVFI4cndPT1ZmRjBPN1hYRmw4SGxLdzl4c1VpUXdQb0tWaHNk?=
 =?utf-8?B?ckNOYVo4d3lSZUl5UEhXekhiY20vRHFudE5QT0c5U21nUENBelAyU1RGY1Zu?=
 =?utf-8?B?ZVQ1QUpJTU1PcXNjK0JOSUNFNEhyZWZFb2VJQXNpSEUrMDV5RS9aL0pqWmo5?=
 =?utf-8?B?bVF5YkpCVG53endXN3l4S0hCS3ErNTZkWDFUTjdRdmJOZHdiWjhMQ2ZCZDM2?=
 =?utf-8?B?SXVhZ3BDWG5ENFpVbEE3QW9OOXBkSzRZZ0JGLzREbkJKU1lGdW1Wa0h1emJu?=
 =?utf-8?B?cTJDdW1iWFlYc3dLUjlDeDhNc1lYM2Y1R1JLKzJGbzZIdDlrUUk0dWdaMEVB?=
 =?utf-8?B?aHlibHhCNGZLcm5YWVc5Unp3ck1GVEhlSjFFWHd4VUZaVDNzUWRBYzhweEZB?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b37ba2bd-ff2e-45f9-a9e3-08dc5b0e0003
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 16:31:27.1102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7Td6uaGI9K7gDxoXYedlwKOEdIdhHk6spdhkzfQ0QieynW8H/Y3bfH3LvniGRDRSMrQAKhrt56QEpN/Ltx60cTO1gNfLPCZQ6IoTZ5betQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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

--------------LiJpM1wYbjpc5D9BayAv1iBP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-04-2024 19:12, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 01:32:45PM +0530, Himal Prasad Ghimiray wrote:
>> xe_pm_init may encounter failures for various reasons, such as a failure
>> in initializing drmm_mutex, or when dealing with a d3cold-capable device
>> for vram_threshold sysfs creation and setting default threshold.
>> Presently, all these potential failures are disregarded.
>>
>> Move d3cold.lock initialization to xe_pm_init_early and cause driver
>> abort if mutex initialization has failed.
>>
>> Warn about failure to create and setting default threshold.
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
>> drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
>> drivers/gpu/drm/xe/xe_pm.c           | 34 +++++++++++++++++++++++-----
>> drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>> 4 files changed, 34 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index e47c8ad1bb17..21677b8cd977 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct 
>> drm_device *drm, void *arg)
>>     sysfs_remove_file(&xe->drm.dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> }
>>
>> -void xe_device_sysfs_init(struct xe_device *xe)
>> +int xe_device_sysfs_init(struct xe_device *xe)
>> {
>>     struct device *dev = xe->drm.dev;
>>     int ret;
>>
>>     ret = sysfs_create_file(&dev->kobj, 
>> &dev_attr_vram_d3cold_threshold.attr);
>> -    if (ret) {
>> -        drm_warn(&xe->drm, "Failed to create sysfs file\n");
>> -        return;
>> -    }
>> -
>> -    ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
>>     if (ret)
>> -        drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>> +        return ret;
>> +
>> +    return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, 
>> xe);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_device_sysfs.h
>> index 38b240684bee..f9e83d8bd2c7 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>> @@ -8,6 +8,6 @@
>>
>> struct xe_device;
>>
>> -void xe_device_sysfs_init(struct xe_device *xe);
>> +int xe_device_sysfs_init(struct xe_device *xe);
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f1fc83845c01..f4d9441720b4 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct xe_device 
>> *xe)
>>     pm_runtime_put(dev);
>> }
>>
>> -void xe_pm_init_early(struct xe_device *xe)
>> +int xe_pm_init_early(struct xe_device *xe)
>> {
>> +    int err;
>> +
>>     INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>> -    drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>> +
>> +    err = drmm_mutex_init(&xe->drm, 
>> &xe->mem_access.vram_userfault.lock);
>> +    if (err)
>> +        return err;
>> +
>> +    /* Currently d3cold.lock will be used only with GuC */
>
> it's cheaper to just initialize it regardless so this can be simpler
>
> int xe_pm_init_early(struct xe_device *xe)
> {
>     int err;
>
>     INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>
>     if ((err = drmm_mutex_init(&xe->drm, 
> &xe->mem_access.vram_userfault.lock) ||
>         (err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock)))
>         return err;
Looks clean. Will prefer using this.
>
>     return 0;
> }
>
> or keep the err assignment separate, doesn't matter much. But
> when we mix success and failure for a return-early style it makes
> it harder to read.
>
>>
>> /**
>> @@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device *xe)
>>  * @xe: xe device instance
>>  *
>>  * This component is responsible for System and Device sleep states.
>> + *
>
> wrong line
>
>>  */
>> void xe_pm_init(struct xe_device *xe)
>> {
>> +    int err;
>> +
>>     /* For now suspend/resume is only allowed with GuC */
>>     if (!xe_device_uc_enabled(xe))
>>         return;
>>
>> -    drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>> -
>>     xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>>
>>     if (xe->d3cold.capable) {
>> -        xe_device_sysfs_init(xe);
>> -        xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>> +        err = xe_device_sysfs_init(xe);
>
> apparently not because of this patch, but why do we call a function
> named xe_device_sysfs_init() iff xe->d3cold.capable? And from within
> xe_pm. That seems totally misplaced. +Rodrigo
>
>> +        if (err)
>> +            drm_warn(&xe->drm,
>> +                 "Sysfs create for user to set vram threshold 
>> failed\n");
>
> just warning?

If I propagate xe_pm_int errors to xe_pci.c, it exhibits unexpected 
behavior. The PCI module throws errors as anticipated, but when I remove 
the xe module with "module -r xe", it doesn't properly clean up the 
"/sys/class/drm/card*" directory. Subsequently, upon reloading, it 
complains about existing sysfs entries and fails to load. This behavior 
aligns with the issue described in 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1352.

>
> Lucas De Marchi
>
>> +
>> +        err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>> +        if (err)
>> +            drm_warn(&xe->drm, "Setting default vram threshold 
>> failed\n");
>>     }
>>
>>     xe_pm_runtime_init(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 0cb38ca244fe..1e6ec58878d2 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -20,7 +20,7 @@ struct xe_device;
>> int xe_pm_suspend(struct xe_device *xe);
>> int xe_pm_resume(struct xe_device *xe);
>>
>> -void xe_pm_init_early(struct xe_device *xe);
>> +int xe_pm_init_early(struct xe_device *xe);
>> void xe_pm_init(struct xe_device *xe);
>> void xe_pm_runtime_fini(struct xe_device *xe);
>> bool xe_pm_runtime_suspended(struct xe_device *xe);
>> -- 
>> 2.25.1
>>
--------------LiJpM1wYbjpc5D9BayAv1iBP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12-04-2024 19:12, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:7ioxhkpm4jidj5m4hcc5jsatfk333d4sg=
so7o5bl2pqmq5xxyc@36dmyunxbviy">On
      Fri, Apr 12, 2024 at 01:32:45PM +0530, Himal Prasad Ghimiray
      wrote:
      <br>
      <blockquote type=3D"cite">xe_pm_init may encounter failures for
        various reasons, such as a failure
        <br>
        in initializing drmm_mutex, or when dealing with a
        d3cold-capable device
        <br>
        for vram_threshold sysfs creation and setting default threshold.
        <br>
        Presently, all these potential failures are disregarded.
        <br>
        <br>
        Move d3cold.lock initialization to xe_pm_init_early and cause
        driver
        <br>
        abort if mutex initialization has failed.
        <br>
        <br>
        Warn about failure to create and setting default threshold.
        <br>
        <br>
        Cc: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
        <br>
        Cc: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
        <br>
        Signed-off-by: Himal Prasad Ghimiray
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:himal.prasad.ghim=
iray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
        <br>
        ---
        <br>
        drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
        <br>
        drivers/gpu/drm/xe/xe_device_sysfs.h |&nbsp; 2 +-
        <br>
        drivers/gpu/drm/xe/xe_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 34
        +++++++++++++++++++++++-----
        <br>
        drivers/gpu/drm/xe/xe_pm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-
        <br>
        4 files changed, 34 insertions(+), 16 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
        b/drivers/gpu/drm/xe/xe_device_sysfs.c
        <br>
        index e47c8ad1bb17..21677b8cd977 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
        <br>
        @@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct
        drm_device *drm, void *arg)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;sysfs_remove_file(&amp;xe-&gt;drm.dev-&gt;k=
obj,
        &amp;dev_attr_vram_d3cold_threshold.attr);
        <br>
        }
        <br>
        <br>
        -void xe_device_sysfs_init(struct xe_device *xe)
        <br>
        +int xe_device_sysfs_init(struct xe_device *xe)
        <br>
        {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;struct device *dev =3D xe-&gt;drm.dev;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;int ret;
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;ret =3D sysfs_create_file(&amp;dev-&gt;kobj=
,
        &amp;dev_attr_vram_d3cold_threshold.attr);
        <br>
        -&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&gt;dr=
m, &quot;Failed to create sysfs
        file\n&quot;);
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        -&nbsp;&nbsp;&nbsp; }
        <br>
        -
        <br>
        -&nbsp;&nbsp;&nbsp; ret =3D drmm_add_action_or_reset(&amp;xe-&gt;dr=
m,
        xe_device_sysfs_fini, xe);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;if (ret)
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&gt;dr=
m, &quot;Failed to add sysfs fini drm
        action\n&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return drmm_add_action_or_reset(&amp;xe-&gt;drm=
,
        xe_device_sysfs_fini, xe);
        <br>
        }
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h
        b/drivers/gpu/drm/xe/xe_device_sysfs.h
        <br>
        index 38b240684bee..f9e83d8bd2c7 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device_sysfs.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
        <br>
        @@ -8,6 +8,6 @@
        <br>
        <br>
        struct xe_device;
        <br>
        <br>
        -void xe_device_sysfs_init(struct xe_device *xe);
        <br>
        +int xe_device_sysfs_init(struct xe_device *xe);
        <br>
        <br>
        #endif
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pm.c
        b/drivers/gpu/drm/xe/xe_pm.c
        <br>
        index f1fc83845c01..f4d9441720b4 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pm.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pm.c
        <br>
        @@ -208,10 +208,25 @@ static void xe_pm_runtime_init(struct
        xe_device *xe)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;pm_runtime_put(dev);
        <br>
        }
        <br>
        <br>
        -void xe_pm_init_early(struct xe_device *xe)
        <br>
        +int xe_pm_init_early(struct xe_device *xe)
        <br>
        {
        <br>
        +&nbsp;&nbsp;&nbsp; int err;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;INIT_LIST_HEAD(&amp;xe-&gt;mem_access.vram_=
userfault.list);
        <br>
        -&nbsp;&nbsp;&nbsp; drmm_mutex_init(&amp;xe-&gt;drm,
        &amp;xe-&gt;mem_access.vram_userfault.lock);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; err =3D drmm_mutex_init(&amp;xe-&gt;drm,
        &amp;xe-&gt;mem_access.vram_userfault.lock);
        <br>
        +&nbsp;&nbsp;&nbsp; if (err)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Currently d3cold.lock will be used only with=
 GuC */
        <br>
      </blockquote>
      <br>
      it's cheaper to just initialize it regardless so this can be
      simpler
      <br>
      <br>
      int xe_pm_init_early(struct xe_device *xe)
      <br>
      {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;int err;
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;INIT_LIST_HEAD(&amp;xe-&gt;mem_access.vram_us=
erfault.list);
      <br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;if ((err =3D drmm_mutex_init(&amp;xe-&gt;drm,
      &amp;xe-&gt;mem_access.vram_userfault.lock) ||
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (err =3D drmm_mutex_init(&=
amp;xe-&gt;drm,
      &amp;xe-&gt;d3cold.lock)))
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;
      <br>
    </blockquote>
    Looks clean. Will prefer using this. <br>
    <blockquote type=3D"cite" cite=3D"mid:7ioxhkpm4jidj5m4hcc5jsatfk333d4sg=
so7o5bl2pqmq5xxyc@36dmyunxbviy">
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;return 0;
      <br>
      }
      <br>
      <br>
      or keep the err assignment separate, doesn't matter much. But
      <br>
      when we mix success and failure for a return-early style it makes
      <br>
      it harder to read.
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        /**
        <br>
        @@ -219,20 +234,27 @@ void xe_pm_init_early(struct xe_device
        *xe)
        <br>
        &nbsp;* @xe: xe device instance
        <br>
        &nbsp;*
        <br>
        &nbsp;* This component is responsible for System and Device sleep
        states.
        <br>
        + *
        <br>
      </blockquote>
      <br>
      wrong line
      <br>
      <br>
      <blockquote type=3D"cite">&nbsp;*/
        <br>
        void xe_pm_init(struct xe_device *xe)
        <br>
        {
        <br>
        +&nbsp;&nbsp;&nbsp; int err;
        <br>
        +
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;/* For now suspend/resume is only allowed w=
ith GuC */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;if (!xe_device_uc_enabled(xe))
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;
        <br>
        <br>
        -&nbsp;&nbsp;&nbsp; drmm_mutex_init(&amp;xe-&gt;drm, &amp;xe-&gt;d3=
cold.lock);
        <br>
        -
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe-&gt;d3cold.capable =3D xe_pm_pci_d3cold_=
capable(xe);
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;if (xe-&gt;d3cold.capable) {
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_device_sysfs_init(xe=
);
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_pm_set_vram_threshol=
d(xe, DEFAULT_VRAM_THRESHOLD);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_device_sysfs=
_init(xe);
        <br>
      </blockquote>
      <br>
      apparently not because of this patch, but why do we call a
      function
      <br>
      named xe_device_sysfs_init() iff xe-&gt;d3cold.capable? And from
      within
      <br>
      xe_pm. That seems totally misplaced. +Rodrigo
      <br>
      <br>
      <blockquote type=3D"cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 if (err)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 drm_warn(&amp;xe-&gt;drm,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs create for user to set vram thre=
shold
        failed\n&quot;);
        <br>
      </blockquote>
      <br>
      just warning?
      <br>
    </blockquote>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">If=
 I propagate xe_pm_int errors to xe_pci.c, it exhibits unexpected behavior.=
 The PCI module throws errors as anticipated, but when I remove the xe modu=
le with &quot;module -r xe&quot;, it doesn't properly clean up the &quot;/s=
ys/class/drm/card*&quot; directory. Subsequently, upon reloading, it compla=
ins about existing sysfs entries and fails to load. This behavior aligns wi=
th the issue described in </span><a target=3D"_new" href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/-/issues/1352" style=3D"border: 0px solid rgb=
(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-bor=
der-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0;=
 --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan=
-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximi=
ty; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradi=
ent-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure=
: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --t=
w-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rg=
ba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shado=
w: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 =
transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscal=
e: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-=
drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backd=
rop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw=
-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw=
-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain=
-paint: ; --tw-contain-style: ; color: var(--link); text-decoration: none; =
font-weight: 400; font-family: S=C3=B6hne, ui-sans-serif, system-ui, -apple=
-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&q=
uot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoj=
i&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Not=
o Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: =
2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; bac=
kground-color: rgb(255, 255, 255);" class=3D"moz-txt-link-freetext">https:/=
/gitlab.freedesktop.org/drm/xe/kernel/-/issues/1352</a><span style=3D"color=
: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sans-serif, system-ui, -appl=
e-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&=
quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emo=
ji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;No=
to Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-lig=
atures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">. </span></p>
    <blockquote type=3D"cite" cite=3D"mid:7ioxhkpm4jidj5m4hcc5jsatfk333d4sg=
so7o5bl2pqmq5xxyc@36dmyunxbviy">
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type=3D"cite">+
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_pm_set_vram_=
threshold(xe,
        DEFAULT_VRAM_THRESHOLD);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 drm_warn(&amp;xe-&gt;drm, &quot;Setting default vram
        threshold failed\n&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;}
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;xe_pm_runtime_init(xe);
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pm.h
        b/drivers/gpu/drm/xe/xe_pm.h
        <br>
        index 0cb38ca244fe..1e6ec58878d2 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pm.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pm.h
        <br>
        @@ -20,7 +20,7 @@ struct xe_device;
        <br>
        int xe_pm_suspend(struct xe_device *xe);
        <br>
        int xe_pm_resume(struct xe_device *xe);
        <br>
        <br>
        -void xe_pm_init_early(struct xe_device *xe);
        <br>
        +int xe_pm_init_early(struct xe_device *xe);
        <br>
        void xe_pm_init(struct xe_device *xe);
        <br>
        void xe_pm_runtime_fini(struct xe_device *xe);
        <br>
        bool xe_pm_runtime_suspended(struct xe_device *xe);
        <br>
        --&nbsp;<br>
        2.25.1
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------LiJpM1wYbjpc5D9BayAv1iBP--
