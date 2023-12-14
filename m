Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92789C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 16:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6304510E1BF;
	Thu, 14 Dec 2023 16:46:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302510E1C0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702572374; x=1734108374;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dSBwzvEt8QOhSqTF0WVr0tJMjUNPWSrjMNVch1NnCis=;
 b=WAh3I+bZuAtonYkjqmLYaFzmSn3oGkpZMG/V/QLKkBALnBhZQbYvngHI
 G9lwpHC0TWFfE0Ts2hFNrvMywmw3qHSy4cL7PnamG+FreqYyiEuywXfWU
 bREznchaxCVZQpOQe5pp4Ia2JziQv17phr/ye0EGyfxhVYit6a6BrgZ8u
 ufwcEInj27AmVNPATSIManVd1RPoug7OmT3WAY1W+3mvCeg6LcyVb1L3h
 Nr2QL7SQW5+OxM2THyPtxwh484J4fhlx7O8oVZRYriyOrae7RdhtjiD21
 k6VSJ4frPSFYl/rByRCGCh1Vx3skbI4+JW6w271lmTXInATtB0akp/4Tb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2303255"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2303255"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 08:46:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947635870"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="947635870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 08:46:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 08:46:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 08:46:10 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 08:46:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZeGZKn81zafdiINNPIg8Y1KoyON5gPk9mRzb9RClNHXrzzggJy/kSdz7GXjNXZTwkMtl5cakRos5AlowDhaAFirQP5kytDmIUo4GdPIahuRLXGO9/Gk/kEUTuGZq+myRT4dmX9wIABMmol6V9uU3WWNaXyVLRgR4N4eMlLxKZTw1+W4RX2ZVohXPVGO4vBL4glolCug7rhV2NeOedibDsyAxLUey5+BSMb2SMhoUV0CGg5m2Q+dcSSyu9N5N35KN0jjpUpAYFXxFuXnnupK/wxQOpLzf1k9T0dTqkslv/tlVHnXvHYBanEaYngoxDDDi5TeNZYxsMMz1BaIm5e4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bPmkH8tSxvGdGZraqfeoP5eyd+2dtFIDsv5hVgivpE=;
 b=DhKf0fSsvoxT2o8DcbeDs+WJte7cmI5CYM4Oy46TXraMzYSKD/F3LLI1/LTKdtsCcnZmtBVHwNoXpWBdsRmiONXYOuat1UvXmX+G1+6JYdEatGCual7QDRG/59hHYq22q4DSFTvQ+lpFbjQjVKnUJKRYEsmc4IfjGhJNPlhCRm8syp2lHq+N7oxkZnwKh1eCLX/JIyVjFa9pBNkzZBaUajrB5hSC6VuAO5MNRthK2/zI5riqN8d1ydFd7DlUtwxMtt9qwYvbLXVoFI41A+zWsqu85t96CCXosSuOVk1eT4eEyPuYun8n+t/Ys7OO9biYS/8vsd08vGo3uQR5XsGL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7582.namprd11.prod.outlook.com (2603:10b6:806:31e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 16:46:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 16:46:03 +0000
Date: Thu, 14 Dec 2023 10:45:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 09/14] drm/xe/uapi: More uAPI documentation additions
 and cosmetic updates
Message-ID: <x372auciffcjchrgqo4k35orpocaycb4kpx2p4zxjwnrfoji5o@gkwsy7tnlebg>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207135009.7-10-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce12f15-110a-409b-2382-08dbfcc428cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MsYzn5G7eTd+cumsPobW5sIDrGTGEscFAU/4b8o9Wwd2LFYYq/TMeMQOIvDGV7E/QsnD8IV1ttycLTYDQCRy+fsoGnNI/wvRhizuBvh1rB2a6Juq74sZfXV0/YQjWafK1WOd09JeeZBRHOVcyByvedS2z+b+OBSNwoezK4ltf/3mY498hkgZjmxhYfgE5dDpvKYEzw+lg9XHsObh2pGy0BjBYFXVSU59wAz8VYnuJNCvtUPiqPovGpdg31uolMON5fanwB4u3vFdpnVYq5Q5zsezoPYzqKk3xvIVkQFx88CT1zA6etkTz8ovszyk3U5a1GMO1q3erD9ZJMEciIR3pYVWQaa2KYG8W+u8I8zJO3+fcqFX7cwRviE+ZVVx8fAnWCkXFdgUvRypgFvZ3Bla4VxhNz69t2cyavDJHqLsDcmfrSXSb/oVPHueW6TKLn9C3DgonYE6vTTREKjlnJcZmyQtblGqjpvWaFHZRJxM08wHyTrRWlbPOlcLZhTM9c/oPdtcaBHHcdy23gRoqay4FA88y3JNyD/O1szVIyixLULdqpISl6oB5eonjE1F7zjI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(9686003)(5660300002)(6512007)(478600001)(2906002)(6666004)(6486002)(83380400001)(107886003)(26005)(66556008)(66476007)(316002)(6636002)(66946007)(8676002)(8936002)(6862004)(4326008)(6506007)(86362001)(33716001)(38100700002)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uOoP4D7s82Pi3vCIIjx3whLKa4vXkNDA/DmZWr+mev+g24TPCiLnEhglQM?=
 =?iso-8859-1?Q?WcfUZa7/gL2wdd0sCZbWb6u+yU77RbeqdD5BB7wTu6VV0pO3QydX1naqqW?=
 =?iso-8859-1?Q?fqVcuYBcc72/dOQMiotGLQf6BmKKIQd7CWxRbscsMV/urvEegyhSWHwNXB?=
 =?iso-8859-1?Q?cWkRLE5+TmfjJhvYvcs1TWoAvM0EjP6oeNQDHpP+FTufbTKnWhijiU6cIQ?=
 =?iso-8859-1?Q?YM31HbcmBID+0rn0q43CPzJILja/KExiNCZYq6RVYEoKoC4vz7CC/kPKmf?=
 =?iso-8859-1?Q?jKWs+kmc3wk1OVgowgyWv7LaQeycLaMA80pQY9Es6l2ogloexmMdXUoD4r?=
 =?iso-8859-1?Q?m+U015WB8fqCPfVLh0zL1nPR2lGy8RrTTViT4mTZSr9qh4e90iIBAz02Pq?=
 =?iso-8859-1?Q?w7Be8FLmXro9nB+Il7HXaYZDiOH7B98o9m3awFcaZjh/5fO42VOt0UOFNC?=
 =?iso-8859-1?Q?1HRu0TLk1D+5deWum6o9w3wWQUkgb0o5obrNYdzeCQI2ncV9ZM8N91F25u?=
 =?iso-8859-1?Q?f5wDRjirPtk7+wHJ4aroIKQigfSKyhJxyyFpP0tUJRHAVepS/pYaisroHc?=
 =?iso-8859-1?Q?Y7YnN2fP0qsqwDuRGDvZEs0XugbSQ7M8xn3LlhhOYaIWWlw1s2ohlc3SCh?=
 =?iso-8859-1?Q?D1+VbG60scglMd/TuKnZRUFYTkb6BK4KLRM+mDPyllqyFfx0v63Yhqc8oc?=
 =?iso-8859-1?Q?BQokfEhZo5QSmOqwHBdyxa9f2KO6Lhx4svZLGn/f0oIf2S4GZ9mhPmy9/Q?=
 =?iso-8859-1?Q?SHM48niTpLQb31KE80H/TTZHzEJGudt5s3vItMTVfxcgY++Kdi1u/FZPIm?=
 =?iso-8859-1?Q?9WTZdIV2TD1tQHeMG+Cvoz2x4d21uJHRVXOeKWCwkcIqmayd5/DB9Q5uwP?=
 =?iso-8859-1?Q?F9S2Hred8Folzjp4fQp877Mi5sbz/kMGgEHDp889yYCv+PL0FjMyHzQJyC?=
 =?iso-8859-1?Q?a0ArIgTMi3WwdqXrnWt4/OszZR85Mg4qCPuBPQy5bWbq/ilxDg9lFbbaSu?=
 =?iso-8859-1?Q?crQGP5JIjmpah0AsU+vCTnXzPB/qouwcw5pJjQIpRsCeMbyx3COw21VCiY?=
 =?iso-8859-1?Q?NlTZkvltCLPVHGJa1wGxm/zqPa7jWSb1Zu+L2wAJcT7dYMX/z4bXC0n0Ko?=
 =?iso-8859-1?Q?xASwT2mUsd3Lrpk/WJ4BrAiDkkKK9JlGStrUvaZhWX26SkKRhPTf+41RRv?=
 =?iso-8859-1?Q?yobbd5KmECx+V40+7QRJ7Ypt5457bAmpmJsEsnZcgfJHN5DihVNa+JIIBF?=
 =?iso-8859-1?Q?0amZiQqlHhqfAiFEMcXJsuWKZ7ILjOPTq0UgOQfryCcdavpcATlwqk8nxa?=
 =?iso-8859-1?Q?gJJb3VLs+XDKWxTsdnLWg0+fwm0ndeGDcNbdmiXVd/FQZfwVGy5eNw7S+m?=
 =?iso-8859-1?Q?gdZsfTkcJ/pq0x93C2Hel/TCz+V0uvso7fSYU1PO0P4hnArtOq9oSZDZYW?=
 =?iso-8859-1?Q?z3SAocX08BoPZdB1tBMr73G4EJHmDycmUptbkeRP48A714DeoFxktXaLQo?=
 =?iso-8859-1?Q?/QPnpA/pX2PHPST79BfdYDj3iNdaptbf7wnlobTqavoj0gZBV9tujDkFvw?=
 =?iso-8859-1?Q?pCWQ4Ffz+DtHi6CTocydjrS8WdvS/6+Z9HXcvpZ3b/ZeD40omhQLRZe6SO?=
 =?iso-8859-1?Q?cgLT/6sCWnBYxbWTAXK19zgQQ8Cu2fO3CQbEZYWBluQxX/bWX8yZ8e3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce12f15-110a-409b-2382-08dbfcc428cb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 16:46:03.3981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2g9YQ71x0O5ZPmsiBbc3bongPMcrFJvxDgONMVpGwXPWINceWGNMyHQGMs2iyyG86bPaKc2dHIvWmvmiQmjftzEU6CQCndNPwHZaK3p66Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7582
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:50:04PM +0000, Francois Dugast wrote:
>From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>No functional change in this patch.
>
>Let's ensure all of our structs are documented and with a certain
>standard. Also, let's have an overview and list of IOCTLs as the
>very beginning of the generated HTML doc.
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> include/uapi/drm/xe_drm.h | 48 +++++++++++++++++++++++++++++++++------
> 1 file changed, 41 insertions(+), 7 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b36f3bd53611..55cb22b2c7e2 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -25,6 +25,28 @@ extern "C" {
>  *   6. PMU
>  */
>
>+/**
>+ * DOC: Xe uAPI Overview

not sure about the lowercase u. Isn't that used when it refers to 
µ, like in uC (microcontroller)?

>+ *
>+ * This section aims to describe the Xe's IOCTL entries, its structs, and other
>+ * Xe related uAPI such as uevents and PMU (Platform Monitoring Unit) related
>+ * entries and usage.
>+ *
>+ * List of supported IOCTLs:
>+ *  - &DRM_IOCTL_XE_DEVICE_QUERY
>+ *  - &DRM_IOCTL_XE_GEM_CREATE
>+ *  - &DRM_IOCTL_XE_GEM_MMAP_OFFSET
>+ *  - &DRM_IOCTL_XE_VM_CREATE
>+ *  - &DRM_IOCTL_XE_VM_DESTROY
>+ *  - &DRM_IOCTL_XE_VM_BIND
>+ *  - &DRM_IOCTL_XE_EXEC
>+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
>+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>+ *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>+ *

stray newline

>+ */
>+
> /*
>  * xe specific ioctls.
>  *
>@@ -59,7 +81,10 @@ extern "C" {
> #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>
> /**
>- * struct xe_user_extension - Base class for defining a chain of extensions
>+ * DOC: Xe IOCT Extensions

IOCTL

>+ *
>+ * Before detailing the IOCTLs and its structs, it is important to highlight
>+ * that every IOCTL in Xe is extensible.
>  *
>  * Many interfaces need to grow over time. In most cases we can simply
>  * extend the struct and have userspace pass in more data. Another option,
>@@ -93,7 +118,10 @@ extern "C" {
>  * Typically the struct xe_user_extension would be embedded in some uAPI

			  ^ to be renamed to drm_xe_...

>  * struct, and in this case we would feed it the head of the chain(i.e ext1),
>  * which would then apply all of the above extensions.
>- *
>+*/
>+
>+/**
>+ * struct xe_user_extension - Base class for defining a chain of extensions
>  */
> struct xe_user_extension {
> 	/**
>@@ -123,7 +151,10 @@ struct xe_user_extension {
> };
>
> /**
>- * struct drm_xe_ext_set_property - XE set property extension
>+ * struct drm_xe_ext_set_property - Generic set property extension
>+ *
>+ * A generic struct that could allow any of the Xe's IOCTL to be extended

IMO looks better in the present tense: s/that could allow/that allows/


other than these nits,


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+ * with a set_property operation.
>  */
> struct drm_xe_ext_set_property {
> 	/** @base: base user extension */
>@@ -294,7 +325,7 @@ struct drm_xe_mem_region {
> 	 * here will always be zero).
> 	 */
> 	__u64 cpu_visible_used;
>-	/** @reserved: MBZ */
>+	/** @reserved: Reserved */
> 	__u64 reserved[6];
> };
>
>@@ -1051,8 +1082,8 @@ struct drm_xe_sync {
> 		__u32 handle;
>
> 		/**
>-		 * @addr: Address of user fence. When sync passed in via exec
>-		 * IOCTL this a GPU address in the VM. When sync passed in via
>+		 * @addr: Address of user fence. When sync is passed in via exec
>+		 * IOCTL this is a GPU address in the VM. When sync passed in via
> 		 * VM bind IOCTL this is a user pointer. In either case, it is
> 		 * the users responsibility that this address is present and
> 		 * mapped when the user fence is signalled. Must be qword
>@@ -1061,7 +1092,10 @@ struct drm_xe_sync {
> 		__u64 addr;
> 	};
>
>-	/** @timeline_value: Timeline point of the sync object */
>+	/**
>+	 * @timeline_value: Input for the timeline sync object. Needs to be
>+	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
>+	 */
> 	__u64 timeline_value;
>
> 	/** @reserved: Reserved */
>-- 
>2.34.1
>
