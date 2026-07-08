Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C58C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 18:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D6D10E64D;
	Wed,  8 Jul 2026 18:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L76Fr5Ri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8610E64D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 18:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783533983; x=1815069983;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZiYB7OmqzvprCqgPA1HctN2s/JBWQMJ4UzW7GN0gsPs=;
 b=L76Fr5RiLSNqC1ouVRog0nZ7pMwZIWO/qdg0uO2Hq173g4jCalUMHqtp
 tZXJUmwFdm5TfyfyoVNgVNVHC7e6AvKGnAWWkQwqDsA6DICvPefFgzMPV
 UeSzkH9IQyJ3hstHXmnPspmTy6WbIYwtP65e7XRC7uTW1RZ0tAdrYF5Ep
 7TzH+r2LzQRhWW0GqkKwORFVSD1PBGbTGSDqty00fTbkaU0CwPBww8Ieu
 PU3yn/RmsMzHFt7EZ0HM70YJKDsITzGHk7USAMT0GjZ2DJNl5MKiLRbHj
 yFgGzqzdleaxhdk+5K1JgxUzX13W6NNW9o6xdQBcbaU1a0tInQX2xwTNa g==;
X-CSE-ConnectionGUID: IEEGLQq/RieMSjLdlyE0rw==
X-CSE-MsgGUID: uDdUtoWaSfSgxfytFwf6pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107002248"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="107002248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 11:06:23 -0700
X-CSE-ConnectionGUID: ERlYXCphR26o1s++fg9fxA==
X-CSE-MsgGUID: v8LSGysPRlO6qNglu2jyqw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 11:06:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 11:06:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 11:06:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 11:06:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAggd951sMlFv0zDGdBExjvSUw42fhr32CsmJujxhn0eraTj7zsCGP+i8YzkHgGzo7npcLt9y6WeYThzqadKgD9ZI2WLFsuKBDkoqhUUgDlr7JswmOO76lU/sdRbJ6S4t1bXtptNRNaq/61T8oZAVmdlk1ynDXDWcRhC78IDRQrtZmlEEoChW08SFecQhB2pDbJYP4CmcpOHi9Fcmr5DSGhAxOcDhySZ40GAgV1wGYhPPWUMSOFC06QjqLzg1Uxu6xnWKQbkYMI3hxtkCeHoPme6cXK9ZFa/erWwiF0qtbJ/IWPOFcf8GCHTxp5pcgCqlYxLghdbWyzTLHOtNOCWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO1iCjiltKK+Bo9c045q4YLEyZ/1sIytK+8gcAL38kw=;
 b=wvVJcpueQ8fhwe3Lzn2G14lrx11LE6u/86q0eeoY3gJNUA7aN/vUYhc9b3hlu1rX1eKcJXwsh9bPX1p8A+1twooN+dceETmRn86v4Rv0T+rqdpYe1Ok4bTf2jYMl96iAfPw+GrKEEjDFm5pnJC7ipdk8/NrqjCnqPs05vEh9sL4OpArVmbtHlPFIboLgR2nuCzP3kbpoARIIEZrlY/i7TLqKq7YwVVBkH2eNScWBll++/y7RcQEXUoxOGDIx7V3HmPskrZauymcLOLpnXeUv2yE+ib1ulBizoGyRR1hpBCuY3JbxAaWedP7SMRr+OwaCTV4Yjlr0iqX69OxSMA/z3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSWPR11MB9584.namprd11.prod.outlook.com (2603:10b6:8:36e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:06:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 18:06:16 +0000
Date: Wed, 8 Jul 2026 11:06:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Add disable_multi_queue attribute
Message-ID: <ak6RlJL-Lu8_aCXd@nvishwa1-desk>
References: <20260701203805.3007798-1-shuicheng.lin@intel.com>
 <ak3EDcmH4KCEFP3a@nvishwa1-desk>
 <DM4PR11MB54560AF13F7EE90B43E2F60EEAFF2@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54560AF13F7EE90B43E2F60EEAFF2@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSWPR11MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2f342f-61b5-46d4-5742-08dedd1b9a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|22082099003|18002099003|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: wSd0rLMJbo0M2drQ4fVM4PLF8C+2QQ/Kw18tHj0KRbWsh7GYdA9Y7l32lTLPy/lvxTw/BGugA/HLj6yVip5ahiq/VaHN8C6oe4m5PGGaHsaPozDgbxptFDOULELsx8snhO0SXzlWK/BYyOduQLpMRjIYNSJx1+3TdoIQGlmqE01WewkhIkjQZKJFI01DXtCz77lnz733V/HIe0ZI55kgIgbK7yLcruFyvkcZc/eY0UTXVR88sKBFwKbidUSGw0Uva9w9tCFH45PiuiM/CmbO3OJ+GyYuqFc81k9AiHTjioxRb12SKwPemU2he1G06bzm0kLnclmS5x0df9SVf6O8/YNXpQoM6FZBRIQ2KKbLqVt21/B/BZsZnYciW0i5OTUVbzb7gsPDbmP3fNpgayRJXHicC7Gkw/Ab17pr2E2kwjQDQFRMOihd/KnJNfTh0EhycswwE90M8xSW554HulbE2VdvYtgAnLAcccmwPWRkKDmWIJCromqoSQfk808iBHJV7GyIOyYHJnCPjQcoKMQx+j3rrOFgrY+FlD5a9NHYc4L/9/mqtdBwudXbn6asZcetxEdV0TPk9sUa1LIumxbJbPQjt+nGQNQ+punqBeULQd4RID3XwtajZWlxI1te/dV9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SSbSZZZNfRS9iziXgHaS8syTgXZP9bi0Xwg6mu3Ku8Tcqymsh0ve/ldFgQsK?=
 =?us-ascii?Q?WJm4ioQ6yTJWTca/7mG3we7XCnW4uvKvrDQUM+Vkim0NxH/Y9oO94PCBq2Dq?=
 =?us-ascii?Q?wvc+BIK3Fb03pi4W2fCDwtm31hPEe5vZ/QhvIjsWY2ujrtJOqxheGeCfGjsV?=
 =?us-ascii?Q?xJvWuCkCDTlh+du2aIlArXQiMgXEOBTIygIPnBZgEc7yver6auA0NpHV5LgZ?=
 =?us-ascii?Q?HhsIzhc0sQAkdVm4EkqTnN2mEHzJP82F10eosSEih0YrrtRHI5CTgGnwiDTd?=
 =?us-ascii?Q?oD/y+tnCIaKt3A+Qm+0/Bd5/XTECu3Lr9x0umoa4fj18+z1ElQ/W2HLpZA7M?=
 =?us-ascii?Q?g8UW8p5PByX4wKdaMY0DBpsuHqH/PUvZlrGCPr7Szrk272f1z6KFlA8fP7JX?=
 =?us-ascii?Q?54Luy1KpyORSsz0c4l4SQCkLq0UtfHw3ed4awG3lt6hnrj+vNW7Bau72e+FI?=
 =?us-ascii?Q?E8TbiwaGRagNS0fz9Tsebe0NHWd8El2NPDMCT2bvKgLqWSp1zVSlAinBw790?=
 =?us-ascii?Q?t9a6U2KGmaEjtrNamMkoNFwEKblcNIlVg86DOeqsgT/OQjIX2g92vPcTqLic?=
 =?us-ascii?Q?XIw5R4/XkE4aM3lGXzX2JlGWDIzmqiEMIcrikf3S2k2N67NJrkHPJwtJ/lEI?=
 =?us-ascii?Q?ABVPGthP+s9HBU2QItVHoKY9w3gbb0hTJi4CfWezhwJheUCaIz9iSkKbA/ba?=
 =?us-ascii?Q?iEkRZtwuWbDPChZgL4TbC8OlpcfB1Gy5ofrA9NzHk7KVr6Mng20hvoRj2/ZS?=
 =?us-ascii?Q?wKNxDEYqkdldCELA452j3AyIWuatMlMiD91AiKpkMLjmHSP/PFp3rJwamys2?=
 =?us-ascii?Q?oaUc0ENhE9vTjuLz/dyEBimxT91x54w5xWlMkQWS2uHCwQtLwPbwQfQhKi0V?=
 =?us-ascii?Q?GCXy7KlT2wSzdMCsv9My/86HXrQYsLOehlJrLTi1pC4UYgDunWWxC5NPKCaz?=
 =?us-ascii?Q?2pb5PRKHQwEYKKHaLpT/a4PZmtT0oebto9kghDdy8LbITA51ziPbEz4t/vZQ?=
 =?us-ascii?Q?dqlAXb4gEvvglT6suRmVQUwBUIXBwE+yifbhQGkIISHctubPvgyXHxM+wmn8?=
 =?us-ascii?Q?q2KSkk8tQbF5V24bseLerwGiZpoH5SlijE5CYS4DTpm6mO9fQgTlQHL7T57U?=
 =?us-ascii?Q?m6vQ9iWT3EWX6R8K5OPAWY/c5SGlHtGiHcRluQbeZfE6HWsvuQQjJG4206w9?=
 =?us-ascii?Q?xbnJh+9S45v3E5NjmyJhgyziv4ohvpw7ChvH7noAzhbAIgXj+GbAQAnQZMzR?=
 =?us-ascii?Q?ShlZaCRBwtXVNnMWffFMRq3j+O208+3ruLKRhqpjhrlBjfNO50AEXPNf/N8n?=
 =?us-ascii?Q?Jxhpi1HNYOvkzqrndZRDH+2EeUYn2l4eAUXt8EV+FA0eGVna14W3ccW2drAT?=
 =?us-ascii?Q?KNKj6kYYNe3TCk8dphOtygFDxmaKqKC707JQxg9NAUslTXhFl8nUfxnioElX?=
 =?us-ascii?Q?V22BExAwwX3/Px7eCI1idh4t8mjXB3O/9bSFDlwYtIhvmX9az0B0sHA7JIM9?=
 =?us-ascii?Q?7q+idC9gPRVc/GkS2wTl0tgAA2GTcgPnZ1WAcqvt0QLMqYTlU/xHW4afFRPJ?=
 =?us-ascii?Q?X8F9evtfffP0yWERE2xitkSyldd4qhfguk83YFFj2uLwsrGeEFqvSgD0hOrr?=
 =?us-ascii?Q?6j6d+V4CdVVQIizrCPQJcKKOt0cgMq/7dQjfC+ty2Dcza+IaW+lLsaip+QX5?=
 =?us-ascii?Q?kqzNeGC2BukV1Vil1q8D29L6LL11ySF1r+8SqitEHxAyD0J+RVRvTJPOLbTB?=
 =?us-ascii?Q?ApUMLxT9+iv83Uwhs22vWDA2wHGOig8Y5aAFr6Qxa1FVxkD0n9Ii?=
X-Exchange-RoutingPolicyChecked: ZrrrvrYCuQWjr6bag4YCtUUGn/lU1oR7VvxSrm4HSk57lpLexEnoXW56Yx+NidQTkxhOB3IMBfzKa/UNZ6MtsyTtbrupb1YRBrvXyGQ+rh1l35tuIOZyEpfn6CZ5oB5aiW6KEBMoA6hQxw5+iGVs47hZDpDGK+XbkkMHCB1UINEZO5+a5Yatvc0MMmC/uch05azBxomN0QKJDiQsuQd8dGU2wLv5g8FZuTS7nPh+DWNv6w5aUWAdweOud/L5D+QvMy3yFmTm/dvtkBjKKXvi1+xA3BWXEeBTxlYaxvSg6lm/YmzQsjTbqcLuGpFRFPROBI6SE8dNGgScxtTyMrmdSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2f342f-61b5-46d4-5742-08dedd1b9a31
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:06:16.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUj5NqNM9uCwcGr39jMquxR2FzSeijAGRNKjEt0SJlEX7nHXanW+Vyiq/YvUxtdvyYlASU4uwBLuHS7xW2y6U7xcbwQY/bcyNEl7WP6TcWk0km42hX3KJ8q0KN1p7PR7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9584
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

On Wed, Jul 08, 2026 at 09:18:27AM -0700, Lin, Shuicheng wrote:
>On Tue, Jul 7, 2026 8:29 PM Niranjana Vishwanathapura wrote:
>> On Wed, Jul 01, 2026 at 08:38:05PM +0000, Shuicheng Lin wrote:
>> >Add a new configfs boolean attribute 'disable_multi_queue' that lets an
>> >administrator force-disable multi-queue support on a device before it
>> >binds to the driver. This is intended for debugging and for validating
>> >non-multi-queue code paths on hardware that would otherwise expose
>> >multi-queue.
>> >
>> >The hook disables multi-queue at two levels:
>> >
>> >- UAPI: In alloc_primary_gt(), clear
>> >  gt->info.multi_queue_engine_class_mask on the primary GT so that
>> >  xe_gt_supports_multi_queue() returns false and attempts to create
>> >  a multi-queue group via
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP
>> >  are rejected.
>> >
>> >- GuC: In guc_ctl_feature_flags(), set the GUC_CTL_DISABLE_MULTI_QUEUE
>> >  (BIT(24)) init-params bit on GuC firmware older than 70.66. On GuC
>> >  firmware 70.66 and above, guc_waklv_init() emits the new
>> >  GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE Feature KLV (0x5001) via the
>> ADS
>> >  WA/Feature KLV buffer instead. Feature KLVs share the WA KLV buffer.
>>
>> Looks like we are not at guc firmware version 70.66 yet. I am not sure about
>> coding for future guc firmware releases. Probably fine if the firmware has been
>> already released to the public and just that we are not upgraded to it here.
>
>Yes. The guc firmware upgrade is on the way: https://patchwork.freedesktop.org/patch/738414/?series=169961&rev=2

Ok

>
>>
>> >
>> >The attribute is rejected after the device has been bound, so it only
>> >takes effect during probe:
>> >
>> >	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
>> >	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>> >
>> >Assisted-by: Claude:claude-opus-4.7
>> >Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> >---
>> >Cc: Stuart Summers <stuart.summers@intel.com>
>> >Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> >---
>> > drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  3 +-
>> > drivers/gpu/drm/xe/xe_configfs.c      | 63
>> +++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_configfs.h      |  2 +
>> > drivers/gpu/drm/xe/xe_guc.c           |  8 ++++
>> > drivers/gpu/drm/xe/xe_guc_ads.c       | 14 ++++++
>> > drivers/gpu/drm/xe/xe_guc_fwif.h      |  1 +
>> > drivers/gpu/drm/xe/xe_pci.c           |  2 +
>> > 7 files changed, 92 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> >b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> >index 644f5a4226d7..998272a007e5 100644
>> >--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> >+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> >@@ -491,9 +491,10 @@ enum  {
>> > #define GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MIN_LEN
>> 	1u
>> > #define
>> GUC_KLV_VF_CFG_ENGINE_GROUP_PREEMPT_TIMEOUT_MAX_LEN
>> 	GUC_MAX_SCHED_GROUPS
>> > /*
>> >- * Workaround keys:
>> >+ * Feature and Workaround keys:
>> >  */
>> > enum xe_guc_klv_ids {
>> >+	GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
>> 			= 0x5001,
>> >
>> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOC
>> KED				= 0x9002,
>> >
>> 	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTR
>> Y_RESTORE_AT_EXIT		= 0x9004,
>> > 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING
>> 				= 0x9005,
>> >diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> >b/drivers/gpu/drm/xe/xe_configfs.c
>> >index 32102600a148..cd94f0d80edd 100644
>> >--- a/drivers/gpu/drm/xe/xe_configfs.c
>> >+++ b/drivers/gpu/drm/xe/xe_configfs.c
>> >@@ -237,6 +237,16 @@
>> >  *
>> >  * This setting only takes effect when probing the device.
>> >  *
>> >+ * Disable multi-queue
>> >+ * -------------------
>> >+ *
>> >+ * Disable multi-queue support on the device. Multi-queue exec-queue
>> >+ * group creation via ioctl is refused, and the GuC feature is disabled.
>> >+ *
>> >+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/disable_multi_queue
>> >+ *
>> >+ * This attribute can only be set before binding to the device.
>> >+ *
>> >  * Remove devices
>> >  * ==============
>> >  *
>> >@@ -262,6 +272,7 @@ struct xe_config_group_device {
>> > 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> > 		bool survivability_mode;
>> > 		bool enable_psmi;
>> >+		bool disable_multi_queue;
>>
>> Why not just name it enable_multi_queue and have it enabled by default?
>> Looks like that is the generally followed convention.
>
>The enable_* convention fits when a feature is off by default in the driver and userspace opts in (e.g. enable_psmi).
>Multi-queue is a platform HW capability. It is on by default where hardware supports it.
>This attribute is a force-off override for debugging, so disable_* with default false matches the semantic.
>Also,  enable_* will be misleading for platform that doesn't support multi-queue.
>I'd prefer to keep disable_multi_queue.
>What is your idea about it?

To me it is a config (similar to a compile time kernel config) and
probably it should just be 'bool multi_queue' and if set, config is
enabled (irrespective of platform has support or not) and if clear,
it is disabled. That said, I don't have a strong preference, so I am
fine.

>
>>
>> > 		struct {
>> > 			unsigned int max_vfs;
>> > 			bool admin_only_pf;
>> >@@ -281,6 +292,7 @@ static const struct xe_config_device device_defaults
>> = {
>> > 	.engines_allowed = U64_MAX,
>> > 	.survivability_mode = false,
>> > 	.enable_psmi = false,
>> >+	.disable_multi_queue = false,
>> > 	.sriov = {
>> > 		.max_vfs = XE_DEFAULT_MAX_VFS,
>> > 		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF, @@ -575,6
>> +587,33 @@
>> >static ssize_t enable_psmi_store(struct config_item *item, const char *page,
>> siz
>> > 	return len;
>> > }
>> >
>> >+static ssize_t disable_multi_queue_show(struct config_item *item, char
>> >+*page) {
>> >+	struct xe_config_device *dev = to_xe_config_device(item);
>> >+
>> >+	return sprintf(page, "%d\n", dev->disable_multi_queue); }
>> >+
>> >+static ssize_t disable_multi_queue_store(struct config_item *item, const
>> char *page,
>> >+					 size_t len)
>> >+{
>> >+	struct xe_config_group_device *dev =
>> to_xe_config_group_device(item);
>> >+	bool val;
>> >+	int ret;
>> >+
>> >+	ret = kstrtobool(page, &val);
>> >+	if (ret)
>> >+		return ret;
>> >+
>> >+	guard(mutex)(&dev->lock);
>> >+	if (is_bound(dev))
>> >+		return -EBUSY;
>> >+
>> >+	dev->config.disable_multi_queue = val;
>> >+
>> >+	return len;
>> >+}
>> >+
>> > static bool wa_bb_read_advance(bool dereference, char **p,
>> > 			       const char *append, size_t len,
>> > 			       size_t *max_size)
>> >@@ -812,6 +851,7 @@ static ssize_t ctx_restore_post_bb_store(struct
>> >config_item *item,
>> >
>> > CONFIGFS_ATTR(, ctx_restore_mid_bb);
>> > CONFIGFS_ATTR(, ctx_restore_post_bb);
>> >+CONFIGFS_ATTR(, disable_multi_queue);
>> > CONFIGFS_ATTR(, enable_psmi);
>> > CONFIGFS_ATTR(, engines_allowed);
>> > CONFIGFS_ATTR(, gt_types_allowed);
>> >@@ -820,6 +860,7 @@ CONFIGFS_ATTR(, survivability_mode);  static struct
>> >configfs_attribute *xe_config_device_attrs[] = {
>> > 	&attr_ctx_restore_mid_bb,
>> > 	&attr_ctx_restore_post_bb,
>> >+	&attr_disable_multi_queue,
>> > 	&attr_enable_psmi,
>> > 	&attr_engines_allowed,
>> > 	&attr_gt_types_allowed,
>> >@@ -1098,6 +1139,7 @@ static void dump_custom_dev_config(struct
>> pci_dev *pdev,
>> > 	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>> > 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>> > 	PRI_CUSTOM_ATTR("%d", enable_psmi);
>> >+	PRI_CUSTOM_ATTR("%d", disable_multi_queue);
>> > 	PRI_CUSTOM_ATTR("%d", survivability_mode);
>> > 	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>> >
>> >@@ -1225,6 +1267,27 @@ bool xe_configfs_get_psmi_enabled(struct
>> pci_dev *pdev)
>> > 	return ret;
>> > }
>> >
>> >+/**
>> >+ * xe_configfs_get_disable_multi_queue - get configfs
>> >+disable_multi_queue setting
>> >+ * @pdev: pci device
>> >+ *
>> >+ * Return: true if multi-queue should be disabled for this device,
>> >+false
>> >+ * otherwise.
>> >+ */
>> >+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev) {
>> >+	struct xe_config_group_device *dev =
>> find_xe_config_group_device(pdev);
>> >+	bool ret;
>> >+
>> >+	if (!dev)
>> >+		return false;
>> >+
>> >+	ret = dev->config.disable_multi_queue;
>> >+	config_group_put(&dev->group);
>> >+
>> >+	return ret;
>> >+}
>> >+
>> > /**
>> >  * xe_configfs_get_ctx_restore_mid_bb - get configfs
>> >ctx_restore_mid_bb setting
>> >  * @pdev: pci device
>> >diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>> >b/drivers/gpu/drm/xe/xe_configfs.h
>> >index 07d62bf0c152..d41f52bd66b7 100644
>> >--- a/drivers/gpu/drm/xe/xe_configfs.h
>> >+++ b/drivers/gpu/drm/xe/xe_configfs.h
>> >@@ -23,6 +23,7 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev
>> >*pdev);  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>> > u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);  bool
>> >xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>> >+bool xe_configfs_get_disable_multi_queue(struct pci_dev *pdev);
>> > u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>> > 				       enum xe_engine_class class,
>> > 				       const u32 **cs);
>> >@@ -42,6 +43,7 @@ static inline bool
>> >xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return  static
>> >inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return
>> >true; }  static inline u64 xe_configfs_get_engines_allowed(struct
>> >pci_dev *pdev) { return U64_MAX; }  static inline bool
>> >xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>> >+static inline bool xe_configfs_get_disable_multi_queue(struct pci_dev
>> >+*pdev) { return false; }
>> > static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>> > 						     enum xe_engine_class
>> class,
>> > 						     const u32 **cs) { return 0; }
>> diff --git
>> >a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
>> >4023700ff2a9..cdd096a37e05 100644
>> >--- a/drivers/gpu/drm/xe/xe_guc.c
>> >+++ b/drivers/gpu/drm/xe/xe_guc.c
>> >@@ -101,6 +101,14 @@ static u32 guc_ctl_feature_flags(struct xe_guc
>> *guc)
>> > 	if (xe_device_is_l2_flush_optimized(xe) &&
>> xe_gt_is_media_type(guc_to_gt(guc)))
>> > 		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
>> >
>> >+	/*
>> >+	 * On GuC firmware 70.66 and above, the
>> GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE
>> >+	 * Feature KLV is used instead.
>> >+	 */
>> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev))
>> &&
>> >+	    !GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 66))
>> >+		flags |= GUC_CTL_DISABLE_MULTI_QUEUE;
>> >+
>> > 	return flags;
>> > }
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>> >b/drivers/gpu/drm/xe/xe_guc_ads.c index c98454545a85..898ec2c6f015
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> >+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> >@@ -16,6 +16,7 @@
>> > #include "regs/xe_gt_regs.h"
>> > #include "regs/xe_guc_regs.h"
>> > #include "xe_bo.h"
>> >+#include "xe_configfs.h"
>> > #include "xe_gt.h"
>> > #include "xe_gt_ccs_mode.h"
>> > #include "xe_gt_mcr.h"
>> >@@ -364,6 +365,19 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>> > 		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>> >
>> GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG);
>> >
>> >+	/*
>> >+	 * On GuC firmware 70.66 and above, use the Feature KLV (shared
>> with the
>> >+	 * WA KLV buffer); older firmware uses
>> GUC_CTL_DISABLE_MULTI_QUEUE in
>> >+	 * the init params instead.
>> >+	 */
>> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(gt_to_xe(gt)-
>> >drm.dev)) &&
>> >+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 66)) {
>> >+		u32 data = 1;
>> >+
>> >+		guc_waklv_enable(ads, &data, 1, &offset, &remain,
>> >+
>> GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
>> >+	}
>> >+
>> > 	size = guc_ads_waklv_size(ads) - remain;
>> > 	if (!size)
>> > 		return;
>> >diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> >b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> >index 3fbda4798cff..971b850f2136 100644
>> >--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> >+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> >@@ -68,6 +68,7 @@ struct guc_update_exec_queue_policy {
>> > #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>> > #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>> > #define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>> >+#define   GUC_CTL_DISABLE_MULTI_QUEUE	BIT(24)
>> >
>> > #define GUC_CTL_DEBUG			3
>> > #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
>> >diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> >index 03362480e3e0..23ef2c7b6bce 100644
>> >--- a/drivers/gpu/drm/xe/xe_pci.c
>> >+++ b/drivers/gpu/drm/xe/xe_pci.c
>> >@@ -862,6 +862,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile
>> *tile,
>> > 	gt->info.id = tile->id * xe->info.max_gt_per_tile;
>> > 	gt->info.has_indirect_ring_state = graphics_desc-
>> >has_indirect_ring_state;
>> > 	gt->info.multi_queue_engine_class_mask =
>> >graphics_desc->multi_queue_engine_class_mask;
>> >+	if (xe_configfs_get_disable_multi_queue(to_pci_dev(xe->drm.dev)))
>> >+		gt->info.multi_queue_engine_class_mask = 0;
>>
>> May be add a print statement here like "disabled via configfs" similar to one in
>> check_sw_disable() in xe_hw_engine.c?
>
>Let me add it:
>" xe_info(xe, "Multi-queue disabled via configfs\n"); "

Make it xe_gt_info().

With that,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
>Shuicheng
>
>>
>> Niranjana
>>
>> > 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
>> > 	gt->info.num_geometry_xecore_fuse_regs = graphics_desc-
>> >num_geometry_xecore_fuse_regs;
>> > 	gt->info.num_compute_xecore_fuse_regs =
>> >graphics_desc->num_compute_xecore_fuse_regs;
>> >--
>> >2.43.0
>> >
