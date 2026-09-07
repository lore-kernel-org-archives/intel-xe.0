Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D65C79F99
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 15:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DFF10E197;
	Mon,  7 Sep 2026 15:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMaL0DrP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4E10E197
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788796742; x=1820332742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AVlFa/3ibawji05C1XSsNPHrtUhS+JVIHeW0ys32AoQ=;
 b=MMaL0DrP59NN8EQG9A5wTA9xcdpfidx0tgwLFslmu5jRWRL1e0H0WDIM
 bBRW0OgI6mCVnvRYRTwaeRYtpt0/lYi/4xhpa+CXr4KPmg7qmfJESIxeC
 1LugjC3cM+Nx0mvhY8UityZdAPpOtowGly+yVAYESEkfDVRUjX5oeZubq
 ChlQ5Zq15bM7QVLW5EbMXcQWIKSIcalJAtyh2/QCCwd5TU/d8iNG1PQhg
 S41vE5S23wfkT8kDauXI6W8dYGUtt/klQyE2C9j+HFqRl7uO58GpZ9qzK
 FsGyhHgPlsW2IFjSoB2/e5DJn1YC1uBMKRlLrzlWB/dlZbFQsjxwdiwV9 g==;
X-CSE-ConnectionGUID: Q10RxcPvSoq5uiIHBzvCXA==
X-CSE-MsgGUID: NLl9svf/ShK5s+k9/XHNXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88350452"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88350452"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:59:01 -0700
X-CSE-ConnectionGUID: EnsdtwCBTVCcyrdhvxiUWA==
X-CSE-MsgGUID: HQ7MFqgPQiOtuy3mE1RFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="271275554"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 08:59:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 08:59:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 08:59:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 08:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcstbIAMi0izBf7Inf7V46l0ttG/X+zUUp75sKxqbbHtk8gr5ARVF/x7wB6bckdh4RxzQRA2KSH3NzrNy3kq4UC2Q5FMZaGD5PN6anr+c6u/F6A1rXcN61R5hItPhiKjec/SG+waelbleiSpT0WxxSGQHGvl9wKKzmtaFB0keOJKBqFDi/JDQRetiXydEG6C8J8Fzc01n63HqMr2FBByQiE6k4t+ji70U1uUH4aucq0ggbhMITLSTai11EZWEJZZd54NtAqaPuopAnG51w0Z2YvwyUC3I1N8jberaQfYMisLFi8JDcvnY5Do2wtx/e46Z3kT44njaSDtfPp6Jgveug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=487FFV55HGdZu0Q0tRrFu36tg3oQ3ZyuuituHVsWvq0=;
 b=yKR3ENbM6nTLkOeoHL3DE8PXr0jtUsG7sh5lLy91WRcesZqUY0MBAJTt59uWv1XXtZashB0aUhdOBIbODA6RIM+5WigWzv/GqFpOXqJ20P4JocTju7tEWXmEuoG3AcIrqri2EvNuHP4ORXJKTM7zTlm0bSZLypc+YzjJzeZkdxn09tt3/CYC3y93CEHfLOGnzET26/vgDdWqXzDP3t9Hv/Kke8aKeyuuFBoxmCVDzm4GctDPWsnBGnFTOxjh6kZvU/87GGHYziw5SNwQf0/Hsx2QAO/DJtZdJuiFRu/8Uk9Am7LCxVXVbc350hb3f4s754hxZW8R4hDZ3IQrf8gkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 15:58:56 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 15:58:56 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Topic: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
Thread-Index: AQHdPs929GNiiaNjhUurM4BpblsJq7bDRbPw
Date: Mon, 7 Sep 2026 15:58:56 +0000
Message-ID: <DS0PR11MB87186FBD6BDCF9883B2F9D8981B22@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260907134719.999549-2-varun.gupta@intel.com>
In-Reply-To: <20260907134719.999549-2-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|PH7PR11MB6698:EE_
x-ms-office365-filtering-correlation-id: 8e7edb04-1df8-4342-5aa6-08df0cf8ec53
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10070799003|38070700021|6133799003|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: cuLleUXOA2wIKIDowvvV5KuPJennGJy+bh9F2Qppc922jBcVYrKW81CmI/p1JCibpBf6Fhfzdtqp6hDgyXwbc4YuRaPi+3ouVO8+utDrUBrqlLJ9zChO/jjf6qom9ckbamckBJjPvNzkTRMKBVoRWdm0F0ol0HCTx5L0az2iFvB6Na18e5wF+YjPYVz8zjyPnaUWiffRgIday1Pj3rKWIHKkscAe9d29vHVAtowYp272YsfEnlNQA5bEQrD/gFq2/EtOofdijdNsrTNQSQu3B3+/8fHXAAAbejzBEuhNf9aGcUax+bUSPkw5ZCy0BTz/jfEVtQvJqE71p1XofGqPk1JPfsCzcs6fqHC2XXzlcrMI9Ysi4/WBsN3v5vP90GzqOL7v3lmCsZKPg9sv1WalRb987D+A2SvtSC5Ire21zQs9L3pzI6z1SWg7al+0XqN9T3ELdNHBGOtEFM5uDysTFbbdu2+f90ArgKhx2EfYeulViZvG15r8rlYnvnvvgMjzQ6T9aeK6ATI7/ij3layCKQEOQRypFHSUjrs2IUa3A9PLv+gN35Xl8IvIN9ibQCX+OhZ+vQrK3DSYvxS/YfexxSOpHJv5RJr/OJHADhMiMSAMZWrRrVlJ5U2lsqrdjJTfACxD2lViVa3jvnquHrGUT7DwBXCjGpHqiK0xgJwwppUtek6S79Dm73zNmlJPynMW3F58/+z9VspftYxR7bXi/dsz4kiovCdIWYalmjz6sUc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(38070700021)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AQr3UkrIGGIwNLLPEcPiZopPZhuoYskSztp/IOCUOGeuqCoAZrNgY5p6Oo3m?=
 =?us-ascii?Q?yEIjGKN+YLWA9dEyU6owU1q7CBw9WLQe5Zt9pJsq8mpJVHnnkfWTxod/LFTA?=
 =?us-ascii?Q?TCs31zZy/bVBz+/jvLUWO+aaHBTZWHvPG0wYDBGkoFkByKUkIvA1KmGs/dSW?=
 =?us-ascii?Q?eiN+RjfFQNbK45gAlkuncPcB8woNUFtzrlcvGVb4rdsG9UElNXaHjAv1gzWv?=
 =?us-ascii?Q?AOUsnmoS5RRkcYz4vAPPdq5HDvUghA8prampj91lEMKwrRDiEGB1KMh9X881?=
 =?us-ascii?Q?3OWKRcAj/z/xqLYs1JyjpW6CuH2udY/b5NE6HmPZiaqteZJubIbAWmq3OM5O?=
 =?us-ascii?Q?CofpnofYSgYSrL6S0GU7MeloOVs12kYrUYc332Cyw3Ke7d/wNanS8avSN3nd?=
 =?us-ascii?Q?bUcZBlux4KbY5gY9hAtvA9nQay3PtRqpdUr4tXmG646lOzncdU57zPXSVpvm?=
 =?us-ascii?Q?GdwgwYwQGZqlaO9/498HoKfmQJtqwtwNKBjWxyYslkC5m60GQ+pzTqNag2L/?=
 =?us-ascii?Q?2ne7un1q8F1nhY8rZBZJPGvbEx69JOEO8l11yr7kiy4xTT5HaDPPkW859g85?=
 =?us-ascii?Q?9NHt0cO5jAACKkUlqntm6ju6AbATkR6Huz5PoXOJgxwF47Mg4/RGc3fv0K84?=
 =?us-ascii?Q?fJmGlshDhj+SeHjO37ILzZ6aM3vpHY2ExJoqqON+bbVJ9aey7lIcEsZLIQRJ?=
 =?us-ascii?Q?G02t9X3oexkEfLzqKQhES+LYBHMkPuxgXR1n7yeg1WIgE6dZ++7Z8Kcw24FW?=
 =?us-ascii?Q?AwwMf+/VNsNeb7//gJFYUyGMRyOyYA1lDxsiCdn/fscpRd8QsJxXrGzeCJIS?=
 =?us-ascii?Q?GBFwhT1dVmnEjdcuj5RsgLIuiH15YET2eTr+8I1AVfPFmTD2hJhd7YFqbNrG?=
 =?us-ascii?Q?dg1uzD0lvQop++RMJhJTsnjIu4CYHG6bfq0QwZdQi6WjIHk7zYQKkLurKZ2I?=
 =?us-ascii?Q?JvZ1Pd3WmYfmlsNMbTU2hi5bfMUVvOHS/BOSZ+vnoarY0DNe3/XID7kq1ibB?=
 =?us-ascii?Q?f2CTZQvbTrSpDSj47qhdWNsmoN5zXt9L4SMad1bx/53tH2HhGAZ7jllAoVW/?=
 =?us-ascii?Q?5TRYZvI1/DhrA90vXcx3D2ruPE9GVYGY70d/Y7o+njAbONjbySxQDa0CjXf7?=
 =?us-ascii?Q?a1KXRJWV9B/Sm5kDEHBuZe6KevGF4TFksDJZGlPRZaEGlk47i2cO+Rn3hK68?=
 =?us-ascii?Q?NYMuQ/AmD6oG+ZITTULaFoRn8/mndcHt+j7REX9xgfklB5D1y1rY3Pd3ttgV?=
 =?us-ascii?Q?q8aqOPJHOzw1iueAmnzSKx11r5HGPug5eL0clEcXdUGH/dNmWGeh08xLRd20?=
 =?us-ascii?Q?uGyycGnQNigtdb/BUDBZBD9AfudC6tn+FCICDwavNN11cTIDI6hIEw1Ig5cp?=
 =?us-ascii?Q?VB/nRRGSPceLobLFfbyPAuNQ1rmA9fZs1ygeSuXABZOgXQPoEzWGsSl7ZchG?=
 =?us-ascii?Q?KJESKyQ2KVl6a8UK2XBfjnv0GC1vV9BMVs4IOD8gqVUo4e0tz0DJqbXCTCYn?=
 =?us-ascii?Q?HyywtsW0PNI0tq/B/7XBq2e+YKC26zUqCulauxHGacZIdgojm/NYst3gAxcV?=
 =?us-ascii?Q?WFz1Dk0r9JrBcNhWNo5YK1WV5Z0BwoQySW1Aalsc3oFnmdOJ+6vkZ4zAC08d?=
 =?us-ascii?Q?XsP1qxfySXiS1CPLvuWoKZcMhSXkhNQnWQ/zYxH90hbWrz7oIv22Jabv3Zaz?=
 =?us-ascii?Q?5fuvsyMpwS+zlQ86pDXoC8/sRPWOXZGdOnSA5EHPr6gM4rH+H06Q4QxC7rCx?=
 =?us-ascii?Q?ddRdsCuYaVyYozpQcLntcK2COExnmRPU8YObtvkIhLuxcvzNwyjr/xxIiWag?=
x-ms-exchange-antispam-messagedata-1: eqovr9CMqaLCOg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LIfGby/HKckde1XU7Vyg5eESUJc+VUGBg0xHaHM4+BQiXsXmncCRfiArMjx8I+eokHJa+x4ATTsWAFGm+prF0Jym9IbgwiI9gan0dma2PvHuZlDcF1lag9gFXmGIJ80OW5bbz86UHaG9hqRHxqQDMZOxAA1To3Q1J1x3UZvipgCAM3vGG5/r5oCOLWdI3dn8xHD3lvO7mBR+RbIhChStlQlv26X3mU6XoXYNhCvISB1uBRldVbgYTpyLHte1b/qa0c/L/DQsEH+kKfNRTLwBUx8sWravqhX6RU5CZa6KC6bXBJGo9AIcPu5hUZbJMf3RZ79/gE6scbZl2fpGDWTESg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7edb04-1df8-4342-5aa6-08df0cf8ec53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 15:58:56.5704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/V7MmGiVIdaOKMbA9O+QhT6wFXxtYIMpenDiQ5esQwpl0C8Ty/jeqcDveUlF7Gne9XnS6hlUSEXK1/PKnfsYdxwlLqHL/kzMGZ6a6kYXzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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



> -----Original Message-----
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 07 September 2026 19:17
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3] drm/xe: Add multi_queue_active_lrca debugfs
>=20
> Add a per-GT debugfs file, multi_queue_active_lrca, that prints, for ever=
y
> engine supporting multi-queue, the currently active queue ID
> (CSMQDEBUG) and the LRCA of the exec queue occupying that slot within the
> running multi-queue group.
>=20
> RING_CURRENT_LRCA only reports the primary queue's LRCA for the group
> and does not update to reflect the active queue in multi-queue mode, whic=
h
> makes it hard to tell which queue is actually running when debugging mult=
i-
> queue CSB/context-switch issues. Resolve the active LRCA by matching the
> primary LRCA against each queue's group and picking the queue at the
> reported active_id position.
>=20
> v3:
>  - Use xe_exec_queue_get_lrc() instead of raw pointer dereference to
>    safely handle concurrent multi-queue group creation and avoid race
>    conditions (Sashiko)
> v2:
>  - Maintain alphabetical order for includes and
>    pf_only_debugfs_list (Tejas)
>  - Export and reuse xe_lrc_get_multi_queue_active_queue_id() instead
>    of duplicate MMIO read (Tejas)

Please also make sure this isn't visible on non-multiqueue supported platfo=
rm. Because there it has no meaning, correct!

Tejas

>=20
> Bspec: 60321, 73976
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 46 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.c | 73
> ++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_guc_submit.h |  5 ++
>  drivers/gpu/drm/xe/xe_lrc.c        |  6 +--
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  5 files changed, 128 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 361a70234d1f..d7d6f50d8dab 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -13,6 +13,7 @@
>  #include <drm/drm_managed.h>
>  #include <linux/math.h>
>=20
> +#include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -25,6 +26,7 @@
>  #include "xe_gt_stats.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_hwconfig.h"
> +#include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_mmio.h"
> @@ -130,6 +132,48 @@ static int hw_engines(struct xe_gt *gt, struct
> drm_printer *p)
>  	return 0;
>  }
>=20
> +static int multi_queue_active_lrca(struct xe_gt *gt, struct drm_printer
> +*p) {
> +	struct xe_guc *guc =3D &gt->uc.guc;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		u32 cur_lrca, active_id, lrca;
> +		unsigned int fw_ref;
> +
> +		if (!xe_gt_supports_multi_queue(gt, hwe->class))
> +			continue;
> +
> +		/*
> +		 * Forcewake is dropped before
> xe_guc_submit_active_multi_queue_lrca()
> +		 * below, which takes guc->submission_state.lock, to avoid
> holding a
> +		 * GT forcewake ref across a mutex acquired elsewhere in the
> opposite
> +		 * order.
> +		 */
> +		fw_ref =3D xe_force_wake_get(gt_to_fw(gt),
> XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref,
> XE_FORCEWAKE_ALL)) {
> +			drm_printf(p, "%s\tforcewake failed, skipping\n",
> hwe->name);
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			continue;
> +		}
> +
> +		cur_lrca =3D xe_mmio_read32(&gt->mmio,
> +					  RING_CURRENT_LRCA(hwe-
> >mmio_base));
> +		active_id =3D xe_lrc_get_multi_queue_active_queue_id(hwe);
> +
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +		lrca =3D xe_guc_submit_active_multi_queue_lrca(guc, hwe,
> cur_lrca,
> +							     active_id);
> +
> +		drm_printf(p, "%s\tactive_queue_id %u\tcurrent_lrca
> 0x%08x\tactive_lrca 0x%08x\n",
> +			   hwe->name, active_id, cur_lrca, lrca);
> +	}
> +
> +	return 0;
> +}
> +
>  static int steering(struct xe_gt *gt, struct drm_printer *p)  {
>  	xe_gt_mcr_steering_dump(gt, p);
> @@ -249,6 +293,8 @@ static const struct drm_info_list
> vf_safe_debugfs_list[] =3D {  static const struct drm_info_list
> pf_only_debugfs_list[] =3D {
>  	{ "hw_engines", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> hw_engines },
>  	{ "mocs", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_mocs_dump },
> +	{ "multi_queue_active_lrca",
> +		.show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> multi_queue_active_lrca
> +},
>  	{ "pat", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_pat_dump },
>  	{ "powergate_info", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D
> xe_gt_idle_pg_print },
>  	{ "steering", .show =3D xe_gt_debugfs_show_with_rpm, .data =3D steering
> }, diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a39dcb85e3f4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3853,6 +3853,79 @@ bool xe_guc_has_registered_mlrc_queues(struct
> xe_guc *guc)
>  	return false;
>  }
>=20
> +/**
> + * xe_guc_submit_active_multi_queue_lrca() - Resolve the LRCA of the
> +active
> + * queue in the multi-queue group currently running on an engine.
> + * @guc: the &xe_guc managing the exec queues
> + * @hwe: the &xe_hw_engine whose active queue is being resolved
> + * @cur_lrca: value read from RING_CURRENT_LRCA, identifies the running
> +group
> + * @active_id: current Active Queue ID read from CSMQDEBUG (position in
> +group)
> + *
> + * The running group is identified by matching @cur_lrca against the
> +group's
> + * primary LRCA; @active_id then selects the active queue within that gr=
oup.
> + *
> + * Return: the LRCA of the active queue, or 0 if no matching queue is fo=
und.
> + */
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	u32 lrca =3D 0;
> +
> +	/*
> +	 * submission_state.lock also protects exec_queue teardown: an exec
> +	 * queue is removed from exec_queue_lookup before its
> group/primary
> +	 * are freed, so any q found in the xarray below has a live group
> +	 * and primary for as long as we hold the lock.
> +	 */
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		struct xe_exec_queue_group *group =3D q->multi_queue.group;
> +		struct xe_lrc *active_lrc;
> +		struct xe_lrc *primary_lrc;
> +
> +		if (!q->multi_queue.valid || !group || !group->primary)
> +			continue;
> +		/*
> +		 * Multi-queue exec queues are bound to a hw engine class;
> +		 * GuC dynamically schedules them onto one of the class's
> +		 * physical instances, so there is no fixed queue-to-instance
> +		 * mapping to filter on here.
> +		 */
> +		if (q->class !=3D hwe->class)
> +			continue;
> +		if (q->multi_queue.pos !=3D active_id)
> +			continue;
> +		/*
> +		 * LRCAs are page-aligned (4K) addresses in GGTT; the low
> +		 * bits reported by RING_CURRENT_LRCA are not meaningful,
> so
> +		 * only compare bits [31:12].
> +		 */
> +		primary_lrc =3D xe_exec_queue_get_lrc(group->primary, 0);
> +		if (!primary_lrc)
> +			continue;
> +
> +		if ((xe_lrc_ggtt_addr(primary_lrc) ^ cur_lrca) & GENMASK(31,
> 12)) {
> +			xe_lrc_put(primary_lrc);
> +			continue;
> +		}
> +
> +		active_lrc =3D xe_exec_queue_get_lrc(q, 0);
> +		xe_lrc_put(primary_lrc);
> +		if (!active_lrc)
> +			continue;
> +
> +		lrca =3D xe_lrc_ggtt_addr(active_lrc);
> +		xe_lrc_put(active_lrc);
> +		break;
> +	}
> +
> +	return lrca;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index ccade320dc69..29abf07d8f04 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -11,6 +11,7 @@
>  struct drm_printer;
>  struct xe_exec_queue;
>  struct xe_guc;
> +struct xe_hw_engine;
>=20
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);  int
> xe_guc_submit_enable(struct xe_guc *guc); @@ -55,6 +56,10 @@ void
> xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>=20
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>=20
> +u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 cur_lrca, u32 active_id);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c in=
dex
> 25fe9dbc9141..f1cf1463f1b2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2705,7 +2705,7 @@ static u64 get_queue_timestamp(struct
> xe_hw_engine *hwe)
>  				   RING_QUEUE_TIMESTAMP(hwe-
> >mmio_base));
>  }
>=20
> -static u32 get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe)
>  {
>  	u32 val =3D xe_mmio_read32(&hwe->gt->mmio,
>  				 RING_CSMQDEBUG(hwe->mmio_base));
> @@ -2739,14 +2739,14 @@ static u64
> xe_lrc_multi_queue_timestamp(struct xe_lrc *lrc)
>  	if (!hwe)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos)
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos)
>  		return xe_lrc_queue_timestamp(lrc);
>=20
>  	/* queue is active, so store the queue timestamp register */
>  	reg_queue_ts =3D get_queue_timestamp(hwe);
>=20
>  	/* double check queue and primary queue are both still active */
> -	if (get_multi_queue_active_queue_id(hwe) !=3D lrc->multi_queue.pos ||
> +	if (xe_lrc_get_multi_queue_active_queue_id(hwe) !=3D
> +lrc->multi_queue.pos ||
>  	    !context_active(primary_lrc))
>  		return xe_lrc_queue_timestamp(lrc);
>=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h in=
dex
> 7be5e3da8bc8..a8ff4e59a1f4 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -158,6 +158,7 @@ int xe_lrc_lookup_default_reg_value(struct xe_gt *gt,
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs=
);
>=20
>  void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum
> xe_multi_queue_priority priority);
> +u32 xe_lrc_get_multi_queue_active_queue_id(struct xe_hw_engine *hwe);
>=20
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);  vo=
id
> xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
> --
> 2.43.0

