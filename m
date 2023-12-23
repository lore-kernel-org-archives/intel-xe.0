Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C94C46CD2
	for <intel-xe@archiver.kernel.org>; Sat, 23 Dec 2023 00:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B4210E023;
	Sat, 23 Dec 2023 00:41:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A0110E023
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Dec 2023 00:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703292063; x=1734828063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zW5ucxisj28vcup6UdWJ0dUzoMoBYw40e8+WKkcJjTE=;
 b=Ts4qsEdcP7jI5QVe5zrUI7kR1d025R/QZP5RvTqC9xiRsR0kIirjMtph
 7jNV46a8mIqcsMqs/0a+NoJhhQpJwjboePBT3hPy3SqLZpyGBYmmjAENA
 YehT7VwnGTytQHCuSbDmDtp7kaei4JiK2YRsK6WXLGiZOjS4Yc/5RGEul
 RSogUOjFkbSsICZ8raTv+5nXecEHRKF3rEAAHcmYQSv049LeKEw4Tr5wt
 fa8Ey/NqB+6t3JmCjV4+U8qnr73O8v4DUiNAOCQmUMU8lUDXX0LJ7JScj
 W1vSGkIu9Tia7ZeZf3liTql9uhBLhJQRg5lIhFlCgTNuwcGLVyfA0h990 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="399998590"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="399998590"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 16:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="811491151"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="811491151"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 16:41:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 16:41:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 16:41:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 16:41:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 16:41:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVsZhyCy18yHRO2PTCqLifRWtoAriTYEBSj/eFxC+/+rjv7WQlv5/s4KzJJmu5Re0NoePCSxugzxnwdUV92iqD/b6Hu5N00XOLNc2tkkelxv4mJLM7fRD3ClMzBm2B1a5Iei1UVWzmp8ghetEwTgUYWaTxtnu4IbjPU/wC/d21RDPJ9/TdpY3tuqCfM2o6htXlPQ/nNx2rgltAj1+9RZo8z22W+kBLtYA1Be2cDcMSrF/ML8/Co8/llwRlCX7XD2+flL2lT+Mppm06IzlosuG10F4FsrsZAtCGcKVDobH3d9YIqrctM7dO1nIeSFptJIxSo3imkv93WEFeWIbblGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjPwFXOhhqr+d/A1+xLvNIEDaIm/a2CKwlqFTn+CRrI=;
 b=fcp7ym0v9/z9JNL34Onz1rF0DK1PYSScqP+SSjkJ4EhuuyJRtldn1V5IKqnsocUM9hAxXcS0TuYx/rn2elkBIZR+NpmiGnX9IybdSZXZmriPLLiQNSw0jbe5KBl8QjoJ6mvkdTltzGx/Bx2/+m/EDixXoSVCjwcMYrxRCGXsIkYNYUF9pmmoTLhfeM4kPMeghGt6p7eR2GtambQLc2bqVlFxPXxKv9dHLlbi6BHThpWgG+2Oq8JiY8P1L2i68eArdV/q+PA6FT4O/EiH6hBY9dgCkII2J1v18wtPmHrRQh2xQjRF3eKm70sJEip6xyZKGGUjPCdcJq9EZowhQW2Veg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CH3PR11MB8494.namprd11.prod.outlook.com (2603:10b6:610:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.22; Sat, 23 Dec
 2023 00:41:00 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.022; Sat, 23 Dec 2023
 00:40:59 +0000
Date: Fri, 22 Dec 2023 16:40:47 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 14/17] drm/xe/oa/uapi: Query OA unit properties
Message-ID: <ZYYsj+nKv6SAtVWu@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-15-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-15-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CH3PR11MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 6238d342-c569-4526-3964-08dc034fd47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJFhqrUDRBh+JHOoV5tPRVyXjrd1jiHSplZQQwICZmEZZ61mQyLUszOuoIeZ6v6sgH5XeBEkVhMg7UaprCQLiCG0xrUjNGUkGpEXjdRANoa7dCza4sgEX+ev3IypfdlmdLzn9R4EgA/2OFOkZ3BkPBmzmRZNGZVX35gDlNMQ6kz551N2eu5HFG6jlGQ/Bn+f9VUbQw5GA3xR13K18M8S+sd1uJEkmWVrkHsm0cYDCXb9ZaEfS9KpetQTtJE9e0glZpMPURK0YvpT8RrKy4dlt16tcVKOM3RAQdfhGW6zRLvApBkuFlrFUgIuc+AisSGEUmS7NtIs6AIaAAJWHpolM+zulHY3fbFR0gDF+rsJrqw43DOTAiUCQTnr7ge2aIuiSCWYmk1mYlcHc6CJmM18HBfzi2Yl9oxk9U8ycXPak1rJR5u2f+KJpZ4uIxjnKWJaymTILduMsDPnt+e0deJmNzlVCOZYEH3lm4Wn4pVpR1+qNIePIotjWM24kWKIKiyBLKKxYRfUly3eaWhTu7JPaAewFPLijM3nslFp6axFYv3dKnsdJlZzWDeeE8uRosJtpxL4sfVVfI6otQ00++LxQpxhYuQay3vy8A9hH8+ncInllHnllReul0iXwupz5Mo2syRlqsDX43aw23pQX1t3hs0MGy1YuAO5zg1l0WvucsP5+s2uvzLJ1mXt1ss1oTXx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(39860400002)(136003)(346002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(82960400001)(478600001)(2906002)(6486002)(6506007)(9686003)(6512007)(6666004)(66476007)(66556008)(6636002)(66946007)(8676002)(8936002)(6862004)(4326008)(316002)(5660300002)(41300700001)(83380400001)(33716001)(26005)(86362001)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1U4d3dPM0FjWjg2aXRqaHg5Vi9MNzRqYWNXd1h1bXk5UXJJOHNNUDQvQ2t6?=
 =?utf-8?B?TERGQVpSS0phQ0NFQnRxNHIwdTJNMCtlYkRuTFVtYnp6TWZKQzhKVnZzVjdh?=
 =?utf-8?B?MVFwQWMwR1loeG13cXdtVjd3RmJmYmkxc3BpODd1R2FmeE1EdXB0SDI0bWM3?=
 =?utf-8?B?dTN4MDJKNGY1SlVYODc2Q012WnBuZzUzVFNaSWZUUXJDaTlZRHBlVkZrNHpX?=
 =?utf-8?B?MzVsS1BzNjBKQ0NxNmw5b3V2WGpESjBPa1EwQ1BpRkdwYjAxNmdQZkZSU3pv?=
 =?utf-8?B?WUZMekRUVWU3ZjhyeFdGRUJEbTc2QlgwUTU4WTZBalY0S0hRajFSdEZYdFp4?=
 =?utf-8?B?Q1ZNRWZWOWh3MzZ2ekpLanIySTM5RmM1d2FQbjd4UlJRM1F5RXo2K1RENWd5?=
 =?utf-8?B?T3c0U0lJWGErVEFDVVlCVTBwRmNtY1JEZjdNY0ZCYkI1K3F3dFFFQmRjVzZx?=
 =?utf-8?B?MkJCQXpHNDZEUHpDUFNucmZ2WU4yVjdRWU40RGozWnMzMXlHdnlEOHZSbnRC?=
 =?utf-8?B?eGJZd2hVUk1hOHR1YlQ0VjNjMHBjc3drTGF5Q1BWUm5ZNnVIQWxUSUlPRnNT?=
 =?utf-8?B?Znl4TDlvZFlEaFFqSWw5UG1VaFkrSy9wQXY1VElXT3pIMTQyVmlwcjFjZGtw?=
 =?utf-8?B?TnpwODh4OGtlQnpuMWthazc3UWx2T0tOdXhZcUxwdy9zSTBoYjhwNHJrcjVn?=
 =?utf-8?B?VjFNWHJXWENUeVhMelBBejNLcWxOOXlCRHFYaXEzQ0NVWE1EbTdTQUcxWS9V?=
 =?utf-8?B?blB5OFJsL0llbmlCRTdzcUFSTWtqOGZEeVJOdEFhK0VDbEd3ejI2eXprZE5i?=
 =?utf-8?B?UFNSa1ZacitBMnh4THluR1ZLU1ZvSTkrWjVDTFpqNWZtL1U5MWt1YU12OUor?=
 =?utf-8?B?MEdBQXNDS2laQk9NbU94ZGY3Uk9iSzkwSEQvOU5UQXRkNGZnbHdVTUNnYXN3?=
 =?utf-8?B?WDVsNngvSnl2YjBPc2M4R3hCVloraVhZV2RtVk1td2ovZUFFb1FVeWNRZkps?=
 =?utf-8?B?WWpIRlJNVGJxSXQxanlpMHQ5Qzl0UnRiR3hMcWZaTTl4MjFidHdSNk8ycHFW?=
 =?utf-8?B?Rldhczgwa0ovTytqZ285RmN6WE02bW4ycFBVREVqb1hwcmxNMUR0VGVBb2ZX?=
 =?utf-8?B?S3ZDeUZTeHRlckVTUElUakx2b2F4clo1bkpETnpEdlVhVzNKYUt3QWVDTWQ4?=
 =?utf-8?B?Uk4rSGxVajVDeEtrVXEyVlAvbUc5Z2FOeEFiZEVvS0F1bUNjSWZnNlN1TWw5?=
 =?utf-8?B?ZFdxMzdrc3M5T0t1ZXVHbGRPU2tKVG5sUkF3RUtUdE5tdXQ0UzZ2QnV2WkZy?=
 =?utf-8?B?aW9SQlBOa2VyR0t4Ukx0a2xnN1I2L3dodkt1OFB6azVUZkdrdE5TRzF4MjZ5?=
 =?utf-8?B?SGlsY2hNbWNueWpPd3Qrb2VNZ3QwN0tWWUQxYnBpQ2pDZXVvUGh0dHZtOUpo?=
 =?utf-8?B?bWpJRjBOdHdVSlNBWFE3UU8ybVA4UVlVTWZyWUh1clJ3aHgwOHIzdW1qc0Nx?=
 =?utf-8?B?WVFwUTVCNlFaYWFHNXNVc2s1YkpuKzlZZmU0OXNTTis4OHhSL0Y4Qk9ZbVNZ?=
 =?utf-8?B?NnE5ZE12aXlhcXFkK3JHSGViWUpEUFNLVFhLMDhxZVJDZTRRVE14eHo5YmJK?=
 =?utf-8?B?SmpFa0ZlQlJYcm94a3dHRzBrVEl0SXo3RmxkblFQYkJTVDdvMGZmM2JlU0NI?=
 =?utf-8?B?cFZnbVllSEQ5YmNYVGFTL21YUC9MdFQ5YlMwU3hySFdhajI5a1kvMUQ1b3lW?=
 =?utf-8?B?K3hZUGF3eC83ejZ2Mm1OMUw2ODZjVW9FeEVWdG1rdjZlbnFCT3g4dXlSODlI?=
 =?utf-8?B?VDhVT0hyNllrbWNxMnFpbitUMXdqcTBEdlpncndXWlRmNWVwczBjODM2VmFV?=
 =?utf-8?B?VGtrT1ZqUFlGUXJscXRZYjlPamVjY2s2Q0EzbkZ1MUJIbmtsWWErNlZIclRs?=
 =?utf-8?B?RzVaNFppWlhJV3Bkay9TcWhHM2pwemM1MkM4N0tJVXpFZ1Zxd0RlVkVTcy9k?=
 =?utf-8?B?VCtiR200clloSTZEZHhUY21IdFlMTEh6TXRFYmU0NXZqQXhVaE9RSUdEV2g4?=
 =?utf-8?B?bjFGbTlxM3NIdzYydnFIcEJWWGdRUDg4VXBkeWRiT1h4NVh2SkFZRWVEYmla?=
 =?utf-8?B?dm0wYlN0OTNSMmRSdjZjQ3RySk1LSEpSamFvWHpMT29qRENFZXV4bTVvSGRM?=
 =?utf-8?Q?eQPEH3o/4J3fCfKj/rsVsl0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6238d342-c569-4526-3964-08dc034fd47d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2023 00:40:58.8773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60S7SNbd5tHxwKLyO+tnvG5BfjcAdHemwh1tKr9aBtd4yXSUVHAElrXjsYFOxybZGuzLeaxfDgYv1E8IO4TmVIaNCtm5h5guI/QSs9AAHPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8494
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

On Thu, Dec 07, 2023 at 10:43:26PM -0800, Ashutosh Dixit wrote:
>Implement query for properties of OA units present on a device.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.h    |  2 +
> drivers/gpu/drm/xe/xe_query.c | 81 +++++++++++++++++++++++++++++++++++
> include/uapi/drm/xe_drm.h     | 64 +++++++++++++++++++++++++++
> 3 files changed, 147 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
>index a0f9a876ea6b4..b88914693cdb3 100644
>--- a/drivers/gpu/drm/xe/xe_oa.h
>+++ b/drivers/gpu/drm/xe/xe_oa.h
>@@ -25,5 +25,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
> 			   struct drm_file *file);
> int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
> 			      struct drm_file *file);
>+u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
>+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 56d61bf596b2b..abe2ea088e2ec 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -501,6 +501,86 @@ static int query_gt_topology(struct xe_device *xe,
> 	return 0;
> }
>
>+static size_t calc_oa_unit_query_size(struct xe_device *xe)
>+{
>+	size_t size = sizeof(struct drm_xe_query_oa_units);
>+	struct xe_gt *gt;
>+	int i, id;
>+
>+	for_each_gt(gt, xe, id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			size += sizeof(struct drm_xe_oa_unit);
>+			size += gt->oa.oa_unit[i].num_engines *
>+				sizeof(struct drm_xe_engine_class_instance);
>+		}
>+	}
>+
>+	return size;
>+}
>+
>+static int query_oa_units(struct xe_device *xe,
>+			  struct drm_xe_device_query *query)
>+{
>+	void __user *query_ptr = u64_to_user_ptr(query->data);
>+	size_t size = calc_oa_unit_query_size(xe);
>+	struct drm_xe_query_oa_units *qoa;
>+	enum xe_hw_engine_id hwe_id;
>+	struct drm_xe_oa_unit *du;
>+	struct xe_hw_engine *hwe;
>+	struct xe_oa_unit *u;
>+	int gt_id, i, j, ret;
>+	struct xe_gt *gt;
>+	u8 *pdu;
>+
>+	if (query->size == 0) {
>+		query->size = size;
>+		return 0;
>+	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>+		return -EINVAL;
>+	}
>+
>+	qoa = kzalloc(size, GFP_KERNEL);
>+	if (!qoa)
>+		return -ENOMEM;
>+
>+	pdu = (u8 *)&qoa->oa_units[0];
>+	for_each_gt(gt, xe, gt_id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			u = &gt->oa.oa_unit[i];
>+			du = (struct drm_xe_oa_unit *)pdu;
>+
>+			du->oa_unit_id = u->oa_unit_id;
>+			du->oa_unit_type = u->type;
>+			du->gt_id = gt->info.id;
>+			du->open_stream = !!u->exclusive_stream;
>+			du->oa_timestamp_freq = xe_oa_timestamp_frequency(gt);
>+			du->oa_buf_size = XE_OA_BUFFER_SIZE;
>+			du->num_engines = u->num_engines;
>+
>+			for (j = 1; j < DRM_XE_OA_PROPERTY_MAX; j++)
>+				du->capabilities |= BIT(j);
>+
>+			j = 0;
>+			for_each_hw_engine(hwe, gt, hwe_id) {
>+				if (xe_oa_unit_id(hwe) == u->oa_unit_id) {
>+					du->eci[j].engine_class =
>+						xe_to_user_engine_class[hwe->class];
>+					du->eci[j].engine_instance = hwe->logical_instance;
>+					du->eci[j].gt_id = gt->info.id;
>+					j++;
>+				}
>+			}
>+			pdu += sizeof(*du) + j * sizeof(du->eci[0]);
>+			qoa->num_oa_units++;
>+		}
>+	}
>+
>+	ret = copy_to_user(query_ptr, qoa, size);
>+	kfree(qoa);
>+
>+	return ret ? -EFAULT : 0;
>+}
>+
> static int (* const xe_query_funcs[])(struct xe_device *xe,
> 				      struct drm_xe_device_query *query) = {
> 	query_engines,
>@@ -510,6 +590,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
> 	query_hwconfig,
> 	query_gt_topology,
> 	query_engine_cycles,
>+	query_oa_units,
> };
>
> int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 8156301df7315..5f41c5bfe5e0e 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -517,6 +517,7 @@ struct drm_xe_device_query {
> #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
> #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
> #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>+#define DRM_XE_DEVICE_QUERY_OA_UNITS		7
> 	/** @query: The type of data to query */
> 	__u32 query;
>
>@@ -1182,6 +1183,69 @@ enum drm_xe_oa_unit_type {
> 	DRM_XE_OA_UNIT_TYPE_OAM,
> };
>
>+/**
>+ * struct drm_xe_query_oa_units - describe OA units
>+ *
>+ * If a query is made with a struct drm_xe_device_query where .query
>+ * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
>+ * drm_xe_query_oa_units in .data.
>+ *
>+ * When there is an @open_stream, the query returns properties specific to
>+ * that @open_stream. Else default properties are returned.
>+ */
>+struct drm_xe_query_oa_units {
>+	/** @extensions: Pointer to the first extension struct, if any */
>+	__u64 extensions;
>+
>+	/** @num_oa_units: number of OA units returned in oau[] */
>+	__u32 num_oa_units;
>+
>+	/** @pad: MBZ */
>+	__u32 pad;
>+
>+	/** @reserved: MBZ */
>+	__u64 reserved[4];

For some reason I have assumed reserved fields are added only at the end 
of the uApi struct, not sure though.

>+
>+	/** @oa_units: OA units returned for this device */
>+	struct drm_xe_oa_unit {
>+		/** @oa_unit_id: OA unit ID */
>+		__u16 oa_unit_id;
>+
>+		/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
>+		__u16 oa_unit_type;
>+
>+		/** @gt_id: GT ID for this OA unit */
>+		__u16 gt_id;
>+
>+		/** @open_stream: True if a stream is open on the OA unit */
>+		__u16 open_stream;
>+
>+		/** @internal_events: True if internal events are available */
>+		__u16 internal_events;
>+
>+		/** @pad: MBZ */
>+		__u16 pad;

__u16 pad[3] for 64bit alignment
>+
>+		/** @capabilities: OA capabilities bit-mask */
>+		__u64 capabilities;
>+
>+		/** @oa_timestamp_freq: OA timestamp freq */
>+		__u64 oa_timestamp_freq;
>+
>+		/** @oa_buf_size: OA buffer size */
>+		__u64 oa_buf_size;
>+
>+		/** @reserved: MBZ */
>+		__u64 reserved[4];
>+
>+		/** @num_engines: number of engines in @eci array */
>+		__u64 num_engines;
>+
>+		/** @eci: engines attached to this OA unit */
>+		struct drm_xe_engine_class_instance eci[];
>+	} oa_units[];

nesting of flexible arrays; not sure about that. i think some compilers 
may throw an error/warning. Sending an old message from Joonas offline.

In general, I feel the pad and reserved fields sprinkled into the 
structure. If we can avoid that in a way that they are all located at 
the end of the struct, I think that would look good. Not sure about the 
technical aspect though. I always assumed they were meant to be at the 
end (but then structs are nested anyways, so really not sure).

Thanks,
Umesh

>+};
>+
> /** enum drm_xe_oa_format_type - OA format types */
> enum drm_xe_oa_format_type {
> 	DRM_XE_OA_FMT_TYPE_OAG,
>-- 
>2.41.0
>
