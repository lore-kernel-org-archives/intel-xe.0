Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95573C5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 14:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C27110E7F1;
	Mon, 17 Aug 2026 14:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fe7yVSMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E9010E7F1
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786975452; x=1818511452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zXGAY7DfhVcTW9dkgwru2vNK2wIKkDYm7LuxNP85GWQ=;
 b=fe7yVSMRKdeX3pqv3vcO7yUqrBugQGX2WvyaWJ8ImbVJiusSXkrQNkmF
 lIzJYPrpkhfQHGO4uuvl5n59JSoj8xfgTyOQEJLYDtdZDUh6dc45R7EzP
 ueLQ8AxaLLeYBz2+vnvHXAGIvx4x+OcUMRDu80oV7oIRnm6+bKay1JpL7
 AqALLMBdRtZb9lZy2yz86XXq72mUY991t9Xa7ZVwfmnCr2bkdKW4r3BgW
 QPsSHPGZZRhUzz9IF1Lp/rLGxn8MK+xF4VV1+UgsGrZKqa2GoK0yndJry
 g0oDOXwRYF4jjLdrQl45QMQPD5sPMOi1bmK+Ga/KB+zTfYs54fhWkJOWj w==;
X-CSE-ConnectionGUID: wdA6cMseTSGfSMK+8R+2gw==
X-CSE-MsgGUID: k+7ynFqAS3OJ43MNWO+oqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87517050"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87517050"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:11 -0700
X-CSE-ConnectionGUID: fU3LjJuzQxak14OL9VF/DQ==
X-CSE-MsgGUID: FdSiMfUgTFWBOI4VBSejTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="269198692"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 07:04:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:04:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 07:04:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 07:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6j7Yj6oOHLCNNCaeXGTzxZkueZKe/zUgD7qkgIhkOs/szywnhc1j/oCMdUAyWLaai0UZu29+yxcRWvHVYU3TXeP2Wd2XhrDgZMV0vlIvKaiUy848ter9PNR/q3Zc+QZpXPlRSycVBroqunBVw+pUBSifD8gO1IjocqW60tjOptovrXv9821bI5obYKWVjzNc/z4LejRhxfuz2t6/KWa+Fxr50vKlswLOYMtX4XtDyLc9mSZ+191WYqYEi8fMwQytfsUghGQuiN7P5nAXCf4bednVVUmZa76EILjA4rLZgGJ4mt4SdggW3lAq5FJiNp9VybGtGujjWaNirSDNJWHyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPsSGJRpGTVxq2m5/QMVR0t2adqftNr7ag6xotU92Zs=;
 b=SszLzjUFv/S5W54QRuRladQuiJKJmnJI3lCCVsPNSC/sYedPkSBU+mHbXV9KUVR3UDTI9/jtSvhP/qf4P3TglGgVk2X+k8A85AqO99EoyHvVSgVWUDCRAIdpADjluc/6ocsIFIEzC03pGAj3078QdA2t3s6LQd+z1g6bwd2JN5537W1UWZreoO4IehaeY+ywnV7pUQvhGZboE9btDWoQl3u3Oa7Jnv5D/DzZZUlaxSDOZKLlrCMlhVSGWPjT+bUiCyOYaTWvsoRq11PHyPrffQs5tWSvabkkBuxT02/kDhEVbj2XVteanEp/7N0+FL+yPE5iBTzdEVCqUtZ0borhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 14:04:06 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 14:04:04 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 3/3] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Mon, 17 Aug 2026 16:03:42 +0200
Message-ID: <20260817140342.415803-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260817140342.415803-1-piotr.piorkowski@intel.com>
References: <20260817140342.415803-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIVP296CA0108.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::8) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6c9b00-bf26-408c-45e9-08defc686572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZsmKHl9FK0CBLx5oXfhD7FmiXaFENxtwS0LBHpDDhhhgiQ84BD8Qeve+YOnaS3UoKmows6HLrSgp23ZHYO3rpoSdmj+nPgopU8P7s8NT5K32rXJpBMGcygK7hz10oHan4wjE80jGaedKKmHAz2Cme6h8NqBQ+17AVwajU9w9f7d8sywZh9SpePnKw5/QE4Jz+R0vgq+Y7M41UYKS3dy+v33F7UexaoZSVqTrKxr7FmgcJHtuLgv5z83dlDvMsj9JMHIgJOqE6d/gkCz6fM5YZvEjYZ8VstCnHX++ilZDkTzJjqoVLwja9Lw9UauCpnOQD5eChFpwlGyJjZ5xwoC37XwMiNsxo9l8KroXDXdqTdbJx4I52nBwZYU2C7KFGAkaouKf4FnqMYPdcHnEZj2MITFa0tOa/XHXlt8yal5BU6LAwM4n3vqXlunpMGhH6Rlvc22P7MgERzIWWEc9My3CdUNyjhVPF43/YdyU54igVaxhc//ns1VbYTKX6NaCsSDuVRyA0qggGPmZVJQkQ8kDZCUQs8Cv66dbr1By0w32LdxMq/Nj6+HozlOwgg0AhbWeDg5pATBmqlN2Ylar5WfKNdkfZXEj2L3j48HGtm9pW7BH41OYHUMj+tm1JWLM5NO4gXGrjxByFRJXXPjHYZO6esdiQjVi2U0q0AG4CX5ccsk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZwTnl4TkZxLzdzUU1XcFg2cGJFRndGSDFYUTFMTVFxTmNOVEE2anRCRldt?=
 =?utf-8?B?K3A5S2R1ZXhzL1FKMWZMQ3VVVjQ2dUpVTWFVVHNiNU9lb2dmZUcrZVgrUE4z?=
 =?utf-8?B?VUR0MzRRbE5SQjExeHpPVzBNSmxmT3QwaFAydHhzYjh6V3lLV0c5R3dBdnlU?=
 =?utf-8?B?MTRBM3RMZ1Y3eVNKUTBmU0ppdjd5ZDl5cUwzWk9ySzg3Z0pzTzk5ZzRqRFpm?=
 =?utf-8?B?dW9XeU9SOVkzdDIyVEtNQ3BRcjJOVzM0R3Y2ZDIvUGhvcFZ6QW9Ic2t3dS8r?=
 =?utf-8?B?UU1ka1dSNmFKNitpZ1ROUkQvMlhmSEFQNG1wbkFSTmFvSUl6YmlwOXk1WWM3?=
 =?utf-8?B?bWFhL3lUMDNiMVUzcXlFTjhVUXRaTy9kZzFwZVZQVTByalZ2L1dTaUFrTXBH?=
 =?utf-8?B?Qnc4SWVzRkIwOHk0YWlMZ3hzZFBoaytFWWtXUzJkbUI3RkRVOUZ6Rk1ia2xI?=
 =?utf-8?B?UE9KKzdzZWtmL1A3dnpNRWFXK3BudHpPYWZHVHRCMjhmaXJSZmdKSnVTUU9h?=
 =?utf-8?B?VWo0R2lBQ0VGQVJEc2NET2NaWHJvN0FvUGs5Zm42VzRMRFN6dEM4OXR6cUFm?=
 =?utf-8?B?a0ZwckduTW8wZkZPWUNhMXkzbWdyb2U3OEZEWUZZLys2S1hJcHRwYmRJa3lH?=
 =?utf-8?B?dGFxWHF4c2lqTnZ0TTBtYzJXNUdNdnRKdm5KWnVoWWJWTDR6MktHbEFGZnhn?=
 =?utf-8?B?T052aFAvYzlobSttYVgwZ2VUdCtUWmhQb0ppQkVPTUFzRXpnY1BZVGdaR3ph?=
 =?utf-8?B?NVdIWElMc2pqdlA2QTJTdEQ5R0pCTUtSaW8vc050ZWdUd0F0ZzhlZXNXWEhJ?=
 =?utf-8?B?YjJJUGZtRU9PcXNMa0VFMWJoZWNIbG1WRXowQXEraTk4UWhIM0hIcUVRRndo?=
 =?utf-8?B?bWlkQTRvMzZKWDZoOFpSNXFLcUdBb3Mydy9FUTI3TXRxQldjWWRrWERRbVBT?=
 =?utf-8?B?ZnZ6aHRIbVZRM0N3b0Z1VjRuTEVnaC9WQUxObDhHRzFLQVhIa1dGZHo1L3VZ?=
 =?utf-8?B?bFVYSlpLcnEwWURjZSt0OTJMc0RyV1F1OERLTVJ6ZDF4OG8zNnYyVitJWjVl?=
 =?utf-8?B?bFFVOWphWDNmSWNQNkw4Q0llSytuK0dQd2c2VkpyeTBuemVlQkRzUlJETWps?=
 =?utf-8?B?NCs2c0dUelhzSlpXOWgrcmFKY2t0REFid3VQUmVrTHl6K25HaXp4L1lQRjRz?=
 =?utf-8?B?eWtKVmFVWDhYdXR1aHJ3VDZGeENLZEpsUWlJNDRabWZ1VStWTmROa1ZoS2ti?=
 =?utf-8?B?MEMwWTZVcDNVVEVQR3ljUjRFL1VUOU1xL3dLN1JYbE40anpvZjRteGNYZWhP?=
 =?utf-8?B?Q1hUS0tCUmtLcjFERmVtVG1BaFN3K1ZUbzdQaXdHaWFUUzZ1eHZ0VzdkWFd5?=
 =?utf-8?B?aXlrUUxkT3VMRFQvbU1RREc1VVFadzFQVkU1N3FsRmZhMVU3d3BKWk0zQ0xv?=
 =?utf-8?B?TWRORjZMYU5CNnhjcndUbHBnNDluQzJIZmV4Vzd3WXlXb3RXNmc4NDFSaFU1?=
 =?utf-8?B?bFNXdlYwdEpNR3RSWFdsMU1wSkpsUjYzbjJrUkM2cGhSVSs0RWs1TG1oa2ha?=
 =?utf-8?B?eE5SM2loN25IRDgwV0lYYXRBZzRoMnBKcWN3SFFHWFAwS2Z5QWFRRW1mN0pF?=
 =?utf-8?B?WDl6ZzREOTdlMFRhWGJzY25CY2tVT3Uyd3JmSSs3RHBzTnBrU3htUVVVbGVi?=
 =?utf-8?B?Y0pmbldhWndKMm1pejNwUi9NYUcrNzliMHpmREdOVlFsSlU4Wm5ELzh1Rk1K?=
 =?utf-8?B?dS9MQkRPelhLbmxaQTBZQ0J2N3Vtc1pMeExFTjkvWC8wR1dNNWI2SkNRNjlx?=
 =?utf-8?B?RzY5NDNyQjJYb3ZsdjJlcEoyZWdPUzVrd2lFRjI3REIvb1NiQnJUWk1PenYv?=
 =?utf-8?B?MjBkenRKSUZrbGdUcUhoWFQyR2lCNGlCZ0M2elNTckJLZGc5UWJNTHVjL2Qv?=
 =?utf-8?B?eDVna1lyMDhzeDd4OUI4dHBhREErZzV3Q0orRmRLS0ZmdGl0K1lYbGx1UU9s?=
 =?utf-8?B?MVN1eXBSZTREY2Q1SzZXSExyUnNsOVhmTS9jb0F5RU9MSnRoUXN1WVpwQVY1?=
 =?utf-8?B?dDZ1MFZjSFhrVjJiWnVTTE5TOU5HMzR1eWhYQi9Vcmtibi9Pa2oxdVBXTTFY?=
 =?utf-8?B?WGxvWVJ5bW51Uk80ZUozRnljSEl6N0oyWW8ySmhnSmM1aGc1WHcrQXFuN1Jz?=
 =?utf-8?B?aEwrTU1yL2RwVm9uRzF1b21FWUFUZFk2T21TMjlzV2NNdi9DTmxUdDBvdzRJ?=
 =?utf-8?B?YTZoUXBYc1YrcDA4T1haTjYvczFFN01NSmpvSC9FaTloWGVaTFBSaE51SS9I?=
 =?utf-8?B?eWFjUWtaSUtVZTdzRVVkNDhFTFNDa1NEQjAwem9jc2xjY0dDZ3duWW16TDV2?=
 =?utf-8?Q?uDP9V5yiwmGucwTI=3D?=
X-Exchange-RoutingPolicyChecked: Q74VLrCv9Re08RW3tpm8QWXhLm9MFXs7ZqMC1jF9HLyhtFoiphxDdnLku7zeeBDojMngXQjkOeLei78z84AUsmgrX+U/HPv4EAdLHnbMR5Bbn18C4VxgxFtSnBdUUDvitCqciqQPOJAJRFCgtmvb8B/m5mfSP343j8c+bimuRENkuAyzKqN0Njd1fAqbPzSHsfz0VjqnaVnMtQWivP8P1jSKTQwvjpnLcfcOBjNT8uTyW1rGKiNqGoBRpPzdKC2iC2ZtPNo3BRIbSDxS2quoPUioQV0IY/gvmNFXrpT1Fjv3/t9e9vbqeqfpgQZQfeVrcCTfGa860Q7UObabAYhIOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6c9b00-bf26-408c-45e9-08defc686572
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 14:04:04.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5Mb0geIfaO5LbMHvWaIs9bNSMLBp43AJLr/w0Yrg9E6JD0fAIrcCd951L/g75NiEDziCY8NOCJ5fNc2N7iKi+r3u8SxE8G5A8GV6K7w32E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_test.c | 336 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c            |   4 +
 2 files changed, 340 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_test.c b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
new file mode 100644
index 000000000000..7d28b97f8afe
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static int ggtt_test_init(struct kunit *test)
+{
+	xe_kunit_helper_xe_device_test_init(test);
+	return 0;
+}
+
+static void init_native(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = min_t(u64, SZ_1G, accessible);
+
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt.start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, usable);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node(&ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, accessible, accessible);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, 0);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt.shareable.start, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node),
+			(u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt,
+					     shareable + XE_PAGE_SIZE,
+					     XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+#else
+#define GGTT_PCI_IOV_TEST_SKIP(_name) \
+	static void _name(struct kunit *test) \
+	{ \
+		kunit_skip(test, "requires CONFIG_PCI_IOV"); \
+	}
+
+GGTT_PCI_IOV_TEST_SKIP(init_shared_pf)
+GGTT_PCI_IOV_TEST_SKIP(init_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_usable_pool_low)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_high)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_usable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_shareable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_unavailable)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_oversized)
+
+#undef GGTT_PCI_IOV_TEST_SKIP
+#endif /* CONFIG_PCI_IOV */
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = ggtt_test_init,
+};
+
+kunit_test_suites(&ggtt_suite);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 84fcc62b1798..25632c8e32d0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1349,3 +1349,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_test.c"
+#endif
-- 
2.34.1

