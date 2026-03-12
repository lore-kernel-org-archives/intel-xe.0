Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02B2103E301
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 10:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDDE10E9DA;
	Thu, 12 Mar 2026 10:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLhfozee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0DF10E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773311315; x=1804847315;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vtzr8or8ZjTeUITNh3sHo4u1FJ43c6KrXUa4xqO4dKA=;
 b=aLhfozeeDKlpZzQHZ7u2uKFqWhFiDJ/lvgFfeOgBD7s+7bWjp/Xu4OvS
 rdyWTBbKZooZpLeDIwrUNs+JcuTZoFQ/S+J1Qhffkk0egFBHu0glE0jeA
 JS4hgwJukO5spfWCP9Kgf//XVo5piRkXfgOoeoZVWv8mRsXwAqCH+QkxQ
 fTKKWzXwRAUWUXhUt2Lf9quOIx8+cg4QrixU/kMVftdo569ZPIhJlqvep
 65CGiDBM0d6dCTz9AFj+BJNk8ooj2uM+GPMdtfccnOaLUAwHcjV72ydvn
 M/QFyCAkAzcakZAN3VCHAX+29uIy4K8FCmYO6uoozCc3dFmbDWjkLde/2 A==;
X-CSE-ConnectionGUID: Fzyxmd2YQVyYDfjwKW55oA==
X-CSE-MsgGUID: ZlgpD8ODSjSVdHgpM+h2ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77009307"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77009307"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:28:35 -0700
X-CSE-ConnectionGUID: znWdT2w+Tm6pQ4V88ngn3A==
X-CSE-MsgGUID: 4CtHXYJhT+CKwXuu3pAC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="223237436"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:28:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 03:28:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 03:28:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 03:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCFG/owuZQuAeoTwqvwPcPmP+yNXS0xEHCNuXOJMYOxQ0mAmsaChpjvEtfph5MmSYiObVOKh50e/HDP5CPJQ0fVkaZkXyH6TFjMs/OFd7YBTcsACRUsI1vF/P21jLVsgW+N0LA49lpA9oTlPAoHhHXQ6mcbXkxgoZ+w8yu5wprYiYDLJSOnfiqKC0FJSAJsEo8oFJsiKL6Pz6FIX7CBbZYB6GqkkH8ur8J8vROwSfi/apvzHKQHFzag17Kzy6VbG7P63tVZGmbGSTyZyKJQgreqaV4nxKR/hXwet4gDxfS7buORqwenzrcEfhN7mOC+DaN+zhfgRvCWvRnhXKAvohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjgG480ztzgzNpsxdAGnP62JDiDnBVs+1JhOPh+xSXg=;
 b=FQahVYgbfWgBsGla2gTuSXFdH6lFivnNlAdRdPH0aVeCSDMZJiiDRwaRtDHpNDJ9Nu0Hr54frgIyan3I0H3ZSje7ay5mXz2ZT/ov1/qt/n/dJilk2k6ScXicoR4jvD9LRDpN22PdcqsXYupH+mp3/dPNNpJ2HrHMyEOBee7udxxzQwDYUJ9vMK1V51itgx749wfCw9b0vGRq9oA7Q19NiA3sLCmNnf6mmM83+4M55qoLtlnVdawZ1JUBSVTAE+KSalGf6TYTg7y4Bs93eiUdQ3UIbUTFjbIZMWPExmcjMMR2QnZQt4a74PPv8t9v8gQ+jFznr91RjplEes00Tt+yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 10:28:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 10:28:32 +0000
Message-ID: <4d6348b7-de39-4cf1-8281-dbd12ec37938@intel.com>
Date: Thu, 12 Mar 2026 15:58:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Read accepted power limit for CRI
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>
References: <20260218114722.2215386-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260218114722.2215386-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 28aa6954-7704-4587-0b81-08de80221c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: /7HINMQXIBErfj4YKKtk7wUy3mnuTO4cu9PKxIHVWV553AOzuCeeUxP1O5oZIvrN5jLmgnVZi5XC2T4iZXO+m7BHcD+mfvdEy3z8YMkQzXCrtc8t6AXY7tIUvA1zwMRrrdWDtEygi/hN3cMUyhTzVBrBLuCPNbRA1NzbzPdVjPq7QHQbJUJm3rmk7xY0NLaxvA1zgku0YUs0DGQJEepUb1b2RSpG7UOlm5hRIC6rfZW1d3ESFzMyH9GqRLYaVNM11GiWfE1ikQcQrtqI6F70BDvp8vW0tS53kZzT+7ggO2+qdf1KrIKSFsSOfTIpAd8zHBHylP6UFBVFkQFp5ExJi/LlWw0DLLko6THVX//qCk/tRAlQiuk7YPcN/r6cwtDa31ZAOCM+XiCf2osbk+YbXP0N0wGZKuGW6ReEjcqpo+LihIljRo/z5t4PdajqoZ2JHTsGePbIW8XxSDm7JxpMxCeFJh5QXBaygbt6JgLKfrD55KyMWXxozePyYfe8we5AvxTwft3hDdsNFfQ+Aew8H7WxIRyGUaV62UpqTNjh0ksYAyRhIeLOiigh3cLGKBRgdkqLxJR7OoqMFh6d2Yhmy+VnrPC9wft0FAKw7oyzFN0eu+CCSPkS2cKbnW6+jwNllxHigZvY0kpzPUt76bedP5CnpKdyHZ5TihxupZwUJkMpnLToUYvL4sFVFgUbczlNHNbMQMzPjlfjgK7rT/WJm4tSEIHRM+EALswZxRzvPII=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHBtUkJUUzl3bFBwYzl4SUNHV2xmTUFoZWtSbCsvVjQ2RnVybEVQZDU5Tys4?=
 =?utf-8?B?Skd5RjB6a2NZMDhGMkdjd1ZCT055a2VWQUFwbW9ZdDNMczMzUFEvVUppN1Vr?=
 =?utf-8?B?KzIzeVZCRmE1UWMwRlF2bkFNa3BNeVVKME1jUy9DT3FuSCtzc0N3WHB0L3dE?=
 =?utf-8?B?SFd3bjM0OUhLZmVDYTJBVWJlOEdib1l2clFKSXo2Mkk4UHZBNEFtUTd5ZjJN?=
 =?utf-8?B?Q3RHbFF1OHNrVk5QYkF5UldsRVhOZnRVOWZvODVzN0Q2a0NwWWQ5cnhGazQw?=
 =?utf-8?B?OGMvbFR5RzMwcklaZWhCcmRzL05DL1NwYy80RURFbGNPRExEd0tVSUlKVytF?=
 =?utf-8?B?RkNPVkkxYUFLSTlKNEYreFV3NXN2WkJMRFJwcnlIZVFGc1NRTUtjM1JrdSt0?=
 =?utf-8?B?UE90MmIxbWYwUmI2L1NLVGVPRDI1Y2QwTVNYTGhwUmR0Sk1YKzZsYmR0eVBW?=
 =?utf-8?B?K09iRnFQSXBZT1drMXJaNXJPcFBUK0IwSzBLY2hmNytNWGRvVmRPVG5WdHNn?=
 =?utf-8?B?Nk5yVHBtMFdVblh1WHpLYjA1UGhHZ2h4RGhzM0tTdkZJWVlNWEtJTkE1QVl1?=
 =?utf-8?B?aVhYbkNSUGw1cjhtaWxJRFh3M0E3cHlDQ0RmZ2tHMU5zZFU0akVLU2ZiWjcy?=
 =?utf-8?B?N1NoNFliUEx6alFzN1JIWWdnVFhLZkoraGc2VHgwRVhRR0VxeEFWSjVFdUoz?=
 =?utf-8?B?djhxdVdNWkljY3RKb24wNXZMZU90bS9PV1V3NmoxdVhoSE5JdmFsdmMweWJo?=
 =?utf-8?B?ZUUvdjVKQmN1ekFWRndYOTdqWTJTZzhNU0xlc0hyWlhXU3lUZ0NVeVlyUmQ2?=
 =?utf-8?B?emdSR3prVEl6dmxOYU1IaEpTVlhENVZBY2c2c3ZjelREajhHaXlGOTQ4VTBa?=
 =?utf-8?B?SG1mS1hjSWlqemNDQnRhY3hrTXdGVklKR0RIazJjM0VteXdReWQyOUJSNVEw?=
 =?utf-8?B?VkJnNHF4VWVUTW9ianFiaGlLamJ2eHZCamlCUFh5cDR3N0VrWFhBSUZvUTAw?=
 =?utf-8?B?TWNmb09uRW5iOUtoN0R0MHJhWlQva2oycHd6cVI4c2pnV3h4U2p5QTZrb0E5?=
 =?utf-8?B?U0UvVzRoOG5HdUxXZW91ZkFHaXZaYmI1OHdSZHExTzFVbktlcXdKUC90WFJS?=
 =?utf-8?B?VmxQSWRIbmtHNG8yRUlXNVhBd0RHUTVxcWFyY05KbDQwT1p2bll6UzN4RWpn?=
 =?utf-8?B?VjgrUm9LdVpBanB4ZWtXMGhaZGZtZkp4WlRtcHdVd0svR20rcFFsN3k4c2xX?=
 =?utf-8?B?cXcvTzFGZG9POVpUTE16elZGcmd6eFdRSGt0OXM4Ty80WjVLdDhBY3FQbk9m?=
 =?utf-8?B?NnlzUThMTVd2YWk1K1NMa1Q0dDljWnZLSTk1cW9KYlF3aS9jL0ZyTzZkQ0s1?=
 =?utf-8?B?R3ZWUWZLNENpanhvTXRpbVVSOENNWmtzMThDalVndGlkaXBKZE5SMUZ0WStX?=
 =?utf-8?B?NFd2ZU9RUUlqVENGMXVaeElKdmpHMmlGY2dRc2pSQ0hXakJaZ3VhT2FpRlc0?=
 =?utf-8?B?VnRkbUJDeVpRWkhncFJNQWxVMlY1UlJSRW9iMkxKU3E5QWFwbEVRUjJUY240?=
 =?utf-8?B?VjBRVlVUSmEzVElXdGRFbW5iMEhLUVlqZndnQnpMU1Y1V25ReWt2SnVZczc1?=
 =?utf-8?B?bFNqRTdrclBJMWNMM3lRd2ZhWUFETGlGdTlRRUdsRG9BSWhuU0k5VUs1QjRz?=
 =?utf-8?B?N0ozYjNyS294WlVpYzlqK3QwZE96bW84SnVIaXlka29GVmFxYjltVFpxMU9r?=
 =?utf-8?B?UzQ3NkxwS3hKOFc0eFlOOWMzWkpUczdUZ2h1cm1BdVl1L2VhZnFiTUVmZWNv?=
 =?utf-8?B?OU5ELy9xdys2eGJNSFh5KzFSTW1WbHRVM0hWbjA3YkRuN21qVFNQcmtZYmdI?=
 =?utf-8?B?Y29mUklsVWRhRW10MTVJMnpkOWRFTEJFWFBqRVNkQXRrTi9hdWl2UTA5YW5i?=
 =?utf-8?B?NHczZGZVVmoyZnBFQUxIZERRVW9LRmJIb0cxNkF5czFYaDVveHZvSWphYXZz?=
 =?utf-8?B?UHc1UVFDenVuMUpRbnZLOHFtTGFUNnNOK3Z0UzdwWUx0SzNpazlOQUFucjMw?=
 =?utf-8?B?amwyMTVJc1hZbXVjK1VteVVpSWVPNEV5NFBpRW5YS2pjT0UybjBrN0drTUxY?=
 =?utf-8?B?T3ZWeTA1cTNaZkFybi94Yy9ITnRHSDNiS0VKM1V5Yk9xN09hZ2g5YlF3ZC9O?=
 =?utf-8?B?eE5GeEJLVWs0ZlNzb21PbjJKd0xtdmhEUjY5cWFCYVJvTDNiWXFhUmF2K04z?=
 =?utf-8?B?SDY0ekJ6WnhDMzdpdXhxRjhlUUZRNS94d0NiSnRXMGVuYitEcTV4WExBcUJa?=
 =?utf-8?B?TFVBclZ4aStvR0pFdEdnbStMMVAzb1hNeHdYNEZoemdZb0FPU0FSQT09?=
X-Exchange-RoutingPolicyChecked: g35YWHLtWOiYU7keOyMwlx5KkkhylzOX7+XXhObPhTo0L5TQ1gRXYMLEfFKztGzWVLZ6SIkHjONc0Ct4TC8+UM2iM7j+gOsr0SKktVCAGtMt5MILutOsLaHOvKjW5UeASPFINc0e6NmSP8A3GYgqEIKZu7dkuRCiCfL8mA66Gc4kTlcQEpYC+NFhk+ln/AHv4dnF8ZCWtj4lH3HomMKdIWD+KdzAWxenyB+/osaWYunyVsiGh8yjOCATQry6OBkEe4rlFPV2O+BRdusyEyrwG0dI5C8VRqTB6fFiiJSHlcV7XHWsWSg7NEKpRb7U5Rc2QLbVjDgR4VApHxEExkJupg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28aa6954-7704-4587-0b81-08de80221c2b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 10:28:32.6884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arw9lI9iW1aaT/hIdMRUXdHR93v2HPw7nLdeY7wcXZLDwKaIdz1c1EM/8ymxi+X/wdGZOXt/mDzdv/Q/T5gXHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
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


On 18-02-2026 17:17, Karthik Poosa wrote:
> Update xe_hwmon_pcode_read_power_limit to read the accepted
accepted by pcode firmware?
> power limit using the new mailbox param introduced from CRI.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c     | 5 +++--
>   drivers/gpu/drm/xe/xe_pcode_api.h | 3 ++-
>   2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index baf277955b33..8e1cbf7afed0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -192,8 +192,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>   						  READ_PSYSGPU_POWER_LIMIT :
>   						  READ_PACKAGE_POWER_LIMIT,
>   						  hwmon->boot_power_limit_read ?
> -						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
> -						  &val0, &val1);
> +						  (hwmon->xe->info.platform >= XE_CRESCENTISLAND ?
> +						   READ_PL_RESOLVED : READ_PL_FROM_PCODE) :

I think this handling is needed in xe_hwmon_pcode_rmw_power_limit() as 
well, especially when writing PWR_LIM_TIME.

Thanks,
Badal

> +						  READ_PL_FROM_FW), &val0, &val1);
>   
>   	if (ret) {
>   		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 85cc7478b787..636b9dfb11da 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -47,8 +47,9 @@
>   #define	WRITE_PSYSGPU_POWER_LIMIT		0x7
>   #define	READ_PACKAGE_POWER_LIMIT		0x8
>   #define	WRITE_PACKAGE_POWER_LIMIT		0x9
> -#define	READ_PL_FROM_FW				0x1
>   #define	READ_PL_FROM_PCODE			0x0
> +#define	READ_PL_FROM_FW				0x1
> +#define	READ_PL_RESOLVED			0x2
>   
>   #define   PCODE_THERMAL_INFO			0x25
>   #define     READ_THERMAL_LIMITS			0x0
