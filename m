Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85EFCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 18:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127E113413;
	Thu,  4 Apr 2024 18:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVu1a2Jw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C49113412
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712256669; x=1743792669;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EFTIxpaXe5ICwoB6YYdpP/Y38vwJvzsK+EzAW5KyKnQ=;
 b=BVu1a2Jwztjl0Eup4Qul4+0+HSMOtNjbrEdnRbYuJ+2K8dYVEpTEDqF0
 fDs2F1A3+90juAyO3yuDpPjQ8iOdNxpbsq5Sn9CgyqxVsjiQ/5tzhR3en
 oImLffvUF62s4+k2ChQRzZvji0uAy84+BUaS+cX7ikHzxP5hAewm6ih8R
 cn6FiKK1YqGB/5g72iK0AcYgNCaGff5ZvMie7vYq3bTrHGea4TRYGXVfR
 2qDDwyDkwSiXMuskLBA3IAfqk5AHWUH729/FN7t72FpzywA8SRTbBGfcO
 jEJIPunWF2PSbv7BTQN3lQ8kbzZ1GYwKKnivwN2uSqHw1su3JbiiH9eoB A==;
X-CSE-ConnectionGUID: pzd68u2BRQCD0ygMlHBM5g==
X-CSE-MsgGUID: Cc82gl6RSsqbl0M/t/J1tw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11341211"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="11341211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 11:51:09 -0700
X-CSE-ConnectionGUID: /9d5T/KwQw25Lb0HLfoE+A==
X-CSE-MsgGUID: 4tqhU5aVQZinBYp69Nw8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18991015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 11:51:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:51:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 11:51:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 11:51:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 11:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJvx1anV3yLSfIgXIiFAFUcFdCRCWxCeuCPbO0+w2uWNBnwSnqbQjay275rTo6wX6upFDAVas0LNo2Aiz6NsxLeZvPHKhGN+vCMDmqbM/Xtn85DQfbqzubx5IHEcuawwYubS58HVbkz9P3Fl8elpOFIsJGtQVaeSzjN50tzsXjHHq7rZqAt8GBDO6lBs1lf7Sam3gZNuq6/C4VFv/daT2Ju0zxRrhkIbvLYP3rWDiHBgCAVJFu+qyK9i2YHfkbcuyiD2bLLjQdXleF6ZzzeghubpxMrPVGp9Qo7GNne2Qhx25NI9Le91gpmFk+70gsbS3b/p2of7qdQkydUCmhdDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECsFVj4Ay2UNn1ccyLB27KQXEHR+IXpP/5XmiZ40+1E=;
 b=O44vkZ9qx46nF65fGvtaHrkLfogmy8fIMDC6GFMAUGeTow4GW/iIa/iKqf5AsS4DvkAqnQEbXvkW9WG3bH0zQ2KlN7Yj+FvQ/gk4AgB/5LsEAE0er5GeRNvuY0gSY44tyWv4szK8G9q+nCSgQcOCPV+Df8a4MDggw/tCvSvhrjK8wxEfJ98I33Fe5asxzFVkj0sYBowlZSyCtZtc14wo0938Ec+aXem6TFgxrhEwaEdHEDnoz7img8lQNsHZUXrq6zgVbJIjAJdDfKZci6RWn/ms7uKKgN0/92wbmYyizl1XXAGy2uQ4KboLg6OoRyPu9nY8fnnN7eY/D/zGtYFPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7208.namprd11.prod.outlook.com (2603:10b6:8:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Thu, 4 Apr
 2024 18:51:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 18:51:02 +0000
Date: Thu, 4 Apr 2024 13:51:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Message-ID: <muilerdtlcqpju2pstbbxspws7tkxyg5dxah7n23co3se77hpx@njdbgtobuusy>
X-Patchwork-Hint: comment
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-3-John.C.Harrison@Intel.com>
 <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
 <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
X-ClientProxiedBy: BYAPR06CA0066.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7208:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUzmJRDUAN/71LhhSuba1z/e0/hN9e3BPA56G11hlsSFYevZPUswtT0GhEHbNTOQTn7vAg59L+D8zBm8H1YxQwH4Ehl3+qDshfJJH/WyG7vCCSNbbFBh/IRTiycAHiqUKhP2SlHPnYD42DSfdP3BFyDO2d+x4B+GMXlUOPnSX57DJIFDYE/6UCkPfoCqF6mQmzJb2EJnErPl0ZNvOFC6gIiINaGxWW6PN824DKxGYLK0/dOzOEpUz8IYSeu6TDd7OgLuy3fv2Gs8kQbvk3JCryqwNzOdzlAphTdzfOOyGN9fPrMQn6Z4fM4I8aGWImVuIYT2wbdzhVGmSiCG8wSIytTlsowSJEvEO+8q84y3Cyev6nopPhcP1TDHWybNyEleXkkvkndCrTzP5AgpM7tKh0lkQ2MhXTDkQeL7B4Cb0JgZrWk3etfy1gqxqldNdQWDRkN3PSWIPz8o9eUtnJfayTURm6YLvfLTAjzIV1DXhYYEGRyCX77oOu43Ck53p7Ea1czCZEuxDoGyekPZqpowsA8+FGJQoVuUhPNg1XlROWVU1+eK3FdSrWOfVveCeuunW1X0TFKhCFMdTvHYCRUuodXSUdz809vV1vvWKmirwlEFEpVqErdzP8Ly0GBshgHlz0lSO1Dn291F7P3/2zzQ3gvbUqSFFrikjmJo6R6fl42zmimtYbrq0TRUZv1y7KzEqN+xjf8zgX19HAztgvFkDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?76PXGJSN2gtX10R5/OgHwYjywoZJtupkcwcwvm/C3kxuUpdpbtHlBJkQFA?=
 =?iso-8859-1?Q?+u5GGE2tUmKRF50qW3pD1TSUBS2t+YgrlQsXafJOtz8zFRWYC6rrE33VBv?=
 =?iso-8859-1?Q?WT0dI0ofgl9CRFWA6S6I+s/WYh5QgSDXxI42sST9hbQ4S3IAGgvGYYvK9Q?=
 =?iso-8859-1?Q?gjizxx1lSmSkvODvpZT/FMuysa/VVC5Y8AZ2Ovcl2/4SoF5GTAJUnkXLD9?=
 =?iso-8859-1?Q?UXKwU0eHfOBveCz0lpiPPwXoIlT3M+OCwbpZLLpIal5PvHQmqZszq1iEUk?=
 =?iso-8859-1?Q?PfC0aL6gcUSL/caN8tne1HEPTB+plPQlCgQyJUqVaqWjbIXGuwwC+C7W6T?=
 =?iso-8859-1?Q?XUVWbaEFKz63H1o7BXg66ZLLUHlkhlYc4cYqFIT179jNwT6Nkid1PpdY2L?=
 =?iso-8859-1?Q?l4WwQH5UhxzhQ8HuKbriXf/4XIEdGHR672k5evhBmmOegn3LyX/DFSr28o?=
 =?iso-8859-1?Q?Haj+hqg+yjzcsZor0waolmkDVj2oqfa5NET7NMuEtByhFXQTL3eLMC93bj?=
 =?iso-8859-1?Q?JWiP3MbCbH83otlvjY0exiOYLroXdNJlnyJvyLACxpmkLPGmVIdWFKTTS0?=
 =?iso-8859-1?Q?RU5pqO2kuU1piS/FBvS6XU/DwQ+jEZcOExRo/bGTK0Hie3dKf8u7vbvucz?=
 =?iso-8859-1?Q?A70Sre6upRLJApKuHcb+z3DiWsiSTySnwNIvPzNA0xr4v8YgquxRAJBfKd?=
 =?iso-8859-1?Q?1LnLqh29X8D0LDZkKX21S2oC9H3TbSRgsBKcuSad+YRvERyL1/Ui/w2pRq?=
 =?iso-8859-1?Q?/VbqeHWL6VE+3WkDgvkPCqvHC3M9XrimLaMnMW6cjF92irMdb8eGyX8xN0?=
 =?iso-8859-1?Q?SvTg/1PL6Fs13qCK9DgAnqt1GoyqNKLN1dGh4OsSQGe6WmdbOKxE5cn5Fz?=
 =?iso-8859-1?Q?KOjbhQye9t40A4JD3DnD5/v/fCGfkQdv82hG3yF2GFBe364xmpPv82ZvoZ?=
 =?iso-8859-1?Q?Bj3PtTggBN6f7/FCSW3/ZnDS3Bwa6nNxTe+2+2ZKggjeTtdseXi5K1DbbA?=
 =?iso-8859-1?Q?mCmGckUE72Pu/eIixbHSqnBXbdSSfFR5phvBYQWmDXFFgyqVkB4C6o/gMN?=
 =?iso-8859-1?Q?G/fnveH07g7OzoSCBuLruzIuNdW5KS2el+oZu94zMUPAC78KaRIPP+F6MH?=
 =?iso-8859-1?Q?4VSTBPYe7FK6B5zxAtO1EXKvHS7noiICjjiClTk4M2hzTNWuJOhde2nq/I?=
 =?iso-8859-1?Q?f+vJqNf+SKNwfGiwqPzxzE7YhUNC+a2RodL4vwJ9JkF2uNl1P4Y8EKrYyW?=
 =?iso-8859-1?Q?B7EBNhwCLx3ZkTWTs+oF7EeqSXTTIERmpYImmzPMapcgT5xjnk2UjmXL+b?=
 =?iso-8859-1?Q?ErNyE0IGlfWX8iMiyxnfUvPxonxzz7AzdU4/0dtJZryeK3t4Glb0kaG4C3?=
 =?iso-8859-1?Q?iWi1XY/UHrA8hiYQeT9196tPxsv/6zlAhGWaLULgSUecdZQIBSb9finDSq?=
 =?iso-8859-1?Q?5PzvEx5UpOUGs5Aq59vXbn+r2N9795hUx0+y78kB9/j/g5+Vy8gCpfle1V?=
 =?iso-8859-1?Q?pGpW8Od8f0b8GXboqePaQrelJp3rbfU/xQ9YXYxnBhc3xiIDiUscg5l6vC?=
 =?iso-8859-1?Q?t7EEDUory6w7ZJcTfb1WcnghGgRdzYd3C1PfLN8c52itKKG9sWzApZjviZ?=
 =?iso-8859-1?Q?VRB12mTYFCpsod8wH6xo+sehHz3GvImXEYcLxvCQUKDqK4h7iMx6rT+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8056d55-73bb-421f-e637-08dc54d82c9f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 18:51:01.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsRaT3CD6F7IeVjlE5Xn0kiDo3dRq5yufiQnXttciG7/YGBhljsvqEc0+CgRV5qVbYyqq2IvA7A6sIOgJRAf4f+vH5Gfr6APpm3LlEfohuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7208
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

I was checking the new version for this patch and remembered I had
already said somthing. You replied and I forgot to reply back. See
below.

Other feedback I will give in the new version (if there is any).

On Tue, Feb 06, 2024 at 05:51:24PM -0800, John Harrison wrote:
>On 2/6/2024 13:36, Lucas De Marchi wrote:
>>On Tue, Feb 06, 2024 at 12:11:51PM -0800, John.C.Harrison@Intel.com 
>>wrote:
>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>>GuC loading can take longer than it is supposed to for various
>>>reasons. So add in the code to cope with that and to report it when it
>>>happens. There are also many different reasons why GuC loading can
>>>fail, so add in the code for checking for those and for reporting
>>>issues in a meaningful manner rather than just hitting a timeout and
>>>saying 'fail: status = %x'.
>>>
>>>Also, remove the 'FIXME' comment about an i915 bug that has never been
>>>applicable to Xe!
>>>
>>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>>>drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>>>drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>>>drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>>>4 files changed, 214 insertions(+), 43 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>>>b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>index ec83551bf9c0..d0b5fed6876f 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>>>@@ -7,8 +7,12 @@
>>>#define _ABI_GUC_ERRORS_ABI_H
>>>
>>>enum xe_guc_response_status {
>>>-    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>>>-    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>>>+    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>>>+    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>>>+    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>>>+    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>>>+    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>>>+    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>>>};
>>>
>>>enum xe_guc_load_status {
>>>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>>    XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>>    XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>>>+    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>>    XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>>    XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>>    XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>>>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>>    XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>>>};
>>>
>>>+enum xe_bootrom_load_status {
>>>+    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>>>+    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>>>+    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>>>+    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>>>+    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>>>+    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>>>+    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>>>+    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>>>+    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>>>+    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>>>+    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>>>+    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>>>+};
>>>+
>>>#endif
>>>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>>b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>index 92320bbc9d3d..a30e179e662e 100644
>>>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>@@ -40,6 +40,8 @@
>>>#define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>>>#define   GS_MIA_IN_RESET            REG_BIT(0)
>>>
>>>+#define GUC_HEADER_INFO                XE_REG(0xc014)
>>>+
>>>#define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>>#define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>>>#define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>index 868208a39829..82514d395704 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>>@@ -16,6 +16,7 @@
>>>#include "xe_device.h"
>>>#include "xe_force_wake.h"
>>>#include "xe_gt.h"
>>>+#include "xe_gt_freq.h"
>>>#include "xe_guc_ads.h"
>>>#include "xe_guc_ct.h"
>>>#include "xe_guc_hwconfig.h"
>>>@@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>>    return 0;
>>>}
>>>
>>>+/*
>>>+ * Read the GuC status register (GUC_STATUS) and store it in the
>>>+ * specified location; then return a boolean indicating whether
>>>+ * the value matches either completion or a known failure code.
>>>+ *
>>>+ * This is used for polling the GuC status in an xe_wait_for()
>>>+ * loop below.
>>>+ */
>>>+static inline bool guc_load_done(struct xe_gt *gt, u32 *status, 
>>>bool *success)
>>
>>bogus inline
>>
>>>+{
>>>+    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>>>+    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>>>+    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>>>+
>>>+    *status = val;
>>>+    switch (uk_val) {
>>>+    case XE_GUC_LOAD_STATUS_READY:
>>>+        *success = true;
>>>+        return true;
>>>+
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>>+    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>>+    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>>+    case XE_GUC_LOAD_STATUS_EXCEPTION:
>>>+    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>>+    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>>+        *success = false;
>>>+        return true;
>>>+    }
>>>+
>>>+    switch (br_val) {
>>>+    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>>>+    case XE_BOOTROM_STATUS_RSA_FAILED:
>>>+    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>>>+    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>>>+    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>>>+    case XE_BOOTROM_STATUS_JUMP_FAILED:
>>>+    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>>>+    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>>+    case XE_BOOTROM_STATUS_EXCEPTION:
>>>+    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>>>+        *success = false;
>>>+        return true;
>>>+    }
>>>+
>>>+    return false;
>>>+}
>>>+
>>>+/*
>>>+ * Wait for the GuC to start up.
>>>+ *
>>>+ * Measurements indicate this should take no more than 20ms 
>>>(assuming the GT
>>>+ * clock is at maximum frequency). However, thermal throttling 
>>>and other issues
>>>+ * can prevent the clock hitting max and thus making the load 
>>>take significantly
>>>+ * longer. Indeed, if the GT is clamped to minimum frequency then 
>>>the load times
>>>+ * can be in the seconds range. As, there is a limit on how long 
>>>an individual
>>>+ * usleep_range() can wait for, the wait is wrapped in a loop. 
>>>The loop count
>>>+ * is increased for debug builds so that problems can be detected 
>>>and analysed.
>>>+ * For release builds, the timeout is kept short so that user's 
>>>don't wait
>>>+ * forever to find out there is a problem. In either case, if the 
>>>load took longer
>>>+ * than is reasonable even with some 'sensible' throttling, then 
>>>flag a warning
>>>+ * because something is not right.
>>>+ *
>>>+ * Note that the only reason an end user should hit the timeout 
>>>is in case of
>>>+ * extreme thermal throttling. And a system that is that hot 
>>>during boot is
>>>+ * probably dead anyway!
>>>+ */
>>>+#if defined(CONFIG_DRM_XE_DEBUG)
>>>+#define GUC_LOAD_RETRY_LIMIT    20
>>>+#else
>>>+#define GUC_LOAD_RETRY_LIMIT    3
>>
>>why? so developers don't reproduce the issues happening on normal
>>system?
>Not sure I follow.
>
>For CI runs, we want to cope with as much as possible. Anything above 
>the limit below will be flagged as a CI failure, but if a load were to 
>take 4 seconds then having the driver actually complete the load and 
>keep going to run further testing is better than it aborting the load 
>and killing the entire CI run. Especially given Xe's current penchant 
>for causing kernel panics if something fails to start correctly.
>
>Whereas, for end users, we want a timeout that is short enough for 
>them to not reach for the power button because their system has hung. 
>As noted, the load should never be in the seconds range unless 
>something is really badly wrong. But that's still not something we 
>want to force on an end user.


The problem I have with this thinking is that I don't want CI passing
and then failing for end users. If CI is completely blocked because our
timeout wasn't enough, then let it explode so we can fix it.  Unless
there's a reason (e.g. slower machine / environment / etc) for a longer
timeout/retry we shouldn't make it 8x more just for passing CI.
If the justification was that "in CI we enable a lot of other debug
stuff x, y, z that impact this", then it could be acceptable. But then
the ifdef could also be about those other things. One that comes to mind
is kasan.

Lucas De Marchi
