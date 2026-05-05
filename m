Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8FFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 04:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BB910E021;
	Tue,  5 May 2026 04:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2tUxrb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6DF10E021
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 04:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777953644; x=1809489644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h0IoSjSHoovpoXDdpHsc2RiyXCAPf6EUNzCkKyDfUsE=;
 b=B2tUxrb7GLG+M3A2Rffg4ADlbl6LZQV69IkNgOb9B5iOulmXwynMxL6o
 OMEJNCFTDbT70q7azLlpB41uVYqGiV85Cru9sYFqxS98pdJ9w7mGo3eE9
 7Y9amewaMfi1MmF6+z5irOZRjwaYrYXB61uTNDlRn3IDROk22LJq1lB34
 skDQ88E3lhzPMAjdvztgPRxQH4tcGsnj0yvPB3Vu1VYmw8OMcj/1+SG/R
 6GCDVCd3PBQH13X+JwoMf1qfGrmZ5H63WMNWN5DUft9QAjTXVxtu5o2x7
 8O8NgKEf0P64Mdvs4GmXAK48F02xf0k36+7nHBBcrGt7S8iY1YjjHJvWR A==;
X-CSE-ConnectionGUID: vLBns+k7TKuX6l7+b0qLjQ==
X-CSE-MsgGUID: CC59sOIdT86NSIkryOHqcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="81381735"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="81381735"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:00:36 -0700
X-CSE-ConnectionGUID: JhnFp9cESwSvwqj+6GhI0w==
X-CSE-MsgGUID: c8VHWHh8RJa2P5gyA47WfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="231114270"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 21:00:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:00:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 21:00:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 21:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpPAwmKdZxlkQ1vxy+BhiCcwkUF031ISRlsAl3jB4nbbgmjbIMXuZcy3NdI2T1wdQ4J2kzKABGLkurCgCAuQKczr1b9KqHDuaXWGGj6pvvHKex9+teGTT2L0qLI7lvIPMwLzlZcFxhhoLoxBvJSGyGDo68QB9Q7R/Aht6KwCEKUPHEyFfwBQhCSIxjomxvYr6Bh8iGEG0kES7l74ZE7FYGf+RzNe+TIxyFk44Pn8MBA8kNdgctoZUa/yjAnAX36gym/1zN7KnQJqvJjaW62aF1eDQUnwyuxni7vIAY/7junpVSCSE+07FhAadbh5m9ql2ntgceZ+RX8qPUsPAZzspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq3lFvw4JZzLvVsIUBViobrJJst0GDpQH0ZMzc10GXw=;
 b=WnE7ApgdQ00Y1GY8j9pGz0iOXN+mfzO1FcfNurgk9ubf4iMFs2hcQjX6wPkDDPIuG300HQ/dJ30iXqKAZMnYGgK9XPnaYS3uY4MGi7yNYPhjAq+Ms5E+yFOLdKtT8yPmyQaBg9EWuO8YW4erQj82qq7KfMsNtUoI3MQ6xm6LyRCMMtTwEVegoguy3Z+0rccLNAo+ZN4yiXokU5Y5EEXaS7Qd7qE5C4ni3u0OfdnxhCoNCNJuN6p0HPhtwU3NXsfNTfxS9HMxgirHadokqNobyOPO6wYAcFlIozf3huHpxa3hLTHrYukKD8ShssVGYt3S8nd3mxLrsJ840N5Ip0boiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7818.namprd11.prod.outlook.com (2603:10b6:610:129::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 04:00:33 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 04:00:33 +0000
Date: Mon, 4 May 2026 21:00:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 4/9] drm/xe/multi_queue: Add helpers to access CS
 QUEUE TIMESTAMP from lrc
Message-ID: <aflrXldv_8ISzoof@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-15-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc54362-04be-489f-a303-08deaa5adaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: sWHm90Y2KjDP8HlwBwwhHg6r1pnBRS1oCoEOabbGw00ulGruWF45gtqbBJ83hASdlBqPFo6idE8w6b6GvDKZHLIj1w120h4JC76tV1eaCzympM5kqdvkg+48fCguMTY0is/JHz7KFTyU5OI2+U1swj5KmEjvUZqYycJLCgENA6Bc52enhPhG3Zp3TRca3bg6Ocp7mo3A8PflFc9TW+0vxlMxp/0mCdQ1KC18v9eSPMZmMXC+/51BpPnvP93y6P7C0Hkb819Rhyt3AsaOYwN3riWtZd3MkG00kGWvkZWUQ7GBV1mvXO1j7IMsR9ajSWFsWWsiLsEfqKy36nIXdasMxwhd2eAx2Rg6WdR1df09ZJdYAlJEUp8elTNnyh9qR9mM6feYJnENt5Upp9b31cUwoKtAks+STSZPnZrfotiPhgwaMwJNcwBkrGprUI9mv3LwBSFTJ4GT2NUneAJO2fHA8k6bO6AL5kojBGGJ/r86vVsoblaiJBcH6Ix4Hznb7jXsGSWMPYZXLY8fOkmbnGuaK/yODYpnFYcfXaNyHVsInQQ1vAKiR1XQ1Bf2VHtqBkfdUxPlYQ22Y+w94v5RBIhIljrzM5KR5IrP6eds8x8QbYCoitbv1pKHQtQ4EUpdl7p/xW6sw3klhDUeg2WuaeVkAR/cPviOdbDGbwX8FSF5ku3Bf2pmY8LraUmaZuIo2uK7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EiMhcPPU6r6OG4+4G+aMXo+mWlHHKkyRJugurkYiX03PS0X2wA7vMB9Lovo+?=
 =?us-ascii?Q?uxoa9SW7uIboaDbx06cJo9ylrnmjabZX3ZML97W9dOa6jupNSFXt0KS2rDGK?=
 =?us-ascii?Q?e/va1PeWEv8cCmw9OKLFZK/vx/DzzYJLkZG1eBmQNjASpDYfUZiORNLNdVYW?=
 =?us-ascii?Q?+MLQqFU5W5FZo8Rsbgmo+YUIvq0wWxVmDsbLsYO5gLR0Guk42klWhBR9n9FW?=
 =?us-ascii?Q?5uF1IndFLFNcmnsM3MT7pQ+wwPLsTHmtV8KviyuJyGiMQ2uLQk1vzVbxrYub?=
 =?us-ascii?Q?uHYuUbTzm9lrI7BbIRsxmkZGP9dwZiAsVuBPjBkGhfdsfDd5YwB36LV+Kx1s?=
 =?us-ascii?Q?e3tVnZbvQUqRaBhkrFsVmtD1KyYpEBlgNjQFWb0mpuO0nf30Gbpj9Cls5a9u?=
 =?us-ascii?Q?ToKaoH+TQR7Ngg80cDNeXo+wCpeNDsag5YG8QaK/8CQ/Ax09/hrFuebl+0+E?=
 =?us-ascii?Q?0+Y9IdJkCkG+X5MJ1kS8iw5ISGtwqUv6TKZ1Xtf3KzmHd5j6C87knLO4dkAM?=
 =?us-ascii?Q?T47kxW6GAKrPD7x/wHZbNXqXOb63TCUsyT8XZfXRA3SdJsH3uUhA3BApzhUN?=
 =?us-ascii?Q?/PQhGXi5Vw1GZJtr/7AYVYidF0mVZbuHwaOI1K4dWn8ZjYsKH2iuyRWKAmAg?=
 =?us-ascii?Q?6WW8wNkdCECyu4ptq/8uLf96CfZKjyYN2e/+GmYIRgmIvv2vln6MKC0RDbZW?=
 =?us-ascii?Q?kX8g6DUi7I+/6tIHJF3D6xWc8zldniTgc72UYpROQD4bcccIUBt8+iGHpEhf?=
 =?us-ascii?Q?C9tCbJb6vpqQmWuL8FZmeaS5XmnnNMNPvUPyTIq2dCZ+qRBZBB0nwSvMqUN/?=
 =?us-ascii?Q?viBw/nwcUjEzGPO+gZVeQV+Pu3Qr5h7r3LB8g4Mkcm/fayTHd/hgKumtJW82?=
 =?us-ascii?Q?Vd0Xpa33PXJfFaASTVYMoNLWhn7DXLlUL3rqUwA4WmIwmuv7O9khnjqbp0dx?=
 =?us-ascii?Q?wvPKF0i0M/eaxovaSHWE5uFFxWVE4s49T7eRJZITwYWrfTPyaE8lZdiId/WN?=
 =?us-ascii?Q?vCsMnaH+KP0skN+UPv7c7begaGHrA6T3mW5aI0uJSZRCLssifqeRSAXY6xFY?=
 =?us-ascii?Q?+6elrAMUReLBYB0K+4F24ucPwT1czGxIw1+2q92eff7fvZOff6d2CsuSQpP/?=
 =?us-ascii?Q?mWfADEZqhdAWKqhfzutk7mVoGN4tqNtPxL4CSEoHypg7pDWR2OMTM+W/twGY?=
 =?us-ascii?Q?RmgA0PrUh5EBNW1adB6uZWZOG7lFZCloAY7NoWQ8iXyBn4V8yYFUIL1Fv4vG?=
 =?us-ascii?Q?+L2MkJflNWJ967fyjhkSzhOdtfOoFB3g2I33k5t3eZB01PkZZn1Z+2qFH4ik?=
 =?us-ascii?Q?ofD9LgQd+1cvutSzMzGwLTY7muTJ1wxKZ75aYncoLA/03JJXugluN20QX7EH?=
 =?us-ascii?Q?5X3RELEQzKjdCe4Pc03Iy5ElN70wmn2vXTYt7kuIgLM+RAri/6XfSW06CeW5?=
 =?us-ascii?Q?qIcHY2PuM1J0BLPxajaJ3Q7eSDD/iy+e2P6RpAAylgFHzQR04mqkErV+jprO?=
 =?us-ascii?Q?gB6lNCUxVgHRss/f5OXmlGf1yz+LrPuIjAulA3jt7aeZZP4sZGVTi9WPdi/U?=
 =?us-ascii?Q?7VAdwFjag6fq0lzEVlfSdmZDO4TXg+B1gSwDaQYaT7DsGMIl8S7czT0145St?=
 =?us-ascii?Q?tXOkdJjbm6oLeq+gLR3HXdyvyfxph4HY69j6ZJ4eqpOCSaGjyXnev0l419xq?=
 =?us-ascii?Q?+Mb4UMHt15so/BityA9bBUgx5qY2azxGR0wkQkV1FGGCUeGrgW9iIJoF+dBk?=
 =?us-ascii?Q?fAa89YlXcewvDF44pObEiZVyy/xRBsmXRglMHAPGeZUhqKpaAeKh?=
X-Exchange-RoutingPolicyChecked: h1dKkdVU65XEAp5B6u+/DMkWveJW/kYNqykJjHHLZv8mPgdaG+bGSPni77Ilz4O1q07kMhsIZgDWemYZreuX55Hs7nsh9uJUIjH07hGUHttCRAlnbN26x7YxAgWyr/E9iW9Ur5G2dXvGEbQRi04h6BxPXyMHkFH6/RZm6kjXlugieXP3siZY7nzx+PIDAAL3xt+Swnf5HwpDHBkjvLzU7fFjWK9j4FEJlXVhrA0b68R915g0VPIi3ZvKE89ih4VPvmh++aNE2v6zqdTKOmq3+/SO1l4Hd7dxv/h/49md4o8gT5cu5mpLeNRoJMYQoaK1/eqFoGqO9qi463fiDJFalw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc54362-04be-489f-a303-08deaa5adaf5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 04:00:33.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zq0FPe1RUgFlAMJmu2wUFdynx9cxgbbg6PrbBQA4pipTiu/J58cNLWwurK7GR4ZUXd22zvSwpfHTOZ59c6unUF29PWa3xclm5xwTlLs78l0hXq6pBrkPyQNjaoCf+z9X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7818
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

On Fri, May 01, 2026 at 05:53:37PM -0700, Umesh Nerlige Ramappa wrote:
>In secondary queue LRCs, the QUEUE TIMESTAMP register is saved and
>restored allowing us to view the individual queue run times. Add helpers
>to read this value from the LRC.
>
>BSpec: 73988
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Matt)
>- Add BSpec reference
>- Make queue_timestamp snapshot 64 bit
>- Add a snapshot of queue timestamp in ms
>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  3 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 47 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_lrc.h             |  2 ++
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 ++
> 4 files changed, 55 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index b5eff383902c..4ab86fc369fd 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -34,6 +34,9 @@
> #define CTX_CS_INT_VEC_REG		0x5a
> #define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
>
>+#define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>+#define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>+
> #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
> #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
> #define INDIRECT_CTX_RING_START		(0x06 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index d85c712d106b..2ee52efb9219 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -789,6 +789,16 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> }
>
>+static u32 __xe_lrc_queue_timestamp_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP * sizeof(u32);
>+}
>+
>+static u32 __xe_lrc_queue_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_QUEUE_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>@@ -838,6 +848,8 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp, lrc->bo)
>+DECL_MAP_ADDR_HELPERS(queue_timestamp_udw, lrc->bo)
>
> #undef DECL_MAP_ADDR_HELPERS
>
>@@ -886,6 +898,30 @@ static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_lrc_queue_timestamp() - Read queue timestamp value
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: queue timestamp value
>+ */
>+static u64 xe_lrc_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct iosys_map map;
>+	u32 ldw, udw = 0;
>+
>+	if (!xe_lrc_is_multi_queue(lrc))
>+		return 0;

May be print an error instead of silently returning 0?

>+
>+	map = __xe_lrc_queue_timestamp_map(lrc);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	map = __xe_lrc_queue_timestamp_udw_map(lrc);
>+	udw = xe_map_read32(xe, &map);
>+
>+	return (u64)udw << 32 | ldw;
>+}
>+
> /**
>  * xe_lrc_ctx_job_timestamp_ggtt_addr() - Get ctx job timestamp GGTT address
>  * @lrc: Pointer to the lrc.
>@@ -1551,6 +1587,12 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
> 	if (lrc_to_xe(lrc)->info.has_64bit_timestamp)
> 		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
>
>+	if (xe_lrc_is_multi_queue(lrc)) {
>+		lrc->queue_timestamp = 0;
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP, 0);
>+		xe_lrc_write_ctx_reg(lrc, CTX_QUEUE_TIMESTAMP_UDW, 0);
>+	}

lrc->multi_queue.primary_lrc is not set yet at this point.
So, xe_lrc_is_multi_queue(lrc) will always return false here.

>+
> 	if (xe->info.has_asid && vm)
> 		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>
>@@ -2479,6 +2521,9 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> 	snapshot->ctx_timestamp_ms =
> 		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
>+	snapshot->queue_timestamp = xe_lrc_queue_timestamp(lrc);
>+	snapshot->queue_timestamp_ms =
>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_queue_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2533,6 +2578,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);
>+	drm_printf(p, "\tQueue Timestamp: 0x%016llx\n", snapshot->queue_timestamp);
>+	drm_printf(p, "\tQueue Timestamp ms: %llu\n", snapshot->queue_timestamp_ms);

Same comment as in patch #1 (Timestamp ms).

Niranjana

> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 3d0bf4a7bfa0..12d08808ac75 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -38,8 +38,10 @@ struct xe_lrc_snapshot {
> 	u32 start_seqno;
> 	u32 seqno;
> 	u64 ctx_timestamp;
>+	u64 queue_timestamp;
> 	u32 ctx_job_timestamp;
> 	u64 ctx_timestamp_ms;
>+	u64 queue_timestamp_ms;
> };
>
> #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 0a5c13ec2ad7..53ef48feebfc 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -64,6 +64,9 @@ struct xe_lrc {
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>
>+	/** @queue_timestamp: value of QUEUE_TIMESTAMP on last update */
>+	u64 queue_timestamp;
>+
> 	/** @multi_queue: Multi queue LRC related information */
> 	struct {
> 		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>-- 
>2.43.0
>
