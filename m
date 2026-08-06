Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2BC56207
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 14:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF5210F219;
	Thu,  6 Aug 2026 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/cUhGtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C295410F215
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786027383; x=1817563383;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B5GU2uMuW/PYuPxdz5rgRpay3Ic/tpOK4Feupv1c194=;
 b=Y/cUhGtplKa6QxyfmeN9z4xXaoZX/jP7krl1LqAVnrz3AJQVaH9EMPNJ
 elRGM9gxatQqy2qjhduTxF2Zu07ATpxQlZcz0P5NpCETt8weMPlRLUc/b
 sxf1r7OS01kXgl/HnSJh5fSAL1CP4QXhqyBN57B4MdANuoKQNJFJ9yXto
 M72V7TunUu0j4jW26M8yaT9JrX0yAY2tmAwlY/oPXKawGbJKpB5PtEiBc
 JuQZ0rXZH8cLuJRHyx8xy0+lbXiD1Bb132jkI18vYCHf0f/iFbF2BpK2m
 kjbW/9HcPWRrv6Z5UeWpJvAobU5uaNtcHAr7Z8/sTCtqinb9m+qmvtCsu w==;
X-CSE-ConnectionGUID: q/KdtTDmQGaoxEvvPjYPJA==
X-CSE-MsgGUID: cagJAdp/SLyjKbGseaZfRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="74157481"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="74157481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:43:02 -0700
X-CSE-ConnectionGUID: BEuBt16YQXKdJ6wcpwCGJg==
X-CSE-MsgGUID: iEhNPsrETHiWG/e1TTIZwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="292021291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 07:43:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:43:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 07:43:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 07:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiE119+y0+eVEQtDeAO30d94hLiP/zqL1xVLsoWTZ3WAUwSNsYlF1iUMaOcZviK3MdExEKd3kJSYkcbNOdC4t/g3lcrMS7nPt2iEoe+FMGZFxydMhGlLDRqIfz+i37F430mZGn4RObJn9ZZ/YGMEusSQPbvhm+bWsYex4cchl3NCSJo1vHfoj1FepDfvV0LMQZqB0JuJeyzQvS/JYxnonnc6clfIBpKQTaaqvx2qO4EulDqPUAC9bz/Nbd9Gxa+k5yzQ+KU+uuUJbc9JaOKVVoePVD9t5He2YrCAgkBynsrOk5H1Dnap3zfTz1xuGYuqwmRXFs4BfMMwhtKEDebXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qDrDGhZRylx+9+XZ0qHGHYZgTz3AIod8+7PRtt4+3c=;
 b=muafHfDGagttVygJSEm8aSBlQqQbRLw+B0IKce7H7Ob5y+Vqcx33di7xAmTxlw0YBlxYti+Yt6J133trNh3Vw/1hEHXgOHh6mefJNkYhNOnmLr+vHkLVgKjB0U2wp3x1K0CKIo1sIlotWxc7VcVmimyE88ORlL5j+EufMJfBurABGaOUdwDlxU+voAnhJ4JgRFqKphJ+XSvglCigVYrzOjip6YuuY1qgb4TeAGF4kub7/SkHJssZJ7Lk7CNee5dmU1wnoFNztSHmZlBSSM2b3+cM1wi6uaK1d+XVhia3FZapbnNPgk5+dwaD309SZyCihy5KJUUV0GRhQo619ToOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:42:58 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 14:42:58 +0000
Message-ID: <82169f77-5128-49ca-a375-58aaa0f09bdb@intel.com>
Date: Thu, 6 Aug 2026 16:42:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/pcode: Improve pcode timeout logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-9-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260806110039.1245282-9-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0164.eurprd09.prod.outlook.com
 (2603:10a6:800:120::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8ea945-b1a6-4d04-78f8-08def3c901b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1ORongYwEVjSLRu+lswwnM74tJIvUmgxjWkeiVchJ/LuVGmoNw6XFAKtZxlvnZVrdc2HkAeVfS1MWM8pzRDH77k0hq8IFY4KbpaO5VxKP9djq5l2IUzpgLTfExU4Vc+V3IoYQOSZQu1ym+12medH65ZMqgUAZZJH+WcqZIdCdceimibaeocF+uw7MD+Rsy51++r24kLpBSCrwMebEWcRw5OsfBft9RqzfEwGX2SoqD0STZsDoQEj5YXnxei0PkF9a8yEJFDsS5CUaGPFR8Ki5RIUlFcKAlW2aLo3z4EhswfpUkXE3MFxjngx9bXfaWAErmNuTfDcYyXHZ+a+7oyj6XMQUKnay0Ukihd4quyS66H3oU2qfw6Ilpsrr8L1AGF5SwYMOXdK8o0iyNpDrXm+eXjzPmWBxY2FYgmFUR4B4gFq+AhDhhz4Gl1zlxpA4caOqfxbXDfl7igCSDhLYOZQ92eqSaB+dPEvb8wopDxOWt+C4vXZCH0arqVgdBE+dbGmDd896gLhYfqb8mmM5UvbojX9CR0JR7nEaXSWZvs4lDLJgR7rhAlZrESS0y9+HVUDMxOTSfijUenmmIRuULGr55TZQISgijS6kIpwrJYQzBBZossed0/4FDzLC2U/OPEvqLMsp0GvwOtTQ21l85fF17KESumbG1MLEB51eLintT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk0vVm9Valg3YkF6T1NlYWZIeGtkcFNNTEZGdFBWVG1yR3pSaWVNdlViTThY?=
 =?utf-8?B?VWpRV0M5c1c1KzJNdzN6emMyS2pwbnh5QncvTjQ2R0hTcXRKeFplSWpjVmJ2?=
 =?utf-8?B?Tkp0bVZkYWtyaCt0b2wyNU80bjM3RFoyVGpFUUJKdHl2ZE9wRzIxOFZZRmhU?=
 =?utf-8?B?dHVxczEwaEJhUkxVeDdUVDRnaStEdXdHWkxRd0RLa0twbXVFRk10NWdndHQ0?=
 =?utf-8?B?YmNCa3FaeU45OGF6NGluUkpFSlJTZFBIWW85Tm1DSlB4VDZZQ0JoSzhyeU5w?=
 =?utf-8?B?N1Z3c3ErcnBTcVZvejQ4TS9jdnhtT20wOEVxOU8vYllzb0ROa01vNFllT3NB?=
 =?utf-8?B?N0duUnJrazlXNEtkRk1Sc0ZhTHY0YVVOQ3ZMaHl4VmszeHJKeTJ3bE1tak1N?=
 =?utf-8?B?OGtSbE5NL2JUcG9PcUl4MTdONGhweDltMzg3TEZBVnFsYm5PN3FUSkVOWmZP?=
 =?utf-8?B?cnNmeE9UOFIwNzZ3RW5LRS8rTWJBdldyTUV6OC9WQU43ZlRDdU0yYm9JbjlC?=
 =?utf-8?B?dHZvSktqcEIwYXNjaVhLNUF4Ym1hNnNzako0eEdRQ2FFUFA1MldzK25sc1Ny?=
 =?utf-8?B?UDBad1p1b09GWG9CMFNhS0dXTkhIRm1Mc2VkekR5SEVKUlptL0Q1a0lmYS9I?=
 =?utf-8?B?NWFwd1Rna2tMK0tGajFQUDAwNDFkKyt1N3BIZTZJcDNVYXN5Z0REbVhvUUcy?=
 =?utf-8?B?NFFyUEtwMHFRd0hFRjBpUlp2QnZKMGFSbzlUWVd4WTh3YUVyc0tFLzJKYWJw?=
 =?utf-8?B?MlBxVzZyUzlleVFVU2p4NG5FdjN1WXZUQ2phMk5SN2xLcUJ0N1dWK2xtald4?=
 =?utf-8?B?OGVHL0lSRUtRQU93c2xMNXNIMjRPSFF4TnR4bVlmWTFNUFZzTzZxblF2LzRK?=
 =?utf-8?B?RWhNT2ZkQ1h1Nnd5akZubGIvL1FFSFpURVROR2YvbFVxbXdKb05sV2NLVURq?=
 =?utf-8?B?K2hWSzJUdXhwWXB3cGtJRU1BblBxcGNnbTRlZW4zclB5OExHN3dHby9ZVGRv?=
 =?utf-8?B?ZlNQcWpNTDVZY2huK0lnaWJJRHo0QVlGVUltU094Tnduc3Q5bElhRHVhdGc1?=
 =?utf-8?B?eS9TZTZSNGlwUmFqOGxwWExTZXE2VDIrQnQ2aURrNTlEdSttTXJXZ1BKK0Y4?=
 =?utf-8?B?YlBqRWtEcUZPZ3R2MExsdThTRHk5ZVl6N0dkTFFOUGI4Z2VDdEtISlRNMGQv?=
 =?utf-8?B?RTZhUGk1K1N6TXA3Q29LeUppMCtrb3NMeVpSZ0NHWWZXSzJ6c08yb0p3RXho?=
 =?utf-8?B?bnpKQW5lc1JHV1dBZEg2YVVrdHIvN1ZIK3EySTNUdnNMdjFuVEc0TUhQbHpw?=
 =?utf-8?B?V3ljd3hyTkR0ZWhZUnlzRkVyYVRpVnQwc2trdStPWmR4ZEVWYmdINGxzQlhS?=
 =?utf-8?B?cTYyYWU1Z2dqK0NPK2JkcmV1ZXBVdlVtbmxmb3hRMnVtTkYwR1BTMEZleHpu?=
 =?utf-8?B?UU1XUi91UHBlTld5WGphb3RIeVJqUE5GaW1OU0tBT0NYWXk0NVUzQWpEQUdt?=
 =?utf-8?B?bktkbkZMdzlnNnF2MXJOUWhUSmJYMXY4VEg2Qk12Y3dSUmxkUGhsd0xxNWV4?=
 =?utf-8?B?ajBUUnBiNlRFV0NvaS8wb1JFeXZETVNyTmpvZEhDc2JLV1ZwWjV1REg4YXht?=
 =?utf-8?B?RFdqaTdjZStsYnl1M2JMT0Z3Y0xIVU4wVGFFd2x2RStDaG93T0FSYzhQbDly?=
 =?utf-8?B?TUNpdllPSFBSL3JKZVBYUmhXbXdIYmpSenZqaTFQMWlXa0hZcXNkQjBHbzE2?=
 =?utf-8?B?MVhVUk1tTHlBRU1ZbC9qaEJLTTNjbHNoT0RTSDhReGlmenN1d3hnWGpNTG5W?=
 =?utf-8?B?QWdkbkZxb1dUR3lEWFZYVFZ0Wkd6L1czdTFyUVJGdUN1S1NEMS9kdzE2Q1hh?=
 =?utf-8?B?aG5FVUFmWUtrNit5UjQvWjNkaFRpRHlBZFJrb041ZzREaXoybXZkU0NkbGI4?=
 =?utf-8?B?RkdHMk5UNjdxMlhaMGtOMERGWkpINmNuWStuOWdMZDI0eWFOWDdEUmNwVXNX?=
 =?utf-8?B?bzR6ZkpZMXhBWGRTR2pXdmhtK2d2WVZ6V0FxVENiazNXM1VkQnNsSDloRWFN?=
 =?utf-8?B?eE4wMVJxQUFLRHVlUVFLZWh6MytpMmtCOThhMWltckZFbnVtVHlYM0lkT0VX?=
 =?utf-8?B?clNKRW9haG81SlBPcW5GWVROQnJZNlE3VnFuYmViUUhwOHZMNTdPby9sK3FL?=
 =?utf-8?B?Y0V3VFN5aExjOXdFZW1IMUhwbWpjZUpMQjRyb1UyZHdLUDMrZmlkS1JqQXJH?=
 =?utf-8?B?MEFJZHdFV3pSMjVzWndya2NWR2thVW9YNEhnMjhTOGM5K3c3R2lvaEc3Q0w0?=
 =?utf-8?B?RGtCcklSUDFRWlN2QlcvRW1QaWN3VFdiUlJ6a3FZR0hnSWxuZ1lmcUtlOGdM?=
 =?utf-8?Q?2M9mvruphfXFFp30=3D?=
X-Exchange-RoutingPolicyChecked: UZTHkPsntTRXcXtLMW5yKDYlLRHrf1Sla1qNd9iaRI7pcYiBiVLKHN2wuHhio0BQEF+8W3X1IMXrgw7YlimjPMI9rDK+V2doMAtoWYPc2/JqfzYC9ptTSPxXy84w1wvLAecqcoeEr5Dk1CFvFnp0Z6WkisGBvyjVAWUJ85oS0s1hOJ/DVP8VGHxBtYylJu2SgbxaWGGwzkfWWrzhmklgcuvbM0GxbYc/2Zz7f0iW3ENV9ps88uBrW8weMcIHxfu1k9w9qJCKSm7HpiHzmdTC3R64KzCd7PXYDqtAtvBE7CWy+1pEmMpdLsLpCTibGLCj9rMqP7c5kaSQyasE69sGaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8ea945-b1a6-4d04-78f8-08def3c901b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:42:58.0991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cW3zSX5blvTiwmWWWrfI6eCtxqXJt+YftWtz9OGP99Q8jpiaKaAVsxjUje4Fs7khOij/t2gYT6UIUKFjIaPQ+5cbb3r9L6nbCBBamgI4B5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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



On 8/6/2026 1:00 PM, Mallesh Koujalagi wrote:
> Use xe_log_err() for pcode timeout errors instead of drm_err(). This

s/pcode/PCODE ?
> adds PCODE component tag, making timeout issues easier to detect and
> track with automated tools.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index c492737242d3..b5a59a227167 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -220,8 +220,8 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>  	 * requests, and for any quirks of the PCODE firmware that delays
>  	 * the request completion.
>  	 */
> -	drm_err(&tile_to_xe(tile)->drm,
> -		"PCODE timeout, retrying with preemption disabled\n");
> +	xe_log_err(tile, PCODE, -ETIMEDOUT,
> +		   "PCODE timeout, retrying with preemption disabled\n");

drop the "PCODE" prefix, as xe_log_err() will decorate dmesg with "PCODE: " for you

>  	preempt_disable();
>  	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
>  				true, 50 * 1000, true);

