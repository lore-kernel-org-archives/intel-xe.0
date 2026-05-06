Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1684FCD3427
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE96910E144;
	Wed,  6 May 2026 03:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WAHF8qlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1127510E144
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778038211; x=1809574211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MZzzNnqIKl6NCCIeWSJMhK7UB5+TxHgZFuOJf3tTeig=;
 b=WAHF8qlhSws+PdyxKER6winl10ohDVtX/3h7ON5nn1C/qZFryglysLjk
 z15RtLZ6Cp7P6fnohBxng5EN3pi2SWJxW/2Vvn2j1K9sfnCcLbuejOCAq
 Cm2+4Ifygz4Du9F5y3Wz9BnO/PjFL34bqUW6vJeQQi23UmowK8qOAUlQt
 2HOR+jxukpBjT9EOmuRymFStUh65nqZkSLWePpdH/hxpm/yDXpbt7k2ry
 /ZA8u3bbte5icdUPz2K5BVAo4k93l0anADZe7zed4Qe5Y8BAotGpPjJWM
 v2Fjjbs47+egKGs5z9JTmBuSNOtQN+5Y4WVCJ4b0l6msFI3/VqDfR5iCp w==;
X-CSE-ConnectionGUID: /dUp4kHMQ9KF4sntBrRHQw==
X-CSE-MsgGUID: jQeHHpAXTqKTdFYBSvayBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78076847"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78076847"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:30:10 -0700
X-CSE-ConnectionGUID: stXHQIVHTa2/Ghw46NkP1g==
X-CSE-MsgGUID: Q5u3/N6+Tz6Bd+NNbIroAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235123361"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:30:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:30:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:30:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFEord4QH2HVZX8tK5s0/xNlBrUyybxqV9p6301UCOUiQNqOpgielnWiTj9Bxn2vpflDdDr6FgLHxEl6/1rLZni6Vz9RG6M8NdXyKCeMzP1Yf0fCDZUd4UlSeT/L/gn9yhDtkADnha4qvFJ2CPAvv5yC5jVSzY87YeCQvKxs0cTYeZgnZmrORBHrp/G8lcbnzZf9vGTsW8GaeWLmCDkn7p0OMiU/JTGsf1W+WXWV9nDPsh89q6jNo1egC6WmKWmsjB0KhlkxrVkvVdYwh0jeeBhoCyKI6ZV9eI9hF2XIw+upzK2/mqV6sWg8tTSRd0TK/MKG0Mff8RneoZRySZevNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKuKyaa+/eXSAS4/lkAh9PdA+Y4h+temSfLAe5O5lTk=;
 b=RJhpfPu/QOUF4ehsiV0OFK2shJ2xCXW9EFRJ5P8Wt6KE+Wjfsbbj48FDW66I8yGWNJhCnYhSL3hjLt+BdjvFsjR1lRzl67G5VwyVlat/ZzxMC336sK7VaL6oyx0S4dfo3kmYUuaH4wNyA5c7c5yDKkA5djlDlmjXcllBaeTjmRSTS/xG7QQwuWQLyL6fjsKF6VTti5KRVrfo0m9LcxR7rUhb1XwUVeRlLaYom4S8dcjeRfXpRbuBnET2CSwEDD/IzCbGT2NZ8uZcJx26v2yGyALhmebkY262277yyKZcwQxNC26kJ2SrfBeSOmsEZ/OHSjUO7mQ97XIEPNR1L4KQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSVPR11MB9695.namprd11.prod.outlook.com (2603:10b6:8:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:30:08 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:30:08 +0000
Date: Tue, 5 May 2026 20:30:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 08/11] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <afq1vctg2_jIicRf@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-21-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-21-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSVPR11MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: f649779d-d3dd-4314-e119-08deab1fc5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: GvWlBo6XBzVw90MYmgLnSfeAk24SyvyCAWFuqjdBRWY/+97XfKZnhGQtqCHpE9Lf6NlsKsMCLauMFbafRmZH51gubanru3XCPVLkJmWWG94N7smxsYqJiSG5lj0Niq7cElC296G32WiGpQKbpgCvHiR+JHt/Gqbt/Hysf2vo5QulgTHm7l8PD11lX44msM1y/ZtagTj7Sd6jAjvfO0nReANvYZN2d7DJWsaq7GVOW/K9WqNM979hTlgrRYXFeEkyaCNKQqaIWrrhw8P0/Grv4TQSjtUuKPcJ8qeTQo9nNFFxbMpxTowaQzBduQ3qytZARNGIBTcJx/6FEscp/9ExScjIEosIctubIqUuInsiZCdZ3fKtRsrJD9fAMtWuTMZfE6GaXDy2oiWtWuJGht1nAkcCWNAS1C2vgcfEQZRzSMLJFA/cEdeq4tstQCFOjfFMMfc3L4pQ1W2UR6dWT9rSajrJSLkVUKNFV0klrgp7n3r4q+V7JZcoNWer41EeF8uhTd8kFZMregQOdUxrOcO3KAVb9QsdicAlfnTX/Cx9kPs+5jpw3qPD3n5Jy8z0STdXlCXRVetDHrXlMC7RDj2sezDONRUiaz/RvBQBVdK8yPGFJkTTmoW8jrWqQLkToZFE+Pq+Q/mgLmzjkJ3Qfy06YJIvYWPQ+07Hm7uMxphphfEx8tSMCJs62Qvq6v3boocW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i76sMWyy5g+55KsW7kZJ12/dQWwksQQArQPh/kFwKEJ/mb43DlzqqKDmNWug?=
 =?us-ascii?Q?GnjCHSQA5Uh2fj273m17VWlcicvd2LozgbdghPHZamiRZLhc7Yyvhsf3LKiZ?=
 =?us-ascii?Q?2jDC7zaAE+B2s1UMrcnT4S4ZSfNhj6RsO/DrZwN0092zCmraMfL7iJ6yJ3db?=
 =?us-ascii?Q?dNmp9em+M+czbeX20vyAG6mUA2phnfI/zpxrsJwkgtTSL6c7OTJCuptVUr4U?=
 =?us-ascii?Q?hFqnNR1nj/q/aJLMeJCKSHnHFSPeC5v3kO2vPsRJJPlyRUGFTwuB9jM2gVYP?=
 =?us-ascii?Q?f+zrAEpssjWqnTXBBVM46A89augMAZSCuwThsyMqiVb8UJ9X0UqEzOat/Ai4?=
 =?us-ascii?Q?FtoIoZbL7D8mgKU3/XWifd2hOlE5fA/DRj+bc6uc+NMQDS/tfx2GQzRkC6IN?=
 =?us-ascii?Q?CXwidIbmQpi3O2Jcd+GRraDUZoWhwiaTuGEBmLTMvms76J1oyo8KLQZTx8Lx?=
 =?us-ascii?Q?2RAUDloHBsg2AJE8VefniTFre2WD8VJ5DMnQB2AMZO9/bYFCCvc24FJ/CkCG?=
 =?us-ascii?Q?WV+MpK4I//VwEB+uOkpkPRmAvaL0semykSlvVjIEwrl2ZdsZxLkIDhIga3wS?=
 =?us-ascii?Q?ZMz2yABBXFUnEKWc425l0xEc6BEcNmB7ANAFoIew76i4auSY4TO4HBk1XbXx?=
 =?us-ascii?Q?ZM1EyUDPg8vwpFMgM+4fx/unaKA80RMaRvjoxasARuC/9DGQ8QG+HPhOxe18?=
 =?us-ascii?Q?IcAkHYsq40Ad+wbFefynmI6b8nFDV3CxsHzw4mIYBa18OSTFXNCbnS02Q4f0?=
 =?us-ascii?Q?QrojF4vWEijQBlwncle4R0n+kavQH1zpKPww1BocUEstZfd8GnXE4W42+qrC?=
 =?us-ascii?Q?mfXDuyF+7xqAzcWN06Fn+c60plutRaphgqeSrG2UjnMWhoT0NqmrylWcKc+J?=
 =?us-ascii?Q?21YzyvOTNFN2+l64eIxLopz+y9A3errIRnJW6dy1DHeNYrZXNl3faHCx0GoY?=
 =?us-ascii?Q?KDFC9DMfVq3oTlSzXqZgush87uedCKuywnkz051HUsnEDo41QZPBeNwBj0y1?=
 =?us-ascii?Q?d5oY8+NZ1OmPD+EUVgFlsPEThEcQJubAj2XaYqZUOWV35l1Uu5Z/eIcKi6zj?=
 =?us-ascii?Q?otW7U/hyO524hbbYSGB7e1yMYHqV2TrBWsfDbT3a2ID1oFbNKeCPHGYgei7K?=
 =?us-ascii?Q?qeQORdJJ+CT6MDI79FPe+yJ/e5b4IKypaTNZUBkwptKPJb0Rde5WKxJbT6AY?=
 =?us-ascii?Q?YC/jWA3YRUZlPgFCGYN+PVPqhka5M/t4NI7SxizWaGYXn3sDPP4tn5S3PiPg?=
 =?us-ascii?Q?jS22Q/oEde8q2e9nIEcKcd+rznuNKC+9YGBST/pCtTwpPjU0XXK65DkAWble?=
 =?us-ascii?Q?TOHY20aUjnHDRXZ187E4VimAMS+APc887s92E6Zmc/Po/lPP1kZLaSipiFXq?=
 =?us-ascii?Q?tDvLBSk1t7FJqJFYS0NqPjLA3oIrWRT7GMzR4LrpQO0HjyhUD0c8dMssfzCe?=
 =?us-ascii?Q?mwHIlYTpUvdA+HPhzNTcDZ3HvTEUTUylhsdDW4npDk+6lpTImBCK1VmfCH27?=
 =?us-ascii?Q?7muDKmWKhCh2ZxWAxCtvaNAYvgay5nJAasN3ht01iJxc3/w/zKwXvZBrzaYP?=
 =?us-ascii?Q?1zPIHcjQQFDxi7Y6bCXyrJA6CmEZsfwV9zRLfZRNfH8fr1DLvK42j+n/9ItL?=
 =?us-ascii?Q?3DhAhaEYHew2ZluJT0clC+26hWx5u/m06WkIt2ep3+CcyVS67okmq+E0Vp7g?=
 =?us-ascii?Q?syUgpZCnmBLNX9CxZHjhaFMSu5E4QAGB/Osycy0wT1ZVDPRNRCKCtoHhJVDo?=
 =?us-ascii?Q?3G95L/XiDDbJ7mglcwrAZv9HZcBT7CuG1yZSUPZ0Py8Oj1cgQQhO?=
X-Exchange-RoutingPolicyChecked: T/0OpFNxaaMK03PVy6aQn6snG6/rTVWVscrN8uIt68K7OipMU7gEox674lKzTyqpvIbr/tMq9ns7kxwXUskcinqjyHV6S84CGFBBW75ooCO5ue41DvOQ9+xd/fDDyVdQq/+27ao4nRCGDxfdorO5tnjFhIbn/P1VT43WLN/Gp7IWJZzJ6ObSbuwltX/mX2jB+lAxT6zC4Fcz+gilZcZJBXdqrQTLFQwsWp8vDPGWslieDa7+QKnp+8YtY9yQrvV6Lm+i7g4fO2PkNzYNuolepPuxdYgiONX18N0JxAoGprabpRuSnyPbLCFkXIThmdDKKwssxuccadacS6PUtKbgjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f649779d-d3dd-4314-e119-08deab1fc5a0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:30:08.2942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZHedZH7htwF6NnjEJMYAz4DkY5zLEAeYqOy4qiDbC0LgxU2U1XTC3oqKEDpzd7rOuMTF9wfgnSg7FC22vE6VGOXbPxcRvB3M7iB6QQ2B12hhTcAG6Mgxb5TN11uk5nR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9695
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

On Tue, May 05, 2026 at 04:44:17PM -0700, Umesh Nerlige Ramappa wrote:
>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>register to get an up to date value of the runtime. To do so, ensure
>that the primary queue is active and then check if the secondary queue
>is executing on the CS.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Move trace to a separate patch (Stuart)
>- Refactor multi queue timestamp logic (Matt/Niranjana)
>
>v3: (Niranjana)
>- s/get_queue_id/get_multi_queue_active_queue_id/
>- assert for primary_lrc in xe_lrc_multi_queue_timestamp
>- don't use the name single_queue
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
> drivers/gpu/drm/xe/xe_lrc.c              | 113 +++++++++++++++++++----
> 2 files changed, 97 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index c4c879a9e555..94033982e694 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -170,6 +170,10 @@
> #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>
> #define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>+#define   CURRENT_ACTIVE_QUEUE_ID_MASK		REG_GENMASK(7, 0)
>+
>+#define RING_QUEUE_TIMESTAMP(base)		XE_REG((base) + 0x4c0)
>+#define RING_QUEUE_TIMESTAMP_UDW(base)		XE_REG((base) + 0x4c0 + 4)
>
> #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index e7f7f0efcf2d..28060a3d4f11 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -21,6 +21,7 @@
> #include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gt.h"
> #include "xe_gt_clock.h"
>@@ -2641,22 +2642,68 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> 	return 0;
> }
>
>+static u64 get_queue_timestamp(struct xe_hw_engine *hwe)
>+{
>+	return xe_mmio_read64_2x32(&hwe->gt->mmio,
>+				   RING_QUEUE_TIMESTAMP(hwe->mmio_base));
>+}
>+
>+static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
>+{
>+	u32 val = xe_mmio_read32(&hwe->gt->mmio,
>+				 RING_CSMQDEBUG(hwe->mmio_base));
>+
>+	return REG_FIELD_GET(CURRENT_ACTIVE_QUEUE_ID_MASK, val);
>+}
>+
> static bool context_active(struct xe_lrc *lrc)
> {
> 	return xe_lrc_ctx_timestamp(lrc) == CONTEXT_ACTIVE;
> }
>
>-/**
>- * xe_lrc_timestamp() - Current ctx timestamp
>- * @lrc: Pointer to the lrc.
>- *
>- * Return latest ctx timestamp. With support for active contexts, the
>- * calculation may be slightly racy, so follow a read-again logic to ensure that
>- * the context is still active before returning the right timestamp.
>- *
>- * Returns: New ctx timestamp value
>- */
>-u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+static u64 xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>+{
>+	struct xe_device *xe = lrc_to_xe(lrc);
>+	struct xe_lrc *primary_lrc = lrc->multi_queue.primary_lrc;
>+	struct xe_hw_engine *hwe;
>+	u64 reg_queue_ts = lrc->queue_timestamp;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	xe_assert(xe, primary_lrc);
>+
>+	if (!context_active(primary_lrc))
>+		return xe_lrc_queue_timestamp(lrc);

NIT...May be here too we need a comment like below that WA BB only stores
context_active cookie only for primary lrc?
Either way,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>+
>+	/* WA BB populates engine id in PPHWSP of primary context only */
>+	hwe = engine_id_to_hwe(primary_lrc->gt, xe_lrc_engine_id(primary_lrc));
>+	if (!hwe)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos)
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	/* queue is active, so store the queue timestamp register */
>+	reg_queue_ts = get_queue_timestamp(hwe);
>+
>+	/* double check queue and primary queue are both still active */
>+	if (get_multi_queue_active_queue_id(hwe) != lrc->multi_queue.pos ||
>+	    !context_active(primary_lrc))
>+		return xe_lrc_queue_timestamp(lrc);
>+
>+	return reg_queue_ts;
>+}
>+
>+static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->queue_timestamp;
>+	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>+
>+	return lrc->queue_timestamp;
>+}
>+
>+static u64 xe_lrc_context_timestamp(struct xe_lrc *lrc)
> {
> 	u64 reg_ts, new_ts = lrc->ctx_timestamp;
>
>@@ -2674,24 +2721,50 @@ u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> 	return new_ts;
> }
>
>+static u64 xe_lrc_update_context_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>+{
>+	*old_ts = lrc->ctx_timestamp;
>+	lrc->ctx_timestamp = xe_lrc_context_timestamp(lrc);
>+
>+	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>+
>+	return lrc->ctx_timestamp;
>+}
>+
>+/**
>+ * xe_lrc_timestamp() - Current lrc timestamp
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Return latest lrc timestamp. With support for active contexts/queues, the
>+ * calculation may be slightly racy, so follow a read-again logic to ensure that
>+ * the context/queue is still active before returning the right timestamp.
>+ *
>+ * Returns: New lrc timestamp value
>+ */
>+u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>+{
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_multi_queue_timestamp(lrc);
>+	else
>+		return xe_lrc_context_timestamp(lrc);
>+}
>+
> /**
>- * xe_lrc_update_timestamp() - Update ctx timestamp
>+ * xe_lrc_update_timestamp() - Update lrc timestamp
>  * @lrc: Pointer to the lrc.
>  * @old_ts: Old timestamp value
>  *
>- * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
>+ * Populate @old_ts with current saved lrc timestamp, read new lrc timestamp and
>  * update saved value.
>  *
>- * Returns: New ctx timestamp value
>+ * Returns: New lrc timestamp value
>  */
> u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> {
>-	*old_ts = lrc->ctx_timestamp;
>-	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
>-
>-	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>-
>-	return lrc->ctx_timestamp;
>+	if (xe_lrc_is_multi_queue(lrc))
>+		return xe_lrc_update_multi_queue_timestamp(lrc, old_ts);
>+	else
>+		return xe_lrc_update_context_timestamp(lrc, old_ts);
> }
>
> /**
>-- 
>2.51.0
>
