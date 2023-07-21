Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCAAC001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 18:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D352610E091;
	Fri, 21 Jul 2023 18:12:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70E910E091
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689963148; x=1721499148;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eTQIEyLEyDhavbabYA8zv811i6ZH5JHWwWucdXaSre8=;
 b=P5nDtHRet41bINvuuiNfo07HQPx3DjPpJDzo901mdqBbcRx2KDnlKB7o
 iMYZ6/mmYLLNVQsP9uAsvYsZ6RCBiV59FTjFhzP8Kh1o09J4P8MdlnwZ0
 QxkKNKYbRKxfpDgfenYj20EypsthztrWqh+Ri/NmgDXWJI3YWqdeKETip
 +0147E4my7BtsJSx5sAbYSOGFWogIPh2GCRtH9akM/wVyRu7nFwTVt8mn
 gAO74CYNU7H9MwKFDo6uL6WzTyAr7GPJdjF7A7Axe1yqzU7ZNiVqQTDzh
 ZVy9bdKjVllRDbHTJYG46OWtbaHHO4zhl1Or5Ob+aTUnydRSlev4EJbRK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="357079987"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="357079987"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848904486"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="848904486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 11:12:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:12:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:12:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 11:12:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 11:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHBBjDBmd8dFq6DPI2VmkPLzsLUYlf6Qvzf2AY6QVEOXsUNvQTgLBPLQH9FyKd2vzitVUMxrLp6GfSvIAfftNOg/toyYGf1JcFEw2KibVXdi804ZrUtyssfHvWEN6QcEs8A00oxVK8hIKlCIx1/C8olpoLdez8EuRn2Vo6xe1QLsCrbP/2sWlINljwNJFaPt0Aja/cfz8ntckBfQUi62v4kCeiU7hk9j2AN9E/rNDk/aCqukG0EecbuqdU0BHamOnDrseCNm+2hlLAax3ThNmMb8wl1YXa9rjML6kiWw62OdxtnIBOQYc6PiTC+hk3JdKviOXyD1rkt7pQ5XLe8fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/h1hsFSZj31cvM0kdXe1lwRAP7doTUBAU1Sv+G2chdY=;
 b=ntNbCXWp1nrgfrz/SAZZsRb8wYTqVcsyNc6WnHZCzQCZoCKZX70LJkiUeIJeAPyJVKtgHg7HLjPmu3GuQbQBr93+SUwjDEF7h7+CRRraEqzbeXB80PUzb+iD+z1DyxqkcKdBXXBplFGoDd2qCm5cYi9guqAssc1+3nHWeC+20NrGim83yEHj153JJwe3xddw0lMCJ/pV6c5B1lwL8aHWa/8ur+dqlQH4Q7j0KM9BGtWD22xBPuAt7RX3ntuMZ05jWvHIlyieN00TiGuauKqc6cZqWSMlwO8OlgOzSMumfciRdypsWVpMitTpAdSp9EOOmSVl3IA7tN7KspnI/6X4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7402.namprd11.prod.outlook.com (2603:10b6:208:432::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 18:12:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 18:12:22 +0000
Date: Fri, 21 Jul 2023 11:12:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
Message-ID: <svog2amaxebhhqiqerynvqb7awjrkj2wtdj4uabmrd6u52wkjn@o6yixkupe74e>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
 <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
 <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
 <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
X-ClientProxiedBy: BYAPR07CA0092.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c1787ff-41ee-41bc-2ed9-08db8a160711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4jSsbsEveQKs9YFZ18iLgMxaTOxF2XAW2tD2MfwaN0eMpkCRxCYCQCs6yh8jWpo3ur53JksJwY6PrLF5eEYVsAv6KehYsuhrsveblPjterf2FIA23qVmYSxycs44nBAVTkHBfO+L4Cz9LSROsT5IxF13Wve/gNXx+wvnq66oDCgXn1gHrqLVKqsrFX5tmDKUA0EEvmao2RxetHDOKchoTEKjpk5B0K1bKCMd7kPVVSdY4uyarYxjCNEOhFg63Y6QPuE3ar+ROoJMTxFEibn48o42vFpqgii9dgkta2h+DDJ1cm0sYn6vgfqN72YCTV6GRxUFAo490WUq38HlHum8+Vu7j/nphUOh1bhGXpXQEn2Qt5t671aatt4HeZoTk9HD1wlfMD1CEupOdAtvZcppBd5+C/3tbVOHT6Yt/KNqkjOI2LHUZXO272dsI4V1lCdpwL4hwUwjXbL3WN0p1Wsjh3kcSrqWCBymp+00hU3pGKqTsPKpdPXaPgvwteDIYhCtQGP72G2S+fw3y7n2XWkDPiHrtLNnARpUV8MNET3r3xkqzh6Jo0QnDLJr2tZVjWg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(82960400001)(38100700002)(9686003)(6666004)(6512007)(478600001)(6486002)(26005)(186003)(6506007)(6636002)(66476007)(66556008)(4326008)(316002)(5660300002)(8676002)(8936002)(41300700001)(66946007)(2906002)(33716001)(83380400001)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VVcFgRG4n+3b2U3frbn4O7aQFxiy+ErYZU/yGVEGiamSfQgEW+xlHU14Wy?=
 =?iso-8859-1?Q?O5yn/6aLCL+k1Y+5kCQ34Z3GYZ0Gzgr6vg/urrm9FfPS2ur6xFGxzsCNvY?=
 =?iso-8859-1?Q?zOLwpX5iHkMHvbOoBjIoyYicshr/sut27a9LcRgyP9hC49vd0Lc0wUVPRS?=
 =?iso-8859-1?Q?Iwy+bb205Zdg3JoLypaoqvoKQIfLpkmWyuYdc6M0nMQ63SgNVidq8tMu/a?=
 =?iso-8859-1?Q?UeH+RRp1xJfUQTyczH1OOJGyI9Y9wnxT8Fcv9Hr+bb4KawdVe+uGBw/uGu?=
 =?iso-8859-1?Q?menpOces7SYUS2Y1moeVf0AN6OWdg5pBcvXa6vBJVXOMXOYQK5iZ3DQapt?=
 =?iso-8859-1?Q?pBQUheWL4yrefYPLviPcfcTdYJAjsO5jFRtmb1j9N5TwA92sTGTT8jZtNP?=
 =?iso-8859-1?Q?dMzHS3uay4se4Rsfp/hp1tS3WATZQIaOJl7xhzjtrMwzJNy3N2rVHls2+/?=
 =?iso-8859-1?Q?4VkYlnjPY+5sIxltzMfDg/OBPQJUIsdFmxeyCjeD60j7JcUI2rsgJ/Tcsw?=
 =?iso-8859-1?Q?yzan3SXEAHsuS1GHfTHlGIC/ukTQyQ2waYCGUciSsf/IE3YtnarpvZ7cH0?=
 =?iso-8859-1?Q?93GVD7hlegq9yShVLwIko8dmrdbfUbTuT427ksVyk3NgjeEonAfQUu9vFr?=
 =?iso-8859-1?Q?zztoSAdXIRKl/3uBRkiCpNM0sCOK9n1BoHpmBQ0b8GbbclyVz6W793gcMu?=
 =?iso-8859-1?Q?886dtz+Fa2hJuXhHf14A2BnQn7zDSkmJVr/GVa+/kZK2F9llTNNXLogW5j?=
 =?iso-8859-1?Q?I1KHMkIKKSeURBq+ycXUM4of5vYIMlTCeP698LKw4kfXQ8xtZei4gTvLFx?=
 =?iso-8859-1?Q?TlNGeZVjrV+ApIR+ddec3oQZiZ3WshVuiVx8mnscClV28zcmZhvCzdf851?=
 =?iso-8859-1?Q?jr82nvsP4xHQieyU/6rbnmR5YpwVpXVCsR644U0BkD1wkldsM+wHAsjeLt?=
 =?iso-8859-1?Q?UXj1cxcsx+95SlWtwNWF81M0ZPUnc/P+O6awoln93C2W5Vh0dj6/oxiX1r?=
 =?iso-8859-1?Q?EMkG6At77601tv1e3LHYKo1JnhC8hwrj0480DlWZNQHuUzsA08Ke3XbEcg?=
 =?iso-8859-1?Q?z57uE6tbWKX44DepXCVBuPcSa4eXa2+xAhlyZPcfYbURN1wtFnYLWlthIa?=
 =?iso-8859-1?Q?nTV1ocxnLQq7QJyxrAQA8ItAHVsVx4bRUr4uRy2Vd6CFQtKGVuyrEhkkCW?=
 =?iso-8859-1?Q?fg/fDn+T15yN5M7CzrWTpFBnTA7oYX4h/JYIrQJnnC1+V9fC7cBew26gtU?=
 =?iso-8859-1?Q?HWv35GSrp6FKVBnih5tyWOGbQEzf0ug4LWHvC7uRGque78MaiRsBj+XsRu?=
 =?iso-8859-1?Q?2rwGkqBW0nbJgVBz/q34B6Or5oQSmohd4fYMCPqtdVHJpgOZ6+8PDo7cWo?=
 =?iso-8859-1?Q?vTkOY9PHhjTQqox453U3fMtTNxC26ypbK904RnuFMhzn9kDJtHhB/bk3Ci?=
 =?iso-8859-1?Q?VZK9qwIhQtuTmNM2Jmgi4GjvSfp0CeoMAVOxmYuX+GuTTc+44C6TlmzHjK?=
 =?iso-8859-1?Q?NhSltStfP0gF0pbXhPJQSqeqhsykphZ3IE11i/goSsSM/vwcMk79Xzffh3?=
 =?iso-8859-1?Q?1TR8RpOsJKCr48BqtMROrJ3x7O4RZDWDWdVQO70xsd3FwvY2qX+hvDdKsG?=
 =?iso-8859-1?Q?4yzhT3vZpJWuBX+zF/oxn7nVVyDV2+FvfspzKLVI7oIpQSi+/SMJ4fPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1787ff-41ee-41bc-2ed9-08db8a160711
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 18:12:21.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUMwfS9lT6hcXjqTVEuBxzZSXRY6ofa2LnI47XRmCohLTkrFV+MXe5mrhT884wCJSWTLT5aowInjkcYcoZYS6FWXGCXKA1wN0hFdo+ZOpK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7402
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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

On Fri, Jul 21, 2023 at 10:21:31PM +0530, Vodapalli, Ravi Kumar wrote:
>
>
>On 7/21/2023 9:43 PM, Lucas De Marchi wrote:
>>On Thu, Jul 20, 2023 at 07:48:33PM +0530, Vodapalli, Ravi Kumar wrote:
>>>
>>>
>>>On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
>>>>On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>>>>>On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>>>>>>Different platforms has different PAT encoding in PTE format, add
>>>>>>correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>>>>
>>>>>>Bspec: 45101, 71582
>>>>>>Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>>>>>---
>>>>>> drivers/gpu/drm/xe/xe_pt.c       | 110 
>>>>>>+++++++++++++++++++++++++++----
>>>>>> drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>>>> drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>>>> 3 files changed, 129 insertions(+), 13 deletions(-)
>>>>>> create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>>>>
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>>>>index 00855681c0d5..e7f8bd4dd518 100644
>>>>>>--- a/drivers/gpu/drm/xe/xe_pt.c
>>>>>>+++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>>>@@ -16,6 +16,7 @@
>>>>>> #include "xe_trace.h"
>>>>>> #include "xe_ttm_stolen_mgr.h"
>>>>>> #include "xe_vm.h"
>>>>>>+#include "xe_pte.h"
>>>>>>
>>>>>> struct xe_pt_dir {
>>>>>>     struct xe_pt pt;
>>>>>>@@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>>>>>xe_cache_level cache,
>>>>>>     if (unlikely(vma && xe_vma_is_null(vma)))
>>>>>>         pte |= XE_PTE_NULL;
>>>>>>
>>>>>>-    /* FIXME: I don't think the PPAT handling is correct for MTL */
>>>>>>-
>>>>>>-    switch (cache) {
>>>>>>-    case XE_CACHE_NONE:
>>>>>>-        pte |= PPAT_UNCACHED;
>>>>>>-        break;
>>>>>>-    case XE_CACHE_WT:
>>>>>>-        pte |= PPAT_DISPLAY_ELLC;
>>>>>>-        break;
>>>>>>-    default:
>>>>>>-        pte |= PPAT_CACHED;
>>>>>>-        break;
>>>>>>-    }
>>>>>>+    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>>>>
>>>>>>     if (pt_level == 1)
>>>>>>         pte |= XE_PDE_PS_2M;
>>>>>>@@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct 
>>>>>>xe_tile *tile, struct xe_vm *vm,
>>>>>>     }
>>>>>> }
>>>>>>
>>>>>>+static u64 xelp_pte_encode_pat(u8 pat_index)
>>>>>>+{
>>>>>>+    u64 pte_pat = 0;
>>>>>>+
>>>>>>+    if (pat_index & BIT(0))
>>>>>>+        pte_pat |= BIT(3);
>>>>>>+
>>>>>>+    if (pat_index & BIT(1))
>>>>>>+        pte_pat |= BIT(4);
>>>>>>+
>>>>>>+    if (pat_index & BIT(2))
>>>>>>+        pte_pat |= BIT(7);
>>>>>>+
>>>>>>+    return pte_pat;
>>>>>>+}
>>>>>>+
>>>>>>+static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>+{
>>>>>>+    pte &= ~XELP_PAT_MASK;
>>>>>>+
>>>>>>+    switch (cache) {
>>>>>>+    case XE_CACHE_NONE:
>>>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WT:
>>>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WB:
>>>>>>+        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>>>>>+        break;
>>>>>>+    default:
>>>>>>+        /* pte |= PPAT_CACHED; */
>>>>>>+        break;
>>>>>>+    }
>>>>>>+
>>>>>>+    return pte;
>>>>>>+}
>>>>>>+
>>>>>>+static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>+{
>>>>>>+    pte &= ~XELP_PAT_MASK;
>>>>>>+
>>>>>>+    /* Initially assumed as CLOS0.
>>>>>>+     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>>>>>+     */
>>>>>>+    switch (cache) {
>>>>>>+    case XE_CACHE_NONE:
>>>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WT:
>>>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WB:
>>>>>>+        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>>>>>+        break;
>>>>>>+    default:
>>>>>>+        /* pte |= PPAT_CACHED; */
>>>>>>+        break;
>>>>>>+    }
>>>>>>+
>>>>>>+    return pte;
>>>>>>+}
>>>>>>+
>>>>>>+static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>+{
>>>>>>+    pte &= ~XELP_PAT_MASK;
>>>>>>+
>>>>>>+    /* Initially assumed as Non cohorent mode, correct values
>>>>>>+     * has to be set depending on requirement.
>>>>>>+     */
>>>>>>+    switch (cache) {
>>>>>>+    case XE_CACHE_NONE:
>>>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WT:
>>>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>>>>>+        break;
>>>>>>+    case XE_CACHE_WB:
>>>>>>+        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>>>>>+        break;
>>>>>>+    default:
>>>>>>+        /* pte |= PPAT_CACHED; */
>>>>>>+        break;
>>>>>>+    }
>>>>>>+
>>>>>>+    return pte;
>>>>>>+}
>>>>>>+
>>>>>> /**
>>>>>>  * xe_pt_create() - Create a page-table.
>>>>>>  * @vm: The vm to create for.
>>>>>>@@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm 
>>>>>>*vm, struct xe_tile *tile,
>>>>>>     if (!pt)
>>>>>>         return ERR_PTR(-ENOMEM);
>>>>>>
>>>>>>+    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>>>>>+        vm->pte_encode = __xelpg_pte_encode;
>>>>>>+    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>>>>>+        vm->pte_encode = __xehpc_pte_encode;
>>>>>>+    else
>>>>>>+        vm->pte_encode = __xelp_pte_encode;
>>>>>>+
>>>>>>     bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>>>>                   ttm_bo_type_kernel,
>>>>>>                   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>>>>diff --git a/drivers/gpu/drm/xe/xe_pte.h 
>>>>>>b/drivers/gpu/drm/xe/xe_pte.h
>>>>>>new file mode 100644
>>>>>>index 000000000000..8b3b5b471a99
>>>>>>--- /dev/null
>>>>>>+++ b/drivers/gpu/drm/xe/xe_pte.h
>>>>>
>>>>>s/xe_pte.h/xe_pte_pat.h
>>>>>
>>>>>Just my option prefer this.
>>>>
>>>>dunno, but since we have different pte formats for ggtt and ppgtt, IMO
>>>>it would add to the confusion.
>>>>
>>>>Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
>>>>tables giving the meaning spelled out in the macros here for 
>>>>each index.
>>>>The rest of the code then need to set the bits in the PTE to reference
>>>>those indexes, according to the PTE format.
>>>>
>>>>>
>>>>>>@@ -0,0 +1,31 @@
>>>>>>+/* SPDX-License-Identifier: MIT */
>>>>>>+/*
>>>>>>+ * Copyright © 2021 Intel Corporation
>>>>>>+ */
>>>>>>+
>>>>>>+#ifndef _XE_PTE_H_
>>>>>>+#define _XE_PTE_H_
>>>>>>+
>>>>>>+#define XELP_PAT_MASK                  BIT_ULL(7) | 
>>>>>>BIT_ULL(4) | BIT_ULL(3)
>>>>>>+#define XELP_PAT_WB_CACHE              0
>>>>>>+#define XELP_PAT_WC_CACHE              1
>>>>>>+#define XELP_PAT_WT_CACHE              2
>>>>>>+#define XELP_PAT_UNCACHE               3
>>>>
>>>>example... this duplicates what we have in xe_pat.c (comment added here
>>>>for clarity)
>>>>
>>>>static const u32 tgl_pat_table[] = {
>>>>        [0] = TGL_PAT_WB,
>>>>        [1] = TGL_PAT_WC,
>>>>        [2] = TGL_PAT_WT,
>>>>        [3] = TGL_PAT_UC,
>>>>    // .... those are programmed, but not expected to be used
>>>>        [4] = TGL_PAT_WB,
>>>>        [5] = TGL_PAT_WB,
>>>>        [6] = TGL_PAT_WB,
>>>>        [7] = TGL_PAT_WB,
>>>>};
>>>>
>>>
>>>TGL_PAT_WB maps to PAT table register bit mapping, we cannot 
>>>directly use tgl_pat_table to get PAT index rather we
>>>need to implement code to retrieve the index like below instead we 
>>>can use macro directly.
>>>
>>>xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
>>>{
>>>    u8 index;
>>>    for (i=0, i < 32, i++)
>>>        if (tgl_pat_table[i] == cache_type)
>>
>>no, we don't want the caller to pass the platform-specific value.
>>It should pass a platfrom-agnostic value and xe_pat_get_index()
>>translates that to the platform-specific index. There are just 2 entries
>>really used by the kernel: uc and wb. Then the xe_pat.c returns what is
>>the entry to be used in those cases.
>>
>>Lucas De Marchi
>>
>
>I have discussed Regarding encoding the index into pat pte with Matt,Roper
>He said instead of writing common function for both ppgtt and ggtt, 
>the best approach would be as below so that in future adding more 
>support will be easier
>
>static u64 xelp_pte_encode_pat(u8 pat_index)
>{
>    u64 pte_pat = 0;
>
>    if (pat_index & BIT(0))
>        pte_pat |= BIT(3);
>
>    if (pat_index & BIT(1))
>        pte_pat |= BIT(4);
>
>    if (pat_index & BIT(2))
>        pte_pat |= BIT(7);
>
>    return pte_pat;
>}

that is fine. My point is that selecting the *index* and the encoding
are 2 different things. Here it's only doing a index -> pte, which is
fine: there will be one for ppgtt and another for ggtt. However gettting
the platform-specific index is shared. Check again the snippet I shared
previously:

	// this is valid for both ppgtt and ggtt
	pat = xe_pat_get_index(xe, cache);

	// this changes between ggtt / ppgtt
	pte |= vm->pte_encode_pat(xe, pat);


pte_encode_pat() is the hook set during init to xelp_pte_encode_pat(),
for this platform.  The index  however is obtained in the call above.

Lucas De Marchi
