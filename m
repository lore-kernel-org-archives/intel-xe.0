Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330ECCAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD310E947;
	Fri,  3 Oct 2025 16:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItoeYbQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1BF10E947
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508804; x=1791044804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uMXJO5T7z6zx9v5fhT5Qo22oTvw+nnaR9kipTkb9Fkg=;
 b=ItoeYbQLiTeA27PO7bfDQ1Mo1Ju1hORWErQgnw93LGCq9fTuabqbafbb
 ZNwrTg6l8G3zDvAHcKlrB4qd8r1K+5HHL/WiSgk0GK+3V7hgJxQgU8RC1
 4kXFMyWle1QnhbsrqfYHexVvMvIL006Y+ENu5JJuB6QNjDGuJcHTUAwPu
 7HZKNSh7ejFQgVB5sznH8/1VGdQXecm/Qxdm4KubT9ZBy5D7dQwWbwexv
 Z9USnBefUk90vMfeKcCs2dO8krcygw6dXnwZI5RWu2uvRWpzzgEclbCd+
 I1HIk3Yp42NwaEoEGNstYXIxubBwhWt9WpB0r09uWGaAwORa8VnlfHWkS w==;
X-CSE-ConnectionGUID: YEYBfJ7/Q0Wq9xe/QgEkvg==
X-CSE-MsgGUID: iq2EKWiFRUSGWCbRdltOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73147112"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="73147112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:44 -0700
X-CSE-ConnectionGUID: 8aCIXX0USZWj4vYWzlZ4zw==
X-CSE-MsgGUID: pfnbUWqfSP6oEVLTWBM3uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="183345735"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:43 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOj2Mi1kDboSzebaO7nVNbBYoOxuW4ccM3J7peIAvYPVUz2smCYUYxpLqpve4v4GWyVmtD8F5pKvb5lJOgzmWMNVS+JZ2TCV5FCqn4RiTnIsz2qjuKdhrLpo8quovu+0oVqAlFWHkPRxmTibdSgzozKWbOBBsj9bDeQZrluXyyE6JDtd2mDHdZsP5zai3hIsByF6xBlZS7YtcQ18jYIGjAKowe15w+pVI8pSxrTkVGZvHfy9LvYddAOpKr+6ZlKpjc92FjP5US3J6bNfIYMKMyEYA5yikqsfjdZ71mMymVSASrTnOX6CdTJAdyrUsxt/B1+wY+Dmn5VyUJrGg6/cnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDqmN7egPsGYADDOOkM6mu1rY8atEtioQ7MjTdZ0nrk=;
 b=F1BJ1b63IL+KfojSMy38e6b7aQHSmjFzZj1HGryB3wtAY1Rpn+KfrqjksmCOfJChgaRraCmrrKszxBz5GWwgTm5FmT6vDvC9pthNKIV6bUDDT5oAlai/u2FMBhU0TZXH39m0kr5Id6ica+An0G/18sfI4EHdvvbPYGyCRi0/g8gMIZvHnLJz3RyanDFOgCq1gq2V0utgs8eZYM7dIYN1GMT9S5eCRpWDTJgue9s265jv5XIBJextY2gMGMyxDSdJADLGoN20whsvw7kJ8DqmOL2WAW3vFGzZVFQY0hUB8PLFerm0xf5Nv/hHus3bD5OfCvXYk05W8B1Fcr4DPxhg/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:40 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 2/5] drm/xe: Introduce new BO flag
 XE_BO_FLAG_FORCE_USER_VRAM
Date: Fri, 3 Oct 2025 18:26:16 +0200
Message-ID: <20251003162619.1984236-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
References: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: c41de839-8853-407b-d84f-08de0299a1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qlh4VGtxWEwvcW9MRlU3dERGT2VRTWw2SnQ0Vm9kMzJ0Sll4M0J5dUlkVjFU?=
 =?utf-8?B?Vlg1Znk2dVhWblRvM3ZQYWlRaC9wNngvSDArM1JRNHBNd0hkaFQvWWxTcjlh?=
 =?utf-8?B?Z3BYTWhMbU1CYURKK0ZPWTdHZXFsRCtUQnpEOGNBRmErRjVFZFFmbkVvM2Jp?=
 =?utf-8?B?YUkybWgxc1d2UVlQb3BwbHhaK0dxdjc4SUhNcS9pbVpTQ0huQ01ZU01OZU1u?=
 =?utf-8?B?cVo5ZjNEZjNRQTFLMkJPRXZha3VRYjZpVm5YTlZEczA5RmdndW5QYWhsRlVF?=
 =?utf-8?B?dWMxcVp0K09RNTRPOHhsaFV6L3Npa2dkb2k0N1FzQVNQNFlvRzlIcW93ZnJw?=
 =?utf-8?B?dTNvdENJTjZFQjBTY1VXN3dPZVVhc0hjTnNia3FRZ0JpYlhWeWVmU282ZCt2?=
 =?utf-8?B?ZEFta0JYVzBNejU0dXRac0ZZQ1NCYVd2b05SdkRnUXIrd2NnTnlJaHFpRnVp?=
 =?utf-8?B?MnpIQy9XMkMyUzdKL2ZONG83dng4Qi9uNDd5cTM3NHN0czRUdjFPbDFuMGNP?=
 =?utf-8?B?RW5nSVRzVEk0a3BUWHFBTmEzd1FkOHlmc2tGN3VBSmZHUDFxT0UrbmNEQzl6?=
 =?utf-8?B?ZU9lbWJRbjJJWFcxZ3Vla3BVSUF4SEtGZXBrRnA5N1VkUVhmTjBNY0oxNTVO?=
 =?utf-8?B?WllnQTBOTndVR1ltODg0UjlKZklzQm5yTEhIZm5SMG54Y0dwQU5hWXd0a0Zh?=
 =?utf-8?B?TStlMy81emk4UVFITE5SQ0JES0I3a09BRHdpZFQySW5lZHVUTHQ4L3NTK2gv?=
 =?utf-8?B?RjlwdEFveTNuNnloTktDbUIydkJEdWJWTkJ5M2ZKenFDanZxWitlb1N1NitY?=
 =?utf-8?B?V0VqamJPM0hjOGRpanNsRW1Dc3hCZ1VpREdUOGUvck5rN09NMGN2QXNHRElQ?=
 =?utf-8?B?Sk9hS3IzRVFFVDlSY3h0K1JjWHZDSWhQTUlidFpwUGZicWZUUEhaa3IxNWRV?=
 =?utf-8?B?Z2FDdC9GOUJncUdTbXkzRFdDeVhsWVZxTG1oTC81d1U3V0JKSXY3Q0krQ2oz?=
 =?utf-8?B?VnNGeCtiVlYxNUNWTWF3cTNWVEpWQ1YrR0dudS9uLzJjdU8zRUVTbWUzUEZE?=
 =?utf-8?B?c2Q3QmFWWit3UjlqSjRKM1NWTnRGYlBrRXA4Y2R5cXRnbUVOeHRETXg4dWM5?=
 =?utf-8?B?SVNBblNIY3JVYmlINnBicDBnZnlGNllKUnExbnVhckJhUXZQTy9ycmtVdFBO?=
 =?utf-8?B?V2NKZnY0RUxYUmZEWGFzL3NjWWZ2R056ejdKUXNHOGlqL0ZVS1JqZmJGYTVV?=
 =?utf-8?B?dSsxUFVSWlJ2T3liVHJ4TWRYSERsYVFnOGc3SitQdjhzWXNEdWZFenprSkVw?=
 =?utf-8?B?cmNqemdydVdzUFBXV3k3TDZRUzJ2TTJzWWxFZFdIVkZrUkZ1bVErNEpaWlJQ?=
 =?utf-8?B?dUIxYTZjWTVEY2xlcG1zZUR5MHY1d2RWc0xQOGNodlMxOXVTTGJCa1JidUFa?=
 =?utf-8?B?VnBJRTJzZ3drNEE4VGZXcGpVa1Zkc3dvWnVDVDFDMjA3eTFDeCtKQVdtbjZX?=
 =?utf-8?B?S0VFM2U0OG1yZzBkQTVYS0N3SmZUWS82OXE5N1FrZ3Y2c0E0Z1FPSmEvRVpx?=
 =?utf-8?B?OHJJSEJNMEFtQXNJOVFvWk5DMUdlRlp4UWtEaTh3TlZBOXZza1h3bUlMcU5R?=
 =?utf-8?B?R2pJY0hmcmxGRjBOb2k5dmg4Qk9taXJpb1RhcVVTQnhyZGhHL2RiRkRZcUM3?=
 =?utf-8?B?a01Xa05qQ3daRXBoM2t3YUdmWFkrSUVHVGxUV0lDT0YyUVR2SlB1R2JuZ1hX?=
 =?utf-8?B?RDU4ZkUwTjYrZktXUllvaFBxcHlLV1kyVGI0L0FEaVZYVFZROFZ4VHpYdGZt?=
 =?utf-8?B?MjJ4dmY2UW02NFRmTjhPbGxqczQ3cUJjRG5tRkg4dHZ1aStyTUtGb1NGQTdB?=
 =?utf-8?B?cTVsTi9NVm5VcWZQZDN0dUNsbk9qYUhSYVpscVZ6N2JuUGFTUjh2UXlOZU9N?=
 =?utf-8?Q?I3TDOrk9xY7lciCBeLOB36cUSJZ+C+xe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWYzWnpWaTNickhreDQwc1ZBbDFZd0VER0pIYjNJaCtHTDBRZXVQZ1F4RThl?=
 =?utf-8?B?OWJTRmR6Y0RBM3RoQy80a0ZLTVJWaW9jcmYxckZ6VG4yQWE0UUpIc1lYMHZK?=
 =?utf-8?B?KzBFMGNkalg4Ump6SVBLTUZpU2p0aXA5RkpjdEhTREw5Uk5NOGh6dEIrWENz?=
 =?utf-8?B?OHpRcTUyTGpDdjViemFFWTR6Z3dXRDJoOUtyY2pRZThvTWF2S01rWlRndVlD?=
 =?utf-8?B?b3IwL0hLZDhKdlJEb05jZ2k2dnQreUFHS2lkUzFCMlYrZTBta05QM0dRaUcv?=
 =?utf-8?B?N0ZMcGNnMmJZNFFiWVJnWlMvSzczU2NlYy9tak1PdVUybnpuOTk0MzRHNDFu?=
 =?utf-8?B?YTMzYTdPYXFhNXp2Mm9yM2ZFelZRZVlNaTh2WkRJUkZwMytrY2dMRmlQdTJG?=
 =?utf-8?B?M0FqdGFocklqaWpwOWxJKzVHQ1RFak9uL0J5UlhWNWVEMGNKUkdIWlhEcVFZ?=
 =?utf-8?B?REtCNWF2NkNmL29qQktuZmlKNlgyOG4wZmdzOHJRZTBLUlE1Y2xscU9GWlVj?=
 =?utf-8?B?RHdGY0lBTy9HTkU0cEpiM0V6QlhocTBZUTRSOVBSYWVPMHVvdjFpODE1K0Jh?=
 =?utf-8?B?NE55Q1V4WUg3MnRmVkVnQ3FBWVRIKzN5aXhtWkpOTWxRMkxmNEZicUZrUk5n?=
 =?utf-8?B?dDZNRnRQa2FDR0IrVzJnWCtXMUhSSXZ2eEprK2RvTm9wc3Y3TzBVZ1lyLzVN?=
 =?utf-8?B?eUdFWDc3TGVmRDlQd0Jaem45V09WZXI4eFlwWU91anliODhnM05kbmhidTdF?=
 =?utf-8?B?UUNXa0YvNCtJYWtWWWg1V2VwNjhYU05iSUdOK0d5NCtqWG9Bc3NoSFpMR2FJ?=
 =?utf-8?B?WmJ5dGtyY3ZlQXJuZlcweExteTFZRUhqZldJNEtHbzBhZHl1MmZqaXlFNEpI?=
 =?utf-8?B?YXNpamdpVkhzWUh0TW1SUDl4NGVudkFwRWlTdzZGM1EzSW9SZUVkNWxMVHQx?=
 =?utf-8?B?UG44WkM5WEpNdFJiMjlTVTc3dmJNQnA4akRwMnBZeTZpT2s0UjZacklKVFZN?=
 =?utf-8?B?MERWbzlFK2dIeTN1ZEdxdXN1WDdNS243OENqaWtRSHo3SEtmd0pHN2J5c1FB?=
 =?utf-8?B?R2E2UkZaSk9vOVc3YlVIY3dBR2g4a2VPcWIrRmQ0c1dsYTRoTGlDZU83ajU4?=
 =?utf-8?B?YnFkWUU5Ty83ay94eFpmVTdmYTdnN2piOGgvRUJpQktjcHRhMnY4WGhENllY?=
 =?utf-8?B?R2RXa0VvNXNvMTFjUHdISmxCOE1lZUVaQ1YzNEdwcTVmbVhpYWpkbEtVeVNI?=
 =?utf-8?B?VTlKWUZEVWVUYmxyelFEYW5UekhBTVVreisvc3BMdGZEQXRydmgvdmgyWTVE?=
 =?utf-8?B?NktNdFlXcnYvVnN1bVRTeTFoWmdBSXdSTTZiZWNnTTRyRy9tMFlHVUNwODFX?=
 =?utf-8?B?L2UwWkFRN3VpR3U1NUtHN2RNYk9lSlFsTFZqemR3QzMxMVVzbnFRWXZuSng5?=
 =?utf-8?B?N3dwQ3NBYThkZHVIbzRTczArRDdOQ2NVajlyRWtjM3h4bUdhT0Nqd0Z3VzNq?=
 =?utf-8?B?UGd0OE93Ykh1ZytEb0xUaTAwRHN5TnlSNmFJVVI5T3oxcEs2MXpCaVY4UWEr?=
 =?utf-8?B?YjFNWjR1S1U3NDRtWGdVNGNxbnlPSkp2cDFoSE1XKzBnNHNVUFkwb1MzazVy?=
 =?utf-8?B?NVdiVmZVaG9NMUxRdmdaZjFDelNLdWRYTGh0cWk3SW84ZEx1bWxMZnJrRFlv?=
 =?utf-8?B?TnV4aTRBVGRDUEUzZmFtNlZjVWhodkJwRXREdWI1WlE1RkFvVG8vSkJRdU1T?=
 =?utf-8?B?T21rV3pGNGs1WWwrQ2R6YnlGUzg0SkdsUklSSU9vU0lrc1F0c2pOK3AyQ2tG?=
 =?utf-8?B?K0hIWUljeUppYTVpaWd0aEtVQnZXTmdNMmFSZXpQQ243VmZNdTIvekRHS04w?=
 =?utf-8?B?aENPSVFVbTFzWGlXNEZHd1ZTZ1VKajdrSjFBSFI2eG5jUHd6Uklxa05rNXM1?=
 =?utf-8?B?NW9zNGRBOEMzd0J5NEhuOGJka0kzQVVUNW0wTEZYdkJrV1BoVEZ2N1NJU1pC?=
 =?utf-8?B?OUdYU09LUEtFODdUNUVmMUZOZWF6M2hGenV3OUFNbDU5YUYzQjdRZU5OY0tS?=
 =?utf-8?B?SDJ0M2xjaXlJUW4rWStSZFFONHh2QU4zS2M0QWMxUGhoZHgxU0hITUdOUU9N?=
 =?utf-8?B?RlowNTg2NFZiSzBVQkV4L1Y5ei92MXd6a2JuRjAzby9SUTZ4ZWpUeGluVEN3?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c41de839-8853-407b-d84f-08de0299a1e3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:40.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XYdEzESzyroqEvymLm8mxuv2Fz/h+XB+K0wQAJ08kNKxkItQWgrROrkGFRHGgdT5MTkRyiwyid2TSernJ7ntNh8+kejHnY+o8x754KNiNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

When using a separate VRAM region for kernel allocations,
some kernel structures, such as context userspace data,
should not reside in the VRAM region dedicated to the kernel.
The VRAM kernel region is intended only for allocations necessary
for driver operation. Allocations created via ioctl are long-lived
and not easily evictable. If this region runs out of space,
there may not be a fallback, which could cause failures.
To prevent this, add a new BO flag that explicitly forces the BO to be
allocated in the general-purpose VRAM region accessible to userspace,
avoiding the kernel-only VRAM region.

v2:
 - update commit message (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 41ccb3242648..7b6502081873 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -227,14 +227,14 @@ static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
 	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
 }
 
-static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
 					   enum ttm_bo_type type)
 {
 	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
 
 	xe_assert(xe, tile_id < xe->info.tile_count);
 
-	if (type == ttm_bo_type_kernel)
+	if (type == ttm_bo_type_kernel && !(bo_flags & XE_BO_FLAG_FORCE_USER_VRAM))
 		return xe->tiles[tile_id].mem.kernel_vram->placement;
 	else
 		return xe->tiles[tile_id].mem.vram->placement;
@@ -277,7 +277,7 @@ static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
 	u32 vram_flag;
 
 	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
-		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
 
 		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
 	}
@@ -2276,7 +2276,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
 	else
-		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9a8401300b15..353d607d301d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -49,6 +49,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

