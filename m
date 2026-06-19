Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F635CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 18:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DAC10E0E4;
	Fri, 19 Jun 2026 18:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gACXTTtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D720F10E0E4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781892127; x=1813428127;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qiuiGFhxVCIL1Vkoo790LOQfWboJExM7/SPAmpFhso4=;
 b=gACXTTtYmH+tYiU++l+zcEme3Tq1Ax0jqNlt2teIq/JWRgl3l//aBQ3K
 0LDnSwgyNVAE1ByWND5BuoFBZ7iW1HYK68tBoAY+cbZlUnHb6N5a6Z907
 xKPWVEF3e7MPTS/fb1Q1QXLIC+dv/uoTvvw+uJRk+KpwoV0/MYjV7CZxH
 MGdd0Uk/zX6628cuI3nQFY+ndmDoSOaeLRH42ob5zdB3Lvje+2hC6fOpr
 MxxS0tKMhGq3iGQIHQQHItq+xcFMmh9gIBnHW+HL/BKldxM3PJT9YzlpN
 YOqflsPpWBm+q7UfVZN/wFqeZFwbG4Tap7gtCS4gWbeZfbY6AjlqO2BIo w==;
X-CSE-ConnectionGUID: nSTBswrxT9aNi/dPMN5JQg==
X-CSE-MsgGUID: vwuObjprTWGj+aWpUwnF9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="86420646"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="86420646"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:02:07 -0700
X-CSE-ConnectionGUID: j2xFp9NTR7u/uQhap2531Q==
X-CSE-MsgGUID: 1Wi/h7/DRz2XTjqi2On7YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="246333035"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 11:02:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:02:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 11:02:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 11:02:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t00eZaIfCJdZi3skgPhN/pc9K4dTBP3QuMICuLfcDQCfv4g4tD/tPTET7oOSdPpeV1fypNIGBglVICB7uz5IXIfs9JCjYfkcoeG5fcZdH1zfe5T8cx3+x2HAiophn2ysD1FU2ncslDxKkDDgr30LTZzGA8OnfNY3oGK8sdmK9xTBWzPgSHAXVxZLXQuU0mrDHpDYzkcqU+oHPhOrsqtDUtP1PYWfh6rMrFzgd5/V7buSDhv8E3kVI3h5ECXGxNxnwlWMxqiSKip9P4q2eNCkKcH5+SHMPkbngeOSepR0rhZD4GoZBJPfTREGrrBS3PvXzLRy+VBMxW21yzpOKDcdQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d73gv7RvSMOObFKvYbkQw+8q9NYufijJBsk+eyTqO1s=;
 b=K0a7YULZWsooBOmQE20O9NAumPN4UQkjAiohxsIwbXiWPRICL3YF2yXANOoxGQLprSsWpfWqUbhTbS13Z3CQgTmfXdcfEEDl5HTGu7mNTMRdelr6EfNX7Bj39E1ZVSqoRmaE6nu75wuMUUl6UPl9L5VqWFzRxeqqHtH9N8jXGa/pLnuTL9Slz3KJv+ow/yXn2JBRRGB7f3ZJyfxcJ66yc5+WtBU6CvywptkpqetMwsi2bD6aFHfHsjc0FybpyDuErnrhPUXLFN6ax8+NSs3dXBzxurnp/xMgBxTwBxX+mDSQT/y/HmPr52bWJ8FId1mZk/puLjluhXiVBBgGgwzD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 18:01:58 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 18:01:57 +0000
Message-ID: <e32aa8d8-a503-453f-b462-b164f943815e@intel.com>
Date: Fri, 19 Jun 2026 23:31:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/xe: Add platform-level step info to xe_probed_info
To: <intel-xe@lists.freedesktop.org>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-5-21e83e188e60@intel.com>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-5-21e83e188e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::6) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|IA3PR11MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 258bbcd0-2c89-4836-cd64-08dece2cdab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jQv16tQ1q/ZVIHtrMsP2kdaETbr7MsnS/+/CPiA2EjFZKe6t9ptd6xJG627C08TqjkM9R6MDF+5SGY+TpnOADZj1e6lC5DSmwSwa0sNBzhrqMXnO4YpyVPd6GN4hbuU6IPLFC7x2+RST+rtWVyCqS0tDCsSmPtngLAD7qa4VoKB/3x/Rc+mfwOp4smV+Lh3jlVm3SrVUixqN5xy9oEzMyTh9nMw+0DzO/V9EmV80fum9XfZJEn1ZTTpBxjy5Hod0GyPYviCOzQ6qqsXu/3vkqUHSX0yexh+JHflg+bEQ3RgHk7Kf48JpP2h54v4MSO+J7JEJxyNZW///PyQ8RkDEKo89i/yFl2csPoyIfBimjrDR3VwQH+6N3Foed3sxl/SA0lim24zZ337GLnUGt3wy62S3S5lJm9yK/hCAzwbdjy+SB7r65fvm0IM/IeIggyMshTwqBeUOJNwb5V95XDwLUUQlePJASof3a/YZLHY5laNpW3xfNfyf2dDsm8B6zqHyB680s/+dNdjdjQXRylu2uIJRSNaxQ3B3+kX89CbS2ZeQzQ2vPX7A4jUOm6SgDURZeuuW/IIy/yPDchQxCbUX5/mvSut5Pkypbwiu4CpFq/ZESaokL20KwB63QdM7Qxqx1kgt2ExvJgsQaGV9OcYsW/HqbH/i3Rte5vWwaSitIFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXdxdDMvOUdvM3RKK1l3WHBiYmxwcFlxbDZBOG5LaFBuM3lrdXdCQ2ZZNE81?=
 =?utf-8?B?RGQycnNGMkI1Y1Q4c1prYzJKekhuN1RHRDZSRGFPSlpZcnd2SFNVemptbU0x?=
 =?utf-8?B?RTlPbFJuMFpTMFRDWXNHVGtCZUloYVRaelk4ZW1xaHNUQmZUR0xDS2FCWDVh?=
 =?utf-8?B?M1dBRTZSRGcyeFdGa3VGeXh4MVdiaEFEV25VMGkrU21aajdzdHVWNGRvcGpS?=
 =?utf-8?B?b21PZ1RsNTEvTDc0RTNzVDliTEZHa1JPVmtuaVg4djNaang2di9TUVo4TzlY?=
 =?utf-8?B?c050WStEQVg0MUIzVjhNMTdMaEJieXo3YVMvTVdQRzg2MFBWYWRESlZ5UEht?=
 =?utf-8?B?N3ZsUUt6aWFiQnQ2YTA0Z3dXZVlnU25hd1RNREhsRU1IckwxQURJb3NqeEZm?=
 =?utf-8?B?UEpCdXJBZllZRnRSVUxPRWtDMFM3TVNtNnQxWHd0aHlyMm8xTkszdVcwNXFH?=
 =?utf-8?B?QlRKYkZ1ZFZuZW5vZEswRmN5MDdENGdqWXVWL3Zrcy9pb0E5MTlKb2dmSEw3?=
 =?utf-8?B?czU0MkJubkh6aGtOcU5jc2xmTmN1QWZ3YzVOUmE3TS8xU1dKb0I2eDgrSGIv?=
 =?utf-8?B?NTZlMnBwQWtBSEV4aGx0d3RvNDBrRlROVlJSOWxyZGNya1ZhUDNJaEtzQnJB?=
 =?utf-8?B?SGJZZnZMbkE0L1huWUd1V1kraG82ZzNCVGI2by9BeWFlMlhLTFVQamhlK01p?=
 =?utf-8?B?NEZUQmhpaDgyOU5FeENjYWlid2xLc3Y2N1lENnVlVnVIc2NVeVpRUVhyMTJL?=
 =?utf-8?B?R0lrMkFjdERTK0pENDMxdTNIbXdtMXRERmlVZ1RXNUxydmVQbndxUDB0Mys0?=
 =?utf-8?B?STBrc2pUbTFyQWdRUHkweWJ2L0Y5U25zU1ZQMTduU0tUVVdTNXpDQ3c4SUtl?=
 =?utf-8?B?Y0doWS9zblZzZ1VORGYxNlE4RU1EMXgzRFg1V1hXK2ZEWC9DaHJKZjRrdnIr?=
 =?utf-8?B?QkY5d1RNaFNISjB3K3JTdXh2UTVwN0dUUVczZHMrRGl2WUlNNVJXVmRvZnJO?=
 =?utf-8?B?WmErdk5VMGt6TmRPQXBxb09hNk1kL0ptYytpT1VuZnVYVXNVeGUydDlYR0ww?=
 =?utf-8?B?alcyVERtdWFid0w3MWI2enpTM0JRNmd1aXcraWF1V0JDcjdzaUo4VXlWaCtm?=
 =?utf-8?B?QUtnSkp3QmR5S1dhc0lMa3NKTnVQSmxPVWQxYXlQMWdKbGZPRHQrUDhxY2VU?=
 =?utf-8?B?UHBsWmVOQ2ZhMmJmZ0tNaGFMdnBSanMxRnZ5eWZqUGhmRkdxMU5QZVFEWFVS?=
 =?utf-8?B?UnhLc1hrbzRZajUyRklNVTduVEdzZEdxckNnZmJtdFFucVA4S0p2Y1k3SVJZ?=
 =?utf-8?B?b01SSXZaRjAvZ2pzQ1lqVmpZbXBmVHJYakZlTUxMTlptSVVKelJGS0pjL0Za?=
 =?utf-8?B?dzFWM21vcmlib2ZBZnBaZmkrSFhXSlNYKzdJWm5zODY2ditmdVQxV3RiN3VR?=
 =?utf-8?B?R0xjNmlhYW1jRHBhd1NETnFOTTBkZ2VYbEdlYmpKQ25DK0xhRjV0czlwYjBi?=
 =?utf-8?B?WHF5V3pPN0lyanlxQWpibllDdDBRUHZUZFFlNTFXMlR3c0szMGJVWHN6Z3Fi?=
 =?utf-8?B?Tnp3dWpNSWJSWmVHcWg2am82MzQ0Rk5rRmh6dkdoVEJ3OFZ6MjBSR1JhN2FW?=
 =?utf-8?B?ZVRJMDVLYlpaRHlXT3Y1UFFSTXNkbmI4UHJTQUxnRDlIYmI0NzNzNUc3eTJh?=
 =?utf-8?B?aWgzSHpuOEdFcXRGUWJ2alhUdE5kZkx2cmxiaGFYRzZpU1JJK1R6elpNdXls?=
 =?utf-8?B?cHdFaXg1OWJ5VW1RNjFKY29NRXFwYVByeXlJK3RCbWdrSGJsa0dYdERDQWZJ?=
 =?utf-8?B?N3JtZG03cVp6bnkvdnFrZzBxQ0JTSitSNG00bWwwUXBjVy9paW9GeG5yMUlG?=
 =?utf-8?B?bG9seTRPKzBZOXBTMzBPV3ErK3dlTGpNdGtFTmtFbHlyZGphK0htL1gxSW9T?=
 =?utf-8?B?ZHRBMW9Ud3FxSWdUREpKamhBdWJSb29WQ0d2Uk50bW9EaHg4UnB5RHhUNEVy?=
 =?utf-8?B?SDc2akh0MEU3NnQzNGNkSEdEUnl3UnRqaHlrdm9MK1ZwQU5wMUFKSVJqbnRN?=
 =?utf-8?B?eFBqaWh1K1RhSjMrd1hiYnVwQU1IS2ZNL3RLWW9ZSjF0RFlVV3ZLME14OFlE?=
 =?utf-8?B?bU9yb0FiTExGVjVqUEp5OTVxUVVTUm03MGludThXM3JpcTRpOXJsNEh6Y2d2?=
 =?utf-8?B?VTdyWG1aclhVaGNYUXFKUjZyZFB4WWN6WFRqWWF2K2ZyZlJCRmIvUXVwZU1m?=
 =?utf-8?B?TVBlRGNNbHpkSzU2WTRobi9FamJHYWJ6bjB6SFZQcThXMGsveTNBVm03NXFN?=
 =?utf-8?B?Z1BTSUdTS0JXM0lldzRNcjVJNTE4YlNiS3NUcndPcU1hb1FhRzU0dlJ3MHJJ?=
 =?utf-8?Q?iAjcSVsheax4nL+U=3D?=
X-Exchange-RoutingPolicyChecked: ZuFMrIjlHMMX1YXPvASjngCOmBe/UBM1Uglj0fbStAnQ52cX2MaaxXePXCXwyx4PbbtzwqOZyKic+Cp0xXwqAnjRsma80XMXJqpA79sDT+DRfhN7nlqP31ZsOIMfZcupQREilN+PFisO3QJEp0ImfryYgc5RmkpKZaFlUZV2v9iOG5DwkJmvHRDx11Z/V0jdXLDLmgyer7O8Lg1UML/52G3U+/Gy1ae9JuQqtBYrPgzokAIViO0Mjj2uLkB+cw8JxPwwaLssIH9+3StsSQh9kUCJM3XwwuGNDH6zqHbLAYqx1f6JDDo7bcaMBnl5iEHMHKy7Tc5H4IRu7UMYTKVn2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 258bbcd0-2c89-4836-cd64-08dece2cdab4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 18:01:57.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9R8Ezc1jhxfxXYiAvWXXIFZkrKRz3ixP0O6ZEBjtPzhMdjKKSfCVSGH4R7WzkRUfRqIb909wW253rQ1OZ3eWv7NzZM3+/2vilYmBnhSjUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
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



On 10-Jun-26 1:47 AM, Gustavo Sousa wrote:
> The platform-level step information depends on the PCI revid and, as
> such, should be probed in xe_probe_info_early() instead of
> xe_info_init_early().  Move the code accordingly.
		       ^^> 			
> Note that we currently only update probed_info->step.platform as part
> of this change.  We will deal with the other fields of
		 ^^> probed_info->step as a follow-up change, which will be tied to the
> probing of graphics and media IPs.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Commit description has some space that could be taken care of at the 
time of merged.

LGTM,
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Dnyaneshwar,

> ---
>   drivers/gpu/drm/xe/xe_pci.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c5c75fbfa0e2..1c53a25442a9 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -730,12 +730,14 @@ static int handle_gmdid(struct xe_device *xe,
>   struct xe_probed_info {
>   	u16 devid;
>   	u8 revid;
> +	struct xe_step_info step;
>   };
>   
>   /*
>    * Probe from the hardware the info required by xe_info_init_early().
>    */
>   static int xe_probe_info_early(struct xe_device *xe,
> +			       const struct xe_device_desc *desc,
>   			       struct xe_probed_info *probed_info)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -743,6 +745,8 @@ static int xe_probe_info_early(struct xe_device *xe,
>   	probed_info->devid = pdev->device;
>   	probed_info->revid = pdev->revision;
>   
> +	xe_step_platform_get(desc->platform, probed_info->revid, &probed_info->step);
> +
>   	return 0;
>   }
>   
> @@ -759,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
>   
>   	xe->info.devid = probed_info->devid;
>   	xe->info.revid = probed_info->revid;
> +	xe->info.step.platform = probed_info->step.platform;
>   
>   	xe->info.platform_name = desc->platform_name;
>   	xe->info.platform = desc->platform;
> @@ -808,8 +813,6 @@ static int xe_info_init_early(struct xe_device *xe,
>   	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>   	xe->info.tile_count = 1 + desc->max_remote_tiles;
>   
> -	xe_step_platform_get(xe->info.platform, xe->info.revid, &xe->info.step);
> -
>   	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>   	if (err)
>   		return err;
> @@ -1139,7 +1142,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   
>   	pci_set_master(pdev);
>   
> -	err = xe_probe_info_early(xe, &probed_info);
> +	err = xe_probe_info_early(xe, desc, &probed_info);
>   	if (err)
>   		return err;
>   
> 

