Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4BCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 11:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C810EC67;
	Mon, 12 Oct 2026 11:52:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFE110F031
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791805938; x=1823341938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jBBUZ6uo38m9bnB342agKHz68MfVJRDrKFp3pwtC6X4=;
 b=GnEaYfn4jbC/FJbZMx4OHqCYu8USE8izIM+lYNwTjz265V2xmcH9KUad
 mbQR2J/M8m0AOTvzf3dVxsqxzq+9ua3ii7WvBZI0VY8sprqAAXcUPxHSv
 NfQt9YCNCNNQslsmOV46TDonP3NoZn+b88T0bhiPeeXPseVWh85O3wbKf
 Kfs4SnchbxhX/tBGPig34eZebG0uFXb/JcGf35NsRZBMDqJRky50SuLzx
 dZXYtfHn2o5wleJpvFE/IgwnBeFJn0KCUllZ7+6c/0PqdPsbfl0S/lGgJ
 qh1cSdvdLiBVeCUZEjFCSBpJWIJRH71y8soiAAJPbfU+W+eDjtI5JpS+F A==;
X-CSE-ConnectionGUID: 510bC3b8REi6PC1SYEVqsw==
X-CSE-MsgGUID: u2BlfjZLSIywKGDIAnn4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="520691"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="520691"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:16 -0700
X-CSE-ConnectionGUID: /47ZsGSYQ7Ko1ixO0RY3+w==
X-CSE-MsgGUID: bXD5d+2gSKKrgAVd5icBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="800994"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 04:52:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 04:52:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 04:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYv7d4h8ALDZUW5aGoMHHGaGth1pu016a9KcKf52Bm8W9pUONWl/9PV4A28oWE981gsSbgw3VB1dyPl7Dea9XJVcvET/kBYXcig8SmfFc0iHqcNr0IU1S1ElOgqOpCR/9uDm26Db+84V05xo2EjikaGZjcFIp0i0G5ltnLYwxGY3WP5NiQZG1SghFfHuSRG71u94d6l8Zw6hT/jfUGOhMaAL6ApW8iRGQqW+TtpND2/psrbvkI+27k00AHhHfNwQrWyOaSjnJqMVIKwQel0jJa19xz+0t+yVJCvgIPJGjWoQJ/rSr1ApwXon9JLQYRwaLepvPFBP5Hlnt/D5V7XrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uas6vWzJzD7Y1ttTvJ5BoocoPfVHWeoPdNsMlTOMieI=;
 b=morik5voBbJgml8uOOWs/nxkbVZPVO3lqtgDdhYS+piUTSww21QHlJtqXs5EnT5M/3lwlIv9nrlaMPyiI2XvblcYLWyK/lnNI+Mpi2eKUmvIJXfeBbvQkHqIgvzl1/U+VjzcByTzlZH6QijdPLrQ21uUpWy8ZYa8gccgIY3KktnZZV49SHgo4Tg64saliipgXdaPkNs30e4iS4+x2na5MsZM8auYpzLGHExnUbFJdOVEow81xXs3lpE/hrYZ20T6LWQy/jdxBEEdF1iVCKFUjoFH2yP2u5TU7eV9Bvsg9HEEqeV9kDS99dDTvLZIAsByxbxG+9Lq09MbZp1Vy2D0dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 11:52:11 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 11:52:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Mon, 12 Oct 2026 13:51:40 +0200
Message-ID: <20261012115143.4100364-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: c37e4a23-f0ed-478b-07bb-08df28573fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YF15N7Rpwa0ON8xy8OVg7A6t/VPRE83mUlhaSHaVSV8ftndHiCRa61YL87ASnwO6fnf9ObcEdhaRnf/wHboTks19jEysfrEdGVQEPAADGf8tsuk8l5kCsrOxRy21g8pJzceweueBIHFAxlDF/cOWR4W5fkGsvp8IMDMvQHNHOpRxiPZQISCxBmmAUThQWqDHmKQnR43OyQGDqLh0RAVlY3PsWdbjXG+Xd4f80Bjh2ibLv4+CeQ06sSAS3K0ZtnNYtXzFs1jXIj4HWj3SIDYcHm4QLFP5HlpqRXi4nS0eCSuTv14oqpI21iAePEoSDIgOZS4UO983FO5XmWwjoDAOlknl6ziUeL6I2KHVCe6Uxq6jQhYqXUWmczNx4/YFjAfTtxrC6vEeEKN5AIgBM/jntAu3zSkgfz1A5rg5FqcTQ3T/jwagQKjPLrVG+lmQoUoGUq+h5jFUJRvBcF2fJ1LIwUfpg73axD3MD3Rm4PGqhQqCkHdrJAnRE8HkLGGv0UCAax+ceRF84/3dSgY2bTHrUtGD3/ie3dNJzDCboznDv1R4cydudfgHygBHoBDcOCqFq2ZLmkcAWIUkiaxb+ji3Mx31Bm8iNrCj+VQF53ITk218tH/abqGzik8eBwY70DEI17ztM6WJzrFovnnJRbECnwngDGvzuSRwNyWMqYY3vKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RJS0QrenFBck81N0l3NWxiR25GbElnVW55c3lSUG9SakdiVFdTWDBTYkw3?=
 =?utf-8?B?UXVYZitxNEhNM1lkNnlnbmlmVnpXNUwxYWUxaStTYTRnRnJkcG51cnJsdDhQ?=
 =?utf-8?B?L3RLeEY1dDlsSnJ1SlQwQTEzMXVteEQ3dE5xMWJYNHhNT29KclpiczQxVThy?=
 =?utf-8?B?WTlRNUU4VU9mdWNtZVNxQ1R1NWd0M25PVEdMTnF1OXJwckpkcFVIV0pVU1hy?=
 =?utf-8?B?UUZLM2VkbGRoMDl1ZDZTWFVQN2hvbHdSakE3WEJKaHpCc3hRcUFLRjVuNTN5?=
 =?utf-8?B?cjZxM1NGVVR3UHEvSXkwa2djTEo0WUNJVjAxUElKNFoyMExSV01WZWdHaU5y?=
 =?utf-8?B?ZTJwVCt0TUZpVkZCbS9odCtsMnYvaEdoU3dieWlNWXRJZUU4ZUxueWtYUklV?=
 =?utf-8?B?L1BVS2EyV0N0cTdwZ3Y3eGRPY0NaRTlyaTYwUnNoTTRLSXcxWEpRSVRJUG81?=
 =?utf-8?B?aXpJTXhVMzNrV0NuZDJNdVZwdjZUZWNqSlViR2NsRklnVDVId1FDY1BjSHM4?=
 =?utf-8?B?ZkVOQXBlenY1M1lFQ0tWd0JXTElxNFJRenV4Nmp3M3VXSkZtbE1sVUZKd2ty?=
 =?utf-8?B?V1RDWGVOUk9QalByNUozQkZGaGRiR3E2SzhKVWFsb1hHZmJKcy8zb1lnZmp5?=
 =?utf-8?B?YjhpNWp2YkFoTFlMb1ZnTlFsRWd6dmUyVHkveVVLMEdGaFlKNEgwVElEMWs3?=
 =?utf-8?B?cFJRZWRtNkMwT2dtZEZ3c1RycTFMdVN5dGI1OVl0NmZHTGJWdHpRU2hKbkJi?=
 =?utf-8?B?M0ZXVDl1cysrb1plaUs2RVhRVlFvZ0x2TTE4cS9jRDNhUEErM0REMzJ3bEVz?=
 =?utf-8?B?NGJxaUhTMHFTT1Bva2lrY1dVYU1GSXpIYVVzZjJvVzdQb3lvd1ZqcGplWkpW?=
 =?utf-8?B?UmFtMWVVQnJNaXRTVHVrb2pCTjJ6M0dSd2J2YUFxaFdZV0gwWHc0Z09rNXFr?=
 =?utf-8?B?elhqNE0rVDF6amdZT1hFQU1Fa2l3NzNubEdkVkhkLzJHUVd0YUovaDk0bm4x?=
 =?utf-8?B?SnpIU25JdGNORHdWQzZ1dmVTRXVhd2RyU1gxNjBCbE5PKzZjOHNNQnpkN2xr?=
 =?utf-8?B?RlMyTEpHblFtUnJYYlcramMyNUFUUUtBUUJOZkxWY2xTbVlxVWFQeG1VOVhW?=
 =?utf-8?B?bXdKektxRS9GMEZSRnlENVRiZFBIc1ZWOEZxZnVwUGkvelQwVWIwMWdFeTVL?=
 =?utf-8?B?UFR3dnNFOWQ2TFIvQ090cjQ1SG1ic3RFRHdoQXZqemZseWEwQ0F1Qkx4ZUo0?=
 =?utf-8?B?dHQ3SnhJL3JNYlBzOHdFem51eEFiYjJzVWFtMG5aYmVCT08zelY3cVNOS2dn?=
 =?utf-8?B?aE5xaDJsWUlhaENsZ0lHSWRtVUN0UGtOR1pNd0o4TEtQOWp1Yk9UaGVhZmhW?=
 =?utf-8?B?aHY2RVMwRXl5OWx5NjJvRFJ6SSt0K2Jta1pOcmtZQW8zaEhJMGdVQUdYTEZq?=
 =?utf-8?B?MHFWWUIzemt0RmtnMXNzU3J3bjZwT0JjRWtYSFVqNlhmdHJXc2JLdUZoRDJp?=
 =?utf-8?B?VmsrN0tvT0kzL0FoVjFYeFdBTUhpVXc5UVpoa0FOQzBmMWZLczJyKzBPdzFN?=
 =?utf-8?B?YTZIK1ZFK2R2TkszN3RFTzQ5ZVhraUU5YVZnd1N4dEoxcjFuSWo1K0Z5WVoz?=
 =?utf-8?B?WVpUUllHcHVHZjdMeFBJT3dubGhZTmErMTZNc1JIMGxXQjR4cnBqTXZFNTNT?=
 =?utf-8?B?eHRzNWw1OXRGZEpGdk9KZVBnYm1oMFVENEVOdmhibGtJUCtFQlBpQldNUFdq?=
 =?utf-8?B?TEgraXhEZk4yRzUvVjFBNldHN0tvRlhOS0dXVEpUYmpKaVRsSzdQNmNUSy9Z?=
 =?utf-8?B?VDBidnVjdVZqWG5hdG80MzJZa3p4NWVyR1BUdHI3ekZlbForM3JzTUJXWWtW?=
 =?utf-8?B?S0xjaFh6bWhVVUxHWXJLTmdURTU2NG1aS0c3ajR2RDc4NlpBMlp5VnhqeXl2?=
 =?utf-8?B?VFh2Wlo0eVRja1JtdG5sNmpJNmM0N2c5NHpLNGZReFZJYUUvendwUlRsYjhR?=
 =?utf-8?B?aGdlelloSDQzMW1EbFFwS1BTdWtoMVR6RUJmLzhwdTlhN3QvSlJmSUNadDVB?=
 =?utf-8?B?M1dDdEFVeE52aVJLaUtlcEJveTUycmxLRWFBU3grbXpqUXRDZTZMcnlTVmRE?=
 =?utf-8?B?Z3FTNDhxWWxQQ1VNSHZocFBZM2dnRUIxTzl5b2NTSUw2RDdsYzRvemx6SFNK?=
 =?utf-8?B?M25aVEZubHV2cy91Sm9GOGR3ODA5UlFkcVppcUdmQ1AxYWRvWW1RbS9jaThQ?=
 =?utf-8?B?Nit4eTEwbWN3a29zNTF3ZjNJQ3NFUi9WRHhaVDNmdm5SNFpyRkZoUU5ka3Jt?=
 =?utf-8?B?dzBPenVWSjVlQUtBUDljeVcxdWFXNnhoSklUSmpvWEFSSnM1Q0tNZHdRaDg5?=
 =?utf-8?Q?CT0lZRoRnS6MgsRs=3D?=
X-Exchange-RoutingPolicyChecked: jQsaCUNC0cSn97y4Ddd1Elzf42acucCj1nhX1qmsFG7j8HlUAlY6URiDwlj/UiqEX8VdZ5buXX/lv6eatATLVcM4J6Sp95L48MGLOWTWgavOY2DSyrqIJ/XOsNBR/icdMGP+YDzzfqoUID4gJIyK7Vgz5x8aikAEPyItCSMLNBWZeJbShLXKg4Bbu9HCLA9VbpuVV4r78+b+CZxNczRrStIYe6UnDlesD54KWVNlVbgQbAd2ozUe3owo64HYG4zwND8iXvvMWVnLMJZgN7Zh4UCzFDynOdiZtkAnuyKivOEmdkG3Q+yackxUzt+E4X2NlVToi7au62JPvEKOC+uSzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c37e4a23-f0ed-478b-07bb-08df28573fcb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:52:11.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPOyokP3M7LldkYk5fYcmIKvubYHattbKiFNYqahzMHmVhGd27o2J1MVdtBPJnWyZ8OmQo01XhXlqNSnoIyPF3/ic8l3mHV271LkuyCrAck=
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

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
    Drop redundant checks and asserts (Satya)

v5: Add quota helper and unify -ENOSPC check in shareable path (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 451 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 410 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0e..78d3de46b7572 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
-	unsigned int n;
-
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
 
-	mutex_lock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	for (n = 0; n < idm->total - 1; n++) {
-		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
-	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
 }
 
 static void check_all(struct kunit *test)
@@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
+		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458ed..de1ac58e31412 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670be..efc134bb8d915 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +69,56 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -68,90 +127,158 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
  * context IDs supported by the GuC firmware are available for use.
  *
- * Only VF drivers will have to provide explicit number of context IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
-		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
+{
+	unsigned int found = range_end;
+	unsigned int rs, re;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
+
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_check_quota(unsigned int used, unsigned int count,
+			   unsigned int spare, unsigned int limit)
+{
+	return used + count + spare > limit ? -EDQUOT : 0;
+}
+
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
+{
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->shareable)
+		return -ENODATA;
+
+	if (shareable_start < idm->usable)
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+	else
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+
+	if (id >= total)
+		return -ENOSPC;
+
+	/*
+	 * Spare is meaningful only for IDs that are shared between usable and
+	 * shareable pools. Only IDs taken from the overlapping part reduce PF
+	 * usable capacity, so a chunk located entirely in the VF-exclusive part
+	 * (or any chunk from non-overlapping pools) is never limited by the spare.
+	 */
+	if (spare && id < idm->usable) {
+		unsigned int need_overlap = min(id + count, idm->usable) - id;
+		int err;
+
+		err = idm_check_quota(idm_used_usable(idm), need_overlap, spare, idm->usable);
+		if (err)
+			return err;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
 {
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!total)
 		return -ENODATA;
 
 	if (retain) {
-		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
-		 */
-		if (idm->used + count + retain > idm->total)
-			return -EDQUOT;
-		/*
-		 * ... and we want to reserve highest IDs close to the end.
-		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+		int err;
+
+		err = idm_check_quota(bitmap_weight(idm->bitmap, total), count, retain, total);
+		if (err)
+			return err;
+
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
 	}
-	if (id >= idm->total)
+
+	if (id >= total)
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +287,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,22 +298,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
 }
 
 /**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
  *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
  * Return: ID of allocated GuC context or a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	return idm_reserve_chunk_locked(idm, count, 0);
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous. The function expects that the
+ * caller has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -206,60 +371,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 }
 
 /**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous.
  *
  * Return: starting ID of the allocated GuC context ID range or
  *         a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
+			  unsigned int retain)
 {
 	int ret;
 
 	idm_assert(idm, count);
 	idm_assert(idm, retain);
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
 
 	return ret;
 }
 
 /**
- * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @start: the starting ID of GuC context range to release
+ * @start: the first GuC context ID to release
  * @count: number of GuC context IDs to release
  */
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +550,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7d..209f99831f1b4 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -9,13 +9,29 @@
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690e..6da43691e54c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

