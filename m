Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06987C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 23:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41F310EE5D;
	Wed, 26 Aug 2026 23:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5lmK2wo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9E910EE5D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 23:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787787037; x=1819323037;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xKofhmruQJf/ArvgEIBeXFHktPDfTV7Dgwf12/gtbcw=;
 b=n5lmK2woEy5twsq7EGMAK68mdYUEJ/S+4PcjBmbqK7XZMcrzDUqLW88D
 KkLA+iGu/9PzNZjCY/Sy6zVVS6MDNjY8MCiDwbMfto9XcdJ0kWLnroGlw
 Co1+yTyl9/jkBAp7uFh+D7ptDFftFA39X13vNFhWqY4QzFboO5W0mMXDo
 zlRxCjRW6VBHqEYnpxHoR9wylvmt7zXudAjafy9qhY7SrfeYhiZWuu5SU
 hOVmnwQlmQAkl6+nfSB9Wa19Vg4jMDJyL98ak4Ksbt74aB3O/er+cKVwo
 K2isw3PKCvN46vdoumlrbD/2ZK47JXWZgiqanGfUtxcXjGvspP3ZTFE08 w==;
X-CSE-ConnectionGUID: 7/LOmAPrQh2suexbKwKymA==
X-CSE-MsgGUID: N+IvWB6cQJmSP3A+h/XtNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99445105"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="99445105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 16:30:37 -0700
X-CSE-ConnectionGUID: +AGT2sL+SA68z+D0qqQiAQ==
X-CSE-MsgGUID: fObs90dmT3uACpCgw7mK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265924667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 16:30:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 16:30:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 16:30:36 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 16:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcFZG3QHWUscuZFx357YOxtdGgWtzZReqenLHVPrSdCQKUIFPbPG6pjQxhqQ8CE6vMlj3bZf0lIai97rpWhr/h6YnClTEVC087YM2xFsMbSGiVeaP3nH27xWxDIGDniY3fWVlHJWJzs1U9bdxLvfCEbRrxvkJFZrG0+SW7EtsJLfTg930iBVii41tZmuLOFvfk97CLhk/3Xb6BlNRxSRa8Ix8VylD1Z9o4Ts9Nwni1UJXYqvAjZocZ/u9YvHgML8U8aeIAVp627WUvhWQzLQQNOcy49diCTquONTQHcnCMHWzDTfwHqc3Ch3y/QYUuRFGqJsZ1UMwi3jy0SmagHO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1vdb4tYMYmetJUe4tWuETFU5Cz3of1itGMs9krvatU=;
 b=HvE7LYq5R671M05rpWljb2U+3guzhntkU+S9BuerZfxnWZo2PdMbsW+YvkSLkN/6UA6lYb6TFNCtCcGaOpPMIe36uU+jFhz7dKp4F44SRXgbUWqmWAqw2HYTOfBREDBlVWS3G420FKI4c8WbnCFtaSRbrvvte7mJrS/R3dgzoELs7u6e+9xBv6HScEPxFYMuIf9H2aCdncGioCZjM8NOmpbYNLRRayKKO9FQk/gYCFm42OmJDMLNqQEaZN38SvWNWTcMsEctwoDZJJcfGiGXBT/L5w76iHLCgFcq4HbO9YWvI4OkzlFqFLxSUd6l2UlTCXDjauM6PT6ODWJtJEvPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by DS4PPF46B98A11D.namprd11.prod.outlook.com (2603:10b6:f:fc02::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 23:30:33 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%2]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 23:30:33 +0000
Date: Wed, 26 Aug 2026 16:30:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/xe_oa: Avoid checking and setting fields in
 the OA report
Message-ID: <ao93FyudmRS/3dkp@soc-5CG1426VCC.clients.intel.com>
References: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
 <20260821222338.1053887-7-umesh.nerlige.ramappa@intel.com>
 <87ecfnh6jj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ecfnh6jj.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::33) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|DS4PPF46B98A11D:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c579b1c-ed78-4611-0be5-08df03ca063b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: a30IR3QMvHwMkxFfKgU17Z++zK1FFMiJl+9qTdacVRyK//y+25QciLafskAWj8oRdA3k8nXiE8mKEaAe3SdBpv/MvvrityqMayH4M0KLloCUBE8SEvIFJQNjgfnlD8L4dcfLhmzT+CoDe0s+KliEVCnqRsIvLnthjuercnHit6tiSIYdWvxnPNaL1t8iDIj1CTlSTHDogL7jdw9pjFPiHEe3N9sLiW7+b7BZvL5ednhXREyymbet5EjjJjV3QC+wgAv8nvUv9kskfNIvgpO1IVIeL+eegvbsUldfRtwwg/qJlOo6uYJetxt1tbxmVnGYuBIeHe24q1944RE4FxTHnRFWgEQtOm7yYN5r+t5ws2chk26/TA2yHel2mW0qzENISJb5f8BsemHJsAAQJUfaL5HFoY/Z9tT55qebVZyXbeLRUbNRFR8EWkg5CU7buGLQX0POPBo6tAA23qd9JwrWf6O957UjIMGRuRQItIek2IB6Ci8qR1FaL15XUk/p9fEoxV4L4vmlxfuKvaUPt6Q+TUVWPQSCNyXzLFSypYItJ48IzGRCwaSCXBXRdmd8wfj+sCf5LhfZQGwhxK6RTj4RkSXeC4mPf9gXg22RrBWyNJ6Eh53SP21ErNc7/CVrII6jsvBnHAMePonzZ9uzdFeMluEoqO2wXYaVk2aNdU7vCVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkR6WmV4dk84bUZra2g2L1d0Z2tYRHFWeFhYZnRhZ3ovdFAwTjZ2UHJXYWpt?=
 =?utf-8?B?TEQ2R3BUYmFnMW1HS1o0RlpMUFl0S25QK0diNE9CMFJFWHM3dmx6ZlhyTlls?=
 =?utf-8?B?WngvZUk4MVZ4NVV5bVB1RnpyUFR2RTdnY2FRbGp0ZTJoWDNyMFdHSkE4ZUQ0?=
 =?utf-8?B?ZVVIbEdyV0pJN213ZzAxeGNIUFVEL211OTdYbUMzd1ZucEVMamZiRkR2bVp2?=
 =?utf-8?B?Zms0aFNSc2E4RkJpSXZTWksrd2EyZER0KzNneXRQdGU0UXJaUHQ1M1NSeldB?=
 =?utf-8?B?SDI2SGJNSFM0NWt2ZG54ZDJzclBxQ3FhM29NczZFcGdmanNQOVdXYjBxVTdB?=
 =?utf-8?B?MVNIbEZWcEN6S0Npc3BMQ3ZjVUg2TWdKSWRQKzYzMGUvTGp4dlNOenRjZkJh?=
 =?utf-8?B?UHJsYTJ1YzNNVTdsRXdTb0tjRS9WemJuWk9IK09MTnR2ZS9XWnpuS3QzVHY4?=
 =?utf-8?B?V0xLb1lXd0VzNXJBMVpMTHcvQU9HTGlvZHdxU0ZIckJPc2tnKzd0UkwzMWdz?=
 =?utf-8?B?NCtHMVdMV3lRdW5TbDFvQ21hcU8zUmdTN3owL2ZVTlJ5YUtLT1QzMWVaYllh?=
 =?utf-8?B?c3cxYTJhbENQYUFCaUZnN2IyYk1DcXFNc0tra0w1T1RpMGdrT2ZQZXN2V0xH?=
 =?utf-8?B?YVFlY3gxTDRicDE2T0N2QjhGRmoxd0VYdnU1ekZnNDFiREdaOTVsRHFrZWpT?=
 =?utf-8?B?L1ZTZm5oR3A2VHlUY0xhSmx6OHFqTytjYnlLbTJ5cmowUy9zb3o3Z2QrS3I5?=
 =?utf-8?B?MUZPdzQvbkxwOHlDQ1kwZ29JREYvREtLcWwwcUozZVdWb2lTcHdWUDZYSXdv?=
 =?utf-8?B?MlVVbTNua3VDV1hRZDVuVmpwcmhaNE8zQ3hlQzE1REtQQXhOV24wcFhNbnBs?=
 =?utf-8?B?RmExdnpqa2dWaUVFVlY2SEtJcG1IWjF3Uis5dG1LaldXMTcwNnhkVUxxeWdt?=
 =?utf-8?B?RElVWTQvUmVnY3Y3QVBtU3J0cHVSaUJkMlFXQmpjUWtjeUlvUlFsWEcrNmkw?=
 =?utf-8?B?QUlTZXRNUHc2Ty91dHc4T3J1NUM4WGc4MHRvR1Ftb1FCRXVzMk5EcEtwR3Ro?=
 =?utf-8?B?Z0IwMEYzSy9Gc0VTOFhkQmhjbEpCS1hOMTBFSmFEY3VpTzEvY095aGI5M3BN?=
 =?utf-8?B?Q3JZUitOTlkzdktvaFExdnVQcUlUelpqTmtNaDJYVzV2eVc2dHRhbG5VRVNa?=
 =?utf-8?B?ZkN1SU5QNm1jekNNeWdyQzZCd0FPSFNlMjFDNWFLN2N6aFRONFRuZHl4NVFp?=
 =?utf-8?B?eWRPclpaU0tQSm1pTEVuWnhsc0JBdGRpbkVXMUEwOVF1Z3dvTkFMNEJqRk5R?=
 =?utf-8?B?RUxzQlhpMnFXSGpJUzM1bGs4Uk1sTUFoWTcxNFU3clhja2NwV2VrOTd0WVpF?=
 =?utf-8?B?aXh3bGtnVE8vNm0vNW0xUk45OFpSZ0poTlFCVlp2NU9hdmhxbU9LN2hmYnFY?=
 =?utf-8?B?NHEwSzBSZUVvMkFnN3RsSk10OUw3QTVXZU5NY0NvOEg3RFVGTUttYVA4TTJM?=
 =?utf-8?B?NXlNaEVQbC96dWdMVzJmdnQvV3lVN2l1blVQdElvd0ZkZ0Z1dDFFZ3JMUkFY?=
 =?utf-8?B?SStrWVhwMVZPQkxoRm1GMktjZ1hQa2lHZXpFMnA4WTdRNE5xWDRGeVk5MFZC?=
 =?utf-8?B?SkdNb2R5UmoxdzhMT2JCdGVxOHBWVXBqRWlLL0tKTEZkeTlWbUVIUVV6UGFQ?=
 =?utf-8?B?d1pMNld3SHJnaTduN2t0NFM5bE5WOFdKSytrSFdOSklTZHJPZTYrcHpGU0lE?=
 =?utf-8?B?UUg4K3lrd2krUEM0Y002WEloUjV6RVVQL2NIY1VQNmczUnZ3MmhkSXFZU01z?=
 =?utf-8?B?ZmZkeDlpeHQyaFFlVUJsUDgxeGNnanIxeFN6Nmo5M0JJT091Y3gvbjd5WlNi?=
 =?utf-8?B?dm51Ui9Lb080SGNFUjFyTHVyMXZHSDhxTmY2d3dvdGxJcDkyUXN2Ulo4QTFQ?=
 =?utf-8?B?UkcwOCtMbDB6Y0JKazlNRkdlTUJHR05qdkJ6VWZPMEFMemQxRHBFYW15cS9H?=
 =?utf-8?B?QXFEZkxpL1lYUlNSaEJSOGp4LzNGSWhEZTliWUtnektlWjRyNnNFUWdFMTQ0?=
 =?utf-8?B?ZEZqQzJBVnNtUGlyQW43REpPWUxHR2NaaUJnQmpGenM5VzRvZjVUR3MrdThQ?=
 =?utf-8?B?Q09ic3BBL1h5eFZqQ2l3YkxMUW9iMzJtRUMzcU91RjZKVGJaWEdsby91YTU5?=
 =?utf-8?B?cVUvcTFjNjZNemVXSXgraHlvckJ6bDBMcU5Obk5GZm15MjR4SEFmWnZheWFD?=
 =?utf-8?B?cWJqZWQ4RVpvaGRMWXJ2ZitMU3Qya1lpVStBODEwckZvU3dqSVdGNmsraUtL?=
 =?utf-8?B?Y3ltUWNQbGxCY0tuK3JkdWJVN2JCd3FqdklDYzZ5WEVhc2VsNmhrL0xXOXF1?=
 =?utf-8?Q?PS97mBpZnPPQYv0VG+LPc6uJlNKJviyZQmEFM?=
X-Exchange-RoutingPolicyChecked: ZyJkHpPo1MZAWmoNgcVmAwA4hPNdMe5FaI+xyzOevswYpzRud4AGcm3lrlBIe+t8CSmTE4bx1/UIndnYQHAZrSJHVLa26s3ICmCs8KrdWQJ1FBpjJ0k9Q1o8c6g4nMlgoM/7jdjxuK6cPTyQyoAn08d957ZXqqLNw6m+9JBsJytr1HCqhxR5TFTJPNDJW7eNy2FjXppa73ScfvEgjHlQy5GOsYzGwSl+VcBPtUUCMtomH4A1Vih6jm586elHEmp4bjuzG9Q0XnUZKVW4Fx1QO+wyG9zdes63BBqnm36z1W+/D5dtxkqZn5KLyaL+qellrWz1pLDE973RoeUeYoSnHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c579b1c-ed78-4611-0be5-08df03ca063b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 23:30:33.4645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQJ/pMRXLJ/Mu2CuH/pd3ohNGWru/ZGHrwtYrVqQRFudsKSd7mewvBvHVv38N56aOKxVGZC0zAr0/5kxIzEu0gjJDWOwWTH0PTC/YPWu4+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF46B98A11D
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

On Mon, Aug 24, 2026 at 08:39:12AM -0700, Dixit, Ashutosh wrote:
>On Fri, 21 Aug 2026 15:23:41 -0700, Umesh Nerlige Ramappa wrote:
>>
>> @@ -260,7 +224,7 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
>>  static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>  {
>>	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>> -	u32 tail, hw_tail, partial_report_size, available;
>> +	u32 hw_tail, partial_report_size, available;
>>	int report_size = stream->oa_buffer.format->size;
>>	unsigned long flags;
>>
>> @@ -280,29 +244,7 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
>>	/* Subtract partial amount off the tail */
>>	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
>>
>> -	tail = hw_tail;
>> -
>> -	/*
>> -	 * Walk the stream backward until we find a report with report id and timestamp
>> -	 * not 0. We can't tell whether a report has fully landed in memory before the
>> -	 * report id and timestamp of the following report have landed.
>> -	 *
>> -	 * This is assuming that the writes of the OA unit land in memory in the order
>> -	 * they were written.  If not : (╯°□°）╯︵ ┻━┻
>> -	 */
>> -	while (xe_oa_circ_diff(stream, tail, stream->oa_buffer.tail) >= report_size) {
>> -		if (oa_report_id(stream, tail) || oa_timestamp(stream, tail))
>> -			break;
>> -
>> -		tail = xe_oa_circ_diff(stream, tail, report_size);
>> -	}
>> -
>> -	if (xe_oa_circ_diff(stream, hw_tail, tail) > report_size)
>> -		drm_dbg(&stream->oa->xe->drm,
>> -			"unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
>> -			stream->oa_buffer.head, tail, hw_tail);
>> -
>> -	stream->oa_buffer.tail = tail;
>> +	stream->oa_buffer.tail = hw_tail;
>
>This line is added here and then is modified in Patch 3. So maybe we should
>not add this line here, just add the line in Patch 3? And just delete line
>in this patch? So this patch will only contain code deletion.

I left it in here intentionally. This represents a state where we still 
have functional OA but tail is just tracking hw_tail and we may run into 
the unlanded OA report bug. The subsequent patch fixes that bug.

If that's messy, then I would just squash this and the next patch into 
one. Thoughts?

Thanks,
Umesh

>
>Also take care of the issue reported by sashiko:
>
>- [Low] The macro `oa_report_header_64bit` is left defined but is completely unused after its only callers were removed.
>
>Apart from these nits, this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
