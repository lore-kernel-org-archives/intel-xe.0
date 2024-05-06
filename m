Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A508EC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 16:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C5010FACE;
	Mon,  6 May 2024 16:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E62Kxx7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C674010FACE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715014506; x=1746550506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c4HqvfTSovDXcrK1k02hw7Th0Ch9TDvtRwQ6kSECCwU=;
 b=E62Kxx7ca46gQCcmsuUJGWMTpjyK1G/xyHfgCe6DlOTwI4t+h0db8wSG
 bS6B/IFuWMyDErQNRc0uAAwttsa+aZmVd9e+0Xo1YE0TD/Ilc5aCnPzfz
 Z9op+fwfWgdIwXo1v0qL3giIqhFGiNN7fV2Cx6eQ9rTuoLKq1t74qhUd1
 8AOxc8hjgKfsZ/CbF0Y6ac60p5PLo4qzIxpFjEWPMgRzFcvhfyp6Az6Z9
 6RijrWxunD7k2qs2N5kUFTdAgSzH2buTD9A3U0acCOFCCyIWLqMisbxvv
 qWaWUybc34WtdbUTzlyPXhHfe7b6M6Aekq3fiy96bsaVn5uxfKk7KmXiy Q==;
X-CSE-ConnectionGUID: qHmXCCC4TAy84jlqGmA1aQ==
X-CSE-MsgGUID: Cc7NDgliQAedFLQUAGrHTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10651078"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10651078"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 09:55:06 -0700
X-CSE-ConnectionGUID: dxDTXKVURxOTdJrYdRu4RA==
X-CSE-MsgGUID: WUA51lkKQ++vhQzW2xDTdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32716652"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 09:55:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 09:55:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 09:55:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 09:55:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 09:55:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8flpYeNzpZNhiVHofvVc90C8UfOSUhhMWeBsbLbdKFECCn2uruNrW3m0XlI34x+tSKn6JqiT6OQXNoRloEkgohCwr91LJ8oZFGDgHLzGlu2VtcOiPa5ISGxXT5gqbuFlMQK/3GYu1vxAvWljPDOdkyD3/7FtYWhcyzbLh9YykUs++xldvs6qis6+BCPOWqFep8RQHGURnoXWS7uDB9hoie40IcENIlS9bbcv5lwp7URkxHih/D8LzmrnfUxI+93bFvek2gsK393R/quSGO6cTJc9xnpoySKMLx5+0mcDncczneG/tMFmM1Q095dctGHBQHOw+XnE9xfcDvKAN1AgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QhsevugjAL2MAOvaH0TXY3vnsUtraG5IxZljhP6lRA=;
 b=X2I0N86ZBQ6W74m42vUBLRU2tN7l1zEZ8lGbQBnEHXoe3wWpspUD1C+7nbJFEd09DUuhxLIwYuREU/l32mQ8S4gPPW6Z+nNgjRdNy5RoigYYobw1YmeEnFg3rWLht2DrSDMDShry0ONntOQ6Z4OX/3hvwY1PLTeuXfrnGIEQANq//wpmPPecV4dbNWpd02pesQ6lYOk3AD6mH/ynYGDBlVCVYtMtC2S+LgSC93Zqgrue0AeZfYm+EZT0B0GGjZjjya4v58gC77ggMNLqM665Qpho5QKKV60I+qrSSD4mZxBpP+oKnHUtjMR9xNEzDE4JBD4pbYS1dp/1TLc8Kylhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 16:55:02 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 16:55:02 +0000
Date: Mon, 6 May 2024 09:55:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Dump Indirect Ring State registers
Message-ID: <ZjkLZOTi9vcvR6Y/@nvishwa1-DESK>
References: <20240504233503.16095-1-niranjana.vishwanathapura@intel.com>
 <20240504233503.16095-4-niranjana.vishwanathapura@intel.com>
 <53a3518a-01ed-41a1-bdd1-90ff367522b6@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <53a3518a-01ed-41a1-bdd1-90ff367522b6@intel.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: d9873ee0-65b6-4e16-ec2e-08dc6ded4596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RXFuIpHkX8X6iJmtMj4nxqeSehCEFEm77+P0xfAPj41VcHFTKtgd0ha7HZsU?=
 =?us-ascii?Q?IJ7MtdAdZu5c2FqapjlgQ24fGqqn5lJLFz00XF0VQqxcTf+4p949lajFIjkn?=
 =?us-ascii?Q?yGOkui0RYgg/Gd17taxhz7hNhCTS8O7nzrA0YtAgAnPK9jk1awFc3UQn34PY?=
 =?us-ascii?Q?UGJlFaHJMpTHNKroMRwz5Tg0S3+ED3wgUaOGZyRbx4ZWONe5mEdjgwjvF3OK?=
 =?us-ascii?Q?pdxSpbAz+0Ku36vk3x9RULqn5fxEHTs8B72y/CWpwVRlJGcWjqOmOj9v2DpZ?=
 =?us-ascii?Q?LObb2RVPQbdu5RU9zDiXkgVvVoHI1pJBkEOAPjcl4MTK9gB39C6KWWwIKFzi?=
 =?us-ascii?Q?eY9TsSxMJTRm+kKvv6Y1dxkGfd/kB2Fdtfc+U+qNCkvOHsxiM8v7IgrwUwcX?=
 =?us-ascii?Q?/wKk3Ig4steDuZ8sgOVP1iK2J6AhTbj0KW+6mmg3g4dh8EFsfphl5Nt+rIPO?=
 =?us-ascii?Q?yL3QqXJy6k8sGMVTbfutvJEgctOTBrZH8VBFVN51u3/mTdJup49oeAI4mLnh?=
 =?us-ascii?Q?JuhJWNlx/kikI/qgLaVwDdaBBqH1HY5Aj3VlVPIrQibPMglaaM6GyyZOm5il?=
 =?us-ascii?Q?bA7dfGyIhdqrYy1M9+xzrNl74FytwA1wNGRFWJeRJhpZ7y6URYfPO/Hukgkj?=
 =?us-ascii?Q?2Qxqz2J3wwND0Rf02gy3T2H0miShgIxvVNx3ew/ljlSxmpHZdPYRS0k31qAf?=
 =?us-ascii?Q?gpy5skrob7w9s9MGa7mYOx/n2KMgt8r16pZ+L1XruAqUQVZ+ZKdrYDFty+yS?=
 =?us-ascii?Q?tfX+Mppulevr7jFR+rj70hv+U0t2yiETqJGr/XaRoi5PZ1jn+KD7KMlzkrhE?=
 =?us-ascii?Q?pFqwDIK1PG85vER/OGcxIdAVh69SpoNk+9V8nzCLr7yFYuM6PQWFroNPv8US?=
 =?us-ascii?Q?ft6sDmErRhlxDb3G3eVVTF88w8JDNnO2cHErQHabAuxZxeJXagqWUWurSww/?=
 =?us-ascii?Q?W/Pco+fXMaos54rzBKhAU5GmIgK6ZA/4XgV6oBD5/TtnHiPBzR/JGcY5yvZV?=
 =?us-ascii?Q?vR8xWKcADZQR2SzMrcmyUUcjlLfPupGSJp8ejlXqqZ3OiVvmKawEN2NUiXgv?=
 =?us-ascii?Q?Gxg634GL/F5rQi/206lOw/47BEdt0HxsU2K10hZbUUz1xY0liEv+OB8siyTA?=
 =?us-ascii?Q?N2a09rX5AmAdM5Ua2TqpHhX5sb93d+h93VIq5XowcSGr1LjfFLf6iLAPezq8?=
 =?us-ascii?Q?GkLD52IwKGoWfBmpJlnjplZAmdG8uXJTKcAwgsqpgPowsLoxjrB3ED/S3sC3?=
 =?us-ascii?Q?C/nZdij+ZObpxNe8Yfjg9Rhq8HIrDt9X/fbo3bVWxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wncLjHhulj2yryQZmeHi0kaNpDGVZ77Th2mVnvaGTu2Rc8LrN6OhsIHSKOnh?=
 =?us-ascii?Q?Dbi2LmSJa+kqgwaIguskiBeTJn6Wq3yBwf3tfVrShXv+bfn1MvRKshEyXYOD?=
 =?us-ascii?Q?HWYZLzmkjKIjflSQPg8JIEKLW1LopCu7VCekJUn6JazD2NK5rveXYnjoHD8e?=
 =?us-ascii?Q?zEoQAnS4BndRywH0tjTKwxUqnDMXSoOVFwRIg50/a1cS9d15xKkMzdS/eIQU?=
 =?us-ascii?Q?bcRNqXnFW92m2jsMkOMiCgNrEZo6CacElwp3UO85SBqHKGDKIwQadsjJtByu?=
 =?us-ascii?Q?1SFPOQ6ZpleJpU6UMvLEQvFAMLFRs1N3Sh7wtuoK2U/GmqXRlmc8qb9x/Z9t?=
 =?us-ascii?Q?UDmD1Ge46FQ5yepZ9Xc/RE8xBBKEWDlx8ODnYUD7glIVNGlB5L2A611lW8N4?=
 =?us-ascii?Q?B/vURiaeCb+6qBlvxpqhV4jbEoDoJNrV270jHHzWQIZSEVSuGVzeqj6jFHnO?=
 =?us-ascii?Q?s/tJ0YOwO8u/FMGtWOqCk0wTU9Js7rwljI4OJBdTGFkq/SafF3iOHfkaUUNP?=
 =?us-ascii?Q?w8RaaVY/BR+LmYzdwE93kjomkMMPnq544NGesaHX3b0T6Hf3+jRUuaniAn6a?=
 =?us-ascii?Q?XC1xrUZVhzdTfDGhyDRyNmYyi1yHALjKrsqmbFWViLKPSkZ1W6hxaYiKZy33?=
 =?us-ascii?Q?9i5oYS+5d2sEx+6gyoDOgR/4CC89Su/c+7r3OAvQX+WeQp5ESfpdwKuomPSi?=
 =?us-ascii?Q?FsUv2ZF0IpKrfkAFI8W0N6abNPNn5kxpsM7V7WAtnrDykPws35DgeQRFNBDx?=
 =?us-ascii?Q?cyQr4EMlwjds8H+Lo7Rwa4/G38BxMg7t499EEyz2dHVqJsMpYqxwbiZoFX1q?=
 =?us-ascii?Q?M71rnL/Gd2UNCF08HyDCJYyZh+X759wNJ6AN6lkDYWmLhqlgYWqmZU3ZO/Ng?=
 =?us-ascii?Q?E4SFztxBX1hOXu4oPmzQKEDIvJX3YfkU+RODgiG0A5+mk2Vqjrm9wiagkOp+?=
 =?us-ascii?Q?pHrMmU9M2oGPFA3jz0K0dadTzc/uKeL0iBVTQ1azOLalkBPEr7sEcdaBflia?=
 =?us-ascii?Q?9Y4omyA+4WJ/21db6/BgDf2uSp0s/BAFe46IVsg+YkY2Cg1UMXUay1RI53IN?=
 =?us-ascii?Q?pNpI0uLaxiuLEunusfJ7U/u0P+YlSibShT+AIAhi72gM1K72W+vTROBWH7RI?=
 =?us-ascii?Q?zYY9GJUNdLujRc/eYNCmNp1HFkJWBUsJmTPf8JbM62FhGkBJUhdDMDV8mE6n?=
 =?us-ascii?Q?7i+CX7kzH6jkiWv73JhXw4b/fwE1SZvkD2LygAfE6EdXT/lNqFANFZTeSZ17?=
 =?us-ascii?Q?0FvHNwneUw7wuF/26U6SIpHaShVaUAnvyQcBxicFW3GdiXGG15PthMoEfHRP?=
 =?us-ascii?Q?EVip5lezMAQbVIdI9SDRLtGPd9FAGkSQlBYcIidloG0j2K3BP4LMgrDekAWa?=
 =?us-ascii?Q?olj3O71NurBgnpe0N0LAXNXeD3PKkF+MViYJy0jxvZrlKt3fewriVcZLcn4q?=
 =?us-ascii?Q?LuSjcg4PtdZFcSdnDd8mPtuuAEhVNYsL0U06kOE/n8+saHNb6UlvkHuSn6Ir?=
 =?us-ascii?Q?IwxpT/8y6qK+xoB6oTVOtoQLSkwknollLKPvY2b+UNxxwrzqnFFt3yGX06fM?=
 =?us-ascii?Q?RFoOMuiPWdYgrBO1+rDtu6Uz2ufc4GOOaQbXik9VuW43Tb1hIxAx5r/S7sZe?=
 =?us-ascii?Q?+tDkKE2xf0zWuXl767E4sdw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9873ee0-65b6-4e16-ec2e-08dc6ded4596
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 16:55:02.3522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IQ/0aaLknrJcPKRP8+Cc/4lzHCAlg1jgZY3bTcdzER7uFn3/3OI41YERkgU30K743xYA8Jkc80FnQo6apxRpu/TQdcZWnMxIJtniv+6wFToeBcHiJ2F7at4Q7hbQws1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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

On Mon, May 06, 2024 at 10:32:51AM +0530, Ghimiray, Himal Prasad wrote:
>
>On 05-05-2024 05:05, Niranjana Vishwanathapura wrote:
>>Dump INDIRECT_RING_STATE and RING_START_UDW registers.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++++
>>  drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  4 ++++
>>  3 files changed, 19 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>index 260a44f46f7e..263ffc7bc2ef 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>>@@ -55,6 +55,8 @@
>>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>  #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>>+#define RING_START_UDW(base)			XE_REG((base) + 0x48)
>>+
>>  #define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
>>  #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
>>  #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>>@@ -110,6 +112,8 @@
>>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>>  #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
>>+#define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
>>+
>
>same as previous patch.

Ok, will add bspec reference in commit text.

>
>
>>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>index ec69803152a2..45f582a7caaa 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>@@ -908,6 +908,13 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>  	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
>>  	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe, RING_HWS_PGA(0));
>>  	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
>>+	if (xe_gt_has_indirect_ring_state(hwe->gt)) {
>>+		snapshot->reg.indirect_ring_state =
>>+			hw_engine_mmio_read32(hwe, INDIRECT_RING_STATE(0));
>>+		snapshot->reg.ring_start_udw =
>>+			hw_engine_mmio_read32(hwe, RING_START_UDW(0));
>>+	}
>>+
>>  	snapshot->reg.ring_head =
>>  		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
>>  	snapshot->reg.ring_tail =
>>@@ -997,6 +1004,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS: 0x%016llx\n",
>>  		   snapshot->reg.ring_execlist_sq_contents);
>>  	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
>>+	drm_printf(p, "\tRING_START_UDW: 0x%08x\n",
>>+		   snapshot->reg.ring_start_udw);
>>  	drm_printf(p, "\tRING_HEAD: 0x%08x\n", snapshot->reg.ring_head);
>>  	drm_printf(p, "\tRING_TAIL: 0x%08x\n", snapshot->reg.ring_tail);
>>  	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
>>@@ -1010,6 +1019,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>  	drm_printf(p, "\tACTHD: 0x%016llx\n", snapshot->reg.ring_acthd);
>>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>>+	drm_printf(p, "\tINDIRECT_RING_STATE: 0x%08x\n",
>>+		   snapshot->reg.indirect_ring_state);
>>  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
>>  	xe_hw_engine_snapshot_instdone_print(snapshot, p);
>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>index 9f9755e31b9f..5f4b67acba99 100644
>>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>@@ -189,6 +189,8 @@ struct xe_hw_engine_snapshot {
>>  		u32 ring_hws_pga;
>>  		/** @reg.ring_start: RING_START */
>>  		u32 ring_start;
>>+		/** @reg.ring_start_udw: RING_START_UDW */
>>+		u32 ring_start_udw;
>>  		/** @reg.ring_head: RING_HEAD */
>>  		u32 ring_head;
>>  		/** @reg.ring_tail: RING_TAIL */
>>@@ -207,6 +209,8 @@ struct xe_hw_engine_snapshot {
>>  		u32 ring_emr;
>>  		/** @reg.ring_eir: RING_EIR */
>>  		u32 ring_eir;
>>+		/** @reg.indirect_ring_state: INDIRECT_RING_STATE */
>>+		u32 indirect_ring_state;
>>  		/** @reg.ipehr: IPEHR */
>>  		u32 ipehr;
>>  		/** @reg.rcu_mode: RCU_MODE */
