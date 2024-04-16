Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3DC04FFF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 19:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D54210F1BC;
	Tue, 16 Apr 2024 19:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDcJjG57";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114CC10F1BC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713294826; x=1744830826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vCvWDpxtgwLcN2BrVF0Sa0yTcOMm0CpeVCCDH/3upGI=;
 b=KDcJjG57/DJU7PPAtH4fXb9Jd+YHW/iyIE2LAYKi6KIviAqu/l2lywLY
 K03jAofvWI3/xqh/vW5kNE5r/qkHYuU7n9GPwnWuUi35KF7sb85YzqEvj
 W+0k1QJSnNP4d3bRq9bjSsBWJJZdrbXwmt7t0Idgh0mrsVR807ZUUYb3Z
 40JxSipW/0OWj2cGCrc+VH1zZ+2usTWo4WMzZYRwqfpnS3q/11s/D6r0k
 UXl0/J72f5V0fP4FyakenuZdGmojYm9QAK9bh7HHaG5w96MHCQm1IEUqv
 XxRhqlDc1v39lN72SrpQ/ClUUzCFc2AzrVhHQCACZLBY9o/ToDNHTiH/6 g==;
X-CSE-ConnectionGUID: hNyhCJwUQZiqgNQ4sMTQIg==
X-CSE-MsgGUID: Q0UDen8LTD62e0WU87tYdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26268141"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26268141"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 12:13:46 -0700
X-CSE-ConnectionGUID: 4+aLV4jvSXWnWq7UmJKbdA==
X-CSE-MsgGUID: dr8vgJW+QDKYHm2+RFe4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27160454"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 12:13:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:13:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 12:13:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 12:13:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 12:13:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qtlc8qyfHms6M0aRkma5rSihMUmp5FeJdVmpQpQnoSAP+H/UtgrE2oVrjQdULCISkswp7zQhuPWRZsqxGS4gXX006QYRsDb5jn7rfGnjNXOynD4fynQcMlJu1ShbdHmdVXe13IN0Ni2JMmSiWNx6eHpRY4ph8ikOzrdae3Fe2B4Semb5XWFLmiLrVm6qFrZUpBcg25v8xhQDlWOIOqhrb9G6b8urBTOJX5rZVSVVxgw6azizowZVyWYiVpVG+CF/ZQxdSQQamUPNu88FPCGwxB4JQTHK8QoudD8kx41rO4TZqSTQ28VOHxqQANwK6Bo0Ys5DLnTzumflxz7LxQQAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmAcaBZ0Z54CXkf0PWwZhjcRXkm+fo55mzeh7QdYrxU=;
 b=bkb7D9/Don7NuM/0ImddQIMDCZdBsQwhPnEBH3evafIQO4yoGhBW634ZGCwqa7LpenNCtcvYH3vIST2uiU+ex7xvwhdrV2b8ZsmbA3dRPlsO9i5L5yWcFTt2ewf/nJ2HpyVd27ByUn5/CCbdTqZEsFA62AVFTEYJbv2iXo38/WyTwy6uvcZHtNnGm1eFjAG7hy0uUFm3TEmyorZNe8jXZodE7FEE4cEp9BAdGIPp6o4cLY+Id49YthCVl+9WUMBshQNTjO16gd7LCu5lizjFmYAVuOXxAUeLaqeaJeiRiEL91pB2C8VtHvcMnKhUYVQGuLkZxNkSwCaw+UFyMW9txg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4990.namprd11.prod.outlook.com (2603:10b6:a03:2d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 16 Apr
 2024 19:13:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 19:13:41 +0000
Date: Tue, 16 Apr 2024 14:13:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Message-ID: <c4d64vrido6iyvfnlzbf2jdbo4cxk26tqdjdxjp4wt72l5yq6u@ohewctaiish4>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
 <20240409221507.1076471-2-rodrigo.vivi@intel.com>
 <Zh7MCpZGUz6z3dZm@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zh7MCpZGUz6z3dZm@intel.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcc52ba-63b7-4c51-9b40-08dc5e495405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcSrxS4c4r4m/BP9kfzIebgroHVFMlJC9cw+L3TgGt2TONKvV4rredV5Lhx2upmVBSrqxAtpxzlaWMdxp+OdF5lj4E8KNhazaVEKTniGL34rFXeu9OYH5WOCMGNsj/LRDuVWrOaM8bGJNYTslHF2OwbU1SJASV9uxgcsUOL4OFQLgVQQWpOHNAR3+Fb0a5rSndzv97L7AH/AaWoQdBetpnt4ybkoBgqzBCCZOC7RHgstrZWj+Ji+IQAH5i32NgOQsubkzrd6Z7CJ7FeMbUiSC2XfFZw4tT2zJyD5UYZ7oN9hinADfciLZqz3XvGoAE0JLbRAmGETmxU3awnxd5RUcME8Qbj1+XUY7J+OB9GPvGVC5Iyb3Fi3LgH2DOHe1Y1LKyQAMNBotRYsMaZYhbFsDhVSkZ9KvqdtJa1Yz5u+o6pPJAxUPb4MOSurjYsOtH6FyFiqYTzAxsaI5FGRqPEDL7UBvc0wEiVCsjDoyyre2SaEOZqLT3foBUMBaYkfxefNLrgVNfID9w+996z5MBYzns614x2Magf24dKYLMktDYGQ1UnUYTrbzRI05Pmt9U7+UWwkO0w8kDpqdj5h6Ct/H6D0OR3IKLkP/wdD1CVPLDV85Gh4YBjYisLF7jKXkfRB5UWTmy+bnB8JE0qPmfcYtzOtfqGeT4odx1ctbCOxmzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFl6ouYBswlskKiVedMDRikrdw8wICzrfTpvDfxAn5M1XgfVAelfM3gLHqoP?=
 =?us-ascii?Q?IpcKUPQvEWQJU9+VSMcjridIWMsPqqq8yOWmhcv3Yx5FganqbkrTsLRheVnn?=
 =?us-ascii?Q?eWUf6DEb9OxUrb5/UNpJ0uPOTDa0gfFrZZjuA1eMSsw/g8OAR4A6JPnAdKiF?=
 =?us-ascii?Q?ew9B7JYbnZa9j7GwPudWdjH1omeEB19fNFK+dRzWQn1+xSo+EAyabD5DQ2np?=
 =?us-ascii?Q?mDcI/8biKVzOebvnYzw73OdGVzFq5Nedra4S7cdwoqC1Lsg+X97jmrHIxk5d?=
 =?us-ascii?Q?WfewtXZX7pA4Dj5XB7TMXb1mXsLJHRUyfmXPrQiU+q4cj71605yik+jgUiyR?=
 =?us-ascii?Q?e9nhEqHdIaQ67UK36mJi7IT1QhhJlwtNdWN35BzNlqBnafhCnYOIx7enI8EU?=
 =?us-ascii?Q?BjOoVD4m9P24nMi5plOZbNddgbg8XIAQdJeO7FyZahw97cbZElIpQDuFj9kA?=
 =?us-ascii?Q?qy1GsApU+q+wHqjPxCVmHBNrPnO59CWN2KZ4rBOZpA3e3mWfqCnXDMIAijbb?=
 =?us-ascii?Q?jeOmzqkIYYPOPj7wnN6qe00gBeI+t9oQngp/7oQtPKFnmVKWIsE1K6XwxiS4?=
 =?us-ascii?Q?pl+0b5ybsDZyDOKxD95R/sh3tJspq1HQwCFk7Jz/01mfa96R5cXGU6f7S/Ut?=
 =?us-ascii?Q?UFmWOtFbwVgCNFo8R3DTa7oOA9n0ZNheZHUPu9Cgg8myRFReQCRPbv2kS84j?=
 =?us-ascii?Q?1CS9PZuYY2ab+a3dIRS2xhox/GViWzcJsEAMvzArPraqrQAt/sUNO1+IJuqx?=
 =?us-ascii?Q?/kIq1iqZpNY9wccK/M/0LkfBeyM7+xtziZ/lNKwL2HxSYZlDvS9skpyxHqVQ?=
 =?us-ascii?Q?d2IJqfhMxBdJVUoMMqTwd0hqeZG8nY8EnVIZTxhx96ujHZEfJpxcWYyx3Blw?=
 =?us-ascii?Q?sOI4gDdrcSkv6A6DpjHb/gJzDvwrDBiOTnVVKsI3pQI9x4NUYIN4Yanbi9Vf?=
 =?us-ascii?Q?b46ZoWX2p/ZShpWMOcWGW78HtZI0OnealaR9Ex9gcQJP7phHPudwdxv5HzYr?=
 =?us-ascii?Q?uniwqq0ym/L4oYJHXTfR3ghWwxRjixPpVV/XGXiDCXcX5qqg9OjLFPI3/UNM?=
 =?us-ascii?Q?hmUSKlP987vTSHj2EhpQKACdU24A6y9wpCkUdJcMPo9Cg4PW9PoIPf0+6/AG?=
 =?us-ascii?Q?uWO3+pXFWz+zQu7oVKaMlOFv9mQQlB5NnFRybyEWMsOxiPhoA3IqD+JRc0mG?=
 =?us-ascii?Q?Cze7eYKt5e8FMKDCxQFDJZ/7L8U1JgXBSP/o3Vn4EUG0XOdPXVNd2vEjaXz/?=
 =?us-ascii?Q?8tNSI6HnGajOKGesDJOAlo4zCCYWjhbreRP0N8GYWkqnxQJBI74kH0qWCQ4N?=
 =?us-ascii?Q?OpaHKG/FMpBbiebeyfHMIqDdMjj0eCURIY8DSRj7qKJO6s3/fCwrWsB4PwAe?=
 =?us-ascii?Q?jATgz/b1lQ6mPlSqLApwQlLm2VoD+J4mUzjkXzoZnqy5/I3VcZnnEAFchhe/?=
 =?us-ascii?Q?XIikHc4d+QXgFf9T2TtFx1s3B60ogwkRuTL+uAKyHPOqd5eU7uuPGpY88Zqi?=
 =?us-ascii?Q?R0PftQiLBCvU8uaXmCBhFaAgJnx0dwViNx/FQzLsZ/t3drNCsI6wRGx2RvLX?=
 =?us-ascii?Q?5Pc3XetQfPLQ6cWcn4t2EW/yUoulyPlYhVI9w7dz1vEwpkdERYAV/sZ/fIOZ?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcc52ba-63b7-4c51-9b40-08dc5e495405
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:13:41.6460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtEGIkEjOWnAt/U4T+8/hxKfRex9wQALyCXLOgQ5GD281nIpIuq1UAoYNJwS7WPvSoRp6x/fYKOu8AcbioRI4GTOgFhkkzeM55iF+sX5eac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4990
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

On Tue, Apr 16, 2024 at 03:05:46PM GMT, Rodrigo Vivi wrote:
>On Tue, Apr 09, 2024 at 06:15:05PM -0400, Rodrigo Vivi wrote:
>> Let's block the device upon any GuC load failure.
>> But let's continue with the probe so guc logs can be read
>> from the debugfs.
>>
>> v2: - s/wedged/busted
>>     - do not block probe or we lose guc_logs in debugfs (Matt)
>>
>> v3: - s/busted/wedged
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 42 ++++++++++++++++---------------------
>>  1 file changed, 18 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 240e7a4bbff1..f1c3e338301d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -451,7 +451,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>  	return 0;
>>  }
>>
>> -static int guc_wait_ucode(struct xe_guc *guc)
>> +static void guc_wait_ucode(struct xe_guc *guc)
>>  {
>>  	struct xe_gt *gt = guc_to_gt(guc);
>>  	u32 status;
>> @@ -479,30 +479,26 @@ static int guc_wait_ucode(struct xe_guc *guc)
>>  			     200000, &status, false);
>>
>>  	if (ret) {
>> -		xe_gt_info(gt, "GuC load failed: status = 0x%08X\n", status);
>> -		xe_gt_info(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
>> -			   REG_FIELD_GET(GS_MIA_IN_RESET, status),
>> -			   REG_FIELD_GET(GS_BOOTROM_MASK, status),
>> -			   REG_FIELD_GET(GS_UKERNEL_MASK, status),
>> -			   REG_FIELD_GET(GS_MIA_MASK, status),
>> -			   REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>> -
>> -		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>> -			xe_gt_info(gt, "GuC firmware signature verification failed\n");
>> -			ret = -ENOEXEC;
>> -		}
>> +		xe_gt_err(gt, "GuC load failed: status = 0x%08X\n", status);
>> +		xe_gt_err(gt, "GuC status: Reset = %u, BootROM = %#X, UKernel = %#X, MIA = %#X, Auth = %#X\n",
>> +			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>> +			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
>> +			  REG_FIELD_GET(GS_UKERNEL_MASK, status),
>> +			  REG_FIELD_GET(GS_MIA_MASK, status),
>> +			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>> +
>> +		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
>> +			xe_gt_err(gt, "GuC firmware signature verification failed\n");
>>
>>  		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>> -		    XE_GUC_LOAD_STATUS_EXCEPTION) {
>> -			xe_gt_info(gt, "GuC firmware exception. EIP: %#x\n",
>> -				   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>> -			ret = -ENXIO;
>> -		}
>> +		    XE_GUC_LOAD_STATUS_EXCEPTION)
>> +			xe_gt_err(gt, "GuC firmware exception. EIP: %#x\n",
>> +				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>> +
>> +		xe_device_declare_wedged(gt_to_xe(gt));
>>  	} else {
>>  		xe_gt_dbg(gt, "GuC successfully loaded\n");
>>  	}
>> -
>> -	return ret;
>>  }
>>
>>  static int __xe_guc_upload(struct xe_guc *guc)
>> @@ -532,16 +528,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>  		goto out;
>>
>>  	/* Wait for authentication */
>> -	ret = guc_wait_ucode(guc);
>> -	if (ret)
>> -		goto out;
>> +	guc_wait_ucode(guc);
>>
>>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>>  	return 0;
>>
>>  out:
>>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>> -	return 0	/* FIXME: ret, don't want to stop load currently */;
>> +	return ret;
>
>Lucas, thanks for the review. Just to let you know that I'm removing
>this chunk from this patch. Himal had noticed and warned me that
>this would change the behavior of other cases that are not touched
>or covered by this patch. i.e. if the guc_load fails on guc_xfer_rsa
>or xe_uc_fw_upload, we were not aboarting the probe, but now we are.
>
>So, let's remove this change from this patch for now so we can go
>ahead with this and then on top we see if we do the wedged on top
>of the rest and make this function a void case.
>
>Agree?

yeah... I saw his reply and responded as well. We either remove this
hunk or we make the other cases also wedge the device instead of failing


Lucas De Marchi

>
>>  }
>>
>>  /**
>> --
>> 2.44.0
>>
