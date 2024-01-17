Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A96C47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 07:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF810E57E;
	Wed, 17 Jan 2024 07:48:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9128610E57E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705477708; x=1737013708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/w00FIKOupuBPSzcJ/Xoc3v3QflAbWO6SpuCY77DPWM=;
 b=ZnjmP//oMpPhyZqxinRLs3Jp6p2c5Bzd3PXCv9vCWuiQvKlIKYuwxrzO
 l8TjLtvv1h/wjSVeGaoUOilicb9n+v0OjxP48EbhiIT5CFMzyC3npa9ec
 3unz0+1n1//IW8avi1sYNVf0wDDDdppxA82htCoE0WUzReZpGjOuOxWWE
 umSFII8MCCNqgYw2iVzYvdM2JEkvTBUooGuToxfJtOsA0JW5GJuS6ehzH
 8Te1nLO2ZGRsQN6OTHfEdzwMzqp3QiswGbWAZe25PAekDWG2EpgkDy9kY
 53JnW3DrdO/zEeyz3FZYI/XHkfcumFQKo8RLi5FnrtHRpV0HAClLFQ3d6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6856007"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6856007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 23:48:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874744045"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="874744045"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 23:48:07 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:48:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:48:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 23:48:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 23:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mthPs1GpZ0xXe6XXUt8UYxOriolemWs3RPe9w8ZdxXja431dXvy3FCOC+xzHB0Lrq/WVm4YrBIWTnTf4gR2MXOImVEfxL6PDIGfxXQJSxBogzyeQTwnnoRZ14hmmOP6VtegsM+8pHyAFTFwpMfIX/toi1GsH3x1G357QlCmAGKA9DAewNUcycoR/5iSIN3R6CN6KhaG5WZFFfnfauWzz/Knx5fx3zc/5RxTCU18yppAnzsEtpogcJg6xRaP9QHmy8B+Pv8Pwsgujz7RQEcdhyFDGq3ekgD2yfpuqxG2EoJB/tydsknGoa1JZ1Z2crEZ35lM5DjYp1YdoZC6yTaW5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDbt/Zj4jSrxejoByLylKIffkdVSxmaaaSaOO0zNlb0=;
 b=kCzh3Am0/9rj6T83NvQaHgAC4aVUAEUb4beOdHZqMNuSSzMh7dEXd+Mf+9kdCw/GW+VOCJoi1+i57qvAijTDwY+sBypn3N4rtkPuqU856RTn6GPXwpg8VSS7mjrnw+Mx+H9xFbZjU4dWJJJq5ix6wdCLMqBpxpokr8sQBdj54/KtUmDY5YNFh5yHQ+cWG0XRrVfGx9vPM4E7UY8WKn4nR8z6cKdYEqUQz5PyGZEHt9LFinDTGtruT8aNWiZ2PiZHOngm5IsDNgbpv71hqT3gP1y6raSgMOmnSBnQBfzLW/M93TIvEm/S3uj2LlYac1j6/e+vGuH26HtlkSoT8oKAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 07:47:59 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd%4]) with mapi id 15.20.7181.026; Wed, 17 Jan 2024
 07:47:59 +0000
Date: Tue, 16 Jan 2024 23:47:56 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Add kernel-doc for CCS mode selection
Message-ID: <ZaeGLEnuJuoEUbwC@nvishwa1-DESK>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-4-niranjana.vishwanathapura@intel.com>
 <auc4ho5g4vycsihlmw3cnhai36lmlxzrmsjlxtcsjrpc3qmhqz@kcw6wpnccurl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <auc4ho5g4vycsihlmw3cnhai36lmlxzrmsjlxtcsjrpc3qmhqz@kcw6wpnccurl>
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cc5bd8-207c-42b5-570b-08dc17309ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: auAEVJnaxdV7T1GInXerKDq0b1dQlJJ3GnHeHcjl/ayg0SMyc7/wNuMtgJTrx/ch+bObGiExiFYvG9qC2/+GpBbQYSncO1iqHq4h9O+ukGmfvqTRobDRZ7qJAoLSQkA6XWFMKvXu8xuV7emsrc9W0qXk0qWphwfyvtIhIm5AWENHyOR6S5SHVdIGifl+18PnRSjeZp5skmlLCHaT7Mkrk2N5oH9QodBsRzBFfqcfDrP7PvDGu1XSYR4fNLa6aEPZ12x0bXEm72OXnZca3CQzwMmwyed+etDBkZ2vyB4NndFFRXAeWXZMyCN4Xf2+zp41WbiMfChqihVJPReErKZn/0EOnsZIkn82sj9OYXA/mxE4GV+W++R14BGGKG+DjdgNgiIQpdO0SqMXozXX3h43CZk8oDqY3jkFar2+f6dM+9ZIQ/woUJX2UqKDFhU7UxdBTADn5JDmLtdK1ZA/XF9gRobfXz71XXD/KlkZYEb13l+k0jr0IbbMcly81tUJOOQfKQQldx325QYAMbkANohf+RGyLM/w0bYvogKOB323IPUCkdk4luikoUVUOYEabANV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6666004)(6512007)(6506007)(9686003)(26005)(38100700002)(86362001)(82960400001)(2906002)(41300700001)(33716001)(6862004)(4326008)(44832011)(6486002)(5660300002)(83380400001)(316002)(6636002)(478600001)(66946007)(66556008)(8936002)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wu/lSU18HdjbmOEPpRkK6MMettRmcXydYAaciUQos1O9X9VZhwb5Q8lOQg6E?=
 =?us-ascii?Q?zq3vwpnRsln3GpOp0UUKD3k0dV3umDVPqJlhkqGt24qXVQyNxEapjWzdQeVF?=
 =?us-ascii?Q?itRbNk3rqgv9oCzwhamxbmQdAWS987eXsFOenA8H2MmaysKLj6eZstD1JFgq?=
 =?us-ascii?Q?9l5w8O4ziL86qoc63BL2HqCE0b0Fakszw3f3fGCH6Wjdx7ea1MBxphY4Ab7v?=
 =?us-ascii?Q?96ow4QtYF1dLVCyX6Un9pAFePBUt0J+pifdAo/bJSmIJ5JnNDVWPlOOgTUhT?=
 =?us-ascii?Q?VNzqAHNgJUwtmhTI/zN/XGpg5yYo8yNBkW6T1JZcMC4bxh9eKH01nb9+kPUF?=
 =?us-ascii?Q?KzfFZXLBUvQOtPELLsRtiPTpglSrlknLNRVuFLyyijO5pyR7g7uH3Mn4iIr8?=
 =?us-ascii?Q?WaUl4oCeiDOLsXtbZxm4tBAUfHvSRQwbtPpN4e4pMkQ0QhHm2Uy6X0uUx2+8?=
 =?us-ascii?Q?Zl9weHo3HPY146CBIHitrcz7+INEMz+oJiSVG7ttaalm5/chwuXCYRuLf6OQ?=
 =?us-ascii?Q?k1cUrT//pqRP+G1tFuUI8Sv29IpQK+MYc3hgqnPolDFISYpeLPOrnCzwJMkO?=
 =?us-ascii?Q?n6orgNkDivkd9krWcl0h7X8utCkzXAkIKIFfYDuXnaXMt0YXdnaDn3LS0pae?=
 =?us-ascii?Q?BXexpOa2rpD56b1cCryI8FYWP1e75YZoB+yI/VJuS9sQkyOroDtyHintknSM?=
 =?us-ascii?Q?nLqd5CliHxlueKBUsn/8ngFrmZMqo/bmlLDkJmIGJGlsiV3S752Y0hRdO+Ba?=
 =?us-ascii?Q?ra4/1KS0EWjtA6em2YYWxET8OgTTlvZhr9IMdKa6GvgfnVFNv6QQPMRgIQYt?=
 =?us-ascii?Q?dgz/jfPAp1u6p6Hs0JEGPfTKQzVDCMFXQthNWwY40zcZt7t4wcaXSdmg3UQq?=
 =?us-ascii?Q?HgVxQdmckQ8WioaR+IAnu0d54SCcdGmPEzfyP7VE30cPQdVx6bv7dDRgCqHP?=
 =?us-ascii?Q?ONzB+KF4ZD32XpybUk3oc/eJqz9YuOoQnqGYGC9Gl9hb+8X0qGAxiJrEOSdI?=
 =?us-ascii?Q?U2plVbhxXTmaVEROpnO1aalhK3pxrJSLxIxSlbWshg4e8xLJytlz4W1yOPvy?=
 =?us-ascii?Q?fhd8V4IW0i6QfS/atRcRE8Ijf0fcvjlPlm9g6DkQGInSAYRwUBWk0VnyyC0W?=
 =?us-ascii?Q?YEwUKabBDLLosMeX/7QeXtHienFXWfMtE4GG6WviOZUU+kIl7jC9X4BLVGPG?=
 =?us-ascii?Q?ymEnF3jmtCUvZlo6TLr+4xTzS4liEZqMXdgDByb6sxCeyX+oPlYKIe0jdrSw?=
 =?us-ascii?Q?0DHn4KJl0VA9DdKf8u9VfTeByFf5siHhhMWCrJBq47qwGvppGbIjGHSL4xEt?=
 =?us-ascii?Q?3Z8CQ6eM/tT7FJHD9VfRxhDAfUVpiCT1WEZQdlWRmQHpftbXBv2OfOK3lS17?=
 =?us-ascii?Q?1pP2v2gOJWAbOh806nAREFUooPnwKn+DR7Kg8GHFhB1PiJFkd+MQP2r4oqGD?=
 =?us-ascii?Q?Eo+By9qR2m/NAVD1rr/ukR9OykMznNG3qJS2M8f2Xxf3H7DxaHkukkG1WAqR?=
 =?us-ascii?Q?81zNAFrpXDDTILyDDzQbI/O/TfpaVQCBsnSVQk6aiG60eLylcvO8XO6YT79l?=
 =?us-ascii?Q?ES3dsdGPbcYStAjPcoXw8uDM1FWVzC0ysCh7OBzh4lYcAwgovEpvHmPC/2Pr?=
 =?us-ascii?Q?+tOR6f4xd22h14lJwVFY4AU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cc5bd8-207c-42b5-570b-08dc17309ff9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 07:47:59.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Agrs1YJVcdy3ScHyhznt+5MYrXgwfb9v0rMILpGsxKWzcuqCAnOToWxQ4I9f8+003oSQXB4vMUn70slTQz3PmyXpeJ+gdzywURsyOiVNs7fGccYv3jpPNppFQQ1QiLjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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

On Tue, Jan 16, 2024 at 04:16:14PM -0600, Lucas De Marchi wrote:
>On Sat, Dec 16, 2023 at 01:41:18PM -0800, Niranjana Vishwanathapura wrote:
>>Move all CCS mode documentation including that of sysfs
>>interfaces to a single kernel-doc section.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>Documentation/gpu/xe/index.rst       |  1 +
>>Documentation/gpu/xe/xe_ccs_mode.rst | 14 ++++++++++++++
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 28 ++++++++++++++++++++++------
>>drivers/gpu/drm/xe/xe_gt_types.h     |  7 +------
>>4 files changed, 38 insertions(+), 12 deletions(-)
>>create mode 100644 Documentation/gpu/xe/xe_ccs_mode.rst
>>
>>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>>index c224ecaee81e1..1db8d20942b4e 100644
>>--- a/Documentation/gpu/xe/index.rst
>>+++ b/Documentation/gpu/xe/index.rst
>>@@ -14,6 +14,7 @@ DG2, etc is provided to prototype the driver.
>>   xe_mm
>>   xe_map
>>   xe_migrate
>>+   xe_ccs_mode
>>   xe_cs
>>   xe_pm
>>   xe_pcode
>>diff --git a/Documentation/gpu/xe/xe_ccs_mode.rst b/Documentation/gpu/xe/xe_ccs_mode.rst
>>new file mode 100644
>>index 0000000000000..9ff07706f9739
>>--- /dev/null
>>+++ b/Documentation/gpu/xe/xe_ccs_mode.rst
>>@@ -0,0 +1,14 @@
>>+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>+
>>+=========
>>+CCS mode
>>+=========
>>+
>>+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+   :doc: CCS mode
>>+
>>+Internal API
>>+============
>>+
>>+.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+   :internal:
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index 173b119a21c00..d338b0859728a 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -12,6 +12,27 @@
>>#include "xe_gt_sysfs.h"
>>#include "xe_mmio.h"
>>
>>+/**
>>+ * DOC: CCS mode
>>+ *
>>+ * CCS mode setting allows fixed mapping of available compute slices to
>>+ * compute engines. By default only the first available compute engine is
>>+ * enabled and all available compute slices are allocated to it.
>>+ *
>>+ * Below per-tile sysfs interfaces help user to change the CCS mode setting.
>>+ *
>>+ * 'num_cslices' - This read-only interface returns the number of compute
>>+ * slices available.
>>+ *
>>+ * 'ccs_mode' - Allows user to set the number of compute hardware engines
>>+ * to be enabled and to which allocate the available compute slices. This
>>+ * user configuration change triggers a gt reset and it is expected that
>>+ * there are no open drm clients while doing so. The user configuration
>>+ * must allow equal distribution of available compute slices to enabled
>
>must allow? Shouldn't this be something like
>"Compute slices is always equally distributed to the compute engines".
>Then mention what happens when this is not possible:
>

Ok, will fix.

>        /*
>         * Ensure number of engines specified is valid and there is an
>         * exact multiple of engines for slices.
>         */
>        num_cslices = hweight32(CCS_MASK(gt));
>        if (!num_engines || num_engines > num_cslices || num_cslices % num_engines) {
>                xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>                          num_engines, num_cslices);
>                return -EINVAL;
>        }
>
>
>So... what the user needs to know to arrive into a valid solution is
>that he must read num_cslices to be able to know what are the possible
>configurations.
>

Yes, that is correct.

Thanks,
Niranjana

>
>Lucas De Marchi
>
>>+ * compute hardware engines. Reading it returns the number of compute
>>+ * hardware engines currently enabled.
>>+ */
>>+
>>#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
>>#define CCS_MODE_CSLICE(cslice, ccs)	\
>>	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>@@ -174,12 +195,7 @@ static void xe_gt_ccs_mode_sysfs_fini(struct drm_device *drm, void *arg)
>> * xe_gt_ccs_mode_sysfs_init - Initialize CCS mode sysfs interfaces
>> * @gt: GT structure
>> *
>>- * Through a per-gt 'ccs_mode' sysfs interface, the user can enable a fixed
>>- * number of compute hardware engines to which the available compute slices
>>- * are to be allocated. This user configuration change triggers a gt reset
>>- * and it is expected that there are no open drm clients while doing so.
>>- * The number of available compute slices is exposed to user through a per-gt
>>- * 'num_cslices' sysfs interface.
>>+ * Create per-tile CCS mode sysfs interfaces.
>> */
>>void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>{
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index f746846604759..9cee17506f8bc 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -185,12 +185,7 @@ struct xe_gt {
>>		spinlock_t lock;
>>	} tlb_invalidation;
>>
>>-	/**
>>-	 * @ccs_mode: Number of compute engines enabled.
>>-	 * Allows fixed mapping of available compute slices to compute engines.
>>-	 * By default only the first available compute engine is enabled and all
>>-	 * available compute slices are allocated to it.
>>-	 */
>>+	/** @ccs_mode: Number of compute engines enabled */
>>	u32 ccs_mode;
>>
>>	/** @usm: unified shared memory state */
>>-- 
>>2.43.0
>>
