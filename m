Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18956C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 18:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D143C10E5D4;
	Thu, 10 Aug 2023 18:30:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D362210E5D4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691692204; x=1723228204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E1s6ySAdw32KgEJ6LrX8Pc9GwABEgXDwLG/DFa1fzUE=;
 b=aLt1ZdkQWDWxFf4HLgcoRlvU9Sxy/3OyIWFlqaHVRPGydgb/OY9fu/H0
 JCkqZ6Mu6b2PMX5ImyaBmnFzUc+jCVWukrgPz+YlZtnVtPbApwo67bspS
 e1siCDqikjnYCP9sSHiReRNLgHJJukpncslGQRWSI76GDjuAOnrxRRiDK
 z9+6q+0/gb6RowGQrh0mA9QKKUYe048OvGLNbwkWPbnYv6Anah8t0KG9A
 /xerYPhk0Rj9CtGPSUsdf4gMbqQPZhca9IiUZ6nXQxm65K5Gdto8rPz0/
 0lRrVah/IrbounIcAOwB+j8WUpQbwrcZIgnbYTUOTcWKAy2r/j7lyqmlg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351094460"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="351094460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 11:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797716128"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; d="scan'208";a="797716128"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 11:30:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 11:30:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 11:30:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 11:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHnvrw17YFPfT/32Y17NnLYgqktDYyZXwHSwtcUN+G1dkRnuO+oY8jyIZhnZkKbT5x65MQx6uRYtKiFF7vrWiYxW/nwq7Y7RoXqc8T/1gjpXa/Dpb7T6b/fEXZexl6BQq3Z167O0YL5yDLwkgaEn2u6Zvmk/zILyNYpLga4c5Go4mDgdeYoI06ZW8VWobSosv5C79K0wPOL5e+k9F2lH4Q2MI8J/63/Nx8MVYzP+QIhnlCGXgjrZWMCHnnX9bUwXx0QHrIRIKfeTuJRElNyLTiXFD5On2toE8EAu9oOUQj792G+4B5JPl1W9vvKjtDVJc7HpNM9h8iqkALaWU6wTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vO8CSgOdPy2m6W0O77HepD5FRifaEArzILKy+/pYZx8=;
 b=W81IvE73V7cUR8x3tgxHZOxBxJ7dWffgiqNby6z8v3MZbztM6bGPrMRxgwHnnkcKBa/4ZhaslpdAnY7XYJZAWHecgDvOIvNZ9R4OUCu0uRpeuwziAs6RrxK0y8NzRfOJ7t1cQZWhEVMBGoP4v26KvnOJQEHHkiXs75i6aYoBTNKlVZYqwRw/s95wyqGYdc5L/DA7ZvZGF7w8DRYRNU4QYQz183mrYPSRdU0/iH3GrDtJ4cV3Dia/5r2cEhJ3dPYrfOTH0G4bPbLPa7DAQJXNRc8/CtDDBRyaNOFhnLtQm4Jp7E/IBijotd3H05UQrUsCW+x+jdvaOaaZrfnBhd+urg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 18:30:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 18:30:01 +0000
Date: Thu, 10 Aug 2023 12:29:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <e7grbmy5m4az6qgjgnviaz2lkk5kwobhndkxoo26ycqnyqhisw@tsapxdgvayko>
References: <20230809180515.2083-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809180515.2083-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e27b43-9362-4653-7a3c-08db99cfcf16
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWr6n8nW1N3Fic9mxfUM7dflO/H1gg2yfM1Hwzxrx7/QjBoFK+DtvVALHdeuQmKEfs5TzRKdWJ3Pb67ApKzpuj+qP0XhNnkte6JBHqS1agAM/W98rspabB0XzxNBtF8m1WSWJQHk9fnavJedfhs/7qO3fad2hajRZhXeStq5UYdby9KZKPQrkPzrB+eezLSI7C/M0AmnHM7Q9GEl4k5/i/xb63GtXnP+hivtalz0cgc3R25PqWHP86Gw4NnAzFF5n6yomsTqszFptMyI6vp+Q213JXUBhTGx0HMPKPtSLU9MFgf8MopEGGtWFLcLZfZonA4Gi/jMOLHc0ILjPScmg1QJo/atUpjw+6qatT1853TF6bLKIA47vuk33UgLos7wbEfoAGUrSfHrcAyxNXrY+OpkDcN4gOrMmS3VRY+gSuLf9i6XU74454RlrxhEMi8uZr1FaCaHJk/GLCS4Xyla78obP3GgqCAgrbInFmlF4PchMQKpu1p813EUWmVh79PkEAkoKa/FR2cZxdUG082euNGBeC37hOySdK6W9MVoCPbTx9bMrw5T6PIt8ElQ1QmwGTwE0w2nGTXCKB7wpZ4cOwWe2cte63GcshBpl0N7EAsCss73Es5l1CCdKvlfQSqW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(376002)(346002)(136003)(39860400002)(1800799006)(186006)(451199021)(2906002)(5660300002)(6862004)(82960400001)(38100700002)(83380400001)(33716001)(9686003)(107886003)(6506007)(26005)(41300700001)(8936002)(6486002)(66946007)(66476007)(66556008)(6666004)(8676002)(6512007)(86362001)(316002)(6636002)(4326008)(478600001)(54906003)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HKoxFJ81vesNfh19+iBDYrWA5e6tStJLOHkk876YqwFthWEKzIzr2xH9nW?=
 =?iso-8859-1?Q?6/75medbzCBp4vS+cKlolAIo+aLNrnqgSEjU/cKS0K2bgUtw+Tamoforwa?=
 =?iso-8859-1?Q?ChAmmtXrochGLqhUVvOUe6EjNbms+mZAok+fqFiJa1IJ/hxxpuBuGLD/id?=
 =?iso-8859-1?Q?LUnhHB8LzOM6P9r16OioX4ZwUlkPpFjU7mq0KHIQEdrYaGp13oGHZD4985?=
 =?iso-8859-1?Q?EdnjEN9wOSxoFjcaoE2ojEyQ+uBsUxlz/brNj1f3bdh1L15InACkF8YpIQ?=
 =?iso-8859-1?Q?9fUOalUGXApHceJL1S81PtEmV9hShKEVo51NnVAlOI/WfV4/4mHxRvzh7f?=
 =?iso-8859-1?Q?KKvd3WAfJsdKcvy56l3IYHBCPGmDdgFXZdCmQCjTs9mukZvabQNV+QiUTc?=
 =?iso-8859-1?Q?0oZeJjCln6D3JeT+UGj/Zsx49mSx8sCQzJYmwTYPJ15xy8LASGv5TcgQoY?=
 =?iso-8859-1?Q?fkiN+ipDyBw627S7BEcl/Uo1Cl92qSgyw/l1Z4S39HStif2sRuJ2s/4yZs?=
 =?iso-8859-1?Q?qNND6YiTwT3XgycKojlSvSrClY2zJTTbTZPXoTXqsAGwVAEW0qx/BFk9aO?=
 =?iso-8859-1?Q?HFViwcwH6BJjcVydRsTV8XqT0VCpzVGtJ6sXMXoCGMA0lDBo2JgYPZU/Cy?=
 =?iso-8859-1?Q?VUO6y8S3kciahz3CJ4Fp6aRLaZCGdejefT6LzxRqntGDzyG1seeA5kKX+Y?=
 =?iso-8859-1?Q?RJF55vlIKzbNIZ77w2nq1cK9vSIayF7KPV3tyXzGCRX1ezM/IChxYHaTC6?=
 =?iso-8859-1?Q?eltzOnkY3TFlygHswPfECNX1oYQxzY58lR0Oxq/g5MVdn5wIxLdSGNYAND?=
 =?iso-8859-1?Q?lD+A2j6H0ayDKdWMhyTVOmiHX1oNSD9X6biwW9Xillu5Ql9RhfrKtQZWpn?=
 =?iso-8859-1?Q?vcNpyel4NzrVP0fK92mSkt6ozc1VlhjTmzIbEcJD4N97xOKie6zA9yV/eA?=
 =?iso-8859-1?Q?zHEwLHwwscu1rNzI2I9sG4zcbG7YTaJlNhd7O9nsxgCI77rst/A7TlOI2k?=
 =?iso-8859-1?Q?aalpzFgR3DzZsJdHjzggPZ0tmo3Ohy7qG+sj9mecU/E5I0Zn/Hdm5maObU?=
 =?iso-8859-1?Q?Bzb7vrF+7/mTFuLlwnWO7AfqrYKFEkvSm3yl+FNZNEDKf2vPvpzaYy9zXk?=
 =?iso-8859-1?Q?Xl/M97F5t+paS/gQPYOPczfs5yfBV0d0OB+g+7HbneaoC7X6rcHxzqADJ9?=
 =?iso-8859-1?Q?iS8X5dOXDfaQsjg9yd0fx/JSYSIUVXlC7PmrrW4PTBN2+TaWL7feEhf59f?=
 =?iso-8859-1?Q?g4yFQBS5slCtnGg2bjCTFdDeizHQIF+vX8aNejKgkLTM0atDVgCXVHW7ag?=
 =?iso-8859-1?Q?PWjmJ1WsNcSGX3GKY7szGbJI+EBoNL005h4+Ne+9Zkvh6jmI9Wewbi8ip4?=
 =?iso-8859-1?Q?0k0YSwHF3bz+7m04LSb0n/oCCAo0fgBq89QyKngYx4a0PNGNbsHCMcETaY?=
 =?iso-8859-1?Q?A6R2IFWL1niyW+lKnPtZJVsrSnRjaeUrrnpJ2VIY0KH3e+P3SIYcZm+Q1l?=
 =?iso-8859-1?Q?KXt/mRqQt+GpjvhnE42McF92QN0qh47lhPA+R+B/Om9iCCN+5lZGbl4H3E?=
 =?iso-8859-1?Q?iNV4ACHrzXqFw0XOSY+l3ABvRC+3kvRJwbLakaQhyzLkM2wIjbDBhRBnon?=
 =?iso-8859-1?Q?Yhp7N8X7Vlf7Qa7t8t7ruHPn9k5Ux3jXp1gwY3k1svHnQ3nhC1EcZyiA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e27b43-9362-4653-7a3c-08db99cfcf16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 18:30:01.7592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUEVIgnIcsxynnPPqn2j4PSbFijP9qh93h+dov2TqT8fnz7tOnsnWI085BNFtDPG6QYRUfI23/5NkHS5S1PjkOxCpqhbrrvj6jJ6+X76VUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Introduce Xe assert macros
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 09, 2023 at 08:05:15PM +0200, Michal Wajdeczko wrote:
>As we are moving away from the controversial XE_BUG_ON macro,
>relying just on WARN_ON or drm_err does not cover the cases
>where we want to annotate functions with additional detailed
>debug checks to assert that all prerequisites are satisfied,
>without paying footprint or performance penalty on non-debug
>builds, where all misuses introduced during code integration
>were already fixed.
>
>Introduce family of Xe assert macros that try to follow classic
>assert() utility and can be compiled out on non-debug builds.
>
>Macros are based on drm_WARN, but unlikely to origin, disallow
>use in expressions since we will compile that code out.
>
>As we are operating on the xe pointers, we can print additional
>information about the device, like tile or GT identifier, that
>is not available from generic WARN report:
>
>[ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
>    platform: 1 subplatform: 1
>    graphics: Xe_LP 12.0 step B0
>    media: Xe_M 12.0 step B0
>    display: enabled step D0
>    tile: 0 VRAM 0 B
>    GT: 0 type 1
>
>[ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
>    platform: 7 subplatform: 3
>    graphics: Xe_HPG 12.55 step A1
>    media: Xe_HPM 12.55 step A1
>    display: disabled step **
>    tile: 0 VRAM 14.0 GiB
>    GT: 0 type 1
>
>[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
>[ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
>[ ] Call Trace:
>[ ]  ? __warn+0x7b/0x160
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? report_bug+0x1c3/0x1d0
>[ ]  ? handle_bug+0x42/0x70
>[ ]  ? exc_invalid_op+0x14/0x70
>[ ]  ? asm_exc_invalid_op+0x16/0x20
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  ? xe_device_probe+0x374/0x520 [xe]
>[ ]  xe_pci_probe+0x6e3/0x950 [xe]
>[ ]  ? lockdep_hardirqs_on+0xc7/0x140
>[ ]  pci_device_probe+0x9e/0x160
>[ ]  really_probe+0x19d/0x400
>
>v2: use lowercase names
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Cc: Jani Nikula <jani.nikula@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>


Just a few comments below, but motivation, doc and intended use all look
good to me. With the changes below, this is

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

As maybe a controversial thing, let's wait for at least one more ack
before applying.

>---
> drivers/gpu/drm/xe/xe_assert.h | 175 +++++++++++++++++++++++++++++++++
> 1 file changed, 175 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_assert.h
>
>diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
>new file mode 100644
>index 000000000000..4977d9fd3dab
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_assert.h
>@@ -0,0 +1,175 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_ASSERT_H__
>+#define __XE_ASSERT_H__

in xe we use just one underscore for header guards. Example:

#ifndef _XE_REGS_H_
#define _XE_REGS_H_


>+
>+#include <linux/string_helpers.h>
>+#include <drm/drm_print.h>

missing newline here to separate the 2 blocks and each block should be
alphabetically sorted.


>+#include "xe_device_types.h"
>+#include "xe_step.h"
>+


< snip >

>+
>+#endif /* __XE_ASSERT_H__ */

and no comment at the end of the endif


thanks
Lucas De Marchi

>-- 
>2.25.1
>
