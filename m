Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AFAC624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 16:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D36010E406;
	Tue,  1 Sep 2026 16:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaIKWU3A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC74E10E406
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281096; x=1819817096;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=k+sJhIje301XIvepFE+b8+4mJH6Jcur+GpuE4izo4Hw=;
 b=jaIKWU3A7WD2CprO6fL78D2nVuYibw67WzyJIahjvTEWEBwurmmvLoG9
 G2+NMxuN5m/H+jiWGqBjrte11EWpYUFfwlC+gJns6Zwmevm8Vi//PSiTu
 ASpcBFMpckNTsASkVXGaRkUeQr9waDJBg3/HxRv/hly/eixH880ze5hEv
 ZXJF3wkHEg++HlRIk8x5BkhkgM3HQ+snqrjVSgQbvUGnix/THSz61aVmG
 PpkcAUPqKCcHYA9W2hlikcXb0ZxeUQX7w3Vi3OFPtpz+UU3168c01u81A
 pm+9SxGwzSoTC04Fl03pjTRKCDIVHx1WAY+8+lxj02fDzLhtdAtT0hQF1 Q==;
X-CSE-ConnectionGUID: nCqRhrhpTfu3DFuUK0OdEA==
X-CSE-MsgGUID: 0QTSvIy3QPmKJ7oi8z9Dqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111491093"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="111491093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:55 -0700
X-CSE-ConnectionGUID: 0fUnPx/iSKK2Lrl3/CXe1g==
X-CSE-MsgGUID: 9256r46FTAmvEducgjcJxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="272655944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:44:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 09:44:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdxU0NgNESBNJT9qE6PKKxVJ7vvI116DcnyOLh4uyrZl96TeTvNXYpfs7z3vbC3PyHIEDkZfTKvWOhr9abzx++5KUkWSFc9sgCfDeScT6YTuG2MGp9ZEoFKkYo+OslecZ/e6mQgEUYMly8qzwSLduMdBbaR9yYR2EGtEZ8XAVEBk+N2/orn73dlaAGQAkDmQ0594yPSH9DPXMJVoO1RUjWdpCQskQZ2xBbZ9ntCTgJsGBGtpXy6tdLbU+GlZGoMAINbzbf/Y6PTkkXmnePBOgXq/0SIcQB+Fx3Hj3aOMDiD90Xl1qo8cItXdwvflgaVfPlmN7iONsO/3YzvPWApCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX6qXqFXR0t38O7lUTehSY3watmfKvVBd0uuiuEN714=;
 b=B9eENPI+qCfRjEOi1TS8BqBmFvCUjiMo0arqAxvk2X91cUODpT17eG39sAT8cc0Ik+jR8YFFUkHDm4IA+7RBoJx7IErO0AdH8H+S+8Tkm6YgIw9QZiz+v3tr5WR1VnJnDgOZW22iwcKra6xiJGo/XVX1lmFDPXCAMz/m+YY8OV7yzHuIxFeGUrhtPj8Xl5ewOsdQwdeKVj2JzEVonogo022hqlS5TVe3zAdDinAakDgQ38xGf6PKyET2JJvG68aXC4U6P3mOEZTTrnUdf3ErMNJUUKJNF+UPxaQd1lodAYyDvBiEDUXSU6a8CA10L3u6tdrhWKu2+zQCVDImXqTbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:44:43 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:44:43 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/3] Separate GGTT pools for submissions and VFs
 provisioning
Date: Tue, 1 Sep 2026 18:44:32 +0200
Message-ID: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2P250CA0005.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bac1095-45c6-4283-31e1-08df0848530d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 4XW4K+2K0azSUJcSVJs44nCOR6G0LvdzHC+zNAb/+lh+le6AziH3O6noXHPCFPD/LkPAxMCrR/L2BQuiJWRlOOLeBPLLL0F3hUsoWb6gKA38e3tA9vlpaMk8Ztu1Mn30dNZo+KOvR29VbSGc+IifElo3/TvRVJYfeNKC6sqkE4L9nxLvRjwSruPeL+WMqaAmu/9Brlwd5eHW+ZCNNB7lbNdL49LC89hpHYMIqZxw/Or+2pyLeHMtxW7V4IFk3evOC2PdyNEWTKMajIzwTGK8ahRy6gNzJwi7Pcm/DqvgCXFV3UxGR5MWBzGzTOfgA6B09xfcsm8RcPYAYZtfHajNp+KnpsNkXMuHzcvIUD/iX+FaOenUutnbGiYcBn7qhaqlb11QRgXwSP94p5rfPksAHmK2qDyAc1i88HSqdJXZKf3y2l27sPi1aANmrfO0ajCLN8JrKG/A2yfx242A8FJmO7m7o8dc0J7c7iWGS07Sn8cE71tKAwzPI2V2QwlS0nN8ePoMzDqdOVOd+L/wED+5aJDLIcpY3I15EMa3mznlNEht4nou0NZIT0DqVs243PJniNq4GYzLYdOmRcOe3kqIcXhs91RgUahWHYrZR/lQnm4IU6OPA9Vkb2l20Xn5m9RJwMAHQ7dZ6V//+TTuxOZQmppY/pYzXCSbvFq71tPppgU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3o0Y2YwRDlFMlU5TVFCb3F1MlRLajJ4eERNMDBSZkJYVkV2RmpuS0VId09q?=
 =?utf-8?B?V0FlR0lVNnQ0RWNQZEt5R3p1SGZrQmZsZ0VDQWw0aFh4bVVFZXl2eExJZElh?=
 =?utf-8?B?K2FnbGF6MUV3R1hLZ05iOStueE5ZalFGZ0czTDBodWV2dXVCM1pDNGNqaTFZ?=
 =?utf-8?B?ZVZ5bHJMa0ZpVExzaFBhRUFLcEozaDFVRE1HOGNjUERmMFRUcDQrZUl6WUcz?=
 =?utf-8?B?aU9tWEdpNGpGN2U0UldOMWVWOStvR2pibGpxR2J0NDRhdWFjNVVCS2ZtMXhr?=
 =?utf-8?B?RzRVTkNhVndrWE1WSzRxdXVTL1FJNUhmWmlqQnQxbk9Hekt0MW9iMHVXNWpQ?=
 =?utf-8?B?Z0dLVGkyRFk1MWNvZUVMYnJ1amhZOGhKcUd4WWhMWXhzZWlZb05HR0lGVFAz?=
 =?utf-8?B?MHpJUXoyNTA0WU9tU084ck9iMHF5LzcwaEpPc242eVNGeElSOW5kbEdQblRu?=
 =?utf-8?B?M0FIL2ZuUW9NTFVqYSttZDR4TStoMm1ROGhrc2pUSENndG4xWi9jUlpBMlFK?=
 =?utf-8?B?a216c3RCc3hHamxYWnlnTy9nNzBuaWE2SGpTdDN3SWNRUUhwSlQyMGlTS0dm?=
 =?utf-8?B?eVRHN2dQQXo0dDRJbVNaTkdsL2FKMXZnVU45RGJaSjBkNlpDY1N2OERKYTAy?=
 =?utf-8?B?YVdhNEpCTDlRcHk3RXM5Z3JGcDRJekl2c25aNkJOencrWVZ1NTZVVXVTbHVB?=
 =?utf-8?B?ZzdxK2dBN3Zab0lsOUJsUzJPSzlWZEZNUUpVZU44KzZpRGlMWDFycXFmUXhr?=
 =?utf-8?B?WjQyTjA0R1Q1d0ZxUmhobDRDTklJK2xDR0l2WVZkWFlpOE56TDdudGJuVjlp?=
 =?utf-8?B?bHJNVGtaNXFqenhVZC82d2dGQ1VQbTFZRnlmUGt0TzBBT3M1MS9aNUVCS0hh?=
 =?utf-8?B?N0JXRE5XZG5hOENqQ2lOV0xDWWxNVmlOUkd4WmpFSWVXeWtPMnRDTU9jbHZ2?=
 =?utf-8?B?NzNabllDc01KVURhalYxVDNyRW03SzJrNjUyc2ZIbm1ySGNRYnd5RTYwYXBo?=
 =?utf-8?B?bTZOYjZLelhScUVCRzJUWjhvL0JBYmo4K0JoRGtUSkJRbGVHcWhLMVNjTThz?=
 =?utf-8?B?RHMrM0tJa1RRZG1rMWdmUHJuNGwreVlVMXhVelE3QzZsQnVZbnFlSDg3UGU2?=
 =?utf-8?B?WGhJNnd0TkR5MHJXR2pFTmlGOUxXcmhsMVdvc3BoUzZ3RTBqNmVjK21tTGxI?=
 =?utf-8?B?SW9FODFwN3RHMWk0WDI4Ykh1OGRMQjFGWGx0S2NENklxaFY5RjcyY1NqTlpW?=
 =?utf-8?B?UHpBZmViVDk2VGNGcER6T2kycjJXKzJiRDgyRFdneVhPdUd1WHdEMjE2RzZj?=
 =?utf-8?B?ZEl3ZzBLd29rSzRUYUVNdEszRUQ3NlJwK0MreEtCRDNtcXdhdmYwZUxrU1Vj?=
 =?utf-8?B?U0RrZXVieXJFdlBFVldPdCtQVzE1U2hYY1l3Wkp6dGRUNnlZYWViNnlTVEMx?=
 =?utf-8?B?OXgvUnp2VVFlN01rVU1zY2ZoRm1zQXgwUUNCSWozQ0xZQzF2Rjl5VFM1VG04?=
 =?utf-8?B?bE5TMUVCdUJPR2JDemw3U1VoQmhKZXk2b1NpY1VYY3dNZmFrQ2VBelFQVlZv?=
 =?utf-8?B?OFN4cTdEZVY5MWZjNWN1ZWVQUFFudGdPU2ZYZGJwZzVmek1Cdzc5WitReWY0?=
 =?utf-8?B?WExlcHlvU2kzNm1KRitkcmJoZlBXamZkMDJBQTVVSEt0UE50OGYvWS84ci9H?=
 =?utf-8?B?a2NkWkN3d0pTL1hmaUFBQnN6YzJUdmk4T094ZjFvWU9yQndPcDR5MGFYL0V6?=
 =?utf-8?B?a2R4NkZSS090ZmhKQ3Z1dnV0b0FPcXNkcFIwdFlCWE9OdUZER2tSd2pxUjVr?=
 =?utf-8?B?azhFNXZBTHhqYlpUMWt1TjE4TDJoQW5uQ3hGS3VadGc1NDNjWllNc0ZFVlJy?=
 =?utf-8?B?WWdWZVdTazh5NGJKOWMwa2tvOXBXYWRxK3NlUkVzaDJ5cUFMZVNPWGtZWG0z?=
 =?utf-8?B?a1FUMHFHTnpFeVZTdFpsS3poQUlBdE1VVHpOdGcrQ2JOYlJoTmRIZllPWDVM?=
 =?utf-8?B?RE96TVRMU0JLc1kwK3lmZ3VNYy83WlB5QXdDakVJNnVhVlB5aWc0ZmM2aVZY?=
 =?utf-8?B?aUZFeXAyWlNvdGlTYmQwTEM5MkpONGczRmRJZUJPQ1FBODZGR3lnTDdMVHhY?=
 =?utf-8?B?S21XaUJEWW9QR3hIdDA2ZUZRM01HWk52K1d1TXR2TjdLeU44Kzh3eFQvYytF?=
 =?utf-8?B?bkFPa3czNzBhc0J4QVYrN0dZTGcvSldxMXRqenZpVkRYRmx1U2lKVmVtbDhP?=
 =?utf-8?B?aXNuQzVXN05MbVFPZ2NaWjE2aFd0c3g1RkFIeHR2bkFrTFkrc1lpTG1TR2Uw?=
 =?utf-8?B?cks2T1p4Z1BiaUJhN21lWVpJZE5VTkNoQUVrNVIwa09vbm05NnBOcnppbk42?=
 =?utf-8?Q?r/LQ+5R/vIcc7uRI=3D?=
X-Exchange-RoutingPolicyChecked: pQXCA7JvEKoJBPnSKyH6TQf1fdODXszBCJKZGKfLzLvUZAFcmARlkf9K8nHdYQjxPz+K8lnstrMH+vlbASJcD4PiaXnwXZ2hgMp65yIOUCFjgo7AzZC5FvnmcR3rG1vWliuvc/tMG3ni2bEaczAqRJwmd3HxZ9TucQD1F74Zke0wFIfGrjRvbnuu98avJRpETSwL6KN1WFuME9S7heIfD8GL1+8rr509NkGGDSj55TxXwTG5len3XDZC2BEIKXVc8iSsePxtS/NgDBAlMbLpGv80F6GBVEurqoMwBz8RgujjCMteHsfphFGQbxD5JsOVquySh1Q4i0OiI1TEOIdpBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bac1095-45c6-4283-31e1-08df0848530d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:44:43.5543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dh6X7diJHb8co3+rpWKZecfmoB84p7DGjXQd92olpPinJl43tPt9TinzWbkYLKcvYko07g84/J7lpWDETVKIyfB97ET8iLudsWE+39/op3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v3 -> v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.

Piotr Piórkowski (3):
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_test.c    | 336 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c               | 306 +++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h               |  14 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  12 +-
 4 files changed, 606 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

-- 
2.34.1

