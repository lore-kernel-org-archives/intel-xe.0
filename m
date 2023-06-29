Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87CDEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 04:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F70410E021;
	Thu, 29 Jun 2023 04:15:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C629410E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 04:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688012128; x=1719548128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZFt0P8fOLGd9V8JfUaqvGvFSLnCWd/xUtwKAMKUm11M=;
 b=VPHjxOedG1TM3VYVfKrUEqxkL3nSiOquXraacOv9dtlHdBI4ZpBI5qo6
 ZwjIYCtDY8shgd+5eFBqejjR0OuBHVu1j8W3uVocDGRgAbfC2FaGIoWWd
 zcyneCeEvij/rfeCu4O3NlZ24yIItPbEdxRRsj2eFLOsuFLq1nL27aW3X
 ivPRKr3xSCrcFungr7mDEVDa3roHowEXKnMbtHBQ7G9Mdi+CQVB7t6o14
 awrncGxq1wzdub5mhGz8FIe6q/515ShvofchEbkzk9pgtWQ4ehi2nD47/
 UqZW9CrhZKDPqGzh7pmZnDAFMg3KJ/lYnnlTjarNvy/+Hvo36liDSZ+zP w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362056108"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="362056108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 21:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="720426330"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="720426330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 28 Jun 2023 21:15:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:15:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 21:15:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 21:15:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 21:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq8Tg75dv3K8ffdolgAQ36+qkT3SalLpSc2xIX3GdHW6OShCoHKdfS2cfcDr9tZl+kTxk4t/pXYxh+3DGXKwAMNjueN2elbVA2lPo1XxnwoyCDFFfoJnqTtz6XRxmzof8FQu04BHJpT2jpyXJfowEDOcJotQ+nLcOEO/K0KLPa0LciqdA93YJgNcWWmmhJqtLeQ+nx9vMxLyZY0dkmYm7pcFwqHkFm0W0EM3QtG/+Gt5eYFimgYWn+jWN6I8eazHI3fW89HMIdCM+ywal2wPIjz8RQAbhHSvanUDHfnPVsm85nbVBRGrnt76KCUekaT4igwY9d3EK1qm1hikWHNn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Gjd5GVSUgrOc6zN0PIlRsu/irUer+Zb8B1MULgJ9Vo=;
 b=nv5rZsOyu1aEU8dSsrloovlMZSt9yIM75xqLBSHwh3susVwiTC8MzQb/A7p5xQYcAnh8oc1FoP1pWok7X2vuOUmxKDsDhM9oVk3aPtsBqE8n66cqx2AVJfBp1t/a7uUeEDxNnPPB94HibNzR4yB4GgQN9tpGbuR+rcVDsH9OcDefoDzJIRv67NcR4h3ls2LxrqpTVR4QH/yQmtb8U0t3/ige0+QaB/jzhHinTdXDcVeIF6cDWNfHV/buT+73nqFa39C0LulNpVAPFUVK4ybPLhISlzdtQlfUffr5fbsnPQiwHO6bhvUkTrlsOjhpnaNd6nH8UQY+3+HESrtYwGCbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6300.namprd11.prod.outlook.com (2603:10b6:a03:455::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 04:15:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 04:15:17 +0000
Date: Thu, 29 Jun 2023 01:15:10 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <hz2ks45ntg34x2bsnmy7ax2fqjli2xmvzihbzs2lbsz2k26zqq@k7bajl5viljf>
X-Patchwork-Hint: comment
References: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
 <6d4wfky7aldka4dwji45m45kkvtsxaywqbqprigmzje65agtf5@xlhhvrbme3dz>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6d4wfky7aldka4dwji45m45kkvtsxaywqbqprigmzje65agtf5@xlhhvrbme3dz>
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: c55183de-7136-4c46-e988-08db785771d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AopTG359lopJrXC9wGhS3L4YLWK9stonopruX3lQTaOZP6+3C2nJtFQWyTziFfv/CeQOh8POGNNVscFhFLsdI9cTVDN1xWfB/L+zXvKQJxOotB0vW6zHzgEua24ZTs2lJ+ClZtJ93WBdPv2nKuNsWvVUAx2rHiITXqCboVLM6OThi4YQgawH3Ggx8UOEk09F9Y9kicEzvyFNsfA9Xf8x98u4WhuSzrFvS9YwYIYlnCWyYMY5U6I30YIsgqCo6LerNXDAb+xZCPBLpA+9GVhO4JssK/ss+GMxr32hoURqpziNqc4AUPpVhaghAC8iniSGtYqYBknj5C8iS7SJONLEpY4EMmc3tpMpMAFb3w4mj8t+/LesbnFXNwAGWHiQSP7+4F9bVqXipDmcekbvRL9DlsR+SEdZVXRqTC4DL+4gkLeaQaQPHhWEZuDvsocR03JvY9vik1EwQYJ8cRs8oIyjEduWc6GPiFjrhduCP11H14eUUF9GlroCFXlCBn+AY1QxbjeKRI6kW/oZ24XW9zWTtdgB8BTMjUhW289+viyRhBjGgUCTMuVr3cH52ZDxHvxB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(6512007)(9686003)(26005)(66556008)(66476007)(4326008)(66946007)(6862004)(33716001)(86362001)(8936002)(41300700001)(316002)(8676002)(6636002)(82960400001)(5660300002)(38100700002)(966005)(6506007)(6486002)(186003)(2906002)(6666004)(83380400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ef6d1tflbu7XtGPTMdsfAr4LEAuMm5l9JdO8VSGhWXo3sbCvRavoHMIa0gFn?=
 =?us-ascii?Q?h1hj8WGA+lD52dbOWTwv17yJnGgFNZC4MMm/ZAEoNd4MnWjOTyYy8/G4kpR3?=
 =?us-ascii?Q?F1rR3sZT6LV3Tx5U3jA4jsJmEDN36E86rnPnRotWEmSX/S1Rsg5PtcasBWA9?=
 =?us-ascii?Q?6QcyFVNOQzKRxp/DsoHnYj6guj/5TcJxshqpxsHpYR+eN6NjMj63WkcFPKfJ?=
 =?us-ascii?Q?visOts2r8lKQU1i7cNM7HtRs9kqXMo2aRBKcIKN9CrQqijONynv+sd+k+tq9?=
 =?us-ascii?Q?6hGdH8pIORgQXIDnOkkHd/elSLlRySX9YyW8LeQYrwMyIsNNJATu3OTZDbcn?=
 =?us-ascii?Q?9N14pG1j2prmjL5FWscLNnVsmrc/JIHz6ru6a+MvFv4rrug0H/NgYDfgVqIZ?=
 =?us-ascii?Q?iwBC2kzH3WoHn0CKimxgMnIsW2T9Kpnm0nPPq9BzxfnZ48jO6FWtAglcWvBq?=
 =?us-ascii?Q?y/HA/x0R08VntCW5wOBj3Apkzdbnn4joor9owZz5Benv117jtI4Hsqvh3022?=
 =?us-ascii?Q?dq+s+mmVBWEuIz9M8EfWVbiQLBztBUkOXmJmjn8Enc+XOmvad4jbB+/Rt+hw?=
 =?us-ascii?Q?mOm/jBHs1bggr3/X1YfDWi0okKApjpRwrwIzYUgKa3YVfSkEP3QVgYMWg1b/?=
 =?us-ascii?Q?JBmfMhq8p1d4M6nBdU8F1lmV2q7krsarM8KogOkyyMGYmOW1PHd86OWLxKU4?=
 =?us-ascii?Q?t4c46slmWIid9uSMioxSCZ0In23/TU8krs6P/jrf3ImXDWjso4mHHykuK23Y?=
 =?us-ascii?Q?b7Xx7ycnCikmxCGVS09ScgJTAWEJnV8ozlhaVhp+FE4FvP1UzCqfbMxuEFjA?=
 =?us-ascii?Q?P5JUA49ofhWjDahhkwbj8y1UYPaIcQLSX+d3Z2bOAFDTDcXkJ9RsaM7IrGI8?=
 =?us-ascii?Q?KNTurgkjj+IdmC1MyZQvHKSr1TJKnlrVtVj/jplI39NHIG269Dji2fytavya?=
 =?us-ascii?Q?72a9GbY+k9rxA2GpT6F/I8Xa3Icd55xZLkAs2J96OMptf0AWY4cBOZRnbthx?=
 =?us-ascii?Q?rKlfWIXFyfiGPJlK77m9D7i9yttyiBYP2pOfIuPD3Civ9WQdlzu3waTUpErB?=
 =?us-ascii?Q?8O7CVLQWIvPKSnDpqoa92Wwl0988RfmPCePJraej5EAnY6NRBJv1hr94XbI2?=
 =?us-ascii?Q?U6+2pFJjTYHmQwKMTl5t03VAX6fnD5WJchMuSy3NEpy818bCeioWtQocu/eq?=
 =?us-ascii?Q?oUqOdP1phW3CiWbOMIWFiYkY6mOIr66ahVooDaZ+TEPPvASMkNnWFv43If5Q?=
 =?us-ascii?Q?8f6CsrF4p+PwPZ/wAUKwO4wO/JS+3vyPkpC2z8B/qNwYnKGYo8YLHqeDsPRo?=
 =?us-ascii?Q?oaTqXN80SyIa6FI5UjiPW91EobrF2JPVoRtJvkDC9mnD+3O66jyiubNtsW08?=
 =?us-ascii?Q?q5789lqMzoXV7FLL4jq//PzBjSnJqV5tDLHg0vXdJJCNjjHJuPtSGylctnfP?=
 =?us-ascii?Q?J9izt2t0PN0f3giSQKx4u71FwrYe5CZFIucD15NFcbrU2f/AGO7wGzxIe5i5?=
 =?us-ascii?Q?u2oh+xSvEmFbDSs1ryr9FRt3QwVfexF1sQJkLfrJ+UAzg24GntgkQXnh/sIw?=
 =?us-ascii?Q?jRjmUIVgPqL/AF75Ev0eInruYCRjYafm8Ai5MOc2yDl9EYKFANJh4q6vpeVC?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c55183de-7136-4c46-e988-08db785771d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 04:15:17.4350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1lAbam22/LeFvrmHaOcuPpkTpGhGVqQtczaaHRrH6YpjnvEm4+69QJN5DMIEqlFTaH9wFpo6ViaQHbmRS/sFejcutQeE82gmpHz7xs76KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6300
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix HuC FW ordering for DG1
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

On Thu, Jun 29, 2023 at 12:49:55AM -0300, Lucas De Marchi wrote:
>On Tue, Jun 27, 2023 at 03:28:56PM -0700, Daniele Ceraolo Spurio wrote:
>>The firmware definitions must be ordered based on platform, from newer
>>to older, which means that the DG1 FW must come before the ADL one.
>>
>>References: https://gitlab.freedesktop.org/drm/intel/-/issues/8699
>
>humn... how is that going to fix that?? Also "from newer to older" means
>the value follows enum xe_platform
>
>/*                                                                                
>* Keep this in graphics version based order and chronological order 
>within a     * version                                                                        
>*/                                                                              
>enum xe_platform {                                                                       
>XE_PLATFORM_UNINITIALIZED = 0,                                                   
>XE_TIGERLAKE,                                                                    
>XE_ROCKETLAKE,                                                                   
>XE_ALDERLAKE_S,                                                                  
>XE_ALDERLAKE_P,                                                                  
>XE_ALDERLAKE_N,                                                                  
>XE_DG1,                                                                          
>XE_DG2,                                                                          
>XE_PVC,                                                                          
>XE_METEORLAKE,                                                           
>};
>
>Since DG1 is 12.1, it was decided to leave it after ADL.
>
>Note that all of this in xe is currently just a convention, not a
>requirement.

well... I misread the diff, it's actually making it the right order,
which is the inverse of the one above, so looks good.

>
>also very weird to have xe_huc_copy running on drm-tip if xe driver is
>not merged in drm-tip.

even though the link is to drm-tip/, it's actually the xe driver indeed:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9200/bat-dg1-8/boot0.txt
<5>[    0.000000] Linux version 6.3.0-xe (root@fd52a587a960) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #1 SMP PREEMPT_DYNAMIC Fri Jun 16 21:26:39 UTC 2023

So everything here looks good. Sorry for the noise.

Lucas De Marchi

>
>Lucas De Marchi
>
>>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>>index b05038921e02..1aa9a4925574 100644
>>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>@@ -111,9 +111,9 @@ struct fw_blobs_by_type {
>>	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>>
>>#define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
>>+	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>>	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
>>	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
>>-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
>>	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
>>	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>>
>>-- 
>>2.41.0
>>
