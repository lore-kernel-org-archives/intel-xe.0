Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18BCEB7EAC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 09:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C24510E1BF;
	Wed,  4 Mar 2026 09:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7K5UvGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435A710E1BF
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772615771; x=1804151771;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=7T7Oa+sQ9m2XOj2eDBhOswbaGtgxaAnbcBzAdsKXOzo=;
 b=G7K5UvGOTjGdtv7hKPGZaoilNFgUZZUF3UDNA2UlwN/J2cZ1DegfD5ni
 kkH+PlFe4RJS1AK/FbW+lVTBTwU3L5W/kVIvHR+IIAS0+OKajkj7monHp
 LDPCATCgojZ8fLKT1EKf7wR2lZHW+3+qR/7UKQK6lpLWjYsMT43PCYyzb
 gcRh54m+6mFyQAZgLJc59VQdLdB4+dc3WA8TOH3jSmwaEI1XdyvsnTqYP
 ln1mnvI52mRfkP/iaUCaxCJSrG/+FfovdagvHeq3Gy6ZgllXuMLUcka/V
 ZYtFMEoRCR+XPRuwihXlaLTV6+7bcm6ZDK0NdyyZE6bYCkVqeiDfxMbXm g==;
X-CSE-ConnectionGUID: lSn9M3wTSyOG1hhbLQYvYg==
X-CSE-MsgGUID: bV89C702Rb+nrQiaYM1vqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73861177"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73861177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:10 -0800
X-CSE-ConnectionGUID: Q1MpTH8mQvGGkTipZTVjuQ==
X-CSE-MsgGUID: TyZab117R+yeDjT09oXGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222449731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:16:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 01:16:09 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 01:16:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIdLJCnikuLgDgbe/mym6jIN+x7OfLXnxluq/a/VbPsxdaUxD1pLhp9jTvRklD7RrTMKi+JlNWy84maUTqiVr8pQRCIiIt4yxOi/n56oHfSrUxP1SsEva2+F+f0XNvV2LUOHpjRDZr7vNcuZDtcKgt9FPUe+/NtI0kF/0ngQwqR7bJUu6Gv2uUr3KwDd06R5+TtiVesdSW+gHUjYUUQNBrNBEHTnH5XcloXLm2fMI5fGLntg+Zi8AEkdIjIZfCTRRHuKhcvdRidc4M4WqhWCGjTSnaTkMx/O5XLhJbNrJZ5tYSF84eUS5z7XYTTFo7vGuySgcJ4OK1iW2c4RyMsD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/6T9i7NjslVzEGkPfnN6lm+9+z1ePq7xsdk/owcOJw=;
 b=Megt6mj5m/WHyFvH4EquSjbJOz+ptVMQ4lvBe2gO73igujT50O3XfrQgjqDNNZs4V7ifwct1R9kX5QWIsPE51nxciu4w90z7kkOS0V0OewOFGS9G4ASW8tPlNdJZYoUBKXiGN4OjBmgDTDUwn8wcxKzj0JtCjVSFC4jrL5779JGLs8R/OJGYL3I4oQghCQi5TSYTPaH6BkYVlB0TMFVYpzlf7DfMxd70tF/MOPSfuAypQmCEFGdacWxu/ukPJf0A8uKAxMR1yAY1Myft7f5KKH4yfbxI2HHA8SZi+jnlDL+lhh755sBdw8ouXIfXLjopxZEBR4ByLJO7P6x/C060qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 09:16:04 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 09:16:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/2] Improve VF FLR synchronization for Xe VFIO
Date: Wed, 4 Mar 2026 10:15:03 +0100
Message-ID: <20260304091505.732528-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:10:110::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d63e51-f200-4efb-76b7-08de79cea90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: nazEooFcHyBmbq0hRWJt6bcXqgr7xSVU1XX/sxnIiA75tpiGYGp2yUof/W9RuUfVA5R4U3nt6+oHdUFNkLI6jqHLiLDm2kdC7v1g9xGOlPeeQJE2Dw8YZAbuLhEoyjKP2Per9NIE/qCFTB2CbgbPCYfjmjexy8sso0e9d6m/fU5Gse8QH7KRfAr4FuJykNr3L1e0ClM5UsLQZ7EaN0utqyc1qHuT9idBYX04V+oGTj4so5Vwo1t8b+aN/uh+bkIW4t0FxYg8cW6wiLqVOyPbEJPt+kC68v8U+kVBt/7vwtYb+hE1W1kfTFP2abwtm9v6mGgQ6wP4HZkInqKj2vP+TpAs82QVokbwdCuaYm6fygzBhZCdhthTPfdDotOhSWvLbDQRlSCTMl5ZU5GOCsU5Z4KiNsflwkiGv1RbkbKGWzvFVTNpW0JGHDV6dBc+1f2pW6Ph7TLwV9giR1YxzutJY56FPyaJUWES8aVVzVF0HzhypFJ9rEOd32aLYNklGBEq+J4p6FabHmNxCEQRfNnogX8ztLux2eCMWwrKUqAyvZEqckmuOzTPdqyQVEkmBqko2pG4To5ARB9bGaDeGqZ8ey1vvpS20Tt78BfF1oKD0t7fuFSN1Gtj+F+Ur+RgqrR4FeWEnm/eGUtY/aP5Z8vcGnxsjC5EwUl92XATkZ+5rMtFa4ta66eQgcnzPDvLhbbbs6qKS7p0ZK+rB3LDEKymwLuQ+Z6TaF7NN9MN/fq06IA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NStwcmk0eEJFWmFCQzA1Y2ZGN1l1MVU5MFpKTktJOXRVRmN1ck02WDhyMVhZ?=
 =?utf-8?B?UnZBYXI1QjFGRFlncE9rVGVhek4zUjZUL1p2L1NFMFU2MFVGUUY0OXJZcmxI?=
 =?utf-8?B?dHhXOUhLMlVQdG5kWitJV0hDOW5nZk4zWmVKMi9KdUd1ajdyU01CUC80SkUz?=
 =?utf-8?B?djVhZEFoVXVkYzJUaGx3K0o1SUp4MnFDbUU1SytKT2V5MXNkUEsxNkFQU2tj?=
 =?utf-8?B?bCswazQvbStXdUlVQVg2cTVIZEtRTTlUaGNqVUJ1alFaeGV2WkYwOEtTUk8x?=
 =?utf-8?B?cm5BTHlIaXdvelhNSjJNRk1TOHBaTHpnMUdBVU9LSkVOUXBSM2FLcTl5U1hD?=
 =?utf-8?B?b1RWVXgwK2h5d2t0VDF2N3RaOHJhMWtNM3hqRXVUQ0hPZ2pHZjZRV1RDRVpy?=
 =?utf-8?B?Unc4bTZYUUdVb1A3czlET0ZidWJLT3FnTkgvTTV1Wk5vbW4vL1NyMVlYajN1?=
 =?utf-8?B?bUZGSFJsSmlKbVluNTZqQU5JdEpLSWpTdVROdWtuVmNoVmdUcm8vTGJwZnZ5?=
 =?utf-8?B?OFI4VE5tQzV3QkZtc3NKaUt1d1VUMkg4MHo1YmZCTlZ4VkRnbEUyZGM0aFZv?=
 =?utf-8?B?MlVjanU5QWkwNEMreTFhb1dHOUxmaDl1cUc2eWJnU1h0R0Vwc2orUEhvSUxw?=
 =?utf-8?B?Rm5iQjNnbGYrOGlGNUg5SmFadlNDTEF1bzVEWlZEOWRWdjRkN0U0TUNTelhp?=
 =?utf-8?B?VlFwWG1lY05IeWlDenFZejNnbjcwcExlalBLY1RrMUJUU3ZjMmRBcUs4akxK?=
 =?utf-8?B?TUVkY2FpYk5lay82SGZRU2xweG4yZUs2aVVuNkoyMW92OUltakZwWnR6TjhI?=
 =?utf-8?B?a2NxUUIxQ3QvbEYrbGZOMzNtOVd4V0JVTDkvR2xGdWJIaGd6YVFSS1lpWFg2?=
 =?utf-8?B?Wml3N2R6ZmF3ZjM1Qllxb1hKMHZyS0RuZkJnazVjTHk0dEZSVGxSWW44SE5s?=
 =?utf-8?B?NGRPem9lckQ3SkYzRG9uMzE2R044WUtPbklSRVIzY256dU9VNURML0VIcC9j?=
 =?utf-8?B?bzhYUkZpWmxnZGdvNkFna1hRNTc2M3Bld0luZW0zUkpnKzNDckk2aFZuQVhk?=
 =?utf-8?B?OEFNZld4cWhJMm9hT1pqVVordVZrQ0Qrcm4vV2kzeEpuOGFzKzRoazcyWnB3?=
 =?utf-8?B?ejlnRWZYR3VGVnZCUHhNUms5S1hvOW9SenNnUVV3cyt1Smx2b2poV0JzUG9t?=
 =?utf-8?B?QVVpRG5JUjdoOFpFNzRTTDJzaVB4VVVaUm5JeGRiZS9QRE4ra1J6dUhpNWha?=
 =?utf-8?B?UVp3TExWcTBldFRaVUFSNVViam12cURXSExORkVqV2ViZ2RQMFN3VXhDdEh4?=
 =?utf-8?B?bHR4QUExbTEwVUJCd1BrOVlEV3g1cytoczF3WXNuN0pRbGVRTEJCVWJta0hD?=
 =?utf-8?B?S0hCNkgyNUJIWkoyRVV1QnFNOUpjYmRER3orUXI3RXMyK3RicENjb2plNUJ6?=
 =?utf-8?B?THJkaUZmdEVLUTlrY2h5cEgwTTgwM3U0eGJ2Rm1rOWE4dFkxcEUwUld0bmw1?=
 =?utf-8?B?aHorc1hreVhKZGtvdVJnWjBWWXVLR0FkcjJVRjUzZVlyTy96MGprZThLSlRr?=
 =?utf-8?B?K1dNTTM3ejk3dnJ1cmMrK3BFYnF4Wmt3OVRSU0o3THFobElCZ2hYNmk3U2JG?=
 =?utf-8?B?TkExb0dyWmFqblI4VkZxZWQxMERDRTUxSmV4TUdxNXFBVzllRUJGS0M0a3ly?=
 =?utf-8?B?SGFPRWNNTHBuMHp1a0ZkQWpPTGFVZDZ3NGg0V0VvTUtmSHpkYmFXUXNpdEln?=
 =?utf-8?B?UEN0V1R0MmVQTzc3Y3htTTRPVC92TU1VeXhxTjcyUVVrVHdnOUpEWEJvMUc5?=
 =?utf-8?B?ZHhYMVNpdmtQcHZzVUVnRkZYUjRPZVo3RXNRclF0c3JQdXgyR08vNjZKQkVO?=
 =?utf-8?B?TXJ0RzBWSmR3ZzJkOWQwblRtWTVLMzZNZEtsN25wSmt3d2xaUU5LZTdMYTd4?=
 =?utf-8?B?Z1BoZWtsU1RLeHNWdG1wK2VUdFFXTllqWndzSlZvM0JYRXRLQStoYTRlNkZE?=
 =?utf-8?B?Y1hxay9Id1RIVVFydFNaUXJuWFFwMnh6V0ZUZk9FT0RxaGl0bUFYK1lyWTEr?=
 =?utf-8?B?R29CNFMrNFJYck1ZQUFRQlJqdlZTZFF2MHg1bEExMmNFMkNZdDJzYTRFUjh3?=
 =?utf-8?B?R3MwMVhRd3BJKzZkT3Rubk5tYVc2amcwcjR4WlQwM3FIRTFxaUpXTmt4eFMx?=
 =?utf-8?B?VzN1cEsrc0l2Y1RkZUhXeGNKeEc0aHE2VU1ybC84cXJ1WTl1RWlRMjZRQWxu?=
 =?utf-8?B?NGlnaHFMNE1zR3IxQVJDYnA2U1AwRjAybks5MzFwMjlkN0wvVXR5S0Fabkl6?=
 =?utf-8?B?ZGlXMFpHV0drN0pjNnJGTDFrRVowUU83OUg1Nmx0NW5heUNIMmQ1Mlc1WnpM?=
 =?utf-8?Q?ik3xgLE+yjFUH2yw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d63e51-f200-4efb-76b7-08de79cea90b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:16:04.1168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvd8SANcxL57700DWdGue8M8nxOG4uZiTnDzEE7mUc+wO9ulpUEUjhJwPAwIeKjJbqaM4prujvMz+KtmLH5qvv6rZL+2xxQ0/aZPPbILtuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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

When xe-vfio-pci waits for VF FLR completion, it may start waiting
for "FLR done" before the PF driver is notified about the reset by
the GuC. With delayed HW/FW notification, the PF may not yet observe
VF FLR in progress when the wait path is entered, which can lead to
the reset being treated as completed before it has actually begun.

This series introduces an optional FLR_PREPARE state in the PF control
flow to mark that a VF reset is pending before the GuC VF FLR event is
received. The wait path treats this state the same as FLR_WIP, ensuring
that external waiters do not return prematurely.

The second patch hooks into the PCI error handler reset_prepare()
callback in xe-vfio-pci to notify the PF about the upcoming VF reset
before reset_done() is executed.

Piotr Piórkowski (2):
  drm/xe/pf: Add early VF FLR prepare state to PF control flow
  vfio/xe: Notify PF about VF FLR in reset_prepare

 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 45 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_control.c      | 24 ++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h      |  1 +
 drivers/gpu/drm/xe/xe_sriov_vfio.c            |  1 +
 drivers/vfio/pci/xe/main.c                    | 14 ++++++
 include/drm/intel/xe_sriov_vfio.h             | 11 +++++
 8 files changed, 95 insertions(+), 4 deletions(-)

-- 
2.34.1

