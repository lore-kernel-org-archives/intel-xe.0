Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8DC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 09:10:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862351123A4;
	Mon, 15 Apr 2024 09:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfK+MPQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431E51123A4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713172246; x=1744708246;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m706u2g0RgslCpUflP0B8IQQeYasQjtsrpOk9MJkxhM=;
 b=WfK+MPQSGAN+E+dREv6ptcKZeuDnygYoDm5WX6zEOzwi+7CkTA7LgYL2
 3LEPwnp9eh7uuj881MJ6tyoNl0pFZ2JUCNjysv+hEvx55GiirlEn2gAFR
 gFsapDtwdoGaitKlu+bGMM7k+iyFz0itfhIs5QBzsuFD17nfoMYr9JYe/
 CvJ9kA1/MdbOFFb2EiqqFVdhORAUZsMtw9AXZ6gmVzcc/OJU+2w+FH79C
 AfoHZ7UiovHmSw+NdFmAH9O5UVPLC+93CNsvrLLNO/nmvpSXX60WtY7pK
 q+AhtbuRsLz0GP/gjPWJ0UQZlAdVbMWuZ3/tDU7opa7zBexcA0CYkNR2e g==;
X-CSE-ConnectionGUID: puU+hm8uR0KvmuUdMJu4HQ==
X-CSE-MsgGUID: GBSAvz4tS+Gc3k2eVQjZnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8468358"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8468358"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 02:10:45 -0700
X-CSE-ConnectionGUID: uXImRvqRS06RNoW/rk+uDA==
X-CSE-MsgGUID: gmaR/zM2TiClC6kvl0dceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="21899197"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 02:10:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 02:10:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 02:10:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 02:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Day7BDuPN7O5kQR7nQsCXWXWTg2pkI+ax3xTXm/GGw3ri6TTxFLkOKqg2DUtyrLSFr/oDRyvlrdMXaVa9luepyzaUg/6ptRCUbhmTChbv3BHe/POj/Qv4Wly0CwxeroYsWXdoWJ3CZ+0ATYhCoPGbhPPTkVHphBvTM5Jv7QLiU41f1LiqSeMqcHrhnUzJSk7ED+Y2RNAyjYnzIImwV3KlAcJLGEOcr7xphf12m5sIeLQ2kqurC9NSUnzvj2Y1uxF+TqpQqZuYY9QvBXaWeUkcBcdZ1hFNxHUNKZtXXuM/hli8smQkZ2uuP0rMLZBA/GaCiuANn/UddAi6FNwvpCmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRYdHu6tH32MopwBSUtCDljH5kcHu33w7KiOWvn4r58=;
 b=Q6XXoqn9hysCCa86+ddo6RIYlujoGeEiiM8HSSqmMD/ARxt82/iB2wmFQWwquDhsa/zsQi88+azpcAnHLUshvkqh+sJDIQ4cbvTpiJT35KUbi/sGKlEA2NGxJYBWrOTrqiGiGEXKxqJbNaQAiNbWQfRiraZBDGiPDEhYuzqKoT6lyjI3j9zxkiXLphPkasnGrFRaI6GUpT7UK/cp03cvBoXJwthpzWC7lQhjGY8W3yT+YOss4iaCmQkWEvCPVuFSYvj6Q7Ws4RSnuuOhe8F1ubMvMWCFhLkk/E3CjiA1qWdF00d/9ElujdGTWrF8jlQsbloST0k2ncBJUAMw6ZZ5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6309.namprd11.prod.outlook.com (2603:10b6:8:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 15 Apr
 2024 09:10:41 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 09:10:37 +0000
Date: Mon, 15 Apr 2024 11:10:35 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe: Allow to assign GGTT region to the VF
Message-ID: <20240415091035.yg674rr3xz45inp5@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-3-michal.wajdeczko@intel.com>
 <f3151915-3057-4fe8-981f-cf58ced43b04@intel.com>
 <a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a49558af-c6d5-42c4-b942-68fda8bec3b5@intel.com>
X-ClientProxiedBy: PR3P189CA0053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c718c9-edf4-45c9-21b0-08dc5d2bea66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIbuIFsTyGtONamTnCpASbmqfBF2xgLPxf946qjWJ+kfxbky5dLpUD2TWNduLrB8cHwULp7jm2tMYJGy3n3MQR8qzqkkSWAw6ZBxWwtWalypENnUK7E115Idg6FF6ADepwVZomLDHvOBds4V5FkvQMS2eVzvHZAyfA3DCM8kL+4edZwpVeHNWqrCmjWkoNgnrf7cn26M2nHjVM6CyXTmxi+rKdwvl6jdj7jLqB7uiW5JOwqw1Mr73kIiEpjk2qljiGRAfAAg4P03ugus0pzF/T2IZ/J862Ckgp0kMRVWjZ5pHc82TWjFzjNql38Y8ojm2BIx8UY3wQlgdSkdYoEYRQawA9VSbRDA7G5Xb2GKrN7HVp0hIj+mmPiwnn73lUO9SQe7GrLPX1muvn5KI53nYjtX2ls7GkWjRh8Mu0pl1yRZ6l2fOBL3X1cQ2SWUXSl1+64CP5XPteVFpniCA27xG7az3YATNYXEwCCsB9FjRQ7uJsSVvxN1GjxmJGoZjSAzroW1YEkqd/F71ixO5oRf/bIduAUBE3Pbif8hz66kV/nWa4IJDnrHg3JsLP6/apqbeUSuBMW6fXxjitsg7rlwhSxNwK+3fMO/27y7ik3eNKwfD1Y1Wt+ST7OJgF1u9zlgb3Xv6v/PQCBVBenYB+jiAkC5jRdKBMDcUFiANqjj7fY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEl0RVpXd1J6RmJZVVYvMVMrOEVkTlVvSnMwSzlWMUExVndrSGJ1RFVEd3NS?=
 =?utf-8?B?YVRLL1R1b1NabXJ2Ynl6bmMzd3lPekxOckowTlNOdlM4OVVwR3Z1SW5sYWxX?=
 =?utf-8?B?VzdtcS85WjhhcVNnc0Y4ZUlyWUVYQTNFS3I4bXA4NkU2Z25kcGJ4dERtcld6?=
 =?utf-8?B?K0pDTW9zbGZIUUtVcW05Mlo3ZnZ6MXovblE5aVpmdFdTaHU0MTlVV0ViMHBB?=
 =?utf-8?B?bnVkakZRQ0dYWlhWRWdpRFR5a0owUzNFWlVKblFkNW14NEpOd2hwb3EwUk5E?=
 =?utf-8?B?a2JKbDZQZTR3Z2V4QlVhbmdsQlhSamdXeXZFNkNhSGZ3VWxITTJlUjczSXc4?=
 =?utf-8?B?SEZ1QTN1TEdwa2YvSkhyd3VYaHVFK2dDbTRRNFhPMjVpOUNpdXdiZG5WM0dH?=
 =?utf-8?B?RDBOeEhROVVqekhMOGxTeU9rbkJVNS80TEh1V1BMZFgvMXRHSjZMdVREZ25W?=
 =?utf-8?B?OFdTWlBHcFo3VTRWR2FLM21zWlZFWEJGenBNYXkxYXNBNjd6bzJYRytKU2ho?=
 =?utf-8?B?UUpzRDd4Z0xvN2hkSEJTRk8yNjk4UHBHR1JTcXAvSjNpV1dkeGp0NzlkNkVB?=
 =?utf-8?B?MEt2K2ZqbGNFdGpOR25KbFlqRExIUHNTNE5Ra0ZoeC9RZ2ppODd5bFIwRFVr?=
 =?utf-8?B?bG1RTUp4dU5lL1dXUklwY3RiekdodXk1cGloOThxZ0luYnY3VlhTQ0RCMGRz?=
 =?utf-8?B?eFM5ZXhZeG5PT1FnR0VmQjZ6T0l5Wnc2bzVPT0ZwdDZEVmtJWFgzQVJFSFpw?=
 =?utf-8?B?RUJRZThPeUNVR05YWnh3aEJialVXdlVPY2JjSmdWd1ZXMlU0czF1MWxsZEhB?=
 =?utf-8?B?R1V1cFYyRGxMZnJiNjhxdEpMK1VxU3VqRjZDbW9vTDhjUUF4bmUvOWlCL2c0?=
 =?utf-8?B?bmtvTko3d1BYbm1WcjlUUiszMHlKM3NwcGtFT1VrSDFxRW5BNU9taUhSa3lx?=
 =?utf-8?B?ajhTcGE1MVpQRDl1V0RFeDhCVXladzdLY3dMWjdmejVDK2d0RDZNSkRQRStY?=
 =?utf-8?B?NnMybTB2RlV4OXJtRjhlV1RsU2JLcGoveXZzd1dtbDRUL0NOU3N5VjNkUmhj?=
 =?utf-8?B?ZTZuRTRVU1NuLzByTEtLN20wQ1U2eHZqVWtzZkRRSEYrYWwvNWMxcVUyS0lH?=
 =?utf-8?B?b3FwTVBXY3Bmc1UyUVJBQTJuNUVjT2Zpdk9BWjdCSzRkK1F4bE5QZFJoZURr?=
 =?utf-8?B?ZTlmb3lrTnJlcjJ1dkdOWVpvVitlbkNpWFNNU21YSVJJalJScC9LMWpLU3px?=
 =?utf-8?B?WXpDOGgyMzJQQkhZOS9tNlZTeFkwdVlITm9FalJocC9QcVd1QWdyayt2NHhJ?=
 =?utf-8?B?M2Jzc3hrQjU2dEl0K0FrQnNzZ2ZoMlhCWW52bFpUNVVLWTU0OFpuQTZrWXNn?=
 =?utf-8?B?YitnN3pMYXRCWkhxRUJyV3lUQzhleThEUFFPajB3WmJHYlk5K2dSV0NvOTJC?=
 =?utf-8?B?MnErOXVnMDIrWTNOVVN0K1RHN2hKNTNjcGkwQ0Y1WCt1QTlxTlF6ajJMMUpZ?=
 =?utf-8?B?QUMyTjZJeWY5cGVnRXNFUmZXYkNMVndybnBLdTVIUUkxKzJock1DTUptanlE?=
 =?utf-8?B?R0VWVTc2UWgrSDlPdUEvMmZvcTc1dXBkTVR6REN3bGRzbExsWjBQS3BseXFP?=
 =?utf-8?B?cy9IaW5vbVE5WWtlWFpEcEtpVkM2N3NNK29XdzlTTlcrNy9LVGZrZ0pva0l1?=
 =?utf-8?B?a2xFYnN5cHZDSWRYcmYwY1NYN05KcnhUN2tSK1RIaTlsdUJNa3M0RmxVQllJ?=
 =?utf-8?B?MjhYSWlpTjYvT05ocmZEQkRyNzRia0RYY0JpTkc1bStFY3c5cFlMS0RSczRX?=
 =?utf-8?B?OVFNa0x0V2xDN1hvZUJsYnNCRVJYM0hNdDU5WDNOaE84bXBaVmlzVzF4bUw4?=
 =?utf-8?B?U1ZGR2dndWpvZjRZSzlFUUU4M1h1cVM1OHQwSXltb2pOejlNZDJqZUFHU01I?=
 =?utf-8?B?bU54UnBaY3JnV2hLMzY3WFR6STlCVmJidjYxZnA3RGcxZlZCSWQ0Tk9jb2o3?=
 =?utf-8?B?eGIvQ1N3cUxnYUxkLzdDcUN5OTNyQ25xSnhDTjVlaEE3N0dCcmpwTEZzWFhZ?=
 =?utf-8?B?alJmaElVemQ4YmxvWlNoUkNzT0RQL2Y3akUvMVV0YTArNkJvYTBDQUpFckdk?=
 =?utf-8?B?NmZlYXRBa2tFTDhNMmJUN0x1djF3Y1h5TXI4N0J2bGJiNVhvNW9MK0J3cmQ3?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c718c9-edf4-45c9-21b0-08dc5d2bea66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 09:10:37.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrbD9e097mNNTabTRFQP54VAMvMDJYljB5WwLDfsvMe0TCa4tBiCBWLrwX9ucOHNWI3jDfTcU6cCG/bLXYrQBKpw07769Bgr0naJekH2D1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6309
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2024-kwi-15 11:01:21 +0200]:
> 
> 
> On 15.04.2024 06:49, Ghimiray, Himal Prasad wrote:
> > 
> > On 15-04-2024 00:31, Michal Wajdeczko wrote:
> >> VF's drivers can't modify GGTT PTEs except the range explicitly
> >> assigned by the PF driver. To allow hardware enforcement of this
> >> requirement, each GGTT PTE has a field with the VF number that
> >> identifies which VF can modify that particular GGTT PTE entry.
> >>
> >> Only PF driver can modify this field and PF driver shall do that
> >> before VF drivers will be loaded. Add function to prepare PTEs.
> >> Since it will be used only by the PF driver, make it available
> >> only for CONFIG_PCI_IOV=y.
> >>
> >> Bspec: 45015
> >> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> >> ---
> >>   drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 ++
> >>   drivers/gpu/drm/xe/xe_ggtt.c          | 44 +++++++++++++++++++++++++++
> >>   drivers/gpu/drm/xe/xe_ggtt.h          |  4 +++
> >>   3 files changed, 50 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> >> b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> >> index 558519ce48c7..4389e5a76f89 100644
> >> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> >> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> >> @@ -9,6 +9,8 @@
> >>   #define XELPG_GGTT_PTE_PAT0    BIT_ULL(52)
> >>   #define XELPG_GGTT_PTE_PAT1    BIT_ULL(53)
> >>   +#define GGTT_PTE_VFID        GENMASK_ULL(11, 2)
> > 
> > Patch looks good to me.
> > 
> > Just to confrim, based on BSPEC, this MASK applies to GRAPHICS_VER >=
> > 12.50. For versions before this, the applicable mask is (4, 2). I infer
> > that since SRIOV support on XE is expected beyond GRAPHICS_VER version
> > 12.50, you are using mask (11, 2).
> 
> true, but even on earlier versions, which we may want to use as SDV,
> where real mask is (4, 2) this extended mask (11, 2) should be still
> harmless as number of VFs would be then always less than 7 so it will
> fit only into (4, 2)

Additionally, these bits are reserved for GRAPHICS_VER < 12.50 anyway.

> 
> > 
> >> +
> >>   #define GUC_GGTT_TOP        0xFEE00000
> >>     #define XELPG_PPGTT_PTE_PAT3        BIT_ULL(62)
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> >> index ff2239c0eda5..f090cab065b8 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> >> @@ -460,6 +460,50 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt,
> >> struct xe_bo *bo)
> >>                   bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
> >>   }
> >>   +#ifdef CONFIG_PCI_IOV
> >> +static u64 xe_encode_vfid_pte(u16 vfid)
> >> +{
> >> +    return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
> >> +}
> >> +
> >> +static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct
> >> drm_mm_node *node, u16 vfid)
> >> +{
> >> +    u64 start = node->start;
> >> +    u64 size = node->size;
> >> +    u64 end = start + size - 1;
> >> +    u64 pte = xe_encode_vfid_pte(vfid);
> >> +
> >> +    lockdep_assert_held(&ggtt->lock);
> >> +
> >> +    if (!drm_mm_node_allocated(node))
> >> +        return;
> >> +
> >> +    while (start < end) {
> >> +        xe_ggtt_set_pte(ggtt, start, pte);
> >> +        start += XE_PAGE_SIZE;
> >> +    }
> >> +
> >> +    xe_ggtt_invalidate(ggtt);
> >> +}
> >> +
> >> +/**
> >> + * xe_ggtt_assign - assign a GGTT region to the VF
> >> + * @ggtt: the &xe_ggtt where the node belongs
> >> + * @node: the &drm_mm_node to update
> >> + * @vfid: the VF identifier
> >> + *
> >> + * This function is used by the PF driver to assign a GGTT region to
> >> the VF.
> >> + * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as
> >> on some
> >> + * platforms VFs can't modify that either.
> > 
> > This info regarding bit 0 not being modifiable by VF's on some platforms
> > is missing in Bspec.
> 
> Piotr reminded me of another page:
> 
> Bspec: 52395
> 
> > 
> >> + */
> >> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
> >> *node, u16 vfid)
> >> +{
> >> +    mutex_lock(&ggtt->lock);
> >> +    xe_ggtt_assign_locked(ggtt, node, vfid);
> >> +    mutex_unlock(&ggtt->lock);
> >> +}
> >> +#endif
> >> +
> >>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
> >>   {
> >>       int err;
> >> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> >> index 8306ef74abc6..4a41a1762358 100644
> >> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> >> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> >> @@ -33,4 +33,8 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct
> >> xe_bo *bo);
> >>     int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
> >>   +#ifdef CONFIG_PCI_IOV
> >> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node
> >> *node, u16 vfid);
> >> +#endif
> >> +
> >>   #endif

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 
