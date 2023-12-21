Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD719C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 02:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8D110E643;
	Thu, 21 Dec 2023 02:29:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145310E643
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 02:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703125790; x=1734661790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tjL84Ppbx8pfTIqKR9LlBIyuoZYjm2veLxkuJoF4alo=;
 b=HEve+bvYrdX/eRQt/qj7/ViS/xRSE41GTx8huxNmmlpLln9FkgzRFG01
 CvO+2QFYKA5omOGitf27tSzAtY0RFKjn3coSlGZtBgxSMrLjxE3c8ZCrW
 9Z81kIA9jo4y3aJcA3W67NMZ0m1g7XMFY6k30opelCzV8gAOUKn7MW24t
 PhkLrK6gNcKJ9fEBI19mJX/tcKMvAxu1NhsW+TJLYf831+fvjd0u1gchh
 DZrLi2CpgHpSU3bNvA0Af6SOQY/TTjfm3iGFfIWxAAwadrj7p1QU/gZdt
 Cd62RnSrKGN8fCdcSPRKzu3BnK+x9/HQt/UNjEbwd0yQ28Hx2WeoHzfs9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="376059213"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="376059213"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 18:29:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="752776346"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="752776346"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 18:29:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 18:29:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 18:29:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 18:29:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 18:29:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgJD+s4Yi7KnNbHobCQYB8EecjGgYsJtU0HzcTp1L7HC3Y3UjALuQ3lFsW4/qfiOLELiX/4VTL4T5npISYZ/Wy4ZlBy4MG1ewRtQcrBAgy230OQSbydC7USEcU5uUEdiBQGHBXTSR/sWFUeLB/Hafg3uSA4nj7fxORvqoi6GbzxU4gHvyGZINerbMv3L7vFGG39TKFeyWX0Kfx7QaXWqsgE6F1SWd08TWQX+SEiHjDGE4UmRxN/lZ3BnXkeG+xrVlifoeYjdnh3wSkcFRcDROn6NuFQGOU1ojBiUTViM190OzLacE/3CUqHC1h44PJ5TjWvC9bcmFT81bgqiHQeqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBN0Dnkz/qXiI99Z59qZi/W/BE4QttPKkgxbZrtwRQg=;
 b=neUxqSAbkvKyge+A/iEH3yYiJ0qcH+lfNrLJYru1qX5YEfSsTWy44L8Yae5FZMN5sm1wTb/KAk82nr5d+cHn+3vbK1qQR4V0bqYWUTqXQO2MGduC7/zXzzH0Qb/P3BNXKBaMXReZK8i3jbQu7ltzh3SEOJDX69JSrfDT0avXTV3SKEeEIDp5yePDeWNLGVNdIRku3yYfUt3UQZMQw9VxZCpi7nxao9S5dxE1qan3K1ufJOohqT/g+ugY4FixZ+mPP+oMYwjAAzrAvPbgJj++bCFL5v5gPOYzzIer0CW67qMJnbenZazhkNKjFe9gghBmd+IxxIBrvnxNMbPYVPLQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SA0PR11MB4670.namprd11.prod.outlook.com (2603:10b6:806:9a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Thu, 21 Dec 2023 02:29:45 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 02:29:45 +0000
Date: Wed, 20 Dec 2023 18:29:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 5/8] RFC drm/xe/uapi: Add configs for Engine busyness
Message-ID: <ZYOjDfVEXA0QScsp@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231207125802.3730165-6-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SA0PR11MB4670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcb21d0-051f-4589-a2cb-08dc01ccb17e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AF2GTFSwRgQx71JiCJNfkB1wIEqhhdD6VJ+ww2/nChD9IlGoLn96SuAldQvjN6u/nwwvLYW+lL4sYttIRTW0ikLYZh9c4lWy7CyteXnuvr5Q+dED4h5yCfy1LIIDGMveEsxutWWHMWGVZfdwAC57My88uNhArfHx1LrcqbWuCTe/YYw++cl85p7MhLoZmGAl9YyWAyfOQcEmtwnXlhQBkR5nuya3eByMTSr3aGL4AlulYeRh/7ualkyWzXfumaKladsOBMJioWZC8ZNjzQdRlmV16rQvZq+yWOFdWKXyUPXZI4HeVyuTaI+UseQrW/NqkSHGaurtNe6oMFumqn+uv5iiofGiqNnd0DMG4l7EWRBgtPUqDEeneg9SUX9TBKqHtWR3Z0JmJlccyyV9wNz04H8uaz/RIatxux1DzY7IDs5UdPEemvIcVDYUn26VMgaqOkOouNdbrmayGInFbARFv+ngruy7wyRdXdSjBvKFTuzl4c6jpczAGRoOxVpikkyMPZd1rqzopoVE6pDpWfLx2EB7JDvSwKc8A9n8CqbYpj1BrJwmX8mwM0H1vR+R+NZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(2906002)(82960400001)(8936002)(8676002)(6862004)(5660300002)(4326008)(478600001)(26005)(6486002)(41300700001)(6506007)(9686003)(6512007)(83380400001)(66946007)(86362001)(66476007)(66556008)(6666004)(6636002)(33716001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRnYTVpaGZ0VWVqV3VhWWM0bThNZUxaN3pZdkl1QjhUY0pEdUJ1QnFaOW1M?=
 =?utf-8?B?eE5ZOFB2RDVBYk84Lzc4WGEwbDdIUjVYakxpV1VGV21OVWZJV0FWYnlUTFhq?=
 =?utf-8?B?Snp1dzFRMm42MnY1N3JKYThlY0xpUnAzWmlSNkFjRnlMQVBIZ0Q3RzZLSnR1?=
 =?utf-8?B?K3l5S3VuNCt6ek5FOVVhRXkwUTB4ZTZTdnFCdDIydFZIZUNmODdvM21pK0lS?=
 =?utf-8?B?RUpibWxGeVkraXZ1S2F3V21SMjVHYjU3SW1IRW5yTERVL241UXNjbGxjWjZO?=
 =?utf-8?B?cXRMKzJoRzhrTE9mUWVFTSs2K3RwQUcwdGhGQWpJQ1pCNlgwSkpKeGJ4Z1ZB?=
 =?utf-8?B?cDdMQTNLemxjVU45R0Z5bUNYSmJVKzVIOHl3Ri84YzhDUmZKOFJ0VEFiY1p2?=
 =?utf-8?B?QUhtWnY0N21vT2dKOThLK3d6TzdwTWsyQncxYlRJaGFLV1l3djFEMkFnZC9I?=
 =?utf-8?B?dVVtRlFmYlBpazArajh1VFVRV0hHUUxDeVgyOC91bUNNTFo0Q1BiWERjNUJP?=
 =?utf-8?B?NHhGTTBaUGtyU2JQQ0wyRHV2WlgyUlFRN0pocFpvWHpmSjVZak9TTDdnK3lH?=
 =?utf-8?B?KzNFYkNKUFQ0cTl6cFpjUnpSS2lYZHFYeVB5eFUxMnVHTTE5d3NUeFFVWWdU?=
 =?utf-8?B?NDQxR0NYVVVWempvVjdHa3F4cFU3L0dEbURadXVzNE1qZ1BrcnhTdU1jL0cz?=
 =?utf-8?B?TEtvTkpvWDhsaE45YUUvT09MdmVyU1NzRHBPNk4wUVFpZjl6Skx4UG1ReTNK?=
 =?utf-8?B?emk4b1FkMGJqTUp1NDRiMmx4ZjZmRnNzS3lidUNmTTlJbVp1WnZHRzZ2QVVw?=
 =?utf-8?B?WlJTVWRWbStWNHBSUUl3WDdjdElWUXU4SnJpQXZRU2FnRlI0MlM1NFBqWERm?=
 =?utf-8?B?eUk1QUZud0g3dlBobVRuSWVZMmc3VHBDQ2VuVy9VdEViNlM1U2dSUVQ5Z2Jz?=
 =?utf-8?B?Mnd6R0c0NWRKdEk5aXM3NUdHcldrMytzZ0lockNQcDNHd0toT0JuN2phcWth?=
 =?utf-8?B?Rlc1YUFta0tIOWdCRDM4eFJaWVBrZ2ljMkRDdWhaaVNjYzh5R0VvUlM4cmtY?=
 =?utf-8?B?WlEzQkozem1kL2U5K1I1aEZTZ1VNVDc1ZjgzYm51VnpuQ3JUb1QvOEQ1N1hV?=
 =?utf-8?B?V055NFVuUW9OSVNiRXpQRVBtcFlnZVZMTXkyenpPUUs0ckczQzF1WUJrV2tm?=
 =?utf-8?B?dE1FZVFNYUpheGlEZzBmeXBWKzMvYUM3cmNTVGkrVk16TjQ0Sit1c0JaNzJa?=
 =?utf-8?B?eHMvc01nQzYvUm9EaVhkQk93ZW02ZitkaUU5T004Y1BhQ01xWFp0L1NnOVZZ?=
 =?utf-8?B?OGhUTDZiTjlnWnpFYkk5Wlgzak54bkV2YTBFZG9ESTJyVDd1MEJ0dmlTbVE4?=
 =?utf-8?B?cnNQS3JIQXo4NHRkajVtQkxVVFJjME41cFJEbVpGV3puWU1kRUt1Y3ZOaURQ?=
 =?utf-8?B?NzY1VWdTZFBVaDJXVllzdGk2M0hkcUNOWThLL05sZnFRdWZhVTZtWUl2VWty?=
 =?utf-8?B?WkRrdHB4MjVVWkpLbkd5eFpiQ3U3dlZlSnYveHB4M1J0d1hidHVEcEVDbDVL?=
 =?utf-8?B?eFc3K1pib0dkdFpmQzhwYXBJek15T0p0VDdCSnovMTJseGVHenA1eGhvbTQ3?=
 =?utf-8?B?c2h2dnV6RWxSUWJNa0RUWE9tV2VLcDdBclllamtFSmgrRWNqV0tmRmVwa0pN?=
 =?utf-8?B?V0NpMkYwMlNjcSthSjRpQmpVd2FaY1NqeGJxV09veU1ITzNQNlVjTW0vTUla?=
 =?utf-8?B?VFlsenVzTTNBNUpPVnZrNURkc0EwcTlsNE5qemhPUFQzVTlka2hRSFA0aXVI?=
 =?utf-8?B?ZGJqQS9XOHovbzR5cVNvQzZPaXdaaER2Zy9DUVhVU2FJYlpHSDJBd1NoWWRC?=
 =?utf-8?B?OVB5dTFTU2I5a0JRMzlQeTVSQzFJbnNPQWVNTndmblF6eGJlZG1NbzVSalFL?=
 =?utf-8?B?RG5KbWt2WlQ3NG13UjBiZVdDSkdTMm1ObHpCeCtNaG9oTEg1ZEtmY1lmdkNY?=
 =?utf-8?B?MHhFb3BrOWhlTzhGUitpbXhqa2pNUVBITWNaRG9CM3JLVk1kL0tOSHhBV3Nu?=
 =?utf-8?B?azczMy8zbjFuZ1BYNkFjZm9XMWxoMnIxYXlGb2JFSGpKaWZuMFh0MzdPS2FJ?=
 =?utf-8?B?U3dlbjdVcnhJdk41dkp5RXYxY1hLNFBJVHhYSEdwNlpteUZUOE00d1o3NlQ1?=
 =?utf-8?Q?0u0AkmcpcstnHc5tJS6RcTo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcb21d0-051f-4589-a2cb-08dc01ccb17e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 02:29:44.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNzcQmzPBuZXvHdjgKkb1AGpbtnUdHT1OdZ6Z4UEc+XPwJRtWzpsCqhU2sjpY0DrN/wewfxtlzq5jDAqCnBYrmcDj7EA2X/ob/lRmKH2Yws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4670
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 06:27:59PM +0530, Riana Tauro wrote:
>GuC provides engine busyness ticks as a 64 bit counter which count
>as clock ticks.
>
>Add configs to the uapi to expose Engine busyness via PMU.
>
>v2: add "__" prefix for internal helpers
>    add a simple helper for application usage (Aravind)
>
>Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> include/uapi/drm/xe_drm.h | 23 +++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b5e7a4f673fa..074d63cb79df 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1107,6 +1107,10 @@ struct drm_xe_wait_user_fence {
>  *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>  */
>
>+enum drm_xe_pmu_engine_sample {
>+	DRM_XE_PMU_SAMPLE_BUSY_TICKS = 0,
>+};
>+
> /*
>  * Top bits of every counter are GT id.
>  */
>@@ -1115,6 +1119,25 @@ struct drm_xe_wait_user_fence {
> #define ___DRM_XE_PMU_OTHER(gt, x) \
> 	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))
>
>+#define __DRM_XE_PMU_SAMPLE_BITS (4)
>+#define __DRM_XE_PMU_SAMPLE_INSTANCE_BITS (8)
>+#define __DRM_XE_PMU_CLASS_SHIFT \
>+	(__DRM_XE_PMU_SAMPLE_BITS + __DRM_XE_PMU_SAMPLE_INSTANCE_BITS)
>+
>+/*
>+ * Engine configs offset - 0x1000
>+ */
>+#define __DRM_XE_PMU_ENGINE_OFFSET(gt) \
>+	(___DRM_XE_PMU_OTHER(gt, 0xfff) + 1)

Thinking this should be (___DRM_XE_PMU_OTHER(gt, 0xfffff) + 1) because 
class is also 8 bits. This part is not any different from i915, so not 
sure if you intended to change it for XE.

>+
>+#define __DRM_XE_PMU_ENGINE(gt, class, instance, sample) \
>+	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
>+	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
>+	(sample)) + __DRM_XE_PMU_ENGINE_OFFSET(gt))

What's the idea here? Engines are limited to a specific GT and the user 
is also passing in the GT in the config?

I think the gt should just be shifted to __DRM_XE_PMU_GT_SHIFT and ORed with the engine counter, more like:

#define ___DRM_XE_PMU_GT_EVENT(gt, x) \
	(((__u64)(x)) | ((__u64)(gt) << __DRM_XE_PMU_GT_SHIFT))


#define __DRM_XE_PMU_ENGINE_EVENT(class, instance, sample) \
	(((class) << __DRM_XE_PMU_CLASS_SHIFT | \
	(instance) << __DRM_XE_PMU_SAMPLE_BITS | \
	(sample)))

#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
	___DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE_EVENT(class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS))

Just an example, naming is up to you.

For group counters, the logic you have is fine as long as you set class to 8 bits:

#define DRM_XE_PMU_RENDER_GROUP_BUSY(gt) \
	___DRM_XE_PMU_GT_EVENT(gt, ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + 0)

#define DRM_XE_PMU_COPY_GROUP_BUSY(gt) \
	___DRM_XE_PMU_GT_EVENT(gt, ___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) + 1 + 1)

___DRM_XE_PMU_GT_EVENT(gt, 0xfffff) is same as __DRM_XE_PMU_ENGINE_EVENT(0xff, 0xff, 0xf).

Thanks,
Umesh


>+
>+#define DRM_XE_PMU_ENGINE_BUSY_TICKS(gt, class, instance) \
>+	__DRM_XE_PMU_ENGINE(gt, class, instance, DRM_XE_PMU_SAMPLE_BUSY_TICKS)
>+
> #define DRM_XE_PMU_RENDER_GROUP_BUSY(gt)	___DRM_XE_PMU_OTHER(gt, 0)
> #define DRM_XE_PMU_COPY_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 1)
> #define DRM_XE_PMU_MEDIA_GROUP_BUSY(gt)		___DRM_XE_PMU_OTHER(gt, 2)
>-- 
>2.40.0
>
