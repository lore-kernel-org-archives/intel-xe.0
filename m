Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0E6EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 15:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C0B10E0E3;
	Tue, 18 Jul 2023 15:01:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E5810E0E3
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689692489; x=1721228489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IhT/PaMt0qG5UhSfsTTPKlT8roUh5SblCZpJjsQ74gc=;
 b=f8UnIgdyuzZsNUZzDLQSuCXDSC8r4DuA2c98BITduCce9FgYijVy637u
 F6koXcwTq1jEyYbUDI95fBUOXiiWPmByJobq/7GQI6ETEjK8ff7ZKankX
 pZ1ngQAmyMBOTRzY2ocmp/VUkS4QFLJVoBQVzZyo4hGnJtNTRRbcEd3yn
 0DA780012j1d1cwe1Cta1MsfpvU4yF4pvC9H9m074KKCHhZPhOeehkLgP
 rSW4nNX8/QVA4pfPi0Z3mPBo9jX078MrGN54QgoO9RsOAQgKLuZHi8V6h
 QD4oRQktGTxTn8pwJvhzgxi/7+GYnQwEcSR0yzH+uWE99bj2FStyRJ2XN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346527759"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="346527759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 08:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700937831"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="700937831"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 08:01:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:01:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 08:01:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 08:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0yiNEW3va7omFaK/niSuHnWfTwD9YLT1ddkgam8CuaVBNCMu4c79r3yJIg/hGKOx3YngvhJqi8GfH6JTmUqhLCZPxe5EyjbuHUEpDBQpKq+VXQOUzKLU3HqvY9cvTOeLjOPNz25BdnPCnahhHoqEY1PLBzHBhogqStd2rR15qHNSkOjKaDfk7POk4eG/Y3SqRd8CnnOL4paiuGX7iGDOMb2QPbC9K9fSq0UuaHgjNBLZU/sLRAzSHtcnXPCKXq+si1ZlJtMDVYFA/dwmEjBJkKjAeV7JPxhH5zDnMxmYZ2s3VXeffCPNF4LMZ/oVL8HJnSIX1/ILxJ6G7dUltJg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EgIr7AGn8gXJtOtmhx0yCebr0uU1rozXVzJvC9YSFw=;
 b=Ju6jQOCA2g7KNg3gsdqSzhnohSNYnB+jabta5bxhIAkGI4+dsH6xj1FVDBeQzqNXf6lSFQpAGWFxOL4cDmeWpLS2+EjNCCU7uLyzQZ8bEiz6zHGsR1OmrsPRjqF98Z7ntmpPFt1qtDcjM0IqdZf8v8ZjYVnWZDfYAj1DvIDNlzpKFFrndMtM2aPAIsBn/Zc+ISIa0cRVV9pCegzvRvDCyL5sSeEN8mScjNPyZHTpcPf+MAS+Pp3MK+uhk9qX5tK4OckXJ+0ajWtl8emGt1ER1Yd0jTX7YqrboESu8ElwyRoHz7Z51V1rutbPb5IhkdsJ7Lpasf3lwL0NwePAsooAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL1PR11MB5383.namprd11.prod.outlook.com (2603:10b6:208:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 15:01:18 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8f69:4054:118d:a19b%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:01:18 +0000
Message-ID: <5a0596a0-8d02-9747-601b-aa77a5c6b0c1@intel.com>
Date: Tue, 18 Jul 2023 20:31:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL1PR11MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: 781a9d58-fe17-4ee8-5d20-08db879fd6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Yfhg0+NVl8szGvBXuZ1qOAKALTcFYTW//NGGFklQG5k5m/sPGM4gI1dLh2XkvEMzZ0viPRFjACARZcHPy+0hbltc1gVagjqo5lrb5cqJijnd9KW+n6EfFTHL5tDx2wgF1BQnM0DHhHKhoJoQq6BYLwj94G4W5l2FHi1kFjqg12jR9cdXgfrt1qFCPZEF5uFMxSgZZ8IGRRVKNwdiyUAXybOZn43SyiY2NDbubjqzGI8cxwujLKR8pDxvthDnz2niqYX+68KxH8sY5e414ZTCnL7Pau6NVIMc2OTbfAC9VejlNllj77Xeeau35c/GcxxeHYQX7eHKzwuYtgeF3+2xwvNw8ewuiKiiJ760FJydBfO2zR41DO1cUkb/iYEhPOTKv6TrboQshAra7skT/+E2RB3zYAm/VZHPDUzGkCvtgVBdU0RwFMZhxf0MRWrQQH/OnQhmil0L7dt9z9t3CCjUguqiZfEwSJUxYdDoWWGsza1AXGyrN7+0KnyAztFW6jl/xs2mjdc5tjE3tYzBw34xV4e9BVq+oXWML1NJb/8N9bJ8ayo7FaChhy1Hrw5r7Oy76uSXjszL0wKpr8/VKXIyETw3T0xgEjJiiCLLbqNmGSPY0mGk8W5MWwF2TJfqsaXAJFKB3tV0pi/EKt7FC5TDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(2906002)(107886003)(53546011)(6512007)(6506007)(26005)(82960400001)(8676002)(316002)(5660300002)(8936002)(4326008)(41300700001)(38100700002)(6666004)(66946007)(54906003)(66476007)(36756003)(66556008)(478600001)(31686004)(83380400001)(31696002)(2616005)(86362001)(6486002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUoyWmVSQVRWcVYyOTFSK3pMNGxTT25qNWl6RFNCTUVTeUN0ZlNGZ2xQZHdK?=
 =?utf-8?B?WStKRi9PcTVmb2xENnk3UmxZT3Boc2NSRDdCQXpNUTYrVnkwb1BNMVNUUnJ4?=
 =?utf-8?B?SmpRQWpVcEZ6bjBhdHFVNmNlbTVGaGVLN3AvR3MyUUVVMm5IMksyTGdTK25v?=
 =?utf-8?B?NGRhNTdXL0VTRkRCVnNzQnhRUGhmMHA2Y3VzckFXc0ZYSVNRalhTRzhyWTAy?=
 =?utf-8?B?dFpCY2dqL21pVzY5eDdFZ2RHQ1EyTm1PSUFyOWFJYWhiaFU0eld6SFYyZGk2?=
 =?utf-8?B?TkgwK2pXbG9pdlMyYW42REV3U2xzckZPbzlNN1RQMExEaEVwVkhoV1F6aE1h?=
 =?utf-8?B?TlNRQ2ZxWlZzdmZETEtVOGZnRndkcFdBKzF2K1p3WE1YT1h6Uk5xSWg5Z1c2?=
 =?utf-8?B?SXVDOEpUd3A1MkVnMEhObStvcittQmNOOFFDMTQxSjF3L1dlNisweThYU0lz?=
 =?utf-8?B?QXlaekdwU1lIMmhQRGczODB2Wm1hVDZXUzM5SVFJTHNkQUV0cHFJZmRuMUJK?=
 =?utf-8?B?a1o2eVc4a0pKL3gxd05hYlZqODFWSDZYTEFlUGF1dkN1MGpjOTd2NWxEZllo?=
 =?utf-8?B?ZFpwcFAveTJlckpQZUFaaE5ReDhITUU0bWkvWjNKNWt6WXd2dG1HNjViNm9o?=
 =?utf-8?B?cE1wRnBjODJzRGxkVzN5ZWJsTFJQRC9hVFJld2dEb1FGa0FmS0R3MHh6dGlr?=
 =?utf-8?B?Q0luWm54Sm9reEFMcngxSTdLdlN6dVVvSFViVmdmR0s0b3lWbmJYOWpqTHBn?=
 =?utf-8?B?alluV2h4aG5ocDB4VTczNTBNakluemJkSnFyQzhRaXp5RDF2OFZnZGF2SVRU?=
 =?utf-8?B?Wko2RzBDTWVyY1RwcGFGM2dCc1J5MEh0T2JFUHY3M0FlT3IvWHF6Sy9samNJ?=
 =?utf-8?B?ajhVVkZOMWIrcVcxTS9JZ3E2MjgxK244d0xMYUxVbThVemRXUEdHbGZUUFpR?=
 =?utf-8?B?SGRjVkpneExPdjRoczM1bVpmWDd2bnpBb1VlN2pld3RzYmppdjVXdmYrRUZv?=
 =?utf-8?B?cDJ5TXM3SXNvTVRFSHlZcUlMa0d1RGhmTFdGMUlUQnkwOFdTL294OS9ZeHdR?=
 =?utf-8?B?ZlYyNGhoT3pwMGR3TXVNa1VwMk4rbnlIem5Zc1hja292WEVwUVZ3TmdpQnhw?=
 =?utf-8?B?T0NVdDV5MVBxbXY3ZkZsMGw0K0lyaklGTlJHbG1NSDJWVnQ5WnZMODJrczQ1?=
 =?utf-8?B?MjJaUkpoTGUzdG9yYmhERzM5KzhDeHBvOWo1WmdJUXZPUVZCN3E2U0I4NTBG?=
 =?utf-8?B?TVZKTzlUcmU2OUc1WjVxeXo5RGtzZmQvQmEzeVNwTkR6WTRzSXdNaDA3am82?=
 =?utf-8?B?YUg3SEE3ckVHcGlpSEp2Z090YlFxVHVVQlhzK1ZCMU5EczJ2THRWUGIzZUtT?=
 =?utf-8?B?ZTRvWTdmRWhabitYM1djTGxjMU5Ud1BycVhZY2lvZkN4a1JxOHNxRWFUc0pT?=
 =?utf-8?B?QUhFc3kwWVJoU2lmaVRhWWIyMzdjUlhsWm5ld0sxeXBlOEVTMm5hdU9rTkJD?=
 =?utf-8?B?aHU2YUtQamRVR2Z4Y2QzcG9oVUxpZ1haS3JtM2hDYmNPQ0F6dVdhQlZES2lD?=
 =?utf-8?B?NTRpVjJSa3lab2lnV0pmeEVGSzFESkUyeGJBNElSZHZzYW9sVHZ5OWlTdjJL?=
 =?utf-8?B?S1k2UzZKQngyWGNKZ0EzcVljdERvaXJ3Z1l2bWtYSy9CZnVUQXhjY011dUI2?=
 =?utf-8?B?VkxOSytIV253NzFnNHNkeUVxKzlrdUJNV1EyUHlMOEZrWUFOeVN4VEo4MjN2?=
 =?utf-8?B?c0JaVFkyT2Z3NDlmdnFlT0dmZGF4NXQwTVU2eGt2NHhoSUcyaEd3UEVVZ1k4?=
 =?utf-8?B?M24vOWZPVmhJcUNoSXo3ZGExc2hzaTZmempVV3R1TjA1dTR4WEw1alBiK05X?=
 =?utf-8?B?K1JLalA3WUFBK1BkYWh2aFB3djdsSHVYaG9GNENNTTFzQTR3YkdRU3BNMHVH?=
 =?utf-8?B?aEJER24wMmJlUTZPd0M5Smt5MllOQ1UzVGxyME9hcXFDTlE5WkQxY2JMSkJK?=
 =?utf-8?B?eS9lVk0yYndScHpFbFRyb0Izc2lwUlI1S2lTUWZBUGdIZ1NwSFpyanNnRUFK?=
 =?utf-8?B?ajFnZDFaYk9zbHYvbG0yTC9WU2FSTFBEMjMvZ1VVVnhhMWM3MWplUmZVWjM1?=
 =?utf-8?B?YlQ2Y3NIRUx3SjdjRDNYQjJaNHJHTEtNUXZXczdEcVFhaXZNalcxaklaV1J4?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 781a9d58-fe17-4ee8-5d20-08db879fd6f6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:01:18.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf/tHqovU+9uIAFdxEo3ErsLKtXLtEEj9Cqe/VneaX21qAXNi4hrNsjH5pI1XrnPD8hgovj5nIzwh+vzCBdgpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5383
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt
 reset fails
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 18-07-2023 19:02, Himal Prasad Ghimiray wrote:
> Send uevent in case of gt reset failure. This intimation can be used by
> userspace monitoring tool to do the device level reset/reboot
> when GT reset fails. udevadm can be used to monitor the uevents.
> 
> v2:
> -Add NULL check for xe_gt_hw_engine return(Aravind)
> -Arrange variables in Christmas tree order(Tejas)
> -Check GUC_GSC_OTHER_CLASS(Tejas)
Commit message 1 and 3 are not applicable any more.
> 
> v3:
> - Rebase
> - Remove notification for engine reset failure (Rodrigo)
> 
> v4
> - Rectify the comments in header file.
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Remove duplicate Signed-off-by:
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
>   include/uapi/drm/xe_drm.h  |  8 ++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a21d44bfe9e8..1db4d610f2fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>   #include <linux/minmax.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>   
>   #include "regs/xe_gt_regs.h"
>   #include "xe_bb.h"
> @@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
>   	return 0;
>   }
>   
> +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] = XE_RESET_FAILED_UEVENT "=1";
> +	reset_event[1] = "RESET_ENABLED=1";
> +	reset_event[2] = "RESET_UNIT=gt";
> +	reset_event[3] = kasprintf(GFP_KERNEL, "RESET_ID=%d", id);
> +	reset_event[4] = NULL;
May be add empty line here.
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_event);
> +
> +	kfree(reset_event[3]);
> +}
> +
>   static int gt_reset(struct xe_gt *gt)
>   {
>   	int err;
> @@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>   
> +	/* Notify userspace about gt reset failure */
> +	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
> +
>   	return err;
>   }
>   
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 347351a8f618..c28bb54812e5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -16,6 +16,14 @@ extern "C" {
>    * subject to backwards-compatibility constraints.
>    */
>   
> +/*
> + * Uevents generated by xe on it's device node.
s/Uevents/Uevent/ ?
> + *
> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
> + * gt fails. The value supplied with the event is always 1.
> + */
> +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> +
Regards,
Badal
>   /**
>    * struct xe_user_extension - Base class for defining a chain of extensions
>    *
