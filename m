Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13528CA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E710F03C;
	Mon, 12 Oct 2026 11:52:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A88D10E449
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805948; x=1823341948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+6ZgdSLDxBc0rp5F/lRxMgENktI4F9ARt4G2BIm14hg=;
 b=NEiu9FUPiUpn020zepYVvnw5IvIjrd35rGAKO/lsau/HCtjOcrUjz1Vs
 Gtx3uWpMmHw8AgdnH37ENQGUMtDICEzmjb0Qp1HZBEOPumbmA8clThh80
 RnoW3L1ZjBn4q5pQzEougrVTVAoiuJDr3AdfRAML1izcwMeOb2j9U3mRE
 WGz8YRkGyxSIWLl6ZonWwEwGrfmVP1R5prOTS25RtY0wT1SRXVOAaRePQ
 T4lNMnD+L7zQ8mZOKVF8xlTh3MPOPQPAuEv/e29S/LssLGwuPYzIEziSB
 L7e50UF34MeAUjpFPp/TAEpg8edZHnHTGJ3AdbY1PdY+osAVppWCEJSKG w==;
X-CSE-ConnectionGUID: ZW4DhgXeSvatb1vLHZHf7w==
X-CSE-MsgGUID: FYLPGlGzT/Ojfv/FQcQuzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="411783"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="411783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:27 -0700
X-CSE-ConnectionGUID: ORRfGIIpRDaJeoA2KemFUg==
X-CSE-MsgGUID: E3JhJU6wQ4ukf+tQJHZ/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1190835"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:52:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se6w3/vnIg9mIsedS62EGBV9LMYGhTJ4R6f5oqFBMMHi1CZNoPBQbOMNBIsYPy6/Oex7eSM1QZ8H3eQCdwRoTeFA3fd0N71OxsIXOl6Vlt+swwre0ZRbXKvDpBkC+lxRiRClAe1kYWNBEGVSfM8V3zEbVPr/CtjaD++4+wYA1p7S2cwBWUt+kx29CN7AHEfjbPCvuKovJCnawgTbEIyAwoKSalEQH0RyfPnIh9JryRYXDhoDYqXaAyhYMr67cqXsBJ+07f5SrsBmM1agU3BsvI/5dB6O8b5Ij0j0jxzdkHQ6zxm5qrHn35oLDPI4qyI88ZhdgCtw3NNTtlXSyvI/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9+sJJW+tJW38hNJxhWv7eEUK+yOJTpfAWqtwOFK5+A=;
 b=hfl6m4XaxNDvCRV0i1dOlqx5mW4GUlFLloMEhok2XvZER6yGvsBCo5BoLRGfxAlOkMewFHD/cCNOgjIPebvPXhFkYGMm5cCcKLtMvHFQwf7e0mzIkaLOJ4nbEYHoMfiSjERFA4mMZReEzg+buN0tn6fo+DQ412WcLA7NapoRo0qQikJk8MVlJj2bHXMvZgnPPJNzvEvziwqc0H/2oIusdjroyrHTHuguCOolS1nxRGf+9bO9WXN+AmOE9gsk+vL7chaOZGIGvzOhGwSR/hr72xYyVv12MWRltaSNcTklbWt87gpat440tzkiWp3w/gdPrpy2s+PeSU2d0c52G2Za0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 11:52:22 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:52:22 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for VFs
 provisioning
Date: Mon, 12 Oct 2026 13:51:43 +0200
Message-ID: <20261012115143.4100364-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0165.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::6) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cce9a88-8cde-4cc7-c102-08df285746d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fxsZI0i5AD4oy9VfvlzrvzLu3Ohl3n1yWrEleC6pJNwsLzXFLH8FKlnOwVr/CF6RGJeWT3Mf6leAZa1LEAed7rvtep349F9uu0TOe/EkmUvmVXjKxdDGv/CvbfVTT/het+R7f0OLFA7DsDsmhCV+IbeVjFu0H75SYKIrabpnWtOf/UTSa0lE+wQNm94g/xuiocJo8Y8o8skT+wT1rp0QjdVC7nmpjmORmC3kiZSAp4j+c4osuHF+qy+KKc16GwTbNu/vQSZLubHYL+sAiK5OY9Moc632ZTwTQFYzeT3HMi0T+GrTUfyUTBMLn7AtfHsWGbIHRITrTTBya6dq8vxGZrQ5y1NlRqQhLPimd11aLK3uSDN1fT+6YduQ22/owh3Zsh9mX5JACG9J6qwRekFvbJPOSucUs/Q05WmbVON+LQFBCmLe0mTEPupQxKm3h5FlGurs4Jte/rqUpyUrNHmRG37NethowEW1x+MvJXwo2fG/xIUruZmytbebRcNpA8fXUV3/ymiCuDFy9c9I8ySpR2tsnJ7fRSorUQYRFzTd1jClzkHsp8rMe1aTg92uI/IG6bDEKTmYZk7hySxVoAMJyD36MtXDLTzBGWMVdbn16BNIx6w+mEHwSvwCQGpNvJrKyF363QwL/b0cPtxxXvoz4v8L4RmomuDXTrd2I95AfsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxlaU41WFY2c01NN29XY0d3U2RhOTAxaThrY0YvT2YyRWtpbnpuRTBEbmly?=
 =?utf-8?B?NzZTM05TeTBGQU9oUnREYitSSVo3Qk9odjVvZXEyaXlSTDVKQnJiMTZXUVpo?=
 =?utf-8?B?WUZMS3VFN1VvN2tObG1yKy84SG04ODFKWDZsbDh5WmYyaVdXNXMrTkRvTWVX?=
 =?utf-8?B?VVhQOWV5WWlGbDB1WllsN3I4TEhXLzA0TTR6cUFHU0JGamlONC9zZ1hDNWx5?=
 =?utf-8?B?T0s3U3hRYzNzb09DUld3cUN3RTk2TFlaTEQ5VWJyQUhhTUpqd0hXeXJtUjZR?=
 =?utf-8?B?bGFmSkNWNXFhMmZJYXpKeTFsZGdxa0NqNTVacFRnbExvcEQ2ZkdSY3dJdXZM?=
 =?utf-8?B?ZDhMa1ZjZDUwRnpEd054SlFQZXV5VWVmdDBTd0RweXBCVGMzV2VXL2EweDFw?=
 =?utf-8?B?R3dpY2wyNzZ2bnZ3UmZMREF6N3pBZDN5VFlDYzZ1R25EM29LN0pMTFM3R2sy?=
 =?utf-8?B?eXJ2dmxLZm5hd2hnTnJrcUJ0V05LL25VUlk4bDB2cGlBejRGRHBtaC9Fbk9y?=
 =?utf-8?B?WVhyZy9TcXg0ZVpoQlg1eXgvMmRaT3ZwYzNIcjJJcWJhK0RteDRsVlVpS2cr?=
 =?utf-8?B?c1ZrTjhhbVc1VGhENEpXdyt3UW5ZYjJpQTFmYUl2aEFPQnRFTmx6QjgrOU1o?=
 =?utf-8?B?L2NOTWdhREdFTHR2S05JNGxaWkwvd2FMM08ydVdHdmtqVkhZTmV2RmRJWFJy?=
 =?utf-8?B?MlA0VVFHUHdoQXJNcEM2eGVYOVdwWTZtcENPRTdiOFUwVUtySE5kUWVQYWJE?=
 =?utf-8?B?SkVZVi92bVlGQmpFYksvVFN6eGNpS1hraW0vay9MZEF5bXU1ZUZERmdvTGtC?=
 =?utf-8?B?SWVMUjVHbzlNYWo1RXFQazd5MUpmaEErSlJVZWtZbVQ0YzhUTGxvYXZHbnVG?=
 =?utf-8?B?MFFGUG9UZ29jR2VVR3RibHE2ZlVmRWViL2tHajQ0K3BLZ0xOZFVUcFJqazhy?=
 =?utf-8?B?S214bWViSzZwYXJIOVlmV0ZQUU5xNWYyQ1U4OTBnUzRNWmk1R0NNN00xME5r?=
 =?utf-8?B?NnBiSmRwcVVLLzhCUW02RSthYzhTQVlsZ3JEcmR6aG4walVDdEROelc4TnRv?=
 =?utf-8?B?ZEVwaE1iUVpmc2ZGOVBBVDFZUFpyMnpoVXBMUmZNcjlENVZVZCtZTUFLQWFT?=
 =?utf-8?B?TG5nWWJDbVBRYmdidUwxUnFpSXVIUzY0NVQ2YnRBL1NmWWN2MHdFbXNNeEZx?=
 =?utf-8?B?R3piMlZ1bE5ERW9jWk9DMXFXVmlMQldTQTNOQWl2K0FIMUIrUHBTTndYc01t?=
 =?utf-8?B?QkpUTjhaOG50UXA1ZFdJbng5emVQMHo4M3JmVmxENDBDZi9ZTEtmRjZ6SjRZ?=
 =?utf-8?B?b21nVGxGS0hSTHgrWGRXb1EreFpVUEVDSERDWE9RODRwT0F0N01hWWtGT0Z2?=
 =?utf-8?B?ak9jZEhiaG1vVVNLM2tBVnd0V1RWMWxLc1ROWWcvcERIYTZ3U2VSZlBtQ0Uz?=
 =?utf-8?B?QTJROFo2cWQrK0hIdm1jWnRGQVFSVnU2amY4dWs5WnpDc2ZkMDhxNmJVZi8w?=
 =?utf-8?B?dTIvUmFLNldDL09odFlHSlVaMW1wQXRXMzhLUktCbUhiZXZmazB6UEk0bzlT?=
 =?utf-8?B?SVJuZWdBRjNVK1FrU3I2RzM5Tko1VkoxZXo3S0I1dzllOFljT1Z0MndHdjRq?=
 =?utf-8?B?eGJtK2Y5czJtU01sMnBrcHZsNUx5YTdqMmJqMGtTV3JCMENjSlN4NjFtbWZR?=
 =?utf-8?B?ZGpEc1FZQk91TTJWQkY5cDJPQ1RNQ3F5dE12N2E1QWVsRDNUczBWdk5PVHBP?=
 =?utf-8?B?aDlpWVZhN3R4REx0ZTQyRWhxYk1FdmhaVTJocWZKczhNZVdOL0YzUFRkUk9h?=
 =?utf-8?B?aGRTTkltKzYzbWZxbWd1NStKSThQT05LcUZwUms3RklRRE5BbnU1TWxWRXdp?=
 =?utf-8?B?QkM0eDB6ZUkrTnNIeGtLK1Z6TzN4ME4rdEx6a2g3N1IycXFpdDQ2L3NSWmRp?=
 =?utf-8?B?b1p6aGFYRjF4U1c4ODFsQmc5UzZZb3l4RkRMaTlaZldxbUdVMk82dlBWYUtw?=
 =?utf-8?B?dmgySERjZVBqWENwUUxRWmlTZHJQQnpYa0lZcnhYcmZkRVc4Y3JBMGpuZkJu?=
 =?utf-8?B?TFlDKzF4SUZHcjFscXdtb3hGZnFRK3EzNVhCdEhKRjJub3FSR1ZuOUVGWkNL?=
 =?utf-8?B?VUEwTS9EV08zNnFweHRRTWkzc0JoUHJqU0pGR1IyTGliWmt2N2tlYVlyY1hh?=
 =?utf-8?B?bGtLVUc2WGFES1plakRzZVRYVHV2OTZ2N0l5cElkUXU4aHpYNUtLemxWMDBz?=
 =?utf-8?B?RkVpWUsrTUoxdWRNRHNKZm85c0VpN2oxK0xYU001a3NGVlNxQTVYNGNraThr?=
 =?utf-8?B?WHNzU3BobzN4b0ZKNHVDOUthQWdHWWlTaGZUa1Y5U3ByZ0U0eDdwSmVzcEdB?=
 =?utf-8?Q?e32cPy2aS8AWLluY=3D?=
X-Exchange-RoutingPolicyChecked: HVy97ai7hvDVAU2/fV8O8JSJpGZ06BGa02WUNhftd9GIHcs6wzkc/jP9BBvY8X08snvAPpB07njwNEGWmgP6Rgo7XauSNovzb/YcickHUqpX+ZUjgQvLS6j8KLEyYs5MCHeBs3yORgVe6pC6Q4WsVeU37qsK2iixu3QqCFV4UOcTD8ISxdF0Zf0aw7mnsF/W0Js7f0R6edacH8bgf8ezeeOnkR+755UhXkqpyVTzaiEihXfFzsNzRbd92vv37UAakGgK/qbqKKPXcxRspZuvfLzpPie0ry2ZgRPu8oOSHJxI0J+q68Fkv9JeIKTDezalZkwZBIXBsM43EtA6jQAP8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cce9a88-8cde-4cc7-c102-08df285746d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:52:22.7598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeLMZDMPv3kFLOEOhEmv2gBu4F/Ukp3CNGnVHNWuj4rcrIJWry/5gq4R7fRXU/ZUxB61LS7sLbJE5tSB9Yv+SAkQ7AZ8TEKWdvDPUAZDRyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

v2: Use local variable for max shareable GuC IDs in fair profile (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 21 ++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 57 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 24 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30f..4d72411cd570c 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 = 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
 
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
 
+	idm = &gt->uc.guc.submission_state.idm;
+	mutex_init(&gt->uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index de1ac58e31412..0a47458e5bf20 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (spare > GUC_ID_MAX)
+	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (spare && spare < pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	unsigned int spare = pf_get_spare_ctxs(gt);
 
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
 
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_ctxs > GUC_ID_MAX)
+	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
 		return -EINVAL;
 
 	if (config->num_ctxs) {
@@ -1170,23 +1170,30 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
 
 static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
 
 	if (admin_only_pf && num_vfs == 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(max_shareable, SZ_1K);
 
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(max_shareable / num_vfs);
 }
 
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
+	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
 
+	if (max_shareable <= spare)
+		return 0;
+
+	fair = (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret < 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 9bf9f0e5b7c28..7c7f5aaecfa06 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -120,9 +120,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int
 }
 
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range of
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -284,38 +288,6 @@ static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigne
 	return id;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
-				    unsigned int retain)
-{
-	unsigned int total = idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		int err;
-
-		err = idm_check_quota(bitmap_weight(idm->bitmap, total), count, retain, total);
-		if (err)
-			return err;
-
-		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
-	} else {
-		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
-	}
-
-	if (id >= total)
-		return -ENOSPC;
-
-	bitmap_set(idm->bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -473,25 +445,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret = idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index ed9970829a939..844d68440b0af 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 					unsigned int count);
-- 
2.34.1

