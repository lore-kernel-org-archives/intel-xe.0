Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA26C41535
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 03:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5072110E307;
	Wed, 20 Dec 2023 03:02:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E657010E307
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 03:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703041329; x=1734577329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3EXPTFRy18EYUGj+poIhW9Ndx7whIYgc9nGdo/Fjpk=;
 b=lnuWYquvwm0rLZKpgCzmHMkqBiTV6mkLkUpUkYUuLqD44ZFSgMYBtIwo
 I4TrvdcbeN7LoTls63QI+7FOH/AA+Ayjo7lXXcsd5HS550yNVkiiuLoIT
 8M3vOEwwvKlX6eplO2q+QVsx5q9SR25Dmq/aDJ1wvVK9DyARhQeH4Jwvk
 pDqBPQKfZ6+bLOYPVu/h9T+WYUNZ/TdIIuh3YfymkIuheasE1XBVvuVlM
 ae8QKTPknKMDZ49aI4jDGFWgCO8W++si5gFQPMjCGQ63u4NIis9ubjUHZ
 Dx6ElNCoFBpJhbG7k9M/+DJpxgRpwFuPSZIrazYD9zPzi68d5nSlEHWy/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="481944383"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="481944383"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 19:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="10608896"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 19:02:09 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 19:02:08 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 19:02:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 19:02:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 19:02:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFK+jAwDUkqVhyTpGHHiaVd6koxYkQwyTPIxTkCfwFR3VJH9DsshwLOi72dOYj/WLZtNrKhb6omssSFv1uPD8PlQ7j4sI6TLjIOvjeFqgqeyX9VUCsTGk3fWQg96o7/TXMy8HkSiLvXNJKeFmZw71Vwx4ZRMIaph8/7VcTOb4PmGdZobpC8UbPX0R+YcjCnb40nIofZRJ+TMIt6MIJWzoS50LN37TwHgqG/YxO3yCucHIfMZZLa5t1laJ8ppyJoVIcknird33PKyZD7FZ2U+N6Rtt/a9SGU+vM2iVldeTecfYhUrgAFg307jLCfflPJbx7QbOPMI5iZRPdet9j6q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XBeziNqDYIW0Rg9d0/8+a2U2f8CwasSInED/7J6V8o=;
 b=Km4FhxUF+Qws4uxL6vOX12RMFwgT9OX6D3qA6TWJFuaJNIcN4jmMU4eAbRoYhZr976mVI4/PYUrJp9BMbfW61vAup7QomXtktVZ9khw3ehpbORtHy1H/Y4u9MbyNzLr6kzXV93fxlv3oBxADt1K8CnX2ialZViFWu680d6URvaxi3uf5aaqMRz/UXpCMBdYzcDvOg4Tk9xEYRhdSmiteH5yce6XY2vR+TDweW52eU9qsa/Cu0VFHqU22pV5SK65dhOm3QGJFVTt8HIfWtYvFHlBRdhODX/wac27Cvmf534m7BqqOcDGkP1j0qkbBJjQm6cz0fvV+4C8uQk4JvUHIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 03:01:59 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 03:01:59 +0000
Date: Tue, 19 Dec 2023 19:01:57 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 10/17] drm/xe/oa/uapi: Read file_operation
Message-ID: <ZYJZJeG3lUnFkCKU@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-11-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-11-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: efdc58d9-ae8b-41e4-7e3c-08dc01080891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1ZQyPZQsvDEMmoUg6YBv/RR81daEWIcL8/4YA0vaVMmCe0RN0o+EAa49vZn3uHDY/0fnh3xJGzP1jiJ/8meM8FaTKtuoqLmO2GEEZCbWoEKvqi9ZKWKZQmJfdEaGUrA+/g2b4T/Y8DMXBj4EdH4NtlIwrUrmaTjKwtVGz0SqZi9qJVgqHgkq4eUbmpjD1CaKsmCegM/N+L504RSRcDMSEyTbVusqfz1zy04cj/IcPnUrMJEr6JDON7NRX+ukczmaSC+pM6qyNrSZ/TcRT92UkEjmE3NHrtHKIiDvqH4tHHeQjv9PITF8+VjMk+fBbFxBa+QAjRXZngeACTV9QCpXrTZndgNkbnSdgvwKaYZGUNj2VrQYLCn9MMJ6T5kmiyKxGXzkTRSLc5tOSHrYPQg+ZcQHesKGPnlDU84Vf7OHGt9Od3R8XzbAPtFDObdR0GUiLITq3tF2GZs2W3N5/jzpt0vOjSeBc8Dk8zghpkkkRm0uh2so2cfJT4y4i2O1tsAqNc7hJP7r+fel45ObN3vABrc7uKdlpq7lXjUxjT/7frguOQIw13f+69Vdd4URjOR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(26005)(478600001)(41300700001)(6486002)(6506007)(83380400001)(66556008)(6636002)(66476007)(66946007)(33716001)(9686003)(316002)(86362001)(8936002)(8676002)(38100700002)(2906002)(5660300002)(82960400001)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBtTWp1OHY2WW5NNkZmQVByU2pDb0JZT1Y1alFPMGZnWlk5TDZEdzRUeDRT?=
 =?utf-8?B?ejJBUG4ydFdNdFNKSCtwK09JdTFJMVFVWVBXaXJkbHc1Y3N3YjR3eXRvU3g1?=
 =?utf-8?B?VzNIM0NWUGRXU01iZmQ5ZlZtU1pTTGZFc2pzNy9CcVNId2lXNHlTVGpGYjli?=
 =?utf-8?B?WDE1QnBWWGd6WUY4UkNOOUQ0eWI3SjEveldpOVNpbnZWa3lsQlFxWTlRNG5S?=
 =?utf-8?B?Y25rangzakdEWGZ4OU9JZ25aT1B0a1hVTC9OYUpQZEI5TnU3cjlGYXJTb2s4?=
 =?utf-8?B?cTlCQjNBNzdMdE1ha0dhdGMxYkVBNU9idTUvUTBDSmVUemN3MnUyOFlndW40?=
 =?utf-8?B?MzNMeHBCMG8zbTB1MzJYTGd3d2JnNlprSnlFUzVPYTRMaExBMVhNT3VJUW8x?=
 =?utf-8?B?Z2R6WThTbTRVL0FoZUhneENIekJxblMwVE05RWh2MnpUb2ZrNWxVY0JWUUR0?=
 =?utf-8?B?bzBSOUdQZmxPRzA0M29UbXdYZ3p2NUVnNVNZMVROUk9uRC92Q0pONVEweFg4?=
 =?utf-8?B?OE9SRTZFbGI1TGRTUWVJWUdsOGFZTUtZR2N4RUxHS0k2TTZYTzJjcnVjRURo?=
 =?utf-8?B?Sm13ZXJqSWJhVU4vbEIzeUF5SGd1NEsyQVlKUG1FVHFFeXVPdU1KQXJ2UXNB?=
 =?utf-8?B?VWFvNmRsOG1DckE3VVNOZFN0N0F0VElyeUdCbkU2MEhkME96MXFRVDcvdW9o?=
 =?utf-8?B?TFRidGE1blExd2VGalJQMWkrNC9nMURxb3VlLzJzSU91MjJPenc0VFZoZk1i?=
 =?utf-8?B?SEVMUVJKRHFzanZRZ3d0TlphNlZscHd3SENJdDNJRGxXdWVLYlZqbjRVVktG?=
 =?utf-8?B?Z0Y1QmF2UWQ0ZzRzNlFYbDEwWGpBVy9UbVZicGRGLzJJNkc4QWxnL3luY1Bl?=
 =?utf-8?B?SzZkN3lXWjlPNm8wVFFldnp6ejdiTEswaFBxTzZ1bFdBamJtRzA0Zi9yUzdi?=
 =?utf-8?B?a081NXFpNzVzUHBFRE50TWRnd2MrVmRTSTU3UWZzNVdjdGpEbytpNXVXM0d5?=
 =?utf-8?B?Rk5lQjVFb2RLMVRweTlLQm4wa1J3eGo2dXcyRHJ1SEhsY1dFVGFnbm1kOHFQ?=
 =?utf-8?B?a3R4TTBqamU4UVhVVnJFNW84eFRwSE1zOFRPREZycmxUS09MZUF1UU5kUVdw?=
 =?utf-8?B?R1FHRzJNSUxDQ25NRk9KZFdRUktHaUkzWXJhMk43dkhKd0xaejEvMTVqMFNj?=
 =?utf-8?B?bk5XeGVQSHlZRTZaUWRTWXQrL1R5ek9JM1ZMcy9GeER5SExKMDhKSUJKKzRX?=
 =?utf-8?B?QWpid3FiZTg3WVN2UkJtdTM4L0l0c29QcjBZYTI2ZWw5Z3FVTkplR01GRlh3?=
 =?utf-8?B?Q2NHSUxBUUZxZlgxYU1NRUI2djJpMzA5aW91Qy9iNVJvU29GMFVNNXpFMSts?=
 =?utf-8?B?dUxYV0p2dE8xdVRHUHJZVUpsV2owV1A3M1VHMmVmeVVsNnhFcjB4QVB3SWhF?=
 =?utf-8?B?TlhyYWVhSjBWSTgvSVc1NjBFU3pDS3p3cjhUMm03MFd0dkxlR0VjNjJPdzVk?=
 =?utf-8?B?SkxrUTJldzdJbVhXeDBhbW14RTRpTGVPdEt6Uk0wQUdJRzRoUk1oekhaMjJX?=
 =?utf-8?B?d2hrSnVtQ2pMVEprYnZpZE1zNTBueFZRQnVqZUZYVmRkOXpsWUxzMTV3eWt1?=
 =?utf-8?B?Wm95MTVleHRtU2ZuMGVDV0V2TXUrd0FUcEZuelVKUDJrYSs1dFFZTk1ybm9i?=
 =?utf-8?B?WERCMGMreHNSUW9kaG8yS1czeHFqbU04L0VNOXZWQjBNYk1mNU52aG81UGRk?=
 =?utf-8?B?VUYxTU9jQm5zSHZEa1pMcXpwbmVPL3BDRW9FdVY0dHpFdGt4TnhvRFQwSGxB?=
 =?utf-8?B?S2lmOUNuUFQ5Wkgvd2VvNllnZElKeUhuNkhpandWc1dkNkRReHdOYmt3amgy?=
 =?utf-8?B?Tk85UkkyL2VZN3pyWDNTSFJHRDdVS3JYYmt5QWFuQ3k2bGo5MzFMNzMrWHJk?=
 =?utf-8?B?ckxIK21QRUc2OVR0em9iOFd5YnliYjZPQ1Y4ZERnMEhKV3l3dGYyZysxUmdX?=
 =?utf-8?B?U00zVXdqeUtpYmMxTUlNc0tiM1pTbkJZS01xUXFWNGVQalBZeXlPTWFlZ3JQ?=
 =?utf-8?B?Nmk4SkVicFYzaTdsazRsc1NJMG40ZlhWTEk3RmZrOWdUWThkTmpMK1lMNUc0?=
 =?utf-8?B?ZU81SFp4YkUzZUtBWnQ3WTA1RE1wK1dvdHl4REd4TFRUUTFqTlhDTFZjd25K?=
 =?utf-8?Q?HevWfkKcdJJTJsoO8uXUHSs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efdc58d9-ae8b-41e4-7e3c-08dc01080891
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 03:01:59.6352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFWfdtNACJ9u7NeLLHizXS7c2VVqRVyM2N/lg48SPwXXRV19p4QOblVimKCeDtqPmqOL5ZQf8ld+ukA0kZ70FVgBhI9Xh+HwoJy84rTDzow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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

On Thu, Dec 07, 2023 at 10:43:22PM -0800, Ashutosh Dixit wrote:
>Implement the OA stream read file_operation. Both blocking and non-blocking
>reads are supported. As part of read system call, the read copies OA perf
>data from the OA buffer to the user buffer, after appending packet headers
>for status and data packets.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 239 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 239 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index b6e94dba5f525..5744436188dcd 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -170,6 +170,14 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
> 	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
> }
>
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)report = 0;
>+	else
>+		*report = 0;
>+}
>+
> static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> {
> 	return oa_report_header_64bit(stream) ?
>@@ -177,6 +185,14 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> 		*((u32 *)report + 1);
> }
>
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)&report[2] = 0;
>+	else
>+		report[1] = 0;
>+}
>+
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -251,6 +267,134 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static int xe_oa_append_status(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset,
>+			       enum drm_xe_oa_record_type type)

space/indent ^

>+{
>+	struct drm_xe_oa_record_header header = { type, 0, sizeof(header) };
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	if (copy_to_user(buf + *offset, &header, sizeof(header)))
>+		return -EFAULT;
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset, const u8 *report)

space/indent ^ and a couple more places, in this patch.

>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	struct drm_xe_oa_record_header header;
>+	int report_size_partial;
>+	u8 *oa_buf_end;
>+
>+	header.type = DRM_XE_OA_RECORD_SAMPLE;
>+	header.pad = 0;
>+	header.size = stream->sample_size;
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	buf += *offset;
>+	if (copy_to_user(buf, &header, sizeof(header)))
>+		return -EFAULT;
>+	buf += sizeof(header);
>+
>+	oa_buf_end = stream->oa_buffer.vaddr + XE_OA_BUFFER_SIZE;
>+	report_size_partial = oa_buf_end - report;
>+
>+	if (report_size_partial < report_size) {
>+		if (copy_to_user(buf, report, report_size_partial))
>+			return -EFAULT;
>+		buf += report_size_partial;
>+
>+		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>+				 report_size - report_size_partial))
>+			return -EFAULT;
>+	} else if (copy_to_user(buf, report, report_size)) {
>+		return -EFAULT;
>+	}
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>+				size_t count, size_t *offset)
>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	u8 *oa_buf_base = stream->oa_buffer.vaddr;
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	u32 mask = (XE_OA_BUFFER_SIZE - 1);
>+	size_t start_offset = *offset;
>+	unsigned long flags;
>+	u32 head, tail;
>+	int ret = 0;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->enabled))
>+		return -EIO;
>+
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	head = stream->oa_buffer.head;
>+	tail = stream->oa_buffer.tail;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	/* An out of bounds or misaligned head or tail pointer implies a driver bug */
>+	if (drm_WARN_ONCE(&stream->oa->xe->drm,
>+			  head > XE_OA_BUFFER_SIZE || tail > XE_OA_BUFFER_SIZE,
>+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
>+			  head, tail))
>+		return -EIO;
>+
>+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
>+		u8 *report = oa_buf_base + head;
>+		u32 *report32 = (void *)report;
>+
>+		ret = xe_oa_append_sample(stream, buf, count, offset, report);
>+		if (ret)
>+			break;
>+
>+		if (is_power_of_2(report_size)) {
>+			/* Clear out report id and timestamp to detect unlanded reports */
>+			oa_report_id_clear(stream, report32);
>+			oa_timestamp_clear(stream, report32);
>+		} else {
>+			u8 *oa_buf_end = stream->oa_buffer.vaddr +
>+					 XE_OA_BUFFER_SIZE;
>+			u32 part = oa_buf_end - (u8 *)report32;
>+
>+			/* Zero out the entire report */
>+			if (report_size <= part) {
>+				memset(report32, 0, report_size);
>+			} else {
>+				memset(report32, 0, part);
>+				memset(oa_buf_base, 0, report_size - part);
>+			}
>+		}
>+	}
>+
>+	if (start_offset != *offset) {
>+		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
>+
>+		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+		xe_mmio_write32(stream->gt, oaheadptr,
>+				(head + gtt_offset) & OAG_OAHEADPTR_MASK);
>+		stream->oa_buffer.head = head;
>+
>+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+	}
>+
>+	return ret;
>+}
>+
> static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -321,6 +465,100 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
> 			"wait for OA tlb invalidate timed out\n");
> }
>
>+static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>+			size_t count, size_t *offset)
>+{
>+	struct xe_reg oastatus_reg = __oa_regs(stream)->oa_status;
>+	u32 oastatus;
>+	int ret;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->oa_buffer.vaddr))
>+		return -EIO;
>+
>+	oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
>+
>+	/* We treat OABUFFER_OVERFLOW as a significant error */
>+	if (oastatus & OAG_OASTATUS_BUFFER_OVERFLOW) {
>+		ret = xe_oa_append_status(stream, buf, count, offset,
>+					  DRM_XE_OA_RECORD_OA_BUFFER_LOST);
>+		if (ret)
>+			return ret;
>+
>+		drm_dbg(&stream->oa->xe->drm,
>+			"OA buffer overflow (exponent = %d): force restart\n",
>+			stream->period_exponent);
>+
>+		xe_oa_disable(stream);
>+		xe_oa_enable(stream);
>+
>+		/* oa_enable will re-init oabuffer and reset oastatus_reg */
>+		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
>+	}
>+
>+	if (oastatus & OAG_OASTATUS_REPORT_LOST) {
>+		ret = xe_oa_append_status(stream, buf, count, offset,
>+					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
>+		if (ret)
>+			return ret;
>+
>+		xe_mmio_rmw32(stream->gt, oastatus_reg,
>+			      OAG_OASTATUS_COUNTER_OVERFLOW |
>+			      OAG_OASTATUS_REPORT_LOST, 0);
>+	}
>+
>+	return xe_oa_append_reports(stream, buf, count, offset);
>+}
>+
>+static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
>+{
>+	/* We might wait indefinitely if periodic sampling is not enabled */
>+	if (!stream->periodic)
>+		return -EIO;
>+
>+	return wait_event_interruptible(stream->poll_wq,
>+					xe_oa_buffer_check_unlocked(stream));
>+}
>+
>+static ssize_t xe_oa_read(struct file *file, char __user *buf,
>+			  size_t count, loff_t *ppos)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	size_t offset = 0;
>+	int ret;
>+
>+	/* Can't read from disabled streams */
>+	if (!stream->enabled || !stream->sample)
>+		return -EIO;
>+
>+	if (!(file->f_flags & O_NONBLOCK)) {
>+		do {
>+			ret = xe_oa_wait_unlocked(stream);
>+			if (ret)
>+				return ret;
>+
>+			mutex_lock(&stream->stream_lock);
>+			ret = __xe_oa_read(stream, buf, count, &offset);
>+			mutex_unlock(&stream->stream_lock);
>+		} while (!offset && !ret);
>+	} else {
>+		mutex_lock(&stream->stream_lock);
>+		ret = __xe_oa_read(stream, buf, count, &offset);
>+		mutex_unlock(&stream->stream_lock);
>+	}
>+
>+	/*
>+	 * Typically we clear pollin here in order to wait for the new hrtimer callback
>+	 * before unblocking. The exception to this is if __xe_oa_read returns -ENOSPC,
>+	 * which means that more OA data is available than could fit in the user provided
>+	 * buffer. In this case we want the next poll() call to not block.
>+	 */
>+	if (ret != -ENOSPC)
>+		stream->pollin = false;
>+
>+	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, ... */
>+	return offset ?: (ret ?: -EAGAIN);
>+}
>+
> static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
> 				  struct file *file, poll_table *wait)
> {
>@@ -738,6 +976,7 @@ static const struct file_operations xe_oa_fops = {
> 	.llseek		= no_llseek,
> 	.release	= xe_oa_release,
> 	.poll		= xe_oa_poll,
>+	.read		= xe_oa_read,
> 	.unlocked_ioctl	= xe_oa_ioctl,
> };

With some indents addressed, this is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>-- 
>2.41.0
>
