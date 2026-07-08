Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28975C44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 20:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C9A10E66A;
	Wed,  8 Jul 2026 20:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VK3MLfSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E6210E66A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 20:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783541227; x=1815077227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9oKtwY0OixNqsf7xw8lxd42QAk/8MOYZIB70rdjQkjQ=;
 b=VK3MLfSnd213fEA4JbaflE/AYfMyw2zwEIy9/3Qt4pC/CGnM8dGIXucj
 qitm1FXXC2tqs40ruQs4Fquhgp7BXh2Q1BxRDel8uM5CHsyjg1XFi2bCb
 qfcVc481HS6HN2NWU6bJTClTQR32ccDPdCOXfHPKOkZ/IvqyIYw2DZQgJ
 XI++ec6t3aL6IP2WXYd7Z8wx6nK+bQCv599Jm7As1urzoMYJERWvu/Ixa
 aafGZEPDa/HV0Nrs1zNER6+WTk0fahdIrd+NbwKQqeqcDdYD4kWzrgiLA
 gYT7akDLBrqPI23gAXqGl8h6shJWtmHGC3BYtf/Cwy0aJjdW1BhxiCGj4 A==;
X-CSE-ConnectionGUID: 7wTm/wGBR0S+uoEsrk+sWg==
X-CSE-MsgGUID: h2yxpZI4T/mbq9q1GeAcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95374680"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="95374680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:07:06 -0700
X-CSE-ConnectionGUID: 1UStcstTQjOTDj4PO+jCxg==
X-CSE-MsgGUID: uoPZuGrBTpSSM0qbOin4JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="292565507"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:07:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:07:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 13:07:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:07:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7F2WjrUB0L6pN8gUAM1W8L5uE/uxJbH+v1vZ3l/dt9PaYoy1+UEMCsY8U+/C2SEbYMCA3+hsJsoQWNjlesj+oLJm2B6CNfnNwoKUgZusq4zoQ+XmDlWX4HL2y/ihnfc1BUIRmtfyanwUeWxUQe1HURsvNSQ62aSy0Jm7xgZvrxuvGsWazYnBN3oGPl99vMOwJc5XbQP5TqWcjr24Q7jUSJgS3QBK6WmJoS1l9tJNHRF85ijiHeXFJM/bvs4d+NQ2NeasP2MhJzHQN4QB427IYZsxfRnQiPHjVKBwuJrVzIsPaj1Lll3cn91QZw0AVAtQbeLvifPrw7JKkkuArARKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1iqoR3/BLqyWF4AWD6173Fti+JQchDxbRbjZh+A4dc=;
 b=j+5qpywsPtKWo/3i4ctDxcynpJmzx7NXo4aD7xXXW2zgPbtt5Bg3b8XVioE8YrGjuQETqfIAI2HFxKFEQ9wxbqmo8V8aiJkrpb2KqIctvSXzW/Nt+7ItVOrubo+60kDmWhcQwMsHLGS0GM1luNe64ayAk5futGgGlEn28T3W7ev0hKRdhyTh3MBx+wuY9MzP2juwmbYwB6WZCjajQ1CjMObgk/YLNyCVKnOtn2NlJxKXvGOBoCKrXc/iOs20LnwQPAFOq3gLbfN3yE8HNVBu2TDYUSCJf1U5xCwXMph4+HtZXQJFTvJzRSRCX8TeBkbCCbn6Aof0DLDtVGr/+Lt4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH8PR11MB9805.namprd11.prod.outlook.com (2603:10b6:510:3c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 20:07:03 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 20:07:03 +0000
Date: Wed, 8 Jul 2026 16:06:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v8 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <ak6t4jMGPjLV3QjT@intel.com>
References: <20260708135110.4117174-3-soham.purkait@intel.com>
 <20260708135110.4117174-4-soham.purkait@intel.com>
 <ak6pqsN18JAqB9kF@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ak6pqsN18JAqB9kF@intel.com>
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: bd68c706-1dad-4f94-5fbf-08dedd2c7a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|3023799007|4143699003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 880zvCLONle/kp2DPa6qHDi0keO1qYqY8ZJ0/v9QjaxcYXdhJFUqSLczeqgmbt4RGkTf1HktFiUR0JqUyzTSTm1+qr9B2q4MeF3alfpocX5gQ4Bnz/xCgWc59M2sFIjB00eE0gmFNBHKP0Y8INBKyDu+Q/bJqUnWef9vDMLNeofyT4mBcC7MNC9tP0XrWNsfCKbYLz+rMW9jSxhFkXDDNDRhDV1S9Ill4Bk+qIYBwaxQhZaz+zFBbnYeTtRknj6PjxTZDU1b2/qR4WhFyGXbd9ODnpOVVp5nH6TIMA+JfKO9mBVAJu1Yo9vrTdmy711cLDC9y6EOFxZBhxsrhHJrhfyc20ONPm8+wFCpgP5y8b9s7MlTIdMKZcWYxXzC/t6F9V6QVd9mGARN2lT+na3OxTkc8OOyi8m43gqRbV8X7EwsC2GOKAga4Pzq6qJpEMC/xb6JGyLDVouYuoEUJilBOGo+j2nhFPWS2i5NpQYS9vvJGfcnwcR2kGLg36GFfCcgOXXnFc3T9S5At8QAV2QMOSehrjzDYDXfimrsod5dNieDg4Kj5gKzubAlMyfAXPrWjNAQMdO9o4MXEL1HcxCuaSTJF4xyLbtEpL1dO9iGCxg+aTv4Mc6RnEY0fjAuNWj7uopRruL+0T+FeuS0KSHPf7dSb0VL7FQgrr4iqd2cjuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KCKSI316R53USShBN/ncwjsjihfaS4Nk6N0tQsIC5ZfA45PGzJDpA665qD7U?=
 =?us-ascii?Q?d1rbuebNtHIZhYq5H7D9tEM20ZYV6w5Z/GJXH7rReZstjxS4aPyASSO1+a+A?=
 =?us-ascii?Q?zKztvM9QSCqpkgIB37ny7V2i6+S3K7HXOEZNLFRulSuZ7Pz4ZxgAeWjTkJJf?=
 =?us-ascii?Q?6gHSZ2ES5WBRcFGIyZ6KuhW3Z8iOGHFVgTPeKHWN2GqOW0P1bzOwFuadxxeS?=
 =?us-ascii?Q?5l/FD4I2tRraeX3EJNUAMsGFRCeovfzSfOp10Nc/bx9UXzLAWS8NDryg1BMq?=
 =?us-ascii?Q?95D2tyWTrOKnj2HdkA7j/zAVcb71RF0zaUlVoRHyeHs8SL+b1t1sJeUuEsDM?=
 =?us-ascii?Q?gEV2LJnG6hpOR+EWLpkwwyZmn4S+H05/h1RWlWioTPg0/o633NeHr+j3lGrm?=
 =?us-ascii?Q?Myz2WOs0ySK/K7pWW9uibtaFRaTWwHjRpg6lJClcIlzjo8WzNZ1gGGo4KIp5?=
 =?us-ascii?Q?KA+QXprUPvQ18oITKmPFv7/WAt7Nlbw2DSFZh+sZEwQBlLC4K2hQI2pUPj60?=
 =?us-ascii?Q?4/9ChYTBSeLZin5PQ9bRlNb9KbhFQ2NGt5nwdJ2TpZcO1tovIiC9nQjNFl8M?=
 =?us-ascii?Q?V5PcyipCRNJQ68q6eaXgKB4MwxAz4wC876garoOeo6BT9g4LajKKyWGElbnY?=
 =?us-ascii?Q?CEVjY+bVaox5J82peaUGNnE86nT9jdqFvzpUWv7DIqmmOl1iypC0vA1MV2E7?=
 =?us-ascii?Q?fGthifVCyOT0HQB/q8gRIp2kYiOUr4yGBYA5wlIzLcfV1og8u0cj5hTfjArH?=
 =?us-ascii?Q?NJNuJ+eNlriTe2q5utAqKhLw4u3yA7YAAlJ8d/7A48KO5D00HCX2z8sHFczt?=
 =?us-ascii?Q?nNLqqfiPB/WsNtzxxYxSQNmqiAl7d1JZMnf3zrIZD+JDUEy3w29aHgjY5THz?=
 =?us-ascii?Q?ighYG9USxCERbfpOdcIVnb5Iorn5WY3rcaDwQ59ikdQ32mOjs8PgH2sIY9zC?=
 =?us-ascii?Q?B1We5wa/leoHF+6nvV3rJqb+DvxUkxKLSYI89GKN6Hp4w6jBCNK83Rwzu5IC?=
 =?us-ascii?Q?m87hi8kFrDghdKL6iB0uBLxQgXM3mC8PdjV/Gm5+i7EnWOrWYTpQd06mkbiT?=
 =?us-ascii?Q?i2TLkiJfzAZCr7ALQ4CIFQr3Ydj/OJke7By7bHjkhwRReupgcCm9RketFDNe?=
 =?us-ascii?Q?+ld5QnibtgYjlx2bzQevRsxharXsvALqcspYFfl3g4nWqEkvsmIWUnlI3RxF?=
 =?us-ascii?Q?oDTt5YsdEdsNGNX43inX99K2WVkGrXeVO9u3hgUGizfKwI2Otg/CZQTjofgM?=
 =?us-ascii?Q?Brxn0V5Md/zfY19EFrU7tDTE3jWFMc93ElaDLa9E2eTrA3FzWBdPwBIrpr5Y?=
 =?us-ascii?Q?4hNZbAV5kmLbPomE5zwPrZprylXODjwOvthLtpTpk/KkFkOK7Cms8O6O6A+G?=
 =?us-ascii?Q?NcV+o6Atw6IKzC2w0kc+TORS0+mV5HZGgVXO+2bXI7XAatLt0FkuEClCZdHR?=
 =?us-ascii?Q?TUXDPY/MKDQSK1utwtP/ej3yG1xXWEiovUa2ubRYySpIgOu+LfcUcoBpD1Q2?=
 =?us-ascii?Q?AusjY9J6GnB8jGGopb8dqdsTD9Nicpx08XqNt7llDl3T0CrzfSQl6wkdn7Ji?=
 =?us-ascii?Q?1WofhFqaHF0OEfgsF4nagUmPvUdGuciH2+SlurvacGnzqijs8rsIdpRgZAUh?=
 =?us-ascii?Q?l3QGfF6GLvJxr+74zAzcGA4wJUdW27C7HQX6ae1seSoXCTKNNtxAFgdj+iHY?=
 =?us-ascii?Q?bCgEr8xNqKRa3KNyJWA08/WjvsG/TeU2KdfQBBA5bPNOyvyh0qiVRYV3c6s3?=
 =?us-ascii?Q?1uf/L92KvQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: TIJGPqGxzAMAwxcSQyENzij4WJN12tENxws7oUXUABim7a3TSQUEKPLLCalwHVV9P0G54hXbQU0nfrT7nlSFCdQEviyoZiNeBC/vgsYJFbzK0pL6l5t0WJwvLZODAg83fLJdSHEG5tjPEDHwFKPyNtOVLwdu/78lceaoS+8+lMF12j3KnQ7tjgdHcJfZUf6sAwwytxBdYnhApoz7xSME6OpWmfZr5oSfb+PJ9vQVFzt5R0Yw8XeSRYUkFm7w02SHKwCaVudS8E9ysd7ymzK2xS5oGW6yLpOM1XIBhGjx1vureULEpeWZ/vavX57P0Jtt1wn7A/i5hdFxqtfwR+L8RQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd68c706-1dad-4f94-5fbf-08dedd2c7a5a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:07:03.6347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMYevMlYwmJTDFkOV86nZZc4xrTngbHPG1PKyDqHeR0Ptp/0uVZa869ZpryX2J5qX0y9C8JwIRqE9/8LOgMJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
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

On Wed, Jul 08, 2026 at 03:48:58PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 08, 2026 at 07:21:12PM +0530, Soham Purkait wrote:
> > Add a sysfs interface that reports the current GPU health state and
> > lets admin users and management tools update it but is readable by all
> > users. Requests are routed through the sysctrl mailbox. The interface
> > is present only on platforms that support the GPU health indicator.
> > 
> > The interface is a single read/write file at the device level:
> > 
> >   $ cat /sys/.../device/gpu_health
> >   ok
> > 
> >   $ echo critical > /sys/.../device/gpu_health
> > 
> >   $ cat /sys/.../device/gpu_health
> >   critical
> > 
> > v1:
> >  - Add enum for health status. (Andi, Rodrigo)
> >  - Return error number instead of error message in _show/_store. (Andi)
> >  - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
> >  - Return only the current health state for sysfs read. (Andi, Rodrigo)
> >  - Add documentation for sysfs interface. (Andi, Rodrigo)
> > 
> > v2:
> >  - Make logs and structures consistent with their counterparts. (Riana)
> >  - Drop unnecessary variables. (Andi, Riana)
> >  - Add correct KernelVersion. (Raag)
> > 
> > v3:
> >  - Add missing blank line before #endif. (Badal)
> > 
> > v4:
> >  - Add consistent "gpu" nomenclature to the gpu health indicator
> >    DOC blocks. (Riana)
> >  - Add Kdoc for gpu health indicator. (Anshuman)
> > 
> > v5:
> >  - Rename struct fields to response.health, request.health. (Riana, Raag)
> >  - Use devm_device_add_group instead of custom sysfs init/fini. (Raag)
> >  - Rename health enum to shorter XE_RAS_HEALTH_*, drop redundant
> >    invalid-input log, and minor log/format cleanups. (Raag)
> > 
> > v6:
> >  - Add updated ABI Date. (Raag)
> >  - Rewrite DOC block with canonical path and cleaner wording. (Riana)
> >  - Refactor enum name. (Riana)
> > 
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> 
> pushed to drm-xe-next

and removed after I noticed there are unsolved discussions on v7
and that this tells version 7.2. Any patch going in right now is
already targeting 7.3

Also probably good to clean up this revision history here.
It is already big and at this point misleading.

Thanks,
Rodrigo.

> 
> > ---
> >  .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
> >  Documentation/gpu/xe/xe_device.rst            |   7 +
> >  drivers/gpu/drm/xe/xe_ras.c                   | 147 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
> >  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
> >  5 files changed, 245 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> > new file mode 100644
> > index 000000000000..9c4a713b8cdd
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> > @@ -0,0 +1,30 @@
> > +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> > +Date:		July 2026
> > +KernelVersion:	7.2
> > +Contact:	intel-xe@lists.freedesktop.org
> > +Description:
> > +		This file exposes the current gpu health state and allows the gpu
> > +		health state to be updated.
> > +
> > +		This sysfs file is present only on Intel Xe platforms that support
> > +		the gpu health indicator interface for RAS. Reading the current
> > +		health state is available to all users, while updating the health
> > +		state is restricted to administrative users only.
> > +
> > +		Read returns a single line containing one of the valid values for
> > +		the current gpu health state. Writing one of the valid values
> > +		updates the current gpu health state.
> > +
> > +		The valid values for the gpu health state are:
> > +
> > +			ok
> > +				The gpu is healthy and operating within normal
> > +				parameters.
> > +
> > +			warning
> > +				The gpu is experiencing minor issues but remains
> > +				operational.
> > +
> > +			critical
> > +				The gpu is in a critical state and may not be
> > +				operational.
> > diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> > index 39a937b97cd3..d3a022362ade 100644
> > --- a/Documentation/gpu/xe/xe_device.rst
> > +++ b/Documentation/gpu/xe/xe_device.rst
> > @@ -8,3 +8,10 @@ Xe Device Wedging
> >  
> >  .. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> >     :doc: Xe Device Wedging
> > +
> > +====================
> > +GPU Health Indicator
> > +====================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_ras.c
> > +   :doc: GPU Health Indicator
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > index 74d5016d9ffe..5ae5cd5b3383 100644
> > --- a/drivers/gpu/drm/xe/xe_ras.c
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -65,6 +65,13 @@ static const char *const xe_ras_components[] = {
> >  };
> >  static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> >  
> > +static const char * const gpu_health_states[] = {
> > +	[XE_RAS_HEALTH_OK]		= "ok",
> > +	[XE_RAS_HEALTH_WARNING]		= "warning",
> > +	[XE_RAS_HEALTH_CRITICAL]	= "critical",
> > +};
> > +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
> > +
> >  static u8 drm_to_xe_ras_severity(u8 severity)
> >  {
> >  	switch (severity) {
> > @@ -332,6 +339,140 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
> >  	return 0;
> >  }
> >  
> > +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct xe_ras_get_health_response response = {0};
> > +	struct xe_sysctrl_mailbox_command command = {0};
> > +	struct xe_ras_get_health_request request = {0};
> > +	struct xe_device *xe = kdev_to_xe_device(dev);
> > +	const char *health;
> > +	size_t rlen;
> > +	int ret;
> > +
> > +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> > +				  &request, sizeof(request), &response, sizeof(response));
> > +	guard(xe_pm_runtime)(xe);
> > +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > +	if (ret) {
> > +		xe_err(xe, "sysctrl: failed to get health %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (rlen != sizeof(response)) {
> > +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> > +		       rlen, sizeof(response));
> > +		return -EIO;
> > +	}
> > +	if (response.health >= XE_RAS_HEALTH_MAX) {
> > +		xe_err(xe, "sysctrl: invalid health state %u\n",
> > +		       response.health);
> > +		return -EIO;
> > +	}
> > +
> > +	health = gpu_health_states[response.health];
> > +
> > +	xe_dbg(xe, "[RAS]: get health: %s\n", health);
> > +
> > +	return sysfs_emit(buf, "%s\n", health);
> > +}
> > +
> > +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> > +				const char *buf, size_t count)
> > +{
> > +	struct xe_ras_set_health_response response = {0};
> > +	struct xe_sysctrl_mailbox_command command = {0};
> > +	struct xe_ras_set_health_request request = {0};
> > +	struct xe_device *xe = kdev_to_xe_device(dev);
> > +	const char *health;
> > +	size_t rlen;
> > +	int state;
> > +	int ret;
> > +
> > +	state = sysfs_match_string(gpu_health_states, buf);
> > +	if (state < 0)
> > +		return -EINVAL;
> > +
> > +	request.health = state;
> > +
> > +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> > +				  &request, sizeof(request), &response, sizeof(response));
> > +	guard(xe_pm_runtime)(xe);
> > +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> > +	if (ret) {
> > +		xe_err(xe, "sysctrl: failed to set health %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	if (rlen != sizeof(response)) {
> > +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> > +		       rlen, sizeof(response));
> > +		return -EIO;
> > +	}
> > +
> > +	ret = ras_status_to_errno(response.status);
> > +	if (ret) {
> > +		xe_err(xe, "sysctrl: set health command failed with status %#x\n",
> > +		       response.status);
> > +		return ret;
> > +	}
> > +
> > +	if (response.health >= XE_RAS_HEALTH_MAX) {
> > +		xe_err(xe, "sysctrl: invalid health state %u\n",
> > +		       response.health);
> > +		return -EIO;
> > +	}
> > +
> > +	health = gpu_health_states[response.health];
> > +
> > +	xe_dbg(xe, "[RAS]: set health: %s\n", health);
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(gpu_health);
> > +
> > +static struct attribute *gpu_health_attrs[] = {
> > +	&dev_attr_gpu_health.attr,
> > +	NULL,
> > +};
> > +
> > +/**
> > + * DOC: GPU Health Indicator
> > + *
> > + * On Intel Xe platforms that support the gpu health indicator interface,
> > + * the driver exposes this sysfs attribute for in-band access to the gpu
> > + * health state::
> > + *
> > + *     /sys/bus/pci/devices/<device>/gpu_health
> > + *
> > + * Reading the attribute is available to all users and returns a single
> > + * line containing the current gpu health state, whereas writing is
> > + * restricted to administrative users and updates the state to one of the
> > + * valid values.
> > + *
> > + * Management tools and administrators use this interface to query the
> > + * current gpu health state (e.g. for telemetry/monitoring) and to
> > + * update it - for example, to mark the gpu as ``warning`` or ``critical``
> > + * after diagnostics, or reset it back to ``ok`` once remediated.
> > + *
> > + * The valid values for the gpu health state are:
> > + *
> > + * - ``ok``
> > + *     The gpu is healthy and operating within normal parameters.
> > + *
> > + * - ``warning``
> > + *     The gpu is experiencing minor issues but remains operational.
> > + *
> > + * - ``critical``
> > + *     The gpu is in a critical state and may not be operational.
> > + *
> > + * See Documentation/ABI/testing/sysfs-driver-intel-xe-ras for the ABI
> > + * specification.
> > + */
> > +static const struct attribute_group gpu_health_group = {
> > +	.attrs = gpu_health_attrs,
> > +};
> > +
> >  /**
> >   * xe_ras_init - Initialize Xe RAS
> >   * @xe: xe device instance
> > @@ -340,6 +481,8 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
> >   */
> >  void xe_ras_init(struct xe_device *xe)
> >  {
> > +	int ret;
> > +
> >  	if (!xe->info.has_drm_ras)
> >  		return;
> >  
> > @@ -350,4 +493,8 @@ void xe_ras_init(struct xe_device *xe)
> >  
> >  	if (IS_ENABLED(CONFIG_PCIEAER))
> >  		ras_usp_aer_init(xe);
> > +
> > +	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> > +	if (ret)
> > +		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > index 6688e11f57a8..bbfaff8326cb 100644
> > --- a/drivers/gpu/drm/xe/xe_ras_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > @@ -10,6 +10,21 @@
> >  
> >  #define XE_RAS_NUM_COUNTERS			16
> >  
> > +/**
> > + * enum xe_ras_health - gpu health values
> > + *
> > + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
> > + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
> > + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
> > + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
> > + */
> > +enum xe_ras_health {
> > +	XE_RAS_HEALTH_OK = 0,
> > +	XE_RAS_HEALTH_WARNING,
> > +	XE_RAS_HEALTH_CRITICAL,
> > +	XE_RAS_HEALTH_MAX
> > +};
> > +
> >  /**
> >   * struct xe_ras_error_common - Error fields that are common across all products
> >   */
> > @@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
> >  	/** @reserved1: Reserved for future use */
> >  	u32 reserved1[3];
> >  } __packed;
> > +
> > +/**
> > + * struct xe_ras_get_health_request - Request structure for obtaining gpu health
> > + */
> > +struct xe_ras_get_health_request {
> > +	/** @reserved: Reserved for future use. */
> > +	u32 reserved[2];
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_get_health_response - Response structure for obtaining gpu health
> > + */
> > +struct xe_ras_get_health_response {
> > +	/** @health: gpu health, see &enum xe_ras_health */
> > +	u8 health;
> > +	/** @reserved: Reserved for future use */
> > +	u8 reserved[3];
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_set_health_request - Request structure for setting gpu health
> > + */
> > +struct xe_ras_set_health_request {
> > +	/** @health: gpu health, see &enum xe_ras_health */
> > +	u8 health;
> > +	/** @reserved: Reserved for future use */
> > +	u8 reserved[3];
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_set_health_response - Response structure for setting gpu health
> > + */
> > +struct xe_ras_set_health_response {
> > +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> > +	u32 status;
> > +	/** @health: Resulting gpu health, see &enum xe_ras_health */
> > +	u8 health;
> > +	/** @reserved: Reserved for future use */
> > +	u8 reserved[3];
> > +	/** @reserved1: Reserved for future use */
> > +	u32 reserved1[2];
> > +} __packed;
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > index 6e3753554510..693c0ee592be 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > @@ -25,11 +25,15 @@ enum xe_sysctrl_group {
> >   * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
> >   * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
> >   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> > + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
> > + * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
> >   */
> >  enum xe_sysctrl_gfsp_cmd {
> >  	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
> >  	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
> >  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> > +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> > +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
