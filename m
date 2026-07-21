Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92495C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000410E3CA;
	Tue, 21 Jul 2026 20:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZjfiKx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101110E3CA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 20:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784666620; x=1816202620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PcuQJImechqotT3nT2hk5J85066MzVk+8IINumaqpuk=;
 b=VZjfiKx4B2hSBrjnuUDhJeDGR2sBUEOdqBBGhlUSsHrfSnuAwohrUIFj
 fLhmeGBgPzvhpxoflyDHdVKmNN0CutaR/H75i7Z+uP2pL3T4r04WPrHI/
 WGgCW1XOi2r8Nl9c54uLq+b5zuZSZHbQsQlRflwrtNMpZRsMr04Q32vHx
 uroApa3roHPn9HfnDl9NqMh0hp3bgiGzJMQvXcPmUN/+Cxgk1yhKyrDow
 fv8oJ3Eu7hq1OM+vGa47hSJq5yGs6CZPdrPmkoJWUKhQQy0fKOO80iJ3g
 YUtS9Q67yKt7CifPePMHyP9KaygmWjuBibJhoAmJgX/2NL6galyTbtlOj A==;
X-CSE-ConnectionGUID: pTQUeUX5Ru+SuvfblveOtg==
X-CSE-MsgGUID: ny8gUbx+SmSpVPSfjQvceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84260617"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84260617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:43:39 -0700
X-CSE-ConnectionGUID: 7JCoDVP7QSawMk57np4Gug==
X-CSE-MsgGUID: 84T7Xd0FQU6s2q1Y2ZM7Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="287901447"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:43:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 13:43:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 13:43:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 13:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttV+Z00Tk26MiULyXzzQQ0UaDSC/1leZiSIwZmyLNGxjKYYKOFCcrGx3QK8RtfMF32dPnnGjuXpCX0CBudJGQdU02N5C2fetHBCeU/5Fasn/CxjpKF90jXCA2XokS4bLTk/o6tprcqlYuPUnDvtT94u76zUbCcR9W3IQPhdXoOIK+d8HV9w+j9KsT4c+gtGHqA/cx85dzV53R6Ui4a+98YJjR/DrEfpjM8mZTkNDM6UwJOkunM0nlX7HeHF35N/zR2dd3H9KWlMfiM8pGGA2idwPshkmHiKB44IuZwb3xyvd0l1HJGR/uhTb0xmjSb6mxSOmm5u66NkvnindsFLy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTd+0pB6XUmfwJ6SKNd54ijJWGH1pZ5PF9YQLMpkTuM=;
 b=LIonNARfw9dRD9KW557wdGgATFG0HkmmIbSsGctLt89DkHo01oCG+LXs8yPawcybVknBNZwekfBtcM6rAtdN469+lqcrk1riHj8j43Tl+1+YiR3TMUgmEtNNFOR6LeMf7qQFhRWkDncl4jGvCO7df4DhobR7wdxYQQ8jw6hNRMZjJpCmcwKvWTgNChNvlqpp0d7Pou50Aw8b0SXFjR6EuHbntO6hPybmn4FVdzrnXV2GUXIOqdOgdrpGzW0FgWeonpImVfXbuMlyz2xKDHmYKFpqsDzgtgi/Mm961zLxZ8qaTNTCmQMcWRZ1XQjfGnZ15wqJLfL7xCiTWHbBnJ0YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:43:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:43:35 +0000
Date: Tue, 21 Jul 2026 13:43:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <mohamed.mansoor.v@intel.com>,
 <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Detect oversized sysctrl mailbox
 responses
Message-ID: <al/Z9MTRCLTrAPqQ@soc-5CG1426VCC.clients.intel.com>
References: <20260717082657.2466495-2-anoop.c.vijay@intel.com>
 <al+oUKNAoxkKtSWM@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <al+oUKNAoxkKtSWM@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: a24f6f6c-f6c8-4d94-1775-08dee768bc2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 1pUDPLL5Ir/Qsl7ikCdPJDIIgYYiy/V6mPDTmYWKGRHBU2/xhz5EIBAcHVeevsP1rI+dcG04BdisGB9M75/816ocbQDjqFIVf9qfA4xxwVwfKhYwyW263m+8lx/LRZ17kXFZ+nMAxApcWBieOKwhsqzwWTaPWdH4z3dY8VIsJqGo9ma6Pgb1FjAub0CNV141dSicsov/OOesshQ769vkLDZe1Fx9dzdtr6b7AcncfWZb97gvE5CFZDCmoqPkiE9ZfqNCyvSj4Puq8S0F3Amv4j+ZI1lgLq7ZKyurLdHXTk6MtLGmvjMgTtLXf4mK5XCQqQpeSZK1XJY+vBw4nHRs03URSpkVWQBTc4RLazXPzQeyEaHMRAlz6o6nZwfUY8iaUokuhom18Uf/0OdABpyHk27jGOTiAMWCV1u9/Bdds75oXMfRny9sjfytX53vChwqZQqbAtl7SCQzSu2rJkPlVAp9R3ye59zDFIKpGBPcYBm4P52zJaM13YmIrQYw5vt/pdcQv3EKk2ujWsxuqAL0MqfLNMmRYpZpGKpD06TcuUJet9VvtD5FZbrqxHclq1/Uk5Ewtgt4rMg8vDkXHPFPiS37AOgqoiMbb6+ep/snJ7og5DWODxGLpIOOPuj9plsE16oHsG3ldSv3Xb1fMOj3n5ir+uBoxDL2MMo47YaKoo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnN4KzV4RFIvNlJrMlVKZEFnTGJKdGh1SW80cDliVUx4Qk9UUzdwdk5LajQ0?=
 =?utf-8?B?TTJhTXFwcDN0SW9QVFgzcW4wWXNZcklzVURGZElRQ1ZqVjQwUEtjOEg4T0ZJ?=
 =?utf-8?B?UDkxZ2JiUllnUGtLVFlmQUxISFRGTk80amlQVkFUMXE1NWVrRUk2Y2J5Vjl5?=
 =?utf-8?B?aUtDb0ROMVYxby85M0wvWXg5Z2JHbGdweGc2TllNYisyUGM2YjFSZ2tleWJl?=
 =?utf-8?B?c2JxZytOeDZId1N6RHllcHNTd2pRdXpMZ05MMWZuZ2MvR2dZNFZGeUNpb1VV?=
 =?utf-8?B?OEZDTWFFb3RtMEdKTWZOUkJWMER0REJPb0ZDZmtxckRpSkhZR0ExMFdEeDlr?=
 =?utf-8?B?UUNUVmEvOVBxWnVqVGtMOVlwbnFwcDJ1ZHRZajNYaHNHMXRlRkpzTXQxT3V0?=
 =?utf-8?B?RGlFVVBwY3FrT1BUcnp5Ui9hdXREdms3blliOW9lNHJjYi9DdU5VM3VzNnlX?=
 =?utf-8?B?cm1kbm1mNEltNFl5N01yTkNhL29zMTlJR1p0YXRWSEhDWUZJaFMwTFBLV0o5?=
 =?utf-8?B?cEE3V1lMTU1ZYkx2ZTJRQktyYThsdkpuK2xEbllGUjFFQlFEc01jOWZFU3dR?=
 =?utf-8?B?NUptQm5DRkJwMjEzb3BxNW5sckdGTG1lQlRXaXRqTFY4Y1U0L0dIV1JwUWpD?=
 =?utf-8?B?eEN3M095REhkWTlKSGhzM2ZGZXhmOGU3OEtyR0Q5dzEzeUE0RHg0bFdRdmc2?=
 =?utf-8?B?aTdCTFZuZGsxQWY2aTRuTS8wR0wvQkkvWVE3MW9DZCtreEhSNGUwY1JtekdQ?=
 =?utf-8?B?R09DcFhIc3VtakNqVmluanpoWjk4ZGRyMDVzQWtBK2ZiQ0VmSnNheGk4ZTFo?=
 =?utf-8?B?bW1yL1FWZmhUT3dPb0hITDhidDBkWVBINzlHbysxTVZxK0NFOGNYR3NkMmZB?=
 =?utf-8?B?TThYb2JCblNSQ3BUbWVIVHg5clF4bkZXVVRvT09kM0xHbzFNR0llelJkS09X?=
 =?utf-8?B?VWdXUVdxZUFYYXVlbGRQNUFVcHo2VEthSG9CcGFPWlJPU0taOGkrb0syZVox?=
 =?utf-8?B?K3NsdHhCd04vSUI5c0laUlE4c1FaS0ZzSG5ZUEZIVTFmWnlySTVmejIyWG40?=
 =?utf-8?B?Z2FORzdyRng1VlBwdkpWWkprTG1jSVJoSGs1K2ZWb09BVW8rSTNXekxIZUY3?=
 =?utf-8?B?UCtxd3pIVzFFV2srL0ZBNnY4RjB1T3FjMzgxQ2xxbTlzWjcyTHpla3VjNnl5?=
 =?utf-8?B?SXI4ckxadm1HYll3RXZ0L0FHeFJtZjFxMStyUmR3YVJ3VHU1Z2g3M01xWngw?=
 =?utf-8?B?ckI4UnZsNzRMc3RDZDJTeHI0WWR3K2oyREptSXNLSm9DUGdFQlFlWHF5cmNp?=
 =?utf-8?B?YnpSQVljbUtPYmkyVytXaTRBUE9jcDRqNlYrby9Jd1BsYkxKS0VZTzZTM2tN?=
 =?utf-8?B?TXQ5SkpBTlVqb09lVzRqYUdudmRQQ2w0d2NIcG1NSTJYVWlwNmtHQUlqSjlD?=
 =?utf-8?B?ZG02NUFwK1BSaG05a2pXTDJWdU14V2JkVUEwcXF6V21XVk1rK0owWGE0d3Fw?=
 =?utf-8?B?NTRNZy9mOU1PcFRHU1RZKzFYNjg4Uk92bFhjS2pOa1lqQzFBUnYxRm9rRTN5?=
 =?utf-8?B?SVQrRjNVZ0N2MFpEU2wxbng0VE1ycEZjS09mMThrUDVncVFveW5ZL3hlSkdG?=
 =?utf-8?B?bTNVT3pEaThhUmpHbUVacGp4U2dPcWJ4MzdrR3BSUzBpMGZIaisxM0hjNzZM?=
 =?utf-8?B?YzhSTmFjNHF3dUllMVpjdHppSC8yMUZwTjB4L0dlWEpJWnIzTWt6ZmdqMjdU?=
 =?utf-8?B?OVBFZEdwU2lnb3lIUUxJWWFXcWVvZlBLc2hiVVp6eEdXZVJ3OTBhdFBEbjVM?=
 =?utf-8?B?c2VZditsQVl2eXRSQlBtVEgzTFJGZFozL29WOFMvbDVXY2RxRm5lbWpYZXRP?=
 =?utf-8?B?SDhIYnRoNmdiSWQ1MkM3MkIvRmlhYU5PWndXODAyM3FCWHo0VktQbmJ5UTFa?=
 =?utf-8?B?Wi8wY0dZQ2krU0NFemtaOVhpZE1JZXNVM2g5RGlNSTFhbFJZU0Q4eXdiZGIy?=
 =?utf-8?B?NUhlbmZ5a0tHQUNoLzRicjNNcGJHRXBhNlIweVhic3NuV09LbENTZkpnSlZN?=
 =?utf-8?B?TExyNGxBdk1BcXp5bHVKU041UEFKaFdncS9rSjRxcHB6eEI3aUlJSU5PYjEw?=
 =?utf-8?B?S04vUWMwc2RqUjd2b2lSUXZxQTR3ajd3eUNFN0ZNWURyT3d1ckYrUDM2WGVy?=
 =?utf-8?B?YkRnSjkvYWJ0NTBEOUFCZm9pWExEVElZRUNyR3hIclZ3Szl5dC9XMHpDOWZx?=
 =?utf-8?B?b0hLbjNxMHI5ZVJFSFc0ZklxTXl2ZEpUZENJUW42a0VBeG15VDBETDdRVVVw?=
 =?utf-8?B?OFExeTdOZ0puWllpMEVwdmtQQ2lpVEpXNVpWbUsrVXVSY1ZPVGpIdHpBdFAw?=
 =?utf-8?Q?wQesSvrCoBAYiSEMtTRGSLY6AF66am4T03+OZ?=
X-Exchange-RoutingPolicyChecked: TJBsdAhsfpzNwruSu43+U8byv+lwwb+NyR+3/zqMhgsO8m96S4p9NUpYws/biCchxy5567/ty8z+gx40QRqFm8aUmW4dbWrdElTG24q2K4B65EAIqHPuBkDJ8ugEwAdPjC2w1WH9O3s43QJCuWN5mbR8bMOiX+XhOhAeX/ioBOxwILZSHOOrqbiE6OoY3PwFl/KFUmXN8Du4p60MaikzAqSC68Izk8mQv4S8yP1szbN0eSlVDXH8fGL56Q13iz+t1EAYVQGtnqE35kceBB474/aeJ708VtbJ0DQm1R9mfbBf+Lv09uuoHerD1CVTb6JGdkVSqB1UouMkriEMLoYDUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a24f6f6c-f6c8-4d94-1775-08dee768bc2b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:43:35.5011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5oCRQN3yPM6oVrx6xITgn4DkBquYn0n78o6GyYRBI3aJetmi427qkRVlOc7u3Z+hQtXDLsZ2qkS2Rl7VvhjOtrJk6I1q9CV3lDQ/aM0ZJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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

On Tue, Jul 21, 2026 at 10:11:44AM -0700, Umesh Nerlige Ramappa wrote:
>On Fri, Jul 17, 2026 at 01:26:58AM -0700, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>sysctrl_receive_frames() currently returns success once the caller's
>>buffer is filled, even if the firmware has additional response frames
>>pending. This can silently truncate firmware responses larger than the
>>requested response buffer.
>>
>>Add a check to detect this condition and return -EMSGSIZE.
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 5 +++++
>>1 file changed, 5 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>index e13eebaac1d0..37ed05ac0236 100644
>>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>@@ -244,6 +244,11 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>		out += frame_size;
>>	}
>>
>>+	if (!done) {
>>+		xe_err(xe, "sysctrl: Firmware response exceeds expected size\n");
>>+		return -EMSGSIZE;
>>+	}
>
>nit: s/Firmware response/Response/ since most log messages here assume 
>you are dealing with firmware.
>
>What about the case where FW returns less than expected data? Say user 
>asks for 10 frames, but FW returned only 3. Since 
>sysctrl_process_frame only deals with SYSCTRL_MB_CTRL, it could set 
>done to true after processing 3 frames. The value of remain when you 
>exit the while loop in sysctrl_receive_frames() might be zero in this 

correction: remain may be non-zero when you exit the while loop.

>case.
>
>Regards,
>Umesh
>
>
>>+
>>	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>>
>>	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>-- 
>>2.43.0
>>
