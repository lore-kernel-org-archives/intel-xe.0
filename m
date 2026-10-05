Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63905CA5FCE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 09:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2015110EC46;
	Mon,  5 Oct 2026 09:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTvybBiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7F10EC46
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791192667; x=1822728667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nB3WwlVm1256sXM/TyDs9Swr/w19UCPGZSYwljIJmWg=;
 b=mTvybBiWXK5moO7NZS6WmhlALmudCGWtaiZG1QkMI+zQS4IS0FB2CLiW
 s8Py6t59v3jGtl7JJ0TA+UkIXVNIFygRZgB2ozDrFzGtox2D9vF0MA8CE
 sRBPdigxzvwUQzUgDK/o7bVQs4LBaT34tUn77zPTdNW0Trpp46PaA2jwR
 U+gyS7zy8vZxRyLX0KtdPR7oYT0U7owIViz89U1PY0uYqSz+Iy9dyj0cw
 y40BIxUu9zTWFVGN+KHHYAfy9ZkS3KlvQ3JZYwdhOeHpTNnJKJnTrbC3b
 8ycX4fa2Qk2p9RyvRlbZzRhWOyppZNU70l5JyqqMHvSpztGtSKYG7gFKJ g==;
X-CSE-ConnectionGUID: ueDNH1fcQsipdqmEhoH4xw==
X-CSE-MsgGUID: Mb4veTRQRaWETBY8wy6EkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94732762"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94732762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:54 -0700
X-CSE-ConnectionGUID: 5XrxKkRPTWqcgULGzKBOCw==
X-CSE-MsgGUID: IztUfCv4Riyg1MAoZsgHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="276863807"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 02:30:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 02:30:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 02:30:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9aVMOluJOsvGJfJ18p5F1CV8qFP59OwduFhSaFagaSPjZimZQKDy6iftQ2tITfLPubBM/RLBSfKFWYpoXBd8FlS7otvhNb3d/wxhLdlWtZWrjAws6hNaISnOwPvJHcpLgIaBe2D64bsG+0xLx2NpUriWfzUSCLX6wlh+wjrTUgwwyJprQp9H3jAxYvDoPVgmOqynplf9qRnghqF6vTE4RQHcpvxT9MdvupR6KXqmZVYniLDh0f0ZjV3fZgR9zuR/L1ZfyFAZHmDeza6zWRvHmqYDmiwHJe2P+bsveDF0hCWSxnnd2ndKOZHl3UJYCQFV4xGqRneye1clnJRKi26Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qS8e+Q5JtPWuIxEStA8CwMNjyezh4251kWuSh7eQhh8=;
 b=sB2bhNQEHqkYZ9GunAqIqWCt5CDdmASoMkdSviliUDjEhwLFjpTUzfLqEjSk0zs4o5zvXaBt7mfXe7SRWkQ9zvCHmExvIy5Y4VX5qSrBleOsw/Qr2yjX1X8QUK+qNsBRfFuq2IqpEhXa3xq78DjmStz5Jo/vMiBMOhJ7+N0OTAmkFKmj9CH2cT21Y6rsfZrqKQGGMvl/6HGGGZhWcsoSwplaJeVeggbcx1D+NGDJm94B8GlHo5JMxu6NRimaEsf8SkL+/20V7SaWt02REND4ECvymyXEe03c0qjd7Ol7yuWJgTwkaotreYhxL0okBAq4LSqy4hyXwn7FlUxF93rQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA3PR11MB662844.namprd11.prod.outlook.com (2603:10b6:806:538::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 09:30:48 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 09:30:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/7] drm/xe/vram: Make VRAM pools the allocation handle
Date: Mon, 5 Oct 2026 11:30:17 +0200
Message-ID: <20261005093021.3741599-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
References: <20261005093021.3741599-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA3PR11MB662844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b38ea6a-8937-4f3e-d433-08df22c356c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|6133799003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZOi35cGbr96+ALFEs6EIrlj+jn5ocvYqCGvPRlmJSi9BimXZ6s0TiWQygjAMUa5Wcy8QOBpER6i7nQJqTCrySZ5JzXvXHnAiJUi24vME+eCHi/x0d4PTRO9Y/lLJxGOZb6ecFhztZRnxXjoqTRRE2HLP6d4ERNbq8Jd5fINnrg45Jy8bTWLWtF4FuLtQP1HwrcaA44tU1F7vlwykCHgIppJmup3bO+d+lZZ0JTLJycDs+aMadD3XxkEiYlSPHWLNtI8v2GmfMJvNjSZhrqsDwCQlhyXWod48dEFuU1AV0rh9IwjPzbpBEnKK2qAE6asfWt6TZA5X148TqzDkR0KVRIKj4QDLYc8ffkKqn+5c2bmPXUgWc1yVWgCGdQihi3AZ7KviXw2fRy8j++U7nT+mGlCCJ7bBB7o53jKdNME84JvaOWlRPzryMsiy5r7qjUUSDTqRkYpFdLITVkDAzfSCjDpSesVWiH5DIdPpLGHUxhdIdHDV5pGFgHxuM1GsmQCRAURaT1u4+Wkt5mMshRhsJvR3u7XurBpN2PiXQd4thMFiYpN2+IE24fa3xp0o9x3XOm6CVXzGAW4ghPnSl+YuJJu6WFdV9KvUhLQdAJcKX05hCxA8LDQVNFzuXMIU4R8i59lj/qVJhEjbqwEuvhzJZ22P8E1oy5vzpG9Z7N9IwVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(6133799003)(5023799004)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlGMWxiUHExbXJhaWdmNXh2TjBISHdiSUVyZGdleVJNMklFRFJ6Wk1EWVVT?=
 =?utf-8?B?WEVwZW41ZGdJY24xbGx0YkV6T1VtYkVWRVBPdmtweFBOZllRQU9lN2drMzVW?=
 =?utf-8?B?WlhmQ21FdGZtWlJjLzU4TkVDM0d4SXIwQ0pHRlZSaW9TZGo5OTJHZjk1bVd6?=
 =?utf-8?B?ZjVVdEhUc2p3QXBGblBMRmNHdnphTmNLTHphYlA4MkplN2pxMVo1bmwrV0FJ?=
 =?utf-8?B?VEEvZ2o5V05YOWg2WGE3alNEVmdTWHdUdmY4WW1UM1psVFZyY2VrUGtkU0ky?=
 =?utf-8?B?OFd0L2lkSGdtQXAxdFlqeVVUSFZRYlRqdDE2ZFlOTk80emlIT3JJNkx0ZXht?=
 =?utf-8?B?YmF2ZHJaNWhRd1QwM3FGTjZOV2s4R1hqNFExRkxVSElrVndOeEJtWUFGZzdS?=
 =?utf-8?B?cWFQNEFRNUpnT2hmeTdvYWdaNm5DczQyTjVvTHl4TThiOGhmZ1pnemFNdGhq?=
 =?utf-8?B?NmlHY09vSEtaeGZpN0xkc2QzOWlQay80K3VZS3ZFc0hBVzlKS0dWaEYrQWlG?=
 =?utf-8?B?UFVHZDZMKyt6NElhR0dIQlNXSkZNWnYzaGVLZ0EvWmt1SkF4SmJxTUtYb0tW?=
 =?utf-8?B?dndKK1RucHUwc2U4MnFybVlQVDVoUzBzMjkvb00rNU1ZYU5GeXdPVFY2Zk9V?=
 =?utf-8?B?dE1peW8vanZsbGd6VG1nNExpSDBjeTZ6c25kTW9SMGpNSnJxQXkveFRnTFBm?=
 =?utf-8?B?MCtFc1FwOFVBdk1UQzRzLzkyWEFhWTJKN1prUEEvd29oNXd2L21CMjk2azlH?=
 =?utf-8?B?T3pWMzFFaUtjV1M3OXg3NWRzaGNpYjYzRjF4SVRJTzE0SGowZ1B6VGlKNWxF?=
 =?utf-8?B?eGUwbmhmZC90UGZZaVJ2Y0lER2lBd0lzajJzQWl1ZkFiSVNFM3htOUVkcS9n?=
 =?utf-8?B?M05KWkNpYm1NT0pkQmVlaFZDY1NqN3dNM0kvR1lsaG1zTkZncFRqQ2N5WWdF?=
 =?utf-8?B?STQvODJod0hTaXJHRkFkQU45SVRwZW9zT2pteHhDTUUyb3E5VEc2aEgrcjRJ?=
 =?utf-8?B?R2pXcFZvVGg1WmZHRVBkMjV2aytjSDVjVWdJOFk3MUFiWk43QWhxY1RFTUtK?=
 =?utf-8?B?TTJCRUdocnRTUjFneDRjSmZGd3NoanVFb3RUdEtQMkV3bUNGUlBOUllWRzdM?=
 =?utf-8?B?eXlzd2VyS1VEVGdPL3dqeTRUSVhYNnNmVVpDTUVGeVl3NWMvNDFrcHZ1aW4x?=
 =?utf-8?B?MmxnRGtKMFowNWtNL0tZdUg0cXlsaTdldXQ5Y2VYVTg1bTUzbytsL0tudU9R?=
 =?utf-8?B?N3l6R0VGZERwUEtDZ2JFQnNZY2xSRjJSaDRjeXZGZ3ZQWW5JODVmZXR0cm9O?=
 =?utf-8?B?UkQ4SjFVTXFRU1BDd2NsYUdRUTdzc29UeWhZaHM3V1ZoVkIrbzRCbkdPdlpP?=
 =?utf-8?B?bWtlOStIWGIwVzRSdERZelJXQTZ5Zms5bEpqYS9YL0pjSEpERjkrOFFpRmlj?=
 =?utf-8?B?dG5QajBzaU92N3RMalRMTDRudk4xNW9aaVNUbjJsNnFlVDgyNnI0WlAvTnJq?=
 =?utf-8?B?S3cwWVdTSDNhYy9wWE0vZUZsY0tnWEZVd3RmOXVMQVF4RGNHM1lVZUZoZWxr?=
 =?utf-8?B?WDd0UTdwSE5VeTVsUitrMFlKcFFxKyt1aUQ0S2k1eW1Xekc4KzJQL3JkTnls?=
 =?utf-8?B?RjF6RzRWQVlpYlJ6Z1ViV3FRcGpTODViVExrT0IvK3I1Mnc1cHZOM0k1K3BU?=
 =?utf-8?B?U1g1UktyRzBIcjNvWnpjL1ZTc2xnVVBiUG8zRi9uT3Z2WTFjSkFnQXpYNDRs?=
 =?utf-8?B?RGh4NURiYTAwSXZwR0tPN0lrRmd5UlRvUFp2VGRENW53M1B1QlVocFVEZ2hT?=
 =?utf-8?B?RlRNL1BSTDNIWkJUSWlINzVYbCtDNkI0OVF5TzdXdnBWRXNLSmx4NzhoU2NM?=
 =?utf-8?B?MGFGZVBsVWxmaTVrTUk4OVRGZGdESk1USEl1bnVYdUFDR09RQXBtRngvYjhV?=
 =?utf-8?B?REFPdDhIcWtmR0c2MDRoYms2SS9pUE1Ecm5rS0o4Nk0wVVdRbDNBR3VaT21D?=
 =?utf-8?B?eHo2KzhVSVYrdm1rZVN1MUIzbGhXWnZxd2JkeTdUYzFzK3lZczcrQ0pnZEds?=
 =?utf-8?B?SUwxeDVxQWFGRGdDOTA4N0t3VWZVVkhMYWtCMWpBaGM1d2N1OEQrc0IzSHp2?=
 =?utf-8?B?L1F5b3pvT1E0dGs0OGhSSEtaaG1sbVJGY2sxZEdCblFlMVVycXU5YndHT2wz?=
 =?utf-8?B?dERCMlF3UTZWeVdXTGtHaVI2Y0dBbmVLVUdiMk15VytoS1hGek0yQW9PeU5P?=
 =?utf-8?B?cGN0djZzOWxVMUJaTWdjZEIwTWtacldKOEEwL1VneXh6Q3FoUGVRL2xDQzNQ?=
 =?utf-8?B?L2t2WjV0dGVzMWoxY2J1SnFjNGlBc3JmWXpQbU5tVHYzRWFyZXNXcnlBSmdw?=
 =?utf-8?Q?kGUIMBpMzz5fVoSA=3D?=
X-Exchange-RoutingPolicyChecked: dfU1h3wM1v7Y5WbC6izvuQcPahv20IIBYCJFWYW2pEw6wJDF/lI0MdTCRmBlYk9KY3/e++w3j/vN3X+51r+A1xxXuksjgXCQDMKIbsaXHNSG7hBGQrGnEdHrFZCmFXhiQR4q/Ag6xqa65D5UMq49zm5MAU7gGM5V2zBDGfHhzyyrWCx0nPL3FXL5jTS7MpBvH1rG/ieqe0VcZc5d8XAQOMOvEACR1kl7slECSheinsoEerecmVmSLgrbM2y4UE/XFFpfr+IP56f5JqQy3b3Tj5NJ7uRn1HKbh73+5scXEniSGPHiiRgH/cahfUC3tqm9/gBGlwt/GQfuBU7skryJdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b38ea6a-8937-4f3e-d433-08df22c356c2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:30:48.2755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3krWrorSamK34EnKW81/a39H3VfDbQMLfMm0O9O8HisUWGxsKXLbT/qfoy/AkfU5Y9tNPdFUReW3gmABytARQPDftpXDio0F/XEBk0g8A/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB662844
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

Allocation paths take a struct xe_vram_pool instead of a struct
xe_vram_region, so that a region can later be split into several pools
without touching every consumer again.

A pool resolves to a TTM placement through xe_vram_pool_place(), which
only ever narrows the page range of the placement, so that it composes
with a caller supplied range such as the CPU visible window of a small
BAR. Fixed placements apply it as well and fail if the requested range
does not intersect the pool.

BO creation and BO migration both resolve the pool serving the purpose
of an allocation through the pools the tile publishes, so they cannot
disagree on where an allocation of a given purpose goes. The PF queries
the free VRAM of the pool backing VF LMEM.

Every region still has exactly one pool spanning its whole usable range,
and the kernel pool of a tile is its general-purpose pool, so there is no
functional change.

v2: Handle tiles without a VRAM pool on integrated GPUs (Sashiko)

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/display/xe_panic.c         |   4 +-
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   8 +-
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  86 +++++---
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   3 +-
 drivers/gpu/drm/xe/xe_query.c                 |   6 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  22 +--
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_tile_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  32 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 185 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram.h                  |  13 +-
 24 files changed, 308 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 15fbd3fe6cbb7..9a3f14d358d24 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -322,7 +322,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    pin_params->needs_cpu_lmem_access &&
 	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
-		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram;
+		struct xe_vram_region *vram = xe_device_get_root_tile(xe)->mem.vram->region;
 
 		/*
 		 * If we need to able to access the clear-color value stored in
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 0f86b73036d03..971d9c78dd089 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -73,7 +73,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram)) {
+		if (phys_base >= xe_vram_region_usable_size(tile0->mem.vram->region)) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
index 1a6cee25e9d76..b223ae8fc0209 100644
--- a/drivers/gpu/drm/xe/display/xe_panic.c
+++ b/drivers/gpu/drm/xe/display/xe_panic.c
@@ -52,7 +52,7 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	if (new_page != panic->page) {
 		if (xe_bo_is_vram(bo)) {
 			/* Display is always mapped on root tile */
-			struct xe_vram_region *vram =
+			struct xe_vram_pool *vram =
 				xe_device_get_root_tile(xe_bo_device(bo))->mem.vram;
 
 			if (panic->page < 0 || new_page < panic->page) {
@@ -62,7 +62,7 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
 			}
 			iosys_map_set_vaddr_iomem(&panic->vmap,
-						  vram->mapping + panic->res.start);
+						  vram->region->mapping + panic->res.start);
 		} else {
 			xe_panic_kunmap(panic);
 			iosys_map_set_vaddr(&panic->vmap,
diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30f..2c67413b6acd4 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -44,8 +44,8 @@ static void pf_set_usable_vram(struct xe_device *xe, u64 usable)
 
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, tile);
 	xe->mem.vram->usable_size = usable;
-	tile->mem.vram->usable_size = usable;
-	KUNIT_ASSERT_EQ(test, usable, xe_vram_region_usable_size(tile->mem.vram));
+	tile->mem.vram->size = usable;
+	KUNIT_ASSERT_EQ(test, usable, xe_vram_pool_usable_size(tile->mem.vram));
 }
 
 static const void *num_vfs_gen_param(struct kunit *test, const void *prev, char *desc)
@@ -86,8 +86,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
 	vram->usable_size = TEST_VRAM;
+	vram->partitions[0] = (struct xe_vram_pool) { .region = vram, .size = TEST_VRAM };
+	vram->num_partitions = 1;
 	xe->mem.vram = vram;
-	xe->tiles[0].mem.vram = vram;
+	xe->tiles[0].mem.vram = &vram->partitions[0];
 
 	/* pretend we have a valid LMTT */
 	KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index a818eaa05b7dc..1475200751a6b 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -147,7 +147,8 @@
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
 		      __tile->id, ({ string_get_size(						\
-				     xe_vram_region_actual_physical_size(__tile->mem.vram), 1,	\
+				     xe_vram_region_actual_physical_size(__tile->mem.vram ?	\
+					__tile->mem.vram->region : NULL), 1,			\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6921b6967330d..b8a371a74e2d8 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -224,33 +224,53 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
-					   enum ttm_bo_type type)
+static enum xe_vram_pool_purpose bo_vram_purpose(u32 bo_flags, enum ttm_bo_type type)
 {
-	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+	return type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM) ?
+		XE_VRAM_POOL_KERNEL : XE_VRAM_POOL_GENERAL;
+}
 
-	xe_assert(xe, tile_id < xe->info.tile_count);
+/* BO creation and migration both resolve the pool of a purpose through here */
+static struct xe_vram_pool *tile_vram_pool(struct xe_tile *tile,
+					   enum xe_vram_pool_purpose purpose)
+{
+	return purpose == XE_VRAM_POOL_KERNEL ? tile->mem.kernel_vram : tile->mem.vram;
+}
 
-	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
-		return xe->tiles[tile_id].mem.kernel_vram->placement;
-	else
-		return xe->tiles[tile_id].mem.vram->placement;
+static struct xe_vram_pool *bo_vram_pool(struct xe_device *xe, u32 bo_flags,
+					 u32 vram_flag, enum ttm_bo_type type)
+{
+	struct xe_tile *tile = &xe->tiles[vram_bo_flag_to_tile_id(xe, vram_flag)];
+
+	return tile_vram_pool(tile, bo_vram_purpose(bo_flags, type));
 }
 
-static void add_vram(struct xe_device *xe, struct xe_bo *bo,
-		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
+static struct xe_vram_region *ttm_manager_to_vram_region(struct ttm_resource_manager *man)
 {
-	struct ttm_place place = { .mem_type = mem_type };
-	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
-	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
+	return container_of(to_xe_ttm_vram_mgr(man), struct xe_vram_region, ttm);
+}
 
-	struct xe_vram_region *vram;
+static struct xe_vram_pool *region_vram_pool(struct xe_vram_region *vram,
+					     enum xe_vram_pool_purpose purpose)
+{
+	struct xe_vram_pool *pool = tile_vram_pool(&vram->xe->tiles[vram->id], purpose);
+
+	xe_assert(vram->xe, pool->region == vram);
+
+	return pool;
+}
+
+static void add_vram(struct xe_device *xe, struct xe_bo *bo,
+		     struct ttm_place *places, u32 bo_flags,
+		     struct xe_vram_pool *pool, u32 *c)
+{
+	struct xe_vram_region *vram = pool->region;
+	struct ttm_place place = {};
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
-	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
-	xe_assert(xe, vram && vram->usable_size);
+	xe_assert(xe, vram->usable_size);
 	io_size = vram->io_size;
 
 	if (force_contiguous(bo_flags))
@@ -264,20 +284,31 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		}
 	}
+
+	xe_vram_pool_place(pool, &place);
 	places[*c] = place;
 	*c += 1;
 }
 
+static void xe_bo_set_vram_place(struct xe_device *xe, struct xe_bo *bo,
+				 struct ttm_place *place, u32 mem_type)
+{
+	struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
+	struct xe_vram_region *vram = ttm_manager_to_vram_region(man);
+	enum xe_vram_pool_purpose purpose = bo_vram_purpose(bo->flags, bo->ttm.type);
+	u32 c = 0;
+
+	add_vram(xe, bo, place, bo->flags, region_vram_pool(vram, purpose), &c);
+}
+
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
 	u32 vram_flag;
 
-	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
-
-		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
-	}
+	for_each_set_bo_vram_flag(vram_flag, bo_flags)
+		add_vram(xe, bo, bo->placements, bo_flags,
+			 bo_vram_pool(xe, bo_flags, vram_flag, type), c);
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -2519,10 +2550,13 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	if (flags & XE_BO_FLAG_STOLEN)
+	if (flags & XE_BO_FLAG_STOLEN) {
 		place->mem_type = XE_PL_STOLEN;
-	else
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
+	} else {
+		xe_vram_pool_place(bo_vram_pool(xe, flags, vram_flag, type), place);
+		if (place->lpfn && place->fpfn >= place->lpfn)
+			return -EINVAL;
+	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -3915,9 +3949,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct ttm_operation_ctx *tctx
 	drm_WARN_ON(&xe->drm, mem_type == XE_PL_STOLEN);
 
 	if (mem_type_is_vram(mem_type)) {
-		u32 c = 0;
-
-		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
+		xe_bo_set_vram_place(xe, bo, &requested, mem_type);
 	}
 
 	if (!tctx->no_wait_gpu)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 861b1be231ded..f93e22573985e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -31,7 +31,7 @@
 #define XE_BO_FLAG_STOLEN		BIT(4)
 #define XE_BO_FLAG_VRAM(vram)		(XE_BO_FLAG_VRAM0 << ((vram)->id))
 #define XE_BO_FLAG_VRAM_IF_DGFX(tile)	(IS_DGFX(tile_to_xe(tile)) ? \
-					 XE_BO_FLAG_VRAM((tile)->mem.vram) : \
+					 XE_BO_FLAG_VRAM((tile)->mem.vram->region) : \
 					 XE_BO_FLAG_SYSTEM)
 #define XE_BO_FLAG_GGTT			BIT(5)
 #define XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE BIT(6)
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 80f62634fae50..d167be7fbfbef 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -31,6 +31,7 @@
 #include "xe_sriov_pf_debugfs.h"
 #include "xe_sriov_vf.h"
 #include "xe_step.h"
+#include "xe_tile.h"
 #include "xe_tile_debugfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vsec.h"
@@ -99,7 +100,7 @@ static ssize_t inject_mempage_offline_trigger(struct file *f,
 {
 	struct xe_device *xe = file_inode(f)->i_private;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_vram_region *vr = tile->mem.vram;
+	struct xe_vram_region *vr = xe_tile_to_vr(tile);
 	u64 pfn;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8392c9fad3c48..2be96d86f4bee 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -689,7 +689,7 @@ static int xe_device_vram_alloc(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	vram = xe_vram_region_alloc_device(xe);
 	if (!vram)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 41f703a879169..bc6e9c30cf9f6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -303,7 +303,7 @@ struct xe_device {
 
 	/** @mem: memory info for device */
 	struct {
-		/** @mem.vram: VRAM info for device */
+		/** @mem.vram: device level VRAM region aggregating all tiles */
 		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458ed..95d3e0e3357df 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1715,7 +1715,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	bo = xe_bo_create_pin_range_novm(xe, tile,
 					 ALIGN(size, PAGE_SIZE), 0, ~0ull,
 					 ttm_bo_type_kernel,
-					 XE_BO_FLAG_VRAM(tile->mem.vram) |
+					 XE_BO_FLAG_VRAM(tile->mem.vram->region) |
 					 (alignment == SZ_2M ? XE_BO_FLAG_NEEDS_2M : 0) |
 					 XE_BO_FLAG_PINNED |
 					 XE_BO_FLAG_PINNED_LATE_RESTORE |
@@ -1926,7 +1926,8 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
+	/* Only the general-purpose pool can back VF LMEM, see pf_provision_vf_lmem() */
+	return xe_ttm_vram_get_pool_avail(tile->mem.vram);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
@@ -1967,7 +1968,7 @@ static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	bool admin_only_pf = xe_sriov_pf_admin_only(tile->xe);
-	u64 usable = xe_vram_region_usable_size(tile->mem.vram);
+	u64 usable = xe_vram_pool_usable_size(tile->mem.vram);
 	u64 spare = pf_get_min_spare_lmem(gt);
 	u64 available = usable > spare ? usable - spare : 0;
 	u64 shareable = ALIGN_DOWN(available, SZ_1G);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index fffb3eb6c76eb..6000c1f6dc765 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2596,7 +2596,7 @@ int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 	if (!xe_device_has_flat_ccs(xe))
 		return -EINVAL;
 
-	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
+	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram->region);
 	clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
 
 	scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 5247321c805ec..cfc0d9a25fba1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -19,6 +19,7 @@
 #include "xe_pagefault_types.h"
 #include "xe_pm.h"
 #include "xe_svm.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
 
@@ -201,7 +202,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
 				       (struct xe_val_flags) {});
 		drm_exec_until_all_locked(&exec) {
-			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
+			err = xe_pagefault_begin(&exec, vma, xe_tile_to_vr(tile),
 						 needs_vram == 1);
 			drm_exec_retry_on_contention(&exec);
 			xe_validation_retry_on_oom(&ctx, &err);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f5953683..0692ec93f55d2 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -414,12 +414,16 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 		 * However the uAPI is generic and it's userspace's
 		 * responsibility to check the mem_class, without any
 		 * assumption.
+		 *
+		 * Only the general-purpose VRAM region of a tile is ever
+		 * exposed, and there is exactly one of them per tile, so its
+		 * region id doubles as the tile index here.
 		 */
 		if (!IS_DGFX(xe))
 			gt_list->gt_list[iter].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[iter].near_mem_regions =
-				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->region->id) << 1;
 		gt_list->gt_list[iter].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[iter].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 909a602d091ea..7f58240b0b5b4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -2112,7 +2112,7 @@ int xe_pagemap_cache_create(struct xe_tile *tile)
 		if (IS_ERR(cache))
 			return PTR_ERR(cache);
 
-		tile->mem.vram->dpagemap_cache = cache;
+		tile->mem.vram->region->dpagemap_cache = cache;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 74d925a337b76..a916121177ba7 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -119,20 +119,12 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	vram = xe_vram_region_alloc_tile(xe, tile->id);
 	if (!vram)
 		return -ENOMEM;
-	tile->mem.vram = vram;
+	tile->mem.vram = xe_vram_region_default_pool(vram);
 
-	/*
-	 * If the kernel_vram is not already allocated,
-	 * it means that tile has common VRAM region for
-	 * kernel and user space.
-	 */
-	if (!tile->mem.kernel_vram)
-		tile->mem.kernel_vram = tile->mem.vram;
-
-	return 0;
+	return xe_vram_tile_alloc_kernel(tile);
 }
 
 /**
@@ -190,12 +182,14 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	if (err)
 		return err;
 
-	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
-		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->region->ttm.manager)) {
+		err = xe_ttm_vram_mgr_init(xe, tile->mem.vram->region);
 		if (err)
 			return err;
 
-		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+		/* The uAPI indexes the general-purpose region of a tile by tile id */
+		xe_assert(xe, tile->mem.vram->region->id == tile->id);
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->region->id) << 1;
 	}
 
 	return xe_tile_sysfs_init(tile);
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index a2a2c0e936b8e..ed34447c7d4f6 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -7,6 +7,7 @@
 #define _XE_TILE_H_
 
 #include "xe_tile_types.h"
+#include "xe_vram_types.h"
 
 struct xe_device;
 struct xe_pagemap;
@@ -29,11 +30,12 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
  * struct xe_tile pointer
  * @tile: Pointer to the struct xe_tile.
  *
- * Return: Pointer to the struct xe_vram_region embedded in *@tile.
+ * Return: Pointer to the struct xe_vram_region backing *@tile's general
+ * purpose VRAM pool, or NULL if *@tile has no VRAM.
  */
 static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile *tile)
 {
-	return tile->mem.vram;
+	return tile->mem.vram ? tile->mem.vram->region : NULL;
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index 5df2f461b7b7a..b69f4521eed35 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -109,8 +109,8 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
 {
 	if (tile->mem.vram)
-		ttm_resource_manager_create_debugfs(&tile->mem.vram->ttm.manager, tile->debugfs,
-						    "vram_mm");
+		ttm_resource_manager_create_debugfs(&tile->mem.vram->region->ttm.manager,
+						    tile->debugfs, "vram_mm");
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index e1368c04846ae..f2497828c4aae 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -66,20 +66,20 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM pool for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region *kernel_vram;
+		struct xe_vram_pool *kernel_vram;
 
 		/**
-		 * @mem.vram: general purpose VRAM info for tile.
+		 * @mem.vram: general purpose VRAM pool for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region *vram;
+		struct xe_vram_pool *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 60f39efb02d05..38a20307f49d6 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -63,7 +63,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 
 static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
+	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram->region;
 	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9a514d983e90b..c9a28fad7c069 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -27,6 +27,7 @@
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram.h"
 #include "xe_vram_types.h"
 
 static inline struct gpu_buddy_block *
@@ -507,7 +508,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_vram_region *vram = xe_map_resource_to_region(res);
 	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
@@ -545,7 +546,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + xe_vram_region_io_start(tile->mem.vram);
+		phys_addr_t phys = cursor.start + xe_vram_region_io_start(vram);
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
@@ -612,13 +613,20 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 	mutex_unlock(&mgr->lock);
 }
 
-u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
+/**
+ * xe_ttm_vram_get_pool_avail - Free memory of a VRAM pool
+ * @pool: The VRAM pool, its region's TTM manager must be initialized
+ *
+ * Return: the number of bytes still available for allocation from @pool.
+ */
+u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool)
 {
-	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
+	struct xe_ttm_vram_mgr *mgr = &pool->region->ttm;
 	u64 avail;
 
+	/* A pool still spans the whole region of its manager */
 	mutex_lock(&mgr->lock);
-	avail =  mgr->mm.avail;
+	avail = mgr->mm.avail;
 	mutex_unlock(&mgr->lock);
 
 	return avail;
@@ -864,11 +872,13 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
 	u8 id;
 
 	for_each_tile(tile, xe, id) {
-		struct xe_vram_region *vr = tile->mem.vram;
+		struct xe_vram_region *vr;
 
-		if (!vr)
+		if (!tile->mem.vram)
 			continue;
 
+		vr = tile->mem.vram->region;
+
 		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
 			return vr;
 
@@ -963,7 +973,7 @@ EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
 int xe_ttm_vram_inject_fault(struct xe_device *xe)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_vram_region *vr = tile->mem.vram;
+	struct xe_vram_region *vr = tile->mem.vram->region;
 	struct xe_ttm_vram_mgr *vram_mgr = &vr->ttm;
 	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
@@ -1018,11 +1028,13 @@ static int vram_bad_pages_show(struct seq_file *m, void *unused)
 			   to_xe_ttm_vram_mgr(man)->max_pages);
 
 	for_each_tile(tile, xe, id) {
-		struct xe_vram_region *vr = tile->mem.vram;
+		struct xe_vram_region *vr;
 
 		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
-		if (!man || !vr)
+		if (!man || !tile->mem.vram)
 			continue;
+
+		vr = tile->mem.vram->region;
 		mgr = to_xe_ttm_vram_mgr(man);
 
 		rcu_read_lock();
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index d77f067d197b2..6cf8217ec46b5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -7,6 +7,7 @@
 #define _XE_TTM_VRAM_MGR_H_
 
 #include "xe_ttm_vram_mgr_types.h"
+#include "xe_vram_types.h"
 
 enum dma_data_direction;
 struct xe_device;
@@ -27,7 +28,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 void xe_ttm_vram_mgr_free_sgt(struct device *dev, enum dma_data_direction dir,
 			      struct sg_table *sgt);
 
-u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
+u64 xe_ttm_vram_get_pool_avail(struct xe_vram_pool *pool);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index dcedd8cfd731e..ec95b53bc53b1 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -27,6 +27,20 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
+static const char *stringify_vram_binding(enum xe_vram_binding binding)
+{
+	switch (binding) {
+	case XE_VRAM_BINDING_NONE:
+		return "None";
+	case XE_VRAM_BINDING_DEVICE:
+		return "Device";
+	case XE_VRAM_BINDING_TILE:
+		return "Tile";
+	}
+
+	return "Unknown";
+}
+
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
@@ -198,19 +212,21 @@ static void vram_fini(void *arg)
 
 	xe_assert(xe, !xe->mem.vram->mapping);
 
-	for_each_tile(tile, xe, id) {
-		tile->mem.vram->mapping = NULL;
-		if (tile->mem.kernel_vram)
-			tile->mem.kernel_vram->mapping = NULL;
-	}
+	for_each_tile(tile, xe, id)
+		tile->mem.vram->region->mapping = NULL;
 }
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+static struct xe_vram_region *vram_region_alloc(struct xe_device *xe,
+						enum xe_vram_binding binding,
+						u8 id, u32 placement)
 {
 	struct xe_vram_region *vram;
 	struct drm_device *drm = &xe->drm;
+	bool tile_bound = binding != XE_VRAM_BINDING_DEVICE;
 
-	xe_assert(xe, id < xe->info.tile_count);
+	xe_assert(xe, binding != XE_VRAM_BINDING_NONE);
+	xe_assert(xe, !tile_bound || id < xe->info.tile_count);
+	xe_assert(xe, !tile_bound || placement >= XE_PL_VRAM0);
 
 	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
 	if (!vram)
@@ -219,12 +235,82 @@ struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 pla
 	vram->xe = xe;
 	vram->id = id;
 	vram->placement = placement;
+	vram->binding = binding;
 #if defined(CONFIG_DRM_XE_PAGEMAP)
-	vram->migrate = xe->tiles[id].migrate;
+	if (tile_bound)
+		vram->migrate = xe->tiles[id].migrate;
 #endif
+	if (!tile_bound)
+		return vram;
+
+	/*
+	 * partitions[0] always exists, so its address is a stable handle even
+	 * before vram_region_init() sizes it to span the whole region.
+	 */
+	vram->partitions[0] = (struct xe_vram_pool) {
+		.region = vram,
+		.purpose = XE_VRAM_POOL_GENERAL,
+	};
 	return vram;
 }
 
+/**
+ * xe_vram_region_alloc_device - Allocate the device level VRAM region
+ * @xe: the &xe_device
+ *
+ * The device level region only aggregates the sizes and ranges of all tile
+ * VRAM regions, it is not backed by any TTM resource manager.
+ *
+ * Return: the allocated region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_DEVICE, 0, 0);
+}
+
+/**
+ * xe_vram_region_alloc_tile - Allocate a general-purpose tile VRAM region
+ * @xe: the &xe_device
+ * @id: tile id
+ *
+ * Return: the allocated region, or NULL on failure.
+ */
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id)
+{
+	return vram_region_alloc(xe, XE_VRAM_BINDING_TILE, id, XE_PL_VRAM0 + id);
+}
+
+/**
+ * xe_vram_region_default_pool - Get the default pool of a VRAM region
+ * @vram: the VRAM region, which must not be a device aggregate
+ *
+ * Return: the default pool of @vram.
+ */
+struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram)
+{
+	xe_assert(vram->xe, vram->binding != XE_VRAM_BINDING_DEVICE);
+
+	return &vram->partitions[0];
+}
+
+/**
+ * xe_vram_tile_alloc_kernel - Initialize the kernel VRAM pool of a tile
+ * @tile: the &xe_tile, with its general purpose VRAM pool already allocated
+ *
+ * Kernel allocations use the general-purpose pool by default.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_vram_tile_alloc_kernel(struct xe_tile *tile)
+{
+	if (tile->mem.kernel_vram)
+		return 0;
+
+	tile->mem.kernel_vram = tile->mem.vram;
+
+	return 0;
+}
+
 static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
 {
 	struct drm_device *drm = &xe->drm;
@@ -233,17 +319,21 @@ static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *
 		drm_info(drm, "Small BAR device\n");
 
 	drm_info(drm,
-		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
-	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
-		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+		 "%s[%u] VRAM region: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->actual_physical_size,
+		 &vram->usable_size, &vram->io_size);
+	drm_info(drm, "%s[%u] VRAM region: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 stringify_vram_binding(vram->binding), vram->id, &vram->dpa_base,
+		 vram->dpa_base + (u64)vram->actual_physical_size, &vram->io_start,
+		 vram->io_start + (u64)vram->io_size);
 }
 
 static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	xe_assert(xe, vram->binding != XE_VRAM_BINDING_NONE);
+
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
 		return 0;
@@ -253,7 +343,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "VRAM region without any CPU visible memory\n");
 		return -ENODEV;
 	}
 
@@ -268,11 +358,65 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->dpa_base = lmem_bar->dpa_base + offset;
 	vram->usable_size = usable_size;
 
+	/* The device aggregate only reports sizes, nothing is allocated from it */
+	if (vram->binding != XE_VRAM_BINDING_DEVICE) {
+		/* Until split, partitions[0] spans the whole usable range */
+		vram->partitions[0].offset = 0;
+		vram->partitions[0].size = usable_size;
+		vram->num_partitions = 1;
+	}
+
 	print_vram_region_info(xe, vram);
 
 	return 0;
 }
 
+/**
+ * xe_vram_pool_place - Fill in the TTM placement of a pool
+ * @pool: the VRAM pool to place in
+ * @place: the placement to narrow down to @pool
+ *
+ * Resolve @pool to the placement of the region backing it and, when the pool
+ * does not span that region, to the page range it covers. Callers do not have
+ * to care which of the two backs the pool.
+ *
+ * The range is only ever narrowed, so this composes with a caller supplied
+ * one, e.g. the CPU visible range of a small BAR.
+ */
+void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place)
+{
+	u64 fpfn, lpfn;
+
+	place->mem_type = pool->region->placement;
+
+	if (pool->offset == 0 && pool->size == pool->region->usable_size)
+		return;
+
+	xe_assert(pool->region->xe, IS_ALIGNED(pool->offset, PAGE_SIZE));
+	xe_assert(pool->region->xe, IS_ALIGNED(pool->size, PAGE_SIZE));
+
+	fpfn = pool->offset >> PAGE_SHIFT;
+	lpfn = (pool->offset + pool->size) >> PAGE_SHIFT;
+
+	place->fpfn = max_t(u64, place->fpfn, fpfn);
+	place->lpfn = place->lpfn ? min_t(u64, place->lpfn, lpfn) : lpfn;
+}
+
+/**
+ * xe_vram_pool_usable_size - Usable size of a pool
+ * @pool: the VRAM pool
+ *
+ * Unlike xe_vram_region_usable_size(), which reports the whole region a pool
+ * may share with others, this reports only the range reserved for @pool's
+ * own purpose, e.g. what is actually available to hand out to userspace.
+ *
+ * Return: the usable size of @pool.
+ */
+resource_size_t xe_vram_pool_usable_size(const struct xe_vram_pool *pool)
+{
+	return pool->size;
+}
+
 /**
  * xe_map_resource_to_region - Map ttm resource to vram memory region
  * @res: The ttm resource
@@ -323,6 +467,7 @@ int xe_vram_probe(struct xe_device *xe)
 	remain_io_size = lmem_bar.io_size;
 
 	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *tile_region;
 		u64 region_size;
 		u64 usable_size;
 		u64 tile_offset;
@@ -334,7 +479,8 @@ int xe_vram_probe(struct xe_device *xe)
 		total_size += region_size;
 		available_size += usable_size;
 
-		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+		tile_region = tile->mem.vram->region;
+		err = vram_region_init(xe, tile_region, &lmem_bar, tile_offset, usable_size,
 				       region_size, remain_io_size);
 		if (err)
 			return err;
@@ -344,7 +490,7 @@ int xe_vram_probe(struct xe_device *xe)
 				 &total_size, &lmem_bar.io_size);
 		}
 
-		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
+		remain_io_size -= min_t(u64, tile_region->actual_physical_size, remain_io_size);
 	}
 
 	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
@@ -433,19 +579,20 @@ int xe_vram_reserve_memtest_bo(struct xe_device *xe)
 		if (!tile->mem.vram)
 			continue;
 
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
+		if (tile->mem.vram->region->io_size < tile->mem.vram->region->usable_size) {
 			drm_info(&xe->drm,
 				 "Tile %d: Small-BAR system detected, skipping VRAM memtest\n",
 				 id);
 			continue;
 		}
 
-		vram_size = tile->mem.vram->usable_size;
+		vram_size = tile->mem.vram->region->usable_size;
 
 		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
 								    vram_size - SZ_64K,
 								    ttm_bo_type_kernel,
-								    XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+								    XE_BO_FLAG_FORCE_USER_VRAM,
 								    0, false);
 		if (IS_ERR(tile->mem.memtest_bo)) {
 			drm_warn(&xe->drm, "Tile %d: Failed to reserve memtest BO\n", id);
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 38425d81f777f..184850f4ed188 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -8,14 +8,23 @@
 
 #include <linux/types.h>
 
+#include "xe_vram_types.h"
+
 struct xe_device;
-struct xe_vram_region;
+struct xe_tile;
 struct ttm_resource;
+struct ttm_place;
 
 struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
-struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
+struct xe_vram_region *xe_vram_region_alloc_device(struct xe_device *xe);
+struct xe_vram_region *xe_vram_region_alloc_tile(struct xe_device *xe, u8 id);
+struct xe_vram_pool *xe_vram_region_default_pool(struct xe_vram_region *vram);
+int xe_vram_tile_alloc_kernel(struct xe_tile *tile);
+
+void xe_vram_pool_place(const struct xe_vram_pool *pool, struct ttm_place *place);
+resource_size_t xe_vram_pool_usable_size(const struct xe_vram_pool *pool);
 
 resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
-- 
2.34.1

