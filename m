Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F1EC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 22:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4E610E21F;
	Tue,  8 Aug 2023 22:59:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DDC10E21F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691535583; x=1723071583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LUoZQPa0QDYE6spOIgdmpVjHdNzkEWAoLGXpPOBSFDg=;
 b=LTO0wESziFrB/J8CR9y3cUA88hNTEAn2C2djsPV0/WL2FeOfDyF63waL
 s1kuTTBmacmm2ciSvJM1p+ntBWGX9vJDE2l+i9U+5g7DCi+paHm8P8Ly8
 DWpTd0cgzPwVBbg5hChaeGLk+AQ/tHVXuMKBUPuEfJdT6580+cjYp97oP
 np1S4HAtp/YNghhMZUhfMxLCrVefOyWEkI4p0Sf7yXsY6J6cF0JDBgXdF
 a6Y590mJUXUFF48DOktTRSyUm6DsixUYOLbEA+b8iBezMS4d8IY+03sS/
 clotAkw0a0J7irU/gi0OV+IkGtjV0KH+LpltcpiKgFBmTeJ61t+NqUU+q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="370967226"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="370967226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 15:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821592237"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="821592237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2023 15:59:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:59:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 15:59:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 15:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC+qC1X+RBwJEygScy79r5NDaQusUCCa7L65ByMDaDAAwZqA1FDrjMyP3hgz5foqgaUCVaXYMeyNZ25wYu6BdTAj1u4sRIxThgN6I1E7z8kdga1QesBJ95Wbxj3NXWohZqNxrxMSCd+iGZdlN+MZ0eZwQY+qw5ZnjQFmVNd8t0OSamlVZH559LN4dPaguP+xRByogKvauYFrtg4dthMjmYp3bRGMeWlD02WbwwTsYYzuKDND0eRXak4wsac2s1Cr+T3Vck9SxlpUhuHsuJ71TnxFK79oDwmwjuffypQjlh+1qXUS7UpxbgoYPz5iQ34aavaxEMF+VlPvtL5kHyKL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85u4MumElfmsv4mFf1F5y7+Ez8A4tZdzVfWV03cSFYw=;
 b=d8S5n2pmNS0y1nJyJDJg02YLCIza3zHru2+DLUVH2mRFu/nHy1WD4P8YKiaYiAjX4oSGC8fBtGdZ49KCXuj9SHimNBJkVeavN/Rg4Yb5HY6Pcf+r8T7CDbK7vUL/03nkhXJnUqAGTEWq+ZfYdA/wNkhcw3vezH9EyQlPAq3Wg5XwQUak4gpuv+83rqkYzaUoqPVDz4kzLQRKKI2+soQXgqSv9WNBc0DUi66B3PQhOg5do8hxydsaS00WgkpjG/75G5nFt1NRYrxjgb8KXDFItCqHUgJtk92CVSSOGMfZXubDaAHNEbyH37zmtl5i8zLp2Hh4hRm76w/2gLViTMJCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.27; Tue, 8 Aug 2023 22:59:34 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::439e:63f:b4f:f27e%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 22:59:34 +0000
Date: Tue, 8 Aug 2023 15:59:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZNLIzElZdEFY7J3h@orsosgc001.jf.intel.com>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230808013159.38811-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ0PR11MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: ef79838c-5bb3-4e0b-3b1c-08db986321e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6jKPysZJ1lFNLxLqhftX48KKLNws+bGJxHQ9E9S/rP7JcJg2rFX+LfDC8Bjl5K4xQZCKLnYg86QYxyZ1Cj8OQD4xujqI4jHp28qOZiP01U87h8PhB/SK+40XQTYz9CbfJdmtr3xzEdNR31bjjCBhiDb3Yz9UenRdPMEG8qh+f1KQVUpoaNgrnTvwTZpU5KYa2L2fW2ds1owSDEKSCH0nJvxhODevIEShSlQCW+45jq2TqQq/7PhLFfn1HqxQisr/1O+ZFqMgfxwVe/ZzGOZ0/fVry697BgiXD82eVquQU58CvW1jbEHl79Ki/vhkDsDp48eEgbpxtcFMs6SfxTNsBZya928jLYwEL/nMGuOF7JmXipzJ1F4mwXJxxJfiys+UrbYUZE2Z4ZDAZii82XAPiaH3IOiPusf6O6eyNLdhWYpnMKcnru1qcNYwyKi5nO+QM7QzFHoe4tXeNsyfAxe/fq7qlU7qwv+KjAjsustPUjPl6gHbMsIn4NvXjQ1UlEy07jHE+Q4cdA30PxW6sbQbCvqj8RN7GajMxUV72To6UniptY9VrqlCrGW6bLd/Qpvu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(1800799006)(186006)(451199021)(83380400001)(316002)(66556008)(66476007)(41300700001)(6636002)(66946007)(4326008)(6506007)(5660300002)(38100700002)(8676002)(26005)(6666004)(6486002)(6862004)(6512007)(8936002)(478600001)(86362001)(30864003)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEpNRllhbmZVZWpwODJLdVZONVVkN0RTeG1PSnpmUENSdU5teGttYmxJejh3?=
 =?utf-8?B?V010b3REOU5Tc29CS1VQYkRmNmlpSGZUajRFZG8yTDFYVC9HZENWaWV3b2h4?=
 =?utf-8?B?NDBTM0I5dXFyblhrQThOQ29hZ25aeUkyaFBPdWpKcFUvVFVjcFF2RWJVYkdn?=
 =?utf-8?B?K2hTWXNKdGJ5bWp1dEVrcUcvSFVaQ3lOdVkrcE9oZDcveHpkS1pDTVpwRDhi?=
 =?utf-8?B?WVFxd0Q5am1DVTdFd2t4NnAxSkNpdG1PcmVUbzErYW5UaFkybStPcE1TU2R6?=
 =?utf-8?B?NjkrZW1nQWxUb2oyU2xnU3lGSlFiVjJOWDhmV0xqTUpiV2o0VC92S01tanRy?=
 =?utf-8?B?Rm11SE1od3lYdVRLZDB0V1kzU09OeGZwL3ZIemZjZjYxdWwrcDRtWmlOSVlx?=
 =?utf-8?B?ckM0V0RzcFlubTQ3N2NJai9wT1YwMERCRkhodkN6Zk9VUmVCK2tacWNNWFBH?=
 =?utf-8?B?eVBIKzNLcjh1aG5hOVRzUFlUT1dHSXJrM0orQTBsYlhtT0xVU3FSM05Fd3NR?=
 =?utf-8?B?RzZ6UHJ2SFl2d25rZUlqZjR0RGs0T3ZsVGljWlRaQjd5Nkc2WEZSbzdLcUMz?=
 =?utf-8?B?eC9JdmREcmNWU3dPNEZHTUtvc1hrL3lPdTRDQkJST25Yam9xKzlUelpTcHFR?=
 =?utf-8?B?aHd1L0pQTHNJTVc0V1h1dW1hQVpkQU9EUU5nYVpreW1NWjZsRXFQdCtHYWFB?=
 =?utf-8?B?SHRnemFIZU5VWjJJY1hmNXhYVmVaVmpiT0k3aDJCeXpHL1U2bHE0K1g0elZ6?=
 =?utf-8?B?RC9FS1haNFNvdytGeFRld3gzTWlmYVhYdjU4NGFpRWtqWC9jMUJ2YkFGeWRm?=
 =?utf-8?B?ZXJ5ZnNKaTR5VFN0aGJEZEtNc1BqeDJ4RmxEU2dHdlV5YWh0RndMS2dqalpp?=
 =?utf-8?B?RG43N2cxeDQvSTRoSmdPVXhNODRWZHUxd3lMZC82SHU4RlMyNTFQOU54VWpP?=
 =?utf-8?B?a0ZObnQ2TGMyNlkvam42d2pCSVduUnd0M1ZodDNBTGxMdlNVdUViR0dxUURF?=
 =?utf-8?B?MkxuSER6ZVI4OWlDdi9pSXNlVk9hNjQ4d3FDZmFmWlFGVFpUL2o2ankvZm1h?=
 =?utf-8?B?cHFRbkJnYmxpQ292WmxScEN5eVZ5bnpxQVZVaHNqWlJ2WGhYQTVKazVObnEx?=
 =?utf-8?B?a2hrTVFSTE9zN0JsbGVuRUF2WU1FU0h6VVhwUDR0Qkh5dmtUSStrcXNhUmhY?=
 =?utf-8?B?ZTFGYlducE5yWTlsU2pXYlhHcFQrUDBFZWlseUkrUFdlbnp5c1JYMzhvTFdy?=
 =?utf-8?B?RnYwaUthNXc1WDVjQUUwSHFJdXU1LzVRRS9MaUNtN1d2YXk2TlZtd1ZKa0h4?=
 =?utf-8?B?MWZPZ0lOZWc3dDZud0dERldWRDJ3eTBXS014My96QkhYOEJuSjNrbXN1a3c4?=
 =?utf-8?B?TTJ0ejg1UGFVU0ZYVGpmQUszOEw5c3cvQXRuV0tOY0NlWmNVb3FwQ3hPS3Q3?=
 =?utf-8?B?MjVIaHJsbjFLbjFhNkR5T3U4RlBVV2ppRmdQZDJnREZZZ2xuOGdqS0g4czly?=
 =?utf-8?B?Z1FybW52NTRCc3FpcmdTWEIxeWtLelFzRGl5THJibUs4b3RoWEVMTEJlZWI3?=
 =?utf-8?B?ajl2VWlNTk40VkpiY0FLL3h5NkxSUkMxWk5tVzJJQms2WTdYOHE2WnJHdVlO?=
 =?utf-8?B?VmlGb0JDbDdJb3ErNG80Z01GaFdpZW9VczRzbHN5elh0VktVQmFycmMzeFpt?=
 =?utf-8?B?NjF6OVFVQVJXSGlvRzByc2NBWTlXcGE2SW0zdVhsYmtIejc4TXpDcG5wQVVZ?=
 =?utf-8?B?amk0MjJkSStoVWkzb25jZEl4UmFIMDZZUHJZNm53YjRxaTgwcWZJZnhwclpu?=
 =?utf-8?B?V3BlcG9KSGIvbnFwdkkrMXBheW5uL1FDYm1lQ09yU2VNSGNXNkxqRFhMZEww?=
 =?utf-8?B?MkFmUGV5TXRESndPRmV4S1MwUGgxUHl2R1pwWUViVmZHNjE5RzdrT1ZadWdE?=
 =?utf-8?B?OWs5WWRWQ1BGcXl6V3ZnZGtQM2RRcW4ralhvSndkaUdSSmdSSFBQOCtPWGtP?=
 =?utf-8?B?MDRQZXhjVnZ6VngxdEtIcUMzVS94ODJ4bktQVFJiczU5Z0hQd0hoelRKV0t6?=
 =?utf-8?B?Z0E1TERjOHJROWJWQjhTeVFlM3hVU3c1enlueW9QaTZIaHd3RmtZSEVpNmlP?=
 =?utf-8?B?RFprcjFHSFdxSk5tR1E3Wnl3dlZFOWJkem1HQVJRRzhta0ZLYWpaTE9OUm44?=
 =?utf-8?Q?/wMLa2WJX5rc1myHEFyjvI0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef79838c-5bb3-4e0b-3b1c-08db986321e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:59:34.2398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc/16mP5M/QPxxXzIM1COzpvZafJSVq5xEbJiBHCOX7DE0010URf2tA/aFMQe0GBr/LNUSHvlGcfq6l8IG3BzOmF2H6dbsRrouAZT8chOBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/10] drm/xe/oa: Introduce OA uapi
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

Hi Ashutosh,

This looks good in terms of what existed in i915. I have some comments 
here from an improvement perspective. Please let me know what you think.

On Mon, Aug 07, 2023 at 06:31:50PM -0700, Ashutosh Dixit wrote:
>OA uapi allows userspace to:
>* Read streams of performance counters written by hardware
>* Configure (and reconfigure) which sets of perf counters are captured as
>  part of OA streams
>* Configure other properties (such as format and periodicity) of such
>  captures.
>* Query associated parameters such as OA unit timestamp freq, oa_unit_id's
>  for hw engines and OA ioctl version
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> include/uapi/drm/xe_drm.h | 257 +++++++++++++++++++++++++++++++++++++-
> 1 file changed, 256 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 86f16d50e9ccc..b4ab07c285245 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -111,6 +111,9 @@ struct xe_user_extension {
> #define DRM_XE_WAIT_USER_FENCE		0x0b
> #define DRM_XE_VM_MADVISE		0x0c
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>+#define DRM_XE_OA_OPEN			0x36
>+#define DRM_XE_OA_ADD_CONFIG		0x37
>+#define DRM_XE_OA_REMOVE_CONFIG		0x38

No holes in ioctl numbers above, as in use 0xe 0xf 0x10 instead of 0x36, 
0x37 and 0x38. Any reason you have left it same as i915?

>
> /* Must be kept compact -- no holes */
> #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>@@ -127,6 +130,9 @@ struct xe_user_extension {
> #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>+#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)
>+#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)
>+#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)
>
> /**
>  * enum drm_xe_memory_class - Supported memory classes.
>@@ -261,7 +267,8 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_GT_COUNT		4
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>+#define XE_QUERY_OA_IOCTL_VERSION		7

I am thinking we should just have a query for oa_info where things like 
revision, oa_timestamp_frequency and other OA specific info like 
supported formats (spec - 52198) can be queried by the user.

Also iirc, revision was just added as a way to determine new 
extensions/features to OA, but I don't see that mechanism used by any 
other interface here. Maybe we should see how other interfaces are 
adding features and detecting their presence and use something similar.

>+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
> 	/** @info: array of elements containing the config info */
> 	__u64 info[];
> };
>@@ -298,6 +305,7 @@ struct drm_xe_query_gts {
> 		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> 		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> 		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>+		__u64 oa_timestamp_freq;
> 		__u64 reserved[8];
> 	} gts[];
> };
>@@ -753,6 +761,7 @@ struct drm_xe_engine_class_instance {
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
>+	__u16 oa_unit_id;
> };
>
> struct drm_xe_exec_queue_create {
>@@ -1056,6 +1065,252 @@ struct drm_xe_vm_madvise {
> 	__u64 reserved[2];
> };
>
>+enum drm_xe_oa_format {
>+	XE_OA_FORMAT_C4_B8 = 7,
>+
>+	/* Gen8+ */
>+	XE_OA_FORMAT_A12,
>+	XE_OA_FORMAT_A12_B8_C8,
>+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>+
>+	/* DG2 */
>+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>+
>+	/* MTL OAM */
>+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>+
>+	XE_OA_FORMAT_MAX	    /* non-ABI */
>+};

If we support a query to get the supported OA formats, we can do away 
with this. Also thinking if we can provide the format definition in such 
a way that UMD can just decode the counters from it with some generic 
code. That way, we don't have to constantly keep updating UMD code for 
every new platforms (may be far-fetched, but could save us a lot of 
time). Thoughts?

>+
>+enum drm_xe_oa_property_id {
>+	/**
>+	 * Open the stream for a specific exec queue id (as used with
>+	 * drm_xe_exec). A stream opened for a specific exec queue id this
>+	 * way won't typically require root privileges.
>+	 */
>+	DRM_XE_OA_PROP_EXEC_QUEUE_ID = 1,
>+
>+	/**
>+	 * A value of 1 requests the inclusion of raw OA unit reports as
>+	 * part of stream samples.
>+	 */
>+	DRM_XE_OA_PROP_SAMPLE_OA,
>+
>+	/**
>+	 * The value specifies which set of OA unit metrics should be
>+	 * configured, defining the contents of any OA unit reports.
>+	 */
>+	DRM_XE_OA_PROP_OA_METRICS_SET,
>+
>+	/**
>+	 * The value specifies the size and layout of OA unit reports.
>+	 */
>+	DRM_XE_OA_PROP_OA_FORMAT,
>+
>+	/**
>+	 * Specifying this property implicitly requests periodic OA unit
>+	 * sampling and (at least on Haswell) the sampling frequency is derived
>+	 * from this exponent as follows:
>+	 *
>+	 *   80ns * 2^(period_exponent + 1)
>+	 */
>+	DRM_XE_OA_PROP_OA_EXPONENT,
>+
>+	/**
>+	 * Specifying this property is only valid when specify a context to
>+	 * filter with DRM_XE_OA_PROP_ENGINE_ID. Specifying this property
>+	 * will hold preemption of the particular engine we want to gather
>+	 * performance data about.
>+	 */
>+	DRM_XE_OA_PROP_HOLD_PREEMPTION,
>+
>+	/**
>+	 * Specifying this pins all contexts to the specified SSEU power
>+	 * configuration for the duration of the recording.
>+	 *
>+	 * This parameter's value is a pointer to a struct
>+	 * drm_xe_gem_context_param_sseu (TBD).
>+	 */
>+	DRM_XE_OA_PROP_GLOBAL_SSEU,
>+
>+	/**
>+	 * This optional parameter specifies the timer interval in nanoseconds
>+	 * at which the xe driver will check the OA buffer for available data.
>+	 * Minimum allowed value is 100 microseconds. A default value is used by
>+	 * the driver if this parameter is not specified. Note that larger timer
>+	 * values will reduce cpu consumption during OA perf captures. However,
>+	 * excessively large values would potentially result in OA buffer
>+	 * overwrites as captures reach end of the OA buffer.
>+	 */
>+	DRM_XE_OA_PROP_POLL_OA_PERIOD,
>+
>+	/**
>+	 * Multiple engines may be mapped to the same OA unit. The OA unit is
>+	 * identified by class:instance of any engine mapped to it.
>+	 *
>+	 * This parameter specifies the engine class and must be passed along
>+	 * with DRM_XE_OA_PROP_OA_ENGINE_INSTANCE.
>+	 */
>+	DRM_XE_OA_PROP_OA_ENGINE_CLASS,
>+
>+	/**
>+	 * This parameter specifies the engine instance and must be passed along
>+	 * with DRM_XE_OA_PROP_OA_ENGINE_CLASS.
>+	 */
>+	DRM_XE_OA_PROP_OA_ENGINE_INSTANCE,
>+
>+	DRM_XE_OA_PROP_MAX /* non-ABI */
>+};

Wish we could replace the prop-value interface here. Most ioctls just 
use a struct.  We could do so with some room for additional rsvd params 
or some room for extensions similar to other interfaces here.

>+
>+struct drm_xe_oa_open_param {
>+	__u32 flags;
>+#define XE_OA_FLAG_FD_CLOEXEC	BIT(0)
>+#define XE_OA_FLAG_FD_NONBLOCK	BIT(1)
>+#define XE_OA_FLAG_DISABLED	BIT(2)
>+
>+	/** The number of u64 (id, value) pairs */
>+	__u32 num_properties;
>+
>+	/**
>+	 * Pointer to array of u64 (id, value) pairs configuring the stream
>+	 * to open.
>+	 */
>+	__u64 properties_ptr;
>+};
>+
>+/*
>+ * Enable data capture for a stream that was either opened in a disabled state
>+ * via I915_PERF_FLAG_DISABLED or was later disabled via
>+ * I915_PERF_IOCTL_DISABLE.
>+ *
>+ * It is intended to be cheaper to disable and enable a stream than it may be
>+ * to close and re-open a stream with the same configuration.
>+ *
>+ * It's undefined whether any pending data for the stream will be lost.
>+ */
>+#define XE_OA_IOCTL_ENABLE	_IO('i', 0x0)
>+
>+/*
>+ * Disable data capture for a stream.
>+ *
>+ * It is an error to try and read a stream that is disabled.
>+ */
>+#define XE_OA_IOCTL_DISABLE	_IO('i', 0x1)
>+
>+/*
>+ * Change metrics_set captured by a stream.
>+ *
>+ * If the stream is bound to a specific context, the configuration change
>+ * will performed inline with that context such that it takes effect before
>+ * the next execbuf submission.
>+ *
>+ * Returns the previously bound metrics set id, or a negative error code.
>+ */
>+#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
>+
>+struct drm_xe_oa_record_header {
>+	__u32 type;
>+	__u16 pad;
>+	__u16 size;
>+};

Note to myself to ensure we are adding the header per read call now and 
not per report.

>+
>+enum drm_xe_oa_record_type {
>+	/**
>+	 * Samples are the work horse record type whose contents are
>+	 * extensible and defined when opening an xe oa stream based on the
>+	 * given properties.
>+	 *
>+	 * Boolean properties following the naming convention
>+	 * DRM_XE_OA_SAMPLE_xyz_PROP request the inclusion of 'xyz' data in
>+	 * every sample.
>+	 *
>+	 * The order of these sample properties given by userspace has no
>+	 * affect on the ordering of data within a sample. The order is
>+	 * documented here.
>+	 *
>+	 * struct {
>+	 *     struct drm_xe_oa_record_header header;
>+	 *
>+	 *     { u32 oa_report[]; } && DRM_XE_OA_PROP_SAMPLE_OA
>+	 * };
>+	 */
>+	DRM_XE_OA_RECORD_SAMPLE = 1,
>+
>+	/**
>+	 * Indicates that one or more OA reports were not written by the
>+	 * hardware. This can happen for example if an MI_REPORT_PERF_COUNT
>+	 * command collides with periodic sampling - which would be more likely
>+	 * at higher sampling frequencies.
>+	 */
>+	DRM_XE_OA_RECORD_OA_REPORT_LOST = 2,
>+
>+	/**
>+	 * An error occurred that resulted in all pending OA reports being lost.
>+	 */
>+	DRM_XE_OA_RECORD_OA_BUFFER_LOST = 3,
>+
>+	DRM_XE_OA_RECORD_MAX /* non-ABI */
>+};
>+
>+struct drm_xe_oa_config {
>+	/**
>+	 * @uuid:
>+	 *
>+	 * String formatted like "%\08x-%\04x-%\04x-%\04x-%\012x"
>+	 */
>+	char uuid[36];
>+
>+	/**
>+	 * @n_mux_regs:
>+	 *
>+	 * Number of mux regs in &mux_regs_ptr.
>+	 */
>+	__u32 n_mux_regs;
>+
>+	/**
>+	 * @n_boolean_regs:
>+	 *
>+	 * Number of boolean regs in &boolean_regs_ptr.
>+	 */
>+	__u32 n_boolean_regs;
>+
>+	/**
>+	 * @n_flex_regs:
>+	 *
>+	 * Number of flex regs in &flex_regs_ptr.
>+	 */
>+	__u32 n_flex_regs;
>+
>+	/**
>+	 * @mux_regs_ptr:
>+	 *
>+	 * Pointer to tuples of u32 values (register address, value) for mux
>+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>+	 * &n_mux_regs).
>+	 */
>+	__u64 mux_regs_ptr;
>+
>+	/**
>+	 * @boolean_regs_ptr:
>+	 *
>+	 * Pointer to tuples of u32 values (register address, value) for mux
>+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>+	 * &n_boolean_regs).
>+	 */
>+	__u64 boolean_regs_ptr;
>+
>+	/**
>+	 * @flex_regs_ptr:
>+	 *
>+	 * Pointer to tuples of u32 values (register address, value) for mux
>+	 * registers.  Expected length of buffer is (2 * sizeof(u32) *
>+	 * &n_flex_regs).
>+	 */
>+	__u64 flex_regs_ptr;
>+};

We could just have n_regs and regs_ptr for the above struct instead of 
breaking this down into mux, b and flex. The kernel implementation does 
not care because it only checks for these. The metrics XML processing 
may need to be tweaked though. Worth it if it simplifies the KMD code.

Thanks,
Umesh


>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
