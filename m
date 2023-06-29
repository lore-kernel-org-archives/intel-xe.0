Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDBEB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 03:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0F810E021;
	Thu, 29 Jun 2023 03:50:13 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC0E10E021
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688010611; x=1719546611;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0s0ebUs4vrk18y7Vm8AS17rCUYCkdS15+iVK8gwNcgo=;
 b=gJn8WvcYAqR1hn7Mxf9O5OOI5g4a1dy5loyOOjcoxbGx2IzlMWAtKKkt
 IAIiHUeBY4w0yln0ZdeSh6Qkh42UxFxxB6PbQ3Zt5dH4x6wL1uek1mx9f
 mcEjUGpsBoPL64wBmoaYBphCe7R3PoSGfyuuntpjyUVESM0nXYFPEWFRT
 /2mcXj7TGANt/sxDdq86KZq1BqrauNyanAkkQrlpq6EcbPDmsvw6vqhnR
 XZ03sg8kKaFH2ENeMS666sxwGLKAP5CM5cqgmUkDvyogpVqCNjGkJahKb
 1dFHTsvek4h7bzR/eR2eRcokz6eJVfcofXMlu3YjJOiQIjzguEt+1aXmF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392737830"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="392737830"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 20:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711273279"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; d="scan'208";a="711273279"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 28 Jun 2023 20:50:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 20:50:09 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 20:50:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 20:50:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 20:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5jtgx5TEHSmINZtzPmqT1+1023hqLjtb0cQ7zECaYTZuWatVvDdsLu0TzzISyQ8UKLBwJM5aYmBzztjatx5IdPByBcpYVtDo/4KB0vOd94Vo9xFXaMqZGi4qLo+T97TybuxJ8h8VEnF4sVqbYVdvLko02V+5kujCrMKa4vsUAi3/Ld3AanGvOZVh39JiJyG56prb68ciXx0f3zpuxlAE9nTzsLEO+6Ii7J2XfsrfnATOl3buhNnLBNA4xPfRJkKX/AKaJEot0Q9umNTETCkCrACPr617p9jOyf8Qr+yxuJSn4UviAY248vms4SQeGSMGGMik8PXES9roPB+J8dSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isa2+OkvyB/JLZRP1Z8GZHCrn4zKs9gyviPW7Zp1a+A=;
 b=NR/0R/HK6E3HCdVy0CQT2mYjpkQ/XIhCn5vhSLXUeDoCYTCMS+r4J9iFaH+XfX1O/6ftspYAMwEDWDyk4zs5Eq6KX33eHfpEtD355WOO+sQfiYRk8arJv50UpR1PEoG2yNC9QbCZuSu6walr5YkXxm2Fdt3IS/P+puzwx9NPEFotKMb2K4L5Nk+H12BkArBnkbFTczvTQPxugLwWeIB3XwAY5VmUb2Usn9vb5eeb0/5vvSNaVp1+VovoRgyRBYCfnYeOzXVcefLYpdVAqTJqU3v07plQLfl29fl8NkuWQOs0B5629/5C8fuT4mONDfsyfUsNLo4kTk/NLg8r5b7hFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 03:50:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 03:50:00 +0000
Date: Thu, 29 Jun 2023 00:49:55 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <6d4wfky7aldka4dwji45m45kkvtsxaywqbqprigmzje65agtf5@xlhhvrbme3dz>
X-Patchwork-Hint: comment
References: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230627222856.3165647-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: d28e9af6-7800-40f5-5669-08db7853e9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E6Iy0QAEhy25h4AdY/mBBA+d1Hzuc6C7BLTFWu3iYaHNgwSWzkRvLNDCfdIYkSKnmA3YToYY2ffh4aajCiLOL55YmGjrxudesNaiu2oyL46wjf6m3GLJa6RhL5dW0sKjhkDjuuhi/SE/QRjiyvXODSQY1ZjXegh3tlslttbf0IUIpeSJaGy/WkEfEKF8smCKO4HP0aWFitaCRJ2TelFN+hpn3KufzrhvQsNEt25zq0sjDfSthfriVG1sbtdyqBgjbuvlCYMmjAsZq4kydy2zKUAvIl419IiTPmofpAnM1NPtHMk2LnI+fRxRUuXJT4+9TXhd+8uZaiQUpusZgjw+Ap6IzpN+kFLAZ6jtvf/2z2Y0W/GaspnC9eG7MxaK1Il1jjiPihWfcfpwZS5nboNK2DmvxRksvmc1uDzgCRovWMeAv64WawpmCPqTl3/NVxu3JiaItvoxzZ4D8xi2b1+iC2CC7rz5uPW86e7WoU+zTHx+JAUQwbuK++Wrf1WCqBmqsVbwPZuoKY1yIWVoohCMRZS8D7frstScEd/9RUQxG8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(66556008)(6506007)(66476007)(6862004)(86362001)(5660300002)(316002)(4326008)(41300700001)(38100700002)(8936002)(33716001)(66946007)(82960400001)(6636002)(8676002)(966005)(6486002)(6512007)(2906002)(9686003)(478600001)(186003)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8S/eKJxcdKbiVkQ74zIfNTqpvDn8PjwXGRSLY3PfUb03Nm+wxi5YxVOlZ12f?=
 =?us-ascii?Q?JdtWZXrgh14AVGwii575HojhPdQ7I0Rm2yMFrfE70jUgAwzdOIc2KD1I96Tl?=
 =?us-ascii?Q?bOf9UXHAHRvSkUx0x175Mxpw2as9G1HcfDeO7aO2y+HC2GPfiy3mJwjywnoQ?=
 =?us-ascii?Q?Xeq8eQZ9Si40yZxVJXhT4TlYLq8+P95lpTtw+4QibwmzVlPDSPOZ1IQyc49a?=
 =?us-ascii?Q?sRMBzopqNdgGxQURodl6KzE6F83jEXtFn29WtaFTou47jTqpDd4+05JQHjw5?=
 =?us-ascii?Q?lAKqRNdXbwwgKsgKGbcPYvSVcBy0fMHL2y+apNx901WxIlXczru1L1MiBLWI?=
 =?us-ascii?Q?dDhXjt0IT3TJ/UdBEaP2aB+LFfmuAPj14kpgB2vlNNbMvUEHtztZC63et3+c?=
 =?us-ascii?Q?9fHIbJFXjV3l958oGvD5FL3YnM61OLNx0YL8pwmZk2quRzrwyF382uJ0S96x?=
 =?us-ascii?Q?/DLtMp6UJxXWubeatnFnH1Ii0gOIrEr850fszguomDZR2MgkbzAIwIoAOZnp?=
 =?us-ascii?Q?d+w7D2Ev/n+bVfMbREUY7xsOZyemP6ul2lfAyXVfKuTF8YZf4oNa5tLYPoaU?=
 =?us-ascii?Q?oo/Ar3KWjpzynO46WfF+7zn01ahTtbGQg23M0YPL80S3xZrq2ZTcivAQcF7J?=
 =?us-ascii?Q?Qb0SVuIA1ZOv2xxlwbSWznulaS3ayWhZ+vTinu2xP409NuCtGaNTPcH0CSDR?=
 =?us-ascii?Q?82SN3bQ0RAkhxXLXhC/0JDU8ERt0LnV/s8erAs37nyvwrvDbBCyzfocJrxay?=
 =?us-ascii?Q?zYnMIuXcgCTdPYjVIpRTjxDqymlKM3w8W5yl7L6omT04xZVkqyecoCh7x+Dh?=
 =?us-ascii?Q?x6cGsj98s0fK+am8TRbMKfBmWJxF8L4e4uo8Cl5Kw7L1yeQliYym6vJVvAX6?=
 =?us-ascii?Q?p0+Z96HsTa9Z6q94cuHgiZba4aybi4+AKHwfgC7WScSwmWMGBP39U7EgvMso?=
 =?us-ascii?Q?2SX9QrPjOfXpuSlKxQszRfVL7QdEvLtfQcdeNM4xMTBTThw8r1aAAgk8LTDW?=
 =?us-ascii?Q?5XYUm0jM+Yn5lS1XCZ1rI+5iza8E3Cm+YuTikvYFkyhxocr5wTWLVCxdZVtH?=
 =?us-ascii?Q?2AN2P2+8l6LNqKrMyyPYNu2WxtpElozrbK/m+T3hCCySwKWgeFUwlXKS+ct1?=
 =?us-ascii?Q?0kHlabR65fGpyYdU3ApuSMrAe+OlKEF3+KL39ijskANhqdnG5jFz1XfRDuVW?=
 =?us-ascii?Q?AEOjRgEymu7DzC413rwr4U8Sfcj7rWb8ZRUt+CARifU/k0cb6Qhy/iBS2xoh?=
 =?us-ascii?Q?YYh7DUqX9Csu87RZ89qEFGEFIEBhPFU0HRtPnZbIR1QcMxM3RDcFdGuw02Qo?=
 =?us-ascii?Q?29nXc/sOHJ4eQ1DLyWDIDRhNXzZWqfJzU+fd5MNfMlKflRYujq6dsmh36xwJ?=
 =?us-ascii?Q?lxecOHB/JvQWsedNUnfhFpWLg093zf9Q+RHIxJhIgaAVIxZpZkY87TPHGgkq?=
 =?us-ascii?Q?xP5m6bAgaR6RrT7gnCZDQYEkUW2849JtFwr3WnQ+vyAMQujOomqC1wvWKpyK?=
 =?us-ascii?Q?V3NqugchRClRH0MWwQ7VO18Qtk3tSX9rj3HfgYwlF4yAVslxYGXw0AeGkrGX?=
 =?us-ascii?Q?uyB8D2O9PnA9/DgzRBlnlFdAjp4YL6M4q2+ZgRXciYqt0mI9U8wNjK4o5aQj?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d28e9af6-7800-40f5-5669-08db7853e9de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 03:50:00.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak/SfC+raUMngJNZBVt5Ny/+h87L+5pe0kQ3P5sFI+dNOGEpd7lsBe5F5Bc0/xxWGjJ21hSbEcrbMktbTLlPysckSUkYPy4tq7gQXzymAGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
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

On Tue, Jun 27, 2023 at 03:28:56PM -0700, Daniele Ceraolo Spurio wrote:
>The firmware definitions must be ordered based on platform, from newer
>to older, which means that the DG1 FW must come before the ADL one.
>
>References: https://gitlab.freedesktop.org/drm/intel/-/issues/8699

humn... how is that going to fix that?? Also "from newer to older" means
the value follows enum xe_platform

/*                                                                               
  * Keep this in graphics version based order and chronological order within a    
  * version                                                                       
  */                                                                              
enum xe_platform {                                                               
         XE_PLATFORM_UNINITIALIZED = 0,                                           
         XE_TIGERLAKE,                                                            
         XE_ROCKETLAKE,                                                           
         XE_ALDERLAKE_S,                                                          
         XE_ALDERLAKE_P,                                                          
         XE_ALDERLAKE_N,                                                          
         XE_DG1,                                                                  
         XE_DG2,                                                                  
         XE_PVC,                                                                  
         XE_METEORLAKE,                                                           
};

Since DG1 is 12.1, it was decided to leave it after ADL.

Note that all of this in xe is currently just a convention, not a
requirement.

also very weird to have xe_huc_copy running on drm-tip if xe driver is
not merged in drm-tip.

Lucas De Marchi

>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index b05038921e02..1aa9a4925574 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -111,9 +111,9 @@ struct fw_blobs_by_type {
> 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
>+	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
> 	fw_def(ALDERLAKE_P,	no_ver(i915,	huc,	tgl))			\
> 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
>-	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
> 	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
> 	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
>
>-- 
>2.41.0
>
