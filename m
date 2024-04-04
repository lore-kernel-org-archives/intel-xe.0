Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9976CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 13:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DEE113879;
	Thu,  4 Apr 2024 13:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8YTK+AA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D512113879
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 13:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712236279; x=1743772279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7j/Pb2cfZHYwZEipzgG8UWOolo3oKgWdELdIzaey9Cg=;
 b=j8YTK+AA0wyHHeCzyNppIjjOhQK7l5m1HsmdxaXp5rY6riz9O6dem1p0
 obrOVPUcoTW5fVW83FKBNlkfHBfbkVDD+IyG5+QbsJLjuisLADUyw9Vmo
 ABDBjnq/5rleKNJgvKJoPRPdCo53aRNvmidRclgqdvLPcL2ypqENmTexf
 sWVk9V6BKb5Tblah+mmG7jg7mbnboAFbCQnf2FNyFaHw6Kkyv78eIt8qI
 nytiP686/SAzL8/rmoXVcmznJq1dpaJi52qxAJYPJq+q78Dwy7SPSINRU
 is3nNevchly63pJ3qZacbK/2BvCj25LmcgjLVHnzcpKOChC5m1Enyd/wf g==;
X-CSE-ConnectionGUID: 0Z+sVhbgR5qZ61LzTETv8A==
X-CSE-MsgGUID: 4Dv/vLqIQkmJJDvwcQWIug==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11289185"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11289185"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 06:11:18 -0700
X-CSE-ConnectionGUID: mUPzkHN9TFy3s8750u9pPA==
X-CSE-MsgGUID: dvQNKJYbSze8wCs4s/Ug3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23537648"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 06:11:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 06:11:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 06:11:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 06:11:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx8hz1ofhERwA6tCgTBJBTNuSPcRfjvxb5WBEoDTJwzypKDPMgMlk1KJ+0MKdxAeUJA73BLEQpiyZ7yaNHUgMsn+QwaM3uKJNRkr63xhdn/4htvwVsDo0PjBJhUE0BtFezLPr/u3bkCcUNuwDBfe3N/RBp6NLOiBdHqjntc4P/PMrspLf2bo6twQ+hJyusObf3xvMRpy5P+KouZdeHlqOPeTqZ4Cw7BL4L+9RERbeyVVyK/I1TI33LiiW3/QrjiInqKQywBIPUfTsEBASlFFgIcdtnaX8r/BlspUUcR/C4KcDy4e8Z6m5GvSqpd4oH8Stoltq8Zxl0Goh+xWaKf2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iU3qdlahJr1AknSCcWiVWyInsmNAeWzRY5VWCwcp+U=;
 b=I6ST115bAamZBqYuc14IeAiTzONCv5/j9lxwbVH7RCIKtUKgVWRZU9/+VbXV5Sf7rDGCtit8kCjiCWPlvmS1TK5E84L1piU5MOxs7Uz2t2VE3WhnZ0Wgn7pJiY4P2j0ZqREQiM49pkl6YGvkQ6kRwZszBwhXUbhYnFDcRRFQKG0QS5TvjEntnE1Coe8z5ZkC9k6BkmTvdq2TQSJUoK6wyFKt419qo5q1+g4Yh9AAW96TXUcRjJcvAIkM6PxSSmtrtdxlRPf+7VkDbFDFEWN5+IyNTSU2+oJmUmvBFcSh6uTqJMCz2s5EprL7WWhpAy66Ifl7+/E0yPiKytjjE1XtUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Thu, 4 Apr
 2024 13:11:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 13:11:16 +0000
Date: Thu, 4 Apr 2024 08:11:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 1/4] drm/xe: Define XE_REG_IS_VALID
Message-ID: <sfhirr3oqciigutk3hsnalqb2qmsnlwpgjf7kmy6o5lce4zzh2@j5tevvhsqrlq>
References: <20240404100827.1109447-1-karthik.poosa@intel.com>
 <20240404100827.1109447-2-karthik.poosa@intel.com>
 <3a33ab35-2a92-482d-8ba4-b74e08df52e8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3a33ab35-2a92-482d-8ba4-b74e08df52e8@intel.com>
X-ClientProxiedBy: SJ0PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7147:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ItNk7Hx3zylpH7iiCMwLmxB/l9kEhgrZsgzmYErhZWqz7Z3YoRUqyDIIzX45H/xsg7pxcesjgnJnrthUTsEAzWNEh4O/rTnPpCQcDV1TPIFSy6BcQ3F3nQRALB/98ljyBLfKsUxPhD1sSqQd7GvdUfPJBv/yJBO9ljtLX16tb/Vz9sW4CgfkR2iHPhW6WALXtVkjYqEVkz+l3b0xasZWy2G8RK19D+ZYsfZvko+ExCYfr2cc0VJIQOCNqjS/+DP8lPfA/jUK5hWwxtc8P0Jyqk7jSSaa1xystr20JGLH7XzlzgmXkcH7ZxLbo2cSlgDiMncEZxuzZg70CZxm8TnyTfTkzBAFPqQIww8gnIP7Af0xRXVUAg1LuvMrYO9S5nTcBQaRW7ljSB2lTgtp0vRpuaYYtiqVK3UiESwD9w1bzGENDif3OKiGnTFnWQqugSXH56Orcd3lrsJG2D6mVBS69PGFC9P1tAjWP+UVSSQK6TKQXCSo2xm6rMAuNDtpIDVuZR8Ad5CHkeKMj68O4sR6TR62hZXD3tdGBbRT36S6lo97YYMc/fbSUft/hddnC7Muj20xqNtID+jMtnpeN2sncZpoGNjSzKJZpUVj0kilDmsQFLXfvfx0Lz0X7rHX0BnP4ET9Oos7sP4CoGOzyXiCzG6KM7auWSxJ9gjgqs8bvr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u1Rcg7IItoa0BE4HjCegkvopr2ZxuJVvpn0hISDF6AiqeTldB8s0jicTFP/q?=
 =?us-ascii?Q?m26XExWyLheBdtD6J7RVsNWpdkd5f+ZMQfmcN3T84L5jPx0YHC47rO8f0/cC?=
 =?us-ascii?Q?G3tBY0tdeiXlg431b/sU7Oz4I5Gk7q06+JQnRgNRtA2Ismdjkj9aaHEfUQ/u?=
 =?us-ascii?Q?S0Tb5vDUGKxRHQelE0aCmxCDadlrJCFdvPdQFendq3gEka2xs2O2wEi9cPYg?=
 =?us-ascii?Q?wIvfwSKYZlMW4Gs4eXmdKwhcAS27/ml0UavfOin5EDa+Lxevx2SwR749dSSe?=
 =?us-ascii?Q?8XWkaDi3gk78bwbYfOD4vp8JNs8N6eQCaENK+32iQy3RkJusMMy2ecJqsfsN?=
 =?us-ascii?Q?8PyZlgWmz5NZUwoBZQpWnHKe6C3rex0PUu5i4xdQ2T6kCF4AIe0NoCoeg/P4?=
 =?us-ascii?Q?j43fsHdusXbOL9LhNnMCZrukfK/Ig8cEuMwstbGy/7kcg31/WMtwe1b2UB6Z?=
 =?us-ascii?Q?m1xzPQg4wu9Hv2+fiJKBl/kvXrPGYINDtwXePl/OkIPcjsN2VmULhO0I5/J0?=
 =?us-ascii?Q?kQcsNjTuP37kSSOiky02sga1PtA67A0cVtqUbDCFzQa8x2KdjBJlstb8UpFy?=
 =?us-ascii?Q?MQJpoOrQPXdA7+Pq9RWhhGYCjL8j7wmOSvwLL5kf7Ukxd0sXsgUhKPI/vPV+?=
 =?us-ascii?Q?dsiaNLE4Xx2qW1HIIdbhsYAg/mkyO3wvwq9TyXJfMqywEeHWd3JfYVewX2xP?=
 =?us-ascii?Q?TUbMHym54Cit0zYIMI0rUlimzldTfyABI+eT7CyuL4ZljR1Q3xEp9f/75J+y?=
 =?us-ascii?Q?USDkYyoWYHIeLcbq7K/AokqJwgFVQOS+b5wMktzGxXEo+W+EzrJDDSopIotU?=
 =?us-ascii?Q?S6xzlh5gYRbolrJBlvBQQktOKMrBfgwurmiPcANfe7S4SWcQGq9vvws7wluN?=
 =?us-ascii?Q?fLXxT7vm2wmegtNKB4Y5gdzLIITkxBkaCdnNMDZDBNGoCEr3oBUlGrYgUatt?=
 =?us-ascii?Q?QgCjrbxbeZuw5WAbdG7XqSHhXunu2Nq0uFfqO+QipipjREt7PtF+EPCD2AyI?=
 =?us-ascii?Q?iPsoRpNgCTI5+hdL6j+mu2Kbom6xNJhGTJdEYr9DP/JTaGX9ExNblq6oM/gf?=
 =?us-ascii?Q?tOmn4ihSmswHdHPdDIpRV94ZCnv4ClDsL4SGjJyCs8laED8Dl56NcrEElo6L?=
 =?us-ascii?Q?Rf4p74UVmvRBjOTh7+pEf7KmqYiGpkVs275tGoNftQRlO3W67gEn/nPnPsZB?=
 =?us-ascii?Q?xBV1EqJ+y0N60PpkMYRGomZvKqvOCIuUsy56l+yzU8fwimUZ4ZglSgq32ZBQ?=
 =?us-ascii?Q?1ssvl3ZftpmgbQI+yw20RoFA/wINJEDUFd7id9i0ZUgnRBVRkmQNyx/0DMO9?=
 =?us-ascii?Q?9dJ5yuqTxLanxSgtG1bg2PvAaKzE5bUIyuf0XHsR0gZ9pOQCD/TUzS/vLR6K?=
 =?us-ascii?Q?1UaL+Q0Jc8o84y2LtBzYDz7t9VWNNy0M8PwHJJfk99AOWfD+gXq9eKNVLTS1?=
 =?us-ascii?Q?7GYBiHLJ70lfotiMUxb96f0PFHBY3mtd5i36lvkt2xfjoiQ+MCM4tZzuQbRw?=
 =?us-ascii?Q?2QedcZZVsIZKuUy0iONCQmvxYINA14a9U2nPQc9oK8O8uBbPNjtvlE8VJP28?=
 =?us-ascii?Q?BNKbRtIo/WC/VwDYe4xJAzt5pJKQ4DD6ODBbOPxhoJHF1exQWXS7TWSeoqlR?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d55a7a74-faec-4b7c-ed58-08dc54a8b5be
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 13:11:16.2420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tBnsZCIC7y7viZvBZxnuRSI1+btps4blH714FZbM967N1x6UaTgLWIlIcPceMiCpSGZovClHXAE4SlsnLmRbK4w0D/PkDTxrIAULz0qV2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
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

On Thu, Apr 04, 2024 at 06:36:10PM +0530, Nilawar, Badal wrote:
>
>
>On 04-04-2024 15:38, Karthik Poosa wrote:
>>Add macro to check if struct xe_reg has valid address.
>>
>>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Badal Nilawar <badal.nilawar@intel.com>
>>Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>---
>>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>index c89ef2b79a3f..42078643be6b 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
>>@@ -131,4 +131,6 @@ struct xe_reg_mcr {
>>  				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
>>  				 })
>>   +#define XE_REG_IS_VALID(r)	((r.addr) ? true : false From patch 2 
>>intention of adding this is to abstract the use of struct
>xe_reg. Since this is macro I don't think this is real abstraction. 
>How about using inline function instead of macro?
>
>inline bool xe_reg_is_valid(struct xe_reg)

static

>{
>	return (r.raw ? true : false);

return r.addr;

Lucas De Marchi

>}
>
>Badal
>>+
>>  #endif
