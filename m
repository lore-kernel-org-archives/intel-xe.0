Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316C7C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 18:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542810E073;
	Tue, 23 Jan 2024 18:50:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0110E073
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706035850; x=1737571850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CTQR8N6X4DdEK01gAfc3Bm6GCsAsstCyO6ExfzSGezM=;
 b=NdRXjGBFJOsrfp2RZ56eJWLdivLHRoTMbeXnaQd712BlceJdQONPY81N
 lC0EWVtx2it48LuwI4Q2CgL9085Pbgd5kKCh6poAbwiBQJehOjXVXWNvY
 4XxyjmJzdWw7NqHGN5E7l4fOnr20XOxrfZWLNgBBfNhvAYYNhCerPBvLQ
 IlSkg66yAhIfcUwU0/jYFb92uLhCRfh5Rf9i2c+ygonnhJIgMoXxntXkr
 +xEBK4watlcejH+fnN6LexhD5oAukO9XDfZfgNxytqcgSzOqP4wM590Pw
 cNCFke95QzdCFmNamaOPTCVNOfEeUAPTQaE5nNVOK6yEolvAQ4uAOLPVN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8982128"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8982128"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 10:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929421163"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929421163"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 10:50:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 10:50:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 10:50:46 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 10:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRVrZM8Fpx2XkC6/M5K5CrZRbX+9uWCHImYfsajErLA0Br3NywON2IQSCacIVl/y/GpRHQ0lf1Z23k1O7MkOS14f8mxFqJgTCInbpmBayBhsU8Wz7TKyZV3cVGqLs1eHopPD9IqpwD+HHWYmaNFfPEmH/QnSlzUTd4NH2pGvUiD9e/cF33mlkWFUl3WXfMK6J/U9f34WQAV9WVjITcXq1ky2hQ1BhWkKezw8UZuoDua3IDHcGPQ8szBuB3vD5d7/j3orRL7QETBJW5zhQQavxsDUyd977IS5QLW3dYqRuNiz6UgBmD23O7rQwoDSKsCxwqsd4xUzeleCthnABG05DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlDZxzF+rBOYh90BO4FnQqphHFwsTiQ6utYPFcZg4qc=;
 b=YgXWk2x0aKUj79IrsNqUtd4guRweTTgaCioXrrLxDCVsy32bbm+nxFWqAMqeWDW9aOPCUWW9YLIbyVEDYhMQ0QWbwxkY5pOvEQZZ9eVa/vP+Q2Qs6i4rxjf1Fgj9HdBE6uivAG9xnYHcX14yz+IbiGodqMVuzMJLcgVW5YhAMchvMXk17FB8ymmD7JpsnSzukZwZaEBIVuWstSaGGKDXkgM30qMlY0rwiQTTHqgUwZWh3x6+Ed0mBEH1P2ZmgYNNGJH2yZAZJ1wABI6wjP2Uk8LaQkbaHKNN96sqm2uTB2fEr6wbdB3HA8iZ+QFSwor2Gms+nwet8ESLTLB0vQY+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 18:50:37 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::b615:c59:8ca6:160d]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::b615:c59:8ca6:160d%6]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 18:50:37 +0000
Message-ID: <f812de6e-a655-49ea-9550-6c4d48117c38@intel.com>
Date: Tue, 23 Jan 2024 13:50:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] drm/xe/guc: Expose dss per group for GuC error
 capture
To: Matt Roper <matthew.d.roper@intel.com>
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
 <20240119004203.393262-3-zhanjun.dong@intel.com>
 <20240122215746.GC7083@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240122215746.GC7083@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 099ff7b8-09bd-4e6e-0649-08dc1c442ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFr8BsBVg/ti1UmD4lwhNkXFCKvIUQ4YOme3jGumne+FFGj4FbLugWejuWIDZk1RNvzL+nqxd/beOpQ0xr5NrjpmUTGryYCj5QnokcIa9F8DxBwv/aBxC2VIaIyw9T36bX5ubV6g4LfJ0x9RDs2bGkeUsjOUCmLdFhwYbHcNUF8n0AdbMwtfTHlxi44ULpkpAIVwStqTADZXATOLkky7+cE02IAjcP5KUiz2bV3tse10kOm0el+tRQ8qBe+2/9mw2MFRM0zPdn7uL4O3NfAfBE4v75aFmallAqVybiE/4q6qy7JAWFvY/fJ7X1vPO3GljGOkCX8puQ1uHUsY4h13WvFa4HlGgS++1Xpo9bTefqXgjkdzhv4PJGqig3/L3TpIGWkJE32UY2HDkd39oJ9G+rSmrcsFCwg/Z9bgX0qh1Of4H9FxkQStUyJgaTvv5tcmHvKQIPBtTpPogkcMEEdqnmhYX0NyPecOvpOJwhdvcQIj37KXM8w5WXVJrY58NeivaBuU3dX6IFAfsOom/zGF7CfifkWRI7nOUPPsQV+d2HqnzTTMZlkJlToEpPwgYzNvyUbcU0lHH0FWfAnsKmln6jH9OUuS7eqIgd39GCLp2omtfjpdvmD1gQ3lHREMJoqE80mHV4Do5xDv426QIQpq9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(31686004)(4326008)(83380400001)(6666004)(8676002)(6862004)(8936002)(5660300002)(66476007)(6486002)(66556008)(6512007)(6506007)(66946007)(26005)(478600001)(53546011)(316002)(2616005)(2906002)(38100700002)(37006003)(82960400001)(6636002)(36756003)(31696002)(86362001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEM0ZkR0N0NUYmI1VFBabVhBVVpjSThwYlNBcU5VUXFtc29JMmxQSzlWV2FI?=
 =?utf-8?B?SlQyVkZFdFpSMVYzQWR2VFlqN01Ib1RrOTRqdGcwdUZ2TGpoZmlxZHhwS1dv?=
 =?utf-8?B?Nk1qVVpLeGpxRGpFRGRtR3VsalRreVpnTE9QTmFRanQ4UVF5d2hGcFJzenFq?=
 =?utf-8?B?N28ySDFUZUVscThPVlUxbENkY3FFUjZ1WVRkYUdiWExNeWZhdVJ6TGJoSHVw?=
 =?utf-8?B?Y3RBSy9ETWMwL04rekxnZEFRRS9SajkraUZSM2VKNW00N1dPdlBFV0h4VjVw?=
 =?utf-8?B?Ykl1eFBGeS9iNVBjWm1kR1dFclRRL3B6WnArYnlwZkNSV0xjaktGSG9XbUFO?=
 =?utf-8?B?eDVuWFdFVHlVdktiNjM3Z0FqWlFHRmZ6ZE0wODl2RkNFSng2VmNPYVA3MGha?=
 =?utf-8?B?aFdiQzhaY0hqTWF3dTVDNWpySmhJR0I1OTAxRi8yOEVlR3JkS2VleG9yMjFs?=
 =?utf-8?B?TjBRQlFjMzJaQkVXb2FubHpDbXZUdGgvWGp5SzFVcDhWR0dSS0RYYWRYTWFo?=
 =?utf-8?B?cXZDNUNuelMxZ3p1R1AyTk9sVU5TT2lWVldPRVF1T2RiSzY2YzJ0TzJ6NXBL?=
 =?utf-8?B?S3hqc0xIbVpKZ0pQMUw3d0ErSnR3a29RVW5lR1Z6N2l3VGczclZQcDlyWCti?=
 =?utf-8?B?Z054TXVJaXlIdVVFTFgrVVZUdjZ4NVFwQzVVT1pseGk2dXE0aGhFUEdVRjhV?=
 =?utf-8?B?TEdzS21GS1V1RDFhMzlFbjZicjVDRVVpK0ZMUHpqbStOekd2TjREN1o1QUpZ?=
 =?utf-8?B?bWhNZmFYTEZEZlFvekZscmZ5cjRkRGw5Zy9hNHFtRWlXcWJwQi90ZyszNGpl?=
 =?utf-8?B?eFF0czJUbEZKRUtNYkdtOXVvYk5GdUhrUkNQYVdzSXoraFNiN0lGcG1CU3pL?=
 =?utf-8?B?S3pLcWRFSUtGVFNqS2t6VkRMbi84L1dFdTNRYTFSVXpURzR6b3RmenhlMlkx?=
 =?utf-8?B?TDFwUlJzKysvUEJJNDNIZE54NXlxdjFibnlnUFBacmFpZTBESWhtZzcrQXNS?=
 =?utf-8?B?Q3Zkd01RZG5SS3d3TU90b1Jhc3l2bUVoYmRyeXB4Y05oV3RvbWNXdGZQTjVr?=
 =?utf-8?B?Y2x0c0dxK3EwZFZPdEh1OC9SZzl4NHhvNytmRVdqOFk4ZjQzeGIrNWFKUWhL?=
 =?utf-8?B?VjRiYmpQWEFNVmR1aGVtQ2J5WDRWN3pESlovRDIyTWtBejFVd2lnMFV2UXJ6?=
 =?utf-8?B?SW1XdnN2VVovQ3VLa2NQblNEUm1laFFYT1JJOFMvbkVZZGZER0V2QXpOY2l0?=
 =?utf-8?B?cVNQS05EWlkrNlRnK0xNQWhHWFJVN0s3bDlYc1V3bExINE43MzIra1JnQkI1?=
 =?utf-8?B?UVljbnJrVDVTcEVHYmFPd0hyWGhWN2Nxa01aWXdHT2Vja0VTeDM5VGl0NHVr?=
 =?utf-8?B?QW5nOTJnWkRQV0RRQkoyQmsvTzlpczMyOEwwbVhLTVlPVU9ZSWRDNHJQS1gx?=
 =?utf-8?B?QXFNODNnejg1RlJhd1o1U25RMlR2RkxzbGxaWTd5QTJUZ2sweTEvQ2t1QUhB?=
 =?utf-8?B?d3RSb2JWZlV6YnRCNTVtSEM2UUxZRzBKbHprcWlXeFY2RUFReFgyRFFQMWJX?=
 =?utf-8?B?dkpmMnM1Q3NleXNSOURKSFlRUHZWdlZjZWZzMi8yR05SMWJPOGVYaHBmYUNs?=
 =?utf-8?B?Qks3Y0RhUGZTbk1ibjVXaDFXaTdjTnN5cHZPbWVNSndlZ0FEaW5KcDR4ZHhk?=
 =?utf-8?B?Z3pqVnhmNkMwY3BnbDladlBROEowelh2K3NUSEJNSEV3eFVIWEw5dVlOMUNN?=
 =?utf-8?B?S2xUbXB5UTB5YXBEUVorL1RzMUNmd1hEK3pKYzg3SEhHdlRHYjRnK3BpOW1X?=
 =?utf-8?B?SHlQUHNxaEd3QllyV0d3TDdKVmFnQkVRb0czWDlMRld5RWVWWkhXdlZLWXNH?=
 =?utf-8?B?MEZDTEtmWUxEekdUQ3pKaHZJWXd6bzJ5Wko2WnIzVi8wMG55YldHWUNmS1pK?=
 =?utf-8?B?Znh0SEs0Rkd5cktXNE5NOUphMFJRRkRLR29yVFdqd3lMWWx2eHk3cm1HV2Rs?=
 =?utf-8?B?eTg4RVdIRlB1RVdDMlJTTnN4d3NKeTlFVjBhaGdPNkREb1IzSWRrTmpkUTNN?=
 =?utf-8?B?bDVrejFFdWs2Q1dPbUhLbXZLL2lScXk5d3NxTndBbUU5SFI1UzlzV1JsY3oy?=
 =?utf-8?Q?tC8CiCfx8jQbcJsxX4ojGkQhR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 099ff7b8-09bd-4e6e-0649-08dc1c442ff2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 18:50:36.9483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfSFMHaLTGaFb7Bi2ApatHn1GSE86ydB9xjwVesTeYiIQ24Cj/WIpA9bkVCT3bn7G+URif2HdAiBZMrSl4kzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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

Please see my comments below.

Regards,
Zhanjun

On 2024-01-22 4:57 p.m., Matt Roper wrote:
>> @@ -7,10 +7,13 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_types.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>>   
>> +#define XE_GT_MCR_DSS_PER_GROUP(gt) (gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4)
> 
> I'd just go ahead and move this to a real function rather than using a
> macro.  We expect the hardware to expose the proper value here via a
> fuse register at some point in the future (meaning we'll be able to stop
> hardcoding magic numbers in the driver), and once that happens we'll
> want to have a function anyway.  That will also allow us to avoid the
> extra header include.
> 
Yes, will do that in next rev.
> 
>> +
>>   void xe_gt_mcr_init(struct xe_gt *gt);
>>   
>>   void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..e973eeaac7f1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> -
>>   static void
>>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index cacd50f4718a..2e1ed5bbdd56 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -93,6 +93,35 @@
>>   	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>>   	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>>   
>> +static void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
>> +				      unsigned int *group, unsigned int *instance)
>> +{
>> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
>> +
>> +	*group = dss / dss_per_grp;
>> +	*instance = dss % dss_per_grp;
>> +}
>> +
>> +static bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
>> +{
>> +	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
>> +	int index = slice * dss_per_grp + subslice;
>> +
>> +	return index >= XE_MAX_DSS_FUSE_BITS ? false : test_bit(index, gt->fuse_topo.g_dss_mask);
>> +}
> 
> It would be better if we could avoid leaking the internal implementation
> of the topology outside of xe_gt_topology.[ch]; if we ever need to
> change it in the future it's easier when it's self-contained inside a
> single file with well-defined interfaces to the rest of the driver.  So
> it might be better to have
> 
>      bool xe_gt_topology_has_dss(struct xe_gt *gt, int dss_num);
> 
> to wrap the test_bit part, and
> 
>      int xe_gt_mcr_get_steering(struct xe_gt* gt, enum xe_steering_type type,
>                                 int instance, int *grp, int *inst);
> 
> for looking up the steering targets of a specific instance of an MCR
> register.  Then you can use those two helper functions in the GuC
> capture code without exposing the internal interface details (and they
> can be re-used in other parts of the code as well).
> 
> 
> BTW, why does your function here only check the g_dss_mask?  On a
> platform like PVC that won't match any DSS (since the geometry mask is
> empty and only the compute mask is set).
> 
> 
> Matt

Good catch!
I will rewrite this part, do some test and get back to you later.

> 
>> +
>> +#define _HAS_SS(ss_, gt_, group_, instance_) xe_sseu_has_subslice(gt_, group_, instance_)
>> +
>> +/*
>> + * Loop over each subslice/DSS and determine the group and instance IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + */
>> +#define for_each_ss_steering(ss_, gt_, group_, instance_) \
>> +	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
>> +	     ss_ < XE_MAX_DSS_FUSE_BITS; \
>> +	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
>> +		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
>> +
>>   int xe_guc_capture_init(struct xe_guc *guc)
>>   {
>>   	return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index dfeaaac08b7f..c258228b244f 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -65,6 +65,9 @@ struct xe_bo;
>>   struct xe_execlist_port;
>>   struct xe_gt;
>>   
>> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> +
>>   /**
>>    * struct xe_hw_engine_class_intf - per hw engine class struct interface
>>    *
>> -- 
>> 2.34.1
>>
> 
