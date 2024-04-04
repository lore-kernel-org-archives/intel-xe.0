Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F018CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 19:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F3113444;
	Thu,  4 Apr 2024 19:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMOcnjIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527C3113444
 for <Intel-Xe@lists.freedesktop.org>; Thu,  4 Apr 2024 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712258352; x=1743794352;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l/x8IkwfDOq8czFBzf4nqpT6JnkDLXi63YGxbSl5irI=;
 b=fMOcnjIpBkH0R73TmccGKtGSrhVSvmAdm6YnHwp0AY76QrZx47Wyw4N9
 tdq0br6/pSKDd1LWvghYaiBUAXVdpeuV/eedeC5fnejjBLm1EB0xjEPmF
 k/pXM02KdIVVacVqk0w+nTZ8/yU0vatECxo/NoWaODHFGEDTQEZL7vN6H
 77nGLt62B3RYSoXO4H7h4Awbd8y6eCW5omIvBj9f8nKXeX6ZfYIYCpWmQ
 tMw/xLP+dBrjHJOeu3cy8efCbuiE2oirtwcBuJXK/sF8QXXDquCm0zFNg
 eYROl3qm39Xg/wjAlboC26CAzb824rcQICTGRfaTOd1uJfYFslvWyO84L Q==;
X-CSE-ConnectionGUID: bfP6m0KXQMSZTmkp+tgeJA==
X-CSE-MsgGUID: JwbpgyprSBC60ZgiV1htMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7436428"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7436428"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:19:12 -0700
X-CSE-ConnectionGUID: qzKo2RnTTNi8Gc/fHS+q7g==
X-CSE-MsgGUID: +z6x58ePQgyFgNUx2RlsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="19342967"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 12:19:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 12:19:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 12:19:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 12:19:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly5MQrpRJhwNoqj/iOj+01ENQH5b/c79j31mgUyl8SoYxkqC5AdfaWoVXaeGSOoobBFRu9914RSeqmgu74OJ9Ps23AP6VePJFSBp//lvj1z0RpH6FhM77W+Tkky0dSlbgnZjbsPGBBPk1mQzGggrBbL99j3YTtgr3zslDY0tHbcrcoqgFV4AxbF5GJlhG3mS6obWfjsgrf0iQ9yWMgZn+X+dlXIHTrEMwhHbBGtJTJz1IqtQGeLJezolQzCJOz0fSSDvExvEaZ1YGVzf89+lFXVn1iCEARIDjMB4yfFJVjDj4D+GLKulddV41AKkRfD2XcqSbiyLu37C31UvUUD3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rP0vBLMGk7shUiE3HKR81KVWHmFebzJd5Wni3l23ENE=;
 b=TRa4LIuAO9vDNKjhRus49ev9IgldDlXyExkg7hQFffXTUtkvCtrKCp49JUWDfmwf2Dce/aOzzHixrGIR+cY3JXUXTD1qIgdmxaqnRHpl0xo9Kk8qzSjg4/rlaLwQCcmD6UZ8iHjcqFqR91XZREHLY/B1YaAfY70/NtQe6IZ4BRDftF86cY/f4QT06a7apM/1pE3rgXDVBYyUodHKmVGe9Pn7gS0glAFy4z9123V3TbTjwVsRBsht/30bZ97ziDspyKqH703Quqdp8Fn3xsAztQkg5GznYw768A8GREKbfmL+Sj09o9Ytjr1pktuf0DZQKWRHZ/kltSyQJS/Yw6iVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 19:19:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 19:19:08 +0000
Date: Thu, 4 Apr 2024 14:19:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Port over the slow GuC loading
 support from i915
Message-ID: <wj5shvj6oc5zdk6katkqanztp5jmbfyt6i34r44irtaph2gzf4@f6z5qdkfeg27>
X-Patchwork-Hint: comment
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <20240228011002.2454419-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240228011002.2454419-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8407:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5qG8BVFhubnXsmYjajz7VzOdy0we2azOja21PiX9IT2C3qkxvMA28F9QKr2T+/U1i+CQljjoDIsJO0v/1U5HtXOkvIJwBvMj3vy44ci2eRmbpzOO47JHuSxlaJTu4Xpby+WgOgaaOMGAojt6YCasOnuxe3GFWwklnvqZNXve1gk7+fiCOiZCS4CIvgxtVZiP3HA7GAszxQy1R+9KkFMY5lPZ+849/UcJX/E3qGvxmpD89X1149Jm2PlS5sCCHLLDduXwkck6D47Bp4FoRHB11I4qR5SBpxR645oDwD6JNytcKcEuDq6wu9WRiPxo0K1Vk3rb1cOsftr2zmp8Ed4GgeURnI6/YhDT+z3erdNxpiasueZlkAeZxTUeydXlCYkHKJi41RC1gTjYkISBpKj8XGRftqxsXPNVgOZy/cCKEZ5nXDk43zo61N+2TrTuBf4uGCH1RTYHem3GBLyXqeiG4eaUUQAym4nc9WozJJtfFVq6NymF9rkJUrjb0Dscgs2gxc7zNVj9ry8x2gdoOamfBaxIxf6s6Irrzjknz5WNWkvsWliNxxUePRvjMEm2qUgHr8NSDazCi3o7OpPHE1RlM+bICYV0HT4+1gkwsaZt1nO2uWInbrWTIPluVGRU9xWlt8Yh1RWV0UpzLSTD9u71v2wSAa8JIXs4XuqaurYDbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sD2KR2o4Km/+JhNNi0ZOIOY9nBaZxrhG3n/FRQwSg26deTtpf05ETNqPGnxq?=
 =?us-ascii?Q?NDNcSULE+GOcb18p1R1SfSiBFxd8QYyWpwTyVgft3HyID2xfOF6sZ6BRA3XU?=
 =?us-ascii?Q?/Bp5OS+P9fWc84nh5NNmEbjyMZAfJ9EAantZrAByQz4poCy/cP5mwc/6sf5a?=
 =?us-ascii?Q?DY0qes/AJ/g1JtDeJ/6zbwj+nj4dZ7YkPpc02kVV03Vo2auM+zxOTzN9rGnI?=
 =?us-ascii?Q?PQqueH+K9JMQk/sxK9CSlmmSTs1BQdVYBeNybpRf+yFGjqI+v4gnJvlex4HS?=
 =?us-ascii?Q?3ppjTXGtXp3etCjXdGDH/kZkCWzm3O5kB17kWVUsmQ/lDJtFk1ogsQi3tE94?=
 =?us-ascii?Q?E5UG0LadixCudB/5wEHIVKCoXg0Vgyl6KIpUEvUiqQ5gIJ+SP5AEWkx50gFf?=
 =?us-ascii?Q?+1bRCSesVbdSveyCdC/bj6EKNKA2/GbLJcDwivp1LNiLyF5GsqaEPJFwdtuM?=
 =?us-ascii?Q?r5ek1aFE/WxvyhoavZoeJveCBZN4RCuMPxv1SHISzZEXld6BMaTYwmX91mc6?=
 =?us-ascii?Q?GmZiwTmxqaP3jU94ReWjkneI+fWLaREvlErgHiSytDdr6wQQbz6KipD5ONWa?=
 =?us-ascii?Q?s4LUR3pjbEszZMQEEJ8Tg9PkC2hWEY4mlUMkra5hqOs19TkNdgO5xaHbuZYi?=
 =?us-ascii?Q?Dn+pI4uchQgqe9odpa66o1fvYrh6duzSK+8w3j/S5XCzKvPiFTQHGS/MJkAB?=
 =?us-ascii?Q?3IyS0L+4B0LQ6KyKaiiRClEJqZqJ4/CvGcOYJZFl/Z247HC6l4n08F8C8Oig?=
 =?us-ascii?Q?e6xlUX7dRoJJkNO+jvAEzDi186XxL6THj9VZtxxoqbwauEWm3FztAo712wS7?=
 =?us-ascii?Q?ist+rphv0T2AoKn+G77UdNXKSC9ZtjrLTKSIRAiC4iCxqV5GXufNsFmOaUUt?=
 =?us-ascii?Q?gf1vgOy4IlMPr/quqNddMv9oSSSmuRe43RTQ+J/mXsPiFAz+cQy2bnFLSQoV?=
 =?us-ascii?Q?Jv/fBaDVb4fsFsQSID6djlfjn2JH6emXZgnsXqyEwBGo/mNvq1tSZr4U11Mf?=
 =?us-ascii?Q?v0vFd/yFSvWHaliBRTOwltklQxa0blQHoxNLRyD3ZFTpPFFv0UQePIqGoy50?=
 =?us-ascii?Q?W/YlHyh/1lasej2zJXehreKd1/TJVG5LgcJZwqT5s5qqr7I6eGF9cIEHMkWk?=
 =?us-ascii?Q?1971C4HdODxQw6ye1wu+jHnxA5+YQ//NCsPpGncLL6HJKTQCrdz48rOUzHuF?=
 =?us-ascii?Q?l/9D13f2J/40pCZqQ2AQyySEwd2H5/PWPX3zXqstm7IYw+yzFH3EocIuy1O6?=
 =?us-ascii?Q?qiFXdvEF71jCFMm6U/mPCBHsw2raTi3i0wox6waRB0MN/CVS1KbR6eEaDK7B?=
 =?us-ascii?Q?InUSs6Wl7NY8Y8JbDC813FB1SsVphvn13DG35KXKMXHTBkZXwkbSht6U9Wka?=
 =?us-ascii?Q?C95jWkFeogM7GzObD0VDWIfzudVuQQdZoCX/4nxlQ5nXcNE2F413iprOphLZ?=
 =?us-ascii?Q?XiD999yO+adbqbC5WzzEqJpIBB1/9gU68bmUMgWaYBmIFdIYmmSzCTxcF67/?=
 =?us-ascii?Q?yTSut3GxfsjdBoQEeXDOO1YDcPEGdo2xPsM8NzeE2+HsTSDMHMqbGtvwUxZk?=
 =?us-ascii?Q?Ex7jNopeljLJiwuP9eUJOdqBESCh39olMolQuBFe2JdFkncKj1sS8O8YcFPh?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aca453a-9c59-40c5-89e5-08dc54dc19d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 19:19:08.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo04oXwBR3ILyUysE82kF6L0GcM/Le+np/7wrIq6a6MWovjY3v/vx6CX71TNh9wvrnmPsJ4qdQ3KY2jR+g7VfCd3d1vr83jp6DFKdnwM5B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

On Tue, Feb 27, 2024 at 05:09:56PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>GuC loading can take longer than it is supposed to for various
>reasons. So add in the code to cope with that and to report it when it
>happens. There are also many different reasons why GuC loading can
>fail, so add in the code for checking for those and for reporting
>issues in a meaningful manner rather than just hitting a timeout and
>saying 'fail: status = %x'.
>
>Also, remove the 'FIXME' comment about an i915 bug that has never been
>applicable to Xe!
>
>v2: Actually report the requested and granted frequencies rather than
>showing granted twice (review feedback from Badal).
>v3: Locally code all the timeout and end condition handling because a
>helper function is not allowed (review feedback from Lucas/Rodrigo).
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 ++-
> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
> drivers/gpu/drm/xe/xe_guc.c             | 226 +++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_mmio.c            |  61 +++++++
> drivers/gpu/drm/xe/xe_mmio.h            |   2 +
> 5 files changed, 274 insertions(+), 43 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>index ec83551bf9c0..d0b5fed6876f 100644
>--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>@@ -7,8 +7,12 @@
> #define _ABI_GUC_ERRORS_ABI_H
>
> enum xe_guc_response_status {
>-	XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>-	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>+	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>+	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>+	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>+	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>+	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>+	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
> };
>
> enum xe_guc_load_status {
>@@ -17,6 +21,9 @@ enum xe_guc_load_status {
> 	XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
> 	XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
> 	XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>+	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
> 	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
> 	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
> 	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>@@ -34,4 +41,19 @@ enum xe_guc_load_status {
> 	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
> };
>
>+enum xe_bootrom_load_status {
>+	XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>+	XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>+	XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>+	XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>+	XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>+	XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>+	XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>+	XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>+	XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>+	XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>+	XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>+	XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>+};
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>index 4e7f809d2b00..2e54c9e6a4fe 100644
>--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>@@ -40,6 +40,8 @@
> #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
> #define   GS_MIA_IN_RESET			REG_BIT(0)
>
>+#define GUC_HEADER_INFO				XE_REG(0xc014)
>+
> #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> #define   GUC_WOPCM_SIZE_MASK			REG_GENMASK(31, 12)
> #define   GUC_WOPCM_SIZE_LOCKED			REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 0d2a2dd13f11..771971110600 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -17,6 +17,7 @@
> #include "xe_device.h"
> #include "xe_force_wake.h"
> #include "xe_gt.h"
>+#include "xe_gt_throttle.h"
> #include "xe_guc_ads.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_hwconfig.h"
>@@ -461,58 +462,201 @@ static int guc_xfer_rsa(struct xe_guc *guc)
> 	return 0;
> }
>
>-static int guc_wait_ucode(struct xe_guc *guc)
>+/*
>+ * Check a previously read GuC status register (GUC_STATUS) looking for
>+ * known terminal states (either completion or failure) of either the
>+ * microkernel status field or the boot ROM status field. Returns +1 for
>+ * successful completion, -1 for failure and 0 for any intermediate state.
>+ */
>+static int guc_load_done(u32 status)
> {
>-	struct xe_device *xe = guc_to_xe(guc);
>-	u32 status;
>-	int ret;
>+	u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>+	u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>+
>+	switch (uk_val) {
>+	case XE_GUC_LOAD_STATUS_READY:
>+		return 1;
>+
>+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>+	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>+	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>+	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>+	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>+	case XE_GUC_LOAD_STATUS_EXCEPTION:
>+	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>+	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>+	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>+		return -1;
>+	}
>+
>+	switch (br_val) {
>+	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>+	case XE_BOOTROM_STATUS_RSA_FAILED:
>+	case XE_BOOTROM_STATUS_PAVPC_FAILED:
>+	case XE_BOOTROM_STATUS_WOPCM_FAILED:
>+	case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>+	case XE_BOOTROM_STATUS_JUMP_FAILED:
>+	case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>+	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>+	case XE_BOOTROM_STATUS_EXCEPTION:
>+	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>+		return -1;
>+	}
>+
>+	return 0;
>+}
>+
>+static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>+{
>+	u32 freq;
>+	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
>+
>+	return ret ? ret : freq;
>+}
>+
>+/*
>+ * Wait for the GuC to start up.
>+ *
>+ * Measurements indicate this should take no more than 20ms (assuming the GT
>+ * clock is at maximum frequency). However, thermal throttling and other issues
>+ * can prevent the clock hitting max and thus making the load take significantly
>+ * longer. Indeed, if the GT is clamped to minimum frequency then the load times
>+ * can be in the seconds range. As, there is a limit on how long an individual

				    ^ that comma seems misplaced

>+ * usleep_range() can wait for, the wait is wrapped in a loop. The loop count
>+ * is increased for debug builds so that problems can be detected and analysed.
>+ * For release builds, the timeout is kept short so that user's don't wait
>+ * forever to find out there is a problem. In either case, if the load took longer
>+ * than is reasonable even with some 'sensible' throttling, then flag a warning
>+ * because something is not right.
>+ *
>+ * Note that the only reason an end user should hit the timeout is in case of
>+ * extreme thermal throttling. And a system that is that hot during boot is
>+ * probably dead anyway!
>+ */
>+#if defined(CONFIG_DRM_XE_DEBUG)
>+#define GUC_LOAD_RETRY_LIMIT	20
>+#else
>+#define GUC_LOAD_RETRY_LIMIT	3
>+#endif

just sent a comment on this reasoning in the previous version.
Continuing from here.

>+#define GUC_LOAD_TIME_WARN      200

let's also add the unit, _MSEC

Also, comment above says 20, but here we warn on 200. Is that 10x
difference a typo or intended?

>
>+static int guc_wait_ucode(struct xe_guc *guc)
>+{
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>+	ktime_t before, after, delta;
>+	int load_done;
>+	u32 status = 0;
>+	int ret, count;
>+	u64 delta_ms;
>+	u32 before_freq;
>+
>+	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>+	before = ktime_get();
> 	/*
>-	 * Wait for the GuC to start up.
>-	 * NB: Docs recommend not using the interrupt for completion.
>-	 * Measurements indicate this should take no more than 20ms
>-	 * (assuming the GT clock is at maximum frequency). So, a
>-	 * timeout here indicates that the GuC has failed and is unusable.
>-	 * (Higher levels of the driver may decide to reset the GuC and
>-	 * attempt the ucode load again if this happens.)
>-	 *
>-	 * FIXME: There is a known (but exceedingly unlikely) race condition
>-	 * where the asynchronous frequency management code could reduce
>-	 * the GT clock while a GuC reload is in progress (during a full
>-	 * GT reset). A fix is in progress but there are complex locking
>-	 * issues to be resolved. In the meantime bump the timeout to
>-	 * 200ms. Even at slowest clock, this should be sufficient. And
>-	 * in the working case, a larger timeout makes no difference.
>+	 * Note, can't use any kind of timing information from the call to xe_mmio_wait.
>+	 * It could return a thousand intermediate stages at random times. Instead, must
>+	 * manually track the total time taken and locally implement the timeout.

that's something we may improve in future with a variant with a better
variant of this function to be used on loops.

> 	 */
>-	ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>-			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>-			     200000, &status, false);
>+	do {
>+		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
>
>-	if (ret) {
>-		struct drm_device *drm = &xe->drm;
>-
>-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
>-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
>-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
>-			 REG_FIELD_GET(GS_MIA_MASK, status),
>-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>-
>-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>-			drm_info(drm, "GuC firmware signature verification failed\n");
>+		/*
>+		 * Wait for any change (intermediate or terminal) in the status register.
>+		 * Note, the return value is a don't care. The only failure code is timeout
>+		 * but the timeouts need to be accumulated over all the intermediate partial
>+		 * timeouts rather than allowing a huge timeout each time. So basically, need
>+		 * to treat a timeout no different to a value change.
>+		 */
>+		xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
>+				   last_status, 1000 * 1000, &status, false);

if I understood correctly the meaning of this function, it would better
be called xe_mmio_wait32_mask() or xe_mmio_wait32_field()?

i.e. you provide the mask (GS_UKERNEL_MASK | GS_BOOTROM_MASK)
and the previous register value and you wait for a change
in that field of the register. Is that the correct meaning of the
function?

ugh... this bool value to show atomic or otherwise shouldn't be there
(but it's pre-existent issue).

Lucas De Marchi
