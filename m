Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680D8C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 10:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3997610E7A2;
	Thu, 26 Oct 2023 10:18:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B2A10E7A2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698315498; x=1729851498;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y1TzG/rs3otmGl2Jl+D4hdr5b3/mg3Q9yFyETPtD/Bg=;
 b=CgRUrGxElIrgDFlaGOksJ8V5tU58RrUAdUYOEN97HBWRV/LD7vWAFse/
 4c1T7l+0zq9EciqGaebs6sCtoeNpxhAQWUyDaqbtp0bkaxsFdGf1Oz8BO
 SM7Uc6PgWZO4BH9mYOcrE+4WyE57tH2teeKHC+dWIY6aZsvUKjHkkC+c1
 3we7XSwZwdB4gasrVCPqA69jZkMy+89u8zfZrXbnIVB9Wk6e7E+SyHhlx
 SweWf38CdnxwrCKepFGZ7u/AxNlhxe0vThSh/3KMPgFaX2Pxjkt5uZlEz
 uKHcKIM1KO6dI2uv97LKznMbGNrJnLoILkw/cZjHFXvbkeUyiaDLeTzIw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="308779"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="308779"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 03:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735695190"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="735695190"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 03:17:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 03:17:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 03:17:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 03:17:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 26 Oct 2023 03:17:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzfWGTmOaryQvxfz+g/I+TX+lfCAUpmrM480MsARWGlO/J0i3bNFR81IifiOiFrHnZDmw0UB8N3Pw+S0Zk5CKoXkdPUvLK2FH3cpIiliey7yEceuiR5NGVKJYnCk5JaohqBbgZ+4VGtnoCgX3y7SRUGGBWrBVvBncwqgR5IPWTdPrnXthkhwgtPNFMM5BNWXb10Vol80z3kRtLhCYubEYPiT+zfiZWgVFRAwacwbl4gWbzni4lKEuXFGUkX7xZF58n52t6quM+Hkjljz0+UA4gjqg5I+v5CXqpvTUTmF+EXZyE0kJRypsknFQjsswHQ/6MPAKUtPKsXILCpEnGBQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0YrBJqciKiiXek3FLDa5oCcJLREnUyv0hxmGobDEzk=;
 b=ChSh1BOt1sIAM3sKYF6VyKA+sE8BJ1TllG+iqxBg95eHs+1n0IuAWxM8xYBirpPxPNQh1m3ndd2ZCxcOt3J1iQkxydw5hEaahdlOxG+LFA4PpmMOMkKMJY1QrIf2Qi6vtequLvly/yrXnQZyANyuHgpkv6NIECzelyhDWyfr/hMjvISF5ylwf+Awk8iHcSbxgtXjK1kqzsUu+ARZPeITLxFf94I3BXvBZbFYvI/7l0/WETut2IulrGql/FbTYZt+7xKMusvkZg8UtA1e1E6aj9OgCdk+nDg2zR0kTR12DhPWHnYzMpi4ryPlepfQmbRt2AFx5jYNBwBVKtbWLTt5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB5502.namprd11.prod.outlook.com (2603:10b6:5:39e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Thu, 26 Oct
 2023 10:17:08 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::51c3:59ea:6d4:8bc0%4]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 10:17:08 +0000
Message-ID: <9dbcb7bd-91a2-4087-bc7c-6fe5744cb30a@intel.com>
Date: Thu, 26 Oct 2023 15:47:01 +0530
User-Agent: Mozilla Thunderbird
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
 <20231018190341.726098-3-badal.nilawar@intel.com>
 <CY5PR11MB62112039E53B9B263A7EF43B95D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB62112039E53B9B263A7EF43B95D4A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdb11d1-cd1c-409e-935c-08dbd60cb5da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVGVkwKeDBwtbEtb9Wa+WESRQwYV8IMqqBX61fO6FHY6XMlmPt9w3kwrG0OBcnDI6wl1g8Rk4jh3y//n+PKoWKPr4OLIflzzyiMbX5h+Ox/9KXa2DfJjd7wmdziNsGlAa+M4+9OkaiQiUOAjrLNCWIb7O/knbYYWlqrnOTgN6aWxthO5PtFNz8+rf0uhaig96tv/XKiQcp9dB5ECAXr7FOYX7UkhNMPN9Z7g30zISDI7QpxTR5xJ1RONuXN2tz++Q1Gzu2NpcFExHkZPpuTQNCjZ37maI27arC8HQYLfcbD7GvQzD8OCtukg82Wasvu6oz44hxVEwN6OfAgIJcZ86HyXJX7is0dgEJqdlGWPs8Q0kr0xb/c5kWoIGzTQ1NrR7uzRhYK2J//HGgSAT2HEoDIZkjGKOtgZEpVleJn+9m2ywV+W4x+LYrOADCcS+MKSKWDIYpWR79NJqu11lRu+ya1weeXVUXxTxpr9F6nOAPua2iscixt1xkQZrCUuMr4/MlfARne8CrciW0BJ9v9aw/+mpQDfE81bGCSNMZlVeHHt+zG0X2KPqo+GWdHpmdr8qgy0Tito7Mv34Nv01bSUsBm7iJmc8PTVz+8ohlXA/dVpHqLzc1IIBYv8hV6s24YdujFB1VxE5OpJk1f5hs4hjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6512007)(82960400001)(2616005)(26005)(6486002)(5660300002)(8936002)(41300700001)(86362001)(2906002)(31696002)(66556008)(66476007)(4326008)(316002)(54906003)(36756003)(66946007)(110136005)(8676002)(6666004)(53546011)(6506007)(478600001)(38100700002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFQwVGdrd2pyZm0rZHBMdTFNU0laaEFqMFp6ZFB6R3hlaTRML2hIYWJnYzBx?=
 =?utf-8?B?bm9QV1g1NTdEc0pPNjdwUHd1MmN5NjlrVUMvSkFKRnJnbW9LZlJsRlFGV0Z3?=
 =?utf-8?B?ZTd0TjRXdkcybFFqVUJvU0Z6UmttVy92RmtSRGpteXRoQ29ydXRBVVVMN2lr?=
 =?utf-8?B?cUZBWGFyamRDMTF1TDQwWHAvT1VTWDhBM2hnajZ5V0cyVHF3Q2RKN1hUdmp3?=
 =?utf-8?B?UXorK01DUTZvZkFUdWpHc3RHc21IU05BY2h2QzR4a0dyRlFtanFrVHF6aVNh?=
 =?utf-8?B?ZzhGdE1lNXVRMHRwSVJwQXBCUWY1ek9YbTZYQXpTOC9BMGVGTUliTDdIa0Ev?=
 =?utf-8?B?ajBFbFZqZW9yZ1IwdUlTcSs2dndGdDB3WnJ5ZjZEWUVjWHUvOVU4OUEzcmdl?=
 =?utf-8?B?eWd2YUtkRlJLSFk5ODRHT29sd3lHZ3A1SjlObHJBeFIzN0ZoRDljSEdUQ3JK?=
 =?utf-8?B?dHVwOExLYW9Sd0RFWnJKSkhQYXorZmdsR3ZzSTQ4cjNPdlBPTDh5YUd3MW4z?=
 =?utf-8?B?Q2tVTy9YZ2xZSFYzb0w1OFY3QzhZS2lsWXh5aDVqUmhlL09JdFBkR3R3dFpp?=
 =?utf-8?B?eVV4VXBUVmUzWjJ1eFRmMjM3T29VeWRyNlZrNndlRUZUNGFzRENDY0hHdDVt?=
 =?utf-8?B?WTlZOTJhdjNPRDR1eGE4SnBEQ1VCdGwzTFh6NVpmZDUyZkl5LzBWbkEwVjY5?=
 =?utf-8?B?RUpYWmZ4TlY1dnIzQ0FHQ2hFYXdMTkpadUtTVlgyMXUyQVZNY04rV29pcVN3?=
 =?utf-8?B?VGVhMkhMUkZXV3A1YjM0ZVY4aGMvQWdaNDdwRFBDWnBCQURBQzVnTlNrVzNB?=
 =?utf-8?B?c0hPR1Z6ZStaZUFuTHBPOVZQV01nV1V2eWRmc2ozL0NKelA3anpoUkdxVE5R?=
 =?utf-8?B?RjhOYkhpdkRGMHYxRXJEa05UMGdDWDdtcTVEZjNNNkdSQitoL3BMTzBKQkd5?=
 =?utf-8?B?L2RRN1E4UGZoNTZ0RDZUUG9oUnlBM0tDNGdWTkR2OXZMVjJ5bWlwdWZDcDlz?=
 =?utf-8?B?bktyOE5qWkN0SUN0eVpDcnM1L1dTeU1TNnQyUWR2ZFIxMTM1K0VTalVHZjl2?=
 =?utf-8?B?dTI2N1ZqU2FMNHBXSXRKTnVXOHQxaVhHMUhsNjNCUkpaRkFraXJ2dmJMOHFs?=
 =?utf-8?B?T3l6M3M3MlFGQjg3bVczVFhJWkRHeE9MV1RtUnRBRTdjTHFzWVRnS2RpdDhm?=
 =?utf-8?B?RE1lc3U0T1d1bVJudjNnczFqeEo0YTlDVUgyc1Y3c3lPT240d21QbjhKZ2JE?=
 =?utf-8?B?Uk1yb2hITWxMMUVvZXV1QURwYmlrM2JFSWNncHhPTmtPWk9rektUVmZmcXlt?=
 =?utf-8?B?S0c3M1dLQzF4VVBvWHJHMFBnUTY1VlVucDZLYVhFa2FuZSt5UDdsVm4vME1m?=
 =?utf-8?B?eUhqZVJMVmlVQUtCb0IzSkVuS3I1eXpBZ1p0bE9VV0JITGFrbHhEVEZwdld5?=
 =?utf-8?B?c2RvVzZLUWFpSjlTdDljeHlFQk05bnYxRGlHY1lnSW5XcEtySGluM21FZEZ0?=
 =?utf-8?B?enA1ZEpldjlpTENkOEdqamRoNG1nb0J2dWdKSlNNbUJ1ZFh0QWFWbTcvYVZ6?=
 =?utf-8?B?VzFtdzBJN2lBa0lMSVV1cXI1TmVDZUJveG1VRnJLdldKVVNlWEY1YVhKYldH?=
 =?utf-8?B?QXNXVnV6UEVrcVdjcjFPNGNuMUtLdG51SzNPbERIQzRmL253bnJIZXY1Zy9T?=
 =?utf-8?B?aklqM3pLN01vd3doWGx3TjcrREdLaTVES3QvblVOa0hSMXFHYTB2bWFHcVJW?=
 =?utf-8?B?TG5UQisvbjltS3BpUjVCUkp3VEVEZEVrV1RzbERoMEN4T1VFU3FuVVk2WGM3?=
 =?utf-8?B?WTJteHNxMk1FeS9HOEhJVk5SNjF2Z3RiQUVvRXNIUFZRWVkyMXZjbDF0elgy?=
 =?utf-8?B?ei9ONUdOYW5ycEZwYUZONk1McVpKdzh2YXlNWnB3TnplalgwbFZOTzR2ZWtP?=
 =?utf-8?B?QXlDMUdhcXUyZ08vc1NMSXhrZ3lOT1UzbkFKaFJ3Y3ZhY2Y0NDloSUxCcDcv?=
 =?utf-8?B?eXpwODJ2TXI4My81Zi8vMlVVK0JUNy9KcUVRWEg5WWc4a0Fjb3pYOGYzZ0s3?=
 =?utf-8?B?UkNrMFdhMit5WEJEajFlTWN2WWpiTlVYcVNxeUFZNmpvVTZhY09GRVhvWCtD?=
 =?utf-8?B?WGdRUFh2Qm9XcTQwNEZWWnhyc3RpU0hpVVMrK3IzSzNGQ1BrMVFRNWZsS3RF?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdb11d1-cd1c-409e-935c-08dbd60cb5da
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:17:08.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3p8RjqVKe4IqAnC7cx1lfetT6/yVl63EeoZXh1SK/DMYExagKT+5PtIcDFod7coia8ghVf/AGfYQ0jKD+IMRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5502
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw
 attributes with hwmon_lock
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
Cc: "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-10-2023 12:04, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Thursday, October 19, 2023 12:34 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; andi.shyti@linux.intel.com; Tauro, Riana
>> <riana.tauro@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw attributes with
>> hwmon_lock
>>
>> Take hwmon_lock while accessing hwmon rw attributes. For readonly
>> attributes its not required to take lock as reads are protected by sysfs layer and
>> therefore sequential.
> This patch should only have functionality related to locking, why this is adding
> xe_hwmon_power_curr_crit_write and xe_hwmon_power_curr_crit_read ?
Sure, will add these functions to refactor patch.
>>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 92 ++++++++++++++++++++--------------
>> -
>>   1 file changed, 52 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> b/drivers/gpu/drm/xe/xe_hwmon.c index 08c7289723ae..c87d028f1955
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {  struct xe_hwmon {
>>   	struct device *hwmon_dev;
>>   	struct xe_gt *gt;
>> -	struct mutex hwmon_lock; /* rmw operations*/
>> +	struct mutex hwmon_lock; /* For rw attributes */
> Make this Kernel Doc comment, and this is wrongly placed here in .c , structure are declared
> In headers in all xe files, and requires kernel doc comment.
Sure will add kernel doc comment. Struct added here as it is used only 
in this file. Infact in drivers/gpu/drm/xe/xe_mocs.c has structures 
defined in it.

Regards,
Badal
> Thanks,
> Anshuman Gupta.
>>   	int scl_shift_power;
>>   	int scl_shift_energy;
>>   	struct xe_hwmon_energy_info ei;	/*  Energy info for
>> energy1_input */
>> @@ -135,11 +135,13 @@ static void xe_hwmon_power_max_read(struct
>> xe_hwmon *hwmon, long *value)  {
>>   	u64 reg_val, min, max;
>>
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_READ32, &reg_val, 0, 0);
>>   	/* Check if PL1 limit is disabled */
>>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>   		*value = PL1_DISABLE;
>> -		return;
>> +		goto unlock;
>>   	}
>>
>>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val); @@ -153,12
>> +155,17 @@ static void xe_hwmon_power_max_read(struct xe_hwmon
>> *hwmon, long *value)
>>
>>   	if (min && max)
>>   		*value = clamp_t(u64, *value, min, max);
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>>   }
>>
>>   static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long
>> value)  {
>> +	int ret = 0;
>>   	u64 reg_val;
>>
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all
>> platforms */
>>   	if (value == PL1_DISABLE) {
>>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_RMW32, &reg_val, @@ -166,8 +173,10 @@ static int
>> xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_READ32, &reg_val,
>>   				     PKG_PWR_LIM_1_EN, 0);
>>
>> -		if (reg_val & PKG_PWR_LIM_1_EN)
>> -			return -EOPNOTSUPP;
>> +		if (reg_val & PKG_PWR_LIM_1_EN) {
>> +			ret = -EOPNOTSUPP;
>> +			goto unlock;
>> +		}
>>   	}
>>
>>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>> @@ -176,8 +185,9 @@ static int xe_hwmon_power_max_write(struct
>> xe_hwmon *hwmon, long value)
>>
>>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> REG_RMW32, &reg_val,
>>   			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>> -
>> -	return 0;
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +	return ret;
>>   }
>>
>>   static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon,
>> long *value) @@ -215,8 +225,6 @@ xe_hwmon_energy_get(struct
>> xe_hwmon *hwmon, long *energy)
>>   	struct xe_hwmon_energy_info *ei = &hwmon->ei;
>>   	u64 reg_val;
>>
>> -	mutex_lock(&hwmon->hwmon_lock);
>> -
>>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS,
>> REG_READ32,
>>   			     &reg_val, 0, 0);
>>
>> @@ -229,8 +237,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon,
>> long *energy)
>>
>>   	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>>   				  hwmon->scl_shift_energy);
>> -
>> -	mutex_unlock(&hwmon->hwmon_lock);
>>   }
>>
>>   static const struct hwmon_channel_info *hwmon_info[] = { @@ -260,6
>> +266,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>>   			      uval);
>>   }
>>
>> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long
>> +*value, u32 scale_factor) {
>> +	int ret;
>> +	u32 uval;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> +	if (ret)
>> +		goto unlock;
>> +
>> +	*value =
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> +				 scale_factor, POWER_SETUP_I1_SHIFT);
>> +unlock:
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +	return ret;
>> +}
>> +
>> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long
>> +value, u32 scale_factor) {
>> +	int ret;
>> +	u32 uval;
>> +
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>> +	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
>> scale_factor);
>> +	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +
>> +	mutex_unlock(&hwmon->hwmon_lock);
>> +	return ret;
>> +}
>> +
>>   static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)  {
>>   	u64 reg_val;
>> @@ -291,9 +329,6 @@ xe_hwmon_power_is_visible(struct xe_hwmon
>> *hwmon, u32 attr, int chan)  static int  xe_hwmon_power_read(struct
>> xe_hwmon *hwmon, u32 attr, int chan, long *val)  {
>> -	int ret;
>> -	u32 uval;
>> -
>>   	switch (attr) {
>>   	case hwmon_power_max:
>>   		xe_hwmon_power_max_read(hwmon, val);
>> @@ -302,14 +337,7 @@ xe_hwmon_power_read(struct xe_hwmon
>> *hwmon, u32 attr, int chan, long *val)
>>   		xe_hwmon_power_rated_max_read(hwmon, val);
>>   		return 0;
>>   	case hwmon_power_crit:
>> -		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> -		if (ret)
>> -			return ret;
>> -		if (!(uval & POWER_SETUP_I1_WATTS))
>> -			return -ENODEV;
>> -		*val =
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> -				       SF_POWER, POWER_SETUP_I1_SHIFT);
>> -		return 0;
>> +		return xe_hwmon_power_curr_crit_read(hwmon, val,
>> SF_POWER);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -318,14 +346,11 @@ xe_hwmon_power_read(struct xe_hwmon
>> *hwmon, u32 attr, int chan, long *val)  static int
>> xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long
>> val)  {
>> -	u32 uval;
>> -
>>   	switch (attr) {
>>   	case hwmon_power_max:
>>   		return xe_hwmon_power_max_write(hwmon, val);
>>   	case hwmon_power_crit:
>> -		uval = DIV_ROUND_CLOSEST_ULL(val <<
>> POWER_SETUP_I1_SHIFT, SF_POWER);
>> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +		return xe_hwmon_power_curr_crit_write(hwmon, val,
>> SF_POWER);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -348,19 +373,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon
>> *hwmon, u32 attr)  static int  xe_hwmon_curr_read(struct xe_hwmon
>> *hwmon, u32 attr, long *val)  {
>> -	int ret;
>> -	u32 uval;
>> -
>>   	switch (attr) {
>>   	case hwmon_curr_crit:
>> -		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
>> -		if (ret)
>> -			return ret;
>> -		if (uval & POWER_SETUP_I1_WATTS)
>> -			return -ENODEV;
>> -		*val =
>> mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
>> -				       SF_CURR, POWER_SETUP_I1_SHIFT);
>> -		return 0;
>> +		return xe_hwmon_power_curr_crit_read(hwmon, val,
>> SF_CURR);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> @@ -369,12 +384,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon,
>> u32 attr, long *val)  static int  xe_hwmon_curr_write(struct xe_hwmon
>> *hwmon, u32 attr, long val)  {
>> -	u32 uval;
>> -
>>   	switch (attr) {
>>   	case hwmon_curr_crit:
>> -		uval = DIV_ROUND_CLOSEST_ULL(val <<
>> POWER_SETUP_I1_SHIFT, SF_CURR);
>> -		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
>> +		return xe_hwmon_power_curr_crit_write(hwmon, val,
>> SF_CURR);
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> --
>> 2.25.1
> 
