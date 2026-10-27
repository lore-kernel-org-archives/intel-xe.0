Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66FE606A330
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpUF2r9H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C39E10F385;
	Tue, 27 Oct 2026 10:30:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4506910E3F7
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 10:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793097035; x=1824633035; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=WQy54xvXdYwcb9UyHb1zcRHpzuepGpZ8K3NoIVSKUM0=;
 b=YpUF2r9HyTpvsoUWpkW4Z7O7OCK8K8bnA/qX4mu11kNtzYzfpRL9CeZ3
 21rzKLUainGerzt93ryIzV/gukdgCfj8mO+nVNIPjtbt5mtB1KAk4uKon
 h/LqOrXlIhB98IIVIU6jEUiuV8gDTqLE35yWGYaR5fasGvzlVbRpDtrSO
 UW460Xms1H8cDwwOy4xsbh7TvZUQkTzXgqiq86BNcgb8xzvEPyGivNaqE
 4AiVYuwa7P9HCWnEtla4v7ykCuvNplEGPrefO0w0CIK5v/pNRxLtfCIQJ
 dCuVDqzmCiMkqvPbIuxcwAA8lkve2Bdiv436/MpTOFSDcj+3y3W8AKvd7 A==;
X-CSE-ConnectionGUID: z9L3RWLcThKrEJS7z8xK5g==
X-CSE-MsgGUID: 8inn0DUBSy6ZRP7L+ItNdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1809138"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1809138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:34 -0700
X-CSE-ConnectionGUID: n0vfoH3kSRao+1Ul5HxAmA==
X-CSE-MsgGUID: UIKjoaTOSba4ypZ+2UliZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4847209"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 03:30:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:30:30 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQGPpJDJNBAsrzPrx1KhYe5BOm9exUCOSlLAo3o83+gTv+tKL/PkPg6uhFeo0t5HEAufDdKsn9OHXmtjNtmq0W4ztkZkes6/ZGxS+ARQ/tA5wQQYK+rkzqjguFrIkRKpXs/PKd3EE1x6rJmFQw7ysiz1qiGaB+EpTAvP8+31+i2QDqvzGHum7uK0RcR3uhY8v+OZTrPhEVScRHGhrqAN9z6G9ErHa+Z973aI2PKFieehdfWikGnidr2f01y4FbQOuNIQ3xJJ+ck39OrscFkDDkrvsqoerUkBfcv5F5XFsZC+kM0YCj/6pjZYZRPphkRxB4yW70yy9T1W0Kc0VFhbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAxKt77a3DuLT979T0QJHhx05c+s94Fw/Ws0c7HKUDo=;
 b=Lhz7TOeRme2F1LuHz1VThdoc+Pg1fvEBvqM6KsFDi6KHNf/+vmg11HGGnftpGBJgXc7ihslvd2yFOs03jChLln0V5fLWiCG5+qUUSEELz3BreOVSjPtNwxZr/xGrybZ6ZRQH/A2uoGYFwe1TGbSSrMp8J1PtGcIa+MLqUqTZAmy47sKz07wU6QXWpxNqKHCLc+RnyBpz377fRewxwnZrZcUmoYwCVdh4irF2/wTad/W6cX/yVtmfP9tdyR3W6WRasZ6IXNsytyeZ2zCxW7SgFRM6IlzeVpUHMco4MoKohHBTz5/rD3OrYIBhxGizFgMkVSt3bsBEd2sOgXo5Jtlf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Tue, 27 Oct
 2026 10:30:17 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:30:16 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v1 0/5] Prepare SR-IOV provisioning for VGPU profiles
Date: Tue, 27 Oct 2026 11:30:04 +0100
Message-ID: <20261027103009.1259199-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0127.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: ad16b448-1f31-4e68-32eb-08df34154aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|261026140227099003|56012099006|6133799003|18002099003|10067099003|261009223027099003|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 5fvTw8UHu8GZmvnmrY6LQwLKPtwil/X6qcK9fKSASNUWON8P/oCAVJ0Q/Db9Np4FMKkKeqLhQWDqoq1fhYaJI16YY4n9Vqbk27/WKMr9JbSnFPYjfyJ8sK9KR5hD06SHWJ852mEpR+XlLiU2hFxVGxBl+vxpqDFe03tjqoCN1f88h+MOuXdUyoSCDU1EF8iD26hYwb4b/O8yqavthZckIuIKERM6HyPZpeV2rLcIPYnf6515RPmWWXsrIUnk6WDmMsuSg6n1eGQGpFt7aQCBM9Bn6lpqwSSo2iJzzhk7KuQocwRU48bS3y/2o19Etmt8sVnHq22u7EN4+8tza1ARIOcO66bcnv+BJjxxtVTvz3Q8roN3u9UYLLQevWs/7DeNbqwxj2EAgMVk/mSVKzAa+4i47j48+kKz08v5w0PP+FTxfQTJlG42RGTEEB5UFEh7ZgH60ghI+752PabxzM6J+LaMnaT2cU+UtKgRVNSZwquBdhsYNcWz3lnzpJj8WR80xadIQivCmiZWjAowcCxiNOxkxkX8ZNU04qD5WK0WFJ9jO430TbygvslO/0tuz8Ir6mIeMUyei2iRuNsFaiOlbVBHAUS7XrYf02cLtcIlbKhjXOmLGQIq3WxA44BZYZp29InYh4ieRDm+UXhzuF5fmHv1tGiL8MjZmqerw3fwpvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(261026140227099003)(56012099006)(6133799003)(18002099003)(10067099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NDRHdBN2xqczBVMWdzQzl2TGtZc0FrTEt2ZkpWS1hBaUtEaHNVZ3Q3cWNh?=
 =?utf-8?B?Y0grTUhoTDBlcllSeWFkVzNyTysrcTFiNkdveW95YXJkSHh1ZUpLWlRHa1hK?=
 =?utf-8?B?cVVTR2pPTHpEc3Q5NWY0ZlVTaXdEWHJVSWxrK29DUlQ0Q1JLeUJ2bDFCdkht?=
 =?utf-8?B?TUNCZFFkajZYa2M5UnM2bitScHMyYU9XL2JEZW9LQi9zMmVqdW9WVFc4bjZo?=
 =?utf-8?B?QU9OMWludFg3SVAwcW5YOTZhZ2ZWSnZWMzRycXAyZmhFN0Y1VVBkamZrNGV6?=
 =?utf-8?B?MTNpUHdtVmZ0QUY1a2lkT3VyT2NINlR1SzI5TkJ6V3h5bVk5RUdFcDFoUUJV?=
 =?utf-8?B?Q3VMc3Faa3MxcXg5Y3NsSjdZRmo0VEVrZ3RUR2ZmVTV1OVN1cWlxV1haQnJG?=
 =?utf-8?B?OW1QWEQ5L21obDkrUnZlVDJNTFM5aWM3clNuVEhIZlFRSkRzZ0VYYlNIVXNL?=
 =?utf-8?B?cjlnWTEwOWk3OGZRQkhaM20vUzVneXpxUEFYTWdhczFyK0RIK1Z0Y0djVUoy?=
 =?utf-8?B?NnVOUE9hSVlvdm9GaDk2UmF3RmpCZzA4NTh2SHR2WmhtTWRmMmQ2Zjl1dWd1?=
 =?utf-8?B?cTl2REErbFN0cEpwNVE1eFpzcld6bnQyK3h1TWtlQ1lzZ3JhTEE3emc5WjIy?=
 =?utf-8?B?SDVjSUZyZzZJZ2N0MFVzbGNRSTN2ZTFkVTZPbHFRWXhBV3MydXNKL2xMeHBW?=
 =?utf-8?B?S0cxSHVqOTgwenRENStkZ1QyUlNLMFgwWnpIdEYxMnVmVXczNDV6QytyNVBm?=
 =?utf-8?B?eW9WUXNvN01FVU02NWYvU2g3Mm05K1p6RldhSmhRMmhSS0NaYVBRS3BlQnhm?=
 =?utf-8?B?YVdsSlRRZVNVbnBkNEZXNFBVa2Jzd1hJd3M5Qm5UM2ZVMThXUGZOamRMazZy?=
 =?utf-8?B?VWRhUFRESXlCbXdhRThzN0ppYUdzNmEzdkFEdkd3WC9ZNzVYWjlweTVWemRs?=
 =?utf-8?B?RTdneUlHeHU4Yy9hVVFiaUpYOXhDSGN4MlZWT2V1dS9wMW9UWllLWWlwMUpp?=
 =?utf-8?B?YjY0SFUzdmoxY1ZoNFJUc00wSnNEQnk0M3BIcTR0SlZNWGFNd3FGZTVXaGdW?=
 =?utf-8?B?WDkyR1dGR3dZMGQyYUFVRzAwR3RyTFRLcHdoakFKV0lUZVVaaUUxSE5MUDRq?=
 =?utf-8?B?Znp0cWRZSVJtRUtlc3h5RU9lVGgxaW83MXErd21hNTJJODBnNktCcmhQRURn?=
 =?utf-8?B?THNPYjhvVTRObWNSNGxMQ3AzTmpDMXNqUWE4SkF5bHN5OTg1b1NIcmhBU2JB?=
 =?utf-8?B?T2ZBS2J2dnROcWFIUm9YNXBxYjZUN1FnNWxiY1JoSUtFN0tUYkQ4b285U0ZV?=
 =?utf-8?B?TGdZLzhESWk3SFQ2QnBsa1dnQ0FUUzZRT2ovMERZTFl6OXczc3hlbnNEelJI?=
 =?utf-8?B?b2hOVUgyL1hMYzNia2VLT1JUNE0vMnNtRjJxa0lsZjBuenJSRmZXUkcwV3Bq?=
 =?utf-8?B?cHBjYnk2TmlZK2tZa2pJRWkzZXUvVzNpUTFiUXpiTVFua0I3Z3pVNDV4TVpr?=
 =?utf-8?B?Q3V5UVh3N2hjTWJyZUV5NnBDWkt1aCsvQkYzSm01bFJWd3ZXVEZ6M2gyb2xH?=
 =?utf-8?B?V2IxNlFCWWpzNThHTExGTXc1bDRheWFEaGNic2ErYVQwY1dWZWdPOHdNR1U4?=
 =?utf-8?B?cTl2RUJ2am1HM2wzczBlN2haTW1IZ2hzSGQ1cVRJeGlMNVMxNnZHQWF0NHFl?=
 =?utf-8?B?RmQwZ2l2V0xhZjlmUFlQb3M1d25qR0J5ZlhXU2s0S0Rzem9SbXBMMVZKaW5s?=
 =?utf-8?B?ZWxZRldFdFNnSFpjREhZWG55TURmZ2Y0ek9ickFoV0RCUGErQUtNbUtNaDZk?=
 =?utf-8?B?U1lJR2JhTW1sN2lXdzVMeXlNNmtGZGxIVk9IZ0JYYTlUN2lGRlRka0h0NFJ2?=
 =?utf-8?B?Y3hhL21yNnQzWmZCN2t5N3NSSDhXVlpmQk1WQUVMeC9mbERnbEVNaFc0b2Zh?=
 =?utf-8?B?UHlZcmsva2R2MXZuRE51V0VaOVlqSTBHYnBCeC9zcDFyOU8wYzd1VG9TVmMw?=
 =?utf-8?B?UEpJTnhqZFN3T2xhSlZ6VDRlWVVyS1FYVzZIWjIrclVLUGtzZkpqVXE0V0FC?=
 =?utf-8?B?bDNuUkd3cXozanZZcWxiTk9lMkFiL1J1Z3YvQ0JkazFDWGlzZE5RM05oS0tZ?=
 =?utf-8?B?UTZtNHdmbVFCellZdy9iRzRRVGxNSyszT29ldFJ6V1RLMU1mOThzWkJpRnVy?=
 =?utf-8?B?b0x3a1NiZnE1SzRrOERKNVVqWTJpa05QWm5RZlJZZjNlNTd5LzArcjZqQkh1?=
 =?utf-8?B?S2hxTUlQTkttZVZHalNHeC9yMnV6TTRmNnRRbHlGSTZsWkMxbGhlYkVwVUJk?=
 =?utf-8?B?WGlDRGRzZUJXSWJHQm04TmcyUzhHUDVzWFVpQ25qZ1JjdG55TGJvb3NYcUpZ?=
 =?utf-8?Q?QjnWtMb+8epvrtgs=3D?=
X-Exchange-RoutingPolicyChecked: WKwlKQQmr8NJjquOtL1XPPveSkvSBJm9ZkIJhhim0jia6UNJ0LVnNgT0orfqLjOUPwpycy4eXhiHK4iI9p3WfkVZlPnji5WgwDMPpoAZ3yPcR52cBSDWjbsJGEFrtFVtwh+u5AC5vQj+MRnYEj8N84T6zK+hWOnIzGp5zEq9PBKWnOnDZq6fqhtrQNSY4ao7wyFqcmT+1bonsiGlil15yypRZ7eHjpbVTXk6dbRqLT0rgczB9cRZnmDebivDmWpyWgHdriaTcGa3AaFFYkBN7BdisbBdkLJK4mZGfdJWAFJUYPm2pUjFZmWSRYoG7XuT4ZFjRQovxG/a1mwF0AUjVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad16b448-1f31-4e68-32eb-08df34154aea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:30:16.7306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ju0e9FK7tHFlZTCoH3GEQZII71TNeZeYZrnH6ld7NQKsezaot/1S06NRqhe8ikTNYvjIxHUqB07kONXkKG4TT0c6Rz9BeG/gp5DsyoQ67E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series prepares the PF provisioning code for the upcoming VGPU
profiles support, where the provisioning mode will be changed and the
PF and VFs will be provisioned while already holding the master mutex.

It splits the priority and the provisioning mode change functions into
static helpers that expect the caller to hold the master mutex, and it
makes the provisioning mode changes, the VFs auto-provisioning and the
VFs unprovisioning run under the master mutex. This way the provisioning
mode can no longer change between the mode check and the actual
(un)provisioning.

To make the auto-provisioning atomic, the fair VFs provisioning gets
_locked variants. The unlocked fair provisioning functions have no
users left, so they are removed.

No functional change is expected, other than the stricter locking.

Michal Wajdeczko (3):
  drm/xe/pf: Split the bulk priority provisioning function
  drm/xe/pf: Change provisioning mode under mutex
  drm/xe/pf: Split the provisioning mode change function

Piotr Piórkowski (2):
  drm/xe/pf: Add locked variant of the fair VFs provisioning
  drm/xe/pf: Provision VFs under mutex

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 69 ++++++++---------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h | 17 ++--
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 90 ++++++++++++++--------
 3 files changed, 98 insertions(+), 78 deletions(-)

-- 
2.34.1

