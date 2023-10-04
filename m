Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB82CE8FDC1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 00:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9114D10E32B;
	Wed,  4 Oct 2023 00:27:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E010E32A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696379254; x=1727915254;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9qz1mvgntIjrTKHp4whkBl6K/XObj2Oos5apOGlteqI=;
 b=DaBdtTmZQd7bUPpVLn4SSfjHlwmg826Z0yjaiyJLmaCZg/zyIOIWD4W9
 pblrZapXAzYAkPCOEE7XWM2qu0cCTwnzVSG8Y0kNeP2yApoKKsZ+152Am
 QcwrFPsKN2Q9t0xc6B/IAvWyVP+/NKVOtMSpOJba6Tew457wwZZiOaKJ/
 8r/k3P61NQfGgbRe9LcU2iNbEIdWVEEYc4belBDif+EEs8h7OxflCogB7
 vTPmWRYmcIa2WMKiH0JwNb5SUfnnzqlQPefB0x9OyYhS4FRSAgkJ8qkSr
 2svxR8qeE37DWKTCHBx8zScu/HovTn8IRTN+2X4lV2lJaDTwYbW4+x4X3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1611516"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1611516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 17:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751084179"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="751084179"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 17:27:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 17:27:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 17:27:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 17:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0FTEpX4cwEX3JC1mTMhqObR6Ec4hgsRfYZkZ76qIkkfaBUY0WcuB1mGfgE72mlr5o9urjxBZqK6vMgsY4sFH8oGCKhNmGHEGcl0iNsybFgA/HEnYU6PZt/atEvQQ8/MSSznNLVQ09S7fRKwYbTUr0extViUEaErYQo0baD6etR4OxoGcjGYkRuVt9L+8NG0yP1e+z6/d3Bi8otKWYZ+CWXv6a1Oz6fWGaVknB2Tl3WGal4ssaQDvOTQi/woG9Z54Iz4eW8XFtGxIxbOr85x9TYjrEKR2NI+B2oB5fnROmNDEN8Z441ylmBzCHU4mC7HmfMt1eW2NTZR6rWyjcNwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PNK2pGA4f2g6pTe6rMIWlwQhUarO2sC70cJcCpF2Ac=;
 b=a5oYBN35ImvrH1zDfy3SAyrhwgdaJhvWxWm0xSCh1SvIDANo0B2pA/BYYUu3oZ4cfl1GAHL9cHdEkVKDUvRwJbZ7p8wl2mbGiX9rFr0vns4XnOVneuNjgh/1ySR/3rnOzZ0v3BEWfcLRMeZ5NmKueR13BbMQ773AY8Thewt6v2lHexJehPXocO/eoyA3O8jZxilP8gAgKdaLdkBA/bV6jBHfBCOMPixx8pk/NProI7R12KYC7ixpgFZMKAFv8Nk5rFtkYp9AVm6KNrZwXXbvq/q6lHrBOPKgGvp6Aw9OO0MMJltSqKGQEpGBRIVQGq5ojlAY75GFdo4IIHi4jMMj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.34; Wed, 4 Oct 2023 00:27:06 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 00:27:06 +0000
Date: Tue, 3 Oct 2023 17:26:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZRyxUKJRx6Zd5rx/@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DS0PR11MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 38165ac8-6933-4e25-32a8-08dbc470a372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FniLYoaHF1ic/6nLfnja/7D54wEc6/d+hL8AY7AcXKIWH0ZUqFvrMLv1AH80CPTI3yMfsdKbX++ZO5pN0XsnPISEXHQYGiWmS9hKiykI2m92Je1cGTXn567X4RYJvR5rkR5NfblpEFogAcSTQo25/QkX6FlO+RHqElFcbxeW+/VIZjTDXxeyw/DiQVd0NRI1Sis/IdJVi5GLS21R4zvEIytOlLjw6mfoynicFrGAZogpl0j3450ivG1NeNdTYQHGOv0HQEIHZwNwTHsNtEuHta14YLKx1WcU94PCjD26c/i0DalWj/yMtSRml6+Lzs1cV70i/hyplUZ2nLln062W0ytEzFCgQj6ICN2RevxNftwPXgCs86lEgFhZMUxtoXOSzyB42TlgrNFF3+zZUkBt3YcCNrSuUsqqOWmOWt5d1W4w00OKtu5M7Vi8ap7AuiQT6PDX7UQTIB+0eaFEVNF/Eg+L+V965MV9+jwuglAYUWPnJPA0h/it+paaCH/+2VCVzzA25BnP7r7A+3pnz9mTa1I24kbDERzDfIswAo46a5IN9+9ZTpnVXHMfJxel0I9X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(30864003)(66899024)(9686003)(6512007)(6506007)(6666004)(66476007)(38100700002)(6636002)(316002)(66946007)(86362001)(478600001)(66556008)(33716001)(83380400001)(6486002)(82960400001)(26005)(41300700001)(5660300002)(8676002)(4326008)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TndzdjJhNjZERnJKU3ZLY0c4dnNHN3dDZlM1NmU5ekRSM3FMSmFHOFdCOHlM?=
 =?utf-8?B?RlloaWNiVUc1bHNYZUQ4MG03VDVqODFhTzJiUldQU0JGS2pva1pJcEwzbG9D?=
 =?utf-8?B?Y2JvUVpHemI5K3d5NHhTSm80Q2VTRDNweTNwdVdycy9WMFBzbFdyNWxnUWtS?=
 =?utf-8?B?aHd3ank4T3BBenRrUkxQVThlTEVSYi90YXkzRVRCVFd1WkJ6NHhlT1k3U3J4?=
 =?utf-8?B?TDM1UGdLQWpJbDdqakZZeTJGQ0FYL0EvYVhKZlUrQ3V3d0tlS2gvMWxPRTdl?=
 =?utf-8?B?ZnFpUmtDVWJkZDRNNm1KL3RMY2NIOUY0d1IrSlVNNEZRT0ZBR0lZUWxDWHdF?=
 =?utf-8?B?SEpoUjliMXNLMVk0ckRSeG0vQ0xQeS9tTEUzaDZTdGs3QXNkVnFMcGRzYlJH?=
 =?utf-8?B?amw2MGk0SmN2K1JxUklxYjhYOVRCLzgwZFBMRm5XWTAyMFQybFRLaUlCa0Y1?=
 =?utf-8?B?TUEvakxWOXp6alYvbTJSM21leW9BNkpNSmFPajh5THZnN25uVDZxOW13MmxX?=
 =?utf-8?B?dnNDUzl1VjRHbEt3dk84Zm5idmtrWW1aL0ovaDFvQ3JVdmV2NUxTOHpDOXRn?=
 =?utf-8?B?WW50cXhMRW40MHVnc01tcXRZMDRBdVBrMnJDVm9LUVFnNExiQmNwMVJRK01y?=
 =?utf-8?B?cW1SeldyaytnU1ZmRnFHcldwaVhkKzFZSmx2L1RiWHVySHhqU1JMUEVpaERk?=
 =?utf-8?B?bDFjb2xRMURQYmU4Wm4wOUtKRG5xM1E2RTFDeGpMWE1qUVh2S3lmS2VkcEht?=
 =?utf-8?B?cGhET24wVFgwbHNIY285TzNkSGMwRUZjNy9saHE5SlNMaTVsQm1zWGp3MlEv?=
 =?utf-8?B?ZG81dGtXNTlZZk5Hd003RVZ3VVlWTEhxRjdtVFZEN3N0ak1PSExaU1JOMmhk?=
 =?utf-8?B?U2xsSFBQZ0I1TGNjRXlISVYvZTArRlZ6bU85VDV3ZXMxVTBSeXVUWjBJc05F?=
 =?utf-8?B?VjR0c2owWlFLZWRIWlo5VXU3b3VPNnlqR2tQTE5mR2JLWUlTMkVhR0laMGQ4?=
 =?utf-8?B?MG9EL090Ri92VUlLVDBhWE5tcVhOU0dYcTNFT0tZaG42TVhnNmxsTUEzcFZi?=
 =?utf-8?B?UXlPcUVyM2M4d0R1RDBzZGgyV290QmVnN0dSRkc0eEpPOFVvS0pOVjVTdUFZ?=
 =?utf-8?B?em9iTmFiUEpCamF6L21ORXpXWnZXSk1nTjVNRnFLdVlwOXBYRzFsRXZGdDgz?=
 =?utf-8?B?QmNqVVdvUEJtNE5nZzFSZ1Z6K1NLblVkbjRYTnBuVVd3NkxFM2h0bnBqbFZY?=
 =?utf-8?B?YW1lczZNaWY4ak9YeFpQekVmbG4yUTJyMGxkeW5xQW9wbE1Ydm5QZ3lJcUhO?=
 =?utf-8?B?UXM1aHdqUmpEMEN6WHpkajUrVUduT2tyekg5N0g3SnJkNCtLU2NVUytIZDVV?=
 =?utf-8?B?VHpsNTR6TkIrM1IvVHhJWVl0L3pLcmQxSEQ3YUZqWnFOWDFOYVZFQ05Ba1Jx?=
 =?utf-8?B?Rjl0K1NlSXVWY0p6MGtJQ3J3dS9IbjJ0dHlmNFpWRktEazY5ZTBEZlN3bHR4?=
 =?utf-8?B?Z2QxSUhKcXR0VnpkMDFmYnpOWHNkUUY5MnJIelFyOTdDN1FNaWF2Z0l4QWlq?=
 =?utf-8?B?dndXakVQQ1liK1B2VUlSK3RZdktqNUZwMDRYSmRMcExMS2o2RGVGQ1RCQWJR?=
 =?utf-8?B?cU1Ud2ptSEZsWmVmUzVYMzhpSkpadTFWNG51TitScm1OT0N2RHl1TkRWeG5u?=
 =?utf-8?B?dDNvSHhsN3FZdXA5cW15VzdpaWEyU3JLRS9SSjhJMTE4R3BpUm1jUXJ1bXpv?=
 =?utf-8?B?V2oyM3p4T0psMUl0WFhaUS9xK01hcjEwUUZRZU1icktpeDFDTXNiZnN2RWh5?=
 =?utf-8?B?VnVMM1NYUWNUeVlJS3NkaWtCZ2lJUkpjczRkazNleDZhbHdQSkYrcFBnSkds?=
 =?utf-8?B?STNvV0ZRYm5OaWEzYU9DWGxxWGR0N1E1cDMzQXEwcktpM28yczBuakFYbkJ1?=
 =?utf-8?B?Zldwcm0xZndNTTIzdmlmcHIxL3lBSklKK3k1RHlzL2JCTG11WUZDSEpYb21v?=
 =?utf-8?B?dWRPNTB2K0wzS1hlV29Nc2FIU2s1amlPdmtYQWdRMEh2Lzg5eW5sY2RlajhQ?=
 =?utf-8?B?QjZlbnZsUVNnUlo5Zk5QaWpKd2QzM29VRE5ROE9XL2lkQlE0Q0txaUNpL1hR?=
 =?utf-8?B?YW05RDBDL0ZoVkNmZmhrVXJJZHJjNFBpMnJvcTRzTEZZRnFFcGhHUzlERjRB?=
 =?utf-8?Q?1CkJ/U5LoCQdPHzFh5uHEzI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38165ac8-6933-4e25-32a8-08dbc470a372
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 00:27:06.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GWoPE0h2X45RobnFSRGncZyijUJG4JZZtdlZCLU3zWksexjWJ2qrAAovrPGRhZwRJnm4lQ9W83cQIPD/DALOTnqVsAS5mnraSxokYaXZ3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/21] drm/xe/uapi: Introduce OA
 (observability architecture) uapi
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

On Tue, Sep 19, 2023 at 09:10:29AM -0700, Ashutosh Dixit wrote:
>OA uapi allows userspace to:
>* Read streams of performance counters written by hardware
>* Configure (and reconfigure) which sets of perf counters are captured as
>  part of OA streams
>* Configure other properties (such as format and periodicity) of such
>  captures.
>* Query associated parameters such as OA unit timestamp freq, oa_unit_id's
>  for hw engines and OA ioctl version
>
>v2: Explain OA is observability architecture (Francois)
>    Change to reserved[7] in struct drm_xe_query_gts (Lionel)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> include/uapi/drm/xe_drm.h | 255 +++++++++++++++++++++++++++++++++++++-
> 1 file changed, 253 insertions(+), 2 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 6ab85c7fed361..3a64f904858d8 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -111,6 +111,9 @@ struct xe_user_extension {
> #define DRM_XE_WAIT_USER_FENCE		0x0b
> #define DRM_XE_VM_MADVISE		0x0c
> #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d

Assuming 0xe, 0xf are in the pipeline by someone else, As long as it's 
resolved before merge, we should be good.

>+#define DRM_XE_OA_OPEN			0x16
>+#define DRM_XE_OA_ADD_CONFIG		0x17
>+#define DRM_XE_OA_REMOVE_CONFIG		0x18
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
>@@ -257,7 +263,8 @@ struct drm_xe_query_config {
> #define XE_QUERY_CONFIG_GT_COUNT		4
> #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
>-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
>+#define XE_QUERY_OA_IOCTL_VERSION		7

looks like removed in a later patch. why not just remove it here and 
avoid adding the backend implementation altogether? Although it would be 
ideal if the uApi and implementations are part of the same patch. I see 
that you are doing that in future patches, so ignore if the comment is 
redundant.

>+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_OA_IOCTL_VERSION + 1)
> 	/** @info: array of elements containing the config info */
> 	__u64 info[];
> };
>@@ -294,7 +301,8 @@ struct drm_xe_query_gts {
> 		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
> 		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */
> 		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */
>-		__u64 reserved[8];
>+		__u64 oa_timestamp_freq;
>+		__u64 reserved[7];
> 	} gts[];
> };
>
>@@ -748,6 +756,7 @@ struct drm_xe_engine_class_instance {
>
> 	__u16 engine_instance;
> 	__u16 gt_id;
>+	__u16 oa_unit_id;
> };
>
> struct drm_xe_exec_queue_create {
>@@ -1091,6 +1100,248 @@ struct drm_xe_vm_madvise {
> #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
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
>+

okay, I see what you meant when you said that things change in future 
patches, so I will stop reviewing this patch here and continue to review 
the future uapi patches.

Umesh
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
>+
>+struct drm_xe_oa_open_param {
>+	__u32 flags;
>+#define XE_OA_FLAG_FD_CLOEXEC	(1 << 0)
>+#define XE_OA_FLAG_FD_NONBLOCK	(1 << 1)
>+#define XE_OA_FLAG_DISABLED	(1 << 2)
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
>+struct drm_xe_oa_record_header {
>+	__u32 type;
>+	__u16 pad;
>+	__u16 size;
>+};
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
>+ * Returns the previously bound metrics set id, or a negative error code.
>+ */
>+#define XE_OA_IOCTL_CONFIG	_IO('i', 0x2)
>+
> #if defined(__cplusplus)
> }
> #endif
>-- 
>2.41.0
>
