Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8838606A31F
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KZzHyq0R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16A810F3AC;
	Tue, 27 Oct 2026 10:30:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB9C10F3B5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097041; x=1824633041;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Zng7+Gs6kOJMl3lYMvdvzwOWu4u7udory7acZl0Ve/c=;
 b=KZzHyq0RiBvKo7BY+yBlCH6XDAYmHxeBS9MPM7deExwo9LTYW9jb8mv0
 LVSKXAhtUkpr6I+mg6ymxAIATyPjoELpgrBy1gQ2c6787ApnZERGj/Ynd
 K9AN5vjvWyUcAq53kGA2JKJ60auKe4HzPKOKWOSGCGmP3sSVzMmxfe8oB
 juBxnqLxS3gIFFk7rpzoCg5PxWlqq3FUetk/KQts3dpCHVbijxdkCr+Ef
 XlpV1S4rff4GOJs+tap7gvzOk+73iwB1eaNODpmcR7iHubQkkJQcLo13l
 I7F8WSK3JSnsaVikSWds+ub9bXJo8FTYa/rDFUIzHYs3Z/ZqNZu2/Jtu2 Q==;
X-CSE-ConnectionGUID: rnJ2a6x3SkC/LhU+0vVCWg==
X-CSE-MsgGUID: TSoNJFd0TDGsoYEz2+SEjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1780869"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1780869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:40 -0700
X-CSE-ConnectionGUID: klAHt35MTqK+PGUKMgLzTA==
X-CSE-MsgGUID: A5N4xRviRD+kziK0QpOaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4508178"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbGMq52s4QpSDbTy6gJUwlse0RjBaPun0WzWBQxJGw3L0mc6gsPfsybCeolcWmVX0eC/ufX9YeBjtFbOICPd4VMdTYv6Z5j4Fl5Hc1CKcllrG3DjHghpfv9PK5Mi2OL6AX5mx6h97AhGm2ZlK2vZFvcp+Ts6yzYwe8h1V6Ky5nObxnpbl23SsSqWBg097CopKHKlE4VMtQNKoT1kAh1rmBjP0bpplMgKAU/lbtn9UtsnB6S+3l+Rrl3nvA+wHuzN4A63P/JAfa59xF5ADqiqbc/HkQvmnsDkqQ9ZJy/c5n5S1vk4TTn6O6UI3wMbggPUGu+FM7v1tb9EGbzEWqe0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mCTSorvTZWUKkGWqb0o15dirDC4TI9XA9QzkXYs0NY=;
 b=C95LbpLxf1HaUOd//CiS8+6XVqjOprHojgt++837ybXO1UQLHC3Vs00iwyp/u+J+3bpSDe0JKjDrldxozDzTiZ1H8z9PavC4NeGG2yITsoErSGgjvzodpdIn67PfMxIZ74r/0AT1lkYNpoLOtuVaRejo/4fBbIdku0kYlrY6s2SfP5aeY9JFhaYfLNc1y0FipEDAb2iCkhkm1Q5IHEVVys4stzcbd5iBSrF8KzlFAILFp2KzoU2swz2vuZn842/tbLITOeF/bC1NJMkhQ2IWmltb6pRHL+dHxPRxBIwHkcFOVctKJ5+29QOuQ0JmrNrI8JQQwfVfPmCUKF4AIQKe8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:30:37 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:37 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 5/5] drm/xe/pf: Split the provisioning mode change function
Date: Tue, 27 Oct 2026 11:30:09 +0100
Message-ID: <20261027103009.1259199-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
References: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c53f5fe-a9f3-465d-ae82-08df34155733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|261021121427099003|261022075727099003|10067099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: WWYXDvdL9IAhRr/uWeuYXfeUCVx61rd9dByTQyO+BhWMojgDbHd1+E+gIM+Yl+3RUyNeLMCOJarB+AQb5D9INLCwPJq4ZnPcZLBrHaq2PhCgUskhRAWSBoGXpQCKSxd9HXcWuRNopiW9uW5H5KJ+qVKOJPG4Ehjo6F0UgzF62V0jUGTdlcZKYDgddUpts8p1sy4eHq/1+jWD5dH45pj0t75Pul/jlrvHOjqxKXDH6RFQaYLPadkX8VHhZD6PHZdk0TWjYKCUaqqykNC44hnUaClmB/kY2z1HKxA616Lt4DDyZi1Gush2EruBRY2CUu6iKGEcU5Dt8G1Vs7LfZxjkf5PaXjYJZDwqmk4cy37Qkk8EgJOW4TwEj+eeSVD7dOJI9Gs0sl2umcrGFCy6OguuxbZL11ayW3oAgEsAE85fqxFr5VcAoTMfLylICRA9VF2ud1CgTMTbBx0bH6F37R//39yRYtdcqIrclarcC9Ji02Dj7AQZuZeSwGuMy1e2w4Cc4nEt2YofK0PW+agB44irDojGnHKwR7YXRGfkr2p6MP/L4Dul/KPbXe/wwL6zL2+kgfN3vlCUaXSajd/1EczztsxpmI4qxEosZ935BXhsyS8oJ6yVcYq512GPzbQUgljeou8WkxAZtjdW+tDUh+TDRh0gt7VebYRex4vdLUjADcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(10067099003)(261021123027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBSOFZveEJIandlZHkxYU9qOWplMFN1b29VNkQ3SVN1M1RHdXluZUF0bG55?=
 =?utf-8?B?RS9xbnVhb2I3ZUtaUGNtSXJVem1wcUFHdTM0ZmU3bVZ3QWFUT0M0Ri90aEY3?=
 =?utf-8?B?d0hPSXUzcjFONlNQQVBNQU94UmYvMFJzc3YwR0tlNkx3d0Zud2RRdi8zZGlh?=
 =?utf-8?B?OWJFQkhZQWxHWDFIWkhjangxTGM1RXY0Wmt4QlBFZU41aFJsaXRHYjN1WVg3?=
 =?utf-8?B?REtQZU9NT3kwSXZyUCtwOWYyQUNhSzNTTXdCRURrWlE3Q0lDYXZUOEx1NUla?=
 =?utf-8?B?OXFOQ1U2WnpSbUVLdkU2UVVWbmVIZ1V0VXVZeVptOEIzbi9HVGlPQXljdVFh?=
 =?utf-8?B?WnByTjJIdTVZRU9UVFJnT3pScU9pSUMyRVRsNEpDSGpRN1AreEpYSHV3VlJz?=
 =?utf-8?B?MEtvejRFVWRYWXU4cmQ0dHpRMnNERTk5NlU2aUl6STlZYUdEV05jcjVNQ0ZT?=
 =?utf-8?B?bkVwZ281UDByaFB4c0p6UmdENTVmQkdaRHNSbVgrYllGQkdKdFpzT0d4NXI1?=
 =?utf-8?B?S29WUXZhL0piTmM4bmxqejN2VWtoL1pYT0N2N0ZDQndETXNXM1R5Q0ttSHh0?=
 =?utf-8?B?eDFteEROemdHZy9BM0Joc0Zna3VnenNzZzArWXBjaTk4Q0drMWZENXpUTTBj?=
 =?utf-8?B?ejZVd2dkUmttVXdvdVhrSVFpYitQcW5uNm5FSjR4TXpXQk9Dc0R2ME9CRUVx?=
 =?utf-8?B?TnZBRGZZRXlRa1RFVWhxSGlzVHEyTDNLY1MxRmJPQkZGNnFzbnh6Rzd0T3lp?=
 =?utf-8?B?dHFZakxnTDhMalpuVUgrd2FqajZ0c2VEU3J6NHlQVE1XZGxma3MwOUtoYm9J?=
 =?utf-8?B?ZThPWHQ1WWVmejkzU2NZa25UTTVyNXgybWtKZkRtd2QrYlNTbVcvVDg2TERr?=
 =?utf-8?B?azZySFhIY2xDNjI2SjRZUE51YlNsNTJ6bWZHdmVtRU5tcVBHMFBqUk5reFUz?=
 =?utf-8?B?UHQyWExuQnA5M1dpcXA4WXpSSUZ6ODByS3J1OVo1bmhkaE9xWkhGeWY5S21T?=
 =?utf-8?B?VEQyTXJzMnBRQW96Q1pOdDZXVVdySnZqc3BVQXE2MTAxYysxWHpzY3lJaFNT?=
 =?utf-8?B?SFozb3diQytlSklwWktnRWJHR0djK1lnKzlGcUhhY1JuQkpmS2hYYWJTS0xl?=
 =?utf-8?B?TmhmSllPWVlSN2pDM0d6eFVEVEhjNEF2WVV0WnVaR0V5dVZxWVg5MVhGaHBC?=
 =?utf-8?B?MEhVZThGaXhDd1Q0Sy9HZUNRcGE3aE5MRGhiMWptenVaQnlCbVZaVkhnK3l2?=
 =?utf-8?B?MmhZRkNXL2hKN2ZZYnNTUXVjK0xqRUJJQXdEelBYYVlHcWFZSjBybDU3MG5K?=
 =?utf-8?B?SnY4TkszellWbDhENS90VkxYSnZHTHJtekJJNUNUdGdnYUd5L2h3YmxGNTZq?=
 =?utf-8?B?dTFSb3Jpd0xvR2dKT2o4SVlkeU5Tai9xUFQyd3VGZkhOOWlGeEdaWWZjdXk5?=
 =?utf-8?B?bkxucHVyelhGVFd4N0xESU5hVXBvbm90K3ZvMXFlTGErMWtWQXk5OGFUVVo0?=
 =?utf-8?B?R2VOeUdabUtMRVFMcVB3cW9TOXNYb01jMTdETmNhb2d0NVZNZmRPYS8rOWxi?=
 =?utf-8?B?WGZZc1cwRHRJWjc2TDRhNUk1MytsRUlkQ0dZdUpQc0RvRk5vM09xY1ZvVVc1?=
 =?utf-8?B?UXhQU3lGWFM2cGRlS0Rmc3VRSjlWREdEbVdqRGFZa0owQnF5NWpGZHAzNjE1?=
 =?utf-8?B?dzk4K2hCS05peEpRN3ZhL1Fub1RpSXZiYzZ2YlVLcjJOdmxaQTNyZ2pRZDJl?=
 =?utf-8?B?c1FiWkNNTmFxYk9FdjMrcGNSMFFBOXhsblRqRVEwS1dJcnNxM0VhUmpNMkIv?=
 =?utf-8?B?QXEyVXVGOW0rTEFqMjFOYXJzWVdGQ0NHU3BXdmJFbllUeHNIdlJwdERVTmtT?=
 =?utf-8?B?cTlkbzNtdDFWS3lNOWlaRG44SmJMclpMQlJsT01iUktFTDB6dGhOWVVSbmdR?=
 =?utf-8?B?TExpQzNHNkJIZ2VGWUUrdWFqOGJNSFJyeUdHem1weFRrUVpTaW1JNXM3b25U?=
 =?utf-8?B?UUZnWlNLTm9rOFZpMmFKejBoOWExdCt6bXVsWkxlK01VV3F5Z3lQV3hWZzdt?=
 =?utf-8?B?UGJVanpaUEZsZkZVNjBMR3o2U1JpYmtNSFg3Q0h3SUYzQjcrcWhVUTJUUkwz?=
 =?utf-8?B?ZlFWdU1CakRmbnVjREp6TTlzTGo5MHl6TmlhWUhpbGpySityUDM4V0Vra3ZF?=
 =?utf-8?B?aEl4MEswQmN1bEthTjlneU5najJ2eFE4WnpSU3cwcnk4Qnljbm0vTmdlU0Ns?=
 =?utf-8?B?VmQ5WlRBUG1oZ3ZoKzMzSWNwaCttUng4ci81dCsxYzJ2Zk1vbmlIYkFSanpm?=
 =?utf-8?B?TU4vR21DL2ZOci8zL2VqbGFja3FyVG1EWU42YVF4TEdLdnZNVDMvRXliejJK?=
 =?utf-8?Q?7MvbK8neuASE4nJ0=3D?=
X-Exchange-RoutingPolicyChecked: gLnYL6+CcjoPOYElxRwlM77zKwRVzdvndQjTt2vpNpGegRT2i3zdx6FfQIGGtBk5LeSc1RwVhk1JfD4JUuKPzLgDvs1/YaTDQdhUk4/4xwgVBYzECuA7HVByNWT6U5Fwc28Ds6VqdnJlVWuN4K7RVjh3Hf24n+X3xYTP2p9HExeSf0PLJvGRjTVcB0dembK6g8Jeuw7lpSSvwgXNR7FpJfkl1SEzgxP6OMmG+a9BzYDvapiJ/ewquE0udfWo7rzj9od4OEaEpIwmG030fV2PJsAoY1+gEjaKpX8a5Im4N2TH9c6/Sw5Ys6eMcqHhulToxl5rKL1p2aaTSvEMlGK6Rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c53f5fe-a9f3-465d-ae82-08df34155733
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:37.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvHdA8BeA+grdcIcmiTfbaCSoYy/nJiCVn0lL57m38Ga1eVvDwJrvQ1wu5POSUj7VceC/yx0sVsZaNI9+zo8umJeNuKcBsDm+FPDMQNopqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

During VGPU profile provisioning we will need to change the
provisioning mode while already holding the master mutex.

Move the mode change logic into a static helper that expects the
caller to hold the master mutex. The caller identity, used only in
the debug message, is now passed explicitly, as the helper will be
called from different places.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 41 +++++++++++++---------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 6ea2a24fef6e..7357b9369522 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -154,6 +154,29 @@ int xe_sriov_pf_reprovision_default(struct xe_device *xe)
 	return pf_reprovision_default(xe);
 }
 
+static int pf_change_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode, void *who)
+{
+	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
+
+	if (mode == xe->sriov.pf.provision.mode)
+		return 0;
+
+	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
+		if (xe_sriov_pf_num_vfs(xe)) {
+			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
+				     mode_to_string(mode));
+			return -EBUSY;
+		}
+		pf_unprovision_all_vfs(xe);
+	}
+
+	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
+		     mode_to_string(xe->sriov.pf.provision.mode),
+		     mode_to_string(mode), who);
+	xe->sriov.pf.provision.mode = mode;
+	return 0;
+}
+
 /**
  * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
  * @xe: the PF &xe_device
@@ -176,23 +199,7 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
 
 	guard(mutex)(xe_sriov_pf_master_mutex(xe));
 
-	if (mode == xe->sriov.pf.provision.mode)
-		return 0;
-
-	if (mode == XE_SRIOV_PROVISIONING_MODE_AUTO) {
-		if (xe_sriov_pf_num_vfs(xe)) {
-			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
-				     mode_to_string(mode));
-			return -EBUSY;
-		}
-		pf_unprovision_all_vfs(xe);
-	}
-
-	xe_sriov_dbg(xe, "mode %s changed to %s by %ps\n",
-		     mode_to_string(xe->sriov.pf.provision.mode),
-		     mode_to_string(mode), __builtin_return_address(0));
-	xe->sriov.pf.provision.mode = mode;
-	return 0;
+	return pf_change_mode(xe, mode, __builtin_return_address(0));
 }
 
 /**
-- 
2.34.1

