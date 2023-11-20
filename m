Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B6C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 19:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36610E0F4;
	Mon, 20 Nov 2023 19:57:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA3F10E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700510267; x=1732046267;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HYO88ct+x3EofW5LCqh2nxo65qIfmG60AicBFu1TLzM=;
 b=N9m+83AYz3AjG35D4010j92e1+JfUK8LMySyFMxbgHtZmhdYYHqsa7U8
 35I0sPYIkSX02teeYHgJNkMp6wZrqlbR+oX1Fun0SjP8nxSLViXAR9SXA
 Htn4Tbz4EBYHmDHFyh73W17ZM0nIXnn08nf5I4cOMYPOwhvxIrhgSYZnq
 OPym5tvQ6HlXyuiOOOgo9DDrKbP6MCWTn71kiiw/N/pzM7NHxDVyvDsGx
 +LiCUHH7zMyKjLawAzaJRHyg+RLmZ9dWLzXpufhORYe2/DqwA9d8najMU
 140J8wvXX239aaE1zkPlLm5x+upLgO38hTsXH6I7Of9+BcoXLLyeTdIYg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="376731195"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="376731195"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 11:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="883963268"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="883963268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 11:57:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 11:57:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 11:57:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 11:57:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIunrGqJq5Kcq4cIIdlN1/quuPxaguLe+LzvE9Eig13Oa+8OatX4iDbyIKAixGSyFlEy6RUQCKWxT85Ll8Ebb7kEHqOWb3iMRh2+ku1UTgnYO/6gMtvG7mPk4OLsTKwdo822ZsWpoEwbjUSTlJ4hCM/I5nAsMAqxdYXXc1+TeX2DsrT05bLHsdPpxg/zsuGfbT6Ug5JavmMINJ4ICtJckaBdoARkQerR/8S/1Cagn6acZ3O69D6JQAl/8QIc4y5HbvyQeaGhDiA0byZ8Uwqr6ZHCN3joQDQl7RPJsvFE3Pmihv0PFlLfQuU2fTP03Xgz+l9zl3EOYsa1BhKc9x22CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DylTCA0qh568An+GTUeQrf6zBUoGjHR0WVoX2ZgQSCM=;
 b=ldUwAqPMiz/CksZWTdZXYCKvcd7pxSjeezbP+k2q1ZUgw1J5VAqow9A7487dMb6+X5iwtSKOcnSntBuRptPpsxyDweeZZWl+ibl6JelIALjjjJJljZCJ8AaRHn3JiAWoH9lzbmgaG6/nSTTcjRcIbdSS0kNPStimphe1A6ZCn8D2l+NV55rmmPX/jrcZ9/2fZG84DEnkD7mHiINRtL6blsoNfv6MOsg2vFVuumMHwPVdtbvkN8wt7owirP5Cy98bCG8/6ShEV7ZRc/slCJqOvlAsumT48GWDr44IP/M2/Kt3YvQ0/n0r2uuOEMNGJ+5Zj7IKP3Cofc0Bbux+tKeDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 20 Nov
 2023 19:57:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 19:57:43 +0000
Date: Mon, 20 Nov 2023 13:57:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <lxzbl52b5kvqcnmpkcqhxylc6ei3idllvnz5l6u5cc53bf2j2r@znoa5fexo2w3>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-11-michal.winiarski@intel.com>
 <20231115215100.GN1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115215100.GN1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: f345a78b-1d18-47ab-7b19-08dbea02f5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2xyh4050tieio78eaBefxoyVJt2mNCXPw3cu1uYDCKgo8pj70uu/C9O3L5GockuMZcrtWhb6Z6T1uVKHftFVOqdcc8GfUfB6xA1ufQlSJ/k2pjLSYqIpBKAUbpmanwlqst8gZgmdkULihdy9Ykxbz0z5zaoXX7xA3HGJeKdZR2Ub3UuWTxDPsEsjTHSvdG06p75mhR0GPATTWPPDRzpSUA7Rl1HK/f7mibfud9TVXixgMqMI67KlJ0ah/e1krfsO5pGWDSJQwJKUZsaa6gEtK2qk50M45qqlQagnOgbC+Rdg7n1HQECS2/4LNHOJO5j6LP8HBOR2aj+9BOKZDOQtio9L42SrroYdY/6QoW6d2PdvLJVH6EdZa9W7URcxHBcgRGsw+xUNPkdxS/LKsIXmqFX2C5uU/riRLrd4q3jh6Xp2P2zpZ90BFOeSYUDZCPdQW6Ol4RgHQQFq2O66yA2lX/F1S/C6ZwNyEfDfF0eOpPwg5tQoCHUai6uCPcqFerWz9vEWv2S03xdyu9664qUuoVA+vlSBLaBwNxjHKnXRNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(83380400001)(82960400001)(86362001)(33716001)(41300700001)(316002)(38100700002)(4326008)(8936002)(6862004)(8676002)(6506007)(478600001)(66556008)(9686003)(6636002)(66946007)(66476007)(6512007)(6486002)(26005)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzJ1dndlWDRqeVF4YTliczIydURvT1R2NE9TcDN5eFhtcDVSM04ySTkxeGNJ?=
 =?utf-8?B?ZG1oZ0VoSjNwSjhXSi9malhzMGwzOEVFYkhhOWRkOUIwR3VXbWRuMTR5dk81?=
 =?utf-8?B?UUpsajZlT01FSUlpZCsvRmFESmdmeTRrY2FqMDI1cmZ5SWFBTTQzNENYZnhR?=
 =?utf-8?B?U2JjMXN0WVgzelAzYm1wMWQ4M0htbFExTksxUENpaU40bElEeXlDaFd2OWVa?=
 =?utf-8?B?L0JVOEhXWFNZeWp5L0x0TWUwLzNIT3JaZjZub0UyZnFtUDQvTjVTME1JK2gy?=
 =?utf-8?B?d2p0ZWZkVnZVU1ltbG1xK2FHRFRuYkxoN0pxT2dxNlZmSUVxd242UTFhTGhw?=
 =?utf-8?B?RHpyWmk3SzVvdmcreFlTVU5qQlNXVzE3N0kwYWxualNZcmVhd1lPbmQreFpk?=
 =?utf-8?B?VEF4eDAxT3hsb3JDcHNISmR6SGhQSXg3eGRxVVlGYUhDYmJLTjBMQ2plem5t?=
 =?utf-8?B?a3ZFMDJURVBtMWhZR0RSQkZMM0xwMVBQNkVQSUZ1eVZGNjgvcUtoVGFzTTBy?=
 =?utf-8?B?K3gxS1VqOGVhWnpocTFEWTc4WDhhTmhLTlM1NEFXVkQydnI5eDNMT3N3K1Y0?=
 =?utf-8?B?UXFNSGVYNURjaDR1OStPYnIvb0NkNFozbTRxQkNXYytqWU9xRzdXVVRvTjZB?=
 =?utf-8?B?Rk1SZ09TUW8rVmpuY1NydmJTRU5XSll6OHJDNXdnZmZCdnViQ0FZbEpsR0Rv?=
 =?utf-8?B?aTFXWWlXUTQrMHpPRTlXcFFLNGJvRHdyaHVTVWh6SElNUXI1RnN6YXpDbURo?=
 =?utf-8?B?Z05vVzdmL0NBcERqSVIxOEdjaHRodDMwdlBTSVBYSXd4ZzYwZGpDaGZ6ZkQ2?=
 =?utf-8?B?TU05Y003blNzYTlZWG0vRTBDYmFXNFc4RFcyNVlCa0c1MjNqRzBnMEh4UlRE?=
 =?utf-8?B?aGwzY3U2d3VlN01GOVFRYnhpSmdWMWYwVzRpdlVJajNaSzBBekJCSS9OeHpJ?=
 =?utf-8?B?WUxLMFozb2QrL2RWSFhDNWpOSDVrc3NkSFlnb0s2VVBnam1aU05uQk00OEdL?=
 =?utf-8?B?UjNBU0xiR2xCd1RrbHVKUWQ5eG5wbWZIZDkxdVE1SkpuT1BYai9QNHByZEpD?=
 =?utf-8?B?ajBFaEFSY1RleXc2UmQ5UEJPQzhRMmVCWHBQNzJmcng0RjBZbVRuQlExWWRp?=
 =?utf-8?B?SFJ5b2Z2K1BoNFUxb1pvcUFJL0JqelMxNVhnZVhYSEY0cG5tTTFyUExERi9z?=
 =?utf-8?B?Z1BteHhNYWx1YkpaeGJiV1lMeWIvcTd2ak9Pd3RTbFdDQUdtRjJaRWtwdkJ4?=
 =?utf-8?B?V21LUStmaWVyQXVNL3RoSW5yZFBkWXhEdktyTmRHMlNTZUxLUG9LWnVrMU9x?=
 =?utf-8?B?bzRLRFdlSWxFWElvMDlZNWRhaWdIMUlsbHRydytPOG1FMkNwMXpPZWNVaHRN?=
 =?utf-8?B?c1FPKzBla0ZKbTF6elZvaHdXYnllNWpHTmJuWVdMVEx3MUxqbXVuSm5XeUhl?=
 =?utf-8?B?aktwVWErc3R4SVlDU1o1OHVuZXFpM2xhbWVqQTdBbFdGaVI1azAvbU8veGVp?=
 =?utf-8?B?SGUrVVJqbkpJRXdKOUg2K1ltT2VlWkdtejh1bUt4OXRrTmNNcm9Mb3o5RWVP?=
 =?utf-8?B?VU1ZdDBRY3U5d3JnTVdaZXNKNUFUU3cxMmhjUmRtN0JmM3ArY290K1ZWeEhs?=
 =?utf-8?B?MGlzMWNxemtxOFBDT2FnTWRITXVuT1hZL1lLYlNYWVk1Y3M4ZW15VlFCaUxE?=
 =?utf-8?B?aVdDdjZnY0k1YzVyd1E1NVhIME1hL3BUSmhxeHljM3lPbXFxbFdZYXQzRmZr?=
 =?utf-8?B?dmtDQWJzOHBvUkhzdUVxRGdHdzg2OTVkNjRXdVBxQ01GVEgrSUl3T3AzVnht?=
 =?utf-8?B?RzgyR2Njb2c2azlGYXFBa3ZjUmdlZ3JXWkJPcnZLSjVadVZycmkzeDQyRG9U?=
 =?utf-8?B?Yk9XcFgvZDA1Y0E3ZDNsSWhVb0QwZzBFZ2l4TnlVOS90b25KcGJsRW1GeFRu?=
 =?utf-8?B?eUtKQzk0WTVoSHRQajRDdEFKWitLMGtwazgzMW5NaEJuTUMvdWZxNWJZUEVk?=
 =?utf-8?B?KzVoYmY2bTRxNHVEQktzaUlTdHJPMGNnZGVGTHlFM0h4NGsrbkdxb25vOE5M?=
 =?utf-8?B?aUpsRkxZbVV3Zzh1VTdKQ0Z3ekNvV3NQeHRIZnhVYzlld1B5RDFKNkxlbDU5?=
 =?utf-8?B?Y0c2bWFNL2tJRWY5bmtQVW1JNDk2bXFGbERzTDlYYzBjaUx5dEdicW5vVFB3?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f345a78b-1d18-47ab-7b19-08dbea02f5c0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 19:57:43.8539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJDmU/MG4BELBCR8dDyWvSdtffuark+WVemlgaIpW7SnEV5LG37d6aiKYtEctUiWZ76eus1cxzToVHr6s1EPNmLvUuv7EOO3mszU4dGjh7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 10/20] drm/xe: Don't "peek" into GMD_ID
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 01:51:00PM -0800, Matt Roper wrote:
>On Tue, Nov 14, 2023 at 02:02:21PM +0100, Michał Winiarski wrote:
>> Now that MMIO init got moved to device early, we can use regular
>> xe_mmio_read helpers to get to GMD_ID register.
>>
>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>>  drivers/gpu/drm/xe/xe_pci.c          | 35 ++++++++--------------------
>>  2 files changed, 11 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc27fe8fc3633..6b195115564ce 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -38,6 +38,7 @@
>>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>>  #define   GMD_ID_REVID				REG_GENMASK(5, 0)
>> +#define MEDIA_GMD_ID				XE_REG(GMD_ID.addr + MEDIA_GT_GSI_OFFSET)
>>
>>  #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
>>  #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index a1026b7ee4727..a6c08577b01d2 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -21,6 +21,7 @@
>>  #include "xe_drv.h"
>>  #include "xe_gt.h"
>>  #include "xe_macros.h"
>> +#include "xe_mmio.h"
>>  #include "xe_module.h"
>>  #include "xe_pci_types.h"
>>  #include "xe_pm.h"
>> @@ -441,29 +442,6 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>>  	return NULL;
>>  }
>>
>> -static void peek_gmdid(struct xe_device *xe, u32 gmdid_offset, u32 *ver, u32 *revid)
>> -{
>> -	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> -	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>> -	u32 val;
>> -
>> -	if (!map) {
>> -		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
>> -			gmdid_offset);
>> -		*ver = 0;
>> -		*revid = 0;
>> -
>> -		return;
>> -	}
>> -
>> -	val = ioread32(map);
>> -	pci_iounmap(pdev, map);
>> -
>> -	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 +
>> -		REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> -	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
>> -}
>> -
>>  /*
>>   * Pre-GMD_ID platform: device descriptor already points to the appropriate
>>   * graphics descriptor. Simply forward the description and calculate the version
>> @@ -495,9 +473,14 @@ static void handle_gmdid(struct xe_device *xe,
>>  			 u32 *graphics_revid,
>>  			 u32 *media_revid)
>>  {
>> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +	u32 val;
>>  	u32 ver;
>>
>> -	peek_gmdid(xe, GMD_ID.addr, &ver, graphics_revid);
>> +	val = xe_mmio_read32(gt, GMD_ID);
>> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> +	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, val);
>> +
>>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>>  		if (ver == graphics_ip_map[i].ver) {
>>  			xe->info.graphics_verx100 = ver;
>> @@ -512,7 +495,9 @@ static void handle_gmdid(struct xe_device *xe,
>>  			ver / 100, ver % 100);
>>  	}
>>
>> -	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
>> +	val = xe_mmio_read32(gt, MEDIA_GMD_ID);
>
>It's unfortunate that we have to read the GMD_ID register through the
>wrong GT pointer, but I don't see a good way to avoid it.  Maybe rather
>than defining MEDIA_GMD_ID with the built-in offset (which people may
>try to copy/paste for other register definitions without realizing this
>is a one-time special case), we should just do something like
>
>        struct xe_reg media_gmdid_reg = GMD_ID;
>
>        /*
>         * Since we haven't initialized the media GT yet, we need to
>         * read media's GMD_ID register through the primary GT's
>         * mmio; that means we also need to explicitly add in the
>         * media GSI offset.
>         */
>         media_gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
>         val = xe_mmio_read32(gt, media_gmdid_reg);


since we already have a new use case for having a peek_gmdid
(https://patchwork.freedesktop.org/series/126609/), maybe rename the
function and leave this logic adding MEDIA_GT_GSI_OFFSET inside that
single function?

with this patch getting a r-b, we already have all the pre-requisites
reviewed so I'd be happy to rebase my series on top.

Lucas De Marchi

>
>
>Matt
>
>> +	ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>> +	*media_revid = REG_FIELD_GET(GMD_ID_REVID, val);
>>
>>  	/* Media may legitimately be fused off / not present */
>>  	if (ver == 0)
>> --
>> 2.42.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
