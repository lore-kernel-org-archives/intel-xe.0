Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733CEC48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 05:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368010E3EB;
	Thu, 22 Feb 2024 05:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ig9IsrK6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810EF10E3EB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 05:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708580991; x=1740116991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T/cWa+3u4z2rWhPBYS6ghYi6975pzWApfJIRN2SEmhE=;
 b=Ig9IsrK6sDuJqjaLOkIEnSBTHQhq8+nZc8tLjUh0p287IkRZyqk+g3gx
 UpRhbIeoxTT07OvPDUiyO3vQkiIkcbN+u+U1ozs2iq+U1XmAdtdFT6GZy
 xQRs89p3btrRJdTnfAOdvLS2aoObD8tjhvQYCgD0l2lWOxHxhCY2GelfS
 Abp01Mk2LHmIW0ZcvWYxr/GyLNnZR8x/6WBl88sOcAdpl4MyUSYq1FSdc
 RBOFOZeHzEZMcgnQmTOTNeCVgApjB1oMLBkdahI/dvw8/K26mWMxEK9oW
 tEzLZ/PQYLhJPDs/o53qyw0FQQZe2AFMnshDSGsk/hMftcwLkGIFW+Sdv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="3276643"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="3276643"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 21:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827491039"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="827491039"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 21:49:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 21:49:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 21:49:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 21:49:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 21:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVatfCD3PodZ466WiPf9wahdbUyhuVOy6Mpqy+urFfe7LmYUvoV5Gd6QeMIhfEYkXWHEZl0vJPWujQ3y67JVWHT7nueSH0954ulcItd3Qy+sjGsCLCLH9dyZASMXzh0dZiJQXPRhUAG4txuBxqCGhZpE3+td3mgjg87ybj7b9vE075797zQlsmozLVIlxEyWirIohCwwg8UN32Nhr2QKDd9c6WUDFiaY4/4HaXVMukw3sH9vYyjLTzt7aRNsQ0HK2vT++UG0Ul6pkiRBmX4MbSZ5C5dXVBeqe6gZwTDnIwfwG+K1yksAc4muJiSSwVUchXmfh81oxkSU0UlaBFzUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5KYiQAOMBiqbLeB2hXaznzzQdLQGpo+OR1vlyJKKTM=;
 b=ZyvvT0jl8wcu09lWyI2seyqsTrHh9u/jSDI/lyXNPl0duRMQYequYkAYCw7RGv2GrOL5t4Yo6Ekepwu6Ib8fTvLB3drJm4e8h+UCQU2lTh3r1ltsEjZp9t7YfqOdlftn8Wq9Ptf8fBGn3hGyRGa6LHRKulUqJwJTykprn6GI1FWMRQTkEeYRpg+8DWLDWe/8pFF5SO+Z9sLbDgeOc3qcAjHl6uGb5+PDYPvD7kOhdWdWMMbydOixoK2hOflfNPGr1ba6FqXN1f1YgSlo+PP1Hn9/CNvCDUocjGeVWui7HFIzPvxMby8FK7lvW6rITQHLpoUP/TDg/kgURGqECqDEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 05:49:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 05:49:18 +0000
Date: Wed, 21 Feb 2024 23:49:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH v2] drm/xe: replace 'grouped target' in Makefile with
 pattern rule
Message-ID: <oq6jinj6fobwbqtoe5mhq3uebcqim7rc6u37tvj27j4oaqjmfk@5wzgbsobqtiz>
References: <20240221095556.1635644-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240221095556.1635644-1-dhirschfeld@habana.ai>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 890947e2-7b0d-4bff-b237-08dc336a024a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+XoitbEw/MV2jhcwj8BIkMBzt7qdY0H9pYvS2cqjMTFWsyaC0/hZ1IBTOFzgl4Yoeh5Rcy2oIzZN/W0KhtA6AeqohQmMx4ldo1QpdRqgq7P7UV+Vk3CoVUXXYNit+1UBOnSrMjTOeWLdQ3PfmeULmpciFtFPjkGCOsX8wRyxoTXbxeL/wcX2sXMBUk3RiWbwqXXmyYwSIuOj9PEJe+FNzpJfPzXcJO7+o09gX3aCu8Q7K8G7x9HdnEztsKmh59z2OHnIQtZoB/XgV/00GzlkdOcQXuXlAf49yFNJMO/uhDf4hVbkcoWmrK0WuBYVE64dbfIKSy3xXVm67KrcfmV6nl/AUOUjUXRcB9A+RB48q0h7IsH4c/fNQxV8AB3rDJr9GT/joZkPFHPkpKGXoxemFwQUugfmGk1Zq7geMkoATxbG4Fbw7Kqxy09pGKnxYcoZVYL30hxk19kVSoEGTCZg3vKAxOqAEDilHiUtvsMYPKb6OTFeNEWjxWUzv4PCu3901rOLv1hkP/rz2pXZnOyew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+CVGOtbtaOv/+8yf18q4O8dSYrzdWsfdnZOuF37dIAY/ri0roKWUfWfR11t?=
 =?us-ascii?Q?dSPykFHpXqsm2GqbsMCb847zynb0jN+2zuAxfFdDzjvj4yme/5WtFlo2JlMX?=
 =?us-ascii?Q?oYxCr66bSIZXItNpdn6rDpuaO+Ci5BZMen9TZSfuzGwxqPlqTQ8AZqBX7cQM?=
 =?us-ascii?Q?dD4ACXmaaK6fsHp7sy1oR06vaTxtOJdFvNmzUedwXAkz4ZkDe1aX18v38B1M?=
 =?us-ascii?Q?R5+LNkpsJPc47pQh5X240HnTq35U06DaaxT/zN2dWF6WIO81NMa8brqM34F/?=
 =?us-ascii?Q?q35IJrwXFjLK4LNb7QcPoRa/sK9K/BWUDs7IOu+fYpKp3ZS49SaNjffzKi7C?=
 =?us-ascii?Q?jUSQrSyfLbHDjfK/uJCHiEH1kk29C4ZugPjuzBwEevHv6EtMhuaZ0cFzho+8?=
 =?us-ascii?Q?K9Sr1lSjTzXd1goQLtmSlvqHbSNcAgToCe/jg+fjdLgBB0WPIAd6jOgh9LR/?=
 =?us-ascii?Q?jRuonF2wA6ickZtSSe6rPZO2hAtDaKAYp2js1W4dah+f3xKw5R+YUPTv3IpW?=
 =?us-ascii?Q?kGlu8BGevGafFcdsTrzvBVGPe4SxFtWmq5ckuKB2OhkK5QUuI+LxxrXP7QI2?=
 =?us-ascii?Q?As3Id/TOeGjeRPXnrWmM5rokQwtDgRkYexRT6b1c/aQNwq8LIb12ckO57u9E?=
 =?us-ascii?Q?Zedmr9fVbZVNiDZ3Q3aphR3i4n+YfhBVdoIs1qAlpbB/6nfwiQkeN3vzGm6T?=
 =?us-ascii?Q?ErA9ovzI0V7165Y/A1cLb7YWkmta1Wt+IrHoI56bsetWVGWLfiZ+QaaIeBY9?=
 =?us-ascii?Q?Cfwasv6qkKTAIXPhlQeVEn0IX2al6OeqFX2O0G7YIb9gZI03jTN8oW644SNk?=
 =?us-ascii?Q?rrzwdPJwbE9V7qNdWfOzPqDc6NDiUIhssA3mfXHe2wGm9xg93yEbGuU/ke+m?=
 =?us-ascii?Q?lYBvaUaT+8m1YZmp1l56ulHSgMGVwUt4ZfslvdXdrDFDqtFzAAw1UCd1V0MU?=
 =?us-ascii?Q?Hjy3uSkI8Vt/t5lUHq7hD3YUziUhv0Bqv1ee5CQ1/BiuE3GRcqvv3FkWc84o?=
 =?us-ascii?Q?76rzq7v9d/iLqN52pGrD56JvsZglgW1N1MHXG2lx2Fx5BX1EJBMJtWkxAjwQ?=
 =?us-ascii?Q?Ad2f5K8nmPrFK4WxxYOsbiMAMIzPb2Ip+C2j3YDXP/yjDgQJlLlWl5QuUZam?=
 =?us-ascii?Q?pnJH7jR6Gi/C4N0q6gn6vZD2XM4u186lPsrsmb6iGBPe7wh6HF01osTHIUjs?=
 =?us-ascii?Q?TbItt0xAH4Qf2oqm6GrNAEKEJZZ2XT3C+/4lJIfHjRJwzHrpZq7uyDXX6yvX?=
 =?us-ascii?Q?cSr4FRwERuVLQM/UeGoRjeFaz/r0PIa0V/GBCLDgbgQdI5AC9j87NAfWSfWS?=
 =?us-ascii?Q?DBXPfRYtu7ZMbDzAmC2eLKXCivWr/U6Qfek8sGU89WiyxLFtwnv3czv3fEdr?=
 =?us-ascii?Q?dUSlGoYlQrvK29M0MbTLk9tYM0lprFere+LUIoI2vyk6dok4XEjIzI/sLx5i?=
 =?us-ascii?Q?3eo8SyAddTRurpDzrizf3XZM8qSIEieaIr/otfTQsFzlOMs8pQRSX5Iooo2e?=
 =?us-ascii?Q?x2wuouvja/tJSarLxyXjv0GP0bn+wKg53BulKXxZuK9E8CDgkOtNtu+xEYJW?=
 =?us-ascii?Q?oi7lermEr6NQL+2rGNej4h3FCUqsb13jfjEMelMicCVy1pY86hF4Eg6XbpQx?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 890947e2-7b0d-4bff-b237-08dc336a024a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 05:49:17.9969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HNh6taM8oFyk5g9Gr5cfjnHajiiHtY3+ldeCatpSfmkX3xtIwcOLLHDhGLg6QIdQ0KrRk9Gpdh5S6nV9PIJMGKUV7P7KvUF2V0mk3T9wpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
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

On Wed, Feb 21, 2024 at 11:55:56AM +0200, Dafna Hirschfeld wrote:
>Since 'grouped target' is used only in 'make' 4.3, it should
>be avoided. Replace it with 'multi-target pattern rule' which
>has the same behavior.
>
>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>---
>v2 changes: instead of removing 'grouped target' we replace it with pattern-rule
>here is v1: https://lore.kernel.org/intel-xe/20240219135845.1463992-1-dhirschfeld@habana.ai/
>
> drivers/gpu/drm/xe/Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index c531210695db..64903841fbd4 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
> quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
>
>-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>+$(obj)/generated/%.c $(obj)/generated/%.h:  $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules

that means we can only ever have generated files for xe_wa_oob and
nothing else (or we would have to change this line too.

did you see any issue with the line I suggested?

Lucas De Marchi

> 	$(call cmd,wa_oob)
>
> uses_generated_oob := \
>-- 
>2.34.1
>
